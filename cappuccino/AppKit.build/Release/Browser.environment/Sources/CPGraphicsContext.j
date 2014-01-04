@STATIC;1.0;I;21;Foundation/CPObject.ji;11;CGContext.jt;1075;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CGContext.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPGraphicsContext"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_graphicsPort")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithGraphicsPort:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPGraphicsContext").super_class},"init");
if(_4){
_graphicsPort=_6;
}
return _4;
}
}),new objj_method(sel_getUid("graphicsPort"),function(_7,_8){
with(_7){
return _graphicsPort;
}
}),new objj_method(sel_getUid("isFlipped"),function(_9,_a){
with(_9){
return YES;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("currentContext"),function(_b,_c){
with(_b){
return _1;
}
}),new objj_method(sel_getUid("setCurrentContext:"),function(_d,_e,_f){
with(_d){
_1=_f;
}
}),new objj_method(sel_getUid("graphicsContextWithGraphicsPort:flipped:"),function(_10,_11,_12,_13){
with(_10){
return objj_msgSend(objj_msgSend(_10,"alloc"),"initWithGraphicsPort:",_12);
}
})]);
