@STATIC;1.0;I;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;18;Foundation/CPSet.jI;20;Foundation/CPTimer.ji;25;CPApplication_Constants.ji;17;CPCompatibility.ji;10;CPCursor.ji;18;CPDOMWindowLayer.ji;24;CPDragServer_Constants.ji;9;CPEvent.ji;14;CPPasteboard.ji;12;CPPlatform.ji;22;CPPlatformPasteboard.ji;26;CPPlatformWindow+DOMKeys.ji;18;CPPlatformWindow.ji;8;CPText.ji;20;CPWindow_Constants.jt;54910;objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPRunLoop.j", NO);objj_executeFile("Foundation/CPSet.j", NO);objj_executeFile("Foundation/CPTimer.j", NO);objj_executeFile("CPApplication_Constants.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPCursor.j", YES);objj_executeFile("CPDOMWindowLayer.j", YES);objj_executeFile("CPDragServer_Constants.j", YES);objj_executeFile("CPEvent.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPPlatform.j", YES);objj_executeFile("CPPlatformPasteboard.j", YES);objj_executeFile("CPPlatformWindow+DOMKeys.j", YES);objj_executeFile("CPPlatformWindow.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPWindow_Constants.j", YES);var PlatformWindows = objj_msgSend(CPSet, "set");
var CPDOMEventGetClickCount,
    StopDOMEventPropagation,
    StopContextMenuDOMEventPropagation;
var KeyCodesToPrevent = {},
    CharacterKeysToPrevent = {},
    KeyCodesToAllow = {},
    MozKeyCodeToKeyCodeMap = {61: 187, 59: 186},
    KeyCodesToUnicodeMap = {};
KeyCodesToPrevent[CPKeyCodes.A] = YES;
KeyCodesToAllow[CPKeyCodes.F1] = YES;
KeyCodesToAllow[CPKeyCodes.F2] = YES;
KeyCodesToAllow[CPKeyCodes.F3] = YES;
KeyCodesToAllow[CPKeyCodes.F4] = YES;
KeyCodesToAllow[CPKeyCodes.F5] = YES;
KeyCodesToAllow[CPKeyCodes.F6] = YES;
KeyCodesToAllow[CPKeyCodes.F7] = YES;
KeyCodesToAllow[CPKeyCodes.F8] = YES;
KeyCodesToAllow[CPKeyCodes.F9] = YES;
KeyCodesToAllow[CPKeyCodes.F10] = YES;
KeyCodesToAllow[CPKeyCodes.F11] = YES;
KeyCodesToAllow[CPKeyCodes.F12] = YES;
KeyCodesToUnicodeMap[CPKeyCodes.BACKSPACE] = CPDeleteCharacter;
KeyCodesToUnicodeMap[CPKeyCodes.DELETE] = CPDeleteFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.TAB] = CPTabCharacter;
KeyCodesToUnicodeMap[CPKeyCodes.ENTER] = CPCarriageReturnCharacter;
KeyCodesToUnicodeMap[CPKeyCodes.ESC] = CPEscapeFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.PAGE_UP] = CPPageUpFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.PAGE_DOWN] = CPPageDownFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.LEFT] = CPLeftArrowFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.UP] = CPUpArrowFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.RIGHT] = CPRightArrowFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.DOWN] = CPDownArrowFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.HOME] = CPHomeFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.END] = CPEndFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.SEMICOLON] = ";";
KeyCodesToUnicodeMap[CPKeyCodes.DASH] = "-";
KeyCodesToUnicodeMap[CPKeyCodes.EQUALS] = "=";
KeyCodesToUnicodeMap[CPKeyCodes.COMMA] = ",";
KeyCodesToUnicodeMap[CPKeyCodes.PERIOD] = ".";
KeyCodesToUnicodeMap[CPKeyCodes.SLASH] = "/";
KeyCodesToUnicodeMap[CPKeyCodes.APOSTROPHE] = "`";
KeyCodesToUnicodeMap[CPKeyCodes.SINGLE_QUOTE] = "'";
KeyCodesToUnicodeMap[CPKeyCodes.OPEN_SQUARE_BRACKET] = "[";
KeyCodesToUnicodeMap[CPKeyCodes.BACKSLASH] = "\\";
KeyCodesToUnicodeMap[CPKeyCodes.CLOSE_SQUARE_BRACKET] = "]";
var ModifierKeyCodes = [CPKeyCodes.META, CPKeyCodes.WEBKIT_RIGHT_META, CPKeyCodes.MAC_FF_META, CPKeyCodes.CTRL, CPKeyCodes.ALT, CPKeyCodes.SHIFT],
    supportsNativeDragAndDrop = objj_msgSend(CPPlatform, "supportsDragAndDrop");
