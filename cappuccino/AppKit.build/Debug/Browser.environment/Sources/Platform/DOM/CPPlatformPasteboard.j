@STATIC;1.0;I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;17;CPCompatibility.ji;9;CPEvent.ji;14;CPPasteboard.ji;12;CPPlatform.ji;26;CPPlatformWindow+DOMKeys.jt;17948;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPRunLoop.j", NO);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPEvent.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPPlatform.j", YES);objj_executeFile("CPPlatformWindow+DOMKeys.j", YES);var hasEditableTarget = function(aDOMEvent)
{
    var target = aDOMEvent.target || aDOMEvent.srcElement;
    if (!target)
        return NO;
    if (target.contentEditable == "true")
        return YES;
    var nodeName = target.nodeName.toUpperCase();
    return nodeName === "INPUT" || nodeName == "TEXTAREA";
};
{var the_class = objj_allocateClassPair(CPObject, "CPPlatformPasteboard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMWindow"), new objj_ivar("_DOMPasteboardElement"), new objj_ivar("supportsNativeCopyAndPaste"), new objj_ivar("hasBugWhichPreventsNonEditablePaste"), new objj_ivar("hasBugWhichPreventsNonEditablePasteRedirect"), new objj_ivar("_lastKeyDownEvent"), new objj_ivar("currentEventIsNativePasteEvent"), new objj_ivar("currentEventIsNativeCopyOrCutEvent"), new objj_ivar("currentEventShouldBeSuppressed"), new objj_ivar("currentEventShouldDefinitelyBubble"), new objj_ivar("currentEventShouldDefinitelyNotBubble"), new objj_ivar("_ignoreNativeCopyOrCutEvent"), new objj_ivar("_ignoreNativePastePreparation")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPPlatformPasteboard__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPlatformPasteboard").super_class }, "init"))
    {
        self.supportsNativeCopyAndPaste = CPFeatureIsCompatible(CPJavaScriptClipboardEventsFeature);
        self.hasBugWhichPreventsNonEditablePaste = CPPlatformHasBug(CPJavaScriptPasteRequiresEditableTarget);
        self.hasBugWhichPreventsNonEditablePasteRedirect = CPPlatformHasBug(CPJavaScriptPasteCantRefocus);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("setDOMWindow:"), function $CPPlatformPasteboard__setDOMWindow_(self, _cmd, aDOMWindow)
{
    if (self._DOMWindow === aDOMWindow)
        return;
    if (self._DOMWindow)
        objj_msgSend(self, "destroyDOMElements");
    self._DOMWindow = aDOMWindow;
    if (self._DOMWindow)
        objj_msgSend(self, "createDOMElements");
}
,["void","DOMWindow"]), new objj_method(sel_getUid("createDOMElements"), function $CPPlatformPasteboard__createDOMElements(self, _cmd)
{
    var theDocument = self._DOMWindow.document,
        _DOMBodyElement = theDocument.getElementById("cappuccino-body") || theDocument.body;
    self._DOMPasteboardElement = theDocument.createElement("textarea");
    self._DOMPasteboardElement.style.position = "absolute";
    self._DOMPasteboardElement.style.top = "-10000px";
    self._DOMPasteboardElement.style.zIndex = "999";
    self._DOMPasteboardElement.className = "cpdontremove";
    _DOMBodyElement.appendChild(self._DOMPasteboardElement);
    self._DOMPasteboardElement.blur();
    var copyEventCallback = function(anEvent)
    {
        return objj_msgSend(self, "beforeCopyEvent:", anEvent);
    },
        nativeBeforeClipboardEventCallback = function(anEvent)
    {
        return objj_msgSend(self, "nativeBeforeClipboardEvent:", anEvent);
    },
        nativeCopyOrCutEventCallback = function(anEvent)
    {
        return objj_msgSend(self, "nativeCopyOrCutEvent:", anEvent);
    },
        pasteEventCallback = function(anEvent)
    {
        return objj_msgSend(self, "beforePasteEvent:", anEvent);
    },
        nativePasteEventCallback = function(anEvent)
    {
        return objj_msgSend(self, "nativePasteEvent:", anEvent);
    };
    if (theDocument.addEventListener)
    {
        if (self.supportsNativeCopyAndPaste)
        {
            self._DOMWindow.addEventListener("beforecopy", nativeBeforeClipboardEventCallback, NO);
            self._DOMWindow.addEventListener("beforecut", nativeBeforeClipboardEventCallback, NO);
            self._DOMWindow.addEventListener("beforepaste", nativeBeforeClipboardEventCallback, NO);
            self._DOMWindow.addEventListener("copy", nativeCopyOrCutEventCallback, NO);
            self._DOMWindow.addEventListener("cut", nativeCopyOrCutEventCallback, NO);
            self._DOMWindow.addEventListener("paste", nativePasteEventCallback, NO);
        }
        else
        {
            theDocument.addEventListener("beforepaste", pasteEventCallback, NO);
            theDocument.addEventListener("beforecopy", copyEventCallback, NO);
            theDocument.addEventListener("beforecut", copyEventCallback, NO);
        }
        self._DOMWindow.addEventListener("unload", function()
        {
            if (self.supportsNativeCopyAndPaste)
            {
                self._DOMWindow.removeEventListener("beforecopy", nativeBeforeClipboardEventCallback, NO);
                self._DOMWindow.removeEventListener("beforecut", nativeBeforeClipboardEventCallback, NO);
                self._DOMWindow.removeEventListener("beforepaste", nativeBeforeClipboardEventCallback, NO);
                self._DOMWindow.removeEventListener("copy", nativeCopyOrCutEventCallback, NO);
                self._DOMWindow.removeEventListener("cut", nativeCopyOrCutEventCallback, NO);
                self._DOMWindow.removeEventListener("paste", nativePasteEventCallback, NO);
            }
            else
            {
                theDocument.removeEventListener("beforepaste", pasteEventCallback, NO);
                theDocument.removeEventListener("beforecopy", copyEventCallback, NO);
                theDocument.removeEventListener("beforecut", copyEventCallback, NO);
            }
        }, NO);
    }
    else
    {
    }
}
,["void"]), new objj_method(sel_getUid("destroyDOMElements"), function $CPPlatformPasteboard__destroyDOMElements(self, _cmd)
{
    var theDocument = self._DOMWindow.document,
        _DOMBodyElement = theDocument.getElementById("cappuccino-body") || theDocument.body;
    _DOMBodyElement.removeChild(self._DOMPasteboardElement);
    self._DOMPasteboardElement = nil;
}
,["void"]), new objj_method(sel_getUid("windowMaySendKeyEvent:"), function $CPPlatformPasteboard__windowMaySendKeyEvent_(self, _cmd, anEvent)
{
    self.currentEventIsNativePasteEvent = NO;
    self.currentEventIsNativeCopyOrCutEvent = NO;
    self.currentEventShouldBeSuppressed = NO;
    self.currentEventShouldDefinitelyNotBubble = NO;
    self.currentEventShouldDefinitelyBubble = NO;
    if (!anEvent)
        return;
    if (objj_msgSend(anEvent, "type") !== CPKeyDown)
    {
        self._ignoreNativePastePreparation = NO;
        self._ignoreNativeCopyOrCutEvent = NO;
        return;
    }
    var modifierFlags = objj_msgSend(anEvent, "modifierFlags");
    if (!(modifierFlags & (CPControlKeyMask | CPCommandKeyMask)))
        return;
    self._lastKeyDownEvent = anEvent;
    var aDOMEvent = anEvent._DOMEvent,
        characters = objj_msgSend(anEvent, "characters"),
        mayRequireDOMPasteboardElement = objj_msgSend(self, "_mayRequireDOMPasteboardElementHack:flags:", aDOMEvent, modifierFlags);
    if (characters === "v" && mayRequireDOMPasteboardElement)
    {
        if (self.supportsNativeCopyAndPaste && self.hasBugWhichPreventsNonEditablePaste && self.hasBugWhichPreventsNonEditablePasteRedirect && !hasEditableTarget(aDOMEvent))
        {
            self.currentEventIsNativePasteEvent = NO;
            self.currentEventShouldDefinitelyBubble = YES;
        }
        else if (!(self.supportsNativeCopyAndPaste || self.hasBugWhichPreventsNonEditablePaste) && !self._ignoreNativePastePreparation)
        {
            self._DOMPasteboardElement.focus();
            self._DOMPasteboardElement.select();
            self._DOMPasteboardElement.value = "";
            self._DOMWindow.setNativeTimeout(function()
            {
                objj_msgSend(self, "_checkDOMPasteboardElement");
            }, 0);
            self.currentEventIsNativePasteEvent = YES;
        }
        else if (self.supportsNativeCopyAndPaste)
            self.currentEventIsNativePasteEvent = YES;
        if (self.currentEventIsNativePasteEvent)
        {
            self.currentEventShouldDefinitelyBubble = YES;
            self.currentEventShouldBeSuppressed = YES;
        }
    }
    else if ((characters == "c" || characters == "x") && mayRequireDOMPasteboardElement)
    {
        self.currentEventIsNativeCopyOrCutEvent = YES;
        if (self.supportsNativeCopyAndPaste || self._ignoreNativeCopyOrCutEvent)
            self.currentEventShouldBeSuppressed = YES;
    }
    if (!self.currentEventShouldBeSuppressed)
    {
        if (characters === "v")
            anEvent._suppressCappuccinoPaste = YES;
        else if (characters === "x")
            anEvent._suppressCappuccinoCut = YES;
    }
}
,["void","CPEvent"]), new objj_method(sel_getUid("windowShouldSuppressKeyEvent"), function $CPPlatformPasteboard__windowShouldSuppressKeyEvent(self, _cmd)
{
    return self.currentEventShouldBeSuppressed;
}
,["BOOL"]), new objj_method(sel_getUid("windowDidSendKeyEvent:"), function $CPPlatformPasteboard__windowDidSendKeyEvent_(self, _cmd, anEvent)
{
    if (!self.supportsNativeCopyAndPaste && self.currentEventIsNativeCopyOrCutEvent)
        objj_msgSend(self, "_primeDOMPasteboardElement");
}
,["void","CPEvent"]), new objj_method(sel_getUid("windowShouldStopPropagation"), function $CPPlatformPasteboard__windowShouldStopPropagation(self, _cmd)
{
    return self.currentEventShouldDefinitelyNotBubble;
}
,["BOOL"]), new objj_method(sel_getUid("windowShouldNotStopPropagation"), function $CPPlatformPasteboard__windowShouldNotStopPropagation(self, _cmd)
{
    return self.currentEventShouldDefinitelyBubble;
}
,["BOOL"]), new objj_method(sel_getUid("_fakeClipboardEvent:type:"), function $CPPlatformPasteboard___fakeClipboardEvent_type_(self, _cmd, aDOMEvent, aType)
{
    var keyCode = aType === "x" ? CPKeyCodes.X : aType === "c" ? CPKeyCodes.C : CPKeyCodes.V,
        characters = aType,
        timestamp = objj_msgSend(CPEvent, "currentTimestamp"),
        windowNumber = objj_msgSend(objj_msgSend(CPApp, "keyWindow"), "windowNumber"),
        modifierFlags = CPPlatformActionKeyMask,
        location = objj_msgSend(self._lastKeyDownEvent, "locationInWindow"),
        anEvent = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyDown, location, modifierFlags, timestamp, windowNumber, nil, characters, characters, NO, keyCode);
    anEvent._data1 = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", YES, "simulated");
    anEvent._DOMEvent = aDOMEvent;
    return anEvent;
}
,["CPEvent","DOMEvent","CPString"]), new objj_method(sel_getUid("beforeCopyEvent:"), function $CPPlatformPasteboard__beforeCopyEvent_(self, _cmd, aDOMEvent)
{
    if (objj_msgSend(self, "_mayRequireDOMPasteboardElementHack:flags:", aDOMEvent, CPPlatformActionKeyMask) && !self._ignoreNativeCopyOrCutEvent)
    {
        var anEvent = objj_msgSend(self, "_fakeClipboardEvent:type:", aDOMEvent, aDOMEvent.type === "beforecut" ? "x" : "c");
        objj_msgSend(CPApp, "sendEvent:", anEvent);
        objj_msgSend(self, "_primeDOMPasteboardElement");
        self._ignoreNativeCopyOrCutEvent = YES;
    }
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
,["void","DOMEvent"]), new objj_method(sel_getUid("beforePasteEvent:"), function $CPPlatformPasteboard__beforePasteEvent_(self, _cmd, aDOMEvent)
{
    if (objj_msgSend(self, "_mayRequireDOMPasteboardElementHack:flags:", aDOMEvent, CPPlatformActionKeyMask))
    {
        self._DOMPasteboardElement.focus();
        self._DOMPasteboardElement.select();
        self._DOMPasteboardElement.value = "";
        self._ignoreNativePastePreparation = YES;
    }
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
,["boolean","DOMEvent"]), new objj_method(sel_getUid("_mayRequireDOMPasteboardElementHack:flags:"), function $CPPlatformPasteboard___mayRequireDOMPasteboardElementHack_flags_(self, _cmd, aDOMEvent, modifierFlags)
{
    return !hasEditableTarget(aDOMEvent) && modifierFlags & CPPlatformActionKeyMask;
}
,["void","DOMEvent","unsigned"]), new objj_method(sel_getUid("_primeDOMPasteboardElement"), function $CPPlatformPasteboard___primeDOMPasteboardElement(self, _cmd)
{
    var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard"),
        types = objj_msgSend(pasteboard, "types");
    if (types.length)
    {
        if (objj_msgSend(types, "indexOfObjectIdenticalTo:", CPStringPboardType) !== CPNotFound)
            self._DOMPasteboardElement.value = objj_msgSend(pasteboard, "stringForType:", CPStringPboardType);
        else
            self._DOMPasteboardElement.value = objj_msgSend(pasteboard, "_generateStateUID");
        self._DOMPasteboardElement.focus();
        self._DOMPasteboardElement.select();
        window.setNativeTimeout(function()
        {
            objj_msgSend(self, "_clearDOMPasteboardElement");
        }, 0);
    }
}
,["void"]), new objj_method(sel_getUid("_checkDOMPasteboardElement"), function $CPPlatformPasteboard___checkDOMPasteboardElement(self, _cmd)
{
    if (self.supportsNativeCopyAndPaste)
    {
        objj_msgSend(self, "_clearDOMPasteboardElement");
        return;
    }
    var value = self._DOMPasteboardElement.value;
    if (objj_msgSend(value, "length"))
    {
        var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard");
        if (objj_msgSend(pasteboard, "_stateUID") != value)
        {
            objj_msgSend(pasteboard, "declareTypes:owner:", [CPStringPboardType], self);
            objj_msgSend(pasteboard, "setString:forType:", value, CPStringPboardType);
        }
    }
    objj_msgSend(self, "_clearDOMPasteboardElement");
    objj_msgSend(CPApp, "sendEvent:", objj_msgSend(self, "_fakeClipboardEvent:type:", nil, "v"));
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
,["void"]), new objj_method(sel_getUid("_clearDOMPasteboardElement"), function $CPPlatformPasteboard___clearDOMPasteboardElement(self, _cmd)
{
    self._DOMPasteboardElement.value = "";
    self._DOMPasteboardElement.blur();
}
,["void"]), new objj_method(sel_getUid("nativeBeforeClipboardEvent:"), function $CPPlatformPasteboard__nativeBeforeClipboardEvent_(self, _cmd, aDOMEvent)
{
    if (hasEditableTarget(aDOMEvent))
        return true;
    var returnValue = YES;
    switch(aDOMEvent.type) {
    case "beforecopy":
        returnValue = !objj_msgSend(CPApp, "targetForAction:", sel_getUid("copy:"));
        break;
    case "beforecut":
        returnValue = !objj_msgSend(CPApp, "targetForAction:", sel_getUid("cut:"));
        break;
    case "beforepaste":
        returnValue = !objj_msgSend(CPApp, "targetForAction:", sel_getUid("paste:"));
        break;
    }
    if (!returnValue)
        _CPDOMEventStop(aDOMEvent, self);
    return returnValue;
}
,["boolean","DOMEvent"]), new objj_method(sel_getUid("nativePasteEvent:"), function $CPPlatformPasteboard__nativePasteEvent_(self, _cmd, aDOMEvent)
{
    if (!self.supportsNativeCopyAndPaste)
        return;
    var value;
    if (aDOMEvent.clipboardData && aDOMEvent.clipboardData.setData)
        value = aDOMEvent.clipboardData.getData('text/plain');
    else
        value = self._DOMWindow.clipboardData.getData("Text");
    if (objj_msgSend(value, "length"))
    {
        var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard");
        if (objj_msgSend(pasteboard, "_stateUID") != value)
        {
            objj_msgSend(pasteboard, "declareTypes:owner:", [CPStringPboardType], self);
            objj_msgSend(pasteboard, "setString:forType:", value, CPStringPboardType);
        }
    }
    var anEvent = objj_msgSend(self, "_fakeClipboardEvent:type:", aDOMEvent, "v"),
        platformWindow = objj_msgSend(objj_msgSend(anEvent, "window"), "platformWindow");
    anEvent._suppressCappuccinoPaste = YES;
    objj_msgSend(platformWindow, "_propagateCurrentDOMEvent:", NO);
    objj_msgSend(CPApp, "sendEvent:", anEvent);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    if (!objj_msgSend(platformWindow, "_willPropagateCurrentDOMEvent"))
        _CPDOMEventStop(aDOMEvent, self);
    return false;
}
,["boolean","DOMEvent"]), new objj_method(sel_getUid("nativeCopyOrCutEvent:"), function $CPPlatformPasteboard__nativeCopyOrCutEvent_(self, _cmd, aDOMEvent)
{
    if (!self.supportsNativeCopyAndPaste)
        return;
    var anEvent = objj_msgSend(self, "_fakeClipboardEvent:type:", aDOMEvent, aDOMEvent.type.indexOf("cut") != CPNotFound ? "x" : "c"),
        platformWindow = objj_msgSend(objj_msgSend(anEvent, "window"), "platformWindow");
    anEvent._suppressCappuccinoCut = YES;
    objj_msgSend(platformWindow, "_propagateCurrentDOMEvent:", NO);
    objj_msgSend(CPApp, "sendEvent:", anEvent);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    if (!objj_msgSend(platformWindow, "_willPropagateCurrentDOMEvent"))
    {
        _CPDOMEventStop(aDOMEvent, self);
        var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard");
        if (objj_msgSend(objj_msgSend(pasteboard, "types"), "containsObject:", CPStringPboardType))
        {
            var stringValue = objj_msgSend(pasteboard, "stringForType:", CPStringPboardType);
            if (aDOMEvent.clipboardData && aDOMEvent.clipboardData.setData)
                aDOMEvent.clipboardData.setData('text/plain', stringValue);
            else
                self._DOMWindow.clipboardData.setData('Text', stringValue);
        }
    }
    return !objj_msgSend(platformWindow, "_willPropagateCurrentDOMEvent");
}
,["boolean","DOMEvent"])]);
}