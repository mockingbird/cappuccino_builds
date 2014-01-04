@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;1459;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("stringForObjectValue:"),function(_3,_4,_5){
with(_3){
_CPRaiseInvalidAbstractInvocation(_3,_4);
return nil;
}
}),new objj_method(sel_getUid("editingStringForObjectValue:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"stringForObjectValue:",_8);
}
}),new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"),function(_9,_a,_b,_c,_d){
with(_9){
_CPRaiseInvalidAbstractInvocation(_9,_a);
return NO;
}
}),new objj_method(sel_getUid("isPartialStringValid:newEditingString:errorDescription:"),function(_e,_f,_10,_11,_12){
with(_e){
_10(nil);
if(_12){
_12(nil);
}
return YES;
}
}),new objj_method(sel_getUid("isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:"),function(_13,_14,_15,_16,_17,_18,_19){
with(_13){
var _1a=nil,_1b=objj_msgSend(_13,"isPartialStringValid:newEditingString:errorDescription:",_15,function(_1c){
if(arguments.length){
return _1a=_1c;
}
return _1a;
},_19);
if(!_1b){
_15(_1a);
if(_1a!==nil){
_16(CPMakeRange(_1a.length,0));
}
}
return _1b;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(_1d,"init");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_20,_21,_22){
with(_20){
}
})]);
