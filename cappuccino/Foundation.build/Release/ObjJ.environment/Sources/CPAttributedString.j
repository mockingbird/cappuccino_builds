@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;10;CPObject.ji;9;CPRange.ji;10;CPString.jt;26758;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRange.j", YES);objj_executeFile("CPString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPAttributedString"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_string"), new objj_ivar("_rangeEntries")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPAttributedString__init(self, _cmd)
{
    return self.isa.objj_msgSend2(self, "initWithString:attributes:", "", nil);
}
,["id"]), new objj_method(sel_getUid("initWithString:"), function $CPAttributedString__initWithString_(self, _cmd, aString)
{
    return self.isa.objj_msgSend2(self, "initWithString:attributes:", aString, nil);
}
,["id","CPString"]), new objj_method(sel_getUid("initWithAttributedString:"), function $CPAttributedString__initWithAttributedString_(self, _cmd, aString)
{
    var string = self.isa.objj_msgSend2(self, "initWithString:attributes:", "", nil);
    (string == null ? null : string.isa.objj_msgSend1(string, "setAttributedString:", aString));
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
    return self.isa.objj_msgSend0(self, "string");
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
        if (CPLocationInRange(index, entry.range) || !index && !CPMaxRange(entry.range))
            return CPOrderedSame;
        else if (CPMaxRange(entry.range) <= index)
            return CPOrderedDescending;
        else
            return CPOrderedAscending;
    };
    return ((___r1 = self._rangeEntries), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "indexOfObject:inSortedRange:options:usingComparator:", anIndex, nil, 0, sortFunction));
    var ___r1;
}
,["unsigned","unsigned"]), new objj_method(sel_getUid("attributesAtIndex:effectiveRange:"), function $CPAttributedString__attributesAtIndex_effectiveRange_(self, _cmd, anIndex, aRange)
{
    var entryIndex = self.isa.objj_msgSend1(self, "_indexOfEntryWithIndex:", anIndex);
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
    var startingEntryIndex = self.isa.objj_msgSend1(self, "_indexOfEntryWithIndex:", anIndex);
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
        if (CPMaxRange(nextEntry.range) > rangeLimit.location && ((___r1 = nextEntry.attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToDictionary:", comparisonDict)))
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
        if (nextEntry.range.location < CPMaxRange(rangeLimit) && ((___r1 = nextEntry.attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToDictionary:", comparisonDict)))
        {
            currentEntry = nextEntry;
            nextRangeIndex++;
        }
        else
            break;
    }
    aRange.length = MIN(CPMaxRange(currentEntry.range), CPMaxRange(rangeLimit)) - aRange.location;
    return comparisonDict;
    var ___r1;
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
    return ((___r1 = self.isa.objj_msgSend2(self, "attributesAtIndex:effectiveRange:", index, aRange)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", attribute));
    var ___r1;
}
,["id","CPString","CPUInteger","CPRangePointer"]), new objj_method(sel_getUid("attribute:atIndex:longestEffectiveRange:inRange:"), function $CPAttributedString__attribute_atIndex_longestEffectiveRange_inRange_(self, _cmd, attribute, anIndex, aRange, rangeLimit)
{
    var startingEntryIndex = self.isa.objj_msgSend1(self, "_indexOfEntryWithIndex:", anIndex);
    if (startingEntryIndex === CPNotFound || !attribute)
        return nil;
    if (!aRange)
        return ((___r1 = self._rangeEntries[startingEntryIndex].attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", attribute));
    if (CPRangeInRange(self._rangeEntries[startingEntryIndex].range, rangeLimit))
    {
        aRange.location = rangeLimit.location;
        aRange.length = rangeLimit.length;
        return ((___r1 = self._rangeEntries[startingEntryIndex].attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", attribute));
    }
    var nextRangeIndex = startingEntryIndex - 1,
        currentEntry = self._rangeEntries[startingEntryIndex],
        comparisonAttribute = ((___r1 = currentEntry.attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", attribute));
    while (nextRangeIndex >= 0)
    {
        var nextEntry = self._rangeEntries[nextRangeIndex];
        if (CPMaxRange(nextEntry.range) > rangeLimit.location && isEqual(comparisonAttribute, ((___r1 = nextEntry.attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", attribute))))
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
        if (nextEntry.range.location < CPMaxRange(rangeLimit) && isEqual(comparisonAttribute, ((___r1 = nextEntry.attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", attribute))))
        {
            currentEntry = nextEntry;
            nextRangeIndex++;
        }
        else
            break;
    }
    aRange.length = MIN(CPMaxRange(currentEntry.range), CPMaxRange(rangeLimit)) - aRange.location;
    return comparisonAttribute;
    var ___r1;
}
,["id","CPString","CPUInteger","CPRangePointer","CPRange"]), new objj_method(sel_getUid("isEqualToAttributedString:"), function $CPAttributedString__isEqualToAttributedString_(self, _cmd, aString)
{
    if (!aString)
        return NO;
    if (self._string !== (aString == null ? null : aString.isa.objj_msgSend0(aString, "string")))
        return NO;
    var myRange = CPMakeRange(),
        comparisonRange = CPMakeRange(),
        myAttributes = self.isa.objj_msgSend2(self, "attributesAtIndex:effectiveRange:", 0, myRange),
        comparisonAttributes = (aString == null ? null : aString.isa.objj_msgSend2(aString, "attributesAtIndex:effectiveRange:", 0, comparisonRange)),
        length = self._string.length;
    do
    {
        if ((CPIntersectionRange(myRange, comparisonRange)).length > 0 && !(myAttributes == null ? null : myAttributes.isa.objj_msgSend1(myAttributes, "isEqualToDictionary:", comparisonAttributes)))
        {
            return NO;
        }
        else if (CPMaxRange(myRange) < CPMaxRange(comparisonRange))
            myAttributes = self.isa.objj_msgSend2(self, "attributesAtIndex:effectiveRange:", CPMaxRange(myRange), myRange);
        else
            comparisonAttributes = (aString == null ? null : aString.isa.objj_msgSend2(aString, "attributesAtIndex:effectiveRange:", CPMaxRange(comparisonRange), comparisonRange));
    }
    while (CPMaxRange(CPUnionRange(myRange, comparisonRange)) < length);
    return YES;
}
,["BOOL","CPAttributedString"]), new objj_method(sel_getUid("isEqual:"), function $CPAttributedString__isEqual_(self, _cmd, anObject)
{
    if (anObject === self)
        return YES;
    if ((anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "isKindOfClass:", self.isa.objj_msgSend0(self, "class"))))
        return self.isa.objj_msgSend1(self, "isEqualToAttributedString:", anObject);
    return NO;
}
,["BOOL","id"]), new objj_method(sel_getUid("attributedSubstringFromRange:"), function $CPAttributedString__attributedSubstringFromRange_(self, _cmd, aRange)
{
    if (!aRange || CPMaxRange(aRange) > self._string.length || aRange.location < 0)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "tried to get attributedSubstring for an invalid range: " + (aRange ? CPStringFromRange(aRange) : "nil"));
    var newString = ((___r1 = CPAttributedString.isa.objj_msgSend0(CPAttributedString, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithString:", self._string.substring(aRange.location, CPMaxRange(aRange)))),
        entryIndex = self.isa.objj_msgSend1(self, "_indexOfEntryWithIndex:", aRange.location);
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
    var ___r1;
}
,["CPAttributedString","CPRange"]), new objj_method(sel_getUid("replaceCharactersInRange:withString:"), function $CPAttributedString__replaceCharactersInRange_withString_(self, _cmd, aRange, aString)
{
    if (!aString)
        aString = "";
    var lastValidIndex = MAX(self._rangeEntries.length - 1, 0),
        startingIndex = self.isa.objj_msgSend1(self, "_indexOfEntryWithIndex:", aRange.location);
    if (startingIndex < 0)
        startingIndex = lastValidIndex;
    var endingIndex = self.isa.objj_msgSend1(self, "_indexOfEntryWithIndex:", CPMaxRange(aRange));
    if (endingIndex < 0)
        endingIndex = lastValidIndex;
    var additionalLength = aString.length - aRange.length,
        patchPosition = startingIndex;
    self._string = self._string.substring(0, aRange.location) + aString + self._string.substring(CPMaxRange(aRange));
    var originalLength = self._rangeEntries[patchPosition].range.length;
    if (startingIndex === endingIndex)
        self._rangeEntries[patchPosition].range.length += additionalLength;
    else
    {
        if ((CPIntersectionRange(self._rangeEntries[patchPosition].range, aRange)).length < originalLength)
        {
            startingIndex++;
        }
        if (endingIndex > startingIndex)
        {
            var originalOffset = self._rangeEntries[startingIndex].range.location,
                offsetFromSplicing = CPMaxRange(self._rangeEntries[endingIndex].range) - originalOffset;
            self._rangeEntries.splice(startingIndex, endingIndex - startingIndex);
            self._rangeEntries[startingIndex].range = CPMakeRange(originalOffset, offsetFromSplicing);
        }
        if (patchPosition !== startingIndex)
        {
            var lhsOffset = aString.length - (CPIntersectionRange(self._rangeEntries[patchPosition].range, aRange)).length;
            self._rangeEntries[patchPosition].range.length = originalLength + lhsOffset;
            var rhsOffset = aString.length - (CPIntersectionRange(self._rangeEntries[startingIndex].range, aRange)).length;
            self._rangeEntries[startingIndex].range.location += lhsOffset;
            self._rangeEntries[startingIndex].range.length += rhsOffset;
            patchPosition = startingIndex;
        }
        else
            self._rangeEntries[patchPosition].range.length += additionalLength;
    }
    for (var patchIndex = patchPosition + 1, l = self._rangeEntries.length; patchIndex < l; patchIndex++)
        self._rangeEntries[patchIndex].range.location += additionalLength;
}
,["void","CPRange","CPString"]), new objj_method(sel_getUid("deleteCharactersInRange:"), function $CPAttributedString__deleteCharactersInRange_(self, _cmd, aRange)
{
    self.isa.objj_msgSend2(self, "replaceCharactersInRange:withString:", aRange, nil);
}
,["void","CPRange"]), new objj_method(sel_getUid("setAttributes:range:"), function $CPAttributedString__setAttributes_range_(self, _cmd, aDictionary, aRange)
{
    var startingEntryIndex = self.isa.objj_msgSend2(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", aRange.location, YES),
        endingEntryIndex = self.isa.objj_msgSend2(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", CPMaxRange(aRange), YES),
        current = startingEntryIndex;
    if (current < 0)
        current = MAX(self._rangeEntries.length - 1, 0);
    if (endingEntryIndex === CPNotFound)
        endingEntryIndex = self._rangeEntries.length;
    while (current < endingEntryIndex)
        self._rangeEntries[current++].attributes = (aDictionary == null ? null : aDictionary.isa.objj_msgSend0(aDictionary, "copy"));
    self.isa.objj_msgSend2(self, "_coalesceRangeEntriesFromIndex:toIndex:", startingEntryIndex, endingEntryIndex);
}
,["void","CPDictionary","CPRange"]), new objj_method(sel_getUid("addAttributes:range:"), function $CPAttributedString__addAttributes_range_(self, _cmd, aDictionary, aRange)
{
    var startingEntryIndex = self.isa.objj_msgSend2(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", aRange.location, YES),
        endingEntryIndex = self.isa.objj_msgSend2(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", CPMaxRange(aRange), YES),
        current = startingEntryIndex;
    if (endingEntryIndex === CPNotFound)
        endingEntryIndex = self._rangeEntries.length;
    while (current < endingEntryIndex)
    {
        var keys = (aDictionary == null ? null : aDictionary.isa.objj_msgSend0(aDictionary, "allKeys")),
            count = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count"));
        while (count--)
            ((___r1 = self._rangeEntries[current].attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", (aDictionary == null ? null : aDictionary.isa.objj_msgSend1(aDictionary, "objectForKey:", keys[count])), keys[count]));
        current++;
    }
    self.isa.objj_msgSend2(self, "_coalesceRangeEntriesFromIndex:toIndex:", startingEntryIndex, endingEntryIndex);
    var ___r1;
}
,["void","CPDictionary","CPRange"]), new objj_method(sel_getUid("addAttribute:value:range:"), function $CPAttributedString__addAttribute_value_range_(self, _cmd, anAttribute, aValue, aRange)
{
    self.isa.objj_msgSend2(self, "addAttributes:range:", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aValue, anAttribute), aRange);
}
,["void","CPString","id","CPRange"]), new objj_method(sel_getUid("removeAttribute:range:"), function $CPAttributedString__removeAttribute_range_(self, _cmd, anAttribute, aRange)
{
    var startingEntryIndex = self.isa.objj_msgSend2(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", aRange.location, YES),
        endingEntryIndex = self.isa.objj_msgSend2(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", CPMaxRange(aRange), YES),
        current = startingEntryIndex;
    if (endingEntryIndex === CPNotFound)
        endingEntryIndex = self._rangeEntries.length;
    while (current < endingEntryIndex)
        ((___r1 = self._rangeEntries[current++].attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", anAttribute));
    self.isa.objj_msgSend2(self, "_coalesceRangeEntriesFromIndex:toIndex:", startingEntryIndex, endingEntryIndex);
    var ___r1;
}
,["void","CPString","CPRange"]), new objj_method(sel_getUid("appendAttributedString:"), function $CPAttributedString__appendAttributedString_(self, _cmd, aString)
{
    self.isa.objj_msgSend2(self, "insertAttributedString:atIndex:", aString, self._string.length);
}
,["void","CPAttributedString"]), new objj_method(sel_getUid("insertAttributedString:atIndex:"), function $CPAttributedString__insertAttributedString_atIndex_(self, _cmd, aString, anIndex)
{
    if (anIndex < 0 || anIndex > self.isa.objj_msgSend0(self, "length"))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "tried to insert attributed string at an invalid index: " + anIndex);
    var entryIndexOfNextEntry = self.isa.objj_msgSend2(self, "_indexOfRangeEntryForIndex:splitOnMaxIndex:", anIndex, YES),
        otherRangeEntries = aString._rangeEntries,
        length = (aString == null ? null : aString.isa.objj_msgSend0(aString, "length"));
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
    self.isa.objj_msgSend2(self, "_coalesceRangeEntriesFromIndex:toIndex:", MAX(0, entryIndexOfNextEntry - 1), MIN(entryIndexOfNextEntry + 1, self._rangeEntries.length - 1));
}
,["void","CPAttributedString","CPUInteger"]), new objj_method(sel_getUid("replaceCharactersInRange:withAttributedString:"), function $CPAttributedString__replaceCharactersInRange_withAttributedString_(self, _cmd, aRange, aString)
{
    self.isa.objj_msgSend1(self, "deleteCharactersInRange:", aRange);
    self.isa.objj_msgSend2(self, "insertAttributedString:atIndex:", aString, aRange.location);
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
    var index = self.isa.objj_msgSend1(self, "_indexOfEntryWithIndex:", characterIndex);
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
        if (a && b && ((___r1 = a.attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToDictionary:", b.attributes)))
        {
            a.range.length = CPMaxRange(b.range) - a.range.location;
            self._rangeEntries.splice(current + 1, 1);
            end--;
        }
        else
            current++;
    }
    var ___r1;
}
,["void","unsigned","unsigned"]), new objj_method(sel_getUid("beginEditing"), function $CPAttributedString__beginEditing(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("endEditing"), function $CPAttributedString__endEditing(self, _cmd)
{
}
,["void"])]);
}var CPAttributedStringStringKey = "CPAttributedStringString",
    CPAttributedStringRangesKey = "CPAttributedStringRanges",
    CPAttributedStringAttributesKey = "CPAttributedStringAttributes";
{
var the_class = objj_getClass("CPAttributedString")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPAttributedString\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPAttributedString__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend0(self, "init"));
    if (self)
    {
        self._string = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPAttributedStringStringKey));
        var decodedRanges = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPAttributedStringRangesKey)),
            decodedAttributes = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPAttributedStringAttributesKey));
        self._rangeEntries = [];
        for (var i = 0, l = decodedRanges.length; i < l; i++)
            self._rangeEntries.push(makeRangeEntry(decodedRanges[i], decodedAttributes[i]));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPAttributedString__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._string, CPAttributedStringStringKey));
    var rangesForEncoding = [],
        dictsForEncoding = [];
    for (var i = 0, l = self._rangeEntries.length; i < l; i++)
    {
        rangesForEncoding.push(self._rangeEntries[i].range);
        dictsForEncoding.push(self._rangeEntries[i].attributes);
    }
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", rangesForEncoding, CPAttributedStringRangesKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", dictsForEncoding, CPAttributedStringAttributesKey));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPAttributedString, "CPMutableAttributedString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}var isEqual = function(a, b)
{
    if (a === b)
        return YES;
    if ((a == null ? null : a.isa.objj_msgSend1(a, "respondsToSelector:", sel_getUid("isEqual:"))) && (a == null ? null : a.isa.objj_msgSend1(a, "isEqual:", b)))
        return YES;
    return NO;
};
var makeRangeEntry = function(aRange, attributes)
{
    return {range: aRange, attributes: (attributes == null ? null : attributes.isa.objj_msgSend0(attributes, "copy"))};
};
var copyRangeEntry = function(aRangeEntry)
{
    return makeRangeEntry(CPMakeRangeCopy(aRangeEntry.range), ((___r1 = aRangeEntry.attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy")));
    var ___r1;
};
var splitRangeEntryAtIndex = function(aRangeEntry, anIndex)
{
    var newRangeEntry = copyRangeEntry(aRangeEntry),
        cachedIndex = CPMaxRange(aRangeEntry.range);
    aRangeEntry.range.length = anIndex - aRangeEntry.range.location;
    newRangeEntry.range.location = anIndex;
    newRangeEntry.range.length = cachedIndex - anIndex;
    newRangeEntry.attributes = ((___r1 = newRangeEntry.attributes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    return [aRangeEntry, newRangeEntry];
    var ___r1;
};
