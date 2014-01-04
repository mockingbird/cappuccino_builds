@STATIC;1.0;i;13;CPTextField.ji;24;_CPTitleableWindowView.jt;17877;

objj_executeFile("CPTextField.j", YES);
objj_executeFile("_CPTitleableWindowView.j", YES);


var GRADIENT_HEIGHT = 41.0;

var _CPTexturedWindowHeadGradientColor = nil,
    _CPTexturedWindowHeadSolidColor = nil;

{var the_class = objj_allocateClassPair(CPView, "_CPTexturedWindowHeadView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_gradientView"), new objj_ivar("_solidView"), new objj_ivar("_dividerView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPTexturedWindowHeadView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTexturedWindowHeadView").super_class }, "initWithFrame:", aFrame);

    if (self)
    {
        var theClass = objj_msgSend(self, "class"),
            bounds = objj_msgSend(self, "bounds");

        _gradientView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), GRADIENT_HEIGHT));
        objj_msgSend(_gradientView, "setBackgroundColor:", objj_msgSend(theClass, "gradientColor"));

        objj_msgSend(self, "addSubview:", _gradientView);

        _solidView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, GRADIENT_HEIGHT, CGRectGetWidth(bounds), CGRectGetHeight(bounds) - GRADIENT_HEIGHT));
        objj_msgSend(_solidView, "setBackgroundColor:", objj_msgSend(theClass, "solidColor"));

        objj_msgSend(self, "addSubview:", _solidView);
    }

    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $_CPTexturedWindowHeadView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");

    objj_msgSend(_gradientView, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), GRADIENT_HEIGHT));
    objj_msgSend(_solidView, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), CGRectGetHeight(bounds) - GRADIENT_HEIGHT));
}
},["void","CGSize"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("gradientColor"), function $_CPTexturedWindowHeadView__gradientColor(self, _cmd)
{ with(self)
{
    if (!_CPTexturedWindowHeadGradientColor)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_CPWindowView, "class"));

        _CPTexturedWindowHeadGradientColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
            [
                objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardTop0.png"), CGSizeMake(6.0, 41.0)),
                objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardTop1.png"), CGSizeMake(1.0, 41.0)),
                objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardTop2.png"), CGSizeMake(6.0, 41.0))
            ], NO
        ));
    }

    return _CPTexturedWindowHeadGradientColor;
}
},["CPColor"]), new objj_method(sel_getUid("solidColor"), function $_CPTexturedWindowHeadView__solidColor(self, _cmd)
{ with(self)
{
    if (!_CPTexturedWindowHeadSolidColor)
        _CPTexturedWindowHeadSolidColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 195.0 / 255.0, 195.0 / 255.0, 195.0 / 255.0, 1.0);

    return _CPTexturedWindowHeadSolidColor;
}
},["CPColor"])]);
}

var _CPStandardWindowViewBodyBackgroundColor = nil,
    _CPStandardWindowViewDividerBackgroundColor = nil,
    _CPStandardWindowViewCloseButtonImage = nil,
    _CPStandardWindowViewCloseButtonHighlightedImage = nil,
    _CPStandardWindowViewCloseButtonUnsavedImage = nil,
    _CPStandardWindowViewCloseButtonUnsavedHighlightedImage = nil,
    _CPStandardWindowViewMinimizeButtonImage = nil,
    _CPStandardWindowViewMinimizeButtonHighlightedImage = nil,
    _CPStandardWindowViewThemeValues = nil;

var STANDARD_GRADIENT_HEIGHT = 41.0;

