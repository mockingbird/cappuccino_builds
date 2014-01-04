@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPBundle.ji;8;CPView.jt;9273;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPBundle.j",NO);
objj_executeFile("CPView.j",YES);
CPFontDefaultSystemFontFace="Arial, sans-serif";
CPFontDefaultSystemFontSize=12;
CPFontCurrentSystemSize=-1;
_CPFontSystemFacePlaceholder="_CPFontSystemFacePlaceholder";
var _1={},_2={},_3=CPFontDefaultSystemFontFace,_4=12,_5=CPFontDefaultSystemFontFace.split(", "),_6=new RegExp("(^\\s*[\"']?|[\"']?\\s*$)","g");
var _7=objj_allocateClassPair(CPObject,"CPFont"),_8=_7.isa;
class_addIvars(_7,[new objj_ivar("_name"),new objj_ivar("_size"),new objj_ivar("_ascender"),new objj_ivar("_descender"),new objj_ivar("_lineHeight"),new objj_ivar("_isBold"),new objj_ivar("_isItalic"),new objj_ivar("_isSystem"),new objj_ivar("_cssString")]);
objj_registerClassPair(_7);
class_addMethods(_7,[new objj_method(sel_getUid("isBold"),function(_9,_a){
with(_9){
return _isBold;
}
}),new objj_method(sel_getUid("isItalic"),function(_b,_c){
with(_b){
return _isItalic;
}
}),new objj_method(sel_getUid("isSystem"),function(_d,_e){
with(_d){
return _isSystem;
}
}),new objj_method(sel_getUid("_initWithName:size:bold:italic:system:"),function(_f,_10,_11,_12,_13,_14,_15){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPFont").super_class},"init");
if(_f){
_size=_12;
_ascender=0;
_descender=0;
_lineHeight=0;
_isBold=_13;
_isItalic=_14;
_isSystem=_15;
if(_15){
_name=_11;
_cssString=_16(_3,_size,_isBold,_isItalic);
_2[(String(_size)+(_isBold?"b":""))]=_f;
}else{
_name=_17(_11).join(", ");
_cssString=_16(_name,_size,_isBold,_isItalic);
_1[_cssString]=_f;
}
}
return _f;
}
}),new objj_method(sel_getUid("ascender"),function(_18,_19){
with(_18){
var _1a=_isSystem?(_2[(String(_size)+(_isBold?"b":""))]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_CPFontSystemFacePlaceholder,_size,_isBold,NO,YES)):_18;
if(!_1a._ascender){
objj_msgSend(_1a,"_getMetrics");
}
return _1a._ascender;
}
}),new objj_method(sel_getUid("descender"),function(_1b,_1c){
with(_1b){
var _1d=_isSystem?(_2[(String(_size)+(_isBold?"b":""))]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_CPFontSystemFacePlaceholder,_size,_isBold,NO,YES)):_1b;
if(!_1d._descender){
objj_msgSend(_1d,"_getMetrics");
}
return _1d._descender;
}
}),new objj_method(sel_getUid("defaultLineHeightForFont"),function(_1e,_1f){
with(_1e){
var _20=_isSystem?(_2[(String(_size)+(_isBold?"b":""))]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_CPFontSystemFacePlaceholder,_size,_isBold,NO,YES)):_1e;
if(!_20._lineHeight){
objj_msgSend(_20,"_getMetrics");
}
return _20._lineHeight;
}
}),new objj_method(sel_getUid("size"),function(_21,_22){
with(_21){
return (_size<=0?_4:_size);
}
}),new objj_method(sel_getUid("cssString"),function(_23,_24){
with(_23){
var _25=_isSystem?(_2[(String(_size)+(_isBold?"b":""))]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_CPFontSystemFacePlaceholder,_size,_isBold,NO,YES)):_23;
return _25._cssString;
}
}),new objj_method(sel_getUid("familyName"),function(_26,_27){
with(_26){
if(_isSystem){
return _3;
}
return _name;
}
}),new objj_method(sel_getUid("isSystemSize"),function(_28,_29){
with(_28){
return _size<=0;
}
}),new objj_method(sel_getUid("isEqual:"),function(_2a,_2b,_2c){
with(_2a){
return objj_msgSend(_2c,"isKindOfClass:",objj_msgSend(CPFont,"class"))&&objj_msgSend(_2c,"cssString")===_cssString;
}
}),new objj_method(sel_getUid("description"),function(_2d,_2e){
with(_2d){
return objj_msgSend(CPString,"stringWithFormat:","%@ %@",objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("CPFont").super_class},"description"),objj_msgSend(_2d,"cssString"));
}
}),new objj_method(sel_getUid("copy"),function(_2f,_30){
with(_2f){
return objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_name,_size,_isBold,_isItalic,_isSystem);
}
}),new objj_method(sel_getUid("_getMetrics"),function(_31,_32){
with(_31){
var _33=objj_msgSend(CPString,"metricsOfFont:",_31);
_ascender=objj_msgSend(_33,"objectForKey:","ascender");
_descender=objj_msgSend(_33,"objectForKey:","descender");
_lineHeight=objj_msgSend(_33,"objectForKey:","lineHeight");
}
})]);
class_addMethods(_8,[new objj_method(sel_getUid("initialize"),function(_34,_35){
with(_34){
if(_34!==objj_msgSend(CPFont,"class")){
return;
}
var _36=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPSystemFontFace");
if(!_36){
_36=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPView,"class")),"objectForInfoDictionaryKey:","CPSystemFontFace");
}
if(_36){
_3=_17(_36).join(", ");
}
var _37=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPSystemFontSize");
if(!_37){
_37=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPView,"class")),"objectForInfoDictionaryKey:","CPSystemFontSize");
}
if(_37){
_4=_37;
}
}
}),new objj_method(sel_getUid("systemFontFace"),function(_38,_39){
with(_38){
return _3;
}
}),new objj_method(sel_getUid("setSystemFontFace:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=_17(_3c).join(", ");
if(_3d===_3){
return;
}
objj_msgSend(_3a,"_invalidateSystemFontCache");
_3=_3c;
}
}),new objj_method(sel_getUid("systemFontSize"),function(_3e,_3f){
with(_3e){
return _4;
}
}),new objj_method(sel_getUid("setSystemFontSize:"),function(_40,_41,_42){
with(_40){
if(_42>0&&_42!==_4){
objj_msgSend(_40,"_invalidateSystemFontCache");
_4=_42;
}
}
}),new objj_method(sel_getUid("_invalidateSystemFontCache"),function(_43,_44){
with(_43){
var _45=String(_4),_46=String(CPFontCurrentSystemSize);
for(key in _2){
if(_2.hasOwnProperty(key)&&(key.indexOf(_45)===0||key.indexOf(_46)===0)){
delete _2[key];
}
}
}
}),new objj_method(sel_getUid("fontWithName:size:"),function(_47,_48,_49,_4a){
with(_47){
return _1[_16(_17(_49).join(", "),_4a<=0?_4:_4a,NO,NO)]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_49,_4a<=0?_4:_4a,NO,NO,NO);
}
}),new objj_method(sel_getUid("fontWithName:size:italic:"),function(_4b,_4c,_4d,_4e,_4f){
with(_4b){
return _1[_16(_17(_4d).join(", "),_4e<=0?_4:_4e,NO,_4f)]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_4d,_4e<=0?_4:_4e,NO,_4f,NO);
}
}),new objj_method(sel_getUid("boldFontWithName:size:"),function(_50,_51,_52,_53){
with(_50){
return _1[_16(_17(_52).join(", "),_53<=0?_4:_53,YES,NO)]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_52,_53<=0?_4:_53,YES,NO,NO);
}
}),new objj_method(sel_getUid("boldFontWithName:size:italic:"),function(_54,_55,_56,_57,_58){
with(_54){
return _1[_16(_17(_56).join(", "),_57<=0?_4:_57,YES,_58)]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_56,_57<=0?_4:_57,YES,_58,NO);
}
}),new objj_method(sel_getUid("_fontWithName:size:bold:italic:"),function(_59,_5a,_5b,_5c,_5d,_5e){
with(_59){
return _1[_16(_17(_5b).join(", "),_5c<=0?_4:_5c,_5d,_5e)]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_5b,_5c<=0?_4:_5c,_5d,_5e,NO);
}
}),new objj_method(sel_getUid("systemFontOfSize:"),function(_5f,_60,_61){
with(_5f){
return (_2[(String(_61===0?_4:_61)+(NO?"b":""))]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_CPFontSystemFacePlaceholder,_61===0?_4:_61,NO,NO,YES));
}
}),new objj_method(sel_getUid("boldSystemFontOfSize:"),function(_62,_63,_64){
with(_62){
return (_2[(String(_64===0?_4:_64)+(YES?"b":""))]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:system:",_CPFontSystemFacePlaceholder,_64===0?_4:_64,YES,NO,YES));
}
})]);
var _65="CPFontNameKey",_66="CPFontSizeKey",_67="CPFontIsBoldKey",_68="CPFontIsItalicKey",_69="CPFontIsSystemKey";
var _7=objj_getClass("CPFont");
if(!_7){
throw new SyntaxError("*** Could not find definition for class \"CPFont\"");
}
var _8=_7.isa;
class_addMethods(_7,[new objj_method(sel_getUid("initWithCoder:"),function(_6a,_6b,_6c){
with(_6a){
var _6d=objj_msgSend(_6c,"decodeObjectForKey:",_65),_6e=objj_msgSend(_6c,"decodeFloatForKey:",_66),_6f=objj_msgSend(_6c,"decodeBoolForKey:",_67),_70=objj_msgSend(_6c,"decodeBoolForKey:",_68),_71=objj_msgSend(_6c,"decodeBoolForKey:",_69);
return objj_msgSend(_6a,"_initWithName:size:bold:italic:system:",_6d,_6e,_6f,_70,_71);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_72,_73,_74){
with(_72){
objj_msgSend(_74,"encodeObject:forKey:",_name,_65);
objj_msgSend(_74,"encodeFloat:forKey:",_size,_66);
objj_msgSend(_74,"encodeBool:forKey:",_isBold,_67);
objj_msgSend(_74,"encodeBool:forKey:",_isItalic,_68);
objj_msgSend(_74,"encodeBool:forKey:",_isSystem,_69);
}
})]);
var _16=function(_75,_76,_77,_78){
var _79=(_78?"italic ":"")+(_77?"bold ":"")+(_76<=0?_4:_76)+"px ";
return _79+_7a(_75);
};
var _7a=function(_7b){
var _7c=_17(_7b),_7d=_5.slice(0);
for(var i=0;i<_7c.length;++i){
for(var j=0;j<_7d.length;++j){
if(_7c[i].toLowerCase()===_7d[j].toLowerCase()){
_7d.splice(j,1);
break;
}
}
if(_7c[i].indexOf(" ")>0){
_7c[i]="\""+_7c[i]+"\"";
}
}
return _7c.concat(_7d).join(", ");
};
var _17=function(_7e){
var _7f=_7e.split(",");
for(var i=0;i<_7f.length;++i){
_7f[i]=_7f[i].replace(_6,"");
}
return _7f;
};
