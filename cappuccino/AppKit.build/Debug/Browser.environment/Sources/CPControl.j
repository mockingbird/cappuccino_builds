@STATIC;1.0;I;24;Foundation/CPFormatter.jI;20;Foundation/CPTimer.ji;8;CPFont.ji;10;CPShadow.ji;8;CPView.ji;19;CPKeyValueBinding.jt;34968;objj_executeFile("Foundation/CPFormatter.j", NO);objj_executeFile("Foundation/CPTimer.j", NO);objj_executeFile("CPFont.j", YES);objj_executeFile("CPShadow.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPKeyValueBinding.j", YES);{var the_protocol = objj_allocateProtocol("CPControlTextEditingDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPControlTextEditingDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}CPLeftTextAlignment = 0;
CPRightTextAlignment = 1;
CPCenterTextAlignment = 2;
CPJustifiedTextAlignment = 3;
CPNaturalTextAlignment = 4;
CPRegularControlSize = 0;
CPSmallControlSize = 1;
CPMiniControlSize = 2;
CPLineBreakByWordWrapping = 0;
CPLineBreakByCharWrapping = 1;
CPLineBreakByClipping = 2;
CPLineBreakByTruncatingHead = 3;
CPLineBreakByTruncatingTail = 4;
CPLineBreakByTruncatingMiddle = 5;
CPTopVerticalTextAlignment = 1;
CPCenterVerticalTextAlignment = 2;
CPBottomVerticalTextAlignment = 3;
CPScaleProportionally = 0;
CPScaleToFit = 1;
CPScaleNone = 2;
CPImageScaleProportionallyDown = 0;
CPImageScaleAxesIndependently = 1;
CPImageScaleNone = 2;
CPImageScaleProportionallyUpOrDown = 3;
CPNoImage = 0;
CPImageOnly = 1;
CPImageLeft = 2;
CPImageRight = 3;
CPImageBelow = 4;
CPImageAbove = 5;
CPImageOverlaps = 6;
CPOnState = 1;
CPOffState = 0;
CPMixedState = -1;
CPControlNormalBackgroundColor = "CPControlNormalBackgroundColor";
CPControlSelectedBackgroundColor = "CPControlSelectedBackgroundColor";
CPControlHighlightedBackgroundColor = "CPControlHighlightedBackgroundColor";
CPControlDisabledBackgroundColor = "CPControlDisabledBackgroundColor";
CPControlTextDidBeginEditingNotification = "CPControlTextDidBeginEditingNotification";
CPControlTextDidChangeNotification = "CPControlTextDidChangeNotification";
CPControlTextDidEndEditingNotification = "CPControlTextDidEndEditingNotification";
var CPControlBlackColor = CPColor.isa.objj_msgSend0(CPColor, "blackColor");
{var the_class = objj_allocateClassPair(CPView, "CPControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_value"), new objj_ivar("_formatter"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_sendActionOn"), new objj_ivar("_sendsActionOnEndEditing"), new objj_ivar("_continuousTracking"), new objj_ivar("_trackingWasWithinFrame"), new objj_ivar("_trackingMouseDownFlags"), new objj_ivar("_previousTrackingLocation")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("formatter"), function $CPControl__formatter(self, _cmd)
{
    return self._formatter;
}
,["CPFormatter"]), new objj_method(sel_getUid("setFormatter:"), function $CPControl__setFormatter_(self, _cmd, newValue)
{
    self._formatter = newValue;
}
,["void","CPFormatter"]), new objj_method(sel_getUid("sendsActionOnEndEditing"), function $CPControl__sendsActionOnEndEditing(self, _cmd)
{
    return self._sendsActionOnEndEditing;
}
,["BOOL"]), new objj_method(sel_getUid("setSendsActionOnEndEditing:"), function $CPControl__setSendsActionOnEndEditing_(self, _cmd, newValue)
{
    self._sendsActionOnEndEditing = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("_continuouslyReverseSetBinding"), function $CPControl___continuouslyReverseSetBinding(self, _cmd)
{
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", CPValueBinding)),
        theBinding = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", CPValueBinding, self));
    if ((theBinding == null ? null : theBinding.isa.objj_msgSend0(theBinding, "continuouslyUpdatesValue")))
        (theBinding == null ? null : theBinding.isa.objj_msgSend1(theBinding, "reverseSetValueFor:", "objectValue"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_reverseSetBinding"), function $CPControl___reverseSetBinding(self, _cmd)
{
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", CPValueBinding)),
        theBinding = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", CPValueBinding, self));
    (theBinding == null ? null : theBinding.isa.objj_msgSend1(theBinding, "reverseSetValueFor:", "objectValue"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("initWithFrame:"), function $CPControl__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._sendActionOn = CPLeftMouseUpMask;
        self._trackingMouseDownFlags = 0;
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setAction:"), function $CPControl__setAction_(self, _cmd, anAction)
{
    self._action = anAction;
}
,["void","SEL"]), new objj_method(sel_getUid("action"), function $CPControl__action(self, _cmd)
{
    return self._action;
}
,["SEL"]), new objj_method(sel_getUid("setTarget:"), function $CPControl__setTarget_(self, _cmd, aTarget)
{
    self._target = aTarget;
}
,["void","id"]), new objj_method(sel_getUid("target"), function $CPControl__target(self, _cmd)
{
    return self._target;
}
,["id"]), new objj_method(sel_getUid("sendAction:to:"), function $CPControl__sendAction_to_(self, _cmd, anAction, anObject)
{
    self.isa.objj_msgSend0(self, "_reverseSetBinding");
    var binding = CPBinder.isa.objj_msgSend2(CPBinder, "getBinding:forObject:", CPTargetBinding, self);
    (binding == null ? null : binding.isa.objj_msgSend0(binding, "invokeAction"));
    return (CPApp == null ? null : CPApp.isa.objj_msgSend3(CPApp, "sendAction:to:from:", anAction, anObject, self));
}
,["BOOL","SEL","id"]), new objj_method(sel_getUid("sendActionOn:"), function $CPControl__sendActionOn_(self, _cmd, mask)
{
    var previousMask = self._sendActionOn;
    self._sendActionOn = mask;
    return previousMask;
}
,["int","int"]), new objj_method(sel_getUid("isContinuous"), function $CPControl__isContinuous(self, _cmd)
{
    return (self._sendActionOn & CPPeriodicMask) !== 0;
}
,["BOOL"]), new objj_method(sel_getUid("setContinuous:"), function $CPControl__setContinuous_(self, _cmd, flag)
{
    if (flag)
        self._sendActionOn |= CPPeriodicMask;
    else
        self._sendActionOn &= ~CPPeriodicMask;
}
,["void","BOOL"]), new objj_method(sel_getUid("tracksMouseOutsideOfFrame"), function $CPControl__tracksMouseOutsideOfFrame(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("trackMouse:"), function $CPControl__trackMouse_(self, _cmd, anEvent)
{
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")),
        currentLocation = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil),
        isWithinFrame = self.isa.objj_msgSend0(self, "tracksMouseOutsideOfFrame") || CGRectContainsPoint(self.isa.objj_msgSend0(self, "bounds"), currentLocation);
    if (type === CPLeftMouseUp)
    {
        self.isa.objj_msgSend3(self, "stopTracking:at:mouseIsUp:", self._previousTrackingLocation, currentLocation, YES);
        self._trackingMouseDownFlags = 0;
        if (isWithinFrame)
            self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateHovered);
    }
    else
    {
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateHovered);
        if (type === CPLeftMouseDown)
        {
            self._trackingMouseDownFlags = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags"));
            self._continuousTracking = self.isa.objj_msgSend1(self, "startTrackingAt:", currentLocation);
        }
        else if (type === CPLeftMouseDragged)
        {
            if (isWithinFrame)
            {
                if (!self._trackingWasWithinFrame)
                    self._continuousTracking = self.isa.objj_msgSend1(self, "startTrackingAt:", currentLocation);
                else if (self._continuousTracking)
                    self._continuousTracking = self.isa.objj_msgSend2(self, "continueTracking:at:", self._previousTrackingLocation, currentLocation);
            }
            else
                self.isa.objj_msgSend3(self, "stopTracking:at:mouseIsUp:", self._previousTrackingLocation, currentLocation, NO);
        }
        (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMouse:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES));
    }
    if (self._sendActionOn & 1 << type && isWithinFrame)
        self.isa.objj_msgSend2(self, "sendAction:to:", self._action, self._target);
    self._trackingWasWithinFrame = isWithinFrame;
    self._previousTrackingLocation = currentLocation;
}
,["void","CPEvent"]), new objj_method(sel_getUid("setState:"), function $CPControl__setState_(self, _cmd, state)
{
}
,["void","CPInteger"]), new objj_method(sel_getUid("nextState"), function $CPControl__nextState(self, _cmd)
{
    return 0;
}
,["CPInteger"]), new objj_method(sel_getUid("performClick:"), function $CPControl__performClick_(self, _cmd, sender)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    self.isa.objj_msgSend1(self, "highlight:", YES);
    self.isa.objj_msgSend1(self, "setState:", self.isa.objj_msgSend0(self, "nextState"));
    try    {
        self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
    }
    catch(e)     {
        throw e;
    }    finally     {
        CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.1, self, sel_getUid("unhighlightButtonTimerDidFinish:"), nil, NO);
    }
}
,["void","id"]), new objj_method(sel_getUid("unhighlightButtonTimerDidFinish:"), function $CPControl__unhighlightButtonTimerDidFinish_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "highlight:", NO);
}
,["void","id"]), new objj_method(sel_getUid("mouseDownFlags"), function $CPControl__mouseDownFlags(self, _cmd)
{
    return self._trackingMouseDownFlags;
}
,["unsigned"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPControl__startTrackingAt_(self, _cmd, aPoint)
{
    self.isa.objj_msgSend1(self, "highlight:", YES);
    return self._sendActionOn & CPPeriodicMask || self._sendActionOn & CPLeftMouseDraggedMask;
}
,["BOOL","CGPoint"]), new objj_method(sel_getUid("continueTracking:at:"), function $CPControl__continueTracking_at_(self, _cmd, lastPoint, aPoint)
{
    return self._sendActionOn & CPPeriodicMask || self._sendActionOn & CPLeftMouseDraggedMask;
}
,["BOOL","CGPoint","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPControl__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{
    if (mouseIsUp)
        self.isa.objj_msgSend1(self, "highlight:", NO);
    else
        self.isa.objj_msgSend1(self, "highlight:", YES);
}
,["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("acceptsFirstMouse:"), function $CPControl__acceptsFirstMouse_(self, _cmd, anEvent)
{
    return self.isa.objj_msgSend0(self, "isEnabled");
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPControl__mouseDown_(self, _cmd, anEvent)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    self.isa.objj_msgSend1(self, "trackMouse:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseEntered:"), function $CPControl__mouseEntered_(self, _cmd, anEvent)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateHovered);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $CPControl__mouseExited_(self, _cmd, anEvent)
{
    var currentLocation = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil),
        isWithinFrame = self.isa.objj_msgSend0(self, "tracksMouseOutsideOfFrame") || CGRectContainsPoint(self.isa.objj_msgSend0(self, "bounds"), currentLocation);
    if (!isWithinFrame)
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateHovered);
}
,["void","CPEvent"]), new objj_method(sel_getUid("objectValue"), function $CPControl__objectValue(self, _cmd)
{
    return self._value;
}
,["id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPControl__setObjectValue_(self, _cmd, anObject)
{
    self._value = anObject;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","id"]), new objj_method(sel_getUid("floatValue"), function $CPControl__floatValue(self, _cmd)
{
    var floatValue = parseFloat(self._value, 10);
    return isNaN(floatValue) ? 0.0 : floatValue;
}
,["float"]), new objj_method(sel_getUid("setFloatValue:"), function $CPControl__setFloatValue_(self, _cmd, aValue)
{
    self.isa.objj_msgSend1(self, "setObjectValue:", aValue);
}
,["void","float"]), new objj_method(sel_getUid("doubleValue"), function $CPControl__doubleValue(self, _cmd)
{
    var doubleValue = parseFloat(self._value, 10);
    return isNaN(doubleValue) ? 0.0 : doubleValue;
}
,["double"]), new objj_method(sel_getUid("setDoubleValue:"), function $CPControl__setDoubleValue_(self, _cmd, anObject)
{
    self.isa.objj_msgSend1(self, "setObjectValue:", anObject);
}
,["void","double"]), new objj_method(sel_getUid("intValue"), function $CPControl__intValue(self, _cmd)
{
    var intValue = parseInt(self._value, 10);
    return isNaN(intValue) ? 0.0 : intValue;
}
,["int"]), new objj_method(sel_getUid("setIntValue:"), function $CPControl__setIntValue_(self, _cmd, anObject)
{
    self.isa.objj_msgSend1(self, "setObjectValue:", anObject);
}
,["void","int"]), new objj_method(sel_getUid("integerValue"), function $CPControl__integerValue(self, _cmd)
{
    var intValue = parseInt(self._value, 10);
    return isNaN(intValue) ? 0.0 : intValue;
}
,["int"]), new objj_method(sel_getUid("setIntegerValue:"), function $CPControl__setIntegerValue_(self, _cmd, anObject)
{
    self.isa.objj_msgSend1(self, "setObjectValue:", anObject);
}
,["void","int"]), new objj_method(sel_getUid("stringValue"), function $CPControl__stringValue(self, _cmd)
{
    if (self._formatter && self._value !== undefined)
    {
        var formattedValue = self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateEditing) ? ((___r1 = self._formatter), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "editingStringForObjectValue:", self._value)) : ((___r1 = self._formatter), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "stringForObjectValue:", self._value));
        if (formattedValue !== nil && formattedValue !== undefined)
            return formattedValue;
    }
    return self._value === undefined || self._value === nil ? "" : String(self._value);
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("setStringValue:"), function $CPControl__setStringValue_(self, _cmd, aString)
{
    if (aString === nil || aString === undefined)
    {
        CPLog.warn("nil or undefined sent to CPControl -setStringValue");
        return;
    }
    var value;
    if (self._formatter)
    {
        value = nil;
        if (((___r1 = self._formatter), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "getObjectValue:forString:errorDescription:", function(__input) { if (arguments.length) return value = __input; return value; }, aString, nil)) === NO)
        {
            if (!aString || ((___r1 = self._formatter), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "getObjectValue:forString:errorDescription:", function(__input) { if (arguments.length) return value = __input; return value; }, "", nil)) === NO)
                value = undefined;
        }
    }
    else
        value = aString;
    self.isa.objj_msgSend1(self, "setObjectValue:", value);
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("takeDoubleValueFrom:"), function $CPControl__takeDoubleValueFrom_(self, _cmd, sender)
{
    if ((sender == null ? null : sender.isa.objj_msgSend1(sender, "respondsToSelector:", sel_getUid("doubleValue"))))
        self.isa.objj_msgSend1(self, "setDoubleValue:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "doubleValue")));
}
,["void","id"]), new objj_method(sel_getUid("takeFloatValueFrom:"), function $CPControl__takeFloatValueFrom_(self, _cmd, sender)
{
    if ((sender == null ? null : sender.isa.objj_msgSend1(sender, "respondsToSelector:", sel_getUid("floatValue"))))
        self.isa.objj_msgSend1(self, "setFloatValue:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "floatValue")));
}
,["void","id"]), new objj_method(sel_getUid("takeIntegerValueFrom:"), function $CPControl__takeIntegerValueFrom_(self, _cmd, sender)
{
    if ((sender == null ? null : sender.isa.objj_msgSend1(sender, "respondsToSelector:", sel_getUid("integerValue"))))
        self.isa.objj_msgSend1(self, "setIntegerValue:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "integerValue")));
}
,["void","id"]), new objj_method(sel_getUid("takeIntValueFrom:"), function $CPControl__takeIntValueFrom_(self, _cmd, sender)
{
    if ((sender == null ? null : sender.isa.objj_msgSend1(sender, "respondsToSelector:", sel_getUid("intValue"))))
        self.isa.objj_msgSend1(self, "setIntValue:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "intValue")));
}
,["void","id"]), new objj_method(sel_getUid("takeObjectValueFrom:"), function $CPControl__takeObjectValueFrom_(self, _cmd, sender)
{
    if ((sender == null ? null : sender.isa.objj_msgSend1(sender, "respondsToSelector:", sel_getUid("objectValue"))))
        self.isa.objj_msgSend1(self, "setObjectValue:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "objectValue")));
}
,["void","id"]), new objj_method(sel_getUid("takeStringValueFrom:"), function $CPControl__takeStringValueFrom_(self, _cmd, sender)
{
    if ((sender == null ? null : sender.isa.objj_msgSend1(sender, "respondsToSelector:", sel_getUid("stringValue"))))
        self.isa.objj_msgSend1(self, "setStringValue:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "stringValue")));
}
,["void","id"]), new objj_method(sel_getUid("textDidBeginEditing:"), function $CPControl__textDidBeginEditing_(self, _cmd, note)
{
    if ((note == null ? null : note.isa.objj_msgSend0(note, "object")) != self)
        return;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPControlTextDidBeginEditingNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", (note == null ? null : note.isa.objj_msgSend0(note, "object")), "CPFieldEditor")));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("textDidChange:"), function $CPControl__textDidChange_(self, _cmd, note)
{
    if ((note == null ? null : note.isa.objj_msgSend0(note, "object")) != self)
        return;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPControlTextDidChangeNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", (note == null ? null : note.isa.objj_msgSend0(note, "object")), "CPFieldEditor")));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("textDidEndEditing:"), function $CPControl__textDidEndEditing_(self, _cmd, note)
{
    if ((note == null ? null : note.isa.objj_msgSend0(note, "object")) != self)
        return;
    self.isa.objj_msgSend0(self, "_reverseSetBinding");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPControlTextDidEndEditingNotification, self, (note == null ? null : note.isa.objj_msgSend0(note, "userInfo"))));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("_currentTextMovement"), function $CPControl___currentTextMovement(self, _cmd)
{
    var currentEvent = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")),
        keyCode = (currentEvent == null ? null : currentEvent.isa.objj_msgSend0(currentEvent, "keyCode")),
        modifierFlags = (currentEvent == null ? null : currentEvent.isa.objj_msgSend0(currentEvent, "modifierFlags"));
    switch(keyCode) {
    case CPEscapeKeyCode:
        return CPCancelTextMovement;
    case CPLeftArrowKeyCode:
        return CPLeftTextMovement;
    case CPRightArrowKeyCode:
        return CPRightTextMovement;
    case CPUpArrowKeyCode:
        return CPUpTextMovement;
    case CPDownArrowKeyCode:
        return CPDownTextMovement;
    case CPReturnKeyCode:
        return CPReturnTextMovement;
    case CPTabKeyCode:
        if (modifierFlags & CPShiftKeyMask)
            return CPBacktabTextMovement;
        return CPTabTextMovement;
default:
        return CPOtherTextMovement;
    }
}
,["unsigned"]), new objj_method(sel_getUid("setAlignment:"), function $CPControl__setAlignment_(self, _cmd, alignment)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", alignment, "alignment");
}
,["void","CPTextAlignment"]), new objj_method(sel_getUid("alignment"), function $CPControl__alignment(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "alignment");
}
,["CPTextAlignment"]), new objj_method(sel_getUid("setVerticalAlignment:"), function $CPControl__setVerticalAlignment_(self, _cmd, alignment)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", alignment, "vertical-alignment");
}
,["void","CPTextVerticalAlignment"]), new objj_method(sel_getUid("verticalAlignment"), function $CPControl__verticalAlignment(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "vertical-alignment");
}
,["CPTextVerticalAlignment"]), new objj_method(sel_getUid("setLineBreakMode:"), function $CPControl__setLineBreakMode_(self, _cmd, mode)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", mode, "line-break-mode");
}
,["void","CPLineBreakMode"]), new objj_method(sel_getUid("lineBreakMode"), function $CPControl__lineBreakMode(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "line-break-mode");
}
,["CPLineBreakMode"]), new objj_method(sel_getUid("setTextColor:"), function $CPControl__setTextColor_(self, _cmd, aColor)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", aColor, "text-color");
}
,["void","CPColor"]), new objj_method(sel_getUid("textColor"), function $CPControl__textColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "text-color");
}
,["CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $CPControl__setTextShadowColor_(self, _cmd, aColor)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", aColor, "text-shadow-color");
}
,["void","CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $CPControl__textShadowColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "text-shadow-color");
}
,["CPColor"]), new objj_method(sel_getUid("setTextShadowOffset:"), function $CPControl__setTextShadowOffset_(self, _cmd, offset)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", offset, "text-shadow-offset");
}
,["void","CGSize"]), new objj_method(sel_getUid("textShadowOffset"), function $CPControl__textShadowOffset(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "text-shadow-offset");
}
,["CGSize"]), new objj_method(sel_getUid("setFont:"), function $CPControl__setFont_(self, _cmd, aFont)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", aFont, "font");
}
,["void","CPFont"]), new objj_method(sel_getUid("font"), function $CPControl__font(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "font");
}
,["CPFont"]), new objj_method(sel_getUid("setImagePosition:"), function $CPControl__setImagePosition_(self, _cmd, position)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", position, "image-position");
}
,["void","CPCellImagePosition"]), new objj_method(sel_getUid("imagePosition"), function $CPControl__imagePosition(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-position");
}
,["CPCellImagePosition"]), new objj_method(sel_getUid("setImageScaling:"), function $CPControl__setImageScaling_(self, _cmd, scaling)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", scaling, "image-scaling");
}
,["void","CPImageScaling"]), new objj_method(sel_getUid("imageScaling"), function $CPControl__imageScaling(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-scaling");
}
,["CPUInteger"]), new objj_method(sel_getUid("setEnabled:"), function $CPControl__setEnabled_(self, _cmd, isEnabled)
{
    if (isEnabled)
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateDisabled);
    else
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateDisabled);
}
,["void","BOOL"]), new objj_method(sel_getUid("isEnabled"), function $CPControl__isEnabled(self, _cmd)
{
    return !self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateDisabled);
}
,["BOOL"]), new objj_method(sel_getUid("highlight:"), function $CPControl__highlight_(self, _cmd, shouldHighlight)
{
    self.isa.objj_msgSend1(self, "setHighlighted:", shouldHighlight);
}
,["void","BOOL"]), new objj_method(sel_getUid("setHighlighted:"), function $CPControl__setHighlighted_(self, _cmd, isHighlighted)
{
    if (isHighlighted)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateHighlighted);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateHighlighted);
}
,["void","BOOL"]), new objj_method(sel_getUid("isHighlighted"), function $CPControl__isHighlighted(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateHighlighted);
}
,["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeAttributes"), function $CPControl__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPLeftTextAlignment, "alignment", CPTopVerticalTextAlignment, "vertical-alignment", CPLineBreakByClipping, "line-break-mode", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "text-color", CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", CPFontCurrentSystemSize), "font", CPNull.isa.objj_msgSend0(CPNull, "null"), "text-shadow-color", CGSizeMakeZero(), "text-shadow-offset", CPImageLeft, "image-position", CPScaleToFit, "image-scaling", CGSizeMakeZero(), "min-size", CGSizeMake(-1.0, -1.0), "max-size");
}
,["CPDictionary"]), new objj_method(sel_getUid("initialize"), function $CPControl__initialize(self, _cmd)
{
    if (self !== CPControl.isa.objj_msgSend0(CPControl, "class"))
        return;
    self.isa.objj_msgSend1(self, "exposeBinding:", "value");
    self.isa.objj_msgSend1(self, "exposeBinding:", "objectValue");
    self.isa.objj_msgSend1(self, "exposeBinding:", "stringValue");
    self.isa.objj_msgSend1(self, "exposeBinding:", "integerValue");
    self.isa.objj_msgSend1(self, "exposeBinding:", "intValue");
    self.isa.objj_msgSend1(self, "exposeBinding:", "doubleValue");
    self.isa.objj_msgSend1(self, "exposeBinding:", "floatValue");
    self.isa.objj_msgSend1(self, "exposeBinding:", "enabled");
}
,["void"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPControl___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPValueBinding)
        return _CPValueBinder.isa.objj_msgSend0(_CPValueBinder, "class");
    else if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPEnabledBinding)))
        return CPMultipleValueAndBinding.isa.objj_msgSend0(CPMultipleValueAndBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPControl").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}var CPControlValueKey = "CPControlValueKey",
    CPControlControlStateKey = "CPControlControlStateKey",
    CPControlIsEnabledKey = "CPControlIsEnabledKey",
    CPControlTargetKey = "CPControlTargetKey",
    CPControlActionKey = "CPControlActionKey",
    CPControlSendActionOnKey = "CPControlSendActionOnKey",
    CPControlFormatterKey = "CPControlFormatterKey",
    CPControlSendsActionOnEndEditingKey = "CPControlSendsActionOnEndEditingKey",
    __Deprecated__CPImageViewImageKey = "CPImageViewImageKey";
{
var the_class = objj_getClass("CPControl")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPControl\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPControl__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setObjectValue:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPControlValueKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTarget:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPControlTargetKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAction:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPControlActionKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "sendActionOn:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPControlSendActionOnKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setSendsActionOnEndEditing:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPControlSendsActionOnEndEditingKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setFormatter:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPControlFormatterKey))));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPControl__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl").super_class }, "encodeWithCoder:", aCoder);
    if (self._sendsActionOnEndEditing)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._sendsActionOnEndEditing, CPControlSendsActionOnEndEditingKey));
    var objectValue = self.isa.objj_msgSend0(self, "objectValue");
    if (objectValue !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", objectValue, CPControlValueKey));
    if (self._target !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeConditionalObject:forKey:", self._target, CPControlTargetKey));
    if (self._action !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._action, CPControlActionKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._sendActionOn, CPControlSendActionOnKey));
    if (self._formatter !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._formatter, CPControlFormatterKey));
}
,["void","CPCoder"])]);
}var _CPControlSizeIdentifiers = [],
    _CPControlCachedColorWithPatternImages = {},
    _CPControlCachedThreePartImagePattern = {};
