@STATIC;1.0;I;21;Foundation/CPObject.jI;18;Foundation/CPSet.jt;741;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPSet.j", NO);{var the_class = objj_allocateClassPair(CPObject, "NSSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSet__initWithCoder_(self, _cmd, aCoder)
{
    return ((___r1 = CPSet.isa.objj_msgSend0(CPSet, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithArray:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NS.objects"))));
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(NSSet, "NSMutableSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}