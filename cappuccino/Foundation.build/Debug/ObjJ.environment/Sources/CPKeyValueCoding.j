@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;12;CPIndexSet.ji;8;CPNull.ji;10;CPObject.ji;7;CPSet.ji;21;CPKeyValueObserving.jt;17750;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPIndexSet.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPSet.j", YES);CPUndefinedKeyException = "CPUndefinedKeyException";
CPTargetObjectUserInfoKey = "CPTargetObjectUserInfoKey";
CPUnknownUserInfoKey = "CPUnknownUserInfoKey";
var CPObjectAccessorsForClassKey = "$CPObjectAccessorsForClassKey",
    CPObjectModifiersForClassKey = "$CPObjectModifiersForClassKey";
{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueForKey:"), function $CPObject__valueForKey_(self, _cmd, aKey)
{
    var theClass = self.isa.objj_msgSend0(self, "class"),
        accessor = nil,
        accessors = theClass[CPObjectAccessorsForClassKey];
    if (!accessors)
        accessors = theClass[CPObjectAccessorsForClassKey] = {};
    if (accessors.hasOwnProperty(aKey))
        accessor = accessors[aKey];
    else
    {
        var string = nil,
            capitalizedKey = (aKey.charAt(0)).toUpperCase() + aKey.substr(1),
            underscoreKey = nil,
            isKey = nil;
        if ((theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", string = sel_getUid("get" + capitalizedKey))) || (theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", string = sel_getUid(aKey))) || (theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", string = sel_getUid(isKey = "is" + capitalizedKey))) || (theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", string = sel_getUid("_get" + capitalizedKey))) || (theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", string = sel_getUid(underscoreKey = "_" + aKey))) || (theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", string = sel_getUid("_" + isKey))))
            accessor = accessors[aKey] = [0, string];
        else if ((theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", sel_getUid("countOf" + capitalizedKey))))
        {
            if ((theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", sel_getUid("objectIn" + capitalizedKey + "AtIndex:"))) || (theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", sel_getUid(aKey + "AtIndexes:"))))
                accessor = accessors[aKey] = [1];
            else if ((theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", sel_getUid("enumeratorOf" + capitalizedKey))) && (theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", sel_getUid("memberOf" + capitalizedKey + ":"))))
                accessor = accessors[aKey] = [2];
        }
        if (!accessor)
        {
            if (class_getInstanceVariable(theClass, string = underscoreKey) || class_getInstanceVariable(theClass, string = "_" + isKey) || class_getInstanceVariable(theClass, string = aKey) || class_getInstanceVariable(theClass, string = isKey))
                accessor = accessors[aKey] = [3, string];
            else
                accessor = accessors[aKey] = [];
        }
    }
    switch(accessor[0]) {
    case 0:
        return self.isa.objj_msgSend0(self, accessor[1]);
    case 1:
        return ((___r1 = (_CPKeyValueCodingArray == null ? null : _CPKeyValueCodingArray.isa.objj_msgSend0(_CPKeyValueCodingArray, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithTarget:key:", self, aKey));
    case 2:
        return ((___r1 = (_CPKeyValueCodingSet == null ? null : _CPKeyValueCodingSet.isa.objj_msgSend0(_CPKeyValueCodingSet, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithTarget:key:", self, aKey));
    case 3:
        if ((theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "accessInstanceVariablesDirectly")))
            return self[accessor[1]];
    }
    return self.isa.objj_msgSend1(self, "valueForUndefinedKey:", aKey);
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("valueForKeyPath:"), function $CPObject__valueForKeyPath_(self, _cmd, aKeyPath)
{
    var firstDotIndex = aKeyPath.indexOf(".");
    if (firstDotIndex === CPNotFound)
        return self.isa.objj_msgSend1(self, "valueForKey:", aKeyPath);
    var firstKeyComponent = aKeyPath.substring(0, firstDotIndex),
        remainingKeyPath = aKeyPath.substring(firstDotIndex + 1),
        value = self.isa.objj_msgSend1(self, "valueForKey:", firstKeyComponent);
    return (value == null ? null : value.isa.objj_msgSend1(value, "valueForKeyPath:", remainingKeyPath));
}
,["id","CPString"]), new objj_method(sel_getUid("dictionaryWithValuesForKeys:"), function $CPObject__dictionaryWithValuesForKeys_(self, _cmd, keys)
{
    var index = 0,
        count = keys.length,
        dictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    for (; index < count; ++index)
    {
        var key = keys[index],
            value = self.isa.objj_msgSend1(self, "valueForKey:", key);
        if (value === nil)
            (dictionary == null ? null : dictionary.isa.objj_msgSend2(dictionary, "setObject:forKey:", CPNull.isa.objj_msgSend0(CPNull, "null"), key));
        else
            (dictionary == null ? null : dictionary.isa.objj_msgSend2(dictionary, "setObject:forKey:", value, key));
    }
    return dictionary;
}
,["CPDictionary","CPArray"]), new objj_method(sel_getUid("valueForUndefinedKey:"), function $CPObject__valueForUndefinedKey_(self, _cmd, aKey)
{
    ((___r1 = CPException.isa.objj_msgSend3(CPException, "exceptionWithName:reason:userInfo:", CPUndefinedKeyException, self.isa.objj_msgSend0(self, "_objectDescription") + " is not key value coding-compliant for the key " + aKey, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self, CPTargetObjectUserInfoKey, aKey, CPUnknownUserInfoKey))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "raise"));
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forKeyPath:"), function $CPObject__setValue_forKeyPath_(self, _cmd, aValue, aKeyPath)
{
    if (!aKeyPath)
        aKeyPath = "self";
    var firstDotIndex = aKeyPath.indexOf(".");
    if (firstDotIndex === CPNotFound)
        return self.isa.objj_msgSend2(self, "setValue:forKey:", aValue, aKeyPath);
    var firstKeyComponent = aKeyPath.substring(0, firstDotIndex),
        remainingKeyPath = aKeyPath.substring(firstDotIndex + 1),
        value = self.isa.objj_msgSend1(self, "valueForKey:", firstKeyComponent);
    return (value == null ? null : value.isa.objj_msgSend2(value, "setValue:forKeyPath:", aValue, remainingKeyPath));
}
,["void","id","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPObject__setValue_forKey_(self, _cmd, aValue, aKey)
{
    if (aValue && aValue.isa && (aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "isKindOfClass:", CPValue)))
        aValue = (aValue == null ? null : aValue.isa.objj_msgSend0(aValue, "JSObject"));
    var theClass = self.isa.objj_msgSend0(self, "class"),
        modifier = nil,
        modifiers = theClass[CPObjectModifiersForClassKey];
    if (!modifiers)
        modifiers = theClass[CPObjectModifiersForClassKey] = {};
    if (modifiers.hasOwnProperty(aKey))
        modifier = modifiers[aKey];
    else
    {
        var string = nil,
            capitalizedKey = (aKey.charAt(0)).toUpperCase() + aKey.substr(1),
            isKey = nil;
        if ((theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", string = sel_getUid("set" + capitalizedKey + ":"))) || (theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instancesRespondToSelector:", string = sel_getUid("_set" + capitalizedKey + ":"))))
            modifier = modifiers[aKey] = [0, string];
        else if (class_getInstanceVariable(theClass, string = "_" + aKey) || class_getInstanceVariable(theClass, string = "_" + (isKey = "is" + capitalizedKey)) || class_getInstanceVariable(theClass, string = aKey) || class_getInstanceVariable(theClass, string = isKey))
            modifier = modifiers[aKey] = [1, string];
        else
            modifier = modifiers[aKey] = [];
    }
    switch(modifier[0]) {
    case 0:
        return self.isa.objj_msgSend1(self, modifier[1], aValue);
    case 1:
        if ((theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "accessInstanceVariablesDirectly")))
        {
            self.isa.objj_msgSend1(self, "willChangeValueForKey:", aKey);
            self[modifier[1]] = aValue;
            return self.isa.objj_msgSend1(self, "didChangeValueForKey:", aKey);
        }
    }
    return self.isa.objj_msgSend2(self, "setValue:forUndefinedKey:", aValue, aKey);
}
,["void","id","CPString"]), new objj_method(sel_getUid("setValuesForKeysWithDictionary:"), function $CPObject__setValuesForKeysWithDictionary_(self, _cmd, keyedValues)
{
    var value,
        key,
        keyEnumerator = (keyedValues == null ? null : keyedValues.isa.objj_msgSend0(keyedValues, "keyEnumerator"));
    while ((key = (keyEnumerator == null ? null : keyEnumerator.isa.objj_msgSend0(keyEnumerator, "nextObject"))) !== nil)
    {
        value = (keyedValues == null ? null : keyedValues.isa.objj_msgSend1(keyedValues, "objectForKey:", key));
        if (value === CPNull.isa.objj_msgSend0(CPNull, "null"))
            self.isa.objj_msgSend2(self, "setValue:forKey:", nil, key);
        else
            self.isa.objj_msgSend2(self, "setValue:forKey:", value, key);
    }
}
,["void","CPDictionary"]), new objj_method(sel_getUid("setValue:forUndefinedKey:"), function $CPObject__setValue_forUndefinedKey_(self, _cmd, aValue, aKey)
{
    ((___r1 = CPException.isa.objj_msgSend3(CPException, "exceptionWithName:reason:userInfo:", CPUndefinedKeyException, self.isa.objj_msgSend0(self, "_objectDescription") + " is not key value coding-compliant for the key " + aKey, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self, CPTargetObjectUserInfoKey, aKey, CPUnknownUserInfoKey))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "raise"));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("_objectDescription"), function $CPObject___objectDescription(self, _cmd)
{
    return "<" + self.isa.objj_msgSend0(self, "className") + " 0x" + CPString.isa.objj_msgSend1(CPString, "stringWithHash:", self.isa.objj_msgSend0(self, "UID")) + ">";
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("accessInstanceVariablesDirectly"), function $CPObject__accessInstanceVariablesDirectly(self, _cmd)
{
    return YES;
}
,["BOOL"])]);
}{
var the_class = objj_getClass("CPDictionary")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueForKey:"), function $CPDictionary__valueForKey_(self, _cmd, aKey)
{
    if ((aKey == null ? null : aKey.isa.objj_msgSend1(aKey, "hasPrefix:", "@")))
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDictionary").super_class }, "valueForKey:", aKey.substr(1));
    return self.isa.objj_msgSend1(self, "objectForKey:", aKey);
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPDictionary__setValue_forKey_(self, _cmd, aValue, aKey)
{
    if (aValue !== nil)
        self.isa.objj_msgSend2(self, "setObject:forKey:", aValue, aKey);
    else
        self.isa.objj_msgSend1(self, "removeObjectForKey:", aKey);
}
,["void","id","CPString"])]);
}{
var the_class = objj_getClass("CPNull")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPNull\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueForKey:"), function $CPNull__valueForKey_(self, _cmd, aKey)
{
    return self;
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(CPArray, "_CPKeyValueCodingArray"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_target"), new objj_ivar("_countOfSelector"), new objj_ivar("_objectInAtIndexSelector"), new objj_ivar("_atIndexesSelector")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTarget:key:"), function $_CPKeyValueCodingArray__initWithTarget_key_(self, _cmd, aTarget, aKey)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKeyValueCodingArray").super_class }, "init");
    if (self)
    {
        var capitalizedKey = (aKey.charAt(0)).toUpperCase() + aKey.substr(1);
        self._target = aTarget;
        self._countOfSelector = CPSelectorFromString("countOf" + capitalizedKey);
        self._objectInAtIndexSelector = CPSelectorFromString("objectIn" + capitalizedKey + "AtIndex:");
        if (!((___r1 = self._target), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._objectInAtIndexSelector)))
            self._objectInAtIndexSelector = nil;
        self._atIndexesSelector = CPSelectorFromString(aKey + "AtIndexes:");
        if (!((___r1 = self._target), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._atIndexesSelector)))
            self._atIndexesSelector = nil;
    }
    return self;
    var ___r1;
}
,["id","id","CPString"]), new objj_method(sel_getUid("count"), function $_CPKeyValueCodingArray__count(self, _cmd)
{
    return self._target == nil ? nil : self._target.isa.objj_msgSend0(self._target, self._countOfSelector);
}
,["CPUInteger"]), new objj_method(sel_getUid("objectAtIndex:"), function $_CPKeyValueCodingArray__objectAtIndex_(self, _cmd, anIndex)
{
    if (self._objectInAtIndexSelector)
        return self._target == nil ? nil : self._target.isa.objj_msgSend1(self._target, self._objectInAtIndexSelector, anIndex);
    return self._target == nil ? nil : (self._target.isa.objj_msgSend1(self._target, self._atIndexesSelector, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex)))[0];
}
,["id","CPUInteger"]), new objj_method(sel_getUid("objectsAtIndexes:"), function $_CPKeyValueCodingArray__objectsAtIndexes_(self, _cmd, indexes)
{
    if (self._atIndexesSelector)
        return self._target == nil ? nil : self._target.isa.objj_msgSend1(self._target, self._atIndexesSelector, indexes);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKeyValueCodingArray").super_class }, "objectsAtIndexes:", indexes);
}
,["CPArray","CPIndexSet"]), new objj_method(sel_getUid("classForCoder"), function $_CPKeyValueCodingArray__classForCoder(self, _cmd)
{
    return CPArray.isa.objj_msgSend0(CPArray, "class");
}
,["Class"]), new objj_method(sel_getUid("copy"), function $_CPKeyValueCodingArray__copy(self, _cmd)
{
    return CPArray.isa.objj_msgSend1(CPArray, "arrayWithArray:", self);
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPSet, "_CPKeyValueCodingSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_target"), new objj_ivar("_countOfSelector"), new objj_ivar("_enumeratorOfSelector"), new objj_ivar("_memberOfSelector")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithObjects:count:"), function $_CPKeyValueCodingSet__initWithObjects_count_(self, _cmd, objects, aCount)
{
    return ((___r1 = CPSet.isa.objj_msgSend0(CPSet, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithObjects:count:", objects, aCount));
    var ___r1;
}
,["id","CPArray","CPUInteger"]), new objj_method(sel_getUid("initWithTarget:key:"), function $_CPKeyValueCodingSet__initWithTarget_key_(self, _cmd, aTarget, aKey)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKeyValueCodingSet").super_class }, "initWithObjects:count:", nil, 0);
    if (self)
    {
        var capitalizedKey = (aKey.charAt(0)).toUpperCase() + aKey.substr(1);
        self._target = aTarget;
        self._countOfSelector = CPSelectorFromString("countOf" + capitalizedKey);
        self._enumeratorOfSelector = CPSelectorFromString("enumeratorOf" + capitalizedKey);
        self._memberOfSelector = CPSelectorFromString("memberOf" + capitalizedKey + ":");
    }
    return self;
}
,["id","id","CPString"]), new objj_method(sel_getUid("count"), function $_CPKeyValueCodingSet__count(self, _cmd)
{
    return self._target == nil ? nil : self._target.isa.objj_msgSend0(self._target, self._countOfSelector);
}
,["CPUInteger"]), new objj_method(sel_getUid("objectEnumerator"), function $_CPKeyValueCodingSet__objectEnumerator(self, _cmd)
{
    return self._target == nil ? nil : self._target.isa.objj_msgSend0(self._target, self._enumeratorOfSelector);
}
,["CPEnumerator"]), new objj_method(sel_getUid("member:"), function $_CPKeyValueCodingSet__member_(self, _cmd, anObject)
{
    return self._target == nil ? nil : self._target.isa.objj_msgSend1(self._target, self._memberOfSelector, anObject);
}
,["id","id"]), new objj_method(sel_getUid("classForCoder"), function $_CPKeyValueCodingSet__classForCoder(self, _cmd)
{
    return CPSet.isa.objj_msgSend0(CPSet, "class");
}
,["Class"]), new objj_method(sel_getUid("copy"), function $_CPKeyValueCodingSet__copy(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithSet:", self);
}
,["id"])]);
}objj_executeFile("CPKeyValueObserving.j", YES);