@STATIC;1.0;I;21;Foundation/CPObject.ji;8;CPView.jt;13702;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPView.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPColorPicker"),
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
    self._pickerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aFrame);
    objj_msgSend(self._pickerView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    self._brightnessSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(0, aFrame.size.height - 34, aFrame.size.width, 15));
    objj_msgSend(self._brightnessSlider, "setValue:forThemeAttribute:", 15.0, "track-width");
    objj_msgSend(self._brightnessSlider, "setValue:forThemeAttribute:", objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPColorPicker, "class")), "pathForResource:", "brightness_bar.png"))), "track-color");
    objj_msgSend(self._brightnessSlider, "setMinValue:", 0.0);
    objj_msgSend(self._brightnessSlider, "setMaxValue:", 100.0);
    objj_msgSend(self._brightnessSlider, "setFloatValue:", 100.0);
    objj_msgSend(self._brightnessSlider, "setTarget:", self);
    objj_msgSend(self._brightnessSlider, "setAction:", sel_getUid("brightnessSliderDidChange:"));
    objj_msgSend(self._brightnessSlider, "setAutoresizingMask:", CPViewWidthSizable | CPViewMinYMargin);
    self._hueSaturationView = objj_msgSend(objj_msgSend(__CPColorWheel, "alloc"), "initWithFrame:", CGRectMake(0, 0, aFrame.size.width, aFrame.size.height - 38));
    objj_msgSend(self._hueSaturationView, "setDelegate:", self);
    objj_msgSend(self._hueSaturationView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(self._pickerView, "addSubview:", self._hueSaturationView);
    objj_msgSend(self._pickerView, "addSubview:", self._brightnessSlider);
}
,["id"]), new objj_method(sel_getUid("brightnessSliderDidChange:"), function $CPColorWheelColorPicker__brightnessSliderDidChange_(self, _cmd, sender)
{
    objj_msgSend(self, "updateColor");
}
,["void","id"]), new objj_method(sel_getUid("colorWheelDidChange:"), function $CPColorWheelColorPicker__colorWheelDidChange_(self, _cmd, sender)
{
    objj_msgSend(self, "updateColor");
}
,["void","id"]), new objj_method(sel_getUid("updateColor"), function $CPColorWheelColorPicker__updateColor(self, _cmd)
{
    var hue = objj_msgSend(self._hueSaturationView, "angle"),
        saturation = objj_msgSend(self._hueSaturationView, "distance"),
        brightness = objj_msgSend(self._brightnessSlider, "floatValue");
    objj_msgSend(self._hueSaturationView, "setWheelBrightness:", brightness / 100.0);
    objj_msgSend(self._brightnessSlider, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", hue / 360.0, saturation / 100.0, 1));
    var colorPanel = objj_msgSend(self, "colorPanel"),
        opacity = objj_msgSend(colorPanel, "opacity");
    self._cachedColor = objj_msgSend(CPColor, "colorWithHue:saturation:brightness:alpha:", hue / 360.0, saturation / 100.0, brightness / 100.0, opacity);
    objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:", self._cachedColor);
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
        objj_msgSend(self, "initView");
    return self._pickerView;
}
,["CPView","BOOL"]), new objj_method(sel_getUid("setColor:"), function $CPColorWheelColorPicker__setColor_(self, _cmd, newColor)
{
    if (objj_msgSend(newColor, "isEqual:", self._cachedColor))
        return;
    var hsb = objj_msgSend(newColor, "hsbComponents");
    objj_msgSend(self._hueSaturationView, "setPositionToColor:", newColor);
    objj_msgSend(self._brightnessSlider, "setFloatValue:", hsb[2] * 100.0);
    objj_msgSend(self._hueSaturationView, "setWheelBrightness:", hsb[2]);
    objj_msgSend(self._brightnessSlider, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", hsb[0], hsb[1], 1));
}
,["void","CPColor"]), new objj_method(sel_getUid("provideNewButtonImage"), function $CPColorWheelColorPicker__provideNewButtonImage(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_button.png"), CGSizeMake(32, 32));
}
,["CPImage"]), new objj_method(sel_getUid("provideNewAlternateButtonImage"), function $CPColorWheelColorPicker__provideNewAlternateButtonImage(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_button_h.png"), CGSizeMake(32, 32));
}
,["CPImage"])]);
}{var the_class = objj_allocateClassPair(CPView, "__CPColorWheel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_wheelImage"), new objj_ivar("_blackWheelImage"), new objj_ivar("_crosshair"), new objj_ivar("_delegate"), new objj_ivar("_angle"), new objj_ivar("_distance"), new objj_ivar("_radius")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $__CPColorWheel__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("__CPColorWheel").super_class }, "initWithFrame:", aFrame))
    {
        var path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel.png");
        self._wheelImage = new Image();
        self._wheelImage.src = path;
        self._wheelImage.style.position = "absolute";
        path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_black.png");
        self._blackWheelImage = new Image();
        self._blackWheelImage.src = path;
        self._blackWheelImage.style.opacity = "0";
        self._blackWheelImage.style.filter = "alpha(opacity=0)";
        self._blackWheelImage.style.position = "absolute";
        self._DOMElement.appendChild(self._wheelImage);
        self._DOMElement.appendChild(self._blackWheelImage);
        objj_msgSend(self, "setWheelSize:", aFrame.size);
        self._crosshair = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(self._radius - 2, self._radius - 2, 4, 4));
        objj_msgSend(self._crosshair, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(self._crosshair, "bounds"), 1.0, 1.0));
        objj_msgSend(view, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(self._crosshair, "addSubview:", view);
        objj_msgSend(self, "addSubview:", self._crosshair);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setWheelBrightness:"), function $__CPColorWheel__setWheelBrightness_(self, _cmd, brightness)
{
    self._blackWheelImage.style.opacity = 1.0 - brightness;
    self._blackWheelImage.style.filter = "alpha(opacity=" + (1.0 - brightness) * 100 + ")";
}
,["void","float"]), new objj_method(sel_getUid("setFrameSize:"), function $__CPColorWheel__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("__CPColorWheel").super_class }, "setFrameSize:", aSize);
    objj_msgSend(self, "setWheelSize:", aSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("setWheelSize:"), function $__CPColorWheel__setWheelSize_(self, _cmd, aSize)
{
    var min = MIN(aSize.width, aSize.height);
    self._blackWheelImage.style.width = min;
    self._blackWheelImage.style.height = min;
    self._blackWheelImage.width = min;
    self._blackWheelImage.height = min;
    self._blackWheelImage.style.top = (aSize.height - min) / 2.0 + "px";
    self._blackWheelImage.style.left = (aSize.width - min) / 2.0 + "px";
    self._wheelImage.style.width = min;
    self._wheelImage.style.height = min;
    self._wheelImage.width = min;
    self._wheelImage.height = min;
    self._wheelImage.style.top = (aSize.height - min) / 2.0 + "px";
    self._wheelImage.style.left = (aSize.width - min) / 2.0 + "px";
    self._radius = min / 2.0;
    objj_msgSend(self, "setAngle:distance:", objj_msgSend(self, "degreesToRadians:", self._angle), self._distance / 100.0 * self._radius);
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
    objj_msgSend(self, "reposition:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $__CPColorWheel__mouseDragged_(self, _cmd, anEvent)
{
    objj_msgSend(self, "reposition:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("reposition:"), function $__CPColorWheel__reposition_(self, _cmd, anEvent)
{
    var bounds = objj_msgSend(self, "bounds"),
        location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        midX = CGRectGetMidX(bounds),
        midY = CGRectGetMidY(bounds),
        distance = MIN(SQRT((location.x - midX) * (location.x - midX) + (location.y - midY) * (location.y - midY)), self._radius),
        angle = ATAN2(location.y - midY, location.x - midX);
    objj_msgSend(self, "setAngle:distance:", angle, distance);
    objj_msgSend(self._delegate, "colorWheelDidChange:", self);
}
,["void","CPEvent"]), new objj_method(sel_getUid("setAngle:distance:"), function $__CPColorWheel__setAngle_distance_(self, _cmd, angle, distance)
{
    var bounds = objj_msgSend(self, "bounds"),
        midX = CGRectGetMidX(bounds),
        midY = CGRectGetMidY(bounds);
    self._angle = objj_msgSend(self, "radiansToDegrees:", angle);
    self._distance = distance / self._radius * 100.0;
    objj_msgSend(self._crosshair, "setFrameOrigin:", CGPointMake(COS(angle) * distance + midX - 2.0, SIN(angle) * distance + midY - 2.0));
}
,["void","int","float"]), new objj_method(sel_getUid("setPositionToColor:"), function $__CPColorWheel__setPositionToColor_(self, _cmd, aColor)
{
    var hsb = objj_msgSend(aColor, "hsbComponents"),
        bounds = objj_msgSend(self, "bounds"),
        angle = objj_msgSend(self, "degreesToRadians:", hsb[0] * 360.0),
        distance = hsb[1] * self._radius;
    objj_msgSend(self, "setAngle:distance:", angle, distance);
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