@STATIC;1.0;I;21;Foundation/CPObject.ji;8;CPView.jt;15209;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPView.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_panel"), new objj_ivar("_mask")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function $CPColorPicker__initWithPickerMask_colorPanel_(self, _cmd, aMask, aPanel)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPicker").super_class }, "init"))
    {
        self._panel = aPanel;
        self._mask = aMask;
    }
    return self;
}
,["id","int","CPColorPanel"]), new objj_method(sel_getUid("colorPanel"), function $CPColorPicker__colorPanel(self, _cmd)
{
    return self._panel;
}
,["CPColorPanel"]), new objj_method(sel_getUid("provideNewButtonImage"), function $CPColorPicker__provideNewButtonImage(self, _cmd)
{
    return nil;
}
,["CPImage"]), new objj_method(sel_getUid("setMode:"), function $CPColorPicker__setMode_(self, _cmd, mode)
{
}
,["void","CPColorPanelMode"]), new objj_method(sel_getUid("setColor:"), function $CPColorPicker__setColor_(self, _cmd, aColor)
{
}
,["void","CPColor"])]);
}{var the_class = objj_allocateClassPair(CPColorPicker, "CPColorWheelColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_pickerView"), new objj_ivar("_brightnessSlider"), new objj_ivar("_hueSaturationView"), new objj_ivar("_cachedColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function $CPColorWheelColorPicker__initWithPickerMask_colorPanel_(self, _cmd, mask, owningColorPanel)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWheelColorPicker").super_class }, "initWithPickerMask:colorPanel:", mask, owningColorPanel);
}
,["id","int","CPColorPanel"]), new objj_method(sel_getUid("initView"), function $CPColorWheelColorPicker__initView(self, _cmd)
{
    var aFrame = CGRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    self._pickerView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", aFrame));
    ((___r1 = self._pickerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    self._brightnessSlider = ((___r1 = (CPSlider == null ? null : CPSlider.isa.objj_msgSend0(CPSlider, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, aFrame.size.height - 34, aFrame.size.width, 15)));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forThemeAttribute:", 15.0, "track-width"));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forThemeAttribute:", CPColor.isa.objj_msgSend1(CPColor, "colorWithPatternImage:", ((___r2 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "initWithContentsOfFile:", ((___r3 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", CPColorPicker.isa.objj_msgSend0(CPColorPicker, "class"))), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "pathForResource:", "brightness_bar.png"))))), "track-color"));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMinValue:", 0.0));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMaxValue:", 100.0));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", 100.0));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("brightnessSliderDidChange:")));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewMinYMargin));
    self._hueSaturationView = ((___r1 = (__CPColorWheel == null ? null : __CPColorWheel.isa.objj_msgSend0(__CPColorWheel, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, aFrame.size.width, aFrame.size.height - 38)));
    ((___r1 = self._hueSaturationView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    ((___r1 = self._hueSaturationView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    ((___r1 = self._pickerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._hueSaturationView));
    ((___r1 = self._pickerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._brightnessSlider));
    var ___r1, ___r2, ___r3;
}
,["id"]), new objj_method(sel_getUid("brightnessSliderDidChange:"), function $CPColorWheelColorPicker__brightnessSliderDidChange_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "updateColor");
}
,["void","id"]), new objj_method(sel_getUid("colorWheelDidChange:"), function $CPColorWheelColorPicker__colorWheelDidChange_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "updateColor");
}
,["void","id"]), new objj_method(sel_getUid("updateColor"), function $CPColorWheelColorPicker__updateColor(self, _cmd)
{
    var hue = ((___r1 = self._hueSaturationView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "angle")),
        saturation = ((___r1 = self._hueSaturationView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "distance")),
        brightness = ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue"));
    ((___r1 = self._hueSaturationView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWheelBrightness:", brightness / 100.0));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend3(CPColor, "colorWithHue:saturation:brightness:", hue / 360.0, saturation / 100.0, 1)));
    var colorPanel = self.isa.objj_msgSend0(self, "colorPanel"),
        opacity = (colorPanel == null ? null : colorPanel.isa.objj_msgSend0(colorPanel, "opacity"));
    self._cachedColor = CPColor.isa.objj_msgSend(CPColor, "colorWithHue:saturation:brightness:alpha:", hue / 360.0, saturation / 100.0, brightness / 100.0, opacity);
    ((___r1 = self.isa.objj_msgSend0(self, "colorPanel")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColor:", self._cachedColor));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("supportsMode:"), function $CPColorWheelColorPicker__supportsMode_(self, _cmd, mode)
{
    return mode == CPWheelColorPickerMode ? YES : NO;
}
,["BOOL","int"]), new objj_method(sel_getUid("currentMode"), function $CPColorWheelColorPicker__currentMode(self, _cmd)
{
    return CPWheelColorPickerMode;
}
,["int"]), new objj_method(sel_getUid("provideNewView:"), function $CPColorWheelColorPicker__provideNewView_(self, _cmd, initialRequest)
{
    if (initialRequest)
        self.isa.objj_msgSend0(self, "initView");
    return self._pickerView;
}
,["CPView","BOOL"]), new objj_method(sel_getUid("setColor:"), function $CPColorWheelColorPicker__setColor_(self, _cmd, newColor)
{
    if ((newColor == null ? null : newColor.isa.objj_msgSend1(newColor, "isEqual:", self._cachedColor)))
        return;
    var hsb = (newColor == null ? null : newColor.isa.objj_msgSend0(newColor, "hsbComponents"));
    ((___r1 = self._hueSaturationView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPositionToColor:", newColor));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", hsb[2] * 100.0));
    ((___r1 = self._hueSaturationView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWheelBrightness:", hsb[2]));
    ((___r1 = self._brightnessSlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend3(CPColor, "colorWithHue:saturation:brightness:", hsb[0], hsb[1], 1)));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("provideNewButtonImage"), function $CPColorWheelColorPicker__provideNewButtonImage(self, _cmd)
{
    return ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", ((___r2 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", CPColorPicker)), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "pathForResource:", "wheel_button.png")), CGSizeMake(32, 32)));
    var ___r1, ___r2;
}
,["CPImage"]), new objj_method(sel_getUid("provideNewAlternateButtonImage"), function $CPColorWheelColorPicker__provideNewAlternateButtonImage(self, _cmd)
{
    return ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", ((___r2 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", CPColorPicker)), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "pathForResource:", "wheel_button_h.png")), CGSizeMake(32, 32)));
    var ___r1, ___r2;
}
,["CPImage"])]);
}{var the_class = objj_allocateClassPair(CPView, "__CPColorWheel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_wheelImage"), new objj_ivar("_blackWheelImage"), new objj_ivar("_crosshair"), new objj_ivar("_delegate"), new objj_ivar("_angle"), new objj_ivar("_distance"), new objj_ivar("_radius")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $__CPColorWheel__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("__CPColorWheel").super_class }, "initWithFrame:", aFrame))
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setWheelSize:", aFrame.size));
        self._crosshair = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(self._radius - 2, self._radius - 2, 4, 4)));
        ((___r1 = self._crosshair), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
        var view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectInset(((___r2 = self._crosshair), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")), 1.0, 1.0)));
        (view == null ? null : view.isa.objj_msgSend1(view, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
        ((___r1 = self._crosshair), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", view));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._crosshair));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CGRect"]), new objj_method(sel_getUid("setWheelBrightness:"), function $__CPColorWheel__setWheelBrightness_(self, _cmd, brightness)
{
}
,["void","float"]), new objj_method(sel_getUid("setFrameSize:"), function $__CPColorWheel__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("__CPColorWheel").super_class }, "setFrameSize:", aSize);
    self.isa.objj_msgSend1(self, "setWheelSize:", aSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("setWheelSize:"), function $__CPColorWheel__setWheelSize_(self, _cmd, aSize)
{
    var min = MIN(aSize.width, aSize.height);
    self._radius = min / 2.0;
    self.isa.objj_msgSend2(self, "setAngle:distance:", self.isa.objj_msgSend1(self, "degreesToRadians:", self._angle), self._distance / 100.0 * self._radius);
}
,["void","CGSize"]), new objj_method(sel_getUid("setDelegate:"), function $__CPColorWheel__setDelegate_(self, _cmd, aDelegate)
{
    self._delegate = aDelegate;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $__CPColorWheel__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("angle"), function $__CPColorWheel__angle(self, _cmd)
{
    return self._angle;
}
,["float"]), new objj_method(sel_getUid("distance"), function $__CPColorWheel__distance(self, _cmd)
{
    return self._distance;
}
,["float"]), new objj_method(sel_getUid("mouseDown:"), function $__CPColorWheel__mouseDown_(self, _cmd, anEvent)
{
    self.isa.objj_msgSend1(self, "reposition:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $__CPColorWheel__mouseDragged_(self, _cmd, anEvent)
{
    self.isa.objj_msgSend1(self, "reposition:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("reposition:"), function $__CPColorWheel__reposition_(self, _cmd, anEvent)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil),
        midX = CGRectGetMidX(bounds),
        midY = CGRectGetMidY(bounds),
        distance = MIN(SQRT((location.x - midX) * (location.x - midX) + (location.y - midY) * (location.y - midY)), self._radius),
        angle = ATAN2(location.y - midY, location.x - midX);
    self.isa.objj_msgSend2(self, "setAngle:distance:", angle, distance);
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "colorWheelDidChange:", self));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("setAngle:distance:"), function $__CPColorWheel__setAngle_distance_(self, _cmd, angle, distance)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        midX = CGRectGetMidX(bounds),
        midY = CGRectGetMidY(bounds);
    self._angle = self.isa.objj_msgSend1(self, "radiansToDegrees:", angle);
    self._distance = distance / self._radius * 100.0;
    ((___r1 = self._crosshair), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(COS(angle) * distance + midX - 2.0, SIN(angle) * distance + midY - 2.0)));
    var ___r1;
}
,["void","int","float"]), new objj_method(sel_getUid("setPositionToColor:"), function $__CPColorWheel__setPositionToColor_(self, _cmd, aColor)
{
    var hsb = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "hsbComponents")),
        bounds = self.isa.objj_msgSend0(self, "bounds"),
        angle = self.isa.objj_msgSend1(self, "degreesToRadians:", hsb[0] * 360.0),
        distance = hsb[1] * self._radius;
    self.isa.objj_msgSend2(self, "setAngle:distance:", angle, distance);
}
,["void","CPColor"]), new objj_method(sel_getUid("radiansToDegrees:"), function $__CPColorWheel__radiansToDegrees_(self, _cmd, radians)
{
    return (-radians / PI * 180 + 360) % 360;
}
,["int","float"]), new objj_method(sel_getUid("degreesToRadians:"), function $__CPColorWheel__degreesToRadians_(self, _cmd, degrees)
{
    return -((degrees - 360) / 180 * PI);
}
,["float","float"])]);
}