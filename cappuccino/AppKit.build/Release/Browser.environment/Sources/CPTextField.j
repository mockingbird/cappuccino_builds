@STATIC;1.0;i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.ji;8;CPText.ji;20;CPWindow_Constants.ji;21;_CPImageAndTextView.jt;86360;objj_executeFile("CPControl.j", YES);objj_executeFile("CPStringDrawing.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPWindow_Constants.j", YES);objj_executeFile("_CPImageAndTextView.j", YES);{var the_protocol = objj_allocateProtocol("CPTextFieldDelegate");
var aProtocol = objj_getProtocol("CPControlTextEditingDelegate");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPTextFieldDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}var CPTextFieldDelegate_control_didFailToFormatString_errorDescription_ = 1 << 1;
CPTextFieldSquareBezel = 0;
CPTextFieldRoundedBezel = 1;
CPTextFieldDidFocusNotification = "CPTextFieldDidFocusNotification";
CPTextFieldDidBlurNotification = "CPTextFieldDidBlurNotification";
var CPTextFieldDOMCurrentElement = nil,
    CPTextFieldDOMTextAreaElement = nil,
    CPTextFieldDOMStandardInputElement = nil,
    CPTextFieldDOMPasswordInputElement = nil,
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
    var ownerWindow = (owner == null ? null : owner.isa.objj_msgSend0(owner, "window"));
    if (!resigning && (ownerWindow == null ? null : ownerWindow.isa.objj_msgSend0(ownerWindow, "isKeyWindow")))
    {
        if ((owner == null ? null : owner.isa.objj_msgSend0(owner, "_isWithinUsablePlatformRect")))
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
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
    var ___r1;
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isEditing"), new objj_ivar("_isEditable"), new objj_ivar("_isSelectable"), new objj_ivar("_isSecure"), new objj_ivar("_willBecomeFirstResponderByClick"), new objj_ivar("_invokedByUserEvent"), new objj_ivar("_drawsBackground"), new objj_ivar("_textFieldBackgroundColor"), new objj_ivar("_placeholderString"), new objj_ivar("_stringValue"), new objj_ivar("_delegate"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_bezelStyle"), new objj_ivar("_isBordered"), new objj_ivar("_usesSingleLineMode"), new objj_ivar("_wraps"), new objj_ivar("_scrolls")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setControlSize:"), function $CPTextField__setControlSize_(self, _cmd, aControlSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "setControlSize:", aControlSize);
    if (self.isa.objj_msgSend0(self, "isBezeled"))
        self.isa.objj_msgSend0(self, "_sizeToControlSize");
}
,["void","CPControlSize"]), new objj_method(sel_getUid("_inputElement"), function $CPTextField___inputElement(self, _cmd)
{
    if (!CPTextFieldDOMTextAreaElement)
    {
        CPTextFieldDOMTextAreaElement = document.createElement("textarea");
        CPTextFieldDOMTextAreaElement.style.position = "absolute";
        CPTextFieldDOMTextAreaElement.style.border = "0px";
        CPTextFieldDOMTextAreaElement.style.padding = "0px";
        CPTextFieldDOMTextAreaElement.style.margin = "0px";
        CPTextFieldDOMTextAreaElement.style.background = "transparent";
        CPTextFieldDOMTextAreaElement.style.outline = "none";
        CPTextFieldDOMTextAreaElement.style.resize = "none";
        CPTextFieldDOMTextAreaElement.style.overflow = "hidden";
        CPTextFieldDOMTextAreaElement.spellcheck = NO;
    }
    if (!CPTextFieldDOMStandardInputElement)
    {
        CPTextFieldDOMStandardInputElement = document.createElement("input");
        CPTextFieldDOMStandardInputElement.style.position = "absolute";
        CPTextFieldDOMStandardInputElement.style.border = "0px";
        CPTextFieldDOMStandardInputElement.style.padding = "0px";
        CPTextFieldDOMStandardInputElement.style.margin = "0px";
        CPTextFieldDOMStandardInputElement.style.whiteSpace = "pre";
        CPTextFieldDOMStandardInputElement.style.background = "transparent";
        CPTextFieldDOMStandardInputElement.style.outline = "none";
        CPTextFieldDOMStandardInputElement.spellcheck = NO;
    }
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
        CPTextFieldDOMPasswordInputElement.spellcheck = NO;
    }
    if (!CPTextFieldBlurHandler)
    {
        CPTextFieldBlurHandler = function(anEvent)
        {
            return CPTextFieldBlurFunction(anEvent, CPTextFieldInputOwner, CPTextFieldInputOwner ? CPTextFieldInputOwner._DOMElement : nil, CPTextFieldDOMCurrentElement, CPTextFieldInputResigning, function(__input) { if (arguments.length) return CPTextFieldInputDidBlur = __input; return CPTextFieldInputDidBlur; });
        };
    }
    if (!CPTextFieldInputFunction)
    {
        if (!CPFeatureIsCompatible(CPInputOnInputEventFeature))
            return;
        CPTextFieldInputFunction = function(anEvent)
        {
            if (!CPTextFieldInputOwner)
                return;
            var cappEvent = CPEvent.isa.objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyUp, CGPointMakeZero(), 0, CPEvent.isa.objj_msgSend0(CPEvent, "currentTimestamp"), ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "keyWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "windowNumber")), nil, nil, nil, NO, nil);
            (CPTextFieldInputOwner == null ? null : CPTextFieldInputOwner.isa.objj_msgSend1(CPTextFieldInputOwner, "keyUp:", cappEvent));
            ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
            var ___r1;
        };
        CPTextFieldDOMPasswordInputElement.oninput = CPTextFieldInputFunction;
        CPTextFieldDOMPasswordInputElement.onblur = CPTextFieldBlurHandler;
        CPTextFieldDOMStandardInputElement.oninput = CPTextFieldInputFunction;
        CPTextFieldDOMPasswordInputElement.onblur = CPTextFieldBlurHandler;
        CPTextFieldDOMTextAreaElement.oninput = CPTextFieldInputFunction;
        CPTextFieldDOMTextAreaElement.onblur = CPTextFieldBlurHandler;
    }
    if (self.isa.objj_msgSend0(self, "isSecure"))
        CPTextFieldDOMCurrentElement = CPTextFieldDOMPasswordInputElement;
    else if (self._usesSingleLineMode)
        CPTextFieldDOMCurrentElement = CPTextFieldDOMStandardInputElement;
    else
        CPTextFieldDOMCurrentElement = CPTextFieldDOMTextAreaElement;
    return CPTextFieldDOMCurrentElement;
}
,["DOMElement"]), new objj_method(sel_getUid("initWithFrame:"), function $CPTextField__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setStringValue:", ""));
        (self == null ? null : self.isa.objj_msgSend1(self, "setPlaceholderString:", ""));
        self._sendActionOn = CPKeyUpMask | CPKeyDownMask;
        (self == null ? null : self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", CPLeftTextAlignment, "alignment"));
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
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateEditable);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateEditable);
    if (!(shouldBeEditable && !self.isa.objj_msgSend0(self, "isSelectable")) && ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) === self)
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", nil));
    if (shouldBeEditable)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateEditable);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateEditable);
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPTextField__isEditable(self, _cmd)
{
    return self._isEditable;
}
,["BOOL"]), new objj_method(sel_getUid("setEnabled:"), function $CPTextField__setEnabled_(self, _cmd, shouldBeEnabled)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "setEnabled:", shouldBeEnabled);
    if (!shouldBeEnabled && ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) === self)
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", nil));
    var ___r1;
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
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateBezeled);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateBezeled);
}
,["void","BOOL"]), new objj_method(sel_getUid("isBezeled"), function $CPTextField__isBezeled(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateBezeled);
}
,["BOOL"]), new objj_method(sel_getUid("setBezelStyle:"), function $CPTextField__setBezelStyle_(self, _cmd, aBezelStyle)
{
    var shouldBeRounded = aBezelStyle === CPTextFieldRoundedBezel;
    if (shouldBeRounded)
        self.isa.objj_msgSend1(self, "setThemeState:", CPTextFieldStateRounded);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPTextFieldStateRounded);
}
,["void","CPTextFieldBezelStyle"]), new objj_method(sel_getUid("bezelStyle"), function $CPTextField__bezelStyle(self, _cmd)
{
    if (self.isa.objj_msgSend1(self, "hasThemeState:", CPTextFieldStateRounded))
        return CPTextFieldRoundedBezel;
    return CPTextFieldSquareBezel;
}
,["CPTextFieldBezelStyle"]), new objj_method(sel_getUid("setBordered:"), function $CPTextField__setBordered_(self, _cmd, shouldBeBordered)
{
    if (shouldBeBordered)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateBordered);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateBordered);
}
,["void","BOOL"]), new objj_method(sel_getUid("isBordered"), function $CPTextField__isBordered(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateBordered);
}
,["BOOL"]), new objj_method(sel_getUid("setDrawsBackground:"), function $CPTextField__setDrawsBackground_(self, _cmd, shouldDrawBackground)
{
    if (self._drawsBackground == shouldDrawBackground)
        return;
    self._drawsBackground = shouldDrawBackground;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
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
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPColor"]), new objj_method(sel_getUid("textFieldBackgroundColor"), function $CPTextField__textFieldBackgroundColor(self, _cmd)
{
    return self._textFieldBackgroundColor;
}
,["CPColor"]), new objj_method(sel_getUid("_setUsesSingleLineMode:"), function $CPTextField___setUsesSingleLineMode_(self, _cmd, aFlag)
{
    self._usesSingleLineMode = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("_setWraps:"), function $CPTextField___setWraps_(self, _cmd, aFlag)
{
    self._wraps = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("_setScrolls:"), function $CPTextField___setScrolls_(self, _cmd, aFlag)
{
    self._scrolls = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPTextField__acceptsFirstResponder(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "isEnabled") && (self.isa.objj_msgSend0(self, "isEditable") || self.isa.objj_msgSend0(self, "isSelectable")) && self.isa.objj_msgSend0(self, "_isWithinUsablePlatformRect");
}
,["BOOL"]), new objj_method(sel_getUid("becomeFirstResponder"), function $CPTextField__becomeFirstResponder(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled") || !objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "becomeFirstResponder"))
        return NO;
    self.isa.objj_msgSend1(self, "_setObserveWindowKeyNotifications:", YES);
    self._isEditing = NO;
    if (((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isKeyWindow")) && self.isa.objj_msgSend0(self, "isEditable"))
        return self.isa.objj_msgSend0(self, "_becomeFirstKeyResponder");
    return YES;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_becomeFirstKeyResponder"), function $CPTextField___becomeFirstKeyResponder(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "_isWithinUsablePlatformRect"))
        return NO;
    if (!self.isa.objj_msgSend0(self, "isEditable"))
        return NO;
    self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateEditing);
    self.isa.objj_msgSend0(self, "_updatePlaceholderState");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self._stringValue = self.isa.objj_msgSend0(self, "stringValue");
    self.isa.objj_msgSend0(self, "_setCSSStyleForInputElement");
    var element = self.isa.objj_msgSend0(self, "_inputElement");
    element.value = self._stringValue;
    self._DOMElement.appendChild(element);
    CPTextFieldInputIsActive = YES;
    if (document.attachEvent)
    {
        CPTextFieldCachedSelectStartFunction = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.onselectstart;
        CPTextFieldCachedDragFunction = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.ondrag;
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.ondrag = function()
        {
        };
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.onselectstart = function()
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
            self.isa.objj_msgSend2(self, "_selectText:immediately:", self, YES);
        self._willBecomeFirstResponderByClick = NO;
        self.isa.objj_msgSend1(self, "textDidFocus:", CPNotification.isa.objj_msgSend3(CPNotification, "notificationWithName:object:userInfo:", CPTextFieldDidFocusNotification, self, nil));
    }, 0.0);
    return YES;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_setCSSStyleForInputElement"), function $CPTextField___setCSSStyleForInputElement(self, _cmd)
{
    var element = self.isa.objj_msgSend0(self, "_inputElement"),
        font = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "font"),
        lineHeight = (font == null ? null : font.isa.objj_msgSend0(font, "defaultLineHeightForFont")),
        contentRect = self.isa.objj_msgSend1(self, "contentRectForBounds:", self.isa.objj_msgSend0(self, "bounds")),
        verticalAlign = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "vertical-alignment"),
        left = CGRectGetMinX(contentRect);
    if (CPFeatureIsCompatible(CPInput1PxLeftPadding))
        left -= 1;
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
    if (self.isa.objj_msgSend1(self, "hasThemeState:", CPTextFieldStatePlaceholder))
        element.style.color = ((___r1 = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "text-color", CPTextFieldStatePlaceholder)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cssString"));
    else
        element.style.color = ((___r1 = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "text-color", CPThemeStateEditing)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cssString"));
    switch(self.isa.objj_msgSend0(self, "alignment")) {
    case CPCenterTextAlignment:
        element.style.textAlign = "center";
        break;
    case CPRightTextAlignment:
        element.style.textAlign = "right";
        break;
default:
        element.style.textAlign = "left";
    }
    var isTextArea = element.nodeName.toUpperCase() == "TEXTAREA";
    element.style.zIndex = 1000;
    element.style.top = topPoint;
    element.style.lineHeight = ROUND(lineHeight) + "px";
    element.style.height = isTextArea ? CGRectGetHeight(contentRect) + "px" : ROUND(lineHeight) + "px";
    element.style.width = CGRectGetWidth(contentRect) + "px";
    element.style.left = left + "px";
    element.style.verticalAlign = "top";
    element.style.cursor = "auto";
    element.style.font = (font == null ? null : font.isa.objj_msgSend0(font, "cssString"));
    if (isTextArea)
        element.style.whiteSpace = self._wraps ? "pre" : "nowrap";
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPTextField__resignFirstResponder(self, _cmd)
{
    if (self._isEditing && CPTextFieldInputOwner === self)
    {
        var element = self.isa.objj_msgSend0(self, "_inputElement"),
            newValue = element.value,
            error = "";
        if (newValue !== self._stringValue)
        {
            self.isa.objj_msgSend1(self, "_setStringValue:", newValue);
        }
        if (self.isa.objj_msgSend1(self, "_valueIsValid:", newValue) === NO)
        {
            element.focus();
            return NO;
        }
    }
    self.isa.objj_msgSend1(self, "_setObserveWindowKeyNotifications:", NO);
    self.isa.objj_msgSend0(self, "_resignFirstKeyResponder");
    self._isEditing = NO;
    if (self.isa.objj_msgSend0(self, "isEditable"))
    {
        self.isa.objj_msgSend1(self, "textDidEndEditing:", CPNotification.isa.objj_msgSend3(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidEndEditingNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self.isa.objj_msgSend0(self, "_currentTextMovement"), "CPTextMovement")));
        if (self.isa.objj_msgSend0(self, "sendsActionOnEndEditing"))
            self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
    }
    self.isa.objj_msgSend1(self, "textDidBlur:", CPNotification.isa.objj_msgSend3(CPNotification, "notificationWithName:object:userInfo:", CPTextFieldDidBlurNotification, self, nil));
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_resignFirstKeyResponder"), function $CPTextField___resignFirstKeyResponder(self, _cmd)
{
    self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateEditing);
    self._stringValue = self.isa.objj_msgSend0(self, "stringValue");
    self._willBecomeFirstResponderByClick = NO;
    self.isa.objj_msgSend0(self, "_updatePlaceholderState");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var element = self.isa.objj_msgSend0(self, "_inputElement");
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
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.ondrag = CPTextFieldCachedDragFunction;
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.onselectstart = CPTextFieldCachedSelectStartFunction;
        CPTextFieldCachedSelectStartFunction = nil;
        CPTextFieldCachedDragFunction = nil;
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_setObserveWindowKeyNotifications:"), function $CPTextField___setObserveWindowKeyNotifications_(self, _cmd, shouldObserve)
{
    if (shouldObserve)
    {
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_windowDidResignKey:"), CPWindowDidResignKeyNotification, self.isa.objj_msgSend0(self, "window")));
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_windowDidBecomeKey:"), CPWindowDidBecomeKeyNotification, self.isa.objj_msgSend0(self, "window")));
    }
    else
    {
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, CPWindowDidResignKeyNotification, self.isa.objj_msgSend0(self, "window")));
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, CPWindowDidBecomeKeyNotification, self.isa.objj_msgSend0(self, "window")));
    }
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("_removeObservers"), function $CPTextField___removeObservers(self, _cmd)
{
    if (!self._isObserving)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "_removeObservers");
    self.isa.objj_msgSend1(self, "_setObserveWindowKeyNotifications:", NO);
}
,["void"]), new objj_method(sel_getUid("_addObservers"), function $CPTextField___addObservers(self, _cmd)
{
    if (self._isObserving)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "_addObservers");
    if (self.isa.objj_msgSend0(self, "window") === self)
        self.isa.objj_msgSend1(self, "_setObserveWindowKeyNotifications:", YES);
}
,["void"]), new objj_method(sel_getUid("_windowDidResignKey:"), function $CPTextField___windowDidResignKey_(self, _cmd, aNotification)
{
    if (!((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isKeyWindow")))
        self.isa.objj_msgSend0(self, "_resignFirstKeyResponder");
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("_windowDidBecomeKey:"), function $CPTextField___windowDidBecomeKey_(self, _cmd, aNotification)
{
    if (!(self.isa.objj_msgSend0(self, "isEnabled") && self.isa.objj_msgSend0(self, "isEditable")))
        return;
    var wind = self.isa.objj_msgSend0(self, "window");
    if ((wind == null ? null : wind.isa.objj_msgSend0(wind, "isKeyWindow")) && (wind == null ? null : wind.isa.objj_msgSend0(wind, "firstResponder")) === self)
        if (!self.isa.objj_msgSend0(self, "_becomeFirstKeyResponder"))
            (wind == null ? null : wind.isa.objj_msgSend1(wind, "makeFirstResponder:", nil));
}
,["void","CPNotification"]), new objj_method(sel_getUid("_valueIsValid:"), function $CPTextField___valueIsValid_(self, _cmd, aValue)
{
    var error = "";
    if (self.isa.objj_msgSend3(self, "_setStringValue:isNewValue:errorDescription:", aValue, NO, function(__input) { if (arguments.length) return error = __input; return error; }) === NO)
    {
        var acceptInvalidValue = NO;
        if (self._implementedDelegateMethods & CPTextFieldDelegate_control_didFailToFormatString_errorDescription_)
            acceptInvalidValue = ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "control:didFailToFormatString:errorDescription:", self, aValue, error));
        if (acceptInvalidValue === NO)
            return NO;
    }
    return YES;
    var ___r1;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("needsPanelToBecomeKey"), function $CPTextField__needsPanelToBecomeKey(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "acceptsFirstResponder");
}
,["BOOL"]), new objj_method(sel_getUid("acceptsFirstMouse:"), function $CPTextField__acceptsFirstMouse_(self, _cmd, anEvent)
{
    return self.isa.objj_msgSend0(self, "acceptsFirstResponder");
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("_didEdit"), function $CPTextField___didEdit(self, _cmd)
{
    if (!self._isEditing)
    {
        self._isEditing = YES;
        self.isa.objj_msgSend1(self, "textDidBeginEditing:", CPNotification.isa.objj_msgSend3(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidBeginEditingNotification, self, nil));
    }
    self.isa.objj_msgSend1(self, "textDidChange:", CPNotification.isa.objj_msgSend3(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidChangeNotification, self, nil));
}
,["void"]), new objj_method(sel_getUid("mouseMoved:"), function $CPTextField__mouseMoved_(self, _cmd, anEvent)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "mouseMoved:", anEvent);
    self.isa.objj_msgSend1(self, "_updateCursorForEvent:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPTextField__mouseDown_(self, _cmd, anEvent)
{
    if (self.isa.objj_msgSend0(self, "isEditable") && self.isa.objj_msgSend0(self, "isEnabled"))
    {
        self._willBecomeFirstResponderByClick = YES;
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self));
    }
    else if (self.isa.objj_msgSend0(self, "isSelectable"))
    {
        if (document.attachEvent)
        {
            CPTextFieldCachedSelectStartFunction = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.onselectstart;
            CPTextFieldCachedDragFunction = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.ondrag;
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.ondrag = function()
            {
            };
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.onselectstart = function()
            {
            };
        }
        return ((___r1 = ((___r2 = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    else
        return ((___r1 = self.isa.objj_msgSend0(self, "nextResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseDown:", anEvent));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPTextField__mouseUp_(self, _cmd, anEvent)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled") || !(self.isa.objj_msgSend0(self, "isSelectable") || self.isa.objj_msgSend0(self, "isEditable")))
        ((___r1 = self.isa.objj_msgSend0(self, "nextResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseUp:", anEvent));
    else if (self.isa.objj_msgSend0(self, "isSelectable"))
    {
        if (document.attachEvent)
        {
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.ondrag = CPTextFieldCachedDragFunction;
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow"))._DOMBodyElement.onselectstart = CPTextFieldCachedSelectStartFunction;
            CPTextFieldCachedSelectStartFunction = nil;
            CPTextFieldCachedDragFunction = nil;
        }
        if (((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "clickCount")) === 3)
        {
            self.isa.objj_msgSend1(self, "selectText:", nil);
            return;
        }
        return ((___r1 = ((___r2 = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $CPTextField__mouseDragged_(self, _cmd, anEvent)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled") || !(self.isa.objj_msgSend0(self, "isSelectable") || self.isa.objj_msgSend0(self, "isEditable")))
        ((___r1 = self.isa.objj_msgSend0(self, "nextResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseDragged:", anEvent));
    else if (self.isa.objj_msgSend0(self, "isSelectable"))
        return ((___r1 = ((___r2 = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("keyUp:"), function $CPTextField__keyUp_(self, _cmd, anEvent)
{
    if (!(self.isa.objj_msgSend0(self, "isEnabled") && self.isa.objj_msgSend0(self, "isEditable")))
        return;
    var newValue = self.isa.objj_msgSend0(self, "_inputElement").value;
    if (newValue !== self._stringValue)
    {
        self.isa.objj_msgSend1(self, "_setStringValue:", newValue);
        self.isa.objj_msgSend0(self, "_didEdit");
    }
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("keyDown:"), function $CPTextField__keyDown_(self, _cmd, anEvent)
{
    if (!(self.isa.objj_msgSend0(self, "isEnabled") && self.isa.objj_msgSend0(self, "isEditable")))
        return;
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    self._invokedByUserEvent = !!anEvent._DOMEvent;
    self.isa.objj_msgSend1(self, "interpretKeyEvents:", [anEvent]);
    self._invokedByUserEvent = NO;
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("doCommandBySelector:"), function $CPTextField__doCommandBySelector_(self, _cmd, aSelector)
{
    if (self.isa.objj_msgSend1(self, "respondsToSelector:", aSelector))
        self.isa.objj_msgSend1(self, "performSelector:", aSelector);
}
,["void","SEL"]), new objj_method(sel_getUid("insertNewline:"), function $CPTextField__insertNewline_(self, _cmd, sender)
{
    if (!(self.isa.objj_msgSend0(self, "isEnabled") && self.isa.objj_msgSend0(self, "isEditable")))
        return;
    var newValue = self.isa.objj_msgSend0(self, "_inputElement").value;
    if (newValue !== self._stringValue)
    {
        self.isa.objj_msgSend1(self, "_setStringValue:", newValue);
        self.isa.objj_msgSend0(self, "_didEdit");
    }
    if (self.isa.objj_msgSend1(self, "_valueIsValid:", self._stringValue))
    {
        if (self._isEditing)
        {
            self._isEditing = NO;
            self.isa.objj_msgSend1(self, "textDidEndEditing:", CPNotification.isa.objj_msgSend3(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidEndEditingNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self.isa.objj_msgSend0(self, "_currentTextMovement"), "CPTextMovement")));
        }
        if (!self.isa.objj_msgSend0(self, "action") || self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target")))
        {
            self.isa.objj_msgSend1(self, "selectAll:", nil);
        }
    }
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", NO));
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("insertNewlineIgnoringFieldEditor:"), function $CPTextField__insertNewlineIgnoringFieldEditor_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "_insertCharacterIgnoringFieldEditor:", CPNewlineCharacter);
}
,["void","id"]), new objj_method(sel_getUid("insertTabIgnoringFieldEditor:"), function $CPTextField__insertTabIgnoringFieldEditor_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "_insertCharacterIgnoringFieldEditor:", CPTabCharacter);
}
,["void","id"]), new objj_method(sel_getUid("_insertCharacterIgnoringFieldEditor:"), function $CPTextField___insertCharacterIgnoringFieldEditor_(self, _cmd, aCharacter)
{
    if (!(self.isa.objj_msgSend0(self, "isEnabled") && self.isa.objj_msgSend0(self, "isEditable")))
        return;
    var oldValue = self._stringValue,
        range = self.isa.objj_msgSend0(self, "selectedRange"),
        element = self.isa.objj_msgSend0(self, "_inputElement");
    if (aCharacter != CPNewlineCharacter || element.nodeName.toUpperCase() != "TEXTAREA" || !CPFeatureIsCompatible(CPAltEnterTextAreaFeature))
        element.value = ((___r1 = element.value), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "stringByReplacingCharactersInRange:withString:", self.isa.objj_msgSend0(self, "selectedRange"), aCharacter));
    self.isa.objj_msgSend1(self, "_setStringValue:", element.value);
    if (oldValue !== self._stringValue)
    {
        self.isa.objj_msgSend0(self, "_didEdit");
    }
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("textDidBlur:"), function $CPTextField__textDidBlur_(self, _cmd, note)
{
    if ((note == null ? null : note.isa.objj_msgSend0(note, "object")) != self)
        return;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "postNotification:", note));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("textDidFocus:"), function $CPTextField__textDidFocus_(self, _cmd, note)
{
    if ((note == null ? null : note.isa.objj_msgSend0(note, "object")) != self)
        return;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "postNotification:", note));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("textDidChange:"), function $CPTextField__textDidChange_(self, _cmd, note)
{
    if ((note == null ? null : note.isa.objj_msgSend0(note, "object")) !== self)
        return;
    self.isa.objj_msgSend0(self, "_continuouslyReverseSetBinding");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "textDidChange:", note);
}
,["void","CPNotification"]), new objj_method(sel_getUid("_updateCursorForEvent:"), function $CPTextField___updateCursorForEvent_(self, _cmd, anEvent)
{
    var frame = CGRectMakeCopy(self.isa.objj_msgSend0(self, "frame")),
        contentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset");
    frame = ((___r1 = self.isa.objj_msgSend0(self, "superview")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertRectToBase:", CGRectInsetByInset(frame, contentInset)));
    if (self.isa.objj_msgSend0(self, "isEnabled") && (self.isa.objj_msgSend0(self, "isSelectable") || self.isa.objj_msgSend0(self, "isEditable")) && CGRectContainsPoint(frame, (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow"))))
    {
        self._DOMElement.style.cursor = "text";
    }
    else
    {
        self._DOMElement.style.cursor = "default";
    }
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("objectValue"), function $CPTextField__objectValue(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "objectValue");
}
,["id"]), new objj_method(sel_getUid("_setStringValue:"), function $CPTextField___setStringValue_(self, _cmd, aValue)
{
    return self.isa.objj_msgSend3(self, "_setStringValue:isNewValue:errorDescription:", aValue, YES, nil);
}
,["BOOL","CPString"]), new objj_method(sel_getUid("_setStringValue:isNewValue:errorDescription:"), function $CPTextField___setStringValue_isNewValue_errorDescription_(self, _cmd, aValue, isNewValue, anError)
{
    self._stringValue = aValue;
    var objectValue = aValue,
        formatter = self.isa.objj_msgSend0(self, "formatter"),
        result = YES;
    if (formatter)
    {
        var object = nil;
        if ((formatter == null ? null : formatter.isa.objj_msgSend3(formatter, "getObjectValue:forString:errorDescription:", function(__input) { if (arguments.length) return object = __input; return object; }, aValue, anError)))
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
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "objectValue");
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "setObjectValue:", objectValue);
        self.isa.objj_msgSend0(self, "_updatePlaceholderState");
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "objectValue");
    }
    return result;
}
,["BOOL","CPString","BOOL","CPStringRef"]), new objj_method(sel_getUid("setObjectValue:"), function $CPTextField__setObjectValue_(self, _cmd, aValue)
{
    self.isa.objj_msgSend2(self, "_setObjectValue:useFormatter:", aValue, YES);
}
,["void","id"]), new objj_method(sel_getUid("_setObjectValue:useFormatter:"), function $CPTextField___setObjectValue_useFormatter_(self, _cmd, aValue, useFormatter)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "setObjectValue:", aValue);
    var formatter = self.isa.objj_msgSend0(self, "formatter");
    if (useFormatter && formatter)
    {
        var formattedString = self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateEditing) ? (formatter == null ? null : formatter.isa.objj_msgSend1(formatter, "editingStringForObjectValue:", aValue)) : (formatter == null ? null : formatter.isa.objj_msgSend1(formatter, "stringForObjectValue:", aValue));
        if (formattedString === nil)
        {
            var value = nil;
            if ((formatter == null ? null : formatter.isa.objj_msgSend3(formatter, "getObjectValue:forString:errorDescription:", function(__input) { if (arguments.length) return value = __input; return value; }, "", nil)) === NO)
                value = undefined;
            objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "setObjectValue:", value);
            self._stringValue = value === nil || value === undefined ? "" : String(value);
        }
        else
            self._stringValue = formattedString;
    }
    else
        self._stringValue = self.isa.objj_msgSend0(self, "stringValue");
    if ((CPTextFieldInputOwner === self || ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) === self) && ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isKeyWindow")))
        self.isa.objj_msgSend0(self, "_inputElement").value = self._stringValue;
    self.isa.objj_msgSend0(self, "_updatePlaceholderState");
    var ___r1;
}
,["void","id","BOOL"]), new objj_method(sel_getUid("_updatePlaceholderState"), function $CPTextField___updatePlaceholderState(self, _cmd)
{
    if (!self._stringValue || self._stringValue.length === 0)
        self.isa.objj_msgSend1(self, "setThemeState:", CPTextFieldStatePlaceholder);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPTextFieldStatePlaceholder);
}
,["void"]), new objj_method(sel_getUid("setPlaceholderString:"), function $CPTextField__setPlaceholderString_(self, _cmd, aStringValue)
{
    if (self._placeholderString === aStringValue)
        return;
    self._placeholderString = aStringValue;
    if (self.isa.objj_msgSend1(self, "hasThemeState:", CPTextFieldStatePlaceholder))
    {
        self.isa.objj_msgSend0(self, "setNeedsLayout");
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    }
}
,["void","CPString"]), new objj_method(sel_getUid("placeholderString"), function $CPTextField__placeholderString(self, _cmd)
{
    return self._placeholderString;
}
,["CPString"]), new objj_method(sel_getUid("sizeToFit"), function $CPTextField__sizeToFit(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setFrameSize:", self.isa.objj_msgSend0(self, "_minimumFrameSize"));
}
,["void"]), new objj_method(sel_getUid("_minimumFrameSize"), function $CPTextField___minimumFrameSize(self, _cmd)
{
    var frameSize = self.isa.objj_msgSend0(self, "frameSize"),
        contentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset"),
        minSize = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "min-size"),
        maxSize = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "max-size"),
        lineBreakMode = self.isa.objj_msgSend0(self, "lineBreakMode"),
        text = self._stringValue || " ",
        textSize = CGSizeMakeCopy(frameSize),
        font = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "font");
    textSize.width -= contentInset.left + contentInset.right;
    textSize.height -= contentInset.top + contentInset.bottom;
    if (frameSize.width !== 0 && !self.isa.objj_msgSend0(self, "isBezeled") && (lineBreakMode === CPLineBreakByWordWrapping || lineBreakMode === CPLineBreakByCharWrapping))
    {
        textSize = (text == null ? null : text.isa.objj_msgSend2(text, "sizeWithFont:inWidth:", font, textSize.width));
    }
    else
    {
        textSize = (text == null ? null : text.isa.objj_msgSend1(text, "sizeWithFont:", font));
        textSize.width += 1;
    }
    textSize.height += 1;
    frameSize.height = textSize.height + contentInset.top + contentInset.bottom;
    if (self.isa.objj_msgSend0(self, "isBezeled"))
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
    self.isa.objj_msgSend2(self, "_selectText:immediately:", sender, NO);
}
,["void","id"]), new objj_method(sel_getUid("_selectText:immediately:"), function $CPTextField___selectText_immediately_(self, _cmd, sender, immediately)
{
    if (self.isa.objj_msgSend0(self, "isEditable") || self.isa.objj_msgSend0(self, "isSelectable"))
    {
        var wind = self.isa.objj_msgSend0(self, "window");
        if (self.isa.objj_msgSend0(self, "isEditable"))
        {
            var element = self.isa.objj_msgSend0(self, "_inputElement");
            if ((wind == null ? null : wind.isa.objj_msgSend0(wind, "firstResponder")) === self)
            {
                if (immediately)
                    element.select();
                else
                    window.setTimeout(function()
                    {
                        element.select();
                    }, 0);
            }
            else if (wind !== nil && (wind == null ? null : wind.isa.objj_msgSend1(wind, "makeFirstResponder:", self)))
                self.isa.objj_msgSend2(self, "_selectText:immediately:", sender, immediately);
        }
        else
        {
            self.isa.objj_msgSend1(self, "setSelectedRange:", CPMakeRange(0, self._stringValue.length));
        }
    }
}
,["void","id","BOOL"]), new objj_method(sel_getUid("copy:"), function $CPTextField__copy_(self, _cmd, sender)
{
    var stringToCopy = nil;
    if (self.isa.objj_msgSend0(self, "isEditable"))
    {
        var selectedRange = self.isa.objj_msgSend0(self, "selectedRange");
        if (selectedRange.length < 1)
            return;
        stringToCopy = ((___r1 = self._stringValue), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "substringWithRange:", selectedRange));
    }
    else
    {
        stringToCopy = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_selectedText"));
    }
    var pasteboard = (CPPasteboard == null ? null : CPPasteboard.isa.objj_msgSend0(CPPasteboard, "generalPasteboard"));
    (pasteboard == null ? null : pasteboard.isa.objj_msgSend2(pasteboard, "declareTypes:owner:", [CPStringPboardType], nil));
    (pasteboard == null ? null : pasteboard.isa.objj_msgSend2(pasteboard, "setString:forType:", stringToCopy, CPStringPboardType));
    if (CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("cut:"), function $CPTextField__cut_(self, _cmd, sender)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    self.isa.objj_msgSend1(self, "copy:", sender);
    if (!self.isa.objj_msgSend0(self, "isEditable"))
        return;
    if (!((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_platformIsEffectingCutOrPaste")))
    {
        self.isa.objj_msgSend1(self, "deleteBackward:", sender);
    }
    else
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
        if (!CPFeatureIsCompatible(CPInputOnInputEventFeature))
            CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("keyUp:"), nil, NO);
    }
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("paste:"), function $CPTextField__paste_(self, _cmd, sender)
{
    if (!(self.isa.objj_msgSend0(self, "isEnabled") && self.isa.objj_msgSend0(self, "isEditable")))
        return;
    if (!((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_platformIsEffectingCutOrPaste")))
    {
        var pasteboard = (CPPasteboard == null ? null : CPPasteboard.isa.objj_msgSend0(CPPasteboard, "generalPasteboard"));
        if (!((___r1 = (pasteboard == null ? null : pasteboard.isa.objj_msgSend0(pasteboard, "types"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", CPStringPboardType)))
            return;
        self.isa.objj_msgSend1(self, "deleteBackward:", sender);
        var selectedRange = self.isa.objj_msgSend0(self, "selectedRange"),
            pasteString = (pasteboard == null ? null : pasteboard.isa.objj_msgSend1(pasteboard, "stringForType:", CPStringPboardType)),
            newValue = ((___r1 = self._stringValue), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "stringByReplacingCharactersInRange:withString:", selectedRange, pasteString));
        self.isa.objj_msgSend1(self, "setStringValue:", newValue);
        self.isa.objj_msgSend0(self, "_didEdit");
        self.isa.objj_msgSend1(self, "setSelectedRange:", CPMakeRange(selectedRange.location + pasteString.length, 0));
    }
    else
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
        if (!CPFeatureIsCompatible(CPInputOnInputEventFeature))
            CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("keyUp:"), nil, NO);
    }
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("selectedRange"), function $CPTextField__selectedRange(self, _cmd)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) !== self)
        return CPMakeRange(0, 0);
    try    {
        var inputElement = self.isa.objj_msgSend0(self, "_inputElement"),
            selectionStart = inputElement.selectionStart,
            selectionEnd = inputElement.selectionEnd;
        if ((selectionStart == null ? null : selectionStart.isa.objj_msgSend1(selectionStart, "isKindOfClass:", CPNumber)))
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
    var ___r1;
}
,["CPRange"]), new objj_method(sel_getUid("setSelectedRange:"), function $CPTextField__setSelectedRange_(self, _cmd, aRange)
{
    if (!((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) === self)
        return;
    if (!self.isa.objj_msgSend0(self, "isEditable"))
    {
        var contentView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
        if (contentView)
            (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setSelectedRange:", aRange));
    }
    else
    {
        var inputElement = self.isa.objj_msgSend0(self, "_inputElement");
        try        {
            if (((___r1 = inputElement.selectionStart), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPNumber)))
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
    var ___r1;
}
,["void","CPRange"]), new objj_method(sel_getUid("selectAll:"), function $CPTextField__selectAll_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "selectText:", sender);
}
,["void","id"]), new objj_method(sel_getUid("deleteBackward:"), function $CPTextField__deleteBackward_(self, _cmd, sender)
{
    if (!(self.isa.objj_msgSend0(self, "isEnabled") && self.isa.objj_msgSend0(self, "isEditable")))
        return;
    var selectedRange = self.isa.objj_msgSend0(self, "selectedRange");
    if (selectedRange.length === 0)
    {
        if (selectedRange.location < 1)
            return;
        selectedRange.location -= 1;
        selectedRange.length += 1;
    }
    self.isa.objj_msgSend2(self, "_replaceCharactersInRange:withCharacters:", selectedRange, "");
}
,["void","id"]), new objj_method(sel_getUid("delete:"), function $CPTextField__delete_(self, _cmd, sender)
{
    if (!(self.isa.objj_msgSend0(self, "isEnabled") && self.isa.objj_msgSend0(self, "isEditable")))
        return;
    var selectedRange = self.isa.objj_msgSend0(self, "selectedRange");
    if (selectedRange.length < 1)
        return;
    self.isa.objj_msgSend2(self, "_replaceCharactersInRange:withCharacters:", selectedRange, "");
}
,["void","id"]), new objj_method(sel_getUid("deleteForward:"), function $CPTextField__deleteForward_(self, _cmd, sender)
{
    if (!(self.isa.objj_msgSend0(self, "isEnabled") && self.isa.objj_msgSend0(self, "isEditable")))
        return;
    var selectedRange = self.isa.objj_msgSend0(self, "selectedRange");
    if (selectedRange.length === 0)
    {
        if (selectedRange.location >= self._stringValue.length)
            return;
        selectedRange.length += 1;
    }
    self.isa.objj_msgSend2(self, "_replaceCharactersInRange:withCharacters:", selectedRange, "");
}
,["void","id"]), new objj_method(sel_getUid("_replaceCharactersInRange:withCharacters:"), function $CPTextField___replaceCharactersInRange_withCharacters_(self, _cmd, range, characters)
{
    var newValue = ((___r1 = self._stringValue), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "stringByReplacingCharactersInRange:withString:", range, characters));
    if (self._invokedByUserEvent)
    {
        self.isa.objj_msgSend1(self, "_setStringValue:", newValue);
    }
    else
    {
        self.isa.objj_msgSend2(self, "_setObjectValue:useFormatter:", newValue, NO);
        self.isa.objj_msgSend1(self, "setSelectedRange:", CPMakeRange(range.location, 0));
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", NO));
    }
    self.isa.objj_msgSend0(self, "_didEdit");
    var ___r1, ___r2;
}
,["void","CPRange","CPString"]), new objj_method(sel_getUid("setDelegate:"), function $CPTextField__setDelegate_(self, _cmd, aDelegate)
{
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (self._delegate)
    {
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPControlTextDidBeginEditingNotification, self));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPControlTextDidChangeNotification, self));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPControlTextDidEndEditingNotification, self));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPTextFieldDidFocusNotification, self));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPTextFieldDidBlurNotification, self));
    }
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("control:didFailToFormatString:errorDescription:"))))
        self._implementedDelegateMethods |= CPTextFieldDelegate_control_didFailToFormatString_errorDescription_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("controlTextDidBeginEditing:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("controlTextDidBeginEditing:"), CPControlTextDidBeginEditingNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("controlTextDidChange:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("controlTextDidChange:"), CPControlTextDidChangeNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("controlTextDidEndEditing:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("controlTextDidEndEditing:"), CPControlTextDidEndEditingNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("controlTextDidFocus:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("controlTextDidFocus:"), CPTextFieldDidFocusNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("controlTextDidBlur:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("controlTextDidBlur:"), CPTextFieldDidBlurNotification, self));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPTextField__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPTextField__contentRectForBounds_(self, _cmd, bounds)
{
    var contentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset");
    return CGRectInsetByInset(bounds, contentInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("bezelRectForBounds:"), function $CPTextField__bezelRectForBounds_(self, _cmd, bounds)
{
    var bezelInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-inset");
    return CGRectInsetByInset(bounds, bezelInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPTextField__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "bezel-view")
        return self.isa.objj_msgSend1(self, "bezelRectForBounds:", self.isa.objj_msgSend0(self, "bounds"));
    else if (aName === "content-view")
        return self.isa.objj_msgSend1(self, "contentRectForBounds:", self.isa.objj_msgSend0(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPTextField__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "bezel-view")
    {
        var view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        (view == null ? null : view.isa.objj_msgSend1(view, "setHitTests:", NO));
        return view;
    }
    else
    {
        var view = ((___r1 = _CPImageAndTextView.isa.objj_msgSend0(_CPImageAndTextView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        (view == null ? null : view.isa.objj_msgSend1(view, "setHitTests:", NO));
        return view;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "createEphemeralSubviewNamed:", aName);
    var ___r1;
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTextField__layoutSubviews(self, _cmd)
{
    var bezelView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    if (bezelView)
        (bezelView == null ? null : bezelView.isa.objj_msgSend1(bezelView, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-color")));
    var contentView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    if (contentView)
    {
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setHidden:", self._stringValue && self._stringValue.length > 0 && self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateEditing)));
        var string = "";
        if (self.isa.objj_msgSend1(self, "hasThemeState:", CPTextFieldStatePlaceholder))
            string = self.isa.objj_msgSend0(self, "placeholderString");
        else
        {
            string = self._stringValue;
            if (self.isa.objj_msgSend0(self, "isSecure"))
                string = secureStringForString(string);
        }
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setText:", string));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setTextColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-color")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setFont:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "font")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setAlignment:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "alignment")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setVerticalAlignment:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "vertical-alignment")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setLineBreakMode:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "line-break-mode")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setTextShadowColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-shadow-color")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setTextShadowOffset:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-shadow-offset")));
    }
    if (self._isEditing)
        self.isa.objj_msgSend0(self, "_setCSSStyleForInputElement");
}
,["void"]), new objj_method(sel_getUid("takeValueFromKeyPath:ofObjects:"), function $CPTextField__takeValueFromKeyPath_ofObjects_(self, _cmd, aKeyPath, objects)
{
    var count = objects.length,
        value = ((___r1 = objects[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", aKeyPath));
    self.isa.objj_msgSend1(self, "setStringValue:", value);
    self.isa.objj_msgSend1(self, "setPlaceholderString:", "");
    while (count-- > 1)
        if (value !== ((___r1 = objects[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", aKeyPath)))
        {
            self.isa.objj_msgSend1(self, "setPlaceholderString:", "Multiple Values");
            self.isa.objj_msgSend1(self, "setStringValue:", "");
        }
    var ___r1;
}
,["void","CPString","CPArray"]), new objj_method(sel_getUid("setTextColor:"), function $CPTextField__setTextColor_(self, _cmd, aColor)
{
    var placeholderColor = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "text-color", CPTextFieldStatePlaceholder);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "setTextColor:", aColor);
    self.isa.objj_msgSend3(self, "setValue:forThemeAttribute:inState:", placeholderColor, "text-color", CPTextFieldStatePlaceholder);
}
,["void","CPColor"]), new objj_method(sel_getUid("viewDidHide"), function $CPTextField__viewDidHide(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "viewDidHide");
    if (((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) === self)
        self.isa.objj_msgSend0(self, "_resignFirstKeyResponder");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("viewDidUnhide"), function $CPTextField__viewDidUnhide(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "viewDidUnhide");
    if (self.isa.objj_msgSend0(self, "isEditable") && ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) === self)
        self.isa.objj_msgSend0(self, "_becomeFirstKeyResponder");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("validateUserInterfaceItem:"), function $CPTextField__validateUserInterfaceItem_(self, _cmd, anItem)
{
    var theAction = (anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "action"));
    if (!self.isa.objj_msgSend0(self, "isEditable") && (theAction == sel_getUid("cut:") || theAction == sel_getUid("paste:") || theAction == sel_getUid("delete:")))
        return NO;
    if (!self.isa.objj_msgSend0(self, "isEditable"))
        return YES;
    if (theAction == sel_getUid("copy:") || theAction == sel_getUid("cut:") || theAction == sel_getUid("delete:"))
        return self.isa.objj_msgSend0(self, "selectedRange").length;
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("_isWithinUsablePlatformRect"), function $CPTextField___isWithinUsablePlatformRect(self, _cmd)
{
    var wind = self.isa.objj_msgSend0(self, "window");
    if (!wind)
        return NO;
    var frame = self.isa.objj_msgSend1(self, "convertRectToBase:", self.isa.objj_msgSend1(self, "contentRectForBounds:", self.isa.objj_msgSend0(self, "bounds"))),
        usableRect = ((___r1 = (wind == null ? null : wind.isa.objj_msgSend0(wind, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "usableContentFrame"));
    frame.origin = (wind == null ? null : wind.isa.objj_msgSend1(wind, "convertBaseToGlobal:", frame.origin));
    return CGRectGetMinX(frame) >= CGRectGetMinX(usableRect) && CGRectGetMaxX(frame) <= CGRectGetMaxX(usableRect) && CGRectGetMinY(frame) >= CGRectGetMinY(usableRect) && CGRectGetMaxY(frame) <= CGRectGetMaxY(usableRect);
    var ___r1;
}
,["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPTextField___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPValueBinding)
        return (_CPTextFieldValueBinder == null ? null : _CPTextFieldValueBinder.isa.objj_msgSend0(_CPTextFieldValueBinder, "class"));
    else if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPDisplayPatternValueBinding)))
        return (_CPTextFieldPatternValueBinder == null ? null : _CPTextFieldPatternValueBinder.isa.objj_msgSend0(_CPTextFieldPatternValueBinder, "class"));
    else if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPEditableBinding)))
        return CPMultipleValueAndBinding.isa.objj_msgSend0(CPMultipleValueAndBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPTextField").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"), function $CPTextField__textFieldWithStringValue_placeholder_width_(self, _cmd, aStringValue, aPlaceholder, aWidth)
{
    return self.isa.objj_msgSend(self, "textFieldWithStringValue:placeholder:width:theme:", aStringValue, aPlaceholder, aWidth, CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme"));
}
,["CPTextField","CPString","CPString","float"]), new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"), function $CPTextField__textFieldWithStringValue_placeholder_width_theme_(self, _cmd, aStringValue, aPlaceholder, aWidth, aTheme)
{
    var textField = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, aWidth, 29.0)));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setTheme:", aTheme));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setStringValue:", aStringValue));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setPlaceholderString:", aPlaceholder));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setBordered:", YES));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setBezeled:", YES));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setEditable:", YES));
    (textField == null ? null : textField.isa.objj_msgSend0(textField, "sizeToFit"));
    return textField;
    var ___r1;
}
,["CPTextField","CPString","CPString","float","CPTheme"]), new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"), function $CPTextField__roundedTextFieldWithStringValue_placeholder_width_(self, _cmd, aStringValue, aPlaceholder, aWidth)
{
    return self.isa.objj_msgSend(self, "roundedTextFieldWithStringValue:placeholder:width:theme:", aStringValue, aPlaceholder, aWidth, CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme"));
}
,["CPTextField","CPString","CPString","float"]), new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"), function $CPTextField__roundedTextFieldWithStringValue_placeholder_width_theme_(self, _cmd, aStringValue, aPlaceholder, aWidth, aTheme)
{
    var textField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, aWidth, 29.0)));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setTheme:", aTheme));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setStringValue:", aStringValue));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setPlaceholderString:", aPlaceholder));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setBezelStyle:", CPTextFieldRoundedBezel));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setBordered:", YES));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setBezeled:", YES));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setEditable:", YES));
    (textField == null ? null : textField.isa.objj_msgSend0(textField, "sizeToFit"));
    return textField;
    var ___r1;
}
,["CPTextField","CPString","CPString","float","CPTheme"]), new objj_method(sel_getUid("labelWithTitle:"), function $CPTextField__labelWithTitle_(self, _cmd, aTitle)
{
    return self.isa.objj_msgSend2(self, "labelWithTitle:theme:", aTitle, CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme"));
}
,["CPTextField","CPString"]), new objj_method(sel_getUid("labelWithTitle:theme:"), function $CPTextField__labelWithTitle_theme_(self, _cmd, aTitle, aTheme)
{
    var textField = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setStringValue:", aTitle));
    (textField == null ? null : textField.isa.objj_msgSend0(textField, "sizeToFit"));
    return textField;
    var ___r1;
}
,["CPTextField","CPString","CPTheme"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPTextField__defaultThemeClass(self, _cmd)
{
    return "textfield";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPTextField__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CGInsetMakeZero(), "bezel-inset", CGInsetMake(1.0, 0.0, 0.0, 0.0), "content-inset", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-color");
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
    CPTextFieldPlaceholderStringKey = "CPTextFieldPlaceholderStringKey",
    CPTextFieldUsesSingleLineMode = "CPTextFieldUsesSingleLineMode",
    CPTextFieldWraps = "CPTextFieldWraps",
    CPTextFieldScrolls = "CPTextFieldScrolls";
{
var the_class = objj_getClass("CPTextField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTextField__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setEditable:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTextFieldIsEditableKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setSelectable:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTextFieldIsSelectableKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDrawsBackground:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTextFieldDrawsBackgroundKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTextFieldBackgroundColor:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTextFieldBackgroundColorKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setLineBreakMode:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPTextFieldLineBreakModeKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAlignment:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPTextFieldAlignmentKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setPlaceholderString:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTextFieldPlaceholderStringKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "_setUsesSingleLineMode:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTextFieldUsesSingleLineMode))));
        (self == null ? null : self.isa.objj_msgSend1(self, "_setWraps:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTextFieldWraps))));
        (self == null ? null : self.isa.objj_msgSend1(self, "_setScrolls:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTextFieldScrolls))));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTextField__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isEditable, CPTextFieldIsEditableKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isSelectable, CPTextFieldIsSelectableKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._drawsBackground, CPTextFieldDrawsBackgroundKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._textFieldBackgroundColor, CPTextFieldBackgroundColorKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self.isa.objj_msgSend0(self, "lineBreakMode"), CPTextFieldLineBreakModeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self.isa.objj_msgSend0(self, "alignment"), CPTextFieldAlignmentKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._placeholderString, CPTextFieldPlaceholderStringKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._usesSingleLineMode, CPTextFieldUsesSingleLineMode));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._wraps, CPTextFieldWraps));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._scrolls, CPTextFieldScrolls));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPTextFieldValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:forBinding:"), function $_CPTextFieldValueBinder___updatePlaceholdersWithOptions_forBinding_(self, _cmd, options, aBinding)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTextFieldValueBinder").super_class }, "_updatePlaceholdersWithOptions:", options);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", "Multiple Values", CPMultipleValuesMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", "No Selection", CPNoSelectionMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", "Not Applicable", CPNotApplicableMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", "", CPNullMarker, YES);
}
,["void","CPDictionary","CPString"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPTextFieldValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPlaceholderString:", aValue));
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setObjectValue:", nil));
    var ___r1;
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $_CPTextFieldValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    if (!aValue || aValue.isa && (aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "isMemberOfClass:", CPNull)))
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPlaceholderString:", self.isa.objj_msgSend1(self, "_placeholderForMarker:", CPNullMarker)));
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setObjectValue:", aValue));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("reverseSetValueFor:"), function $_CPTextFieldValueBinder__reverseSetValueFor_(self, _cmd, aBinding)
{
    var destination = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedObjectKey)),
        keyPath = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedKeyPathKey)),
        options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey)),
        newValue = self.isa.objj_msgSend1(self, "valueForBinding:", aBinding),
        value = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKeyPath:", keyPath));
    if (CPIsControllerMarker(value) && newValue === nil)
        return;
    newValue = self.isa.objj_msgSend2(self, "reverseTransformValue:withOptions:", newValue, options);
    self.isa.objj_msgSend2(self, "suppressSpecificNotificationFromObject:keyPath:", destination, keyPath);
    (destination == null ? null : destination.isa.objj_msgSend2(destination, "setValue:forKeyPath:", newValue, keyPath));
    self.isa.objj_msgSend2(self, "unsuppressSpecificNotificationFromObject:keyPath:", destination, keyPath);
    var ___r1;
}
,["void","CPString"])]);
}{var the_class = objj_allocateClassPair(CPValueWithPatternBinding, "_CPTextFieldPatternValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPTextFieldPatternValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPlaceholderString:", aValue));
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setObjectValue:", nil));
    var ___r1;
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $_CPTextFieldPatternValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    if (!aValue || aValue.isa && (aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "isMemberOfClass:", CPNull)))
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPlaceholderString:", self.isa.objj_msgSend1(self, "_placeholderForMarker:", CPNullMarker)));
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setObjectValue:", aValue));
    var ___r1;
}
,["void","id","CPString"])]);
}