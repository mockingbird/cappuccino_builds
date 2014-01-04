@STATIC;1.0;i;13;CPImageView.ji;8;CPView.jt;16378;


objj_executeFile("CPImageView.j", YES);
objj_executeFile("CPView.j", YES);


var _CPWindowViewResizeIndicatorImage = nil;

{var the_class = objj_allocateClassPair(CPView, "_CPWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_styleMask"), new objj_ivar("_resizeIndicator"), new objj_ivar("_resizeIndicatorOffset"), new objj_ivar("_toolbarView"), new objj_ivar("_toolbarOffset"), new objj_ivar("_resizeFrame"), new objj_ivar("_mouseDraggedPoint"), new objj_ivar("_cachedScreenFrame"), new objj_ivar("_sheetShadowView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect);
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect);
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "initWithFrame:", aFrame);

    if (self)
    {
        _styleMask = aStyleMask;
        _resizeIndicatorOffset = CGSizeMakeZero();
        _toolbarOffset = CGSizeMakeZero();
    }

    return self;
}
},["id","CPRect","unsigned"]), new objj_method(sel_getUid("setDocumentEdited:"), function $_CPWindowView__setDocumentEdited_(self, _cmd, isEdited)
{ with(self)
{
}
},["void","BOOL"]), new objj_method(sel_getUid("setTitle:"), function $_CPWindowView__setTitle_(self, _cmd, aTitle)
{ with(self)
{
}
},["void","CPString"]), new objj_method(sel_getUid("acceptsFirstMouse:"), function $_CPWindowView__acceptsFirstMouse_(self, _cmd, anEvent)
{ with(self)
{
    return YES;
}
},["BOOL","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $_CPWindowView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window");

    if ((_styleMask & CPResizableWindowMask) && _resizeIndicator)
    {

        var frame = objj_msgSend(_resizeIndicator, "frame");

        if (CGRectContainsPoint(frame, objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
            return objj_msgSend(self, "trackResizeWithEvent:", anEvent);
    }

    if (objj_msgSend(theWindow, "isMovable") && objj_msgSend(theWindow, "isMovableByWindowBackground"))
        objj_msgSend(self, "trackMoveWithEvent:", anEvent);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "mouseDown:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("trackResizeWithEvent:"), function $_CPWindowView__trackResizeWithEvent_(self, _cmd, anEvent)
{ with(self)
{
    var location = objj_msgSend(anEvent, "locationInWindow"),
        type = objj_msgSend(anEvent, "type");

    if (type === CPLeftMouseUp)
        return;

    var theWindow = objj_msgSend(self, "window");

    if (type === CPLeftMouseDown)
    {
        var frame = objj_msgSend(theWindow, "frame");

        _resizeFrame = CGRectMake(location.x, location.y, CGRectGetWidth(frame), CGRectGetHeight(frame));
    }

    else if (type === CPLeftMouseDragged)
    {
        var newSize = CGSizeMake(CGRectGetWidth(_resizeFrame) + location.x - CGRectGetMinX(_resizeFrame), CGRectGetHeight(_resizeFrame) + location.y - CGRectGetMinY(_resizeFrame));

        if (theWindow._isSheet && theWindow._parentView && (theWindow._frame.size.width !== newSize.width))
            objj_msgSend(theWindow._parentView, "_setAttachedSheetFrameOrigin");

        objj_msgSend(theWindow, "setFrameSize:", newSize);
    }

    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackResizeWithEvent:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("_pointWithinScreenFrame:"), function $_CPWindowView___pointWithinScreenFrame_(self, _cmd, aPoint)
{ with(self)
{

    if (!objj_msgSend(CPPlatform, "isBrowser"))
        return aPoint;

    var visibleFrame = _cachedScreenFrame;

    if (!visibleFrame)
        visibleFrame = objj_msgSend(objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"), "visibleFrame");

    var minPointY = 0;

    if (objj_msgSend(CPMenu, "menuBarVisible"))
        minPointY = objj_msgSend(objj_msgSend(CPApp, "mainMenu"), "menuBarHeight");

    var restrictedPoint = CGPointMake(0, 0);

    restrictedPoint.x = MIN(MAX(aPoint.x, -_frame.size.width + 4.0), CGRectGetMaxX(visibleFrame) - 4.0);
    restrictedPoint.y = MIN(MAX(aPoint.y, minPointY), CGRectGetMaxY(visibleFrame) - 8.0);

    return restrictedPoint;
}
},["CGPoint","CGPoint"]), new objj_method(sel_getUid("trackMoveWithEvent:"), function $_CPWindowView__trackMoveWithEvent_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(objj_msgSend(self, "window"), "isMovable"))
        return;

    var type = objj_msgSend(anEvent, "type");

    if (type === CPLeftMouseUp)
    {
        _cachedScreenFrame = nil;
        return;
    }
    else if (type === CPLeftMouseDown)
    {
        _mouseDraggedPoint = objj_msgSend(objj_msgSend(self, "window"), "convertBaseToGlobal:", objj_msgSend(anEvent, "locationInWindow"));
        _cachedScreenFrame = objj_msgSend(objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"), "visibleFrame");
    }
    else if (type === CPLeftMouseDragged)
    {
        var theWindow = objj_msgSend(self, "window"),
            frame = objj_msgSend(theWindow, "frame"),
            location = objj_msgSend(theWindow, "convertBaseToGlobal:", objj_msgSend(anEvent, "locationInWindow")),
            origin = objj_msgSend(self, "_pointWithinScreenFrame:", CGPointMake((frame.origin.x) + (location.x - _mouseDraggedPoint.x),
                                                               (frame.origin.y) + (location.y - _mouseDraggedPoint.y)));
        objj_msgSend(theWindow, "setFrameOrigin:", origin);

        _mouseDraggedPoint = objj_msgSend(self, "_pointWithinScreenFrame:", location);
    }

    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMoveWithEvent:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("setFrameSize:"), function $_CPWindowView__setFrameSize_(self, _cmd, newSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "setFrameSize:", newSize);


    var theWindow = objj_msgSend(self, "window");

    if (objj_msgSend(theWindow, "attachedSheet"))
        objj_msgSend(theWindow, "_setAttachedSheetFrameOrigin");
}
},["void","CGSize"]), new objj_method(sel_getUid("setShowsResizeIndicator:"), function $_CPWindowView__setShowsResizeIndicator_(self, _cmd, shouldShowResizeIndicator)
{ with(self)
{
    if (shouldShowResizeIndicator)
    {
        var size = objj_msgSend(_CPWindowViewResizeIndicatorImage, "size"),
            boundsSize = objj_msgSend(self, "frame").size;

        _resizeIndicator = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(boundsSize.width - size.width - _resizeIndicatorOffset.width, boundsSize.height - size.height - _resizeIndicatorOffset.height, size.width, size.height));

        objj_msgSend(_resizeIndicator, "setImage:", _CPWindowViewResizeIndicatorImage);
        objj_msgSend(_resizeIndicator, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);

        objj_msgSend(self, "addSubview:", _resizeIndicator);
    }
    else
    {
        objj_msgSend(_resizeIndicator, "removeFromSuperview");

        _resizeIndicator = nil;
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("showsResizeIndicator"), function $_CPWindowView__showsResizeIndicator(self, _cmd)
{ with(self)
{
    return _resizeIndicator !== nil;
}
},["BOOL"]), new objj_method(sel_getUid("setResizeIndicatorOffset:"), function $_CPWindowView__setResizeIndicatorOffset_(self, _cmd, anOffset)
{ with(self)
{
    if (CGSizeEqualToSize(_resizeIndicatorOffset, anOffset))
        return;

    _resizeIndicatorOffset = anOffset;

    if (!_resizeIndicator)
        return;

    var size = objj_msgSend(_resizeIndicator, "frame").size,
        boundsSize = objj_msgSend(self, "frame").size;

    objj_msgSend(_resizeIndicator, "setFrameOrigin:", CGPointMake(boundsSize.width - size.width - anOffset.width, boundsSize.height - size.height - anOffset.height));
}
},["void","CGSize"]), new objj_method(sel_getUid("resizeIndicatorOffset"), function $_CPWindowView__resizeIndicatorOffset(self, _cmd)
{ with(self)
{
    return _resizeIndicatorOffset;
}
},["CGSize"]), new objj_method(sel_getUid("windowDidChangeDocumentEdited"), function $_CPWindowView__windowDidChangeDocumentEdited(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("windowDidChangeDocumentSaving"), function $_CPWindowView__windowDidChangeDocumentSaving(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("showsToolbar"), function $_CPWindowView__showsToolbar(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPWindowView__toolbarOffset(self, _cmd)
{ with(self)
{
    return _toolbarOffset;
}
},["CGSize"]), new objj_method(sel_getUid("toolbarLabelColor"), function $_CPWindowView__toolbarLabelColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "blackColor");
}
},["CPColor"]), new objj_method(sel_getUid("toolbarMaxY"), function $_CPWindowView__toolbarMaxY(self, _cmd)
{ with(self)
{
    if (!_toolbarView || objj_msgSend(_toolbarView, "isHidden"))
        return objj_msgSend(self, "toolbarOffset").height;

    return CGRectGetMaxY(objj_msgSend(_toolbarView, "frame"));
}
},["float"]), new objj_method(sel_getUid("toolbarView"), function $_CPWindowView__toolbarView(self, _cmd)
{ with(self)
{
    return _toolbarView;
}
},["_CPToolbarView"]), new objj_method(sel_getUid("tile"), function $_CPWindowView__tile(self, _cmd)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);

    if (objj_msgSend(objj_msgSend(theWindow, "toolbar"), "isVisible"))
    {
        var toolbarView = objj_msgSend(self, "toolbarView"),
            toolbarOffset = objj_msgSend(self, "toolbarOffset");

        objj_msgSend(toolbarView, "setFrame:", CGRectMake(toolbarOffset.width, toolbarOffset.height, width, CGRectGetHeight(objj_msgSend(toolbarView, "frame"))));
    }

    if (objj_msgSend(self, "showsResizeIndicator"))
    {
        var size = objj_msgSend(_resizeIndicator, "frame").size,
            boundsSize = objj_msgSend(self, "bounds").size;

        objj_msgSend(_resizeIndicator, "setFrameOrigin:", CGPointMake(boundsSize.width - size.width - _resizeIndicatorOffset.width, boundsSize.height - size.height - _resizeIndicatorOffset.height));
    }
}
},["void"]), new objj_method(sel_getUid("noteToolbarChanged"), function $_CPWindowView__noteToolbarChanged(self, _cmd)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window"),
        toolbar = objj_msgSend(theWindow, "toolbar"),
        toolbarView = objj_msgSend(toolbar, "_toolbarView");

    if (_toolbarView !== toolbarView)
    {
        objj_msgSend(_toolbarView, "removeFromSuperview");

        if (toolbarView)
        {
            objj_msgSend(toolbarView, "removeFromSuperview");
            objj_msgSend(toolbarView, "FIXME_setIsHUD:", _styleMask & CPHUDBackgroundWindowMask);

            objj_msgSend(self, "addSubview:", toolbarView);
        }

        _toolbarView = toolbarView;
    }

    objj_msgSend(toolbarView, "setHidden:", !objj_msgSend(self, "showsToolbar") || !objj_msgSend(toolbar, "isVisible"));

    if (theWindow)
    {
        var contentRect = objj_msgSend(self, "convertRect:toView:", objj_msgSend(objj_msgSend(theWindow, "contentView"), "frame"), nil);

        contentRect.origin = objj_msgSend(theWindow, "convertBaseToGlobal:", contentRect.origin);

        objj_msgSend(self, "setAutoresizesSubviews:", NO);
        objj_msgSend(theWindow, "setFrame:", objj_msgSend(theWindow, "frameRectForContentRect:", contentRect));
        objj_msgSend(self, "setAutoresizesSubviews:", YES);
    }

    objj_msgSend(self, "tile");
}
},["void"]), new objj_method(sel_getUid("noteKeyWindowStateChanged"), function $_CPWindowView__noteKeyWindowStateChanged(self, _cmd)
{ with(self)
{
    if (objj_msgSend(objj_msgSend(self, "window"), "isKeyWindow"))
        objj_msgSend(self, "setThemeState:", CPThemeStateKeyWindow);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateKeyWindow);
}
},["void"]), new objj_method(sel_getUid("noteMainWindowStateChanged"), function $_CPWindowView__noteMainWindowStateChanged(self, _cmd)
{ with(self)
{
    if (objj_msgSend(objj_msgSend(self, "window"), "isMainWindow"))
        objj_msgSend(self, "setThemeState:", CPThemeStateMainWindow);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateMainWindow);
}
},["void"]), new objj_method(sel_getUid("didAddSubview:"), function $_CPWindowView__didAddSubview_(self, _cmd, aView)
{ with(self)
{
    if (!_resizeIndicator || aView === _resizeIndicator)
        return;

    objj_msgSend(self, "addSubview:", _resizeIndicator);
}
},["void","CPView"]), new objj_method(sel_getUid("_enableSheet:"), function $_CPWindowView___enableSheet_(self, _cmd, enable)
{ with(self)
{
    if (enable)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));
        _sheetShadowView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0, y:0 }, size: { width:(objj_msgSend(self, "bounds").size.width), height:8 } });
        objj_msgSend(_sheetShadowView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_sheetShadowView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowAttachedSheetShadow.png"), { width:9, height:8 })));
        objj_msgSend(self, "addSubview:", _sheetShadowView);
    }
    else
    {
        objj_msgSend(_sheetShadowView, "removeFromSuperview");
    }
}
},["void","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $_CPWindowView__initialize(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(_CPWindowView, "class"))
        return;

    _CPWindowViewResizeIndicatorImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class")), "pathForResource:", "_CPWindowView/_CPWindowViewResizeIndicator.png"), CGSizeMake(12.0, 12.0));
}
},["void"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    return CGRectMakeCopy(aFrameRect);
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    return CGRectMakeCopy(aContentRect);
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("defaultThemeClass"), function $_CPWindowView__defaultThemeClass(self, _cmd)
{ with(self)
{
    return "window";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPWindowView__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [objj_msgSend(CPColor, "blackColor"), objj_msgSend(CPFont, "systemFontOfSize:", CPFontCurrentSystemSize), objj_msgSend(CPNull, "null"), { width:0.0, height:0.0 }, CPCenterTextAlignment, CPLineBreakByTruncatingTail, CPTopVerticalTextAlignment], ["title-text-color", "title-font", "title-text-shadow-color", "title-text-shadow-offset", "title-alignment", "title-line-break-mode", "title-vertical-alignment"]);
}
},["id"])]);
}

