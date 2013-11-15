@STATIC;1.0;i;9;CPArray.ji;14;CPEnumerator.ji;13;CPException.ji;8;CPNull.ji;10;CPObject.jt;18613;objj_executeFile("CPArray.j", YES);objj_executeFile("CPEnumerator.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("CPObject.j", YES);var CPDictionaryShowNilDeprecationMessage = YES,
    CPDictionaryMaxDescriptionRecursion = 10;
{var the_class = objj_allocateClassPair(CPEnumerator, "_CPDictionaryValueEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyEnumerator"), new objj_ivar("_dictionary")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithDictionary:"), function $_CPDictionaryValueEnumerator__initWithDictionary_(self, _cmd, aDictionary)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDictionaryValueEnumerator").super_class }, "init");
    if (self)
    {
        self._keyEnumerator = objj_msgSend(aDictionary, "keyEnumerator");
        self._dictionary = aDictionary;
    }
    return self;
}
,["id","CPDictionary"]), new objj_method(sel_getUid("nextObject"), function $_CPDictionaryValueEnumerator__nextObject(self, _cmd)
{
    var key = objj_msgSend(self._keyEnumerator, "nextObject");
    if (key === nil)
        return nil;
    return objj_msgSend(self._dictionary, "objectForKey:", key);
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPObject, "CPDictionary"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithDictionary:"), function $CPDictionary__initWithDictionary_(self, _cmd, aDictionary)
{
    var key = "",
        dictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    for (key in aDictionary._buckets)
        objj_msgSend(dictionary, "setObject:forKey:", objj_msgSend(aDictionary, "objectForKey:", key), key);
    return dictionary;
}
,["id","CPDictionary"]), new objj_method(sel_getUid("initWithObjects:forKeys:"), function $CPDictionary__initWithObjects_forKeys_(self, _cmd, objects, keyArray)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDictionary").super_class }, "init");
    if (objj_msgSend(objects, "count") != objj_msgSend(keyArray, "count"))
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(CPString, "stringWithFormat:", "Counts are different.(%d != %d)", objj_msgSend(objects, "count"), objj_msgSend(keyArray, "count")));
    if (self)
    {
        var i = objj_msgSend(keyArray, "count");
        while (i--)
        {
            var value = objects[i],
                key = keyArray[i];
            if (value === nil)
            {
                CPDictionaryShowNilDeprecationMessage = NO;
                CPLog.warn(objj_msgSend(CPString, "stringWithFormat:", "[%s %s] DEPRECATED: Attempt to insert nil object from objects[%d]", objj_msgSend(self, "className"), _cmd, i));
                if (typeof objj_backtrace_print === "function")
                    objj_backtrace_print(CPLog.warn);
            }
            if (key === nil)
            {
                CPDictionaryShowNilDeprecationMessage = NO;
                CPLog.warn(objj_msgSend(CPString, "stringWithFormat:", "[%s %s] DEPRECATED: Attempt to insert nil key from keys[%d]", objj_msgSend(self, "className"), _cmd, i));
                if (typeof objj_backtrace_print === "function")
                    objj_backtrace_print(CPLog.warn);
            }
            objj_msgSend(self, "setObject:forKey:", value, key);
        }
    }
    return self;
}
,["id","CPArray","CPArray"]), new objj_method(sel_getUid("initWithObjectsAndKeys:"), function $CPDictionary__initWithObjectsAndKeys_(self, _cmd, firstObject)
{
    var argCount = arguments.length;
    if (argCount % 2 !== 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Key-value count is mismatched. (" + argCount + " arguments passed)");
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDictionary").super_class }, "init");
    if (self)
    {
        var index = 2;
        for (; index < argCount; index += 2)
        {
            var value = arguments[index],
                key = arguments[index + 1];
            if (value === nil)
            {
                CPDictionaryShowNilDeprecationMessage = NO;
                CPLog.warn(objj_msgSend(CPString, "stringWithFormat:", "[%s %s] DEPRECATED: Attempt to insert nil object from objects[%d]", objj_msgSend(self, "className"), _cmd, index / 2 - 1));
                if (typeof objj_backtrace_print === "function")
                    objj_backtrace_print(CPLog.warn);
            }
            if (key === nil)
            {
                CPDictionaryShowNilDeprecationMessage = NO;
                CPLog.warn(objj_msgSend(CPString, "stringWithFormat:", "[%s %s] DEPRECATED: Attempt to insert nil key from keys[%d]", objj_msgSend(self, "className"), _cmd, index / 2 - 1));
                if (typeof objj_backtrace_print === "function")
                    objj_backtrace_print(CPLog.warn);
            }
            objj_msgSend(self, "setObject:forKey:", value, key);
        }
    }
    return self;
}
,["id","id"]), new objj_method(sel_getUid("copy"), function $CPDictionary__copy(self, _cmd)
{
    return objj_msgSend(CPDictionary, "dictionaryWithDictionary:", self);
}
,["CPDictionary"]), new objj_method(sel_getUid("count"), function $CPDictionary__count(self, _cmd)
{
    return self._count;
}
,["int"]), new objj_method(sel_getUid("allKeys"), function $CPDictionary__allKeys(self, _cmd)
{
    return objj_msgSend(self._keys, "copy");
}
,["CPArray"]), new objj_method(sel_getUid("allValues"), function $CPDictionary__allValues(self, _cmd)
{
    var keys = self._keys,
        index = keys.length,
        values = [];
    while (index--)
        values.push(self.valueForKey(keys[index]));
    return values;
}
,["CPArray"]), new objj_method(sel_getUid("allKeysForObject:"), function $CPDictionary__allKeysForObject_(self, _cmd, anObject)
{
    var keys = self._keys,
        count = keys.length,
        index = 0,
        matchingKeys = [],
        key = nil,
        value = nil;
    for (; index < count; ++index)
    {
        key = keys[index];
        value = self._buckets[key];
        if (value.isa && anObject && anObject.isa && objj_msgSend(value, "respondsToSelector:", sel_getUid("isEqual:")) && objj_msgSend(value, "isEqual:", anObject))
            matchingKeys.push(key);
        else if (value === anObject)
            matchingKeys.push(key);
    }
    return matchingKeys;
}
,["CPArray","id"]), new objj_method(sel_getUid("keysOfEntriesPassingTest:"), function $CPDictionary__keysOfEntriesPassingTest_(self, _cmd, predicate)
{
    return objj_msgSend(self, "keysOfEntriesWithOptions:passingTest:", CPEnumerationNormal, predicate);
}
,["CPArray","Function"]), new objj_method(sel_getUid("keysOfEntriesWithOptions:passingTest:"), function $CPDictionary__keysOfEntriesWithOptions_passingTest_(self, _cmd, options, predicate)
{
    var keys = self._keys;
    if (options & CPEnumerationReverse)
    {
        var index = objj_msgSend(keys, "count") - 1,
            stop = -1,
            increment = -1;
    }
    else
    {
        var index = 0,
            stop = objj_msgSend(keys, "count"),
            increment = 1;
    }
    var matchingKeys = [],
        key = nil,
        value = nil,
        shouldStop = NO,
        stopRef = function(__input) { if (arguments.length) return shouldStop = __input; return shouldStop; };
    for (; index !== stop; index += increment)
    {
        key = keys[index];
        value = self._buckets[key];
        if (predicate(key, value, stopRef))
            matchingKeys.push(key);
        if (shouldStop)
            break;
    }
    return matchingKeys;
}
,["CPArray","CPEnumerationOptions","Function"]), new objj_method(sel_getUid("keysSortedByValueUsingComparator:"), function $CPDictionary__keysSortedByValueUsingComparator_(self, _cmd, comparator)
{
    return objj_msgSend(objj_msgSend(self, "allKeys"), "sortedArrayUsingFunction:", function(a, b)
    {
        a = objj_msgSend(self, "objectForKey:", a);
        b = objj_msgSend(self, "objectForKey:", b);
        return comparator(a, b);
    });
}
,["CPArray","Function"]), new objj_method(sel_getUid("keysSortedByValueUsingSelector:"), function $CPDictionary__keysSortedByValueUsingSelector_(self, _cmd, theSelector)
{
    return objj_msgSend(objj_msgSend(self, "allKeys"), "sortedArrayUsingFunction:", function(a, b)
    {
        a = objj_msgSend(self, "objectForKey:", a);
        b = objj_msgSend(self, "objectForKey:", b);
        return objj_msgSend(a, "performSelector:withObject:", theSelector, b);
    });
}
,["CPArray","SEL"]), new objj_method(sel_getUid("keyEnumerator"), function $CPDictionary__keyEnumerator(self, _cmd)
{
    return objj_msgSend(self._keys, "objectEnumerator");
}
,["CPEnumerator"]), new objj_method(sel_getUid("objectEnumerator"), function $CPDictionary__objectEnumerator(self, _cmd)
{
    return objj_msgSend(objj_msgSend(_CPDictionaryValueEnumerator, "alloc"), "initWithDictionary:", self);
}
,["CPEnumerator"]), new objj_method(sel_getUid("isEqualToDictionary:"), function $CPDictionary__isEqualToDictionary_(self, _cmd, aDictionary)
{
    if (self === aDictionary)
        return YES;
    var count = objj_msgSend(self, "count");
    if (count !== objj_msgSend(aDictionary, "count"))
        return NO;
    var index = count,
        keys = self._keys;
    while (index--)
    {
        var currentKey = keys[index],
            lhsObject = self._buckets[currentKey],
            rhsObject = aDictionary._buckets[currentKey];
        if (lhsObject === rhsObject)
            continue;
        if (lhsObject && lhsObject.isa && rhsObject && rhsObject.isa && objj_msgSend(lhsObject, "respondsToSelector:", sel_getUid("isEqual:")) && objj_msgSend(lhsObject, "isEqual:", rhsObject))
            continue;
        return NO;
    }
    return YES;
}
,["BOOL","CPDictionary"]), new objj_method(sel_getUid("isEqual:"), function $CPDictionary__isEqual_(self, _cmd, anObject)
{
    if (self === anObject)
        return YES;
    if (!objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(CPDictionary, "class")))
        return NO;
    return objj_msgSend(self, "isEqualToDictionary:", anObject);
}
,["BOOL","id"]), new objj_method(sel_getUid("objectForKey:"), function $CPDictionary__objectForKey_(self, _cmd, aKey)
{
    var object = self._buckets[aKey];
    return object === undefined ? nil : object;
}
,["id","id"]), new objj_method(sel_getUid("removeAllObjects"), function $CPDictionary__removeAllObjects(self, _cmd)
{
    self.removeAllValues();
}
,["void"]), new objj_method(sel_getUid("removeObjectForKey:"), function $CPDictionary__removeObjectForKey_(self, _cmd, aKey)
{
    self.removeValueForKey(aKey);
}
,["void","id"]), new objj_method(sel_getUid("removeObjectsForKeys:"), function $CPDictionary__removeObjectsForKeys_(self, _cmd, keysForRemoval)
{
    var index = keysForRemoval.length;
    while (index--)
        objj_msgSend(self, "removeObjectForKey:", keysForRemoval[index]);
}
,["void","CPArray"]), new objj_method(sel_getUid("setObject:forKey:"), function $CPDictionary__setObject_forKey_(self, _cmd, anObject, aKey)
{
    if (CPDictionaryShowNilDeprecationMessage)
    {
        if (aKey === nil)
        {
            CPLog.warn(objj_msgSend(CPString, "stringWithFormat:", "[%s %s] DEPRECATED: key cannot be nil", objj_msgSend(self, "className"), _cmd));
            if (typeof objj_backtrace_print === "function")
                objj_backtrace_print(CPLog.warn);
        }
        if (anObject === nil)
        {
            CPLog.warn(objj_msgSend(CPString, "stringWithFormat:", "[%s %s] DEPRECATED: object cannot be nil (key: %s)", objj_msgSend(self, "className"), _cmd, aKey));
            if (typeof objj_backtrace_print === "function")
                objj_backtrace_print(CPLog.warn);
        }
    }
    else
        CPDictionaryShowNilDeprecationMessage = YES;
    self.setValueForKey(aKey, anObject);
}
,["void","id","id"]), new objj_method(sel_getUid("addEntriesFromDictionary:"), function $CPDictionary__addEntriesFromDictionary_(self, _cmd, aDictionary)
{
    if (!aDictionary)
        return;
    var keys = objj_msgSend(aDictionary, "allKeys"),
        index = objj_msgSend(keys, "count");
    while (index--)
    {
        var key = keys[index];
        objj_msgSend(self, "setObject:forKey:", objj_msgSend(aDictionary, "objectForKey:", key), key);
    }
}
,["void","CPDictionary"]), new objj_method(sel_getUid("description"), function $CPDictionary__description(self, _cmd)
{
    var string = "@{",
        keys = objj_msgSend(self, "allKeys"),
        index = 0,
        count = self._count;
    keys.sort();
    for (; index < count; ++index)
    {
        if (index === 0)
            string += "\n";
        var key = keys[index],
            value = self.valueForKey(key);
        string += "    @\"" + key + "\": " + ((CPDescriptionOfObject(value, CPDictionaryMaxDescriptionRecursion)).split("\n")).join("\n    ") + (index + 1 < count ? "," : "") + "\n";
    }
    return string + "}";
}
,["CPString"]), new objj_method(sel_getUid("containsKey:"), function $CPDictionary__containsKey_(self, _cmd, aKey)
{
    var value = objj_msgSend(self, "objectForKey:", aKey);
    return value !== nil && value !== undefined;
}
,["BOOL","id"]), new objj_method(sel_getUid("enumerateKeysAndObjectsUsingBlock:"), function $CPDictionary__enumerateKeysAndObjectsUsingBlock_(self, _cmd, aFunction)
{
    var shouldStop = NO,
        shouldStopRef = function(__input) { if (arguments.length) return shouldStop = __input; return shouldStop; },
        keys = self._keys,
        count = self._count;
    for (var index = 0; index < count; index++)
    {
        var key = keys[index],
            value = self.valueForKey(key);
        aFunction(key, value, shouldStopRef);
        if (shouldStop)
            return;
    }
}
,["void","Function"]), new objj_method(sel_getUid("enumerateKeysAndObjectsWithOptions:usingBlock:"), function $CPDictionary__enumerateKeysAndObjectsWithOptions_usingBlock_(self, _cmd, opts, aFunction)
{
    objj_msgSend(self, "enumerateKeysAndObjectsUsingBlock:", aFunction);
}
,["void","CPEnumerationOptions","Function"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPDictionary__alloc(self, _cmd)
{
    var result = new CFMutableDictionary();
    result.isa = objj_msgSend(self, "class");
    return result;
}
,["id"]), new objj_method(sel_getUid("dictionary"), function $CPDictionary__dictionary(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
,["id"]), new objj_method(sel_getUid("dictionaryWithDictionary:"), function $CPDictionary__dictionaryWithDictionary_(self, _cmd, aDictionary)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithDictionary:", aDictionary);
}
,["id","CPDictionary"]), new objj_method(sel_getUid("dictionaryWithObject:forKey:"), function $CPDictionary__dictionaryWithObject_forKey_(self, _cmd, anObject, aKey)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:forKeys:", [anObject], [aKey]);
}
,["id","id","id"]), new objj_method(sel_getUid("dictionaryWithObjects:forKeys:"), function $CPDictionary__dictionaryWithObjects_forKeys_(self, _cmd, objects, keys)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:forKeys:", objects, keys);
}
,["id","CPArray","CPArray"]), new objj_method(sel_getUid("dictionaryWithJSObject:"), function $CPDictionary__dictionaryWithJSObject_(self, _cmd, object)
{
    return objj_msgSend(self, "dictionaryWithJSObject:recursively:", object, NO);
}
,["id","JSObject"]), new objj_method(sel_getUid("dictionaryWithJSObject:recursively:"), function $CPDictionary__dictionaryWithJSObject_recursively_(self, _cmd, object, recursively)
{
    var key = "",
        dictionary = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    for (key in object)
    {
        if (!object.hasOwnProperty(key))
            continue;
        var value = object[key];
        if (value === null)
        {
            objj_msgSend(dictionary, "setObject:forKey:", objj_msgSend(CPNull, "null"), key);
            continue;
        }
        if (recursively)
        {
            if (value.constructor === Object)
                value = objj_msgSend(CPDictionary, "dictionaryWithJSObject:recursively:", value, YES);
            else if (objj_msgSend(value, "isKindOfClass:", CPArray))
            {
                var newValue = [],
                    i = 0,
                    count = value.length;
                for (; i < count; i++)
                {
                    var thisValue = value[i];
                    if (thisValue === null)
                    {
                        newValue.push(objj_msgSend(CPNull, "null"));
                    }
                    else
                    {
                        if (thisValue.constructor === Object)
                            newValue.push(objj_msgSend(CPDictionary, "dictionaryWithJSObject:recursively:", thisValue, YES));
                        else
                            newValue.push(thisValue);
                    }
                }
                value = newValue;
            }
        }
        objj_msgSend(dictionary, "setObject:forKey:", value, key);
    }
    return dictionary;
}
,["id","JSObject","BOOL"]), new objj_method(sel_getUid("dictionaryWithObjectsAndKeys:"), function $CPDictionary__dictionaryWithObjectsAndKeys_(self, _cmd, firstObject)
{
    arguments[0] = objj_msgSend(self, "alloc");
    arguments[1] = sel_getUid("initWithObjectsAndKeys:");
    return objj_msgSend.apply(this, arguments);
}
,["id","id"])]);
}{
var the_class = objj_getClass("CPDictionary")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPDictionary__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(aCoder, "_decodeDictionaryOfObjectsForKey:", "CP.objects");
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPDictionary__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "_encodeDictionaryOfObjects:forKey:", self, "CP.objects");
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPDictionary, "CPMutableDictionary"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}CFDictionary.prototype.isa = CPDictionary;
CFMutableDictionary.prototype.isa = CPMutableDictionary;
