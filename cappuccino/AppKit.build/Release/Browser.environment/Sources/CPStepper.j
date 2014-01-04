@STATIC;1.0;I;18;AppKit/CPControl.jI;17;AppKit/CPButton.jI;20;AppKit/CPTextField.jt;9222;
objj_executeFile("AppKit/CPControl.j",NO);
objj_executeFile("AppKit/CPButton.j",NO);
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=objj_allocateClassPair(CPControl,"CPStepper"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_valueWraps"),new objj_ivar("_autorepeat"),new objj_ivar("_increment"),new objj_ivar("_maxValue"),new objj_ivar("_minValue"),new objj_ivar("_buttonDown"),new objj_ivar("_buttonUp")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("valueWraps"),function(_3,_4){
with(_3){
return _valueWraps;
}
}),new objj_method(sel_getUid("setValueWraps:"),function(_5,_6,_7){
with(_5){
_valueWraps=_7;
}
}),new objj_method(sel_getUid("autorepeat"),function(_8,_9){
with(_8){
return _autorepeat;
}
}),new objj_method(sel_getUid("_setAutorepeat:"),function(_a,_b,_c){
with(_a){
_autorepeat=_c;
}
}),new objj_method(sel_getUid("increment"),function(_d,_e){
with(_d){
return _increment;
}
}),new objj_method(sel_getUid("setIncrement:"),function(_f,_10,_11){
with(_f){
_increment=_11;
}
}),new objj_method(sel_getUid("maxValue"),function(_12,_13){
with(_12){
return _maxValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_14,_15,_16){
with(_14){
_maxValue=_16;
}
}),new objj_method(sel_getUid("minValue"),function(_17,_18){
with(_17){
return _minValue;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_19,_1a,_1b){
with(_19){
_minValue=_1b;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_1c,_1d,_1e){
with(_1c){
if(_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPStepper").super_class},"initWithFrame:",_1e)){
_maxValue=59;
_minValue=0;
_increment=1;
_valueWraps=YES;
_autorepeat=YES;
objj_msgSend(_1c,"setDoubleValue:",0);
objj_msgSend(_1c,"_init");
}
return _1c;
}
}),new objj_method(sel_getUid("_init"),function(_1f,_20){
with(_1f){
_buttonUp=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_buttonUp,"setContinuous:",_autorepeat);
objj_msgSend(_buttonUp,"setTarget:",_1f);
objj_msgSend(_buttonUp,"setAction:",sel_getUid("_buttonDidClick:"));
objj_msgSend(_buttonUp,"setAutoresizingMask:",CPViewNotSizable);
objj_msgSend(_1f,"addSubview:",_buttonUp);
_buttonDown=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_buttonDown,"setContinuous:",_autorepeat);
objj_msgSend(_buttonDown,"setTarget:",_1f);
objj_msgSend(_buttonDown,"setAction:",sel_getUid("_buttonDidClick:"));
objj_msgSend(_buttonDown,"setAutoresizingMask:",CPViewNotSizable);
objj_msgSend(_1f,"setContinuous:",_autorepeat);
objj_msgSend(_1f,"addSubview:",_buttonDown);
objj_msgSend(_1f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setEnabled:"),function(_21,_22,_23){
with(_21){
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("CPStepper").super_class},"setEnabled:",_23);
objj_msgSend(_buttonUp,"setEnabled:",_23);
objj_msgSend(_buttonDown,"setEnabled:",_23);
}
}),new objj_method(sel_getUid("setFrame:"),function(_24,_25,_26){
with(_24){
var _27=objj_msgSend(_24,"valueForThemeAttribute:","up-button-size"),_28=objj_msgSend(_24,"valueForThemeAttribute:","down-button-size"),_29={width:_27.width,height:_27.height+_28.height},_2a={origin:{x:_26.origin.x,y:_26.origin.y},size:{width:_26.size.width,height:_26.size.height}};
_2a.size.width=MAX(_29.width,_2a.size.width);
_2a.size.height=MAX(_29.height,_2a.size.height);
objj_msgSendSuper({receiver:_24,super_class:objj_getClass("CPStepper").super_class},"setFrame:",_2a);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_2b,_2c){
with(_2b){
var _2d=objj_msgSend(_2b,"frame"),_2e=objj_msgSend(_2b,"valueForThemeAttribute:","up-button-size"),_2f=objj_msgSend(_2b,"valueForThemeAttribute:","down-button-size"),_30={origin:{x:_2d.size.width-_2e.width,y:0},size:{width:_2e.width,height:_2e.height}},_31={origin:{x:_2d.size.width-_2f.width,y:_2e.height},size:{width:_2f.width,height:_2f.height}};
objj_msgSend(_buttonUp,"setFrame:",_30);
objj_msgSend(_buttonDown,"setFrame:",_31);
objj_msgSend(_buttonUp,"setValue:forThemeAttribute:inState:",objj_msgSend(_2b,"valueForThemeAttribute:inState:","bezel-color-up-button",CPThemeStateBordered),"bezel-color",CPThemeStateBordered);
objj_msgSend(_buttonUp,"setValue:forThemeAttribute:inState:",objj_msgSend(_2b,"valueForThemeAttribute:inState:","bezel-color-up-button",CPThemeStateBordered|CPThemeStateDisabled),"bezel-color",CPThemeStateBordered|CPThemeStateDisabled);
objj_msgSend(_buttonUp,"setValue:forThemeAttribute:inState:",objj_msgSend(_2b,"valueForThemeAttribute:inState:","bezel-color-up-button",CPThemeStateBordered|CPThemeStateHighlighted),"bezel-color",CPThemeStateBordered|CPThemeStateHighlighted);
objj_msgSend(_buttonDown,"setValue:forThemeAttribute:inState:",objj_msgSend(_2b,"valueForThemeAttribute:inState:","bezel-color-down-button",CPThemeStateBordered),"bezel-color",CPThemeStateBordered);
objj_msgSend(_buttonDown,"setValue:forThemeAttribute:inState:",objj_msgSend(_2b,"valueForThemeAttribute:inState:","bezel-color-down-button",CPThemeStateBordered|CPThemeStateDisabled),"bezel-color",CPThemeStateBordered|CPThemeStateDisabled);
objj_msgSend(_buttonDown,"setValue:forThemeAttribute:inState:",objj_msgSend(_2b,"valueForThemeAttribute:inState:","bezel-color-down-button",CPThemeStateBordered|CPThemeStateHighlighted),"bezel-color",CPThemeStateBordered|CPThemeStateHighlighted);
}
}),new objj_method(sel_getUid("setAutorepeat:"),function(_32,_33,_34){
with(_32){
if(_34!==_autorepeat){
objj_msgSend(_buttonUp,"setContinuous:",_34);
objj_msgSend(_buttonDown,"setContinuous:",_34);
}
objj_msgSend(_32,"setContinuous:",_34);
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_35,_36,_37){
with(_35){
if(_37>_maxValue){
objj_msgSendSuper({receiver:_35,super_class:objj_getClass("CPStepper").super_class},"setDoubleValue:",_valueWraps?_minValue:_maxValue);
}else{
if(_37<_minValue){
objj_msgSendSuper({receiver:_35,super_class:objj_getClass("CPStepper").super_class},"setDoubleValue:",_valueWraps?_maxValue:_minValue);
}else{
objj_msgSendSuper({receiver:_35,super_class:objj_getClass("CPStepper").super_class},"setDoubleValue:",_37);
}
}
}
}),new objj_method(sel_getUid("_buttonDidClick:"),function(_38,_39,_3a){
with(_38){
if(!objj_msgSend(_38,"isEnabled")){
return;
}
if(_3a==_buttonUp){
objj_msgSend(_38,"setDoubleValue:",(objj_msgSend(_38,"doubleValue")+_increment));
}else{
objj_msgSend(_38,"setDoubleValue:",(objj_msgSend(_38,"doubleValue")-_increment));
}
if(_target&&_action&&objj_msgSend(_target,"respondsToSelector:",_action)){
objj_msgSend(_38,"sendAction:to:",_action,_target);
}
}
}),new objj_method(sel_getUid("performClickUp:"),function(_3b,_3c,_3d){
with(_3b){
objj_msgSend(_buttonUp,"performClick:",_3d);
}
}),new objj_method(sel_getUid("performClickDown:"),function(_3e,_3f,_40){
with(_3e){
objj_msgSend(_buttonDown,"performClick:",_40);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("stepperWithInitialValue:minValue:maxValue:"),function(_41,_42,_43,_44,_45){
with(_41){
var _46=objj_msgSend(objj_msgSend(CPStepper,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:19,height:25}});
objj_msgSend(_46,"setDoubleValue:",_43);
objj_msgSend(_46,"setMinValue:",_44);
objj_msgSend(_46,"setMaxValue:",_45);
return _46;
}
}),new objj_method(sel_getUid("stepper"),function(_47,_48){
with(_47){
return objj_msgSend(CPStepper,"stepperWithInitialValue:minValue:maxValue:",0,0,59);
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(_49,_4a){
with(_49){
return "stepper";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_4b,_4c){
with(_4b){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),{width:0,height:0},{width:0,height:0}],["bezel-color-up-button","bezel-color-down-button","up-button-size","down-button-size"]);
}
})]);
var _4d="CPStepperMinValue",_4e="CPStepperMaxValue",_4f="CPStepperValueWraps",_50="CPStepperAutorepeat",_51="CPStepperIncrement";
var _1=objj_getClass("CPStepper");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPStepper\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_52,_53,_54){
with(_52){
if(_52=objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPStepper").super_class},"initWithCoder:",_54)){
_increment=objj_msgSend(_54,"decodeIntForKey:",_51);
_minValue=objj_msgSend(_54,"decodeIntForKey:",_4d);
_maxValue=objj_msgSend(_54,"decodeIntForKey:",_4e);
_valueWraps=objj_msgSend(_54,"decodeBoolForKey:",_4f);
_autorepeat=objj_msgSend(_54,"decodeBoolForKey:",_50);
objj_msgSend(_52,"_init");
}
return _52;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_55,_56,_57){
with(_55){
objj_msgSendSuper({receiver:_55,super_class:objj_getClass("CPStepper").super_class},"encodeWithCoder:",_57);
objj_msgSend(_57,"encodeInt:forKey:",_increment,_51);
if(_minValue){
objj_msgSend(_57,"encodeInt:forKey:",_minValue,_4d);
}
if(_maxValue){
objj_msgSend(_57,"encodeInt:forKey:",_maxValue,_4e);
}
if(_valueWraps){
objj_msgSend(_57,"encodeBool:forKey:",_valueWraps,_4f);
}
if(_autorepeat){
objj_msgSend(_57,"encodeBool:forKey:",_autorepeat,_50);
}
}
})]);
