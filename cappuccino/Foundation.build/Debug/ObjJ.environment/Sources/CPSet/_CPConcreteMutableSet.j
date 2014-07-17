@STATIC;1.0;i;14;CPMutableSet.jt;3903;objj_executeFile("CPMutableSet.j", YES);var hasOwnProperty = Object.prototype.hasOwnProperty;
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
            count = MIN((objects == null ? null : objects.isa.objj_msgSend0(objects, "count")), aCount);
        for (; index < count; ++index)
            (self == null ? null : self.isa.objj_msgSend1(self, "addObject:", objects[index]));
    }
    return self;
}
,["id","CPArray","CPUInteger"]), new objj_method(sel_getUid("count"), function $_CPConcreteMutableSet__count(self, _cmd)
{
    return self._count;
}
,["CPUInteger"]), new objj_method(sel_getUid("member:"), function $_CPConcreteMutableSet__member_(self, _cmd, anObject)
{
    var UID = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"));
    if (hasOwnProperty.call(self._contents, UID))
        return self._contents[UID];
    else
    {
        for (var objectUID in self._contents)
        {
            if (!hasOwnProperty.call(self._contents, objectUID))
                continue;
            var object = self._contents[objectUID];
            if (object === anObject || (object == null ? null : object.isa.objj_msgSend1(object, "isEqual:", anObject)))
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
    return ((___r1 = self.isa.objj_msgSend0(self, "allObjects")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "objectEnumerator"));
    var ___r1;
}
,["CPEnumerator"]), new objj_method(sel_getUid("addObject:"), function $_CPConcreteMutableSet__addObject_(self, _cmd, anObject)
{
    if (anObject === nil || anObject === undefined)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "attempt to insert nil or undefined");
    if (self.isa.objj_msgSend1(self, "containsObject:", anObject))
        return;
    self._contents[(anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"))] = anObject;
    self._count++;
}
,["void","id"]), new objj_method(sel_getUid("removeObject:"), function $_CPConcreteMutableSet__removeObject_(self, _cmd, anObject)
{
    if (anObject === nil || anObject === undefined)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "attempt to remove nil or undefined");
    var object = self.isa.objj_msgSend1(self, "member:", anObject);
    if (object !== nil)
    {
        delete self._contents[(object == null ? null : object.isa.objj_msgSend0(object, "UID"))];
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
    return CPSet.isa.objj_msgSend0(CPSet, "class");
}
,["Class"])]);
}