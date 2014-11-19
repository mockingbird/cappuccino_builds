@STATIC;1.0;i;9;CPArray.ji;8;CPNull.ji;27;_CPCollectionKVCOperators.jt;25824;objj_executeFile("CPArray.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("_CPCollectionKVCOperators.j", YES);{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("mutableArrayValueForKey:"), function $CPObject__mutableArrayValueForKey_(self, _cmd, aKey)
{
    return ((___r1 = (_CPKVCArray == null ? null : _CPKVCArray.isa.objj_msgSend0(_CPKVCArray, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithKey:forProxyObject:", aKey, self));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("mutableArrayValueForKeyPath:"), function $CPObject__mutableArrayValueForKeyPath_(self, _cmd, aKeyPath)
{
    var dotIndex = aKeyPath.indexOf(".");
    if (dotIndex < 0)
        return self.isa.objj_msgSend1(self, "mutableArrayValueForKey:", aKeyPath);
    var firstPart = aKeyPath.substring(0, dotIndex),
        lastPart = aKeyPath.substring(dotIndex + 1);
    return ((___r1 = self.isa.objj_msgSend1(self, "valueForKeyPath:", firstPart)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mutableArrayValueForKeyPath:", lastPart));
    var ___r1;
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
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._insertSEL)))
        self._insert = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._insertSEL));
    self._removeSEL = sel_getName("removeObjectFrom" + capitalizedKey + "AtIndex:");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._removeSEL)))
        self._remove = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._removeSEL));
    self._replaceSEL = sel_getName("replaceObjectIn" + capitalizedKey + "AtIndex:withObject:");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._replaceSEL)))
        self._replace = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._replaceSEL));
    self._insertManySEL = sel_getName("insert" + capitalizedKey + ":atIndexes:");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._insertManySEL)))
        self._insertMany = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._insertManySEL));
    self._removeManySEL = sel_getName("remove" + capitalizedKey + "AtIndexes:");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._removeManySEL)))
        self._removeMany = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._removeManySEL));
    self._replaceManySEL = sel_getName("replace" + capitalizedKey + "AtIndexes:with" + capitalizedKey + ":");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._replaceManySEL)))
        self._replaceMany = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._replaceManySEL));
    self._objectAtIndexSEL = sel_getName("objectIn" + capitalizedKey + "AtIndex:");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._objectAtIndexSEL)))
        self._objectAtIndex = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._objectAtIndexSEL));
    self._objectsAtIndexesSEL = sel_getName(self._key + "AtIndexes:");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._objectsAtIndexesSEL)))
        self._objectsAtIndexes = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._objectsAtIndexesSEL));
    self._countSEL = sel_getName("countOf" + capitalizedKey);
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._countSEL)))
        self._count = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._countSEL));
    self._accessSEL = sel_getName(self._key);
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._accessSEL)))
        self._access = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._accessSEL));
    self._setSEL = sel_getName("set" + capitalizedKey + ":");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._setSEL)))
        self._set = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._setSEL));
    return self;
    var ___r1;
}
,["id","id","id"]), new objj_method(sel_getUid("copy"), function $_CPKVCArray__copy(self, _cmd)
{
    var i = 0,
        theCopy = [],
        count = self.isa.objj_msgSend0(self, "count");
    for (; i < count; i++)
        (theCopy == null ? null : theCopy.isa.objj_msgSend1(theCopy, "addObject:", self.isa.objj_msgSend1(self, "objectAtIndex:", i)));
    return theCopy;
}
,["id"]), new objj_method(sel_getUid("_representedObject"), function $_CPKVCArray___representedObject(self, _cmd)
{
    if (self._access)
        return self._access(self._proxyObject, self._accessSEL);
    return ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", self._key));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("_setRepresentedObject:"), function $_CPKVCArray___setRepresentedObject_(self, _cmd, anObject)
{
    if (self._set)
        return self._set(self._proxyObject, self._setSEL, anObject);
    ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", anObject, self._key));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("count"), function $_CPKVCArray__count(self, _cmd)
{
    if (self._count)
        return self._count(self._proxyObject, self._countSEL);
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["CPUInteger"]), new objj_method(sel_getUid("indexOfObject:inRange:"), function $_CPKVCArray__indexOfObject_inRange_(self, _cmd, anObject, aRange)
{
    var index = aRange.location,
        count = aRange.length,
        shouldIsEqual = !!anObject.isa;
    for (; index < count; ++index)
    {
        var object = self.isa.objj_msgSend1(self, "objectAtIndex:", index);
        if (anObject === object || shouldIsEqual && !!object.isa && (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "isEqual:", object)))
            return index;
    }
    return CPNotFound;
}
,["CPUInteger","id","CPRange"]), new objj_method(sel_getUid("indexOfObject:"), function $_CPKVCArray__indexOfObject_(self, _cmd, anObject)
{
    return self.isa.objj_msgSend2(self, "indexOfObject:inRange:", anObject, CPMakeRange(0, self.isa.objj_msgSend0(self, "count")));
}
,["CPUInteger","id"]), new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"), function $_CPKVCArray__indexOfObjectIdenticalTo_inRange_(self, _cmd, anObject, aRange)
{
    var index = aRange.location,
        count = aRange.length;
    for (; index < count; ++index)
        if (anObject === self.isa.objj_msgSend1(self, "objectAtIndex:", index))
            return index;
    return CPNotFound;
}
,["CPUInteger","id","CPRange"]), new objj_method(sel_getUid("indexOfObjectIdenticalTo:"), function $_CPKVCArray__indexOfObjectIdenticalTo_(self, _cmd, anObject)
{
    return self.isa.objj_msgSend2(self, "indexOfObjectIdenticalTo:inRange:", anObject, CPMakeRange(0, self.isa.objj_msgSend0(self, "count")));
}
,["CPUInteger","id"]), new objj_method(sel_getUid("objectAtIndex:"), function $_CPKVCArray__objectAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = self.isa.objj_msgSend1(self, "objectsAtIndexes:", (CPIndexSet == null ? null : CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex)))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstObject"));
    var ___r1;
}
,["id","CPUInteger"]), new objj_method(sel_getUid("objectsAtIndexes:"), function $_CPKVCArray__objectsAtIndexes_(self, _cmd, theIndexes)
{
    if (self._objectsAtIndexes)
        return self._objectsAtIndexes(self._proxyObject, self._objectsAtIndexesSEL, theIndexes);
    if (self._objectAtIndex)
    {
        var index = CPNotFound,
            objects = [];
        while ((index = (theIndexes == null ? null : theIndexes.isa.objj_msgSend1(theIndexes, "indexGreaterThanIndex:", index))) !== CPNotFound)
            objects.push(self._objectAtIndex(self._proxyObject, self._objectAtIndexSEL, index));
        return objects;
    }
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectsAtIndexes:", theIndexes));
    var ___r1;
}
,["CPArray","CPIndexSet"]), new objj_method(sel_getUid("addObject:"), function $_CPKVCArray__addObject_(self, _cmd, anObject)
{
    self.isa.objj_msgSend2(self, "insertObject:atIndex:", anObject, self.isa.objj_msgSend0(self, "count"));
}
,["void","id"]), new objj_method(sel_getUid("addObjectsFromArray:"), function $_CPKVCArray__addObjectsFromArray_(self, _cmd, anArray)
{
    var index = 0,
        count = (anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "count"));
    self.isa.objj_msgSend2(self, "insertObjects:atIndexes:", anArray, (CPIndexSet == null ? null : CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(self.isa.objj_msgSend0(self, "count"), count))));
}
,["void","CPArray"]), new objj_method(sel_getUid("insertObject:atIndex:"), function $_CPKVCArray__insertObject_atIndex_(self, _cmd, anObject, anIndex)
{
    self.isa.objj_msgSend2(self, "insertObjects:atIndexes:", [anObject], (CPIndexSet == null ? null : CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex)));
}
,["void","id","CPUInteger"]), new objj_method(sel_getUid("insertObjects:atIndexes:"), function $_CPKVCArray__insertObjects_atIndexes_(self, _cmd, theObjects, theIndexes)
{
    if (self._insertMany)
        self._insertMany(self._proxyObject, self._insertManySEL, theObjects, theIndexes);
    else if (self._insert)
    {
        var indexesArray = [];
        (theIndexes == null ? null : theIndexes.isa.objj_msgSend3(theIndexes, "getIndexes:maxCount:inIndexRange:", indexesArray, -1, nil));
        for (var index = 0; index < (indexesArray == null ? null : indexesArray.isa.objj_msgSend0(indexesArray, "count")); index++)
        {
            var objectIndex = (indexesArray == null ? null : indexesArray.isa.objj_msgSend1(indexesArray, "objectAtIndex:", index)),
                object = (theObjects == null ? null : theObjects.isa.objj_msgSend1(theObjects, "objectAtIndex:", index));
            self._insert(self._proxyObject, self._insertSEL, object, objectIndex);
        }
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend2(target, "insertObjects:atIndexes:", theObjects, theIndexes));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
}
,["void","CPArray","CPIndexSet"]), new objj_method(sel_getUid("removeObject:"), function $_CPKVCArray__removeObject_(self, _cmd, anObject)
{
    self.isa.objj_msgSend2(self, "removeObject:inRange:", anObject, CPMakeRange(0, self.isa.objj_msgSend0(self, "count")));
}
,["void","id"]), new objj_method(sel_getUid("removeObjectsInArray:"), function $_CPKVCArray__removeObjectsInArray_(self, _cmd, theObjects)
{
    if (self._removeMany)
    {
        var indexes = (CPIndexSet == null ? null : CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet")),
            index = (theObjects == null ? null : theObjects.isa.objj_msgSend0(theObjects, "count")),
            position = 0,
            count = self.isa.objj_msgSend0(self, "count");
        while (index--)
        {
            while ((position = self.isa.objj_msgSend2(self, "indexOfObject:inRange:", (theObjects == null ? null : theObjects.isa.objj_msgSend1(theObjects, "objectAtIndex:", index)), CPMakeRange(position + 1, count))) !== CPNotFound)
                (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "addIndex:", position));
        }
        self._removeMany(self._proxyObject, self._removeManySEL, indexes);
    }
    else if (self._remove)
    {
        var index = (theObjects == null ? null : theObjects.isa.objj_msgSend0(theObjects, "count")),
            position;
        while (index--)
        {
            while ((position = self.isa.objj_msgSend1(self, "indexOfObject:", (theObjects == null ? null : theObjects.isa.objj_msgSend1(theObjects, "objectAtIndex:", index)))) !== CPNotFound)
                self._remove(self._proxyObject, self._removeSEL, position);
        }
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend1(target, "removeObjectsInArray:", theObjects));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("removeObject:inRange:"), function $_CPKVCArray__removeObject_inRange_(self, _cmd, theObject, theRange)
{
    if (self._remove)
        self._remove(self._proxyObject, self._removeSEL, self.isa.objj_msgSend2(self, "indexOfObject:inRange:", theObject, theRange));
    else if (self._removeMany)
    {
        var index = self.isa.objj_msgSend2(self, "indexOfObject:inRange:", theObject, theRange);
        self._removeMany(self._proxyObject, self._removeManySEL, (CPIndexSet == null ? null : CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", index)));
    }
    else
    {
        var index;
        while ((index = self.isa.objj_msgSend2(self, "indexOfObject:inRange:", theObject, theRange)) !== CPNotFound)
        {
            self.isa.objj_msgSend1(self, "removeObjectAtIndex:", index);
            theRange = CPIntersectionRange(CPMakeRange(index, self.length - index), theRange);
        }
    }
}
,["void","id","CPRange"]), new objj_method(sel_getUid("removeLastObject"), function $_CPKVCArray__removeLastObject(self, _cmd)
{
    self.isa.objj_msgSend1(self, "removeObjectsAtIndexes:", (CPIndexSet == null ? null : CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", self.isa.objj_msgSend0(self, "count") - 1)));
}
,["void"]), new objj_method(sel_getUid("removeObjectAtIndex:"), function $_CPKVCArray__removeObjectAtIndex_(self, _cmd, anIndex)
{
    self.isa.objj_msgSend1(self, "removeObjectsAtIndexes:", (CPIndexSet == null ? null : CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex)));
}
,["void","CPUInteger"]), new objj_method(sel_getUid("removeObjectsAtIndexes:"), function $_CPKVCArray__removeObjectsAtIndexes_(self, _cmd, theIndexes)
{
    if (self._removeMany)
        self._removeMany(self._proxyObject, self._removeManySEL, theIndexes);
    else if (self._remove)
    {
        var index = (theIndexes == null ? null : theIndexes.isa.objj_msgSend0(theIndexes, "lastIndex"));
        while (index !== CPNotFound)
        {
            self._remove(self._proxyObject, self._removeSEL, index);
            index = (theIndexes == null ? null : theIndexes.isa.objj_msgSend1(theIndexes, "indexLessThanIndex:", index));
        }
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend1(target, "removeObjectsAtIndexes:", theIndexes));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"), function $_CPKVCArray__replaceObjectAtIndex_withObject_(self, _cmd, anIndex, anObject)
{
    self.isa.objj_msgSend2(self, "replaceObjectsAtIndexes:withObjects:", (CPIndexSet == null ? null : CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex)), [anObject]);
}
,["void","CPUInteger","id"]), new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"), function $_CPKVCArray__replaceObjectsAtIndexes_withObjects_(self, _cmd, theIndexes, theObjects)
{
    if (self._replaceMany)
        return self._replaceMany(self._proxyObject, self._replaceManySEL, theIndexes, theObjects);
    else if (self._replace)
    {
        var i = 0,
            index = (theIndexes == null ? null : theIndexes.isa.objj_msgSend0(theIndexes, "firstIndex"));
        while (index !== CPNotFound)
        {
            self._replace(self._proxyObject, self._replaceSEL, index, (theObjects == null ? null : theObjects.isa.objj_msgSend1(theObjects, "objectAtIndex:", i++)));
            index = (theIndexes == null ? null : theIndexes.isa.objj_msgSend1(theIndexes, "indexGreaterThanIndex:", index));
        }
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend2(target, "replaceObjectsAtIndexes:withObjects:", theIndexes, theObjects));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
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
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "called valueForKey: on an array with a complex key (" + aKey + "). use valueForKeyPath:");
        if (aKey === "@count")
            return self.length;
        return self.isa.objj_msgSend1(self, "valueForUndefinedKey:", aKey);
    }
    else
    {
        var newArray = [],
            enumerator = self.isa.objj_msgSend0(self, "objectEnumerator"),
            object;
        while ((object = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject"))) !== nil)
        {
            var value = (object == null ? null : object.isa.objj_msgSend1(object, "valueForKey:", aKey));
            if (value === nil || value === undefined)
                value = CPNull.isa.objj_msgSend0(CPNull, "null");
            newArray.push(value);
        }
        return newArray;
    }
}
,["id","CPString"]), new objj_method(sel_getUid("valueForKeyPath:"), function $CPArray__valueForKeyPath_(self, _cmd, aKeyPath)
{
    if (!aKeyPath)
        self.isa.objj_msgSend1(self, "valueForUndefinedKey:", "<empty path>");
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
        return _CPCollectionKVCOperator.isa.objj_msgSend3(_CPCollectionKVCOperator, "performOperation:withCollection:propertyPath:", operator, self, parameter);
    }
    else
    {
        var newArray = [],
            enumerator = self.isa.objj_msgSend0(self, "objectEnumerator"),
            object;
        while ((object = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject"))) !== nil)
        {
            var value = (object == null ? null : object.isa.objj_msgSend1(object, "valueForKeyPath:", aKeyPath));
            if (value === nil || value === undefined)
                value = CPNull.isa.objj_msgSend0(CPNull, "null");
            newArray.push(value);
        }
        return newArray;
    }
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPArray__setValue_forKey_(self, _cmd, aValue, aKey)
{
    var enumerator = self.isa.objj_msgSend0(self, "objectEnumerator"),
        object;
    while ((object = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject"))) !== nil)
        (object == null ? null : object.isa.objj_msgSend2(object, "setValue:forKey:", aValue, aKey));
}
,["void","id","CPString"]), new objj_method(sel_getUid("setValue:forKeyPath:"), function $CPArray__setValue_forKeyPath_(self, _cmd, aValue, aKeyPath)
{
    var enumerator = self.isa.objj_msgSend0(self, "objectEnumerator"),
        object;
    while ((object = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject"))) !== nil)
        (object == null ? null : object.isa.objj_msgSend2(object, "setValue:forKeyPath:", aValue, aKeyPath));
}
,["void","id","CPString"])]);
}{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function $CPArray__addObserver_forKeyPath_options_context_(self, _cmd, anObserver, aKeyPath, anOptions, aContext)
{
    if (aKeyPath !== "@count")
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "[CPArray " + CPStringFromSelector(_cmd) + "] is not supported. Key path: " + aKeyPath);
}
,["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function $CPArray__removeObserver_forKeyPath_(self, _cmd, anObserver, aKeyPath)
{
    if (aKeyPath !== "@count")
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "[CPArray " + CPStringFromSelector(_cmd) + "] is not supported. Key path: " + aKeyPath);
}
,["void","id","CPString"]), new objj_method(sel_getUid("addObserver:toObjectsAtIndexes:forKeyPath:options:context:"), function $CPArray__addObserver_toObjectsAtIndexes_forKeyPath_options_context_(self, _cmd, anObserver, indexes, aKeyPath, options, context)
{
    var index = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "firstIndex"));
    while (index >= 0)
    {
        ((___r1 = self[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", anObserver, aKeyPath, options, context));
        index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", index));
    }
    var ___r1;
}
,["void","id","CPIndexSet","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:fromObjectsAtIndexes:forKeyPath:"), function $CPArray__removeObserver_fromObjectsAtIndexes_forKeyPath_(self, _cmd, anObserver, indexes, aKeyPath)
{
    var index = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "firstIndex"));
    while (index >= 0)
    {
        ((___r1 = self[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:forKeyPath:", anObserver, aKeyPath));
        index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", index));
    }
    var ___r1;
}
,["void","id","CPIndexSet","CPString"])]);
}