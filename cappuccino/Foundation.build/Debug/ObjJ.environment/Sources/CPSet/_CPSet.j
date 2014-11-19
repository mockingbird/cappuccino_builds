@STATIC;1.0;i;9;CPArray.ji;14;CPEnumerator.ji;10;CPNumber.ji;10;CPObject.jt;15796;objj_executeFile("CPArray.j", YES);objj_executeFile("CPEnumerator.j", YES);objj_executeFile("CPNumber.j", YES);objj_executeFile("CPObject.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setByAddingObject:"), function $CPSet__setByAddingObject_(self, _cmd, anObject)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWithArray:", ((___r2 = self.isa.objj_msgSend0(self, "allObjects")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "arrayByAddingObject:", anObject))));
    var ___r1, ___r2;
}
,["id","id"]), new objj_method(sel_getUid("setByAddingObjectsFromSet:"), function $CPSet__setByAddingObjectsFromSet_(self, _cmd, aSet)
{
    return self.isa.objj_msgSend1(self, "setByAddingObjectsFromArray:", (aSet == null ? null : aSet.isa.objj_msgSend0(aSet, "allObjects")));
}
,["id","CPSet"]), new objj_method(sel_getUid("setByAddingObjectsFromArray:"), function $CPSet__setByAddingObjectsFromArray_(self, _cmd, anArray)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWithArray:", ((___r2 = self.isa.objj_msgSend0(self, "allObjects")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "arrayByAddingObjectsFromArray:", anArray))));
    var ___r1, ___r2;
}
,["id","CPArray"]), new objj_method(sel_getUid("init"), function $CPSet__init(self, _cmd)
{
    return self.isa.objj_msgSend2(self, "initWithObjects:count:", nil, 0);
}
,["id"]), new objj_method(sel_getUid("initWithArray:"), function $CPSet__initWithArray_(self, _cmd, anArray)
{
    return self.isa.objj_msgSend2(self, "initWithObjects:count:", anArray, (anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "count")));
}
,["id","CPArray"]), new objj_method(sel_getUid("initWithObjects:"), function $CPSet__initWithObjects_(self, _cmd, anObject)
{
    var index = 2,
        count = arguments.length;
    for (; index < count; ++index)
        if (arguments[index] === nil)
            break;
    return self.isa.objj_msgSend2(self, "initWithObjects:count:", Array.prototype.slice.call(arguments, 2, index), index - 2);
}
,["id","id"]), new objj_method(sel_getUid("initWithObjects:count:"), function $CPSet__initWithObjects_count_(self, _cmd, objects, aCount)
{
    if (self === _CPSharedPlaceholderSet)
        return ((___r1 = (_CPConcreteMutableSet == null ? null : _CPConcreteMutableSet.isa.objj_msgSend0(_CPConcreteMutableSet, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithObjects:count:", objects, aCount));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSet").super_class }, "init");
    var ___r1;
}
,["id","CPArray","CPUInteger"]), new objj_method(sel_getUid("initWithSet:"), function $CPSet__initWithSet_(self, _cmd, aSet)
{
    return self.isa.objj_msgSend1(self, "initWithArray:", (aSet == null ? null : aSet.isa.objj_msgSend0(aSet, "allObjects")));
}
,["id","CPSet"]), new objj_method(sel_getUid("initWithSet:copyItems:"), function $CPSet__initWithSet_copyItems_(self, _cmd, aSet, shouldCopyItems)
{
    if (shouldCopyItems)
        return (aSet == null ? null : aSet.isa.objj_msgSend1(aSet, "valueForKey:", "copy"));
    return self.isa.objj_msgSend1(self, "initWithSet:", aSet);
}
,["id","CPSet","BOOL"]), new objj_method(sel_getUid("count"), function $CPSet__count(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["CPUInteger"]), new objj_method(sel_getUid("allObjects"), function $CPSet__allObjects(self, _cmd)
{
    var objects = [],
        object,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        objects.push(object);
    return objects;
}
,["CPArray"]), new objj_method(sel_getUid("anyObject"), function $CPSet__anyObject(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "objectEnumerator")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "nextObject"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("containsObject:"), function $CPSet__containsObject_(self, _cmd, anObject)
{
    return self.isa.objj_msgSend1(self, "member:", anObject) !== nil;
}
,["BOOL","id"]), new objj_method(sel_getUid("filteredSetUsingPredicate:"), function $CPSet__filteredSetUsingPredicate_(self, _cmd, aPredicate)
{
    var objects = [],
        object,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        if ((aPredicate == null ? null : aPredicate.isa.objj_msgSend1(aPredicate, "evaluateWithObject:", object)))
            objects.push(object);
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithArray:", objects));
    var ___r1, ___r2;
}
,["CPSet","CPPredicate"]), new objj_method(sel_getUid("makeObjectsPerformSelector:"), function $CPSet__makeObjectsPerformSelector_(self, _cmd, aSelector)
{
    self.isa.objj_msgSend2(self, "makeObjectsPerformSelector:withObjects:", aSelector, nil);
}
,["void","SEL"]), new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"), function $CPSet__makeObjectsPerformSelector_withObject_(self, _cmd, aSelector, anObject)
{
    self.isa.objj_msgSend2(self, "makeObjectsPerformSelector:withObjects:", aSelector, [anObject]);
}
,["void","SEL","id"]), new objj_method(sel_getUid("makeObjectsPerformSelector:withObjects:"), function $CPSet__makeObjectsPerformSelector_withObjects_(self, _cmd, aSelector, objects)
{
    var object,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator"),
        argumentsArray = [nil, aSelector].concat(objects || []);
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
    {
        argumentsArray[0] = object;
        objj_msgSend.apply(this, argumentsArray);
    }
}
,["void","SEL","CPArray"]), new objj_method(sel_getUid("member:"), function $CPSet__member_(self, _cmd, anObject)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["id","id"]), new objj_method(sel_getUid("objectEnumerator"), function $CPSet__objectEnumerator(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["CPEnumerator"]), new objj_method(sel_getUid("enumerateObjectsUsingBlock:"), function $CPSet__enumerateObjectsUsingBlock_(self, _cmd, aFunction)
{
    var object,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        if (aFunction(object))
            break;
}
,["void","Function"]), new objj_method(sel_getUid("objectsPassingTest:"), function $CPSet__objectsPassingTest_(self, _cmd, aFunction)
{
    var objects = [],
        object = nil,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        if (aFunction(object))
            objects.push(object);
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithArray:", objects));
    var ___r1, ___r2;
}
,["CPSet","Function"]), new objj_method(sel_getUid("isSubsetOfSet:"), function $CPSet__isSubsetOfSet_(self, _cmd, aSet)
{
    var object = nil,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        if (!(aSet == null ? null : aSet.isa.objj_msgSend1(aSet, "containsObject:", object)))
            return NO;
    return YES;
}
,["BOOL","CPSet"]), new objj_method(sel_getUid("intersectsSet:"), function $CPSet__intersectsSet_(self, _cmd, aSet)
{
    if (self === aSet)
        return self.isa.objj_msgSend0(self, "count") > 0;
    var object = nil,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        if ((aSet == null ? null : aSet.isa.objj_msgSend1(aSet, "containsObject:", object)))
            return YES;
    return NO;
}
,["BOOL","CPSet"]), new objj_method(sel_getUid("sortedArrayUsingDescriptors:"), function $CPSet__sortedArrayUsingDescriptors_(self, _cmd, someSortDescriptors)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "allObjects")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sortedArrayUsingDescriptors:", someSortDescriptors));
    var ___r1;
}
,["CPArray","CPArray"]), new objj_method(sel_getUid("isEqualToSet:"), function $CPSet__isEqualToSet_(self, _cmd, aSet)
{
    return self.isa.objj_msgSend1(self, "isEqual:", aSet);
}
,["BOOL","CPSet"]), new objj_method(sel_getUid("isEqual:"), function $CPSet__isEqual_(self, _cmd, aSet)
{
    return self === aSet || (aSet == null ? null : aSet.isa.objj_msgSend1(aSet, "isKindOfClass:", CPSet.isa.objj_msgSend0(CPSet, "class"))) && (self.isa.objj_msgSend0(self, "count") === (aSet == null ? null : aSet.isa.objj_msgSend0(aSet, "count")) && (aSet == null ? null : aSet.isa.objj_msgSend1(aSet, "isSubsetOfSet:", self)));
}
,["BOOL","CPSet"]), new objj_method(sel_getUid("description"), function $CPSet__description(self, _cmd)
{
    var string = "{(\n",
        objects = self.isa.objj_msgSend0(self, "allObjects"),
        index = 0,
        count = (objects == null ? null : objects.isa.objj_msgSend0(objects, "count"));
    for (; index < count; ++index)
    {
        var object = objects[index];
        string += "\t" + ((String(object)).split('\n')).join("\n\t") + "\n";
    }
    return string + ")}";
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPSet__alloc(self, _cmd)
{
    if (self === CPSet.isa.objj_msgSend0(CPSet, "class") || self === (CPMutableSet == null ? null : CPMutableSet.isa.objj_msgSend0(CPMutableSet, "class")))
        return (_CPPlaceholderSet == null ? null : _CPPlaceholderSet.isa.objj_msgSend0(_CPPlaceholderSet, "alloc"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPSet").super_class }, "alloc");
}
,["id"]), new objj_method(sel_getUid("set"), function $CPSet__set(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("setWithArray:"), function $CPSet__setWithArray_(self, _cmd, anArray)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithArray:", anArray));
    var ___r1;
}
,["id","CPArray"]), new objj_method(sel_getUid("setWithObject:"), function $CPSet__setWithObject_(self, _cmd, anObject)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithObjects:", anObject));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("setWithObjects:count:"), function $CPSet__setWithObjects_count_(self, _cmd, objects, count)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithObjects:count:", objects, count));
    var ___r1;
}
,["id","id","CPUInteger"]), new objj_method(sel_getUid("setWithObjects:"), function $CPSet__setWithObjects_(self, _cmd, anObject)
{
    var argumentsArray = Array.prototype.slice.apply(arguments);
    argumentsArray[0] = self.isa.objj_msgSend0(self, "alloc");
    argumentsArray[1] = sel_getUid("initWithObjects:");
    return objj_msgSend.apply(this, argumentsArray);
}
,["id","id"]), new objj_method(sel_getUid("setWithSet:"), function $CPSet__setWithSet_(self, _cmd, set)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithSet:", set));
    var ___r1;
}
,["id","CPSet"])]);
}{
var the_class = objj_getClass("CPSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPSet__copy(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWithSet:", self));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("mutableCopy"), function $CPSet__mutableCopy(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "copy");
}
,["id"])]);
}var CPSetObjectsKey = "CPSetObjectsKey";
{
var the_class = objj_getClass("CPSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPSet__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "initWithArray:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSetObjectsKey)));
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSet__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "allObjects"), CPSetObjectsKey));
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueForKey:"), function $CPSet__valueForKey_(self, _cmd, aKey)
{
    if (aKey === "@count")
        return self.isa.objj_msgSend0(self, "count");
    var valueSet = CPSet.isa.objj_msgSend0(CPSet, "set"),
        object,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
    {
        var value = (object == null ? null : object.isa.objj_msgSend1(object, "valueForKey:", aKey));
        (valueSet == null ? null : valueSet.isa.objj_msgSend1(valueSet, "addObject:", value));
    }
    return valueSet;
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPSet__setValue_forKey_(self, _cmd, aValue, aKey)
{
    var object,
        objectEnumerator = self.isa.objj_msgSend0(self, "objectEnumerator");
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        (object == null ? null : object.isa.objj_msgSend2(object, "setValue:forKey:", aValue, aKey));
}
,["void","id","CPString"])]);
}var _CPSharedPlaceholderSet = nil;
{var the_class = objj_allocateClassPair(CPSet, "_CPPlaceholderSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $_CPPlaceholderSet__alloc(self, _cmd)
{
    if (!_CPSharedPlaceholderSet)
        _CPSharedPlaceholderSet = objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("_CPPlaceholderSet").super_class }, "alloc");
    return _CPSharedPlaceholderSet;
}
,["id"])]);
}