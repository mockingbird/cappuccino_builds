@STATIC;1.0;i;9;CPArray.ji;8;CPNull.ji;27;_CPCollectionKVCOperators.jt;21295;objj_executeFile("CPArray.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("_CPCollectionKVCOperators.j", YES);{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("mutableArrayValueForKey:"), function $CPObject__mutableArrayValueForKey_(self, _cmd, aKey)
{
    return objj_msgSend(objj_msgSend(_CPKVCArray, "alloc"), "initWithKey:forProxyObject:", aKey, self);
}
,["id","id"]), new objj_method(sel_getUid("mutableArrayValueForKeyPath:"), function $CPObject__mutableArrayValueForKeyPath_(self, _cmd, aKeyPath)
{
    var dotIndex = aKeyPath.indexOf(".");
    if (dotIndex < 0)
        return objj_msgSend(self, "mutableArrayValueForKey:", aKeyPath);
    var firstPart = aKeyPath.substring(0, dotIndex),
        lastPart = aKeyPath.substring(dotIndex + 1);
    return objj_msgSend(objj_msgSend(self, "valueForKeyPath:", firstPart), "mutableArrayValueForKeyPath:", lastPart);
}
,["id","id"])]);
}{var the_class = objj_allocateClassPair(CPMutableArray, "_CPKVCArray"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_proxyObject"), new objj_ivar("_key"), new objj_ivar("_insertSEL"), new objj_ivar("_insert"), new objj_ivar("_removeSEL"), new objj_ivar("_remove"), new objj_ivar("_replaceSEL"), new objj_ivar("_replace"), new objj_ivar("_insertManySEL"), new objj_ivar("_insertMany"), new objj_ivar("_removeManySEL"), new objj_ivar("_removeMany"), new objj_ivar("_replaceManySEL"), new objj_ivar("_replaceMany"), new objj_ivar("_objectAtIndexSEL"), new objj_ivar("_objectAtIndex"), new objj_ivar("_objectsAtIndexesSEL"), new objj_ivar("_objectsAtIndexes"), new objj_ivar("_countSEL"), new objj_ivar("_count"), new objj_ivar("_accessSEL"), new objj_ivar("_access"), new objj_ivar("_setSEL"), new objj_ivar("_set")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKey:forProxyObject:"), function $_CPKVCArray__initWithKey_forProxyObject_(self, _cmd, aKey, anObject)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKVCArray").super_class }, "init");
    self._key = aKey;
    self._proxyObject = anObject;
    var capitalizedKey = (self._key.charAt(0)).toUpperCase() + self._key.substring(1);
    self._insertSEL = sel_getName("insertObject:in" + capitalizedKey + "AtIndex:");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._insertSEL))
        self._insert = objj_msgSend(self._proxyObject, "methodForSelector:", self._insertSEL);
    self._removeSEL = sel_getName("removeObjectFrom" + capitalizedKey + "AtIndex:");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._removeSEL))
        self._remove = objj_msgSend(self._proxyObject, "methodForSelector:", self._removeSEL);
    self._replaceSEL = sel_getName("replaceObjectIn" + capitalizedKey + "AtIndex:withObject:");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._replaceSEL))
        self._replace = objj_msgSend(self._proxyObject, "methodForSelector:", self._replaceSEL);
    self._insertManySEL = sel_getName("insert" + capitalizedKey + ":atIndexes:");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._insertManySEL))
        self._insertMany = objj_msgSend(self._proxyObject, "methodForSelector:", self._insertManySEL);
    self._removeManySEL = sel_getName("remove" + capitalizedKey + "AtIndexes:");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._removeManySEL))
        self._removeMany = objj_msgSend(self._proxyObject, "methodForSelector:", self._removeManySEL);
    self._replaceManySEL = sel_getName("replace" + capitalizedKey + "AtIndexes:with" + capitalizedKey + ":");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._replaceManySEL))
        self._replaceMany = objj_msgSend(self._proxyObject, "methodForSelector:", self._replaceManySEL);
    self._objectAtIndexSEL = sel_getName("objectIn" + capitalizedKey + "AtIndex:");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._objectAtIndexSEL))
        self._objectAtIndex = objj_msgSend(self._proxyObject, "methodForSelector:", self._objectAtIndexSEL);
    self._objectsAtIndexesSEL = sel_getName(self._key + "AtIndexes:");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._objectsAtIndexesSEL))
        self._objectsAtIndexes = objj_msgSend(self._proxyObject, "methodForSelector:", self._objectsAtIndexesSEL);
    self._countSEL = sel_getName("countOf" + capitalizedKey);
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._countSEL))
        self._count = objj_msgSend(self._proxyObject, "methodForSelector:", self._countSEL);
    self._accessSEL = sel_getName(self._key);
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._accessSEL))
        self._access = objj_msgSend(self._proxyObject, "methodForSelector:", self._accessSEL);
    self._setSEL = sel_getName("set" + capitalizedKey + ":");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._setSEL))
        self._set = objj_msgSend(self._proxyObject, "methodForSelector:", self._setSEL);
    return self;
}
,["id","id","id"]), new objj_method(sel_getUid("copy"), function $_CPKVCArray__copy(self, _cmd)
{
    var i = 0,
        theCopy = [],
        count = objj_msgSend(self, "count");
    for (; i < count; i++)
        objj_msgSend(theCopy, "addObject:", objj_msgSend(self, "objectAtIndex:", i));
    return theCopy;
}
,["id"]), new objj_method(sel_getUid("_representedObject"), function $_CPKVCArray___representedObject(self, _cmd)
{
    if (self._access)
        return self._access(self._proxyObject, self._accessSEL);
    return objj_msgSend(self._proxyObject, "valueForKey:", self._key);
}
,["id"]), new objj_method(sel_getUid("_setRepresentedObject:"), function $_CPKVCArray___setRepresentedObject_(self, _cmd, anObject)
{
    if (self._set)
        return self._set(self._proxyObject, self._setSEL, anObject);
    objj_msgSend(self._proxyObject, "setValue:forKey:", anObject, self._key);
}
,["void","id"]), new objj_method(sel_getUid("count"), function $_CPKVCArray__count(self, _cmd)
{
    if (self._count)
        return self._count(self._proxyObject, self._countSEL);
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "count");
}
,["unsigned"]), new objj_method(sel_getUid("indexOfObject:inRange:"), function $_CPKVCArray__indexOfObject_inRange_(self, _cmd, anObject, aRange)
{
    var index = aRange.location,
        count = aRange.length,
        shouldIsEqual = !!anObject.isa;
    for (; index < count; ++index)
    {
        var object = objj_msgSend(self, "objectAtIndex:", index);
        if (anObject === object || shouldIsEqual && !!object.isa && objj_msgSend(anObject, "isEqual:", object))
            return index;
    }
    return CPNotFound;
}
,["int","CPObject","CPRange"]), new objj_method(sel_getUid("indexOfObject:"), function $_CPKVCArray__indexOfObject_(self, _cmd, anObject)
{
    return objj_msgSend(self, "indexOfObject:inRange:", anObject, CPMakeRange(0, objj_msgSend(self, "count")));
}
,["int","CPObject"]), new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"), function $_CPKVCArray__indexOfObjectIdenticalTo_inRange_(self, _cmd, anObject, aRange)
{
    var index = aRange.location,
        count = aRange.length;
    for (; index < count; ++index)
        if (anObject === objj_msgSend(self, "objectAtIndex:", index))
            return index;
    return CPNotFound;
}
,["int","CPObject","CPRange"]), new objj_method(sel_getUid("indexOfObjectIdenticalTo:"), function $_CPKVCArray__indexOfObjectIdenticalTo_(self, _cmd, anObject)
{
    return objj_msgSend(self, "indexOfObjectIdenticalTo:inRange:", anObject, CPMakeRange(0, objj_msgSend(self, "count")));
}
,["int","CPObject"]), new objj_method(sel_getUid("objectAtIndex:"), function $_CPKVCArray__objectAtIndex_(self, _cmd, anIndex)
{
    return objj_msgSend(objj_msgSend(self, "objectsAtIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex)), "firstObject");
}
,["id","unsigned"]), new objj_method(sel_getUid("objectsAtIndexes:"), function $_CPKVCArray__objectsAtIndexes_(self, _cmd, theIndexes)
{
    if (self._objectsAtIndexes)
        return self._objectsAtIndexes(self._proxyObject, self._objectsAtIndexesSEL, theIndexes);
    if (self._objectAtIndex)
    {
        var index = CPNotFound,
            objects = [];
        while ((index = objj_msgSend(theIndexes, "indexGreaterThanIndex:", index)) !== CPNotFound)
            objects.push(self._objectAtIndex(self._proxyObject, self._objectAtIndexSEL, index));
        return objects;
    }
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "objectsAtIndexes:", theIndexes);
}
,["CPArray","CPIndexSet"]), new objj_method(sel_getUid("addObject:"), function $_CPKVCArray__addObject_(self, _cmd, anObject)
{
    objj_msgSend(self, "insertObject:atIndex:", anObject, objj_msgSend(self, "count"));
}
,["void","id"]), new objj_method(sel_getUid("addObjectsFromArray:"), function $_CPKVCArray__addObjectsFromArray_(self, _cmd, anArray)
{
    var index = 0,
        count = objj_msgSend(anArray, "count");
    objj_msgSend(self, "insertObjects:atIndexes:", anArray, objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(objj_msgSend(self, "count"), count)));
}
,["void","CPArray"]), new objj_method(sel_getUid("insertObject:atIndex:"), function $_CPKVCArray__insertObject_atIndex_(self, _cmd, anObject, anIndex)
{
    objj_msgSend(self, "insertObjects:atIndexes:", [anObject], objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex));
}
,["void","id","unsigned"]), new objj_method(sel_getUid("insertObjects:atIndexes:"), function $_CPKVCArray__insertObjects_atIndexes_(self, _cmd, theObjects, theIndexes)
{
    if (self._insertMany)
        self._insertMany(self._proxyObject, self._insertManySEL, theObjects, theIndexes);
    else if (self._insert)
    {
        var indexesArray = [];
        objj_msgSend(theIndexes, "getIndexes:maxCount:inIndexRange:", indexesArray, -1, nil);
        for (var index = 0; index < objj_msgSend(indexesArray, "count"); index++)
        {
            var objectIndex = objj_msgSend(indexesArray, "objectAtIndex:", index),
                object = objj_msgSend(theObjects, "objectAtIndex:", index);
            self._insert(self._proxyObject, self._insertSEL, object, objectIndex);
        }
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "insertObjects:atIndexes:", theObjects, theIndexes);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","CPArray","CPIndexSet"]), new objj_method(sel_getUid("removeObject:"), function $_CPKVCArray__removeObject_(self, _cmd, anObject)
{
    objj_msgSend(self, "removeObject:inRange:", anObject, CPMakeRange(0, objj_msgSend(self, "count")));
}
,["void","id"]), new objj_method(sel_getUid("removeObjectsInArray:"), function $_CPKVCArray__removeObjectsInArray_(self, _cmd, theObjects)
{
    if (self._removeMany)
    {
        var indexes = objj_msgSend(CPIndexSet, "indexSet"),
            index = objj_msgSend(theObjects, "count"),
            position = 0,
            count = objj_msgSend(self, "count");
        while (index--)
        {
            while ((position = objj_msgSend(self, "indexOfObject:inRange:", objj_msgSend(theObjects, "objectAtIndex:", index), CPMakeRange(position + 1, count))) !== CPNotFound)
                objj_msgSend(indexes, "addIndex:", position);
        }
        self._removeMany(self._proxyObject, self._removeManySEL, indexes);
    }
    else if (self._remove)
    {
        var index = objj_msgSend(theObjects, "count"),
            position;
        while (index--)
        {
            while ((position = objj_msgSend(self, "indexOfObject:", objj_msgSend(theObjects, "objectAtIndex:", index))) !== CPNotFound)
                self._remove(self._proxyObject, self._removeSEL, position);
        }
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "removeObjectsInArray:", theObjects);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("removeObject:inRange:"), function $_CPKVCArray__removeObject_inRange_(self, _cmd, theObject, theRange)
{
    if (self._remove)
        self._remove(self._proxyObject, self._removeSEL, objj_msgSend(self, "indexOfObject:inRange:", theObject, theRange));
    else if (self._removeMany)
    {
        var index = objj_msgSend(self, "indexOfObject:inRange:", theObject, theRange);
        self._removeMany(self._proxyObject, self._removeManySEL, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index));
    }
    else
    {
        var index;
        while ((index = objj_msgSend(self, "indexOfObject:inRange:", theObject, theRange)) !== CPNotFound)
        {
            objj_msgSend(self, "removeObjectAtIndex:", index);
            theRange = CPIntersectionRange(CPMakeRange(index, self.length - index), theRange);
        }
    }
}
,["void","id","CPRange"]), new objj_method(sel_getUid("removeLastObject"), function $_CPKVCArray__removeLastObject(self, _cmd)
{
    objj_msgSend(self, "removeObjectsAtIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", objj_msgSend(self, "count") - 1));
}
,["void"]), new objj_method(sel_getUid("removeObjectAtIndex:"), function $_CPKVCArray__removeObjectAtIndex_(self, _cmd, anIndex)
{
    objj_msgSend(self, "removeObjectsAtIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex));
}
,["void","unsigned"]), new objj_method(sel_getUid("removeObjectsAtIndexes:"), function $_CPKVCArray__removeObjectsAtIndexes_(self, _cmd, theIndexes)
{
    if (self._removeMany)
        self._removeMany(self._proxyObject, self._removeManySEL, theIndexes);
    else if (self._remove)
    {
        var index = objj_msgSend(theIndexes, "lastIndex");
        while (index !== CPNotFound)
        {
            self._remove(self._proxyObject, self._removeSEL, index);
            index = objj_msgSend(theIndexes, "indexLessThanIndex:", index);
        }
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "removeObjectsAtIndexes:", theIndexes);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"), function $_CPKVCArray__replaceObjectAtIndex_withObject_(self, _cmd, anIndex, anObject)
{
    objj_msgSend(self, "replaceObjectsAtIndexes:withObjects:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex), [anObject]);
}
,["void","unsigned","id"]), new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"), function $_CPKVCArray__replaceObjectsAtIndexes_withObjects_(self, _cmd, theIndexes, theObjects)
{
    if (self._replaceMany)
        return self._replaceMany(self._proxyObject, self._replaceManySEL, theIndexes, theObjects);
    else if (self._replace)
    {
        var i = 0,
            index = objj_msgSend(theIndexes, "firstIndex");
        while (index !== CPNotFound)
        {
            self._replace(self._proxyObject, self._replaceSEL, index, objj_msgSend(theObjects, "objectAtIndex:", i++));
            index = objj_msgSend(theIndexes, "indexGreaterThanIndex:", index);
        }
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "replaceObjectsAtIndexes:withObjects:", theIndexes, theObjects);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","CPIndexSet","CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $_CPKVCArray__alloc(self, _cmd)
{
    var array = [];
    array.isa = self;
    var ivars = class_copyIvarList(self),
        count = ivars.length;
    while (count--)
        array[ivar_getName(ivars[count])] = nil;
    return array;
}
,["id"])]);
}{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueForKey:"), function $CPArray__valueForKey_(self, _cmd, aKey)
{
    if (aKey.charAt(0) === "@")
    {
        if (aKey.indexOf(".") !== -1)
            objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "called valueForKey: on an array with a complex key (" + aKey + "). use valueForKeyPath:");
        if (aKey === "@count")
            return self.length;
        return objj_msgSend(self, "valueForUndefinedKey:", aKey);
    }
    else
    {
        var newArray = [],
            enumerator = objj_msgSend(self, "objectEnumerator"),
            object;
        while ((object = objj_msgSend(enumerator, "nextObject")) !== nil)
        {
            var value = objj_msgSend(object, "valueForKey:", aKey);
            if (value === nil || value === undefined)
                value = objj_msgSend(CPNull, "null");
            newArray.push(value);
        }
        return newArray;
    }
}
,["id","CPString"]), new objj_method(sel_getUid("valueForKeyPath:"), function $CPArray__valueForKeyPath_(self, _cmd, aKeyPath)
{
    if (!aKeyPath)
        objj_msgSend(self, "valueForUndefinedKey:", "<empty path>");
    if (aKeyPath.charAt(0) === "@")
    {
        var dotIndex = aKeyPath.indexOf("."),
            operator,
            parameter;
        if (dotIndex !== -1)
        {
            operator = aKeyPath.substring(1, dotIndex);
            parameter = aKeyPath.substring(dotIndex + 1);
        }
        else
            operator = aKeyPath.substring(1);
        return objj_msgSend(_CPCollectionKVCOperator, "performOperation:withCollection:propertyPath:", operator, self, parameter);
    }
    else
    {
        var newArray = [],
            enumerator = objj_msgSend(self, "objectEnumerator"),
            object;
        while ((object = objj_msgSend(enumerator, "nextObject")) !== nil)
        {
            var value = objj_msgSend(object, "valueForKeyPath:", aKeyPath);
            if (value === nil || value === undefined)
                value = objj_msgSend(CPNull, "null");
            newArray.push(value);
        }
        return newArray;
    }
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPArray__setValue_forKey_(self, _cmd, aValue, aKey)
{
    var enumerator = objj_msgSend(self, "objectEnumerator"),
        object;
    while ((object = objj_msgSend(enumerator, "nextObject")) !== nil)
        objj_msgSend(object, "setValue:forKey:", aValue, aKey);
}
,["void","id","CPString"]), new objj_method(sel_getUid("setValue:forKeyPath:"), function $CPArray__setValue_forKeyPath_(self, _cmd, aValue, aKeyPath)
{
    var enumerator = objj_msgSend(self, "objectEnumerator"),
        object;
    while ((object = objj_msgSend(enumerator, "nextObject")) !== nil)
        objj_msgSend(object, "setValue:forKeyPath:", aValue, aKeyPath);
}
,["void","id","CPString"])]);
}{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function $CPArray__addObserver_forKeyPath_options_context_(self, _cmd, anObserver, aKeyPath, anOptions, aContext)
{
    if (aKeyPath !== "@count")
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "[CPArray " + CPStringFromSelector(_cmd) + "] is not supported. Key path: " + aKeyPath);
}
,["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function $CPArray__removeObserver_forKeyPath_(self, _cmd, anObserver, aKeyPath)
{
    if (aKeyPath !== "@count")
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "[CPArray " + CPStringFromSelector(_cmd) + "] is not supported. Key path: " + aKeyPath);
}
,["void","id","CPString"]), new objj_method(sel_getUid("addObserver:toObjectsAtIndexes:forKeyPath:options:context:"), function $CPArray__addObserver_toObjectsAtIndexes_forKeyPath_options_context_(self, _cmd, anObserver, indexes, aKeyPath, options, context)
{
    var index = objj_msgSend(indexes, "firstIndex");
    while (index >= 0)
    {
        objj_msgSend(self[index], "addObserver:forKeyPath:options:context:", anObserver, aKeyPath, options, context);
        index = objj_msgSend(indexes, "indexGreaterThanIndex:", index);
    }
}
,["void","id","CPIndexSet","CPString","unsigned","id"]), new objj_method(sel_getUid("removeObserver:fromObjectsAtIndexes:forKeyPath:"), function $CPArray__removeObserver_fromObjectsAtIndexes_forKeyPath_(self, _cmd, anObserver, indexes, aKeyPath)
{
    var index = objj_msgSend(indexes, "firstIndex");
    while (index >= 0)
    {
        objj_msgSend(self[index], "removeObserver:forKeyPath:", anObserver, aKeyPath);
        index = objj_msgSend(indexes, "indexGreaterThanIndex:", index);
    }
}
,["void","id","CPIndexSet","CPString"])]);
}