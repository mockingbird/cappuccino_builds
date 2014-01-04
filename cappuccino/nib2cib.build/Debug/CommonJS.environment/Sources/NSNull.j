@STATIC;1.0;I;19;Foundation/CPNull.jt;557;objj_executeFile("Foundation/CPNull.j", NO);

{var the_class = objj_allocateClassPair(CPNull, "NSNull"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSNull__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(CPNull, "null");
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSNull__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPNull, "class");
}
},["Class"])]);
}

