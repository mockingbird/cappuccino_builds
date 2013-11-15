@STATIC;1.0;I;21;Foundation/CPObject.jI;18;Foundation/CPSet.ji;10;CPButton.jt;16964;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPSet.j", NO);objj_executeFile("CPButton.j", YES);CPRadioImageOffset = 4.0;
{var the_class = objj_allocateClassPair(CPButton, "CPRadio"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_radioGroup")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:radioGroup:"), function $CPRadio__initWithFrame_radioGroup_(self, _cmd, aFrame, aRadioGroup)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setRadioGroup:", aRadioGroup);
        objj_msgSend(self, "setHighlightsBy:", CPContentsCellMask);
        objj_msgSend(self, "setShowsStateBy:", CPContentsCellMask);
        objj_msgSend(self, "setImagePosition:", CPImageLeft);
        objj_msgSend(self, "setAlignment:", CPLeftTextAlignment);
        objj_msgSend(self, "setBordered:", YES);
    }
    return self;
}
,["id","CGRect","CPRadioGroup"]), new objj_method(sel_getUid("initWithFrame:"), function $CPRadio__initWithFrame_(self, _cmd, aFrame)
{
    return objj_msgSend(self, "initWithFrame:radioGroup:", aFrame, objj_msgSend(CPRadioGroup, "new"));
}
,["id","CGRect"]), new objj_method(sel_getUid("nextState"), function $CPRadio__nextState(self, _cmd)
{
    return CPOnState;
}
,["CPInteger"]), new objj_method(sel_getUid("setRadioGroup:"), function $CPRadio__setRadioGroup_(self, _cmd, aRadioGroup)
{
    if (self._radioGroup === aRadioGroup)
        return;
    objj_msgSend(self._radioGroup, "_removeRadio:", self);
    self._radioGroup = aRadioGroup;
    objj_msgSend(self._radioGroup, "_addRadio:", self);
}
,["void","CPRadioGroup"]), new objj_method(sel_getUid("radioGroup"), function $CPRadio__radioGroup(self, _cmd)
{
    return self._radioGroup;
}
,["CPRadioGroup"]), new objj_method(sel_getUid("setObjectValue:"), function $CPRadio__setObjectValue_(self, _cmd, aValue)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "setObjectValue:", aValue);
    if (objj_msgSend(self, "state") === CPOnState)
        objj_msgSend(self._radioGroup, "_setSelectedRadio:", self);
}
,["void","id"]), new objj_method(sel_getUid("sendAction:to:"), function $CPRadio__sendAction_to_(self, _cmd, anAction, anObject)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "sendAction:to:", anAction, anObject);
    if (self._radioGroup)
        objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(self._radioGroup, "action"), objj_msgSend(self._radioGroup, "target"), self._radioGroup);
}
,["void","SEL","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("radioWithTitle:theme:"), function $CPRadio__radioWithTitle_theme_(self, _cmd, aTitle, aTheme)
{
    return objj_msgSend(self, "buttonWithTitle:theme:", aTitle, aTheme);
}
,["id","CPString","CPTheme"]), new objj_method(sel_getUid("radioWithTitle:"), function $CPRadio__radioWithTitle_(self, _cmd, aTitle)
{
    return objj_msgSend(self, "buttonWithTitle:", aTitle);
}
,["id","CPString"]), new objj_method(sel_getUid("standardButtonWithTitle:"), function $CPRadio__standardButtonWithTitle_(self, _cmd, aTitle)
{
    var button = objj_msgSend(objj_msgSend(CPRadio, "alloc"), "init");
    objj_msgSend(button, "setTitle:", aTitle);
    return button;
}
,["CPButton","CPString"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPRadio__defaultThemeClass(self, _cmd)
{
    return "radio";
}
,["CPString"])]);
}var CPRadioRadioGroupKey = "CPRadioRadioGroupKey";
{
var the_class = objj_getClass("CPRadio")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPRadio\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPRadio__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "initWithCoder:", aCoder);
    if (self)
        self._radioGroup = objj_msgSend(aCoder, "decodeObjectForKey:", CPRadioRadioGroupKey);
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPRadio__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._radioGroup, CPRadioRadioGroupKey);
}
,["void","CPCoder"]), new objj_method(sel_getUid("image"), function $CPRadio__image(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "image");
}
,["CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPRadio__alternateImage(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "image");
}
,["CPImage"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPRadio__startTrackingAt_(self, _cmd, aPoint)
{
    var startedTracking = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "startTrackingAt:", aPoint);
    objj_msgSend(self, "highlight:", YES);
    return startedTracking;
}
,["BOOL","CGPoint"])]);
}{var the_class = objj_allocateClassPair(CPObject, "CPRadioGroup"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_radios"), new objj_ivar("_selectedRadio"), new objj_ivar("_enabled"), new objj_ivar("_hidden"), new objj_ivar("_target"), new objj_ivar("_action")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("enabled"), function $CPRadioGroup__enabled(self, _cmd)
{
    return self._enabled;
}
,["BOOL"]), new objj_method(sel_getUid("_setEnabled:"), function $CPRadioGroup___setEnabled_(self, _cmd, newValue)
{
    self._enabled = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("hidden"), function $CPRadioGroup__hidden(self, _cmd)
{
    return self._hidden;
}
,["BOOL"]), new objj_method(sel_getUid("_setHidden:"), function $CPRadioGroup___setHidden_(self, _cmd, newValue)
{
    self._hidden = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("target"), function $CPRadioGroup__target(self, _cmd)
{
    return self._target;
}
,["id"]), new objj_method(sel_getUid("setTarget:"), function $CPRadioGroup__setTarget_(self, _cmd, newValue)
{
    self._target = newValue;
}
,["void","id"]), new objj_method(sel_getUid("action"), function $CPRadioGroup__action(self, _cmd)
{
    return self._action;
}
,["SEL"]), new objj_method(sel_getUid("setAction:"), function $CPRadioGroup__setAction_(self, _cmd, newValue)
{
    self._action = newValue;
}
,["void","SEL"]), new objj_method(sel_getUid("init"), function $CPRadioGroup__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadioGroup").super_class }, "init");
    if (self)
    {
        self._radios = [];
        self._selectedRadio = nil;
        self._enabled = YES;
        self._hidden = NO;
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("selectRadioAtIndex:"), function $CPRadioGroup__selectRadioAtIndex_(self, _cmd, index)
{
    if (index === -1)
        objj_msgSend(self, "_setSelectedRadio:", nil);
    else
    {
        var radio = objj_msgSend(self._radios, "objectAtIndex:", index);
        objj_msgSend(self, "_setSelectedRadio:", radio);
        objj_msgSend(radio, "setState:", CPOnState);
    }
}
,["void","int"]), new objj_method(sel_getUid("selectRadioWithTag:"), function $CPRadioGroup__selectRadioWithTag_(self, _cmd, tag)
{
    var index = objj_msgSend(self._radios, "indexOfObjectPassingTest:", function(radio)
    {
        return objj_msgSend(radio, "tag") === tag;
    });
    if (index !== CPNotFound)
    {
        objj_msgSend(self, "selectRadioAtIndex:", index);
        return YES;
    }
    else
        return NO;
}
,["BOOL","int"]), new objj_method(sel_getUid("selectedRadio"), function $CPRadioGroup__selectedRadio(self, _cmd)
{
    return self._selectedRadio;
}
,["CPRadio"]), new objj_method(sel_getUid("selectedRadioIndex"), function $CPRadioGroup__selectedRadioIndex(self, _cmd)
{
    return objj_msgSend(self._radios, "indexOfObject:", self._selectedRadio);
}
,["int"]), new objj_method(sel_getUid("radios"), function $CPRadioGroup__radios(self, _cmd)
{
    return self._radios;
}
,["CPArray"]), new objj_method(sel_getUid("setEnabled:"), function $CPRadioGroup__setEnabled_(self, _cmd, enabled)
{
    objj_msgSend(self._radios, "makeObjectsPerformSelector:withObject:", sel_getUid("setEnabled:"), enabled);
}
,["void","BOOL"]), new objj_method(sel_getUid("setHidden:"), function $CPRadioGroup__setHidden_(self, _cmd, hidden)
{
    objj_msgSend(self._radios, "makeObjectsPerformSelector:withObject:", sel_getUid("setHidden:"), hidden);
}
,["void","BOOL"]), new objj_method(sel_getUid("_addRadio:"), function $CPRadioGroup___addRadio_(self, _cmd, aRadio)
{
    if (objj_msgSend(self._radios, "indexOfObject:", aRadio) === CPNotFound)
        objj_msgSend(self._radios, "addObject:", aRadio);
    if (objj_msgSend(aRadio, "state") === CPOnState)
        objj_msgSend(self, "_setSelectedRadio:", aRadio);
}
,["void","CPRadio"]), new objj_method(sel_getUid("_removeRadio:"), function $CPRadioGroup___removeRadio_(self, _cmd, aRadio)
{
    if (self._selectedRadio === aRadio)
        self._selectedRadio = nil;
    objj_msgSend(self._radios, "removeObject:", aRadio);
}
,["void","CPRadio"]), new objj_method(sel_getUid("_selectRadioWithTitle:"), function $CPRadioGroup___selectRadioWithTitle_(self, _cmd, aTitle)
{
    var index = objj_msgSend(self._radios, "indexOfObjectPassingTest:", function(radio)
    {
        return objj_msgSend(radio, "title") === aTitle;
    });
    objj_msgSend(self, "selectRadioAtIndex:", index);
}
,["void","CPString"]), new objj_method(sel_getUid("_setSelectedRadio:"), function $CPRadioGroup___setSelectedRadio_(self, _cmd, aRadio)
{
    if (self._selectedRadio === aRadio)
        return;
    objj_msgSend(self._selectedRadio, "setState:", CPOffState);
    self._selectedRadio = aRadio;
    objj_msgSend(_CPRadioGroupSelectionBinder, "reverseSetValueForObject:", self);
}
,["void","CPRadio"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPRadioGroup__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPRadioGroup, "class"))
        return;
    objj_msgSend(self, "exposeBinding:", CPSelectedValueBinding);
    objj_msgSend(self, "exposeBinding:", CPSelectedTagBinding);
    objj_msgSend(self, "exposeBinding:", CPSelectedIndexBinding);
    objj_msgSend(self, "exposeBinding:", CPEnabledBinding);
    objj_msgSend(self, "exposeBinding:", CPHiddenBinding);
}
,["void"])]);
}var CPRadioGroupRadiosKey = "CPRadioGroupRadiosKey",
    CPRadioGroupSelectedRadioKey = "CPRadioGroupSelectedRadioKey";
{
var the_class = objj_getClass("CPRadioGroup")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPRadioGroup\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPRadioGroup__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadioGroup").super_class }, "init");
    if (self)
    {
        self._radios = objj_msgSend(aCoder, "decodeObjectForKey:", CPRadioGroupRadiosKey);
        self._selectedRadio = objj_msgSend(aCoder, "decodeObjectForKey:", CPRadioGroupSelectedRadioKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPRadioGroup__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._radios, CPRadioGroupRadiosKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._selectedRadio, CPRadioGroupSelectedRadioKey);
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPRadioGroup")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPRadioGroup\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPRadioGroup___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPSelectedValueBinding || aBinding === CPSelectedTagBinding || aBinding === CPSelectedIndexBinding)
    {
        var capitalizedBinding = (aBinding.charAt(0)).toUpperCase() + aBinding.substr(1);
        return objj_msgSend(CPClassFromString("_CPRadioGroup" + capitalizedBinding + "Binder"), "class");
    }
    else if (objj_msgSend(aBinding, "hasPrefix:", CPEnabledBinding))
        return objj_msgSend(CPMultipleValueAndBinding, "class");
    else if (objj_msgSend(aBinding, "hasPrefix:", CPHiddenBinding))
        return objj_msgSend(CPMultipleValueOrBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPRadioGroup").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}var binderForObject = {};
{var the_class = objj_allocateClassPair(CPBinder, "_CPRadioGroupSelectionBinder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_selectionBinding")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_selectionBinding"), function $_CPRadioGroupSelectionBinder___selectionBinding(self, _cmd)
{
    return self._selectionBinding;
}
,["CPString"]), new objj_method(sel_getUid("_setSelectionBinding:"), function $_CPRadioGroupSelectionBinder___setSelectionBinding_(self, _cmd, newValue)
{
    self._selectionBinding = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("initWithBinding:name:to:keyPath:options:from:"), function $_CPRadioGroupSelectionBinder__initWithBinding_name_to_keyPath_options_from_(self, _cmd, aBinding, aName, aDestination, aKeyPath, options, aSource)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRadioGroupSelectionBinder").super_class }, "initWithBinding:name:to:keyPath:options:from:", aBinding, aName, aDestination, aKeyPath, options, aSource);
    if (self)
    {
        binderForObject[objj_msgSend(aSource, "UID")] = self;
        self._selectionBinding = aName;
    }
    return self;
}
,["id","CPString","CPString","id","CPString","CPDictionary","id"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPRadioGroupSelectionBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    objj_msgSend(self, "setValue:forBinding:", aValue, aBinding);
}
,["void","id","CPString","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("reverseSetValueForObject:"), function $_CPRadioGroupSelectionBinder__reverseSetValueForObject_(self, _cmd, aSource)
{
    var binder = binderForObject[objj_msgSend(aSource, "UID")];
    objj_msgSend(binder, "reverseSetValueFor:", objj_msgSend(binder, "_selectionBinding"));
}
,["void","id"])]);
}{var the_class = objj_allocateClassPair(_CPRadioGroupSelectionBinder, "_CPRadioGroupSelectedIndexBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPRadioGroupSelectedIndexBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    objj_msgSend(self._source, "selectRadioAtIndex:", aValue);
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPRadioGroupSelectedIndexBinder__valueForBinding_(self, _cmd, aBinding)
{
    return objj_msgSend(self._source, "selectedRadioIndex");
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(_CPRadioGroupSelectionBinder, "_CPRadioGroupSelectedTagBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPRadioGroupSelectedTagBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    objj_msgSend(self._source, "selectRadioWithTag:", aValue);
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPRadioGroupSelectedTagBinder__valueForBinding_(self, _cmd, aBinding)
{
    return objj_msgSend(objj_msgSend(self._source, "selectedRadio"), "tag");
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(_CPRadioGroupSelectionBinder, "_CPRadioGroupSelectedValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPRadioGroupSelectedValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    objj_msgSend(self._source, "_selectRadioWithTitle:", aValue);
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPRadioGroupSelectedValueBinder__valueForBinding_(self, _cmd, aBinding)
{
    return objj_msgSend(objj_msgSend(self._source, "selectedRadio"), "title");
}
,["id","CPString"])]);
}