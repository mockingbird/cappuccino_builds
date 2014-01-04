@STATIC;1.0;I;21;Foundation/CPObject.ji;8;CPFont.jt;6731;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPFont.j",YES);
CPItalicFontMask=1<<0;
CPBoldFontMask=1<<1;
CPUnboldFontMask=1<<2;
CPNonStandardCharacterSetFontMask=1<<3;
CPNarrowFontMask=1<<4;
CPExpandedFontMask=1<<5;
CPCondensedFontMask=1<<6;
CPSmallCapsFontMask=1<<7;
CPPosterFontMask=1<<8;
CPCompressedFontMask=1<<9;
CPFixedPitchFontMask=1<<10;
CPUnitalicFontMask=1<<24;
var _1=nil,_2=Nil;
var _3=objj_allocateClassPair(CPObject,"CPFontManager"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_availableFonts"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_delegate"),new objj_ivar("_selectedFont"),new objj_ivar("_multiple"),new objj_ivar("_activeChange")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("target"),function(_5,_6){
with(_5){
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_7,_8,_9){
with(_7){
_target=_9;
}
}),new objj_method(sel_getUid("action"),function(_a,_b){
with(_a){
return _action;
}
}),new objj_method(sel_getUid("setAction:"),function(_c,_d,_e){
with(_c){
_action=_e;
}
}),new objj_method(sel_getUid("delegate"),function(_f,_10){
with(_f){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_11,_12,_13){
with(_11){
_delegate=_13;
}
}),new objj_method(sel_getUid("_multiple"),function(_14,_15){
with(_14){
return _multiple;
}
}),new objj_method(sel_getUid("_setMultiple:"),function(_16,_17,_18){
with(_16){
_multiple=_18;
}
}),new objj_method(sel_getUid("init"),function(_19,_1a){
with(_19){
if(_19=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("CPFontManager").super_class},"init")){
_action=sel_getUid("changeFont:");
}
return _19;
}
}),new objj_method(sel_getUid("availableFonts"),function(_1b,_1c){
with(_1b){
if(!_availableFonts){
_1d=document.createElement("span");
_1d.fontSize="24px";
_1d.appendChild(document.createTextNode("mmmmmmmmmml"));
var div=document.createElement("div");
div.style.position="absolute";
div.style.top="-1000px";
div.appendChild(_1d);
document.getElementsByTagName("body")[0].appendChild(div);
_1e=_1f(["monospace","serif","sans-serif","cursive"]);
_availableFonts=[];
for(var i=0;i<_20.length;i++){
var _21=_22(_20[i]);
if(_21){
_availableFonts.push(_20[i]);
}
}
}
return _availableFonts;
}
}),new objj_method(sel_getUid("fontWithNameIsAvailable:"),function(_23,_24,_25){
with(_23){
return _22(_25);
}
}),new objj_method(sel_getUid("setSelectedFont:isMultiple:"),function(_26,_27,_28,_29){
with(_26){
_selectedFont=_28;
_isMultiple=_29;
}
}),new objj_method(sel_getUid("selectedFont"),function(_2a,_2b){
with(_2a){
return _selectedFont;
}
}),new objj_method(sel_getUid("isMultiple"),function(_2c,_2d){
with(_2c){
return _isMultiple;
}
}),new objj_method(sel_getUid("weightOfFont:"),function(_2e,_2f,_30){
with(_2e){
return objj_msgSend(_30,"isBold")?9:5;
}
}),new objj_method(sel_getUid("traitsOfFont:"),function(_31,_32,_33){
with(_31){
return (objj_msgSend(_33,"isBold")?CPBoldFontMask:0)|(objj_msgSend(_33,"isItalic")?CPItalicFontMask:0);
}
}),new objj_method(sel_getUid("convertFont:"),function(_34,_35,_36){
with(_34){
if(!_activeChange){
return _36;
}
var _37=objj_msgSend(_activeChange,"valueForKey:","addTraits");
if(_37){
_36=objj_msgSend(_34,"convertFont:toHaveTrait:",_36,_37);
}
return _36;
}
}),new objj_method(sel_getUid("convertFont:toHaveTrait:"),function(_38,_39,_3a,_3b){
with(_38){
if(!_3a){
return nil;
}
var _3c=(objj_msgSend(_3a,"isBold")||(_3b&CPBoldFontMask))&&!(_3b&CPUnboldFontMask),_3d=(objj_msgSend(_3a,"isItalic")||(_3b&CPItalicFontMask))&&!(_3b&CPUnitalicFontMask),_3e=objj_msgSend(_3a,"size");
_3a=objj_msgSend(CPFont,"_fontWithName:size:bold:italic:",objj_msgSend(_3a,"familyName"),_3e,_3c,_3d)||_3a;
return _3a;
}
}),new objj_method(sel_getUid("convertFont:toFace:"),function(_3f,_40,_41,_42){
with(_3f){
if(!_41){
return nil;
}
var _43=objj_msgSend(_41,"isBold"),_44=objj_msgSend(_41,"isItalic"),_45=objj_msgSend(_41,"size");
_41=objj_msgSend(CPFont,"_fontWithName:size:bold:italic:",_42,_45,_43,_44)||_41;
return _41;
}
}),new objj_method(sel_getUid("addFontTrait:"),function(_46,_47,_48){
with(_46){
_activeChange=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_48,"tag"),"addTraits");
objj_msgSend(_46,"sendAction");
}
}),new objj_method(sel_getUid("sendAction"),function(_49,_4a){
with(_49){
return objj_msgSend(CPApp,"sendAction:to:from:",_action,_target,_49);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedFontManager"),function(_4b,_4c){
with(_4b){
if(!_1){
_1=objj_msgSend(objj_msgSend(_2,"alloc"),"init");
}
return _1;
}
}),new objj_method(sel_getUid("setFontManagerFactory:"),function(_4d,_4e,_4f){
with(_4d){
_2=_4f;
}
})]);
var _1d,_1e,_20=["American Typewriter","Apple Chancery","Arial","Arial Black","Arial Narrow","Arial Rounded MT Bold","Arial Unicode MS","Big Caslon","Bitstream Vera Sans","Bitstream Vera Sans Mono","Bitstream Vera Serif","Brush Script MT","Cambria","Caslon","Castellar","Cataneo BT","Centaur","Century Gothic","Century Schoolbook","Century Schoolbook L","Comic Sans","Comic Sans MS","Consolas","Constantia","Cooper Black","Copperplate","Copperplate Gothic Bold","Copperplate Gothic Light","Corbel","Courier","Courier New","Futura","Geneva","Georgia","Georgia Ref","Geeza Pro","Gigi","Gill Sans","Gill Sans MT","Gill Sans MT Condensed","Gill Sans MT Ext Condensed Bold","Gill Sans Ultra Bold","Gill Sans Ultra Bold Condensed","Helvetica","Helvetica Narrow","Helvetica Neue","Herculanum","High Tower Text","Highlight LET","Hoefler Text","Impact","Imprint MT Shadow","Lucida","Lucida Bright","Lucida Calligraphy","Lucida Console","Lucida Fax","Lucida Grande","Lucida Handwriting","Lucida Sans","Lucida Sans Typewriter","Lucida Sans Unicode","Marker Felt","Microsoft Sans Serif","Milano LET","Minion Web","MisterEarl BT","Mistral","Monaco","Monotype Corsiva","Monotype.com","New Century Schoolbook","New York","News Gothic MT","Papyrus","Tahoma","Techno","Tempus Sans ITC","Terminal","Textile","Times","Times New Roman","Tiranti Solid LET","Trebuchet MS","Verdana","Verdana Ref","Zapfino"];
var _22=function(_50){
for(var i=0;i<_1e.length;i++){
if(_51(_1e[i],_50)){
return true;
}
}
return false;
};
var _52={};
var _51=function(_53,_54){
var a;
if(_52[_53]){
a=_52[_53];
}else{
_1d.style.fontFamily="\""+_53+"\"";
_52[_53]=a={w:_1d.offsetWidth,h:_1d.offsetHeight};
}
_1d.style.fontFamily="\""+_54+"\", \""+_53+"\"";
var _55=_1d.offsetWidth,_56=_1d.offsetHeight;
return (a.w!=_55||a.h!=_56);
};
var _1f=function(_57){
for(var i=0;i<_57.length;i++){
for(var j=0;j<i;j++){
if(_51(_57[i],_57[j])){
return [_57[i],_57[j]];
}
}
}
return [_57[0]];
};
objj_msgSend(CPFontManager,"setFontManagerFactory:",objj_msgSend(CPFontManager,"class"));
