@STATIC;1.0;I;21;Foundation/CPObject.jI;24;Foundation/CPException.jt;1046;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPException.j", NO);{var the_class = objj_allocateClassPair(CPObject, "NSLayoutConstraint"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSLayoutConstraint__initWithCoder_(self, _cmd, aCoder)
{
    CPException.isa.objj_msgSend3(CPException, "raise:format:", "nib2cibException", "Autolayout is not yet supported. Turn \"Use Auto Layout\" off in the File Inspector of %@.", ((___r1 = ((___r2 = (Converter == null ? null : Converter.isa.objj_msgSend0(Converter, "sharedConverter"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "inputPath"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastPathComponent")));
    var ___r1, ___r2;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSLayoutConstraint__classForKeyedArchiver(self, _cmd)
{
    return CPObject.isa.objj_msgSend0(CPObject, "class");
}
,["Class"])]);
}