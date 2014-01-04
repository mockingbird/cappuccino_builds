@STATIC;1.0;I;21;Foundation/CPString.jI;21;AppKit/CPController.jt;7256;
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("AppKit/CPController.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPController,"CPUserDefaultsController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_defaults"),new objj_ivar("_initialValues"),new objj_ivar("_appliesImmediately")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("defaults"),function(_4,_5){
with(_4){
return _defaults;
}
}),new objj_method(sel_getUid("initialValues"),function(_6,_7){
with(_6){
return _initialValues;
}
}),new objj_method(sel_getUid("setInitialValues:"),function(_8,_9,_a){
with(_8){
_initialValues=_a;
}
}),new objj_method(sel_getUid("appliesImmediately"),function(_b,_c){
with(_b){
return _appliesImmediately;
}
}),new objj_method(sel_getUid("setAppliesImmediately:"),function(_d,_e,_f){
with(_d){
_appliesImmediately=_f;
}
}),new objj_method(sel_getUid("initWithDefaults:initialValues:"),function(_10,_11,_12,_13){
with(_10){
if(_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPUserDefaultsController").super_class},"init")){
if(!_12){
_12=objj_msgSend(CPUserDefaults,"standardUserDefaults");
}
_defaults=_12;
_initialValues=objj_msgSend(_13,"copy");
_appliesImmediately=YES;
_valueProxy=objj_msgSend(objj_msgSend(_CPUserDefaultsControllerProxy,"alloc"),"initWithController:",_10);
}
return _10;
}
}),new objj_method(sel_getUid("values"),function(_14,_15){
with(_14){
return _valueProxy;
}
}),new objj_method(sel_getUid("hasUnappliedChanges"),function(_16,_17){
with(_16){
return objj_msgSend(_valueProxy,"hasUnappliedChanges");
}
}),new objj_method(sel_getUid("save:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_valueProxy,"save");
}
}),new objj_method(sel_getUid("revert:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_valueProxy,"revert");
}
}),new objj_method(sel_getUid("revertToInitialValues:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_valueProxy,"revertToInitialValues");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedUserDefaultsController"),function(_21,_22){
with(_21){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPUserDefaultsController,"alloc"),"initWithDefaults:initialValues:",nil,nil);
}
return _1;
}
})]);
var _23="CPUserDefaultsControllerSharedKey";
var _2=objj_getClass("CPUserDefaultsController");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPUserDefaultsController\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_24,_25,_26){
with(_24){
if(objj_msgSend(_26,"decodeBoolForKey:",_23)){
return objj_msgSend(CPUserDefaultsController,"sharedUserDefaultsController");
}
_24=objj_msgSendSuper({receiver:_24,super_class:objj_getClass("CPUserDefaultsController").super_class},"initWithCoder:",_26);
if(_24){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"decoding of non-shared CPUserDefaultsController not implemented");
}
return _24;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_27,_28,_29){
with(_27){
objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPUserDefaultsController").super_class},"encodeWithCoder:",_29);
if(_27===_1){
objj_msgSend(_29,"encodeBool:forKey:",YES,_23);
return;
}
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"encoding of non-shared CPUserDefaultsController not implemented");
}
})]);
var _2=objj_allocateClassPair(CPObject,"_CPUserDefaultsControllerProxy"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_controller"),new objj_ivar("_cachedValues")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithController:"),function(_2a,_2b,_2c){
with(_2a){
if(_2a=objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("_CPUserDefaultsControllerProxy").super_class},"init")){
_controller=_2c;
_cachedValues=objj_msgSend(CPMutableDictionary,"dictionary");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_2a,sel_getUid("userDefaultsDidChange:"),CPUserDefaultsDidChangeNotification,objj_msgSend(_controller,"defaults"));
}
return _2a;
}
}),new objj_method(sel_getUid("dealloc"),function(_2d,_2e){
with(_2d){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:",_2d);
objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("_CPUserDefaultsControllerProxy").super_class},"dealloc");
}
}),new objj_method(sel_getUid("valueForKey:"),function(_2f,_30,_31){
with(_2f){
var _32=objj_msgSend(_cachedValues,"objectForKey:",_31);
if(_32===nil){
_32=objj_msgSend(objj_msgSend(_controller,"defaults"),"objectForKey:",_31);
if(_32===nil){
_32=objj_msgSend(objj_msgSend(_controller,"initialValues"),"objectForKey:",_31);
}
if(_32!==nil){
objj_msgSend(_cachedValues,"setObject:forKey:",_32,_31);
}
}
return _32;
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_33,_34,_35,_36){
with(_33){
objj_msgSend(_33,"willChangeValueForKey:",_36);
objj_msgSend(_cachedValues,"setObject:forKey:",_35,_36);
if(objj_msgSend(_controller,"appliesImmediately")){
objj_msgSend(objj_msgSend(_controller,"defaults"),"setObject:forKey:",_35,_36);
}
objj_msgSend(_33,"didChangeValueForKey:",_36);
}
}),new objj_method(sel_getUid("revert"),function(_37,_38){
with(_37){
var _39=objj_msgSend(_cachedValues,"allKeys"),_3a=objj_msgSend(_39,"count");
while(_3a--){
var key=_39[_3a];
objj_msgSend(_37,"willChangeValueForKey:",key);
objj_msgSend(_cachedValues,"removeObjectForKey:",key);
objj_msgSend(_37,"didChangeValueForKey:",key);
}
}
}),new objj_method(sel_getUid("save"),function(_3b,_3c){
with(_3b){
var _3d=objj_msgSend(_cachedValues,"allKeys"),_3e=objj_msgSend(_3d,"count");
while(_3e--){
var key=_3d[_3e];
objj_msgSend(objj_msgSend(_controller,"defaults"),"setObject:forKey:",objj_msgSend(_cachedValues,"objectForKey:",key),key);
}
}
}),new objj_method(sel_getUid("revertToInitialValues"),function(_3f,_40){
with(_3f){
var _41=objj_msgSend(_controller,"initialValues"),_42=objj_msgSend(_cachedValues,"allKeys"),_43=objj_msgSend(_42,"count");
while(_43--){
var key=_42[_43];
objj_msgSend(_3f,"willChangeValueForKey:",key);
var _44=objj_msgSend(_41,"objectForKey:",key);
if(_44!==nil){
objj_msgSend(_cachedValues,"setObject:forKey:",_44,key);
}else{
objj_msgSend(_cachedValues,"removeObjectForKey:",key);
}
objj_msgSend(_3f,"didChangeValueForKey:",key);
}
}
}),new objj_method(sel_getUid("userDefaultsDidChange:"),function(_45,_46,_47){
with(_45){
var _48=objj_msgSend(_controller,"defaults"),_49=objj_msgSend(_cachedValues,"allKeys"),_4a=objj_msgSend(_49,"count");
while(_4a--){
var key=_49[_4a],_4b=objj_msgSend(_cachedValues,"objectForKey:",key),_4c=objj_msgSend(_48,"objectForKey:",key);
if(!objj_msgSend(_4b,"isEqual:",_4c)){
objj_msgSend(_45,"willChangeValueForKey:",key);
objj_msgSend(_cachedValues,"setObject:forKey:",_4c,key);
objj_msgSend(_45,"didChangeValueForKey:",key);
}
}
}
}),new objj_method(sel_getUid("hasUnappliedChanges"),function(_4d,_4e){
with(_4d){
var _4f=objj_msgSend(_controller,"defaults"),_50=objj_msgSend(_cachedValues,"allKeys"),_51=objj_msgSend(_50,"count");
while(_51--){
var key=_50[_51],_52=objj_msgSend(_cachedValues,"objectForKey:",key),_53=objj_msgSend(_4f,"objectForKey:",key);
if(!objj_msgSend(_52,"isEqual:",_53)){
return YES;
}
}
return NO;
}
})]);
