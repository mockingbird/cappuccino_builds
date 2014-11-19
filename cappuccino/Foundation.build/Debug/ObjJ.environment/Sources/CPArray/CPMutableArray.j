@STATIC;1.0;i;10;_CPArray.jt;15953;objj_executeFile("_CPArray.j", YES);{var the_class = objj_allocateClassPair(CPArray, "CPMutableArray"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("addObject:"), function $CPMutableArray__addObject_(self, _cmd, anObject)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","id"]), new objj_method(sel_getUid("addObjectsFromArray:"), function $CPMutableArray__addObjectsFromArray_(self, _cmd, anArray)
{
    var index = 0,
        count = (anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "count"));
    for (; index < count; ++index)
        self.isa.objj_msgSend1(self, "addObject:", (anArray == null ? null : anArray.isa.objj_msgSend1(anArray, "objectAtIndex:", index)));
}
,["void","CPArray"]), new objj_method(sel_getUid("insertObject:atIndex:"), function $CPMutableArray__insertObject_atIndex_(self, _cmd, anObject, anIndex)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","id","CPUInteger"]), new objj_method(sel_getUid("insertObjects:atIndexes:"), function $CPMutableArray__insertObjects_atIndexes_(self, _cmd, objects, indexes)
{
    var indexesCount = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "count")),
        objectsCount = (objects == null ? null : objects.isa.objj_msgSend0(objects, "count"));
    if (indexesCount !== objectsCount)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "the counts of the passed-in array (" + objectsCount + ") and index set (" + indexesCount + ") must be identical.");
    var lastIndex = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "lastIndex"));
    if (lastIndex >= self.isa.objj_msgSend0(self, "count") + indexesCount)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "the last index (" + lastIndex + ") must be less than the sum of the original count (" + self.isa.objj_msgSend0(self, "count") + ") and the insertion count (" + indexesCount + ").");
    var index = 0,
        currentIndex = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "firstIndex"));
    for (; index < objectsCount; (++index, currentIndex = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", currentIndex))))
        self.isa.objj_msgSend2(self, "insertObject:atIndex:", (objects == null ? null : objects.isa.objj_msgSend1(objects, "objectAtIndex:", index)), currentIndex);
}
,["void","CPArray","CPIndexSet"]), new objj_method(sel_getUid("insertObject:inArraySortedByDescriptors:"), function $CPMutableArray__insertObject_inArraySortedByDescriptors_(self, _cmd, anObject, descriptors)
{
    var index,
        count = (descriptors == null ? null : descriptors.isa.objj_msgSend0(descriptors, "count"));
    if (count)
        index = self.isa.objj_msgSend(self, "indexOfObject:inSortedRange:options:usingComparator:", anObject, nil, CPBinarySearchingInsertionIndex, function(lhs, rhs)
        {
            var index = 0,
                result = CPOrderedSame;
            while (index < count && (result = ((___r1 = (descriptors == null ? null : descriptors.isa.objj_msgSend1(descriptors, "objectAtIndex:", index))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "compareObject:withObject:", lhs, rhs))) === CPOrderedSame)
                ++index;
            return result;
            var ___r1;
        });
    else
        index = self.isa.objj_msgSend0(self, "count");
    self.isa.objj_msgSend2(self, "insertObject:atIndex:", anObject, index);
    return index;
}
,["CPUInteger","id","CPArray"]), new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"), function $CPMutableArray__replaceObjectAtIndex_withObject_(self, _cmd, anIndex, anObject)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","CPUInteger","id"]), new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"), function $CPMutableArray__replaceObjectsAtIndexes_withObjects_(self, _cmd, indexes, objects)
{
    var i = 0,
        index = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "firstIndex"));
    while (index !== CPNotFound)
    {
        self.isa.objj_msgSend2(self, "replaceObjectAtIndex:withObject:", index, (objects == null ? null : objects.isa.objj_msgSend1(objects, "objectAtIndex:", i++)));
        index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", index));
    }
}
,["void","CPIndexSet","CPArray"]), new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"), function $CPMutableArray__replaceObjectsInRange_withObjectsFromArray_range_(self, _cmd, aRange, anArray, otherRange)
{
    self.isa.objj_msgSend1(self, "removeObjectsInRange:", aRange);
    if (otherRange && (otherRange.location !== 0 || otherRange.length !== (anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "count"))))
        anArray = (anArray == null ? null : anArray.isa.objj_msgSend1(anArray, "subarrayWithRange:", otherRange));
    var indexes = (CPIndexSet == null ? null : CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(aRange.location, (anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "count")))));
    self.isa.objj_msgSend2(self, "insertObjects:atIndexes:", anArray, indexes);
}
,["void","CPRange","CPArray","CPRange"]), new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:"), function $CPMutableArray__replaceObjectsInRange_withObjectsFromArray_(self, _cmd, aRange, anArray)
{
    self.isa.objj_msgSend3(self, "replaceObjectsInRange:withObjectsFromArray:range:", aRange, anArray, nil);
}
,["void","CPRange","CPArray"]), new objj_method(sel_getUid("setArray:"), function $CPMutableArray__setArray_(self, _cmd, anArray)
{
    if (self === anArray)
        return;
    self.isa.objj_msgSend0(self, "removeAllObjects");
    self.isa.objj_msgSend1(self, "addObjectsFromArray:", anArray);
}
,["void","CPArray"]), new objj_method(sel_getUid("removeAllObjects"), function $CPMutableArray__removeAllObjects(self, _cmd)
{
    while (self.isa.objj_msgSend0(self, "count"))
        self.isa.objj_msgSend0(self, "removeLastObject");
}
,["void"]), new objj_method(sel_getUid("removeLastObject"), function $CPMutableArray__removeLastObject(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void"]), new objj_method(sel_getUid("removeObject:"), function $CPMutableArray__removeObject_(self, _cmd, anObject)
{
    self.isa.objj_msgSend2(self, "removeObject:inRange:", anObject, CPMakeRange(0, self.isa.objj_msgSend0(self, "count")));
}
,["void","id"]), new objj_method(sel_getUid("removeObject:inRange:"), function $CPMutableArray__removeObject_inRange_(self, _cmd, anObject, aRange)
{
    var index;
    while ((index = self.isa.objj_msgSend2(self, "indexOfObject:inRange:", anObject, aRange)) != CPNotFound)
    {
        self.isa.objj_msgSend1(self, "removeObjectAtIndex:", index);
        aRange = CPIntersectionRange(CPMakeRange(index, self.isa.objj_msgSend0(self, "count") - index), aRange);
    }
}
,["void","id","CPRange"]), new objj_method(sel_getUid("removeObjectAtIndex:"), function $CPMutableArray__removeObjectAtIndex_(self, _cmd, anIndex)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","CPUInteger"]), new objj_method(sel_getUid("removeObjectsAtIndexes:"), function $CPMutableArray__removeObjectsAtIndexes_(self, _cmd, anIndexSet)
{
    var index = (anIndexSet == null ? null : anIndexSet.isa.objj_msgSend0(anIndexSet, "lastIndex"));
    while (index !== CPNotFound)
    {
        self.isa.objj_msgSend1(self, "removeObjectAtIndex:", index);
        index = (anIndexSet == null ? null : anIndexSet.isa.objj_msgSend1(anIndexSet, "indexLessThanIndex:", index));
    }
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("removeObjectIdenticalTo:"), function $CPMutableArray__removeObjectIdenticalTo_(self, _cmd, anObject)
{
    self.isa.objj_msgSend2(self, "removeObjectIdenticalTo:inRange:", anObject, CPMakeRange(0, self.isa.objj_msgSend0(self, "count")));
}
,["void","id"]), new objj_method(sel_getUid("removeObjectIdenticalTo:inRange:"), function $CPMutableArray__removeObjectIdenticalTo_inRange_(self, _cmd, anObject, aRange)
{
    var index,
        count = self.isa.objj_msgSend0(self, "count");
    while ((index = self.isa.objj_msgSend2(self, "indexOfObjectIdenticalTo:inRange:", anObject, aRange)) !== CPNotFound)
    {
        self.isa.objj_msgSend1(self, "removeObjectAtIndex:", index);
        aRange = CPIntersectionRange(CPMakeRange(index, --count - index), aRange);
    }
}
,["void","id","CPRange"]), new objj_method(sel_getUid("removeObjectsInArray:"), function $CPMutableArray__removeObjectsInArray_(self, _cmd, anArray)
{
    var index = 0,
        count = (anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "count"));
    for (; index < count; ++index)
        self.isa.objj_msgSend1(self, "removeObject:", (anArray == null ? null : anArray.isa.objj_msgSend1(anArray, "objectAtIndex:", index)));
}
,["void","CPArray"]), new objj_method(sel_getUid("removeObjectsInRange:"), function $CPMutableArray__removeObjectsInRange_(self, _cmd, aRange)
{
    var index = aRange.location,
        count = CPMaxRange(aRange);
    while (count-- > index)
        self.isa.objj_msgSend1(self, "removeObjectAtIndex:", index);
}
,["void","CPRange"]), new objj_method(sel_getUid("exchangeObjectAtIndex:withObjectAtIndex:"), function $CPMutableArray__exchangeObjectAtIndex_withObjectAtIndex_(self, _cmd, anIndex, otherIndex)
{
    if (anIndex === otherIndex)
        return;
    var temporary = self.isa.objj_msgSend1(self, "objectAtIndex:", anIndex);
    self.isa.objj_msgSend2(self, "replaceObjectAtIndex:withObject:", anIndex, self.isa.objj_msgSend1(self, "objectAtIndex:", otherIndex));
    self.isa.objj_msgSend2(self, "replaceObjectAtIndex:withObject:", otherIndex, temporary);
}
,["void","CPUInteger","CPUInteger"]), new objj_method(sel_getUid("sortUsingDescriptors:"), function $CPMutableArray__sortUsingDescriptors_(self, _cmd, descriptors)
{
    var i = (descriptors == null ? null : descriptors.isa.objj_msgSend0(descriptors, "count")),
        jsDescriptors = [];
    while (i--)
    {
        var d = (descriptors == null ? null : descriptors.isa.objj_msgSend1(descriptors, "objectAtIndex:", i));
        (jsDescriptors == null ? null : jsDescriptors.isa.objj_msgSend1(jsDescriptors, "addObject:", {"k": (d == null ? null : d.isa.objj_msgSend0(d, "key")), "a": (d == null ? null : d.isa.objj_msgSend0(d, "ascending")), "s": (d == null ? null : d.isa.objj_msgSend0(d, "selector"))}));
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
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithCapacity:", aCapacity));
    var ___r1;
}
,["CPArray","CPUInteger"])]);
}{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("mutableCopy"), function $CPArray__mutableCopy(self, _cmd)
{
    var r = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "new");
    (r == null ? null : r.isa.objj_msgSend1(r, "addObjectsFromArray:", self));
    return r;
}
,["id"])]);
}var selectorCompare = function(object1, object2, selector)
{
    return (object1 == null ? null : object1.isa.objj_msgSend2(object1, "performSelector:withObject:", selector, object2));
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
var CPMutableArrayNull = CPNull.isa.objj_msgSend0(CPNull, "null");
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
                    aUID = (A == null ? null : A.isa.objj_msgSend0(A, "UID"));
                C1 = c[aUID];
                if (!C1)
                {
                    C1 = {};
                    cn = dl;
                    do
                    {
                        key = d[cn].k;
                        C1[key] = (A == null ? null : A.isa.objj_msgSend1(A, "valueForKeyPath:", key));
                    }
                    while (cn--);
                    c[aUID] = C1;
                }
                bUID = B[i]._UID;
                if (!bUID)
                    bUID = ((___r1 = B[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"));
                C2 = c[bUID];
                if (!C2)
                {
                    C2 = {};
                    cn = dl;
                    do
                    {
                        key = d[cn].k;
                        C2[key] = ((___r1 = B[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", key));
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
                        o = value2 === nil || value2 === cpNull ? CPOrderedDescending : value1.isa.objj_msgSend1(value1, dd.s, value2);
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
    var ___r1;
};
