@STATIC;1.0;i;11;Converter.jt;1871;
objj_executeFile("Converter.j",YES);
var _1={},_2={};
var _3="_CPCibClassSwapperClassNameKey",_4="_CPCibClassSwapperOriginalClassNameKey";
var _5=objj_allocateClassPair(_CPCibClassSwapper,"NSClassSwapper"),_6=_5.isa;
objj_registerClassPair(_5);
class_addMethods(_6,[new objj_method(sel_getUid("swapperClassForClassName:originalClassName:"),function(_7,_8,_9,_a){
with(_7){
var _b="$NSClassSwapper_"+_9+"_"+_a,_c=objj_lookUpClass(_b);
if(!_c){
var _d=nil;
if(objj_msgSend(objj_msgSend(objj_msgSend(Converter,"sharedConverter"),"userNSClasses"),"containsObject:",_9)){
_d=objj_lookUpClass("NS_"+_9);
}
var _e=_d||objj_lookUpClass(_a);
_c=objj_allocateClassPair(_e,_b);
objj_registerClassPair(_c);
class_addMethod(_c,sel_getUid("initWithCoder:"),function(_f,_10,_11){
if(_d){
_f.isa=_d;
_f=objj_msgSend(_f,_10,_11);
_f.isa=_c;
}else{
_f=objj_msgSendSuper({super_class:_e,receiver:_f},_10,_11);
}
if(_f){
var UID=objj_msgSend(_f,"UID");
_1[UID]=_9;
_2[UID]=_a;
}
return _f;
},"");
class_addMethod(_c,sel_getUid("classForKeyedArchiver"),function(_12,_13){
return objj_msgSend(_CPCibClassSwapper,"class");
},"");
class_addMethod(_c,sel_getUid("encodeWithCoder:"),function(_14,_15,_16){
if(_d){
_14.isa=_d;
objj_msgSend(_14,_15,_16);
_14.isa=_c;
}else{
objj_msgSendSuper({super_class:_e,receiver:_14},_15,_16);
}
if(_d){
var _17=objj_msgSend(_d,"classForKeyedArchiver");
if(_17){
_9=objj_msgSend(_17,"className");
}
}
objj_msgSend(_16,"encodeObject:forKey:",_9,_3);
objj_msgSend(_16,"encodeObject:forKey:",CP_NSMapClassName(_a),_4);
},"");
}
return _c;
}
}),new objj_method(sel_getUid("allocWithCoder:"),function(_18,_19,_1a){
with(_18){
var _1b=objj_msgSend(_1a,"decodeObjectForKey:","NSClassName"),_1c=objj_msgSend(_1a,"decodeObjectForKey:","NSOriginalClassName");
return objj_msgSend(objj_msgSend(_18,"swapperClassForClassName:originalClassName:",_1b,_1c),"alloc");
}
})]);
