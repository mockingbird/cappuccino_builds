@STATIC;1.0;i;10;CPButton.ji;8;CPMenu.ji;12;CPMenuItem.ji;13;CPTextField.jt;34812;objj_executeFile("CPButton.j", YES);objj_executeFile("CPMenu.j", YES);objj_executeFile("CPMenuItem.j", YES);objj_executeFile("CPTextField.j", YES);CPSearchFieldRecentsTitleMenuItemTag = 1000;
CPSearchFieldRecentsMenuItemTag = 1001;
CPSearchFieldClearRecentsMenuItemTag = 1002;
CPSearchFieldNoRecentsMenuItemTag = 1003;
var CPAutosavedRecentsChangedNotification = "CPAutosavedRecentsChangedNotification";
var RECENT_SEARCH_PREFIX = "   ";
{var the_class = objj_allocateClassPair(CPTextField, "CPSearchField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_searchButton"), new objj_ivar("_cancelButton"), new objj_ivar("_searchMenuTemplate"), new objj_ivar("_searchMenu"), new objj_ivar("_recentsAutosaveName"), new objj_ivar("_recentSearches"), new objj_ivar("_maximumRecents"), new objj_ivar("_sendsWholeSearchString"), new objj_ivar("_sendsSearchStringImmediately"), new objj_ivar("_canResignFirstResponder"), new objj_ivar("_partialStringTimer")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPSearchField__initWithFrame_(self, _cmd, frame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "initWithFrame:", frame))
    {
        self._maximumRecents = 10;
        self._sendsWholeSearchString = NO;
        self._sendsSearchStringImmediately = NO;
        self._recentsAutosaveName = nil;
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPSearchField___init(self, _cmd)
{
    self._recentSearches = CPArray.isa.objj_msgSend0(CPArray, "array");
    self.isa.objj_msgSend1(self, "setBezeled:", YES);
    self.isa.objj_msgSend1(self, "setBezelStyle:", CPTextFieldRoundedBezel);
    self.isa.objj_msgSend1(self, "setBordered:", YES);
    self.isa.objj_msgSend1(self, "setEditable:", YES);
    self.isa.objj_msgSend1(self, "setContinuous:", YES);
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        cancelButton = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", self.isa.objj_msgSend1(self, "cancelButtonRectForBounds:", bounds))),
        searchButton = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", self.isa.objj_msgSend1(self, "searchButtonRectForBounds:", bounds)));
    self.isa.objj_msgSend1(self, "setCancelButton:", cancelButton);
    self.isa.objj_msgSend0(self, "resetCancelButton");
    self.isa.objj_msgSend1(self, "setSearchButton:", searchButton);
    self.isa.objj_msgSend0(self, "resetSearchButton");
    self._canResignFirstResponder = YES;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_removeObservers"), function $CPSearchField___removeObservers(self, _cmd)
{
    if (!self._isObserving)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "_removeObservers");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, CPControlTextDidChangeNotification, self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_addObservers"), function $CPSearchField___addObservers(self, _cmd)
{
    if (self._isObserving)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "_addObservers");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_searchFieldTextDidChange:"), CPControlTextDidChangeNotification, self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setSearchButton:"), function $CPSearchField__setSearchButton_(self, _cmd, button)
{
    if (button != self._searchButton)
    {
        ((___r1 = self._searchButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        self._searchButton = button;
        ((___r1 = self._searchButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", self.isa.objj_msgSend1(self, "searchButtonRectForBounds:", self.isa.objj_msgSend0(self, "bounds"))));
        ((___r1 = self._searchButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMaxXMargin));
        self.isa.objj_msgSend1(self, "addSubview:", self._searchButton);
    }
    var ___r1;
}
,["void","CPButton"]), new objj_method(sel_getUid("searchButton"), function $CPSearchField__searchButton(self, _cmd)
{
    return self._searchButton;
}
,["CPButton"]), new objj_method(sel_getUid("resetSearchButton"), function $CPSearchField__resetSearchButton(self, _cmd)
{
    var button = self.isa.objj_msgSend0(self, "searchButton"),
        searchButtonImage = self._searchMenuTemplate === nil ? self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-search") : self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-find");
    (button == null ? null : button.isa.objj_msgSend1(button, "setBordered:", NO));
    (button == null ? null : button.isa.objj_msgSend1(button, "setImageScaling:", CPImageScaleAxesIndependently));
    (button == null ? null : button.isa.objj_msgSend1(button, "setImage:", searchButtonImage));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAutoresizingMask:", CPViewMaxXMargin));
}
,["void"]), new objj_method(sel_getUid("setCancelButton:"), function $CPSearchField__setCancelButton_(self, _cmd, button)
{
    if (button != self._cancelButton)
    {
        ((___r1 = self._cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        self._cancelButton = button;
        ((___r1 = self._cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", self.isa.objj_msgSend1(self, "cancelButtonRectForBounds:", self.isa.objj_msgSend0(self, "bounds"))));
        ((___r1 = self._cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin));
        ((___r1 = self._cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self._cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("cancelOperation:")));
        ((___r1 = self._cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setButtonType:", CPMomentaryChangeButton));
        self.isa.objj_msgSend0(self, "_updateCancelButtonVisibility");
        self.isa.objj_msgSend1(self, "addSubview:", self._cancelButton);
    }
    var ___r1;
}
,["void","CPButton"]), new objj_method(sel_getUid("cancelButton"), function $CPSearchField__cancelButton(self, _cmd)
{
    return self._cancelButton;
}
,["CPButton"]), new objj_method(sel_getUid("resetCancelButton"), function $CPSearchField__resetCancelButton(self, _cmd)
{
    var button = self.isa.objj_msgSend0(self, "cancelButton");
    (button == null ? null : button.isa.objj_msgSend1(button, "setBordered:", NO));
    (button == null ? null : button.isa.objj_msgSend1(button, "setImageScaling:", CPImageScaleAxesIndependently));
    (button == null ? null : button.isa.objj_msgSend1(button, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-cancel")));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAlternateImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-cancel-pressed")));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAutoresizingMask:", CPViewMinXMargin));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTarget:", self));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAction:", sel_getUid("cancelOperation:")));
}
,["void"]), new objj_method(sel_getUid("searchTextRectForBounds:"), function $CPSearchField__searchTextRectForBounds_(self, _cmd, rect)
{
    var leftOffset = 0,
        width = CGRectGetWidth(rect),
        bounds = self.isa.objj_msgSend0(self, "bounds");
    if (self._searchButton)
    {
        var searchBounds = self.isa.objj_msgSend1(self, "searchButtonRectForBounds:", bounds);
        leftOffset = CGRectGetMaxX(searchBounds) + 2;
    }
    if (self._cancelButton)
    {
        var cancelRect = self.isa.objj_msgSend1(self, "cancelButtonRectForBounds:", bounds);
        width = CGRectGetMinX(cancelRect) - leftOffset;
    }
    return CGRectMake(leftOffset, CGRectGetMinY(rect), width, CGRectGetHeight(rect));
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("searchButtonRectForBounds:"), function $CPSearchField__searchButtonRectForBounds_(self, _cmd, rect)
{
    var size = ((___r1 = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-search")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "size")) || CGSizeMakeZero();
    return CGRectMake(5, (CGRectGetHeight(rect) - size.height) / 2, size.width, size.height);
    var ___r1;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("cancelButtonRectForBounds:"), function $CPSearchField__cancelButtonRectForBounds_(self, _cmd, rect)
{
    var size = ((___r1 = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-cancel")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "size")) || CGSizeMakeZero();
    return CGRectMake(CGRectGetWidth(rect) - size.width - 5, (CGRectGetHeight(rect) - size.width) / 2, size.height, size.height);
    var ___r1;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("searchMenuTemplate"), function $CPSearchField__searchMenuTemplate(self, _cmd)
{
    return self._searchMenuTemplate;
}
,["CPMenu"]), new objj_method(sel_getUid("setSearchMenuTemplate:"), function $CPSearchField__setSearchMenuTemplate_(self, _cmd, aMenu)
{
    self._searchMenuTemplate = aMenu;
    self.isa.objj_msgSend0(self, "resetSearchButton");
    self.isa.objj_msgSend0(self, "_loadRecentSearchList");
    self.isa.objj_msgSend0(self, "_updateSearchMenu");
}
,["void","CPMenu"]), new objj_method(sel_getUid("sendsWholeSearchString"), function $CPSearchField__sendsWholeSearchString(self, _cmd)
{
    return self._sendsWholeSearchString;
}
,["BOOL"]), new objj_method(sel_getUid("setSendsWholeSearchString:"), function $CPSearchField__setSendsWholeSearchString_(self, _cmd, flag)
{
    self._sendsWholeSearchString = flag;
}
,["void","BOOL"]), new objj_method(sel_getUid("sendsSearchStringImmediately"), function $CPSearchField__sendsSearchStringImmediately(self, _cmd)
{
    return self._sendsSearchStringImmediately;
}
,["BOOL"]), new objj_method(sel_getUid("setSendsSearchStringImmediately:"), function $CPSearchField__setSendsSearchStringImmediately_(self, _cmd, flag)
{
    self._sendsSearchStringImmediately = flag;
}
,["void","BOOL"]), new objj_method(sel_getUid("maximumRecents"), function $CPSearchField__maximumRecents(self, _cmd)
{
    return self._maximumRecents;
}
,["int"]), new objj_method(sel_getUid("setMaximumRecents:"), function $CPSearchField__setMaximumRecents_(self, _cmd, max)
{
    if (max > 254)
        max = 254;
    else if (max < 0)
        max = 10;
    self._maximumRecents = max;
}
,["void","int"]), new objj_method(sel_getUid("recentSearches"), function $CPSearchField__recentSearches(self, _cmd)
{
    return self._recentSearches;
}
,["CPArray"]), new objj_method(sel_getUid("setRecentSearches:"), function $CPSearchField__setRecentSearches_(self, _cmd, searches)
{
    var max = MIN(self.isa.objj_msgSend0(self, "maximumRecents"), (searches == null ? null : searches.isa.objj_msgSend0(searches, "count"))),
        searches = (searches == null ? null : searches.isa.objj_msgSend1(searches, "subarrayWithRange:", CPMakeRange(0, max)));
    self._recentSearches = searches;
    self.isa.objj_msgSend0(self, "_autosaveRecentSearchList");
}
,["void","CPArray"]), new objj_method(sel_getUid("recentsAutosaveName"), function $CPSearchField__recentsAutosaveName(self, _cmd)
{
    return self._recentsAutosaveName;
}
,["CPString"]), new objj_method(sel_getUid("setRecentsAutosaveName:"), function $CPSearchField__setRecentsAutosaveName_(self, _cmd, name)
{
    if (self._recentsAutosaveName != nil)
        self.isa.objj_msgSend0(self, "_deregisterForAutosaveNotification");
    self._recentsAutosaveName = name;
    if (self._recentsAutosaveName != nil)
        self.isa.objj_msgSend0(self, "_registerForAutosaveNotification");
}
,["void","CPString"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPSearchField__contentRectForBounds_(self, _cmd, bounds)
{
    var superbounds = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "contentRectForBounds:", bounds);
    return self.isa.objj_msgSend1(self, "searchTextRectForBounds:", superbounds);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("menu"), function $CPSearchField__menu(self, _cmd)
{
    return self._searchMenu;
}
,["CPMenu"]), new objj_method(sel_getUid("isOpaque"), function $CPSearchField__isOpaque(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "isOpaque") && ((___r1 = self._cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isOpaque")) && ((___r1 = self._searchButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isOpaque"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_updateCancelButtonVisibility"), function $CPSearchField___updateCancelButtonVisibility(self, _cmd)
{
    ((___r1 = self._cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", ((___r2 = self.isa.objj_msgSend0(self, "stringValue")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "length")) === 0));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("_searchFieldTextDidChange:"), function $CPSearchField___searchFieldTextDidChange_(self, _cmd, aNotification)
{
    if (!self.isa.objj_msgSend0(self, "sendsWholeSearchString"))
    {
        if (self.isa.objj_msgSend0(self, "sendsSearchStringImmediately"))
            self.isa.objj_msgSend0(self, "_sendPartialString");
        else
        {
            ((___r1 = self._partialStringTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
            var timeInterval = CPSearchField.isa.objj_msgSend1(CPSearchField, "_keyboardDelayForPartialSearchString:", self.isa.objj_msgSend0(self, "stringValue"));
            self._partialStringTimer = CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", timeInterval, self, sel_getUid("_sendPartialString"), nil, NO);
        }
    }
    self.isa.objj_msgSend0(self, "_updateCancelButtonVisibility");
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("_sendAction:"), function $CPSearchField___sendAction_(self, _cmd, sender)
{
    self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
}
,["void","id"]), new objj_method(sel_getUid("sendAction:to:"), function $CPSearchField__sendAction_to_(self, _cmd, anAction, anObject)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "sendAction:to:", anAction, anObject);
    ((___r1 = self._partialStringTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
    self.isa.objj_msgSend1(self, "_addStringToRecentSearches:", self.isa.objj_msgSend0(self, "stringValue"));
    self.isa.objj_msgSend0(self, "_updateCancelButtonVisibility");
    var ___r1;
}
,["BOOL","SEL","id"]), new objj_method(sel_getUid("_addStringToRecentSearches:"), function $CPSearchField___addStringToRecentSearches_(self, _cmd, string)
{
    if (string === nil || string === "" || ((___r1 = self._recentSearches), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", string)))
        return;
    var searches = CPMutableArray.isa.objj_msgSend1(CPMutableArray, "arrayWithArray:", self._recentSearches);
    (searches == null ? null : searches.isa.objj_msgSend1(searches, "addObject:", string));
    self.isa.objj_msgSend1(self, "setRecentSearches:", searches);
    self.isa.objj_msgSend0(self, "_updateSearchMenu");
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("hitTest:"), function $CPSearchField__hitTest_(self, _cmd, aPoint)
{
    if (CGRectContainsPoint(self.isa.objj_msgSend0(self, "frame"), aPoint))
        return self;
    else
        return nil;
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPSearchField__resignFirstResponder(self, _cmd)
{
    return self._canResignFirstResponder && objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "resignFirstResponder");
}
,["BOOL"]), new objj_method(sel_getUid("mouseDown:"), function $CPSearchField__mouseDown_(self, _cmd, anEvent)
{
    var location = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")),
        point = self.isa.objj_msgSend2(self, "convertPoint:fromView:", location, nil);
    if (CGRectContainsPoint(self.isa.objj_msgSend1(self, "searchButtonRectForBounds:", self.isa.objj_msgSend0(self, "bounds")), point))
    {
        if (self._searchMenuTemplate == nil)
        {
            if (((___r1 = self._searchButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "target")) && ((___r1 = self._searchButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "action")))
                ((___r1 = self._searchButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseDown:", anEvent));
            else
                self.isa.objj_msgSend1(self, "_sendAction:", self);
        }
        else
            self.isa.objj_msgSend0(self, "_showMenu");
    }
    else if (CGRectContainsPoint(self.isa.objj_msgSend1(self, "cancelButtonRectForBounds:", self.isa.objj_msgSend0(self, "bounds")), point))
        ((___r1 = self._cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseDown:", anEvent));
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "mouseDown:", anEvent);
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("defaultSearchMenuTemplate"), function $CPSearchField__defaultSearchMenuTemplate(self, _cmd)
{
    var template = ((___r1 = CPMenu.isa.objj_msgSend0(CPMenu, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")),
        item;
    item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Recent Searches", nil, ""));
    (item == null ? null : item.isa.objj_msgSend1(item, "setTag:", CPSearchFieldRecentsTitleMenuItemTag));
    (item == null ? null : item.isa.objj_msgSend1(item, "setEnabled:", NO));
    (template == null ? null : template.isa.objj_msgSend1(template, "addItem:", item));
    item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Recent search item", sel_getUid("_searchFieldSearch:"), ""));
    (item == null ? null : item.isa.objj_msgSend1(item, "setTag:", CPSearchFieldRecentsMenuItemTag));
    (item == null ? null : item.isa.objj_msgSend1(item, "setTarget:", self));
    (template == null ? null : template.isa.objj_msgSend1(template, "addItem:", item));
    item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Clear Recent Searches", sel_getUid("_searchFieldClearRecents:"), ""));
    (item == null ? null : item.isa.objj_msgSend1(item, "setTag:", CPSearchFieldClearRecentsMenuItemTag));
    (item == null ? null : item.isa.objj_msgSend1(item, "setTarget:", self));
    (template == null ? null : template.isa.objj_msgSend1(template, "addItem:", item));
    item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "No Recent Searches", nil, ""));
    (item == null ? null : item.isa.objj_msgSend1(item, "setTag:", CPSearchFieldNoRecentsMenuItemTag));
    (item == null ? null : item.isa.objj_msgSend1(item, "setEnabled:", NO));
    (template == null ? null : template.isa.objj_msgSend1(template, "addItem:", item));
    return template;
    var ___r1;
}
,["CPMenu"]), new objj_method(sel_getUid("_updateSearchMenu"), function $CPSearchField___updateSearchMenu(self, _cmd)
{
    if (self._searchMenuTemplate === nil)
        return;
    var menu = ((___r1 = CPMenu.isa.objj_msgSend0(CPMenu, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")),
        countOfRecents = ((___r1 = self._recentSearches), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        numberOfItems = ((___r1 = self._searchMenuTemplate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "numberOfItems"));
    for (var i = 0; i < numberOfItems; i++)
    {
        var item = ((___r1 = ((___r2 = self._searchMenuTemplate), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "itemAtIndex:", i))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        switch((item == null ? null : item.isa.objj_msgSend0(item, "tag"))) {
        case CPSearchFieldRecentsTitleMenuItemTag:
            if (countOfRecents === 0)
                continue;
            if ((menu == null ? null : menu.isa.objj_msgSend0(menu, "numberOfItems")) > 0)
                self.isa.objj_msgSend1(self, "_addSeparatorToMenu:", menu);
            break;
        case CPSearchFieldRecentsMenuItemTag:
        {
            var itemAction = sel_getUid("_searchFieldSearch:");
            for (var recentIndex = 0; recentIndex < countOfRecents; ++recentIndex)
            {
                var recentItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", RECENT_SEARCH_PREFIX + ((___r2 = self._recentSearches), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", recentIndex)), itemAction, (item == null ? null : item.isa.objj_msgSend0(item, "keyEquivalent"))));
                (item == null ? null : item.isa.objj_msgSend1(item, "setTarget:", self));
                (menu == null ? null : menu.isa.objj_msgSend1(menu, "addItem:", recentItem));
            }
            continue;
        }
        case CPSearchFieldClearRecentsMenuItemTag:
            if (countOfRecents === 0)
                continue;
            if ((menu == null ? null : menu.isa.objj_msgSend0(menu, "numberOfItems")) > 0)
                self.isa.objj_msgSend1(self, "_addSeparatorToMenu:", menu);
            (item == null ? null : item.isa.objj_msgSend1(item, "setAction:", sel_getUid("_searchFieldClearRecents:")));
            (item == null ? null : item.isa.objj_msgSend1(item, "setTarget:", self));
            break;
        case CPSearchFieldNoRecentsMenuItemTag:
            if (countOfRecents !== 0)
                continue;
            if ((menu == null ? null : menu.isa.objj_msgSend0(menu, "numberOfItems")) > 0)
                self.isa.objj_msgSend1(self, "_addSeparatorToMenu:", menu);
            break;
        }
        (item == null ? null : item.isa.objj_msgSend1(item, "setEnabled:", (item == null ? null : item.isa.objj_msgSend0(item, "isEnabled")) && (item == null ? null : item.isa.objj_msgSend0(item, "action")) != nil && (item == null ? null : item.isa.objj_msgSend0(item, "target")) != nil));
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "addItem:", item));
    }
    (menu == null ? null : menu.isa.objj_msgSend1(menu, "setDelegate:", self));
    self._searchMenu = menu;
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("_addSeparatorToMenu:"), function $CPSearchField___addSeparatorToMenu_(self, _cmd, aMenu)
{
    var separator = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "separatorItem");
    (separator == null ? null : separator.isa.objj_msgSend1(separator, "setEnabled:", NO));
    (aMenu == null ? null : aMenu.isa.objj_msgSend1(aMenu, "addItem:", separator));
}
,["void","CPMenu"]), new objj_method(sel_getUid("menuWillOpen:"), function $CPSearchField__menuWillOpen_(self, _cmd, menu)
{
    self._canResignFirstResponder = NO;
}
,["void","CPMenu"]), new objj_method(sel_getUid("menuDidClose:"), function $CPSearchField__menuDidClose_(self, _cmd, menu)
{
    self._canResignFirstResponder = YES;
    self.isa.objj_msgSend0(self, "becomeFirstResponder");
}
,["void","CPMenu"]), new objj_method(sel_getUid("_showMenu"), function $CPSearchField___showMenu(self, _cmd)
{
    if (self._searchMenu === nil || ((___r1 = self._searchMenu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "numberOfItems")) === 0 || !self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    var aFrame = ((___r1 = self.isa.objj_msgSend0(self, "superview")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertRect:toView:", self.isa.objj_msgSend0(self, "frame"), nil)),
        location = CGPointMake(aFrame.origin.x + 10, aFrame.origin.y + aFrame.size.height - 4);
    var anEvent = CPEvent.isa.objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPRightMouseDown, location, 0, ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "timestamp")), ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "windowNumber")), nil, 1, 1, 0);
    self.isa.objj_msgSend1(self, "selectAll:", nil);
    CPMenu.isa.objj_msgSend3(CPMenu, "popUpContextMenu:withEvent:forView:", self._searchMenu, anEvent, self);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_sendPartialString"), function $CPSearchField___sendPartialString(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
    ((___r1 = self._partialStringTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("cancelOperation:"), function $CPSearchField__cancelOperation_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "setObjectValue:", "");
    self.isa.objj_msgSend1(self, "textDidChange:", CPNotification.isa.objj_msgSend3(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidChangeNotification, self, nil));
    self.isa.objj_msgSend0(self, "_updateCancelButtonVisibility");
}
,["void","id"]), new objj_method(sel_getUid("_searchFieldSearch:"), function $CPSearchField___searchFieldSearch_(self, _cmd, sender)
{
    var searchString = ((___r1 = (sender == null ? null : sender.isa.objj_msgSend0(sender, "title"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "substringFromIndex:", (RECENT_SEARCH_PREFIX == null ? null : RECENT_SEARCH_PREFIX.isa.objj_msgSend0(RECENT_SEARCH_PREFIX, "length"))));
    if ((sender == null ? null : sender.isa.objj_msgSend0(sender, "tag")) != CPSearchFieldRecentsMenuItemTag)
        self.isa.objj_msgSend1(self, "_addStringToRecentSearches:", searchString);
    self.isa.objj_msgSend1(self, "setObjectValue:", searchString);
    self.isa.objj_msgSend0(self, "_sendPartialString");
    self.isa.objj_msgSend1(self, "selectAll:", nil);
    self.isa.objj_msgSend0(self, "_updateCancelButtonVisibility");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_searchFieldClearRecents:"), function $CPSearchField___searchFieldClearRecents_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "setRecentSearches:", CPArray.isa.objj_msgSend0(CPArray, "array"));
    self.isa.objj_msgSend0(self, "_updateSearchMenu");
    self.isa.objj_msgSend1(self, "setStringValue:", "");
    self.isa.objj_msgSend0(self, "_updateCancelButtonVisibility");
}
,["void","id"]), new objj_method(sel_getUid("_registerForAutosaveNotification"), function $CPSearchField___registerForAutosaveNotification(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_updateAutosavedRecents:"), CPAutosavedRecentsChangedNotification, self._recentsAutosaveName));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_deregisterForAutosaveNotification"), function $CPSearchField___deregisterForAutosaveNotification(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, CPAutosavedRecentsChangedNotification, self._recentsAutosaveName));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_autosaveRecentSearchList"), function $CPSearchField___autosaveRecentSearchList(self, _cmd)
{
    if (self._recentsAutosaveName != nil)
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPAutosavedRecentsChangedNotification, self._recentsAutosaveName));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_updateAutosavedRecents:"), function $CPSearchField___updateAutosavedRecents_(self, _cmd, notification)
{
    var name = (notification == null ? null : notification.isa.objj_msgSend0(notification, "object"));
    ((___r1 = (CPUserDefaults == null ? null : CPUserDefaults.isa.objj_msgSend0(CPUserDefaults, "standardUserDefaults"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", self._recentSearches, name));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_loadRecentSearchList"), function $CPSearchField___loadRecentSearchList(self, _cmd)
{
    var name = self.isa.objj_msgSend0(self, "recentsAutosaveName");
    if (name === nil)
        return;
    var list = ((___r1 = (CPUserDefaults == null ? null : CPUserDefaults.isa.objj_msgSend0(CPUserDefaults, "standardUserDefaults"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", name));
    if (list !== nil)
        self._recentSearches = list;
    var ___r1;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPSearchField__defaultThemeClass(self, _cmd)
{
    return "searchfield";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPSearchField__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "image-search", CPNull.isa.objj_msgSend0(CPNull, "null"), "image-find", CPNull.isa.objj_msgSend0(CPNull, "null"), "image-cancel", CPNull.isa.objj_msgSend0(CPNull, "null"), "image-cancel-pressed");
}
,["CPDictionary"]), new objj_method(sel_getUid("_keyboardDelayForPartialSearchString:"), function $CPSearchField___keyboardDelayForPartialSearchString_(self, _cmd, string)
{
    return (6 - MIN((string == null ? null : string.isa.objj_msgSend0(string, "length")), 4)) / 10;
}
,["double","CPString"])]);
}var CPRecentsAutosaveNameKey = "CPRecentsAutosaveNameKey",
    CPSendsWholeSearchStringKey = "CPSendsWholeSearchStringKey",
    CPSendsSearchStringImmediatelyKey = "CPSendsSearchStringImmediatelyKey",
    CPMaximumRecentsKey = "CPMaximumRecentsKey",
    CPSearchMenuTemplateKey = "CPSearchMenuTemplateKey";
{
var the_class = objj_getClass("CPSearchField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSearchField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("encodeWithCoder:"), function $CPSearchField__encodeWithCoder_(self, _cmd, coder)
{
    ((___r1 = self._searchButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    ((___r1 = self._cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "encodeWithCoder:", coder);
    if (self._searchButton)
        self.isa.objj_msgSend1(self, "addSubview:", self._searchButton);
    if (self._cancelButton)
        self.isa.objj_msgSend1(self, "addSubview:", self._cancelButton);
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeBool:forKey:", self._sendsWholeSearchString, CPSendsWholeSearchStringKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeBool:forKey:", self._sendsSearchStringImmediately, CPSendsSearchStringImmediatelyKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._maximumRecents, CPMaximumRecentsKey));
    if (self._recentsAutosaveName)
        (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._recentsAutosaveName, CPRecentsAutosaveNameKey));
    if (self._searchMenuTemplate)
        (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._searchMenuTemplate, CPSearchMenuTemplateKey));
    var ___r1;
}
,["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $CPSearchField__initWithCoder_(self, _cmd, coder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "initWithCoder:", coder))
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setRecentsAutosaveName:", (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRecentsAutosaveNameKey))));
        self._sendsWholeSearchString = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeBoolForKey:", CPSendsWholeSearchStringKey));
        self._sendsSearchStringImmediately = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeBoolForKey:", CPSendsSearchStringImmediatelyKey));
        self._maximumRecents = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", CPMaximumRecentsKey));
        var template = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPSearchMenuTemplateKey));
        if (template)
            (self == null ? null : self.isa.objj_msgSend1(self, "setSearchMenuTemplate:", template));
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id","CPCoder"])]);
}