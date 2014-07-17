@STATIC;1.0;i;8;_CPSet.jt;4421;objj_executeFile("_CPSet.j", YES);{var the_class = objj_allocateClassPair(CPSet, "CPMutableSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCapacity:"), function $CPMutableSet__initWithCapacity_(self, _cmd, aCapacity)
{
    return self.isa.objj_msgSend0(self, "init");
}
,["id","unsigned"]), new objj_method(sel_getUid("filterUsingPredicate:"), function $CPMutableSet__filterUsingPredicate_(self, _cmd, aPredicate)
{
    var object,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        if (!(aPredicate == null ? null : aPredicate.isa.objj_msgSend1(aPredicate, "evaluateWithObject:", object)))
            self.isa.objj_msgSend1(self, "removeObject:", object);
}
,["void","CPPredicate"]), new objj_method(sel_getUid("removeObject:"), function $CPMutableSet__removeObject_(self, _cmd, anObject)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","id"]), new objj_method(sel_getUid("removeObjectsInArray:"), function $CPMutableSet__removeObjectsInArray_(self, _cmd, anArray)
{
    var index = 0,
        count = (anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "count"));
    for (; index < count; ++index)
        self.isa.objj_msgSend1(self, "removeObject:", (anArray == null ? null : anArray.isa.objj_msgSend1(anArray, "objectAtIndex:", index)));
}
,["void","CPArray"]), new objj_method(sel_getUid("removeAllObjects"), function $CPMutableSet__removeAllObjects(self, _cmd)
{
    var object,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        self.isa.objj_msgSend1(self, "removeObject:", object);
}
,["void"]), new objj_method(sel_getUid("addObjectsFromArray:"), function $CPMutableSet__addObjectsFromArray_(self, _cmd, objects)
{
    var count = (objects == null ? null : objects.isa.objj_msgSend0(objects, "count"));
    while (count--)
        self.isa.objj_msgSend1(self, "addObject:", objects[count]);
}
,["void","CPArray"]), new objj_method(sel_getUid("unionSet:"), function $CPMutableSet__unionSet_(self, _cmd, aSet)
{
    var object,
        objectEnumerator = (aSet == null ? null : aSet.isa.objj_msgSend0(aSet, "objectEnumerator"));
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        self.isa.objj_msgSend1(self, "addObject:", object);
}
,["void","CPSet"]), new objj_method(sel_getUid("minusSet:"), function $CPMutableSet__minusSet_(self, _cmd, aSet)
{
    var object,
        objectEnumerator = (aSet == null ? null : aSet.isa.objj_msgSend0(aSet, "objectEnumerator"));
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        self.isa.objj_msgSend1(self, "removeObject:", object);
}
,["void","CPSet"]), new objj_method(sel_getUid("intersectSet:"), function $CPMutableSet__intersectSet_(self, _cmd, aSet)
{
    var object,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator"),
        objectsToRemove = [];
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        if (!(aSet == null ? null : aSet.isa.objj_msgSend1(aSet, "containsObject:", object)))
            objectsToRemove.push(object);
    var count = (objectsToRemove == null ? null : objectsToRemove.isa.objj_msgSend0(objectsToRemove, "count"));
    while (count--)
        self.isa.objj_msgSend1(self, "removeObject:", objectsToRemove[count]);
}
,["void","CPSet"]), new objj_method(sel_getUid("setSet:"), function $CPMutableSet__setSet_(self, _cmd, aSet)
{
    self.isa.objj_msgSend0(self, "removeAllObjects");
    self.isa.objj_msgSend1(self, "unionSet:", aSet);
}
,["void","CPSet"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("setWithCapacity:"), function $CPMutableSet__setWithCapacity_(self, _cmd, aCapacity)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithCapacity:", aCapacity));
    var ___r1;
}
,["id","CPUInteger"])]);
}