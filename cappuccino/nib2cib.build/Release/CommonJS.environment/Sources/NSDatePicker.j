@STATIC;1.0;I;21;AppKit/CPDatePicker.jI;19;Foundation/CPDate.ji;8;NSCell.jt;11850;objj_executeFile("AppKit/CPDatePicker.j", NO);objj_executeFile("Foundation/CPDate.j", NO);objj_executeFile("NSCell.j", YES);var NSDatePickerDefaultSize = 22,
    NSDatePickerCalendarDefaultSize = 148;
{
var the_class = objj_getClass("CPDatePicker")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDatePicker\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPDatePicker__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "NS_initWithCoder:", aCoder);
    var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
    self._minDate = objj_msgSend(cell, "minDate");
    self._maxDate = objj_msgSend(cell, "maxDate");
    self._timeInterval = objj_msgSend(cell, "timeInterval");
    self._datePickerMode = objj_msgSend(cell, "datePickerMode");
    self._datePickerElements = objj_msgSend(cell, "datePickerElements");
    self._datePickerStyle = objj_msgSend(cell, "datePickerType");
    self._dateValue = objj_msgSend(cell, "objectValue");
    self._backgroundColor = objj_msgSend(cell, "backgroundColor");
    self._drawsBackground = objj_msgSend(cell, "drawsBackground");
    self._formatter = objj_msgSend(cell, "formatter");
    objj_msgSend(self, "setBezeled:", objj_msgSend(cell, "isBezeled"));
    objj_msgSend(self, "setBordered:", objj_msgSend(cell, "isBordered"));
    var theme = objj_msgSend(Nib2Cib, "defaultTheme");
    if (self._datePickerStyle != CPClockAndCalendarDatePickerStyle)
    {
        var minSize = objj_msgSend(theme, "valueForAttributeWithName:forClass:", "min-size", objj_msgSend(self, "class")),
            maxSize = objj_msgSend(theme, "valueForAttributeWithName:forClass:", "max-size", objj_msgSend(self, "class"));
        if (minSize.height > 0)
        {
            self._frame.size.height = MAX(self._frame.size.height, minSize.height);
            self._bounds.size.height = MAX(self._frame.size.height, minSize.height);
        }
        if (maxSize.height > 0)
        {
            self._frame.size.height = MIN(self._frame.size.height, maxSize.height);
            self._bounds.size.height = MIN(self._frame.size.height, maxSize.height);
        }
        if (minSize.width > 0)
        {
            self._frame.size.width = MAX(self._frame.size.width, minSize.width);
            self._bounds.size.width = MAX(self._frame.size.width, minSize.width);
        }
        if (maxSize.width > 0)
        {
            self._frame.size.width = MIN(self._frame.size.width, maxSize.width);
            self._bounds.size.width = MAX(self._frame.size.width, minSize.width);
        }
        if (self._datePickerStyle == CPTextFieldAndStepperDatePickerStyle)
        {
            self._frame.size.width -= 3;
            self._bounds.size.width -= 3;
        }
        self._frame.origin.y -= self._frame.size.height - NSDatePickerDefaultSize - 4;
    }
    else
    {
        var minSize = objj_msgSend(theme, "valueForAttributeWithName:forClass:", "min-size-calendar", objj_msgSend(self, "class")),
            maxSize = objj_msgSend(theme, "valueForAttributeWithName:forClass:", "max-size-calendar", objj_msgSend(self, "class")),
            sizeClock = objj_msgSend(theme, "valueForAttributeWithName:forClass:", "size-clock", objj_msgSend(self, "class"));
        if (self._datePickerElements & CPHourMinuteSecondDatePickerElementFlag || self._datePickerElements & CPHourMinuteDatePickerElementFlag)
        {
            minSize.width += sizeClock.width + 10;
            maxSize.width += sizeClock.width + 10;
        }
        if (minSize.height > 0)
        {
            self._frame.size.height = MAX(self._frame.size.height, minSize.height);
            self._bounds.size.height = MAX(self._frame.size.height, minSize.height);
        }
        if (maxSize.height > 0)
        {
            self._frame.size.height = MIN(self._frame.size.height, maxSize.height);
            self._bounds.size.height = MIN(self._frame.size.height, maxSize.height);
        }
        if (minSize.width > 0)
        {
            self._frame.size.width = MAX(self._frame.size.width, minSize.width);
            self._bounds.size.width = MAX(self._frame.size.width, minSize.width);
        }
        if (maxSize.width > 0)
        {
            self._frame.size.width = MIN(self._frame.size.width, maxSize.width);
            self._bounds.size.width = MAX(self._frame.size.width, minSize.width);
        }
        self._frame.origin.y -= self._frame.size.height - NSDatePickerCalendarDefaultSize - 1;
    }
    if (objj_msgSend(cell, "font")._name === IBDefaultFontFace && objj_msgSend(objj_msgSend(cell, "font"), "size") == IBDefaultFontSize)
        objj_msgSend(self, "setTextFont:", objj_msgSend(theme, "valueForAttributeWithName:forClass:", "font", objj_msgSend(self, "class")));
    else
        objj_msgSend(self, "setTextFont:", objj_msgSend(cell, "font"));
    var textColor = objj_msgSend(cell, "textColor"),
        defaultColor = objj_msgSend(self, "currentValueForThemeAttribute:", "text-color");
    if (!objj_msgSend(textColor, "isEqual:", defaultColor))
        objj_msgSend(self, "setTextColor:", objj_msgSend(cell, "textColor"));
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPDatePicker, "NSDatePicker"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSDatePicker__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSDatePicker").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSDatePicker__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPDatePicker, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSCell, "NSDatePickerCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_drawsBackground"), new objj_ivar("_minDate"), new objj_ivar("_maxDate"), new objj_ivar("_formatter"), new objj_ivar("_datePickerMode"), new objj_ivar("_datePickerElements"), new objj_ivar("_datePickerType"), new objj_ivar("_timeInterval"), new objj_ivar("_textColor"), new objj_ivar("_backgroundColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawsBackground"), function $NSDatePickerCell__drawsBackground(self, _cmd)
{
    return self._drawsBackground;
}
,["BOOL"]), new objj_method(sel_getUid("_setDrawsBackground:"), function $NSDatePickerCell___setDrawsBackground_(self, _cmd, newValue)
{
    self._drawsBackground = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("minDate"), function $NSDatePickerCell__minDate(self, _cmd)
{
    return self._minDate;
}
,["CPDate"]), new objj_method(sel_getUid("_setMinDate:"), function $NSDatePickerCell___setMinDate_(self, _cmd, newValue)
{
    self._minDate = newValue;
}
,["void","CPDate"]), new objj_method(sel_getUid("maxDate"), function $NSDatePickerCell__maxDate(self, _cmd)
{
    return self._maxDate;
}
,["CPDate"]), new objj_method(sel_getUid("_setMaxDate:"), function $NSDatePickerCell___setMaxDate_(self, _cmd, newValue)
{
    self._maxDate = newValue;
}
,["void","CPDate"]), new objj_method(sel_getUid("formatter"), function $NSDatePickerCell__formatter(self, _cmd)
{
    return self._formatter;
}
,["CPDateFormatter"]), new objj_method(sel_getUid("_setFormatter:"), function $NSDatePickerCell___setFormatter_(self, _cmd, newValue)
{
    self._formatter = newValue;
}
,["void","CPDateFormatter"]), new objj_method(sel_getUid("datePickerMode"), function $NSDatePickerCell__datePickerMode(self, _cmd)
{
    return self._datePickerMode;
}
,["CPInteger"]), new objj_method(sel_getUid("_setDatePickerMode:"), function $NSDatePickerCell___setDatePickerMode_(self, _cmd, newValue)
{
    self._datePickerMode = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("datePickerElements"), function $NSDatePickerCell__datePickerElements(self, _cmd)
{
    return self._datePickerElements;
}
,["CPInteger"]), new objj_method(sel_getUid("_setDatePickerElements:"), function $NSDatePickerCell___setDatePickerElements_(self, _cmd, newValue)
{
    self._datePickerElements = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("datePickerType"), function $NSDatePickerCell__datePickerType(self, _cmd)
{
    return self._datePickerType;
}
,["CPinteger"]), new objj_method(sel_getUid("_setDatePickerType:"), function $NSDatePickerCell___setDatePickerType_(self, _cmd, newValue)
{
    self._datePickerType = newValue;
}
,["void","CPinteger"]), new objj_method(sel_getUid("timeInterval"), function $NSDatePickerCell__timeInterval(self, _cmd)
{
    return self._timeInterval;
}
,["double"]), new objj_method(sel_getUid("_setTimeInterval:"), function $NSDatePickerCell___setTimeInterval_(self, _cmd, newValue)
{
    self._timeInterval = newValue;
}
,["void","double"]), new objj_method(sel_getUid("textColor"), function $NSDatePickerCell__textColor(self, _cmd)
{
    return self._textColor;
}
,["CPColor"]), new objj_method(sel_getUid("_setTextColor:"), function $NSDatePickerCell___setTextColor_(self, _cmd, newValue)
{
    self._textColor = newValue;
}
,["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $NSDatePickerCell__backgroundColor(self, _cmd)
{
    return self._backgroundColor;
}
,["CPColor"]), new objj_method(sel_getUid("_setBackgroundColor:"), function $NSDatePickerCell___setBackgroundColor_(self, _cmd, newValue)
{
    self._backgroundColor = newValue;
}
,["void","CPColor"]), new objj_method(sel_getUid("initWithCoder:"), function $NSDatePickerCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSDatePickerCell").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        var flags = objj_msgSend(aCoder, "decodeIntForKey:", "NSCellFlags"),
            pickerType = objj_msgSend(aCoder, "decodeIntForKey:", "NSDatePickerType") || 0;
        if (objj_msgSend(aCoder, "decodeIntForKey:", "NSSuppressStepper") && pickerType != 1)
            pickerType = 2;
        self._timeInterval = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSTimeInterval") || 0;
        self._datePickerMode = objj_msgSend(aCoder, "decodeIntForKey:", "NSDatePickerMode") || 0;
        self._datePickerElements = objj_msgSend(aCoder, "decodeIntForKey:", "NSDatePickerElements") || 0;
        self._datePickerType = pickerType;
        self._minDate = objj_msgSend(aCoder, "decodeObjectForKey:", "NSMinDate") || objj_msgSend(CPDate, "distantPast");
        self._maxDate = objj_msgSend(aCoder, "decodeObjectForKey:", "NSMaxDate") || objj_msgSend(CPDate, "distantFuture");
        self._textColor = objj_msgSend(aCoder, "decodeObjectForKey:", "NSTextColor");
        self._backgroundColor = objj_msgSend(aCoder, "decodeObjectForKey:", "NSBackgroundColor");
        self._isBordered = self._isBezeled;
        if (objj_msgSend(aCoder, "containsValueForKey:", "NSFormatter"))
            self._formatter = objj_msgSend(aCoder, "decodeObjectForKey:", "NSFormatter");
        if (objj_msgSend(aCoder, "containsValueForKey:", "NSDrawsBackground"))
            self._drawsBackground = objj_msgSend(aCoder, "decodeBoolForKey:", "NSDrawsBackground");
        else
            self._drawsBackground = YES;
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPDate, "NSCalendarDate"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("classForKeyedArchiver"), function $NSCalendarDate__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPDate, "class");
}
,["Class"])]);
}