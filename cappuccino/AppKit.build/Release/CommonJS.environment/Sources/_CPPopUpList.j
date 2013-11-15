@STATIC;1.0;i;9;CPPanel.ji;13;CPTableView.ji;8;CPText.ji;24;_CPPopUpListDataSource.jt;26843;objj_executeFile("CPPanel.j", YES);objj_executeFile("CPTableView.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("_CPPopUpListDataSource.j", YES);_CPPopUpListWillPopUpNotification = "_CPPopUpListWillPopUpNotification";
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
        objj_msgSend(self, "setDataSource:", aDataSource);
        self._itemWasClicked = NO;
        self._listWasClicked = NO;
        self._listWidth = 0;
        self._tableView = objj_msgSend(self, "makeTableView");
        var frame = CGRectMake(0, 0, 200, 200);
        self._tableColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", ListColumnIdentifier);
        objj_msgSend(self._tableColumn, "setWidth:", CGRectGetWidth(frame) - objj_msgSend(CPScroller, "scrollerWidth"));
        objj_msgSend(self._tableColumn, "setResizingMask:", CPTableColumnAutoresizingMask);
        objj_msgSend(self._tableView, "addTableColumn:", self._tableColumn);
        self._scrollView = objj_msgSend(self, "makeScrollViewWithFrame:", CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)));
        objj_msgSend(self._scrollView, "setDocumentView:", self._tableView);
        objj_msgSend(self._tableView, "setHeaderView:", nil);
        self._panel = objj_msgSend(self, "makeListPanelWithFrame:", frame);
        objj_msgSend(objj_msgSend(self._panel, "contentView"), "addSubview:", self._scrollView);
        objj_msgSend(self._panel, "setInitialFirstResponder:", self._tableView);
        if (objj_msgSend(self._dataSource, "numberOfItemsInList:", self) > 0)
            objj_msgSend(self._tableView, "selectRowIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", 0), NO);
        else
            objj_msgSend(self._tableView, "setEnabled:", NO);
        objj_msgSend(self._scrollView, "scrollToBeginningOfDocument:", nil);
    }
    return self;
}
,["id","_CPPopUpListDataSource"]), new objj_method(sel_getUid("makeListPanelWithFrame:"), function $_CPPopUpList__makeListPanelWithFrame_(self, _cmd, aFrame)
{
    var panel = objj_msgSend(objj_msgSend(_CPPopUpPanel, "alloc"), "initWithContentRect:styleMask:", aFrame, CPBorderlessWindowMask);
    objj_msgSend(panel, "setTitle:", "");
    objj_msgSend(panel, "setFloatingPanel:", YES);
    objj_msgSend(panel, "setBecomesKeyOnlyIfNeeded:", YES);
    objj_msgSend(panel, "setLevel:", CPPopUpMenuWindowLevel);
    objj_msgSend(panel, "setHasShadow:", YES);
    objj_msgSend(panel, "setShadowStyle:", CPMenuWindowShadowStyle);
    objj_msgSend(panel, "setDelegate:", self);
    return panel;
}
,["CPPanel","CGRect"]), new objj_method(sel_getUid("makeTableView"), function $_CPPopUpList__makeTableView(self, _cmd)
{
    objj_msgSend(self, "removeTableViewObservers");
    var table = objj_msgSend(objj_msgSend(_CPPopUpTableView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(table, "setDelegate:", self);
    objj_msgSend(table, "setDataSource:", self);
    objj_msgSend(table, "setColumnAutoresizingStyle:", CPTableViewLastColumnOnlyAutoresizingStyle);
    objj_msgSend(table, "setUsesAlternatingRowBackgroundColors:", NO);
    objj_msgSend(table, "setAllowsMultipleSelection:", NO);
    objj_msgSend(table, "setIntercellSpacing:", CGSizeMake(3, 2));
    objj_msgSend(table, "setTarget:", self);
    objj_msgSend(table, "setDoubleAction:", sel_getUid("tableViewClickAction:"));
    objj_msgSend(table, "setAction:", sel_getUid("tableViewClickAction:"));
    objj_msgSend(table, "setRowHeight:", objj_msgSend(self, "rowHeightForTableView:", table));
    return table;
}
,["_CPPopUpTableView"]), new objj_method(sel_getUid("removeTableViewObservers"), function $_CPPopUpList__removeTableViewObservers(self, _cmd)
{
    if (self._tableView)
    {
        var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPTableViewSelectionIsChangingNotification, self._tableView);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPTableViewSelectionDidChangeNotification, self._tableView);
    }
}
,["void"]), new objj_method(sel_getUid("makeScrollViewWithFrame:"), function $_CPPopUpList__makeScrollViewWithFrame_(self, _cmd, aFrame)
{
    var scroll = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", aFrame);
    objj_msgSend(scroll, "setBorderType:", CPLineBorder);
    objj_msgSend(scroll, "setAutohidesScrollers:", NO);
    objj_msgSend(scroll, "setHasVerticalScroller:", YES);
    objj_msgSend(scroll, "setHasHorizontalScroller:", NO);
    objj_msgSend(scroll, "setLineScroll:", objj_msgSend(self._tableView, "rowHeight"));
    objj_msgSend(scroll, "setVerticalPageScroll:", 0.0);
    return scroll;
}
,["CPScrollView","CGRect"]), new objj_method(sel_getUid("popUpRelativeToRect:view:offset:"), function $_CPPopUpList__popUpRelativeToRect_view_offset_(self, _cmd, aRect, aView, offset)
{
    if (objj_msgSend(self._panel, "isVisible"))
        return;
    var rowRect = objj_msgSend(self._tableView, "rectOfRow:", objj_msgSend(self, "numberOfRowsInTableView:", self._tableView) - 1),
        frame = CGRectMake(0, 0, MAX(self._listWidth, CGRectGetWidth(aRect)), CGRectGetMaxY(rowRect));
    frame = objj_msgSend(self, "constrain:relativeToRect:view:offset:", frame, aRect, aView, offset);
    objj_msgSend(self._panel, "setFrame:", frame);
    objj_msgSend(self._scrollView, "setFrameSize:", CGSizeMakeCopy(frame.size));
    objj_msgSend(self._tableView, "setEnabled:", objj_msgSend(self._dataSource, "numberOfItemsInList:", self) > 0);
    objj_msgSend(self, "scrollItemAtIndexToTop:", objj_msgSend(self._tableView, "selectedRow"));
    objj_msgSend(self, "listWillPopUp");
    objj_msgSend(self._panel, "orderFront:", nil);
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
    var oldDataView = objj_msgSend(self._tableColumn, "dataView"),
        newDataView = objj_msgSend(CPTextField, "new");
    objj_msgSend(newDataView, "setFont:", aFont);
    objj_msgSend(newDataView, "setAlignment:", objj_msgSend(oldDataView, "alignment"));
    objj_msgSend(self._tableColumn, "setDataView:", newDataView);
    objj_msgSend(self._tableView, "reloadData");
}
,["void","CPFont"]), new objj_method(sel_getUid("setAlignment:"), function $_CPPopUpList__setAlignment_(self, _cmd, alignment)
{
    var oldDataView = objj_msgSend(self._tableColumn, "dataView"),
        newDataView = objj_msgSend(CPTextField, "new");
    objj_msgSend(newDataView, "setAlignment:", alignment);
    objj_msgSend(newDataView, "setFont:", objj_msgSend(oldDataView, "font"));
    objj_msgSend(self._tableColumn, "setDataView:", newDataView);
    objj_msgSend(self._tableView, "reloadData");
}
,["void","CPTextAlignment"]), new objj_method(sel_getUid("isVisible"), function $_CPPopUpList__isVisible(self, _cmd)
{
    return objj_msgSend(self._panel, "isVisible");
}
,["BOOL"]), new objj_method(sel_getUid("rowHeightForTableView:"), function $_CPPopUpList__rowHeightForTableView_(self, _cmd, aTableView)
{
    return objj_msgSend(aTableView, "rowHeight");
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
    if (!objj_msgSend(_CPPopUpListDataSource, "protocolIsImplementedByObject:", aDataSource))
    {
        CPLog.warn("Illegal %s data source (%s). Must implement the methods in _CPPopUpListDataSource.", objj_msgSend(self, "className"), objj_msgSend(aDataSource, "description"));
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
    if (!objj_msgSend(self._tableView, "isEnabled"))
        return NO;
    var row = objj_msgSend(self._tableView, "selectedRow");
    if (row < objj_msgSend(self._dataSource, "numberOfItemsInList:", self) - 1)
        return objj_msgSend(self, "selectRow:", ++row);
    else
        return NO;
}
,["BOOL"]), new objj_method(sel_getUid("selectPreviousItem"), function $_CPPopUpList__selectPreviousItem(self, _cmd)
{
    if (!objj_msgSend(self._tableView, "isEnabled"))
        return NO;
    var row = objj_msgSend(self._tableView, "selectedRow");
    if (row > 0)
        return objj_msgSend(self, "selectRow:", --row);
    else
        return NO;
}
,["BOOL"]), new objj_method(sel_getUid("selectedObjectValue"), function $_CPPopUpList__selectedObjectValue(self, _cmd)
{
    var row = objj_msgSend(self._tableView, "selectedRow");
    return row >= 0 ? objj_msgSend(self._dataSource, "list:objectValueForItemAtIndex:", self, row) : nil;
}
,["id"]), new objj_method(sel_getUid("selectedStringValue"), function $_CPPopUpList__selectedStringValue(self, _cmd)
{
    var value = objj_msgSend(self, "selectedObjectValue");
    return value !== nil ? objj_msgSend(self._dataSource, "list:stringValueForObjectValue:", self, value) : nil;
}
,["CPString"]), new objj_method(sel_getUid("selectedRow"), function $_CPPopUpList__selectedRow(self, _cmd)
{
    return objj_msgSend(self._tableView, "selectedRow");
}
,["int"]), new objj_method(sel_getUid("selectRow:"), function $_CPPopUpList__selectRow_(self, _cmd, row)
{
    if (row === objj_msgSend(self._tableView, "selectedRow"))
        return NO;
    var validRow = row >= 0 && row < objj_msgSend(self, "numberOfRowsInTableView:", self._tableView),
        indexes = validRow ? objj_msgSend(CPIndexSet, "indexSetWithIndex:", row) : objj_msgSend(CPIndexSet, "indexSet");
    objj_msgSend(self._tableView, "selectRowIndexes:byExtendingSelection:", indexes, NO);
    if (validRow)
    {
        objj_msgSend(self._tableView, "scrollRowToVisible:", row);
        return YES;
    }
    else
        return NO;
}
,["BOOL","int"]), new objj_method(sel_getUid("scrollPageDown"), function $_CPPopUpList__scrollPageDown(self, _cmd)
{
    objj_msgSend(self._scrollView, "scrollPageDown:", nil);
}
,["void"]), new objj_method(sel_getUid("scrollPageUp"), function $_CPPopUpList__scrollPageUp(self, _cmd)
{
    objj_msgSend(self._scrollView, "scrollPageUp:", nil);
}
,["void"]), new objj_method(sel_getUid("scrollToTop"), function $_CPPopUpList__scrollToTop(self, _cmd)
{
    objj_msgSend(self._scrollView, "scrollToBeginningOfDocument:", nil);
}
,["void"]), new objj_method(sel_getUid("scrollToBottom"), function $_CPPopUpList__scrollToBottom(self, _cmd)
{
    objj_msgSend(self._scrollView, "scrollToEndOfDocument:", nil);
}
,["void"]), new objj_method(sel_getUid("scrollItemAtIndexToTop:"), function $_CPPopUpList__scrollItemAtIndexToTop_(self, _cmd, row)
{
    var rect = objj_msgSend(self._tableView, "rectOfRow:", row);
    objj_msgSend(objj_msgSend(self._tableView, "superview"), "scrollToPoint:", rect.origin);
}
,["void","int"]), new objj_method(sel_getUid("close"), function $_CPPopUpList__close(self, _cmd)
{
    if (!objj_msgSend(self._panel, "isVisible"))
        return;
    if (objj_msgSend(self, "listWasClicked"))
    {
        objj_msgSend(self, "setListWasClicked:", NO);
        if (objj_msgSend(self, "itemWasClicked"))
        {
            objj_msgSend(self, "setItemWasClicked:", NO);
            objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.1, self, sel_getUid("closeListAfterItemClick"), nil, NO);
            return;
        }
    }
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", _CPPopUpListWillDismissNotification, self);
    objj_msgSend(self._panel, "close");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", _CPPopUpListDidDismissNotification, self);
}
,["void"]), new objj_method(sel_getUid("closeListAfterItemClick"), function $_CPPopUpList__closeListAfterItemClick(self, _cmd)
{
    objj_msgSend(self, "close");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", _CPPopUpListItemWasClickedNotification, self);
}
,["void"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $_CPPopUpList__performKeyEquivalent_(self, _cmd, anEvent)
{
    var key = objj_msgSend(anEvent, "charactersIgnoringModifiers");
    switch(key) {
    case CPDownArrowFunctionKey:
        if (objj_msgSend(self, "isVisible"))
        {
            objj_msgSend(self, "selectNextItem");
            return YES;
        }
        break;
    case CPUpArrowFunctionKey:
        if (objj_msgSend(self, "isVisible"))
        {
            objj_msgSend(self, "selectPreviousItem");
            return YES;
        }
        break;
    case CPEscapeFunctionKey:
        if (objj_msgSend(self, "isVisible"))
        {
            objj_msgSend(self, "close");
            return YES;
        }
        break;
    case CPPageUpFunctionKey:
        if (objj_msgSend(self, "isVisible"))
        {
            objj_msgSend(self, "scrollPageUp");
            return YES;
        }
        break;
    case CPPageDownFunctionKey:
        if (objj_msgSend(self, "isVisible"))
        {
            objj_msgSend(self, "scrollPageDown");
            return YES;
        }
        break;
    case CPHomeFunctionKey:
        if (objj_msgSend(self, "isVisible"))
        {
            objj_msgSend(self, "scrollToTop");
            return YES;
        }
        break;
    case CPEndFunctionKey:
        if (objj_msgSend(self, "isVisible"))
        {
            objj_msgSend(self, "scrollToBottom");
            return YES;
        }
        break;
    case CPCarriageReturnCharacter:
        if (objj_msgSend(self, "isVisible"))
        {
            objj_msgSend(self, "closeListAfterItemClick");
            return YES;
        }
        break;
    }
    return NO;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("itemWasClicked"), function $_CPPopUpList__itemWasClicked(self, _cmd)
{
    return self._itemWasClicked && objj_msgSend(self._dataSource, "numberOfItemsInList:", self) > 0;
}
,["BOOL"]), new objj_method(sel_getUid("setItemWasClicked:"), function $_CPPopUpList__setItemWasClicked_(self, _cmd, flag)
{
    self._itemWasClicked = objj_msgSend(self._dataSource, "numberOfItemsInList:", self) > 0 && flag;
}
,["void","BOOL"]), new objj_method(sel_getUid("listWasClicked"), function $_CPPopUpList__listWasClicked(self, _cmd)
{
    return self._listWasClicked && objj_msgSend(self._dataSource, "numberOfItemsInList:", self) > 0;
}
,["BOOL"]), new objj_method(sel_getUid("setListWasClicked:"), function $_CPPopUpList__setListWasClicked_(self, _cmd, flag)
{
    self._listWasClicked = objj_msgSend(self._dataSource, "numberOfItemsInList:", self) > 0 && flag;
}
,["void","BOOL"]), new objj_method(sel_getUid("controllingViewShouldResign"), function $_CPPopUpList__controllingViewShouldResign(self, _cmd)
{
    if (objj_msgSend(self, "listWasClicked"))
    {
        if (objj_msgSend(self, "listWasClicked") && !objj_msgSend(self, "itemWasClicked"))
            objj_msgSend(self, "setListWasClicked:", NO);
        return NO;
    }
    else
        return YES;
}
,["BOOL"]), new objj_method(sel_getUid("listWillPopUp"), function $_CPPopUpList__listWillPopUp(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", _CPPopUpListWillPopUpNotification, self);
}
,["void"]), new objj_method(sel_getUid("constrain:relativeToRect:view:offset:"), function $_CPPopUpList__constrain_relativeToRect_view_offset_(self, _cmd, aFrame, aRect, aView, offset)
{
    var baseOrigin = objj_msgSend(aView, "convertPointToBase:", aRect.origin),
        windowOrigin = objj_msgSend(objj_msgSend(aView, "window"), "convertBaseToPlatformWindow:", baseOrigin),
        rowHeight = objj_msgSend(self, "rowHeightForTableView:", self._tableView) + objj_msgSend(self._tableView, "intercellSpacing").height,
        numberOfRows = MIN(objj_msgSend(self, "numberOfRowsInTableView:", self._tableView), objj_msgSend(self._dataSource, "numberOfVisibleItemsInList:", self)),
        frame = CGRectMake(windowOrigin.x, windowOrigin.y + CGRectGetHeight(aRect) + offset, MAX(self._listWidth, CGRectGetWidth(aFrame)), rowHeight * numberOfRows + 2),
        bottomFrame = CGRectMakeCopy(frame),
        bottom = CGRectGetMaxY(bottomFrame),
        viewRect = objj_msgSend(objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"), "visibleFrame"),
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
}
,["CGRect","CGRect","CGRect","CPView","int"]), new objj_method(sel_getUid("tableViewClickAction:"), function $_CPPopUpList__tableViewClickAction_(self, _cmd, sender)
{
    objj_msgSend(self, "close");
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
        self._dataSource = objj_msgSend(aCoder, "decodeObjectForKey:", _CPPopUpListDataSourceKey);
        self._listWidth = objj_msgSend(aCoder, "decodeIntForKey:", _CPPopUpListListWidthKey);
        self._panel = objj_msgSend(aCoder, "decodeObjectForKey:", _CPPopUpListListPanelKey);
        self._scrollView = objj_msgSend(aCoder, "decodeObjectForKey:", _CPPopUpListScrollViewKey);
        self._tableView = objj_msgSend(aCoder, "decodeObjectForKey:", _CPPopUpListTableViewKey);
        self._tableColumn = objj_msgSend(self._tableView, "tableColumnWithIdentifier:", ListColumnIdentifier);
        objj_msgSend(self._scrollView, "setDocumentView:", self._tableView);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPPopUpList__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpList").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._dataSource, _CPPopUpListDataSourceKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._listWidth, _CPPopUpListListWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._panel, _CPPopUpListListPanelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._scrollView, _CPPopUpListScrollViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._tableView, _CPPopUpListTableViewKey);
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("_CPPopUpList")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPPopUpList\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("numberOfRowsInTableView:"), function $_CPPopUpList__numberOfRowsInTableView_(self, _cmd, aTableView)
{
    return MAX(objj_msgSend(self._dataSource, "numberOfItemsInList:", self), 1);
}
,["int","id"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $_CPPopUpList__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aColumn, aRow)
{
    return objj_msgSend(self._dataSource, "list:displayValueForObjectValue:", self, objj_msgSend(self._dataSource, "list:objectValueForItemAtIndex:", self, aRow));
}
,["id","id","CPTableColumn","int"])]);
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
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(objj_msgSend(self, "delegate"), "setItemWasClicked:", YES);
    self._acceptFirstResponder = YES;
    objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpTableView").super_class }, "trackMouse:", anEvent);
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
    objj_msgSend(self, "_trapNextMouseDown");
    return self;
}
,["id","CGRect","unsigned int"]), new objj_method(sel_getUid("sendEvent:"), function $_CPPopUpPanel__sendEvent_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseDown || type === CPRightMouseDown)
        objj_msgSend(objj_msgSend(self, "delegate"), "setListWasClicked:", YES);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpPanel").super_class }, "sendEvent:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("orderFront:"), function $_CPPopUpPanel__orderFront_(self, _cmd, sender)
{
    objj_msgSend(self, "_trapNextMouseDown");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpPanel").super_class }, "orderFront:", sender);
}
,["void","id"]), new objj_method(sel_getUid("_mouseWasClicked:"), function $_CPPopUpPanel___mouseWasClicked_(self, _cmd, anEvent)
{
    var mouseWindow = objj_msgSend(anEvent, "window"),
        rect = objj_msgSend(objj_msgSend(objj_msgSend(self, "delegate"), "dataSource"), "bounds"),
        point = objj_msgSend(objj_msgSend(objj_msgSend(self, "delegate"), "dataSource"), "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if (mouseWindow != self && !CGRectContainsPoint(rect, point))
        objj_msgSend(objj_msgSend(self, "delegate"), "close");
    else
        objj_msgSend(self, "_trapNextMouseDown");
}
,["void","CPEvent"]), new objj_method(sel_getUid("_trapNextMouseDown"), function $_CPPopUpPanel___trapNextMouseDown(self, _cmd)
{
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("_mouseWasClicked:"), CPLeftMouseDownMask, nil, CPDefaultRunLoopMode, NO);
}
,["void"])]);
}