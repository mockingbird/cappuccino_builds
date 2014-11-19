@STATIC;1.0;i;10;CPButton.ji;15;CPTableColumn.ji;13;CPTableView.jt;96721;objj_executeFile("CPButton.j", YES);objj_executeFile("CPTableColumn.j", YES);objj_executeFile("CPTableView.j", YES);CPOutlineViewColumnDidMoveNotification = "CPOutlineViewColumnDidMoveNotification";
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
        (self == null ? null : self.isa.objj_msgSend1(self, "setIndentationPerLevel:", 16.0));
        (self == null ? null : self.isa.objj_msgSend1(self, "setIndentationMarkerFollowsDataView:", YES));
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "setDataSource:", ((___r1 = (_CPOutlineViewTableViewDataSource == null ? null : _CPOutlineViewTableViewDataSource.isa.objj_msgSend0(_CPOutlineViewTableViewDataSource, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithOutlineView:", self)));
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "setDelegate:", ((___r1 = (_CPOutlineViewTableViewDelegate == null ? null : _CPOutlineViewTableViewDelegate.isa.objj_msgSend0(_CPOutlineViewTableViewDelegate, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithOutlineView:", self)));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDisclosureControlPrototype:", ((___r1 = (CPDisclosureButton == null ? null : CPDisclosureButton.isa.objj_msgSend0(CPDisclosureButton, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 10.0, 10.0)))));
    }
    return self;
    var ___r1;
}
,["id","CGRect"]), new objj_method(sel_getUid("setDataSource:"), function $CPOutlineView__setDataSource_(self, _cmd, aDataSource)
{
    if (self._outlineViewDataSource === aDataSource)
        return;
    if (!(aDataSource == null ? null : aDataSource.isa.objj_msgSend1(aDataSource, "respondsToSelector:", sel_getUid("outlineView:child:ofItem:"))))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:child:ofItem:'");
    if (!(aDataSource == null ? null : aDataSource.isa.objj_msgSend1(aDataSource, "respondsToSelector:", sel_getUid("outlineView:isItemExpandable:"))))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:isItemExpandable:'");
    if (!(aDataSource == null ? null : aDataSource.isa.objj_msgSend1(aDataSource, "respondsToSelector:", sel_getUid("outlineView:numberOfChildrenOfItem:"))))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:numberOfChildrenOfItem:'");
    self._outlineViewDataSource = aDataSource;
    self._implementedOutlineViewDataSourceMethods = 0;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:objectValueForTableColumn:byItem:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_objectValue_forTableColumn_byItem_;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:setObjectValue:forTableColumn:byItem:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_setObjectValue_forTableColumn_byItem_;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:shouldDeferDisplayingChildrenOfItem:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_shouldDeferDisplayingChildrenOfItem_;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:acceptDrop:item:childIndex:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_acceptDrop_item_childIndex_;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:validateDrop:proposedItem:proposedChildIndex:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_validateDrop_proposedItem_proposedChildIndex_;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:validateDrop:proposedRow:proposedDropOperation:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_validateDrop_proposedRow_proposedDropOperation_;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:namesOfPromisedFilesDroppedAtDestination:forDraggedItems:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_namesOfPromisedFilesDroppedAtDestination_forDraggedItems_;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:itemForPersistentObject:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_itemForPersistentObject_;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:persistentObjectForItem:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_persistentObjectForItem_;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:writeItems:toPasteboard:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_writeItems_toPasteboard_;
    if (((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineView:sortDescriptorsDidChange:"))))
        self._implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_sortDescriptorsDidChange_;
    self.isa.objj_msgSend0(self, "reloadData");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("dataSource"), function $CPOutlineView__dataSource(self, _cmd)
{
    return self._outlineViewDataSource;
}
,["id"]), new objj_method(sel_getUid("isExpandable:"), function $CPOutlineView__isExpandable_(self, _cmd, anItem)
{
    if (!anItem)
        return YES;
    var itemInfo = self.isa.objj_msgSend1(self, "_itemInfosForItem:", anItem);
    if (!itemInfo)
        return NO;
    return itemInfo.isExpandable;
}
,["BOOL","id"]), new objj_method(sel_getUid("_shouldShowOutlineDisclosureControlForItem:"), function $CPOutlineView___shouldShowOutlineDisclosureControlForItem_(self, _cmd, anItem)
{
    if (!anItem)
        return YES;
    var itemInfo = self._itemInfosForItems[(anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID"))];
    if (!itemInfo)
        return YES;
    return itemInfo.shouldShowOutlineDisclosureControl;
}
,["BOOL","id"]), new objj_method(sel_getUid("isItemExpanded:"), function $CPOutlineView__isItemExpanded_(self, _cmd, anItem)
{
    if (!anItem)
        return YES;
    var itemInfo = self.isa.objj_msgSend1(self, "_itemInfosForItem:", anItem);
    if (!itemInfo)
        return NO;
    return itemInfo.isExpanded;
}
,["BOOL","id"]), new objj_method(sel_getUid("itemAtRow:"), function $CPOutlineView__itemAtRow_(self, _cmd, aRow)
{
    return self._itemsForRows[aRow] || nil;
}
,["id","CPInteger"]), new objj_method(sel_getUid("rowForItem:"), function $CPOutlineView__rowForItem_(self, _cmd, anItem)
{
    if (!anItem)
        return self._rootItemInfo.row;
    var itemInfo = self.isa.objj_msgSend1(self, "_itemInfosForItem:", anItem);
    if (!itemInfo)
        return CPNotFound;
    return itemInfo.row;
}
,["CPInteger","id"]), new objj_method(sel_getUid("levelForItem:"), function $CPOutlineView__levelForItem_(self, _cmd, anItem)
{
    if (!anItem)
        return self._rootItemInfo.level;
    var itemInfo = self.isa.objj_msgSend1(self, "_itemInfosForItem:", anItem);
    if (!itemInfo)
        return CPNotFound;
    return itemInfo.level;
}
,["CPInteger","id"]), new objj_method(sel_getUid("levelForRow:"), function $CPOutlineView__levelForRow_(self, _cmd, aRow)
{
    var item = self.isa.objj_msgSend1(self, "itemAtRow:", aRow);
    if (!item && aRow >= 0)
        item = CPObject.isa.objj_msgSend0(CPObject, "new");
    return self.isa.objj_msgSend1(self, "levelForItem:", item);
}
,["CPInteger","CPInteger"]), new objj_method(sel_getUid("_itemInfosForItem:"), function $CPOutlineView___itemInfosForItem_(self, _cmd, anItem)
{
    var itemInfo = self._itemInfosForItems[(anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID"))];
    if (!itemInfo || self.isa.objj_msgSend1(self, "_parentIsCollapsed:", self.isa.objj_msgSend1(self, "parentForItem:", anItem)))
        return nil;
    return itemInfo;
}
,["Object","id"]), new objj_method(sel_getUid("_parentIsCollapsed:"), function $CPOutlineView___parentIsCollapsed_(self, _cmd, anItem)
{
    var parentItem = self.isa.objj_msgSend1(self, "parentForItem:", anItem),
        itemInfo = self._itemInfosForItems[(anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID"))];
    if (!itemInfo)
        return NO;
    if (!itemInfo.isExpanded)
        return YES;
    return self.isa.objj_msgSend1(self, "_parentIsCollapsed:", parentItem);
}
,["BOOL","id"]), new objj_method(sel_getUid("expandItem:"), function $CPOutlineView__expandItem_(self, _cmd, anItem)
{
    self.isa.objj_msgSend2(self, "expandItem:expandChildren:", anItem, NO);
}
,["void","id"]), new objj_method(sel_getUid("expandItem:expandChildren:"), function $CPOutlineView__expandItem_expandChildren_(self, _cmd, anItem, shouldExpandChildren)
{
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToShouldExpandItem"))
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:shouldExpandItem:", self, anItem)) == NO)
            return;
    var itemInfo = null;
    if (!anItem)
        itemInfo = self._rootItemInfo;
    else
        itemInfo = self._itemInfosForItems[(anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID"))];
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
        self.isa.objj_msgSend1(self, "_noteItemWillExpand:", anItem);
        var previousRowCount = self.isa.objj_msgSend0(self, "numberOfRows");
        itemInfo.isExpanded = YES;
        self.isa.objj_msgSend2(self, "reloadItem:reloadChildren:", anItem, YES);
        self.isa.objj_msgSend1(self, "_noteItemDidExpand:", anItem);
        var rowCountDelta = self.isa.objj_msgSend0(self, "numberOfRows") - previousRowCount;
        if (rowCountDelta)
        {
            var selection = self.isa.objj_msgSend0(self, "selectedRowIndexes"),
                expandIndex = self.isa.objj_msgSend1(self, "rowForItem:", anItem) + 1;
            if ((selection == null ? null : selection.isa.objj_msgSend1(selection, "intersectsIndexesInRange:", CPMakeRange(expandIndex, self._itemsForRows.length))))
            {
                self.isa.objj_msgSend0(self, "_noteSelectionIsChanging");
                (selection == null ? null : selection.isa.objj_msgSend2(selection, "shiftIndexesStartingAtIndex:by:", expandIndex, rowCountDelta));
                self.isa.objj_msgSend1(self, "_setSelectedRowIndexes:", selection);
            }
        }
    }
    if (shouldExpandChildren)
    {
        var children = itemInfo.children,
            childIndex = children.length;
        while (childIndex--)
            self.isa.objj_msgSend2(self, "expandItem:expandChildren:", children[childIndex], YES);
    }
    if (isTopLevel)
    {
        var r = self._coalesceSelectionNotificationState;
        self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateOff;
        if (r === CPOutlineViewCoalesceSelectionNotificationStateDid)
            self.isa.objj_msgSend0(self, "_noteSelectionDidChange");
    }
    var ___r1;
}
,["void","id","BOOL"]), new objj_method(sel_getUid("collapseItem:"), function $CPOutlineView__collapseItem_(self, _cmd, anItem)
{
    if (!anItem)
        return;
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToShouldCollapseItem"))
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:shouldCollapseItem:", self, anItem)) == NO)
            return;
    var itemInfo = self._itemInfosForItems[(anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID"))];
    if (!itemInfo)
        return;
    if (!itemInfo.isExpanded)
        return;
    self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateOn;
    self.isa.objj_msgSend1(self, "_noteItemWillCollapse:", anItem);
    var collapseTopIndex = self.isa.objj_msgSend1(self, "rowForItem:", anItem),
        topLevel = self.isa.objj_msgSend1(self, "levelForRow:", collapseTopIndex),
        collapseEndIndex = collapseTopIndex;
    while (collapseEndIndex + 1 < self._itemsForRows.length && self.isa.objj_msgSend1(self, "levelForRow:", collapseEndIndex + 1) > topLevel)
        collapseEndIndex++;
    var collapseRange = CPMakeRange(collapseTopIndex + 1, collapseEndIndex - collapseTopIndex);
    if (collapseRange.length)
    {
        var selection = self.isa.objj_msgSend0(self, "selectedRowIndexes");
        if ((selection == null ? null : selection.isa.objj_msgSend1(selection, "intersectsIndexesInRange:", collapseRange)))
        {
            self.isa.objj_msgSend0(self, "_noteSelectionIsChanging");
            (selection == null ? null : selection.isa.objj_msgSend1(selection, "removeIndexesInRange:", collapseRange));
            self.isa.objj_msgSend1(self, "_setSelectedRowIndexes:", selection);
        }
        if ((selection == null ? null : selection.isa.objj_msgSend1(selection, "intersectsIndexesInRange:", CPMakeRange(collapseEndIndex + 1, self._itemsForRows.length))))
        {
            self.isa.objj_msgSend0(self, "_noteSelectionIsChanging");
            (selection == null ? null : selection.isa.objj_msgSend2(selection, "shiftIndexesStartingAtIndex:by:", collapseEndIndex + 1, -collapseRange.length));
            self.isa.objj_msgSend1(self, "_setSelectedRowIndexes:", selection);
        }
    }
    itemInfo.isExpanded = NO;
    self.isa.objj_msgSend2(self, "reloadItem:reloadChildren:", anItem, YES);
    self.isa.objj_msgSend1(self, "_noteItemDidCollapse:", anItem);
    var r = self._coalesceSelectionNotificationState;
    self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateOff;
    if (r === CPOutlineViewCoalesceSelectionNotificationStateDid)
        self.isa.objj_msgSend0(self, "_noteSelectionDidChange");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("reloadItem:"), function $CPOutlineView__reloadItem_(self, _cmd, anItem)
{
    self.isa.objj_msgSend2(self, "reloadItem:reloadChildren:", anItem, NO);
}
,["void","id"]), new objj_method(sel_getUid("reloadItem:reloadChildren:"), function $CPOutlineView__reloadItem_reloadChildren_(self, _cmd, anItem, shouldReloadChildren)
{
    if (!!shouldReloadChildren || !anItem)
        self.isa.objj_msgSend2(self, "_loadItemInfoForItem:intermediate:", anItem, NO);
    else
        self.isa.objj_msgSend1(self, "_reloadItem:", anItem);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "reloadData");
}
,["void","id","BOOL"]), new objj_method(sel_getUid("_reloadItem:"), function $CPOutlineView___reloadItem_(self, _cmd, anItem)
{
    if (!anItem)
        return;
    var itemUID = (anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID")),
        itemInfo = self._itemInfosForItems[itemUID];
    if (!itemInfo)
        return [];
    var parent = itemInfo.parent,
        parentItemInfo = parent ? self._itemInfosForItems[(parent == null ? null : parent.isa.objj_msgSend0(parent, "UID"))] : self._rootItemInfo,
        parentChildren = parentItemInfo.children,
        index = (parentChildren == null ? null : parentChildren.isa.objj_msgSend1(parentChildren, "indexOfObjectIdenticalTo:", anItem)),
        newItem = ((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "outlineView:child:ofItem:", self, index, parent));
    if (anItem !== newItem)
    {
        self._itemInfosForItems[(anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID"))] = nil;
        self._itemInfosForItems[(newItem == null ? null : newItem.isa.objj_msgSend0(newItem, "UID"))] = itemInfo;
        parentChildren[index] = newItem;
        self._itemsForRows[itemInfo.row] = newItem;
    }
    itemInfo.isExpandable = ((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:isItemExpandable:", self, newItem));
    itemInfo.isExpanded = itemInfo.isExpandable && itemInfo.isExpanded;
    itemInfo.shouldShowOutlineDisclosureControl = self.isa.objj_msgSend1(self, "_sendDelegateShouldShowOutlineDisclosureControlForItem:", newItem);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_cleanPreviousItems:forItemInfo:"), function $CPOutlineView___cleanPreviousItems_forItemInfo_(self, _cmd, previousItems, itemInfo)
{
    if (!itemInfo)
        return;
    var children = itemInfo.children;
    for (var i = (previousItems == null ? null : previousItems.isa.objj_msgSend0(previousItems, "count")) - 1; i >= 0; i--)
    {
        var item = previousItems[i];
        if (!(children == null ? null : children.isa.objj_msgSend1(children, "containsObject:", item)))
            self.isa.objj_msgSend1(self, "_cleanItem:", item);
    }
}
,["void","CPArray","Object"]), new objj_method(sel_getUid("_cleanItem:"), function $CPOutlineView___cleanItem_(self, _cmd, anItem)
{
    var itemInfo = self._itemInfosForItems[(anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID"))];
    if (!itemInfo)
        return;
    var children = itemInfo.children;
    for (var i = (children == null ? null : children.isa.objj_msgSend0(children, "count")); i >= 0; i--)
    {
        var child = children[i];
        self.isa.objj_msgSend1(self, "_cleanItem:", child);
    }
    delete self._itemInfosForItems[(anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID"))];
}
,["void","id"]), new objj_method(sel_getUid("_loadItemInfoForItem:intermediate:"), function $CPOutlineView___loadItemInfoForItem_intermediate_(self, _cmd, anItem, isIntermediate)
{
    if (!anItem)
    {
        var itemInfo = self._rootItemInfo;
    }
    else
    {
        var itemUID = (anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID")),
            itemInfo = self._itemInfosForItems[itemUID];
        if (!itemInfo)
            return [];
        itemInfo.isExpandable = ((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:isItemExpandable:", self, anItem));
        itemInfo.shouldShowOutlineDisclosureControl = self.isa.objj_msgSend1(self, "_sendDelegateShouldShowOutlineDisclosureControlForItem:", anItem);
        if (!itemInfo.isExpandable && itemInfo.isExpanded)
        {
            itemInfo.isExpanded = NO;
            itemInfo.children = [];
        }
    }
    var weight = itemInfo.weight,
        descendants = anItem ? [anItem] : [];
    if (itemInfo.isExpanded && self.isa.objj_msgSend1(self, "_sendDataSourceShouldDeferDisplayingChildrenOfItem:", anItem))
    {
        var index = 0,
            count = ((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:numberOfChildrenOfItem:", self, anItem)),
            level = itemInfo.level + 1,
            previousChildren = itemInfo.children;
        itemInfo.children = [];
        for (; index < count; ++index)
        {
            var childItem = ((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "outlineView:child:ofItem:", self, index, anItem)),
                childItemInfo = self._itemInfosForItems[(childItem == null ? null : childItem.isa.objj_msgSend0(childItem, "UID"))];
            if (!childItemInfo)
            {
                childItemInfo = {isExpanded: NO, isExpandable: NO, shouldShowOutlineDisclosureControl: YES, children: [], weight: 1};
                self._itemInfosForItems[(childItem == null ? null : childItem.isa.objj_msgSend0(childItem, "UID"))] = childItemInfo;
            }
            itemInfo.children[index] = childItem;
            var childDescendants = self.isa.objj_msgSend2(self, "_loadItemInfoForItem:intermediate:", childItem, YES);
            childItemInfo.parent = anItem;
            childItemInfo.level = level;
            descendants = descendants.concat(childDescendants);
        }
        self.isa.objj_msgSend2(self, "_cleanPreviousItems:forItemInfo:", previousChildren, itemInfo);
    }
    itemInfo.weight = descendants.length;
    if (!isIntermediate)
    {
        var index = MAX(itemInfo.row, 0);
        descendants.unshift(index, weight);
        self._itemsForRows.splice.apply(self._itemsForRows, descendants);
        var count = self._itemsForRows.length;
        for (; index < count; ++index)
            self._itemInfosForItems[((___r1 = self._itemsForRows[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"))].row = index;
        var deltaWeight = itemInfo.weight - weight;
        if (deltaWeight !== 0)
        {
            var parent = itemInfo.parent;
            while (parent)
            {
                var parentItemInfo = self._itemInfosForItems[(parent == null ? null : parent.isa.objj_msgSend0(parent, "UID"))];
                parentItemInfo.weight += deltaWeight;
                parent = parentItemInfo.parent;
            }
            if (anItem)
                self._rootItemInfo.weight += deltaWeight;
        }
    }
    return descendants;
    var ___r1;
}
,["CPArray","id","BOOL"]), new objj_method(sel_getUid("setOutlineTableColumn:"), function $CPOutlineView__setOutlineTableColumn_(self, _cmd, aTableColumn)
{
    if (self._outlineTableColumn === aTableColumn)
        return;
    self._outlineTableColumn = aTableColumn;
    self.isa.objj_msgSend0(self, "reloadData");
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("outlineTableColumn"), function $CPOutlineView__outlineTableColumn(self, _cmd)
{
    return self._outlineTableColumn;
}
,["CPTableColumn"]), new objj_method(sel_getUid("setIndentationPerLevel:"), function $CPOutlineView__setIndentationPerLevel_(self, _cmd, anIndentationWidth)
{
    if (self._indentationPerLevel === anIndentationWidth)
        return;
    self._indentationPerLevel = anIndentationWidth;
    self.isa.objj_msgSend0(self, "reloadData");
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
    self.isa.objj_msgSend0(self, "reloadData");
}
,["void","BOOL"]), new objj_method(sel_getUid("indentationMarkerFollowsDataView"), function $CPOutlineView__indentationMarkerFollowsDataView(self, _cmd)
{
    return self._indentationMarkerFollowsDataView;
}
,["BOOL"]), new objj_method(sel_getUid("parentForItem:"), function $CPOutlineView__parentForItem_(self, _cmd, anItem)
{
    if (!anItem)
        return nil;
    var itemInfo = self._itemInfosForItems[(anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID"))];
    if (!itemInfo)
        return nil;
    var parent = itemInfo.parent;
    if (itemInfo[(parent == null ? null : parent.isa.objj_msgSend0(parent, "UID"))] === self._rootItemInfo)
        parent = nil;
    return parent;
}
,["id","id"]), new objj_method(sel_getUid("_frameOfOutlineDataViewAtRow:"), function $CPOutlineView___frameOfOutlineDataViewAtRow_(self, _cmd, aRow)
{
    var columnIndex = ((___r1 = self.isa.objj_msgSend0(self, "tableColumns")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", self._outlineTableColumn)),
        frame = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "frameOfDataViewAtColumn:row:", columnIndex, aRow),
        indentationWidth = (self.isa.objj_msgSend1(self, "levelForRow:", aRow) + 1) * self.isa.objj_msgSend0(self, "indentationPerLevel");
    frame.origin.x += indentationWidth;
    frame.size.width -= indentationWidth;
    return frame;
    var ___r1;
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("frameOfOutlineDisclosureControlAtRow:"), function $CPOutlineView__frameOfOutlineDisclosureControlAtRow_(self, _cmd, aRow)
{
    var theItem = self.isa.objj_msgSend1(self, "itemAtRow:", aRow);
    if (!self.isa.objj_msgSend1(self, "isExpandable:", theItem) || !self.isa.objj_msgSend1(self, "_shouldShowOutlineDisclosureControlForItem:", theItem))
        return CGRectMakeZero();
    var dataViewFrame = self.isa.objj_msgSend1(self, "_frameOfOutlineDataViewAtRow:", aRow),
        disclosureWidth = CGRectGetWidth(((___r1 = self._disclosureControlPrototype), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))),
        frame = CGRectMake(CGRectGetMinX(dataViewFrame) - disclosureWidth, CGRectGetMinY(dataViewFrame), disclosureWidth, CGRectGetHeight(dataViewFrame));
    return frame;
    var ___r1;
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("_setSelectedRowIndexes:"), function $CPOutlineView___setSelectedRowIndexes_(self, _cmd, rows)
{
    if (self._disclosureControlsForRows.length)
    {
        var indexes = ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "removeIndexesInRange:", CPMakeRange(self._disclosureControlsForRows.length, self._itemsForRows.length - self._disclosureControlsForRows.length)));
        ((___r1 = ((___r2 = self._disclosureControlsForRows), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectsAtIndexes:", indexes))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("unsetThemeState:"), CPThemeStateSelected));
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "_setSelectedRowIndexes:", rows);
    if (self._disclosureControlsForRows.length)
    {
        var indexes = ((___r1 = self._selectedRowIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "removeIndexesInRange:", CPMakeRange(self._disclosureControlsForRows.length, self._itemsForRows.length - self._disclosureControlsForRows.length)));
        ((___r1 = ((___r2 = self._disclosureControlsForRows), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectsAtIndexes:", indexes))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setThemeState:"), CPThemeStateSelected));
    }
    var ___r1, ___r2;
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("setDelegate:"), function $CPOutlineView__setDelegate_(self, _cmd, aDelegate)
{
    if (self._outlineViewDelegate === aDelegate)
        return;
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (self._outlineViewDelegate)
    {
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewColumnDidMove:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewColumnDidMoveNotification, self));
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewColumnDidResize:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewColumnDidResizeNotification, self));
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewSelectionDidChange:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewSelectionDidChangeNotification, self));
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewSelectionIsChanging:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewSelectionIsChangingNotification, self));
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewItemWillExpand:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewItemWillExpandNotification, self));
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewItemDidExpand:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewItemDidExpandNotification, self));
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewItemWillCollapse:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewItemWillCollapseNotification, self));
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewItemDidCollapse:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._outlineViewDelegate, CPOutlineViewItemDidCollapseNotification, self));
    }
    self._outlineViewDelegate = aDelegate;
    self._implementedOutlineViewDelegateMethods = 0;
    var delegateMethods = [CPOutlineViewDelegate_outlineView_dataViewForTableColumn_item_, sel_getUid("outlineView:dataViewForTableColumn:item:"), CPOutlineViewDelegate_outlineView_viewForTableColumn_item_, sel_getUid("outlineView:viewForTableColumn:item:"), CPOutlineViewDelegate_outlineView_didClickTableColumn_, sel_getUid("outlineView:didClickTableColumn:"), CPOutlineViewDelegate_outlineView_didDragTableColumn_, sel_getUid("outlineView:didDragTableColumn:"), CPOutlineViewDelegate_outlineView_heightOfRowByItem_, sel_getUid("outlineView:heightOfRowByItem:"), CPOutlineViewDelegate_outlineView_isGroupItem_, sel_getUid("outlineView:isGroupItem:"), CPOutlineViewDelegate_outlineView_mouseDownInHeaderOfTableColumn_, sel_getUid("outlineView:mouseDownInHeaderOfTableColumn:"), CPOutlineViewDelegate_outlineView_nextTypeSelectMatchFromItem_toItem_forString_, sel_getUid("outlineView:nextTypeSelectMatchFromItem:toItem:forString:"), CPOutlineViewDelegate_outlineView_selectionIndexesForProposedSelection_, sel_getUid("outlineView:selectionIndexesForProposedSelection:"), CPOutlineViewDelegate_outlineView_shouldCollapseItem_, sel_getUid("outlineView:shouldCollapseItem:"), CPOutlineViewDelegate_outlineView_shouldEditTableColumn_item_, sel_getUid("outlineView:shouldEditTableColumn:item:"), CPOutlineViewDelegate_outlineView_shouldExpandItem_, sel_getUid("outlineView:shouldExpandItem:"), CPOutlineViewDelegate_outlineView_shouldReorderColumn_toColumn_, sel_getUid("outlineView:shouldReorderColumn:toColumn:"), CPOutlineViewDelegate_outlineView_shouldSelectItem_, sel_getUid("outlineView:shouldSelectItem:"), CPOutlineViewDelegate_outlineView_shouldSelectTableColumn_, sel_getUid("outlineView:shouldSelectTableColumn:"), CPOutlineViewDelegate_outlineView_shouldShowOutlineDisclosureControlForItem_, sel_getUid("outlineView:shouldShowOutlineDisclosureControlForItem:"), CPOutlineViewDelegate_outlineView_shouldShowViewExpansionForTableColumn_item_, sel_getUid("outlineView:shouldShowViewExpansionForTableColumn:item:"), CPOutlineViewDelegate_outlineView_shouldTrackView_forTableColumn_item_, sel_getUid("outlineView:shouldTrackView:forTableColumn:item:"), CPOutlineViewDelegate_outlineView_shouldTypeSelectForEvent_withCurrentSearchString_, sel_getUid("outlineView:shouldTypeSelectForEvent:withCurrentSearchString:"), CPOutlineViewDelegate_outlineView_sizeToFitWidthOfColumn_, sel_getUid("outlineView:sizeToFitWidthOfColumn:"), CPOutlineViewDelegate_outlineView_toolTipForView_rect_tableColumn_item_mouseLocation_, sel_getUid("outlineView:toolTipForView:rect:tableColumn:item:mouseLocation:"), CPOutlineViewDelegate_outlineView_typeSelectStringForTableColumn_item_, sel_getUid("outlineView:typeSelectStringForTableColumn:item:"), CPOutlineViewDelegate_outlineView_willDisplayOutlineView_forTableColumn_item_, sel_getUid("outlineView:willDisplayOutlineView:forTableColumn:item:"), CPOutlineViewDelegate_outlineView_willDisplayView_forTableColumn_item_, sel_getUid("outlineView:willDisplayView:forTableColumn:item:"), CPOutlineViewDelegate_outlineView_willRemoveView_forTableColumn_item_, sel_getUid("outlineView:willRemoveView:forTableColumn:item:"), CPOutlineViewDelegate_selectionShouldChangeInOutlineView_, sel_getUid("selectionShouldChangeInOutlineView:"), CPOutlineViewDelegate_outlineView_menuForTableColumn_item_, sel_getUid("outlineView:menuForTableColumn:item:")],
        delegateCount = (delegateMethods == null ? null : delegateMethods.isa.objj_msgSend0(delegateMethods, "count"));
    for (var i = 0; i < delegateCount; i += 2)
    {
        var bitMask = delegateMethods[i],
            selector = delegateMethods[i + 1];
        if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", selector)))
            self._implementedOutlineViewDelegateMethods |= bitMask;
    }
    if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewColumnDidMove:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewColumnDidMove:"), CPOutlineViewColumnDidMoveNotification, self));
    if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewColumnDidResize:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewColumnDidMove:"), CPOutlineViewColumnDidResizeNotification, self));
    if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewSelectionDidChange:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewSelectionDidChange:"), CPOutlineViewSelectionDidChangeNotification, self));
    if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewSelectionIsChanging:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewSelectionIsChanging:"), CPOutlineViewSelectionIsChangingNotification, self));
    if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewItemWillExpand:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewItemWillExpand:"), CPOutlineViewItemWillExpandNotification, self));
    if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewItemDidExpand:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewItemDidExpand:"), CPOutlineViewItemDidExpandNotification, self));
    if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewItemWillCollapse:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewItemWillCollapse:"), CPOutlineViewItemWillCollapseNotification, self));
    if (((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewItemDidCollapse:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._outlineViewDelegate, sel_getUid("outlineViewItemDidCollapse:"), CPOutlineViewItemDidCollapseNotification, self));
    self.isa.objj_msgSend0(self, "_updateIsViewBased");
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToDataViewForTableColumn"))
        CPLog.warn("outlineView:dataViewForTableColumn:item: is deprecated. You should use -outlineView:viewForTableColumn:item: where you can request the view with -makeViewWithIdentifier:owner:");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPOutlineView__delegate(self, _cmd)
{
    return self._outlineViewDelegate;
}
,["id"]), new objj_method(sel_getUid("setDisclosureControlPrototype:"), function $CPOutlineView__setDisclosureControlPrototype_(self, _cmd, aControl)
{
    self._disclosureControlPrototype = aControl;
    self._disclosureControlData = nil;
    self._disclosureControlQueue = [];
    self.isa.objj_msgSend0(self, "reloadData");
}
,["void","CPControl"]), new objj_method(sel_getUid("reloadData"), function $CPOutlineView__reloadData(self, _cmd)
{
    self.isa.objj_msgSend2(self, "reloadItem:reloadChildren:", nil, YES);
}
,["void"]), new objj_method(sel_getUid("addTableColumn:"), function $CPOutlineView__addTableColumn_(self, _cmd, aTableColumn)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "addTableColumn:", aTableColumn);
    if (self.isa.objj_msgSend0(self, "numberOfColumns") === 1)
        self._outlineTableColumn = aTableColumn;
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("removeTableColumn:"), function $CPOutlineView__removeTableColumn_(self, _cmd, aTableColumn)
{
    if (aTableColumn === self.isa.objj_msgSend0(self, "outlineTableColumn"))
        CPLog("CPOutlineView cannot remove outlineTableColumn with removeTableColumn:. User setOutlineTableColumn: instead.");
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "removeTableColumn:", aTableColumn);
}
,["void","CPTableColumn"]), new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"), function $CPOutlineView__frameOfDataViewAtColumn_row_(self, _cmd, aColumn, aRow)
{
    var tableColumn = self.isa.objj_msgSend0(self, "tableColumns")[aColumn];
    if (tableColumn === self._outlineTableColumn)
        return self.isa.objj_msgSend1(self, "_frameOfOutlineDataViewAtRow:", aRow);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "frameOfDataViewAtColumn:row:", aColumn, aRow);
}
,["CGRect","CPInteger","CPInteger"]), new objj_method(sel_getUid("_dragViewForColumn:event:offset:"), function $CPOutlineView___dragViewForColumn_event_offset_(self, _cmd, theColumnIndex, theDragEvent, theDragViewOffset)
{
    var dragView = ((___r1 = _CPColumnDragView.isa.objj_msgSend0(_CPColumnDragView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithLineColor:", self.isa.objj_msgSend0(self, "gridColor"))),
        tableColumn = ((___r1 = self.isa.objj_msgSend0(self, "tableColumns")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", theColumnIndex)),
        defaultRowHeight = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "default-row-height"),
        bounds = CGRectMake(0.0, 0.0, (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "width")), CGRectGetHeight(self.isa.objj_msgSend0(self, "exposedRect")) + defaultRowHeight),
        columnRect = self.isa.objj_msgSend1(self, "rectOfColumn:", theColumnIndex),
        headerView = (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "headerView")),
        row = ((___r1 = self._exposedRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex"));
    while (row !== CPNotFound)
    {
        var dataView = self.isa.objj_msgSend2(self, "_newDataViewForRow:tableColumn:", row, tableColumn),
            dataViewFrame = self.isa.objj_msgSend2(self, "frameOfDataViewAtColumn:row:", theColumnIndex, row);
        dataViewFrame.origin.x = 0.0;
        dataViewFrame.origin.y = CGRectGetMinY(dataViewFrame) - CGRectGetMinY(self.isa.objj_msgSend0(self, "exposedRect")) + defaultRowHeight;
        (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setFrame:", dataViewFrame));
        (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setObjectValue:", self.isa.objj_msgSend2(self, "_objectValueForTableColumn:row:", tableColumn, row)));
        if (tableColumn === self._outlineTableColumn)
        {
            var indentationWidth = (self.isa.objj_msgSend1(self, "levelForRow:", row) + 1) * self.isa.objj_msgSend0(self, "indentationPerLevel");
            dataViewFrame.origin.x += indentationWidth;
            dataViewFrame.size.width -= indentationWidth;
            (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setFrame:", dataViewFrame));
        }
        (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "addSubview:", dataView));
        row = ((___r1 = self._exposedRows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexGreaterThanIndex:", row));
    }
    var headerFrame = (headerView == null ? null : headerView.isa.objj_msgSend0(headerView, "frame"));
    headerFrame.origin = CGPointMakeZero();
    var columnHeaderView = ((___r1 = _CPTableColumnHeaderView.isa.objj_msgSend0(_CPTableColumnHeaderView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", headerFrame));
    (columnHeaderView == null ? null : columnHeaderView.isa.objj_msgSend1(columnHeaderView, "setStringValue:", (headerView == null ? null : headerView.isa.objj_msgSend0(headerView, "stringValue"))));
    (columnHeaderView == null ? null : columnHeaderView.isa.objj_msgSend1(columnHeaderView, "setThemeState:", (headerView == null ? null : headerView.isa.objj_msgSend0(headerView, "themeState"))));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "addSubview:", columnHeaderView));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "setAlphaValue:", 0.7));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "setFrame:", bounds));
    return dragView;
    var ___r1;
}
,["CPView","CPInteger","CPEvent","CGPoint"]), new objj_method(sel_getUid("setDropItem:dropChildIndex:"), function $CPOutlineView__setDropItem_dropChildIndex_(self, _cmd, theItem, theIndex)
{
    if (self._dropItem !== theItem && theIndex < 0 && self.isa.objj_msgSend1(self, "isExpandable:", theItem) && !self.isa.objj_msgSend1(self, "isItemExpanded:", theItem))
    {
        if (self._dragHoverTimer)
            ((___r1 = self._dragHoverTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
        var autoExpandCallBack = function()
        {
            if (self._dropItem)
            {
                ((___r1 = self._dropOperationFeedbackView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "blink"));
                CPTimer.isa.objj_msgSend3(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", .3, objj_msgSend(self, "expandItem:", self._dropItem), NO);
            }
            var ___r1;
        };
        self._dragHoverTimer = CPTimer.isa.objj_msgSend3(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", .8, autoExpandCallBack, NO);
    }
    if (theIndex >= 0)
    {
        ((___r1 = self._dragHoverTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
        self._dragHoverTimer = nil;
    }
    self._dropItem = theItem;
    self._retargetedItem = theItem;
    self._shouldRetargetItem = YES;
    self._retargedChildIndex = theIndex;
    self._shouldRetargetChildIndex = YES;
    var retargetedItemInfo = self._retargetedItem !== nil ? self._itemInfosForItems[((___r1 = self._retargetedItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"))] : self._rootItemInfo;
    if (self._retargedChildIndex === ((___r1 = retargetedItemInfo.children), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
    {
        var retargetedChildItem = ((___r1 = retargetedItemInfo.children), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastObject"));
        self._retargetedDropRow = self.isa.objj_msgSend1(self, "rowForItem:", retargetedChildItem) + 1;
    }
    else
    {
        var retargetedChildItem = self._retargedChildIndex !== CPOutlineViewDropOnItemIndex ? retargetedItemInfo.children[self._retargedChildIndex] : self._retargetedItem;
        self._retargetedDropRow = self.isa.objj_msgSend1(self, "rowForItem:", retargetedChildItem);
    }
    var ___r1;
}
,["void","id","int"]), new objj_method(sel_getUid("_draggingEnded"), function $CPOutlineView___draggingEnded(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "_draggingEnded");
    self._dropItem = nil;
    ((___r1 = self._dragHoverTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
    self._dragHoverTimer = nil;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_parentItemForUpperRow:andLowerRow:atMouseOffset:"), function $CPOutlineView___parentItemForUpperRow_andLowerRow_atMouseOffset_(self, _cmd, theUpperRowIndex, theLowerRowIndex, theOffset)
{
    if (self._shouldRetargetItem)
        return self._retargetedItem;
    var lowerLevel = self.isa.objj_msgSend1(self, "levelForRow:", theLowerRowIndex),
        upperItem = self.isa.objj_msgSend1(self, "itemAtRow:", theUpperRowIndex),
        upperLevel = self.isa.objj_msgSend1(self, "levelForItem:", upperItem);
    while (upperLevel > lowerLevel)
    {
        upperLevel = self.isa.objj_msgSend1(self, "levelForItem:", upperItem);
        if (theOffset.x > (upperLevel + 1) * self.isa.objj_msgSend0(self, "indentationPerLevel"))
            return self.isa.objj_msgSend1(self, "parentForItem:", upperItem);
        upperItem = self.isa.objj_msgSend1(self, "parentForItem:", upperItem);
    }
    return self.isa.objj_msgSend1(self, "parentForItem:", self.isa.objj_msgSend1(self, "itemAtRow:", theLowerRowIndex));
}
,["id","CPInteger","CPInteger","CGPoint"]), new objj_method(sel_getUid("_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:"), function $CPOutlineView___rectForDropHighlightViewBetweenUpperRow_andLowerRow_offset_(self, _cmd, theUpperRowIndex, theLowerRowIndex, theOffset)
{
    var rect = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "_rectForDropHighlightViewBetweenUpperRow:andLowerRow:offset:", theUpperRowIndex, theLowerRowIndex, theOffset),
        parentItem = self.isa.objj_msgSend3(self, "_parentItemForUpperRow:andLowerRow:atMouseOffset:", theUpperRowIndex, theLowerRowIndex, theOffset),
        level = self.isa.objj_msgSend1(self, "levelForItem:", parentItem);
    rect.origin.x = (level + 1) * self.isa.objj_msgSend0(self, "indentationPerLevel");
    rect.size.width -= rect.origin.x;
    return rect;
}
,["CGRect","CPInteger","CPInteger","CGPoint"]), new objj_method(sel_getUid("_layoutDataViewsInRows:columns:"), function $CPOutlineView___layoutDataViewsInRows_columns_(self, _cmd, rows, columns)
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
        for (; rowIndex < rowsCount; ++rowIndex)
        {
            var row = rowArray[rowIndex],
                dataView = dataViewsForTableColumn[row],
                dataViewFrame = self.isa.objj_msgSend2(self, "frameOfDataViewAtColumn:row:", column, row);
            (dataView == null ? null : dataView.isa.objj_msgSend1(dataView, "setFrame:", dataViewFrame));
            if (tableColumn === self._outlineTableColumn)
            {
                var control = self._disclosureControlsForRows[row],
                    frame = self.isa.objj_msgSend1(self, "frameOfOutlineDisclosureControlAtRow:", row);
                (control == null ? null : control.isa.objj_msgSend1(control, "setFrame:", frame));
            }
        }
    }
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_loadDataViewsInRows:columns:"), function $CPOutlineView___loadDataViewsInRows_columns_(self, _cmd, rows, columns)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "_loadDataViewsInRows:columns:", rows, columns);
    var outlineColumn = ((___r1 = self.isa.objj_msgSend0(self, "tableColumns")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", self.isa.objj_msgSend0(self, "outlineTableColumn")));
    if (!(columns == null ? null : columns.isa.objj_msgSend1(columns, "containsIndex:", outlineColumn)) || self.isa.objj_msgSend0(self, "outlineTableColumn") === self._draggedColumn)
        return;
    var rowArray = [];
    (rows == null ? null : rows.isa.objj_msgSend3(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil));
    var rowIndex = 0,
        rowsCount = rowArray.length;
    for (; rowIndex < rowsCount; ++rowIndex)
    {
        var row = rowArray[rowIndex],
            item = self._itemsForRows[row],
            isExpandable = self.isa.objj_msgSend1(self, "isExpandable:", item);
        if (!isExpandable)
            continue;
        var disclosureControlFrame = self.isa.objj_msgSend1(self, "frameOfOutlineDisclosureControlAtRow:", row);
        if (CGRectIsEmpty(disclosureControlFrame))
            continue;
        var control = self.isa.objj_msgSend0(self, "_dequeueDisclosureControl");
        self._disclosureControlsForRows[row] = control;
        (control == null ? null : control.isa.objj_msgSend1(control, "setState:", self.isa.objj_msgSend1(self, "isItemExpanded:", item) ? CPOnState : CPOffState));
        var selector = self.isa.objj_msgSend1(self, "isRowSelected:", row) ? "setThemeState:" : "unsetThemeState:";
        (control == null ? null : control.isa.objj_msgSend2(control, "performSelector:withObject:", CPSelectorFromString(selector), CPThemeStateSelected));
        (control == null ? null : control.isa.objj_msgSend1(control, "setFrame:", disclosureControlFrame));
        self.isa.objj_msgSend1(self, "addSubview:", control);
    }
    var ___r1;
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"), function $CPOutlineView___unloadDataViewsInRows_columns_(self, _cmd, rows, columns)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "_unloadDataViewsInRows:columns:", rows, columns);
    var outlineColumn = ((___r1 = self.isa.objj_msgSend0(self, "tableColumns")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", self.isa.objj_msgSend0(self, "outlineTableColumn")));
    if (!(columns == null ? null : columns.isa.objj_msgSend1(columns, "containsIndex:", outlineColumn)))
        return;
    var rowArray = [];
    (rows == null ? null : rows.isa.objj_msgSend3(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil));
    var rowIndex = 0,
        rowsCount = rowArray.length;
    for (; rowIndex < rowsCount; ++rowIndex)
    {
        var row = rowArray[rowIndex],
            control = self._disclosureControlsForRows[row];
        if (!control)
            continue;
        (control == null ? null : control.isa.objj_msgSend0(control, "removeFromSuperview"));
        self.isa.objj_msgSend1(self, "_enqueueDisclosureControl:", control);
        self._disclosureControlsForRows[row] = nil;
    }
    var ___r1;
}
,["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_toggleFromDisclosureControl:"), function $CPOutlineView___toggleFromDisclosureControl_(self, _cmd, aControl)
{
    var controlFrame = (aControl == null ? null : aControl.isa.objj_msgSend0(aControl, "frame")),
        item = self.isa.objj_msgSend1(self, "itemAtRow:", self.isa.objj_msgSend1(self, "rowAtPoint:", CGPointMake(CGRectGetMinX(controlFrame), CGRectGetMidY(controlFrame))));
    if (self.isa.objj_msgSend1(self, "isItemExpanded:", item))
        self.isa.objj_msgSend1(self, "collapseItem:", item);
    else
        self.isa.objj_msgSend2(self, "expandItem:expandChildren:", item, ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "modifierFlags")) & CPAlternateKeyMask);
    var ___r1;
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
            self._disclosureControlData = CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", self._disclosureControlPrototype);
    var disclosureControl = CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", self._disclosureControlData);
    (disclosureControl == null ? null : disclosureControl.isa.objj_msgSend1(disclosureControl, "setTarget:", self));
    (disclosureControl == null ? null : disclosureControl.isa.objj_msgSend1(disclosureControl, "setAction:", sel_getUid("_toggleFromDisclosureControl:")));
    return disclosureControl;
}
,["CPControl"]), new objj_method(sel_getUid("_noteSelectionIsChanging"), function $CPOutlineView___noteSelectionIsChanging(self, _cmd)
{
    if (!self._coalesceSelectionNotificationState || self._coalesceSelectionNotificationState === CPOutlineViewCoalesceSelectionNotificationStateOn)
    {
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPOutlineViewSelectionIsChangingNotification, self, nil));
    }
    if (self._coalesceSelectionNotificationState === CPOutlineViewCoalesceSelectionNotificationStateOn)
        self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateDid;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_noteSelectionDidChange"), function $CPOutlineView___noteSelectionDidChange(self, _cmd)
{
    if (!self._coalesceSelectionNotificationState)
    {
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPOutlineViewSelectionDidChangeNotification, self, nil));
    }
    if (self._coalesceSelectionNotificationState === CPOutlineViewCoalesceSelectionNotificationStateOn)
        self._coalesceSelectionNotificationState = CPOutlineViewCoalesceSelectionNotificationStateDid;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_noteItemWillExpand:"), function $CPOutlineView___noteItemWillExpand_(self, _cmd, item)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPOutlineViewItemWillExpandNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", item, "CPObject")));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_noteItemDidExpand:"), function $CPOutlineView___noteItemDidExpand_(self, _cmd, item)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPOutlineViewItemDidExpandNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", item, "CPObject")));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_noteItemWillCollapse:"), function $CPOutlineView___noteItemWillCollapse_(self, _cmd, item)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPOutlineViewItemWillCollapseNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", item, "CPObject")));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_noteItemDidCollapse:"), function $CPOutlineView___noteItemDidCollapse_(self, _cmd, item)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPOutlineViewItemDidCollapseNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", item, "CPObject")));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("keyDown:"), function $CPOutlineView__keyDown_(self, _cmd, anEvent)
{
    var character = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers")),
        modifierFlags = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags"));
    if (character !== CPRightArrowFunctionKey && character !== CPLeftArrowFunctionKey)
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "keyDown:", anEvent);
    var rows = self.isa.objj_msgSend0(self, "selectedRowIndexes"),
        indexes = [],
        items = [];
    (rows == null ? null : rows.isa.objj_msgSend3(rows, "getIndexes:maxCount:inIndexRange:", indexes, -1, nil));
    var i = 0,
        c = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "count"));
    for (; i < c; i++)
        items.push(self.isa.objj_msgSend1(self, "itemAtRow:", indexes[i]));
    if (character === CPRightArrowFunctionKey)
    {
        for (var i = 0; i < c; i++)
            self.isa.objj_msgSend1(self, "expandItem:", items[i]);
    }
    else if (character === CPLeftArrowFunctionKey)
    {
        if (c == 1)
        {
            var theItem = items[0];
            if (!self.isa.objj_msgSend1(self, "isItemExpanded:", theItem))
            {
                var parent = self.isa.objj_msgSend1(self, "parentForItem:", theItem),
                    shouldSelect = parent && (!(self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_selectionShouldChangeInOutlineView_) || ((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectionShouldChangeInOutlineView:", self))) && (!(self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldSelectItem_) || ((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:shouldSelectItem:", self, parent)));
                if (shouldSelect)
                {
                    var rowIndex = self.isa.objj_msgSend1(self, "rowForItem:", parent);
                    self.isa.objj_msgSend2(self, "selectRowIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", rowIndex), NO);
                    self.isa.objj_msgSend1(self, "scrollRowToVisible:", rowIndex);
                    return;
                }
            }
        }
        for (var i = 0; i < c; i++)
            self.isa.objj_msgSend1(self, "collapseItem:", items[i]);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "keyDown:", anEvent);
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_sendDelegateDeleteKeyPressed"), function $CPOutlineView___sendDelegateDeleteKeyPressed(self, _cmd)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("outlineViewDeleteKeyPressed:"))))
    {
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "outlineViewDeleteKeyPressed:", self));
        return YES;
    }
    return NO;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateShouldShowOutlineDisclosureControlForItem:"), function $CPOutlineView___sendDelegateShouldShowOutlineDisclosureControlForItem_(self, _cmd, anItem)
{
    if (!(self._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldShowOutlineDisclosureControlForItem_))
        return YES;
    return ((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:shouldShowOutlineDisclosureControlForItem:", self, anItem));
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("_sendDataSourceShouldDeferDisplayingChildrenOfItem:"), function $CPOutlineView___sendDataSourceShouldDeferDisplayingChildrenOfItem_(self, _cmd, anItem)
{
    if (!(self._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_shouldDeferDisplayingChildrenOfItem_))
        return YES;
    return ((___r1 = self._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:shouldDeferDisplayingChildrenOfItem:", self, anItem));
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("_sendDelegateViewForTableColumn:row:"), function $CPOutlineView___sendDelegateViewForTableColumn_row_(self, _cmd, aTableColumn, aRow)
{
    return ((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "outlineView:viewForTableColumn:item:", self, aTableColumn, self.isa.objj_msgSend1(self, "itemAtRow:", aRow)));
    var ___r1;
}
,["CPView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_sendDelegateDataViewForTableColumn:row:"), function $CPOutlineView___sendDelegateDataViewForTableColumn_row_(self, _cmd, aTableColumn, aRow)
{
    return ((___r1 = self._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "outlineView:dataViewForTableColumn:item:", self, aTableColumn, self.isa.objj_msgSend1(self, "itemAtRow:", aRow)));
    var ___r1;
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
}{var the_class = objj_allocateClassPair(CPObject, "_CPOutlineViewTableViewDataSource"),
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
    return ((___r1 = self._outlineView._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "outlineView:objectValueForTableColumn:byItem:", self._outlineView, aTableColumn, self._outlineView._itemsForRows[aRow]));
    var ___r1;
}
,["id","CPTableView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"), function $_CPOutlineViewTableViewDataSource__tableView_setObjectValue_forTableColumn_row_(self, _cmd, aTableView, aValue, aColumn, aRow)
{
    if (!(self._outlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_setObjectValue_forTableColumn_byItem_))
        return;
    ((___r1 = self._outlineView._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "outlineView:setObjectValue:forTableColumn:byItem:", self._outlineView, aValue, aColumn, self._outlineView._itemsForRows[aRow]));
    var ___r1;
}
,["void","CPTableView","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"), function $_CPOutlineViewTableViewDataSource__tableView_writeRowsWithIndexes_toPasteboard_(self, _cmd, aTableColumn, theIndexes, thePasteboard)
{
    if (!(self._outlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_writeItems_toPasteboard_))
        return NO;
    var items = [],
        index = (theIndexes == null ? null : theIndexes.isa.objj_msgSend0(theIndexes, "firstIndex"));
    while (index !== CPNotFound)
    {
        (items == null ? null : items.isa.objj_msgSend1(items, "addObject:", ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtRow:", index))));
        index = (theIndexes == null ? null : theIndexes.isa.objj_msgSend1(theIndexes, "indexGreaterThanIndex:", index));
    }
    return ((___r1 = self._outlineView._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "outlineView:writeItems:toPasteboard:", self._outlineView, items, thePasteboard));
    var ___r1;
}
,["BOOL","CPTableView","CPIndexSet","CPPasteboard"]), new objj_method(sel_getUid("_childIndexForDropOperation:row:offset:"), function $_CPOutlineViewTableViewDataSource___childIndexForDropOperation_row_offset_(self, _cmd, theDropOperation, theRow, theOffset)
{
    if (self._outlineView._shouldRetargetChildIndex)
        return self._outlineView._retargedChildIndex;
    var childIndex = CPNotFound;
    if (theDropOperation === CPTableViewDropAbove)
    {
        var parentItem = ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_parentItemForUpperRow:andLowerRow:atMouseOffset:", theRow - 1, theRow, theOffset)),
            itemInfo = parentItem !== nil ? self._outlineView._itemInfosForItems[(parentItem == null ? null : parentItem.isa.objj_msgSend0(parentItem, "UID"))] : self._outlineView._rootItemInfo,
            children = itemInfo.children;
        childIndex = (children == null ? null : children.isa.objj_msgSend1(children, "indexOfObject:", ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtRow:", theRow))));
        if (childIndex === CPNotFound)
            childIndex = children.length;
    }
    else if (theDropOperation === CPTableViewDropOn)
        childIndex = -1;
    return childIndex;
    var ___r1;
}
,["int","CPTableViewDropOperation","CPInteger","CGPoint"]), new objj_method(sel_getUid("_parentItemForDropOperation:row:offset:"), function $_CPOutlineViewTableViewDataSource___parentItemForDropOperation_row_offset_(self, _cmd, theDropOperation, theRow, theOffset)
{
    if (theDropOperation === CPTableViewDropAbove)
        return ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_parentItemForUpperRow:andLowerRow:atMouseOffset:", theRow - 1, theRow, theOffset));
    return ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtRow:", theRow));
    var ___r1;
}
,["void","CPTableViewDropOperation","CPInteger","CGPoint"]), new objj_method(sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"), function $_CPOutlineViewTableViewDataSource__tableView_validateDrop_proposedRow_proposedDropOperation_(self, _cmd, aTableView, theInfo, theRow, theOperation)
{
    if (!(self._outlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_validateDrop_proposedItem_proposedChildIndex_))
        return CPDragOperationNone;
    self._outlineView._retargetedItem = nil;
    self._outlineView._shouldRetargetItem = NO;
    self._outlineView._retargedChildIndex = nil;
    self._outlineView._shouldRetargetChildIndex = NO;
    var location = ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertPoint:fromView:", (theInfo == null ? null : theInfo.isa.objj_msgSend0(theInfo, "draggingLocation")), nil)),
        parentItem = self.isa.objj_msgSend3(self, "_parentItemForDropOperation:row:offset:", theOperation, theRow, location),
        childIndex = self.isa.objj_msgSend3(self, "_childIndexForDropOperation:row:offset:", theOperation, theRow, location);
    return ((___r1 = self._outlineView._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "outlineView:validateDrop:proposedItem:proposedChildIndex:", self._outlineView, theInfo, parentItem, childIndex));
    var ___r1;
}
,["CPDragOperation","CPTableView","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("tableView:acceptDrop:row:dropOperation:"), function $_CPOutlineViewTableViewDataSource__tableView_acceptDrop_row_dropOperation_(self, _cmd, aTableView, theInfo, theRow, theOperation)
{
    if (!(self._outlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_acceptDrop_item_childIndex_))
        return NO;
    var location = ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertPoint:fromView:", (theInfo == null ? null : theInfo.isa.objj_msgSend0(theInfo, "draggingLocation")), nil)),
        parentItem = self.isa.objj_msgSend3(self, "_parentItemForDropOperation:row:offset:", theOperation, theRow, location),
        childIndex = self.isa.objj_msgSend3(self, "_childIndexForDropOperation:row:offset:", theOperation, theRow, location);
    self._outlineView._retargetedItem = nil;
    self._outlineView._shouldRetargetItem = NO;
    self._outlineView._retargedChildIndex = nil;
    self._outlineView._shouldRetargetChildIndex = NO;
    return ((___r1 = self._outlineView._outlineViewDataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "outlineView:acceptDrop:item:childIndex:", self._outlineView, theInfo, parentItem, childIndex));
    var ___r1;
}
,["BOOL","CPTableView","id","CPInteger","CPTableViewDropOperation"]), new objj_method(sel_getUid("tableView:sortDescriptorsDidChange:"), function $_CPOutlineViewTableViewDataSource__tableView_sortDescriptorsDidChange_(self, _cmd, aTableView, oldSortDescriptors)
{
    if (self._outlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_sortDescriptorsDidChange_)
    {
        ((___r1 = ((___r2 = self._outlineView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "dataSource"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:sortDescriptorsDidChange:", self._outlineView, oldSortDescriptors));
    }
    var ___r1, ___r2;
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
    return !(self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldSelectItem_) || ((___r1 = self._outlineView._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:shouldSelectItem:", self._outlineView, ((___r2 = self._outlineView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "itemAtRow:", theRow))));
    var ___r1, ___r2;
}
,["BOOL","CPTableView","CPInteger"]), new objj_method(sel_getUid("selectionShouldChangeInTableView:"), function $_CPOutlineViewTableViewDelegate__selectionShouldChangeInTableView_(self, _cmd, theTableView)
{
    return !(self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_selectionShouldChangeInOutlineView_) || ((___r1 = self._outlineView._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectionShouldChangeInOutlineView:", self._outlineView));
    var ___r1;
}
,["BOOL","CPTableView"]), new objj_method(sel_getUid("tableView:shouldEditTableColumn:row:"), function $_CPOutlineViewTableViewDelegate__tableView_shouldEditTableColumn_row_(self, _cmd, aTableView, aColumn, aRow)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldEditTableColumn_item_)
        return ((___r1 = self._outlineView._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "outlineView:shouldEditTableColumn:item:", self._outlineView, aColumn, ((___r2 = self._outlineView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "itemAtRow:", aRow))));
    return NO;
    var ___r1, ___r2;
}
,["BOOL","CPTableView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:heightOfRow:"), function $_CPOutlineViewTableViewDelegate__tableView_heightOfRow_(self, _cmd, theTableView, theRow)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_heightOfRowByItem_)
        return ((___r1 = self._outlineView._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:heightOfRowByItem:", self._outlineView, ((___r2 = self._outlineView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "itemAtRow:", theRow))));
    return (theTableView == null ? null : theTableView.isa.objj_msgSend0(theTableView, "rowHeight"));
    var ___r1, ___r2;
}
,["float","CPTableView","CPInteger"]), new objj_method(sel_getUid("tableView:willDisplayView:forTableColumn:row:"), function $_CPOutlineViewTableViewDelegate__tableView_willDisplayView_forTableColumn_row_(self, _cmd, aTableView, aView, aTableColumn, aRowIndex)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_willDisplayView_forTableColumn_item_)
    {
        var item = ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtRow:", aRowIndex));
        ((___r1 = self._outlineView._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "outlineView:willDisplayView:forTableColumn:item:", self._outlineView, aView, aTableColumn, item));
    }
    var ___r1;
}
,["void","CPTableView","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:willRemoveView:forTableColumn:row:"), function $_CPOutlineViewTableViewDelegate__tableView_willRemoveView_forTableColumn_row_(self, _cmd, aTableView, aView, aTableColumn, aRowIndex)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_willRemoveView_forTableColumn_item_)
    {
        var item = ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtRow:", aRowIndex));
        ((___r1 = self._outlineView._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "outlineView:willRemoveView:forTableColumn:item:", self._outlineView, aView, aTableColumn, item));
    }
    var ___r1;
}
,["void","CPTableView","id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:isGroupRow:"), function $_CPOutlineViewTableViewDelegate__tableView_isGroupRow_(self, _cmd, aTableView, aRow)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_isGroupItem_)
        return ((___r1 = self._outlineView._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:isGroupItem:", self._outlineView, ((___r2 = self._outlineView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "itemAtRow:", aRow))));
    return NO;
    var ___r1, ___r2;
}
,["BOOL","CPTableView","CPInteger"]), new objj_method(sel_getUid("tableView:menuForTableColumn:row:"), function $_CPOutlineViewTableViewDelegate__tableView_menuForTableColumn_row_(self, _cmd, aTableView, aTableColumn, aRow)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_menuForTableColumn_item_)
    {
        var item = ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtRow:", aRow));
        return ((___r1 = self._outlineView._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "outlineView:menuForTableColumn:item:", self._outlineView, aTableColumn, item));
    }
    return ((___r1 = self._outlineView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "menu")) || ((___r1 = ((___r2 = self._outlineView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultMenu"));
    var ___r1, ___r2;
}
,["CPMenu","CPTableView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableView:selectionIndexesForProposedSelection:"), function $_CPOutlineViewTableViewDelegate__tableView_selectionIndexesForProposedSelection_(self, _cmd, aTableView, anIndexSet)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_selectionIndexesForProposedSelection_)
        return ((___r1 = self._outlineView._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:selectionIndexesForProposedSelection:", self._outlineView, anIndexSet));
    return anIndexSet;
    var ___r1;
}
,["CPIndexSet","CPTableView","CPIndexSet"]), new objj_method(sel_getUid("tableView:shouldSelectTableColumn:"), function $_CPOutlineViewTableViewDelegate__tableView_shouldSelectTableColumn_(self, _cmd, aTableView, aTableColumn)
{
    if (self._outlineView._implementedOutlineViewDelegateMethods & CPOutlineViewDelegate_outlineView_shouldSelectTableColumn_)
        return ((___r1 = self._outlineView._outlineViewDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "outlineView:shouldSelectTableColumn:", self._outlineView, aTableColumn));
    return YES;
    var ___r1;
}
,["BOOL","CPTableView","CPTableColumn"])]);
}{var the_class = objj_allocateClassPair(CPButton, "CPDisclosureButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_angle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPDisclosureButton__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDisclosureButton").super_class }, "initWithFrame:", aFrame);
    if (self)
        (self == null ? null : self.isa.objj_msgSend1(self, "setBordered:", NO));
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setState:"), function $CPDisclosureButton__setState_(self, _cmd, aState)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDisclosureButton").super_class }, "setState:", aState);
    if (self.isa.objj_msgSend0(self, "state") === CPOnState)
        self._angle = 0.0;
    else
        self._angle = -PI_2;
}
,["void","CPInteger"]), new objj_method(sel_getUid("drawRect:"), function $CPDisclosureButton__drawRect_(self, _cmd, aRect)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
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
    CGContextSetFillColor(context, colorForDisclosureTriangle(self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateSelected), self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateHighlighted)));
    CGContextFillPath(context);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 4.5, 8.0);
    if (self._angle === 0.0)
        CGContextAddLineToPoint(context, 9.0, 0.0);
    CGContextSetStrokeColor(context, CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 1.0, 0.7));
    CGContextStrokePath(context);
    var ___r1;
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
        (self == null ? null : self.isa.objj_msgSend1(self, "setIndentationMarkerFollowsDataView:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDisclosureControlPrototype:", ((___r1 = CPDisclosureButton.isa.objj_msgSend0(CPDisclosureButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 10.0, 10.0)))));
        self._outlineTableColumn = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPOutlineViewOutlineTableColumnKey));
        self._indentationPerLevel = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPOutlineViewIndentationPerLevelKey));
        self._outlineViewDataSource = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPOutlineViewDataSourceKey));
        self._outlineViewDelegate = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPOutlineViewDelegateKey));
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "setDataSource:", ((___r1 = _CPOutlineViewTableViewDataSource.isa.objj_msgSend0(_CPOutlineViewTableViewDataSource, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithOutlineView:", self)));
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "setDelegate:", ((___r1 = _CPOutlineViewTableViewDelegate.isa.objj_msgSend0(_CPOutlineViewTableViewDelegate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithOutlineView:", self)));
        (self == null ? null : self.isa.objj_msgSend0(self, "_updateIsViewBased"));
    }
    return self;
    var ___r1;
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
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._outlineTableColumn, CPOutlineViewOutlineTableColumnKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._indentationPerLevel, CPOutlineViewIndentationPerLevelKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._outlineViewDataSource, CPOutlineViewDataSourceKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._outlineViewDelegate, CPOutlineViewDelegateKey));
}
,["void","CPCoder"])]);
}var colorForDisclosureTriangle = function(isSelected, isHighlighted)
{
    return isSelected ? isHighlighted ? CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 0.9, 1.0) : CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 1.0, 1.0) : isHighlighted ? CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 0.4, 1.0) : CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 0.5, 1.0);
};
