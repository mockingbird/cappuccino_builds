@STATIC;1.0;i;10;CPButton.jt;5692;objj_executeFile("CPButton.j", YES);CPCheckBoxImageOffset = 4.0;
{var the_class = objj_allocateClassPair(CPButton, "CPCheckBox"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPCheckBox__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCheckBox").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setHighlightsBy:", CPContentsCellMask));
        (self == null ? null : self.isa.objj_msgSend1(self, "setShowsStateBy:", CPContentsCellMask));
        (self == null ? null : self.isa.objj_msgSend1(self, "setImagePosition:", CPImageLeft));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAlignment:", CPLeftTextAlignment));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBordered:", NO));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("takeStateFromKeyPath:ofObjects:"), function $CPCheckBox__takeStateFromKeyPath_ofObjects_(self, _cmd, aKeyPath, objects)
{
    var count = objects.length,
        value = ((___r1 = objects[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", aKeyPath)) ? CPOnState : CPOffState;
    self.isa.objj_msgSend1(self, "setAllowsMixedState:", NO);
    self.isa.objj_msgSend1(self, "setState:", value);
    while (count-- > 1)
    {
        if (value !== (((___r1 = objects[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", aKeyPath)) ? CPOnState : CPOffState))
        {
            self.isa.objj_msgSend1(self, "setAllowsMixedState:", YES);
            self.isa.objj_msgSend1(self, "setState:", CPMixedState);
        }
    }
    var ___r1;
}
,["void","CPString","CPArray"]), new objj_method(sel_getUid("takeValueFromKeyPath:ofObjects:"), function $CPCheckBox__takeValueFromKeyPath_ofObjects_(self, _cmd, aKeyPath, objects)
{
    self.isa.objj_msgSend2(self, "takeStateFromKeyPath:ofObjects:", aKeyPath, objects);
}
,["void","CPString","CPArray"]), new objj_method(sel_getUid("image"), function $CPCheckBox__image(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "image");
}
,["CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPCheckBox__alternateImage(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "image");
}
,["CPImage"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPCheckBox__startTrackingAt_(self, _cmd, aPoint)
{
    var startedTracking = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCheckBox").super_class }, "startTrackingAt:", aPoint);
    self.isa.objj_msgSend1(self, "highlight:", YES);
    return startedTracking;
}
,["BOOL","CGPoint"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("checkBoxWithTitle:theme:"), function $CPCheckBox__checkBoxWithTitle_theme_(self, _cmd, aTitle, aTheme)
{
    return self.isa.objj_msgSend2(self, "buttonWithTitle:theme:", aTitle, aTheme);
}
,["id","CPString","CPTheme"]), new objj_method(sel_getUid("checkBoxWithTitle:"), function $CPCheckBox__checkBoxWithTitle_(self, _cmd, aTitle)
{
    return self.isa.objj_msgSend1(self, "buttonWithTitle:", aTitle);
}
,["id","CPString"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPCheckBox__defaultThemeClass(self, _cmd)
{
    return "check-box";
}
,["CPString"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPCheckBox___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPValueBinding)
        return (_CPCheckBoxValueBinder == null ? null : _CPCheckBoxValueBinder.isa.objj_msgSend0(_CPCheckBoxValueBinder, "class"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPCheckBox").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPCheckBoxValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $_CPCheckBoxValueBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCheckBoxValueBinder").super_class }, "_updatePlaceholdersWithOptions:", options);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", CPMixedState, CPMultipleValuesMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", CPOffState, CPNoSelectionMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", CPOffState, CPNotApplicableMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", CPOffState, CPNullMarker, YES);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPCheckBoxValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAllowsMixedState:", aValue === CPMixedState));
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", aValue));
    var ___r1;
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $_CPCheckBoxValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", aValue));
    var ___r1;
}
,["void","id","CPString"])]);
}