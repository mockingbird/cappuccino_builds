@STATIC;1.0;I;21;Foundation/CPObject.jt;411;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "NSMutableString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSMutableString__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(aCoder, "decodeObjectForKey:", "NS.string");
}
,["id","CPCoder"])]);
}