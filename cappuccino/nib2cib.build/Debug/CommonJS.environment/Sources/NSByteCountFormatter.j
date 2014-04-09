@STATIC;1.0;I;33;Foundation/CPByteCountFormatter.jt;1902;objj_executeFile("Foundation/CPByteCountFormatter.j", NO);{
var the_class = objj_getClass("CPByteCountFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPByteCountFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPByteCountFormatter__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPByteCountFormatter").super_class }, "init");
    if (self)
    {
        self._countStyle = objj_msgSend(aCoder, "decodeIntForKey:", "NSKBSize") || 0;
        self._allowsNonnumericFormatting = !objj_msgSend(aCoder, "containsValueForKey:", "NSNoNonnumeric");
        self._includesActualByteCount = objj_msgSend(aCoder, "containsValueForKey:", "NSActual");
        self._includesCount = !objj_msgSend(aCoder, "containsValueForKey:", "NSNoCount");
        self._includesUnit = !objj_msgSend(aCoder, "containsValueForKey:", "NSNoUnit");
        self._adaptive = !objj_msgSend(aCoder, "containsValueForKey:", "NSNoAdaptive");
        self._zeroPadsFractionDigits = objj_msgSend(aCoder, "containsValueForKey:", "NSZeroPad");
        self._allowedUnits = objj_msgSend(aCoder, "decodeIntForKey:", "NSUnits") || 0;
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPByteCountFormatter, "NSByteCountFormatter"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSByteCountFormatter__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSByteCountFormatter__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPByteCountFormatter, "class");
}
,["Class"])]);
}