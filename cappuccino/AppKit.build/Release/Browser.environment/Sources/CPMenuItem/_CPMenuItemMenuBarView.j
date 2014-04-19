@STATIC;1.0;i;11;CPControl.ji;21;_CPImageAndTextView.jt;10234;objj_executeFile("CPControl.j", YES);objj_executeFile("_CPImageAndTextView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemMenuBarView"),
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
        self._imageAndTextView = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", CGRectMake(objj_msgSend(self, "valueForThemeAttribute:", "horizontal-margin"), 0.0, 0.0, 0.0));
        objj_msgSend(self._imageAndTextView, "setImagePosition:", CPImageLeft);
        objj_msgSend(self._imageAndTextView, "setImageOffset:", 3.0);
        objj_msgSend(self._imageAndTextView, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(self._imageAndTextView, "setAutoresizingMask:", CPViewMinYMargin | CPViewMaxYMargin);
        objj_msgSend(self, "addSubview:", self._imageAndTextView);
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setTextColor:"), function $_CPMenuItemMenuBarView__setTextColor_(self, _cmd, aColor)
{
    self._textColor = aColor;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPMenuItemMenuBarView__setTextShadowColor_(self, _cmd, aColor)
{
    self._textShadowColor = aColor;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("setHighlightTextColor:"), function $_CPMenuItemMenuBarView__setHighlightTextColor_(self, _cmd, aColor)
{
    self._highlightTextColor = aColor;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("setHighlightTextShadowColor:"), function $_CPMenuItemMenuBarView__setHighlightTextShadowColor_(self, _cmd, aColor)
{
    self._highlightTextShadowColor = aColor;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("textColor"), function $_CPMenuItemMenuBarView__textColor(self, _cmd)
{
    if (!objj_msgSend(self._menuItem, "isEnabled"))
        return objj_msgSend(CPColor, "lightGrayColor");
    return self._textColor || objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-text-color", _CPMenuView);
}
,["CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPMenuItemMenuBarView__textShadowColor(self, _cmd)
{
    if (!objj_msgSend(self._menuItem, "isEnabled"))
        return objj_msgSend(CPColor, "clearColor");
    return self._textShadowColor || objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-text-shadow-color", _CPMenuView);
}
,["CPColor"]), new objj_method(sel_getUid("highlightTextColor"), function $_CPMenuItemMenuBarView__highlightTextColor(self, _cmd)
{
    if (!objj_msgSend(self._menuItem, "isEnabled"))
        return objj_msgSend(CPColor, "lightGrayColor");
    return self._highlightTextColor || objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-highlight-text-color", _CPMenuView);
}
,["CPColor"]), new objj_method(sel_getUid("highlightTextShadowColor"), function $_CPMenuItemMenuBarView__highlightTextShadowColor(self, _cmd)
{
    if (!objj_msgSend(self._menuItem, "isEnabled"))
        return objj_msgSend(CPColor, "clearColor");
    return self._highlightTextShadowColor || objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-highlight-text-shadow-color", _CPMenuView);
}
,["CPColor"]), new objj_method(sel_getUid("highlightColor"), function $_CPMenuItemMenuBarView__highlightColor(self, _cmd)
{
    return self._highlightColor || objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-window-background-selected-color", _CPMenuView);
}
,["CPColor"]), new objj_method(sel_getUid("update"), function $_CPMenuItemMenuBarView__update(self, _cmd)
{
    var x = objj_msgSend(self, "valueForThemeAttribute:", "horizontal-margin"),
        height = 0.0;
    objj_msgSend(self._imageAndTextView, "setText:", objj_msgSend(self._menuItem, "title"));
    objj_msgSend(self._imageAndTextView, "setFont:", objj_msgSend(self._menuItem, "font") || objj_msgSend(_CPMenuBarWindow, "font"));
    objj_msgSend(self._imageAndTextView, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
    objj_msgSend(self._imageAndTextView, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
    objj_msgSend(self._imageAndTextView, "setImage:", objj_msgSend(self._menuItem, "image"));
    objj_msgSend(self._imageAndTextView, "sizeToFit");
    var imageAndTextViewFrame = objj_msgSend(self._imageAndTextView, "frame");
    imageAndTextViewFrame.origin.x = x;
    x += CGRectGetWidth(imageAndTextViewFrame);
    height = MAX(height, CGRectGetHeight(imageAndTextViewFrame)) + 2.0 * objj_msgSend(self, "valueForThemeAttribute:", "vertical-margin");
    imageAndTextViewFrame.origin.y = FLOOR((height - CGRectGetHeight(imageAndTextViewFrame)) / 2.0);
    objj_msgSend(self._imageAndTextView, "setFrame:", imageAndTextViewFrame);
    objj_msgSend(self, "setAutoresizesSubviews:", NO);
    objj_msgSend(self, "setFrameSize:", CGSizeMake(x + objj_msgSend(self, "valueForThemeAttribute:", "horizontal-margin"), height));
    objj_msgSend(self, "setAutoresizesSubviews:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("highlight:"), function $_CPMenuItemMenuBarView__highlight_(self, _cmd, shouldHighlight)
{
    if (!objj_msgSend(self._menuItem, "isEnabled"))
        shouldHighlight = NO;
    self._shouldHighlight = shouldHighlight;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPMenuItemMenuBarView__layoutSubviews(self, _cmd)
{
    if (self._shouldHighlight)
    {
        if (!objj_msgSend(self._menuItem, "_isMenuBarButton"))
            objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "highlightColor"));
        objj_msgSend(self._imageAndTextView, "setImage:", objj_msgSend(self._menuItem, "alternateImage") || objj_msgSend(self._menuItem, "image"));
        objj_msgSend(self._imageAndTextView, "setTextColor:", objj_msgSend(self, "highlightTextColor"));
        objj_msgSend(self._imageAndTextView, "setTextShadowColor:", objj_msgSend(self, "highlightTextShadowColor"));
    }
    else
    {
        objj_msgSend(self, "setBackgroundColor:", nil);
        objj_msgSend(self._imageAndTextView, "setImage:", objj_msgSend(self._menuItem, "image"));
        objj_msgSend(self._imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
        objj_msgSend(self._imageAndTextView, "setTextShadowColor:", objj_msgSend(self, "textShadowColor"));
    }
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
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
,["id"])]);
}