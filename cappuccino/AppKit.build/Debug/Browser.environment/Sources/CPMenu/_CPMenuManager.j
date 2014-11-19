@STATIC;1.0;I;21;Foundation/CPObject.jI;33;Foundation/CPNotificationCenter.ji;9;CPEvent.ji;14;CPKeyBinding.jt;35857;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("CPEvent.j", YES);objj_executeFile("CPKeyBinding.j", YES);_CPMenuManagerScrollingStateUp = -1;
_CPMenuManagerScrollingStateDown = 1;
_CPMenuManagerScrollingStateNone = 0;
var STICKY_TIME_INTERVAL = 0.4,
    SharedMenuManager = nil;
{var the_class = objj_allocateClassPair(CPObject, "_CPMenuManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_startTime"), new objj_ivar("_openEvent"), new objj_ivar("_mouseWasDragged"), new objj_ivar("_scrollingState"), new objj_ivar("_lastGlobalLocation"), new objj_ivar("_lastMouseOverMenuView"), new objj_ivar("_constraintRect"), new objj_ivar("_menuContainerStack"), new objj_ivar("_trackingCallback"), new objj_ivar("_keyBuffer"), new objj_ivar("_previousActiveItem"), new objj_ivar("_showTimerID"), new objj_ivar("_menuBarButtonItemIndex")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPMenuManager__init(self, _cmd)
{
    if (SharedMenuManager)
        return SharedMenuManager;
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuManager").super_class }, "init");
}
,["id"]), new objj_method(sel_getUid("trackingMenuContainer"), function $_CPMenuManager__trackingMenuContainer(self, _cmd)
{
    return self._menuContainerStack[0];
}
,["id"]), new objj_method(sel_getUid("trackingMenu"), function $_CPMenuManager__trackingMenu(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "trackingMenuContainer")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "menu"));
    var ___r1;
}
,["CPMenu"]), new objj_method(sel_getUid("beginTracking:menuContainer:constraintRect:callback:"), function $_CPMenuManager__beginTracking_menuContainer_constraintRect_callback_(self, _cmd, anEvent, aMenuContainer, aRect, aCallback)
{
    var menu = (aMenuContainer == null ? null : aMenuContainer.isa.objj_msgSend0(aMenuContainer, "menu"));
    if ((menu == null ? null : menu.isa.objj_msgSend0(menu, "numberOfItems")) <= 0)
        return;
    CPApp._activeMenu = menu;
    self._startTime = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "timestamp"));
    self._openEvent = anEvent;
    self._scrollingState = _CPMenuManagerScrollingStateNone;
    self._constraintRect = aRect;
    self._menuContainerStack = [aMenuContainer];
    self._trackingCallback = aCallback;
    if (menu === (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")))
    {
        var globalLocation = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "globalLocation")),
            menuLocation = (aMenuContainer == null ? null : aMenuContainer.isa.objj_msgSend1(aMenuContainer, "convertGlobalToBase:", globalLocation)),
            activeItemIndex = (aMenuContainer == null ? null : aMenuContainer.isa.objj_msgSend1(aMenuContainer, "itemIndexAtPoint:", menuLocation)),
            activeItem = activeItemIndex !== CPNotFound ? (menu == null ? null : menu.isa.objj_msgSend1(menu, "itemAtIndex:", activeItemIndex)) : nil;
        self._menuBarButtonItemIndex = activeItemIndex;
        if ((activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "_isMenuBarButton")))
            return self.isa.objj_msgSend1(self, "trackMenuBarButtonEvent:", anEvent);
    }
    self._mouseWasDragged = NO;
    self.isa.objj_msgSend1(self, "trackEvent:", anEvent);
}
,["void","CPEvent","id","CGRect","Function"]), new objj_method(sel_getUid("_trackAgain"), function $_CPMenuManager___trackAgain(self, _cmd)
{
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackEvent:"), CPKeyDownMask | CPPeriodicMask | CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseDownMask | CPLeftMouseUpMask | CPRightMouseUpMask | CPAppKitDefinedMask | CPScrollWheelMask, nil, nil, YES));
}
,["void"]), new objj_method(sel_getUid("trackEvent:"), function $_CPMenuManager__trackEvent_(self, _cmd, anEvent)
{
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")),
        trackingMenu = self.isa.objj_msgSend0(self, "trackingMenu");
    if (type === CPAppKitDefined)
        return self.isa.objj_msgSend0(self, "completeTracking");
    if (type === CPKeyDown)
    {
        var menu = trackingMenu,
            submenu = ((___r1 = (menu == null ? null : menu.isa.objj_msgSend0(menu, "highlightedItem"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "submenu"));
        while (submenu && ((___r1 = submenu._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible")))
        {
            menu = submenu;
            submenu = ((___r1 = (menu == null ? null : menu.isa.objj_msgSend0(menu, "highlightedItem"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "submenu"));
        }
        if ((menu == null ? null : menu.isa.objj_msgSend0(menu, "numberOfItems")))
            self.isa.objj_msgSend2(self, "interpretKeyEvent:forMenu:", anEvent, menu);
        self.isa.objj_msgSend0(self, "_trackAgain");
        return;
    }
    var globalLocation = type === CPPeriodic ? self._lastGlobalLocation : (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "globalLocation"));
    if (!globalLocation)
    {
        self.isa.objj_msgSend0(self, "_trackAgain");
        return;
    }
    var activeMenuContainer = self.isa.objj_msgSend1(self, "menuContainerForPoint:", globalLocation),
        activeMenu = (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "menu")),
        menuLocation = (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend1(activeMenuContainer, "convertGlobalToBase:", globalLocation)),
        activeItemIndex = activeMenuContainer ? (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend1(activeMenuContainer, "itemIndexAtPoint:", menuLocation)) : CPNotFound,
        activeItem = activeItemIndex !== CPNotFound ? (activeMenu == null ? null : activeMenu.isa.objj_msgSend1(activeMenu, "itemAtIndex:", activeItemIndex)) : nil;
    if (type === CPLeftMouseDown && self._openEvent !== anEvent && (!activeMenuContainer || !CGRectContainsPoint((activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "globalFrame")), globalLocation)))
    {
        self.isa.objj_msgSend0(self, "completeTracking");
        (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "sendEvent:", anEvent));
        return;
    }
    self.isa.objj_msgSend0(self, "_trackAgain");
    if (self._lastGlobalLocation && CGRectContainsPoint((activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "globalFrame")), self._lastGlobalLocation) && !CGRectContainsPoint((activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "globalFrame")), globalLocation))
        (activeMenu == null ? null : activeMenu.isa.objj_msgSend1(activeMenu, "_highlightItemAtIndex:", CPNotFound));
    self._lastGlobalLocation = globalLocation;
    if (!(activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "isEnabled")) || (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "_isMenuBarButton")))
    {
        activeItemIndex = CPNotFound;
        activeItem = nil;
    }
    var mouseOverMenuView = (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "view"));
    if (type === CPScrollWheel && !(activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "isMenuBar")))
        (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend1(activeMenuContainer, "scrollByDelta:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "deltaY"))));
    if (type === CPPeriodic)
    {
        if (self._scrollingState === _CPMenuManagerScrollingStateUp)
            (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "scrollUp"));
        else if (self._scrollingState === _CPMenuManagerScrollingStateDown)
            (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "scrollDown"));
    }
    if (mouseOverMenuView)
    {
        if (!self._lastMouseOverMenuView)
            (activeMenu == null ? null : activeMenu.isa.objj_msgSend1(activeMenu, "_highlightItemAtIndex:", CPNotFound));
        if (self._lastMouseOverMenuView != mouseOverMenuView)
        {
            ((___r1 = self._lastMouseOverMenuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseExited:", anEvent));
            (mouseOverMenuView == null ? null : mouseOverMenuView.isa.objj_msgSend1(mouseOverMenuView, "mouseEntered:", anEvent));
            self._lastMouseOverMenuView = mouseOverMenuView;
        }
        var menuContainerWindow = activeMenuContainer;
        if (!(menuContainerWindow == null ? null : menuContainerWindow.isa.objj_msgSend1(menuContainerWindow, "isKindOfClass:", CPWindow)))
            menuContainerWindow = (menuContainerWindow == null ? null : menuContainerWindow.isa.objj_msgSend0(menuContainerWindow, "window"));
        (menuContainerWindow == null ? null : menuContainerWindow.isa.objj_msgSend1(menuContainerWindow, "sendEvent:", CPEvent.isa.objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", type, menuLocation, (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")), (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "timestamp")), menuContainerWindow, nil, 0, (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "clickCount")), (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "pressure")))));
    }
    else
    {
        if (self._lastMouseOverMenuView)
        {
            ((___r1 = self._lastMouseOverMenuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseExited:", anEvent));
            self._lastMouseOverMenuView = nil;
        }
        if (activeItemIndex !== CPNotFound)
            (activeMenu == null ? null : activeMenu.isa.objj_msgSend1(activeMenu, "_highlightItemAtIndex:", activeItemIndex));
        if (type === CPMouseMoved || type === CPLeftMouseDragged || type === CPLeftMouseDown || type === CPPeriodic)
        {
            if (type === CPLeftMouseDragged)
                self._mouseWasDragged = YES;
            var oldScrollingState = self._scrollingState;
            self._scrollingState = (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend1(activeMenuContainer, "scrollingStateForPoint:", globalLocation));
            if (self._scrollingState !== oldScrollingState)
            {
                if (self._scrollingState === _CPMenuManagerScrollingStateNone)
                    CPEvent.isa.objj_msgSend0(CPEvent, "stopPeriodicEvents");
                else if (oldScrollingState === _CPMenuManagerScrollingStateNone)
                    CPEvent.isa.objj_msgSend2(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.0, 0.04);
            }
        }
        else if (type === CPLeftMouseUp || type === CPRightMouseUp)
        {
            if (self._mouseWasDragged || (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "timestamp")) - self._startTime > STICKY_TIME_INTERVAL)
            {
                if (self._mouseWasDragged || (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "isMenuBar")) || (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "action")) !== sel_getUid("submenuAction:"))
                {
                    (trackingMenu == null ? null : trackingMenu.isa.objj_msgSend0(trackingMenu, "cancelTracking"));
                }
            }
        }
    }
    if (self._previousActiveItem !== activeItem)
    {
        clearTimeout(self._showTimerID);
        self._showTimerID = undefined;
    }
    if ((activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "hasSubmenu")))
    {
        var activeItemRect = (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend1(activeMenuContainer, "rectForItemAtIndex:", activeItemIndex)),
            newMenuOrigin;
        if ((activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "isMenuBar")))
            newMenuOrigin = CGPointMake(CGRectGetMinX(activeItemRect), CGRectGetMaxY(activeItemRect));
        else
            newMenuOrigin = CGPointMake(CGRectGetMaxX(activeItemRect), CGRectGetMinY(activeItemRect));
        newMenuOrigin = (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend1(activeMenuContainer, "convertBaseToGlobal:", newMenuOrigin));
        if (self._showTimerID === undefined)
        {
            self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", nil, activeMenu, CGPointMakeZero());
            if (!(activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "isMenuBar")))
            {
                self._showTimerID = setTimeout(function()
                {
                    self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "submenu")), (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "menu")), newMenuOrigin);
                }, 250);
            }
            else
                self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "submenu")), (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "menu")), newMenuOrigin);
        }
    }
    else
        self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", nil, activeMenu, CGPointMakeZero());
    self._previousActiveItem = activeItem;
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("trackMenuBarButtonEvent:"), function $_CPMenuManager__trackMenuBarButtonEvent_(self, _cmd, anEvent)
{
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type"));
    if (type === CPAppKitDefined)
        return self.isa.objj_msgSend0(self, "completeTracking");
    var globalLocation = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "globalLocation")),
        menu = self.isa.objj_msgSend0(self, "trackingMenu"),
        trackingMenuContainer = self.isa.objj_msgSend0(self, "trackingMenuContainer"),
        menuLocation = (trackingMenuContainer == null ? null : trackingMenuContainer.isa.objj_msgSend1(trackingMenuContainer, "convertGlobalToBase:", globalLocation));
    if ((trackingMenuContainer == null ? null : trackingMenuContainer.isa.objj_msgSend1(trackingMenuContainer, "itemIndexAtPoint:", menuLocation)) === self._menuBarButtonItemIndex)
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", self._menuBarButtonItemIndex));
    else
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", CPNotFound));
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMenuBarButtonEvent:"), CPPeriodicMask | CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask | CPAppKitDefinedMask, nil, nil, YES));
    if (type === CPLeftMouseUp)
        (menu == null ? null : menu.isa.objj_msgSend0(menu, "cancelTracking"));
}
,["void","CPEvent"]), new objj_method(sel_getUid("cancelActiveMenu"), function $_CPMenuManager__cancelActiveMenu(self, _cmd)
{
    if (CPApp._activeMenu)
    {
        self.isa.objj_msgSend0(self, "completeTracking");
        self._menuContainerStack = [];
    }
}
,["void"]), new objj_method(sel_getUid("completeTracking"), function $_CPMenuManager__completeTracking(self, _cmd)
{
    var trackingMenu = self.isa.objj_msgSend0(self, "trackingMenu");
    CPEvent.isa.objj_msgSend0(CPEvent, "stopPeriodicEvents");
    self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", nil, trackingMenu, nil);
    (trackingMenu == null ? null : trackingMenu.isa.objj_msgSend0(trackingMenu, "_menuDidClose"));
    if (self._trackingCallback)
        self._trackingCallback(self.isa.objj_msgSend0(self, "trackingMenuContainer"), trackingMenu);
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPMenuDidEndTrackingNotification, trackingMenu));
    CPApp._activeMenu = nil;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("menuContainerForPoint:"), function $_CPMenuManager__menuContainerForPoint_(self, _cmd, aGlobalLocation)
{
    var count = ((___r1 = self._menuContainerStack), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        firstMenuContainer = self._menuContainerStack[0];
    if (count === 1)
        return firstMenuContainer;
    var firstMenuWindowIndex = 0,
        lastMenuWindowIndex = count - 1;
    if ((firstMenuContainer == null ? null : firstMenuContainer.isa.objj_msgSend0(firstMenuContainer, "isMenuBar")))
    {
        if (CGRectContainsPoint((firstMenuContainer == null ? null : firstMenuContainer.isa.objj_msgSend0(firstMenuContainer, "globalFrame")), aGlobalLocation))
            return firstMenuContainer;
        firstMenuWindowIndex = 1;
    }
    var index = count,
        x = aGlobalLocation.x,
        closerDeltaX = Infinity,
        closerMenuContainer = nil;
    while (index-- > firstMenuWindowIndex)
    {
        var menuContainer = self._menuContainerStack[index],
            menuContainerFrame = (menuContainer == null ? null : menuContainer.isa.objj_msgSend0(menuContainer, "globalFrame")),
            menuContainerMinX = CGRectGetMinX(menuContainerFrame),
            menuContainerMaxX = CGRectGetMaxX(menuContainerFrame);
        if (x < menuContainerMaxX && x >= menuContainerMinX)
            return menuContainer;
        if (index === firstMenuWindowIndex || index === lastMenuWindowIndex)
        {
            var deltaX = ABS(x < menuContainerMinX ? menuContainerMinX - x : menuContainerMaxX - x);
            if (deltaX < closerDeltaX)
            {
                closerMenuContainer = menuContainer;
                closerDeltaX = deltaX;
            }
        }
    }
    return closerMenuContainer;
    var ___r1;
}
,["id","float"]), new objj_method(sel_getUid("showMenu:fromMenu:atPoint:"), function $_CPMenuManager__showMenu_fromMenu_atPoint_(self, _cmd, newMenu, baseMenu, aGlobalLocation)
{
    var count = self._menuContainerStack.length,
        index = count;
    (newMenu == null ? null : newMenu.isa.objj_msgSend0(newMenu, "_menuWillOpen"));
    while (index--)
    {
        var menuContainer = self._menuContainerStack[index],
            menu = (menuContainer == null ? null : menuContainer.isa.objj_msgSend0(menuContainer, "menu"));
        if (menu === baseMenu)
            break;
        if (menu === newMenu)
            return (newMenu == null ? null : newMenu.isa.objj_msgSend1(newMenu, "_highlightItemAtIndex:", CPNotFound));
        (menuContainer == null ? null : menuContainer.isa.objj_msgSend1(menuContainer, "orderOut:", self));
        (menuContainer == null ? null : menuContainer.isa.objj_msgSend1(menuContainer, "setMenu:", nil));
        (_CPMenuWindow == null ? null : _CPMenuWindow.isa.objj_msgSend1(_CPMenuWindow, "poolMenuWindow:", menuContainer));
        ((___r1 = self._menuContainerStack), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", index));
        (menu == null ? null : menu.isa.objj_msgSend0(menu, "_menuDidClose"));
    }
    if (!newMenu)
        return;
    (newMenu == null ? null : newMenu.isa.objj_msgSend1(newMenu, "_highlightItemAtIndex:", CPNotFound));
    var menuWindow = (_CPMenuWindow == null ? null : _CPMenuWindow.isa.objj_msgSend2(_CPMenuWindow, "menuWindowWithMenu:font:", newMenu, ((___r1 = self._menuContainerStack[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "font"))));
    ((___r1 = self._menuContainerStack), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", menuWindow));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setConstraintRect:", self._constraintRect));
    if (baseMenu === self.isa.objj_msgSend0(self, "trackingMenu") && ((___r1 = self.isa.objj_msgSend0(self, "trackingMenuContainer")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isMenuBar")))
        (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setBackgroundStyle:", _CPMenuWindowMenuBarBackgroundStyle));
    else
        (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setFrameOrigin:", aGlobalLocation));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "orderFront:", self));
    var ___r1;
}
,["void","CPMenu","CPMenu","CGPoint"]), new objj_method(sel_getUid("interpretKeyEvent:forMenu:"), function $_CPMenuManager__interpretKeyEvent_forMenu_(self, _cmd, anEvent, menu)
{
    var modifierFlags = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")),
        character = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers")),
        selectorNames = CPKeyBinding.isa.objj_msgSend2(CPKeyBinding, "selectorsForKey:modifierFlags:", character, modifierFlags);
    if (selectorNames)
    {
        var iter = (selectorNames == null ? null : selectorNames.isa.objj_msgSend0(selectorNames, "objectEnumerator")),
            obj;
        while ((obj = (iter == null ? null : iter.isa.objj_msgSend0(iter, "nextObject"))) !== nil)
        {
            var aSelector = CPSelectorFromString(obj);
            if (self.isa.objj_msgSend1(self, "respondsToSelector:", aSelector))
                self.isa.objj_msgSend2(self, "performSelector:withObject:", aSelector, menu);
        }
    }
    else if (!(modifierFlags & (CPCommandKeyMask | CPControlKeyMask)))
    {
        if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "timestamp")) - self._startTime > STICKY_TIME_INTERVAL)
            self._keyBuffer = nil;
        if (!self._keyBuffer)
        {
            self._startTime = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "timestamp"));
            self._keyBuffer = character;
            CPEvent.isa.objj_msgSend0(CPEvent, "stopPeriodicEvents");
            CPEvent.isa.objj_msgSend2(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.1, 0.1);
        }
        else
            self._keyBuffer += character;
        self.isa.objj_msgSend2(self, "selectNextItemBeginningWith:inMenu:", self._keyBuffer, menu);
        self._lastGlobalLocation = nil;
    }
}
,["void","CPEvent","CPMenu"]), new objj_method(sel_getUid("selectNextItemBeginningWith:inMenu:"), function $_CPMenuManager__selectNextItemBeginningWith_inMenu_(self, _cmd, characters, menu)
{
    var iter = ((___r1 = (menu == null ? null : menu.isa.objj_msgSend0(menu, "itemArray"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "objectEnumerator")),
        obj;
    while ((obj = (iter == null ? null : iter.isa.objj_msgSend0(iter, "nextObject"))) !== nil)
    {
        if ((obj == null ? null : obj.isa.objj_msgSend0(obj, "isHidden")) || !(obj == null ? null : obj.isa.objj_msgSend0(obj, "isEnabled")))
            continue;
        if (((___r1 = ((___r2 = (obj == null ? null : obj.isa.objj_msgSend0(obj, "title"))), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "commonPrefixWithString:options:", characters, CPCaseInsensitiveSearch))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length")) == (characters == null ? null : characters.isa.objj_msgSend0(characters, "length")))
        {
            (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", iter._index));
            break;
        }
    }
    self._startTime = CPEvent.isa.objj_msgSend0(CPEvent, "currentTimestamp");
    var ___r1, ___r2;
}
,["void","CPString","CPMenu"]), new objj_method(sel_getUid("scrollToBeginningOfDocument:"), function $_CPMenuManager__scrollToBeginningOfDocument_(self, _cmd, menu)
{
    (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", 0));
}
,["void","CPMenu"]), new objj_method(sel_getUid("scrollToEndOfDocument:"), function $_CPMenuManager__scrollToEndOfDocument_(self, _cmd, menu)
{
    (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", (menu == null ? null : menu.isa.objj_msgSend0(menu, "numberOfItems")) - 1));
}
,["void","CPMenu"]), new objj_method(sel_getUid("scrollPageDown:"), function $_CPMenuManager__scrollPageDown_(self, _cmd, menu)
{
    var menuWindow = menu._menuWindow,
        menuClipView = menuWindow._menuClipView,
        bottom = (menuClipView == null ? null : menuClipView.isa.objj_msgSend0(menuClipView, "bounds")).size.height,
        first = (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "itemIndexAtPoint:", CGPointMake(1, 10))),
        last = (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "itemIndexAtPoint:", CGPointMake(1, bottom))),
        current = (menu == null ? null : menu.isa.objj_msgSend1(menu, "indexOfItem:", (menu == null ? null : menu.isa.objj_msgSend0(menu, "highlightedItem"))));
    if (current == CPNotFound)
    {
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", 0));
        return;
    }
    var next = current + (last - first);
    if (next < (menu == null ? null : menu.isa.objj_msgSend0(menu, "numberOfItems")))
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", next));
    else
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", (menu == null ? null : menu.isa.objj_msgSend0(menu, "numberOfItems")) - 1));
    var item = (menu == null ? null : menu.isa.objj_msgSend0(menu, "highlightedItem"));
    if ((item == null ? null : item.isa.objj_msgSend0(item, "isSeparatorItem")) || (item == null ? null : item.isa.objj_msgSend0(item, "isHidden")) || !(item == null ? null : item.isa.objj_msgSend0(item, "isEnabled")))
        self.isa.objj_msgSend1(self, "moveDown:", menu);
}
,["void","CPMenu"]), new objj_method(sel_getUid("scrollPageUp:"), function $_CPMenuManager__scrollPageUp_(self, _cmd, menu)
{
    var menuWindow = menu._menuWindow,
        menuClipView = menuWindow._menuClipView,
        bottom = (menuClipView == null ? null : menuClipView.isa.objj_msgSend0(menuClipView, "bounds")).size.height,
        first = (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "itemIndexAtPoint:", CGPointMake(1, 10))),
        last = (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "itemIndexAtPoint:", CGPointMake(1, bottom))),
        current = (menu == null ? null : menu.isa.objj_msgSend1(menu, "indexOfItem:", (menu == null ? null : menu.isa.objj_msgSend0(menu, "highlightedItem"))));
    if (current == CPNotFound)
    {
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", 0));
        return;
    }
    var next = current - (last - first);
    if (next < 0)
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", 0));
    else
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", next));
    var item = (menu == null ? null : menu.isa.objj_msgSend0(menu, "highlightedItem"));
    if ((item == null ? null : item.isa.objj_msgSend0(item, "isSeparatorItem")) || (item == null ? null : item.isa.objj_msgSend0(item, "isHidden")) || !(item == null ? null : item.isa.objj_msgSend0(item, "isEnabled")))
        self.isa.objj_msgSend1(self, "moveUp:", menu);
}
,["void","CPMenu"]), new objj_method(sel_getUid("moveLeft:"), function $_CPMenuManager__moveLeft_(self, _cmd, menu)
{
    if ((menu == null ? null : menu.isa.objj_msgSend0(menu, "supermenu")))
    {
        if ((menu == null ? null : menu.isa.objj_msgSend0(menu, "supermenu")) == (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")))
        {
            self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", nil, (menu == null ? null : menu.isa.objj_msgSend0(menu, "supermenu")), CGPointMakeZero());
            self.isa.objj_msgSend1(self, "moveUp:", (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")));
            var activeItem = ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "highlightedItem")),
                menuLocation = CGPointMake(((___r1 = (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "_menuItemView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameOrigin")).x, ((___r1 = (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "_menuItemView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height);
            self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "submenu")), (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "menu")), menuLocation);
        }
        else
            self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", nil, (menu == null ? null : menu.isa.objj_msgSend0(menu, "supermenu")), CGPointMakeZero());
    }
    var ___r1;
}
,["void","CPMenu"]), new objj_method(sel_getUid("moveRight:"), function $_CPMenuManager__moveRight_(self, _cmd, menu)
{
    var activeItem = (menu == null ? null : menu.isa.objj_msgSend0(menu, "highlightedItem"));
    if ((activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "hasSubmenu")))
    {
        if (((___r1 = (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "submenu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "numberOfItems")))
        {
            var activeItemIndex = (menu == null ? null : menu.isa.objj_msgSend1(menu, "indexOfItem:", activeItem)),
                activeMenuContainer = menu._menuWindow,
                activeItemRect = (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend1(activeMenuContainer, "rectForItemAtIndex:", activeItemIndex)),
                newMenuOrigin;
            if ((activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend0(activeMenuContainer, "isMenuBar")))
                newMenuOrigin = CGPointMake(CGRectGetMinX(activeItemRect), CGRectGetMaxY(activeItemRect));
            else
                newMenuOrigin = CGPointMake(CGRectGetMaxX(activeItemRect), CGRectGetMinY(activeItemRect));
            newMenuOrigin = (activeMenuContainer == null ? null : activeMenuContainer.isa.objj_msgSend1(activeMenuContainer, "convertBaseToGlobal:", newMenuOrigin));
            self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "submenu")), (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "menu")), newMenuOrigin);
            self.isa.objj_msgSend1(self, "moveDown:", (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "submenu")));
        }
    }
    else if (self.isa.objj_msgSend0(self, "trackingMenu") == (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")))
    {
        self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", nil, menu, CGPointMakeZero());
        self.isa.objj_msgSend1(self, "moveDown:", (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")));
        var activeItem = ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "highlightedItem")),
            menuLocation = CGPointMake(((___r1 = (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "_menuItemView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameOrigin")).x, ((___r1 = (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "_menuItemView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height);
        self.isa.objj_msgSend3(self, "showMenu:fromMenu:atPoint:", (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "submenu")), (activeItem == null ? null : activeItem.isa.objj_msgSend0(activeItem, "menu")), menuLocation);
    }
    var ___r1;
}
,["void","CPMenu"]), new objj_method(sel_getUid("moveDown:"), function $_CPMenuManager__moveDown_(self, _cmd, menu)
{
    var index = menu._highlightedIndex + 1;
    if (index < (menu == null ? null : menu.isa.objj_msgSend0(menu, "numberOfItems")))
    {
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", index));
        var item = (menu == null ? null : menu.isa.objj_msgSend0(menu, "highlightedItem"));
        if ((item == null ? null : item.isa.objj_msgSend0(item, "isSeparatorItem")) || (item == null ? null : item.isa.objj_msgSend0(item, "isHidden")) || !(item == null ? null : item.isa.objj_msgSend0(item, "isEnabled")))
            self.isa.objj_msgSend1(self, "moveDown:", menu);
    }
    else if (menu == (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")))
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", 0));
}
,["void","CPMenu"]), new objj_method(sel_getUid("moveUp:"), function $_CPMenuManager__moveUp_(self, _cmd, menu)
{
    var index = menu._highlightedIndex - 1;
    if (index < 0)
    {
        if (index != CPNotFound || menu == (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")))
            (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", (menu == null ? null : menu.isa.objj_msgSend0(menu, "numberOfItems")) - 1));
        return;
    }
    (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", index));
    var item = (menu == null ? null : menu.isa.objj_msgSend0(menu, "highlightedItem"));
    if ((item == null ? null : item.isa.objj_msgSend0(item, "isSeparatorItem")) || (item == null ? null : item.isa.objj_msgSend0(item, "isHidden")) || !(item == null ? null : item.isa.objj_msgSend0(item, "isEnabled")))
        self.isa.objj_msgSend1(self, "moveUp:", menu);
}
,["void","CPMenu"]), new objj_method(sel_getUid("insertNewline:"), function $_CPMenuManager__insertNewline_(self, _cmd, menu)
{
    if (((___r1 = (menu == null ? null : menu.isa.objj_msgSend0(menu, "highlightedItem"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "hasSubmenu")))
        self.isa.objj_msgSend1(self, "moveRight:", menu);
    else
        (menu == null ? null : menu.isa.objj_msgSend0(menu, "cancelTracking"));
    var ___r1;
}
,["void","CPMenu"]), new objj_method(sel_getUid("cancelOperation:"), function $_CPMenuManager__cancelOperation_(self, _cmd, menu)
{
    (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", CPNotFound));
    CPEvent.isa.objj_msgSend0(CPEvent, "stopPeriodicEvents");
    ((___r1 = self.isa.objj_msgSend0(self, "trackingMenu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cancelTracking"));
    var ___r1;
}
,["void","CPMenu"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedMenuManager"), function $_CPMenuManager__sharedMenuManager(self, _cmd)
{
    if (!SharedMenuManager)
        SharedMenuManager = ((___r1 = _CPMenuManager.isa.objj_msgSend0(_CPMenuManager, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return SharedMenuManager;
    var ___r1;
}
,["_CPMenuManager"])]);
}