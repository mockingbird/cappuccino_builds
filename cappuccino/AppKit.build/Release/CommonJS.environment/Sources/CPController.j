@STATIC;1.0;I;21;Foundation/CPObject.jt;3036;objj_executeFile("Foundation/CPObject.j", NO);var CPControllerDeclaredKeysKey = "CPControllerDeclaredKeysKey";
{var the_class = objj_allocateClassPair(CPObject, "CPController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_editors"), new objj_ivar("_declaredKeys")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPController").super_class }, "init");
    if (self)
    {
        self._editors = [];
        self._declaredKeys = [];
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPController__encodeWithCoder_(self, _cmd, aCoder)
{
    if (((___r1 = self._declaredKeys), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._declaredKeys, CPControllerDeclaredKeysKey));
    var ___r1;
}
,["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $CPController__initWithCoder_(self, _cmd, aDecoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPController").super_class }, "init");
    if (self)
    {
        self._editors = [];
        self._declaredKeys = (aDecoder == null ? null : aDecoder.isa.objj_msgSend1(aDecoder, "decodeObjectForKey:", CPControllerDeclaredKeysKey)) || [];
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("isEditing"), function $CPController__isEditing(self, _cmd)
{
    return ((___r1 = self._editors), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("commitEditing"), function $CPController__commitEditing(self, _cmd)
{
    var index = 0,
        count = self._editors.length;
    for (; index < count; ++index)
        if (!((___r1 = ((___r2 = self._editors), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", index))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "commitEditing")))
            return NO;
    return YES;
    var ___r1, ___r2;
}
,["BOOL"]), new objj_method(sel_getUid("discardEditing"), function $CPController__discardEditing(self, _cmd)
{
    ((___r1 = self._editors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeObjectsPerformSelector:", sel_getUid("discardEditing")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("objectDidBeginEditing:"), function $CPController__objectDidBeginEditing_(self, _cmd, anEditor)
{
    ((___r1 = self._editors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", anEditor));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("objectDidEndEditing:"), function $CPController__objectDidEndEditing_(self, _cmd, anEditor)
{
    ((___r1 = self._editors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", anEditor));
    var ___r1;
}
,["void","id"])]);
}