@STATIC;1.0;I;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;23;Foundation/CPIndexSet.jI;28;Foundation/CPKeyedArchiver.jI;30;Foundation/CPKeyedUnarchiver.ji;22;CPCollectionViewItem.ji;17;CPCompatibility.ji;24;CPDragServer_Constants.ji;14;CPPasteboard.ji;8;CPView.jt;46671;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPData.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("Foundation/CPKeyedArchiver.j", NO);objj_executeFile("Foundation/CPKeyedUnarchiver.j", NO);objj_executeFile("CPCollectionViewItem.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPDragServer_Constants.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPView.j", YES);var HORIZONTAL_MARGIN = 2;
{var the_class = objj_allocateClassPair(CPView, "CPCollectionView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_content"), new objj_ivar("_items"), new objj_ivar("_itemData"), new objj_ivar("_itemPrototype"), new objj_ivar("_itemForDragging"), new objj_ivar("_cachedItems"), new objj_ivar("_maxNumberOfRows"), new objj_ivar("_maxNumberOfColumns"), new objj_ivar("_minItemSize"), new objj_ivar("_maxItemSize"), new objj_ivar("_backgroundColors"), new objj_ivar("_tileWidth"), new objj_ivar("_isSelectable"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_allowsEmptySelection"), new objj_ivar("_selectionIndexes"), new objj_ivar("_itemSize"), new objj_ivar("_horizontalMargin"), new objj_ivar("_verticalMargin"), new objj_ivar("_numberOfRows"), new objj_ivar("_numberOfColumns"), new objj_ivar("_delegate"), new objj_ivar("_mouseDownEvent"), new objj_ivar("_needsMinMaxItemSizeUpdate"), new objj_ivar("_storedFrameSize"), new objj_ivar("_uniformSubviewsResizing"), new objj_ivar("_lockResizing"), new objj_ivar("_currentDropIndex"), new objj_ivar("_currentDragOperation"), new objj_ivar("_dropView")]);objj_registerClassPair(the_class);
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
        objj_msgSend(self, "setBackgroundColors:", nil);
        self._verticalMargin = 5.0;
        self._isSelectable = YES;
        self._allowsEmptySelection = YES;
        objj_msgSend(self, "_init");
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
    self._selectionIndexes = objj_msgSend(CPIndexSet, "indexSet");
    self._storedFrameSize = CGSizeMakeZero();
    self._needsMinMaxItemSizeUpdate = YES;
    self._uniformSubviewsResizing = NO;
    self._lockResizing = NO;
    self._currentDropIndex = -1;
    self._currentDragOperation = CPDragOperationNone;
    self._dropView = nil;
    objj_msgSend(self, "setAutoresizesSubviews:", NO);
    objj_msgSend(self, "setAutoresizingMask:", 0);
}
,["void"]), new objj_method(sel_getUid("setItemPrototype:"), function $CPCollectionView__setItemPrototype_(self, _cmd, anItem)
{
    self._cachedItems = [];
    self._itemData = nil;
    self._itemForDragging = nil;
    self._itemPrototype = anItem;
    objj_msgSend(self, "_reloadContentCachingRemovedItems:", NO);
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
        item = objj_msgSend(self._itemPrototype, "copy");
    objj_msgSend(item, "setRepresentedObject:", anObject);
    objj_msgSend(objj_msgSend(item, "view"), "setFrameSize:", self._itemSize);
    return item;
}
,["CPCollectionViewItem","id"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPCollectionView__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("isFirstResponder"), function $CPCollectionView__isFirstResponder(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "window"), "firstResponder") === self;
}
,["BOOL"]), new objj_method(sel_getUid("setContent:"), function $CPCollectionView__setContent_(self, _cmd, anArray)
{
    self._content = anArray;
    objj_msgSend(self, "reloadContent");
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
            itemCount = objj_msgSend(self._items, "count");
        while ((index = objj_msgSend(self._selectionIndexes, "indexGreaterThanIndex:", index)) != CPNotFound && index < itemCount)
            objj_msgSend(self._items[index], "setSelected:", NO);
    }
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
        anIndexSet = objj_msgSend(CPIndexSet, "indexSet");
    if (!self._isSelectable || objj_msgSend(self._selectionIndexes, "isEqual:", anIndexSet))
        return;
    var index = CPNotFound,
        itemCount = objj_msgSend(self._items, "count");
    while ((index = objj_msgSend(self._selectionIndexes, "indexGreaterThanIndex:", index)) !== CPNotFound && index < itemCount)
        objj_msgSend(self._items[index], "setSelected:", NO);
    self._selectionIndexes = anIndexSet;
    var index = CPNotFound;
    while ((index = objj_msgSend(self._selectionIndexes, "indexGreaterThanIndex:", index)) !== CPNotFound)
        objj_msgSend(self._items[index], "setSelected:", YES);
    var binderClass = objj_msgSend(objj_msgSend(self, "class"), "_binderClassForBinding:", "selectionIndexes");
    objj_msgSend(objj_msgSend(binderClass, "getBinding:forObject:", "selectionIndexes", self), "reverseSetValueFor:", "selectionIndexes");
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("collectionViewDidChangeSelection:")))
    {
        CPLog.warn("The delegate method collectionViewDidChangeSelection: is deprecated and will be removed in a future version, please bind to selectionIndexes instead.");
        objj_msgSend(self._delegate, "collectionViewDidChangeSelection:", self);
    }
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("selectionIndexes"), function $CPCollectionView__selectionIndexes(self, _cmd)
{
    return objj_msgSend(self._selectionIndexes, "copy");
}
,["CPIndexSet"]), new objj_method(sel_getUid("reloadContent"), function $CPCollectionView__reloadContent(self, _cmd)
{
    objj_msgSend(self, "_reloadContentCachingRemovedItems:", YES);
}
,["void"]), new objj_method(sel_getUid("_reloadContentCachingRemovedItems:"), function $CPCollectionView___reloadContentCachingRemovedItems_(self, _cmd, shouldCache)
{
    var count = self._items.length;
    while (count--)
    {
        objj_msgSend(objj_msgSend(self._items[count], "view"), "removeFromSuperview");
        objj_msgSend(self._items[count], "setSelected:", NO);
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
        self._items.push(objj_msgSend(self, "newItemForRepresentedObject:", self._content[index]));
        objj_msgSend(self, "addSubview:", objj_msgSend(self._items[index], "view"));
    }
    index = CPNotFound;
    while ((index = objj_msgSend(self._selectionIndexes, "indexGreaterThanIndex:", index)) != CPNotFound && index < count)
        objj_msgSend(self._items[index], "setSelected:", YES);
    objj_msgSend(self, "tileIfNeeded:", NO);
}
,["void","BOOL"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPCollectionView__resizeSubviewsWithOldSize_(self, _cmd, oldBoundsSize)
{
}
,["void","CGSize"]), new objj_method(sel_getUid("resizeWithOldSuperviewSize:"), function $CPCollectionView__resizeWithOldSuperviewSize_(self, _cmd, oldBoundsSize)
{
    if (self._lockResizing)
        return;
    self._lockResizing = YES;
    objj_msgSend(self, "tile");
    self._lockResizing = NO;
}
,["void","CGSize"]), new objj_method(sel_getUid("tile"), function $CPCollectionView__tile(self, _cmd)
{
    objj_msgSend(self, "tileIfNeeded:", !self._uniformSubviewsResizing);
}
,["void"]), new objj_method(sel_getUid("tileIfNeeded:"), function $CPCollectionView__tileIfNeeded_(self, _cmd, lazyFlag)
{
    var frameSize = objj_msgSend(objj_msgSend(self, "superview"), "frameSize"),
        count = self._items.length,
        oldNumberOfColumns = self._numberOfColumns,
        oldNumberOfRows = self._numberOfRows,
        oldItemSize = self._itemSize,
        storedFrameSize = self._storedFrameSize;
    if (!frameSize)
        return;
    objj_msgSend(self, "_updateMinMaxItemSizeIfNeeded");
    objj_msgSend(self, "_computeGridWithSize:count:", frameSize, function(__input) { if (arguments.length) return count = __input; return count; });
    objj_msgSend(self, "setFrameSize:", self._storedFrameSize);
    if (!lazyFlag || self._numberOfColumns !== oldNumberOfColumns || self._numberOfRows !== oldNumberOfRows || !CGSizeEqualToSize(self._itemSize, oldItemSize))
        objj_msgSend(self, "displayItems:frameSize:itemSize:columns:rows:count:", self._items, self._storedFrameSize, self._itemSize, self._numberOfColumns, self._numberOfRows, count);
}
,["void","BOOL"]), new objj_method(sel_getUid("_computeGridWithSize:count:"), function $CPCollectionView___computeGridWithSize_count_(self, _cmd, aSuperviewSize, countRef)
{
    var width = aSuperviewSize.width,
        height = aSuperviewSize.height,
        itemSize = CGSizeMakeCopy(self._minItemSize),
        maxItemSizeWidth = self._maxItemSize.width,
        maxItemSizeHeight = self._maxItemSize.height,
        itemsCount = objj_msgSend(self._items, "count"),
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
}
,["void","CGSize","Function"]), new objj_method(sel_getUid("displayItems:frameSize:itemSize:columns:rows:count:"), function $CPCollectionView__displayItems_frameSize_itemSize_columns_rows_count_(self, _cmd, displayItems, aFrameSize, anItemSize, numberOfColumns, numberOfRows, displayCount)
{
    self._horizontalMargin = self._uniformSubviewsResizing ? FLOOR((aFrameSize.width - numberOfColumns * anItemSize.width) / (numberOfColumns + 1)) : HORIZONTAL_MARGIN;
    var x = self._horizontalMargin,
        y = -anItemSize.height;
    objj_msgSend(displayItems, "enumerateObjectsUsingBlock:", function(item, idx, stop)
    {
        var view = objj_msgSend(item, "view");
        if (idx >= displayCount)
        {
            objj_msgSend(view, "setFrameOrigin:", CGPointMake(-anItemSize.width, -anItemSize.height));
            return;
        }
        if (idx % numberOfColumns == 0)
        {
            x = self._horizontalMargin;
            y += self._verticalMargin + anItemSize.height;
        }
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(x, y));
        objj_msgSend(view, "setFrameSize:", anItemSize);
        x += anItemSize.width + self._horizontalMargin;
    });
}
,["void","CPArray","CGSize","CGSize","CPInteger","CPInteger","CPInteger"]), new objj_method(sel_getUid("_updateMinMaxItemSizeIfNeeded"), function $CPCollectionView___updateMinMaxItemSizeIfNeeded(self, _cmd)
{
    if (!self._needsMinMaxItemSizeUpdate)
        return;
    var prototypeView;
    if (self._itemPrototype && (prototypeView = objj_msgSend(self._itemPrototype, "view")))
    {
        if (self._minItemSize.width == 0)
            self._minItemSize.width = objj_msgSend(prototypeView, "frameSize").width;
        if (self._minItemSize.height == 0)
            self._minItemSize.height = objj_msgSend(prototypeView, "frameSize").height;
        if (self._maxItemSize.height == 0 && !(objj_msgSend(prototypeView, "autoresizingMask") & CPViewHeightSizable))
            self._maxItemSize.height = objj_msgSend(prototypeView, "frameSize").height;
        if (self._maxItemSize.width == 0 && !(objj_msgSend(prototypeView, "autoresizingMask") & CPViewWidthSizable))
            self._maxItemSize.width = objj_msgSend(prototypeView, "frameSize").width;
        self._needsMinMaxItemSizeUpdate = NO;
    }
}
,["void"]), new objj_method(sel_getUid("setMaxNumberOfRows:"), function $CPCollectionView__setMaxNumberOfRows_(self, _cmd, aMaxNumberOfRows)
{
    if (self._maxNumberOfRows == aMaxNumberOfRows)
        return;
    self._maxNumberOfRows = aMaxNumberOfRows;
    objj_msgSend(self, "tile");
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
    objj_msgSend(self, "tile");
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
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid value provided for minimum size");
    if (CGSizeEqualToSize(self._minItemSize, aSize))
        return;
    self._minItemSize = CGSizeMakeCopy(aSize);
    if (CGSizeEqualToSize(self._minItemSize, CGSizeMakeZero()))
        self._needsMinMaxItemSizeUpdate = YES;
    objj_msgSend(self, "tile");
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
    objj_msgSend(self, "tile");
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
        self._backgroundColors = [objj_msgSend(CPColor, "whiteColor")];
    if (objj_msgSend(self._backgroundColors, "count") === 1)
        objj_msgSend(self, "setBackgroundColor:", self._backgroundColors[0]);
    else
        objj_msgSend(self, "setBackgroundColor:", nil);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPArray"]), new objj_method(sel_getUid("backgroundColors"), function $CPCollectionView__backgroundColors(self, _cmd)
{
    return self._backgroundColors;
}
,["CPArray"]), new objj_method(sel_getUid("mouseUp:"), function $CPCollectionView__mouseUp_(self, _cmd, anEvent)
{
    if (objj_msgSend(self._selectionIndexes, "count") && objj_msgSend(anEvent, "clickCount") == 2 && objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("collectionView:didDoubleClickOnItemAtIndex:")))
        objj_msgSend(self._delegate, "collectionView:didDoubleClickOnItemAtIndex:", self, objj_msgSend(self._selectionIndexes, "firstIndex"));
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPCollectionView__mouseDown_(self, _cmd, anEvent)
{
    self._mouseDownEvent = anEvent;
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        index = objj_msgSend(self, "_indexAtPoint:", location);
    if (index >= 0 && index < self._items.length)
    {
        if (self._allowsMultipleSelection && (objj_msgSend(anEvent, "modifierFlags") & CPPlatformActionKeyMask || objj_msgSend(anEvent, "modifierFlags") & CPShiftKeyMask))
        {
            if (objj_msgSend(anEvent, "modifierFlags") & CPPlatformActionKeyMask)
            {
                var indexes = objj_msgSend(self._selectionIndexes, "copy");
                if (objj_msgSend(indexes, "containsIndex:", index))
                    objj_msgSend(indexes, "removeIndex:", index);
                else
                    objj_msgSend(indexes, "addIndex:", index);
            }
            else if (objj_msgSend(anEvent, "modifierFlags") & CPShiftKeyMask)
            {
                var firstSelectedIndex = objj_msgSend(objj_msgSend(self, "selectionIndexes"), "firstIndex"),
                    newSelectedRange = nil;
                if (firstSelectedIndex === CPNotFound)
                    firstSelectedIndex = index;
                if (index < firstSelectedIndex)
                    newSelectedRange = CPMakeRange(index, firstSelectedIndex - index + 1);
                else
                    newSelectedRange = CPMakeRange(firstSelectedIndex, index - firstSelectedIndex + 1);
                indexes = objj_msgSend(objj_msgSend(self, "selectionIndexes"), "copy");
                objj_msgSend(indexes, "addIndexesInRange:", newSelectedRange);
            }
        }
        else
            indexes = objj_msgSend(CPIndexSet, "indexSetWithIndex:", index);
        objj_msgSend(self, "setSelectionIndexes:", indexes);
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
    }
    else if (self._allowsEmptySelection)
        objj_msgSend(self, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSet"));
}
,["void","CPEvent"]), new objj_method(sel_getUid("setVerticalMargin:"), function $CPCollectionView__setVerticalMargin_(self, _cmd, aVerticalMargin)
{
    if (self._verticalMargin == aVerticalMargin)
        return;
    self._verticalMargin = aVerticalMargin;
    objj_msgSend(self, "tile");
}
,["void","float"]), new objj_method(sel_getUid("setUniformSubviewsResizing:"), function $CPCollectionView__setUniformSubviewsResizing_(self, _cmd, flag)
{
    self._uniformSubviewsResizing = flag;
    objj_msgSend(self, "tileIfNeeded:", NO);
}
,["void","BOOL"]), new objj_method(sel_getUid("verticalMargin"), function $CPCollectionView__verticalMargin(self, _cmd)
{
    return self._verticalMargin;
}
,["float"]), new objj_method(sel_getUid("setDelegate:"), function $CPCollectionView__setDelegate_(self, _cmd, aDelegate)
{
    self._delegate = aDelegate;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPCollectionView__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("menuForEvent:"), function $CPCollectionView__menuForEvent_(self, _cmd, theEvent)
{
    if (!objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("collectionView:menuForItemAtIndex:")))
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionView").super_class }, "menuForEvent:", theEvent);
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(theEvent, "locationInWindow"), nil),
        index = objj_msgSend(self, "_indexAtPoint:", location);
    return objj_msgSend(self._delegate, "collectionView:menuForItemAtIndex:", self, index);
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
    return objj_msgSend(self._items, "objectAtIndex:", anIndex);
}
,["CPCollectionViewItem","CPUInteger"]), new objj_method(sel_getUid("frameForItemAtIndex:"), function $CPCollectionView__frameForItemAtIndex_(self, _cmd, anIndex)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "itemAtIndex:", anIndex), "view"), "frame");
}
,["CGRect","CPUInteger"]), new objj_method(sel_getUid("frameForItemsAtIndexes:"), function $CPCollectionView__frameForItemsAtIndexes_(self, _cmd, anIndexSet)
{
    var indexArray = [],
        frame = CGRectNull;
    objj_msgSend(anIndexSet, "getIndexes:maxCount:inIndexRange:", indexArray, -1, nil);
    var index = 0,
        count = objj_msgSend(indexArray, "count");
    for (; index < count; ++index)
        frame = CGRectUnion(frame, objj_msgSend(self, "frameForItemAtIndex:", indexArray[index]));
    return frame;
}
,["CGRect","CPIndexSet"])]);
}{
var the_class = objj_getClass("CPCollectionView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $CPCollectionView__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{
    objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(self._delegate, "collectionView:dataForItemsAtIndexes:forType:", self, self._selectionIndexes, aType), aType);
}
,["void","CPPasteboard","CPString"]), new objj_method(sel_getUid("_createDropIndicatorIfNeeded"), function $CPCollectionView___createDropIndicatorIfNeeded(self, _cmd)
{
    if (!self._dropView)
        self._dropView = objj_msgSend(objj_msgSend(_CPCollectionViewDropIndicator, "alloc"), "initWithFrame:", CGRectMake(-8, -8, 0, 0));
    objj_msgSend(self._dropView, "setFrameSize:", CGSizeMake(10, self._itemSize.height + self._verticalMargin));
    objj_msgSend(self, "addSubview:", self._dropView);
}
,["void"]), new objj_method(sel_getUid("mouseDragged:"), function $CPCollectionView__mouseDragged_(self, _cmd, anEvent)
{
    if (!self._mouseDownEvent)
        return;
    objj_msgSend(self, "_createDropIndicatorIfNeeded");
    var locationInWindow = objj_msgSend(anEvent, "locationInWindow"),
        mouseDownLocationInWindow = objj_msgSend(self._mouseDownEvent, "locationInWindow");
    if (ABS(locationInWindow.x - mouseDownLocationInWindow.x) < 3 && ABS(locationInWindow.y - mouseDownLocationInWindow.y) < 3)
        return;
    if (!objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("collectionView:dragTypesForItemsAtIndexes:")))
        return;
    if (!objj_msgSend(self._selectionIndexes, "count"))
        return;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("collectionView:canDragItemsAtIndexes:withEvent:")) && !objj_msgSend(self._delegate, "collectionView:canDragItemsAtIndexes:withEvent:", self, self._selectionIndexes, self._mouseDownEvent))
        return;
    var dragTypes = objj_msgSend(self._delegate, "collectionView:dragTypesForItemsAtIndexes:", self, self._selectionIndexes);
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", dragTypes, self);
    var dragImageOffset = CGSizeMakeZero(),
        view = objj_msgSend(self, "_draggingViewForItemsAtIndexes:withEvent:offset:", self._selectionIndexes, self._mouseDownEvent, dragImageOffset);
    objj_msgSend(view, "setFrameSize:", self._itemSize);
    objj_msgSend(view, "setAlphaValue:", 0.7);
    var dragLocation = objj_msgSend(self, "convertPoint:fromView:", locationInWindow, nil),
        dragPoint = CGPointMake(dragLocation.x - self._itemSize.width / 2, dragLocation.y - self._itemSize.height / 2);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", view, dragPoint, dragImageOffset, self._mouseDownEvent, nil, self, YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_draggingViewForItemsAtIndexes:withEvent:offset:"), function $CPCollectionView___draggingViewForItemsAtIndexes_withEvent_offset_(self, _cmd, indexes, anEvent, offset)
{
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("collectionView:draggingViewForItemsAtIndexes:withEvent:offset:")))
        return objj_msgSend(self._delegate, "collectionView:draggingViewForItemsAtIndexes:withEvent:offset:", self, indexes, anEvent, offset);
    return objj_msgSend(self, "draggingViewForItemsAtIndexes:withEvent:offset:", indexes, anEvent, offset);
}
,["CPView","CPIndexSet","CPEvent","CGPoint"]), new objj_method(sel_getUid("draggingViewForItemsAtIndexes:withEvent:offset:"), function $CPCollectionView__draggingViewForItemsAtIndexes_withEvent_offset_(self, _cmd, indexes, event, dragImageOffset)
{
    var idx = self._content[objj_msgSend(indexes, "firstIndex")];
    if (!self._itemForDragging)
        self._itemForDragging = objj_msgSend(self, "newItemForRepresentedObject:", idx);
    else
        objj_msgSend(self._itemForDragging, "setRepresentedObject:", idx);
    return objj_msgSend(self._itemForDragging, "view");
}
,["CPView","CPIndexSet","CPEvent","CGPoint"]), new objj_method(sel_getUid("_canDragItemsAtIndexes:withEvent:"), function $CPCollectionView___canDragItemsAtIndexes_withEvent_(self, _cmd, indexes, anEvent)
{
    if (objj_msgSend(self, "respondsToSelector:", sel_getUid("collectionView:canDragItemsAtIndexes:withEvent:")))
        return objj_msgSend(self._delegate, "collectionView:canDragItemsAtIndexes:withEvent:", self, indexes, anEvent);
    return YES;
}
,["BOOL","CPIndexSet","CPEvent"]), new objj_method(sel_getUid("draggingEntered:"), function $CPCollectionView__draggingEntered_(self, _cmd, draggingInfo)
{
    var dropIndex = -1,
        dropIndexRef = function(__input) { if (arguments.length) return dropIndex = __input; return dropIndex; },
        dragOp = objj_msgSend(self, "_validateDragWithInfo:dropIndex:dropOperation:", draggingInfo, dropIndexRef, 1);
    dropIndex = dropIndexRef();
    objj_msgSend(self, "_createDropIndicatorIfNeeded");
    objj_msgSend(self, "_updateDragAndDropStateWithDraggingInfo:newDragOperation:newDropIndex:newDropOperation:", draggingInfo, dragOp, dropIndex, 1);
    return self._currentDragOperation;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("draggingUpdated:"), function $CPCollectionView__draggingUpdated_(self, _cmd, draggingInfo)
{
    if (!objj_msgSend(self, "_dropIndexDidChange:", draggingInfo))
        return self._currentDragOperation;
    var dropIndex,
        dropIndexRef = function(__input) { if (arguments.length) return dropIndex = __input; return dropIndex; };
    var dragOperation = objj_msgSend(self, "_validateDragWithInfo:dropIndex:dropOperation:", draggingInfo, dropIndexRef, 1);
    dropIndex = dropIndexRef();
    objj_msgSend(self, "_updateDragAndDropStateWithDraggingInfo:newDragOperation:newDropIndex:newDropOperation:", draggingInfo, dragOperation, dropIndex, 1);
    return dragOperation;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("_validateDragWithInfo:dropIndex:dropOperation:"), function $CPCollectionView___validateDragWithInfo_dropIndex_dropOperation_(self, _cmd, draggingInfo, dropIndexRef, dropOperation)
{
    var result = CPDragOperationMove,
        dropIndex = objj_msgSend(self, "_dropIndexForDraggingInfo:proposedDropOperation:", draggingInfo, dropOperation);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("collectionView:validateDrop:proposedIndex:dropOperation:")))
    {
        var dropIndexRef2 = function(__input) { if (arguments.length) return dropIndex = __input; return dropIndex; };
        result = objj_msgSend(self._delegate, "collectionView:validateDrop:proposedIndex:dropOperation:", self, draggingInfo, dropIndexRef2, dropOperation);
        if (result !== CPDragOperationNone)
        {
            dropIndex = dropIndexRef2();
        }
    }
    dropIndexRef(dropIndex);
    return result;
}
,["CPDragOperation","id","Function","int"]), new objj_method(sel_getUid("draggingExited:"), function $CPCollectionView__draggingExited_(self, _cmd, draggingInfo)
{
    objj_msgSend(self, "_updateDragAndDropStateWithDraggingInfo:newDragOperation:newDropIndex:newDropOperation:", draggingInfo, 0, -1, 1);
}
,["void","id"]), new objj_method(sel_getUid("draggingEnded:"), function $CPCollectionView__draggingEnded_(self, _cmd, draggingInfo)
{
    objj_msgSend(self, "_updateDragAndDropStateWithDraggingInfo:newDragOperation:newDropIndex:newDropOperation:", draggingInfo, 0, -1, 1);
}
,["void","id"]), new objj_method(sel_getUid("performDragOperation:"), function $CPCollectionView__performDragOperation_(self, _cmd, draggingInfo)
{
    var result = NO;
    if (self._currentDragOperation && self._currentDropIndex !== -1)
        result = objj_msgSend(self._delegate, "collectionView:acceptDrop:index:dropOperation:", self, draggingInfo, self._currentDropIndex, 1);
    objj_msgSend(self, "draggingEnded:", draggingInfo);
    return result;
}
,["BOOL","id"]), new objj_method(sel_getUid("_updateDragAndDropStateWithDraggingInfo:newDragOperation:newDropIndex:newDropOperation:"), function $CPCollectionView___updateDragAndDropStateWithDraggingInfo_newDragOperation_newDropIndex_newDropOperation_(self, _cmd, draggingInfo, dragOperation, dropIndex, dropOperation)
{
    self._currentDropIndex = dropIndex;
    self._currentDragOperation = dragOperation;
    var frameOrigin,
        dropviewFrameWidth = CGRectGetWidth(objj_msgSend(self._dropView, "frame"));
    if (self._currentDropIndex == -1 || self._currentDragOperation == CPDragOperationNone)
        frameOrigin = CGPointMake(-dropviewFrameWidth, 0);
    else if (self._currentDropIndex == 0)
        frameOrigin = CGPointMake(0, 0);
    else
    {
        var offset;
        if (self._currentDropIndex % self._numberOfColumns !== 0 || self._currentDropIndex == objj_msgSend(self._items, "count"))
        {
            dropIndex = self._currentDropIndex - 1;
            offset = (self._horizontalMargin - dropviewFrameWidth) / 2;
        }
        else
        {
            offset = -self._itemSize.width - dropviewFrameWidth - (self._horizontalMargin - dropviewFrameWidth) / 2;
        }
        var rect = objj_msgSend(self, "frameForItemAtIndex:", dropIndex);
        frameOrigin = CGPointMake(CGRectGetMaxX(rect) + offset, rect.origin.y - self._verticalMargin);
    }
    objj_msgSend(self._dropView, "setFrameOrigin:", frameOrigin);
}
,["void","id","CPDragOperation","CPInteger","CPInteger"]), new objj_method(sel_getUid("_dropIndexDidChange:"), function $CPCollectionView___dropIndexDidChange_(self, _cmd, draggingInfo)
{
    var dropIndex = objj_msgSend(self, "_dropIndexForDraggingInfo:proposedDropOperation:", draggingInfo, 1);
    if (dropIndex == CPNotFound)
        dropIndex = objj_msgSend(objj_msgSend(self, "content"), "count");
    return self._currentDropIndex !== dropIndex;
}
,["BOOL","id"]), new objj_method(sel_getUid("_dropIndexForDraggingInfo:proposedDropOperation:"), function $CPCollectionView___dropIndexForDraggingInfo_proposedDropOperation_(self, _cmd, draggingInfo, dropOperation)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(draggingInfo, "draggingLocation"), nil),
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
        return MIN(row * self._numberOfColumns + column, objj_msgSend(self._items, "count"));
    }
    return row * self._numberOfColumns + column;
}
,["CPInteger","id","int"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPCollectionViewDropIndicator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawRect:"), function $_CPCollectionViewDropIndicator__drawRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        width = CGRectGetWidth(aRect),
        circleRect = CGRectMake(1, 1, width - 2, width - 2);
    CGContextSetStrokeColor(context, objj_msgSend(CPColor, "colorWithHexString:", "4886ca"));
    CGContextSetFillColor(context, objj_msgSend(CPColor, "whiteColor"));
    CGContextSetLineWidth(context, 3);
    CGContextFillRect(context, circleRect);
    CGContextStrokeEllipseInRect(context, circleRect);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, FLOOR(width / 2), CGRectGetMinY(aRect) + width);
    CGContextAddLineToPoint(context, FLOOR(width / 2), CGRectGetHeight(aRect));
    CGContextStrokePath(context);
}
,["void","CGRect"])]);
}{
var the_class = objj_getClass("CPCollectionView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_modifySelectionWithNewIndex:direction:expand:"), function $CPCollectionView___modifySelectionWithNewIndex_direction_expand_(self, _cmd, anIndex, aDirection, shouldExpand)
{
    var count = objj_msgSend(objj_msgSend(self, "items"), "count");
    if (count === 0)
        return;
    anIndex = MIN(MAX(anIndex, 0), count - 1);
    if (self._allowsMultipleSelection && shouldExpand)
    {
        var indexes = objj_msgSend(self._selectionIndexes, "copy"),
            bottomAnchor = objj_msgSend(indexes, "firstIndex"),
            topAnchor = objj_msgSend(indexes, "lastIndex");
        if (aDirection === -1)
            objj_msgSend(indexes, "addIndexesInRange:", CPMakeRange(anIndex, bottomAnchor - anIndex + 1));
        else
            objj_msgSend(indexes, "addIndexesInRange:", CPMakeRange(topAnchor, anIndex - topAnchor + 1));
    }
    else
        indexes = objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex);
    objj_msgSend(self, "setSelectionIndexes:", indexes);
    objj_msgSend(self, "_scrollToSelection");
}
,["void","int","int","BOOL"]), new objj_method(sel_getUid("_scrollToSelection"), function $CPCollectionView___scrollToSelection(self, _cmd)
{
    var frame = objj_msgSend(self, "frameForItemsAtIndexes:", objj_msgSend(self, "selectionIndexes"));
    if (!CGRectIsEmpty(frame))
        objj_msgSend(self, "scrollRectToVisible:", frame);
}
,["void"]), new objj_method(sel_getUid("moveLeft:"), function $CPCollectionView__moveLeft_(self, _cmd, sender)
{
    var index = objj_msgSend(objj_msgSend(self, "selectionIndexes"), "firstIndex");
    if (index === CPNotFound)
        index = objj_msgSend(objj_msgSend(self, "items"), "count");
    objj_msgSend(self, "_modifySelectionWithNewIndex:direction:expand:", index - 1, -1, NO);
}
,["void","id"]), new objj_method(sel_getUid("moveLeftAndModifySelection:"), function $CPCollectionView__moveLeftAndModifySelection_(self, _cmd, sender)
{
    var index = objj_msgSend(objj_msgSend(self, "selectionIndexes"), "firstIndex");
    if (index === CPNotFound)
        index = objj_msgSend(objj_msgSend(self, "items"), "count");
    objj_msgSend(self, "_modifySelectionWithNewIndex:direction:expand:", index - 1, -1, YES);
}
,["void","id"]), new objj_method(sel_getUid("moveRight:"), function $CPCollectionView__moveRight_(self, _cmd, sender)
{
    objj_msgSend(self, "_modifySelectionWithNewIndex:direction:expand:", objj_msgSend(objj_msgSend(self, "selectionIndexes"), "lastIndex") + 1, 1, NO);
}
,["void","id"]), new objj_method(sel_getUid("moveRightAndModifySelection:"), function $CPCollectionView__moveRightAndModifySelection_(self, _cmd, sender)
{
    objj_msgSend(self, "_modifySelectionWithNewIndex:direction:expand:", objj_msgSend(objj_msgSend(self, "selectionIndexes"), "lastIndex") + 1, 1, YES);
}
,["void","id"]), new objj_method(sel_getUid("moveDown:"), function $CPCollectionView__moveDown_(self, _cmd, sender)
{
    objj_msgSend(self, "_modifySelectionWithNewIndex:direction:expand:", objj_msgSend(objj_msgSend(self, "selectionIndexes"), "lastIndex") + objj_msgSend(self, "numberOfColumns"), 1, NO);
}
,["void","id"]), new objj_method(sel_getUid("moveDownAndModifySelection:"), function $CPCollectionView__moveDownAndModifySelection_(self, _cmd, sender)
{
    objj_msgSend(self, "_modifySelectionWithNewIndex:direction:expand:", objj_msgSend(objj_msgSend(self, "selectionIndexes"), "lastIndex") + objj_msgSend(self, "numberOfColumns"), 1, YES);
}
,["void","id"]), new objj_method(sel_getUid("moveUp:"), function $CPCollectionView__moveUp_(self, _cmd, sender)
{
    var index = objj_msgSend(objj_msgSend(self, "selectionIndexes"), "firstIndex");
    if (index == CPNotFound)
        index = objj_msgSend(objj_msgSend(self, "items"), "count");
    objj_msgSend(self, "_modifySelectionWithNewIndex:direction:expand:", index - objj_msgSend(self, "numberOfColumns"), -1, NO);
}
,["void","id"]), new objj_method(sel_getUid("moveUpAndModifySelection:"), function $CPCollectionView__moveUpAndModifySelection_(self, _cmd, sender)
{
    var index = objj_msgSend(objj_msgSend(self, "selectionIndexes"), "firstIndex");
    if (index == CPNotFound)
        index = objj_msgSend(objj_msgSend(self, "items"), "count");
    objj_msgSend(self, "_modifySelectionWithNewIndex:direction:expand:", index - objj_msgSend(self, "numberOfColumns"), -1, YES);
}
,["void","id"]), new objj_method(sel_getUid("deleteBackward:"), function $CPCollectionView__deleteBackward_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("collectionView:shouldDeleteItemsAtIndexes:")))
    {
        objj_msgSend(objj_msgSend(self, "delegate"), "collectionView:shouldDeleteItemsAtIndexes:", self, objj_msgSend(self, "selectionIndexes"));
        var index = objj_msgSend(objj_msgSend(self, "selectionIndexes"), "firstIndex");
        if (index > objj_msgSend(objj_msgSend(self, "content"), "count") - 1)
            objj_msgSend(self, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", objj_msgSend(objj_msgSend(self, "content"), "count") - 1));
        objj_msgSend(self, "_scrollToSelection");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("keyDown:"), function $CPCollectionView__keyDown_(self, _cmd, anEvent)
{
    objj_msgSend(self, "interpretKeyEvents:", [anEvent]);
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
    _CPReportLenientDeprecation(objj_msgSend(self, "class"), _cmd, sel_getUid("frameForItemAtIndex:"));
    return objj_msgSend(self, "frameForItemAtIndex:", anIndex);
}
,["CGRect","int"]), new objj_method(sel_getUid("rectForItemsAtIndexes:"), function $CPCollectionView__rectForItemsAtIndexes_(self, _cmd, anIndexSet)
{
    _CPReportLenientDeprecation(objj_msgSend(self, "class"), _cmd, sel_getUid("frameForItemsAtIndexes:"));
    return objj_msgSend(self, "frameForItemsAtIndexes:", anIndexSet);
}
,["CGRect","CPIndexSet"])]);
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
        self._minItemSize = objj_msgSend(aCoder, "decodeSizeForKey:", CPCollectionViewMinItemSizeKey);
        self._maxItemSize = objj_msgSend(aCoder, "decodeSizeForKey:", CPCollectionViewMaxItemSizeKey);
        self._maxNumberOfRows = objj_msgSend(aCoder, "decodeIntForKey:", CPCollectionViewMaxNumberOfRowsKey);
        self._maxNumberOfColumns = objj_msgSend(aCoder, "decodeIntForKey:", CPCollectionViewMaxNumberOfColumnsKey);
        self._verticalMargin = objj_msgSend(aCoder, "decodeFloatForKey:", CPCollectionViewVerticalMarginKey);
        self._isSelectable = objj_msgSend(aCoder, "decodeBoolForKey:", CPCollectionViewSelectableKey);
        self._allowsMultipleSelection = objj_msgSend(aCoder, "decodeBoolForKey:", CPCollectionViewAllowsMultipleSelectionKey);
        objj_msgSend(self, "setBackgroundColors:", objj_msgSend(aCoder, "decodeObjectForKey:", CPCollectionViewBackgroundColorsKey));
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCollectionView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionView").super_class }, "encodeWithCoder:", aCoder);
    if (!CGSizeEqualToSize(self._minItemSize, CGSizeMakeZero()))
        objj_msgSend(aCoder, "encodeSize:forKey:", self._minItemSize, CPCollectionViewMinItemSizeKey);
    if (!CGSizeEqualToSize(self._maxItemSize, CGSizeMakeZero()))
        objj_msgSend(aCoder, "encodeSize:forKey:", self._maxItemSize, CPCollectionViewMaxItemSizeKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._maxNumberOfRows, CPCollectionViewMaxNumberOfRowsKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._maxNumberOfColumns, CPCollectionViewMaxNumberOfColumnsKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isSelectable, CPCollectionViewSelectableKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsMultipleSelection, CPCollectionViewAllowsMultipleSelectionKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._verticalMargin, CPCollectionViewVerticalMarginKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._backgroundColors, CPCollectionViewBackgroundColorsKey);
}
,["void","CPCoder"])]);
}