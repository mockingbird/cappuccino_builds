@STATIC;1.0;I;28;AppKit/CPProgressIndicator.jt;1630;
objj_executeFile("AppKit/CPProgressIndicator.j",NO);
var _1=1<<12;
var _2=objj_getClass("CPProgressIndicator");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPProgressIndicator\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPProgressIndicator").super_class},"NS_initWithCoder:",_6);
if(_4){
var _7=objj_msgSend(_6,"decodeIntForKey:","NSpiFlags");
_minValue=objj_msgSend(_6,"decodeDoubleForKey:","NSMinValue");
_maxValue=objj_msgSend(_6,"decodeDoubleForKey:","NSMaxValue");
_style=(_7&_1)?CPProgressIndicatorSpinningStyle:CPProgressIndicatorBarStyle;
_isIndeterminate=(_7&2)?YES:NO;
_isDisplayedWhenStopped=(_7&8192)?NO:YES;
_controlSize=(_7&256)?CPSmallControlSize:CPRegularControlSize;
if(_style===CPProgressIndicatorSpinningStyle){
_controlSize=_controlSize==CPRegularControlSize?CPSmallControlSize:CPMiniControlSize;
}
_doubleValue=0;
var _8=objj_msgSend(_4,"frameSize");
if(_style!==CPProgressIndicatorSpinningStyle){
_8.height=15;
}
objj_msgSend(_4,"setFrameSize:",_8);
objj_msgSend(_4,"updateBackgroundColor");
objj_msgSend(_4,"drawBar");
}
return _4;
}
})]);
var _2=objj_allocateClassPair(CPProgressIndicator,"NSProgressIndicator"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_9,_a,_b){
with(_9){
return objj_msgSend(_9,"NS_initWithCoder:",_b);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_c,_d){
with(_c){
return objj_msgSend(CPProgressIndicator,"class");
}
})]);
