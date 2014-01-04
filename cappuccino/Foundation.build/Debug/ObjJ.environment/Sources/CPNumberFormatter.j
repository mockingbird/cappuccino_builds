@STATIC;1.0;I;21;Foundation/CPString.jI;24;Foundation/CPFormatter.jI;28;Foundation/CPDecimalNumber.jt;12917;
objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("Foundation/CPFormatter.j", NO);
objj_executeFile("Foundation/CPDecimalNumber.j", NO);





CPNumberFormatterNoStyle = 0;
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
{var the_class = objj_allocateClassPair(CPFormatter, "CPNumberFormatter"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_numberStyle"), new objj_ivar("_perMillSymbol"), new objj_ivar("_groupingSeparator"), new objj_ivar("_roundingMode"), new objj_ivar("_minimumFractionDigits"), new objj_ivar("_maximumFractionDigits"), new objj_ivar("_currencyCode"), new objj_ivar("_currencySymbol"), new objj_ivar("_generatesDecimalNumbers"), new objj_ivar("_numberHandler")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("numberStyle"), function $CPNumberFormatter__numberStyle(self, _cmd)
{ with(self)
{
return _numberStyle;
}
},["id"]),
new objj_method(sel_getUid("setNumberStyle:"), function $CPNumberFormatter__setNumberStyle_(self, _cmd, newValue)
{ with(self)
{
_numberStyle = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("perMillSymbol"), function $CPNumberFormatter__perMillSymbol(self, _cmd)
{ with(self)
{
return _perMillSymbol;
}
},["id"]),
new objj_method(sel_getUid("setPerMillSymbol:"), function $CPNumberFormatter__setPerMillSymbol_(self, _cmd, newValue)
{ with(self)
{
_perMillSymbol = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("groupingSeparator"), function $CPNumberFormatter__groupingSeparator(self, _cmd)
{ with(self)
{
return _groupingSeparator;
}
},["id"]),
new objj_method(sel_getUid("setGroupingSeparator:"), function $CPNumberFormatter__setGroupingSeparator_(self, _cmd, newValue)
{ with(self)
{
_groupingSeparator = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("roundingMode"), function $CPNumberFormatter__roundingMode(self, _cmd)
{ with(self)
{
return _roundingMode;
}
},["id"]),
new objj_method(sel_getUid("setRoundingMode:"), function $CPNumberFormatter__setRoundingMode_(self, _cmd, newValue)
{ with(self)
{
_roundingMode = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("minimumFractionDigits"), function $CPNumberFormatter__minimumFractionDigits(self, _cmd)
{ with(self)
{
return _minimumFractionDigits;
}
},["id"]),
new objj_method(sel_getUid("setMinimumFractionDigits:"), function $CPNumberFormatter__setMinimumFractionDigits_(self, _cmd, newValue)
{ with(self)
{
_minimumFractionDigits = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("maximumFractionDigits"), function $CPNumberFormatter__maximumFractionDigits(self, _cmd)
{ with(self)
{
return _maximumFractionDigits;
}
},["id"]),
new objj_method(sel_getUid("setMaximumFractionDigits:"), function $CPNumberFormatter__setMaximumFractionDigits_(self, _cmd, newValue)
{ with(self)
{
_maximumFractionDigits = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("currencyCode"), function $CPNumberFormatter__currencyCode(self, _cmd)
{ with(self)
{
return _currencyCode;
}
},["id"]),
new objj_method(sel_getUid("setCurrencyCode:"), function $CPNumberFormatter__setCurrencyCode_(self, _cmd, newValue)
{ with(self)
{
_currencyCode = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("currencySymbol"), function $CPNumberFormatter__currencySymbol(self, _cmd)
{ with(self)
{
return _currencySymbol;
}
},["id"]),
new objj_method(sel_getUid("setCurrencySymbol:"), function $CPNumberFormatter__setCurrencySymbol_(self, _cmd, newValue)
{ with(self)
{
_currencySymbol = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("generatesDecimalNumbers"), function $CPNumberFormatter__generatesDecimalNumbers(self, _cmd)
{ with(self)
{
return _generatesDecimalNumbers;
}
},["id"]),
new objj_method(sel_getUid("setGeneratesDecimalNumbers:"), function $CPNumberFormatter__setGeneratesDecimalNumbers_(self, _cmd, newValue)
{ with(self)
{
_generatesDecimalNumbers = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $CPNumberFormatter__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNumberFormatter").super_class }, "init"))
    {
        _roundingMode = CPNumberFormatterRoundHalfEven;
        _minimumFractionDigits = 0;
        _maximumFractionDigits = 0;
        _groupingSeparator = ",";
        _generatesDecimalNumbers = YES;


        _currencyCode = "USD";
        _currencySymbol = "$";
    }

    return self;
}
},["id"]), new objj_method(sel_getUid("stringFromNumber:"), function $CPNumberFormatter__stringFromNumber_(self, _cmd, number)
{ with(self)
{
    var dcmn = objj_msgSend(number, "isKindOfClass:", CPDecimalNumber) ? number : objj_msgSend(objj_msgSend(CPDecimalNumber, "alloc"), "_initWithJSNumber:", number);


    switch (_numberStyle)
    {
        case CPNumberFormatterCurrencyStyle:
        case CPNumberFormatterDecimalStyle:
            if (!_numberHandler) _numberHandler = objj_msgSend(CPDecimalNumberHandler, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", _roundingMode, _maximumFractionDigits, NO, NO, NO, YES);;

            dcmn = objj_msgSend(dcmn, "decimalNumberByRoundingAccordingToBehavior:", _numberHandler);

            var output = objj_msgSend(dcmn, "descriptionWithLocale:", nil),
                parts = objj_msgSend(output, "componentsSeparatedByString:", "."),
                preFraction = parts[0],
                fraction = parts.length > 1 ? parts[1] : "",
                preFractionLength = objj_msgSend(preFraction, "length"),
                commaPosition = 3;

            while (fraction.length < _minimumFractionDigits)
                fraction += "0";



            if (_groupingSeparator)
            {
                for (var commaPosition = 3, prefLength = objj_msgSend(preFraction, "length"); commaPosition < prefLength; commaPosition += 4)
                {
                    preFraction = objj_msgSend(preFraction, "stringByReplacingCharactersInRange:withString:", CPMakeRange(prefLength - commaPosition, 0), _groupingSeparator);
                    prefLength += 1;
                }
            }

            var string = preFraction;
            if (fraction)
                string += "." + fraction;

            if (_numberStyle === CPNumberFormatterCurrencyStyle)
            {
                if (_currencySymbol)
                    string = _currencySymbol + string;
                else
                    string = _currencyCode + string;
            }

            return string;
        default:
            return objj_msgSend(number, "description");
    }
}
},["CPString","CPNumber"]), new objj_method(sel_getUid("numberFromString:"), function $CPNumberFormatter__numberFromString_(self, _cmd, aString)
{ with(self)
{
    if (_generatesDecimalNumbers)
        return objj_msgSend(CPDecimalNumber, "decimalNumberWithString:", aString);
    else
        return parseFloat(aString);
}
},["CPNumber","CPString"]), new objj_method(sel_getUid("stringForObjectValue:"), function $CPNumberFormatter__stringForObjectValue_(self, _cmd, anObject)
{ with(self)
{
    if (objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(CPNumber, "class")))
        return objj_msgSend(self, "stringFromNumber:", anObject);
    else
        return objj_msgSend(anObject, "description");
}
},["CPString","id"]), new objj_method(sel_getUid("editingStringForObjectValue:"), function $CPNumberFormatter__editingStringForObjectValue_(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(self, "stringForObjectValue:", anObject);
}
},["CPString","id"]), new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"), function $CPNumberFormatter__getObjectValue_forString_errorDescription_(self, _cmd, anObject, aString, anError)
{ with(self)
{

    var value = objj_msgSend(self, "numberFromString:", aString);
    anObject( value);

    return YES;
}
},["BOOL","id","CPString","CPString"]), new objj_method(sel_getUid("setNumberStyle:"), function $CPNumberFormatter__setNumberStyle_(self, _cmd, aStyle)
{ with(self)
{
    _numberStyle = aStyle;

    switch (aStyle)
    {
        case CPNumberFormatterDecimalStyle:
            _minimumFractionDigits = 0;
            _maximumFractionDigits = 3;
            _numberHandler = nil;;
            break;
        case CPNumberFormatterCurrencyStyle:
            _minimumFractionDigits = 2;
            _maximumFractionDigits = 2;
            _numberHandler = nil;;
            break;
    }
}
},["void","CPNumberFormatterStyle"]), new objj_method(sel_getUid("setRoundingMode:"), function $CPNumberFormatter__setRoundingMode_(self, _cmd, aRoundingMode)
{ with(self)
{
    _roundingMode = aRoundingMode;
    _numberHandler = nil;;
}
},["void","CPNumberFormatterRoundingMode"]), new objj_method(sel_getUid("setMinimumFractionDigits:"), function $CPNumberFormatter__setMinimumFractionDigits_(self, _cmd, aNumber)
{ with(self)
{
    _minimumFractionDigits = aNumber;
    _numberHandler = nil;;
}
},["void","CPUInteger"]), new objj_method(sel_getUid("setMaximumFractionDigits:"), function $CPNumberFormatter__setMaximumFractionDigits_(self, _cmd, aNumber)
{ with(self)
{
    _maximumFractionDigits = aNumber;
    _numberHandler = nil;;
}
},["void","CPUInteger"])]);
}

var CPNumberFormatterStyleKey = "CPNumberFormatterStyleKey",
    CPNumberFormatterMinimumFractionDigitsKey = "CPNumberFormatterMinimumFractionDigitsKey",
    CPNumberFormatterMaximumFractionDigitsKey = "CPNumberFormatterMaximumFractionDigitsKey",
    CPNumberFormatterRoundingModeKey = "CPNumberFormatterRoundingModeKey",
    CPNumberFormatterGroupingSeparatorKey = "CPNumberFormatterGroupingSeparatorKey",
    CPNumberFormatterCurrencyCodeKey = "CPNumberFormatterCurrencyCodeKey",
    CPNumberFormatterCurrencySymbolKey = "CPNumberFormatterCurrencySymbolKey",
    CPNumberFormatterGeneratesDecimalNumbers = "CPNumberFormatterGeneratesDecimalNumbers";

{
var the_class = objj_getClass("CPNumberFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPNumberFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPNumberFormatter__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNumberFormatter").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        _numberStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPNumberFormatterStyleKey);
        _minimumFractionDigits = objj_msgSend(aCoder, "decodeIntForKey:", CPNumberFormatterMinimumFractionDigitsKey);
        _maximumFractionDigits = objj_msgSend(aCoder, "decodeIntForKey:", CPNumberFormatterMaximumFractionDigitsKey);
        _roundingMode = objj_msgSend(aCoder, "decodeIntForKey:", CPNumberFormatterRoundingModeKey);
        _groupingSeparator = objj_msgSend(aCoder, "decodeObjectForKey:", CPNumberFormatterGroupingSeparatorKey);
        _currencyCode = objj_msgSend(aCoder, "decodeObjectForKey:", CPNumberFormatterCurrencyCodeKey);
        _currencySymbol = objj_msgSend(aCoder, "decodeObjectForKey:", CPNumberFormatterCurrencySymbolKey);
        _generatesDecimalNumbers = objj_msgSend(aCoder, "decodeBoolForKey:", CPNumberFormatterGeneratesDecimalNumbers);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPNumberFormatter__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNumberFormatter").super_class }, "encodeWithCoder:", aCoder);

    objj_msgSend(aCoder, "encodeInt:forKey:", _numberStyle, CPNumberFormatterStyleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _minimumFractionDigits, CPNumberFormatterMinimumFractionDigitsKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _maximumFractionDigits, CPNumberFormatterMaximumFractionDigitsKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _roundingMode, CPNumberFormatterRoundingModeKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _groupingSeparator, CPNumberFormatterGroupingSeparatorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _currencyCode, CPNumberFormatterCurrencyCodeKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _currencySymbol, CPNumberFormatterCurrencySymbolKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _generatesDecimalNumbers, CPNumberFormatterGeneratesDecimalNumbers);
}
},["void","CPCoder"])]);
}

