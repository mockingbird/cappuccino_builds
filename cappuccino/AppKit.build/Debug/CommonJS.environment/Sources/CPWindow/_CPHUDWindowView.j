@STATIC;1.0;i;10;CPButton.ji;13;CPTextField.ji;24;_CPTitleableWindowView.jt;6595;objj_executeFile("CPButton.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("_CPTitleableWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPTitleableWindowView, "_CPHUDWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbarView"), new objj_ivar("_closeButton")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPHUDWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect);
    if (objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "toolbar"), "isVisible"))
    {
        var toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(self, "toolbarView"), "frame"));
        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }
    return contentRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPHUDWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    var frameRect = objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect);
    if (objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "toolbar"), "isVisible"))
    {
        var toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(self, "toolbarView"), "frame"));
        frameRect.origin.y -= toolbarHeight;
        frameRect.size.height += toolbarHeight;
    }
    return frameRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPHUDWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPHUDWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        if (self._styleMask & CPClosableWindowMask)
        {
            self._closeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMakeZero());
            objj_msgSend(self._closeButton, "setBordered:", NO);
            objj_msgSend(self._closeButton, "setButtonType:", CPMomentaryChangeButton);
            objj_msgSend(self, "addSubview:", self._closeButton);
        }
        objj_msgSend(self, "setResizeIndicatorOffset:", CGSizeMake(5.0, 5.0));
        objj_msgSend(self, "tile");
    }
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $_CPHUDWindowView__viewDidMoveToWindow(self, _cmd)
{
    objj_msgSend(self._closeButton, "setTarget:", objj_msgSend(self, "window"));
    objj_msgSend(self._closeButton, "setAction:", sel_getUid("performClose:"));
}
,["void"]), new objj_method(sel_getUid("toolbarView"), function $_CPHUDWindowView__toolbarView(self, _cmd)
{
    return self._toolbarView;
}
,["_CPToolbarView"]), new objj_method(sel_getUid("toolbarLabelColor"), function $_CPHUDWindowView__toolbarLabelColor(self, _cmd)
{
    return objj_msgSend(CPColor, "whiteColor");
}
,["CPColor"]), new objj_method(sel_getUid("toolbarLabelShadowColor"), function $_CPHUDWindowView__toolbarLabelShadowColor(self, _cmd)
{
    return objj_msgSend(CPColor, "blackColor");
}
,["CPColor"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPHUDWindowView__toolbarOffset(self, _cmd)
{
    return CGSizeMake(0.0, objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight"));
}
,["CGSize"]), new objj_method(sel_getUid("tile"), function $_CPHUDWindowView__tile(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPHUDWindowView").super_class }, "tile");
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);
    objj_msgSend(self._titleField, "setFrame:", CGRectMake(20.0, 0, width - 40.0, objj_msgSend(self, "toolbarOffset").height));
    var maxY = objj_msgSend(self, "toolbarMaxY");
    if (objj_msgSend(self._titleField, "isHidden"))
        maxY -= objj_msgSend(self, "toolbarOffset").height;
    var contentRect = CGRectMake(0.0, maxY, width, CGRectGetHeight(bounds) - maxY);
    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrame:", contentRect);
}
,["void"]), new objj_method(sel_getUid("_enableSheet:inWindow:"), function $_CPHUDWindowView___enableSheet_inWindow_(self, _cmd, enable, parentWindow)
{
    objj_msgSend(self._closeButton, "setHidden:", enable);
    objj_msgSend(self._titleField, "setHidden:", enable);
    var theWindow = objj_msgSend(self, "window"),
        frame = objj_msgSend(theWindow, "frame"),
        dy = objj_msgSend(self, "toolbarOffset").height;
    if (enable)
        dy = -dy;
    var newHeight = CGRectGetMaxY(frame) + dy,
        newWidth = CGRectGetMaxX(frame);
    frame.size.height += dy;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(newWidth, newHeight));
    objj_msgSend(self, "tile");
    objj_msgSend(theWindow, "setFrame:display:animate:", frame, NO, NO);
    objj_msgSend(theWindow, "setMovableByWindowBackground:", !enable);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","BOOL","CPWindow"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPHUDWindowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPHUDWindowView").super_class }, "layoutSubviews");
    if (self._styleMask & CPClosableWindowMask)
    {
        objj_msgSend(self._closeButton, "setFrameOrigin:", objj_msgSend(self, "valueForThemeAttribute:", "close-image-origin"));
        objj_msgSend(self._closeButton, "setFrameSize:", objj_msgSend(self, "valueForThemeAttribute:", "close-image-size"));
        objj_msgSend(self._closeButton, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "close-image"));
        objj_msgSend(self._closeButton, "setAlternateImage:", objj_msgSend(self, "valueForThemeAttribute:", "close-active-image"));
    }
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