var resizeTimer = nil;
{
var the_class = objj_getClass("CPPlatformWindow")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPlatformWindow\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_init"), function $CPPlatformWindow___init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPlatformWindow").super_class }, "init");
    if (self)
    {
        self._DOMWindow = window;
        self._contentRect = CGRectMakeZero();
        self._windowLevels = [];
        self._windowLayers = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._platformPasteboard = objj_msgSend(CPPlatformPasteboard, "new");
        objj_msgSend(self, "registerDOMWindow");
        objj_msgSend(self, "updateFromNativeContentRect");
        self._charCodes = {};
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("nativeContentRect"), function $CPPlatformWindow__nativeContentRect(self, _cmd)
{
    if (!self._DOMWindow)
        return objj_msgSend(self, "contentRect");
    if (self._DOMWindow.cpFrame)
        return self._DOMWindow.cpFrame();
    var contentRect = CGRectMakeZero();
    if (window.screenTop)
        contentRect.origin = CGPointMake(self._DOMWindow.screenLeft, self._DOMWindow.screenTop);
    else if (window.screenX)
        contentRect.origin = CGPointMake(self._DOMWindow.screenX, self._DOMWindow.screenY);
    if (self._DOMWindow.innerWidth)
        contentRect.size = CGSizeMake(self._DOMWindow.innerWidth, self._DOMWindow.innerHeight);
    else if (document.documentElement && document.documentElement.clientWidth)
        contentRect.size = CGSizeMake(self._DOMWindow.document.documentElement.clientWidth, self._DOMWindow.document.documentElement.clientHeight);
    else
        contentRect.size = CGSizeMake(self._DOMWindow.document.body.clientWidth, self._DOMWindow.document.body.clientHeight);
    return contentRect;
}
,["CGRect"]), new objj_method(sel_getUid("updateNativeContentRect"), function $CPPlatformWindow__updateNativeContentRect(self, _cmd)
{
    if (!self._DOMWindow)
        return;
    if (typeof self._DOMWindow["cpSetFrame"] === "function")
        return self._DOMWindow.cpSetFrame(objj_msgSend(self, "contentRect"));
    var origin = objj_msgSend(self, "contentRect").origin,
        nativeOrigin = objj_msgSend(self, "nativeContentRect").origin;
    if (origin.x !== nativeOrigin.x || origin.y !== nativeOrigin.y)
    {
        self._DOMWindow.moveBy(origin.x - nativeOrigin.x, origin.y - nativeOrigin.y);
    }
    var size = objj_msgSend(self, "contentRect").size,
        nativeSize = objj_msgSend(self, "nativeContentRect").size;
    if (size.width !== nativeSize.width || size.height !== nativeSize.height)
    {
        self._DOMWindow.resizeBy(size.width - nativeSize.width, size.height - nativeSize.height);
    }
}
,["void"]), new objj_method(sel_getUid("orderBack:"), function $CPPlatformWindow__orderBack_(self, _cmd, aWindow)
{
    if (self._DOMWindow)
        self._DOMWindow.blur();
}
,["void","CPWindow"]), new objj_method(sel_getUid("createDOMElements"), function $CPPlatformWindow__createDOMElements(self, _cmd)
{
    var theDocument = self._DOMWindow.document;
    self._DOMFocusElement = theDocument.createElement("input");
    self._DOMFocusElement.style.position = "absolute";
    self._DOMFocusElement.style.zIndex = "-1000";
    self._DOMFocusElement.style.opacity = "0";
    self._DOMFocusElement.style.filter = "alpha(opacity=0)";
    self._DOMFocusElement.className = "cpdontremove";
    self._DOMBodyElement.appendChild(self._DOMFocusElement);
    self._DOMEventGuard = theDocument.createElement("div");
    self._DOMEventGuard.style.position = "absolute";
    self._DOMEventGuard.style.top = "0px";
    self._DOMEventGuard.style.left = "0px";
    self._DOMEventGuard.style.width = "100%";
    self._DOMEventGuard.style.height = "100%";
    self._DOMEventGuard.style.zIndex = "999";
    self._DOMEventGuard.style.display = "none";
    self._DOMEventGuard.className = "cpdontremove";
    self._DOMBodyElement.appendChild(self._DOMEventGuard);
    self._DOMScrollingElement = theDocument.createElement("div");
    self._DOMScrollingElement.style.position = "absolute";
    self._DOMScrollingElement.style.visibility = "hidden";
    self._DOMScrollingElement.style.zIndex = "999";
    self._DOMScrollingElement.style.height = "60px";
    self._DOMScrollingElement.style.width = "60px";
    self._DOMScrollingElement.style.overflow = "scroll";
    self._DOMScrollingElement.style.opacity = "0";
    self._DOMScrollingElement.style.filter = "alpha(opacity=0)";
    self._DOMScrollingElement.className = "cpdontremove";
    self._DOMBodyElement.appendChild(self._DOMScrollingElement);
    var _DOMInnerScrollingElement = theDocument.createElement("div");
    _DOMInnerScrollingElement.style.width = "400px";
    _DOMInnerScrollingElement.style.height = "400px";
    self._DOMScrollingElement.appendChild(_DOMInnerScrollingElement);
    self._DOMScrollingElement.scrollTop = 150;
    self._DOMScrollingElement.scrollLeft = 150;
}
,["void"]), new objj_method(sel_getUid("registerDOMWindow"), function $CPPlatformWindow__registerDOMWindow(self, _cmd)
{
    var theDocument = self._DOMWindow.document;
    self._DOMBodyElement = theDocument.getElementById("cappuccino-body") || theDocument.body;
    if (supportsNativeDragAndDrop)
        self._DOMBodyElement.style["-khtml-user-select"] = "none";
    self._DOMBodyElement.webkitTouchCallout = "none";
    objj_msgSend(self, "createDOMElements");
    objj_msgSend(self, "_addLayers");
    objj_msgSend(self._platformPasteboard, "setDOMWindow:", self._DOMWindow);
    var theClass = objj_msgSend(self, "class"),
        dragEventImplementation = class_getMethodImplementation(theClass, sel_getUid("dragEvent:")),
        dragEventCallback = function(anEvent)
    {
        dragEventImplementation(self, nil, anEvent);
    },
        resizeEventSelector = sel_getUid("resizeEvent:"),
        resizeEventImplementation = class_getMethodImplementation(theClass, resizeEventSelector),
        resizeEventCallback = function(anEvent)
    {
        resizeEventImplementation(self, nil, anEvent);
    },
        keyEventSelector = sel_getUid("keyEvent:"),
        keyEventImplementation = class_getMethodImplementation(theClass, keyEventSelector),
        keyEventCallback = function(anEvent)
    {
        return keyEventImplementation(self, nil, anEvent);
    },
        mouseEventSelector = sel_getUid("mouseEvent:"),
        mouseEventImplementation = class_getMethodImplementation(theClass, mouseEventSelector),
        mouseEventCallback = function(anEvent)
    {
        mouseEventImplementation(self, nil, anEvent);
    },
        contextMenuEventSelector = sel_getUid("contextMenuEvent:"),
        contextMenuEventImplementation = class_getMethodImplementation(theClass, contextMenuEventSelector),
        contextMenuEventCallback = function(anEvent)
    {
        return contextMenuEventImplementation(self, nil, anEvent);
    },
        scrollEventSelector = sel_getUid("scrollEvent:"),
        scrollEventImplementation = class_getMethodImplementation(theClass, scrollEventSelector),
        scrollEventCallback = function(anEvent)
    {
        scrollEventImplementation(self, nil, anEvent);
    },
        touchEventSelector = sel_getUid("touchEvent:"),
        touchEventImplementation = class_getMethodImplementation(theClass, touchEventSelector),
        touchEventCallback = function(anEvent)
    {
        touchEventImplementation(self, nil, anEvent);
    };
    if (theDocument.addEventListener)
    {
        if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        {
            theDocument.addEventListener("dragstart", dragEventCallback, NO);
            theDocument.addEventListener("drag", dragEventCallback, NO);
            theDocument.addEventListener("dragend", dragEventCallback, NO);
            theDocument.addEventListener("dragover", dragEventCallback, NO);
            theDocument.addEventListener("dragleave", dragEventCallback, NO);
            theDocument.addEventListener("drop", dragEventCallback, NO);
        }
        theDocument.addEventListener("mouseup", mouseEventCallback, NO);
        theDocument.addEventListener("mousedown", mouseEventCallback, NO);
        theDocument.addEventListener("mousemove", mouseEventCallback, NO);
        theDocument.addEventListener("contextmenu", contextMenuEventCallback, NO);
        theDocument.addEventListener("keyup", keyEventCallback, NO);
        theDocument.addEventListener("keydown", keyEventCallback, NO);
        theDocument.addEventListener("keypress", keyEventCallback, NO);
        theDocument.addEventListener("touchstart", touchEventCallback, NO);
        theDocument.addEventListener("touchend", touchEventCallback, NO);
        theDocument.addEventListener("touchmove", touchEventCallback, NO);
        theDocument.addEventListener("touchcancel", touchEventCallback, NO);
        self._DOMWindow.addEventListener("DOMMouseScroll", scrollEventCallback, NO);
        self._DOMWindow.addEventListener("wheel", scrollEventCallback, NO);
        self._DOMWindow.addEventListener("mousewheel", scrollEventCallback, NO);
        self._DOMWindow.addEventListener("resize", resizeEventCallback, NO);
        self._DOMWindow.addEventListener("unload", function()
        {
            objj_msgSend(self, "updateFromNativeContentRect");
            objj_msgSend(self, "_removeLayers");
            theDocument.removeEventListener("mouseup", mouseEventCallback, NO);
            theDocument.removeEventListener("mousedown", mouseEventCallback, NO);
            theDocument.removeEventListener("mousemove", mouseEventCallback, NO);
            theDocument.removeEventListener("contextmenu", contextMenuEventCallback, NO);
            theDocument.removeEventListener("keyup", keyEventCallback, NO);
            theDocument.removeEventListener("keydown", keyEventCallback, NO);
            theDocument.removeEventListener("keypress", keyEventCallback, NO);
            theDocument.removeEventListener("touchstart", touchEventCallback, NO);
            theDocument.removeEventListener("touchend", touchEventCallback, NO);
            theDocument.removeEventListener("touchmove", touchEventCallback, NO);
            self._DOMWindow.removeEventListener("resize", resizeEventCallback, NO);
            self._DOMWindow.removeEventListener("DOMMouseScroll", scrollEventCallback, NO);
            self._DOMWindow.removeEventListener("wheel", scrollEventCallback, NO);
            self._DOMWindow.removeEventListener("mousewheel", scrollEventCallback, NO);
            objj_msgSend(PlatformWindows, "removeObject:", self);
            objj_msgSend(self._platformPasteboard, "setDOMWindow:", nil);
            self._DOMWindow = nil;
        }, NO);
    }
    else
    {
        theDocument.attachEvent("onmouseup", mouseEventCallback);
        theDocument.attachEvent("onmousedown", mouseEventCallback);
        theDocument.attachEvent("onmousemove", mouseEventCallback);
        theDocument.attachEvent("ondblclick", mouseEventCallback);
        theDocument.attachEvent("oncontextmenu", contextMenuEventCallback);
        theDocument.attachEvent("onkeyup", keyEventCallback);
        theDocument.attachEvent("onkeydown", keyEventCallback);
        theDocument.attachEvent("onkeypress", keyEventCallback);
        self._DOMWindow.attachEvent("onresize", resizeEventCallback);
        self._DOMWindow.onmousewheel = scrollEventCallback;
        theDocument.onmousewheel = scrollEventCallback;
        self._DOMBodyElement.ondrag = function()
        {
            return NO;
        };
        self._DOMBodyElement.onselectstart = function()
        {
            return self._DOMWindow.event.srcElement === self._platformPasteboard._DOMPasteboardElement;
        };
        self._DOMWindow.attachEvent("onunload", function()
        {
            objj_msgSend(self, "updateFromNativeContentRect");
            objj_msgSend(self, "_removeLayers");
            theDocument.detachEvent("onmouseup", mouseEventCallback);
            theDocument.detachEvent("onmousedown", mouseEventCallback);
            theDocument.detachEvent("onmousemove", mouseEventCallback);
            theDocument.detachEvent("ondblclick", mouseEventCallback);
            theDocument.detachEvent("oncontextmenu", contextMenuEventCallback);
            theDocument.detachEvent("onkeyup", keyEventCallback);
            theDocument.detachEvent("onkeydown", keyEventCallback);
            theDocument.detachEvent("onkeypress", keyEventCallback);
            self._DOMWindow.detachEvent("onresize", resizeEventCallback);
            self._DOMWindow.onmousewheel = NULL;
            theDocument.onmousewheel = NULL;
            self._DOMBodyElement.ondrag = NULL;
            self._DOMBodyElement.onselectstart = NULL;
            objj_msgSend(PlatformWindows, "removeObject:", self);
            objj_msgSend(self._platformPasteboard, "setDOMWindow:", nil);
            self._DOMWindow = nil;
        }, NO);
    }
}
,["void"]), new objj_method(sel_getUid("orderFront:"), function $CPPlatformWindow__orderFront_(self, _cmd, aWindow)
{
    if (objj_msgSend(aWindow, "parentWindow"))
        return;
    if (self._DOMWindow)
        return self._DOMWindow.focus();
    self._DOMWindow = window.open("about:blank", "_blank", "menubar=no,location=no,resizable=yes,scrollbars=no,status=no,left=" + CGRectGetMinX(self._contentRect) + ",top=" + CGRectGetMinY(self._contentRect) + ",width=" + CGRectGetWidth(self._contentRect) + ",height=" + CGRectGetHeight(self._contentRect));
    objj_msgSend(PlatformWindows, "addObject:", self);
    self._DOMWindow.document.write('<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"></head><body style="background-color:transparent;"></body></html>');
    self._DOMWindow.document.close();
    if (self != objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"))
        self._DOMWindow.document.title = self._title;
    if (!objj_msgSend(CPPlatform, "isBrowser"))
    {
        self._DOMWindow.cpWindowNumber = objj_msgSend(self._only, "windowNumber");
        self._DOMWindow.cpSetFrame(self._contentRect);
        self._DOMWindow.cpSetLevel(self._level);
        self._DOMWindow.cpSetHasShadow(self._hasShadow);
        self._DOMWindow.cpSetShadowStyle(self._shadowStyle);
    }
    objj_msgSend(self, "registerDOMWindow");
    self._DOMBodyElement.style.cursor = objj_msgSend(objj_msgSend(CPCursor, "currentCursor"), "_cssString");
}
,["void","CPWindow"]), new objj_method(sel_getUid("orderOut:"), function $CPPlatformWindow__orderOut_(self, _cmd, aWindow)
{
    if (!self._DOMWindow)
        return;
    self._DOMWindow.close();
}
,["void","CPWindow"]), new objj_method(sel_getUid("dragEvent:"), function $CPPlatformWindow__dragEvent_(self, _cmd, aDOMEvent)
{
    var type = aDOMEvent.type,
        dragServer = objj_msgSend(CPDragServer, "sharedDragServer"),
        location = CGPointMake(aDOMEvent.clientX, aDOMEvent.clientY),
        pasteboard = objj_msgSend(_CPDOMDataTransferPasteboard, "DOMDataTransferPasteboard");
    objj_msgSend(pasteboard, "_setDataTransfer:", aDOMEvent.dataTransfer);
    if (aDOMEvent.type === "dragstart")
    {
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        objj_msgSend(pasteboard, "_setPasteboard:", objj_msgSend(dragServer, "draggingPasteboard"));
        var draggedWindow = objj_msgSend(dragServer, "draggedWindow"),
            draggedWindowFrame = objj_msgSend(draggedWindow, "frame"),
            DOMDragElement = draggedWindow._DOMElement;
        DOMDragElement.style.left = -CGRectGetWidth(draggedWindowFrame) + "px";
        DOMDragElement.style.top = -CGRectGetHeight(draggedWindowFrame) + "px";
        var parentNode = DOMDragElement.parentNode;
        if (parentNode)
            parentNode.removeChild(DOMDragElement);
        self._DOMBodyElement.appendChild(DOMDragElement);
        var draggingOffset = objj_msgSend(dragServer, "draggingOffset");
        aDOMEvent.dataTransfer.setDragImage(DOMDragElement, draggingOffset.width, draggingOffset.height);
        aDOMEvent.dataTransfer.effectAllowed = "all";
        objj_msgSend(dragServer, "draggingStartedInPlatformWindow:globalLocation:", self, objj_msgSend(CPPlatform, "isBrowser") ? location : CGPointMake(aDOMEvent.screenX, aDOMEvent.screenY));
    }
    else if (type === "drag")
    {
        var y = aDOMEvent.screenY;
        if (CPFeatureIsCompatible(CPHTML5DragAndDropSourceYOffBy1))
            y -= 1;
        objj_msgSend(dragServer, "draggingSourceUpdatedWithGlobalLocation:", objj_msgSend(CPPlatform, "isBrowser") ? location : CGPointMake(aDOMEvent.screenX, y));
    }
    else if (type === "dragover" || type === "dragleave")
    {
        if (aDOMEvent.preventDefault)
            aDOMEvent.preventDefault();
        var dropEffect = "none",
            dragOperation = objj_msgSend(dragServer, "draggingUpdatedInPlatformWindow:location:", self, location);
        if (dragOperation === CPDragOperationMove || dragOperation === CPDragOperationGeneric || dragOperation === CPDragOperationPrivate)
            dropEffect = "move";
        else if (dragOperation === CPDragOperationCopy)
            dropEffect = "copy";
        else if (dragOperation === CPDragOperationLink)
            dropEffect = "link";
        aDOMEvent.dataTransfer.dropEffect = dropEffect;
    }
    else if (type === "dragend")
    {
        var dropEffect = aDOMEvent.dataTransfer.dropEffect;
        if (dropEffect === "move")
            dragOperation = CPDragOperationMove;
        else if (dropEffect === "copy")
            dragOperation = CPDragOperationCopy;
        else if (dropEffect === "link")
            dragOperation = CPDragOperationLink;
        else
            dragOperation = CPDragOperationNone;
        objj_msgSend(dragServer, "draggingEndedInPlatformWindow:globalLocation:operation:", self, objj_msgSend(CPPlatform, "isBrowser") ? location : CGPointMake(aDOMEvent.screenX, aDOMEvent.screenY), dragOperation);
    }
    else
    {
        objj_msgSend(dragServer, "performDragOperationInPlatformWindow:", self);
        if (aDOMEvent.preventDefault)
            aDOMEvent.preventDefault();
        if (aDOMEvent.stopPropagation)
            aDOMEvent.stopPropagation();
    }
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
,["void","DOMEvent"]), new objj_method(sel_getUid("keyEvent:"), function $CPPlatformWindow__keyEvent_(self, _cmd, aDOMEvent)
{
    var event,
        location = self._lastMouseEventLocation || CGPointMakeZero(),
        timestamp = objj_msgSend(CPEvent, "currentTimestamp"),
        sourceElement = aDOMEvent.target || aDOMEvent.srcElement,
        windowNumber = objj_msgSend(objj_msgSend(CPApp, "keyWindow"), "windowNumber"),
        modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) | (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) | (aDOMEvent.altKey ? CPAlternateKeyMask : 0) | (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
    StopDOMEventPropagation = YES;
    if (!(CharacterKeysToPrevent[(String.fromCharCode(aDOMEvent.keyCode || aDOMEvent.charCode)).toLowerCase()] || KeyCodesToPrevent[aDOMEvent.keyCode]))
    {
        if (modifierFlags & (CPControlKeyMask | CPCommandKeyMask) || KeyCodesToAllow[aDOMEvent.keyCode])
            StopDOMEventPropagation = NO;
    }
    var overrideCharacters = nil,
        charactersIgnoringModifiers = "";
    switch(aDOMEvent.type) {
    case "keydown":
        if (aDOMEvent.keyCode in MozKeyCodeToKeyCodeMap)
            self._keyCode = MozKeyCodeToKeyCodeMap[aDOMEvent.keyCode];
        else
            self._keyCode = aDOMEvent.keyCode;
        var characters;
        if (aDOMEvent.which === 0 || aDOMEvent.charCode === 0 || aDOMEvent.which === undefined && aDOMEvent.charCode === undefined)
            characters = KeyCodesToUnicodeMap[self._keyCode];
        if (!characters)
            characters = (String.fromCharCode(self._keyCode)).toLowerCase();
        overrideCharacters = modifierFlags & CPShiftKeyMask || self._capsLockActive ? characters.toUpperCase() : characters;
        if (self._keyCode === CPKeyCodes.CAPS_LOCK)
            self._capsLockActive = YES;
        if (objj_msgSend(ModifierKeyCodes, "containsObject:", self._keyCode))
        {
            event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPFlagsChanged, location, modifierFlags, timestamp, windowNumber, nil, nil, nil, NO, self._keyCode);
            break;
        }
        else if (modifierFlags & (CPControlKeyMask | CPCommandKeyMask))
        {
        }
        else if (CPKeyCodes.firesKeyPressEvent(self._keyCode, self._lastKey, aDOMEvent.shiftKey, aDOMEvent.ctrlKey, aDOMEvent.altKey))
        {
            StopDOMEventPropagation = NO;
            break;
        }
        else
        {
        }
    case "keypress":
        if (aDOMEvent.type === "keypress" && modifierFlags & (CPControlKeyMask | CPCommandKeyMask))
            break;
        var keyCode = self._keyCode,
            charCode = aDOMEvent.keyCode || aDOMEvent.charCode,
            isARepeat = self._charCodes[keyCode] != nil;
        self._lastKey = keyCode;
        self._charCodes[keyCode] = charCode;
        var characters = overrideCharacters;
        if (!characters && (aDOMEvent.which === 0 || aDOMEvent.charCode === 0))
            characters = KeyCodesToUnicodeMap[charCode];
        if (!characters)
            characters = String.fromCharCode(charCode);
        charactersIgnoringModifiers = characters.toLowerCase();
        if (!overrideCharacters && modifierFlags & CPCommandKeyMask && (modifierFlags & CPShiftKeyMask || self._capsLockActive))
            characters = characters.toUpperCase();
        event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyDown, location, modifierFlags, timestamp, windowNumber, nil, characters, charactersIgnoringModifiers, isARepeat, charCode);
        break;
    case "keyup":
        var keyCode = aDOMEvent.keyCode,
            charCode = self._charCodes[keyCode];
        self._keyCode = -1;
        self._lastKey = -1;
        self._charCodes[keyCode] = nil;
        if (keyCode === CPKeyCodes.CAPS_LOCK)
            self._capsLockActive = NO;
        if (objj_msgSend(ModifierKeyCodes, "containsObject:", keyCode))
        {
            event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPFlagsChanged, location, modifierFlags, timestamp, windowNumber, nil, nil, nil, NO, self._keyCode);
            break;
        }
        var characters = KeyCodesToUnicodeMap[charCode] || String.fromCharCode(charCode);
        charactersIgnoringModifiers = characters.toLowerCase();
        if (!(modifierFlags & CPShiftKeyMask) && modifierFlags & CPCommandKeyMask && !self._capsLockActive)
            characters = charactersIgnoringModifiers;
        event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyUp, location, modifierFlags, timestamp, windowNumber, nil, characters, charactersIgnoringModifiers, NO, keyCode);
        break;
    }
    if (event)
        event._DOMEvent = aDOMEvent;
    objj_msgSend(self._platformPasteboard, "windowMaySendKeyEvent:", event);
    if (event && !objj_msgSend(self._platformPasteboard, "windowShouldSuppressKeyEvent"))
    {
        objj_msgSend(CPApp, "sendEvent:", event);
        objj_msgSend(self._platformPasteboard, "windowDidSendKeyEvent:", event);
    }
    var didStop = NO;
    if (objj_msgSend(self._platformPasteboard, "windowShouldStopPropagation") || StopDOMEventPropagation && !objj_msgSend(self._platformPasteboard, "windowShouldNotStopPropagation"))
    {
        didStop = YES;
        _CPDOMEventStop(aDOMEvent, self);
    }
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    return !didStop;
}
,["void","DOMEvent"]), new objj_method(sel_getUid("scrollEvent:"), function $CPPlatformWindow__scrollEvent_(self, _cmd, aDOMEvent)
{
    if (self._hideDOMScrollingElementTimeout)
    {
        clearTimeout(self._hideDOMScrollingElementTimeout);
        self._hideDOMScrollingElementTimeout = nil;
    }
    if (!aDOMEvent)
        aDOMEvent = window.event;
    var location = nil;
    if (CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15))
    {
        var x = aDOMEvent._offsetX || 0.0,
            y = aDOMEvent._offsetY || 0.0,
            element = aDOMEvent.target;
        while (element.nodeType !== 1)
            element = element.parentNode;
        if (element.offsetParent)
        {
            do
            {
                x += element.offsetLeft;
                y += element.offsetTop;
            }
            while (element = element.offsetParent);
        }
        location = CGPointMake(x + (aDOMEvent.clientX - 8) / 15, y + (aDOMEvent.clientY - 8) / 15);
    }
    else if (aDOMEvent._overrideLocation)
        location = aDOMEvent._overrideLocation;
    else
        location = CGPointMake(aDOMEvent.clientX, aDOMEvent.clientY);
    var deltaX = 0.0,
        deltaY = 0.0,
        windowNumber = 0,
        timestamp = objj_msgSend(CPEvent, "currentTimestamp"),
        modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) | (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) | (aDOMEvent.altKey ? CPAlternateKeyMask : 0) | (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
    self._DOMScrollingElement.style.visibility = "visible";
    self._DOMScrollingElement.style.top = location.y - 15 + "px";
    self._DOMScrollingElement.style.left = location.x - 15 + "px";
    StopDOMEventPropagation = NO;
    var theWindow = objj_msgSend(self, "hitTest:", location);
    if (!theWindow)
        return;
    var windowNumber = objj_msgSend(theWindow, "windowNumber");
    location = objj_msgSend(theWindow, "convertBridgeToBase:", location);
    var event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPScrollWheel, location, modifierFlags, timestamp, windowNumber, nil, -1, 1, 0);
    event._DOMEvent = aDOMEvent;
    setTimeout(function()
    {
        var deltaX = self._DOMScrollingElement.scrollLeft - 150,
            deltaY = self._DOMScrollingElement.scrollTop - 150 || (aDOMEvent.deltaY === undefined ? 0 : aDOMEvent.deltaY);
        if (deltaX || deltaY)
        {
            event._deltaX = deltaX;
            event._deltaY = deltaY;
            objj_msgSend(CPApp, "sendEvent:", event);
        }
        self._DOMScrollingElement.scrollLeft = 150;
        self._DOMScrollingElement.scrollTop = 150;
    }, 0);
    self._hideDOMScrollingElementTimeout = setTimeout(function()
    {
        self._DOMScrollingElement.style.visibility = "hidden";
    }, 300);
}
,["void","DOMEvent"]), new objj_method(sel_getUid("resizeEvent:"), function $CPPlatformWindow__resizeEvent_(self, _cmd, aDOMEvent)
{
    objj_msgSend(resizeTimer, "invalidate");
    resizeTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.2, self, sel_getUid("_actualResizeEvent"), nil, NO);
}
,["void","DOMEvent"]), new objj_method(sel_getUid("_actualResizeEvent"), function $CPPlatformWindow___actualResizeEvent(self, _cmd)
{
    resizeTimer = nil;
    if (objj_msgSend(CPPlatform, "isBrowser"))
        objj_msgSend(CPApp._activeMenu, "cancelTracking");
    var oldSize = objj_msgSend(self, "contentRect").size;
    objj_msgSend(self, "updateFromNativeContentRect");
    var levels = self._windowLevels,
        layers = self._windowLayers,
        levelCount = levels.length;
    while (levelCount--)
    {
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount--)
            objj_msgSend(windows[windowCount], "resizeWithOldPlatformWindowSize:", oldSize);
    }
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPApplicationDidChangeScreenParametersNotification, CPApp, nil);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
,["void"]), new objj_method(sel_getUid("touchEvent:"), function $CPPlatformWindow__touchEvent_(self, _cmd, aDOMEvent)
{
    if (aDOMEvent.touches && (aDOMEvent.touches.length == 1 || aDOMEvent.touches.length == 0 && aDOMEvent.changedTouches.length == 1))
    {
        var newEvent = {};
        switch(aDOMEvent.type) {
        case CPDOMEventTouchStart:
            newEvent.type = CPDOMEventMouseDown;
            break;
        case CPDOMEventTouchEnd:
            newEvent.type = CPDOMEventMouseUp;
            break;
        case CPDOMEventTouchMove:
            newEvent.type = CPDOMEventMouseMoved;
            break;
        case CPDOMEventTouchCancel:
            newEvent.type = CPDOMEventMouseUp;
            break;
        }
        var touch = aDOMEvent.touches.length ? aDOMEvent.touches[0] : aDOMEvent.changedTouches[0];
        newEvent.clientX = touch.clientX;
        newEvent.clientY = touch.clientY;
        newEvent.timestamp = objj_msgSend(CPEvent, "currentTimestamp");
        newEvent.target = aDOMEvent.target;
        newEvent.shiftKey = newEvent.ctrlKey = newEvent.altKey = newEvent.metaKey = false;
        newEvent.preventDefault = function()
        {
            if (aDOMEvent.preventDefault)
                aDOMEvent.preventDefault();
        };
        newEvent.stopPropagation = function()
        {
            if (aDOMEvent.stopPropagation)
                aDOMEvent.stopPropagation();
        };
        objj_msgSend(self, "mouseEvent:", newEvent);
        return;
    }
    else
    {
        if (aDOMEvent.preventDefault)
            aDOMEvent.preventDefault();
        if (aDOMEvent.stopPropagation)
            aDOMEvent.stopPropagation();
    }
}
,["void","DOMEvent"]), new objj_method(sel_getUid("mouseEvent:"), function $CPPlatformWindow__mouseEvent_(self, _cmd, aDOMEvent)
{
    var type = self._overriddenEventType || aDOMEvent.type;
    if (type === "dblclick")
    {
        self._overriddenEventType = CPDOMEventMouseDown;
        objj_msgSend(self, "mouseEvent:", aDOMEvent);
        self._overriddenEventType = CPDOMEventMouseUp;
        objj_msgSend(self, "mouseEvent:", aDOMEvent);
        self._overriddenEventType = nil;
        return;
    }
    var event,
        location = CGPointMake(aDOMEvent.clientX, aDOMEvent.clientY),
        timestamp = objj_msgSend(CPEvent, "currentTimestamp"),
        sourceElement = aDOMEvent.target || aDOMEvent.srcElement,
        windowNumber = 0,
        modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) | (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) | (aDOMEvent.altKey ? CPAlternateKeyMask : 0) | (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
    StopDOMEventPropagation = YES;
    if (self._mouseDownWindow)
        windowNumber = objj_msgSend(self._mouseDownWindow, "windowNumber");
    else
    {
        var theWindow = objj_msgSend(self, "_mouseHitTest:", location);
        if (aDOMEvent.type === CPDOMEventMouseDown && theWindow)
            self._mouseDownWindow = theWindow;
        windowNumber = objj_msgSend(theWindow, "windowNumber");
    }
    if (windowNumber)
        location = objj_msgSend(CPApp._windows[windowNumber], "convertPlatformWindowToBase:", location);
    if (type === "mouseup")
    {
        if (self._mouseIsDown)
        {
            event = _CPEventFromNativeMouseEvent(aDOMEvent, self._mouseDownIsRightClick ? CPRightMouseUp : CPLeftMouseUp, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(self._lastMouseUp, timestamp, location), 0, nil);
            self._mouseIsDown = NO;
            self._lastMouseUp = event;
            self._mouseDownWindow = nil;
            self._mouseDownIsRightClick = NO;
        }
        if (self._DOMEventMode)
        {
            self._DOMEventMode = NO;
            return;
        }
    }
    else if (type === "mousedown")
    {
        objj_msgSend(_CPToolTip, "invalidateCurrentToolTipIfNeeded");
        var button = aDOMEvent.button;
        self._mouseDownIsRightClick = button == 2 || CPBrowserIsOperatingSystem(CPMacOperatingSystem) && button == 0 && modifierFlags & CPControlKeyMask;
        if (sourceElement.tagName === "INPUT" && sourceElement != self._DOMFocusElement)
        {
            if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
            {
                self._DOMBodyElement.setAttribute("draggable", "false");
                self._DOMBodyElement.style["-khtml-user-drag"] = "none";
            }
            self._DOMEventMode = YES;
            self._mouseIsDown = YES;
            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", self._mouseDownIsRightClick ? CPRightMouseDown : CPLeftMouseDown, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(self._lastMouseDown, timestamp, location), 0));
            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", self._mouseDownIsRightClick ? CPRightMouseUp : CPLeftMouseUp, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(self._lastMouseDown, timestamp, location), 0));
            return;
        }
        else if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        {
            self._DOMBodyElement.setAttribute("draggable", "true");
            self._DOMBodyElement.style["-khtml-user-drag"] = "element";
        }
        StopContextMenuDOMEventPropagation = YES;
        event = _CPEventFromNativeMouseEvent(aDOMEvent, self._mouseDownIsRightClick ? CPRightMouseDown : CPLeftMouseDown, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(self._lastMouseDown, timestamp, location), 0, nil);
        self._mouseIsDown = YES;
        self._lastMouseDown = event;
    }
    else
    {
        if (self._DOMEventMode)
            return;
        event = _CPEventFromNativeMouseEvent(aDOMEvent, self._mouseIsDown ? self._mouseDownIsRightClick ? CPRightMouseDragged : CPLeftMouseDragged : CPMouseMoved, location, modifierFlags, timestamp, windowNumber, nil, -1, 1, 0, self._lastMouseEventLocation || location);
    }
    var isDragging = objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "isDragging");
    if (event && (!isDragging || !supportsNativeDragAndDrop))
    {
        event._DOMEvent = aDOMEvent;
        objj_msgSend(CPApp, "sendEvent:", event);
    }
    var didStop = NO;
    if (StopDOMEventPropagation && (!supportsNativeDragAndDrop || type !== "mousedown" && !isDragging))
    {
        didStop = YES;
        _CPDOMEventStop(aDOMEvent, self);
    }
    var hasTrackingEventListener = NO;
    for (var i = 0; i < CPApp._eventListeners.length; i++)
    {
        var listener = CPApp._eventListeners[i];
        if (listener._callback !== _CPRunModalLoop && listener._mask & CPLeftMouseDraggedMask)
        {
            hasTrackingEventListener = YES;
            break;
        }
    }
    self._lastMouseEventLocation = location;
    self._DOMEventGuard.style.display = hasTrackingEventListener ? "" : "none";
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    return !didStop;
}
,["void","DOMEvent"]), new objj_method(sel_getUid("contextMenuEvent:"), function $CPPlatformWindow__contextMenuEvent_(self, _cmd, aDOMEvent)
{
    if (StopContextMenuDOMEventPropagation)
        _CPDOMEventStop(aDOMEvent, self);
    return !StopContextMenuDOMEventPropagation;
}
,["void","DOMEvent"]), new objj_method(sel_getUid("orderedWindowsAtLevel:"), function $CPPlatformWindow__orderedWindowsAtLevel_(self, _cmd, aLevel)
{
    var layer = objj_msgSend(self, "layerAtLevel:create:", aLevel, NO);
    if (!layer)
        return [];
    return objj_msgSend(layer, "orderedWindows");
}
,["CPArray","int"]), new objj_method(sel_getUid("layerAtLevel:create:"), function $CPPlatformWindow__layerAtLevel_create_(self, _cmd, aLevel, aFlag)
{
    var layer = objj_msgSend(self._windowLayers, "objectForKey:", aLevel);
    if (!layer && aFlag)
    {
        layer = objj_msgSend(objj_msgSend(CPDOMWindowLayer, "alloc"), "initWithLevel:", aLevel);
        objj_msgSend(self._windowLayers, "setObject:forKey:", layer, aLevel);
        var low = 0,
            high = self._windowLevels.length - 1,
            middle;
        while (low <= high)
        {
            middle = FLOOR((low + high) / 2);
            if (self._windowLevels[middle] > aLevel)
                high = middle - 1;
            else
                low = middle + 1;
        }
        var insertionIndex = 0;
        if (middle !== undefined)
            insertionIndex = self._windowLevels[middle] > aLevel ? middle : middle + 1;
        objj_msgSend(self._windowLevels, "insertObject:atIndex:", aLevel, insertionIndex);
        layer._DOMElement.style.zIndex = aLevel;
        self._DOMBodyElement.appendChild(layer._DOMElement);
    }
    return layer;
}
,["CPDOMWindowLayer","int","BOOL"]), new objj_method(sel_getUid("order:window:relativeTo:"), function $CPPlatformWindow__order_window_relativeTo_(self, _cmd, orderingMode, aWindow, otherWindow)
{
    objj_msgSend(CPPlatform, "initializeScreenIfNecessary");
    var layer = objj_msgSend(self, "layerAtLevel:create:", objj_msgSend(aWindow, "level"), orderingMode !== CPWindowOut);
    if (orderingMode === CPWindowOut)
        return objj_msgSend(layer, "removeWindow:", aWindow);
    if (!objj_msgSend(aWindow, "isVisible") && otherWindow && objj_msgSend(aWindow, "parentWindow") === otherWindow)
    {
        var children = objj_msgSend(otherWindow, "childWindows"),
            lastChild = objj_msgSend(children, "lastObject");
        if (lastChild === aWindow)
        {
            if (objj_msgSend(children, "count") > 1)
                otherWindow = objj_msgSend(children, "objectAtIndex:", objj_msgSend(children, "count") - 2);
        }
        else if (lastChild)
            otherWindow = lastChild;
        var furthestParent = objj_msgSend(self, "_furthestParentOf:", otherWindow);
        if (orderingMode === CPWindowAbove && furthestParent._index > otherWindow._index || orderingMode === CPWindowBelow && furthestParent._index < otherWindow._index)
            otherWindow = furthestParent;
    }
    else if (orderingMode === CPWindowAbove && !otherWindow)
        aWindow = objj_msgSend(self, "_furthestParentOf:", aWindow);
    var insertionIndex = CPNotFound;
    if (otherWindow)
        insertionIndex = orderingMode === CPWindowAbove ? otherWindow._index + 1 : otherWindow._index;
    objj_msgSend(layer, "insertWindow:atIndex:", aWindow, insertionIndex);
    if (objj_msgSend(objj_msgSend(aWindow, "childWindows"), "count"))
        objj_msgSend(self, "_orderChildWindowsOf:furthestParent:layer:", aWindow, objj_msgSend(self, "_furthestParentOf:", aWindow), layer);
    objj_msgSend(aWindow, "_setHasBeenOrderedIn:", YES);
}
,["void","CPWindowOrderingMode","CPWindow","CPWindow"]), new objj_method(sel_getUid("_furthestParentOf:"), function $CPPlatformWindow___furthestParentOf_(self, _cmd, aWindow)
{
    var parent;
    while (parent = objj_msgSend(aWindow, "parentWindow"))
        aWindow = parent;
    return aWindow;
}
,["CPWindow","CPWindow"]), new objj_method(sel_getUid("_orderChildWindowsOf:furthestParent:layer:"), function $CPPlatformWindow___orderChildWindowsOf_furthestParent_layer_(self, _cmd, aWindow, furthestParent, aLayer)
{
    var children = objj_msgSend(aWindow, "childWindows"),
        count = objj_msgSend(children, "count"),
        parent = aWindow,
        parentLevel = objj_msgSend(parent, "level");
    for (var i = 0; i < count; ++i)
    {
        var child = children[i],
            childWasVisible = objj_msgSend(child, "isVisible");
        if (!childWasVisible && !objj_msgSend(child, "_hasBeenOrderedIn"))
            continue;
        if (objj_msgSend(child, "level") !== parentLevel)
            continue;
        var ordering = objj_msgSend(child, "_childOrdering");
        if (ordering === CPWindowAbove && furthestParent._index > parent._index || ordering === CPWindowBelow && furthestParent._index < parent._index)
            parent = furthestParent;
        var index = ordering === CPWindowAbove ? parent._index + 1 : parent._index;
        objj_msgSend(aLayer, "insertWindow:atIndex:", child, index);
        if (!childWasVisible)
            objj_msgSend(child, "_parentDidOrderInChild");
        if (objj_msgSend(objj_msgSend(child, "childWindows"), "count"))
            objj_msgSend(self, "_orderChildWindowsOf:furthestParent:layer:", child, furthestParent, aLayer);
        parent = child;
    }
}
,["void","CPWindow","CPWindow","CPDOMWindowLayer"]), new objj_method(sel_getUid("_removeLayers"), function $CPPlatformWindow___removeLayers(self, _cmd)
{
    var levels = self._windowLevels,
        layers = self._windowLayers,
        levelCount = levels.length;
    while (levelCount--)
    {
        var layer = objj_msgSend(layers, "objectForKey:", levels[levelCount]);
        self._DOMBodyElement.removeChild(layer._DOMElement);
    }
}
,["void"]), new objj_method(sel_getUid("_addLayers"), function $CPPlatformWindow___addLayers(self, _cmd)
{
    var levels = self._windowLevels,
        layers = self._windowLayers,
        levelCount = levels.length;
    while (levelCount--)
    {
        var layer = objj_msgSend(layers, "objectForKey:", levels[levelCount]);
        self._DOMBodyElement.appendChild(layer._DOMElement);
    }
}
,["void"]), new objj_method(sel_getUid("_dragHitTest:pasteboard:"), function $CPPlatformWindow___dragHitTest_pasteboard_(self, _cmd, aPoint, aPasteboard)
{
    var levels = self._windowLevels,
        layers = self._windowLayers,
        levelCount = levels.length;
    while (levelCount--)
    {
        if (levels[levelCount] >= CPDraggingWindowLevel)
            continue;
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount--)
        {
            var theWindow = windows[windowCount];
            if (objj_msgSend(theWindow, "_sharesChromeWithPlatformWindow"))
                return objj_msgSend(theWindow, "_dragHitTest:pasteboard:", aPoint, aPasteboard);
            if (objj_msgSend(theWindow, "containsPoint:", aPoint))
                return objj_msgSend(theWindow, "_dragHitTest:pasteboard:", aPoint, aPasteboard);
        }
    }
    return nil;
}
,["id","CGPoint","CPPasteboard"]), new objj_method(sel_getUid("_propagateCurrentDOMEvent:"), function $CPPlatformWindow___propagateCurrentDOMEvent_(self, _cmd, aFlag)
{
    StopDOMEventPropagation = !aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("_willPropagateCurrentDOMEvent"), function $CPPlatformWindow___willPropagateCurrentDOMEvent(self, _cmd)
{
    return !StopDOMEventPropagation;
}
,["BOOL"]), new objj_method(sel_getUid("_propagateContextMenuDOMEvent:"), function $CPPlatformWindow___propagateContextMenuDOMEvent_(self, _cmd, aFlag)
{
    if (aFlag && CPBrowserIsEngine(CPGeckoBrowserEngine))
        StopDOMEventPropagation = !aFlag;
    StopContextMenuDOMEventPropagation = !aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("_willPropagateContextMenuDOMEvent"), function $CPPlatformWindow___willPropagateContextMenuDOMEvent(self, _cmd)
{
    return StopContextMenuDOMEventPropagation;
}
,["BOOL"]), new objj_method(sel_getUid("_mouseHitTest:"), function $CPPlatformWindow___mouseHitTest_(self, _cmd, location)
{
    return objj_msgSend(self, "_hitTest:withTest:", location, sel_getUid("_isValidMousePoint:"));
}
,["CPWindow","CGPoint"]), new objj_method(sel_getUid("hitTest:"), function $CPPlatformWindow__hitTest_(self, _cmd, location)
{
    return objj_msgSend(self, "_hitTest:withTest:", location, sel_getUid("containsPoint:"));
}
,["CPWindow","CGPoint"]), new objj_method(sel_getUid("_hitTest:withTest:"), function $CPPlatformWindow___hitTest_withTest_(self, _cmd, location, aTest)
{
    if (self._only)
        return self._only;
    var levels = self._windowLevels,
        layers = self._windowLayers,
        levelCount = levels.length,
        theWindow = nil;
    while (levelCount-- && !theWindow)
    {
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount-- && !theWindow)
        {
            var candidateWindow = windows[windowCount];
            if (!candidateWindow._ignoresMouseEvents && objj_msgSend(candidateWindow, "performSelector:withObject:", aTest, location))
                theWindow = candidateWindow;
        }
    }
    return theWindow;
}
,["CPWindow","CGPoint","SEL"]), new objj_method(sel_getUid("_selectedText"), function $CPPlatformWindow___selectedText(self, _cmd)
{
    if (self._DOMWindow.getSelection)
        return "" + self._DOMWindow.getSelection();
    else if (self._DOMWindow.document.getSelection)
        return "" + self._DOMWindow.document.getSelection();
    else if (self._DOMWindow.selection)
        return "" + (self._DOMWindow.selection.createRange()).text;
    else
        return nil;
}
,["CPString"]), new objj_method(sel_getUid("setSelectedRange:inElement:"), function $CPPlatformWindow__setSelectedRange_inElement_(self, _cmd, aRange, anElement)
{
    if (self._DOMWindow.getSelection())
    {
        var domRange = self._DOMWindow.document.createRange();
        domRange.setStart(anElement.childNodes[0], aRange.location);
        domRange.setEnd(anElement.childNodes[0], CPMaxRange(aRange));
        (self._DOMWindow.getSelection()).removeAllRanges();
        (self._DOMWindow.getSelection()).addRange(domRange);
    }
    else if (self._DOMWindow.document.selection)
    {
        var domRange = self._DOMWindow.document.body.createTextRange();
        domRange.moveToElementText(anElement);
        domRange.collapse(true);
        domRange.moveStart('character', aRange.location);
        domRange.moveEnd('character', aRange.length);
        domRange.select();
    }
}
,["void","CPRange","DOMElement"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("visiblePlatformWindows"), function $CPPlatformWindow__visiblePlatformWindows(self, _cmd)
{
    if (objj_msgSend(objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"), "isVisible"))
    {
        var set = objj_msgSend(CPSet, "setWithSet:", PlatformWindows);
        objj_msgSend(set, "addObject:", objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"));
        return set;
    }
    else
        return PlatformWindows;
}
,["CPSet"]), new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"), function $CPPlatformWindow__preventCharacterKeysFromPropagating_(self, _cmd, characters)
{
    for (var i = characters.length; i > 0; i--)
        CharacterKeysToPrevent["" + characters[i - 1].toLowerCase()] = YES;
}
,["void","CPArray"]), new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"), function $CPPlatformWindow__preventCharacterKeyFromPropagating_(self, _cmd, character)
{
    CharacterKeysToPrevent[character.toLowerCase()] = YES;
}
,["void","CPString"]), new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"), function $CPPlatformWindow__clearCharacterKeysToPreventFromPropagating(self, _cmd)
{
    CharacterKeysToPrevent = {};
}
,["void"]), new objj_method(sel_getUid("preventKeyCodesFromPropagating:"), function $CPPlatformWindow__preventKeyCodesFromPropagating_(self, _cmd, keyCodes)
{
    for (var i = keyCodes.length; i > 0; i--)
        KeyCodesToPrevent[keyCodes[i - 1]] = YES;
}
,["void","CPArray"]), new objj_method(sel_getUid("preventKeyCodeFromPropagating:"), function $CPPlatformWindow__preventKeyCodeFromPropagating_(self, _cmd, keyCode)
{
    KeyCodesToPrevent[keyCode] = YES;
}
,["void","CPString"]), new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"), function $CPPlatformWindow__clearKeyCodesToPreventFromPropagating(self, _cmd)
{
    KeyCodesToPrevent = {};
}
,["void"])]);
}var CPEventClass = objj_msgSend(CPEvent, "class");
var _CPEventFromNativeMouseEvent = function(aNativeEvent, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure, aMouseDragStart)
{
    aNativeEvent.isa = CPEventClass;
    aNativeEvent._type = anEventType;
    aNativeEvent._location = aPoint;
    aNativeEvent._modifierFlags = modifierFlags;
    aNativeEvent._timestamp = aTimestamp;
    aNativeEvent._windowNumber = aWindowNumber;
    aNativeEvent._window = nil;
    aNativeEvent._context = aGraphicsContext;
    aNativeEvent._eventNumber = anEventNumber;
    aNativeEvent._clickCount = aClickCount;
    aNativeEvent._pressure = aPressure;
    if (anEventType == CPLeftMouseDragged || anEventType == CPRightMouseDragged || anEventType == CPMouseMoved)
    {
        aNativeEvent._deltaX = aPoint.x - aMouseDragStart.x;
        aNativeEvent._deltaY = aPoint.y - aMouseDragStart.y;
    }
    else
    {
        aNativeEvent._deltaX = 0;
        aNativeEvent._deltaY = 0;
    }
    return aNativeEvent;
};
var CLICK_SPACE_DELTA = 5.0,
    CLICK_TIME_DELTA = typeof document != "undefined" && document.addEventListener ? 0.55 : 1.0;
