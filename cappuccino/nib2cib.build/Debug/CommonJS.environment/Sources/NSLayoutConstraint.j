@STATIC;1.0;I;21;Foundation/CPObject.jI;24;Foundation/CPException.jt;843;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPException.j", NO);{var the_class = objj_allocateClassPair(CPObject, "NSLayoutConstraint"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSLayoutConstraint__initWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(CPException, "raise:format:", "nib2cibException", "Autolayout is not yet supported. Turn \"Use Auto Layout\" off in the File Inspector of %@.", objj_msgSend(objj_msgSend(objj_msgSend(Converter, "sharedConverter"), "inputPath"), "lastPathComponent"));
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSLayoutConstraint__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPObject, "class");
}
,["Class"])]);
}