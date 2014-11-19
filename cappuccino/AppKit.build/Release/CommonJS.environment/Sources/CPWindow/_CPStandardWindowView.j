@STATIC;1.0;i;10;CPButton.ji;24;_CPTitleableWindowView.jt;22587;objj_executeFile("CPButton.j", YES);objj_executeFile("_CPTitleableWindowView.j", YES);var _CPStandardWindowViewDividerViewHeight = 1.0;
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
        self._gradientView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._gradientView));
        self._solidView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._solidView));
    }
    return self;
    var ___r1;
}
,["id","CGRect","_CPWindowView"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPTexturedWindowHeadView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTexturedWindowHeadView").super_class }, "layoutSubviews");
    var gradientHeight = ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "gradient-height", _CPStandardWindowView)),
        bounds = self.isa.objj_msgSend0(self, "bounds"),
        bezelHeadColor = ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "valueForAttributeWithName:inState:forClass:", self._isSheet ? "bezel-head-sheet-color" : "bezel-head-color", ((___r2 = self._parentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "themeState")), _CPStandardWindowView));
    ((___r1 = self._gradientView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), gradientHeight)));
    ((___r1 = self._gradientView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", bezelHeadColor));
    ((___r1 = self._solidView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0.0, gradientHeight, CGRectGetWidth(bounds), CGRectGetHeight(bounds) - gradientHeight)));
    ((___r1 = self._solidView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", ((___r2 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForAttributeWithName:forClass:", "solid-color", _CPStandardWindowView))));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $_CPTexturedWindowHeadView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds");
    ((___r1 = self._gradientView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), ((___r2 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForAttributeWithName:forClass:", "gradient-height", _CPStandardWindowView)))));
    ((___r1 = self._solidView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), CGRectGetHeight(bounds) - ((___r2 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForAttributeWithName:forClass:", "gradient-height", _CPStandardWindowView)))));
    var ___r1, ___r2;
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
,["CPDictionary"])]);
}{var the_class = objj_allocateClassPair(_CPTitleableWindowView, "_CPStandardWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_headView"), new objj_ivar("_dividerView"), new objj_ivar("_bodyView"), new objj_ivar("_toolbarView"), new objj_ivar("_closeButton"), new objj_ivar("_minimizeButton"), new objj_ivar("_isDocumentEdited"), new objj_ivar("_isSheet")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPStandardWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        var theClass = (self == null ? null : self.isa.objj_msgSend0(self, "class")),
            bounds = (self == null ? null : self.isa.objj_msgSend0(self, "bounds"));
        self._headView = ((___r1 = _CPTexturedWindowHeadView.isa.objj_msgSend0(_CPTexturedWindowHeadView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithFrame:windowView:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), (self == null ? null : self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "title-bar-height"))), self));
        ((___r1 = self._headView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
        ((___r1 = self._headView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHitTests:", NO));
        (self == null ? null : self.isa.objj_msgSend3(self, "addSubview:positioned:relativeTo:", self._headView, CPWindowBelow, self._titleField));
        self._dividerView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, CGRectGetMaxY(((___r2 = self._headView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))), CGRectGetWidth(bounds), _CPStandardWindowViewDividerViewHeight)));
        ((___r1 = self._dividerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
        ((___r1 = self._dividerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHitTests:", NO));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._dividerView));
        var y = CGRectGetMinY(((___r1 = self._dividerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
        self._bodyView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, y, CGRectGetWidth(bounds), CGRectGetHeight(bounds) - y)));
        ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHitTests:", NO));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._bodyView));
        (self == null ? null : self.isa.objj_msgSend1(self, "setResizeIndicatorOffset:", CGSizeMake(2.0, 2.0)));
        if (self._styleMask & CPClosableWindowMask)
        {
            self._closeButton = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(8.0, 8.0, 16.0, 16.0)));
            ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setButtonType:", CPMomentaryChangeButton));
            ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBordered:", NO));
            (self == null ? null : self.isa.objj_msgSend0(self, "_updateCloseButton"));
            (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._closeButton));
        }
        if (self._styleMask & CPMiniaturizableWindowMask && !CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
        {
            self._minimizeButton = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(27.0, 7.0, 16.0, 16.0)));
            ((___r1 = self._minimizeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setButtonType:", CPMomentaryChangeButton));
            ((___r1 = self._minimizeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBordered:", NO));
            (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._minimizeButton));
        }
        (self == null ? null : self.isa.objj_msgSend0(self, "tile"));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $_CPStandardWindowView__viewDidMoveToWindow(self, _cmd)
{
    ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self.isa.objj_msgSend0(self, "window")));
    ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("performClose:")));
    ((___r1 = self._minimizeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self.isa.objj_msgSend0(self, "window")));
    ((___r1 = self._minimizeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("performMiniaturize:")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPStandardWindowView__toolbarOffset(self, _cmd)
{
    return CGSizeMake(0.0, self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "title-bar-height"));
}
,["CGSize"]), new objj_method(sel_getUid("tile"), function $_CPStandardWindowView__tile(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "tile");
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        bounds = self.isa.objj_msgSend0(self, "bounds"),
        width = CGRectGetWidth(bounds),
        headHeight = self.isa.objj_msgSend0(self, "toolbarMaxY");
    if (self._isSheet && self._toolbarView && self.isa.objj_msgSend0(self, "showsToolbar"))
    {
        headHeight = ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height;
        ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(0.0, 0.0)));
    }
    ((___r1 = self._headView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(width, headHeight)));
    ((___r1 = self._dividerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0.0, headHeight, width, _CPStandardWindowViewDividerViewHeight)));
    var dividerMinY = 0,
        dividerFrame = ((___r1 = self._dividerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    if (!((___r1 = self._dividerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        dividerMinY = CGRectGetMinY(dividerFrame);
    ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0.0, dividerMinY, width, CGRectGetHeight(bounds) - dividerMinY)));
    var leftOffset = 8;
    if (self._closeButton)
        leftOffset += 19.0;
    if (self._minimizeButton)
        leftOffset += 19.0;
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(leftOffset, 0, width - leftOffset * 2.0, self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "title-bar-height"))));
    var contentFrame = ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    ((___r1 = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectInset(contentFrame, 1.0, 1.0)));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_updateCloseButton"), function $_CPStandardWindowView___updateCloseButton(self, _cmd)
{
    ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "close-image-size")));
    ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "close-image-origin")));
    if (self._isDocumentEdited)
    {
        ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "unsaved-image-button")));
        ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlternateImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "unsaved-image-highlighted-button")));
    }
    else
    {
        ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "close-image-button")));
        ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlternateImage:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "close-image-highlighted-button")));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setDocumentEdited:"), function $_CPStandardWindowView__setDocumentEdited_(self, _cmd, isEdited)
{
    self._isDocumentEdited = isEdited;
    self.isa.objj_msgSend0(self, "_updateCloseButton");
}
,["void","BOOL"]), new objj_method(sel_getUid("couldBeMoveEvent:"), function $_CPStandardWindowView__couldBeMoveEvent_(self, _cmd, anEvent)
{
    if (!((___r1 = self._headView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        if (CGRectContainsPoint(((___r1 = self._headView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")), self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil)))
            return YES;
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "couldBeMoveEvent:", anEvent);
    var ___r1;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("_enableSheet:inWindow:"), function $_CPStandardWindowView___enableSheet_inWindow_(self, _cmd, enable, parentWindow)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "_enableSheet:inWindow:", enable, parentWindow);
    self._isSheet = enable;
    ((___r1 = self._headView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSheet:", enable));
    if (self._toolbarView && self.isa.objj_msgSend0(self, "showsToolbar"))
    {
        ((___r1 = self._headView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self._dividerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    }
    else
    {
        ((___r1 = self._headView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", enable));
        ((___r1 = self._dividerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", enable));
    }
    ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", enable));
    ((___r1 = self._minimizeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", enable));
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", enable));
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMovable:", !enable));
    if (enable)
    {
        ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", ((___r2 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForAttributeWithName:forClass:", "body-color", _CPDocModalWindowView))));
        var shadowFrame = ((___r1 = self._sheetShadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
        ((___r1 = self._sheetShadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(shadowFrame.origin.x, shadowFrame.origin.y + 1)));
    }
    else
        ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "body-color")));
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        frame = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "frame")),
        dividerHeight = ((___r1 = self._dividerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size.height,
        dy = self.isa.objj_msgSend0(self, "toolbarMaxY") + dividerHeight;
    if (self._toolbarView && self.isa.objj_msgSend0(self, "showsToolbar"))
        dy = ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "gradient-height", _CPStandardWindowView));
    if (enable)
        dy = -dy;
    var newHeight = CGRectGetHeight(frame) + dy,
        newWidth = CGRectGetWidth(frame);
    frame.size.height += dy;
    self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(newWidth, newHeight));
    self.isa.objj_msgSend0(self, "tile");
    (theWindow == null ? null : theWindow.isa.objj_msgSend3(theWindow, "setFrame:display:animate:", frame, NO, NO));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1, ___r2;
}
,["void","BOOL","CPWindow"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPStandardWindowView__layoutSubviews(self, _cmd)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "layoutSubviews");
    self.isa.objj_msgSend0(self, "_updateCloseButton");
    ((___r1 = self._minimizeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "minimize-image-button")));
    ((___r1 = self._minimizeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlternateImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "minimize-image-highlighted-button")));
    ((___r1 = self._dividerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "divider-color")));
    ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "body-color")));
    ((___r1 = self._headView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_minimumResizeSize"), function $_CPStandardWindowView___minimumResizeSize(self, _cmd)
{
    var size = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStandardWindowView").super_class }, "_minimumResizeSize"),
        closeSize = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "close-image-size"),
        closeOrigin = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "close-image-origin");
    size.width = closeSize.width + closeOrigin.x * 2;
    size.height += _CPStandardWindowViewDividerViewHeight;
    return size;
}
,["CGSize"]), new objj_method(sel_getUid("bodyOffset"), function $_CPStandardWindowView__bodyOffset(self, _cmd)
{
    return ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).origin.y;
    var ___r1;
}
,["int"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPStandardWindowView__defaultThemeClass(self, _cmd)
{
    return "standard-window-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPStandardWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "gradient-height", CPNull.isa.objj_msgSend0(CPNull, "null"), "solid-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-head-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-head-sheet-color", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "divider-color", CPColor.isa.objj_msgSend0(CPColor, "whiteColor"), "body-color", 32, "title-bar-height", CPNull.isa.objj_msgSend0(CPNull, "null"), "minimize-image-highlighted-button", CPNull.isa.objj_msgSend0(CPNull, "null"), "minimize-image-button", CPNull.isa.objj_msgSend0(CPNull, "null"), "close-image-button", CPNull.isa.objj_msgSend0(CPNull, "null"), "close-image-highlighted-button", CPNull.isa.objj_msgSend0(CPNull, "null"), "unsaved-image-button", CPNull.isa.objj_msgSend0(CPNull, "null"), "unsaved-image-highlighted-button");
}
,["CPDictionary"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPStandardWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
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