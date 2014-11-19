@STATIC;1.0;i;8;CPView.ji;13;CPTextField.ji;13;CPImageView.ji;9;CALayer.jt;18957;objj_executeFile("CPView.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CALayer.j", YES);var RADIANS = Math.PI / 180;
{var the_class = objj_allocateClassPair(CPView, "_CPDatePickerClock"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isEnabled"), new objj_ivar("_rootLayer"), new objj_ivar("_hourHandLayer"), new objj_ivar("_minuteHandLayer"), new objj_ivar("_secondHandLayer"), new objj_ivar("_middleHandLayer"), new objj_ivar("_datePicker"), new objj_ivar("_PMAMTextField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:datePicker:"), function $_CPDatePickerClock__initWithFrame_datePicker_(self, _cmd, aFrame, aDatePicker)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerClock").super_class }, "initWithFrame:", aFrame))
    {
        self._datePicker = aDatePicker;
        self._PMAMTextField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForThemeAttribute:inState:", "clock-font", CPThemeStateNormal)), "font", CPThemeStateNormal));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForThemeAttribute:inState:", "clock-text-color", CPThemeStateNormal)), "text-color", CPThemeStateNormal));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForThemeAttribute:inState:", "clock-text-shadow-color", CPThemeStateNormal)), "text-shadow-color", CPThemeStateNormal));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForThemeAttribute:inState:", "clock-text-shadow-offset", CPThemeStateNormal)), "text-shadow-offset", CPThemeStateNormal));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForThemeAttribute:inState:", "clock-font", CPThemeStateDisabled)), "font", CPThemeStateDisabled));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForThemeAttribute:inState:", "clock-text-color", CPThemeStateDisabled)), "text-color", CPThemeStateDisabled));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForThemeAttribute:inState:", "clock-text-shadow-color", CPThemeStateDisabled)), "text-shadow-color", CPThemeStateDisabled));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForThemeAttribute:inState:", "clock-text-shadow-offset", CPThemeStateDisabled)), "text-shadow-offset", CPThemeStateDisabled));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._PMAMTextField));
        var middleHandSize = ((___r1 = self._datePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "middle-hand-size")),
            minuteHandSize = ((___r1 = self._datePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "minute-hand-size")),
            hourHandSize = ((___r1 = self._datePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "hour-hand-size")),
            secondHandSize = ((___r1 = self._datePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "second-hand-size"));
        self._hourHandLayer = ((___r1 = (HandLayer == null ? null : HandLayer.isa.objj_msgSend0(HandLayer, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithSize:", hourHandSize));
        ((___r1 = self._hourHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBounds:", CGRectMake(0, 0, aFrame.size.width, aFrame.size.height)));
        ((___r1 = self._hourHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAnchorPoint:", CGPointMakeZero()));
        ((___r1 = self._hourHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPosition:", CGPointMake(0.0, 0.0)));
        self._minuteHandLayer = ((___r1 = (HandLayer == null ? null : HandLayer.isa.objj_msgSend0(HandLayer, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithSize:", minuteHandSize));
        ((___r1 = self._minuteHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBounds:", CGRectMake(0, 0, aFrame.size.width, aFrame.size.height)));
        ((___r1 = self._minuteHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAnchorPoint:", CGPointMakeZero()));
        ((___r1 = self._minuteHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPosition:", CGPointMake(0.0, 0.0)));
        self._secondHandLayer = ((___r1 = (HandLayer == null ? null : HandLayer.isa.objj_msgSend0(HandLayer, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithSize:", secondHandSize));
        ((___r1 = self._secondHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBounds:", CGRectMake(0, 0, aFrame.size.width, aFrame.size.height)));
        ((___r1 = self._secondHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAnchorPoint:", CGPointMakeZero()));
        ((___r1 = self._secondHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPosition:", CGPointMake(0.0, 0.0)));
        self._middleHandLayer = ((___r1 = (HandLayer == null ? null : HandLayer.isa.objj_msgSend0(HandLayer, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithSize:", middleHandSize));
        ((___r1 = self._middleHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBounds:", CGRectMake(0, 0, aFrame.size.width, aFrame.size.height)));
        ((___r1 = self._middleHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAnchorPoint:", CGPointMakeZero()));
        ((___r1 = self._middleHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPosition:", CGPointMake(0.0, 0.0)));
        self._rootLayer = CALayer.isa.objj_msgSend0(CALayer, "layer");
        (self == null ? null : self.isa.objj_msgSend1(self, "setWantsLayer:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setLayer:", self._rootLayer));
        ((___r1 = self._hourHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsDisplay"));
        ((___r1 = self._middleHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsDisplay"));
        ((___r1 = self._secondHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsDisplay"));
        ((___r1 = self._minuteHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsDisplay"));
        ((___r1 = self._rootLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSublayer:", self._hourHandLayer));
        ((___r1 = self._rootLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSublayer:", self._minuteHandLayer));
        ((___r1 = self._rootLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSublayer:", self._secondHandLayer));
        ((___r1 = self._rootLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSublayer:", self._middleHandLayer));
        ((___r1 = self._rootLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsDisplay"));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CGRect","CPDatePicker"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPDatePickerClock__layoutSubviews(self, _cmd)
{
    if (((___r1 = self._datePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "datePickerStyle")) == CPTextFieldAndStepperDatePickerStyle || ((___r1 = self._datePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "datePickerStyle")) == CPTextFieldDatePickerStyle)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerClock").super_class }, "layoutSubviews");
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        dateValue = ((___r1 = ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "dateValue"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    (dateValue == null ? null : dateValue.isa.objj_msgSend1(dateValue, "_dateWithTimeZone:", ((___r1 = self._datePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "timeZone"))));
    self.isa.objj_msgSend1(self, "setBackgroundColor:", ((___r1 = self._datePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "bezel-color-clock")));
    ((___r1 = self._middleHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "middle-hand-image"))));
    ((___r1 = self._hourHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "hour-hand-image"))));
    ((___r1 = self._minuteHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "minute-hand-image"))));
    ((___r1 = self._secondHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._datePicker), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "second-hand-image"))));
    if (((___r1 = self._datePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_isEnglishFormat")))
    {
        if (dateValue.getHours() > 11)
            ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "PM"));
        else
            ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "AM"));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(bounds.size.width / 2 - ((___r2 = self._PMAMTextField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frameSize")).width / 2, bounds.size.height / 2 + 15)));
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    }
    else
    {
        ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    }
    ((___r1 = self._hourHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setRotationRadians:", self.isa.objj_msgSend1(self, "_hourPositionRadianForDate:", dateValue)));
    ((___r1 = self._minuteHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setRotationRadians:", self.isa.objj_msgSend1(self, "_minutePositionRadianForDate:", dateValue)));
    ((___r1 = self._secondHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setRotationRadians:", self.isa.objj_msgSend1(self, "_secondPositionRadianForDate:", dateValue)));
    ((___r1 = self._PMAMTextField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", self._isEnabled));
    ((___r1 = self._hourHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", self._isEnabled));
    ((___r1 = self._middleHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", self._isEnabled));
    ((___r1 = self._secondHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", self._isEnabled));
    ((___r1 = self._minuteHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", self._isEnabled));
    if ((((___r1 = self._datePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "datePickerElements")) & CPHourMinuteSecondDatePickerElementFlag) == CPHourMinuteSecondDatePickerElementFlag)
        ((___r1 = self._secondHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    else
        ((___r1 = self._secondHandLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    ((___r1 = self._rootLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsDisplay"));
    var ___r1, ___r2;
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
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
    var ___r1;
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
        self._imageLayer = CALayer.isa.objj_msgSend0(CALayer, "layer");
        self._rotationRadians = 0;
        ((___r1 = self._imageLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
        ((___r1 = self._imageLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBounds:", CGRectMake(0.0, 0.0, aSize.width, aSize.height)));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSublayer:", self._imageLayer));
    }
    return self;
    var ___r1;
}
,["id","CGSize"]), new objj_method(sel_getUid("setBounds:"), function $HandLayer__setBounds_(self, _cmd, aRect)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("HandLayer").super_class }, "setBounds:", aRect);
    ((___r1 = self._imageLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPosition:", CGPointMake(CGRectGetMidX(aRect), CGRectGetMidY(aRect))));
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("setImage:"), function $HandLayer__setImage_(self, _cmd, anImage)
{
    if (self._image === anImage)
        return;
    if ((anImage == null ? null : anImage.isa.objj_msgSend1(anImage, "isKindOfClass:", (_CPCibCustomResource == null ? null : _CPCibCustomResource.isa.objj_msgSend0(_CPCibCustomResource, "class")))))
        self._image = (anImage == null ? null : anImage.isa.objj_msgSend1(anImage, "imageFromCoder:", nil));
    else
        self._image = anImage;
    ((___r1 = self._imageLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsDisplay"));
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("setRotationRadians:"), function $HandLayer__setRotationRadians_(self, _cmd, radians)
{
    if (self._rotationRadians === radians)
        return;
    self._rotationRadians = radians;
    ((___r1 = self._imageLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAffineTransform:", CGAffineTransformScale(CGAffineTransformMakeRotation(self._rotationRadians), 1.0, 1.0)));
    var ___r1;
}
,["void","float"]), new objj_method(sel_getUid("setEnabled:"), function $HandLayer__setEnabled_(self, _cmd, shouldEnable)
{
    shouldEnable = !!shouldEnable;
    if (self._isEnabled === shouldEnable)
        return;
    self._isEnabled = shouldEnable;
    self.isa.objj_msgSend0(self, "setNeedsDisplay");
    ((___r1 = self._imageLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsDisplay"));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("imageDidLoad:"), function $HandLayer__imageDidLoad_(self, _cmd, anImage)
{
    ((___r1 = self._imageLayer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsDisplay"));
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("drawLayer:inContext:"), function $HandLayer__drawLayer_inContext_(self, _cmd, aLayer, aContext)
{
    if (((___r1 = self._image), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "loadStatus")) != CPImageLoadStatusCompleted)
        ((___r1 = self._image), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    else
        CGContextDrawImage(aContext, (aLayer == null ? null : aLayer.isa.objj_msgSend0(aLayer, "bounds")), self._image);
    var ___r1;
}
,["void","CALayer","CGContext"])]);
}