@STATIC;1.0;I;18;AppKit/CPControl.jI;17;AppKit/CPButton.jI;20;AppKit/CPTextField.jt;12299;

objj_executeFile("AppKit/CPControl.j", NO);
objj_executeFile("AppKit/CPButton.j", NO);
objj_executeFile("AppKit/CPTextField.j", NO);
{var the_class = objj_allocateClassPair(CPControl, "CPStepper"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_valueWraps"), new objj_ivar("_autorepeat"), new objj_ivar("_increment"), new objj_ivar("_maxValue"), new objj_ivar("_minValue"), new objj_ivar("_buttonDown"), new objj_ivar("_buttonUp")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("valueWraps"), function $CPStepper__valueWraps(self, _cmd)
{ with(self)
{
return _valueWraps;
}
},["id"]),
new objj_method(sel_getUid("setValueWraps:"), function $CPStepper__setValueWraps_(self, _cmd, newValue)
{ with(self)
{
_valueWraps = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("autorepeat"), function $CPStepper__autorepeat(self, _cmd)
{ with(self)
{
return _autorepeat;
}
},["id"]),
new objj_method(sel_getUid("_setAutorepeat:"), function $CPStepper___setAutorepeat_(self, _cmd, newValue)
{ with(self)
{
_autorepeat = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("increment"), function $CPStepper__increment(self, _cmd)
{ with(self)
{
return _increment;
}
},["id"]),
new objj_method(sel_getUid("setIncrement:"), function $CPStepper__setIncrement_(self, _cmd, newValue)
{ with(self)
{
_increment = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("maxValue"), function $CPStepper__maxValue(self, _cmd)
{ with(self)
{
return _maxValue;
}
},["id"]),
new objj_method(sel_getUid("setMaxValue:"), function $CPStepper__setMaxValue_(self, _cmd, newValue)
{ with(self)
{
_maxValue = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("minValue"), function $CPStepper__minValue(self, _cmd)
{ with(self)
{
return _minValue;
}
},["id"]),
new objj_method(sel_getUid("setMinValue:"), function $CPStepper__setMinValue_(self, _cmd, newValue)
{ with(self)
{
_minValue = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $CPStepper__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "initWithFrame:", aFrame))
    {
        _maxValue = 59.0;
        _minValue = 0.0;
        _increment = 1.0;
        _valueWraps = YES;
        _autorepeat = YES;

        objj_msgSend(self, "setDoubleValue:", 0.0);
        objj_msgSend(self, "_init");
    }

    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPStepper___init(self, _cmd)
{ with(self)
{
    _buttonUp = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    objj_msgSend(_buttonUp, "setContinuous:", _autorepeat);
    objj_msgSend(_buttonUp, "setTarget:", self);
    objj_msgSend(_buttonUp, "setAction:", sel_getUid("_buttonDidClick:"));
    objj_msgSend(_buttonUp, "setAutoresizingMask:", CPViewNotSizable);
    objj_msgSend(self, "addSubview:", _buttonUp);

    _buttonDown = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    objj_msgSend(_buttonDown, "setContinuous:", _autorepeat);
    objj_msgSend(_buttonDown, "setTarget:", self);
    objj_msgSend(_buttonDown, "setAction:", sel_getUid("_buttonDidClick:"));
    objj_msgSend(_buttonDown, "setAutoresizingMask:", CPViewNotSizable);

    objj_msgSend(self, "setContinuous:", _autorepeat);
    objj_msgSend(self, "addSubview:", _buttonDown);

    objj_msgSend(self, "setNeedsLayout");
}
},["void"]), new objj_method(sel_getUid("setEnabled:"), function $CPStepper__setEnabled_(self, _cmd, shouldEnabled)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setEnabled:", shouldEnabled);

    objj_msgSend(_buttonUp, "setEnabled:", shouldEnabled);
    objj_msgSend(_buttonDown, "setEnabled:", shouldEnabled);
}
},["void","BOOL"]), new objj_method(sel_getUid("setFrame:"), function $CPStepper__setFrame_(self, _cmd, aFrame)
{ with(self)
{
    var upSize = objj_msgSend(self, "valueForThemeAttribute:", "up-button-size"),
        downSize = objj_msgSend(self, "valueForThemeAttribute:", "down-button-size"),
        minSize = { width:upSize.width, height:upSize.height + downSize.height },
        frame = { origin: { x:aFrame.origin.x, y:aFrame.origin.y }, size: { width:aFrame.size.width, height:aFrame.size.height } };

    frame.size.width = MAX(minSize.width, frame.size.width);
    frame.size.height = MAX(minSize.height, frame.size.height);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setFrame:", frame);
}
},["void","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPStepper__layoutSubviews(self, _cmd)
{ with(self)
{
    var aFrame = objj_msgSend(self, "frame"),
        upSize = objj_msgSend(self, "valueForThemeAttribute:", "up-button-size"),
        downSize = objj_msgSend(self, "valueForThemeAttribute:", "down-button-size"),
        upFrame = { origin: { x:aFrame.size.width - upSize.width, y:0 }, size: { width:upSize.width, height:upSize.height } },
        downFrame = { origin: { x:aFrame.size.width - downSize.width, y:upSize.height }, size: { width:downSize.width, height:downSize.height } };
    objj_msgSend(_buttonUp, "setFrame:", upFrame);
    objj_msgSend(_buttonDown, "setFrame:", downFrame);

    objj_msgSend(_buttonUp, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-up-button", CPThemeStateBordered), "bezel-color", CPThemeStateBordered);
    objj_msgSend(_buttonUp, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-up-button", CPThemeStateBordered | CPThemeStateDisabled), "bezel-color", CPThemeStateBordered | CPThemeStateDisabled);
    objj_msgSend(_buttonUp, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-up-button", CPThemeStateBordered | CPThemeStateHighlighted), "bezel-color", CPThemeStateBordered | CPThemeStateHighlighted);
    objj_msgSend(_buttonDown, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-down-button", CPThemeStateBordered), "bezel-color", CPThemeStateBordered);
    objj_msgSend(_buttonDown, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-down-button", CPThemeStateBordered | CPThemeStateDisabled), "bezel-color", CPThemeStateBordered | CPThemeStateDisabled);
    objj_msgSend(_buttonDown, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-down-button", CPThemeStateBordered | CPThemeStateHighlighted), "bezel-color", CPThemeStateBordered | CPThemeStateHighlighted);
}
},["void"]), new objj_method(sel_getUid("setAutorepeat:"), function $CPStepper__setAutorepeat_(self, _cmd, shouldAutoRepeat)
{ with(self)
{
    if (shouldAutoRepeat !== _autorepeat)
    {
        objj_msgSend(_buttonUp, "setContinuous:", shouldAutoRepeat);
        objj_msgSend(_buttonDown, "setContinuous:", shouldAutoRepeat);
    }

    objj_msgSend(self, "setContinuous:", shouldAutoRepeat);
}
},["void","BOOL"]), new objj_method(sel_getUid("setDoubleValue:"), function $CPStepper__setDoubleValue_(self, _cmd, aValue)
{ with(self)
{
    if (aValue > _maxValue)
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setDoubleValue:", _valueWraps ? _minValue : _maxValue);
    else if (aValue < _minValue)
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setDoubleValue:", _valueWraps ? _maxValue : _minValue);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setDoubleValue:", aValue);
}
},["void","float"]), new objj_method(sel_getUid("_buttonDidClick:"), function $CPStepper___buttonDidClick_(self, _cmd, aSender)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;

    if (aSender == _buttonUp)
        objj_msgSend(self, "setDoubleValue:", (objj_msgSend(self, "doubleValue") + _increment));
    else
        objj_msgSend(self, "setDoubleValue:", (objj_msgSend(self, "doubleValue") - _increment));

    if (_target && _action && objj_msgSend(_target, "respondsToSelector:", _action))
        objj_msgSend(self, "sendAction:to:", _action, _target);
}
},["IBAction","id"]), new objj_method(sel_getUid("performClickUp:"), function $CPStepper__performClickUp_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(_buttonUp, "performClick:", aSender);
}
},["IBAction","id"]), new objj_method(sel_getUid("performClickDown:"), function $CPStepper__performClickDown_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(_buttonDown, "performClick:", aSender);
}
},["IBAction","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("stepperWithInitialValue:minValue:maxValue:"), function $CPStepper__stepperWithInitialValue_minValue_maxValue_(self, _cmd, aValue, aMinValue, aMaxValue)
{ with(self)
{
    var stepper = objj_msgSend(objj_msgSend(CPStepper, "alloc"), "initWithFrame:", { origin: { x:0, y:0 }, size: { width:19, height:25 } });
    objj_msgSend(stepper, "setDoubleValue:", aValue);
    objj_msgSend(stepper, "setMinValue:", aMinValue);
    objj_msgSend(stepper, "setMaxValue:", aMaxValue);

    return stepper;
}
},["CPStepper","float","float","float"]), new objj_method(sel_getUid("stepper"), function $CPStepper__stepper(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPStepper, "stepperWithInitialValue:minValue:maxValue:", 0.0, 0.0, 59.0);
}
},["CPStepper"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPStepper__defaultThemeClass(self, _cmd)
{ with(self)
{
    return "stepper";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPStepper__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [objj_msgSend(CPNull, "null"), objj_msgSend(CPNull, "null"), { width:0.0, height:0.0 }, { width:0.0, height:0.0 }], ["bezel-color-up-button", "bezel-color-down-button", "up-button-size", "down-button-size"]);
}
},["id"])]);
}

var CPStepperMinValue = "CPStepperMinValue",
    CPStepperMaxValue = "CPStepperMaxValue",
    CPStepperValueWraps = "CPStepperValueWraps",
    CPStepperAutorepeat = "CPStepperAutorepeat",
    CPStepperIncrement = "CPStepperIncrement";

{
var the_class = objj_getClass("CPStepper")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPStepper\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPStepper__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "initWithCoder:", aCoder))
    {
        _increment = objj_msgSend(aCoder, "decodeIntForKey:", CPStepperIncrement);
        _minValue = objj_msgSend(aCoder, "decodeIntForKey:", CPStepperMinValue);
        _maxValue = objj_msgSend(aCoder, "decodeIntForKey:", CPStepperMaxValue);
        _valueWraps = objj_msgSend(aCoder, "decodeBoolForKey:", CPStepperValueWraps);
        _autorepeat = objj_msgSend(aCoder, "decodeBoolForKey:", CPStepperAutorepeat);

        objj_msgSend(self, "_init");
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPStepper__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "encodeWithCoder:", aCoder);

    objj_msgSend(aCoder, "encodeInt:forKey:", _increment, CPStepperIncrement);

    if (_minValue)
        objj_msgSend(aCoder, "encodeInt:forKey:", _minValue, CPStepperMinValue);
    if (_maxValue)
        objj_msgSend(aCoder, "encodeInt:forKey:", _maxValue, CPStepperMaxValue);
    if (_valueWraps)
        objj_msgSend(aCoder, "encodeBool:forKey:", _valueWraps, CPStepperValueWraps);
    if (_autorepeat)
        objj_msgSend(aCoder, "encodeBool:forKey:", _autorepeat, CPStepperAutorepeat);
}
},["void","CPCoder"])]);
}

