@STATIC;1.0;i;9;CPArray.ji;10;CPObject.ji;9;CPRange.jt;30106;objj_executeFile("CPArray.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRange.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPIndexSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_count"), new objj_ivar("_ranges")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPIndexSet__init(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "initWithIndexesInRange:", CPMakeRange(0, 0));
}
,["id"]), new objj_method(sel_getUid("initWithIndex:"), function $CPIndexSet__initWithIndex_(self, _cmd, anIndex)
{
    if (!(!isNaN(parseFloat(anIndex)) && isFinite(anIndex)))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid index");
    return self.isa.objj_msgSend1(self, "initWithIndexesInRange:", CPMakeRange(anIndex, 1));
}
,["id","CPInteger"]), new objj_method(sel_getUid("initWithIndexesInRange:"), function $CPIndexSet__initWithIndexesInRange_(self, _cmd, aRange)
{
    if (aRange.location < 0)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Range " + CPStringFromRange(aRange) + " is out of bounds.");
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexSet").super_class }, "init");
    if (self)
    {
        self._count = MAX(0, aRange.length);
        if (self._count > 0)
            self._ranges = [aRange];
        else
            self._ranges = [];
    }
    return self;
}
,["id","CPRange"]), new objj_method(sel_getUid("initWithIndexSet:"), function $CPIndexSet__initWithIndexSet_(self, _cmd, anIndexSet)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexSet").super_class }, "init");
    if (self)
    {
        self._count = (anIndexSet == null ? null : anIndexSet.isa.objj_msgSend0(anIndexSet, "count"));
        self._ranges = [];
        var otherRanges = anIndexSet._ranges,
            otherRangesCount = otherRanges.length;
        while (otherRangesCount--)
            self._ranges[otherRangesCount] = CPMakeRangeCopy(otherRanges[otherRangesCount]);
    }
    return self;
}
,["id","CPIndexSet"]), new objj_method(sel_getUid("isEqual:"), function $CPIndexSet__isEqual_(self, _cmd, anObject)
{
    if (self === anObject)
        return YES;
    if (!anObject || !(anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "isKindOfClass:", CPIndexSet.isa.objj_msgSend0(CPIndexSet, "class"))))
        return NO;
    return self.isa.objj_msgSend1(self, "isEqualToIndexSet:", anObject);
}
,["BOOL","id"]), new objj_method(sel_getUid("isEqualToIndexSet:"), function $CPIndexSet__isEqualToIndexSet_(self, _cmd, anIndexSet)
{
    if (!anIndexSet)
        return NO;
    if (self === anIndexSet)
        return YES;
    var rangesCount = self._ranges.length,
        otherRanges = anIndexSet._ranges;
    if (rangesCount !== otherRanges.length || self._count !== anIndexSet._count)
        return NO;
    while (rangesCount--)
        if (!CPEqualRanges(self._ranges[rangesCount], otherRanges[rangesCount]))
            return NO;
    return YES;
}
,["BOOL","CPIndexSet"]), new objj_method(sel_getUid("isEqual:"), function $CPIndexSet__isEqual_(self, _cmd, anObject)
{
    return self === anObject || (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "isKindOfClass:", self.isa.objj_msgSend0(self, "class"))) && self.isa.objj_msgSend1(self, "isEqualToIndexSet:", anObject);
}
,["BOOL","id"]), new objj_method(sel_getUid("containsIndex:"), function $CPIndexSet__containsIndex_(self, _cmd, anIndex)
{
    return positionOfIndex(self._ranges, anIndex) !== CPNotFound;
}
,["BOOL","CPInteger"]), new objj_method(sel_getUid("containsIndexesInRange:"), function $CPIndexSet__containsIndexesInRange_(self, _cmd, aRange)
{
    if (aRange.length <= 0)
        return NO;
    if (self._count < aRange.length)
        return NO;
    var rangeIndex = positionOfIndex(self._ranges, aRange.location);
    if (rangeIndex === CPNotFound)
        return NO;
    var range = self._ranges[rangeIndex];
    return (CPIntersectionRange(range, aRange)).length === aRange.length;
}
,["BOOL","CPRange"]), new objj_method(sel_getUid("containsIndexes:"), function $CPIndexSet__containsIndexes_(self, _cmd, anIndexSet)
{
    var otherCount = anIndexSet._count;
    if (otherCount <= 0)
        return YES;
    if (self._count < otherCount)
        return NO;
    var otherRanges = anIndexSet._ranges,
        otherRangesCount = otherRanges.length;
    while (otherRangesCount--)
        if (!self.isa.objj_msgSend1(self, "containsIndexesInRange:", otherRanges[otherRangesCount]))
            return NO;
    return YES;
}
,["BOOL","CPIndexSet"]), new objj_method(sel_getUid("intersectsIndexesInRange:"), function $CPIndexSet__intersectsIndexesInRange_(self, _cmd, aRange)
{
    if (self._count <= 0)
        return NO;
    var lhsRangeIndex = assumedPositionOfIndex(self._ranges, aRange.location);
    if (FLOOR(lhsRangeIndex) === lhsRangeIndex)
        return YES;
    var rhsRangeIndex = assumedPositionOfIndex(self._ranges, CPMaxRange(aRange) - 1);
    if (FLOOR(rhsRangeIndex) === rhsRangeIndex)
        return YES;
    return lhsRangeIndex !== rhsRangeIndex;
}
,["BOOL","CPRange"]), new objj_method(sel_getUid("count"), function $CPIndexSet__count(self, _cmd)
{
    return self._count;
}
,["int"]), new objj_method(sel_getUid("firstIndex"), function $CPIndexSet__firstIndex(self, _cmd)
{
    if (self._count > 0)
        return self._ranges[0].location;
    return CPNotFound;
}
,["CPInteger"]), new objj_method(sel_getUid("lastIndex"), function $CPIndexSet__lastIndex(self, _cmd)
{
    if (self._count > 0)
        return CPMaxRange(self._ranges[self._ranges.length - 1]) - 1;
    return CPNotFound;
}
,["CPInteger"]), new objj_method(sel_getUid("indexGreaterThanIndex:"), function $CPIndexSet__indexGreaterThanIndex_(self, _cmd, anIndex)
{
    ++anIndex;
    var rangeIndex = assumedPositionOfIndex(self._ranges, anIndex);
    if (rangeIndex === CPNotFound)
        return CPNotFound;
    rangeIndex = CEIL(rangeIndex);
    if (rangeIndex >= self._ranges.length)
        return CPNotFound;
    var range = self._ranges[rangeIndex];
    if (CPLocationInRange(anIndex, range))
        return anIndex;
    return range.location;
}
,["CPInteger","CPInteger"]), new objj_method(sel_getUid("indexLessThanIndex:"), function $CPIndexSet__indexLessThanIndex_(self, _cmd, anIndex)
{
    --anIndex;
    var rangeIndex = assumedPositionOfIndex(self._ranges, anIndex);
    if (rangeIndex === CPNotFound)
        return CPNotFound;
    rangeIndex = FLOOR(rangeIndex);
    if (rangeIndex < 0)
        return CPNotFound;
    var range = self._ranges[rangeIndex];
    if (CPLocationInRange(anIndex, range))
        return anIndex;
    return CPMaxRange(range) - 1;
}
,["CPInteger","CPInteger"]), new objj_method(sel_getUid("indexGreaterThanOrEqualToIndex:"), function $CPIndexSet__indexGreaterThanOrEqualToIndex_(self, _cmd, anIndex)
{
    return self.isa.objj_msgSend1(self, "indexGreaterThanIndex:", anIndex - 1);
}
,["CPInteger","CPInteger"]), new objj_method(sel_getUid("indexLessThanOrEqualToIndex:"), function $CPIndexSet__indexLessThanOrEqualToIndex_(self, _cmd, anIndex)
{
    return self.isa.objj_msgSend1(self, "indexLessThanIndex:", anIndex + 1);
}
,["CPInteger","CPInteger"]), new objj_method(sel_getUid("getIndexes:maxCount:inIndexRange:"), function $CPIndexSet__getIndexes_maxCount_inIndexRange_(self, _cmd, anArray, aMaxCount, aRange)
{
    if (!self._count || aMaxCount === 0 || aRange && !aRange.length)
    {
        if (aRange)
            aRange.length = 0;
        return 0;
    }
    var total = 0;
    if (aRange)
    {
        var firstIndex = aRange.location,
            lastIndex = CPMaxRange(aRange) - 1,
            rangeIndex = CEIL(assumedPositionOfIndex(self._ranges, firstIndex)),
            lastRangeIndex = FLOOR(assumedPositionOfIndex(self._ranges, lastIndex));
    }
    else
    {
        var firstIndex = self.isa.objj_msgSend0(self, "firstIndex"),
            lastIndex = self.isa.objj_msgSend0(self, "lastIndex"),
            rangeIndex = 0,
            lastRangeIndex = self._ranges.length - 1;
    }
    while (rangeIndex <= lastRangeIndex)
    {
        var range = self._ranges[rangeIndex],
            index = MAX(firstIndex, range.location),
            maxRange = MIN(lastIndex + 1, CPMaxRange(range));
        for (; index < maxRange; ++index)
        {
            anArray[total++] = index;
            if (total === aMaxCount)
            {
                if (aRange)
                {
                    aRange.location = index + 1;
                    aRange.length = lastIndex + 1 - index - 1;
                }
                return aMaxCount;
            }
        }
        ++rangeIndex;
    }
    if (aRange)
    {
        aRange.location = CPNotFound;
        aRange.length = 0;
    }
    return total;
}
,["CPInteger","CPArray","CPInteger","CPRange"]), new objj_method(sel_getUid("description"), function $CPIndexSet__description(self, _cmd)
{
    var description = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexSet").super_class }, "description");
    if (self._count)
    {
        var index = 0,
            count = self._ranges.length;
        description += "[number of indexes: " + self._count + " (in " + count;
        if (count === 1)
            description += " range), indexes: (";
        else
            description += " ranges), indexes: (";
        for (; index < count; ++index)
        {
            var range = self._ranges[index];
            description += range.location;
            if (range.length > 1)
                description += "-" + (CPMaxRange(range) - 1);
            if (index + 1 < count)
                description += " ";
        }
        description += ")]";
    }
    else
        description += "(no indexes)";
    return description;
}
,["CPString"]), new objj_method(sel_getUid("enumerateIndexesUsingBlock:"), function $CPIndexSet__enumerateIndexesUsingBlock_(self, _cmd, aFunction)
{
    self.isa.objj_msgSend2(self, "enumerateIndexesWithOptions:usingBlock:", CPEnumerationNormal, aFunction);
}
,["void","Function"]), new objj_method(sel_getUid("enumerateIndexesWithOptions:usingBlock:"), function $CPIndexSet__enumerateIndexesWithOptions_usingBlock_(self, _cmd, options, aFunction)
{
    if (!self._count)
        return;
    self.isa.objj_msgSend3(self, "enumerateIndexesInRange:options:usingBlock:", CPMakeRange(0, CPMaxRange(self._ranges[self._ranges.length - 1])), options, aFunction);
}
,["void","CPEnumerationOptions","Function"]), new objj_method(sel_getUid("enumerateIndexesInRange:options:usingBlock:"), function $CPIndexSet__enumerateIndexesInRange_options_usingBlock_(self, _cmd, enumerationRange, options, aFunction)
{
    if (!self._count || CPEmptyRange(enumerationRange))
        return;
    var shouldStop = NO,
        index,
        stop,
        increment;
    if (options & CPEnumerationReverse)
    {
        (index = self._ranges.length - 1, stop = -1, increment = -1);
    }
    else
    {
        index = 0;
        stop = self._ranges.length;
        increment = 1;
    }
    for (; index !== stop; index += increment)
    {
        var range = self._ranges[index],
            rangeIndex,
            rangeStop,
            rangeIncrement;
        if (options & CPEnumerationReverse)
        {
            rangeIndex = CPMaxRange(range) - 1;
            rangeStop = range.location - 1;
            rangeIncrement = -1;
        }
        else
        {
            rangeIndex = range.location;
            rangeStop = CPMaxRange(range);
            rangeIncrement = 1;
        }
        for (; rangeIndex !== rangeStop; rangeIndex += rangeIncrement)
        {
            if (CPLocationInRange(rangeIndex, enumerationRange))
            {
                aFunction(rangeIndex, function(__input) { if (arguments.length) return shouldStop = __input; return shouldStop; });
                if (shouldStop)
                    return;
            }
        }
    }
}
,["void","CPRange","CPEnumerationOptions","Function"]), new objj_method(sel_getUid("indexPassingTest:"), function $CPIndexSet__indexPassingTest_(self, _cmd, aPredicate)
{
    return self.isa.objj_msgSend2(self, "indexWithOptions:passingTest:", CPEnumerationNormal, aPredicate);
}
,["unsigned","Function"]), new objj_method(sel_getUid("indexesPassingTest:"), function $CPIndexSet__indexesPassingTest_(self, _cmd, aPredicate)
{
    return self.isa.objj_msgSend2(self, "indexesWithOptions:passingTest:", CPEnumerationNormal, aPredicate);
}
,["CPIndexSet","Function"]), new objj_method(sel_getUid("indexWithOptions:passingTest:"), function $CPIndexSet__indexWithOptions_passingTest_(self, _cmd, anOptions, aPredicate)
{
    if (!self._count)
        return CPNotFound;
    return self.isa.objj_msgSend3(self, "indexInRange:options:passingTest:", CPMakeRange(0, CPMaxRange(self._ranges[self._ranges.length - 1])), anOptions, aPredicate);
}
,["unsigned","CPEnumerationOptions","Function"]), new objj_method(sel_getUid("indexesWithOptions:passingTest:"), function $CPIndexSet__indexesWithOptions_passingTest_(self, _cmd, anOptions, aPredicate)
{
    if (!self._count)
        return CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    return self.isa.objj_msgSend3(self, "indexesInRange:options:passingTest:", CPMakeRange(0, CPMaxRange(self._ranges[self._ranges.length - 1])), anOptions, aPredicate);
}
,["CPIndexSet","CPEnumerationOptions","Function"]), new objj_method(sel_getUid("indexInRange:options:passingTest:"), function $CPIndexSet__indexInRange_options_passingTest_(self, _cmd, aRange, anOptions, aPredicate)
{
    if (!self._count || CPEmptyRange(aRange))
        return CPNotFound;
    var shouldStop = NO,
        index,
        stop,
        increment;
    if (anOptions & CPEnumerationReverse)
    {
        (index = self._ranges.length - 1, stop = -1, increment = -1);
    }
    else
    {
        index = 0;
        stop = self._ranges.length;
        increment = 1;
    }
    for (; index !== stop; index += increment)
    {
        var range = self._ranges[index],
            rangeIndex,
            rangeStop,
            rangeIncrement;
        if (anOptions & CPEnumerationReverse)
        {
            rangeIndex = CPMaxRange(range) - 1;
            rangeStop = range.location - 1;
            rangeIncrement = -1;
        }
        else
        {
            rangeIndex = range.location;
            rangeStop = CPMaxRange(range);
            rangeIncrement = 1;
        }
        for (; rangeIndex !== rangeStop; rangeIndex += rangeIncrement)
        {
            if (CPLocationInRange(rangeIndex, aRange))
            {
                if (aPredicate(rangeIndex, function(__input) { if (arguments.length) return shouldStop = __input; return shouldStop; }))
                    return rangeIndex;
                if (shouldStop)
                    return CPNotFound;
            }
        }
    }
    return CPNotFound;
}
,["unsigned","CPRange","CPEnumerationOptions","Function"]), new objj_method(sel_getUid("indexesInRange:options:passingTest:"), function $CPIndexSet__indexesInRange_options_passingTest_(self, _cmd, aRange, anOptions, aPredicate)
{
    if (!self._count || CPEmptyRange(aRange))
        return CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    var shouldStop = NO,
        index,
        stop,
        increment;
    if (anOptions & CPEnumerationReverse)
    {
        (index = self._ranges.length - 1, stop = -1, increment = -1);
    }
    else
    {
        index = 0;
        stop = self._ranges.length;
        increment = 1;
    }
    var indexesPassingTest = (CPMutableIndexSet == null ? null : CPMutableIndexSet.isa.objj_msgSend0(CPMutableIndexSet, "indexSet"));
    for (; index !== stop; index += increment)
    {
        var range = self._ranges[index],
            rangeIndex,
            rangeStop,
            rangeIncrement;
        if (anOptions & CPEnumerationReverse)
        {
            rangeIndex = CPMaxRange(range) - 1;
            rangeStop = range.location - 1;
            rangeIncrement = -1;
        }
        else
        {
            rangeIndex = range.location;
            rangeStop = CPMaxRange(range);
            rangeIncrement = 1;
        }
        for (; rangeIndex !== rangeStop; rangeIndex += rangeIncrement)
        {
            if (CPLocationInRange(rangeIndex, aRange))
            {
                if (aPredicate(rangeIndex, function(__input) { if (arguments.length) return shouldStop = __input; return shouldStop; }))
                    (indexesPassingTest == null ? null : indexesPassingTest.isa.objj_msgSend1(indexesPassingTest, "addIndex:", rangeIndex));
                if (shouldStop)
                    return indexesPassingTest;
            }
        }
    }
    return indexesPassingTest;
}
,["CPIndexSet","CPRange","CPEnumerationOptions","Function"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("indexSet"), function $CPIndexSet__indexSet(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("indexSetWithIndex:"), function $CPIndexSet__indexSetWithIndex_(self, _cmd, anIndex)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIndex:", anIndex));
    var ___r1;
}
,["id","int"]), new objj_method(sel_getUid("indexSetWithIndexesInRange:"), function $CPIndexSet__indexSetWithIndexesInRange_(self, _cmd, aRange)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIndexesInRange:", aRange));
    var ___r1;
}
,["id","CPRange"])]);
}{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("addIndex:"), function $CPIndexSet__addIndex_(self, _cmd, anIndex)
{
    self.isa.objj_msgSend1(self, "addIndexesInRange:", CPMakeRange(anIndex, 1));
}
,["void","CPInteger"]), new objj_method(sel_getUid("addIndexes:"), function $CPIndexSet__addIndexes_(self, _cmd, anIndexSet)
{
    var otherRanges = anIndexSet._ranges,
        otherRangesCount = otherRanges.length;
    while (otherRangesCount--)
        self.isa.objj_msgSend1(self, "addIndexesInRange:", otherRanges[otherRangesCount]);
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("addIndexesInRange:"), function $CPIndexSet__addIndexesInRange_(self, _cmd, aRange)
{
    if (aRange.location < 0)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Range " + CPStringFromRange(aRange) + " is out of bounds.");
    if (aRange.length <= 0)
        return;
    if (self._count <= 0)
    {
        self._count = aRange.length;
        self._ranges = [aRange];
        return;
    }
    var rangeCount = self._ranges.length,
        lhsRangeIndex = assumedPositionOfIndex(self._ranges, aRange.location - 1),
        lhsRangeIndexCEIL = CEIL(lhsRangeIndex);
    if (lhsRangeIndexCEIL === lhsRangeIndex && lhsRangeIndexCEIL < rangeCount)
        aRange = CPUnionRange(aRange, self._ranges[lhsRangeIndexCEIL]);
    var rhsRangeIndex = assumedPositionOfIndex(self._ranges, CPMaxRange(aRange)),
        rhsRangeIndexFLOOR = FLOOR(rhsRangeIndex);
    if (rhsRangeIndexFLOOR === rhsRangeIndex && rhsRangeIndexFLOOR >= 0)
        aRange = CPUnionRange(aRange, self._ranges[rhsRangeIndexFLOOR]);
    var removalCount = rhsRangeIndexFLOOR - lhsRangeIndexCEIL + 1;
    if (removalCount === self._ranges.length)
    {
        self._ranges = [aRange];
        self._count = aRange.length;
    }
    else if (removalCount === 1)
    {
        if (lhsRangeIndexCEIL < self._ranges.length)
            self._count -= self._ranges[lhsRangeIndexCEIL].length;
        self._count += aRange.length;
        self._ranges[lhsRangeIndexCEIL] = aRange;
    }
    else
    {
        if (removalCount > 0)
        {
            var removal = lhsRangeIndexCEIL,
                lastRemoval = lhsRangeIndexCEIL + removalCount - 1;
            for (; removal <= lastRemoval; ++removal)
                self._count -= self._ranges[removal].length;
            ((___r1 = self._ranges), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectsInRange:", CPMakeRange(lhsRangeIndexCEIL, removalCount)));
        }
        ((___r1 = self._ranges), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", aRange, lhsRangeIndexCEIL));
        self._count += aRange.length;
    }
    var ___r1;
}
,["void","CPRange"]), new objj_method(sel_getUid("removeIndex:"), function $CPIndexSet__removeIndex_(self, _cmd, anIndex)
{
    self.isa.objj_msgSend1(self, "removeIndexesInRange:", CPMakeRange(anIndex, 1));
}
,["void","CPInteger"]), new objj_method(sel_getUid("removeIndexes:"), function $CPIndexSet__removeIndexes_(self, _cmd, anIndexSet)
{
    var otherRanges = anIndexSet._ranges,
        otherRangesCount = otherRanges.length;
    while (otherRangesCount--)
        self.isa.objj_msgSend1(self, "removeIndexesInRange:", otherRanges[otherRangesCount]);
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("removeAllIndexes"), function $CPIndexSet__removeAllIndexes(self, _cmd)
{
    self._ranges = [];
    self._count = 0;
}
,["void"]), new objj_method(sel_getUid("removeIndexesInRange:"), function $CPIndexSet__removeIndexesInRange_(self, _cmd, aRange)
{
    if (aRange.length <= 0)
        return;
    if (self._count <= 0)
        return;
    var rangeCount = self._ranges.length,
        lhsRangeIndex = assumedPositionOfIndex(self._ranges, aRange.location),
        lhsRangeIndexCEIL = CEIL(lhsRangeIndex);
    if (lhsRangeIndex === lhsRangeIndexCEIL && lhsRangeIndexCEIL < rangeCount)
    {
        var existingRange = self._ranges[lhsRangeIndexCEIL];
        if (aRange.location !== existingRange.location)
        {
            var maxRange = CPMaxRange(aRange),
                existingMaxRange = CPMaxRange(existingRange);
            existingRange.length = aRange.location - existingRange.location;
            if (maxRange < existingMaxRange)
            {
                self._count -= aRange.length;
                ((___r1 = self._ranges), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", CPMakeRange(maxRange, existingMaxRange - maxRange), lhsRangeIndexCEIL + 1));
                return;
            }
            else
            {
                self._count -= existingMaxRange - aRange.location;
                lhsRangeIndexCEIL += 1;
            }
        }
    }
    var rhsRangeIndex = assumedPositionOfIndex(self._ranges, CPMaxRange(aRange) - 1),
        rhsRangeIndexFLOOR = FLOOR(rhsRangeIndex);
    if (rhsRangeIndex === rhsRangeIndexFLOOR && rhsRangeIndexFLOOR >= 0)
    {
        var maxRange = CPMaxRange(aRange),
            existingRange = self._ranges[rhsRangeIndexFLOOR],
            existingMaxRange = CPMaxRange(existingRange);
        if (maxRange !== existingMaxRange)
        {
            self._count -= maxRange - existingRange.location;
            rhsRangeIndexFLOOR -= 1;
            existingRange.location = maxRange;
            existingRange.length = existingMaxRange - maxRange;
        }
    }
    var removalCount = rhsRangeIndexFLOOR - lhsRangeIndexCEIL + 1;
    if (removalCount > 0)
    {
        var removal = lhsRangeIndexCEIL,
            lastRemoval = lhsRangeIndexCEIL + removalCount - 1;
        for (; removal <= lastRemoval; ++removal)
            self._count -= self._ranges[removal].length;
        ((___r1 = self._ranges), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectsInRange:", CPMakeRange(lhsRangeIndexCEIL, removalCount)));
    }
    var ___r1;
}
,["void","CPRange"]), new objj_method(sel_getUid("shiftIndexesStartingAtIndex:by:"), function $CPIndexSet__shiftIndexesStartingAtIndex_by_(self, _cmd, anIndex, aDelta)
{
    if (!self._count || aDelta == 0)
        return;
    var i = self._ranges.length - 1,
        shifted = CPMakeRange(CPNotFound, 0);
    for (; i >= 0; --i)
    {
        var range = self._ranges[i],
            maximum = CPMaxRange(range);
        if (anIndex >= maximum)
            break;
        if (anIndex > range.location)
        {
            shifted = CPMakeRange(anIndex + aDelta, maximum - anIndex);
            range.length = anIndex - range.location;
            if (aDelta > 0)
                ((___r1 = self._ranges), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", shifted, i + 1));
            else if (shifted.location < 0)
            {
                shifted.length = CPMaxRange(shifted);
                shifted.location = 0;
            }
            break;
        }
        if ((range.location += aDelta) < 0)
        {
            self._count -= range.length - CPMaxRange(range);
            range.length = CPMaxRange(range);
            range.location = 0;
        }
    }
    if (aDelta < 0)
    {
        var j = i + 1,
            count = self._ranges.length,
            shifts = [];
        for (; j < count; ++j)
        {
            (shifts == null ? null : shifts.isa.objj_msgSend1(shifts, "addObject:", self._ranges[j]));
            self._count -= self._ranges[j].length;
        }
        if ((j = i + 1) < count)
        {
            ((___r1 = self._ranges), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectsInRange:", CPMakeRange(j, count - j)));
            for ((j = 0, count = shifts.length); j < count; ++j)
                self.isa.objj_msgSend1(self, "addIndexesInRange:", shifts[j]);
        }
        if (shifted.location != CPNotFound)
            self.isa.objj_msgSend1(self, "addIndexesInRange:", shifted);
    }
    var ___r1;
}
,["void","CPInteger","int"])]);
}var CPIndexSetCountKey = "CPIndexSetCountKey",
    CPIndexSetRangeStringsKey = "CPIndexSetRangeStringsKey";
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPIndexSet__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexSet").super_class }, "init");
    if (self)
    {
        self._count = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPIndexSetCountKey));
        self._ranges = [];
        var rangeStrings = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPIndexSetRangeStringsKey)),
            index = 0,
            count = rangeStrings.length;
        for (; index < count; ++index)
            self._ranges.push(CPRangeFromString(rangeStrings[index]));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPIndexSet__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._count, CPIndexSetCountKey));
    var index = 0,
        count = self._ranges.length,
        rangeStrings = [];
    for (; index < count; ++index)
        rangeStrings[index] = CPStringFromRange(self._ranges[index]);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", rangeStrings, CPIndexSetRangeStringsKey));
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPIndexSet__copy(self, _cmd)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIndexSet:", self));
    var ___r1, ___r2;
}
,["id"]), new objj_method(sel_getUid("mutableCopy"), function $CPIndexSet__mutableCopy(self, _cmd)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIndexSet:", self));
    var ___r1, ___r2;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPIndexSet, "CPMutableIndexSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}var positionOfIndex = function(ranges, anIndex)
{
    var low = 0,
        high = ranges.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            range = ranges[middle];
        if (anIndex < range.location)
            high = middle - 1;
        else if (anIndex >= CPMaxRange(range))
            low = middle + 1;
        else
            return middle;
    }
    return CPNotFound;
};
var assumedPositionOfIndex = function(ranges, anIndex)
{
    var count = ranges.length;
    if (count <= 0)
        return CPNotFound;
    var low = 0,
        high = count * 2;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            position = middle / 2,
            positionFLOOR = FLOOR(position);
        if (position === positionFLOOR)
        {
            if (positionFLOOR - 1 >= 0 && anIndex < CPMaxRange(ranges[positionFLOOR - 1]))
                high = middle - 1;
            else if (positionFLOOR < count && anIndex >= ranges[positionFLOOR].location)
                low = middle + 1;
            else
                return positionFLOOR - 0.5;
        }
        else
        {
            var range = ranges[positionFLOOR];
            if (anIndex < range.location)
                high = middle - 1;
            else if (anIndex >= CPMaxRange(range))
                low = middle + 1;
            else
                return positionFLOOR;
        }
    }
    return CPNotFound;
};
