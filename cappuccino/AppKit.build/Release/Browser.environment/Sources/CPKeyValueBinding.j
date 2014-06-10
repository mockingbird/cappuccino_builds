@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;25;Foundation/CPInvocation.jI;31;Foundation/CPValueTransformer.jI;32;Foundation/CPKeyValueObserving.jt;35083;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPInvocation.j", NO);objj_executeFile("Foundation/CPValueTransformer.j", NO);objj_executeFile("Foundation/CPKeyValueObserving.j", NO);var exposedBindingsMap = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"),
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
    self = objj_msgSend(self, "init");
    if (self)
    {
        self._source = aSource;
        self._info = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aDestination, CPObservedObjectKey, aKeyPath, CPObservedKeyPathKey);
        self._suppressedNotifications = {};
        self._placeholderForMarker = {};
        if (options)
            objj_msgSend(self._info, "setObject:forKey:", options, CPOptionsKey);
        objj_msgSend(self, "_updatePlaceholdersWithOptions:forBinding:", options, aName);
        objj_msgSend(aDestination, "addObserver:forKeyPath:options:context:", self, aKeyPath, CPKeyValueObservingOptionNew, aBinding);
        var bindings = objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(self._source, "UID"));
        if (!bindings)
        {
            bindings = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
            objj_msgSend(bindingsMap, "setObject:forKey:", bindings, objj_msgSend(self._source, "UID"));
        }
        objj_msgSend(bindings, "setObject:forKey:", self, aName);
        objj_msgSend(self, "setValueFor:", aBinding);
    }
    return self;
}
,["id","CPString","CPString","id","CPString","CPDictionary","id"]), new objj_method(sel_getUid("raiseIfNotApplicable:forKeyPath:options:"), function $CPBinder__raiseIfNotApplicable_forKeyPath_options_(self, _cmd, aValue, keyPath, options)
{
    if (aValue === CPNotApplicableMarker && objj_msgSend(options, "objectForKey:", CPRaisesForNotApplicableKeysBindingOption))
    {
        objj_msgSend(CPException, "raise:reason:", CPGenericException, "Cannot transform non-applicable key on: " + self._source + " key path: " + keyPath + " value: " + aValue);
    }
}
,["void","id","CPString","CPDictionary"]), new objj_method(sel_getUid("setValueFor:"), function $CPBinder__setValueFor_(self, _cmd, theBinding)
{
    var destination = objj_msgSend(self._info, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(self._info, "objectForKey:", CPObservedKeyPathKey),
        options = objj_msgSend(self._info, "objectForKey:", CPOptionsKey),
        newValue = objj_msgSend(destination, "valueForKeyPath:", keyPath);
    if (CPIsControllerMarker(newValue))
    {
        objj_msgSend(self, "raiseIfNotApplicable:forKeyPath:options:", newValue, keyPath, options);
        var value = objj_msgSend(self, "_placeholderForMarker:", newValue);
        objj_msgSend(self, "setPlaceholderValue:withMarker:forBinding:", value, newValue, theBinding);
    }
    else
    {
        var value = objj_msgSend(self, "transformValue:withOptions:", newValue, options);
        objj_msgSend(self, "setValue:forBinding:", value, theBinding);
    }
}
,["void","CPString"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $CPBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    objj_msgSend(self._source, "setValue:forKey:", aValue, aBinding);
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $CPBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    objj_msgSend(self._source, "setValue:forKey:", aValue, aBinding);
}
,["void","id","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $CPBinder__reverseSetValueFor_(self, _cmd, aBinding)
{
    var destination = objj_msgSend(self._info, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(self._info, "objectForKey:", CPObservedKeyPathKey),
        options = objj_msgSend(self._info, "objectForKey:", CPOptionsKey),
        newValue = objj_msgSend(self, "valueForBinding:", aBinding);
    newValue = objj_msgSend(self, "reverseTransformValue:withOptions:", newValue, options);
    objj_msgSend(self, "suppressSpecificNotificationFromObject:keyPath:", destination, keyPath);
    objj_msgSend(destination, "setValue:forKeyPath:", newValue, keyPath);
    objj_msgSend(self, "unsuppressSpecificNotificationFromObject:keyPath:", destination, keyPath);
}
,["void","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $CPBinder__valueForBinding_(self, _cmd, aBinding)
{
    return objj_msgSend(self._source, "valueForKeyPath:", aBinding);
}
,["id","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPBinder__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{
    if (!changes)
        return;
    var objectSuppressions = self._suppressedNotifications[objj_msgSend(anObject, "UID")];
    if (objectSuppressions && objectSuppressions[aKeyPath])
        return;
    objj_msgSend(self, "setValueFor:", context);
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("transformValue:withOptions:"), function $CPBinder__transformValue_withOptions_(self, _cmd, aValue, options)
{
    var valueTransformerName = objj_msgSend(options, "objectForKey:", CPValueTransformerNameBindingOption),
        valueTransformer;
    if (valueTransformerName)
    {
        valueTransformer = objj_msgSend(CPValueTransformer, "valueTransformerForName:", valueTransformerName);
        if (!valueTransformer)
        {
            var valueTransformerClass = CPClassFromString(valueTransformerName);
            if (valueTransformerClass)
            {
                valueTransformer = objj_msgSend(objj_msgSend(valueTransformerClass, "alloc"), "init");
                objj_msgSend(valueTransformerClass, "setValueTransformer:forName:", valueTransformer, valueTransformerName);
            }
        }
    }
    else
        valueTransformer = objj_msgSend(options, "objectForKey:", CPValueTransformerBindingOption);
    if (valueTransformer)
        aValue = objj_msgSend(valueTransformer, "transformedValue:", aValue);
    if ((aValue === undefined || aValue === nil || aValue === objj_msgSend(CPNull, "null")) && !objj_msgSend(self._source, "respondsToSelector:", sel_getUid("setPlaceholderString:")))
        aValue = objj_msgSend(options, "objectForKey:", CPNullPlaceholderBindingOption) || nil;
    return aValue;
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("reverseTransformValue:withOptions:"), function $CPBinder__reverseTransformValue_withOptions_(self, _cmd, aValue, options)
{
    var valueTransformerName = objj_msgSend(options, "objectForKey:", CPValueTransformerNameBindingOption),
        valueTransformer;
    if (valueTransformerName)
        valueTransformer = objj_msgSend(CPValueTransformer, "valueTransformerForName:", valueTransformerName);
    else
        valueTransformer = objj_msgSend(options, "objectForKey:", CPValueTransformerBindingOption);
    if (valueTransformer && objj_msgSend(objj_msgSend(valueTransformer, "class"), "allowsReverseTransformation"))
        aValue = objj_msgSend(valueTransformer, "reverseTransformedValue:", aValue);
    return aValue;
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("continuouslyUpdatesValue"), function $CPBinder__continuouslyUpdatesValue(self, _cmd)
{
    var options = objj_msgSend(self._info, "objectForKey:", CPOptionsKey);
    return objj_msgSend(objj_msgSend(options, "objectForKey:", CPContinuouslyUpdatesValueBindingOption), "boolValue");
}
,["BOOL"]), new objj_method(sel_getUid("handlesContentAsCompoundValue"), function $CPBinder__handlesContentAsCompoundValue(self, _cmd)
{
    var options = objj_msgSend(self._info, "objectForKey:", CPOptionsKey);
    return objj_msgSend(objj_msgSend(options, "objectForKey:", CPHandlesContentAsCompoundValueBindingOption), "boolValue");
}
,["BOOL"]), new objj_method(sel_getUid("suppressSpecificNotificationFromObject:keyPath:"), function $CPBinder__suppressSpecificNotificationFromObject_keyPath_(self, _cmd, anObject, aKeyPath)
{
    if (!anObject)
        return;
    var uid = objj_msgSend(anObject, "UID"),
        objectSuppressions = self._suppressedNotifications[uid];
    if (!objectSuppressions)
        self._suppressedNotifications[uid] = objectSuppressions = {};
    objectSuppressions[aKeyPath] = YES;
}
,["void","id","CPString"]), new objj_method(sel_getUid("unsuppressSpecificNotificationFromObject:keyPath:"), function $CPBinder__unsuppressSpecificNotificationFromObject_keyPath_(self, _cmd, anObject, aKeyPath)
{
    if (!anObject)
        return;
    var uid = objj_msgSend(anObject, "UID"),
        objectSuppressions = self._suppressedNotifications[uid];
    if (!objectSuppressions)
        return;
    delete objectSuppressions[aKeyPath];
}
,["void","id","CPString"]), new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $CPBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{
    var count = objj_msgSend(CPBinderPlaceholderMarkers, "count");
    while (count--)
    {
        var marker = CPBinderPlaceholderMarkers[count],
            optionName = CPBinderPlaceholderOptions[count],
            isExplicit = objj_msgSend(options, "containsKey:", optionName),
            placeholder = isExplicit ? objj_msgSend(options, "objectForKey:", optionName) : nil;
        objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", placeholder, marker, !isExplicit);
    }
}
,["void","CPDictionary"]), new objj_method(sel_getUid("_updatePlaceholdersWithOptions:forBinding:"), function $CPBinder___updatePlaceholdersWithOptions_forBinding_(self, _cmd, options, aBinding)
{
    objj_msgSend(self, "_updatePlaceholdersWithOptions:", options);
}
,["void","CPDictionary","CPString"]), new objj_method(sel_getUid("_placeholderForMarker:"), function $CPBinder___placeholderForMarker_(self, _cmd, aMarker)
{
    var placeholder = self._placeholderForMarker[objj_msgSend(aMarker, "UID")];
    if (placeholder)
        return placeholder.value;
    return nil;
}
,["JSObject","id"]), new objj_method(sel_getUid("_setPlaceholder:forMarker:isDefault:"), function $CPBinder___setPlaceholder_forMarker_isDefault_(self, _cmd, aPlaceholder, aMarker, isDefault)
{
    if (isDefault)
    {
        var existingPlaceholder = self._placeholderForMarker[objj_msgSend(aMarker, "UID")];
        if (existingPlaceholder && !existingPlaceholder.isDefault)
            return;
    }
    self._placeholderForMarker[objj_msgSend(aMarker, "UID")] = {'isDefault': isDefault, 'value': aPlaceholder};
}
,["void","id","id","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("exposeBinding:forClass:"), function $CPBinder__exposeBinding_forClass_(self, _cmd, aBinding, aClass)
{
    var bindings = objj_msgSend(exposedBindingsMap, "objectForKey:", objj_msgSend(aClass, "UID"));
    if (!bindings)
    {
        bindings = [];
        objj_msgSend(exposedBindingsMap, "setObject:forKey:", bindings, objj_msgSend(aClass, "UID"));
    }
    bindings.push(aBinding);
}
,["void","CPString","Class"]), new objj_method(sel_getUid("exposedBindingsForClass:"), function $CPBinder__exposedBindingsForClass_(self, _cmd, aClass)
{
    return objj_msgSend(objj_msgSend(exposedBindingsMap, "objectForKey:", objj_msgSend(aClass, "UID")), "copy");
}
,["CPArray","Class"]), new objj_method(sel_getUid("getBinding:forObject:"), function $CPBinder__getBinding_forObject_(self, _cmd, aBinding, anObject)
{
    return objj_msgSend(objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(anObject, "UID")), "objectForKey:", aBinding);
}
,["CPBinder","CPString","id"]), new objj_method(sel_getUid("infoForBinding:forObject:"), function $CPBinder__infoForBinding_forObject_(self, _cmd, aBinding, anObject)
{
    var theBinding = objj_msgSend(self, "getBinding:forObject:", aBinding, anObject);
    if (theBinding)
        return theBinding._info;
    return nil;
}
,["CPDictionary","CPString","id"]), new objj_method(sel_getUid("allBindingsForObject:"), function $CPBinder__allBindingsForObject_(self, _cmd, anObject)
{
    return objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(anObject, "UID"));
}
,["CPDictionary","id"]), new objj_method(sel_getUid("unbind:forObject:"), function $CPBinder__unbind_forObject_(self, _cmd, aBinding, anObject)
{
    var bindings = objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(anObject, "UID"));
    if (!bindings)
        return;
    var theBinding = objj_msgSend(bindings, "objectForKey:", aBinding);
    if (!theBinding)
        return;
    var info = theBinding._info,
        observedObject = objj_msgSend(info, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(info, "objectForKey:", CPObservedKeyPathKey);
    objj_msgSend(observedObject, "removeObserver:forKeyPath:", theBinding, keyPath);
    objj_msgSend(bindings, "removeObjectForKey:", aBinding);
}
,["void","CPString","id"]), new objj_method(sel_getUid("unbindAllForObject:"), function $CPBinder__unbindAllForObject_(self, _cmd, anObject)
{
    var bindings = objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(anObject, "UID"));
    if (!bindings)
        return;
    var allKeys = objj_msgSend(bindings, "allKeys"),
        count = allKeys.length;
    while (count--)
        objj_msgSend(anObject, "unbind:", objj_msgSend(bindings, "objectForKey:", allKeys[count]));
    objj_msgSend(bindingsMap, "removeObjectForKey:", objj_msgSend(anObject, "UID"));
}
,["void","id"])]);
}{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("exposedBindings"), function $CPObject__exposedBindings(self, _cmd)
{
    var exposedBindings = [],
        theClass = objj_msgSend(self, "class");
    while (theClass)
    {
        var temp = objj_msgSend(CPBinder, "exposedBindingsForClass:", theClass);
        if (temp)
            objj_msgSend(exposedBindings, "addObjectsFromArray:", temp);
        theClass = objj_msgSend(theClass, "superclass");
    }
    return exposedBindings;
}
,["CPArray"]), new objj_method(sel_getUid("valueClassForBinding:"), function $CPObject__valueClassForBinding_(self, _cmd, binding)
{
    return objj_msgSend(CPString, "class");
}
,["Class","CPString"]), new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"), function $CPObject__bind_toObject_withKeyPath_options_(self, _cmd, aBinding, anObject, aKeyPath, options)
{
    if (!anObject || !aKeyPath)
        return CPLog.error("Invalid object or path on " + self + " for " + aBinding);
    var binderClass = objj_msgSend(objj_msgSend(self, "class"), "_binderClassForBinding:", aBinding);
    objj_msgSend(self, "unbind:", aBinding);
    objj_msgSend(objj_msgSend(binderClass, "alloc"), "initWithBinding:name:to:keyPath:options:from:", objj_msgSend(self, "_replacementKeyPathForBinding:", aBinding), aBinding, anObject, aKeyPath, options, self);
}
,["void","CPString","id","CPString","CPDictionary"]), new objj_method(sel_getUid("infoForBinding:"), function $CPObject__infoForBinding_(self, _cmd, aBinding)
{
    return objj_msgSend(CPBinder, "infoForBinding:forObject:", aBinding, self);
}
,["CPDictionary","CPString"]), new objj_method(sel_getUid("unbind:"), function $CPObject__unbind_(self, _cmd, aBinding)
{
    var binderClass = objj_msgSend(objj_msgSend(self, "class"), "_binderClassForBinding:", aBinding);
    objj_msgSend(binderClass, "unbind:forObject:", aBinding, self);
}
,["void","CPString"]), new objj_method(sel_getUid("_replacementKeyPathForBinding:"), function $CPObject___replacementKeyPathForBinding_(self, _cmd, binding)
{
    return binding;
}
,["CPString","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("exposeBinding:"), function $CPObject__exposeBinding_(self, _cmd, aBinding)
{
    objj_msgSend(CPBinder, "exposeBinding:forClass:", aBinding, objj_msgSend(self, "class"));
}
,["void","CPString"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPObject___binderClassForBinding_(self, _cmd, aBinding)
{
    return objj_msgSend(CPBinder, "class");
}
,["Class","CPString"])]);
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
    var bindings = objj_msgSend(bindingsMap, "valueForKey:", objj_msgSend(self._source, "UID"));
    if (!bindings)
        return;
    var baseBinding = aBinding.replace(/\d$/, "");
    objj_msgSend(self._source, "setValue:forKey:", objj_msgSend(self, "resolveMultipleValuesForBinding:bindings:booleanOperation:", baseBinding, bindings, self._operation), baseBinding);
}
,["void","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $_CPMultipleValueBooleanBinding__reverseSetValueFor_(self, _cmd, theBinding)
{
}
,["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPMultipleValueBooleanBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{
    objj_msgSend(self, "setValueFor:", context);
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("resolveMultipleValuesForBinding:bindings:booleanOperation:"), function $_CPMultipleValueBooleanBinding__resolveMultipleValuesForBinding_bindings_booleanOperation_(self, _cmd, aBinding, bindings, operation)
{
    var bindingName = aBinding,
        theBinding,
        count = 2;
    while (theBinding = objj_msgSend(bindings, "objectForKey:", bindingName))
    {
        var info = theBinding._info,
            object = objj_msgSend(info, "objectForKey:", CPObservedObjectKey),
            keyPath = objj_msgSend(info, "objectForKey:", CPObservedKeyPathKey),
            options = objj_msgSend(info, "objectForKey:", CPOptionsKey),
            value = objj_msgSend(object, "valueForKeyPath:", keyPath);
        if (CPIsControllerMarker(value))
        {
            objj_msgSend(self, "raiseIfNotApplicable:forKeyPath:options:", value, keyPath, options);
            value = objj_msgSend(theBinding, "_placeholderForMarker:", value);
        }
        else
            value = objj_msgSend(theBinding, "transformValue:withOptions:", value, options);
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
    objj_msgSend(self, "checkForNullBinding:initializing:", theBinding, YES);
}
,["void","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $_CPMultipleValueActionBinding__reverseSetValueFor_(self, _cmd, theBinding)
{
}
,["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPMultipleValueActionBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{
    objj_msgSend(self, "checkForNullBinding:initializing:", context, NO);
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("checkForNullBinding:initializing:"), function $_CPMultipleValueActionBinding__checkForNullBinding_initializing_(self, _cmd, theBinding, isInitializing)
{
    if (!objj_msgSend(self._source, "isKindOfClass:", CPButton))
        return;
    if (isInitializing && theBinding === CPArgumentBinding)
        objj_msgSend(self._source, "setEnabled:", YES);
    var bindings = objj_msgSend(bindingsMap, "valueForKey:", objj_msgSend(self._source, "UID")),
        binding = objj_msgSend(bindings, "objectForKey:", theBinding),
        info = binding._info,
        options = objj_msgSend(info, "objectForKey:", CPOptionsKey);
    if (!objj_msgSend(options, "valueForKey:", CPAllowsNullArgumentBindingOption))
    {
        var object = objj_msgSend(info, "objectForKey:", CPObservedObjectKey),
            keyPath = objj_msgSend(info, "objectForKey:", CPObservedKeyPathKey),
            value = objj_msgSend(object, "valueForKeyPath:", keyPath);
        if (value === nil || value === undefined)
        {
            objj_msgSend(self._source, "setEnabled:", NO);
            return;
        }
    }
    if (!isInitializing)
        objj_msgSend(self._source, "setEnabled:", YES);
}
,["void","CPString","BOOL"]), new objj_method(sel_getUid("invokeAction"), function $_CPMultipleValueActionBinding__invokeAction(self, _cmd)
{
    var bindings = objj_msgSend(bindingsMap, "valueForKey:", objj_msgSend(self._source, "UID")),
        theBinding = objj_msgSend(bindings, "objectForKey:", CPTargetBinding),
        info = theBinding._info,
        object = objj_msgSend(info, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(info, "objectForKey:", CPObservedKeyPathKey),
        options = objj_msgSend(info, "objectForKey:", CPOptionsKey),
        target = objj_msgSend(object, "valueForKeyPath:", keyPath),
        selector = objj_msgSend(options, "objectForKey:", CPSelectorNameBindingOption);
    if (!target || !selector)
        return;
    var invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", objj_msgSend(target, "methodSignatureForSelector:", selector)),
        bindingName = CPArgumentBinding,
        count = 1;
    while (theBinding = objj_msgSend(bindings, "objectForKey:", bindingName))
    {
        info = theBinding._info;
        object = objj_msgSend(info, "objectForKey:", CPObservedObjectKey);
        keyPath = objj_msgSend(info, "objectForKey:", CPObservedKeyPathKey);
        objj_msgSend(invocation, "setArgument:atIndex:", objj_msgSend(object, "valueForKeyPath:", keyPath), ++count);
        bindingName = CPArgumentBinding + count;
    }
    objj_msgSend(invocation, "setSelector:", selector);
    objj_msgSend(invocation, "invokeWithTarget:", target);
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
    var bindings = objj_msgSend(bindingsMap, "valueForKey:", objj_msgSend(self._source, "UID"));
    if (!bindings)
        return;
    var baseBinding = aBinding.replace(/\d$/, ""),
        result = objj_msgSend(self, "resolveMultipleValuesForBindings:", bindings);
    if (result.isPlaceholder)
        objj_msgSend(self, "setPlaceholderValue:withMarker:forBinding:", result.value, result.marker, baseBinding);
    else
        objj_msgSend(self, "setValue:forBinding:", result.value, baseBinding);
}
,["void","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $_CPPatternBinding__reverseSetValueFor_(self, _cmd, theBinding)
{
}
,["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPPatternBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{
    objj_msgSend(self, "setValueFor:", context);
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("resolveMultipleValuesForBindings:"), function $_CPPatternBinding__resolveMultipleValuesForBindings_(self, _cmd, bindings)
{
    var theBinding,
        result = {value: "", isPlaceholder: NO, marker: nil};
    for (var count = 1; theBinding = objj_msgSend(bindings, "objectForKey:", self._bindingKey + count); ++count)
    {
        var info = theBinding._info,
            object = objj_msgSend(info, "objectForKey:", CPObservedObjectKey),
            keyPath = objj_msgSend(info, "objectForKey:", CPObservedKeyPathKey),
            options = objj_msgSend(info, "objectForKey:", CPOptionsKey),
            value = objj_msgSend(object, "valueForKeyPath:", keyPath);
        if (count === 1)
            result.value = objj_msgSend(options, "objectForKey:", CPDisplayPatternBindingOption);
        if (CPIsControllerMarker(value))
        {
            objj_msgSend(self, "raiseIfNotApplicable:forKeyPath:options:", value, keyPath, options);
            result.isPlaceholder = YES;
            result.marker = value;
            value = objj_msgSend(theBinding, "_placeholderForMarker:", value);
        }
        else
            value = objj_msgSend(theBinding, "transformValue:withOptions:", value, options);
        if (value === nil || value === undefined)
            value = "";
        result.value = result.value.replace("%{" + self._patternPlaceholder + count + "}@", objj_msgSend(value, "description"));
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
CPNoSelectionMarker = objj_msgSend(objj_msgSend(_CPStateMarker, "alloc"), "initWithName:", "NO SELECTION MARKER");
CPMultipleValuesMarker = objj_msgSend(objj_msgSend(_CPStateMarker, "alloc"), "initWithName:", "MULTIPLE VALUES MARKER");
CPNotApplicableMarker = objj_msgSend(objj_msgSend(_CPStateMarker, "alloc"), "initWithName:", "NOT APPLICABLE MARKER");
CPNullMarker = objj_msgSend(objj_msgSend(_CPStateMarker, "alloc"), "initWithName:", "NULL MARKER");
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
