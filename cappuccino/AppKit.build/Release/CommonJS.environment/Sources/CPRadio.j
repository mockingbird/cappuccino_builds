@STATIC;1.0;I;21;Foundation/CPObject.jI;18;Foundation/CPSet.ji;10;CPButton.jt;6300;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPSet.j",NO);
objj_executeFile("CPButton.j",YES);
CPRadioImageOffset=4;
var _1=objj_allocateClassPair(CPButton,"CPRadio"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_radioGroup")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:radioGroup:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPRadio").super_class},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setRadioGroup:",_6);
objj_msgSend(_3,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_3,"setShowsStateBy:",CPContentsCellMask);
objj_msgSend(_3,"setImagePosition:",CPImageLeft);
objj_msgSend(_3,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"initWithFrame:radioGroup:",_9,objj_msgSend(CPRadioGroup,"new"));
}
}),new objj_method(sel_getUid("nextState"),function(_a,_b){
with(_a){
return CPOnState;
}
}),new objj_method(sel_getUid("setRadioGroup:"),function(_c,_d,_e){
with(_c){
if(_radioGroup===_e){
return;
}
objj_msgSend(_radioGroup,"_removeRadio:",_c);
_radioGroup=_e;
objj_msgSend(_radioGroup,"_addRadio:",_c);
}
}),new objj_method(sel_getUid("radioGroup"),function(_f,_10){
with(_f){
return _radioGroup;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_11,_12,_13){
with(_11){
objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPRadio").super_class},"setObjectValue:",_13);
if(objj_msgSend(_11,"state")===CPOnState){
objj_msgSend(_radioGroup,"_setSelectedRadio:",_11);
}
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_14,_15,_16,_17){
with(_14){
objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPRadio").super_class},"sendAction:to:",_16,_17);
if(_radioGroup){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_radioGroup,"action"),objj_msgSend(_radioGroup,"target"),_radioGroup);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("radioWithTitle:theme:"),function(_18,_19,_1a,_1b){
with(_18){
return objj_msgSend(_18,"buttonWithTitle:theme:",_1a,_1b);
}
}),new objj_method(sel_getUid("radioWithTitle:"),function(_1c,_1d,_1e){
with(_1c){
return objj_msgSend(_1c,"buttonWithTitle:",_1e);
}
}),new objj_method(sel_getUid("standardButtonWithTitle:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(objj_msgSend(CPRadio,"alloc"),"init");
objj_msgSend(_22,"setTitle:",_21);
return _22;
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(_23,_24){
with(_23){
return "radio";
}
})]);
var _25="CPRadioRadioGroupKey";
var _1=objj_getClass("CPRadio");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPRadio\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_26,_27,_28){
with(_26){
_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("CPRadio").super_class},"initWithCoder:",_28);
if(_26){
_radioGroup=objj_msgSend(_28,"decodeObjectForKey:",_25);
}
return _26;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_29,_2a,_2b){
with(_29){
objj_msgSendSuper({receiver:_29,super_class:objj_getClass("CPRadio").super_class},"encodeWithCoder:",_2b);
objj_msgSend(_2b,"encodeObject:forKey:",_radioGroup,_25);
}
}),new objj_method(sel_getUid("image"),function(_2c,_2d){
with(_2c){
return objj_msgSend(_2c,"currentValueForThemeAttribute:","image");
}
}),new objj_method(sel_getUid("alternateImage"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_2e,"currentValueForThemeAttribute:","image");
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_30,_31,_32){
with(_30){
var _33=objj_msgSendSuper({receiver:_30,super_class:objj_getClass("CPRadio").super_class},"startTrackingAt:",_32);
objj_msgSend(_30,"highlight:",YES);
return _33;
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPRadioGroup"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_radios"),new objj_ivar("_selectedRadio"),new objj_ivar("_target"),new objj_ivar("_action")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("target"),function(_34,_35){
with(_34){
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_36,_37,_38){
with(_36){
_target=_38;
}
}),new objj_method(sel_getUid("action"),function(_39,_3a){
with(_39){
return _action;
}
}),new objj_method(sel_getUid("setAction:"),function(_3b,_3c,_3d){
with(_3b){
_action=_3d;
}
}),new objj_method(sel_getUid("init"),function(_3e,_3f){
with(_3e){
_3e=objj_msgSendSuper({receiver:_3e,super_class:objj_getClass("CPRadioGroup").super_class},"init");
if(_3e){
_radios=objj_msgSend(CPSet,"set");
_selectedRadio=nil;
}
return _3e;
}
}),new objj_method(sel_getUid("_addRadio:"),function(_40,_41,_42){
with(_40){
objj_msgSend(_radios,"addObject:",_42);
if(objj_msgSend(_42,"state")===CPOnState){
objj_msgSend(_40,"_setSelectedRadio:",_42);
}
}
}),new objj_method(sel_getUid("_removeRadio:"),function(_43,_44,_45){
with(_43){
if(_selectedRadio===_45){
_selectedRadio=nil;
}
objj_msgSend(_radios,"removeObject:",_45);
}
}),new objj_method(sel_getUid("_setSelectedRadio:"),function(_46,_47,_48){
with(_46){
if(_selectedRadio===_48){
return;
}
objj_msgSend(_selectedRadio,"setState:",CPOffState);
_selectedRadio=_48;
}
}),new objj_method(sel_getUid("selectedRadio"),function(_49,_4a){
with(_49){
return _selectedRadio;
}
}),new objj_method(sel_getUid("radios"),function(_4b,_4c){
with(_4b){
return objj_msgSend(_radios,"allObjects");
}
})]);
var _4d="CPRadioGroupRadiosKey",_4e="CPRadioGroupSelectedRadioKey";
var _1=objj_getClass("CPRadioGroup");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPRadioGroup\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_4f,_50,_51){
with(_4f){
_4f=objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("CPRadioGroup").super_class},"init");
if(_4f){
_radios=objj_msgSend(_51,"decodeObjectForKey:",_4d);
_selectedRadio=objj_msgSend(_51,"decodeObjectForKey:",_4e);
}
return _4f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_54,"encodeObject:forKey:",_radios,_4d);
objj_msgSend(_54,"encodeObject:forKey:",_selectedRadio,_4e);
}
})]);
