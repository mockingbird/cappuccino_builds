@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;10;CPObject.ji;9;CPRange.ji;10;CPString.jt;21581;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRange.j", YES);objj_executeFile("CPString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPAttributedString"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_string"), new objj_ivar("_rangeEntries")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPAttributedString__init(self, _cmd)
{
    return objj_msgSend(self, "initWithString:attributes:", "", nil);
}
,["id"]), new objj_method(sel_getUid("initWithString:"), function $CPAttributedString__initWithString_(self, _cmd, aString)
{
    return objj_msgSend(self, "initWithString:attributes:", aString, nil);
}
,["id","CPString"]), new objj_method(sel_getUid("initWithAttributedString:"), function $CPAttributedString__initWithAttributedString_(self, _cmd, aString)
{
    var string = objj_msgSend(self, "initWithString:attributes:", "", nil);
    objj_msgSend(string, "setAttributedString:", aString);
    return string;
}
,["id","CPAttributedString"]), new objj_method(sel_getUid("initWithString:attributes:"), function $CPAttributedString__initWithString_attributes_(self, _cmd, aString, attributes)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAttributedString").super_class }, "init");
    if (self)
    {
        if (!attributes)
            attributes = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._string = "" + aString;
        self._rangeEntries = [makeRangeEntry(CPMakeRange(0, self._string.length), attributes)];
    }
    return self;
}
,["id","CPString","CPDictionary"]), new objj_method(sel_getUid("string"), function $CPAttributedString__string(self, _cmd)
{
    return self._string;
}
,["CPString"]), new objj_method(sel_getUid("mutableString"), function $CPAttributedString__mutableString(self, _cmd)
{
    return objj_msgSend(self, "string");
}
,["CPString"]), new objj_method(sel_getUid("length"), function $CPAttributedString__length(self, _cmd)
{
    return self._string.length;
}
,["unsigned"]), new objj_method(sel_getUid("_indexOfEntryWithIndex:"), function $CPAttributedString___indexOfEntryWithIndex_(self, _cmd, anIndex)
{
    if (anIndex < 0 || anIndex > self._string.length || anIndex === undefined)
        return CPNotFound;
    var sortFunction = function(index, entry)
    {
        if (CPLocationInRange(index, entry.range))
            return CPOrderedSame;
        else if (CPMaxRange(entry.range) <= index)
            return CPOrderedDescending;
        else
            return CPOrderedAscending;
    };
    return objj_msgSend(self._rangeEntries, "indexOfObject:inSortedRange:options:usingComparator:", anIndex, nil, 0, sortFunction);
}
,["unsigned","unsigned"]), new objj_method(sel_getUid("attributesAtIndex:effectiveRange:"), function $CPAttributedString__attributesAtIndex_effectiveRange_(self, _cmd, anIndex, aRange)
{
    var entryIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", anIndex);
    if (entryIndex === CPNotFound)
        return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    var matchingRange = self._rangeEntries[entryIndex];
    if (aRange)
    {
        aRange.location = matchingRange.range.location;
        aRange.length = matchingRange.range.length;
    }
    return matchingRange.attributes;
}
,["CPDictionary","CPUInteger","CPRangePointer"]), new objj_method(sel_getUid("attributesAtIndex:longestEffectiveRange:inRange:"), function $CPAttributedString__attributesAtIndex_longestEffectiveRange_inRange_(self, _cmd, anIndex, aRange, rangeLimit)
{
    var startingEntryIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", anIndex);
    if (startingEntryIndex === CPNotFound)
        return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    if (!aRange)
        return self._rangeEntries[startingEntryIndex].attributes;
    if (CPRangeInRange(self._rangeEntries[startingEntryIndex].range, rangeLimit))
    {
        aRange.location = rangeLimit.location;
        aRange.length = rangeLimit.length;
        return self._rangeEntries[startingEntryIndex].attributes;
    }
    var nextRangeIndex = startingEntryIndex - 1,
        currentEntry = self._rangeEntries[startingEntryIndex],
        comparisonDict = currentEntry.attributes;
    while (nextRangeIndex >= 0)
    {
        var nextEntry = self._rangeEntries[nextRangeIndex];
        if (CPMaxRange(nextEntry.range) > rangeLimit.location && objj_msgSend(nextEntry.attributes, "isEqualToDictionary:", comparisonDict))
        {
            currentEntry = nextEntry;
            nextRangeIndex--;
        }
        else
            break;
    }
    aRange.location = MAX(currentEntry.range.location, rangeLimit.location);
    currentEntry = self._rangeEntries[startingEntryIndex];
    nextRangeIndex = startingEntryIndex + 1;
    while (nextRangeIndex < self._rangeEntries.length)
    {
        var nextEntry = self._rangeEntries[nextRangeIndex];
        if (nextEntry.range.location < CPMaxRange(rangeLimit) && objj_msgSend(nextEntry.attributes, "isEqualToDictionary:", comparisonDict))
        {
            currentEntry = nextEntry;
            nextRangeIndex++;
        }
        else
            break;
    }
    aRange.length = MIN(CPMaxRange(currentEntry.range), CPMaxRange(rangeLimit)) - aRange.location;
    return comparisonDict;
}
,["CPDictionary","CPUInteger","CPRangePointer","CPRange"]), new objj_method(sel_getUid("attribute:atIndex:effectiveRange:"), function $CPAttributedString__attribute_atIndex_effectiveRange_(self, _cmd, attribute, index, aRange)
{
    if (!attribute)
    {
        if (aRange)
        {
            aRange.location = 0;
            aRange.length = self._string.length;
        }
        return nil;
    }
    return objj_msgSend(objj_msgSend(self, "attributesAtIndex:effectiveRange:", index, aRange), "valueForKey:", attribute);
}
,["id","CPString","CPUInteger","CPRangePointer"]), new objj_method(sel_getUid("attribute:atIndex:longestEffectiveRange:inRange:"), function $CPAttributedString__attribute_atIndex_longestEffectiveRange_inRange_(self, _cmd, attribute, anIndex, aRange, rangeLimit)
{
    var startingEntryIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", anIndex);
    if (startingEntryIndex === CPNotFound || !attribute)
        return nil;
    if (!aRange)
        return objj_msgSend(self._rangeEntries[startingEntryIndex].attributes, "objectForKey:", attribute);
    if (CPRangeInRange(self._rangeEntries[startingEntryIndex].range, rangeLimit))
    {
        aRange.location = rangeLimit.location;
        aRange.length = rangeLimit.length;
        return objj_msgSend(self._rangeEntries[startingEntryIndex].attributes, "objectForKey:", attribute);
    }
    var nextRangeIndex = startingEntryIndex - 1,
        currentEntry = self._rangeEntries[startingEntryIndex],
        comparisonAttribute = objj_msgSend(currentEntry.attributes, "objectForKey:", attribute);
    while (nextRangeIndex >= 0)
    {
        var nextEntry = self._rangeEntries[nextRangeIndex];
        if (CPMaxRange(nextEntry.range) > rangeLimit.location && isEqual(comparisonAttribute, objj_msgSend(nextEntry.attributes, "objectForKey:", attribute)))
        {
            currentEntry = nextEntry;
            nextRangeIndex--;
        }
        else
            break;
    }
    aRange.location = MAX(currentEntry.range.location, rangeLimit.location);
    currentEntry = self._rangeEntries[startingEntryIndex];
    nextRangeIndex = startingEntryIndex + 1;
    while (nextRangeIndex < self._rangeEntries.length)
    {
        var nextEntry = self._rangeEntries[nextRangeIndex];
        if (nextEntry.range.location < CPMaxRange(rangeLimit) && isEqual(comparisonAttribute, objj_msgSend(nextEntry.attributes, "objectForKey:", attribute)))
        {
            currentEntry = nextEntry;
            nextRangeIndex++;
        }
        else
            break;
    }
    aRange.length = MIN(CPMaxRange(currentEntry.range), CPMaxRange(rangeLimit)) - aRange.location;
    return comparisonAttribute;
}
,["id","CPString","CPUInteger","CPRangePointer","CPRange"]), new objj_method(sel_getUid("isEqualToAttributedString:"), function $CPAttributedString__isEqualToAttributedString_(self, _cmd, aString)
{
    if (!aString)
        return NO;
    if (self._string !== objj_msgSend(aString, "string"))
        return NO;
    var myRange = CPMakeRange(),
        comparisonRange = CPMakeRange(),
        myAttributes = objj_msgSend(self, "attributesAtIndex:effectiveRange:", 0, myRange),
        comparisonAttributes = objj_msgSend(aString, "attributesAtIndex:effectiveRange:", 0, comparisonRange),
        length = self._string.length;
    while (CPMaxRange(CPUnionRange(myRange, comparisonRange)) < length)
    {
        if ((CPIntersectionRange(myRange, comparisonRange)).length > 0 && !objj_msgSend(myAttributes, "isEqualToDictionary:", comparisonAttributes))
        {
            return NO;
        }
        else if (CPMaxRange(myRange) < CPMaxRange(comparisonRange))
            myAttributes = objj_msgSend(self, "attributesAtIndex:effectiveRange:", CPMaxRange(myRange), myRange);
        else
            comparisonAttributes = objj_msgSend(aString, "attributesAtIndex:effectiveRange:", CPMaxRange(comparisonRange), comparisonRange);
    }
    return YES;
}
,["BOOL","CPAttributedString"]), new objj_method(sel_getUid("isEqual:"), function $CPAttributedString__isEqual_(self, _cmd, anObject)
{
    if (anObject === self)
        return YES;
    if (objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(self, "class")))
        return objj_msgSend(self, "isEqualToAttributedString:", anObject);
    return NO;
}
,["BOOL","id"]), new objj_method(sel_getUid("attributedSubstringFromRange:"), function $CPAttributedString__attributedSubstringFromRange_(self, _cmd, aRange)
{
    if (!aRange || CPMaxRange(aRange) > self._string.length || aRange.location < 0)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "tried to get attributedSubstring for an invalid range: " + (aRange ? CPStringFromRange(aRange) : "nil"));
    var newString = objj_msgSend(objj_msgSend(CPAttributedString, "alloc"), "initWithString:", self._string.substring(aRange.location, CPMaxRange(aRange))),
        entryIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", aRange.location);
    if (entryIndex === CPNotFound)
        _CPRaiseRangeException(self, _cmd, aRange.location, self._string.length);
    var currentRangeEntry = self._rangeEntries[entryIndex],
        lastIndex = CPMaxRange(aRange);
    newString._rangeEntries = [];
    while (currentRangeEntry && CPMaxRange(currentRangeEntry.range) < lastIndex)
    {
        var newEntry = copyRangeEntry(currentRangeEntry);
        newEntry.range.location -= aRange.location;
        if (newEntry.range.location < 0)
        {
            newEntry.range.length += newEntry.range.location;
            newEntry.range.location = 0;
        }
        newString._rangeEntries.push(newEntry);
        currentRangeEntry = self._rangeEntries[++entryIndex];
    }
    if (currentRangeEntry)
    {
        var newRangeEntry = copyRangeEntry(currentRangeEntry);
        newRangeEntry.range.length = CPMaxRange(aRange) - newRangeEntry.range.location;
        newRangeEntry.range.location -= aRange.location;
        if (newRangeEntry.range.location < 0)
        {
            newRangeEntry.range.length += newRangeEntry.range.location;
            newRangeEntry.range.location = 0;
        }
        newString._rangeEntries.push(newRangeEntry);
    }
    return newString;
}
,["CPAttributedString","CPRange"]), new objj_method(sel_getUid("replaceCharactersInRange:withString:"), function $CPAttributedString__replaceCharactersInRange_withString_(self, _cmd, aRange, aString)
{
    if (!aString)
        aString = "";
    var startingIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", aRange.location);
    if (startingIndex === CPNotFound)
        _CPRaiseRangeException(self, _cmd, aRange.location, self._string.length);
    var startingRangeEntry = self._rangeEntries[startingIndex],
        endingIndex = objj_msgSend(self, "_indexOfEntryWithIndex:", MAX(CPMaxRange(aRange) - 1, 0));
    if (endingIndex === CPNotFound)
        _CPRaiseRangeException(self, _cmd, MAX(CPMaxRange(aRange) - 1, 0), self._string.length);
    var endingRangeEntry = self._rangeEntries[endingIndex],
        additionalLength = aString.length - aRange.length;
    self._string = self._string.substring(0, aRange.location) + aString + self._string.substring(CPMaxRange(aRange));
    if (startingIndex === endingIndex)
        startingRangeEntry.range.length += additionalLength;
    else
    {
        endingRangeEntry.range.length = CPMaxRange(endingRangeEntry.range) - CPMaxRange(aRange);
        endingRangeEntry.range.location = CPMaxRange(aRange);
        startingRangeEntry.range.length = CPMaxRange(aRange) - startingRangeEntry.range.location;
        self._rangeEntries.splice(startingIndex, endingIndex - startingIndex);
    }
    endingIndex = startingIndex + 1;
    while (endingIndex < self._rangeEntries.length)
        self._rangeEntries[endingIndex++].range.location += additionalLength;
}
,["void","CPRange","CPString"]), new objj_method(sel_getUid("deleteCharactersInRange:"), function $CPAttributedString__deleteCharactersInRange_(self, _cmd, aRange)
{
    objj_msgSend(self, "replaceCharactersInRange:withString:", aRange, nil);
}
,["void","CPRange"]), new objj_method(sel_getUid("setAttributes:range:"), function $CPAttributedString__setAttributes_range_(self, _cmd, aDictionary, aRange)
{
    var startingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", aRange.location, YES),
        endingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", CPMaxRange(aRange), YES),
        current = startingEntryIndex;
    if (endingEntryIndex === CPNotFound)
        endingEntryIndex = self._rangeEntries.length;
    while (current < endingEntryIndex)
        self._rangeEntries[current++].attributes = objj_msgSend(aDictionary, "copy");
    objj_msgSend(self, "_coalesceRangeEntriesFromIndex:toIndex:", startingEntryIndex, endingEntryIndex);
}
,["void","CPDictionary","CPRange"]), new objj_method(sel_getUid("addAttributes:range:"), function $CPAttributedString__addAttributes_range_(self, _cmd, aDictionary, aRange)
{
    var startingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", aRange.location, YES),
        endingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", CPMaxRange(aRange), YES),
        current = startingEntryIndex;
    if (endingEntryIndex === CPNotFound)
        endingEntryIndex = self._rangeEntries.length;
    while (current < endingEntryIndex)
    {
        var keys = objj_msgSend(aDictionary, "allKeys"),
            count = objj_msgSend(keys, "count");
        while (count--)
            objj_msgSend(self._rangeEntries[current].attributes, "setObject:forKey:", objj_msgSend(aDictionary, "objectForKey:", keys[count]), keys[count]);
        current++;
    }
    objj_msgSend(self, "_coalesceRangeEntriesFromIndex:toIndex:", startingEntryIndex, endingEntryIndex);
}
,["void","CPDictionary","CPRange"]), new objj_method(sel_getUid("addAttribute:value:range:"), function $CPAttributedString__addAttribute_value_range_(self, _cmd, anAttribute, aValue, aRange)
{
    objj_msgSend(self, "addAttributes:range:", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aValue, anAttribute), aRange);
}
,["void","CPString","id","CPRange"]), new objj_method(sel_getUid("removeAttribute:range:"), function $CPAttributedString__removeAttribute_range_(self, _cmd, anAttribute, aRange)
{
    var startingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", aRange.location, YES),
        endingEntryIndex = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", CPMaxRange(aRange), YES),
        current = startingEntryIndex;
    if (endingEntryIndex === CPNotFound)
        endingEntryIndex = self._rangeEntries.length;
    while (current < endingEntryIndex)
        objj_msgSend(self._rangeEntries[current++].attributes, "removeObjectForKey:", anAttribute);
    objj_msgSend(self, "_coalesceRangeEntriesFromIndex:toIndex:", startingEntryIndex, endingEntryIndex);
}
,["void","CPString","CPRange"]), new objj_method(sel_getUid("appendAttributedString:"), function $CPAttributedString__appendAttributedString_(self, _cmd, aString)
{
    objj_msgSend(self, "insertAttributedString:atIndex:", aString, self._string.length);
}
,["void","CPAttributedString"]), new objj_method(sel_getUid("insertAttributedString:atIndex:"), function $CPAttributedString__insertAttributedString_atIndex_(self, _cmd, aString, anIndex)
{
    if (anIndex < 0 || anIndex > objj_msgSend(self, "length"))
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "tried to insert attributed string at an invalid index: " + anIndex);
    var entryIndexOfNextEntry = objj_msgSend(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", anIndex, YES),
        otherRangeEntries = aString._rangeEntries,
        length = objj_msgSend(aString, "length");
    if (entryIndexOfNextEntry === CPNotFound)
        entryIndexOfNextEntry = self._rangeEntries.length;
    self._string = self._string.substring(0, anIndex) + aString._string + self._string.substring(anIndex);
    var current = entryIndexOfNextEntry;
    while (current < self._rangeEntries.length)
        self._rangeEntries[current++].range.location += length;
    var newRangeEntryCount = otherRangeEntries.length,
        index = 0;
    while (index < newRangeEntryCount)
    {
        var entryCopy = copyRangeEntry(otherRangeEntries[index++]);
        entryCopy.range.location += anIndex;
        self._rangeEntries.splice(entryIndexOfNextEntry - 1 + index, 0, entryCopy);
    }
}
,["void","CPAttributedString","CPUInteger"]), new objj_method(sel_getUid("replaceCharactersInRange:withAttributedString:"), function $CPAttributedString__replaceCharactersInRange_withAttributedString_(self, _cmd, aRange, aString)
{
    objj_msgSend(self, "deleteCharactersInRange:", aRange);
    objj_msgSend(self, "insertAttributedString:atIndex:", aString, aRange.location);
}
,["void","CPRange","CPAttributedString"]), new objj_method(sel_getUid("setAttributedString:"), function $CPAttributedString__setAttributedString_(self, _cmd, aString)
{
    self._string = aString._string;
    self._rangeEntries = [];
    var i = 0,
        count = aString._rangeEntries.length;
    for (; i < count; i++)
        self._rangeEntries.push(copyRangeEntry(aString._rangeEntries[i]));
}
,["void","CPAttributedString"]), new objj_method(sel_getUid("_indexOfRangeEntryForIndex:splitOnMaxIndex:"), function $CPAttributedString___indexOfRangeEntryForIndex_splitOnMaxIndex_(self, _cmd, characterIndex, split)
{
    var index = objj_msgSend(self, "_indexOfEntryWithIndex:", characterIndex);
    if (index === CPNotFound)
        return index;
    var rangeEntry = self._rangeEntries[index];
    if (rangeEntry.range.location === characterIndex || CPMaxRange(rangeEntry.range) - 1 === characterIndex && !split)
        return index;
    var newEntries = splitRangeEntryAtIndex(rangeEntry, characterIndex);
    self._rangeEntries.splice(index, 1, newEntries[0], newEntries[1]);
    index++;
    return index;
}
,["Number","unsigned","BOOL"]), new objj_method(sel_getUid("_coalesceRangeEntriesFromIndex:toIndex:"), function $CPAttributedString___coalesceRangeEntriesFromIndex_toIndex_(self, _cmd, start, end)
{
    var current = start;
    if (end >= self._rangeEntries.length)
        end = self._rangeEntries.length - 1;
    while (current < end)
    {
        var a = self._rangeEntries[current],
            b = self._rangeEntries[current + 1];
        if (objj_msgSend(a.attributes, "isEqualToDictionary:", b.attributes))
        {
            a.range.length = CPMaxRange(b.range) - a.range.location;
            self._rangeEntries.splice(current + 1, 1);
            end--;
        }
        else
            current++;
    }
}
,["void","unsigned","unsigned"]), new objj_method(sel_getUid("beginEditing"), function $CPAttributedString__beginEditing(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("endEditing"), function $CPAttributedString__endEditing(self, _cmd)
{
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPAttributedString, "CPMutableAttributedString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}var isEqual = function(a, b)
{
    if (a === b)
        return YES;
    if (objj_msgSend(a, "respondsToSelector:", sel_getUid("isEqual:")) && objj_msgSend(a, "isEqual:", b))
        return YES;
    return NO;
};
var makeRangeEntry = function(aRange, attributes)
{
    return {range: aRange, attributes: objj_msgSend(attributes, "copy")};
};
var copyRangeEntry = function(aRangeEntry)
{
    return makeRangeEntry(CPMakeRangeCopy(aRangeEntry.range), objj_msgSend(aRangeEntry.attributes, "copy"));
};
var splitRangeEntryAtIndex = function(aRangeEntry, anIndex)
{
    var newRangeEntry = copyRangeEntry(aRangeEntry),
        cachedIndex = CPMaxRange(aRangeEntry.range);
    aRangeEntry.range.length = anIndex - aRangeEntry.range.location;
    newRangeEntry.range.location = anIndex;
    newRangeEntry.range.length = cachedIndex - anIndex;
    newRangeEntry.attributes = objj_msgSend(newRangeEntry.attributes, "copy");
    return [aRangeEntry, newRangeEntry];
};
