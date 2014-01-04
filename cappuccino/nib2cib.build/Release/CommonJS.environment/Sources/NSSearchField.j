@STATIC;1.0;I;22;AppKit/CPSearchField.ji;13;NSTextField.jt;3248;
objj_executeFile("AppKit/CPSearchField.j",NO);
objj_executeFile("NSTextField.j",YES);
var _1=objj_getClass("CPSearchField");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSearchField\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPSearchField").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
objj_msgSend(_3,"setRecentsAutosaveName:",objj_msgSend(_6,"recentsAutosaveName"));
objj_msgSend(_3,"setMaximumRecents:",objj_msgSend(_6,"maximumRecents"));
objj_msgSend(_3,"setSendsWholeSearchString:",objj_msgSend(_6,"sendsWholeSearchString"));
objj_msgSend(_3,"setSendsSearchStringImmediately:",objj_msgSend(_6,"sendsSearchStringImmediately"));
if(objj_msgSend(_3,"isBezeled")){
var _7=objj_msgSend(_3,"frame");
objj_msgSend(_3,"setFrameSize:",CGSizeMake(_7.size.width,_7.size.height+1));
}
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPSearchField,"NSSearchField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSend(_8,"NS_initWithCoder:",_a);
return _8;
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_b,_c){
with(_b){
return objj_msgSend(CPSearchField,"class");
}
})]);
var _1=objj_allocateClassPair(NSTextFieldCell,"NSSearchFieldCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_recentsAutosaveName"),new objj_ivar("_maximumRecents"),new objj_ivar("_sendsWholeSearchString"),new objj_ivar("_sendsSearchStringImmediately")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("recentsAutosaveName"),function(_d,_e){
with(_d){
return _recentsAutosaveName;
}
}),new objj_method(sel_getUid("setRecentsAutosaveName:"),function(_f,_10,_11){
with(_f){
_recentsAutosaveName=_11;
}
}),new objj_method(sel_getUid("maximumRecents"),function(_12,_13){
with(_12){
return _maximumRecents;
}
}),new objj_method(sel_getUid("setMaximumRecents:"),function(_14,_15,_16){
with(_14){
_maximumRecents=_16;
}
}),new objj_method(sel_getUid("sendsWholeSearchString"),function(_17,_18){
with(_17){
return _sendsWholeSearchString;
}
}),new objj_method(sel_getUid("setSendsWholeSearchString:"),function(_19,_1a,_1b){
with(_19){
_sendsWholeSearchString=_1b;
}
}),new objj_method(sel_getUid("sendsSearchStringImmediately"),function(_1c,_1d){
with(_1c){
return _sendsSearchStringImmediately;
}
}),new objj_method(sel_getUid("setSendsSearchStringImmediately:"),function(_1e,_1f,_20){
with(_1e){
_sendsSearchStringImmediately=_20;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_21,_22,_23){
with(_21){
if(_21=objj_msgSendSuper({receiver:_21,super_class:objj_getClass("NSSearchFieldCell").super_class},"initWithCoder:",_23)){
_recentsAutosaveName=objj_msgSend(_23,"decodeObjectForKey:","NSRecentsAutosaveName");
_maximumRecents=objj_msgSend(_23,"decodeIntForKey:","NSMaximumRecents");
_sendsWholeSearchString=objj_msgSend(_23,"decodeBoolForKey:","NSSendsWholeSearchString");
_sendsSearchStringImmediately=objj_msgSend(_23,"decodeBytesForKey:","NSSearchFieldFlags")?YES:NO;
}
return _21;
}
})]);
