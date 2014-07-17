@STATIC;1.0;i;11;CPControl.ji;26;_CPMenuItemSeparatorView.ji;25;_CPMenuItemStandardView.ji;24;_CPMenuItemMenuBarView.jt;12068;objj_executeFile("CPControl.j", YES);objj_executeFile("_CPMenuItemSeparatorView.j", YES);objj_executeFile("_CPMenuItemStandardView.j", YES);objj_executeFile("_CPMenuItemMenuBarView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItem"), new objj_ivar("_view"), new objj_ivar("_font"), new objj_ivar("_textColor"), new objj_ivar("_textShadowColor"), new objj_ivar("_minSize"), new objj_ivar("_isDirty"), new objj_ivar("_showsStateColumn"), new objj_ivar("_imageAndTextView"), new objj_ivar("_submenuView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("view"), function $_CPMenuItemView__view(self, _cmd)
{
    return self._view;
}
,["CPView"]), new objj_method(sel_getUid("initWithFrame:forMenuItem:"), function $_CPMenuItemView__initWithFrame_forMenuItem_(self, _cmd, aFrame, aMenuItem)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuItemView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._menuItem = aMenuItem;
        self._showsStateColumn = YES;
        self._isDirty = YES;
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable));
        (self == null ? null : self.isa.objj_msgSend0(self, "synchronizeWithMenuItem"));
    }
    return self;
}
,["id","CGRect","CPMenuItem"]), new objj_method(sel_getUid("minSize"), function $_CPMenuItemView__minSize(self, _cmd)
{
    return self._minSize;
}
,["CGSize"]), new objj_method(sel_getUid("setDirty"), function $_CPMenuItemView__setDirty(self, _cmd)
{
    self._isDirty = YES;
}
,["void"]), new objj_method(sel_getUid("synchronizeWithMenuItem"), function $_CPMenuItemView__synchronizeWithMenuItem(self, _cmd)
{
    var menuItemView = ((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view"));
    if (((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isSeparatorItem")))
    {
        if (!((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", _CPMenuItemSeparatorView.isa.objj_msgSend0(_CPMenuItemSeparatorView, "class"))))
        {
            ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
            self._view = _CPMenuItemSeparatorView.isa.objj_msgSend0(_CPMenuItemSeparatorView, "view");
        }
    }
    else if (menuItemView)
    {
        if (self._view !== menuItemView)
        {
            ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
            self._view = menuItemView;
        }
    }
    else if (((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "menu")) == (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")))
    {
        if (!((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", _CPMenuItemMenuBarView.isa.objj_msgSend0(_CPMenuItemMenuBarView, "class"))))
        {
            ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
            self._view = _CPMenuItemMenuBarView.isa.objj_msgSend0(_CPMenuItemMenuBarView, "view");
        }
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMenuItem:", self._menuItem));
    }
    else
    {
        if (!((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", _CPMenuItemStandardView.isa.objj_msgSend0(_CPMenuItemStandardView, "class"))))
        {
            ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
            self._view = _CPMenuItemStandardView.isa.objj_msgSend0(_CPMenuItemStandardView, "view");
        }
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMenuItem:", self._menuItem));
    }
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "superview")) !== self)
        self.isa.objj_msgSend1(self, "addSubview:", self._view);
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("update"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
    self._minSize = ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size;
    self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", NO);
    self.isa.objj_msgSend1(self, "setFrameSize:", self._minSize);
    self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", YES);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setShowsStateColumn:"), function $_CPMenuItemView__setShowsStateColumn_(self, _cmd, shouldShowStateColumn)
{
    self._showsStateColumn = shouldShowStateColumn;
}
,["void","BOOL"]), new objj_method(sel_getUid("highlight:"), function $_CPMenuItemView__highlight_(self, _cmd, shouldHighlight)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("highlight:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "highlight:", shouldHighlight));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("eventOnSubmenu:"), function $_CPMenuItemView__eventOnSubmenu_(self, _cmd, anEvent)
{
    if (!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "hasSubmenu")))
        return NO;
    return CGRectContainsPoint(((___r1 = self._submenuView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")), self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil));
    var ___r1;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("isHidden"), function $_CPMenuItemView__isHidden(self, _cmd)
{
    return ((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("menuItem"), function $_CPMenuItemView__menuItem(self, _cmd)
{
    return self._menuItem;
}
,["CPMenuItem"]), new objj_method(sel_getUid("setFont:"), function $_CPMenuItemView__setFont_(self, _cmd, aFont)
{
    if (((___r1 = self._font), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", aFont)))
        return;
    self._font = aFont;
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setFont:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", aFont));
    self.isa.objj_msgSend0(self, "setDirty");
    var ___r1;
}
,["void","CPFont"]), new objj_method(sel_getUid("setTextColor:"), function $_CPMenuItemView__setTextColor_(self, _cmd, aColor)
{
    if (self._textColor == aColor)
        return;
    self._textColor = aColor;
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", self.isa.objj_msgSend0(self, "textColor")));
    ((___r1 = self._submenuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColor:", self.isa.objj_msgSend0(self, "textColor")));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("textColor"), function $_CPMenuItemView__textColor(self, _cmd)
{
    return nil;
}
,["CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPMenuItemView__setTextShadowColor_(self, _cmd, aColor)
{
    if (self._textShadowColor == aColor)
        return;
    self._textShadowColor = aColor;
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend0(self, "textShadowColor")));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPMenuItemView__textShadowColor(self, _cmd)
{
    return ((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")) ? self._textShadowColor ? self._textShadowColor : CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 1.0, 0.8) : CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 0.8, 0.8);
    var ___r1;
}
,["CPColor"]), new objj_method(sel_getUid("setParentMenuHighlightColor:"), function $_CPMenuItemView__setParentMenuHighlightColor_(self, _cmd, aColor)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setHighlightColor:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHighlightColor:", aColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setParentMenuHighlightTextColor:"), function $_CPMenuItemView__setParentMenuHighlightTextColor_(self, _cmd, aColor)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setHighlightTextColor:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHighlightTextColor:", aColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setParentMenuHighlightTextShadowColor:"), function $_CPMenuItemView__setParentMenuHighlightTextShadowColor_(self, _cmd, aColor)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setHighlightTextShadowColor:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHighlightTextShadowColor:", aColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setParentMenuTextColor:"), function $_CPMenuItemView__setParentMenuTextColor_(self, _cmd, aColor)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setTextColor:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", aColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setParentMenuTextShadowColor:"), function $_CPMenuItemView__setParentMenuTextShadowColor_(self, _cmd, aColor)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setTextShadowColor:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", aColor));
    var ___r1;
}
,["void","CPColor"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPMenuItemView__defaultThemeClass(self, _cmd)
{
    return "menu-item-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPMenuItemView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
}
,["CPDictionary"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemArrowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_color")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setColor:"), function $_CPMenuItemArrowView__setColor_(self, _cmd, aColor)
{
    if (self._color == aColor)
        return;
    self._color = aColor;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPColor"]), new objj_method(sel_getUid("drawRect:"), function $_CPMenuItemArrowView__drawRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 1.0, 4.0);
    CGContextAddLineToPoint(context, 9.0, 4.0);
    CGContextAddLineToPoint(context, 5.0, 8.0);
    CGContextClosePath(context);
    CGContextSetFillColor(context, self._color);
    CGContextFillPath(context);
    var ___r1;
}
,["void","CGRect"])]);
}