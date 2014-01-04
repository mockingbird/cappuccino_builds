@STATIC;1.0;I;15;AppKit/CPFont.jt;2306;
objj_executeFile("AppKit/CPFont.j",NO);
IBDefaultFontFace="Lucida Grande";
IBDefaultFontSize=13;
var OS=require("os"),_1=require("cappuccino/fontinfo").fontinfo;
var _2=objj_getClass("CPFont");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPFont\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_4,_5,_6){
with(_4){
var _7=objj_msgSend(_6,"decodeObjectForKey:","NSName"),_8=objj_msgSend(_6,"decodeDoubleForKey:","NSSize"),_9=false,_a=false,_b=_1(_7,_8);
if(_b){
_7=_b.familyName;
_9=_b.bold;
_a=_b.italic;
}
var _c=objj_msgSend(_4,"_initWithName:size:bold:italic:system:",_7,_8,_9,_a,NO);
CPLog.debug("NSFont: %s",objj_msgSend(NSFont,"descriptorForFont:",_c));
return _c;
}
}),new objj_method(sel_getUid("cibFontForNibFont"),function(_d,_e){
with(_d){
if(_name===IBDefaultFontFace){
if(_size===IBDefaultFontSize&&!_isBold&&!_isItalic){
return nil;
}else{
return objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_CPFontSystemFacePlaceholder,_size==IBDefaultFontSize?CPFontCurrentSystemSize:_size,_isBold,_isItalic,YES);
}
}
return _d;
}
})]);
var _2=objj_allocateClassPair(CPFont,"NSFont"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_f,_10,_11){
with(_f){
return objj_msgSend(_f,"NS_initWithCoder:",_11);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_12,_13){
with(_12){
return objj_msgSend(CPFont,"class");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_14,_15){
with(_14){
if(_14!==objj_msgSend(NSFont,"class")){
return;
}
CPLog.debug("NSFont: default IB font: %s %f",IBDefaultFontFace,IBDefaultFontSize);
}
}),new objj_method(sel_getUid("descriptorForFont:"),function(_16,_17,_18){
with(_16){
var _19=[];
if(objj_msgSend(_18,"isBold")){
_19.push("bold");
}
if(objj_msgSend(_18,"isItalic")){
_19.push("italic");
}
_19=_19.join(" ");
var _1a=[];
if(objj_msgSend(_18,"isSystem")){
_1a.push("system face");
if(objj_msgSend(_18,"size")===IBDefaultFontSize){
_1a.push("system size");
}
}
_1a=_1a.join(", ");
return objj_msgSend(CPString,"stringWithFormat:","%s%s %d%s",objj_msgSend(_18,"familyName"),_19?" "+_19:"",objj_msgSend(_18,"size"),_1a?" ("+_1a+")":"");
}
})]);
