@STATIC;1.0;I;25;Foundation/CPDictionary.jI;21;Foundation/CPObject.ji;14;CPKeyBinding.ji;12;CPPlatform.jt;7709;objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPKeyBinding.j", YES);objj_executeFile("CPPlatform.j", YES);var PrimaryPlatformWindow = NULL;
{var the_class = objj_allocateClassPair(CPObject, "CPPlatformWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentRect"), new objj_ivar("_level"), new objj_ivar("_hasShadow"), new objj_ivar("_shadowStyle"), new objj_ivar("_title"), new objj_ivar("_DOMWindow"), new objj_ivar("_DOMBodyElement"), new objj_ivar("_DOMFocusElement"), new objj_ivar("_DOMEventGuard"), new objj_ivar("_DOMScrollingElement"), new objj_ivar("_hideDOMScrollingElementTimeout"), new objj_ivar("_windowLevels"), new objj_ivar("_windowLayers"), new objj_ivar("_mouseIsDown"), new objj_ivar("_mouseDownIsRightClick"), new objj_ivar("_lastMouseEventLocation"), new objj_ivar("_mouseDownWindow"), new objj_ivar("_lastMouseUp"), new objj_ivar("_lastMouseDown"), new objj_ivar("_charCodes"), new objj_ivar("_keyCode"), new objj_ivar("_lastKey"), new objj_ivar("_capsLockActive"), new objj_ivar("_DOMEventMode"), new objj_ivar("_platformPasteboard"), new objj_ivar("_overriddenEventType")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:"), function $CPPlatformWindow__initWithContentRect_(self, _cmd, aRect)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPlatformWindow").super_class }, "init");
    if (self)
    {
        self._contentRect = CGRectMakeCopy(aRect);
        self._windowLevels = [];
        self._windowLayers = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._charCodes = {};
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("init"), function $CPPlatformWindow__init(self, _cmd)
{
    return objj_msgSend(self, "initWithContentRect:", CGRectMake(0.0, 0.0, 400.0, 500.0));
}
,["id"]), new objj_method(sel_getUid("contentRect"), function $CPPlatformWindow__contentRect(self, _cmd)
{
    return CGRectMakeCopy(self._contentRect);
}
,["CGRect"]), new objj_method(sel_getUid("contentBounds"), function $CPPlatformWindow__contentBounds(self, _cmd)
{
    var contentBounds = objj_msgSend(self, "contentRect");
    contentBounds.origin = CGPointMakeZero();
    return contentBounds;
}
,["CGRect"]), new objj_method(sel_getUid("visibleFrame"), function $CPPlatformWindow__visibleFrame(self, _cmd)
{
    var frame = objj_msgSend(self, "contentBounds");
    frame.origin = CGPointMakeZero();
    if (objj_msgSend(CPMenu, "menuBarVisible") && objj_msgSend(CPPlatformWindow, "primaryPlatformWindow") === self)
    {
        var menuBarHeight = objj_msgSend(objj_msgSend(CPApp, "mainMenu"), "menuBarHeight");
        frame.origin.y += menuBarHeight;
        frame.size.height -= menuBarHeight;
    }
    return frame;
}
,["CGRect"]), new objj_method(sel_getUid("usableContentFrame"), function $CPPlatformWindow__usableContentFrame(self, _cmd)
{
    return objj_msgSend(self, "visibleFrame");
}
,["CGRect"]), new objj_method(sel_getUid("setContentRect:"), function $CPPlatformWindow__setContentRect_(self, _cmd, aRect)
{
    if (!aRect || CGRectEqualToRect(self._contentRect, aRect))
        return;
    self._contentRect = CGRectMakeCopy(aRect);
    objj_msgSend(self, "updateNativeContentRect");
}
,["void","CGRect"]), new objj_method(sel_getUid("updateFromNativeContentRect"), function $CPPlatformWindow__updateFromNativeContentRect(self, _cmd)
{
    objj_msgSend(self, "setContentRect:", objj_msgSend(self, "nativeContentRect"));
}
,["void"]), new objj_method(sel_getUid("convertBaseToScreen:"), function $CPPlatformWindow__convertBaseToScreen_(self, _cmd, aPoint)
{
    var contentRect = objj_msgSend(self, "contentRect");
    return CGPointMake(aPoint.x + CGRectGetMinX(contentRect), aPoint.y + CGRectGetMinY(contentRect));
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertScreenToBase:"), function $CPPlatformWindow__convertScreenToBase_(self, _cmd, aPoint)
{
    var contentRect = objj_msgSend(self, "contentRect");
    return CGPointMake(aPoint.x - CGRectGetMinX(contentRect), aPoint.y - CGRectGetMinY(contentRect));
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("isVisible"), function $CPPlatformWindow__isVisible(self, _cmd)
{
    return self._DOMWindow !== NULL;
}
,["BOOL"]), new objj_method(sel_getUid("deminiaturize:"), function $CPPlatformWindow__deminiaturize_(self, _cmd, sender)
{
    if (self._DOMWindow && typeof self._DOMWindow["cpDeminiaturize"] === "function")
        self._DOMWindow.cpDeminiaturize();
}
,["void","id"]), new objj_method(sel_getUid("miniaturize:"), function $CPPlatformWindow__miniaturize_(self, _cmd, sender)
{
    if (self._DOMWindow && typeof self._DOMWindow["cpMiniaturize"] === "function")
        self._DOMWindow.cpMiniaturize();
}
,["void","id"]), new objj_method(sel_getUid("moveWindow:fromLevel:toLevel:"), function $CPPlatformWindow__moveWindow_fromLevel_toLevel_(self, _cmd, aWindow, fromLevel, toLevel)
{
    if (!aWindow._isVisible)
        return;
    var fromLayer = objj_msgSend(self, "layerAtLevel:create:", fromLevel, NO),
        toLayer = objj_msgSend(self, "layerAtLevel:create:", toLevel, YES);
    objj_msgSend(fromLayer, "removeWindow:", aWindow);
    objj_msgSend(toLayer, "insertWindow:atIndex:", aWindow, CPNotFound);
}
,["void","CPWindow","int","int"]), new objj_method(sel_getUid("setLevel:"), function $CPPlatformWindow__setLevel_(self, _cmd, aLevel)
{
    self._level = aLevel;
    if (self._DOMWindow && self._DOMWindow.cpSetLevel)
        self._DOMWindow.cpSetLevel(aLevel);
}
,["void","CPInteger"]), new objj_method(sel_getUid("setHasShadow:"), function $CPPlatformWindow__setHasShadow_(self, _cmd, shouldHaveShadow)
{
    self._hasShadow = shouldHaveShadow;
    if (self._DOMWindow && self._DOMWindow.cpSetHasShadow)
        self._DOMWindow.cpSetHasShadow(shouldHaveShadow);
}
,["void","BOOL"]), new objj_method(sel_getUid("setShadowStyle:"), function $CPPlatformWindow__setShadowStyle_(self, _cmd, aStyle)
{
    self._shadowStyle = aStyle;
    if (self._DOMWindow && self._DOMWindow.cpSetShadowStyle)
        self._shadowStyle.cpSetShadowStyle(aStyle);
}
,["void","int"]), new objj_method(sel_getUid("supportsFullPlatformWindows"), function $CPPlatformWindow__supportsFullPlatformWindows(self, _cmd)
{
    return objj_msgSend(CPPlatform, "isBrowser");
}
,["BOOL"]), new objj_method(sel_getUid("_setTitle:window:"), function $CPPlatformWindow___setTitle_window_(self, _cmd, aTitle, aWindow)
{
    self._title = aTitle;
    if (self._DOMWindow && self._DOMWindow.document && objj_msgSend(aWindow, "isFullPlatformWindow"))
    {
        self._DOMWindow.document.title = self._title;
    }
}
,["void","CPString","CPWindow"]), new objj_method(sel_getUid("title"), function $CPPlatformWindow__title(self, _cmd)
{
    return self._title;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("visiblePlatformWindows"), function $CPPlatformWindow__visiblePlatformWindows(self, _cmd)
{
    return objj_msgSend(CPSet, "set");
}
,["CPSet"]), new objj_method(sel_getUid("supportsMultipleInstances"), function $CPPlatformWindow__supportsMultipleInstances(self, _cmd)
{
    return !CPBrowserIsEngine(CPInternetExplorerBrowserEngine);
}
,["BOOL"]), new objj_method(sel_getUid("primaryPlatformWindow"), function $CPPlatformWindow__primaryPlatformWindow(self, _cmd)
{
    return PrimaryPlatformWindow;
}
,["CPPlatformWindow"]), new objj_method(sel_getUid("setPrimaryPlatformWindow:"), function $CPPlatformWindow__setPrimaryPlatformWindow_(self, _cmd, aPlatformWindow)
{
    PrimaryPlatformWindow = aPlatformWindow;
}
,["void","CPPlatformWindow"])]);
}