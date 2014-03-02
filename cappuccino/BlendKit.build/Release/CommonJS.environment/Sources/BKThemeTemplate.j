@STATIC;1.0;I;21;Foundation/CPObject.jt;1097;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "BKThemeTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_description")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $BKThemeTemplate__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("BKThemeTemplate").super_class }, "init");
    if (self)
    {
        self._name = objj_msgSend(aCoder, "decodeObjectForKey:", "BKThemeTemplateName");
        self._description = objj_msgSend(aCoder, "decodeObjectForKey:", "BKThemeTemplateDescription");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $BKThemeTemplate__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._name, "BKThemeTemplateName");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._description, "BKThemeTemplateDescription");
}
,["void","CPCoder"])]);
}