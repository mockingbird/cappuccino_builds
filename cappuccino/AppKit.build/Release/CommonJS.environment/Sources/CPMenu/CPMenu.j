@STATIC;1.0;I;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;19;CPKeyValueBinding.ji;12;CPMenuItem.ji;18;_CPMenuBarWindow.ji;15;_CPMenuWindow.jt;41490;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPKeyValueBinding.j", YES);objj_executeFile("CPMenuItem.j", YES);{var the_protocol = objj_allocateProtocol("CPMenuDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPMenuDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}var CPMenuDelegate_menuWillOpen_ = 1 << 1,
    CPMenuDelegate_menuDidClose_ = 1 << 2;
CPMenuDidAddItemNotification = "CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification = "CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification = "CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification = "CPMenuDidEndTrackingNotification";
var _CPMenuBarVisible = NO,
    _CPMenuBarTitle = "",
    _CPMenuBarAttributes = nil,
    _CPMenuBarSharedWindow = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPMenu"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_supermenu"), new objj_ivar("_title"), new objj_ivar("_name"), new objj_ivar("_font"), new objj_ivar("_minimumWidth"), new objj_ivar("_items"), new objj_ivar("_autoenablesItems"), new objj_ivar("_showsStateColumn"), new objj_ivar("_delegate"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_highlightedIndex"), new objj_ivar("_menuWindow"), new objj_ivar("_lastCloseEvent")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("menuBarHeight"), function $CPMenu__menuBarHeight(self, _cmd)
{
    if (self === objj_msgSend(CPApp, "mainMenu"))
        return objj_msgSend(CPMenu, "menuBarHeight");
    return 0.0;
}
,["float"]), new objj_method(sel_getUid("initWithTitle:"), function $CPMenu__initWithTitle_(self, _cmd, aTitle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenu").super_class }, "init");
    if (self)
    {
        self._title = aTitle;
        self._items = [];
        self._autoenablesItems = YES;
        self._showsStateColumn = YES;
        objj_msgSend(self, "setMinimumWidth:", 0);
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("init"), function $CPMenu__init(self, _cmd)
{
    return objj_msgSend(self, "initWithTitle:", "");
}
,["id"]), new objj_method(sel_getUid("insertItem:atIndex:"), function $CPMenu__insertItem_atIndex_(self, _cmd, aMenuItem, anIndex)
{
    objj_msgSend(self, "insertObject:inItemsAtIndex:", aMenuItem, anIndex);
}
,["void","CPMenuItem","CPUInteger"]), new objj_method(sel_getUid("insertItemWithTitle:action:keyEquivalent:atIndex:"), function $CPMenu__insertItemWithTitle_action_keyEquivalent_atIndex_(self, _cmd, aTitle, anAction, aKeyEquivalent, anIndex)
{
    var item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", aTitle, anAction, aKeyEquivalent);
    objj_msgSend(self, "insertItem:atIndex:", item, anIndex);
    return item;
}
,["CPMenuItem","CPString","SEL","CPString","CPUInteger"]), new objj_method(sel_getUid("addItem:"), function $CPMenu__addItem_(self, _cmd, aMenuItem)
{
    objj_msgSend(self, "insertItem:atIndex:", aMenuItem, objj_msgSend(self._items, "count"));
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("addItemWithTitle:action:keyEquivalent:"), function $CPMenu__addItemWithTitle_action_keyEquivalent_(self, _cmd, aTitle, anAction, aKeyEquivalent)
{
    return objj_msgSend(self, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, anAction, aKeyEquivalent, objj_msgSend(self._items, "count"));
}
,["CPMenuItem","CPString","SEL","CPString"]), new objj_method(sel_getUid("removeItem:"), function $CPMenu__removeItem_(self, _cmd, aMenuItem)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(self._items, "indexOfObjectIdenticalTo:", aMenuItem));
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("removeItemAtIndex:"), function $CPMenu__removeItemAtIndex_(self, _cmd, anIndex)
{
    objj_msgSend(self, "removeObjectFromItemsAtIndex:", anIndex);
}
,["void","CPUInteger"]), new objj_method(sel_getUid("removeAllItems"), function $CPMenu__removeAllItems(self, _cmd)
{
    var count = objj_msgSend(self._items, "count");
    while (count--)
        objj_msgSend(self._items[count], "setMenu:", nil);
    objj_msgSend(self, "_highlightItemAtIndex:", CPNotFound);
    objj_msgSend(self, "willChangeValueForKey:", "items");
    self._items = objj_msgSend(CPMutableArray, "array");
    objj_msgSend(self, "didChangeValueForKey:", "items");
}
,["void"]), new objj_method(sel_getUid("itemChanged:"), function $CPMenu__itemChanged_(self, _cmd, aMenuItem)
{
    if (objj_msgSend(aMenuItem, "menu") !== self || !self._items)
        return;
    objj_msgSend(aMenuItem, "setValue:forKey:", objj_msgSend(aMenuItem, "valueForKey:", "changeCount") + 1, "changeCount");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidChangeItemNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(self._items, "indexOfObjectIdenticalTo:", aMenuItem), "CPMenuItemIndex"));
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("itemWithTag:"), function $CPMenu__itemWithTag_(self, _cmd, aTag)
{
    var index = objj_msgSend(self, "indexOfItemWithTag:", aTag);
    if (index == CPNotFound)
        return nil;
    return self._items[index];
}
,["CPMenuItem","int"]), new objj_method(sel_getUid("itemWithTitle:"), function $CPMenu__itemWithTitle_(self, _cmd, aTitle)
{
    var index = objj_msgSend(self, "indexOfItemWithTitle:", aTitle);
    if (index == CPNotFound)
        return nil;
    return self._items[index];
}
,["CPMenuItem","CPString"]), new objj_method(sel_getUid("itemAtIndex:"), function $CPMenu__itemAtIndex_(self, _cmd, anIndex)
{
    return objj_msgSend(self._items, "objectAtIndex:", anIndex);
}
,["CPMenuItem","int"]), new objj_method(sel_getUid("numberOfItems"), function $CPMenu__numberOfItems(self, _cmd)
{
    return objj_msgSend(self._items, "count");
}
,["unsigned"]), new objj_method(sel_getUid("itemArray"), function $CPMenu__itemArray(self, _cmd)
{
    return self._items;
}
,["CPArray"]), new objj_method(sel_getUid("indexOfItem:"), function $CPMenu__indexOfItem_(self, _cmd, aMenuItem)
{
    if (objj_msgSend(aMenuItem, "menu") !== self)
        return CPNotFound;
    return objj_msgSend(self._items, "indexOfObjectIdenticalTo:", aMenuItem);
}
,["int","CPMenuItem"]), new objj_method(sel_getUid("indexOfItemWithTitle:"), function $CPMenu__indexOfItemWithTitle_(self, _cmd, aTitle)
{
    var index = 0,
        count = self._items.length;
    for (; index < count; ++index)
        if (objj_msgSend(self._items[index], "title") === aTitle)
            return index;
    return CPNotFound;
}
,["int","CPString"]), new objj_method(sel_getUid("indexOfItemWithTag:"), function $CPMenu__indexOfItemWithTag_(self, _cmd, aTag)
{
    var index = 0,
        count = self._items.length;
    for (; index < count; ++index)
        if (objj_msgSend(self._items[index], "tag") == aTag)
            return index;
    return CPNotFound;
}
,["int","int"]), new objj_method(sel_getUid("indexOfItemWithTarget:andAction:"), function $CPMenu__indexOfItemWithTarget_andAction_(self, _cmd, aTarget, anAction)
{
    var index = 0,
        count = self._items.length;
    for (; index < count; ++index)
    {
        var item = self._items[index];
        if (objj_msgSend(item, "target") == aTarget && (!anAction || objj_msgSend(item, "action") == anAction))
            return index;
    }
    return CPNotFound;
}
,["int","id","SEL"]), new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"), function $CPMenu__indexOfItemWithRepresentedObject_(self, _cmd, anObject)
{
    var index = 0,
        count = self._items.length;
    for (; index < count; ++index)
        if (objj_msgSend(objj_msgSend(self._items[index], "representedObject"), "isEqual:", anObject))
            return index;
    return CPNotFound;
}
,["int","id"]), new objj_method(sel_getUid("indexOfItemWithSubmenu:"), function $CPMenu__indexOfItemWithSubmenu_(self, _cmd, aMenu)
{
    var index = 0,
        count = self._items.length;
    for (; index < count; ++index)
        if (objj_msgSend(self._items[index], "submenu") == aMenu)
            return index;
    return CPNotFound;
}
,["int","CPMenu"]), new objj_method(sel_getUid("setSubmenu:forItem:"), function $CPMenu__setSubmenu_forItem_(self, _cmd, aMenu, aMenuItem)
{
    objj_msgSend(aMenuItem, "setTarget:", aMenuItem);
    objj_msgSend(aMenuItem, "setAction:", sel_getUid("submenuAction:"));
    objj_msgSend(aMenuItem, "setSubmenu:", aMenu);
}
,["void","CPMenu","CPMenuItem"]), new objj_method(sel_getUid("submenuAction:"), function $CPMenu__submenuAction_(self, _cmd, aSender)
{
}
,["void","id"]), new objj_method(sel_getUid("supermenu"), function $CPMenu__supermenu(self, _cmd)
{
    return self._supermenu;
}
,["CPMenu"]), new objj_method(sel_getUid("setSupermenu:"), function $CPMenu__setSupermenu_(self, _cmd, aMenu)
{
    self._supermenu = aMenu;
}
,["void","CPMenu"]), new objj_method(sel_getUid("isTornOff"), function $CPMenu__isTornOff(self, _cmd)
{
    return !self._supermenu || self == objj_msgSend(CPApp, "mainMenu");
}
,["BOOL"]), new objj_method(sel_getUid("setAutoenablesItems:"), function $CPMenu__setAutoenablesItems_(self, _cmd, aFlag)
{
    self._autoenablesItems = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("autoenablesItems"), function $CPMenu__autoenablesItems(self, _cmd)
{
    return self._autoenablesItems;
}
,["BOOL"]), new objj_method(sel_getUid("update"), function $CPMenu__update(self, _cmd)
{
    if (!self._autoenablesItems)
        return;
    var items = objj_msgSend(self, "itemArray");
    for (var i = 0; i < objj_msgSend(items, "count"); i++)
    {
        var item = objj_msgSend(items, "objectAtIndex:", i);
        if (objj_msgSend(item, "hasSubmenu"))
            continue;
        var binder = objj_msgSend(CPBinder, "getBinding:forObject:", CPEnabledBinding, item);
        if (binder)
        {
            objj_msgSend(binder, "setValueFor:", CPEnabledBinding);
            return;
        }
        var validator = objj_msgSend(CPApp, "targetForAction:to:from:", objj_msgSend(item, "action"), objj_msgSend(item, "target"), item),
            shouldBeEnabled = YES;
        if (!validator)
        {
            if (objj_msgSend(item, "action") || objj_msgSend(item, "target"))
                shouldBeEnabled = NO;
            else
            {
                var info = objj_msgSend(CPBinder, "infoForBinding:forObject:", CPTargetBinding, item);
                if (info)
                {
                    var object = objj_msgSend(info, "objectForKey:", CPObservedObjectKey),
                        keyPath = objj_msgSend(info, "objectForKey:", CPObservedKeyPathKey),
                        options = objj_msgSend(info, "objectForKey:", CPOptionsKey),
                        target = objj_msgSend(object, "valueForKeyPath:", keyPath),
                        selector = objj_msgSend(options, "valueForKey:", CPSelectorNameBindingOption);
                    if (target && selector && !objj_msgSend(target, "respondsToSelector:", CPSelectorFromString(selector)))
                        shouldBeEnabled = NO;
                }
            }
        }
        else if (!objj_msgSend(validator, "respondsToSelector:", objj_msgSend(item, "action")))
            shouldBeEnabled = NO;
        else if (objj_msgSend(validator, "respondsToSelector:", sel_getUid("validateMenuItem:")))
            shouldBeEnabled = objj_msgSend(validator, "validateMenuItem:", item);
        else if (objj_msgSend(validator, "respondsToSelector:", sel_getUid("validateUserInterfaceItem:")))
            shouldBeEnabled = objj_msgSend(validator, "validateUserInterfaceItem:", item);
        objj_msgSend(item, "setEnabled:", shouldBeEnabled);
    }
    objj_msgSend(objj_msgSend(self._menuWindow, "_menuView"), "tile");
}
,["void"]), new objj_method(sel_getUid("setTitle:"), function $CPMenu__setTitle_(self, _cmd, aTitle)
{
    self._title = aTitle;
}
,["void","CPString"]), new objj_method(sel_getUid("title"), function $CPMenu__title(self, _cmd)
{
    return self._title;
}
,["CPString"]), new objj_method(sel_getUid("setMinimumWidth:"), function $CPMenu__setMinimumWidth_(self, _cmd, aMinimumWidth)
{
    self._minimumWidth = aMinimumWidth;
}
,["void","float"]), new objj_method(sel_getUid("minimumWidth"), function $CPMenu__minimumWidth(self, _cmd)
{
    return self._minimumWidth;
}
,["float"]), new objj_method(sel_getUid("_performActionOfHighlightedItemChain"), function $CPMenu___performActionOfHighlightedItemChain(self, _cmd)
{
    var highlightedItem = objj_msgSend(self, "highlightedItem");
    while (objj_msgSend(highlightedItem, "submenu") && objj_msgSend(highlightedItem, "action") === sel_getUid("submenuAction:"))
        highlightedItem = objj_msgSend(objj_msgSend(highlightedItem, "submenu"), "highlightedItem");
    if (highlightedItem && objj_msgSend(highlightedItem, "isEnabled"))
    {
        var binding = objj_msgSend(CPBinder, "getBinding:forObject:", CPTargetBinding, highlightedItem);
        objj_msgSend(binding, "invokeAction");
        objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(highlightedItem, "action"), objj_msgSend(highlightedItem, "target"), highlightedItem);
    }
}
,["void"]), new objj_method(sel_getUid("popUpMenuPositioningItem:atLocation:inView:callback:"), function $CPMenu__popUpMenuPositioningItem_atLocation_inView_callback_(self, _cmd, anItem, aLocation, aView, aCallback)
{
    objj_msgSend(self, "_popUpMenuPositioningItem:atLocation:topY:bottomY:inView:callback:", anItem, aLocation, aLocation.y, aLocation.y, aView, aCallback);
}
,["void","CPMenuItem","CGPoint","CPView","Function"]), new objj_method(sel_getUid("_popUpMenuPositioningItem:atLocation:topY:bottomY:inView:callback:"), function $CPMenu___popUpMenuPositioningItem_atLocation_topY_bottomY_inView_callback_(self, _cmd, anItem, aLocation, aTopY, aBottomY, aView, aCallback)
{
    var itemIndex = 0;
    if (anItem)
    {
        itemIndex = objj_msgSend(self, "indexOfItem:", anItem);
        if (itemIndex === CPNotFound)
            throw "In call to popUpMenuPositioningItem:atLocation:inView:callback:, menu item " + anItem + " is not present in menu " + self;
    }
    var theWindow = objj_msgSend(aView, "window");
    if (aView && !theWindow)
        throw "In call to popUpMenuPositioningItem:atLocation:inView:callback:, view is not in any window.";
    objj_msgSend(self, "_menuWillOpen");
    if (aView)
        aLocation = objj_msgSend(theWindow, "convertBaseToGlobal:", objj_msgSend(aView, "convertPoint:toView:", aLocation, nil));
    var menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", self, objj_msgSend(self, "font"));
    objj_msgSend(menuWindow, "setBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle);
    if (anItem)
        aLocation.y -= objj_msgSend(menuWindow, "deltaYForItemAtIndex:", itemIndex);
    var constraintRect = objj_msgSend(CPMenu, "_constraintRectForView:", aView);
    objj_msgSend(menuWindow, "setFrameOrigin:", aLocation);
    objj_msgSend(menuWindow, "setConstraintRect:", constraintRect);
    if (!objj_msgSend(menuWindow, "hasMinimumNumberOfVisibleItems"))
    {
        var unconstrainedFrame = objj_msgSend(menuWindow, "unconstrainedFrame"),
            unconstrainedY = CGRectGetMinY(unconstrainedFrame);
        if (unconstrainedY >= CGRectGetMaxY(constraintRect) || objj_msgSend(menuWindow, "canScrollDown"))
        {
            if (aView)
                aTopY = objj_msgSend(theWindow, "convertBaseToGlobal:", objj_msgSend(aView, "convertPoint:toView:", CGPointMake(0.0, aTopY), nil)).y;
            unconstrainedFrame.origin.y = MIN(CGRectGetMaxY(constraintRect), aTopY) - CGRectGetHeight(unconstrainedFrame);
        }
        else if (unconstrainedY < CGRectGetMinY(constraintRect) || objj_msgSend(menuWindow, "canScrollUp"))
        {
            if (aView)
                aBottomY = objj_msgSend(theWindow, "convertBaseToGlobal:", objj_msgSend(aView, "convertPoint:toView:", CGPointMake(0.0, aBottomY), nil)).y;
            unconstrainedFrame.origin.y = MAX(CGRectGetMinY(constraintRect), aBottomY);
        }
        objj_msgSend(menuWindow, "setFrameOrigin:", (CGRectIntersection(unconstrainedFrame, constraintRect)).origin);
    }
    if (objj_msgSend(CPPlatform, "isBrowser"))
        objj_msgSend(menuWindow, "setPlatformWindow:", objj_msgSend(objj_msgSend(aView, "window"), "platformWindow"));
    objj_msgSend(menuWindow, "orderFront:", self);
    objj_msgSend(objj_msgSend(_CPMenuManager, "sharedMenuManager"), "beginTracking:menuContainer:constraintRect:callback:", objj_msgSend(CPApp, "currentEvent"), menuWindow, constraintRect, objj_msgSend(CPMenu, "trackingCallbackWithCallback:", aCallback));
}
,["void","CPMenuItem","CGPoint","float","float","CPView","Function"]), new objj_method(sel_getUid("setShowsStateColumn:"), function $CPMenu__setShowsStateColumn_(self, _cmd, shouldShowStateColumn)
{
    self._showsStateColumn = shouldShowStateColumn;
}
,["void","BOOL"]), new objj_method(sel_getUid("showsStateColumn"), function $CPMenu__showsStateColumn(self, _cmd)
{
    return self._showsStateColumn;
}
,["BOOL"]), new objj_method(sel_getUid("highlightedItem"), function $CPMenu__highlightedItem(self, _cmd)
{
    if (self._highlightedIndex < 0)
        return nil;
    var highlightedItem = self._items[self._highlightedIndex];
    if (objj_msgSend(highlightedItem, "isSeparatorItem"))
        return nil;
    return highlightedItem;
}
,["CPMenuItem"]), new objj_method(sel_getUid("setDelegate:"), function $CPMenu__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("menuWillOpen:")))
        self._implementedDelegateMethods |= CPMenuDelegate_menuWillOpen_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("menuDidClose:")))
        self._implementedDelegateMethods |= CPMenuDelegate_menuDidClose_;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPMenu__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("_menuWillOpen"), function $CPMenu___menuWillOpen(self, _cmd)
{
    objj_msgSend(self, "_sendDelegateMenuWillOpen");
}
,["void"]), new objj_method(sel_getUid("_menuDidClose"), function $CPMenu___menuDidClose(self, _cmd)
{
    self._lastCloseEvent = objj_msgSend(CPApp, "currentEvent");
    objj_msgSend(self, "_sendDelegateMenuDidClose");
}
,["void"]), new objj_method(sel_getUid("cancelTracking"), function $CPMenu__cancelTracking(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("_fireCancelTrackingEvent"), self, nil, 0, [CPDefaultRunLoopMode]);
}
,["void"]), new objj_method(sel_getUid("_fireCancelTrackingEvent"), function $CPMenu___fireCancelTrackingEvent(self, _cmd)
{
    objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:", CPAppKitDefined, CGPointMakeZero(), 0, 0, 0, 0, 0, 0, 0));
    objj_msgSend(_CPDisplayServer, "run");
}
,["void"]), new objj_method(sel_getUid("_setMenuWindow:"), function $CPMenu___setMenuWindow_(self, _cmd, aMenuWindow)
{
    self._menuWindow = aMenuWindow;
}
,["void","_CPMenuWindow"]), new objj_method(sel_getUid("setFont:"), function $CPMenu__setFont_(self, _cmd, aFont)
{
    self._font = aFont;
}
,["void","CPFont"]), new objj_method(sel_getUid("font"), function $CPMenu__font(self, _cmd)
{
    return self._font;
}
,["CPFont"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $CPMenu__performKeyEquivalent_(self, _cmd, anEvent)
{
    if (self._autoenablesItems)
        objj_msgSend(self, "update");
    var index = 0,
        count = self._items.length,
        characters = objj_msgSend(anEvent, "charactersIgnoringModifiers"),
        modifierFlags = objj_msgSend(anEvent, "modifierFlags");
    for (; index < count; ++index)
    {
        var item = self._items[index];
        if (objj_msgSend(anEvent, "_triggersKeyEquivalent:withModifierMask:", objj_msgSend(item, "keyEquivalent"), objj_msgSend(item, "keyEquivalentModifierMask")))
        {
            if (objj_msgSend(item, "isEnabled"))
                objj_msgSend(self, "performActionForItemAtIndex:", index);
            else
            {
            }
            return YES;
        }
        if (objj_msgSend(objj_msgSend(item, "submenu"), "performKeyEquivalent:", anEvent))
            return YES;
    }
    return NO;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("performActionForItemAtIndex:"), function $CPMenu__performActionForItemAtIndex_(self, _cmd, anIndex)
{
    var item = self._items[anIndex];
    objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(item, "action"), objj_msgSend(item, "target"), item);
}
,["void","CPUInteger"]), new objj_method(sel_getUid("_highlightItemAtIndex:"), function $CPMenu___highlightItemAtIndex_(self, _cmd, anIndex)
{
    if (self._highlightedIndex === anIndex)
        return;
    if (self._highlightedIndex !== CPNotFound)
        objj_msgSend(objj_msgSend(self._items[self._highlightedIndex], "_menuItemView"), "highlight:", NO);
    self._highlightedIndex = anIndex;
    if (self._highlightedIndex !== CPNotFound)
        objj_msgSend(objj_msgSend(self._items[self._highlightedIndex], "_menuItemView"), "highlight:", YES);
    if (self._highlightedIndex !== CPNotFound && self._menuWindow)
        objj_msgSend(self._menuWindow._menuView, "scrollRectToVisible:", objj_msgSend(objj_msgSend(self._items[self._highlightedIndex], "_menuItemView"), "frame"));
}
,["void","int"]), new objj_method(sel_getUid("_setMenuName:"), function $CPMenu___setMenuName_(self, _cmd, aName)
{
    if (self._name === aName)
        return;
    self._name = aName;
    if (self._name === "CPMainMenu")
        objj_msgSend(CPApp, "setMainMenu:", self);
}
,["void","CPString"]), new objj_method(sel_getUid("_menuName"), function $CPMenu___menuName(self, _cmd)
{
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("awakeFromCib"), function $CPMenu__awakeFromCib(self, _cmd)
{
    if (self._name === "_CPMainMenu")
    {
        objj_msgSend(self, "_setMenuName:", "CPMainMenu");
        objj_msgSend(CPMenu, "setMenuBarVisible:", YES);
    }
}
,["void"]), new objj_method(sel_getUid("_menuWithName:"), function $CPMenu___menuWithName_(self, _cmd, aName)
{
    if (aName === self._name)
        return self;
    for (var i = 0, count = objj_msgSend(self._items, "count"); i < count; i++)
    {
        var menu = objj_msgSend(objj_msgSend(self._items[i], "submenu"), "_menuWithName:", aName);
        if (menu)
            return menu;
    }
    return nil;
}
,["void","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPMenu__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPMenu, "class"))
        return;
    objj_msgSend(objj_msgSend(self, "class"), "setMenuBarAttributes:", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"));
}
,["void"]), new objj_method(sel_getUid("menuBarVisible"), function $CPMenu__menuBarVisible(self, _cmd)
{
    return _CPMenuBarVisible;
}
,["BOOL"]), new objj_method(sel_getUid("setMenuBarVisible:"), function $CPMenu__setMenuBarVisible_(self, _cmd, menuBarShouldBeVisible)
{
    if (_CPMenuBarVisible === menuBarShouldBeVisible)
        return;
    _CPMenuBarVisible = menuBarShouldBeVisible;
    if (objj_msgSend(CPPlatform, "supportsNativeMainMenu"))
        return;
    if (menuBarShouldBeVisible)
    {
        if (!_CPMenuBarSharedWindow)
            _CPMenuBarSharedWindow = objj_msgSend(objj_msgSend(_CPMenuBarWindow, "alloc"), "init");
        objj_msgSend(_CPMenuBarSharedWindow, "setMenu:", objj_msgSend(CPApp, "mainMenu"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle);
        objj_msgSend(_CPMenuBarSharedWindow, "setIconImage:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-icon-image", _CPMenuView));
        objj_msgSend(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-icon-image-alpha-value", _CPMenuView));
        objj_msgSend(_CPMenuBarSharedWindow, "setColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarBackgroundColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextShadowColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleShadowColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightTextShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextShadowColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "orderFront:", self);
    }
    else
        objj_msgSend(_CPMenuBarSharedWindow, "orderOut:", self);
}
,["void","BOOL"]), new objj_method(sel_getUid("setMenuBarTitle:"), function $CPMenu__setMenuBarTitle_(self, _cmd, aTitle)
{
    _CPMenuBarTitle = aTitle;
    objj_msgSend(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle);
}
,["void","CPString"]), new objj_method(sel_getUid("menuBarTitle"), function $CPMenu__menuBarTitle(self, _cmd)
{
    return _CPMenuBarTitle;
}
,["CPString"]), new objj_method(sel_getUid("setMenuBarIconImage:"), function $CPMenu__setMenuBarIconImage_(self, _cmd, anImage)
{
    _CPMenuBarImage = anImage;
    objj_msgSend(_CPMenuBarSharedWindow, "setIconImage:", anImage);
}
,["void","CPImage"]), new objj_method(sel_getUid("menuBarIconImage"), function $CPMenu__menuBarIconImage(self, _cmd)
{
    return _CPMenuBarImage;
}
,["CPImage"]), new objj_method(sel_getUid("_setOrRemoveMenuBarAttribute:forKey:"), function $CPMenu___setOrRemoveMenuBarAttribute_forKey_(self, _cmd, aValue, aKey)
{
    if (aValue === nil)
        objj_msgSend(_CPMenuBarAttributes, "removeObjectForKey:", aKey);
    else
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", aValue, aKey);
}
,["void","id","id"]), new objj_method(sel_getUid("setMenuBarAttributes:"), function $CPMenu__setMenuBarAttributes_(self, _cmd, attributes)
{
    if (_CPMenuBarAttributes == attributes)
        return;
    _CPMenuBarAttributes = objj_msgSend(attributes, "copy");
    var textColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTextColor"),
        titleColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTitleColor"),
        textShadowColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTextShadowColor"),
        titleShadowColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTitleShadowColor"),
        highlightColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarHighlightColor"),
        highlightTextColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarHighlightTextColor"),
        highlightTextShadowColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarHighlightTextShadowColor");
    if (!textColor && titleColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", titleColor, "CPMenuBarTextColor");
    else if (textColor && !titleColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", textColor, "CPMenuBarTitleColor");
    else if (!textColor && !titleColor)
    {
        objj_msgSend(self, "_setOrRemoveMenuBarAttribute:forKey:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-text-color", _CPMenuView), "CPMenuBarTextColor");
        objj_msgSend(self, "_setOrRemoveMenuBarAttribute:forKey:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-title-color", _CPMenuView), "CPMenuBarTitleColor");
    }
    if (!textShadowColor && titleShadowColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", titleShadowColor, "CPMenuBarTextShadowColor");
    else if (textShadowColor && !titleShadowColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", textShadowColor, "CPMenuBarTitleShadowColor");
    else if (!textShadowColor && !titleShadowColor)
    {
        objj_msgSend(self, "_setOrRemoveMenuBarAttribute:forKey:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-text-shadow-color", _CPMenuView), "CPMenuBarTextShadowColor");
        objj_msgSend(self, "_setOrRemoveMenuBarAttribute:forKey:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-title-shadow-color", _CPMenuView), "CPMenuBarTitleShadowColor");
    }
    if (!highlightColor)
        objj_msgSend(self, "_setOrRemoveMenuBarAttribute:forKey:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-highlight-color", _CPMenuView), "CPMenuBarHighlightColor");
    if (!highlightTextColor)
        objj_msgSend(self, "_setOrRemoveMenuBarAttribute:forKey:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-highlight-text-color", _CPMenuView), "CPMenuBarHighlightTextColor");
    if (!highlightTextShadowColor)
        objj_msgSend(self, "_setOrRemoveMenuBarAttribute:forKey:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-highlight-text-shadow-color", _CPMenuView), "CPMenuBarHighlightTextShadowColor");
    if (_CPMenuBarSharedWindow)
    {
        objj_msgSend(_CPMenuBarSharedWindow, "setColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarBackgroundColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextShadowColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleShadowColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightTextShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextShadowColor"));
    }
}
,["void","CPDictionary"]), new objj_method(sel_getUid("menuBarAttributes"), function $CPMenu__menuBarAttributes(self, _cmd)
{
    return _CPMenuBarAttributes;
}
,["CPDictionary"]), new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"), function $CPMenu___setMenuBarIconImageAlphaValue_(self, _cmd, anAlphaValue)
{
    _CPMenuBarIconImageAlphaValue = anAlphaValue;
    objj_msgSend(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", anAlphaValue);
}
,["void","float"]), new objj_method(sel_getUid("menuBarHeight"), function $CPMenu__menuBarHeight(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-height", _CPMenuView);
}
,["float"]), new objj_method(sel_getUid("_constraintRectForView:"), function $CPMenu___constraintRectForView_(self, _cmd, aView)
{
    if (objj_msgSend(CPPlatform, "isBrowser"))
        return CGRectInset(objj_msgSend(objj_msgSend(objj_msgSend(aView, "window"), "platformWindow"), "contentBounds"), 5.0, 5.0);
    return CGRectInset(objj_msgSend(objj_msgSend(objj_msgSend(aView, "window"), "screen"), "visibleFrame"), 5.0, 5.0);
}
,["CGRect","CPView"]), new objj_method(sel_getUid("trackingCallbackWithCallback:"), function $CPMenu__trackingCallbackWithCallback_(self, _cmd, aCallback)
{
    return function(aMenuWindow, aMenu)
    {
        objj_msgSend(aMenuWindow, "setMenu:", nil);
        objj_msgSend(aMenuWindow, "orderOut:", self);
        objj_msgSend(_CPMenuWindow, "poolMenuWindow:", aMenuWindow);
        if (aCallback)
            aCallback(aMenu);
        objj_msgSend(aMenu, "_performActionOfHighlightedItemChain");
    };
}
,["Function","Function"]), new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"), function $CPMenu__popUpContextMenu_withEvent_forView_(self, _cmd, aMenu, anEvent, aView)
{
    objj_msgSend(self, "popUpContextMenu:withEvent:forView:withFont:", aMenu, anEvent, aView, nil);
}
,["void","CPMenu","CPEvent","CPView"]), new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"), function $CPMenu__popUpContextMenu_withEvent_forView_withFont_(self, _cmd, aMenu, anEvent, aView, aFont)
{
    objj_msgSend(objj_msgSend(_CPMenuManager, "sharedMenuManager"), "cancelActiveMenu");
    objj_msgSend(aMenu, "_menuWillOpen");
    if (!aFont)
        aFont = objj_msgSend(CPFont, "systemFontOfSize:", objj_msgSend(CPFont, "systemFontSize"));
    var theWindow = objj_msgSend(aView, "window"),
        menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", aMenu, aFont);
    objj_msgSend(menuWindow, "setBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle);
    var constraintRect = objj_msgSend(CPMenu, "_constraintRectForView:", aView),
        aLocation = objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToGlobal:", objj_msgSend(anEvent, "locationInWindow"));
    objj_msgSend(menuWindow, "setConstraintRect:", constraintRect);
    objj_msgSend(menuWindow, "setFrameOrigin:", aLocation);
    if (!objj_msgSend(menuWindow, "hasMinimumNumberOfVisibleItems"))
    {
        var unconstrainedFrame = objj_msgSend(menuWindow, "unconstrainedFrame"),
            unconstrainedY = CGRectGetMinY(unconstrainedFrame);
        if (unconstrainedY >= CGRectGetMaxY(constraintRect) || objj_msgSend(menuWindow, "canScrollDown"))
            unconstrainedFrame.origin.y = MIN(CGRectGetMaxY(constraintRect), aLocation.y) - CGRectGetHeight(unconstrainedFrame);
        else if (unconstrainedY < CGRectGetMinY(constraintRect) || objj_msgSend(menuWindow, "canScrollUp"))
            unconstrainedFrame.origin.y = MAX(CGRectGetMinY(constraintRect), aLocation.y);
        objj_msgSend(menuWindow, "setFrameOrigin:", (CGRectIntersection(unconstrainedFrame, constraintRect)).origin);
    }
    if (objj_msgSend(CPPlatform, "isBrowser"))
        objj_msgSend(menuWindow, "setPlatformWindow:", objj_msgSend(objj_msgSend(aView, "window"), "platformWindow"));
    objj_msgSend(menuWindow, "orderFront:", self);
    objj_msgSend(objj_msgSend(_CPMenuManager, "sharedMenuManager"), "beginTracking:menuContainer:constraintRect:callback:", anEvent, menuWindow, objj_msgSend(CPMenu, "_constraintRectForView:", aView), objj_msgSend(CPMenu, "trackingCallbackWithCallback:", nil));
}
,["void","CPMenu","CPEvent","CPView","CPFont"])]);
}{
var the_class = objj_getClass("CPMenu")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_sendDelegateMenuWillOpen"), function $CPMenu___sendDelegateMenuWillOpen(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPMenuDelegate_menuWillOpen_))
        return;
    objj_msgSend(self._delegate, "menuWillOpen:", self);
}
,["void"]), new objj_method(sel_getUid("_sendDelegateMenuDidClose"), function $CPMenu___sendDelegateMenuDidClose(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPMenuDelegate_menuDidClose_))
        return;
    objj_msgSend(self._delegate, "menuDidClose:", self);
}
,["void"])]);
}{
var the_class = objj_getClass("CPMenu")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("countOfItems"), function $CPMenu__countOfItems(self, _cmd)
{
    return objj_msgSend(self._items, "count");
}
,["CPUInteger"]), new objj_method(sel_getUid("objectInItemsAtIndex:"), function $CPMenu__objectInItemsAtIndex_(self, _cmd, anIndex)
{
    return objj_msgSend(self._items, "objectAtIndex:", anIndex);
}
,["CPMenuItem","CPUInteger"]), new objj_method(sel_getUid("itemsAtIndexes:"), function $CPMenu__itemsAtIndexes_(self, _cmd, indexes)
{
    return objj_msgSend(self._items, "objectsAtIndexes:", indexes);
}
,["CPArray","CPIndexSet"])]);
}{
var the_class = objj_getClass("CPMenu")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("insertObject:inItemsAtIndex:"), function $CPMenu__insertObject_inItemsAtIndex_(self, _cmd, aMenuItem, anIndex)
{
    var menu = objj_msgSend(aMenuItem, "menu");
    if (menu)
        if (menu !== self)
            objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Attempted to insert item into menu that was already in another menu.");
        else
            return;
    objj_msgSend(aMenuItem, "setMenu:", self);
    objj_msgSend(self, "_highlightItemAtIndex:", CPNotFound);
    objj_msgSend(self._items, "insertObject:atIndex:", aMenuItem, anIndex);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidAddItemNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", anIndex, "CPMenuItemIndex"));
}
,["void","CPMenuItem","CPUInteger"]), new objj_method(sel_getUid("removeObjectFromItemsAtIndex:"), function $CPMenu__removeObjectFromItemsAtIndex_(self, _cmd, anIndex)
{
    if (anIndex < 0 || anIndex >= objj_msgSend(self._items, "count"))
        return;
    objj_msgSend(objj_msgSend(self._items, "objectAtIndex:", anIndex), "setMenu:", nil);
    objj_msgSend(self, "_highlightItemAtIndex:", CPNotFound);
    objj_msgSend(self._items, "removeObjectAtIndex:", anIndex);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidRemoveItemNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", anIndex, "CPMenuItemIndex"));
}
,["void","CPUInteger"])]);
}var CPMenuTitleKey = "CPMenuTitleKey",
    CPMenuNameKey = "CPMenuNameKey",
    CPMenuItemsKey = "CPMenuItemsKey",
    CPMenuShowsStateColumnKey = "CPMenuShowsStateColumnKey",
    CPMenuAutoEnablesItemsKey = "CPMenuAutoEnablesItemsKey";
{
var the_class = objj_getClass("CPMenu")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPMenu__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenu").super_class }, "init");
    if (self)
    {
        self._title = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuTitleKey);
        self._items = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemsKey);
        objj_msgSend(self, "_setMenuName:", objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuNameKey));
        self._showsStateColumn = !objj_msgSend(aCoder, "containsValueForKey:", CPMenuShowsStateColumnKey) || objj_msgSend(aCoder, "decodeBoolForKey:", CPMenuShowsStateColumnKey);
        self._autoenablesItems = !objj_msgSend(aCoder, "containsValueForKey:", CPMenuAutoEnablesItemsKey) || objj_msgSend(aCoder, "decodeBoolForKey:", CPMenuAutoEnablesItemsKey);
        objj_msgSend(self, "setMinimumWidth:", 0);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPMenu__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._title, CPMenuTitleKey);
    if (self._name)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._name, CPMenuNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._items, CPMenuItemsKey);
    if (!self._showsStateColumn)
        objj_msgSend(aCoder, "encodeBool:forKey:", self._showsStateColumn, CPMenuShowsStateColumnKey);
    if (!self._autoenablesItems)
        objj_msgSend(aCoder, "encodeBool:forKey:", self._autoenablesItems, CPMenuAutoEnablesItemsKey);
}
,["void","CPCoder"])]);
}objj_executeFile("_CPMenuBarWindow.j", YES);objj_executeFile("_CPMenuWindow.j", YES);