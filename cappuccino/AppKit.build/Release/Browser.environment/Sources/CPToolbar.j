@STATIC;1.0;I;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jt;41371;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPPopUpButton.j", YES);objj_executeFile("CPToolbarItem.j", YES);CPToolbarDisplayModeDefault = 0;
CPToolbarDisplayModeIconAndLabel = 1;
CPToolbarDisplayModeIconOnly = 2;
CPToolbarDisplayModeLabelOnly = 3;
CPToolbarSizeModeDefault = 0;
CPToolbarSizeModeRegular = 1;
CPToolbarSizeModeSmall = 2;
var CPToolbarsByIdentifier = nil,
    CPToolbarConfigurationsByIdentifier = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPToolbar"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_displayMode"), new objj_ivar("_showsBaselineSeparator"), new objj_ivar("_allowsUserCustomization"), new objj_ivar("_isVisible"), new objj_ivar("_sizeMode"), new objj_ivar("_desiredHeight"), new objj_ivar("_delegate"), new objj_ivar("_itemIdentifiers"), new objj_ivar("_identifiedItems"), new objj_ivar("_defaultItems"), new objj_ivar("_allowedItems"), new objj_ivar("_selectableItems"), new objj_ivar("_items"), new objj_ivar("_itemsSortedByVisibilityPriority"), new objj_ivar("_toolbarView"), new objj_ivar("_window")]);objj_registerClassPair(the_class);
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
    return objj_msgSend(self, "initWithIdentifier:", "");
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
        objj_msgSend(CPToolbar, "_addToolbar:forIdentifier:", self, self._identifier);
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
    objj_msgSend(self._window, "_noteToolbarChanged");
}
,["void","BOOL"]), new objj_method(sel_getUid("setSizeMode:"), function $CPToolbar__setSizeMode_(self, _cmd, aSize)
{
    if (aSize === self._sizeMode)
        return;
    self._sizeMode = aSize;
    objj_msgSend(objj_msgSend(self, "_toolbarView"), "setFrame:", objj_msgSend(self, "_toolbarViewFrame"));
    objj_msgSend(self._window, "_noteToolbarChanged");
}
,["void","CPToolbarSizeMode"]), new objj_method(sel_getUid("_window"), function $CPToolbar___window(self, _cmd)
{
    return self._window;
}
,["CPWindow"]), new objj_method(sel_getUid("_setWindow:"), function $CPToolbar___setWindow_(self, _cmd, aWindow)
{
    if (self._window)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, _CPWindowDidChangeFirstResponderNotification, self._window);
    self._window = aWindow;
    if (self._window)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_autoValidateVisibleItems"), _CPWindowDidChangeFirstResponderNotification, aWindow);
}
,["void","CPWindow"]), new objj_method(sel_getUid("setDelegate:"), function $CPToolbar__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    objj_msgSend(self, "_reloadToolbarItems");
}
,["void","id"]), new objj_method(sel_getUid("setDisplayMode:"), function $CPToolbar__setDisplayMode_(self, _cmd, aDisplayMode)
{
    if (self._displayMode === aDisplayMode)
        return;
    self._displayMode = aDisplayMode;
    objj_msgSend(self, "_reloadToolbarItems");
}
,["void","CPToolbarDisplayMode"]), new objj_method(sel_getUid("_loadConfiguration"), function $CPToolbar___loadConfiguration(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("_toolbarViewFrame"), function $CPToolbar___toolbarViewFrame(self, _cmd)
{
    var height = self._desiredHeight || (self._sizeMode != CPToolbarSizeModeSmall ? objj_msgSend(self._toolbarView, "valueForThemeAttribute:", "regular-size-height") : objj_msgSend(self._toolbarView, "valueForThemeAttribute:", "small-size-height"));
    return CGRectMake(0.0, 0.0, 1200.0, height);
}
,["CGRect"]), new objj_method(sel_getUid("_toolbarView"), function $CPToolbar___toolbarView(self, _cmd)
{
    if (!self._toolbarView)
    {
        self._toolbarView = objj_msgSend(objj_msgSend(_CPToolbarView, "alloc"), "initWithFrame:", objj_msgSend(self, "_toolbarViewFrame"));
        objj_msgSend(self._toolbarView, "setToolbar:", self);
        objj_msgSend(self._toolbarView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self._toolbarView, "reloadToolbarItems");
    }
    return self._toolbarView;
}
,["CPView"]), new objj_method(sel_getUid("_reloadToolbarItems"), function $CPToolbar___reloadToolbarItems(self, _cmd)
{
    self._itemIdentifiers = objj_msgSend(self._defaultItems, "valueForKey:", "itemIdentifier") || [];
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("toolbarDefaultItemIdentifiers:")))
    {
        var itemIdentifiersFromDelegate = objj_msgSend(self._delegate, "toolbarDefaultItemIdentifiers:", self);
        if (itemIdentifiersFromDelegate)
            self._itemIdentifiers = objj_msgSend(itemIdentifiersFromDelegate, "arrayByAddingObjectsFromArray:", self._itemIdentifiers);
    }
    var index = 0,
        count = objj_msgSend(self._itemIdentifiers, "count");
    self._items = [];
    for (; index < count; ++index)
    {
        var identifier = self._itemIdentifiers[index],
            item = objj_msgSend(CPToolbarItem, "_standardItemWithItemIdentifier:", identifier);
        if (!item)
            item = objj_msgSend(self._identifiedItems, "objectForKey:", identifier);
        if (!item && self._delegate)
            item = objj_msgSend(self._delegate, "toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:", self, identifier, YES);
        item = objj_msgSend(item, "copy");
        if (item === nil)
            objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Toolbar delegate " + self._delegate + " returned nil toolbar item for identifier \"" + identifier + "\"");
        item._toolbar = self;
        objj_msgSend(self._items, "addObject:", item);
    }
    self._itemsSortedByVisibilityPriority = objj_msgSend(self._items, "sortedArrayUsingFunction:context:", _CPToolbarItemVisibilityPriorityCompare, NULL);
    objj_msgSend(self._toolbarView, "reloadToolbarItems");
}
,["void"]), new objj_method(sel_getUid("items"), function $CPToolbar__items(self, _cmd)
{
    return self._items;
}
,["CPArray"]), new objj_method(sel_getUid("visibleItems"), function $CPToolbar__visibleItems(self, _cmd)
{
    return objj_msgSend(self._toolbarView, "visibleItems");
}
,["CPArray"]), new objj_method(sel_getUid("itemsSortedByVisibilityPriority"), function $CPToolbar__itemsSortedByVisibilityPriority(self, _cmd)
{
    return self._itemsSortedByVisibilityPriority;
}
,["CPArray"]), new objj_method(sel_getUid("validateVisibleItems"), function $CPToolbar__validateVisibleItems(self, _cmd)
{
    objj_msgSend(self, "_validateVisibleItems:", NO);
}
,["void"]), new objj_method(sel_getUid("_autoValidateVisibleItems"), function $CPToolbar___autoValidateVisibleItems(self, _cmd)
{
    objj_msgSend(self, "_validateVisibleItems:", YES);
}
,["void"]), new objj_method(sel_getUid("_validateVisibleItems:"), function $CPToolbar___validateVisibleItems_(self, _cmd, isAutovalidation)
{
    var toolbarItems = objj_msgSend(self, "visibleItems"),
        count = objj_msgSend(toolbarItems, "count");
    while (count--)
    {
        var item = objj_msgSend(toolbarItems, "objectAtIndex:", count);
        if (!isAutovalidation || objj_msgSend(item, "autovalidates"))
            objj_msgSend(item, "validate");
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("_itemForItemIdentifier:willBeInsertedIntoToolbar:"), function $CPToolbar___itemForItemIdentifier_willBeInsertedIntoToolbar_(self, _cmd, identifier, toolbar)
{
    var item = objj_msgSend(self._identifiedItems, "objectForKey:", identifier);
    if (!item)
    {
        item = objj_msgSend(CPToolbarItem, "_standardItemWithItemIdentifier:", identifier);
        if (self._delegate && !item)
        {
            item = objj_msgSend(objj_msgSend(self._delegate, "toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:", self, identifier, toolbar), "copy");
            if (!item)
                objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Toolbar delegate " + self._delegate + " returned nil toolbar item for identifier " + identifier);
        }
        objj_msgSend(self._identifiedItems, "setObject:forKey:", item, identifier);
    }
    return item;
}
,["id","CPString","BOOL"]), new objj_method(sel_getUid("_itemsWithIdentifiers:"), function $CPToolbar___itemsWithIdentifiers_(self, _cmd, identifiers)
{
    var items = [];
    for (var i = 0; i < identifiers.length; i++)
        objj_msgSend(items, "addObject:", objj_msgSend(self, "_itemForItemIdentifier:willBeInsertedIntoToolbar:", identifiers[i], NO));
    return items;
}
,["id","CPArray"]), new objj_method(sel_getUid("_defaultToolbarItems"), function $CPToolbar___defaultToolbarItems(self, _cmd)
{
    if (!self._defaultItems && objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("toolbarDefaultItemIdentifiers:")))
    {
        self._defaultItems = [];
        var identifiers = objj_msgSend(self._delegate, "toolbarDefaultItemIdentifiers:", self),
            index = 0,
            count = objj_msgSend(identifiers, "count");
        for (; index < count; ++index)
            objj_msgSend(self._defaultItems, "addObject:", objj_msgSend(self, "_itemForItemIdentifier:willBeInsertedIntoToolbar:", identifiers[index], NO));
    }
    return self._defaultItems;
}
,["id"]), new objj_method(sel_getUid("toolbarItemDidChange:"), function $CPToolbar__toolbarItemDidChange_(self, _cmd, anItem)
{
    if (objj_msgSend(self._identifiedItems, "objectForKey:", objj_msgSend(anItem, "itemIdentifier")))
        objj_msgSend(self._identifiedItems, "setObject:forKey:", anItem, objj_msgSend(anItem, "itemIdentifier"));
    var index = 0,
        count = objj_msgSend(self._items, "count");
    for (; index <= count; ++index)
    {
        var item = self._items[index];
        if (objj_msgSend(item, "itemIdentifier") === objj_msgSend(anItem, "itemIdentifier"))
        {
            self._items[index] = anItem;
            self._itemsSortedByVisibilityPriority = objj_msgSend(self._items, "sortedArrayUsingFunction:context:", _CPToolbarItemVisibilityPriorityCompare, NULL);
            objj_msgSend(self._toolbarView, "reloadToolbarItems");
        }
    }
}
,["void","CPToolbarItem"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPToolbar__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPToolbar, "class"))
        return;
    CPToolbarsByIdentifier = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    CPToolbarConfigurationsByIdentifier = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
}
,["void"]), new objj_method(sel_getUid("_addToolbar:forIdentifier:"), function $CPToolbar___addToolbar_forIdentifier_(self, _cmd, toolbar, identifier)
{
    var toolbarsSharingIdentifier = objj_msgSend(CPToolbarsByIdentifier, "objectForKey:", identifier);
    if (!toolbarsSharingIdentifier)
    {
        toolbarsSharingIdentifier = [];
        objj_msgSend(CPToolbarsByIdentifier, "setObject:forKey:", toolbarsSharingIdentifier, identifier);
    }
    objj_msgSend(toolbarsSharingIdentifier, "addObject:", toolbar);
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
        self._identifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarIdentifierKey);
        self._displayMode = objj_msgSend(aCoder, "decodeIntForKey:", CPToolbarDisplayModeKey);
        self._showsBaselineSeparator = objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarShowsBaselineSeparatorKey);
        self._allowsUserCustomization = objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarAllowsUserCustomizationKey);
        self._isVisible = objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarIsVisibleKey);
        self._sizeMode = objj_msgSend(aCoder, "decodeIntForKey:", CPToolbarSizeModeKey);
        self._identifiedItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarIdentifiedItemsKey);
        self._defaultItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarDefaultItemsKey);
        self._allowedItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarAllowedItemsKey);
        self._selectableItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarSelectableItemsKey);
        objj_msgSend(objj_msgSend(self._identifiedItems, "allValues"), "makeObjectsPerformSelector:withObject:", sel_getUid("_setToolbar:"), self);
        self._items = [];
        objj_msgSend(CPToolbar, "_addToolbar:forIdentifier:", self, self._identifier);
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarDelegateKey));
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("_reloadToolbarItems"), self, nil, 0, [CPDefaultRunLoopMode]);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPToolbar__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._identifier, CPToolbarIdentifierKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._displayMode, CPToolbarDisplayModeKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._showsBaselineSeparator, CPToolbarShowsBaselineSeparatorKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsUserCustomization, CPToolbarAllowsUserCustomizationKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isVisible, CPToolbarIsVisibleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._sizeMode, CPToolbarSizeModeKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._identifiedItems, CPToolbarIdentifiedItemsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._defaultItems, CPToolbarDefaultItemsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._allowedItems, CPToolbarAllowedItemsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._selectableItems, CPToolbarSelectableItemsKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", self._delegate, CPToolbarDelegateKey);
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
        self._labelColor = objj_msgSend(CPColor, "blackColor");
        self._labelShadowColor = objj_msgSend(CPColor, "colorWithWhite:alpha:", 1.0, 0.75);
        self._additionalItemsButton = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:pullsDown:", CGRectMake(0.0, 0.0, 10.0, 15.0), YES);
        objj_msgSend(self._additionalItemsButton, "setBordered:", NO);
        objj_msgSend(self._additionalItemsButton, "setImagePosition:", CPImageOnly);
        objj_msgSend(objj_msgSend(self._additionalItemsButton, "menu"), "setShowsStateColumn:", NO);
        objj_msgSend(objj_msgSend(self._additionalItemsButton, "menu"), "setAutoenablesItems:", NO);
    }
    return self;
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
    var items = objj_msgSend(self._toolbar, "items"),
        count = objj_msgSend(items, "count");
    while (count--)
        objj_msgSend(objj_msgSend(self, "viewForItem:", items[count]), "FIXME_setIsHUD:", shouldBeHUD);
}
,["void","BOOL"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $_CPToolbarView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
    objj_msgSend(self, "tile");
}
,["void","CGSize"]), new objj_method(sel_getUid("viewForItem:"), function $_CPToolbarView__viewForItem_(self, _cmd, anItem)
{
    return self._viewsForToolbarItems[objj_msgSend(anItem, "UID")] || nil;
}
,["_CPToolbarItemView","CPToolbarItem"]), new objj_method(sel_getUid("tile"), function $_CPToolbarView__tile(self, _cmd)
{
    var items = objj_msgSend(self._toolbar, "items"),
        itemsWidth = CGRectGetWidth(objj_msgSend(self, "bounds")),
        minWidth = self._minWidth,
        invisibleItemsSortedByPriority = [];
    self._visibleItems = items;
    if (itemsWidth < minWidth)
    {
        itemsWidth -= objj_msgSend(self, "valueForThemeAttribute:", "extra-item-width");
        self._visibleItems = objj_msgSend(self._visibleItems, "copy");
        var itemsSortedByVisibilityPriority = objj_msgSend(self._toolbar, "itemsSortedByVisibilityPriority"),
            count = itemsSortedByVisibilityPriority.length;
        while (minWidth > itemsWidth && count)
        {
            var item = itemsSortedByVisibilityPriority[--count],
                view = objj_msgSend(self, "viewForItem:", item);
            minWidth -= objj_msgSend(view, "minSize").width + objj_msgSend(self, "valueForThemeAttribute:", "item-margin");
            objj_msgSend(self._visibleItems, "removeObjectIdenticalTo:", item);
            objj_msgSend(invisibleItemsSortedByPriority, "addObject:", item);
            objj_msgSend(view, "setHidden:", YES);
            objj_msgSend(view, "FIXME_setIsHUD:", self._FIXME_isHUD);
        }
    }
    var count = objj_msgSend(items, "count"),
        height = 0.0;
    while (count--)
    {
        var view = objj_msgSend(self, "viewForItem:", items[count]),
            minSize = objj_msgSend(view, "minSize");
        if (height < minSize.height)
            height = minSize.height;
    }
    var contentInset = objj_msgSend(self, "valueForThemeAttribute:", "content-inset"),
        newDesiredHeight = height ? height + contentInset.top + contentInset.bottom : 0;
    if (newDesiredHeight != self._toolbar._desiredHeight)
    {
        self._toolbar._desiredHeight = newDesiredHeight;
        objj_msgSend(self, "setFrame:", objj_msgSend(self._toolbar, "_toolbarViewFrame"));
        objj_msgSend(self._toolbar._window, "_noteToolbarChanged");
        return;
    }
    var count = self._visibleItems.length,
        flexibleItemIndexes = objj_msgSend(CPIndexSet, "indexSet");
    while (count--)
    {
        var item = self._visibleItems[count],
            view = objj_msgSend(self, "viewForItem:", item),
            minSize = objj_msgSend(view, "minSize");
        if (minSize.width !== objj_msgSend(view, "maxSize").width)
            objj_msgSend(flexibleItemIndexes, "addIndex:", count);
        else
            objj_msgSend(view, "setFrameSize:", CGSizeMake(minSize.width, height));
        objj_msgSend(view, "setHidden:", NO);
    }
    var remainingSpace = itemsWidth - minWidth,
        proportionate = 0.0;
    while (remainingSpace && objj_msgSend(flexibleItemIndexes, "count"))
    {
        proportionate += remainingSpace / objj_msgSend(flexibleItemIndexes, "count");
        remainingSpace = 0.0;
        var index = CPNotFound;
        while ((index = objj_msgSend(flexibleItemIndexes, "indexGreaterThanIndex:", index)) !== CPNotFound)
        {
            var item = self._visibleItems[index],
                view = objj_msgSend(self, "viewForItem:", item),
                proposedWidth = objj_msgSend(view, "minSize").width + proportionate,
                constrainedWidth = MIN(proposedWidth, objj_msgSend(view, "maxSize").width);
            if (constrainedWidth < proposedWidth)
            {
                objj_msgSend(flexibleItemIndexes, "removeIndex:", index);
                remainingSpace += proposedWidth - constrainedWidth;
            }
            objj_msgSend(view, "setFrameSize:", CGSizeMake(constrainedWidth, height));
        }
    }
    var index = 0,
        count = self._visibleItems.length,
        x = contentInset.left,
        contentInset = objj_msgSend(self, "valueForThemeAttribute:", "content-inset"),
        y = contentInset.top;
    for (; index < count; ++index)
    {
        var view = objj_msgSend(self, "viewForItem:", self._visibleItems[index]),
            viewWidth = CGRectGetWidth(objj_msgSend(view, "frame"));
        objj_msgSend(view, "setFrame:", CGRectMake(x, y, viewWidth, height));
        x += viewWidth + objj_msgSend(self, "valueForThemeAttribute:", "item-margin");
    }
    var needsAdditionalItemsButton = NO;
    if (objj_msgSend(invisibleItemsSortedByPriority, "count"))
    {
        var index = 0,
            count = objj_msgSend(items, "count");
        self._invisibleItems = [];
        for (; index < count; ++index)
        {
            var item = items[index];
            if (objj_msgSend(invisibleItemsSortedByPriority, "indexOfObjectIdenticalTo:", item) !== CPNotFound)
            {
                objj_msgSend(self._invisibleItems, "addObject:", item);
                var identifier = objj_msgSend(item, "itemIdentifier");
                if (identifier !== CPToolbarSpaceItemIdentifier && identifier !== CPToolbarFlexibleSpaceItemIdentifier && identifier !== CPToolbarSeparatorItemIdentifier)
                    needsAdditionalItemsButton = YES;
            }
        }
    }
    if (needsAdditionalItemsButton)
    {
        objj_msgSend(self._additionalItemsButton, "setFrameOrigin:", CGPointMake(itemsWidth + 5.0, (CGRectGetHeight(objj_msgSend(self, "bounds")) - CGRectGetHeight(objj_msgSend(self._additionalItemsButton, "frame"))) / 2.0));
        objj_msgSend(self, "addSubview:", self._additionalItemsButton);
        objj_msgSend(self._additionalItemsButton, "removeAllItems");
        objj_msgSend(self._additionalItemsButton, "addItemWithTitle:", "Additional Items");
        objj_msgSend(objj_msgSend(self._additionalItemsButton, "itemArray")[0], "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "extra-item-extra-image"));
        var index = 0,
            count = objj_msgSend(self._invisibleItems, "count"),
            hasNonSeparatorItem = NO;
        for (; index < count; ++index)
        {
            var item = self._invisibleItems[index],
                identifier = objj_msgSend(item, "itemIdentifier");
            if (identifier === CPToolbarSpaceItemIdentifier || identifier === CPToolbarFlexibleSpaceItemIdentifier)
                continue;
            if (identifier === CPToolbarSeparatorItemIdentifier)
            {
                if (hasNonSeparatorItem)
                    objj_msgSend(self._additionalItemsButton, "addItem:", objj_msgSend(CPMenuItem, "separatorItem"));
                continue;
            }
            hasNonSeparatorItem = YES;
            var menuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", objj_msgSend(item, "label"), sel_getUid("didSelectMenuItem:"), nil);
            objj_msgSend(menuItem, "setRepresentedObject:", item);
            objj_msgSend(menuItem, "setImage:", objj_msgSend(item, "image"));
            objj_msgSend(menuItem, "setTarget:", self);
            objj_msgSend(menuItem, "setEnabled:", objj_msgSend(item, "isEnabled"));
            objj_msgSend(self._additionalItemsButton, "addItem:", menuItem);
        }
    }
    else
        objj_msgSend(self._additionalItemsButton, "removeFromSuperview");
}
,["void"]), new objj_method(sel_getUid("didSelectMenuItem:"), function $_CPToolbarView__didSelectMenuItem_(self, _cmd, aSender)
{
    var toolbarItem = objj_msgSend(aSender, "representedObject");
    objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(toolbarItem, "action"), objj_msgSend(toolbarItem, "target"), toolbarItem);
}
,["void","id"]), new objj_method(sel_getUid("reloadToolbarItems"), function $_CPToolbarView__reloadToolbarItems(self, _cmd)
{
    var subviews = objj_msgSend(self, "subviews"),
        count = subviews.length;
    while (count--)
        objj_msgSend(subviews[count], "removeFromSuperview");
    var items = objj_msgSend(self._toolbar, "items"),
        index = 0;
    count = items.length;
    self._minWidth = objj_msgSend(self, "valueForThemeAttribute:", "item-margin");
    self._viewsForToolbarItems = {};
    for (; index < count; ++index)
    {
        var item = items[index],
            view = objj_msgSend(objj_msgSend(_CPToolbarItemView, "alloc"), "initWithToolbarItem:toolbar:", item, self);
        self._viewsForToolbarItems[objj_msgSend(item, "UID")] = view;
        if (objj_msgSend(item, "toolTip") && objj_msgSend(view, "respondsToSelector:", sel_getUid("setToolTip:")))
            objj_msgSend(view, "setToolTip:", objj_msgSend(item, "toolTip"));
        objj_msgSend(self, "addSubview:", view);
        self._minWidth += objj_msgSend(view, "minSize").width + objj_msgSend(self, "valueForThemeAttribute:", "item-margin");
    }
    objj_msgSend(self, "tile");
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPToolbarView__layoutSubviews(self, _cmd)
{
    objj_msgSend(self._additionalItemsButton, "setAlternateImage:", objj_msgSend(self, "valueForThemeAttribute:", "extra-item-extra-alternate-image"));
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPToolbarView__defaultThemeClass(self, _cmd)
{
    return "toolbar-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPToolbarView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 10.0, "item-margin", 20.0, "extra-item-width", objj_msgSend(CPNull, "null"), "extra-item-extra-image", objj_msgSend(CPNull, "null"), "extra-item-extra-alternate-image", CGInsetMake(4.0, 4.0, 4.0, 10), "content-inset", 59.0, "regular-size-height", 46.0, "small-size-height", objj_msgSend(CPNull, "null"), "image-item-separator-color", CGRectMake(0.0, 0.0, 2.0, 32.0), "image-item-separator-size");
}
,["CPDictionary"])]);
}var _CPToolbarItemVisibilityPriorityCompare = function(lhs, rhs)
{
    var lhsVisibilityPriority = objj_msgSend(lhs, "visibilityPriority"),
        rhsVisibilityPriority = objj_msgSend(rhs, "visibilityPriority");
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
        self._labelField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._labelField, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
        objj_msgSend(self._labelField, "setTextColor:", objj_msgSend(self, "FIXME_labelColor"));
        objj_msgSend(self._labelField, "setTextShadowColor:", objj_msgSend(self, "FIXME_labelShadowColor"));
        objj_msgSend(self._labelField, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(self._labelField, "setAutoresizingMask:", CPViewWidthSizable | CPViewMinXMargin);
        objj_msgSend(self, "addSubview:", self._labelField);
        objj_msgSend(self, "updateFromItem");
        self._toolbar = aToolbar;
        var keyPaths = ["label", "image", "alternateImage", "minSize", "maxSize", "target", "action", "enabled"],
            index = 0,
            count = objj_msgSend(keyPaths, "count");
        for (; index < count; ++index)
            objj_msgSend(self._toolbarItem, "addObserver:forKeyPath:options:context:", self, keyPaths[index], 0, NULL);
    }
    return self;
}
,["id","CPToolbarItem","CPToolbar"]), new objj_method(sel_getUid("FIXME_setIsHUD:"), function $_CPToolbarItemView__FIXME_setIsHUD_(self, _cmd, shouldBeHUD)
{
    self._FIXME_isHUD = shouldBeHUD;
    objj_msgSend(self._labelField, "setTextColor:", objj_msgSend(self, "FIXME_labelColor"));
    objj_msgSend(self._labelField, "setTextShadowColor:", objj_msgSend(self, "FIXME_labelShadowColor"));
}
,["void","BOOL"]), new objj_method(sel_getUid("updateFromItem"), function $_CPToolbarItemView__updateFromItem(self, _cmd)
{
    var identifier = objj_msgSend(self._toolbarItem, "itemIdentifier");
    if (identifier === CPToolbarSpaceItemIdentifier || identifier === CPToolbarFlexibleSpaceItemIdentifier || identifier === CPToolbarSeparatorItemIdentifier)
    {
        objj_msgSend(self._view, "removeFromSuperview");
        objj_msgSend(self._imageView, "removeFromSuperview");
        self._minSize = objj_msgSend(self._toolbarItem, "minSize");
        self._maxSize = objj_msgSend(self._toolbarItem, "maxSize");
        if (identifier === CPToolbarSeparatorItemIdentifier)
        {
            self._view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
            objj_msgSend(self, "addSubview:", self._view);
        }
        return;
    }
    objj_msgSend(self, "setTarget:", objj_msgSend(self._toolbarItem, "target"));
    objj_msgSend(self, "setAction:", objj_msgSend(self._toolbarItem, "action"));
    var view = objj_msgSend(self._toolbarItem, "view") || nil;
    if (view !== self._view)
    {
        if (!view)
            objj_msgSend(self._view, "removeFromSuperview");
        else
        {
            objj_msgSend(self, "addSubview:", view);
            objj_msgSend(self._imageView, "removeFromSuperview");
        }
        self._view = view;
    }
    if (!self._view)
    {
        if (!self._imageView)
        {
            self._imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
            objj_msgSend(self._imageView, "setImageScaling:", CPImageScaleProportionallyDown);
            objj_msgSend(self, "addSubview:", self._imageView);
        }
        objj_msgSend(self._imageView, "setImage:", objj_msgSend(self._toolbarItem, "image"));
    }
    var minSize = objj_msgSend(self._toolbarItem, "minSize"),
        maxSize = objj_msgSend(self._toolbarItem, "maxSize");
    objj_msgSend(self._labelField, "setStringValue:", objj_msgSend(self._toolbarItem, "label"));
    objj_msgSend(self._labelField, "sizeToFit");
    objj_msgSend(self, "setEnabled:", objj_msgSend(self._toolbarItem, "isEnabled"));
    self._labelSize = objj_msgSend(self._labelField, "frame").size;
    var iconOnly = objj_msgSend(objj_msgSend(self._toolbarItem, "toolbar"), "displayMode") === CPToolbarDisplayModeIconOnly,
        labelOnly = objj_msgSend(objj_msgSend(self._toolbarItem, "toolbar"), "displayMode") === CPToolbarDisplayModeLabelOnly;
    objj_msgSend(self._labelField, "setHidden:", iconOnly);
    objj_msgSend(self._view, "setHidden:", labelOnly);
    self._minSize = CGSizeMake(MAX(self._labelSize.width, minSize.width), (labelOnly ? 0 : minSize.height) + (iconOnly ? 0 : self._labelSize.height + LABEL_MARGIN));
    self._maxSize = CGSizeMake(MAX(self._labelSize.width, maxSize.width), 100000000.0);
    objj_msgSend(self._toolbar, "tile");
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPToolbarItemView__layoutSubviews(self, _cmd)
{
    var identifier = objj_msgSend(self._toolbarItem, "itemIdentifier");
    if (identifier === CPToolbarSpaceItemIdentifier || identifier === CPToolbarFlexibleSpaceItemIdentifier)
        return;
    var bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);
    if (identifier === CPToolbarSeparatorItemIdentifier)
    {
        var itemSeparatorColor = objj_msgSend(self._toolbar, "valueForThemeAttribute:", "image-item-separator-color"),
            itemSeparatorSize = objj_msgSend(self._toolbar, "valueForThemeAttribute:", "image-item-separator-size");
        objj_msgSend(self._view, "setFrame:", CGRectMake(ROUND((width - itemSeparatorSize.size.width) / 2.0), 0.0, itemSeparatorSize.size.width, CGRectGetHeight(bounds)));
        objj_msgSend(self._view, "setBackgroundColor:", itemSeparatorColor);
        return;
    }
    var view = self._view || self._imageView,
        itemMaxSize = objj_msgSend(self._toolbarItem, "maxSize"),
        iconOnly = objj_msgSend(objj_msgSend(self._toolbarItem, "toolbar"), "displayMode") === CPToolbarDisplayModeIconOnly,
        height = CGRectGetHeight(bounds) - (iconOnly ? 0 : self._labelSize.height),
        viewWidth = MIN(itemMaxSize.width, width),
        viewHeight = MIN(itemMaxSize.height, height);
    objj_msgSend(view, "setFrame:", CGRectMake(ROUND((width - viewWidth) / 2.0), ROUND((height - viewHeight) / 2.0), viewWidth, viewHeight));
    objj_msgSend(self._labelField, "setFrameOrigin:", CGPointMake(ROUND((width - self._labelSize.width) / 2.0), CGRectGetHeight(bounds) - self._labelSize.height));
}
,["void"]), new objj_method(sel_getUid("mouseDown:"), function $_CPToolbarItemView__mouseDown_(self, _cmd, anEvent)
{
    if (objj_msgSend(self._toolbarItem, "view"))
        return objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
    var identifier = objj_msgSend(self._toolbarItem, "itemIdentifier");
    if (identifier === CPToolbarSpaceItemIdentifier || identifier === CPToolbarFlexibleSpaceItemIdentifier || identifier === CPToolbarSeparatorItemIdentifier)
        return objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarItemView").super_class }, "mouseDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("setEnabled:"), function $_CPToolbarItemView__setEnabled_(self, _cmd, shouldBeEnabled)
{
    if (objj_msgSend(self, "isEnabled") === shouldBeEnabled)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarItemView").super_class }, "setEnabled:", shouldBeEnabled);
    if (shouldBeEnabled)
    {
        objj_msgSend(self._imageView, "setAlphaValue:", 1.0);
        objj_msgSend(self._labelField, "setAlphaValue:", 1.0);
    }
    else
    {
        objj_msgSend(self._imageView, "setAlphaValue:", 0.5);
        objj_msgSend(self._labelField, "setAlphaValue:", 0.5);
    }
    objj_msgSend(self._toolbar, "tile");
}
,["void","BOOL"]), new objj_method(sel_getUid("FIXME_labelColor"), function $_CPToolbarItemView__FIXME_labelColor(self, _cmd)
{
    if (self._FIXME_isHUD)
        return objj_msgSend(CPColor, "whiteColor");
    return objj_msgSend(CPColor, "blackColor");
}
,["CPColor"]), new objj_method(sel_getUid("FIXME_labelShadowColor"), function $_CPToolbarItemView__FIXME_labelShadowColor(self, _cmd)
{
    if (self._FIXME_isHUD)
        return objj_msgSend(self, "isHighlighted") ? objj_msgSend(CPColor, "colorWithWhite:alpha:", 1.0, 0.5) : objj_msgSend(CPColor, "clearColor");
    return objj_msgSend(self, "isHighlighted") ? objj_msgSend(CPColor, "colorWithWhite:alpha:", 0.0, 0.3) : objj_msgSend(CPColor, "colorWithWhite:alpha:", 1.0, 0.75);
}
,["CPColor"]), new objj_method(sel_getUid("setHighlighted:"), function $_CPToolbarItemView__setHighlighted_(self, _cmd, shouldBeHighlighted)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarItemView").super_class }, "setHighlighted:", shouldBeHighlighted);
    if (shouldBeHighlighted)
    {
        var alternateImage = objj_msgSend(self._toolbarItem, "alternateImage");
        if (alternateImage)
            objj_msgSend(self._imageView, "setImage:", alternateImage);
        objj_msgSend(self._labelField, "setTextShadowOffset:", CGSizeMakeZero());
    }
    else
    {
        var image = objj_msgSend(self._toolbarItem, "image");
        if (image)
            objj_msgSend(self._imageView, "setImage:", image);
        objj_msgSend(self._labelField, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
    }
    objj_msgSend(self._labelField, "setTextShadowColor:", objj_msgSend(self, "FIXME_labelShadowColor"));
}
,["void","BOOL"]), new objj_method(sel_getUid("sendAction:to:"), function $_CPToolbarItemView__sendAction_to_(self, _cmd, anAction, aSender)
{
    objj_msgSend(CPApp, "sendAction:to:from:", anAction, aSender, self._toolbarItem);
}
,["BOOL","SEL","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPToolbarItemView__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, aChange, aContext)
{
    if (aKeyPath === "enabled")
        objj_msgSend(self, "setEnabled:", objj_msgSend(anObject, "isEnabled"));
    else if (aKeyPath === "target")
        objj_msgSend(self, "setTarget:", objj_msgSend(anObject, "target"));
    else if (aKeyPath === "action")
        objj_msgSend(self, "setAction:", objj_msgSend(anObject, "action"));
    else
        objj_msgSend(self, "updateFromItem");
}
,["void","CPString","id","CPDictionary","id"])]);
}