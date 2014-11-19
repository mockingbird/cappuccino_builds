@STATIC;1.0;i;11;CPControl.ji;10;CPButton.ji;13;CPTextField.jt;17409;objj_executeFile("CPControl.j", YES);objj_executeFile("CPButton.j", YES);objj_executeFile("CPTextField.j", YES);{var the_class = objj_allocateClassPair(CPControl, "CPStepper"),
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
        (self == null ? null : self.isa.objj_msgSend1(self, "setDoubleValue:", 0.0));
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPStepper___init(self, _cmd)
{
    self._buttonUp = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContinuous:", self._autorepeat));
    ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("_buttonDidClick:")));
    ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewNotSizable));
    self.isa.objj_msgSend1(self, "addSubview:", self._buttonUp);
    self._buttonDown = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContinuous:", self._autorepeat));
    ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("_buttonDidClick:")));
    ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewNotSizable));
    self.isa.objj_msgSend1(self, "setContinuous:", self._autorepeat);
    self.isa.objj_msgSend1(self, "addSubview:", self._buttonDown);
    self.isa.objj_msgSend0(self, "_sizeToFit");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setControlSize:"), function $CPStepper__setControlSize_(self, _cmd, aControlSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setControlSize:", aControlSize);
    self.isa.objj_msgSend0(self, "_sizeToFit");
}
,["void","CPControlSize"]), new objj_method(sel_getUid("setEnabled:"), function $CPStepper__setEnabled_(self, _cmd, shouldEnabled)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setEnabled:", shouldEnabled);
    ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", shouldEnabled));
    ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", shouldEnabled));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setFrame:"), function $CPStepper__setFrame_(self, _cmd, aFrame)
{
    var upSize = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "up-button-size"),
        downSize = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "down-button-size"),
        minSize = CGSizeMake(upSize.width, upSize.height + downSize.height),
        frame = CGRectMakeCopy(aFrame);
    frame.size.width = MAX(minSize.width, frame.size.width);
    frame.size.height = MAX(minSize.height, frame.size.height);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "setFrame:", frame);
}
,["void","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPStepper__layoutSubviews(self, _cmd)
{
    var controlSizeThemeState = self.isa.objj_msgSend0(self, "_controlSizeThemeState"),
        aFrame = self.isa.objj_msgSend0(self, "frame"),
        upSize = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "up-button-size", controlSizeThemeState),
        downSize = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "down-button-size", controlSizeThemeState),
        upFrame = CGRectMake(0, 0, upSize.width, upSize.height),
        downFrame = CGRectMake(0, upSize.height, downSize.width, downSize.height);
    ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", upFrame));
    ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", downFrame));
    ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "bezel-color-up-button", [controlSizeThemeState, CPThemeStateBordered]), "bezel-color", CPThemeStateBordered));
    ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "bezel-color-up-button", [controlSizeThemeState, CPThemeStateBordered, CPThemeStateDisabled]), "bezel-color", [CPThemeStateBordered, CPThemeStateDisabled]));
    ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "bezel-color-up-button", [controlSizeThemeState, CPThemeStateBordered, CPThemeStateHighlighted]), "bezel-color", [CPThemeStateBordered, CPThemeStateHighlighted]));
    ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "bezel-color-down-button", [controlSizeThemeState, CPThemeStateBordered]), "bezel-color", CPThemeStateBordered));
    ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "bezel-color-down-button", [controlSizeThemeState, CPThemeStateBordered, CPThemeStateDisabled]), "bezel-color", [CPThemeStateBordered, CPThemeStateDisabled]));
    ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "bezel-color-down-button", [controlSizeThemeState, CPThemeStateBordered, CPThemeStateHighlighted]), "bezel-color", [CPThemeStateBordered, CPThemeStateHighlighted]));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_sizeToFit"), function $CPStepper___sizeToFit(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setFrame:", CGRectMake(self.isa.objj_msgSend0(self, "frameOrigin").x, self.isa.objj_msgSend0(self, "frameOrigin").y, 0, 0));
}
,["void"]), new objj_method(sel_getUid("setAutorepeat:"), function $CPStepper__setAutorepeat_(self, _cmd, shouldAutoRepeat)
{
    if (shouldAutoRepeat !== self._autorepeat)
    {
        ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContinuous:", shouldAutoRepeat));
        ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContinuous:", shouldAutoRepeat));
    }
    self.isa.objj_msgSend1(self, "setContinuous:", shouldAutoRepeat);
    var ___r1;
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
    if (!self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    if (aSender == self._buttonUp)
        self.isa.objj_msgSend1(self, "setDoubleValue:", self.isa.objj_msgSend0(self, "doubleValue") + self._increment);
    else
        self.isa.objj_msgSend1(self, "setDoubleValue:", self.isa.objj_msgSend0(self, "doubleValue") - self._increment);
    self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
}
,["void","id"]), new objj_method(sel_getUid("performClickUp:"), function $CPStepper__performClickUp_(self, _cmd, aSender)
{
    ((___r1 = self._buttonUp), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performClick:", aSender));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("performClickDown:"), function $CPStepper__performClickDown_(self, _cmd, aSender)
{
    ((___r1 = self._buttonDown), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performClick:", aSender));
    var ___r1;
}
,["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("stepperWithInitialValue:minValue:maxValue:"), function $CPStepper__stepperWithInitialValue_minValue_maxValue_(self, _cmd, aValue, aMinValue, aMaxValue)
{
    var stepper = ((___r1 = CPStepper.isa.objj_msgSend0(CPStepper, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (stepper == null ? null : stepper.isa.objj_msgSend1(stepper, "setDoubleValue:", aValue));
    (stepper == null ? null : stepper.isa.objj_msgSend1(stepper, "setMinValue:", aMinValue));
    (stepper == null ? null : stepper.isa.objj_msgSend1(stepper, "setMaxValue:", aMaxValue));
    (stepper == null ? null : stepper.isa.objj_msgSend0(stepper, "_sizeToFit"));
    return stepper;
    var ___r1;
}
,["CPStepper","float","float","float"]), new objj_method(sel_getUid("stepper"), function $CPStepper__stepper(self, _cmd)
{
    return CPStepper.isa.objj_msgSend3(CPStepper, "stepperWithInitialValue:minValue:maxValue:", 0.0, 0.0, 59.0);
}
,["CPStepper"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPStepper___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding == CPValueBinding || aBinding == CPMinValueBinding || aBinding == CPMaxValueBinding)
        return (_CPStepperValueBinder == null ? null : _CPStepperValueBinder.isa.objj_msgSend0(_CPStepperValueBinder, "class"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPStepper").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPStepper__defaultThemeClass(self, _cmd)
{
    return "stepper";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPStepper__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-color-up-button", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-color-down-button", CGSizeMakeZero(), "up-button-size", CGSizeMakeZero(), "down-button-size");
}
,["CPDictionary"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPStepperValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:forBinding:"), function $_CPStepperValueBinder___updatePlaceholdersWithOptions_forBinding_(self, _cmd, options, aBinding)
{
    var placeholder = aBinding == CPMaxValueBinding ? ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "maxValue")) : ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "minValue"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPStepperValueBinder").super_class }, "_updatePlaceholdersWithOptions:", options);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", placeholder, CPMultipleValuesMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", placeholder, CPNoSelectionMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", placeholder, CPNotApplicableMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", placeholder, CPNullMarker, YES);
    var ___r1;
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
        self._increment = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPStepperIncrement));
        self._minValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPStepperMinValue));
        self._maxValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPStepperMaxValue));
        self._valueWraps = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPStepperValueWraps));
        self._autorepeat = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPStepperAutorepeat));
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPStepper__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._increment, CPStepperIncrement));
    if (self._minValue)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._minValue, CPStepperMinValue));
    if (self._maxValue)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._maxValue, CPStepperMaxValue));
    if (self._valueWraps)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._valueWraps, CPStepperValueWraps));
    if (self._autorepeat)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._autorepeat, CPStepperAutorepeat));
}
,["void","CPCoder"])]);
}