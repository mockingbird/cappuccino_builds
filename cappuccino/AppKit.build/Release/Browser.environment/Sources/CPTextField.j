@STATIC;1.0;i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.ji;8;CPText.ji;20;CPWindow_Constants.ji;21;_CPImageAndTextView.jt;64195;objj_executeFile("CPControl.j", YES);objj_executeFile("CPStringDrawing.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPWindow_Constants.j", YES);objj_executeFile("_CPImageAndTextView.j", YES);CPTextFieldSquareBezel = 0;
CPTextFieldRoundedBezel = 1;
CPTextFieldDidFocusNotification = "CPTextFieldDidFocusNotification";
CPTextFieldDidBlurNotification = "CPTextFieldDidBlurNotification";
var CPTextFieldDOMInputElement = nil,
    CPTextFieldDOMPasswordInputElement = nil,
    CPTextFieldDOMStandardInputElement = nil,
    CPTextFieldInputOwner = nil,
    CPTextFieldTextDidChangeValue = nil,
    CPTextFieldInputResigning = NO,
    CPTextFieldInputDidBlur = NO,
    CPTextFieldInputIsActive = NO,
    CPTextFieldCachedSelectStartFunction = nil,
    CPTextFieldCachedDragFunction = nil,
    CPTextFieldBlurHandler = nil,
    CPTextFieldInputFunction = nil;
