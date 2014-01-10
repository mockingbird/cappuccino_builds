@STATIC;1.0;i;14;CPMutableSet.jt;3526;objj_executeFile("CPMutableSet.j", YES);var hasOwnProperty = Object.prototype.hasOwnProperty;
{var the_class = objj_allocateClassPair(CPMutableSet, "_CPConcreteMutableSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contents"), new objj_ivar("_count")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithObjects:count:"), function $_CPConcreteMutableSet__initWithObjects_count_(self, _cmd, objects, aCount)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPConcreteMutableSet").super_class }, "initWithObjects:count:", objects, aCount);
    if (self)
    {
        self._count = 0;
        self._contents = {};
        var index = 0,
            count = MIN(objj_msgSend(objects, "count"), aCount);
        for (; index < count; ++index)
            objj_msgSend(self, "addObject:", objects[index]);
    }
    return self;
}
,["id","CPArray","CPUInteger"]), new objj_method(sel_getUid("count"), function $_CPConcreteMutableSet__count(self, _cmd)
{
    return self._count;
}
,["CPUInteger"]), new objj_method(sel_getUid("member:"), function $_CPConcreteMutableSet__member_(self, _cmd, anObject)
{
    var UID = objj_msgSend(anObject, "UID");
    if (hasOwnProperty.call(self._contents, UID))
        return self._contents[UID];
    else
    {
        for (var objectUID in self._contents)
        {
            if (!hasOwnProperty.call(self._contents, objectUID))
                continue;
            var object = self._contents[objectUID];
            if (object === anObject || objj_msgSend(object, "isEqual:", anObject))
                return object;
        }
    }
    return nil;
}
,["id","id"]), new objj_method(sel_getUid("allObjects"), function $_CPConcreteMutableSet__allObjects(self, _cmd)
{
    var array = [],
        property;
    for (property in self._contents)
    {
        if (hasOwnProperty.call(self._contents, property))
            array.push(self._contents[property]);
    }
    return array;
}
,["CPArray"]), new objj_method(sel_getUid("objectEnumerator"), function $_CPConcreteMutableSet__objectEnumerator(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "allObjects"), "objectEnumerator");
}
,["CPEnumerator"]), new objj_method(sel_getUid("addObject:"), function $_CPConcreteMutableSet__addObject_(self, _cmd, anObject)
{
    if (anObject === nil || anObject === undefined)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "attempt to insert nil or undefined");
    if (objj_msgSend(self, "containsObject:", anObject))
        return;
    self._contents[objj_msgSend(anObject, "UID")] = anObject;
    self._count++;
}
,["void","id"]), new objj_method(sel_getUid("removeObject:"), function $_CPConcreteMutableSet__removeObject_(self, _cmd, anObject)
{
    if (anObject === nil || anObject === undefined)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "attempt to remove nil or undefined");
    var object = objj_msgSend(self, "member:", anObject);
    if (object !== nil)
    {
        delete self._contents[objj_msgSend(object, "UID")];
        self._count--;
    }
}
,["void","id"]), new objj_method(sel_getUid("removeAllObjects"), function $_CPConcreteMutableSet__removeAllObjects(self, _cmd)
{
    self._contents = {};
    self._count = 0;
}
,["void"]), new objj_method(sel_getUid("classForCoder"), function $_CPConcreteMutableSet__classForCoder(self, _cmd)
{
    return objj_msgSend(CPSet, "class");
}
,["Class"])]);
}