@STATIC;1.0;I;21;Foundation/CPObject.jI;31;Foundation/CPAttributedString.jt;750;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPAttributedString.j", NO);{var the_class = objj_allocateClassPair(CPAttributedString, "NSAttributedString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSAttributedString__initWithCoder_(self, _cmd, aCoder)
{
    return ((___r1 = CPAttributedString.isa.objj_msgSend0(CPAttributedString, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithString:", ""));
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(NSAttributedString, "NSMutableAttributedString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}