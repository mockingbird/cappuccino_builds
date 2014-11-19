@STATIC;1.0;I;33;Foundation/CPByteCountFormatter.jt;2242;objj_executeFile("Foundation/CPByteCountFormatter.j", NO);{
var the_class = objj_getClass("CPByteCountFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPByteCountFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPByteCountFormatter__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPByteCountFormatter").super_class }, "init");
    if (self)
    {
        self._countStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSKBSize")) || 0;
        self._allowsNonnumericFormatting = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSNoNonnumeric"));
        self._includesActualByteCount = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSActual"));
        self._includesCount = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSNoCount"));
        self._includesUnit = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSNoUnit"));
        self._adaptive = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSNoAdaptive"));
        self._zeroPadsFractionDigits = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSZeroPad"));
        self._allowedUnits = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSUnits")) || 0;
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPByteCountFormatter, "NSByteCountFormatter"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSByteCountFormatter__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSByteCountFormatter__classForKeyedArchiver(self, _cmd)
{
    return CPByteCountFormatter.isa.objj_msgSend0(CPByteCountFormatter, "class");
}
,["Class"])]);
}