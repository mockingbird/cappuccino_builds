@STATIC;1.0;I;19;Foundation/CPDate.jI;21;Foundation/CPString.jI;24;Foundation/CPFormatter.jt;2681;
objj_executeFile("Foundation/CPDate.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPFormatter.j",NO);
CPDateFormatterNoStyle=0;
CPDateFormatterShortStyle=1;
CPDateFormatterMediumStyle=2;
CPDateFormatterLongStyle=3;
CPDateFormatterFullStyle=4;
var _1=objj_allocateClassPair(CPFormatter,"CPDateFormatter"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_dateStyle")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("dateStyle"),function(_3,_4){
with(_3){
return _dateStyle;
}
}),new objj_method(sel_getUid("setDateStyle:"),function(_5,_6,_7){
with(_5){
_dateStyle=_7;
}
}),new objj_method(sel_getUid("init"),function(_8,_9){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPDateFormatter").super_class},"init")){
_dateStyle=CPDateFormatterShortStyle;
}
return _8;
}
}),new objj_method(sel_getUid("stringFromDate:"),function(_a,_b,_c){
with(_a){
switch(_dateStyle){
case CPDateFormatterShortStyle:
var _d="d/m/Y";
return _c.dateFormat(_d);
default:
return objj_msgSend(_c,"description");
}
}
}),new objj_method(sel_getUid("dateFromString:"),function(_e,_f,_10){
with(_e){
if(!_10){
return nil;
}
switch(_dateStyle){
case CPDateFormatterShortStyle:
var _11="d/m/Y";
return Date.parseDate(string,_11);
default:
return Date.parseDate(string);
}
}
}),new objj_method(sel_getUid("stringForObjectValue:"),function(_12,_13,_14){
with(_12){
if(objj_msgSend(_14,"isKindOfClass:",objj_msgSend(CPDate,"class"))){
return objj_msgSend(_12,"stringFromDate:",_14);
}else{
return objj_msgSend(_14,"description");
}
}
}),new objj_method(sel_getUid("editingStringForObjectValue:"),function(_15,_16,_17){
with(_15){
return objj_msgSend(_15,"stringForObjectValue:",_17);
}
}),new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"),function(_18,_19,_1a,_1b,_1c){
with(_18){
var _1d=objj_msgSend(_18,"dateFromString:",_1b);
_1a(_1d);
return YES;
}
})]);
var _1e="CPDateFormatterStyle";
var _1=objj_getClass("CPDateFormatter");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDateFormatter\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_1f,_20,_21){
with(_1f){
_1f=objj_msgSendSuper({receiver:_1f,super_class:objj_getClass("CPDateFormatter").super_class},"initWithCoder:",_21);
if(_1f){
_dateStyle=objj_msgSend(_21,"decodeIntForKey:",_1e);
}
return _1f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_22,_23,_24){
with(_22){
objj_msgSendSuper({receiver:_22,super_class:objj_getClass("CPDateFormatter").super_class},"encodeWithCoder:",_24);
objj_msgSend(_24,"encodeInt:forKey:",_dateStyle,_1e);
}
})]);
