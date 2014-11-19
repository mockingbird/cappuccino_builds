@STATIC;1.0;I;21;AppKit/CPDatePicker.jI;19;Foundation/CPDate.ji;8;NSCell.jt;13968;objj_executeFile("AppKit/CPDatePicker.j", NO);objj_executeFile("Foundation/CPDate.j", NO);objj_executeFile("NSCell.j", YES);var NSDatePickerDefaultSize = 22,
    NSDatePickerCalendarDefaultSize = 148;
{
var the_class = objj_getClass("CPDatePicker")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDatePicker\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPDatePicker__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDatePicker").super_class }, "NS_initWithCoder:", aCoder);
    var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
    self._minDate = (cell == null ? null : cell.isa.objj_msgSend0(cell, "minDate"));
    self._maxDate = (cell == null ? null : cell.isa.objj_msgSend0(cell, "maxDate"));
    self._timeInterval = (cell == null ? null : cell.isa.objj_msgSend0(cell, "timeInterval"));
    self._datePickerMode = (cell == null ? null : cell.isa.objj_msgSend0(cell, "datePickerMode"));
    self._datePickerElements = (cell == null ? null : cell.isa.objj_msgSend0(cell, "datePickerElements"));
    self._datePickerStyle = (cell == null ? null : cell.isa.objj_msgSend0(cell, "datePickerType"));
    self._dateValue = (cell == null ? null : cell.isa.objj_msgSend0(cell, "objectValue"));
    self._backgroundColor = (cell == null ? null : cell.isa.objj_msgSend0(cell, "backgroundColor"));
    self._drawsBackground = (cell == null ? null : cell.isa.objj_msgSend0(cell, "drawsBackground"));
    self._formatter = (cell == null ? null : cell.isa.objj_msgSend0(cell, "formatter"));
    (self == null ? null : self.isa.objj_msgSend1(self, "setBezeled:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isBezeled"))));
    (self == null ? null : self.isa.objj_msgSend1(self, "setBordered:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isBordered"))));
    (self == null ? null : self.isa.objj_msgSend1(self, "setEnabled:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isEnabled"))));
    var theme = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "defaultTheme"));
    if (self._datePickerStyle != CPClockAndCalendarDatePickerStyle)
    {
        var minSize = (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "min-size", (self == null ? null : self.isa.objj_msgSend0(self, "class")))),
            maxSize = (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "max-size", (self == null ? null : self.isa.objj_msgSend0(self, "class"))));
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
        var minSize = (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "min-size-calendar", (self == null ? null : self.isa.objj_msgSend0(self, "class")))),
            maxSize = (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "max-size-calendar", (self == null ? null : self.isa.objj_msgSend0(self, "class")))),
            sizeClock = (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "size-clock", (self == null ? null : self.isa.objj_msgSend0(self, "class"))));
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
    if ((cell == null ? null : cell.isa.objj_msgSend0(cell, "font"))._name === IBDefaultFontFace && ((___r1 = (cell == null ? null : cell.isa.objj_msgSend0(cell, "font"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "size")) == IBDefaultFontSize)
        (self == null ? null : self.isa.objj_msgSend1(self, "setTextFont:", (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "font", (self == null ? null : self.isa.objj_msgSend0(self, "class"))))));
    else
        (self == null ? null : self.isa.objj_msgSend1(self, "setTextFont:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "font"))));
    var textColor = (cell == null ? null : cell.isa.objj_msgSend0(cell, "textColor")),
        defaultColor = (self == null ? null : self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-color"));
    if (!(textColor == null ? null : textColor.isa.objj_msgSend1(textColor, "isEqual:", defaultColor)))
        (self == null ? null : self.isa.objj_msgSend1(self, "setTextColor:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "textColor"))));
    return self;
    var ___r1;
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
    return CPDatePicker.isa.objj_msgSend0(CPDatePicker, "class");
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
        var flags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSCellFlags")),
            pickerType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSDatePickerType")) || 0;
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSSuppressStepper")) && pickerType != 1)
            pickerType = 2;
        self._timeInterval = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", "NSTimeInterval")) || 0;
        self._datePickerMode = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSDatePickerMode")) || 0;
        self._datePickerElements = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSDatePickerElements")) || 0;
        self._datePickerType = pickerType;
        self._minDate = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSMinDate")) || CPDate.isa.objj_msgSend0(CPDate, "distantPast");
        self._maxDate = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSMaxDate")) || CPDate.isa.objj_msgSend0(CPDate, "distantFuture");
        self._textColor = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTextColor"));
        self._backgroundColor = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSBackgroundColor"));
        self._isBordered = self._isBezeled;
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSFormatter")))
            self._formatter = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSFormatter"));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSDrawsBackground")))
            self._drawsBackground = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSDrawsBackground"));
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
    return CPDate.isa.objj_msgSend0(CPDate, "class");
}
,["Class"])]);
}