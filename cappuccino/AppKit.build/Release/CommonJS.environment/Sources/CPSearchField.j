@STATIC;1.0;i;10;CPButton.ji;8;CPMenu.ji;12;CPMenuItem.ji;13;CPTextField.jt;27698;objj_executeFile("CPButton.j", YES);objj_executeFile("CPMenu.j", YES);objj_executeFile("CPMenuItem.j", YES);objj_executeFile("CPTextField.j", YES);CPSearchFieldRecentsTitleMenuItemTag = 1000;
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
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPSearchField___init(self, _cmd)
{
    self._recentSearches = objj_msgSend(CPArray, "array");
    objj_msgSend(self, "setBezeled:", YES);
    objj_msgSend(self, "setBezelStyle:", CPTextFieldRoundedBezel);
    objj_msgSend(self, "setBordered:", YES);
    objj_msgSend(self, "setEditable:", YES);
    objj_msgSend(self, "setContinuous:", YES);
    var bounds = objj_msgSend(self, "bounds"),
        cancelButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", objj_msgSend(self, "cancelButtonRectForBounds:", bounds)),
        searchButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", objj_msgSend(self, "searchButtonRectForBounds:", bounds));
    objj_msgSend(self, "setCancelButton:", cancelButton);
    objj_msgSend(self, "resetCancelButton");
    objj_msgSend(self, "setSearchButton:", searchButton);
    objj_msgSend(self, "resetSearchButton");
    self._canResignFirstResponder = YES;
}
,["void"]), new objj_method(sel_getUid("viewWillMoveToSuperview:"), function $CPSearchField__viewWillMoveToSuperview_(self, _cmd, aView)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "viewWillMoveToSuperview:", aView);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPControlTextDidChangeNotification, self);
    if (aView)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_searchFieldTextDidChange:"), CPControlTextDidChangeNotification, self);
}
,["void","CPView"]), new objj_method(sel_getUid("setSearchButton:"), function $CPSearchField__setSearchButton_(self, _cmd, button)
{
    if (button != self._searchButton)
    {
        objj_msgSend(self._searchButton, "removeFromSuperview");
        self._searchButton = button;
        objj_msgSend(self._searchButton, "setFrame:", objj_msgSend(self, "searchButtonRectForBounds:", objj_msgSend(self, "bounds")));
        objj_msgSend(self._searchButton, "setAutoresizingMask:", CPViewMaxXMargin);
        objj_msgSend(self, "addSubview:", self._searchButton);
    }
}
,["void","CPButton"]), new objj_method(sel_getUid("searchButton"), function $CPSearchField__searchButton(self, _cmd)
{
    return self._searchButton;
}
,["CPButton"]), new objj_method(sel_getUid("resetSearchButton"), function $CPSearchField__resetSearchButton(self, _cmd)
{
    var button = objj_msgSend(self, "searchButton"),
        searchButtonImage = self._searchMenuTemplate === nil ? objj_msgSend(self, "valueForThemeAttribute:", "image-search") : objj_msgSend(self, "valueForThemeAttribute:", "image-find");
    objj_msgSend(button, "setBordered:", NO);
    objj_msgSend(button, "setImageScaling:", CPImageScaleAxesIndependently);
    objj_msgSend(button, "setImage:", searchButtonImage);
    objj_msgSend(button, "setAutoresizingMask:", CPViewMaxXMargin);
}
,["void"]), new objj_method(sel_getUid("setCancelButton:"), function $CPSearchField__setCancelButton_(self, _cmd, button)
{
    if (button != self._cancelButton)
    {
        objj_msgSend(self._cancelButton, "removeFromSuperview");
        self._cancelButton = button;
        objj_msgSend(self._cancelButton, "setFrame:", objj_msgSend(self, "cancelButtonRectForBounds:", objj_msgSend(self, "bounds")));
        objj_msgSend(self._cancelButton, "setAutoresizingMask:", CPViewMinXMargin);
        objj_msgSend(self._cancelButton, "setTarget:", self);
        objj_msgSend(self._cancelButton, "setAction:", sel_getUid("cancelOperation:"));
        objj_msgSend(self._cancelButton, "setButtonType:", CPMomentaryChangeButton);
        objj_msgSend(self, "_updateCancelButtonVisibility");
        objj_msgSend(self, "addSubview:", self._cancelButton);
    }
}
,["void","CPButton"]), new objj_method(sel_getUid("cancelButton"), function $CPSearchField__cancelButton(self, _cmd)
{
    return self._cancelButton;
}
,["CPButton"]), new objj_method(sel_getUid("resetCancelButton"), function $CPSearchField__resetCancelButton(self, _cmd)
{
    var button = objj_msgSend(self, "cancelButton");
    objj_msgSend(button, "setBordered:", NO);
    objj_msgSend(button, "setImageScaling:", CPImageScaleAxesIndependently);
    objj_msgSend(button, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "image-cancel"));
    objj_msgSend(button, "setAlternateImage:", objj_msgSend(self, "valueForThemeAttribute:", "image-cancel-pressed"));
    objj_msgSend(button, "setAutoresizingMask:", CPViewMinXMargin);
    objj_msgSend(button, "setTarget:", self);
    objj_msgSend(button, "setAction:", sel_getUid("cancelOperation:"));
}
,["void"]), new objj_method(sel_getUid("searchTextRectForBounds:"), function $CPSearchField__searchTextRectForBounds_(self, _cmd, rect)
{
    var leftOffset = 0,
        width = CGRectGetWidth(rect),
        bounds = objj_msgSend(self, "bounds");
    if (self._searchButton)
    {
        var searchBounds = objj_msgSend(self, "searchButtonRectForBounds:", bounds);
        leftOffset = CGRectGetMaxX(searchBounds) + 2;
    }
    if (self._cancelButton)
    {
        var cancelRect = objj_msgSend(self, "cancelButtonRectForBounds:", bounds);
        width = CGRectGetMinX(cancelRect) - leftOffset;
    }
    return CGRectMake(leftOffset, CGRectGetMinY(rect), width, CGRectGetHeight(rect));
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("searchButtonRectForBounds:"), function $CPSearchField__searchButtonRectForBounds_(self, _cmd, rect)
{
    var size = objj_msgSend(objj_msgSend(self, "valueForThemeAttribute:", "image-search"), "size") || CGSizeMakeZero();
    return CGRectMake(5, (CGRectGetHeight(rect) - size.height) / 2, size.width, size.height);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("cancelButtonRectForBounds:"), function $CPSearchField__cancelButtonRectForBounds_(self, _cmd, rect)
{
    var size = objj_msgSend(objj_msgSend(self, "valueForThemeAttribute:", "image-cancel"), "size") || CGSizeMakeZero();
    return CGRectMake(CGRectGetWidth(rect) - size.width - 5, (CGRectGetHeight(rect) - size.width) / 2, size.height, size.height);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("searchMenuTemplate"), function $CPSearchField__searchMenuTemplate(self, _cmd)
{
    return self._searchMenuTemplate;
}
,["CPMenu"]), new objj_method(sel_getUid("setSearchMenuTemplate:"), function $CPSearchField__setSearchMenuTemplate_(self, _cmd, aMenu)
{
    self._searchMenuTemplate = aMenu;
    objj_msgSend(self, "resetSearchButton");
    objj_msgSend(self, "_loadRecentSearchList");
    objj_msgSend(self, "_updateSearchMenu");
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
    var max = MIN(objj_msgSend(self, "maximumRecents"), objj_msgSend(searches, "count")),
        searches = objj_msgSend(searches, "subarrayWithRange:", CPMakeRange(0, max));
    self._recentSearches = searches;
    objj_msgSend(self, "_autosaveRecentSearchList");
}
,["void","CPArray"]), new objj_method(sel_getUid("recentsAutosaveName"), function $CPSearchField__recentsAutosaveName(self, _cmd)
{
    return self._recentsAutosaveName;
}
,["CPString"]), new objj_method(sel_getUid("setRecentsAutosaveName:"), function $CPSearchField__setRecentsAutosaveName_(self, _cmd, name)
{
    if (self._recentsAutosaveName != nil)
        objj_msgSend(self, "_deregisterForAutosaveNotification");
    self._recentsAutosaveName = name;
    if (self._recentsAutosaveName != nil)
        objj_msgSend(self, "_registerForAutosaveNotification");
}
,["void","CPString"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPSearchField__contentRectForBounds_(self, _cmd, bounds)
{
    var superbounds = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "contentRectForBounds:", bounds);
    return objj_msgSend(self, "searchTextRectForBounds:", superbounds);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("menu"), function $CPSearchField__menu(self, _cmd)
{
    return self._searchMenu;
}
,["CPMenu"]), new objj_method(sel_getUid("isOpaque"), function $CPSearchField__isOpaque(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "isOpaque") && objj_msgSend(self._cancelButton, "isOpaque") && objj_msgSend(self._searchButton, "isOpaque");
}
,["BOOL"]), new objj_method(sel_getUid("_updateCancelButtonVisibility"), function $CPSearchField___updateCancelButtonVisibility(self, _cmd)
{
    objj_msgSend(self._cancelButton, "setHidden:", objj_msgSend(objj_msgSend(self, "stringValue"), "length") === 0);
}
,["void"]), new objj_method(sel_getUid("_searchFieldTextDidChange:"), function $CPSearchField___searchFieldTextDidChange_(self, _cmd, aNotification)
{
    if (!objj_msgSend(self, "sendsWholeSearchString"))
    {
        if (objj_msgSend(self, "sendsSearchStringImmediately"))
            objj_msgSend(self, "_sendPartialString");
        else
        {
            objj_msgSend(self._partialStringTimer, "invalidate");
            var timeInterval = objj_msgSend(CPSearchField, "_keyboardDelayForPartialSearchString:", objj_msgSend(self, "stringValue"));
            self._partialStringTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", timeInterval, self, sel_getUid("_sendPartialString"), nil, NO);
        }
    }
    objj_msgSend(self, "_updateCancelButtonVisibility");
}
,["void","CPNotification"]), new objj_method(sel_getUid("_sendAction:"), function $CPSearchField___sendAction_(self, _cmd, sender)
{
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
,["void","id"]), new objj_method(sel_getUid("sendAction:to:"), function $CPSearchField__sendAction_to_(self, _cmd, anAction, anObject)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "sendAction:to:", anAction, anObject);
    objj_msgSend(self._partialStringTimer, "invalidate");
    objj_msgSend(self, "_addStringToRecentSearches:", objj_msgSend(self, "stringValue"));
    objj_msgSend(self, "_updateCancelButtonVisibility");
}
,["void","SEL","id"]), new objj_method(sel_getUid("_addStringToRecentSearches:"), function $CPSearchField___addStringToRecentSearches_(self, _cmd, string)
{
    if (string === nil || string === "" || objj_msgSend(self._recentSearches, "containsObject:", string))
        return;
    var searches = objj_msgSend(CPMutableArray, "arrayWithArray:", self._recentSearches);
    objj_msgSend(searches, "addObject:", string);
    objj_msgSend(self, "setRecentSearches:", searches);
    objj_msgSend(self, "_updateSearchMenu");
}
,["void","CPString"]), new objj_method(sel_getUid("hitTest:"), function $CPSearchField__hitTest_(self, _cmd, aPoint)
{
    if (CGRectContainsPoint(objj_msgSend(self, "frame"), aPoint))
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
    var location = objj_msgSend(anEvent, "locationInWindow"),
        point = objj_msgSend(self, "convertPoint:fromView:", location, nil);
    if (CGRectContainsPoint(objj_msgSend(self, "searchButtonRectForBounds:", objj_msgSend(self, "bounds")), point))
    {
        if (self._searchMenuTemplate == nil)
        {
            if (objj_msgSend(self._searchButton, "target") && objj_msgSend(self._searchButton, "action"))
                objj_msgSend(self._searchButton, "mouseDown:", anEvent);
            else
                objj_msgSend(self, "_sendAction:", self);
        }
        else
            objj_msgSend(self, "_showMenu");
    }
    else if (CGRectContainsPoint(objj_msgSend(self, "cancelButtonRectForBounds:", objj_msgSend(self, "bounds")), point))
        objj_msgSend(self._cancelButton, "mouseDown:", anEvent);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "mouseDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("defaultSearchMenuTemplate"), function $CPSearchField__defaultSearchMenuTemplate(self, _cmd)
{
    var template = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "init"),
        item;
    item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Recent Searches", nil, "");
    objj_msgSend(item, "setTag:", CPSearchFieldRecentsTitleMenuItemTag);
    objj_msgSend(item, "setEnabled:", NO);
    objj_msgSend(template, "addItem:", item);
    item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Recent search item", sel_getUid("_searchFieldSearch:"), "");
    objj_msgSend(item, "setTag:", CPSearchFieldRecentsMenuItemTag);
    objj_msgSend(item, "setTarget:", self);
    objj_msgSend(template, "addItem:", item);
    item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Clear Recent Searches", sel_getUid("_searchFieldClearRecents:"), "");
    objj_msgSend(item, "setTag:", CPSearchFieldClearRecentsMenuItemTag);
    objj_msgSend(item, "setTarget:", self);
    objj_msgSend(template, "addItem:", item);
    item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "No Recent Searches", nil, "");
    objj_msgSend(item, "setTag:", CPSearchFieldNoRecentsMenuItemTag);
    objj_msgSend(item, "setEnabled:", NO);
    objj_msgSend(template, "addItem:", item);
    return template;
}
,["CPMenu"]), new objj_method(sel_getUid("_updateSearchMenu"), function $CPSearchField___updateSearchMenu(self, _cmd)
{
    if (self._searchMenuTemplate === nil)
        return;
    var menu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "init"),
        countOfRecents = objj_msgSend(self._recentSearches, "count"),
        numberOfItems = objj_msgSend(self._searchMenuTemplate, "numberOfItems");
    for (var i = 0; i < numberOfItems; i++)
    {
        var item = objj_msgSend(objj_msgSend(self._searchMenuTemplate, "itemAtIndex:", i), "copy");
        switch(objj_msgSend(item, "tag")) {
        case CPSearchFieldRecentsTitleMenuItemTag:
            if (countOfRecents === 0)
                continue;
            if (objj_msgSend(menu, "numberOfItems") > 0)
                objj_msgSend(self, "_addSeparatorToMenu:", menu);
            break;
        case CPSearchFieldRecentsMenuItemTag:
        {
            var itemAction = sel_getUid("_searchFieldSearch:");
            for (var recentIndex = 0; recentIndex < countOfRecents; ++recentIndex)
            {
                var recentItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", RECENT_SEARCH_PREFIX + objj_msgSend(self._recentSearches, "objectAtIndex:", recentIndex), itemAction, objj_msgSend(item, "keyEquivalent"));
                objj_msgSend(item, "setTarget:", self);
                objj_msgSend(menu, "addItem:", recentItem);
            }
            continue;
        }
        case CPSearchFieldClearRecentsMenuItemTag:
            if (countOfRecents === 0)
                continue;
            if (objj_msgSend(menu, "numberOfItems") > 0)
                objj_msgSend(self, "_addSeparatorToMenu:", menu);
            objj_msgSend(item, "setAction:", sel_getUid("_searchFieldClearRecents:"));
            objj_msgSend(item, "setTarget:", self);
            break;
        case CPSearchFieldNoRecentsMenuItemTag:
            if (countOfRecents !== 0)
                continue;
            if (objj_msgSend(menu, "numberOfItems") > 0)
                objj_msgSend(self, "_addSeparatorToMenu:", menu);
            break;
        }
        objj_msgSend(item, "setEnabled:", objj_msgSend(item, "isEnabled") && objj_msgSend(item, "action") != nil && objj_msgSend(item, "target") != nil);
        objj_msgSend(menu, "addItem:", item);
    }
    objj_msgSend(menu, "setDelegate:", self);
    self._searchMenu = menu;
}
,["void"]), new objj_method(sel_getUid("_addSeparatorToMenu:"), function $CPSearchField___addSeparatorToMenu_(self, _cmd, aMenu)
{
    var separator = objj_msgSend(CPMenuItem, "separatorItem");
    objj_msgSend(separator, "setEnabled:", NO);
    objj_msgSend(aMenu, "addItem:", separator);
}
,["void","CPMenu"]), new objj_method(sel_getUid("menuWillOpen:"), function $CPSearchField__menuWillOpen_(self, _cmd, menu)
{
    self._canResignFirstResponder = NO;
}
,["void","CPMenu"]), new objj_method(sel_getUid("menuDidClose:"), function $CPSearchField__menuDidClose_(self, _cmd, menu)
{
    self._canResignFirstResponder = YES;
    objj_msgSend(self, "becomeFirstResponder");
}
,["void","CPMenu"]), new objj_method(sel_getUid("_showMenu"), function $CPSearchField___showMenu(self, _cmd)
{
    if (self._searchMenu === nil || objj_msgSend(self._searchMenu, "numberOfItems") === 0 || !objj_msgSend(self, "isEnabled"))
        return;
    var aFrame = objj_msgSend(objj_msgSend(self, "superview"), "convertRect:toView:", objj_msgSend(self, "frame"), nil),
        location = CGPointMake(aFrame.origin.x + 10, aFrame.origin.y + aFrame.size.height - 4);
    var anEvent = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPRightMouseDown, location, 0, objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "timestamp"), objj_msgSend(objj_msgSend(self, "window"), "windowNumber"), nil, 1, 1, 0);
    objj_msgSend(self, "selectAll:", nil);
    objj_msgSend(CPMenu, "popUpContextMenu:withEvent:forView:", self._searchMenu, anEvent, self);
}
,["void"]), new objj_method(sel_getUid("_sendPartialString"), function $CPSearchField___sendPartialString(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    objj_msgSend(self._partialStringTimer, "invalidate");
}
,["void"]), new objj_method(sel_getUid("cancelOperation:"), function $CPSearchField__cancelOperation_(self, _cmd, sender)
{
    objj_msgSend(self, "setObjectValue:", "");
    objj_msgSend(self, "textDidChange:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidChangeNotification, self, nil));
    objj_msgSend(self, "_updateCancelButtonVisibility");
}
,["void","id"]), new objj_method(sel_getUid("_searchFieldSearch:"), function $CPSearchField___searchFieldSearch_(self, _cmd, sender)
{
    var searchString = objj_msgSend(objj_msgSend(sender, "title"), "substringFromIndex:", objj_msgSend(RECENT_SEARCH_PREFIX, "length"));
    if (objj_msgSend(sender, "tag") != CPSearchFieldRecentsMenuItemTag)
        objj_msgSend(self, "_addStringToRecentSearches:", searchString);
    objj_msgSend(self, "setObjectValue:", searchString);
    objj_msgSend(self, "_sendPartialString");
    objj_msgSend(self, "selectAll:", nil);
    objj_msgSend(self, "_updateCancelButtonVisibility");
}
,["void","id"]), new objj_method(sel_getUid("_searchFieldClearRecents:"), function $CPSearchField___searchFieldClearRecents_(self, _cmd, sender)
{
    objj_msgSend(self, "setRecentSearches:", objj_msgSend(CPArray, "array"));
    objj_msgSend(self, "_updateSearchMenu");
    objj_msgSend(self, "setStringValue:", "");
    objj_msgSend(self, "_updateCancelButtonVisibility");
}
,["void","id"]), new objj_method(sel_getUid("_registerForAutosaveNotification"), function $CPSearchField___registerForAutosaveNotification(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_updateAutosavedRecents:"), CPAutosavedRecentsChangedNotification, self._recentsAutosaveName);
}
,["void"]), new objj_method(sel_getUid("_deregisterForAutosaveNotification"), function $CPSearchField___deregisterForAutosaveNotification(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPAutosavedRecentsChangedNotification, self._recentsAutosaveName);
}
,["void"]), new objj_method(sel_getUid("_autosaveRecentSearchList"), function $CPSearchField___autosaveRecentSearchList(self, _cmd)
{
    if (self._recentsAutosaveName != nil)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPAutosavedRecentsChangedNotification, self._recentsAutosaveName);
}
,["void"]), new objj_method(sel_getUid("_updateAutosavedRecents:"), function $CPSearchField___updateAutosavedRecents_(self, _cmd, notification)
{
    var name = objj_msgSend(notification, "object");
    objj_msgSend(objj_msgSend(CPUserDefaults, "standardUserDefaults"), "setObject:forKey:", self._recentSearches, name);
}
,["void","id"]), new objj_method(sel_getUid("_loadRecentSearchList"), function $CPSearchField___loadRecentSearchList(self, _cmd)
{
    var name = objj_msgSend(self, "recentsAutosaveName");
    if (name === nil)
        return;
    var list = objj_msgSend(objj_msgSend(CPUserDefaults, "standardUserDefaults"), "objectForKey:", name);
    if (list !== nil)
        self._recentSearches = list;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPSearchField__defaultThemeClass(self, _cmd)
{
    return "searchfield";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPSearchField__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "image-search", objj_msgSend(CPNull, "null"), "image-find", objj_msgSend(CPNull, "null"), "image-cancel", objj_msgSend(CPNull, "null"), "image-cancel-pressed");
}
,["CPDictionary"]), new objj_method(sel_getUid("_keyboardDelayForPartialSearchString:"), function $CPSearchField___keyboardDelayForPartialSearchString_(self, _cmd, string)
{
    return (6 - MIN(objj_msgSend(string, "length"), 4)) / 10;
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
    objj_msgSend(self._searchButton, "removeFromSuperview");
    objj_msgSend(self._cancelButton, "removeFromSuperview");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "encodeWithCoder:", coder);
    if (self._searchButton)
        objj_msgSend(self, "addSubview:", self._searchButton);
    if (self._cancelButton)
        objj_msgSend(self, "addSubview:", self._cancelButton);
    objj_msgSend(coder, "encodeBool:forKey:", self._sendsWholeSearchString, CPSendsWholeSearchStringKey);
    objj_msgSend(coder, "encodeBool:forKey:", self._sendsSearchStringImmediately, CPSendsSearchStringImmediatelyKey);
    objj_msgSend(coder, "encodeInt:forKey:", self._maximumRecents, CPMaximumRecentsKey);
    if (self._recentsAutosaveName)
        objj_msgSend(coder, "encodeObject:forKey:", self._recentsAutosaveName, CPRecentsAutosaveNameKey);
    if (self._searchMenuTemplate)
        objj_msgSend(coder, "encodeObject:forKey:", self._searchMenuTemplate, CPSearchMenuTemplateKey);
}
,["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $CPSearchField__initWithCoder_(self, _cmd, coder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "initWithCoder:", coder))
    {
        objj_msgSend(self, "setRecentsAutosaveName:", objj_msgSend(coder, "decodeObjectForKey:", CPRecentsAutosaveNameKey));
        self._sendsWholeSearchString = objj_msgSend(coder, "decodeBoolForKey:", CPSendsWholeSearchStringKey);
        self._sendsSearchStringImmediately = objj_msgSend(coder, "decodeBoolForKey:", CPSendsSearchStringImmediatelyKey);
        self._maximumRecents = objj_msgSend(coder, "decodeIntForKey:", CPMaximumRecentsKey);
        var template = objj_msgSend(coder, "decodeObjectForKey:", CPSearchMenuTemplateKey);
        if (template)
            objj_msgSend(self, "setSearchMenuTemplate:", template);
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CPCoder"])]);
}