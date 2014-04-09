@STATIC;1.0;i;10;CPButton.ji;15;CPTableColumn.ji;13;CPTableView.jt;80797;objj_executeFile("CPButton.j", YES);objj_executeFile("CPTableColumn.j", YES);objj_executeFile("CPTableView.j", YES);CPOutlineViewColumnDidMoveNotification = "CPOutlineViewColumnDidMoveNotification";
CPOutlineViewColumnDidResizeNotification = "CPOutlineViewColumnDidResizeNotification";
CPOutlineViewItemDidCollapseNotification = "CPOutlineViewItemDidCollapseNotification";
CPOutlineViewItemDidExpandNotification = "CPOutlineViewItemDidExpandNotification";
CPOutlineViewItemWillCollapseNotification = "CPOutlineViewItemWillCollapseNotification";
CPOutlineViewItemWillExpandNotification = "CPOutlineViewItemWillExpandNotification";
CPOutlineViewSelectionDidChangeNotification = "CPOutlineViewSelectionDidChangeNotification";
CPOutlineViewSelectionIsChangingNotification = "CPOutlineViewSelectionIsChangingNotification";
var CPOutlineViewDataSource_outlineView_objectValue_forTableColumn_byItem_ = 1 << 1,
    CPOutlineViewDataSource_outlineView_setObjectValue_forTableColumn_byItem_ = 1 << 2,
    CPOutlineViewDataSource_outlineView_shouldDeferDisplayingChildrenOfItem_ = 1 << 3,
    CPOutlineViewDataSource_outlineView_acceptDrop_item_childIndex_ = 1 << 4,
    CPOutlineViewDataSource_outlineView_validateDrop_proposedItem_proposedChildIndex_ = 1 << 5,
    CPOutlineViewDataSource_outlineView_validateDrop_proposedRow_proposedDropOperation_ = 1 << 6,
    CPOutlineViewDataSource_outlineView_namesOfPromisedFilesDroppedAtDestination_forDraggedItems_ = 1 << 7,
    CPOutlineViewDataSource_outlineView_itemForPersistentObject_ = 1 << 8,
    CPOutlineViewDataSource_outlineView_persistentObjectForItem_ = 1 << 9,
    CPOutlineViewDataSource_outlineView_writeItems_toPasteboard_ = 1 << 10,
    CPOutlineViewDataSource_outlineView_sortDescriptorsDidChange_ = 1 << 11;
var CPOutlineViewDelegate_outlineView_dataViewForTableColumn_item_ = 1 << 1,
    CPOutlineViewDelegate_outlineView_didClickTableColumn_ = 1 << 2,
    CPOutlineViewDelegate_outlineView_didDragTableColumn_ = 1 << 3,
    CPOutlineViewDelegate_outlineView_heightOfRowByItem_ = 1 << 4,
    CPOutlineViewDelegate_outlineView_isGroupItem_ = 1 << 5,
    CPOutlineViewDelegate_outlineView_mouseDownInHeaderOfTableColumn_ = 1 << 6,
    CPOutlineViewDelegate_outlineView_nextTypeSelectMatchFromItem_toItem_forString_ = 1 << 7,
    CPOutlineViewDelegate_outlineView_selectionIndexesForProposedSelection_ = 1 << 8,
    CPOutlineViewDelegate_outlineView_shouldCollapseItem_ = 1 << 9,
    CPOutlineViewDelegate_outlineView_shouldEditTableColumn_item_ = 1 << 10,
    CPOutlineViewDelegate_outlineView_shouldExpandItem_ = 1 << 11,
    CPOutlineViewDelegate_outlineView_shouldReorderColumn_toColumn_ = 1 << 12,
    CPOutlineViewDelegate_outlineView_shouldSelectItem_ = 1 << 13,
    CPOutlineViewDelegate_outlineView_shouldSelectTableColumn_ = 1 << 14,
    CPOutlineViewDelegate_outlineView_shouldShowOutlineDisclosureControlForItem_ = 1 << 15,
    CPOutlineViewDelegate_outlineView_shouldShowViewExpansionForTableColumn_item_ = 1 << 16,
    CPOutlineViewDelegate_outlineView_shouldTrackView_forTableColumn_item_ = 1 << 17,
    CPOutlineViewDelegate_outlineView_shouldTypeSelectForEvent_withCurrentSearchString_ = 1 << 18,
    CPOutlineViewDelegate_outlineView_sizeToFitWidthOfColumn_ = 1 << 19,
    CPOutlineViewDelegate_outlineView_toolTipForView_rect_tableColumn_item_mouseLocation_ = 1 << 20,
    CPOutlineViewDelegate_outlineView_typeSelectStringForTableColumn_item_ = 1 << 21,
    CPOutlineViewDelegate_outlineView_willDisplayOutlineView_forTableColumn_item_ = 1 << 22,
    CPOutlineViewDelegate_outlineView_willDisplayView_forTableColumn_item_ = 1 << 23,
    CPOutlineViewDelegate_outlineView_willRemoveView_forTableColumn_item_ = 1 << 24,
    CPOutlineViewDelegate_selectionShouldChangeInOutlineView_ = 1 << 25,
    CPOutlineViewDelegate_outlineView_menuForTableColumn_item_ = 1 << 26,
    CPOutlineViewDelegate_outlineView_viewForTableColumn_item_ = 1 << 27;
