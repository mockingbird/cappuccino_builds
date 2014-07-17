@STATIC;1.0;I;19;Foundation/CPDate.jt;712;objj_executeFile("Foundation/CPDate.j", NO);{var the_class = objj_allocateClassPair(CPDate, "NSDate"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSDate__initWithCoder_(self, _cmd, aCoder)
{
    var interval = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", "NS.time")) || 0;
    return CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceReferenceDate:", interval);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSDate__classForKeyedArchiver(self, _cmd)
{
    return CPDate.isa.objj_msgSend0(CPDate, "class");
}
,["Class"])]);
}