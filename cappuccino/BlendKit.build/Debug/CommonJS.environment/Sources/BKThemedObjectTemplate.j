@STATIC;1.0;I;15;AppKit/CPView.jt;1307;objj_executeFile("AppKit/CPView.j", NO);{var the_class = objj_allocateClassPair(CPView, "BKThemedObjectTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_label"), new objj_ivar("_themedObject")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $BKThemedObjectTemplate__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("BKThemedObjectTemplate").super_class }, "init");
    if (self)
    {
        self._label = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "BKThemedObjectTemplateLabel"));
        self._themedObject = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "BKThemedObjectTemplateThemedObject"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $BKThemedObjectTemplate__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._label, "BKThemedObjectTemplateLabel"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._themedObject, "BKThemedObjectTemplateThemedObject"));
}
,["void","CPCoder"])]);
}