@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;12;CPIndexSet.ji;8;CPNull.ji;10;CPObject.ji;7;CPSet.ji;13;CPArray+KVO.ji;11;CPSet+KVO.jt;58341;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPIndexSet.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPSet.j", YES);{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("willChangeValueForKey:"), function $CPObject__willChangeValueForKey_(self, _cmd, aKey)
{
    if (!aKey)
        return;
    if (!self[KVOProxyKey])
    {
        if (!self._willChangeMessageCounter)
            self._willChangeMessageCounter = new Object();
        if (!self._willChangeMessageCounter[aKey])
            self._willChangeMessageCounter[aKey] = 1;
        else
            self._willChangeMessageCounter[aKey] += 1;
    }
}
,["void","CPString"]), new objj_method(sel_getUid("didChangeValueForKey:"), function $CPObject__didChangeValueForKey_(self, _cmd, aKey)
{
    if (!aKey)
        return;
    if (!self[KVOProxyKey])
    {
        if (self._willChangeMessageCounter && self._willChangeMessageCounter[aKey])
        {
            self._willChangeMessageCounter[aKey] -= 1;
            if (!self._willChangeMessageCounter[aKey])
                delete self._willChangeMessageCounter[aKey];
        }
        else
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", "CPKeyValueObservingException", "'didChange...' message called without prior call of 'willChange...'");
    }
}
,["void","CPString"]), new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"), function $CPObject__willChange_valuesAtIndexes_forKey_(self, _cmd, aChange, indexes, aKey)
{
    if (!aKey)
        return;
    if (!self[KVOProxyKey])
    {
        if (!self._willChangeMessageCounter)
            self._willChangeMessageCounter = new Object();
        if (!self._willChangeMessageCounter[aKey])
            self._willChangeMessageCounter[aKey] = 1;
        else
            self._willChangeMessageCounter[aKey] += 1;
    }
}
,["void","CPKeyValueChange","CPIndexSet","CPString"]), new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"), function $CPObject__didChange_valuesAtIndexes_forKey_(self, _cmd, aChange, indexes, aKey)
{
    if (!aKey)
        return;
    if (!self[KVOProxyKey])
    {
        if (self._willChangeMessageCounter && self._willChangeMessageCounter[aKey])
        {
            self._willChangeMessageCounter[aKey] -= 1;
            if (!self._willChangeMessageCounter[aKey])
                delete self._willChangeMessageCounter[aKey];
        }
        else
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", "CPKeyValueObservingException", "'didChange...' message called without prior call of 'willChange...'");
    }
}
,["void","CPKeyValueChange","CPIndexSet","CPString"]), new objj_method(sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"), function $CPObject__willChangeValueForKey_withSetMutation_usingObjects_(self, _cmd, aKey, aMutationKind, objects)
{
    if (!aKey)
        return;
    if (!self[KVOProxyKey])
    {
        if (!self._willChangeMessageCounter)
            self._willChangeMessageCounter = new Object();
        if (!self._willChangeMessageCounter[aKey])
            self._willChangeMessageCounter[aKey] = 1;
        else
            self._willChangeMessageCounter[aKey] += 1;
    }
}
,["void","CPString","CPKeyValueSetMutationKind","CPSet"]), new objj_method(sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"), function $CPObject__didChangeValueForKey_withSetMutation_usingObjects_(self, _cmd, aKey, aMutationKind, objects)
{
    if (!self[KVOProxyKey])
    {
        if (self._willChangeMessageCounter && self._willChangeMessageCounter[aKey])
        {
            self._willChangeMessageCounter[aKey] -= 1;
            if (!self._willChangeMessageCounter[aKey])
                delete self._willChangeMessageCounter[aKey];
        }
        else
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", "CPKeyValueObservingException", "'didChange...' message called without prior call of 'willChange...'");
    }
}
,["void","CPString","CPKeyValueSetMutationKind","CPSet"]), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function $CPObject__addObserver_forKeyPath_options_context_(self, _cmd, anObserver, aPath, options, aContext)
{
    if (!anObserver || !aPath)
        return;
    ((___r1 = (_CPKVOProxy == null ? null : _CPKVOProxy.isa.objj_msgSend1(_CPKVOProxy, "proxyForObject:", self))), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "_addObserver:forKeyPath:options:context:", anObserver, aPath, options, aContext));
    var ___r1;
}
,["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function $CPObject__removeObserver_forKeyPath_(self, _cmd, anObserver, aPath)
{
    if (!anObserver || !aPath)
        return;
    ((___r1 = self[KVOProxyKey]), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_removeObserver:forKeyPath:", anObserver, aPath));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("applyChange:toKeyPath:"), function $CPObject__applyChange_toKeyPath_(self, _cmd, aChange, aKeyPath)
{
    var changeKind = (aChange == null ? null : aChange.isa.objj_msgSend1(aChange, "objectForKey:", CPKeyValueChangeKindKey)),
        oldValue = (aChange == null ? null : aChange.isa.objj_msgSend1(aChange, "objectForKey:", CPKeyValueChangeOldKey)),
        newValue = (aChange == null ? null : aChange.isa.objj_msgSend1(aChange, "objectForKey:", CPKeyValueChangeNewKey));
    if (newValue === CPNull.isa.objj_msgSend0(CPNull, "null"))
        newValue = nil;
    if (changeKind === CPKeyValueChangeSetting)
        return self.isa.objj_msgSend2(self, "setValue:forKeyPath:", newValue, aKeyPath);
    var indexes = (aChange == null ? null : aChange.isa.objj_msgSend1(aChange, "objectForKey:", CPKeyValueChangeIndexesKey));
    if (indexes)
    {
        if (changeKind === CPKeyValueChangeInsertion)
            ((___r1 = self.isa.objj_msgSend1(self, "mutableArrayValueForKeyPath:", aKeyPath)), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObjects:atIndexes:", newValue, indexes));
        else if (changeKind === CPKeyValueChangeRemoval)
            ((___r1 = self.isa.objj_msgSend1(self, "mutableArrayValueForKeyPath:", aKeyPath)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectsAtIndexes:", indexes));
        else if (changeKind === CPKeyValueChangeReplacement)
            ((___r1 = self.isa.objj_msgSend1(self, "mutableArrayValueForKeyPath:", aKeyPath)), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "replaceObjectAtIndexes:withObjects:", indexes, newValue));
    }
    else
    {
        if (changeKind === CPKeyValueChangeInsertion)
            ((___r1 = self.isa.objj_msgSend1(self, "mutableSetValueForKeyPath:", aKeyPath)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unionSet:", newValue));
        else if (changeKind === CPKeyValueChangeRemoval)
            ((___r1 = self.isa.objj_msgSend1(self, "mutableSetValueForKeyPath:", aKeyPath)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "minusSet:", oldValue));
        else if (changeKind === CPKeyValueChangeReplacement)
            ((___r1 = self.isa.objj_msgSend1(self, "mutableSetValueForKeyPath:", aKeyPath)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSet:", newValue));
    }
    var ___r1;
}
,["void","CPDictionary","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"), function $CPObject__automaticallyNotifiesObserversForKey_(self, _cmd, aKey)
{
    var capitalizedKey = (aKey.charAt(0)).toUpperCase() + aKey.substring(1),
        selector = "automaticallyNotifiesObserversOf" + capitalizedKey;
    if (((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", selector)))
        return objj_msgSend(self.isa.objj_msgSend0(self, "class"), selector);
    return YES;
    var ___r1;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForKey:"), function $CPObject__keyPathsForValuesAffectingValueForKey_(self, _cmd, aKey)
{
    var capitalizedKey = (aKey.charAt(0)).toUpperCase() + aKey.substring(1),
        selector = "keyPathsForValuesAffecting" + capitalizedKey;
    if (((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", selector)))
        return objj_msgSend(self.isa.objj_msgSend0(self, "class"), selector);
    return CPSet.isa.objj_msgSend0(CPSet, "set");
    var ___r1;
}
,["CPSet","CPString"])]);
}{
var the_class = objj_getClass("CPDictionary")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("inverseChangeDictionary"), function $CPDictionary__inverseChangeDictionary(self, _cmd)
{
    var inverseChangeDictionary = self.isa.objj_msgSend0(self, "mutableCopy"),
        changeKind = self.isa.objj_msgSend1(self, "objectForKey:", CPKeyValueChangeKindKey);
    if (changeKind === CPKeyValueChangeSetting || changeKind === CPKeyValueChangeReplacement)
    {
        (inverseChangeDictionary == null ? null : inverseChangeDictionary.isa.objj_msgSend2(inverseChangeDictionary, "setObject:forKey:", self.isa.objj_msgSend1(self, "objectForKey:", CPKeyValueChangeOldKey), CPKeyValueChangeNewKey));
        (inverseChangeDictionary == null ? null : inverseChangeDictionary.isa.objj_msgSend2(inverseChangeDictionary, "setObject:forKey:", self.isa.objj_msgSend1(self, "objectForKey:", CPKeyValueChangeNewKey), CPKeyValueChangeOldKey));
    }
    else if (changeKind === CPKeyValueChangeInsertion)
    {
        (inverseChangeDictionary == null ? null : inverseChangeDictionary.isa.objj_msgSend2(inverseChangeDictionary, "setObject:forKey:", CPKeyValueChangeRemoval, CPKeyValueChangeKindKey));
        (inverseChangeDictionary == null ? null : inverseChangeDictionary.isa.objj_msgSend2(inverseChangeDictionary, "setObject:forKey:", self.isa.objj_msgSend1(self, "objectForKey:", CPKeyValueChangeNewKey), CPKeyValueChangeOldKey));
        (inverseChangeDictionary == null ? null : inverseChangeDictionary.isa.objj_msgSend1(inverseChangeDictionary, "removeObjectForKey:", CPKeyValueChangeNewKey));
    }
    else if (changeKind === CPKeyValueChangeRemoval)
    {
        (inverseChangeDictionary == null ? null : inverseChangeDictionary.isa.objj_msgSend2(inverseChangeDictionary, "setObject:forKey:", CPKeyValueChangeInsertion, CPKeyValueChangeKindKey));
        (inverseChangeDictionary == null ? null : inverseChangeDictionary.isa.objj_msgSend2(inverseChangeDictionary, "setObject:forKey:", self.isa.objj_msgSend1(self, "objectForKey:", CPKeyValueChangeOldKey), CPKeyValueChangeNewKey));
        (inverseChangeDictionary == null ? null : inverseChangeDictionary.isa.objj_msgSend1(inverseChangeDictionary, "removeObjectForKey:", CPKeyValueChangeOldKey));
    }
    return inverseChangeDictionary;
}
,["CPDictionary"])]);
}CPKeyValueObservingOptionNew = 1 << 0;
CPKeyValueObservingOptionOld = 1 << 1;
CPKeyValueObservingOptionInitial = 1 << 2;
CPKeyValueObservingOptionPrior = 1 << 3;
CPKeyValueChangeKindKey = "CPKeyValueChangeKindKey";
CPKeyValueChangeNewKey = "CPKeyValueChangeNewKey";
CPKeyValueChangeOldKey = "CPKeyValueChangeOldKey";
CPKeyValueChangeIndexesKey = "CPKeyValueChangeIndexesKey";
CPKeyValueChangeNotificationIsPriorKey = "CPKeyValueChangeNotificationIsPriorKey";
CPKeyValueChangeSetting = 1;
CPKeyValueChangeInsertion = 2;
CPKeyValueChangeRemoval = 3;
CPKeyValueChangeReplacement = 4;
CPKeyValueUnionSetMutation = 1;
CPKeyValueMinusSetMutation = 2;
CPKeyValueIntersectSetMutation = 3;
CPKeyValueSetSetMutation = 4;
_CPKeyValueChangeSetMutationObjectsKey = "_CPKeyValueChangeSetMutationObjectsKey";
_CPKeyValueChangeSetMutationKindKey = "_CPKeyValueChangeSetMutationKindKey";
_CPKeyValueChangeSetMutationNewValueKey = "_CPKeyValueChangeSetMutationNewValueKey";
var _changeKindForSetMutationKind = function(mutationKind)
{
    switch(mutationKind) {
    case CPKeyValueUnionSetMutation:
        return CPKeyValueChangeInsertion;
    case CPKeyValueMinusSetMutation:
        return CPKeyValueChangeRemoval;
    case CPKeyValueIntersectSetMutation:
        return CPKeyValueChangeRemoval;
    case CPKeyValueSetSetMutation:
        return CPKeyValueChangeReplacement;
    }
};
var kvoNewAndOld = CPKeyValueObservingOptionNew | CPKeyValueObservingOptionOld,
    DependentKeysKey = "$KVODEPENDENT",
    KVOProxyKey = "$KVOPROXY";
{var the_class = objj_allocateClassPair(CPObject, "_CPKVOProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_targetObject"), new objj_ivar("_nativeClass"), new objj_ivar("_changesForKey"), new objj_ivar("_nestingForKey"), new objj_ivar("_minOptionsForKey"), new objj_ivar("_observersForKey"), new objj_ivar("_observersForKeyLength"), new objj_ivar("_replacedKeys"), new objj_ivar("_adding")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("adding"), function $_CPKVOProxy__adding(self, _cmd)
{
    return self._adding;
}
,["BOOL"]), new objj_method(sel_getUid("setAdding:"), function $_CPKVOProxy__setAdding_(self, _cmd, newValue)
{
    self._adding = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("initWithTarget:"), function $_CPKVOProxy__initWithTarget_(self, _cmd, aTarget)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKVOProxy").super_class }, "init"))
    {
        self._targetObject = aTarget;
        self._nativeClass = (aTarget == null ? null : aTarget.isa.objj_msgSend0(aTarget, "class"));
        self._observersForKey = {};
        self._changesForKey = {};
        self._nestingForKey = {};
        self._minOptionsForKey = {};
        self._observersForKeyLength = 0;
        (self == null ? null : self.isa.objj_msgSend0(self, "_replaceClass"));
        aTarget[KVOProxyKey] = self;
    }
    return self;
}
,["id","id"]), new objj_method(sel_getUid("_replaceClass"), function $_CPKVOProxy___replaceClass(self, _cmd)
{
    var currentClass = self._nativeClass,
        kvoClassName = "$KVO_" + class_getName(self._nativeClass),
        existingKVOClass = objj_lookUpClass(kvoClassName);
    if (existingKVOClass)
    {
        self._targetObject.isa = existingKVOClass;
        self._replacedKeys = existingKVOClass._replacedKeys;
        return;
    }
    var kvoClass = objj_allocateClassPair(currentClass, kvoClassName);
    objj_registerClassPair(kvoClass);
    self._replacedKeys = CPSet.isa.objj_msgSend0(CPSet, "set");
    kvoClass._replacedKeys = self._replacedKeys;
    var methods = class_copyMethodList(_CPKVOModelSubclass);
    if (((___r1 = self._targetObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPDictionary.isa.objj_msgSend0(CPDictionary, "class"))))
        methods = methods.concat(class_copyMethodList(_CPKVOModelDictionarySubclass));
    class_addMethods(kvoClass, methods);
    self._targetObject.isa = kvoClass;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_replaceModifiersForKey:"), function $_CPKVOProxy___replaceModifiersForKey_(self, _cmd, aKey)
{
    if (((___r1 = self._replacedKeys), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", aKey)) || !((___r1 = self._nativeClass), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "automaticallyNotifiesObserversForKey:", aKey)))
        return;
    ((___r1 = self._replacedKeys), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", aKey));
    var theClass = self._nativeClass,
        KVOClass = self._targetObject.isa,
        capitalizedKey = (aKey.charAt(0)).toUpperCase() + aKey.substring(1);
    var setKey_selector = sel_getUid("set" + capitalizedKey + ":"),
        setKey_method = class_getInstanceMethod(theClass, setKey_selector);
    if (setKey_method)
    {
        var setKey_method_imp = setKey_method.method_imp;
        class_addMethod(KVOClass, setKey_selector, function(self, _cmd, anObject)
        {
            (self == null ? null : self.isa.objj_msgSend1(self, "willChangeValueForKey:", aKey));
            setKey_method_imp(self, _cmd, anObject);
            (self == null ? null : self.isa.objj_msgSend1(self, "didChangeValueForKey:", aKey));
        }, "");
    }
    var _setKey_selector = sel_getUid("_set" + capitalizedKey + ":"),
        _setKey_method = class_getInstanceMethod(theClass, _setKey_selector);
    if (_setKey_method)
    {
        var _setKey_method_imp = _setKey_method.method_imp;
        class_addMethod(KVOClass, _setKey_selector, function(self, _cmd, anObject)
        {
            (self == null ? null : self.isa.objj_msgSend1(self, "willChangeValueForKey:", aKey));
            _setKey_method_imp(self, _cmd, anObject);
            (self == null ? null : self.isa.objj_msgSend1(self, "didChangeValueForKey:", aKey));
        }, "");
    }
    var insertObject_inKeyAtIndex_selector = sel_getUid("insertObject:in" + capitalizedKey + "AtIndex:"),
        insertObject_inKeyAtIndex_method = class_getInstanceMethod(theClass, insertObject_inKeyAtIndex_selector),
        insertKey_atIndexes_selector = sel_getUid("insert" + capitalizedKey + ":atIndexes:"),
        insertKey_atIndexes_method = class_getInstanceMethod(theClass, insertKey_atIndexes_selector),
        removeObjectFromKeyAtIndex_selector = sel_getUid("removeObjectFrom" + capitalizedKey + "AtIndex:"),
        removeObjectFromKeyAtIndex_method = class_getInstanceMethod(theClass, removeObjectFromKeyAtIndex_selector),
        removeKeyAtIndexes_selector = sel_getUid("remove" + capitalizedKey + "AtIndexes:"),
        removeKeyAtIndexes_method = class_getInstanceMethod(theClass, removeKeyAtIndexes_selector);
    if ((insertObject_inKeyAtIndex_method || insertKey_atIndexes_method) && (removeObjectFromKeyAtIndex_method || removeKeyAtIndexes_method))
    {
        if (insertObject_inKeyAtIndex_method)
        {
            var insertObject_inKeyAtIndex_method_imp = insertObject_inKeyAtIndex_method.method_imp;
            class_addMethod(KVOClass, insertObject_inKeyAtIndex_selector, function(self, _cmd, anObject, anIndex)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex), aKey));
                insertObject_inKeyAtIndex_method_imp(self, _cmd, anObject, anIndex);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex), aKey));
            }, "");
        }
        if (insertKey_atIndexes_method)
        {
            var insertKey_atIndexes_method_imp = insertKey_atIndexes_method.method_imp;
            class_addMethod(KVOClass, insertKey_atIndexes_selector, function(self, _cmd, objects, indexes)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "copy")), aKey));
                insertKey_atIndexes_method_imp(self, _cmd, objects, indexes);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "copy")), aKey));
            }, "");
        }
        if (removeObjectFromKeyAtIndex_method)
        {
            var removeObjectFromKeyAtIndex_method_imp = removeObjectFromKeyAtIndex_method.method_imp;
            class_addMethod(KVOClass, removeObjectFromKeyAtIndex_selector, function(self, _cmd, anIndex)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex), aKey));
                removeObjectFromKeyAtIndex_method_imp(self, _cmd, anIndex);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex), aKey));
            }, "");
        }
        if (removeKeyAtIndexes_method)
        {
            var removeKeyAtIndexes_method_imp = removeKeyAtIndexes_method.method_imp;
            class_addMethod(KVOClass, removeKeyAtIndexes_selector, function(self, _cmd, indexes)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "copy")), aKey));
                removeKeyAtIndexes_method_imp(self, _cmd, indexes);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "copy")), aKey));
            }, "");
        }
        var replaceObjectInKeyAtIndex_withObject_selector = sel_getUid("replaceObjectIn" + capitalizedKey + "AtIndex:withObject:"),
            replaceObjectInKeyAtIndex_withObject_method = class_getInstanceMethod(theClass, replaceObjectInKeyAtIndex_withObject_selector);
        if (replaceObjectInKeyAtIndex_withObject_method)
        {
            var replaceObjectInKeyAtIndex_withObject_method_imp = replaceObjectInKeyAtIndex_withObject_method.method_imp;
            class_addMethod(KVOClass, replaceObjectInKeyAtIndex_withObject_selector, function(self, _cmd, anIndex, anObject)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex), aKey));
                replaceObjectInKeyAtIndex_withObject_method_imp(self, _cmd, anIndex, anObject);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex), aKey));
            }, "");
        }
        var replaceKeyAtIndexes_withKey_selector = sel_getUid("replace" + capitalizedKey + "AtIndexes:with" + capitalizedKey + ":"),
            replaceKeyAtIndexes_withKey_method = class_getInstanceMethod(theClass, replaceKeyAtIndexes_withKey_selector);
        if (replaceKeyAtIndexes_withKey_method)
        {
            var replaceKeyAtIndexes_withKey_method_imp = replaceKeyAtIndexes_withKey_method.method_imp;
            class_addMethod(KVOClass, replaceKeyAtIndexes_withKey_selector, function(self, _cmd, indexes, objects)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "copy")), aKey));
                replaceObjectInKeyAtIndex_withObject_method_imp(self, _cmd, indexes, objects);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "copy")), aKey));
            }, "");
        }
    }
    var addKeyObject_selector = sel_getUid("add" + capitalizedKey + "Object:"),
        addKeyObject_method = class_getInstanceMethod(theClass, addKeyObject_selector),
        addKey_selector = sel_getUid("add" + capitalizedKey + ":"),
        addKey_method = class_getInstanceMethod(theClass, addKey_selector),
        removeKeyObject_selector = sel_getUid("remove" + capitalizedKey + "Object:"),
        removeKeyObject_method = class_getInstanceMethod(theClass, removeKeyObject_selector),
        removeKey_selector = sel_getUid("remove" + capitalizedKey + ":"),
        removeKey_method = class_getInstanceMethod(theClass, removeKey_selector);
    if ((addKeyObject_method || addKey_method) && (removeKeyObject_method || removeKey_method))
    {
        if (addKeyObject_method)
        {
            var addKeyObject_method_imp = addKeyObject_method.method_imp;
            class_addMethod(KVOClass, addKeyObject_selector, function(self, _cmd, anObject)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueUnionSetMutation, CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", anObject)));
                addKeyObject_method_imp(self, _cmd, anObject);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueUnionSetMutation, CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", anObject)));
            }, "");
        }
        if (addKey_method)
        {
            var addKey_method_imp = addKey_method.method_imp;
            class_addMethod(KVOClass, addKey_selector, function(self, _cmd, objects)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueUnionSetMutation, (objects == null ? null : objects.isa.objj_msgSend0(objects, "copy"))));
                addKey_method_imp(self, _cmd, objects);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueUnionSetMutation, (objects == null ? null : objects.isa.objj_msgSend0(objects, "copy"))));
            }, "");
        }
        if (removeKeyObject_method)
        {
            var removeKeyObject_method_imp = removeKeyObject_method.method_imp;
            class_addMethod(KVOClass, removeKeyObject_selector, function(self, _cmd, anObject)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueMinusSetMutation, CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", anObject)));
                removeKeyObject_method_imp(self, _cmd, anObject);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueMinusSetMutation, CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", anObject)));
            }, "");
        }
        if (removeKey_method)
        {
            var removeKey_method_imp = removeKey_method.method_imp;
            class_addMethod(KVOClass, removeKey_selector, function(self, _cmd, objects)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueMinusSetMutation, (objects == null ? null : objects.isa.objj_msgSend0(objects, "copy"))));
                removeKey_method_imp(self, _cmd, objects);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueMinusSetMutation, (objects == null ? null : objects.isa.objj_msgSend0(objects, "copy"))));
            }, "");
        }
        var intersectKey_selector = sel_getUid("intersect" + capitalizedKey + ":"),
            intersectKey_method = class_getInstanceMethod(theClass, intersectKey_selector);
        if (intersectKey_method)
        {
            var intersectKey_method_imp = intersectKey_method.method_imp;
            class_addMethod(KVOClass, intersectKey_selector, function(self, _cmd, aSet)
            {
                (self == null ? null : self.isa.objj_msgSend3(self, "willChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueIntersectSetMutation, (aSet == null ? null : aSet.isa.objj_msgSend0(aSet, "copy"))));
                intersectKey_method_imp(self, _cmd, aSet);
                (self == null ? null : self.isa.objj_msgSend3(self, "didChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueIntersectSetMutation, (aSet == null ? null : aSet.isa.objj_msgSend0(aSet, "copy"))));
            }, "");
        }
    }
    var affectingKeys = ((___r1 = ((___r2 = self._nativeClass), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "keyPathsForValuesAffectingValueForKey:", aKey))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allObjects")),
        affectingKeysCount = affectingKeys ? affectingKeys.length : 0;
    if (!affectingKeysCount)
        return;
    var dependentKeysForClass = self._nativeClass[DependentKeysKey];
    if (!dependentKeysForClass)
    {
        dependentKeysForClass = {};
        self._nativeClass[DependentKeysKey] = dependentKeysForClass;
    }
    while (affectingKeysCount--)
    {
        var affectingKey = affectingKeys[affectingKeysCount],
            affectedKeys = dependentKeysForClass[affectingKey];
        if (!affectedKeys)
        {
            affectedKeys = CPSet.isa.objj_msgSend0(CPSet, "new");
            dependentKeysForClass[affectingKey] = affectedKeys;
        }
        (affectedKeys == null ? null : affectedKeys.isa.objj_msgSend1(affectedKeys, "addObject:", aKey));
        if (affectingKey.indexOf(".") !== -1)
            ((___r1 = self._targetObject), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, affectingKey, CPKeyValueObservingOptionPrior | kvoNewAndOld, nil));
        else
            self.isa.objj_msgSend1(self, "_replaceModifiersForKey:", affectingKey);
    }
    var ___r1, ___r2;
}
,["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPKVOProxy__observeValueForKeyPath_ofObject_change_context_(self, _cmd, theKeyPath, theObject, theChanges, theContext)
{
    var dependentKeysForClass = self._nativeClass[DependentKeysKey],
        dependantKeys = ((___r1 = dependentKeysForClass[theKeyPath]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allObjects")),
        isBeforeFlag = !!(theChanges == null ? null : theChanges.isa.objj_msgSend1(theChanges, "objectForKey:", CPKeyValueChangeNotificationIsPriorKey));
    for (var i = 0; i < (dependantKeys == null ? null : dependantKeys.isa.objj_msgSend0(dependantKeys, "count")); i++)
    {
        var dependantKey = (dependantKeys == null ? null : dependantKeys.isa.objj_msgSend1(dependantKeys, "objectAtIndex:", i));
        self.isa.objj_msgSend3(self, "_sendNotificationsForKey:changeOptions:isBefore:", dependantKey, theChanges, isBeforeFlag);
    }
    var ___r1;
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("_addObserver:forKeyPath:options:context:"), function $_CPKVOProxy___addObserver_forKeyPath_options_context_(self, _cmd, anObserver, aPath, options, aContext)
{
    if (!anObserver)
        return;
    var forwarder = nil;
    if (aPath.indexOf('.') !== CPNotFound && aPath.charAt(0) !== '@')
        forwarder = ((___r1 = (_CPKVOForwardingObserver == null ? null : _CPKVOForwardingObserver.isa.objj_msgSend0(_CPKVOForwardingObserver, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithKeyPath:object:observer:options:context:", aPath, self._targetObject, anObserver, options, aContext));
    else
        self.isa.objj_msgSend1(self, "_replaceModifiersForKey:", aPath);
    var observers = self._observersForKey[aPath];
    if (!observers)
    {
        observers = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._observersForKey[aPath] = observers;
        self._observersForKeyLength++;
    }
    (observers == null ? null : observers.isa.objj_msgSend2(observers, "setObject:forKey:", _CPKVOInfoMake(anObserver, options, aContext, forwarder), (anObserver == null ? null : anObserver.isa.objj_msgSend0(anObserver, "UID"))));
    if (options & CPKeyValueObservingOptionInitial)
    {
        var changes;
        if (options & CPKeyValueObservingOptionNew)
        {
            var newValue = ((___r1 = self._targetObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", aPath));
            if (newValue == nil)
                newValue = CPNull.isa.objj_msgSend0(CPNull, "null");
            changes = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPKeyValueChangeSetting, CPKeyValueChangeKindKey, newValue, CPKeyValueChangeNewKey);
        }
        else
        {
            changes = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPKeyValueChangeSetting, CPKeyValueChangeKindKey);
        }
        (anObserver == null ? null : anObserver.isa.objj_msgSend(anObserver, "observeValueForKeyPath:ofObject:change:context:", aPath, self._targetObject, changes, aContext));
    }
    var ___r1;
}
,["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("_removeObserver:forKeyPath:"), function $_CPKVOProxy___removeObserver_forKeyPath_(self, _cmd, anObserver, aPath)
{
    var observers = self._observersForKey[aPath];
    if (!observers)
    {
        if (!self._adding)
            CPLog.warn("Cannot remove an observer %@ for the key path \"%@\" from %@ because it is not registered as an observer.", self._targetObject, aPath, anObserver);
        return;
    }
    if (aPath.indexOf('.') != CPNotFound)
    {
        var observer = (observers == null ? null : observers.isa.objj_msgSend1(observers, "objectForKey:", (anObserver == null ? null : anObserver.isa.objj_msgSend0(anObserver, "UID")))),
            forwarder = observer ? observer.forwarder : nil;
        (forwarder == null ? null : forwarder.isa.objj_msgSend0(forwarder, "finalize"));
    }
    (observers == null ? null : observers.isa.objj_msgSend1(observers, "removeObjectForKey:", (anObserver == null ? null : anObserver.isa.objj_msgSend0(anObserver, "UID"))));
    if (!(observers == null ? null : observers.isa.objj_msgSend0(observers, "count")))
    {
        self._observersForKeyLength--;
        delete self._observersForKey[aPath];
    }
    if (!self._observersForKeyLength)
    {
        self._targetObject.isa = self._nativeClass;
        delete self._targetObject[KVOProxyKey];
    }
}
,["void","id","CPString"]), new objj_method(sel_getUid("_sendNotificationsForKey:changeOptions:isBefore:"), function $_CPKVOProxy___sendNotificationsForKey_changeOptions_isBefore_(self, _cmd, aKey, changeOptions, isBefore)
{
    var changes = self._changesForKey[aKey],
        observers = ((___r1 = self._observersForKey[aKey]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allValues")),
        observersMinimumOptions = 0;
    if (isBefore)
    {
        if (changes)
        {
            var level = self._nestingForKey[aKey];
            if (!level)
                CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "_changesForKey without _nestingForKey");
            self._nestingForKey[aKey] = level + 1;
            return;
        }
        self._nestingForKey[aKey] = 1;
        var count = observers ? observers.length : 0;
        while (count--)
        {
            var observerInfo = observers[count];
            observersMinimumOptions |= observerInfo.options & kvoNewAndOld;
        }
        self._minOptionsForKey[aKey] = observersMinimumOptions;
        changes = changeOptions;
        if (observersMinimumOptions & CPKeyValueObservingOptionOld)
        {
            var indexes = (changes == null ? null : changes.isa.objj_msgSend1(changes, "objectForKey:", CPKeyValueChangeIndexesKey)),
                setMutationKind = changes[_CPKeyValueChangeSetMutationKindKey];
            if (setMutationKind)
            {
                var setMutationObjects = ((___r1 = changes[_CPKeyValueChangeSetMutationObjectsKey]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy")),
                    setExistingObjects = ((___r1 = ((___r2 = self._targetObject), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", aKey))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
                if (setMutationKind == CPKeyValueMinusSetMutation)
                {
                    (setExistingObjects == null ? null : setExistingObjects.isa.objj_msgSend1(setExistingObjects, "intersectSet:", setMutationObjects));
                    (changes == null ? null : changes.isa.objj_msgSend2(changes, "setValue:forKey:", setExistingObjects, CPKeyValueChangeOldKey));
                }
                else if (setMutationKind === CPKeyValueIntersectSetMutation || setMutationKind === CPKeyValueSetSetMutation)
                {
                    (setExistingObjects == null ? null : setExistingObjects.isa.objj_msgSend1(setExistingObjects, "minusSet:", setMutationObjects));
                    (changes == null ? null : changes.isa.objj_msgSend2(changes, "setValue:forKey:", setExistingObjects, CPKeyValueChangeOldKey));
                }
                if (setMutationKind === CPKeyValueUnionSetMutation || setMutationKind === CPKeyValueSetSetMutation)
                {
                    (setMutationObjects == null ? null : setMutationObjects.isa.objj_msgSend1(setMutationObjects, "minusSet:", setExistingObjects));
                    changes[_CPKeyValueChangeSetMutationNewValueKey] = setMutationObjects;
                }
            }
            else if (indexes)
            {
                var type = (changes == null ? null : changes.isa.objj_msgSend1(changes, "objectForKey:", CPKeyValueChangeKindKey));
                if (type === CPKeyValueChangeReplacement || type === CPKeyValueChangeRemoval)
                {
                    var newValues = ((___r1 = ((___r2 = self._targetObject), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "mutableArrayValueForKeyPath:", aKey))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectsAtIndexes:", indexes));
                    (changes == null ? null : changes.isa.objj_msgSend2(changes, "setValue:forKey:", newValues, CPKeyValueChangeOldKey));
                }
            }
            else
            {
                var oldValue = ((___r1 = self._targetObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", aKey));
                if (oldValue === nil || oldValue === undefined)
                    oldValue = CPNull.isa.objj_msgSend0(CPNull, "null");
                (changes == null ? null : changes.isa.objj_msgSend2(changes, "setObject:forKey:", oldValue, CPKeyValueChangeOldKey));
            }
        }
        (changes == null ? null : changes.isa.objj_msgSend2(changes, "setObject:forKey:", 1, CPKeyValueChangeNotificationIsPriorKey));
        self._changesForKey[aKey] = changes;
        observersMinimumOptions &= ~CPKeyValueObservingOptionNew;
    }
    else
    {
        var level = self._nestingForKey[aKey];
        if (!changes || !level)
        {
            if (self._targetObject._willChangeMessageCounter && self._targetObject._willChangeMessageCounter[aKey])
            {
                self._targetObject._willChangeMessageCounter[aKey] -= 1;
                if (!self._targetObject._willChangeMessageCounter[aKey])
                    delete self._targetObject._willChangeMessageCounter[aKey];
                return;
            }
            else
                CPException.isa.objj_msgSend2(CPException, "raise:reason:", "CPKeyValueObservingException", "'didChange...' message called without prior call of 'willChange...'");
        }
        self._nestingForKey[aKey] = level - 1;
        if (level - 1 > 0)
        {
            return;
        }
        delete self._nestingForKey[aKey];
        (changes == null ? null : changes.isa.objj_msgSend1(changes, "removeObjectForKey:", CPKeyValueChangeNotificationIsPriorKey));
        observersMinimumOptions = self._minOptionsForKey[aKey];
        if (observersMinimumOptions & CPKeyValueObservingOptionNew)
        {
            var indexes = (changes == null ? null : changes.isa.objj_msgSend1(changes, "objectForKey:", CPKeyValueChangeIndexesKey)),
                setMutationKind = changes[_CPKeyValueChangeSetMutationKindKey];
            if (setMutationKind)
            {
                var newValue = changes[_CPKeyValueChangeSetMutationNewValueKey];
                (changes == null ? null : changes.isa.objj_msgSend2(changes, "setValue:forKey:", newValue, CPKeyValueChangeNewKey));
                delete changes[_CPKeyValueChangeSetMutationNewValueKey];
                delete changes[_CPKeyValueChangeSetMutationObjectsKey];
                delete changes[_CPKeyValueChangeSetMutationKindKey];
            }
            else if (indexes)
            {
                var type = (changes == null ? null : changes.isa.objj_msgSend1(changes, "objectForKey:", CPKeyValueChangeKindKey));
                if (type == CPKeyValueChangeReplacement || type == CPKeyValueChangeInsertion)
                {
                    var newValues = ((___r1 = ((___r2 = self._targetObject), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "mutableArrayValueForKeyPath:", aKey))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectsAtIndexes:", indexes));
                    (changes == null ? null : changes.isa.objj_msgSend2(changes, "setValue:forKey:", newValues, CPKeyValueChangeNewKey));
                }
            }
            else
            {
                var newValue = ((___r1 = self._targetObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", aKey));
                if (newValue === nil || newValue === undefined)
                    newValue = CPNull.isa.objj_msgSend0(CPNull, "null");
                (changes == null ? null : changes.isa.objj_msgSend2(changes, "setObject:forKey:", newValue, CPKeyValueChangeNewKey));
            }
        }
        delete self._minOptionsForKey[aKey];
        delete self._changesForKey[aKey];
    }
    var count = observers ? observers.length : 0,
        changesCache = {};
    while (count--)
    {
        var observerInfo = observers[count],
            options = observerInfo.options,
            onlyNewAndOldOptions = options & kvoNewAndOld,
            observerChanges = nil;
        if (isBefore)
        {
            if (options & CPKeyValueObservingOptionPrior)
            {
                observerChanges = changes;
                onlyNewAndOldOptions &= ~CPKeyValueObservingOptionNew;
            }
        }
        else
        {
            observerChanges = changes;
        }
        if (observerChanges)
        {
            if (onlyNewAndOldOptions !== observersMinimumOptions)
            {
                observerChanges = changesCache[onlyNewAndOldOptions];
                if (!observerChanges)
                {
                    changesCache[onlyNewAndOldOptions] = observerChanges = (changes == null ? null : changes.isa.objj_msgSend0(changes, "mutableCopy"));
                    if (!(onlyNewAndOldOptions & CPKeyValueObservingOptionOld))
                        (observerChanges == null ? null : observerChanges.isa.objj_msgSend1(observerChanges, "removeObjectForKey:", CPKeyValueChangeOldKey));
                    if (!(onlyNewAndOldOptions & CPKeyValueObservingOptionNew))
                        (observerChanges == null ? null : observerChanges.isa.objj_msgSend1(observerChanges, "removeObjectForKey:", CPKeyValueChangeNewKey));
                }
            }
            ((___r1 = observerInfo.observer), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "observeValueForKeyPath:ofObject:change:context:", aKey, self._targetObject, observerChanges, observerInfo.context));
        }
    }
    var dependentKeysMap = self._nativeClass[DependentKeysKey];
    if (!dependentKeysMap)
        return;
    var dependentKeyPaths = ((___r1 = dependentKeysMap[aKey]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allObjects"));
    if (!dependentKeyPaths)
        return;
    var index = 0,
        count = (dependentKeyPaths == null ? null : dependentKeyPaths.isa.objj_msgSend0(dependentKeyPaths, "count"));
    for (; index < count; ++index)
    {
        var keyPath = dependentKeyPaths[index];
        self.isa.objj_msgSend3(self, "_sendNotificationsForKey:changeOptions:isBefore:", keyPath, isBefore ? (changeOptions == null ? null : changeOptions.isa.objj_msgSend0(changeOptions, "copy")) : self._changesForKey[keyPath], isBefore);
    }
    var ___r1, ___r2;
}
,["void","CPString","CPDictionary","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("proxyForObject:"), function $_CPKVOProxy__proxyForObject_(self, _cmd, anObject)
{
    var proxy = anObject[KVOProxyKey];
    if (proxy)
        return proxy;
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTarget:", anObject));
    var ___r1;
}
,["id","CPObject"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPKVOModelSubclass"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("willChangeValueForKey:"), function $_CPKVOModelSubclass__willChangeValueForKey_(self, _cmd, aKey)
{
    var superClass = self.isa.objj_msgSend0(self, "class"),
        methodSelector = sel_getUid("willChangeValueForKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, aKey);
    if (!aKey)
        return;
    var changeOptions = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPKeyValueChangeSetting, CPKeyValueChangeKindKey);
    ((___r1 = _CPKVOProxy.isa.objj_msgSend1(_CPKVOProxy, "proxyForObject:", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_sendNotificationsForKey:changeOptions:isBefore:", aKey, changeOptions, YES));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("didChangeValueForKey:"), function $_CPKVOModelSubclass__didChangeValueForKey_(self, _cmd, aKey)
{
    var superClass = self.isa.objj_msgSend0(self, "class"),
        methodSelector = sel_getUid("didChangeValueForKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, aKey);
    if (!aKey)
        return;
    ((___r1 = _CPKVOProxy.isa.objj_msgSend1(_CPKVOProxy, "proxyForObject:", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_sendNotificationsForKey:changeOptions:isBefore:", aKey, nil, NO));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"), function $_CPKVOModelSubclass__willChange_valuesAtIndexes_forKey_(self, _cmd, change, indexes, aKey)
{
    var superClass = self.isa.objj_msgSend0(self, "class"),
        methodSelector = sel_getUid("willChange:valuesAtIndexes:forKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, change, indexes, aKey);
    if (!aKey)
        return;
    var changeOptions = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", change, CPKeyValueChangeKindKey, indexes, CPKeyValueChangeIndexesKey);
    ((___r1 = _CPKVOProxy.isa.objj_msgSend1(_CPKVOProxy, "proxyForObject:", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_sendNotificationsForKey:changeOptions:isBefore:", aKey, changeOptions, YES));
    var ___r1;
}
,["void","CPKeyValueChange","CPIndexSet","CPString"]), new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"), function $_CPKVOModelSubclass__didChange_valuesAtIndexes_forKey_(self, _cmd, change, indexes, aKey)
{
    var superClass = self.isa.objj_msgSend0(self, "class"),
        methodSelector = sel_getUid("didChange:valuesAtIndexes:forKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, change, indexes, aKey);
    if (!aKey)
        return;
    ((___r1 = _CPKVOProxy.isa.objj_msgSend1(_CPKVOProxy, "proxyForObject:", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_sendNotificationsForKey:changeOptions:isBefore:", aKey, nil, NO));
    var ___r1;
}
,["void","CPKeyValueChange","CPIndexSet","CPString"]), new objj_method(sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"), function $_CPKVOModelSubclass__willChangeValueForKey_withSetMutation_usingObjects_(self, _cmd, aKey, mutationKind, objects)
{
    var superClass = self.isa.objj_msgSend0(self, "class"),
        methodSelector = sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, aKey, mutationKind, objects);
    if (!aKey)
        return;
    var changeKind = _changeKindForSetMutationKind(mutationKind),
        changeOptions = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", changeKind, CPKeyValueChangeKindKey);
    changeOptions[_CPKeyValueChangeSetMutationObjectsKey] = objects;
    changeOptions[_CPKeyValueChangeSetMutationKindKey] = mutationKind;
    ((___r1 = _CPKVOProxy.isa.objj_msgSend1(_CPKVOProxy, "proxyForObject:", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_sendNotificationsForKey:changeOptions:isBefore:", aKey, changeOptions, YES));
    var ___r1;
}
,["void","CPString","CPKeyValueSetMutationKind","CPSet"]), new objj_method(sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"), function $_CPKVOModelSubclass__didChangeValueForKey_withSetMutation_usingObjects_(self, _cmd, aKey, mutationKind, objects)
{
    var superClass = self.isa.objj_msgSend0(self, "class"),
        methodSelector = sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, aKey, mutationKind, objects);
    if (!aKey)
        return;
    ((___r1 = _CPKVOProxy.isa.objj_msgSend1(_CPKVOProxy, "proxyForObject:", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_sendNotificationsForKey:changeOptions:isBefore:", aKey, nil, NO));
    var ___r1;
}
,["void","CPString","CPKeyValueSetMutationKind","CPSet"]), new objj_method(sel_getUid("class"), function $_CPKVOModelSubclass__class(self, _cmd)
{
    return self[KVOProxyKey]._nativeClass;
}
,["Class"]), new objj_method(sel_getUid("superclass"), function $_CPKVOModelSubclass__superclass(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "superclass"));
    var ___r1;
}
,["Class"]), new objj_method(sel_getUid("isKindOfClass:"), function $_CPKVOModelSubclass__isKindOfClass_(self, _cmd, aClass)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isSubclassOfClass:", aClass));
    var ___r1;
}
,["BOOL","Class"]), new objj_method(sel_getUid("isMemberOfClass:"), function $_CPKVOModelSubclass__isMemberOfClass_(self, _cmd, aClass)
{
    return self.isa.objj_msgSend0(self, "class") == aClass;
}
,["BOOL","Class"]), new objj_method(sel_getUid("className"), function $_CPKVOModelSubclass__className(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "class").name;
}
,["CPString"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPKVOModelDictionarySubclass"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("removeAllObjects"), function $_CPKVOModelDictionarySubclass__removeAllObjects(self, _cmd)
{
    var keys = self.isa.objj_msgSend0(self, "allKeys"),
        count = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count")),
        i = 0;
    for (; i < count; i++)
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", keys[i]);
    var superClass = self.isa.objj_msgSend0(self, "class"),
        methodSelector = sel_getUid("removeAllObjects"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector);
    for (i = 0; i < count; i++)
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", keys[i]);
}
,["void"]), new objj_method(sel_getUid("removeObjectForKey:"), function $_CPKVOModelDictionarySubclass__removeObjectForKey_(self, _cmd, aKey)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", aKey);
    var superClass = self.isa.objj_msgSend0(self, "class"),
        methodSelector = sel_getUid("removeObjectForKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, aKey);
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", aKey);
}
,["void","id"]), new objj_method(sel_getUid("setObject:forKey:"), function $_CPKVOModelDictionarySubclass__setObject_forKey_(self, _cmd, anObject, aKey)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", aKey);
    var superClass = self.isa.objj_msgSend0(self, "class"),
        methodSelector = sel_getUid("setObject:forKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, anObject, aKey);
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", aKey);
}
,["void","id","id"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPKVOForwardingObserver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_object"), new objj_ivar("_observer"), new objj_ivar("_context"), new objj_ivar("_options"), new objj_ivar("_firstPart"), new objj_ivar("_secondPart"), new objj_ivar("_value")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKeyPath:object:observer:options:context:"), function $_CPKVOForwardingObserver__initWithKeyPath_object_observer_options_context_(self, _cmd, aKeyPath, anObject, anObserver, options, aContext)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKVOForwardingObserver").super_class }, "init");
    self._context = aContext;
    self._observer = anObserver;
    self._object = anObject;
    self._options = options;
    var dotIndex = aKeyPath.indexOf('.');
    if (dotIndex === CPNotFound)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Created _CPKVOForwardingObserver without compound key path: " + aKeyPath);
    self._firstPart = aKeyPath.substring(0, dotIndex);
    self._secondPart = aKeyPath.substring(dotIndex + 1);
    ((___r1 = self._object), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, self._firstPart, self._options, nil));
    self._value = ((___r1 = self._object), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", self._firstPart));
    if (self._value)
        ((___r1 = self._value), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, self._secondPart, self._options, nil));
    return self;
    var ___r1;
}
,["id","CPString","id","id","unsigned","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPKVOForwardingObserver__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, aContext)
{
    if (aKeyPath === self._firstPart)
    {
        var pathChanges = CPMutableDictionary.isa.objj_msgSend2(CPMutableDictionary, "dictionaryWithObject:forKey:", CPKeyValueChangeSetting, CPKeyValueChangeKindKey);
        if (self._options & CPKeyValueObservingOptionOld)
        {
            var oldValue = ((___r1 = self._value), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", self._secondPart));
            (pathChanges == null ? null : pathChanges.isa.objj_msgSend2(pathChanges, "setObject:forKey:", oldValue != null ? oldValue : CPNull.isa.objj_msgSend0(CPNull, "null"), CPKeyValueChangeOldKey));
        }
        if (self._options & CPKeyValueObservingOptionNew)
        {
            var newValue = ((___r1 = self._object), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", self._firstPart + "." + self._secondPart));
            (pathChanges == null ? null : pathChanges.isa.objj_msgSend2(pathChanges, "setObject:forKey:", newValue != null ? newValue : CPNull.isa.objj_msgSend0(CPNull, "null"), CPKeyValueChangeNewKey));
        }
        ((___r1 = self._observer), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "observeValueForKeyPath:ofObject:change:context:", self._firstPart + "." + self._secondPart, self._object, pathChanges, self._context));
        if (self._value)
            ((___r1 = self._value), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:forKeyPath:", self, self._secondPart));
        self._value = ((___r1 = self._object), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", self._firstPart));
        if (self._value)
            ((___r1 = self._value), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, self._secondPart, self._options, nil));
    }
    else
    {
        ((___r1 = self._observer), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "observeValueForKeyPath:ofObject:change:context:", self._firstPart + "." + aKeyPath, self._object, changes, self._context));
    }
    var ___r1;
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("finalize"), function $_CPKVOForwardingObserver__finalize(self, _cmd)
{
    if (self._value)
        ((___r1 = self._value), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:forKeyPath:", self, self._secondPart));
    ((___r1 = self._object), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:forKeyPath:", self, self._firstPart));
    self._object = nil;
    self._observer = nil;
    self._context = nil;
    self._value = nil;
    var ___r1;
}
,["void"])]);
}var _CPKVOInfoMake = function(anObserver, theOptions, aContext, aForwarder)
{
    return {observer: anObserver, options: theOptions, context: aContext, forwarder: aForwarder};
};
objj_executeFile("CPArray+KVO.j", YES);objj_executeFile("CPSet+KVO.j", YES);