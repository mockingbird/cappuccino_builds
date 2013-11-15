@STATIC;1.0;i;13;CPException.ji;10;CPObject.ji;14;CPMutableSet.ji;8;CPNull.ji;27;_CPCollectionKVCOperators.jt;15575;objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPMutableSet.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("_CPCollectionKVCOperators.j", YES);{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("mutableSetValueForKey:"), function $CPObject__mutableSetValueForKey_(self, _cmd, aKey)
{
    return objj_msgSend(objj_msgSend(_CPKVCSet, "alloc"), "initWithKey:forProxyObject:", aKey, self);
}
,["id","id"]), new objj_method(sel_getUid("mutableSetValueForKeyPath:"), function $CPObject__mutableSetValueForKeyPath_(self, _cmd, aKeyPath)
{
    var dotIndex = aKeyPath.indexOf(".");
    if (dotIndex < 0)
        return objj_msgSend(self, "mutableSetValueForKey:", aKeyPath);
    var firstPart = aKeyPath.substring(0, dotIndex),
        lastPart = aKeyPath.substring(dotIndex + 1);
    return objj_msgSend(objj_msgSend(self, "valueForKeyPath:", firstPart), "mutableSetValueForKeyPath:", lastPart);
}
,["id","id"])]);
}{var the_class = objj_allocateClassPair(CPMutableSet, "_CPKVCSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_proxyObject"), new objj_ivar("_key"), new objj_ivar("_accessSEL"), new objj_ivar("_access"), new objj_ivar("_setSEL"), new objj_ivar("_set"), new objj_ivar("_countSEL"), new objj_ivar("_count"), new objj_ivar("_enumeratorSEL"), new objj_ivar("_enumerator"), new objj_ivar("_memberSEL"), new objj_ivar("_member"), new objj_ivar("_addSEL"), new objj_ivar("_add"), new objj_ivar("_addManySEL"), new objj_ivar("_addMany"), new objj_ivar("_removeSEL"), new objj_ivar("_remove"), new objj_ivar("_removeManySEL"), new objj_ivar("_removeMany"), new objj_ivar("_intersectSEL"), new objj_ivar("_intersect")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKey:forProxyObject:"), function $_CPKVCSet__initWithKey_forProxyObject_(self, _cmd, aKey, anObject)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKVCSet").super_class }, "init");
    self._key = aKey;
    self._proxyObject = anObject;
    var capitalizedKey = (self._key.charAt(0)).toUpperCase() + self._key.substring(1);
    self._accessSEL = sel_getName(self._key);
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._accessSEL))
        self._access = objj_msgSend(self._proxyObject, "methodForSelector:", self._accessSEL);
    self._setSEL = sel_getName("set" + capitalizedKey + ":");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._setSEL))
        self._set = objj_msgSend(self._proxyObject, "methodForSelector:", self._setSEL);
    self._countSEL = sel_getName("countOf" + capitalizedKey);
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._countSEL))
        self._count = objj_msgSend(self._proxyObject, "methodForSelector:", self._countSEL);
    self._enumeratorSEL = sel_getName("enumeratorOf" + capitalizedKey);
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._enumeratorSEL))
        self._enumerator = objj_msgSend(self._proxyObject, "methodForSelector:", self._enumeratorSEL);
    self._memberSEL = sel_getName("memberOf" + capitalizedKey + ":");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._memberSEL))
        self._member = objj_msgSend(self._proxyObject, "methodForSelector:", self._memberSEL);
    self._addSEL = sel_getName("add" + capitalizedKey + "Object:");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._addSEL))
        self._add = objj_msgSend(self._proxyObject, "methodForSelector:", self._addSEL);
    self._addManySEL = sel_getName("add" + capitalizedKey + ":");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._addManySEL))
        self._addMany = objj_msgSend(self._proxyObject, "methodForSelector:", self._addManySEL);
    self._removeSEL = sel_getName("remove" + capitalizedKey + "Object:");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._removeSEL))
        self._remove = objj_msgSend(self._proxyObject, "methodForSelector:", self._removeSEL);
    self._removeManySEL = sel_getName("remove" + capitalizedKey + ":");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._removeManySEL))
        self._removeMany = objj_msgSend(self._proxyObject, "methodForSelector:", self._removeManySEL);
    self._intersectSEL = sel_getName("intersect" + capitalizedKey + ":");
    if (objj_msgSend(self._proxyObject, "respondsToSelector:", self._intersectSEL))
        self._intersect = objj_msgSend(self._proxyObject, "methodForSelector:", self._intersectSEL);
    return self;
}
,["id","id","id"]), new objj_method(sel_getUid("_representedObject"), function $_CPKVCSet___representedObject(self, _cmd)
{
    if (self._access)
        return self._access(self._proxyObject, self._accessSEL);
    return objj_msgSend(self._proxyObject, "valueForKey:", self._key);
}
,["id"]), new objj_method(sel_getUid("_setRepresentedObject:"), function $_CPKVCSet___setRepresentedObject_(self, _cmd, anObject)
{
    if (self._set)
        return self._set(self._proxyObject, self._setSEL, anObject);
    objj_msgSend(self._proxyObject, "setValue:forKey:", anObject, self._key);
}
,["void","id"]), new objj_method(sel_getUid("count"), function $_CPKVCSet__count(self, _cmd)
{
    if (self._count)
        return self._count(self._proxyObject, self._countSEL);
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "count");
}
,["unsigned"]), new objj_method(sel_getUid("objectEnumerator"), function $_CPKVCSet__objectEnumerator(self, _cmd)
{
    if (self._enumerator)
        return self._enumerator(self._proxyObject, self._enumeratorSEL);
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "objectEnumerator");
}
,["CPEnumerator"]), new objj_method(sel_getUid("member:"), function $_CPKVCSet__member_(self, _cmd, anObject)
{
    if (self._member)
        return self._member(self._proxyObject, self._memberSEL, anObject);
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "member:", anObject);
}
,["id","id"]), new objj_method(sel_getUid("addObject:"), function $_CPKVCSet__addObject_(self, _cmd, anObject)
{
    if (self._add)
        self._add(self._proxyObject, self._addSEL, anObject);
    else if (self._addMany)
    {
        var objectSet = objj_msgSend(CPSet, "setWithObject:", anObject);
        self._addMany(self._proxyObject, self._addManySEL, objectSet);
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "addObject:", anObject);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","id"]), new objj_method(sel_getUid("addObjectsFromArray:"), function $_CPKVCSet__addObjectsFromArray_(self, _cmd, objects)
{
    if (self._addMany)
    {
        var objectSet = objj_msgSend(CPSet, "setWithArray:", objects);
        self._addMany(self._proxyObject, self._addManySEL, objectSet);
    }
    else if (self._add)
    {
        var object,
            objectEnumerator = objj_msgSend(objects, "objectEnumerator");
        while ((object = objj_msgSend(objectEnumerator, "nextObject")) !== nil)
            self._add(self._proxyObject, self._addSEL, object);
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "addObjectsFromArray:", objects);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("unionSet:"), function $_CPKVCSet__unionSet_(self, _cmd, aSet)
{
    if (self._addMany)
        self._addMany(self._proxyObject, self._addManySEL, aSet);
    else if (self._add)
    {
        var object,
            objectEnumerator = objj_msgSend(aSet, "objectEnumerator");
        while ((object = objj_msgSend(objectEnumerator, "nextObject")) !== nil)
            self._add(self._proxyObject, self._addSEL, object);
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "unionSet:", aSet);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","CPSet"]), new objj_method(sel_getUid("removeObject:"), function $_CPKVCSet__removeObject_(self, _cmd, anObject)
{
    if (self._remove)
        self._remove(self._proxyObject, self._removeSEL, anObject);
    else if (self._removeMany)
    {
        var objectSet = objj_msgSend(CPSet, "setWithObject:", anObject);
        self._removeMany(self._proxyObject, self._removeManySEL, objectSet);
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "removeObject:", anObject);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","id"]), new objj_method(sel_getUid("minusSet:"), function $_CPKVCSet__minusSet_(self, _cmd, aSet)
{
    if (self._removeMany)
        self._removeMany(self._proxyObject, self._removeManySEL, aSet);
    else if (self._remove)
    {
        var object,
            objectEnumerator = objj_msgSend(aSet, "objectEnumerator");
        while ((object = objj_msgSend(objectEnumerator, "nextObject")) !== nil)
            self._remove(self._proxyObject, self._removeSEL, object);
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "minusSet:", aSet);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","CPSet"]), new objj_method(sel_getUid("removeObjectsInArray:"), function $_CPKVCSet__removeObjectsInArray_(self, _cmd, objects)
{
    if (self._removeMany)
    {
        var objectSet = objj_msgSend(CPSet, "setWithArray:", objects);
        self._removeMany(self._proxyObject, self._removeManySEL, objectSet);
    }
    else if (self._remove)
    {
        var object,
            objectEnumerator = objj_msgSend(objects, "objectEnumerator");
        while ((object = objj_msgSend(objectEnumerator, "nextObject")) !== nil)
            self._remove(self._proxyObject, self._removeSEL, object);
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "removeObjectsInArray:", objects);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("removeAllObjects"), function $_CPKVCSet__removeAllObjects(self, _cmd)
{
    if (self._removeMany)
    {
        var allObjectsSet = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        self._removeMany(self._proxyObject, self._removeManySEL, allObjectsSet);
    }
    else if (self._remove)
    {
        var object,
            objectEnumerator = objj_msgSend(objj_msgSend(objj_msgSend(self, "_representedObject"), "copy"), "objectEnumerator");
        while ((object = objj_msgSend(objectEnumerator, "nextObject")) !== nil)
            self._remove(self._proxyObject, self._removeSEL, object);
    }
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "removeAllObjects");
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void"]), new objj_method(sel_getUid("intersectSet:"), function $_CPKVCSet__intersectSet_(self, _cmd, aSet)
{
    if (self._intersect)
        self._intersect(self._proxyObject, self._intersectSEL, aSet);
    else
    {
        var target = objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
        objj_msgSend(target, "intersectSet:", aSet);
        objj_msgSend(self, "_setRepresentedObject:", target);
    }
}
,["void","CPSet"]), new objj_method(sel_getUid("setSet:"), function $_CPKVCSet__setSet_(self, _cmd, set)
{
    objj_msgSend(self, "_setRepresentedObject:", set);
}
,["void","CPSet"]), new objj_method(sel_getUid("allObjects"), function $_CPKVCSet__allObjects(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "allObjects");
}
,["CPArray"]), new objj_method(sel_getUid("anyObject"), function $_CPKVCSet__anyObject(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "anyObject");
}
,["id"]), new objj_method(sel_getUid("containsObject:"), function $_CPKVCSet__containsObject_(self, _cmd, anObject)
{
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "containsObject:", anObject);
}
,["BOOL","id"]), new objj_method(sel_getUid("intersectsSet:"), function $_CPKVCSet__intersectsSet_(self, _cmd, aSet)
{
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "intersectsSet:", aSet);
}
,["BOOL","CPSet"]), new objj_method(sel_getUid("isEqualToSet:"), function $_CPKVCSet__isEqualToSet_(self, _cmd, aSet)
{
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "isEqualToSet:", aSet);
}
,["BOOL","CPSet"]), new objj_method(sel_getUid("copy"), function $_CPKVCSet__copy(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "_representedObject"), "copy");
}
,["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $_CPKVCSet__alloc(self, _cmd)
{
    var set = objj_msgSend(CPMutableSet, "set");
    set.isa = self;
    var ivars = class_copyIvarList(self),
        count = ivars.length;
    while (count--)
        set[ivar_getName(ivars[count])] = nil;
    return set;
}
,["id"])]);
}{
var the_class = objj_getClass("CPSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueForKeyPath:"), function $CPSet__valueForKeyPath_(self, _cmd, aKeyPath)
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
        var valuesForKeySet = objj_msgSend(CPSet, "set"),
            containedObject,
            containedObjectValue,
            containedObjectEnumerator = objj_msgSend(self, "objectEnumerator");
        while ((containedObject = objj_msgSend(containedObjectEnumerator, "nextObject")) !== nil)
        {
            containedObjectValue = objj_msgSend(containedObject, "valueForKeyPath:", aKeyPath);
            if (containedObjectValue === nil || containedObjectValue === undefined)
                containedObjectValue = objj_msgSend(CPNull, "null");
            objj_msgSend(valuesForKeySet, "addObject:", containedObjectValue);
        }
        return valuesForKeySet;
    }
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPSet__setValue_forKey_(self, _cmd, aValue, aKey)
{
    var containedObject,
        containedObjectEnumerator = objj_msgSend(self, "objectEnumerator");
    while ((containedObject = objj_msgSend(containedObjectEnumerator, "nextObject")) !== nil)
        objj_msgSend(containedObject, "setValue:forKey:", aValue, aKey);
}
,["void","id","CPString"])]);
}