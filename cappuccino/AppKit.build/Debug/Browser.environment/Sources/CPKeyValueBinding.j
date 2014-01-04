@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;31;Foundation/CPValueTransformer.jt;24869;


objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPArray.j", NO);
objj_executeFile("Foundation/CPDictionary.j", NO);
objj_executeFile("Foundation/CPValueTransformer.j", NO);


var exposedBindingsMap = objj_msgSend(CPDictionary, "new"),
    bindingsMap = objj_msgSend(CPDictionary, "new");

var CPBindingOperationAnd = 0,
    CPBindingOperationOr = 1;

{var the_class = objj_allocateClassPair(CPObject, "CPBinder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_info"), new objj_ivar("_source"), new objj_ivar("_suppressedNotifications"), new objj_ivar("_placeholderForMarker")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBinding:name:to:keyPath:options:from:"), function $CPBinder__initWithBinding_name_to_keyPath_options_from_(self, _cmd, aBinding, aName, aDestination, aKeyPath, options, aSource)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBinder").super_class }, "init");

    if (self)
    {
        _source = aSource;
        _info = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [aDestination, aKeyPath], [CPObservedObjectKey, CPObservedKeyPathKey]);
        _suppressedNotifications = {};
        _placeholderForMarker = {};

        if (options)
            objj_msgSend(_info, "setObject:forKey:", options, CPOptionsKey);

        objj_msgSend(self, "_updatePlaceholdersWithOptions:", options);

        objj_msgSend(aDestination, "addObserver:forKeyPath:options:context:", self, aKeyPath, CPKeyValueObservingOptionNew, aBinding);

        var bindings = objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(_source, "UID"));
        if (!bindings)
        {
            bindings = objj_msgSend(CPDictionary, "new");
            objj_msgSend(bindingsMap, "setObject:forKey:", bindings, objj_msgSend(_source, "UID"));
        }

        objj_msgSend(bindings, "setObject:forKey:", self, aName);
        objj_msgSend(self, "setValueFor:", aBinding);
    }

    return self;
}
},["id","CPString","CPString","id","CPString","CPDictionary","id"]), new objj_method(sel_getUid("setValueFor:"), function $CPBinder__setValueFor_(self, _cmd, theBinding)
{ with(self)
{
    var destination = objj_msgSend(_info, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(_info, "objectForKey:", CPObservedKeyPathKey),
        options = objj_msgSend(_info, "objectForKey:", CPOptionsKey),
        newValue = objj_msgSend(destination, "valueForKeyPath:", keyPath),
        isPlaceholder = CPIsControllerMarker(newValue);

    if (isPlaceholder)
    {
        if (newValue === CPNotApplicableMarker && objj_msgSend(options, "objectForKey:", CPRaisesForNotApplicableKeysBindingOption))
        {
           objj_msgSend(CPException, "raise:reason:", CPGenericException, "Cannot transform non-applicable key on: " + _source + " key path: " + keyPath + " value: " + newValue);
        }

        var value = objj_msgSend(self, "_placeholderForMarker:", newValue);
        objj_msgSend(self, "setPlaceholderValue:withMarker:forBinding:", value, newValue, theBinding);
    }
    else
    {
        var value = objj_msgSend(self, "transformValue:withOptions:", newValue, options);
        objj_msgSend(self, "setValue:forBinding:", value, theBinding);
    }
}
},["void","CPString"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $CPBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{ with(self)
{
    objj_msgSend(_source, "setValue:forKey:", aValue, aBinding);
}
},["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $CPBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{ with(self)
{
    objj_msgSend(_source, "setValue:forKey:", aValue, aBinding);
}
},["void","id","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $CPBinder__reverseSetValueFor_(self, _cmd, aBinding)
{ with(self)
{
    var destination = objj_msgSend(_info, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(_info, "objectForKey:", CPObservedKeyPathKey),
        options = objj_msgSend(_info, "objectForKey:", CPOptionsKey),
        newValue = objj_msgSend(self, "valueForBinding:", aBinding);

    newValue = objj_msgSend(self, "reverseTransformValue:withOptions:", newValue, options);

    objj_msgSend(self, "suppressSpecificNotificationFromObject:keyPath:", destination, keyPath);
    objj_msgSend(destination, "setValue:forKeyPath:", newValue, keyPath);
    objj_msgSend(self, "unsuppressSpecificNotificationFromObject:keyPath:", destination, keyPath);
}
},["void","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $CPBinder__valueForBinding_(self, _cmd, aBinding)
{ with(self)
{
    return objj_msgSend(_source, "valueForKeyPath:", aBinding);
}
},["id","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPBinder__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{ with(self)
{
    if (!changes)
        return;

    var objectSuppressions = _suppressedNotifications[objj_msgSend(anObject, "UID")];
    if (objectSuppressions && objectSuppressions[aKeyPath])
        return;

    objj_msgSend(self, "setValueFor:", context);
}
},["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("transformValue:withOptions:"), function $CPBinder__transformValue_withOptions_(self, _cmd, aValue, options)
{ with(self)
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

    if (aValue === undefined || aValue === nil || aValue === objj_msgSend(CPNull, "null"))
        aValue = objj_msgSend(options, "objectForKey:", CPNullPlaceholderBindingOption) || nil;

    return aValue;
}
},["id","id","CPDictionary"]), new objj_method(sel_getUid("reverseTransformValue:withOptions:"), function $CPBinder__reverseTransformValue_withOptions_(self, _cmd, aValue, options)
{ with(self)
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
},["id","id","CPDictionary"]), new objj_method(sel_getUid("continuouslyUpdatesValue"), function $CPBinder__continuouslyUpdatesValue(self, _cmd)
{ with(self)
{
    var options = objj_msgSend(_info, "objectForKey:", CPOptionsKey);
    return objj_msgSend(objj_msgSend(options, "objectForKey:", CPContinuouslyUpdatesValueBindingOption), "boolValue");
}
},["BOOL"]), new objj_method(sel_getUid("handlesContentAsCompoundValue"), function $CPBinder__handlesContentAsCompoundValue(self, _cmd)
{ with(self)
{
    var options = objj_msgSend(_info, "objectForKey:", CPOptionsKey);
    return objj_msgSend(objj_msgSend(options, "objectForKey:", CPHandlesContentAsCompoundValueBindingOption), "boolValue");
}
},["BOOL"]), new objj_method(sel_getUid("suppressSpecificNotificationFromObject:keyPath:"), function $CPBinder__suppressSpecificNotificationFromObject_keyPath_(self, _cmd, anObject, aKeyPath)
{ with(self)
{
    if (!anObject)
        return;

    var uid = objj_msgSend(anObject, "UID"),
        objectSuppressions = _suppressedNotifications[uid];
    if (!objectSuppressions)
        _suppressedNotifications[uid] = objectSuppressions = {};

    objectSuppressions[aKeyPath] = YES;
}
},["void","id","CPString"]), new objj_method(sel_getUid("unsuppressSpecificNotificationFromObject:keyPath:"), function $CPBinder__unsuppressSpecificNotificationFromObject_keyPath_(self, _cmd, anObject, aKeyPath)
{ with(self)
{
    if (!anObject)
        return;

    var uid = objj_msgSend(anObject, "UID"),
        objectSuppressions = _suppressedNotifications[uid];
    if (!objectSuppressions)
        return;

    delete objectSuppressions[aKeyPath];
}
},["void","id","CPString"]), new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $CPBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{ with(self)
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
},["void","CPDictionary"]), new objj_method(sel_getUid("_placeholderForMarker:"), function $CPBinder___placeholderForMarker_(self, _cmd, aMarker)
{ with(self)
{
    var placeholder = _placeholderForMarker[aMarker];
    if (placeholder)
        return placeholder['value'];
    return nil;
}
},["void",null]), new objj_method(sel_getUid("_setPlaceholder:forMarker:isDefault:"), function $CPBinder___setPlaceholder_forMarker_isDefault_(self, _cmd, aPlaceholder, aMarker, isDefault)
{ with(self)
{
    if (isDefault)
    {
        var existingPlaceholder = _placeholderForMarker[aMarker];


        if (existingPlaceholder && !existingPlaceholder['isDefault'])
            return;
    }

    _placeholderForMarker[aMarker] = { 'isDefault': isDefault, 'value': aPlaceholder };
}
},["void","id","id","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("exposeBinding:forClass:"), function $CPBinder__exposeBinding_forClass_(self, _cmd, aBinding, aClass)
{ with(self)
{
    var bindings = objj_msgSend(exposedBindingsMap, "objectForKey:", objj_msgSend(aClass, "UID"));

    if (!bindings)
    {
        bindings = [];
        objj_msgSend(exposedBindingsMap, "setObject:forKey:", bindings, objj_msgSend(aClass, "UID"));
    }

    bindings.push(aBinding);
}
},["void","CPString","Class"]), new objj_method(sel_getUid("exposedBindingsForClass:"), function $CPBinder__exposedBindingsForClass_(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(objj_msgSend(exposedBindingsMap, "objectForKey:", objj_msgSend(aClass, "UID")), "copy");
}
},["CPArray","Class"]), new objj_method(sel_getUid("getBinding:forObject:"), function $CPBinder__getBinding_forObject_(self, _cmd, aBinding, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(anObject, "UID")), "objectForKey:", aBinding);
}
},["CPBinder","CPString","id"]), new objj_method(sel_getUid("infoForBinding:forObject:"), function $CPBinder__infoForBinding_forObject_(self, _cmd, aBinding, anObject)
{ with(self)
{
    var theBinding = objj_msgSend(self, "getBinding:forObject:", aBinding, anObject);

    if (theBinding)
        return theBinding._info;

    return nil;
}
},["CPDictionary","CPString","id"]), new objj_method(sel_getUid("allBindingsForObject:"), function $CPBinder__allBindingsForObject_(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(anObject, "UID"));
}
},["CPDictionary","id"]), new objj_method(sel_getUid("unbind:forObject:"), function $CPBinder__unbind_forObject_(self, _cmd, aBinding, anObject)
{ with(self)
{
    var bindings = objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(anObject, "UID"));

    if (!bindings)
        return;

    var theBinding = objj_msgSend(bindings, "objectForKey:", aBinding);

    if (!theBinding)
        return;

    var infoDictionary = theBinding._info,
        observedObject = objj_msgSend(infoDictionary, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(infoDictionary, "objectForKey:", CPObservedKeyPathKey);

    objj_msgSend(observedObject, "removeObserver:forKeyPath:", theBinding, keyPath);
    objj_msgSend(bindings, "removeObjectForKey:", aBinding);
}
},["void","CPString","id"]), new objj_method(sel_getUid("unbindAllForObject:"), function $CPBinder__unbindAllForObject_(self, _cmd, anObject)
{ with(self)
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
},["void","id"])]);
}

