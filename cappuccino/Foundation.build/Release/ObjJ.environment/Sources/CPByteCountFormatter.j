@STATIC;1.0;i;19;CPNumberFormatter.ji;10;CPString.jt;12198;objj_executeFile("CPNumberFormatter.j", YES);objj_executeFile("CPString.j", YES);CPByteCountFormatterUseDefault = 0;
CPByteCountFormatterUseBytes = 1 << 0;
CPByteCountFormatterUseKB = 1 << 1;
CPByteCountFormatterUseMB = 1 << 2;
CPByteCountFormatterUseGB = 1 << 3;
CPByteCountFormatterUseTB = 1 << 4;
CPByteCountFormatterUsePB = 1 << 5;
CPByteCountFormatterUseAll = 0xFFFF;
CPByteCountFormatterCountStyleFile = 0;
CPByteCountFormatterCountStyleMemory = 1;
CPByteCountFormatterCountStyleDecimal = 2;
CPByteCountFormatterCountStyleBinary = 3;
var CPByteCountFormatterUnits = ["bytes", "KB", "MB", "GB", "TB", "PB"];
{var the_class = objj_allocateClassPair(CPFormatter, "CPByteCountFormatter"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_countStyle"), new objj_ivar("_allowsNonnumericFormatting"), new objj_ivar("_includesActualByteCount"), new objj_ivar("_includesCount"), new objj_ivar("_includesUnit"), new objj_ivar("_adaptive"), new objj_ivar("_zeroPadsFractionDigits"), new objj_ivar("_allowedUnits"), new objj_ivar("_numberFormatter")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPByteCountFormatter__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPByteCountFormatter").super_class }, "init"))
    {
        self._adaptive = YES;
        self._allowedUnits = CPByteCountFormatterUseDefault;
        self._allowsNonnumericFormatting = YES;
        self._countStyle = CPByteCountFormatterCountStyleFile;
        self._includesActualByteCount = NO;
        self._includesCount = YES;
        self._includesUnit = YES;
        self._zeroPadsFractionDigits = NO;
        self._numberFormatter = objj_msgSend(CPNumberFormatter, "new");
        objj_msgSend(self._numberFormatter, "setNumberStyle:", CPNumberFormatterDecimalStyle);
        objj_msgSend(self._numberFormatter, "setMinimumFractionDigits:", 0);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("stringFromByteCount:"), function $CPByteCountFormatter__stringFromByteCount_(self, _cmd, byteCount)
{
    var divisor,
        exponent = 0,
        unitIndex = self._allowedUnits === 0 || self._allowedUnits & CPByteCountFormatterUseBytes ? 0 : -1,
        bytes = byteCount,
        unitBytes = bytes,
        unitCount = objj_msgSend(CPByteCountFormatterUnits, "count");
    if (self._countStyle === CPByteCountFormatterCountStyleFile || self._countStyle === CPByteCountFormatterCountStyleDecimal)
        divisor = 1000;
    else
        divisor = 1024;
    while (bytes >= divisor && exponent < unitCount)
    {
        bytes /= divisor;
        ++exponent;
        if (self._allowedUnits === 0 || self._allowedUnits & 1 << exponent)
        {
            unitIndex = exponent;
            unitBytes = bytes;
        }
    }
    if (unitIndex === -1)
        for (var i = 1; i < unitCount; ++i)
        {
            unitBytes /= divisor;
            if (self._allowedUnits === 0 || self._allowedUnits & 1 << i)
            {
                unitIndex = i;
                break;
            }
        }
    var minDigits = 0,
        maxDigits = CPDecimalNoScale;
    if (unitBytes >= 1.0)
    {
        if (self._adaptive)
        {
            var digits;
            if (exponent <= 1)
                digits = 0;
            else if (exponent == 2)
                digits = 1;
            else
                digits = 2;
            maxDigits = digits;
            if (self._zeroPadsFractionDigits)
                minDigits = digits;
        }
        else
        {
            if (self._zeroPadsFractionDigits)
                minDigits = 2;
            if (bytes >= 1)
                maxDigits = 2;
        }
    }
    objj_msgSend(self._numberFormatter, "setMinimumFractionDigits:", minDigits);
    objj_msgSend(self._numberFormatter, "setMaximumFractionDigits:", maxDigits);
    var parts = [];
    if (self._includesCount)
    {
        if (self._allowsNonnumericFormatting && bytes === 0)
            objj_msgSend(parts, "addObject:", "Zero");
        else
            objj_msgSend(parts, "addObject:", objj_msgSend(self._numberFormatter, "stringFromNumber:", unitBytes));
    }
    if (self._includesUnit)
        objj_msgSend(parts, "addObject:", CPByteCountFormatterUnits[unitIndex]);
    if (unitIndex > 0 && self._includesCount && self._includesUnit && self._includesActualByteCount)
    {
        objj_msgSend(self._numberFormatter, "setMaximumFractionDigits:", 0);
        objj_msgSend(parts, "addObject:", objj_msgSend(CPString, "stringWithFormat:", "(%s bytes)", objj_msgSend(self._numberFormatter, "stringFromNumber:", byteCount)));
    }
    var result = objj_msgSend(parts, "componentsJoinedByString:", " ");
    if (byteCount === 1)
        return objj_msgSend(result, "stringByReplacingOccurrencesOfString:withString:", "bytes", "byte");
    else
        return result;
}
,["CPString","int"]), new objj_method(sel_getUid("stringForObjectValue:"), function $CPByteCountFormatter__stringForObjectValue_(self, _cmd, anObject)
{
    if (objj_msgSend(anObject, "isKindOfClass:", CPNumber))
        return objj_msgSend(self, "stringFromByteCount:", anObject);
    else
        return nil;
}
,["CPString","id"]), new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"), function $CPByteCountFormatter__getObjectValue_forString_errorDescription_(self, _cmd, anObject, aString, anError)
{
    return NO;
}
,["BOOL","id","CPString","CPString"]), new objj_method(sel_getUid("countStyle"), function $CPByteCountFormatter__countStyle(self, _cmd)
{
    return self._countStyle;
}
,["int"]), new objj_method(sel_getUid("setCountStyle:"), function $CPByteCountFormatter__setCountStyle_(self, _cmd, style)
{
    self._countStyle = style;
}
,["void","int"]), new objj_method(sel_getUid("allowsNonnumericFormatting"), function $CPByteCountFormatter__allowsNonnumericFormatting(self, _cmd)
{
    return self._allowsNonnumericFormatting;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsNonnumericFormatting:"), function $CPByteCountFormatter__setAllowsNonnumericFormatting_(self, _cmd, shouldAllowNonnumericFormatting)
{
    self._allowsNonnumericFormatting = shouldAllowNonnumericFormatting;
}
,["void","BOOL"]), new objj_method(sel_getUid("includesActualByteCount"), function $CPByteCountFormatter__includesActualByteCount(self, _cmd)
{
    return self._includesActualByteCount;
}
,["BOOL"]), new objj_method(sel_getUid("setIncludesActualByteCount:"), function $CPByteCountFormatter__setIncludesActualByteCount_(self, _cmd, shouldIncludeActualByteCount)
{
    self._includesActualByteCount = shouldIncludeActualByteCount;
}
,["void","BOOL"]), new objj_method(sel_getUid("isAdaptive"), function $CPByteCountFormatter__isAdaptive(self, _cmd)
{
    return self._adaptive;
}
,["BOOL"]), new objj_method(sel_getUid("setAdaptive:"), function $CPByteCountFormatter__setAdaptive_(self, _cmd, shouldBeAdaptive)
{
    self._adaptive = shouldBeAdaptive;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowedUnits"), function $CPByteCountFormatter__allowedUnits(self, _cmd)
{
    return self._allowedUnits;
}
,["int"]), new objj_method(sel_getUid("setAllowedUnits:"), function $CPByteCountFormatter__setAllowedUnits_(self, _cmd, allowed)
{
    self._allowedUnits = allowed;
}
,["void","int"]), new objj_method(sel_getUid("includesCount"), function $CPByteCountFormatter__includesCount(self, _cmd)
{
    return self._includesCount;
}
,["BOOL"]), new objj_method(sel_getUid("setIncludesCount:"), function $CPByteCountFormatter__setIncludesCount_(self, _cmd, shouldIncludeCount)
{
    self._includesCount = shouldIncludeCount;
}
,["void","BOOL"]), new objj_method(sel_getUid("includesUnit"), function $CPByteCountFormatter__includesUnit(self, _cmd)
{
    return self._includesUnit;
}
,["BOOL"]), new objj_method(sel_getUid("setIncludesUnit:"), function $CPByteCountFormatter__setIncludesUnit_(self, _cmd, shouldIncludeUnit)
{
    self._includesUnit = shouldIncludeUnit;
}
,["void","BOOL"]), new objj_method(sel_getUid("zeroPadsFractionDigits"), function $CPByteCountFormatter__zeroPadsFractionDigits(self, _cmd)
{
    return self._zeroPadsFractionDigits;
}
,["BOOL"]), new objj_method(sel_getUid("setZeroPadsFractionDigits:"), function $CPByteCountFormatter__setZeroPadsFractionDigits_(self, _cmd, shouldZeroPad)
{
    self._zeroPadsFractionDigits = shouldZeroPad;
}
,["void","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("stringFromByteCount:countStyle:"), function $CPByteCountFormatter__stringFromByteCount_countStyle_(self, _cmd, byteCount, countStyle)
{
    var formatter = objj_msgSend(CPByteCountFormatter, "new");
    objj_msgSend(formatter, "setCountStyle:", countStyle);
    return objj_msgSend(formatter, "stringFromByteCount:", byteCount);
}
,["CPString","int","int"])]);
}var CPByteCountFormatterCountStyleKey = "CPByteCountFormatterCountStyleKey",
    CPByteCountFormatterAllowsNonnumericFormattingKey = "CPByteCountFormatterAllowsNonnumericFormattingKey",
    CPByteCountFormatterIncludesActualByteCountKey = "CPByteCountFormatterIncludesActualByteCountKey",
    CPByteCountFormatterIncludesCountKey = "CPByteCountFormatterIncludesCountKey",
    CPByteCountFormatterIncludesUnitKey = "CPByteCountFormatterIncludesUnitKey",
    CPByteCountFormatterAdaptiveKey = "CPByteCountFormatterAdaptiveKey",
    CPByteCountFormatterZeroPadsFractionDigitsKey = "CPByteCountFormatterZeroPadsFractionDigitsKey",
    CPByteCountFormatterAllowedUnitsKey = "CPByteCountFormatterAllowedUnitsKey";
{
var the_class = objj_getClass("CPByteCountFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPByteCountFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPByteCountFormatter__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPByteCountFormatter").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._countStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPByteCountFormatterCountStyleKey);
        self._allowsNonnumericFormatting = objj_msgSend(aCoder, "decodeBoolForKey:", CPByteCountFormatterAllowsNonnumericFormattingKey);
        self._includesActualByteCount = objj_msgSend(aCoder, "decodeBoolForKey:", CPByteCountFormatterIncludesActualByteCountKey);
        self._includesCount = objj_msgSend(aCoder, "decodeBoolForKey:", CPByteCountFormatterIncludesCountKey);
        self._includesUnit = objj_msgSend(aCoder, "decodeBoolForKey:", CPByteCountFormatterIncludesUnitKey);
        self._adaptive = objj_msgSend(aCoder, "decodeBoolForKey:", CPByteCountFormatterAdaptiveKey);
        self._zeroPadsFractionDigits = objj_msgSend(aCoder, "decodeBoolForKey:", CPByteCountFormatterZeroPadsFractionDigitsKey);
        self._allowedUnits = objj_msgSend(aCoder, "decodeIntForKey:", CPByteCountFormatterAllowedUnitsKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPByteCountFormatter__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPByteCountFormatter").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._countStyle, CPByteCountFormatterCountStyleKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsNonnumericFormatting, CPByteCountFormatterAllowsNonnumericFormattingKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._includesActualByteCount, CPByteCountFormatterIncludesActualByteCountKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._includesCount, CPByteCountFormatterIncludesCountKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._includesUnit, CPByteCountFormatterIncludesUnitKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._adaptive, CPByteCountFormatterAdaptiveKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._zeroPadsFractionDigits, CPByteCountFormatterZeroPadsFractionDigitsKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._allowedUnits, CPByteCountFormatterAllowedUnitsKey);
}
,["void","CPCoder"])]);
}