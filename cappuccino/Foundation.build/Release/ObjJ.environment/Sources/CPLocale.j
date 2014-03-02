@STATIC;1.0;i;10;CPObject.jt;6805;objj_executeFile("CPObject.j", YES);CPLocaleIdentifier = "CPLocaleIdentifier";
CPLocaleLanguageCode = "CPLocaleLanguageCode";
CPLocaleCountryCode = "CPLocaleCountryCode";
CPLocaleScriptCode = "CPLocaleScriptCode";
CPLocaleVariantCode = "CPLocaleVariantCode";
CPLocaleExemplarCharacterSet = "CPLocaleExemplarCharacterSet";
CPLocaleCalendar = "CPLocaleCalendar";
CPLocaleCollationIdentifier = "CPLocaleCollationIdentifier";
CPLocaleUsesMetricSystem = "CPLocaleUsesMetricSystem";
CPLocaleMeasurementSystem = "CPLocaleMeasurementSystem";
CPLocaleDecimalSeparator = "CPLocaleDecimalSeparator";
CPLocaleGroupingSeparator = "CPLocaleGroupingSeparator";
CPLocaleCurrencySymbol = "CPLocaleCurrencySymbol";
CPLocaleCurrencyCode = "CPLocaleCurrencyCode";
CPLocaleCollatorIdentifier = "CPLocaleCollatorIdentifier";
CPLocaleQuotationBeginDelimiterKey = "CPLocaleQuotationBeginDelimiterKey";
CPLocaleQuotationEndDelimiterKey = "CPLocaleQuotationEndDelimiterKey";
CPLocaleAlternateQuotationBeginDelimiterKey = "CPLocaleAlternateQuotationBeginDelimiterKey";
CPLocaleAlternateQuotationEndDelimiterKey = "CPLocaleAlternateQuotationEndDelimiterKey";
CPGregorianCalendar = "CPGregorianCalendar";
CPBuddhistCalendar = "CPBuddhistCalendar";
CPChineseCalendar = "CPChineseCalendar";
CPHebrewCalendar = "CPHebrewCalendar";
CPIslamicCalendar = "CPIslamicCalendar";
CPIslamicCivilCalendar = "CPIslamicCivilCalendar";
CPJapaneseCalendar = "CPJapaneseCalendar";
CPRepublicOfChinaCalendar = "CPRepublicOfChinaCalendar";
CPPersianCalendar = "CPPersianCalendar";
CPIndianCalendar = "CPIndianCalendar";
CPISO8601Calendar = "CPISO8601Calendar";
CPLocaleLanguageDirectionUnknown = "CPLocaleLanguageDirectionUnknown";
CPLocaleLanguageDirectionLeftToRight = "CPLocaleLanguageDirectionLeftToRight";
CPLocaleLanguageDirectionRightToLeft = "CPLocaleLanguageDirectionRightToLeft";
CPLocaleLanguageDirectionTopToBottom = "CPLocaleLanguageDirectionTopToBottom";
CPLocaleLanguageDirectionBottomToTop = "CPLocaleLanguageDirectionBottomToTop";
var countryCodes = ["DE", "FR", "ES", "GB", "US"],
    languageCodes = ["en", "de", "es", "fr"],
    availableLocaleIdentifiers = ["de_DE", "en_GB", "en_US", "es_ES", "fr_FR"];
var sharedSystemLocale = nil,
    sharedCurrentLocale = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPLocale"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_locale")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithLocaleIdentifier:"), function $CPLocale__initWithLocaleIdentifier_(self, _cmd, anIdentifier)
{
    if (self == objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLocale").super_class }, "init"))
    {
        var parts = objj_msgSend(anIdentifier, "componentsSeparatedByString:", "_"),
            language = objj_msgSend(parts, "objectAtIndex:", 0),
            country = nil;
        if (objj_msgSend(parts, "count") > 1)
            country = objj_msgSend(parts, "objectAtIndex:", 1);
        else
            country = anIdentifier;
        self._locale = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        objj_msgSend(self._locale, "setObject:forKey:", anIdentifier, CPLocaleIdentifier);
        objj_msgSend(self._locale, "setObject:forKey:", language, CPLocaleLanguageCode);
        objj_msgSend(self._locale, "setObject:forKey:", country, CPLocaleCountryCode);
        if (objj_msgSend(objj_msgSend(self, "class"), "respondsToSelector:", sel_getUid("_platformLocaleAdditionalDescriptionForIdentifier:")))
        {
            var info = objj_msgSend(objj_msgSend(self, "class"), "performSelector:withObject:", sel_getUid("_platformLocaleAdditionalDescriptionForIdentifier:"), anIdentifier);
            objj_msgSend(self._locale, "addEntriesFromDictionary:", info);
        }
        else
        {
            objj_msgSend(self._locale, "setObject:forKey:", CPGregorianCalendar, CPLocaleCalendar);
        }
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("localeIdentifier"), function $CPLocale__localeIdentifier(self, _cmd)
{
    return objj_msgSend(self._locale, "objectForKey:", CPLocaleIdentifier);
}
,["CPString"]), new objj_method(sel_getUid("objectForKey:"), function $CPLocale__objectForKey_(self, _cmd, aKey)
{
    return objj_msgSend(self._locale, "objectForKey:", aKey);
}
,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("systemLocale"), function $CPLocale__systemLocale(self, _cmd)
{
    if (!sharedSystemLocale)
        sharedSystemLocale = objj_msgSend(objj_msgSend(CPLocale, "alloc"), "initWithLocaleIdentifier:", "en_US");
    return sharedSystemLocale;
}
,["id"]), new objj_method(sel_getUid("currentLocale"), function $CPLocale__currentLocale(self, _cmd)
{
    if (!sharedCurrentLocale)
    {
        var localeIdentifier = "en_US",
            language;
        if (typeof navigator !== "undefined")
        {
            language = typeof navigator.language !== "undefined" ? navigator.language : navigator.userLanguage;
            if (language)
            {
                language = (language.replace("-", "_")).substring(0, 5);
                language = (language.substring(0, 3)).toLowerCase() + (language.substring(3, 5)).toUpperCase();
                if (objj_msgSend(availableLocaleIdentifiers, "indexOfObject:", language) !== CPNotFound)
                    localeIdentifier = language;
            }
        }
        sharedCurrentLocale = objj_msgSend(objj_msgSend(CPLocale, "alloc"), "initWithLocaleIdentifier:", localeIdentifier);
    }
    return sharedCurrentLocale;
}
,["id"]), new objj_method(sel_getUid("availableLocaleIdentifiers"), function $CPLocale__availableLocaleIdentifiers(self, _cmd)
{
    return availableLocaleIdentifiers;
}
,["CPArray"]), new objj_method(sel_getUid("ISOCountryCodes"), function $CPLocale__ISOCountryCodes(self, _cmd)
{
    return countryCodes;
}
,["CPArray"]), new objj_method(sel_getUid("ISOLanguageCodes"), function $CPLocale__ISOLanguageCodes(self, _cmd)
{
    return languageCodes;
}
,["CPArray"])]);
}var CPLocaleIdentifierLocaleKey = "CPLocaleIdentifierLocaleKey";
{
var the_class = objj_getClass("CPLocale")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPLocale\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPLocale__initWithCoder_(self, _cmd, aCoder)
{
    if (self)
    {
        self._locale = objj_msgSend(aCoder, "decodeObjectForKey:", CPLocaleIdentifierLocaleKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPLocale__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._locale, CPLocaleIdentifierLocaleKey);
}
,["void","CPCoder"])]);
}