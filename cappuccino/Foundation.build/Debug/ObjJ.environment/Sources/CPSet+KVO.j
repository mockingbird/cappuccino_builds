@STATIC;1.0;i;13;CPException.ji;10;CPObject.ji;14;CPMutableSet.ji;8;CPNull.ji;27;_CPCollectionKVCOperators.jt;19797;objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPMutableSet.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("_CPCollectionKVCOperators.j", YES);{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("mutableSetValueForKey:"), function $CPObject__mutableSetValueForKey_(self, _cmd, aKey)
{
    return ((___r1 = (_CPKVCSet == null ? null : _CPKVCSet.isa.objj_msgSend0(_CPKVCSet, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithKey:forProxyObject:", aKey, self));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("mutableSetValueForKeyPath:"), function $CPObject__mutableSetValueForKeyPath_(self, _cmd, aKeyPath)
{
    var dotIndex = aKeyPath.indexOf(".");
    if (dotIndex < 0)
        return self.isa.objj_msgSend1(self, "mutableSetValueForKey:", aKeyPath);
    var firstPart = aKeyPath.substring(0, dotIndex),
        lastPart = aKeyPath.substring(dotIndex + 1);
    return ((___r1 = self.isa.objj_msgSend1(self, "valueForKeyPath:", firstPart)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mutableSetValueForKeyPath:", lastPart));
    var ___r1;
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
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._accessSEL)))
        self._access = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._accessSEL));
    self._setSEL = sel_getName("set" + capitalizedKey + ":");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._setSEL)))
        self._set = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._setSEL));
    self._countSEL = sel_getName("countOf" + capitalizedKey);
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._countSEL)))
        self._count = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._countSEL));
    self._enumeratorSEL = sel_getName("enumeratorOf" + capitalizedKey);
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._enumeratorSEL)))
        self._enumerator = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._enumeratorSEL));
    self._memberSEL = sel_getName("memberOf" + capitalizedKey + ":");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._memberSEL)))
        self._member = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._memberSEL));
    self._addSEL = sel_getName("add" + capitalizedKey + "Object:");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._addSEL)))
        self._add = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._addSEL));
    self._addManySEL = sel_getName("add" + capitalizedKey + ":");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._addManySEL)))
        self._addMany = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._addManySEL));
    self._removeSEL = sel_getName("remove" + capitalizedKey + "Object:");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._removeSEL)))
        self._remove = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._removeSEL));
    self._removeManySEL = sel_getName("remove" + capitalizedKey + ":");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._removeManySEL)))
        self._removeMany = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._removeManySEL));
    self._intersectSEL = sel_getName("intersect" + capitalizedKey + ":");
    if (((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._intersectSEL)))
        self._intersect = ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "methodForSelector:", self._intersectSEL));
    return self;
    var ___r1;
}
,["id","id","id"]), new objj_method(sel_getUid("_representedObject"), function $_CPKVCSet___representedObject(self, _cmd)
{
    if (self._access)
        return self._access(self._proxyObject, self._accessSEL);
    return ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", self._key));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("_setRepresentedObject:"), function $_CPKVCSet___setRepresentedObject_(self, _cmd, anObject)
{
    if (self._set)
        return self._set(self._proxyObject, self._setSEL, anObject);
    ((___r1 = self._proxyObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", anObject, self._key));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("count"), function $_CPKVCSet__count(self, _cmd)
{
    if (self._count)
        return self._count(self._proxyObject, self._countSEL);
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["CPUInteger"]), new objj_method(sel_getUid("objectEnumerator"), function $_CPKVCSet__objectEnumerator(self, _cmd)
{
    if (self._enumerator)
        return self._enumerator(self._proxyObject, self._enumeratorSEL);
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "objectEnumerator"));
    var ___r1;
}
,["CPEnumerator"]), new objj_method(sel_getUid("member:"), function $_CPKVCSet__member_(self, _cmd, anObject)
{
    if (self._member)
        return self._member(self._proxyObject, self._memberSEL, anObject);
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "member:", anObject));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("addObject:"), function $_CPKVCSet__addObject_(self, _cmd, anObject)
{
    if (self._add)
        self._add(self._proxyObject, self._addSEL, anObject);
    else if (self._addMany)
    {
        var objectSet = CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", anObject);
        self._addMany(self._proxyObject, self._addManySEL, objectSet);
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend1(target, "addObject:", anObject));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("addObjectsFromArray:"), function $_CPKVCSet__addObjectsFromArray_(self, _cmd, objects)
{
    if (self._addMany)
    {
        var objectSet = CPSet.isa.objj_msgSend1(CPSet, "setWithArray:", objects);
        self._addMany(self._proxyObject, self._addManySEL, objectSet);
    }
    else if (self._add)
    {
        var object,
            objectEnumerator = (objects == null ? null : objects.isa.objj_msgSend0(objects, "objectEnumerator"));
        while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
            self._add(self._proxyObject, self._addSEL, object);
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend1(target, "addObjectsFromArray:", objects));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("unionSet:"), function $_CPKVCSet__unionSet_(self, _cmd, aSet)
{
    if (self._addMany)
        self._addMany(self._proxyObject, self._addManySEL, aSet);
    else if (self._add)
    {
        var object,
            objectEnumerator = (aSet == null ? null : aSet.isa.objj_msgSend0(aSet, "objectEnumerator"));
        while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
            self._add(self._proxyObject, self._addSEL, object);
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend1(target, "unionSet:", aSet));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
}
,["void","CPSet"]), new objj_method(sel_getUid("removeObject:"), function $_CPKVCSet__removeObject_(self, _cmd, anObject)
{
    if (self._remove)
        self._remove(self._proxyObject, self._removeSEL, anObject);
    else if (self._removeMany)
    {
        var objectSet = CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", anObject);
        self._removeMany(self._proxyObject, self._removeManySEL, objectSet);
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend1(target, "removeObject:", anObject));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("minusSet:"), function $_CPKVCSet__minusSet_(self, _cmd, aSet)
{
    if (self._removeMany)
        self._removeMany(self._proxyObject, self._removeManySEL, aSet);
    else if (self._remove)
    {
        var object,
            objectEnumerator = (aSet == null ? null : aSet.isa.objj_msgSend0(aSet, "objectEnumerator"));
        while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
            self._remove(self._proxyObject, self._removeSEL, object);
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend1(target, "minusSet:", aSet));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
}
,["void","CPSet"]), new objj_method(sel_getUid("removeObjectsInArray:"), function $_CPKVCSet__removeObjectsInArray_(self, _cmd, objects)
{
    if (self._removeMany)
    {
        var objectSet = CPSet.isa.objj_msgSend1(CPSet, "setWithArray:", objects);
        self._removeMany(self._proxyObject, self._removeManySEL, objectSet);
    }
    else if (self._remove)
    {
        var object,
            objectEnumerator = (objects == null ? null : objects.isa.objj_msgSend0(objects, "objectEnumerator"));
        while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
            self._remove(self._proxyObject, self._removeSEL, object);
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend1(target, "removeObjectsInArray:", objects));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("removeAllObjects"), function $_CPKVCSet__removeAllObjects(self, _cmd)
{
    if (self._removeMany)
    {
        var allObjectsSet = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        self._removeMany(self._proxyObject, self._removeManySEL, allObjectsSet);
    }
    else if (self._remove)
    {
        var object,
            objectEnumerator = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "_representedObject")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "copy"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "objectEnumerator"));
        while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
            self._remove(self._proxyObject, self._removeSEL, object);
    }
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend0(target, "removeAllObjects"));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("intersectSet:"), function $_CPKVCSet__intersectSet_(self, _cmd, aSet)
{
    if (self._intersect)
        self._intersect(self._proxyObject, self._intersectSEL, aSet);
    else
    {
        var target = ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (target == null ? null : target.isa.objj_msgSend1(target, "intersectSet:", aSet));
        self.isa.objj_msgSend1(self, "_setRepresentedObject:", target);
    }
    var ___r1;
}
,["void","CPSet"]), new objj_method(sel_getUid("setSet:"), function $_CPKVCSet__setSet_(self, _cmd, set)
{
    self.isa.objj_msgSend1(self, "_setRepresentedObject:", set);
}
,["void","CPSet"]), new objj_method(sel_getUid("allObjects"), function $_CPKVCSet__allObjects(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allObjects"));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("anyObject"), function $_CPKVCSet__anyObject(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "anyObject"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("containsObject:"), function $_CPKVCSet__containsObject_(self, _cmd, anObject)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", anObject));
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("intersectsSet:"), function $_CPKVCSet__intersectsSet_(self, _cmd, aSet)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "intersectsSet:", aSet));
    var ___r1;
}
,["BOOL","CPSet"]), new objj_method(sel_getUid("isEqualToSet:"), function $_CPKVCSet__isEqualToSet_(self, _cmd, aSet)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToSet:", aSet));
    var ___r1;
}
,["BOOL","CPSet"]), new objj_method(sel_getUid("copy"), function $_CPKVCSet__copy(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "_representedObject")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    var ___r1;
}
,["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $_CPKVCSet__alloc(self, _cmd)
{
    var set = CPMutableSet.isa.objj_msgSend0(CPMutableSet, "set");
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
        var valuesForKeySet = CPSet.isa.objj_msgSend0(CPSet, "set"),
            containedObject,
            containedObjectValue,
            containedObjectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
        while ((containedObject = (containedObjectEnumerator == null ? null : containedObjectEnumerator.isa.objj_msgSend0(containedObjectEnumerator, "nextObject"))) !== nil)
        {
            containedObjectValue = (containedObject == null ? null : containedObject.isa.objj_msgSend1(containedObject, "valueForKeyPath:", aKeyPath));
            if (containedObjectValue === nil || containedObjectValue === undefined)
                containedObjectValue = CPNull.isa.objj_msgSend0(CPNull, "null");
            (valuesForKeySet == null ? null : valuesForKeySet.isa.objj_msgSend1(valuesForKeySet, "addObject:", containedObjectValue));
        }
        return valuesForKeySet;
    }
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPSet__setValue_forKey_(self, _cmd, aValue, aKey)
{
    var containedObject,
        containedObjectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((containedObject = (containedObjectEnumerator == null ? null : containedObjectEnumerator.isa.objj_msgSend0(containedObjectEnumerator, "nextObject"))) !== nil)
        (containedObject == null ? null : containedObject.isa.objj_msgSend2(containedObject, "setValue:forKey:", aValue, aKey));
}
,["void","id","CPString"])]);
}