@STATIC;1.0;I;28;Foundation/CPDateFormatter.jt;860;
objj_executeFile("Foundation/CPDateFormatter.j",NO);
var _1=objj_getClass("CPDateFormatter");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDateFormatter\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPDateFormatter").super_class},"init");
if(_3){
_dateStyle=CPDateFormatterShortStyle;
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPDateFormatter,"NSDateFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPDateFormatter,"class");
}
})]);
