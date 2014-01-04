@STATIC;1.0;I;20;AppKit/CPSplitView.jt;1022;
objj_executeFile("AppKit/CPSplitView.j",NO);
var _1=2;
var _2=objj_getClass("CPSplitView");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_4,_5,_6){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPSplitView").super_class},"NS_initWithCoder:",_6)){
_isVertical=objj_msgSend(_6,"decodeBoolForKey:","NSIsVertical");
_isPaneSplitter=objj_msgSend(_6,"decodeIntForKey:","NSDividerStyle")!=_1;
_autosaveName=objj_msgSend(_6,"decodeObjectForKey:","NSAutosaveName");
}
return _4;
}
})]);
var _2=objj_allocateClassPair(CPSplitView,"NSSplitView"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPSplitView,"class");
}
})]);
