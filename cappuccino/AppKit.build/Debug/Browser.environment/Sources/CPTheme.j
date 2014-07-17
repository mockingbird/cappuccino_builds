@STATIC;1.0;I;21;Foundation/CPObject.jI;27;Foundation/CPMutableArray.jI;21;Foundation/CPString.jI;30;Foundation/CPKeyedUnarchiver.jt;25915;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPMutableArray.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("Foundation/CPKeyedUnarchiver.j", NO);var CPThemesByName = {},
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
    return ((___r1 = self._attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys"));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("attributesForClass:"), function $CPTheme__attributesForClass_(self, _cmd, aClass)
{
    if (!aClass)
        return nil;
    var className = nil;
    if ((aClass == null ? null : aClass.isa.objj_msgSend1(aClass, "isKindOfClass:", CPString.isa.objj_msgSend0(CPString, "class"))))
    {
        var theClass = CPClassFromString(aClass);
        if (theClass)
            aClass = theClass;
        else
            className = aClass;
    }
    if (!className)
    {
        if ((aClass == null ? null : aClass.isa.objj_msgSend1(aClass, "isKindOfClass:", (CPView == null ? null : CPView.isa.objj_msgSend0(CPView, "class")))))
        {
            if ((aClass == null ? null : aClass.isa.objj_msgSend1(aClass, "respondsToSelector:", sel_getUid("defaultThemeClass"))))
                className = (aClass == null ? null : aClass.isa.objj_msgSend0(aClass, "defaultThemeClass"));
            else if ((aClass == null ? null : aClass.isa.objj_msgSend1(aClass, "respondsToSelector:", sel_getUid("themeClass"))))
            {
                CPLog.warn("%@ themeClass is deprecated in favor of defaultThemeClass", CPStringFromClass(aClass));
                className = (aClass == null ? null : aClass.isa.objj_msgSend0(aClass, "themeClass"));
            }
            else
                return nil;
        }
        else
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "aClass must be a class object or a string.");
    }
    return ((___r1 = self._attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", className));
    var ___r1;
}
,["CPDictionary","id"]), new objj_method(sel_getUid("attributeNamesForClass:"), function $CPTheme__attributeNamesForClass_(self, _cmd, aClass)
{
    var attributes = self.isa.objj_msgSend1(self, "attributesForClass:", aClass);
    if (attributes)
        return (attributes == null ? null : attributes.isa.objj_msgSend0(attributes, "allKeys"));
    else
        return CPArray.isa.objj_msgSend0(CPArray, "array");
}
,["CPDictionary","id"]), new objj_method(sel_getUid("attributeWithName:forClass:"), function $CPTheme__attributeWithName_forClass_(self, _cmd, aName, aClass)
{
    var attributes = self.isa.objj_msgSend1(self, "attributesForClass:", aClass);
    if (!attributes)
        return nil;
    return (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "objectForKey:", aName));
}
,["_CPThemeAttribute","CPString","id"]), new objj_method(sel_getUid("valueForAttributeWithName:forClass:"), function $CPTheme__valueForAttributeWithName_forClass_(self, _cmd, aName, aClass)
{
    return self.isa.objj_msgSend3(self, "valueForAttributeWithName:inState:forClass:", aName, CPThemeStateNormal, aClass);
}
,["id","CPString","id"]), new objj_method(sel_getUid("valueForAttributeWithName:inState:forClass:"), function $CPTheme__valueForAttributeWithName_inState_forClass_(self, _cmd, aName, aState, aClass)
{
    var attribute = self.isa.objj_msgSend2(self, "attributeWithName:forClass:", aName, aClass);
    if (!attribute)
        return nil;
    return (attribute == null ? null : attribute.isa.objj_msgSend1(attribute, "valueForState:", aState));
}
,["id","CPString","ThemeState","id"]), new objj_method(sel_getUid("takeThemeFromObject:"), function $CPTheme__takeThemeFromObject_(self, _cmd, anObject)
{
    var attributes = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "_themeAttributeDictionary")),
        attributeName = nil,
        attributeNames = (attributes == null ? null : attributes.isa.objj_msgSend0(attributes, "keyEnumerator")),
        objectThemeClass = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "themeClass"));
    while ((attributeName = (attributeNames == null ? null : attributeNames.isa.objj_msgSend0(attributeNames, "nextObject"))) !== nil)
        self.isa.objj_msgSend2(self, "_recordAttribute:forClass:", (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "objectForKey:", attributeName)), objectThemeClass);
}
,["void","id"]), new objj_method(sel_getUid("_recordAttribute:forClass:"), function $CPTheme___recordAttribute_forClass_(self, _cmd, anAttribute, aClass)
{
    if (!(anAttribute == null ? null : anAttribute.isa.objj_msgSend0(anAttribute, "hasValues")))
        return;
    var attributes = ((___r1 = self._attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aClass));
    if (!attributes)
    {
        attributes = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        ((___r1 = self._attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", attributes, aClass));
    }
    var name = (anAttribute == null ? null : anAttribute.isa.objj_msgSend0(anAttribute, "name")),
        existingAttribute = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "objectForKey:", name));
    if (existingAttribute)
        (attributes == null ? null : attributes.isa.objj_msgSend2(attributes, "setObject:forKey:", (existingAttribute == null ? null : existingAttribute.isa.objj_msgSend1(existingAttribute, "attributeMergedWithAttribute:", anAttribute)), name));
    else
        (attributes == null ? null : attributes.isa.objj_msgSend2(attributes, "setObject:forKey:", anAttribute, name));
    var ___r1;
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
        CPThemeDefaultHudTheme = CPTheme.isa.objj_msgSend1(CPTheme, "themeNamed:", ((___r1 = self.isa.objj_msgSend0(self, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "name")) + "-HUD");
    return CPThemeDefaultHudTheme;
    var ___r1;
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
        self._name = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPThemeNameKey));
        self._attributes = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPThemeAttributesKey));
        CPThemesByName[self._name] = self;
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTheme__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._name, CPThemeNameKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._attributes, CPThemeAttributesKey));
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
        if (key !== 'normal')
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
    if (!aState || !aState._stateNames)
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
    for (var key in this._stateNames)
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
    if (!aState || aState === CPNull.isa.objj_msgSend0(CPNull, "null"))
        return this;
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
        if (arguments[argIndex] === CPNull.isa.objj_msgSend0(CPNull, "null") || !arguments[argIndex])
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
CPThemeStateFirstResponder = CPThemeState("firstResponder");
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
    return ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0;
    var ___r1;
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
        ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", String(aState)));
    else
        ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", aValue, String(aState)));
    var ___r1;
}
,["void","id","ThemeState"]), new objj_method(sel_getUid("value"), function $_CPThemeAttribute__value(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForState:", CPThemeStateNormal);
}
,["id"]), new objj_method(sel_getUid("valueForState:"), function $_CPThemeAttribute__valueForState_(self, _cmd, aState)
{
    var stateName = String(aState),
        value = self._cache[stateName];
    if (value !== undefined)
        return value;
    value = ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", stateName));
    if (value === undefined || value === nil)
    {
        if (aState._stateNameCount > 1)
        {
            var states = ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys")),
                count = states.length,
                largestThemeState = 0;
            while (count--)
            {
                var stateObject = CPThemeState(states[count]);
                if (stateObject.isSubsetOf(aState) && stateObject._stateNameCount > largestThemeState)
                {
                    value = ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", states[count]));
                    largestThemeState = stateObject._stateNameCount;
                }
            }
        }
        if (value === undefined || value === nil)
            value = ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", String(CPThemeStateNormal)));
    }
    if (value === undefined || value === nil)
        value = ((___r1 = self._themeDefaultAttribute), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForState:", aState));
    if (value === undefined || value === nil)
    {
        value = self._defaultValue;
        if (value === CPNull.isa.objj_msgSend0(CPNull, "null"))
            value = nil;
    }
    self._cache[stateName] = value;
    return value;
    var ___r1;
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
    var mergedAttribute = ((___r1 = _CPThemeAttribute.isa.objj_msgSend0(_CPThemeAttribute, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithName:defaultValue:", self._name, self._defaultValue));
    mergedAttribute._values = ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    ((___r1 = mergedAttribute._values), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addEntriesFromDictionary:", anAttribute._values));
    return mergedAttribute;
    var ___r1;
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
        self._name = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "name"));
        self._defaultValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "defaultValue"));
        self._values = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "value")))
        {
            var state = String(CPThemeStateNormal);
            if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "state")))
                state = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "state"));
            ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "value")), state));
        }
        else
        {
            var encodedValues = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "values")),
                keys = (encodedValues == null ? null : encodedValues.isa.objj_msgSend0(encodedValues, "allKeys")),
                count = keys.length;
            while (count--)
            {
                var key = keys[count];
                ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", (encodedValues == null ? null : encodedValues.isa.objj_msgSend1(encodedValues, "objectForKey:", key)), key));
            }
        }
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPThemeAttribute__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._name, "name"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._defaultValue, "defaultValue"));
    var keys = ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys")),
        count = keys.length;
    if (count === 1)
    {
        var onlyKey = keys[0];
        if (onlyKey !== String(CPThemeStateNormal))
            (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", onlyKey, "state"));
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", onlyKey)), "value"));
    }
    else
    {
        var encodedValues = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        while (count--)
        {
            var key = keys[count];
            (encodedValues == null ? null : encodedValues.isa.objj_msgSend2(encodedValues, "setObject:forKey:", ((___r1 = self._values), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", key)), key));
        }
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", encodedValues, "values"));
    }
    var ___r1;
}
,["void","CPCoder"])]);
}CPThemeAttributeEncode = function(aCoder, aThemeAttribute)
{
    var values = aThemeAttribute._values,
        count = (values == null ? null : values.isa.objj_msgSend0(values, "count")),
        key = "$a" + (aThemeAttribute == null ? null : aThemeAttribute.isa.objj_msgSend0(aThemeAttribute, "name"));
    if (count === 1)
    {
        var state = (values == null ? null : values.isa.objj_msgSend0(values, "allKeys"))[0];
        if (state === String(CPThemeStateNormal))
        {
            (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", (values == null ? null : values.isa.objj_msgSend1(values, "objectForKey:", state)), key));
            return YES;
        }
    }
    if (count >= 1)
    {
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", aThemeAttribute, key));
        return YES;
    }
    return NO;
}
CPThemeAttributeDecode = function(aCoder, anAttributeName, aDefaultValue, aTheme, aClass)
{
    var key = "$a" + anAttributeName;
    if (!(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", key)))
        var attribute = ((___r1 = _CPThemeAttribute.isa.objj_msgSend0(_CPThemeAttribute, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithName:defaultValue:", anAttributeName, aDefaultValue));
    else
    {
        var attribute = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", key));
        if (!attribute || !attribute.isa || !(attribute == null ? null : attribute.isa.objj_msgSend1(attribute, "isKindOfClass:", _CPThemeAttribute.isa.objj_msgSend0(_CPThemeAttribute, "class"))))
        {
            var themeAttribute = ((___r1 = _CPThemeAttribute.isa.objj_msgSend0(_CPThemeAttribute, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithName:defaultValue:", anAttributeName, aDefaultValue));
            (themeAttribute == null ? null : themeAttribute.isa.objj_msgSend1(themeAttribute, "setValue:", attribute));
            attribute = themeAttribute;
        }
    }
    if (aTheme && aClass)
        (attribute == null ? null : attribute.isa.objj_msgSend1(attribute, "setParentAttribute:", (aTheme == null ? null : aTheme.isa.objj_msgSend2(aTheme, "attributeWithName:forClass:", anAttributeName, aClass))));
    return attribute;
    var ___r1;
}