{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("exposedBindings"), function $CPObject__exposedBindings(self, _cmd)
{ with(self)
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
},["CPArray"]), new objj_method(sel_getUid("valueClassForBinding:"), function $CPObject__valueClassForBinding_(self, _cmd, binding)
{ with(self)
{
    return objj_msgSend(CPString, "class");
}
},["Class","CPString"]), new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"), function $CPObject__bind_toObject_withKeyPath_options_(self, _cmd, aBinding, anObject, aKeyPath, options)
{ with(self)
{
    if (!anObject || !aKeyPath)
        return CPLog.error("Invalid object or path on " + self + " for " + aBinding);




    var binderClass = objj_msgSend(objj_msgSend(self, "class"), "_binderClassForBinding:", aBinding);

    objj_msgSend(self, "unbind:", aBinding);
    objj_msgSend(objj_msgSend(binderClass, "alloc"), "initWithBinding:name:to:keyPath:options:from:", objj_msgSend(self, "_replacementKeyPathForBinding:", aBinding), aBinding, anObject, aKeyPath, options, self);
}
},["void","CPString","id","CPString","CPDictionary"]), new objj_method(sel_getUid("infoForBinding:"), function $CPObject__infoForBinding_(self, _cmd, aBinding)
{ with(self)
{
    return objj_msgSend(CPBinder, "infoForBinding:forObject:", aBinding, self);
}
},["CPDictionary","CPString"]), new objj_method(sel_getUid("unbind:"), function $CPObject__unbind_(self, _cmd, aBinding)
{ with(self)
{
    var binderClass = objj_msgSend(objj_msgSend(self, "class"), "_binderClassForBinding:", aBinding);
    objj_msgSend(binderClass, "unbind:forObject:", aBinding, self);
}
},["void","CPString"]), new objj_method(sel_getUid("_replacementKeyPathForBinding:"), function $CPObject___replacementKeyPathForBinding_(self, _cmd, binding)
{ with(self)
{
    return binding;
}
},["id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("exposeBinding:"), function $CPObject__exposeBinding_(self, _cmd, aBinding)
{ with(self)
{
    objj_msgSend(CPBinder, "exposeBinding:forClass:", aBinding, objj_msgSend(self, "class"));
}
},["void","CPString"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPObject___binderClassForBinding_(self, _cmd, theBinding)
{ with(self)
{
    return objj_msgSend(CPBinder, "class");
}
},["Class","CPString"])]);
}







