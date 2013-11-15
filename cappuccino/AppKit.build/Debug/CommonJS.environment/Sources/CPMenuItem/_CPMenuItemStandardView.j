@STATIC;1.0;i;11;CPControl.ji;13;CPImageView.ji;21;_CPImageAndTextView.jt;15594;objj_executeFile("CPControl.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("_CPImageAndTextView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemStandardView"),
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
        self._stateView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 0.0));
        objj_msgSend(self._stateView, "setImageScaling:", CPImageScaleNone);
        objj_msgSend(self, "addSubview:", self._stateView);
        self._imageAndTextView = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 0.0));
        objj_msgSend(self._imageAndTextView, "setImagePosition:", CPImageLeft);
        objj_msgSend(self._imageAndTextView, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(self, "addSubview:", self._imageAndTextView);
        self._keyEquivalentView = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 0.0));
        objj_msgSend(self._keyEquivalentView, "setImagePosition:", CPNoImage);
        objj_msgSend(self._keyEquivalentView, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(self._keyEquivalentView, "setAutoresizingMask:", CPViewMinXMargin);
        objj_msgSend(self, "addSubview:", self._keyEquivalentView);
        self._submenuIndicatorView = objj_msgSend(objj_msgSend(_CPMenuItemSubmenuIndicatorView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 8.0, 10.0));
        objj_msgSend(self._submenuIndicatorView, "setColor:", objj_msgSend(self, "valueForThemeAttribute:", "submenu-indicator-color"));
        objj_msgSend(self._submenuIndicatorView, "setAutoresizingMask:", CPViewMinXMargin);
        objj_msgSend(self, "addSubview:", self._submenuIndicatorView);
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("textColor"), function $_CPMenuItemStandardView__textColor(self, _cmd)
{
    if (!objj_msgSend(self._menuItem, "isEnabled"))
        return objj_msgSend(CPColor, "lightGrayColor");
    if (self._highlighted)
        return objj_msgSend(CPColor, "whiteColor");
    return objj_msgSend(self, "valueForThemeAttribute:", "menu-item-text-color");
}
,["CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPMenuItemStandardView__textShadowColor(self, _cmd)
{
    if (!objj_msgSend(self._menuItem, "isEnabled"))
        return nil;
    if (self._highlighted)
        return nil;
    return objj_msgSend(self, "valueForThemeAttribute:", "menu-item-text-shadow-color");
}
,["CPColor"]), new objj_method(sel_getUid("setFont:"), function $_CPMenuItemStandardView__setFont_(self, _cmd, aFont)
{
    self._font = aFont;
}
,["void","CPFont"]), new objj_method(sel_getUid("update"), function $_CPMenuItemStandardView__update(self, _cmd)
{
    var x = objj_msgSend(self, "valueForThemeAttribute:", "left-margin") + objj_msgSend(self._menuItem, "indentationLevel") * objj_msgSend(self, "valueForThemeAttribute:", "indentation-width"),
        height = 0.0,
        hasStateColumn = objj_msgSend(objj_msgSend(self._menuItem, "menu"), "showsStateColumn");
    if (hasStateColumn)
    {
        objj_msgSend(self._stateView, "setHidden:", NO);
        switch(objj_msgSend(self._menuItem, "state")) {
        case CPOnState:
            objj_msgSend(self._stateView, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "menu-item-default-on-state-image"));
            break;
        case CPOffState:
            objj_msgSend(self._stateView, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "menu-item-default-off-state-image"));
            break;
        case CPMixedState:
            objj_msgSend(self._stateView, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "menu-item-default-mixed-state-image"));
            break;
default:
            break;
        }
        x += objj_msgSend(self, "valueForThemeAttribute:", "state-column-width");
    }
    else
        objj_msgSend(self._stateView, "setHidden:", YES);
    objj_msgSend(self._imageAndTextView, "setFont:", objj_msgSend(self._menuItem, "font") || self._font);
    objj_msgSend(self._imageAndTextView, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
    objj_msgSend(self._imageAndTextView, "setImage:", objj_msgSend(self._menuItem, "image"));
    objj_msgSend(self._imageAndTextView, "setText:", objj_msgSend(self._menuItem, "title"));
    objj_msgSend(self._imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(self._imageAndTextView, "setTextShadowColor:", objj_msgSend(self, "textShadowColor"));
    objj_msgSend(self._imageAndTextView, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
    objj_msgSend(self._imageAndTextView, "sizeToFit");
    var imageAndTextViewFrame = objj_msgSend(self._imageAndTextView, "frame");
    imageAndTextViewFrame.origin.x = x;
    x += CGRectGetWidth(imageAndTextViewFrame);
    height = MAX(height, CGRectGetHeight(imageAndTextViewFrame));
    var hasKeyEquivalent = !!objj_msgSend(self._menuItem, "keyEquivalent"),
        hasSubmenu = objj_msgSend(self._menuItem, "hasSubmenu");
    if (hasKeyEquivalent || hasSubmenu)
        x += objj_msgSend(self, "valueForThemeAttribute:", "right-columns-margin");
    if (hasKeyEquivalent)
    {
        objj_msgSend(self._keyEquivalentView, "setFont:", objj_msgSend(self._menuItem, "font") || self._font);
        objj_msgSend(self._keyEquivalentView, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
        objj_msgSend(self._keyEquivalentView, "setImage:", objj_msgSend(self._menuItem, "image"));
        objj_msgSend(self._keyEquivalentView, "setText:", objj_msgSend(self._menuItem, "keyEquivalentStringRepresentation"));
        objj_msgSend(self._keyEquivalentView, "setTextColor:", objj_msgSend(self, "textColor"));
        objj_msgSend(self._keyEquivalentView, "setTextShadowColor:", objj_msgSend(self, "textShadowColor"));
        objj_msgSend(self._keyEquivalentView, "setTextShadowOffset:", CGSizeMake(0, 1));
        objj_msgSend(self._keyEquivalentView, "setFrameOrigin:", CGPointMake(x, objj_msgSend(self, "valueForThemeAttribute:", "vertical-margin")));
        objj_msgSend(self._keyEquivalentView, "sizeToFit");
        var keyEquivalentViewFrame = objj_msgSend(self._keyEquivalentView, "frame");
        keyEquivalentViewFrame.origin.x = x;
        x += CGRectGetWidth(keyEquivalentViewFrame);
        height = MAX(height, CGRectGetHeight(keyEquivalentViewFrame));
        if (hasSubmenu)
            x += objj_msgSend(self, "valueForThemeAttribute:", "right-columns-margin");
    }
    else
        objj_msgSend(self._keyEquivalentView, "setHidden:", YES);
    if (hasSubmenu)
    {
        objj_msgSend(self._submenuIndicatorView, "setHidden:", NO);
        var submenuViewFrame = objj_msgSend(self._submenuIndicatorView, "frame");
        submenuViewFrame.origin.x = x;
        x += CGRectGetWidth(submenuViewFrame);
        height = MAX(height, CGRectGetHeight(submenuViewFrame));
    }
    else
        objj_msgSend(self._submenuIndicatorView, "setHidden:", YES);
    height += 2.0 * objj_msgSend(self, "valueForThemeAttribute:", "vertical-margin");
    imageAndTextViewFrame.origin.y = FLOOR((height - CGRectGetHeight(imageAndTextViewFrame)) / 2.0);
    objj_msgSend(self._imageAndTextView, "setFrame:", imageAndTextViewFrame);
    if (hasStateColumn)
        objj_msgSend(self._stateView, "setFrameSize:", CGSizeMake(objj_msgSend(self, "valueForThemeAttribute:", "state-column-width"), height));
    if (hasKeyEquivalent)
    {
        keyEquivalentViewFrame.origin.y = FLOOR((height - CGRectGetHeight(keyEquivalentViewFrame)) / 2.0);
        objj_msgSend(self._keyEquivalentView, "setFrame:", keyEquivalentViewFrame);
    }
    if (hasSubmenu)
    {
        submenuViewFrame.origin.y = FLOOR((height - CGRectGetHeight(submenuViewFrame)) / 2.0);
        objj_msgSend(self._submenuIndicatorView, "setFrame:", submenuViewFrame);
    }
    self._minSize = CGSizeMake(x + objj_msgSend(self, "valueForThemeAttribute:", "right-margin"), height);
    objj_msgSend(self, "setAutoresizesSubviews:", NO);
    objj_msgSend(self, "setFrameSize:", self._minSize);
    objj_msgSend(self, "setAutoresizesSubviews:", YES);
}
,["void"]), new objj_method(sel_getUid("highlight:"), function $_CPMenuItemStandardView__highlight_(self, _cmd, shouldHighlight)
{
    if (!objj_msgSend(self._menuItem, "isEnabled"))
        return;
    self._highlighted = shouldHighlight;
    objj_msgSend(self._imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(self._keyEquivalentView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(self._imageAndTextView, "setTextShadowColor:", objj_msgSend(self, "textShadowColor"));
    objj_msgSend(self._keyEquivalentView, "setTextShadowColor:", objj_msgSend(self, "textShadowColor"));
    if (shouldHighlight)
    {
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "valueForThemeAttribute:", "menu-item-selection-color"));
        objj_msgSend(self._imageAndTextView, "setImage:", objj_msgSend(self._menuItem, "alternateImage") || objj_msgSend(self._menuItem, "image"));
        objj_msgSend(self._submenuIndicatorView, "setColor:", objj_msgSend(self, "textColor"));
    }
    else
    {
        objj_msgSend(self, "setBackgroundColor:", nil);
        objj_msgSend(self._imageAndTextView, "setImage:", objj_msgSend(self._menuItem, "image"));
        objj_msgSend(self._submenuIndicatorView, "setColor:", objj_msgSend(self, "valueForThemeAttribute:", "submenu-indicator-color"));
    }
    if (objj_msgSend(objj_msgSend(self._menuItem, "menu"), "showsStateColumn"))
    {
        if (shouldHighlight)
        {
            switch(objj_msgSend(self._menuItem, "state")) {
            case CPOnState:
                objj_msgSend(self._stateView, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "menu-item-default-on-state-highlighted-image"));
                break;
            case CPOffState:
                objj_msgSend(self._stateView, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "menu-item-default-off-state-highlighted-image"));
                break;
            case CPMixedState:
                objj_msgSend(self._stateView, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "menu-item-default-mixed-state-highlighted-image"));
                break;
default:
                break;
            }
        }
        else
        {
            switch(objj_msgSend(self._menuItem, "state")) {
            case CPOnState:
                objj_msgSend(self._stateView, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "menu-item-default-on-state-image"));
                break;
            case CPOffState:
                objj_msgSend(self._stateView, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "menu-item-default-off-state-image"));
                break;
            case CPMixedState:
                objj_msgSend(self._stateView, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "menu-item-default-mixed-state-image"));
                break;
default:
                break;
            }
        }
    }
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
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "submenu-indicator-color", objj_msgSend(CPNull, "null"), "menu-item-selection-color", objj_msgSend(CPNull, "null"), "menu-item-text-shadow-color", objj_msgSend(CPNull, "null"), "menu-item-text-color", objj_msgSend(CPNull, "null"), "menu-item-default-off-state-image", objj_msgSend(CPNull, "null"), "menu-item-default-off-state-highlighted-image", objj_msgSend(CPNull, "null"), "menu-item-default-on-state-image", objj_msgSend(CPNull, "null"), "menu-item-default-on-state-highlighted-image", objj_msgSend(CPNull, "null"), "menu-item-default-mixed-state-image", objj_msgSend(CPNull, "null"), "menu-item-default-mixed-state-highlighted-image", objj_msgSend(CPNull, "null"), "menu-item-separator-color", 3.0, "left-margin", 17.0, "right-margin", 14.0, "state-column-width", 17.0, "indentation-width", 4.0, "vertical-margin", 30.0, "right-columns-margin");
}
,["id"]), new objj_method(sel_getUid("view"), function $_CPMenuItemStandardView__view(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
,["id"]), new objj_method(sel_getUid("_standardLeftMargin"), function $_CPMenuItemStandardView___standardLeftMargin(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "left-margin", objj_msgSend(self, "class")) + objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "state-column-width", objj_msgSend(self, "class"));
}
,["float"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemSubmenuIndicatorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_color")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setColor:"), function $_CPMenuItemSubmenuIndicatorView__setColor_(self, _cmd, aColor)
{
    if (self._color === aColor)
        return;
    self._color = aColor;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPColor"]), new objj_method(sel_getUid("drawRect:"), function $_CPMenuItemSubmenuIndicatorView__drawRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        bounds = objj_msgSend(self, "bounds");
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
    CGContextAddLineToPoint(context, CGRectGetMaxX(bounds), CGRectGetMidY(bounds));
    CGContextAddLineToPoint(context, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
    CGContextClosePath(context);
    CGContextSetFillColor(context, self._color);
    CGContextFillPath(context);
}
,["void","CGRect"])]);
}