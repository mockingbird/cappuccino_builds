@STATIC;1.0;i;11;CPControl.ji;21;_CPImageAndTextView.jt;12861;objj_executeFile("CPControl.j", YES);objj_executeFile("_CPImageAndTextView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemMenuBarView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_highlightColor"), new objj_ivar("_textColor"), new objj_ivar("_textShadowColor"), new objj_ivar("_highlightTextColor"), new objj_ivar("_highlightTextShadowColor"), new objj_ivar("_menuItem"), new objj_ivar("_font"), new objj_ivar("_isDirty"), new objj_ivar("_shouldHighlight"), new objj_ivar("_imageAndTextView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("highlightColor"), function $_CPMenuItemMenuBarView__highlightColor(self, _cmd)
{
    return self._highlightColor;
}
,["CPColor"]), new objj_method(sel_getUid("setHighlightColor:"), function $_CPMenuItemMenuBarView__setHighlightColor_(self, _cmd, newValue)
{
    self._highlightColor = newValue;
}
,["void","CPColor"]), new objj_method(sel_getUid("textColor"), function $_CPMenuItemMenuBarView__textColor(self, _cmd)
{
    return self._textColor;
}
,["CPColor"]), new objj_method(sel_getUid("setTextColor:"), function $_CPMenuItemMenuBarView__setTextColor_(self, _cmd, newValue)
{
    self._textColor = newValue;
}
,["void","CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPMenuItemMenuBarView__textShadowColor(self, _cmd)
{
    return self._textShadowColor;
}
,["CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPMenuItemMenuBarView__setTextShadowColor_(self, _cmd, newValue)
{
    self._textShadowColor = newValue;
}
,["void","CPColor"]), new objj_method(sel_getUid("highlightTextColor"), function $_CPMenuItemMenuBarView__highlightTextColor(self, _cmd)
{
    return self._highlightTextColor;
}
,["CPColor"]), new objj_method(sel_getUid("setHighlightTextColor:"), function $_CPMenuItemMenuBarView__setHighlightTextColor_(self, _cmd, newValue)
{
    self._highlightTextColor = newValue;
}
,["void","CPColor"]), new objj_method(sel_getUid("highlightTextShadowColor"), function $_CPMenuItemMenuBarView__highlightTextShadowColor(self, _cmd)
{
    return self._highlightTextShadowColor;
}
,["CPColor"]), new objj_method(sel_getUid("setHighlightTextShadowColor:"), function $_CPMenuItemMenuBarView__setHighlightTextShadowColor_(self, _cmd, newValue)
{
    self._highlightTextShadowColor = newValue;
}
,["void","CPColor"]), new objj_method(sel_getUid("menuItem"), function $_CPMenuItemMenuBarView__menuItem(self, _cmd)
{
    return self._menuItem;
}
,["CPMenuItem"]), new objj_method(sel_getUid("setMenuItem:"), function $_CPMenuItemMenuBarView__setMenuItem_(self, _cmd, newValue)
{
    self._menuItem = newValue;
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("initWithFrame:"), function $_CPMenuItemMenuBarView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuItemMenuBarView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._imageAndTextView = ((___r1 = _CPImageAndTextView.isa.objj_msgSend0(_CPImageAndTextView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake((self == null ? null : self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "horizontal-margin")), 0.0, 0.0, 0.0)));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImagePosition:", CPImageLeft));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImageOffset:", 3.0));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(0.0, 1.0)));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinYMargin | CPViewMaxYMargin));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._imageAndTextView));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    }
    return self;
    var ___r1;
}
,["id","CGRect"]), new objj_method(sel_getUid("setTextColor:"), function $_CPMenuItemMenuBarView__setTextColor_(self, _cmd, aColor)
{
    self._textColor = aColor;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPMenuItemMenuBarView__setTextShadowColor_(self, _cmd, aColor)
{
    self._textShadowColor = aColor;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("setHighlightTextColor:"), function $_CPMenuItemMenuBarView__setHighlightTextColor_(self, _cmd, aColor)
{
    self._highlightTextColor = aColor;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("setHighlightTextShadowColor:"), function $_CPMenuItemMenuBarView__setHighlightTextShadowColor_(self, _cmd, aColor)
{
    self._highlightTextShadowColor = aColor;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("textColor"), function $_CPMenuItemMenuBarView__textColor(self, _cmd)
{
    if (!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")))
        return CPColor.isa.objj_msgSend0(CPColor, "lightGrayColor");
    return self._textColor || ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-text-color", _CPMenuView));
    var ___r1;
}
,["CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPMenuItemMenuBarView__textShadowColor(self, _cmd)
{
    if (!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")))
        return CPColor.isa.objj_msgSend0(CPColor, "clearColor");
    return self._textShadowColor || ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-text-shadow-color", _CPMenuView));
    var ___r1;
}
,["CPColor"]), new objj_method(sel_getUid("highlightTextColor"), function $_CPMenuItemMenuBarView__highlightTextColor(self, _cmd)
{
    if (!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")))
        return CPColor.isa.objj_msgSend0(CPColor, "lightGrayColor");
    return self._highlightTextColor || ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-highlight-text-color", _CPMenuView));
    var ___r1;
}
,["CPColor"]), new objj_method(sel_getUid("highlightTextShadowColor"), function $_CPMenuItemMenuBarView__highlightTextShadowColor(self, _cmd)
{
    if (!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")))
        return CPColor.isa.objj_msgSend0(CPColor, "clearColor");
    return self._highlightTextShadowColor || ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-highlight-text-shadow-color", _CPMenuView));
    var ___r1;
}
,["CPColor"]), new objj_method(sel_getUid("highlightColor"), function $_CPMenuItemMenuBarView__highlightColor(self, _cmd)
{
    return self._highlightColor || ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-window-background-selected-color", _CPMenuView));
    var ___r1;
}
,["CPColor"]), new objj_method(sel_getUid("update"), function $_CPMenuItemMenuBarView__update(self, _cmd)
{
    var x = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "horizontal-margin"),
        height = 0.0;
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setText:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "title"))));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "font")) || (_CPMenuBarWindow == null ? null : _CPMenuBarWindow.isa.objj_msgSend0(_CPMenuBarWindow, "font"))));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setVerticalAlignment:", CPCenterVerticalTextAlignment));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(0.0, 1.0)));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image"))));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    var imageAndTextViewFrame = ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    imageAndTextViewFrame.origin.x = x;
    x += CGRectGetWidth(imageAndTextViewFrame);
    height = MAX(height, CGRectGetHeight(imageAndTextViewFrame)) + 2.0 * self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "vertical-margin");
    imageAndTextViewFrame.origin.y = FLOOR((height - CGRectGetHeight(imageAndTextViewFrame)) / 2.0);
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", imageAndTextViewFrame));
    self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", NO);
    self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(x + self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "horizontal-margin"), height));
    self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("highlight:"), function $_CPMenuItemMenuBarView__highlight_(self, _cmd, shouldHighlight)
{
    if (!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")))
        shouldHighlight = NO;
    self._shouldHighlight = shouldHighlight;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPMenuItemMenuBarView__layoutSubviews(self, _cmd)
{
    if (self._shouldHighlight)
    {
        if (!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_isMenuBarButton")))
            self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend0(self, "highlightColor"));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alternateImage")) || ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image"))));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", self.isa.objj_msgSend0(self, "highlightTextColor")));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend0(self, "highlightTextShadowColor")));
    }
    else
    {
        self.isa.objj_msgSend1(self, "setBackgroundColor:", nil);
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image"))));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", self.isa.objj_msgSend0(self, "textColor")));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend0(self, "textShadowColor")));
    }
    var ___r1, ___r2;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPMenuItemMenuBarView__defaultThemeClass(self, _cmd)
{
    return "menu-item-bar-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPMenuItemMenuBarView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 9.0, "horizontal-margin", 3.0, "submenu-indicator-margin", 4.0, "vertical-margin");
}
,["CPDictionary"]), new objj_method(sel_getUid("view"), function $_CPMenuItemMenuBarView__view(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"])]);
}