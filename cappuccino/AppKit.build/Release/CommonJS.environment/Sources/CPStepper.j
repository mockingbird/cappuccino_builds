@STATIC;1.0;i;11;CPControl.ji;10;CPButton.ji;13;CPTextField.jt;14141;objj_executeFile("CPControl.j", YES);objj_executeFile("CPButton.j", YES);objj_executeFile("CPTextField.j", YES);{var the_class = objj_allocateClassPair(CPControl, "CPStepper"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_valueWraps"), new objj_ivar("_autorepeat"), new objj_ivar("_increment"), new objj_ivar("_maxValue"), new objj_ivar("_minValue"), new objj_ivar("_buttonDown"), new objj_ivar("_buttonUp")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("valueWraps"), function $CPStepper__valueWraps(self, _cmd)
{
    return self._valueWraps;
}
,["BOOL"]), new objj_method(sel_getUid("setValueWraps:"), function $CPStepper__setValueWraps_(self, _cmd, newValue)
{
    self._valueWraps = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("autorepeat"), function $CPStepper__autorepeat(self, _cmd)
{
    return self._autorepeat;
}
,["BOOL"]), new objj_method(sel_getUid("_setAutorepeat:"), function $CPStepper___setAutorepeat_(self, _cmd, newValue)
{
    self._autorepeat = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("increment"), function $CPStepper__increment(self, _cmd)
{
    return self._increment;
}
,["int"]), new objj_method(sel_getUid("setIncrement:"), function $CPStepper__setIncrement_(self, _cmd, newValue)
{
    self._increment = newValue;
}
,["void","int"]), new objj_method(sel_getUid("maxValue"), function $CPStepper__maxValue(self, _cmd)
{
    return self._maxValue;
}
,["int"]), new objj_method(sel_getUid("setMaxValue:"), function $CPStepper__setMaxValue_(self, _cmd, newValue)
{
    self._maxValue = newValue;
}
,["void","int"]), new objj_method(sel_getUid("minValue"), function $CPStepper__minValue(self, _cmd)
{
    return self._minValue;
}
,["int"]), new objj_method(sel_getUid("setMinValue:"), function $CPStepper__setMinValue_(self, _cmd, newValue)
{
    self._minValue = newValue;
}
,["void","int"]), new objj_method(sel_getUid("_replacementKeyPathForBinding:"), function $CPStepper___replacementKeyPathForBinding_(self, _cmd, aBinding)
{
    if (aBinding == CPValueBinding)
        return "doubleValue";
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "_replacementKeyPathForBinding:", aBinding);
}
,["CPString","CPString"]), new objj_method(sel_getUid("initWithFrame:"), function $CPStepper__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "initWithFrame:", aFrame))
    {
        self._maxValue = 59.0;
        self._minValue = 0.0;
        self._increment = 1.0;
        self._valueWraps = YES;
        self._autorepeat = YES;
        objj_msgSend(self, "setDoubleValue:", 0.0);
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPStepper___init(self, _cmd)
{
    self._buttonUp = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(self._buttonUp, "setContinuous:", self._autorepeat);
    objj_msgSend(self._buttonUp, "setTarget:", self);
    objj_msgSend(self._buttonUp, "setAction:", sel_getUid("_buttonDidClick:"));
    objj_msgSend(self._buttonUp, "setAutoresizingMask:", CPViewNotSizable);
    objj_msgSend(self, "addSubview:", self._buttonUp);
    self._buttonDown = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(self._buttonDown, "setContinuous:", self._autorepeat);
    objj_msgSend(self._buttonDown, "setTarget:", self);
    objj_msgSend(self._buttonDown, "setAction:", sel_getUid("_buttonDidClick:"));
    objj_msgSend(self._buttonDown, "setAutoresizingMask:", CPViewNotSizable);
    objj_msgSend(self, "setContinuous:", self._autorepeat);
    objj_msgSend(self, "addSubview:", self._buttonDown);
    objj_msgSend(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("setEnabled:"), function $CPStepper__setEnabled_(self, _cmd, shouldEnabled)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setEnabled:", shouldEnabled);
    objj_msgSend(self._buttonUp, "setEnabled:", shouldEnabled);
    objj_msgSend(self._buttonDown, "setEnabled:", shouldEnabled);
}
,["void","BOOL"]), new objj_method(sel_getUid("setFrame:"), function $CPStepper__setFrame_(self, _cmd, aFrame)
{
    var upSize = objj_msgSend(self, "valueForThemeAttribute:", "up-button-size"),
        downSize = objj_msgSend(self, "valueForThemeAttribute:", "down-button-size"),
        minSize = CGSizeMake(upSize.width, upSize.height + downSize.height),
        frame = CGRectMakeCopy(aFrame);
    frame.size.width = MAX(minSize.width, frame.size.width);
    frame.size.height = MAX(minSize.height, frame.size.height);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setFrame:", frame);
}
,["void","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPStepper__layoutSubviews(self, _cmd)
{
    var aFrame = objj_msgSend(self, "frame"),
        upSize = objj_msgSend(self, "valueForThemeAttribute:", "up-button-size"),
        downSize = objj_msgSend(self, "valueForThemeAttribute:", "down-button-size"),
        upFrame = CGRectMake(aFrame.size.width - upSize.width, 0, upSize.width, upSize.height),
        downFrame = CGRectMake(aFrame.size.width - downSize.width, upSize.height, downSize.width, downSize.height);
    objj_msgSend(self._buttonUp, "setFrame:", upFrame);
    objj_msgSend(self._buttonDown, "setFrame:", downFrame);
    objj_msgSend(self._buttonUp, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-up-button", CPThemeStateBordered), "bezel-color", CPThemeStateBordered);
    objj_msgSend(self._buttonUp, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-up-button", CPThemeStateBordered | CPThemeStateDisabled), "bezel-color", CPThemeStateBordered | CPThemeStateDisabled);
    objj_msgSend(self._buttonUp, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-up-button", CPThemeStateBordered | CPThemeStateHighlighted), "bezel-color", CPThemeStateBordered | CPThemeStateHighlighted);
    objj_msgSend(self._buttonDown, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-down-button", CPThemeStateBordered), "bezel-color", CPThemeStateBordered);
    objj_msgSend(self._buttonDown, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-down-button", CPThemeStateBordered | CPThemeStateDisabled), "bezel-color", CPThemeStateBordered | CPThemeStateDisabled);
    objj_msgSend(self._buttonDown, "setValue:forThemeAttribute:inState:", objj_msgSend(self, "valueForThemeAttribute:inState:", "bezel-color-down-button", CPThemeStateBordered | CPThemeStateHighlighted), "bezel-color", CPThemeStateBordered | CPThemeStateHighlighted);
}
,["void"]), new objj_method(sel_getUid("_sizeToFit"), function $CPStepper___sizeToFit(self, _cmd)
{
    objj_msgSend(self, "setFrame:", CGRectMake(objj_msgSend(self, "frameOrigin").x, objj_msgSend(self, "frameOrigin").y, 0, 0));
}
,["void"]), new objj_method(sel_getUid("setAutorepeat:"), function $CPStepper__setAutorepeat_(self, _cmd, shouldAutoRepeat)
{
    if (shouldAutoRepeat !== self._autorepeat)
    {
        objj_msgSend(self._buttonUp, "setContinuous:", shouldAutoRepeat);
        objj_msgSend(self._buttonDown, "setContinuous:", shouldAutoRepeat);
    }
    objj_msgSend(self, "setContinuous:", shouldAutoRepeat);
}
,["void","BOOL"]), new objj_method(sel_getUid("setDoubleValue:"), function $CPStepper__setDoubleValue_(self, _cmd, aValue)
{
    if (aValue > self._maxValue)
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setDoubleValue:", self._valueWraps ? self._minValue : self._maxValue);
    else if (aValue < self._minValue)
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setDoubleValue:", self._valueWraps ? self._maxValue : self._minValue);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setDoubleValue:", aValue);
}
,["void","double"]), new objj_method(sel_getUid("_buttonDidClick:"), function $CPStepper___buttonDidClick_(self, _cmd, aSender)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    if (aSender == self._buttonUp)
        objj_msgSend(self, "setDoubleValue:", objj_msgSend(self, "doubleValue") + self._increment);
    else
        objj_msgSend(self, "setDoubleValue:", objj_msgSend(self, "doubleValue") - self._increment);
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
,["void","id"]), new objj_method(sel_getUid("performClickUp:"), function $CPStepper__performClickUp_(self, _cmd, aSender)
{
    objj_msgSend(self._buttonUp, "performClick:", aSender);
}
,["void","id"]), new objj_method(sel_getUid("performClickDown:"), function $CPStepper__performClickDown_(self, _cmd, aSender)
{
    objj_msgSend(self._buttonDown, "performClick:", aSender);
}
,["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("stepperWithInitialValue:minValue:maxValue:"), function $CPStepper__stepperWithInitialValue_minValue_maxValue_(self, _cmd, aValue, aMinValue, aMaxValue)
{
    var stepper = objj_msgSend(objj_msgSend(CPStepper, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(stepper, "setDoubleValue:", aValue);
    objj_msgSend(stepper, "setMinValue:", aMinValue);
    objj_msgSend(stepper, "setMaxValue:", aMaxValue);
    objj_msgSend(stepper, "_sizeToFit");
    return stepper;
}
,["CPStepper","float","float","float"]), new objj_method(sel_getUid("stepper"), function $CPStepper__stepper(self, _cmd)
{
    return objj_msgSend(CPStepper, "stepperWithInitialValue:minValue:maxValue:", 0.0, 0.0, 59.0);
}
,["CPStepper"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPStepper___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding == CPValueBinding || aBinding == CPMinValueBinding || aBinding == CPMaxValueBinding)
        return objj_msgSend(_CPStepperValueBinder, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPStepper").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPStepper__defaultThemeClass(self, _cmd)
{
    return "stepper";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPStepper__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "bezel-color-up-button", objj_msgSend(CPNull, "null"), "bezel-color-down-button", CGSizeMakeZero(), "up-button-size", CGSizeMakeZero(), "down-button-size");
}
,["CPDictionary"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPStepperValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:forBinding:"), function $_CPStepperValueBinder___updatePlaceholdersWithOptions_forBinding_(self, _cmd, options, aBinding)
{
    var placeholder = aBinding == CPMaxValueBinding ? objj_msgSend(self._source, "maxValue") : objj_msgSend(self._source, "minValue");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStepperValueBinder").super_class }, "_updatePlaceholdersWithOptions:", options);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", placeholder, CPMultipleValuesMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", placeholder, CPNoSelectionMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", placeholder, CPNotApplicableMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", placeholder, CPNullMarker, YES);
}
,["void","CPDictionary","CPString"])]);
}var CPStepperMinValue = "CPStepperMinValue",
    CPStepperMaxValue = "CPStepperMaxValue",
    CPStepperValueWraps = "CPStepperValueWraps",
    CPStepperAutorepeat = "CPStepperAutorepeat",
    CPStepperIncrement = "CPStepperIncrement";
{
var the_class = objj_getClass("CPStepper")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPStepper\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPStepper__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "initWithCoder:", aCoder))
    {
        self._increment = objj_msgSend(aCoder, "decodeIntForKey:", CPStepperIncrement);
        self._minValue = objj_msgSend(aCoder, "decodeIntForKey:", CPStepperMinValue);
        self._maxValue = objj_msgSend(aCoder, "decodeIntForKey:", CPStepperMaxValue);
        self._valueWraps = objj_msgSend(aCoder, "decodeBoolForKey:", CPStepperValueWraps);
        self._autorepeat = objj_msgSend(aCoder, "decodeBoolForKey:", CPStepperAutorepeat);
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPStepper__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._increment, CPStepperIncrement);
    if (self._minValue)
        objj_msgSend(aCoder, "encodeInt:forKey:", self._minValue, CPStepperMinValue);
    if (self._maxValue)
        objj_msgSend(aCoder, "encodeInt:forKey:", self._maxValue, CPStepperMaxValue);
    if (self._valueWraps)
        objj_msgSend(aCoder, "encodeBool:forKey:", self._valueWraps, CPStepperValueWraps);
    if (self._autorepeat)
        objj_msgSend(aCoder, "encodeBool:forKey:", self._autorepeat, CPStepperAutorepeat);
}
,["void","CPCoder"])]);
}