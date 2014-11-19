@STATIC;1.0;i;9;CPArray.ji;13;CPException.ji;10;CPObject.ji;9;CPRange.ji;18;CPSortDescriptor.jt;6858;objj_executeFile("CPArray.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRange.j", YES);objj_executeFile("CPSortDescriptor.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPIndexPath"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_indexes")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("indexes"), function $CPIndexPath__indexes(self, _cmd)
{
    return self._indexes;
}
,["CPArray"]), new objj_method(sel_getUid("setIndexes:"), function $CPIndexPath__setIndexes_(self, _cmd, newValue)
{
    self._indexes = newValue;
}
,["void","CPArray"]), new objj_method(sel_getUid("initWithIndexes:length:"), function $CPIndexPath__initWithIndexes_length_(self, _cmd, indexes, length)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexPath").super_class }, "init");
    if (self)
        self._indexes = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "subarrayWithRange:", CPMakeRange(0, length)));
    return self;
}
,["id","CPArray","int"]), new objj_method(sel_getUid("initWithIndexes:"), function $CPIndexPath__initWithIndexes_(self, _cmd, indexes)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexPath").super_class }, "init");
    if (self)
        self._indexes = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "copy"));
    return self;
}
,["id","CPArray"]), new objj_method(sel_getUid("description"), function $CPIndexPath__description(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPIndexPath").super_class }, "description") + " " + self._indexes;
}
,["CPString"]), new objj_method(sel_getUid("length"), function $CPIndexPath__length(self, _cmd)
{
    return ((___r1 = self._indexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("indexAtPosition:"), function $CPIndexPath__indexAtPosition_(self, _cmd, position)
{
    return ((___r1 = self._indexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", position));
    var ___r1;
}
,["int","int"]), new objj_method(sel_getUid("setIndexes:"), function $CPIndexPath__setIndexes_(self, _cmd, theIndexes)
{
    self._indexes = (theIndexes == null ? null : theIndexes.isa.objj_msgSend0(theIndexes, "copy"));
}
,["void","CPArray"]), new objj_method(sel_getUid("indexes"), function $CPIndexPath__indexes(self, _cmd)
{
    return ((___r1 = self._indexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("indexPathByAddingIndex:"), function $CPIndexPath__indexPathByAddingIndex_(self, _cmd, index)
{
    return CPIndexPath.isa.objj_msgSend1(CPIndexPath, "indexPathWithIndexes:", ((___r1 = self._indexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "arrayByAddingObject:", index)));
    var ___r1;
}
,["CPIndexPath","int"]), new objj_method(sel_getUid("indexPathByRemovingLastIndex"), function $CPIndexPath__indexPathByRemovingLastIndex(self, _cmd)
{
    return CPIndexPath.isa.objj_msgSend2(CPIndexPath, "indexPathWithIndexes:length:", self._indexes, self.isa.objj_msgSend0(self, "length") - 1);
}
,["CPIndexPath"]), new objj_method(sel_getUid("isEqual:"), function $CPIndexPath__isEqual_(self, _cmd, anObject)
{
    if (anObject === self)
        return YES;
    if ((anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "class")) !== CPIndexPath.isa.objj_msgSend0(CPIndexPath, "class"))
        return NO;
    return ((___r1 = self._indexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToArray:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "indexes"))));
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("compare:"), function $CPIndexPath__compare_(self, _cmd, anIndexPath)
{
    if (!anIndexPath)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "indexPath to " + self + " was nil");
    var lhsIndexes = self.isa.objj_msgSend0(self, "indexes"),
        rhsIndexes = (anIndexPath == null ? null : anIndexPath.isa.objj_msgSend0(anIndexPath, "indexes")),
        lhsCount = (lhsIndexes == null ? null : lhsIndexes.isa.objj_msgSend0(lhsIndexes, "count")),
        rhsCount = (rhsIndexes == null ? null : rhsIndexes.isa.objj_msgSend0(rhsIndexes, "count"));
    var index = 0,
        count = MIN(lhsCount, rhsCount);
    for (; index < count; ++index)
    {
        var lhs = lhsIndexes[index],
            rhs = rhsIndexes[index];
        if (lhs < rhs)
            return CPOrderedAscending;
        else if (lhs > rhs)
            return CPOrderedDescending;
    }
    if (lhsCount === rhsCount)
        return CPOrderedSame;
    if (lhsCount === count)
        return CPOrderedAscending;
    return CPOrderedDescending;
}
,["CPComparisonResult","CPIndexPath"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("indexPathWithIndex:"), function $CPIndexPath__indexPathWithIndex_(self, _cmd, index)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithIndexes:length:", [index], 1));
    var ___r1;
}
,["id","int"]), new objj_method(sel_getUid("indexPathWithIndexes:length:"), function $CPIndexPath__indexPathWithIndexes_length_(self, _cmd, indexes, length)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithIndexes:length:", indexes, length));
    var ___r1;
}
,["id","CPArray","int"]), new objj_method(sel_getUid("indexPathWithIndexes:"), function $CPIndexPath__indexPathWithIndexes_(self, _cmd, indexes)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIndexes:", indexes));
    var ___r1;
}
,["id","CPArray"])]);
}var CPIndexPathIndexesKey = "CPIndexPathIndexes";
{
var the_class = objj_getClass("CPIndexPath")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPIndexPath\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPIndexPath__initWithCoder_(self, _cmd, theCoder)
{
    if (self = (self == null ? null : self.isa.objj_msgSend0(self, "init")))
    {
        self._indexes = (theCoder == null ? null : theCoder.isa.objj_msgSend1(theCoder, "decodeObjectForKey:", CPIndexPathIndexesKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPIndexPath__encodeWithCoder_(self, _cmd, theCoder)
{
    (theCoder == null ? null : theCoder.isa.objj_msgSend2(theCoder, "encodeObject:forKey:", self._indexes, CPIndexPathIndexesKey));
}
,["void","CPCoder"])]);
}