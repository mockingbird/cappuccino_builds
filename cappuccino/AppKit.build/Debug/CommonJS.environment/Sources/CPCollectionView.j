@STATIC;1.0;I;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;23;Foundation/CPIndexSet.jI;28;Foundation/CPKeyedArchiver.jI;30;Foundation/CPKeyedUnarchiver.ji;22;CPCollectionViewItem.ji;17;CPCompatibility.ji;24;CPDragServer_Constants.ji;14;CPPasteboard.ji;8;CPView.jt;63971;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPData.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("Foundation/CPKeyedArchiver.j", NO);objj_executeFile("Foundation/CPKeyedUnarchiver.j", NO);objj_executeFile("CPCollectionViewItem.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPDragServer_Constants.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPView.j", YES);var CPCollectionViewDelegate_collectionView_acceptDrop_index_dropOperation_ = 1 << 0,
    CPCollectionViewDelegate_collectionView_canDragItemsAtIndexes_withEvent_ = 1 << 1,
    CPCollectionViewDelegate_collectionView_writeItemsAtIndexes_toPasteboard_ = 1 << 2,
    CPCollectionViewDelegate_collectionView_dragTypesForItemsAtIndexes_ = 1 << 3,
    CPCollectionViewDelegate_collectionView_dataForItemsAtIndexes_forType_ = 1 << 4,
    CPCollectionViewDelegate_collectionView_validateDrop_proposedIndex_dropOperation_ = 1 << 5,
    CPCollectionViewDelegate_collectionView_didDoubleClickOnItemAtIndex_ = 1 << 6,
    CPCollectionViewDelegate_collectionViewDidChangeSelection_ = 1 << 7,
    CPCollectionViewDelegate_collectionView_menuForItemAtIndex_ = 1 << 8,
    CPCollectionViewDelegate_collectionView_draggingViewForItemsAtIndexes_withEvent_offset = 1 << 9;
{var the_protocol = objj_allocateProtocol("CPCollectionViewDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPCollectionViewDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}var HORIZONTAL_MARGIN = 2;
{var the_class = objj_allocateClassPair(CPView, "CPCollectionView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_content"), new objj_ivar("_items"), new objj_ivar("_itemData"), new objj_ivar("_itemPrototype"), new objj_ivar("_itemForDragging"), new objj_ivar("_cachedItems"), new objj_ivar("_maxNumberOfRows"), new objj_ivar("_maxNumberOfColumns"), new objj_ivar("_minItemSize"), new objj_ivar("_maxItemSize"), new objj_ivar("_backgroundColors"), new objj_ivar("_tileWidth"), new objj_ivar("_isSelectable"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_allowsEmptySelection"), new objj_ivar("_selectionIndexes"), new objj_ivar("_itemSize"), new objj_ivar("_horizontalMargin"), new objj_ivar("_verticalMargin"), new objj_ivar("_numberOfRows"), new objj_ivar("_numberOfColumns"), new objj_ivar("_delegate"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_mouseDownEvent"), new objj_ivar("_needsMinMaxItemSizeUpdate"), new objj_ivar("_storedFrameSize"), new objj_ivar("_uniformSubviewsResizing"), new objj_ivar("_lockResizing"), new objj_ivar("_currentDropIndex"), new objj_ivar("_currentDragOperation"), new objj_ivar("_dropView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("uniformSubviewsResizing"), function $CPCollectionView__uniformSubviewsResizing(self, _cmd)
{
    return self._uniformSubviewsResizing;
}
,["BOOL"]), new objj_method(sel_getUid("setUniformSubviewsResizing:"), function $CPCollectionView__setUniformSubviewsResizing_(self, _cmd, newValue)
{
    self._uniformSubviewsResizing = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("initWithFrame:"), function $CPCollectionView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._maxNumberOfRows = 0;
        self._maxNumberOfColumns = 0;
        self._minItemSize = CGSizeMakeZero();
        self._maxItemSize = CGSizeMakeZero();
        (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColors:", nil));
        self._verticalMargin = 5.0;
        self._isSelectable = YES;
        self._allowsEmptySelection = YES;
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPCollectionView___init(self, _cmd)
{
    self._content = [];
    self._items = [];
    self._cachedItems = [];
    self._numberOfColumns = CPNotFound;
    self._numberOfRows = CPNotFound;
    self._itemSize = CGSizeMakeZero();
    self._selectionIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    self._storedFrameSize = CGSizeMakeZero();
    self._needsMinMaxItemSizeUpdate = YES;
    self._uniformSubviewsResizing = NO;
    self._lockResizing = NO;
    self._currentDropIndex = -1;
    self._currentDragOperation = CPDragOperationNone;
    self._dropView = nil;
    self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", NO);
    self.isa.objj_msgSend1(self, "setAutoresizingMask:", 0);
}
,["void"]), new objj_method(sel_getUid("setDelegate:"), function $CPCollectionView__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionView:acceptDrop:index:dropOperation:"))))
        self._implementedDelegateMethods |= CPCollectionViewDelegate_collectionView_acceptDrop_index_dropOperation_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionView:canDragItemsAtIndexes:withEvent:"))))
        self._implementedDelegateMethods |= CPCollectionViewDelegate_collectionView_canDragItemsAtIndexes_withEvent_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionView:writeItemsAtIndexes:toPasteboard:"))))
        self._implementedDelegateMethods |= CPCollectionViewDelegate_collectionView_writeItemsAtIndexes_toPasteboard_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionView:dragTypesForItemsAtIndexes:"))))
        self._implementedDelegateMethods |= CPCollectionViewDelegate_collectionView_dragTypesForItemsAtIndexes_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionView:dataForItemsAtIndexes:forType:"))))
        self._implementedDelegateMethods |= CPCollectionViewDelegate_collectionView_dataForItemsAtIndexes_forType_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionView:validateDrop:proposedIndex:dropOperation:"))))
        self._implementedDelegateMethods |= CPCollectionViewDelegate_collectionView_validateDrop_proposedIndex_dropOperation_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"))))
        self._implementedDelegateMethods |= CPCollectionViewDelegate_collectionView_didDoubleClickOnItemAtIndex_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionViewDidChangeSelection:"))))
        self._implementedDelegateMethods |= CPCollectionViewDelegate_collectionViewDidChangeSelection_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionView:menuForItemAtIndex:"))))
        self._implementedDelegateMethods |= CPCollectionViewDelegate_collectionView_menuForItemAtIndex_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionView:draggingViewForItemsAtIndexes:withEvent:offset:"))))
        self._implementedDelegateMethods |= CPCollectionViewDelegate_collectionView_draggingViewForItemsAtIndexes_withEvent_offset;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setItemPrototype:"), function $CPCollectionView__setItemPrototype_(self, _cmd, anItem)
{
    self._cachedItems = [];
    self._itemData = nil;
    self._itemForDragging = nil;
    self._itemPrototype = anItem;
    self.isa.objj_msgSend1(self, "_reloadContentCachingRemovedItems:", NO);
}
,["void","CPCollectionViewItem"]), new objj_method(sel_getUid("itemPrototype"), function $CPCollectionView__itemPrototype(self, _cmd)
{
    return self._itemPrototype;
}
,["CPCollectionViewItem"]), new objj_method(sel_getUid("newItemForRepresentedObject:"), function $CPCollectionView__newItemForRepresentedObject_(self, _cmd, anObject)
{
    var item = nil;
    if (self._cachedItems.length)
        item = self._cachedItems.pop();
    else
        item = ((___r1 = self._itemPrototype), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    (item == null ? null : item.isa.objj_msgSend1(item, "setRepresentedObject:", anObject));
    ((___r1 = (item == null ? null : item.isa.objj_msgSend0(item, "view"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", self._itemSize));
    return item;
    var ___r1;
}
,["CPCollectionViewItem","id"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPCollectionView__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("isFirstResponder"), function $CPCollectionView__isFirstResponder(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) === self;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("setContent:"), function $CPCollectionView__setContent_(self, _cmd, anArray)
{
    self._content = anArray;
    self.isa.objj_msgSend0(self, "reloadContent");
}
,["void","CPArray"]), new objj_method(sel_getUid("content"), function $CPCollectionView__content(self, _cmd)
{
    return self._content;
}
,["CPArray"]), new objj_method(sel_getUid("items"), function $CPCollectionView__items(self, _cmd)
{
    return self._items;
}
,["CPArray"]), new objj_method(sel_getUid("setSelectable:"), function $CPCollectionView__setSelectable_(self, _cmd, isSelectable)
{
    if (self._isSelectable == isSelectable)
        return;
    self._isSelectable = isSelectable;
    if (!self._isSelectable)
    {
        var index = CPNotFound,
            itemCount = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        while ((index = ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexGreaterThanIndex:", index))) != CPNotFound && index < itemCount)
            ((___r1 = self._items[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSelected:", NO));
    }
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("isSelectable"), function $CPCollectionView__isSelectable(self, _cmd)
{
    return self._isSelectable;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsEmptySelection:"), function $CPCollectionView__setAllowsEmptySelection_(self, _cmd, shouldAllowEmptySelection)
{
    self._allowsEmptySelection = shouldAllowEmptySelection;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsEmptySelection"), function $CPCollectionView__allowsEmptySelection(self, _cmd)
{
    return self._allowsEmptySelection;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsMultipleSelection:"), function $CPCollectionView__setAllowsMultipleSelection_(self, _cmd, shouldAllowMultipleSelection)
{
    self._allowsMultipleSelection = shouldAllowMultipleSelection;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsMultipleSelection"), function $CPCollectionView__allowsMultipleSelection(self, _cmd)
{
    return self._allowsMultipleSelection;
}
,["BOOL"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $CPCollectionView__setSelectionIndexes_(self, _cmd, anIndexSet)
{
    if (!anIndexSet)
        anIndexSet = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    if (!self._isSelectable || ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", anIndexSet)))
        return;
    var index = CPNotFound,
        itemCount = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while ((index = ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexGreaterThanIndex:", index))) !== CPNotFound && index < itemCount)
        ((___r1 = self._items[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSelected:", NO));
    self._selectionIndexes = anIndexSet;
    var index = CPNotFound;
    while ((index = ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexGreaterThanIndex:", index))) !== CPNotFound)
        ((___r1 = self._items[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSelected:", YES));
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", "selectionIndexes"));
    ((___r1 = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", "selectionIndexes", self))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "reverseSetValueFor:", "selectionIndexes"));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionViewDidChangeSelection:"))))
    {
        CPLog.warn("The delegate method collectionViewDidChangeSelection: is deprecated and will be removed in a future version, please bind to selectionIndexes instead.");
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "collectionViewDidChangeSelection:", self));
    }
    var ___r1;
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("selectionIndexes"), function $CPCollectionView__selectionIndexes(self, _cmd)
{
    return ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    var ___r1;
}
,["CPIndexSet"]), new objj_method(sel_getUid("reloadContent"), function $CPCollectionView__reloadContent(self, _cmd)
{
    self.isa.objj_msgSend1(self, "_reloadContentCachingRemovedItems:", YES);
}
,["void"]), new objj_method(sel_getUid("_reloadContentCachingRemovedItems:"), function $CPCollectionView___reloadContentCachingRemovedItems_(self, _cmd, shouldCache)
{
    var count = self._items.length;
    while (count--)
    {
        ((___r1 = ((___r2 = self._items[count]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "view"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        ((___r1 = self._items[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSelected:", NO));
        if (shouldCache)
            self._cachedItems.push(self._items[count]);
    }
    self._items = [];
    if (!self._itemPrototype)
        return;
    var index = 0;
    count = self._content.length;
    for (; index < count; ++index)
    {
        self._items.push(self.isa.objj_msgSend1(self, "newItemForRepresentedObject:", self._content[index]));
        self.isa.objj_msgSend1(self, "addSubview:", ((___r1 = self._items[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view")));
    }
    index = CPNotFound;
    while ((index = ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexGreaterThanIndex:", index))) != CPNotFound && index < count)
        ((___r1 = self._items[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSelected:", YES));
    self.isa.objj_msgSend1(self, "tileIfNeeded:", NO);
    var ___r1, ___r2;
}
,["void","BOOL"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPCollectionView__resizeSubviewsWithOldSize_(self, _cmd, oldBoundsSize)
{
}
,["void","CGSize"]), new objj_method(sel_getUid("resizeWithOldSuperviewSize:"), function $CPCollectionView__resizeWithOldSuperviewSize_(self, _cmd, oldBoundsSize)
{
    if (self._lockResizing)
        return;
    self._lockResizing = YES;
    self.isa.objj_msgSend0(self, "tile");
    self._lockResizing = NO;
}
,["void","CGSize"]), new objj_method(sel_getUid("tile"), function $CPCollectionView__tile(self, _cmd)
{
    self.isa.objj_msgSend1(self, "tileIfNeeded:", !self._uniformSubviewsResizing);
}
,["void"]), new objj_method(sel_getUid("tileIfNeeded:"), function $CPCollectionView__tileIfNeeded_(self, _cmd, lazyFlag)
{
    var frameSize = ((___r1 = self.isa.objj_msgSend0(self, "superview")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")),
        count = self._items.length,
        oldNumberOfColumns = self._numberOfColumns,
        oldNumberOfRows = self._numberOfRows,
        oldItemSize = self._itemSize,
        storedFrameSize = self._storedFrameSize;
    if (!frameSize)
        return;
    self.isa.objj_msgSend0(self, "_updateMinMaxItemSizeIfNeeded");
    self.isa.objj_msgSend2(self, "_computeGridWithSize:count:", frameSize, function(__input) { if (arguments.length) return count = __input; return count; });
    self.isa.objj_msgSend1(self, "setFrameSize:", self._storedFrameSize);
    if (!lazyFlag || self._numberOfColumns !== oldNumberOfColumns || self._numberOfRows !== oldNumberOfRows || !CGSizeEqualToSize(self._itemSize, oldItemSize))
        self.isa.objj_msgSend(self, "displayItems:frameSize:itemSize:columns:rows:count:", self._items, self._storedFrameSize, self._itemSize, self._numberOfColumns, self._numberOfRows, count);
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("_computeGridWithSize:count:"), function $CPCollectionView___computeGridWithSize_count_(self, _cmd, aSuperviewSize, countRef)
{
    var width = aSuperviewSize.width,
        height = aSuperviewSize.height,
        itemSize = CGSizeMakeCopy(self._minItemSize),
        maxItemSizeWidth = self._maxItemSize.width,
        maxItemSizeHeight = self._maxItemSize.height,
        itemsCount = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        numberOfRows,
        numberOfColumns;
    numberOfColumns = FLOOR(width / itemSize.width);
    if (maxItemSizeWidth == 0)
        numberOfColumns = MIN(numberOfColumns, self._maxNumberOfColumns);
    if (self._maxNumberOfColumns > 0)
        numberOfColumns = MIN(MIN(self._maxNumberOfColumns, itemsCount), numberOfColumns);
    numberOfColumns = MAX(1.0, numberOfColumns);
    itemSize.width = FLOOR(width / numberOfColumns);
    if (maxItemSizeWidth > 0)
    {
        itemSize.width = MIN(maxItemSizeWidth, itemSize.width);
        if (numberOfColumns == 1)
            itemSize.width = MIN(maxItemSizeWidth, width);
    }
    numberOfRows = CEIL(itemsCount / numberOfColumns);
    if (self._maxNumberOfRows > 0)
        numberOfRows = MIN(numberOfRows, self._maxNumberOfRows);
    height = MAX(height, numberOfRows * (self._minItemSize.height + self._verticalMargin));
    var itemSizeHeight = FLOOR(height / numberOfRows);
    if (maxItemSizeHeight > 0)
        itemSizeHeight = MIN(itemSizeHeight, maxItemSizeHeight);
    self._itemSize = CGSizeMake(MAX(self._minItemSize.width, itemSize.width), MAX(self._minItemSize.height, itemSizeHeight));
    self._storedFrameSize = CGSizeMake(MAX(width, self._minItemSize.width), height);
    self._numberOfColumns = numberOfColumns;
    self._numberOfRows = numberOfRows;
    countRef(MIN(itemsCount, numberOfColumns * numberOfRows));
    var ___r1;
}
,["void","CGSize","Function"]), new objj_method(sel_getUid("displayItems:frameSize:itemSize:columns:rows:count:"), function $CPCollectionView__displayItems_frameSize_itemSize_columns_rows_count_(self, _cmd, displayItems, aFrameSize, anItemSize, numberOfColumns, numberOfRows, displayCount)
{
    self._horizontalMargin = self._uniformSubviewsResizing ? FLOOR((aFrameSize.width - numberOfColumns * anItemSize.width) / (numberOfColumns + 1)) : HORIZONTAL_MARGIN;
    var x = self._horizontalMargin,
        y = -anItemSize.height;
    (displayItems == null ? null : displayItems.isa.objj_msgSend1(displayItems, "enumerateObjectsUsingBlock:", function(item, idx, stop)
    {
        var view = (item == null ? null : item.isa.objj_msgSend0(item, "view"));
        if (idx >= displayCount)
        {
            (view == null ? null : view.isa.objj_msgSend1(view, "setFrameOrigin:", CGPointMake(-anItemSize.width, -anItemSize.height)));
            return;
        }
        if (idx % numberOfColumns == 0)
        {
            x = self._horizontalMargin;
            y += self._verticalMargin + anItemSize.height;
        }
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrameOrigin:", CGPointMake(x, y)));
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrameSize:", anItemSize));
        x += anItemSize.width + self._horizontalMargin;
    }));
}
,["void","CPArray","CGSize","CGSize","CPInteger","CPInteger","CPInteger"]), new objj_method(sel_getUid("_updateMinMaxItemSizeIfNeeded"), function $CPCollectionView___updateMinMaxItemSizeIfNeeded(self, _cmd)
{
    if (!self._needsMinMaxItemSizeUpdate)
        return;
    var prototypeView;
    if (self._itemPrototype && (prototypeView = ((___r1 = self._itemPrototype), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view"))))
    {
        if (self._minItemSize.width == 0)
            self._minItemSize.width = (prototypeView == null ? null : prototypeView.isa.objj_msgSend0(prototypeView, "frameSize")).width;
        if (self._minItemSize.height == 0)
            self._minItemSize.height = (prototypeView == null ? null : prototypeView.isa.objj_msgSend0(prototypeView, "frameSize")).height;
        if (self._maxItemSize.height == 0 && !((prototypeView == null ? null : prototypeView.isa.objj_msgSend0(prototypeView, "autoresizingMask")) & CPViewHeightSizable))
            self._maxItemSize.height = (prototypeView == null ? null : prototypeView.isa.objj_msgSend0(prototypeView, "frameSize")).height;
        if (self._maxItemSize.width == 0 && !((prototypeView == null ? null : prototypeView.isa.objj_msgSend0(prototypeView, "autoresizingMask")) & CPViewWidthSizable))
            self._maxItemSize.width = (prototypeView == null ? null : prototypeView.isa.objj_msgSend0(prototypeView, "frameSize")).width;
        self._needsMinMaxItemSizeUpdate = NO;
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setMaxNumberOfRows:"), function $CPCollectionView__setMaxNumberOfRows_(self, _cmd, aMaxNumberOfRows)
{
    if (self._maxNumberOfRows == aMaxNumberOfRows)
        return;
    self._maxNumberOfRows = aMaxNumberOfRows;
    self.isa.objj_msgSend0(self, "tile");
}
,["void","unsigned"]), new objj_method(sel_getUid("maxNumberOfRows"), function $CPCollectionView__maxNumberOfRows(self, _cmd)
{
    return self._maxNumberOfRows;
}
,["unsigned"]), new objj_method(sel_getUid("setMaxNumberOfColumns:"), function $CPCollectionView__setMaxNumberOfColumns_(self, _cmd, aMaxNumberOfColumns)
{
    if (self._maxNumberOfColumns == aMaxNumberOfColumns)
        return;
    self._maxNumberOfColumns = aMaxNumberOfColumns;
    self.isa.objj_msgSend0(self, "tile");
}
,["void","unsigned"]), new objj_method(sel_getUid("maxNumberOfColumns"), function $CPCollectionView__maxNumberOfColumns(self, _cmd)
{
    return self._maxNumberOfColumns;
}
,["unsigned"]), new objj_method(sel_getUid("numberOfRows"), function $CPCollectionView__numberOfRows(self, _cmd)
{
    return self._numberOfRows;
}
,["unsigned"]), new objj_method(sel_getUid("numberOfColumns"), function $CPCollectionView__numberOfColumns(self, _cmd)
{
    return self._numberOfColumns;
}
,["unsigned"]), new objj_method(sel_getUid("setMinItemSize:"), function $CPCollectionView__setMinItemSize_(self, _cmd, aSize)
{
    if (aSize === nil || aSize === undefined)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid value provided for minimum size");
    if (CGSizeEqualToSize(self._minItemSize, aSize))
        return;
    self._minItemSize = CGSizeMakeCopy(aSize);
    if (CGSizeEqualToSize(self._minItemSize, CGSizeMakeZero()))
        self._needsMinMaxItemSizeUpdate = YES;
    self.isa.objj_msgSend0(self, "tile");
}
,["void","CGSize"]), new objj_method(sel_getUid("minItemSize"), function $CPCollectionView__minItemSize(self, _cmd)
{
    return self._minItemSize;
}
,["CGSize"]), new objj_method(sel_getUid("setMaxItemSize:"), function $CPCollectionView__setMaxItemSize_(self, _cmd, aSize)
{
    if (CGSizeEqualToSize(self._maxItemSize, aSize))
        return;
    self._maxItemSize = CGSizeMakeCopy(aSize);
    self.isa.objj_msgSend0(self, "tile");
}
,["void","CGSize"]), new objj_method(sel_getUid("maxItemSize"), function $CPCollectionView__maxItemSize(self, _cmd)
{
    return self._maxItemSize;
}
,["CGSize"]), new objj_method(sel_getUid("setBackgroundColors:"), function $CPCollectionView__setBackgroundColors_(self, _cmd, backgroundColors)
{
    if (self._backgroundColors === backgroundColors)
        return;
    self._backgroundColors = backgroundColors;
    if (!self._backgroundColors)
        self._backgroundColors = [CPColor.isa.objj_msgSend0(CPColor, "whiteColor")];
    if (((___r1 = self._backgroundColors), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) === 1)
        self.isa.objj_msgSend1(self, "setBackgroundColor:", self._backgroundColors[0]);
    else
        self.isa.objj_msgSend1(self, "setBackgroundColor:", nil);
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("backgroundColors"), function $CPCollectionView__backgroundColors(self, _cmd)
{
    return self._backgroundColors;
}
,["CPArray"]), new objj_method(sel_getUid("mouseUp:"), function $CPCollectionView__mouseUp_(self, _cmd, anEvent)
{
    if (((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) && (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "clickCount")) == 2)
        self.isa.objj_msgSend1(self, "_sendDelegateDidDoubleClickOnItemAtIndex:", ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPCollectionView__mouseDown_(self, _cmd, anEvent)
{
    self._mouseDownEvent = anEvent;
    var location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil),
        index = self.isa.objj_msgSend1(self, "_indexAtPoint:", location);
    if (index >= 0 && index < self._items.length)
    {
        if (self._allowsMultipleSelection && ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")) & CPPlatformActionKeyMask || (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")) & CPShiftKeyMask))
        {
            if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")) & CPPlatformActionKeyMask)
            {
                var indexes = ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
                if ((indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "containsIndex:", index)))
                    (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "removeIndex:", index));
                else
                    (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "addIndex:", index));
            }
            else if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")) & CPShiftKeyMask)
            {
                var firstSelectedIndex = ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")),
                    newSelectedRange = nil;
                if (firstSelectedIndex === CPNotFound)
                    firstSelectedIndex = index;
                if (index < firstSelectedIndex)
                    newSelectedRange = CPMakeRange(index, firstSelectedIndex - index + 1);
                else
                    newSelectedRange = CPMakeRange(firstSelectedIndex, index - firstSelectedIndex + 1);
                indexes = ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
                (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "addIndexesInRange:", newSelectedRange));
            }
        }
        else
            indexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", index);
        self.isa.objj_msgSend1(self, "setSelectionIndexes:", indexes);
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self));
    }
    else if (self._allowsEmptySelection)
        self.isa.objj_msgSend1(self, "setSelectionIndexes:", CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("setVerticalMargin:"), function $CPCollectionView__setVerticalMargin_(self, _cmd, aVerticalMargin)
{
    if (self._verticalMargin == aVerticalMargin)
        return;
    self._verticalMargin = aVerticalMargin;
    self.isa.objj_msgSend0(self, "tile");
}
,["void","float"]), new objj_method(sel_getUid("setUniformSubviewsResizing:"), function $CPCollectionView__setUniformSubviewsResizing_(self, _cmd, flag)
{
    self._uniformSubviewsResizing = flag;
    self.isa.objj_msgSend1(self, "tileIfNeeded:", NO);
}
,["void","BOOL"]), new objj_method(sel_getUid("verticalMargin"), function $CPCollectionView__verticalMargin(self, _cmd)
{
    return self._verticalMargin;
}
,["float"]), new objj_method(sel_getUid("delegate"), function $CPCollectionView__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("menuForEvent:"), function $CPCollectionView__menuForEvent_(self, _cmd, theEvent)
{
    if (!self.isa.objj_msgSend0(self, "_delegateRespondsToCollectionViewMenuForItemAtIndex"))
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionView").super_class }, "menuForEvent:", theEvent);
    var location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (theEvent == null ? null : theEvent.isa.objj_msgSend0(theEvent, "locationInWindow")), nil),
        index = self.isa.objj_msgSend1(self, "_indexAtPoint:", location);
    return self.isa.objj_msgSend1(self, "_sendDelegateMenuForItemAtIndex:", index);
}
,["CPMenu","CPEvent"]), new objj_method(sel_getUid("_indexAtPoint:"), function $CPCollectionView___indexAtPoint_(self, _cmd, thePoint)
{
    var column = FLOOR(thePoint.x / (self._itemSize.width + self._horizontalMargin));
    if (column < self._numberOfColumns)
    {
        var row = FLOOR(thePoint.y / (self._itemSize.height + self._verticalMargin));
        if (row < self._numberOfRows)
            return row * self._numberOfColumns + column;
    }
    return CPNotFound;
}
,["int","CGPoint"]), new objj_method(sel_getUid("itemAtIndex:"), function $CPCollectionView__itemAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", anIndex));
    var ___r1;
}
,["CPCollectionViewItem","CPUInteger"]), new objj_method(sel_getUid("frameForItemAtIndex:"), function $CPCollectionView__frameForItemAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend1(self, "itemAtIndex:", anIndex)), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "view"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    var ___r1, ___r2;
}
,["CGRect","CPUInteger"]), new objj_method(sel_getUid("frameForItemsAtIndexes:"), function $CPCollectionView__frameForItemsAtIndexes_(self, _cmd, anIndexSet)
{
    var indexArray = [],
        frame = CGRectNull;
    (anIndexSet == null ? null : anIndexSet.isa.objj_msgSend3(anIndexSet, "getIndexes:maxCount:inIndexRange:", indexArray, -1, nil));
    var index = 0,
        count = (indexArray == null ? null : indexArray.isa.objj_msgSend0(indexArray, "count"));
    for (; index < count; ++index)
        frame = CGRectUnion(frame, self.isa.objj_msgSend1(self, "frameForItemAtIndex:", indexArray[index]));
    return frame;
}
,["CGRect","CPIndexSet"])]);
}{
var the_class = objj_getClass("CPCollectionView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $CPCollectionView__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{
    (aPasteboard == null ? null : aPasteboard.isa.objj_msgSend2(aPasteboard, "setData:forType:", self.isa.objj_msgSend2(self, "_sendDelegateDataForItemsAtIndexes:forType:", self._selectionIndexes, aType), aType));
}
,["void","CPPasteboard","CPString"]), new objj_method(sel_getUid("_createDropIndicatorIfNeeded"), function $CPCollectionView___createDropIndicatorIfNeeded(self, _cmd)
{
    if (!self._dropView)
        self._dropView = ((___r1 = (_CPCollectionViewDropIndicator == null ? null : _CPCollectionViewDropIndicator.isa.objj_msgSend0(_CPCollectionViewDropIndicator, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(-8, -8, 0, 0)));
    ((___r1 = self._dropView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(10, self._itemSize.height + self._verticalMargin)));
    self.isa.objj_msgSend1(self, "addSubview:", self._dropView);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("mouseDragged:"), function $CPCollectionView__mouseDragged_(self, _cmd, anEvent)
{
    if (!self._mouseDownEvent)
        return;
    self.isa.objj_msgSend0(self, "_createDropIndicatorIfNeeded");
    var locationInWindow = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")),
        mouseDownLocationInWindow = ((___r1 = self._mouseDownEvent), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "locationInWindow"));
    if (ABS(locationInWindow.x - mouseDownLocationInWindow.x) < 3 && ABS(locationInWindow.y - mouseDownLocationInWindow.y) < 3)
        return;
    if (!self.isa.objj_msgSend0(self, "_delegateRespondsToCollectionViewDragTypesForItemsAtIndexes"))
        return;
    if (!((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        return;
    if (!self.isa.objj_msgSend2(self, "_sendDelegateCanDragItemsAtIndexes:withEvent:", self._selectionIndexes, self._mouseDownEvent))
        return;
    var dragTypes = self.isa.objj_msgSend1(self, "_sendDelegateDragTypesForItemsAtIndexes:", self._selectionIndexes);
    ((___r1 = CPPasteboard.isa.objj_msgSend1(CPPasteboard, "pasteboardWithName:", CPDragPboard)), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "declareTypes:owner:", dragTypes, self));
    var dragImageOffset = CGSizeMakeZero(),
        view = self.isa.objj_msgSend3(self, "_sendDelegateDraggingViewForItemsAtIndexes:withEvent:offset:", self._selectionIndexes, self._mouseDownEvent, dragImageOffset);
    (view == null ? null : view.isa.objj_msgSend1(view, "setFrameSize:", self._itemSize));
    (view == null ? null : view.isa.objj_msgSend1(view, "setAlphaValue:", 0.7));
    var dragLocation = self.isa.objj_msgSend2(self, "convertPoint:fromView:", locationInWindow, nil),
        dragPoint = CGPointMake(dragLocation.x - self._itemSize.width / 2, dragLocation.y - self._itemSize.height / 2);
    self.isa.objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", view, dragPoint, dragImageOffset, self._mouseDownEvent, nil, self, YES);
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("draggingViewForItemsAtIndexes:withEvent:offset:"), function $CPCollectionView__draggingViewForItemsAtIndexes_withEvent_offset_(self, _cmd, indexes, event, dragImageOffset)
{
    var idx = self._content[(indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "firstIndex"))];
    if (!self._itemForDragging)
        self._itemForDragging = self.isa.objj_msgSend1(self, "newItemForRepresentedObject:", idx);
    else
        ((___r1 = self._itemForDragging), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setRepresentedObject:", idx));
    return ((___r1 = self._itemForDragging), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view"));
    var ___r1;
}
,["CPView","CPIndexSet","CPEvent","CGPoint"]), new objj_method(sel_getUid("draggingEntered:"), function $CPCollectionView__draggingEntered_(self, _cmd, draggingInfo)
{
    var dropIndex = -1,
        dropIndexRef = function(__input) { if (arguments.length) return dropIndex = __input; return dropIndex; },
        dragOp = self.isa.objj_msgSend3(self, "_validateDragWithInfo:dropIndex:dropOperation:", draggingInfo, dropIndexRef, 1);
    dropIndex = dropIndexRef();
    self.isa.objj_msgSend0(self, "_createDropIndicatorIfNeeded");
    self.isa.objj_msgSend(self, "_updateDragAndDropStateWithDraggingInfo:newDragOperation:newDropIndex:newDropOperation:", draggingInfo, dragOp, dropIndex, 1);
    return self._currentDragOperation;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("draggingUpdated:"), function $CPCollectionView__draggingUpdated_(self, _cmd, draggingInfo)
{
    if (!self.isa.objj_msgSend1(self, "_dropIndexDidChange:", draggingInfo))
        return self._currentDragOperation;
    var dropIndex,
        dropIndexRef = function(__input) { if (arguments.length) return dropIndex = __input; return dropIndex; };
    var dragOperation = self.isa.objj_msgSend3(self, "_validateDragWithInfo:dropIndex:dropOperation:", draggingInfo, dropIndexRef, 1);
    dropIndex = dropIndexRef();
    self.isa.objj_msgSend(self, "_updateDragAndDropStateWithDraggingInfo:newDragOperation:newDropIndex:newDropOperation:", draggingInfo, dragOperation, dropIndex, 1);
    return dragOperation;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("_validateDragWithInfo:dropIndex:dropOperation:"), function $CPCollectionView___validateDragWithInfo_dropIndex_dropOperation_(self, _cmd, draggingInfo, dropIndexRef, dropOperation)
{
    var result = CPDragOperationMove,
        dropIndex = self.isa.objj_msgSend2(self, "_dropIndexForDraggingInfo:proposedDropOperation:", draggingInfo, dropOperation);
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToCollectionViewValidateDropProposedIndexDropOperation"))
    {
        var dropIndexRef2 = function(__input) { if (arguments.length) return dropIndex = __input; return dropIndex; };
        result = self.isa.objj_msgSend3(self, "_sendDelegateValidateDrop:proposedIndex:dropOperation:", draggingInfo, dropIndexRef2, dropOperation);
        if (result !== CPDragOperationNone)
            dropIndex = dropIndexRef2();
    }
    dropIndexRef(dropIndex);
    return result;
}
,["CPDragOperation","id","Function","int"]), new objj_method(sel_getUid("draggingExited:"), function $CPCollectionView__draggingExited_(self, _cmd, draggingInfo)
{
    self.isa.objj_msgSend(self, "_updateDragAndDropStateWithDraggingInfo:newDragOperation:newDropIndex:newDropOperation:", draggingInfo, 0, -1, 1);
}
,["void","id"]), new objj_method(sel_getUid("draggingEnded:"), function $CPCollectionView__draggingEnded_(self, _cmd, draggingInfo)
{
    self.isa.objj_msgSend(self, "_updateDragAndDropStateWithDraggingInfo:newDragOperation:newDropIndex:newDropOperation:", draggingInfo, 0, -1, 1);
}
,["void","id"]), new objj_method(sel_getUid("performDragOperation:"), function $CPCollectionView__performDragOperation_(self, _cmd, draggingInfo)
{
    var result = NO;
    if (self._currentDragOperation && self._currentDropIndex !== -1)
        result = self.isa.objj_msgSend3(self, "_sendDelegateAcceptDrop:index:dropOperation:", draggingInfo, self._currentDropIndex, 1);
    self.isa.objj_msgSend1(self, "draggingEnded:", draggingInfo);
    return result;
}
,["BOOL","id"]), new objj_method(sel_getUid("_updateDragAndDropStateWithDraggingInfo:newDragOperation:newDropIndex:newDropOperation:"), function $CPCollectionView___updateDragAndDropStateWithDraggingInfo_newDragOperation_newDropIndex_newDropOperation_(self, _cmd, draggingInfo, dragOperation, dropIndex, dropOperation)
{
    self._currentDropIndex = dropIndex;
    self._currentDragOperation = dragOperation;
    var frameOrigin,
        dropviewFrameWidth = CGRectGetWidth(((___r1 = self._dropView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
    if (self._currentDropIndex == -1 || self._currentDragOperation == CPDragOperationNone)
        frameOrigin = CGPointMake(-dropviewFrameWidth, 0);
    else if (self._currentDropIndex == 0)
        frameOrigin = CGPointMake(0, 0);
    else
    {
        var offset;
        if (self._currentDropIndex % self._numberOfColumns !== 0 || self._currentDropIndex == ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        {
            dropIndex = self._currentDropIndex - 1;
            offset = (self._horizontalMargin - dropviewFrameWidth) / 2;
        }
        else
        {
            offset = -self._itemSize.width - dropviewFrameWidth - (self._horizontalMargin - dropviewFrameWidth) / 2;
        }
        var rect = self.isa.objj_msgSend1(self, "frameForItemAtIndex:", dropIndex);
        frameOrigin = CGPointMake(CGRectGetMaxX(rect) + offset, rect.origin.y - self._verticalMargin);
    }
    ((___r1 = self._dropView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", frameOrigin));
    var ___r1;
}
,["void","id","CPDragOperation","CPInteger","CPInteger"]), new objj_method(sel_getUid("_dropIndexDidChange:"), function $CPCollectionView___dropIndexDidChange_(self, _cmd, draggingInfo)
{
    var dropIndex = self.isa.objj_msgSend2(self, "_dropIndexForDraggingInfo:proposedDropOperation:", draggingInfo, 1);
    if (dropIndex == CPNotFound)
        dropIndex = ((___r1 = self.isa.objj_msgSend0(self, "content")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    return self._currentDropIndex !== dropIndex;
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("_dropIndexForDraggingInfo:proposedDropOperation:"), function $CPCollectionView___dropIndexForDraggingInfo_proposedDropOperation_(self, _cmd, draggingInfo, dropOperation)
{
    var location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (draggingInfo == null ? null : draggingInfo.isa.objj_msgSend0(draggingInfo, "draggingLocation")), nil),
        locationX = location.x + self._itemSize.width / 2;
    var column = MIN(FLOOR(locationX / (self._itemSize.width + self._horizontalMargin)), self._numberOfColumns),
        row = FLOOR(location.y / (self._itemSize.height + self._verticalMargin));
    if (row >= self._numberOfRows - 1)
    {
        if (row >= self._numberOfRows)
        {
            row = self._numberOfRows - 1;
            column = self._numberOfColumns;
        }
        return MIN(row * self._numberOfColumns + column, ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")));
    }
    return row * self._numberOfColumns + column;
    var ___r1;
}
,["CPInteger","id","int"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPCollectionViewDropIndicator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawRect:"), function $_CPCollectionViewDropIndicator__drawRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        width = CGRectGetWidth(aRect),
        circleRect = CGRectMake(1, 1, width - 2, width - 2);
    CGContextSetStrokeColor(context, CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", "4886ca"));
    CGContextSetFillColor(context, CPColor.isa.objj_msgSend0(CPColor, "whiteColor"));
    CGContextSetLineWidth(context, 3);
    CGContextFillRect(context, circleRect);
    CGContextStrokeEllipseInRect(context, circleRect);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, FLOOR(width / 2), CGRectGetMinY(aRect) + width);
    CGContextAddLineToPoint(context, FLOOR(width / 2), CGRectGetHeight(aRect));
    CGContextStrokePath(context);
    var ___r1;
}
,["void","CGRect"])]);
}{
var the_class = objj_getClass("CPCollectionView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_modifySelectionWithNewIndex:direction:expand:"), function $CPCollectionView___modifySelectionWithNewIndex_direction_expand_(self, _cmd, anIndex, aDirection, shouldExpand)
{
    var count = ((___r1 = self.isa.objj_msgSend0(self, "items")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    if (count === 0)
        return;
    anIndex = MIN(MAX(anIndex, 0), count - 1);
    if (self._allowsMultipleSelection && shouldExpand)
    {
        var indexes = ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy")),
            bottomAnchor = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "firstIndex")),
            topAnchor = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "lastIndex"));
        if (aDirection === -1)
            (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "addIndexesInRange:", CPMakeRange(anIndex, bottomAnchor - anIndex + 1)));
        else
            (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "addIndexesInRange:", CPMakeRange(topAnchor, anIndex - topAnchor + 1)));
    }
    else
        indexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex);
    self.isa.objj_msgSend1(self, "setSelectionIndexes:", indexes);
    self.isa.objj_msgSend0(self, "_scrollToSelection");
    var ___r1;
}
,["void","int","int","BOOL"]), new objj_method(sel_getUid("_scrollToSelection"), function $CPCollectionView___scrollToSelection(self, _cmd)
{
    var frame = self.isa.objj_msgSend1(self, "frameForItemsAtIndexes:", self.isa.objj_msgSend0(self, "selectionIndexes"));
    if (!CGRectIsEmpty(frame))
        self.isa.objj_msgSend1(self, "scrollRectToVisible:", frame);
}
,["void"]), new objj_method(sel_getUid("moveLeft:"), function $CPCollectionView__moveLeft_(self, _cmd, sender)
{
    var index = ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex"));
    if (index === CPNotFound)
        index = ((___r1 = self.isa.objj_msgSend0(self, "items")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    self.isa.objj_msgSend3(self, "_modifySelectionWithNewIndex:direction:expand:", index - 1, -1, NO);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("moveLeftAndModifySelection:"), function $CPCollectionView__moveLeftAndModifySelection_(self, _cmd, sender)
{
    var index = ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex"));
    if (index === CPNotFound)
        index = ((___r1 = self.isa.objj_msgSend0(self, "items")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    self.isa.objj_msgSend3(self, "_modifySelectionWithNewIndex:direction:expand:", index - 1, -1, YES);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("moveRight:"), function $CPCollectionView__moveRight_(self, _cmd, sender)
{
    self.isa.objj_msgSend3(self, "_modifySelectionWithNewIndex:direction:expand:", ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex")) + 1, 1, NO);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("moveRightAndModifySelection:"), function $CPCollectionView__moveRightAndModifySelection_(self, _cmd, sender)
{
    self.isa.objj_msgSend3(self, "_modifySelectionWithNewIndex:direction:expand:", ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex")) + 1, 1, YES);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("moveDown:"), function $CPCollectionView__moveDown_(self, _cmd, sender)
{
    self.isa.objj_msgSend3(self, "_modifySelectionWithNewIndex:direction:expand:", ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex")) + self.isa.objj_msgSend0(self, "numberOfColumns"), 1, NO);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("moveDownAndModifySelection:"), function $CPCollectionView__moveDownAndModifySelection_(self, _cmd, sender)
{
    self.isa.objj_msgSend3(self, "_modifySelectionWithNewIndex:direction:expand:", ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex")) + self.isa.objj_msgSend0(self, "numberOfColumns"), 1, YES);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("moveUp:"), function $CPCollectionView__moveUp_(self, _cmd, sender)
{
    var index = ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex"));
    if (index == CPNotFound)
        index = ((___r1 = self.isa.objj_msgSend0(self, "items")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    self.isa.objj_msgSend3(self, "_modifySelectionWithNewIndex:direction:expand:", index - self.isa.objj_msgSend0(self, "numberOfColumns"), -1, NO);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("moveUpAndModifySelection:"), function $CPCollectionView__moveUpAndModifySelection_(self, _cmd, sender)
{
    var index = ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex"));
    if (index == CPNotFound)
        index = ((___r1 = self.isa.objj_msgSend0(self, "items")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    self.isa.objj_msgSend3(self, "_modifySelectionWithNewIndex:direction:expand:", index - self.isa.objj_msgSend0(self, "numberOfColumns"), -1, YES);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("deleteBackward:"), function $CPCollectionView__deleteBackward_(self, _cmd, sender)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("collectionView:shouldDeleteItemsAtIndexes:"))))
    {
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "collectionView:shouldDeleteItemsAtIndexes:", self, self.isa.objj_msgSend0(self, "selectionIndexes")));
        var index = ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex"));
        if (index > ((___r1 = self.isa.objj_msgSend0(self, "content")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1)
            self.isa.objj_msgSend1(self, "setSelectionIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", ((___r1 = self.isa.objj_msgSend0(self, "content")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1));
        self.isa.objj_msgSend0(self, "_scrollToSelection");
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("keyDown:"), function $CPCollectionView__keyDown_(self, _cmd, anEvent)
{
    self.isa.objj_msgSend1(self, "interpretKeyEvents:", [anEvent]);
}
,["void","CPEvent"]), new objj_method(sel_getUid("setAutoresizingMask:"), function $CPCollectionView__setAutoresizingMask_(self, _cmd, aMask)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionView").super_class }, "setAutoresizingMask:", 0);
}
,["void","unsigned"])]);
}{
var the_class = objj_getClass("CPCollectionView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("rectForItemAtIndex:"), function $CPCollectionView__rectForItemAtIndex_(self, _cmd, anIndex)
{
    _CPReportLenientDeprecation(self.isa.objj_msgSend0(self, "class"), _cmd, sel_getUid("frameForItemAtIndex:"));
    return self.isa.objj_msgSend1(self, "frameForItemAtIndex:", anIndex);
}
,["CGRect","int"]), new objj_method(sel_getUid("rectForItemsAtIndexes:"), function $CPCollectionView__rectForItemsAtIndexes_(self, _cmd, anIndexSet)
{
    _CPReportLenientDeprecation(self.isa.objj_msgSend0(self, "class"), _cmd, sel_getUid("frameForItemsAtIndexes:"));
    return self.isa.objj_msgSend1(self, "frameForItemsAtIndexes:", anIndexSet);
}
,["CGRect","CPIndexSet"])]);
}{
var the_class = objj_getClass("CPCollectionView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_delegateRespondsToCollectionViewValidateDropProposedIndexDropOperation"), function $CPCollectionView___delegateRespondsToCollectionViewValidateDropProposedIndexDropOperation(self, _cmd)
{
    return self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_validateDrop_proposedIndex_dropOperation_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToCollectionViewMenuForItemAtIndex"), function $CPCollectionView___delegateRespondsToCollectionViewMenuForItemAtIndex(self, _cmd)
{
    return self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_menuForItemAtIndex_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToCollectionViewDragTypesForItemsAtIndexes"), function $CPCollectionView___delegateRespondsToCollectionViewDragTypesForItemsAtIndexes(self, _cmd)
{
    return self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_dragTypesForItemsAtIndexes_;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateAcceptDrop:index:dropOperation:"), function $CPCollectionView___sendDelegateAcceptDrop_index_dropOperation_(self, _cmd, draggingInfo, index, dropOperation)
{
    if (!(self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_acceptDrop_index_dropOperation_))
        return NO;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "collectionView:acceptDrop:index:dropOperation:", self, draggingInfo, index, dropOperation));
    var ___r1;
}
,["BOOL","id","CPInteger","CPCollectionViewDropOperation"]), new objj_method(sel_getUid("_sendDelegateCanDragItemsAtIndexes:withEvent:"), function $CPCollectionView___sendDelegateCanDragItemsAtIndexes_withEvent_(self, _cmd, indexes, anEvent)
{
    if (!(self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_canDragItemsAtIndexes_withEvent_))
        return YES;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "collectionView:canDragItemsAtIndexes:withEvent:", self, indexes, anEvent));
    var ___r1;
}
,["BOOL","CPIndexSet","CPEvent"]), new objj_method(sel_getUid("_sendDelegateWriteItemsAtIndexes:toPasteboard:"), function $CPCollectionView___sendDelegateWriteItemsAtIndexes_toPasteboard_(self, _cmd, indexes, pasteboard)
{
    if (!(self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_writeItemsAtIndexes_toPasteboard_))
        return NO;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "collectionView:writeItemsAtIndexes:toPasteboard:", self, indexes, pasteboard));
    var ___r1;
}
,["BOOL","CPIndexSet","CPPasteboard"]), new objj_method(sel_getUid("_sendDelegateDragTypesForItemsAtIndexes:"), function $CPCollectionView___sendDelegateDragTypesForItemsAtIndexes_(self, _cmd, indexes)
{
    if (!(self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_dragTypesForItemsAtIndexes_))
        return [];
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "collectionView:dragTypesForItemsAtIndexes:", self, indexes));
    var ___r1;
}
,["CPArray","CPIndexSet"]), new objj_method(sel_getUid("_sendDelegateDataForItemsAtIndexes:forType:"), function $CPCollectionView___sendDelegateDataForItemsAtIndexes_forType_(self, _cmd, indexes, aType)
{
    if (!(self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_dataForItemsAtIndexes_forType_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "collectionView:dataForItemsAtIndexes:forType:", self, indexes, aType));
    var ___r1;
}
,["CPData","CPIndexSet","CPString"]), new objj_method(sel_getUid("_sendDelegateValidateDrop:proposedIndex:dropOperation:"), function $CPCollectionView___sendDelegateValidateDrop_proposedIndex_dropOperation_(self, _cmd, draggingInfo, proposedDropIndex, proposedDropOperation)
{
    if (!(self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_validateDrop_proposedIndex_dropOperation_))
        return CPDragOperationNone;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "collectionView:validateDrop:proposedIndex:dropOperation:", self, draggingInfo, proposedDropIndex, proposedDropOperation));
    var ___r1;
}
,["CPDragOperation","id","CPInteger","CPCollectionViewDropOperation"]), new objj_method(sel_getUid("_sendDelegateDidDoubleClickOnItemAtIndex:"), function $CPCollectionView___sendDelegateDidDoubleClickOnItemAtIndex_(self, _cmd, index)
{
    if (!(self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_didDoubleClickOnItemAtIndex_))
        return;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "collectionView:didDoubleClickOnItemAtIndex:", self, index));
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("_sendDelegateCollectionViewDidChangeSelection:"), function $CPCollectionView___sendDelegateCollectionViewDidChangeSelection_(self, _cmd, collectionView)
{
    if (!(self._implementedDelegateMethods & CPCollectionViewDelegate_collectionViewDidChangeSelection_))
        return;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "collectionViewDidChangeSelection:", self));
    var ___r1;
}
,["void","CPCollectionView"]), new objj_method(sel_getUid("_sendDelegateMenuForItemAtIndex:"), function $CPCollectionView___sendDelegateMenuForItemAtIndex_(self, _cmd, anIndex)
{
    if (!(self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_menuForItemAtIndex_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "collectionView:menuForItemAtIndex:", self, anIndex));
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("_sendDelegateDraggingViewForItemsAtIndexes:withEvent:offset:"), function $CPCollectionView___sendDelegateDraggingViewForItemsAtIndexes_withEvent_offset_(self, _cmd, indexes, anEvent, dragImageOffset)
{
    if (!(self._implementedDelegateMethods & CPCollectionViewDelegate_collectionView_draggingViewForItemsAtIndexes_withEvent_offset))
        return self.isa.objj_msgSend3(self, "draggingViewForItemsAtIndexes:withEvent:offset:", indexes, anEvent, dragImageOffset);
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "collectionView:draggingViewForItemsAtIndexes:withEvent:offset:", self, indexes, anEvent, dragImageOffset));
    var ___r1;
}
,["CPView","CPIndexSet","CPEvent","CGPoint"])]);
}var CPCollectionViewMinItemSizeKey = "CPCollectionViewMinItemSizeKey",
    CPCollectionViewMaxItemSizeKey = "CPCollectionViewMaxItemSizeKey",
    CPCollectionViewVerticalMarginKey = "CPCollectionViewVerticalMarginKey",
    CPCollectionViewMaxNumberOfRowsKey = "CPCollectionViewMaxNumberOfRowsKey",
    CPCollectionViewMaxNumberOfColumnsKey = "CPCollectionViewMaxNumberOfColumnsKey",
    CPCollectionViewSelectableKey = "CPCollectionViewSelectableKey",
    CPCollectionViewAllowsMultipleSelectionKey = "CPCollectionViewAllowsMultipleSelectionKey",
    CPCollectionViewBackgroundColorsKey = "CPCollectionViewBackgroundColorsKey";
{
var the_class = objj_getClass("CPCollectionView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCollectionView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._minItemSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", CPCollectionViewMinItemSizeKey));
        self._maxItemSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", CPCollectionViewMaxItemSizeKey));
        self._maxNumberOfRows = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPCollectionViewMaxNumberOfRowsKey));
        self._maxNumberOfColumns = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPCollectionViewMaxNumberOfColumnsKey));
        self._verticalMargin = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPCollectionViewVerticalMarginKey));
        self._isSelectable = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPCollectionViewSelectableKey));
        self._allowsMultipleSelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPCollectionViewAllowsMultipleSelectionKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColors:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPCollectionViewBackgroundColorsKey))));
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCollectionView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionView").super_class }, "encodeWithCoder:", aCoder);
    if (!CGSizeEqualToSize(self._minItemSize, CGSizeMakeZero()))
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeSize:forKey:", self._minItemSize, CPCollectionViewMinItemSizeKey));
    if (!CGSizeEqualToSize(self._maxItemSize, CGSizeMakeZero()))
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeSize:forKey:", self._maxItemSize, CPCollectionViewMaxItemSizeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._maxNumberOfRows, CPCollectionViewMaxNumberOfRowsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._maxNumberOfColumns, CPCollectionViewMaxNumberOfColumnsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isSelectable, CPCollectionViewSelectableKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowsMultipleSelection, CPCollectionViewAllowsMultipleSelectionKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._verticalMargin, CPCollectionViewVerticalMarginKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._backgroundColors, CPCollectionViewBackgroundColorsKey));
}
,["void","CPCoder"])]);
}