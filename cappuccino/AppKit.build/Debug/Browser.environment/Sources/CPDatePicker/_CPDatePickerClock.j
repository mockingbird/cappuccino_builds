@STATIC;1.0;i;8;CPView.ji;13;CPTextField.ji;13;CPImageView.ji;9;CALayer.jt;13355;objj_executeFile("CPView.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CALayer.j", YES);var RADIANS = Math.PI / 180;
{var the_class = objj_allocateClassPair(CPView, "_CPDatePickerClock"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isEnabled"), new objj_ivar("_rootLayer"), new objj_ivar("_hourHandLayer"), new objj_ivar("_minuteHandLayer"), new objj_ivar("_secondHandLayer"), new objj_ivar("_middleHandLayer"), new objj_ivar("_datePicker"), new objj_ivar("_PMAMTextField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:datePicker:"), function $_CPDatePickerClock__initWithFrame_datePicker_(self, _cmd, aFrame, aDatePicker)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerClock").super_class }, "initWithFrame:", aFrame))
    {
        self._datePicker = aDatePicker;
        self._PMAMTextField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._PMAMTextField, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "clock-font", CPThemeStateNormal), "font", CPThemeStateNormal);
        objj_msgSend(self._PMAMTextField, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "clock-text-color", CPThemeStateNormal), "text-color", CPThemeStateNormal);
        objj_msgSend(self._PMAMTextField, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "clock-text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
        objj_msgSend(self._PMAMTextField, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "clock-text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
        objj_msgSend(self._PMAMTextField, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "clock-font", CPThemeStateDisabled), "font", CPThemeStateDisabled);
        objj_msgSend(self._PMAMTextField, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "clock-text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
        objj_msgSend(self._PMAMTextField, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "clock-text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
        objj_msgSend(self._PMAMTextField, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "clock-text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
        objj_msgSend(self, "addSubview:", self._PMAMTextField);
        var middleHandSize = objj_msgSend(self._datePicker, "valueForThemeAttribute:", "middle-hand-size"),
            minuteHandSize = objj_msgSend(self._datePicker, "valueForThemeAttribute:", "minute-hand-size"),
            hourHandSize = objj_msgSend(self._datePicker, "valueForThemeAttribute:", "hour-hand-size"),
            secondHandSize = objj_msgSend(self._datePicker, "valueForThemeAttribute:", "second-hand-size");
        self._hourHandLayer = objj_msgSend(objj_msgSend(HandLayer, "alloc"), "initWithSize:", hourHandSize);
        objj_msgSend(self._hourHandLayer, "setBounds:", CGRectMake(0, 0, aFrame.size.width, aFrame.size.height));
        objj_msgSend(self._hourHandLayer, "setAnchorPoint:", CGPointMakeZero());
        objj_msgSend(self._hourHandLayer, "setPosition:", CGPointMake(0.0, 0.0));
        self._minuteHandLayer = objj_msgSend(objj_msgSend(HandLayer, "alloc"), "initWithSize:", minuteHandSize);
        objj_msgSend(self._minuteHandLayer, "setBounds:", CGRectMake(0, 0, aFrame.size.width, aFrame.size.height));
        objj_msgSend(self._minuteHandLayer, "setAnchorPoint:", CGPointMakeZero());
        objj_msgSend(self._minuteHandLayer, "setPosition:", CGPointMake(0.0, 0.0));
        self._secondHandLayer = objj_msgSend(objj_msgSend(HandLayer, "alloc"), "initWithSize:", secondHandSize);
        objj_msgSend(self._secondHandLayer, "setBounds:", CGRectMake(0, 0, aFrame.size.width, aFrame.size.height));
        objj_msgSend(self._secondHandLayer, "setAnchorPoint:", CGPointMakeZero());
        objj_msgSend(self._secondHandLayer, "setPosition:", CGPointMake(0.0, 0.0));
        self._middleHandLayer = objj_msgSend(objj_msgSend(HandLayer, "alloc"), "initWithSize:", middleHandSize);
        objj_msgSend(self._middleHandLayer, "setBounds:", CGRectMake(0, 0, aFrame.size.width, aFrame.size.height));
        objj_msgSend(self._middleHandLayer, "setAnchorPoint:", CGPointMakeZero());
        objj_msgSend(self._middleHandLayer, "setPosition:", CGPointMake(0.0, 0.0));
        self._rootLayer = objj_msgSend(CALayer, "layer");
        objj_msgSend(self, "setWantsLayer:", YES);
        objj_msgSend(self, "setLayer:", self._rootLayer);
        objj_msgSend(self._hourHandLayer, "setNeedsDisplay");
        objj_msgSend(self._middleHandLayer, "setNeedsDisplay");
        objj_msgSend(self._secondHandLayer, "setNeedsDisplay");
        objj_msgSend(self._minuteHandLayer, "setNeedsDisplay");
        objj_msgSend(self._rootLayer, "addSublayer:", self._hourHandLayer);
        objj_msgSend(self._rootLayer, "addSublayer:", self._minuteHandLayer);
        objj_msgSend(self._rootLayer, "addSublayer:", self._secondHandLayer);
        objj_msgSend(self._rootLayer, "addSublayer:", self._middleHandLayer);
        objj_msgSend(self._rootLayer, "setNeedsDisplay");
    }
    return self;
}
,["id","CGRect","CPDatePicker"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPDatePickerClock__layoutSubviews(self, _cmd)
{
    if (objj_msgSend(self._datePicker, "datePickerStyle") == CPTextFieldAndStepperDatePickerStyle || objj_msgSend(self._datePicker, "datePickerStyle") == CPTextFieldDatePickerStyle)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerClock").super_class }, "layoutSubviews");
    var bounds = objj_msgSend(self, "bounds"),
        dateValue = objj_msgSend(objj_msgSend(self._datePicker, "dateValue"), "copy");
    objj_msgSend(dateValue, "_dateWithTimeZone:", objj_msgSend(self._datePicker, "timeZone"));
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self._datePicker, "currentValueForThemeAttribute:", "bezel-color-clock"));
    objj_msgSend(self._middleHandLayer, "setImage:", objj_msgSend(self._datePicker, "currentValueForThemeAttribute:", "middle-hand-image"));
    objj_msgSend(self._hourHandLayer, "setImage:", objj_msgSend(self._datePicker, "currentValueForThemeAttribute:", "hour-hand-image"));
    objj_msgSend(self._minuteHandLayer, "setImage:", objj_msgSend(self._datePicker, "currentValueForThemeAttribute:", "minute-hand-image"));
    objj_msgSend(self._secondHandLayer, "setImage:", objj_msgSend(self._datePicker, "currentValueForThemeAttribute:", "second-hand-image"));
    if (objj_msgSend(self._datePicker, "_isEnglishFormat"))
    {
        if (dateValue.getHours() > 11)
            objj_msgSend(self._PMAMTextField, "setStringValue:", "PM");
        else
            objj_msgSend(self._PMAMTextField, "setStringValue:", "AM");
        objj_msgSend(self._PMAMTextField, "sizeToFit");
        objj_msgSend(self._PMAMTextField, "setFrameOrigin:", CGPointMake(bounds.size.width / 2 - objj_msgSend(self._PMAMTextField, "frameSize").width / 2, bounds.size.height / 2 + 15));
        objj_msgSend(self._PMAMTextField, "setHidden:", NO);
    }
    else
    {
        objj_msgSend(self._PMAMTextField, "setHidden:", YES);
    }
    objj_msgSend(self._hourHandLayer, "setRotationRadians:", objj_msgSend(self, "_hourPositionRadianForDate:", dateValue));
    objj_msgSend(self._minuteHandLayer, "setRotationRadians:", objj_msgSend(self, "_minutePositionRadianForDate:", dateValue));
    objj_msgSend(self._secondHandLayer, "setRotationRadians:", objj_msgSend(self, "_secondPositionRadianForDate:", dateValue));
    objj_msgSend(self._PMAMTextField, "setEnabled:", self._isEnabled);
    objj_msgSend(self._hourHandLayer, "setEnabled:", self._isEnabled);
    objj_msgSend(self._middleHandLayer, "setEnabled:", self._isEnabled);
    objj_msgSend(self._secondHandLayer, "setEnabled:", self._isEnabled);
    objj_msgSend(self._minuteHandLayer, "setEnabled:", self._isEnabled);
    if ((objj_msgSend(self._datePicker, "datePickerElements") & CPHourMinuteSecondDatePickerElementFlag) == CPHourMinuteSecondDatePickerElementFlag)
        objj_msgSend(self._secondHandLayer, "setHidden:", NO);
    else
        objj_msgSend(self._secondHandLayer, "setHidden:", YES);
    objj_msgSend(self._rootLayer, "setNeedsDisplay");
}
,["void"]), new objj_method(sel_getUid("_hourPositionRadianForDate:"), function $_CPDatePickerClock___hourPositionRadianForDate_(self, _cmd, aDate)
{
    var hours = aDate.getHours() + aDate.getMinutes() / 60;
    return 360 * hours / 12 * RADIANS;
}
,["float","CPDate"]), new objj_method(sel_getUid("_secondPositionRadianForDate:"), function $_CPDatePickerClock___secondPositionRadianForDate_(self, _cmd, aDate)
{
    return 360 * aDate.getSeconds() / 60 * RADIANS;
}
,["float","CPDate"]), new objj_method(sel_getUid("_minutePositionRadianForDate:"), function $_CPDatePickerClock___minutePositionRadianForDate_(self, _cmd, aDate)
{
    var minutes = aDate.getMinutes() + aDate.getSeconds() / 60;
    return 360 * minutes / 60 * RADIANS;
}
,["float","CPDate"]), new objj_method(sel_getUid("setEnabled:"), function $_CPDatePickerClock__setEnabled_(self, _cmd, shouldEnable)
{
    shouldEnable = !!shouldEnable;
    if (shouldEnable === self._isEnabled)
        return;
    self._isEnabled = shouldEnable;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
,["void","BOOL"])]);
}{var the_class = objj_allocateClassPair(CALayer, "HandLayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isEnabled"), new objj_ivar("_image"), new objj_ivar("_imageLayer"), new objj_ivar("_rotationRadians")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isEnabled"), function $HandLayer__isEnabled(self, _cmd)
{
    return self._isEnabled;
}
,["BOOL"]), new objj_method(sel_getUid("setEnabled:"), function $HandLayer__setEnabled_(self, _cmd, newValue)
{
    self._isEnabled = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("initWithSize:"), function $HandLayer__initWithSize_(self, _cmd, aSize)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("HandLayer").super_class }, "init"))
    {
        self._isEnabled = YES;
        self._imageLayer = objj_msgSend(CALayer, "layer");
        self._rotationRadians = 0;
        objj_msgSend(self._imageLayer, "setDelegate:", self);
        objj_msgSend(self._imageLayer, "setBounds:", CGRectMake(0.0, 0.0, aSize.width, aSize.height));
        objj_msgSend(self, "addSublayer:", self._imageLayer);
    }
    return self;
}
,["id","CGSize"]), new objj_method(sel_getUid("setBounds:"), function $HandLayer__setBounds_(self, _cmd, aRect)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("HandLayer").super_class }, "setBounds:", aRect);
    objj_msgSend(self._imageLayer, "setPosition:", CGPointMake(CGRectGetMidX(aRect), CGRectGetMidY(aRect)));
}
,["void","CGRect"]), new objj_method(sel_getUid("setImage:"), function $HandLayer__setImage_(self, _cmd, anImage)
{
    if (self._image === anImage)
        return;
    if (objj_msgSend(anImage, "isKindOfClass:", objj_msgSend(_CPCibCustomResource, "class")))
        self._image = objj_msgSend(anImage, "imageFromCoder:", nil);
    else
        self._image = anImage;
    objj_msgSend(self._imageLayer, "setNeedsDisplay");
}
,["void","CPImage"]), new objj_method(sel_getUid("setRotationRadians:"), function $HandLayer__setRotationRadians_(self, _cmd, radians)
{
    if (self._rotationRadians === radians)
        return;
    self._rotationRadians = radians;
    objj_msgSend(self._imageLayer, "setAffineTransform:", CGAffineTransformScale(CGAffineTransformMakeRotation(self._rotationRadians), 1.0, 1.0));
}
,["void","float"]), new objj_method(sel_getUid("setEnabled:"), function $HandLayer__setEnabled_(self, _cmd, shouldEnable)
{
    shouldEnable = !!shouldEnable;
    if (self._isEnabled === shouldEnable)
        return;
    self._isEnabled = shouldEnable;
    objj_msgSend(self, "setNeedsDisplay");
    objj_msgSend(self._imageLayer, "setNeedsDisplay");
}
,["void","BOOL"]), new objj_method(sel_getUid("imageDidLoad:"), function $HandLayer__imageDidLoad_(self, _cmd, anImage)
{
    objj_msgSend(self._imageLayer, "setNeedsDisplay");
}
,["void","CPImage"]), new objj_method(sel_getUid("drawLayer:inContext:"), function $HandLayer__drawLayer_inContext_(self, _cmd, aLayer, aContext)
{
    if (objj_msgSend(self._image, "loadStatus") != CPImageLoadStatusCompleted)
        objj_msgSend(self._image, "setDelegate:", self);
    else
        CGContextDrawImage(aContext, objj_msgSend(aLayer, "bounds"), self._image);
}
,["void","CALayer","CGContext"])]);
}