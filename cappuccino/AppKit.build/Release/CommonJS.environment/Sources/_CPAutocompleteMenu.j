@STATIC;1.0;I;21;Foundation/CPObject.ji;13;CPTextField.ji;13;CPTableView.ji;15;_CPMenuWindow.jt;17835;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPTableView.j", YES);objj_executeFile("_CPMenuWindow.j", YES);var _CPAutocompleteMenuMaximumHeight = 307;
{var the_class = objj_allocateClassPair(CPObject, "_CPAutocompleteMenu"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("textField"), new objj_ivar("contentArray"), new objj_ivar("widestItemWidth"), new objj_ivar("_menuWindow"), new objj_ivar("scrollView"), new objj_ivar("tableView"), new objj_ivar("_showCompletionsTimer")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("textField"), function $_CPAutocompleteMenu__textField(self, _cmd)
{
    return self.textField;
}
,["CPTextField"]), new objj_method(sel_getUid("setTextField:"), function $_CPAutocompleteMenu__setTextField_(self, _cmd, newValue)
{
    self.textField = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("contentArray"), function $_CPAutocompleteMenu__contentArray(self, _cmd)
{
    return self.contentArray;
}
,["CPArray"]), new objj_method(sel_getUid("setContentArray:"), function $_CPAutocompleteMenu__setContentArray_(self, _cmd, newValue)
{
    self.contentArray = newValue;
}
,["void","CPArray"]), new objj_method(sel_getUid("initWithTextField:"), function $_CPAutocompleteMenu__initWithTextField_(self, _cmd, aTextField)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAutocompleteMenu").super_class }, "init"))
    {
        self.textField = aTextField;
        self._menuWindow = ((___r1 = (_CPAutocompleteWindow == null ? null : _CPAutocompleteWindow.isa.objj_msgSend0(_CPAutocompleteWindow, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", CGRectMake(0, 0, 100, 100), CPBorderlessWindowMask));
        ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLevel:", CPPopUpMenuWindowLevel));
        ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHasShadow:", YES));
        ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setShadowStyle:", CPMenuWindowShadowStyle));
        ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAcceptsMouseMovedEvents:", YES));
        ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", _CPMenuWindow.isa.objj_msgSend1(_CPMenuWindow, "backgroundColorForBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle)));
        var contentView = ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentView"));
        self.scrollView = ((___r1 = (CPScrollView == null ? null : CPScrollView.isa.objj_msgSend0(CPScrollView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self.scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutohidesScrollers:", YES));
        ((___r1 = self.scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHasHorizontalScroller:", NO));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self.scrollView));
        self.tableView = ((___r1 = (_CPNonFirstResponderTableView == null ? null : _CPNonFirstResponderTableView.isa.objj_msgSend0(_CPNonFirstResponderTableView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        var tableColumn = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "new");
        (tableColumn == null ? null : tableColumn.isa.objj_msgSend1(tableColumn, "setResizingMask:", CPTableColumnAutoresizingMask));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTableColumn:", tableColumn));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDataSource:", self));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("complete:")));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAllowsMultipleSelection:", NO));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHeaderView:", nil));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCornerView:", nil));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setRowHeight:", 24.0));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setGridStyleMask:", CPTableViewGridNone));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "clearColor")));
        ((___r1 = self.scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", self.tableView));
    }
    return self;
    var ___r1;
}
,["id","CPTextField"]), new objj_method(sel_getUid("setContentArray:"), function $_CPAutocompleteMenu__setContentArray_(self, _cmd, anArray)
{
    if (self.contentArray === anArray || ((___r1 = self.contentArray), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToArray:", anArray)))
        return;
    self.contentArray = (anArray == null ? null : anArray.isa.objj_msgSend0(anArray, "copy"));
    if (!((___r1 = self.contentArray), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        self.isa.objj_msgSend0(self, "_hideCompletions");
    self.widestItemWidth = CPNotFound;
    ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    self.isa.objj_msgSend0(self, "layoutSubviews");
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("setIndexOfSelectedItem:"), function $_CPAutocompleteMenu__setIndexOfSelectedItem_(self, _cmd, anIndex)
{
    if (anIndex == CPNotFound)
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "selectRowIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"), NO));
    else
    {
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "selectRowIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", anIndex), NO));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollRowToVisible:", anIndex));
    }
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("indexOfSelectedItem"), function $_CPAutocompleteMenu__indexOfSelectedItem(self, _cmd)
{
    return ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow"));
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("selectedItem"), function $_CPAutocompleteMenu__selectedItem(self, _cmd)
{
    return self.contentArray ? self.contentArray[((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow"))] : nil;
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPAutocompleteMenu__layoutSubviews(self, _cmd)
{
    if (!((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "window")))
    {
        ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderOut:", self));
        return;
    }
    var frame = ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        origin = frame.origin,
        tableColumn = ((___r1 = ((___r2 = self.tableView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableColumns"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstObject"));
    if (((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("_completionOrigin:"))))
        origin = ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_completionOrigin:", self));
    if (self.widestItemWidth === CPNotFound)
    {
        var dataView = (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "dataView")),
            fontNormal = (dataView == null ? null : dataView.isa.objj_msgSend2(dataView, "valueForThemeAttribute:inState:", "font", CPThemeStateTableDataView)),
            fontSelected = (dataView == null ? null : dataView.isa.objj_msgSend2(dataView, "valueForThemeAttribute:inState:", "font", [CPThemeStateTableDataView, CPThemeStateSelectedDataView])),
            contentInsetNormal = (dataView == null ? null : dataView.isa.objj_msgSend2(dataView, "valueForThemeAttribute:inState:", "content-inset", CPThemeStateTableDataView)),
            contentInsetSelected = (dataView == null ? null : dataView.isa.objj_msgSend2(dataView, "valueForThemeAttribute:inState:", "content-inset", [CPThemeStateTableDataView, CPThemeStateSelectedDataView]));
        var mergedString = self.contentArray.join("\n");
        self.widestItemWidth = MAX((mergedString == null ? null : mergedString.isa.objj_msgSend1(mergedString, "sizeWithFont:", fontNormal)).width + contentInsetNormal.left + contentInsetNormal.right, (mergedString == null ? null : mergedString.isa.objj_msgSend1(mergedString, "sizeWithFont:", fontSelected)).width + contentInsetSelected.left + contentInsetSelected.right) + ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "intercellSpacing")).width + 2.0 + 5.0;
    }
    var frameOrigin = ((___r1 = ((___r2 = self.textField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertBaseToGlobal:", ((___r2 = self.textField), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "convertPointToBase:", origin)))),
        screenSize = ((___r1 = CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser") ? ((___r2 = self._menuWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow")) : ((___r2 = self._menuWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "screen"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame")).size,
        availableWidth = screenSize.width - frameOrigin.x,
        availableHeight = screenSize.height - frameOrigin.y,
        width = MIN(self.widestItemWidth, availableWidth),
        spacingHeight = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "intercellSpacing")).height,
        height = MIN(MIN(spacingHeight + ((___r1 = self.contentArray), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) * (((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowHeight")) + spacingHeight), _CPAutocompleteMenuMaximumHeight), availableHeight),
        newFrame = CGRectMake(frameOrigin.x, frameOrigin.y, width, height);
    newFrame = ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "frameRectForContentRect:", newFrame));
    ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", newFrame));
    var scrollFrame = CGRectInset(((___r1 = ((___r2 = self._menuWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")), 1.0, 1.0);
    ((___r1 = self.scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", scrollFrame));
    (tableColumn == null ? null : tableColumn.isa.objj_msgSend1(tableColumn, "setWidth:", ((___r1 = ((___r2 = self.scrollView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size.width));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("_showCompletions:"), function $_CPAutocompleteMenu___showCompletions_(self, _cmd, timer)
{
    var indexOfSelectedItem = self.isa.objj_msgSend0(self, "indexOfSelectedItem");
    self.isa.objj_msgSend1(self, "setContentArray:", ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_completionsForSubstring:indexOfToken:indexOfSelectedItem:", ((___r2 = self.textField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_inputElement")).value, 0, indexOfSelectedItem)));
    if (!((___r1 = self.contentArray), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        return;
    self.isa.objj_msgSend1(self, "setIndexOfSelectedItem:", indexOfSelectedItem);
    ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setThemeState:", CPThemeStateAutocompleting));
    ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPlatformWindow:", ((___r2 = ((___r3 = self.textField), ___r3 == null ? null : ___r3.isa.objj_msgSend0(___r3, "window"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))));
    ((___r1 = ((___r2 = self.textField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "addChildWindow:ordered:", self._menuWindow, CPWindowAbove));
    self.isa.objj_msgSend0(self, "layoutSubviews");
    var ___r1, ___r2, ___r3;
}
,["void","CPTimer"]), new objj_method(sel_getUid("_delayedShowCompletions"), function $_CPAutocompleteMenu___delayedShowCompletions(self, _cmd)
{
    var completionDelay = 0.5;
    if (((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("completionDelay"))))
        completionDelay = ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "completionDelay"));
    self._showCompletionsTimer = CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", completionDelay, self, sel_getUid("_showCompletions:"), nil, NO);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_hideCompletions"), function $_CPAutocompleteMenu___hideCompletions(self, _cmd)
{
    ((___r1 = self._showCompletionsTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
    self._showCompletionsTimer = nil;
    ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateAutocompleting));
    ((___r1 = self._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderOut:", self));
    self.isa.objj_msgSend0(self, "layoutSubviews");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("selectNext"), function $_CPAutocompleteMenu__selectNext(self, _cmd)
{
    var index = self.isa.objj_msgSend0(self, "indexOfSelectedItem") + 1;
    if (index >= ((___r1 = self.contentArray), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        return;
    self.isa.objj_msgSend1(self, "setIndexOfSelectedItem:", index);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("selectPrevious"), function $_CPAutocompleteMenu__selectPrevious(self, _cmd)
{
    var index = self.isa.objj_msgSend0(self, "indexOfSelectedItem") - 1;
    if (index < 0)
        return;
    self.isa.objj_msgSend1(self, "setIndexOfSelectedItem:", index);
}
,["void"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $_CPAutocompleteMenu__numberOfRowsInTableView_(self, _cmd, tableView)
{
    return ((___r1 = self.contentArray), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["int","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $_CPAutocompleteMenu__tableView_objectValueForTableColumn_row_(self, _cmd, tableView, tableColumn, row)
{
    return ((___r1 = self.contentArray), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", row));
    var ___r1;
}
,["void","CPTableView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("complete:"), function $_CPAutocompleteMenu__complete_(self, _cmd, sender)
{
    ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_complete:", self));
    var ___r1;
}
,["void","id"])]);
}{var the_class = objj_allocateClassPair(CPPanel, "_CPAutocompleteWindow"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $_CPAutocompleteWindow__initWithContentRect_styleMask_(self, _cmd, aContentRect, aStyleMask)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAutocompleteWindow").super_class }, "initWithContentRect:styleMask:", aContentRect, aStyleMask))
        self._constrainsToUsableScreen = NO;
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"), function $_CPAutocompleteWindow__becomesKeyOnlyIfNeeded(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("worksWhenModal"), function $_CPAutocompleteWindow__worksWhenModal(self, _cmd)
{
    return YES;
}
,["BOOL"])]);
}{var the_class = objj_allocateClassPair(CPTableView, "_CPNonFirstResponderTableView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("needsPanelToBecomeKey"), function $_CPNonFirstResponderTableView__needsPanelToBecomeKey(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $_CPNonFirstResponderTableView__acceptsFirstResponder(self, _cmd)
{
    return NO;
}
,["BOOL"])]);
}