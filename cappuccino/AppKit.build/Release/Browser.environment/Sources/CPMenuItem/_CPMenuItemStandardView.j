@STATIC;1.0;i;11;CPControl.ji;13;CPImageView.ji;21;_CPImageAndTextView.jt;21166;objj_executeFile("CPControl.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("_CPImageAndTextView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemStandardView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItem"), new objj_ivar("_font"), new objj_ivar("_minSize"), new objj_ivar("_isDirty"), new objj_ivar("_highlighted"), new objj_ivar("_stateView"), new objj_ivar("_imageAndTextView"), new objj_ivar("_keyEquivalentView"), new objj_ivar("_submenuIndicatorView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("menuItem"), function $_CPMenuItemStandardView__menuItem(self, _cmd)
{
    return self._menuItem;
}
,["CPMenuItem"]), new objj_method(sel_getUid("setMenuItem:"), function $_CPMenuItemStandardView__setMenuItem_(self, _cmd, newValue)
{
    self._menuItem = newValue;
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("minSize"), function $_CPMenuItemStandardView__minSize(self, _cmd)
{
    return self._minSize;
}
,["CGSize"]), new objj_method(sel_getUid("initWithFrame:"), function $_CPMenuItemStandardView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuItemStandardView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._stateView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 0.0)));
        ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImageScaling:", CPImageScaleNone));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._stateView));
        self._imageAndTextView = ((___r1 = _CPImageAndTextView.isa.objj_msgSend0(_CPImageAndTextView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 0.0)));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImagePosition:", CPImageLeft));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(0.0, 1.0)));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._imageAndTextView));
        self._keyEquivalentView = ((___r1 = _CPImageAndTextView.isa.objj_msgSend0(_CPImageAndTextView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 0.0)));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImagePosition:", CPNoImage));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(0.0, 1.0)));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._keyEquivalentView));
        self._submenuIndicatorView = ((___r1 = (_CPMenuItemSubmenuIndicatorView == null ? null : _CPMenuItemSubmenuIndicatorView.isa.objj_msgSend0(_CPMenuItemSubmenuIndicatorView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 8.0, 10.0)));
        ((___r1 = self._submenuIndicatorView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColor:", (self == null ? null : self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "submenu-indicator-color"))));
        ((___r1 = self._submenuIndicatorView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._submenuIndicatorView));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable));
    }
    return self;
    var ___r1;
}
,["id","CGRect"]), new objj_method(sel_getUid("textColor"), function $_CPMenuItemStandardView__textColor(self, _cmd)
{
    if (!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")))
        return CPColor.isa.objj_msgSend0(CPColor, "lightGrayColor");
    if (self._highlighted)
        return CPColor.isa.objj_msgSend0(CPColor, "whiteColor");
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-text-color");
    var ___r1;
}
,["CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPMenuItemStandardView__textShadowColor(self, _cmd)
{
    if (!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")))
        return nil;
    if (self._highlighted)
        return nil;
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-text-shadow-color");
    var ___r1;
}
,["CPColor"]), new objj_method(sel_getUid("setFont:"), function $_CPMenuItemStandardView__setFont_(self, _cmd, aFont)
{
    self._font = aFont;
}
,["void","CPFont"]), new objj_method(sel_getUid("update"), function $_CPMenuItemStandardView__update(self, _cmd)
{
    var x = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "left-margin") + ((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "indentationLevel")) * self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "indentation-width"),
        height = 0.0,
        hasStateColumn = ((___r1 = ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "menu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "showsStateColumn"));
    if (hasStateColumn)
    {
        ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        switch(((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "state"))) {
        case CPOnState:
            ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-default-on-state-image")));
            break;
        case CPOffState:
            ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-default-off-state-image")));
            break;
        case CPMixedState:
            ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-default-mixed-state-image")));
            break;
default:
            break;
        }
        x += self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "state-column-width");
    }
    else
        ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "font")) || self._font));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setVerticalAlignment:", CPCenterVerticalTextAlignment));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image"))));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setText:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "title"))));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", self.isa.objj_msgSend0(self, "textColor")));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend0(self, "textShadowColor")));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(0.0, 1.0)));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    var imageAndTextViewFrame = ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    imageAndTextViewFrame.origin.x = x;
    x += CGRectGetWidth(imageAndTextViewFrame);
    height = MAX(height, CGRectGetHeight(imageAndTextViewFrame));
    var hasKeyEquivalent = !!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyEquivalent")),
        hasSubmenu = ((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "hasSubmenu"));
    if (hasKeyEquivalent || hasSubmenu)
        x += self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "right-columns-margin");
    if (hasKeyEquivalent)
    {
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "font")) || self._font));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setVerticalAlignment:", CPCenterVerticalTextAlignment));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image"))));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setText:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "keyEquivalentStringRepresentation"))));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", self.isa.objj_msgSend0(self, "textColor")));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend0(self, "textShadowColor")));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(0, 1)));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(x, self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "vertical-margin"))));
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
        var keyEquivalentViewFrame = ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
        keyEquivalentViewFrame.origin.x = x;
        x += CGRectGetWidth(keyEquivalentViewFrame);
        height = MAX(height, CGRectGetHeight(keyEquivalentViewFrame));
        if (hasSubmenu)
            x += self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "right-columns-margin");
    }
    else
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    if (hasSubmenu)
    {
        ((___r1 = self._submenuIndicatorView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        var submenuViewFrame = ((___r1 = self._submenuIndicatorView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
        submenuViewFrame.origin.x = x;
        x += CGRectGetWidth(submenuViewFrame);
        height = MAX(height, CGRectGetHeight(submenuViewFrame));
    }
    else
        ((___r1 = self._submenuIndicatorView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    height += 2.0 * self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "vertical-margin");
    imageAndTextViewFrame.origin.y = FLOOR((height - CGRectGetHeight(imageAndTextViewFrame)) / 2.0);
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", imageAndTextViewFrame));
    if (hasStateColumn)
        ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "state-column-width"), height)));
    if (hasKeyEquivalent)
    {
        keyEquivalentViewFrame.origin.y = FLOOR((height - CGRectGetHeight(keyEquivalentViewFrame)) / 2.0);
        ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", keyEquivalentViewFrame));
    }
    if (hasSubmenu)
    {
        submenuViewFrame.origin.y = FLOOR((height - CGRectGetHeight(submenuViewFrame)) / 2.0);
        ((___r1 = self._submenuIndicatorView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", submenuViewFrame));
    }
    self._minSize = CGSizeMake(x + self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "right-margin"), height);
    self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", NO);
    self.isa.objj_msgSend1(self, "setFrameSize:", self._minSize);
    self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", YES);
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("highlight:"), function $_CPMenuItemStandardView__highlight_(self, _cmd, shouldHighlight)
{
    if (!((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")))
        return;
    self._highlighted = shouldHighlight;
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", self.isa.objj_msgSend0(self, "textColor")));
    ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", self.isa.objj_msgSend0(self, "textColor")));
    ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend0(self, "textShadowColor")));
    ((___r1 = self._keyEquivalentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend0(self, "textShadowColor")));
    if (shouldHighlight)
    {
        self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-selection-color"));
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alternateImage")) || ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image"))));
        ((___r1 = self._submenuIndicatorView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColor:", self.isa.objj_msgSend0(self, "textColor")));
    }
    else
    {
        self.isa.objj_msgSend1(self, "setBackgroundColor:", nil);
        ((___r1 = self._imageAndTextView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image"))));
        ((___r1 = self._submenuIndicatorView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "submenu-indicator-color")));
    }
    if (((___r1 = ((___r2 = self._menuItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "menu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "showsStateColumn")))
    {
        if (shouldHighlight)
        {
            switch(((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "state"))) {
            case CPOnState:
                ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-default-on-state-highlighted-image")));
                break;
            case CPOffState:
                ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-default-off-state-highlighted-image")));
                break;
            case CPMixedState:
                ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-default-mixed-state-highlighted-image")));
                break;
default:
                break;
            }
        }
        else
        {
            switch(((___r1 = self._menuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "state"))) {
            case CPOnState:
                ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-default-on-state-image")));
                break;
            case CPOffState:
                ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-default-off-state-image")));
                break;
            case CPMixedState:
                ((___r1 = self._stateView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "menu-item-default-mixed-state-image")));
                break;
default:
                break;
            }
        }
    }
    var ___r1, ___r2;
}
,["void","BOOL"]), new objj_method(sel_getUid("isHighlighted"), function $_CPMenuItemStandardView__isHighlighted(self, _cmd)
{
    return self._highlighted;
}
,["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPMenuItemStandardView__defaultThemeClass(self, _cmd)
{
    return "menu-item-standard-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPMenuItemStandardView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "submenu-indicator-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-item-selection-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-item-text-shadow-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-item-text-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-item-default-off-state-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-item-default-off-state-highlighted-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-item-default-on-state-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-item-default-on-state-highlighted-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-item-default-mixed-state-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-item-default-mixed-state-highlighted-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-item-separator-color", 3.0, "left-margin", 17.0, "right-margin", 14.0, "state-column-width", 17.0, "indentation-width", 4.0, "vertical-margin", 30.0, "right-columns-margin");
}
,["CPDictionary"]), new objj_method(sel_getUid("view"), function $_CPMenuItemStandardView__view(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("_standardLeftMargin"), function $_CPMenuItemStandardView___standardLeftMargin(self, _cmd)
{
    return ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "left-margin", self.isa.objj_msgSend0(self, "class"))) + ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "state-column-width", self.isa.objj_msgSend0(self, "class")));
    var ___r1;
}
,["float"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemSubmenuIndicatorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_color")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setColor:"), function $_CPMenuItemSubmenuIndicatorView__setColor_(self, _cmd, aColor)
{
    if (self._color === aColor)
        return;
    self._color = aColor;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPColor"]), new objj_method(sel_getUid("drawRect:"), function $_CPMenuItemSubmenuIndicatorView__drawRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        bounds = self.isa.objj_msgSend0(self, "bounds");
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
    CGContextAddLineToPoint(context, CGRectGetMaxX(bounds), CGRectGetMidY(bounds));
    CGContextAddLineToPoint(context, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
    CGContextClosePath(context);
    CGContextSetFillColor(context, self._color);
    CGContextFillPath(context);
    var ___r1;
}
,["void","CGRect"])]);
}