@STATIC;1.0;I;25;AppKit/CPCollectionView.jt;1992;objj_executeFile("AppKit/CPCollectionView.j", NO);{
var the_class = objj_getClass("CPCollectionView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPCollectionView__NS_initWithCoder_(self, _cmd, aCoder)
{
    self._items = [];
    self._content = [];
    self._cachedItems = [];
    self._itemSize = CGSizeMakeZero();
    self._minItemSize = CGSizeMakeZero();
    self._maxItemSize = CGSizeMakeZero();
    self._verticalMargin = 5.0;
    self._tileWidth = -1.0;
    self._selectionIndexes = objj_msgSend(CPIndexSet, "indexSet");
    self._allowsEmptySelection = YES;
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionView").super_class }, "NS_initWithCoder:", aCoder))
    {
        self._backgroundColors = objj_msgSend(aCoder, "decodeObjectForKey:", "NSBackgroundColors");
        self._maxNumberOfRows = objj_msgSend(aCoder, "decodeIntForKey:", "NSMaxNumberOfGridRows");
        self._maxNumberOfColumns = objj_msgSend(aCoder, "decodeIntForKey:", "NSMaxNumberOfGridColumns");
        self._isSelectable = objj_msgSend(aCoder, "decodeBoolForKey:", "NSSelectable");
        self._allowsMultipleSelection = objj_msgSend(aCoder, "decodeBoolForKey:", "NSAllowsMultipleSelection");
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPCollectionView, "NSCollectionView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSCollectionView__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSCollectionView__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPCollectionView, "class");
}
,["Class"])]);
}