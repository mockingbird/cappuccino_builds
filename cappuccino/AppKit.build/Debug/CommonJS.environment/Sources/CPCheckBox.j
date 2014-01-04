@STATIC;1.0;i;10;CPButton.jt;5196;

objj_executeFile("CPButton.j", YES);


CPCheckBoxImageOffset = 4.0;

{var the_class = objj_allocateClassPair(CPButton, "CPCheckBox"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPCheckBox__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCheckBox").super_class }, "initWithFrame:", aFrame);

    if (self)
    {
        objj_msgSend(self, "setHighlightsBy:", CPContentsCellMask);
        objj_msgSend(self, "setShowsStateBy:", CPContentsCellMask);


        objj_msgSend(self, "setImagePosition:", CPImageLeft);
        objj_msgSend(self, "setAlignment:", CPLeftTextAlignment);

        objj_msgSend(self, "setBordered:", NO);
    }

    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("takeStateFromKeyPath:ofObjects:"), function $CPCheckBox__takeStateFromKeyPath_ofObjects_(self, _cmd, aKeyPath, objects)
{ with(self)
{
    var count = objects.length,
        value = objj_msgSend(objects[0], "valueForKeyPath:", aKeyPath) ? CPOnState : CPOffState;

    objj_msgSend(self, "setAllowsMixedState:", NO);
    objj_msgSend(self, "setState:", value);

    while (count-- > 1)
    {
        if (value !== (objj_msgSend(objects[count], "valueForKeyPath:", aKeyPath) ? CPOnState : CPOffState))
        {
            objj_msgSend(self, "setAllowsMixedState:", YES);
            objj_msgSend(self, "setState:", CPMixedState);
        }
    }
}
},["void","CPString","CPArray"]), new objj_method(sel_getUid("takeValueFromKeyPath:ofObjects:"), function $CPCheckBox__takeValueFromKeyPath_ofObjects_(self, _cmd, aKeyPath, objects)
{ with(self)
{
    objj_msgSend(self, "takeStateFromKeyPath:ofObjects:", aKeyPath, objects);
}
},["void","CPString","CPArray"]), new objj_method(sel_getUid("image"), function $CPCheckBox__image(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "image");
}
},["CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPCheckBox__alternateImage(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "image");
}
},["CPImage"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPCheckBox__startTrackingAt_(self, _cmd, aPoint)
{ with(self)
{
    var startedTracking = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCheckBox").super_class }, "startTrackingAt:", aPoint);
    objj_msgSend(self, "highlight:", YES);
    return startedTracking;
}
},["BOOL","CGPoint"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("checkBoxWithTitle:theme:"), function $CPCheckBox__checkBoxWithTitle_theme_(self, _cmd, aTitle, aTheme)
{ with(self)
{
    return objj_msgSend(self, "buttonWithTitle:theme:", aTitle, aTheme);
}
},["id","CPString","CPTheme"]), new objj_method(sel_getUid("checkBoxWithTitle:"), function $CPCheckBox__checkBoxWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(self, "buttonWithTitle:", aTitle);
}
},["id","CPString"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPCheckBox__defaultThemeClass(self, _cmd)
{ with(self)
{
    return "check-box";
}
},["CPString"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPCheckBox___binderClassForBinding_(self, _cmd, theBinding)
{ with(self)
{
    if (theBinding === CPValueBinding)
        return objj_msgSend(_CPCheckBoxValueBinder, "class");

    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPCheckBox").super_class }, "_binderClassForBinding:", theBinding);
}
},["Class","CPString"])]);
}

{var the_class = objj_allocateClassPair(CPBinder, "_CPCheckBoxValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $_CPCheckBoxValueBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCheckBoxValueBinder").super_class }, "_updatePlaceholdersWithOptions:", options);

    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", CPMixedState, CPMultipleValuesMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", CPOffState, CPNoSelectionMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", CPOffState, CPNotApplicableMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", CPOffState, CPNullMarker, YES);
}
},["void","CPDictionary"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPCheckBoxValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{ with(self)
{
    objj_msgSend(_source, "setAllowsMixedState:", (aValue === CPMixedState));
    objj_msgSend(_source, "setState:", aValue);
}
},["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $_CPCheckBoxValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{ with(self)
{
    objj_msgSend(_source, "setState:", aValue);
}
},["void","id","CPString"])]);
}

