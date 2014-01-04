@STATIC;1.0;i;12;CGGeometry.ji;13;CPImageView.ji;8;CPView.jt;10689;
objj_executeFile("CGGeometry.j",YES);
objj_executeFile("CPImageView.j",YES);
objj_executeFile("CPView.j",YES);
CPProgressIndicatorBarStyle=0;
CPProgressIndicatorSpinningStyle=1;
CPProgressIndicatorHUDBarStyle=2;
var _1=nil,_2=nil,_3=nil,_4=nil;
var _5=objj_allocateClassPair(CPView,"CPProgressIndicator"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_doubleValue"),new objj_ivar("_controlSize"),new objj_ivar("_isIndeterminate"),new objj_ivar("_style"),new objj_ivar("_isAnimating"),new objj_ivar("_isDisplayedWhenStoppedSet"),new objj_ivar("_isDisplayedWhenStopped")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPProgressIndicator").super_class},"initWithFrame:",_9);
if(_7){
_minValue=0;
_maxValue=100;
_doubleValue=0;
_style=CPProgressIndicatorBarStyle;
_isDisplayedWhenStoppedSet=NO;
_controlSize=CPRegularControlSize;
objj_msgSend(_7,"updateBackgroundColor");
objj_msgSend(_7,"drawBar");
}
return _7;
}
}),new objj_method(sel_getUid("setUsesThreadedAnimation:"),function(_a,_b,_c){
with(_a){
}
}),new objj_method(sel_getUid("startAnimation:"),function(_d,_e,_f){
with(_d){
_isAnimating=YES;
objj_msgSend(_d,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("stopAnimation:"),function(_10,_11,_12){
with(_10){
_isAnimating=NO;
objj_msgSend(_10,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("usesThreadedAnimation"),function(_13,_14){
with(_13){
return NO;
}
}),new objj_method(sel_getUid("incrementBy:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"setDoubleValue:",_doubleValue+_17);
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_18,_19,_1a){
with(_18){
_doubleValue=MIN(MAX(_1a,_minValue),_maxValue);
objj_msgSend(_18,"drawBar");
}
}),new objj_method(sel_getUid("doubleValue"),function(_1b,_1c){
with(_1b){
return _doubleValue;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_1d,_1e,_1f){
with(_1d){
_minValue=_1f;
}
}),new objj_method(sel_getUid("minValue"),function(_20,_21){
with(_20){
return _minValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_22,_23,_24){
with(_22){
_maxValue=_24;
}
}),new objj_method(sel_getUid("maxValue"),function(_25,_26){
with(_25){
return _maxValue;
}
}),new objj_method(sel_getUid("setControlSize:"),function(_27,_28,_29){
with(_27){
if(_controlSize==_29){
return;
}
_controlSize=_29;
objj_msgSend(_27,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("controlSize"),function(_2a,_2b){
with(_2a){
return _controlSize;
}
}),new objj_method(sel_getUid("setControlTint:"),function(_2c,_2d,_2e){
with(_2c){
}
}),new objj_method(sel_getUid("controlTint"),function(_2f,_30){
with(_2f){
return 0;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_31,_32,_33){
with(_31){
}
}),new objj_method(sel_getUid("isBezeled"),function(_34,_35){
with(_34){
return YES;
}
}),new objj_method(sel_getUid("setIndeterminate:"),function(_36,_37,_38){
with(_36){
if(_isIndeterminate==_38){
return;
}
_isIndeterminate=_38;
objj_msgSend(_36,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("isIndeterminate"),function(_39,_3a){
with(_39){
return _isIndeterminate;
}
}),new objj_method(sel_getUid("setStyle:"),function(_3b,_3c,_3d){
with(_3b){
if(_style==_3d){
return;
}
_style=_3d;
objj_msgSend(_3b,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("sizeToFit"),function(_3e,_3f){
with(_3e){
if(_style==CPProgressIndicatorSpinningStyle){
objj_msgSend(_3e,"setFrameSize:",objj_msgSend(objj_msgSend(_1[_controlSize],"patternImage"),"size"));
}else{
objj_msgSend(_3e,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_3e,"frame")),_4[_2+"BezelBorder"+_3[CPProgressIndicatorBarStyle]+_CPControlIdentifierForControlSize(_controlSize)][0].height));
}
}
}),new objj_method(sel_getUid("setDisplayedWhenStopped:"),function(_40,_41,_42){
with(_40){
if(_isDisplayedWhenStoppedSet&&_isDisplayedWhenStopped==_42){
return;
}
_isDisplayedWhenStoppedSet=YES;
_isDisplayedWhenStopped=_42;
objj_msgSend(_40,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("isDisplayedWhenStopped"),function(_43,_44){
with(_43){
if(_isDisplayedWhenStoppedSet){
return _isDisplayedWhenStopped;
}
if(_style==CPProgressIndicatorBarStyle||_style==CPProgressIndicatorHUDBarStyle){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("_hideOrDisplay"),function(_45,_46){
with(_45){
objj_msgSend(_45,"setHidden:",!_isAnimating&&!objj_msgSend(_45,"isDisplayedWhenStopped"));
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_47,_48,_49){
with(_47){
objj_msgSendSuper({receiver:_47,super_class:objj_getClass("CPProgressIndicator").super_class},"setFrameSize:",_49);
objj_msgSend(_47,"drawBar");
}
}),new objj_method(sel_getUid("drawBar"),function(_4a,_4b){
with(_4a){
if(_style==CPProgressIndicatorSpinningStyle){
return;
}
var _4c=objj_msgSend(_4a,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bar-view",CPWindowBelow,nil);
objj_msgSend(_4c,"setBackgroundColor:",_CPControlThreePartImagePattern(NO,_4,_2,"Bar",_3[_style],_CPControlIdentifierForControlSize(_controlSize)));
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_4d,_4e,_4f){
with(_4d){
return objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_50,_51,_52){
with(_50){
if(_52==="bar-view"&&_style!==CPProgressIndicatorSpinningStyle){
var _53=CGRectGetWidth(objj_msgSend(_50,"bounds")),_54=_53*((_doubleValue-_minValue)/(_maxValue-_minValue));
if(_54>0&&_54<4){
_54=4;
}
return {origin:{x:0,y:0},size:{width:_54,height:16}};
}
return nil;
}
}),new objj_method(sel_getUid("updateBackgroundColor"),function(_55,_56){
with(_55){
if(YES){
if(_style==CPProgressIndicatorSpinningStyle){
objj_msgSend(_55,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bar-view",CPWindowBelow,nil);
objj_msgSend(_55,"setBackgroundColor:",_1[_controlSize]);
}else{
objj_msgSend(_55,"setBackgroundColor:",_CPControlThreePartImagePattern(NO,_4,_2,"BezelBorder",_3[_style],_CPControlIdentifierForControlSize(_controlSize)));
objj_msgSend(_55,"drawBar");
}
}else{
objj_msgSend(_55,"setBackgroundColor:",nil);
}
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_57,_58){
with(_57){
if(_57!==objj_msgSend(CPProgressIndicator,"class")){
return;
}
var _59=objj_msgSend(CPBundle,"bundleForClass:",_57);
_1=[];
_1[CPMiniControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_59,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleMini.gif"),CGSizeMake(16,16)));
_1[CPSmallControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_59,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleSmall.gif"),CGSizeMake(32,32)));
_1[CPRegularControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_59,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(64,64)));
CPProgressIndicatorBezelBorderViewPool=[];
var _5a=CPProgressIndicatorBarStyle,end=CPProgressIndicatorHUDBarStyle;
for(;_5a<=end;++_5a){
CPProgressIndicatorBezelBorderViewPool[_5a]=[];
CPProgressIndicatorBezelBorderViewPool[_5a][CPMiniControlSize]=[];
CPProgressIndicatorBezelBorderViewPool[_5a][CPSmallControlSize]=[];
CPProgressIndicatorBezelBorderViewPool[_5a][CPRegularControlSize]=[];
}
_2=objj_msgSend(_57,"className");
_3=[];
_3[CPProgressIndicatorBarStyle]="Bar";
_3[CPProgressIndicatorSpinningStyle]="Spinny";
_3[CPProgressIndicatorHUDBarStyle]="HUDBar";
var _5b=_CPControlIdentifierForControlSize(CPRegularControlSize),_5c=_CPControlIdentifierForControlSize(CPSmallControlSize),_5d=_CPControlIdentifierForControlSize(CPMiniControlSize);
_4=[];
var _5e=[_2+"BezelBorder"+_3[CPProgressIndicatorBarStyle],_2+"Bar"+_3[CPProgressIndicatorBarStyle],_2+"BezelBorder"+_3[CPProgressIndicatorHUDBarStyle],_2+"Bar"+_3[CPProgressIndicatorHUDBarStyle]];
for(var i=0,_5f=_5e.length;i<_5f;i++){
var _60=_5e[i];
_4[_60+_5b]=[{width:3,height:16},{width:1,height:16},{width:3,height:16}];
_4[_60+_5c]=[{width:3,height:16},{width:1,height:16},{width:3,height:16}];
_4[_60+_5d]=[{width:3,height:16},{width:1,height:16},{width:3,height:16}];
}
}
})]);
var _5=objj_getClass("CPProgressIndicator");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPProgressIndicator\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("initWithCoder:"),function(_61,_62,_63){
with(_61){
if(_61=objj_msgSendSuper({receiver:_61,super_class:objj_getClass("CPProgressIndicator").super_class},"initWithCoder:",_63)){
_minValue=objj_msgSend(_63,"decodeObjectForKey:","_minValue");
_maxValue=objj_msgSend(_63,"decodeObjectForKey:","_maxValue");
_doubleValue=objj_msgSend(_63,"decodeObjectForKey:","_doubleValue");
_controlSize=objj_msgSend(_63,"decodeObjectForKey:","_controlSize");
_isIndeterminate=objj_msgSend(_63,"decodeObjectForKey:","_isIndeterminate");
_style=objj_msgSend(_63,"decodeIntForKey:","_style");
_isAnimating=objj_msgSend(_63,"decodeObjectForKey:","_isAnimating");
_isDisplayedWhenStoppedSet=objj_msgSend(_63,"decodeObjectForKey:","_isDisplayedWhenStoppedSet");
_isDisplayedWhenStopped=objj_msgSend(_63,"decodeObjectForKey:","_isDisplayedWhenStopped");
objj_msgSend(_61,"updateBackgroundColor");
}
return _61;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_64,_65,_66){
with(_64){
var _67=objj_msgSend(_64,"backgroundColor");
objj_msgSend(_64,"setBackgroundColor:",nil);
objj_msgSendSuper({receiver:_64,super_class:objj_getClass("CPProgressIndicator").super_class},"encodeWithCoder:",_66);
objj_msgSend(_64,"setBackgroundColor:",_67);
objj_msgSend(_66,"encodeObject:forKey:",_minValue,"_minValue");
objj_msgSend(_66,"encodeObject:forKey:",_maxValue,"_maxValue");
objj_msgSend(_66,"encodeObject:forKey:",_doubleValue,"_doubleValue");
objj_msgSend(_66,"encodeObject:forKey:",_controlSize,"_controlSize");
objj_msgSend(_66,"encodeObject:forKey:",_isIndeterminate,"_isIndeterminate");
objj_msgSend(_66,"encodeInt:forKey:",_style,"_style");
objj_msgSend(_66,"encodeObject:forKey:",_isAnimating,"_isAnimating");
objj_msgSend(_66,"encodeObject:forKey:",_isDisplayedWhenStoppedSet,"_isDisplayedWhenStoppedSet");
objj_msgSend(_66,"encodeObject:forKey:",_isDisplayedWhenStopped,"_isDisplayedWhenStopped");
}
})]);
