@STATIC;1.0;I;21;Foundation/CPObject.jI;18;Foundation/CPSet.ji;10;CPButton.jt;18529;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPSet.j", NO);objj_executeFile("CPButton.j", YES);CPRadioImageOffset = 4.0;
{var the_class = objj_allocateClassPair(CPButton, "CPRadio"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_radioGroup")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:radioGroup:"), function $CPRadio__initWithFrame_radioGroup_(self, _cmd, aFrame, aRadioGroup)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setRadioGroup:", aRadioGroup));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHighlightsBy:", CPContentsCellMask));
        (self == null ? null : self.isa.objj_msgSend1(self, "setShowsStateBy:", CPContentsCellMask));
        (self == null ? null : self.isa.objj_msgSend1(self, "setImagePosition:", CPImageLeft));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAlignment:", CPLeftTextAlignment));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBordered:", YES));
    }
    return self;
}
,["id","CGRect","CPRadioGroup"]), new objj_method(sel_getUid("initWithFrame:"), function $CPRadio__initWithFrame_(self, _cmd, aFrame)
{
    return self.isa.objj_msgSend2(self, "initWithFrame:radioGroup:", aFrame, (CPRadioGroup == null ? null : CPRadioGroup.isa.objj_msgSend0(CPRadioGroup, "new")));
}
,["id","CGRect"]), new objj_method(sel_getUid("nextState"), function $CPRadio__nextState(self, _cmd)
{
    return CPOnState;
}
,["CPInteger"]), new objj_method(sel_getUid("setRadioGroup:"), function $CPRadio__setRadioGroup_(self, _cmd, aRadioGroup)
{
    if (self._radioGroup === aRadioGroup)
        return;
    ((___r1 = self._radioGroup), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_removeRadio:", self));
    self._radioGroup = aRadioGroup;
    ((___r1 = self._radioGroup), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_addRadio:", self));
    var ___r1;
}
,["void","CPRadioGroup"]), new objj_method(sel_getUid("radioGroup"), function $CPRadio__radioGroup(self, _cmd)
{
    return self._radioGroup;
}
,["CPRadioGroup"]), new objj_method(sel_getUid("setObjectValue:"), function $CPRadio__setObjectValue_(self, _cmd, aValue)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "setObjectValue:", aValue);
    if (self.isa.objj_msgSend0(self, "state") === CPOnState)
        ((___r1 = self._radioGroup), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setSelectedRadio:", self));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("sendAction:to:"), function $CPRadio__sendAction_to_(self, _cmd, anAction, anObject)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "sendAction:to:", anAction, anObject);
    if (self._radioGroup)
        (CPApp == null ? null : CPApp.isa.objj_msgSend3(CPApp, "sendAction:to:from:", ((___r1 = self._radioGroup), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "action")), ((___r1 = self._radioGroup), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "target")), self._radioGroup));
    var ___r1;
}
,["BOOL","SEL","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("radioWithTitle:theme:"), function $CPRadio__radioWithTitle_theme_(self, _cmd, aTitle, aTheme)
{
    return self.isa.objj_msgSend2(self, "buttonWithTitle:theme:", aTitle, aTheme);
}
,["id","CPString","CPTheme"]), new objj_method(sel_getUid("radioWithTitle:"), function $CPRadio__radioWithTitle_(self, _cmd, aTitle)
{
    return self.isa.objj_msgSend1(self, "buttonWithTitle:", aTitle);
}
,["id","CPString"]), new objj_method(sel_getUid("standardButtonWithTitle:"), function $CPRadio__standardButtonWithTitle_(self, _cmd, aTitle)
{
    var button = ((___r1 = CPRadio.isa.objj_msgSend0(CPRadio, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTitle:", aTitle));
    return button;
    var ___r1;
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
        self._radioGroup = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPRadioRadioGroupKey));
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPRadio__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._radioGroup, CPRadioRadioGroupKey));
}
,["void","CPCoder"]), new objj_method(sel_getUid("image"), function $CPRadio__image(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "image");
}
,["CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPRadio__alternateImage(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "image");
}
,["CPImage"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPRadio__startTrackingAt_(self, _cmd, aPoint)
{
    var startedTracking = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRadio").super_class }, "startTrackingAt:", aPoint);
    self.isa.objj_msgSend1(self, "highlight:", YES);
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
        self.isa.objj_msgSend1(self, "_setSelectedRadio:", nil);
    else
    {
        var radio = ((___r1 = self._radios), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", index));
        self.isa.objj_msgSend1(self, "_setSelectedRadio:", radio);
        (radio == null ? null : radio.isa.objj_msgSend1(radio, "setState:", CPOnState));
    }
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("selectRadioWithTag:"), function $CPRadioGroup__selectRadioWithTag_(self, _cmd, tag)
{
    var index = ((___r1 = self._radios), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectPassingTest:", function(radio)
    {
        return (radio == null ? null : radio.isa.objj_msgSend0(radio, "tag")) === tag;
    }));
    if (index !== CPNotFound)
    {
        self.isa.objj_msgSend1(self, "selectRadioAtIndex:", index);
        return YES;
    }
    else
        return NO;
    var ___r1;
}
,["BOOL","int"]), new objj_method(sel_getUid("selectedRadio"), function $CPRadioGroup__selectedRadio(self, _cmd)
{
    return self._selectedRadio;
}
,["CPRadio"]), new objj_method(sel_getUid("selectedRadioIndex"), function $CPRadioGroup__selectedRadioIndex(self, _cmd)
{
    return ((___r1 = self._radios), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", self._selectedRadio));
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("radios"), function $CPRadioGroup__radios(self, _cmd)
{
    return self._radios;
}
,["CPArray"]), new objj_method(sel_getUid("setEnabled:"), function $CPRadioGroup__setEnabled_(self, _cmd, enabled)
{
    ((___r1 = self._radios), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setEnabled:"), enabled));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setHidden:"), function $CPRadioGroup__setHidden_(self, _cmd, hidden)
{
    ((___r1 = self._radios), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setHidden:"), hidden));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("_addRadio:"), function $CPRadioGroup___addRadio_(self, _cmd, aRadio)
{
    if (((___r1 = self._radios), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", aRadio)) === CPNotFound)
        ((___r1 = self._radios), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", aRadio));
    if ((aRadio == null ? null : aRadio.isa.objj_msgSend0(aRadio, "state")) === CPOnState)
        self.isa.objj_msgSend1(self, "_setSelectedRadio:", aRadio);
    var ___r1;
}
,["void","CPRadio"]), new objj_method(sel_getUid("_removeRadio:"), function $CPRadioGroup___removeRadio_(self, _cmd, aRadio)
{
    if (self._selectedRadio === aRadio)
        self._selectedRadio = nil;
    ((___r1 = self._radios), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", aRadio));
    var ___r1;
}
,["void","CPRadio"]), new objj_method(sel_getUid("_selectRadioWithTitle:"), function $CPRadioGroup___selectRadioWithTitle_(self, _cmd, aTitle)
{
    var index = ((___r1 = self._radios), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectPassingTest:", function(radio)
    {
        return (radio == null ? null : radio.isa.objj_msgSend0(radio, "title")) === aTitle;
    }));
    self.isa.objj_msgSend1(self, "selectRadioAtIndex:", index);
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("_setSelectedRadio:"), function $CPRadioGroup___setSelectedRadio_(self, _cmd, aRadio)
{
    if (self._selectedRadio === aRadio)
        return;
    ((___r1 = self._selectedRadio), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", CPOffState));
    self._selectedRadio = aRadio;
    (_CPRadioGroupSelectionBinder == null ? null : _CPRadioGroupSelectionBinder.isa.objj_msgSend1(_CPRadioGroupSelectionBinder, "_reverseSetValueFromExclusiveBinderForObject:", self));
    var ___r1;
}
,["void","CPRadio"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPRadioGroup__initialize(self, _cmd)
{
    if (self !== CPRadioGroup.isa.objj_msgSend0(CPRadioGroup, "class"))
        return;
    self.isa.objj_msgSend1(self, "exposeBinding:", CPSelectedValueBinding);
    self.isa.objj_msgSend1(self, "exposeBinding:", CPSelectedTagBinding);
    self.isa.objj_msgSend1(self, "exposeBinding:", CPSelectedIndexBinding);
    self.isa.objj_msgSend1(self, "exposeBinding:", CPEnabledBinding);
    self.isa.objj_msgSend1(self, "exposeBinding:", CPHiddenBinding);
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
        self._radios = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPRadioGroupRadiosKey));
        self._selectedRadio = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPRadioGroupSelectedRadioKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPRadioGroup__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._radios, CPRadioGroupRadiosKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._selectedRadio, CPRadioGroupSelectedRadioKey));
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
        return ((___r1 = CPClassFromString("_CPRadioGroup" + capitalizedBinding + "Binder")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "class"));
    }
    else if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPEnabledBinding)))
        return CPMultipleValueAndBinding.isa.objj_msgSend0(CPMultipleValueAndBinding, "class");
    else if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPHiddenBinding)))
        return CPMultipleValueOrBinding.isa.objj_msgSend0(CPMultipleValueOrBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPRadioGroup").super_class }, "_binderClassForBinding:", aBinding);
    var ___r1;
}
,["Class","CPString"]), new objj_method(sel_getUid("isBindingExclusive:"), function $CPRadioGroup__isBindingExclusive_(self, _cmd, aBinding)
{
    return aBinding == CPSelectedIndexBinding || aBinding == CPSelectedTagBinding || aBinding == CPSelectedValueBinding;
}
,["BOOL","CPString"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPRadioGroupSelectionBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPRadioGroupSelectionBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    self.isa.objj_msgSend2(self, "setValue:forBinding:", aValue, aBinding);
}
,["void","id","CPString","CPString"])]);
}{var the_class = objj_allocateClassPair(_CPRadioGroupSelectionBinder, "_CPRadioGroupSelectedIndexBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPRadioGroupSelectedIndexBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectRadioAtIndex:", aValue));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPRadioGroupSelectedIndexBinder__valueForBinding_(self, _cmd, aBinding)
{
    return ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRadioIndex"));
    var ___r1;
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(_CPRadioGroupSelectionBinder, "_CPRadioGroupSelectedTagBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPRadioGroupSelectedTagBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectRadioWithTag:", aValue));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPRadioGroupSelectedTagBinder__valueForBinding_(self, _cmd, aBinding)
{
    return ((___r1 = ((___r2 = self._source), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedRadio"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tag"));
    var ___r1, ___r2;
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(_CPRadioGroupSelectionBinder, "_CPRadioGroupSelectedValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPRadioGroupSelectedValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_selectRadioWithTitle:", aValue));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPRadioGroupSelectedValueBinder__valueForBinding_(self, _cmd, aBinding)
{
    return ((___r1 = ((___r2 = self._source), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedRadio"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "title"));
    var ___r1, ___r2;
}
,["id","CPString"])]);
}