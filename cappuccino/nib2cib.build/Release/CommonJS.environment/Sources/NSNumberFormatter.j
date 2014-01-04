@STATIC;1.0;I;30;Foundation/CPNumberFormatter.jt;836;
objj_executeFile("Foundation/CPNumberFormatter.j",NO);
var _1=objj_getClass("CPNumberFormatter");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPNumberFormatter\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPNumberFormatter").super_class},"init");
if(_3){
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPNumberFormatter,"NSNumberFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPNumberFormatter,"class");
}
})]);
