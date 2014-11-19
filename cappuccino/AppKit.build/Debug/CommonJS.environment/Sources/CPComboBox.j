@STATIC;1.0;i;8;CPText.ji;13;CPTextField.ji;14;_CPPopUpList.jt;51905;objj_executeFile("CPText.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("_CPPopUpList.j", YES);{var the_protocol = objj_allocateProtocol("CPComboBoxDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPComboBoxDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}{var the_protocol = objj_allocateProtocol("CPComboBoxDataSource");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPComboBoxDataSource\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}CPComboBoxSelectionDidChangeNotification = "CPComboBoxSelectionDidChangeNotification";
CPComboBoxSelectionIsChangingNotification = "CPComboBoxSelectionIsChangingNotification";
CPComboBoxWillDismissNotification = "CPComboBoxWillDismissNotification";
CPComboBoxWillPopUpNotification = "CPComboBoxWillPopUpNotification";
CPComboBoxStateButtonBordered = CPThemeState("button-bordered");
var CPComboBoxTextSubview = "text",
    CPComboBoxButtonSubview = "button",
    CPComboBoxDefaultNumberOfVisibleItems = 5,
    CPComboBoxFocusRingWidth = -1;
{var the_class = objj_allocateClassPair(CPTextField, "CPComboBox"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_items"), new objj_ivar("_listDelegate"), new objj_ivar("_dataSource"), new objj_ivar("_usesDataSource"), new objj_ivar("_completes"), new objj_ivar("_canComplete"), new objj_ivar("_numberOfVisibleItems"), new objj_ivar("_forceSelection"), new objj_ivar("_hasVerticalScroller"), new objj_ivar("_selectedStringValue"), new objj_ivar("_intercellSpacing"), new objj_ivar("_itemHeight"), new objj_ivar("_popUpButtonCausedResign")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPComboBox__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "initWithFrame:", aFrame);
    if (self)
        (self == null ? null : self.isa.objj_msgSend0(self, "_initComboBox"));
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_initComboBox"), function $CPComboBox___initComboBox(self, _cmd)
{
    self._items = CPArray.isa.objj_msgSend0(CPArray, "array");
    self._usesDataSource = NO;
    self._completes = NO;
    self._canComplete = NO;
    self._numberOfVisibleItems = CPComboBoxDefaultNumberOfVisibleItems;
    self._forceSelection = NO;
    self._hasVerticalScroller = YES;
    self._selectedStringValue = "";
    self._popUpButtonCausedResign = NO;
    self.isa.objj_msgSend1(self, "setTheme:", CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme"));
    self.isa.objj_msgSend1(self, "setBordered:", YES);
    self.isa.objj_msgSend1(self, "setBezeled:", YES);
    self.isa.objj_msgSend1(self, "setEditable:", YES);
    self.isa.objj_msgSend1(self, "setThemeState:", CPComboBoxStateButtonBordered);
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
    if (self._listDelegate)
        ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "scrollView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHasVerticalScroller:", self._hasVerticalScroller));
    var ___r1, ___r2;
}
,["void","BOOL"]), new objj_method(sel_getUid("intercellSpacing"), function $CPComboBox__intercellSpacing(self, _cmd)
{
    return ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "intercellSpacing"));
    var ___r1, ___r2;
}
,["CGSize"]), new objj_method(sel_getUid("setIntercellSpacing:"), function $CPComboBox__setIntercellSpacing_(self, _cmd, aSize)
{
    if (self._intercellSpacing && CGSizeEqualToSize(aSize, self._intercellSpacing))
        return;
    self._intercellSpacing = aSize;
    if (self._listDelegate)
        ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setIntercellSpacing:", self._intercellSpacing));
    var ___r1, ___r2;
}
,["void","CGSize"]), new objj_method(sel_getUid("isButtonBordered"), function $CPComboBox__isButtonBordered(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "hasThemeState:", CPComboBoxStateButtonBordered);
}
,["BOOL"]), new objj_method(sel_getUid("setButtonBordered:"), function $CPComboBox__setButtonBordered_(self, _cmd, flag)
{
    if (!!flag)
        self.isa.objj_msgSend1(self, "setThemeState:", CPComboBoxStateButtonBordered);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPComboBoxStateButtonBordered);
}
,["void","BOOL"]), new objj_method(sel_getUid("itemHeight"), function $CPComboBox__itemHeight(self, _cmd)
{
    return ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowHeight"));
    var ___r1, ___r2;
}
,["float"]), new objj_method(sel_getUid("setItemHeight:"), function $CPComboBox__setItemHeight_(self, _cmd, itemHeight)
{
    if (itemHeight === self._itemHeight)
        return;
    self._itemHeight = itemHeight;
    if (self._listDelegate)
    {
        ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setRowHeight:", self._itemHeight));
        ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    }
    var ___r1, ___r2;
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
    var delegate = self.isa.objj_msgSend0(self, "delegate");
    if (aDelegate === delegate)
        return;
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (delegate)
    {
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", delegate, CPComboBoxSelectionIsChangingNotification, self));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", delegate, CPComboBoxSelectionDidChangeNotification, self));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", delegate, CPComboBoxWillDismissNotification, self));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", delegate, CPComboBoxWillPopUpNotification, self));
    }
    if (aDelegate)
    {
        if ((aDelegate == null ? null : aDelegate.isa.objj_msgSend1(aDelegate, "respondsToSelector:", sel_getUid("comboBoxSelectionIsChanging:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", delegate, sel_getUid("comboBoxSelectionIsChanging:"), CPComboBoxSelectionIsChangingNotification, self));
        if ((aDelegate == null ? null : aDelegate.isa.objj_msgSend1(aDelegate, "respondsToSelector:", sel_getUid("comboBoxSelectionDidChange:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", delegate, sel_getUid("comboBoxSelectionDidChange:"), CPComboBoxSelectionDidChangeNotification, self));
        if ((aDelegate == null ? null : aDelegate.isa.objj_msgSend1(aDelegate, "respondsToSelector:", sel_getUid("comboBoxWillPopUp:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", delegate, sel_getUid("comboBoxWillPopUp:"), CPComboBoxWillPopUpNotification, self));
        if ((aDelegate == null ? null : aDelegate.isa.objj_msgSend1(aDelegate, "respondsToSelector:", sel_getUid("comboBoxWillDismiss:"))))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", delegate, sel_getUid("comboBoxWillDissmis:"), CPComboBoxWillDismissNotification, self));
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "setDelegate:", aDelegate);
}
,["void","id"]), new objj_method(sel_getUid("dataSource"), function $CPComboBox__dataSource(self, _cmd)
{
    if (!self._usesDataSource)
        self.isa.objj_msgSend2(self, "_dataSourceWarningForMethod:condition:", _cmd, NO);
    return self._dataSource;
}
,["id"]), new objj_method(sel_getUid("setDataSource:"), function $CPComboBox__setDataSource_(self, _cmd, aSource)
{
    if (!self._usesDataSource)
    {
        self.isa.objj_msgSend2(self, "_dataSourceWarningForMethod:condition:", _cmd, NO);
    }
    else if (self._dataSource !== aSource)
    {
        if (!(aSource == null ? null : aSource.isa.objj_msgSend1(aSource, "respondsToSelector:", sel_getUid("numberOfItemsInComboBox:"))) || !(aSource == null ? null : aSource.isa.objj_msgSend1(aSource, "respondsToSelector:", sel_getUid("comboBox:objectValueForItemAtIndex:"))))
        {
            CPLog.warn("Illegal %s data source (%s). Must implement numberOfItemsInComboBox: and comboBox:objectValueForItemAtIndex:", self.isa.objj_msgSend0(self, "className"), (aSource == null ? null : aSource.isa.objj_msgSend0(aSource, "description")));
        }
        else
        {
            self._dataSource = aSource;
        }
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
        ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    self.isa.objj_msgSend0(self, "reloadData");
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("addItemsWithObjectValues:"), function $CPComboBox__addItemsWithObjectValues_(self, _cmd, objects)
{
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObjectsFromArray:", objects));
    self.isa.objj_msgSend1(self, "reloadDataSourceForSelector:", _cmd);
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("addItemWithObjectValue:"), function $CPComboBox__addItemWithObjectValue_(self, _cmd, anObject)
{
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", anObject));
    self.isa.objj_msgSend1(self, "reloadDataSourceForSelector:", _cmd);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("insertItemWithObjectValue:atIndex:"), function $CPComboBox__insertItemWithObjectValue_atIndex_(self, _cmd, anObject, anIndex)
{
    if (self._usesDataSource)
        self.isa.objj_msgSend2(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", anObject, anIndex));
    self.isa.objj_msgSend0(self, "reloadData");
    var ___r1;
}
,["void","id","int"]), new objj_method(sel_getUid("objectValues"), function $CPComboBox__objectValues(self, _cmd)
{
    if (self._usesDataSource)
        self.isa.objj_msgSend2(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
    return self._items;
}
,["CPArray"]), new objj_method(sel_getUid("removeAllItems"), function $CPComboBox__removeAllItems(self, _cmd)
{
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    self.isa.objj_msgSend1(self, "reloadDataSourceForSelector:", _cmd);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("removeItemAtIndex:"), function $CPComboBox__removeItemAtIndex_(self, _cmd, index)
{
    if (self._usesDataSource)
        self.isa.objj_msgSend2(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", index));
    self.isa.objj_msgSend0(self, "reloadData");
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("removeItemWithObjectValue:"), function $CPComboBox__removeItemWithObjectValue_(self, _cmd, anObject)
{
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", anObject));
    self.isa.objj_msgSend1(self, "reloadDataSourceForSelector:", _cmd);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("numberOfItems"), function $CPComboBox__numberOfItems(self, _cmd)
{
    if (self._usesDataSource)
        return ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfItemsInComboBox:", self));
    else
        return self._items.length;
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("listDelegate"), function $CPComboBox__listDelegate(self, _cmd)
{
    return self._listDelegate;
}
,["_CPPopUpList"]), new objj_method(sel_getUid("setListDelegate:"), function $CPComboBox__setListDelegate_(self, _cmd, aDelegate)
{
    if (self._listDelegate === aDelegate)
        return;
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (self._listDelegate)
    {
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, _CPPopUpListWillPopUpNotification, self._listDelegate));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, _CPPopUpListWillDismissNotification, self._listDelegate));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, _CPPopUpListDidDismissNotification, self._listDelegate));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, _CPPopUpListItemWasClickedNotification, self._listDelegate));
        var oldTableView = ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tableView"));
        if (oldTableView)
        {
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPTableViewSelectionIsChangingNotification, oldTableView));
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPTableViewSelectionDidChangeNotification, oldTableView));
        }
    }
    self._listDelegate = aDelegate;
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("comboBoxWillPopUp:"), _CPPopUpListWillPopUpNotification, self._listDelegate));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("comboBoxWillDismiss:"), _CPPopUpListWillDismissNotification, self._listDelegate));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("listDidDismiss:"), _CPPopUpListDidDismissNotification, self._listDelegate));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("itemWasClicked:"), _CPPopUpListItemWasClickedNotification, self._listDelegate));
    ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "scrollView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHasVerticalScroller:", self._hasVerticalScroller));
    var tableView = ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tableView"));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("comboBoxSelectionIsChanging:"), CPTableViewSelectionIsChangingNotification, tableView));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("comboBoxSelectionDidChange:"), CPTableViewSelectionDidChangeNotification, tableView));
    ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", self.isa.objj_msgSend0(self, "font")));
    ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlignment:", self.isa.objj_msgSend0(self, "alignment")));
    ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "scrollView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHasVerticalScroller:", self._hasVerticalScroller));
    ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setIntercellSpacing:", self._intercellSpacing));
    ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setRowHeight:", self._itemHeight));
    var ___r1, ___r2;
}
,["void","_CPPopUpList"]), new objj_method(sel_getUid("indexOfItemWithObjectValue:"), function $CPComboBox__indexOfItemWithObjectValue_(self, _cmd, anObject)
{
    if (self._usesDataSource)
        self.isa.objj_msgSend2(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", anObject));
    var ___r1;
}
,["int","id"]), new objj_method(sel_getUid("itemObjectValueAtIndex:"), function $CPComboBox__itemObjectValueAtIndex_(self, _cmd, index)
{
    if (self._usesDataSource)
        self.isa.objj_msgSend2(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", index));
    var ___r1;
}
,["id","int"]), new objj_method(sel_getUid("noteNumberOfItemsChanged"), function $CPComboBox__noteNumberOfItemsChanged(self, _cmd)
{
    ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "noteNumberOfRowsChanged"));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("scrollItemAtIndexToTop:"), function $CPComboBox__scrollItemAtIndexToTop_(self, _cmd, index)
{
    ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollItemAtIndexToTop:", index));
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("scrollItemAtIndexToVisible:"), function $CPComboBox__scrollItemAtIndexToVisible_(self, _cmd, index)
{
    ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollRowToVisible:", index));
    var ___r1, ___r2;
}
,["void","int"]), new objj_method(sel_getUid("reloadData"), function $CPComboBox__reloadData(self, _cmd)
{
    ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("popUpList"), function $CPComboBox__popUpList(self, _cmd)
{
    if (!self._listDelegate)
        self.isa.objj_msgSend1(self, "setListDelegate:", ((___r1 = _CPPopUpList.isa.objj_msgSend0(_CPPopUpList, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithDataSource:", self)));
    self.isa.objj_msgSend0(self, "_selectMatchingItem");
    if (CPComboBoxFocusRingWidth < 0)
    {
        var inset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "border-inset");
        CPComboBoxFocusRingWidth = inset.bottom;
    }
    ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "popUpRelativeToRect:view:offset:", self.isa.objj_msgSend0(self, "_borderFrame"), self, CPComboBoxFocusRingWidth - 1));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("listIsVisible"), function $CPComboBox__listIsVisible(self, _cmd)
{
    return self._listDelegate ? ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible")) : NO;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("reloadDataSourceForSelector:"), function $CPComboBox__reloadDataSourceForSelector_(self, _cmd, cmd)
{
    if (self._usesDataSource)
        self.isa.objj_msgSend2(self, "_dataSourceWarningForMethod:condition:", cmd, YES);
    else
        self.isa.objj_msgSend0(self, "reloadData");
}
,["void","SEL"]), new objj_method(sel_getUid("takeStringValueFromList"), function $CPComboBox__takeStringValueFromList(self, _cmd)
{
    if (self._usesDataSource && self._dataSource && ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "numberOfItemsInComboBox:", self)) === 0)
        return NO;
    var selectedStringValue = ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedStringValue"));
    if (selectedStringValue === nil)
        return NO;
    else
        self._selectedStringValue = selectedStringValue;
    self.isa.objj_msgSend1(self, "setStringValue:", self._selectedStringValue);
    self.isa.objj_msgSend0(self, "_reverseSetBinding");
    return YES;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("listDidDismiss:"), function $CPComboBox__listDidDismiss_(self, _cmd, aNotification)
{
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("itemWasClicked:"), function $CPComboBox__itemWasClicked_(self, _cmd, aNotification)
{
    self.isa.objj_msgSend0(self, "takeStringValueFromList");
    self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
}
,["void","CPNotification"]), new objj_method(sel_getUid("deselectItemAtIndex:"), function $CPComboBox__deselectItemAtIndex_(self, _cmd, index)
{
    var table = ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tableView")),
        row = (table == null ? null : table.isa.objj_msgSend0(table, "selectedRow"));
    if (row !== index)
        return;
    (table == null ? null : table.isa.objj_msgSend1(table, "deselectRow:", index));
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("indexOfSelectedItem"), function $CPComboBox__indexOfSelectedItem(self, _cmd)
{
    return ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow"));
    var ___r1, ___r2;
}
,["int"]), new objj_method(sel_getUid("objectValueOfSelectedItem"), function $CPComboBox__objectValueOfSelectedItem(self, _cmd)
{
    var row = ((___r1 = ((___r2 = self._listDelegate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow"));
    if (row >= 0)
    {
        if (self._usesDataSource)
            self.isa.objj_msgSend2(self, "_dataSourceWarningForMethod:condition:", _cmd, YES);
        return self._items[row];
    }
    return nil;
    var ___r1, ___r2;
}
,["id"]), new objj_method(sel_getUid("selectItemAtIndex:"), function $CPComboBox__selectItemAtIndex_(self, _cmd, index)
{
    var table = ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tableView")),
        row = (table == null ? null : table.isa.objj_msgSend0(table, "selectedRow"));
    if (row === index)
        return;
    (table == null ? null : table.isa.objj_msgSend2(table, "selectRowIndexes:byExtendingSelection:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", index), NO));
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("selectItemWithObjectValue:"), function $CPComboBox__selectItemWithObjectValue_(self, _cmd, anObject)
{
    var index = self.isa.objj_msgSend1(self, "indexOfItemWithObjectValue:", anObject);
    if (index !== CPNotFound)
        self.isa.objj_msgSend1(self, "selectItemAtIndex:", index);
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
        return self.isa.objj_msgSend1(self, "comboBoxCompletedString:", substring);
    else
    {
        var index = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "indexOfObjectPassingTest:context:", CPComboBoxCompletionTest, substring));
        return index !== CPNotFound ? self._items[index] : nil;
    }
    var ___r1;
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
    if (self.isa.objj_msgSend0(self, "listIsVisible"))
    {
        self.isa.objj_msgSend0(self, "takeStringValueFromList");
        ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "close"));
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "sendAction:to:", anAction, anObject);
    var ___r1;
}
,["BOOL","SEL","id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPComboBox__setObjectValue_(self, _cmd, object)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "setObjectValue:", object);
    self._selectedStringValue = self.isa.objj_msgSend0(self, "stringValue");
}
,["void","id"]), new objj_method(sel_getUid("interpretKeyEvents:"), function $CPComboBox__interpretKeyEvents_(self, _cmd, events)
{
    var theEvent = events[0];
    self._canComplete = NO;
    if (self._completes)
    {
        if (!(theEvent == null ? null : theEvent.isa.objj_msgSend0(theEvent, "_couldBeKeyEquivalent")) && (theEvent == null ? null : theEvent.isa.objj_msgSend0(theEvent, "characters")).charAt(0) !== CPDeleteCharacter)
        {
            var value = self.isa.objj_msgSend0(self, "_inputElement").value,
                selectedRange = self.isa.objj_msgSend0(self, "selectedRange");
            self._canComplete = CPMaxRange(selectedRange) === value.length;
        }
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "interpretKeyEvents:", events);
}
,["void","CPArray"]), new objj_method(sel_getUid("paste:"), function $CPComboBox__paste_(self, _cmd, sender)
{
    if (self._completes)
    {
        var value = self.isa.objj_msgSend0(self, "_inputElement").value,
            selectedRange = self.isa.objj_msgSend0(self, "selectedRange");
        self._canComplete = CPMaxRange(selectedRange) === value.length;
    }
    else
        self._canComplete = NO;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "paste:", sender);
}
,["void","id"]), new objj_method(sel_getUid("textDidChange:"), function $CPComboBox__textDidChange_(self, _cmd, aNotification)
{
    var uncompletedString = self.isa.objj_msgSend0(self, "stringValue"),
        newString = uncompletedString;
    if (self._completes && self._canComplete)
    {
        newString = self.isa.objj_msgSend1(self, "completedString:", uncompletedString);
        if (newString && newString.length > uncompletedString.length)
        {
            self.isa.objj_msgSend1(self, "setStringValue:", newString);
            self.isa.objj_msgSend1(self, "setSelectedRange:", CPMakeRange(uncompletedString.length, newString.length - uncompletedString.length));
        }
    }
    self.isa.objj_msgSend0(self, "_selectMatchingItem");
    self._canComplete = NO;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "textDidChange:", aNotification);
}
,["void","CPNotification"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $CPComboBox__performKeyEquivalent_(self, _cmd, anEvent)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) === self)
    {
        var key = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers"));
        switch(key) {
        case CPDownArrowFunctionKey:
            if (!self.isa.objj_msgSend0(self, "listIsVisible"))
            {
                self.isa.objj_msgSend0(self, "popUpList");
                return YES;
            }
            break;
        case CPEscapeFunctionKey:
            if (self.isa.objj_msgSend0(self, "listIsVisible"))
            {
                if (self._forceSelection && self.isa.objj_msgSend0(self, "_inputElement").value !== self._selectedStringValue)
                    self.isa.objj_msgSend1(self, "setStringValue:", self._selectedStringValue);
            }
            break;
        }
        if (((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performKeyEquivalent:", anEvent)))
            return YES;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "performKeyEquivalent:", anEvent);
    var ___r1;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPComboBox__resignFirstResponder(self, _cmd)
{
    var buttonCausedResign = self._popUpButtonCausedResign;
    self._popUpButtonCausedResign = NO;
    var shouldResign = !buttonCausedResign && (!self._listDelegate || ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "controllingViewShouldResign")));
    if (!shouldResign)
    {
        return NO;
    }
    ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "close"));
    var value = self.isa.objj_msgSend0(self, "stringValue");
    if (value)
    {
        if (self._forceSelection && !(value == null ? null : value.isa.objj_msgSend1(value, "isEqual:", self._selectedStringValue)))
            self.isa.objj_msgSend1(self, "setStringValue:", self._selectedStringValue);
    }
    else
        self._selectedStringValue = "";
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "resignFirstResponder");
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("setFont:"), function $CPComboBox__setFont_(self, _cmd, aFont)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "setFont:", aFont);
    if (self._listDelegate)
        ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", aFont));
    var ___r1;
}
,["void","CPFont"]), new objj_method(sel_getUid("setAlignment:"), function $CPComboBox__setAlignment_(self, _cmd, alignment)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "setAlignment:", alignment);
    if (self._listDelegate)
        ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlignment:", alignment));
    var ___r1;
}
,["void","CPTextAlignment"]), new objj_method(sel_getUid("popupButtonRectForBounds:"), function $CPComboBox__popupButtonRectForBounds_(self, _cmd, bounds)
{
    var borderInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "border-inset"),
        buttonSize = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "popup-button-size");
    bounds.origin.x = CGRectGetMaxX(bounds) - borderInset.right - buttonSize.width;
    bounds.origin.y += borderInset.top;
    bounds.size.width = buttonSize.width;
    bounds.size.height = buttonSize.height;
    return bounds;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPComboBox__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "popup-button-view")
        return self.isa.objj_msgSend1(self, "popupButtonRectForBounds:", self.isa.objj_msgSend0(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPComboBox__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "popup-button-view")
    {
        var view = ((___r1 = (_CPComboBoxPopUpButton == null ? null : _CPComboBoxPopUpButton.isa.objj_msgSend0(_CPComboBoxPopUpButton, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithFrame:comboBox:", CGRectMakeZero(), self));
        return view;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "createEphemeralSubviewNamed:", aName);
    var ___r1;
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPComboBox__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "layoutSubviews");
    var popupButtonView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "popup-button-view", CPWindowAbove, "content-view");
}
,["void"]), new objj_method(sel_getUid("_dataSourceWarningForMethod:condition:"), function $CPComboBox___dataSourceWarningForMethod_condition_(self, _cmd, cmd, flag)
{
    CPLog.warn("-[%s %s] should not be called when usesDataSource is set to %s", self.isa.objj_msgSend0(self, "className"), cmd, flag ? "YES" : "NO");
}
,["void","SEL","CPString"]), new objj_method(sel_getUid("_selectMatchingItem"), function $CPComboBox___selectMatchingItem(self, _cmd)
{
    var index = CPNotFound,
        stringValue = self.isa.objj_msgSend0(self, "stringValue");
    if (self._usesDataSource)
    {
        if (self._dataSource && ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("comboBox:indexOfItemWithStringValue:"))))
            index = ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "comboBox:indexOfItemWithStringValue:", self, stringValue));
    }
    else
    {
        index = self.isa.objj_msgSend1(self, "indexOfItemWithObjectValue:", stringValue);
    }
    ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectRow:", index));
    if (index !== CPNotFound)
    {
        ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollItemAtIndexToTop:", index));
        self._selectedStringValue = stringValue;
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_borderFrame"), function $CPComboBox___borderFrame(self, _cmd)
{
    var inset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "border-inset"),
        frame = self.isa.objj_msgSend0(self, "bounds");
    frame.origin.x += inset.left;
    frame.origin.y += inset.top;
    frame.size.width -= inset.left + inset.right;
    frame.size.height -= inset.top + inset.bottom;
    return frame;
}
,["CGRect"]), new objj_method(sel_getUid("_popUpButtonWasClicked"), function $CPComboBox___popUpButtonWasClicked(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    var firstResponder = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder"));
    self._popUpButtonCausedResign = firstResponder === self;
    if (self.isa.objj_msgSend0(self, "listIsVisible"))
        ((___r1 = self._listDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "close"));
    else
    {
        if (firstResponder !== self)
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self));
        self.isa.objj_msgSend0(self, "popUpList");
    }
    var ___r1;
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
        return (_CPComboBoxContentBinder == null ? null : _CPComboBoxContentBinder.isa.objj_msgSend0(_CPComboBoxContentBinder, "class"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPComboBox").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("comboBoxSelectionIsChanging:"), function $CPComboBox__comboBoxSelectionIsChanging_(self, _cmd, aNotification)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPComboBoxSelectionIsChangingNotification, self));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("comboBoxSelectionDidChange:"), function $CPComboBox__comboBoxSelectionDidChange_(self, _cmd, aNotification)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPComboBoxSelectionDidChangeNotification, self));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("comboBoxWillPopUp:"), function $CPComboBox__comboBoxWillPopUp_(self, _cmd, aNotification)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPComboBoxWillPopUpNotification, self));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("comboBoxWillDismiss:"), function $CPComboBox__comboBoxWillDismiss_(self, _cmd, aNotification)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPComboBoxWillDismissNotification, self));
    var ___r1;
}
,["void","CPNotification"])]);
}{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("comboBoxCompletedString:"), function $CPComboBox__comboBoxCompletedString_(self, _cmd, uncompletedString)
{
    if (((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("comboBox:completedString:"))))
        return ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "comboBox:completedString:", self, uncompletedString));
    else
        return nil;
    var ___r1;
}
,["CPString","CPString"])]);
}{
var the_class = objj_getClass("CPComboBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("numberOfItemsInList:"), function $CPComboBox__numberOfItemsInList_(self, _cmd, aList)
{
    return self.isa.objj_msgSend0(self, "numberOfItems");
}
,["int","_CPPopUpList"]), new objj_method(sel_getUid("numberOfVisibleItemsInList:"), function $CPComboBox__numberOfVisibleItemsInList_(self, _cmd, aList)
{
    return self.isa.objj_msgSend0(self, "numberOfVisibleItems");
}
,["int","_CPPopUpList"]), new objj_method(sel_getUid("list:objectValueForItemAtIndex:"), function $CPComboBox__list_objectValueForItemAtIndex_(self, _cmd, aList, index)
{
    if (self._usesDataSource)
        return ((___r1 = self._dataSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "comboBox:objectValueForItemAtIndex:", self, index));
    else
        return self._items[index];
    var ___r1;
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
    self.isa.objj_msgSend1(self, "setUsesDataSource:", NO);
    self.isa.objj_msgSend0(self, "removeAllItems");
    self.isa.objj_msgSend1(self, "addItemsWithObjectValues:", anArray);
}
,["void","CPArray"]), new objj_method(sel_getUid("setContent:"), function $CPComboBox__setContent_(self, _cmd, anArray)
{
    self.isa.objj_msgSend1(self, "setUsesDataSource:", NO);
    self._items = [];
    var values = [];
    (anArray == null ? null : anArray.isa.objj_msgSend1(anArray, "enumerateObjectsUsingBlock:", function(object)
    {
        values.push((object == null ? null : object.isa.objj_msgSend0(object, "description")));
    }));
    self.isa.objj_msgSend1(self, "addItemsWithObjectValues:", values);
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
        (self == null ? null : self.isa.objj_msgSend0(self, "_initComboBox"));
        self._items = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPComboBoxItemsKey));
        self._listDelegate = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPComboBoxListKey));
        self._delegate = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPComboBoxDelegateKey));
        self._dataSource = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPComboBoxDataSourceKey));
        self._usesDataSource = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPComboBoxUsesDataSourceKey));
        self._completes = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPComboBoxCompletesKey));
        self._numberOfVisibleItems = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPComboBoxNumberOfVisibleItemsKey));
        self._hasVerticalScroller = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPComboBoxHasVerticalScrollerKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setButtonBordered:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPComboBoxButtonBorderedKey))));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPComboBox__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPComboBox").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._items, CPComboBoxItemsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._listDelegate, CPComboBoxListKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._delegate, CPComboBoxDelegateKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._dataSource, CPComboBoxDataSourceKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._usesDataSource, CPComboBoxUsesDataSourceKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._completes, CPComboBoxCompletesKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._numberOfVisibleItems, CPComboBoxNumberOfVisibleItemsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._hasVerticalScroller, CPComboBoxHasVerticalScrollerKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self.isa.objj_msgSend0(self, "isButtonBordered"), CPComboBoxButtonBorderedKey));
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
    var destination = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedObjectKey)),
        keyPath = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedKeyPathKey)),
        options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey)),
        newValue = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKeyPath:", keyPath)),
        isPlaceholder = CPIsControllerMarker(newValue);
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllItems"));
    if (isPlaceholder)
    {
        switch(newValue) {
        case CPMultipleValuesMarker:
            newValue = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPMultipleValuesPlaceholderBindingOption)) || [];
            break;
        case CPNoSelectionMarker:
            newValue = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPNoSelectionPlaceholderBindingOption)) || [];
            break;
        case CPNotApplicableMarker:
            if ((options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPRaisesForNotApplicableKeysBindingOption)))
                CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPGenericException, "can't transform non applicable key on: " + self._source + " value: " + newValue);
            newValue = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPNotApplicablePlaceholderBindingOption)) || [];
            break;
        case CPNullMarker:
            newValue = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPNullPlaceholderBindingOption)) || [];
            break;
        }
        if (!(newValue == null ? null : newValue.isa.objj_msgSend1(newValue, "isKindOfClass:", CPArray.isa.objj_msgSend0(CPArray, "class"))))
            newValue = [];
    }
    else
        newValue = self.isa.objj_msgSend2(self, "transformValue:withOptions:", newValue, options);
    switch(aBinding) {
    case CPContentBinding:
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContent:", newValue));
        break;
    case CPContentValuesBinding:
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContentValues:", newValue));
        break;
    }
    var ___r1;
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
    ((___r1 = self._comboBox), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_popUpButtonWasClicked"));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $_CPComboBoxPopUpButton__acceptsFirstResponder(self, _cmd)
{
    return NO;
}
,["BOOL"])]);
}