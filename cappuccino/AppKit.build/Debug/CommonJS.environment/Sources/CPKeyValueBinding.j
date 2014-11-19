@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;25;Foundation/CPInvocation.jI;31;Foundation/CPValueTransformer.jI;32;Foundation/CPKeyValueObserving.jt;44413;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPInvocation.j", NO);objj_executeFile("Foundation/CPValueTransformer.j", NO);objj_executeFile("Foundation/CPKeyValueObserving.j", NO);var exposedBindingsMap = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"),
    bindingsMap = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
var CPBindingOperationAnd = 0,
    CPBindingOperationOr = 1;
{var the_class = objj_allocateClassPair(CPObject, "CPBinder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_info"), new objj_ivar("_source"), new objj_ivar("_suppressedNotifications"), new objj_ivar("_placeholderForMarker")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("source"), function $CPBinder__source(self, _cmd)
{
    return self._source;
}
,["id"]), new objj_method(sel_getUid("_setSource:"), function $CPBinder___setSource_(self, _cmd, newValue)
{
    self._source = newValue;
}
,["void","id"]), new objj_method(sel_getUid("initWithBinding:name:to:keyPath:options:from:"), function $CPBinder__initWithBinding_name_to_keyPath_options_from_(self, _cmd, aBinding, aName, aDestination, aKeyPath, options, aSource)
{
    self = (self == null ? null : self.isa.objj_msgSend0(self, "init"));
    if (self)
    {
        self._source = aSource;
        self._info = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aDestination, CPObservedObjectKey, aKeyPath, CPObservedKeyPathKey);
        self._suppressedNotifications = {};
        self._placeholderForMarker = {};
        if (options)
            ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", options, CPOptionsKey));
        (self == null ? null : self.isa.objj_msgSend2(self, "_updatePlaceholdersWithOptions:forBinding:", options, aName));
        (aDestination == null ? null : aDestination.isa.objj_msgSend(aDestination, "addObserver:forKeyPath:options:context:", self, aKeyPath, 0, aBinding));
        var bindings = (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "objectForKey:", ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"))));
        if (!bindings)
        {
            bindings = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
            (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend2(bindingsMap, "setObject:forKey:", bindings, ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"))));
        }
        (bindings == null ? null : bindings.isa.objj_msgSend2(bindings, "setObject:forKey:", self, aName));
        (self == null ? null : self.isa.objj_msgSend1(self, "setValueFor:", aBinding));
    }
    return self;
    var ___r1;
}
,["id","CPString","CPString","id","CPString","CPDictionary","id"]), new objj_method(sel_getUid("raiseIfNotApplicable:forKeyPath:options:"), function $CPBinder__raiseIfNotApplicable_forKeyPath_options_(self, _cmd, aValue, keyPath, options)
{
    if (aValue === CPNotApplicableMarker && (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPRaisesForNotApplicableKeysBindingOption)))
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPGenericException, "Cannot transform non-applicable key on: " + self._source + " key path: " + keyPath + " value: " + aValue);
    }
}
,["void","id","CPString","CPDictionary"]), new objj_method(sel_getUid("setValueFor:"), function $CPBinder__setValueFor_(self, _cmd, theBinding)
{
    var destination = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedObjectKey)),
        keyPath = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedKeyPathKey)),
        options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey)),
        newValue = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKeyPath:", keyPath));
    if (CPIsControllerMarker(newValue))
    {
        self.isa.objj_msgSend3(self, "raiseIfNotApplicable:forKeyPath:options:", newValue, keyPath, options);
        var value = self.isa.objj_msgSend1(self, "_placeholderForMarker:", newValue);
        self.isa.objj_msgSend3(self, "setPlaceholderValue:withMarker:forBinding:", value, newValue, theBinding);
    }
    else
    {
        var value = self.isa.objj_msgSend2(self, "transformValue:withOptions:", newValue, options);
        self.isa.objj_msgSend2(self, "setValue:forBinding:", value, theBinding);
    }
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $CPBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, aBinding));
    var ___r1;
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $CPBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", aValue, aBinding));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $CPBinder__reverseSetValueFor_(self, _cmd, aBinding)
{
    var destination = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedObjectKey)),
        keyPath = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedKeyPathKey)),
        options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey)),
        newValue = self.isa.objj_msgSend1(self, "valueForBinding:", aBinding);
    newValue = self.isa.objj_msgSend2(self, "reverseTransformValue:withOptions:", newValue, options);
    self.isa.objj_msgSend2(self, "suppressSpecificNotificationFromObject:keyPath:", destination, keyPath);
    (destination == null ? null : destination.isa.objj_msgSend2(destination, "setValue:forKeyPath:", newValue, keyPath));
    self.isa.objj_msgSend2(self, "unsuppressSpecificNotificationFromObject:keyPath:", destination, keyPath);
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $CPBinder__valueForBinding_(self, _cmd, aBinding)
{
    return ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", aBinding));
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPBinder__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{
    if (!changes)
        return;
    var objectSuppressions = self._suppressedNotifications[(anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"))];
    if (objectSuppressions && objectSuppressions[aKeyPath])
        return;
    self.isa.objj_msgSend1(self, "setValueFor:", context);
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("transformValue:withOptions:"), function $CPBinder__transformValue_withOptions_(self, _cmd, aValue, options)
{
    var valueTransformerName = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPValueTransformerNameBindingOption)),
        valueTransformer;
    if (valueTransformerName)
    {
        valueTransformer = CPValueTransformer.isa.objj_msgSend1(CPValueTransformer, "valueTransformerForName:", valueTransformerName);
        if (!valueTransformer)
        {
            var valueTransformerClass = CPClassFromString(valueTransformerName);
            if (valueTransformerClass)
            {
                valueTransformer = ((___r1 = (valueTransformerClass == null ? null : valueTransformerClass.isa.objj_msgSend0(valueTransformerClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
                (valueTransformerClass == null ? null : valueTransformerClass.isa.objj_msgSend2(valueTransformerClass, "setValueTransformer:forName:", valueTransformer, valueTransformerName));
            }
        }
    }
    else
        valueTransformer = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPValueTransformerBindingOption));
    if (valueTransformer)
        aValue = (valueTransformer == null ? null : valueTransformer.isa.objj_msgSend1(valueTransformer, "transformedValue:", aValue));
    if ((aValue === undefined || aValue === nil || aValue === CPNull.isa.objj_msgSend0(CPNull, "null")) && !((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setPlaceholderString:"))))
        aValue = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPNullPlaceholderBindingOption)) || nil;
    return aValue;
    var ___r1;
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("reverseTransformValue:withOptions:"), function $CPBinder__reverseTransformValue_withOptions_(self, _cmd, aValue, options)
{
    var valueTransformerName = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPValueTransformerNameBindingOption)),
        valueTransformer;
    if (valueTransformerName)
        valueTransformer = CPValueTransformer.isa.objj_msgSend1(CPValueTransformer, "valueTransformerForName:", valueTransformerName);
    else
        valueTransformer = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPValueTransformerBindingOption));
    if (valueTransformer && ((___r1 = (valueTransformer == null ? null : valueTransformer.isa.objj_msgSend0(valueTransformer, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allowsReverseTransformation")))
        aValue = (valueTransformer == null ? null : valueTransformer.isa.objj_msgSend1(valueTransformer, "reverseTransformedValue:", aValue));
    return aValue;
    var ___r1;
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("continuouslyUpdatesValue"), function $CPBinder__continuouslyUpdatesValue(self, _cmd)
{
    var options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey));
    return ((___r1 = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPContinuouslyUpdatesValueBindingOption))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "boolValue"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("handlesContentAsCompoundValue"), function $CPBinder__handlesContentAsCompoundValue(self, _cmd)
{
    var options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey));
    return ((___r1 = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPHandlesContentAsCompoundValueBindingOption))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "boolValue"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("suppressSpecificNotificationFromObject:keyPath:"), function $CPBinder__suppressSpecificNotificationFromObject_keyPath_(self, _cmd, anObject, aKeyPath)
{
    if (!anObject)
        return;
    var uid = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID")),
        objectSuppressions = self._suppressedNotifications[uid];
    if (!objectSuppressions)
        self._suppressedNotifications[uid] = objectSuppressions = {};
    objectSuppressions[aKeyPath] = YES;
}
,["void","id","CPString"]), new objj_method(sel_getUid("unsuppressSpecificNotificationFromObject:keyPath:"), function $CPBinder__unsuppressSpecificNotificationFromObject_keyPath_(self, _cmd, anObject, aKeyPath)
{
    if (!anObject)
        return;
    var uid = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID")),
        objectSuppressions = self._suppressedNotifications[uid];
    if (!objectSuppressions)
        return;
    delete objectSuppressions[aKeyPath];
}
,["void","id","CPString"]), new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $CPBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{
    var count = (CPBinderPlaceholderMarkers == null ? null : CPBinderPlaceholderMarkers.isa.objj_msgSend0(CPBinderPlaceholderMarkers, "count"));
    while (count--)
    {
        var marker = CPBinderPlaceholderMarkers[count],
            optionName = CPBinderPlaceholderOptions[count],
            isExplicit = (options == null ? null : options.isa.objj_msgSend1(options, "containsKey:", optionName)),
            placeholder = isExplicit ? (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", optionName)) : nil;
        self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", placeholder, marker, !isExplicit);
    }
}
,["void","CPDictionary"]), new objj_method(sel_getUid("_updatePlaceholdersWithOptions:forBinding:"), function $CPBinder___updatePlaceholdersWithOptions_forBinding_(self, _cmd, options, aBinding)
{
    self.isa.objj_msgSend1(self, "_updatePlaceholdersWithOptions:", options);
}
,["void","CPDictionary","CPString"]), new objj_method(sel_getUid("_placeholderForMarker:"), function $CPBinder___placeholderForMarker_(self, _cmd, aMarker)
{
    var placeholder = self._placeholderForMarker[(aMarker == null ? null : aMarker.isa.objj_msgSend0(aMarker, "UID"))];
    if (placeholder)
        return placeholder.value;
    return nil;
}
,["JSObject","id"]), new objj_method(sel_getUid("_setPlaceholder:forMarker:isDefault:"), function $CPBinder___setPlaceholder_forMarker_isDefault_(self, _cmd, aPlaceholder, aMarker, isDefault)
{
    if (isDefault)
    {
        var existingPlaceholder = self._placeholderForMarker[(aMarker == null ? null : aMarker.isa.objj_msgSend0(aMarker, "UID"))];
        if (existingPlaceholder && !existingPlaceholder.isDefault)
            return;
    }
    self._placeholderForMarker[(aMarker == null ? null : aMarker.isa.objj_msgSend0(aMarker, "UID"))] = {'isDefault': isDefault, 'value': aPlaceholder};
}
,["void","id","id","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("exposeBinding:forClass:"), function $CPBinder__exposeBinding_forClass_(self, _cmd, aBinding, aClass)
{
    var bindings = (exposedBindingsMap == null ? null : exposedBindingsMap.isa.objj_msgSend1(exposedBindingsMap, "objectForKey:", (aClass == null ? null : aClass.isa.objj_msgSend0(aClass, "UID"))));
    if (!bindings)
    {
        bindings = [];
        (exposedBindingsMap == null ? null : exposedBindingsMap.isa.objj_msgSend2(exposedBindingsMap, "setObject:forKey:", bindings, (aClass == null ? null : aClass.isa.objj_msgSend0(aClass, "UID"))));
    }
    bindings.push(aBinding);
}
,["void","CPString","Class"]), new objj_method(sel_getUid("exposedBindingsForClass:"), function $CPBinder__exposedBindingsForClass_(self, _cmd, aClass)
{
    return ((___r1 = (exposedBindingsMap == null ? null : exposedBindingsMap.isa.objj_msgSend1(exposedBindingsMap, "objectForKey:", (aClass == null ? null : aClass.isa.objj_msgSend0(aClass, "UID"))))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    var ___r1;
}
,["CPArray","Class"]), new objj_method(sel_getUid("getBinding:forObject:"), function $CPBinder__getBinding_forObject_(self, _cmd, aBinding, anObject)
{
    return ((___r1 = (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "objectForKey:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aBinding));
    var ___r1;
}
,["CPBinder","CPString","id"]), new objj_method(sel_getUid("_reverseSetValueFromExclusiveBinderForObject:"), function $CPBinder___reverseSetValueFromExclusiveBinderForObject_(self, _cmd, anObject)
{
    var bindersByBindingName = (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "objectForKey:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"))));
    (bindersByBindingName == null ? null : bindersByBindingName.isa.objj_msgSend1(bindersByBindingName, "enumerateKeysAndObjectsUsingBlock:", function(binding, binder, stop)
    {
        if ((binder == null ? null : binder.isa.objj_msgSend1(binder, "isKindOfClass:", self.isa.objj_msgSend0(self, "class"))))
        {
            (binder == null ? null : binder.isa.objj_msgSend1(binder, "reverseSetValueFor:", binding));
            stop(YES);
        }
    }));
}
,["void","id"]), new objj_method(sel_getUid("infoForBinding:forObject:"), function $CPBinder__infoForBinding_forObject_(self, _cmd, aBinding, anObject)
{
    var theBinding = self.isa.objj_msgSend2(self, "getBinding:forObject:", aBinding, anObject);
    if (theBinding)
        return theBinding._info;
    return nil;
}
,["CPDictionary","CPString","id"]), new objj_method(sel_getUid("allBindingsForObject:"), function $CPBinder__allBindingsForObject_(self, _cmd, anObject)
{
    return (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "objectForKey:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"))));
}
,["CPDictionary","id"]), new objj_method(sel_getUid("unbind:forObject:"), function $CPBinder__unbind_forObject_(self, _cmd, aBinding, anObject)
{
    var bindings = (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "objectForKey:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"))));
    if (!bindings)
        return;
    var theBinding = (bindings == null ? null : bindings.isa.objj_msgSend1(bindings, "objectForKey:", aBinding));
    if (!theBinding)
        return;
    var info = theBinding._info,
        observedObject = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedObjectKey)),
        keyPath = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedKeyPathKey));
    (observedObject == null ? null : observedObject.isa.objj_msgSend2(observedObject, "removeObserver:forKeyPath:", theBinding, keyPath));
    (bindings == null ? null : bindings.isa.objj_msgSend1(bindings, "removeObjectForKey:", aBinding));
}
,["void","CPString","id"]), new objj_method(sel_getUid("unbindAllForObject:"), function $CPBinder__unbindAllForObject_(self, _cmd, anObject)
{
    var bindings = (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "objectForKey:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"))));
    if (!bindings)
        return;
    var allKeys = (bindings == null ? null : bindings.isa.objj_msgSend0(bindings, "allKeys")),
        count = allKeys.length;
    while (count--)
        (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "unbind:", allKeys[count]));
    (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "removeObjectForKey:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"))));
}
,["void","id"]), new objj_method(sel_getUid("isBindingAllowed:forObject:"), function $CPBinder__isBindingAllowed_forObject_(self, _cmd, aBinding, anObject)
{
    if (((___r1 = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isBindingExclusive:", aBinding)))
    {
        var bindingsForObject = (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "objectForKey:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID")))),
            allBindings = (bindingsForObject == null ? null : bindingsForObject.isa.objj_msgSend0(bindingsForObject, "allKeys")),
            count = (allBindings == null ? null : allBindings.isa.objj_msgSend0(allBindings, "count"));
        while (count--)
        {
            if (((___r1 = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isBindingExclusive:", allBindings[count])))
                return NO;
        }
    }
    return YES;
    var ___r1;
}
,["BOOL","CPString","id"])]);
}{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("exposedBindings"), function $CPObject__exposedBindings(self, _cmd)
{
    var exposedBindings = [],
        theClass = self.isa.objj_msgSend0(self, "class");
    while (theClass)
    {
        var temp = CPBinder.isa.objj_msgSend1(CPBinder, "exposedBindingsForClass:", theClass);
        if (temp)
            (exposedBindings == null ? null : exposedBindings.isa.objj_msgSend1(exposedBindings, "addObjectsFromArray:", temp));
        theClass = (theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "superclass"));
    }
    return exposedBindings;
}
,["CPArray"]), new objj_method(sel_getUid("valueClassForBinding:"), function $CPObject__valueClassForBinding_(self, _cmd, binding)
{
    return CPString.isa.objj_msgSend0(CPString, "class");
}
,["Class","CPString"]), new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"), function $CPObject__bind_toObject_withKeyPath_options_(self, _cmd, aBinding, anObject, aKeyPath, options)
{
    if (!anObject || !aKeyPath)
        return CPLog.error("Invalid object or path on " + self + " for " + aBinding);
    if (!CPBinder.isa.objj_msgSend2(CPBinder, "isBindingAllowed:forObject:", aBinding, self))
    {
        CPLog.warn(self.isa.objj_msgSend0(self, "description") + " : cannot bind " + aBinding + " because another binding with the same functionality is already in use.");
        return;
    }
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", aBinding));
    self.isa.objj_msgSend1(self, "unbind:", aBinding);
    ((___r1 = (binderClass == null ? null : binderClass.isa.objj_msgSend0(binderClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithBinding:name:to:keyPath:options:from:", self.isa.objj_msgSend1(self, "_replacementKeyPathForBinding:", aBinding), aBinding, anObject, aKeyPath, options, self));
    var ___r1;
}
,["void","CPString","id","CPString","CPDictionary"]), new objj_method(sel_getUid("infoForBinding:"), function $CPObject__infoForBinding_(self, _cmd, aBinding)
{
    return CPBinder.isa.objj_msgSend2(CPBinder, "infoForBinding:forObject:", aBinding, self);
}
,["CPDictionary","CPString"]), new objj_method(sel_getUid("unbind:"), function $CPObject__unbind_(self, _cmd, aBinding)
{
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", aBinding));
    (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "unbind:forObject:", aBinding, self));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("_replacementKeyPathForBinding:"), function $CPObject___replacementKeyPathForBinding_(self, _cmd, binding)
{
    return binding;
}
,["CPString","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("exposeBinding:"), function $CPObject__exposeBinding_(self, _cmd, aBinding)
{
    CPBinder.isa.objj_msgSend2(CPBinder, "exposeBinding:forClass:", aBinding, self.isa.objj_msgSend0(self, "class"));
}
,["void","CPString"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPObject___binderClassForBinding_(self, _cmd, aBinding)
{
    return CPBinder.isa.objj_msgSend0(CPBinder, "class");
}
,["Class","CPString"]), new objj_method(sel_getUid("isBindingExclusive:"), function $CPObject__isBindingExclusive_(self, _cmd, aBinding)
{
    return NO;
}
,["BOOL","CPString"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPValueBinder__setValueFor_(self, _cmd, theBinding)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPValueBinder").super_class }, "setValueFor:", "objectValue");
}
,["void","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $_CPValueBinder__reverseSetValueFor_(self, _cmd, theBinding)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPValueBinder").super_class }, "reverseSetValueFor:", "objectValue");
}
,["void","CPString"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPMultipleValueBooleanBinding"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_operation")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPMultipleValueBooleanBinding__setValueFor_(self, _cmd, aBinding)
{
    var bindings = (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "valueForKey:", ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"))));
    if (!bindings)
        return;
    var baseBinding = aBinding.replace(/\d$/, "");
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", self.isa.objj_msgSend3(self, "resolveMultipleValuesForBinding:bindings:booleanOperation:", baseBinding, bindings, self._operation), baseBinding));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $_CPMultipleValueBooleanBinding__reverseSetValueFor_(self, _cmd, theBinding)
{
}
,["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPMultipleValueBooleanBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{
    self.isa.objj_msgSend1(self, "setValueFor:", context);
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("resolveMultipleValuesForBinding:bindings:booleanOperation:"), function $_CPMultipleValueBooleanBinding__resolveMultipleValuesForBinding_bindings_booleanOperation_(self, _cmd, aBinding, bindings, operation)
{
    var bindingName = aBinding,
        theBinding,
        count = 2;
    while (theBinding = (bindings == null ? null : bindings.isa.objj_msgSend1(bindings, "objectForKey:", bindingName)))
    {
        var info = theBinding._info,
            object = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedObjectKey)),
            keyPath = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedKeyPathKey)),
            options = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPOptionsKey)),
            value = (object == null ? null : object.isa.objj_msgSend1(object, "valueForKeyPath:", keyPath));
        if (CPIsControllerMarker(value))
        {
            self.isa.objj_msgSend3(self, "raiseIfNotApplicable:forKeyPath:options:", value, keyPath, options);
            value = (theBinding == null ? null : theBinding.isa.objj_msgSend1(theBinding, "_placeholderForMarker:", value));
        }
        else
            value = (theBinding == null ? null : theBinding.isa.objj_msgSend2(theBinding, "transformValue:withOptions:", value, options));
        if (operation === CPBindingOperationOr)
        {
            if (value)
                return YES;
        }
        else if (!value)
            return NO;
        bindingName = aBinding + count++;
    }
    return operation === CPBindingOperationOr ? NO : YES;
}
,["BOOL","CPString","CPDictionary","CPBindingOperationKind"])]);
}{var the_class = objj_allocateClassPair(_CPMultipleValueBooleanBinding, "CPMultipleValueAndBinding"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPMultipleValueAndBinding__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMultipleValueAndBinding").super_class }, "init"))
        self._operation = CPBindingOperationAnd;
    return self;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(_CPMultipleValueBooleanBinding, "CPMultipleValueOrBinding"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPMultipleValueOrBinding__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMultipleValueOrBinding").super_class }, "init"))
        self._operation = CPBindingOperationOr;
    return self;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPMultipleValueActionBinding"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_argumentBinding"), new objj_ivar("_targetBinding")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPMultipleValueActionBinding__setValueFor_(self, _cmd, theBinding)
{
    self.isa.objj_msgSend2(self, "checkForNullBinding:initializing:", theBinding, YES);
}
,["void","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $_CPMultipleValueActionBinding__reverseSetValueFor_(self, _cmd, theBinding)
{
}
,["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPMultipleValueActionBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{
    self.isa.objj_msgSend2(self, "checkForNullBinding:initializing:", context, NO);
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("checkForNullBinding:initializing:"), function $_CPMultipleValueActionBinding__checkForNullBinding_initializing_(self, _cmd, theBinding, isInitializing)
{
    if (!((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPButton)))
        return;
    if (isInitializing && theBinding === CPArgumentBinding)
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", YES));
    var bindings = (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "valueForKey:", ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID")))),
        binding = (bindings == null ? null : bindings.isa.objj_msgSend1(bindings, "objectForKey:", theBinding)),
        info = binding._info,
        options = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPOptionsKey));
    if (!(options == null ? null : options.isa.objj_msgSend1(options, "valueForKey:", CPAllowsNullArgumentBindingOption)))
    {
        var object = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedObjectKey)),
            keyPath = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedKeyPathKey)),
            value = (object == null ? null : object.isa.objj_msgSend1(object, "valueForKeyPath:", keyPath));
        if (value === nil || value === undefined)
        {
            ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", NO));
            return;
        }
    }
    if (!isInitializing)
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", YES));
    var ___r1;
}
,["void","CPString","BOOL"]), new objj_method(sel_getUid("invokeAction"), function $_CPMultipleValueActionBinding__invokeAction(self, _cmd)
{
    var bindings = (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "valueForKey:", ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID")))),
        theBinding = (bindings == null ? null : bindings.isa.objj_msgSend1(bindings, "objectForKey:", CPTargetBinding)),
        info = theBinding._info,
        object = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedObjectKey)),
        keyPath = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedKeyPathKey)),
        options = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPOptionsKey)),
        target = (object == null ? null : object.isa.objj_msgSend1(object, "valueForKeyPath:", keyPath)),
        selector = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPSelectorNameBindingOption));
    if (!target || !selector)
        return;
    var invocation = CPInvocation.isa.objj_msgSend1(CPInvocation, "invocationWithMethodSignature:", (target == null ? null : target.isa.objj_msgSend1(target, "methodSignatureForSelector:", selector))),
        bindingName = CPArgumentBinding,
        count = 1;
    while (theBinding = (bindings == null ? null : bindings.isa.objj_msgSend1(bindings, "objectForKey:", bindingName)))
    {
        info = theBinding._info;
        object = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedObjectKey));
        keyPath = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedKeyPathKey));
        (invocation == null ? null : invocation.isa.objj_msgSend2(invocation, "setArgument:atIndex:", (object == null ? null : object.isa.objj_msgSend1(object, "valueForKeyPath:", keyPath)), ++count));
        bindingName = CPArgumentBinding + count;
    }
    (invocation == null ? null : invocation.isa.objj_msgSend1(invocation, "setSelector:", selector));
    (invocation == null ? null : invocation.isa.objj_msgSend1(invocation, "invokeWithTarget:", target));
    var ___r1;
}
,["void"])]);
}{var the_class = objj_allocateClassPair(_CPMultipleValueActionBinding, "CPActionBinding"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPActionBinding__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPActionBinding").super_class }, "init"))
    {
        self._argumentBinding = CPArgumentBinding;
        self._targetBinding = CPTargetBinding;
    }
    return self;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(_CPMultipleValueActionBinding, "CPDoubleClickActionBinding"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPDoubleClickActionBinding__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDoubleClickActionBinding").super_class }, "init"))
    {
        self._argumentBinding = CPArgumentBinding;
        self._targetBinding = CPTargetBinding;
    }
    return self;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPPatternBinding"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bindingKey"), new objj_ivar("_patternPlaceholder")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPPatternBinding__setValueFor_(self, _cmd, aBinding)
{
    var bindings = (bindingsMap == null ? null : bindingsMap.isa.objj_msgSend1(bindingsMap, "valueForKey:", ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"))));
    if (!bindings)
        return;
    var baseBinding = aBinding.replace(/\d$/, ""),
        result = self.isa.objj_msgSend1(self, "resolveMultipleValuesForBindings:", bindings);
    if (result.isPlaceholder)
        self.isa.objj_msgSend3(self, "setPlaceholderValue:withMarker:forBinding:", result.value, result.marker, baseBinding);
    else
        self.isa.objj_msgSend2(self, "setValue:forBinding:", result.value, baseBinding);
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $_CPPatternBinding__reverseSetValueFor_(self, _cmd, theBinding)
{
}
,["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPPatternBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{
    self.isa.objj_msgSend1(self, "setValueFor:", context);
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("resolveMultipleValuesForBindings:"), function $_CPPatternBinding__resolveMultipleValuesForBindings_(self, _cmd, bindings)
{
    var theBinding,
        result = {value: "", isPlaceholder: NO, marker: nil};
    for (var count = 1; theBinding = (bindings == null ? null : bindings.isa.objj_msgSend1(bindings, "objectForKey:", self._bindingKey + count)); ++count)
    {
        var info = theBinding._info,
            object = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedObjectKey)),
            keyPath = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedKeyPathKey)),
            options = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPOptionsKey)),
            value = (object == null ? null : object.isa.objj_msgSend1(object, "valueForKeyPath:", keyPath));
        if (count === 1)
            result.value = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPDisplayPatternBindingOption));
        if (CPIsControllerMarker(value))
        {
            self.isa.objj_msgSend3(self, "raiseIfNotApplicable:forKeyPath:options:", value, keyPath, options);
            result.isPlaceholder = YES;
            result.marker = value;
            value = (theBinding == null ? null : theBinding.isa.objj_msgSend1(theBinding, "_placeholderForMarker:", value));
        }
        else
            value = (theBinding == null ? null : theBinding.isa.objj_msgSend2(theBinding, "transformValue:withOptions:", value, options));
        if (value === nil || value === undefined)
            value = "";
        result.value = result.value.replace("%{" + self._patternPlaceholder + count + "}@", (value == null ? null : value.isa.objj_msgSend0(value, "description")));
    }
    return result;
}
,["JSObject","CPDictionary"])]);
}{var the_class = objj_allocateClassPair(_CPPatternBinding, "CPValueWithPatternBinding"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPValueWithPatternBinding__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPValueWithPatternBinding").super_class }, "init"))
    {
        self._bindingKey = CPDisplayPatternValueBinding;
        self._patternPlaceholder = "value";
    }
    return self;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(_CPPatternBinding, "CPTitleWithPatternBinding"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPTitleWithPatternBinding__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTitleWithPatternBinding").super_class }, "init"))
    {
        self._bindingKey = CPDisplayPatternTitleBinding;
        self._patternPlaceholder = "title";
    }
    return self;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPStateMarker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:"), function $_CPStateMarker__initWithName_(self, _cmd, aName)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStateMarker").super_class }, "init"))
        self._name = aName;
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("description"), function $_CPStateMarker__description(self, _cmd)
{
    return "<" + self._name + ">";
}
,["CPString"])]);
}CPObservedObjectKey = "CPObservedObjectKey";
CPObservedKeyPathKey = "CPObservedKeyPathKey";
CPOptionsKey = "CPOptionsKey";
CPNoSelectionMarker = ((___r1 = _CPStateMarker.isa.objj_msgSend0(_CPStateMarker, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithName:", "NO SELECTION MARKER"));
CPMultipleValuesMarker = ((___r1 = _CPStateMarker.isa.objj_msgSend0(_CPStateMarker, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithName:", "MULTIPLE VALUES MARKER"));
CPNotApplicableMarker = ((___r1 = _CPStateMarker.isa.objj_msgSend0(_CPStateMarker, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithName:", "NOT APPLICABLE MARKER"));
CPNullMarker = ((___r1 = _CPStateMarker.isa.objj_msgSend0(_CPStateMarker, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithName:", "NULL MARKER"));
CPAlignmentBinding = "alignment";
CPArgumentBinding = "argument";
CPContentArrayBinding = "contentArray";
CPContentBinding = "content";
CPContentObjectBinding = "contentObject";
CPContentObjectsBinding = "contentObjects";
CPContentValuesBinding = "contentValues";
CPDisplayPatternTitleBinding = "displayPatternTitle";
CPDisplayPatternValueBinding = "displayPatternValue";
CPDoubleClickArgumentBinding = "doubleClickArgument";
CPDoubleClickTargetBinding = "doubleClickTarget";
CPEditableBinding = "editable";
CPEnabledBinding = "enabled";
CPFontBinding = "font";
CPFontNameBinding = "fontName";
CPFontBoldBinding = "fontBold";
CPHiddenBinding = "hidden";
CPFilterPredicateBinding = "filterPredicate";
CPMaxValueBinding = "maxValue";
CPMinValueBinding = "minValue";
CPPredicateBinding = "predicate";
CPSelectedIndexBinding = "selectedIndex";
CPSelectedLabelBinding = "selectedLabel";
CPSelectedObjectBinding = "selectedObject";
CPSelectedObjectsBinding = "selectedObjects";
CPSelectedTagBinding = "selectedTag";
CPSelectedValueBinding = "selectedValue";
CPSelectedValuesBinding = "selectedValues";
CPSelectionIndexesBinding = "selectionIndexes";
CPTargetBinding = "target";
CPTextColorBinding = "textColor";
CPTitleBinding = "title";
CPToolTipBinding = "toolTip";
CPValueBinding = "value";
CPValueURLBinding = "valueURL";
CPValuePathBinding = "valuePath";
CPDataBinding = "data";
CPAllowsEditingMultipleValuesSelectionBindingOption = "CPAllowsEditingMultipleValuesSelection";
CPAllowsNullArgumentBindingOption = "CPAllowsNullArgument";
CPConditionallySetsEditableBindingOption = "CPConditionallySetsEditable";
CPConditionallySetsEnabledBindingOption = "CPConditionallySetsEnabled";
CPConditionallySetsHiddenBindingOption = "CPConditionallySetsHidden";
CPContinuouslyUpdatesValueBindingOption = "CPContinuouslyUpdatesValue";
CPCreatesSortDescriptorBindingOption = "CPCreatesSortDescriptor";
CPDeletesObjectsOnRemoveBindingsOption = "CPDeletesObjectsOnRemove";
CPDisplayNameBindingOption = "CPDisplayName";
CPDisplayPatternBindingOption = "CPDisplayPattern";
CPHandlesContentAsCompoundValueBindingOption = "CPHandlesContentAsCompoundValue";
CPInsertsNullPlaceholderBindingOption = "CPInsertsNullPlaceholder";
CPInvokesSeparatelyWithArrayObjectsBindingOption = "CPInvokesSeparatelyWithArrayObjects";
CPMultipleValuesPlaceholderBindingOption = "CPMultipleValuesPlaceholder";
CPNoSelectionPlaceholderBindingOption = "CPNoSelectionPlaceholder";
CPNotApplicablePlaceholderBindingOption = "CPNotApplicablePlaceholder";
CPNullPlaceholderBindingOption = "CPNullPlaceholder";
CPPredicateFormatBindingOption = "CPPredicateFormat";
CPRaisesForNotApplicableKeysBindingOption = "CPRaisesForNotApplicableKeys";
CPSelectorNameBindingOption = "CPSelectorName";
CPSelectsAllWhenSettingContentBindingOption = "CPSelectsAllWhenSettingContent";
CPValidatesImmediatelyBindingOption = "CPValidatesImmediately";
CPValueTransformerNameBindingOption = "CPValueTransformerName";
CPValueTransformerBindingOption = "CPValueTransformer";
CPIsControllerMarker = function(anObject)
{
    return anObject === CPMultipleValuesMarker || anObject === CPNoSelectionMarker || anObject === CPNotApplicableMarker || anObject === CPNullMarker;
};
var CPBinderPlaceholderMarkers = [CPMultipleValuesMarker, CPNoSelectionMarker, CPNotApplicableMarker, CPNullMarker],
    CPBinderPlaceholderOptions = [CPMultipleValuesPlaceholderBindingOption, CPNoSelectionPlaceholderBindingOption, CPNotApplicablePlaceholderBindingOption, CPNullPlaceholderBindingOption];
