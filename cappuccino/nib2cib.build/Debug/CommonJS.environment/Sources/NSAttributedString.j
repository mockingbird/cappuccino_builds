@STATIC;1.0;I;21;Foundation/CPObject.jI;31;Foundation/CPAttributedString.jt;683;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPAttributedString.j", NO);




{var the_class = objj_allocateClassPair(CPAttributedString, "NSAttributedString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSAttributedString__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
     return objj_msgSend(objj_msgSend(CPAttributedString, "alloc"), "initWithString:", "");
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(NSAttributedString, "NSMutableAttributedString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}

