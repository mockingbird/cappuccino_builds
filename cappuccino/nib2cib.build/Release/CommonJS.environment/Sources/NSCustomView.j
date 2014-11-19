@STATIC;1.0;I;25;AppKit/_CPCibCustomView.ji;8;NSView.jt;1400;objj_executeFile("AppKit/_CPCibCustomView.j", NO);objj_executeFile("NSView.j", YES);var _CPCibCustomViewClassNameKey = "_CPCibCustomViewClassNameKey";
{var the_class = objj_allocateClassPair(CPView, "NSCustomView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSCustomView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSCustomView").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
        self._className = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSClassName"));
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $NSCustomView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSCustomView").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", CP_NSMapClassName(self._className), _CPCibCustomViewClassNameKey));
}
,["void","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSCustomView__classForKeyedArchiver(self, _cmd)
{
    return _CPCibCustomView.isa.objj_msgSend0(_CPCibCustomView, "class");
}
,["Class"])]);
}