{var the_class = objj_allocateClassPair(_CPTitleableWindowView, "_CPStandardWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_headView"), new objj_ivar("_dividerView"), new objj_ivar("_bodyView"), new objj_ivar("_toolbarView"), new objj_ivar("_closeButton"), new objj_ivar("_minimizeButton"), new objj_ivar("_isDocumentEdited")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPStandardWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect),
        theToolbar = objj_msgSend(objj_msgSend(self, "window"), "toolbar");

    if (objj_msgSend(theToolbar, "isVisible"))
    {
        var toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(theToolbar, "_toolbarView"), "frame"));

        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }

    return contentRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPStandardWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect),
        theToolbar = objj_msgSend(objj_msgSend(self, "window"), "toolbar");

    if (objj_msgSend(theToolbar, "isVisible"))
    {
        var toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(theToolbar, "_toolbarView"), "frame"));

        frameRect.origin.y -= toolbarHeight;
        frameRect.size.height += toolbarHeight;
    }

    return frameRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPStandardWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);

    if (self)
    {

        objj_msgSend(self, "registerThemeValues:", _CPStandardWindowViewThemeValues);

        var theClass = objj_msgSend(self, "class"),
            bounds = objj_msgSend(self, "bounds");

        _headView = objj_msgSend(objj_msgSend(_CPTexturedWindowHeadView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight")));

        objj_msgSend(_headView, "setAutoresizingMask:", CPViewWidthSizable);;
        objj_msgSend(_headView, "setHitTests:", NO);

        objj_msgSend(self, "addSubview:positioned:relativeTo:", _headView, CPWindowBelow, _titleField);

        _dividerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, CGRectGetMaxY(objj_msgSend(_headView, "frame")), CGRectGetWidth(bounds), 1.0));

        objj_msgSend(_dividerView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_dividerView, "setBackgroundColor:", objj_msgSend(theClass, "dividerBackgroundColor"));
        objj_msgSend(_dividerView, "setHitTests:", NO);

        objj_msgSend(self, "addSubview:", _dividerView);

        var y = CGRectGetMaxY(objj_msgSend(_dividerView, "frame"));

        _bodyView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, y, CGRectGetWidth(bounds), CGRectGetHeight(bounds) - y));

        objj_msgSend(_bodyView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(_bodyView, "setBackgroundColor:", objj_msgSend(theClass, "bodyBackgroundColor"));
        objj_msgSend(_bodyView, "setHitTests:", NO);

        objj_msgSend(self, "addSubview:", _bodyView);

        objj_msgSend(self, "setResizeIndicatorOffset:", CGSizeMake(2.0, 2.0));

        if (_styleMask & CPClosableWindowMask)
        {
            if (!_CPStandardWindowViewCloseButtonImage)
            {
                var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));

                _CPStandardWindowViewCloseButtonImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardCloseButton.png"), CGSizeMake(16.0, 16.0));
                _CPStandardWindowViewCloseButtonHighlightedImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardCloseButtonHighlighted.png"), CGSizeMake(16.0, 16.0));
                _CPStandardWindowViewCloseButtonUnsavedImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardCloseButtonUnsaved.png"), CGSizeMake(16.0, 16.0));
                _CPStandardWindowViewCloseButtonUnsavedHighlightedImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardCloseButtonUnsavedHighlighted.png"), CGSizeMake(16.0, 16.0));
            }

            _closeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(8.0, 6.0, 16.0, 16.0));

            objj_msgSend(_closeButton, "setBordered:", NO);
            objj_msgSend(self, "_updateCloseButton");

            objj_msgSend(self, "addSubview:", _closeButton);
        }

        if (_styleMask & CPMiniaturizableWindowMask && !objj_msgSend(CPPlatform, "isBrowser"))
        {
            if (!_CPStandardWindowViewMinimizeButtonImage)
            {
                var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));

                _CPStandardWindowViewMinimizeButtonImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardMinimizeButton.png"), CGSizeMake(16.0, 16.0));
                _CPStandardWindowViewMinimizeButtonHighlightedImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardMinimizeButtonHighlighted.png"), CGSizeMake(16.0, 16.0));
            }

            _minimizeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(27.0, 7.0, 16.0, 16.0));

            objj_msgSend(_minimizeButton, "setBordered:", NO);

            objj_msgSend(_minimizeButton, "setImage:", _CPStandardWindowViewMinimizeButtonImage);
            objj_msgSend(_minimizeButton, "setAlternateImage:", _CPStandardWindowViewMinimizeButtonHighlightedImage);

            objj_msgSend(self, "addSubview:", _minimizeButton);
        }

        objj_msgSend(self, "tile");
    }

    return self;
}
},["id","CPRect","unsigned"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $_CPStandardWindowView__viewDidMoveToWindow(self, _cmd)
{ with(self)
{
    objj_msgSend(_closeButton, "setTarget:", objj_msgSend(self, "window"));
    objj_msgSend(_closeButton, "setAction:", sel_getUid("performClose:"));

    objj_msgSend(_minimizeButton, "setTarget:", objj_msgSend(self, "window"));
    objj_msgSend(_minimizeButton, "setAction:", sel_getUid("performMiniaturize:"));
}
},["void"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPStandardWindowView__toolbarOffset(self, _cmd)
{ with(self)
{
    return CGSizeMake(0.0, objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight"));
}
},["CGSize"]), new objj_method(sel_getUid("tile"), function $_CPStandardWindowView__tile(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "tile");

    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = (bounds.size.width);

    objj_msgSend(_headView, "setFrameSize:", { width:width, height:objj_msgSend(self, "toolbarMaxY") });
    objj_msgSend(_dividerView, "setFrame:", { origin: { x:0.0, y:(objj_msgSend(_headView, "frame").origin.y + objj_msgSend(_headView, "frame").size.height) }, size: { width:width, height:1.0 } });

    var dividerMaxY = 0,
        dividerMinY = 0;
    if (!objj_msgSend(_dividerView, "isHidden"))
    {
        dividerMinY = (objj_msgSend(_dividerView, "frame").origin.y);
        dividerMaxY = (objj_msgSend(_dividerView, "frame").origin.y + objj_msgSend(_dividerView, "frame").size.height);
    }

    objj_msgSend(_bodyView, "setFrame:", { origin: { x:0.0, y:dividerMaxY }, size: { width:width, height:(bounds.size.height) - dividerMaxY } });

    var leftOffset = 8;

    if (_closeButton)
        leftOffset += 19.0;
    if (_minimizeButton)
        leftOffset += 19.0;

    objj_msgSend(_titleField, "setFrame:", { origin: { x:leftOffset, y:0 }, size: { width:width - leftOffset * 2.0, height:objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight") } });

    var contentRect = { origin: { x:0.0, y:dividerMaxY }, size: { width:width, height:(objj_msgSend(_bodyView, "frame").size.height) } };

    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrame:", contentRect);
}
},["void"]), new objj_method(sel_getUid("_updateCloseButton"), function $_CPStandardWindowView___updateCloseButton(self, _cmd)
{ with(self)
{
    if (_isDocumentEdited)
    {
        objj_msgSend(_closeButton, "setImage:", _CPStandardWindowViewCloseButtonUnsavedImage);
        objj_msgSend(_closeButton, "setAlternateImage:", _CPStandardWindowViewCloseButtonUnsavedHighlightedImage);
    }
    else
    {
        objj_msgSend(_closeButton, "setImage:", _CPStandardWindowViewCloseButtonImage);
        objj_msgSend(_closeButton, "setAlternateImage:", _CPStandardWindowViewCloseButtonHighlightedImage);
    }
}
},["void"]), new objj_method(sel_getUid("setDocumentEdited:"), function $_CPStandardWindowView__setDocumentEdited_(self, _cmd, isEdited)
{ with(self)
{
    _isDocumentEdited = isEdited;
    objj_msgSend(self, "_updateCloseButton");
}
},["void","BOOL"]), new objj_method(sel_getUid("mouseDown:"), function $_CPStandardWindowView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(_headView, "isHidden"))
        if (CGRectContainsPoint(objj_msgSend(_headView, "frame"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
            return objj_msgSend(self, "trackMoveWithEvent:", anEvent);

    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "mouseDown:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("_enableSheet:"), function $_CPStandardWindowView___enableSheet_(self, _cmd, enable)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "_enableSheet:", enable);

    objj_msgSend(_headView, "setHidden:", enable);
    objj_msgSend(_dividerView, "setHidden:", enable);
    objj_msgSend(_closeButton, "setHidden:", enable);
    objj_msgSend(_minimizeButton, "setHidden:", enable);
    objj_msgSend(_titleField, "setHidden:", enable);

    if (enable)
        objj_msgSend(_bodyView, "setBackgroundColor:", objj_msgSend(_CPDocModalWindowView, "bodyBackgroundColor"));
    else
        objj_msgSend(_bodyView, "setBackgroundColor:", objj_msgSend(objj_msgSend(self, "class"), "bodyBackgroundColor"));


    var theWindow = objj_msgSend(self, "window"),
        frame = objj_msgSend(theWindow, "frame");

    var dy = (objj_msgSend(_headView, "frame").size.height) + (objj_msgSend(_dividerView, "frame").size.height);
    if (enable)
        dy = -dy;

    var newHeight = (frame.origin.y + frame.size.height) + dy,
        newWidth = (frame.origin.x + frame.size.width);

    frame.size.height += dy;

    objj_msgSend(self, "setFrameSize:", { width:newWidth, height:newHeight });
    objj_msgSend(self, "tile");
    objj_msgSend(theWindow, "setFrame:display:animate:", frame, NO, NO);
}
},["void","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $_CPStandardWindowView__initialize(self, _cmd)
{ with(self)
{
    _CPStandardWindowViewThemeValues = [
        ["title-font", objj_msgSend(CPFont, "boldSystemFontOfSize:", CPFontCurrentSystemSize)],
        ["title-text-color", objj_msgSend(CPColor, "colorWithWhite:alpha:", 22.0 / 255.0, 0.75)],
        ["title-text-color", objj_msgSend(CPColor, "colorWithWhite:alpha:", 22.0 / 255.0, 1), CPThemeStateKeyWindow],
        ["title-text-shadow-color", objj_msgSend(CPColor, "whiteColor")],
        ["title-text-shadow-offset", CGSizeMake(0.0, 1.0)],
        ["title-alignment", CPCenterTextAlignment],

        ["title-line-break-mode", CPLineBreakByTruncatingTail],
        ["title-vertical-alignment", CPCenterVerticalTextAlignment]
    ];
}
},["void"]), new objj_method(sel_getUid("bodyBackgroundColor"), function $_CPStandardWindowView__bodyBackgroundColor(self, _cmd)
{ with(self)
{
    if (!_CPStandardWindowViewBodyBackgroundColor)
        _CPStandardWindowViewBodyBackgroundColor = objj_msgSend(CPColor, "colorWithWhite:alpha:", 0.96, 1.0);

    return _CPStandardWindowViewBodyBackgroundColor;
}
},["CPColor"]), new objj_method(sel_getUid("dividerBackgroundColor"), function $_CPStandardWindowView__dividerBackgroundColor(self, _cmd)
{ with(self)
{
    if (!_CPStandardWindowViewDividerBackgroundColor)
        _CPStandardWindowViewDividerBackgroundColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 125.0 / 255.0, 125.0 / 255.0, 125.0 / 255.0, 1.0);

    return _CPStandardWindowViewDividerBackgroundColor;
}
},["CPColor"])]);
}

