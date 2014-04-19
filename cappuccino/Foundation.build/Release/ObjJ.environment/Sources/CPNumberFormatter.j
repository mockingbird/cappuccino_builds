@STATIC;1.0;i;10;CPString.ji;13;CPFormatter.ji;17;CPDecimalNumber.jt;16080;objj_executeFile("CPString.j", YES);objj_executeFile("CPFormatter.j", YES);objj_executeFile("CPDecimalNumber.j", YES);CPNumberFormatterNoStyle = 0;
CPNumberFormatterDecimalStyle = 1;
CPNumberFormatterCurrencyStyle = 2;
CPNumberFormatterPercentStyle = 3;
CPNumberFormatterScientificStyle = 4;
CPNumberFormatterSpellOutStyle = 5;
CPNumberFormatterRoundCeiling = CPRoundUp;
CPNumberFormatterRoundFloor = CPRoundDown;
CPNumberFormatterRoundDown = CPRoundDown;
CPNumberFormatterRoundUp = CPRoundUp;
CPNumberFormatterRoundHalfEven = CPRoundBankers;
CPNumberFormatterRoundHalfDown = _CPRoundHalfDown;
CPNumberFormatterRoundHalfUp = CPRoundPlain;
var NumberRegex = new RegExp('(-)?(\\d*)(\\.(\\d*))?');
{var the_class = objj_allocateClassPair(CPFormatter, "CPNumberFormatter"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_numberStyle"), new objj_ivar("_perMillSymbol"), new objj_ivar("_groupingSeparator"), new objj_ivar("_roundingMode"), new objj_ivar("_minimumFractionDigits"), new objj_ivar("_maximumFractionDigits"), new objj_ivar("_minimum"), new objj_ivar("_maximum"), new objj_ivar("_currencyCode"), new objj_ivar("_currencySymbol"), new objj_ivar("_generatesDecimalNumbers"), new objj_ivar("_numberHandler")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("numberStyle"), function $CPNumberFormatter__numberStyle(self, _cmd)
{
    return self._numberStyle;
}
,["CPNumberFormatterStyle"]), new objj_method(sel_getUid("setNumberStyle:"), function $CPNumberFormatter__setNumberStyle_(self, _cmd, newValue)
{
    self._numberStyle = newValue;
}
,["void","CPNumberFormatterStyle"]), new objj_method(sel_getUid("perMillSymbol"), function $CPNumberFormatter__perMillSymbol(self, _cmd)
{
    return self._perMillSymbol;
}
,["CPString"]), new objj_method(sel_getUid("setPerMillSymbol:"), function $CPNumberFormatter__setPerMillSymbol_(self, _cmd, newValue)
{
    self._perMillSymbol = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("groupingSeparator"), function $CPNumberFormatter__groupingSeparator(self, _cmd)
{
    return self._groupingSeparator;
}
,["CPString"]), new objj_method(sel_getUid("setGroupingSeparator:"), function $CPNumberFormatter__setGroupingSeparator_(self, _cmd, newValue)
{
    self._groupingSeparator = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("roundingMode"), function $CPNumberFormatter__roundingMode(self, _cmd)
{
    return self._roundingMode;
}
,["CPNumberFormatterRoundingMode"]), new objj_method(sel_getUid("setRoundingMode:"), function $CPNumberFormatter__setRoundingMode_(self, _cmd, newValue)
{
    self._roundingMode = newValue;
}
,["void","CPNumberFormatterRoundingMode"]), new objj_method(sel_getUid("minimumFractionDigits"), function $CPNumberFormatter__minimumFractionDigits(self, _cmd)
{
    return self._minimumFractionDigits;
}
,["CPUInteger"]), new objj_method(sel_getUid("setMinimumFractionDigits:"), function $CPNumberFormatter__setMinimumFractionDigits_(self, _cmd, newValue)
{
    self._minimumFractionDigits = newValue;
}
,["void","CPUInteger"]), new objj_method(sel_getUid("maximumFractionDigits"), function $CPNumberFormatter__maximumFractionDigits(self, _cmd)
{
    return self._maximumFractionDigits;
}
,["CPUInteger"]), new objj_method(sel_getUid("setMaximumFractionDigits:"), function $CPNumberFormatter__setMaximumFractionDigits_(self, _cmd, newValue)
{
    self._maximumFractionDigits = newValue;
}
,["void","CPUInteger"]), new objj_method(sel_getUid("minimum"), function $CPNumberFormatter__minimum(self, _cmd)
{
    return self._minimum;
}
,["CPUInteger"]), new objj_method(sel_getUid("setMinimum:"), function $CPNumberFormatter__setMinimum_(self, _cmd, newValue)
{
    self._minimum = newValue;
}
,["void","CPUInteger"]), new objj_method(sel_getUid("maximum"), function $CPNumberFormatter__maximum(self, _cmd)
{
    return self._maximum;
}
,["CPUInteger"]), new objj_method(sel_getUid("setMaximum:"), function $CPNumberFormatter__setMaximum_(self, _cmd, newValue)
{
    self._maximum = newValue;
}
,["void","CPUInteger"]), new objj_method(sel_getUid("currencyCode"), function $CPNumberFormatter__currencyCode(self, _cmd)
{
    return self._currencyCode;
}
,["CPString"]), new objj_method(sel_getUid("setCurrencyCode:"), function $CPNumberFormatter__setCurrencyCode_(self, _cmd, newValue)
{
    self._currencyCode = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("currencySymbol"), function $CPNumberFormatter__currencySymbol(self, _cmd)
{
    return self._currencySymbol;
}
,["CPString"]), new objj_method(sel_getUid("setCurrencySymbol:"), function $CPNumberFormatter__setCurrencySymbol_(self, _cmd, newValue)
{
    self._currencySymbol = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("generatesDecimalNumbers"), function $CPNumberFormatter__generatesDecimalNumbers(self, _cmd)
{
    return self._generatesDecimalNumbers;
}
,["BOOL"]), new objj_method(sel_getUid("setGeneratesDecimalNumbers:"), function $CPNumberFormatter__setGeneratesDecimalNumbers_(self, _cmd, newValue)
{
    self._generatesDecimalNumbers = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("init"), function $CPNumberFormatter__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNumberFormatter").super_class }, "init"))
    {
        self._roundingMode = CPNumberFormatterRoundHalfEven;
        self._minimumFractionDigits = 0;
        self._maximumFractionDigits = 0;
        self._groupingSeparator = ",";
        self._generatesDecimalNumbers = YES;
        self._minimum = nil;
        self._maximum = nil;
        self._currencyCode = "USD";
        self._currencySymbol = "$";
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("stringFromNumber:"), function $CPNumberFormatter__stringFromNumber_(self, _cmd, number)
{
    if (self._numberStyle == CPNumberFormatterPercentStyle)
    {
        number *= 100.0;
    }
    var dcmn = objj_msgSend(number, "isKindOfClass:", CPDecimalNumber) ? number : objj_msgSend(objj_msgSend(CPDecimalNumber, "alloc"), "_initWithJSNumber:", number);
    switch(self._numberStyle) {
    case CPNumberFormatterCurrencyStyle:
    case CPNumberFormatterDecimalStyle:
    case CPNumberFormatterPercentStyle:
        objj_msgSend(self, "_updateNumberHandlerIfNecessary");
        dcmn = objj_msgSend(dcmn, "decimalNumberByRoundingAccordingToBehavior:", self._numberHandler);
        var output = objj_msgSend(dcmn, "descriptionWithLocale:", nil),
            parts = output.match(NumberRegex) || ["", undefined, "", undefined, undefined],
            negativePrefix = parts[1] || "",
            preFraction = parts[2] || "",
            fraction = parts[4] || "",
            preFractionLength = objj_msgSend(preFraction, "length"),
            commaPosition = 3;
        while (fraction.length < self._minimumFractionDigits)
            fraction += "0";
        if (self._groupingSeparator)
        {
            for (var commaPosition = 3, prefLength = objj_msgSend(preFraction, "length"); commaPosition < prefLength; commaPosition += 4)
            {
                preFraction = objj_msgSend(preFraction, "stringByReplacingCharactersInRange:withString:", CPMakeRange(prefLength - commaPosition, 0), self._groupingSeparator);
                prefLength += 1;
            }
        }
        var string = preFraction;
        if (fraction)
            string += "." + fraction;
        if (self._numberStyle === CPNumberFormatterCurrencyStyle)
        {
            if (self._currencySymbol)
                string = self._currencySymbol + string;
            else
                string = self._currencyCode + string;
        }
        if (self._numberStyle == CPNumberFormatterPercentStyle)
            string += "%";
        if (negativePrefix)
            string = negativePrefix + string;
        return string;
default:
        return objj_msgSend(number, "description");
    }
}
,["CPString","CPNumber"]), new objj_method(sel_getUid("numberFromString:"), function $CPNumberFormatter__numberFromString_(self, _cmd, aString)
{
    if (self._generatesDecimalNumbers)
        return objj_msgSend(CPDecimalNumber, "decimalNumberWithString:", aString);
    else
        return parseFloat(aString);
}
,["CPNumber","CPString"]), new objj_method(sel_getUid("stringForObjectValue:"), function $CPNumberFormatter__stringForObjectValue_(self, _cmd, anObject)
{
    if (objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(CPNumber, "class")))
        return objj_msgSend(self, "stringFromNumber:", anObject);
    else
        return objj_msgSend(anObject, "description");
}
,["CPString","id"]), new objj_method(sel_getUid("editingStringForObjectValue:"), function $CPNumberFormatter__editingStringForObjectValue_(self, _cmd, anObject)
{
    return objj_msgSend(self, "stringForObjectValue:", anObject);
}
,["CPString","id"]), new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"), function $CPNumberFormatter__getObjectValue_forString_errorDescription_(self, _cmd, anObjectRef, aString, anErrorRef)
{
    if (aString === "")
    {
        (anObjectRef)(nil);
        return YES;
    }
    var value = objj_msgSend(self, "numberFromString:", aString),
        error = "";
    if (!isFinite(value))
        error = "Value is not a number";
    else if (self._minimum !== nil && value < self._minimum)
        error = "Value is less than the minimum allowed value";
    else if (self._maximum !== nil && value > self._maximum)
        error = "Value is greater than the maximum allowed value";
    if (error)
    {
        if (anErrorRef)
            (anErrorRef)(error);
        return NO;
    }
    (anObjectRef)(value);
    return YES;
}
,["BOOL","idRef","CPString","CPStringRef"]), new objj_method(sel_getUid("setNumberStyle:"), function $CPNumberFormatter__setNumberStyle_(self, _cmd, aStyle)
{
    self._numberStyle = aStyle;
    switch(aStyle) {
    case CPNumberFormatterDecimalStyle:
        self._minimumFractionDigits = 0;
        self._maximumFractionDigits = 3;
        self._numberHandler = nil;
        break;
    case CPNumberFormatterCurrencyStyle:
        self._minimumFractionDigits = 2;
        self._maximumFractionDigits = 2;
        self._numberHandler = nil;
        break;
    }
}
,["void","CPNumberFormatterStyle"]), new objj_method(sel_getUid("setRoundingMode:"), function $CPNumberFormatter__setRoundingMode_(self, _cmd, aRoundingMode)
{
    self._roundingMode = aRoundingMode;
    self._numberHandler = nil;
}
,["void","CPNumberFormatterRoundingMode"]), new objj_method(sel_getUid("setMinimumFractionDigits:"), function $CPNumberFormatter__setMinimumFractionDigits_(self, _cmd, aNumber)
{
    self._minimumFractionDigits = aNumber;
    self._numberHandler = nil;
}
,["void","CPUInteger"]), new objj_method(sel_getUid("setMaximumFractionDigits:"), function $CPNumberFormatter__setMaximumFractionDigits_(self, _cmd, aNumber)
{
    self._maximumFractionDigits = aNumber;
    self._numberHandler = nil;
}
,["void","CPUInteger"]), new objj_method(sel_getUid("setMinimum:"), function $CPNumberFormatter__setMinimum_(self, _cmd, aNumber)
{
    self._minimum = aNumber;
    self._numberHandler = nil;
}
,["void","CPUInteger"]), new objj_method(sel_getUid("setMaximum:"), function $CPNumberFormatter__setMaximum_(self, _cmd, aNumber)
{
    self._maximum = aNumber;
    self._numberHandler = nil;
}
,["void","CPUInteger"]), new objj_method(sel_getUid("_updateNumberHandlerIfNecessary"), function $CPNumberFormatter___updateNumberHandlerIfNecessary(self, _cmd)
{
    if (!self._numberHandler)
        self._numberHandler = objj_msgSend(CPDecimalNumberHandler, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", self._roundingMode, self._maximumFractionDigits, NO, NO, NO, YES);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("localizedStringFromNumber:numberStyle:"), function $CPNumberFormatter__localizedStringFromNumber_numberStyle_(self, _cmd, num, localizationStyle)
{
    var formatter = objj_msgSend(objj_msgSend(CPNumberFormatter, "alloc"), "init");
    objj_msgSend(formatter, "setNumberStyle:", localizationStyle);
    return objj_msgSend(formatter, "stringFromNumber:", num);
}
,["CPString","CPNumber","CPNumberFormatterStyle"])]);
}var CPNumberFormatterStyleKey = "CPNumberFormatterStyleKey",
    CPNumberFormatterMinimumFractionDigitsKey = "CPNumberFormatterMinimumFractionDigitsKey",
    CPNumberFormatterMaximumFractionDigitsKey = "CPNumberFormatterMaximumFractionDigitsKey",
    CPNumberFormatterMinimumKey = "CPNumberFormatterMinimumKey",
    CPNumberFormatterMaximumKey = "CPNumberFormatterMaximumKey",
    CPNumberFormatterRoundingModeKey = "CPNumberFormatterRoundingModeKey",
    CPNumberFormatterGroupingSeparatorKey = "CPNumberFormatterGroupingSeparatorKey",
    CPNumberFormatterCurrencyCodeKey = "CPNumberFormatterCurrencyCodeKey",
    CPNumberFormatterCurrencySymbolKey = "CPNumberFormatterCurrencySymbolKey",
    CPNumberFormatterGeneratesDecimalNumbers = "CPNumberFormatterGeneratesDecimalNumbers";
{
var the_class = objj_getClass("CPNumberFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPNumberFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPNumberFormatter__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNumberFormatter").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._numberStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPNumberFormatterStyleKey);
        self._minimumFractionDigits = objj_msgSend(aCoder, "decodeIntForKey:", CPNumberFormatterMinimumFractionDigitsKey);
        self._maximumFractionDigits = objj_msgSend(aCoder, "decodeIntForKey:", CPNumberFormatterMaximumFractionDigitsKey);
        self._roundingMode = objj_msgSend(aCoder, "decodeIntForKey:", CPNumberFormatterRoundingModeKey);
        self._groupingSeparator = objj_msgSend(aCoder, "decodeObjectForKey:", CPNumberFormatterGroupingSeparatorKey);
        self._currencyCode = objj_msgSend(aCoder, "decodeObjectForKey:", CPNumberFormatterCurrencyCodeKey);
        self._currencySymbol = objj_msgSend(aCoder, "decodeObjectForKey:", CPNumberFormatterCurrencySymbolKey);
        self._generatesDecimalNumbers = objj_msgSend(aCoder, "decodeBoolForKey:", CPNumberFormatterGeneratesDecimalNumbers);
        self._minimum = objj_msgSend(aCoder, "decodeObjectForKey:", CPNumberFormatterMinimumKey);
        self._maximum = objj_msgSend(aCoder, "decodeObjectForKey:", CPNumberFormatterMaximumKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPNumberFormatter__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNumberFormatter").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._numberStyle, CPNumberFormatterStyleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._minimumFractionDigits, CPNumberFormatterMinimumFractionDigitsKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._maximumFractionDigits, CPNumberFormatterMaximumFractionDigitsKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._minimum, CPNumberFormatterMinimumKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._maximum, CPNumberFormatterMaximumKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._roundingMode, CPNumberFormatterRoundingModeKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._groupingSeparator, CPNumberFormatterGroupingSeparatorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._currencyCode, CPNumberFormatterCurrencyCodeKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._currencySymbol, CPNumberFormatterCurrencySymbolKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._generatesDecimalNumbers, CPNumberFormatterGeneratesDecimalNumbers);
}
,["void","CPCoder"])]);
}