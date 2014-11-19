@STATIC;1.0;I;25;AppKit/CPCollectionView.jt;2230;objj_executeFile("AppKit/CPCollectionView.j", NO);{
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
    self._selectionIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    self._allowsEmptySelection = YES;
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionView").super_class }, "NS_initWithCoder:", aCoder))
    {
        self._backgroundColors = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSBackgroundColors"));
        self._maxNumberOfRows = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSMaxNumberOfGridRows"));
        self._maxNumberOfColumns = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSMaxNumberOfGridColumns"));
        self._isSelectable = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSSelectable"));
        self._allowsMultipleSelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSAllowsMultipleSelection"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPCollectionView, "NSCollectionView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSCollectionView__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSCollectionView__classForKeyedArchiver(self, _cmd)
{
    return CPCollectionView.isa.objj_msgSend0(CPCollectionView, "class");
}
,["Class"])]);
}