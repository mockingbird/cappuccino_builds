@STATIC;1.0;i;11;CPControl.ji;8;CPFont.ji;13;CPTextField.ji;24;_CPDatePickerTextField.ji;23;_CPDatePickerCalendar.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;19;Foundation/CPDate.jI;21;Foundation/CPLocale.jI;23;Foundation/CPTimeZone.jt;33830;objj_executeFile("CPControl.j", YES);objj_executeFile("CPFont.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("_CPDatePickerTextField.j", YES);objj_executeFile("_CPDatePickerCalendar.j", YES);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPDate.j", NO);objj_executeFile("Foundation/CPLocale.j", NO);objj_executeFile("Foundation/CPTimeZone.j", NO);var CPDatePicker_validateProposedDateValue_timeInterval = 1 << 1;
CPSingleDateMode = 0;
CPRangeDateMode = 1;
CPTextFieldAndStepperDatePickerStyle = 0;
CPClockAndCalendarDatePickerStyle = 1;
CPTextFieldDatePickerStyle = 2;
CPHourMinuteDatePickerElementFlag = 0x000c;
CPHourMinuteSecondDatePickerElementFlag = 0x000e;
CPTimeZoneDatePickerElementFlag = 0x0010;
CPYearMonthDatePickerElementFlag = 0x00c0;
CPYearMonthDayDatePickerElementFlag = 0x00e0;
CPEraDatePickerElementFlag = 0x0100;
{var the_class = objj_allocateClassPair(CPControl, "CPDatePicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isBordered"), new objj_ivar("_isBezeled"), new objj_ivar("_drawsBackground"), new objj_ivar("_dateValue"), new objj_ivar("_minDate"), new objj_ivar("_maxDate"), new objj_ivar("_textFont"), new objj_ivar("_locale"), new objj_ivar("_timeZone"), new objj_ivar("_delegate"), new objj_ivar("_datePickerElements"), new objj_ivar("_datePickerMode"), new objj_ivar("_datePickerStyle"), new objj_ivar("_timeInterval"), new objj_ivar("_invokedByUserEvent"), new objj_ivar("_datePickerTextfield"), new objj_ivar("_datePickerCalendar"), new objj_ivar("_implementedCDatePickerDelegateMethods")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isBordered"), function $CPDatePicker__isBordered(self, _cmd)
{
    return self._isBordered;
}
,["BOOL"]), new objj_method(sel_getUid("setBordered:"), function $CPDatePicker__setBordered_(self, _cmd, newValue)
{
    self._isBordered = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("isBezeled"), function $CPDatePicker__isBezeled(self, _cmd)
{
    return self._isBezeled;
}
,["BOOL"]), new objj_method(sel_getUid("setBezeled:"), function $CPDatePicker__setBezeled_(self, _cmd, newValue)
{
    self._isBezeled = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("drawsBackground"), function $CPDatePicker__drawsBackground(self, _cmd)
{
    return self._drawsBackground;
}
,["BOOL"]), new objj_method(sel_getUid("setDrawsBackground:"), function $CPDatePicker__setDrawsBackground_(self, _cmd, newValue)
{
    self._drawsBackground = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("dateValue"), function $CPDatePicker__dateValue(self, _cmd)
{
    return self._dateValue;
}
,["CPDate"]), new objj_method(sel_getUid("setDateValue:"), function $CPDatePicker__setDateValue_(self, _cmd, newValue)
{
    self._dateValue = newValue;
}
,["void","CPDate"]), new objj_method(sel_getUid("minDate"), function $CPDatePicker__minDate(self, _cmd)
{
    return self._minDate;
}
,["CPDate"]), new objj_method(sel_getUid("setMinDate:"), function $CPDatePicker__setMinDate_(self, _cmd, newValue)
{
    self._minDate = newValue;
}
,["void","CPDate"]), new objj_method(sel_getUid("maxDate"), function $CPDatePicker__maxDate(self, _cmd)
{
    return self._maxDate;
}
,["CPDate"]), new objj_method(sel_getUid("setMaxDate:"), function $CPDatePicker__setMaxDate_(self, _cmd, newValue)
{
    self._maxDate = newValue;
}
,["void","CPDate"]), new objj_method(sel_getUid("textFont"), function $CPDatePicker__textFont(self, _cmd)
{
    return self._textFont;
}
,["CPFont"]), new objj_method(sel_getUid("setTextFont:"), function $CPDatePicker__setTextFont_(self, _cmd, newValue)
{
    self._textFont = newValue;
}
,["void","CPFont"]), new objj_method(sel_getUid("locale"), function $CPDatePicker__locale(self, _cmd)
{
    return self._locale;
}
,["CPLocale"]), new objj_method(sel_getUid("setLocale:"), function $CPDatePicker__setLocale_(self, _cmd, newValue)
{
    self._locale = newValue;
}
,["void","CPLocale"]), new objj_method(sel_getUid("timeZone"), function $CPDatePicker__timeZone(self, _cmd)
{
    return self._timeZone;
}
,["CPTimeZone"]), new objj_method(sel_getUid("setTimeZone:"), function $CPDatePicker__setTimeZone_(self, _cmd, newValue)
{
    self._timeZone = newValue;
}
,["void","CPTimeZone"]), new objj_method(sel_getUid("delegate"), function $CPDatePicker__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPDatePicker__setDelegate_(self, _cmd, newValue)
{
    self._delegate = newValue;
}
,["void","id"]), new objj_method(sel_getUid("datePickerElements"), function $CPDatePicker__datePickerElements(self, _cmd)
{
    return self._datePickerElements;
}
,["CPInteger"]), new objj_method(sel_getUid("setDatePickerElements:"), function $CPDatePicker__setDatePickerElements_(self, _cmd, newValue)
{
    self._datePickerElements = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("datePickerMode"), function $CPDatePicker__datePickerMode(self, _cmd)
{
    return self._datePickerMode;
}
,["CPInteger"]), new objj_method(sel_getUid("setDatePickerMode:"), function $CPDatePicker__setDatePickerMode_(self, _cmd, newValue)
{
    self._datePickerMode = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("datePickerStyle"), function $CPDatePicker__datePickerStyle(self, _cmd)
{
    return self._datePickerStyle;
}
,["CPInteger"]), new objj_method(sel_getUid("setDatePickerStyle:"), function $CPDatePicker__setDatePickerStyle_(self, _cmd, newValue)
{
    self._datePickerStyle = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("timeInterval"), function $CPDatePicker__timeInterval(self, _cmd)
{
    return self._timeInterval;
}
,["CPInteger"]), new objj_method(sel_getUid("setTimeInterval:"), function $CPDatePicker__setTimeInterval_(self, _cmd, newValue)
{
    self._timeInterval = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("_replacementKeyPathForBinding:"), function $CPDatePicker___replacementKeyPathForBinding_(self, _cmd, aBinding)
{
    if (aBinding == CPValueBinding)
        return "dateValue";
    if (aBinding == CPMinValueBinding)
        return "minDate";
    if (aBinding == CPMaxValueBinding)
        return "maxDate";
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "_replacementKeyPathForBinding:", aBinding);
}
,["CPString","CPString"]), new objj_method(sel_getUid("initWithFrame:"), function $CPDatePicker__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "initWithFrame:", aFrame))
    {
        self._drawsBackground = YES;
        self._datePickerStyle = CPTextFieldAndStepperDatePickerStyle;
        self._datePickerMode = CPSingleDateMode;
        self._datePickerElements = CPYearMonthDayDatePickerElementFlag | CPHourMinuteSecondDatePickerElementFlag;
        self._timeInterval = 0;
        self._implementedCDatePickerDelegateMethods = 0;
        (self == null ? null : self.isa.objj_msgSend1(self, "setObjectValue:", CPDate.isa.objj_msgSend0(CPDate, "date")));
        self._minDate = CPDate.isa.objj_msgSend0(CPDate, "distantPast");
        self._maxDate = CPDate.isa.objj_msgSend0(CPDate, "distantFuture");
        (self == null ? null : self.isa.objj_msgSend1(self, "setBezeled:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBordered:", YES));
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPDatePicker___init(self, _cmd)
{
    if (!self._locale)
        self._locale = CPLocale.isa.objj_msgSend0(CPLocale, "currentLocale");
    self._datePickerTextfield = ((___r1 = _CPDatePickerTextField.isa.objj_msgSend0(_CPDatePickerTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithFrame:withDatePicker:", self.isa.objj_msgSend0(self, "bounds"), self));
    ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDateValue:", self._dateValue));
    self._datePickerCalendar = ((___r1 = _CPDatePickerCalendar.isa.objj_msgSend0(_CPDatePickerCalendar, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithFrame:withDatePicker:", self.isa.objj_msgSend0(self, "bounds"), self));
    ((___r1 = self._datePickerCalendar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDateValue:", self._dateValue));
    ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", self.isa.objj_msgSend0(self, "isEnabled")));
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setControlSize:"), function $CPDatePicker__setControlSize_(self, _cmd, aControlSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "setControlSize:", aControlSize);
    if (self.isa.objj_msgSend0(self, "datePickerStyle") == CPTextFieldAndStepperDatePickerStyle || self.isa.objj_msgSend0(self, "datePickerStyle") == CPTextFieldDatePickerStyle)
        self.isa.objj_msgSend0(self, "_sizeToControlSize");
}
,["void","CPControlSize"]), new objj_method(sel_getUid("setDelegate:"), function $CPDatePicker__setDelegate_(self, _cmd, aDelegate)
{
    self._delegate = aDelegate;
    self._implementedCDatePickerDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("datePicker:validateProposedDateValue:timeInterval:"))))
        self._implementedCDatePickerDelegateMethods |= CPDatePicker_validateProposedDateValue_timeInterval;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("layoutSubviews"), function $CPDatePicker__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "layoutSubviews");
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
    {
        if (!((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "superview")))
            self.isa.objj_msgSend1(self, "addSubview:", self._datePickerTextfield);
        if (((___r1 = self._datePickerCalendar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "superview")))
            ((___r1 = self._datePickerCalendar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setControlSize:", self.isa.objj_msgSend0(self, "controlSize")));
        ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
        ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    }
    else
    {
        if (!((___r1 = self._datePickerCalendar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "superview")))
            self.isa.objj_msgSend1(self, "addSubview:", self._datePickerCalendar);
        if (((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "superview")))
            ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        ((___r1 = self._datePickerCalendar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
        ((___r1 = self._datePickerCalendar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("objectValue"), function $CPDatePicker__objectValue(self, _cmd)
{
    return self._dateValue;
}
,["id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPDatePicker__setObjectValue_(self, _cmd, aValue)
{
    if (!(aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "isKindOfClass:", CPDate.isa.objj_msgSend0(CPDate, "class"))))
        return;
    self.isa.objj_msgSend1(self, "setDateValue:", aValue);
}
,["void","CPDate"]), new objj_method(sel_getUid("setDateValue:"), function $CPDatePicker__setDateValue_(self, _cmd, aDateValue)
{
    if (aDateValue == nil)
        return;
    self._invokedByUserEvent = NO;
    self.isa.objj_msgSend2(self, "_setDateValue:timeInterval:", aDateValue, self._timeInterval);
}
,["void","CPDate"]), new objj_method(sel_getUid("_setDateValue:timeInterval:"), function $CPDatePicker___setDateValue_timeInterval_(self, _cmd, aDateValue, aTimeInterval)
{
    if (self._minDate)
        aDateValue = new Date(MAX(aDateValue, self._minDate));
    if (self._maxDate)
        aDateValue = new Date(MIN(aDateValue, self._maxDate));
    aTimeInterval = MAX(MIN(aTimeInterval, ((___r1 = self._maxDate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "timeIntervalSinceDate:", aDateValue))), ((___r1 = self._minDate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "timeIntervalSinceDate:", aDateValue)));
    if ((aDateValue == null ? null : aDateValue.isa.objj_msgSend1(aDateValue, "isEqualToDate:", self._dateValue)) && aTimeInterval == self._timeInterval)
    {
        if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
            ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDateValue:", self._dateValue));
        else
            ((___r1 = self._datePickerCalendar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDateValue:", self._dateValue));
        return;
    }
    if (self._implementedCDatePickerDelegateMethods & CPDatePicker_validateProposedDateValue_timeInterval)
    {
        var aStartDateRef = function(x)
        {
            if (typeof x == 'undefined')
                return aDateValue;
            aDateValue = x;
        };
        var aTimeIntervalRef = function(x)
        {
            if (typeof x == 'undefined')
                return aTimeInterval;
            aTimeInterval = x;
        };
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "datePicker:validateProposedDateValue:timeInterval:", self, aStartDateRef, aTimeIntervalRef));
    }
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "objectValue");
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "dateValue");
    self._dateValue = aDateValue;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "setObjectValue:", self._dateValue);
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "objectValue");
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "dateValue");
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "timeInterval");
    self._timeInterval = self._datePickerMode == CPSingleDateMode ? 0 : aTimeInterval;
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "timeInterval");
    if (self._invokedByUserEvent)
        self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
        ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDateValue:", self._dateValue));
    else
        ((___r1 = self._datePickerCalendar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDateValue:", self._dateValue));
    var ___r1;
}
,["void","CPDate","CPTimeInterval"]), new objj_method(sel_getUid("setMinDate:"), function $CPDatePicker__setMinDate_(self, _cmd, aMinDate)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "minDate");
    self._minDate = aMinDate;
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "minDate");
    self.isa.objj_msgSend2(self, "_setDateValue:timeInterval:", self._dateValue, self._timeInterval);
}
,["void","CPDate"]), new objj_method(sel_getUid("setMaxDate:"), function $CPDatePicker__setMaxDate_(self, _cmd, aMaxDate)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "maxDate");
    self._maxDate = aMaxDate;
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "maxDate");
    self.isa.objj_msgSend2(self, "_setDateValue:timeInterval:", self._dateValue, self._timeInterval);
}
,["void","CPDate"]), new objj_method(sel_getUid("setDatePickerStyle:"), function $CPDatePicker__setDatePickerStyle_(self, _cmd, aDatePickerStyle)
{
    self._datePickerStyle = aDatePickerStyle;
    self.isa.objj_msgSend1(self, "setControlSize:", self.isa.objj_msgSend0(self, "controlSize"));
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPInteger"]), new objj_method(sel_getUid("setDatePickerElements:"), function $CPDatePicker__setDatePickerElements_(self, _cmd, aDatePickerElements)
{
    self._datePickerElements = aDatePickerElements;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPInteger"]), new objj_method(sel_getUid("setDatePickerMode:"), function $CPDatePicker__setDatePickerMode_(self, _cmd, aDatePickerMode)
{
    self._datePickerMode = aDatePickerMode;
    if (self._datePickerMode == CPSingleDateMode)
        self.isa.objj_msgSend2(self, "_setDateValue:timeInterval:", self.isa.objj_msgSend0(self, "dateValue"), 0);
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPInteger"]), new objj_method(sel_getUid("setTimeInterval:"), function $CPDatePicker__setTimeInterval_(self, _cmd, aTimeInterval)
{
    if (self._datePickerMode == CPSingleDateMode)
        return;
    self.isa.objj_msgSend2(self, "_setDateValue:timeInterval:", self.isa.objj_msgSend0(self, "dateValue"), aTimeInterval);
}
,["void","CPInteger"]), new objj_method(sel_getUid("setLocale:"), function $CPDatePicker__setLocale_(self, _cmd, aLocale)
{
    self._locale = aLocale;
    if (self._formatter)
    {
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "locale");
        ((___r1 = self._formatter), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLocale:", self._locale));
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "locale");
    }
    ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDateValue:", self._dateValue));
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","CPLocale"]), new objj_method(sel_getUid("setBezeled:"), function $CPDatePicker__setBezeled_(self, _cmd, shouldBeBezeled)
{
    self._isBezeled = shouldBeBezeled;
    if (shouldBeBezeled)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateBezeled);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateBezeled);
}
,["void","BOOL"]), new objj_method(sel_getUid("setBordered:"), function $CPDatePicker__setBordered_(self, _cmd, shouldBeBordered)
{
    self._isBordered = shouldBeBordered;
    if (shouldBeBordered)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateBordered);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateBordered);
}
,["void","BOOL"]), new objj_method(sel_getUid("setTextFont:"), function $CPDatePicker__setTextFont_(self, _cmd, aFont)
{
    self.isa.objj_msgSend1(self, "setFont:", aFont);
}
,["void","CPFont"]), new objj_method(sel_getUid("setEnabled:"), function $CPDatePicker__setEnabled_(self, _cmd, aBoolean)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "setEnabled:", aBoolean);
    ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", aBoolean));
    ((___r1 = self._datePickerCalendar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", aBoolean));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPDatePicker__setBackgroundColor_(self, _cmd, aColor)
{
    self._backgroundColor = aColor;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("setDrawsBackground:"), function $CPDatePicker__setDrawsBackground_(self, _cmd, aBoolean)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "drawsBackground");
    self._drawsBackground = aBoolean;
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "drawsBackground");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("setTimeZone:"), function $CPDatePicker__setTimeZone_(self, _cmd, aTimeZone)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "timeZone");
    self._timeZone = aTimeZone;
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "timeZone");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
        ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDateValue:", self._dateValue));
    else
        ((___r1 = self._datePickerCalendar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDateValue:", self._dateValue));
    var ___r1;
}
,["void","CPTimeZone"]), new objj_method(sel_getUid("becomeFirstResponder"), function $CPDatePicker__becomeFirstResponder(self, _cmd)
{
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
    {
        if (!objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "becomeFirstResponder"))
            return NO;
        ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_selectTextFieldWithFlags:", ((___r2 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "modifierFlags"))));
        return YES;
    }
    return NO;
    var ___r1, ___r2;
}
,["BOOL"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPDatePicker__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPDatePicker__resignFirstResponder(self, _cmd)
{
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
        ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "resignFirstResponder"));
    return YES;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("isBezeled"), function $CPDatePicker__isBezeled(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateBezeled);
}
,["BOOL"]), new objj_method(sel_getUid("isBordered"), function $CPDatePicker__isBordered(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateBordered);
}
,["BOOL"]), new objj_method(sel_getUid("textFont"), function $CPDatePicker__textFont(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "font");
}
,["CPFont"]), new objj_method(sel_getUid("_isAmericanFormat"), function $CPDatePicker___isAmericanFormat(self, _cmd)
{
    return ((___r1 = ((___r2 = self._locale), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectForKey:", CPLocaleCountryCode))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToString:", "US"));
    var ___r1, ___r2;
}
,["BOOL"]), new objj_method(sel_getUid("_isEnglishFormat"), function $CPDatePicker___isEnglishFormat(self, _cmd)
{
    return ((___r1 = ((___r2 = self._locale), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectForKey:", CPLocaleLanguageCode))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToString:", "en"));
    var ___r1, ___r2;
}
,["BOOL"]), new objj_method(sel_getUid("keyDown:"), function $CPDatePicker__keyDown_(self, _cmd, anEvent)
{
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
        ((___r1 = self._datePickerTextfield), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "keyDown:", anEvent));
    var ___r1;
}
,["void","CPEvent"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPDatePicker__defaultThemeClass(self, _cmd)
{
    return "datePicker";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPDatePicker__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPColor.isa.objj_msgSend0(CPColor, "clearColor"), "bezel-color", 1.0, "border-width", CPColor.isa.objj_msgSend0(CPColor, "clearColor"), "border-color", CGInsetMakeZero(), "content-inset", CGInsetMakeZero(), "bezel-inset", CPColor.isa.objj_msgSend0(CPColor, "clearColor"), "datepicker-textfield-bezel-color", CGSizeMakeZero(), "min-size-datepicker-textfield", CGInsetMakeZero(), "content-inset-datepicker-textfield", CGInsetMakeZero(), "content-inset-datepicker-textfield-separator", CGInsetMakeZero(), "separator-content-inset", 5.0, "date-hour-margin", 5.0, "stepper-margin", CPColor.isa.objj_msgSend0(CPColor, "clearColor"), "bezel-color-calendar", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "title-text-color", CPColor.isa.objj_msgSend0(CPColor, "clearColor"), "title-text-shadow-color", CGSizeMakeZero(), "title-text-shadow-offset", CPNull.isa.objj_msgSend0(CPNull, "null"), "title-font", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "weekday-text-color", CPColor.isa.objj_msgSend0(CPColor, "clearColor"), "weekday-text-shadow-color", CGSizeMakeZero(), "weekday-text-shadow-offset", CPNull.isa.objj_msgSend0(CPNull, "null"), "weekday-font", CPNull.isa.objj_msgSend0(CPNull, "null"), "arrow-image-left", CPNull.isa.objj_msgSend0(CPNull, "null"), "arrow-image-right", CPNull.isa.objj_msgSend0(CPNull, "null"), "arrow-image-left-highlighted", CPNull.isa.objj_msgSend0(CPNull, "null"), "arrow-image-right-highlighted", CGInsetMakeZero(), "arrow-inset", CPNull.isa.objj_msgSend0(CPNull, "null"), "circle-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "circle-image-highlighted", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "tile-text-color", CPColor.isa.objj_msgSend0(CPColor, "clearColor"), "tile-text-shadow-color", CGSizeMakeZero(), "tile-text-shadow-offset", CPNull.isa.objj_msgSend0(CPNull, "null"), "tile-font", CGSizeMakeZero(), "size-tile", CGSizeMakeZero(), "size-calendar", CGSizeMakeZero(), "size-header", CGSizeMakeZero(), "min-size-calendar", CGSizeMakeZero(), "max-size-calendar", CPColor.isa.objj_msgSend0(CPColor, "clearColor"), "bezel-color-clock", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "clock-text-color", CPColor.isa.objj_msgSend0(CPColor, "clearColor"), "clock-text-shadow-color", CGSizeMakeZero(), "clock-text-shadow-offset", CPNull.isa.objj_msgSend0(CPNull, "null"), "clock-font", CPNull.isa.objj_msgSend0(CPNull, "null"), "second-hand-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "hour-hand-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "middle-hand-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "minute-hand-image", CGSizeMakeZero(), "size-clock", CGSizeMakeZero(), "second-hand-size", CGSizeMakeZero(), "hour-hand-size", CGSizeMakeZero(), "middle-hand-size", CGSizeMakeZero(), "minute-hand-size");
}
,["CPDictionary"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPDatePicker___binderClassForBinding_(self, _cmd, theBinding)
{
    if (theBinding == CPValueBinding || theBinding == CPMinValueBinding || theBinding == CPMaxValueBinding)
        return (_CPDatePickerValueBinder == null ? null : _CPDatePickerValueBinder.isa.objj_msgSend0(_CPDatePickerValueBinder, "class"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPDatePicker").super_class }, "_binderClassForBinding:", theBinding);
}
,["Class","CPString"])]);
}var CPDatePickerModeKey = "CPDatePickerModeKey",
    CPIntervalKey = "CPIntervalKey",
    CPMinDateKey = "CPMinDateKey",
    CPMaxDateKey = "CPMaxDateKey",
    CPBackgroundColorKey = "CPBackgroundColorKey",
    CPDrawsBackgroundKey = "CPDrawsBackgroundKey",
    CPTextFontKey = "CPTextFontKey",
    CPDatePickerElementsKey = "CPDatePickerElementsKey",
    CPDatePickerStyleKey = "CPDatePickerStyleKey",
    CPLocaleKey = "CPLocaleKey",
    CPBorderedKey = "CPBorderedKey",
    CPDateValueKey = "CPDateValueKey";
{
var the_class = objj_getClass("CPDatePicker")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDatePicker\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPDatePicker__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._textFont = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTextFontKey));
        self._minDate = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMinDateKey)) || CPDate.isa.objj_msgSend0(CPDate, "distantPast");
        self._maxDate = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMaxDateKey)) || CPDate.isa.objj_msgSend0(CPDate, "distantFuture");
        self._timeInterval = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", CPIntervalKey));
        self._datePickerMode = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPDatePickerModeKey));
        self._datePickerElements = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPDatePickerElementsKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDatePickerStyle:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPDatePickerStyleKey))));
        self._locale = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPLocaleKey));
        self._dateValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPDateValueKey));
        self._backgroundColor = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPBackgroundColorKey));
        self._drawsBackground = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPDrawsBackgroundKey));
        self._isBordered = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPBorderedKey));
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPDatePicker__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeDouble:forKey:", self._timeInterval, CPIntervalKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._datePickerMode, CPDatePickerModeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._datePickerStyle, CPDatePickerStyleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._datePickerElements, CPDatePickerElementsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._minDate, CPMinDateKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._maxDate, CPMaxDateKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._dateValue, CPDateValueKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._textFont, CPTextFontKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._locale, CPLocaleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._backgroundColor, CPBackgroundColorKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._drawsBackground, CPDrawsBackgroundKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._isBordered, CPBorderedKey));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPDatePickerValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}{
var the_class = objj_getClass("CPDate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_daysInMonth"), function $CPDate___daysInMonth(self, _cmd)
{
    return 32 - (new Date(self.getFullYear(), self.getMonth(), 32)).getDate();
}
,["int"]), new objj_method(sel_getUid("_resetToMidnight"), function $CPDate___resetToMidnight(self, _cmd)
{
    self.setHours(0);
    self.setMinutes(0);
    self.setSeconds(0);
    self.setMilliseconds(0);
}
,["void"]), new objj_method(sel_getUid("_resetToLastSeconds"), function $CPDate___resetToLastSeconds(self, _cmd)
{
    self.setHours(23);
    self.setMinutes(59);
    self.setSeconds(59);
    self.setMilliseconds(99);
}
,["void"])]);
}