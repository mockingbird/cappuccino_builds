@STATIC;1.0;I;20;Foundation/CPArray.jI;23;Foundation/CPIndexSet.ji;24;CPDragServer_Constants.ji;12;CGGradient.ji;7;CPCib.ji;17;CPCompatibility.ji;11;CPControl.ji;13;CPImageView.ji;12;CPScroller.ji;14;CPScrollView.ji;15;CPTableColumn.ji;19;CPTableHeaderView.ji;8;CPText.ji;15;_CPCornerView.jt;207701;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("CPDragServer_Constants.j", YES);objj_executeFile("CGGradient.j", YES);objj_executeFile("CPCib.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPControl.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPScroller.j", YES);objj_executeFile("CPScrollView.j", YES);objj_executeFile("CPTableColumn.j", YES);objj_executeFile("CPTableHeaderView.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("_CPCornerView.j", YES);CPTableViewColumnDidMoveNotification = "CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification = "CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification = "CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification = "CPTableViewSelectionIsChangingNotification";
var CPTableViewDataSource_numberOfRowsInTableView_ = 1 << 0,
    CPTableViewDataSource_tableView_objectValueForTableColumn_row_ = 1 << 1,
    CPTableViewDataSource_tableView_setObjectValue_forTableColumn_row_ = 1 << 2,
    CPTableViewDataSource_tableView_acceptDrop_row_dropOperation_ = 1 << 3,
    CPTableViewDataSource_tableView_namesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_ = 1 << 4,
    CPTableViewDataSource_tableView_validateDrop_proposedRow_proposedDropOperation_ = 1 << 5,
    CPTableViewDataSource_tableView_writeRowsWithIndexes_toPasteboard_ = 1 << 6,
    CPTableViewDataSource_tableView_sortDescriptorsDidChange_ = 1 << 7;
var CPTableViewDelegate_selectionShouldChangeInTableView_ = 1 << 0,
    CPTableViewDelegate_tableView_viewForTableColumn_row_ = 1 << 1,
    CPTableViewDelegate_tableView_dataViewForTableColumn_row_ = 1 << 2,
    CPTableViewDelegate_tableView_didClickTableColumn_ = 1 << 3,
    CPTableViewDelegate_tableView_didDragTableColumn_ = 1 << 4,
    CPTableViewDelegate_tableView_heightOfRow_ = 1 << 5,
    CPTableViewDelegate_tableView_isGroupRow_ = 1 << 6,
    CPTableViewDelegate_tableView_mouseDownInHeaderOfTableColumn_ = 1 << 7,
    CPTableViewDelegate_tableView_nextTypeSelectMatchFromRow_toRow_forString_ = 1 << 8,
    CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_ = 1 << 9,
    CPTableViewDelegate_tableView_shouldEditTableColumn_row_ = 1 << 10,
    CPTableViewDelegate_tableView_shouldSelectRow_ = 1 << 11,
    CPTableViewDelegate_tableView_shouldSelectTableColumn_ = 1 << 12,
    CPTableViewDelegate_tableView_shouldShowViewExpansionForTableColumn_row_ = 1 << 13,
    CPTableViewDelegate_tableView_shouldTrackView_forTableColumn_row_ = 1 << 14,
    CPTableViewDelegate_tableView_shouldTypeSelectForEvent_withCurrentSearchString_ = 1 << 15,
    CPTableViewDelegate_tableView_toolTipForView_rect_tableColumn_row_mouseLocation_ = 1 << 16,
    CPTableViewDelegate_tableView_typeSelectStringForTableColumn_row_ = 1 << 17,
    CPTableViewDelegate_tableView_willDisplayView_forTableColumn_row_ = 1 << 18,
    CPTableViewDelegate_tableView_willRemoveView_forTableColumn_row_ = 1 << 19,
    CPTableViewDelegate_tableViewSelectionDidChange_ = 1 << 20,
    CPTableViewDelegate_tableViewSelectionIsChanging_ = 1 << 21,
    CPTableViewDelegate_tableViewMenuForTableColumn_row_ = 1 << 22,
    CPTableViewDelegate_tableView_shouldReorderColumn_toColumn_ = 1 << 23;
CPTableViewDraggingDestinationFeedbackStyleNone = -1;
CPTableViewDraggingDestinationFeedbackStyleRegular = 0;
CPTableViewDraggingDestinationFeedbackStyleSourceList = 1;
CPTableViewDropOn = 0;
CPTableViewDropAbove = 1;
CPSourceListGradient = "CPSourceListGradient";
CPSourceListTopLineColor = "CPSourceListTopLineColor";
CPSourceListBottomLineColor = "CPSourceListBottomLineColor";
CPTableViewSelectionHighlightStyleNone = -1;
CPTableViewSelectionHighlightStyleRegular = 0;
CPTableViewSelectionHighlightStyleSourceList = 1;
CPTableViewGridNone = 0;
CPTableViewSolidVerticalGridLineMask = 1 << 0;
CPTableViewSolidHorizontalGridLineMask = 1 << 1;
CPTableViewNoColumnAutoresizing = 0;
CPTableViewUniformColumnAutoresizingStyle = 1;
CPTableViewSequentialColumnAutoresizingStyle = 2;
CPTableViewReverseSequentialColumnAutoresizingStyle = 3;
CPTableViewLastColumnOnlyAutoresizingStyle = 4;
CPTableViewFirstColumnOnlyAutoresizingStyle = 5;
{var the_protocol = objj_allocateProtocol("CPTableViewDataSource");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPTableViewDataSource\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}{var the_protocol = objj_allocateProtocol("CPTableViewDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPTableViewDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}{var the_class = objj_allocateClassPair(CPView, "_CPTableDrawView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tableView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTableView:"), function $_CPTableDrawView__initWithTableView_(self, _cmd, aTableView)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTableDrawView").super_class }, "init");
    if (self)
        self._tableView = aTableView;
    return self;
}
,["id","CPTableView"]), new objj_method(sel_getUid("drawRect:"), function $_CPTableDrawView__drawRect_(self, _cmd, aRect)
{
    var frame = objj_msgSend(self, "frame"),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextTranslateCTM(context, -CGRectGetMinX(frame), -CGRectGetMinY(frame));
    objj_msgSend(self._tableView, "_drawRect:", aRect);
}
,["void","CGRect"])]);
}{var the_class = objj_allocateClassPair(CPControl, "CPTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dataSource"), new objj_ivar("_implementedDataSourceMethods"), new objj_ivar("_delegate"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_tableColumns"), new objj_ivar("_tableColumnRanges"), new objj_ivar("_dirtyTableColumnRangeIndex"), new objj_ivar("_numberOfHiddenColumns"), new objj_ivar("_reloadAllRows"), new objj_ivar("_objectValues"), new objj_ivar("_exposedRect"), new objj_ivar("_exposedRows"), new objj_ivar("_exposedColumns"), new objj_ivar("_dataViewsForTableColumns"), new objj_ivar("_cachedDataViews"), new objj_ivar("_archivedDataViews"), new objj_ivar("_unavailable_custom_cibs"), new objj_ivar("_allowsColumnReordering"), new objj_ivar("_allowsColumnResizing"), new objj_ivar("_allowsColumnSelection"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_allowsEmptySelection"), new objj_ivar("_sortDescriptors"), new objj_ivar("_intercellSpacing"), new objj_ivar("_rowHeight"), new objj_ivar("_usesAlternatingRowBackgroundColors"), new objj_ivar("_alternatingRowBackgroundColors"), new objj_ivar("_selectionHighlightStyle"), new objj_ivar("_unfocusedSelectionHighlightColor"), new objj_ivar("_unfocusedSourceListSelectionColor"), new objj_ivar("_currentHighlightedTableColumn"), new objj_ivar("_gridStyleMask"), new objj_ivar("_numberOfRows"), new objj_ivar("_groupRows"), new objj_ivar("_cachedRowHeights"), new objj_ivar("_autosaveName"), new objj_ivar("_autosaveTableColumns"), new objj_ivar("_headerView"), new objj_ivar("_cornerView"), new objj_ivar("_selectedColumnIndexes"), new objj_ivar("_selectedRowIndexes"), new objj_ivar("_selectionAnchorRow"), new objj_ivar("_lastSelectedRow"), new objj_ivar("_previouslySelectedRowIndexes"), new objj_ivar("_startTrackingPoint"), new objj_ivar("_startTrackingTimestamp"), new objj_ivar("_trackingPointMovedOutOfClickSlop"), new objj_ivar("_editingCellIndex"), new objj_ivar("_editingRow"), new objj_ivar("_editingColumn"), new objj_ivar("_tableDrawView"), new objj_ivar("_doubleAction"), new objj_ivar("_clickedRow"), new objj_ivar("_clickedColumn"), new objj_ivar("_columnAutoResizingStyle"), new objj_ivar("_lastTrackedRowIndex"), new objj_ivar("_originalMouseDownPoint"), new objj_ivar("_verticalMotionCanDrag"), new objj_ivar("_destinationDragStyle"), new objj_ivar("_isSelectingSession"), new objj_ivar("_draggedRowIndexes"), new objj_ivar("_wasSelectionBroken"), new objj_ivar("_dropOperationFeedbackView"), new objj_ivar("_dragOperationDefaultMask"), new objj_ivar("_retargetedDropRow"), new objj_ivar("_retargetedDropOperation"), new objj_ivar("_draggingViews"), new objj_ivar("_disableAutomaticResizing"), new objj_ivar("_lastColumnShouldSnap"), new objj_ivar("_implementsCustomDrawRow"), new objj_ivar("_isViewBased"), new objj_ivar("_contentBindingExplicitlySet"), new objj_ivar("_viewForTableColumnRowSelector"), new objj_ivar("_draggedColumn"), new objj_ivar("_differedColumnDataToRemove")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("disableAutomaticResizing"), function $CPTableView__disableAutomaticResizing(self, _cmd)
{
    return self._disableAutomaticResizing;
}
,["BOOL"]), new objj_method(sel_getUid("setDisableAutomaticResizing:"), function $CPTableView__setDisableAutomaticResizing_(self, _cmd, newValue)
{
    self._disableAutomaticResizing = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("initWithFrame:"), function $CPTableView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._allowsColumnReordering = YES;
        self._allowsColumnResizing = YES;
        self._allowsMultipleSelection = NO;
        self._allowsEmptySelection = YES;
        self._allowsColumnSelection = NO;
        self._disableAutomaticResizing = NO;
        self._selectionHighlightStyle = CPTableViewSelectionHighlightStyleRegular;
        objj_msgSend(self, "setUsesAlternatingRowBackgroundColors:", NO);
        objj_msgSend(self, "setAlternatingRowBackgroundColors:", [objj_msgSend(CPColor, "whiteColor"), objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 245.0 / 255.0, 249.0 / 255.0, 252.0 / 255.0, 1.0)]);
        self._tableColumns = [];
        self._tableColumnRanges = [];
        self._dirtyTableColumnRangeIndex = CPNotFound;
        self._numberOfHiddenColumns = 0;
        self._intercellSpacing = CGSizeMake(3.0, 2.0);
        self._rowHeight = objj_msgSend(self, "valueForThemeAttribute:", "default-row-height");
        objj_msgSend(self, "setGridColor:", objj_msgSend(CPColor, "colorWithHexString:", "dce0e2"));
        objj_msgSend(self, "setGridStyleMask:", CPTableViewGridNone);
        objj_msgSend(self, "setHeaderView:", objj_msgSend(objj_msgSend(CPTableHeaderView, "alloc"), "initWithFrame:", CGRectMake(0, 0, objj_msgSend(self, "bounds").size.width, self._rowHeight)));
        objj_msgSend(self, "setCornerView:", objj_msgSend(objj_msgSend(_CPCornerView, "alloc"), "initWithFrame:", CGRectMake(0, 0, objj_msgSend(CPScroller, "scrollerWidth"), CGRectGetHeight(objj_msgSend(self._headerView, "frame")))));
        self._currentHighlightedTableColumn = nil;
        self._draggedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
        self._verticalMotionCanDrag = YES;
        self._isSelectingSession = NO;
        self._retargetedDropRow = nil;
        self._retargetedDropOperation = nil;
        self._dragOperationDefaultMask = nil;
        self._destinationDragStyle = CPTableViewDraggingDestinationFeedbackStyleRegular;
        self._contentBindingExplicitlySet = NO;
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPTableView___init(self, _cmd)
{
    self._lastSelectedRow = self._clickedColumn = self._clickedRow = -1;
    self._selectedColumnIndexes = objj_msgSend(CPIndexSet, "indexSet");
    self._selectedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
    self._dropOperationFeedbackView = objj_msgSend(objj_msgSend(_CPDropOperationDrawingView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(self._dropOperationFeedbackView, "setTableView:", self);
    self._lastColumnShouldSnap = NO;
    if (!self._alternatingRowBackgroundColors)
        self._alternatingRowBackgroundColors = [objj_msgSend(CPColor, "whiteColor"), objj_msgSend(CPColor, "colorWithHexString:", "e4e7ff")];
    self._tableColumnRanges = [];
    self._dirtyTableColumnRangeIndex = 0;
    self._numberOfHiddenColumns = 0;
    self._objectValues = {};
    self._dataViewsForTableColumns = {};
    self._numberOfRows = 0;
    self._exposedRows = objj_msgSend(CPIndexSet, "indexSet");
    self._exposedColumns = objj_msgSend(CPIndexSet, "indexSet");
    self._cachedDataViews = {};
    self._archivedDataViews = nil;
    self._viewForTableColumnRowSelector = nil;
    self._unavailable_custom_cibs = {};
    self._cachedRowHeights = [];
    self._groupRows = objj_msgSend(CPIndexSet, "indexSet");
    self._tableDrawView = objj_msgSend(objj_msgSend(_CPTableDrawView, "alloc"), "initWithTableView:", self);
    objj_msgSend(self._tableDrawView, "setBackgroundColor:", objj_msgSend(CPColor, "clearColor"));
    objj_msgSend(self, "addSubview:", self._tableDrawView);
    self._draggedColumn = nil;
    self._draggingViews = objj_msgSend(CPArray, "array");
    self._editingRow = CPNotFound;
    self._editingColumn = CPNotFound;
    self._differedColumnDataToRemove = [];
    self._implementsCustomDrawRow = objj_msgSend(self, "implementsSelector:", sel_getUid("drawRow:clipRect:"));
    if (!self._sortDescriptors)
        self._sortDescriptors = [];
    objj_msgSend(self, "_startObservingFirstResponder");
}
,["void"]), new objj_method(sel_getUid("setDataSource:"), function $CPTableView__setDataSource_(self, _cmd, aDataSource)
{
    if (self._dataSource === aDataSource)
        return;
    self._dataSource = aDataSource;
    self._implementedDataSourceMethods = 0;
    if (!self._dataSource)
        return;
    var hasContentBinding = !!objj_msgSend(self, "infoForBinding:", "content");
    if (objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("numberOfRowsInTableView:")))
        self._implementedDataSourceMethods |= CPTableViewDataSource_numberOfRowsInTableView_;
    if (objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("tableView:objectValueForTableColumn:row:")))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_objectValueForTableColumn_row_;
    if (objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("tableView:setObjectValue:forTableColumn:row:")))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_setObjectValue_forTableColumn_row_;
    if (objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("tableView:acceptDrop:row:dropOperation:")))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_acceptDrop_row_dropOperation_;
    if (objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:")))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_namesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_;
    if (objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:")))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_validateDrop_proposedRow_proposedDropOperation_;
    if (objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:")))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_writeRowsWithIndexes_toPasteboard_;
    if (objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("tableView:sortDescriptorsDidChange:")))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_sortDescriptorsDidChange_;
    objj_msgSend(self, "reloadData");
}
,["void","id"]), new objj_method(sel_getUid("dataSource"), function $CPTableView__dataSource(self, _cmd)
{
    return self._dataSource;
}
,["id"]), new objj_method(sel_getUid("reloadDataForRowIndexes:columnIndexes:"), function $CPTableView__reloadDataForRowIndexes_columnIndexes_(self, _cmd, rowIndexes, columnIndexes)
{
    objj_msgSend(self, "reloadData");
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("reloadData"), function $CPTableView__reloadData(self, _cmd)
{
    self._reloadAllRows = YES;
    self._objectValues = {};
    self._cachedRowHeights = [];
    objj_msgSend(self._groupRows, "removeAllIndexes");
    objj_msgSend(self, "noteNumberOfRowsChanged");
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("setDoubleAction:"), function $CPTableView__setDoubleAction_(self, _cmd, anAction)
{
    self._doubleAction = anAction;
}
,["void","SEL"]), new objj_method(sel_getUid("doubleAction"), function $CPTableView__doubleAction(self, _cmd)
{
    return self._doubleAction;
}
,["SEL"]), new objj_method(sel_getUid("clickedColumn"), function $CPTableView__clickedColumn(self, _cmd)
{
    return self._clickedColumn;
}
,["CPInteger"]), new objj_method(sel_getUid("clickedRow"), function $CPTableView__clickedRow(self, _cmd)
{
    return self._clickedRow;
}
,["CPInteger"]), new objj_method(sel_getUid("setAllowsColumnReordering:"), function $CPTableView__setAllowsColumnReordering_(self, _cmd, shouldAllowColumnReordering)
{
    self._allowsColumnReordering = !!shouldAllowColumnReordering;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsColumnReordering"), function $CPTableView__allowsColumnReordering(self, _cmd)
{
    return self._allowsColumnReordering;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsColumnResizing:"), function $CPTableView__setAllowsColumnResizing_(self, _cmd, shouldAllowColumnResizing)
{
    self._allowsColumnResizing = !!shouldAllowColumnResizing;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsColumnResizing"), function $CPTableView__allowsColumnResizing(self, _cmd)
{
    return self._allowsColumnResizing;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsMultipleSelection:"), function $CPTableView__setAllowsMultipleSelection_(self, _cmd, shouldAllowMultipleSelection)
{
    self._allowsMultipleSelection = !!shouldAllowMultipleSelection;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsMultipleSelection"), function $CPTableView__allowsMultipleSelection(self, _cmd)
{
    return self._allowsMultipleSelection;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsEmptySelection:"), function $CPTableView__setAllowsEmptySelection_(self, _cmd, shouldAllowEmptySelection)
{
    self._allowsEmptySelection = !!shouldAllowEmptySelection;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsEmptySelection"), function $CPTableView__allowsEmptySelection(self, _cmd)
{
    return self._allowsEmptySelection;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsColumnSelection:"), function $CPTableView__setAllowsColumnSelection_(self, _cmd, shouldAllowColumnSelection)
{
    self._allowsColumnSelection = !!shouldAllowColumnSelection;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsColumnSelection"), function $CPTableView__allowsColumnSelection(self, _cmd)
{
    return self._allowsColumnSelection;
}
,["BOOL"]), new objj_method(sel_getUid("setIntercellSpacing:"), function $CPTableView__setIntercellSpacing_(self, _cmd, aSize)
{
    if (CGSizeEqualToSize(self._intercellSpacing, aSize))
        return;
    self._intercellSpacing = CGSizeMakeCopy(aSize);
    self._dirtyTableColumnRangeIndex = 0;
    objj_msgSend(self, "_recalculateTableColumnRanges");
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self._headerView, "setNeedsDisplay:", YES);
    objj_msgSend(self._headerView, "setNeedsLayout");
    objj_msgSend(self, "reloadData");
}
,["void","CGSize"]), new objj_method(sel_getUid("intercellSpacing"), function $CPTableView__intercellSpacing(self, _cmd)
{
    return CGSizeMakeCopy(self._intercellSpacing);
}
,["CGSize"]), new objj_method(sel_getUid("setRowHeight:"), function $CPTableView__setRowHeight_(self, _cmd, aRowHeight)
{
    aRowHeight = +aRowHeight;
    if (self._rowHeight === aRowHeight)
        return;
    self._rowHeight = MAX(0.0, aRowHeight);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","unsigned"]), new objj_method(sel_getUid("rowHeight"), function $CPTableView__rowHeight(self, _cmd)
{
    return self._rowHeight;
}
,["unsigned"]), new objj_method(sel_getUid("setUsesAlternatingRowBackgroundColors:"), function $CPTableView__setUsesAlternatingRowBackgroundColors_(self, _cmd, shouldUseAlternatingRowBackgroundColors)
{
    self._usesAlternatingRowBackgroundColors = shouldUseAlternatingRowBackgroundColors;
}
,["void","BOOL"]), new objj_method(sel_getUid("usesAlternatingRowBackgroundColors"), function $CPTableView__usesAlternatingRowBackgroundColors(self, _cmd)
{
    return self._usesAlternatingRowBackgroundColors;
}
,["BOOL"]), new objj_method(sel_getUid("setAlternatingRowBackgroundColors:"), function $CPTableView__setAlternatingRowBackgroundColors_(self, _cmd, alternatingRowBackgroundColors)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", alternatingRowBackgroundColors, "alternating-row-colors");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPArray"]), new objj_method(sel_getUid("alternatingRowBackgroundColors"), function $CPTableView__alternatingRowBackgroundColors(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "alternating-row-colors");
}
,["CPArray"]), new objj_method(sel_getUid("selectionHighlightStyle"), function $CPTableView__selectionHighlightStyle(self, _cmd)
{
    return self._selectionHighlightStyle;
}
,["unsigned"]), new objj_method(sel_getUid("setSelectionHighlightStyle:"), function $CPTableView__setSelectionHighlightStyle_(self, _cmd, aSelectionHighlightStyle)
{
    self._selectionHighlightStyle = aSelectionHighlightStyle;
    if (aSelectionHighlightStyle === CPTableViewSelectionHighlightStyleSourceList)
        self._destinationDragStyle = CPTableViewDraggingDestinationFeedbackStyleSourceList;
    else
        self._destinationDragStyle = CPTableViewDraggingDestinationFeedbackStyleRegular;
    objj_msgSend(self, "_updateHighlightWithOldRows:newRows:", objj_msgSend(CPIndexSet, "indexSet"), self._selectedRowIndexes);
    objj_msgSend(self, "_updateHighlightWithOldColumns:newColumns:", objj_msgSend(CPIndexSet, "indexSet"), self._selectedColumnIndexes);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","unsigned"]), new objj_method(sel_getUid("setSelectionHighlightColor:"), function $CPTableView__setSelectionHighlightColor_(self, _cmd, aColor)
{
    if (objj_msgSend(objj_msgSend(self, "selectionHighlightColor"), "isEqual:", aColor))
        return;
    objj_msgSend(self, "setValue:forThemeAttribute:", aColor, "selection-color");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPColor"]), new objj_method(sel_getUid("selectionHighlightColor"), function $CPTableView__selectionHighlightColor(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "selection-color");
}
,["CPColor"]), new objj_method(sel_getUid("unfocusedSelectionHighlightColor"), function $CPTableView__unfocusedSelectionHighlightColor(self, _cmd)
{
    if (!self._unfocusedSelectionHighlightColor)
        self._unfocusedSelectionHighlightColor = objj_msgSend(self, "_unfocusedSelectionColorFromColor:saturation:", objj_msgSend(self, "selectionHighlightColor"), 0);
    return self._unfocusedSelectionHighlightColor;
}
,["CPColor"]), new objj_method(sel_getUid("setSelectionGradientColors:"), function $CPTableView__setSelectionGradientColors_(self, _cmd, aDictionary)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", aDictionary, "sourcelist-selection-color");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("selectionGradientColors"), function $CPTableView__selectionGradientColors(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "sourcelist-selection-color");
}
,["CPDictionary"]), new objj_method(sel_getUid("unfocusedSelectionGradientColors"), function $CPTableView__unfocusedSelectionGradientColors(self, _cmd)
{
    if (!self._unfocusedSourceListSelectionColor)
    {
        var sourceListColors = objj_msgSend(self, "selectionGradientColors");
        self._unfocusedSourceListSelectionColor = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(self, "_unfocusedGradientFromGradient:", objj_msgSend(sourceListColors, "objectForKey:", CPSourceListGradient)), CPSourceListGradient, objj_msgSend(self, "_unfocusedSelectionColorFromColor:saturation:", objj_msgSend(sourceListColors, "objectForKey:", CPSourceListTopLineColor), 0.2), CPSourceListTopLineColor, objj_msgSend(self, "_unfocusedSelectionColorFromColor:saturation:", objj_msgSend(sourceListColors, "objectForKey:", CPSourceListBottomLineColor), 0.2), CPSourceListBottomLineColor);
    }
    return self._unfocusedSourceListSelectionColor;
}
,["void"]), new objj_method(sel_getUid("_unfocusedSelectionColorFromColor:saturation:"), function $CPTableView___unfocusedSelectionColorFromColor_saturation_(self, _cmd, aColor, saturation)
{
    var hsb = objj_msgSend(aColor, "hsbComponents");
    return objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", hsb[0], hsb[1] * saturation, hsb[2]);
}
,["CPColor","CPColor","float"]), new objj_method(sel_getUid("_unfocusedGradientFromGradient:"), function $CPTableView___unfocusedGradientFromGradient_(self, _cmd, aGradient)
{
    var colors = objj_msgSend(aGradient.colors, "copy"),
        count = objj_msgSend(colors, "count");
    while (count--)
    {
        var rgba = colors[count].components,
            hsb = objj_msgSend(self, "_unfocusedSelectionColorFromColor:saturation:", objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", rgba[0], rgba[1], rgba[2], rgba[3]), 0.2);
        colors[count] = CGColorCreate(aGradient.colorspace, objj_msgSend(objj_msgSend(hsb, "components"), "copy"));
    }
    return CGGradientCreateWithColors(aGradient.colorspace, colors, aGradient.locations);
}
,["CGGradient","CGGradient"]), new objj_method(sel_getUid("setGridColor:"), function $CPTableView__setGridColor_(self, _cmd, aColor)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", aColor, "grid-color");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPColor"]), new objj_method(sel_getUid("gridColor"), function $CPTableView__gridColor(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "grid-color");
}
,["CPColor"]), new objj_method(sel_getUid("setGridStyleMask:"), function $CPTableView__setGridStyleMask_(self, _cmd, aGrideStyleMask)
{
    if (self._gridStyleMask === aGrideStyleMask)
        return;
    self._gridStyleMask = aGrideStyleMask;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","unsigned"]), new objj_method(sel_getUid("gridStyleMask"), function $CPTableView__gridStyleMask(self, _cmd)
{
    return self._gridStyleMask;
}
,["unsigned"]), new objj_method(sel_getUid("addTableColumn:"), function $CPTableView__addTableColumn_(self, _cmd, aTableColumn)
{
    objj_msgSend(self._tableColumns, "addObject:", aTableColumn);
    objj_msgSend(aTableColumn, "setTableView:", self);
    if (self._dirtyTableColumnRangeIndex < 0)
        self._dirtyTableColumnRangeIndex = self._tableColumns.length - 1;
    else
        self._dirtyTableColumnRangeIndex = MIN(self._tableColumns.length - 1, self._dirtyTableColumnRangeIndex);
    if (objj_msgSend(objj_msgSend(self, "sortDescriptors"), "count") > 0)
    {
        var mainSortDescriptor = objj_msgSend(objj_msgSend(self, "sortDescriptors"), "objectAtIndex:", 0);
        if (aTableColumn === objj_msgSend(self, "_tableColumnForSortDescriptor:", mainSortDescriptor))
        {
            var image = objj_msgSend(mainSortDescriptor, "ascending") ? objj_msgSend(self, "_tableHeaderSortImage") : objj_msgSend(self, "_tableHeaderReverseSortImage");
            objj_msgSend(self, "setIndicatorImage:inTableColumn:", image, aTableColumn);
        }
    }
    objj_msgSend(self, "tile");
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("removeTableColumn:"), function $CPTableView__removeTableColumn_(self, _cmd, aTableColumn)
{
    if (objj_msgSend(aTableColumn, "tableView") !== self)
        return;
    var index = objj_msgSend(self._tableColumns, "indexOfObjectIdenticalTo:", aTableColumn);
    if (index === CPNotFound)
        return;
    objj_msgSend(self._differedColumnDataToRemove, "addObject:", {"column": aTableColumn, "shouldBeHidden": objj_msgSend(aTableColumn, "isHidden")});
    objj_msgSend(aTableColumn, "setHidden:", YES);
    objj_msgSend(aTableColumn, "setTableView:", nil);
    var tableColumnUID = objj_msgSend(aTableColumn, "UID");
    if (self._objectValues[tableColumnUID])
        self._objectValues[tableColumnUID] = nil;
    if (self._dirtyTableColumnRangeIndex < 0)
        self._dirtyTableColumnRangeIndex = index;
    else
        self._dirtyTableColumnRangeIndex = MIN(index, self._dirtyTableColumnRangeIndex);
    objj_msgSend(self._tableColumns, "removeObject:", aTableColumn);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("_setDraggedColumn:"), function $CPTableView___setDraggedColumn_(self, _cmd, aColumn)
{
    if (self._draggedColumn === aColumn)
        return;
    var previouslyDraggedColumn = self._draggedColumn;
    self._draggedColumn = aColumn;
    if (aColumn)
        objj_msgSend(self, "reloadDataForRowIndexes:columnIndexes:", self._exposedRows, objj_msgSend(CPIndexSet, "indexSetWithIndex:", objj_msgSend(self._tableColumns, "indexOfObject:", aColumn)));
    if (previouslyDraggedColumn)
        objj_msgSend(self, "reloadDataForRowIndexes:columnIndexes:", self._exposedRows, objj_msgSend(CPIndexSet, "indexSetWithIndex:", objj_msgSend(self._tableColumns, "indexOfObject:", previouslyDraggedColumn)));
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("_moveColumn:toColumn:"), function $CPTableView___moveColumn_toColumn_(self, _cmd, fromIndex, toIndex)
{
    fromIndex = +fromIndex;
    toIndex = +toIndex;
    if (fromIndex === toIndex)
        return;
    if (self._dirtyTableColumnRangeIndex < 0)
        self._dirtyTableColumnRangeIndex = MIN(fromIndex, toIndex);
    else
        self._dirtyTableColumnRangeIndex = MIN(fromIndex, toIndex, self._dirtyTableColumnRangeIndex);
    var tableColumn = self._tableColumns[fromIndex];
    objj_msgSend(self._tableColumns, "removeObjectAtIndex:", fromIndex);
    objj_msgSend(self._tableColumns, "insertObject:atIndex:", tableColumn, toIndex);
    objj_msgSend(objj_msgSend(self, "headerView"), "setNeedsLayout");
    objj_msgSend(objj_msgSend(self, "headerView"), "setNeedsDisplay:", YES);
    var rowIndexes = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, objj_msgSend(self, "numberOfRows"))),
        columnIndexes = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(fromIndex, toIndex));
    objj_msgSend(self, "reloadDataForRowIndexes:columnIndexes:", rowIndexes, columnIndexes);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewColumnDidMoveNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", fromIndex, "CPOldColumn", toIndex, "CPNewColumn"));
}
,["void","unsigned","unsigned"]), new objj_method(sel_getUid("moveColumn:toColumn:"), function $CPTableView__moveColumn_toColumn_(self, _cmd, theColumnIndex, theToIndex)
{
    objj_msgSend(self, "_moveColumn:toColumn:", theColumnIndex, theToIndex);
    objj_msgSend(self, "_autosave");
}
,["void","CPInteger","CPInteger"]), new objj_method(sel_getUid("_tableColumnVisibilityDidChange:"), function $CPTableView___tableColumnVisibilityDidChange_(self, _cmd, aColumn)
{
    var columnIndex = objj_msgSend(objj_msgSend(self, "tableColumns"), "indexOfObjectIdenticalTo:", aColumn);
    if (self._dirtyTableColumnRangeIndex < 0)
        self._dirtyTableColumnRangeIndex = columnIndex;
    else
        self._dirtyTableColumnRangeIndex = MIN(columnIndex, self._dirtyTableColumnRangeIndex);
    objj_msgSend(objj_msgSend(self, "headerView"), "setNeedsLayout");
    objj_msgSend(objj_msgSend(self, "headerView"), "setNeedsDisplay:", YES);
    var rowIndexes = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, objj_msgSend(self, "numberOfRows")));
    objj_msgSend(self, "reloadDataForRowIndexes:columnIndexes:", rowIndexes, objj_msgSend(CPIndexSet, "indexSetWithIndex:", columnIndex));
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("tableColumns"), function $CPTableView__tableColumns(self, _cmd)
{
    return self._tableColumns;
}
,["CPArray"]), new objj_method(sel_getUid("columnWithIdentifier:"), function $CPTableView__columnWithIdentifier_(self, _cmd, anIdentifier)
{
    var index = 0,
        count = self._tableColumns.length;
    for (; index < count; ++index)
        if (objj_msgSend(self._tableColumns[index], "identifier") === anIdentifier)
            return index;
    return CPNotFound;
}
,["CPInteger","CPString"]), new objj_method(sel_getUid("tableColumnWithIdentifier:"), function $CPTableView__tableColumnWithIdentifier_(self, _cmd, anIdentifier)
{
    var index = objj_msgSend(self, "columnWithIdentifier:", anIdentifier);
    if (index === CPNotFound)
        return nil;
    return self._tableColumns[index];
}
,["CPTableColumn","CPString"]), new objj_method(sel_getUid("_didResizeTableColumn:"), function $CPTableView___didResizeTableColumn_(self, _cmd, theColumn)
{
    objj_msgSend(self, "_autosave");
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"), function $CPTableView__selectColumnIndexes_byExtendingSelection_(self, _cmd, columns, shouldExtendSelection)
{
    if (objj_msgSend(columns, "firstIndex") != CPNotFound && objj_msgSend(columns, "firstIndex") < 0 || objj_msgSend(columns, "lastIndex") >= objj_msgSend(self, "numberOfColumns"))
        return;
    if (objj_msgSend(self._selectedRowIndexes, "count") > 0)
    {
        objj_msgSend(self, "_updateHighlightWithOldRows:newRows:", self._selectedRowIndexes, objj_msgSend(CPIndexSet, "indexSet"));
        self._selectedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
    }
    var previousSelectedIndexes = objj_msgSend(self._selectedColumnIndexes, "copy");
    if (shouldExtendSelection)
        objj_msgSend(self._selectedColumnIndexes, "addIndexes:", columns);
    else
        self._selectedColumnIndexes = objj_msgSend(columns, "copy");
    objj_msgSend(self, "_updateHighlightWithOldColumns:newColumns:", previousSelectedIndexes, self._selectedColumnIndexes);
    objj_msgSend(self, "setNeedsDisplay:", YES);
    if (self._headerView)
        objj_msgSend(self._headerView, "setNeedsDisplay:", YES);
    objj_msgSend(self, "_noteSelectionDidChange");
}
,["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("_setSelectedRowIndexes:"), function $CPTableView___setSelectedRowIndexes_(self, _cmd, rows)
{
    if (objj_msgSend(self._selectedRowIndexes, "isEqualToIndexSet:", rows))
        return;
    var previousSelectedIndexes = self._selectedRowIndexes;
    self._lastSelectedRow = objj_msgSend(rows, "count") > 0 ? objj_msgSend(rows, "lastIndex") : -1;
    self._selectedRowIndexes = objj_msgSend(rows, "copy");
    objj_msgSend(self, "_updateHighlightWithOldRows:newRows:", previousSelectedIndexes, self._selectedRowIndexes);
    objj_msgSend(self, "setNeedsDisplay:", YES);
    var binderClass = objj_msgSend(objj_msgSend(self, "class"), "_binderClassForBinding:", "selectionIndexes");
    objj_msgSend(objj_msgSend(binderClass, "getBinding:forObject:", "selectionIndexes", self), "reverseSetValueFor:", "selectedRowIndexes");
    objj_msgSend(self, "_noteSelectionDidChange");
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"), function $CPTableView__selectRowIndexes_byExtendingSelection_(self, _cmd, rows, shouldExtendSelection)
{
    if (objj_msgSend(rows, "isEqualToIndexSet:", self._selectedRowIndexes) || (objj_msgSend(rows, "firstIndex") != CPNotFound && objj_msgSend(rows, "firstIndex") < 0 || objj_msgSend(rows, "lastIndex") >= objj_msgSend(self, "numberOfRows")) || objj_msgSend(self, "numberOfColumns") <= 0)
        return;
    if (objj_msgSend(self._selectedColumnIndexes, "count") > 0)
    {
        objj_msgSend(self, "_updateHighlightWithOldColumns:newColumns:", self._selectedColumnIndexes, objj_msgSend(CPIndexSet, "indexSet"));
        self._selectedColumnIndexes = objj_msgSend(CPIndexSet, "indexSet");
        if (self._headerView)
            objj_msgSend(self._headerView, "setNeedsDisplay:", YES);
    }
    var newSelectedIndexes;
    if (shouldExtendSelection)
    {
        newSelectedIndexes = objj_msgSend(self._selectedRowIndexes, "copy");
        objj_msgSend(newSelectedIndexes, "addIndexes:", rows);
    }
    else
        newSelectedIndexes = objj_msgSend(rows, "copy");
    objj_msgSend(self, "_setSelectedRowIndexes:", newSelectedIndexes);
}
,["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("_cleanUpSelectionRowIndexes:"), function $CPTableView___cleanUpSelectionRowIndexes_(self, _cmd, anIndexSet)
{
    if (objj_msgSend(self, "_delegateRespondsToSelectionIndexesForProposedSelection"))
    {
        return objj_msgSend(self, "_sendDelegateSelectionIndexesForProposedSelection:", anIndexSet);
    }
    else if (objj_msgSend(self, "_delegateRespondsToShouldSelectRow"))
    {
        var indexesToRemove = objj_msgSend(CPIndexSet, "new"),
            currentIndex = objj_msgSend(anIndexSet, "firstIndex");
        while (currentIndex != CPNotFound)
        {
            if (!objj_msgSend(self, "_sendDelegateShouldSelectRow:", currentIndex))
                objj_msgSend(indexesToRemove, "addIndex:", currentIndex);
            currentIndex = objj_msgSend(anIndexSet, "indexGreaterThanIndex:", currentIndex);
        }
        objj_msgSend(anIndexSet, "removeIndexes:", indexesToRemove);
        return anIndexSet;
    }
    else
        return anIndexSet;
}
,["CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_updateHighlightWithOldRows:newRows:"), function $CPTableView___updateHighlightWithOldRows_newRows_(self, _cmd, oldRows, newRows)
{
    var firstExposedRow = objj_msgSend(self._exposedRows, "firstIndex"),
        exposedLength = objj_msgSend(self._exposedRows, "lastIndex") - firstExposedRow + 1,
        deselectRows = [],
        selectRows = [],
        deselectRowIndexes = objj_msgSend(oldRows, "copy"),
        selectRowIndexes = objj_msgSend(newRows, "copy");
    objj_msgSend(deselectRowIndexes, "removeMatches:", selectRowIndexes);
    objj_msgSend(deselectRowIndexes, "getIndexes:maxCount:inIndexRange:", deselectRows, -1, CPMakeRange(firstExposedRow, exposedLength));
    objj_msgSend(selectRowIndexes, "getIndexes:maxCount:inIndexRange:", selectRows, -1, CPMakeRange(firstExposedRow, exposedLength));
    var showsSelection = self._selectionHighlightStyle !== CPTableViewSelectionHighlightStyleNone,
        selectors = [sel_getUid("unsetThemeState:"), sel_getUid("setThemeState:")],
        selectInfo = [{rows: deselectRows, selectorIndex: 0}, {rows: selectRows, selectorIndex: showsSelection ? 1 : 0}];
    for (var identifier in self._dataViewsForTableColumns)
    {
        var dataViewsInTableColumn = self._dataViewsForTableColumns[identifier];
        for (var i = 0; i < selectInfo.length; ++i)
        {
            var info = selectInfo[i],
                count = info.rows.length;
            while (count--)
            {
                var view = dataViewsInTableColumn[info.rows[count]];
                objj_msgSend(view, "performSelector:withObject:", selectors[info.selectorIndex], CPThemeStateSelectedDataView);
            }
        }
    }
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_updateHighlightWithOldColumns:newColumns:"), function $CPTableView___updateHighlightWithOldColumns_newColumns_(self, _cmd, oldColumns, newColumns)
{
    var firstExposedColumn = objj_msgSend(self._exposedColumns, "firstIndex"),
        exposedLength = objj_msgSend(self._exposedColumns, "lastIndex") - firstExposedColumn + 1,
        deselectColumns = [],
        selectColumns = [],
        deselectColumnIndexes = objj_msgSend(oldColumns, "copy"),
        selectColumnIndexes = objj_msgSend(newColumns, "copy"),
        selectRows = [];
    objj_msgSend(deselectColumnIndexes, "removeMatches:", selectColumnIndexes);
    objj_msgSend(deselectColumnIndexes, "getIndexes:maxCount:inIndexRange:", deselectColumns, -1, CPMakeRange(firstExposedColumn, exposedLength));
    objj_msgSend(selectColumnIndexes, "getIndexes:maxCount:inIndexRange:", selectColumns, -1, CPMakeRange(firstExposedColumn, exposedLength));
    objj_msgSend(self._exposedRows, "getIndexes:maxCount:inIndexRange:", selectRows, -1, nil);
    var showsSelection = self._selectionHighlightStyle !== CPTableViewSelectionHighlightStyleNone,
        selectors = [sel_getUid("unsetThemeState:"), sel_getUid("setThemeState:")],
        selectInfo = [{columns: deselectColumns, rowSelectorIndex: 0, headerSelectorIndex: 0}, {columns: selectColumns, rowSelectorIndex: showsSelection ? 1 : 0, headerSelectorIndex: 1}],
        rowsCount = selectRows.length;
    for (var selectIndex = 0; selectIndex < selectInfo.length; ++selectIndex)
    {
        var info = selectInfo[selectIndex],
            count = info.columns.length,
            rowSelector = selectors[info.rowSelectorIndex],
            headerSelector = selectors[info.headerSelectorIndex];
        while (count--)
        {
            var columnIndex = info.columns[count],
                identifier = objj_msgSend(self._tableColumns[columnIndex], "UID"),
                dataViewsInTableColumn = self._dataViewsForTableColumns[identifier];
            for (var i = 0; i < rowsCount; i++)
            {
                var rowIndex = selectRows[i],
                    dataView = dataViewsInTableColumn[rowIndex];
                objj_msgSend(dataView, "performSelector:withObject:", rowSelector, CPThemeStateSelectedDataView);
            }
            if (self._headerView)
            {
                var headerView = objj_msgSend(self._tableColumns[columnIndex], "headerView");
                objj_msgSend(headerView, "performSelector:withObject:", headerSelector, CPThemeStateSelected);
            }
        }
    }
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("selectedColumn"), function $CPTableView__selectedColumn(self, _cmd)
{
    return objj_msgSend(self._selectedColumnIndexes, "lastIndex");
}
,["int"]), new objj_method(sel_getUid("selectedColumnIndexes"), function $CPTableView__selectedColumnIndexes(self, _cmd)
{
    return self._selectedColumnIndexes;
}
,["CPIndexSet"]), new objj_method(sel_getUid("selectedRow"), function $CPTableView__selectedRow(self, _cmd)
{
    return self._lastSelectedRow;
}
,["int"]), new objj_method(sel_getUid("selectedRowIndexes"), function $CPTableView__selectedRowIndexes(self, _cmd)
{
    return objj_msgSend(self._selectedRowIndexes, "copy");
}
,["CPIndexSet"]), new objj_method(sel_getUid("deselectColumn:"), function $CPTableView__deselectColumn_(self, _cmd, anIndex)
{
    var selectedColumnIndexes = objj_msgSend(self._selectedColumnIndexes, "copy");
    objj_msgSend(selectedColumnIndexes, "removeIndex:", anIndex);
    objj_msgSend(self, "selectColumnIndexes:byExtendingSelection:", selectedColumnIndexes, NO);
    objj_msgSend(self, "_noteSelectionDidChange");
}
,["void","CPInteger"]), new objj_method(sel_getUid("deselectRow:"), function $CPTableView__deselectRow_(self, _cmd, aRow)
{
    var selectedRowIndexes = objj_msgSend(self._selectedRowIndexes, "copy");
    objj_msgSend(selectedRowIndexes, "removeIndex:", aRow);
    objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", selectedRowIndexes, NO);
    objj_msgSend(self, "_noteSelectionDidChange");
}
,["void","CPInteger"]), new objj_method(sel_getUid("numberOfSelectedColumns"), function $CPTableView__numberOfSelectedColumns(self, _cmd)
{
    return objj_msgSend(self._selectedColumnIndexes, "count");
}
,["CPInteger"]), new objj_method(sel_getUid("numberOfSelectedRows"), function $CPTableView__numberOfSelectedRows(self, _cmd)
{
    return objj_msgSend(self._selectedRowIndexes, "count");
}
,["CPInteger"]), new objj_method(sel_getUid("isColumnSelected:"), function $CPTableView__isColumnSelected_(self, _cmd, anIndex)
{
    return objj_msgSend(self._selectedColumnIndexes, "containsIndex:", anIndex);
}
,["BOOL","CPInteger"]), new objj_method(sel_getUid("isRowSelected:"), function $CPTableView__isRowSelected_(self, _cmd, aRow)
{
    return objj_msgSend(self._selectedRowIndexes, "containsIndex:", aRow);
}
,["BOOL","CPInteger"]), new objj_method(sel_getUid("deselectAll"), function $CPTableView__deselectAll(self, _cmd)
{
    objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSet"), NO);
    objj_msgSend(self, "selectColumnIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSet"), NO);
}
,["void"]), new objj_method(sel_getUid("selectAll:"), function $CPTableView__selectAll_(self, _cmd, sender)
{
    if (self._allowsMultipleSelection)
    {
        if (!objj_msgSend(self, "_sendDelegateSelectionShouldChangeInTableView"))
            return;
        if (objj_msgSend(objj_msgSend(self, "selectedColumnIndexes"), "count"))
            objj_msgSend(self, "selectColumnIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, objj_msgSend(self, "numberOfColumns"))), NO);
        else
        {
            var range = objj_msgSend(self, "_cleanUpSelectionRowIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, objj_msgSend(self, "numberOfRows"))));
            objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", range, NO);
        }
    }
}
,["void","id"]), new objj_method(sel_getUid("deselectAll:"), function $CPTableView__deselectAll_(self, _cmd, sender)
{
    if (objj_msgSend(self, "allowsEmptySelection"))
    {
        if (!objj_msgSend(self, "_sendDelegateSelectionShouldChangeInTableView"))
            return;
        objj_msgSend(self, "deselectAll");
    }
}
,["void","id"]), new objj_method(sel_getUid("numberOfColumns"), function $CPTableView__numberOfColumns(self, _cmd)
{
    return self._tableColumns.length;
}
,["int"]), new objj_method(sel_getUid("numberOfRows"), function $CPTableView__numberOfRows(self, _cmd)
{
    if (self._numberOfRows !== nil)
        return self._numberOfRows;
    var contentBindingInfo = objj_msgSend(self, "infoForBinding:", "content");
    if (contentBindingInfo)
    {
        var destination = objj_msgSend(contentBindingInfo, "objectForKey:", CPObservedObjectKey),
            keyPath = objj_msgSend(contentBindingInfo, "objectForKey:", CPObservedKeyPathKey);
        self._numberOfRows = objj_msgSend(objj_msgSend(destination, "valueForKeyPath:", keyPath), "count");
    }
    else
    {
        self._numberOfRows = objj_msgSend(self, "_sendDataSourceNumberOfRowsInTableView");
        if (!self._numberOfRows)
        {
            if (self._dataSource && !objj_msgSend(self, "_dataSourceRespondsToNumberOfRowsinTableView"))
                CPLog("no content binding established and data source " + objj_msgSend(self._dataSource, "description") + " does not implement numberOfRowsInTableView:");
            self._numberOfRows = 0;
        }
    }
    return self._numberOfRows;
}
,["int"]), new objj_method(sel_getUid("editColumn:row:withEvent:select:"), function $CPTableView__editColumn_row_withEvent_select_(self, _cmd, columnIndex, rowIndex, theEvent, flag)
{
    if (self._isViewBased)
    {
        var identifier = objj_msgSend(self._tableColumns[columnIndex], "UID"),
            view = self._dataViewsForTableColumns[identifier][rowIndex];
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", view);
    }
    else
    {
        if (!objj_msgSend(self, "isRowSelected:", rowIndex))
            objj_msgSend(objj_msgSend(CPException, "exceptionWithName:reason:userInfo:", "Error", "Attempt to edit row=" + rowIndex + " when not selected.", nil), "raise");
        objj_msgSend(self, "scrollRowToVisible:", rowIndex);
        objj_msgSend(self, "scrollColumnToVisible:", columnIndex);
        self._editingCellIndex = CGPointMake(columnIndex, rowIndex);
        self._editingCellIndex._shouldSelect = flag;
        objj_msgSend(self, "reloadDataForRowIndexes:columnIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", rowIndex), objj_msgSend(CPIndexSet, "indexSetWithIndex:", columnIndex));
    }
}
,["void","CPInteger","CPInteger","CPEvent","BOOL"]), new objj_method(sel_getUid("editedColumn"), function $CPTableView__editedColumn(self, _cmd)
{
    if (!self._editingCellIndex)
        return CPNotFound;
    return self._editingCellIndex.x;
}
,["CPInteger"]), new objj_method(sel_getUid("editedRow"), function $CPTableView__editedRow(self, _cmd)
{
    if (!self._editingCellIndex)
        return CPNotFound;
    return self._editingCellIndex.y;
}
,["CPInteger"]), new objj_method(sel_getUid("cornerView"), function $CPTableView__cornerView(self, _cmd)
{
    return self._cornerView;
}
,["CPView"]), new objj_method(sel_getUid("setCornerView:"), function $CPTableView__setCornerView_(self, _cmd, aView)
{
    if (self._cornerView === aView)
        return;
    self._cornerView = aView;
    var scrollView = objj_msgSend(self, "enclosingScrollView");
    if (objj_msgSend(scrollView, "isKindOfClass:", objj_msgSend(CPScrollView, "class")) && objj_msgSend(scrollView, "documentView") === self)
        objj_msgSend(scrollView, "_updateCornerAndHeaderView");
}
,["void","CPView"]), new objj_method(sel_getUid("headerView"), function $CPTableView__headerView(self, _cmd)
{
    return self._headerView;
}
,["CPView"]), new objj_method(sel_getUid("setHeaderView:"), function $CPTableView__setHeaderView_(self, _cmd, aHeaderView)
{
    if (self._headerView === aHeaderView)
        return;
    objj_msgSend(self._headerView, "setTableView:", nil);
    self._headerView = aHeaderView;
    if (self._headerView)
    {
        objj_msgSend(self._headerView, "setTableView:", self);
        objj_msgSend(self._headerView, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), CGRectGetHeight(objj_msgSend(self._headerView, "frame"))));
    }
    else
    {
        objj_msgSend(self._cornerView, "removeFromSuperview");
        self._cornerView = nil;
    }
    var scrollView = objj_msgSend(self, "enclosingScrollView");
    if (objj_msgSend(scrollView, "isKindOfClass:", objj_msgSend(CPScrollView, "class")) && objj_msgSend(scrollView, "documentView") === self)
        objj_msgSend(scrollView, "_updateCornerAndHeaderView");
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPView"]), new objj_method(sel_getUid("_recalculateTableColumnRanges"), function $CPTableView___recalculateTableColumnRanges(self, _cmd)
{
    if (self._dirtyTableColumnRangeIndex < 0)
        return;
    self._numberOfHiddenColumns = 0;
    var index = self._dirtyTableColumnRangeIndex,
        count = self._tableColumns.length,
        x = index === 0 ? 0.0 : CPMaxRange(self._tableColumnRanges[index - 1]);
    for (; index < count; ++index)
    {
        var tableColumn = self._tableColumns[index];
        if (objj_msgSend(tableColumn, "isHidden"))
        {
            self._numberOfHiddenColumns += 1;
            self._tableColumnRanges[index] = CPMakeRange(x, 0.0);
        }
        else
        {
            var width = objj_msgSend(self._tableColumns[index], "width") + self._intercellSpacing.width;
            self._tableColumnRanges[index] = CPMakeRange(x, width);
            x += width;
        }
    }
    self._tableColumnRanges.length = count;
    self._dirtyTableColumnRangeIndex = CPNotFound;
}
,["void"]), new objj_method(sel_getUid("rectOfColumn:"), function $CPTableView__rectOfColumn_(self, _cmd, aColumnIndex)
{
    aColumnIndex = +aColumnIndex;
    if (aColumnIndex < 0 || aColumnIndex >= self._tableColumns.length)
        return CGRectMakeZero();
    if (objj_msgSend(objj_msgSend(self._tableColumns, "objectAtIndex:", aColumnIndex), "isHidden"))
        return CGRectMakeZero();
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    var range = self._tableColumnRanges[aColumnIndex];
    return CGRectMake(range.location, 0.0, range.length, CGRectGetHeight(objj_msgSend(self, "bounds")));
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("_rectOfRow:checkRange:"), function $CPTableView___rectOfRow_checkRange_(self, _cmd, aRowIndex, checkRange)
{
    var lastIndex = objj_msgSend(self, "numberOfRows") - 1,
        validIndex = aRowIndex >= 0 && aRowIndex <= lastIndex;
    if (checkRange && !validIndex)
        return CGRectMakeZero();
    var y = 0,
        height,
        fixedHeightRows = 0;
    if (self._implementedDelegateMethods & CPTableViewDelegate_tableView_heightOfRow_)
    {
        objj_msgSend(self, "_populateRowHeightCacheIfNeeded");
        var heightInfo;
        if (validIndex)
        {
            heightInfo = self._cachedRowHeights[aRowIndex];
            y = heightInfo.y;
            height = heightInfo.height + self._intercellSpacing.height;
        }
        else
        {
            height = self._rowHeight + self._intercellSpacing.height;
            if (self._numberOfRows > 0)
            {
                heightInfo = self._cachedRowHeights[lastIndex];
                y = heightInfo.y + heightInfo.height + self._intercellSpacing.height;
                fixedHeightRows = aRowIndex - self._numberOfRows;
            }
        }
    }
    else
    {
        fixedHeightRows = aRowIndex;
        height = self._rowHeight + self._intercellSpacing.height;
    }
    y += fixedHeightRows * (self._rowHeight + self._intercellSpacing.height);
    return CGRectMake(0.0, y, CGRectGetWidth(objj_msgSend(self, "bounds")), height);
}
,["CGRect","CPInteger","BOOL"]), new objj_method(sel_getUid("rectOfRow:"), function $CPTableView__rectOfRow_(self, _cmd, aRowIndex)
{
    return objj_msgSend(self, "_rectOfRow:checkRange:", aRowIndex, YES);
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("rowsInRect:"), function $CPTableView__rowsInRect_(self, _cmd, aRect)
{
    if (self._numberOfRows <= 0)
        return CPMakeRange(0, 0);
    var bounds = objj_msgSend(self, "bounds");
    if (!CGRectIntersectsRect(aRect, bounds))
        return CPMakeRange(0, 0);
    var firstRow = objj_msgSend(self, "rowAtPoint:", aRect.origin);
    if (firstRow < 0)
        firstRow = 0;
    var lastRow = objj_msgSend(self, "rowAtPoint:", CGPointMake(0.0, CGRectGetMaxY(aRect)));
    if (lastRow < 0)
        lastRow = self._numberOfRows - 1;
    return CPMakeRange(firstRow, lastRow - firstRow + 1);
}
,["CPRange","CGRect"]), new objj_method(sel_getUid("_exposedRowsInRect:"), function $CPTableView___exposedRowsInRect_(self, _cmd, aRect)
{
    var rowRange = objj_msgSend(self, "rowsInRect:", aRect),
        lastRealRow = CPMaxRange(rowRange) - 1,
        rectOfLastRealRow = objj_msgSend(self, "_rectOfRow:checkRange:", lastRealRow, NO),
        bottomOfRealRows = CGRectGetMaxY(rectOfLastRealRow),
        rectBottom = CGRectGetMaxY(aRect);
    if (bottomOfRealRows >= rectBottom)
        return rowRange;
    var numberOfSynthesizedRows = CEIL((rectBottom - bottomOfRealRows) / (self._rowHeight + self._intercellSpacing.height));
    rowRange.length += numberOfSynthesizedRows;
    return rowRange;
}
,["CPRange","CGRect"]), new objj_method(sel_getUid("columnIndexesInRect:"), function $CPTableView__columnIndexesInRect_(self, _cmd, aRect)
{
    var column = MAX(0, objj_msgSend(self, "columnAtPoint:", CGPointMake(aRect.origin.x, 0.0))),
        lastColumn = objj_msgSend(self, "columnAtPoint:", CGPointMake(CGRectGetMaxX(aRect), 0.0));
    if (lastColumn === CPNotFound)
        lastColumn = self._tableColumns.length - 1;
    if (self._numberOfHiddenColumns <= 0)
        return objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(column, lastColumn - column + 1));
    var indexSet = objj_msgSend(CPIndexSet, "indexSet");
    for (; column <= lastColumn; ++column)
    {
        var tableColumn = self._tableColumns[column];
        if (!objj_msgSend(tableColumn, "isHidden"))
            objj_msgSend(indexSet, "addIndex:", column);
    }
    return indexSet;
}
,["CPIndexSet","CGRect"]), new objj_method(sel_getUid("columnAtPoint:"), function $CPTableView__columnAtPoint_(self, _cmd, aPoint)
{
    var bounds = objj_msgSend(self, "bounds");
    if (!CGRectContainsPoint(bounds, aPoint))
        return CPNotFound;
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    var x = aPoint.x,
        low = 0,
        high = self._tableColumnRanges.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            range = self._tableColumnRanges[middle];
        if (x < range.location)
            high = middle - 1;
        else if (x >= CPMaxRange(range))
            low = middle + 1;
        else
        {
            var numberOfColumns = self._tableColumnRanges.length;
            while (middle < numberOfColumns && objj_msgSend(self._tableColumns[middle], "isHidden"))
                ++middle;
            if (middle < numberOfColumns)
                return middle;
            return CPNotFound;
        }
    }
    return CPNotFound;
}
,["CPInteger","CGPoint"]), new objj_method(sel_getUid("rowAtPoint:"), function $CPTableView__rowAtPoint_(self, _cmd, aPoint)
{
    var bounds = objj_msgSend(self, "bounds");
    if (aPoint.x < CGRectGetMinX(bounds) || aPoint.x >= CGRectGetMaxX(bounds))
        return -1;
    if (self._implementedDelegateMethods & CPTableViewDelegate_tableView_heightOfRow_)
    {
        var heightInfo = objj_msgSend(self._cachedRowHeights, "lastObject");
        if (!heightInfo || aPoint.y >= heightInfo.y + heightInfo.height + self._intercellSpacing.height)
            return -1;
        return objj_msgSend(self._cachedRowHeights, "indexOfObject:inSortedRange:options:usingComparator:", aPoint, nil, 0, function(aPoint, heightInfo)
        {
            if (aPoint.y < heightInfo.y)
                return CPOrderedAscending;
            if (aPoint.y > heightInfo.y + heightInfo.height + self._intercellSpacing.height)
                return CPOrderedDescending;
            return CPOrderedSame;
        });
    }
    else
    {
        var row = FLOOR(aPoint.y / (self._rowHeight + self._intercellSpacing.height));
        return row >= self._numberOfRows ? -1 : row;
    }
}
,["CPInteger","CGPoint"]), new objj_method(sel_getUid("rowForView:"), function $CPTableView__rowForView_(self, _cmd, aView)
{
    return objj_msgSend(self, "rowNotColumn:forView:", YES, aView);
}
,["CPInteger","CPView"]), new objj_method(sel_getUid("columnForView:"), function $CPTableView__columnForView_(self, _cmd, aView)
{
    return objj_msgSend(self, "rowNotColumn:forView:", NO, aView);
}
,["CPInteger","CPView"]), new objj_method(sel_getUid("rowNotColumn:forView:"), function $CPTableView__rowNotColumn_forView_(self, _cmd, isRow, aView)
{
    if (!objj_msgSend(aView, "isKindOfClass:", objj_msgSend(CPView, "class")))
        return -1;
    var cellView = aView,
        contentView = objj_msgSend(objj_msgSend(self, "window"), "contentView"),
        max_rec = 100;
    while (max_rec--)
    {
        if (!cellView || cellView === contentView)
        {
            return -1;
        }
        else
        {
            var superview = objj_msgSend(cellView, "superview");
            if (objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPTableView, "class")))
            {
                break;
            }
            cellView = superview;
        }
    }
    var exposedRows = [],
        exposedColumns = [];
    objj_msgSend(self._exposedRows, "getIndexes:maxCount:inIndexRange:", exposedRows, -1, nil);
    objj_msgSend(self._exposedColumns, "getIndexes:maxCount:inIndexRange:", exposedColumns, -1, nil);
    var colcount = exposedColumns.length,
        countOfRows = exposedRows.length;
    while (colcount--)
    {
        var column = exposedColumns[colcount],
            tableColumnUID = objj_msgSend(self._tableColumns[column], "UID"),
            dataViewsInTableColumn = self._dataViewsForTableColumns[tableColumnUID],
            rowcount = countOfRows;
        while (rowcount--)
        {
            var row = exposedRows[rowcount];
            if (cellView == dataViewsInTableColumn[row])
                return isRow ? row : column;
        }
    }
    return -1;
}
,["CPInteger","BOOL","CPView"]), new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"), function $CPTableView__frameOfDataViewAtColumn_row_(self, _cmd, aColumn, aRow)
{
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    if (aColumn > objj_msgSend(self, "numberOfColumns") || aRow > objj_msgSend(self, "numberOfRows"))
        return CGRectMakeZero();
    var tableColumnRange = self._tableColumnRanges[aColumn],
        rectOfRow = objj_msgSend(self, "rectOfRow:", aRow),
        leftInset = FLOOR(self._intercellSpacing.width / 2.0),
        topInset = FLOOR(self._intercellSpacing.height / 2.0);
    return CGRectMake(tableColumnRange.location + leftInset, CGRectGetMinY(rectOfRow) + topInset, tableColumnRange.length - self._intercellSpacing.width, CGRectGetHeight(rectOfRow) - self._intercellSpacing.height);
}
,["CGRect","CPInteger","CPInteger"]), new objj_method(sel_getUid("resizeWithOldSuperviewSize:"), function $CPTableView__resizeWithOldSuperviewSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "resizeWithOldSuperviewSize:", aSize);
    if (self._disableAutomaticResizing)
        return;
    var mask = self._columnAutoResizingStyle;
    if (!self._lastColumnShouldSnap)
    {
        var superview = objj_msgSend(self, "superview");
        if (!superview || !objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
            return;
        var superviewWidth = objj_msgSend(superview, "bounds").size.width,
            lastColumnMaxX = CGRectGetMaxX(objj_msgSend(self, "rectOfColumn:", objj_msgSend(self, "numberOfColumns") - 1));
        if (lastColumnMaxX >= superviewWidth && lastColumnMaxX <= aSize.width || lastColumnMaxX <= superviewWidth && lastColumnMaxX >= aSize.width)
            self._lastColumnShouldSnap = YES;
        else if (mask === CPTableViewUniformColumnAutoresizingStyle)
            return;
    }
    if (mask === CPTableViewUniformColumnAutoresizingStyle)
        objj_msgSend(self, "_resizeAllColumnUniformlyWithOldSize:", aSize);
    else if (mask === CPTableViewLastColumnOnlyAutoresizingStyle)
        objj_msgSend(self, "sizeLastColumnToFit");
    else if (mask === CPTableViewFirstColumnOnlyAutoresizingStyle)
        objj_msgSend(self, "_autoResizeFirstColumn");
}
,["void","CGSize"]), new objj_method(sel_getUid("_autoResizeFirstColumn"), function $CPTableView___autoResizeFirstColumn(self, _cmd)
{
    var superview = objj_msgSend(self, "superview");
    if (!superview)
        return;
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    var count = self._tableColumns.length,
        columnToResize = nil,
        totalWidth = 0,
        i = 0;
    for (; i < count; i++)
    {
        var column = self._tableColumns[i];
        if (!objj_msgSend(column, "isHidden"))
        {
            if (!columnToResize)
                columnToResize = column;
            totalWidth += objj_msgSend(column, "width") + self._intercellSpacing.width;
        }
    }
    if (columnToResize)
    {
        var superviewSize = objj_msgSend(superview, "bounds").size,
            newWidth = superviewSize.width - totalWidth;
        newWidth += objj_msgSend(columnToResize, "width");
        objj_msgSend(columnToResize, "_tryToResizeToWidth:", newWidth);
    }
    objj_msgSend(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("_resizeAllColumnUniformlyWithOldSize:"), function $CPTableView___resizeAllColumnUniformlyWithOldSize_(self, _cmd, oldSize)
{
    var superview = objj_msgSend(self, "superview");
    if (!superview || !objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
        return;
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    var superviewWidth = objj_msgSend(superview, "bounds").size.width,
        count = self._tableColumns.length,
        resizableColumns = objj_msgSend(CPIndexSet, "indexSet"),
        remainingSpace = 0.0,
        i = 0;
    for (; i < count; i++)
    {
        var tableColumn = self._tableColumns[i];
        if (!objj_msgSend(tableColumn, "isHidden") && objj_msgSend(tableColumn, "resizingMask") & CPTableColumnAutoresizingMask)
            objj_msgSend(resizableColumns, "addIndex:", i);
    }
    var maxXofColumns = CGRectGetMaxX(objj_msgSend(self, "rectOfColumn:", objj_msgSend(resizableColumns, "lastIndex"))),
        remainingSpace = superviewWidth - maxXofColumns,
        resizeableColumnsCount = objj_msgSend(resizableColumns, "count"),
        proportionate = 0;
    while (remainingSpace && resizeableColumnsCount)
    {
        proportionate += remainingSpace / resizeableColumnsCount;
        remainingSpace = 0.0;
        var index = CPNotFound;
        while ((index = objj_msgSend(resizableColumns, "indexGreaterThanIndex:", index)) !== CPNotFound)
        {
            var item = self._tableColumns[index],
                proposedWidth = objj_msgSend(item, "width") + proportionate,
                resizeLeftovers = objj_msgSend(item, "_tryToResizeToWidth:", proposedWidth);
            if (resizeLeftovers)
            {
                objj_msgSend(resizableColumns, "removeIndex:", index);
                remainingSpace += resizeLeftovers;
            }
        }
    }
    while (count-- && objj_msgSend(self._tableColumns[count], "isHidden"));
    var delta = superviewWidth - CGRectGetMaxX(objj_msgSend(self, "rectOfColumn:", count)) - (objj_msgSend(self, "intercellSpacing").width || 1),
        newSize = objj_msgSend(item, "width") + delta;
    objj_msgSend(item, "_tryToResizeToWidth:", newSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("setColumnAutoresizingStyle:"), function $CPTableView__setColumnAutoresizingStyle_(self, _cmd, style)
{
    self._columnAutoResizingStyle = style;
}
,["void","unsigned"]), new objj_method(sel_getUid("columnAutoresizingStyle"), function $CPTableView__columnAutoresizingStyle(self, _cmd)
{
    return self._columnAutoResizingStyle;
}
,["unsigned"]), new objj_method(sel_getUid("sizeLastColumnToFit"), function $CPTableView__sizeLastColumnToFit(self, _cmd)
{
    self._lastColumnShouldSnap = YES;
    var superview = objj_msgSend(self, "superview");
    if (!superview)
        return;
    var superviewSize = objj_msgSend(superview, "bounds").size;
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    var count = self._tableColumns.length;
    while (count-- && objj_msgSend(self._tableColumns[count], "isHidden"));
    if (count >= 0)
    {
        var columnToResize = self._tableColumns[count],
            newSize = MAX(0.0, superviewSize.width - CGRectGetMinX(objj_msgSend(self, "rectOfColumn:", count)) - self._intercellSpacing.width);
        objj_msgSend(columnToResize, "_tryToResizeToWidth:", newSize);
    }
    objj_msgSend(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("noteNumberOfRowsChanged"), function $CPTableView__noteNumberOfRowsChanged(self, _cmd)
{
    var oldNumberOfRows = self._numberOfRows;
    self._numberOfRows = nil;
    self._cachedRowHeights = [];
    objj_msgSend(self, "noteHeightOfRowsWithIndexesChanged:", objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, objj_msgSend(self, "numberOfRows"))));
    var hangingSelections = oldNumberOfRows - self._numberOfRows;
    if (hangingSelections > 0)
    {
        var previousSelectionCount = objj_msgSend(self._selectedRowIndexes, "count");
        objj_msgSend(self._selectedRowIndexes, "removeIndexesInRange:", CPMakeRange(self._numberOfRows, hangingSelections));
        if (!objj_msgSend(self._selectedRowIndexes, "containsIndex:", objj_msgSend(self, "selectedRow")))
            self._lastSelectedRow = CPNotFound;
        if (previousSelectionCount > objj_msgSend(self._selectedRowIndexes, "count"))
            objj_msgSend(self, "_noteSelectionDidChange");
    }
    objj_msgSend(self, "tile");
}
,["void"]), new objj_method(sel_getUid("_populateRowHeightCacheIfNeeded"), function $CPTableView___populateRowHeightCacheIfNeeded(self, _cmd)
{
    if (objj_msgSend(self, "numberOfRows") !== self._cachedRowHeights.length)
        objj_msgSend(self, "noteHeightOfRowsWithIndexesChanged:", objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self._numberOfRows)));
}
,["void"]), new objj_method(sel_getUid("noteHeightOfRowsWithIndexesChanged:"), function $CPTableView__noteHeightOfRowsWithIndexesChanged_(self, _cmd, anIndexSet)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_heightOfRow_))
        return;
    var i = objj_msgSend(anIndexSet, "indexGreaterThanOrEqualToIndex:", 0);
    if (i === CPNotFound)
        return;
    var y = i < self._cachedRowHeights.length ? self._cachedRowHeights[i].y : 0;
    for (var count = objj_msgSend(self, "numberOfRows"); i < count; ++i)
    {
        var height;
        if (objj_msgSend(anIndexSet, "containsIndex:", i))
            height = objj_msgSend(self, "_sendDelegateHeightOfRow:", i);
        else
            height = self._cachedRowHeights[i].height || self._rowHeight;
        self._cachedRowHeights[i] = {y: y, height: height};
        y += height + self._intercellSpacing.height;
    }
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("tile"), function $CPTableView__tile(self, _cmd)
{
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    var width = self._tableColumnRanges.length > 0 ? CPMaxRange(objj_msgSend(self._tableColumnRanges, "lastObject")) : 0.0,
        superview = objj_msgSend(self, "superview"),
        height = 0;
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_heightOfRow_))
        height = (self._rowHeight + self._intercellSpacing.height) * self._numberOfRows;
    else if (self._numberOfRows > 0)
    {
        objj_msgSend(self, "_populateRowHeightCacheIfNeeded");
        var heightInfo = self._cachedRowHeights[self._cachedRowHeights.length - 1];
        height = heightInfo.y + heightInfo.height + self._intercellSpacing.height;
    }
    if (objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
    {
        var superviewSize = objj_msgSend(superview, "bounds").size;
        width = MAX(superviewSize.width, width);
        height = MAX(superviewSize.height, height);
    }
    objj_msgSend(self, "setFrameSize:", CGSizeMake(width, height));
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("scrollRowToVisible:"), function $CPTableView__scrollRowToVisible_(self, _cmd, rowIndex)
{
    var visible = objj_msgSend(self, "visibleRect"),
        rowRect = objj_msgSend(self, "rectOfRow:", rowIndex);
    visible.origin.y = rowRect.origin.y;
    visible.size.height = rowRect.size.height;
    objj_msgSend(self, "scrollRectToVisible:", visible);
}
,["void","int"]), new objj_method(sel_getUid("scrollColumnToVisible:"), function $CPTableView__scrollColumnToVisible_(self, _cmd, columnIndex)
{
    var visible = objj_msgSend(self, "visibleRect"),
        colRect = objj_msgSend(self, "rectOfColumn:", columnIndex);
    visible.origin.x = colRect.origin.x;
    visible.size.width = colRect.size.width;
    objj_msgSend(self, "scrollRectToVisible:", visible);
    objj_msgSend(self._headerView, "scrollRectToVisible:", colRect);
}
,["void","int"]), new objj_method(sel_getUid("setAutosaveName:"), function $CPTableView__setAutosaveName_(self, _cmd, theAutosaveName)
{
    if (self._autosaveName === theAutosaveName)
        return;
    self._autosaveName = theAutosaveName;
    objj_msgSend(self, "setAutosaveTableColumns:", !!theAutosaveName);
    objj_msgSend(self, "_restoreFromAutosave");
}
,["void","CPString"]), new objj_method(sel_getUid("autosaveName"), function $CPTableView__autosaveName(self, _cmd)
{
    return self._autosaveName;
}
,["CPString"]), new objj_method(sel_getUid("setAutosaveTableColumns:"), function $CPTableView__setAutosaveTableColumns_(self, _cmd, shouldAutosave)
{
    self._autosaveTableColumns = shouldAutosave;
}
,["void","BOOL"]), new objj_method(sel_getUid("autosaveTableColumns"), function $CPTableView__autosaveTableColumns(self, _cmd)
{
    return self._autosaveTableColumns;
}
,["BOOL"]), new objj_method(sel_getUid("_columnsKeyForAutosaveName:"), function $CPTableView___columnsKeyForAutosaveName_(self, _cmd, theAutosaveName)
{
    return "CPTableView Columns " + theAutosaveName;
}
,["CPString","CPString"]), new objj_method(sel_getUid("_autosaveEnabled"), function $CPTableView___autosaveEnabled(self, _cmd)
{
    return objj_msgSend(self, "autosaveName") && objj_msgSend(self, "autosaveTableColumns");
}
,["BOOL"]), new objj_method(sel_getUid("_autosave"), function $CPTableView___autosave(self, _cmd)
{
    if (!objj_msgSend(self, "_autosaveEnabled"))
        return;
    var userDefaults = objj_msgSend(CPUserDefaults, "standardUserDefaults"),
        autosaveName = objj_msgSend(self, "autosaveName");
    var columns = objj_msgSend(self, "tableColumns"),
        columnsSetup = [];
    for (var i = 0; i < objj_msgSend(columns, "count"); i++)
    {
        var column = objj_msgSend(columns, "objectAtIndex:", i),
            metaData = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(column, "identifier"), "identifier", objj_msgSend(column, "width"), "width");
        objj_msgSend(columnsSetup, "addObject:", metaData);
    }
    objj_msgSend(userDefaults, "setObject:forKey:", columnsSetup, objj_msgSend(self, "_columnsKeyForAutosaveName:", autosaveName));
}
,["void"]), new objj_method(sel_getUid("_restoreFromAutosave"), function $CPTableView___restoreFromAutosave(self, _cmd)
{
    if (!objj_msgSend(self, "_autosaveEnabled"))
        return;
    var userDefaults = objj_msgSend(CPUserDefaults, "standardUserDefaults"),
        autosaveName = objj_msgSend(self, "autosaveName"),
        tableColumns = objj_msgSend(userDefaults, "objectForKey:", objj_msgSend(self, "_columnsKeyForAutosaveName:", autosaveName));
    if (objj_msgSend(tableColumns, "count") != objj_msgSend(objj_msgSend(self, "tableColumns"), "count"))
        return;
    for (var i = 0; i < objj_msgSend(tableColumns, "count"); i++)
    {
        var metaData = objj_msgSend(tableColumns, "objectAtIndex:", i),
            columnIdentifier = objj_msgSend(metaData, "objectForKey:", "identifier"),
            column = objj_msgSend(self, "columnWithIdentifier:", columnIdentifier),
            tableColumn = objj_msgSend(self, "tableColumnWithIdentifier:", columnIdentifier);
        if (tableColumn && column != CPNotFound)
        {
            objj_msgSend(self, "_moveColumn:toColumn:", column, i);
            objj_msgSend(tableColumn, "setWidth:", objj_msgSend(metaData, "objectForKey:", "width"));
        }
    }
}
,["void"]), new objj_method(sel_getUid("setDelegate:"), function $CPTableView__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (self._delegate)
    {
        if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPTableViewColumnDidMoveNotification, self);
        if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPTableViewColumnDidResizeNotification, self);
        if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPTableViewSelectionDidChangeNotification, self);
        if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPTableViewSelectionIsChangingNotification, self);
    }
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("selectionShouldChangeInTableView:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_selectionShouldChangeInTableView_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:viewForTableColumn:row:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_viewForTableColumn_row_;
    else if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:dataViewForTableColumn:row:")))
    {
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_dataViewForTableColumn_row_;
        CPLog.warn("tableView:dataViewForTableColumn: is deprecated. You should use -tableView:viewForTableColumn: where you can request the view with -makeViewWithIdentifier:owner:");
    }
    objj_msgSend(self, "_updateIsViewBased");
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:didClickTableColumn:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_didClickTableColumn_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:didDragTableColumn:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_didDragTableColumn_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:heightOfRow:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_heightOfRow_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:isGroupRow:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_isGroupRow_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:mouseDownInHeaderOfTableColumn:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_mouseDownInHeaderOfTableColumn_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_nextTypeSelectMatchFromRow_toRow_forString_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:selectionIndexesForProposedSelection:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:shouldEditTableColumn:row:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldEditTableColumn_row_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:shouldSelectRow:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldSelectRow_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:shouldSelectTableColumn:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldSelectTableColumn_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldShowViewExpansionForTableColumn_row_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:shouldTrackView:forTableColumn:row:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldTrackView_forTableColumn_row_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldTypeSelectForEvent_withCurrentSearchString_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_toolTipForView_rect_tableColumn_row_mouseLocation_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:typeSelectStringForTableColumn:row:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_typeSelectStringForTableColumn_row_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:willDisplayView:forTableColumn:row:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_willDisplayView_forTableColumn_row_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:willRemoveView:forTableColumn:row:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_willRemoveView_forTableColumn_row_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:menuForTableColumn:row:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableViewMenuForTableColumn_row_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableView:shouldReorderColumn:toColumn:")))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldReorderColumn_toColumn_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("tableViewColumnDidMove:"), CPTableViewColumnDidMoveNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("tableViewColumnDidResize:"), CPTableViewColumnDidResizeNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("tableViewSelectionDidChange:"), CPTableViewSelectionDidChangeNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("tableViewSelectionIsChanging:"), CPTableViewSelectionIsChangingNotification, self);
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPTableView__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("_didClickTableColumn:modifierFlags:"), function $CPTableView___didClickTableColumn_modifierFlags_(self, _cmd, clickedColumn, modifierFlags)
{
    objj_msgSend(self, "_changeSortDescriptorsForClickOnColumn:", clickedColumn);
    if (self._allowsColumnSelection)
    {
        if (objj_msgSend(self, "_sendDelegateSelectionShouldChangeInTableView") && objj_msgSend(self, "_sendDelegateShouldSelectTableColumn:", clickedColumn))
        {
            objj_msgSend(self, "_noteSelectionIsChanging");
            if (modifierFlags & CPPlatformActionKeyMask)
            {
                if (objj_msgSend(self, "isColumnSelected:", clickedColumn))
                    objj_msgSend(self, "deselectColumn:", clickedColumn);
                else if (objj_msgSend(self, "allowsMultipleSelection") == YES)
                    objj_msgSend(self, "selectColumnIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", clickedColumn), YES);
                return;
            }
            else if (modifierFlags & CPShiftKeyMask)
            {
                var startColumn = MIN(clickedColumn, objj_msgSend(self._selectedColumnIndexes, "lastIndex")),
                    endColumn = MAX(clickedColumn, objj_msgSend(self._selectedColumnIndexes, "firstIndex"));
                objj_msgSend(self, "selectColumnIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(startColumn, endColumn - startColumn + 1)), YES);
                return;
            }
            else
                objj_msgSend(self, "selectColumnIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", clickedColumn), NO);
        }
    }
    objj_msgSend(self, "_sendDelegateDidClickTableColumn:", clickedColumn);
}
,["void","CPInteger","unsigned"]), new objj_method(sel_getUid("_changeSortDescriptorsForClickOnColumn:"), function $CPTableView___changeSortDescriptorsForClickOnColumn_(self, _cmd, column)
{
    var tableColumn = objj_msgSend(self._tableColumns, "objectAtIndex:", column),
        newMainSortDescriptor = objj_msgSend(tableColumn, "sortDescriptorPrototype");
    if (!newMainSortDescriptor)
        return;
    var oldMainSortDescriptor = nil,
        oldSortDescriptors = objj_msgSend(self, "sortDescriptors"),
        newSortDescriptors = objj_msgSend(CPArray, "arrayWithArray:", oldSortDescriptors),
        e = objj_msgSend(newSortDescriptors, "objectEnumerator"),
        descriptor = nil,
        outdatedDescriptors = objj_msgSend(CPArray, "array");
    if (objj_msgSend(self._sortDescriptors, "count") > 0)
        oldMainSortDescriptor = objj_msgSend(objj_msgSend(self, "sortDescriptors"), "objectAtIndex:", 0);
    while ((descriptor = objj_msgSend(e, "nextObject")) !== nil)
    {
        if (objj_msgSend(objj_msgSend(descriptor, "key"), "isEqual:", objj_msgSend(newMainSortDescriptor, "key")))
            objj_msgSend(outdatedDescriptors, "addObject:", descriptor);
    }
    if (objj_msgSend(objj_msgSend(newMainSortDescriptor, "key"), "isEqual:", objj_msgSend(oldMainSortDescriptor, "key")))
        newMainSortDescriptor = objj_msgSend(oldMainSortDescriptor, "reversedSortDescriptor");
    objj_msgSend(newSortDescriptors, "removeObjectsInArray:", outdatedDescriptors);
    objj_msgSend(newSortDescriptors, "insertObject:atIndex:", newMainSortDescriptor, 0);
    objj_msgSend(self, "setHighlightedTableColumn:", tableColumn);
    objj_msgSend(self, "setSortDescriptors:", newSortDescriptors);
}
,["void","CPInteger"]), new objj_method(sel_getUid("setIndicatorImage:inTableColumn:"), function $CPTableView__setIndicatorImage_inTableColumn_(self, _cmd, anImage, aTableColumn)
{
    if (aTableColumn)
    {
        var headerView = objj_msgSend(aTableColumn, "headerView");
        if (objj_msgSend(headerView, "respondsToSelector:", sel_getUid("_setIndicatorImage:")))
            objj_msgSend(headerView, "_setIndicatorImage:", anImage);
    }
}
,["void","CPImage","CPTableColumn"]), new objj_method(sel_getUid("_tableHeaderSortImage"), function $CPTableView___tableHeaderSortImage(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "sort-image");
}
,["CPImage"]), new objj_method(sel_getUid("_tableHeaderReverseSortImage"), function $CPTableView___tableHeaderReverseSortImage(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "sort-image-reversed");
}
,["CPImage"]), new objj_method(sel_getUid("highlightedTableColumn"), function $CPTableView__highlightedTableColumn(self, _cmd)
{
    return self._currentHighlightedTableColumn;
}
,["CPTableColumn"]), new objj_method(sel_getUid("setHighlightedTableColumn:"), function $CPTableView__setHighlightedTableColumn_(self, _cmd, aTableColumn)
{
    if (self._currentHighlightedTableColumn == aTableColumn)
        return;
    if (self._headerView)
    {
        if (self._currentHighlightedTableColumn != nil)
            objj_msgSend(objj_msgSend(self._currentHighlightedTableColumn, "headerView"), "unsetThemeState:", CPThemeStateSelected);
        if (aTableColumn != nil)
            objj_msgSend(objj_msgSend(aTableColumn, "headerView"), "setThemeState:", CPThemeStateSelected);
    }
    self._currentHighlightedTableColumn = aTableColumn;
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("canDragRowsWithIndexes:atPoint:"), function $CPTableView__canDragRowsWithIndexes_atPoint_(self, _cmd, rowIndexes, mouseDownPoint)
{
    return objj_msgSend(rowIndexes, "count") > 0 && objj_msgSend(self, "numberOfRows") > 0 && objj_msgSend(self, "numberOfColumns") > 0;
}
,["BOOL","CPIndexSet","CGPoint"]), new objj_method(sel_getUid("dragImageForRowsWithIndexes:tableColumns:event:offset:"), function $CPTableView__dragImageForRowsWithIndexes_tableColumns_event_offset_(self, _cmd, dragRows, theTableColumns, dragEvent, dragImageOffset)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "image-generic-file");
}
,["CPImage","CPIndexSet","CPArray","CPEvent","CGPoint"]), new objj_method(sel_getUid("dragViewForRowsWithIndexes:tableColumns:event:offset:"), function $CPTableView__dragViewForRowsWithIndexes_tableColumns_event_offset_(self, _cmd, theDraggedRows, theTableColumns, theDragEvent, dragViewOffset)
{
    var bounds = objj_msgSend(self, "bounds"),
        view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", bounds);
    objj_msgSend(view, "setAlphaValue:", 0.7);
    var columnIndex = objj_msgSend(theTableColumns, "count");
    while (columnIndex--)
    {
        var tableColumn = objj_msgSend(theTableColumns, "objectAtIndex:", columnIndex),
            row = objj_msgSend(theDraggedRows, "firstIndex");
        while (row !== CPNotFound)
        {
            var dataView = objj_msgSend(self, "_newDataViewForRow:tableColumn:", row, tableColumn);
            objj_msgSend(dataView, "setFrame:", objj_msgSend(self, "frameOfDataViewAtColumn:row:", columnIndex, row));
            objj_msgSend(self, "_setObjectValueForTableColumn:row:forView:", tableColumn, row, dataView);
            objj_msgSend(view, "addSubview:", dataView);
            objj_msgSend(self._draggingViews, "addObject:", dataView);
            row = objj_msgSend(theDraggedRows, "indexGreaterThanIndex:", row);
        }
    }
    var dragPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(theDragEvent, "locationInWindow"), nil);
    dragViewOffset.x = CGRectGetWidth(bounds) / 2 - dragPoint.x;
    dragViewOffset.y = CGRectGetHeight(bounds) / 2 - dragPoint.y;
    return view;
}
,["CPView","CPIndexSet","CPArray","CPEvent","CGPoint"]), new objj_method(sel_getUid("_dragViewForColumn:event:offset:"), function $CPTableView___dragViewForColumn_event_offset_(self, _cmd, theColumnIndex, theDragEvent, theDragViewOffset)
{
    var dragView = objj_msgSend(objj_msgSend(_CPColumnDragView, "alloc"), "initWithLineColor:", objj_msgSend(self, "gridColor")),
        tableColumn = objj_msgSend(objj_msgSend(self, "tableColumns"), "objectAtIndex:", theColumnIndex),
        defaultRowHeight = objj_msgSend(self, "valueForThemeAttribute:", "default-row-height"),
        bounds = CGRectMake(0.0, 0.0, objj_msgSend(tableColumn, "width"), CGRectGetHeight(objj_msgSend(self, "exposedRect")) + defaultRowHeight),
        columnRect = objj_msgSend(self, "rectOfColumn:", theColumnIndex),
        headerView = objj_msgSend(tableColumn, "headerView"),
        row = objj_msgSend(self._exposedRows, "firstIndex");
    objj_msgSend(dragView, "setFrame:", bounds);
    while (row !== CPNotFound)
    {
        var dataView = objj_msgSend(self, "_newDataViewForRow:tableColumn:", row, tableColumn),
            dataViewFrame = objj_msgSend(self, "frameOfDataViewAtColumn:row:", theColumnIndex, row);
        dataViewFrame.origin.x = 0.0;
        dataViewFrame.origin.y = CGRectGetMinY(dataViewFrame) - CGRectGetMinY(objj_msgSend(self, "exposedRect")) + defaultRowHeight;
        objj_msgSend(dataView, "setFrame:", dataViewFrame);
        objj_msgSend(self, "_setObjectValueForTableColumn:row:forView:", tableColumn, row, dataView);
        objj_msgSend(dragView, "addSubview:", dataView);
        objj_msgSend(self._draggingViews, "addObject:", dataView);
        row = objj_msgSend(self._exposedRows, "indexGreaterThanIndex:", row);
    }
    var columnHeaderView = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", headerView));
    objj_msgSend(dragView, "addSubview:", columnHeaderView);
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(dragView, "setAlphaValue:", 0.7);
    return dragView;
}
,["CPView","CPInteger","CPEvent","CGPoint"]), new objj_method(sel_getUid("setDraggingSourceOperationMask:forLocal:"), function $CPTableView__setDraggingSourceOperationMask_forLocal_(self, _cmd, mask, isLocal)
{
    self._dragOperationDefaultMask = mask;
}
,["void","CPDragOperation","BOOL"]), new objj_method(sel_getUid("setDropRow:dropOperation:"), function $CPTableView__setDropRow_dropOperation_(self, _cmd, row, operation)
{
    if (row > objj_msgSend(self, "numberOfRows") && operation === CPTableViewDropOn)
    {
        var numberOfRows = objj_msgSend(self, "numberOfRows") + 1,
            reason = "Attempt to set dropRow=" + row + " dropOperation=CPTableViewDropOn when [0 - " + numberOfRows + "] is valid range of rows.";
        objj_msgSend(objj_msgSend(CPException, "exceptionWithName:reason:userInfo:", "Error", reason, nil), "raise");
    }
    self._retargetedDropRow = row;
    self._retargetedDropOperation = operation;
}
,["void","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("setDraggingDestinationFeedbackStyle:"), function $CPTableView__setDraggingDestinationFeedbackStyle_(self, _cmd, aStyle)
{
    self._destinationDragStyle = aStyle;
}
,["void","CPTableViewDraggingDestinationFeedbackStyle"]), new objj_method(sel_getUid("draggingDestinationFeedbackStyle"), function $CPTableView__draggingDestinationFeedbackStyle(self, _cmd)
{
    return self._destinationDragStyle;
}
,["CPTableViewDraggingDestinationFeedbackStyle"]), new objj_method(sel_getUid("setVerticalMotionCanBeginDrag:"), function $CPTableView__setVerticalMotionCanBeginDrag_(self, _cmd, aFlag)
{
    self._verticalMotionCanDrag = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("verticalMotionCanBeginDrag"), function $CPTableView__verticalMotionCanBeginDrag(self, _cmd)
{
    return self._verticalMotionCanDrag;
}
,["BOOL"]), new objj_method(sel_getUid("_tableColumnForSortDescriptor:"), function $CPTableView___tableColumnForSortDescriptor_(self, _cmd, theSortDescriptor)
{
    var tableColumns = objj_msgSend(self, "tableColumns");
    for (var i = 0; i < objj_msgSend(tableColumns, "count"); i++)
    {
        var tableColumn = objj_msgSend(tableColumns, "objectAtIndex:", i),
            sortDescriptorPrototype = objj_msgSend(tableColumn, "sortDescriptorPrototype");
        if (!sortDescriptorPrototype)
            continue;
        if (objj_msgSend(sortDescriptorPrototype, "key") === objj_msgSend(theSortDescriptor, "key") && objj_msgSend(sortDescriptorPrototype, "selector") === objj_msgSend(theSortDescriptor, "selector"))
        {
            return tableColumn;
        }
    }
    return nil;
}
,["CPTableColumn","CPSortDescriptor"]), new objj_method(sel_getUid("setSortDescriptors:"), function $CPTableView__setSortDescriptors_(self, _cmd, sortDescriptors)
{
    var oldSortDescriptors = objj_msgSend(objj_msgSend(self, "sortDescriptors"), "copy"),
        newSortDescriptors = objj_msgSend(CPArray, "array");
    if (sortDescriptors !== nil)
        objj_msgSend(newSortDescriptors, "addObjectsFromArray:", sortDescriptors);
    if (objj_msgSend(newSortDescriptors, "isEqual:", oldSortDescriptors))
        return;
    self._sortDescriptors = newSortDescriptors;
    var oldColumn = nil,
        newColumn = nil;
    if (objj_msgSend(newSortDescriptors, "count") > 0)
    {
        var newMainSortDescriptor = objj_msgSend(newSortDescriptors, "objectAtIndex:", 0);
        newColumn = objj_msgSend(self, "_tableColumnForSortDescriptor:", newMainSortDescriptor);
    }
    if (objj_msgSend(oldSortDescriptors, "count") > 0)
    {
        var oldMainSortDescriptor = objj_msgSend(oldSortDescriptors, "objectAtIndex:", 0);
        oldColumn = objj_msgSend(self, "_tableColumnForSortDescriptor:", oldMainSortDescriptor);
    }
    var image = objj_msgSend(newMainSortDescriptor, "ascending") ? objj_msgSend(self, "_tableHeaderSortImage") : objj_msgSend(self, "_tableHeaderReverseSortImage");
    objj_msgSend(self, "setIndicatorImage:inTableColumn:", nil, oldColumn);
    objj_msgSend(self, "setIndicatorImage:inTableColumn:", image, newColumn);
    objj_msgSend(self, "_sendDataSourceSortDescriptorsDidChange:", oldSortDescriptors);
    var binderClass = objj_msgSend(objj_msgSend(self, "class"), "_binderClassForBinding:", "sortDescriptors");
    objj_msgSend(objj_msgSend(binderClass, "getBinding:forObject:", "sortDescriptors", self), "reverseSetValueFor:", "sortDescriptors");
}
,["void","CPArray"]), new objj_method(sel_getUid("sortDescriptors"), function $CPTableView__sortDescriptors(self, _cmd)
{
    return self._sortDescriptors;
}
,["CPArray"]), new objj_method(sel_getUid("_objectValueForTableColumn:row:"), function $CPTableView___objectValueForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    var tableColumnUID = objj_msgSend(aTableColumn, "UID"),
        tableColumnObjectValues = self._objectValues[tableColumnUID];
    if (!tableColumnObjectValues)
    {
        tableColumnObjectValues = [];
        self._objectValues[tableColumnUID] = tableColumnObjectValues;
    }
    var objectValue = tableColumnObjectValues[aRowIndex];
    if (objectValue === undefined)
    {
        if (objj_msgSend(self, "_dataSourceRespondsToObjectValueForTableColumn"))
        {
            objectValue = objj_msgSend(self, "_sendDataSourceObjectValueForTableColumn:row:", aTableColumn, aRowIndex);
            tableColumnObjectValues[aRowIndex] = objectValue;
        }
        else if (!self._isViewBased && !objj_msgSend(self, "infoForBinding:", "content"))
        {
            CPLog.warn("no content binding established and data source " + objj_msgSend(self._dataSource, "description") + " does not implement tableView:objectValueForTableColumn:row:");
        }
    }
    return objectValue;
}
,["id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("exposedRect"), function $CPTableView__exposedRect(self, _cmd)
{
    if (!self._exposedRect)
    {
        var superview = objj_msgSend(self, "superview");
        if (objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
            self._exposedRect = objj_msgSend(superview, "bounds");
        else
            self._exposedRect = objj_msgSend(self, "bounds");
    }
    return self._exposedRect;
}
,["CGRect"]), new objj_method(sel_getUid("load"), function $CPTableView__load(self, _cmd)
{
    if (self._reloadAllRows)
    {
        objj_msgSend(self, "_unloadDataViewsInRows:columns:", self._exposedRows, self._exposedColumns);
        self._exposedRows = objj_msgSend(CPIndexSet, "indexSet");
        self._exposedColumns = objj_msgSend(CPIndexSet, "indexSet");
        self._reloadAllRows = NO;
    }
    var exposedRect = objj_msgSend(self, "exposedRect"),
        exposedRows = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", objj_msgSend(self, "rowsInRect:", exposedRect)),
        exposedColumns = objj_msgSend(self, "columnIndexesInRect:", exposedRect),
        obscuredRows = objj_msgSend(self._exposedRows, "copy"),
        obscuredColumns = objj_msgSend(self._exposedColumns, "copy");
    objj_msgSend(obscuredRows, "removeIndexes:", exposedRows);
    objj_msgSend(obscuredColumns, "removeIndexes:", exposedColumns);
    var newlyExposedRows = objj_msgSend(exposedRows, "copy"),
        newlyExposedColumns = objj_msgSend(exposedColumns, "copy");
    objj_msgSend(newlyExposedRows, "removeIndexes:", self._exposedRows);
    objj_msgSend(newlyExposedColumns, "removeIndexes:", self._exposedColumns);
    var previouslyExposedRows = objj_msgSend(exposedRows, "copy"),
        previouslyExposedColumns = objj_msgSend(exposedColumns, "copy");
    objj_msgSend(previouslyExposedRows, "removeIndexes:", newlyExposedRows);
    objj_msgSend(previouslyExposedColumns, "removeIndexes:", newlyExposedColumns);
    objj_msgSend(self, "_unloadDataViewsInRows:columns:", previouslyExposedRows, obscuredColumns);
    objj_msgSend(self, "_unloadDataViewsInRows:columns:", obscuredRows, previouslyExposedColumns);
    objj_msgSend(self, "_unloadDataViewsInRows:columns:", obscuredRows, obscuredColumns);
    objj_msgSend(self, "_unloadDataViewsInRows:columns:", newlyExposedRows, newlyExposedColumns);
    objj_msgSend(self, "_loadDataViewsInRows:columns:", previouslyExposedRows, newlyExposedColumns);
    objj_msgSend(self, "_loadDataViewsInRows:columns:", newlyExposedRows, previouslyExposedColumns);
    objj_msgSend(self, "_loadDataViewsInRows:columns:", newlyExposedRows, newlyExposedColumns);
    self._exposedRows = exposedRows;
    self._exposedColumns = exposedColumns;
    objj_msgSend(self._tableDrawView, "setFrame:", exposedRect);
    objj_msgSend(self, "setNeedsDisplay:", YES);
    if (objj_msgSend(self._differedColumnDataToRemove, "count"))
    {
        for (var i = 0; i < self._differedColumnDataToRemove.length; i++)
        {
            var data = self._differedColumnDataToRemove[i],
                column = data.column,
                tableColumnUID = objj_msgSend(column, "UID"),
                dataViews = self._dataViewsForTableColumns[tableColumnUID];
            for (var j = 0; j < objj_msgSend(dataViews, "count"); j++)
            {
                objj_msgSend(self, "_enqueueReusableDataView:", objj_msgSend(dataViews, "objectAtIndex:", j));
            }
        }
        objj_msgSend(self._differedColumnDataToRemove, "removeAllObjects");
    }
    for (var identifier in self._cachedDataViews)
    {
        var dataViews = self._cachedDataViews[identifier],
            count = dataViews.length;
        while (count--)
            objj_msgSend(dataViews[count], "removeFromSuperview");
    }
}
,["void"]), new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"), function $CPTableView___unloadDataViewsInRows_columns_(self, _cmd, rows, columns)
{
    if (!objj_msgSend(rows, "count") || !objj_msgSend(columns, "count"))
        return;
    var rowArray = [],
        columnArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    objj_msgSend(columns, "getIndexes:maxCount:inIndexRange:", columnArray, -1, nil);
    var columnIndex = 0,
        columnsCount = columnArray.length;
    for (; columnIndex < columnsCount; ++columnIndex)
    {
        var column = columnArray[columnIndex],
            tableColumn = self._tableColumns[column],
            tableColumnUID = objj_msgSend(tableColumn, "UID"),
            rowIndex = 0,
            rowsCount = rowArray.length;
        for (; rowIndex < rowsCount; ++rowIndex)
        {
            var row = rowArray[rowIndex],
                dataViews = self._dataViewsForTableColumns[tableColumnUID];
            if (!dataViews || row >= dataViews.length)
                continue;
            if (row === self._editingRow && column === self._editingColumn)
                objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
            var dataView = objj_msgSend(dataViews, "objectAtIndex:", row);
            objj_msgSend(self, "_sendDelegateWillRemoveView:forTableColumn:row:", dataView, tableColumn, row);
            objj_msgSend(dataViews, "replaceObjectAtIndex:withObject:", row, nil);
            objj_msgSend(self, "_enqueueReusableDataView:", dataView);
        }
    }
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_loadDataViewsInRows:columns:"), function $CPTableView___loadDataViewsInRows_columns_(self, _cmd, rows, columns)
{
    if (!objj_msgSend(rows, "count") || !objj_msgSend(columns, "count"))
        return;
    var rowArray = [],
        rowRects = [],
        columnArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    objj_msgSend(columns, "getIndexes:maxCount:inIndexRange:", columnArray, -1, nil);
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    var columnIndex = 0,
        columnsCount = columnArray.length;
    for (; columnIndex < columnsCount; ++columnIndex)
    {
        var column = columnArray[columnIndex],
            tableColumn = self._tableColumns[column];
        if (objj_msgSend(tableColumn, "isHidden") || tableColumn === self._draggedColumn)
            continue;
        var tableColumnUID = objj_msgSend(tableColumn, "UID");
        if (!self._dataViewsForTableColumns[tableColumnUID])
            self._dataViewsForTableColumns[tableColumnUID] = [];
        var rowIndex = 0,
            rowsCount = rowArray.length,
            isColumnSelected = objj_msgSend(self._selectedColumnIndexes, "containsIndex:", column);
        for (; rowIndex < rowsCount; ++rowIndex)
        {
            var row = rowArray[rowIndex],
                dataView = objj_msgSend(self, "_newDataViewForRow:tableColumn:", row, tableColumn),
                isButton = objj_msgSend(dataView, "isKindOfClass:", objj_msgSend(CPButton, "class")),
                isTextField = objj_msgSend(dataView, "isKindOfClass:", objj_msgSend(CPTextField, "class"));
            objj_msgSend(dataView, "setFrame:", objj_msgSend(self, "frameOfDataViewAtColumn:row:", column, row));
            objj_msgSend(self, "_setObjectValueForTableColumn:row:forView:", tableColumn, row, dataView);
            if (self._selectionHighlightStyle !== CPTableViewSelectionHighlightStyleNone && (isColumnSelected || objj_msgSend(self, "isRowSelected:", row)))
            {
                objj_msgSend(dataView, "setThemeState:", CPThemeStateSelectedDataView);
            }
            else
                objj_msgSend(dataView, "unsetThemeState:", CPThemeStateSelectedDataView);
            if (objj_msgSend(self, "_sendDelegateIsGroupRow:", row))
            {
                objj_msgSend(self._groupRows, "addIndex:", row);
                objj_msgSend(dataView, "setThemeState:", CPThemeStateGroupRow);
            }
            else
            {
                objj_msgSend(self._groupRows, "removeIndexesInRange:", CPMakeRange(row, 1));
                objj_msgSend(dataView, "unsetThemeState:", CPThemeStateGroupRow);
            }
            objj_msgSend(self, "_sendDelegateWillDisplayView:forTableColumn:row:", dataView, tableColumn, row);
            objj_msgSend(self, "setNeedsDisplay:", YES);
            if (objj_msgSend(dataView, "superview") !== self)
                objj_msgSend(self, "addSubview:", dataView);
            self._dataViewsForTableColumns[tableColumnUID][row] = dataView;
            if (self._isViewBased)
                continue;
            if (isButton || self._editingCellIndex && self._editingCellIndex.x === column && self._editingCellIndex.y === row)
            {
                if (isTextField)
                {
                    objj_msgSend(dataView, "setEditable:", YES);
                    objj_msgSend(dataView, "setSendsActionOnEndEditing:", YES);
                    objj_msgSend(dataView, "setSelectable:", YES);
                    objj_msgSend(dataView, "selectText:", nil);
                    objj_msgSend(dataView, "setBezeled:", YES);
                    objj_msgSend(dataView, "setDelegate:", self);
                }
                objj_msgSend(dataView, "setTarget:", self);
                objj_msgSend(dataView, "setAction:", sel_getUid("_commitDataViewObjectValue:"));
                dataView.tableViewEditedColumnObj = tableColumn;
                dataView.tableViewEditedRowIndex = row;
            }
            else if (isTextField)
            {
                objj_msgSend(dataView, "setEditable:", NO);
                objj_msgSend(dataView, "setSelectable:", NO);
            }
        }
    }
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_setObjectValueForTableColumn:row:forView:"), function $CPTableView___setObjectValueForTableColumn_row_forView_(self, _cmd, aTableColumn, aRow, aDataView)
{
    if (objj_msgSend(self, "_dataSourceRespondsToObjectValueForTableColumn"))
        objj_msgSend(aDataView, "setObjectValue:", objj_msgSend(self, "_objectValueForTableColumn:row:", aTableColumn, aRow));
    if (self._contentBindingExplicitlySet)
        objj_msgSend(self, "_prepareContentBindedDataView:forRow:", aDataView, aRow);
    else
        objj_msgSend(aTableColumn, "_prepareDataView:forRow:", aDataView, aRow);
}
,["void","CPTableColumn","CPInteger","CPView"]), new objj_method(sel_getUid("_prepareContentBindedDataView:forRow:"), function $CPTableView___prepareContentBindedDataView_forRow_(self, _cmd, dataView, aRow)
{
    var binder = objj_msgSend(CPTableContentBinder, "getBinding:forObject:", "content", self),
        content = objj_msgSend(binder, "content"),
        rowContent = objj_msgSend(content, "objectAtIndex:", aRow);
    objj_msgSend(dataView, "setObjectValue:", rowContent);
}
,["void","CPView","CPInteger"]), new objj_method(sel_getUid("_layoutDataViewsInRows:columns:"), function $CPTableView___layoutDataViewsInRows_columns_(self, _cmd, rows, columns)
{
    var rowArray = [],
        columnArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    objj_msgSend(columns, "getIndexes:maxCount:inIndexRange:", columnArray, -1, nil);
    var columnIndex = 0,
        columnsCount = columnArray.length;
    for (; columnIndex < columnsCount; ++columnIndex)
    {
        var column = columnArray[columnIndex],
            tableColumn = self._tableColumns[column],
            tableColumnUID = objj_msgSend(tableColumn, "UID"),
            dataViewsForTableColumn = self._dataViewsForTableColumns[tableColumnUID],
            rowIndex = 0,
            rowsCount = rowArray.length;
        if (dataViewsForTableColumn)
        {
            for (; rowIndex < rowsCount; ++rowIndex)
            {
                var row = rowArray[rowIndex],
                    dataView = dataViewsForTableColumn[row];
                objj_msgSend(dataView, "setFrame:", objj_msgSend(self, "frameOfDataViewAtColumn:row:", column, row));
            }
        }
    }
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_commitDataViewObjectValue:"), function $CPTableView___commitDataViewObjectValue_(self, _cmd, sender)
{
    if (objj_msgSend(sender, "respondsToSelector:", sel_getUid("sendsActionOnEndEditing")) && objj_msgSend(sender, "sendsActionOnEndEditing") && self._editingCellIndex === nil)
        return;
    self._editingCellIndex = nil;
    objj_msgSend(self, "_sendDataSourceSetObjectValue:forTableColumn:row:", objj_msgSend(sender, "objectValue"), sender.tableViewEditedColumnObj, sender.tableViewEditedRowIndex);
    objj_msgSend(sender.tableViewEditedColumnObj, "_reverseSetDataView:forRow:", sender, sender.tableViewEditedRowIndex);
    if (objj_msgSend(sender, "respondsToSelector:", sel_getUid("setEditable:")))
        objj_msgSend(sender, "setEditable:", NO);
    if (objj_msgSend(sender, "respondsToSelector:", sel_getUid("setSelectable:")))
        objj_msgSend(sender, "setSelectable:", NO);
    if (objj_msgSend(sender, "isKindOfClass:", objj_msgSend(CPTextField, "class")))
        objj_msgSend(sender, "setBezeled:", NO);
    objj_msgSend(self, "reloadDataForRowIndexes:columnIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", sender.tableViewEditedRowIndex), objj_msgSend(CPIndexSet, "indexSetWithIndex:", objj_msgSend(self._tableColumns, "indexOfObject:", sender.tableViewEditedColumnObj)));
    objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
}
,["void","id"]), new objj_method(sel_getUid("controlTextDidBlur:"), function $CPTableView__controlTextDidBlur_(self, _cmd, theNotification)
{
    var dataView = objj_msgSend(theNotification, "object");
    if (objj_msgSend(dataView, "respondsToSelector:", sel_getUid("setEditable:")))
        objj_msgSend(dataView, "setEditable:", NO);
    if (objj_msgSend(dataView, "respondsToSelector:", sel_getUid("setSelectable:")))
        objj_msgSend(dataView, "setSelectable:", NO);
    if (objj_msgSend(dataView, "isKindOfClass:", objj_msgSend(CPTextField, "class")))
        objj_msgSend(dataView, "setBezeled:", NO);
    self._editingCellIndex = nil;
}
,["void","CPNotification"]), new objj_method(sel_getUid("_newDataViewForRow:tableColumn:"), function $CPTableView___newDataViewForRow_tableColumn_(self, _cmd, aRow, aTableColumn)
{
    var view = nil;
    if (self._viewForTableColumnRowSelector)
        view = objj_msgSend(self, self._viewForTableColumnRowSelector, aTableColumn, aRow);
    if (!view)
    {
        var columnIdentifier = objj_msgSend(aTableColumn, "identifier");
        if (!columnIdentifier)
            columnIdentifier = objj_msgSend(aTableColumn, "UID");
        view = objj_msgSend(self, "makeViewWithIdentifier:owner:", columnIdentifier, self._delegate);
        if (!view)
            view = objj_msgSend(aTableColumn, "_newDataView");
        objj_msgSend(view, "setIdentifier:", columnIdentifier);
    }
    return view;
}
,["CPView","CPInteger","CPTableColumn"]), new objj_method(sel_getUid("makeViewWithIdentifier:owner:"), function $CPTableView__makeViewWithIdentifier_owner_(self, _cmd, anIdentifier, anOwner)
{
    if (!anIdentifier)
        return nil;
    var view,
        reusableViews = self._cachedDataViews[anIdentifier];
    if (reusableViews && reusableViews.length)
        view = reusableViews.pop();
    else if (self._isViewBased)
        view = objj_msgSend(self, "_unarchiveViewWithIdentifier:owner:", anIdentifier, anOwner);
    return view;
}
,["id","CPString","id"]), new objj_method(sel_getUid("_unarchiveViewWithIdentifier:owner:"), function $CPTableView___unarchiveViewWithIdentifier_owner_(self, _cmd, anIdentifier, anOwner)
{
    var cib = objj_msgSend(self._archivedDataViews, "objectForKey:", anIdentifier);
    if (!cib && !self._unavailable_custom_cibs[anIdentifier])
    {
        var bundle = anOwner ? objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(anOwner, "class")) : objj_msgSend(CPBundle, "mainBundle");
        cib = objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithCibNamed:bundle:", anIdentifier, bundle);
    }
    if (!cib)
    {
        self._unavailable_custom_cibs[anIdentifier] = YES;
        return nil;
    }
    var objects = [],
        load = objj_msgSend(cib, "instantiateCibWithOwner:topLevelObjects:", anOwner, objects);
    if (!load)
        return nil;
    var count = objects.length;
    while (count--)
    {
        var obj = objects[count];
        if (objj_msgSend(obj, "isKindOfClass:", objj_msgSend(CPView, "class")))
        {
            objj_msgSend(obj, "setIdentifier:", anIdentifier);
            objj_msgSend(obj, "setAutoresizingMask:", CPViewNotSizable);
            return obj;
        }
    }
    return nil;
}
,["CPView","CPString","id"]), new objj_method(sel_getUid("_updateIsViewBased"), function $CPTableView___updateIsViewBased(self, _cmd)
{
    if (objj_msgSend(self, "_delegateRespondsToViewForTableColumn"))
        self._viewForTableColumnRowSelector = sel_getUid("_sendDelegateViewForTableColumn:row:");
    else if (objj_msgSend(self, "_delegateRespondsToDataViewForTableColumn"))
        self._viewForTableColumnRowSelector = sel_getUid("_sendDelegateDataViewForTableColumn:row:");
    self._isViewBased = self._viewForTableColumnRowSelector !== nil || self._archivedDataViews !== nil;
}
,["void"]), new objj_method(sel_getUid("_enqueueReusableDataView:"), function $CPTableView___enqueueReusableDataView_(self, _cmd, aDataView)
{
    if (!aDataView)
        return;
    var identifier = objj_msgSend(aDataView, "identifier");
    if (!self._cachedDataViews[identifier])
        self._cachedDataViews[identifier] = [aDataView];
    else
        self._cachedDataViews[identifier].push(aDataView);
}
,["void","CPView"]), new objj_method(sel_getUid("setFrameSize:"), function $CPTableView__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "setFrameSize:", aSize);
    if (self._headerView)
        objj_msgSend(self._headerView, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), CGRectGetHeight(objj_msgSend(self._headerView, "frame"))));
    self._exposedRect = nil;
}
,["void","CGSize"]), new objj_method(sel_getUid("setFrameOrigin:"), function $CPTableView__setFrameOrigin_(self, _cmd, aPoint)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "setFrameOrigin:", aPoint);
    self._exposedRect = nil;
}
,["void","CGPoint"]), new objj_method(sel_getUid("setBoundsOrigin:"), function $CPTableView__setBoundsOrigin_(self, _cmd, aPoint)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "setBoundsOrigin:", aPoint);
    self._exposedRect = nil;
}
,["void","CGPoint"]), new objj_method(sel_getUid("setBoundsSize:"), function $CPTableView__setBoundsSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "setBoundsSize:", aSize);
    self._exposedRect = nil;
}
,["void","CGSize"]), new objj_method(sel_getUid("setNeedsDisplay:"), function $CPTableView__setNeedsDisplay_(self, _cmd, aFlag)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "setNeedsDisplay:", aFlag);
    objj_msgSend(self._tableDrawView, "setNeedsDisplay:", aFlag);
    objj_msgSend(objj_msgSend(self, "headerView"), "setNeedsDisplay:", YES);
}
,["void","BOOL"]), new objj_method(sel_getUid("setNeedsLayout"), function $CPTableView__setNeedsLayout(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "setNeedsLayout");
    objj_msgSend(objj_msgSend(self, "headerView"), "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("_isFocused"), function $CPTableView___isFocused(self, _cmd)
{
    var isEditing = self._editingRow !== CPNotFound || self._editingCellIndex;
    return objj_msgSend(objj_msgSend(self, "window"), "isKeyWindow") && (objj_msgSend(objj_msgSend(self, "window"), "firstResponder") === self || isEditing);
}
,["BOOL"]), new objj_method(sel_getUid("_drawRect:"), function $CPTableView___drawRect_(self, _cmd, aRect)
{
    var exposedRect = objj_msgSend(self, "exposedRect");
    objj_msgSend(self, "drawBackgroundInClipRect:", exposedRect);
    objj_msgSend(self, "highlightSelectionInClipRect:", exposedRect);
    objj_msgSend(self, "drawGridInClipRect:", exposedRect);
    if (self._implementsCustomDrawRow)
        objj_msgSend(self, "_drawRows:clipRect:", self._exposedRows, exposedRect);
}
,["void","CGRect"]), new objj_method(sel_getUid("drawBackgroundInClipRect:"), function $CPTableView__drawBackgroundInClipRect_(self, _cmd, aRect)
{
    if (!self._usesAlternatingRowBackgroundColors)
        return;
    var rowColors = objj_msgSend(self, "alternatingRowBackgroundColors"),
        colorCount = objj_msgSend(rowColors, "count");
    if (colorCount === 0)
        return;
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    if (colorCount === 1)
    {
        CGContextSetFillColor(context, rowColors[0]);
        CGContextFillRect(context, aRect);
        return;
    }
    var exposedRows = objj_msgSend(self, "_exposedRowsInRect:", aRect),
        firstRow = FLOOR(exposedRows.location / colorCount) * colorCount,
        lastRow = CPMaxRange(exposedRows) - 1,
        colorIndex = 0,
        groupRowRects = [];
    while (colorIndex < colorCount)
    {
        CGContextBeginPath(context);
        for (var row = firstRow + colorIndex; row <= lastRow; row += colorCount)
        {
            if (!objj_msgSend(self._groupRows, "containsIndex:", row))
                CGContextAddRect(context, CGRectIntersection(aRect, objj_msgSend(self, "_rectOfRow:checkRange:", row, NO)));
            else
                groupRowRects.push(CGRectIntersection(aRect, objj_msgSend(self, "_rectOfRow:checkRange:", row, NO)));
        }
        CGContextClosePath(context);
        CGContextSetFillColor(context, rowColors[colorIndex]);
        CGContextFillPath(context);
        colorIndex++;
    }
    objj_msgSend(self, "_drawGroupRowsForRects:", groupRowRects);
}
,["void","CGRect"]), new objj_method(sel_getUid("drawGridInClipRect:"), function $CPTableView__drawGridInClipRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        gridStyleMask = objj_msgSend(self, "gridStyleMask"),
        lineThickness = objj_msgSend(self, "currentValueForThemeAttribute:", "grid-line-thickness");
    if (!(gridStyleMask & (CPTableViewSolidHorizontalGridLineMask | CPTableViewSolidVerticalGridLineMask)))
        return;
    CGContextBeginPath(context);
    if (gridStyleMask & CPTableViewSolidHorizontalGridLineMask)
    {
        var exposedRows = objj_msgSend(self, "_exposedRowsInRect:", aRect),
            row = exposedRows.location,
            lastRow = CPMaxRange(exposedRows) - 1,
            rowY = -lineThickness / 2,
            minX = CGRectGetMinX(aRect),
            maxX = CGRectGetMaxX(aRect);
        for (; row <= lastRow; ++row)
        {
            var rowRect = objj_msgSend(self, "_rectOfRow:checkRange:", row, NO),
                rowY = CGRectGetMaxY(rowRect) - lineThickness / 2;
            CGContextMoveToPoint(context, minX, rowY);
            CGContextAddLineToPoint(context, maxX, rowY);
        }
        if (self._rowHeight > 0.0)
        {
            var rowHeight = self._rowHeight + self._intercellSpacing.height,
                totalHeight = CGRectGetMaxY(aRect) - lineThickness / 2;
            while (rowY < totalHeight)
            {
                rowY += rowHeight;
                CGContextMoveToPoint(context, minX, rowY);
                CGContextAddLineToPoint(context, maxX, rowY);
            }
        }
    }
    if (gridStyleMask & CPTableViewSolidVerticalGridLineMask)
    {
        var exposedColumnIndexes = objj_msgSend(self, "columnIndexesInRect:", aRect),
            columnsArray = [];
        objj_msgSend(exposedColumnIndexes, "getIndexes:maxCount:inIndexRange:", columnsArray, -1, nil);
        var columnArrayIndex = 0,
            columnArrayCount = columnsArray.length,
            minY = CGRectGetMinY(aRect),
            maxY = CGRectGetMaxY(aRect);
        for (; columnArrayIndex < columnArrayCount; ++columnArrayIndex)
        {
            var columnRect = objj_msgSend(self, "rectOfColumn:", columnsArray[columnArrayIndex]),
                columnX = CGRectGetMaxX(columnRect) - lineThickness / 2;
            CGContextMoveToPoint(context, columnX, minY);
            CGContextAddLineToPoint(context, columnX, maxY);
        }
    }
    CGContextClosePath(context);
    CGContextSetStrokeColor(context, objj_msgSend(self, "gridColor"));
    CGContextSetLineWidth(context, lineThickness);
    CGContextStrokePath(context);
}
,["void","CGRect"]), new objj_method(sel_getUid("highlightSelectionInClipRect:"), function $CPTableView__highlightSelectionInClipRect_(self, _cmd, aRect)
{
    if (self._selectionHighlightStyle === CPTableViewSelectionHighlightStyleNone)
        return;
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        indexes = [],
        rectSelector = sel_getUid("rectOfRow:");
    if (objj_msgSend(self._selectedRowIndexes, "count") >= 1)
    {
        var exposedRows = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", objj_msgSend(self, "rowsInRect:", aRect)),
            firstRow = objj_msgSend(exposedRows, "firstIndex"),
            exposedRange = CPMakeRange(firstRow, objj_msgSend(exposedRows, "lastIndex") - firstRow + 1);
        objj_msgSend(self._selectedRowIndexes, "getIndexes:maxCount:inIndexRange:", indexes, -1, exposedRange);
    }
    else if (objj_msgSend(self._selectedColumnIndexes, "count") >= 1)
    {
        rectSelector = sel_getUid("rectOfColumn:");
        var exposedColumns = objj_msgSend(self, "columnIndexesInRect:", aRect),
            firstColumn = objj_msgSend(exposedColumns, "firstIndex"),
            exposedRange = CPMakeRange(firstColumn, objj_msgSend(exposedColumns, "lastIndex") - firstColumn + 1);
        objj_msgSend(self._selectedColumnIndexes, "getIndexes:maxCount:inIndexRange:", indexes, -1, exposedRange);
    }
    var count,
        count2 = count = objj_msgSend(indexes, "count");
    if (!count)
        return;
    var drawGradient = CPFeatureIsCompatible(CPHTMLCanvasFeature) && self._selectionHighlightStyle === CPTableViewSelectionHighlightStyleSourceList && objj_msgSend(self._selectedRowIndexes, "count") >= 1,
        deltaHeight = 0.5 * (self._gridStyleMask & CPTableViewSolidHorizontalGridLineMask),
        focused = objj_msgSend(self, "_isFocused");
    CGContextBeginPath(context);
    if (drawGradient)
    {
        var gradientCache = focused ? objj_msgSend(self, "selectionGradientColors") : objj_msgSend(self, "unfocusedSelectionGradientColors"),
            topLineColor = objj_msgSend(gradientCache, "objectForKey:", CPSourceListTopLineColor),
            bottomLineColor = objj_msgSend(gradientCache, "objectForKey:", CPSourceListBottomLineColor),
            gradientColor = objj_msgSend(gradientCache, "objectForKey:", CPSourceListGradient);
    }
    var normalSelectionHighlightColor = focused ? objj_msgSend(self, "selectionHighlightColor") : objj_msgSend(self, "unfocusedSelectionHighlightColor");
    if (objj_msgSend(self._groupRows, "count"))
    {
        var topGroupLineColor = objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 212.0 / 255.0, 1.0),
            bottomGroupLineColor = objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 185.0 / 255.0, 1.0),
            gradientGroupColor = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), [212.0 / 255.0, 212.0 / 255.0, 212.0 / 255.0, 1.0, 197.0 / 255.0, 197.0 / 255.0, 197.0 / 255.0, 1.0], [0, 1], 2);
    }
    while (count--)
    {
        var currentIndex = indexes[count],
            rowRect = CGRectIntersection(objj_msgSend(self, rectSelector, currentIndex), aRect);
        if (!drawGradient)
            var shouldUseGroupGradient = objj_msgSend(self._groupRows, "containsIndex:", currentIndex);
        if (drawGradient || shouldUseGroupGradient)
        {
            var minX = CGRectGetMinX(rowRect),
                minY = CGRectGetMinY(rowRect),
                maxX = CGRectGetMaxX(rowRect),
                maxY = CGRectGetMaxY(rowRect) - deltaHeight;
            if (!drawGradient)
            {
                objj_msgSend(normalSelectionHighlightColor, "setFill");
                CGContextClosePath(context);
                CGContextFillPath(context);
                CGContextBeginPath(context);
            }
            CGContextAddRect(context, rowRect);
            CGContextDrawLinearGradient(context, shouldUseGroupGradient ? gradientGroupColor : gradientColor, rowRect.origin, CGPointMake(minX, maxY), 0);
            CGContextBeginPath(context);
            CGContextMoveToPoint(context, minX, minY + .5);
            CGContextAddLineToPoint(context, maxX, minY + .5);
            CGContextSetStrokeColor(context, shouldUseGroupGradient ? topGroupLineColor : topLineColor);
            CGContextStrokePath(context);
            CGContextBeginPath(context);
            CGContextMoveToPoint(context, minX, maxY - .5);
            CGContextAddLineToPoint(context, maxX, maxY - .5);
            CGContextSetStrokeColor(context, shouldUseGroupGradient ? bottomGroupLineColor : bottomLineColor);
            CGContextStrokePath(context);
        }
        else
        {
            var radius = objj_msgSend(self, "currentValueForThemeAttribute:", "selection-radius");
            if (radius > 0)
            {
                var minX = CGRectGetMinX(rowRect),
                    maxX = CGRectGetMaxX(rowRect),
                    minY = CGRectGetMinY(rowRect),
                    maxY = CGRectGetMaxY(rowRect);
                CGContextMoveToPoint(context, minX + radius, minY);
                CGContextAddArcToPoint(context, maxX, minY, maxX, minY + radius, radius);
                CGContextAddArcToPoint(context, maxX, maxY, maxX - radius, maxY, radius);
                CGContextAddArcToPoint(context, minX, maxY, minX, maxY - radius, radius);
                CGContextAddArcToPoint(context, minX, minY, minX + radius, minY, radius);
            }
            else
                CGContextAddRect(context, rowRect);
        }
    }
    CGContextClosePath(context);
    if (!drawGradient)
    {
        objj_msgSend(normalSelectionHighlightColor, "setFill");
        CGContextFillPath(context);
    }
    CGContextBeginPath(context);
    var gridStyleMask = objj_msgSend(self, "gridStyleMask");
    for (var i = 0; i < count2; i++)
    {
        var rect = objj_msgSend(self, rectSelector, indexes[i]),
            minX = CGRectGetMinX(rect) - 0.5,
            maxX = CGRectGetMaxX(rect) - 0.5,
            minY = CGRectGetMinY(rect) - 0.5,
            maxY = CGRectGetMaxY(rect) - 0.5;
        if (objj_msgSend(self._selectedRowIndexes, "count") >= 1 && gridStyleMask & CPTableViewSolidVerticalGridLineMask)
        {
            var exposedColumns = objj_msgSend(self, "columnIndexesInRect:", aRect),
                exposedColumnIndexes = [],
                firstExposedColumn = objj_msgSend(exposedColumns, "firstIndex"),
                exposedRange = CPMakeRange(firstExposedColumn, objj_msgSend(exposedColumns, "lastIndex") - firstExposedColumn + 1);
            objj_msgSend(exposedColumns, "getIndexes:maxCount:inIndexRange:", exposedColumnIndexes, -1, exposedRange);
            var exposedColumnCount = objj_msgSend(exposedColumnIndexes, "count");
            for (var c = firstExposedColumn; c < exposedColumnCount; c++)
            {
                var colRect = objj_msgSend(self, "rectOfColumn:", exposedColumnIndexes[c]),
                    colX = CGRectGetMaxX(colRect) + 0.5;
                CGContextMoveToPoint(context, colX, minY);
                CGContextAddLineToPoint(context, colX, maxY);
            }
        }
        if (objj_msgSend(indexes, "containsObject:", indexes[i] + 1))
        {
            CGContextMoveToPoint(context, minX, maxY);
            CGContextAddLineToPoint(context, maxX, maxY);
        }
    }
    CGContextClosePath(context);
    CGContextSetStrokeColor(context, objj_msgSend(self, "currentValueForThemeAttribute:", "highlighted-grid-color"));
    CGContextStrokePath(context);
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawGroupRowsForRects:"), function $CPTableView___drawGroupRowsForRects_(self, _cmd, rects)
{
    if (CPFeatureIsCompatible(CPHTMLCanvasFeature) && self._selectionHighlightStyle === CPTableViewSelectionHighlightStyleSourceList || !rects.length)
        return;
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        i = rects.length;
    CGContextBeginPath(context);
    var gradientCache = objj_msgSend(self, "selectionGradientColors"),
        topLineColor = objj_msgSend(CPColor, "colorWithHexString:", "d3d3d3"),
        bottomLineColor = objj_msgSend(CPColor, "colorWithHexString:", "bebebd"),
        gradientColor = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), [220.0 / 255.0, 220.0 / 255.0, 220.0 / 255.0, 1.0, 199.0 / 255.0, 199.0 / 255.0, 199.0 / 255.0, 1.0], [0, 1], 2),
        drawGradient = YES;
    while (i--)
    {
        var rowRect = rects[i];
        CGContextAddRect(context, rowRect);
        if (drawGradient)
        {
            var minX = CGRectGetMinX(rowRect),
                minY = CGRectGetMinY(rowRect),
                maxX = CGRectGetMaxX(rowRect),
                maxY = CGRectGetMaxY(rowRect);
            CGContextDrawLinearGradient(context, gradientColor, rowRect.origin, CGPointMake(minX, maxY), 0);
            CGContextBeginPath(context);
            CGContextMoveToPoint(context, minX, minY);
            CGContextAddLineToPoint(context, maxX, minY);
            CGContextSetStrokeColor(context, topLineColor);
            CGContextStrokePath(context);
            CGContextBeginPath(context);
            CGContextMoveToPoint(context, minX, maxY);
            CGContextAddLineToPoint(context, maxX, maxY - 1);
            CGContextSetStrokeColor(context, bottomLineColor);
            CGContextStrokePath(context);
        }
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("_drawRows:clipRect:"), function $CPTableView___drawRows_clipRect_(self, _cmd, rowsIndexes, clipRect)
{
    var row = objj_msgSend(rowsIndexes, "firstIndex");
    while (row !== CPNotFound)
    {
        objj_msgSend(self, "drawRow:clipRect:", row, CGRectIntersection(clipRect, objj_msgSend(self, "rectOfRow:", row)));
        row = objj_msgSend(rowsIndexes, "indexGreaterThanIndex:", row);
    }
}
,["void","CPIndexSet","CGRect"]), new objj_method(sel_getUid("drawRow:clipRect:"), function $CPTableView__drawRow_clipRect_(self, _cmd, row, rect)
{
}
,["void","CPInteger","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTableView__layoutSubviews(self, _cmd)
{
    objj_msgSend(self, "load");
}
,["void"]), new objj_method(sel_getUid("viewWillMoveToSuperview:"), function $CPTableView__viewWillMoveToSuperview_(self, _cmd, aView)
{
    var superview = objj_msgSend(self, "superview"),
        defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (superview)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPViewFrameDidChangeNotification, superview);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPViewBoundsDidChangeNotification, superview);
    }
    if (objj_msgSend(aView, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
    {
        objj_msgSend(aView, "setPostsFrameChangedNotifications:", YES);
        objj_msgSend(aView, "setPostsBoundsChangedNotifications:", YES);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("superviewFrameChanged:"), CPViewFrameDidChangeNotification, aView);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("superviewBoundsChanged:"), CPViewBoundsDidChangeNotification, aView);
    }
}
,["void","CPView"]), new objj_method(sel_getUid("superviewBoundsChanged:"), function $CPTableView__superviewBoundsChanged_(self, _cmd, aNotification)
{
    self._exposedRect = nil;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPNotification"]), new objj_method(sel_getUid("superviewFrameChanged:"), function $CPTableView__superviewFrameChanged_(self, _cmd, aNotification)
{
    self._exposedRect = nil;
    objj_msgSend(self, "tile");
}
,["void","CPNotification"]), new objj_method(sel_getUid("tracksMouseOutsideOfFrame"), function $CPTableView__tracksMouseOutsideOfFrame(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPTableView__startTrackingAt_(self, _cmd, aPoint)
{
    objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
    var row = objj_msgSend(self, "rowAtPoint:", aPoint);
    if (row < 0 && self._allowsEmptySelection)
    {
        if (objj_msgSend(self, "_sendDelegateSelectionShouldChangeInTableView"))
        {
            var indexSet = objj_msgSend(self, "_sendDelegateSelectionIndexesForProposedSelection:", objj_msgSend(CPIndexSet, "indexSet"));
            objj_msgSend(self, "_noteSelectionIsChanging");
            objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", indexSet, NO);
        }
    }
    if (objj_msgSend(self, "mouseDownFlags") & CPShiftKeyMask)
        self._selectionAnchorRow = ABS(objj_msgSend(self._selectedRowIndexes, "firstIndex") - row) < ABS(objj_msgSend(self._selectedRowIndexes, "lastIndex") - row) ? objj_msgSend(self._selectedRowIndexes, "firstIndex") : objj_msgSend(self._selectedRowIndexes, "lastIndex");
    else
        self._selectionAnchorRow = row;
    self._startTrackingPoint = aPoint;
    self._startTrackingTimestamp = new Date();
    if (objj_msgSend(self, "_dataSourceRespondsToSetObjectValueForTableColumnRow"))
        self._trackingPointMovedOutOfClickSlop = NO;
    if (row >= 0 && !objj_msgSend(self, "_dataSourceRespondsToWriteRowsWithIndexesToPasteboard"))
        objj_msgSend(self, "_updateSelectionWithMouseAtRow:", row);
    return YES;
}
,["BOOL","CGPoint"]), new objj_method(sel_getUid("menuForEvent:"), function $CPTableView__menuForEvent_(self, _cmd, theEvent)
{
    if (!objj_msgSend(self, "_delegateRespondsToMenuForTableColumnRow"))
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "menuForEvent:", theEvent);
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(theEvent, "locationInWindow"), nil),
        row = objj_msgSend(self, "rowAtPoint:", location),
        column = objj_msgSend(self, "columnAtPoint:", location),
        tableColumn = objj_msgSend(objj_msgSend(self, "tableColumns"), "objectAtIndex:", column);
    return objj_msgSend(self, "_sendDelegateMenuForTableColumn:row:", tableColumn, row);
}
,["CPMenu","CPEvent"]), new objj_method(sel_getUid("trackMouse:"), function $CPTableView__trackMouse_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self._draggedRowIndexes, "count"))
    {
        objj_msgSend(self, "autoscroll:", anEvent);
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "trackMouse:", anEvent);
    }
    else
        objj_msgSend(CPApp, "sendEvent:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("continueTracking:at:"), function $CPTableView__continueTracking_at_(self, _cmd, lastPoint, aPoint)
{
    var row = objj_msgSend(self, "rowAtPoint:", aPoint);
    if (!self._isSelectingSession && objj_msgSend(self, "_dataSourceRespondsToWriteRowsWithIndexesToPasteboard"))
    {
        if (row >= 0 && (ABS(self._startTrackingPoint.x - aPoint.x) > 3 || self._verticalMotionCanDrag && ABS(self._startTrackingPoint.y - aPoint.y) > 3) || objj_msgSend(self._selectedRowIndexes, "containsIndex:", row))
        {
            if (objj_msgSend(self._selectedRowIndexes, "containsIndex:", row))
                self._draggedRowIndexes = objj_msgSend(objj_msgSend(CPIndexSet, "alloc"), "initWithIndexSet:", self._selectedRowIndexes);
            else
                self._draggedRowIndexes = objj_msgSend(CPIndexSet, "indexSetWithIndex:", row);
            var pboard = objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard);
            if (objj_msgSend(self, "canDragRowsWithIndexes:atPoint:", self._draggedRowIndexes, aPoint) && objj_msgSend(self, "_sendDataSourceWriteRowsWithIndexes:toPasteboard:", self._draggedRowIndexes, pboard))
            {
                var currentEvent = objj_msgSend(CPApp, "currentEvent"),
                    offset = CGPointMakeZero(),
                    tableColumns = objj_msgSend(self._tableColumns, "objectsAtIndexes:", self._exposedColumns);
                var view = objj_msgSend(self, "dragViewForRowsWithIndexes:tableColumns:event:offset:", self._draggedRowIndexes, tableColumns, currentEvent, offset);
                if (!view)
                {
                    var image = objj_msgSend(self, "dragImageForRowsWithIndexes:tableColumns:event:offset:", self._draggedRowIndexes, tableColumns, currentEvent, offset);
                    view = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, objj_msgSend(image, "size").width, objj_msgSend(image, "size").height));
                    objj_msgSend(view, "setImage:", image);
                }
                var bounds = objj_msgSend(view, "bounds"),
                    viewLocation = CGPointMake(aPoint.x - CGRectGetWidth(bounds) / 2 + offset.x, aPoint.y - CGRectGetHeight(bounds) / 2 + offset.y);
                objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", view, viewLocation, CGPointMakeZero(), objj_msgSend(CPApp, "currentEvent"), pboard, self, YES);
                self._startTrackingPoint = nil;
                return NO;
            }
            self._draggedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
        }
        else if (ABS(self._startTrackingPoint.x - aPoint.x) < 5 && ABS(self._startTrackingPoint.y - aPoint.y) < 5)
            return YES;
    }
    self._isSelectingSession = YES;
    if (row >= 0 && row !== self._lastTrackedRowIndex)
    {
        self._lastTrackedRowIndex = row;
        objj_msgSend(self, "_updateSelectionWithMouseAtRow:", row);
    }
    if (objj_msgSend(self, "_dataSourceRespondsToSetObjectValueForTableColumnRow") && !self._trackingPointMovedOutOfClickSlop)
    {
        var CLICK_SPACE_DELTA = 5.0;
        if (ABS(aPoint.x - self._startTrackingPoint.x) > CLICK_SPACE_DELTA || ABS(aPoint.y - self._startTrackingPoint.y) > CLICK_SPACE_DELTA)
        {
            self._trackingPointMovedOutOfClickSlop = YES;
        }
    }
    return YES;
}
,["BOOL","CGPoint","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPTableView__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{
    self._isSelectingSession = NO;
    var CLICK_TIME_DELTA = 1000,
        columnIndex = -1,
        column,
        rowIndex,
        shouldEdit = YES;
    if (objj_msgSend(self, "_dataSourceRespondsToWriteRowsWithIndexesToPasteboard"))
    {
        rowIndex = objj_msgSend(self, "rowAtPoint:", aPoint);
        if (rowIndex !== -1)
        {
            if (objj_msgSend(self._draggedRowIndexes, "count") > 0)
            {
                self._draggedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
                return;
            }
            self._previouslySelectedRowIndexes = objj_msgSend(self._selectedRowIndexes, "copy");
            objj_msgSend(self, "_updateSelectionWithMouseAtRow:", rowIndex);
        }
    }
    if (!self._isViewBased && mouseIsUp && !self._trackingPointMovedOutOfClickSlop && objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "clickCount") > 1 && (objj_msgSend(self, "_dataSourceRespondsToSetObjectValueForTableColumnRow") || objj_msgSend(self, "infoForBinding:", "content")))
    {
        columnIndex = objj_msgSend(self, "columnAtPoint:", lastPoint);
        if (columnIndex !== -1)
        {
            column = self._tableColumns[columnIndex];
            if (objj_msgSend(column, "isEditable"))
            {
                rowIndex = objj_msgSend(self, "rowAtPoint:", aPoint);
                if (rowIndex !== -1)
                {
                    if (objj_msgSend(self, "_sendDelegateShouldEditTableColumn:row:", column, rowIndex))
                    {
                        objj_msgSend(self, "editColumn:row:withEvent:select:", columnIndex, rowIndex, nil, YES);
                        return;
                    }
                }
            }
        }
    }
    if (objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "clickCount") === 2 && self._doubleAction)
    {
        self._clickedRow = objj_msgSend(self, "rowAtPoint:", aPoint);
        self._clickedColumn = objj_msgSend(self, "columnAtPoint:", lastPoint);
        objj_msgSend(self, "sendAction:to:", self._doubleAction, self._target);
    }
}
,["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("draggingEntered:"), function $CPTableView__draggingEntered_(self, _cmd, sender)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(sender, "draggingLocation"), nil),
        dropOperation = objj_msgSend(self, "_proposedDropOperationAtPoint:", location),
        row = objj_msgSend(self, "_proposedRowAtPoint:", location);
    if (self._retargetedDropRow !== nil)
        row = self._retargetedDropRow;
    var draggedTypes = objj_msgSend(self, "registeredDraggedTypes"),
        count = objj_msgSend(draggedTypes, "count"),
        i = 0;
    for (; i < count; i++)
    {
        if (objj_msgSend(objj_msgSend(objj_msgSend(sender, "draggingPasteboard"), "types"), "containsObject:", objj_msgSend(draggedTypes, "objectAtIndex:", i)))
            return objj_msgSend(self, "_sendDataSourceValidateDrop:proposedRow:proposedDropOperation:", sender, row, dropOperation);
    }
    return CPDragOperationNone;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("draggingExited:"), function $CPTableView__draggingExited_(self, _cmd, sender)
{
    objj_msgSend(self._dropOperationFeedbackView, "removeFromSuperview");
}
,["void","id"]), new objj_method(sel_getUid("draggingEnded:"), function $CPTableView__draggingEnded_(self, _cmd, sender)
{
    objj_msgSend(self, "_draggingEnded");
}
,["void","id"]), new objj_method(sel_getUid("_draggingEnded"), function $CPTableView___draggingEnded(self, _cmd)
{
    self._retargetedDropOperation = nil;
    self._retargetedDropRow = nil;
    self._draggedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
    objj_msgSend(self._dropOperationFeedbackView, "removeFromSuperview");
    objj_msgSend(self, "_enqueueDraggingViews");
}
,["void"]), new objj_method(sel_getUid("wantsPeriodicDraggingUpdates"), function $CPTableView__wantsPeriodicDraggingUpdates(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_proposedDropOperationAtPoint:"), function $CPTableView___proposedDropOperationAtPoint_(self, _cmd, theDragPoint)
{
    if (self._retargetedDropOperation !== nil)
        return self._retargetedDropOperation;
    var row = objj_msgSend(self, "_proposedRowAtPoint:", theDragPoint),
        rowRect = objj_msgSend(self, "rectOfRow:", row);
    if (objj_msgSend(self, "intercellSpacing").height < 5.0)
        rowRect = CGRectInset(rowRect, 0.0, 5.0 - objj_msgSend(self, "intercellSpacing").height);
    if (CGRectContainsPoint(rowRect, theDragPoint) && row < self._numberOfRows)
        return CPTableViewDropOn;
    return CPTableViewDropAbove;
}
,["CPTableViewDropOperation","CGPoint"]), new objj_method(sel_getUid("_proposedRowAtPoint:"), function $CPTableView___proposedRowAtPoint_(self, _cmd, dragPoint)
{
    var row = objj_msgSend(self, "rowAtPoint:", dragPoint),
        lowerRow = row + 1,
        rect = objj_msgSend(self, "rectOfRow:", row),
        bottomPoint = CGRectGetMaxY(rect),
        bottomThirty = bottomPoint - (bottomPoint - CGRectGetMinY(rect)) * 0.3,
        numberOfRows = objj_msgSend(self, "numberOfRows");
    if (row < 0)
        row = CGRectGetMaxY(rect) < dragPoint.y ? numberOfRows : row;
    else if (dragPoint.y > MAX(bottomThirty, bottomPoint - 6))
        row = lowerRow;
    row = MIN(numberOfRows, row);
    return row;
}
,["CPInteger","CGPoint"]), new objj_method(sel_getUid("_rectForDropHighlightViewOnRow:"), function $CPTableView___rectForDropHighlightViewOnRow_(self, _cmd, theRowIndex)
{
    if (theRowIndex >= objj_msgSend(self, "numberOfRows"))
        theRowIndex = objj_msgSend(self, "numberOfRows") - 1;
    return objj_msgSend(self, "_rectOfRow:checkRange:", theRowIndex, NO);
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:"), function $CPTableView___rectForDropHighlightViewBetweenUpperRow_andLowerRow_offset_(self, _cmd, theUpperRowIndex, theLowerRowIndex, theOffset)
{
    if (theLowerRowIndex > objj_msgSend(self, "numberOfRows"))
        theLowerRowIndex = objj_msgSend(self, "numberOfRows");
    return objj_msgSend(self, "_rectOfRow:checkRange:", theLowerRowIndex, NO);
}
,["CGRect","CPInteger","CPInteger","CGPoint"]), new objj_method(sel_getUid("draggingUpdated:"), function $CPTableView__draggingUpdated_(self, _cmd, sender)
{
    self._retargetedDropRow = nil;
    self._retargetedDropOperation = nil;
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(sender, "draggingLocation"), nil),
        dropOperation = objj_msgSend(self, "_proposedDropOperationAtPoint:", location),
        numberOfRows = objj_msgSend(self, "numberOfRows"),
        row = objj_msgSend(self, "_proposedRowAtPoint:", location),
        dragOperation = objj_msgSend(self, "_sendDataSourceValidateDrop:proposedRow:proposedDropOperation:", sender, row, dropOperation);
    if (self._retargetedDropRow !== nil)
        row = self._retargetedDropRow;
    if (self._retargetedDropOperation !== nil)
        dropOperation = self._retargetedDropOperation;
    if (dropOperation === CPTableViewDropOn && row >= numberOfRows)
        row = numberOfRows - 1;
    var rect = CGRectMakeZero();
    if (row === -1)
        rect = objj_msgSend(self, "exposedRect");
    else if (dropOperation === CPTableViewDropAbove)
        rect = objj_msgSend(self, "_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:", row - 1, row, location);
    else
        rect = objj_msgSend(self, "_rectForDropHighlightViewOnRow:", row);
    objj_msgSend(self._dropOperationFeedbackView, "setDropOperation:", row !== -1 ? dropOperation : CPDragOperationNone);
    objj_msgSend(self._dropOperationFeedbackView, "setHidden:", dragOperation == CPDragOperationNone);
    objj_msgSend(self._dropOperationFeedbackView, "setFrame:", rect);
    objj_msgSend(self._dropOperationFeedbackView, "setCurrentRow:", row);
    objj_msgSend(self, "addSubview:", self._dropOperationFeedbackView);
    return dragOperation;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("prepareForDragOperation:"), function $CPTableView__prepareForDragOperation_(self, _cmd, sender)
{
    objj_msgSend(self._dropOperationFeedbackView, "removeFromSuperview");
    return objj_msgSend(self, "_dataSourceRespondsToValidateDropProposedRowProposedDropOperation");
}
,["BOOL","id"]), new objj_method(sel_getUid("performDragOperation:"), function $CPTableView__performDragOperation_(self, _cmd, sender)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(sender, "draggingLocation"), nil),
        operation = objj_msgSend(self, "_proposedDropOperationAtPoint:", location),
        row = self._retargetedDropRow;
    if (row === nil)
        var row = objj_msgSend(self, "_proposedRowAtPoint:", location);
    return objj_msgSend(self, "_sendDataSourceAcceptDrop:row:dropOperation:", sender, row, operation);
}
,["BOOL","id"]), new objj_method(sel_getUid("concludeDragOperation:"), function $CPTableView__concludeDragOperation_(self, _cmd, sender)
{
    objj_msgSend(self, "reloadData");
}
,["void","id"]), new objj_method(sel_getUid("draggedView:endedAt:operation:"), function $CPTableView__draggedView_endedAt_operation_(self, _cmd, aView, aLocation, anOperation)
{
    objj_msgSend(self, "_draggingEnded");
    objj_msgSend(self, "draggedImage:endedAt:operation:", aView, aLocation, anOperation);
}
,["void","CPImage","CGPoint","CPDragOperation"]), new objj_method(sel_getUid("_enqueueDraggingViews"), function $CPTableView___enqueueDraggingViews(self, _cmd)
{
    objj_msgSend(self._draggingViews, "enumerateObjectsUsingBlock:", function(dataView, idx)
    {
        objj_msgSend(self, "_enqueueReusableDataView:", dataView);
    });
    objj_msgSend(self._draggingViews, "removeAllObjects");
}
,["void"]), new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"), function $CPTableView___updateSelectionWithMouseAtRow_(self, _cmd, aRow)
{
    if (aRow < 0)
        return;
    var newSelection,
        shouldExtendSelection = NO;
    if (objj_msgSend(self, "mouseDownFlags") & (CPCommandKeyMask | CPControlKeyMask | CPAlternateKeyMask))
    {
        if (objj_msgSend(self._selectedRowIndexes, "containsIndex:", aRow))
        {
            newSelection = objj_msgSend(self._selectedRowIndexes, "copy");
            objj_msgSend(newSelection, "removeIndex:", aRow);
        }
        else if (self._allowsMultipleSelection)
        {
            newSelection = objj_msgSend(self._selectedRowIndexes, "copy");
            objj_msgSend(newSelection, "addIndex:", aRow);
        }
        else
            newSelection = objj_msgSend(CPIndexSet, "indexSetWithIndex:", aRow);
    }
    else if (self._allowsMultipleSelection)
    {
        if (self._selectionAnchorRow == CPNotFound)
            self._selectionAnchorRow = objj_msgSend(self, "numberOfRows") - 1;
        newSelection = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(MIN(aRow, self._selectionAnchorRow), ABS(aRow - self._selectionAnchorRow) + 1));
        shouldExtendSelection = objj_msgSend(self, "mouseDownFlags") & CPShiftKeyMask && (self._lastSelectedRow == objj_msgSend(self._selectedRowIndexes, "lastIndex") && aRow > self._lastSelectedRow || self._lastSelectedRow == objj_msgSend(self._selectedRowIndexes, "firstIndex") && aRow < self._lastSelectedRow);
    }
    else if (aRow >= 0 && aRow < self._numberOfRows)
        newSelection = objj_msgSend(CPIndexSet, "indexSetWithIndex:", aRow);
    else
        newSelection = objj_msgSend(CPIndexSet, "indexSet");
    if (objj_msgSend(newSelection, "isEqualToIndexSet:", self._selectedRowIndexes))
        return;
    if (!objj_msgSend(self, "_sendDelegateSelectionShouldChangeInTableView"))
        return;
    newSelection = objj_msgSend(self, "_sendDelegateSelectionIndexesForProposedSelection:", newSelection);
    if (!objj_msgSend(self, "_delegateRespondsToSelectionIndexesForProposedSelection") && objj_msgSend(self, "_delegateRespondsToShouldSelectRow"))
    {
        var indexArray = [];
        objj_msgSend(newSelection, "getIndexes:maxCount:inIndexRange:", indexArray, -1, nil);
        var indexCount = indexArray.length;
        while (indexCount--)
        {
            var index = indexArray[indexCount];
            if (!objj_msgSend(self, "_sendDelegateShouldSelectRow:", index))
                objj_msgSend(newSelection, "removeIndex:", index);
        }
        if (objj_msgSend(newSelection, "count") === 0)
            return;
    }
    if (!self._allowsEmptySelection && objj_msgSend(newSelection, "count") === 0)
        return;
    if (objj_msgSend(newSelection, "isEqualToIndexSet:", self._selectedRowIndexes))
        return;
    objj_msgSend(self, "_noteSelectionIsChanging");
    objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", newSelection, shouldExtendSelection);
    self._lastSelectedRow = objj_msgSend(newSelection, "containsIndex:", aRow) ? aRow : objj_msgSend(newSelection, "lastIndex");
}
,["void","CPInteger"]), new objj_method(sel_getUid("_noteSelectionIsChanging"), function $CPTableView___noteSelectionIsChanging(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewSelectionIsChangingNotification, self, nil);
}
,["void"]), new objj_method(sel_getUid("_noteSelectionDidChange"), function $CPTableView___noteSelectionDidChange(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewSelectionDidChangeNotification, self, nil);
}
,["void"]), new objj_method(sel_getUid("becomeKeyWindow"), function $CPTableView__becomeKeyWindow(self, _cmd)
{
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("resignKeyWindow"), function $CPTableView__resignKeyWindow(self, _cmd)
{
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPTableView__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("needsPanelToBecomeKey"), function $CPTableView__needsPanelToBecomeKey(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("hitTest:"), function $CPTableView__hitTest_(self, _cmd, aPoint)
{
    var hit = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "hitTest:", aPoint);
    if (objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "type") == CPLeftMouseDown && objj_msgSend(hit, "acceptsFirstResponder") && !objj_msgSend(self, "isRowSelected:", objj_msgSend(self, "rowForView:", hit)))
        return self;
    return hit;
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("_startObservingFirstResponder"), function $CPTableView___startObservingFirstResponder(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_firstResponderDidChange:"), _CPWindowDidChangeFirstResponderNotification, objj_msgSend(self, "window"));
}
,["void"]), new objj_method(sel_getUid("_stopObservingFirstResponder"), function $CPTableView___stopObservingFirstResponder(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, _CPWindowDidChangeFirstResponderNotification, objj_msgSend(self, "window"));
}
,["void"]), new objj_method(sel_getUid("_firstResponderDidChange:"), function $CPTableView___firstResponderDidChange_(self, _cmd, aNotification)
{
    var responder = objj_msgSend(objj_msgSend(self, "window"), "firstResponder");
    if (!objj_msgSend(responder, "isKindOfClass:", objj_msgSend(CPView, "class")) || !objj_msgSend(responder, "isDescendantOf:", self))
    {
        self._editingRow = CPNotFound;
        self._editingColumn = CPNotFound;
        objj_msgSend(self, "_notifyViewDidResignFirstResponder");
        return;
    }
    self._editingRow = objj_msgSend(self, "rowForView:", responder);
    self._editingColumn = objj_msgSend(self, "columnForView:", responder);
    objj_msgSend(self, "_notifyViewDidBecomeFirstResponder");
    if (self._editingRow !== CPNotFound && objj_msgSend(responder, "isKindOfClass:", objj_msgSend(CPTextField, "class")) && !objj_msgSend(responder, "isBezeled"))
    {
        objj_msgSend(responder, "setBezeled:", YES);
        objj_msgSend(self, "_registerForEndEditingNote:", responder);
    }
}
,["void","CPNotification"]), new objj_method(sel_getUid("_registerForEndEditingNote:"), function $CPTableView___registerForEndEditingNote_(self, _cmd, aTextField)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_textFieldEditingDidEnd:"), CPControlTextDidEndEditingNotification, aTextField);
}
,["void","CPView"]), new objj_method(sel_getUid("_unregisterForEndEditingNote:"), function $CPTableView___unregisterForEndEditingNote_(self, _cmd, aTextField)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPControlTextDidEndEditingNotification, aTextField);
}
,["void","CPView"]), new objj_method(sel_getUid("_textFieldEditingDidEnd:"), function $CPTableView___textFieldEditingDidEnd_(self, _cmd, aNote)
{
    var textField = objj_msgSend(aNote, "object");
    objj_msgSend(self, "_unregisterForEndEditingNote:", textField);
    objj_msgSend(textField, "setBezeled:", NO);
    var action = objj_msgSend(self, "_disableActionIfExists:", textField);
    objj_msgSend(textField, "resignFirstResponder");
    objj_msgSend(textField, "setAction:", action);
}
,["void","CPNotification"]), new objj_method(sel_getUid("_disableActionIfExists:"), function $CPTableView___disableActionIfExists_(self, _cmd, aView)
{
    var action = nil;
    if (objj_msgSend(aView, "respondsToSelector:", sel_getUid("action")) && (action = objj_msgSend(aView, "action")))
        objj_msgSend(aView, "setAction:", nil);
    return action;
}
,["SEL","CPView"]), new objj_method(sel_getUid("keyDown:"), function $CPTableView__keyDown_(self, _cmd, anEvent)
{
    var character = objj_msgSend(anEvent, "charactersIgnoringModifiers"),
        modifierFlags = objj_msgSend(anEvent, "modifierFlags");
    if (character === CPUpArrowFunctionKey || character === CPDownArrowFunctionKey)
    {
        if (objj_msgSend(self, "numberOfRows") !== 0)
        {
            objj_msgSend(self, "_moveSelectionWithEvent:upward:", anEvent, character === CPUpArrowFunctionKey);
            return;
        }
    }
    else if (character === CPDeleteCharacter || character === CPDeleteFunctionKey)
    {
        if (objj_msgSend(self, "_sendDelegateDeleteKeyPressed"))
            return;
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "keyDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_selectionIsBroken"), function $CPTableView___selectionIsBroken(self, _cmd)
{
    return objj_msgSend(self, "selectedRowIndexes")._ranges.length !== 1;
}
,["BOOL"]), new objj_method(sel_getUid("_moveSelectionWithEvent:upward:"), function $CPTableView___moveSelectionWithEvent_upward_(self, _cmd, theEvent, shouldGoUpward)
{
    if (!objj_msgSend(self, "_sendDelegateSelectionShouldChangeInTableView"))
        return;
    var selectedIndexes = objj_msgSend(self, "selectedRowIndexes");
    if (objj_msgSend(selectedIndexes, "count") > 0)
    {
        var extend = objj_msgSend(theEvent, "modifierFlags") & CPShiftKeyMask && self._allowsMultipleSelection,
            i = objj_msgSend(self, "selectedRow");
        if (objj_msgSend(self, "_selectionIsBroken"))
        {
            while (objj_msgSend(selectedIndexes, "containsIndex:", i))
            {
                shouldGoUpward ? i-- : i++;
            }
            self._wasSelectionBroken = true;
        }
        else if (self._wasSelectionBroken && (shouldGoUpward && i !== objj_msgSend(selectedIndexes, "firstIndex") || !shouldGoUpward && i !== objj_msgSend(selectedIndexes, "lastIndex")))
        {
            shouldGoUpward ? i = objj_msgSend(selectedIndexes, "firstIndex") - 1 : i = objj_msgSend(selectedIndexes, "lastIndex");
            self._wasSelectionBroken = false;
        }
        else
        {
            shouldGoUpward ? i-- : i++;
        }
    }
    else
    {
        var extend = NO;
        if (objj_msgSend(self, "numberOfRows") > 0)
            var i = shouldGoUpward ? objj_msgSend(self, "numberOfRows") - 1 : 0;
    }
    if (i >= objj_msgSend(self, "numberOfRows") || i < 0)
        return;
    if (objj_msgSend(self, "_delegateRespondsToSelectionIndexesForProposedSelection") || objj_msgSend(self, "_delegateRespondsToShouldSelectRow"))
    {
        var shouldSelect = !!objj_msgSend(objj_msgSend(self, "_cleanUpSelectionRowIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", i)), "count");
        while (!shouldSelect && (i < objj_msgSend(self, "numberOfRows") && i > 0))
        {
            shouldGoUpward ? --i : ++i;
            shouldSelect = !!objj_msgSend(objj_msgSend(self, "_cleanUpSelectionRowIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", i)), "count");
        }
        if (!shouldSelect)
            return;
    }
    if (extend && objj_msgSend(selectedIndexes, "containsIndex:", i))
    {
        var differedLastSelectedRow = i;
        shouldGoUpward ? i++ : i--;
        objj_msgSend(selectedIndexes, "removeIndex:", i);
        extend = NO;
    }
    else if (extend)
    {
        if (objj_msgSend(selectedIndexes, "containsIndex:", i))
        {
            i = shouldGoUpward ? objj_msgSend(selectedIndexes, "firstIndex") - 1 : objj_msgSend(selectedIndexes, "lastIndex") + 1;
            i = MIN(MAX(i, 0), objj_msgSend(self, "numberOfRows") - 1);
        }
        objj_msgSend(selectedIndexes, "addIndex:", i);
        var differedLastSelectedRow = i;
    }
    else
    {
        selectedIndexes = objj_msgSend(CPIndexSet, "indexSetWithIndex:", i);
        var differedLastSelectedRow = i;
    }
    selectedIndexes = objj_msgSend(self, "_sendDelegateSelectionIndexesForProposedSelection:", selectedIndexes);
    objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", selectedIndexes, extend);
    self._lastSelectedRow = differedLastSelectedRow;
    if (i !== CPNotFound)
        objj_msgSend(self, "scrollRowToVisible:", i);
}
,["void","CPEvent","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPTableView__defaultThemeClass(self, _cmd)
{
    return "tableview";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPTableView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "alternating-row-colors", objj_msgSend(CPNull, "null"), "grid-color", 1.0, "grid-line-thickness", objj_msgSend(CPNull, "null"), "highlighted-grid-color", objj_msgSend(CPNull, "null"), "selection-color", objj_msgSend(CPNull, "null"), "sourcelist-selection-color", objj_msgSend(CPNull, "null"), "sort-image", objj_msgSend(CPNull, "null"), "sort-image-reversed", objj_msgSend(CPNull, "null"), "selection-radius", objj_msgSend(CPNull, "null"), "image-generic-file", 25.0, "default-row-height", objj_msgSend(CPNull, "null"), "dropview-on-background-color", objj_msgSend(CPNull, "null"), "dropview-on-border-color", objj_msgSend(CPNull, "null"), "dropview-on-border-width", objj_msgSend(CPNull, "null"), "dropview-on-border-radius", objj_msgSend(CPNull, "null"), "dropview-on-selected-background-color", objj_msgSend(CPNull, "null"), "dropview-on-selected-border-color", objj_msgSend(CPNull, "null"), "dropview-on-selected-border-width", objj_msgSend(CPNull, "null"), "dropview-on-selected-border-radius", objj_msgSend(CPNull, "null"), "dropview-above-border-color", objj_msgSend(CPNull, "null"), "dropview-above-border-width", objj_msgSend(CPNull, "null"), "dropview-above-selected-border-color", objj_msgSend(CPNull, "null"), "dropview-above-selected-border-width");
}
,["CPDictionary"])]);
}{
var the_class = objj_getClass("CPTableView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_dataSourceRespondsToObjectValueForTableColumn"), function $CPTableView___dataSourceRespondsToObjectValueForTableColumn(self, _cmd)
{
    return self._implementedDataSourceMethods & CPTableViewDataSource_tableView_objectValueForTableColumn_row_;
}
,["BOOL"]), new objj_method(sel_getUid("_dataSourceRespondsToWriteRowsWithIndexesToPasteboard"), function $CPTableView___dataSourceRespondsToWriteRowsWithIndexesToPasteboard(self, _cmd)
{
    return self._implementedDataSourceMethods & CPTableViewDataSource_tableView_writeRowsWithIndexes_toPasteboard_;
}
,["BOOL"]), new objj_method(sel_getUid("_dataSourceRespondsToSetObjectValueForTableColumnRow"), function $CPTableView___dataSourceRespondsToSetObjectValueForTableColumnRow(self, _cmd)
{
    return CPTableViewDataSource_tableView_setObjectValue_forTableColumn_row_;
}
,["BOOL"]), new objj_method(sel_getUid("_dataSourceRespondsToValidateDropProposedRowProposedDropOperation"), function $CPTableView___dataSourceRespondsToValidateDropProposedRowProposedDropOperation(self, _cmd)
{
    return self._implementedDataSourceMethods & CPTableViewDataSource_tableView_validateDrop_proposedRow_proposedDropOperation_;
}
,["BOOL"]), new objj_method(sel_getUid("_dataSourceRespondsToNumberOfRowsinTableView"), function $CPTableView___dataSourceRespondsToNumberOfRowsinTableView(self, _cmd)
{
    return self._implementedDataSourceMethods & CPTableViewDataSource_numberOfRowsInTableView_;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDataSourceNumberOfRowsInTableView"), function $CPTableView___sendDataSourceNumberOfRowsInTableView(self, _cmd)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_numberOfRowsInTableView_))
        return 0;
    return objj_msgSend(self._dataSource, "numberOfRowsInTableView:", self);
}
,["int"]), new objj_method(sel_getUid("_sendDataSourceObjectValueForTableColumn:row:"), function $CPTableView___sendDataSourceObjectValueForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_objectValueForTableColumn_row_))
        return nil;
    return objj_msgSend(self._dataSource, "tableView:objectValueForTableColumn:row:", self, aTableColumn, aRowIndex);
}
,["id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDataSourceSetObjectValue:forTableColumn:row:"), function $CPTableView___sendDataSourceSetObjectValue_forTableColumn_row_(self, _cmd, anObject, aTableColumn, aRowIndex)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_setObjectValue_forTableColumn_row_))
        return;
    objj_msgSend(self._dataSource, "tableView:setObjectValue:forTableColumn:row:", self, anObject, aTableColumn, aRowIndex);
}
,["void","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDataSourceSortDescriptorsDidChange:"), function $CPTableView___sendDataSourceSortDescriptorsDidChange_(self, _cmd, descriptors)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_sortDescriptorsDidChange_))
        return;
    objj_msgSend(self._dataSource, "tableView:sortDescriptorsDidChange:", self, descriptors);
}
,["void","CPArray"]), new objj_method(sel_getUid("_sendDataSourceAcceptDrop:row:dropOperation:"), function $CPTableView___sendDataSourceAcceptDrop_row_dropOperation_(self, _cmd, info, aRowIndex, operation)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_acceptDrop_row_dropOperation_))
        return NO;
    return objj_msgSend(self._dataSource, "tableView:acceptDrop:row:dropOperation:", self, info, aRowIndex, operation);
}
,["BOOL","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("_sendDataSourceValidateDrop:proposedRow:proposedDropOperation:"), function $CPTableView___sendDataSourceValidateDrop_proposedRow_proposedDropOperation_(self, _cmd, info, aRowIndex, operation)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_validateDrop_proposedRow_proposedDropOperation_))
        return CPDragOperationNone;
    return objj_msgSend(self._dataSource, "tableView:validateDrop:proposedRow:proposedDropOperation:", self, info, aRowIndex, operation);
}
,["CPDragOperation","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("_sendDataSourceWriteRowsWithIndexes:toPasteboard:"), function $CPTableView___sendDataSourceWriteRowsWithIndexes_toPasteboard_(self, _cmd, rowIndexes, pboard)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_writeRowsWithIndexes_toPasteboard_))
        return NO;
    return objj_msgSend(self._dataSource, "tableView:writeRowsWithIndexes:toPasteboard:", self, rowIndexes, pboard);
}
,["BOOL","CPIndexSet","CPPasteboard"]), new objj_method(sel_getUid("draggedImage:endedAt:operation:"), function $CPTableView__draggedImage_endedAt_operation_(self, _cmd, anImage, aLocation, anOperation)
{
    if (objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("tableView:didEndDraggedImage:atPosition:operation:")))
        objj_msgSend(self._dataSource, "tableView:didEndDraggedImage:atPosition:operation:", self, anImage, aLocation, anOperation);
}
,["void","CPImage","CGPoint","CPDragOperation"]), new objj_method(sel_getUid("_sendDataSourceNamesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:"), function $CPTableView___sendDataSourceNamesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_(self, _cmd, dropDestination, indexSet)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_namesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_))
        return [];
    return objj_msgSend(self._dataSource, "tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:", self, dropDestination, indexSet);
}
,["CPArray","CPURL","CPIndexSet"])]);
}{
var the_class = objj_getClass("CPTableView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_delegateRespondsToDataViewForTableColumn"), function $CPTableView___delegateRespondsToDataViewForTableColumn(self, _cmd)
{
    return self._implementedDelegateMethods & CPTableViewDelegate_tableView_dataViewForTableColumn_row_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToViewForTableColumn"), function $CPTableView___delegateRespondsToViewForTableColumn(self, _cmd)
{
    return self._implementedDelegateMethods & CPTableViewDelegate_tableView_viewForTableColumn_row_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToShouldSelectRow"), function $CPTableView___delegateRespondsToShouldSelectRow(self, _cmd)
{
    return self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldSelectRow_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToSelectionShouldChangeInTableView"), function $CPTableView___delegateRespondsToSelectionShouldChangeInTableView(self, _cmd)
{
    return self._implementedDelegateMethods & CPTableViewDelegate_selectionShouldChangeInTableView_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToSelectionIndexesForProposedSelection"), function $CPTableView___delegateRespondsToSelectionIndexesForProposedSelection(self, _cmd)
{
    return self._implementedDelegateMethods & CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToMenuForTableColumnRow"), function $CPTableView___delegateRespondsToMenuForTableColumnRow(self, _cmd)
{
    return self._implementedDelegateMethods & CPTableViewDelegate_tableViewMenuForTableColumn_row_;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateDidClickTableColumn:"), function $CPTableView___sendDelegateDidClickTableColumn_(self, _cmd, column)
{
    if (self._implementedDelegateMethods & CPTableViewDelegate_tableView_didClickTableColumn_)
        objj_msgSend(self._delegate, "tableView:didClickTableColumn:", self, self._tableColumns[column]);
}
,["void","CPInteger"]), new objj_method(sel_getUid("_sendDelegateDidDragTableColumn:"), function $CPTableView___sendDelegateDidDragTableColumn_(self, _cmd, column)
{
    if (self._implementedDelegateMethods & CPTableViewDelegate_tableView_didDragTableColumn_)
        objj_msgSend(self._delegate, "tableView:didDragTableColumn:", self, self._tableColumns[column]);
}
,["void","CPInteger"]), new objj_method(sel_getUid("_sendDelegateMouseDownInHeaderOfTableColumn:"), function $CPTableView___sendDelegateMouseDownInHeaderOfTableColumn_(self, _cmd, column)
{
    if (self._implementedDelegateMethods & CPTableViewDelegate_tableView_mouseDownInHeaderOfTableColumn_)
        objj_msgSend(self._delegate, "tableView:mouseDownInHeaderOfTableColumn:", self, self._tableColumns[column]);
}
,["void","CPInteger"]), new objj_method(sel_getUid("_sendDelegateDeleteKeyPressed"), function $CPTableView___sendDelegateDeleteKeyPressed(self, _cmd)
{
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tableViewDeleteKeyPressed:")))
    {
        objj_msgSend(self._delegate, "tableViewDeleteKeyPressed:", self);
        return YES;
    }
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateSelectionShouldChangeInTableView"), function $CPTableView___sendDelegateSelectionShouldChangeInTableView(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_selectionShouldChangeInTableView_))
        return YES;
    return objj_msgSend(self._delegate, "selectionShouldChangeInTableView:", self);
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateIsGroupRow:"), function $CPTableView___sendDelegateIsGroupRow_(self, _cmd, anIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_isGroupRow_))
        return NO;
    return objj_msgSend(self._delegate, "tableView:isGroupRow:", self, anIndex);
}
,["BOOL","CPInteger"]), new objj_method(sel_getUid("_sendDelegateShouldSelectRow:"), function $CPTableView___sendDelegateShouldSelectRow_(self, _cmd, anIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldSelectRow_))
        return YES;
    return objj_msgSend(self._delegate, "tableView:shouldSelectRow:", self, anIndex);
}
,["BOOL","CPInteger"]), new objj_method(sel_getUid("_sendDelegateWillDisplayView:forTableColumn:row:"), function $CPTableView___sendDelegateWillDisplayView_forTableColumn_row_(self, _cmd, aCell, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_willDisplayView_forTableColumn_row_))
        return;
    objj_msgSend(self._delegate, "tableView:willDisplayView:forTableColumn:row:", self, aCell, aTableColumn, aRowIndex);
}
,["void","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateWillRemoveView:forTableColumn:row:"), function $CPTableView___sendDelegateWillRemoveView_forTableColumn_row_(self, _cmd, aCell, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_willRemoveView_forTableColumn_row_))
        return;
    objj_msgSend(self._delegate, "tableView:willRemoveView:forTableColumn:row:", self, aCell, aTableColumn, aRowIndex);
}
,["void","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateMenuForTableColumn:row:"), function $CPTableView___sendDelegateMenuForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableViewMenuForTableColumn_row_))
        return nil;
    return objj_msgSend(self._delegate, "tableView:menuForTableColumn:row:", self, aTableColumn, aRowIndex);
}
,["CPMenu","CPTableColumn","id"]), new objj_method(sel_getUid("_sendDelegateShouldReorderColumn:toColumn:"), function $CPTableView___sendDelegateShouldReorderColumn_toColumn_(self, _cmd, columnIndex, newColumnIndex)
{
    if (objj_msgSend(self, "allowsColumnReordering") && self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldReorderColumn_toColumn_)
    {
        return objj_msgSend(self._delegate, "tableView:shouldReorderColumn:toColumn:", self, columnIndex, newColumnIndex);
    }
    return objj_msgSend(self, "allowsColumnReordering");
}
,["BOOL","CPInteger","CPInteger"]), new objj_method(sel_getUid("_sendDelegateHeightOfRow:"), function $CPTableView___sendDelegateHeightOfRow_(self, _cmd, anIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_heightOfRow_))
        return objj_msgSend(self, "rowHeight");
    return objj_msgSend(self._delegate, "tableView:heightOfRow:", self, anIndex);
}
,["float","CPInteger"]), new objj_method(sel_getUid("_sendDelegateShouldEditTableColumn:row:"), function $CPTableView___sendDelegateShouldEditTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldEditTableColumn_row_))
        return YES;
    return objj_msgSend(self._delegate, "tableView:shouldEditTableColumn:row:", self, aTableColumn, aRowIndex);
}
,["BOOL","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateSelectionIndexesForProposedSelection:"), function $CPTableView___sendDelegateSelectionIndexesForProposedSelection_(self, _cmd, anIndexSet)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_))
        return anIndexSet;
    return objj_msgSend(self._delegate, "tableView:selectionIndexesForProposedSelection:", self, anIndexSet);
}
,["CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_sendDelegateViewForTableColumn:row:"), function $CPTableView___sendDelegateViewForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_viewForTableColumn_row_))
        return nil;
    return objj_msgSend(self._delegate, "tableView:viewForTableColumn:row:", self, aTableColumn, aRowIndex);
}
,["CPView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateDataViewForTableColumn:row:"), function $CPTableView___sendDelegateDataViewForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_dataViewForTableColumn_row_))
        return nil;
    return objj_msgSend(self._delegate, "tableView:dataViewForTableColumn:row:", self, aTableColumn, aRowIndex);
}
,["CPView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateShouldSelectTableColumn:"), function $CPTableView___sendDelegateShouldSelectTableColumn_(self, _cmd, aTableColumn)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldSelectTableColumn_))
        return YES;
    return objj_msgSend(self._delegate, "tableView:shouldSelectTableColumn:", self, aTableColumn);
}
,["BOOL","CPTableColumn"]), new objj_method(sel_getUid("_sendDelegateToolTipForView:rect:tableColumn:row:mouseLocation:"), function $CPTableView___sendDelegateToolTipForView_rect_tableColumn_row_mouseLocation_(self, _cmd, aView, aRect, aTableColumn, aRowIndex, aPoint)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_toolTipForView_rect_tableColumn_row_mouseLocation_))
        return nil;
    return objj_msgSend(self._delegate, "tableView:toolTipForView:rect:tableColumn:row:mouseLocation:", self, aView, aRect, aTableColumn, aRowIndex, aPoint);
}
,["CPString","id","CGRect","CPTableColumn","CPInteger","CGPoint"]), new objj_method(sel_getUid("_sendDelegateShouldTrackView:forTableColumn:row:"), function $CPTableView___sendDelegateShouldTrackView_forTableColumn_row_(self, _cmd, aView, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldTrackView_forTableColumn_row_))
        return YES;
    return objj_msgSend(self._delegate, "tableView:shouldTrackView:forTableColumn:row:", self, aView, aTableColumn, aRowIndex);
}
,["BOOL","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateShouldShowViewExpansionForTableColumn:row:"), function $CPTableView___sendDelegateShouldShowViewExpansionForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldShowViewExpansionForTableColumn_row_))
        return YES;
    return objj_msgSend(self._delegate, "tableView:shouldShowViewExpansionForTableColumn:row:", self, aTableColumn, aRowIndex);
}
,["BOOL","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateShouldTypeSelectForEvent:withCurrentSearchString:"), function $CPTableView___sendDelegateShouldTypeSelectForEvent_withCurrentSearchString_(self, _cmd, anEvent, aString)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldTypeSelectForEvent_withCurrentSearchString_))
        return NO;
    return objj_msgSend(self._delegate, "tableView:shouldTypeSelectForEvent:withCurrentSearchString:", self, anEvent, aString);
}
,["BOOL","CPEvent","CPString"]), new objj_method(sel_getUid("_sendDelegateTypeSelectStringForTableColumn:row:"), function $CPTableView___sendDelegateTypeSelectStringForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_typeSelectStringForTableColumn_row_))
        return nil;
    return objj_msgSend(self._delegate, "tableView:typeSelectStringForTableColumn:row:", self, aTableColumn, aRowIndex);
}
,["CPString","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateNextTypeSelectMatchFromRow:toRow:forString:"), function $CPTableView___sendDelegateNextTypeSelectMatchFromRow_toRow_forString_(self, _cmd, aRowIndex, aSecondRowIndex, aString)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_nextTypeSelectMatchFromRow_toRow_forString_))
        return -1;
    return objj_msgSend(self._delegate, "tableView:nextTypeSelectMatchFromRow:toRow:forString:", self, aRowIndex, aSecondRowIndex, aString);
}
,["int","CPInteger","CPInteger","CPString"])]);
}{
var the_class = objj_getClass("CPTableView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_replacementKeyPathForBinding:"), function $CPTableView___replacementKeyPathForBinding_(self, _cmd, aBinding)
{
    if (aBinding === "selectionIndexes")
        return "selectedRowIndexes";
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "_replacementKeyPathForBinding:", aBinding);
}
,["CPString","CPString"]), new objj_method(sel_getUid("_establishBindingsIfUnbound:"), function $CPTableView___establishBindingsIfUnbound_(self, _cmd, destination)
{
    if (objj_msgSend(objj_msgSend(self, "infoForBinding:", "content"), "objectForKey:", CPObservedObjectKey) !== destination)
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "bind:toObject:withKeyPath:options:", "content", destination, "arrangedObjects", nil);
        self._contentBindingExplicitlySet = NO;
    }
    if (!self._contentBindingExplicitlySet)
    {
        if (objj_msgSend(objj_msgSend(self, "infoForBinding:", "selectionIndexes"), "objectForKey:", CPObservedObjectKey) !== destination)
            objj_msgSend(self, "bind:toObject:withKeyPath:options:", "selectionIndexes", destination, "selectionIndexes", nil);
        if (objj_msgSend(objj_msgSend(self, "infoForBinding:", "sortDescriptors"), "objectForKey:", CPObservedObjectKey) !== destination)
            objj_msgSend(self, "bind:toObject:withKeyPath:options:", "sortDescriptors", destination, "sortDescriptors", nil);
    }
}
,["void","id"]), new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"), function $CPTableView__bind_toObject_withKeyPath_options_(self, _cmd, aBinding, anObject, aKeyPath, options)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "bind:toObject:withKeyPath:options:", aBinding, anObject, aKeyPath, options);
    if (aBinding == "content")
        self._contentBindingExplicitlySet = YES;
}
,["void","CPString","id","CPString","CPDictionary"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPTableView___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding == "content")
        return objj_msgSend(CPTableContentBinder, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPTableView").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "CPTableContentBinder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_content")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("content"), function $CPTableContentBinder__content(self, _cmd)
{
    return self._content;
}
,["id"]), new objj_method(sel_getUid("setContent:"), function $CPTableContentBinder__setContent_(self, _cmd, newValue)
{
    self._content = newValue;
}
,["void","id"]), new objj_method(sel_getUid("setValueFor:"), function $CPTableContentBinder__setValueFor_(self, _cmd, aBinding)
{
    var destination = objj_msgSend(self._info, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(self._info, "objectForKey:", CPObservedKeyPathKey);
    self._content = objj_msgSend(destination, "valueForKey:", keyPath);
    objj_msgSend(self._source, "reloadData");
}
,["void","CPString"])]);
}var CPTableViewDataSourceKey = "CPTableViewDataSourceKey",
    CPTableViewDelegateKey = "CPTableViewDelegateKey",
    CPTableViewHeaderViewKey = "CPTableViewHeaderViewKey",
    CPTableViewTableColumnsKey = "CPTableViewTableColumnsKey",
    CPTableViewRowHeightKey = "CPTableViewRowHeightKey",
    CPTableViewIntercellSpacingKey = "CPTableViewIntercellSpacingKey",
    CPTableViewSelectionHighlightStyleKey = "CPTableViewSelectionHighlightStyleKey",
    CPTableViewMultipleSelectionKey = "CPTableViewMultipleSelectionKey",
    CPTableViewEmptySelectionKey = "CPTableViewEmptySelectionKey",
    CPTableViewColumnReorderingKey = "CPTableViewColumnReorderingKey",
    CPTableViewColumnResizingKey = "CPTableViewColumnResizingKey",
    CPTableViewColumnSelectionKey = "CPTableViewColumnSelectionKey",
    CPTableViewColumnAutoresizingStyleKey = "CPTableViewColumnAutoresizingStyleKey",
    CPTableViewGridColorKey = "CPTableViewGridColorKey",
    CPTableViewGridStyleMaskKey = "CPTableViewGridStyleMaskKey",
    CPTableViewUsesAlternatingBackgroundKey = "CPTableViewUsesAlternatingBackgroundKey",
    CPTableViewAlternatingRowColorsKey = "CPTableViewAlternatingRowColorsKey",
    CPTableViewHeaderViewKey = "CPTableViewHeaderViewKey",
    CPTableViewCornerViewKey = "CPTableViewCornerViewKey",
    CPTableViewAutosaveNameKey = "CPTableViewAutosaveNameKey",
    CPTableViewArchivedReusableViewsKey = "CPTableViewArchivedReusableViewsKey";
{
var the_class = objj_getClass("CPTableView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTableView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._allowsColumnReordering = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewColumnReorderingKey);
        self._allowsColumnResizing = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewColumnResizingKey);
        self._allowsMultipleSelection = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewMultipleSelectionKey);
        self._allowsEmptySelection = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewEmptySelectionKey);
        self._allowsColumnSelection = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewColumnSelectionKey);
        self._selectionHighlightStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPTableViewSelectionHighlightStyleKey);
        self._columnAutoResizingStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPTableViewColumnAutoresizingStyleKey);
        self._tableColumns = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewTableColumnsKey) || [];
        objj_msgSend(self._tableColumns, "makeObjectsPerformSelector:withObject:", sel_getUid("setTableView:"), self);
        self._rowHeight = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableViewRowHeightKey) || objj_msgSend(self, "valueForThemeAttribute:", "default-row-height");
        self._intercellSpacing = objj_msgSend(aCoder, "decodeSizeForKey:", CPTableViewIntercellSpacingKey);
        if (CGSizeEqualToSize(self._intercellSpacing, CGSizeMakeZero()))
            self._intercellSpacing = CGSizeMake(3.0, 2.0);
        objj_msgSend(self, "setGridColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewGridColorKey));
        self._gridStyleMask = objj_msgSend(aCoder, "decodeIntForKey:", CPTableViewGridStyleMaskKey);
        self._usesAlternatingRowBackgroundColors = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewUsesAlternatingBackgroundKey);
        objj_msgSend(self, "setAlternatingRowBackgroundColors:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewAlternatingRowColorsKey));
        self._headerView = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewHeaderViewKey);
        self._cornerView = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewCornerViewKey);
        objj_msgSend(self, "setDataSource:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewDataSourceKey));
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewDelegateKey));
        objj_msgSend(self, "_init");
        if (objj_msgSend(aCoder, "containsValueForKey:", CPTableViewArchivedReusableViewsKey))
            self._archivedDataViews = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewArchivedReusableViewsKey);
        objj_msgSend(self, "_updateIsViewBased");
        objj_msgSend(self, "viewWillMoveToSuperview:", objj_msgSend(self, "superview"));
        objj_msgSend(self, "setAutosaveName:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewAutosaveNameKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTableView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._dataSource, CPTableViewDataSourceKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._delegate, CPTableViewDelegateKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._rowHeight, CPTableViewRowHeightKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", self._intercellSpacing, CPTableViewIntercellSpacingKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._selectionHighlightStyle, CPTableViewSelectionHighlightStyleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._columnAutoResizingStyle, CPTableViewColumnAutoresizingStyleKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsMultipleSelection, CPTableViewMultipleSelectionKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsEmptySelection, CPTableViewEmptySelectionKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsColumnReordering, CPTableViewColumnReorderingKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsColumnResizing, CPTableViewColumnResizingKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsColumnSelection, CPTableViewColumnSelectionKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._tableColumns, CPTableViewTableColumnsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "gridColor"), CPTableViewGridColorKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._gridStyleMask, CPTableViewGridStyleMaskKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._usesAlternatingRowBackgroundColors, CPTableViewUsesAlternatingBackgroundKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "alternatingRowBackgroundColors"), CPTableViewAlternatingRowColorsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._cornerView, CPTableViewCornerViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._headerView, CPTableViewHeaderViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._autosaveName, CPTableViewAutosaveNameKey);
    if (self._archivedDataViews)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._archivedDataViews, CPTableViewArchivedReusableViewsKey);
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("removeMatches:"), function $CPIndexSet__removeMatches_(self, _cmd, otherSet)
{
    var firstindex = objj_msgSend(self, "firstIndex"),
        index = MIN(firstindex, objj_msgSend(otherSet, "firstIndex")),
        switchFlag = index == firstindex;
    while (index != CPNotFound)
    {
        var indexSet = switchFlag ? otherSet : self,
            otherIndex = objj_msgSend(indexSet, "indexGreaterThanOrEqualToIndex:", index);
        if (otherIndex == index)
        {
            objj_msgSend(self, "removeIndex:", index);
            objj_msgSend(otherSet, "removeIndex:", index);
        }
        index = otherIndex;
        switchFlag = !switchFlag;
    }
}
,["void","CPIndexSet"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPDropOperationDrawingView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("dropOperation"), new objj_ivar("tableView"), new objj_ivar("currentRow"), new objj_ivar("isBlinking")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("dropOperation"), function $_CPDropOperationDrawingView__dropOperation(self, _cmd)
{
    return self.dropOperation;
}
,["unsigned"]), new objj_method(sel_getUid("setDropOperation:"), function $_CPDropOperationDrawingView__setDropOperation_(self, _cmd, newValue)
{
    self.dropOperation = newValue;
}
,["void","unsigned"]), new objj_method(sel_getUid("tableView"), function $_CPDropOperationDrawingView__tableView(self, _cmd)
{
    return self.tableView;
}
,["CPTableView"]), new objj_method(sel_getUid("setTableView:"), function $_CPDropOperationDrawingView__setTableView_(self, _cmd, newValue)
{
    self.tableView = newValue;
}
,["void","CPTableView"]), new objj_method(sel_getUid("currentRow"), function $_CPDropOperationDrawingView__currentRow(self, _cmd)
{
    return self.currentRow;
}
,["int"]), new objj_method(sel_getUid("setCurrentRow:"), function $_CPDropOperationDrawingView__setCurrentRow_(self, _cmd, newValue)
{
    self.currentRow = newValue;
}
,["void","int"]), new objj_method(sel_getUid("isBlinking"), function $_CPDropOperationDrawingView__isBlinking(self, _cmd)
{
    return self.isBlinking;
}
,["BOOL"]), new objj_method(sel_getUid("setIsBlinking:"), function $_CPDropOperationDrawingView__setIsBlinking_(self, _cmd, newValue)
{
    self.isBlinking = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("drawRect:"), function $_CPDropOperationDrawingView__drawRect_(self, _cmd, aRect)
{
    if (self.tableView._destinationDragStyle === CPTableViewDraggingDestinationFeedbackStyleNone || self.isBlinking)
        return;
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        borderRadius,
        borderColor,
        borderWidth,
        backgroundColor;
    if (self.currentRow === -1)
    {
        borderColor = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-on-border-color");
        borderWidth = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-on-border-width");
        CGContextSetStrokeColor(context, borderColor);
        CGContextSetLineWidth(context, borderWidth);
        CGContextStrokeRect(context, objj_msgSend(self, "bounds"));
    }
    else if (self.dropOperation === CPTableViewDropOn)
    {
        var selectedRows = objj_msgSend(self.tableView, "selectedRowIndexes"),
            newRect = CGRectMake(aRect.origin.x + 2, aRect.origin.y + 2, aRect.size.width - 4, aRect.size.height - 5);
        if (objj_msgSend(selectedRows, "containsIndex:", self.currentRow))
        {
            borderRadius = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-on-selected-border-radius");
            borderColor = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-on-selected-border-color");
            borderWidth = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-on-selected-border-width");
            backgroundColor = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-on-selected-background-color");
        }
        else
        {
            borderRadius = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-on-border-radius");
            borderColor = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-on-border-color");
            borderWidth = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-on-border-width");
            backgroundColor = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-on-background-color");
        }
        CGContextSetStrokeColor(context, borderColor);
        CGContextSetLineWidth(context, borderWidth);
        CGContextSetFillColor(context, backgroundColor);
        CGContextFillRoundedRectangleInRect(context, newRect, borderRadius, YES, YES, YES, YES);
        CGContextStrokeRoundedRectangleInRect(context, newRect, borderRadius, YES, YES, YES, YES);
    }
    else if (self.dropOperation === CPTableViewDropAbove)
    {
        objj_msgSend(self, "setFrameOrigin:", CGPointMake(self._frame.origin.x, self._frame.origin.y - 8));
        var selectedRows = objj_msgSend(self.tableView, "selectedRowIndexes");
        if (objj_msgSend(selectedRows, "containsIndex:", self.currentRow - 1) || objj_msgSend(selectedRows, "containsIndex:", self.currentRow))
        {
            borderColor = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-above-selected-border-color");
            borderWidth = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-above-selected-border-width");
        }
        else
        {
            borderColor = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-above-border-color");
            borderWidth = objj_msgSend(self.tableView, "valueForThemeAttribute:", "dropview-above-border-width");
        }
        CGContextSetStrokeColor(context, borderColor);
        CGContextSetLineWidth(context, borderWidth);
        CGContextStrokeEllipseInRect(context, CGRectMake(aRect.origin.x + 4, aRect.origin.y + 4, 8, 8));
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, 10, aRect.origin.y + 8);
        CGContextAddLineToPoint(context, aRect.size.width - aRect.origin.y - 8, aRect.origin.y + 8);
        CGContextStrokePath(context);
    }
}
,["void","CGRect"]), new objj_method(sel_getUid("blink"), function $_CPDropOperationDrawingView__blink(self, _cmd)
{
    if (self.dropOperation !== CPTableViewDropOn)
        return;
    self.isBlinking = YES;
    var showCallback = function()
    {
        objj_msgSend(self, "setHidden:", NO);
        self.isBlinking = NO;
    };
    var hideCallback = function()
    {
        objj_msgSend(self, "setHidden:", YES);
        self.isBlinking = YES;
    };
    objj_msgSend(self, "setHidden:", YES);
    objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", 0.1, showCallback, NO);
    objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", 0.19, hideCallback, NO);
    objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", 0.27, showCallback, NO);
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPColumnDragView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_lineColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithLineColor:"), function $_CPColumnDragView__initWithLineColor_(self, _cmd, aColor)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPColumnDragView").super_class }, "initWithFrame:", CGRectMakeZero());
    if (self)
        self._lineColor = aColor;
    return self;
}
,["id","CPColor"]), new objj_method(sel_getUid("drawRect:"), function $_CPColumnDragView__drawRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetStrokeColor(context, self._lineColor);
    var points = [CGPointMake(0.5, 0), CGPointMake(0.5, aRect.size.height)];
    CGContextStrokeLineSegments(context, points, 2);
    points = [CGPointMake(aRect.size.width - 0.5, 0), CGPointMake(aRect.size.width - 0.5, aRect.size.height)];
    CGContextStrokeLineSegments(context, points, 2);
}
,["void","CGRect"])]);
}{var the_class = objj_allocateClassPair(CPView, "CPTableCellView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_objectValue"), new objj_ivar("_textField"), new objj_ivar("_imageView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("objectValue"), function $CPTableCellView__objectValue(self, _cmd)
{
    return self._objectValue;
}
,["id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPTableCellView__setObjectValue_(self, _cmd, newValue)
{
    self._objectValue = newValue;
}
,["void","id"]), new objj_method(sel_getUid("textField"), function $CPTableCellView__textField(self, _cmd)
{
    return self._textField;
}
,["CPTextField"]), new objj_method(sel_getUid("setTextField:"), function $CPTableCellView__setTextField_(self, _cmd, newValue)
{
    self._textField = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("imageView"), function $CPTableCellView__imageView(self, _cmd)
{
    return self._imageView;
}
,["CPImageView"]), new objj_method(sel_getUid("setImageView:"), function $CPTableCellView__setImageView_(self, _cmd, newValue)
{
    self._imageView = newValue;
}
,["void","CPImageView"]), new objj_method(sel_getUid("awakeFromCib"), function $CPTableCellView__awakeFromCib(self, _cmd)
{
    objj_msgSend(self, "setThemeState:", CPThemeStateTableDataView);
}
,["void"]), new objj_method(sel_getUid("setThemeState:"), function $CPTableCellView__setThemeState_(self, _cmd, aState)
{
    if (aState.isa && objj_msgSend(aState, "isKindOfClass:", CPArray))
        aState = CPThemeState.apply(null, aState);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableCellView").super_class }, "setThemeState:", aState);
    objj_msgSend(self, "recursivelyPerformSelector:withObject:startingFrom:", sel_getUid("setThemeState:"), aState, self);
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("unsetThemeState:"), function $CPTableCellView__unsetThemeState_(self, _cmd, aState)
{
    if (aState.isa && objj_msgSend(aState, "isKindOfClass:", CPArray))
        aState = CPThemeState.apply(null, aState);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableCellView").super_class }, "unsetThemeState:", aState);
    objj_msgSend(self, "recursivelyPerformSelector:withObject:startingFrom:", sel_getUid("unsetThemeState:"), aState, self);
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("recursivelyPerformSelector:withObject:startingFrom:"), function $CPTableCellView__recursivelyPerformSelector_withObject_startingFrom_(self, _cmd, selector, anObject, aView)
{
    objj_msgSend(objj_msgSend(aView, "subviews"), "enumerateObjectsUsingBlock:", function(view, idx)
    {
        objj_msgSend(view, "performSelector:withObject:", selector, anObject);
        if (!objj_msgSend(view, "isKindOfClass:", objj_msgSend(self, "class")))
            objj_msgSend(self, "recursivelyPerformSelector:withObject:startingFrom:", selector, anObject, view);
    });
}
,["void","SEL","id","id"]), new objj_method(sel_getUid("description"), function $CPTableCellView__description(self, _cmd)
{
    return "<" + objj_msgSend(self, "className") + " 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "UID")) + " identifier=" + objj_msgSend(self, "identifier") + ">";
}
,["CPString"])]);
}