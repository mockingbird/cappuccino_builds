@STATIC;1.0;i;10;CPObject.ji;15;CPObjJRuntime.ji;10;CPString.jt;4621;objj_executeFile("CPObject.j", YES);objj_executeFile("CPObjJRuntime.j", YES);objj_executeFile("CPString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPSortDescriptor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_key"), new objj_ivar("_selector"), new objj_ivar("_ascending")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKey:ascending:"), function $CPSortDescriptor__initWithKey_ascending_(self, _cmd, aKey, isAscending)
{
    return objj_msgSend(self, "initWithKey:ascending:selector:", aKey, isAscending, sel_getUid("compare:"));
}
,["id","CPString","BOOL"]), new objj_method(sel_getUid("initWithKey:ascending:selector:"), function $CPSortDescriptor__initWithKey_ascending_selector_(self, _cmd, aKey, isAscending, aSelector)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSortDescriptor").super_class }, "init");
    if (self)
    {
        self._key = aKey;
        self._ascending = isAscending;
        self._selector = aSelector;
    }
    return self;
}
,["id","CPString","BOOL","SEL"]), new objj_method(sel_getUid("ascending"), function $CPSortDescriptor__ascending(self, _cmd)
{
    return self._ascending;
}
,["BOOL"]), new objj_method(sel_getUid("key"), function $CPSortDescriptor__key(self, _cmd)
{
    return self._key;
}
,["CPString"]), new objj_method(sel_getUid("selector"), function $CPSortDescriptor__selector(self, _cmd)
{
    return self._selector;
}
,["SEL"]), new objj_method(sel_getUid("compareObject:withObject:"), function $CPSortDescriptor__compareObject_withObject_(self, _cmd, lhsObject, rhsObject)
{
    return (self._ascending ? 1 : -1) * objj_msgSend(objj_msgSend(lhsObject, "valueForKeyPath:", self._key), "performSelector:withObject:", self._selector, objj_msgSend(rhsObject, "valueForKeyPath:", self._key));
}
,["CPComparisonResult","id","id"]), new objj_method(sel_getUid("reversedSortDescriptor"), function $CPSortDescriptor__reversedSortDescriptor(self, _cmd)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithKey:ascending:selector:", self._key, !self._ascending, self._selector);
}
,["id"]), new objj_method(sel_getUid("description"), function $CPSortDescriptor__description(self, _cmd)
{
    return objj_msgSend(CPString, "stringWithFormat:", "(%@, %@, %@)", objj_msgSend(self, "key"), objj_msgSend(self, "ascending") ? "ascending" : "descending", CPStringFromSelector(objj_msgSend(self, "selector")));
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sortDescriptorWithKey:ascending:"), function $CPSortDescriptor__sortDescriptorWithKey_ascending_(self, _cmd, aKey, isAscending)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithKey:ascending:", aKey, isAscending);
}
,["id","CPString","BOOL"]), new objj_method(sel_getUid("sortDescriptorWithKey:ascending:selector:"), function $CPSortDescriptor__sortDescriptorWithKey_ascending_selector_(self, _cmd, aKey, isAscending, aSelector)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithKey:ascending:selector:", aKey, isAscending, aSelector);
}
,["id","CPString","BOOL","SEL"])]);
}var CPSortDescriptorKeyKey = "CPSortDescriptorKeyKey",
    CPSortDescriptorAscendingKey = "CPSortDescriptorAscendingKey",
    CPSortDescriptorSelectorKey = "CPSortDescriptorSelectorKey";
{
var the_class = objj_getClass("CPSortDescriptor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSortDescriptor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPSortDescriptor__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSortDescriptor").super_class }, "init"))
    {
        self._key = objj_msgSend(aCoder, "decodeObjectForKey:", CPSortDescriptorKeyKey);
        self._ascending = objj_msgSend(aCoder, "decodeBoolForKey:", CPSortDescriptorAscendingKey);
        self._selector = CPSelectorFromString(objj_msgSend(aCoder, "decodeObjectForKey:", CPSortDescriptorSelectorKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSortDescriptor__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._key, CPSortDescriptorKeyKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._ascending, CPSortDescriptorAscendingKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", CPStringFromSelector(self._selector), CPSortDescriptorSelectorKey);
}
,["void","CPCoder"])]);
}