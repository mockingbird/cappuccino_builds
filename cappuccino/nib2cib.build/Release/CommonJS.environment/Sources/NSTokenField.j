@STATIC;1.0;I;21;AppKit/CPTokenField.ji;11;NSControl.ji;8;NSCell.ji;13;NSTextField.jI;15;AppKit/CPFont.jt;1719;
objj_executeFile("AppKit/CPTokenField.j",NO);
objj_executeFile("NSControl.j",YES);
objj_executeFile("NSCell.j",YES);
objj_executeFile("NSTextField.j",YES);
objj_executeFile("AppKit/CPFont.j",NO);
var _1=objj_getClass("CPTokenField");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTokenField").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
_3=objj_msgSend(_3,"NS_initWithCell:",_6);
}
return _3;
}
}),new objj_method(sel_getUid("NS_initWithCell:"),function(_7,_8,_9){
with(_7){
return _7;
}
})]);
var _1=objj_allocateClassPair(CPTokenField,"NSTokenField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"NS_initWithCoder:",_c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_d,_e){
with(_d){
return objj_msgSend(CPTokenField,"class");
}
})]);
var _1=objj_allocateClassPair(NSTextFieldCell,"NSTokenFieldCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_tokenStyle")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("tokenStyle"),function(_f,_10){
with(_f){
return _tokenStyle;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_11,_12,_13){
with(_11){
_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("NSTokenFieldCell").super_class},"initWithCoder:",_13);
if(_11){
_tokenStyle=objj_msgSend(_13,"decodeIntForKey:","NSTokenStyle");
}
return _11;
}
})]);
