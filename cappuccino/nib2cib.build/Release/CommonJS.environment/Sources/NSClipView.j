@STATIC;1.0;I;19;AppKit/CPClipView.jt;1173;
objj_executeFile("AppKit/CPClipView.j",NO);
var _1=4;
var _2=objj_getClass("CPClipView");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPClipView\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_4,_5,_6){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPClipView").super_class},"NS_initWithCoder:",_6)){
_documentView=objj_msgSend(_6,"decodeObjectForKey:","NSDocView");
var _7=objj_msgSend(_6,"decodeIntForKey:","NScvFlags");
if((_7&_1)&&objj_msgSend(_6,"containsValueForKey:","NSBGColor")){
objj_msgSend(_4,"setBackgroundColor:",objj_msgSend(_6,"decodeObjectForKey:","NSBGColor"));
}
}
return _4;
}
}),new objj_method(sel_getUid("NS_isFlipped"),function(_8,_9){
with(_8){
return YES;
}
})]);
var _2=objj_allocateClassPair(CPClipView,"NSClipView"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"NS_initWithCoder:",_c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_d,_e){
with(_d){
return objj_msgSend(CPClipView,"class");
}
})]);
