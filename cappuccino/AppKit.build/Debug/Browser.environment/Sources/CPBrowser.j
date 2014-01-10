@STATIC;1.0;I;23;Foundation/CPIndexSet.ji;11;CPControl.ji;9;CPImage.ji;14;CPScrollView.ji;13;CPTableView.ji;13;CPTextField.jI;21;Foundation/CPObject.jt;48890;objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("CPControl.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPScrollView.j", YES);objj_executeFile("CPTableView.j", YES);objj_executeFile("CPTextField.j", YES);{var the_class = objj_allocateClassPair(CPControl, "CPBrowser"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_pathSeparator"), new objj_ivar("_contentView"), new objj_ivar("_horizontalScrollView"), new objj_ivar("_prototypeView"), new objj_ivar("_tableViews"), new objj_ivar("_tableDelegates"), new objj_ivar("_rootItem"), new objj_ivar("_delegateSupportsImages"), new objj_ivar("_doubleAction"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_allowsEmptySelection"), new objj_ivar("_tableViewClass"), new objj_ivar("_rowHeight"), new objj_ivar("_imageWidth"), new objj_ivar("_leafWidth"), new objj_ivar("_minColumnWidth"), new objj_ivar("_defaultColumnWidth"), new objj_ivar("_columnWidths")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("doubleAction"), function $CPBrowser__doubleAction(self, _cmd)
{
    return self._doubleAction;
}
,["SEL"]), new objj_method(sel_getUid("setDoubleAction:"), function $CPBrowser__setDoubleAction_(self, _cmd, newValue)
{
    self._doubleAction = newValue;
}
,["void","SEL"]), new objj_method(sel_getUid("tableViewClass"), function $CPBrowser__tableViewClass(self, _cmd)
{
    return self._tableViewClass;
}
,["Class"]), new objj_method(sel_getUid("setTableViewClass:"), function $CPBrowser__setTableViewClass_(self, _cmd, newValue)
{
    self._tableViewClass = newValue;
}
,["void","Class"]), new objj_method(sel_getUid("defaultColumnWidth"), function $CPBrowser__defaultColumnWidth(self, _cmd)
{
    return self._defaultColumnWidth;
}
,["float"]), new objj_method(sel_getUid("setDefaultColumnWidth:"), function $CPBrowser__setDefaultColumnWidth_(self, _cmd, newValue)
{
    self._defaultColumnWidth = newValue;
}
,["void","float"]), new objj_method(sel_getUid("initWithFrame:"), function $CPBrowser__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBrowser").super_class }, "initWithFrame:", aFrame))
    {
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPBrowser___init(self, _cmd)
{
    self._rowHeight = 23.0;
    self._defaultColumnWidth = 140.0;
    self._minColumnWidth = 80.0;
    self._imageWidth = 23.0;
    self._leafWidth = 13.0;
    self._columnWidths = [];
    self._pathSeparator = "/";
    self._tableViews = [];
    self._tableDelegates = [];
    self._allowsMultipleSelection = YES;
    self._allowsEmptySelection = YES;
    self._tableViewClass = objj_msgSend(_CPBrowserTableView, "class");
    self._prototypeView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(self._prototypeView, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
    objj_msgSend(self._prototypeView, "setValue:forThemeAttribute:inState:", objj_msgSend(CPColor, "whiteColor"), "text-color", CPThemeStateSelectedDataView);
    objj_msgSend(self._prototypeView, "setLineBreakMode:", CPLineBreakByTruncatingTail);
    self._horizontalScrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
    objj_msgSend(self._horizontalScrollView, "setHasVerticalScroller:", NO);
    objj_msgSend(self._horizontalScrollView, "setAutohidesScrollers:", YES);
    objj_msgSend(self._horizontalScrollView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    self._contentView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 0, CGRectGetHeight(objj_msgSend(self, "bounds"))));
    objj_msgSend(self._contentView, "setAutoresizingMask:", CPViewHeightSizable);
    objj_msgSend(self._horizontalScrollView, "setDocumentView:", self._contentView);
    objj_msgSend(self, "addSubview:", self._horizontalScrollView);
}
,["void"]), new objj_method(sel_getUid("setPrototypeView:"), function $CPBrowser__setPrototypeView_(self, _cmd, aPrototypeView)
{
    self._prototypeView = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", aPrototypeView));
}
,["void","CPView"]), new objj_method(sel_getUid("prototypeView"), function $CPBrowser__prototypeView(self, _cmd)
{
    return objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", self._prototypeView));
}
,["CPView"]), new objj_method(sel_getUid("setDelegate:"), function $CPBrowser__setDelegate_(self, _cmd, anObject)
{
    self._delegate = anObject;
    self._delegateSupportsImages = objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:imageValueForItem:"));
    objj_msgSend(self, "loadColumnZero");
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPBrowser__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("tableViewInColumn:"), function $CPBrowser__tableViewInColumn_(self, _cmd, index)
{
    return self._tableViews[index];
}
,["CPTableView","unsigned"]), new objj_method(sel_getUid("columnOfTableView:"), function $CPBrowser__columnOfTableView_(self, _cmd, aTableView)
{
    return objj_msgSend(self._tableViews, "indexOfObject:", aTableView);
}
,["unsigned","CPTableView"]), new objj_method(sel_getUid("loadColumnZero"), function $CPBrowser__loadColumnZero(self, _cmd)
{
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("rootItemForBrowser:")))
        self._rootItem = objj_msgSend(self._delegate, "rootItemForBrowser:", self);
    else
        self._rootItem = nil;
    objj_msgSend(self, "setLastColumn:", -1);
    objj_msgSend(self, "addColumn");
}
,["void"]), new objj_method(sel_getUid("setLastColumn:"), function $CPBrowser__setLastColumn_(self, _cmd, columnIndex)
{
    if (columnIndex >= self._tableViews.length)
        return;
    var oldValue = self._tableViews.length - 1,
        indexPlusOne = columnIndex + 1;
    if (columnIndex > 0)
        objj_msgSend(self._tableViews[columnIndex - 1], "setNeedsDisplay:", YES);
    objj_msgSend(self._tableViews[columnIndex], "setNeedsDisplay:", YES);
    objj_msgSend(objj_msgSend(self._tableViews.slice(indexPlusOne), "valueForKey:", "enclosingScrollView"), "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview"));
    self._tableViews = self._tableViews.slice(0, indexPlusOne);
    self._tableDelegates = self._tableDelegates.slice(0, indexPlusOne);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:didChangeLastColumn:toColumn:")))
        objj_msgSend(self._delegate, "browser:didChangeLastColumn:toColumn:", self, oldValue, columnIndex);
    objj_msgSend(self, "tile");
}
,["void","CPInteger"]), new objj_method(sel_getUid("lastColumn"), function $CPBrowser__lastColumn(self, _cmd)
{
    return self._tableViews.length - 1;
}
,["int"]), new objj_method(sel_getUid("addColumn"), function $CPBrowser__addColumn(self, _cmd)
{
    var lastIndex = objj_msgSend(self, "lastColumn"),
        lastColumn = self._tableViews[lastIndex],
        selectionIndexes = objj_msgSend(lastColumn, "selectedRowIndexes");
    if (lastIndex >= 0 && objj_msgSend(selectionIndexes, "count") > 1)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Can't add column, column " + lastIndex + " has invalid selection.");
    var index = lastIndex + 1,
        item = index === 0 ? self._rootItem : objj_msgSend(self._tableDelegates[lastIndex], "childAtIndex:", objj_msgSend(selectionIndexes, "firstIndex"));
    if (index > 0 && item && objj_msgSend(self, "isLeafItem:", item))
        return;
    var table = objj_msgSend(objj_msgSend(self._tableViewClass, "alloc"), "initWithFrame:browser:", CGRectMakeZero(), self);
    objj_msgSend(table, "setHeaderView:", nil);
    objj_msgSend(table, "setCornerView:", nil);
    objj_msgSend(table, "setAllowsMultipleSelection:", self._allowsMultipleSelection);
    objj_msgSend(table, "setAllowsEmptySelection:", self._allowsEmptySelection);
    objj_msgSend(table, "registerForDraggedTypes:", objj_msgSend(self, "registeredDraggedTypes"));
    objj_msgSend(self, "_addTableColumnsToTableView:forColumnIndex:", table, index);
    var delegate = objj_msgSend(objj_msgSend(_CPBrowserTableDelegate, "alloc"), "init");
    objj_msgSend(delegate, "_setDelegate:", self._delegate);
    objj_msgSend(delegate, "_setBrowser:", self);
    objj_msgSend(delegate, "_setIndex:", index);
    objj_msgSend(delegate, "_setItem:", item);
    self._tableViews[index] = table;
    self._tableDelegates[index] = delegate;
    objj_msgSend(table, "setDelegate:", delegate);
    objj_msgSend(table, "setDataSource:", delegate);
    objj_msgSend(table, "setTarget:", delegate);
    objj_msgSend(table, "setAction:", sel_getUid("_tableViewClicked:"));
    objj_msgSend(table, "setDoubleAction:", sel_getUid("_tableViewDoubleClicked:"));
    objj_msgSend(table, "setDraggingDestinationFeedbackStyle:", CPTableViewDraggingDestinationFeedbackStyleRegular);
    var scrollView = objj_msgSend(objj_msgSend(_CPBrowserScrollView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(scrollView, "_setBrowser:", self);
    objj_msgSend(scrollView, "setDocumentView:", table);
    objj_msgSend(scrollView, "setHasHorizontalScroller:", NO);
    objj_msgSend(scrollView, "setAutoresizingMask:", CPViewHeightSizable);
    objj_msgSend(self._contentView, "addSubview:", scrollView);
    objj_msgSend(self, "tile");
    objj_msgSend(self, "scrollColumnToVisible:", index);
}
,["void"]), new objj_method(sel_getUid("_addTableColumnsToTableView:forColumnIndex:"), function $CPBrowser___addTableColumnsToTableView_forColumnIndex_(self, _cmd, aTableView, index)
{
    if (self._delegateSupportsImages)
    {
        var column = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "Image"),
            view = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(view, "setImageScaling:", CPImageScaleProportionallyDown);
        objj_msgSend(column, "setDataView:", view);
        objj_msgSend(column, "setResizingMask:", CPTableColumnNoResizing);
        objj_msgSend(aTableView, "addTableColumn:", column);
    }
    var column = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "Content");
    objj_msgSend(column, "setDataView:", self._prototypeView);
    objj_msgSend(column, "setResizingMask:", CPTableColumnNoResizing);
    objj_msgSend(aTableView, "addTableColumn:", column);
    var column = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "Leaf"),
        view = objj_msgSend(objj_msgSend(_CPBrowserLeafView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(view, "setBranchImage:", objj_msgSend(self, "valueForThemeAttribute:", "image-control-leaf"));
    objj_msgSend(view, "setHighlightedBranchImage:", objj_msgSend(self, "valueForThemeAttribute:", "image-control-leaf-pressed"));
    objj_msgSend(column, "setDataView:", view);
    objj_msgSend(column, "setResizingMask:", CPTableColumnNoResizing);
    objj_msgSend(aTableView, "addTableColumn:", column);
}
,["void","CPTableView","unsigned"]), new objj_method(sel_getUid("reloadColumn:"), function $CPBrowser__reloadColumn_(self, _cmd, column)
{
    objj_msgSend(objj_msgSend(self, "tableViewInColumn:", column), "reloadData");
}
,["void","CPInteger"]), new objj_method(sel_getUid("tile"), function $CPBrowser__tile(self, _cmd)
{
    var xOrigin = 0,
        scrollerWidth = objj_msgSend(CPScroller, "scrollerWidth"),
        height = CGRectGetHeight(objj_msgSend(self._contentView, "bounds"));
    for (var i = 0, count = self._tableViews.length; i < count; i++)
    {
        var tableView = self._tableViews[i],
            scrollView = objj_msgSend(tableView, "enclosingScrollView"),
            width = objj_msgSend(self, "widthOfColumn:", i),
            tableHeight = CGRectGetHeight(objj_msgSend(tableView, "bounds"));
        objj_msgSend(objj_msgSend(tableView, "tableColumnWithIdentifier:", "Image"), "setWidth:", self._imageWidth);
        objj_msgSend(objj_msgSend(tableView, "tableColumnWithIdentifier:", "Content"), "setWidth:", objj_msgSend(self, "columnContentWidthForColumnWidth:", width));
        objj_msgSend(objj_msgSend(tableView, "tableColumnWithIdentifier:", "Leaf"), "setWidth:", self._leafWidth);
        objj_msgSend(tableView, "setRowHeight:", self._rowHeight);
        objj_msgSend(tableView, "setFrameSize:", CGSizeMake(width - scrollerWidth, tableHeight));
        objj_msgSend(scrollView, "setFrameOrigin:", CGPointMake(xOrigin, 0));
        objj_msgSend(scrollView, "setFrameSize:", CGSizeMake(width, height));
        xOrigin += width;
    }
    objj_msgSend(self._contentView, "setFrameSize:", CGSizeMake(xOrigin, height));
}
,["void"]), new objj_method(sel_getUid("rowAtPoint:"), function $CPBrowser__rowAtPoint_(self, _cmd, aPoint)
{
    var column = objj_msgSend(self, "columnAtPoint:", aPoint);
    if (column === -1)
        return -1;
    var tableView = self._tableViews[column];
    return objj_msgSend(tableView, "rowAtPoint:", objj_msgSend(tableView, "convertPoint:fromView:", aPoint, self));
}
,["unsigned","CGPoint"]), new objj_method(sel_getUid("columnAtPoint:"), function $CPBrowser__columnAtPoint_(self, _cmd, aPoint)
{
    var adjustedPoint = objj_msgSend(self._contentView, "convertPoint:fromView:", aPoint, self);
    for (var i = 0, count = self._tableViews.length; i < count; i++)
    {
        var frame = objj_msgSend(objj_msgSend(self._tableViews[i], "enclosingScrollView"), "frame");
        if (CGRectContainsPoint(frame, adjustedPoint))
            return i;
    }
    return -1;
}
,["unsigned","CGPoint"]), new objj_method(sel_getUid("rectOfRow:inColumn:"), function $CPBrowser__rectOfRow_inColumn_(self, _cmd, aRow, aColumn)
{
    var tableView = self._tableViews[aColumn],
        rect = objj_msgSend(tableView, "rectOfRow:", aRow);
    rect.origin = objj_msgSend(self, "convertPoint:fromView:", rect.origin, tableView);
    return rect;
}
,["CGRect","unsigned","unsigned"]), new objj_method(sel_getUid("itemAtRow:inColumn:"), function $CPBrowser__itemAtRow_inColumn_(self, _cmd, row, column)
{
    return objj_msgSend(self._tableDelegates[column], "childAtIndex:", row);
}
,["id","CPInteger","CPInteger"]), new objj_method(sel_getUid("isLeafItem:"), function $CPBrowser__isLeafItem_(self, _cmd, item)
{
    return objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:isLeafItem:")) && objj_msgSend(self._delegate, "browser:isLeafItem:", self, item);
}
,["BOOL","id"]), new objj_method(sel_getUid("parentForItemsInColumn:"), function $CPBrowser__parentForItemsInColumn_(self, _cmd, column)
{
    return objj_msgSend(self._tableDelegates[column], "_item");
}
,["id","CPInteger"]), new objj_method(sel_getUid("selectedItems"), function $CPBrowser__selectedItems(self, _cmd)
{
    var selectedColumn = objj_msgSend(self, "selectedColumn"),
        selectedIndexes = objj_msgSend(self, "selectedRowIndexesInColumn:", selectedColumn),
        set = objj_msgSend(CPSet, "set"),
        index = objj_msgSend(selectedIndexes, "firstIndex");
    while (index !== CPNotFound)
    {
        objj_msgSend(set, "addObject:", objj_msgSend(self, "itemAtRow:inColumn:", index, selectedColumn));
        index = objj_msgSend(selectedIndexes, "indexGreaterThanIndex:", index);
    }
    return set;
}
,["CPSet"]), new objj_method(sel_getUid("selectedItem"), function $CPBrowser__selectedItem(self, _cmd)
{
    var selectedColumn = objj_msgSend(self, "selectedColumn"),
        selectedRow = objj_msgSend(self, "selectedRowInColumn:", selectedColumn);
    return objj_msgSend(self, "itemAtRow:inColumn:", selectedRow, selectedColumn);
}
,["id"]), new objj_method(sel_getUid("trackMouse:"), function $CPBrowser__trackMouse_(self, _cmd, anEvent)
{
}
,["void","CPEvent"]), new objj_method(sel_getUid("_column:clickedRow:"), function $CPBrowser___column_clickedRow_(self, _cmd, columnIndex, rowIndex)
{
    objj_msgSend(self, "setLastColumn:", columnIndex);
    if (rowIndex >= 0)
        objj_msgSend(self, "addColumn");
    objj_msgSend(self, "doClick:", self);
}
,["void","unsigned","unsigned"]), new objj_method(sel_getUid("sendAction"), function $CPBrowser__sendAction(self, _cmd)
{
    objj_msgSend(self, "sendAction:to:", self._action, self._target);
}
,["void"]), new objj_method(sel_getUid("doClick:"), function $CPBrowser__doClick_(self, _cmd, sender)
{
    objj_msgSend(self, "sendAction:to:", self._action, self._target);
}
,["void","id"]), new objj_method(sel_getUid("doDoubleClick:"), function $CPBrowser__doDoubleClick_(self, _cmd, sender)
{
    objj_msgSend(self, "sendAction:to:", self._doubleAction, self._target);
}
,["void","id"]), new objj_method(sel_getUid("keyDown:"), function $CPBrowser__keyDown_(self, _cmd, anEvent)
{
    var key = objj_msgSend(anEvent, "charactersIgnoringModifiers"),
        column = objj_msgSend(self, "selectedColumn");
    if (column === CPNotFound)
        return;
    if (key === CPLeftArrowFunctionKey || key === CPRightArrowFunctionKey)
    {
        if (key === CPLeftArrowFunctionKey)
        {
            var previousColumn = column - 1,
                selectedRow = objj_msgSend(self, "selectedRowInColumn:", previousColumn);
            objj_msgSend(self, "selectRow:inColumn:", selectedRow, previousColumn);
        }
        else
            objj_msgSend(self, "selectRow:inColumn:", 0, column + 1);
    }
    else
        objj_msgSend(self._tableViews[column], "keyDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("columnContentWidthForColumnWidth:"), function $CPBrowser__columnContentWidthForColumnWidth_(self, _cmd, aWidth)
{
    var columnSpacing = objj_msgSend(self._tableViews[0], "intercellSpacing").width;
    return aWidth - (self._leafWidth + columnSpacing + (self._delegateSupportsImages ? self._imageWidth + columnSpacing : 0)) - columnSpacing - objj_msgSend(CPScroller, "scrollerWidth");
}
,["float","float"]), new objj_method(sel_getUid("columnWidthForColumnContentWidth:"), function $CPBrowser__columnWidthForColumnContentWidth_(self, _cmd, aWidth)
{
    var columnSpacing = objj_msgSend(self._tableViews[0], "intercellSpacing").width;
    return aWidth + (self._leafWidth + columnSpacing + (self._delegateSupportsImages ? self._imageWidth + columnSpacing : 0)) + columnSpacing + objj_msgSend(CPScroller, "scrollerWidth");
}
,["float","float"]), new objj_method(sel_getUid("setImageWidth:"), function $CPBrowser__setImageWidth_(self, _cmd, aWidth)
{
    self._imageWidth = aWidth;
    objj_msgSend(self, "tile");
}
,["void","float"]), new objj_method(sel_getUid("imageWidth"), function $CPBrowser__imageWidth(self, _cmd)
{
    return self._imageWidth;
}
,["float"]), new objj_method(sel_getUid("setMinColumnWidth:"), function $CPBrowser__setMinColumnWidth_(self, _cmd, minWidth)
{
    self._minColumnWidth = minWidth;
    objj_msgSend(self, "tile");
}
,["void","float"]), new objj_method(sel_getUid("minColumnWidth"), function $CPBrowser__minColumnWidth(self, _cmd)
{
    return self._minColumnWidth;
}
,["float"]), new objj_method(sel_getUid("setWidth:ofColumn:"), function $CPBrowser__setWidth_ofColumn_(self, _cmd, aWidth, column)
{
    self._columnWidths[column] = aWidth;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:didResizeColumn:")))
        objj_msgSend(self._delegate, "browser:didResizeColumn:", self, column);
    objj_msgSend(self, "tile");
}
,["void","float","unsigned"]), new objj_method(sel_getUid("widthOfColumn:"), function $CPBrowser__widthOfColumn_(self, _cmd, column)
{
    var width = self._columnWidths[column];
    if (width == null)
        width = self._defaultColumnWidth;
    return MAX(objj_msgSend(CPScroller, "scrollerWidth"), MAX(self._minColumnWidth, width));
}
,["float","unsigned"]), new objj_method(sel_getUid("setRowHeight:"), function $CPBrowser__setRowHeight_(self, _cmd, aHeight)
{
    self._rowHeight = aHeight;
}
,["void","float"]), new objj_method(sel_getUid("rowHeight"), function $CPBrowser__rowHeight(self, _cmd)
{
    return self._rowHeight;
}
,["float"]), new objj_method(sel_getUid("scrollColumnToVisible:"), function $CPBrowser__scrollColumnToVisible_(self, _cmd, columnIndex)
{
    objj_msgSend(self._contentView, "scrollRectToVisible:", objj_msgSend(objj_msgSend(objj_msgSend(self, "tableViewInColumn:", columnIndex), "enclosingScrollView"), "frame"));
}
,["void","unsigned"]), new objj_method(sel_getUid("scrollRowToVisible:inColumn:"), function $CPBrowser__scrollRowToVisible_inColumn_(self, _cmd, rowIndex, columnIndex)
{
    objj_msgSend(self, "scrollColumnToVisible:", columnIndex);
    objj_msgSend(objj_msgSend(self, "tableViewInColumn:", columnIndex), "scrollRowToVisible:", rowIndex);
}
,["void","unsigned","unsigned"]), new objj_method(sel_getUid("autohidesScroller"), function $CPBrowser__autohidesScroller(self, _cmd)
{
    return objj_msgSend(self._horizontalScrollView, "autohidesScrollers");
}
,["BOOL"]), new objj_method(sel_getUid("setAutohidesScroller:"), function $CPBrowser__setAutohidesScroller_(self, _cmd, shouldHide)
{
    objj_msgSend(self._horizontalScrollView, "setAutohidesScrollers:", shouldHide);
}
,["void","BOOL"]), new objj_method(sel_getUid("selectedRowInColumn:"), function $CPBrowser__selectedRowInColumn_(self, _cmd, columnIndex)
{
    if (columnIndex > objj_msgSend(self, "lastColumn") || columnIndex < 0)
        return -1;
    return objj_msgSend(self._tableViews[columnIndex], "selectedRow");
}
,["unsigned","unsigned"]), new objj_method(sel_getUid("selectedColumn"), function $CPBrowser__selectedColumn(self, _cmd)
{
    var column = objj_msgSend(self, "lastColumn"),
        row = objj_msgSend(self, "selectedRowInColumn:", column);
    if (row >= 0)
        return column;
    else
        return column - 1;
}
,["unsigned"]), new objj_method(sel_getUid("selectRow:inColumn:"), function $CPBrowser__selectRow_inColumn_(self, _cmd, row, column)
{
    var selectedIndexes = row === -1 ? objj_msgSend(CPIndexSet, "indexSet") : objj_msgSend(CPIndexSet, "indexSetWithIndex:", row);
    objj_msgSend(self, "selectRowIndexes:inColumn:", selectedIndexes, column);
}
,["void","unsigned","unsigned"]), new objj_method(sel_getUid("allowsMultipleSelection"), function $CPBrowser__allowsMultipleSelection(self, _cmd)
{
    return self._allowsMultipleSelection;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsMultipleSelection:"), function $CPBrowser__setAllowsMultipleSelection_(self, _cmd, shouldAllow)
{
    if (self._allowsMultipleSelection === shouldAllow)
        return;
    self._allowsMultipleSelection = shouldAllow;
    objj_msgSend(self._tableViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setAllowsMultipleSelection:"), shouldAllow);
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsEmptySelection"), function $CPBrowser__allowsEmptySelection(self, _cmd)
{
    return self._allowsEmptySelection;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsEmptySelection:"), function $CPBrowser__setAllowsEmptySelection_(self, _cmd, shouldAllow)
{
    if (self._allowsEmptySelection === shouldAllow)
        return;
    self._allowsEmptySelection = shouldAllow;
    objj_msgSend(self._tableViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setAllowsEmptySelection:"), shouldAllow);
}
,["void","BOOL"]), new objj_method(sel_getUid("selectedRowIndexesInColumn:"), function $CPBrowser__selectedRowIndexesInColumn_(self, _cmd, column)
{
    if (column < 0 || column > objj_msgSend(self, "lastColumn") + 1)
        return objj_msgSend(CPIndexSet, "indexSet");
    return objj_msgSend(objj_msgSend(self, "tableViewInColumn:", column), "selectedRowIndexes");
}
,["CPIndexSet","unsigned"]), new objj_method(sel_getUid("selectRowIndexes:inColumn:"), function $CPBrowser__selectRowIndexes_inColumn_(self, _cmd, indexSet, column)
{
    if (column < 0 || column > objj_msgSend(self, "lastColumn") + 1)
        return;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:selectionIndexesForProposedSelection:inColumn:")))
        indexSet = objj_msgSend(self._delegate, "browser:selectionIndexesForProposedSelection:inColumn:", self, indexSet, column);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:shouldSelectRowIndexes:inColumn:")) && !objj_msgSend(self._delegate, "browser:shouldSelectRowIndexes:inColumn:", self, indexSet, column))
        return;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browserSelectionIsChanging:")))
        objj_msgSend(self._delegate, "browserSelectionIsChanging:", self);
    if (column > objj_msgSend(self, "lastColumn"))
        objj_msgSend(self, "addColumn");
    objj_msgSend(self, "setLastColumn:", column);
    objj_msgSend(objj_msgSend(self, "tableViewInColumn:", column), "selectRowIndexes:byExtendingSelection:", indexSet, NO);
    objj_msgSend(self, "scrollColumnToVisible:", column);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browserSelectionDidChange:")))
        objj_msgSend(self._delegate, "browserSelectionDidChange:", self);
}
,["void","CPIndexSet","unsigned"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPBrowser__setBackgroundColor_(self, _cmd, aColor)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBrowser").super_class }, "setBackgroundColor:", aColor);
    objj_msgSend(self._contentView, "setBackgroundColor:", aColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPBrowser__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("registerForDraggedTypes:"), function $CPBrowser__registerForDraggedTypes_(self, _cmd, types)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBrowser").super_class }, "registerForDraggedTypes:", types);
    objj_msgSend(self._tableViews, "makeObjectsPerformSelector:withObject:", sel_getUid("registerForDraggedTypes:"), types);
}
,["void","CPArray"]), new objj_method(sel_getUid("canDragRowsWithIndexes:inColumn:withEvent:"), function $CPBrowser__canDragRowsWithIndexes_inColumn_withEvent_(self, _cmd, rowIndexes, columnIndex, dragEvent)
{
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:canDragRowsWithIndexes:inColumn:withEvent:")))
        return objj_msgSend(self._delegate, "browser:canDragRowsWithIndexes:inColumn:withEvent:", self, rowIndexes, columnIndex, dragEvent);
    return YES;
}
,["BOOL","CPIndexSet","CPInteger","CPEvent"]), new objj_method(sel_getUid("draggingImageForRowsWithIndexes:inColumn:withEvent:offset:"), function $CPBrowser__draggingImageForRowsWithIndexes_inColumn_withEvent_offset_(self, _cmd, rowIndexes, columnIndex, dragEvent, dragImageOffset)
{
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:draggingImageForRowsWithIndexes:inColumn:withEvent:offset:")))
        return objj_msgSend(self._delegate, "browser:draggingImageForRowsWithIndexes:inColumn:withEvent:offset:", self, rowIndexes, columnIndex, dragEvent, dragImageOffset);
    return nil;
}
,["CPImage","CPIndexSet","CPInteger","CPEvent","CGPoint"]), new objj_method(sel_getUid("draggingViewForRowsWithIndexes:inColumn:withEvent:offset:"), function $CPBrowser__draggingViewForRowsWithIndexes_inColumn_withEvent_offset_(self, _cmd, rowIndexes, columnIndex, dragEvent, dragImageOffset)
{
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:draggingViewForRowsWithIndexes:inColumn:withEvent:offset:")))
        return objj_msgSend(self._delegate, "browser:draggingViewForRowsWithIndexes:inColumn:withEvent:offset:", self, rowIndexes, columnIndex, dragEvent, dragImageOffset);
    return nil;
}
,["CPView","CPIndexSet","CPInteger","CPEvent","CGPoint"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPBrowser__defaultThemeClass(self, _cmd)
{
    return "browser";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPBrowser__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "image-control-resize", objj_msgSend(CPNull, "null"), "image-control-leaf", objj_msgSend(CPNull, "null"), "image-control-leaf-pressed");
}
,["CPDictionary"])]);
}{
var the_class = objj_getClass("CPBrowser")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPBrowser\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPBrowser__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBrowser").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "_init");
        self._allowsEmptySelection = objj_msgSend(aCoder, "decodeBoolForKey:", "CPBrowserAllowsEmptySelectionKey");
        self._allowsMultipleSelection = objj_msgSend(aCoder, "decodeBoolForKey:", "CPBrowserAllowsMultipleSelectionKey");
        self._prototypeView = objj_msgSend(aCoder, "decodeObjectForKey:", "CPBrowserPrototypeViewKey");
        self._rowHeight = objj_msgSend(aCoder, "decodeFloatForKey:", "CPBrowserRowHeightKey");
        self._imageWidth = objj_msgSend(aCoder, "decodeFloatForKey:", "CPBrowserImageWidthKey");
        self._minColumnWidth = objj_msgSend(aCoder, "decodeFloatForKey:", "CPBrowserMinColumnWidthKey");
        self._columnWidths = objj_msgSend(aCoder, "decodeObjectForKey:", "CPBrowserColumnWidthsKey");
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", "CPBrowserDelegateKey"));
        objj_msgSend(self, "setAutohidesScroller:", objj_msgSend(aCoder, "decodeBoolForKey:", "CPBrowserAutohidesScrollerKey"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPBrowser__encodeWithCoder_(self, _cmd, aCoder)
{
    var actualSubviews = self._subviews;
    self._subviews = [];
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBrowser").super_class }, "encodeWithCoder:", aCoder);
    self._subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeBool:forKey:", objj_msgSend(self, "autohidesScroller"), "CPBrowserAutohidesScrollerKey");
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsEmptySelection, "CPBrowserAllowsEmptySelectionKey");
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsMultipleSelection, "CPBrowserAllowsMultipleSelectionKey");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._delegate, "CPBrowserDelegateKey");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._prototypeView, "CPBrowserPrototypeViewKey");
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._rowHeight, "CPBrowserRowHeightKey");
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._imageWidth, "CPBrowserImageWidthKey");
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._minColumnWidth, "CPBrowserMinColumnWidthKey");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._columnWidths, "CPBrowserColumnWidthsKey");
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPBrowserResizeControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_mouseDownX"), new objj_ivar("_browser"), new objj_ivar("_index"), new objj_ivar("_width")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPBrowserResizeControl__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserResizeControl").super_class }, "initWithFrame:", aFrame))
    {
        var browser = objj_msgSend(objj_msgSend(CPBrowser, "alloc"), "init");
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(browser, "valueForThemeAttribute:", "image-control-resize")));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("mouseDown:"), function $_CPBrowserResizeControl__mouseDown_(self, _cmd, anEvent)
{
    self._mouseDownX = objj_msgSend(anEvent, "locationInWindow").x;
    self._browser = objj_msgSend(objj_msgSend(self, "superview"), "_browser");
    self._index = objj_msgSend(self._browser, "columnOfTableView:", objj_msgSend(objj_msgSend(self, "superview"), "documentView"));
    self._width = objj_msgSend(self._browser, "widthOfColumn:", self._index);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $_CPBrowserResizeControl__mouseDragged_(self, _cmd, anEvent)
{
    var deltaX = objj_msgSend(anEvent, "locationInWindow").x - self._mouseDownX;
    objj_msgSend(self._browser, "setWidth:ofColumn:", self._width + deltaX, self._index);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $_CPBrowserResizeControl__mouseUp_(self, _cmd, anEvent)
{
}
,["void","CPEvent"])]);
}{var the_class = objj_allocateClassPair(CPScrollView, "_CPBrowserScrollView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_resizeControl"), new objj_ivar("_browser")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_browser"), function $_CPBrowserScrollView___browser(self, _cmd)
{
    return self._browser;
}
,["CPBrowser"]), new objj_method(sel_getUid("_setBrowser:"), function $_CPBrowserScrollView___setBrowser_(self, _cmd, newValue)
{
    self._browser = newValue;
}
,["void","CPBrowser"]), new objj_method(sel_getUid("initWithFrame:"), function $_CPBrowserScrollView__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserScrollView").super_class }, "initWithFrame:", aFrame))
    {
        self._resizeControl = objj_msgSend(objj_msgSend(_CPBrowserResizeControl, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self, "addSubview:", self._resizeControl);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("reflectScrolledClipView:"), function $_CPBrowserScrollView__reflectScrolledClipView_(self, _cmd, aClipView)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserScrollView").super_class }, "reflectScrolledClipView:", aClipView);
    var frame = objj_msgSend(self._verticalScroller, "frame");
    frame.size.height = CGRectGetHeight(objj_msgSend(self, "bounds")) - 14.0 - frame.origin.y;
    objj_msgSend(self._verticalScroller, "setFrameSize:", frame.size);
    var resizeFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMaxY(frame), objj_msgSend(CPScroller, "scrollerWidth"), 14.0);
    objj_msgSend(self._resizeControl, "setFrame:", resizeFrame);
}
,["void","CPClipView"])]);
}{var the_class = objj_allocateClassPair(CPTableView, "_CPBrowserTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_browser")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:browser:"), function $_CPBrowserTableView__initWithFrame_browser_(self, _cmd, aFrame, aBrowser)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserTableView").super_class }, "initWithFrame:", aFrame))
        self._browser = aBrowser;
    return self;
}
,["id","CGRect","CPBrowser"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $_CPBrowserTableView__acceptsFirstResponder(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("mouseDown:"), function $_CPBrowserTableView__mouseDown_(self, _cmd, anEvent)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserTableView").super_class }, "mouseDown:", anEvent);
    objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self._browser);
}
,["void","CPEvent"]), new objj_method(sel_getUid("browserView"), function $_CPBrowserTableView__browserView(self, _cmd)
{
    return self._browser;
}
,["CPView"]), new objj_method(sel_getUid("_isFocused"), function $_CPBrowserTableView___isFocused(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserTableView").super_class }, "_isFocused") || objj_msgSend(self._browser, "tableViewInColumn:", objj_msgSend(self._browser, "selectedColumn")) === self;
}
,["BOOL"]), new objj_method(sel_getUid("canDragRowsWithIndexes:atPoint:"), function $_CPBrowserTableView__canDragRowsWithIndexes_atPoint_(self, _cmd, rowIndexes, mouseDownPoint)
{
    return objj_msgSend(self._browser, "canDragRowsWithIndexes:inColumn:withEvent:", rowIndexes, objj_msgSend(self._browser, "columnOfTableView:", self), objj_msgSend(CPApp, "currentEvent"));
}
,["BOOL","CPIndexSet","CGPoint"]), new objj_method(sel_getUid("dragImageForRowsWithIndexes:tableColumns:event:offset:"), function $_CPBrowserTableView__dragImageForRowsWithIndexes_tableColumns_event_offset_(self, _cmd, dragRows, theTableColumns, dragEvent, dragImageOffset)
{
    return objj_msgSend(self._browser, "draggingImageForRowsWithIndexes:inColumn:withEvent:offset:", dragRows, objj_msgSend(self._browser, "columnOfTableView:", self), dragEvent, dragImageOffset) || objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserTableView").super_class }, "dragImageForRowsWithIndexes:tableColumns:event:offset:", dragRows, theTableColumns, dragEvent, dragImageOffset);
}
,["CPImage","CPIndexSet","CPArray","CPEvent","CGPoint"]), new objj_method(sel_getUid("dragViewForRowsWithIndexes:tableColumns:event:offset:"), function $_CPBrowserTableView__dragViewForRowsWithIndexes_tableColumns_event_offset_(self, _cmd, dragRows, theTableColumns, dragEvent, dragViewOffset)
{
    var count = theTableColumns.length;
    while (count--)
    {
        if (objj_msgSend(theTableColumns[count], "identifier") === "Leaf")
            objj_msgSend(theTableColumns, "removeObject:", theTableColumns[count]);
    }
    return objj_msgSend(self._browser, "draggingViewForRowsWithIndexes:inColumn:withEvent:offset:", dragRows, objj_msgSend(self._browser, "columnOfTableView:", self), dragEvent, dragViewOffset) || objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserTableView").super_class }, "dragViewForRowsWithIndexes:tableColumns:event:offset:", dragRows, theTableColumns, dragEvent, dragViewOffset);
}
,["CPView","CPIndexSet","CPArray","CPEvent","CGPoint"])]);
}objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "_CPBrowserTableDelegate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_browser"), new objj_ivar("_index"), new objj_ivar("_delegate"), new objj_ivar("_item")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_browser"), function $_CPBrowserTableDelegate___browser(self, _cmd)
{
    return self._browser;
}
,["CPBrowser"]), new objj_method(sel_getUid("_setBrowser:"), function $_CPBrowserTableDelegate___setBrowser_(self, _cmd, newValue)
{
    self._browser = newValue;
}
,["void","CPBrowser"]), new objj_method(sel_getUid("_index"), function $_CPBrowserTableDelegate___index(self, _cmd)
{
    return self._index;
}
,["unsigned"]), new objj_method(sel_getUid("_setIndex:"), function $_CPBrowserTableDelegate___setIndex_(self, _cmd, newValue)
{
    self._index = newValue;
}
,["void","unsigned"]), new objj_method(sel_getUid("_delegate"), function $_CPBrowserTableDelegate___delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("_setDelegate:"), function $_CPBrowserTableDelegate___setDelegate_(self, _cmd, newValue)
{
    self._delegate = newValue;
}
,["void","id"]), new objj_method(sel_getUid("_item"), function $_CPBrowserTableDelegate___item(self, _cmd)
{
    return self._item;
}
,["id"]), new objj_method(sel_getUid("_setItem:"), function $_CPBrowserTableDelegate___setItem_(self, _cmd, newValue)
{
    self._item = newValue;
}
,["void","id"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $_CPBrowserTableDelegate__numberOfRowsInTableView_(self, _cmd, aTableView)
{
    return objj_msgSend(self._delegate, "browser:numberOfChildrenOfItem:", self._browser, self._item);
}
,["unsigned","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $_CPBrowserTableDelegate__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, column, row)
{
    if (objj_msgSend(column, "identifier") === "Image")
        return objj_msgSend(self._delegate, "browser:imageValueForItem:", self._browser, objj_msgSend(self, "childAtIndex:", row));
    else if (objj_msgSend(column, "identifier") === "Leaf")
        return !objj_msgSend(self._browser, "isLeafItem:", objj_msgSend(self, "childAtIndex:", row));
    else
        return objj_msgSend(self._delegate, "browser:objectValueForItem:", self._browser, objj_msgSend(self, "childAtIndex:", row));
}
,["void","CPTableView","CPTableColumn","unsigned"]), new objj_method(sel_getUid("_tableViewDoubleClicked:"), function $_CPBrowserTableDelegate___tableViewDoubleClicked_(self, _cmd, aTableView)
{
    objj_msgSend(self._browser, "doDoubleClick:", self);
}
,["void","CPTableView"]), new objj_method(sel_getUid("_tableViewClicked:"), function $_CPBrowserTableDelegate___tableViewClicked_(self, _cmd, aTableView)
{
    var selectedIndexes = objj_msgSend(aTableView, "selectedRowIndexes");
    objj_msgSend(self._browser, "_column:clickedRow:", self._index, objj_msgSend(selectedIndexes, "count") === 1 ? objj_msgSend(selectedIndexes, "firstIndex") : -1);
}
,["void","CPTableView"]), new objj_method(sel_getUid("tableViewSelectionDidChange:"), function $_CPBrowserTableDelegate__tableViewSelectionDidChange_(self, _cmd, aNotification)
{
    var selectedIndexes = objj_msgSend(objj_msgSend(aNotification, "object"), "selectedRowIndexes");
    objj_msgSend(self._browser, "selectRowIndexes:inColumn:", selectedIndexes, self._index);
}
,["void","CPNotification"]), new objj_method(sel_getUid("childAtIndex:"), function $_CPBrowserTableDelegate__childAtIndex_(self, _cmd, index)
{
    return objj_msgSend(self._delegate, "browser:child:ofItem:", self._browser, index, self._item);
}
,["id","CPUInteger"]), new objj_method(sel_getUid("tableView:acceptDrop:row:dropOperation:"), function $_CPBrowserTableDelegate__tableView_acceptDrop_row_dropOperation_(self, _cmd, aTableView, info, row, operation)
{
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:acceptDrop:atRow:column:dropOperation:")))
        return objj_msgSend(self._delegate, "browser:acceptDrop:atRow:column:dropOperation:", self._browser, info, row, self._index, operation);
    else
        return NO;
}
,["BOOL","CPTableView","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"), function $_CPBrowserTableDelegate__tableView_validateDrop_proposedRow_proposedDropOperation_(self, _cmd, aTableView, info, row, operation)
{
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:validateDrop:proposedRow:column:dropOperation:")))
        return objj_msgSend(self._delegate, "browser:validateDrop:proposedRow:column:dropOperation:", self._browser, info, row, self._index, operation);
    else
        return CPDragOperationNone;
}
,["CPDragOperation","CPTableView","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"), function $_CPBrowserTableDelegate__tableView_writeRowsWithIndexes_toPasteboard_(self, _cmd, aTableView, rowIndexes, pboard)
{
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:writeRowsWithIndexes:inColumn:toPasteboard:")))
        return objj_msgSend(self._delegate, "browser:writeRowsWithIndexes:inColumn:toPasteboard:", self._browser, rowIndexes, self._index, pboard);
    else
        return NO;
}
,["BOOL","CPTableView","CPIndexSet","CPPasteboard"]), new objj_method(sel_getUid("respondsToSelector:"), function $_CPBrowserTableDelegate__respondsToSelector_(self, _cmd, aSelector)
{
    if (aSelector === sel_getUid("browser:writeRowsWithIndexes:inColumn:toPasteboard:"))
        return objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("browser:writeRowsWithIndexes:inColumn:toPasteboard:"));
    else
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserTableDelegate").super_class }, "respondsToSelector:", aSelector);
}
,["BOOL","SEL"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPBrowserLeafView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isLeaf"), new objj_ivar("_branchImage"), new objj_ivar("_highlightedBranchImage")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isLeaf"), function $_CPBrowserLeafView__isLeaf(self, _cmd)
{
    return self._isLeaf;
}
,["BOOL"]), new objj_method(sel_getUid("branchImage"), function $_CPBrowserLeafView__branchImage(self, _cmd)
{
    return self._branchImage;
}
,["CPImage"]), new objj_method(sel_getUid("setBranchImage:"), function $_CPBrowserLeafView__setBranchImage_(self, _cmd, newValue)
{
    self._branchImage = newValue;
}
,["void","CPImage"]), new objj_method(sel_getUid("highlightedBranchImage"), function $_CPBrowserLeafView__highlightedBranchImage(self, _cmd)
{
    return self._highlightedBranchImage;
}
,["CPImage"]), new objj_method(sel_getUid("setHighlightedBranchImage:"), function $_CPBrowserLeafView__setHighlightedBranchImage_(self, _cmd, newValue)
{
    self._highlightedBranchImage = newValue;
}
,["void","CPImage"]), new objj_method(sel_getUid("objectValue"), function $_CPBrowserLeafView__objectValue(self, _cmd)
{
    return self._isLeaf;
}
,["BOOL"]), new objj_method(sel_getUid("setObjectValue:"), function $_CPBrowserLeafView__setObjectValue_(self, _cmd, aValue)
{
    self._isLeaf = !!aValue;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","id"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $_CPBrowserLeafView__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "image-view")
        return CGRectInset(objj_msgSend(self, "bounds"), 1, 1);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserLeafView").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $_CPBrowserLeafView__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "image-view")
        return objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserLeafView").super_class }, "createEphemeralSubviewNamed:", aName);
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPBrowserLeafView__layoutSubviews(self, _cmd)
{
    var imageView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "image-view", CPWindowAbove, nil),
        isHighlighted = objj_msgSend(self, "themeState") & CPThemeStateSelectedDataView;
    objj_msgSend(imageView, "setImage:", self._isLeaf ? isHighlighted ? self._highlightedBranchImage : self._branchImage : nil);
    objj_msgSend(imageView, "setImageScaling:", CPImageScaleNone);
}
,["void"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPBrowserLeafView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserLeafView").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isLeaf, "_CPBrowserLeafViewIsLeafKey");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._branchImage, "_CPBrowserLeafViewBranchImageKey");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._highlightedBranchImage, "_CPBrowserLeafViewHighlightedBranchImageKey");
}
,["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPBrowserLeafView__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserLeafView").super_class }, "initWithCoder:", aCoder))
    {
        self._isLeaf = objj_msgSend(aCoder, "decodeBoolForKey:", "_CPBrowserLeafViewIsLeafKey");
        self._branchImage = objj_msgSend(aCoder, "decodeObjectForKey:", "_CPBrowserLeafViewBranchImageKey");
        self._highlightedBranchImage = objj_msgSend(aCoder, "decodeObjectForKey:", "_CPBrowserLeafViewHighlightedBranchImageKey");
    }
    return self;
}
,["id","CPCoder"])]);
}