@STATIC;1.0;I;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jt;58742;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPPopUpButton.j", YES);objj_executeFile("CPToolbarItem.j", YES);var CPToolbarDelegate_toolbar_itemForItemIdentifier_willBeInsertedIntoToolbar_ = 1 << 0,
    CPToolbarDelegate_toolbarAllowedItemIdentifiers_ = 1 << 1,
    CPToolbarDelegate_toolbarDefaultItemIdentifiers_ = 1 << 2,
    CPToolbarDelegate_toolbarDidRemoveItem_ = 1 << 3,
    CPToolbarDelegate_toolbarSelectableItemIdentifiers_ = 1 << 4,
    CPToolbarDelegate_toolbarWillAddItem_ = 1 << 5;
CPToolbarDisplayModeDefault = 0;
CPToolbarDisplayModeIconAndLabel = 1;
CPToolbarDisplayModeIconOnly = 2;
CPToolbarDisplayModeLabelOnly = 3;
CPToolbarSizeModeDefault = 0;
CPToolbarSizeModeRegular = 1;
CPToolbarSizeModeSmall = 2;
var CPToolbarsByIdentifier = nil,
    CPToolbarConfigurationsByIdentifier = nil;
{var the_protocol = objj_allocateProtocol("CPToolbarDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPToolbarDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}{var the_class = objj_allocateClassPair(CPObject, "CPToolbar"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_displayMode"), new objj_ivar("_showsBaselineSeparator"), new objj_ivar("_allowsUserCustomization"), new objj_ivar("_isVisible"), new objj_ivar("_sizeMode"), new objj_ivar("_desiredHeight"), new objj_ivar("_delegate"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_itemIdentifiers"), new objj_ivar("_identifiedItems"), new objj_ivar("_defaultItems"), new objj_ivar("_allowedItems"), new objj_ivar("_selectableItems"), new objj_ivar("_items"), new objj_ivar("_itemsSortedByVisibilityPriority"), new objj_ivar("_toolbarView"), new objj_ivar("_window")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("displayMode"), function $CPToolbar__displayMode(self, _cmd)
{
    return self._displayMode;
}
,["CPToolbarDisplayMode"]), new objj_method(sel_getUid("setDisplayMode:"), function $CPToolbar__setDisplayMode_(self, _cmd, newValue)
{
    self._displayMode = newValue;
}
,["void","CPToolbarDisplayMode"]), new objj_method(sel_getUid("sizeMode"), function $CPToolbar__sizeMode(self, _cmd)
{
    return self._sizeMode;
}
,["CPToolbarSizeMode"]), new objj_method(sel_getUid("setSizeMode:"), function $CPToolbar__setSizeMode_(self, _cmd, newValue)
{
    self._sizeMode = newValue;
}
,["void","CPToolbarSizeMode"]), new objj_method(sel_getUid("init"), function $CPToolbar__init(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "initWithIdentifier:", "");
}
,["id"]), new objj_method(sel_getUid("initWithIdentifier:"), function $CPToolbar__initWithIdentifier_(self, _cmd, anIdentifier)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPToolbar").super_class }, "init");
    if (self)
    {
        self._items = [];
        self._identifier = anIdentifier;
        self._isVisible = YES;
        self._sizeMode = CPToolbarSizeModeDefault;
        self._desiredHeight = 0;
        CPToolbar.isa.objj_msgSend2(CPToolbar, "_addToolbar:forIdentifier:", self, self._identifier);
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("identifier"), function $CPToolbar__identifier(self, _cmd)
{
    return self._identifier;
}
,["CPString"]), new objj_method(sel_getUid("delegate"), function $CPToolbar__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("isVisible"), function $CPToolbar__isVisible(self, _cmd)
{
    return self._isVisible;
}
,["BOOL"]), new objj_method(sel_getUid("setVisible:"), function $CPToolbar__setVisible_(self, _cmd, aFlag)
{
    if (self._isVisible === aFlag)
        return;
    self._isVisible = aFlag;
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_noteToolbarChanged"));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setSizeMode:"), function $CPToolbar__setSizeMode_(self, _cmd, aSize)
{
    if (aSize === self._sizeMode)
        return;
    self._sizeMode = aSize;
    ((___r1 = self.isa.objj_msgSend0(self, "_toolbarView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", self.isa.objj_msgSend0(self, "_toolbarViewFrame")));
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_noteToolbarChanged"));
    var ___r1;
}
,["void","CPToolbarSizeMode"]), new objj_method(sel_getUid("_window"), function $CPToolbar___window(self, _cmd)
{
    return self._window;
}
,["CPWindow"]), new objj_method(sel_getUid("_setWindow:"), function $CPToolbar___setWindow_(self, _cmd, aWindow)
{
    if (self._window)
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, _CPWindowDidChangeFirstResponderNotification, self._window));
    self._window = aWindow;
    if (self._window)
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_autoValidateVisibleItems"), _CPWindowDidChangeFirstResponderNotification, aWindow));
    var ___r1;
}
,["void","CPWindow"]), new objj_method(sel_getUid("setDelegate:"), function $CPToolbar__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"))))
        self._implementedDelegateMethods |= CPToolbarDelegate_toolbar_itemForItemIdentifier_willBeInsertedIntoToolbar_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("toolbarAllowedItemIdentifiers:"))))
        self._implementedDelegateMethods |= CPToolbarDelegate_toolbarAllowedItemIdentifiers_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("toolbarDefaultItemIdentifiers:"))))
        self._implementedDelegateMethods |= CPToolbarDelegate_toolbarDefaultItemIdentifiers_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("toolbarDidRemoveItem:"))))
        self._implementedDelegateMethods |= CPToolbarDelegate_toolbarDidRemoveItem_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("toolbarSelectableItemIdentifiers:"))))
        self._implementedDelegateMethods |= CPToolbarDelegate_toolbarSelectableItemIdentifiers_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("toolbarWillAddItem:"))))
        self._implementedDelegateMethods |= CPToolbarDelegate_toolbarWillAddItem_;
    self.isa.objj_msgSend0(self, "_reloadToolbarItems");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setDisplayMode:"), function $CPToolbar__setDisplayMode_(self, _cmd, aDisplayMode)
{
    if (self._displayMode === aDisplayMode)
        return;
    self._displayMode = aDisplayMode;
    self.isa.objj_msgSend0(self, "_reloadToolbarItems");
}
,["void","CPToolbarDisplayMode"]), new objj_method(sel_getUid("_loadConfiguration"), function $CPToolbar___loadConfiguration(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("_toolbarViewFrame"), function $CPToolbar___toolbarViewFrame(self, _cmd)
{
    var height = self._desiredHeight || (self._sizeMode != CPToolbarSizeModeSmall ? ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "regular-size-height")) : ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "small-size-height")));
    return CGRectMake(0.0, 0.0, 1200.0, height);
    var ___r1;
}
,["CGRect"]), new objj_method(sel_getUid("_toolbarView"), function $CPToolbar___toolbarView(self, _cmd)
{
    if (!self._toolbarView)
    {
        self._toolbarView = ((___r1 = (_CPToolbarView == null ? null : _CPToolbarView.isa.objj_msgSend0(_CPToolbarView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", self.isa.objj_msgSend0(self, "_toolbarViewFrame")));
        ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setToolbar:", self));
        ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
        ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadToolbarItems"));
    }
    return self._toolbarView;
    var ___r1;
}
,["CPView"]), new objj_method(sel_getUid("_reloadToolbarItems"), function $CPToolbar___reloadToolbarItems(self, _cmd)
{
    self._itemIdentifiers = ((___r1 = self._defaultItems), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "itemIdentifier")) || [];
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToToolbarDefaultItemIdentifiers"))
    {
        var itemIdentifiersFromDelegate = self.isa.objj_msgSend0(self, "_sendDelegateToolbarDefaultItemIdentifiers");
        if (itemIdentifiersFromDelegate)
            self._itemIdentifiers = (itemIdentifiersFromDelegate == null ? null : itemIdentifiersFromDelegate.isa.objj_msgSend1(itemIdentifiersFromDelegate, "arrayByAddingObjectsFromArray:", self._itemIdentifiers));
    }
    var index = 0,
        count = ((___r1 = self._itemIdentifiers), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    self._items = [];
    for (; index < count; ++index)
    {
        var identifier = self._itemIdentifiers[index],
            item = CPToolbarItem.isa.objj_msgSend1(CPToolbarItem, "_standardItemWithItemIdentifier:", identifier);
        if (!item)
            item = ((___r1 = self._identifiedItems), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", identifier));
        if (!item && self._delegate)
            item = self.isa.objj_msgSend2(self, "_sendDelegateItemForItemIdentifier:willBeInsertedIntoToolbar:", identifier, YES);
        item = (item == null ? null : item.isa.objj_msgSend0(item, "copy"));
        if (item === nil)
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Toolbar delegate " + self._delegate + " returned nil toolbar item for identifier \"" + identifier + "\"");
        item._toolbar = self;
        ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", item));
    }
    self._itemsSortedByVisibilityPriority = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "sortedArrayUsingFunction:context:", _CPToolbarItemVisibilityPriorityCompare, NULL));
    ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadToolbarItems"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("items"), function $CPToolbar__items(self, _cmd)
{
    return self._items;
}
,["CPArray"]), new objj_method(sel_getUid("visibleItems"), function $CPToolbar__visibleItems(self, _cmd)
{
    return ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleItems"));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("itemsSortedByVisibilityPriority"), function $CPToolbar__itemsSortedByVisibilityPriority(self, _cmd)
{
    return self._itemsSortedByVisibilityPriority;
}
,["CPArray"]), new objj_method(sel_getUid("validateVisibleItems"), function $CPToolbar__validateVisibleItems(self, _cmd)
{
    self.isa.objj_msgSend1(self, "_validateVisibleItems:", NO);
}
,["void"]), new objj_method(sel_getUid("_autoValidateVisibleItems"), function $CPToolbar___autoValidateVisibleItems(self, _cmd)
{
    self.isa.objj_msgSend1(self, "_validateVisibleItems:", YES);
}
,["void"]), new objj_method(sel_getUid("_validateVisibleItems:"), function $CPToolbar___validateVisibleItems_(self, _cmd, isAutovalidation)
{
    var toolbarItems = self.isa.objj_msgSend0(self, "visibleItems"),
        count = (toolbarItems == null ? null : toolbarItems.isa.objj_msgSend0(toolbarItems, "count"));
    while (count--)
    {
        var item = (toolbarItems == null ? null : toolbarItems.isa.objj_msgSend1(toolbarItems, "objectAtIndex:", count));
        if (!isAutovalidation || (item == null ? null : item.isa.objj_msgSend0(item, "autovalidates")))
            (item == null ? null : item.isa.objj_msgSend0(item, "validate"));
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("_itemForItemIdentifier:willBeInsertedIntoToolbar:"), function $CPToolbar___itemForItemIdentifier_willBeInsertedIntoToolbar_(self, _cmd, identifier, toolbar)
{
    var item = ((___r1 = self._identifiedItems), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", identifier));
    if (!item)
    {
        item = CPToolbarItem.isa.objj_msgSend1(CPToolbarItem, "_standardItemWithItemIdentifier:", identifier);
        if (self._delegate && !item)
        {
            item = ((___r1 = self.isa.objj_msgSend2(self, "_sendDelegateItemForItemIdentifier:willBeInsertedIntoToolbar:", identifier, toolbar)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
            if (!item)
                CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Toolbar delegate " + self._delegate + " returned nil toolbar item for identifier " + identifier);
        }
        ((___r1 = self._identifiedItems), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", item, identifier));
    }
    return item;
    var ___r1;
}
,["id","CPString","BOOL"]), new objj_method(sel_getUid("_itemsWithIdentifiers:"), function $CPToolbar___itemsWithIdentifiers_(self, _cmd, identifiers)
{
    var items = [];
    for (var i = 0; i < identifiers.length; i++)
        (items == null ? null : items.isa.objj_msgSend1(items, "addObject:", self.isa.objj_msgSend2(self, "_itemForItemIdentifier:willBeInsertedIntoToolbar:", identifiers[i], NO)));
    return items;
}
,["id","CPArray"]), new objj_method(sel_getUid("_defaultToolbarItems"), function $CPToolbar___defaultToolbarItems(self, _cmd)
{
    if (!self._defaultItems && self.isa.objj_msgSend0(self, "_delegateRespondsToToolbarDefaultItemIdentifiers"))
    {
        self._defaultItems = [];
        var identifiers = self.isa.objj_msgSend0(self, "_sendDelegateToolbarDefaultItemIdentifiers"),
            index = 0,
            count = (identifiers == null ? null : identifiers.isa.objj_msgSend0(identifiers, "count"));
        for (; index < count; ++index)
            ((___r1 = self._defaultItems), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", self.isa.objj_msgSend2(self, "_itemForItemIdentifier:willBeInsertedIntoToolbar:", identifiers[index], NO)));
    }
    return self._defaultItems;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("toolbarItemDidChange:"), function $CPToolbar__toolbarItemDidChange_(self, _cmd, anItem)
{
    if (((___r1 = self._identifiedItems), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", (anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "itemIdentifier")))))
        ((___r1 = self._identifiedItems), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", anItem, (anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "itemIdentifier"))));
    var index = 0,
        count = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    for (; index <= count; ++index)
    {
        var item = self._items[index];
        if ((item == null ? null : item.isa.objj_msgSend0(item, "itemIdentifier")) === (anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "itemIdentifier")))
        {
            self._items[index] = anItem;
            self._itemsSortedByVisibilityPriority = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "sortedArrayUsingFunction:context:", _CPToolbarItemVisibilityPriorityCompare, NULL));
            ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadToolbarItems"));
        }
    }
    var ___r1;
}
,["void","CPToolbarItem"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPToolbar__initialize(self, _cmd)
{
    if (self !== CPToolbar.isa.objj_msgSend0(CPToolbar, "class"))
        return;
    CPToolbarsByIdentifier = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    CPToolbarConfigurationsByIdentifier = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
}
,["void"]), new objj_method(sel_getUid("_addToolbar:forIdentifier:"), function $CPToolbar___addToolbar_forIdentifier_(self, _cmd, toolbar, identifier)
{
    var toolbarsSharingIdentifier = (CPToolbarsByIdentifier == null ? null : CPToolbarsByIdentifier.isa.objj_msgSend1(CPToolbarsByIdentifier, "objectForKey:", identifier));
    if (!toolbarsSharingIdentifier)
    {
        toolbarsSharingIdentifier = [];
        (CPToolbarsByIdentifier == null ? null : CPToolbarsByIdentifier.isa.objj_msgSend2(CPToolbarsByIdentifier, "setObject:forKey:", toolbarsSharingIdentifier, identifier));
    }
    (toolbarsSharingIdentifier == null ? null : toolbarsSharingIdentifier.isa.objj_msgSend1(toolbarsSharingIdentifier, "addObject:", toolbar));
}
,["void","CPToolbar","CPString"])]);
}var CPToolbarIdentifierKey = "CPToolbarIdentifierKey",
    CPToolbarDisplayModeKey = "CPToolbarDisplayModeKey",
    CPToolbarShowsBaselineSeparatorKey = "CPToolbarShowsBaselineSeparatorKey",
    CPToolbarAllowsUserCustomizationKey = "CPToolbarAllowsUserCustomizationKey",
    CPToolbarIsVisibleKey = "CPToolbarIsVisibleKey",
    CPToolbarDelegateKey = "CPToolbarDelegateKey",
    CPToolbarIdentifiedItemsKey = "CPToolbarIdentifiedItemsKey",
    CPToolbarDefaultItemsKey = "CPToolbarDefaultItemsKey",
    CPToolbarAllowedItemsKey = "CPToolbarAllowedItemsKey",
    CPToolbarSelectableItemsKey = "CPToolbarSelectableItemsKey",
    CPToolbarSizeModeKey = "CPToolbarSizeModeKey";
{
var the_class = objj_getClass("CPToolbar")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbar\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPToolbar__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPToolbar").super_class }, "init");
    if (self)
    {
        self._identifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarIdentifierKey));
        self._displayMode = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPToolbarDisplayModeKey));
        self._showsBaselineSeparator = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPToolbarShowsBaselineSeparatorKey));
        self._allowsUserCustomization = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPToolbarAllowsUserCustomizationKey));
        self._isVisible = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPToolbarIsVisibleKey));
        self._sizeMode = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPToolbarSizeModeKey));
        self._identifiedItems = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarIdentifiedItemsKey));
        self._defaultItems = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarDefaultItemsKey));
        self._allowedItems = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarAllowedItemsKey));
        self._selectableItems = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarSelectableItemsKey));
        ((___r1 = ((___r2 = self._identifiedItems), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "allValues"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("_setToolbar:"), self));
        self._items = [];
        CPToolbar.isa.objj_msgSend2(CPToolbar, "_addToolbar:forIdentifier:", self, self._identifier);
        (self == null ? null : self.isa.objj_msgSend1(self, "setDelegate:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarDelegateKey))));
        ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "performSelector:target:argument:order:modes:", sel_getUid("_reloadToolbarItems"), self, nil, 0, [CPDefaultRunLoopMode]));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPToolbar__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._identifier, CPToolbarIdentifierKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._displayMode, CPToolbarDisplayModeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._showsBaselineSeparator, CPToolbarShowsBaselineSeparatorKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowsUserCustomization, CPToolbarAllowsUserCustomizationKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isVisible, CPToolbarIsVisibleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._sizeMode, CPToolbarSizeModeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._identifiedItems, CPToolbarIdentifiedItemsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._defaultItems, CPToolbarDefaultItemsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._allowedItems, CPToolbarAllowedItemsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._selectableItems, CPToolbarSelectableItemsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeConditionalObject:forKey:", self._delegate, CPToolbarDelegateKey));
}
,["void","CPCoder"])]);
}var _CPToolbarViewBackgroundColor = nil,
    _CPToolbarViewExtraItemsImage = nil,
    _CPToolbarViewExtraItemsAlternateImage = nil;
