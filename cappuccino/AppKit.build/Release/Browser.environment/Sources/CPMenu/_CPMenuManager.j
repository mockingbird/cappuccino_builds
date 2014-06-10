@STATIC;1.0;I;21;Foundation/CPObject.jI;33;Foundation/CPNotificationCenter.ji;9;CPEvent.ji;14;CPKeyBinding.jt;26315;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("CPEvent.j", YES);objj_executeFile("CPKeyBinding.j", YES);_CPMenuManagerScrollingStateUp = -1;
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
    return objj_msgSend(objj_msgSend(self, "trackingMenuContainer"), "menu");
}
,["CPMenu"]), new objj_method(sel_getUid("beginTracking:menuContainer:constraintRect:callback:"), function $_CPMenuManager__beginTracking_menuContainer_constraintRect_callback_(self, _cmd, anEvent, aMenuContainer, aRect, aCallback)
{
    var menu = objj_msgSend(aMenuContainer, "menu");
    if (objj_msgSend(menu, "numberOfItems") <= 0)
        return;
    CPApp._activeMenu = menu;
    self._startTime = objj_msgSend(anEvent, "timestamp");
    self._openEvent = anEvent;
    self._scrollingState = _CPMenuManagerScrollingStateNone;
    self._constraintRect = aRect;
    self._menuContainerStack = [aMenuContainer];
    self._trackingCallback = aCallback;
    if (menu === objj_msgSend(CPApp, "mainMenu"))
    {
        var globalLocation = objj_msgSend(anEvent, "globalLocation"),
            menuLocation = objj_msgSend(aMenuContainer, "convertGlobalToBase:", globalLocation),
            activeItemIndex = objj_msgSend(aMenuContainer, "itemIndexAtPoint:", menuLocation),
            activeItem = activeItemIndex !== CPNotFound ? objj_msgSend(menu, "itemAtIndex:", activeItemIndex) : nil;
        self._menuBarButtonItemIndex = activeItemIndex;
        if (objj_msgSend(activeItem, "_isMenuBarButton"))
            return objj_msgSend(self, "trackMenuBarButtonEvent:", anEvent);
    }
    self._mouseWasDragged = NO;
    objj_msgSend(self, "trackEvent:", anEvent);
}
,["void","CPEvent","id","CGRect","Function"]), new objj_method(sel_getUid("_trackAgain"), function $_CPMenuManager___trackAgain(self, _cmd)
{
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackEvent:"), CPKeyDownMask | CPPeriodicMask | CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseDownMask | CPLeftMouseUpMask | CPRightMouseUpMask | CPAppKitDefinedMask | CPScrollWheelMask, nil, nil, YES);
}
,["void"]), new objj_method(sel_getUid("trackEvent:"), function $_CPMenuManager__trackEvent_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type"),
        trackingMenu = objj_msgSend(self, "trackingMenu");
    if (type === CPAppKitDefined)
        return objj_msgSend(self, "completeTracking");
    if (type === CPKeyDown)
    {
        var menu = trackingMenu,
            submenu = objj_msgSend(objj_msgSend(menu, "highlightedItem"), "submenu");
        while (submenu && objj_msgSend(submenu._menuWindow, "isVisible"))
        {
            menu = submenu;
            submenu = objj_msgSend(objj_msgSend(menu, "highlightedItem"), "submenu");
        }
        if (objj_msgSend(menu, "numberOfItems"))
            objj_msgSend(self, "interpretKeyEvent:forMenu:", anEvent, menu);
        objj_msgSend(self, "_trackAgain");
        return;
    }
    var globalLocation = type === CPPeriodic ? self._lastGlobalLocation : objj_msgSend(anEvent, "globalLocation");
    if (!globalLocation)
    {
        objj_msgSend(self, "_trackAgain");
        return;
    }
    var activeMenuContainer = objj_msgSend(self, "menuContainerForPoint:", globalLocation),
        activeMenu = objj_msgSend(activeMenuContainer, "menu"),
        menuLocation = objj_msgSend(activeMenuContainer, "convertGlobalToBase:", globalLocation),
        activeItemIndex = activeMenuContainer ? objj_msgSend(activeMenuContainer, "itemIndexAtPoint:", menuLocation) : CPNotFound,
        activeItem = activeItemIndex !== CPNotFound ? objj_msgSend(activeMenu, "itemAtIndex:", activeItemIndex) : nil;
    if (type === CPLeftMouseDown && self._openEvent !== anEvent && (!activeMenuContainer || !CGRectContainsPoint(objj_msgSend(activeMenuContainer, "globalFrame"), globalLocation)))
    {
        objj_msgSend(self, "completeTracking");
        objj_msgSend(CPApp, "sendEvent:", anEvent);
        return;
    }
    objj_msgSend(self, "_trackAgain");
    if (self._lastGlobalLocation && CGRectContainsPoint(objj_msgSend(activeMenuContainer, "globalFrame"), self._lastGlobalLocation) && !CGRectContainsPoint(objj_msgSend(activeMenuContainer, "globalFrame"), globalLocation))
        objj_msgSend(activeMenu, "_highlightItemAtIndex:", CPNotFound);
    self._lastGlobalLocation = globalLocation;
    if (!objj_msgSend(activeItem, "isEnabled") || objj_msgSend(activeItem, "_isMenuBarButton"))
    {
        activeItemIndex = CPNotFound;
        activeItem = nil;
    }
    var mouseOverMenuView = objj_msgSend(activeItem, "view");
    if (type === CPScrollWheel && !objj_msgSend(activeMenuContainer, "isMenuBar"))
        objj_msgSend(activeMenuContainer, "scrollByDelta:", objj_msgSend(anEvent, "deltaY"));
    if (type === CPPeriodic)
    {
        if (self._scrollingState === _CPMenuManagerScrollingStateUp)
            objj_msgSend(activeMenuContainer, "scrollUp");
        else if (self._scrollingState === _CPMenuManagerScrollingStateDown)
            objj_msgSend(activeMenuContainer, "scrollDown");
    }
    if (mouseOverMenuView)
    {
        if (!self._lastMouseOverMenuView)
            objj_msgSend(activeMenu, "_highlightItemAtIndex:", CPNotFound);
        if (self._lastMouseOverMenuView != mouseOverMenuView)
        {
            objj_msgSend(self._lastMouseOverMenuView, "mouseExited:", anEvent);
            objj_msgSend(mouseOverMenuView, "mouseEntered:", anEvent);
            self._lastMouseOverMenuView = mouseOverMenuView;
        }
        var menuContainerWindow = activeMenuContainer;
        if (!objj_msgSend(menuContainerWindow, "isKindOfClass:", CPWindow))
            menuContainerWindow = objj_msgSend(menuContainerWindow, "window");
        objj_msgSend(menuContainerWindow, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", type, menuLocation, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), menuContainerWindow, nil, 0, objj_msgSend(anEvent, "clickCount"), objj_msgSend(anEvent, "pressure")));
    }
    else
    {
        if (self._lastMouseOverMenuView)
        {
            objj_msgSend(self._lastMouseOverMenuView, "mouseExited:", anEvent);
            self._lastMouseOverMenuView = nil;
        }
        if (activeItemIndex !== CPNotFound)
            objj_msgSend(activeMenu, "_highlightItemAtIndex:", activeItemIndex);
        if (type === CPMouseMoved || type === CPLeftMouseDragged || type === CPLeftMouseDown || type === CPPeriodic)
        {
            if (type === CPLeftMouseDragged)
                self._mouseWasDragged = YES;
            var oldScrollingState = self._scrollingState;
            self._scrollingState = objj_msgSend(activeMenuContainer, "scrollingStateForPoint:", globalLocation);
            if (self._scrollingState !== oldScrollingState)
            {
                if (self._scrollingState === _CPMenuManagerScrollingStateNone)
                    objj_msgSend(CPEvent, "stopPeriodicEvents");
                else if (oldScrollingState === _CPMenuManagerScrollingStateNone)
                    objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.0, 0.04);
            }
        }
        else if (type === CPLeftMouseUp || type === CPRightMouseUp)
        {
            if (self._mouseWasDragged || objj_msgSend(anEvent, "timestamp") - self._startTime > STICKY_TIME_INTERVAL)
            {
                if (self._mouseWasDragged || objj_msgSend(activeMenuContainer, "isMenuBar") || objj_msgSend(activeItem, "action") !== sel_getUid("submenuAction:"))
                {
                    objj_msgSend(trackingMenu, "cancelTracking");
                }
            }
        }
    }
    if (self._previousActiveItem !== activeItem)
    {
        clearTimeout(self._showTimerID);
        self._showTimerID = undefined;
    }
    if (objj_msgSend(activeItem, "hasSubmenu"))
    {
        var activeItemRect = objj_msgSend(activeMenuContainer, "rectForItemAtIndex:", activeItemIndex),
            newMenuOrigin;
        if (objj_msgSend(activeMenuContainer, "isMenuBar"))
            newMenuOrigin = CGPointMake(CGRectGetMinX(activeItemRect), CGRectGetMaxY(activeItemRect));
        else
            newMenuOrigin = CGPointMake(CGRectGetMaxX(activeItemRect), CGRectGetMinY(activeItemRect));
        newMenuOrigin = objj_msgSend(activeMenuContainer, "convertBaseToGlobal:", newMenuOrigin);
        if (self._showTimerID === undefined)
        {
            objj_msgSend(self, "showMenu:fromMenu:atPoint:", nil, activeMenu, CGPointMakeZero());
            if (!objj_msgSend(activeMenuContainer, "isMenuBar"))
            {
                self._showTimerID = setTimeout(function()
                {
                    objj_msgSend(self, "showMenu:fromMenu:atPoint:", objj_msgSend(activeItem, "submenu"), objj_msgSend(activeItem, "menu"), newMenuOrigin);
                }, 250);
            }
            else
                objj_msgSend(self, "showMenu:fromMenu:atPoint:", objj_msgSend(activeItem, "submenu"), objj_msgSend(activeItem, "menu"), newMenuOrigin);
        }
    }
    else
        objj_msgSend(self, "showMenu:fromMenu:atPoint:", nil, activeMenu, CGPointMakeZero());
    self._previousActiveItem = activeItem;
}
,["void","CPEvent"]), new objj_method(sel_getUid("trackMenuBarButtonEvent:"), function $_CPMenuManager__trackMenuBarButtonEvent_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPAppKitDefined)
        return objj_msgSend(self, "completeTracking");
    var globalLocation = objj_msgSend(anEvent, "globalLocation"),
        menu = objj_msgSend(self, "trackingMenu"),
        trackingMenuContainer = objj_msgSend(self, "trackingMenuContainer"),
        menuLocation = objj_msgSend(trackingMenuContainer, "convertGlobalToBase:", globalLocation);
    if (objj_msgSend(trackingMenuContainer, "itemIndexAtPoint:", menuLocation) === self._menuBarButtonItemIndex)
        objj_msgSend(menu, "_highlightItemAtIndex:", self._menuBarButtonItemIndex);
    else
        objj_msgSend(menu, "_highlightItemAtIndex:", CPNotFound);
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMenuBarButtonEvent:"), CPPeriodicMask | CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask | CPAppKitDefinedMask, nil, nil, YES);
    if (type === CPLeftMouseUp)
        objj_msgSend(menu, "cancelTracking");
}
,["void","CPEvent"]), new objj_method(sel_getUid("cancelActiveMenu"), function $_CPMenuManager__cancelActiveMenu(self, _cmd)
{
    if (CPApp._activeMenu)
    {
        objj_msgSend(self, "completeTracking");
        self._menuContainerStack = [];
    }
}
,["void"]), new objj_method(sel_getUid("completeTracking"), function $_CPMenuManager__completeTracking(self, _cmd)
{
    var trackingMenu = objj_msgSend(self, "trackingMenu");
    objj_msgSend(CPEvent, "stopPeriodicEvents");
    objj_msgSend(self, "showMenu:fromMenu:atPoint:", nil, trackingMenu, nil);
    objj_msgSend(trackingMenu, "_menuDidClose");
    if (self._trackingCallback)
        self._trackingCallback(objj_msgSend(self, "trackingMenuContainer"), trackingMenu);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPMenuDidEndTrackingNotification, trackingMenu);
    CPApp._activeMenu = nil;
}
,["void"]), new objj_method(sel_getUid("menuContainerForPoint:"), function $_CPMenuManager__menuContainerForPoint_(self, _cmd, aGlobalLocation)
{
    var count = objj_msgSend(self._menuContainerStack, "count"),
        firstMenuContainer = self._menuContainerStack[0];
    if (count === 1)
        return firstMenuContainer;
    var firstMenuWindowIndex = 0,
        lastMenuWindowIndex = count - 1;
    if (objj_msgSend(firstMenuContainer, "isMenuBar"))
    {
        if (CGRectContainsPoint(objj_msgSend(firstMenuContainer, "globalFrame"), aGlobalLocation))
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
            menuContainerFrame = objj_msgSend(menuContainer, "globalFrame"),
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
}
,["id","float"]), new objj_method(sel_getUid("showMenu:fromMenu:atPoint:"), function $_CPMenuManager__showMenu_fromMenu_atPoint_(self, _cmd, newMenu, baseMenu, aGlobalLocation)
{
    var count = self._menuContainerStack.length,
        index = count;
    objj_msgSend(newMenu, "_menuWillOpen");
    while (index--)
    {
        var menuContainer = self._menuContainerStack[index],
            menu = objj_msgSend(menuContainer, "menu");
        if (menu === baseMenu)
            break;
        if (menu === newMenu)
            return objj_msgSend(newMenu, "_highlightItemAtIndex:", CPNotFound);
        objj_msgSend(menuContainer, "orderOut:", self);
        objj_msgSend(menuContainer, "setMenu:", nil);
        objj_msgSend(_CPMenuWindow, "poolMenuWindow:", menuContainer);
        objj_msgSend(self._menuContainerStack, "removeObjectAtIndex:", index);
        objj_msgSend(menu, "_menuDidClose");
    }
    if (!newMenu)
        return;
    objj_msgSend(newMenu, "_highlightItemAtIndex:", CPNotFound);
    var menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", newMenu, objj_msgSend(self._menuContainerStack[0], "font"));
    objj_msgSend(self._menuContainerStack, "addObject:", menuWindow);
    objj_msgSend(menuWindow, "setConstraintRect:", self._constraintRect);
    if (baseMenu === objj_msgSend(self, "trackingMenu") && objj_msgSend(objj_msgSend(self, "trackingMenuContainer"), "isMenuBar"))
        objj_msgSend(menuWindow, "setBackgroundStyle:", _CPMenuWindowMenuBarBackgroundStyle);
    else
        objj_msgSend(menuWindow, "setBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle);
    objj_msgSend(menuWindow, "setFrameOrigin:", aGlobalLocation);
    objj_msgSend(menuWindow, "orderFront:", self);
}
,["void","CPMenu","CPMenu","CGPoint"]), new objj_method(sel_getUid("interpretKeyEvent:forMenu:"), function $_CPMenuManager__interpretKeyEvent_forMenu_(self, _cmd, anEvent, menu)
{
    var modifierFlags = objj_msgSend(anEvent, "modifierFlags"),
        character = objj_msgSend(anEvent, "charactersIgnoringModifiers"),
        selectorNames = objj_msgSend(CPKeyBinding, "selectorsForKey:modifierFlags:", character, modifierFlags);
    if (selectorNames)
    {
        var iter = objj_msgSend(selectorNames, "objectEnumerator"),
            obj;
        while ((obj = objj_msgSend(iter, "nextObject")) !== nil)
        {
            var aSelector = CPSelectorFromString(obj);
            if (objj_msgSend(self, "respondsToSelector:", aSelector))
                objj_msgSend(self, "performSelector:withObject:", aSelector, menu);
        }
    }
    else if (!(modifierFlags & (CPCommandKeyMask | CPControlKeyMask)))
    {
        if (objj_msgSend(anEvent, "timestamp") - self._startTime > STICKY_TIME_INTERVAL)
            self._keyBuffer = nil;
        if (!self._keyBuffer)
        {
            self._startTime = objj_msgSend(anEvent, "timestamp");
            self._keyBuffer = character;
            objj_msgSend(CPEvent, "stopPeriodicEvents");
            objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.1, 0.1);
        }
        else
            self._keyBuffer += character;
        objj_msgSend(self, "selectNextItemBeginningWith:inMenu:", self._keyBuffer, menu);
        self._lastGlobalLocation = nil;
    }
}
,["void","CPEvent","CPMenu"]), new objj_method(sel_getUid("selectNextItemBeginningWith:inMenu:"), function $_CPMenuManager__selectNextItemBeginningWith_inMenu_(self, _cmd, characters, menu)
{
    var iter = objj_msgSend(objj_msgSend(menu, "itemArray"), "objectEnumerator"),
        obj;
    while ((obj = objj_msgSend(iter, "nextObject")) !== nil)
    {
        if (objj_msgSend(obj, "isHidden") || !objj_msgSend(obj, "isEnabled"))
            continue;
        if (objj_msgSend(objj_msgSend(objj_msgSend(obj, "title"), "commonPrefixWithString:options:", characters, CPCaseInsensitiveSearch), "length") == objj_msgSend(characters, "length"))
        {
            objj_msgSend(menu, "_highlightItemAtIndex:", iter._index);
            break;
        }
    }
    self._startTime = objj_msgSend(CPEvent, "currentTimestamp");
}
,["void","CPString","CPMenu"]), new objj_method(sel_getUid("scrollToBeginningOfDocument:"), function $_CPMenuManager__scrollToBeginningOfDocument_(self, _cmd, menu)
{
    objj_msgSend(menu, "_highlightItemAtIndex:", 0);
}
,["void","CPMenu"]), new objj_method(sel_getUid("scrollToEndOfDocument:"), function $_CPMenuManager__scrollToEndOfDocument_(self, _cmd, menu)
{
    objj_msgSend(menu, "_highlightItemAtIndex:", objj_msgSend(menu, "numberOfItems") - 1);
}
,["void","CPMenu"]), new objj_method(sel_getUid("scrollPageDown:"), function $_CPMenuManager__scrollPageDown_(self, _cmd, menu)
{
    var menuWindow = menu._menuWindow,
        menuClipView = menuWindow._menuClipView,
        bottom = objj_msgSend(menuClipView, "bounds").size.height,
        first = objj_msgSend(menuWindow, "itemIndexAtPoint:", CGPointMake(1, 10)),
        last = objj_msgSend(menuWindow, "itemIndexAtPoint:", CGPointMake(1, bottom)),
        current = objj_msgSend(menu, "indexOfItem:", objj_msgSend(menu, "highlightedItem"));
    if (current == CPNotFound)
    {
        objj_msgSend(menu, "_highlightItemAtIndex:", 0);
        return;
    }
    var next = current + (last - first);
    if (next < objj_msgSend(menu, "numberOfItems"))
        objj_msgSend(menu, "_highlightItemAtIndex:", next);
    else
        objj_msgSend(menu, "_highlightItemAtIndex:", objj_msgSend(menu, "numberOfItems") - 1);
    var item = objj_msgSend(menu, "highlightedItem");
    if (objj_msgSend(item, "isSeparatorItem") || objj_msgSend(item, "isHidden") || !objj_msgSend(item, "isEnabled"))
        objj_msgSend(self, "moveDown:", menu);
}
,["void","CPMenu"]), new objj_method(sel_getUid("scrollPageUp:"), function $_CPMenuManager__scrollPageUp_(self, _cmd, menu)
{
    var menuWindow = menu._menuWindow,
        menuClipView = menuWindow._menuClipView,
        bottom = objj_msgSend(menuClipView, "bounds").size.height,
        first = objj_msgSend(menuWindow, "itemIndexAtPoint:", CGPointMake(1, 10)),
        last = objj_msgSend(menuWindow, "itemIndexAtPoint:", CGPointMake(1, bottom)),
        current = objj_msgSend(menu, "indexOfItem:", objj_msgSend(menu, "highlightedItem"));
    if (current == CPNotFound)
    {
        objj_msgSend(menu, "_highlightItemAtIndex:", 0);
        return;
    }
    var next = current - (last - first);
    if (next < 0)
        objj_msgSend(menu, "_highlightItemAtIndex:", 0);
    else
        objj_msgSend(menu, "_highlightItemAtIndex:", next);
    var item = objj_msgSend(menu, "highlightedItem");
    if (objj_msgSend(item, "isSeparatorItem") || objj_msgSend(item, "isHidden") || !objj_msgSend(item, "isEnabled"))
        objj_msgSend(self, "moveUp:", menu);
}
,["void","CPMenu"]), new objj_method(sel_getUid("moveLeft:"), function $_CPMenuManager__moveLeft_(self, _cmd, menu)
{
    if (objj_msgSend(menu, "supermenu"))
    {
        if (objj_msgSend(menu, "supermenu") == objj_msgSend(CPApp, "mainMenu"))
        {
            objj_msgSend(self, "showMenu:fromMenu:atPoint:", nil, objj_msgSend(menu, "supermenu"), CGPointMakeZero());
            objj_msgSend(self, "moveUp:", objj_msgSend(CPApp, "mainMenu"));
            var activeItem = objj_msgSend(objj_msgSend(CPApp, "mainMenu"), "highlightedItem"),
                menuLocation = CGPointMake(objj_msgSend(objj_msgSend(activeItem, "_menuItemView"), "frameOrigin").x, objj_msgSend(objj_msgSend(activeItem, "_menuItemView"), "frameSize").height);
            objj_msgSend(self, "showMenu:fromMenu:atPoint:", objj_msgSend(activeItem, "submenu"), objj_msgSend(activeItem, "menu"), menuLocation);
        }
        else
            objj_msgSend(self, "showMenu:fromMenu:atPoint:", nil, objj_msgSend(menu, "supermenu"), CGPointMakeZero());
    }
}
,["void","CPMenu"]), new objj_method(sel_getUid("moveRight:"), function $_CPMenuManager__moveRight_(self, _cmd, menu)
{
    var activeItem = objj_msgSend(menu, "highlightedItem");
    if (objj_msgSend(activeItem, "hasSubmenu"))
    {
        if (objj_msgSend(objj_msgSend(activeItem, "submenu"), "numberOfItems"))
        {
            var activeItemIndex = objj_msgSend(menu, "indexOfItem:", activeItem),
                activeMenuContainer = menu._menuWindow,
                activeItemRect = objj_msgSend(activeMenuContainer, "rectForItemAtIndex:", activeItemIndex),
                newMenuOrigin;
            if (objj_msgSend(activeMenuContainer, "isMenuBar"))
                newMenuOrigin = CGPointMake(CGRectGetMinX(activeItemRect), CGRectGetMaxY(activeItemRect));
            else
                newMenuOrigin = CGPointMake(CGRectGetMaxX(activeItemRect), CGRectGetMinY(activeItemRect));
            newMenuOrigin = objj_msgSend(activeMenuContainer, "convertBaseToGlobal:", newMenuOrigin);
            objj_msgSend(self, "showMenu:fromMenu:atPoint:", objj_msgSend(activeItem, "submenu"), objj_msgSend(activeItem, "menu"), newMenuOrigin);
            objj_msgSend(self, "moveDown:", objj_msgSend(activeItem, "submenu"));
        }
    }
    else if (objj_msgSend(self, "trackingMenu") == objj_msgSend(CPApp, "mainMenu"))
    {
        objj_msgSend(self, "showMenu:fromMenu:atPoint:", nil, menu, CGPointMakeZero());
        objj_msgSend(self, "moveDown:", objj_msgSend(CPApp, "mainMenu"));
        var activeItem = objj_msgSend(objj_msgSend(CPApp, "mainMenu"), "highlightedItem"),
            menuLocation = CGPointMake(objj_msgSend(objj_msgSend(activeItem, "_menuItemView"), "frameOrigin").x, objj_msgSend(objj_msgSend(activeItem, "_menuItemView"), "frameSize").height);
        objj_msgSend(self, "showMenu:fromMenu:atPoint:", objj_msgSend(activeItem, "submenu"), objj_msgSend(activeItem, "menu"), menuLocation);
    }
}
,["void","CPMenu"]), new objj_method(sel_getUid("moveDown:"), function $_CPMenuManager__moveDown_(self, _cmd, menu)
{
    var index = menu._highlightedIndex + 1;
    if (index < objj_msgSend(menu, "numberOfItems"))
    {
        objj_msgSend(menu, "_highlightItemAtIndex:", index);
        var item = objj_msgSend(menu, "highlightedItem");
        if (objj_msgSend(item, "isSeparatorItem") || objj_msgSend(item, "isHidden") || !objj_msgSend(item, "isEnabled"))
            objj_msgSend(self, "moveDown:", menu);
    }
    else if (menu == objj_msgSend(CPApp, "mainMenu"))
        objj_msgSend(menu, "_highlightItemAtIndex:", 0);
}
,["void","CPMenu"]), new objj_method(sel_getUid("moveUp:"), function $_CPMenuManager__moveUp_(self, _cmd, menu)
{
    var index = menu._highlightedIndex - 1;
    if (index < 0)
    {
        if (index != CPNotFound || menu == objj_msgSend(CPApp, "mainMenu"))
            objj_msgSend(menu, "_highlightItemAtIndex:", objj_msgSend(menu, "numberOfItems") - 1);
        return;
    }
    objj_msgSend(menu, "_highlightItemAtIndex:", index);
    var item = objj_msgSend(menu, "highlightedItem");
    if (objj_msgSend(item, "isSeparatorItem") || objj_msgSend(item, "isHidden") || !objj_msgSend(item, "isEnabled"))
        objj_msgSend(self, "moveUp:", menu);
}
,["void","CPMenu"]), new objj_method(sel_getUid("insertNewline:"), function $_CPMenuManager__insertNewline_(self, _cmd, menu)
{
    if (objj_msgSend(objj_msgSend(menu, "highlightedItem"), "hasSubmenu"))
        objj_msgSend(self, "moveRight:", menu);
    else
        objj_msgSend(menu, "cancelTracking");
}
,["void","CPMenu"]), new objj_method(sel_getUid("cancelOperation:"), function $_CPMenuManager__cancelOperation_(self, _cmd, menu)
{
    objj_msgSend(menu, "_highlightItemAtIndex:", CPNotFound);
    objj_msgSend(CPEvent, "stopPeriodicEvents");
    objj_msgSend(objj_msgSend(self, "trackingMenu"), "cancelTracking");
}
,["void","CPMenu"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedMenuManager"), function $_CPMenuManager__sharedMenuManager(self, _cmd)
{
    if (!SharedMenuManager)
        SharedMenuManager = objj_msgSend(objj_msgSend(_CPMenuManager, "alloc"), "init");
    return SharedMenuManager;
}
,["_CPMenuManager"])]);
}