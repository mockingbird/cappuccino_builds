@STATIC;1.0;I;21;Foundation/CPObject.jt;2488;objj_executeFile("Foundation/CPObject.j", NO);var CPControllerDeclaredKeysKey = "CPControllerDeclaredKeysKey";
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
    if (objj_msgSend(self._declaredKeys, "count") > 0)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._declaredKeys, CPControllerDeclaredKeysKey);
}
,["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $CPController__initWithCoder_(self, _cmd, aDecoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPController").super_class }, "init");
    if (self)
    {
        self._editors = [];
        self._declaredKeys = objj_msgSend(aDecoder, "decodeObjectForKey:", CPControllerDeclaredKeysKey) || [];
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("isEditing"), function $CPController__isEditing(self, _cmd)
{
    return objj_msgSend(self._editors, "count") > 0;
}
,["BOOL"]), new objj_method(sel_getUid("commitEditing"), function $CPController__commitEditing(self, _cmd)
{
    var index = 0,
        count = self._editors.length;
    for (; index < count; ++index)
        if (!objj_msgSend(objj_msgSend(self._editors, "objectAtIndex:", index), "commitEditing"))
            return NO;
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("discardEditing"), function $CPController__discardEditing(self, _cmd)
{
    objj_msgSend(self._editors, "makeObjectsPerformSelector:", sel_getUid("discardEditing"));
}
,["void"]), new objj_method(sel_getUid("objectDidBeginEditing:"), function $CPController__objectDidBeginEditing_(self, _cmd, anEditor)
{
    objj_msgSend(self._editors, "addObject:", anEditor);
}
,["void","id"]), new objj_method(sel_getUid("objectDidEndEditing:"), function $CPController__objectDidEndEditing_(self, _cmd, anEditor)
{
    objj_msgSend(self._editors, "removeObject:", anEditor);
}
,["void","id"])]);
}