var CPSecureTextFieldCharacter = "\u2022";
CPTextFieldBlurFunction = function(anEvent, owner, domElement, inputElement, resigning, didBlurRef)
{
    if (owner && domElement != inputElement.parentNode)
        return;
    var ownerWindow = objj_msgSend(owner, "window");
    if (!resigning && objj_msgSend(ownerWindow, "isKeyWindow"))
    {
        if (objj_msgSend(owner, "_isWithinUsablePlatformRect"))
        {
            window.setTimeout(function()
            {
                inputElement.focus();
            }, 0.0);
        }
    }
    CPTextFieldHandleBlur(anEvent, function(__input) { if (arguments.length) return owner = __input; return owner; });
    (didBlurRef)(YES);
    return true;
}
CPTextFieldHandleBlur = function(anEvent, ownerRef)
{
    (ownerRef)(nil);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
{
var the_class = objj_getClass("CPString")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPString\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("string"), function $CPString__string(self, _cmd)
{
    return self;
}
,["CPString"])]);
}CPTextFieldStateRounded = CPThemeState("rounded");
CPTextFieldStatePlaceholder = CPThemeState("placeholder");
{var the_class = objj_allocateClassPair(CPControl, "CPTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isEditing"), new objj_ivar("_isEditable"), new objj_ivar("_isSelectable"), new objj_ivar("_isSecure"), new objj_ivar("_willBecomeFirstResponderByClick"), new objj_ivar("_drawsBackground"), new objj_ivar("_textFieldBackgroundColor"), new objj_ivar("_placeholderString"), new objj_ivar("_stringValue"), new objj_ivar("_delegate"), new objj_ivar("_bezelStyle"), new objj_ivar("_isBordered"), new objj_ivar("_controlSize")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_inputElement"), function $CPTextField___inputElement(self, _cmd)
{
    if (!CPTextFieldDOMInputElement)
    {
        CPTextFieldDOMInputElement = document.createElement("input");
        CPTextFieldDOMInputElement.style.position = "absolute";
        CPTextFieldDOMInputElement.style.border = "0px";
        CPTextFieldDOMInputElement.style.padding = "0px";
        CPTextFieldDOMInputElement.style.margin = "0px";
        CPTextFieldDOMInputElement.style.whiteSpace = "pre";
        CPTextFieldDOMInputElement.style.background = "transparent";
        CPTextFieldDOMInputElement.style.outline = "none";
        CPTextFieldBlurHandler = function(anEvent)
        {
            return CPTextFieldBlurFunction(anEvent, CPTextFieldInputOwner, CPTextFieldInputOwner ? CPTextFieldInputOwner._DOMElement : nil, CPTextFieldDOMInputElement, CPTextFieldInputResigning, function(__input) { if (arguments.length) return CPTextFieldInputDidBlur = __input; return CPTextFieldInputDidBlur; });
        };
        if (CPFeatureIsCompatible(CPInputOnInputEventFeature))
        {
            CPTextFieldInputFunction = function(anEvent)
            {
                if (!CPTextFieldInputOwner)
                    return;
                var cappEvent = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyUp, CGPointMakeZero(), 0, objj_msgSend(CPEvent, "currentTimestamp"), objj_msgSend(objj_msgSend(CPApp, "keyWindow"), "windowNumber"), nil, nil, nil, NO, nil);
                objj_msgSend(CPTextFieldInputOwner, "keyUp:", cappEvent);
                objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
            };
            CPTextFieldDOMInputElement.oninput = CPTextFieldInputFunction;
        }
        CPTextFieldDOMInputElement.onblur = CPTextFieldBlurHandler;
        CPTextFieldDOMStandardInputElement = CPTextFieldDOMInputElement;
    }
    if (CPFeatureIsCompatible(CPInputTypeCanBeChangedFeature))
    {
        if (objj_msgSend(self, "isSecure"))
            CPTextFieldDOMInputElement.type = "password";
        else
            CPTextFieldDOMInputElement.type = "text";
        return CPTextFieldDOMInputElement;
    }
    if (objj_msgSend(self, "isSecure"))
    {
        if (!CPTextFieldDOMPasswordInputElement)
        {
            CPTextFieldDOMPasswordInputElement = document.createElement("input");
            CPTextFieldDOMPasswordInputElement.style.position = "absolute";
            CPTextFieldDOMPasswordInputElement.style.border = "0px";
            CPTextFieldDOMPasswordInputElement.style.padding = "0px";
            CPTextFieldDOMPasswordInputElement.style.margin = "0px";
            CPTextFieldDOMPasswordInputElement.style.whiteSpace = "pre";
            CPTextFieldDOMPasswordInputElement.style.background = "transparent";
            CPTextFieldDOMPasswordInputElement.style.outline = "none";
            CPTextFieldDOMPasswordInputElement.type = "password";
            CPTextFieldDOMPasswordInputElement.onblur = CPTextFieldBlurHandler;
        }
        CPTextFieldDOMInputElement = CPTextFieldDOMPasswordInputElement;
    }
    else
    {
        CPTextFieldDOMInputElement = CPTextFieldDOMStandardInputElement;
    }
    return CPTextFieldDOMInputElement;
}
,["DOMElement"]), new objj_method(sel_getUid("initWithFrame:"), function $CPTextField__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setStringValue:", "");
        objj_msgSend(self, "setPlaceholderString:", "");
        self._sendActionOn = CPKeyUpMask | CPKeyDownMask;
        objj_msgSend(self, "setValue:forThemeAttribute:", CPLeftTextAlignment, "alignment");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setEditable:"), function $CPTextField__setEditable_(self, _cmd, shouldBeEditable)
{
    if (self._isEditable === shouldBeEditable)
        return;
    self._isEditable = shouldBeEditable;
    if (shouldBeEditable)
        self._isSelectable = YES;
    if (self._isEditable)
        objj_msgSend(self, "setThemeState:", CPThemeStateEditable);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateEditable);
    if (!(shouldBeEditable && !objj_msgSend(self, "isSelectable")) && objj_msgSend(objj_msgSend(self, "window"), "firstResponder") === self)
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", nil);
    if (shouldBeEditable)
        objj_msgSend(self, "setThemeState:", CPThemeStateEditable);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateEditable);
}
,["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPTextField__isEditable(self, _cmd)
{
    return self._isEditable;
}
,["BOOL"]), new objj_method(sel_getUid("setEnabled:"), function $CPTextField__setEnabled_(self, _cmd, shouldBeEnabled)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "setEnabled:", shouldBeEnabled);
    if (!shouldBeEnabled && objj_msgSend(objj_msgSend(self, "window"), "firstResponder") === self)
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", nil);
}
,["void","BOOL"]), new objj_method(sel_getUid("setSelectable:"), function $CPTextField__setSelectable_(self, _cmd, aFlag)
{
    self._isSelectable = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("isSelectable"), function $CPTextField__isSelectable(self, _cmd)
{
    return self._isSelectable;
}
,["BOOL"]), new objj_method(sel_getUid("setSecure:"), function $CPTextField__setSecure_(self, _cmd, aFlag)
{
    self._isSecure = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("isSecure"), function $CPTextField__isSecure(self, _cmd)
{
    return self._isSecure;
}
,["BOOL"]), new objj_method(sel_getUid("setBezeled:"), function $CPTextField__setBezeled_(self, _cmd, shouldBeBezeled)
{
    if (shouldBeBezeled)
        objj_msgSend(self, "setThemeState:", CPThemeStateBezeled);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateBezeled);
}
,["void","BOOL"]), new objj_method(sel_getUid("isBezeled"), function $CPTextField__isBezeled(self, _cmd)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateBezeled);
}
,["BOOL"]), new objj_method(sel_getUid("setBezelStyle:"), function $CPTextField__setBezelStyle_(self, _cmd, aBezelStyle)
{
    var shouldBeRounded = aBezelStyle === CPTextFieldRoundedBezel;
    if (shouldBeRounded)
        objj_msgSend(self, "setThemeState:", CPTextFieldStateRounded);
    else
        objj_msgSend(self, "unsetThemeState:", CPTextFieldStateRounded);
}
,["void","CPTextFieldBezelStyle"]), new objj_method(sel_getUid("bezelStyle"), function $CPTextField__bezelStyle(self, _cmd)
{
    if (objj_msgSend(self, "hasThemeState:", CPTextFieldStateRounded))
        return CPTextFieldRoundedBezel;
    return CPTextFieldSquareBezel;
}
,["CPTextFieldBezelStyle"]), new objj_method(sel_getUid("setBordered:"), function $CPTextField__setBordered_(self, _cmd, shouldBeBordered)
{
    if (shouldBeBordered)
        objj_msgSend(self, "setThemeState:", CPThemeStateBordered);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateBordered);
}
,["void","BOOL"]), new objj_method(sel_getUid("isBordered"), function $CPTextField__isBordered(self, _cmd)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateBordered);
}
,["BOOL"]), new objj_method(sel_getUid("setDrawsBackground:"), function $CPTextField__setDrawsBackground_(self, _cmd, shouldDrawBackground)
{
    if (self._drawsBackground == shouldDrawBackground)
        return;
    self._drawsBackground = shouldDrawBackground;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","BOOL"]), new objj_method(sel_getUid("drawsBackground"), function $CPTextField__drawsBackground(self, _cmd)
{
    return self._drawsBackground;
}
,["BOOL"]), new objj_method(sel_getUid("setTextFieldBackgroundColor:"), function $CPTextField__setTextFieldBackgroundColor_(self, _cmd, aColor)
{
    if (self._textFieldBackgroundColor == aColor)
        return;
    self._textFieldBackgroundColor = aColor;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPColor"]), new objj_method(sel_getUid("textFieldBackgroundColor"), function $CPTextField__textFieldBackgroundColor(self, _cmd)
{
    return self._textFieldBackgroundColor;
}
,["CPColor"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPTextField__acceptsFirstResponder(self, _cmd)
{
    return objj_msgSend(self, "isEnabled") && (objj_msgSend(self, "isEditable") || objj_msgSend(self, "isSelectable")) && objj_msgSend(self, "_isWithinUsablePlatformRect");
}
,["BOOL"]), new objj_method(sel_getUid("becomeFirstResponder"), function $CPTextField__becomeFirstResponder(self, _cmd)
{
    if (!objj_msgSend(self, "isEnabled"))
        return NO;
    objj_msgSend(self, "_setObserveWindowKeyNotifications:", YES);
    self._isEditing = NO;
    if (objj_msgSend(objj_msgSend(self, "window"), "isKeyWindow") && objj_msgSend(self, "isEditable"))
        return objj_msgSend(self, "_becomeFirstKeyResponder");
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_becomeFirstKeyResponder"), function $CPTextField___becomeFirstKeyResponder(self, _cmd)
{
    if (!objj_msgSend(self, "_isWithinUsablePlatformRect"))
        return NO;
    if (!objj_msgSend(self, "isEditable"))
        return NO;
    objj_msgSend(self, "setThemeState:", CPThemeStateEditing);
    objj_msgSend(self, "_updatePlaceholderState");
    objj_msgSend(self, "setNeedsLayout");
    self._stringValue = objj_msgSend(self, "stringValue");
    var element = objj_msgSend(self, "_inputElement"),
        font = objj_msgSend(self, "currentValueForThemeAttribute:", "font"),
        lineHeight = objj_msgSend(font, "defaultLineHeightForFont");
    element.value = self._stringValue;
    element.style.color = objj_msgSend(objj_msgSend(self, "currentValueForThemeAttribute:", "text-color"), "cssString");
    if (CPFeatureIsCompatible(CPInputSetFontOutsideOfDOM))
        element.style.font = objj_msgSend(font, "cssString");
    element.style.zIndex = 1000;
    switch(objj_msgSend(self, "alignment")) {
    case CPCenterTextAlignment:
        element.style.textAlign = "center";
        break;
    case CPRightTextAlignment:
        element.style.textAlign = "right";
        break;
default:
        element.style.textAlign = "left";
    }
    var contentRect = objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds")),
        verticalAlign = objj_msgSend(self, "currentValueForThemeAttribute:", "vertical-alignment");
    switch(verticalAlign) {
    case CPTopVerticalTextAlignment:
        var topPoint = CGRectGetMinY(contentRect) + "px";
        break;
    case CPCenterVerticalTextAlignment:
        var topPoint = CGRectGetMidY(contentRect) - lineHeight / 2 + "px";
        break;
    case CPBottomVerticalTextAlignment:
        var topPoint = CGRectGetMaxY(contentRect) - lineHeight + "px";
        break;
default:
        var topPoint = CGRectGetMinY(contentRect) + "px";
        break;
    }
    element.style.top = topPoint;
    var left = CGRectGetMinX(contentRect);
    if (CPFeatureIsCompatible(CPInput1PxLeftPadding))
        left -= 1;
    element.style.left = left + "px";
    element.style.width = CGRectGetWidth(contentRect) + "px";
    element.style.height = ROUND(lineHeight) + "px";
    element.style.lineHeight = ROUND(lineHeight) + "px";
    element.style.verticalAlign = "top";
    element.style.cursor = "auto";
    self._DOMElement.appendChild(element);
    if (!CPFeatureIsCompatible(CPInputSetFontOutsideOfDOM))
        element.style.font = objj_msgSend(font, "cssString");
    CPTextFieldInputIsActive = YES;
    if (document.attachEvent)
    {
        CPTextFieldCachedSelectStartFunction = objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.onselectstart;
        CPTextFieldCachedDragFunction = objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.ondrag;
        objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.ondrag = function()
        {
        };
        objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.onselectstart = function()
        {
        };
    }
    CPTextFieldInputOwner = self;
    window.setTimeout(function()
    {
        if (CPTextFieldInputOwner !== self)
            return;
        element.focus();
        if (!self._willBecomeFirstResponderByClick)
            objj_msgSend(self, "_selectText:immediately:", self, YES);
        self._willBecomeFirstResponderByClick = NO;
        objj_msgSend(self, "textDidFocus:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPTextFieldDidFocusNotification, self, nil));
    }, 0.0);
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPTextField__resignFirstResponder(self, _cmd)
{
    if (self._isEditing && CPTextFieldInputOwner === self)
    {
        var element = objj_msgSend(self, "_inputElement"),
            newValue = element.value,
            error = "";
        if (newValue !== self._stringValue)
        {
            objj_msgSend(self, "_setStringValue:", newValue);
        }
        if (objj_msgSend(self, "_valueIsValid:", newValue) === NO)
        {
            element.focus();
            return NO;
        }
    }
    objj_msgSend(self, "_setObserveWindowKeyNotifications:", NO);
    objj_msgSend(self, "_resignFirstKeyResponder");
    self._isEditing = NO;
    if (objj_msgSend(self, "isEditable"))
    {
        objj_msgSend(self, "textDidEndEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidEndEditingNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(self, "_currentTextMovement"), "CPTextMovement")));
        if (objj_msgSend(self, "sendsActionOnEndEditing"))
            objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }
    objj_msgSend(self, "textDidBlur:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPTextFieldDidBlurNotification, self, nil));
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_resignFirstKeyResponder"), function $CPTextField___resignFirstKeyResponder(self, _cmd)
{
    objj_msgSend(self, "unsetThemeState:", CPThemeStateEditing);
    self._stringValue = objj_msgSend(self, "stringValue");
    self._willBecomeFirstResponderByClick = NO;
    objj_msgSend(self, "_updatePlaceholderState");
    objj_msgSend(self, "setNeedsLayout");
    var element = objj_msgSend(self, "_inputElement");
    CPTextFieldInputResigning = YES;
    if (CPTextFieldInputIsActive)
        element.blur();
    if (!CPTextFieldInputDidBlur)
        CPTextFieldBlurHandler();
    CPTextFieldInputDidBlur = NO;
    CPTextFieldInputResigning = NO;
    if (element.parentNode == self._DOMElement)
        element.parentNode.removeChild(element);
    CPTextFieldInputIsActive = NO;
    if (document.attachEvent)
    {
        objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.ondrag = CPTextFieldCachedDragFunction;
        objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.onselectstart = CPTextFieldCachedSelectStartFunction;
        CPTextFieldCachedSelectStartFunction = nil;
        CPTextFieldCachedDragFunction = nil;
    }
}
,["void"]), new objj_method(sel_getUid("_setObserveWindowKeyNotifications:"), function $CPTextField___setObserveWindowKeyNotifications_(self, _cmd, shouldObserve)
{
    if (shouldObserve)
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_windowDidResignKey:"), CPWindowDidResignKeyNotification, objj_msgSend(self, "window"));
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_windowDidBecomeKey:"), CPWindowDidBecomeKeyNotification, objj_msgSend(self, "window"));
    }
    else
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPWindowDidResignKeyNotification, objj_msgSend(self, "window"));
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPWindowDidBecomeKeyNotification, objj_msgSend(self, "window"));
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("_windowDidResignKey:"), function $CPTextField___windowDidResignKey_(self, _cmd, aNotification)
{
    if (!objj_msgSend(objj_msgSend(self, "window"), "isKeyWindow"))
        objj_msgSend(self, "_resignFirstKeyResponder");
}
,["void","CPNotification"]), new objj_method(sel_getUid("_windowDidBecomeKey:"), function $CPTextField___windowDidBecomeKey_(self, _cmd, aNotification)
{
    if (!(objj_msgSend(self, "isEnabled") && objj_msgSend(self, "isEditable")))
        return;
    var wind = objj_msgSend(self, "window");
    if (objj_msgSend(wind, "isKeyWindow") && objj_msgSend(wind, "firstResponder") === self)
        if (!objj_msgSend(self, "_becomeFirstKeyResponder"))
            objj_msgSend(wind, "makeFirstResponder:", nil);
}
,["void","CPNotification"]), new objj_method(sel_getUid("_valueIsValid:"), function $CPTextField___valueIsValid_(self, _cmd, aValue)
{
    var error = "";
    if (objj_msgSend(self, "_setStringValue:isNewValue:errorDescription:", aValue, NO, function(__input) { if (arguments.length) return error = __input; return error; }) === NO)
    {
        var acceptInvalidValue = NO;
        if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("control:didFailToFormatString:errorDescription:")))
            acceptInvalidValue = objj_msgSend(self._delegate, "control:didFailToFormatString:errorDescription:", self, aValue, error);
        if (acceptInvalidValue === NO)
            return NO;
    }
    return YES;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("needsPanelToBecomeKey"), function $CPTextField__needsPanelToBecomeKey(self, _cmd)
{
    return objj_msgSend(self, "acceptsFirstResponder");
}
,["BOOL"]), new objj_method(sel_getUid("acceptsFirstMouse:"), function $CPTextField__acceptsFirstMouse_(self, _cmd, anEvent)
{
    return objj_msgSend(self, "acceptsFirstResponder");
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("_didEdit"), function $CPTextField___didEdit(self, _cmd)
{
    if (!self._isEditing)
    {
        self._isEditing = YES;
        objj_msgSend(self, "textDidBeginEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidBeginEditingNotification, self, nil));
    }
    objj_msgSend(self, "textDidChange:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidChangeNotification, self, nil));
}
,["void"]), new objj_method(sel_getUid("mouseDown:"), function $CPTextField__mouseDown_(self, _cmd, anEvent)
{
    if (objj_msgSend(self, "isEditable") && objj_msgSend(self, "isEnabled"))
    {
        self._willBecomeFirstResponderByClick = YES;
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
    }
    else if (objj_msgSend(self, "isSelectable"))
    {
        if (document.attachEvent)
        {
            CPTextFieldCachedSelectStartFunction = objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.onselectstart;
            CPTextFieldCachedDragFunction = objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.ondrag;
            objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.ondrag = function()
            {
            };
            objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.onselectstart = function()
            {
            };
        }
        return objj_msgSend(objj_msgSend(objj_msgSend(anEvent, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
    else
        return objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPTextField__mouseUp_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self, "isEnabled") || !(objj_msgSend(self, "isSelectable") || objj_msgSend(self, "isEditable")))
        objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseUp:", anEvent);
    else if (objj_msgSend(self, "isSelectable"))
    {
        if (document.attachEvent)
        {
            objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.ondrag = CPTextFieldCachedDragFunction;
            objj_msgSend(objj_msgSend(self, "window"), "platformWindow")._DOMBodyElement.onselectstart = CPTextFieldCachedSelectStartFunction;
            CPTextFieldCachedSelectStartFunction = nil;
            CPTextFieldCachedDragFunction = nil;
        }
        if (objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "clickCount") === 3)
        {
            objj_msgSend(self, "selectText:", nil);
            return;
        }
        return objj_msgSend(objj_msgSend(objj_msgSend(anEvent, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $CPTextField__mouseDragged_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self, "isEnabled") || !(objj_msgSend(self, "isSelectable") || objj_msgSend(self, "isEditable")))
        objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDragged:", anEvent);
    else if (objj_msgSend(self, "isSelectable"))
        return objj_msgSend(objj_msgSend(objj_msgSend(anEvent, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("keyUp:"), function $CPTextField__keyUp_(self, _cmd, anEvent)
{
    if (!(objj_msgSend(self, "isEnabled") && objj_msgSend(self, "isEditable")))
        return;
    var newValue = objj_msgSend(self, "_inputElement").value;
    if (newValue !== self._stringValue)
    {
        objj_msgSend(self, "_setStringValue:", newValue);
        objj_msgSend(self, "_didEdit");
    }
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("keyDown:"), function $CPTextField__keyDown_(self, _cmd, anEvent)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    objj_msgSend(self, "interpretKeyEvents:", [anEvent]);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
,["void","CPEvent"]), new objj_method(sel_getUid("doCommandBySelector:"), function $CPTextField__doCommandBySelector_(self, _cmd, aSelector)
{
    if (objj_msgSend(self, "respondsToSelector:", aSelector))
        objj_msgSend(self, "performSelector:", aSelector);
}
,["void","SEL"]), new objj_method(sel_getUid("insertNewline:"), function $CPTextField__insertNewline_(self, _cmd, sender)
{
    if (!(objj_msgSend(self, "isEnabled") && objj_msgSend(self, "isEditable")))
        return;
    var newValue = objj_msgSend(self, "_inputElement").value;
    if (newValue !== self._stringValue)
    {
        objj_msgSend(self, "_setStringValue:", newValue);
        objj_msgSend(self, "_didEdit");
    }
    if (objj_msgSend(self, "_valueIsValid:", self._stringValue))
    {
        if (self._isEditing)
        {
            self._isEditing = NO;
            objj_msgSend(self, "textDidEndEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidEndEditingNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(self, "_currentTextMovement"), "CPTextMovement")));
        }
        if (!objj_msgSend(self, "action") || objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target")))
        {
            objj_msgSend(self, "selectAll:", nil);
        }
    }
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
,["void","id"]), new objj_method(sel_getUid("insertNewlineIgnoringFieldEditor:"), function $CPTextField__insertNewlineIgnoringFieldEditor_(self, _cmd, sender)
{
    objj_msgSend(self, "_insertCharacterIgnoringFieldEditor:", CPNewlineCharacter);
}
,["void","id"]), new objj_method(sel_getUid("insertTabIgnoringFieldEditor:"), function $CPTextField__insertTabIgnoringFieldEditor_(self, _cmd, sender)
{
    objj_msgSend(self, "_insertCharacterIgnoringFieldEditor:", CPTabCharacter);
}
,["void","id"]), new objj_method(sel_getUid("_insertCharacterIgnoringFieldEditor:"), function $CPTextField___insertCharacterIgnoringFieldEditor_(self, _cmd, aCharacter)
{
    if (!(objj_msgSend(self, "isEnabled") && objj_msgSend(self, "isEditable")))
        return;
    var oldValue = self._stringValue,
        range = objj_msgSend(self, "selectedRange"),
        element = objj_msgSend(self, "_inputElement");
    element.value = objj_msgSend(element.value, "stringByReplacingCharactersInRange:withString:", objj_msgSend(self, "selectedRange"), aCharacter);
    objj_msgSend(self, "_setStringValue:", element.value);
    if (oldValue !== self._stringValue)
    {
        objj_msgSend(self, "_didEdit");
    }
}
,["void","CPString"]), new objj_method(sel_getUid("textDidBlur:"), function $CPTextField__textDidBlur_(self, _cmd, note)
{
    if (objj_msgSend(note, "object") != self)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotification:", note);
}
,["void","CPNotification"]), new objj_method(sel_getUid("textDidFocus:"), function $CPTextField__textDidFocus_(self, _cmd, note)
{
    if (objj_msgSend(note, "object") != self)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotification:", note);
}
,["void","CPNotification"]), new objj_method(sel_getUid("textDidChange:"), function $CPTextField__textDidChange_(self, _cmd, note)
{
    if (objj_msgSend(note, "object") !== self)
        return;
    objj_msgSend(self, "_continuouslyReverseSetBinding");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "textDidChange:", note);
}
,["void","CPNotification"]), new objj_method(sel_getUid("objectValue"), function $CPTextField__objectValue(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "objectValue");
}
,["id"]), new objj_method(sel_getUid("_setStringValue:"), function $CPTextField___setStringValue_(self, _cmd, aValue)
{
    return objj_msgSend(self, "_setStringValue:isNewValue:errorDescription:", aValue, YES, nil);
}
,["BOOL","CPString"]), new objj_method(sel_getUid("_setStringValue:isNewValue:errorDescription:"), function $CPTextField___setStringValue_isNewValue_errorDescription_(self, _cmd, aValue, isNewValue, anError)
{
    self._stringValue = aValue;
    var objectValue = aValue,
        formatter = objj_msgSend(self, "formatter"),
        result = YES;
    if (formatter)
    {
        var object = nil;
        if (objj_msgSend(formatter, "getObjectValue:forString:errorDescription:", function(__input) { if (arguments.length) return object = __input; return object; }, aValue, anError))
            objectValue = object;
        else
        {
            objectValue = undefined;
            result = NO;
        }
        isNewValue |= objectValue !== objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "objectValue");
    }
    if (isNewValue)
    {
        objj_msgSend(self, "willChangeValueForKey:", "objectValue");
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "setObjectValue:", objectValue);
        objj_msgSend(self, "_updatePlaceholderState");
        objj_msgSend(self, "didChangeValueForKey:", "objectValue");
    }
    return result;
}
,["BOOL","CPString","BOOL","CPStringRef"]), new objj_method(sel_getUid("setObjectValue:"), function $CPTextField__setObjectValue_(self, _cmd, aValue)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "setObjectValue:", aValue);
    var formatter = objj_msgSend(self, "formatter");
    if (formatter)
    {
        var formattedString = objj_msgSend(self, "hasThemeState:", CPThemeStateEditing) ? objj_msgSend(formatter, "editingStringForObjectValue:", aValue) : objj_msgSend(formatter, "stringForObjectValue:", aValue);
        if (formattedString === nil)
        {
            var value = nil;
            if (objj_msgSend(formatter, "getObjectValue:forString:errorDescription:", function(__input) { if (arguments.length) return value = __input; return value; }, "", nil) === NO)
                value = undefined;
            objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "setObjectValue:", value);
            self._stringValue = value === nil || value === undefined ? "" : String(value);
        }
        else
            self._stringValue = formattedString;
    }
    else
        self._stringValue = objj_msgSend(self, "stringValue");
    if (CPTextFieldInputOwner === self || objj_msgSend(objj_msgSend(self, "window"), "firstResponder") === self)
        objj_msgSend(self, "_inputElement").value = self._stringValue;
    objj_msgSend(self, "_updatePlaceholderState");
}
,["void","id"]), new objj_method(sel_getUid("_updatePlaceholderState"), function $CPTextField___updatePlaceholderState(self, _cmd)
{
    if ((!self._stringValue || self._stringValue.length === 0) && !objj_msgSend(self, "hasThemeState:", CPThemeStateEditing))
        objj_msgSend(self, "setThemeState:", CPTextFieldStatePlaceholder);
    else
        objj_msgSend(self, "unsetThemeState:", CPTextFieldStatePlaceholder);
}
,["void"]), new objj_method(sel_getUid("setPlaceholderString:"), function $CPTextField__setPlaceholderString_(self, _cmd, aStringValue)
{
    if (self._placeholderString === aStringValue)
        return;
    self._placeholderString = aStringValue;
    if (objj_msgSend(self, "hasThemeState:", CPTextFieldStatePlaceholder))
    {
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
,["void","CPString"]), new objj_method(sel_getUid("placeholderString"), function $CPTextField__placeholderString(self, _cmd)
{
    return self._placeholderString;
}
,["CPString"]), new objj_method(sel_getUid("sizeToFit"), function $CPTextField__sizeToFit(self, _cmd)
{
    objj_msgSend(self, "setFrameSize:", objj_msgSend(self, "_minimumFrameSize"));
}
,["void"]), new objj_method(sel_getUid("_minimumFrameSize"), function $CPTextField___minimumFrameSize(self, _cmd)
{
    var frameSize = objj_msgSend(self, "frameSize"),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset"),
        minSize = objj_msgSend(self, "currentValueForThemeAttribute:", "min-size"),
        maxSize = objj_msgSend(self, "currentValueForThemeAttribute:", "max-size"),
        lineBreakMode = objj_msgSend(self, "lineBreakMode"),
        text = self._stringValue || " ",
        textSize = CGSizeMakeCopy(frameSize),
        font = objj_msgSend(self, "currentValueForThemeAttribute:", "font");
    textSize.width -= contentInset.left + contentInset.right;
    textSize.height -= contentInset.top + contentInset.bottom;
    if (frameSize.width !== 0 && !objj_msgSend(self, "isBezeled") && (lineBreakMode === CPLineBreakByWordWrapping || lineBreakMode === CPLineBreakByCharWrapping))
    {
        textSize = objj_msgSend(text, "sizeWithFont:inWidth:", font, textSize.width);
    }
    else
    {
        textSize = objj_msgSend(text, "sizeWithFont:", font);
        textSize.width += 1;
    }
    textSize.height += 1;
    frameSize.height = textSize.height + contentInset.top + contentInset.bottom;
    if (objj_msgSend(self, "isBezeled"))
    {
        frameSize.height = MAX(frameSize.height, minSize.height);
        if (maxSize.width > 0.0)
            frameSize.width = MIN(frameSize.width, maxSize.width);
        if (maxSize.height > 0.0)
            frameSize.height = MIN(frameSize.height, maxSize.height);
    }
    else
        frameSize.width = textSize.width + contentInset.left + contentInset.right;
    frameSize.width = MAX(frameSize.width, minSize.width);
    return frameSize;
}
,["CGSize"]), new objj_method(sel_getUid("selectText:"), function $CPTextField__selectText_(self, _cmd, sender)
{
    objj_msgSend(self, "_selectText:immediately:", sender, NO);
}
,["void","id"]), new objj_method(sel_getUid("_selectText:immediately:"), function $CPTextField___selectText_immediately_(self, _cmd, sender, immediately)
{
    if (objj_msgSend(self, "isEditable") || objj_msgSend(self, "isSelectable"))
    {
        var wind = objj_msgSend(self, "window");
        if (objj_msgSend(self, "isEditable"))
        {
            var element = objj_msgSend(self, "_inputElement");
            if (objj_msgSend(wind, "firstResponder") === self)
            {
                if (immediately)
                    element.select();
                else
                    window.setTimeout(function()
                    {
                        element.select();
                    }, 0);
            }
            else if (wind !== nil && objj_msgSend(wind, "makeFirstResponder:", self))
                objj_msgSend(self, "_selectText:immediately:", sender, immediately);
        }
        else
        {
            objj_msgSend(self, "setSelectedRange:", CPMakeRange(0, self._stringValue.length));
        }
    }
}
,["void","id","BOOL"]), new objj_method(sel_getUid("copy:"), function $CPTextField__copy_(self, _cmd, sender)
{
    var stringToCopy = nil;
    if (objj_msgSend(self, "isEditable"))
    {
        var selectedRange = objj_msgSend(self, "selectedRange");
        if (selectedRange.length < 1)
            return;
        stringToCopy = objj_msgSend(self._stringValue, "substringWithRange:", selectedRange);
    }
    else
    {
        stringToCopy = objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_selectedText");
    }
    var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard");
    objj_msgSend(pasteboard, "declareTypes:owner:", [CPStringPboardType], nil);
    objj_msgSend(pasteboard, "setString:forType:", stringToCopy, CPStringPboardType);
    if (objj_msgSend(CPPlatform, "isBrowser"))
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("cut:"), function $CPTextField__cut_(self, _cmd, sender)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "copy:", sender);
    if (!objj_msgSend(self, "isEditable"))
        return;
    if (!objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "_platformIsEffectingCutOrPaste"))
    {
        objj_msgSend(self, "deleteBackward:", sender);
    }
    else
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
        if (!CPFeatureIsCompatible(CPInputOnInputEventFeature))
            objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("keyUp:"), nil, NO);
    }
}
,["void","id"]), new objj_method(sel_getUid("paste:"), function $CPTextField__paste_(self, _cmd, sender)
{
    if (!(objj_msgSend(self, "isEnabled") && objj_msgSend(self, "isEditable")))
        return;
    if (!objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "_platformIsEffectingCutOrPaste"))
    {
        var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard");
        if (!objj_msgSend(objj_msgSend(pasteboard, "types"), "containsObject:", CPStringPboardType))
            return;
        objj_msgSend(self, "deleteBackward:", sender);
        var selectedRange = objj_msgSend(self, "selectedRange"),
            pasteString = objj_msgSend(pasteboard, "stringForType:", CPStringPboardType),
            newValue = objj_msgSend(self._stringValue, "stringByReplacingCharactersInRange:withString:", selectedRange, pasteString);
        objj_msgSend(self, "setStringValue:", newValue);
        objj_msgSend(self, "_didEdit");
        objj_msgSend(self, "setSelectedRange:", CPMakeRange(selectedRange.location + pasteString.length, 0));
    }
    else
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
        if (!CPFeatureIsCompatible(CPInputOnInputEventFeature))
            objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("keyUp:"), nil, NO);
    }
}
,["void","id"]), new objj_method(sel_getUid("selectedRange"), function $CPTextField__selectedRange(self, _cmd)
{
    if (objj_msgSend(objj_msgSend(self, "window"), "firstResponder") !== self)
        return CPMakeRange(0, 0);
    try    {
        var inputElement = objj_msgSend(self, "_inputElement"),
            selectionStart = inputElement.selectionStart,
            selectionEnd = inputElement.selectionEnd;
        if (objj_msgSend(selectionStart, "isKindOfClass:", CPNumber))
            return CPMakeRange(selectionStart, selectionEnd - selectionStart);
        var theDocument = inputElement.ownerDocument || inputElement.document,
            selectionRange = theDocument.selection.createRange(),
            range = inputElement.createTextRange();
        if (range.inRange(selectionRange))
        {
            range.setEndPoint('EndToStart', selectionRange);
            return CPMakeRange(range.text.length, selectionRange.text.length);
        }
    }
    catch(e)     {
    }    return CPMakeRange(0, 0);
}
,["CPRange"]), new objj_method(sel_getUid("setSelectedRange:"), function $CPTextField__setSelectedRange_(self, _cmd, aRange)
{
    if (!objj_msgSend(objj_msgSend(self, "window"), "firstResponder") === self)
        return;
    if (!objj_msgSend(self, "isEditable"))
    {
        var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
        if (contentView)
            objj_msgSend(contentView, "setSelectedRange:", aRange);
    }
    else
    {
        var inputElement = objj_msgSend(self, "_inputElement");
        try        {
            if (objj_msgSend(inputElement.selectionStart, "isKindOfClass:", CPNumber))
            {
                inputElement.selectionStart = aRange.location;
                inputElement.selectionEnd = CPMaxRange(aRange);
            }
            else
            {
                var theDocument = inputElement.ownerDocument || inputElement.document,
                    existingRange = theDocument.selection.createRange(),
                    range = inputElement.createTextRange();
                if (range.inRange(existingRange))
                {
                    range.collapse(true);
                    range.move('character', aRange.location);
                    range.moveEnd('character', aRange.length);
                    range.select();
                }
            }
        }
        catch(e)         {
        }    }
}
,["void","CPRange"]), new objj_method(sel_getUid("selectAll:"), function $CPTextField__selectAll_(self, _cmd, sender)
{
    objj_msgSend(self, "selectText:", sender);
}
,["void","id"]), new objj_method(sel_getUid("deleteBackward:"), function $CPTextField__deleteBackward_(self, _cmd, sender)
{
    if (!(objj_msgSend(self, "isEnabled") && objj_msgSend(self, "isEditable")))
        return;
    var selectedRange = objj_msgSend(self, "selectedRange");
    if (selectedRange.length < 1)
    {
        if (selectedRange.location < 1)
            return;
        selectedRange.location -= 1;
        selectedRange.length += 1;
    }
    var newValue = objj_msgSend(self._stringValue, "stringByReplacingCharactersInRange:withString:", selectedRange, "");
    objj_msgSend(self, "setStringValue:", newValue);
    objj_msgSend(self, "setSelectedRange:", CPMakeRange(selectedRange.location, 0));
    objj_msgSend(self, "_didEdit");
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
,["void","id"]), new objj_method(sel_getUid("delete:"), function $CPTextField__delete_(self, _cmd, sender)
{
    if (!(objj_msgSend(self, "isEnabled") && objj_msgSend(self, "isEditable")))
        return;
    var selectedRange = objj_msgSend(self, "selectedRange");
    if (selectedRange.length < 1)
        return;
    var newValue = objj_msgSend(self._stringValue, "stringByReplacingCharactersInRange:withString:", selectedRange, "");
    objj_msgSend(self, "setStringValue:", newValue);
    objj_msgSend(self, "setSelectedRange:", CPMakeRange(selectedRange.location, 0));
    objj_msgSend(self, "_didEdit");
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
,["void","id"]), new objj_method(sel_getUid("deleteForward:"), function $CPTextField__deleteForward_(self, _cmd, sender)
{
    if (!(objj_msgSend(self, "isEnabled") && objj_msgSend(self, "isEditable")))
        return;
    var selectedRange = objj_msgSend(self, "selectedRange");
    if (selectedRange.length < 1)
    {
        if (selectedRange.location + 1 >= self._stringValue.length)
            return;
        selectedRange.length += 1;
    }
    var newValue = objj_msgSend(self._stringValue, "stringByReplacingCharactersInRange:withString:", selectedRange, "");
    objj_msgSend(self, "setStringValue:", newValue);
    objj_msgSend(self, "setSelectedRange:", CPMakeRange(selectedRange.location, 0));
    objj_msgSend(self, "_didEdit");
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
,["void","id"]), new objj_method(sel_getUid("setDelegate:"), function $CPTextField__setDelegate_(self, _cmd, aDelegate)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (self._delegate)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPControlTextDidBeginEditingNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPControlTextDidChangeNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPControlTextDidEndEditingNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPTextFieldDidFocusNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPTextFieldDidBlurNotification, self);
    }
    self._delegate = aDelegate;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("controlTextDidBeginEditing:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("controlTextDidBeginEditing:"), CPControlTextDidBeginEditingNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("controlTextDidChange:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("controlTextDidChange:"), CPControlTextDidChangeNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("controlTextDidEndEditing:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("controlTextDidEndEditing:"), CPControlTextDidEndEditingNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("controlTextDidFocus:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("controlTextDidFocus:"), CPTextFieldDidFocusNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("controlTextDidBlur:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("controlTextDidBlur:"), CPTextFieldDidBlurNotification, self);
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPTextField__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPTextField__contentRectForBounds_(self, _cmd, bounds)
{
    var contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset");
    return CGRectInsetByInset(bounds, contentInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("bezelRectForBounds:"), function $CPTextField__bezelRectForBounds_(self, _cmd, bounds)
{
    var bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset");
    return CGRectInsetByInset(bounds, bezelInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPTextField__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "bezel-view")
        return objj_msgSend(self, "bezelRectForBounds:", objj_msgSend(self, "bounds"));
    else if (aName === "content-view")
        return objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPTextField__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "bezel-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    else
    {
        var view = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "createEphemeralSubviewNamed:", aName);
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTextField__layoutSubviews(self, _cmd)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    if (bezelView)
        objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-color"));
    var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    if (contentView)
    {
        objj_msgSend(contentView, "setHidden:", objj_msgSend(self, "hasThemeState:", CPThemeStateEditing));
        var string = "";
        if (objj_msgSend(self, "hasThemeState:", CPTextFieldStatePlaceholder))
            string = objj_msgSend(self, "placeholderString");
        else
        {
            string = self._stringValue;
            if (objj_msgSend(self, "isSecure"))
                string = secureStringForString(string);
        }
        objj_msgSend(contentView, "setText:", string);
        objj_msgSend(contentView, "setTextColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-color"));
        objj_msgSend(contentView, "setFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "font"));
        objj_msgSend(contentView, "setAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "alignment"));
        objj_msgSend(contentView, "setVerticalAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "vertical-alignment"));
        objj_msgSend(contentView, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemeAttribute:", "line-break-mode"));
        objj_msgSend(contentView, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-color"));
        objj_msgSend(contentView, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-offset"));
    }
}
,["void"]), new objj_method(sel_getUid("takeValueFromKeyPath:ofObjects:"), function $CPTextField__takeValueFromKeyPath_ofObjects_(self, _cmd, aKeyPath, objects)
{
    var count = objects.length,
        value = objj_msgSend(objects[0], "valueForKeyPath:", aKeyPath);
    objj_msgSend(self, "setStringValue:", value);
    objj_msgSend(self, "setPlaceholderString:", "");
    while (count-- > 1)
        if (value !== objj_msgSend(objects[count], "valueForKeyPath:", aKeyPath))
        {
            objj_msgSend(self, "setPlaceholderString:", "Multiple Values");
            objj_msgSend(self, "setStringValue:", "");
        }
}
,["void","CPString","CPArray"]), new objj_method(sel_getUid("viewDidHide"), function $CPTextField__viewDidHide(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "viewDidHide");
    if (objj_msgSend(objj_msgSend(self, "window"), "firstResponder") === self)
        objj_msgSend(self, "_resignFirstKeyResponder");
}
,["void"]), new objj_method(sel_getUid("viewDidUnhide"), function $CPTextField__viewDidUnhide(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "viewDidUnhide");
    if (objj_msgSend(self, "isEditable") && objj_msgSend(objj_msgSend(self, "window"), "firstResponder") === self)
        objj_msgSend(self, "_becomeFirstKeyResponder");
}
,["void"]), new objj_method(sel_getUid("validateUserInterfaceItem:"), function $CPTextField__validateUserInterfaceItem_(self, _cmd, anItem)
{
    var theAction = objj_msgSend(anItem, "action");
    if (!objj_msgSend(self, "isEditable") && (theAction == sel_getUid("cut:") || theAction == sel_getUid("paste:") || theAction == sel_getUid("delete:")))
        return NO;
    if (!objj_msgSend(self, "isEditable"))
        return YES;
    if (theAction == sel_getUid("copy:") || theAction == sel_getUid("cut:") || theAction == sel_getUid("delete:"))
        return objj_msgSend(self, "selectedRange").length;
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("_isWithinUsablePlatformRect"), function $CPTextField___isWithinUsablePlatformRect(self, _cmd)
{
    var wind = objj_msgSend(self, "window");
    if (!wind)
        return NO;
    var frame = objj_msgSend(self, "convertRectToBase:", objj_msgSend(self, "bounds")),
        usableRect = objj_msgSend(objj_msgSend(wind, "platformWindow"), "usableContentFrame");
    frame.origin = objj_msgSend(wind, "convertBaseToGlobal:", frame.origin);
    return CGRectGetMinX(frame) >= CGRectGetMinX(usableRect) && CGRectGetMaxX(frame) <= CGRectGetMaxX(usableRect) && CGRectGetMinY(frame) >= CGRectGetMinY(usableRect) && CGRectGetMaxY(frame) <= CGRectGetMaxY(usableRect);
}
,["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPTextField___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPValueBinding)
        return objj_msgSend(_CPTextFieldValueBinder, "class");
    else if (objj_msgSend(aBinding, "hasPrefix:", CPDisplayPatternValueBinding))
        return objj_msgSend(_CPTextFieldPatternValueBinder, "class");
    else if (objj_msgSend(aBinding, "hasPrefix:", CPEditableBinding))
        return objj_msgSend(CPMultipleValueAndBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPTextField").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"), function $CPTextField__textFieldWithStringValue_placeholder_width_(self, _cmd, aStringValue, aPlaceholder, aWidth)
{
    return objj_msgSend(self, "textFieldWithStringValue:placeholder:width:theme:", aStringValue, aPlaceholder, aWidth, objj_msgSend(CPTheme, "defaultTheme"));
}
,["CPTextField","CPString","CPString","float"]), new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"), function $CPTextField__textFieldWithStringValue_placeholder_width_theme_(self, _cmd, aStringValue, aPlaceholder, aWidth, aTheme)
{
    var textField = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, aWidth, 29.0));
    objj_msgSend(textField, "setTheme:", aTheme);
    objj_msgSend(textField, "setStringValue:", aStringValue);
    objj_msgSend(textField, "setPlaceholderString:", aPlaceholder);
    objj_msgSend(textField, "setBordered:", YES);
    objj_msgSend(textField, "setBezeled:", YES);
    objj_msgSend(textField, "setEditable:", YES);
    objj_msgSend(textField, "sizeToFit");
    return textField;
}
,["CPTextField","CPString","CPString","float","CPTheme"]), new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"), function $CPTextField__roundedTextFieldWithStringValue_placeholder_width_(self, _cmd, aStringValue, aPlaceholder, aWidth)
{
    return objj_msgSend(self, "roundedTextFieldWithStringValue:placeholder:width:theme:", aStringValue, aPlaceholder, aWidth, objj_msgSend(CPTheme, "defaultTheme"));
}
,["CPTextField","CPString","CPString","float"]), new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"), function $CPTextField__roundedTextFieldWithStringValue_placeholder_width_theme_(self, _cmd, aStringValue, aPlaceholder, aWidth, aTheme)
{
    var textField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, aWidth, 29.0));
    objj_msgSend(textField, "setTheme:", aTheme);
    objj_msgSend(textField, "setStringValue:", aStringValue);
    objj_msgSend(textField, "setPlaceholderString:", aPlaceholder);
    objj_msgSend(textField, "setBezelStyle:", CPTextFieldRoundedBezel);
    objj_msgSend(textField, "setBordered:", YES);
    objj_msgSend(textField, "setBezeled:", YES);
    objj_msgSend(textField, "setEditable:", YES);
    objj_msgSend(textField, "sizeToFit");
    return textField;
}
,["CPTextField","CPString","CPString","float","CPTheme"]), new objj_method(sel_getUid("labelWithTitle:"), function $CPTextField__labelWithTitle_(self, _cmd, aTitle)
{
    return objj_msgSend(self, "labelWithTitle:theme:", aTitle, objj_msgSend(CPTheme, "defaultTheme"));
}
,["CPTextField","CPString"]), new objj_method(sel_getUid("labelWithTitle:theme:"), function $CPTextField__labelWithTitle_theme_(self, _cmd, aTitle, aTheme)
{
    var textField = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    objj_msgSend(textField, "setStringValue:", aTitle);
    objj_msgSend(textField, "sizeToFit");
    return textField;
}
,["CPTextField","CPString","CPTheme"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPTextField__defaultThemeClass(self, _cmd)
{
    return "textfield";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPTextField__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CGInsetMakeZero(), "bezel-inset", CGInsetMake(1.0, 0.0, 0.0, 0.0), "content-inset", objj_msgSend(CPNull, "null"), "bezel-color");
}
,["CPDictionary"])]);
}var secureStringForString = function(aString)
{
    if (!aString)
        return "";
    return (Array(aString.length + 1)).join(CPSecureTextFieldCharacter);
};
var CPTextFieldIsEditableKey = "CPTextFieldIsEditableKey",
    CPTextFieldIsSelectableKey = "CPTextFieldIsSelectableKey",
    CPTextFieldIsBorderedKey = "CPTextFieldIsBorderedKey",
    CPTextFieldIsBezeledKey = "CPTextFieldIsBezeledKey",
    CPTextFieldBezelStyleKey = "CPTextFieldBezelStyleKey",
    CPTextFieldDrawsBackgroundKey = "CPTextFieldDrawsBackgroundKey",
    CPTextFieldLineBreakModeKey = "CPTextFieldLineBreakModeKey",
    CPTextFieldAlignmentKey = "CPTextFieldAlignmentKey",
    CPTextFieldBackgroundColorKey = "CPTextFieldBackgroundColorKey",
    CPTextFieldPlaceholderStringKey = "CPTextFieldPlaceholderStringKey";
{
var the_class = objj_getClass("CPTextField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTextField__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "setEditable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldIsEditableKey));
        objj_msgSend(self, "setSelectable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldIsSelectableKey));
        objj_msgSend(self, "setDrawsBackground:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldDrawsBackgroundKey));
        objj_msgSend(self, "setTextFieldBackgroundColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTextFieldBackgroundColorKey));
        objj_msgSend(self, "setLineBreakMode:", objj_msgSend(aCoder, "decodeIntForKey:", CPTextFieldLineBreakModeKey));
        objj_msgSend(self, "setAlignment:", objj_msgSend(aCoder, "decodeIntForKey:", CPTextFieldAlignmentKey));
        objj_msgSend(self, "setPlaceholderString:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTextFieldPlaceholderStringKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTextField__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isEditable, CPTextFieldIsEditableKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isSelectable, CPTextFieldIsSelectableKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._drawsBackground, CPTextFieldDrawsBackgroundKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._textFieldBackgroundColor, CPTextFieldBackgroundColorKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", objj_msgSend(self, "lineBreakMode"), CPTextFieldLineBreakModeKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", objj_msgSend(self, "alignment"), CPTextFieldAlignmentKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._placeholderString, CPTextFieldPlaceholderStringKey);
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPTextFieldValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:forBinding:"), function $_CPTextFieldValueBinder___updatePlaceholdersWithOptions_forBinding_(self, _cmd, options, aBinding)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTextFieldValueBinder").super_class }, "_updatePlaceholdersWithOptions:", options);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", "Multiple Values", CPMultipleValuesMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", "No Selection", CPNoSelectionMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", "Not Applicable", CPNotApplicableMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", "", CPNullMarker, YES);
}
,["void","CPDictionary","CPString"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPTextFieldValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    objj_msgSend(self._source, "setPlaceholderString:", aValue);
    objj_msgSend(self._source, "setObjectValue:", nil);
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $_CPTextFieldValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    if (!aValue || aValue.isa && objj_msgSend(aValue, "isMemberOfClass:", CPNull))
        objj_msgSend(self._source, "setPlaceholderString:", objj_msgSend(self, "_placeholderForMarker:", CPNullMarker));
    objj_msgSend(self._source, "setObjectValue:", aValue);
}
,["void","id","CPString"])]);
}{var the_class = objj_allocateClassPair(CPValueWithPatternBinding, "_CPTextFieldPatternValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPTextFieldPatternValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    objj_msgSend(self._source, "setPlaceholderString:", aValue);
    objj_msgSend(self._source, "setObjectValue:", nil);
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $_CPTextFieldPatternValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    if (!aValue || aValue.isa && objj_msgSend(aValue, "isMemberOfClass:", CPNull))
        objj_msgSend(self._source, "setPlaceholderString:", objj_msgSend(self, "_placeholderForMarker:", CPNullMarker));
    objj_msgSend(self._source, "setObjectValue:", aValue);
}
,["void","id","CPString"])]);
}