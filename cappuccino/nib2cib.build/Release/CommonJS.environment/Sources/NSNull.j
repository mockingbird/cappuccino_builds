@STATIC;1.0;I;19;Foundation/CPNull.jt;392;
objj_executeFile("Foundation/CPNull.j",NO);
var _1=objj_allocateClassPair(CPNull,"NSNull"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(CPNull,"null");
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_6,_7){
with(_6){
return objj_msgSend(CPNull,"class");
}
})]);
