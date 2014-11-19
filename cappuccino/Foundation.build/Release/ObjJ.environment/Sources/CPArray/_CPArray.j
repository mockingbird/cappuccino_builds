@STATIC;1.0;i;14;CPEnumerator.ji;13;CPException.ji;10;CPObject.ji;9;CPRange.ji;18;CPSortDescriptor.jt;28722;objj_executeFile("CPEnumerator.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRange.j", YES);objj_executeFile("CPSortDescriptor.j", YES);CPEnumerationNormal = 0;
CPEnumerationConcurrent = 1 << 0;
CPEnumerationReverse = 1 << 1;
CPBinarySearchingFirstEqual = 1 << 8;
CPBinarySearchingLastEqual = 1 << 9;
CPBinarySearchingInsertionIndex = 1 << 10;
var CPArrayMaxDescriptionRecursion = 10;
var concat = Array.prototype.concat,
    join = Array.prototype.join,
    push = Array.prototype.push;
{var the_class = objj_allocateClassPair(CPObject, "CPArray"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPArray__init(self, _cmd)
{
    if (self === _CPSharedPlaceholderArray)
    {
        arguments[0] = (_CPJavaScriptArray == null ? null : _CPJavaScriptArray.isa.objj_msgSend0(_CPJavaScriptArray, "alloc"));
        return objj_msgSend.apply(this, arguments);
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "init");
}
,["id"]), new objj_method(sel_getUid("initWithArray:"), function $CPArray__initWithArray_(self, _cmd, anArray)
{
    if (self === _CPSharedPlaceholderArray)
    {
        arguments[0] = (_CPJavaScriptArray == null ? null : _CPJavaScriptArray.isa.objj_msgSend0(_CPJavaScriptArray, "alloc"));
        return objj_msgSend.apply(this, arguments);
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "init");
}
,["id","CPArray"]), new objj_method(sel_getUid("initWithArray:copyItems:"), function $CPArray__initWithArray_copyItems_(self, _cmd, anArray, shouldCopyItems)
{
    if (self === _CPSharedPlaceholderArray)
    {
        arguments[0] = (_CPJavaScriptArray == null ? null : _CPJavaScriptArray.isa.objj_msgSend0(_CPJavaScriptArray, "alloc"));
        return objj_msgSend.apply(this, arguments);
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "init");
}
,["id","CPArray","BOOL"]), new objj_method(sel_getUid("initWithObjects:"), function $CPArray__initWithObjects_(self, _cmd, anObject)
{
    if (self === _CPSharedPlaceholderArray)
    {
        arguments[0] = (_CPJavaScriptArray == null ? null : _CPJavaScriptArray.isa.objj_msgSend0(_CPJavaScriptArray, "alloc"));
        return objj_msgSend.apply(this, arguments);
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "init");
}
,["id","id"]), new objj_method(sel_getUid("initWithObjects:count:"), function $CPArray__initWithObjects_count_(self, _cmd, objects, aCount)
{
    if (self === _CPSharedPlaceholderArray)
    {
        arguments[0] = (_CPJavaScriptArray == null ? null : _CPJavaScriptArray.isa.objj_msgSend0(_CPJavaScriptArray, "alloc"));
        return objj_msgSend.apply(this, arguments);
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "init");
}
,["id","CPArray","CPUInteger"]), new objj_method(sel_getUid("initWithCapacity:"), function $CPArray__initWithCapacity_(self, _cmd, aCapacity)
{
    if (self === _CPSharedPlaceholderArray)
    {
        arguments[0] = (_CPJavaScriptArray == null ? null : _CPJavaScriptArray.isa.objj_msgSend0(_CPJavaScriptArray, "alloc"));
        return objj_msgSend.apply(this, arguments);
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArray").super_class }, "init");
}
,["id","CPUInteger"]), new objj_method(sel_getUid("containsObject:"), function $CPArray__containsObject_(self, _cmd, anObject)
{
    return self.isa.objj_msgSend1(self, "indexOfObject:", anObject) !== CPNotFound;
}
,["BOOL","id"]), new objj_method(sel_getUid("containsObjectIdenticalTo:"), function $CPArray__containsObjectIdenticalTo_(self, _cmd, anObject)
{
    return self.isa.objj_msgSend1(self, "indexOfObjectIdenticalTo:", anObject) !== CPNotFound;
}
,["BOOL","id"]), new objj_method(sel_getUid("count"), function $CPArray__count(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["CPUInteger"]), new objj_method(sel_getUid("firstObject"), function $CPArray__firstObject(self, _cmd)
{
    var count = self.isa.objj_msgSend0(self, "count");
    if (count > 0)
        return self.isa.objj_msgSend1(self, "objectAtIndex:", 0);
    return nil;
}
,["id"]), new objj_method(sel_getUid("lastObject"), function $CPArray__lastObject(self, _cmd)
{
    var count = self.isa.objj_msgSend0(self, "count");
    if (count <= 0)
        return nil;
    return self.isa.objj_msgSend1(self, "objectAtIndex:", count - 1);
}
,["id"]), new objj_method(sel_getUid("objectAtIndex:"), function $CPArray__objectAtIndex_(self, _cmd, anIndex)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["id","CPUInteger"]), new objj_method(sel_getUid("objectsAtIndexes:"), function $CPArray__objectsAtIndexes_(self, _cmd, indexes)
{
    var index = CPNotFound,
        objects = [];
    while ((index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", index))) !== CPNotFound)
        objects.push(self.isa.objj_msgSend1(self, "objectAtIndex:", index));
    return objects;
}
,["CPArray","CPIndexSet"]), new objj_method(sel_getUid("objectEnumerator"), function $CPArray__objectEnumerator(self, _cmd)
{
    return ((___r1 = (_CPArrayEnumerator == null ? null : _CPArrayEnumerator.isa.objj_msgSend0(_CPArrayEnumerator, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithArray:", self));
    var ___r1;
}
,["CPEnumerator"]), new objj_method(sel_getUid("reverseObjectEnumerator"), function $CPArray__reverseObjectEnumerator(self, _cmd)
{
    return ((___r1 = (_CPReverseArrayEnumerator == null ? null : _CPReverseArrayEnumerator.isa.objj_msgSend0(_CPReverseArrayEnumerator, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithArray:", self));
    var ___r1;
}
,["CPEnumerator"]), new objj_method(sel_getUid("indexOfObject:"), function $CPArray__indexOfObject_(self, _cmd, anObject)
{
    return self.isa.objj_msgSend2(self, "indexOfObject:inRange:", anObject, nil);
}
,["CPUInteger","id"]), new objj_method(sel_getUid("indexOfObject:inRange:"), function $CPArray__indexOfObject_inRange_(self, _cmd, anObject, aRange)
{
    if (anObject && anObject.isa)
    {
        var index = aRange ? aRange.location : 0,
            count = aRange ? CPMaxRange(aRange) : self.isa.objj_msgSend0(self, "count");
        for (; index < count; ++index)
            if (((___r1 = self.isa.objj_msgSend1(self, "objectAtIndex:", index)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", anObject)))
                return index;
        return CPNotFound;
    }
    return self.isa.objj_msgSend2(self, "indexOfObjectIdenticalTo:inRange:", anObject, aRange);
    var ___r1;
}
,["CPUInteger","id","CPRange"]), new objj_method(sel_getUid("indexOfObjectIdenticalTo:"), function $CPArray__indexOfObjectIdenticalTo_(self, _cmd, anObject)
{
    return self.isa.objj_msgSend2(self, "indexOfObjectIdenticalTo:inRange:", anObject, nil);
}
,["CPUInteger","id"]), new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"), function $CPArray__indexOfObjectIdenticalTo_inRange_(self, _cmd, anObject, aRange)
{
    var index = aRange ? aRange.location : 0,
        count = aRange ? CPMaxRange(aRange) : self.isa.objj_msgSend0(self, "count");
    for (; index < count; ++index)
        if (self.isa.objj_msgSend1(self, "objectAtIndex:", index) === anObject)
            return index;
    return CPNotFound;
}
,["CPUInteger","id","CPRange"]), new objj_method(sel_getUid("indexOfObjectPassingTest:"), function $CPArray__indexOfObjectPassingTest_(self, _cmd, aPredicate)
{
    return self.isa.objj_msgSend3(self, "indexOfObjectWithOptions:passingTest:context:", CPEnumerationNormal, aPredicate, undefined);
}
,["unsigned","Function"]), new objj_method(sel_getUid("indexOfObjectPassingTest:context:"), function $CPArray__indexOfObjectPassingTest_context_(self, _cmd, aPredicate, aContext)
{
    return self.isa.objj_msgSend3(self, "indexOfObjectWithOptions:passingTest:context:", CPEnumerationNormal, aPredicate, aContext);
}
,["unsigned","Function","id"]), new objj_method(sel_getUid("indexOfObjectWithOptions:passingTest:"), function $CPArray__indexOfObjectWithOptions_passingTest_(self, _cmd, options, aPredicate)
{
    return self.isa.objj_msgSend3(self, "indexOfObjectWithOptions:passingTest:context:", options, aPredicate, undefined);
}
,["unsigned","CPEnumerationOptions","Function"]), new objj_method(sel_getUid("indexOfObjectWithOptions:passingTest:context:"), function $CPArray__indexOfObjectWithOptions_passingTest_context_(self, _cmd, options, aPredicate, aContext)
{
    if (options & CPEnumerationReverse)
    {
        var index = self.isa.objj_msgSend0(self, "count") - 1,
            stop = -1,
            increment = -1;
    }
    else
    {
        var index = 0,
            stop = self.isa.objj_msgSend0(self, "count"),
            increment = 1;
    }
    for (; index !== stop; index += increment)
        if (aPredicate(self.isa.objj_msgSend1(self, "objectAtIndex:", index), index, aContext))
            return index;
    return CPNotFound;
}
,["unsigned","CPEnumerationOptions","Function","id"]), new objj_method(sel_getUid("indexOfObject:inSortedRange:options:usingComparator:"), function $CPArray__indexOfObject_inSortedRange_options_usingComparator_(self, _cmd, anObject, aRange, options, aComparator)
{
    if (!aComparator)
        _CPRaiseInvalidArgumentException(self, _cmd, "comparator is nil");
    if (options & CPBinarySearchingFirstEqual && options & CPBinarySearchingLastEqual)
        _CPRaiseInvalidArgumentException(self, _cmd, "both CPBinarySearchingFirstEqual and CPBinarySearchingLastEqual options cannot be specified");
    var count = self.isa.objj_msgSend0(self, "count");
    if (count <= 0)
        return options & CPBinarySearchingInsertionIndex ? 0 : CPNotFound;
    var first = aRange ? aRange.location : 0,
        last = (aRange ? CPMaxRange(aRange) : self.isa.objj_msgSend0(self, "count")) - 1;
    if (first < 0)
        _CPRaiseRangeException(self, _cmd, first, count);
    if (last >= count)
        _CPRaiseRangeException(self, _cmd, last, count);
    while (first <= last)
    {
        var middle = FLOOR((first + last) / 2),
            result = aComparator(anObject, self.isa.objj_msgSend1(self, "objectAtIndex:", middle));
        if (result > 0)
            first = middle + 1;
        else if (result < 0)
            last = middle - 1;
        else
        {
            if (options & CPBinarySearchingFirstEqual)
                while (middle > first && aComparator(anObject, self.isa.objj_msgSend1(self, "objectAtIndex:", middle - 1)) === CPOrderedSame)
                    --middle;
            else if (options & CPBinarySearchingLastEqual)
            {
                while (middle < last && aComparator(anObject, self.isa.objj_msgSend1(self, "objectAtIndex:", middle + 1)) === CPOrderedSame)
                    ++middle;
                if (options & CPBinarySearchingInsertionIndex)
                    ++middle;
            }
            return middle;
        }
    }
    if (options & CPBinarySearchingInsertionIndex)
        return MAX(first, 0);
    return CPNotFound;
}
,["CPUInteger","id","CPRange","CPBinarySearchingOptions","Function"]), new objj_method(sel_getUid("indexesOfObjectsPassingTest:"), function $CPArray__indexesOfObjectsPassingTest_(self, _cmd, aPredicate)
{
    return self.isa.objj_msgSend3(self, "indexesOfObjectsWithOptions:passingTest:context:", CPEnumerationNormal, aPredicate, undefined);
}
,["CPIndexSet","Function"]), new objj_method(sel_getUid("indexesOfObjectsPassingTest:context:"), function $CPArray__indexesOfObjectsPassingTest_context_(self, _cmd, aPredicate, aContext)
{
    return self.isa.objj_msgSend3(self, "indexesOfObjectsWithOptions:passingTest:context:", CPEnumerationNormal, aPredicate, aContext);
}
,["CPIndexSet","Function","id"]), new objj_method(sel_getUid("indexesOfObjectsWithOptions:passingTest:"), function $CPArray__indexesOfObjectsWithOptions_passingTest_(self, _cmd, options, aPredicate)
{
    return self.isa.objj_msgSend3(self, "indexesOfObjectsWithOptions:passingTest:context:", options, aPredicate, undefined);
}
,["CPIndexSet","CPEnumerationOptions","Function"]), new objj_method(sel_getUid("indexesOfObjectsWithOptions:passingTest:context:"), function $CPArray__indexesOfObjectsWithOptions_passingTest_context_(self, _cmd, options, aPredicate, aContext)
{
    if (options & CPEnumerationReverse)
    {
        var index = self.isa.objj_msgSend0(self, "count") - 1,
            stop = -1,
            increment = -1;
    }
    else
    {
        var index = 0,
            stop = self.isa.objj_msgSend0(self, "count"),
            increment = 1;
    }
    var indexes = (CPIndexSet == null ? null : CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"));
    for (; index !== stop; index += increment)
        if (aPredicate(self.isa.objj_msgSend1(self, "objectAtIndex:", index), index, aContext))
            (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "addIndex:", index));
    return indexes;
}
,["CPIndexSet","CPEnumerationOptions","Function","id"]), new objj_method(sel_getUid("makeObjectsPerformSelector:"), function $CPArray__makeObjectsPerformSelector_(self, _cmd, aSelector)
{
    self.isa.objj_msgSend2(self, "makeObjectsPerformSelector:withObjects:", aSelector, nil);
}
,["void","SEL"]), new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"), function $CPArray__makeObjectsPerformSelector_withObject_(self, _cmd, aSelector, anObject)
{
    return self.isa.objj_msgSend2(self, "makeObjectsPerformSelector:withObjects:", aSelector, [anObject]);
}
,["void","SEL","id"]), new objj_method(sel_getUid("makeObjectsPerformSelector:withObjects:"), function $CPArray__makeObjectsPerformSelector_withObjects_(self, _cmd, aSelector, objects)
{
    if (!aSelector)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "makeObjectsPerformSelector:withObjects: 'aSelector' can't be nil");
    var index = 0,
        count = self.isa.objj_msgSend0(self, "count");
    if ((objects == null ? null : objects.isa.objj_msgSend0(objects, "count")))
    {
        var argumentsArray = ((___r1 = [nil, aSelector]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "arrayByAddingObjectsFromArray:", objects));
        for (; index < count; ++index)
        {
            argumentsArray[0] = self.isa.objj_msgSend1(self, "objectAtIndex:", index);
            objj_msgSend.apply(this, argumentsArray);
        }
    }
    else
    {
        var anIsa = self.isa;
        for (; index < count; ++index)
            anIsa.objj_msgSend0(self.isa.objj_msgSend1(self, "objectAtIndex:", index), aSelector);
    }
    var ___r1;
}
,["void","SEL","CPArray"]), new objj_method(sel_getUid("enumerateObjectsUsingBlock:"), function $CPArray__enumerateObjectsUsingBlock_(self, _cmd, aFunction)
{
    var index = 0,
        count = self.isa.objj_msgSend0(self, "count"),
        shouldStop = NO,
        shouldStopRef = function(__input) { if (arguments.length) return shouldStop = __input; return shouldStop; };
    for (; index < count; ++index)
    {
        aFunction(self.isa.objj_msgSend1(self, "objectAtIndex:", index), index, shouldStopRef);
        if (shouldStop)
            return;
    }
}
,["void","Function"]), new objj_method(sel_getUid("enumerateObjectsWithOptions:usingBlock:"), function $CPArray__enumerateObjectsWithOptions_usingBlock_(self, _cmd, options, aFunction)
{
    if (options & CPEnumerationReverse)
    {
        var index = self.isa.objj_msgSend0(self, "count") - 1,
            stop = -1,
            increment = -1;
    }
    else
    {
        var index = 0,
            stop = self.isa.objj_msgSend0(self, "count"),
            increment = 1;
    }
    var shouldStop = NO,
        shouldStopRef = function(__input) { if (arguments.length) return shouldStop = __input; return shouldStop; };
    for (; index !== stop; index += increment)
    {
        aFunction(self.isa.objj_msgSend1(self, "objectAtIndex:", index), index, shouldStopRef);
        if (shouldStop)
            return;
    }
}
,["void","CPEnumerationOptions","Function"]), new objj_method(sel_getUid("firstObjectCommonWithArray:"), function $CPArray__firstObjectCommonWithArray_(self, _cmd, anArray)
{
    var count = self.isa.objj_msgSend0(self, "count");
    if (!(anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "count")) || !count)
        return nil;
    var index = 0;
    for (; index < count; ++index)
    {
        var object = self.isa.objj_msgSend1(self, "objectAtIndex:", index);
        if ((anArray == null ? null : anArray.isa.objj_msgSend1(anArray, "containsObject:", object)))
            return object;
    }
    return nil;
}
,["id","CPArray"]), new objj_method(sel_getUid("isEqualToArray:"), function $CPArray__isEqualToArray_(self, _cmd, anArray)
{
    if (self === anArray)
        return YES;
    if (!(anArray == null ? null : anArray.isa.objj_msgSend1(anArray, "isKindOfClass:", CPArray)))
        return NO;
    var count = self.isa.objj_msgSend0(self, "count"),
        otherCount = (anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "count"));
    if (anArray === nil || count !== otherCount)
        return NO;
    var index = 0;
    for (; index < count; ++index)
    {
        var lhs = self.isa.objj_msgSend1(self, "objectAtIndex:", index),
            rhs = (anArray == null ? null : anArray.isa.objj_msgSend1(anArray, "objectAtIndex:", index));
        if (lhs !== rhs && (lhs && !lhs.isa || rhs && !rhs.isa || !(lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "isEqual:", rhs))))
            return NO;
    }
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("isEqual:"), function $CPArray__isEqual_(self, _cmd, anObject)
{
    return self === anObject || self.isa.objj_msgSend1(self, "isEqualToArray:", anObject);
}
,["BOOL","id"]), new objj_method(sel_getUid("_javaScriptArrayCopy"), function $CPArray___javaScriptArrayCopy(self, _cmd)
{
    var index = 0,
        count = self.isa.objj_msgSend0(self, "count"),
        copy = [];
    for (; index < count; ++index)
        push.call(copy, self.isa.objj_msgSend1(self, "objectAtIndex:", index));
    return copy;
}
,["Array"]), new objj_method(sel_getUid("arrayByAddingObject:"), function $CPArray__arrayByAddingObject_(self, _cmd, anObject)
{
    var argumentArray = self.isa.objj_msgSend0(self, "_javaScriptArrayCopy");
    push.call(argumentArray, anObject);
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "arrayWithArray:", argumentArray));
    var ___r1;
}
,["CPArray","id"]), new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"), function $CPArray__arrayByAddingObjectsFromArray_(self, _cmd, anArray)
{
    if (!anArray)
        return self.isa.objj_msgSend0(self, "copy");
    var anArray = anArray.isa === _CPJavaScriptArray ? anArray : (anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "_javaScriptArrayCopy")),
        argumentArray = concat.call(self.isa.objj_msgSend0(self, "_javaScriptArrayCopy"), anArray);
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "arrayWithArray:", argumentArray));
    var ___r1;
}
,["CPArray","CPArray"]), new objj_method(sel_getUid("subarrayWithRange:"), function $CPArray__subarrayWithRange_(self, _cmd, aRange)
{
    if (!aRange)
        return self.isa.objj_msgSend0(self, "copy");
    if (aRange.location < 0 || CPMaxRange(aRange) > self.length)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "subarrayWithRange: aRange out of bounds");
    var index = aRange.location,
        count = CPMaxRange(aRange),
        argumentArray = [];
    for (; index < count; ++index)
        push.call(argumentArray, self.isa.objj_msgSend1(self, "objectAtIndex:", index));
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "arrayWithArray:", argumentArray));
    var ___r1;
}
,["CPArray","CPRange"]), new objj_method(sel_getUid("sortedArrayUsingDescriptors:"), function $CPArray__sortedArrayUsingDescriptors_(self, _cmd, descriptors)
{
    var sorted = self.isa.objj_msgSend0(self, "copy");
    (sorted == null ? null : sorted.isa.objj_msgSend1(sorted, "sortUsingDescriptors:", descriptors));
    return sorted;
}
,["CPArray","CPArray"]), new objj_method(sel_getUid("sortedArrayUsingFunction:"), function $CPArray__sortedArrayUsingFunction_(self, _cmd, aFunction)
{
    return self.isa.objj_msgSend2(self, "sortedArrayUsingFunction:context:", aFunction, nil);
}
,["CPArray","Function"]), new objj_method(sel_getUid("sortedArrayUsingFunction:context:"), function $CPArray__sortedArrayUsingFunction_context_(self, _cmd, aFunction, aContext)
{
    var sorted = self.isa.objj_msgSend0(self, "copy");
    (sorted == null ? null : sorted.isa.objj_msgSend2(sorted, "sortUsingFunction:context:", aFunction, aContext));
    return sorted;
}
,["CPArray","Function","id"]), new objj_method(sel_getUid("sortedArrayUsingSelector:"), function $CPArray__sortedArrayUsingSelector_(self, _cmd, aSelector)
{
    var sorted = self.isa.objj_msgSend0(self, "copy");
    (sorted == null ? null : sorted.isa.objj_msgSend1(sorted, "sortUsingSelector:", aSelector));
    return sorted;
}
,["CPArray","SEL"]), new objj_method(sel_getUid("componentsJoinedByString:"), function $CPArray__componentsJoinedByString_(self, _cmd, aString)
{
    return join.call(self.isa.objj_msgSend0(self, "_javaScriptArrayCopy"), aString);
}
,["CPString","CPString"]), new objj_method(sel_getUid("description"), function $CPArray__description(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "_descriptionWithMaximumDepth:", CPArrayMaxDescriptionRecursion);
}
,["CPString"]), new objj_method(sel_getUid("_descriptionWithMaximumDepth:"), function $CPArray___descriptionWithMaximumDepth_(self, _cmd, maximumDepth)
{
    var index = 0,
        count = self.isa.objj_msgSend0(self, "count"),
        description = "@[";
    for (; index < count; ++index)
    {
        if (index === 0)
            description += "\n";
        var object = self.isa.objj_msgSend1(self, "objectAtIndex:", index);
        description += (CPDescriptionOfObject(object, maximumDepth)).replace(/^/mg, "    ");
        if (index < count - 1)
            description += ",\n";
        else
            description += "\n";
    }
    return description + "]";
}
,["CPString","int"]), new objj_method(sel_getUid("pathsMatchingExtensions:"), function $CPArray__pathsMatchingExtensions_(self, _cmd, filterTypes)
{
    var index = 0,
        count = self.isa.objj_msgSend0(self, "count"),
        array = [];
    for (; index < count; ++index)
        if (self[index].isa && ((___r1 = self[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPString.isa.objj_msgSend0(CPString, "class"))) && (filterTypes == null ? null : filterTypes.isa.objj_msgSend1(filterTypes, "containsObject:", ((___r1 = self[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "pathExtension")))))
            array.push(self[index]);
    return array;
    var ___r1;
}
,["CPArray","CPArray"]), new objj_method(sel_getUid("copy"), function $CPArray__copy(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "arrayWithArray:", self));
    var ___r1;
}
,["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPArray__alloc(self, _cmd)
{
    if (self === CPArray || self === CPMutableArray)
        return (_CPPlaceholderArray == null ? null : _CPPlaceholderArray.isa.objj_msgSend0(_CPPlaceholderArray, "alloc"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPArray").super_class }, "alloc");
}
,["id"]), new objj_method(sel_getUid("array"), function $CPArray__array(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("arrayWithArray:"), function $CPArray__arrayWithArray_(self, _cmd, anArray)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithArray:", anArray));
    var ___r1;
}
,["id","CPArray"]), new objj_method(sel_getUid("arrayWithObject:"), function $CPArray__arrayWithObject_(self, _cmd, anObject)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithObjects:", anObject));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("arrayWithObjects:"), function $CPArray__arrayWithObjects_(self, _cmd, anObject)
{
    arguments[0] = self.isa.objj_msgSend0(self, "alloc");
    arguments[1] = sel_getUid("initWithObjects:");
    return objj_msgSend.apply(this, arguments);
}
,["id","id"]), new objj_method(sel_getUid("arrayWithObjects:count:"), function $CPArray__arrayWithObjects_count_(self, _cmd, objects, aCount)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithObjects:count:", objects, aCount));
    var ___r1;
}
,["id","id","CPUInteger"])]);
}{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPArray__initWithCoder_(self, _cmd, aCoder)
{
    return (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "CP.objects"));
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPArray__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "_encodeArrayOfObjects:forKey:", self, "CP.objects"));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPEnumerator, "_CPArrayEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_array"), new objj_ivar("_index")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithArray:"), function $_CPArrayEnumerator__initWithArray_(self, _cmd, anArray)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPArrayEnumerator").super_class }, "init");
    if (self)
    {
        self._array = anArray;
        self._index = -1;
    }
    return self;
}
,["id","CPArray"]), new objj_method(sel_getUid("nextObject"), function $_CPArrayEnumerator__nextObject(self, _cmd)
{
    if (++self._index >= ((___r1 = self._array), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        return nil;
    return ((___r1 = self._array), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", self._index));
    var ___r1;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPEnumerator, "_CPReverseArrayEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_array"), new objj_ivar("_index")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithArray:"), function $_CPReverseArrayEnumerator__initWithArray_(self, _cmd, anArray)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPReverseArrayEnumerator").super_class }, "init");
    if (self)
    {
        self._array = anArray;
        self._index = ((___r1 = self._array), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    }
    return self;
    var ___r1;
}
,["id","CPArray"]), new objj_method(sel_getUid("nextObject"), function $_CPReverseArrayEnumerator__nextObject(self, _cmd)
{
    if (--self._index < 0)
        return nil;
    return ((___r1 = self._array), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", self._index));
    var ___r1;
}
,["id"])]);
}var _CPSharedPlaceholderArray = nil;
{var the_class = objj_allocateClassPair(CPArray, "_CPPlaceholderArray"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $_CPPlaceholderArray__alloc(self, _cmd)
{
    if (!_CPSharedPlaceholderArray)
        _CPSharedPlaceholderArray = objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("_CPPlaceholderArray").super_class }, "alloc");
    return _CPSharedPlaceholderArray;
}
,["id"])]);
}