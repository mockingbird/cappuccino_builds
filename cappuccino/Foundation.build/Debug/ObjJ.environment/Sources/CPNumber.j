@STATIC;1.0;i;13;CPException.ji;8;CPNull.ji;10;CPObject.ji;15;CPObjJRuntime.jt;9104;objj_executeFile("CPException.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPObjJRuntime.j", YES);var CPNumberUIDs = new CFMutableDictionary();
{var the_class = objj_allocateClassPair(CPObject, "CPNumber"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBool:"), function $CPNumber__initWithBool_(self, _cmd, aBoolean)
{
    return aBoolean;
}
,["id","BOOL"]), new objj_method(sel_getUid("initWithChar:"), function $CPNumber__initWithChar_(self, _cmd, aChar)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
,["id","char"]), new objj_method(sel_getUid("initWithDouble:"), function $CPNumber__initWithDouble_(self, _cmd, aDouble)
{
    return aDouble;
}
,["id","double"]), new objj_method(sel_getUid("initWithFloat:"), function $CPNumber__initWithFloat_(self, _cmd, aFloat)
{
    return aFloat;
}
,["id","float"]), new objj_method(sel_getUid("initWithInt:"), function $CPNumber__initWithInt_(self, _cmd, anInt)
{
    return anInt;
}
,["id","int"]), new objj_method(sel_getUid("initWithLong:"), function $CPNumber__initWithLong_(self, _cmd, aLong)
{
    return aLong;
}
,["id","long"]), new objj_method(sel_getUid("initWithLongLong:"), function $CPNumber__initWithLongLong_(self, _cmd, aLongLong)
{
    return aLongLong;
}
,["id","long long"]), new objj_method(sel_getUid("initWithShort:"), function $CPNumber__initWithShort_(self, _cmd, aShort)
{
    return aShort;
}
,["id","short"]), new objj_method(sel_getUid("initWithUnsignedChar:"), function $CPNumber__initWithUnsignedChar_(self, _cmd, aChar)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
,["id","unsigned char"]), new objj_method(sel_getUid("initWithUnsignedInt:"), function $CPNumber__initWithUnsignedInt_(self, _cmd, anUnsignedInt)
{
    return anUnsignedInt;
}
,["id","unsigned"]), new objj_method(sel_getUid("initWithUnsignedLong:"), function $CPNumber__initWithUnsignedLong_(self, _cmd, anUnsignedLong)
{
    return anUnsignedLong;
}
,["id","unsigned long"]), new objj_method(sel_getUid("initWithUnsignedShort:"), function $CPNumber__initWithUnsignedShort_(self, _cmd, anUnsignedShort)
{
    return anUnsignedShort;
}
,["id","unsigned short"]), new objj_method(sel_getUid("UID"), function $CPNumber__UID(self, _cmd)
{
    var UID = CPNumberUIDs.valueForKey(self);
    if (!UID)
    {
        UID = objj_generateObjectUID();
        CPNumberUIDs.setValueForKey(self, UID);
    }
    return UID + "";
}
,["CPString"]), new objj_method(sel_getUid("boolValue"), function $CPNumber__boolValue(self, _cmd)
{
    return self ? true : false;
}
,["BOOL"]), new objj_method(sel_getUid("charValue"), function $CPNumber__charValue(self, _cmd)
{
    return String.fromCharCode(self);
}
,["char"]), new objj_method(sel_getUid("decimalValue"), function $CPNumber__decimalValue(self, _cmd)
{
    throw new Error("decimalValue: NOT YET IMPLEMENTED");
}
,["CPDecimal"]), new objj_method(sel_getUid("descriptionWithLocale:"), function $CPNumber__descriptionWithLocale_(self, _cmd, aDictionary)
{
    if (!aDictionary)
        return self.toString();
    throw new Error("descriptionWithLocale: NOT YET IMPLEMENTED");
}
,["CPString","CPDictionary"]), new objj_method(sel_getUid("description"), function $CPNumber__description(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "descriptionWithLocale:", nil);
}
,["CPString"]), new objj_method(sel_getUid("doubleValue"), function $CPNumber__doubleValue(self, _cmd)
{
    if (typeof self == "boolean")
        return self ? 1 : 0;
    return self;
}
,["double"]), new objj_method(sel_getUid("floatValue"), function $CPNumber__floatValue(self, _cmd)
{
    if (typeof self == "boolean")
        return self ? 1 : 0;
    return self;
}
,["float"]), new objj_method(sel_getUid("intValue"), function $CPNumber__intValue(self, _cmd)
{
    if (typeof self == "boolean")
        return self ? 1 : 0;
    return self;
}
,["int"]), new objj_method(sel_getUid("longLongValue"), function $CPNumber__longLongValue(self, _cmd)
{
    if (typeof self == "boolean")
        return self ? 1 : 0;
    return self;
}
,["long long"]), new objj_method(sel_getUid("longValue"), function $CPNumber__longValue(self, _cmd)
{
    if (typeof self == "boolean")
        return self ? 1 : 0;
    return self;
}
,["long"]), new objj_method(sel_getUid("shortValue"), function $CPNumber__shortValue(self, _cmd)
{
    if (typeof self == "boolean")
        return self ? 1 : 0;
    return self;
}
,["short"]), new objj_method(sel_getUid("stringValue"), function $CPNumber__stringValue(self, _cmd)
{
    return self.toString();
}
,["CPString"]), new objj_method(sel_getUid("unsignedCharValue"), function $CPNumber__unsignedCharValue(self, _cmd)
{
    return String.fromCharCode(self);
}
,["unsigned char"]), new objj_method(sel_getUid("unsignedIntValue"), function $CPNumber__unsignedIntValue(self, _cmd)
{
    if (typeof self == "boolean")
        return self ? 1 : 0;
    return self;
}
,["unsigned int"]), new objj_method(sel_getUid("unsignedLongValue"), function $CPNumber__unsignedLongValue(self, _cmd)
{
    if (typeof self == "boolean")
        return self ? 1 : 0;
    return self;
}
,["unsigned long"]), new objj_method(sel_getUid("unsignedShortValue"), function $CPNumber__unsignedShortValue(self, _cmd)
{
    if (typeof self == "boolean")
        return self ? 1 : 0;
    return self;
}
,["unsigned short"]), new objj_method(sel_getUid("compare:"), function $CPNumber__compare_(self, _cmd, aNumber)
{
    if (aNumber === nil || aNumber['isa'] === CPNull)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "nil argument");
    if (self > aNumber)
        return CPOrderedDescending;
    else if (self < aNumber)
        return CPOrderedAscending;
    return CPOrderedSame;
}
,["CPComparisonResult","CPNumber"]), new objj_method(sel_getUid("isEqualToNumber:"), function $CPNumber__isEqualToNumber_(self, _cmd, aNumber)
{
    return self == aNumber;
}
,["BOOL","CPNumber"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPNumber__alloc(self, _cmd)
{
    var result = new Number();
    result.isa = self.isa.objj_msgSend0(self, "class");
    return result;
}
,["id"]), new objj_method(sel_getUid("numberWithBool:"), function $CPNumber__numberWithBool_(self, _cmd, aBoolean)
{
    return aBoolean ? 1 : 0;
}
,["id","BOOL"]), new objj_method(sel_getUid("numberWithChar:"), function $CPNumber__numberWithChar_(self, _cmd, aChar)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
,["id","char"]), new objj_method(sel_getUid("numberWithDouble:"), function $CPNumber__numberWithDouble_(self, _cmd, aDouble)
{
    return aDouble;
}
,["id","double"]), new objj_method(sel_getUid("numberWithFloat:"), function $CPNumber__numberWithFloat_(self, _cmd, aFloat)
{
    return aFloat;
}
,["id","float"]), new objj_method(sel_getUid("numberWithInt:"), function $CPNumber__numberWithInt_(self, _cmd, anInt)
{
    return anInt;
}
,["id","int"]), new objj_method(sel_getUid("numberWithLong:"), function $CPNumber__numberWithLong_(self, _cmd, aLong)
{
    return aLong;
}
,["id","long"]), new objj_method(sel_getUid("numberWithLongLong:"), function $CPNumber__numberWithLongLong_(self, _cmd, aLongLong)
{
    return aLongLong;
}
,["id","long long"]), new objj_method(sel_getUid("numberWithShort:"), function $CPNumber__numberWithShort_(self, _cmd, aShort)
{
    return aShort;
}
,["id","short"]), new objj_method(sel_getUid("numberWithUnsignedChar:"), function $CPNumber__numberWithUnsignedChar_(self, _cmd, aChar)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
,["id","unsigned char"]), new objj_method(sel_getUid("numberWithUnsignedInt:"), function $CPNumber__numberWithUnsignedInt_(self, _cmd, anUnsignedInt)
{
    return anUnsignedInt;
}
,["id","unsigned"]), new objj_method(sel_getUid("numberWithUnsignedLong:"), function $CPNumber__numberWithUnsignedLong_(self, _cmd, anUnsignedLong)
{
    return anUnsignedLong;
}
,["id","unsigned long"]), new objj_method(sel_getUid("numberWithUnsignedShort:"), function $CPNumber__numberWithUnsignedShort_(self, _cmd, anUnsignedShort)
{
    return anUnsignedShort;
}
,["id","unsigned short"])]);
}{
var the_class = objj_getClass("CPNumber")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPNumber\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPNumber__initWithCoder_(self, _cmd, aCoder)
{
    return (aCoder == null ? null : aCoder.isa.objj_msgSend0(aCoder, "decodeNumber"));
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPNumber__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeNumber:forKey:", self, "self"));
}
,["void","CPCoder"])]);
}Number.prototype.isa = CPNumber;
Boolean.prototype.isa = CPNumber;
CPNumber.isa.objj_msgSend0(CPNumber, "initialize");
