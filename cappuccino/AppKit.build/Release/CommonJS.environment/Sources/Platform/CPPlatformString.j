@STATIC;1.0;I;21;Foundation/CPObject.jt;830;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"CPBasePlatformString"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("bootstrap"),function(_3,_4){
with(_3){
}
}),new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"),function(_5,_6,_7,_8,_9){
with(_5){
return {width:0,height:0};
}
})]);
var _1=objj_allocateClassPair(CPBasePlatformString,"CPPlatformString"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"),function(_a,_b,_c,_d,_e){
with(_a){
return {width:0,height:0};
}
}),new objj_method(sel_getUid("metricsOfFont:"),function(_f,_10,_11){
with(_f){
return objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",0,"ascender",0,"descender",0,"lineHeight");
}
})]);
