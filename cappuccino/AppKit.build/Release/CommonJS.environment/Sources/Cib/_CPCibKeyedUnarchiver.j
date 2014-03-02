@STATIC;1.0;I;30;Foundation/CPKeyedUnarchiver.jt;2261;objj_executeFile("Foundation/CPKeyedUnarchiver.j", NO);{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "_CPCibKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle"), new objj_ivar("_awakenCustomResources"), new objj_ivar("_externalObjectsForProxyIdentifiers")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:bundle:awakenCustomResources:"), function $_CPCibKeyedUnarchiver__initForReadingWithData_bundle_awakenCustomResources_(self, _cmd, data, aBundle, shouldAwakenCustomResources)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibKeyedUnarchiver").super_class }, "initForReadingWithData:", data);
    if (self)
    {
        self._bundle = aBundle;
        self._awakenCustomResources = shouldAwakenCustomResources;
        objj_msgSend(self, "setDelegate:", self);
    }
    return self;
}
,["id","CPData","CPBundle","BOOL"]), new objj_method(sel_getUid("bundle"), function $_CPCibKeyedUnarchiver__bundle(self, _cmd)
{
    return self._bundle;
}
,["CPBundle"]), new objj_method(sel_getUid("awakenCustomResources"), function $_CPCibKeyedUnarchiver__awakenCustomResources(self, _cmd)
{
    return self._awakenCustomResources;
}
,["BOOL"]), new objj_method(sel_getUid("setExternalObjectsForProxyIdentifiers:"), function $_CPCibKeyedUnarchiver__setExternalObjectsForProxyIdentifiers_(self, _cmd, externalObjectsForProxyIdentifiers)
{
    self._externalObjectsForProxyIdentifiers = externalObjectsForProxyIdentifiers;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("externalObjectForProxyIdentifier:"), function $_CPCibKeyedUnarchiver__externalObjectForProxyIdentifier_(self, _cmd, anIdentifier)
{
    return objj_msgSend(self._externalObjectsForProxyIdentifiers, "objectForKey:", anIdentifier);
}
,["id","CPString"]), new objj_method(sel_getUid("replaceObjectAtUID:withObject:"), function $_CPCibKeyedUnarchiver__replaceObjectAtUID_withObject_(self, _cmd, aUID, anObject)
{
    self._objects[aUID] = anObject;
}
,["void","int","id"]), new objj_method(sel_getUid("objectAtUID:"), function $_CPCibKeyedUnarchiver__objectAtUID_(self, _cmd, aUID)
{
    return self._objects[aUID];
}
,["id","int"])]);
}