_CPControlSizeIdentifiers[CPRegularControlSize] = "Regular";
_CPControlSizeIdentifiers[CPSmallControlSize] = "Small";
_CPControlSizeIdentifiers[CPMiniControlSize] = "Mini";
_CPControlIdentifierForControlSize = function(aControlSize)
{
    return _CPControlSizeIdentifiers[aControlSize];
}
_CPControlColorWithPatternImage = function(sizes, aClassName)
{
    var index = 1,
        count = arguments.length,
        identifier = "";
    for (; index < count; ++index)
        identifier += arguments[index];
    var color = _CPControlCachedColorWithPatternImages[identifier];
    if (!color)
    {
        var bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", CPControl.isa.objj_msgSend0(CPControl, "class"));
        color = CPColor.isa.objj_msgSend1(CPColor, "colorWithPatternImage:", ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", aClassName + "/" + identifier + ".png")), sizes[identifier])));
        _CPControlCachedColorWithPatternImages[identifier] = color;
    }
    return color;
    var ___r1;
}
_CPControlThreePartImagePattern = function(isVertical, sizes, aClassName)
{
    var index = 2,
        count = arguments.length,
        identifier = "";
    for (; index < count; ++index)
        identifier += arguments[index];
    var color = _CPControlCachedThreePartImagePattern[identifier];
    if (!color)
    {
        var bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", CPControl.isa.objj_msgSend0(CPControl, "class")),
            path = aClassName + "/" + identifier;
        sizes = sizes[identifier];
        color = CPColor.isa.objj_msgSend1(CPColor, "colorWithPatternImage:", ((___r1 = CPThreePartImage.isa.objj_msgSend0(CPThreePartImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithImageSlices:isVertical:", [((___r2 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithContentsOfFile:size:", (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", path + "0.png")), sizes[0])), ((___r2 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithContentsOfFile:size:", (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", path + "1.png")), sizes[1])), ((___r2 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithContentsOfFile:size:", (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", path + "2.png")), sizes[2]))], isVertical)));
        _CPControlCachedThreePartImagePattern[identifier] = color;
    }
    return color;
    var ___r1, ___r2;
}
