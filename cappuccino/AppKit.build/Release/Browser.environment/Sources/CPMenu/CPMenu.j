@STATIC;1.0;I;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;19;CPKeyValueBinding.ji;12;CPMenuItem.ji;18;_CPMenuBarWindow.ji;15;_CPMenuWindow.jt;55136;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPKeyValueBinding.j", YES);objj_executeFile("CPMenuItem.j", YES);{var the_protocol = objj_allocateProtocol("CPMenuDelegate");
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
    if (self === (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")))
        return CPMenu.isa.objj_msgSend0(CPMenu, "menuBarHeight");
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
        (self == null ? null : self.isa.objj_msgSend1(self, "setMinimumWidth:", 0));
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("init"), function $CPMenu__init(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "initWithTitle:", "");
}
,["id"]), new objj_method(sel_getUid("insertItem:atIndex:"), function $CPMenu__insertItem_atIndex_(self, _cmd, aMenuItem, anIndex)
{
    self.isa.objj_msgSend2(self, "insertObject:inItemsAtIndex:", aMenuItem, anIndex);
}
,["void","CPMenuItem","CPUInteger"]), new objj_method(sel_getUid("insertItemWithTitle:action:keyEquivalent:atIndex:"), function $CPMenu__insertItemWithTitle_action_keyEquivalent_atIndex_(self, _cmd, aTitle, anAction, aKeyEquivalent, anIndex)
{
    var item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", aTitle, anAction, aKeyEquivalent));
    self.isa.objj_msgSend2(self, "insertItem:atIndex:", item, anIndex);
    return item;
    var ___r1;
}
,["CPMenuItem","CPString","SEL","CPString","CPUInteger"]), new objj_method(sel_getUid("addItem:"), function $CPMenu__addItem_(self, _cmd, aMenuItem)
{
    self.isa.objj_msgSend2(self, "insertItem:atIndex:", aMenuItem, ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")));
    var ___r1;
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("addItemWithTitle:action:keyEquivalent:"), function $CPMenu__addItemWithTitle_action_keyEquivalent_(self, _cmd, aTitle, anAction, aKeyEquivalent)
{
    return self.isa.objj_msgSend(self, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, anAction, aKeyEquivalent, ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")));
    var ___r1;
}
,["CPMenuItem","CPString","SEL","CPString"]), new objj_method(sel_getUid("removeItem:"), function $CPMenu__removeItem_(self, _cmd, aMenuItem)
{
    self.isa.objj_msgSend1(self, "removeItemAtIndex:", ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aMenuItem)));
    var ___r1;
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("removeItemAtIndex:"), function $CPMenu__removeItemAtIndex_(self, _cmd, anIndex)
{
    self.isa.objj_msgSend1(self, "removeObjectFromItemsAtIndex:", anIndex);
}
,["void","CPUInteger"]), new objj_method(sel_getUid("removeAllItems"), function $CPMenu__removeAllItems(self, _cmd)
{
    var count = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._items[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMenu:", nil));
    self.isa.objj_msgSend1(self, "_highlightItemAtIndex:", CPNotFound);
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "items");
    self._items = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array");
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "items");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("itemChanged:"), function $CPMenu__itemChanged_(self, _cmd, aMenuItem)
{
    if ((aMenuItem == null ? null : aMenuItem.isa.objj_msgSend0(aMenuItem, "menu")) !== self || !self._items)
        return;
    (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend2(aMenuItem, "setValue:forKey:", (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend1(aMenuItem, "valueForKey:", "changeCount")) + 1, "changeCount"));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPMenuDidChangeItemNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", ((___r2 = self._items), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "indexOfObjectIdenticalTo:", aMenuItem)), "CPMenuItemIndex")));
    var ___r1, ___r2;
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("itemWithTag:"), function $CPMenu__itemWithTag_(self, _cmd, aTag)
{
    var index = self.isa.objj_msgSend1(self, "indexOfItemWithTag:", aTag);
    if (index == CPNotFound)
        return nil;
    return self._items[index];
}
,["CPMenuItem","int"]), new objj_method(sel_getUid("itemWithTitle:"), function $CPMenu__itemWithTitle_(self, _cmd, aTitle)
{
    var index = self.isa.objj_msgSend1(self, "indexOfItemWithTitle:", aTitle);
    if (index == CPNotFound)
        return nil;
    return self._items[index];
}
,["CPMenuItem","CPString"]), new objj_method(sel_getUid("itemAtIndex:"), function $CPMenu__itemAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", anIndex));
    var ___r1;
}
,["CPMenuItem","int"]), new objj_method(sel_getUid("numberOfItems"), function $CPMenu__numberOfItems(self, _cmd)
{
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["unsigned"]), new objj_method(sel_getUid("itemArray"), function $CPMenu__itemArray(self, _cmd)
{
    return self._items;
}
,["CPArray"]), new objj_method(sel_getUid("indexOfItem:"), function $CPMenu__indexOfItem_(self, _cmd, aMenuItem)
{
    if ((aMenuItem == null ? null : aMenuItem.isa.objj_msgSend0(aMenuItem, "menu")) !== self)
        return CPNotFound;
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aMenuItem));
    var ___r1;
}
,["int","CPMenuItem"]), new objj_method(sel_getUid("indexOfItemWithTitle:"), function $CPMenu__indexOfItemWithTitle_(self, _cmd, aTitle)
{
    var index = 0,
        count = self._items.length;
    for (; index < count; ++index)
        if (((___r1 = self._items[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "title")) === aTitle)
            return index;
    return CPNotFound;
    var ___r1;
}
,["int","CPString"]), new objj_method(sel_getUid("indexOfItemWithTag:"), function $CPMenu__indexOfItemWithTag_(self, _cmd, aTag)
{
    var index = 0,
        count = self._items.length;
    for (; index < count; ++index)
        if (((___r1 = self._items[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tag")) == aTag)
            return index;
    return CPNotFound;
    var ___r1;
}
,["int","int"]), new objj_method(sel_getUid("indexOfItemWithTarget:andAction:"), function $CPMenu__indexOfItemWithTarget_andAction_(self, _cmd, aTarget, anAction)
{
    var index = 0,
        count = self._items.length;
    for (; index < count; ++index)
    {
        var item = self._items[index];
        if ((item == null ? null : item.isa.objj_msgSend0(item, "target")) == aTarget && (!anAction || (item == null ? null : item.isa.objj_msgSend0(item, "action")) == anAction))
            return index;
    }
    return CPNotFound;
}
,["int","id","SEL"]), new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"), function $CPMenu__indexOfItemWithRepresentedObject_(self, _cmd, anObject)
{
    var index = 0,
        count = self._items.length;
    for (; index < count; ++index)
        if (((___r1 = ((___r2 = self._items[index]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "representedObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", anObject)))
            return index;
    return CPNotFound;
    var ___r1, ___r2;
}
,["int","id"]), new objj_method(sel_getUid("indexOfItemWithSubmenu:"), function $CPMenu__indexOfItemWithSubmenu_(self, _cmd, aMenu)
{
    var index = 0,
        count = self._items.length;
    for (; index < count; ++index)
        if (((___r1 = self._items[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "submenu")) == aMenu)
            return index;
    return CPNotFound;
    var ___r1;
}
,["int","CPMenu"]), new objj_method(sel_getUid("setSubmenu:forItem:"), function $CPMenu__setSubmenu_forItem_(self, _cmd, aMenu, aMenuItem)
{
    (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend1(aMenuItem, "setTarget:", aMenuItem));
    (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend1(aMenuItem, "setAction:", sel_getUid("submenuAction:")));
    (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend1(aMenuItem, "setSubmenu:", aMenu));
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
    return !self._supermenu || self == (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu"));
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
    var items = self.isa.objj_msgSend0(self, "itemArray");
    for (var i = 0; i < (items == null ? null : items.isa.objj_msgSend0(items, "count")); i++)
    {
        var item = (items == null ? null : items.isa.objj_msgSend1(items, "objectAtIndex:", i));
        if ((item == null ? null : item.isa.objj_msgSend0(item, "hasSubmenu")))
            continue;
        var binder = CPBinder.isa.objj_msgSend2(CPBinder, "getBinding:forObject:", CPEnabledBinding, item);
        if (binder)
        {
            (binder == null ? null : binder.isa.objj_msgSend1(binder, "setValueFor:", CPEnabledBinding));
            ((___r1 = ((___r2 = self._menuWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_menuView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tile"));
            return;
        }
        var validator = (CPApp == null ? null : CPApp.isa.objj_msgSend3(CPApp, "targetForAction:to:from:", (item == null ? null : item.isa.objj_msgSend0(item, "action")), (item == null ? null : item.isa.objj_msgSend0(item, "target")), item)),
            shouldBeEnabled = YES;
        if (!validator)
        {
            if ((item == null ? null : item.isa.objj_msgSend0(item, "action")) || (item == null ? null : item.isa.objj_msgSend0(item, "target")))
                shouldBeEnabled = NO;
            else
            {
                var info = CPBinder.isa.objj_msgSend2(CPBinder, "infoForBinding:forObject:", CPTargetBinding, item);
                if (info)
                {
                    var object = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedObjectKey)),
                        keyPath = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPObservedKeyPathKey)),
                        options = (info == null ? null : info.isa.objj_msgSend1(info, "objectForKey:", CPOptionsKey)),
                        target = (object == null ? null : object.isa.objj_msgSend1(object, "valueForKeyPath:", keyPath)),
                        selector = (options == null ? null : options.isa.objj_msgSend1(options, "valueForKey:", CPSelectorNameBindingOption));
                    if (target && selector && !(target == null ? null : target.isa.objj_msgSend1(target, "respondsToSelector:", CPSelectorFromString(selector))))
                        shouldBeEnabled = NO;
                }
            }
        }
        else if (!(validator == null ? null : validator.isa.objj_msgSend1(validator, "respondsToSelector:", (item == null ? null : item.isa.objj_msgSend0(item, "action")))))
            shouldBeEnabled = NO;
        else if ((validator == null ? null : validator.isa.objj_msgSend1(validator, "respondsToSelector:", sel_getUid("validateMenuItem:"))))
            shouldBeEnabled = (validator == null ? null : validator.isa.objj_msgSend1(validator, "validateMenuItem:", item));
        else if ((validator == null ? null : validator.isa.objj_msgSend1(validator, "respondsToSelector:", sel_getUid("validateUserInterfaceItem:"))))
            shouldBeEnabled = (validator == null ? null : validator.isa.objj_msgSend1(validator, "validateUserInterfaceItem:", item));
        (item == null ? null : item.isa.objj_msgSend1(item, "setEnabled:", shouldBeEnabled));
    }
    ((___r1 = ((___r2 = self._menuWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_menuView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tile"));
    var ___r1, ___r2;
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
    var highlightedItem = self.isa.objj_msgSend0(self, "highlightedItem");
    while ((highlightedItem == null ? null : highlightedItem.isa.objj_msgSend0(highlightedItem, "submenu")) && (highlightedItem == null ? null : highlightedItem.isa.objj_msgSend0(highlightedItem, "action")) === sel_getUid("submenuAction:"))
        highlightedItem = ((___r1 = (highlightedItem == null ? null : highlightedItem.isa.objj_msgSend0(highlightedItem, "submenu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "highlightedItem"));
    if (highlightedItem && (highlightedItem == null ? null : highlightedItem.isa.objj_msgSend0(highlightedItem, "isEnabled")))
    {
        var binding = CPBinder.isa.objj_msgSend2(CPBinder, "getBinding:forObject:", CPTargetBinding, highlightedItem);
        (binding == null ? null : binding.isa.objj_msgSend0(binding, "invokeAction"));
        (CPApp == null ? null : CPApp.isa.objj_msgSend3(CPApp, "sendAction:to:from:", (highlightedItem == null ? null : highlightedItem.isa.objj_msgSend0(highlightedItem, "action")), (highlightedItem == null ? null : highlightedItem.isa.objj_msgSend0(highlightedItem, "target")), highlightedItem));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("popUpMenuPositioningItem:atLocation:inView:callback:"), function $CPMenu__popUpMenuPositioningItem_atLocation_inView_callback_(self, _cmd, anItem, aLocation, aView, aCallback)
{
    self.isa.objj_msgSend(self, "_popUpMenuPositioningItem:atLocation:topY:bottomY:inView:callback:", anItem, aLocation, aLocation.y, aLocation.y, aView, aCallback);
}
,["void","CPMenuItem","CGPoint","CPView","Function"]), new objj_method(sel_getUid("_popUpMenuPositioningItem:atLocation:topY:bottomY:inView:callback:"), function $CPMenu___popUpMenuPositioningItem_atLocation_topY_bottomY_inView_callback_(self, _cmd, anItem, aLocation, aTopY, aBottomY, aView, aCallback)
{
    var itemIndex = 0;
    if (anItem)
    {
        itemIndex = self.isa.objj_msgSend1(self, "indexOfItem:", anItem);
        if (itemIndex === CPNotFound)
            throw "In call to popUpMenuPositioningItem:atLocation:inView:callback:, menu item " + anItem + " is not present in menu " + self;
    }
    var theWindow = (aView == null ? null : aView.isa.objj_msgSend0(aView, "window"));
    if (aView && !theWindow)
        throw "In call to popUpMenuPositioningItem:atLocation:inView:callback:, view is not in any window.";
    self.isa.objj_msgSend0(self, "_menuWillOpen");
    if (aView)
        aLocation = (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "convertBaseToGlobal:", (aView == null ? null : aView.isa.objj_msgSend2(aView, "convertPoint:toView:", aLocation, nil))));
    var menuWindow = _CPMenuWindow.isa.objj_msgSend2(_CPMenuWindow, "menuWindowWithMenu:font:", self, self.isa.objj_msgSend0(self, "font"));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle));
    if (anItem)
        aLocation.y -= (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "deltaYForItemAtIndex:", itemIndex));
    var constraintRect = CPMenu.isa.objj_msgSend1(CPMenu, "_constraintRectForView:", aView);
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setFrameOrigin:", aLocation));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setConstraintRect:", constraintRect));
    if (!(menuWindow == null ? null : menuWindow.isa.objj_msgSend0(menuWindow, "hasMinimumNumberOfVisibleItems")))
    {
        var unconstrainedFrame = (menuWindow == null ? null : menuWindow.isa.objj_msgSend0(menuWindow, "unconstrainedFrame")),
            unconstrainedY = CGRectGetMinY(unconstrainedFrame);
        if (unconstrainedY >= CGRectGetMaxY(constraintRect) || (menuWindow == null ? null : menuWindow.isa.objj_msgSend0(menuWindow, "canScrollDown")))
        {
            if (aView)
                aTopY = (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "convertBaseToGlobal:", (aView == null ? null : aView.isa.objj_msgSend2(aView, "convertPoint:toView:", CGPointMake(0.0, aTopY), nil)))).y;
            unconstrainedFrame.origin.y = MIN(CGRectGetMaxY(constraintRect), aTopY) - CGRectGetHeight(unconstrainedFrame);
        }
        else if (unconstrainedY < CGRectGetMinY(constraintRect) || (menuWindow == null ? null : menuWindow.isa.objj_msgSend0(menuWindow, "canScrollUp")))
        {
            if (aView)
                aBottomY = (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "convertBaseToGlobal:", (aView == null ? null : aView.isa.objj_msgSend2(aView, "convertPoint:toView:", CGPointMake(0.0, aBottomY), nil)))).y;
            unconstrainedFrame.origin.y = MAX(CGRectGetMinY(constraintRect), aBottomY);
        }
        (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setFrameOrigin:", (CGRectIntersection(unconstrainedFrame, constraintRect)).origin));
    }
    if (CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
        (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setPlatformWindow:", ((___r1 = (aView == null ? null : aView.isa.objj_msgSend0(aView, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "orderFront:", self));
    ((___r1 = _CPMenuManager.isa.objj_msgSend0(_CPMenuManager, "sharedMenuManager")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "beginTracking:menuContainer:constraintRect:callback:", (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")), menuWindow, constraintRect, CPMenu.isa.objj_msgSend1(CPMenu, "trackingCallbackWithCallback:", aCallback)));
    var ___r1;
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
    if ((highlightedItem == null ? null : highlightedItem.isa.objj_msgSend0(highlightedItem, "isSeparatorItem")))
        return nil;
    return highlightedItem;
}
,["CPMenuItem"]), new objj_method(sel_getUid("setDelegate:"), function $CPMenu__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("menuWillOpen:"))))
        self._implementedDelegateMethods |= CPMenuDelegate_menuWillOpen_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("menuDidClose:"))))
        self._implementedDelegateMethods |= CPMenuDelegate_menuDidClose_;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPMenu__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("_menuWillOpen"), function $CPMenu___menuWillOpen(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_sendDelegateMenuWillOpen");
}
,["void"]), new objj_method(sel_getUid("_menuDidClose"), function $CPMenu___menuDidClose(self, _cmd)
{
    self._lastCloseEvent = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"));
    self.isa.objj_msgSend0(self, "_sendDelegateMenuDidClose");
}
,["void"]), new objj_method(sel_getUid("cancelTracking"), function $CPMenu__cancelTracking(self, _cmd)
{
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "performSelector:target:argument:order:modes:", sel_getUid("_fireCancelTrackingEvent"), self, nil, 0, [CPDefaultRunLoopMode]));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_fireCancelTrackingEvent"), function $CPMenu___fireCancelTrackingEvent(self, _cmd)
{
    (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "sendEvent:", CPEvent.isa.objj_msgSend(CPEvent, "otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:", CPAppKitDefined, CGPointMakeZero(), 0, 0, 0, 0, 0, 0, 0)));
    _CPDisplayServer.isa.objj_msgSend0(_CPDisplayServer, "run");
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
        self.isa.objj_msgSend0(self, "update");
    var index = 0,
        count = self._items.length,
        characters = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers")),
        modifierFlags = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags"));
    for (; index < count; ++index)
    {
        var item = self._items[index];
        if ((anEvent == null ? null : anEvent.isa.objj_msgSend2(anEvent, "_triggersKeyEquivalent:withModifierMask:", (item == null ? null : item.isa.objj_msgSend0(item, "keyEquivalent")), (item == null ? null : item.isa.objj_msgSend0(item, "keyEquivalentModifierMask")))))
        {
            if ((item == null ? null : item.isa.objj_msgSend0(item, "isEnabled")))
                self.isa.objj_msgSend1(self, "performActionForItemAtIndex:", index);
            else
            {
            }
            return YES;
        }
        if (((___r1 = (item == null ? null : item.isa.objj_msgSend0(item, "submenu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performKeyEquivalent:", anEvent)))
            return YES;
    }
    return NO;
    var ___r1;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("performActionForItemAtIndex:"), function $CPMenu__performActionForItemAtIndex_(self, _cmd, anIndex)
{
    var item = self._items[anIndex];
    (CPApp == null ? null : CPApp.isa.objj_msgSend3(CPApp, "sendAction:to:from:", (item == null ? null : item.isa.objj_msgSend0(item, "action")), (item == null ? null : item.isa.objj_msgSend0(item, "target")), item));
}
,["void","CPUInteger"]), new objj_method(sel_getUid("_highlightItemAtIndex:"), function $CPMenu___highlightItemAtIndex_(self, _cmd, anIndex)
{
    if (self._highlightedIndex === anIndex)
        return;
    if (self._highlightedIndex !== CPNotFound)
        ((___r1 = ((___r2 = self._items[self._highlightedIndex]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_menuItemView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "highlight:", NO));
    self._highlightedIndex = anIndex;
    if (self._highlightedIndex !== CPNotFound)
        ((___r1 = ((___r2 = self._items[self._highlightedIndex]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_menuItemView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "highlight:", YES));
    if (self._highlightedIndex !== CPNotFound && self._menuWindow)
        ((___r1 = self._menuWindow._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollRectToVisible:", ((___r2 = ((___r3 = self._items[self._highlightedIndex]), ___r3 == null ? null : ___r3.isa.objj_msgSend0(___r3, "_menuItemView"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))));
    var ___r1, ___r2, ___r3;
}
,["void","int"]), new objj_method(sel_getUid("_setMenuName:"), function $CPMenu___setMenuName_(self, _cmd, aName)
{
    if (self._name === aName)
        return;
    self._name = aName;
    if (self._name === "CPMainMenu")
        (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "setMainMenu:", self));
}
,["void","CPString"]), new objj_method(sel_getUid("_menuName"), function $CPMenu___menuName(self, _cmd)
{
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("awakeFromCib"), function $CPMenu__awakeFromCib(self, _cmd)
{
    if (self._name === "_CPMainMenu")
    {
        self.isa.objj_msgSend1(self, "_setMenuName:", "CPMainMenu");
        CPMenu.isa.objj_msgSend1(CPMenu, "setMenuBarVisible:", YES);
    }
}
,["void"]), new objj_method(sel_getUid("_menuWithName:"), function $CPMenu___menuWithName_(self, _cmd, aName)
{
    if (aName === self._name)
        return self;
    for (var i = 0, count = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")); i < count; i++)
    {
        var menu = ((___r1 = ((___r2 = self._items[i]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "submenu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_menuWithName:", aName));
        if (menu)
            return menu;
    }
    return nil;
    var ___r1, ___r2;
}
,["void","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPMenu__initialize(self, _cmd)
{
    if (self !== CPMenu.isa.objj_msgSend0(CPMenu, "class"))
        return;
    ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMenuBarAttributes:", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init")));
    var ___r1;
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
    if (CPPlatform.isa.objj_msgSend0(CPPlatform, "supportsNativeMainMenu"))
        return;
    if (menuBarShouldBeVisible)
    {
        if (!_CPMenuBarSharedWindow)
            _CPMenuBarSharedWindow = ((___r1 = _CPMenuBarWindow.isa.objj_msgSend0(_CPMenuBarWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setMenu:", (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setIconImage:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-icon-image", _CPMenuView))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-icon-image-alpha-value", _CPMenuView))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarBackgroundColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setTextColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setTitleColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setTextShadowColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextShadowColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setTitleShadowColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleShadowColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setHighlightColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setHighlightTextColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setHighlightTextShadowColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextShadowColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "orderFront:", self));
    }
    else
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "orderOut:", self));
    ((___r1 = CPPlatformWindow.isa.objj_msgSend0(CPPlatformWindow, "primaryPlatformWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "resizeEvent:", nil));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setMenuBarTitle:"), function $CPMenu__setMenuBarTitle_(self, _cmd, aTitle)
{
    _CPMenuBarTitle = aTitle;
    (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle));
}
,["void","CPString"]), new objj_method(sel_getUid("menuBarTitle"), function $CPMenu__menuBarTitle(self, _cmd)
{
    return _CPMenuBarTitle;
}
,["CPString"]), new objj_method(sel_getUid("setMenuBarIconImage:"), function $CPMenu__setMenuBarIconImage_(self, _cmd, anImage)
{
    _CPMenuBarImage = anImage;
    (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setIconImage:", anImage));
}
,["void","CPImage"]), new objj_method(sel_getUid("menuBarIconImage"), function $CPMenu__menuBarIconImage(self, _cmd)
{
    return _CPMenuBarImage;
}
,["CPImage"]), new objj_method(sel_getUid("_setOrRemoveMenuBarAttribute:forKey:"), function $CPMenu___setOrRemoveMenuBarAttribute_forKey_(self, _cmd, aValue, aKey)
{
    if (aValue === nil)
        (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "removeObjectForKey:", aKey));
    else
        (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend2(_CPMenuBarAttributes, "setObject:forKey:", aValue, aKey));
}
,["void","id","id"]), new objj_method(sel_getUid("setMenuBarAttributes:"), function $CPMenu__setMenuBarAttributes_(self, _cmd, attributes)
{
    if (_CPMenuBarAttributes == attributes)
        return;
    _CPMenuBarAttributes = (attributes == null ? null : attributes.isa.objj_msgSend0(attributes, "copy"));
    var textColor = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "objectForKey:", "CPMenuBarTextColor")),
        titleColor = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "objectForKey:", "CPMenuBarTitleColor")),
        textShadowColor = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "objectForKey:", "CPMenuBarTextShadowColor")),
        titleShadowColor = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "objectForKey:", "CPMenuBarTitleShadowColor")),
        highlightColor = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "objectForKey:", "CPMenuBarHighlightColor")),
        highlightTextColor = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "objectForKey:", "CPMenuBarHighlightTextColor")),
        highlightTextShadowColor = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "objectForKey:", "CPMenuBarHighlightTextShadowColor"));
    if (!textColor && titleColor)
        (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend2(_CPMenuBarAttributes, "setObject:forKey:", titleColor, "CPMenuBarTextColor"));
    else if (textColor && !titleColor)
        (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend2(_CPMenuBarAttributes, "setObject:forKey:", textColor, "CPMenuBarTitleColor"));
    else if (!textColor && !titleColor)
    {
        self.isa.objj_msgSend2(self, "_setOrRemoveMenuBarAttribute:forKey:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-text-color", _CPMenuView)), "CPMenuBarTextColor");
        self.isa.objj_msgSend2(self, "_setOrRemoveMenuBarAttribute:forKey:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-title-color", _CPMenuView)), "CPMenuBarTitleColor");
    }
    if (!textShadowColor && titleShadowColor)
        (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend2(_CPMenuBarAttributes, "setObject:forKey:", titleShadowColor, "CPMenuBarTextShadowColor"));
    else if (textShadowColor && !titleShadowColor)
        (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend2(_CPMenuBarAttributes, "setObject:forKey:", textShadowColor, "CPMenuBarTitleShadowColor"));
    else if (!textShadowColor && !titleShadowColor)
    {
        self.isa.objj_msgSend2(self, "_setOrRemoveMenuBarAttribute:forKey:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-text-shadow-color", _CPMenuView)), "CPMenuBarTextShadowColor");
        self.isa.objj_msgSend2(self, "_setOrRemoveMenuBarAttribute:forKey:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-title-shadow-color", _CPMenuView)), "CPMenuBarTitleShadowColor");
    }
    if (!highlightColor)
        self.isa.objj_msgSend2(self, "_setOrRemoveMenuBarAttribute:forKey:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-highlight-color", _CPMenuView)), "CPMenuBarHighlightColor");
    if (!highlightTextColor)
        self.isa.objj_msgSend2(self, "_setOrRemoveMenuBarAttribute:forKey:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-highlight-text-color", _CPMenuView)), "CPMenuBarHighlightTextColor");
    if (!highlightTextShadowColor)
        self.isa.objj_msgSend2(self, "_setOrRemoveMenuBarAttribute:forKey:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-highlight-text-shadow-color", _CPMenuView)), "CPMenuBarHighlightTextShadowColor");
    if (_CPMenuBarSharedWindow)
    {
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarBackgroundColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setTextColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setTitleColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setTextShadowColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextShadowColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setTitleShadowColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleShadowColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setHighlightColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setHighlightTextColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextColor"))));
        (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setHighlightTextShadowColor:", (_CPMenuBarAttributes == null ? null : _CPMenuBarAttributes.isa.objj_msgSend1(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextShadowColor"))));
    }
    var ___r1;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("menuBarAttributes"), function $CPMenu__menuBarAttributes(self, _cmd)
{
    return _CPMenuBarAttributes;
}
,["CPDictionary"]), new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"), function $CPMenu___setMenuBarIconImageAlphaValue_(self, _cmd, anAlphaValue)
{
    _CPMenuBarIconImageAlphaValue = anAlphaValue;
    (_CPMenuBarSharedWindow == null ? null : _CPMenuBarSharedWindow.isa.objj_msgSend1(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", anAlphaValue));
}
,["void","float"]), new objj_method(sel_getUid("menuBarHeight"), function $CPMenu__menuBarHeight(self, _cmd)
{
    return ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-height", _CPMenuView));
    var ___r1;
}
,["float"]), new objj_method(sel_getUid("_constraintRectForView:"), function $CPMenu___constraintRectForView_(self, _cmd, aView)
{
    if (CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
        return CGRectInset(((___r1 = ((___r2 = (aView == null ? null : aView.isa.objj_msgSend0(aView, "window"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentBounds")), 5.0, 5.0);
    return CGRectInset(((___r1 = ((___r2 = (aView == null ? null : aView.isa.objj_msgSend0(aView, "window"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "screen"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame")), 5.0, 5.0);
    var ___r1, ___r2;
}
,["CGRect","CPView"]), new objj_method(sel_getUid("trackingCallbackWithCallback:"), function $CPMenu__trackingCallbackWithCallback_(self, _cmd, aCallback)
{
    return function(aMenuWindow, aMenu)
    {
        (aMenuWindow == null ? null : aMenuWindow.isa.objj_msgSend1(aMenuWindow, "setMenu:", nil));
        (aMenuWindow == null ? null : aMenuWindow.isa.objj_msgSend1(aMenuWindow, "orderOut:", self));
        _CPMenuWindow.isa.objj_msgSend1(_CPMenuWindow, "poolMenuWindow:", aMenuWindow);
        if (aCallback)
            aCallback(aMenu);
        (aMenu == null ? null : aMenu.isa.objj_msgSend0(aMenu, "_performActionOfHighlightedItemChain"));
    };
}
,["Function","Function"]), new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"), function $CPMenu__popUpContextMenu_withEvent_forView_(self, _cmd, aMenu, anEvent, aView)
{
    self.isa.objj_msgSend(self, "popUpContextMenu:withEvent:forView:withFont:", aMenu, anEvent, aView, nil);
}
,["void","CPMenu","CPEvent","CPView"]), new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"), function $CPMenu__popUpContextMenu_withEvent_forView_withFont_(self, _cmd, aMenu, anEvent, aView, aFont)
{
    ((___r1 = _CPMenuManager.isa.objj_msgSend0(_CPMenuManager, "sharedMenuManager")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cancelActiveMenu"));
    (aMenu == null ? null : aMenu.isa.objj_msgSend0(aMenu, "_menuWillOpen"));
    if (!aFont)
        aFont = CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", CPFont.isa.objj_msgSend0(CPFont, "systemFontSize"));
    var theWindow = (aView == null ? null : aView.isa.objj_msgSend0(aView, "window")),
        menuWindow = _CPMenuWindow.isa.objj_msgSend2(_CPMenuWindow, "menuWindowWithMenu:font:", aMenu, aFont);
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle));
    var constraintRect = CPMenu.isa.objj_msgSend1(CPMenu, "_constraintRectForView:", aView),
        aLocation = ((___r1 = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertBaseToGlobal:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow"))));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setConstraintRect:", constraintRect));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setFrameOrigin:", aLocation));
    if (!(menuWindow == null ? null : menuWindow.isa.objj_msgSend0(menuWindow, "hasMinimumNumberOfVisibleItems")))
    {
        var unconstrainedFrame = (menuWindow == null ? null : menuWindow.isa.objj_msgSend0(menuWindow, "unconstrainedFrame")),
            unconstrainedY = CGRectGetMinY(unconstrainedFrame);
        if (unconstrainedY >= CGRectGetMaxY(constraintRect) || (menuWindow == null ? null : menuWindow.isa.objj_msgSend0(menuWindow, "canScrollDown")))
            unconstrainedFrame.origin.y = MIN(CGRectGetMaxY(constraintRect), aLocation.y) - CGRectGetHeight(unconstrainedFrame);
        else if (unconstrainedY < CGRectGetMinY(constraintRect) || (menuWindow == null ? null : menuWindow.isa.objj_msgSend0(menuWindow, "canScrollUp")))
            unconstrainedFrame.origin.y = MAX(CGRectGetMinY(constraintRect), aLocation.y);
        (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setFrameOrigin:", (CGRectIntersection(unconstrainedFrame, constraintRect)).origin));
    }
    if (CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
        (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setPlatformWindow:", ((___r1 = (aView == null ? null : aView.isa.objj_msgSend0(aView, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "orderFront:", self));
    ((___r1 = _CPMenuManager.isa.objj_msgSend0(_CPMenuManager, "sharedMenuManager")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "beginTracking:menuContainer:constraintRect:callback:", anEvent, menuWindow, CPMenu.isa.objj_msgSend1(CPMenu, "_constraintRectForView:", aView), CPMenu.isa.objj_msgSend1(CPMenu, "trackingCallbackWithCallback:", nil)));
    var ___r1;
}
,["void","CPMenu","CPEvent","CPView","CPFont"])]);
}{
var the_class = objj_getClass("CPMenu")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_sendDelegateMenuWillOpen"), function $CPMenu___sendDelegateMenuWillOpen(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPMenuDelegate_menuWillOpen_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "menuWillOpen:", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_sendDelegateMenuDidClose"), function $CPMenu___sendDelegateMenuDidClose(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPMenuDelegate_menuDidClose_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "menuDidClose:", self));
    var ___r1;
}
,["void"])]);
}{
var the_class = objj_getClass("CPMenu")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("countOfItems"), function $CPMenu__countOfItems(self, _cmd)
{
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["CPUInteger"]), new objj_method(sel_getUid("objectInItemsAtIndex:"), function $CPMenu__objectInItemsAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", anIndex));
    var ___r1;
}
,["CPMenuItem","CPUInteger"]), new objj_method(sel_getUid("itemsAtIndexes:"), function $CPMenu__itemsAtIndexes_(self, _cmd, indexes)
{
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectsAtIndexes:", indexes));
    var ___r1;
}
,["CPArray","CPIndexSet"])]);
}{
var the_class = objj_getClass("CPMenu")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("insertObject:inItemsAtIndex:"), function $CPMenu__insertObject_inItemsAtIndex_(self, _cmd, aMenuItem, anIndex)
{
    var menu = (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend0(aMenuItem, "menu"));
    if (menu)
        if (menu !== self)
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "Attempted to insert item into menu that was already in another menu.");
        else
            return;
    (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend1(aMenuItem, "setMenu:", self));
    self.isa.objj_msgSend1(self, "_highlightItemAtIndex:", CPNotFound);
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", aMenuItem, anIndex));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPMenuDidAddItemNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", anIndex, "CPMenuItemIndex")));
    var ___r1;
}
,["void","CPMenuItem","CPUInteger"]), new objj_method(sel_getUid("removeObjectFromItemsAtIndex:"), function $CPMenu__removeObjectFromItemsAtIndex_(self, _cmd, anIndex)
{
    if (anIndex < 0 || anIndex >= ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        return;
    ((___r1 = ((___r2 = self._items), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", anIndex))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMenu:", nil));
    self.isa.objj_msgSend1(self, "_highlightItemAtIndex:", CPNotFound);
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", anIndex));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPMenuDidRemoveItemNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", anIndex, "CPMenuItemIndex")));
    var ___r1, ___r2;
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
        self._title = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuTitleKey));
        self._items = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemsKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "_setMenuName:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuNameKey))));
        self._showsStateColumn = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPMenuShowsStateColumnKey)) || (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPMenuShowsStateColumnKey));
        self._autoenablesItems = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPMenuAutoEnablesItemsKey)) || (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPMenuAutoEnablesItemsKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setMinimumWidth:", 0));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPMenu__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._title, CPMenuTitleKey));
    if (self._name)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._name, CPMenuNameKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._items, CPMenuItemsKey));
    if (!self._showsStateColumn)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._showsStateColumn, CPMenuShowsStateColumnKey));
    if (!self._autoenablesItems)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._autoenablesItems, CPMenuAutoEnablesItemsKey));
}
,["void","CPCoder"])]);
}objj_executeFile("_CPMenuBarWindow.j", YES);objj_executeFile("_CPMenuWindow.j", YES);