{var the_class = objj_allocateClassPair(CPBinder, "_CPValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPValueBinder__setValueFor_(self, _cmd, theBinding)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPValueBinder").super_class }, "setValueFor:", "objectValue");
}
},["void","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $_CPValueBinder__reverseSetValueFor_(self, _cmd, theBinding)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPValueBinder").super_class }, "reverseSetValueFor:", "objectValue");
}
},["void","CPString"])]);
}

{var the_class = objj_allocateClassPair(CPBinder, "_CPKeyValueOrBinding"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPKeyValueOrBinding__setValueFor_(self, _cmd, aBinding)
{ with(self)
{
    var bindings = objj_msgSend(bindingsMap, "valueForKey:", objj_msgSend(_source, "UID"));

    if (!bindings)
        return;

    objj_msgSend(_source, "setValue:forKey:", resolveMultipleValues(aBinding, bindings, CPBindingOperationOr), aBinding);
}
},["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPKeyValueOrBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, context)
{ with(self)
{
    objj_msgSend(self, "setValueFor:", context);
}
},["void","CPString","id","CPDictionary","id"])]);
}

{var the_class = objj_allocateClassPair(CPBinder, "_CPKeyValueAndBinding"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPKeyValueAndBinding__setValueFor_(self, _cmd, aBinding)
{ with(self)
{
    var bindings = objj_msgSend(bindingsMap, "objectForKey:", objj_msgSend(_source, "UID"));

    if (!bindings)
        return;

    objj_msgSend(_source, "setValue:forKey:", resolveMultipleValues(aBinding, bindings, CPBindingOperationAnd), aBinding);
}
},["void","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPKeyValueAndBinding__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObejct, changes, context)
{ with(self)
{
    objj_msgSend(self, "setValueFor:", context);
}
},["void","CPString","id","CPDictionary","id"])]);
}

