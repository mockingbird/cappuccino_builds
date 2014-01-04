@STATIC;1.0;I;17;AppKit/CPButton.jI;19;AppKit/CPCheckBox.jI;16;AppKit/CPRadio.ji;8;NSCell.ji;11;NSControl.jt;9106;
objj_executeFile("AppKit/CPButton.j",NO);
objj_executeFile("AppKit/CPCheckBox.j",NO);
objj_executeFile("AppKit/CPRadio.j",NO);
objj_executeFile("NSCell.j",YES);
objj_executeFile("NSControl.j",YES);
var _1=8388608,_2=16777216,_3=16711680,_4=16,_5=4,_6=12,_7=28,_8=44,_9=60,_a=68,_b=108,_c=2147483648,_d=134217728,_e=67108864,_f=33554432,_10=1073741824,_11=536870912,_12=268435456;
var _13=objj_getClass("CPButton");
if(!_13){
throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
}
var _14=_13.isa;
class_addMethods(_13,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_15,_16,_17){
with(_15){
_15=objj_msgSendSuper({receiver:_15,super_class:objj_getClass("CPButton").super_class},"NS_initWithCoder:",_17);
if(_15){
var _18=objj_msgSend(_17,"decodeObjectForKey:","NSCell");
_15=objj_msgSend(_15,"NS_initWithCell:",_18);
}
return _15;
}
}),new objj_method(sel_getUid("NS_initWithCell:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_1b,"alternateImage"),_1d=0,_1e=0,_1f=0;
if(objj_msgSend(_1c,"isKindOfClass:",objj_msgSend(NSButtonImageSource,"class"))){
if(objj_msgSend(_1c,"imageName")==="NSSwitch"){
_19.isa=objj_msgSend(CPCheckBox,"class");
}else{
if(objj_msgSend(_1c,"imageName")==="NSRadioButton"){
_19.isa=objj_msgSend(CPRadio,"class");
_19._radioGroup=objj_msgSend(CPRadioGroup,"new");
}
}
_themeClass=objj_msgSend(objj_msgSend(_19,"class"),"defaultThemeClass");
_1c=nil;
}
NIB_CONNECTION_EQUIVALENCY_TABLE[objj_msgSend(_1b,"UID")]=_19;
_title=objj_msgSend(_1b,"title");
_alternateTitle=objj_msgSend(_1b,"alternateTitle");
_controlSize=CPRegularControlSize;
objj_msgSend(_19,"setBordered:",objj_msgSend(_1b,"isBordered"));
_bezelStyle=objj_msgSend(_1b,"bezelStyle");
var _20;
switch(_bezelStyle){
case CPRoundedBezelStyle:
_1f=6;
_1e=4;
_1d=-12;
_20=YES;
break;
case CPTexturedRoundedBezelStyle:
_1f=2;
_1e=-2;
_1d=0;
_20=YES;
break;
case CPHUDBezelStyle:
_20=YES;
break;
case CPRoundRectBezelStyle:
_1f=-3;
_1e=-2;
_1d=0;
_bezelStyle=CPRoundedBezelStyle;
_20=YES;
break;
case CPSmallSquareBezelStyle:
_1e=-2;
_1d=0;
_bezelStyle=CPTexturedRoundedBezelStyle;
_20=NO;
break;
case CPThickSquareBezelStyle:
case CPThickerSquareBezelStyle:
case CPRegularSquareBezelStyle:
_1f=3;
_1e=0;
_1d=-4;
_bezelStyle=CPTexturedRoundedBezelStyle;
_20=NO;
break;
case CPTexturedSquareBezelStyle:
_1f=4;
_1e=-1;
_1d=-2;
_bezelStyle=CPTexturedRoundedBezelStyle;
_20=NO;
break;
case CPShadowlessSquareBezelStyle:
_1f=5;
_1e=-2;
_1d=0;
_bezelStyle=CPTexturedRoundedBezelStyle;
_20=NO;
break;
case CPRecessedBezelStyle:
_1f=-3;
_1e=-2;
_1d=0;
_bezelStyle=CPHUDBezelStyle;
_20=YES;
break;
case CPRoundedDisclosureBezelStyle:
case CPHelpButtonBezelStyle:
case CPCircularBezelStyle:
case CPDisclosureBezelStyle:
CPLog.warn("NSButton [%s]: unsupported bezel style: %d",_title==null?"<no title>":"\""+_title+"\"",_bezelStyle);
_bezelStyle=CPHUDBezelStyle;
_20=YES;
break;
default:
CPLog.warn("NSButton [%s]: unknown bezel style: %d",_title==null?"<no title>":"\""+_title+"\"",_bezelStyle);
_bezelStyle=CPHUDBezelStyle;
_20=YES;
}
if(objj_msgSend(_1b,"isBordered")){
var _21=objj_msgSend(objj_msgSend(Converter,"sharedConverter"),"themes")[0],_22=objj_msgSend(_21,"valueForAttributeWithName:forClass:","min-size",objj_msgSend(CPButton,"class")),_23=objj_msgSend(_21,"valueForAttributeWithName:forClass:","max-size",objj_msgSend(CPButton,"class")),_24=NO;
if(_22.height>0&&_23.height>0&&_22.height===_23.height){
_24=YES;
_20=_22.height===_23.height;
}else{
if(_22.height<0&&_23.height>0){
_24=_20;
}else{
_24=_22.height>0||_23.height>0;
}
}
if(_24){
var _25=_frame.size.height;
if(_22.height>0){
_frame.size.height=_bounds.size.height=MAX(_frame.size.height,_22.height);
}
if(_23.height>0){
_frame.size.height=_bounds.size.height=MIN(_frame.size.height,_23.height);
}
if(_frame.size.height!==_25){
CPLog.debug("NSButton [%s]: adjusted height from %d to %d",_title==null?"<no title>":"\""+_title+"\"",_25,_frame.size.height);
}
}
_frame.origin.x+=_1e;
_frame.origin.y+=_1f;
_frame.size.width+=_1d;
_bounds.size.width+=_1d;
}
_keyEquivalent=objj_msgSend(_1b,"keyEquivalent");
_keyEquivalentModifierMask=objj_msgSend(_1b,"keyEquivalentModifierMask");
_imageDimsWhenDisabled=YES;
_allowsMixedState=objj_msgSend(_1b,"allowsMixedState");
objj_msgSend(_19,"setImage:",objj_msgSend(_1b,"normalImage"));
objj_msgSend(_19,"setAlternateImage:",_1c);
objj_msgSend(_19,"setImagePosition:",objj_msgSend(_1b,"imagePosition"));
objj_msgSend(_19,"setEnabled:",objj_msgSend(_1b,"isEnabled"));
_highlightsBy=objj_msgSend(_1b,"highlightsBy");
_showsStateBy=objj_msgSend(_1b,"showsStateBy");
objj_msgSend(_19,"setTag:",objj_msgSend(_1b,"tag"));
return _19;
}
})]);
var _13=objj_allocateClassPair(CPButton,"NSButton"),_14=_13.isa;
objj_registerClassPair(_13);
class_addMethods(_13,[new objj_method(sel_getUid("initWithCoder:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_26,"NS_initWithCoder:",_28);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_29,_2a){
with(_29){
return objj_msgSend(CPButton,"class");
}
})]);
var _13=objj_allocateClassPair(NSActionCell,"NSButtonCell"),_14=_13.isa;
class_addIvars(_13,[new objj_ivar("_isBordered"),new objj_ivar("_bezelStyle"),new objj_ivar("_title"),new objj_ivar("_alternateTitle"),new objj_ivar("_normalImage"),new objj_ivar("_alternateImage"),new objj_ivar("_allowsMixedState"),new objj_ivar("_imagePosition"),new objj_ivar("_highlightsBy"),new objj_ivar("_showsStateBy"),new objj_ivar("_keyEquivalent"),new objj_ivar("_keyEquivalentModifierMask")]);
objj_registerClassPair(_13);
class_addMethods(_13,[new objj_method(sel_getUid("isBordered"),function(_2b,_2c){
with(_2b){
return _isBordered;
}
}),new objj_method(sel_getUid("bezelStyle"),function(_2d,_2e){
with(_2d){
return _bezelStyle;
}
}),new objj_method(sel_getUid("title"),function(_2f,_30){
with(_2f){
return _title;
}
}),new objj_method(sel_getUid("alternateTitle"),function(_31,_32){
with(_31){
return _alternateTitle;
}
}),new objj_method(sel_getUid("normalImage"),function(_33,_34){
with(_33){
return _normalImage;
}
}),new objj_method(sel_getUid("alternateImage"),function(_35,_36){
with(_35){
return _alternateImage;
}
}),new objj_method(sel_getUid("allowsMixedState"),function(_37,_38){
with(_37){
return _allowsMixedState;
}
}),new objj_method(sel_getUid("imagePosition"),function(_39,_3a){
with(_39){
return _imagePosition;
}
}),new objj_method(sel_getUid("highlightsBy"),function(_3b,_3c){
with(_3b){
return _highlightsBy;
}
}),new objj_method(sel_getUid("showsStateBy"),function(_3d,_3e){
with(_3d){
return _showsStateBy;
}
}),new objj_method(sel_getUid("keyEquivalent"),function(_3f,_40){
with(_3f){
return _keyEquivalent;
}
}),new objj_method(sel_getUid("keyEquivalentModifierMask"),function(_41,_42){
with(_41){
return _keyEquivalentModifierMask;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_43,_44,_45){
with(_43){
_43=objj_msgSendSuper({receiver:_43,super_class:objj_getClass("NSButtonCell").super_class},"initWithCoder:",_45);
if(_43){
var _46=objj_msgSend(_45,"decodeIntForKey:","NSButtonFlags"),_47=objj_msgSend(_45,"decodeIntForKey:","NSButtonFlags2"),_48=objj_msgSend(_45,"decodeIntForKey:","NSCellFlags2"),_49=(_46&_3)>>_4;
_isBordered=(_46&_1)?YES:NO;
_bezelStyle=(_47&7)|((_47&32)>>2);
_title=objj_msgSend(_45,"decodeObjectForKey:","NSContents");
_alternateTitle=objj_msgSend(_45,"decodeObjectForKey:","NSAlternateContents");
_objectValue=objj_msgSend(_43,"state");
_normalImage=objj_msgSend(_45,"decodeObjectForKey:","NSNormalImage");
_alternateImage=objj_msgSend(_45,"decodeObjectForKey:","NSAlternateImage");
_allowsMixedState=(_48&_2)?YES:NO;
if((_49&_b)==_b){
_imagePosition=CPImageOverlaps;
}else{
if((_49&_a)==_a){
_imagePosition=CPImageOnly;
}else{
if((_49&_9)==_9){
_imagePosition=CPImageLeft;
}else{
if((_49&_8)==_8){
_imagePosition=CPImageRight;
}else{
if((_49&_7)==_7){
_imagePosition=CPImageBelow;
}else{
if((_49&_6)==_6){
_imagePosition=CPImageAbove;
}else{
if((_49&_5)==_5){
_imagePosition=CPNoImage;
}
}
}
}
}
}
}
_highlightsBy=CPNoCellMask;
if(_46&_c){
_highlightsBy|=CPPushInCellMask;
}
if(_46&_d){
_highlightsBy|=CPContentsCellMask;
}
if(_46&_e){
_highlightsBy|=CPChangeGrayCellMask;
}
if(_46&_f){
_highlightsBy|=CPChangeBackgroundCellMask;
}
_showsStateBy=CPNoCellMask;
if(_46&_10){
_showsStateBy|=CPContentsCellMask;
}
if(_46&_11){
_showsStateBy|=CPChangeGrayCellMask;
}
if(_46&_12){
_showsStateBy|=CPChangeBackgroundCellMask;
}
_keyEquivalent=objj_msgSend(_45,"decodeObjectForKey:","NSKeyEquivalent");
_keyEquivalentModifierMask=_47>>8;
}
return _43;
}
})]);
var _13=objj_allocateClassPair(CPObject,"NSButtonImageSource"),_14=_13.isa;
class_addIvars(_13,[new objj_ivar("_imageName")]);
objj_registerClassPair(_13);
class_addMethods(_13,[new objj_method(sel_getUid("imageName"),function(_4a,_4b){
with(_4a){
return _imageName;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
_4c=objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("NSButtonImageSource").super_class},"init");
if(_4c){
_imageName=objj_msgSend(_4e,"decodeObjectForKey:","NSImageName");
}
return _4c;
}
})]);
