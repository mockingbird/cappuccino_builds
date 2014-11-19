@STATIC;1.0;i;19;CPEvent_Constants.jI;21;Foundation/CPObject.jI;26;Foundation/CPObjJRuntime.jI;21;Foundation/CPString.ji;17;CPCompatibility.ji;12;CGGeometry.ji;8;CPText.jt;17914;objj_executeFile("CPEvent_Constants.j", YES);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPObjJRuntime.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPText.j", YES);var _CPEventPeriodicEventPeriod = 0,
    _CPEventPeriodicEventTimer = nil,
    _CPEventUpperCaseRegex = new RegExp("[A-Z]"),
    _CPEventStartupMilliseconds = (new Date()).getTime();
{var the_class = objj_allocateClassPair(CPObject, "CPEvent"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_type"), new objj_ivar("_location"), new objj_ivar("_modifierFlags"), new objj_ivar("_timestamp"), new objj_ivar("_context"), new objj_ivar("_eventNumber"), new objj_ivar("_clickCount"), new objj_ivar("_pressure"), new objj_ivar("_window"), new objj_ivar("_windowNumber"), new objj_ivar("_characters"), new objj_ivar("_charactersIgnoringModifiers"), new objj_ivar("_isARepeat"), new objj_ivar("_keyCode"), new objj_ivar("_DOMEvent"), new objj_ivar("_data1"), new objj_ivar("_data2"), new objj_ivar("_subtype"), new objj_ivar("_deltaX"), new objj_ivar("_deltaY"), new objj_ivar("_deltaZ"), new objj_ivar("_scrollingDeltaX"), new objj_ivar("_scrollingDeltaY"), new objj_ivar("_hasPreciseScrollingDeltas"), new objj_ivar("_suppressCappuccinoCut"), new objj_ivar("_suppressCappuccinoPaste")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithType:"), function $CPEvent___initWithType_(self, _cmd, anEventType)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPEvent").super_class }, "init"))
    {
        self._type = anEventType;
        self._deltaX = 0;
        self._scrollingDeltaX = 0;
        self._deltaY = 0;
        self._scrollingDeltaY = 0;
        self._deltaZ = 0;
    }
    return self;
}
,["id","CPEventType"]), new objj_method(sel_getUid("_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"), function $CPEvent___initMouseEventWithType_location_modifierFlags_timestamp_windowNumber_context_eventNumber_clickCount_pressure_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
{
    if (self = (self == null ? null : self.isa.objj_msgSend1(self, "_initWithType:", anEventType)))
    {
        self._location = CGPointCreateCopy(aPoint);
        self._modifierFlags = modifierFlags;
        self._timestamp = aTimestamp;
        self._context = aGraphicsContext;
        self._eventNumber = anEventNumber;
        self._clickCount = aClickCount;
        self._pressure = aPressure;
        self._window = (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "windowWithWindowNumber:", aWindowNumber));
    }
    return self;
}
,["id","CPEventType","CGPoint","unsigned","CPTimeInterval","int","CPGraphicsContext","int","int","float"]), new objj_method(sel_getUid("_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"), function $CPEvent___initKeyEventWithType_location_modifierFlags_timestamp_windowNumber_context_characters_charactersIgnoringModifiers_isARepeat_keyCode_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, isARepeat, code)
{
    if (self = (self == null ? null : self.isa.objj_msgSend1(self, "_initWithType:", anEventType)))
    {
        self._location = CGPointCreateCopy(aPoint);
        self._modifierFlags = modifierFlags;
        self._timestamp = aTimestamp;
        self._context = aGraphicsContext;
        self._characters = characters;
        self._charactersIgnoringModifiers = unmodCharacters;
        self._isARepeat = isARepeat;
        self._keyCode = code;
        self._windowNumber = aWindowNumber;
    }
    return self;
}
,["id","CPEventType","CGPoint","unsigned int","CPTimeInterval","int","CPGraphicsContext","CPString","CPString","BOOL","unsigned short"]), new objj_method(sel_getUid("_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"), function $CPEvent___initOtherEventWithType_location_modifierFlags_timestamp_windowNumber_context_subtype_data1_data2_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2)
{
    if (self = (self == null ? null : self.isa.objj_msgSend1(self, "_initWithType:", anEventType)))
    {
        self._location = CGPointCreateCopy(aPoint);
        self._modifierFlags = modifierFlags;
        self._timestamp = aTimestamp;
        self._context = aGraphicsContext;
        self._subtype = aSubtype;
        self._data1 = aData1;
        self._data2 = aData2;
    }
    return self;
}
,["id","CPEventType","CGPoint","unsigned","CPTimeInterval","int","CPGraphicsContext","short","int","int"]), new objj_method(sel_getUid("locationInWindow"), function $CPEvent__locationInWindow(self, _cmd)
{
    return CGPointMakeCopy(self._location);
}
,["CGPoint"]), new objj_method(sel_getUid("globalLocation"), function $CPEvent__globalLocation(self, _cmd)
{
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        location = self.isa.objj_msgSend0(self, "locationInWindow");
    if (theWindow)
        return (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "convertBaseToGlobal:", location));
    return location;
}
,["CGPoint"]), new objj_method(sel_getUid("modifierFlags"), function $CPEvent__modifierFlags(self, _cmd)
{
    return self._modifierFlags;
}
,["unsigned"]), new objj_method(sel_getUid("timestamp"), function $CPEvent__timestamp(self, _cmd)
{
    return self._timestamp;
}
,["CPTimeInterval"]), new objj_method(sel_getUid("type"), function $CPEvent__type(self, _cmd)
{
    return self._type;
}
,["CPEventType"]), new objj_method(sel_getUid("window"), function $CPEvent__window(self, _cmd)
{
    if (!self._window)
        self._window = (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "windowWithWindowNumber:", self._windowNumber));
    return self._window;
}
,["CPWindow"]), new objj_method(sel_getUid("windowNumber"), function $CPEvent__windowNumber(self, _cmd)
{
    return self._windowNumber;
}
,["int"]), new objj_method(sel_getUid("buttonNumber"), function $CPEvent__buttonNumber(self, _cmd)
{
    if (self._type === CPRightMouseDown || self._type === CPRightMouseUp || self._type === CPRightMouseDragged)
        return 1;
    return 0;
}
,["int"]), new objj_method(sel_getUid("clickCount"), function $CPEvent__clickCount(self, _cmd)
{
    return self._clickCount;
}
,["int"]), new objj_method(sel_getUid("characters"), function $CPEvent__characters(self, _cmd)
{
    return self._characters;
}
,["CPString"]), new objj_method(sel_getUid("charactersIgnoringModifiers"), function $CPEvent__charactersIgnoringModifiers(self, _cmd)
{
    return self._charactersIgnoringModifiers;
}
,["CPString"]), new objj_method(sel_getUid("isARepeat"), function $CPEvent__isARepeat(self, _cmd)
{
    return self._isARepeat;
}
,["BOOL"]), new objj_method(sel_getUid("keyCode"), function $CPEvent__keyCode(self, _cmd)
{
    return self._keyCode;
}
,["unsigned short"]), new objj_method(sel_getUid("pressure"), function $CPEvent__pressure(self, _cmd)
{
    return self._pressure;
}
,["float"]), new objj_method(sel_getUid("_DOMEvent"), function $CPEvent___DOMEvent(self, _cmd)
{
    return self._DOMEvent;
}
,["DOMEvent"]), new objj_method(sel_getUid("data1"), function $CPEvent__data1(self, _cmd)
{
    return self._data1;
}
,["int"]), new objj_method(sel_getUid("data2"), function $CPEvent__data2(self, _cmd)
{
    return self._data2;
}
,["int"]), new objj_method(sel_getUid("deltaX"), function $CPEvent__deltaX(self, _cmd)
{
    return self._deltaX;
}
,["float"]), new objj_method(sel_getUid("deltaY"), function $CPEvent__deltaY(self, _cmd)
{
    return self._deltaY;
}
,["float"]), new objj_method(sel_getUid("deltaZ"), function $CPEvent__deltaZ(self, _cmd)
{
    return self._deltaZ;
}
,["float"]), new objj_method(sel_getUid("hasPreciseScrollingDeltas"), function $CPEvent__hasPreciseScrollingDeltas(self, _cmd)
{
    return !!self._hasPreciseScrollingDeltas;
}
,["BOOL"]), new objj_method(sel_getUid("scrollingDeltaX"), function $CPEvent__scrollingDeltaX(self, _cmd)
{
    return self._scrollingDeltaX;
}
,["float"]), new objj_method(sel_getUid("scrollingDeltaY"), function $CPEvent__scrollingDeltaY(self, _cmd)
{
    return self._scrollingDeltaY;
}
,["float"]), new objj_method(sel_getUid("_triggersKeyEquivalent:withModifierMask:"), function $CPEvent___triggersKeyEquivalent_withModifierMask_(self, _cmd, aKeyEquivalent, aKeyEquivalentModifierMask)
{
    if (!aKeyEquivalent)
        return NO;
    if (_CPEventUpperCaseRegex.test(aKeyEquivalent))
        aKeyEquivalentModifierMask |= CPShiftKeyMask;
    if (!CPBrowserIsOperatingSystem(CPMacOperatingSystem) && aKeyEquivalentModifierMask & CPCommandKeyMask)
    {
        aKeyEquivalentModifierMask |= CPControlKeyMask;
        aKeyEquivalentModifierMask &= ~CPCommandKeyMask;
    }
    if ((self._modifierFlags & (CPShiftKeyMask | CPAlternateKeyMask | CPCommandKeyMask | CPControlKeyMask)) !== aKeyEquivalentModifierMask)
        return NO;
    if (self._characters === CPNewlineCharacter || self._characters === CPCarriageReturnCharacter)
        return CPNewlineCharacter === aKeyEquivalent || CPCarriageReturnCharacter === aKeyEquivalent;
    return ((___r1 = self._characters), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "caseInsensitiveCompare:", aKeyEquivalent)) === CPOrderedSame;
    var ___r1;
}
,["BOOL","CPString","id"]), new objj_method(sel_getUid("_couldBeKeyEquivalent"), function $CPEvent___couldBeKeyEquivalent(self, _cmd)
{
    if (self._type !== CPKeyDown)
        return NO;
    var characterCount = self._characters.length;
    if (!characterCount)
        return NO;
    if (self._modifierFlags & (CPCommandKeyMask | CPControlKeyMask))
        return YES;
    var firstResponderIsText = ((___r1 = ((___r2 = self._window), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "firstResponder"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", (CPTextField == null ? null : CPTextField.isa.objj_msgSend0(CPTextField, "class"))));
    for (var i = 0; i < characterCount; i++)
    {
        var c = self._characters.charAt(i);
        if (c >= CPUpArrowFunctionKey && c <= CPModeSwitchFunctionKey || c === CPEnterCharacter || c === CPNewlineCharacter || c === CPCarriageReturnCharacter || c === CPEscapeFunctionKey)
        {
            return YES;
        }
    }
    return !firstResponderIsText;
    var ___r1, ___r2;
}
,["BOOL"]), new objj_method(sel_getUid("_platformIsEffectingCutOrPaste"), function $CPEvent___platformIsEffectingCutOrPaste(self, _cmd)
{
    return self._suppressCappuccinoCut || self._suppressCappuccinoPaste;
}
,["BOOL"]), new objj_method(sel_getUid("description"), function $CPEvent__description(self, _cmd)
{
    switch(self._type) {
    case CPKeyDown:
    case CPKeyUp:
    case CPFlagsChanged:
        return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "CPEvent: type=%d loc=%@ time=%.1f flags=0x%X win=%@ winNum=%d ctxt=%@ chars=\"%@\" unmodchars=\"%@\" repeat=%d keyCode=%d", self._type, CGStringFromPoint(self._location), self._timestamp, self._modifierFlags, self._window, self._windowNumber, self._context, self._characters, self._charactersIgnoringModifiers, self._isARepeat, self._keyCode);
    case CPLeftMouseDown:
    case CPLeftMouseUp:
    case CPRightMouseDown:
    case CPRightMouseUp:
    case CPMouseMoved:
    case CPLeftMouseDragged:
    case CPRightMouseDragged:
    case CPMouseEntered:
    case CPMouseExited:
        return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "CPEvent: type=%d loc=%@ time=%.1f flags=0x%X win=%@ winNum=%d ctxt=%@ evNum=%d click=%d buttonNumber=%d pressure=%f", self._type, CGStringFromPoint(self._location), self._timestamp, self._modifierFlags, self._window, self._windowNumber, self._context, self._eventNumber, self._clickCount, self.isa.objj_msgSend0(self, "buttonNumber"), self._pressure);
default:
        return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "CPEvent: type=%d loc=%@ time=%.1f flags=0x%X win=%@ winNum=%d ctxt=%@ subtype=%d data1=%d data2=%d", self._type, CGStringFromPoint(self._location), self._timestamp, self._modifierFlags, self._window, self._windowNumber, self._context, self._subtype, self._data1, self._data2);
    }
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("currentTimestamp"), function $CPEvent__currentTimestamp(self, _cmd)
{
    return ((new Date()).getTime() - _CPEventStartupMilliseconds) / 1000;
}
,["CPTimeInterval"]), new objj_method(sel_getUid("keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"), function $CPEvent__keyEventWithType_location_modifierFlags_timestamp_windowNumber_context_characters_charactersIgnoringModifiers_isARepeat_keyCode_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, repeatKey, code)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, repeatKey, code));
    var ___r1;
}
,["CPEvent","CPEventType","CGPoint","unsigned int","CPTimeInterval","int","CPGraphicsContext","CPString","CPString","BOOL","unsigned short"]), new objj_method(sel_getUid("mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"), function $CPEvent__mouseEventWithType_location_modifierFlags_timestamp_windowNumber_context_eventNumber_clickCount_pressure_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure));
    var ___r1;
}
,["id","CPEventType","CGPoint","unsigned","CPTimeInterval","int","CPGraphicsContext","int","int","float"]), new objj_method(sel_getUid("otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"), function $CPEvent__otherEventWithType_location_modifierFlags_timestamp_windowNumber_context_subtype_data1_data2_(self, _cmd, anEventType, aLocation, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:", anEventType, aLocation, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2));
    var ___r1;
}
,["CPEvent","CPEventType","CGPoint","unsigned","CPTimeInterval","int","CPGraphicsContext","short","int","int"]), new objj_method(sel_getUid("mouseLocation"), function $CPEvent__mouseLocation(self, _cmd)
{
    var event = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")),
        eventWindow = (event == null ? null : event.isa.objj_msgSend0(event, "window"));
    if (eventWindow)
        return (eventWindow == null ? null : eventWindow.isa.objj_msgSend1(eventWindow, "convertBaseToGlobal:", (event == null ? null : event.isa.objj_msgSend0(event, "locationInWindow"))));
    return (event == null ? null : event.isa.objj_msgSend0(event, "locationInWindow"));
}
,["CGPoint"]), new objj_method(sel_getUid("startPeriodicEventsAfterDelay:withPeriod:"), function $CPEvent__startPeriodicEventsAfterDelay_withPeriod_(self, _cmd, aDelay, aPeriod)
{
    _CPEventPeriodicEventPeriod = aPeriod;
    _CPEventPeriodicEventTimer = window.setTimeout(function()
    {
        _CPEventPeriodicEventTimer = window.setInterval(_CPEventFirePeriodEvent, aPeriod * 1000.0);
    }, aDelay * 1000.0);
}
,["void","CPTimeInterval","CPTimeInterval"]), new objj_method(sel_getUid("stopPeriodicEvents"), function $CPEvent__stopPeriodicEvents(self, _cmd)
{
    if (_CPEventPeriodicEventTimer === nil)
        return;
    window.clearTimeout(_CPEventPeriodicEventTimer);
    _CPEventPeriodicEventTimer = nil;
}
,["void"])]);
}_CPEventFirePeriodEvent = function()
{
    (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "sendEvent:", CPEvent.isa.objj_msgSend(CPEvent, "otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:", CPPeriodic, CGPointMakeZero(), 0, CPEvent.isa.objj_msgSend0(CPEvent, "currentTimestamp"), 0, nil, 0, 0, 0)));
}
var CPEventClass = CPEvent.isa.objj_msgSend0(CPEvent, "class");
_CPEventFromNativeMouseEvent = function(aNativeEvent, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
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
    return aNativeEvent;
}