var _CPToolbarItemInfoMake = function(anIndex, aView, aLabel, aMinWidth)
{
    return {index: anIndex, view: aView, label: aLabel, minWidth: aMinWidth};
};
{var the_class = objj_allocateClassPair(CPView, "_CPToolbarView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbar"), new objj_ivar("_flexibleWidthIndexes"), new objj_ivar("_visibleFlexibleWidthIndexes"), new objj_ivar("_itemInfos"), new objj_ivar("_viewsForToolbarItems"), new objj_ivar("_visibleItems"), new objj_ivar("_invisibleItems"), new objj_ivar("_additionalItemsButton"), new objj_ivar("_labelColor"), new objj_ivar("_labelShadowColor"), new objj_ivar("_minWidth"), new objj_ivar("_FIXME_isHUD")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("visibleItems"), function $_CPToolbarView__visibleItems(self, _cmd)
{
    return self._visibleItems;
}
,["CPArray"]), new objj_method(sel_getUid("initWithFrame:"), function $_CPToolbarView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._minWidth = 0;
        self._labelColor = CPColor.isa.objj_msgSend0(CPColor, "blackColor");
        self._labelShadowColor = CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 1.0, 0.75);
        self._additionalItemsButton = ((___r1 = CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithFrame:pullsDown:", CGRectMake(0.0, 0.0, 10.0, 15.0), YES));
        ((___r1 = self._additionalItemsButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBordered:", NO));
        ((___r1 = self._additionalItemsButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImagePosition:", CPImageOnly));
        ((___r1 = ((___r2 = self._additionalItemsButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "menu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setShowsStateColumn:", NO));
        ((___r1 = ((___r2 = self._additionalItemsButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "menu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoenablesItems:", NO));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CGRect"]), new objj_method(sel_getUid("setToolbar:"), function $_CPToolbarView__setToolbar_(self, _cmd, aToolbar)
{
    self._toolbar = aToolbar;
}
,["void","CPToolbar"]), new objj_method(sel_getUid("toolbar"), function $_CPToolbarView__toolbar(self, _cmd)
{
    return self._toolbar;
}
,["CPToolbar"]), new objj_method(sel_getUid("FIXME_setIsHUD:"), function $_CPToolbarView__FIXME_setIsHUD_(self, _cmd, shouldBeHUD)
{
    if (self._FIXME_isHUD === shouldBeHUD)
        return;
    self._FIXME_isHUD = shouldBeHUD;
    var items = ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "items")),
        count = (items == null ? null : items.isa.objj_msgSend0(items, "count"));
    while (count--)
        ((___r1 = self.isa.objj_msgSend1(self, "viewForItem:", items[count])), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "FIXME_setIsHUD:", shouldBeHUD));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $_CPToolbarView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
    self.isa.objj_msgSend0(self, "tile");
}
,["void","CGSize"]), new objj_method(sel_getUid("viewForItem:"), function $_CPToolbarView__viewForItem_(self, _cmd, anItem)
{
    return self._viewsForToolbarItems[(anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "UID"))] || nil;
}
,["_CPToolbarItemView","CPToolbarItem"]), new objj_method(sel_getUid("tile"), function $_CPToolbarView__tile(self, _cmd)
{
    var items = ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "items")),
        itemsWidth = CGRectGetWidth(self.isa.objj_msgSend0(self, "bounds")),
        minWidth = self._minWidth,
        invisibleItemsSortedByPriority = [];
    self._visibleItems = items;
    if (itemsWidth < minWidth)
    {
        itemsWidth -= self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "extra-item-width");
        self._visibleItems = ((___r1 = self._visibleItems), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        var itemsSortedByVisibilityPriority = ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemsSortedByVisibilityPriority")),
            count = itemsSortedByVisibilityPriority.length;
        while (minWidth > itemsWidth && count)
        {
            var item = itemsSortedByVisibilityPriority[--count],
                view = self.isa.objj_msgSend1(self, "viewForItem:", item);
            minWidth -= (view == null ? null : view.isa.objj_msgSend0(view, "minSize")).width + self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "item-margin");
            ((___r1 = self._visibleItems), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectIdenticalTo:", item));
            (invisibleItemsSortedByPriority == null ? null : invisibleItemsSortedByPriority.isa.objj_msgSend1(invisibleItemsSortedByPriority, "addObject:", item));
            (view == null ? null : view.isa.objj_msgSend1(view, "setHidden:", YES));
            (view == null ? null : view.isa.objj_msgSend1(view, "FIXME_setIsHUD:", self._FIXME_isHUD));
        }
    }
    var count = (items == null ? null : items.isa.objj_msgSend0(items, "count")),
        height = 0.0;
    while (count--)
    {
        var view = self.isa.objj_msgSend1(self, "viewForItem:", items[count]),
            minSize = (view == null ? null : view.isa.objj_msgSend0(view, "minSize"));
        if (height < minSize.height)
            height = minSize.height;
    }
    var contentInset = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "content-inset"),
        newDesiredHeight = height ? height + contentInset.top + contentInset.bottom : 0;
    if (newDesiredHeight != self._toolbar._desiredHeight)
    {
        self._toolbar._desiredHeight = newDesiredHeight;
        self.isa.objj_msgSend1(self, "setFrame:", ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_toolbarViewFrame")));
        ((___r1 = self._toolbar._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_noteToolbarChanged"));
        return;
    }
    var count = self._visibleItems.length,
        flexibleItemIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    while (count--)
    {
        var item = self._visibleItems[count],
            view = self.isa.objj_msgSend1(self, "viewForItem:", item),
            minSize = (view == null ? null : view.isa.objj_msgSend0(view, "minSize"));
        if (minSize.width !== (view == null ? null : view.isa.objj_msgSend0(view, "maxSize")).width)
            (flexibleItemIndexes == null ? null : flexibleItemIndexes.isa.objj_msgSend1(flexibleItemIndexes, "addIndex:", count));
        else
            (view == null ? null : view.isa.objj_msgSend1(view, "setFrameSize:", CGSizeMake(minSize.width, height)));
        (view == null ? null : view.isa.objj_msgSend1(view, "setHidden:", NO));
    }
    var remainingSpace = itemsWidth - minWidth,
        proportionate = 0.0;
    while (remainingSpace && (flexibleItemIndexes == null ? null : flexibleItemIndexes.isa.objj_msgSend0(flexibleItemIndexes, "count")))
    {
        proportionate += remainingSpace / (flexibleItemIndexes == null ? null : flexibleItemIndexes.isa.objj_msgSend0(flexibleItemIndexes, "count"));
        remainingSpace = 0.0;
        var index = CPNotFound;
        while ((index = (flexibleItemIndexes == null ? null : flexibleItemIndexes.isa.objj_msgSend1(flexibleItemIndexes, "indexGreaterThanIndex:", index))) !== CPNotFound)
        {
            var item = self._visibleItems[index],
                view = self.isa.objj_msgSend1(self, "viewForItem:", item),
                proposedWidth = (view == null ? null : view.isa.objj_msgSend0(view, "minSize")).width + proportionate,
                constrainedWidth = MIN(proposedWidth, (view == null ? null : view.isa.objj_msgSend0(view, "maxSize")).width);
            if (constrainedWidth < proposedWidth)
            {
                (flexibleItemIndexes == null ? null : flexibleItemIndexes.isa.objj_msgSend1(flexibleItemIndexes, "removeIndex:", index));
                remainingSpace += proposedWidth - constrainedWidth;
            }
            (view == null ? null : view.isa.objj_msgSend1(view, "setFrameSize:", CGSizeMake(constrainedWidth, height)));
        }
    }
    var index = 0,
        count = self._visibleItems.length,
        x = contentInset.left,
        y = contentInset.top;
    for (; index < count; ++index)
    {
        var view = self.isa.objj_msgSend1(self, "viewForItem:", self._visibleItems[index]),
            viewWidth = CGRectGetWidth((view == null ? null : view.isa.objj_msgSend0(view, "frame")));
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrame:", CGRectMake(x, y, viewWidth, height)));
        x += viewWidth + self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "item-margin");
    }
    var needsAdditionalItemsButton = NO;
    if ((invisibleItemsSortedByPriority == null ? null : invisibleItemsSortedByPriority.isa.objj_msgSend0(invisibleItemsSortedByPriority, "count")))
    {
        var index = 0,
            count = (items == null ? null : items.isa.objj_msgSend0(items, "count"));
        self._invisibleItems = [];
        for (; index < count; ++index)
        {
            var item = items[index];
            if ((invisibleItemsSortedByPriority == null ? null : invisibleItemsSortedByPriority.isa.objj_msgSend1(invisibleItemsSortedByPriority, "indexOfObjectIdenticalTo:", item)) !== CPNotFound)
            {
                ((___r1 = self._invisibleItems), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", item));
                var identifier = (item == null ? null : item.isa.objj_msgSend0(item, "itemIdentifier"));
                if (identifier !== CPToolbarSpaceItemIdentifier && identifier !== CPToolbarFlexibleSpaceItemIdentifier && identifier !== CPToolbarSeparatorItemIdentifier)
                    needsAdditionalItemsButton = YES;
            }
        }
    }
    if (needsAdditionalItemsButton)
    {
        ((___r1 = self._additionalItemsButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(itemsWidth + 5.0, (CGRectGetHeight(self.isa.objj_msgSend0(self, "bounds")) - CGRectGetHeight(((___r2 = self._additionalItemsButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")))) / 2.0)));
        self.isa.objj_msgSend1(self, "addSubview:", self._additionalItemsButton);
        ((___r1 = self._additionalItemsButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllItems"));
        ((___r1 = self._additionalItemsButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addItemWithTitle:", "Additional Items"));
        ((___r1 = ((___r2 = self._additionalItemsButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "itemArray"))[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "extra-item-extra-image")));
        var index = 0,
            count = ((___r1 = self._invisibleItems), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
            hasNonSeparatorItem = NO;
        for (; index < count; ++index)
        {
            var item = self._invisibleItems[index],
                identifier = (item == null ? null : item.isa.objj_msgSend0(item, "itemIdentifier"));
            if (identifier === CPToolbarSpaceItemIdentifier || identifier === CPToolbarFlexibleSpaceItemIdentifier)
                continue;
            if (identifier === CPToolbarSeparatorItemIdentifier)
            {
                if (hasNonSeparatorItem)
                    ((___r1 = self._additionalItemsButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addItem:", CPMenuItem.isa.objj_msgSend0(CPMenuItem, "separatorItem")));
                continue;
            }
            hasNonSeparatorItem = YES;
            var menuItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", (item == null ? null : item.isa.objj_msgSend0(item, "label")), sel_getUid("didSelectMenuItem:"), nil));
            (menuItem == null ? null : menuItem.isa.objj_msgSend1(menuItem, "setRepresentedObject:", item));
            (menuItem == null ? null : menuItem.isa.objj_msgSend1(menuItem, "setImage:", (item == null ? null : item.isa.objj_msgSend0(item, "image"))));
            (menuItem == null ? null : menuItem.isa.objj_msgSend1(menuItem, "setTarget:", self));
            (menuItem == null ? null : menuItem.isa.objj_msgSend1(menuItem, "setEnabled:", (item == null ? null : item.isa.objj_msgSend0(item, "isEnabled"))));
            ((___r1 = self._additionalItemsButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addItem:", menuItem));
        }
    }
    else
        ((___r1 = self._additionalItemsButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("didSelectMenuItem:"), function $_CPToolbarView__didSelectMenuItem_(self, _cmd, aSender)
{
    var toolbarItem = (aSender == null ? null : aSender.isa.objj_msgSend0(aSender, "representedObject"));
    (CPApp == null ? null : CPApp.isa.objj_msgSend3(CPApp, "sendAction:to:from:", (toolbarItem == null ? null : toolbarItem.isa.objj_msgSend0(toolbarItem, "action")), (toolbarItem == null ? null : toolbarItem.isa.objj_msgSend0(toolbarItem, "target")), toolbarItem));
}
,["void","id"]), new objj_method(sel_getUid("reloadToolbarItems"), function $_CPToolbarView__reloadToolbarItems(self, _cmd)
{
    var subviews = self.isa.objj_msgSend0(self, "subviews"),
        count = subviews.length;
    while (count--)
        ((___r1 = subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    var items = ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "items")),
        index = 0;
    count = items.length;
    self._minWidth = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "item-margin");
    self._viewsForToolbarItems = {};
    for (; index < count; ++index)
    {
        var item = items[index],
            view = ((___r1 = (_CPToolbarItemView == null ? null : _CPToolbarItemView.isa.objj_msgSend0(_CPToolbarItemView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithToolbarItem:toolbar:", item, self));
        self._viewsForToolbarItems[(item == null ? null : item.isa.objj_msgSend0(item, "UID"))] = view;
        if ((item == null ? null : item.isa.objj_msgSend0(item, "toolTip")) && (view == null ? null : view.isa.objj_msgSend1(view, "respondsToSelector:", sel_getUid("setToolTip:"))))
            (view == null ? null : view.isa.objj_msgSend1(view, "setToolTip:", (item == null ? null : item.isa.objj_msgSend0(item, "toolTip"))));
        self.isa.objj_msgSend1(self, "addSubview:", view);
        self._minWidth += (view == null ? null : view.isa.objj_msgSend0(view, "minSize")).width + self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "item-margin");
    }
    self.isa.objj_msgSend0(self, "tile");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPToolbarView__layoutSubviews(self, _cmd)
{
    ((___r1 = self._additionalItemsButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlternateImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "extra-item-extra-alternate-image")));
    var ___r1;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPToolbarView__defaultThemeClass(self, _cmd)
{
    return "toolbar-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPToolbarView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 10.0, "item-margin", 20.0, "extra-item-width", CPNull.isa.objj_msgSend0(CPNull, "null"), "extra-item-extra-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "extra-item-extra-alternate-image", CGInsetMake(4.0, 4.0, 4.0, 10), "content-inset", 59.0, "regular-size-height", 46.0, "small-size-height", CPNull.isa.objj_msgSend0(CPNull, "null"), "image-item-separator-color", CGRectMake(0.0, 0.0, 2.0, 32.0), "image-item-separator-size");
}
,["CPDictionary"])]);
}var _CPToolbarItemVisibilityPriorityCompare = function(lhs, rhs)
{
    var lhsVisibilityPriority = (lhs == null ? null : lhs.isa.objj_msgSend0(lhs, "visibilityPriority")),
        rhsVisibilityPriority = (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "visibilityPriority"));
    if (lhsVisibilityPriority == rhsVisibilityPriority)
        return CPOrderedSame;
    if (lhsVisibilityPriority > rhsVisibilityPriority)
        return CPOrderedAscending;
    return CPOrderedDescending;
};
var LABEL_MARGIN = 2.0;
{var the_class = objj_allocateClassPair(CPControl, "_CPToolbarItemView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_labelSize"), new objj_ivar("_toolbarItem"), new objj_ivar("_toolbar"), new objj_ivar("_imageView"), new objj_ivar("_view"), new objj_ivar("_labelField"), new objj_ivar("_FIXME_isHUD")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("minSize"), function $_CPToolbarItemView__minSize(self, _cmd)
{
    return self._minSize;
}
,["CGSize"]), new objj_method(sel_getUid("maxSize"), function $_CPToolbarItemView__maxSize(self, _cmd)
{
    return self._maxSize;
}
,["CGSize"]), new objj_method(sel_getUid("initWithToolbarItem:toolbar:"), function $_CPToolbarItemView__initWithToolbarItem_toolbar_(self, _cmd, aToolbarItem, aToolbar)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarItemView").super_class }, "init");
    if (self)
    {
        self._toolbarItem = aToolbarItem;
        self._labelField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", 11.0)));
        ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", (self == null ? null : self.isa.objj_msgSend0(self, "FIXME_labelColor"))));
        ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", (self == null ? null : self.isa.objj_msgSend0(self, "FIXME_labelShadowColor"))));
        ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(0.0, 1.0)));
        ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewMinXMargin));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._labelField));
        (self == null ? null : self.isa.objj_msgSend0(self, "updateFromItem"));
        self._toolbar = aToolbar;
        var keyPaths = ["label", "image", "alternateImage", "minSize", "maxSize", "target", "action", "enabled"],
            index = 0,
            count = (keyPaths == null ? null : keyPaths.isa.objj_msgSend0(keyPaths, "count"));
        for (; index < count; ++index)
            ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, keyPaths[index], 0, NULL));
    }
    return self;
    var ___r1;
}
,["id","CPToolbarItem","CPToolbar"]), new objj_method(sel_getUid("FIXME_setIsHUD:"), function $_CPToolbarItemView__FIXME_setIsHUD_(self, _cmd, shouldBeHUD)
{
    self._FIXME_isHUD = shouldBeHUD;
    ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", self.isa.objj_msgSend0(self, "FIXME_labelColor")));
    ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend0(self, "FIXME_labelShadowColor")));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("updateFromItem"), function $_CPToolbarItemView__updateFromItem(self, _cmd)
{
    var identifier = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemIdentifier"));
    if (identifier === CPToolbarSpaceItemIdentifier || identifier === CPToolbarFlexibleSpaceItemIdentifier || identifier === CPToolbarSeparatorItemIdentifier)
    {
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        self._minSize = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "minSize"));
        self._maxSize = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "maxSize"));
        if (identifier === CPToolbarSeparatorItemIdentifier)
        {
            self._view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
            self.isa.objj_msgSend1(self, "addSubview:", self._view);
        }
        return;
    }
    self.isa.objj_msgSend1(self, "setTarget:", ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "target")));
    self.isa.objj_msgSend1(self, "setAction:", ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "action")));
    var view = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view")) || nil;
    if (view !== self._view)
    {
        if (!view)
            ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        else
        {
            self.isa.objj_msgSend1(self, "addSubview:", view);
            ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        }
        self._view = view;
    }
    if (!self._view)
    {
        if (!self._imageView)
        {
            self._imageView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", self.isa.objj_msgSend0(self, "bounds")));
            ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImageScaling:", CPImageScaleProportionallyDown));
            self.isa.objj_msgSend1(self, "addSubview:", self._imageView);
        }
        ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._toolbarItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image"))));
    }
    var minSize = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "minSize")),
        maxSize = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "maxSize"));
    ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", ((___r2 = self._toolbarItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "label"))));
    ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    self.isa.objj_msgSend1(self, "setEnabled:", ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled")));
    self._labelSize = ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size;
    var iconOnly = ((___r1 = ((___r2 = self._toolbarItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "toolbar"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "displayMode")) === CPToolbarDisplayModeIconOnly,
        labelOnly = ((___r1 = ((___r2 = self._toolbarItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "toolbar"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "displayMode")) === CPToolbarDisplayModeLabelOnly;
    ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", iconOnly));
    ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", labelOnly));
    self._minSize = CGSizeMake(MAX(self._labelSize.width, minSize.width), (labelOnly ? 0 : minSize.height) + (iconOnly ? 0 : self._labelSize.height + LABEL_MARGIN));
    self._maxSize = CGSizeMake(MAX(self._labelSize.width, maxSize.width), 100000000.0);
    ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tile"));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPToolbarItemView__layoutSubviews(self, _cmd)
{
    var identifier = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemIdentifier"));
    if (identifier === CPToolbarSpaceItemIdentifier || identifier === CPToolbarFlexibleSpaceItemIdentifier)
        return;
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        width = CGRectGetWidth(bounds);
    if (identifier === CPToolbarSeparatorItemIdentifier)
    {
        var itemSeparatorColor = ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "image-item-separator-color")),
            itemSeparatorSize = ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "image-item-separator-size"));
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(ROUND((width - itemSeparatorSize.size.width) / 2.0), 0.0, itemSeparatorSize.size.width, CGRectGetHeight(bounds))));
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", itemSeparatorColor));
        return;
    }
    var view = self._view || self._imageView,
        itemMaxSize = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "maxSize")),
        iconOnly = ((___r1 = ((___r2 = self._toolbarItem), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "toolbar"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "displayMode")) === CPToolbarDisplayModeIconOnly,
        height = CGRectGetHeight(bounds) - (iconOnly ? 0 : self._labelSize.height),
        viewWidth = MIN(itemMaxSize.width, width),
        viewHeight = MIN(itemMaxSize.height, height);
    (view == null ? null : view.isa.objj_msgSend1(view, "setFrame:", CGRectMake(ROUND((width - viewWidth) / 2.0), ROUND((height - viewHeight) / 2.0), viewWidth, viewHeight)));
    ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(ROUND((width - self._labelSize.width) / 2.0), CGRectGetHeight(bounds) - self._labelSize.height)));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("mouseDown:"), function $_CPToolbarItemView__mouseDown_(self, _cmd, anEvent)
{
    if (((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view")))
        return ((___r1 = self.isa.objj_msgSend0(self, "nextResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseDown:", anEvent));
    var identifier = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemIdentifier"));
    if (identifier === CPToolbarSpaceItemIdentifier || identifier === CPToolbarFlexibleSpaceItemIdentifier || identifier === CPToolbarSeparatorItemIdentifier)
        return ((___r1 = self.isa.objj_msgSend0(self, "nextResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseDown:", anEvent));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarItemView").super_class }, "mouseDown:", anEvent);
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("setEnabled:"), function $_CPToolbarItemView__setEnabled_(self, _cmd, shouldBeEnabled)
{
    if (self.isa.objj_msgSend0(self, "isEnabled") === shouldBeEnabled)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarItemView").super_class }, "setEnabled:", shouldBeEnabled);
    if (shouldBeEnabled)
    {
        ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlphaValue:", 1.0));
        ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlphaValue:", 1.0));
    }
    else
    {
        ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlphaValue:", 0.5));
        ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlphaValue:", 0.5));
    }
    ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tile"));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("FIXME_labelColor"), function $_CPToolbarItemView__FIXME_labelColor(self, _cmd)
{
    if (self._FIXME_isHUD)
        return CPColor.isa.objj_msgSend0(CPColor, "whiteColor");
    return CPColor.isa.objj_msgSend0(CPColor, "blackColor");
}
,["CPColor"]), new objj_method(sel_getUid("FIXME_labelShadowColor"), function $_CPToolbarItemView__FIXME_labelShadowColor(self, _cmd)
{
    if (self._FIXME_isHUD)
        return self.isa.objj_msgSend0(self, "isHighlighted") ? CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 1.0, 0.5) : CPColor.isa.objj_msgSend0(CPColor, "clearColor");
    return self.isa.objj_msgSend0(self, "isHighlighted") ? CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 0.0, 0.3) : CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 1.0, 0.75);
}
,["CPColor"]), new objj_method(sel_getUid("setHighlighted:"), function $_CPToolbarItemView__setHighlighted_(self, _cmd, shouldBeHighlighted)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarItemView").super_class }, "setHighlighted:", shouldBeHighlighted);
    if (shouldBeHighlighted)
    {
        var alternateImage = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "alternateImage"));
        if (alternateImage)
            ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", alternateImage));
        ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMakeZero()));
    }
    else
    {
        var image = ((___r1 = self._toolbarItem), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "image"));
        if (image)
            ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", image));
        ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(0.0, 1.0)));
    }
    ((___r1 = self._labelField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend0(self, "FIXME_labelShadowColor")));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("sendAction:to:"), function $_CPToolbarItemView__sendAction_to_(self, _cmd, anAction, aSender)
{
    (CPApp == null ? null : CPApp.isa.objj_msgSend3(CPApp, "sendAction:to:from:", anAction, aSender, self._toolbarItem));
}
,["BOOL","SEL","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPToolbarItemView__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, aChange, aContext)
{
    if (aKeyPath === "enabled")
        self.isa.objj_msgSend1(self, "setEnabled:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "isEnabled")));
    else if (aKeyPath === "target")
        self.isa.objj_msgSend1(self, "setTarget:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "target")));
    else if (aKeyPath === "action")
        self.isa.objj_msgSend1(self, "setAction:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "action")));
    else
        self.isa.objj_msgSend0(self, "updateFromItem");
}
,["void","CPString","id","CPDictionary","id"])]);
}{
var the_class = objj_getClass("CPToolbar")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbar\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_delegateRespondsToToolbarDefaultItemIdentifiers"), function $CPToolbar___delegateRespondsToToolbarDefaultItemIdentifiers(self, _cmd)
{
    return self._implementedDelegateMethods & CPToolbarDelegate_toolbarDefaultItemIdentifiers_;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateItemForItemIdentifier:willBeInsertedIntoToolbar:"), function $CPToolbar___sendDelegateItemForItemIdentifier_willBeInsertedIntoToolbar_(self, _cmd, itemIdentifier, flag)
{
    if (!(self._implementedDelegateMethods & CPToolbarDelegate_toolbar_itemForItemIdentifier_willBeInsertedIntoToolbar_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:", self, itemIdentifier, flag));
    var ___r1;
}
,["CPToolbarItem","CPString","BOOL"]), new objj_method(sel_getUid("_sendDelegateToolbarAllowedItemIdentifiers"), function $CPToolbar___sendDelegateToolbarAllowedItemIdentifiers(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPToolbarDelegate_toolbarAllowedItemIdentifiers_))
        return [];
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "toolbarAllowedItemIdentifiers:", self));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("_sendDelegateToolbarDefaultItemIdentifiers"), function $CPToolbar___sendDelegateToolbarDefaultItemIdentifiers(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPToolbarDelegate_toolbarDefaultItemIdentifiers_))
        return [];
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "toolbarDefaultItemIdentifiers:", self));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("_sendDelegateToolbarDidRemoveItem:"), function $CPToolbar___sendDelegateToolbarDidRemoveItem_(self, _cmd, notification)
{
    if (!(self._delegate & CPToolbarDelegate_toolbarDidRemoveItem_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "toolbarDidRemoveItem:", notification));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("_sendDelegateToolbarSelectableItemIdentifiers"), function $CPToolbar___sendDelegateToolbarSelectableItemIdentifiers(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPToolbarDelegate_toolbarSelectableItemIdentifiers_))
        return [];
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "toolbarSelectableItemIdentifiers:", self));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("_sendDelegateToolbarWillAddItem:"), function $CPToolbar___sendDelegateToolbarWillAddItem_(self, _cmd, notification)
{
    if (!(self._delegate & CPToolbarDelegate_toolbarWillAddItem_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "toolbarWillAddItem:", notification));
    var ___r1;
}
,["void","CPNotification"])]);
}