CPOutlineViewDropOnItemIndex = -1;
var CPOutlineViewCoalesceSelectionNotificationStateOff = 0,
    CPOutlineViewCoalesceSelectionNotificationStateOn = 1,
    CPOutlineViewCoalesceSelectionNotificationStateDid = 2;
{var the_protocol = objj_allocateProtocol("CPOutlineViewDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPOutlineViewDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}{var the_protocol = objj_allocateProtocol("CPOutlineViewDataSource");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPOutlineViewDataSource\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}{var the_class = objj_allocateClassPair(CPTableView, "CPOutlineView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_outlineViewDataSource"), new objj_ivar("_outlineViewDelegate"), new objj_ivar("_outlineTableColumn"), new objj_ivar("_indentationPerLevel"), new objj_ivar("_indentationMarkerFollowsDataView"), new objj_ivar("_implementedOutlineViewDataSourceMethods"), new objj_ivar("_implementedOutlineViewDelegateMethods"), new objj_ivar("_rootItemInfo"), new objj_ivar("_itemsForRows"), new objj_ivar("_itemInfosForItems"), new objj_ivar("_disclosureControlPrototype"), new objj_ivar("_disclosureControlsForRows"), new objj_ivar("_disclosureControlData"), new objj_ivar("_disclosureControlQueue"), new objj_ivar("_shouldRetargetItem"), new objj_ivar("_retargetedItem"), new objj_ivar("_shouldRetargetChildIndex"), new objj_ivar("_retargedChildIndex"), new objj_ivar("_dragHoverTimer"), new objj_ivar("_dropItem"), new objj_ivar("_coalesceSelectionNotificationState")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPOutlineView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._selectionHighlightStyle = CPTableViewSelectionHighlightStyleSourceList;
        self._rootItemInfo = {isExpanded: YES, isExpandable: NO, shouldShowOutlineDisclosureControl: NO, level: -1, row: -1, children: [], weight: 0};
        self._itemsForRows = [];
        self._itemInfosForItems = {};
        self._disclosureControlsForRows = [];
        self._retargetedItem = nil;
        self._shouldRetargetItem = NO;
        self._retargedChildIndex = nil;
        self._shouldRetargetChildIndex = NO;
        objj_msgSend(self, "setIndentationPerLevel:", 16.0);
        objj_msgSend(self, "setIndentationMarkerFollowsDataView:", YES);
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "setDataSource:", objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDataSource, "alloc"), "initWithOutlineView:", self));
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "setDelegate:", objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDelegate, "alloc"), "initWithOutlineView:", self));
        objj_msgSend(self, "setDisclosureControlPrototype:", objj_msgSend(objj_msgSend(CPDisclosureButton, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 10.0, 10.0)));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setDataSource:"), function $CPOutlineView__setDataSource_(self, _cmd, aDataSource)
{
    if (self._outlineViewDataSource === aDataSource)
        return;
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:child:ofItem:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:child:ofItem:'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:isItemExpandable:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:isItemExpandable:'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:numberOfChildrenOfItem:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:numberOfChildrenOfItem:'");
    self._outlineViewDataSource = aDataSource;
    self._implementedOutlineViewDataSourceMethods = 0;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:objectValueForTableColumn:byItem:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_objectValue_forTableColumn_byItem_;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:setObjectValue:forTableColumn:byItem:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_setObjectValue_forTableColumn_byItem_;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:shouldDeferDisplayingChildrenOfItem:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_shouldDeferDisplayingChildrenOfItem_;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:acceptDrop:item:childIndex:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_acceptDrop_item_childIndex_;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:validateDrop:proposedItem:proposedChildIndex:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_validateDrop_proposedItem_proposedChildIndex_;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:validateDrop:proposedRow:proposedDropOperation:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_validateDrop_proposedRow_proposedDropOperation_;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:namesOfPromisedFilesDroppedAtDestination:forDraggedItems:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_namesOfPromisedFilesDroppedAtDestination_forDraggedItems_;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:itemForPersistentObject:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_itemForPersistentObject_;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:persistentObjectForItem:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_persistentObjectForItem_;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:writeItems:toPasteboard:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_writeItems_toPasteboard_;
    if (objj_msgSend(self._outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:sortDescriptorsDidChange:")))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_sortDescriptorsDidChange_;
    objj_msgSend(self, "reloadData");
}
,["void","id"]), new objj_method(sel_getUid("dataSource"), function $CPOutlineView__dataSource(self, _cmd)
{
    return self._outlineViewDataSource;
}
,["id"]), new objj_method(sel_getUid("isExpandable:"), function $CPOutlineView__isExpandable_(self, _cmd, anItem)
{
    if (!anItem)
        return YES;
    var itemInfo = self._itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return NO;
    return itemInfo.isExpandable;
}
,["BOOL","id"]), new objj_method(sel_getUid("_shouldShowOutlineDisclosureControlForItem:"), function $CPOutlineView___shouldShowOutlineDisclosureControlForItem_(self, _cmd, anItem)
{
    if (!anItem)
        return YES;
    var itemInfo = self._itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return YES;
    return itemInfo.shouldShowOutlineDisclosureControl;
}
,["BOOL","id"]), new objj_method(sel_getUid("isItemExpanded:"), function $CPOutlineView__isItemExpanded_(self, _cmd, anItem)
{
    if (!anItem)
        return YES;
    var itemInfo = self._itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return NO;
    return itemInfo.isExpanded;
}
,["BOOL","id"]), new objj_method(sel_getUid("expandItem:"), function $CPOutlineView__expandItem_(self, _cmd, anItem)
{
    objj_msgSend(self, "expandItem:expandChildren:", anItem, NO);
}
,["void","id"]), new objj_method(sel_getUid("expandItem:expandChildren:"), function $CPOutlineView__expandItem_expandChildren_(self, _cmd, anItem, shouldExpandChildren)
{
    if (objj_msgSend(self, "_delegateRespondsToShouldExpandItem"))
        if (objj_msgSend(self._outlineViewDelegate, "outlineView:shouldExpandItem:", self, anItem) == NO)
            return;
    var itemInfo = null;
    if (!anItem)
        itemInfo = self._rootItemInfo;
    else
        itemInfo = self._itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return;
    var isTopLevel = NO;
    if (!self._coalesceSelectionNotificationState)
    {
        isTopLevel = YES;
        self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateOn;
    }
    if (!itemInfo.isExpanded)
    {
        objj_msgSend(self, "_noteItemWillExpand:", anItem);
        var previousRowCount = objj_msgSend(self, "numberOfRows");
        itemInfo.isExpanded = YES;
        objj_msgSend(self, "reloadItem:reloadChildren:", anItem, YES);
        objj_msgSend(self, "_noteItemDidExpand:", anItem);
        var rowCountDelta = objj_msgSend(self, "numberOfRows") - previousRowCount;
        if (rowCountDelta)
        {
            var selection = objj_msgSend(self, "selectedRowIndexes"),
                expandIndex = objj_msgSend(self, "rowForItem:", anItem) + 1;
            if (objj_msgSend(selection, "intersectsIndexesInRange:", CPMakeRange(expandIndex, self._itemsForRows.length)))
            {
                objj_msgSend(self, "_noteSelectionIsChanging");
                objj_msgSend(selection, "shiftIndexesStartingAtIndex:by:", expandIndex, rowCountDelta);
                objj_msgSend(self, "_setSelectedRowIndexes:", selection);
            }
        }
    }
    if (shouldExpandChildren)
    {
        var children = itemInfo.children,
            childIndex = children.length;
        while (childIndex--)
            objj_msgSend(self, "expandItem:expandChildren:", children[childIndex], YES);
    }
    if (isTopLevel)
    {
        var r = self._coalesceSelectionNotificationState;
        self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateOff;
        if (r === CPOutlineViewCoalesceSelectionNotificationStateDid)
            objj_msgSend(self, "_noteSelectionDidChange");
    }
}
,["void","id","BOOL"]), new objj_method(sel_getUid("collapseItem:"), function $CPOutlineView__collapseItem_(self, _cmd, anItem)
{
    if (!anItem)
        return;
    if (objj_msgSend(self, "_delegateRespondsToShouldCollapseItem"))
        if (objj_msgSend(self._outlineViewDelegate, "outlineView:shouldCollapseItem:", self, anItem) == NO)
            return;
    var itemInfo = self._itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return;
    if (!itemInfo.isExpanded)
        return;
    self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateOn;
    objj_msgSend(self, "_noteItemWillCollapse:", anItem);
    var collapseTopIndex = objj_msgSend(self, "rowForItem:", anItem),
        topLevel = objj_msgSend(self, "levelForRow:", collapseTopIndex),
        collapseEndIndex = collapseTopIndex;
    while (collapseEndIndex + 1 < self._itemsForRows.length && objj_msgSend(self, "levelForRow:", collapseEndIndex + 1) > topLevel)
        collapseEndIndex++;
    var collapseRange = CPMakeRange(collapseTopIndex + 1, collapseEndIndex - collapseTopIndex);
    if (collapseRange.length)
    {
        var selection = objj_msgSend(self, "selectedRowIndexes");
        if (objj_msgSend(selection, "intersectsIndexesInRange:", collapseRange))
        {
            objj_msgSend(self, "_noteSelectionIsChanging");
            objj_msgSend(selection, "removeIndexesInRange:", collapseRange);
            objj_msgSend(self, "_setSelectedRowIndexes:", selection);
        }
        if (objj_msgSend(selection, "intersectsIndexesInRange:", CPMakeRange(collapseEndIndex + 1, self._itemsForRows.length)))
        {
            objj_msgSend(self, "_noteSelectionIsChanging");
            objj_msgSend(selection, "shiftIndexesStartingAtIndex:by:", collapseEndIndex + 1, -collapseRange.length);
            objj_msgSend(self, "_setSelectedRowIndexes:", selection);
        }
    }
    itemInfo.isExpanded = NO;
    objj_msgSend(self, "reloadItem:reloadChildren:", anItem, YES);
    objj_msgSend(self, "_noteItemDidCollapse:", anItem);
    var r = self._coalesceSelectionNotificationState;
    self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateOff;
    if (r === CPOutlineViewCoalesceSelectionNotificationStateDid)
        objj_msgSend(self, "_noteSelectionDidChange");
}
,["void","id"]), new objj_method(sel_getUid("reloadItem:"), function $CPOutlineView__reloadItem_(self, _cmd, anItem)
{
    objj_msgSend(self, "reloadItem:reloadChildren:", anItem, NO);
}
,["void","id"]), new objj_method(sel_getUid("reloadItem:reloadChildren:"), function $CPOutlineView__reloadItem_reloadChildren_(self, _cmd, anItem, shouldReloadChildren)
{
    if (!!shouldReloadChildren || !anItem)
        _loadItemInfoForItem(self, anItem);
    else
        _reloadItem(self, anItem);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "reloadData");
}
,["void","id","BOOL"]), new objj_method(sel_getUid("itemAtRow:"), function $CPOutlineView__itemAtRow_(self, _cmd, aRow)
{
    return self._itemsForRows[aRow] || nil;
}
,["id","CPInteger"]), new objj_method(sel_getUid("rowForItem:"), function $CPOutlineView__rowForItem_(self, _cmd, anItem)
{
    if (!anItem)
        return self._rootItemInfo.row;
    var itemInfo = self._itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return CPNotFound;
    return itemInfo.row;
}
,["CPInteger","id"]), new objj_method(sel_getUid("setOutlineTableColumn:"), function $CPOutlineView__setOutlineTableColumn_(self, _cmd, aTableColumn)
{
    if (self._outlineTableColumn === aTableColumn)
        return;
    self._outlineTableColumn = aTableColumn;
    objj_msgSend(self, "reloadData");
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("outlineTableColumn"), function $CPOutlineView__outlineTableColumn(self, _cmd)
{
    return self._outlineTableColumn;
}
,["CPTableColumn"]), new objj_method(sel_getUid("levelForItem:"), function $CPOutlineView__levelForItem_(self, _cmd, anItem)
{
    if (!anItem)
        return self._rootItemInfo.level;
    var itemInfo = self._itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return CPNotFound;
    return itemInfo.level;
}
,["CPInteger","id"]), new objj_method(sel_getUid("levelForRow:"), function $CPOutlineView__levelForRow_(self, _cmd, aRow)
{
    return objj_msgSend(self, "levelForItem:", objj_msgSend(self, "itemAtRow:", aRow));
}
,["CPInteger","CPInteger"]), new objj_method(sel_getUid("setIndentationPerLevel:"), function $CPOutlineView__setIndentationPerLevel_(self, _cmd, anIndentationWidth)
{
    if (self._indentationPerLevel === anIndentationWidth)
        return;
    self._indentationPerLevel = anIndentationWidth;
    objj_msgSend(self, "reloadData");
}
,["void","float"]), new objj_method(sel_getUid("indentationPerLevel"), function $CPOutlineView__indentationPerLevel(self, _cmd)
{
    return self._indentationPerLevel;
}
,["float"]), new objj_method(sel_getUid("setIndentationMarkerFollowsDataView:"), function $CPOutlineView__setIndentationMarkerFollowsDataView_(self, _cmd, indentationMarkerShouldFollowDataView)
{
    if (self._indentationMarkerFollowsDataView === indentationMarkerShouldFollowDataView)
        return;
    self._indentationMarkerFollowsDataView = indentationMarkerShouldFollowDataView;
    objj_msgSend(self, "reloadData");
}
,["void","BOOL"]), new objj_method(sel_getUid("indentationMarkerFollowsDataView"), function $CPOutlineView__indentationMarkerFollowsDataView(self, _cmd)
{
    return self._indentationMarkerFollowsDataView;
}
,["BOOL"]), new objj_method(sel_getUid("parentForItem:"), function $CPOutlineView__parentForItem_(self, _cmd, anItem)
{
    if (!anItem)
        return nil;
    var itemInfo = self._itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return nil;
    var parent = itemInfo.parent;
    if (itemInfo[objj_msgSend(parent, "UID")] === self._rootItemInfo)
        parent = nil;
    return parent;
}
,["id","id"]), new objj_method(sel_getUid("_frameOfOutlineDataViewAtRow:"), function $CPOutlineView___frameOfOutlineDataViewAtRow_(self, _cmd, aRow)
{
    var columnIndex = objj_msgSend(objj_msgSend(self, "tableColumns"), "indexOfObject:", self._outlineTableColumn),
        frame = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "frameOfDataViewAtColumn:row:", columnIndex, aRow),
        indentationWidth = (objj_msgSend(self, "levelForRow:", aRow) + 1) * objj_msgSend(self, "indentationPerLevel");
    frame.origin.x += indentationWidth;
    frame.size.width -= indentationWidth;
    return frame;
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("frameOfOutlineDisclosureControlAtRow:"), function $CPOutlineView__frameOfOutlineDisclosureControlAtRow_(self, _cmd, aRow)
{
    var theItem = objj_msgSend(self, "itemAtRow:", aRow);
    if (!objj_msgSend(self, "isExpandable:", theItem) || !objj_msgSend(self, "_shouldShowOutlineDisclosureControlForItem:", theItem))
        return CGRectMakeZero();
    var dataViewFrame = objj_msgSend(self, "_frameOfOutlineDataViewAtRow:", aRow),
        disclosureWidth = CGRectGetWidth(objj_msgSend(self._disclosureControlPrototype, "frame")),
        frame = CGRectMake(CGRectGetMinX(dataViewFrame) - disclosureWidth, CGRectGetMinY(dataViewFrame), disclosureWidth, CGRectGetHeight(dataViewFrame));
    return frame;
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("_setSelectedRowIndexes:"), function $CPOutlineView___setSelectedRowIndexes_(self, _cmd, rows)
{
    if (self._disclosureControlsForRows.length)
    {
        var indexes = objj_msgSend(self._selectedRowIndexes, "copy");
        objj_msgSend(indexes, "removeIndexesInRange:", CPMakeRange(self._disclosureControlsForRows.length, self._itemsForRows.length - self._disclosureControlsForRows.length));
        objj_msgSend(objj_msgSend(self._disclosureControlsForRows, "objectsAtIndexes:", indexes), "makeObjectsPerformSelector:withObject:", sel_getUid("unsetThemeState:"), CPThemeStateSelected);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "_setSelectedRowIndexes:", rows);
    if (self._disclosureControlsForRows.length)
    {
        var indexes = objj_msgSend(self._selectedRowIndexes, "copy");
        objj_msgSend(indexes, "removeIndexesInRange:", CPMakeRange(self._disclosureControlsForRows.length, self._itemsForRows.length - self._disclosureControlsForRows.length));
        objj_msgSend(objj_msgSend(self._disclosureControlsForRows, "objectsAtIndexes:", indexes), "makeObjectsPerformSelector:withObject:", sel_getUid("setThemeState:"), CPThemeStateSelected);
    }
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("setDelegate:"), function $CPOutlineView__setDelegate_(self, _cmd, aDelegate)
{
    if (self._outlineViewDelegate === aDelegate)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (self._outlineViewDelegate)
    {
        if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewColumnDidMove:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewColumnDidMoveNotification, self);
        if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewColumnDidResize:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewColumnDidResizeNotification, self);
        if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewSelectionDidChange:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewSelectionDidChangeNotification, self);
        if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewSelectionIsChanging:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewSelectionIsChangingNotification, self);
        if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewItemWillExpand:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewItemWillExpandNotification, self);
        if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewItemDidExpand:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewItemDidExpandNotification, self);
        if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewItemWillCollapse:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewItemWillCollapseNotification, self);
        if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewItemDidCollapse:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewItemDidCollapseNotification, self);
    }
    self._outlineViewDelegate = aDelegate;
    self._implementedOutlineViewDelegateMethods = 0;
    var delegateMethods = [CPOutlineViewDelegate_outlineView_dataViewForTableColumn_item_, sel_getUid("outlineView:dataViewForTableColumn:item:"), CPOutlineViewDelegate_outlineView_viewForTableColumn_item_, sel_getUid("outlineView:viewForTableColumn:item:"), CPOutlineViewDelegate_outlineView_didClickTableColumn_, sel_getUid("outlineView:didClickTableColumn:"), CPOutlineViewDelegate_outlineView_didDragTableColumn_, sel_getUid("outlineView:didDragTableColumn:"), CPOutlineViewDelegate_outlineView_heightOfRowByItem_, sel_getUid("outlineView:heightOfRowByItem:"), CPOutlineViewDelegate_outlineView_isGroupItem_, sel_getUid("outlineView:isGroupItem:"), CPOutlineViewDelegate_outlineView_mouseDownInHeaderOfTableColumn_, sel_getUid("outlineView:mouseDownInHeaderOfTableColumn:"), CPOutlineViewDelegate_outlineView_nextTypeSelectMatchFromItem_toItem_forString_, sel_getUid("outlineView:nextTypeSelectMatchFromItem:toItem:forString:"), CPOutlineViewDelegate_outlineView_selectionIndexesForProposedSelection_, sel_getUid("outlineView:selectionIndexesForProposedSelection:"), CPOutlineViewDelegate_outlineView_shouldCollapseItem_, sel_getUid("outlineView:shouldCollapseItem:"), CPOutlineViewDelegate_outlineView_shouldEditTableColumn_item_, sel_getUid("outlineView:shouldEditTableColumn:item:"), CPOutlineViewDelegate_outlineView_shouldExpandItem_, sel_getUid("outlineView:shouldExpandItem:"), CPOutlineViewDelegate_outlineView_shouldReorderColumn_toColumn_, sel_getUid("outlineView:shouldReorderColumn:toColumn:"), CPOutlineViewDelegate_outlineView_shouldSelectItem_, sel_getUid("outlineView:shouldSelectItem:"), CPOutlineViewDelegate_outlineView_shouldSelectTableColumn_, sel_getUid("outlineView:shouldSelectTableColumn:"), CPOutlineViewDelegate_outlineView_shouldShowOutlineDisclosureControlForItem_, sel_getUid("outlineView:shouldShowOutlineDisclosureControlForItem:"), CPOutlineViewDelegate_outlineView_shouldShowViewExpansionForTableColumn_item_, sel_getUid("outlineView:shouldShowViewExpansionForTableColumn:item:"), CPOutlineViewDelegate_outlineView_shouldTrackView_forTableColumn_item_, sel_getUid("outlineView:shouldTrackView:forTableColumn:item:"), CPOutlineViewDelegate_outlineView_shouldTypeSelectForEvent_withCurrentSearchString_, sel_getUid("outlineView:shouldTypeSelectForEvent:withCurrentSearchString:"), CPOutlineViewDelegate_outlineView_sizeToFitWidthOfColumn_, sel_getUid("outlineView:sizeToFitWidthOfColumn:"), CPOutlineViewDelegate_outlineView_toolTipForView_rect_tableColumn_item_mouseLocation_, sel_getUid("outlineView:toolTipForView:rect:tableColumn:item:mouseLocation:"), CPOutlineViewDelegate_outlineView_typeSelectStringForTableColumn_item_, sel_getUid("outlineView:typeSelectStringForTableColumn:item:"), CPOutlineViewDelegate_outlineView_willDisplayOutlineView_forTableColumn_item_, sel_getUid("outlineView:willDisplayOutlineView:forTableColumn:item:"), CPOutlineViewDelegate_outlineView_willDisplayView_forTableColumn_item_, sel_getUid("outlineView:willDisplayView:forTableColumn:item:"), CPOutlineViewDelegate_outlineView_willRemoveView_forTableColumn_item_, sel_getUid("outlineView:willRemoveView:forTableColumn:item:"), CPOutlineViewDelegate_selectionShouldChangeInOutlineView_, sel_getUid("selectionShouldChangeInOutlineView:"), CPOutlineViewDelegate_outlineView_menuForTableColumn_item_, sel_getUid("outlineView:menuForTableColumn:item:")],
        delegateCount = objj_msgSend(delegateMethods, "count");
    for (var i = 0; i < delegateCount; i += 2)
    {
        var bitMask = delegateMethods[i],
            selector = delegateMethods[i + 1];
        if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", selector))
            self._implementedOutlineViewDelegateMethods |= bitMask;
    }
    if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewColumnDidMove:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewColumnDidMove:"), CPOutlineViewColumnDidMoveNotification, self);
    if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewColumnDidResize:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewColumnDidMove:"), CPOutlineViewColumnDidResizeNotification, self);
    if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewSelectionDidChange:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewSelectionDidChange:"), CPOutlineViewSelectionDidChangeNotification, self);
    if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewSelectionIsChanging:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewSelectionIsChanging:"), CPOutlineViewSelectionIsChangingNotification, self);
    if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewItemWillExpand:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewItemWillExpand:"), CPOutlineViewItemWillExpandNotification, self);
    if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewItemDidExpand:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewItemDidExpand:"), CPOutlineViewItemDidExpandNotification, self);
    if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewItemWillCollapse:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewItemWillCollapse:"), CPOutlineViewItemWillCollapseNotification, self);
    if (objj_msgSend(self._outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewItemDidCollapse:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewItemDidCollapse:"), CPOutlineViewItemDidCollapseNotification, self);
    objj_msgSend(self, "_updateIsViewBased");
    if (objj_msgSend(self, "_delegateRespondsToDataViewForTableColumn"))
        CPLog.warn("outlineView:dataViewForTableColumn:item: is deprecated. You should use -outlineView:viewForTableColumn:item: where you can request the view with -makeViewWithIdentifier:owner:");
}
,["void","id"]), new objj_method(sel_getUid("_sendDelegateDeleteKeyPressed"), function $CPOutlineView___sendDelegateDeleteKeyPressed(self, _cmd)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("outlineViewDeleteKeyPressed:")))
    {
        objj_msgSend(objj_msgSend(self, "delegate"), "outlineViewDeleteKeyPressed:", self);
        return YES;
    }
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("delegate"), function $CPOutlineView__delegate(self, _cmd)
{
    return self._outlineViewDelegate;
}
,["id"]), new objj_method(sel_getUid("setDisclosureControlPrototype:"), function $CPOutlineView__setDisclosureControlPrototype_(self, _cmd, aControl)
{
    self._disclosureControlPrototype = aControl;
    self._disclosureControlData = nil;
    self._disclosureControlQueue = [];
    objj_msgSend(self, "reloadData");
}
,["void","CPControl"]), new objj_method(sel_getUid("reloadData"), function $CPOutlineView__reloadData(self, _cmd)
{
    objj_msgSend(self, "reloadItem:reloadChildren:", nil, YES);
}
,["void"]), new objj_method(sel_getUid("addTableColumn:"), function $CPOutlineView__addTableColumn_(self, _cmd, aTableColumn)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "addTableColumn:", aTableColumn);
    if (objj_msgSend(self, "numberOfColumns") === 1)
        self._outlineTableColumn = aTableColumn;
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("removeTableColumn:"), function $CPOutlineView__removeTableColumn_(self, _cmd, aTableColumn)
{
    if (aTableColumn === objj_msgSend(self, "outlineTableColumn"))
        CPLog("CPOutlineView cannot remove outlineTableColumn with removeTableColumn:. User setOutlineTableColumn: instead.");
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "removeTableColumn:", aTableColumn);
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"), function $CPOutlineView__frameOfDataViewAtColumn_row_(self, _cmd, aColumn, aRow)
{
    var tableColumn = objj_msgSend(self, "tableColumns")[aColumn];
    if (tableColumn === self._outlineTableColumn)
        return objj_msgSend(self, "_frameOfOutlineDataViewAtRow:", aRow);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "frameOfDataViewAtColumn:row:", aColumn, aRow);
}
,["CGRect","CPInteger","CPInteger"]), new objj_method(sel_getUid("_dragViewForColumn:event:offset:"), function $CPOutlineView___dragViewForColumn_event_offset_(self, _cmd, theColumnIndex, theDragEvent, theDragViewOffset)
{
    var dragView = objj_msgSend(objj_msgSend(_CPColumnDragView, "alloc"), "initWithLineColor:", objj_msgSend(self, "gridColor")),
        tableColumn = objj_msgSend(objj_msgSend(self, "tableColumns"), "objectAtIndex:", theColumnIndex),
        defaultRowHeight = objj_msgSend(self, "valueForThemeAttribute:", "default-row-height"),
        bounds = CGRectMake(0.0, 0.0, objj_msgSend(tableColumn, "width"), CGRectGetHeight(objj_msgSend(self, "exposedRect")) + defaultRowHeight),
        columnRect = objj_msgSend(self, "rectOfColumn:", theColumnIndex),
        headerView = objj_msgSend(tableColumn, "headerView"),
        row = objj_msgSend(self._exposedRows, "firstIndex");
    while (row !== CPNotFound)
    {
        var dataView = objj_msgSend(self, "_newDataViewForRow:tableColumn:", row, tableColumn),
            dataViewFrame = objj_msgSend(self, "frameOfDataViewAtColumn:row:", theColumnIndex, row);
        dataViewFrame.origin.x = 0.0;
        dataViewFrame.origin.y = CGRectGetMinY(dataViewFrame) - CGRectGetMinY(objj_msgSend(self, "exposedRect")) + defaultRowHeight;
        objj_msgSend(dataView, "setFrame:", dataViewFrame);
        objj_msgSend(dataView, "setObjectValue:", objj_msgSend(self, "_objectValueForTableColumn:row:", tableColumn, row));
        if (tableColumn === self._outlineTableColumn)
        {
            var indentationWidth = (objj_msgSend(self, "levelForRow:", row) + 1) * objj_msgSend(self, "indentationPerLevel");
            dataViewFrame.origin.x += indentationWidth;
            dataViewFrame.size.width -= indentationWidth;
            objj_msgSend(dataView, "setFrame:", dataViewFrame);
        }
        objj_msgSend(dragView, "addSubview:", dataView);
        row = objj_msgSend(self._exposedRows, "indexGreaterThanIndex:", row);
    }
    var headerFrame = objj_msgSend(headerView, "frame");
    headerFrame.origin = CGPointMakeZero();
    var columnHeaderView = objj_msgSend(objj_msgSend(_CPTableColumnHeaderView, "alloc"), "initWithFrame:", headerFrame);
    objj_msgSend(columnHeaderView, "setStringValue:", objj_msgSend(headerView, "stringValue"));
    objj_msgSend(columnHeaderView, "setThemeState:", objj_msgSend(headerView, "themeState"));
    objj_msgSend(dragView, "addSubview:", columnHeaderView);
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(dragView, "setAlphaValue:", 0.7);
    objj_msgSend(dragView, "setFrame:", bounds);
    return dragView;
}
,["CPView","CPInteger","CPEvent","CGPoint"]), new objj_method(sel_getUid("setDropItem:dropChildIndex:"), function $CPOutlineView__setDropItem_dropChildIndex_(self, _cmd, theItem, theIndex)
{
    if (self._dropItem !== theItem && theIndex < 0 && objj_msgSend(self, "isExpandable:", theItem) && !objj_msgSend(self, "isItemExpanded:", theItem))
    {
        if (self._dragHoverTimer)
            objj_msgSend(self._dragHoverTimer, "invalidate");
        var autoExpandCallBack = function()
        {
            if (self._dropItem)
            {
                objj_msgSend(self._dropOperationFeedbackView, "blink");
                objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", .3, objj_msgSend(self, "expandItem:", self._dropItem), NO);
            }
        };
        self._dragHoverTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", .8, autoExpandCallBack, NO);
    }
    if (theIndex >= 0)
    {
        objj_msgSend(self._dragHoverTimer, "invalidate");
        self._dragHoverTimer = nil;
    }
    self._dropItem = theItem;
    self._retargetedItem = theItem;
    self._shouldRetargetItem = YES;
    self._retargedChildIndex = theIndex;
    self._shouldRetargetChildIndex = YES;
    var retargetedItemInfo = self._retargetedItem !== nil ? self._itemInfosForItems[objj_msgSend(self._retargetedItem, "UID")] : self._rootItemInfo;
    if (self._retargedChildIndex === objj_msgSend(retargetedItemInfo.children, "count"))
    {
        var retargetedChildItem = objj_msgSend(retargetedItemInfo.children, "lastObject");
        self._retargetedDropRow = objj_msgSend(self, "rowForItem:", retargetedChildItem) + 1;
    }
    else
    {
        var retargetedChildItem = self._retargedChildIndex !== CPOutlineViewDropOnItemIndex ? retargetedItemInfo.children[self._retargedChildIndex] : self._retargetedItem;
        self._retargetedDropRow = objj_msgSend(self, "rowForItem:", retargetedChildItem);
    }
}
,["void","id","int"]), new objj_method(sel_getUid("_draggingEnded"), function $CPOutlineView___draggingEnded(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "_draggingEnded");
    self._dropItem = nil;
    objj_msgSend(self._dragHoverTimer, "invalidate");
    self._dragHoverTimer = nil;
}
,["void"]), new objj_method(sel_getUid("_parentItemForUpperRow:andLowerRow:atMouseOffset:"), function $CPOutlineView___parentItemForUpperRow_andLowerRow_atMouseOffset_(self, _cmd, theUpperRowIndex, theLowerRowIndex, theOffset)
{
    if (self._shouldRetargetItem)
        return self._retargetedItem;
    var lowerLevel = objj_msgSend(self, "levelForRow:", theLowerRowIndex),
        upperItem = objj_msgSend(self, "itemAtRow:", theUpperRowIndex),
        upperLevel = objj_msgSend(self, "levelForItem:", upperItem);
    while (upperLevel > lowerLevel)
    {
        upperLevel = objj_msgSend(self, "levelForItem:", upperItem);
        if (theOffset.x > (upperLevel + 1) * objj_msgSend(self, "indentationPerLevel"))
            return objj_msgSend(self, "parentForItem:", upperItem);
        upperItem = objj_msgSend(self, "parentForItem:", upperItem);
    }
    return objj_msgSend(self, "parentForItem:", objj_msgSend(self, "itemAtRow:", theLowerRowIndex));
}
,["id","CPInteger","CPInteger","CGPoint"]), new objj_method(sel_getUid("_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:"), function $CPOutlineView___rectForDropHighlightViewBetweenUpperRow_andLowerRow_offset_(self, _cmd, theUpperRowIndex, theLowerRowIndex, theOffset)
{
    var rect = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:", theUpperRowIndex, theLowerRowIndex, theOffset),
        parentItem = objj_msgSend(self, "_parentItemForUpperRow:andLowerRow:atMouseOffset:", theUpperRowIndex, theLowerRowIndex, theOffset),
        level = objj_msgSend(self, "levelForItem:", parentItem);
    rect.origin.x = (level + 1) * objj_msgSend(self, "indentationPerLevel");
    rect.size.width -= rect.origin.x;
    return rect;
}
,["CGRect","CPInteger","CPInteger","CGPoint"]), new objj_method(sel_getUid("_layoutDataViewsInRows:columns:"), function $CPOutlineView___layoutDataViewsInRows_columns_(self, _cmd, rows, columns)
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
        for (; rowIndex < rowsCount; ++rowIndex)
        {
            var row = rowArray[rowIndex],
                dataView = dataViewsForTableColumn[row],
                dataViewFrame = objj_msgSend(self, "frameOfDataViewAtColumn:row:", column, row);
            objj_msgSend(dataView, "setFrame:", dataViewFrame);
            if (tableColumn === self._outlineTableColumn)
            {
                var control = self._disclosureControlsForRows[row],
                    frame = objj_msgSend(self, "frameOfOutlineDisclosureControlAtRow:", row);
                objj_msgSend(control, "setFrame:", frame);
            }
        }
    }
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_loadDataViewsInRows:columns:"), function $CPOutlineView___loadDataViewsInRows_columns_(self, _cmd, rows, columns)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "_loadDataViewsInRows:columns:", rows, columns);
    var outlineColumn = objj_msgSend(objj_msgSend(self, "tableColumns"), "indexOfObjectIdenticalTo:", objj_msgSend(self, "outlineTableColumn"));
    if (!objj_msgSend(columns, "containsIndex:", outlineColumn) || objj_msgSend(self, "outlineTableColumn") === self._draggedColumn)
        return;
    var rowArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    var rowIndex = 0,
        rowsCount = rowArray.length;
    for (; rowIndex < rowsCount; ++rowIndex)
    {
        var row = rowArray[rowIndex],
            item = self._itemsForRows[row],
            isExpandable = objj_msgSend(self, "isExpandable:", item);
        if (!isExpandable)
            continue;
        var disclosureControlFrame = objj_msgSend(self, "frameOfOutlineDisclosureControlAtRow:", row);
        if (CGRectIsEmpty(disclosureControlFrame))
            continue;
        var control = objj_msgSend(self, "_dequeueDisclosureControl");
        self._disclosureControlsForRows[row] = control;
        objj_msgSend(control, "setState:", objj_msgSend(self, "isItemExpanded:", item) ? CPOnState : CPOffState);
        var selector = objj_msgSend(self, "isRowSelected:", row) ? "setThemeState:" : "unsetThemeState:";
        objj_msgSend(control, "performSelector:withObject:", CPSelectorFromString(selector), CPThemeStateSelected);
        objj_msgSend(control, "setFrame:", disclosureControlFrame);
        objj_msgSend(self, "addSubview:", control);
    }
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"), function $CPOutlineView___unloadDataViewsInRows_columns_(self, _cmd, rows, columns)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "_unloadDataViewsInRows:columns:", rows, columns);
    var outlineColumn = objj_msgSend(objj_msgSend(self, "tableColumns"), "indexOfObjectIdenticalTo:", objj_msgSend(self, "outlineTableColumn"));
    if (!objj_msgSend(columns, "containsIndex:", outlineColumn))
        return;
    var rowArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    var rowIndex = 0,
        rowsCount = rowArray.length;
    for (; rowIndex < rowsCount; ++rowIndex)
    {
        var row = rowArray[rowIndex],
            control = self._disclosureControlsForRows[row];
        if (!control)
            continue;
        objj_msgSend(control, "removeFromSuperview");
        objj_msgSend(self, "_enqueueDisclosureControl:", control);
        self._disclosureControlsForRows[row] = nil;
    }
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_toggleFromDisclosureControl:"), function $CPOutlineView___toggleFromDisclosureControl_(self, _cmd, aControl)
{
    var controlFrame = objj_msgSend(aControl, "frame"),
        item = objj_msgSend(self, "itemAtRow:", objj_msgSend(self, "rowAtPoint:", CGPointMake(CGRectGetMinX(controlFrame), CGRectGetMidY(controlFrame))));
    if (objj_msgSend(self, "isItemExpanded:", item))
        objj_msgSend(self, "collapseItem:", item);
    else
        objj_msgSend(self, "expandItem:expandChildren:", item, objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "modifierFlags") & CPAlternateKeyMask);
}
,["void","CPControl"]), new objj_method(sel_getUid("_enqueueDisclosureControl:"), function $CPOutlineView___enqueueDisclosureControl_(self, _cmd, aControl)
{
    self._disclosureControlQueue.push(aControl);
}
,["void","CPControl"]), new objj_method(sel_getUid("_dequeueDisclosureControl"), function $CPOutlineView___dequeueDisclosureControl(self, _cmd)
{
    if (self._disclosureControlQueue.length)
        return self._disclosureControlQueue.pop();
    if (!self._disclosureControlData)
        if (!self._disclosureControlPrototype)
            return nil;
        else
            self._disclosureControlData = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", self._disclosureControlPrototype);
    var disclosureControl = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", self._disclosureControlData);
    objj_msgSend(disclosureControl, "setTarget:", self);
    objj_msgSend(disclosureControl, "setAction:", sel_getUid("_toggleFromDisclosureControl:"));
    return disclosureControl;
}
,["CPControl"]), new objj_method(sel_getUid("_noteSelectionIsChanging"), function $CPOutlineView___noteSelectionIsChanging(self, _cmd)
{
    if (!self._coalesceSelectionNotificationState || self._coalesceSelectionNotificationState === CPOutlineViewCoalesceSelectionNotificationStateOn)
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPOutlineViewSelectionIsChangingNotification, self, nil);
    }
    if (self._coalesceSelectionNotificationState === CPOutlineViewCoalesceSelectionNotificationStateOn)
        self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateDid;
}
,["void"]), new objj_method(sel_getUid("_noteSelectionDidChange"), function $CPOutlineView___noteSelectionDidChange(self, _cmd)
{
    if (!self._coalesceSelectionNotificationState)
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPOutlineViewSelectionDidChangeNotification, self, nil);
    }
    if (self._coalesceSelectionNotificationState === CPOutlineViewCoalesceSelectionNotificationStateOn)
        self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateDid;
}
,["void"]), new objj_method(sel_getUid("_noteItemWillExpand:"), function $CPOutlineView___noteItemWillExpand_(self, _cmd, item)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPOutlineViewItemWillExpandNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", item, "CPObject"));
}
,["void","id"]), new objj_method(sel_getUid("_noteItemDidExpand:"), function $CPOutlineView___noteItemDidExpand_(self, _cmd, item)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPOutlineViewItemDidExpandNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", item, "CPObject"));
}
,["void","id"]), new objj_method(sel_getUid("_noteItemWillCollapse:"), function $CPOutlineView___noteItemWillCollapse_(self, _cmd, item)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPOutlineViewItemWillCollapseNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", item, "CPObject"));
}
,["void","id"]), new objj_method(sel_getUid("_noteItemDidCollapse:"), function $CPOutlineView___noteItemDidCollapse_(self, _cmd, item)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPOutlineViewItemDidCollapseNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", item, "CPObject"));
}
,["void","id"]), new objj_method(sel_getUid("keyDown:"), function $CPOutlineView__keyDown_(self, _cmd, anEvent)
{
    var character = objj_msgSend(anEvent, "charactersIgnoringModifiers"),
        modifierFlags = objj_msgSend(anEvent, "modifierFlags");
    if (character !== CPRightArrowFunctionKey && character !== CPLeftArrowFunctionKey)
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "keyDown:", anEvent);
    var rows = objj_msgSend(self, "selectedRowIndexes"),
        indexes = [],
        items = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", indexes, -1, nil);
    var i = 0,
        c = objj_msgSend(indexes, "count");
    for (; i < c; i++)
        items.push(objj_msgSend(self, "itemAtRow:", indexes[i]));
    if (character === CPRightArrowFunctionKey)
    {
        for (var i = 0; i < c; i++)
            objj_msgSend(self, "expandItem:", items[i]);
    }
    else if (character === CPLeftArrowFunctionKey)
    {
        if (c == 1)
        {
            var theItem = items[0];
            if (!objj_msgSend(self, "isItemExpanded:", theItem))
            {
                var parent = objj_msgSend(self, "parentForItem:", theItem),
                    shouldSelect = parent && (!(self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_selectionShouldChangeInOutlineView_) || objj_msgSend(self._outlineViewDelegate, "selectionShouldChangeInOutlineView:", self)) && (!(self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldSelectItem_) || objj_msgSend(self._outlineViewDelegate, "outlineView:shouldSelectItem:", self, parent));
                if (shouldSelect)
                {
                    var rowIndex = objj_msgSend(self, "rowForItem:", parent);
                    objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", rowIndex), NO);
                    objj_msgSend(self, "scrollRowToVisible:", rowIndex);
                    return;
                }
            }
        }
        for (var i = 0; i < c; i++)
            objj_msgSend(self, "collapseItem:", items[i]);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "keyDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_sendDelegateViewForTableColumn:row:"), function $CPOutlineView___sendDelegateViewForTableColumn_row_(self, _cmd, aTableColumn, aRow)
{
    return objj_msgSend(self._outlineViewDelegate, "outlineView:viewForTableColumn:item:", self, aTableColumn, objj_msgSend(self, "itemAtRow:", aRow));
}
,["CPView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateDataViewForTableColumn:row:"), function $CPOutlineView___sendDelegateDataViewForTableColumn_row_(self, _cmd, aTableColumn, aRow)
{
    return objj_msgSend(self._outlineViewDelegate, "outlineView:dataViewForTableColumn:item:", self, aTableColumn, objj_msgSend(self, "itemAtRow:", aRow));
}
,["CPView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_dataSourceRespondsToObjectValueForTableColumn"), function $CPOutlineView___dataSourceRespondsToObjectValueForTableColumn(self, _cmd)
{
    return self._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_objectValue_forTableColumn_byItem_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToViewForTableColumn"), function $CPOutlineView___delegateRespondsToViewForTableColumn(self, _cmd)
{
    return self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_viewForTableColumn_item_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToDataViewForTableColumn"), function $CPOutlineView___delegateRespondsToDataViewForTableColumn(self, _cmd)
{
    return self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_dataViewForTableColumn_item_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToShouldExpandItem"), function $CPOutlineView___delegateRespondsToShouldExpandItem(self, _cmd)
{
    return self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldExpandItem_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToShouldCollapseItem"), function $CPOutlineView___delegateRespondsToShouldCollapseItem(self, _cmd)
{
    return self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldCollapseItem_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToSelectionIndexesForProposedSelection"), function $CPOutlineView___delegateRespondsToSelectionIndexesForProposedSelection(self, _cmd)
{
    return self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_selectionIndexesForProposedSelection_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToShouldSelectRow"), function $CPOutlineView___delegateRespondsToShouldSelectRow(self, _cmd)
{
    return self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldSelectItem_;
}
,["BOOL"])]);
}var _reloadItem = function(anOutlineView, anItem)
{
    if (!anItem)
        return;
    with(anOutlineView)
    {
        var itemInfosForItems = _itemInfosForItems,
            dataSource = _outlineViewDataSource,
            itemUID = objj_msgSend(anItem, "UID"),
            itemInfo = itemInfosForItems[itemUID];
        if (!itemInfo)
            return [];
        var parent = itemInfo.parent,
            parentItemInfo = parent ? itemInfosForItems[objj_msgSend(parent, "UID")] : _rootItemInfo,
            parentChildren = parentItemInfo.children,
            index = objj_msgSend(parentChildren, "indexOfObjectIdenticalTo:", anItem),
            newItem = objj_msgSend(dataSource, "outlineView:child:ofItem:", anOutlineView, index, parent);
        if (anItem !== newItem)
        {
            itemInfosForItems[objj_msgSend(anItem, "UID")] = nil;
            itemInfosForItems[objj_msgSend(newItem, "UID")] = itemInfo;
            parentChildren[index] = newItem;
            _itemsForRows[itemInfo.row] = newItem;
        }
        itemInfo.isExpandable = objj_msgSend(dataSource, "outlineView:isItemExpandable:", anOutlineView, newItem);
        itemInfo.isExpanded = itemInfo.isExpandable && itemInfo.isExpanded;
        itemInfo.shouldShowOutlineDisclosureControl = !(_implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldShowOutlineDisclosureControlForItem_) || objj_msgSend(_outlineViewDelegate, "outlineView:shouldShowOutlineDisclosureControlForItem:", self, newItem);
    }
};
var _loadItemInfoForItem = function(anOutlineView, anItem, isIntermediate)
{
    with(anOutlineView)
    {
        var itemInfosForItems = _itemInfosForItems,
            dataSource = _outlineViewDataSource;
        if (!anItem)
            var itemInfo = _rootItemInfo;
        else
        {
            var itemUID = objj_msgSend(anItem, "UID"),
                itemInfo = itemInfosForItems[itemUID];
            if (!itemInfo)
                return [];
            itemInfo.isExpandable = objj_msgSend(dataSource, "outlineView:isItemExpandable:", anOutlineView, anItem);
            itemInfo.shouldShowOutlineDisclosureControl = !(_implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldShowOutlineDisclosureControlForItem_) || objj_msgSend(_outlineViewDelegate, "outlineView:shouldShowOutlineDisclosureControlForItem:", self, anItem);
            if (!itemInfo.isExpandable && itemInfo.isExpanded)
            {
                itemInfo.isExpanded = NO;
                itemInfo.children = [];
            }
        }
        var weight = itemInfo.weight,
            descendants = anItem ? [anItem] : [];
        if (itemInfo.isExpanded && (!(_implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_shouldDeferDisplayingChildrenOfItem_) || !objj_msgSend(dataSource, "outlineView:shouldDeferDisplayingChildrenOfItem:", anOutlineView, anItem)))
        {
            var index = 0,
                count = objj_msgSend(dataSource, "outlineView:numberOfChildrenOfItem:", anOutlineView, anItem),
                level = itemInfo.level + 1;
            itemInfo.children = [];
            for (; index < count; ++index)
            {
                var childItem = objj_msgSend(dataSource, "outlineView:child:ofItem:", anOutlineView, index, anItem),
                    childItemInfo = itemInfosForItems[objj_msgSend(childItem, "UID")];
                if (!childItemInfo)
                {
                    childItemInfo = {isExpanded: NO, isExpandable: NO, shouldShowOutlineDisclosureControl: YES, children: [], weight: 1};
                    itemInfosForItems[objj_msgSend(childItem, "UID")] = childItemInfo;
                }
                itemInfo.children[index] = childItem;
                var childDescendants = _loadItemInfoForItem(anOutlineView, childItem, YES);
                childItemInfo.parent = anItem;
                childItemInfo.level = level;
                descendants = descendants.concat(childDescendants);
            }
        }
        itemInfo.weight = descendants.length;
        if (!isIntermediate)
        {
            var index = MAX(itemInfo.row, 0),
                itemsForRows = _itemsForRows;
            descendants.unshift(index, weight);
            itemsForRows.splice.apply(itemsForRows, descendants);
            var count = itemsForRows.length;
            for (; index < count; ++index)
                itemInfosForItems[objj_msgSend(itemsForRows[index], "UID")].row = index;
            var deltaWeight = itemInfo.weight - weight;
            if (deltaWeight !== 0)
            {
                var parent = itemInfo.parent;
                while (parent)
                {
                    var parentItemInfo = itemInfosForItems[objj_msgSend(parent, "UID")];
                    parentItemInfo.weight += deltaWeight;
                    parent = parentItemInfo.parent;
                }
                if (anItem)
                    _rootItemInfo.weight += deltaWeight;
            }
        }
    }
    return descendants;
};
{var the_class = objj_allocateClassPair(CPObject, "_CPOutlineViewTableViewDataSource"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_outlineView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithOutlineView:"), function $_CPOutlineViewTableViewDataSource__initWithOutlineView_(self, _cmd, anOutlineView)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPOutlineViewTableViewDataSource").super_class }, "init");
    if (self)
        self._outlineView = anOutlineView;
    return self;
}
,["id","CPOutlineView"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $_CPOutlineViewTableViewDataSource__numberOfRowsInTableView_(self, _cmd, anOutlineView)
{
    return self._outlineView._itemsForRows.length;
}
,["CPInteger","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $_CPOutlineViewTableViewDataSource__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aTableColumn, aRow)
{
    return objj_msgSend(self._outlineView._outlineViewDataSource, "outlineView:objectValueForTableColumn:byItem:", self._outlineView, aTableColumn, self._outlineView._itemsForRows[aRow]);
}
,["id","CPTableView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"), function $_CPOutlineViewTableViewDataSource__tableView_setObjectValue_forTableColumn_row_(self, _cmd, aTableView, aValue, aColumn, aRow)
{
    if (!(self._outlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_setObjectValue_forTableColumn_byItem_))
        return;
    objj_msgSend(self._outlineView._outlineViewDataSource, "outlineView:setObjectValue:forTableColumn:byItem:", self._outlineView, aValue, aColumn, self._outlineView._itemsForRows[aRow]);
}
,["void","CPTableView","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"), function $_CPOutlineViewTableViewDataSource__tableView_writeRowsWithIndexes_toPasteboard_(self, _cmd, aTableColumn, theIndexes, thePasteboard)
{
    if (!(self._outlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_writeItems_toPasteboard_))
        return NO;
    var items = [],
        index = objj_msgSend(theIndexes, "firstIndex");
    while (index !== CPNotFound)
    {
        objj_msgSend(items, "addObject:", objj_msgSend(self._outlineView, "itemAtRow:", index));
        index = objj_msgSend(theIndexes, "indexGreaterThanIndex:", index);
    }
    return objj_msgSend(self._outlineView._outlineViewDataSource, "outlineView:writeItems:toPasteboard:", self._outlineView, items, thePasteboard);
}
,["BOOL","CPTableView","CPIndexSet","CPPasteboard"]), new objj_method(sel_getUid("_childIndexForDropOperation:row:offset:"), function $_CPOutlineViewTableViewDataSource___childIndexForDropOperation_row_offset_(self, _cmd, theDropOperation, theRow, theOffset)
{
    if (self._outlineView._shouldRetargetChildIndex)
        return self._outlineView._retargedChildIndex;
    var childIndex = CPNotFound;
    if (theDropOperation === CPTableViewDropAbove)
    {
        var parentItem = objj_msgSend(self._outlineView, "_parentItemForUpperRow:andLowerRow:atMouseOffset:", theRow - 1, theRow, theOffset),
            itemInfo = parentItem !== nil ? self._outlineView._itemInfosForItems[objj_msgSend(parentItem, "UID")] : self._outlineView._rootItemInfo,
            children = itemInfo.children;
        childIndex = objj_msgSend(children, "indexOfObject:", objj_msgSend(self._outlineView, "itemAtRow:", theRow));
        if (childIndex === CPNotFound)
            childIndex = children.length;
    }
    else if (theDropOperation === CPTableViewDropOn)
        childIndex = -1;
    return childIndex;
}
,["int","CPTableViewDropOperation","CPInteger","CGPoint"]), new objj_method(sel_getUid("_parentItemForDropOperation:row:offset:"), function $_CPOutlineViewTableViewDataSource___parentItemForDropOperation_row_offset_(self, _cmd, theDropOperation, theRow, theOffset)
{
    if (theDropOperation === CPTableViewDropAbove)
        return objj_msgSend(self._outlineView, "_parentItemForUpperRow:andLowerRow:atMouseOffset:", theRow - 1, theRow, theOffset);
    return objj_msgSend(self._outlineView, "itemAtRow:", theRow);
}
,["void","CPTableViewDropOperation","CPInteger","CGPoint"]), new objj_method(sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"), function $_CPOutlineViewTableViewDataSource__tableView_validateDrop_proposedRow_proposedDropOperation_(self, _cmd, aTableView, theInfo, theRow, theOperation)
{
    if (!(self._outlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_validateDrop_proposedItem_proposedChildIndex_))
        return CPDragOperationNone;
    self._outlineView._retargetedItem = nil;
    self._outlineView._shouldRetargetItem = NO;
    self._outlineView._retargedChildIndex = nil;
    self._outlineView._shouldRetargetChildIndex = NO;
    var location = objj_msgSend(self._outlineView, "convertPoint:fromView:", objj_msgSend(theInfo, "draggingLocation"), nil),
        parentItem = objj_msgSend(self, "_parentItemForDropOperation:row:offset:", theOperation, theRow, location),
        childIndex = objj_msgSend(self, "_childIndexForDropOperation:row:offset:", theOperation, theRow, location);
    return objj_msgSend(self._outlineView._outlineViewDataSource, "outlineView:validateDrop:proposedItem:proposedChildIndex:", self._outlineView, theInfo, parentItem, childIndex);
}
,["CPDragOperation","CPTableView","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("tableView:acceptDrop:row:dropOperation:"), function $_CPOutlineViewTableViewDataSource__tableView_acceptDrop_row_dropOperation_(self, _cmd, aTableView, theInfo, theRow, theOperation)
{
    if (!(self._outlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_acceptDrop_item_childIndex_))
        return NO;
    var location = objj_msgSend(self._outlineView, "convertPoint:fromView:", objj_msgSend(theInfo, "draggingLocation"), nil),
        parentItem = objj_msgSend(self, "_parentItemForDropOperation:row:offset:", theOperation, theRow, location),
        childIndex = objj_msgSend(self, "_childIndexForDropOperation:row:offset:", theOperation, theRow, location);
    self._outlineView._retargetedItem = nil;
    self._outlineView._shouldRetargetItem = NO;
    self._outlineView._retargedChildIndex = nil;
    self._outlineView._shouldRetargetChildIndex = NO;
    return objj_msgSend(self._outlineView._outlineViewDataSource, "outlineView:acceptDrop:item:childIndex:", self._outlineView, theInfo, parentItem, childIndex);
}
,["BOOL","CPTableView","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("tableView:sortDescriptorsDidChange:"), function $_CPOutlineViewTableViewDataSource__tableView_sortDescriptorsDidChange_(self, _cmd, aTableView, oldSortDescriptors)
{
    if (self._outlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_sortDescriptorsDidChange_)
    {
        objj_msgSend(objj_msgSend(self._outlineView, "dataSource"), "outlineView:sortDescriptorsDidChange:", self._outlineView, oldSortDescriptors);
    }
}
,["void","CPTableView","CPArray"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPOutlineViewTableViewDelegate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_outlineView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithOutlineView:"), function $_CPOutlineViewTableViewDelegate__initWithOutlineView_(self, _cmd, anOutlineView)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPOutlineViewTableViewDelegate").super_class }, "init");
    if (self)
        self._outlineView = anOutlineView;
    return self;
}
,["id","CPOutlineView"]), new objj_method(sel_getUid("tableView:shouldSelectRow:"), function $_CPOutlineViewTableViewDelegate__tableView_shouldSelectRow_(self, _cmd, theTableView, theRow)
{
    return !(self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldSelectItem_) || objj_msgSend(self._outlineView._outlineViewDelegate, "outlineView:shouldSelectItem:", self._outlineView, objj_msgSend(self._outlineView, "itemAtRow:", theRow));
}
,["BOOL","CPTableView","CPInteger"]), new objj_method(sel_getUid("selectionShouldChangeInTableView:"), function $_CPOutlineViewTableViewDelegate__selectionShouldChangeInTableView_(self, _cmd, theTableView)
{
    return !(self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_selectionShouldChangeInOutlineView_) || objj_msgSend(self._outlineView._outlineViewDelegate, "selectionShouldChangeInOutlineView:", self._outlineView);
}
,["BOOL","CPTableView"]), new objj_method(sel_getUid("tableView:shouldEditTableColumn:row:"), function $_CPOutlineViewTableViewDelegate__tableView_shouldEditTableColumn_row_(self, _cmd, aTableView, aColumn, aRow)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldEditTableColumn_item_)
        return objj_msgSend(self._outlineView._outlineViewDelegate, "outlineView:shouldEditTableColumn:item:", self._outlineView, aColumn, objj_msgSend(self._outlineView, "itemAtRow:", aRow));
    return NO;
}
,["BOOL","CPTableView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:heightOfRow:"), function $_CPOutlineViewTableViewDelegate__tableView_heightOfRow_(self, _cmd, theTableView, theRow)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_heightOfRowByItem_)
        return objj_msgSend(self._outlineView._outlineViewDelegate, "outlineView:heightOfRowByItem:", self._outlineView, objj_msgSend(self._outlineView, "itemAtRow:", theRow));
    return objj_msgSend(theTableView, "rowHeight");
}
,["float","CPTableView","CPInteger"]), new objj_method(sel_getUid("tableView:willDisplayView:forTableColumn:row:"), function $_CPOutlineViewTableViewDelegate__tableView_willDisplayView_forTableColumn_row_(self, _cmd, aTableView, aView, aTableColumn, aRowIndex)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_willDisplayView_forTableColumn_item_)
    {
        var item = objj_msgSend(self._outlineView, "itemAtRow:", aRowIndex);
        objj_msgSend(self._outlineView._outlineViewDelegate, "outlineView:willDisplayView:forTableColumn:item:", self._outlineView, aView, aTableColumn, item);
    }
}
,["void","CPTableView","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:willRemoveView:forTableColumn:row:"), function $_CPOutlineViewTableViewDelegate__tableView_willRemoveView_forTableColumn_row_(self, _cmd, aTableView, aView, aTableColumn, aRowIndex)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_willRemoveView_forTableColumn_item_)
    {
        var item = objj_msgSend(self._outlineView, "itemAtRow:", aRowIndex);
        objj_msgSend(self._outlineView._outlineViewDelegate, "outlineView:willRemoveView:forTableColumn:item:", self._outlineView, aView, aTableColumn, item);
    }
}
,["void","CPTableView","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:isGroupRow:"), function $_CPOutlineViewTableViewDelegate__tableView_isGroupRow_(self, _cmd, aTableView, aRow)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_isGroupItem_)
        return objj_msgSend(self._outlineView._outlineViewDelegate, "outlineView:isGroupItem:", self._outlineView, objj_msgSend(self._outlineView, "itemAtRow:", aRow));
    return NO;
}
,["BOOL","CPTableView","CPInteger"]), new objj_method(sel_getUid("tableView:menuForTableColumn:row:"), function $_CPOutlineViewTableViewDelegate__tableView_menuForTableColumn_row_(self, _cmd, aTableView, aTableColumn, aRow)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_menuForTableColumn_item_)
    {
        var item = objj_msgSend(self._outlineView, "itemAtRow:", aRow);
        return objj_msgSend(self._outlineView._outlineViewDelegate, "outlineView:menuForTableColumn:item:", self._outlineView, aTableColumn, item);
    }
    return objj_msgSend(self._outlineView, "menu") || objj_msgSend(objj_msgSend(self._outlineView, "class"), "defaultMenu");
}
,["CPMenu","CPTableView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:selectionIndexesForProposedSelection:"), function $_CPOutlineViewTableViewDelegate__tableView_selectionIndexesForProposedSelection_(self, _cmd, aTableView, anIndexSet)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_selectionIndexesForProposedSelection_)
        return objj_msgSend(self._outlineView._outlineViewDelegate, "outlineView:selectionIndexesForProposedSelection:", self._outlineView, anIndexSet);
    return anIndexSet;
}
,["CPIndexSet","CPTableView","CPIndexSet"]), new objj_method(sel_getUid("tableView:shouldSelectTableColumn:"), function $_CPOutlineViewTableViewDelegate__tableView_shouldSelectTableColumn_(self, _cmd, aTableView, aTableColumn)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldSelectTableColumn_)
        return objj_msgSend(self._outlineView._outlineViewDelegate, "outlineView:shouldSelectTableColumn:", self._outlineView, aTableColumn);
    return YES;
}
,["BOOL","CPTableView","CPTableColumn"])]);
}{var the_class = objj_allocateClassPair(CPButton, "CPDisclosureButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_angle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPDisclosureButton__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDisclosureButton").super_class }, "initWithFrame:", aFrame);
    if (self)
        objj_msgSend(self, "setBordered:", NO);
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setState:"), function $CPDisclosureButton__setState_(self, _cmd, aState)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDisclosureButton").super_class }, "setState:", aState);
    if (objj_msgSend(self, "state") === CPOnState)
        self._angle = 0.0;
    else
        self._angle = -PI_2;
}
,["void","CPInteger"]), new objj_method(sel_getUid("drawRect:"), function $CPDisclosureButton__drawRect_(self, _cmd, aRect)
{
    var bounds = objj_msgSend(self, "bounds"),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        width = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds);
    CGContextBeginPath(context);
    if (self._angle)
    {
        var centre = CGPointMake(FLOOR(width / 2.0), FLOOR(height / 2.0));
        CGContextTranslateCTM(context, centre.x, centre.y);
        CGContextRotateCTM(context, self._angle);
        CGContextTranslateCTM(context, -centre.x, -centre.y);
    }
    CGContextTranslateCTM(context, FLOOR((width - 9.0) / 2.0), FLOOR((height - 8.0) / 2.0));
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 9.0, 0.0);
    CGContextAddLineToPoint(context, 4.5, 8.0);
    CGContextClosePath(context);
    CGContextSetFillColor(context, colorForDisclosureTriangle(objj_msgSend(self, "hasThemeState:", CPThemeStateSelected), objj_msgSend(self, "hasThemeState:", CPThemeStateHighlighted)));
    CGContextFillPath(context);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 4.5, 8.0);
    if (self._angle === 0.0)
        CGContextAddLineToPoint(context, 9.0, 0.0);
    CGContextSetStrokeColor(context, objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 1.0, 0.7));
    CGContextStrokePath(context);
}
,["void","CGRect"])]);
}var CPOutlineViewIndentationPerLevelKey = "CPOutlineViewIndentationPerLevelKey",
    CPOutlineViewOutlineTableColumnKey = "CPOutlineViewOutlineTableColumnKey",
    CPOutlineViewDataSourceKey = "CPOutlineViewDataSourceKey",
    CPOutlineViewDelegateKey = "CPOutlineViewDelegateKey";
{
var the_class = objj_getClass("CPOutlineView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPOutlineView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPOutlineView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._rootItemInfo = {isExpanded: YES, isExpandable: NO, level: -1, row: -1, children: [], weight: 0};
        self._itemsForRows = [];
        self._itemInfosForItems = {};
        self._disclosureControlsForRows = [];
        objj_msgSend(self, "setIndentationMarkerFollowsDataView:", YES);
        objj_msgSend(self, "setDisclosureControlPrototype:", objj_msgSend(objj_msgSend(CPDisclosureButton, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 10.0, 10.0)));
        self._outlineTableColumn = objj_msgSend(aCoder, "decodeObjectForKey:", CPOutlineViewOutlineTableColumnKey);
        self._indentationPerLevel = objj_msgSend(aCoder, "decodeFloatForKey:", CPOutlineViewIndentationPerLevelKey);
        self._outlineViewDataSource = objj_msgSend(aCoder, "decodeObjectForKey:", CPOutlineViewDataSourceKey);
        self._outlineViewDelegate = objj_msgSend(aCoder, "decodeObjectForKey:", CPOutlineViewDelegateKey);
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "setDataSource:", objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDataSource, "alloc"), "initWithOutlineView:", self));
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "setDelegate:", objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDelegate, "alloc"), "initWithOutlineView:", self));
        objj_msgSend(self, "_updateIsViewBased");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPOutlineView__encodeWithCoder_(self, _cmd, aCoder)
{
    var internalDelegate = self._delegate,
        internalDataSource = self._dataSource;
    self._delegate = nil;
    self._dataSource = nil;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "encodeWithCoder:", aCoder);
    self._delegate = internalDelegate;
    self._dataSource = internalDataSource;
    objj_msgSend(aCoder, "encodeObject:forKey:", self._outlineTableColumn, CPOutlineViewOutlineTableColumnKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._indentationPerLevel, CPOutlineViewIndentationPerLevelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._outlineViewDataSource, CPOutlineViewDataSourceKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._outlineViewDelegate, CPOutlineViewDelegateKey);
}
,["void","CPCoder"])]);
}var colorForDisclosureTriangle = function(isSelected, isHighlighted)
{
    return isSelected ? isHighlighted ? objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.9, 1.0) : objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 1.0, 1.0) : isHighlighted ? objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.4, 1.0) : objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.5, 1.0);
};
