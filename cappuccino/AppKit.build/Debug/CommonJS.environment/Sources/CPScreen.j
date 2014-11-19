@STATIC;1.0;I;21;Foundation/CPObject.jt;339;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "CPScreen"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("visibleFrame"), function $CPScreen__visibleFrame(self, _cmd)
{
    return CGRectMakeZero();
}
,["CGRect"])]);
}