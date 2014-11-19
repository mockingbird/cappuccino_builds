@STATIC;1.0;i;15;CPColorPicker.ji;10;CPSlider.ji;13;CPTextField.ji;8;CPView.jt;27740;objj_executeFile("CPColorPicker.j", YES);objj_executeFile("CPSlider.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPView.j", YES);{var the_class = objj_allocateClassPair(CPColorPicker, "CPSliderColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_redSlider"), new objj_ivar("_greenSlider"), new objj_ivar("_blueSlider"), new objj_ivar("_hueSlider"), new objj_ivar("_saturationSlider"), new objj_ivar("_brightnessSlider"), new objj_ivar("_rgbLabel"), new objj_ivar("_hsbLabel"), new objj_ivar("_redLabel"), new objj_ivar("_greenLabel"), new objj_ivar("_blueLabel"), new objj_ivar("_hueLabel"), new objj_ivar("_saturationLabel"), new objj_ivar("_brightnessLabel"), new objj_ivar("_hexLabel"), new objj_ivar("_hexValue"), new objj_ivar("_redValue"), new objj_ivar("_greenValue"), new objj_ivar("_blueValue"), new objj_ivar("_hueValue"), new objj_ivar("_saturationValue"), new objj_ivar("_brightnessValue")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function $CPSliderColorPicker__initWithPickerMask_colorPanel_(self, _cmd, mask, owningColorPanel)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSliderColorPicker").super_class }, "initWithPickerMask:colorPanel:", mask, owningColorPanel);
}
,["id","int","CPColorPanel"]), new objj_method(sel_getUid("initView"), function $CPSliderColorPicker__initView(self, _cmd)
{
    var aFrame = CGRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    self._contentView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", aFrame));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    self._rgbLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 10, 100, 20)));
    ((___r1 = self._rgbLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "Red, Green, Blue"));
    ((___r1 = self._rgbLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    self._redLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 37, 15, 20)));
    ((___r1 = self._redLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "R"));
    ((___r1 = self._redLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    self._redSlider = ((___r1 = CPSlider.isa.objj_msgSend0(CPSlider, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(15, 35, aFrame.size.width - 70, 20)));
    ((___r1 = self._redSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMaxValue:", 1.0));
    ((___r1 = self._redSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMinValue:", 0.0));
    ((___r1 = self._redSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._redSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("sliderChanged:")));
    ((___r1 = self._redSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    self._redValue = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(aFrame.size.width - 45, 30, 45, 28)));
    ((___r1 = self._redValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin));
    ((___r1 = self._redValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEditable:", YES));
    ((___r1 = self._redValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBezeled:", YES));
    ((___r1 = self._redValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._redValue));
    self._greenLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 63, 15, 20)));
    ((___r1 = self._greenLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "G"));
    ((___r1 = self._greenLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    self._greenSlider = ((___r1 = CPSlider.isa.objj_msgSend0(CPSlider, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(15, 61, aFrame.size.width - 70, 20)));
    ((___r1 = self._greenSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMaxValue:", 1.0));
    ((___r1 = self._greenSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMinValue:", 0.0));
    ((___r1 = self._greenSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._greenSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("sliderChanged:")));
    ((___r1 = self._greenSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    self._greenValue = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(aFrame.size.width - 45, 56, 45, 28)));
    ((___r1 = self._greenValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin));
    ((___r1 = self._greenValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEditable:", YES));
    ((___r1 = self._greenValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBezeled:", YES));
    ((___r1 = self._greenValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._greenValue));
    self._blueLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 90, 15, 20)));
    ((___r1 = self._blueLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "B"));
    ((___r1 = self._blueLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    self._blueSlider = ((___r1 = CPSlider.isa.objj_msgSend0(CPSlider, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(15, 87, aFrame.size.width - 70, 20)));
    ((___r1 = self._blueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMaxValue:", 1.0));
    ((___r1 = self._blueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMinValue:", 0.0));
    ((___r1 = self._blueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._blueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("sliderChanged:")));
    ((___r1 = self._blueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    self._blueValue = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(aFrame.size.width - 45, 82, 45, 28)));
    ((___r1 = self._blueValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin));
    ((___r1 = self._blueValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEditable:", YES));
    ((___r1 = self._blueValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBezeled:", YES));
    ((___r1 = self._blueValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._blueValue));
    self._hsbLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 120, 190, 20)));
    ((___r1 = self._hsbLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "Hue, Saturation, Brightness"));
    ((___r1 = self._hsbLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    self._hueLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 145, 15, 20)));
    ((___r1 = self._hueLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "H"));
    ((___r1 = self._hueLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    self._hueSlider = ((___r1 = CPSlider.isa.objj_msgSend0(CPSlider, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(15, 143, aFrame.size.width - 70, 20)));
    ((___r1 = self._hueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMaxValue:", 0.999));
    ((___r1 = self._hueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMinValue:", 0.0));
    ((___r1 = self._hueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._hueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("sliderChanged:")));
    ((___r1 = self._hueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    self._hueValue = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(aFrame.size.width - 45, 138, 45, 28)));
    ((___r1 = self._hueValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin));
    ((___r1 = self._hueValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEditable:", YES));
    ((___r1 = self._hueValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBezeled:", YES));
    ((___r1 = self._hueValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._hueValue));
    self._saturationLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 170, 15, 20)));
    ((___r1 = self._saturationLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "S"));
    ((___r1 = self._saturationLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    self._saturationSlider = ((___r1 = CPSlider.isa.objj_msgSend0(CPSlider, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(15, 168, aFrame.size.width - 70, 20)));
    ((___r1 = self._saturationSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMaxValue:", 1.0));
    ((___r1 = self._saturationSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMinValue:", 0.0));
    ((___r1 = self._saturationSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._saturationSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("sliderChanged:")));
    ((___r1 = self._saturationSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    self._saturationValue = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(aFrame.size.width - 45, 164, 45, 28)));
    ((___r1 = self._saturationValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin));
    ((___r1 = self._saturationValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEditable:", YES));
    ((___r1 = self._saturationValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBezeled:", YES));
    ((___r1 = self._saturationValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._saturationValue));
    self._brightnessLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 196, 15, 20)));
    ((___r1 = self._brightnessLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "B"));
    ((___r1 = self._brightnessLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    self._brightnessSlider = ((___r1 = CPSlider.isa.objj_msgSend0(CPSlider, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(15, 194, aFrame.size.width - 70, 20)));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMaxValue:", 1.0));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMinValue:", 0.0));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("sliderChanged:")));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    self._brightnessValue = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(aFrame.size.width - 45, 190, 45, 28)));
    ((___r1 = self._brightnessValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin));
    ((___r1 = self._brightnessValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEditable:", YES));
    ((___r1 = self._brightnessValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBezeled:", YES));
    ((___r1 = self._brightnessValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._brightnessValue));
    self._hexLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 230, 30, 20)));
    ((___r1 = self._hexLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "Hex"));
    ((___r1 = self._hexLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    self._hexValue = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(32, 225, 80, 28)));
    ((___r1 = self._hexValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEditable:", YES));
    ((___r1 = self._hexValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBezeled:", YES));
    ((___r1 = self._hexValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._hexValue));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._rgbLabel));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._redLabel));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._greenLabel));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._blueLabel));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._redSlider));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._greenSlider));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._blueSlider));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._hsbLabel));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._hueLabel));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._saturationLabel));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._brightnessLabel));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._hueSlider));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._saturationSlider));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._brightnessSlider));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._hexLabel));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("provideNewView:"), function $CPSliderColorPicker__provideNewView_(self, _cmd, initialRequest)
{
    if (initialRequest)
        self.isa.objj_msgSend0(self, "initView");
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
        colorPanel = self.isa.objj_msgSend0(self, "colorPanel"),
        alpha = (colorPanel == null ? null : colorPanel.isa.objj_msgSend0(colorPanel, "opacity"));
    switch(sender) {
    case self._hueSlider:
    case self._saturationSlider:
    case self._brightnessSlider:
        newColor = CPColor.isa.objj_msgSend(CPColor, "colorWithHue:saturation:brightness:alpha:", ((___r1 = self._hueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue")), ((___r1 = self._saturationSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue")), ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue")), alpha);
        self.isa.objj_msgSend1(self, "updateRGBSliders:", newColor);
        break;
    case self._redSlider:
    case self._greenSlider:
    case self._blueSlider:
        newColor = CPColor.isa.objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", ((___r1 = self._redSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue")), ((___r1 = self._greenSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue")), ((___r1 = self._blueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue")), alpha);
        self.isa.objj_msgSend1(self, "updateHSBSliders:", newColor);
        break;
    }
    self.isa.objj_msgSend0(self, "updateLabels");
    self.isa.objj_msgSend1(self, "updateHex:", newColor);
    (colorPanel == null ? null : colorPanel.isa.objj_msgSend1(colorPanel, "setColor:", newColor));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setColor:"), function $CPSliderColorPicker__setColor_(self, _cmd, aColor)
{
    if (!aColor)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "aColor can't be nil");
    self.isa.objj_msgSend1(self, "updateRGBSliders:", aColor);
    self.isa.objj_msgSend1(self, "updateHSBSliders:", aColor);
    self.isa.objj_msgSend1(self, "updateHex:", aColor);
    self.isa.objj_msgSend0(self, "updateLabels");
}
,["void","CPColor"]), new objj_method(sel_getUid("updateHSBSliders:"), function $CPSliderColorPicker__updateHSBSliders_(self, _cmd, aColor)
{
    var hsb = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "hsbComponents"));
    ((___r1 = self._hueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", hsb[0]));
    ((___r1 = self._saturationSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", hsb[1]));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", hsb[2]));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("updateHex:"), function $CPSliderColorPicker__updateHex_(self, _cmd, aColor)
{
    ((___r1 = self._hexValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "hexString"))));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("updateRGBSliders:"), function $CPSliderColorPicker__updateRGBSliders_(self, _cmd, aColor)
{
    var rgb = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "components"));
    ((___r1 = self._redSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", rgb[0]));
    ((___r1 = self._greenSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", rgb[1]));
    ((___r1 = self._blueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", rgb[2]));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("updateLabels"), function $CPSliderColorPicker__updateLabels(self, _cmd)
{
    ((___r1 = self._hueValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", ROUND(((___r2 = self._hueSlider), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "floatValue")) * 360.0)));
    ((___r1 = self._saturationValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", ROUND(((___r2 = self._saturationSlider), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "floatValue")) * 100.0)));
    ((___r1 = self._brightnessValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", ROUND(((___r2 = self._brightnessSlider), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "floatValue")) * 100.0)));
    ((___r1 = self._redValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", ROUND(((___r2 = self._redSlider), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "floatValue")) * 255)));
    ((___r1 = self._greenValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", ROUND(((___r2 = self._greenSlider), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "floatValue")) * 255)));
    ((___r1 = self._blueValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", ROUND(((___r2 = self._blueSlider), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "floatValue")) * 255)));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("provideNewButtonImage"), function $CPSliderColorPicker__provideNewButtonImage(self, _cmd)
{
    return ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", ((___r2 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", CPColorPicker)), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "pathForResource:", "slider_button.png")), CGSizeMake(32, 32)));
    var ___r1, ___r2;
}
,["CPImage"]), new objj_method(sel_getUid("provideNewAlternateButtonImage"), function $CPSliderColorPicker__provideNewAlternateButtonImage(self, _cmd)
{
    return ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", ((___r2 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", CPColorPicker)), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "pathForResource:", "slider_button_h.png")), CGSizeMake(32, 32)));
    var ___r1, ___r2;
}
,["CPImage"]), new objj_method(sel_getUid("controlTextDidEndEditing:"), function $CPSliderColorPicker__controlTextDidEndEditing_(self, _cmd, aNotification)
{
    var field = (aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "object")),
        value = ((___r1 = (field == null ? null : field.isa.objj_msgSend0(field, "stringValue"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "stringByTrimmingWhitespace"));
    if (field === self._hexValue)
    {
        var newColor = CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", value);
        if (newColor)
        {
            self.isa.objj_msgSend1(self, "setColor:", newColor);
            ((___r1 = self.isa.objj_msgSend0(self, "colorPanel")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColor:", newColor));
        }
    }
    else
    {
        switch(field) {
        case self._redValue:
            ((___r1 = self._redSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", MAX(MIN(ROUND(value), 255) / 255.0, 0)));
            self.isa.objj_msgSend1(self, "sliderChanged:", self._redSlider);
            break;
        case self._greenValue:
            ((___r1 = self._greenSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", MAX(MIN(ROUND(value), 255) / 255.0, 0)));
            self.isa.objj_msgSend1(self, "sliderChanged:", self._greenSlider);
            break;
        case self._blueValue:
            ((___r1 = self._blueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", MAX(MIN(ROUND(value), 255) / 255.0, 0)));
            self.isa.objj_msgSend1(self, "sliderChanged:", self._blueSlider);
            break;
        case self._hueValue:
            ((___r1 = self._hueSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", MAX(MIN(ROUND(value), 360) / 360.0, 0)));
            self.isa.objj_msgSend1(self, "sliderChanged:", self._hueSlider);
            break;
        case self._saturationValue:
            ((___r1 = self._saturationSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", MAX(MIN(ROUND(value), 100) / 100.0, 0)));
            self.isa.objj_msgSend1(self, "sliderChanged:", self._saturationSlider);
            break;
        case self._brightnessValue:
            ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", MAX(MIN(ROUND(value), 100) / 100.0, 0)));
            self.isa.objj_msgSend1(self, "sliderChanged:", self._brightnessSlider);
            break;
        }
    }
    var ___r1;
}
,["void","CPNotification"])]);
}