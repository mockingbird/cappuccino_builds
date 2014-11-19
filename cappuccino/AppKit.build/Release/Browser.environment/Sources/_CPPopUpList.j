@STATIC;1.0;i;9;CPPanel.ji;13;CPTableView.ji;8;CPText.ji;24;_CPPopUpListDataSource.jt;34738;objj_executeFile("CPPanel.j", YES);objj_executeFile("CPTableView.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("_CPPopUpListDataSource.j", YES);_CPPopUpListWillPopUpNotification = "_CPPopUpListWillPopUpNotification";
_CPPopUpListWillDismissNotification = "_CPPopUpListWillDismissNotification";
_CPPopUpListDidDismissNotification = "_CPPopUpListDidDismissNotification";
_CPPopUpListItemWasClickedNotification = "_CPPopUpListItemWasClickedNotification";
var ListMinimumItems = 3;
var ListColumnIdentifier = "1";
{var the_class = objj_allocateClassPair(CPObject, "_CPPopUpList"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dataSource"), new objj_ivar("_itemWasClicked"), new objj_ivar("_listWasClicked"), new objj_ivar("_listWidth"), new objj_ivar("_panel"), new objj_ivar("_scrollView"), new objj_ivar("_tableView"), new objj_ivar("_tableColumn")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithDataSource:"), function $_CPPopUpList__initWithDataSource_(self, _cmd, aDataSource)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpList").super_class }, "init");
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setDataSource:", aDataSource));
        self._itemWasClicked = NO;
        self._listWasClicked = NO;
        self._listWidth = 0;
        self._tableView = (self == null ? null : self.isa.objj_msgSend0(self, "makeTableView"));
        var frame = CGRectMake(0, 0, 200, 200);
        self._tableColumn = ((___r1 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIdentifier:", ListColumnIdentifier));
        ((___r1 = self._tableColumn), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWidth:", CGRectGetWidth(frame) - CPScroller.isa.objj_msgSend0(CPScroller, "scrollerWidth")));
        ((___r1 = self._tableColumn), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setResizingMask:", CPTableColumnAutoresizingMask));
        ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTableColumn:", self._tableColumn));
        self._scrollView = (self == null ? null : self.isa.objj_msgSend1(self, "makeScrollViewWithFrame:", CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))));
        ((___r1 = self._scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", self._tableView));
        ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHeaderView:", nil));
        self._panel = (self == null ? null : self.isa.objj_msgSend1(self, "makeListPanelWithFrame:", frame));
        ((___r1 = ((___r2 = self._panel), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._scrollView));
        ((___r1 = self._panel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setInitialFirstResponder:", self._tableView));
        if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfItemsInList:", self)) > 0)
            ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "selectRowIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", 0), NO));
        else
            ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", NO));
        ((___r1 = self._scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToBeginningOfDocument:", nil));
    }
    return self;
    var ___r1, ___r2;
}
,["id","_CPPopUpListDataSource"]), new objj_method(sel_getUid("makeListPanelWithFrame:"), function $_CPPopUpList__makeListPanelWithFrame_(self, _cmd, aFrame)
{
    var panel = ((___r1 = (_CPPopUpPanel == null ? null : _CPPopUpPanel.isa.objj_msgSend0(_CPPopUpPanel, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", aFrame, CPBorderlessWindowMask));
    (panel == null ? null : panel.isa.objj_msgSend1(panel, "setTitle:", ""));
    (panel == null ? null : panel.isa.objj_msgSend1(panel, "setFloatingPanel:", YES));
    (panel == null ? null : panel.isa.objj_msgSend1(panel, "setBecomesKeyOnlyIfNeeded:", YES));
    (panel == null ? null : panel.isa.objj_msgSend1(panel, "setLevel:", CPPopUpMenuWindowLevel));
    (panel == null ? null : panel.isa.objj_msgSend1(panel, "setHasShadow:", YES));
    (panel == null ? null : panel.isa.objj_msgSend1(panel, "setShadowStyle:", CPMenuWindowShadowStyle));
    (panel == null ? null : panel.isa.objj_msgSend1(panel, "setDelegate:", self));
    return panel;
    var ___r1;
}
,["CPPanel","CGRect"]), new objj_method(sel_getUid("makeTableView"), function $_CPPopUpList__makeTableView(self, _cmd)
{
    self.isa.objj_msgSend0(self, "removeTableViewObservers");
    var table = ((___r1 = (_CPPopUpTableView == null ? null : _CPPopUpTableView.isa.objj_msgSend0(_CPPopUpTableView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (table == null ? null : table.isa.objj_msgSend1(table, "setDelegate:", self));
    (table == null ? null : table.isa.objj_msgSend1(table, "setDataSource:", self));
    (table == null ? null : table.isa.objj_msgSend1(table, "setColumnAutoresizingStyle:", CPTableViewLastColumnOnlyAutoresizingStyle));
    (table == null ? null : table.isa.objj_msgSend1(table, "setUsesAlternatingRowBackgroundColors:", NO));
    (table == null ? null : table.isa.objj_msgSend1(table, "setAllowsMultipleSelection:", NO));
    (table == null ? null : table.isa.objj_msgSend1(table, "setIntercellSpacing:", CGSizeMake(3, 2)));
    (table == null ? null : table.isa.objj_msgSend1(table, "setTarget:", self));
    (table == null ? null : table.isa.objj_msgSend1(table, "setDoubleAction:", sel_getUid("tableViewClickAction:")));
    (table == null ? null : table.isa.objj_msgSend1(table, "setAction:", sel_getUid("tableViewClickAction:")));
    (table == null ? null : table.isa.objj_msgSend1(table, "setRowHeight:", self.isa.objj_msgSend1(self, "rowHeightForTableView:", table)));
    return table;
    var ___r1;
}
,["_CPPopUpTableView"]), new objj_method(sel_getUid("removeTableViewObservers"), function $_CPPopUpList__removeTableViewObservers(self, _cmd)
{
    if (self._tableView)
    {
        var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPTableViewSelectionIsChangingNotification, self._tableView));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPTableViewSelectionDidChangeNotification, self._tableView));
    }
}
,["void"]), new objj_method(sel_getUid("makeScrollViewWithFrame:"), function $_CPPopUpList__makeScrollViewWithFrame_(self, _cmd, aFrame)
{
    var scroll = ((___r1 = (CPScrollView == null ? null : CPScrollView.isa.objj_msgSend0(CPScrollView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", aFrame));
    (scroll == null ? null : scroll.isa.objj_msgSend1(scroll, "setBorderType:", CPLineBorder));
    (scroll == null ? null : scroll.isa.objj_msgSend1(scroll, "setAutohidesScrollers:", NO));
    (scroll == null ? null : scroll.isa.objj_msgSend1(scroll, "setHasVerticalScroller:", YES));
    (scroll == null ? null : scroll.isa.objj_msgSend1(scroll, "setHasHorizontalScroller:", NO));
    (scroll == null ? null : scroll.isa.objj_msgSend1(scroll, "setLineScroll:", ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowHeight"))));
    (scroll == null ? null : scroll.isa.objj_msgSend1(scroll, "setVerticalPageScroll:", 0.0));
    return scroll;
    var ___r1;
}
,["CPScrollView","CGRect"]), new objj_method(sel_getUid("popUpRelativeToRect:view:offset:"), function $_CPPopUpList__popUpRelativeToRect_view_offset_(self, _cmd, aRect, aView, offset)
{
    if (((___r1 = self._panel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible")))
        return;
    var rowRect = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "rectOfRow:", self.isa.objj_msgSend1(self, "numberOfRowsInTableView:", self._tableView) - 1)),
        frame = CGRectMake(0, 0, MAX(self._listWidth, CGRectGetWidth(aRect)), CGRectGetMaxY(rowRect));
    frame = self.isa.objj_msgSend(self, "constrain:relativeToRect:view:offset:", frame, aRect, aView, offset);
    ((___r1 = self._panel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", frame));
    ((___r1 = self._scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMakeCopy(frame.size)));
    ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", ((___r2 = self._dataSource), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "numberOfItemsInList:", self)) > 0));
    self.isa.objj_msgSend1(self, "scrollItemAtIndexToTop:", ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow")));
    self.isa.objj_msgSend0(self, "listWillPopUp");
    ((___r1 = self._panel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderFront:", nil));
    var ___r1, ___r2;
}
,["void","CGRect","CPView","int"]), new objj_method(sel_getUid("listWidth"), function $_CPPopUpList__listWidth(self, _cmd)
{
    return self._listWidth;
}
,["int"]), new objj_method(sel_getUid("setListWidth:"), function $_CPPopUpList__setListWidth_(self, _cmd, width)
{
    self._listWidth = width;
}
,["void","int"]), new objj_method(sel_getUid("setFont:"), function $_CPPopUpList__setFont_(self, _cmd, aFont)
{
    var oldDataView = ((___r1 = self._tableColumn), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "dataView")),
        newDataView = CPTextField.isa.objj_msgSend0(CPTextField, "new");
    (newDataView == null ? null : newDataView.isa.objj_msgSend1(newDataView, "setFont:", aFont));
    (newDataView == null ? null : newDataView.isa.objj_msgSend1(newDataView, "setAlignment:", (oldDataView == null ? null : oldDataView.isa.objj_msgSend0(oldDataView, "alignment"))));
    ((___r1 = self._tableColumn), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDataView:", newDataView));
    ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    var ___r1;
}
,["void","CPFont"]), new objj_method(sel_getUid("setAlignment:"), function $_CPPopUpList__setAlignment_(self, _cmd, alignment)
{
    var oldDataView = ((___r1 = self._tableColumn), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "dataView")),
        newDataView = CPTextField.isa.objj_msgSend0(CPTextField, "new");
    (newDataView == null ? null : newDataView.isa.objj_msgSend1(newDataView, "setAlignment:", alignment));
    (newDataView == null ? null : newDataView.isa.objj_msgSend1(newDataView, "setFont:", (oldDataView == null ? null : oldDataView.isa.objj_msgSend0(oldDataView, "font"))));
    ((___r1 = self._tableColumn), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDataView:", newDataView));
    ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    var ___r1;
}
,["void","CPTextAlignment"]), new objj_method(sel_getUid("isVisible"), function $_CPPopUpList__isVisible(self, _cmd)
{
    return ((___r1 = self._panel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("rowHeightForTableView:"), function $_CPPopUpList__rowHeightForTableView_(self, _cmd, aTableView)
{
    return (aTableView == null ? null : aTableView.isa.objj_msgSend0(aTableView, "rowHeight"));
}
,["int","CPTableView"]), new objj_method(sel_getUid("tableView"), function $_CPPopUpList__tableView(self, _cmd)
{
    return self._tableView;
}
,["CPTableView"]), new objj_method(sel_getUid("tableColumn"), function $_CPPopUpList__tableColumn(self, _cmd)
{
    return self._tableColumn;
}
,["CPTableColumn"]), new objj_method(sel_getUid("scrollView"), function $_CPPopUpList__scrollView(self, _cmd)
{
    return self._scrollView;
}
,["CPScrollView"]), new objj_method(sel_getUid("panel"), function $_CPPopUpList__panel(self, _cmd)
{
    return self._panel;
}
,["CPPanel"]), new objj_method(sel_getUid("setDataSource:"), function $_CPPopUpList__setDataSource_(self, _cmd, aDataSource)
{
    if (self._dataSource === aDataSource)
        return;
    if (!_CPPopUpListDataSource.isa.objj_msgSend1(_CPPopUpListDataSource, "protocolIsImplementedByObject:", aDataSource))
    {
        CPLog.warn("Illegal %s data source (%s). Must implement the methods in _CPPopUpListDataSource.", self.isa.objj_msgSend0(self, "className"), (aDataSource == null ? null : aDataSource.isa.objj_msgSend0(aDataSource, "description")));
    }
    else
        self._dataSource = aDataSource;
}
,["void","_CPPopUpListDataSource"]), new objj_method(sel_getUid("dataSource"), function $_CPPopUpList__dataSource(self, _cmd)
{
    return self._dataSource;
}
,["_CPPopUpListDataSource"]), new objj_method(sel_getUid("selectNextItem"), function $_CPPopUpList__selectNextItem(self, _cmd)
{
    if (!((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")))
        return NO;
    var row = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow"));
    if (row < ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfItemsInList:", self)) - 1)
        return self.isa.objj_msgSend1(self, "selectRow:", ++row);
    else
        return NO;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("selectPreviousItem"), function $_CPPopUpList__selectPreviousItem(self, _cmd)
{
    if (!((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")))
        return NO;
    var row = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow"));
    if (row > 0)
        return self.isa.objj_msgSend1(self, "selectRow:", --row);
    else
        return NO;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("selectedObjectValue"), function $_CPPopUpList__selectedObjectValue(self, _cmd)
{
    var row = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow"));
    return row >= 0 ? ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "list:objectValueForItemAtIndex:", self, row)) : nil;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("selectedStringValue"), function $_CPPopUpList__selectedStringValue(self, _cmd)
{
    var value = self.isa.objj_msgSend0(self, "selectedObjectValue");
    return value !== nil ? ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "list:stringValueForObjectValue:", self, value)) : nil;
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("selectedRow"), function $_CPPopUpList__selectedRow(self, _cmd)
{
    return ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow"));
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("selectRow:"), function $_CPPopUpList__selectRow_(self, _cmd, row)
{
    if (row === ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow")))
        return NO;
    var validRow = row >= 0 && row < self.isa.objj_msgSend1(self, "numberOfRowsInTableView:", self._tableView),
        indexes = validRow ? CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", row) : CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "selectRowIndexes:byExtendingSelection:", indexes, NO));
    if (validRow)
    {
        ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollRowToVisible:", row));
        return YES;
    }
    else
        return NO;
    var ___r1;
}
,["BOOL","CPInteger"]), new objj_method(sel_getUid("scrollPageDown"), function $_CPPopUpList__scrollPageDown(self, _cmd)
{
    ((___r1 = self._scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollPageDown:", nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("scrollPageUp"), function $_CPPopUpList__scrollPageUp(self, _cmd)
{
    ((___r1 = self._scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollPageUp:", nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("scrollToTop"), function $_CPPopUpList__scrollToTop(self, _cmd)
{
    ((___r1 = self._scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToBeginningOfDocument:", nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("scrollToBottom"), function $_CPPopUpList__scrollToBottom(self, _cmd)
{
    ((___r1 = self._scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToEndOfDocument:", nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("scrollItemAtIndexToTop:"), function $_CPPopUpList__scrollItemAtIndexToTop_(self, _cmd, row)
{
    var rect = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "rectOfRow:", row));
    ((___r1 = ((___r2 = self._tableView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "superview"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", rect.origin));
    var ___r1, ___r2;
}
,["void","int"]), new objj_method(sel_getUid("close"), function $_CPPopUpList__close(self, _cmd)
{
    if (!((___r1 = self._panel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible")))
        return;
    if (self.isa.objj_msgSend0(self, "listWasClicked"))
    {
        self.isa.objj_msgSend1(self, "setListWasClicked:", NO);
        if (self.isa.objj_msgSend0(self, "itemWasClicked"))
        {
            self.isa.objj_msgSend1(self, "setItemWasClicked:", NO);
            CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.1, self, sel_getUid("closeListAfterItemClick"), nil, NO);
            return;
        }
    }
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", _CPPopUpListWillDismissNotification, self));
    ((___r1 = self._panel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "close"));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", _CPPopUpListDidDismissNotification, self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("closeListAfterItemClick"), function $_CPPopUpList__closeListAfterItemClick(self, _cmd)
{
    self.isa.objj_msgSend0(self, "close");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", _CPPopUpListItemWasClickedNotification, self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $_CPPopUpList__performKeyEquivalent_(self, _cmd, anEvent)
{
    var key = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers"));
    switch(key) {
    case CPDownArrowFunctionKey:
        if (self.isa.objj_msgSend0(self, "isVisible"))
        {
            self.isa.objj_msgSend0(self, "selectNextItem");
            return YES;
        }
        break;
    case CPUpArrowFunctionKey:
        if (self.isa.objj_msgSend0(self, "isVisible"))
        {
            self.isa.objj_msgSend0(self, "selectPreviousItem");
            return YES;
        }
        break;
    case CPEscapeFunctionKey:
        if (self.isa.objj_msgSend0(self, "isVisible"))
        {
            self.isa.objj_msgSend0(self, "close");
            return YES;
        }
        break;
    case CPPageUpFunctionKey:
        if (self.isa.objj_msgSend0(self, "isVisible"))
        {
            self.isa.objj_msgSend0(self, "scrollPageUp");
            return YES;
        }
        break;
    case CPPageDownFunctionKey:
        if (self.isa.objj_msgSend0(self, "isVisible"))
        {
            self.isa.objj_msgSend0(self, "scrollPageDown");
            return YES;
        }
        break;
    case CPHomeFunctionKey:
        if (self.isa.objj_msgSend0(self, "isVisible"))
        {
            self.isa.objj_msgSend0(self, "scrollToTop");
            return YES;
        }
        break;
    case CPEndFunctionKey:
        if (self.isa.objj_msgSend0(self, "isVisible"))
        {
            self.isa.objj_msgSend0(self, "scrollToBottom");
            return YES;
        }
        break;
    case CPCarriageReturnCharacter:
        if (self.isa.objj_msgSend0(self, "isVisible"))
        {
            self.isa.objj_msgSend0(self, "closeListAfterItemClick");
            return YES;
        }
        break;
    }
    return NO;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("itemWasClicked"), function $_CPPopUpList__itemWasClicked(self, _cmd)
{
    return self._itemWasClicked && ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfItemsInList:", self)) > 0;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("setItemWasClicked:"), function $_CPPopUpList__setItemWasClicked_(self, _cmd, flag)
{
    self._itemWasClicked = ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfItemsInList:", self)) > 0 && flag;
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("listWasClicked"), function $_CPPopUpList__listWasClicked(self, _cmd)
{
    return self._listWasClicked && ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfItemsInList:", self)) > 0;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("setListWasClicked:"), function $_CPPopUpList__setListWasClicked_(self, _cmd, flag)
{
    self._listWasClicked = ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfItemsInList:", self)) > 0 && flag;
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("controllingViewShouldResign"), function $_CPPopUpList__controllingViewShouldResign(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "listWasClicked"))
    {
        if (self.isa.objj_msgSend0(self, "listWasClicked") && !self.isa.objj_msgSend0(self, "itemWasClicked"))
            self.isa.objj_msgSend1(self, "setListWasClicked:", NO);
        return NO;
    }
    else
        return YES;
}
,["BOOL"]), new objj_method(sel_getUid("listWillPopUp"), function $_CPPopUpList__listWillPopUp(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", _CPPopUpListWillPopUpNotification, self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("constrain:relativeToRect:view:offset:"), function $_CPPopUpList__constrain_relativeToRect_view_offset_(self, _cmd, aFrame, aRect, aView, offset)
{
    var baseOrigin = (aView == null ? null : aView.isa.objj_msgSend1(aView, "convertPointToBase:", aRect.origin)),
        windowOrigin = ((___r1 = (aView == null ? null : aView.isa.objj_msgSend0(aView, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertBaseToPlatformWindow:", baseOrigin)),
        rowHeight = self.isa.objj_msgSend1(self, "rowHeightForTableView:", self._tableView) + ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "intercellSpacing")).height,
        numberOfRows = MIN(self.isa.objj_msgSend1(self, "numberOfRowsInTableView:", self._tableView), ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfVisibleItemsInList:", self))),
        frame = CGRectMake(windowOrigin.x, windowOrigin.y + CGRectGetHeight(aRect) + offset, MAX(self._listWidth, CGRectGetWidth(aFrame)), rowHeight * numberOfRows + 2),
        bottomFrame = CGRectMakeCopy(frame),
        bottom = CGRectGetMaxY(bottomFrame),
        viewRect = ((___r1 = CPPlatformWindow.isa.objj_msgSend0(CPPlatformWindow, "primaryPlatformWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame")),
        visibleBottom = CGRectGetMaxY(viewRect),
        bottomVisibleRows = numberOfRows;
    while (bottom > visibleBottom && bottomVisibleRows >= ListMinimumItems)
    {
        bottom -= rowHeight;
        bottomFrame.size.height -= rowHeight;
        --bottomVisibleRows;
    }
    if (bottom >= visibleBottom || bottomVisibleRows < ListMinimumItems)
    {
        var topFrame = CGRectMakeCopy(frame);
        topFrame.origin.y = windowOrigin.y - offset - CGRectGetHeight(topFrame);
        var visibleTop = CGRectGetMinY(viewRect),
            topVisibleRows = numberOfRows;
        while (topFrame.origin.y <= visibleTop && topVisibleRows >= ListMinimumItems)
        {
            topFrame.origin.y += rowHeight;
            topFrame.size.height -= rowHeight;
            --topVisibleRows;
        }
        if (topFrame.origin.y > visibleTop && topVisibleRows >= ListMinimumItems || topVisibleRows > bottomVisibleRows)
            frame = topFrame;
        else
            frame = bottomFrame;
    }
    else
        frame = bottomFrame;
    return frame;
    var ___r1;
}
,["CGRect","CGRect","CGRect","CPView","int"]), new objj_method(sel_getUid("tableViewClickAction:"), function $_CPPopUpList__tableViewClickAction_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "close");
}
,["void","id"])]);
}var _CPPopUpListDataSourceKey = "_CPPopUpListDataSourceKey",
    _CPPopUpListListWidthKey = "_CPPopUpListListWidthKey",
    _CPPopUpListListPanelKey = "_CPPopUpListListPanelKey",
    _CPPopUpListScrollViewKey = "_CPPopUpListScrollViewKey",
    _CPPopUpListTableViewKey = "_CPPopUpListTableViewKey";
{
var the_class = objj_getClass("_CPPopUpList")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPPopUpList\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPPopUpList__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpList").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._listWasClicked = NO;
        self._itemWasClicked = NO;
        self._dataSource = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPPopUpListDataSourceKey));
        self._listWidth = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", _CPPopUpListListWidthKey));
        self._panel = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPPopUpListListPanelKey));
        self._scrollView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPPopUpListScrollViewKey));
        self._tableView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPPopUpListTableViewKey));
        self._tableColumn = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "tableColumnWithIdentifier:", ListColumnIdentifier));
        ((___r1 = self._scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", self._tableView));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPPopUpList__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpList").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._dataSource, _CPPopUpListDataSourceKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._listWidth, _CPPopUpListListWidthKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._panel, _CPPopUpListListPanelKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._scrollView, _CPPopUpListScrollViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._tableView, _CPPopUpListTableViewKey));
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("_CPPopUpList")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPPopUpList\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("numberOfRowsInTableView:"), function $_CPPopUpList__numberOfRowsInTableView_(self, _cmd, aTableView)
{
    return MAX(((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfItemsInList:", self)), 1);
    var ___r1;
}
,["int","id"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $_CPPopUpList__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aColumn, aRow)
{
    return ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "list:displayValueForObjectValue:", self, ((___r2 = self._dataSource), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "list:objectValueForItemAtIndex:", self, aRow))));
    var ___r1, ___r2;
}
,["id","id","CPTableColumn","CPInteger"])]);
}{var the_class = objj_allocateClassPair(CPTableView, "_CPPopUpTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_acceptFirstResponder")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPPopUpTableView__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpTableView").super_class }, "initWithFrame:", aFrame))
    {
        self._acceptFirstResponder = NO;
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("trackMouse:"), function $_CPPopUpTableView__trackMouse_(self, _cmd, anEvent)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setItemWasClicked:", YES));
    self._acceptFirstResponder = YES;
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpTableView").super_class }, "trackMouse:", anEvent);
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $_CPPopUpTableView__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{
    self._acceptFirstResponder = NO;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpTableView").super_class }, "stopTracking:at:mouseIsUp:", lastPoint, aPoint, mouseIsUp);
}
,["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $_CPPopUpTableView__acceptsFirstResponder(self, _cmd)
{
    return self._acceptFirstResponder;
}
,["BOOL"]), new objj_method(sel_getUid("listColumn"), function $_CPPopUpTableView__listColumn(self, _cmd)
{
    return self._tableColumns[0];
}
,["CPTableColumn"])]);
}{var the_class = objj_allocateClassPair(CPPanel, "_CPPopUpPanel"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $_CPPopUpPanel__initWithContentRect_styleMask_(self, _cmd, aContentRect, aStyleMask)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpPanel").super_class }, "initWithContentRect:styleMask:", aContentRect, aStyleMask))
        self._constrainsToUsableScreen = NO;
    (self == null ? null : self.isa.objj_msgSend0(self, "_trapNextMouseDown"));
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("worksWhenModal"), function $_CPPopUpPanel__worksWhenModal(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("sendEvent:"), function $_CPPopUpPanel__sendEvent_(self, _cmd, anEvent)
{
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type"));
    if (type === CPLeftMouseDown || type === CPRightMouseDown)
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setListWasClicked:", YES));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpPanel").super_class }, "sendEvent:", anEvent);
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("orderFront:"), function $_CPPopUpPanel__orderFront_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "_trapNextMouseDown");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpPanel").super_class }, "orderFront:", sender);
}
,["void","id"]), new objj_method(sel_getUid("_mouseWasClicked:"), function $_CPPopUpPanel___mouseWasClicked_(self, _cmd, anEvent)
{
    var mouseWindow = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window")),
        rect = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "delegate")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "dataSource"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")),
        point = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "delegate")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "dataSource"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil));
    if (mouseWindow != self && !CGRectContainsPoint(rect, point))
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "close"));
    else
        self.isa.objj_msgSend0(self, "_trapNextMouseDown");
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_trapNextMouseDown"), function $_CPPopUpPanel___trapNextMouseDown(self, _cmd)
{
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("_mouseWasClicked:"), CPLeftMouseDownMask, nil, CPDefaultRunLoopMode, NO));
}
,["void"])]);
}