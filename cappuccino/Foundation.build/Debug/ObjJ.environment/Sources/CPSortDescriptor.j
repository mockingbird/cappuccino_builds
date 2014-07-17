@STATIC;1.0;i;10;CPObject.ji;15;CPObjJRuntime.ji;10;CPString.jt;5380;objj_executeFile("CPObject.j", YES);objj_executeFile("CPObjJRuntime.j", YES);objj_executeFile("CPString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPSortDescriptor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_key"), new objj_ivar("_selector"), new objj_ivar("_ascending")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKey:ascending:"), function $CPSortDescriptor__initWithKey_ascending_(self, _cmd, aKey, isAscending)
{
    return self.isa.objj_msgSend3(self, "initWithKey:ascending:selector:", aKey, isAscending, sel_getUid("compare:"));
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
    return (self._ascending ? 1 : -1) * ((___r1 = (lhsObject == null ? null : lhsObject.isa.objj_msgSend1(lhsObject, "valueForKeyPath:", self._key))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", self._selector, (rhsObject == null ? null : rhsObject.isa.objj_msgSend1(rhsObject, "valueForKeyPath:", self._key))));
    var ___r1;
}
,["CPComparisonResult","id","id"]), new objj_method(sel_getUid("reversedSortDescriptor"), function $CPSortDescriptor__reversedSortDescriptor(self, _cmd)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithKey:ascending:selector:", self._key, !self._ascending, self._selector));
    var ___r1, ___r2;
}
,["id"]), new objj_method(sel_getUid("description"), function $CPSortDescriptor__description(self, _cmd)
{
    return (CPString == null ? null : CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "(%@, %@, %@)", self.isa.objj_msgSend0(self, "key"), self.isa.objj_msgSend0(self, "ascending") ? "ascending" : "descending", CPStringFromSelector(self.isa.objj_msgSend0(self, "selector"))));
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sortDescriptorWithKey:ascending:"), function $CPSortDescriptor__sortDescriptorWithKey_ascending_(self, _cmd, aKey, isAscending)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithKey:ascending:", aKey, isAscending));
    var ___r1;
}
,["id","CPString","BOOL"]), new objj_method(sel_getUid("sortDescriptorWithKey:ascending:selector:"), function $CPSortDescriptor__sortDescriptorWithKey_ascending_selector_(self, _cmd, aKey, isAscending, aSelector)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithKey:ascending:selector:", aKey, isAscending, aSelector));
    var ___r1;
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
        self._key = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSortDescriptorKeyKey));
        self._ascending = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPSortDescriptorAscendingKey));
        self._selector = CPSelectorFromString((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSortDescriptorSelectorKey)));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSortDescriptor__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._key, CPSortDescriptorKeyKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._ascending, CPSortDescriptorAscendingKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", CPStringFromSelector(self._selector), CPSortDescriptorSelectorKey));
}
,["void","CPCoder"])]);
}