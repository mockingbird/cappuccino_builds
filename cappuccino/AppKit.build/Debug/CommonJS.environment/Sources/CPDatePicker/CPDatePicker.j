@STATIC;1.0;i;11;CPControl.ji;8;CPFont.ji;13;CPTextField.ji;24;_CPDatePickerTextField.ji;23;_CPDatePickerCalendar.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;19;Foundation/CPDate.jI;28;Foundation/CPDateFormatter.jI;21;Foundation/CPLocale.jI;23;Foundation/CPTimeZone.jt;27905;objj_executeFile("CPControl.j", YES);objj_executeFile("CPFont.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("_CPDatePickerTextField.j", YES);objj_executeFile("_CPDatePickerCalendar.j", YES);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPDate.j", NO);objj_executeFile("Foundation/CPDateFormatter.j", NO);objj_executeFile("Foundation/CPLocale.j", NO);objj_executeFile("Foundation/CPTimeZone.j", NO);var CPDatePicker_validateProposedDateValue_timeInterval = 1 << 1;
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isBordered"), new objj_ivar("_isBezeled"), new objj_ivar("_drawsBackground"), new objj_ivar("_dateValue"), new objj_ivar("_minDate"), new objj_ivar("_maxDate"), new objj_ivar("_textFont"), new objj_ivar("_locale"), new objj_ivar("_timeZone"), new objj_ivar("_delegate"), new objj_ivar("_datePickerElements"), new objj_ivar("_datePickerMode"), new objj_ivar("_datePickerStyle"), new objj_ivar("_timeInterval"), new objj_ivar("_datePickerTextfield"), new objj_ivar("_datePickerCalendar"), new objj_ivar("_implementedCDatePickerDelegateMethods")]);objj_registerClassPair(the_class);
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
        objj_msgSend(self, "setObjectValue:", objj_msgSend(CPDate, "date"));
        self._minDate = objj_msgSend(CPDate, "distantPast");
        self._maxDate = objj_msgSend(CPDate, "distantFuture");
        objj_msgSend(self, "setBezeled:", YES);
        objj_msgSend(self, "setBordered:", YES);
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPDatePicker___init(self, _cmd)
{
    if (!self._locale)
        self._locale = objj_msgSend(CPLocale, "currentLocale");
    self._datePickerTextfield = objj_msgSend(objj_msgSend(_CPDatePickerTextField, "alloc"), "initWithFrame:withDatePicker:", objj_msgSend(self, "bounds"), self);
    objj_msgSend(self._datePickerTextfield, "setDateValue:", self._dateValue);
    objj_msgSend(self, "addSubview:", self._datePickerTextfield);
    self._datePickerCalendar = objj_msgSend(objj_msgSend(_CPDatePickerCalendar, "alloc"), "initWithFrame:withDatePicker:", objj_msgSend(self, "bounds"), self);
    objj_msgSend(self._datePickerCalendar, "setDateValue:", self._dateValue);
    objj_msgSend(self._datePickerCalendar, "setHidden:", YES);
    objj_msgSend(self, "addSubview:", self._datePickerCalendar);
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("setDelegate:"), function $CPDatePicker__setDelegate_(self, _cmd, aDelegate)
{
    self._delegate = aDelegate;
    self._implementedCDatePickerDelegateMethods = 0;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("datePicker:validateProposedDateValue:timeInterval:")))
        self._implementedCDatePickerDelegateMethods |= CPDatePicker_validateProposedDateValue_timeInterval;
}
,["void","id"]), new objj_method(sel_getUid("layoutSubviews"), function $CPDatePicker__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "layoutSubviews");
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
    {
        objj_msgSend(self._datePickerTextfield, "setHidden:", NO);
        objj_msgSend(self._datePickerCalendar, "setHidden:", YES);
        objj_msgSend(self._datePickerTextfield, "setNeedsLayout");
    }
    else
    {
        objj_msgSend(self._datePickerCalendar, "setHidden:", NO);
        objj_msgSend(self._datePickerTextfield, "setHidden:", YES);
        objj_msgSend(self._datePickerCalendar, "setNeedsLayout");
    }
}
,["void"]), new objj_method(sel_getUid("objectValue"), function $CPDatePicker__objectValue(self, _cmd)
{
    return self._dateValue;
}
,["id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPDatePicker__setObjectValue_(self, _cmd, aValue)
{
    objj_msgSend(self, "setDateValue:", aValue);
}
,["void","CPDate"]), new objj_method(sel_getUid("setDateValue:"), function $CPDatePicker__setDateValue_(self, _cmd, aDateValue)
{
    if (aDateValue == nil)
        return;
    objj_msgSend(self, "_setDateValue:timeInterval:", aDateValue, self._timeInterval);
}
,["void","CPDate"]), new objj_method(sel_getUid("_setDateValue:timeInterval:"), function $CPDatePicker___setDateValue_timeInterval_(self, _cmd, aDateValue, aTimeInterval)
{
    if (self._minDate)
        aDateValue = new Date(MAX(aDateValue, self._minDate));
    if (self._maxDate)
        aDateValue = new Date(MIN(aDateValue, self._maxDate));
    aTimeInterval = MAX(MIN(aTimeInterval, objj_msgSend(self._maxDate, "timeIntervalSinceDate:", aDateValue)), objj_msgSend(self._minDate, "timeIntervalSinceDate:", aDateValue));
    if (objj_msgSend(aDateValue, "isEqualToDate:", self._dateValue) && aTimeInterval == self._timeInterval)
    {
        if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
            objj_msgSend(self._datePickerTextfield, "setDateValue:", self._dateValue);
        else
            objj_msgSend(self._datePickerCalendar, "setDateValue:", self._dateValue);
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
        objj_msgSend(self._delegate, "datePicker:validateProposedDateValue:timeInterval:", self, aStartDateRef, aTimeIntervalRef);
    }
    objj_msgSend(self, "willChangeValueForKey:", "objectValue");
    objj_msgSend(self, "willChangeValueForKey:", "dateValue");
    self._dateValue = aDateValue;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "setObjectValue:", self._dateValue);
    objj_msgSend(self, "didChangeValueForKey:", "objectValue");
    objj_msgSend(self, "didChangeValueForKey:", "dateValue");
    objj_msgSend(self, "willChangeValueForKey:", "timeInterval");
    self._timeInterval = self._datePickerMode == CPSingleDateMode ? 0 : aTimeInterval;
    objj_msgSend(self, "didChangeValueForKey:", "timeInterval");
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
        objj_msgSend(self._datePickerTextfield, "setDateValue:", self._dateValue);
    else
        objj_msgSend(self._datePickerCalendar, "setDateValue:", self._dateValue);
}
,["void","CPDate","CPTimeInterval"]), new objj_method(sel_getUid("setMinDate:"), function $CPDatePicker__setMinDate_(self, _cmd, aMinDate)
{
    objj_msgSend(self, "willChangeValueForKey:", "minDate");
    self._minDate = aMinDate;
    objj_msgSend(self, "didChangeValueForKey:", "minDate");
    objj_msgSend(self, "_setDateValue:timeInterval:", self._dateValue, self._timeInterval);
}
,["void","CPDate"]), new objj_method(sel_getUid("setMaxDate:"), function $CPDatePicker__setMaxDate_(self, _cmd, aMaxDate)
{
    objj_msgSend(self, "willChangeValueForKey:", "maxDate");
    self._maxDate = aMaxDate;
    objj_msgSend(self, "didChangeValueForKey:", "maxDate");
    objj_msgSend(self, "_setDateValue:timeInterval:", self._dateValue, self._timeInterval);
}
,["void","CPDate"]), new objj_method(sel_getUid("setDatePickerStyle:"), function $CPDatePicker__setDatePickerStyle_(self, _cmd, aDatePickerStyle)
{
    self._datePickerStyle = aDatePickerStyle;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPInteger"]), new objj_method(sel_getUid("setDatePickerElements:"), function $CPDatePicker__setDatePickerElements_(self, _cmd, aDatePickerElements)
{
    self._datePickerElements = aDatePickerElements;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPInteger"]), new objj_method(sel_getUid("setDatePickerMode:"), function $CPDatePicker__setDatePickerMode_(self, _cmd, aDatePickerMode)
{
    self._datePickerMode = aDatePickerMode;
    if (self._datePickerMode == CPSingleDateMode)
        objj_msgSend(self, "_setDateValue:timeInterval:", objj_msgSend(self, "dateValue"), 0);
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPInteger"]), new objj_method(sel_getUid("setTimeInterval:"), function $CPDatePicker__setTimeInterval_(self, _cmd, aTimeInterval)
{
    if (self._datePickerMode == CPSingleDateMode)
        return;
    objj_msgSend(self, "_setDateValue:timeInterval:", objj_msgSend(self, "dateValue"), aTimeInterval);
}
,["void","CPInteger"]), new objj_method(sel_getUid("setLocale:"), function $CPDatePicker__setLocale_(self, _cmd, aLocale)
{
    self._locale = aLocale;
    if (self._formatter)
    {
        objj_msgSend(self, "willChangeValueForKey:", "locale");
        objj_msgSend(self._formatter, "setLocale:", self._locale);
        objj_msgSend(self, "didChangeValueForKey:", "locale");
    }
    objj_msgSend(self._datePickerTextfield, "setDateValue:", self._dateValue);
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPLocale"]), new objj_method(sel_getUid("setBezeled:"), function $CPDatePicker__setBezeled_(self, _cmd, shouldBeBezeled)
{
    self._isBezeled = shouldBeBezeled;
    if (shouldBeBezeled)
        objj_msgSend(self, "setThemeState:", CPThemeStateBezeled);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateBezeled);
}
,["void","BOOL"]), new objj_method(sel_getUid("setBordered:"), function $CPDatePicker__setBordered_(self, _cmd, shouldBeBordered)
{
    self._isBordered = shouldBeBordered;
    if (shouldBeBordered)
        objj_msgSend(self, "setThemeState:", CPThemeStateBordered);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateBordered);
}
,["void","BOOL"]), new objj_method(sel_getUid("setTextFont:"), function $CPDatePicker__setTextFont_(self, _cmd, aFont)
{
    objj_msgSend(self, "setFont:", aFont);
}
,["void","CPFont"]), new objj_method(sel_getUid("setEnabled:"), function $CPDatePicker__setEnabled_(self, _cmd, aBoolean)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "setEnabled:", aBoolean);
    objj_msgSend(self._datePickerTextfield, "setEnabled:", aBoolean);
    objj_msgSend(self._datePickerCalendar, "setEnabled:", aBoolean);
}
,["void","BOOL"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPDatePicker__setBackgroundColor_(self, _cmd, aColor)
{
    self._backgroundColor = aColor;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("setDrawsBackground:"), function $CPDatePicker__setDrawsBackground_(self, _cmd, aBoolean)
{
    objj_msgSend(self, "willChangeValueForKey:", "drawsBackground");
    self._drawsBackground = aBoolean;
    objj_msgSend(self, "didChangeValueForKey:", "drawsBackground");
    objj_msgSend(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("setTimeZone:"), function $CPDatePicker__setTimeZone_(self, _cmd, aTimeZone)
{
    objj_msgSend(self, "willChangeValueForKey:", "timeZone");
    self._timeZone = aTimeZone;
    objj_msgSend(self, "didChangeValueForKey:", "timeZone");
    objj_msgSend(self, "setNeedsLayout");
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
        objj_msgSend(self._datePickerTextfield, "setDateValue:", self._dateValue);
    else
        objj_msgSend(self._datePickerCalendar, "setDateValue:", self._dateValue);
}
,["void","CPTimeZone"]), new objj_method(sel_getUid("becomeFirstResponder"), function $CPDatePicker__becomeFirstResponder(self, _cmd)
{
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
        objj_msgSend(self._datePickerTextfield, "_selecteTextFieldWithFlags:", objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "modifierFlags"));
    else
        return NO;
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPDatePicker__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPDatePicker__resignFirstResponder(self, _cmd)
{
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
        objj_msgSend(self._datePickerTextfield, "resignFirstResponder");
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("isBezeled"), function $CPDatePicker__isBezeled(self, _cmd)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateBezeled);
}
,["BOOL"]), new objj_method(sel_getUid("isBordered"), function $CPDatePicker__isBordered(self, _cmd)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateBordered);
}
,["BOOL"]), new objj_method(sel_getUid("textFont"), function $CPDatePicker__textFont(self, _cmd)
{
    return objj_msgSend(self, "font");
}
,["CPFont"]), new objj_method(sel_getUid("_isAmericanFormat"), function $CPDatePicker___isAmericanFormat(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._locale, "objectForKey:", CPLocaleCountryCode), "isEqualToString:", "US");
}
,["BOOL"]), new objj_method(sel_getUid("_isEnglishFormat"), function $CPDatePicker___isEnglishFormat(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode), "isEqualToString:", "en");
}
,["BOOL"]), new objj_method(sel_getUid("keyDown:"), function $CPDatePicker__keyDown_(self, _cmd, anEvent)
{
    if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle || self._datePickerStyle == CPTextFieldDatePickerStyle)
        objj_msgSend(self._datePickerTextfield, "keyDown:", anEvent);
}
,["void","CPEvent"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPDatePicker__defaultThemeClass(self, _cmd)
{
    return "datePicker";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPDatePicker__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPColor, "clearColor"), "bezel-color", 1.0, "border-width", objj_msgSend(CPColor, "clearColor"), "border-color", CGInsetMakeZero(), "content-inset", CGInsetMakeZero(), "bezel-inset", objj_msgSend(CPColor, "clearColor"), "datepicker-textfield-bezel-color", CGSizeMakeZero(), "min-size-datepicker-textfield", CGInsetMakeZero(), "content-inset-datepicker-textfield", CGInsetMakeZero(), "content-inset-datepicker-textfield-separator", CGInsetMakeZero(), "separator-content-inset", 5.0, "date-hour-margin", 5.0, "stepper-margin", objj_msgSend(CPColor, "clearColor"), "bezel-color-calendar", objj_msgSend(CPColor, "blackColor"), "title-text-color", objj_msgSend(CPColor, "clearColor"), "title-text-shadow-color", CGSizeMakeZero(), "title-text-shadow-offset", objj_msgSend(CPNull, "null"), "title-font", objj_msgSend(CPColor, "blackColor"), "weekday-text-color", objj_msgSend(CPColor, "clearColor"), "weekday-text-shadow-color", CGSizeMakeZero(), "weekday-text-shadow-offset", objj_msgSend(CPNull, "null"), "weekday-font", objj_msgSend(CPNull, "null"), "arrow-image-left", objj_msgSend(CPNull, "null"), "arrow-image-right", objj_msgSend(CPNull, "null"), "arrow-image-left-highlighted", objj_msgSend(CPNull, "null"), "arrow-image-right-highlighted", CGInsetMakeZero(), "arrow-inset", objj_msgSend(CPNull, "null"), "circle-image", objj_msgSend(CPNull, "null"), "circle-image-highlighted", objj_msgSend(CPColor, "blackColor"), "tile-text-color", objj_msgSend(CPColor, "clearColor"), "tile-text-shadow-color", CGSizeMakeZero(), "tile-text-shadow-offset", objj_msgSend(CPNull, "null"), "tile-font", CGSizeMakeZero(), "size-tile", CGSizeMakeZero(), "size-calendar", CGSizeMakeZero(), "size-header", CGSizeMakeZero(), "min-size-calendar", CGSizeMakeZero(), "max-size-calendar", objj_msgSend(CPColor, "clearColor"), "bezel-color-clock", objj_msgSend(CPColor, "blackColor"), "clock-text-color", objj_msgSend(CPColor, "clearColor"), "clock-text-shadow-color", CGSizeMakeZero(), "clock-text-shadow-offset", objj_msgSend(CPNull, "null"), "clock-font", objj_msgSend(CPNull, "null"), "second-hand-image", objj_msgSend(CPNull, "null"), "hour-hand-image", objj_msgSend(CPNull, "null"), "middle-hand-image", objj_msgSend(CPNull, "null"), "minute-hand-image", CGSizeMakeZero(), "size-clock", CGSizeMakeZero(), "second-hand-size", CGSizeMakeZero(), "hour-hand-size", CGSizeMakeZero(), "middle-hand-size", CGSizeMakeZero(), "minute-hand-size");
}
,["CPDictionary"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPDatePicker___binderClassForBinding_(self, _cmd, theBinding)
{
    if (theBinding == CPValueBinding || theBinding == CPMinValueBinding || theBinding == CPMaxValueBinding)
        return objj_msgSend(_CPDatePickerValueBinder, "class");
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
        self._textFont = objj_msgSend(aCoder, "decodeObjectForKey:", CPTextFontKey);
        self._minDate = objj_msgSend(aCoder, "decodeObjectForKey:", CPMinDateKey) || objj_msgSend(CPDate, "distantPast");
        self._maxDate = objj_msgSend(aCoder, "decodeObjectForKey:", CPMaxDateKey) || objj_msgSend(CPDate, "distantFuture");
        self._timeInterval = objj_msgSend(aCoder, "decodeDoubleForKey:", CPIntervalKey);
        self._datePickerMode = objj_msgSend(aCoder, "decodeIntForKey:", CPDatePickerModeKey);
        self._datePickerElements = objj_msgSend(aCoder, "decodeIntForKey:", CPDatePickerElementsKey);
        self._datePickerStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPDatePickerStyleKey);
        self._locale = objj_msgSend(aCoder, "decodeObjectForKey:", CPLocaleKey);
        self._dateValue = objj_msgSend(aCoder, "decodeObjectForKey:", CPDateValueKey);
        self._backgroundColor = objj_msgSend(aCoder, "decodeObjectForKey:", CPBackgroundColorKey);
        self._drawsBackground = objj_msgSend(aCoder, "decodeBoolForKey:", CPDrawsBackgroundKey);
        self._isBordered = objj_msgSend(aCoder, "decodeBoolForKey:", CPBorderedKey);
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPDatePicker__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeDouble:forKey:", self._timeInterval, CPIntervalKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._datePickerMode, CPDatePickerModeKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._datePickerStyle, CPDatePickerStyleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._datePickerElements, CPDatePickerElementsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._minDate, CPMinDateKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._maxDate, CPMaxDateKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._dateValue, CPDateValueKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._textFont, CPTextFontKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._locale, CPLocaleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._backgroundColor, CPBackgroundColorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._drawsBackground, CPDrawsBackgroundKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._isBordered, CPBorderedKey);
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