var resolveMultipleValues = function( key, bindings, operation)
{
    var bindingName = key,
        theBinding,
        count = 1;

    while (theBinding = objj_msgSend(bindings, "objectForKey:", bindingName))
    {
        var infoDictionary = theBinding._info,
            object = objj_msgSend(infoDictionary, "objectForKey:", CPObservedObjectKey),
            keyPath = objj_msgSend(infoDictionary, "objectForKey:", CPObservedKeyPathKey),
            options = objj_msgSend(infoDictionary, "objectForKey:", CPOptionsKey);

        var value = objj_msgSend(theBinding, "transformValue:withOptions:", objj_msgSend(object, "valueForKeyPath:", keyPath), options);

        if (value == operation)
            return operation;

        bindingName = objj_msgSend(CPString, "stringWithFormat:", "%@%i", key, ++count);
    }

    return !operation;
};

var invokeAction = function( targetKey, argumentKey, bindings)
{
    var theBinding = objj_msgSend(bindings, "objectForKey:", targetKey),
        infoDictionary = theBinding._info,

        object = objj_msgSend(infoDictionary, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(infoDictionary, "objectForKey:", CPObservedKeyPathKey),
        options = objj_msgSend(infoDictionary, "objectForKey:", CPOptionsKey),

        target = objj_msgSend(object, "valueForKeyPath:", keyPath),
        selector = objj_msgSend(options, "objectForKey:", CPSelectorNameBindingOption);

    if (!target || !selector)
        return;

    var invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", objj_msgSend(target, "methodSignatureForSelector:", selector));
    objj_msgSend(invocation, "setSelector:", selector);

    var bindingName = argumentKey,
        count = 1;

    while (theBinding = objj_msgSend(bindings, "objectForKey:", bindingName))
    {
        infoDictionary = theBinding._info;

        keyPath = objj_msgSend(infoDictionary, "objectForKey:", CPObserverKeyPathKey);
        object = objj_msgSend(objj_msgSend(infoDictionary, "objectForKey:", CPObservedObjectKey), "valueForKeyPath:", keyPath);

        if (object)
            objj_msgSend(invocation, "setArgument:atIndex:", object, ++count);

        bindingName = objj_msgSend(CPString, "stringWithFormat:", "%@%i", argumentKey, count);
    }

    objj_msgSend(invocation, "invoke");
};




CPObservedObjectKey = "CPObservedObjectKey";
CPObservedKeyPathKey = "CPObservedKeyPathKey";
CPOptionsKey = "CPOptionsKey";


CPMultipleValuesMarker = "CPMultipleValuesMarker";
CPNoSelectionMarker = "CPNoSelectionMarker";
CPNotApplicableMarker = "CPNotApplicableMarker";
CPNullMarker = "CPNullMarker";


CPAlignmentBinding = "alignment";
CPContentArrayBinding = "contentArray";
CPContentBinding = "content";
CPContentObjectBinding = "contentObject";
CPContentObjectsBinding = "contentObjects";
CPContentValuesBinding = "contentValues";
CPEditableBinding = "editable";
CPEnabledBinding = "enabled";
CPFontBinding = "font";
CPFontNameBinding = "fontName";
CPFontBoldBinding = "fontBold";
CPHiddenBinding = "hidden";
CPFilterPredicateBinding = "filterPredicate";
CPPredicateBinding = "predicate";
CPSelectedIndexBinding = "selectedIndex";
CPSelectedLabelBinding = "selectedLabel";
CPSelectedObjectBinding = "selectedObject";
CPSelectedObjectsBinding = "selectedObjects";
CPSelectedTagBinding = "selectedTag";
CPSelectedValueBinding = "selectedValue";
CPSelectedValuesBinding = "selectedValues";
CPSelectionIndexesBinding = "selectionIndexes";
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

CPIsControllerMarker = function( anObject)
{
    return anObject === CPMultipleValuesMarker || anObject === CPNoSelectionMarker || anObject === CPNotApplicableMarker || anObject === CPNullMarker;
};

var CPBinderPlaceholderMarkers = [CPMultipleValuesMarker, CPNoSelectionMarker, CPNotApplicableMarker, CPNullMarker],
    CPBinderPlaceholderOptions = [CPMultipleValuesPlaceholderBindingOption, CPNoSelectionPlaceholderBindingOption, CPNotApplicablePlaceholderBindingOption, CPNullPlaceholderBindingOption];

