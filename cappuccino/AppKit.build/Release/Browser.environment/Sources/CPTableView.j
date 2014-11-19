@STATIC;1.0;I;20;Foundation/CPArray.jI;23;Foundation/CPIndexSet.ji;24;CPDragServer_Constants.ji;12;CGGradient.ji;7;CPCib.ji;17;CPCompatibility.ji;11;CPControl.ji;13;CPImageView.ji;12;CPScroller.ji;14;CPScrollView.ji;15;CPTableColumn.ji;19;CPTableHeaderView.ji;8;CPText.ji;15;_CPCornerView.jt;249798;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("CPDragServer_Constants.j", YES);objj_executeFile("CGGradient.j", YES);objj_executeFile("CPCib.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPControl.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPScroller.j", YES);objj_executeFile("CPScrollView.j", YES);objj_executeFile("CPTableColumn.j", YES);objj_executeFile("CPTableHeaderView.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("_CPCornerView.j", YES);CPTableViewColumnDidMoveNotification = "CPTableViewColumnDidMoveNotification";
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
    var frame = self.isa.objj_msgSend0(self, "frame"),
        context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextTranslateCTM(context, -CGRectGetMinX(frame), -CGRectGetMinY(frame));
    ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_drawRect:", aRect));
    var ___r1;
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
        (self == null ? null : self.isa.objj_msgSend1(self, "setUsesAlternatingRowBackgroundColors:", NO));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAlternatingRowBackgroundColors:", [CPColor.isa.objj_msgSend0(CPColor, "whiteColor"), CPColor.isa.objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 245.0 / 255.0, 249.0 / 255.0, 252.0 / 255.0, 1.0)]));
        self._tableColumns = [];
        self._tableColumnRanges = [];
        self._dirtyTableColumnRangeIndex = CPNotFound;
        self._numberOfHiddenColumns = 0;
        self._intercellSpacing = CGSizeMake(3.0, 2.0);
        self._rowHeight = (self == null ? null : self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "default-row-height"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setGridColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", "dce0e2")));
        (self == null ? null : self.isa.objj_msgSend1(self, "setGridStyleMask:", CPTableViewGridNone));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHeaderView:", ((___r1 = (CPTableHeaderView == null ? null : CPTableHeaderView.isa.objj_msgSend0(CPTableHeaderView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, (self == null ? null : self.isa.objj_msgSend0(self, "bounds")).size.width, self._rowHeight)))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setCornerView:", ((___r1 = _CPCornerView.isa.objj_msgSend0(_CPCornerView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, CPScroller.isa.objj_msgSend0(CPScroller, "scrollerWidth"), CGRectGetHeight(((___r2 = self._headerView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))))))));
        self._currentHighlightedTableColumn = nil;
        self._draggedRowIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
        self._verticalMotionCanDrag = YES;
        self._isSelectingSession = NO;
        self._retargetedDropRow = nil;
        self._retargetedDropOperation = nil;
        self._dragOperationDefaultMask = nil;
        self._destinationDragStyle = CPTableViewDraggingDestinationFeedbackStyleRegular;
        self._contentBindingExplicitlySet = NO;
        (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPTableView___init(self, _cmd)
{
    self._lastSelectedRow = self._clickedColumn = self._clickedRow = -1;
    self._selectedColumnIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    self._selectedRowIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    self._dropOperationFeedbackView = ((___r1 = (_CPDropOperationDrawingView == null ? null : _CPDropOperationDrawingView.isa.objj_msgSend0(_CPDropOperationDrawingView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self._dropOperationFeedbackView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTableView:", self));
    self._lastColumnShouldSnap = NO;
    if (!self._alternatingRowBackgroundColors)
        self._alternatingRowBackgroundColors = [CPColor.isa.objj_msgSend0(CPColor, "whiteColor"), CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", "e4e7ff")];
    self._tableColumnRanges = [];
    self._dirtyTableColumnRangeIndex = 0;
    self._numberOfHiddenColumns = 0;
    self._objectValues = {};
    self._dataViewsForTableColumns = {};
    self._numberOfRows = 0;
    self._exposedRows = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    self._exposedColumns = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    self._cachedDataViews = {};
    self._archivedDataViews = nil;
    self._viewForTableColumnRowSelector = nil;
    self._unavailable_custom_cibs = {};
    self._cachedRowHeights = [];
    self._groupRows = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    self._tableDrawView = ((___r1 = _CPTableDrawView.isa.objj_msgSend0(_CPTableDrawView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTableView:", self));
    ((___r1 = self._tableDrawView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "clearColor")));
    self.isa.objj_msgSend1(self, "addSubview:", self._tableDrawView);
    self._draggedColumn = nil;
    self._draggingViews = CPArray.isa.objj_msgSend0(CPArray, "array");
    self._editingRow = CPNotFound;
    self._editingColumn = CPNotFound;
    self._differedColumnDataToRemove = [];
    self._implementsCustomDrawRow = self.isa.objj_msgSend1(self, "implementsSelector:", sel_getUid("drawRow:clipRect:"));
    if (!self._sortDescriptors)
        self._sortDescriptors = [];
    self.isa.objj_msgSend0(self, "_startObservingFirstResponder");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setDataSource:"), function $CPTableView__setDataSource_(self, _cmd, aDataSource)
{
    if (self._dataSource === aDataSource)
        return;
    self._dataSource = aDataSource;
    self._implementedDataSourceMethods = 0;
    if (!self._dataSource)
        return;
    var hasContentBinding = !!self.isa.objj_msgSend1(self, "infoForBinding:", "content");
    if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("numberOfRowsInTableView:"))))
        self._implementedDataSourceMethods |= CPTableViewDataSource_numberOfRowsInTableView_;
    if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:objectValueForTableColumn:row:"))))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_objectValueForTableColumn_row_;
    if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:setObjectValue:forTableColumn:row:"))))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_setObjectValue_forTableColumn_row_;
    if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:acceptDrop:row:dropOperation:"))))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_acceptDrop_row_dropOperation_;
    if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:"))))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_namesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_;
    if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"))))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_validateDrop_proposedRow_proposedDropOperation_;
    if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"))))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_writeRowsWithIndexes_toPasteboard_;
    if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:sortDescriptorsDidChange:"))))
        self._implementedDataSourceMethods |= CPTableViewDataSource_tableView_sortDescriptorsDidChange_;
    self.isa.objj_msgSend0(self, "reloadData");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("dataSource"), function $CPTableView__dataSource(self, _cmd)
{
    return self._dataSource;
}
,["id"]), new objj_method(sel_getUid("reloadDataForRowIndexes:columnIndexes:"), function $CPTableView__reloadDataForRowIndexes_columnIndexes_(self, _cmd, rowIndexes, columnIndexes)
{
    self.isa.objj_msgSend0(self, "reloadData");
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("reloadData"), function $CPTableView__reloadData(self, _cmd)
{
    self._reloadAllRows = YES;
    self._objectValues = {};
    self._cachedRowHeights = [];
    ((___r1 = self._groupRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllIndexes"));
    self.isa.objj_msgSend0(self, "noteNumberOfRowsChanged");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
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
    self.isa.objj_msgSend0(self, "_recalculateTableColumnRanges");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
    self.isa.objj_msgSend0(self, "reloadData");
    var ___r1;
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
    self.isa.objj_msgSend0(self, "setNeedsLayout");
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
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", alternatingRowBackgroundColors, "alternating-row-colors");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPArray"]), new objj_method(sel_getUid("alternatingRowBackgroundColors"), function $CPTableView__alternatingRowBackgroundColors(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "alternating-row-colors");
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
    self.isa.objj_msgSend2(self, "_updateHighlightWithOldRows:newRows:", CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"), self._selectedRowIndexes);
    self.isa.objj_msgSend2(self, "_updateHighlightWithOldColumns:newColumns:", CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"), self._selectedColumnIndexes);
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","unsigned"]), new objj_method(sel_getUid("setSelectionHighlightColor:"), function $CPTableView__setSelectionHighlightColor_(self, _cmd, aColor)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "selectionHighlightColor")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", aColor)))
        return;
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", aColor, "selection-color");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("selectionHighlightColor"), function $CPTableView__selectionHighlightColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "selection-color");
}
,["CPColor"]), new objj_method(sel_getUid("unfocusedSelectionHighlightColor"), function $CPTableView__unfocusedSelectionHighlightColor(self, _cmd)
{
    if (!self._unfocusedSelectionHighlightColor)
        self._unfocusedSelectionHighlightColor = self.isa.objj_msgSend2(self, "_unfocusedSelectionColorFromColor:saturation:", self.isa.objj_msgSend0(self, "selectionHighlightColor"), 0);
    return self._unfocusedSelectionHighlightColor;
}
,["CPColor"]), new objj_method(sel_getUid("setSelectionGradientColors:"), function $CPTableView__setSelectionGradientColors_(self, _cmd, aDictionary)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", aDictionary, "sourcelist-selection-color");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("selectionGradientColors"), function $CPTableView__selectionGradientColors(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "sourcelist-selection-color");
}
,["CPDictionary"]), new objj_method(sel_getUid("unfocusedSelectionGradientColors"), function $CPTableView__unfocusedSelectionGradientColors(self, _cmd)
{
    if (!self._unfocusedSourceListSelectionColor)
    {
        var sourceListColors = self.isa.objj_msgSend0(self, "selectionGradientColors");
        self._unfocusedSourceListSelectionColor = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self.isa.objj_msgSend1(self, "_unfocusedGradientFromGradient:", (sourceListColors == null ? null : sourceListColors.isa.objj_msgSend1(sourceListColors, "objectForKey:", CPSourceListGradient))), CPSourceListGradient, self.isa.objj_msgSend2(self, "_unfocusedSelectionColorFromColor:saturation:", (sourceListColors == null ? null : sourceListColors.isa.objj_msgSend1(sourceListColors, "objectForKey:", CPSourceListTopLineColor)), 0.2), CPSourceListTopLineColor, self.isa.objj_msgSend2(self, "_unfocusedSelectionColorFromColor:saturation:", (sourceListColors == null ? null : sourceListColors.isa.objj_msgSend1(sourceListColors, "objectForKey:", CPSourceListBottomLineColor)), 0.2), CPSourceListBottomLineColor);
    }
    return self._unfocusedSourceListSelectionColor;
}
,["void"]), new objj_method(sel_getUid("_unfocusedSelectionColorFromColor:saturation:"), function $CPTableView___unfocusedSelectionColorFromColor_saturation_(self, _cmd, aColor, saturation)
{
    var hsb = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "hsbComponents"));
    return CPColor.isa.objj_msgSend3(CPColor, "colorWithHue:saturation:brightness:", hsb[0], hsb[1] * saturation, hsb[2]);
}
,["CPColor","CPColor","float"]), new objj_method(sel_getUid("_unfocusedGradientFromGradient:"), function $CPTableView___unfocusedGradientFromGradient_(self, _cmd, aGradient)
{
    var colors = ((___r1 = aGradient.colors), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy")),
        count = (colors == null ? null : colors.isa.objj_msgSend0(colors, "count"));
    while (count--)
    {
        var rgba = colors[count].components,
            hsb = self.isa.objj_msgSend2(self, "_unfocusedSelectionColorFromColor:saturation:", CPColor.isa.objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", rgba[0], rgba[1], rgba[2], rgba[3]), 0.2);
        colors[count] = CGColorCreate(aGradient.colorspace, ((___r1 = (hsb == null ? null : hsb.isa.objj_msgSend0(hsb, "components"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy")));
    }
    return CGGradientCreateWithColors(aGradient.colorspace, colors, aGradient.locations);
    var ___r1;
}
,["CGGradient","CGGradient"]), new objj_method(sel_getUid("setGridColor:"), function $CPTableView__setGridColor_(self, _cmd, aColor)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", aColor, "grid-color");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPColor"]), new objj_method(sel_getUid("gridColor"), function $CPTableView__gridColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "grid-color");
}
,["CPColor"]), new objj_method(sel_getUid("setGridStyleMask:"), function $CPTableView__setGridStyleMask_(self, _cmd, aGrideStyleMask)
{
    if (self._gridStyleMask === aGrideStyleMask)
        return;
    self._gridStyleMask = aGrideStyleMask;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","unsigned"]), new objj_method(sel_getUid("gridStyleMask"), function $CPTableView__gridStyleMask(self, _cmd)
{
    return self._gridStyleMask;
}
,["unsigned"]), new objj_method(sel_getUid("addTableColumn:"), function $CPTableView__addTableColumn_(self, _cmd, aTableColumn)
{
    ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", aTableColumn));
    (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend1(aTableColumn, "setTableView:", self));
    if (self._dirtyTableColumnRangeIndex < 0)
        self._dirtyTableColumnRangeIndex = self._tableColumns.length - 1;
    else
        self._dirtyTableColumnRangeIndex = MIN(self._tableColumns.length - 1, self._dirtyTableColumnRangeIndex);
    if (((___r1 = self.isa.objj_msgSend0(self, "sortDescriptors")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
    {
        var mainSortDescriptor = ((___r1 = self.isa.objj_msgSend0(self, "sortDescriptors")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0));
        if (aTableColumn === self.isa.objj_msgSend1(self, "_tableColumnForSortDescriptor:", mainSortDescriptor))
        {
            var image = (mainSortDescriptor == null ? null : mainSortDescriptor.isa.objj_msgSend0(mainSortDescriptor, "ascending")) ? self.isa.objj_msgSend0(self, "_tableHeaderSortImage") : self.isa.objj_msgSend0(self, "_tableHeaderReverseSortImage");
            self.isa.objj_msgSend2(self, "setIndicatorImage:inTableColumn:", image, aTableColumn);
        }
    }
    self.isa.objj_msgSend0(self, "tile");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("removeTableColumn:"), function $CPTableView__removeTableColumn_(self, _cmd, aTableColumn)
{
    if ((aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "tableView")) !== self)
        return;
    var index = ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aTableColumn));
    if (index === CPNotFound)
        return;
    ((___r1 = self._differedColumnDataToRemove), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", {"column": aTableColumn, "shouldBeHidden": (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "isHidden"))}));
    (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend1(aTableColumn, "setHidden:", YES));
    (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend1(aTableColumn, "setTableView:", nil));
    var tableColumnUID = (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "UID"));
    if (self._objectValues[tableColumnUID])
        self._objectValues[tableColumnUID] = nil;
    if (self._dirtyTableColumnRangeIndex < 0)
        self._dirtyTableColumnRangeIndex = index;
    else
        self._dirtyTableColumnRangeIndex = MIN(index, self._dirtyTableColumnRangeIndex);
    ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", aTableColumn));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("_setDraggedColumn:"), function $CPTableView___setDraggedColumn_(self, _cmd, aColumn)
{
    if (self._draggedColumn === aColumn)
        return;
    var previouslyDraggedColumn = self._draggedColumn;
    self._draggedColumn = aColumn;
    if (aColumn)
        self.isa.objj_msgSend2(self, "reloadDataForRowIndexes:columnIndexes:", self._exposedRows, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", aColumn))));
    if (previouslyDraggedColumn)
        self.isa.objj_msgSend2(self, "reloadDataForRowIndexes:columnIndexes:", self._exposedRows, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", previouslyDraggedColumn))));
    var ___r1;
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
    ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", fromIndex));
    ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", tableColumn, toIndex));
    ((___r1 = self.isa.objj_msgSend0(self, "headerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
    ((___r1 = self.isa.objj_msgSend0(self, "headerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    var rowIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self.isa.objj_msgSend0(self, "numberOfRows"))),
        columnIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(fromIndex, toIndex));
    self.isa.objj_msgSend2(self, "reloadDataForRowIndexes:columnIndexes:", rowIndexes, columnIndexes);
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPTableViewColumnDidMoveNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", fromIndex, "CPOldColumn", toIndex, "CPNewColumn")));
    var ___r1;
}
,["void","unsigned","unsigned"]), new objj_method(sel_getUid("moveColumn:toColumn:"), function $CPTableView__moveColumn_toColumn_(self, _cmd, theColumnIndex, theToIndex)
{
    self.isa.objj_msgSend2(self, "_moveColumn:toColumn:", theColumnIndex, theToIndex);
    self.isa.objj_msgSend0(self, "_autosave");
}
,["void","CPInteger","CPInteger"]), new objj_method(sel_getUid("_tableColumnVisibilityDidChange:"), function $CPTableView___tableColumnVisibilityDidChange_(self, _cmd, aColumn)
{
    var columnIndex = ((___r1 = self.isa.objj_msgSend0(self, "tableColumns")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aColumn));
    if (self._dirtyTableColumnRangeIndex < 0)
        self._dirtyTableColumnRangeIndex = columnIndex;
    else
        self._dirtyTableColumnRangeIndex = MIN(columnIndex, self._dirtyTableColumnRangeIndex);
    ((___r1 = self.isa.objj_msgSend0(self, "headerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
    ((___r1 = self.isa.objj_msgSend0(self, "headerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    var rowIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self.isa.objj_msgSend0(self, "numberOfRows")));
    self.isa.objj_msgSend2(self, "reloadDataForRowIndexes:columnIndexes:", rowIndexes, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", columnIndex));
    var ___r1;
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
        if (((___r1 = self._tableColumns[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "identifier")) === anIdentifier)
            return index;
    return CPNotFound;
    var ___r1;
}
,["CPInteger","CPString"]), new objj_method(sel_getUid("tableColumnWithIdentifier:"), function $CPTableView__tableColumnWithIdentifier_(self, _cmd, anIdentifier)
{
    var index = self.isa.objj_msgSend1(self, "columnWithIdentifier:", anIdentifier);
    if (index === CPNotFound)
        return nil;
    return self._tableColumns[index];
}
,["CPTableColumn","CPString"]), new objj_method(sel_getUid("_didResizeTableColumn:"), function $CPTableView___didResizeTableColumn_(self, _cmd, theColumn)
{
    self.isa.objj_msgSend0(self, "_autosave");
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"), function $CPTableView__selectColumnIndexes_byExtendingSelection_(self, _cmd, columns, shouldExtendSelection)
{
    if ((columns == null ? null : columns.isa.objj_msgSend0(columns, "firstIndex")) != CPNotFound && (columns == null ? null : columns.isa.objj_msgSend0(columns, "firstIndex")) < 0 || (columns == null ? null : columns.isa.objj_msgSend0(columns, "lastIndex")) >= self.isa.objj_msgSend0(self, "numberOfColumns"))
        return;
    if (((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
    {
        self.isa.objj_msgSend2(self, "_updateHighlightWithOldRows:newRows:", self._selectedRowIndexes, CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"));
        self._selectedRowIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    }
    var previousSelectedIndexes = ((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    if (shouldExtendSelection)
        ((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addIndexes:", columns));
    else
        self._selectedColumnIndexes = (columns == null ? null : columns.isa.objj_msgSend0(columns, "copy"));
    self.isa.objj_msgSend2(self, "_updateHighlightWithOldColumns:newColumns:", previousSelectedIndexes, self._selectedColumnIndexes);
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    if (self._headerView)
        ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    self.isa.objj_msgSend0(self, "_noteSelectionDidChange");
    var ___r1;
}
,["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("_setSelectedRowIndexes:"), function $CPTableView___setSelectedRowIndexes_(self, _cmd, rows)
{
    if (((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToIndexSet:", rows)))
        return;
    var previousSelectedIndexes = self._selectedRowIndexes;
    self._lastSelectedRow = (rows == null ? null : rows.isa.objj_msgSend0(rows, "count")) > 0 ? (rows == null ? null : rows.isa.objj_msgSend0(rows, "lastIndex")) : -1;
    self._selectedRowIndexes = (rows == null ? null : rows.isa.objj_msgSend0(rows, "copy"));
    self.isa.objj_msgSend2(self, "_updateHighlightWithOldRows:newRows:", previousSelectedIndexes, self._selectedRowIndexes);
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", "selectionIndexes"));
    ((___r1 = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", "selectionIndexes", self))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "reverseSetValueFor:", "selectedRowIndexes"));
    self.isa.objj_msgSend0(self, "_noteSelectionDidChange");
    var ___r1;
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"), function $CPTableView__selectRowIndexes_byExtendingSelection_(self, _cmd, rows, shouldExtendSelection)
{
    if ((rows == null ? null : rows.isa.objj_msgSend1(rows, "isEqualToIndexSet:", self._selectedRowIndexes)) || ((rows == null ? null : rows.isa.objj_msgSend0(rows, "firstIndex")) != CPNotFound && (rows == null ? null : rows.isa.objj_msgSend0(rows, "firstIndex")) < 0 || (rows == null ? null : rows.isa.objj_msgSend0(rows, "lastIndex")) >= self.isa.objj_msgSend0(self, "numberOfRows")) || self.isa.objj_msgSend0(self, "numberOfColumns") <= 0)
        return;
    if (((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
    {
        self.isa.objj_msgSend2(self, "_updateHighlightWithOldColumns:newColumns:", self._selectedColumnIndexes, CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"));
        self._selectedColumnIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
        if (self._headerView)
            ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    }
    var newSelectedIndexes;
    if (shouldExtendSelection)
    {
        newSelectedIndexes = ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (newSelectedIndexes == null ? null : newSelectedIndexes.isa.objj_msgSend1(newSelectedIndexes, "addIndexes:", rows));
    }
    else
        newSelectedIndexes = (rows == null ? null : rows.isa.objj_msgSend0(rows, "copy"));
    self.isa.objj_msgSend1(self, "_setSelectedRowIndexes:", newSelectedIndexes);
    var ___r1;
}
,["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("_cleanUpSelectionRowIndexes:"), function $CPTableView___cleanUpSelectionRowIndexes_(self, _cmd, anIndexSet)
{
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToSelectionIndexesForProposedSelection"))
    {
        return self.isa.objj_msgSend1(self, "_sendDelegateSelectionIndexesForProposedSelection:", anIndexSet);
    }
    else if (self.isa.objj_msgSend0(self, "_delegateRespondsToShouldSelectRow"))
    {
        var indexesToRemove = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "new"),
            currentIndex = (anIndexSet == null ? null : anIndexSet.isa.objj_msgSend0(anIndexSet, "firstIndex"));
        while (currentIndex != CPNotFound)
        {
            if (!self.isa.objj_msgSend1(self, "_sendDelegateShouldSelectRow:", currentIndex))
                (indexesToRemove == null ? null : indexesToRemove.isa.objj_msgSend1(indexesToRemove, "addIndex:", currentIndex));
            currentIndex = (anIndexSet == null ? null : anIndexSet.isa.objj_msgSend1(anIndexSet, "indexGreaterThanIndex:", currentIndex));
        }
        (anIndexSet == null ? null : anIndexSet.isa.objj_msgSend1(anIndexSet, "removeIndexes:", indexesToRemove));
        return anIndexSet;
    }
    else
        return anIndexSet;
}
,["CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_updateHighlightWithOldRows:newRows:"), function $CPTableView___updateHighlightWithOldRows_newRows_(self, _cmd, oldRows, newRows)
{
    var firstExposedRow = ((___r1 = self._exposedRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")),
        exposedLength = ((___r1 = self._exposedRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex")) - firstExposedRow + 1,
        deselectRows = [],
        selectRows = [],
        deselectRowIndexes = (oldRows == null ? null : oldRows.isa.objj_msgSend0(oldRows, "copy")),
        selectRowIndexes = (newRows == null ? null : newRows.isa.objj_msgSend0(newRows, "copy"));
    (deselectRowIndexes == null ? null : deselectRowIndexes.isa.objj_msgSend1(deselectRowIndexes, "removeMatches:", selectRowIndexes));
    (deselectRowIndexes == null ? null : deselectRowIndexes.isa.objj_msgSend3(deselectRowIndexes, "getIndexes:maxCount:inIndexRange:", deselectRows, -1, CPMakeRange(firstExposedRow, exposedLength)));
    (selectRowIndexes == null ? null : selectRowIndexes.isa.objj_msgSend3(selectRowIndexes, "getIndexes:maxCount:inIndexRange:", selectRows, -1, CPMakeRange(firstExposedRow, exposedLength)));
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
                (view == null ? null : view.isa.objj_msgSend2(view, "performSelector:withObject:", selectors[info.selectorIndex], CPThemeStateSelectedDataView));
            }
        }
    }
    var ___r1;
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_updateHighlightWithOldColumns:newColumns:"), function $CPTableView___updateHighlightWithOldColumns_newColumns_(self, _cmd, oldColumns, newColumns)
{
    var firstExposedColumn = ((___r1 = self._exposedColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")),
        exposedLength = ((___r1 = self._exposedColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex")) - firstExposedColumn + 1,
        deselectColumns = [],
        selectColumns = [],
        deselectColumnIndexes = (oldColumns == null ? null : oldColumns.isa.objj_msgSend0(oldColumns, "copy")),
        selectColumnIndexes = (newColumns == null ? null : newColumns.isa.objj_msgSend0(newColumns, "copy")),
        selectRows = [];
    (deselectColumnIndexes == null ? null : deselectColumnIndexes.isa.objj_msgSend1(deselectColumnIndexes, "removeMatches:", selectColumnIndexes));
    (deselectColumnIndexes == null ? null : deselectColumnIndexes.isa.objj_msgSend3(deselectColumnIndexes, "getIndexes:maxCount:inIndexRange:", deselectColumns, -1, CPMakeRange(firstExposedColumn, exposedLength)));
    (selectColumnIndexes == null ? null : selectColumnIndexes.isa.objj_msgSend3(selectColumnIndexes, "getIndexes:maxCount:inIndexRange:", selectColumns, -1, CPMakeRange(firstExposedColumn, exposedLength)));
    ((___r1 = self._exposedRows), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "getIndexes:maxCount:inIndexRange:", selectRows, -1, nil));
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
                identifier = ((___r1 = self._tableColumns[columnIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID")),
                dataViewsInTableColumn = self._dataViewsForTableColumns[identifier];
            for (var i = 0; i < rowsCount; i++)
            {
                var rowIndex = selectRows[i],
                    dataView = dataViewsInTableColumn[rowIndex];
                (dataView == null ? null : dataView.isa.objj_msgSend2(dataView, "performSelector:withObject:", rowSelector, CPThemeStateSelectedDataView));
            }
            if (self._headerView)
            {
                var headerView = ((___r1 = self._tableColumns[columnIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "headerView"));
                (headerView == null ? null : headerView.isa.objj_msgSend2(headerView, "performSelector:withObject:", headerSelector, CPThemeStateSelected));
            }
        }
    }
    var ___r1;
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("selectedColumn"), function $CPTableView__selectedColumn(self, _cmd)
{
    return ((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex"));
    var ___r1;
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
    return ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    var ___r1;
}
,["CPIndexSet"]), new objj_method(sel_getUid("deselectColumn:"), function $CPTableView__deselectColumn_(self, _cmd, anIndex)
{
    var selectedColumnIndexes = ((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    (selectedColumnIndexes == null ? null : selectedColumnIndexes.isa.objj_msgSend1(selectedColumnIndexes, "removeIndex:", anIndex));
    self.isa.objj_msgSend2(self, "selectColumnIndexes:byExtendingSelection:", selectedColumnIndexes, NO);
    self.isa.objj_msgSend0(self, "_noteSelectionDidChange");
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("deselectRow:"), function $CPTableView__deselectRow_(self, _cmd, aRow)
{
    var selectedRowIndexes = ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    (selectedRowIndexes == null ? null : selectedRowIndexes.isa.objj_msgSend1(selectedRowIndexes, "removeIndex:", aRow));
    self.isa.objj_msgSend2(self, "selectRowIndexes:byExtendingSelection:", selectedRowIndexes, NO);
    self.isa.objj_msgSend0(self, "_noteSelectionDidChange");
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("numberOfSelectedColumns"), function $CPTableView__numberOfSelectedColumns(self, _cmd)
{
    return ((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["CPInteger"]), new objj_method(sel_getUid("numberOfSelectedRows"), function $CPTableView__numberOfSelectedRows(self, _cmd)
{
    return ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["CPInteger"]), new objj_method(sel_getUid("isColumnSelected:"), function $CPTableView__isColumnSelected_(self, _cmd, anIndex)
{
    return ((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsIndex:", anIndex));
    var ___r1;
}
,["BOOL","CPInteger"]), new objj_method(sel_getUid("isRowSelected:"), function $CPTableView__isRowSelected_(self, _cmd, aRow)
{
    return ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsIndex:", aRow));
    var ___r1;
}
,["BOOL","CPInteger"]), new objj_method(sel_getUid("deselectAll"), function $CPTableView__deselectAll(self, _cmd)
{
    self.isa.objj_msgSend2(self, "selectRowIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"), NO);
    self.isa.objj_msgSend2(self, "selectColumnIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"), NO);
}
,["void"]), new objj_method(sel_getUid("selectAll:"), function $CPTableView__selectAll_(self, _cmd, sender)
{
    if (self._allowsMultipleSelection)
    {
        if (!self.isa.objj_msgSend0(self, "_sendDelegateSelectionShouldChangeInTableView"))
            return;
        if (((___r1 = self.isa.objj_msgSend0(self, "selectedColumnIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
            self.isa.objj_msgSend2(self, "selectColumnIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self.isa.objj_msgSend0(self, "numberOfColumns"))), NO);
        else
        {
            var range = self.isa.objj_msgSend1(self, "_cleanUpSelectionRowIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self.isa.objj_msgSend0(self, "numberOfRows"))));
            self.isa.objj_msgSend2(self, "selectRowIndexes:byExtendingSelection:", range, NO);
        }
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("deselectAll:"), function $CPTableView__deselectAll_(self, _cmd, sender)
{
    if (self.isa.objj_msgSend0(self, "allowsEmptySelection"))
    {
        if (!self.isa.objj_msgSend0(self, "_sendDelegateSelectionShouldChangeInTableView"))
            return;
        self.isa.objj_msgSend0(self, "deselectAll");
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
    var contentBindingInfo = self.isa.objj_msgSend1(self, "infoForBinding:", "content");
    if (contentBindingInfo)
    {
        var destination = (contentBindingInfo == null ? null : contentBindingInfo.isa.objj_msgSend1(contentBindingInfo, "objectForKey:", CPObservedObjectKey)),
            keyPath = (contentBindingInfo == null ? null : contentBindingInfo.isa.objj_msgSend1(contentBindingInfo, "objectForKey:", CPObservedKeyPathKey));
        self._numberOfRows = ((___r1 = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKeyPath:", keyPath))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    }
    else
    {
        self._numberOfRows = self.isa.objj_msgSend0(self, "_sendDataSourceNumberOfRowsInTableView");
        if (!self._numberOfRows)
        {
            if (self._dataSource && !self.isa.objj_msgSend0(self, "_dataSourceRespondsToNumberOfRowsinTableView"))
                CPLog("no content binding established and data source " + ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + " does not implement numberOfRowsInTableView:");
            self._numberOfRows = 0;
        }
    }
    return self._numberOfRows;
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("editColumn:row:withEvent:select:"), function $CPTableView__editColumn_row_withEvent_select_(self, _cmd, columnIndex, rowIndex, theEvent, flag)
{
    if (self._isViewBased)
    {
        var identifier = ((___r1 = self._tableColumns[columnIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID")),
            view = self._dataViewsForTableColumns[identifier][rowIndex];
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", view));
    }
    else
    {
        if (!self.isa.objj_msgSend1(self, "isRowSelected:", rowIndex))
            ((___r1 = CPException.isa.objj_msgSend3(CPException, "exceptionWithName:reason:userInfo:", "Error", "Attempt to edit row=" + rowIndex + " when not selected.", nil)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "raise"));
        self.isa.objj_msgSend1(self, "scrollRowToVisible:", rowIndex);
        self.isa.objj_msgSend1(self, "scrollColumnToVisible:", columnIndex);
        self._editingCellIndex = CGPointMake(columnIndex, rowIndex);
        self._editingCellIndex._shouldSelect = flag;
        self.isa.objj_msgSend2(self, "reloadDataForRowIndexes:columnIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", rowIndex), CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", columnIndex));
    }
    var ___r1;
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
    var scrollView = self.isa.objj_msgSend0(self, "enclosingScrollView");
    if ((scrollView == null ? null : scrollView.isa.objj_msgSend1(scrollView, "isKindOfClass:", CPScrollView.isa.objj_msgSend0(CPScrollView, "class"))) && (scrollView == null ? null : scrollView.isa.objj_msgSend0(scrollView, "documentView")) === self)
        (scrollView == null ? null : scrollView.isa.objj_msgSend0(scrollView, "_updateCornerAndHeaderView"));
}
,["void","CPView"]), new objj_method(sel_getUid("headerView"), function $CPTableView__headerView(self, _cmd)
{
    return self._headerView;
}
,["CPView"]), new objj_method(sel_getUid("setHeaderView:"), function $CPTableView__setHeaderView_(self, _cmd, aHeaderView)
{
    if (self._headerView === aHeaderView)
        return;
    ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTableView:", nil));
    self._headerView = aHeaderView;
    if (self._headerView)
    {
        ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTableView:", self));
        ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")), CGRectGetHeight(((___r2 = self._headerView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))))));
    }
    else
    {
        ((___r1 = self._cornerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        self._cornerView = nil;
    }
    var scrollView = self.isa.objj_msgSend0(self, "enclosingScrollView");
    if ((scrollView == null ? null : scrollView.isa.objj_msgSend1(scrollView, "isKindOfClass:", CPScrollView.isa.objj_msgSend0(CPScrollView, "class"))) && (scrollView == null ? null : scrollView.isa.objj_msgSend0(scrollView, "documentView")) === self)
        (scrollView == null ? null : scrollView.isa.objj_msgSend0(scrollView, "_updateCornerAndHeaderView"));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1, ___r2;
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
        if ((tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "isHidden")))
        {
            self._numberOfHiddenColumns += 1;
            self._tableColumnRanges[index] = CPMakeRange(x, 0.0);
        }
        else
        {
            var width = ((___r1 = self._tableColumns[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "width")) + self._intercellSpacing.width;
            self._tableColumnRanges[index] = CPMakeRange(x, width);
            x += width;
        }
    }
    self._tableColumnRanges.length = count;
    self._dirtyTableColumnRangeIndex = CPNotFound;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("rectOfColumn:"), function $CPTableView__rectOfColumn_(self, _cmd, aColumnIndex)
{
    aColumnIndex = +aColumnIndex;
    if (aColumnIndex < 0 || aColumnIndex >= self._tableColumns.length)
        return CGRectMakeZero();
    if (((___r1 = ((___r2 = self._tableColumns), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", aColumnIndex))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        return CGRectMakeZero();
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        self.isa.objj_msgSend0(self, "_recalculateTableColumnRanges");
    var range = self._tableColumnRanges[aColumnIndex];
    return CGRectMake(range.location, 0.0, range.length, CGRectGetHeight(self.isa.objj_msgSend0(self, "bounds")));
    var ___r1, ___r2;
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("_rectOfRow:checkRange:"), function $CPTableView___rectOfRow_checkRange_(self, _cmd, aRowIndex, checkRange)
{
    var lastIndex = self.isa.objj_msgSend0(self, "numberOfRows") - 1,
        validIndex = aRowIndex >= 0 && aRowIndex <= lastIndex;
    if (checkRange && !validIndex)
        return CGRectMakeZero();
    var y = 0,
        height,
        fixedHeightRows = 0;
    if (self._implementedDelegateMethods & CPTableViewDelegate_tableView_heightOfRow_)
    {
        self.isa.objj_msgSend0(self, "_populateRowHeightCacheIfNeeded");
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
    return CGRectMake(0.0, y, CGRectGetWidth(self.isa.objj_msgSend0(self, "bounds")), height);
}
,["CGRect","CPInteger","BOOL"]), new objj_method(sel_getUid("rectOfRow:"), function $CPTableView__rectOfRow_(self, _cmd, aRowIndex)
{
    return self.isa.objj_msgSend2(self, "_rectOfRow:checkRange:", aRowIndex, YES);
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("rowsInRect:"), function $CPTableView__rowsInRect_(self, _cmd, aRect)
{
    if (self._numberOfRows <= 0)
        return CPMakeRange(0, 0);
    var bounds = self.isa.objj_msgSend0(self, "bounds");
    if (!CGRectIntersectsRect(aRect, bounds))
        return CPMakeRange(0, 0);
    var firstRow = self.isa.objj_msgSend1(self, "rowAtPoint:", aRect.origin);
    if (firstRow < 0)
        firstRow = 0;
    var lastRow = self.isa.objj_msgSend1(self, "rowAtPoint:", CGPointMake(0.0, CGRectGetMaxY(aRect)));
    if (lastRow < 0)
        lastRow = self._numberOfRows - 1;
    return CPMakeRange(firstRow, lastRow - firstRow + 1);
}
,["CPRange","CGRect"]), new objj_method(sel_getUid("_exposedRowsInRect:"), function $CPTableView___exposedRowsInRect_(self, _cmd, aRect)
{
    var rowRange = self.isa.objj_msgSend1(self, "rowsInRect:", aRect),
        lastRealRow = CPMaxRange(rowRange) - 1,
        rectOfLastRealRow = self.isa.objj_msgSend2(self, "_rectOfRow:checkRange:", lastRealRow, NO),
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
    var column = MAX(0, self.isa.objj_msgSend1(self, "columnAtPoint:", CGPointMake(aRect.origin.x, 0.0))),
        lastColumn = self.isa.objj_msgSend1(self, "columnAtPoint:", CGPointMake(CGRectGetMaxX(aRect), 0.0));
    if (lastColumn === CPNotFound)
        lastColumn = self._tableColumns.length - 1;
    if (self._numberOfHiddenColumns <= 0)
        return CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(column, lastColumn - column + 1));
    var indexSet = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    for (; column <= lastColumn; ++column)
    {
        var tableColumn = self._tableColumns[column];
        if (!(tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "isHidden")))
            (indexSet == null ? null : indexSet.isa.objj_msgSend1(indexSet, "addIndex:", column));
    }
    return indexSet;
}
,["CPIndexSet","CGRect"]), new objj_method(sel_getUid("columnAtPoint:"), function $CPTableView__columnAtPoint_(self, _cmd, aPoint)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds");
    if (!CGRectContainsPoint(bounds, aPoint))
        return CPNotFound;
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        self.isa.objj_msgSend0(self, "_recalculateTableColumnRanges");
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
            while (middle < numberOfColumns && ((___r1 = self._tableColumns[middle]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
                ++middle;
            if (middle < numberOfColumns)
                return middle;
            return CPNotFound;
        }
    }
    return CPNotFound;
    var ___r1;
}
,["CPInteger","CGPoint"]), new objj_method(sel_getUid("rowAtPoint:"), function $CPTableView__rowAtPoint_(self, _cmd, aPoint)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds");
    if (aPoint.x < CGRectGetMinX(bounds) || aPoint.x >= CGRectGetMaxX(bounds))
        return -1;
    if (self._implementedDelegateMethods & CPTableViewDelegate_tableView_heightOfRow_)
    {
        var heightInfo = ((___r1 = self._cachedRowHeights), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastObject"));
        if (!heightInfo || aPoint.y >= heightInfo.y + heightInfo.height + self._intercellSpacing.height)
            return -1;
        return ((___r1 = self._cachedRowHeights), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "indexOfObject:inSortedRange:options:usingComparator:", aPoint, nil, 0, function(aPoint, heightInfo)
        {
            if (aPoint.y < heightInfo.y)
                return CPOrderedAscending;
            if (aPoint.y > heightInfo.y + heightInfo.height + self._intercellSpacing.height)
                return CPOrderedDescending;
            return CPOrderedSame;
        }));
    }
    else
    {
        var row = FLOOR(aPoint.y / (self._rowHeight + self._intercellSpacing.height));
        return row >= self._numberOfRows ? -1 : row;
    }
    var ___r1;
}
,["CPInteger","CGPoint"]), new objj_method(sel_getUid("rowForView:"), function $CPTableView__rowForView_(self, _cmd, aView)
{
    return self.isa.objj_msgSend2(self, "rowNotColumn:forView:", YES, aView);
}
,["CPInteger","CPView"]), new objj_method(sel_getUid("columnForView:"), function $CPTableView__columnForView_(self, _cmd, aView)
{
    return self.isa.objj_msgSend2(self, "rowNotColumn:forView:", NO, aView);
}
,["CPInteger","CPView"]), new objj_method(sel_getUid("rowNotColumn:forView:"), function $CPTableView__rowNotColumn_forView_(self, _cmd, isRow, aView)
{
    if (!(aView == null ? null : aView.isa.objj_msgSend1(aView, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))))
        return -1;
    var cellView = aView,
        contentView = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentView")),
        max_rec = 100;
    while (max_rec--)
    {
        if (!cellView || cellView === contentView)
        {
            return -1;
        }
        else
        {
            var superview = (cellView == null ? null : cellView.isa.objj_msgSend0(cellView, "superview"));
            if ((superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", CPTableView.isa.objj_msgSend0(CPTableView, "class"))))
            {
                break;
            }
            cellView = superview;
        }
    }
    var exposedRows = [],
        exposedColumns = [];
    ((___r1 = self._exposedRows), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "getIndexes:maxCount:inIndexRange:", exposedRows, -1, nil));
    ((___r1 = self._exposedColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "getIndexes:maxCount:inIndexRange:", exposedColumns, -1, nil));
    var colcount = exposedColumns.length,
        countOfRows = exposedRows.length;
    while (colcount--)
    {
        var column = exposedColumns[colcount],
            tableColumnUID = ((___r1 = self._tableColumns[column]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID")),
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
    var ___r1;
}
,["CPInteger","BOOL","CPView"]), new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"), function $CPTableView__frameOfDataViewAtColumn_row_(self, _cmd, aColumn, aRow)
{
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        self.isa.objj_msgSend0(self, "_recalculateTableColumnRanges");
    if (aColumn > self.isa.objj_msgSend0(self, "numberOfColumns") || aRow > self.isa.objj_msgSend0(self, "numberOfRows"))
        return CGRectMakeZero();
    var tableColumnRange = self._tableColumnRanges[aColumn],
        rectOfRow = self.isa.objj_msgSend1(self, "rectOfRow:", aRow),
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
        var superview = self.isa.objj_msgSend0(self, "superview");
        if (!superview || !(superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", (CPClipView == null ? null : CPClipView.isa.objj_msgSend0(CPClipView, "class")))))
            return;
        var superviewWidth = (superview == null ? null : superview.isa.objj_msgSend0(superview, "bounds")).size.width,
            lastColumnMaxX = CGRectGetMaxX(self.isa.objj_msgSend1(self, "rectOfColumn:", self.isa.objj_msgSend0(self, "numberOfColumns") - 1));
        if (lastColumnMaxX >= superviewWidth && lastColumnMaxX <= aSize.width || lastColumnMaxX <= superviewWidth && lastColumnMaxX >= aSize.width)
            self._lastColumnShouldSnap = YES;
        else if (mask === CPTableViewUniformColumnAutoresizingStyle)
            return;
    }
    if (mask === CPTableViewUniformColumnAutoresizingStyle)
        self.isa.objj_msgSend1(self, "_resizeAllColumnUniformlyWithOldSize:", aSize);
    else if (mask === CPTableViewLastColumnOnlyAutoresizingStyle)
        self.isa.objj_msgSend0(self, "sizeLastColumnToFit");
    else if (mask === CPTableViewFirstColumnOnlyAutoresizingStyle)
        self.isa.objj_msgSend0(self, "_autoResizeFirstColumn");
}
,["void","CGSize"]), new objj_method(sel_getUid("_autoResizeFirstColumn"), function $CPTableView___autoResizeFirstColumn(self, _cmd)
{
    var superview = self.isa.objj_msgSend0(self, "superview");
    if (!superview)
        return;
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        self.isa.objj_msgSend0(self, "_recalculateTableColumnRanges");
    var count = self._tableColumns.length,
        columnToResize = nil,
        totalWidth = 0,
        i = 0;
    for (; i < count; i++)
    {
        var column = self._tableColumns[i];
        if (!(column == null ? null : column.isa.objj_msgSend0(column, "isHidden")))
        {
            if (!columnToResize)
                columnToResize = column;
            totalWidth += (column == null ? null : column.isa.objj_msgSend0(column, "width")) + self._intercellSpacing.width;
        }
    }
    if (columnToResize)
    {
        var superviewSize = (superview == null ? null : superview.isa.objj_msgSend0(superview, "bounds")).size,
            newWidth = superviewSize.width - totalWidth;
        newWidth += (columnToResize == null ? null : columnToResize.isa.objj_msgSend0(columnToResize, "width"));
        (columnToResize == null ? null : columnToResize.isa.objj_msgSend1(columnToResize, "_tryToResizeToWidth:", newWidth));
    }
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("_resizeAllColumnUniformlyWithOldSize:"), function $CPTableView___resizeAllColumnUniformlyWithOldSize_(self, _cmd, oldSize)
{
    var superview = self.isa.objj_msgSend0(self, "superview");
    if (!superview || !(superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", (CPClipView == null ? null : CPClipView.isa.objj_msgSend0(CPClipView, "class")))))
        return;
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        self.isa.objj_msgSend0(self, "_recalculateTableColumnRanges");
    var superviewWidth = (superview == null ? null : superview.isa.objj_msgSend0(superview, "bounds")).size.width,
        count = self._tableColumns.length,
        resizableColumns = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"),
        remainingSpace = 0.0,
        i = 0;
    for (; i < count; i++)
    {
        var tableColumn = self._tableColumns[i];
        if (!(tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "isHidden")) && (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "resizingMask")) & CPTableColumnAutoresizingMask)
            (resizableColumns == null ? null : resizableColumns.isa.objj_msgSend1(resizableColumns, "addIndex:", i));
    }
    var maxXofColumns = CGRectGetMaxX(self.isa.objj_msgSend1(self, "rectOfColumn:", (resizableColumns == null ? null : resizableColumns.isa.objj_msgSend0(resizableColumns, "lastIndex")))),
        remainingSpace = superviewWidth - maxXofColumns,
        resizeableColumnsCount = (resizableColumns == null ? null : resizableColumns.isa.objj_msgSend0(resizableColumns, "count")),
        proportionate = 0;
    while (remainingSpace && resizeableColumnsCount)
    {
        proportionate += remainingSpace / resizeableColumnsCount;
        remainingSpace = 0.0;
        var index = CPNotFound;
        while ((index = (resizableColumns == null ? null : resizableColumns.isa.objj_msgSend1(resizableColumns, "indexGreaterThanIndex:", index))) !== CPNotFound)
        {
            var item = self._tableColumns[index],
                proposedWidth = (item == null ? null : item.isa.objj_msgSend0(item, "width")) + proportionate,
                resizeLeftovers = (item == null ? null : item.isa.objj_msgSend1(item, "_tryToResizeToWidth:", proposedWidth));
            if (resizeLeftovers)
            {
                (resizableColumns == null ? null : resizableColumns.isa.objj_msgSend1(resizableColumns, "removeIndex:", index));
                remainingSpace += resizeLeftovers;
            }
        }
    }
    while (count-- && ((___r1 = self._tableColumns[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")));
    var delta = superviewWidth - CGRectGetMaxX(self.isa.objj_msgSend1(self, "rectOfColumn:", count)) - (self.isa.objj_msgSend0(self, "intercellSpacing").width || 1),
        newSize = (item == null ? null : item.isa.objj_msgSend0(item, "width")) + delta;
    (item == null ? null : item.isa.objj_msgSend1(item, "_tryToResizeToWidth:", newSize));
    var ___r1;
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
    var superview = self.isa.objj_msgSend0(self, "superview");
    if (!superview)
        return;
    var superviewSize = (superview == null ? null : superview.isa.objj_msgSend0(superview, "bounds")).size;
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        self.isa.objj_msgSend0(self, "_recalculateTableColumnRanges");
    var count = self._tableColumns.length;
    while (count-- && ((___r1 = self._tableColumns[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")));
    if (count >= 0)
    {
        var columnToResize = self._tableColumns[count],
            newSize = MAX(0.0, superviewSize.width - CGRectGetMinX(self.isa.objj_msgSend1(self, "rectOfColumn:", count)) - self._intercellSpacing.width);
        (columnToResize == null ? null : columnToResize.isa.objj_msgSend1(columnToResize, "_tryToResizeToWidth:", newSize));
    }
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("noteNumberOfRowsChanged"), function $CPTableView__noteNumberOfRowsChanged(self, _cmd)
{
    var oldNumberOfRows = self._numberOfRows;
    self._numberOfRows = nil;
    self._cachedRowHeights = [];
    self.isa.objj_msgSend1(self, "noteHeightOfRowsWithIndexesChanged:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self.isa.objj_msgSend0(self, "numberOfRows"))));
    var hangingSelections = oldNumberOfRows - self._numberOfRows;
    if (hangingSelections > 0)
    {
        var previousSelectionCount = ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeIndexesInRange:", CPMakeRange(self._numberOfRows, hangingSelections)));
        if (!((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsIndex:", self.isa.objj_msgSend0(self, "selectedRow"))))
            self._lastSelectedRow = CPNotFound;
        if (previousSelectionCount > ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
            self.isa.objj_msgSend0(self, "_noteSelectionDidChange");
    }
    self.isa.objj_msgSend0(self, "tile");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_populateRowHeightCacheIfNeeded"), function $CPTableView___populateRowHeightCacheIfNeeded(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "numberOfRows") !== self._cachedRowHeights.length)
        self.isa.objj_msgSend1(self, "noteHeightOfRowsWithIndexesChanged:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self._numberOfRows)));
}
,["void"]), new objj_method(sel_getUid("noteHeightOfRowsWithIndexesChanged:"), function $CPTableView__noteHeightOfRowsWithIndexesChanged_(self, _cmd, anIndexSet)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_heightOfRow_))
        return;
    var i = (anIndexSet == null ? null : anIndexSet.isa.objj_msgSend1(anIndexSet, "indexGreaterThanOrEqualToIndex:", 0));
    if (i === CPNotFound)
        return;
    var y = i < self._cachedRowHeights.length ? self._cachedRowHeights[i].y : 0;
    for (var count = self.isa.objj_msgSend0(self, "numberOfRows"); i < count; ++i)
    {
        var height;
        if ((anIndexSet == null ? null : anIndexSet.isa.objj_msgSend1(anIndexSet, "containsIndex:", i)))
            height = self.isa.objj_msgSend1(self, "_sendDelegateHeightOfRow:", i);
        else
            height = self._cachedRowHeights[i].height || self._rowHeight;
        self._cachedRowHeights[i] = {y: y, height: height};
        y += height + self._intercellSpacing.height;
    }
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("tile"), function $CPTableView__tile(self, _cmd)
{
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        self.isa.objj_msgSend0(self, "_recalculateTableColumnRanges");
    var width = self._tableColumnRanges.length > 0 ? CPMaxRange(((___r1 = self._tableColumnRanges), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastObject"))) : 0.0,
        superview = self.isa.objj_msgSend0(self, "superview"),
        height = 0;
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_heightOfRow_))
        height = (self._rowHeight + self._intercellSpacing.height) * self._numberOfRows;
    else if (self._numberOfRows > 0)
    {
        self.isa.objj_msgSend0(self, "_populateRowHeightCacheIfNeeded");
        var heightInfo = self._cachedRowHeights[self._cachedRowHeights.length - 1];
        height = heightInfo.y + heightInfo.height + self._intercellSpacing.height;
    }
    if ((superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", (CPClipView == null ? null : CPClipView.isa.objj_msgSend0(CPClipView, "class")))))
    {
        var superviewSize = (superview == null ? null : superview.isa.objj_msgSend0(superview, "bounds")).size;
        width = MAX(superviewSize.width, width);
        height = MAX(superviewSize.height, height);
    }
    self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(width, height));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("scrollRowToVisible:"), function $CPTableView__scrollRowToVisible_(self, _cmd, rowIndex)
{
    var visible = self.isa.objj_msgSend0(self, "visibleRect"),
        rowRect = self.isa.objj_msgSend1(self, "rectOfRow:", rowIndex);
    visible.origin.y = rowRect.origin.y;
    visible.size.height = rowRect.size.height;
    self.isa.objj_msgSend1(self, "scrollRectToVisible:", visible);
}
,["void","int"]), new objj_method(sel_getUid("scrollColumnToVisible:"), function $CPTableView__scrollColumnToVisible_(self, _cmd, columnIndex)
{
    var visible = self.isa.objj_msgSend0(self, "visibleRect"),
        colRect = self.isa.objj_msgSend1(self, "rectOfColumn:", columnIndex);
    visible.origin.x = colRect.origin.x;
    visible.size.width = colRect.size.width;
    self.isa.objj_msgSend1(self, "scrollRectToVisible:", visible);
    ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollRectToVisible:", colRect));
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("setAutosaveName:"), function $CPTableView__setAutosaveName_(self, _cmd, theAutosaveName)
{
    if (self._autosaveName === theAutosaveName)
        return;
    self._autosaveName = theAutosaveName;
    self.isa.objj_msgSend1(self, "setAutosaveTableColumns:", !!theAutosaveName);
    self.isa.objj_msgSend0(self, "_restoreFromAutosave");
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
    return self.isa.objj_msgSend0(self, "autosaveName") && self.isa.objj_msgSend0(self, "autosaveTableColumns");
}
,["BOOL"]), new objj_method(sel_getUid("_autosave"), function $CPTableView___autosave(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "_autosaveEnabled"))
        return;
    var userDefaults = (CPUserDefaults == null ? null : CPUserDefaults.isa.objj_msgSend0(CPUserDefaults, "standardUserDefaults")),
        autosaveName = self.isa.objj_msgSend0(self, "autosaveName");
    var columns = self.isa.objj_msgSend0(self, "tableColumns"),
        columnsSetup = [];
    for (var i = 0; i < (columns == null ? null : columns.isa.objj_msgSend0(columns, "count")); i++)
    {
        var column = (columns == null ? null : columns.isa.objj_msgSend1(columns, "objectAtIndex:", i)),
            metaData = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", (column == null ? null : column.isa.objj_msgSend0(column, "identifier")), "identifier", (column == null ? null : column.isa.objj_msgSend0(column, "width")), "width");
        (columnsSetup == null ? null : columnsSetup.isa.objj_msgSend1(columnsSetup, "addObject:", metaData));
    }
    (userDefaults == null ? null : userDefaults.isa.objj_msgSend2(userDefaults, "setObject:forKey:", columnsSetup, self.isa.objj_msgSend1(self, "_columnsKeyForAutosaveName:", autosaveName)));
}
,["void"]), new objj_method(sel_getUid("_restoreFromAutosave"), function $CPTableView___restoreFromAutosave(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "_autosaveEnabled"))
        return;
    var userDefaults = (CPUserDefaults == null ? null : CPUserDefaults.isa.objj_msgSend0(CPUserDefaults, "standardUserDefaults")),
        autosaveName = self.isa.objj_msgSend0(self, "autosaveName"),
        tableColumns = (userDefaults == null ? null : userDefaults.isa.objj_msgSend1(userDefaults, "objectForKey:", self.isa.objj_msgSend1(self, "_columnsKeyForAutosaveName:", autosaveName)));
    if ((tableColumns == null ? null : tableColumns.isa.objj_msgSend0(tableColumns, "count")) != ((___r1 = self.isa.objj_msgSend0(self, "tableColumns")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        return;
    for (var i = 0; i < (tableColumns == null ? null : tableColumns.isa.objj_msgSend0(tableColumns, "count")); i++)
    {
        var metaData = (tableColumns == null ? null : tableColumns.isa.objj_msgSend1(tableColumns, "objectAtIndex:", i)),
            columnIdentifier = (metaData == null ? null : metaData.isa.objj_msgSend1(metaData, "objectForKey:", "identifier")),
            column = self.isa.objj_msgSend1(self, "columnWithIdentifier:", columnIdentifier),
            tableColumn = self.isa.objj_msgSend1(self, "tableColumnWithIdentifier:", columnIdentifier);
        if (tableColumn && column != CPNotFound)
        {
            self.isa.objj_msgSend2(self, "_moveColumn:toColumn:", column, i);
            (tableColumn == null ? null : tableColumn.isa.objj_msgSend1(tableColumn, "setWidth:", (metaData == null ? null : metaData.isa.objj_msgSend1(metaData, "objectForKey:", "width"))));
        }
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setDelegate:"), function $CPTableView__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (self._delegate)
    {
        if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPTableViewColumnDidMoveNotification, self));
        if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPTableViewColumnDidResizeNotification, self));
        if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPTableViewSelectionDidChangeNotification, self));
        if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPTableViewSelectionIsChangingNotification, self));
    }
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("selectionShouldChangeInTableView:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_selectionShouldChangeInTableView_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:viewForTableColumn:row:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_viewForTableColumn_row_;
    else if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:dataViewForTableColumn:row:"))))
    {
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_dataViewForTableColumn_row_;
        CPLog.warn("tableView:dataViewForTableColumn: is deprecated. You should use -tableView:viewForTableColumn: where you can request the view with -makeViewWithIdentifier:owner:");
    }
    self.isa.objj_msgSend0(self, "_updateIsViewBased");
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:didClickTableColumn:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_didClickTableColumn_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:didDragTableColumn:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_didDragTableColumn_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:heightOfRow:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_heightOfRow_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:isGroupRow:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_isGroupRow_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:mouseDownInHeaderOfTableColumn:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_mouseDownInHeaderOfTableColumn_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_nextTypeSelectMatchFromRow_toRow_forString_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:selectionIndexesForProposedSelection:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:shouldEditTableColumn:row:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldEditTableColumn_row_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:shouldSelectRow:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldSelectRow_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:shouldSelectTableColumn:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldSelectTableColumn_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldShowViewExpansionForTableColumn_row_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:shouldTrackView:forTableColumn:row:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldTrackView_forTableColumn_row_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldTypeSelectForEvent_withCurrentSearchString_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_toolTipForView_rect_tableColumn_row_mouseLocation_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:typeSelectStringForTableColumn:row:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_typeSelectStringForTableColumn_row_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:willDisplayView:forTableColumn:row:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_willDisplayView_forTableColumn_row_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:willRemoveView:forTableColumn:row:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_willRemoveView_forTableColumn_row_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:menuForTableColumn:row:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableViewMenuForTableColumn_row_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:shouldReorderColumn:toColumn:"))))
        self._implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldReorderColumn_toColumn_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("tableViewColumnDidMove:"), CPTableViewColumnDidMoveNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("tableViewColumnDidResize:"), CPTableViewColumnDidResizeNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("tableViewSelectionDidChange:"), CPTableViewSelectionDidChangeNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("tableViewSelectionIsChanging:"), CPTableViewSelectionIsChangingNotification, self));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPTableView__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("_didClickTableColumn:modifierFlags:"), function $CPTableView___didClickTableColumn_modifierFlags_(self, _cmd, clickedColumn, modifierFlags)
{
    self.isa.objj_msgSend1(self, "_changeSortDescriptorsForClickOnColumn:", clickedColumn);
    if (self._allowsColumnSelection)
    {
        if (self.isa.objj_msgSend0(self, "_sendDelegateSelectionShouldChangeInTableView") && self.isa.objj_msgSend1(self, "_sendDelegateShouldSelectTableColumn:", clickedColumn))
        {
            self.isa.objj_msgSend0(self, "_noteSelectionIsChanging");
            if (modifierFlags & CPPlatformActionKeyMask)
            {
                if (self.isa.objj_msgSend1(self, "isColumnSelected:", clickedColumn))
                    self.isa.objj_msgSend1(self, "deselectColumn:", clickedColumn);
                else if (self.isa.objj_msgSend0(self, "allowsMultipleSelection") == YES)
                    self.isa.objj_msgSend2(self, "selectColumnIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", clickedColumn), YES);
                return;
            }
            else if (modifierFlags & CPShiftKeyMask)
            {
                var startColumn = MIN(clickedColumn, ((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex"))),
                    endColumn = MAX(clickedColumn, ((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")));
                self.isa.objj_msgSend2(self, "selectColumnIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(startColumn, endColumn - startColumn + 1)), YES);
                return;
            }
            else
                self.isa.objj_msgSend2(self, "selectColumnIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", clickedColumn), NO);
        }
    }
    self.isa.objj_msgSend1(self, "_sendDelegateDidClickTableColumn:", clickedColumn);
    var ___r1;
}
,["void","CPInteger","unsigned"]), new objj_method(sel_getUid("_changeSortDescriptorsForClickOnColumn:"), function $CPTableView___changeSortDescriptorsForClickOnColumn_(self, _cmd, column)
{
    var tableColumn = ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", column)),
        newMainSortDescriptor = (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "sortDescriptorPrototype"));
    if (!newMainSortDescriptor)
        return;
    var oldMainSortDescriptor = nil,
        oldSortDescriptors = self.isa.objj_msgSend0(self, "sortDescriptors"),
        newSortDescriptors = CPArray.isa.objj_msgSend1(CPArray, "arrayWithArray:", oldSortDescriptors),
        e = (newSortDescriptors == null ? null : newSortDescriptors.isa.objj_msgSend0(newSortDescriptors, "objectEnumerator")),
        descriptor = nil,
        outdatedDescriptors = CPArray.isa.objj_msgSend0(CPArray, "array");
    if (((___r1 = self._sortDescriptors), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
        oldMainSortDescriptor = ((___r1 = self.isa.objj_msgSend0(self, "sortDescriptors")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0));
    while ((descriptor = (e == null ? null : e.isa.objj_msgSend0(e, "nextObject"))) !== nil)
    {
        if (((___r1 = (descriptor == null ? null : descriptor.isa.objj_msgSend0(descriptor, "key"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", (newMainSortDescriptor == null ? null : newMainSortDescriptor.isa.objj_msgSend0(newMainSortDescriptor, "key")))))
            (outdatedDescriptors == null ? null : outdatedDescriptors.isa.objj_msgSend1(outdatedDescriptors, "addObject:", descriptor));
    }
    if (((___r1 = (newMainSortDescriptor == null ? null : newMainSortDescriptor.isa.objj_msgSend0(newMainSortDescriptor, "key"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", (oldMainSortDescriptor == null ? null : oldMainSortDescriptor.isa.objj_msgSend0(oldMainSortDescriptor, "key")))))
        newMainSortDescriptor = (oldMainSortDescriptor == null ? null : oldMainSortDescriptor.isa.objj_msgSend0(oldMainSortDescriptor, "reversedSortDescriptor"));
    (newSortDescriptors == null ? null : newSortDescriptors.isa.objj_msgSend1(newSortDescriptors, "removeObjectsInArray:", outdatedDescriptors));
    (newSortDescriptors == null ? null : newSortDescriptors.isa.objj_msgSend2(newSortDescriptors, "insertObject:atIndex:", newMainSortDescriptor, 0));
    self.isa.objj_msgSend1(self, "setHighlightedTableColumn:", tableColumn);
    self.isa.objj_msgSend1(self, "setSortDescriptors:", newSortDescriptors);
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("setIndicatorImage:inTableColumn:"), function $CPTableView__setIndicatorImage_inTableColumn_(self, _cmd, anImage, aTableColumn)
{
    if (aTableColumn)
    {
        var headerView = (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "headerView"));
        if ((headerView == null ? null : headerView.isa.objj_msgSend1(headerView, "respondsToSelector:", sel_getUid("_setIndicatorImage:"))))
            (headerView == null ? null : headerView.isa.objj_msgSend1(headerView, "_setIndicatorImage:", anImage));
    }
}
,["void","CPImage","CPTableColumn"]), new objj_method(sel_getUid("_tableHeaderSortImage"), function $CPTableView___tableHeaderSortImage(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "sort-image");
}
,["CPImage"]), new objj_method(sel_getUid("_tableHeaderReverseSortImage"), function $CPTableView___tableHeaderReverseSortImage(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "sort-image-reversed");
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
            ((___r1 = ((___r2 = self._currentHighlightedTableColumn), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "headerView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateSelected));
        if (aTableColumn != nil)
            ((___r1 = (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "headerView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setThemeState:", CPThemeStateSelected));
    }
    self._currentHighlightedTableColumn = aTableColumn;
    var ___r1, ___r2;
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("canDragRowsWithIndexes:atPoint:"), function $CPTableView__canDragRowsWithIndexes_atPoint_(self, _cmd, rowIndexes, mouseDownPoint)
{
    return (rowIndexes == null ? null : rowIndexes.isa.objj_msgSend0(rowIndexes, "count")) > 0 && self.isa.objj_msgSend0(self, "numberOfRows") > 0 && self.isa.objj_msgSend0(self, "numberOfColumns") > 0;
}
,["BOOL","CPIndexSet","CGPoint"]), new objj_method(sel_getUid("dragImageForRowsWithIndexes:tableColumns:event:offset:"), function $CPTableView__dragImageForRowsWithIndexes_tableColumns_event_offset_(self, _cmd, dragRows, theTableColumns, dragEvent, dragImageOffset)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-generic-file");
}
,["CPImage","CPIndexSet","CPArray","CPEvent","CGPoint"]), new objj_method(sel_getUid("dragViewForRowsWithIndexes:tableColumns:event:offset:"), function $CPTableView__dragViewForRowsWithIndexes_tableColumns_event_offset_(self, _cmd, theDraggedRows, theTableColumns, theDragEvent, dragViewOffset)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", bounds));
    (view == null ? null : view.isa.objj_msgSend1(view, "setAlphaValue:", 0.7));
    var columnIndex = (theTableColumns == null ? null : theTableColumns.isa.objj_msgSend0(theTableColumns, "count"));
    while (columnIndex--)
    {
        var tableColumn = (theTableColumns == null ? null : theTableColumns.isa.objj_msgSend1(theTableColumns, "objectAtIndex:", columnIndex)),
            row = (theDraggedRows == null ? null : theDraggedRows.isa.objj_msgSend0(theDraggedRows, "firstIndex"));
        while (row !== CPNotFound)
        {
            var dataView = self.isa.objj_msgSend2(self, "_newDataViewForRow:tableColumn:", row, tableColumn);
            (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setFrame:", self.isa.objj_msgSend2(self, "frameOfDataViewAtColumn:row:", columnIndex, row)));
            self.isa.objj_msgSend3(self, "_setObjectValueForTableColumn:row:forView:", tableColumn, row, dataView);
            (view == null ? null : view.isa.objj_msgSend1(view, "addSubview:", dataView));
            ((___r1 = self._draggingViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", dataView));
            row = (theDraggedRows == null ? null : theDraggedRows.isa.objj_msgSend1(theDraggedRows, "indexGreaterThanIndex:", row));
        }
    }
    var dragPoint = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (theDragEvent == null ? null : theDragEvent.isa.objj_msgSend0(theDragEvent, "locationInWindow")), nil);
    dragViewOffset.x = CGRectGetWidth(bounds) / 2 - dragPoint.x;
    dragViewOffset.y = CGRectGetHeight(bounds) / 2 - dragPoint.y;
    return view;
    var ___r1;
}
,["CPView","CPIndexSet","CPArray","CPEvent","CGPoint"]), new objj_method(sel_getUid("_dragViewForColumn:event:offset:"), function $CPTableView___dragViewForColumn_event_offset_(self, _cmd, theColumnIndex, theDragEvent, theDragViewOffset)
{
    var dragView = ((___r1 = (_CPColumnDragView == null ? null : _CPColumnDragView.isa.objj_msgSend0(_CPColumnDragView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithLineColor:", self.isa.objj_msgSend0(self, "gridColor"))),
        tableColumn = ((___r1 = self.isa.objj_msgSend0(self, "tableColumns")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", theColumnIndex)),
        defaultRowHeight = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "default-row-height"),
        bounds = CGRectMake(0.0, 0.0, (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "width")), CGRectGetHeight(self.isa.objj_msgSend0(self, "exposedRect")) + defaultRowHeight),
        columnRect = self.isa.objj_msgSend1(self, "rectOfColumn:", theColumnIndex),
        headerView = (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "headerView")),
        row = ((___r1 = self._exposedRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex"));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "setFrame:", bounds));
    while (row !== CPNotFound)
    {
        var dataView = self.isa.objj_msgSend2(self, "_newDataViewForRow:tableColumn:", row, tableColumn),
            dataViewFrame = self.isa.objj_msgSend2(self, "frameOfDataViewAtColumn:row:", theColumnIndex, row);
        dataViewFrame.origin.x = 0.0;
        dataViewFrame.origin.y = CGRectGetMinY(dataViewFrame) - CGRectGetMinY(self.isa.objj_msgSend0(self, "exposedRect")) + defaultRowHeight;
        (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setFrame:", dataViewFrame));
        self.isa.objj_msgSend3(self, "_setObjectValueForTableColumn:row:forView:", tableColumn, row, dataView);
        (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "addSubview:", dataView));
        ((___r1 = self._draggingViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", dataView));
        row = ((___r1 = self._exposedRows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexGreaterThanIndex:", row));
    }
    var columnHeaderView = CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", headerView));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "addSubview:", columnHeaderView));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "setAlphaValue:", 0.7));
    return dragView;
    var ___r1;
}
,["CPView","CPInteger","CPEvent","CGPoint"]), new objj_method(sel_getUid("setDraggingSourceOperationMask:forLocal:"), function $CPTableView__setDraggingSourceOperationMask_forLocal_(self, _cmd, mask, isLocal)
{
    self._dragOperationDefaultMask = mask;
}
,["void","CPDragOperation","BOOL"]), new objj_method(sel_getUid("setDropRow:dropOperation:"), function $CPTableView__setDropRow_dropOperation_(self, _cmd, row, operation)
{
    if (row > self.isa.objj_msgSend0(self, "numberOfRows") && operation === CPTableViewDropOn)
    {
        var numberOfRows = self.isa.objj_msgSend0(self, "numberOfRows") + 1,
            reason = "Attempt to set dropRow=" + row + " dropOperation=CPTableViewDropOn when [0 - " + numberOfRows + "] is valid range of rows.";
        ((___r1 = CPException.isa.objj_msgSend3(CPException, "exceptionWithName:reason:userInfo:", "Error", reason, nil)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "raise"));
    }
    self._retargetedDropRow = row;
    self._retargetedDropOperation = operation;
    var ___r1;
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
    var tableColumns = self.isa.objj_msgSend0(self, "tableColumns");
    for (var i = 0; i < (tableColumns == null ? null : tableColumns.isa.objj_msgSend0(tableColumns, "count")); i++)
    {
        var tableColumn = (tableColumns == null ? null : tableColumns.isa.objj_msgSend1(tableColumns, "objectAtIndex:", i)),
            sortDescriptorPrototype = (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "sortDescriptorPrototype"));
        if (!sortDescriptorPrototype)
            continue;
        if ((sortDescriptorPrototype == null ? null : sortDescriptorPrototype.isa.objj_msgSend0(sortDescriptorPrototype, "key")) === (theSortDescriptor == null ? null : theSortDescriptor.isa.objj_msgSend0(theSortDescriptor, "key")) && (sortDescriptorPrototype == null ? null : sortDescriptorPrototype.isa.objj_msgSend0(sortDescriptorPrototype, "selector")) === (theSortDescriptor == null ? null : theSortDescriptor.isa.objj_msgSend0(theSortDescriptor, "selector")))
        {
            return tableColumn;
        }
    }
    return nil;
}
,["CPTableColumn","CPSortDescriptor"]), new objj_method(sel_getUid("setSortDescriptors:"), function $CPTableView__setSortDescriptors_(self, _cmd, sortDescriptors)
{
    var oldSortDescriptors = ((___r1 = self.isa.objj_msgSend0(self, "sortDescriptors")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy")),
        newSortDescriptors = CPArray.isa.objj_msgSend0(CPArray, "array");
    if (sortDescriptors !== nil)
        (newSortDescriptors == null ? null : newSortDescriptors.isa.objj_msgSend1(newSortDescriptors, "addObjectsFromArray:", sortDescriptors));
    if ((newSortDescriptors == null ? null : newSortDescriptors.isa.objj_msgSend1(newSortDescriptors, "isEqual:", oldSortDescriptors)))
        return;
    self._sortDescriptors = newSortDescriptors;
    var oldColumn = nil,
        newColumn = nil;
    if ((newSortDescriptors == null ? null : newSortDescriptors.isa.objj_msgSend0(newSortDescriptors, "count")) > 0)
    {
        var newMainSortDescriptor = (newSortDescriptors == null ? null : newSortDescriptors.isa.objj_msgSend1(newSortDescriptors, "objectAtIndex:", 0));
        newColumn = self.isa.objj_msgSend1(self, "_tableColumnForSortDescriptor:", newMainSortDescriptor);
    }
    if ((oldSortDescriptors == null ? null : oldSortDescriptors.isa.objj_msgSend0(oldSortDescriptors, "count")) > 0)
    {
        var oldMainSortDescriptor = (oldSortDescriptors == null ? null : oldSortDescriptors.isa.objj_msgSend1(oldSortDescriptors, "objectAtIndex:", 0));
        oldColumn = self.isa.objj_msgSend1(self, "_tableColumnForSortDescriptor:", oldMainSortDescriptor);
    }
    var image = (newMainSortDescriptor == null ? null : newMainSortDescriptor.isa.objj_msgSend0(newMainSortDescriptor, "ascending")) ? self.isa.objj_msgSend0(self, "_tableHeaderSortImage") : self.isa.objj_msgSend0(self, "_tableHeaderReverseSortImage");
    self.isa.objj_msgSend2(self, "setIndicatorImage:inTableColumn:", nil, oldColumn);
    self.isa.objj_msgSend2(self, "setIndicatorImage:inTableColumn:", image, newColumn);
    self.isa.objj_msgSend1(self, "_sendDataSourceSortDescriptorsDidChange:", oldSortDescriptors);
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", "sortDescriptors"));
    ((___r1 = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", "sortDescriptors", self))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "reverseSetValueFor:", "sortDescriptors"));
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("sortDescriptors"), function $CPTableView__sortDescriptors(self, _cmd)
{
    return self._sortDescriptors;
}
,["CPArray"]), new objj_method(sel_getUid("_objectValueForTableColumn:row:"), function $CPTableView___objectValueForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    var tableColumnUID = (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "UID")),
        tableColumnObjectValues = self._objectValues[tableColumnUID];
    if (!tableColumnObjectValues)
    {
        tableColumnObjectValues = [];
        self._objectValues[tableColumnUID] = tableColumnObjectValues;
    }
    var objectValue = tableColumnObjectValues[aRowIndex];
    if (objectValue === undefined)
    {
        if (self.isa.objj_msgSend0(self, "_dataSourceRespondsToObjectValueForTableColumn"))
        {
            objectValue = self.isa.objj_msgSend2(self, "_sendDataSourceObjectValueForTableColumn:row:", aTableColumn, aRowIndex);
            tableColumnObjectValues[aRowIndex] = objectValue;
        }
        else if (!self._isViewBased && !self.isa.objj_msgSend1(self, "infoForBinding:", "content"))
        {
            CPLog.warn("no content binding established and data source " + ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + " does not implement tableView:objectValueForTableColumn:row:");
        }
    }
    return objectValue;
    var ___r1;
}
,["id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("exposedRect"), function $CPTableView__exposedRect(self, _cmd)
{
    if (!self._exposedRect)
    {
        var superview = self.isa.objj_msgSend0(self, "superview");
        if ((superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", (CPClipView == null ? null : CPClipView.isa.objj_msgSend0(CPClipView, "class")))))
            self._exposedRect = (superview == null ? null : superview.isa.objj_msgSend0(superview, "bounds"));
        else
            self._exposedRect = self.isa.objj_msgSend0(self, "bounds");
    }
    return self._exposedRect;
}
,["CGRect"]), new objj_method(sel_getUid("load"), function $CPTableView__load(self, _cmd)
{
    if (self._reloadAllRows)
    {
        self.isa.objj_msgSend2(self, "_unloadDataViewsInRows:columns:", self._exposedRows, self._exposedColumns);
        self._exposedRows = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
        self._exposedColumns = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
        self._reloadAllRows = NO;
    }
    var exposedRect = self.isa.objj_msgSend0(self, "exposedRect"),
        exposedRows = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", self.isa.objj_msgSend1(self, "rowsInRect:", exposedRect)),
        exposedColumns = self.isa.objj_msgSend1(self, "columnIndexesInRect:", exposedRect),
        obscuredRows = ((___r1 = self._exposedRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy")),
        obscuredColumns = ((___r1 = self._exposedColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    (obscuredRows == null ? null : obscuredRows.isa.objj_msgSend1(obscuredRows, "removeIndexes:", exposedRows));
    (obscuredColumns == null ? null : obscuredColumns.isa.objj_msgSend1(obscuredColumns, "removeIndexes:", exposedColumns));
    var newlyExposedRows = (exposedRows == null ? null : exposedRows.isa.objj_msgSend0(exposedRows, "copy")),
        newlyExposedColumns = (exposedColumns == null ? null : exposedColumns.isa.objj_msgSend0(exposedColumns, "copy"));
    (newlyExposedRows == null ? null : newlyExposedRows.isa.objj_msgSend1(newlyExposedRows, "removeIndexes:", self._exposedRows));
    (newlyExposedColumns == null ? null : newlyExposedColumns.isa.objj_msgSend1(newlyExposedColumns, "removeIndexes:", self._exposedColumns));
    var previouslyExposedRows = (exposedRows == null ? null : exposedRows.isa.objj_msgSend0(exposedRows, "copy")),
        previouslyExposedColumns = (exposedColumns == null ? null : exposedColumns.isa.objj_msgSend0(exposedColumns, "copy"));
    (previouslyExposedRows == null ? null : previouslyExposedRows.isa.objj_msgSend1(previouslyExposedRows, "removeIndexes:", newlyExposedRows));
    (previouslyExposedColumns == null ? null : previouslyExposedColumns.isa.objj_msgSend1(previouslyExposedColumns, "removeIndexes:", newlyExposedColumns));
    self.isa.objj_msgSend2(self, "_unloadDataViewsInRows:columns:", previouslyExposedRows, obscuredColumns);
    self.isa.objj_msgSend2(self, "_unloadDataViewsInRows:columns:", obscuredRows, previouslyExposedColumns);
    self.isa.objj_msgSend2(self, "_unloadDataViewsInRows:columns:", obscuredRows, obscuredColumns);
    self.isa.objj_msgSend2(self, "_unloadDataViewsInRows:columns:", newlyExposedRows, newlyExposedColumns);
    self.isa.objj_msgSend2(self, "_loadDataViewsInRows:columns:", previouslyExposedRows, newlyExposedColumns);
    self.isa.objj_msgSend2(self, "_loadDataViewsInRows:columns:", newlyExposedRows, previouslyExposedColumns);
    self.isa.objj_msgSend2(self, "_loadDataViewsInRows:columns:", newlyExposedRows, newlyExposedColumns);
    self._exposedRows = exposedRows;
    self._exposedColumns = exposedColumns;
    ((___r1 = self._tableDrawView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", exposedRect));
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    if (((___r1 = self._differedColumnDataToRemove), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
    {
        for (var i = 0; i < self._differedColumnDataToRemove.length; i++)
        {
            var data = self._differedColumnDataToRemove[i],
                column = data.column,
                tableColumnUID = (column == null ? null : column.isa.objj_msgSend0(column, "UID")),
                dataViews = self._dataViewsForTableColumns[tableColumnUID];
            for (var j = 0; j < (dataViews == null ? null : dataViews.isa.objj_msgSend0(dataViews, "count")); j++)
            {
                self.isa.objj_msgSend1(self, "_enqueueReusableDataView:", (dataViews == null ? null : dataViews.isa.objj_msgSend1(dataViews, "objectAtIndex:", j)));
            }
        }
        ((___r1 = self._differedColumnDataToRemove), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    }
    for (var identifier in self._cachedDataViews)
    {
        var dataViews = self._cachedDataViews[identifier],
            count = dataViews.length;
        while (count--)
            ((___r1 = dataViews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"), function $CPTableView___unloadDataViewsInRows_columns_(self, _cmd, rows, columns)
{
    if (!(rows == null ? null : rows.isa.objj_msgSend0(rows, "count")) || !(columns == null ? null : columns.isa.objj_msgSend0(columns, "count")))
        return;
    var rowArray = [],
        columnArray = [];
    (rows == null ? null : rows.isa.objj_msgSend3(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil));
    (columns == null ? null : columns.isa.objj_msgSend3(columns, "getIndexes:maxCount:inIndexRange:", columnArray, -1, nil));
    var columnIndex = 0,
        columnsCount = columnArray.length;
    for (; columnIndex < columnsCount; ++columnIndex)
    {
        var column = columnArray[columnIndex],
            tableColumn = self._tableColumns[column],
            tableColumnUID = (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "UID")),
            rowIndex = 0,
            rowsCount = rowArray.length;
        for (; rowIndex < rowsCount; ++rowIndex)
        {
            var row = rowArray[rowIndex],
                dataViews = self._dataViewsForTableColumns[tableColumnUID];
            if (!dataViews || row >= dataViews.length)
                continue;
            if (row === self._editingRow && column === self._editingColumn)
                ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self));
            var dataView = (dataViews == null ? null : dataViews.isa.objj_msgSend1(dataViews, "objectAtIndex:", row));
            self.isa.objj_msgSend3(self, "_sendDelegateWillRemoveView:forTableColumn:row:", dataView, tableColumn, row);
            (dataViews == null ? null : dataViews.isa.objj_msgSend2(dataViews, "replaceObjectAtIndex:withObject:", row, nil));
            self.isa.objj_msgSend1(self, "_enqueueReusableDataView:", dataView);
        }
    }
    var ___r1;
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_loadDataViewsInRows:columns:"), function $CPTableView___loadDataViewsInRows_columns_(self, _cmd, rows, columns)
{
    if (!(rows == null ? null : rows.isa.objj_msgSend0(rows, "count")) || !(columns == null ? null : columns.isa.objj_msgSend0(columns, "count")))
        return;
    var rowArray = [],
        rowRects = [],
        columnArray = [];
    (rows == null ? null : rows.isa.objj_msgSend3(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil));
    (columns == null ? null : columns.isa.objj_msgSend3(columns, "getIndexes:maxCount:inIndexRange:", columnArray, -1, nil));
    if (self._dirtyTableColumnRangeIndex !== CPNotFound)
        self.isa.objj_msgSend0(self, "_recalculateTableColumnRanges");
    var columnIndex = 0,
        columnsCount = columnArray.length;
    for (; columnIndex < columnsCount; ++columnIndex)
    {
        var column = columnArray[columnIndex],
            tableColumn = self._tableColumns[column];
        if ((tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "isHidden")) || tableColumn === self._draggedColumn)
            continue;
        var tableColumnUID = (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "UID"));
        if (!self._dataViewsForTableColumns[tableColumnUID])
            self._dataViewsForTableColumns[tableColumnUID] = [];
        var rowIndex = 0,
            rowsCount = rowArray.length,
            isColumnSelected = ((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsIndex:", column));
        for (; rowIndex < rowsCount; ++rowIndex)
        {
            var row = rowArray[rowIndex],
                dataView = self.isa.objj_msgSend2(self, "_newDataViewForRow:tableColumn:", row, tableColumn),
                isButton = (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "isKindOfClass:", (CPButton == null ? null : CPButton.isa.objj_msgSend0(CPButton, "class")))),
                isTextField = (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "isKindOfClass:", CPTextField.isa.objj_msgSend0(CPTextField, "class")));
            (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setFrame:", self.isa.objj_msgSend2(self, "frameOfDataViewAtColumn:row:", column, row)));
            self.isa.objj_msgSend3(self, "_setObjectValueForTableColumn:row:forView:", tableColumn, row, dataView);
            if (self._selectionHighlightStyle !== CPTableViewSelectionHighlightStyleNone && (isColumnSelected || self.isa.objj_msgSend1(self, "isRowSelected:", row)))
            {
                (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setThemeState:", CPThemeStateSelectedDataView));
            }
            else
                (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "unsetThemeState:", CPThemeStateSelectedDataView));
            if (self.isa.objj_msgSend1(self, "_sendDelegateIsGroupRow:", row))
            {
                ((___r1 = self._groupRows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addIndex:", row));
                (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setThemeState:", CPThemeStateGroupRow));
            }
            else
            {
                ((___r1 = self._groupRows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeIndexesInRange:", CPMakeRange(row, 1)));
                (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "unsetThemeState:", CPThemeStateGroupRow));
            }
            self.isa.objj_msgSend3(self, "_sendDelegateWillDisplayView:forTableColumn:row:", dataView, tableColumn, row);
            self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
            if ((dataView == null ? null : dataView.isa.objj_msgSend0(dataView, "superview")) !== self)
                self.isa.objj_msgSend1(self, "addSubview:", dataView);
            self._dataViewsForTableColumns[tableColumnUID][row] = dataView;
            if (self._isViewBased)
                continue;
            if (isButton || self._editingCellIndex && self._editingCellIndex.x === column && self._editingCellIndex.y === row)
            {
                if (isTextField)
                {
                    (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setEditable:", YES));
                    (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setSendsActionOnEndEditing:", YES));
                    (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setSelectable:", YES));
                    (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "selectText:", nil));
                    (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setBezeled:", YES));
                    (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setDelegate:", self));
                }
                (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setTarget:", self));
                (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setAction:", sel_getUid("_commitDataViewObjectValue:")));
                dataView.tableViewEditedColumnObj = tableColumn;
                dataView.tableViewEditedRowIndex = row;
            }
            else if (isTextField)
            {
                (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setEditable:", NO));
                (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setSelectable:", NO));
            }
        }
    }
    var ___r1;
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_setObjectValueForTableColumn:row:forView:"), function $CPTableView___setObjectValueForTableColumn_row_forView_(self, _cmd, aTableColumn, aRow, aDataView)
{
    if (self.isa.objj_msgSend0(self, "_dataSourceRespondsToObjectValueForTableColumn"))
        (aDataView == null ? null : aDataView.isa.objj_msgSend1(aDataView, "setObjectValue:", self.isa.objj_msgSend2(self, "_objectValueForTableColumn:row:", aTableColumn, aRow)));
    if (self._contentBindingExplicitlySet)
        self.isa.objj_msgSend2(self, "_prepareContentBindedDataView:forRow:", aDataView, aRow);
    else
        (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend2(aTableColumn, "_prepareDataView:forRow:", aDataView, aRow));
}
,["void","CPTableColumn","CPInteger","CPView"]), new objj_method(sel_getUid("_prepareContentBindedDataView:forRow:"), function $CPTableView___prepareContentBindedDataView_forRow_(self, _cmd, dataView, aRow)
{
    var binder = (CPTableContentBinder == null ? null : CPTableContentBinder.isa.objj_msgSend2(CPTableContentBinder, "getBinding:forObject:", "content", self)),
        content = (binder == null ? null : binder.isa.objj_msgSend0(binder, "content")),
        rowContent = (content == null ? null : content.isa.objj_msgSend1(content, "objectAtIndex:", aRow));
    (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setObjectValue:", rowContent));
}
,["void","CPView","CPInteger"]), new objj_method(sel_getUid("_layoutDataViewsInRows:columns:"), function $CPTableView___layoutDataViewsInRows_columns_(self, _cmd, rows, columns)
{
    var rowArray = [],
        columnArray = [];
    (rows == null ? null : rows.isa.objj_msgSend3(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil));
    (columns == null ? null : columns.isa.objj_msgSend3(columns, "getIndexes:maxCount:inIndexRange:", columnArray, -1, nil));
    var columnIndex = 0,
        columnsCount = columnArray.length;
    for (; columnIndex < columnsCount; ++columnIndex)
    {
        var column = columnArray[columnIndex],
            tableColumn = self._tableColumns[column],
            tableColumnUID = (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "UID")),
            dataViewsForTableColumn = self._dataViewsForTableColumns[tableColumnUID],
            rowIndex = 0,
            rowsCount = rowArray.length;
        if (dataViewsForTableColumn)
        {
            for (; rowIndex < rowsCount; ++rowIndex)
            {
                var row = rowArray[rowIndex],
                    dataView = dataViewsForTableColumn[row];
                (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setFrame:", self.isa.objj_msgSend2(self, "frameOfDataViewAtColumn:row:", column, row)));
            }
        }
    }
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_commitDataViewObjectValue:"), function $CPTableView___commitDataViewObjectValue_(self, _cmd, sender)
{
    if ((sender == null ? null : sender.isa.objj_msgSend1(sender, "respondsToSelector:", sel_getUid("sendsActionOnEndEditing"))) && (sender == null ? null : sender.isa.objj_msgSend0(sender, "sendsActionOnEndEditing")) && self._editingCellIndex === nil)
        return;
    self._editingCellIndex = nil;
    self.isa.objj_msgSend3(self, "_sendDataSourceSetObjectValue:forTableColumn:row:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "objectValue")), sender.tableViewEditedColumnObj, sender.tableViewEditedRowIndex);
    ((___r1 = sender.tableViewEditedColumnObj), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_reverseSetDataView:forRow:", sender, sender.tableViewEditedRowIndex));
    if ((sender == null ? null : sender.isa.objj_msgSend1(sender, "respondsToSelector:", sel_getUid("setEditable:"))))
        (sender == null ? null : sender.isa.objj_msgSend1(sender, "setEditable:", NO));
    if ((sender == null ? null : sender.isa.objj_msgSend1(sender, "respondsToSelector:", sel_getUid("setSelectable:"))))
        (sender == null ? null : sender.isa.objj_msgSend1(sender, "setSelectable:", NO));
    if ((sender == null ? null : sender.isa.objj_msgSend1(sender, "isKindOfClass:", CPTextField.isa.objj_msgSend0(CPTextField, "class"))))
        (sender == null ? null : sender.isa.objj_msgSend1(sender, "setBezeled:", NO));
    self.isa.objj_msgSend2(self, "reloadDataForRowIndexes:columnIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", sender.tableViewEditedRowIndex), CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", sender.tableViewEditedColumnObj))));
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("controlTextDidBlur:"), function $CPTableView__controlTextDidBlur_(self, _cmd, theNotification)
{
    var dataView = (theNotification == null ? null : theNotification.isa.objj_msgSend0(theNotification, "object"));
    if ((dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "respondsToSelector:", sel_getUid("setEditable:"))))
        (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setEditable:", NO));
    if ((dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "respondsToSelector:", sel_getUid("setSelectable:"))))
        (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setSelectable:", NO));
    if ((dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "isKindOfClass:", CPTextField.isa.objj_msgSend0(CPTextField, "class"))))
        (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setBezeled:", NO));
    self._editingCellIndex = nil;
}
,["void","CPNotification"]), new objj_method(sel_getUid("_newDataViewForRow:tableColumn:"), function $CPTableView___newDataViewForRow_tableColumn_(self, _cmd, aRow, aTableColumn)
{
    var view = nil;
    if (self._viewForTableColumnRowSelector)
        view = objj_msgSend(self, self._viewForTableColumnRowSelector, aTableColumn, aRow);
    if (!view)
    {
        var columnIdentifier = (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "identifier"));
        if (!columnIdentifier)
            columnIdentifier = (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "UID"));
        view = self.isa.objj_msgSend2(self, "makeViewWithIdentifier:owner:", columnIdentifier, self._delegate);
        if (!view)
            view = (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "_newDataView"));
        (view == null ? null : view.isa.objj_msgSend1(view, "setIdentifier:", columnIdentifier));
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
        view = self.isa.objj_msgSend2(self, "_unarchiveViewWithIdentifier:owner:", anIdentifier, anOwner);
    return view;
}
,["id","CPString","id"]), new objj_method(sel_getUid("_unarchiveViewWithIdentifier:owner:"), function $CPTableView___unarchiveViewWithIdentifier_owner_(self, _cmd, anIdentifier, anOwner)
{
    var cib = ((___r1 = self._archivedDataViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", anIdentifier));
    if (!cib && !self._unavailable_custom_cibs[anIdentifier])
    {
        var bundle = anOwner ? CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", (anOwner == null ? null : anOwner.isa.objj_msgSend0(anOwner, "class"))) : CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle");
        cib = ((___r1 = CPCib.isa.objj_msgSend0(CPCib, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithCibNamed:bundle:", anIdentifier, bundle));
    }
    if (!cib)
    {
        self._unavailable_custom_cibs[anIdentifier] = YES;
        return nil;
    }
    var objects = [],
        load = (cib == null ? null : cib.isa.objj_msgSend2(cib, "instantiateCibWithOwner:topLevelObjects:", anOwner, objects));
    if (!load)
        return nil;
    var count = objects.length;
    while (count--)
    {
        var obj = objects[count];
        if ((obj == null ? null : obj.isa.objj_msgSend1(obj, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))))
        {
            (obj == null ? null : obj.isa.objj_msgSend1(obj, "setIdentifier:", anIdentifier));
            (obj == null ? null : obj.isa.objj_msgSend1(obj, "setAutoresizingMask:", CPViewNotSizable));
            return obj;
        }
    }
    return nil;
    var ___r1;
}
,["CPView","CPString","id"]), new objj_method(sel_getUid("_updateIsViewBased"), function $CPTableView___updateIsViewBased(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToViewForTableColumn"))
        self._viewForTableColumnRowSelector = sel_getUid("_sendDelegateViewForTableColumn:row:");
    else if (self.isa.objj_msgSend0(self, "_delegateRespondsToDataViewForTableColumn"))
        self._viewForTableColumnRowSelector = sel_getUid("_sendDelegateDataViewForTableColumn:row:");
    self._isViewBased = self._viewForTableColumnRowSelector !== nil || self._archivedDataViews !== nil;
}
,["void"]), new objj_method(sel_getUid("_enqueueReusableDataView:"), function $CPTableView___enqueueReusableDataView_(self, _cmd, aDataView)
{
    if (!aDataView)
        return;
    var identifier = (aDataView == null ? null : aDataView.isa.objj_msgSend0(aDataView, "identifier"));
    if (!self._cachedDataViews[identifier])
        self._cachedDataViews[identifier] = [aDataView];
    else
        self._cachedDataViews[identifier].push(aDataView);
}
,["void","CPView"]), new objj_method(sel_getUid("setFrameSize:"), function $CPTableView__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "setFrameSize:", aSize);
    if (self._headerView)
        ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")), CGRectGetHeight(((___r2 = self._headerView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))))));
    self._exposedRect = nil;
    var ___r1, ___r2;
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
    ((___r1 = self._tableDrawView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", aFlag));
    ((___r1 = self.isa.objj_msgSend0(self, "headerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setNeedsLayout"), function $CPTableView__setNeedsLayout(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "setNeedsLayout");
    ((___r1 = self.isa.objj_msgSend0(self, "headerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_isFocused"), function $CPTableView___isFocused(self, _cmd)
{
    var isEditing = self._editingRow !== CPNotFound || self._editingCellIndex;
    return ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isKeyWindow")) && (((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) === self || isEditing);
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_drawRect:"), function $CPTableView___drawRect_(self, _cmd, aRect)
{
    var exposedRect = self.isa.objj_msgSend0(self, "exposedRect");
    self.isa.objj_msgSend1(self, "drawBackgroundInClipRect:", exposedRect);
    self.isa.objj_msgSend1(self, "highlightSelectionInClipRect:", exposedRect);
    self.isa.objj_msgSend1(self, "drawGridInClipRect:", exposedRect);
    if (self._implementsCustomDrawRow)
        self.isa.objj_msgSend2(self, "_drawRows:clipRect:", self._exposedRows, exposedRect);
}
,["void","CGRect"]), new objj_method(sel_getUid("drawBackgroundInClipRect:"), function $CPTableView__drawBackgroundInClipRect_(self, _cmd, aRect)
{
    if (!self._usesAlternatingRowBackgroundColors)
        return;
    var rowColors = self.isa.objj_msgSend0(self, "alternatingRowBackgroundColors"),
        colorCount = (rowColors == null ? null : rowColors.isa.objj_msgSend0(rowColors, "count"));
    if (colorCount === 0)
        return;
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    if (colorCount === 1)
    {
        CGContextSetFillColor(context, rowColors[0]);
        CGContextFillRect(context, aRect);
        return;
    }
    var exposedRows = self.isa.objj_msgSend1(self, "_exposedRowsInRect:", aRect),
        firstRow = FLOOR(exposedRows.location / colorCount) * colorCount,
        lastRow = CPMaxRange(exposedRows) - 1,
        colorIndex = 0,
        groupRowRects = [];
    while (colorIndex < colorCount)
    {
        CGContextBeginPath(context);
        for (var row = firstRow + colorIndex; row <= lastRow; row += colorCount)
        {
            if (!((___r1 = self._groupRows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsIndex:", row)))
                CGContextAddRect(context, CGRectIntersection(aRect, self.isa.objj_msgSend2(self, "_rectOfRow:checkRange:", row, NO)));
            else
                groupRowRects.push(CGRectIntersection(aRect, self.isa.objj_msgSend2(self, "_rectOfRow:checkRange:", row, NO)));
        }
        CGContextClosePath(context);
        CGContextSetFillColor(context, rowColors[colorIndex]);
        CGContextFillPath(context);
        colorIndex++;
    }
    self.isa.objj_msgSend1(self, "_drawGroupRowsForRects:", groupRowRects);
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("drawGridInClipRect:"), function $CPTableView__drawGridInClipRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        gridStyleMask = self.isa.objj_msgSend0(self, "gridStyleMask"),
        lineThickness = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "grid-line-thickness");
    if (!(gridStyleMask & (CPTableViewSolidHorizontalGridLineMask | CPTableViewSolidVerticalGridLineMask)))
        return;
    CGContextBeginPath(context);
    if (gridStyleMask & CPTableViewSolidHorizontalGridLineMask)
    {
        var exposedRows = self.isa.objj_msgSend1(self, "_exposedRowsInRect:", aRect),
            row = exposedRows.location,
            lastRow = CPMaxRange(exposedRows) - 1,
            rowY = -lineThickness / 2,
            minX = CGRectGetMinX(aRect),
            maxX = CGRectGetMaxX(aRect);
        for (; row <= lastRow; ++row)
        {
            var rowRect = self.isa.objj_msgSend2(self, "_rectOfRow:checkRange:", row, NO),
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
        var exposedColumnIndexes = self.isa.objj_msgSend1(self, "columnIndexesInRect:", aRect),
            columnsArray = [];
        (exposedColumnIndexes == null ? null : exposedColumnIndexes.isa.objj_msgSend3(exposedColumnIndexes, "getIndexes:maxCount:inIndexRange:", columnsArray, -1, nil));
        var columnArrayIndex = 0,
            columnArrayCount = columnsArray.length,
            minY = CGRectGetMinY(aRect),
            maxY = CGRectGetMaxY(aRect);
        for (; columnArrayIndex < columnArrayCount; ++columnArrayIndex)
        {
            var columnRect = self.isa.objj_msgSend1(self, "rectOfColumn:", columnsArray[columnArrayIndex]),
                columnX = CGRectGetMaxX(columnRect) - lineThickness / 2;
            CGContextMoveToPoint(context, columnX, minY);
            CGContextAddLineToPoint(context, columnX, maxY);
        }
    }
    CGContextClosePath(context);
    CGContextSetStrokeColor(context, self.isa.objj_msgSend0(self, "gridColor"));
    CGContextSetLineWidth(context, lineThickness);
    CGContextStrokePath(context);
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("highlightSelectionInClipRect:"), function $CPTableView__highlightSelectionInClipRect_(self, _cmd, aRect)
{
    if (self._selectionHighlightStyle === CPTableViewSelectionHighlightStyleNone)
        return;
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        indexes = [],
        rectSelector = sel_getUid("rectOfRow:");
    if (((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) >= 1)
    {
        var exposedRows = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", self.isa.objj_msgSend1(self, "rowsInRect:", aRect)),
            firstRow = (exposedRows == null ? null : exposedRows.isa.objj_msgSend0(exposedRows, "firstIndex")),
            exposedRange = CPMakeRange(firstRow, (exposedRows == null ? null : exposedRows.isa.objj_msgSend0(exposedRows, "lastIndex")) - firstRow + 1);
        ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "getIndexes:maxCount:inIndexRange:", indexes, -1, exposedRange));
    }
    else if (((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) >= 1)
    {
        rectSelector = sel_getUid("rectOfColumn:");
        var exposedColumns = self.isa.objj_msgSend1(self, "columnIndexesInRect:", aRect),
            firstColumn = (exposedColumns == null ? null : exposedColumns.isa.objj_msgSend0(exposedColumns, "firstIndex")),
            exposedRange = CPMakeRange(firstColumn, (exposedColumns == null ? null : exposedColumns.isa.objj_msgSend0(exposedColumns, "lastIndex")) - firstColumn + 1);
        ((___r1 = self._selectedColumnIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "getIndexes:maxCount:inIndexRange:", indexes, -1, exposedRange));
    }
    var count,
        count2 = count = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "count"));
    if (!count)
        return;
    var drawGradient = CPFeatureIsCompatible(CPHTMLCanvasFeature) && self._selectionHighlightStyle === CPTableViewSelectionHighlightStyleSourceList && ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) >= 1,
        deltaHeight = 0.5 * (self._gridStyleMask & CPTableViewSolidHorizontalGridLineMask),
        focused = self.isa.objj_msgSend0(self, "_isFocused");
    CGContextBeginPath(context);
    if (drawGradient)
    {
        var gradientCache = focused ? self.isa.objj_msgSend0(self, "selectionGradientColors") : self.isa.objj_msgSend0(self, "unfocusedSelectionGradientColors"),
            topLineColor = (gradientCache == null ? null : gradientCache.isa.objj_msgSend1(gradientCache, "objectForKey:", CPSourceListTopLineColor)),
            bottomLineColor = (gradientCache == null ? null : gradientCache.isa.objj_msgSend1(gradientCache, "objectForKey:", CPSourceListBottomLineColor)),
            gradientColor = (gradientCache == null ? null : gradientCache.isa.objj_msgSend1(gradientCache, "objectForKey:", CPSourceListGradient));
    }
    var normalSelectionHighlightColor = focused ? self.isa.objj_msgSend0(self, "selectionHighlightColor") : self.isa.objj_msgSend0(self, "unfocusedSelectionHighlightColor");
    if (((___r1 = self._groupRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
    {
        var topGroupLineColor = CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 212.0 / 255.0, 1.0),
            bottomGroupLineColor = CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 185.0 / 255.0, 1.0),
            gradientGroupColor = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), [212.0 / 255.0, 212.0 / 255.0, 212.0 / 255.0, 1.0, 197.0 / 255.0, 197.0 / 255.0, 197.0 / 255.0, 1.0], [0, 1], 2);
    }
    while (count--)
    {
        var currentIndex = indexes[count],
            rowRect = CGRectIntersection(objj_msgSend(self, rectSelector, currentIndex), aRect);
        if (!drawGradient)
            var shouldUseGroupGradient = ((___r1 = self._groupRows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsIndex:", currentIndex));
        if (drawGradient || shouldUseGroupGradient)
        {
            var minX = CGRectGetMinX(rowRect),
                minY = CGRectGetMinY(rowRect),
                maxX = CGRectGetMaxX(rowRect),
                maxY = CGRectGetMaxY(rowRect) - deltaHeight;
            if (!drawGradient)
            {
                (normalSelectionHighlightColor == null ? null : normalSelectionHighlightColor.isa.objj_msgSend0(normalSelectionHighlightColor, "setFill"));
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
            var radius = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "selection-radius");
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
        (normalSelectionHighlightColor == null ? null : normalSelectionHighlightColor.isa.objj_msgSend0(normalSelectionHighlightColor, "setFill"));
        CGContextFillPath(context);
    }
    CGContextBeginPath(context);
    var gridStyleMask = self.isa.objj_msgSend0(self, "gridStyleMask");
    for (var i = 0; i < count2; i++)
    {
        var rect = objj_msgSend(self, rectSelector, indexes[i]),
            minX = CGRectGetMinX(rect) - 0.5,
            maxX = CGRectGetMaxX(rect) - 0.5,
            minY = CGRectGetMinY(rect) - 0.5,
            maxY = CGRectGetMaxY(rect) - 0.5;
        if (((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) >= 1 && gridStyleMask & CPTableViewSolidVerticalGridLineMask)
        {
            var exposedColumns = self.isa.objj_msgSend1(self, "columnIndexesInRect:", aRect),
                exposedColumnIndexes = [],
                firstExposedColumn = (exposedColumns == null ? null : exposedColumns.isa.objj_msgSend0(exposedColumns, "firstIndex")),
                exposedRange = CPMakeRange(firstExposedColumn, (exposedColumns == null ? null : exposedColumns.isa.objj_msgSend0(exposedColumns, "lastIndex")) - firstExposedColumn + 1);
            (exposedColumns == null ? null : exposedColumns.isa.objj_msgSend3(exposedColumns, "getIndexes:maxCount:inIndexRange:", exposedColumnIndexes, -1, exposedRange));
            var exposedColumnCount = (exposedColumnIndexes == null ? null : exposedColumnIndexes.isa.objj_msgSend0(exposedColumnIndexes, "count"));
            for (var c = firstExposedColumn; c < exposedColumnCount; c++)
            {
                var colRect = self.isa.objj_msgSend1(self, "rectOfColumn:", exposedColumnIndexes[c]),
                    colX = CGRectGetMaxX(colRect) + 0.5;
                CGContextMoveToPoint(context, colX, minY);
                CGContextAddLineToPoint(context, colX, maxY);
            }
        }
        if ((indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "containsObject:", indexes[i] + 1)))
        {
            CGContextMoveToPoint(context, minX, maxY);
            CGContextAddLineToPoint(context, maxX, maxY);
        }
    }
    CGContextClosePath(context);
    CGContextSetStrokeColor(context, self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "highlighted-grid-color"));
    CGContextStrokePath(context);
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawGroupRowsForRects:"), function $CPTableView___drawGroupRowsForRects_(self, _cmd, rects)
{
    if (CPFeatureIsCompatible(CPHTMLCanvasFeature) && self._selectionHighlightStyle === CPTableViewSelectionHighlightStyleSourceList || !rects.length)
        return;
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        i = rects.length;
    CGContextBeginPath(context);
    var gradientCache = self.isa.objj_msgSend0(self, "selectionGradientColors"),
        topLineColor = CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", "d3d3d3"),
        bottomLineColor = CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", "bebebd"),
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
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("_drawRows:clipRect:"), function $CPTableView___drawRows_clipRect_(self, _cmd, rowsIndexes, clipRect)
{
    var row = (rowsIndexes == null ? null : rowsIndexes.isa.objj_msgSend0(rowsIndexes, "firstIndex"));
    while (row !== CPNotFound)
    {
        self.isa.objj_msgSend2(self, "drawRow:clipRect:", row, CGRectIntersection(clipRect, self.isa.objj_msgSend1(self, "rectOfRow:", row)));
        row = (rowsIndexes == null ? null : rowsIndexes.isa.objj_msgSend1(rowsIndexes, "indexGreaterThanIndex:", row));
    }
}
,["void","CPIndexSet","CGRect"]), new objj_method(sel_getUid("drawRow:clipRect:"), function $CPTableView__drawRow_clipRect_(self, _cmd, row, rect)
{
}
,["void","CPInteger","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTableView__layoutSubviews(self, _cmd)
{
    self.isa.objj_msgSend0(self, "load");
}
,["void"]), new objj_method(sel_getUid("viewWillMoveToSuperview:"), function $CPTableView__viewWillMoveToSuperview_(self, _cmd, aView)
{
    var superview = self.isa.objj_msgSend0(self, "superview"),
        defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (superview)
    {
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPViewFrameDidChangeNotification, superview));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPViewBoundsDidChangeNotification, superview));
    }
    if ((aView == null ? null : aView.isa.objj_msgSend1(aView, "isKindOfClass:", (CPClipView == null ? null : CPClipView.isa.objj_msgSend0(CPClipView, "class")))))
    {
        (aView == null ? null : aView.isa.objj_msgSend1(aView, "setPostsFrameChangedNotifications:", YES));
        (aView == null ? null : aView.isa.objj_msgSend1(aView, "setPostsBoundsChangedNotifications:", YES));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("superviewFrameChanged:"), CPViewFrameDidChangeNotification, aView));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("superviewBoundsChanged:"), CPViewBoundsDidChangeNotification, aView));
    }
}
,["void","CPView"]), new objj_method(sel_getUid("superviewBoundsChanged:"), function $CPTableView__superviewBoundsChanged_(self, _cmd, aNotification)
{
    self._exposedRect = nil;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPNotification"]), new objj_method(sel_getUid("superviewFrameChanged:"), function $CPTableView__superviewFrameChanged_(self, _cmd, aNotification)
{
    self._exposedRect = nil;
    self.isa.objj_msgSend0(self, "tile");
}
,["void","CPNotification"]), new objj_method(sel_getUid("tracksMouseOutsideOfFrame"), function $CPTableView__tracksMouseOutsideOfFrame(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPTableView__startTrackingAt_(self, _cmd, aPoint)
{
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self));
    var row = self.isa.objj_msgSend1(self, "rowAtPoint:", aPoint);
    if (row < 0 && self._allowsEmptySelection)
    {
        if (self.isa.objj_msgSend0(self, "_sendDelegateSelectionShouldChangeInTableView"))
        {
            var indexSet = self.isa.objj_msgSend1(self, "_sendDelegateSelectionIndexesForProposedSelection:", CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"));
            self.isa.objj_msgSend0(self, "_noteSelectionIsChanging");
            self.isa.objj_msgSend2(self, "selectRowIndexes:byExtendingSelection:", indexSet, NO);
        }
    }
    if (self.isa.objj_msgSend0(self, "mouseDownFlags") & CPShiftKeyMask)
        self._selectionAnchorRow = ABS(((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")) - row) < ABS(((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex")) - row) ? ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")) : ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex"));
    else
        self._selectionAnchorRow = row;
    self._startTrackingPoint = aPoint;
    self._startTrackingTimestamp = new Date();
    if (self.isa.objj_msgSend0(self, "_dataSourceRespondsToSetObjectValueForTableColumnRow"))
        self._trackingPointMovedOutOfClickSlop = NO;
    if (row >= 0 && !self.isa.objj_msgSend0(self, "_dataSourceRespondsToWriteRowsWithIndexesToPasteboard"))
        self.isa.objj_msgSend1(self, "_updateSelectionWithMouseAtRow:", row);
    return YES;
    var ___r1;
}
,["BOOL","CGPoint"]), new objj_method(sel_getUid("menuForEvent:"), function $CPTableView__menuForEvent_(self, _cmd, theEvent)
{
    if (!self.isa.objj_msgSend0(self, "_delegateRespondsToMenuForTableColumnRow"))
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "menuForEvent:", theEvent);
    var location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (theEvent == null ? null : theEvent.isa.objj_msgSend0(theEvent, "locationInWindow")), nil),
        row = self.isa.objj_msgSend1(self, "rowAtPoint:", location),
        column = self.isa.objj_msgSend1(self, "columnAtPoint:", location),
        tableColumn = ((___r1 = self.isa.objj_msgSend0(self, "tableColumns")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", column));
    return self.isa.objj_msgSend2(self, "_sendDelegateMenuForTableColumn:row:", tableColumn, row);
    var ___r1;
}
,["CPMenu","CPEvent"]), new objj_method(sel_getUid("trackMouse:"), function $CPTableView__trackMouse_(self, _cmd, anEvent)
{
    if (!((___r1 = self._draggedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
    {
        self.isa.objj_msgSend1(self, "autoscroll:", anEvent);
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "trackMouse:", anEvent);
    }
    else
        (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "sendEvent:", anEvent));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("continueTracking:at:"), function $CPTableView__continueTracking_at_(self, _cmd, lastPoint, aPoint)
{
    var row = self.isa.objj_msgSend1(self, "rowAtPoint:", aPoint);
    if (!self._isSelectingSession && self.isa.objj_msgSend0(self, "_dataSourceRespondsToWriteRowsWithIndexesToPasteboard"))
    {
        if (row >= 0 && (ABS(self._startTrackingPoint.x - aPoint.x) > 3 || self._verticalMotionCanDrag && ABS(self._startTrackingPoint.y - aPoint.y) > 3) || ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsIndex:", row)))
        {
            if (((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsIndex:", row)))
                self._draggedRowIndexes = ((___r1 = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIndexSet:", self._selectedRowIndexes));
            else
                self._draggedRowIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", row);
            var pboard = CPPasteboard.isa.objj_msgSend1(CPPasteboard, "pasteboardWithName:", CPDragPboard);
            if (self.isa.objj_msgSend2(self, "canDragRowsWithIndexes:atPoint:", self._draggedRowIndexes, aPoint) && self.isa.objj_msgSend2(self, "_sendDataSourceWriteRowsWithIndexes:toPasteboard:", self._draggedRowIndexes, pboard))
            {
                var currentEvent = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")),
                    offset = CGPointMakeZero(),
                    tableColumns = ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectsAtIndexes:", self._exposedColumns));
                var view = self.isa.objj_msgSend(self, "dragViewForRowsWithIndexes:tableColumns:event:offset:", self._draggedRowIndexes, tableColumns, currentEvent, offset);
                if (!view)
                {
                    var image = self.isa.objj_msgSend(self, "dragImageForRowsWithIndexes:tableColumns:event:offset:", self._draggedRowIndexes, tableColumns, currentEvent, offset);
                    view = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, (image == null ? null : image.isa.objj_msgSend0(image, "size")).width, (image == null ? null : image.isa.objj_msgSend0(image, "size")).height)));
                    (view == null ? null : view.isa.objj_msgSend1(view, "setImage:", image));
                }
                var bounds = (view == null ? null : view.isa.objj_msgSend0(view, "bounds")),
                    viewLocation = CGPointMake(aPoint.x - CGRectGetWidth(bounds) / 2 + offset.x, aPoint.y - CGRectGetHeight(bounds) / 2 + offset.y);
                self.isa.objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", view, viewLocation, CGPointMakeZero(), (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")), pboard, self, YES);
                self._startTrackingPoint = nil;
                return NO;
            }
            self._draggedRowIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
        }
        else if (ABS(self._startTrackingPoint.x - aPoint.x) < 5 && ABS(self._startTrackingPoint.y - aPoint.y) < 5)
            return YES;
    }
    self._isSelectingSession = YES;
    if (row >= 0 && row !== self._lastTrackedRowIndex)
    {
        self._lastTrackedRowIndex = row;
        self.isa.objj_msgSend1(self, "_updateSelectionWithMouseAtRow:", row);
    }
    if (self.isa.objj_msgSend0(self, "_dataSourceRespondsToSetObjectValueForTableColumnRow") && !self._trackingPointMovedOutOfClickSlop)
    {
        var CLICK_SPACE_DELTA = 5.0;
        if (ABS(aPoint.x - self._startTrackingPoint.x) > CLICK_SPACE_DELTA || ABS(aPoint.y - self._startTrackingPoint.y) > CLICK_SPACE_DELTA)
        {
            self._trackingPointMovedOutOfClickSlop = YES;
        }
    }
    return YES;
    var ___r1;
}
,["BOOL","CGPoint","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPTableView__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{
    self._isSelectingSession = NO;
    var CLICK_TIME_DELTA = 1000,
        columnIndex = -1,
        column,
        rowIndex,
        shouldEdit = YES;
    if (self.isa.objj_msgSend0(self, "_dataSourceRespondsToWriteRowsWithIndexesToPasteboard"))
    {
        rowIndex = self.isa.objj_msgSend1(self, "rowAtPoint:", aPoint);
        if (rowIndex !== -1)
        {
            if (((___r1 = self._draggedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
            {
                self._draggedRowIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
                return;
            }
            self._previouslySelectedRowIndexes = ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
            self.isa.objj_msgSend1(self, "_updateSelectionWithMouseAtRow:", rowIndex);
        }
    }
    if (!self._isViewBased && mouseIsUp && !self._trackingPointMovedOutOfClickSlop && ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "clickCount")) > 1 && (self.isa.objj_msgSend0(self, "_dataSourceRespondsToSetObjectValueForTableColumnRow") || self.isa.objj_msgSend1(self, "infoForBinding:", "content")))
    {
        columnIndex = self.isa.objj_msgSend1(self, "columnAtPoint:", lastPoint);
        if (columnIndex !== -1)
        {
            column = self._tableColumns[columnIndex];
            if ((column == null ? null : column.isa.objj_msgSend0(column, "isEditable")))
            {
                rowIndex = self.isa.objj_msgSend1(self, "rowAtPoint:", aPoint);
                if (rowIndex !== -1)
                {
                    if (self.isa.objj_msgSend2(self, "_sendDelegateShouldEditTableColumn:row:", column, rowIndex))
                    {
                        self.isa.objj_msgSend(self, "editColumn:row:withEvent:select:", columnIndex, rowIndex, nil, YES);
                        return;
                    }
                }
            }
        }
    }
    if (((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "clickCount")) === 2 && self._doubleAction)
    {
        self._clickedRow = self.isa.objj_msgSend1(self, "rowAtPoint:", aPoint);
        self._clickedColumn = self.isa.objj_msgSend1(self, "columnAtPoint:", lastPoint);
        self.isa.objj_msgSend2(self, "sendAction:to:", self._doubleAction, self._target);
    }
    var ___r1;
}
,["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("draggingEntered:"), function $CPTableView__draggingEntered_(self, _cmd, sender)
{
    var location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "draggingLocation")), nil),
        dropOperation = self.isa.objj_msgSend1(self, "_proposedDropOperationAtPoint:", location),
        row = self.isa.objj_msgSend1(self, "_proposedRowAtPoint:", location);
    if (self._retargetedDropRow !== nil)
        row = self._retargetedDropRow;
    var draggedTypes = self.isa.objj_msgSend0(self, "registeredDraggedTypes"),
        count = (draggedTypes == null ? null : draggedTypes.isa.objj_msgSend0(draggedTypes, "count")),
        i = 0;
    for (; i < count; i++)
    {
        if (((___r1 = ((___r2 = (sender == null ? null : sender.isa.objj_msgSend0(sender, "draggingPasteboard"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "types"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", (draggedTypes == null ? null : draggedTypes.isa.objj_msgSend1(draggedTypes, "objectAtIndex:", i)))))
            return self.isa.objj_msgSend3(self, "_sendDataSourceValidateDrop:proposedRow:proposedDropOperation:", sender, row, dropOperation);
    }
    return CPDragOperationNone;
    var ___r1, ___r2;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("draggingExited:"), function $CPTableView__draggingExited_(self, _cmd, sender)
{
    ((___r1 = self._dropOperationFeedbackView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("draggingEnded:"), function $CPTableView__draggingEnded_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "_draggingEnded");
}
,["void","id"]), new objj_method(sel_getUid("_draggingEnded"), function $CPTableView___draggingEnded(self, _cmd)
{
    self._retargetedDropOperation = nil;
    self._retargetedDropRow = nil;
    self._draggedRowIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    ((___r1 = self._dropOperationFeedbackView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    self.isa.objj_msgSend0(self, "_enqueueDraggingViews");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("wantsPeriodicDraggingUpdates"), function $CPTableView__wantsPeriodicDraggingUpdates(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_proposedDropOperationAtPoint:"), function $CPTableView___proposedDropOperationAtPoint_(self, _cmd, theDragPoint)
{
    if (self._retargetedDropOperation !== nil)
        return self._retargetedDropOperation;
    var row = self.isa.objj_msgSend1(self, "_proposedRowAtPoint:", theDragPoint),
        rowRect = self.isa.objj_msgSend1(self, "rectOfRow:", row);
    if (self.isa.objj_msgSend0(self, "intercellSpacing").height < 5.0)
        rowRect = CGRectInset(rowRect, 0.0, 5.0 - self.isa.objj_msgSend0(self, "intercellSpacing").height);
    if (CGRectContainsPoint(rowRect, theDragPoint) && row < self._numberOfRows)
        return CPTableViewDropOn;
    return CPTableViewDropAbove;
}
,["CPTableViewDropOperation","CGPoint"]), new objj_method(sel_getUid("_proposedRowAtPoint:"), function $CPTableView___proposedRowAtPoint_(self, _cmd, dragPoint)
{
    var row = self.isa.objj_msgSend1(self, "rowAtPoint:", dragPoint),
        lowerRow = row + 1,
        rect = self.isa.objj_msgSend1(self, "rectOfRow:", row),
        bottomPoint = CGRectGetMaxY(rect),
        bottomThirty = bottomPoint - (bottomPoint - CGRectGetMinY(rect)) * 0.3,
        numberOfRows = self.isa.objj_msgSend0(self, "numberOfRows");
    if (row < 0)
        row = CGRectGetMaxY(rect) < dragPoint.y ? numberOfRows : row;
    else if (dragPoint.y > MAX(bottomThirty, bottomPoint - 6))
        row = lowerRow;
    row = MIN(numberOfRows, row);
    return row;
}
,["CPInteger","CGPoint"]), new objj_method(sel_getUid("_rectForDropHighlightViewOnRow:"), function $CPTableView___rectForDropHighlightViewOnRow_(self, _cmd, theRowIndex)
{
    if (theRowIndex >= self.isa.objj_msgSend0(self, "numberOfRows"))
        theRowIndex = self.isa.objj_msgSend0(self, "numberOfRows") - 1;
    return self.isa.objj_msgSend2(self, "_rectOfRow:checkRange:", theRowIndex, NO);
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:"), function $CPTableView___rectForDropHighlightViewBetweenUpperRow_andLowerRow_offset_(self, _cmd, theUpperRowIndex, theLowerRowIndex, theOffset)
{
    if (theLowerRowIndex > self.isa.objj_msgSend0(self, "numberOfRows"))
        theLowerRowIndex = self.isa.objj_msgSend0(self, "numberOfRows");
    return self.isa.objj_msgSend2(self, "_rectOfRow:checkRange:", theLowerRowIndex, NO);
}
,["CGRect","CPInteger","CPInteger","CGPoint"]), new objj_method(sel_getUid("draggingUpdated:"), function $CPTableView__draggingUpdated_(self, _cmd, sender)
{
    self._retargetedDropRow = nil;
    self._retargetedDropOperation = nil;
    var location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "draggingLocation")), nil),
        dropOperation = self.isa.objj_msgSend1(self, "_proposedDropOperationAtPoint:", location),
        numberOfRows = self.isa.objj_msgSend0(self, "numberOfRows"),
        row = self.isa.objj_msgSend1(self, "_proposedRowAtPoint:", location),
        dragOperation = self.isa.objj_msgSend3(self, "_sendDataSourceValidateDrop:proposedRow:proposedDropOperation:", sender, row, dropOperation);
    if (self._retargetedDropRow !== nil)
        row = self._retargetedDropRow;
    if (self._retargetedDropOperation !== nil)
        dropOperation = self._retargetedDropOperation;
    if (dropOperation === CPTableViewDropOn && row >= numberOfRows)
        row = numberOfRows - 1;
    var rect = CGRectMakeZero();
    if (row === -1)
        rect = self.isa.objj_msgSend0(self, "exposedRect");
    else if (dropOperation === CPTableViewDropAbove)
        rect = self.isa.objj_msgSend3(self, "_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:", row - 1, row, location);
    else
        rect = self.isa.objj_msgSend1(self, "_rectForDropHighlightViewOnRow:", row);
    ((___r1 = self._dropOperationFeedbackView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDropOperation:", row !== -1 ? dropOperation : CPDragOperationNone));
    ((___r1 = self._dropOperationFeedbackView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", dragOperation == CPDragOperationNone));
    ((___r1 = self._dropOperationFeedbackView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", rect));
    ((___r1 = self._dropOperationFeedbackView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCurrentRow:", row));
    self.isa.objj_msgSend1(self, "addSubview:", self._dropOperationFeedbackView);
    return dragOperation;
    var ___r1;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("prepareForDragOperation:"), function $CPTableView__prepareForDragOperation_(self, _cmd, sender)
{
    ((___r1 = self._dropOperationFeedbackView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    return self.isa.objj_msgSend0(self, "_dataSourceRespondsToValidateDropProposedRowProposedDropOperation");
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("performDragOperation:"), function $CPTableView__performDragOperation_(self, _cmd, sender)
{
    var location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "draggingLocation")), nil),
        operation = self.isa.objj_msgSend1(self, "_proposedDropOperationAtPoint:", location),
        row = self._retargetedDropRow;
    if (row === nil)
        var row = self.isa.objj_msgSend1(self, "_proposedRowAtPoint:", location);
    return self.isa.objj_msgSend3(self, "_sendDataSourceAcceptDrop:row:dropOperation:", sender, row, operation);
}
,["BOOL","id"]), new objj_method(sel_getUid("concludeDragOperation:"), function $CPTableView__concludeDragOperation_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "reloadData");
}
,["void","id"]), new objj_method(sel_getUid("draggedView:endedAt:operation:"), function $CPTableView__draggedView_endedAt_operation_(self, _cmd, aView, aLocation, anOperation)
{
    self.isa.objj_msgSend0(self, "_draggingEnded");
    self.isa.objj_msgSend3(self, "draggedImage:endedAt:operation:", aView, aLocation, anOperation);
}
,["void","CPImage","CGPoint","CPDragOperation"]), new objj_method(sel_getUid("_enqueueDraggingViews"), function $CPTableView___enqueueDraggingViews(self, _cmd)
{
    ((___r1 = self._draggingViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "enumerateObjectsUsingBlock:", function(dataView, idx)
    {
        self.isa.objj_msgSend1(self, "_enqueueReusableDataView:", dataView);
    }));
    ((___r1 = self._draggingViews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"), function $CPTableView___updateSelectionWithMouseAtRow_(self, _cmd, aRow)
{
    if (aRow < 0)
        return;
    var newSelection,
        shouldExtendSelection = NO;
    if (self.isa.objj_msgSend0(self, "mouseDownFlags") & (CPCommandKeyMask | CPControlKeyMask | CPAlternateKeyMask))
    {
        if (((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsIndex:", aRow)))
        {
            newSelection = ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
            (newSelection == null ? null : newSelection.isa.objj_msgSend1(newSelection, "removeIndex:", aRow));
        }
        else if (self._allowsMultipleSelection)
        {
            newSelection = ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
            (newSelection == null ? null : newSelection.isa.objj_msgSend1(newSelection, "addIndex:", aRow));
        }
        else
            newSelection = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", aRow);
    }
    else if (self._allowsMultipleSelection)
    {
        if (self._selectionAnchorRow == CPNotFound)
            self._selectionAnchorRow = self.isa.objj_msgSend0(self, "numberOfRows") - 1;
        newSelection = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(MIN(aRow, self._selectionAnchorRow), ABS(aRow - self._selectionAnchorRow) + 1));
        shouldExtendSelection = self.isa.objj_msgSend0(self, "mouseDownFlags") & CPShiftKeyMask && (self._lastSelectedRow == ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex")) && aRow > self._lastSelectedRow || self._lastSelectedRow == ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")) && aRow < self._lastSelectedRow);
    }
    else if (aRow >= 0 && aRow < self._numberOfRows)
        newSelection = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", aRow);
    else
        newSelection = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    if ((newSelection == null ? null : newSelection.isa.objj_msgSend1(newSelection, "isEqualToIndexSet:", self._selectedRowIndexes)))
        return;
    if (!self.isa.objj_msgSend0(self, "_sendDelegateSelectionShouldChangeInTableView"))
        return;
    newSelection = self.isa.objj_msgSend1(self, "_sendDelegateSelectionIndexesForProposedSelection:", newSelection);
    if (!self.isa.objj_msgSend0(self, "_delegateRespondsToSelectionIndexesForProposedSelection") && self.isa.objj_msgSend0(self, "_delegateRespondsToShouldSelectRow"))
    {
        var indexArray = [];
        (newSelection == null ? null : newSelection.isa.objj_msgSend3(newSelection, "getIndexes:maxCount:inIndexRange:", indexArray, -1, nil));
        var indexCount = indexArray.length;
        while (indexCount--)
        {
            var index = indexArray[indexCount];
            if (!self.isa.objj_msgSend1(self, "_sendDelegateShouldSelectRow:", index))
                (newSelection == null ? null : newSelection.isa.objj_msgSend1(newSelection, "removeIndex:", index));
        }
        if ((newSelection == null ? null : newSelection.isa.objj_msgSend0(newSelection, "count")) === 0)
            return;
    }
    if (!self._allowsEmptySelection && (newSelection == null ? null : newSelection.isa.objj_msgSend0(newSelection, "count")) === 0)
        return;
    if ((newSelection == null ? null : newSelection.isa.objj_msgSend1(newSelection, "isEqualToIndexSet:", self._selectedRowIndexes)))
        return;
    self.isa.objj_msgSend0(self, "_noteSelectionIsChanging");
    self.isa.objj_msgSend2(self, "selectRowIndexes:byExtendingSelection:", newSelection, shouldExtendSelection);
    self._lastSelectedRow = (newSelection == null ? null : newSelection.isa.objj_msgSend1(newSelection, "containsIndex:", aRow)) ? aRow : (newSelection == null ? null : newSelection.isa.objj_msgSend0(newSelection, "lastIndex"));
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("_noteSelectionIsChanging"), function $CPTableView___noteSelectionIsChanging(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPTableViewSelectionIsChangingNotification, self, nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_noteSelectionDidChange"), function $CPTableView___noteSelectionDidChange(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPTableViewSelectionDidChangeNotification, self, nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("becomeKeyWindow"), function $CPTableView__becomeKeyWindow(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("resignKeyWindow"), function $CPTableView__resignKeyWindow(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
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
    if (((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "type")) == CPLeftMouseDown && (hit == null ? null : hit.isa.objj_msgSend0(hit, "acceptsFirstResponder")) && !self.isa.objj_msgSend1(self, "isRowSelected:", self.isa.objj_msgSend1(self, "rowForView:", hit)))
        return self;
    return hit;
    var ___r1;
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("_startObservingFirstResponder"), function $CPTableView___startObservingFirstResponder(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_firstResponderDidChange:"), _CPWindowDidChangeFirstResponderNotification, self.isa.objj_msgSend0(self, "window")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_stopObservingFirstResponder"), function $CPTableView___stopObservingFirstResponder(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, _CPWindowDidChangeFirstResponderNotification, self.isa.objj_msgSend0(self, "window")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_firstResponderDidChange:"), function $CPTableView___firstResponderDidChange_(self, _cmd, aNotification)
{
    var responder = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder"));
    if (!(responder == null ? null : responder.isa.objj_msgSend1(responder, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))) || !(responder == null ? null : responder.isa.objj_msgSend1(responder, "isDescendantOf:", self)))
    {
        self._editingRow = CPNotFound;
        self._editingColumn = CPNotFound;
        self.isa.objj_msgSend0(self, "_notifyViewDidResignFirstResponder");
        return;
    }
    self._editingRow = self.isa.objj_msgSend1(self, "rowForView:", responder);
    self._editingColumn = self.isa.objj_msgSend1(self, "columnForView:", responder);
    self.isa.objj_msgSend0(self, "_notifyViewDidBecomeFirstResponder");
    if (self._editingRow !== CPNotFound && (responder == null ? null : responder.isa.objj_msgSend1(responder, "isKindOfClass:", CPTextField.isa.objj_msgSend0(CPTextField, "class"))) && !(responder == null ? null : responder.isa.objj_msgSend0(responder, "isBezeled")))
    {
        (responder == null ? null : responder.isa.objj_msgSend1(responder, "setBezeled:", YES));
        self.isa.objj_msgSend1(self, "_registerForEndEditingNote:", responder);
    }
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("_registerForEndEditingNote:"), function $CPTableView___registerForEndEditingNote_(self, _cmd, aTextField)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_textFieldEditingDidEnd:"), CPControlTextDidEndEditingNotification, aTextField));
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("_unregisterForEndEditingNote:"), function $CPTableView___unregisterForEndEditingNote_(self, _cmd, aTextField)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, CPControlTextDidEndEditingNotification, aTextField));
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("_textFieldEditingDidEnd:"), function $CPTableView___textFieldEditingDidEnd_(self, _cmd, aNote)
{
    var textField = (aNote == null ? null : aNote.isa.objj_msgSend0(aNote, "object"));
    self.isa.objj_msgSend1(self, "_unregisterForEndEditingNote:", textField);
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setBezeled:", NO));
    var action = self.isa.objj_msgSend1(self, "_disableActionIfExists:", textField);
    (textField == null ? null : textField.isa.objj_msgSend0(textField, "resignFirstResponder"));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setAction:", action));
}
,["void","CPNotification"]), new objj_method(sel_getUid("_disableActionIfExists:"), function $CPTableView___disableActionIfExists_(self, _cmd, aView)
{
    var action = nil;
    if ((aView == null ? null : aView.isa.objj_msgSend1(aView, "respondsToSelector:", sel_getUid("action"))) && (action = (aView == null ? null : aView.isa.objj_msgSend0(aView, "action"))))
        (aView == null ? null : aView.isa.objj_msgSend1(aView, "setAction:", nil));
    return action;
}
,["SEL","CPView"]), new objj_method(sel_getUid("keyDown:"), function $CPTableView__keyDown_(self, _cmd, anEvent)
{
    var character = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers")),
        modifierFlags = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags"));
    if (character === CPUpArrowFunctionKey || character === CPDownArrowFunctionKey)
    {
        if (self.isa.objj_msgSend0(self, "numberOfRows") !== 0)
        {
            self.isa.objj_msgSend2(self, "_moveSelectionWithEvent:upward:", anEvent, character === CPUpArrowFunctionKey);
            return;
        }
    }
    else if (character === CPDeleteCharacter || character === CPDeleteFunctionKey)
    {
        if (self.isa.objj_msgSend0(self, "_sendDelegateDeleteKeyPressed"))
            return;
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "keyDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_selectionIsBroken"), function $CPTableView___selectionIsBroken(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "selectedRowIndexes")._ranges.length !== 1;
}
,["BOOL"]), new objj_method(sel_getUid("_moveSelectionWithEvent:upward:"), function $CPTableView___moveSelectionWithEvent_upward_(self, _cmd, theEvent, shouldGoUpward)
{
    if (!self.isa.objj_msgSend0(self, "_sendDelegateSelectionShouldChangeInTableView"))
        return;
    var selectedIndexes = self.isa.objj_msgSend0(self, "selectedRowIndexes");
    if ((selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend0(selectedIndexes, "count")) > 0)
    {
        var extend = (theEvent == null ? null : theEvent.isa.objj_msgSend0(theEvent, "modifierFlags")) & CPShiftKeyMask && self._allowsMultipleSelection,
            i = self.isa.objj_msgSend0(self, "selectedRow");
        if (self.isa.objj_msgSend0(self, "_selectionIsBroken"))
        {
            while ((selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend1(selectedIndexes, "containsIndex:", i)))
            {
                shouldGoUpward ? i-- : i++;
            }
            self._wasSelectionBroken = true;
        }
        else if (self._wasSelectionBroken && (shouldGoUpward && i !== (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend0(selectedIndexes, "firstIndex")) || !shouldGoUpward && i !== (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend0(selectedIndexes, "lastIndex"))))
        {
            shouldGoUpward ? i = (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend0(selectedIndexes, "firstIndex")) - 1 : i = (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend0(selectedIndexes, "lastIndex"));
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
        if (self.isa.objj_msgSend0(self, "numberOfRows") > 0)
            var i = shouldGoUpward ? self.isa.objj_msgSend0(self, "numberOfRows") - 1 : 0;
    }
    if (i >= self.isa.objj_msgSend0(self, "numberOfRows") || i < 0)
        return;
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToSelectionIndexesForProposedSelection") || self.isa.objj_msgSend0(self, "_delegateRespondsToShouldSelectRow"))
    {
        var shouldSelect = !!((___r1 = self.isa.objj_msgSend1(self, "_cleanUpSelectionRowIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", i))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        while (!shouldSelect && (i < self.isa.objj_msgSend0(self, "numberOfRows") && i > 0))
        {
            shouldGoUpward ? --i : ++i;
            shouldSelect = !!((___r1 = self.isa.objj_msgSend1(self, "_cleanUpSelectionRowIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", i))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        }
        if (!shouldSelect)
            return;
    }
    if (extend && (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend1(selectedIndexes, "containsIndex:", i)))
    {
        var differedLastSelectedRow = i;
        shouldGoUpward ? i++ : i--;
        (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend1(selectedIndexes, "removeIndex:", i));
        extend = NO;
    }
    else if (extend)
    {
        if ((selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend1(selectedIndexes, "containsIndex:", i)))
        {
            i = shouldGoUpward ? (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend0(selectedIndexes, "firstIndex")) - 1 : (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend0(selectedIndexes, "lastIndex")) + 1;
            i = MIN(MAX(i, 0), self.isa.objj_msgSend0(self, "numberOfRows") - 1);
        }
        (selectedIndexes == null ? null : selectedIndexes.isa.objj_msgSend1(selectedIndexes, "addIndex:", i));
        var differedLastSelectedRow = i;
    }
    else
    {
        selectedIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", i);
        var differedLastSelectedRow = i;
    }
    selectedIndexes = self.isa.objj_msgSend1(self, "_sendDelegateSelectionIndexesForProposedSelection:", selectedIndexes);
    self.isa.objj_msgSend2(self, "selectRowIndexes:byExtendingSelection:", selectedIndexes, extend);
    self._lastSelectedRow = differedLastSelectedRow;
    if (i !== CPNotFound)
        self.isa.objj_msgSend1(self, "scrollRowToVisible:", i);
    var ___r1;
}
,["void","CPEvent","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPTableView__defaultThemeClass(self, _cmd)
{
    return "tableview";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPTableView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "alternating-row-colors", CPNull.isa.objj_msgSend0(CPNull, "null"), "grid-color", 1.0, "grid-line-thickness", CPNull.isa.objj_msgSend0(CPNull, "null"), "highlighted-grid-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "selection-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "sourcelist-selection-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "sort-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "sort-image-reversed", CPNull.isa.objj_msgSend0(CPNull, "null"), "selection-radius", CPNull.isa.objj_msgSend0(CPNull, "null"), "image-generic-file", 25.0, "default-row-height", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-on-background-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-on-border-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-on-border-width", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-on-border-radius", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-on-selected-background-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-on-selected-border-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-on-selected-border-width", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-on-selected-border-radius", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-above-border-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-above-border-width", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-above-selected-border-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "dropview-above-selected-border-width");
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
    return ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfRowsInTableView:", self));
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("_sendDataSourceObjectValueForTableColumn:row:"), function $CPTableView___sendDataSourceObjectValueForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_objectValueForTableColumn_row_))
        return nil;
    return ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:objectValueForTableColumn:row:", self, aTableColumn, aRowIndex));
    var ___r1;
}
,["id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDataSourceSetObjectValue:forTableColumn:row:"), function $CPTableView___sendDataSourceSetObjectValue_forTableColumn_row_(self, _cmd, anObject, aTableColumn, aRowIndex)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_setObjectValue_forTableColumn_row_))
        return;
    ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "tableView:setObjectValue:forTableColumn:row:", self, anObject, aTableColumn, aRowIndex));
    var ___r1;
}
,["void","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDataSourceSortDescriptorsDidChange:"), function $CPTableView___sendDataSourceSortDescriptorsDidChange_(self, _cmd, descriptors)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_sortDescriptorsDidChange_))
        return;
    ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tableView:sortDescriptorsDidChange:", self, descriptors));
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("_sendDataSourceAcceptDrop:row:dropOperation:"), function $CPTableView___sendDataSourceAcceptDrop_row_dropOperation_(self, _cmd, info, aRowIndex, operation)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_acceptDrop_row_dropOperation_))
        return NO;
    return ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "tableView:acceptDrop:row:dropOperation:", self, info, aRowIndex, operation));
    var ___r1;
}
,["BOOL","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("_sendDataSourceValidateDrop:proposedRow:proposedDropOperation:"), function $CPTableView___sendDataSourceValidateDrop_proposedRow_proposedDropOperation_(self, _cmd, info, aRowIndex, operation)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_validateDrop_proposedRow_proposedDropOperation_))
        return CPDragOperationNone;
    return ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "tableView:validateDrop:proposedRow:proposedDropOperation:", self, info, aRowIndex, operation));
    var ___r1;
}
,["CPDragOperation","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("_sendDataSourceWriteRowsWithIndexes:toPasteboard:"), function $CPTableView___sendDataSourceWriteRowsWithIndexes_toPasteboard_(self, _cmd, rowIndexes, pboard)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_writeRowsWithIndexes_toPasteboard_))
        return NO;
    return ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:writeRowsWithIndexes:toPasteboard:", self, rowIndexes, pboard));
    var ___r1;
}
,["BOOL","CPIndexSet","CPPasteboard"]), new objj_method(sel_getUid("draggedImage:endedAt:operation:"), function $CPTableView__draggedImage_endedAt_operation_(self, _cmd, anImage, aLocation, anOperation)
{
    if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableView:didEndDraggedImage:atPosition:operation:"))))
        ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "tableView:didEndDraggedImage:atPosition:operation:", self, anImage, aLocation, anOperation));
    var ___r1;
}
,["void","CPImage","CGPoint","CPDragOperation"]), new objj_method(sel_getUid("_sendDataSourceNamesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:"), function $CPTableView___sendDataSourceNamesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_(self, _cmd, dropDestination, indexSet)
{
    if (!(self._implementedDataSourceMethods & CPTableViewDataSource_tableView_namesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_))
        return [];
    return ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:", self, dropDestination, indexSet));
    var ___r1;
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
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tableView:didClickTableColumn:", self, self._tableColumns[column]));
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("_sendDelegateDidDragTableColumn:"), function $CPTableView___sendDelegateDidDragTableColumn_(self, _cmd, column)
{
    if (self._implementedDelegateMethods & CPTableViewDelegate_tableView_didDragTableColumn_)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tableView:didDragTableColumn:", self, self._tableColumns[column]));
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("_sendDelegateMouseDownInHeaderOfTableColumn:"), function $CPTableView___sendDelegateMouseDownInHeaderOfTableColumn_(self, _cmd, column)
{
    if (self._implementedDelegateMethods & CPTableViewDelegate_tableView_mouseDownInHeaderOfTableColumn_)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tableView:mouseDownInHeaderOfTableColumn:", self, self._tableColumns[column]));
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("_sendDelegateDeleteKeyPressed"), function $CPTableView___sendDelegateDeleteKeyPressed(self, _cmd)
{
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tableViewDeleteKeyPressed:"))))
    {
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "tableViewDeleteKeyPressed:", self));
        return YES;
    }
    return NO;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateSelectionShouldChangeInTableView"), function $CPTableView___sendDelegateSelectionShouldChangeInTableView(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_selectionShouldChangeInTableView_))
        return YES;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectionShouldChangeInTableView:", self));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateIsGroupRow:"), function $CPTableView___sendDelegateIsGroupRow_(self, _cmd, anIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_isGroupRow_))
        return NO;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tableView:isGroupRow:", self, anIndex));
    var ___r1;
}
,["BOOL","CPInteger"]), new objj_method(sel_getUid("_sendDelegateShouldSelectRow:"), function $CPTableView___sendDelegateShouldSelectRow_(self, _cmd, anIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldSelectRow_))
        return YES;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tableView:shouldSelectRow:", self, anIndex));
    var ___r1;
}
,["BOOL","CPInteger"]), new objj_method(sel_getUid("_sendDelegateWillDisplayView:forTableColumn:row:"), function $CPTableView___sendDelegateWillDisplayView_forTableColumn_row_(self, _cmd, aCell, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_willDisplayView_forTableColumn_row_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "tableView:willDisplayView:forTableColumn:row:", self, aCell, aTableColumn, aRowIndex));
    var ___r1;
}
,["void","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateWillRemoveView:forTableColumn:row:"), function $CPTableView___sendDelegateWillRemoveView_forTableColumn_row_(self, _cmd, aCell, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_willRemoveView_forTableColumn_row_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "tableView:willRemoveView:forTableColumn:row:", self, aCell, aTableColumn, aRowIndex));
    var ___r1;
}
,["void","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateMenuForTableColumn:row:"), function $CPTableView___sendDelegateMenuForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableViewMenuForTableColumn_row_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:menuForTableColumn:row:", self, aTableColumn, aRowIndex));
    var ___r1;
}
,["CPMenu","CPTableColumn","id"]), new objj_method(sel_getUid("_sendDelegateShouldReorderColumn:toColumn:"), function $CPTableView___sendDelegateShouldReorderColumn_toColumn_(self, _cmd, columnIndex, newColumnIndex)
{
    if (self.isa.objj_msgSend0(self, "allowsColumnReordering") && self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldReorderColumn_toColumn_)
    {
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:shouldReorderColumn:toColumn:", self, columnIndex, newColumnIndex));
    }
    return self.isa.objj_msgSend0(self, "allowsColumnReordering");
    var ___r1;
}
,["BOOL","CPInteger","CPInteger"]), new objj_method(sel_getUid("_sendDelegateHeightOfRow:"), function $CPTableView___sendDelegateHeightOfRow_(self, _cmd, anIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_heightOfRow_))
        return self.isa.objj_msgSend0(self, "rowHeight");
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tableView:heightOfRow:", self, anIndex));
    var ___r1;
}
,["float","CPInteger"]), new objj_method(sel_getUid("_sendDelegateShouldEditTableColumn:row:"), function $CPTableView___sendDelegateShouldEditTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldEditTableColumn_row_))
        return YES;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:shouldEditTableColumn:row:", self, aTableColumn, aRowIndex));
    var ___r1;
}
,["BOOL","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateSelectionIndexesForProposedSelection:"), function $CPTableView___sendDelegateSelectionIndexesForProposedSelection_(self, _cmd, anIndexSet)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_))
        return anIndexSet;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tableView:selectionIndexesForProposedSelection:", self, anIndexSet));
    var ___r1;
}
,["CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_sendDelegateViewForTableColumn:row:"), function $CPTableView___sendDelegateViewForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_viewForTableColumn_row_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:viewForTableColumn:row:", self, aTableColumn, aRowIndex));
    var ___r1;
}
,["CPView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateDataViewForTableColumn:row:"), function $CPTableView___sendDelegateDataViewForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_dataViewForTableColumn_row_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:dataViewForTableColumn:row:", self, aTableColumn, aRowIndex));
    var ___r1;
}
,["CPView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateShouldSelectTableColumn:"), function $CPTableView___sendDelegateShouldSelectTableColumn_(self, _cmd, aTableColumn)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldSelectTableColumn_))
        return YES;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tableView:shouldSelectTableColumn:", self, aTableColumn));
    var ___r1;
}
,["BOOL","CPTableColumn"]), new objj_method(sel_getUid("_sendDelegateToolTipForView:rect:tableColumn:row:mouseLocation:"), function $CPTableView___sendDelegateToolTipForView_rect_tableColumn_row_mouseLocation_(self, _cmd, aView, aRect, aTableColumn, aRowIndex, aPoint)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_toolTipForView_rect_tableColumn_row_mouseLocation_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "tableView:toolTipForView:rect:tableColumn:row:mouseLocation:", self, aView, aRect, aTableColumn, aRowIndex, aPoint));
    var ___r1;
}
,["CPString","id","CGRect","CPTableColumn","CPInteger","CGPoint"]), new objj_method(sel_getUid("_sendDelegateShouldTrackView:forTableColumn:row:"), function $CPTableView___sendDelegateShouldTrackView_forTableColumn_row_(self, _cmd, aView, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldTrackView_forTableColumn_row_))
        return YES;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "tableView:shouldTrackView:forTableColumn:row:", self, aView, aTableColumn, aRowIndex));
    var ___r1;
}
,["BOOL","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateShouldShowViewExpansionForTableColumn:row:"), function $CPTableView___sendDelegateShouldShowViewExpansionForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldShowViewExpansionForTableColumn_row_))
        return YES;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:shouldShowViewExpansionForTableColumn:row:", self, aTableColumn, aRowIndex));
    var ___r1;
}
,["BOOL","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateShouldTypeSelectForEvent:withCurrentSearchString:"), function $CPTableView___sendDelegateShouldTypeSelectForEvent_withCurrentSearchString_(self, _cmd, anEvent, aString)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldTypeSelectForEvent_withCurrentSearchString_))
        return NO;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:shouldTypeSelectForEvent:withCurrentSearchString:", self, anEvent, aString));
    var ___r1;
}
,["BOOL","CPEvent","CPString"]), new objj_method(sel_getUid("_sendDelegateTypeSelectStringForTableColumn:row:"), function $CPTableView___sendDelegateTypeSelectStringForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_typeSelectStringForTableColumn_row_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tableView:typeSelectStringForTableColumn:row:", self, aTableColumn, aRowIndex));
    var ___r1;
}
,["CPString","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateNextTypeSelectMatchFromRow:toRow:forString:"), function $CPTableView___sendDelegateNextTypeSelectMatchFromRow_toRow_forString_(self, _cmd, aRowIndex, aSecondRowIndex, aString)
{
    if (!(self._implementedDelegateMethods & CPTableViewDelegate_tableView_nextTypeSelectMatchFromRow_toRow_forString_))
        return -1;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "tableView:nextTypeSelectMatchFromRow:toRow:forString:", self, aRowIndex, aSecondRowIndex, aString));
    var ___r1;
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
    if (((___r1 = self.isa.objj_msgSend1(self, "infoForBinding:", "content")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedObjectKey)) !== destination)
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "bind:toObject:withKeyPath:options:", "content", destination, "arrangedObjects", nil);
        self._contentBindingExplicitlySet = NO;
    }
    if (!self._contentBindingExplicitlySet)
    {
        if (((___r1 = self.isa.objj_msgSend1(self, "infoForBinding:", "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedObjectKey)) !== destination)
            self.isa.objj_msgSend(self, "bind:toObject:withKeyPath:options:", "selectionIndexes", destination, "selectionIndexes", nil);
        if (((___r1 = self.isa.objj_msgSend1(self, "infoForBinding:", "sortDescriptors")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedObjectKey)) !== destination)
            self.isa.objj_msgSend(self, "bind:toObject:withKeyPath:options:", "sortDescriptors", destination, "sortDescriptors", nil);
    }
    var ___r1;
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
        return (CPTableContentBinder == null ? null : CPTableContentBinder.isa.objj_msgSend0(CPTableContentBinder, "class"));
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
    var destination = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedObjectKey)),
        keyPath = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedKeyPathKey));
    self._content = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKey:", keyPath));
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    var ___r1;
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
        self._allowsColumnReordering = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTableViewColumnReorderingKey));
        self._allowsColumnResizing = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTableViewColumnResizingKey));
        self._allowsMultipleSelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTableViewMultipleSelectionKey));
        self._allowsEmptySelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTableViewEmptySelectionKey));
        self._allowsColumnSelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTableViewColumnSelectionKey));
        self._selectionHighlightStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPTableViewSelectionHighlightStyleKey));
        self._columnAutoResizingStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPTableViewColumnAutoresizingStyleKey));
        self._tableColumns = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableViewTableColumnsKey)) || [];
        ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setTableView:"), self));
        self._rowHeight = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPTableViewRowHeightKey)) || (self == null ? null : self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "default-row-height"));
        self._intercellSpacing = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", CPTableViewIntercellSpacingKey));
        if (CGSizeEqualToSize(self._intercellSpacing, CGSizeMakeZero()))
            self._intercellSpacing = CGSizeMake(3.0, 2.0);
        (self == null ? null : self.isa.objj_msgSend1(self, "setGridColor:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableViewGridColorKey))));
        self._gridStyleMask = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPTableViewGridStyleMaskKey));
        self._usesAlternatingRowBackgroundColors = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableViewUsesAlternatingBackgroundKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAlternatingRowBackgroundColors:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableViewAlternatingRowColorsKey))));
        self._headerView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableViewHeaderViewKey));
        self._cornerView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableViewCornerViewKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDataSource:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableViewDataSourceKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDelegate:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableViewDelegateKey))));
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPTableViewArchivedReusableViewsKey)))
            self._archivedDataViews = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableViewArchivedReusableViewsKey));
        (self == null ? null : self.isa.objj_msgSend0(self, "_updateIsViewBased"));
        (self == null ? null : self.isa.objj_msgSend1(self, "viewWillMoveToSuperview:", (self == null ? null : self.isa.objj_msgSend0(self, "superview"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutosaveName:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableViewAutosaveNameKey))));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTableView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._dataSource, CPTableViewDataSourceKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._delegate, CPTableViewDelegateKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._rowHeight, CPTableViewRowHeightKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeSize:forKey:", self._intercellSpacing, CPTableViewIntercellSpacingKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._selectionHighlightStyle, CPTableViewSelectionHighlightStyleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._columnAutoResizingStyle, CPTableViewColumnAutoresizingStyleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowsMultipleSelection, CPTableViewMultipleSelectionKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowsEmptySelection, CPTableViewEmptySelectionKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowsColumnReordering, CPTableViewColumnReorderingKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowsColumnResizing, CPTableViewColumnResizingKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowsColumnSelection, CPTableViewColumnSelectionKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._tableColumns, CPTableViewTableColumnsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "gridColor"), CPTableViewGridColorKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._gridStyleMask, CPTableViewGridStyleMaskKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._usesAlternatingRowBackgroundColors, CPTableViewUsesAlternatingBackgroundKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "alternatingRowBackgroundColors"), CPTableViewAlternatingRowColorsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._cornerView, CPTableViewCornerViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._headerView, CPTableViewHeaderViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._autosaveName, CPTableViewAutosaveNameKey));
    if (self._archivedDataViews)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._archivedDataViews, CPTableViewArchivedReusableViewsKey));
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("removeMatches:"), function $CPIndexSet__removeMatches_(self, _cmd, otherSet)
{
    var firstindex = self.isa.objj_msgSend0(self, "firstIndex"),
        index = MIN(firstindex, (otherSet == null ? null : otherSet.isa.objj_msgSend0(otherSet, "firstIndex"))),
        switchFlag = index == firstindex;
    while (index != CPNotFound)
    {
        var indexSet = switchFlag ? otherSet : self,
            otherIndex = (indexSet == null ? null : indexSet.isa.objj_msgSend1(indexSet, "indexGreaterThanOrEqualToIndex:", index));
        if (otherIndex == index)
        {
            self.isa.objj_msgSend1(self, "removeIndex:", index);
            (otherSet == null ? null : otherSet.isa.objj_msgSend1(otherSet, "removeIndex:", index));
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
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        borderRadius,
        borderColor,
        borderWidth,
        backgroundColor;
    if (self.currentRow === -1)
    {
        borderColor = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-on-border-color"));
        borderWidth = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-on-border-width"));
        CGContextSetStrokeColor(context, borderColor);
        CGContextSetLineWidth(context, borderWidth);
        CGContextStrokeRect(context, self.isa.objj_msgSend0(self, "bounds"));
    }
    else if (self.dropOperation === CPTableViewDropOn)
    {
        var selectedRows = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRowIndexes")),
            newRect = CGRectMake(aRect.origin.x + 2, aRect.origin.y + 2, aRect.size.width - 4, aRect.size.height - 5);
        if ((selectedRows == null ? null : selectedRows.isa.objj_msgSend1(selectedRows, "containsIndex:", self.currentRow)))
        {
            borderRadius = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-on-selected-border-radius"));
            borderColor = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-on-selected-border-color"));
            borderWidth = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-on-selected-border-width"));
            backgroundColor = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-on-selected-background-color"));
        }
        else
        {
            borderRadius = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-on-border-radius"));
            borderColor = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-on-border-color"));
            borderWidth = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-on-border-width"));
            backgroundColor = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-on-background-color"));
        }
        CGContextSetStrokeColor(context, borderColor);
        CGContextSetLineWidth(context, borderWidth);
        CGContextSetFillColor(context, backgroundColor);
        CGContextFillRoundedRectangleInRect(context, newRect, borderRadius, YES, YES, YES, YES);
        CGContextStrokeRoundedRectangleInRect(context, newRect, borderRadius, YES, YES, YES, YES);
    }
    else if (self.dropOperation === CPTableViewDropAbove)
    {
        self.isa.objj_msgSend1(self, "setFrameOrigin:", CGPointMake(self._frame.origin.x, self._frame.origin.y - 8));
        var selectedRows = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRowIndexes"));
        if ((selectedRows == null ? null : selectedRows.isa.objj_msgSend1(selectedRows, "containsIndex:", self.currentRow - 1)) || (selectedRows == null ? null : selectedRows.isa.objj_msgSend1(selectedRows, "containsIndex:", self.currentRow)))
        {
            borderColor = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-above-selected-border-color"));
            borderWidth = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-above-selected-border-width"));
        }
        else
        {
            borderColor = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-above-border-color"));
            borderWidth = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "dropview-above-border-width"));
        }
        CGContextSetStrokeColor(context, borderColor);
        CGContextSetLineWidth(context, borderWidth);
        CGContextStrokeEllipseInRect(context, CGRectMake(aRect.origin.x + 4, aRect.origin.y + 4, 8, 8));
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, 10, aRect.origin.y + 8);
        CGContextAddLineToPoint(context, aRect.size.width - aRect.origin.y - 8, aRect.origin.y + 8);
        CGContextStrokePath(context);
    }
    var ___r1;
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
    CPTimer.isa.objj_msgSend3(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", 0.1, showCallback, NO);
    CPTimer.isa.objj_msgSend3(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", 0.19, hideCallback, NO);
    CPTimer.isa.objj_msgSend3(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", 0.27, showCallback, NO);
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
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextSetStrokeColor(context, self._lineColor);
    var points = [CGPointMake(0.5, 0), CGPointMake(0.5, aRect.size.height)];
    CGContextStrokeLineSegments(context, points, 2);
    points = [CGPointMake(aRect.size.width - 0.5, 0), CGPointMake(aRect.size.width - 0.5, aRect.size.height)];
    CGContextStrokeLineSegments(context, points, 2);
    var ___r1;
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
    self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateTableDataView);
}
,["void"]), new objj_method(sel_getUid("setThemeState:"), function $CPTableCellView__setThemeState_(self, _cmd, aState)
{
    if (aState.isa && (aState == null ? null : aState.isa.objj_msgSend1(aState, "isKindOfClass:", CPArray)))
        aState = CPThemeState.apply(null, aState);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableCellView").super_class }, "setThemeState:", aState);
    self.isa.objj_msgSend3(self, "recursivelyPerformSelector:withObject:startingFrom:", sel_getUid("setThemeState:"), aState, self);
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("unsetThemeState:"), function $CPTableCellView__unsetThemeState_(self, _cmd, aState)
{
    if (aState.isa && (aState == null ? null : aState.isa.objj_msgSend1(aState, "isKindOfClass:", CPArray)))
        aState = CPThemeState.apply(null, aState);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableCellView").super_class }, "unsetThemeState:", aState);
    self.isa.objj_msgSend3(self, "recursivelyPerformSelector:withObject:startingFrom:", sel_getUid("unsetThemeState:"), aState, self);
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("recursivelyPerformSelector:withObject:startingFrom:"), function $CPTableCellView__recursivelyPerformSelector_withObject_startingFrom_(self, _cmd, selector, anObject, aView)
{
    ((___r1 = (aView == null ? null : aView.isa.objj_msgSend0(aView, "subviews"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "enumerateObjectsUsingBlock:", function(view, idx)
    {
        (view == null ? null : view.isa.objj_msgSend2(view, "performSelector:withObject:", selector, anObject));
        if (!(view == null ? null : view.isa.objj_msgSend1(view, "isKindOfClass:", self.isa.objj_msgSend0(self, "class"))))
            self.isa.objj_msgSend3(self, "recursivelyPerformSelector:withObject:startingFrom:", selector, anObject, view);
    }));
    var ___r1;
}
,["void","SEL","id","id"]), new objj_method(sel_getUid("description"), function $CPTableCellView__description(self, _cmd)
{
    return "<" + self.isa.objj_msgSend0(self, "className") + " 0x" + CPString.isa.objj_msgSend1(CPString, "stringWithHash:", self.isa.objj_msgSend0(self, "UID")) + " identifier=" + self.isa.objj_msgSend0(self, "identifier") + ">";
}
,["CPString"])]);
}