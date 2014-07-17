@STATIC;1.0;i;10;CPObject.ji;10;CPString.ji;8;CPDate.ji;10;CPLocale.jt;21793;objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPDate.j", YES);objj_executeFile("CPLocale.j", YES);CPTimeZoneNameStyleStandard = 0;
CPTimeZoneNameStyleShortStandard = 1;
CPTimeZoneNameStyleDaylightSaving = 2;
CPTimeZoneNameStyleShortDaylightSaving = 3;
CPTimeZoneNameStyleGeneric = 4;
CPTimeZoneNameStyleShortGeneric = 5;
CPSystemTimeZoneDidChangeNotification = "CPSystemTimeZoneDidChangeNotification";
var abbreviationDictionary,
    timeDifferenceFromUTC,
    knownTimeZoneNames,
    defaultTimeZone,
    localTimeZone,
    systemTimeZone,
    timeZoneDataVersion,
    localizedName;
{var the_class = objj_allocateClassPair(CPObject, "CPTimeZone"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_data"), new objj_ivar("_secondsFromGMT"), new objj_ivar("_abbreviation"), new objj_ivar("_name")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("data"), function $CPTimeZone__data(self, _cmd)
{
    return self._data;
}
,["CPData"]), new objj_method(sel_getUid("secondFromGMT"), function $CPTimeZone__secondFromGMT(self, _cmd)
{
    return self._secondsFromGMT;
}
,["CPInteger"]), new objj_method(sel_getUid("abbreviation"), function $CPTimeZone__abbreviation(self, _cmd)
{
    return self._abbreviation;
}
,["CPString"]), new objj_method(sel_getUid("name"), function $CPTimeZone__name(self, _cmd)
{
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("_initWithName:abbreviation:"), function $CPTimeZone___initWithName_abbreviation_(self, _cmd, tzName, abbreviation)
{
    if (!tzName)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid value provided for tzName");
    if (!(knownTimeZoneNames == null ? null : knownTimeZoneNames.isa.objj_msgSend1(knownTimeZoneNames, "containsObject:", tzName)) || !abbreviation)
        return nil;
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTimeZone").super_class }, "init"))
    {
        self._name = tzName;
        self._abbreviation = abbreviation;
    }
    return self;
}
,["id","CPString","CPString"]), new objj_method(sel_getUid("initWithName:"), function $CPTimeZone__initWithName_(self, _cmd, tzName)
{
    if (!tzName)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid value provided for tzName");
    if (!(knownTimeZoneNames == null ? null : knownTimeZoneNames.isa.objj_msgSend1(knownTimeZoneNames, "containsObject:", tzName)))
        return nil;
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTimeZone").super_class }, "init"))
    {
        self._name = tzName;
        var keys = (abbreviationDictionary == null ? null : abbreviationDictionary.isa.objj_msgSend0(abbreviationDictionary, "keyEnumerator")),
            key;
        while (key = (keys == null ? null : keys.isa.objj_msgSend0(keys, "nextObject")))
        {
            var value = (abbreviationDictionary == null ? null : abbreviationDictionary.isa.objj_msgSend1(abbreviationDictionary, "valueForKey:", key));
            if ((value == null ? null : value.isa.objj_msgSend1(value, "isEqualToString:", self._name)))
            {
                self._abbreviation = key;
                break;
            }
        }
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("initWithName:data:"), function $CPTimeZone__initWithName_data_(self, _cmd, tzName, data)
{
    if (self = (self == null ? null : self.isa.objj_msgSend1(self, "initWithName:", tzName)))
    {
        self._data = data;
    }
    return self;
}
,["id","CPString","CPData"]), new objj_method(sel_getUid("abbreviationForDate:"), function $CPTimeZone__abbreviationForDate_(self, _cmd, date)
{
    if (!date)
        return nil;
    return ((String(((String(date)).split("("))[1])).split(")"))[0];
}
,["CPString","CPDate"]), new objj_method(sel_getUid("secondsFromGMTForDate:"), function $CPTimeZone__secondsFromGMTForDate_(self, _cmd, date)
{
    if (!date)
        return nil;
    var abbreviation = ((String(((String(date)).split("("))[1])).split(")"))[0];
    return (timeDifferenceFromUTC == null ? null : timeDifferenceFromUTC.isa.objj_msgSend1(timeDifferenceFromUTC, "valueForKey:", abbreviation)) * 60;
}
,["CPInteger","CPDate"]), new objj_method(sel_getUid("secondsFromGMT"), function $CPTimeZone__secondsFromGMT(self, _cmd)
{
    return (timeDifferenceFromUTC == null ? null : timeDifferenceFromUTC.isa.objj_msgSend1(timeDifferenceFromUTC, "valueForKey:", self._abbreviation)) * 60;
}
,["CPInteger"]), new objj_method(sel_getUid("isEqualToTimeZone:"), function $CPTimeZone__isEqualToTimeZone_(self, _cmd, aTimeZone)
{
    return ((___r1 = (aTimeZone == null ? null : aTimeZone.isa.objj_msgSend0(aTimeZone, "name"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToString:", self._name)) && (aTimeZone == null ? null : aTimeZone.isa.objj_msgSend0(aTimeZone, "data")) == self._data;
    var ___r1;
}
,["BOOL","CPTimeZone"]), new objj_method(sel_getUid("description"), function $CPTimeZone__description(self, _cmd)
{
    return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "%s (%s) offset %i", self._name, self._abbreviation, self.isa.objj_msgSend0(self, "secondsFromGMT"));
}
,["CPString"]), new objj_method(sel_getUid("localizedName:locale:"), function $CPTimeZone__localizedName_locale_(self, _cmd, style, locale)
{
    if (style > 5)
        return nil;
    return ((___r1 = ((___r2 = (localizedName == null ? null : localizedName.isa.objj_msgSend1(localizedName, "valueForKey:", (locale == null ? null : locale.isa.objj_msgSend1(locale, "objectForKey:", CPLocaleLanguageCode))))), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", self._abbreviation))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", style));
    var ___r1, ___r2;
}
,["CPString","NSTimeZoneNameStyle","CPLocale"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPTimeZone__initialize(self, _cmd)
{
    if (self !== CPTimeZone.isa.objj_msgSend0(CPTimeZone, "class"))
        return;
    knownTimeZoneNames = ["America/Halifax", "America/Juneau", "America/Juneau", "America/Argentina/Buenos_Aires", "America/Halifax", "Asia/Dhaka", "America/Sao_Paulo", "America/Sao_Paulo", "Europe/London", "Africa/Harare", "America/Chicago", "Europe/Paris", "Europe/Paris", "America/Santiago", "America/Santiago", "America/Bogota", "America/Chicago", "Africa/Addis_Ababa", "America/New_York", "Europe/Istanbul", "Europe/Istanbul", "America/New_York", "GMT", "Asia/Dubai", "Asia/Hong_Kong", "Pacific/Honolulu", "Asia/Bangkok", "Asia/Tehran", "Asia/Calcutta", "Asia/Tokyo", "Asia/Seoul", "America/Denver", "Europe/Moscow", "Europe/Moscow", "America/Denver", "Pacific/Auckland", "Pacific/Auckland", "America/Los_Angeles", "America/Lima", "Asia/Manila", "Asia/Karachi", "America/Los_Angeles", "Asia/Singapore", "UTC", "Africa/Lagos", "Europe/Lisbon", "Europe/Lisbon", "Asia/Jakarta"];
    abbreviationDictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", "America/Halifax", "ADT", "America/Juneau", "AKDT", "America/Juneau", "AKST", "America/Argentina/Buenos_Aires", "ART", "America/Halifax", "AST", "Asia/Dhaka", "BDT", "America/Sao_Paulo", "BRST", "America/Sao_Paulo", "BRT", "Europe/London", "BST", "Africa/Harare", "CAT", "America/Chicago", "CDT", "Europe/Paris", "CEST", "Europe/Paris", "CET", "America/Santiago", "CLST", "America/Santiago", "CLT", "America/Bogota", "COT", "America/Chicago", "CST", "Africa/Addis_Ababa", "EAT", "America/New_York", "EDT", "Europe/Istanbul", "EEST", "Europe/Istanbul", "EET", "America/New_York", "EST", "GMT", "GMT", "Asia/Dubai", "GST", "Asia/Hong_Kong", "HKT", "Pacific/Honolulu", "HST", "Asia/Bangkok", "ICT", "Asia/Tehran", "IRST", "Asia/Calcutta", "IST", "Asia/Tokyo", "JST", "Asia/Seoul", "KST", "America/Denver", "MDT", "Europe/Moscow", "MSD", "Europe/Moscow", "MSK", "America/Denver", "MST", "Pacific/Auckland", "NZDT", "Pacific/Auckland", "NZST", "America/Los_Angeles", "PDT", "America/Lima", "PET", "Asia/Manila", "PHT", "Asia/Karachi", "PKT", "America/Los_Angeles", "PST", "Asia/Singapore", "SGT", "UTC", "UTC", "Africa/Lagos", "WAT", "Europe/Lisbon", "WEST", "Europe/Lisbon", "WET", "Asia/Jakarta", "WIT");
    timeDifferenceFromUTC = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", -180, "ADT", -480, "AKDT", -540, "AKST", -180, "ART", -240, "AST", 360, "BDT", -120, "BRST", -180, "BRT", 60, "BST", 120, "CAT", -300, "CDT", 120, "CEST", 60, "CET", -180, "CLST", -240, "CLT", -300, "COT", -360, "CST", 180, "EAT", -240, "EDT", 180, "EEST", 120, "EET", -300, "EST", 0, "GMT", 240, "GST", 480, "HKT", -600, "HST", 420, "ICT", 210, "IRST", 330, "IST", 540, "JST", 540, "KST", -300, "MDT", 240, "MSD", 240, "MSK", -420, "MST", 900, "NZDT", 900, "NZST", -420, "PDT", -300, "PET", 480, "PHT", 300, "PKT", -480, "PST", 480, "SGT", 0, "UTC", -540, "WAT", 60, "WEST", 0, "WET", 540, "WIT");
    var englishLocalizedName = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", ["Eastern Standard Time", "EST", "Eastern Daylight Time", "EDT", "Eastern Time", "ET"], "EDT", ["GMT", "GMT", "GMT", "GMT", "GMT", "GMT"], "GMT", ["Atlantic Standard Time", "AST", "Atlantic Daylight Time", "ADT", "Atlantic Time", "AT"], "AST", ["Iran Standard Time", "GMT+03:30", "Iran Daylight Time", "GMT+03:30", "Iran Time", "Iran Time"], "IRST", ["Indochina Time", "GMT+07:00", "GMT+07:00", "GMT+07:00", "Indochina Time", "Thailand Time"], "ICT", ["Peru Standard Time", "GMT-05:00", "Peru Summer Time", "GMT-05:00", "Peru Standard Time", "Peru Time"], "PET", ["Korean Standard Time", "GMT+09:00", "Korean Daylight Time", "GMT+09:00", "Korean Standard Time", "South Korea Time"], "KST", ["Pacific Standard Time", "PST", "Pacific Daylight Time", "PDT", "Pacific Time", "PT"], "PST", ["Central Standard Time", "CST", "Central Daylight Time", "CDT", "Central Time", "CT"], "CDT", ["Eastern European Standard Time", "GMT+02:00", "Eastern European Summer Time", "GMT+03:00", "Eastern European Time", "Turkey Time"], "EEST", ["New Zealand Standard Time", "GMT+12:00", "New Zealand Daylight Time", "GMT+13:00", "New Zealand Time", "New Zealand Time (Auckland)"], "NZDT", ["Western European Standard Time", "GMT", "Western European Summer Time", "GMT+01:00", "Western European Time", "Portugal Time (Lisbon)"], "WEST", ["East Africa Time", "GMT+03:00", "GMT+03:00", "GMT+03:00", "East Africa Time", "Ethiopia Time"], "EAT", ["Hong Kong Standard Time", "GMT+08:00", "Hong Kong Summer Time", "GMT+08:00", "Hong Kong Standard Time", "Hong Kong SAR China Time"], "HKT", ["India Standard Time", "GMT+05:30", "GMT+05:30", "GMT+05:30", "India Standard Time", "India Time"], "IST", ["Mountain Standard Time", "MST", "Mountain Daylight Time", "MDT", "Mountain Time", "MT"], "MDT", ["New Zealand Standard Time", "GMT+12:00", "New Zealand Daylight Time", "GMT+13:00", "New Zealand Time", "New Zealand Time (Auckland)"], "NZST", ["Western Indonesia Time", "GMT+07:00", "GMT+07:00", "GMT+07:00", "Western Indonesia Time", "Indonesia Time (Jakarta)"], "WIT", ["Atlantic Standard Time", "AST", "Atlantic Daylight Time", "ADT", "Atlantic Time", "AT"], "ADT", ["Greenwich Mean Time", "GMT", "British Summer Time", "GMT+01:00", "United Kingdom Time", "United Kingdom Time"], "BST", ["Argentina Standard Time", "GMT-03:00", "Argentina Summer Time", "GMT-03:00", "Argentina Standard Time", "Argentina Time (Buenos Aires)"], "ART", ["Central Africa Time", "GMT+02:00", "GMT+02:00", "GMT+02:00", "Central Africa Time", "Zimbabwe Time"], "CAT", ["Gulf Standard Time", "GMT+04:00", "GMT+04:00", "GMT+04:00", "Gulf Standard Time", "United Arab Emirates Time"], "GST", ["Pacific Standard Time", "PST", "Pacific Daylight Time", "PDT", "Pacific Time", "PT"], "PDT", ["Singapore Standard Time", "GMT+08:00", "GMT+08:00", "GMT+08:00", "Singapore Standard Time", "Singapore Time"], "SGT", ["Colombia Standard Time", "GMT-05:00", "Colombia Summer Time", "GMT-05:00", "Colombia Standard Time", "Colombia Time"], "COT", ["Pakistan Standard Time", "GMT+05:00", "Pakistan Summer Time", "GMT+05:00", "Pakistan Standard Time", "Pakistan Time"], "PKT", ["Eastern European Standard Time", "GMT+02:00", "Eastern European Summer Time", "GMT+03:00", "Eastern European Time", "Turkey Time"], "EET", ["GMT", "GMT", "GMT", "GMT", "GMT", "GMT"], "UTC", ["West Africa Standard Time", "GMT+01:00", "West Africa Summer Time", "GMT+01:00", "West Africa Standard Time", "Nigeria Time"], "WAT", ["Eastern Standard Time", "EST", "Eastern Daylight Time", "EDT", "Eastern Time", "ET"], "EST", ["Japan Standard Time", "GMT+09:00", "Japan Daylight Time", "GMT+09:00", "Japan Standard Time", "Japan Time"], "JST", ["Chile Standard Time", "GMT-04:00", "Chile Summer Time", "GMT-04:00", "Chile Time", "Chile Time (Santiago)"], "CLST", ["Central European Standard Time", "GMT+01:00", "Central European Summer Time", "GMT+02:00", "Central European Time", "France Time"], "CET", ["Bangladesh Standard Time", "GMT+06:00", "Bangladesh Summer Time", "GMT+06:00", "Bangladesh Standard Time", "Bangladesh Time"], "BDT", ["Moscow Standard Time", "GMT+04:00", "Moscow Summer Time", "GMT+04:00", "Moscow Standard Time", "Russia Time (Moscow)"], "MSK", ["Alaska Standard Time", "AKST", "Alaska Daylight Time", "AKDT", "Alaska Time", "AKT"], "AKDT", ["Chile Standard Time", "GMT-04:00", "Chile Summer Time", "GMT-04:00", "Chile Time", "Chile Time (Santiago)"], "CLT", ["Alaska Standard Time", "AKST", "Alaska Daylight Time", "AKDT", "Alaska Time", "AKT"], "AKST", ["Brasilia Standard Time", "GMT-03:00", "Brasilia Summer Time", "GMT-03:00", "Brasilia Time", "Brazil Time (Sao Paulo)"], "BRST", ["Brasilia Standard Time", "GMT-03:00", "Brasilia Summer Time", "GMT-03:00", "Brasilia Time", "Brazil Time (Sao Paulo)"], "BRT", ["Central European Standard Time", "GMT+01:00", "Central European Summer Time", "GMT+02:00", "Central European Time", "France Time"], "CEST", ["Central Standard Time", "CST", "Central Daylight Time", "CDT", "Central Time", "CT"], "CST", ["Hawaii-Aleutian Standard Time", "HST", "Hawaii-Aleutian Daylight Time", "HDT", "Hawaii-Aleutian Standard Time", "HST"], "HST", ["Moscow Standard Time", "GMT+04:00", "Moscow Summer Time", "GMT+04:00", "Moscow Standard Time", "Russia Time (Moscow)"], "MSD", ["Mountain Standard Time", "MST", "Mountain Daylight Time", "MDT", "Mountain Time", "MT"], "MST", ["Philippine Standard Time", "GMT+08:00", "Philippine Summer Time", "GMT+08:00", "Philippine Standard Time", "Philippines Time"], "PHT", ["Western European Standard Time", "GMT", "Western European Summer Time", "GMT+01:00", "Western European Time", "Portugal Time (Lisbon)"], "WET");
    var date = CPDate.isa.objj_msgSend0(CPDate, "date"),
        abbreviation = ((String(((String(date)).split("("))[1])).split(")"))[0];
    localTimeZone = self.isa.objj_msgSend1(self, "timeZoneWithAbbreviation:", abbreviation);
    systemTimeZone = self.isa.objj_msgSend1(self, "timeZoneWithAbbreviation:", abbreviation);
    defaultTimeZone = self.isa.objj_msgSend1(self, "timeZoneWithAbbreviation:", abbreviation);
    localizedName = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", englishLocalizedName, "en", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"), "fr", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"), "de", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"), "es");
    timeZoneDataVersion = nil;
}
,["void"]), new objj_method(sel_getUid("timeZoneWithAbbreviation:"), function $CPTimeZone__timeZoneWithAbbreviation_(self, _cmd, abbreviation)
{
    if (!(abbreviationDictionary == null ? null : abbreviationDictionary.isa.objj_msgSend1(abbreviationDictionary, "containsKey:", abbreviation)))
        return nil;
    return ((___r1 = CPTimeZone.isa.objj_msgSend0(CPTimeZone, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_initWithName:abbreviation:", (abbreviationDictionary == null ? null : abbreviationDictionary.isa.objj_msgSend1(abbreviationDictionary, "valueForKey:", abbreviation)), abbreviation));
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("timeZoneWithName:"), function $CPTimeZone__timeZoneWithName_(self, _cmd, tzName)
{
    return ((___r1 = CPTimeZone.isa.objj_msgSend0(CPTimeZone, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithName:", tzName));
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("timeZoneWithName:data:"), function $CPTimeZone__timeZoneWithName_data_(self, _cmd, tzName, data)
{
    return ((___r1 = CPTimeZone.isa.objj_msgSend0(CPTimeZone, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithName:data:", tzName, data));
    var ___r1;
}
,["id","CPString","CPData"]), new objj_method(sel_getUid("timeZoneForSecondsFromGMT:"), function $CPTimeZone__timeZoneForSecondsFromGMT_(self, _cmd, seconds)
{
    var minutes = seconds / 60,
        keys = (timeDifferenceFromUTC == null ? null : timeDifferenceFromUTC.isa.objj_msgSend0(timeDifferenceFromUTC, "keyEnumerator")),
        key,
        abbreviation = nil;
    while (key = (keys == null ? null : keys.isa.objj_msgSend0(keys, "nextObject")))
    {
        var value = (timeDifferenceFromUTC == null ? null : timeDifferenceFromUTC.isa.objj_msgSend1(timeDifferenceFromUTC, "valueForKey:", key));
        if (value == minutes)
        {
            abbreviation = key;
            break;
        }
    }
    if (!abbreviation)
        return nil;
    return self.isa.objj_msgSend1(self, "timeZoneWithAbbreviation:", abbreviation);
}
,["id","CPInteger"]), new objj_method(sel_getUid("_timeZoneFromString:style:locale:"), function $CPTimeZone___timeZoneFromString_style_locale_(self, _cmd, aTimeZoneString, style, _locale)
{
    if ((abbreviationDictionary == null ? null : abbreviationDictionary.isa.objj_msgSend1(abbreviationDictionary, "containsKey:", aTimeZoneString)))
        return self.isa.objj_msgSend1(self, "timeZoneWithAbbreviation:", aTimeZoneString);
    var dict = (localizedName == null ? null : localizedName.isa.objj_msgSend1(localizedName, "valueForKey:", (_locale == null ? null : _locale.isa.objj_msgSend1(_locale, "objectForKey:", CPLocaleLanguageCode)))),
        keys = (dict == null ? null : dict.isa.objj_msgSend0(dict, "keyEnumerator")),
        key;
    while (key = (keys == null ? null : keys.isa.objj_msgSend0(keys, "nextObject")))
    {
        var value = ((___r1 = (dict == null ? null : dict.isa.objj_msgSend1(dict, "valueForKey:", key))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", style));
        if ((value == null ? null : value.isa.objj_msgSend1(value, "isEqualToString:", aTimeZoneString)))
            return self.isa.objj_msgSend1(self, "timeZoneWithAbbreviation:", key);
    }
    return nil;
    var ___r1;
}
,["id","CPString","NSTimeZoneNameStyle","CPLocale"]), new objj_method(sel_getUid("_namesForStyle:locale:"), function $CPTimeZone___namesForStyle_locale_(self, _cmd, style, aLocale)
{
    var array = CPArray.isa.objj_msgSend0(CPArray, "array"),
        dict = (localizedName == null ? null : localizedName.isa.objj_msgSend1(localizedName, "valueForKey:", (aLocale == null ? null : aLocale.isa.objj_msgSend1(aLocale, "objectForKey:", CPLocaleLanguageCode)))),
        keys = (dict == null ? null : dict.isa.objj_msgSend0(dict, "keyEnumerator")),
        key;
    while (key = (keys == null ? null : keys.isa.objj_msgSend0(keys, "nextObject")))
        (array == null ? null : array.isa.objj_msgSend1(array, "addObject:", ((___r1 = (dict == null ? null : dict.isa.objj_msgSend1(dict, "valueForKey:", key))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", style))));
    return array;
    var ___r1;
}
,["CPArray","NSTimeZoneNameStyle","CPLocale"]), new objj_method(sel_getUid("timeZoneDataVersion"), function $CPTimeZone__timeZoneDataVersion(self, _cmd)
{
    return timeZoneDataVersion;
}
,["CPString"]), new objj_method(sel_getUid("localTimeZone"), function $CPTimeZone__localTimeZone(self, _cmd)
{
    return localTimeZone;
}
,["CPTimeZone"]), new objj_method(sel_getUid("defaultTimeZone"), function $CPTimeZone__defaultTimeZone(self, _cmd)
{
    return defaultTimeZone;
}
,["CPTimeZone"]), new objj_method(sel_getUid("setDefaultTimeZone:"), function $CPTimeZone__setDefaultTimeZone_(self, _cmd, aTimeZone)
{
    defaultTimeZone = aTimeZone;
}
,["void","CPTimeZone"]), new objj_method(sel_getUid("resetSystemTimeZone"), function $CPTimeZone__resetSystemTimeZone(self, _cmd)
{
    var date = CPDate.isa.objj_msgSend0(CPDate, "date"),
        abbreviation = ((String(((String(date)).split("("))[1])).split(")"))[0];
    systemTimeZone = self.isa.objj_msgSend1(self, "timeZoneWithAbbreviation:", abbreviation);
    ((___r1 = CPNotification.isa.objj_msgSend0(CPNotification, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPSystemTimeZoneDidChangeNotification, systemTimeZone));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("systemTimeZone"), function $CPTimeZone__systemTimeZone(self, _cmd)
{
    return systemTimeZone;
}
,["CPTimeZone"]), new objj_method(sel_getUid("abbreviationDictionary"), function $CPTimeZone__abbreviationDictionary(self, _cmd)
{
    return abbreviationDictionary;
}
,["CPDictionary"]), new objj_method(sel_getUid("setAbbreviationDictionary:"), function $CPTimeZone__setAbbreviationDictionary_(self, _cmd, dict)
{
    abbreviationDictionary = dict;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("knownTimeZoneNames"), function $CPTimeZone__knownTimeZoneNames(self, _cmd)
{
    return knownTimeZoneNames;
}
,["CPArray"])]);
}