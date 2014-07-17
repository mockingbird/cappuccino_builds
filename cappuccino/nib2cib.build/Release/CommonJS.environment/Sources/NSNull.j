@STATIC;1.0;I;19;Foundation/CPNull.jt;549;objj_executeFile("Foundation/CPNull.j", NO);{var the_class = objj_allocateClassPair(CPNull, "NSNull"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSNull__initWithCoder_(self, _cmd, aCoder)
{
    return CPNull.isa.objj_msgSend0(CPNull, "null");
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSNull__classForKeyedArchiver(self, _cmd)
{
    return CPNull.isa.objj_msgSend0(CPNull, "class");
}
,["Class"])]);
}