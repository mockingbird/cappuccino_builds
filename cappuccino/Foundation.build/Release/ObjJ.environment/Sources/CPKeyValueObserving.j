@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;12;CPIndexSet.ji;8;CPNull.ji;10;CPObject.ji;7;CPSet.ji;13;CPArray+KVO.ji;11;CPSet+KVO.jt;47523;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPIndexSet.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPSet.j", YES);{
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
            objj_msgSend(CPException, "raise:reason:", "CPKeyValueObservingException", "'didChange...' message called without prior call of 'willChange...'");
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
            objj_msgSend(CPException, "raise:reason:", "CPKeyValueObservingException", "'didChange...' message called without prior call of 'willChange...'");
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
            objj_msgSend(CPException, "raise:reason:", "CPKeyValueObservingException", "'didChange...' message called without prior call of 'willChange...'");
    }
}
,["void","CPString","CPKeyValueSetMutationKind","CPSet"]), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function $CPObject__addObserver_forKeyPath_options_context_(self, _cmd, anObserver, aPath, options, aContext)
{
    if (!anObserver || !aPath)
        return;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_addObserver:forKeyPath:options:context:", anObserver, aPath, options, aContext);
}
,["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function $CPObject__removeObserver_forKeyPath_(self, _cmd, anObserver, aPath)
{
    if (!anObserver || !aPath)
        return;
    objj_msgSend(self[KVOProxyKey], "_removeObserver:forKeyPath:", anObserver, aPath);
}
,["void","id","CPString"]), new objj_method(sel_getUid("applyChange:toKeyPath:"), function $CPObject__applyChange_toKeyPath_(self, _cmd, aChange, aKeyPath)
{
    var changeKind = objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeKindKey),
        oldValue = objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeOldKey),
        newValue = objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeNewKey);
    if (newValue === objj_msgSend(CPNull, "null"))
        newValue = nil;
    if (changeKind === CPKeyValueChangeSetting)
        return objj_msgSend(self, "setValue:forKeyPath:", newValue, aKeyPath);
    var indexes = objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeIndexesKey);
    if (indexes)
    {
        if (changeKind === CPKeyValueChangeInsertion)
            objj_msgSend(objj_msgSend(self, "mutableArrayValueForKeyPath:", aKeyPath), "insertObjects:atIndexes:", newValue, indexes);
        else if (changeKind === CPKeyValueChangeRemoval)
            objj_msgSend(objj_msgSend(self, "mutableArrayValueForKeyPath:", aKeyPath), "removeObjectsAtIndexes:", indexes);
        else if (changeKind === CPKeyValueChangeReplacement)
            objj_msgSend(objj_msgSend(self, "mutableArrayValueForKeyPath:", aKeyPath), "replaceObjectAtIndexes:withObjects:", indexes, newValue);
    }
    else
    {
        if (changeKind === CPKeyValueChangeInsertion)
            objj_msgSend(objj_msgSend(self, "mutableSetValueForKeyPath:", aKeyPath), "unionSet:", newValue);
        else if (changeKind === CPKeyValueChangeRemoval)
            objj_msgSend(objj_msgSend(self, "mutableSetValueForKeyPath:", aKeyPath), "minusSet:", oldValue);
        else if (changeKind === CPKeyValueChangeReplacement)
            objj_msgSend(objj_msgSend(self, "mutableSetValueForKeyPath:", aKeyPath), "setSet:", newValue);
    }
}
,["void","CPDictionary","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"), function $CPObject__automaticallyNotifiesObserversForKey_(self, _cmd, aKey)
{
    var capitalizedKey = (aKey.charAt(0)).toUpperCase() + aKey.substring(1),
        selector = "automaticallyNotifiesObserversOf" + capitalizedKey;
    if (objj_msgSend(objj_msgSend(self, "class"), "respondsToSelector:", selector))
        return objj_msgSend(objj_msgSend(self, "class"), selector);
    return YES;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForKey:"), function $CPObject__keyPathsForValuesAffectingValueForKey_(self, _cmd, aKey)
{
    var capitalizedKey = (aKey.charAt(0)).toUpperCase() + aKey.substring(1),
        selector = "keyPathsForValuesAffecting" + capitalizedKey;
    if (objj_msgSend(objj_msgSend(self, "class"), "respondsToSelector:", selector))
        return objj_msgSend(objj_msgSend(self, "class"), selector);
    return objj_msgSend(CPSet, "set");
}
,["CPSet","CPString"])]);
}{
var the_class = objj_getClass("CPDictionary")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("inverseChangeDictionary"), function $CPDictionary__inverseChangeDictionary(self, _cmd)
{
    var inverseChangeDictionary = objj_msgSend(self, "mutableCopy"),
        changeKind = objj_msgSend(self, "objectForKey:", CPKeyValueChangeKindKey);
    if (changeKind === CPKeyValueChangeSetting || changeKind === CPKeyValueChangeReplacement)
    {
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", objj_msgSend(self, "objectForKey:", CPKeyValueChangeOldKey), CPKeyValueChangeNewKey);
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", objj_msgSend(self, "objectForKey:", CPKeyValueChangeNewKey), CPKeyValueChangeOldKey);
    }
    else if (changeKind === CPKeyValueChangeInsertion)
    {
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", CPKeyValueChangeRemoval, CPKeyValueChangeKindKey);
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", objj_msgSend(self, "objectForKey:", CPKeyValueChangeNewKey), CPKeyValueChangeOldKey);
        objj_msgSend(inverseChangeDictionary, "removeObjectForKey:", CPKeyValueChangeNewKey);
    }
    else if (changeKind === CPKeyValueChangeRemoval)
    {
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", CPKeyValueChangeInsertion, CPKeyValueChangeKindKey);
        objj_msgSend(inverseChangeDictionary, "setObject:forKey:", objj_msgSend(self, "objectForKey:", CPKeyValueChangeOldKey), CPKeyValueChangeNewKey);
        objj_msgSend(inverseChangeDictionary, "removeObjectForKey:", CPKeyValueChangeOldKey);
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_targetObject"), new objj_ivar("_nativeClass"), new objj_ivar("_changesForKey"), new objj_ivar("_nestingForKey"), new objj_ivar("_observersForKey"), new objj_ivar("_observersForKeyLength"), new objj_ivar("_replacedKeys"), new objj_ivar("_adding")]);objj_registerClassPair(the_class);
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
        self._nativeClass = objj_msgSend(aTarget, "class");
        self._observersForKey = {};
        self._changesForKey = {};
        self._nestingForKey = {};
        self._observersForKeyLength = 0;
        objj_msgSend(self, "_replaceClass");
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
    self._replacedKeys = objj_msgSend(CPSet, "set");
    kvoClass._replacedKeys = self._replacedKeys;
    var methods = class_copyMethodList(_CPKVOModelSubclass);
    if (objj_msgSend(self._targetObject, "isKindOfClass:", objj_msgSend(CPDictionary, "class")))
        methods = methods.concat(class_copyMethodList(_CPKVOModelDictionarySubclass));
    class_addMethods(kvoClass, methods);
    self._targetObject.isa = kvoClass;
}
,["void"]), new objj_method(sel_getUid("_replaceModifiersForKey:"), function $_CPKVOProxy___replaceModifiersForKey_(self, _cmd, aKey)
{
    if (objj_msgSend(self._replacedKeys, "containsObject:", aKey) || !objj_msgSend(self._nativeClass, "automaticallyNotifiesObserversForKey:", aKey))
        return;
    objj_msgSend(self._replacedKeys, "addObject:", aKey);
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
            objj_msgSend(self, "willChangeValueForKey:", aKey);
            setKey_method_imp(self, _cmd, anObject);
            objj_msgSend(self, "didChangeValueForKey:", aKey);
        }, "");
    }
    var _setKey_selector = sel_getUid("_set" + capitalizedKey + ":"),
        _setKey_method = class_getInstanceMethod(theClass, _setKey_selector);
    if (_setKey_method)
    {
        var _setKey_method_imp = _setKey_method.method_imp;
        class_addMethod(KVOClass, _setKey_selector, function(self, _cmd, anObject)
        {
            objj_msgSend(self, "willChangeValueForKey:", aKey);
            _setKey_method_imp(self, _cmd, anObject);
            objj_msgSend(self, "didChangeValueForKey:", aKey);
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
                objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex), aKey);
                insertObject_inKeyAtIndex_method_imp(self, _cmd, anObject, anIndex);
                objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex), aKey);
            }, "");
        }
        if (insertKey_atIndexes_method)
        {
            var insertKey_atIndexes_method_imp = insertKey_atIndexes_method.method_imp;
            class_addMethod(KVOClass, insertKey_atIndexes_selector, function(self, _cmd, objects, indexes)
            {
                objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, objj_msgSend(indexes, "copy"), aKey);
                insertKey_atIndexes_method_imp(self, _cmd, objects, indexes);
                objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, objj_msgSend(indexes, "copy"), aKey);
            }, "");
        }
        if (removeObjectFromKeyAtIndex_method)
        {
            var removeObjectFromKeyAtIndex_method_imp = removeObjectFromKeyAtIndex_method.method_imp;
            class_addMethod(KVOClass, removeObjectFromKeyAtIndex_selector, function(self, _cmd, anIndex)
            {
                objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex), aKey);
                removeObjectFromKeyAtIndex_method_imp(self, _cmd, anIndex);
                objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex), aKey);
            }, "");
        }
        if (removeKeyAtIndexes_method)
        {
            var removeKeyAtIndexes_method_imp = removeKeyAtIndexes_method.method_imp;
            class_addMethod(KVOClass, removeKeyAtIndexes_selector, function(self, _cmd, indexes)
            {
                objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, objj_msgSend(indexes, "copy"), aKey);
                removeKeyAtIndexes_method_imp(self, _cmd, indexes);
                objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, objj_msgSend(indexes, "copy"), aKey);
            }, "");
        }
        var replaceObjectInKeyAtIndex_withObject_selector = sel_getUid("replaceObjectIn" + capitalizedKey + "AtIndex:withObject:"),
            replaceObjectInKeyAtIndex_withObject_method = class_getInstanceMethod(theClass, replaceObjectInKeyAtIndex_withObject_selector);
        if (replaceObjectInKeyAtIndex_withObject_method)
        {
            var replaceObjectInKeyAtIndex_withObject_method_imp = replaceObjectInKeyAtIndex_withObject_method.method_imp;
            class_addMethod(KVOClass, replaceObjectInKeyAtIndex_withObject_selector, function(self, _cmd, anIndex, anObject)
            {
                objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex), aKey);
                replaceObjectInKeyAtIndex_withObject_method_imp(self, _cmd, anIndex, anObject);
                objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex), aKey);
            }, "");
        }
        var replaceKeyAtIndexes_withKey_selector = sel_getUid("replace" + capitalizedKey + "AtIndexes:with" + capitalizedKey + ":"),
            replaceKeyAtIndexes_withKey_method = class_getInstanceMethod(theClass, replaceKeyAtIndexes_withKey_selector);
        if (replaceKeyAtIndexes_withKey_method)
        {
            var replaceKeyAtIndexes_withKey_method_imp = replaceKeyAtIndexes_withKey_method.method_imp;
            class_addMethod(KVOClass, replaceKeyAtIndexes_withKey_selector, function(self, _cmd, indexes, objects)
            {
                objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, objj_msgSend(indexes, "copy"), aKey);
                replaceObjectInKeyAtIndex_withObject_method_imp(self, _cmd, indexes, objects);
                objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, objj_msgSend(indexes, "copy"), aKey);
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
                objj_msgSend(self, "willChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueUnionSetMutation, objj_msgSend(CPSet, "setWithObject:", anObject));
                addKeyObject_method_imp(self, _cmd, anObject);
                objj_msgSend(self, "didChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueUnionSetMutation, objj_msgSend(CPSet, "setWithObject:", anObject));
            }, "");
        }
        if (addKey_method)
        {
            var addKey_method_imp = addKey_method.method_imp;
            class_addMethod(KVOClass, addKey_selector, function(self, _cmd, objects)
            {
                objj_msgSend(self, "willChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueUnionSetMutation, objj_msgSend(objects, "copy"));
                addKey_method_imp(self, _cmd, objects);
                objj_msgSend(self, "didChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueUnionSetMutation, objj_msgSend(objects, "copy"));
            }, "");
        }
        if (removeKeyObject_method)
        {
            var removeKeyObject_method_imp = removeKeyObject_method.method_imp;
            class_addMethod(KVOClass, removeKeyObject_selector, function(self, _cmd, anObject)
            {
                objj_msgSend(self, "willChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueMinusSetMutation, objj_msgSend(CPSet, "setWithObject:", anObject));
                removeKeyObject_method_imp(self, _cmd, anObject);
                objj_msgSend(self, "didChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueMinusSetMutation, objj_msgSend(CPSet, "setWithObject:", anObject));
            }, "");
        }
        if (removeKey_method)
        {
            var removeKey_method_imp = removeKey_method.method_imp;
            class_addMethod(KVOClass, removeKey_selector, function(self, _cmd, objects)
            {
                objj_msgSend(self, "willChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueMinusSetMutation, objj_msgSend(objects, "copy"));
                removeKey_method_imp(self, _cmd, objects);
                objj_msgSend(self, "didChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueMinusSetMutation, objj_msgSend(objects, "copy"));
            }, "");
        }
        var intersectKey_selector = sel_getUid("intersect" + capitalizedKey + ":"),
            intersectKey_method = class_getInstanceMethod(theClass, intersectKey_selector);
        if (intersectKey_method)
        {
            var intersectKey_method_imp = intersectKey_method.method_imp;
            class_addMethod(KVOClass, intersectKey_selector, function(self, _cmd, aSet)
            {
                objj_msgSend(self, "willChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueIntersectSetMutation, objj_msgSend(aSet, "copy"));
                intersectKey_method_imp(self, _cmd, aSet);
                objj_msgSend(self, "didChangeValueForKey:withSetMutation:usingObjects:", aKey, CPKeyValueIntersectSetMutation, objj_msgSend(aSet, "copy"));
            }, "");
        }
    }
    var affectingKeys = objj_msgSend(objj_msgSend(self._nativeClass, "keyPathsForValuesAffectingValueForKey:", aKey), "allObjects"),
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
            affectedKeys = objj_msgSend(CPSet, "new");
            dependentKeysForClass[affectingKey] = affectedKeys;
        }
        objj_msgSend(affectedKeys, "addObject:", aKey);
        if (affectingKey.indexOf(".") !== -1)
            objj_msgSend(self._targetObject, "addObserver:forKeyPath:options:context:", self, affectingKey, CPKeyValueObservingOptionPrior | kvoNewAndOld, nil);
        else
            objj_msgSend(self, "_replaceModifiersForKey:", affectingKey);
    }
}
,["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPKVOProxy__observeValueForKeyPath_ofObject_change_context_(self, _cmd, theKeyPath, theObject, theChanges, theContext)
{
    var dependentKeysForClass = self._nativeClass[DependentKeysKey],
        dependantKeys = objj_msgSend(dependentKeysForClass[theKeyPath], "allObjects"),
        isBeforeFlag = !!objj_msgSend(theChanges, "objectForKey:", CPKeyValueChangeNotificationIsPriorKey);
    for (var i = 0; i < objj_msgSend(dependantKeys, "count"); i++)
    {
        var dependantKey = objj_msgSend(dependantKeys, "objectAtIndex:", i);
        objj_msgSend(self, "_sendNotificationsForKey:changeOptions:isBefore:", dependantKey, theChanges, isBeforeFlag);
    }
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("_addObserver:forKeyPath:options:context:"), function $_CPKVOProxy___addObserver_forKeyPath_options_context_(self, _cmd, anObserver, aPath, options, aContext)
{
    if (!anObserver)
        return;
    var forwarder = nil;
    if (aPath.indexOf('.') !== CPNotFound && aPath.charAt(0) !== '@')
        forwarder = objj_msgSend(objj_msgSend(_CPKVOForwardingObserver, "alloc"), "initWithKeyPath:object:observer:options:context:", aPath, self._targetObject, anObserver, options, aContext);
    else
        objj_msgSend(self, "_replaceModifiersForKey:", aPath);
    var observers = self._observersForKey[aPath];
    if (!observers)
    {
        observers = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._observersForKey[aPath] = observers;
        self._observersForKeyLength++;
    }
    objj_msgSend(observers, "setObject:forKey:", _CPKVOInfoMake(anObserver, options, aContext, forwarder), objj_msgSend(anObserver, "UID"));
    if (options & CPKeyValueObservingOptionInitial)
    {
        var newValue = objj_msgSend(self._targetObject, "valueForKeyPath:", aPath);
        if (newValue === nil || newValue === undefined)
            newValue = objj_msgSend(CPNull, "null");
        var changes = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", newValue, CPKeyValueChangeNewKey);
        objj_msgSend(anObserver, "observeValueForKeyPath:ofObject:change:context:", aPath, self._targetObject, changes, aContext);
    }
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
        var observer = objj_msgSend(observers, "objectForKey:", objj_msgSend(anObserver, "UID")),
            forwarder = observer ? observer.forwarder : nil;
        objj_msgSend(forwarder, "finalize");
    }
    objj_msgSend(observers, "removeObjectForKey:", objj_msgSend(anObserver, "UID"));
    if (!objj_msgSend(observers, "count"))
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
    var changes = self._changesForKey[aKey];
    if (isBefore)
    {
        if (changes)
        {
            var level = self._nestingForKey[aKey];
            if (!level)
                objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "_changesForKey without _nestingForKey");
            self._nestingForKey[aKey] = level + 1;
            return;
        }
        self._nestingForKey[aKey] = 1;
        changes = changeOptions;
        var indexes = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeIndexesKey),
            setMutationKind = changes[_CPKeyValueChangeSetMutationKindKey];
        if (setMutationKind)
        {
            var setMutationObjects = objj_msgSend(changes[_CPKeyValueChangeSetMutationObjectsKey], "copy"),
                setExistingObjects = objj_msgSend(objj_msgSend(self._targetObject, "valueForKey:", aKey), "copy");
            if (setMutationKind == CPKeyValueMinusSetMutation)
            {
                objj_msgSend(setExistingObjects, "intersectSet:", setMutationObjects);
                objj_msgSend(changes, "setValue:forKey:", setExistingObjects, CPKeyValueChangeOldKey);
            }
            else if (setMutationKind === CPKeyValueIntersectSetMutation || setMutationKind === CPKeyValueSetSetMutation)
            {
                objj_msgSend(setExistingObjects, "minusSet:", setMutationObjects);
                objj_msgSend(changes, "setValue:forKey:", setExistingObjects, CPKeyValueChangeOldKey);
            }
            if (setMutationKind === CPKeyValueUnionSetMutation || setMutationKind === CPKeyValueSetSetMutation)
            {
                objj_msgSend(setMutationObjects, "minusSet:", setExistingObjects);
                changes[_CPKeyValueChangeSetMutationNewValueKey] = setMutationObjects;
            }
        }
        else if (indexes)
        {
            var type = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeKindKey);
            if (type === CPKeyValueChangeReplacement || type === CPKeyValueChangeRemoval)
            {
                var newValues = objj_msgSend(objj_msgSend(self._targetObject, "mutableArrayValueForKeyPath:", aKey), "objectsAtIndexes:", indexes);
                objj_msgSend(changes, "setValue:forKey:", newValues, CPKeyValueChangeOldKey);
            }
        }
        else
        {
            var oldValue = objj_msgSend(self._targetObject, "valueForKey:", aKey);
            if (oldValue === nil || oldValue === undefined)
                oldValue = objj_msgSend(CPNull, "null");
            objj_msgSend(changes, "setObject:forKey:", oldValue, CPKeyValueChangeOldKey);
        }
        objj_msgSend(changes, "setObject:forKey:", 1, CPKeyValueChangeNotificationIsPriorKey);
        self._changesForKey[aKey] = changes;
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
                objj_msgSend(CPException, "raise:reason:", "CPKeyValueObservingException", "'didChange...' message called without prior call of 'willChange...'");
        }
        self._nestingForKey[aKey] = level - 1;
        if (level - 1 > 0)
        {
            return;
        }
        delete self._nestingForKey[aKey];
        objj_msgSend(changes, "removeObjectForKey:", CPKeyValueChangeNotificationIsPriorKey);
        var indexes = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeIndexesKey),
            setMutationKind = changes[_CPKeyValueChangeSetMutationKindKey];
        if (setMutationKind)
        {
            var newValue = changes[_CPKeyValueChangeSetMutationNewValueKey];
            objj_msgSend(changes, "setValue:forKey:", newValue, CPKeyValueChangeNewKey);
            delete changes[_CPKeyValueChangeSetMutationNewValueKey];
            delete changes[_CPKeyValueChangeSetMutationObjectsKey];
            delete changes[_CPKeyValueChangeSetMutationKindKey];
        }
        else if (indexes)
        {
            var type = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeKindKey);
            if (type == CPKeyValueChangeReplacement || type == CPKeyValueChangeInsertion)
            {
                var newValues = objj_msgSend(objj_msgSend(self._targetObject, "mutableArrayValueForKeyPath:", aKey), "objectsAtIndexes:", indexes);
                objj_msgSend(changes, "setValue:forKey:", newValues, CPKeyValueChangeNewKey);
            }
        }
        else
        {
            var newValue = objj_msgSend(self._targetObject, "valueForKey:", aKey);
            if (newValue === nil || newValue === undefined)
                newValue = objj_msgSend(CPNull, "null");
            objj_msgSend(changes, "setObject:forKey:", newValue, CPKeyValueChangeNewKey);
        }
        delete self._changesForKey[aKey];
    }
    var observers = objj_msgSend(self._observersForKey[aKey], "allValues"),
        count = observers ? observers.length : 0;
    while (count--)
    {
        var observerInfo = observers[count];
        if (!isBefore || observerInfo.options & CPKeyValueObservingOptionPrior)
            objj_msgSend(observerInfo.observer, "observeValueForKeyPath:ofObject:change:context:", aKey, self._targetObject, changes, observerInfo.context);
    }
    var dependentKeysMap = self._nativeClass[DependentKeysKey];
    if (!dependentKeysMap)
        return;
    var dependentKeyPaths = objj_msgSend(dependentKeysMap[aKey], "allObjects");
    if (!dependentKeyPaths)
        return;
    var index = 0,
        count = objj_msgSend(dependentKeyPaths, "count");
    for (; index < count; ++index)
    {
        var keyPath = dependentKeyPaths[index];
        objj_msgSend(self, "_sendNotificationsForKey:changeOptions:isBefore:", keyPath, isBefore ? objj_msgSend(changeOptions, "copy") : self._changesForKey[keyPath], isBefore);
    }
}
,["void","CPString","CPDictionary","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("proxyForObject:"), function $_CPKVOProxy__proxyForObject_(self, _cmd, anObject)
{
    var proxy = anObject[KVOProxyKey];
    if (proxy)
        return proxy;
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithTarget:", anObject);
}
,["id","CPObject"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPKVOModelSubclass"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("willChangeValueForKey:"), function $_CPKVOModelSubclass__willChangeValueForKey_(self, _cmd, aKey)
{
    var superClass = objj_msgSend(self, "class"),
        methodSelector = sel_getUid("willChangeValueForKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, aKey);
    if (!aKey)
        return;
    var changeOptions = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPKeyValueChangeSetting, CPKeyValueChangeKindKey);
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, changeOptions, YES);
}
,["void","CPString"]), new objj_method(sel_getUid("didChangeValueForKey:"), function $_CPKVOModelSubclass__didChangeValueForKey_(self, _cmd, aKey)
{
    var superClass = objj_msgSend(self, "class"),
        methodSelector = sel_getUid("didChangeValueForKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, aKey);
    if (!aKey)
        return;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, nil, NO);
}
,["void","CPString"]), new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"), function $_CPKVOModelSubclass__willChange_valuesAtIndexes_forKey_(self, _cmd, change, indexes, aKey)
{
    var superClass = objj_msgSend(self, "class"),
        methodSelector = sel_getUid("willChange:valuesAtIndexes:forKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, change, indexes, aKey);
    if (!aKey)
        return;
    var changeOptions = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", change, CPKeyValueChangeKindKey, indexes, CPKeyValueChangeIndexesKey);
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, changeOptions, YES);
}
,["void","CPKeyValueChange","CPIndexSet","CPString"]), new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"), function $_CPKVOModelSubclass__didChange_valuesAtIndexes_forKey_(self, _cmd, change, indexes, aKey)
{
    var superClass = objj_msgSend(self, "class"),
        methodSelector = sel_getUid("didChange:valuesAtIndexes:forKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, change, indexes, aKey);
    if (!aKey)
        return;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, nil, NO);
}
,["void","CPKeyValueChange","CPIndexSet","CPString"]), new objj_method(sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"), function $_CPKVOModelSubclass__willChangeValueForKey_withSetMutation_usingObjects_(self, _cmd, aKey, mutationKind, objects)
{
    var superClass = objj_msgSend(self, "class"),
        methodSelector = sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, aKey, mutationKind, objects);
    if (!aKey)
        return;
    var changeKind = _changeKindForSetMutationKind(mutationKind),
        changeOptions = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", changeKind, CPKeyValueChangeKindKey);
    changeOptions[_CPKeyValueChangeSetMutationObjectsKey] = objects;
    changeOptions[_CPKeyValueChangeSetMutationKindKey] = mutationKind;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, changeOptions, YES);
}
,["void","CPString","CPKeyValueSetMutationKind","CPSet"]), new objj_method(sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"), function $_CPKVOModelSubclass__didChangeValueForKey_withSetMutation_usingObjects_(self, _cmd, aKey, mutationKind, objects)
{
    var superClass = objj_msgSend(self, "class"),
        methodSelector = sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, aKey, mutationKind, objects);
    if (!aKey)
        return;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, nil, NO);
}
,["void","CPString","CPKeyValueSetMutationKind","CPSet"]), new objj_method(sel_getUid("class"), function $_CPKVOModelSubclass__class(self, _cmd)
{
    return self[KVOProxyKey]._nativeClass;
}
,["Class"]), new objj_method(sel_getUid("superclass"), function $_CPKVOModelSubclass__superclass(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "class"), "superclass");
}
,["Class"]), new objj_method(sel_getUid("isKindOfClass:"), function $_CPKVOModelSubclass__isKindOfClass_(self, _cmd, aClass)
{
    return objj_msgSend(objj_msgSend(self, "class"), "isSubclassOfClass:", aClass);
}
,["BOOL","Class"]), new objj_method(sel_getUid("isMemberOfClass:"), function $_CPKVOModelSubclass__isMemberOfClass_(self, _cmd, aClass)
{
    return objj_msgSend(self, "class") == aClass;
}
,["BOOL","Class"]), new objj_method(sel_getUid("className"), function $_CPKVOModelSubclass__className(self, _cmd)
{
    return objj_msgSend(self, "class").name;
}
,["CPString"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPKVOModelDictionarySubclass"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("removeAllObjects"), function $_CPKVOModelDictionarySubclass__removeAllObjects(self, _cmd)
{
    var keys = objj_msgSend(self, "allKeys"),
        count = objj_msgSend(keys, "count"),
        i = 0;
    for (; i < count; i++)
        objj_msgSend(self, "willChangeValueForKey:", keys[i]);
    var superClass = objj_msgSend(self, "class"),
        methodSelector = sel_getUid("removeAllObjects"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector);
    for (i = 0; i < count; i++)
        objj_msgSend(self, "didChangeValueForKey:", keys[i]);
}
,["void"]), new objj_method(sel_getUid("removeObjectForKey:"), function $_CPKVOModelDictionarySubclass__removeObjectForKey_(self, _cmd, aKey)
{
    objj_msgSend(self, "willChangeValueForKey:", aKey);
    var superClass = objj_msgSend(self, "class"),
        methodSelector = sel_getUid("removeObjectForKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, aKey);
    objj_msgSend(self, "didChangeValueForKey:", aKey);
}
,["void","id"]), new objj_method(sel_getUid("setObject:forKey:"), function $_CPKVOModelDictionarySubclass__setObject_forKey_(self, _cmd, anObject, aKey)
{
    objj_msgSend(self, "willChangeValueForKey:", aKey);
    var superClass = objj_msgSend(self, "class"),
        methodSelector = sel_getUid("setObject:forKey:"),
        methodImp = class_getMethodImplementation(superClass, methodSelector);
    methodImp(self, methodSelector, anObject, aKey);
    objj_msgSend(self, "didChangeValueForKey:", aKey);
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
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Created _CPKVOForwardingObserver without compound key path: " + aKeyPath);
    self._firstPart = aKeyPath.substring(0, dotIndex);
    self._secondPart = aKeyPath.substring(dotIndex + 1);
    objj_msgSend(self._object, "addObserver:forKeyPath:options:context:", self, self._firstPart, self._options, nil);
    self._value = objj_msgSend(self._object, "valueForKey:", self._firstPart);
    if (self._value)
        objj_msgSend(self._value, "addObserver:forKeyPath:options:context:", self, self._secondPart, self._options, nil);
    return self;
}
,["id","CPString","id","id","unsigned","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPKVOForwardingObserver__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, aContext)
{
    if (aKeyPath === self._firstPart)
    {
        var oldValue = objj_msgSend(self._value, "valueForKeyPath:", self._secondPart),
            newValue = objj_msgSend(self._object, "valueForKeyPath:", self._firstPart + "." + self._secondPart),
            pathChanges = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", newValue ? newValue : objj_msgSend(CPNull, "null"), CPKeyValueChangeNewKey, oldValue ? oldValue : objj_msgSend(CPNull, "null"), CPKeyValueChangeOldKey, CPKeyValueChangeSetting, CPKeyValueChangeKindKey);
        objj_msgSend(self._observer, "observeValueForKeyPath:ofObject:change:context:", self._firstPart + "." + self._secondPart, self._object, pathChanges, self._context);
        if (self._value)
            objj_msgSend(self._value, "removeObserver:forKeyPath:", self, self._secondPart);
        self._value = objj_msgSend(self._object, "valueForKey:", self._firstPart);
        if (self._value)
            objj_msgSend(self._value, "addObserver:forKeyPath:options:context:", self, self._secondPart, self._options, nil);
    }
    else
    {
        objj_msgSend(self._observer, "observeValueForKeyPath:ofObject:change:context:", self._firstPart + "." + aKeyPath, self._object, changes, self._context);
    }
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("finalize"), function $_CPKVOForwardingObserver__finalize(self, _cmd)
{
    if (self._value)
        objj_msgSend(self._value, "removeObserver:forKeyPath:", self, self._secondPart);
    objj_msgSend(self._object, "removeObserver:forKeyPath:", self, self._firstPart);
    self._object = nil;
    self._observer = nil;
    self._context = nil;
    self._value = nil;
}
,["void"])]);
}var _CPKVOInfoMake = function(anObserver, theOptions, aContext, aForwarder)
{
    return {observer: anObserver, options: theOptions, context: aContext, forwarder: aForwarder};
};
objj_executeFile("CPArray+KVO.j", YES);objj_executeFile("CPSet+KVO.j", YES);