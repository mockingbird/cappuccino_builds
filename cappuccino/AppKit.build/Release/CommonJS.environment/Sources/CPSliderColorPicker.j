@STATIC;1.0;i;15;CPColorPicker.ji;10;CPSlider.ji;13;CPTextField.ji;8;CPView.jt;18143;objj_executeFile("CPColorPicker.j", YES);objj_executeFile("CPSlider.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPView.j", YES);{var the_class = objj_allocateClassPair(CPColorPicker, "CPSliderColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_redSlider"), new objj_ivar("_greenSlider"), new objj_ivar("_blueSlider"), new objj_ivar("_hueSlider"), new objj_ivar("_saturationSlider"), new objj_ivar("_brightnessSlider"), new objj_ivar("_rgbLabel"), new objj_ivar("_hsbLabel"), new objj_ivar("_redLabel"), new objj_ivar("_greenLabel"), new objj_ivar("_blueLabel"), new objj_ivar("_hueLabel"), new objj_ivar("_saturationLabel"), new objj_ivar("_brightnessLabel"), new objj_ivar("_hexLabel"), new objj_ivar("_hexValue"), new objj_ivar("_redValue"), new objj_ivar("_greenValue"), new objj_ivar("_blueValue"), new objj_ivar("_hueValue"), new objj_ivar("_saturationValue"), new objj_ivar("_brightnessValue")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function $CPSliderColorPicker__initWithPickerMask_colorPanel_(self, _cmd, mask, owningColorPanel)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSliderColorPicker").super_class }, "initWithPickerMask:colorPanel:", mask, owningColorPanel);
}
,["id","int","CPColorPanel"]), new objj_method(sel_getUid("initView"), function $CPSliderColorPicker__initView(self, _cmd)
{
    var aFrame = CGRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    self._contentView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aFrame);
    objj_msgSend(self._contentView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    self._rgbLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 10, 100, 20));
    objj_msgSend(self._rgbLabel, "setStringValue:", "Red, Green, Blue");
    objj_msgSend(self._rgbLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    self._redLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 37, 15, 20));
    objj_msgSend(self._redLabel, "setStringValue:", "R");
    objj_msgSend(self._redLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    self._redSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(15, 35, aFrame.size.width - 70, 20));
    objj_msgSend(self._redSlider, "setMaxValue:", 1.0);
    objj_msgSend(self._redSlider, "setMinValue:", 0.0);
    objj_msgSend(self._redSlider, "setTarget:", self);
    objj_msgSend(self._redSlider, "setAction:", sel_getUid("sliderChanged:"));
    objj_msgSend(self._redSlider, "setAutoresizingMask:", CPViewWidthSizable);
    self._redValue = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(aFrame.size.width - 45, 30, 45, 28));
    objj_msgSend(self._redValue, "setAutoresizingMask:", CPViewMinXMargin);
    objj_msgSend(self._redValue, "setEditable:", YES);
    objj_msgSend(self._redValue, "setBezeled:", YES);
    objj_msgSend(self._redValue, "setDelegate:", self);
    objj_msgSend(self._contentView, "addSubview:", self._redValue);
    self._greenLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 63, 15, 20));
    objj_msgSend(self._greenLabel, "setStringValue:", "G");
    objj_msgSend(self._greenLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    self._greenSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(15, 61, aFrame.size.width - 70, 20));
    objj_msgSend(self._greenSlider, "setMaxValue:", 1.0);
    objj_msgSend(self._greenSlider, "setMinValue:", 0.0);
    objj_msgSend(self._greenSlider, "setTarget:", self);
    objj_msgSend(self._greenSlider, "setAction:", sel_getUid("sliderChanged:"));
    objj_msgSend(self._greenSlider, "setAutoresizingMask:", CPViewWidthSizable);
    self._greenValue = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(aFrame.size.width - 45, 56, 45, 28));
    objj_msgSend(self._greenValue, "setAutoresizingMask:", CPViewMinXMargin);
    objj_msgSend(self._greenValue, "setEditable:", YES);
    objj_msgSend(self._greenValue, "setBezeled:", YES);
    objj_msgSend(self._greenValue, "setDelegate:", self);
    objj_msgSend(self._contentView, "addSubview:", self._greenValue);
    self._blueLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 90, 15, 20));
    objj_msgSend(self._blueLabel, "setStringValue:", "B");
    objj_msgSend(self._blueLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    self._blueSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(15, 87, aFrame.size.width - 70, 20));
    objj_msgSend(self._blueSlider, "setMaxValue:", 1.0);
    objj_msgSend(self._blueSlider, "setMinValue:", 0.0);
    objj_msgSend(self._blueSlider, "setTarget:", self);
    objj_msgSend(self._blueSlider, "setAction:", sel_getUid("sliderChanged:"));
    objj_msgSend(self._blueSlider, "setAutoresizingMask:", CPViewWidthSizable);
    self._blueValue = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(aFrame.size.width - 45, 82, 45, 28));
    objj_msgSend(self._blueValue, "setAutoresizingMask:", CPViewMinXMargin);
    objj_msgSend(self._blueValue, "setEditable:", YES);
    objj_msgSend(self._blueValue, "setBezeled:", YES);
    objj_msgSend(self._blueValue, "setDelegate:", self);
    objj_msgSend(self._contentView, "addSubview:", self._blueValue);
    self._hsbLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 120, 190, 20));
    objj_msgSend(self._hsbLabel, "setStringValue:", "Hue, Saturation, Brightness");
    objj_msgSend(self._hsbLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    self._hueLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 145, 15, 20));
    objj_msgSend(self._hueLabel, "setStringValue:", "H");
    objj_msgSend(self._hueLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    self._hueSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(15, 143, aFrame.size.width - 70, 20));
    objj_msgSend(self._hueSlider, "setMaxValue:", 0.999);
    objj_msgSend(self._hueSlider, "setMinValue:", 0.0);
    objj_msgSend(self._hueSlider, "setTarget:", self);
    objj_msgSend(self._hueSlider, "setAction:", sel_getUid("sliderChanged:"));
    objj_msgSend(self._hueSlider, "setAutoresizingMask:", CPViewWidthSizable);
    self._hueValue = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(aFrame.size.width - 45, 138, 45, 28));
    objj_msgSend(self._hueValue, "setAutoresizingMask:", CPViewMinXMargin);
    objj_msgSend(self._hueValue, "setEditable:", YES);
    objj_msgSend(self._hueValue, "setBezeled:", YES);
    objj_msgSend(self._hueValue, "setDelegate:", self);
    objj_msgSend(self._contentView, "addSubview:", self._hueValue);
    self._saturationLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 170, 15, 20));
    objj_msgSend(self._saturationLabel, "setStringValue:", "S");
    objj_msgSend(self._saturationLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    self._saturationSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(15, 168, aFrame.size.width - 70, 20));
    objj_msgSend(self._saturationSlider, "setMaxValue:", 1.0);
    objj_msgSend(self._saturationSlider, "setMinValue:", 0.0);
    objj_msgSend(self._saturationSlider, "setTarget:", self);
    objj_msgSend(self._saturationSlider, "setAction:", sel_getUid("sliderChanged:"));
    objj_msgSend(self._saturationSlider, "setAutoresizingMask:", CPViewWidthSizable);
    self._saturationValue = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(aFrame.size.width - 45, 164, 45, 28));
    objj_msgSend(self._saturationValue, "setAutoresizingMask:", CPViewMinXMargin);
    objj_msgSend(self._saturationValue, "setEditable:", YES);
    objj_msgSend(self._saturationValue, "setBezeled:", YES);
    objj_msgSend(self._saturationValue, "setDelegate:", self);
    objj_msgSend(self._contentView, "addSubview:", self._saturationValue);
    self._brightnessLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 196, 15, 20));
    objj_msgSend(self._brightnessLabel, "setStringValue:", "B");
    objj_msgSend(self._brightnessLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    self._brightnessSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(15, 194, aFrame.size.width - 70, 20));
    objj_msgSend(self._brightnessSlider, "setMaxValue:", 1.0);
    objj_msgSend(self._brightnessSlider, "setMinValue:", 0.0);
    objj_msgSend(self._brightnessSlider, "setTarget:", self);
    objj_msgSend(self._brightnessSlider, "setAction:", sel_getUid("sliderChanged:"));
    objj_msgSend(self._brightnessSlider, "setAutoresizingMask:", CPViewWidthSizable);
    self._brightnessValue = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(aFrame.size.width - 45, 190, 45, 28));
    objj_msgSend(self._brightnessValue, "setAutoresizingMask:", CPViewMinXMargin);
    objj_msgSend(self._brightnessValue, "setEditable:", YES);
    objj_msgSend(self._brightnessValue, "setBezeled:", YES);
    objj_msgSend(self._brightnessValue, "setDelegate:", self);
    objj_msgSend(self._contentView, "addSubview:", self._brightnessValue);
    self._hexLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 230, 30, 20));
    objj_msgSend(self._hexLabel, "setStringValue:", "Hex");
    objj_msgSend(self._hexLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    self._hexValue = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(32, 225, 80, 28));
    objj_msgSend(self._hexValue, "setEditable:", YES);
    objj_msgSend(self._hexValue, "setBezeled:", YES);
    objj_msgSend(self._hexValue, "setDelegate:", self);
    objj_msgSend(self._contentView, "addSubview:", self._hexValue);
    objj_msgSend(self._contentView, "addSubview:", self._rgbLabel);
    objj_msgSend(self._contentView, "addSubview:", self._redLabel);
    objj_msgSend(self._contentView, "addSubview:", self._greenLabel);
    objj_msgSend(self._contentView, "addSubview:", self._blueLabel);
    objj_msgSend(self._contentView, "addSubview:", self._redSlider);
    objj_msgSend(self._contentView, "addSubview:", self._greenSlider);
    objj_msgSend(self._contentView, "addSubview:", self._blueSlider);
    objj_msgSend(self._contentView, "addSubview:", self._hsbLabel);
    objj_msgSend(self._contentView, "addSubview:", self._hueLabel);
    objj_msgSend(self._contentView, "addSubview:", self._saturationLabel);
    objj_msgSend(self._contentView, "addSubview:", self._brightnessLabel);
    objj_msgSend(self._contentView, "addSubview:", self._hueSlider);
    objj_msgSend(self._contentView, "addSubview:", self._saturationSlider);
    objj_msgSend(self._contentView, "addSubview:", self._brightnessSlider);
    objj_msgSend(self._contentView, "addSubview:", self._hexLabel);
}
,["id"]), new objj_method(sel_getUid("provideNewView:"), function $CPSliderColorPicker__provideNewView_(self, _cmd, initialRequest)
{
    if (initialRequest)
        objj_msgSend(self, "initView");
    return self._contentView;
}
,["CPView","BOOL"]), new objj_method(sel_getUid("currentMode"), function $CPSliderColorPicker__currentMode(self, _cmd)
{
    return CPSliderColorPickerMode;
}
,["int"]), new objj_method(sel_getUid("supportsMode:"), function $CPSliderColorPicker__supportsMode_(self, _cmd, mode)
{
    return mode == CPSliderColorPickerMode ? YES : NO;
}
,["BOOL","int"]), new objj_method(sel_getUid("sliderChanged:"), function $CPSliderColorPicker__sliderChanged_(self, _cmd, sender)
{
    var newColor,
        colorPanel = objj_msgSend(self, "colorPanel"),
        alpha = objj_msgSend(colorPanel, "opacity");
    switch(sender) {
    case self._hueSlider:
    case self._saturationSlider:
    case self._brightnessSlider:
        newColor = objj_msgSend(CPColor, "colorWithHue:saturation:brightness:alpha:", objj_msgSend(self._hueSlider, "floatValue"), objj_msgSend(self._saturationSlider, "floatValue"), objj_msgSend(self._brightnessSlider, "floatValue"), alpha);
        objj_msgSend(self, "updateRGBSliders:", newColor);
        break;
    case self._redSlider:
    case self._greenSlider:
    case self._blueSlider:
        newColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", objj_msgSend(self._redSlider, "floatValue"), objj_msgSend(self._greenSlider, "floatValue"), objj_msgSend(self._blueSlider, "floatValue"), alpha);
        objj_msgSend(self, "updateHSBSliders:", newColor);
        break;
    }
    objj_msgSend(self, "updateLabels");
    objj_msgSend(self, "updateHex:", newColor);
    objj_msgSend(colorPanel, "setColor:", newColor);
}
,["void","id"]), new objj_method(sel_getUid("setColor:"), function $CPSliderColorPicker__setColor_(self, _cmd, aColor)
{
    if (!aColor)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "aColor can't be nil");
    objj_msgSend(self, "updateRGBSliders:", aColor);
    objj_msgSend(self, "updateHSBSliders:", aColor);
    objj_msgSend(self, "updateHex:", aColor);
    objj_msgSend(self, "updateLabels");
}
,["void","CPColor"]), new objj_method(sel_getUid("updateHSBSliders:"), function $CPSliderColorPicker__updateHSBSliders_(self, _cmd, aColor)
{
    var hsb = objj_msgSend(aColor, "hsbComponents");
    objj_msgSend(self._hueSlider, "setFloatValue:", hsb[0]);
    objj_msgSend(self._saturationSlider, "setFloatValue:", hsb[1]);
    objj_msgSend(self._brightnessSlider, "setFloatValue:", hsb[2]);
}
,["void","CPColor"]), new objj_method(sel_getUid("updateHex:"), function $CPSliderColorPicker__updateHex_(self, _cmd, aColor)
{
    objj_msgSend(self._hexValue, "setStringValue:", objj_msgSend(aColor, "hexString"));
}
,["void","CPColor"]), new objj_method(sel_getUid("updateRGBSliders:"), function $CPSliderColorPicker__updateRGBSliders_(self, _cmd, aColor)
{
    var rgb = objj_msgSend(aColor, "components");
    objj_msgSend(self._redSlider, "setFloatValue:", rgb[0]);
    objj_msgSend(self._greenSlider, "setFloatValue:", rgb[1]);
    objj_msgSend(self._blueSlider, "setFloatValue:", rgb[2]);
}
,["void","CPColor"]), new objj_method(sel_getUid("updateLabels"), function $CPSliderColorPicker__updateLabels(self, _cmd)
{
    objj_msgSend(self._hueValue, "setStringValue:", ROUND(objj_msgSend(self._hueSlider, "floatValue") * 360.0));
    objj_msgSend(self._saturationValue, "setStringValue:", ROUND(objj_msgSend(self._saturationSlider, "floatValue") * 100.0));
    objj_msgSend(self._brightnessValue, "setStringValue:", ROUND(objj_msgSend(self._brightnessSlider, "floatValue") * 100.0));
    objj_msgSend(self._redValue, "setStringValue:", ROUND(objj_msgSend(self._redSlider, "floatValue") * 255));
    objj_msgSend(self._greenValue, "setStringValue:", ROUND(objj_msgSend(self._greenSlider, "floatValue") * 255));
    objj_msgSend(self._blueValue, "setStringValue:", ROUND(objj_msgSend(self._blueSlider, "floatValue") * 255));
}
,["void"]), new objj_method(sel_getUid("provideNewButtonImage"), function $CPSliderColorPicker__provideNewButtonImage(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "slider_button.png"), CGSizeMake(32, 32));
}
,["CPImage"]), new objj_method(sel_getUid("provideNewAlternateButtonImage"), function $CPSliderColorPicker__provideNewAlternateButtonImage(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "slider_button_h.png"), CGSizeMake(32, 32));
}
,["CPImage"]), new objj_method(sel_getUid("controlTextDidEndEditing:"), function $CPSliderColorPicker__controlTextDidEndEditing_(self, _cmd, aNotification)
{
    var field = objj_msgSend(aNotification, "object"),
        value = objj_msgSend(objj_msgSend(field, "stringValue"), "stringByTrimmingWhitespace");
    if (field === self._hexValue)
    {
        var newColor = objj_msgSend(CPColor, "colorWithHexString:", value);
        if (newColor)
        {
            objj_msgSend(self, "setColor:", newColor);
            objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:", newColor);
        }
    }
    else
    {
        switch(field) {
        case self._redValue:
            objj_msgSend(self._redSlider, "setFloatValue:", MAX(MIN(ROUND(value), 255) / 255.0, 0));
            objj_msgSend(self, "sliderChanged:", self._redSlider);
            break;
        case self._greenValue:
            objj_msgSend(self._greenSlider, "setFloatValue:", MAX(MIN(ROUND(value), 255) / 255.0, 0));
            objj_msgSend(self, "sliderChanged:", self._greenSlider);
            break;
        case self._blueValue:
            objj_msgSend(self._blueSlider, "setFloatValue:", MAX(MIN(ROUND(value), 255) / 255.0, 0));
            objj_msgSend(self, "sliderChanged:", self._blueSlider);
            break;
        case self._hueValue:
            objj_msgSend(self._hueSlider, "setFloatValue:", MAX(MIN(ROUND(value), 360) / 360.0, 0));
            objj_msgSend(self, "sliderChanged:", self._hueSlider);
            break;
        case self._saturationValue:
            objj_msgSend(self._saturationSlider, "setFloatValue:", MAX(MIN(ROUND(value), 100) / 100.0, 0));
            objj_msgSend(self, "sliderChanged:", self._saturationSlider);
            break;
        case self._brightnessValue:
            objj_msgSend(self._brightnessSlider, "setFloatValue:", MAX(MIN(ROUND(value), 100) / 100.0, 0));
            objj_msgSend(self, "sliderChanged:", self._brightnessSlider);
            break;
        }
    }
}
,["void","CPNotification"])]);
}