var CPDOMEventGetClickCount = function(aComparisonEvent, aTimestamp, aLocation)
{
    if (!aComparisonEvent)
        return 1;
    var comparisonLocation = objj_msgSend(aComparisonEvent, "locationInWindow");
    return aTimestamp - objj_msgSend(aComparisonEvent, "timestamp") < CLICK_TIME_DELTA && ABS(comparisonLocation.x - aLocation.x) < CLICK_SPACE_DELTA && ABS(comparisonLocation.y - aLocation.y) < CLICK_SPACE_DELTA ? objj_msgSend(aComparisonEvent, "clickCount") + 1 : 1;
};
_CPDOMEventStop = function(aDOMEvent, aPlatformWindow)
{
    aDOMEvent.cancelBubble = true;
    aDOMEvent.returnValue = false;
    if (aDOMEvent.preventDefault)
        aDOMEvent.preventDefault();
    if (aDOMEvent.stopPropagation)
        aDOMEvent.stopPropagation();
};
CPWindowObjectList = function()
{
    var platformWindows = objj_msgSend(CPPlatformWindow, "visiblePlatformWindows"),
        platformWindowEnumerator = objj_msgSend(platformWindows, "objectEnumerator"),
        platformWindow = nil,
        windowObjects = [];
    while ((platformWindow = objj_msgSend(platformWindowEnumerator, "nextObject")) !== nil)
    {
        var levels = platformWindow._windowLevels,
            layers = platformWindow._windowLayers,
            levelCount = levels.length;
        while (levelCount--)
        {
            var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
                windowCount = windows.length;
            while (windowCount--)
                windowObjects.push(windows[windowCount]);
        }
    }
    return windowObjects;
}
CPWindowList = function()
{
    var windowObjectList = CPWindowObjectList(),
        windowList = [];
    for (var i = 0, count = objj_msgSend(windowObjectList, "count"); i < count; i++)
        windowList.push(objj_msgSend(windowObjectList[i], "windowNumber"));
    return windowList;
}
