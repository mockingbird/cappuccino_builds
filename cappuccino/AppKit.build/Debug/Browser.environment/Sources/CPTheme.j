@STATIC;1.0;I;21;Foundation/CPObject.jI;27;Foundation/CPMutableArray.jI;21;Foundation/CPString.jI;30;Foundation/CPKeyedUnarchiver.jt;22125;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPMutableArray.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("Foundation/CPKeyedUnarchiver.j", NO);var CPThemesByName = {},
    CPThemeDefaultTheme = nil,
    CPThemeDefaultHudTheme = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPTheme"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_attributes")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:"), function $CPTheme__initWithName_(self, _cmd, aName)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTheme").super_class }, "init");
    if (self)
    {
        self._name = aName;
        self._attributes = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        CPThemesByName[self._name] = self;
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("name"), function $CPTheme__name(self, _cmd)
{
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("classNames"), function $CPTheme__classNames(self, _cmd)
{
    return objj_msgSend(self._attributes, "allKeys");
}
,["CPArray"]), new objj_method(sel_getUid("attributesForClass:"), function $CPTheme__attributesForClass_(self, _cmd, aClass)
{
    if (!aClass)
        return nil;
    var className = nil;
    if (objj_msgSend(aClass, "isKindOfClass:", objj_msgSend(CPString, "class")))
    {
        var theClass = CPClassFromString(aClass);
        if (theClass)
            aClass = theClass;
        else
            className = aClass;
    }
    if (!className)
    {
        if (objj_msgSend(aClass, "isKindOfClass:", objj_msgSend(CPView, "class")))
        {
            if (objj_msgSend(aClass, "respondsToSelector:", sel_getUid("defaultThemeClass")))
                className = objj_msgSend(aClass, "defaultThemeClass");
            else if (objj_msgSend(aClass, "respondsToSelector:", sel_getUid("themeClass")))
            {
                CPLog.warn("%@ themeClass is deprecated in favor of defaultThemeClass", CPStringFromClass(aClass));
                className = objj_msgSend(aClass, "themeClass");
            }
            else
                return nil;
        }
        else
            objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "aClass must be a class object or a string.");
    }
    return objj_msgSend(self._attributes, "objectForKey:", className);
}
,["CPDictionary","id"]), new objj_method(sel_getUid("attributeNamesForClass:"), function $CPTheme__attributeNamesForClass_(self, _cmd, aClass)
{
    var attributes = objj_msgSend(self, "attributesForClass:", aClass);
    if (attributes)
        return objj_msgSend(attributes, "allKeys");
    else
        return objj_msgSend(CPArray, "array");
}
,["CPDictionary","id"]), new objj_method(sel_getUid("attributeWithName:forClass:"), function $CPTheme__attributeWithName_forClass_(self, _cmd, aName, aClass)
{
    var attributes = objj_msgSend(self, "attributesForClass:", aClass);
    if (!attributes)
        return nil;
    return objj_msgSend(attributes, "objectForKey:", aName);
}
,["_CPThemeAttribute","CPString","id"]), new objj_method(sel_getUid("valueForAttributeWithName:forClass:"), function $CPTheme__valueForAttributeWithName_forClass_(self, _cmd, aName, aClass)
{
    return objj_msgSend(self, "valueForAttributeWithName:inState:forClass:", aName, CPThemeStateNormal, aClass);
}
,["id","CPString","id"]), new objj_method(sel_getUid("valueForAttributeWithName:inState:forClass:"), function $CPTheme__valueForAttributeWithName_inState_forClass_(self, _cmd, aName, aState, aClass)
{
    var attribute = objj_msgSend(self, "attributeWithName:forClass:", aName, aClass);
    if (!attribute)
        return nil;
    return objj_msgSend(attribute, "valueForState:", aState);
}
,["id","CPString","ThemeState","id"]), new objj_method(sel_getUid("takeThemeFromObject:"), function $CPTheme__takeThemeFromObject_(self, _cmd, anObject)
{
    var attributes = objj_msgSend(anObject, "_themeAttributeDictionary"),
        attributeName = nil,
        attributeNames = objj_msgSend(attributes, "keyEnumerator"),
        objectThemeClass = objj_msgSend(anObject, "themeClass");
    while ((attributeName = objj_msgSend(attributeNames, "nextObject")) !== nil)
        objj_msgSend(self, "_recordAttribute:forClass:", objj_msgSend(attributes, "objectForKey:", attributeName), objectThemeClass);
}
,["void","id"]), new objj_method(sel_getUid("_recordAttribute:forClass:"), function $CPTheme___recordAttribute_forClass_(self, _cmd, anAttribute, aClass)
{
    if (!objj_msgSend(anAttribute, "hasValues"))
        return;
    var attributes = objj_msgSend(self._attributes, "objectForKey:", aClass);
    if (!attributes)
    {
        attributes = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        objj_msgSend(self._attributes, "setObject:forKey:", attributes, aClass);
    }
    var name = objj_msgSend(anAttribute, "name"),
        existingAttribute = objj_msgSend(attributes, "objectForKey:", name);
    if (existingAttribute)
        objj_msgSend(attributes, "setObject:forKey:", objj_msgSend(existingAttribute, "attributeMergedWithAttribute:", anAttribute), name);
    else
        objj_msgSend(attributes, "setObject:forKey:", anAttribute, name);
}
,["void","_CPThemeAttribute","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("setDefaultTheme:"), function $CPTheme__setDefaultTheme_(self, _cmd, aTheme)
{
    CPThemeDefaultTheme = aTheme;
}
,["void","CPTheme"]), new objj_method(sel_getUid("defaultTheme"), function $CPTheme__defaultTheme(self, _cmd)
{
    return CPThemeDefaultTheme;
}
,["CPTheme"]), new objj_method(sel_getUid("setDefaultHudTheme:"), function $CPTheme__setDefaultHudTheme_(self, _cmd, aTheme)
{
    CPThemeDefaultHudTheme = aTheme;
}
,["void","CPTheme"]), new objj_method(sel_getUid("defaultHudTheme"), function $CPTheme__defaultHudTheme(self, _cmd)
{
    if (!CPThemeDefaultHudTheme)
        CPThemeDefaultHudTheme = objj_msgSend(CPTheme, "themeNamed:", objj_msgSend(objj_msgSend(self, "defaultTheme"), "name") + "-HUD");
    return CPThemeDefaultHudTheme;
}
,["CPTheme"]), new objj_method(sel_getUid("themeNamed:"), function $CPTheme__themeNamed_(self, _cmd, aName)
{
    return CPThemesByName[aName];
}
,["CPTheme","CPString"])]);
}var CPThemeNameKey = "CPThemeNameKey",
    CPThemeAttributesKey = "CPThemeAttributesKey";
{
var the_class = objj_getClass("CPTheme")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTheme\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTheme__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTheme").super_class }, "init");
    if (self)
    {
        self._name = objj_msgSend(aCoder, "decodeObjectForKey:", CPThemeNameKey);
        self._attributes = objj_msgSend(aCoder, "decodeObjectForKey:", CPThemeAttributesKey);
        CPThemesByName[self._name] = self;
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTheme__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._name, CPThemeNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._attributes, CPThemeAttributesKey);
}
,["void","CPCoder"])]);
}ThemeState = function(stateNames)
{
    var stateNameKeys = [];
    this._stateNames = {};
    for (key in stateNames)
    {
        if (!stateNames.hasOwnProperty(key))
            continue;
        if (key != 'normal')
        {
            this._stateNames[key] = true;
            stateNameKeys.push(key);
        }
    }
    if (stateNameKeys.length === 0)
    {
        stateNameKeys.push('normal');
        this._stateNames['normal'] = true;
    }
    stateNameKeys.sort();
    this._stateNameString = stateNameKeys[0];
    var stateNameLength = stateNameKeys.length;
    for (var stateIndex = 1; stateIndex < stateNameLength; stateIndex++)
        this._stateNameString = this._stateNameString + "+" + stateNameKeys[stateIndex];
    this._stateNameCount = stateNameLength;
}
ThemeState.prototype.toString = function()
{
    return this._stateNameString;
};
ThemeState.prototype.hasThemeState = function(aState)
{
    if (aState === undefined || aState === nil || aState._stateNames === undefined)
        return false;
    for (var stateName in aState._stateNames)
    {
        if (!aState._stateNames.hasOwnProperty(stateName))
            continue;
        if (!this._stateNames[stateName])
            return false;
    }
    return true;
};
ThemeState.prototype.isSubsetOf = function(aState)
{
    if (aState._stateNameCount < this._stateNameCount)
        return false;
    for (key in this._stateNames)
    {
        if (!this._stateNames.hasOwnProperty(key))
            continue;
        if (!aState._stateNames[key])
            return false;
    }
    return true;
};
ThemeState.prototype.without = function(aState)
{
    if (aState === undefined || aState === nil || aState === objj_msgSend(CPNull, "null"))
        return aState;
    var newStates = {};
    for (var stateName in this._stateNames)
    {
        if (!this._stateNames.hasOwnProperty(stateName))
            continue;
        if (!aState._stateNames[stateName])
            newStates[stateName] = true;
    }
    return ThemeState._cacheThemeState(new ThemeState(newStates));
};
ThemeState.prototype.and = function(aState)
{
    return CPThemeState(this, aState);
};
var CPThemeStates = {};
ThemeState._cacheThemeState = function(aState)
{
    var themeState = CPThemeStates[String(aState)];
    if (themeState === undefined)
    {
        themeState = aState;
        CPThemeStates[String(themeState)] = themeState;
    }
    return themeState;
};
CPThemeState = function()
{
    if (arguments.length < 1)
        throw "CPThemeState() must be called with at least one string argument";
    var themeState;
    if (arguments.length === 1 && typeof arguments[0] === 'string')
    {
        themeState = CPThemeStates[arguments[0]];
        if (themeState !== undefined)
            return themeState;
    }
    var stateNames = {};
    for (var argIndex = 0; argIndex < arguments.length; argIndex++)
    {
        if (arguments[argIndex] === objj_msgSend(CPNull, "null") || arguments[argIndex] === nil || arguments[argIndex] === undefined)
            continue;
        if (typeof arguments[argIndex] === 'object')
        {
            for (var stateName in arguments[argIndex]._stateNames)
            {
                if (!arguments[argIndex]._stateNames.hasOwnProperty(stateName))
                    continue;
                stateNames[stateName] = true;
            }
        }
        else
        {
            var allNames = arguments[argIndex].split('+');
            for (var nameIndex = 0; nameIndex < allNames.length; nameIndex++)
                stateNames[allNames[nameIndex]] = true;
        }
    }
    themeState = ThemeState._cacheThemeState(new ThemeState(stateNames));
    return themeState;
}
{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "_CPThemeKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:bundle:"), function $_CPThemeKeyedUnarchiver__initForReadingWithData_bundle_(self, _cmd, data, aBundle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPThemeKeyedUnarchiver").super_class }, "initForReadingWithData:", data);
    if (self)
        self._bundle = aBundle;
    return self;
}
,["id","CPData","CPBundle"]), new objj_method(sel_getUid("bundle"), function $_CPThemeKeyedUnarchiver__bundle(self, _cmd)
{
    return self._bundle;
}
,["CPBundle"]), new objj_method(sel_getUid("awakenCustomResources"), function $_CPThemeKeyedUnarchiver__awakenCustomResources(self, _cmd)
{
    return YES;
}
,["BOOL"])]);
}CPThemeStateNormal = CPThemeState("normal");
CPThemeStateDisabled = CPThemeState("disabled");
CPThemeStateHovered = CPThemeState("hovered");
CPThemeStateHighlighted = CPThemeState("highlighted");
CPThemeStateSelected = CPThemeState("selected");
CPThemeStateTableDataView = CPThemeState("tableDataView");
CPThemeStateSelectedDataView = CPThemeState("selectedTableDataView");
CPThemeStateGroupRow = CPThemeState("CPThemeStateGroupRow");
CPThemeStateBezeled = CPThemeState("bezeled");
CPThemeStateBordered = CPThemeState("bordered");
CPThemeStateEditable = CPThemeState("editable");
CPThemeStateEditing = CPThemeState("editing");
CPThemeStateVertical = CPThemeState("vertical");
CPThemeStateDefault = CPThemeState("default");
CPThemeStateCircular = CPThemeState("circular");
CPThemeStateAutocompleting = CPThemeState("autocompleting");
CPThemeStateMainWindow = CPThemeState("mainWindow");
CPThemeStateKeyWindow = CPThemeState("keyWindow");
{var the_class = objj_allocateClassPair(CPObject, "_CPThemeAttribute"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_defaultValue"), new objj_ivar("_values"), new objj_ivar("_cache"), new objj_ivar("_themeDefaultAttribute")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("values"), function $_CPThemeAttribute__values(self, _cmd)
{
    return self._values;
}
,["CPDictionary"]), new objj_method(sel_getUid("initWithName:defaultValue:"), function $_CPThemeAttribute__initWithName_defaultValue_(self, _cmd, aName, aDefaultValue)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPThemeAttribute").super_class }, "init");
    if (self)
    {
        self._cache = {};
        self._name = aName;
        self._defaultValue = aDefaultValue;
        self._values = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    }
    return self;
}
,["id","CPString","id"]), new objj_method(sel_getUid("name"), function $_CPThemeAttribute__name(self, _cmd)
{
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("defaultValue"), function $_CPThemeAttribute__defaultValue(self, _cmd)
{
    return self._defaultValue;
}
,["id"]), new objj_method(sel_getUid("hasValues"), function $_CPThemeAttribute__hasValues(self, _cmd)
{
    return objj_msgSend(self._values, "count") > 0;
}
,["BOOL"]), new objj_method(sel_getUid("setValue:"), function $_CPThemeAttribute__setValue_(self, _cmd, aValue)
{
    self._cache = {};
    if (aValue === undefined || aValue === nil)
        self._values = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    else
        self._values = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aValue, String(CPThemeStateNormal));
}
,["void","id"]), new objj_method(sel_getUid("setValue:forState:"), function $_CPThemeAttribute__setValue_forState_(self, _cmd, aValue, aState)
{
    self._cache = {};
    if (aValue === undefined || aValue === nil)
        objj_msgSend(self._values, "removeObjectForKey:", String(aState));
    else
        objj_msgSend(self._values, "setObject:forKey:", aValue, String(aState));
}
,["void","id","ThemeState"]), new objj_method(sel_getUid("value"), function $_CPThemeAttribute__value(self, _cmd)
{
    return objj_msgSend(self, "valueForState:", CPThemeStateNormal);
}
,["id"]), new objj_method(sel_getUid("valueForState:"), function $_CPThemeAttribute__valueForState_(self, _cmd, aState)
{
    var stateName = String(aState);
    var value = self._cache[stateName];
    if (value !== undefined)
        return value;
    value = objj_msgSend(self._values, "objectForKey:", stateName);
    if (value === undefined || value === nil)
    {
        if (aState._stateNameCount > 1)
        {
            var states = objj_msgSend(self._values, "allKeys"),
                count = states.length,
                largestThemeState = 0;
            while (count--)
            {
                var stateObject = CPThemeState(states[count]);
                if (stateObject.isSubsetOf(aState) && stateObject._stateNameCount > largestThemeState)
                {
                    value = objj_msgSend(self._values, "objectForKey:", states[count]);
                    largestThemeState = stateObject._stateNameCount;
                }
            }
        }
        if (value === undefined || value === nil)
            value = objj_msgSend(self._values, "objectForKey:", String(CPThemeStateNormal));
    }
    if (value === undefined || value === nil)
        value = objj_msgSend(self._themeDefaultAttribute, "valueForState:", aState);
    if (value === undefined || value === nil)
    {
        value = self._defaultValue;
        if (value === objj_msgSend(CPNull, "null"))
            value = nil;
    }
    self._cache[stateName] = value;
    return value;
}
,["id","ThemeState"]), new objj_method(sel_getUid("setParentAttribute:"), function $_CPThemeAttribute__setParentAttribute_(self, _cmd, anAttribute)
{
    if (self._themeDefaultAttribute === anAttribute)
        return;
    self._cache = {};
    self._themeDefaultAttribute = anAttribute;
}
,["void","_CPThemeAttribute"]), new objj_method(sel_getUid("attributeMergedWithAttribute:"), function $_CPThemeAttribute__attributeMergedWithAttribute_(self, _cmd, anAttribute)
{
    var mergedAttribute = objj_msgSend(objj_msgSend(_CPThemeAttribute, "alloc"), "initWithName:defaultValue:", self._name, self._defaultValue);
    mergedAttribute._values = objj_msgSend(self._values, "copy");
    objj_msgSend(mergedAttribute._values, "addEntriesFromDictionary:", anAttribute._values);
    return mergedAttribute;
}
,["_CPThemeAttribute","_CPThemeAttribute"])]);
}{
var the_class = objj_getClass("_CPThemeAttribute")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPThemeAttribute\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPThemeAttribute__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPThemeAttribute").super_class }, "init");
    if (self)
    {
        self._cache = {};
        self._name = objj_msgSend(aCoder, "decodeObjectForKey:", "name");
        self._defaultValue = objj_msgSend(aCoder, "decodeObjectForKey:", "defaultValue");
        self._values = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        if (objj_msgSend(aCoder, "containsValueForKey:", "value"))
        {
            var state = String(CPThemeStateNormal);
            if (objj_msgSend(aCoder, "containsValueForKey:", "state"))
                state = objj_msgSend(aCoder, "decodeObjectForKey:", "state");
            objj_msgSend(self._values, "setObject:forKey:", objj_msgSend(aCoder, "decodeObjectForKey:", "value"), state);
        }
        else
        {
            var encodedValues = objj_msgSend(aCoder, "decodeObjectForKey:", "values"),
                keys = objj_msgSend(encodedValues, "allKeys"),
                count = keys.length;
            while (count--)
            {
                var key = keys[count];
                objj_msgSend(self._values, "setObject:forKey:", objj_msgSend(encodedValues, "objectForKey:", key), key);
            }
        }
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPThemeAttribute__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._name, "name");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._defaultValue, "defaultValue");
    var keys = objj_msgSend(self._values, "allKeys"),
        count = keys.length;
    if (count === 1)
    {
        var onlyKey = keys[0];
        if (onlyKey !== String(CPThemeStateNormal))
            objj_msgSend(aCoder, "encodeObject:forKey:", onlyKey, "state");
        objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self._values, "objectForKey:", onlyKey), "value");
    }
    else
    {
        var encodedValues = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        while (count--)
        {
            var key = keys[count];
            objj_msgSend(encodedValues, "setObject:forKey:", objj_msgSend(self._values, "objectForKey:", key), key);
        }
        objj_msgSend(aCoder, "encodeObject:forKey:", encodedValues, "values");
    }
}
,["void","CPCoder"])]);
}CPThemeAttributeEncode = function(aCoder, aThemeAttribute)
{
    var values = aThemeAttribute._values,
        count = objj_msgSend(values, "count"),
        key = "$a" + objj_msgSend(aThemeAttribute, "name");
    if (count === 1)
    {
        var state = objj_msgSend(values, "allKeys")[0];
        if (state === String(CPThemeStateNormal))
        {
            objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(values, "objectForKey:", state), key);
            return YES;
        }
    }
    if (count >= 1)
    {
        objj_msgSend(aCoder, "encodeObject:forKey:", aThemeAttribute, key);
        return YES;
    }
    return NO;
}
CPThemeAttributeDecode = function(aCoder, anAttributeName, aDefaultValue, aTheme, aClass)
{
    var key = "$a" + anAttributeName;
    if (!objj_msgSend(aCoder, "containsValueForKey:", key))
        var attribute = objj_msgSend(objj_msgSend(_CPThemeAttribute, "alloc"), "initWithName:defaultValue:", anAttributeName, aDefaultValue);
    else
    {
        var attribute = objj_msgSend(aCoder, "decodeObjectForKey:", key);
        if (!attribute.isa || !objj_msgSend(attribute, "isKindOfClass:", objj_msgSend(_CPThemeAttribute, "class")))
        {
            var themeAttribute = objj_msgSend(objj_msgSend(_CPThemeAttribute, "alloc"), "initWithName:defaultValue:", anAttributeName, aDefaultValue);
            objj_msgSend(themeAttribute, "setValue:", attribute);
            attribute = themeAttribute;
        }
    }
    if (aTheme && aClass)
        objj_msgSend(attribute, "setParentAttribute:", objj_msgSend(aTheme, "attributeWithName:forClass:", anAttributeName, aClass));
    return attribute;
}
