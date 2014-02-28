@STATIC;1.0;i;10;_CPArray.jt;14051;objj_executeFile("_CPArray.j", YES);{var the_class = objj_allocateClassPair(CPArray, "CPMutableArray"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("addObject:"), function $CPMutableArray__addObject_(self, _cmd, anObject)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","id"]), new objj_method(sel_getUid("addObjectsFromArray:"), function $CPMutableArray__addObjectsFromArray_(self, _cmd, anArray)
{
    var index = 0,
        count = objj_msgSend(anArray, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "addObject:", objj_msgSend(anArray, "objectAtIndex:", index));
}
,["void","CPArray"]), new objj_method(sel_getUid("insertObject:atIndex:"), function $CPMutableArray__insertObject_atIndex_(self, _cmd, anObject, anIndex)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","id","CPUInteger"]), new objj_method(sel_getUid("insertObjects:atIndexes:"), function $CPMutableArray__insertObjects_atIndexes_(self, _cmd, objects, indexes)
{
    var indexesCount = objj_msgSend(indexes, "count"),
        objectsCount = objj_msgSend(objects, "count");
    if (indexesCount !== objectsCount)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "the counts of the passed-in array (" + objectsCount + ") and index set (" + indexesCount + ") must be identical.");
    var lastIndex = objj_msgSend(indexes, "lastIndex");
    if (lastIndex >= objj_msgSend(self, "count") + indexesCount)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "the last index (" + lastIndex + ") must be less than the sum of the original count (" + objj_msgSend(self, "count") + ") and the insertion count (" + indexesCount + ").");
    var index = 0,
        currentIndex = objj_msgSend(indexes, "firstIndex");
    for (; index < objectsCount; (++index, currentIndex = objj_msgSend(indexes, "indexGreaterThanIndex:", currentIndex)))
        objj_msgSend(self, "insertObject:atIndex:", objj_msgSend(objects, "objectAtIndex:", index), currentIndex);
}
,["void","CPArray","CPIndexSet"]), new objj_method(sel_getUid("insertObject:inArraySortedByDescriptors:"), function $CPMutableArray__insertObject_inArraySortedByDescriptors_(self, _cmd, anObject, descriptors)
{
    var index,
        count = objj_msgSend(descriptors, "count");
    if (count)
        index = objj_msgSend(self, "indexOfObject:inSortedRange:options:usingComparator:", anObject, nil, CPBinarySearchingInsertionIndex, function(lhs, rhs)
        {
            var index = 0,
                result = CPOrderedSame;
            while (index < count && (result = objj_msgSend(objj_msgSend(descriptors, "objectAtIndex:", index), "compareObject:withObject:", lhs, rhs)) === CPOrderedSame)
                ++index;
            return result;
        });
    else
        index = objj_msgSend(self, "count");
    objj_msgSend(self, "insertObject:atIndex:", anObject, index);
    return index;
}
,["CPUInteger","id","CPArray"]), new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"), function $CPMutableArray__replaceObjectAtIndex_withObject_(self, _cmd, anIndex, anObject)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","CPUInteger","id"]), new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"), function $CPMutableArray__replaceObjectsAtIndexes_withObjects_(self, _cmd, indexes, objects)
{
    var i = 0,
        index = objj_msgSend(indexes, "firstIndex");
    while (index !== CPNotFound)
    {
        objj_msgSend(self, "replaceObjectAtIndex:withObject:", index, objj_msgSend(objects, "objectAtIndex:", i++));
        index = objj_msgSend(indexes, "indexGreaterThanIndex:", index);
    }
}
,["void","CPIndexSet","CPArray"]), new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"), function $CPMutableArray__replaceObjectsInRange_withObjectsFromArray_range_(self, _cmd, aRange, anArray, otherRange)
{
    objj_msgSend(self, "removeObjectsInRange:", aRange);
    if (otherRange && (otherRange.location !== 0 || otherRange.length !== objj_msgSend(anArray, "count")))
        anArray = objj_msgSend(anArray, "subarrayWithRange:", otherRange);
    var indexes = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(aRange.location, objj_msgSend(anArray, "count")));
    objj_msgSend(self, "insertObjects:atIndexes:", anArray, indexes);
}
,["void","CPRange","CPArray","CPRange"]), new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:"), function $CPMutableArray__replaceObjectsInRange_withObjectsFromArray_(self, _cmd, aRange, anArray)
{
    objj_msgSend(self, "replaceObjectsInRange:withObjectsFromArray:range:", aRange, anArray, nil);
}
,["void","CPRange","CPArray"]), new objj_method(sel_getUid("setArray:"), function $CPMutableArray__setArray_(self, _cmd, anArray)
{
    if (self === anArray)
        return;
    objj_msgSend(self, "removeAllObjects");
    objj_msgSend(self, "addObjectsFromArray:", anArray);
}
,["void","CPArray"]), new objj_method(sel_getUid("removeAllObjects"), function $CPMutableArray__removeAllObjects(self, _cmd)
{
    while (objj_msgSend(self, "count"))
        objj_msgSend(self, "removeLastObject");
}
,["void"]), new objj_method(sel_getUid("removeLastObject"), function $CPMutableArray__removeLastObject(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void"]), new objj_method(sel_getUid("removeObject:"), function $CPMutableArray__removeObject_(self, _cmd, anObject)
{
    objj_msgSend(self, "removeObject:inRange:", anObject, CPMakeRange(0, objj_msgSend(self, "count")));
}
,["void","id"]), new objj_method(sel_getUid("removeObject:inRange:"), function $CPMutableArray__removeObject_inRange_(self, _cmd, anObject, aRange)
{
    var index;
    while ((index = objj_msgSend(self, "indexOfObject:inRange:", anObject, aRange)) != CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        aRange = CPIntersectionRange(CPMakeRange(index, objj_msgSend(self, "count") - index), aRange);
    }
}
,["void","id","CPRange"]), new objj_method(sel_getUid("removeObjectAtIndex:"), function $CPMutableArray__removeObjectAtIndex_(self, _cmd, anIndex)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","CPUInteger"]), new objj_method(sel_getUid("removeObjectsAtIndexes:"), function $CPMutableArray__removeObjectsAtIndexes_(self, _cmd, anIndexSet)
{
    var index = objj_msgSend(anIndexSet, "lastIndex");
    while (index !== CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        index = objj_msgSend(anIndexSet, "indexLessThanIndex:", index);
    }
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("removeObjectIdenticalTo:"), function $CPMutableArray__removeObjectIdenticalTo_(self, _cmd, anObject)
{
    objj_msgSend(self, "removeObjectIdenticalTo:inRange:", anObject, CPMakeRange(0, objj_msgSend(self, "count")));
}
,["void","id"]), new objj_method(sel_getUid("removeObjectIdenticalTo:inRange:"), function $CPMutableArray__removeObjectIdenticalTo_inRange_(self, _cmd, anObject, aRange)
{
    var index,
        count = objj_msgSend(self, "count");
    while ((index = objj_msgSend(self, "indexOfObjectIdenticalTo:inRange:", anObject, aRange)) !== CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        aRange = CPIntersectionRange(CPMakeRange(index, --count - index), aRange);
    }
}
,["void","id","CPRange"]), new objj_method(sel_getUid("removeObjectsInArray:"), function $CPMutableArray__removeObjectsInArray_(self, _cmd, anArray)
{
    var index = 0,
        count = objj_msgSend(anArray, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "removeObject:", objj_msgSend(anArray, "objectAtIndex:", index));
}
,["void","CPArray"]), new objj_method(sel_getUid("removeObjectsInRange:"), function $CPMutableArray__removeObjectsInRange_(self, _cmd, aRange)
{
    var index = aRange.location,
        count = CPMaxRange(aRange);
    while (count-- > index)
        objj_msgSend(self, "removeObjectAtIndex:", index);
}
,["void","CPRange"]), new objj_method(sel_getUid("exchangeObjectAtIndex:withObjectAtIndex:"), function $CPMutableArray__exchangeObjectAtIndex_withObjectAtIndex_(self, _cmd, anIndex, otherIndex)
{
    if (anIndex === otherIndex)
        return;
    var temporary = objj_msgSend(self, "objectAtIndex:", anIndex);
    objj_msgSend(self, "replaceObjectAtIndex:withObject:", anIndex, objj_msgSend(self, "objectAtIndex:", otherIndex));
    objj_msgSend(self, "replaceObjectAtIndex:withObject:", otherIndex, temporary);
}
,["void","CPUInteger","CPUInteger"]), new objj_method(sel_getUid("sortUsingDescriptors:"), function $CPMutableArray__sortUsingDescriptors_(self, _cmd, descriptors)
{
    var i = objj_msgSend(descriptors, "count"),
        jsDescriptors = [];
    while (i--)
    {
        var d = objj_msgSend(descriptors, "objectAtIndex:", i);
        objj_msgSend(jsDescriptors, "addObject:", {"k": objj_msgSend(d, "key"), "a": objj_msgSend(d, "ascending"), "s": objj_msgSend(d, "selector")});
    }
    sortArrayUsingJSDescriptors(self, jsDescriptors);
}
,["void","CPArray"]), new objj_method(sel_getUid("sortUsingFunction:context:"), function $CPMutableArray__sortUsingFunction_context_(self, _cmd, aFunction, aContext)
{
    sortArrayUsingFunction(self, aFunction, aContext);
}
,["void","Function","id"]), new objj_method(sel_getUid("sortUsingSelector:"), function $CPMutableArray__sortUsingSelector_(self, _cmd, aSelector)
{
    sortArrayUsingFunction(self, selectorCompare, aSelector);
}
,["void","SEL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("arrayWithCapacity:"), function $CPMutableArray__arrayWithCapacity_(self, _cmd, aCapacity)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithCapacity:", aCapacity);
}
,["CPArray","CPUInteger"])]);
}{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("mutableCopy"), function $CPArray__mutableCopy(self, _cmd)
{
    var r = objj_msgSend(CPMutableArray, "new");
    objj_msgSend(r, "addObjectsFromArray:", self);
    return r;
}
,["id"])]);
}var selectorCompare = function(object1, object2, selector)
{
    return objj_msgSend(object1, "performSelector:withObject:", selector, object2);
};
var sortArrayUsingFunction = function(array, aFunction, aContext)
{
    var h,
        i,
        j,
        k,
        l,
        m,
        n = array.length,
        o;
    var A,
        B = [];
    for (h = 1; h < n; h += h)
    {
        for (m = n - 1 - h; m >= 0; m -= h + h)
        {
            l = m - h + 1;
            if (l < 0)
                l = 0;
            for ((i = 0, j = l); j <= m; (i++, j++))
                B[i] = array[j];
            for ((i = 0, k = l); k < j && j <= m + h; k++)
            {
                A = array[j];
                o = aFunction(A, B[i], aContext);
                if (o >= 0)
                    array[k] = B[i++];
                else
                {
                    array[k] = A;
                    j++;
                }
            }
            while (k < j)
                array[k++] = B[i++];
        }
    }
};
var CPMutableArrayNull = objj_msgSend(CPNull, "null");
var sortArrayUsingJSDescriptors = function(a, d)
{
    var h,
        i,
        j,
        k,
        l,
        m,
        n = a.length,
        dl = d.length - 1,
        o,
        c = {};
    var A,
        B = [],
        C1,
        C2,
        cn,
        aUID,
        bUID,
        key,
        dd,
        value1,
        value2,
        cpNull = CPMutableArrayNull;
    if (dl < 0)
        return;
    for (h = 1; h < n; h += h)
    {
        for (m = n - 1 - h; m >= 0; m -= h + h)
        {
            l = m - h + 1;
            if (l < 0)
                l = 0;
            for ((i = 0, j = l); j <= m; (i++, j++))
                B[i] = a[j];
            for ((i = 0, k = l); k < j && j <= m + h; k++)
            {
                A = a[j];
                aUID = A._UID;
                if (!aUID)
                    aUID = objj_msgSend(A, "UID");
                C1 = c[aUID];
                if (!C1)
                {
                    C1 = {};
                    cn = dl;
                    do
                    {
                        key = d[cn].k;
                        C1[key] = objj_msgSend(A, "valueForKeyPath:", key);
                    }
                    while (cn--);
                    c[aUID] = C1;
                }
                bUID = B[i]._UID;
                if (!bUID)
                    bUID = objj_msgSend(B[i], "UID");
                C2 = c[bUID];
                if (!C2)
                {
                    C2 = {};
                    cn = dl;
                    do
                    {
                        key = d[cn].k;
                        C2[key] = objj_msgSend(B[i], "valueForKeyPath:", key);
                    }
                    while (cn--);
                    c[bUID] = C2;
                }
                cn = dl;
                do
                {
                    dd = d[cn];
                    key = dd.k;
                    value1 = C1[key];
                    value2 = C2[key];
                    if (value1 === nil || value1 === cpNull)
                        o = value2 === nil || value2 === cpNull ? CPOrderedSame : CPOrderedAscending;
                    else
                        o = value2 === nil || value2 === cpNull ? CPOrderedDescending : objj_msgSend(value1, dd.s, value2);
                    if (o && !dd.a)
                        o = -o;
                }
                while (cn-- && o == CPOrderedSame);
                if (o >= 0)
                    a[k] = B[i++];
                else
                {
                    a[k] = A;
                    j++;
                }
            }
            while (k < j)
                a[k++] = B[i++];
        }
    }
};
