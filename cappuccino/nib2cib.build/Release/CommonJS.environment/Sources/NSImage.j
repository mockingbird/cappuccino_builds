@STATIC;1.0;I;16;AppKit/CPImage.jt;809;
objj_executeFile("AppKit/CPImage.j",NO);
var _1=objj_getClass("CPImage");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPImage\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSend(_3,"init");
if(_3){
var _6=objj_msgSend(_5,"decodeIntForKey:","NSImageFlags");
_size=objj_msgSend(_5,"decodeSizeForKey:","NSSize");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPImage,"NSImage"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPImage,"class");
}
})]);
