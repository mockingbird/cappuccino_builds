@STATIC;1.0;I;21;Foundation/CPObject.ji;13;CPTextField.ji;13;CPTableView.ji;15;_CPMenuWindow.jt;12821;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPTableView.j", YES);objj_executeFile("_CPMenuWindow.j", YES);var _CPAutocompleteMenuMaximumHeight = 307;
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
        self._menuWindow = objj_msgSend(objj_msgSend(_CPAutocompleteWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0, 0, 100, 100), CPBorderlessWindowMask);
        objj_msgSend(self._menuWindow, "setLevel:", CPPopUpMenuWindowLevel);
        objj_msgSend(self._menuWindow, "setHasShadow:", YES);
        objj_msgSend(self._menuWindow, "setShadowStyle:", CPMenuWindowShadowStyle);
        objj_msgSend(self._menuWindow, "setAcceptsMouseMovedEvents:", YES);
        objj_msgSend(self._menuWindow, "setBackgroundColor:", objj_msgSend(_CPMenuWindow, "backgroundColorForBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle));
        var contentView = objj_msgSend(self._menuWindow, "contentView");
        self.scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self.scrollView, "setAutohidesScrollers:", YES);
        objj_msgSend(self.scrollView, "setHasHorizontalScroller:", NO);
        objj_msgSend(contentView, "addSubview:", self.scrollView);
        self.tableView = objj_msgSend(objj_msgSend(_CPNonFirstResponderTableView, "alloc"), "initWithFrame:", CGRectMakeZero());
        var tableColumn = objj_msgSend(CPTableColumn, "new");
        objj_msgSend(tableColumn, "setResizingMask:", CPTableColumnAutoresizingMask);
        objj_msgSend(self.tableView, "addTableColumn:", tableColumn);
        objj_msgSend(self.tableView, "setDataSource:", self);
        objj_msgSend(self.tableView, "setDelegate:", self);
        objj_msgSend(self.tableView, "setTarget:", self);
        objj_msgSend(self.tableView, "setAction:", sel_getUid("complete:"));
        objj_msgSend(self.tableView, "setAllowsMultipleSelection:", NO);
        objj_msgSend(self.tableView, "setHeaderView:", nil);
        objj_msgSend(self.tableView, "setCornerView:", nil);
        objj_msgSend(self.tableView, "setRowHeight:", 24.0);
        objj_msgSend(self.tableView, "setGridStyleMask:", CPTableViewGridNone);
        objj_msgSend(self.tableView, "setBackgroundColor:", objj_msgSend(CPColor, "clearColor"));
        objj_msgSend(self.scrollView, "setDocumentView:", self.tableView);
    }
    return self;
}
,["id","CPTextField"]), new objj_method(sel_getUid("setContentArray:"), function $_CPAutocompleteMenu__setContentArray_(self, _cmd, anArray)
{
    if (self.contentArray === anArray || objj_msgSend(self.contentArray, "isEqualToArray:", anArray))
        return;
    self.contentArray = objj_msgSend(anArray, "copy");
    if (!objj_msgSend(self.contentArray, "count"))
        objj_msgSend(self, "_hideCompletions");
    self.widestItemWidth = CPNotFound;
    objj_msgSend(self.tableView, "reloadData");
    objj_msgSend(self, "layoutSubviews");
}
,["void","CPArray"]), new objj_method(sel_getUid("setIndexOfSelectedItem:"), function $_CPAutocompleteMenu__setIndexOfSelectedItem_(self, _cmd, anIndex)
{
    if (anIndex == CPNotFound)
        objj_msgSend(self.tableView, "selectRowIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSet"), NO);
    else
    {
        objj_msgSend(self.tableView, "selectRowIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex), NO);
        objj_msgSend(self.tableView, "scrollRowToVisible:", anIndex);
    }
}
,["void","int"]), new objj_method(sel_getUid("indexOfSelectedItem"), function $_CPAutocompleteMenu__indexOfSelectedItem(self, _cmd)
{
    return objj_msgSend(self.tableView, "selectedRow");
}
,["int"]), new objj_method(sel_getUid("selectedItem"), function $_CPAutocompleteMenu__selectedItem(self, _cmd)
{
    return self.contentArray ? self.contentArray[objj_msgSend(self.tableView, "selectedRow")] : nil;
}
,["CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPAutocompleteMenu__layoutSubviews(self, _cmd)
{
    if (!objj_msgSend(self.textField, "window"))
    {
        objj_msgSend(self._menuWindow, "orderOut:", self);
        return;
    }
    var frame = objj_msgSend(self.textField, "frame"),
        origin = frame.origin,
        tableColumn = objj_msgSend(objj_msgSend(self.tableView, "tableColumns"), "firstObject");
    if (objj_msgSend(self.textField, "respondsToSelector:", sel_getUid("_completionOrigin:")))
        origin = objj_msgSend(self.textField, "_completionOrigin:", self);
    if (self.widestItemWidth === CPNotFound)
    {
        var dataView = objj_msgSend(tableColumn, "dataView"),
            fontNormal = objj_msgSend(dataView, "valueForThemeAttribute:inState:", "font", CPThemeStateTableDataView),
            fontSelected = objj_msgSend(dataView, "valueForThemeAttribute:inState:", "font", CPThemeStateTableDataView | CPThemeStateSelectedDataView),
            contentInsetNormal = objj_msgSend(dataView, "valueForThemeAttribute:inState:", "content-inset", CPThemeStateTableDataView),
            contentInsetSelected = objj_msgSend(dataView, "valueForThemeAttribute:inState:", "content-inset", CPThemeStateTableDataView | CPThemeStateSelectedDataView);
        var mergedString = self.contentArray.join("\n");
        self.widestItemWidth = MAX(objj_msgSend(mergedString, "sizeWithFont:", fontNormal).width + contentInsetNormal.left + contentInsetNormal.right, objj_msgSend(mergedString, "sizeWithFont:", fontSelected).width + contentInsetSelected.left + contentInsetSelected.right) + objj_msgSend(self.tableView, "intercellSpacing").width + 2.0 + 5.0;
    }
    var frameOrigin = objj_msgSend(objj_msgSend(self.textField, "window"), "convertBaseToGlobal:", objj_msgSend(self.textField, "convertPointToBase:", origin)),
        screenSize = objj_msgSend(objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(self._menuWindow, "platformWindow") : objj_msgSend(self._menuWindow, "screen"), "visibleFrame").size,
        availableWidth = screenSize.width - frameOrigin.x,
        availableHeight = screenSize.height - frameOrigin.y,
        width = MIN(self.widestItemWidth, availableWidth),
        spacingHeight = objj_msgSend(self.tableView, "intercellSpacing").height,
        height = MIN(MIN(spacingHeight + objj_msgSend(self.contentArray, "count") * (objj_msgSend(self.tableView, "rowHeight") + spacingHeight), _CPAutocompleteMenuMaximumHeight), availableHeight),
        newFrame = CGRectMake(frameOrigin.x, frameOrigin.y, width, height);
    newFrame = objj_msgSend(self._menuWindow, "frameRectForContentRect:", newFrame);
    objj_msgSend(self._menuWindow, "setFrame:", newFrame);
    var scrollFrame = CGRectInset(objj_msgSend(objj_msgSend(self._menuWindow, "contentView"), "bounds"), 1.0, 1.0);
    objj_msgSend(self.scrollView, "setFrame:", scrollFrame);
    objj_msgSend(tableColumn, "setWidth:", objj_msgSend(objj_msgSend(self.scrollView, "contentView"), "frame").size.width);
}
,["void"]), new objj_method(sel_getUid("_showCompletions:"), function $_CPAutocompleteMenu___showCompletions_(self, _cmd, timer)
{
    var indexOfSelectedItem = objj_msgSend(self, "indexOfSelectedItem");
    objj_msgSend(self, "setContentArray:", objj_msgSend(self.textField, "_completionsForSubstring:indexOfToken:indexOfSelectedItem:", objj_msgSend(self.textField, "_inputElement").value, 0, indexOfSelectedItem));
    if (!objj_msgSend(self.contentArray, "count"))
        return;
    objj_msgSend(self, "setIndexOfSelectedItem:", indexOfSelectedItem);
    objj_msgSend(self.textField, "setThemeState:", CPThemeStateAutocompleting);
    objj_msgSend(self._menuWindow, "setPlatformWindow:", objj_msgSend(objj_msgSend(self.textField, "window"), "platformWindow"));
    objj_msgSend(objj_msgSend(self.textField, "window"), "addChildWindow:ordered:", self._menuWindow, CPWindowAbove);
    objj_msgSend(self, "layoutSubviews");
}
,["void","CPTimer"]), new objj_method(sel_getUid("_delayedShowCompletions"), function $_CPAutocompleteMenu___delayedShowCompletions(self, _cmd)
{
    var completionDelay = 0.5;
    if (objj_msgSend(self.textField, "respondsToSelector:", sel_getUid("completionDelay")))
        completionDelay = objj_msgSend(self.textField, "completionDelay");
    self._showCompletionsTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", completionDelay, self, sel_getUid("_showCompletions:"), nil, NO);
}
,["void"]), new objj_method(sel_getUid("_hideCompletions"), function $_CPAutocompleteMenu___hideCompletions(self, _cmd)
{
    objj_msgSend(self._showCompletionsTimer, "invalidate");
    self._showCompletionsTimer = nil;
    objj_msgSend(self.textField, "unsetThemeState:", CPThemeStateAutocompleting);
    objj_msgSend(self._menuWindow, "orderOut:", self);
    objj_msgSend(self, "layoutSubviews");
}
,["void"]), new objj_method(sel_getUid("selectNext"), function $_CPAutocompleteMenu__selectNext(self, _cmd)
{
    var index = objj_msgSend(self, "indexOfSelectedItem") + 1;
    if (index >= objj_msgSend(self.contentArray, "count"))
        return;
    objj_msgSend(self, "setIndexOfSelectedItem:", index);
}
,["void"]), new objj_method(sel_getUid("selectPrevious"), function $_CPAutocompleteMenu__selectPrevious(self, _cmd)
{
    var index = objj_msgSend(self, "indexOfSelectedItem") - 1;
    if (index < 0)
        return;
    objj_msgSend(self, "setIndexOfSelectedItem:", index);
}
,["void"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $_CPAutocompleteMenu__numberOfRowsInTableView_(self, _cmd, tableView)
{
    return objj_msgSend(self.contentArray, "count");
}
,["int","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $_CPAutocompleteMenu__tableView_objectValueForTableColumn_row_(self, _cmd, tableView, tableColumn, row)
{
    return objj_msgSend(self.contentArray, "objectAtIndex:", row);
}
,["void","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("complete:"), function $_CPAutocompleteMenu__complete_(self, _cmd, sender)
{
    objj_msgSend(self.textField, "_complete:", self);
}
,["id","id"])]);
}{var the_class = objj_allocateClassPair(CPPanel, "_CPAutocompleteWindow"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $_CPAutocompleteWindow__initWithContentRect_styleMask_(self, _cmd, aContentRect, aStyleMask)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAutocompleteWindow").super_class }, "initWithContentRect:styleMask:", aContentRect, aStyleMask))
        self._constrainsToUsableScreen = NO;
    return self;
}
,["id","CGRect","unsigned int"]), new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"), function $_CPAutocompleteWindow__becomesKeyOnlyIfNeeded(self, _cmd)
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