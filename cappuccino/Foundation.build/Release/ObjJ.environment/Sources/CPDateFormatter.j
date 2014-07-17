@STATIC;1.0;i;9;CPArray.ji;8;CPDate.ji;10;CPString.ji;13;CPFormatter.ji;12;CPTimeZone.ji;10;CPLocale.jt;94177;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDate.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPFormatter.j", YES);objj_executeFile("CPTimeZone.j", YES);objj_executeFile("CPLocale.j", YES);CPDateFormatterNoStyle = 0;
CPDateFormatterShortStyle = 1;
CPDateFormatterMediumStyle = 2;
CPDateFormatterLongStyle = 3;
CPDateFormatterFullStyle = 4;
CPDateFormatterBehaviorDefault = 0;
CPDateFormatterBehavior10_0 = 1000;
CPDateFormatterBehavior10_4 = 1040;
var defaultDateFormatterBehavior = CPDateFormatterBehavior10_4,
    relativeDateFormating,
    patternStringTokens;
{var the_class = objj_allocateClassPair(CPFormatter, "CPDateFormatter"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_allowNaturalLanguage"), new objj_ivar("_doesRelativeDateFormatting"), new objj_ivar("_defaultDate"), new objj_ivar("_twoDigitStartDate"), new objj_ivar("_formatterBehavior"), new objj_ivar("_dateStyle"), new objj_ivar("_timeStyle"), new objj_ivar("_locale"), new objj_ivar("_AMSymbol"), new objj_ivar("_dateFormat"), new objj_ivar("_PMSymbol"), new objj_ivar("_timeZone"), new objj_ivar("_symbols")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("allowNaturalLanguage"), function $CPDateFormatter__allowNaturalLanguage(self, _cmd)
{
    return self._allowNaturalLanguage;
}
,["BOOL"]), new objj_method(sel_getUid("doesRelativeDateFormatting"), function $CPDateFormatter__doesRelativeDateFormatting(self, _cmd)
{
    return self._doesRelativeDateFormatting;
}
,["BOOL"]), new objj_method(sel_getUid("setDoesRelativeDateFormatting:"), function $CPDateFormatter__setDoesRelativeDateFormatting_(self, _cmd, newValue)
{
    self._doesRelativeDateFormatting = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("defaultDate"), function $CPDateFormatter__defaultDate(self, _cmd)
{
    return self._defaultDate;
}
,["CPDate"]), new objj_method(sel_getUid("setDefaultDate:"), function $CPDateFormatter__setDefaultDate_(self, _cmd, newValue)
{
    self._defaultDate = newValue;
}
,["void","CPDate"]), new objj_method(sel_getUid("twoDigitStartDate"), function $CPDateFormatter__twoDigitStartDate(self, _cmd)
{
    return self._twoDigitStartDate;
}
,["CPDate"]), new objj_method(sel_getUid("setTwoDigitStartDate:"), function $CPDateFormatter__setTwoDigitStartDate_(self, _cmd, newValue)
{
    self._twoDigitStartDate = newValue;
}
,["void","CPDate"]), new objj_method(sel_getUid("formatterBehavior"), function $CPDateFormatter__formatterBehavior(self, _cmd)
{
    return self._formatterBehavior;
}
,["CPDateFormatterBehavior"]), new objj_method(sel_getUid("setFormatterBehavior:"), function $CPDateFormatter__setFormatterBehavior_(self, _cmd, newValue)
{
    self._formatterBehavior = newValue;
}
,["void","CPDateFormatterBehavior"]), new objj_method(sel_getUid("dateStyle"), function $CPDateFormatter__dateStyle(self, _cmd)
{
    return self._dateStyle;
}
,["CPDateFormatterStyle"]), new objj_method(sel_getUid("setDateStyle:"), function $CPDateFormatter__setDateStyle_(self, _cmd, newValue)
{
    self._dateStyle = newValue;
}
,["void","CPDateFormatterStyle"]), new objj_method(sel_getUid("timeStyle"), function $CPDateFormatter__timeStyle(self, _cmd)
{
    return self._timeStyle;
}
,["CPDateFormatterStyle"]), new objj_method(sel_getUid("setTimeStyle:"), function $CPDateFormatter__setTimeStyle_(self, _cmd, newValue)
{
    self._timeStyle = newValue;
}
,["void","CPDateFormatterStyle"]), new objj_method(sel_getUid("locale"), function $CPDateFormatter__locale(self, _cmd)
{
    return self._locale;
}
,["CPLocale"]), new objj_method(sel_getUid("setLocale:"), function $CPDateFormatter__setLocale_(self, _cmd, newValue)
{
    self._locale = newValue;
}
,["void","CPLocale"]), new objj_method(sel_getUid("AMSymbol"), function $CPDateFormatter__AMSymbol(self, _cmd)
{
    return self._AMSymbol;
}
,["CPString"]), new objj_method(sel_getUid("setAMSymbol:"), function $CPDateFormatter__setAMSymbol_(self, _cmd, newValue)
{
    self._AMSymbol = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("dateFormat"), function $CPDateFormatter__dateFormat(self, _cmd)
{
    return self._dateFormat;
}
,["CPString"]), new objj_method(sel_getUid("setDateFormat:"), function $CPDateFormatter__setDateFormat_(self, _cmd, newValue)
{
    self._dateFormat = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("PMSymbol"), function $CPDateFormatter__PMSymbol(self, _cmd)
{
    return self._PMSymbol;
}
,["CPString"]), new objj_method(sel_getUid("setPMSymbol:"), function $CPDateFormatter__setPMSymbol_(self, _cmd, newValue)
{
    self._PMSymbol = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("timeZone"), function $CPDateFormatter__timeZone(self, _cmd)
{
    return self._timeZone;
}
,["CPTimeZone"]), new objj_method(sel_getUid("setTimeZone:"), function $CPDateFormatter__setTimeZone_(self, _cmd, newValue)
{
    self._timeZone = newValue;
}
,["void","CPTimeZone"]), new objj_method(sel_getUid("init"), function $CPDateFormatter__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDateFormatter").super_class }, "init"))
    {
        self._dateStyle = nil;
        self._timeStyle = nil;
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithDateFormat:allowNaturalLanguage:"), function $CPDateFormatter__initWithDateFormat_allowNaturalLanguage_(self, _cmd, format, flag)
{
    if (self = (self == null ? null : self.isa.objj_msgSend0(self, "init")))
    {
        self._dateFormat = format;
        self._allowNaturalLanguage = flag;
    }
    return self;
}
,["id","CPString","BOOL"]), new objj_method(sel_getUid("_init"), function $CPDateFormatter___init(self, _cmd)
{
    var AMSymbol = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%s", "AM"),
        PMSymbol = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%s", "PM"),
        weekdaySymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"),
        shortWeekdaySymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
        veryShortWeekdaySymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "S", "M", "T", "W", "T", "F", "S"),
        standaloneWeekdaySymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"),
        shortStandaloneWeekdaySymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
        veryShortStandaloneWeekdaySymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "S", "M", "T", "W", "T", "F", "S"),
        monthSymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"),
        shortMonthSymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
        veryShortMonthSymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"),
        standaloneMonthSymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"),
        shortStandaloneMonthSymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
        veryShortStandaloneMonthSymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"),
        quarterSymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "1st quarter", "2nd quarter", "3rd quarter", "4th quarter"),
        shortQuarterSymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "Q1", "Q2", "Q3", "Q4"),
        standaloneQuarterSymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "1st quarter", "2nd quarter", "3rd quarter", "4th quarter"),
        shortStandaloneQuarterSymbols = CPArray.isa.objj_msgSend(CPArray, "arrayWithObjects:", "Q1", "Q2", "Q3", "Q4");
    self._symbols = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", AMSymbol, "AMSymbol", PMSymbol, "PMSymbol", weekdaySymbols, "weekdaySymbols", shortWeekdaySymbols, "shortWeekdaySymbols", veryShortWeekdaySymbols, "veryShortWeekdaySymbols", standaloneWeekdaySymbols, "standaloneWeekdaySymbols", shortStandaloneWeekdaySymbols, "shortStandaloneWeekdaySymbols", veryShortStandaloneWeekdaySymbols, "veryShortStandaloneWeekdaySymbols", monthSymbols, "monthSymbols", shortMonthSymbols, "shortMonthSymbols", veryShortMonthSymbols, "veryShortMonthSymbols", standaloneMonthSymbols, "standaloneMonthSymbols", shortStandaloneMonthSymbols, "shortStandaloneMonthSymbols", veryShortStandaloneMonthSymbols, "veryShortStandaloneMonthSymbols", quarterSymbols, "quarterSymbols", shortQuarterSymbols, "shortQuarterSymbols", standaloneQuarterSymbols, "standaloneQuarterSymbols", shortStandaloneQuarterSymbols, "shortStandaloneQuarterSymbols"), "en", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"), "fr", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"), "es", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"), "de");
    self._timeZone = CPTimeZone.isa.objj_msgSend0(CPTimeZone, "systemTimeZone");
    self._twoDigitStartDate = ((___r1 = CPDate.isa.objj_msgSend0(CPDate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithString:", "1950-01-01 00:00:00 +0000"));
    self._locale = CPLocale.isa.objj_msgSend0(CPLocale, "currentLocale");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("AMSymbol"), function $CPDateFormatter__AMSymbol(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "AMSymbol"));
    var ___r1, ___r2, ___r3;
}
,["CPString"]), new objj_method(sel_getUid("setAMSymbol:"), function $CPDateFormatter__setAMSymbol_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "AMSymbol"));
    var ___r1, ___r2, ___r3;
}
,["void","CPString"]), new objj_method(sel_getUid("PMSymbol"), function $CPDateFormatter__PMSymbol(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "PMSymbol"));
    var ___r1, ___r2, ___r3;
}
,["CPString"]), new objj_method(sel_getUid("setPMSymbol:"), function $CPDateFormatter__setPMSymbol_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "PMSymbol"));
    var ___r1, ___r2, ___r3;
}
,["void","CPString"]), new objj_method(sel_getUid("weekdaySymbols"), function $CPDateFormatter__weekdaySymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "weekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setWeekdaySymbols:"), function $CPDateFormatter__setWeekdaySymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "weekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("shortWeekdaySymbols"), function $CPDateFormatter__shortWeekdaySymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "shortWeekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setShortWeekdaySymbols:"), function $CPDateFormatter__setShortWeekdaySymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "shortWeekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("veryShortWeekdaySymbols"), function $CPDateFormatter__veryShortWeekdaySymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "veryShortWeekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setVeryShortWeekdaySymbols:"), function $CPDateFormatter__setVeryShortWeekdaySymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "veryShortWeekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("standaloneWeekdaySymbols"), function $CPDateFormatter__standaloneWeekdaySymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "standaloneWeekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setStandaloneWeekdaySymbols:"), function $CPDateFormatter__setStandaloneWeekdaySymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "standaloneWeekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("shortStandaloneWeekdaySymbols"), function $CPDateFormatter__shortStandaloneWeekdaySymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "shortStandaloneWeekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setShortStandaloneWeekdaySymbols:"), function $CPDateFormatter__setShortStandaloneWeekdaySymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "shortStandaloneWeekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("veryShortStandaloneWeekdaySymbols"), function $CPDateFormatter__veryShortStandaloneWeekdaySymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "veryShortStandaloneWeekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setVeryShortStandaloneWeekdaySymbols:"), function $CPDateFormatter__setVeryShortStandaloneWeekdaySymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "veryShortStandaloneWeekdaySymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("monthSymbols"), function $CPDateFormatter__monthSymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "monthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setMonthSymbols:"), function $CPDateFormatter__setMonthSymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "monthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("shortMonthSymbols"), function $CPDateFormatter__shortMonthSymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "shortMonthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setShortMonthSymbols:"), function $CPDateFormatter__setShortMonthSymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "shortMonthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("veryShortMonthSymbols"), function $CPDateFormatter__veryShortMonthSymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "veryShortMonthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setVeryShortMonthSymbols:"), function $CPDateFormatter__setVeryShortMonthSymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "veryShortMonthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("standaloneMonthSymbols"), function $CPDateFormatter__standaloneMonthSymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "standaloneMonthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setStandaloneMonthSymbols:"), function $CPDateFormatter__setStandaloneMonthSymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "standaloneMonthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("shortStandaloneMonthSymbols"), function $CPDateFormatter__shortStandaloneMonthSymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "shortStandaloneMonthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setShortStandaloneMonthSymbols:"), function $CPDateFormatter__setShortStandaloneMonthSymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "shortStandaloneMonthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("veryShortStandaloneMonthSymbols"), function $CPDateFormatter__veryShortStandaloneMonthSymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "veryShortStandaloneMonthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setVeryShortStandaloneMonthSymbols:"), function $CPDateFormatter__setVeryShortStandaloneMonthSymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "veryShortStandaloneMonthSymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("quarterSymbols"), function $CPDateFormatter__quarterSymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "quarterSymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setQuarterSymbols:"), function $CPDateFormatter__setQuarterSymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "quarterSymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("shortQuarterSymbols"), function $CPDateFormatter__shortQuarterSymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "shortQuarterSymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setShortQuarterSymbols:"), function $CPDateFormatter__setShortQuarterSymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "shortQuarterSymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("standaloneQuarterSymbols"), function $CPDateFormatter__standaloneQuarterSymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "standaloneQuarterSymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setStandaloneQuarterSymbols:"), function $CPDateFormatter__setStandaloneQuarterSymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "standaloneQuarterSymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("shortStandaloneQuarterSymbols"), function $CPDateFormatter__shortStandaloneQuarterSymbols(self, _cmd)
{
    return ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "shortStandaloneQuarterSymbols"));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setShortStandaloneQuarterSymbols:"), function $CPDateFormatter__setShortStandaloneQuarterSymbols_(self, _cmd, aValue)
{
    ((___r1 = ((___r2 = self._symbols), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", ((___r3 = self._locale), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectForKey:", CPLocaleLanguageCode))))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, "shortStandaloneQuarterSymbols"));
    var ___r1, ___r2, ___r3;
}
,["void","CPArray"]), new objj_method(sel_getUid("stringFromDate:"), function $CPDateFormatter__stringFromDate_(self, _cmd, aDate)
{
    var format,
        relativeWord,
        result;
    if (!aDate)
        return;
    aDate = (aDate == null ? null : aDate.isa.objj_msgSend0(aDate, "copy"));
    (aDate == null ? null : aDate.isa.objj_msgSend1(aDate, "_dateWithTimeZone:", self._timeZone));
    if (self._dateFormat)
        return self.isa.objj_msgSend2(self, "_stringFromDate:format:", aDate, self._dateFormat);
    switch(self._dateStyle) {
    case CPDateFormatterNoStyle:
        format = "";
        break;
    case CPDateFormatterShortStyle:
        if (self.isa.objj_msgSend0(self, "_isAmericanFormat"))
            format = "M/d/yy";
        else
            format = "dd/MM/yy";
        break;
    case CPDateFormatterMediumStyle:
        if (self.isa.objj_msgSend0(self, "_isAmericanFormat"))
            format = "MMM d, Y";
        else
            format = "d MMM Y";
        break;
    case CPDateFormatterLongStyle:
        if (self.isa.objj_msgSend0(self, "_isAmericanFormat"))
            format = "MMMM d, Y";
        else
            format = "d MMMM Y";
        break;
    case CPDateFormatterFullStyle:
        if (self.isa.objj_msgSend0(self, "_isAmericanFormat"))
            format = "EEEE, MMMM d, Y";
        else
            format = "EEEE d MMMM Y";
        break;
default:
        format = "";
    }
    if (self.isa.objj_msgSend0(self, "doesRelativeDateFormatting"))
    {
        var language = ((___r1 = self._locale), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPLocaleLanguageCode)),
            relativeWords = (relativeDateFormating == null ? null : relativeDateFormating.isa.objj_msgSend1(relativeDateFormating, "valueForKey:", language));
        for (var i = 1; i < (relativeWords == null ? null : relativeWords.isa.objj_msgSend0(relativeWords, "count")); i = i + 2)
        {
            var date = CPDate.isa.objj_msgSend0(CPDate, "date");
            (date == null ? null : date.isa.objj_msgSend1(date, "_dateWithTimeZone:", self._timeZone));
            date.setHours(12);
            date.setMinutes(0);
            date.setSeconds(0);
            date.setDate((relativeWords == null ? null : relativeWords.isa.objj_msgSend1(relativeWords, "objectAtIndex:", i)) + date.getDate());
            if (date.getDate() == aDate.getDate() && date.getMonth() == aDate.getMonth() && date.getFullYear() == aDate.getFullYear())
            {
                relativeWord = (relativeWords == null ? null : relativeWords.isa.objj_msgSend1(relativeWords, "objectAtIndex:", i - 1));
                format = "";
                break;
            }
        }
    }
    if ((relativeWord || format.length) && self._timeStyle != CPDateFormatterNoStyle)
        format += " ";
    switch(self._timeStyle) {
    case CPDateFormatterNoStyle:
        format += "";
        break;
    case CPDateFormatterShortStyle:
        if (self.isa.objj_msgSend0(self, "_isEnglishFormat"))
            format += "h:mm a";
        else
            format += "H:mm";
        break;
    case CPDateFormatterMediumStyle:
        if (self.isa.objj_msgSend0(self, "_isEnglishFormat"))
            format += "h:mm:ss a";
        else
            format += "H:mm:ss";
        break;
    case CPDateFormatterLongStyle:
        if (self.isa.objj_msgSend0(self, "_isEnglishFormat"))
            format += "h:mm:ss a z";
        else
            format += "H:mm:ss z";
        break;
    case CPDateFormatterFullStyle:
        if (self.isa.objj_msgSend0(self, "_isEnglishFormat"))
            format += "h:mm:ss a zzzz";
        else
            format += "h:mm:ss zzzz";
        break;
default:
        format += "";
    }
    result = self.isa.objj_msgSend2(self, "_stringFromDate:format:", aDate, format);
    if (relativeWord)
        result = relativeWord + result;
    return result;
    var ___r1;
}
,["CPString","CPDate"]), new objj_method(sel_getUid("stringForObjectValue:"), function $CPDateFormatter__stringForObjectValue_(self, _cmd, anObject)
{
    if ((anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "isKindOfClass:", CPDate.isa.objj_msgSend0(CPDate, "class"))))
        return self.isa.objj_msgSend1(self, "stringFromDate:", anObject);
    else
        return nil;
}
,["CPString","id"]), new objj_method(sel_getUid("editingStringForObjectValue:"), function $CPDateFormatter__editingStringForObjectValue_(self, _cmd, anObject)
{
    return self.isa.objj_msgSend1(self, "stringForObjectValue:", anObject);
}
,["CPString","id"]), new objj_method(sel_getUid("_stringFromDate:format:"), function $CPDateFormatter___stringFromDate_format_(self, _cmd, aDate, aFormat)
{
    var length = (aFormat == null ? null : aFormat.isa.objj_msgSend0(aFormat, "length")),
        currentToken = CPString.isa.objj_msgSend0(CPString, "new"),
        isTextToken = NO,
        result = CPString.isa.objj_msgSend0(CPString, "new");
    for (var i = 0; i < length; i++)
    {
        var character = (aFormat == null ? null : aFormat.isa.objj_msgSend1(aFormat, "characterAtIndex:", i));
        if (isTextToken)
        {
            if ((character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "'")))
            {
                isTextToken = NO;
                result += currentToken;
                currentToken = CPString.isa.objj_msgSend0(CPString, "new");
            }
            else
            {
                currentToken += character;
            }
            continue;
        }
        if ((character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "'")))
        {
            if (!isTextToken)
            {
                isTextToken = YES;
                result += currentToken;
                currentToken = CPString.isa.objj_msgSend0(CPString, "new");
            }
            continue;
        }
        if ((character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", ",")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", ":")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "/")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "-")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", " ")))
        {
            result += self.isa.objj_msgSend2(self, "_stringFromToken:date:", currentToken, aDate);
            result += character;
            currentToken = CPString.isa.objj_msgSend0(CPString, "new");
        }
        else
        {
            if ((currentToken == null ? null : currentToken.isa.objj_msgSend0(currentToken, "length")) && !((___r1 = (currentToken == null ? null : currentToken.isa.objj_msgSend1(currentToken, "characterAtIndex:", 0))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToString:", character)))
            {
                result += self.isa.objj_msgSend2(self, "_stringFromToken:date:", currentToken, aDate);
                currentToken = CPString.isa.objj_msgSend0(CPString, "new");
            }
            currentToken += character;
            if (i == length - 1)
                result += self.isa.objj_msgSend2(self, "_stringFromToken:date:", currentToken, aDate);
        }
    }
    return result;
    var ___r1;
}
,["CPString","CPDate","CPString"]), new objj_method(sel_getUid("_stringFromToken:date:"), function $CPDateFormatter___stringFromToken_date_(self, _cmd, aToken, aDate)
{
    if (!(aToken == null ? null : aToken.isa.objj_msgSend0(aToken, "length")))
        return aToken;
    var character = (aToken == null ? null : aToken.isa.objj_msgSend1(aToken, "characterAtIndex:", 0)),
        length = (aToken == null ? null : aToken.isa.objj_msgSend0(aToken, "length")),
        timeZone = self._timeZone;
    switch(character) {
    case "G":
        CPLog.warn("Token not yet implemented " + aToken);
        return CPString.isa.objj_msgSend0(CPString, "new");
    case "y":
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", aDate.getFullYear())), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", aDate.getFullYear(), length == 2 ? length : currentLength);
    case "Y":
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", aDate.getFullYear())), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", aDate.getFullYear(), length == 2 ? length : currentLength);
    case "u":
        CPLog.warn("Token not yet implemented " + aToken);
        return CPString.isa.objj_msgSend0(CPString, "new");
    case "U":
        CPLog.warn("Token not yet implemented " + aToken);
        return CPString.isa.objj_msgSend0(CPString, "new");
    case "Q":
        var quarter = 1;
        if (aDate.getMonth() < 6 && aDate.getMonth() > 2)
            quarter = 2;
        if (aDate.getMonth() > 5 && aDate.getMonth() < 9)
            quarter = 3;
        if (aDate.getMonth() >= 9)
            quarter = 4;
        if (length <= 2)
            return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", quarter, MIN(2, length));
        if (length == 3)
            return ((___r1 = self.isa.objj_msgSend0(self, "shortQuarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", quarter - 1));
        if (length >= 4)
            return ((___r1 = self.isa.objj_msgSend0(self, "quarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", quarter - 1));
    case "q":
        var quarter = 1;
        if (aDate.getMonth() < 6 && aDate.getMonth() > 2)
            quarter = 2;
        if (aDate.getMonth() > 5 && aDate.getMonth() < 9)
            quarter = 3;
        if (aDate.getMonth() >= 9)
            quarter = 4;
        if (length <= 2)
            return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", quarter, MIN(2, length));
        if (length == 3)
            return ((___r1 = self.isa.objj_msgSend0(self, "shortStandaloneQuarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", quarter - 1));
        if (length >= 4)
            return ((___r1 = self.isa.objj_msgSend0(self, "standaloneQuarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", quarter - 1));
    case "M":
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", aDate.getMonth() + 1)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        if (length <= 2)
            return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", aDate.getMonth() + 1, MAX(currentLength, length));
        if (length == 3)
            return ((___r1 = self.isa.objj_msgSend0(self, "shortMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aDate.getMonth()));
        if (length == 4)
            return ((___r1 = self.isa.objj_msgSend0(self, "monthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aDate.getMonth()));
        if (length >= 5)
            return ((___r1 = self.isa.objj_msgSend0(self, "veryShortMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aDate.getMonth()));
    case "L":
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", aDate.getMonth() + 1)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        if (length <= 2)
            return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", aDate.getMonth() + 1, MAX(currentLength, length));
        if (length == 3)
            return ((___r1 = self.isa.objj_msgSend0(self, "shortStandaloneMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aDate.getMonth()));
        if (length == 4)
            return ((___r1 = self.isa.objj_msgSend0(self, "standaloneMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aDate.getMonth()));
        if (length >= 5)
            return ((___r1 = self.isa.objj_msgSend0(self, "veryShortStandaloneMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aDate.getMonth()));
    case "I":
        CPLog.warn("Depreacted - Token not yet implemented " + aToken);
        return CPString.isa.objj_msgSend0(CPString, "new");
    case "w":
        var d = (aDate == null ? null : aDate.isa.objj_msgSend0(aDate, "copy"));
        d.setHours(0, 0, 0);
        d.setDate(d.getDate() + 4 - (d.getDay() || 7));
        var yearStart = new Date(d.getFullYear(), 0, 1),
            weekOfYear = Math.ceil(((d - yearStart) / 86400000 + 1) / 7);
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", weekOfYear + 1, MAX(2, length));
    case "W":
        var firstDay = (new Date(aDate.getFullYear(), aDate.getMonth(), 1)).getDay(),
            weekOfMonth = Math.ceil((aDate.getDate() + firstDay) / 7);
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", weekOfMonth, 1);
    case "d":
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", aDate.getDate())), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", aDate.getDate(), MAX(length, currentLength));
    case "D":
        var oneJan = new Date(aDate.getFullYear(), 0, 1),
            dayOfYear = Math.ceil((aDate - oneJan) / 86400000),
            currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", dayOfYear)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", dayOfYear, MAX(currentLength, MIN(3, length)));
    case "F":
        var dayOfWeek = 1,
            day = aDate.getDate();
        if (day > 7 && day < 15)
            dayOfWeek = 2;
        if (day > 14 && day < 22)
            dayOfWeek = 3;
        if (day > 21 && day < 29)
            dayOfWeek = 4;
        if (day > 28)
            dayOfWeek = 5;
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", dayOfWeek, 1);
    case "g":
        CPLog.warn("Token not yet implemented " + aToken);
        return CPString.isa.objj_msgSend0(CPString, "new");
    case "E":
        var day = aDate.getDay();
        if (length <= 3)
            return ((___r1 = self.isa.objj_msgSend0(self, "shortWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", day));
        if (length == 4)
            return ((___r1 = self.isa.objj_msgSend0(self, "weekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", day));
        if (length >= 5)
            return ((___r1 = self.isa.objj_msgSend0(self, "veryShortWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", day));
    case "e":
        var day = aDate.getDay();
        if (length <= 2)
            return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", day + 1, MIN(2, length));
        if (length == 3)
            return ((___r1 = self.isa.objj_msgSend0(self, "shortWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", day));
        if (length == 4)
            return ((___r1 = self.isa.objj_msgSend0(self, "weekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", day));
        if (length >= 5)
            return ((___r1 = self.isa.objj_msgSend0(self, "veryShortWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", day));
    case "c":
        var day = aDate.getDay();
        if (length <= 2)
            return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", day + 1, ((aDate.getDay()).toString()).length);
        if (length == 3)
            return ((___r1 = self.isa.objj_msgSend0(self, "shortStandaloneWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", day));
        if (length == 4)
            return ((___r1 = self.isa.objj_msgSend0(self, "standaloneWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", day));
        if (length >= 5)
            return ((___r1 = self.isa.objj_msgSend0(self, "veryShortStandaloneWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", day));
    case "a":
        if (aDate.getHours() > 11)
            return self.isa.objj_msgSend0(self, "PMSymbol");
        else
            return self.isa.objj_msgSend0(self, "AMSymbol");
    case "h":
        var hours = aDate.getHours();
        if (self.isa.objj_msgSend0(self, "_isAmericanFormat") || self.isa.objj_msgSend0(self, "_isEnglishFormat"))
        {
            if (hours == 0)
                hours = 12;
            else if (hours > 12)
                hours = hours - 12;
        }
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", hours)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", hours, MAX(currentLength, MIN(2, length)));
    case "H":
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", aDate.getHours())), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", aDate.getHours(), MAX(currentLength, MIN(2, length)));
    case "K":
        var hours = aDate.getHours();
        if (hours > 12)
            hours -= 12;
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", hours)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", hours, MAX(currentLength, MIN(2, length)));
    case "k":
        var hours = aDate.getHours();
        if (aDate.getHours() == 0)
            hours = 24;
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", hours)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", hours, MAX(currentLength, MIN(2, length)));
    case "j":
        CPLog.warn("Token not yet implemented " + aToken);
        return CPString.isa.objj_msgSend0(CPString, "new");
    case "m":
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", aDate.getMinutes())), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", aDate.getMinutes(), MAX(currentLength, MIN(2, length)));
    case "s":
        var currentLength = ((___r1 = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", aDate.getMinutes())), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length"));
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", aDate.getSeconds(), MIN(2, length));
    case "S":
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", aDate.getMilliseconds(), length);
    case "A":
        var value = aDate.getHours() * 60 * 60 * 1000 + aDate.getMinutes() * 60 * 1000 + aDate.getSeconds() * 1000 + aDate.getMilliseconds();
        return self.isa.objj_msgSend2(self, "_stringValueForValue:length:", value, (value.toString()).length);
    case "z":
        if (length <= 3)
            return (timeZone == null ? null : timeZone.isa.objj_msgSend2(timeZone, "localizedName:locale:", CPTimeZoneNameStyleShortDaylightSaving, self._locale));
        else
            return (timeZone == null ? null : timeZone.isa.objj_msgSend2(timeZone, "localizedName:locale:", CPTimeZoneNameStyleDaylightSaving, self._locale));
    case "Z":
        var seconds = (timeZone == null ? null : timeZone.isa.objj_msgSend0(timeZone, "secondsFromGMT")),
            minutes = seconds / 60,
            hours = minutes / 60,
            result,
            diffMinutes = (hours - parseInt(hours)) * 100 * 60 / 100;
        if (length <= 3)
        {
            result = diffMinutes.toString();
            while ((result == null ? null : result.isa.objj_msgSend0(result, "length")) < 2)
                result = "0" + result;
            result = ABS(parseInt(hours)) + result;
            while ((result == null ? null : result.isa.objj_msgSend0(result, "length")) < 4)
                result = "0" + result;
            if (seconds > 0)
                result = "+" + result;
            else
                result = "-" + result;
            return result;
        }
        else if (length == 4)
        {
            result = diffMinutes.toString();
            while ((result == null ? null : result.isa.objj_msgSend0(result, "length")) < 2)
                result = "0" + result;
            result = ":" + result;
            result = ABS(parseInt(hours)) + result;
            while ((result == null ? null : result.isa.objj_msgSend0(result, "length")) < 5)
                result = "0" + result;
            if (seconds > 0)
                result = "+" + result;
            else
                result = "-" + result;
            return "GMT" + result;
        }
        else
        {
            result = diffMinutes.toString();
            while ((result == null ? null : result.isa.objj_msgSend0(result, "length")) < 2)
                result = "0" + result;
            result = ":" + result;
            result = ABS(parseInt(hours)) + result;
            while ((result == null ? null : result.isa.objj_msgSend0(result, "length")) < 5)
                result = "0" + result;
            if (seconds > 0)
                result = "+" + result;
            else
                result = "-" + result;
            return result;
        }
    case "v":
        if (length == 1)
            return (timeZone == null ? null : timeZone.isa.objj_msgSend2(timeZone, "localizedName:locale:", CPTimeZoneNameStyleShortGeneric, self._locale));
        else if (length == 4)
            return (timeZone == null ? null : timeZone.isa.objj_msgSend2(timeZone, "localizedName:locale:", CPTimeZoneNameStyleGeneric, self._locale));
        return " ";
    case "V":
        if (length == 1)
        {
            return (timeZone == null ? null : timeZone.isa.objj_msgSend2(timeZone, "localizedName:locale:", CPTimeZoneNameStyleShortDaylightSaving, self._locale));
        }
        else if (length == 4)
        {
            CPLog.warn("No pattern found for " + aToken);
            return "";
        }
        return " ";
default:
        CPLog.warn("No pattern found for " + aToken);
        return aToken;
    }
    return CPString.isa.objj_msgSend0(CPString, "new");
    var ___r1;
}
,["CPString","CPString","CPDate"]), new objj_method(sel_getUid("dateFromString:"), function $CPDateFormatter__dateFromString_(self, _cmd, aString)
{
    var format;
    if (self._dateFormat != nil)
        return self.isa.objj_msgSend2(self, "_dateFromString:format:", aString, self._dateFormat);
    switch(self._dateStyle) {
    case CPDateFormatterNoStyle:
        format = "";
        break;
    case CPDateFormatterShortStyle:
        if (self.isa.objj_msgSend0(self, "_isAmericanFormat"))
            format = "M/d/yy";
        else
            format = "dd/MM/yy";
        break;
    case CPDateFormatterMediumStyle:
        if (self.isa.objj_msgSend0(self, "_isAmericanFormat"))
            format = "MMM d, Y";
        else
            format = "d MMM Y";
        break;
    case CPDateFormatterLongStyle:
        if (self.isa.objj_msgSend0(self, "_isAmericanFormat"))
            format = "MMMM d, Y";
        else
            format = "d MMMM Y";
        break;
    case CPDateFormatterFullStyle:
        if (self.isa.objj_msgSend0(self, "_isAmericanFormat"))
            format = "EEEE, MMMM d, Y";
        else
            format = "EEEE d MMMM Y";
        break;
default:
        format = "";
    }
    switch(self._timeStyle) {
    case CPDateFormatterNoStyle:
        format += "";
        break;
    case CPDateFormatterShortStyle:
        if (self.isa.objj_msgSend0(self, "_isEnglishFormat"))
            format += " h:mm a";
        else
            format += " H:mm";
        break;
    case CPDateFormatterMediumStyle:
        if (self.isa.objj_msgSend0(self, "_isEnglishFormat"))
            format += " h:mm:ss a";
        else
            format += " H:mm:ss";
        break;
    case CPDateFormatterLongStyle:
        if (self.isa.objj_msgSend0(self, "_isEnglishFormat"))
            format += " h:mm:ss a z";
        else
            format += " H:mm:ss z";
        break;
    case CPDateFormatterFullStyle:
        if (self.isa.objj_msgSend0(self, "_isEnglishFormat"))
            format += " h:mm:ss a zzzz";
        else
            format += " h:mm:ss zzzz";
        break;
default:
        format += "";
    }
    return self.isa.objj_msgSend2(self, "_dateFromString:format:", aString, format);
}
,["CPDate","CPString"]), new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"), function $CPDateFormatter__getObjectValue_forString_errorDescription_(self, _cmd, anObject, aString, anError)
{
    var value = self.isa.objj_msgSend1(self, "dateFromString:", aString);
    (anObject)(value);
    if (!value)
    {
        if (anError)
            (anError)("The value \"" + aString + "\" is invalid.");
        return NO;
    }
    return YES;
}
,["BOOL","idRef","CPString","CPStringRef"]), new objj_method(sel_getUid("_dateFromString:format:"), function $CPDateFormatter___dateFromString_format_(self, _cmd, aString, aFormat)
{
    if (!aString)
        return ((___r1 = CPDate.isa.objj_msgSend0(CPDate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTimeIntervalSinceReferenceDate:", -31622400));
    if (aFormat == nil)
        return nil;
    var currentToken = CPString.isa.objj_msgSend0(CPString, "new"),
        isTextToken = NO,
        tokens = CPArray.isa.objj_msgSend0(CPArray, "array"),
        dateComponents = CPArray.isa.objj_msgSend0(CPArray, "array"),
        patternTokens = CPArray.isa.objj_msgSend0(CPArray, "array");
    for (var i = 0; i < (aFormat == null ? null : aFormat.isa.objj_msgSend0(aFormat, "length")); i++)
    {
        var character = (aFormat == null ? null : aFormat.isa.objj_msgSend1(aFormat, "characterAtIndex:", i));
        if (isTextToken)
        {
            if ((character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "'")))
                currentToken = CPString.isa.objj_msgSend0(CPString, "new");
            continue;
        }
        if ((character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "'")))
        {
            if (!isTextToken)
                isTextToken = YES;
            continue;
        }
        if ((character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", ",")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", ":")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "/")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "-")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", " ")))
        {
            (tokens == null ? null : tokens.isa.objj_msgSend1(tokens, "addObject:", currentToken));
            if ((patternStringTokens == null ? null : patternStringTokens.isa.objj_msgSend1(patternStringTokens, "containsObject:", currentToken)))
                (patternTokens == null ? null : patternTokens.isa.objj_msgSend1(patternTokens, "addObject:", (tokens == null ? null : tokens.isa.objj_msgSend0(tokens, "count")) - 1));
            currentToken = CPString.isa.objj_msgSend0(CPString, "new");
        }
        else
        {
            if ((currentToken == null ? null : currentToken.isa.objj_msgSend0(currentToken, "length")) && !((___r1 = (currentToken == null ? null : currentToken.isa.objj_msgSend1(currentToken, "characterAtIndex:", 0))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToString:", character)))
            {
                (tokens == null ? null : tokens.isa.objj_msgSend1(tokens, "addObject:", currentToken));
                if ((patternStringTokens == null ? null : patternStringTokens.isa.objj_msgSend1(patternStringTokens, "containsObject:", currentToken)))
                    (patternTokens == null ? null : patternTokens.isa.objj_msgSend1(patternTokens, "addObject:", (tokens == null ? null : tokens.isa.objj_msgSend0(tokens, "count")) - 1));
                currentToken = CPString.isa.objj_msgSend0(CPString, "new");
            }
            currentToken += character;
            if (i == (aFormat == null ? null : aFormat.isa.objj_msgSend0(aFormat, "length")) - 1)
            {
                (tokens == null ? null : tokens.isa.objj_msgSend1(tokens, "addObject:", currentToken));
                if ((patternStringTokens == null ? null : patternStringTokens.isa.objj_msgSend1(patternStringTokens, "containsObject:", currentToken)))
                    (patternTokens == null ? null : patternTokens.isa.objj_msgSend1(patternTokens, "addObject:", (tokens == null ? null : tokens.isa.objj_msgSend0(tokens, "count")) - 1));
            }
        }
    }
    isTextToken = NO;
    currentToken = CPString.isa.objj_msgSend0(CPString, "new");
    var currentIndexSpecialPattern = 0;
    if ((patternTokens == null ? null : patternTokens.isa.objj_msgSend0(patternTokens, "count")) == 0)
        (patternTokens == null ? null : patternTokens.isa.objj_msgSend1(patternTokens, "addObject:", CPNotFound));
    for (var i = 0; i < (aString == null ? null : aString.isa.objj_msgSend0(aString, "length")); i++)
    {
        var character = (aString == null ? null : aString.isa.objj_msgSend1(aString, "characterAtIndex:", i));
        if (isTextToken)
        {
            if ((character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "'")))
                currentToken = CPString.isa.objj_msgSend0(CPString, "new");
            continue;
        }
        if ((character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "'")))
        {
            if (!isTextToken)
                isTextToken = YES;
            continue;
        }
        if ((dateComponents == null ? null : dateComponents.isa.objj_msgSend0(dateComponents, "count")) == (patternTokens == null ? null : patternTokens.isa.objj_msgSend1(patternTokens, "objectAtIndex:", currentIndexSpecialPattern)))
        {
            var j = self.isa.objj_msgSend3(self, "_lastIndexMatchedString:token:index:", aString, (tokens == null ? null : tokens.isa.objj_msgSend1(tokens, "objectAtIndex:", (dateComponents == null ? null : dateComponents.isa.objj_msgSend0(dateComponents, "count")))), i);
            if (j == CPNotFound)
                return nil;
            currentIndexSpecialPattern++;
            (dateComponents == null ? null : dateComponents.isa.objj_msgSend1(dateComponents, "addObject:", (aString == null ? null : aString.isa.objj_msgSend1(aString, "substringWithRange:", CPMakeRange(i, j - i)))));
            i = j;
            continue;
        }
        if ((character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", ",")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", ":")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "/")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "-")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", " ")))
        {
            (dateComponents == null ? null : dateComponents.isa.objj_msgSend1(dateComponents, "addObject:", currentToken));
            currentToken = CPString.isa.objj_msgSend0(CPString, "new");
        }
        else
        {
            currentToken += character;
            if (i == (aString == null ? null : aString.isa.objj_msgSend0(aString, "length")) - 1)
                (dateComponents == null ? null : dateComponents.isa.objj_msgSend1(dateComponents, "addObject:", currentToken));
        }
    }
    if ((dateComponents == null ? null : dateComponents.isa.objj_msgSend0(dateComponents, "count")) != (tokens == null ? null : tokens.isa.objj_msgSend0(tokens, "count")))
        return nil;
    return self.isa.objj_msgSend2(self, "_dateFromTokens:dateComponents:", tokens, dateComponents);
    var ___r1;
}
,["CPDate","CPString","CPString"]), new objj_method(sel_getUid("_dateFromTokens:dateComponents:"), function $CPDateFormatter___dateFromTokens_dateComponents_(self, _cmd, tokens, dateComponents)
{
    var timeZoneseconds = ((___r1 = self._timeZone), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "secondsFromGMT")),
        dateArray = [2000, 01, 01, 00, 00, 00, "+0000"],
        isPM = NO,
        dayOfYear,
        dayIndexInWeek,
        weekOfYear,
        weekOfMonth;
    for (var i = 0; i < (tokens == null ? null : tokens.isa.objj_msgSend0(tokens, "count")); i++)
    {
        var token = (tokens == null ? null : tokens.isa.objj_msgSend1(tokens, "objectAtIndex:", i)),
            dateComponent = (dateComponents == null ? null : dateComponents.isa.objj_msgSend1(dateComponents, "objectAtIndex:", i)),
            character = (token == null ? null : token.isa.objj_msgSend1(token, "characterAtIndex:", 0)),
            length = (token == null ? null : token.isa.objj_msgSend0(token, "length"));
        switch(character) {
        case "G":
            CPLog.warn("Token not yet implemented " + token);
            break;
        case "y":
            var u = self._twoDigitStartDate.getFullYear() % 10,
                d = parseInt(self._twoDigitStartDate.getFullYear() / 10) % 10,
                c = parseInt(self._twoDigitStartDate.getFullYear() / 100) % 10,
                m = parseInt(self._twoDigitStartDate.getFullYear() / 1000) % 10;
            if (length == 2 && dateComponent.length == 2)
            {
                if (u + d * 10 >= parseInt(dateComponent))
                    dateArray[0] = (c + 1) * 100 + m * 1000 + parseInt(dateComponent);
                else
                    dateArray[0] = c * 100 + m * 1000 + parseInt(dateComponent);
            }
            else
            {
                dateArray[0] = parseInt(dateComponent);
            }
            break;
        case "Y":
            var u = self._twoDigitStartDate.getFullYear() % 10,
                d = parseInt(self._twoDigitStartDate.getFullYear() / 10) % 10,
                c = parseInt(self._twoDigitStartDate.getFullYear() / 100) % 10,
                m = parseInt(self._twoDigitStartDate.getFullYear() / 1000) % 10;
            if (length == 2 && dateComponent.length == 2)
            {
                if (u + d * 10 >= parseInt(dateComponent))
                    dateArray[0] = (c + 1) * 100 + m * 1000 + parseInt(dateComponent);
                else
                    dateArray[0] = c * 100 + m * 1000 + parseInt(dateComponent);
            }
            else
            {
                dateArray[0] = parseInt(dateComponent);
            }
            break;
        case "u":
            CPLog.warn("Token not yet implemented " + token);
            break;
        case "U":
            CPLog.warn("Token not yet implemented " + token);
            break;
        case "Q":
            var month;
            if (length <= 2)
                month = (parseInt(dateComponent) - 1) * 3;
            if (length == 3)
            {
                if (!((___r1 = self.isa.objj_msgSend0(self, "shortQuarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", dateComponent)))
                    return nil;
                month = ((___r1 = self.isa.objj_msgSend0(self, "shortQuarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent)) * 3;
            }
            if (length >= 4)
            {
                if (!((___r1 = self.isa.objj_msgSend0(self, "quarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", dateComponent)))
                    return nil;
                month = ((___r1 = self.isa.objj_msgSend0(self, "quarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent)) * 3;
            }
            if (month > 11)
                return nil;
            dateArray[1] = month + 1;
            break;
        case "q":
            var month;
            if (length <= 2)
                month = (parseInt(dateComponent) - 1) * 3;
            if (length == 3)
            {
                if (!((___r1 = self.isa.objj_msgSend0(self, "shortQuarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", dateComponent)))
                    return nil;
                month = ((___r1 = self.isa.objj_msgSend0(self, "shortQuarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent)) * 3;
            }
            if (length >= 4)
            {
                if (!((___r1 = self.isa.objj_msgSend0(self, "quarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", dateComponent)))
                    return nil;
                month = ((___r1 = self.isa.objj_msgSend0(self, "quarterSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent)) * 3;
            }
            if (month > 11)
                return nil;
            dateArray[1] = month + 1;
            break;
        case "M":
            var month;
            if (length <= 2)
                month = parseInt(dateComponent);
            if (length == 3)
            {
                if (!((___r1 = self.isa.objj_msgSend0(self, "shortMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", dateComponent)))
                    return nil;
                month = ((___r1 = self.isa.objj_msgSend0(self, "shortMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent)) + 1;
            }
            if (length == 4)
            {
                if (!((___r1 = self.isa.objj_msgSend0(self, "monthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", dateComponent)))
                    return nil;
                month = ((___r1 = self.isa.objj_msgSend0(self, "monthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent)) + 1;
            }
            if (month > 11 || length >= 5)
                return nil;
            dateArray[1] = month;
            break;
        case "L":
            var month;
            if (length <= 2)
                month = parseInt(dateComponent);
            if (length == 3)
            {
                if (!((___r1 = self.isa.objj_msgSend0(self, "shortStandaloneMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", dateComponent)))
                    return nil;
                month = ((___r1 = self.isa.objj_msgSend0(self, "shortStandaloneMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent)) + 1;
            }
            if (length == 4)
            {
                if (!((___r1 = self.isa.objj_msgSend0(self, "standaloneMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", dateComponent)))
                    return nil;
                month = ((___r1 = self.isa.objj_msgSend0(self, "standaloneMonthSymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent)) + 1;
            }
            if (month > 11 || length >= 5)
                return nil;
            dateArray[1] = month;
            break;
        case "I":
            CPLog.warn("Depreacted - Token not yet implemented " + token);
            break;
        case "w":
            if (dateComponent > 52)
                return nil;
            weekOfYear = dateComponent;
            break;
        case "W":
            if (dateComponent > 52)
                return nil;
            weekOfMonth = dateComponent;
            break;
        case "d":
            dateArray[2] = parseInt(dateComponent);
            break;
        case "D":
            if (isNaN(parseInt(dateComponent)) || parseInt(dateComponent) > 345)
                return nil;
            dayOfYear = parseInt(dateComponent);
            break;
        case "F":
            if (isNaN(parseInt(dateComponent)) || parseInt(dateComponent) > 5 || parseInt(dateComponent) == 0)
                return nil;
            if (parseInt(dateComponent) == 1)
                dateArray[2] = 1;
            if (parseInt(dateComponent) == 2)
                dateArray[2] = 8;
            if (parseInt(dateComponent) == 3)
                dateArray[2] = 15;
            if (parseInt(dateComponent) == 4)
                dateArray[2] = 22;
            if (parseInt(dateComponent) == 5)
                dateArray[2] = 29;
            break;
        case "g":
            CPLog.warn("Token not yet implemented " + token);
            break;
        case "E":
            if (length <= 3)
                dayIndexInWeek = ((___r1 = self.isa.objj_msgSend0(self, "shortWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent));
            if (length == 4)
                dayIndexInWeek = ((___r1 = self.isa.objj_msgSend0(self, "weekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent));
            if (dayIndexInWeek == CPNotFound || length >= 5)
                return nil;
            break;
        case "e":
            if (length <= 2 && isNaN(parseInt(dateComponent)))
                return nil;
            if (length <= 2)
                dayIndexInWeek = parseInt(dateComponent);
            if (length == 3)
                dayIndexInWeek = ((___r1 = self.isa.objj_msgSend0(self, "shortWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent));
            if (length == 4)
                dayIndexInWeek = ((___r1 = self.isa.objj_msgSend0(self, "weekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent));
            if (dayIndexInWeek == CPNotFound || length >= 5)
                return nil;
            break;
        case "c":
            if (length <= 2 && isNaN(parseInt(dateComponent)))
                return nil;
            if (length <= 2)
                dayIndexInWeek = dateComponent;
            if (length == 3)
                dayIndexInWeek = ((___r1 = self.isa.objj_msgSend0(self, "shortStandaloneWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent));
            if (length == 4)
                dayIndexInWeek = ((___r1 = self.isa.objj_msgSend0(self, "standaloneWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent));
            if (length == 5)
                dayIndexInWeek = ((___r1 = self.isa.objj_msgSend0(self, "veryShortStandaloneWeekdaySymbols")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", dateComponent));
            if (dayIndexInWeek == CPNotFound || length >= 5)
                return nil;
            break;
        case "a":
            if (!(dateComponent == null ? null : dateComponent.isa.objj_msgSend1(dateComponent, "isEqualToString:", self.isa.objj_msgSend0(self, "PMSymbol"))) && !(dateComponent == null ? null : dateComponent.isa.objj_msgSend1(dateComponent, "isEqualToString:", self.isa.objj_msgSend0(self, "AMSymbol"))))
                return nil;
            if ((dateComponent == null ? null : dateComponent.isa.objj_msgSend1(dateComponent, "isEqualToString:", self.isa.objj_msgSend0(self, "PMSymbol"))))
                isPM = YES;
            break;
        case "h":
            if (parseInt(dateComponent) < 0 || parseInt(dateComponent) > 12)
                return nil;
            dateArray[3] = parseInt(dateComponent);
            break;
        case "H":
            if (parseInt(dateComponent) < 0 || parseInt(dateComponent) > 23)
                return nil;
            dateArray[3] = parseInt(dateComponent);
            break;
        case "K":
            if (parseInt(dateComponent) < 0 || parseInt(dateComponent) > 11)
                return nil;
            dateArray[3] = parseInt(dateComponent);
            break;
        case "k":
            if (parseInt(dateComponent) < 0 || parseInt(dateComponent) > 12)
                return nil;
            dateArray[3] = parseInt(dateComponent);
            break;
        case "j":
            CPLog.warn("Token not yet implemented " + token);
            break;
        case "m":
            var minutes = parseInt(dateComponent);
            if (minutes > 59)
                return nil;
            dateArray[4] = minutes;
            break;
        case "s":
            var seconds = parseInt(dateComponent);
            if (seconds > 59)
                return nil;
            dateArray[5] = seconds;
            break;
        case "S":
            if (isNaN(parseInt(dateComponent)))
                return nil;
            break;
        case "A":
            if (isNaN(parseInt(dateComponent)))
                return nil;
            var millisecondsInDay = parseInt(dateComponent),
                tmpDate = new Date();
            tmpDate.setHours(0);
            tmpDate.setMinutes(0);
            tmpDate.setSeconds(0);
            tmpDate.setMilliseconds(0);
            tmpDate.setMilliseconds(millisecondsInDay);
            dateArray[3] = tmpDate.getHours();
            dateArray[4] = tmpDate.getMinutes();
            dateArray[5] = tmpDate.getSeconds();
            break;
        case "z":
            if (length < 4)
                timeZoneseconds = self.isa.objj_msgSend2(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleShortDaylightSaving);
            else
                timeZoneseconds = self.isa.objj_msgSend2(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleDaylightSaving);
            if (!timeZoneseconds)
                timeZoneseconds = self.isa.objj_msgSend1(self, "_secondsFromTimeZoneDefaultFormatString:", dateComponent);
            if (!timeZoneseconds)
                return nil;
            timeZoneseconds = timeZoneseconds + 60 * 60;
            break;
        case "Z":
            timeZoneseconds = self.isa.objj_msgSend1(self, "_secondsFromTimeZoneDefaultFormatString:", dateComponent);
            if (!timeZoneseconds)
                return nil;
            timeZoneseconds = timeZoneseconds + 60 * 60;
            break;
        case "v":
            if (length <= 3)
                timeZoneseconds = self.isa.objj_msgSend2(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleShortGeneric);
            else
                timeZoneseconds = self.isa.objj_msgSend2(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleGeneric);
            if (!timeZoneseconds && length == 4)
                timeZoneseconds = self.isa.objj_msgSend1(self, "_secondsFromTimeZoneDefaultFormatString:", dateComponent);
            if (!timeZoneseconds)
                return nil;
            timeZoneseconds = timeZoneseconds + 60 * 60;
            break;
        case "V":
            if (length <= 3)
                timeZoneseconds = self.isa.objj_msgSend2(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleShortStandard);
            else
                timeZoneseconds = self.isa.objj_msgSend2(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleStandard);
            if (!timeZoneseconds)
                timeZoneseconds = self.isa.objj_msgSend1(self, "_secondsFromTimeZoneDefaultFormatString:", dateComponent);
            if (!timeZoneseconds)
                return nil;
            timeZoneseconds = timeZoneseconds + 60 * 60;
            break;
default:
            CPLog.warn("No pattern found for " + token);
            return nil;
        }
    }
    if (dayOfYear)
    {
        var tmpDate = new Date();
        tmpDate.setFullYear(dateArray[0]);
        tmpDate.setMonth(0);
        tmpDate.setDate(dayOfYear);
        dateArray[1] = tmpDate.getMonth() + 1;
        dateArray[2] = tmpDate.getDate();
    }
    if (weekOfMonth)
        dateArray[2] = (weekOfMonth - 1) * 7 + 1;
    if (weekOfYear)
    {
        var tmpDate = new Date();
        tmpDate.setFullYear(dateArray[0]);
        tmpDate.setMonth(0);
        tmpDate.setDate(1);
        while (tmpDate.getDay() != 0)
            tmpDate.setDate(tmpDate.getDate() + 1);
        tmpDate.setDate(tmpDate.getDate() + (weekOfYear - 1) * 7);
        dateArray[1] = tmpDate.getMonth() + 1;
        dateArray[2] = tmpDate.getDate() - 1;
    }
    var tmpDate = new Date();
    tmpDate.setMonth(dateArray[1] - 1);
    tmpDate.setFullYear(dateArray[0]);
    if (dateArray[2] <= 0 || dateArray[2] > (tmpDate == null ? null : tmpDate.isa.objj_msgSend0(tmpDate, "_daysInMonth")))
        return nil;
    if (isPM)
        dateArray[3] += 12;
    if (isNaN(parseInt(dateArray[0])) || isNaN(parseInt(dateArray[1])) || isNaN(parseInt(dateArray[2])) || isNaN(parseInt(dateArray[3])) || isNaN(parseInt(dateArray[4])) || isNaN(parseInt(dateArray[5])) || isNaN(parseInt(dateArray[6])))
        return nil;
    var dateResult = ((___r1 = CPDate.isa.objj_msgSend0(CPDate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithString:", CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "%04d-%02d-%02d %02d:%02d:%02d %s", dateArray[0], dateArray[1], dateArray[2], dateArray[3], dateArray[4], dateArray[5], dateArray[6])));
    dateResult.setSeconds(dateResult.getSeconds() - timeZoneseconds + 60 * 60);
    return dateResult;
    var ___r1;
}
,["CPDate","CPArray","CPArray"]), new objj_method(sel_getUid("_stringValueForValue:length:"), function $CPDateFormatter___stringValueForValue_length_(self, _cmd, aValue, length)
{
    var string = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "%i", aValue);
    if ((string == null ? null : string.isa.objj_msgSend0(string, "length")) == length)
        return string;
    if ((string == null ? null : string.isa.objj_msgSend0(string, "length")) > length)
        return (string == null ? null : string.isa.objj_msgSend1(string, "substringFromIndex:", (string == null ? null : string.isa.objj_msgSend0(string, "length")) - length));
    while ((string == null ? null : string.isa.objj_msgSend0(string, "length")) < length)
        string = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "0%s", string);
    return string;
}
,["CPString","id","int"]), new objj_method(sel_getUid("_isAmericanFormat"), function $CPDateFormatter___isAmericanFormat(self, _cmd)
{
    return ((___r1 = ((___r2 = self._locale), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectForKey:", CPLocaleCountryCode))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToString:", "US"));
    var ___r1, ___r2;
}
,["BOOL"]), new objj_method(sel_getUid("_isEnglishFormat"), function $CPDateFormatter___isEnglishFormat(self, _cmd)
{
    return ((___r1 = ((___r2 = self._locale), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectForKey:", CPLocaleLanguageCode))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToString:", "en"));
    var ___r1, ___r2;
}
,["BOOL"]), new objj_method(sel_getUid("_secondsFromTimeZoneDefaultFormatString:"), function $CPDateFormatter___secondsFromTimeZoneDefaultFormatString_(self, _cmd, aTimeZoneFormatString)
{
    var format = /\w*([HPG-GMT])?([+-])(\d{1,2})([:])?(\d{2})\w*/,
        result = aTimeZoneFormatString.match(new RegExp(format)),
        seconds = 0;
    if (!result)
        return nil;
    seconds = result[3] * 60 * 60 + result[5] * 60;
    if (((___r1 = result[2]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToString:", "-")))
        seconds = -seconds;
    return seconds;
    var ___r1;
}
,["int","CPString"]), new objj_method(sel_getUid("_secondsFromTimeZoneString:style:"), function $CPDateFormatter___secondsFromTimeZoneString_style_(self, _cmd, aTimeZoneString, aStyle)
{
    var timeZone = CPTimeZone.isa.objj_msgSend3(CPTimeZone, "_timeZoneFromString:style:locale:", aTimeZoneString, aStyle, self._locale);
    if (!timeZone)
        return nil;
    return (timeZone == null ? null : timeZone.isa.objj_msgSend0(timeZone, "secondsFromGMT"));
}
,["int","CPString","NSTimeZoneNameStyle"]), new objj_method(sel_getUid("_lastIndexMatchedString:token:index:"), function $CPDateFormatter___lastIndexMatchedString_token_index_(self, _cmd, aString, aToken, anIndex)
{
    var character = (aToken == null ? null : aToken.isa.objj_msgSend1(aToken, "characterAtIndex:", 0)),
        length = (aToken == null ? null : aToken.isa.objj_msgSend0(aToken, "length")),
        targetedArray,
        format = /\w*([HPG-GMT])?([+-])(\d{1,2})([:])?(\d{2})\w*/,
        result = aString.match(new RegExp(format));
    switch(character) {
    case "Q":
        if (length == 3)
            targetedArray = self.isa.objj_msgSend0(self, "shortQuarterSymbols");
        if (length >= 4)
            targetedArray = self.isa.objj_msgSend0(self, "quarterSymbols");
        break;
    case "q":
        if (length == 3)
            targetedArray = self.isa.objj_msgSend0(self, "shortStandaloneQuarterSymbols");
        if (length >= 4)
            targetedArray = self.isa.objj_msgSend0(self, "standaloneQuarterSymbols");
        break;
    case "M":
        if (length == 3)
            targetedArray = self.isa.objj_msgSend0(self, "shortMonthSymbols");
        if (length == 4)
            targetedArray = self.isa.objj_msgSend0(self, "monthSymbols");
        if (length >= 5)
            targetedArray = self.isa.objj_msgSend0(self, "veryShortMonthSymbols");
        break;
    case "L":
        if (length == 3)
            targetedArray = self.isa.objj_msgSend0(self, "shortStandaloneMonthSymbols");
        if (length == 4)
            targetedArray = self.isa.objj_msgSend0(self, "standaloneMonthSymbols");
        if (length >= 5)
            targetedArray = self.isa.objj_msgSend0(self, "veryShortStandaloneMonthSymbols");
        break;
    case "E":
        if (length <= 3)
            targetedArray = self.isa.objj_msgSend0(self, "shortWeekdaySymbols");
        if (length == 4)
            targetedArray = self.isa.objj_msgSend0(self, "weekdaySymbols");
        if (length >= 5)
            targetedArray = self.isa.objj_msgSend0(self, "veryShortWeekdaySymbols");
        break;
    case "e":
        if (length == 3)
            targetedArray = self.isa.objj_msgSend0(self, "shortWeekdaySymbols");
        if (length == 4)
            targetedArray = self.isa.objj_msgSend0(self, "weekdaySymbols");
        if (length >= 5)
            targetedArray = self.isa.objj_msgSend0(self, "veryShortWeekdaySymbols");
        break;
    case "c":
        if (length == 3)
            targetedArray = self.isa.objj_msgSend0(self, "shortStandaloneWeekdaySymbols");
        if (length == 4)
            targetedArray = self.isa.objj_msgSend0(self, "standaloneWeekdaySymbols");
        if (length >= 5)
            targetedArray = self.isa.objj_msgSend0(self, "veryShortStandaloneWeekdaySymbols");
        break;
    case "a":
        targetedArray = [self.isa.objj_msgSend0(self, "PMSymbol"), self.isa.objj_msgSend0(self, "AMSymbol")];
        break;
    case "z":
        if (length <= 3)
            targetedArray = CPTimeZone.isa.objj_msgSend2(CPTimeZone, "_namesForStyle:locale:", CPTimeZoneNameStyleShortDaylightSaving, self._locale);
        else
            targetedArray = CPTimeZone.isa.objj_msgSend2(CPTimeZone, "_namesForStyle:locale:", CPTimeZoneNameStyleDaylightSaving, self._locale);
        if (result)
            return anIndex + (result == null ? null : result.isa.objj_msgSend1(result, "objectAtIndex:", 0)).length;
        break;
    case "Z":
        if (result)
            return anIndex + (result == null ? null : result.isa.objj_msgSend1(result, "objectAtIndex:", 0)).length;
        return CPNotFound;
    case "v":
        if (length == 1)
            targetedArray = CPTimeZone.isa.objj_msgSend2(CPTimeZone, "_namesForStyle:locale:", CPTimeZoneNameStyleShortGeneric, self._locale);
        else if (length == 4)
            targetedArray = CPTimeZone.isa.objj_msgSend2(CPTimeZone, "_namesForStyle:locale:", CPTimeZoneNameStyleGeneric, self._locale);
        if (result)
            return anIndex + (result == null ? null : result.isa.objj_msgSend1(result, "objectAtIndex:", 0)).length;
        break;
    case "V":
        if (length == 1)
            targetedArray = CPTimeZone.isa.objj_msgSend2(CPTimeZone, "_namesForStyle:locale:", CPTimeZoneNameStyleShortStandard, self._locale);
        if (result)
            return anIndex + (result == null ? null : result.isa.objj_msgSend1(result, "objectAtIndex:", 0)).length;
        break;
default:
        CPLog.warn("No pattern found for " + aToken);
        return CPNotFound;
    }
    for (var i = 0; i < (targetedArray == null ? null : targetedArray.isa.objj_msgSend0(targetedArray, "count")); i++)
    {
        var currentObject = (targetedArray == null ? null : targetedArray.isa.objj_msgSend1(targetedArray, "objectAtIndex:", i)),
            range = (aString == null ? null : aString.isa.objj_msgSend1(aString, "rangeOfString:", currentObject));
        if (range.length == 0)
            continue;
        character = (aString == null ? null : aString.isa.objj_msgSend1(aString, "characterAtIndex:", anIndex + range.length));
        if ((character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "'")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", ",")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", ":")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "/")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "-")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", " ")) || (character == null ? null : character.isa.objj_msgSend1(character, "isEqualToString:", "")))
            return anIndex + range.length;
    }
    return CPNotFound;
}
,["int","CPString","CPString","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPDateFormatter__initialize(self, _cmd)
{
    if (self !== CPDateFormatter.isa.objj_msgSend0(CPDateFormatter, "class"))
        return;
    relativeDateFormating = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", ["demain", 1, "apr" + String.fromCharCode(233) + "s-demain", 2, "apr" + String.fromCharCode(233) + "s-apr" + String.fromCharCode(233) + "s-demain", 3, "hier", -1, "avant-hier", -2, "avant-avant-hier", -3], "fr", ["tomorrow", 1, "yesterday", -1], "en", [], "de", [], "es");
    patternStringTokens = ["QQQ", "qqq", "QQQQ", "qqqq", "MMM", "MMMM", "LLL", "LLLL", "E", "EE", "EEE", "eee", "eeee", "eeeee", "a", "z", "zz", "zzz", "zzzz", "Z", "ZZ", "ZZZ", "ZZZZ", "ZZZZZ", "v", "vv", "vvv", "vvvv", "V", "VV", "VVV", "VVVV"];
}
,["void"]), new objj_method(sel_getUid("localizedStringFromDate:dateStyle:timeStyle:"), function $CPDateFormatter__localizedStringFromDate_dateStyle_timeStyle_(self, _cmd, date, dateStyle, timeStyle)
{
    var formatter = ((___r1 = CPDateFormatter.isa.objj_msgSend0(CPDateFormatter, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (formatter == null ? null : formatter.isa.objj_msgSend1(formatter, "setFormatterBehavior:", CPDateFormatterBehavior10_4));
    (formatter == null ? null : formatter.isa.objj_msgSend1(formatter, "setDateStyle:", dateStyle));
    (formatter == null ? null : formatter.isa.objj_msgSend1(formatter, "setTimeStyle:", timeStyle));
    return (formatter == null ? null : formatter.isa.objj_msgSend1(formatter, "stringForObjectValue:", date));
    var ___r1;
}
,["CPString","CPDate","CPDateFormatterStyle","CPDateFormatterStyle"]), new objj_method(sel_getUid("dateFormatFromTemplate:options:locale:"), function $CPDateFormatter__dateFormatFromTemplate_options_locale_(self, _cmd, template, opts, locale)
{
}
,["CPString","CPString","CPUInteger","CPLocale"]), new objj_method(sel_getUid("defaultFormatterBehavior"), function $CPDateFormatter__defaultFormatterBehavior(self, _cmd)
{
    return defaultDateFormatterBehavior;
}
,["CPDateFormatterBehavior"]), new objj_method(sel_getUid("setDefaultFormatterBehavior:"), function $CPDateFormatter__setDefaultFormatterBehavior_(self, _cmd, behavior)
{
    defaultDateFormatterBehavior = behavior;
}
,["void","CPDateFormatterBehavior"])]);
}var CPDateFormatterDateStyleKey = "CPDateFormatterDateStyle",
    CPDateFormatterTimeStyleKey = "CPDateFormatterTimeStyleKey",
    CPDateFormatterFormatterBehaviorKey = "CPDateFormatterFormatterBehaviorKey",
    CPDateFormatterDoseRelativeDateFormattingKey = "CPDateFormatterDoseRelativeDateFormattingKey",
    CPDateFormatterDateFormatKey = "CPDateFormatterDateFormatKey",
    CPDateFormatterAllowNaturalLanguageKey = "CPDateFormatterAllowNaturalLanguageKey",
    CPDateFormatterLocaleKey = "CPDateFormatterLocaleKey";
{
var the_class = objj_getClass("CPDateFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDateFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPDateFormatter__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDateFormatter").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._allowNaturalLanguage = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPDateFormatterAllowNaturalLanguageKey));
        self._dateFormat = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPDateFormatterDateFormatKey));
        self._dateStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPDateFormatterDateStyleKey));
        self._doesRelativeDateFormatting = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPDateFormatterDoseRelativeDateFormattingKey));
        self._formatterBehavior = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPDateFormatterFormatterBehaviorKey));
        self._locale = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPDateFormatterLocaleKey));
        self._timeStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPDateFormatterTimeStyleKey));
    }
    (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPDateFormatter__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDateFormatter").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowNaturalLanguage, CPDateFormatterAllowNaturalLanguageKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._dateStyle, CPDateFormatterDateStyleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._dateFormat, CPDateFormatterDateFormatKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._doesRelativeDateFormatting, CPDateFormatterDoseRelativeDateFormattingKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._formatterBehavior, CPDateFormatterFormatterBehaviorKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._locale, CPDateFormatterLocaleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._timeStyle, CPDateFormatterTimeStyleKey));
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPDate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_dateWithTimeZone:"), function $CPDate___dateWithTimeZone_(self, _cmd, aTimeZone)
{
    if (!aTimeZone)
        return;
    self.setSeconds(self.getSeconds() - (aTimeZone == null ? null : aTimeZone.isa.objj_msgSend1(aTimeZone, "secondsFromGMTForDate:", self)));
    self.setSeconds(self.getSeconds() + (aTimeZone == null ? null : aTimeZone.isa.objj_msgSend0(aTimeZone, "secondsFromGMT")));
}
,["void","CPTimeZone"])]);
}