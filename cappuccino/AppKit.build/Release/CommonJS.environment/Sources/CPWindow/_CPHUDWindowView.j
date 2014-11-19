@STATIC;1.0;i;10;CPButton.ji;13;CPTextField.ji;24;_CPTitleableWindowView.jt;8486;objj_executeFile("CPButton.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("_CPTitleableWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPTitleableWindowView, "_CPHUDWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbarView"), new objj_ivar("_closeButton")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPHUDWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "contentRectForFrameRect:", aFrameRect));
    if (((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "toolbar"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible")))
    {
        var toolbarHeight = CGRectGetHeight(((___r1 = self.isa.objj_msgSend0(self, "toolbarView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }
    return contentRect;
    var ___r1, ___r2;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPHUDWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    var frameRect = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "frameRectForContentRect:", aContentRect));
    if (((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "toolbar"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible")))
    {
        var toolbarHeight = CGRectGetHeight(((___r1 = self.isa.objj_msgSend0(self, "toolbarView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
        frameRect.origin.y -= toolbarHeight;
        frameRect.size.height += toolbarHeight;
    }
    return frameRect;
    var ___r1, ___r2;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPHUDWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPHUDWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        if (self._styleMask & CPClosableWindowMask)
        {
            self._closeButton = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
            ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBordered:", NO));
            ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setButtonType:", CPMomentaryChangeButton));
            (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._closeButton));
        }
        (self == null ? null : self.isa.objj_msgSend1(self, "setResizeIndicatorOffset:", CGSizeMake(5.0, 5.0)));
        (self == null ? null : self.isa.objj_msgSend0(self, "tile"));
    }
    return self;
    var ___r1;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $_CPHUDWindowView__viewDidMoveToWindow(self, _cmd)
{
    ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self.isa.objj_msgSend0(self, "window")));
    ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("performClose:")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("toolbarView"), function $_CPHUDWindowView__toolbarView(self, _cmd)
{
    return self._toolbarView;
}
,["_CPToolbarView"]), new objj_method(sel_getUid("toolbarLabelColor"), function $_CPHUDWindowView__toolbarLabelColor(self, _cmd)
{
    return CPColor.isa.objj_msgSend0(CPColor, "whiteColor");
}
,["CPColor"]), new objj_method(sel_getUid("toolbarLabelShadowColor"), function $_CPHUDWindowView__toolbarLabelShadowColor(self, _cmd)
{
    return CPColor.isa.objj_msgSend0(CPColor, "blackColor");
}
,["CPColor"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPHUDWindowView__toolbarOffset(self, _cmd)
{
    return CGSizeMake(0.0, ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "titleBarHeight")));
    var ___r1;
}
,["CGSize"]), new objj_method(sel_getUid("tile"), function $_CPHUDWindowView__tile(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPHUDWindowView").super_class }, "tile");
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        bounds = self.isa.objj_msgSend0(self, "bounds"),
        width = CGRectGetWidth(bounds);
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(20.0, 0, width - 40.0, self.isa.objj_msgSend0(self, "toolbarOffset").height)));
    var maxY = self.isa.objj_msgSend0(self, "toolbarMaxY");
    if (((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        maxY -= self.isa.objj_msgSend0(self, "toolbarOffset").height;
    var contentRect = CGRectMake(0.0, maxY, width, CGRectGetHeight(bounds) - maxY);
    ((___r1 = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", contentRect));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_enableSheet:inWindow:"), function $_CPHUDWindowView___enableSheet_inWindow_(self, _cmd, enable, parentWindow)
{
    ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", enable));
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", enable));
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        frame = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "frame")),
        dy = self.isa.objj_msgSend0(self, "toolbarOffset").height;
    if (enable)
        dy = -dy;
    var newHeight = CGRectGetMaxY(frame) + dy,
        newWidth = CGRectGetMaxX(frame);
    frame.size.height += dy;
    self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(newWidth, newHeight));
    self.isa.objj_msgSend0(self, "tile");
    (theWindow == null ? null : theWindow.isa.objj_msgSend3(theWindow, "setFrame:display:animate:", frame, NO, NO));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setMovableByWindowBackground:", !enable));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","BOOL","CPWindow"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPHUDWindowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPHUDWindowView").super_class }, "layoutSubviews");
    if (self._styleMask & CPClosableWindowMask)
    {
        ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "close-image-origin")));
        ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "close-image-size")));
        ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "close-image")));
        ((___r1 = self._closeButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlternateImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "close-active-image")));
    }
    var ___r1;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPHUDWindowView__defaultThemeClass(self, _cmd)
{
    return "hud-window-view";
}
,["CPString"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPHUDWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("_CPHUDWindowView").super_class }, "contentRectForFrameRect:", aFrameRect);
    contentRect.origin.x += 1;
    contentRect.size.width -= 2;
    contentRect.size.height -= 1;
    return contentRect;
}
,["CGRect","CGRect"])]);
}