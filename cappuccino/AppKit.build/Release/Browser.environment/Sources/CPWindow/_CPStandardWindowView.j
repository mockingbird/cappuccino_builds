@STATIC;1.0;i;10;CPButton.ji;24;_CPTitleableWindowView.jt;17075;objj_executeFile("CPButton.j", YES);objj_executeFile("_CPTitleableWindowView.j", YES);var _CPStandardWindowViewDividerViewHeight = 1.0;
{var the_class = objj_allocateClassPair(CPView, "_CPTexturedWindowHeadView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isSheet"), new objj_ivar("_parentView"), new objj_ivar("_gradientView"), new objj_ivar("_solidView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_isSheet"), function $_CPTexturedWindowHeadView___isSheet(self, _cmd)
{
    return self._isSheet;
}
,["BOOL"]), new objj_method(sel_getUid("setSheet:"), function $_CPTexturedWindowHeadView__setSheet_(self, _cmd, newValue)
{
    self._isSheet = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("initWithFrame:windowView:"), function $_CPTexturedWindowHeadView__initWithFrame_windowView_(self, _cmd, aFrame, parentView)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTexturedWindowHeadView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._parentView = parentView;
        self._gradientView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self, "addSubview:", self._gradientView);
        self._solidView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self, "addSubview:", self._solidView);
    }
    return self;
}
,["id","CGRect","_CPWindowView"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPTexturedWindowHeadView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTexturedWindowHeadView").super_class }, "layoutSubviews");
    var gradientHeight = objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "gradient-height", _CPStandardWindowView),
        bounds = objj_msgSend(self, "bounds"),
        bezelHeadColor = objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:inState:forClass:", self._isSheet ? "bezel-head-sheet-color" : "bezel-head-color", objj_msgSend(self._parentView, "themeState"), _CPStandardWindowView);
    objj_msgSend(self._gradientView, "setFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), gradientHeight));
    objj_msgSend(self._gradientView, "setBackgroundColor:", bezelHeadColor);
    objj_msgSend(self._solidView, "setFrame:", CGRectMake(0.0, gradientHeight, CGRectGetWidth(bounds), CGRectGetHeight(bounds) - gradientHeight));
    objj_msgSend(self._solidView, "setBackgroundColor:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "solid-color", _CPStandardWindowView));
}
,["void"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $_CPTexturedWindowHeadView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
    var bounds = objj_msgSend(self, "bounds");
    objj_msgSend(self._gradientView, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "gradient-height", _CPStandardWindowView)));
    objj_msgSend(self._solidView, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), CGRectGetHeight(bounds) - objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "gradient-height", _CPStandardWindowView)));
}
,["void","CGSize"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPTexturedWindowHeadView__defaultThemeClass(self, _cmd)
{
    return "textured-window-head-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPTexturedWindowHeadView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
}
,["id"])]);
}{var the_class = objj_allocateClassPair(_CPTitleableWindowView, "_CPStandardWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_headView"), new objj_ivar("_dividerView"), new objj_ivar("_bodyView"), new objj_ivar("_toolbarView"), new objj_ivar("_closeButton"), new objj_ivar("_minimizeButton"), new objj_ivar("_isDocumentEdited"), new objj_ivar("_isSheet")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPStandardWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        var theClass = objj_msgSend(self, "class"),
            bounds = objj_msgSend(self, "bounds");
        self._headView = objj_msgSend(objj_msgSend(_CPTexturedWindowHeadView, "alloc"), "initWithFrame:windowView:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), objj_msgSend(self, "valueForThemeAttribute:", "title-bar-height")), self);
        objj_msgSend(self._headView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self._headView, "setHitTests:", NO);
        objj_msgSend(self, "addSubview:positioned:relativeTo:", self._headView, CPWindowBelow, self._titleField);
        self._dividerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, CGRectGetMaxY(objj_msgSend(self._headView, "frame")), CGRectGetWidth(bounds), _CPStandardWindowViewDividerViewHeight));
        objj_msgSend(self._dividerView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self._dividerView, "setHitTests:", NO);
        objj_msgSend(self, "addSubview:", self._dividerView);
        var y = CGRectGetMinY(objj_msgSend(self._dividerView, "frame"));
        self._bodyView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, y, CGRectGetWidth(bounds), CGRectGetHeight(bounds) - y));
        objj_msgSend(self._bodyView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self._bodyView, "setHitTests:", NO);
        objj_msgSend(self, "addSubview:", self._bodyView);
        objj_msgSend(self, "setResizeIndicatorOffset:", CGSizeMake(2.0, 2.0));
        if (self._styleMask & CPClosableWindowMask)
        {
            self._closeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(8.0, 8.0, 16.0, 16.0));
            objj_msgSend(self._closeButton, "setButtonType:", CPMomentaryChangeButton);
            objj_msgSend(self._closeButton, "setBordered:", NO);
            objj_msgSend(self, "_updateCloseButton");
            objj_msgSend(self, "addSubview:", self._closeButton);
        }
        if (self._styleMask & CPMiniaturizableWindowMask && !objj_msgSend(CPPlatform, "isBrowser"))
        {
            self._minimizeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(27.0, 7.0, 16.0, 16.0));
            objj_msgSend(self._minimizeButton, "setButtonType:", CPMomentaryChangeButton);
            objj_msgSend(self._minimizeButton, "setBordered:", NO);
            objj_msgSend(self, "addSubview:", self._minimizeButton);
        }
        objj_msgSend(self, "tile");
    }
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $_CPStandardWindowView__viewDidMoveToWindow(self, _cmd)
{
    objj_msgSend(self._closeButton, "setTarget:", objj_msgSend(self, "window"));
    objj_msgSend(self._closeButton, "setAction:", sel_getUid("performClose:"));
    objj_msgSend(self._minimizeButton, "setTarget:", objj_msgSend(self, "window"));
    objj_msgSend(self._minimizeButton, "setAction:", sel_getUid("performMiniaturize:"));
}
,["void"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPStandardWindowView__toolbarOffset(self, _cmd)
{
    return CGSizeMake(0.0, objj_msgSend(self, "valueForThemeAttribute:", "title-bar-height"));
}
,["CGSize"]), new objj_method(sel_getUid("tile"), function $_CPStandardWindowView__tile(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "tile");
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds),
        headHeight = objj_msgSend(self, "toolbarMaxY");
    if (self._isSheet && self._toolbarView && objj_msgSend(self, "showsToolbar"))
    {
        headHeight = objj_msgSend(self._toolbarView, "frameSize").height;
        objj_msgSend(self._toolbarView, "setFrameOrigin:", CGPointMake(0.0, 0.0));
    }
    objj_msgSend(self._headView, "setFrameSize:", CGSizeMake(width, headHeight));
    objj_msgSend(self._dividerView, "setFrame:", CGRectMake(0.0, headHeight, width, _CPStandardWindowViewDividerViewHeight));
    var dividerMinY = 0,
        dividerFrame = objj_msgSend(self._dividerView, "frame");
    if (!objj_msgSend(self._dividerView, "isHidden"))
        dividerMinY = CGRectGetMinY(dividerFrame);
    objj_msgSend(self._bodyView, "setFrame:", CGRectMake(0.0, dividerMinY, width, CGRectGetHeight(bounds) - dividerMinY));
    var leftOffset = 8;
    if (self._closeButton)
        leftOffset += 19.0;
    if (self._minimizeButton)
        leftOffset += 19.0;
    objj_msgSend(self._titleField, "setFrame:", CGRectMake(leftOffset, 0, width - leftOffset * 2.0, objj_msgSend(self, "valueForThemeAttribute:", "title-bar-height")));
    var contentFrame = objj_msgSend(self._bodyView, "frame");
    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrame:", CGRectInset(contentFrame, 1.0, 1.0));
}
,["void"]), new objj_method(sel_getUid("_updateCloseButton"), function $_CPStandardWindowView___updateCloseButton(self, _cmd)
{
    objj_msgSend(self._closeButton, "setFrameSize:", objj_msgSend(self, "valueForThemeAttribute:", "close-image-size"));
    objj_msgSend(self._closeButton, "setFrameOrigin:", objj_msgSend(self, "valueForThemeAttribute:", "close-image-origin"));
    if (self._isDocumentEdited)
    {
        objj_msgSend(self._closeButton, "setImage:", objj_msgSend(self, "currentValueForThemeAttribute:", "unsaved-image-button"));
        objj_msgSend(self._closeButton, "setAlternateImage:", objj_msgSend(self, "valueForThemeAttribute:", "unsaved-image-highlighted-button"));
    }
    else
    {
        objj_msgSend(self._closeButton, "setImage:", objj_msgSend(self, "currentValueForThemeAttribute:", "close-image-button"));
        objj_msgSend(self._closeButton, "setAlternateImage:", objj_msgSend(self, "currentValueForThemeAttribute:", "close-image-highlighted-button"));
    }
}
,["void"]), new objj_method(sel_getUid("setDocumentEdited:"), function $_CPStandardWindowView__setDocumentEdited_(self, _cmd, isEdited)
{
    self._isDocumentEdited = isEdited;
    objj_msgSend(self, "_updateCloseButton");
}
,["void","BOOL"]), new objj_method(sel_getUid("couldBeMoveEvent:"), function $_CPStandardWindowView__couldBeMoveEvent_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self._headView, "isHidden"))
        if (CGRectContainsPoint(objj_msgSend(self._headView, "frame"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
            return YES;
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "couldBeMoveEvent:", anEvent);
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("_enableSheet:inWindow:"), function $_CPStandardWindowView___enableSheet_inWindow_(self, _cmd, enable, parentWindow)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "_enableSheet:inWindow:", enable, parentWindow);
    self._isSheet = enable;
    objj_msgSend(self._headView, "setSheet:", enable);
    if (self._toolbarView && objj_msgSend(self, "showsToolbar"))
    {
        objj_msgSend(self._headView, "setHidden:", NO);
        objj_msgSend(self._dividerView, "setHidden:", NO);
    }
    else
    {
        objj_msgSend(self._headView, "setHidden:", enable);
        objj_msgSend(self._dividerView, "setHidden:", enable);
    }
    objj_msgSend(self._closeButton, "setHidden:", enable);
    objj_msgSend(self._minimizeButton, "setHidden:", enable);
    objj_msgSend(self._titleField, "setHidden:", enable);
    objj_msgSend(objj_msgSend(self, "window"), "setMovable:", !enable);
    if (enable)
    {
        objj_msgSend(self._bodyView, "setBackgroundColor:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "body-color", _CPDocModalWindowView));
        var shadowFrame = objj_msgSend(self._sheetShadowView, "frame");
        objj_msgSend(self._sheetShadowView, "setFrameOrigin:", CGPointMake(shadowFrame.origin.x, shadowFrame.origin.y + 1));
    }
    else
        objj_msgSend(self._bodyView, "setBackgroundColor:", objj_msgSend(self, "valueForThemeAttribute:", "body-color"));
    var theWindow = objj_msgSend(self, "window"),
        frame = objj_msgSend(theWindow, "frame"),
        dividerHeight = objj_msgSend(self._dividerView, "frame").size.height,
        dy = objj_msgSend(self, "toolbarMaxY") + dividerHeight;
    if (self._toolbarView && objj_msgSend(self, "showsToolbar"))
        dy = objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "gradient-height", _CPStandardWindowView);
    if (enable)
        dy = -dy;
    var newHeight = CGRectGetHeight(frame) + dy,
        newWidth = CGRectGetWidth(frame);
    frame.size.height += dy;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(newWidth, newHeight));
    objj_msgSend(self, "tile");
    objj_msgSend(theWindow, "setFrame:display:animate:", frame, NO, NO);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","BOOL","CPWindow"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPStandardWindowView__layoutSubviews(self, _cmd)
{
    var bounds = objj_msgSend(self, "bounds");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "layoutSubviews");
    objj_msgSend(self, "_updateCloseButton");
    objj_msgSend(self._minimizeButton, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "minimize-image-button"));
    objj_msgSend(self._minimizeButton, "setAlternateImage:", objj_msgSend(self, "valueForThemeAttribute:", "minimize-image-highlighted-button"));
    objj_msgSend(self._dividerView, "setBackgroundColor:", objj_msgSend(self, "valueForThemeAttribute:", "divider-color"));
    objj_msgSend(self._bodyView, "setBackgroundColor:", objj_msgSend(self, "valueForThemeAttribute:", "body-color"));
    objj_msgSend(self._headView, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("_minimumResizeSize"), function $_CPStandardWindowView___minimumResizeSize(self, _cmd)
{
    var size = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "_minimumResizeSize"),
        closeSize = objj_msgSend(self, "valueForThemeAttribute:", "close-image-size"),
        closeOrigin = objj_msgSend(self, "valueForThemeAttribute:", "close-image-origin");
    size.width = closeSize.width + closeOrigin.x * 2;
    size.height += _CPStandardWindowViewDividerViewHeight;
    return size;
}
,["CGSize"]), new objj_method(sel_getUid("bodyOffset"), function $_CPStandardWindowView__bodyOffset(self, _cmd)
{
    return objj_msgSend(self._bodyView, "frame").origin.y;
}
,["int"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPStandardWindowView__defaultThemeClass(self, _cmd)
{
    return "standard-window-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPStandardWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "gradient-height", objj_msgSend(CPNull, "null"), "solid-color", objj_msgSend(CPNull, "null"), "bezel-head-color", objj_msgSend(CPNull, "null"), "bezel-head-sheet-color", objj_msgSend(CPColor, "blackColor"), "divider-color", objj_msgSend(CPColor, "whiteColor"), "body-color", 32, "title-bar-height", objj_msgSend(CPNull, "null"), "minimize-image-highlighted-button", objj_msgSend(CPNull, "null"), "minimize-image-button", objj_msgSend(CPNull, "null"), "close-image-button", objj_msgSend(CPNull, "null"), "close-image-highlighted-button", objj_msgSend(CPNull, "null"), "unsaved-image-button", objj_msgSend(CPNull, "null"), "unsaved-image-highlighted-button");
}
,["id"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPStandardWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("_CPStandardWindowView").super_class }, "contentRectForFrameRect:", aFrameRect);
    contentRect.origin.x += 1;
    contentRect.size.width -= 2;
    contentRect.size.height -= 1;
    contentRect.origin.y += _CPStandardWindowViewDividerViewHeight;
    contentRect.size.height -= _CPStandardWindowViewDividerViewHeight;
    return contentRect;
}
,["CGRect","CGRect"])]);
}