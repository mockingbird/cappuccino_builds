@STATIC;1.0;i;9;CPArray.ji;8;CPDate.ji;10;CPString.ji;13;CPFormatter.ji;12;CPTimeZone.ji;10;CPLocale.jt;75473;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDate.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPFormatter.j", YES);objj_executeFile("CPTimeZone.j", YES);objj_executeFile("CPLocale.j", YES);CPDateFormatterNoStyle = 0;
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
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithDateFormat:allowNaturalLanguage:"), function $CPDateFormatter__initWithDateFormat_allowNaturalLanguage_(self, _cmd, format, flag)
{
    if (self = objj_msgSend(self, "init"))
    {
        self._dateFormat = format;
        self._allowNaturalLanguage = flag;
    }
    return self;
}
,["id","CPString","BOOL"]), new objj_method(sel_getUid("_init"), function $CPDateFormatter___init(self, _cmd)
{
    var AMSymbol = objj_msgSend(CPString, "stringWithFormat:", "%s", "AM"),
        PMSymbol = objj_msgSend(CPString, "stringWithFormat:", "%s", "PM"),
        weekdaySymbols = objj_msgSend(CPArray, "arrayWithObjects:", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"),
        shortWeekdaySymbols = objj_msgSend(CPArray, "arrayWithObjects:", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
        veryShortWeekdaySymbols = objj_msgSend(CPArray, "arrayWithObjects:", "S", "M", "T", "W", "T", "F", "S"),
        standaloneWeekdaySymbols = objj_msgSend(CPArray, "arrayWithObjects:", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"),
        shortStandaloneWeekdaySymbols = objj_msgSend(CPArray, "arrayWithObjects:", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
        veryShortStandaloneWeekdaySymbols = objj_msgSend(CPArray, "arrayWithObjects:", "S", "M", "T", "W", "T", "F", "S"),
        monthSymbols = objj_msgSend(CPArray, "arrayWithObjects:", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"),
        shortMonthSymbols = objj_msgSend(CPArray, "arrayWithObjects:", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
        veryShortMonthSymbols = objj_msgSend(CPArray, "arrayWithObjects:", "J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"),
        standaloneMonthSymbols = objj_msgSend(CPArray, "arrayWithObjects:", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"),
        shortStandaloneMonthSymbols = objj_msgSend(CPArray, "arrayWithObjects:", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
        veryShortStandaloneMonthSymbols = objj_msgSend(CPArray, "arrayWithObjects:", "J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"),
        quarterSymbols = objj_msgSend(CPArray, "arrayWithObjects:", "1st quarter", "2nd quarter", "3rd quarter", "4th quarter"),
        shortQuarterSymbols = objj_msgSend(CPArray, "arrayWithObjects:", "Q1", "Q2", "Q3", "Q4"),
        standaloneQuarterSymbols = objj_msgSend(CPArray, "arrayWithObjects:", "1st quarter", "2nd quarter", "3rd quarter", "4th quarter"),
        shortStandaloneQuarterSymbols = objj_msgSend(CPArray, "arrayWithObjects:", "Q1", "Q2", "Q3", "Q4");
    self._symbols = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", AMSymbol, "AMSymbol", PMSymbol, "PMSymbol", weekdaySymbols, "weekdaySymbols", shortWeekdaySymbols, "shortWeekdaySymbols", veryShortWeekdaySymbols, "veryShortWeekdaySymbols", standaloneWeekdaySymbols, "standaloneWeekdaySymbols", shortStandaloneWeekdaySymbols, "shortStandaloneWeekdaySymbols", veryShortStandaloneWeekdaySymbols, "veryShortStandaloneWeekdaySymbols", monthSymbols, "monthSymbols", shortMonthSymbols, "shortMonthSymbols", veryShortMonthSymbols, "veryShortMonthSymbols", standaloneMonthSymbols, "standaloneMonthSymbols", shortStandaloneMonthSymbols, "shortStandaloneMonthSymbols", veryShortStandaloneMonthSymbols, "veryShortStandaloneMonthSymbols", quarterSymbols, "quarterSymbols", shortQuarterSymbols, "shortQuarterSymbols", standaloneQuarterSymbols, "standaloneQuarterSymbols", shortStandaloneQuarterSymbols, "shortStandaloneQuarterSymbols"), "en", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"), "fr", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"), "es", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"), "de");
    self._timeZone = objj_msgSend(CPTimeZone, "systemTimeZone");
    self._twoDigitStartDate = objj_msgSend(objj_msgSend(CPDate, "alloc"), "initWithString:", "1950-01-01 00:00:00 +0000");
    self._locale = objj_msgSend(CPLocale, "currentLocale");
}
,["void"]), new objj_method(sel_getUid("AMSymbol"), function $CPDateFormatter__AMSymbol(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "AMSymbol");
}
,["CPString"]), new objj_method(sel_getUid("setAMSymbol:"), function $CPDateFormatter__setAMSymbol_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "AMSymbol");
}
,["void","CPString"]), new objj_method(sel_getUid("PMSymbol"), function $CPDateFormatter__PMSymbol(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "PMSymbol");
}
,["CPString"]), new objj_method(sel_getUid("setPMSymbol:"), function $CPDateFormatter__setPMSymbol_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "PMSymbol");
}
,["void","CPString"]), new objj_method(sel_getUid("weekdaySymbols"), function $CPDateFormatter__weekdaySymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "weekdaySymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setWeekdaySymbols:"), function $CPDateFormatter__setWeekdaySymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "weekdaySymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("shortWeekdaySymbols"), function $CPDateFormatter__shortWeekdaySymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "shortWeekdaySymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setShortWeekdaySymbols:"), function $CPDateFormatter__setShortWeekdaySymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "shortWeekdaySymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("veryShortWeekdaySymbols"), function $CPDateFormatter__veryShortWeekdaySymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "veryShortWeekdaySymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setVeryShortWeekdaySymbols:"), function $CPDateFormatter__setVeryShortWeekdaySymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "veryShortWeekdaySymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("standaloneWeekdaySymbols"), function $CPDateFormatter__standaloneWeekdaySymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "standaloneWeekdaySymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setStandaloneWeekdaySymbols:"), function $CPDateFormatter__setStandaloneWeekdaySymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "standaloneWeekdaySymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("shortStandaloneWeekdaySymbols"), function $CPDateFormatter__shortStandaloneWeekdaySymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "shortStandaloneWeekdaySymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setShortStandaloneWeekdaySymbols:"), function $CPDateFormatter__setShortStandaloneWeekdaySymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "shortStandaloneWeekdaySymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("veryShortStandaloneWeekdaySymbols"), function $CPDateFormatter__veryShortStandaloneWeekdaySymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "veryShortStandaloneWeekdaySymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setVeryShortStandaloneWeekdaySymbols:"), function $CPDateFormatter__setVeryShortStandaloneWeekdaySymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "veryShortStandaloneWeekdaySymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("monthSymbols"), function $CPDateFormatter__monthSymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "monthSymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setMonthSymbols:"), function $CPDateFormatter__setMonthSymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "monthSymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("shortMonthSymbols"), function $CPDateFormatter__shortMonthSymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "shortMonthSymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setShortMonthSymbols:"), function $CPDateFormatter__setShortMonthSymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "shortMonthSymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("veryShortMonthSymbols"), function $CPDateFormatter__veryShortMonthSymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "veryShortMonthSymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setVeryShortMonthSymbols:"), function $CPDateFormatter__setVeryShortMonthSymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "veryShortMonthSymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("standaloneMonthSymbols"), function $CPDateFormatter__standaloneMonthSymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "standaloneMonthSymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setStandaloneMonthSymbols:"), function $CPDateFormatter__setStandaloneMonthSymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "standaloneMonthSymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("shortStandaloneMonthSymbols"), function $CPDateFormatter__shortStandaloneMonthSymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "shortStandaloneMonthSymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setShortStandaloneMonthSymbols:"), function $CPDateFormatter__setShortStandaloneMonthSymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "shortStandaloneMonthSymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("veryShortStandaloneMonthSymbols"), function $CPDateFormatter__veryShortStandaloneMonthSymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "veryShortStandaloneMonthSymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setVeryShortStandaloneMonthSymbols:"), function $CPDateFormatter__setVeryShortStandaloneMonthSymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "veryShortStandaloneMonthSymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("quarterSymbols"), function $CPDateFormatter__quarterSymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "quarterSymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setQuarterSymbols:"), function $CPDateFormatter__setQuarterSymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "quarterSymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("shortQuarterSymbols"), function $CPDateFormatter__shortQuarterSymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "shortQuarterSymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setShortQuarterSymbols:"), function $CPDateFormatter__setShortQuarterSymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "shortQuarterSymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("standaloneQuarterSymbols"), function $CPDateFormatter__standaloneQuarterSymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "standaloneQuarterSymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setStandaloneQuarterSymbols:"), function $CPDateFormatter__setStandaloneQuarterSymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "standaloneQuarterSymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("shortStandaloneQuarterSymbols"), function $CPDateFormatter__shortStandaloneQuarterSymbols(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "valueForKey:", "shortStandaloneQuarterSymbols");
}
,["CPArray"]), new objj_method(sel_getUid("setShortStandaloneQuarterSymbols:"), function $CPDateFormatter__setShortStandaloneQuarterSymbols_(self, _cmd, aValue)
{
    objj_msgSend(objj_msgSend(self._symbols, "valueForKey:", objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode)), "setValue:forKey:", aValue, "shortStandaloneQuarterSymbols");
}
,["void","CPArray"]), new objj_method(sel_getUid("stringFromDate:"), function $CPDateFormatter__stringFromDate_(self, _cmd, aDate)
{
    var format,
        relativeWord,
        result;
    if (!aDate)
        return;
    aDate = objj_msgSend(aDate, "copy");
    objj_msgSend(aDate, "_dateWithTimeZone:", self._timeZone);
    if (self._dateFormat)
        return objj_msgSend(self, "_stringFromDate:format:", aDate, self._dateFormat);
    switch(self._dateStyle) {
    case CPDateFormatterNoStyle:
        format = "";
        break;
    case CPDateFormatterShortStyle:
        if (objj_msgSend(self, "_isAmericanFormat"))
            format = "M/d/yy";
        else
            format = "dd/MM/yy";
        break;
    case CPDateFormatterMediumStyle:
        if (objj_msgSend(self, "_isAmericanFormat"))
            format = "MMM d, Y";
        else
            format = "d MMM Y";
        break;
    case CPDateFormatterLongStyle:
        if (objj_msgSend(self, "_isAmericanFormat"))
            format = "MMMM d, Y";
        else
            format = "d MMMM Y";
        break;
    case CPDateFormatterFullStyle:
        if (objj_msgSend(self, "_isAmericanFormat"))
            format = "EEEE, MMMM d, Y";
        else
            format = "EEEE d MMMM Y";
        break;
default:
        format = "";
    }
    if (objj_msgSend(self, "doesRelativeDateFormatting"))
    {
        var language = objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode),
            relativeWords = objj_msgSend(relativeDateFormating, "valueForKey:", language);
        for (var i = 1; i < objj_msgSend(relativeWords, "count"); i = i + 2)
        {
            var date = objj_msgSend(CPDate, "date");
            objj_msgSend(date, "_dateWithTimeZone:", self._timeZone);
            date.setHours(aDate.getHours());
            date.setMinutes(aDate.getMinutes());
            date.setSeconds(aDate.getSeconds());
            date.setMinutes(objj_msgSend(relativeWords, "objectAtIndex:", i));
            if (date.getDate() == aDate.getDate() && date.getMonth() && aDate.getMonth() && date.getFullYear() == aDate.getFullYear())
            {
                relativeWord = objj_msgSend(relativeWords, "objectAtIndex:", i - 1);
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
        if (objj_msgSend(self, "_isEnglishFormat"))
            format += "h:mm a";
        else
            format += "H:mm";
        break;
    case CPDateFormatterMediumStyle:
        if (objj_msgSend(self, "_isEnglishFormat"))
            format += "h:mm:ss a";
        else
            format += "H:mm:ss";
        break;
    case CPDateFormatterLongStyle:
        if (objj_msgSend(self, "_isEnglishFormat"))
            format += "h:mm:ss a z";
        else
            format += "H:mm:ss z";
        break;
    case CPDateFormatterFullStyle:
        if (objj_msgSend(self, "_isEnglishFormat"))
            format += "h:mm:ss a zzzz";
        else
            format += "h:mm:ss zzzz";
        break;
default:
        format += "";
    }
    result = objj_msgSend(self, "_stringFromDate:format:", aDate, format);
    if (relativeWord)
        result = relativeWord + result;
    return result;
}
,["CPString","CPDate"]), new objj_method(sel_getUid("stringForObjectValue:"), function $CPDateFormatter__stringForObjectValue_(self, _cmd, anObject)
{
    if (objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(CPDate, "class")))
        return objj_msgSend(self, "stringFromDate:", anObject);
    else
        return nil;
}
,["CPString","id"]), new objj_method(sel_getUid("editingStringForObjectValue:"), function $CPDateFormatter__editingStringForObjectValue_(self, _cmd, anObject)
{
    return objj_msgSend(self, "stringForObjectValue:", anObject);
}
,["CPString","id"]), new objj_method(sel_getUid("_stringFromDate:format:"), function $CPDateFormatter___stringFromDate_format_(self, _cmd, aDate, aFormat)
{
    var length = objj_msgSend(aFormat, "length"),
        currentToken = objj_msgSend(CPString, "new"),
        isTextToken = NO,
        result = objj_msgSend(CPString, "new");
    for (var i = 0; i < length; i++)
    {
        var character = objj_msgSend(aFormat, "characterAtIndex:", i);
        if (isTextToken)
        {
            if (objj_msgSend(character, "isEqualToString:", "'"))
            {
                isTextToken = NO;
                result += currentToken;
                currentToken = objj_msgSend(CPString, "new");
            }
            else
            {
                currentToken += character;
            }
            continue;
        }
        if (objj_msgSend(character, "isEqualToString:", "'"))
        {
            if (!isTextToken)
            {
                isTextToken = YES;
                result += currentToken;
                currentToken = objj_msgSend(CPString, "new");
            }
            continue;
        }
        if (objj_msgSend(character, "isEqualToString:", ",") || objj_msgSend(character, "isEqualToString:", ":") || objj_msgSend(character, "isEqualToString:", "/") || objj_msgSend(character, "isEqualToString:", "-") || objj_msgSend(character, "isEqualToString:", " "))
        {
            result += objj_msgSend(self, "_stringFromToken:date:", currentToken, aDate);
            result += character;
            currentToken = objj_msgSend(CPString, "new");
        }
        else
        {
            if (objj_msgSend(currentToken, "length") && !objj_msgSend(objj_msgSend(currentToken, "characterAtIndex:", 0), "isEqualToString:", character))
            {
                result += objj_msgSend(self, "_stringFromToken:date:", currentToken, aDate);
                currentToken = objj_msgSend(CPString, "new");
            }
            currentToken += character;
            if (i == length - 1)
                result += objj_msgSend(self, "_stringFromToken:date:", currentToken, aDate);
        }
    }
    return result;
}
,["CPString","CPDate","CPString"]), new objj_method(sel_getUid("_stringFromToken:date:"), function $CPDateFormatter___stringFromToken_date_(self, _cmd, aToken, aDate)
{
    if (!objj_msgSend(aToken, "length"))
        return aToken;
    var character = objj_msgSend(aToken, "characterAtIndex:", 0),
        length = objj_msgSend(aToken, "length"),
        timeZone = self._timeZone;
    switch(character) {
    case "G":
        CPLog.warn("Token not yet implemented " + aToken);
        return objj_msgSend(CPString, "new");
    case "y":
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", aDate.getFullYear()), "length");
        return objj_msgSend(self, "_stringValueForValue:length:", aDate.getFullYear(), length == 2 ? length : currentLength);
    case "Y":
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", aDate.getFullYear()), "length");
        return objj_msgSend(self, "_stringValueForValue:length:", aDate.getFullYear(), length == 2 ? length : currentLength);
    case "u":
        CPLog.warn("Token not yet implemented " + aToken);
        return objj_msgSend(CPString, "new");
    case "U":
        CPLog.warn("Token not yet implemented " + aToken);
        return objj_msgSend(CPString, "new");
    case "Q":
        var quarter = 1;
        if (aDate.getMonth() < 6 && aDate.getMonth() > 2)
            quarter = 2;
        if (aDate.getMonth() > 5 && aDate.getMonth() < 9)
            quarter = 3;
        if (aDate.getMonth() >= 9)
            quarter = 4;
        if (length <= 2)
            return objj_msgSend(self, "_stringValueForValue:length:", quarter, MIN(2, length));
        if (length == 3)
            return objj_msgSend(objj_msgSend(self, "shortQuarterSymbols"), "objectAtIndex:", quarter - 1);
        if (length >= 4)
            return objj_msgSend(objj_msgSend(self, "quarterSymbols"), "objectAtIndex:", quarter - 1);
    case "q":
        var quarter = 1;
        if (aDate.getMonth() < 6 && aDate.getMonth() > 2)
            quarter = 2;
        if (aDate.getMonth() > 5 && aDate.getMonth() < 9)
            quarter = 3;
        if (aDate.getMonth() >= 9)
            quarter = 4;
        if (length <= 2)
            return objj_msgSend(self, "_stringValueForValue:length:", quarter, MIN(2, length));
        if (length == 3)
            return objj_msgSend(objj_msgSend(self, "shortStandaloneQuarterSymbols"), "objectAtIndex:", quarter - 1);
        if (length >= 4)
            return objj_msgSend(objj_msgSend(self, "standaloneQuarterSymbols"), "objectAtIndex:", quarter - 1);
    case "M":
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", aDate.getMonth() + 1), "length");
        if (length <= 2)
            return objj_msgSend(self, "_stringValueForValue:length:", aDate.getMonth() + 1, MAX(currentLength, length));
        if (length == 3)
            return objj_msgSend(objj_msgSend(self, "shortMonthSymbols"), "objectAtIndex:", aDate.getMonth());
        if (length == 4)
            return objj_msgSend(objj_msgSend(self, "monthSymbols"), "objectAtIndex:", aDate.getMonth());
        if (length >= 5)
            return objj_msgSend(objj_msgSend(self, "veryShortMonthSymbols"), "objectAtIndex:", aDate.getMonth());
    case "L":
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", aDate.getMonth() + 1), "length");
        if (length <= 2)
            return objj_msgSend(self, "_stringValueForValue:length:", aDate.getMonth() + 1, MAX(currentLength, length));
        if (length == 3)
            return objj_msgSend(objj_msgSend(self, "shortStandaloneMonthSymbols"), "objectAtIndex:", aDate.getMonth());
        if (length == 4)
            return objj_msgSend(objj_msgSend(self, "standaloneMonthSymbols"), "objectAtIndex:", aDate.getMonth());
        if (length >= 5)
            return objj_msgSend(objj_msgSend(self, "veryShortStandaloneMonthSymbols"), "objectAtIndex:", aDate.getMonth());
    case "I":
        CPLog.warn("Depreacted - Token not yet implemented " + aToken);
        return objj_msgSend(CPString, "new");
    case "w":
        var d = objj_msgSend(aDate, "copy");
        d.setHours(0, 0, 0);
        d.setDate(d.getDate() + 4 - (d.getDay() || 7));
        var yearStart = new Date(d.getFullYear(), 0, 1),
            weekOfYear = Math.ceil(((d - yearStart) / 86400000 + 1) / 7);
        return objj_msgSend(self, "_stringValueForValue:length:", weekOfYear + 1, MAX(2, length));
    case "W":
        var firstDay = (new Date(aDate.getFullYear(), aDate.getMonth(), 1)).getDay(),
            weekOfMonth = Math.ceil((aDate.getDate() + firstDay) / 7);
        return objj_msgSend(self, "_stringValueForValue:length:", weekOfMonth, 1);
    case "d":
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", aDate.getDate()), "length");
        return objj_msgSend(self, "_stringValueForValue:length:", aDate.getDate(), MAX(length, currentLength));
    case "D":
        var oneJan = new Date(aDate.getFullYear(), 0, 1),
            dayOfYear = Math.ceil((aDate - oneJan) / 86400000),
            currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", dayOfYear), "length");
        return objj_msgSend(self, "_stringValueForValue:length:", dayOfYear, MAX(currentLength, MIN(3, length)));
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
        return objj_msgSend(self, "_stringValueForValue:length:", dayOfWeek, 1);
    case "g":
        CPLog.warn("Token not yet implemented " + aToken);
        return objj_msgSend(CPString, "new");
    case "E":
        var day = aDate.getDay();
        if (length <= 3)
            return objj_msgSend(objj_msgSend(self, "shortWeekdaySymbols"), "objectAtIndex:", day);
        if (length == 4)
            return objj_msgSend(objj_msgSend(self, "weekdaySymbols"), "objectAtIndex:", day);
        if (length >= 5)
            return objj_msgSend(objj_msgSend(self, "veryShortWeekdaySymbols"), "objectAtIndex:", day);
    case "e":
        var day = aDate.getDay();
        if (length <= 2)
            return objj_msgSend(self, "_stringValueForValue:length:", day + 1, MIN(2, length));
        if (length == 3)
            return objj_msgSend(objj_msgSend(self, "shortWeekdaySymbols"), "objectAtIndex:", day);
        if (length == 4)
            return objj_msgSend(objj_msgSend(self, "weekdaySymbols"), "objectAtIndex:", day);
        if (length >= 5)
            return objj_msgSend(objj_msgSend(self, "veryShortWeekdaySymbols"), "objectAtIndex:", day);
    case "c":
        var day = aDate.getDay();
        if (length <= 2)
            return objj_msgSend(self, "_stringValueForValue:length:", day + 1, ((aDate.getDay()).toString()).length);
        if (length == 3)
            return objj_msgSend(objj_msgSend(self, "shortStandaloneWeekdaySymbols"), "objectAtIndex:", day);
        if (length == 4)
            return objj_msgSend(objj_msgSend(self, "standaloneWeekdaySymbols"), "objectAtIndex:", day);
        if (length >= 5)
            return objj_msgSend(objj_msgSend(self, "veryShortStandaloneWeekdaySymbols"), "objectAtIndex:", day);
    case "a":
        if (aDate.getHours() > 11)
            return objj_msgSend(self, "PMSymbol");
        else
            return objj_msgSend(self, "AMSymbol");
    case "h":
        var hours = aDate.getHours();
        if (objj_msgSend(self, "_isAmericanFormat") || objj_msgSend(self, "_isEnglishFormat"))
        {
            if (hours == 0)
                hours = 12;
            else if (hours > 12)
                hours = hours - 12;
        }
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", hours), "length");
        return objj_msgSend(self, "_stringValueForValue:length:", hours, MAX(currentLength, MIN(2, length)));
    case "H":
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", aDate.getHours()), "length");
        return objj_msgSend(self, "_stringValueForValue:length:", aDate.getHours(), MAX(currentLength, MIN(2, length)));
    case "K":
        var hours = aDate.getHours();
        if (hours > 12)
            hours -= 12;
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", hours), "length");
        return objj_msgSend(self, "_stringValueForValue:length:", hours, MAX(currentLength, MIN(2, length)));
    case "k":
        var hours = aDate.getHours();
        if (aDate.getHours() == 0)
            hours = 24;
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", hours), "length");
        return objj_msgSend(self, "_stringValueForValue:length:", hours, MAX(currentLength, MIN(2, length)));
    case "j":
        CPLog.warn("Token not yet implemented " + aToken);
        return objj_msgSend(CPString, "new");
    case "m":
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", aDate.getMinutes()), "length");
        return objj_msgSend(self, "_stringValueForValue:length:", aDate.getMinutes(), MAX(currentLength, MIN(2, length)));
    case "s":
        var currentLength = objj_msgSend(objj_msgSend(CPString, "stringWithFormat:", "%i", aDate.getMinutes()), "length");
        return objj_msgSend(self, "_stringValueForValue:length:", aDate.getSeconds(), MIN(2, length));
    case "S":
        return objj_msgSend(self, "_stringValueForValue:length:", aDate.getMilliseconds(), length);
    case "A":
        var value = aDate.getHours() * 60 * 60 * 1000 + aDate.getMinutes() * 60 * 1000 + aDate.getSeconds() * 1000 + aDate.getMilliseconds();
        return objj_msgSend(self, "_stringValueForValue:length:", value, (value.toString()).length);
    case "z":
        if (length <= 3)
            return objj_msgSend(timeZone, "localizedName:locale:", CPTimeZoneNameStyleShortDaylightSaving, self._locale);
        else
            return objj_msgSend(timeZone, "localizedName:locale:", CPTimeZoneNameStyleDaylightSaving, self._locale);
    case "Z":
        var seconds = objj_msgSend(timeZone, "secondsFromGMT"),
            minutes = seconds / 60,
            hours = minutes / 60,
            result,
            diffMinutes = (hours - parseInt(hours)) * 100 * 60 / 100;
        if (length <= 3)
        {
            result = diffMinutes.toString();
            while (objj_msgSend(result, "length") < 2)
                result = "0" + result;
            result = ABS(parseInt(hours)) + result;
            while (objj_msgSend(result, "length") < 4)
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
            while (objj_msgSend(result, "length") < 2)
                result = "0" + result;
            result = ":" + result;
            result = ABS(parseInt(hours)) + result;
            while (objj_msgSend(result, "length") < 5)
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
            while (objj_msgSend(result, "length") < 2)
                result = "0" + result;
            result = ":" + result;
            result = ABS(parseInt(hours)) + result;
            while (objj_msgSend(result, "length") < 5)
                result = "0" + result;
            if (seconds > 0)
                result = "+" + result;
            else
                result = "-" + result;
            return result;
        }
    case "v":
        if (length == 1)
            return objj_msgSend(timeZone, "localizedName:locale:", CPTimeZoneNameStyleShortGeneric, self._locale);
        else if (length == 4)
            return objj_msgSend(timeZone, "localizedName:locale:", CPTimeZoneNameStyleGeneric, self._locale);
        return " ";
    case "V":
        if (length == 1)
        {
            return objj_msgSend(timeZone, "localizedName:locale:", CPTimeZoneNameStyleShortDaylightSaving, self._locale);
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
    return objj_msgSend(CPString, "new");
}
,["CPString","CPString","CPDate"]), new objj_method(sel_getUid("dateFromString:"), function $CPDateFormatter__dateFromString_(self, _cmd, aString)
{
    if (aString == nil)
        return nil;
    var format;
    if (self._dateFormat != nil)
        return objj_msgSend(self, "_dateFromString:format:", aString, self._dateFormat);
    switch(self._dateStyle) {
    case CPDateFormatterNoStyle:
        format = "";
        break;
    case CPDateFormatterShortStyle:
        if (objj_msgSend(self, "_isAmericanFormat"))
            format = "M/d/yy";
        else
            format = "dd/MM/yy";
        break;
    case CPDateFormatterMediumStyle:
        if (objj_msgSend(self, "_isAmericanFormat"))
            format = "MMM d, Y";
        else
            format = "d MMM Y";
        break;
    case CPDateFormatterLongStyle:
        if (objj_msgSend(self, "_isAmericanFormat"))
            format = "MMMM d, Y";
        else
            format = "d MMMM Y";
        break;
    case CPDateFormatterFullStyle:
        if (objj_msgSend(self, "_isAmericanFormat"))
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
        if (objj_msgSend(self, "_isEnglishFormat"))
            format += " h:mm a";
        else
            format += " H:mm";
        break;
    case CPDateFormatterMediumStyle:
        if (objj_msgSend(self, "_isEnglishFormat"))
            format += " h:mm:ss a";
        else
            format += " H:mm:ss";
        break;
    case CPDateFormatterLongStyle:
        if (objj_msgSend(self, "_isEnglishFormat"))
            format += " h:mm:ss a z";
        else
            format += " H:mm:ss z";
        break;
    case CPDateFormatterFullStyle:
        if (objj_msgSend(self, "_isEnglishFormat"))
            format += " h:mm:ss a zzzz";
        else
            format += " h:mm:ss zzzz";
        break;
default:
        format += "";
    }
    return objj_msgSend(self, "_dateFromString:format:", aString, format);
}
,["CPDate","CPString"]), new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"), function $CPDateFormatter__getObjectValue_forString_errorDescription_(self, _cmd, anObject, aString, anError)
{
    var value = objj_msgSend(self, "dateFromString:", aString);
    (anObject)(value);
    if (!value)
    {
        (anError)("The value \"" + aString + "\" is invalid.");
        return NO;
    }
    return YES;
}
,["BOOL","id","CPString","CPString"]), new objj_method(sel_getUid("_dateFromString:format:"), function $CPDateFormatter___dateFromString_format_(self, _cmd, aString, aFormat)
{
    if (aString == nil || aFormat == nil)
        return nil;
    var currentToken = objj_msgSend(CPString, "new"),
        isTextToken = NO,
        tokens = objj_msgSend(CPArray, "array"),
        dateComponents = objj_msgSend(CPArray, "array"),
        patternTokens = objj_msgSend(CPArray, "array");
    for (var i = 0; i < objj_msgSend(aFormat, "length"); i++)
    {
        var character = objj_msgSend(aFormat, "characterAtIndex:", i);
        if (isTextToken)
        {
            if (objj_msgSend(character, "isEqualToString:", "'"))
                currentToken = objj_msgSend(CPString, "new");
            continue;
        }
        if (objj_msgSend(character, "isEqualToString:", "'"))
        {
            if (!isTextToken)
                isTextToken = YES;
            continue;
        }
        if (objj_msgSend(character, "isEqualToString:", ",") || objj_msgSend(character, "isEqualToString:", ":") || objj_msgSend(character, "isEqualToString:", "/") || objj_msgSend(character, "isEqualToString:", "-") || objj_msgSend(character, "isEqualToString:", " "))
        {
            objj_msgSend(tokens, "addObject:", currentToken);
            if (objj_msgSend(patternStringTokens, "containsObject:", currentToken))
                objj_msgSend(patternTokens, "addObject:", objj_msgSend(tokens, "count") - 1);
            currentToken = objj_msgSend(CPString, "new");
        }
        else
        {
            if (objj_msgSend(currentToken, "length") && !objj_msgSend(objj_msgSend(currentToken, "characterAtIndex:", 0), "isEqualToString:", character))
            {
                objj_msgSend(tokens, "addObject:", currentToken);
                if (objj_msgSend(patternStringTokens, "containsObject:", currentToken))
                    objj_msgSend(patternTokens, "addObject:", objj_msgSend(tokens, "count") - 1);
                currentToken = objj_msgSend(CPString, "new");
            }
            currentToken += character;
            if (i == objj_msgSend(aFormat, "length") - 1)
            {
                objj_msgSend(tokens, "addObject:", currentToken);
                if (objj_msgSend(patternStringTokens, "containsObject:", currentToken))
                    objj_msgSend(patternTokens, "addObject:", objj_msgSend(tokens, "count") - 1);
            }
        }
    }
    isTextToken = NO;
    currentToken = objj_msgSend(CPString, "new");
    var currentIndexSpecialPattern = 0;
    if (objj_msgSend(patternTokens, "count") == 0)
        objj_msgSend(patternTokens, "addObject:", CPNotFound);
    for (var i = 0; i < objj_msgSend(aString, "length"); i++)
    {
        var character = objj_msgSend(aString, "characterAtIndex:", i);
        if (isTextToken)
        {
            if (objj_msgSend(character, "isEqualToString:", "'"))
                currentToken = objj_msgSend(CPString, "new");
            continue;
        }
        if (objj_msgSend(character, "isEqualToString:", "'"))
        {
            if (!isTextToken)
                isTextToken = YES;
            continue;
        }
        if (objj_msgSend(dateComponents, "count") == objj_msgSend(patternTokens, "objectAtIndex:", currentIndexSpecialPattern))
        {
            var j = objj_msgSend(self, "_lastIndexMatchedString:token:index:", aString, objj_msgSend(tokens, "objectAtIndex:", objj_msgSend(dateComponents, "count")), i);
            if (j == CPNotFound)
                return nil;
            currentIndexSpecialPattern++;
            objj_msgSend(dateComponents, "addObject:", objj_msgSend(aString, "substringWithRange:", CPMakeRange(i, j - i)));
            i = j;
            continue;
        }
        if (objj_msgSend(character, "isEqualToString:", ",") || objj_msgSend(character, "isEqualToString:", ":") || objj_msgSend(character, "isEqualToString:", "/") || objj_msgSend(character, "isEqualToString:", "-") || objj_msgSend(character, "isEqualToString:", " "))
        {
            objj_msgSend(dateComponents, "addObject:", currentToken);
            currentToken = objj_msgSend(CPString, "new");
        }
        else
        {
            currentToken += character;
            if (i == objj_msgSend(aString, "length") - 1)
                objj_msgSend(dateComponents, "addObject:", currentToken);
        }
    }
    if (objj_msgSend(dateComponents, "count") != objj_msgSend(tokens, "count"))
        return nil;
    return objj_msgSend(self, "_dateFromTokens:dateComponents:", tokens, dateComponents);
}
,["CPDate","CPString","CPString"]), new objj_method(sel_getUid("_dateFromTokens:dateComponents:"), function $CPDateFormatter___dateFromTokens_dateComponents_(self, _cmd, tokens, dateComponents)
{
    var timeZoneseconds = objj_msgSend(self._timeZone, "secondsFromGMT"),
        dateArray = [2000, 01, 01, 00, 00, 00, "+0000"],
        isPM = NO,
        dayOfYear,
        dayIndexInWeek,
        weekOfYear,
        weekOfMonth;
    for (var i = 0; i < objj_msgSend(tokens, "count"); i++)
    {
        var token = objj_msgSend(tokens, "objectAtIndex:", i),
            dateComponent = objj_msgSend(dateComponents, "objectAtIndex:", i),
            character = objj_msgSend(token, "characterAtIndex:", 0),
            length = objj_msgSend(token, "length");
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
                if (!objj_msgSend(objj_msgSend(self, "shortQuarterSymbols"), "containsObject:", dateComponent))
                    return nil;
                month = objj_msgSend(objj_msgSend(self, "shortQuarterSymbols"), "indexOfObject:", dateComponent) * 3;
            }
            if (length >= 4)
            {
                if (!objj_msgSend(objj_msgSend(self, "quarterSymbols"), "containsObject:", dateComponent))
                    return nil;
                month = objj_msgSend(objj_msgSend(self, "quarterSymbols"), "indexOfObject:", dateComponent) * 3;
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
                if (!objj_msgSend(objj_msgSend(self, "shortQuarterSymbols"), "containsObject:", dateComponent))
                    return nil;
                month = objj_msgSend(objj_msgSend(self, "shortQuarterSymbols"), "indexOfObject:", dateComponent) * 3;
            }
            if (length >= 4)
            {
                if (!objj_msgSend(objj_msgSend(self, "quarterSymbols"), "containsObject:", dateComponent))
                    return nil;
                month = objj_msgSend(objj_msgSend(self, "quarterSymbols"), "indexOfObject:", dateComponent) * 3;
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
                if (!objj_msgSend(objj_msgSend(self, "shortMonthSymbols"), "containsObject:", dateComponent))
                    return nil;
                month = objj_msgSend(objj_msgSend(self, "shortMonthSymbols"), "indexOfObject:", dateComponent) + 1;
            }
            if (length == 4)
            {
                if (!objj_msgSend(objj_msgSend(self, "monthSymbols"), "containsObject:", dateComponent))
                    return nil;
                month = objj_msgSend(objj_msgSend(self, "monthSymbols"), "indexOfObject:", dateComponent) + 1;
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
                if (!objj_msgSend(objj_msgSend(self, "shortStandaloneMonthSymbols"), "containsObject:", dateComponent))
                    return nil;
                month = objj_msgSend(objj_msgSend(self, "shortStandaloneMonthSymbols"), "indexOfObject:", dateComponent) + 1;
            }
            if (length == 4)
            {
                if (!objj_msgSend(objj_msgSend(self, "standaloneMonthSymbols"), "containsObject:", dateComponent))
                    return nil;
                month = objj_msgSend(objj_msgSend(self, "standaloneMonthSymbols"), "indexOfObject:", dateComponent) + 1;
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
                dayIndexInWeek = objj_msgSend(objj_msgSend(self, "shortWeekdaySymbols"), "indexOfObject:", dateComponent);
            if (length == 4)
                dayIndexInWeek = objj_msgSend(objj_msgSend(self, "weekdaySymbols"), "indexOfObject:", dateComponent);
            if (dayIndexInWeek == CPNotFound || length >= 5)
                return nil;
            break;
        case "e":
            if (length <= 2 && isNaN(parseInt(dateComponent)))
                return nil;
            if (length <= 2)
                dayIndexInWeek = parseInt(dateComponent);
            if (length == 3)
                dayIndexInWeek = objj_msgSend(objj_msgSend(self, "shortWeekdaySymbols"), "indexOfObject:", dateComponent);
            if (length == 4)
                dayIndexInWeek = objj_msgSend(objj_msgSend(self, "weekdaySymbols"), "indexOfObject:", dateComponent);
            if (dayIndexInWeek == CPNotFound || length >= 5)
                return nil;
            break;
        case "c":
            if (length <= 2 && isNaN(parseInt(dateComponent)))
                return nil;
            if (length <= 2)
                dayIndexInWeek = dateComponent;
            if (length == 3)
                dayIndexInWeek = objj_msgSend(objj_msgSend(self, "shortStandaloneWeekdaySymbols"), "indexOfObject:", dateComponent);
            if (length == 4)
                dayIndexInWeek = objj_msgSend(objj_msgSend(self, "standaloneWeekdaySymbols"), "indexOfObject:", dateComponent);
            if (length == 5)
                dayIndexInWeek = objj_msgSend(objj_msgSend(self, "veryShortStandaloneWeekdaySymbols"), "indexOfObject:", dateComponent);
            if (dayIndexInWeek == CPNotFound || length >= 5)
                return nil;
            break;
        case "a":
            if (!objj_msgSend(dateComponent, "isEqualToString:", objj_msgSend(self, "PMSymbol")) && !objj_msgSend(dateComponent, "isEqualToString:", objj_msgSend(self, "AMSymbol")))
                return nil;
            if (objj_msgSend(dateComponent, "isEqualToString:", objj_msgSend(self, "PMSymbol")))
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
                timeZoneseconds = objj_msgSend(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleShortDaylightSaving);
            else
                timeZoneseconds = objj_msgSend(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleDaylightSaving);
            if (!timeZoneseconds)
                timeZoneseconds = objj_msgSend(self, "_secondsFromTimeZoneDefaultFormatString:", dateComponent);
            if (!timeZoneseconds)
                return nil;
            timeZoneseconds = timeZoneseconds + 60 * 60;
            break;
        case "Z":
            timeZoneseconds = objj_msgSend(self, "_secondsFromTimeZoneDefaultFormatString:", dateComponent);
            if (!timeZoneseconds)
                return nil;
            timeZoneseconds = timeZoneseconds + 60 * 60;
            break;
        case "v":
            if (length <= 3)
                timeZoneseconds = objj_msgSend(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleShortGeneric);
            else
                timeZoneseconds = objj_msgSend(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleGeneric);
            if (!timeZoneseconds && length == 4)
                timeZoneseconds = objj_msgSend(self, "_secondsFromTimeZoneDefaultFormatString:", dateComponent);
            if (!timeZoneseconds)
                return nil;
            timeZoneseconds = timeZoneseconds + 60 * 60;
            break;
        case "V":
            if (length <= 3)
                timeZoneseconds = objj_msgSend(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleShortStandard);
            else
                timeZoneseconds = objj_msgSend(self, "_secondsFromTimeZoneString:style:", dateComponent, CPTimeZoneNameStyleStandard);
            if (!timeZoneseconds)
                timeZoneseconds = objj_msgSend(self, "_secondsFromTimeZoneDefaultFormatString:", dateComponent);
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
    if (dateArray[2] <= 0 || dateArray[2] > objj_msgSend(tmpDate, "_daysInMonth"))
        return nil;
    if (isPM)
        dateArray[3] += 12;
    if (isNaN(parseInt(dateArray[0])) || isNaN(parseInt(dateArray[1])) || isNaN(parseInt(dateArray[2])) || isNaN(parseInt(dateArray[3])) || isNaN(parseInt(dateArray[4])) || isNaN(parseInt(dateArray[5])) || isNaN(parseInt(dateArray[6])))
        return nil;
    var dateResult = objj_msgSend(objj_msgSend(CPDate, "alloc"), "initWithString:", objj_msgSend(CPString, "stringWithFormat:", "%04d-%02d-%02d %02d:%02d:%02d %s", dateArray[0], dateArray[1], dateArray[2], dateArray[3], dateArray[4], dateArray[5], dateArray[6]));
    dateResult.setSeconds(dateResult.getSeconds() - timeZoneseconds + 60 * 60);
    return dateResult;
}
,["CPDate","CPArray","CPArray"]), new objj_method(sel_getUid("_stringValueForValue:length:"), function $CPDateFormatter___stringValueForValue_length_(self, _cmd, aValue, length)
{
    var string = objj_msgSend(CPString, "stringWithFormat:", "%i", aValue);
    if (objj_msgSend(string, "length") == length)
        return string;
    if (objj_msgSend(string, "length") > length)
        return objj_msgSend(string, "substringFromIndex:", objj_msgSend(string, "length") - length);
    while (objj_msgSend(string, "length") < length)
        string = objj_msgSend(CPString, "stringWithFormat:", "0%s", string);
    return string;
}
,["CPString","id","int"]), new objj_method(sel_getUid("_isAmericanFormat"), function $CPDateFormatter___isAmericanFormat(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._locale, "objectForKey:", CPLocaleCountryCode), "isEqualToString:", "US");
}
,["BOOL"]), new objj_method(sel_getUid("_isEnglishFormat"), function $CPDateFormatter___isEnglishFormat(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._locale, "objectForKey:", CPLocaleLanguageCode), "isEqualToString:", "en");
}
,["BOOL"]), new objj_method(sel_getUid("_secondsFromTimeZoneDefaultFormatString:"), function $CPDateFormatter___secondsFromTimeZoneDefaultFormatString_(self, _cmd, aTimeZoneFormatString)
{
    var format = /\w*([HPG-GMT])?([+-])(\d{1,2})([:])?(\d{2})\w*/,
        result = aTimeZoneFormatString.match(new RegExp(format)),
        seconds = 0;
    if (!result)
        return nil;
    seconds = result[3] * 60 * 60 + result[5] * 60;
    if (objj_msgSend(result[2], "isEqualToString:", "-"))
        seconds = -seconds;
    return seconds;
}
,["int","CPString"]), new objj_method(sel_getUid("_secondsFromTimeZoneString:style:"), function $CPDateFormatter___secondsFromTimeZoneString_style_(self, _cmd, aTimeZoneString, aStyle)
{
    var timeZone = objj_msgSend(CPTimeZone, "_timeZoneFromString:style:locale:", aTimeZoneString, aStyle, self._locale);
    if (!timeZone)
        return nil;
    return objj_msgSend(timeZone, "secondsFromGMT");
}
,["int","CPString","NSTimeZoneNameStyle"]), new objj_method(sel_getUid("_lastIndexMatchedString:token:index:"), function $CPDateFormatter___lastIndexMatchedString_token_index_(self, _cmd, aString, aToken, anIndex)
{
    var character = objj_msgSend(aToken, "characterAtIndex:", 0),
        length = objj_msgSend(aToken, "length"),
        targetedArray,
        format = /\w*([HPG-GMT])?([+-])(\d{1,2})([:])?(\d{2})\w*/,
        result = aString.match(new RegExp(format));
    switch(character) {
    case "Q":
        if (length == 3)
            targetedArray = objj_msgSend(self, "shortQuarterSymbols");
        if (length >= 4)
            targetedArray = objj_msgSend(self, "quarterSymbols");
        break;
    case "q":
        if (length == 3)
            targetedArray = objj_msgSend(self, "shortStandaloneQuarterSymbols");
        if (length >= 4)
            targetedArray = objj_msgSend(self, "standaloneQuarterSymbols");
        break;
    case "M":
        if (length == 3)
            targetedArray = objj_msgSend(self, "shortMonthSymbols");
        if (length == 4)
            targetedArray = objj_msgSend(self, "monthSymbols");
        if (length >= 5)
            targetedArray = objj_msgSend(self, "veryShortMonthSymbols");
        break;
    case "L":
        if (length == 3)
            targetedArray = objj_msgSend(self, "shortStandaloneMonthSymbols");
        if (length == 4)
            targetedArray = objj_msgSend(self, "standaloneMonthSymbols");
        if (length >= 5)
            targetedArray = objj_msgSend(self, "veryShortStandaloneMonthSymbols");
        break;
    case "E":
        if (length <= 3)
            targetedArray = objj_msgSend(self, "shortWeekdaySymbols");
        if (length == 4)
            targetedArray = objj_msgSend(self, "weekdaySymbols");
        if (length >= 5)
            targetedArray = objj_msgSend(self, "veryShortWeekdaySymbols");
        break;
    case "e":
        if (length == 3)
            targetedArray = objj_msgSend(self, "shortWeekdaySymbols");
        if (length == 4)
            targetedArray = objj_msgSend(self, "weekdaySymbols");
        if (length >= 5)
            targetedArray = objj_msgSend(self, "veryShortWeekdaySymbols");
        break;
    case "c":
        if (length == 3)
            targetedArray = objj_msgSend(self, "shortStandaloneWeekdaySymbols");
        if (length == 4)
            targetedArray = objj_msgSend(self, "standaloneWeekdaySymbols");
        if (length >= 5)
            targetedArray = objj_msgSend(self, "veryShortStandaloneWeekdaySymbols");
        break;
    case "a":
        targetedArray = [objj_msgSend(self, "PMSymbol"), objj_msgSend(self, "AMSymbol")];
        break;
    case "z":
        if (length <= 3)
            targetedArray = objj_msgSend(CPTimeZone, "_namesForStyle:locale:", CPTimeZoneNameStyleShortDaylightSaving, self._locale);
        else
            targetedArray = objj_msgSend(CPTimeZone, "_namesForStyle:locale:", CPTimeZoneNameStyleDaylightSaving, self._locale);
        if (result)
            return anIndex + objj_msgSend(result, "objectAtIndex:", 0).length;
        break;
    case "Z":
        if (result)
            return anIndex + objj_msgSend(result, "objectAtIndex:", 0).length;
        return CPNotFound;
    case "v":
        if (length == 1)
            targetedArray = objj_msgSend(CPTimeZone, "_namesForStyle:locale:", CPTimeZoneNameStyleShortGeneric, self._locale);
        else if (length == 4)
            targetedArray = objj_msgSend(CPTimeZone, "_namesForStyle:locale:", CPTimeZoneNameStyleGeneric, self._locale);
        if (result)
            return anIndex + objj_msgSend(result, "objectAtIndex:", 0).length;
        break;
    case "V":
        if (length == 1)
            targetedArray = objj_msgSend(CPTimeZone, "_namesForStyle:locale:", CPTimeZoneNameStyleShortStandard, self._locale);
        if (result)
            return anIndex + objj_msgSend(result, "objectAtIndex:", 0).length;
        break;
default:
        CPLog.warn("No pattern found for " + aToken);
        return CPNotFound;
    }
    for (var i = 0; i < objj_msgSend(targetedArray, "count"); i++)
    {
        var currentObject = objj_msgSend(targetedArray, "objectAtIndex:", i),
            range = objj_msgSend(aString, "rangeOfString:", currentObject);
        if (range.length == 0)
            continue;
        character = objj_msgSend(aString, "characterAtIndex:", anIndex + range.length);
        if (objj_msgSend(character, "isEqualToString:", "'") || objj_msgSend(character, "isEqualToString:", ",") || objj_msgSend(character, "isEqualToString:", ":") || objj_msgSend(character, "isEqualToString:", "/") || objj_msgSend(character, "isEqualToString:", "-") || objj_msgSend(character, "isEqualToString:", " ") || objj_msgSend(character, "isEqualToString:", ""))
            return anIndex + range.length;
    }
    return CPNotFound;
}
,["int","CPString","CPString",null])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPDateFormatter__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPDateFormatter, "class"))
        return;
    relativeDateFormating = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", ["demain", 1440, "apr" + String.fromCharCode(233) + "s-demain", 2880, "apr" + String.fromCharCode(233) + "s-apr" + String.fromCharCode(233) + "s-demain", 4320, "hier", -1440, "avant-hier", -2880, "avant-avant-hier", -4320], "fr", ["tomorrow", 1440, "yesterday", -1440], "en", [], "de", [], "es");
    patternStringTokens = ["QQQ", "qqq", "QQQQ", "qqqq", "MMM", "MMMM", "LLL", "LLLL", "E", "EE", "EEE", "eee", "eeee", "eeeee", "a", "z", "zz", "zzz", "zzzz", "Z", "ZZ", "ZZZ", "ZZZZ", "ZZZZZ", "v", "vv", "vvv", "vvvv", "V", "VV", "VVV", "VVVV"];
}
,["void"]), new objj_method(sel_getUid("localizedStringFromDate:dateStyle:timeStyle:"), function $CPDateFormatter__localizedStringFromDate_dateStyle_timeStyle_(self, _cmd, date, dateStyle, timeStyle)
{
    var formatter = objj_msgSend(objj_msgSend(CPDateFormatter, "alloc"), "init");
    objj_msgSend(formatter, "setFormatterBehavior:", CPDateFormatterBehavior10_4);
    objj_msgSend(formatter, "setDateStyle:", dateStyle);
    objj_msgSend(formatter, "setTimeStyle:", timeStyle);
    return objj_msgSend(formatter, "stringForObjectValue:", date);
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
        self._allowNaturalLanguage = objj_msgSend(aCoder, "decodeBoolForKey:", CPDateFormatterAllowNaturalLanguageKey);
        self._dateFormat = objj_msgSend(aCoder, "decodeObjectForKey:", CPDateFormatterDateFormatKey);
        self._dateStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPDateFormatterDateStyleKey);
        self._doesRelativeDateFormatting = objj_msgSend(aCoder, "decodeBoolForKey:", CPDateFormatterDoseRelativeDateFormattingKey);
        self._formatterBehavior = objj_msgSend(aCoder, "decodeIntForKey:", CPDateFormatterFormatterBehaviorKey);
        self._locale = objj_msgSend(aCoder, "decodeObjectForKey:", CPDateFormatterLocaleKey);
        self._timeStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPDateFormatterTimeStyleKey);
    }
    objj_msgSend(self, "_init");
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPDateFormatter__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDateFormatter").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowNaturalLanguage, CPDateFormatterAllowNaturalLanguageKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._dateStyle, CPDateFormatterDateStyleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._dateFormat, CPDateFormatterDateFormatKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._doesRelativeDateFormatting, CPDateFormatterDoseRelativeDateFormattingKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._formatterBehavior, CPDateFormatterFormatterBehaviorKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._locale, CPDateFormatterLocaleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._timeStyle, CPDateFormatterTimeStyleKey);
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPDate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_dateWithTimeZone:"), function $CPDate___dateWithTimeZone_(self, _cmd, aTimeZone)
{
    self.setSeconds(self.getSeconds() - objj_msgSend(aTimeZone, "secondsFromGMTForDate:", self));
    self.setSeconds(self.getSeconds() + objj_msgSend(aTimeZone, "secondsFromGMT"));
}
,["void","CPTimeZone"])]);
}