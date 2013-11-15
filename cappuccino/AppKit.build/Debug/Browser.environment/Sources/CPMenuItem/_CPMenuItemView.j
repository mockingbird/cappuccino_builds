@STATIC;1.0;i;11;CPControl.ji;26;_CPMenuItemSeparatorView.ji;25;_CPMenuItemStandardView.ji;24;_CPMenuItemMenuBarView.jt;9314;objj_executeFile("CPControl.j", YES);objj_executeFile("_CPMenuItemSeparatorView.j", YES);objj_executeFile("_CPMenuItemStandardView.j", YES);objj_executeFile("_CPMenuItemMenuBarView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemView"),
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
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self, "synchronizeWithMenuItem");
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
    var menuItemView = objj_msgSend(self._menuItem, "view");
    if (objj_msgSend(self._menuItem, "isSeparatorItem"))
    {
        if (!objj_msgSend(self._view, "isKindOfClass:", objj_msgSend(_CPMenuItemSeparatorView, "class")))
        {
            objj_msgSend(self._view, "removeFromSuperview");
            self._view = objj_msgSend(_CPMenuItemSeparatorView, "view");
        }
    }
    else if (menuItemView)
    {
        if (self._view !== menuItemView)
        {
            objj_msgSend(self._view, "removeFromSuperview");
            self._view = menuItemView;
        }
    }
    else if (objj_msgSend(self._menuItem, "menu") == objj_msgSend(CPApp, "mainMenu"))
    {
        if (!objj_msgSend(self._view, "isKindOfClass:", objj_msgSend(_CPMenuItemMenuBarView, "class")))
        {
            objj_msgSend(self._view, "removeFromSuperview");
            self._view = objj_msgSend(_CPMenuItemMenuBarView, "view");
        }
        objj_msgSend(self._view, "setMenuItem:", self._menuItem);
    }
    else
    {
        if (!objj_msgSend(self._view, "isKindOfClass:", objj_msgSend(_CPMenuItemStandardView, "class")))
        {
            objj_msgSend(self._view, "removeFromSuperview");
            self._view = objj_msgSend(_CPMenuItemStandardView, "view");
        }
        objj_msgSend(self._view, "setMenuItem:", self._menuItem);
    }
    if (objj_msgSend(self._view, "superview") !== self)
        objj_msgSend(self, "addSubview:", self._view);
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("update")))
        objj_msgSend(self._view, "update");
    self._minSize = objj_msgSend(self._view, "frame").size;
    objj_msgSend(self, "setAutoresizesSubviews:", NO);
    objj_msgSend(self, "setFrameSize:", self._minSize);
    objj_msgSend(self, "setAutoresizesSubviews:", YES);
}
,["void"]), new objj_method(sel_getUid("setShowsStateColumn:"), function $_CPMenuItemView__setShowsStateColumn_(self, _cmd, shouldShowStateColumn)
{
    self._showsStateColumn = shouldShowStateColumn;
}
,["void","BOOL"]), new objj_method(sel_getUid("highlight:"), function $_CPMenuItemView__highlight_(self, _cmd, shouldHighlight)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("highlight:")))
        objj_msgSend(self._view, "highlight:", shouldHighlight);
}
,["void","BOOL"]), new objj_method(sel_getUid("eventOnSubmenu:"), function $_CPMenuItemView__eventOnSubmenu_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self._menuItem, "hasSubmenu"))
        return NO;
    return CGRectContainsPoint(objj_msgSend(self._submenuView, "frame"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil));
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("isHidden"), function $_CPMenuItemView__isHidden(self, _cmd)
{
    return objj_msgSend(self._menuItem, "isHidden");
}
,["BOOL"]), new objj_method(sel_getUid("menuItem"), function $_CPMenuItemView__menuItem(self, _cmd)
{
    return self._menuItem;
}
,["CPMenuItem"]), new objj_method(sel_getUid("setFont:"), function $_CPMenuItemView__setFont_(self, _cmd, aFont)
{
    if (objj_msgSend(self._font, "isEqual:", aFont))
        return;
    self._font = aFont;
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setFont:")))
        objj_msgSend(self._view, "setFont:", aFont);
    objj_msgSend(self, "setDirty");
}
,["void","CPFont"]), new objj_method(sel_getUid("setTextColor:"), function $_CPMenuItemView__setTextColor_(self, _cmd, aColor)
{
    if (self._textColor == aColor)
        return;
    self._textColor = aColor;
    objj_msgSend(self._imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(self._submenuView, "setColor:", objj_msgSend(self, "textColor"));
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
    objj_msgSend(self._imageAndTextView, "setTextShadowColor:", objj_msgSend(self, "textShadowColor"));
}
,["void","CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPMenuItemView__textShadowColor(self, _cmd)
{
    return objj_msgSend(self._menuItem, "isEnabled") ? self._textShadowColor ? self._textShadowColor : objj_msgSend(CPColor, "colorWithWhite:alpha:", 1.0, 0.8) : objj_msgSend(CPColor, "colorWithWhite:alpha:", 0.8, 0.8);
}
,["CPColor"]), new objj_method(sel_getUid("setParentMenuHighlightColor:"), function $_CPMenuItemView__setParentMenuHighlightColor_(self, _cmd, aColor)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setHighlightColor:")))
        objj_msgSend(self._view, "setHighlightColor:", aColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("setParentMenuHighlightTextColor:"), function $_CPMenuItemView__setParentMenuHighlightTextColor_(self, _cmd, aColor)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setHighlightTextColor:")))
        objj_msgSend(self._view, "setHighlightTextColor:", aColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("setParentMenuHighlightTextShadowColor:"), function $_CPMenuItemView__setParentMenuHighlightTextShadowColor_(self, _cmd, aColor)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setHighlightTextShadowColor:")))
        objj_msgSend(self._view, "setHighlightTextShadowColor:", aColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("setParentMenuTextColor:"), function $_CPMenuItemView__setParentMenuTextColor_(self, _cmd, aColor)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setTextColor:")))
        objj_msgSend(self._view, "setTextColor:", aColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("setParentMenuTextShadowColor:"), function $_CPMenuItemView__setParentMenuTextShadowColor_(self, _cmd, aColor)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setTextShadowColor:")))
        objj_msgSend(self._view, "setTextShadowColor:", aColor);
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
,["id"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemArrowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_color")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setColor:"), function $_CPMenuItemArrowView__setColor_(self, _cmd, aColor)
{
    if (self._color == aColor)
        return;
    self._color = aColor;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPColor"]), new objj_method(sel_getUid("drawRect:"), function $_CPMenuItemArrowView__drawRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 1.0, 4.0);
    CGContextAddLineToPoint(context, 9.0, 4.0);
    CGContextAddLineToPoint(context, 5.0, 8.0);
    CGContextClosePath(context);
    CGContextSetFillColor(context, self._color);
    CGContextFillPath(context);
}
,["void","CGRect"])]);
}