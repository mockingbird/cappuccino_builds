@STATIC;1.0;t;721;
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPColorSpace"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_cgColorSpace")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithCGColorSpace:"),function(_4,_5,_6){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPColorSpace").super_class},"init")){
_cgColorSpace=_6;
}
return _4;
}
}),new objj_method(sel_getUid("CGColorSpace"),function(_7,_8){
with(_7){
return _cgColorSpace;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sRGBColorSpace"),function(_9,_a){
with(_9){
if(!_1){
_1=objj_msgSend(objj_msgSend(_9,"alloc"),"initWithCGColorSpace:",CGColorSpaceCreateDeviceRGB());
}
return _1;
}
})]);
