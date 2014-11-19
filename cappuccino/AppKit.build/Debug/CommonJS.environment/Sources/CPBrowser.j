@STATIC;1.0;I;21;Foundation/CPObject.jI;23;Foundation/CPIndexSet.ji;11;CPControl.ji;9;CPImage.ji;14;CPScrollView.ji;13;CPTableView.ji;13;CPTextField.jt;69286;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("CPControl.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPScrollView.j", YES);objj_executeFile("CPTableView.j", YES);objj_executeFile("CPTextField.j", YES);{var the_protocol = objj_allocateProtocol("CPBrowserDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPBrowserDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}var CPBrowserDelegate_browser_acceptDrop_atRow_column_dropOperation_ = 1 << 1,
    CPBrowserDelegate_browser_canDragRowsWithIndexes_inColumn_withEvent_ = 1 << 2,
    CPBrowserDelegate_browser_isLeafItem_ = 1 << 3,
    CPBrowserDelegate_browser_shouldSelectRowIndexes_inColumn_ = 1 << 4,
    CPBrowserDelegate_browser_writeRowsWithIndexes_inColumn_toPasteboard_ = 1 << 5,
    CPBrowserDelegate_browser_validateDrop_proposedRow_column_dropOperation_ = 1 << 6,
    CPBrowserDelegate_browser_imageValueForItem_ = 1 << 7,
    CPBrowserDelegate_browser_draggingImageForRowsWithIndexes_inColumn_withEvent_offset_ = 1 << 8,
    CPBrowserDelegate_browser_imageValueForItem_ = 1 << 9,
    CPBrowserDelegate_browser_selectionIndexesForProposedSelection_inColumn_ = 1 << 10,
    CPBrowserDelegate_browser_numberOfChildrenOfItem_ = 1 << 11,
    CPBrowserDelegate_browser_draggingViewForRowsWithIndexes_inColumn_withEvent_offset_ = 1 << 12,
    CPBrowserDelegate_browser_child_ofItem_ = 1 << 13,
    CPBrowserDelegate_browser_objectValueForItem_ = 1 << 14,
    CPBrowserDelegate_rootItemForBrowser_ = 1 << 15,
    CPBrowserDelegate_browser_didChangeLastColumn_toColumn_ = 1 << 16,
    CPBrowserDelegate_browser_didResizeColumn_ = 1 << 17,
    CPBrowserDelegate_browserSelectionIsChanging_ = 1 << 18,
    CPBrowserDelegate_browserSelectionDidChange_ = 1 << 19;
{var the_class = objj_allocateClassPair(CPControl, "CPBrowser"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_pathSeparator"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_contentView"), new objj_ivar("_horizontalScrollView"), new objj_ivar("_prototypeView"), new objj_ivar("_tableViews"), new objj_ivar("_tableDelegates"), new objj_ivar("_rootItem"), new objj_ivar("_delegateSupportsImages"), new objj_ivar("_doubleAction"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_allowsEmptySelection"), new objj_ivar("_tableViewClass"), new objj_ivar("_rowHeight"), new objj_ivar("_imageWidth"), new objj_ivar("_leafWidth"), new objj_ivar("_minColumnWidth"), new objj_ivar("_defaultColumnWidth"), new objj_ivar("_columnWidths")]);objj_registerClassPair(the_class);
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
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
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
    self._tableViewClass = (_CPBrowserTableView == null ? null : _CPBrowserTableView.isa.objj_msgSend0(_CPBrowserTableView, "class"));
    self._prototypeView = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self._prototypeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setVerticalAlignment:", CPCenterVerticalTextAlignment));
    ((___r1 = self._prototypeView), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor"), "text-color", CPThemeStateSelectedDataView));
    ((___r1 = self._prototypeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", CPLineBreakByTruncatingTail));
    self._horizontalScrollView = ((___r1 = CPScrollView.isa.objj_msgSend0(CPScrollView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", self.isa.objj_msgSend0(self, "bounds")));
    ((___r1 = self._horizontalScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHasVerticalScroller:", NO));
    ((___r1 = self._horizontalScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutohidesScrollers:", YES));
    ((___r1 = self._horizontalScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    self._contentView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 0, CGRectGetHeight(self.isa.objj_msgSend0(self, "bounds")))));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewHeightSizable));
    ((___r1 = self._horizontalScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", self._contentView));
    self.isa.objj_msgSend1(self, "addSubview:", self._horizontalScrollView);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setPrototypeView:"), function $CPBrowser__setPrototypeView_(self, _cmd, aPrototypeView)
{
    self._prototypeView = CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", aPrototypeView));
}
,["void","CPView"]), new objj_method(sel_getUid("prototypeView"), function $CPBrowser__prototypeView(self, _cmd)
{
    return CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", self._prototypeView));
}
,["CPView"]), new objj_method(sel_getUid("setDelegate:"), function $CPBrowser__setDelegate_(self, _cmd, anObject)
{
    if (self._delegate === anObject)
        return;
    self._delegate = anObject;
    self._implementedDelegateMethods = 0;
    self._delegateSupportsImages = NO;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:acceptDrop:atRow:column:dropOperation:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_acceptDrop_atRow_column_dropOperation_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:canDragRowsWithIndexes:inColumn:withEvent:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_canDragRowsWithIndexes_inColumn_withEvent_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:isLeafItem:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_isLeafItem_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:shouldSelectRowIndexes:inColumn:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_shouldSelectRowIndexes_inColumn_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:writeRowsWithIndexes:inColumn:toPasteboard:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_writeRowsWithIndexes_inColumn_toPasteboard_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:validateDrop:proposedRow:column:dropOperation:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_validateDrop_proposedRow_column_dropOperation_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:imageValueForItem:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_imageValueForItem_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:draggingImageForRowsWithIndexes:inColumn:withEvent:offset:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_draggingImageForRowsWithIndexes_inColumn_withEvent_offset_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:imageValueForItem:"))))
    {
        self._delegateSupportsImages = YES;
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_imageValueForItem_;
    }
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:selectionIndexesForProposedSelection:inColumn:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_selectionIndexesForProposedSelection_inColumn_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:numberOfChildrenOfItem:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_numberOfChildrenOfItem_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:draggingViewForRowsWithIndexes:inColumn:withEvent:offset:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_draggingViewForRowsWithIndexes_inColumn_withEvent_offset_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:child:ofItem:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_child_ofItem_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:objectValueForItem:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_objectValueForItem_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("rootItemForBrowser:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_rootItemForBrowser_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:didChangeLastColumn:toColumn:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_didChangeLastColumn_toColumn_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:didChangeLastColumn:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browser_didResizeColumn_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browserSelectionIsChanging:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browserSelectionIsChanging_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browserSelectionDidChange:"))))
        self._implementedDelegateMethods |= CPBrowserDelegate_browserSelectionDidChange_;
    self.isa.objj_msgSend0(self, "loadColumnZero");
    var ___r1;
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
    return ((___r1 = self._tableViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", aTableView));
    var ___r1;
}
,["unsigned","CPTableView"]), new objj_method(sel_getUid("loadColumnZero"), function $CPBrowser__loadColumnZero(self, _cmd)
{
    self._rootItem = self.isa.objj_msgSend0(self, "_sendDelegateRootItemForBrowser");
    self.isa.objj_msgSend1(self, "setLastColumn:", -1);
    self.isa.objj_msgSend0(self, "addColumn");
}
,["void"]), new objj_method(sel_getUid("setLastColumn:"), function $CPBrowser__setLastColumn_(self, _cmd, columnIndex)
{
    if (columnIndex >= self._tableViews.length)
        return;
    var oldValue = self._tableViews.length - 1,
        indexPlusOne = columnIndex + 1;
    if (columnIndex > 0)
        ((___r1 = self._tableViews[columnIndex - 1]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    ((___r1 = self._tableViews[columnIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    ((___r1 = ((___r2 = self._tableViews.slice(indexPlusOne)), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", "enclosingScrollView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview")));
    self._tableViews = self._tableViews.slice(0, indexPlusOne);
    self._tableDelegates = self._tableDelegates.slice(0, indexPlusOne);
    self.isa.objj_msgSend2(self, "_sendDelegateBrowserDidChangeLastColumn:toColumn:", oldValue, columnIndex);
    self.isa.objj_msgSend0(self, "tile");
    var ___r1, ___r2;
}
,["void","CPInteger"]), new objj_method(sel_getUid("lastColumn"), function $CPBrowser__lastColumn(self, _cmd)
{
    return self._tableViews.length - 1;
}
,["int"]), new objj_method(sel_getUid("addColumn"), function $CPBrowser__addColumn(self, _cmd)
{
    var lastIndex = self.isa.objj_msgSend0(self, "lastColumn"),
        lastColumn = self._tableViews[lastIndex],
        selectionIndexes = (lastColumn == null ? null : lastColumn.isa.objj_msgSend0(lastColumn, "selectedRowIndexes"));
    if (lastIndex >= 0 && (selectionIndexes == null ? null : selectionIndexes.isa.objj_msgSend0(selectionIndexes, "count")) > 1)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Can't add column, column " + lastIndex + " has invalid selection.");
    var index = lastIndex + 1,
        item = index === 0 ? self._rootItem : ((___r1 = self._tableDelegates[lastIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "childAtIndex:", (selectionIndexes == null ? null : selectionIndexes.isa.objj_msgSend0(selectionIndexes, "firstIndex"))));
    if (index > 0 && item && self.isa.objj_msgSend1(self, "isLeafItem:", item))
        return;
    var table = ((___r1 = ((___r2 = self._tableViewClass), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithFrame:browser:", CGRectMakeZero(), self));
    (table == null ? null : table.isa.objj_msgSend1(table, "setHeaderView:", nil));
    (table == null ? null : table.isa.objj_msgSend1(table, "setCornerView:", nil));
    (table == null ? null : table.isa.objj_msgSend1(table, "setAllowsMultipleSelection:", self._allowsMultipleSelection));
    (table == null ? null : table.isa.objj_msgSend1(table, "setAllowsEmptySelection:", self._allowsEmptySelection));
    (table == null ? null : table.isa.objj_msgSend1(table, "registerForDraggedTypes:", self.isa.objj_msgSend0(self, "registeredDraggedTypes")));
    self.isa.objj_msgSend2(self, "_addTableColumnsToTableView:forColumnIndex:", table, index);
    var delegate = ((___r1 = (_CPBrowserTableDelegate == null ? null : _CPBrowserTableDelegate.isa.objj_msgSend0(_CPBrowserTableDelegate, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (delegate == null ? null : delegate.isa.objj_msgSend1(delegate, "_setDelegate:", self._delegate));
    (delegate == null ? null : delegate.isa.objj_msgSend1(delegate, "_setBrowser:", self));
    (delegate == null ? null : delegate.isa.objj_msgSend1(delegate, "_setIndex:", index));
    (delegate == null ? null : delegate.isa.objj_msgSend1(delegate, "_setItem:", item));
    self._tableViews[index] = table;
    self._tableDelegates[index] = delegate;
    (table == null ? null : table.isa.objj_msgSend1(table, "setDelegate:", delegate));
    (table == null ? null : table.isa.objj_msgSend1(table, "setDataSource:", delegate));
    (table == null ? null : table.isa.objj_msgSend1(table, "setTarget:", delegate));
    (table == null ? null : table.isa.objj_msgSend1(table, "setAction:", sel_getUid("_tableViewClicked:")));
    (table == null ? null : table.isa.objj_msgSend1(table, "setDoubleAction:", sel_getUid("_tableViewDoubleClicked:")));
    (table == null ? null : table.isa.objj_msgSend1(table, "setDraggingDestinationFeedbackStyle:", CPTableViewDraggingDestinationFeedbackStyleRegular));
    var scrollView = ((___r1 = (_CPBrowserScrollView == null ? null : _CPBrowserScrollView.isa.objj_msgSend0(_CPBrowserScrollView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (scrollView == null ? null : scrollView.isa.objj_msgSend1(scrollView, "_setBrowser:", self));
    (scrollView == null ? null : scrollView.isa.objj_msgSend1(scrollView, "setDocumentView:", table));
    (scrollView == null ? null : scrollView.isa.objj_msgSend1(scrollView, "setHasHorizontalScroller:", NO));
    (scrollView == null ? null : scrollView.isa.objj_msgSend1(scrollView, "setAutoresizingMask:", CPViewHeightSizable));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", scrollView));
    self.isa.objj_msgSend0(self, "tile");
    self.isa.objj_msgSend1(self, "scrollColumnToVisible:", index);
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("_addTableColumnsToTableView:forColumnIndex:"), function $CPBrowser___addTableColumnsToTableView_forColumnIndex_(self, _cmd, aTableView, index)
{
    if (self._delegateSupportsImages)
    {
        var column = ((___r1 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIdentifier:", "Image")),
            view = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        (view == null ? null : view.isa.objj_msgSend1(view, "setImageScaling:", CPImageScaleProportionallyDown));
        (column == null ? null : column.isa.objj_msgSend1(column, "setDataView:", view));
        (column == null ? null : column.isa.objj_msgSend1(column, "setResizingMask:", CPTableColumnNoResizing));
        (aTableView == null ? null : aTableView.isa.objj_msgSend1(aTableView, "addTableColumn:", column));
    }
    var column = ((___r1 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIdentifier:", "Content"));
    (column == null ? null : column.isa.objj_msgSend1(column, "setDataView:", self._prototypeView));
    (column == null ? null : column.isa.objj_msgSend1(column, "setResizingMask:", CPTableColumnNoResizing));
    (aTableView == null ? null : aTableView.isa.objj_msgSend1(aTableView, "addTableColumn:", column));
    var column = ((___r1 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIdentifier:", "Leaf")),
        view = ((___r1 = (_CPBrowserLeafView == null ? null : _CPBrowserLeafView.isa.objj_msgSend0(_CPBrowserLeafView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (view == null ? null : view.isa.objj_msgSend1(view, "setBranchImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-control-leaf")));
    (view == null ? null : view.isa.objj_msgSend1(view, "setHighlightedBranchImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-control-leaf-pressed")));
    (column == null ? null : column.isa.objj_msgSend1(column, "setDataView:", view));
    (column == null ? null : column.isa.objj_msgSend1(column, "setResizingMask:", CPTableColumnNoResizing));
    (aTableView == null ? null : aTableView.isa.objj_msgSend1(aTableView, "addTableColumn:", column));
    var ___r1;
}
,["void","CPTableView","unsigned"]), new objj_method(sel_getUid("reloadColumn:"), function $CPBrowser__reloadColumn_(self, _cmd, column)
{
    ((___r1 = self.isa.objj_msgSend1(self, "tableViewInColumn:", column)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("tile"), function $CPBrowser__tile(self, _cmd)
{
    var xOrigin = 0,
        scrollerWidth = CPScroller.isa.objj_msgSend0(CPScroller, "scrollerWidth"),
        height = CGRectGetHeight(((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")));
    for (var i = 0, count = self._tableViews.length; i < count; i++)
    {
        var tableView = self._tableViews[i],
            scrollView = (tableView == null ? null : tableView.isa.objj_msgSend0(tableView, "enclosingScrollView")),
            width = self.isa.objj_msgSend1(self, "widthOfColumn:", i),
            tableHeight = CGRectGetHeight((tableView == null ? null : tableView.isa.objj_msgSend0(tableView, "bounds")));
        ((___r1 = (tableView == null ? null : tableView.isa.objj_msgSend1(tableView, "tableColumnWithIdentifier:", "Image"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWidth:", self._imageWidth));
        ((___r1 = (tableView == null ? null : tableView.isa.objj_msgSend1(tableView, "tableColumnWithIdentifier:", "Content"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWidth:", self.isa.objj_msgSend1(self, "columnContentWidthForColumnWidth:", width)));
        ((___r1 = (tableView == null ? null : tableView.isa.objj_msgSend1(tableView, "tableColumnWithIdentifier:", "Leaf"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWidth:", self._leafWidth));
        (tableView == null ? null : tableView.isa.objj_msgSend1(tableView, "setRowHeight:", self._rowHeight));
        (tableView == null ? null : tableView.isa.objj_msgSend1(tableView, "setFrameSize:", CGSizeMake(width - scrollerWidth, tableHeight)));
        (scrollView == null ? null : scrollView.isa.objj_msgSend1(scrollView, "setFrameOrigin:", CGPointMake(xOrigin, 0)));
        (scrollView == null ? null : scrollView.isa.objj_msgSend1(scrollView, "setFrameSize:", CGSizeMake(width, height)));
        xOrigin += width;
    }
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(xOrigin, height)));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("rowAtPoint:"), function $CPBrowser__rowAtPoint_(self, _cmd, aPoint)
{
    var column = self.isa.objj_msgSend1(self, "columnAtPoint:", aPoint);
    if (column === -1)
        return -1;
    var tableView = self._tableViews[column];
    return (tableView == null ? null : tableView.isa.objj_msgSend1(tableView, "rowAtPoint:", (tableView == null ? null : tableView.isa.objj_msgSend2(tableView, "convertPoint:fromView:", aPoint, self))));
}
,["unsigned","CGPoint"]), new objj_method(sel_getUid("columnAtPoint:"), function $CPBrowser__columnAtPoint_(self, _cmd, aPoint)
{
    var adjustedPoint = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertPoint:fromView:", aPoint, self));
    for (var i = 0, count = self._tableViews.length; i < count; i++)
    {
        var frame = ((___r1 = ((___r2 = self._tableViews[i]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "enclosingScrollView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
        if (CGRectContainsPoint(frame, adjustedPoint))
            return i;
    }
    return -1;
    var ___r1, ___r2;
}
,["unsigned","CGPoint"]), new objj_method(sel_getUid("rectOfRow:inColumn:"), function $CPBrowser__rectOfRow_inColumn_(self, _cmd, aRow, aColumn)
{
    var tableView = self._tableViews[aColumn],
        rect = (tableView == null ? null : tableView.isa.objj_msgSend1(tableView, "rectOfRow:", aRow));
    rect.origin = self.isa.objj_msgSend2(self, "convertPoint:fromView:", rect.origin, tableView);
    return rect;
}
,["CGRect","unsigned","unsigned"]), new objj_method(sel_getUid("itemAtRow:inColumn:"), function $CPBrowser__itemAtRow_inColumn_(self, _cmd, row, column)
{
    return ((___r1 = self._tableDelegates[column]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "childAtIndex:", row));
    var ___r1;
}
,["id","CPInteger","CPInteger"]), new objj_method(sel_getUid("isLeafItem:"), function $CPBrowser__isLeafItem_(self, _cmd, item)
{
    return self._implementedDelegateMethods & CPBrowserDelegate_browser_isLeafItem_ && ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "browser:isLeafItem:", self, item));
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("parentForItemsInColumn:"), function $CPBrowser__parentForItemsInColumn_(self, _cmd, column)
{
    return ((___r1 = self._tableDelegates[column]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_item"));
    var ___r1;
}
,["id","CPInteger"]), new objj_method(sel_getUid("selectedItems"), function $CPBrowser__selectedItems(self, _cmd)
{
    var selectedColumn = self.isa.objj_msgSend0(self, "selectedColumn"),
        selectedIndexes = self.isa.objj_msgSend1(self, "selectedRowIndexesInColumn:", selectedColumn),
        set = CPSet.isa.objj_msgSend0(CPSet, "set"),
        index = (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend0(selectedIndexes, "firstIndex"));
    while (index !== CPNotFound)
    {
        (set == null ? null : set.isa.objj_msgSend1(set, "addObject:", self.isa.objj_msgSend2(self, "itemAtRow:inColumn:", index, selectedColumn)));
        index = (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend1(selectedIndexes, "indexGreaterThanIndex:", index));
    }
    return set;
}
,["CPSet"]), new objj_method(sel_getUid("selectedItem"), function $CPBrowser__selectedItem(self, _cmd)
{
    var selectedColumn = self.isa.objj_msgSend0(self, "selectedColumn"),
        selectedRow = self.isa.objj_msgSend1(self, "selectedRowInColumn:", selectedColumn);
    return self.isa.objj_msgSend2(self, "itemAtRow:inColumn:", selectedRow, selectedColumn);
}
,["id"]), new objj_method(sel_getUid("trackMouse:"), function $CPBrowser__trackMouse_(self, _cmd, anEvent)
{
}
,["void","CPEvent"]), new objj_method(sel_getUid("_column:clickedRow:"), function $CPBrowser___column_clickedRow_(self, _cmd, columnIndex, rowIndex)
{
    self.isa.objj_msgSend1(self, "setLastColumn:", columnIndex);
    if (rowIndex >= 0)
        self.isa.objj_msgSend0(self, "addColumn");
    self.isa.objj_msgSend1(self, "doClick:", self);
}
,["void","unsigned","unsigned"]), new objj_method(sel_getUid("sendAction"), function $CPBrowser__sendAction(self, _cmd)
{
    self.isa.objj_msgSend2(self, "sendAction:to:", self._action, self._target);
}
,["void"]), new objj_method(sel_getUid("doClick:"), function $CPBrowser__doClick_(self, _cmd, sender)
{
    self.isa.objj_msgSend2(self, "sendAction:to:", self._action, self._target);
}
,["void","id"]), new objj_method(sel_getUid("doDoubleClick:"), function $CPBrowser__doDoubleClick_(self, _cmd, sender)
{
    self.isa.objj_msgSend2(self, "sendAction:to:", self._doubleAction, self._target);
}
,["void","id"]), new objj_method(sel_getUid("keyDown:"), function $CPBrowser__keyDown_(self, _cmd, anEvent)
{
    var key = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers")),
        column = self.isa.objj_msgSend0(self, "selectedColumn");
    if (column === CPNotFound)
        return;
    if (key === CPLeftArrowFunctionKey || key === CPRightArrowFunctionKey)
    {
        if (key === CPLeftArrowFunctionKey)
        {
            var previousColumn = column - 1,
                selectedRow = self.isa.objj_msgSend1(self, "selectedRowInColumn:", previousColumn);
            self.isa.objj_msgSend2(self, "selectRow:inColumn:", selectedRow, previousColumn);
        }
        else
            self.isa.objj_msgSend2(self, "selectRow:inColumn:", 0, column + 1);
    }
    else
        ((___r1 = self._tableViews[column]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "keyDown:", anEvent));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("columnContentWidthForColumnWidth:"), function $CPBrowser__columnContentWidthForColumnWidth_(self, _cmd, aWidth)
{
    var columnSpacing = ((___r1 = self._tableViews[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "intercellSpacing")).width;
    return aWidth - (self._leafWidth + columnSpacing + (self._delegateSupportsImages ? self._imageWidth + columnSpacing : 0)) - columnSpacing - CPScroller.isa.objj_msgSend0(CPScroller, "scrollerWidth");
    var ___r1;
}
,["float","float"]), new objj_method(sel_getUid("columnWidthForColumnContentWidth:"), function $CPBrowser__columnWidthForColumnContentWidth_(self, _cmd, aWidth)
{
    var columnSpacing = ((___r1 = self._tableViews[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "intercellSpacing")).width;
    return aWidth + (self._leafWidth + columnSpacing + (self._delegateSupportsImages ? self._imageWidth + columnSpacing : 0)) + columnSpacing + CPScroller.isa.objj_msgSend0(CPScroller, "scrollerWidth");
    var ___r1;
}
,["float","float"]), new objj_method(sel_getUid("setImageWidth:"), function $CPBrowser__setImageWidth_(self, _cmd, aWidth)
{
    self._imageWidth = aWidth;
    self.isa.objj_msgSend0(self, "tile");
}
,["void","float"]), new objj_method(sel_getUid("imageWidth"), function $CPBrowser__imageWidth(self, _cmd)
{
    return self._imageWidth;
}
,["float"]), new objj_method(sel_getUid("setMinColumnWidth:"), function $CPBrowser__setMinColumnWidth_(self, _cmd, minWidth)
{
    self._minColumnWidth = minWidth;
    self.isa.objj_msgSend0(self, "tile");
}
,["void","float"]), new objj_method(sel_getUid("minColumnWidth"), function $CPBrowser__minColumnWidth(self, _cmd)
{
    return self._minColumnWidth;
}
,["float"]), new objj_method(sel_getUid("setWidth:ofColumn:"), function $CPBrowser__setWidth_ofColumn_(self, _cmd, aWidth, column)
{
    self._columnWidths[column] = aWidth;
    self.isa.objj_msgSend1(self, "_sendDelegateBrowserDidResizeColumn:", column);
    self.isa.objj_msgSend0(self, "tile");
}
,["void","float","unsigned"]), new objj_method(sel_getUid("widthOfColumn:"), function $CPBrowser__widthOfColumn_(self, _cmd, column)
{
    var width = self._columnWidths[column];
    if (width == null)
        width = self._defaultColumnWidth;
    return MAX(CPScroller.isa.objj_msgSend0(CPScroller, "scrollerWidth"), MAX(self._minColumnWidth, width));
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
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollRectToVisible:", ((___r2 = ((___r3 = self.isa.objj_msgSend1(self, "tableViewInColumn:", columnIndex)), ___r3 == null ? null : ___r3.isa.objj_msgSend0(___r3, "enclosingScrollView"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))));
    var ___r1, ___r2, ___r3;
}
,["void","unsigned"]), new objj_method(sel_getUid("scrollRowToVisible:inColumn:"), function $CPBrowser__scrollRowToVisible_inColumn_(self, _cmd, rowIndex, columnIndex)
{
    self.isa.objj_msgSend1(self, "scrollColumnToVisible:", columnIndex);
    ((___r1 = self.isa.objj_msgSend1(self, "tableViewInColumn:", columnIndex)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollRowToVisible:", rowIndex));
    var ___r1;
}
,["void","unsigned","unsigned"]), new objj_method(sel_getUid("autohidesScroller"), function $CPBrowser__autohidesScroller(self, _cmd)
{
    return ((___r1 = self._horizontalScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "autohidesScrollers"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("setAutohidesScroller:"), function $CPBrowser__setAutohidesScroller_(self, _cmd, shouldHide)
{
    ((___r1 = self._horizontalScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutohidesScrollers:", shouldHide));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("selectedRowInColumn:"), function $CPBrowser__selectedRowInColumn_(self, _cmd, columnIndex)
{
    if (columnIndex > self.isa.objj_msgSend0(self, "lastColumn") || columnIndex < 0)
        return -1;
    return ((___r1 = self._tableViews[columnIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow"));
    var ___r1;
}
,["unsigned","unsigned"]), new objj_method(sel_getUid("selectedColumn"), function $CPBrowser__selectedColumn(self, _cmd)
{
    var column = self.isa.objj_msgSend0(self, "lastColumn"),
        row = self.isa.objj_msgSend1(self, "selectedRowInColumn:", column);
    if (row >= 0)
        return column;
    else
        return column - 1;
}
,["unsigned"]), new objj_method(sel_getUid("selectRow:inColumn:"), function $CPBrowser__selectRow_inColumn_(self, _cmd, row, column)
{
    var selectedIndexes = row === -1 ? CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet") : CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", row);
    self.isa.objj_msgSend2(self, "selectRowIndexes:inColumn:", selectedIndexes, column);
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
    ((___r1 = self._tableViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setAllowsMultipleSelection:"), shouldAllow));
    var ___r1;
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
    ((___r1 = self._tableViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setAllowsEmptySelection:"), shouldAllow));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("selectedRowIndexesInColumn:"), function $CPBrowser__selectedRowIndexesInColumn_(self, _cmd, column)
{
    if (column < 0 || column > self.isa.objj_msgSend0(self, "lastColumn") + 1)
        return CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    return ((___r1 = self.isa.objj_msgSend1(self, "tableViewInColumn:", column)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRowIndexes"));
    var ___r1;
}
,["CPIndexSet","unsigned"]), new objj_method(sel_getUid("selectRowIndexes:inColumn:"), function $CPBrowser__selectRowIndexes_inColumn_(self, _cmd, indexSet, column)
{
    if (column < 0 || column > self.isa.objj_msgSend0(self, "lastColumn") + 1)
        return;
    indexSet = self.isa.objj_msgSend2(self, "_sendDelegateBrowserSelectionIndexesForProposedSelection:inColumn:", indexSet, column);
    if (!self.isa.objj_msgSend2(self, "_sendDelegateBrowserShouldSelectRowIndexes:inColumn:", indexSet, column))
        return;
    self.isa.objj_msgSend0(self, "_sendDelegateBrowserSelectionIsChanging");
    if (column > self.isa.objj_msgSend0(self, "lastColumn"))
        self.isa.objj_msgSend0(self, "addColumn");
    self.isa.objj_msgSend1(self, "setLastColumn:", column);
    ((___r1 = self.isa.objj_msgSend1(self, "tableViewInColumn:", column)), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "selectRowIndexes:byExtendingSelection:", indexSet, NO));
    self.isa.objj_msgSend1(self, "scrollColumnToVisible:", column);
    self.isa.objj_msgSend0(self, "_sendDelegateBrowserSelectionDidChange");
    var ___r1;
}
,["void","CPIndexSet","unsigned"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPBrowser__setBackgroundColor_(self, _cmd, aColor)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBrowser").super_class }, "setBackgroundColor:", aColor);
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", aColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPBrowser__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("registerForDraggedTypes:"), function $CPBrowser__registerForDraggedTypes_(self, _cmd, types)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBrowser").super_class }, "registerForDraggedTypes:", types);
    ((___r1 = self._tableViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("registerForDraggedTypes:"), types));
    var ___r1;
}
,["void","CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPBrowser__defaultThemeClass(self, _cmd)
{
    return "browser";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPBrowser__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "image-control-resize", CPNull.isa.objj_msgSend0(CPNull, "null"), "image-control-leaf", CPNull.isa.objj_msgSend0(CPNull, "null"), "image-control-leaf-pressed");
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
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
        self._allowsEmptySelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "CPBrowserAllowsEmptySelectionKey"));
        self._allowsMultipleSelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "CPBrowserAllowsMultipleSelectionKey"));
        self._prototypeView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "CPBrowserPrototypeViewKey"));
        self._rowHeight = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "CPBrowserRowHeightKey"));
        self._imageWidth = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "CPBrowserImageWidthKey"));
        self._minColumnWidth = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "CPBrowserMinColumnWidthKey"));
        self._columnWidths = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "CPBrowserColumnWidthsKey"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDelegate:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "CPBrowserDelegateKey"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutohidesScroller:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "CPBrowserAutohidesScrollerKey"))));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPBrowser__encodeWithCoder_(self, _cmd, aCoder)
{
    var actualSubviews = self._subviews;
    self._subviews = [];
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBrowser").super_class }, "encodeWithCoder:", aCoder);
    self._subviews = actualSubviews;
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self.isa.objj_msgSend0(self, "autohidesScroller"), "CPBrowserAutohidesScrollerKey"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowsEmptySelection, "CPBrowserAllowsEmptySelectionKey"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowsMultipleSelection, "CPBrowserAllowsMultipleSelectionKey"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._delegate, "CPBrowserDelegateKey"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._prototypeView, "CPBrowserPrototypeViewKey"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._rowHeight, "CPBrowserRowHeightKey"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._imageWidth, "CPBrowserImageWidthKey"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._minColumnWidth, "CPBrowserMinColumnWidthKey"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._columnWidths, "CPBrowserColumnWidthsKey"));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPBrowserResizeControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_mouseDownX"), new objj_ivar("_browser"), new objj_ivar("_index"), new objj_ivar("_width")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPBrowserResizeControl__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserResizeControl").super_class }, "initWithFrame:", aFrame))
    {
        var browser = ((___r1 = CPBrowser.isa.objj_msgSend0(CPBrowser, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithPatternImage:", (browser == null ? null : browser.isa.objj_msgSend1(browser, "valueForThemeAttribute:", "image-control-resize")))));
    }
    return self;
    var ___r1;
}
,["id","CGRect"]), new objj_method(sel_getUid("mouseDown:"), function $_CPBrowserResizeControl__mouseDown_(self, _cmd, anEvent)
{
    self._mouseDownX = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")).x;
    self._browser = ((___r1 = self.isa.objj_msgSend0(self, "superview")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_browser"));
    self._index = ((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "columnOfTableView:", ((___r2 = self.isa.objj_msgSend0(self, "superview")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "documentView"))));
    self._width = ((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "widthOfColumn:", self._index));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $_CPBrowserResizeControl__mouseDragged_(self, _cmd, anEvent)
{
    var deltaX = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")).x - self._mouseDownX;
    ((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setWidth:ofColumn:", self._width + deltaX, self._index));
    var ___r1;
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
        self._resizeControl = ((___r1 = _CPBrowserResizeControl.isa.objj_msgSend0(_CPBrowserResizeControl, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._resizeControl));
    }
    return self;
    var ___r1;
}
,["id","CGRect"]), new objj_method(sel_getUid("reflectScrolledClipView:"), function $_CPBrowserScrollView__reflectScrolledClipView_(self, _cmd, aClipView)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserScrollView").super_class }, "reflectScrolledClipView:", aClipView);
    var frame = ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    frame.size.height = CGRectGetHeight(self.isa.objj_msgSend0(self, "bounds")) - 14.0 - frame.origin.y;
    ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", frame.size));
    var resizeFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMaxY(frame), CPScroller.isa.objj_msgSend0(CPScroller, "scrollerWidth"), 14.0);
    ((___r1 = self._resizeControl), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", resizeFrame));
    var ___r1;
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
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self._browser));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("browserView"), function $_CPBrowserTableView__browserView(self, _cmd)
{
    return self._browser;
}
,["CPView"]), new objj_method(sel_getUid("_isFocused"), function $_CPBrowserTableView___isFocused(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserTableView").super_class }, "_isFocused") || ((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "tableViewInColumn:", ((___r2 = self._browser), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedColumn")))) === self;
    var ___r1, ___r2;
}
,["BOOL"]), new objj_method(sel_getUid("canDragRowsWithIndexes:atPoint:"), function $_CPBrowserTableView__canDragRowsWithIndexes_atPoint_(self, _cmd, rowIndexes, mouseDownPoint)
{
    return ((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "canDragRowsWithIndexes:inColumn:withEvent:", rowIndexes, ((___r2 = self._browser), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "columnOfTableView:", self)), (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))));
    var ___r1, ___r2;
}
,["BOOL","CPIndexSet","CGPoint"]), new objj_method(sel_getUid("dragImageForRowsWithIndexes:tableColumns:event:offset:"), function $_CPBrowserTableView__dragImageForRowsWithIndexes_tableColumns_event_offset_(self, _cmd, dragRows, theTableColumns, dragEvent, dragImageOffset)
{
    return ((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "draggingImageForRowsWithIndexes:inColumn:withEvent:offset:", dragRows, ((___r2 = self._browser), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "columnOfTableView:", self)), dragEvent, dragImageOffset)) || objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserTableView").super_class }, "dragImageForRowsWithIndexes:tableColumns:event:offset:", dragRows, theTableColumns, dragEvent, dragImageOffset);
    var ___r1, ___r2;
}
,["CPImage","CPIndexSet","CPArray","CPEvent","CGPoint"]), new objj_method(sel_getUid("dragViewForRowsWithIndexes:tableColumns:event:offset:"), function $_CPBrowserTableView__dragViewForRowsWithIndexes_tableColumns_event_offset_(self, _cmd, dragRows, theTableColumns, dragEvent, dragViewOffset)
{
    var count = theTableColumns.length;
    while (count--)
    {
        if (((___r1 = theTableColumns[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "identifier")) === "Leaf")
            (theTableColumns == null ? null : theTableColumns.isa.objj_msgSend1(theTableColumns, "removeObject:", theTableColumns[count]));
    }
    return ((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "draggingViewForRowsWithIndexes:inColumn:withEvent:offset:", dragRows, ((___r2 = self._browser), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "columnOfTableView:", self)), dragEvent, dragViewOffset)) || objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserTableView").super_class }, "dragViewForRowsWithIndexes:tableColumns:event:offset:", dragRows, theTableColumns, dragEvent, dragViewOffset);
    var ___r1, ___r2;
}
,["CPView","CPIndexSet","CPArray","CPEvent","CGPoint"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPBrowserTableDelegate"),
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
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "browser:numberOfChildrenOfItem:", self._browser, self._item));
    var ___r1;
}
,["unsigned","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $_CPBrowserTableDelegate__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, column, row)
{
    if ((column == null ? null : column.isa.objj_msgSend0(column, "identifier")) === "Image")
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "browser:imageValueForItem:", self._browser, self.isa.objj_msgSend1(self, "childAtIndex:", row)));
    else if ((column == null ? null : column.isa.objj_msgSend0(column, "identifier")) === "Leaf")
        return !((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isLeafItem:", self.isa.objj_msgSend1(self, "childAtIndex:", row)));
    else
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "browser:objectValueForItem:", self._browser, self.isa.objj_msgSend1(self, "childAtIndex:", row)));
    var ___r1;
}
,["void","CPTableView","CPTableColumn","unsigned"]), new objj_method(sel_getUid("_tableViewDoubleClicked:"), function $_CPBrowserTableDelegate___tableViewDoubleClicked_(self, _cmd, aTableView)
{
    ((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "doDoubleClick:", self));
    var ___r1;
}
,["void","CPTableView"]), new objj_method(sel_getUid("_tableViewClicked:"), function $_CPBrowserTableDelegate___tableViewClicked_(self, _cmd, aTableView)
{
    var selectedIndexes = (aTableView == null ? null : aTableView.isa.objj_msgSend0(aTableView, "selectedRowIndexes"));
    ((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_column:clickedRow:", self._index, (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend0(selectedIndexes, "count")) === 1 ? (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend0(selectedIndexes, "firstIndex")) : -1));
    var ___r1;
}
,["void","CPTableView"]), new objj_method(sel_getUid("tableViewSelectionDidChange:"), function $_CPBrowserTableDelegate__tableViewSelectionDidChange_(self, _cmd, aNotification)
{
    var selectedIndexes = ((___r1 = (aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "object"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRowIndexes"));
    ((___r1 = self._browser), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "selectRowIndexes:inColumn:", selectedIndexes, self._index));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("childAtIndex:"), function $_CPBrowserTableDelegate__childAtIndex_(self, _cmd, index)
{
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "browser:child:ofItem:", self._browser, index, self._item));
    var ___r1;
}
,["id","CPUInteger"]), new objj_method(sel_getUid("tableView:acceptDrop:row:dropOperation:"), function $_CPBrowserTableDelegate__tableView_acceptDrop_row_dropOperation_(self, _cmd, aTableView, info, row, operation)
{
    if (self._browser._implementedDelegateMethods & CPBrowserDelegate_browser_acceptDrop_atRow_column_dropOperation_)
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "browser:acceptDrop:atRow:column:dropOperation:", self._browser, info, row, self._index, operation));
    else
        return NO;
    var ___r1;
}
,["BOOL","CPTableView","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"), function $_CPBrowserTableDelegate__tableView_validateDrop_proposedRow_proposedDropOperation_(self, _cmd, aTableView, info, row, operation)
{
    if (self._browser._implementedDelegateMethods & CPBrowserDelegate_browser_validateDrop_proposedRow_column_dropOperation_)
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "browser:validateDrop:proposedRow:column:dropOperation:", self._browser, info, row, self._index, operation));
    else
        return CPDragOperationNone;
    var ___r1;
}
,["CPDragOperation","CPTableView","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"), function $_CPBrowserTableDelegate__tableView_writeRowsWithIndexes_toPasteboard_(self, _cmd, aTableView, rowIndexes, pboard)
{
    if (self._browser._implementedDelegateMethods & CPBrowserDelegate_browser_writeRowsWithIndexes_inColumn_toPasteboard_)
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "browser:writeRowsWithIndexes:inColumn:toPasteboard:", self._browser, rowIndexes, self._index, pboard));
    else
        return NO;
    var ___r1;
}
,["BOOL","CPTableView","CPIndexSet","CPPasteboard"]), new objj_method(sel_getUid("respondsToSelector:"), function $_CPBrowserTableDelegate__respondsToSelector_(self, _cmd, aSelector)
{
    if (aSelector === sel_getUid("browser:writeRowsWithIndexes:inColumn:toPasteboard:"))
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("browser:writeRowsWithIndexes:inColumn:toPasteboard:")));
    else
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserTableDelegate").super_class }, "respondsToSelector:", aSelector);
    var ___r1;
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
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","id"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $_CPBrowserLeafView__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "image-view")
        return CGRectInset(self.isa.objj_msgSend0(self, "bounds"), 1, 1);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserLeafView").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $_CPBrowserLeafView__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "image-view")
        return ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserLeafView").super_class }, "createEphemeralSubviewNamed:", aName);
    var ___r1;
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPBrowserLeafView__layoutSubviews(self, _cmd)
{
    var imageView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "image-view", CPWindowAbove, nil),
        isHighlighted = self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateSelectedDataView);
    (imageView == null ? null : imageView.isa.objj_msgSend1(imageView, "setImage:", self._isLeaf ? isHighlighted ? self._highlightedBranchImage : self._branchImage : nil));
    (imageView == null ? null : imageView.isa.objj_msgSend1(imageView, "setImageScaling:", CPImageScaleNone));
}
,["void"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPBrowserLeafView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserLeafView").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isLeaf, "_CPBrowserLeafViewIsLeafKey"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._branchImage, "_CPBrowserLeafViewBranchImageKey"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._highlightedBranchImage, "_CPBrowserLeafViewHighlightedBranchImageKey"));
}
,["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPBrowserLeafView__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBrowserLeafView").super_class }, "initWithCoder:", aCoder))
    {
        self._isLeaf = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "_CPBrowserLeafViewIsLeafKey"));
        self._branchImage = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "_CPBrowserLeafViewBranchImageKey"));
        self._highlightedBranchImage = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "_CPBrowserLeafViewHighlightedBranchImageKey"));
    }
    return self;
}
,["id","CPCoder"])]);
}{
var the_class = objj_getClass("CPBrowser")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPBrowser\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_sendDelegateRootItemForBrowser"), function $CPBrowser___sendDelegateRootItemForBrowser(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPBrowserDelegate_rootItemForBrowser_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "rootItemForBrowser:", self));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("_sendDelegateBrowserDidChangeLastColumn:toColumn:"), function $CPBrowser___sendDelegateBrowserDidChangeLastColumn_toColumn_(self, _cmd, lastColumn, newColumn)
{
    if (!(self._implementedDelegateMethods & CPBrowserDelegate_browser_didChangeLastColumn_toColumn_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "browser:didChangeLastColumn:toColumn:", self, lastColumn, newColumn));
    var ___r1;
}
,["void","CPInteger","CPInteger"]), new objj_method(sel_getUid("_sendDelegateBrowserDidResizeColumn:"), function $CPBrowser___sendDelegateBrowserDidResizeColumn_(self, _cmd, column)
{
    if (!(self._implementedDelegateMethods & CPBrowserDelegate_browser_didResizeColumn_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "browser:didResizeColumn:", self, column));
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("_sendDelegateBrowserSelectionIsChanging"), function $CPBrowser___sendDelegateBrowserSelectionIsChanging(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPBrowserDelegate_browserSelectionIsChanging_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "browserSelectionIsChanging:", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_sendDelegateBrowserShouldSelectRowIndexes:inColumn:"), function $CPBrowser___sendDelegateBrowserShouldSelectRowIndexes_inColumn_(self, _cmd, anIndexSet, aColumn)
{
    if (!(self._implementedDelegateMethods & CPBrowserDelegate_browser_shouldSelectRowIndexes_inColumn_))
        return YES;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "browser:shouldSelectRowIndexes:inColumn:", self, anIndexSet, aColumn));
    var ___r1;
}
,["BOOL","CPIndexSet","CPInteger"]), new objj_method(sel_getUid("_sendDelegateBrowserSelectionIndexesForProposedSelection:inColumn:"), function $CPBrowser___sendDelegateBrowserSelectionIndexesForProposedSelection_inColumn_(self, _cmd, anIndexSet, aColumn)
{
    if (!(self._implementedDelegateMethods & CPBrowserDelegate_browser_selectionIndexesForProposedSelection_inColumn_))
        return anIndexSet;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "browser:selectionIndexesForProposedSelection:inColumn:", self, anIndexSet, aColumn));
    var ___r1;
}
,["CPIndexSet","CPIndexSet","CPInteger"]), new objj_method(sel_getUid("_sendDelegateBrowserSelectionDidChange"), function $CPBrowser___sendDelegateBrowserSelectionDidChange(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPBrowserDelegate_browserSelectionDidChange_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "browserSelectionDidChange:", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("canDragRowsWithIndexes:inColumn:withEvent:"), function $CPBrowser__canDragRowsWithIndexes_inColumn_withEvent_(self, _cmd, rowIndexes, columnIndex, dragEvent)
{
    if (self._implementedDelegateMethods & CPBrowserDelegate_browser_canDragRowsWithIndexes_inColumn_withEvent_)
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "browser:canDragRowsWithIndexes:inColumn:withEvent:", self, rowIndexes, columnIndex, dragEvent));
    return YES;
    var ___r1;
}
,["BOOL","CPIndexSet","CPInteger","CPEvent"]), new objj_method(sel_getUid("draggingImageForRowsWithIndexes:inColumn:withEvent:offset:"), function $CPBrowser__draggingImageForRowsWithIndexes_inColumn_withEvent_offset_(self, _cmd, rowIndexes, columnIndex, dragEvent, dragImageOffset)
{
    if (self._implementedDelegateMethods & CPBrowserDelegate_browser_draggingImageForRowsWithIndexes_inColumn_withEvent_offset_)
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "browser:draggingImageForRowsWithIndexes:inColumn:withEvent:offset:", self, rowIndexes, columnIndex, dragEvent, dragImageOffset));
    return nil;
    var ___r1;
}
,["CPImage","CPIndexSet","CPInteger","CPEvent","CGPoint"]), new objj_method(sel_getUid("draggingViewForRowsWithIndexes:inColumn:withEvent:offset:"), function $CPBrowser__draggingViewForRowsWithIndexes_inColumn_withEvent_offset_(self, _cmd, rowIndexes, columnIndex, dragEvent, dragImageOffset)
{
    if (self._implementedDelegateMethods & CPBrowserDelegate_browser_draggingViewForRowsWithIndexes_inColumn_withEvent_offset_)
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "browser:draggingViewForRowsWithIndexes:inColumn:withEvent:offset:", self, rowIndexes, columnIndex, dragEvent, dragImageOffset));
    return nil;
    var ___r1;
}
,["CPView","CPIndexSet","CPInteger","CPEvent","CGPoint"])]);
}