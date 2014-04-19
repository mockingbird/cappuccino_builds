@STATIC;1.0;i;11;CPControl.ji;8;CPFont.ji;13;CPTextField.ji;11;CPStepper.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;19;Foundation/CPDate.jI;28;Foundation/CPDateFormatter.jI;21;Foundation/CPLocale.jt;97904;objj_executeFile("CPControl.j", YES);objj_executeFile("CPFont.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPStepper.j", YES);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPDate.j", NO);objj_executeFile("Foundation/CPDateFormatter.j", NO);objj_executeFile("Foundation/CPLocale.j", NO);var CPDatePickerElementTextFieldBecomeFirstResponder = "CPDatePickerElementTextFieldBecomeFirstResponder",
    CPDatePickerElementTextFieldAMPMChangedNotification = "CPDatePickerElementTextFieldAMPMChangedNotification";
var CPZeroKeyCode = 48,
    CPNineKeyCode = 57,
    CPMajAKeyCode = 65,
    CPMajPKeyCode = 80,
    CPAKeyCode = 97,
    CPPKeyCode = 112;
{var the_class = objj_allocateClassPair(CPControl, "_CPDatePickerTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_firstTextField"), new objj_ivar("_lastTextField"), new objj_ivar("_currentTextField"), new objj_ivar("_datePickerElementView"), new objj_ivar("_datePicker"), new objj_ivar("_stepper")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("firstTextField"), function $_CPDatePickerTextField__firstTextField(self, _cmd)
{
    return self._firstTextField;
}
,["_CPDatePickerElementTextField"]), new objj_method(sel_getUid("setFirstTextField:"), function $_CPDatePickerTextField__setFirstTextField_(self, _cmd, newValue)
{
    self._firstTextField = newValue;
}
,["void","_CPDatePickerElementTextField"]), new objj_method(sel_getUid("lastTextField"), function $_CPDatePickerTextField__lastTextField(self, _cmd)
{
    return self._lastTextField;
}
,["_CPDatePickerElementTextField"]), new objj_method(sel_getUid("setLastTextField:"), function $_CPDatePickerTextField__setLastTextField_(self, _cmd, newValue)
{
    self._lastTextField = newValue;
}
,["void","_CPDatePickerElementTextField"]), new objj_method(sel_getUid("initWithFrame:withDatePicker:"), function $_CPDatePickerTextField__initWithFrame_withDatePicker_(self, _cmd, aFrame, aDatePicker)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerTextField").super_class }, "initWithFrame:", aFrame))
    {
        self._datePicker = aDatePicker;
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CGRect","CPDatePicker"]), new objj_method(sel_getUid("_init"), function $_CPDatePickerTextField___init(self, _cmd)
{
    self._datePickerElementView = objj_msgSend(objj_msgSend(_CPDatePickerElementView, "alloc"), "initWithFrame:withDatePicker:", CGRectMakeZero(), self._datePicker);
    objj_msgSend(self, "addSubview:", self._datePickerElementView);
    self._stepper = objj_msgSend(CPStepper, "stepper");
    objj_msgSend(self._stepper, "setTarget:", self);
    objj_msgSend(self._stepper, "setAction:", sel_getUid("_clickStepper:"));
    objj_msgSend(self, "addSubview:", self._stepper);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_datePickerElementTextFieldBecomeFirstResponder:"), CPDatePickerElementTextFieldBecomeFirstResponder, self);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("becomeFirstResponder"), function $_CPDatePickerTextField__becomeFirstResponder(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $_CPDatePickerTextField__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("resignFirstResponder"), function $_CPDatePickerTextField__resignFirstResponder(self, _cmd)
{
    objj_msgSend(self._currentTextField, "_endEditing");
    objj_msgSend(self._currentTextField, "unbind:", "objectValue");
    objj_msgSend(self._currentTextField, "makeDeselectable");
    self._currentTextField = nil;
    objj_msgSend(self._stepper, "setObjectValue:", 0);
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("canBecomeKeyView"), function $_CPDatePickerTextField__canBecomeKeyView(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("setDateValue:"), function $_CPDatePickerTextField__setDateValue_(self, _cmd, aDateValue)
{
    var dateValue = objj_msgSend(aDateValue, "copy");
    objj_msgSend(dateValue, "_dateWithTimeZone:", objj_msgSend(self._datePicker, "timeZone"));
    objj_msgSend(self._datePickerElementView, "setDateValue:", dateValue);
}
,["void","CPDate"]), new objj_method(sel_getUid("setEnabled:"), function $_CPDatePickerTextField__setEnabled_(self, _cmd, aBoolean)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerTextField").super_class }, "setEnabled:", aBoolean);
    objj_msgSend(self._stepper, "setEnabled:", aBoolean);
    objj_msgSend(self._datePickerElementView, "setEnabled:", aBoolean);
}
,["void","BOOL"]), new objj_method(sel_getUid("_datePickerElementTextFieldBecomeFirstResponder:"), function $_CPDatePickerTextField___datePickerElementTextFieldBecomeFirstResponder_(self, _cmd, aNotification)
{
    if (objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "textField") == self._currentTextField)
        return;
    objj_msgSend(self, "_selectTextField:", objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "textField"));
    if (objj_msgSend(objj_msgSend(self, "window"), "firstResponder") != self._datePicker)
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self._datePicker);
}
,["void","CPNotification"]), new objj_method(sel_getUid("_selecteTextFieldWithFlags:"), function $_CPDatePickerTextField___selecteTextFieldWithFlags_(self, _cmd, flags)
{
    objj_msgSend(self._datePickerElementView, "_updateResponderTextField");
    if (!self._currentTextField)
    {
        if (flags & CPShiftKeyMask)
            objj_msgSend(self, "_selectTextField:", self._lastTextField);
        else
            objj_msgSend(self, "_selectTextField:", self._firstTextField);
    }
}
,["void","unsigned"]), new objj_method(sel_getUid("_selectTextField:"), function $_CPDatePickerTextField___selectTextField_(self, _cmd, aDatePickerElementTextField)
{
    if (self._currentTextField == aDatePickerElementTextField)
        return;
    objj_msgSend(self._currentTextField, "_endEditing");
    objj_msgSend(self._currentTextField, "unbind:", "objectValue");
    objj_msgSend(self._currentTextField, "makeDeselectable");
    self._currentTextField = aDatePickerElementTextField;
    objj_msgSend(self._currentTextField, "makeSelectable");
    if (objj_msgSend(self._currentTextField, "dateType") != CPAMPMDateType)
    {
        objj_msgSend(self._stepper, "setObjectValue:", parseInt(objj_msgSend(self._currentTextField, "stringValue")));
        objj_msgSend(self._stepper, "setMaxValue:", objj_msgSend(self._currentTextField, "maxNumber"));
        objj_msgSend(self._stepper, "setMinValue:", objj_msgSend(self._currentTextField, "minNumber"));
        objj_msgSend(self._currentTextField, "bind:toObject:withKeyPath:options:", "objectValue", self._stepper, "objectValue", nil);
    }
}
,["void","_CPDatePickerElementTextField"]), new objj_method(sel_getUid("_clickStepper:"), function $_CPDatePickerTextField___clickStepper_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(self, "window"), "firstResponder") != self._datePicker || !self._currentTextField)
    {
        var isUp = NO;
        if (objj_msgSend(sender, "objectValue") == 1)
            isUp = YES;
        objj_msgSend(self, "_selectTextField:", self._firstTextField);
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self._datePicker);
        if (isUp)
            objj_msgSend(self._stepper, "setDoubleValue:", parseInt(objj_msgSend(self._currentTextField, "objectValue")) + 1);
        else
            objj_msgSend(self._stepper, "setDoubleValue:", parseInt(objj_msgSend(self._currentTextField, "objectValue")) - 1);
        return;
    }
    if (objj_msgSend(self._currentTextField, "dateType") != CPAMPMDateType)
    {
        objj_msgSend(sender, "setDoubleValue:", parseInt(objj_msgSend(self._currentTextField, "objectValue")));
    }
    else
    {
        if (objj_msgSend(objj_msgSend(self._currentTextField, "stringValue"), "isEqualToString:", "PM"))
            objj_msgSend(self._currentTextField, "setStringValue:", "AM");
        else
            objj_msgSend(self._currentTextField, "setStringValue:", "PM");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPDatePickerElementTextFieldAMPMChangedNotification, self._currentTextField, nil);
    }
}
,["void","id"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $_CPDatePickerTextField__performKeyEquivalent_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self, "isEnabled") || !self._currentTextField || objj_msgSend(objj_msgSend(self, "window"), "firstResponder") != self._datePicker)
        return NO;
    var key = objj_msgSend(anEvent, "charactersIgnoringModifiers");
    if (key == CPUpArrowFunctionKey)
    {
        objj_msgSend(self._currentTextField, "_invalidTimer");
        objj_msgSend(self._stepper, "setDoubleValue:", parseInt(objj_msgSend(self._currentTextField, "objectValue")));
        objj_msgSend(self._stepper, "performClickUp:", self);
        return YES;
    }
    if (key == CPDownArrowFunctionKey)
    {
        objj_msgSend(self._currentTextField, "_invalidTimer");
        objj_msgSend(self._stepper, "setDoubleValue:", parseInt(objj_msgSend(self._currentTextField, "objectValue")));
        objj_msgSend(self._stepper, "performClickDown:", self);
        return YES;
    }
    if (key == CPLeftArrowFunctionKey || objj_msgSend(anEvent, "keyCode") == CPTabKeyCode && objj_msgSend(anEvent, "modifierFlags") & CPShiftKeyMask)
    {
        if (self._currentTextField == self._firstTextField && objj_msgSend(anEvent, "keyCode") == CPTabKeyCode)
        {
            var previousValidKeyView = objj_msgSend(self._datePicker, "previousValidKeyView");
            if (previousValidKeyView)
                objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", previousValidKeyView);
            return YES;
        }
        objj_msgSend(self, "_selectTextField:", objj_msgSend(self._currentTextField, "previousTextField"));
        return YES;
    }
    if (key == CPRightArrowFunctionKey || objj_msgSend(anEvent, "keyCode") == CPTabKeyCode)
    {
        if (self._currentTextField == self._lastTextField && objj_msgSend(anEvent, "keyCode") == CPTabKeyCode)
        {
            var nextValidKeyView = objj_msgSend(self._datePicker, "nextValidKeyView");
            if (nextValidKeyView)
                objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", nextValidKeyView);
            return YES;
        }
        objj_msgSend(self, "_selectTextField:", objj_msgSend(self._currentTextField, "nextTextField"));
        return YES;
    }
    if (objj_msgSend(anEvent, "keyCode") == CPReturnKeyCode)
    {
        objj_msgSend(self._currentTextField, "_endEditing");
        return YES;
    }
    return NO;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("keyDown:"), function $_CPDatePickerTextField__keyDown_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    if (objj_msgSend(self._datePicker, "_isEnglishFormat") && objj_msgSend(self._currentTextField, "dateType") == CPAMPMDateType && (objj_msgSend(anEvent, "keyCode") == CPAKeyCode || objj_msgSend(anEvent, "keyCode") == CPPKeyCode || objj_msgSend(anEvent, "keyCode") == CPMajAKeyCode || objj_msgSend(anEvent, "keyCode") == CPMajPKeyCode))
    {
        if (objj_msgSend(anEvent, "keyCode") == CPAKeyCode || objj_msgSend(anEvent, "keyCode") == CPMajAKeyCode)
            objj_msgSend(self._currentTextField, "setStringValue:", "AM");
        else
            objj_msgSend(self._currentTextField, "setStringValue:", "PM");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPDatePickerElementTextFieldAMPMChangedNotification, self._currentTextField, nil);
        return;
    }
    objj_msgSend(self._currentTextField, "setValueForKeyEvent:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPDatePickerTextField__layoutSubviews(self, _cmd)
{
    if (objj_msgSend(self._datePicker, "datePickerStyle") == CPClockAndCalendarDatePickerStyle)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerTextField").super_class }, "layoutSubviews");
    var frameSize = CGSizeMakeZero(),
        bezelInset = objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "bezel-inset", objj_msgSend(self._datePicker, "themeState"));
    if (objj_msgSend(self._datePicker, "datePickerStyle") == CPTextFieldAndStepperDatePickerStyle)
    {
        frameSize = CGSizeMake(CGRectGetWidth(objj_msgSend(self._datePicker, "frame")) - CGRectGetWidth(objj_msgSend(self._stepper, "frame")) - objj_msgSend(self._datePicker, "valueForThemeAttribute:", "stepper-margin"), CGRectGetHeight(objj_msgSend(self._datePicker, "frame")));
        frameSize.width -= bezelInset.left;
        frameSize.height -= bezelInset.top + bezelInset.bottom;
        objj_msgSend(self._datePickerElementView, "setFrameSize:", frameSize);
        objj_msgSend(self._datePickerElementView, "setFrameOrigin:", CGPointMake(bezelInset.left, bezelInset.top));
        objj_msgSend(self._stepper, "setHidden:", NO);
    }
    else if (objj_msgSend(self._datePicker, "datePickerStyle") == CPTextFieldDatePickerStyle)
    {
        frameSize = CGSizeMake(CGRectGetWidth(objj_msgSend(self._datePicker, "frame")), CGRectGetHeight(objj_msgSend(self._datePicker, "frame")));
        frameSize.width -= bezelInset.left + bezelInset.right;
        frameSize.height -= bezelInset.top + bezelInset.bottom;
        objj_msgSend(self._datePickerElementView, "setFrameSize:", frameSize);
        objj_msgSend(self._datePickerElementView, "setFrameOrigin:", CGPointMake(bezelInset.left, bezelInset.top));
        objj_msgSend(self._stepper, "setHidden:", YES);
    }
    objj_msgSend(self._stepper, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(self._datePickerElementView, "frame")) + objj_msgSend(self._datePicker, "valueForThemeAttribute:", "stepper-margin"), bezelInset.top + CGRectGetHeight(objj_msgSend(self._datePickerElementView, "frame")) / 2 - CGRectGetHeight(objj_msgSend(self._stepper, "frame")) / 2));
    objj_msgSend(self._datePickerElementView, "setNeedsLayout");
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPControl, "_CPDatePickerElementView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_textFieldDay"), new objj_ivar("_textFieldMonth"), new objj_ivar("_textFieldYear"), new objj_ivar("_textFieldHour"), new objj_ivar("_textFieldMinute"), new objj_ivar("_textFieldSecond"), new objj_ivar("_textFieldPMAM"), new objj_ivar("_datePicker"), new objj_ivar("_textFieldSeparatorOne"), new objj_ivar("_textFieldSeparatorTwo"), new objj_ivar("_textFieldSeparatorThree"), new objj_ivar("_textFieldSeparatorFour")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:withDatePicker:"), function $_CPDatePickerElementView__initWithFrame_withDatePicker_(self, _cmd, aFrame, aDatePicker)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementView").super_class }, "init"))
    {
        self._datePicker = aDatePicker;
        objj_msgSend(self, "_init");
    }
    return self;
}
,["id","CGRect","CPDatePicker"]), new objj_method(sel_getUid("_init"), function $_CPDatePickerElementView___init(self, _cmd)
{
    self._textFieldDay = objj_msgSend(_CPDatePickerElementTextField, "new");
    objj_msgSend(self._textFieldDay, "setBezeled:", NO);
    objj_msgSend(self._textFieldDay, "setBordered:", NO);
    objj_msgSend(self._textFieldDay, "setDateType:", CPDayDateType);
    objj_msgSend(self._textFieldDay, "setDatePicker:", self._datePicker);
    objj_msgSend(self._textFieldDay, "setAlignment:", CPRightTextAlignment);
    objj_msgSend(self._textFieldDay, "setDatePickerElementView:", self);
    objj_msgSend(self, "addSubview:", self._textFieldDay);
    self._textFieldMonth = objj_msgSend(_CPDatePickerElementTextField, "new");
    objj_msgSend(self._textFieldMonth, "setBezeled:", NO);
    objj_msgSend(self._textFieldMonth, "setBordered:", NO);
    objj_msgSend(self._textFieldMonth, "setDateType:", CPMonthDateType);
    objj_msgSend(self._textFieldMonth, "setDatePicker:", self._datePicker);
    objj_msgSend(self._textFieldMonth, "setAlignment:", CPRightTextAlignment);
    objj_msgSend(self._textFieldMonth, "setDatePickerElementView:", self);
    objj_msgSend(self, "addSubview:", self._textFieldMonth);
    self._textFieldYear = objj_msgSend(_CPDatePickerElementTextField, "new");
    objj_msgSend(self._textFieldYear, "setBezeled:", NO);
    objj_msgSend(self._textFieldYear, "setBordered:", NO);
    objj_msgSend(self._textFieldYear, "setDateType:", CPYearDateType);
    objj_msgSend(self._textFieldYear, "setDatePicker:", self._datePicker);
    objj_msgSend(self._textFieldYear, "setAlignment:", CPRightTextAlignment);
    objj_msgSend(self._textFieldYear, "setDatePickerElementView:", self);
    objj_msgSend(self, "addSubview:", self._textFieldYear);
    self._textFieldHour = objj_msgSend(_CPDatePickerElementTextField, "new");
    objj_msgSend(self._textFieldHour, "setBezeled:", NO);
    objj_msgSend(self._textFieldHour, "setBordered:", NO);
    objj_msgSend(self._textFieldHour, "setDateType:", CPHourDateType);
    objj_msgSend(self._textFieldHour, "setDatePicker:", self._datePicker);
    objj_msgSend(self._textFieldHour, "setAlignment:", CPRightTextAlignment);
    objj_msgSend(self._textFieldHour, "setDatePickerElementView:", self);
    objj_msgSend(self, "addSubview:", self._textFieldHour);
    self._textFieldMinute = objj_msgSend(_CPDatePickerElementTextField, "new");
    objj_msgSend(self._textFieldMinute, "setBezeled:", NO);
    objj_msgSend(self._textFieldMinute, "setBordered:", NO);
    objj_msgSend(self._textFieldMinute, "setDateType:", CPMinuteDateType);
    objj_msgSend(self._textFieldMinute, "setDatePicker:", self._datePicker);
    objj_msgSend(self._textFieldMinute, "setAlignment:", CPRightTextAlignment);
    objj_msgSend(self._textFieldMinute, "setDatePickerElementView:", self);
    objj_msgSend(self, "addSubview:", self._textFieldMinute);
    self._textFieldSecond = objj_msgSend(_CPDatePickerElementTextField, "new");
    objj_msgSend(self._textFieldSecond, "setBezeled:", NO);
    objj_msgSend(self._textFieldSecond, "setBordered:", NO);
    objj_msgSend(self._textFieldSecond, "setDateType:", CPSecondDateType);
    objj_msgSend(self._textFieldSecond, "setDatePicker:", self._datePicker);
    objj_msgSend(self._textFieldSecond, "setAlignment:", CPRightTextAlignment);
    objj_msgSend(self._textFieldSecond, "setDatePickerElementView:", self);
    objj_msgSend(self, "addSubview:", self._textFieldSecond);
    self._textFieldPMAM = objj_msgSend(_CPDatePickerElementTextField, "new");
    objj_msgSend(self._textFieldPMAM, "setBezeled:", NO);
    objj_msgSend(self._textFieldPMAM, "setBordered:", NO);
    objj_msgSend(self._textFieldPMAM, "setDateType:", CPAMPMDateType);
    objj_msgSend(self._textFieldPMAM, "setDatePicker:", self._datePicker);
    objj_msgSend(self._textFieldPMAM, "setAlignment:", CPRightTextAlignment);
    objj_msgSend(self._textFieldPMAM, "setDatePickerElementView:", self);
    objj_msgSend(self, "addSubview:", self._textFieldPMAM);
    self._textFieldSeparatorOne = objj_msgSend(CPTextField, "labelWithTitle:", "/");
    self._textFieldSeparatorTwo = objj_msgSend(CPTextField, "labelWithTitle:", "/");
    self._textFieldSeparatorThree = objj_msgSend(CPTextField, "labelWithTitle:", ":");
    self._textFieldSeparatorFour = objj_msgSend(CPTextField, "labelWithTitle:", ":");
    objj_msgSend(self, "addSubview:", self._textFieldSeparatorOne);
    objj_msgSend(self, "addSubview:", self._textFieldSeparatorTwo);
    objj_msgSend(self, "addSubview:", self._textFieldSeparatorThree);
    objj_msgSend(self, "addSubview:", self._textFieldSeparatorFour);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_datePickerElementTextFieldAMPMChangedNotification:"), CPDatePickerElementTextFieldAMPMChangedNotification, self._textFieldPMAM);
    objj_msgSend(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $_CPDatePickerElementView__acceptsFirstResponder(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("setDateValue:"), function $_CPDatePickerElementView__setDateValue_(self, _cmd, aDateValue)
{
    objj_msgSend(self._textFieldDay, "setStringValue:", objj_msgSend(CPString, "stringWithFormat:", "%i", aDateValue.getDate()));
    objj_msgSend(self._textFieldMonth, "setStringValue:", objj_msgSend(CPString, "stringWithFormat:", "%i", aDateValue.getMonth() + 1));
    objj_msgSend(self._textFieldYear, "setStringValue:", objj_msgSend(CPString, "stringWithFormat:", "%i", aDateValue.getFullYear()));
    objj_msgSend(self._textFieldHour, "setStringValue:", objj_msgSend(CPString, "stringWithFormat:", "%i", aDateValue.getHours()));
    objj_msgSend(self._textFieldMinute, "setStringValue:", objj_msgSend(CPString, "stringWithFormat:", "%i", aDateValue.getMinutes()));
    objj_msgSend(self._textFieldSecond, "setStringValue:", objj_msgSend(CPString, "stringWithFormat:", "%i", aDateValue.getSeconds()));
    if (aDateValue.getHours() > 11)
        objj_msgSend(self._textFieldPMAM, "setStringValue:", "PM");
    else
        objj_msgSend(self._textFieldPMAM, "setStringValue:", "AM");
}
,["void","CPDate"]), new objj_method(sel_getUid("setDayDateValue:"), function $_CPDatePickerElementView__setDayDateValue_(self, _cmd, aDayDateValue)
{
    objj_msgSend(self._textFieldDay, "setStringValue:", aDayDateValue);
}
,["void","CPString"]), new objj_method(sel_getUid("setEnabled:"), function $_CPDatePickerElementView__setEnabled_(self, _cmd, aBoolean)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementView").super_class }, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldDay, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldMonth, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldYear, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldHour, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldMinute, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldSecond, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldSeparatorOne, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldSeparatorTwo, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldSeparatorThree, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldSeparatorFour, "setEnabled:", aBoolean);
    objj_msgSend(self._textFieldPMAM, "setEnabled:", aBoolean);
}
,["void","BOOL"]), new objj_method(sel_getUid("_isAMHour"), function $_CPDatePickerElementView___isAMHour(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._textFieldPMAM, "stringValue"), "isEqualToString:", "AM");
}
,["BOOL"]), new objj_method(sel_getUid("dateValue"), function $_CPDatePickerElementView__dateValue(self, _cmd)
{
    var date = objj_msgSend(objj_msgSend(self._datePicker, "dateValue"), "copy");
    objj_msgSend(date, "_dateWithTimeZone:", objj_msgSend(self._datePicker, "timeZone"));
    if (!objj_msgSend(self._textFieldDay, "isHidden"))
        date.setDate(objj_msgSend(self._textFieldDay, "stringValue"));
    if (!objj_msgSend(self._textFieldMonth, "isHidden"))
        date.setMonth(parseInt(objj_msgSend(self._textFieldMonth, "stringValue")) - 1);
    if (!objj_msgSend(self._textFieldYear, "isHidden"))
        date.setFullYear(objj_msgSend(self._textFieldYear, "stringValue"));
    if (!objj_msgSend(self._textFieldSecond, "isHidden"))
        date.setSeconds(objj_msgSend(self._textFieldSecond, "stringValue"));
    if (!objj_msgSend(self._textFieldMinute, "isHidden"))
        date.setMinutes(objj_msgSend(self._textFieldMinute, "stringValue"));
    if (!objj_msgSend(self._textFieldHour, "isHidden"))
    {
        var hour = parseInt(objj_msgSend(self._textFieldHour, "stringValue")),
            currentHour = parseInt(date.getHours());
        if (hour != currentHour)
        {
            if (objj_msgSend(self._datePicker, "_isEnglishFormat") || objj_msgSend(self._datePicker, "_isAmericanFormat"))
            {
                if (!objj_msgSend(self, "_isAMHour"))
                {
                    if (!(currentHour == 12 && hour == 11) && hour < 13)
                        hour = hour + 12;
                }
                else if (hour == 12 && currentHour != 11)
                {
                    hour = 0;
                }
                else if (currentHour == 0 && hour == 11)
                {
                    hour = 23;
                }
                else if (hour == 13)
                {
                    hour = 1;
                }
            }
            if (hour == 24)
                hour = 0;
            date.setHours(hour);
        }
    }
    return date;
}
,["CPDate"]), new objj_method(sel_getUid("_datePickerElementTextFieldAMPMChangedNotification:"), function $_CPDatePickerElementView___datePickerElementTextFieldAMPMChangedNotification_(self, _cmd, aNotification)
{
    var value = objj_msgSend(objj_msgSend(aNotification, "object"), "stringValue"),
        dateValue = objj_msgSend(objj_msgSend(self._datePicker, "dateValue"), "copy"),
        d = objj_msgSend(dateValue, "copy");
    objj_msgSend(d, "_dateWithTimeZone:", objj_msgSend(self._datePicker, "timeZone"));
    if (objj_msgSend(value, "isEqualToString:", "PM"))
    {
        if (d.getHours() <= 11)
            dateValue.setHours(dateValue.getHours() + 12);
    }
    else
    {
        if (d.getHours() > 11)
            dateValue.setHours(dateValue.getHours() - 12);
    }
    objj_msgSend(self._datePicker, "setDateValue:", dateValue);
}
,["void","CPNotification"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPDatePickerElementView__layoutSubviews(self, _cmd)
{
    if (objj_msgSend(self._datePicker, "datePickerStyle") == CPClockAndCalendarDatePickerStyle)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementView").super_class }, "layoutSubviews");
    var themeState = objj_msgSend(self._datePicker, "themeState");
    if (objj_msgSend(self._datePicker, "isBezeled") && objj_msgSend(self._datePicker, "drawsBackground") || objj_msgSend(self._datePicker, "isBordered") && objj_msgSend(self._datePicker, "drawsBackground"))
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "bezel-color", themeState));
    else if (objj_msgSend(self._datePicker, "drawsBackground"))
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self._datePicker, "backgroundColor"));
    else
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "clearColor"));
    objj_msgSend(self, "_themeTextFields");
    objj_msgSend(self, "_updateResponderTextField");
    objj_msgSend(self, "_updateHiddenTextFields");
    objj_msgSend(self, "_sizeToFit");
    objj_msgSend(self, "_updatePositions");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("drawRect:"), function $_CPDatePickerElementView__drawRect_(self, _cmd, aRect)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementView").super_class }, "drawRect:", aRect);
    if ((objj_msgSend(self._datePicker, "isBordered") || objj_msgSend(self._datePicker, "isBezeled")) && !objj_msgSend(self._datePicker, "drawsBackground"))
    {
        var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
            borderWidth = objj_msgSend(self._datePicker, "valueForThemeAttribute:", "border-width") / 2,
            bezelInset = objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "bezel-inset", objj_msgSend(self._datePicker, "themeState"));
        CGContextBeginPath(context);
        CGContextSetStrokeColor(context, objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "border-color", objj_msgSend(self._datePicker, "themeState")));
        CGContextSetLineWidth(context, objj_msgSend(self._datePicker, "valueForThemeAttribute:", "border-width"));
        CGContextMoveToPoint(context, borderWidth - bezelInset.left, borderWidth);
        CGContextAddLineToPoint(context, objj_msgSend(self, "bounds").size.width + bezelInset.left - borderWidth, borderWidth);
        CGContextAddLineToPoint(context, objj_msgSend(self, "bounds").size.width + bezelInset.left - borderWidth, objj_msgSend(self, "bounds").size.height - borderWidth);
        CGContextAddLineToPoint(context, borderWidth - bezelInset.left, objj_msgSend(self, "bounds").size.height - borderWidth);
        CGContextAddLineToPoint(context, borderWidth - bezelInset.left, borderWidth);
        CGContextStrokePath(context);
        CGContextClosePath(context);
    }
}
,["void","CGRect"]), new objj_method(sel_getUid("_themeTextFields"), function $_CPDatePickerElementView___themeTextFields(self, _cmd)
{
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:", objj_msgSend(self._datePicker, "valueForThemeAttribute:", "min-size-datepicker-textfield"), "min-size");
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateSelected), "bezel-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateSelected);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateSelected), "text-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateSelected), "text-shadow-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateSelected), "text-shadow-offset", CPThemeStateSelected);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateNormal), "bezel-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateDisabled), "bezel-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldDay, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:", objj_msgSend(self._datePicker, "valueForThemeAttribute:", "min-size-datepicker-textfield"), "min-size");
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateSelected), "bezel-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateSelected);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateSelected), "text-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateSelected), "text-shadow-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateSelected), "text-shadow-offset", CPThemeStateSelected);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateNormal), "bezel-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateDisabled), "bezel-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldMonth, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:", objj_msgSend(self._datePicker, "valueForThemeAttribute:", "min-size-datepicker-textfield"), "min-size");
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateSelected), "bezel-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateSelected);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateSelected), "text-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateSelected), "text-shadow-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateSelected), "text-shadow-offset", CPThemeStateSelected);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateNormal), "bezel-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateDisabled), "bezel-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldYear, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:", objj_msgSend(self._datePicker, "valueForThemeAttribute:", "min-size-datepicker-textfield"), "min-size");
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateSelected), "bezel-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateSelected);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateSelected), "text-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateSelected), "text-shadow-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateSelected), "text-shadow-offset", CPThemeStateSelected);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateNormal), "bezel-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateDisabled), "bezel-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldHour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:", objj_msgSend(self._datePicker, "valueForThemeAttribute:", "min-size-datepicker-textfield"), "min-size");
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateSelected), "bezel-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateSelected);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateSelected), "text-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateSelected), "text-shadow-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateSelected), "text-shadow-offset", CPThemeStateSelected);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateNormal), "bezel-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateDisabled), "bezel-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldMinute, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:", objj_msgSend(self._datePicker, "valueForThemeAttribute:", "min-size-datepicker-textfield"), "min-size");
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateSelected), "bezel-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateSelected);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateSelected), "text-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateSelected), "text-shadow-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateSelected), "text-shadow-offset", CPThemeStateSelected);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateNormal), "bezel-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateDisabled), "bezel-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSecond, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:", objj_msgSend(self._datePicker, "valueForThemeAttribute:", "min-size-datepicker-textfield"), "min-size");
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateSelected), "bezel-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateSelected);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateSelected), "text-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateSelected), "text-shadow-color", CPThemeStateSelected);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateSelected), "text-shadow-offset", CPThemeStateSelected);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateNormal), "bezel-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "datepicker-textfield-bezel-color", CPThemeStateDisabled), "bezel-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldPMAM, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorOne, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield-separator", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorOne, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield-separator", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldSeparatorOne, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorOne, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorOne, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorOne, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorOne, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorOne, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorOne, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorOne, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorTwo, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield-separator", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorTwo, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield-separator", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldSeparatorTwo, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorTwo, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorTwo, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorTwo, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorTwo, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorTwo, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorTwo, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorTwo, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorThree, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield-separator", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorThree, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield-separator", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldSeparatorThree, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorThree, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorThree, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorThree, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorThree, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorThree, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorThree, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorThree, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorFour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield-separator", CPThemeStateNormal), "content-inset", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorFour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset-datepicker-textfield-separator", CPThemeStateSelected), "content-inset", CPThemeStateSelected);
    objj_msgSend(self._textFieldSeparatorFour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorFour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textColor"), "text-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorFour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateNormal), "text-shadow-color", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorFour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateNormal), "text-shadow-offset", CPThemeStateNormal);
    objj_msgSend(self._textFieldSeparatorFour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "textFont"), "font", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorFour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-color", CPThemeStateDisabled), "text-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorFour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-color", CPThemeStateDisabled), "text-shadow-color", CPThemeStateDisabled);
    objj_msgSend(self._textFieldSeparatorFour, "setValue:forThemeAttribute:inState:", objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "text-shadow-offset", CPThemeStateDisabled), "text-shadow-offset", CPThemeStateDisabled);
}
,["void"]), new objj_method(sel_getUid("_updateHiddenTextFields"), function $_CPDatePickerElementView___updateHiddenTextFields(self, _cmd)
{
    var datePickerElements = objj_msgSend(self._datePicker, "datePickerElements"),
        isEnglishFormat = objj_msgSend(self._datePicker, "_isEnglishFormat");
    if (datePickerElements & CPYearMonthDatePickerElementFlag)
    {
        objj_msgSend(self._textFieldDay, "setHidden:", YES);
        objj_msgSend(self._textFieldMonth, "setHidden:", NO);
        objj_msgSend(self._textFieldYear, "setHidden:", NO);
        objj_msgSend(self._textFieldSeparatorTwo, "setHidden:", NO);
        objj_msgSend(self._textFieldSeparatorOne, "setHidden:", YES);
        if ([datePickerElements & CPYearMonthDayDatePickerElementFlag] == CPYearMonthDayDatePickerElementFlag)
        {
            objj_msgSend(self._textFieldDay, "setHidden:", NO);
            objj_msgSend(self._textFieldSeparatorOne, "setHidden:", NO);
        }
    }
    else
    {
        objj_msgSend(self._textFieldMonth, "setHidden:", YES);
        objj_msgSend(self._textFieldYear, "setHidden:", YES);
        objj_msgSend(self._textFieldDay, "setHidden:", YES);
        objj_msgSend(self._textFieldSeparatorTwo, "setHidden:", YES);
        objj_msgSend(self._textFieldSeparatorOne, "setHidden:", YES);
    }
    if (datePickerElements & CPHourMinuteDatePickerElementFlag)
    {
        objj_msgSend(self._textFieldHour, "setHidden:", NO);
        objj_msgSend(self._textFieldMinute, "setHidden:", NO);
        objj_msgSend(self._textFieldSecond, "setHidden:", YES);
        objj_msgSend(self._textFieldSeparatorThree, "setHidden:", NO);
        objj_msgSend(self._textFieldSeparatorFour, "setHidden:", YES);
        if (isEnglishFormat)
            objj_msgSend(self._textFieldPMAM, "setHidden:", NO);
        else
            objj_msgSend(self._textFieldPMAM, "setHidden:", YES);
        if ((datePickerElements & CPHourMinuteSecondDatePickerElementFlag) == CPHourMinuteSecondDatePickerElementFlag)
        {
            objj_msgSend(self._textFieldSecond, "setHidden:", NO);
            objj_msgSend(self._textFieldSeparatorFour, "setHidden:", NO);
        }
    }
    else
    {
        objj_msgSend(self._textFieldHour, "setHidden:", YES);
        objj_msgSend(self._textFieldMinute, "setHidden:", YES);
        objj_msgSend(self._textFieldSecond, "setHidden:", YES);
        objj_msgSend(self._textFieldSeparatorThree, "setHidden:", YES);
        objj_msgSend(self._textFieldSeparatorFour, "setHidden:", YES);
        objj_msgSend(self._textFieldPMAM, "setHidden:", YES);
    }
}
,["void"]), new objj_method(sel_getUid("_updatePositions"), function $_CPDatePickerElementView___updatePositions(self, _cmd)
{
    var contentInset = objj_msgSend(self._datePicker, "valueForThemeAttribute:inState:", "content-inset", objj_msgSend(self._datePicker, "themeState")),
        separatorContentInset = objj_msgSend(self._datePicker, "valueForThemeAttribute:", "separator-content-inset"),
        horizontalInset = contentInset.left - contentInset.right,
        verticalInset = contentInset.top - contentInset.bottom,
        firstTexField = self._textFieldMonth,
        secondTextField = self._textFieldDay,
        isEnglishFormat = objj_msgSend(self._datePicker, "_isEnglishFormat");
    if (!isEnglishFormat)
    {
        firstTexField = self._textFieldDay;
        secondTextField = self._textFieldMonth;
    }
    objj_msgSend(firstTexField, "setFrameOrigin:", CGPointMake(horizontalInset, verticalInset));
    objj_msgSend(self._textFieldSeparatorOne, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(firstTexField, "frame")) + separatorContentInset.left, verticalInset));
    if (objj_msgSend(firstTexField, "isHidden"))
        objj_msgSend(secondTextField, "setFrameOrigin:", CGPointMake(horizontalInset, verticalInset));
    else
        objj_msgSend(secondTextField, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(self._textFieldSeparatorOne, "frame")) + separatorContentInset.right, verticalInset));
    if (isEnglishFormat && objj_msgSend(secondTextField, "isHidden"))
        objj_msgSend(self._textFieldSeparatorTwo, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(firstTexField, "frame")) + separatorContentInset.left, verticalInset));
    else
        objj_msgSend(self._textFieldSeparatorTwo, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(secondTextField, "frame")) + separatorContentInset.left, verticalInset));
    objj_msgSend(self._textFieldYear, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(self._textFieldSeparatorTwo, "frame")) + separatorContentInset.right, verticalInset));
    if (objj_msgSend(self._textFieldMonth, "isHidden"))
        objj_msgSend(self._textFieldHour, "setFrameOrigin:", CGPointMake(horizontalInset, verticalInset));
    else
        objj_msgSend(self._textFieldHour, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(self._textFieldYear, "frame")) + objj_msgSend(self._datePicker, "valueForThemeAttribute:", "date-hour-margin"), verticalInset));
    objj_msgSend(self._textFieldSeparatorThree, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(self._textFieldHour, "frame")) + separatorContentInset.left, verticalInset));
    objj_msgSend(self._textFieldMinute, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(self._textFieldSeparatorThree, "frame")) + separatorContentInset.right, verticalInset));
    objj_msgSend(self._textFieldSeparatorFour, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(self._textFieldMinute, "frame")) + separatorContentInset.left, verticalInset));
    objj_msgSend(self._textFieldSecond, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(self._textFieldSeparatorFour, "frame")) + separatorContentInset.right, verticalInset));
    if (objj_msgSend(self._textFieldSecond, "isHidden"))
        objj_msgSend(self._textFieldPMAM, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(self._textFieldMinute, "frame")) + 2, verticalInset));
    else
        objj_msgSend(self._textFieldPMAM, "setFrameOrigin:", CGPointMake(CGRectGetMaxX(objj_msgSend(self._textFieldSecond, "frame")) + 2, verticalInset));
}
,["void"]), new objj_method(sel_getUid("_sizeToFit"), function $_CPDatePickerElementView___sizeToFit(self, _cmd)
{
    objj_msgSend(self._textFieldDay, "sizeToFit");
    objj_msgSend(self._textFieldMonth, "sizeToFit");
    objj_msgSend(self._textFieldYear, "sizeToFit");
    objj_msgSend(self._textFieldHour, "sizeToFit");
    objj_msgSend(self._textFieldMinute, "sizeToFit");
    objj_msgSend(self._textFieldSecond, "sizeToFit");
    objj_msgSend(self._textFieldSeparatorOne, "sizeToFit");
    objj_msgSend(self._textFieldSeparatorTwo, "sizeToFit");
    objj_msgSend(self._textFieldSeparatorThree, "sizeToFit");
    objj_msgSend(self._textFieldSeparatorFour, "sizeToFit");
    objj_msgSend(self._textFieldPMAM, "sizeToFit");
}
,["void"]), new objj_method(sel_getUid("_updateResponderTextField"), function $_CPDatePickerElementView___updateResponderTextField(self, _cmd)
{
    objj_msgSend(self, "_updateFirstLastTextField");
    objj_msgSend(self, "_updateKeyView");
}
,["void"]), new objj_method(sel_getUid("_updateFirstLastTextField"), function $_CPDatePickerElementView___updateFirstLastTextField(self, _cmd)
{
    var datePickerElements = objj_msgSend(self._datePicker, "datePickerElements");
    if (objj_msgSend(self._datePicker, "_isEnglishFormat"))
    {
        if (datePickerElements & CPYearMonthDayDatePickerElementFlag || datePickerElements & CPYearMonthDatePickerElementFlag)
            objj_msgSend(objj_msgSend(self, "superview"), "setFirstTextField:", self._textFieldMonth);
        else
            objj_msgSend(objj_msgSend(self, "superview"), "setFirstTextField:", self._textFieldHour);
        if (datePickerElements & CPHourMinuteSecondDatePickerElementFlag || datePickerElements & CPHourMinuteDatePickerElementFlag)
            objj_msgSend(objj_msgSend(self, "superview"), "setLastTextField:", self._textFieldPMAM);
        else
            objj_msgSend(objj_msgSend(self, "superview"), "setLastTextField:", self._textFieldYear);
    }
    else
    {
        if ((datePickerElements & CPYearMonthDayDatePickerElementFlag) == CPYearMonthDayDatePickerElementFlag)
            objj_msgSend(objj_msgSend(self, "superview"), "setFirstTextField:", self._textFieldDay);
        else if (datePickerElements & CPYearMonthDayDatePickerElementFlag || datePickerElements & CPYearMonthDatePickerElementFlag)
            objj_msgSend(objj_msgSend(self, "superview"), "setFirstTextField:", self._textFieldMonth);
        else
            objj_msgSend(objj_msgSend(self, "superview"), "setFirstTextField:", self._textFieldHour);
        if ((datePickerElements & CPHourMinuteSecondDatePickerElementFlag) == CPHourMinuteSecondDatePickerElementFlag)
            objj_msgSend(objj_msgSend(self, "superview"), "setLastTextField:", self._textFieldSecond);
        else if (datePickerElements & CPHourMinuteSecondDatePickerElementFlag || datePickerElements & CPHourMinuteDatePickerElementFlag)
            objj_msgSend(objj_msgSend(self, "superview"), "setLastTextField:", self._textFieldMinute);
        else
            objj_msgSend(objj_msgSend(self, "superview"), "setLastTextField:", self._textFieldYear);
    }
}
,["void"]), new objj_method(sel_getUid("_updateKeyView"), function $_CPDatePickerElementView___updateKeyView(self, _cmd)
{
    objj_msgSend(self, "_updateNextTextField");
    objj_msgSend(self, "_updatePreviousTextField");
}
,["void"]), new objj_method(sel_getUid("_updateNextTextField"), function $_CPDatePickerElementView___updateNextTextField(self, _cmd)
{
    var datePickerElements = objj_msgSend(self._datePicker, "datePickerElements"),
        firstTexField = self._textFieldMonth,
        secondTextField = self._textFieldDay,
        isEnglishFormat = objj_msgSend(self._datePicker, "_isEnglishFormat");
    if (!isEnglishFormat)
    {
        firstTexField = self._textFieldDay;
        secondTextField = self._textFieldMonth;
    }
    if ((datePickerElements & CPYearMonthDayDatePickerElementFlag) == CPYearMonthDayDatePickerElementFlag)
        objj_msgSend(firstTexField, "setNextTextField:", secondTextField);
    else
        objj_msgSend(firstTexField, "setNextTextField:", self._textFieldYear);
    objj_msgSend(secondTextField, "setNextTextField:", self._textFieldYear);
    if (datePickerElements & CPHourMinuteSecondDatePickerElementFlag || datePickerElements & CPHourMinuteDatePickerElementFlag)
        objj_msgSend(self._textFieldYear, "setNextTextField:", self._textFieldHour);
    else if (isEnglishFormat || (datePickerElements & CPYearMonthDayDatePickerElementFlag) == CPYearMonthDayDatePickerElementFlag)
        objj_msgSend(self._textFieldYear, "setNextTextField:", firstTexField);
    else
        objj_msgSend(self._textFieldYear, "setNextTextField:", secondTextField);
    objj_msgSend(self._textFieldHour, "setNextTextField:", self._textFieldMinute);
    if ((datePickerElements & CPHourMinuteSecondDatePickerElementFlag) == CPHourMinuteSecondDatePickerElementFlag)
        objj_msgSend(self._textFieldMinute, "setNextTextField:", self._textFieldSecond);
    else if (isEnglishFormat)
        objj_msgSend(self._textFieldMinute, "setNextTextField:", self._textFieldPMAM);
    else if ((datePickerElements & CPYearMonthDayDatePickerElementFlag) == CPYearMonthDayDatePickerElementFlag)
        objj_msgSend(self._textFieldMinute, "setNextTextField:", firstTexField);
    else if (datePickerElements & CPYearMonthDatePickerElementFlag)
        objj_msgSend(self._textFieldMinute, "setNextTextField:", secondTextField);
    else
        objj_msgSend(self._textFieldMinute, "setNextTextField:", self._textFieldHour);
    if (isEnglishFormat)
        objj_msgSend(self._textFieldSecond, "setNextTextField:", self._textFieldPMAM);
    else if ((datePickerElements & CPYearMonthDayDatePickerElementFlag) == CPYearMonthDayDatePickerElementFlag)
        objj_msgSend(self._textFieldSecond, "setNextTextField:", firstTexField);
    else if (datePickerElements & CPYearMonthDatePickerElementFlag)
        objj_msgSend(self._textFieldSecond, "setNextTextField:", secondTextField);
    else
        objj_msgSend(self._textFieldSecond, "setNextTextField:", self._textFieldHour);
    if (datePickerElements & CPYearMonthDayDatePickerElementFlag)
        objj_msgSend(self._textFieldPMAM, "setNextTextField:", self._textFieldMonth);
    else
        objj_msgSend(self._textFieldPMAM, "setNextTextField:", self._textFieldHour);
}
,["void"]), new objj_method(sel_getUid("_updatePreviousTextField"), function $_CPDatePickerElementView___updatePreviousTextField(self, _cmd)
{
    var datePickerElements = objj_msgSend(self._datePicker, "datePickerElements"),
        firstTexField = self._textFieldMonth,
        secondTextField = self._textFieldDay,
        isEnglishFormat = objj_msgSend(self._datePicker, "_isEnglishFormat");
    if (!isEnglishFormat)
    {
        firstTexField = self._textFieldDay;
        secondTextField = self._textFieldMonth;
    }
    if ((datePickerElements & CPHourMinuteSecondDatePickerElementFlag) == CPHourMinuteSecondDatePickerElementFlag)
        objj_msgSend(self._textFieldPMAM, "setPreviousTextField:", self._textFieldSecond);
    else if (datePickerElements & CPHourMinuteDatePickerElementFlag)
        objj_msgSend(self._textFieldPMAM, "setPreviousTextField:", self._textFieldMinute);
    objj_msgSend(self._textFieldSecond, "setPreviousTextField:", self._textFieldMinute);
    objj_msgSend(self._textFieldMinute, "setPreviousTextField:", self._textFieldHour);
    if (datePickerElements & CPYearMonthDatePickerElementFlag)
        objj_msgSend(self._textFieldHour, "setPreviousTextField:", self._textFieldYear);
    else if (isEnglishFormat)
        objj_msgSend(self._textFieldHour, "setPreviousTextField:", self._textFieldPMAM);
    else if ((datePickerElements & CPHourMinuteSecondDatePickerElementFlag) == CPHourMinuteSecondDatePickerElementFlag)
        objj_msgSend(self._textFieldHour, "setPreviousTextField:", self._textFieldSecond);
    else
        objj_msgSend(self._textFieldHour, "setPreviousTextField:", self._textFieldMinute);
    if (!isEnglishFormat)
        objj_msgSend(self._textFieldYear, "setPreviousTextField:", self._textFieldMonth);
    else if ((datePickerElements & CPYearMonthDayDatePickerElementFlag) == CPYearMonthDayDatePickerElementFlag)
        objj_msgSend(self._textFieldYear, "setPreviousTextField:", self._textFieldDay);
    else
        objj_msgSend(self._textFieldYear, "setPreviousTextField:", self._textFieldMonth);
    objj_msgSend(secondTextField, "setPreviousTextField:", firstTexField);
    if (isEnglishFormat && datePickerElements & CPHourMinuteDatePickerElementFlag)
        objj_msgSend(firstTexField, "setPreviousTextField:", self._textFieldPMAM);
    else if ((datePickerElements & CPHourMinuteSecondDatePickerElementFlag) == CPHourMinuteSecondDatePickerElementFlag)
        objj_msgSend(firstTexField, "setPreviousTextField:", self._textFieldSecond);
    else if (datePickerElements & CPHourMinuteDatePickerElementFlag)
        objj_msgSend(firstTexField, "setPreviousTextField:", self._textFieldMinute);
    else
        objj_msgSend(firstTexField, "setPreviousTextField:", self._textFieldYear);
}
,["void"])]);
}var CPMonthDateType = 0,
    CPDayDateType = 1,
    CPYearDateType = 2,
    CPHourDateType = 3,
    CPSecondDateType = 4,
    CPMinuteDateType = 5,
    CPAMPMDateType = 6;
{var the_class = objj_allocateClassPair(CPTextField, "_CPDatePickerElementTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_nextTextField"), new objj_ivar("_previousTextField"), new objj_ivar("_datePickerElementView"), new objj_ivar("_datePicker"), new objj_ivar("_dateType"), new objj_ivar("_maxNumber"), new objj_ivar("_minNumber"), new objj_ivar("_firstEvent"), new objj_ivar("_timerEdition")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("nextTextField"), function $_CPDatePickerElementTextField__nextTextField(self, _cmd)
{
    return self._nextTextField;
}
,["_CPDatePickerElementTextField"]), new objj_method(sel_getUid("setNextTextField:"), function $_CPDatePickerElementTextField__setNextTextField_(self, _cmd, newValue)
{
    self._nextTextField = newValue;
}
,["void","_CPDatePickerElementTextField"]), new objj_method(sel_getUid("previousTextField"), function $_CPDatePickerElementTextField__previousTextField(self, _cmd)
{
    return self._previousTextField;
}
,["_CPDatePickerElementTextField"]), new objj_method(sel_getUid("setPreviousTextField:"), function $_CPDatePickerElementTextField__setPreviousTextField_(self, _cmd, newValue)
{
    self._previousTextField = newValue;
}
,["void","_CPDatePickerElementTextField"]), new objj_method(sel_getUid("datePickerElementView"), function $_CPDatePickerElementTextField__datePickerElementView(self, _cmd)
{
    return self._datePickerElementView;
}
,["_CPDatePickerElementView"]), new objj_method(sel_getUid("setDatePickerElementView:"), function $_CPDatePickerElementTextField__setDatePickerElementView_(self, _cmd, newValue)
{
    self._datePickerElementView = newValue;
}
,["void","_CPDatePickerElementView"]), new objj_method(sel_getUid("_datePicker"), function $_CPDatePickerElementTextField___datePicker(self, _cmd)
{
    return self._datePicker;
}
,["CPDatePicker"]), new objj_method(sel_getUid("setDatePicker:"), function $_CPDatePickerElementTextField__setDatePicker_(self, _cmd, newValue)
{
    self._datePicker = newValue;
}
,["void","CPDatePicker"]), new objj_method(sel_getUid("dateType"), function $_CPDatePickerElementTextField__dateType(self, _cmd)
{
    return self._dateType;
}
,["int"]), new objj_method(sel_getUid("_setDateType:"), function $_CPDatePickerElementTextField___setDateType_(self, _cmd, newValue)
{
    self._dateType = newValue;
}
,["void","int"]), new objj_method(sel_getUid("maxNumber"), function $_CPDatePickerElementTextField__maxNumber(self, _cmd)
{
    return self._maxNumber;
}
,["int"]), new objj_method(sel_getUid("_setMaxNumber:"), function $_CPDatePickerElementTextField___setMaxNumber_(self, _cmd, newValue)
{
    self._maxNumber = newValue;
}
,["void","int"]), new objj_method(sel_getUid("minNumber"), function $_CPDatePickerElementTextField__minNumber(self, _cmd)
{
    return self._minNumber;
}
,["int"]), new objj_method(sel_getUid("_setMinNumber:"), function $_CPDatePickerElementTextField___setMinNumber_(self, _cmd, newValue)
{
    self._minNumber = newValue;
}
,["void","int"]), new objj_method(sel_getUid("acceptFirstResponder"), function $_CPDatePickerElementTextField__acceptFirstResponder(self, _cmd)
{
    self._firstEvent = YES;
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("setDateType:"), function $_CPDatePickerElementTextField__setDateType_(self, _cmd, aDateType)
{
    self._dateType = aDateType;
    switch(aDateType) {
    case CPMonthDateType:
        self._minNumber = 1;
        self._maxNumber = 12;
        break;
    case CPDayDateType:
        self._minNumber = 1;
        self._maxNumber = 31;
        break;
    case CPYearDateType:
        self._minNumber = 0;
        self._maxNumber = 9999;
        break;
    case CPHourDateType:
        self._minNumber = 0;
        self._maxNumber = 23;
        break;
    case CPSecondDateType:
        self._minNumber = 0;
        self._maxNumber = 59;
        break;
    case CPMinuteDateType:
        self._minNumber = 0;
        self._maxNumber = 59;
        break;
    }
}
,["void","int"]), new objj_method(sel_getUid("maxNumber"), function $_CPDatePickerElementTextField__maxNumber(self, _cmd)
{
    if (self._dateType == CPDayDateType)
        return objj_msgSend(objj_msgSend(self._datePicker, "dateValue"), "_daysInMonth");
    return self._maxNumber;
}
,["int"]), new objj_method(sel_getUid("_maxNumberWithMaxDate"), function $_CPDatePickerElementTextField___maxNumberWithMaxDate(self, _cmd)
{
    var maxDate = objj_msgSend(self._datePicker, "maxDate"),
        date = objj_msgSend(self._datePicker, "dateValue");
    if (maxDate)
    {
        switch(self._dateType) {
        case CPMonthDateType:
            if (maxDate.getFullYear() == date.getFullYear())
                return maxDate.getMonth();
            break;
        case CPDayDateType:
            if (maxDate.getFullYear() == date.getFullYear() && maxDate.getMonth() == date.getMonth())
                return maxDate.getDate();
            break;
        case CPYearDateType:
            return maxDate.getFullYear();
        case CPHourDateType:
            if (maxDate.getFullYear() == date.getFullYear() && maxDate.getMonth() == date.getMonth() && maxDate.getDate() == date.getDate())
                return maxDate.getHours();
            break;
        case CPSecondDateType:
            if (maxDate.getFullYear() == date.getFullYear() && maxDate.getMonth() == date.getMonth() && maxDate.getDate() == date.getDate() && maxDate.getHours() == date.getHours() && maxDate.getMinutes() == date.getMinutes())
                return maxDate.getSeconds();
            break;
        case CPMinuteDateType:
            if (maxDate.getFullYear() == date.getFullYear() && maxDate.getMonth() == date.getMonth() && maxDate.getDate() == date.getDate() && maxDate.getHours() == date.getHours())
                return maxDate.getMinutes();
            break;
        }
    }
    return self._maxNumber;
}
,["int"]), new objj_method(sel_getUid("setValueForKeyEvent:"), function $_CPDatePickerElementTextField__setValueForKeyEvent_(self, _cmd, anEvent)
{
    var keyCode = objj_msgSend(anEvent, "keyCode");
    if (keyCode != CPDeleteKeyCode && keyCode != CPDeleteForwardKeyCode && keyCode < CPZeroKeyCode || keyCode > CPNineKeyCode)
        return;
    var newValue = objj_msgSend(self, "stringValue").replace(/\s/g, ''),
        length = objj_msgSend(newValue, "length"),
        eventKeyValue = (parseInt(objj_msgSend(anEvent, "characters"))).toString();
    if (keyCode == CPDeleteKeyCode || keyCode == CPDeleteForwardKeyCode)
    {
        objj_msgSend(self._timerEdition, "invalidate");
        self._timerEdition = nil;
        newValue = objj_msgSend(newValue, "substringToIndex:", length - 1);
    }
    else
    {
        if (!self._timerEdition)
        {
            self._timerEdition = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 2, self, sel_getUid("_timerKeyEvent:"), nil, NO);
            if (self._firstEvent || !length)
                newValue = eventKeyValue;
            else
                newValue = (parseInt(newValue)).toString() + eventKeyValue;
        }
        else
        {
            var newFireDate = objj_msgSend(CPDate, "date");
            newFireDate.setSeconds(newFireDate.getSeconds() + 2);
            objj_msgSend(self._timerEdition, "setFireDate:", newFireDate);
            newValue = (parseInt(newValue)).toString() + eventKeyValue;
        }
    }
    if (parseInt(newValue) > objj_msgSend(self, "_maxNumberWithMaxDate") || objj_msgSend(self._datePicker, "_isEnglishFormat") && self._dateType == CPHourDateType && parseInt(newValue) > 12)
        return;
    self._firstEvent = NO;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementTextField").super_class }, "setObjectValue:", newValue);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_timerKeyEvent:"), function $_CPDatePickerElementTextField___timerKeyEvent_(self, _cmd, sender)
{
    var stringValue = objj_msgSend(self, "stringValue");
    self._timerEdition = nil;
    if (objj_msgSend(stringValue, "length"))
    {
        if (objj_msgSend(self._datePicker, "_isEnglishFormat") && objj_msgSend(self, "dateType") == CPHourDateType)
        {
            var isAMHour = objj_msgSend(objj_msgSend(self, "superview"), "_isAMHour");
            if (!isAMHour && stringValue != 12)
                stringValue = parseInt(stringValue) + 12;
            if (stringValue == 12 && !isAMHour)
                stringValue = 12;
            else if (stringValue == 12)
                stringValue = 0;
        }
        objj_msgSend(self, "setObjectValue:", stringValue);
    }
}
,["void","id"]), new objj_method(sel_getUid("_invalidTimer"), function $_CPDatePickerElementTextField___invalidTimer(self, _cmd)
{
    if (self._timerEdition)
    {
        objj_msgSend(self._timerEdition, "invalidate");
        self._timerEdition = nil;
    }
}
,["void"]), new objj_method(sel_getUid("_endEditing"), function $_CPDatePickerElementTextField___endEditing(self, _cmd)
{
    if (self._timerEdition)
        objj_msgSend(self._timerEdition, "invalidate");
    self._timerEdition = nil;
    var objectValue = objj_msgSend(self, "stringValue");
    if (!objj_msgSend(objectValue, "length"))
        objectValue = objj_msgSend(self, "objectValue");
    if (objj_msgSend(self._datePicker, "_isEnglishFormat") && objj_msgSend(self, "dateType") == CPHourDateType)
    {
        var isAMHour = objj_msgSend(objj_msgSend(self, "superview"), "_isAMHour");
        if (!isAMHour && objectValue != 12)
            objectValue = parseInt(objectValue) + 12;
        if (objectValue == 12 && !isAMHour)
            objectValue = 12;
        else if (objectValue == 12)
            objectValue = 0;
    }
    objj_msgSend(self, "setObjectValue:", objectValue);
}
,["void"]), new objj_method(sel_getUid("setStringValue:"), function $_CPDatePickerElementTextField__setStringValue_(self, _cmd, aStringValue)
{
    if (self._dateType == CPYearDateType)
    {
        while (objj_msgSend(aStringValue, "length") < 4)
            aStringValue = "0" + aStringValue;
    }
    else if (self._dateType != CPAMPMDateType)
    {
        if (self._dateType == CPHourDateType && objj_msgSend(self._datePicker, "_isEnglishFormat"))
        {
            var value = parseInt(aStringValue);
            if (value == 0)
                value = 12;
            else if (value > 12)
                value = value - 12;
            aStringValue = value.toString();
        }
        while (objj_msgSend(aStringValue, "length") < 2)
        {
            if (self._dateType == CPSecondDateType || self._dateType == CPMinuteDateType)
                aStringValue = "0" + aStringValue;
            else
                aStringValue = " " + aStringValue;
        }
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementTextField").super_class }, "setObjectValue:", aStringValue);
}
,["void","CPString"]), new objj_method(sel_getUid("setObjectValue:"), function $_CPDatePickerElementTextField__setObjectValue_(self, _cmd, anObjectValue)
{
    var dateValue = objj_msgSend(objj_msgSend(self._datePicker, "dateValue"), "copy"),
        lengthString = objj_msgSend(objj_msgSend(self, "stringValue"), "length"),
        objectValue = parseInt(anObjectValue);
    switch(self._dateType) {
    case CPMonthDateType:
        if (objectValue == 0 || !lengthString)
        {
            objj_msgSend(self, "setStringValue:", (dateValue.getMonth() + 1).toString());
            return;
        }
        var dateNextMonth = objj_msgSend(dateValue, "copy");
        dateNextMonth.setDate(1);
        dateNextMonth.setMonth(parseInt(anObjectValue) - 1);
        var numberDayNextMonth = objj_msgSend(dateNextMonth, "_daysInMonth");
        if (numberDayNextMonth < objj_msgSend(dateValue, "_daysInMonth") && dateValue.getDate() > numberDayNextMonth)
            objj_msgSend(self._datePickerElementView, "setDayDateValue:", numberDayNextMonth.toString());
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementTextField").super_class }, "setObjectValue:", objectValue);
        break;
    case CPDayDateType:
        if (objectValue == 0 || !lengthString)
        {
            objj_msgSend(self, "setStringValue:", (dateValue.getDate()).toString());
            return;
        }
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementTextField").super_class }, "setObjectValue:", objectValue);
        break;
    case CPYearDateType:
        if (objectValue == 0 || !lengthString)
        {
            objj_msgSend(self, "setStringValue:", (dateValue.getFullYear()).toString());
            return;
        }
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementTextField").super_class }, "setObjectValue:", objectValue);
        break;
    case CPHourDateType:
        if (!lengthString)
        {
            objj_msgSend(self, "setStringValue:", (dateValue.getHours()).toString());
            return;
        }
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementTextField").super_class }, "setObjectValue:", objectValue);
        break;
    case CPSecondDateType:
        if (!lengthString)
        {
            objj_msgSend(self, "setStringValue:", (dateValue.getSeconds()).toString());
            return;
        }
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementTextField").super_class }, "setObjectValue:", objectValue);
        break;
    case CPMinuteDateType:
        if (!lengthString)
        {
            objj_msgSend(self, "setStringValue:", (dateValue.getMinutes()).toString());
            return;
        }
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementTextField").super_class }, "setObjectValue:", objectValue);
        break;
    }
    var newDateValue = objj_msgSend(self._datePickerElementView, "dateValue"),
        timeZone = objj_msgSend(self._datePicker, "timeZone");
    if (timeZone)
    {
        var secondsFromGMT = objj_msgSend(timeZone, "secondsFromGMTForDate:", newDateValue),
            secondsFromGMTTimeZone = objj_msgSend(timeZone, "secondsFromGMT");
        newDateValue.setSeconds(newDateValue.getSeconds() + secondsFromGMT - secondsFromGMTTimeZone);
    }
    objj_msgSend(self._datePicker, "setDateValue:", newDateValue);
}
,["void","id"]), new objj_method(sel_getUid("mouseDown:"), function $_CPDatePickerElementTextField__mouseDown_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDatePickerElementTextField").super_class }, "mouseDown:", anEvent);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPDatePickerElementTextFieldBecomeFirstResponder, objj_msgSend(objj_msgSend(self, "superview"), "superview"), objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", self, "textField"));
}
,["void","CPEvent"]), new objj_method(sel_getUid("makeSelectable"), function $_CPDatePickerElementTextField__makeSelectable(self, _cmd)
{
    objj_msgSend(self, "setThemeState:", CPThemeStateSelected);
}
,["void"]), new objj_method(sel_getUid("makeDeselectable"), function $_CPDatePickerElementTextField__makeDeselectable(self, _cmd)
{
    self._firstEvent = YES;
    objj_msgSend(self, "unsetThemeState:", CPThemeStateSelected);
}
,["void"]), new objj_method(sel_getUid("_minimumFrameSize"), function $_CPDatePickerElementTextField___minimumFrameSize(self, _cmd)
{
    var frameSize = objj_msgSend(self, "frameSize"),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset"),
        minSize = objj_msgSend(self, "currentValueForThemeAttribute:", "min-size"),
        maxSize = objj_msgSend(self, "currentValueForThemeAttribute:", "max-size"),
        lineBreakMode = objj_msgSend(self, "lineBreakMode"),
        text = self._dateType == CPYearDateType ? "0000" : "00",
        textSize = CGSizeMakeCopy(frameSize),
        font = objj_msgSend(self, "currentValueForThemeAttribute:", "font");
    textSize.width -= contentInset.left + contentInset.right;
    textSize.height -= contentInset.top + contentInset.bottom;
    if (self._dateType == CPAMPMDateType)
        text = objj_msgSend(self, "stringValue");
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
,["CGSize"])]);
}