@STATIC;1.0;i;8;CPText.ji;13;CPTextField.ji;14;_CPPopUpList.jt;41357;objj_executeFile("CPText.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("_CPPopUpList.j", YES);CPComboBoxSelectionDidChangeNotification = "CPComboBoxSelectionDidChangeNotification";
CPComboBoxSelectionIsChangingNotification = "CPComboBoxSelectionIsChangingNotification";
CPComboBoxWillDismissNotification = "CPComboBoxWillDismissNotification";
CPComboBoxWillPopUpNotification = "CPComboBoxWillPopUpNotification";
CPComboBoxStateButtonBordered = CPThemeState("button-bordered");
var CPComboBoxTextSubview = "text",
    CPComboBoxButtonSubview = "button",
    CPComboBoxDefaultNumberOfVisibleItems = 5,
    CPComboBoxFocusRingWidth = -1;
{var the_class = objj_allocateClassPair(CPTextField, "CPComboBox"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_items"), new objj_ivar("_listDelegate"), new objj_ivar("_dataSource"), new objj_ivar("_usesDataSource"), new objj_ivar("_completes"), new objj_ivar("_canComplete"), new objj_ivar("_numberOfVisibleItems"), new objj_ivar("_forceSelection"), new objj_ivar("_hasVerticalScroller"), new objj_ivar("_selectedStringValue"), new objj_ivar("_popUpButtonCausedResign")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPComboBox__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "initWithFrame:", aFrame);
    if (self)
        objj_msgSend(self, "_initComboBox");
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_initComboBox"), function $CPComboBox___initComboBox(self, _cmd)
{
    self._items = objj_msgSend(CPArray, "array");
    self._usesDataSource = NO;
    self._completes = NO;
    self._canComplete = NO;
    self._numberOfVisibleItems = CPComboBoxDefaultNumberOfVisibleItems;
    self._forceSelection = NO;
    self._hasVerticalScroller = YES;
    self._selectedStringValue = "";
    self._popUpButtonCausedResign = NO;
    objj_msgSend(self, "setTheme:", objj_msgSend(CPTheme, "defaultTheme"));
    objj_msgSend(self, "setBordered:", YES);
    objj_msgSend(self, "setBezeled:", YES);
    objj_msgSend(self, "setEditable:", YES);
    objj_msgSend(self, "setThemeState:", CPComboBoxStateButtonBordered);
}
,["void"]), new objj_method(sel_getUid("hasVerticalScroller"), function $CPComboBox__hasVerticalScroller(self, _cmd)
{
    return self._hasVerticalScroller;
}
,["BOOL"]), new objj_method(sel_getUid("setHasVerticalScroller:"), function $CPComboBox__setHasVerticalScroller_(self, _cmd, flag)
{
    flag = !!flag;
    if (self._hasVerticalScroller === flag)
        return;
    self._hasVerticalScroller = flag;
    objj_msgSend(objj_msgSend(self._listDelegate, "scrollView"), "setHasVerticalScroller:", flag);
}
,["void","BOOL"]), new objj_method(sel_getUid("intercellSpacing"), function $CPComboBox__intercellSpacing(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._listDelegate, "tableView"), "intercellSpacing");
}
,["CGSize"]), new objj_method(sel_getUid("setIntercellSpacing:"), function $CPComboBox__setIntercellSpacing_(self, _cmd, aSize)
{
    objj_msgSend(objj_msgSend(self._listDelegate, "tableView"), "setIntercellSpacing:", aSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("isButtonBordered"), function $CPComboBox__isButtonBordered(self, _cmd)
{
    return objj_msgSend(self, "hasThemeState:", CPComboBoxStateButtonBordered);
}
,["BOOL"]), new objj_method(sel_getUid("setButtonBordered:"), function $CPComboBox__setButtonBordered_(self, _cmd, flag)
{
    if (!!flag)
        objj_msgSend(self, "setThemeState:", CPComboBoxStateButtonBordered);
    else
        objj_msgSend(self, "unsetThemeState:", CPComboBoxStateButtonBordered);
}
,["void","BOOL"]), new objj_method(sel_getUid("itemHeight"), function $CPComboBox__itemHeight(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._listDelegate, "tableView"), "rowHeight");
}
,["float"]), new objj_method(sel_getUid("setItemHeight:"), function $CPComboBox__setItemHeight_(self, _cmd, itemHeight)
{
    objj_msgSend(objj_msgSend(self._listDelegate, "tableView"), "setRowHeight:", itemHeight);
    objj_msgSend(objj_msgSend(self._listDelegate, "tableView"), "reloadData");
}
,["void","float"]), new objj_method(sel_getUid("numberOfVisibleItems"), function $CPComboBox__numberOfVisibleItems(self, _cmd)
{
    return self._numberOfVisibleItems;
}
,["int"]), new objj_method(sel_getUid("setNumberOfVisibleItems:"), function $CPComboBox__setNumberOfVisibleItems_(self, _cmd, visibleItems)
{
    self._numberOfVisibleItems = MAX(visibleItems, 1);
}
,["void","int"]), new objj_method(sel_getUid("delegate"), function $CPComboBox__delegate(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "delegate");
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPComboBox__setDelegate_(self, _cmd, aDelegate)
{
    var delegate = objj_msgSend(self, "delegate");
    if (aDelegate === delegate)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (delegate)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", delegate, CPComboBoxSelectionIsChangingNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", delegate, CPComboBoxSelectionDidChangeNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", delegate, CPComboBoxWillDismissNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", delegate, CPComboBoxWillPopUpNotification, self);
    }
    if (aDelegate)
    {
        if (objj_msgSend(aDelegate, "respondsToSelector:", sel_getUid("comboBoxSelectionIsChanging:")))
            objj_msgSend(defaultCenter, "addObserver:selector:name:object:", delegate, sel_getUid("comboBoxSelectionIsChanging:"), CPComboBoxSelectionIsChangingNotification, self);
        if (objj_msgSend(aDelegate, "respondsToSelector:", sel_getUid("comboBoxSelectionDidChange:")))
            objj_msgSend(defaultCenter, "addObserver:selector:name:object:", delegate, sel_getUid("comboBoxSelectionDidChange:"), CPComboBoxSelectionDidChangeNotification, self);
        if (objj_msgSend(aDelegate, "respondsToSelector:", sel_getUid("comboBoxWillPopUp:")))
            objj_msgSend(defaultCenter, "addObserver:selector:name:object:", delegate, sel_getUid("comboBoxWillPopUp:"), CPComboBoxWillPopUpNotification, self);
        if (objj_msgSend(aDelegate, "respondsToSelector:", sel_getUid("comboBoxWillDismiss:")))
            objj_msgSend(defaultCenter, "addObserver:selector:name:object:", delegate, sel_getUid("comboBoxWillDissmis:"), CPComboBoxWillDismissNotification, self);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "setDelegate:", aDelegate);
}
,["void","id"]), new objj_method(sel_getUid("dataSource"), function $CPComboBox__dataSource(self, _cmd)
{
    if (!self._usesDataSource)
        objj_msgSend(self, "_dataSourceWarningForMethod:condition:", _cmd, NO);
    return self._dataSource;
}
,["id"]), new objj_method(sel_getUid("setDataSource:"), function $CPComboBox__setDataSource_(self, _cmd, aSource)
{
    if (!self._usesDataSource)
        objj_msgSend(self, "_dataSourceWarningForMethod:condition:", _cmd, NO);
    else if (self._dataSource !== aSource)
    {
        if (!objj_msgSend(aSource, "respondsToSelector:", sel_getUid("numberOfItemsInComboBox:")) || !objj_msgSend(aSource, "respondsToSelector:", sel_getUid("comboBox:objectValueForItemAtIndex:")))
        {
            CPLog.warn("Illegal %s data source (%s). Must implement numberOfItemsInComboBox: and comboBox:objectValueForItemAtIndex:", objj_msgSend(self, "className"), objj_msgSend(aSource, "description"));
        }
        else
            self._dataSource = aSource;
    }
}
,["void","id"]), new objj_method(sel_getUid("usesDataSource"), function $CPComboBox__usesDataSource(self, _cmd)
{
    return self._usesDataSource;
}
,["BOOL"]), new objj_method(sel_getUid("setUsesDataSource:"), function $CPComboBox__setUsesDataSource_(self, _cmd, flag)
{
    flag = !!flag;
    if (self._usesDataSource === flag)
        return;
    self._usesDataSource = flag;
    if (self._usesDataSource)
        objj_msgSend(self._items, "removeAllObjects");
    objj_msgSend(self, "reloadData");
}
,["void","BOOL"]), new objj_method(sel_getUid("addItemsWithObjectValues:"), function $CPComboBox__addItemsWithObjectValues_(self, _cmd, objects)
{
    objj_msgSend(self._items, "addObjectsFromArray:", objects);
    objj_msgSend(self, "reloadDataSourceForSelector:", _cmd);
}
,["void","CPArray"]), new objj_method(sel_getUid("addItemWithObjectValue:"), function $CPComboBox__addItemWithObjectValue_(self, _cmd, anObject)
{
    objj_msgSend(self._items, "addObject:", anObject);
    objj_msgSend(self, "reloadDataSourceForSelector:", _cmd);
}
,["void","id"]), new objj_method(sel_getUid("insertItemWithObjectValue:atIndex:"), function $CPComboBox__insertItemWithObjectValue_atIndex_(self, _cmd, anObject, anIndex)
{
    if (self._usesDataSource)
        objj_msgSend(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
    objj_msgSend(self._items, "insertObject:atIndex:", anObject, anIndex);
    objj_msgSend(self, "reloadData");
}
,["void","id","int"]), new objj_method(sel_getUid("objectValues"), function $CPComboBox__objectValues(self, _cmd)
{
    if (self._usesDataSource)
        objj_msgSend(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
    return self._items;
}
,["CPArray"]), new objj_method(sel_getUid("removeAllItems"), function $CPComboBox__removeAllItems(self, _cmd)
{
    objj_msgSend(self._items, "removeAllObjects");
    objj_msgSend(self, "reloadDataSourceForSelector:", _cmd);
}
,["void"]), new objj_method(sel_getUid("removeItemAtIndex:"), function $CPComboBox__removeItemAtIndex_(self, _cmd, index)
{
    if (self._usesDataSource)
        objj_msgSend(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
    objj_msgSend(self._items, "removeObjectAtIndex:", index);
    objj_msgSend(self, "reloadData");
}
,["void","int"]), new objj_method(sel_getUid("removeItemWithObjectValue:"), function $CPComboBox__removeItemWithObjectValue_(self, _cmd, anObject)
{
    objj_msgSend(self._items, "removeObject:", anObject);
    objj_msgSend(self, "reloadDataSourceForSelector:", _cmd);
}
,["void","id"]), new objj_method(sel_getUid("numberOfItems"), function $CPComboBox__numberOfItems(self, _cmd)
{
    if (self._usesDataSource)
        return objj_msgSend(self._dataSource, "numberOfItemsInComboBox:", self);
    else
        return self._items.length;
}
,["int"]), new objj_method(sel_getUid("listDelegate"), function $CPComboBox__listDelegate(self, _cmd)
{
    return self._listDelegate;
}
,["_CPPopUpList"]), new objj_method(sel_getUid("setListDelegate:"), function $CPComboBox__setListDelegate_(self, _cmd, aDelegate)
{
    if (self._listDelegate === aDelegate)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (self._listDelegate)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, _CPPopUpListWillPopUpNotification, self._listDelegate);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, _CPPopUpListWillDismissNotification, self._listDelegate);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, _CPPopUpListDidDismissNotification, self._listDelegate);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, _CPPopUpListItemWasClickedNotification, self._listDelegate);
        var oldTableView = objj_msgSend(self._listDelegate, "tableView");
        if (oldTableView)
        {
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPTableViewSelectionIsChangingNotification, oldTableView);
            objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPTableViewSelectionDidChangeNotification, oldTableView);
        }
    }
    self._listDelegate = aDelegate;
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("comboBoxWillPopUp:"), _CPPopUpListWillPopUpNotification, self._listDelegate);
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("comboBoxWillDismiss:"), _CPPopUpListWillDismissNotification, self._listDelegate);
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("listDidDismiss:"), _CPPopUpListDidDismissNotification, self._listDelegate);
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("itemWasClicked:"), _CPPopUpListItemWasClickedNotification, self._listDelegate);
    objj_msgSend(objj_msgSend(self._listDelegate, "scrollView"), "setHasVerticalScroller:", self._hasVerticalScroller);
    var tableView = objj_msgSend(self._listDelegate, "tableView");
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("comboBoxSelectionIsChanging:"), CPTableViewSelectionIsChangingNotification, tableView);
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("comboBoxSelectionDidChange:"), CPTableViewSelectionDidChangeNotification, tableView);
    objj_msgSend(self._listDelegate, "setFont:", objj_msgSend(self, "font"));
    objj_msgSend(self._listDelegate, "setAlignment:", objj_msgSend(self, "alignment"));
}
,["void","_CPPopUpList"]), new objj_method(sel_getUid("indexOfItemWithObjectValue:"), function $CPComboBox__indexOfItemWithObjectValue_(self, _cmd, anObject)
{
    if (self._usesDataSource)
        objj_msgSend(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
    return objj_msgSend(self._items, "indexOfObject:", anObject);
}
,["int","id"]), new objj_method(sel_getUid("itemObjectValueAtIndex:"), function $CPComboBox__itemObjectValueAtIndex_(self, _cmd, index)
{
    if (self._usesDataSource)
        objj_msgSend(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
    return objj_msgSend(self._items, "objectAtIndex:", index);
}
,["id","int"]), new objj_method(sel_getUid("noteNumberOfItemsChanged"), function $CPComboBox__noteNumberOfItemsChanged(self, _cmd)
{
    objj_msgSend(objj_msgSend(self._listDelegate, "tableView"), "noteNumberOfRowsChanged");
}
,["void"]), new objj_method(sel_getUid("scrollItemAtIndexToTop:"), function $CPComboBox__scrollItemAtIndexToTop_(self, _cmd, index)
{
    objj_msgSend(self._listDelegate, "scrollItemAtIndexToTop:", index);
}
,["void","int"]), new objj_method(sel_getUid("scrollItemAtIndexToVisible:"), function $CPComboBox__scrollItemAtIndexToVisible_(self, _cmd, index)
{
    objj_msgSend(objj_msgSend(self._listDelegate, "tableView"), "scrollRowToVisible:", index);
}
,["void","int"]), new objj_method(sel_getUid("reloadData"), function $CPComboBox__reloadData(self, _cmd)
{
    objj_msgSend(objj_msgSend(self._listDelegate, "tableView"), "reloadData");
}
,["void"]), new objj_method(sel_getUid("popUpList"), function $CPComboBox__popUpList(self, _cmd)
{
    if (!self._listDelegate)
        objj_msgSend(self, "setListDelegate:", objj_msgSend(objj_msgSend(_CPPopUpList, "alloc"), "initWithDataSource:", self));
    objj_msgSend(self, "_selectMatchingItem");
    if (CPComboBoxFocusRingWidth < 0)
    {
        var inset = objj_msgSend(self, "currentValueForThemeAttribute:", "border-inset");
        CPComboBoxFocusRingWidth = inset.bottom;
    }
    objj_msgSend(self._listDelegate, "popUpRelativeToRect:view:offset:", objj_msgSend(self, "_borderFrame"), self, CPComboBoxFocusRingWidth - 1);
}
,["void"]), new objj_method(sel_getUid("listIsVisible"), function $CPComboBox__listIsVisible(self, _cmd)
{
    return self._listDelegate ? objj_msgSend(self._listDelegate, "isVisible") : NO;
}
,["BOOL"]), new objj_method(sel_getUid("reloadDataSourceForSelector:"), function $CPComboBox__reloadDataSourceForSelector_(self, _cmd, cmd)
{
    if (self._usesDataSource)
        objj_msgSend(self, "_dataSourceWarningForMethod:condition:", cmd, YES);
    else
        objj_msgSend(self, "reloadData");
}
,["void","SEL"]), new objj_method(sel_getUid("takeStringValueFromList"), function $CPComboBox__takeStringValueFromList(self, _cmd)
{
    if (self._usesDataSource && self._dataSource && objj_msgSend(self._dataSource, "numberOfItemsInComboBox:", self) === 0)
        return NO;
    var selectedStringValue = objj_msgSend(self._listDelegate, "selectedStringValue");
    if (selectedStringValue === nil)
        return NO;
    else
        self._selectedStringValue = selectedStringValue;
    objj_msgSend(self, "setStringValue:", self._selectedStringValue);
    objj_msgSend(self, "_reverseSetBinding");
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("listDidDismiss:"), function $CPComboBox__listDidDismiss_(self, _cmd, aNotification)
{
    objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
}
,["void","CPNotification"]), new objj_method(sel_getUid("itemWasClicked:"), function $CPComboBox__itemWasClicked_(self, _cmd, aNotification)
{
    objj_msgSend(self, "takeStringValueFromList");
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
,["void","CPNotification"]), new objj_method(sel_getUid("deselectItemAtIndex:"), function $CPComboBox__deselectItemAtIndex_(self, _cmd, index)
{
    var table = objj_msgSend(self._listDelegate, "tableView"),
        row = objj_msgSend(table, "selectedRow");
    if (row !== index)
        return;
    objj_msgSend(table, "deselectRow:", index);
}
,["void","int"]), new objj_method(sel_getUid("indexOfSelectedItem"), function $CPComboBox__indexOfSelectedItem(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._listDelegate, "tableView"), "selectedRow");
}
,["int"]), new objj_method(sel_getUid("objectValueOfSelectedItem"), function $CPComboBox__objectValueOfSelectedItem(self, _cmd)
{
    var row = objj_msgSend(objj_msgSend(self._listDelegate, "tableView"), "selectedRow");
    if (row >= 0)
    {
        if (self._usesDataSource)
            objj_msgSend(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
        return self._items[row];
    }
    return nil;
}
,["id"]), new objj_method(sel_getUid("selectItemAtIndex:"), function $CPComboBox__selectItemAtIndex_(self, _cmd, index)
{
    var table = objj_msgSend(self._listDelegate, "tableView"),
        row = objj_msgSend(table, "selectedRow");
    if (row === index)
        return;
    objj_msgSend(table, "selectRowIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), NO);
}
,["void","int"]), new objj_method(sel_getUid("selectItemWithObjectValue:"), function $CPComboBox__selectItemWithObjectValue_(self, _cmd, anObject)
{
    var index = objj_msgSend(self, "indexOfItemWithObjectValue:", anObject);
    if (index !== CPNotFound)
        objj_msgSend(self, "selectItemAtIndex:", index);
}
,["void","id"]), new objj_method(sel_getUid("completes"), function $CPComboBox__completes(self, _cmd)
{
    return self._completes;
}
,["BOOL"]), new objj_method(sel_getUid("setCompletes:"), function $CPComboBox__setCompletes_(self, _cmd, flag)
{
    self._completes = !!flag;
}
,["void","BOOL"]), new objj_method(sel_getUid("completedString:"), function $CPComboBox__completedString_(self, _cmd, substring)
{
    if (self._usesDataSource)
        return objj_msgSend(self, "comboBoxCompletedString:", substring);
    else
    {
        var index = objj_msgSend(self._items, "indexOfObjectPassingTest:context:", CPComboBoxCompletionTest, substring);
        return index !== CPNotFound ? self._items[index] : nil;
    }
}
,["CPString","CPString"]), new objj_method(sel_getUid("forceSelection"), function $CPComboBox__forceSelection(self, _cmd)
{
    return self._forceSelection;
}
,["BOOL"]), new objj_method(sel_getUid("setForceSelection:"), function $CPComboBox__setForceSelection_(self, _cmd, flag)
{
    self._forceSelection = !!flag;
}
,["void","BOOL"]), new objj_method(sel_getUid("sendAction:to:"), function $CPComboBox__sendAction_to_(self, _cmd, anAction, anObject)
{
    if (objj_msgSend(self, "listIsVisible"))
    {
        objj_msgSend(self, "takeStringValueFromList");
        objj_msgSend(self._listDelegate, "close");
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "sendAction:to:", anAction, anObject);
}
,["BOOL","SEL","id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPComboBox__setObjectValue_(self, _cmd, object)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "setObjectValue:", object);
    self._selectedStringValue = objj_msgSend(self, "stringValue");
}
,["void","id"]), new objj_method(sel_getUid("interpretKeyEvents:"), function $CPComboBox__interpretKeyEvents_(self, _cmd, events)
{
    var theEvent = events[0];
    self._canComplete = NO;
    if (self._completes)
    {
        if (!objj_msgSend(theEvent, "_couldBeKeyEquivalent") && objj_msgSend(theEvent, "characters").charAt(0) !== CPDeleteCharacter)
        {
            var value = objj_msgSend(self, "_inputElement").value,
                selectedRange = objj_msgSend(self, "selectedRange");
            self._canComplete = CPMaxRange(selectedRange) === value.length;
        }
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "interpretKeyEvents:", events);
}
,["void","CPArray"]), new objj_method(sel_getUid("paste:"), function $CPComboBox__paste_(self, _cmd, sender)
{
    if (self._completes)
    {
        var value = objj_msgSend(self, "_inputElement").value,
            selectedRange = objj_msgSend(self, "selectedRange");
        self._canComplete = CPMaxRange(selectedRange) === value.length;
    }
    else
        self._canComplete = NO;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "paste:", sender);
}
,["void","id"]), new objj_method(sel_getUid("textDidChange:"), function $CPComboBox__textDidChange_(self, _cmd, aNotification)
{
    var uncompletedString = objj_msgSend(self, "stringValue"),
        newString = uncompletedString;
    if (self._completes && self._canComplete)
    {
        newString = objj_msgSend(self, "completedString:", uncompletedString);
        if (newString && newString.length > uncompletedString.length)
        {
            objj_msgSend(self, "setStringValue:", newString);
            objj_msgSend(self, "setSelectedRange:", CPMakeRange(uncompletedString.length, newString.length - uncompletedString.length));
        }
    }
    objj_msgSend(self, "_selectMatchingItem");
    self._canComplete = NO;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "textDidChange:", aNotification);
}
,["void","CPNotification"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $CPComboBox__performKeyEquivalent_(self, _cmd, anEvent)
{
    if (objj_msgSend(objj_msgSend(self, "window"), "firstResponder") === self)
    {
        var key = objj_msgSend(anEvent, "charactersIgnoringModifiers");
        switch(key) {
        case CPDownArrowFunctionKey:
            if (!objj_msgSend(self, "listIsVisible"))
            {
                objj_msgSend(self, "popUpList");
                return YES;
            }
            break;
        case CPEscapeFunctionKey:
            if (objj_msgSend(self, "listIsVisible"))
            {
                if (self._forceSelection && objj_msgSend(self, "_inputElement").value !== self._selectedStringValue)
                    objj_msgSend(self, "setStringValue:", self._selectedStringValue);
            }
            break;
        }
        if (objj_msgSend(self._listDelegate, "performKeyEquivalent:", anEvent))
            return YES;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "performKeyEquivalent:", anEvent);
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPComboBox__resignFirstResponder(self, _cmd)
{
    var buttonCausedResign = self._popUpButtonCausedResign;
    self._popUpButtonCausedResign = NO;
    var shouldResign = !buttonCausedResign && (!self._listDelegate || objj_msgSend(self._listDelegate, "controllingViewShouldResign"));
    if (!shouldResign)
    {
        var element = objj_msgSend(self, "_inputElement");
        window.setTimeout(function()
        {
            element.focus();
        }, 0);
        return NO;
    }
    objj_msgSend(self._listDelegate, "close");
    var value = objj_msgSend(self, "stringValue");
    if (value)
    {
        if (self._forceSelection && !objj_msgSend(value, "isEqual:", self._selectedStringValue))
            objj_msgSend(self, "setStringValue:", self._selectedStringValue);
    }
    else
        self._selectedStringValue = "";
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "resignFirstResponder");
}
,["BOOL"]), new objj_method(sel_getUid("setFont:"), function $CPComboBox__setFont_(self, _cmd, aFont)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "setFont:", aFont);
    objj_msgSend(self._listDelegate, "setFont:", aFont);
}
,["void","CPFont"]), new objj_method(sel_getUid("setAlignment:"), function $CPComboBox__setAlignment_(self, _cmd, alignment)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "setAlignment:", alignment);
    objj_msgSend(self._listDelegate, "setAlignment:", alignment);
}
,["void","CPTextAlignment"]), new objj_method(sel_getUid("popupButtonRectForBounds:"), function $CPComboBox__popupButtonRectForBounds_(self, _cmd, bounds)
{
    var borderInset = objj_msgSend(self, "currentValueForThemeAttribute:", "border-inset"),
        buttonSize = objj_msgSend(self, "currentValueForThemeAttribute:", "popup-button-size");
    bounds.origin.x = CGRectGetMaxX(bounds) - borderInset.right - buttonSize.width;
    bounds.origin.y += borderInset.top;
    bounds.size.width = buttonSize.width;
    bounds.size.height = buttonSize.height;
    return bounds;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPComboBox__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "popup-button-view")
        return objj_msgSend(self, "popupButtonRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPComboBox__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "popup-button-view")
    {
        var view = objj_msgSend(objj_msgSend(_CPComboBoxPopUpButton, "alloc"), "initWithFrame:comboBox:", CGRectMakeZero(), self);
        return view;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "createEphemeralSubviewNamed:", aName);
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPComboBox__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "layoutSubviews");
    var popupButtonView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "popup-button-view", CPWindowAbove, "content-view");
}
,["void"]), new objj_method(sel_getUid("_dataSourceWarningForMethod:condition:"), function $CPComboBox___dataSourceWarningForMethod_condition_(self, _cmd, cmd, flag)
{
    CPLog.warn("-[%s %s] should not be called when usesDataSource is set to %s", objj_msgSend(self, "className"), cmd, flag ? "YES" : "NO");
}
,["void","SEL","CPString"]), new objj_method(sel_getUid("_selectMatchingItem"), function $CPComboBox___selectMatchingItem(self, _cmd)
{
    var index = CPNotFound,
        stringValue = objj_msgSend(self, "stringValue");
    if (self._usesDataSource)
    {
        if (self._dataSource && objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("comboBox:indexOfItemWithStringValue:")))
            index = objj_msgSend(self._dataSource, "comboBox:indexOfItemWithStringValue:", self, stringValue);
    }
    else
        index = objj_msgSend(self, "indexOfItemWithObjectValue:", stringValue);
    objj_msgSend(self._listDelegate, "selectRow:", index);
    if (index !== CPNotFound)
    {
        objj_msgSend(self._listDelegate, "scrollItemAtIndexToTop:", index);
        self._selectedStringValue = stringValue;
    }
}
,["void"]), new objj_method(sel_getUid("_borderFrame"), function $CPComboBox___borderFrame(self, _cmd)
{
    var inset = objj_msgSend(self, "currentValueForThemeAttribute:", "border-inset"),
        frame = objj_msgSend(self, "bounds");
    frame.origin.x += inset.left;
    frame.origin.y += inset.top;
    frame.size.width -= inset.left + inset.right;
    frame.size.height -= inset.top + inset.bottom;
    return frame;
}
,["CGRect"]), new objj_method(sel_getUid("_popUpButtonWasClicked"), function $CPComboBox___popUpButtonWasClicked(self, _cmd)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    var firstResponder = objj_msgSend(objj_msgSend(self, "window"), "firstResponder");
    self._popUpButtonCausedResign = firstResponder === self;
    if (objj_msgSend(self, "listIsVisible"))
        objj_msgSend(self._listDelegate, "close");
    else
    {
        if (firstResponder !== self)
            objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
        objj_msgSend(self, "popUpList");
    }
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPComboBox__defaultThemeClass(self, _cmd)
{
    return "combobox";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPComboBox__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CGSizeMake(21.0, 29.0), "popup-button-size", CGInsetMake(3.0, 3.0, 3.0, 3.0), "border-inset");
}
,["CPDictionary"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPComboBox___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPContentBinding || aBinding === CPContentValuesBinding)
        return objj_msgSend(_CPComboBoxContentBinder, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPComboBox").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("comboBoxSelectionIsChanging:"), function $CPComboBox__comboBoxSelectionIsChanging_(self, _cmd, aNotification)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPComboBoxSelectionIsChangingNotification, self);
}
,["void","CPNotification"]), new objj_method(sel_getUid("comboBoxSelectionDidChange:"), function $CPComboBox__comboBoxSelectionDidChange_(self, _cmd, aNotification)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPComboBoxSelectionDidChangeNotification, self);
}
,["void","CPNotification"]), new objj_method(sel_getUid("comboBoxWillPopUp:"), function $CPComboBox__comboBoxWillPopUp_(self, _cmd, aNotification)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPComboBoxWillPopUpNotification, self);
}
,["void","CPNotification"]), new objj_method(sel_getUid("comboBoxWillDismiss:"), function $CPComboBox__comboBoxWillDismiss_(self, _cmd, aNotification)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPComboBoxWillDismissNotification, self);
}
,["void","CPNotification"])]);
}{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("comboBoxCompletedString:"), function $CPComboBox__comboBoxCompletedString_(self, _cmd, uncompletedString)
{
    if (objj_msgSend(self._dataSource, "respondsToSelector:", sel_getUid("comboBox:completedString:")))
        return objj_msgSend(self._dataSource, "comboBox:completedString:", self, uncompletedString);
    else
        return nil;
}
,["CPString","CPString"])]);
}{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("numberOfItemsInList:"), function $CPComboBox__numberOfItemsInList_(self, _cmd, aList)
{
    return objj_msgSend(self, "numberOfItems");
}
,["int","_CPPopUpList"]), new objj_method(sel_getUid("numberOfVisibleItemsInList:"), function $CPComboBox__numberOfVisibleItemsInList_(self, _cmd, aList)
{
    return objj_msgSend(self, "numberOfVisibleItems");
}
,["int","_CPPopUpList"]), new objj_method(sel_getUid("list:objectValueForItemAtIndex:"), function $CPComboBox__list_objectValueForItemAtIndex_(self, _cmd, aList, index)
{
    if (self._usesDataSource)
        return objj_msgSend(self._dataSource, "comboBox:objectValueForItemAtIndex:", self, index);
    else
        return self._items[index];
}
,["id","_CPPopUpList","int"]), new objj_method(sel_getUid("list:displayValueForObjectValue:"), function $CPComboBox__list_displayValueForObjectValue_(self, _cmd, aList, aValue)
{
    return aValue || "";
}
,["id","_CPPopUpList","id"]), new objj_method(sel_getUid("list:stringValueForObjectValue:"), function $CPComboBox__list_stringValueForObjectValue_(self, _cmd, aList, aValue)
{
    return String(aValue);
}
,["CPString","_CPPopUpList","id"])]);
}{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setContentValues:"), function $CPComboBox__setContentValues_(self, _cmd, anArray)
{
    objj_msgSend(self, "setUsesDataSource:", NO);
    objj_msgSend(self, "removeAllItems");
    objj_msgSend(self, "addItemsWithObjectValues:", anArray);
}
,["void","CPArray"]), new objj_method(sel_getUid("setContent:"), function $CPComboBox__setContent_(self, _cmd, anArray)
{
    objj_msgSend(self, "setUsesDataSource:", NO);
    self._items = [];
    var values = [];
    objj_msgSend(anArray, "enumerateObjectsUsingBlock:", function(object)
    {
        values.push(objj_msgSend(object, "description"));
    });
    objj_msgSend(self, "addItemsWithObjectValues:", values);
}
,["void","CPArray"])]);
}var CPComboBoxItemsKey = "CPComboBoxItemsKey",
    CPComboBoxListKey = "CPComboBoxListKey",
    CPComboBoxDelegateKey = "CPComboBoxDelegateKey",
    CPComboBoxDataSourceKey = "CPComboBoxDataSourceKey",
    CPComboBoxUsesDataSourceKey = "CPComboBoxUsesDataSourceKey",
    CPComboBoxCompletesKey = "CPComboBoxCompletesKey",
    CPComboBoxNumberOfVisibleItemsKey = "CPComboBoxNumberOfVisibleItemsKey",
    CPComboBoxHasVerticalScrollerKey = "CPComboBoxHasVerticalScrollerKey",
    CPComboBoxButtonBorderedKey = "CPComboBoxButtonBorderedKey";
{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPComboBox__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "_initComboBox");
        self._items = objj_msgSend(aCoder, "decodeObjectForKey:", CPComboBoxItemsKey);
        self._listDelegate = objj_msgSend(aCoder, "decodeObjectForKey:", CPComboBoxListKey);
        self._delegate = objj_msgSend(aCoder, "decodeObjectForKey:", CPComboBoxDelegateKey);
        self._dataSource = objj_msgSend(aCoder, "decodeObjectForKey:", CPComboBoxDataSourceKey);
        self._usesDataSource = objj_msgSend(aCoder, "decodeBoolForKey:", CPComboBoxUsesDataSourceKey);
        self._completes = objj_msgSend(aCoder, "decodeBoolForKey:", CPComboBoxCompletesKey);
        self._numberOfVisibleItems = objj_msgSend(aCoder, "decodeIntForKey:", CPComboBoxNumberOfVisibleItemsKey);
        self._hasVerticalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", CPComboBoxHasVerticalScrollerKey);
        objj_msgSend(self, "setButtonBordered:", objj_msgSend(aCoder, "decodeBoolForKey:", CPComboBoxButtonBorderedKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPComboBox__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._items, CPComboBoxItemsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._listDelegate, CPComboBoxListKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._delegate, CPComboBoxDelegateKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._dataSource, CPComboBoxDataSourceKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._usesDataSource, CPComboBoxUsesDataSourceKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._completes, CPComboBoxCompletesKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._numberOfVisibleItems, CPComboBoxNumberOfVisibleItemsKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._hasVerticalScroller, CPComboBoxHasVerticalScrollerKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", objj_msgSend(self, "isButtonBordered"), CPComboBoxButtonBorderedKey);
}
,["void","CPCoder"])]);
}var CPComboBoxCompletionTest = function(object, index, context)
{
    return (object.toString()).indexOf(context) === 0;
};
{var the_class = objj_allocateClassPair(CPBinder, "_CPComboBoxContentBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPComboBoxContentBinder__setValueFor_(self, _cmd, aBinding)
{
    var destination = objj_msgSend(self._info, "objectForKey:", CPObservedObjectKey),
        keyPath = objj_msgSend(self._info, "objectForKey:", CPObservedKeyPathKey),
        options = objj_msgSend(self._info, "objectForKey:", CPOptionsKey),
        newValue = objj_msgSend(destination, "valueForKeyPath:", keyPath),
        isPlaceholder = CPIsControllerMarker(newValue);
    objj_msgSend(self._source, "removeAllItems");
    if (isPlaceholder)
    {
        switch(newValue) {
        case CPMultipleValuesMarker:
            newValue = objj_msgSend(options, "objectForKey:", CPMultipleValuesPlaceholderBindingOption) || [];
            break;
        case CPNoSelectionMarker:
            newValue = objj_msgSend(options, "objectForKey:", CPNoSelectionPlaceholderBindingOption) || [];
            break;
        case CPNotApplicableMarker:
            if (objj_msgSend(options, "objectForKey:", CPRaisesForNotApplicableKeysBindingOption))
                objj_msgSend(CPException, "raise:reason:", CPGenericException, "can't transform non applicable key on: " + self._source + " value: " + newValue);
            newValue = objj_msgSend(options, "objectForKey:", CPNotApplicablePlaceholderBindingOption) || [];
            break;
        case CPNullMarker:
            newValue = objj_msgSend(options, "objectForKey:", CPNullPlaceholderBindingOption) || [];
            break;
        }
        if (!objj_msgSend(newValue, "isKindOfClass:", objj_msgSend(CPArray, "class")))
            newValue = [];
    }
    else
        newValue = objj_msgSend(self, "transformValue:withOptions:", newValue, options);
    switch(aBinding) {
    case CPContentBinding:
        objj_msgSend(self._source, "setContent:", newValue);
        break;
    case CPContentValuesBinding:
        objj_msgSend(self._source, "setContentValues:", newValue);
        break;
    }
}
,["void","CPString"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPComboBoxPopUpButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_comboBox")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:comboBox:"), function $_CPComboBoxPopUpButton__initWithFrame_comboBox_(self, _cmd, aFrame, aComboBox)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPComboBoxPopUpButton").super_class }, "initWithFrame:", aFrame);
    if (self)
        self._comboBox = aComboBox;
    return self;
}
,["id","CGRect","CPComboBox"]), new objj_method(sel_getUid("mouseDown:"), function $_CPComboBoxPopUpButton__mouseDown_(self, _cmd, theEvent)
{
    objj_msgSend(self._comboBox, "_popUpButtonWasClicked");
}
,["void","CPEvent"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $_CPComboBoxPopUpButton__acceptsFirstResponder(self, _cmd)
{
    return NO;
}
,["BOOL"])]);
}