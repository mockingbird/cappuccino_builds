@STATIC;1.0;i;13;CPTextField.ji;8;CPView.ji;10;CPWindow.jt;3382;
objj_executeFile("CPTextField.j",YES);
objj_executeFile("CPView.j",YES);
objj_executeFile("CPWindow.j",YES);
_CPToolTipWindowMask=1<<27;
var _1=24,_2=11;
var _3=objj_allocateClassPair(CPWindow,"_CPToolTip"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_content")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithString:styleMask:"),function(_5,_6,_7,_8){
with(_5){
var _9=CPRectMake(0,0,250,_1),_a=objj_msgSend(_CPToolTip,"computeCorrectSize:text:",_9.size,_7),_b=_a[1];
_9.size=_a[0];
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("_CPToolTip").super_class},"initWithContentRect:styleMask:",_9,_8)){
_b.height+=4;
_content=objj_msgSend(CPTextField,"labelWithTitle:",_7);
objj_msgSend(_content,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",_2));
objj_msgSend(_content,"setLineBreakMode:",CPLineBreakByCharWrapping);
objj_msgSend(_content,"setAlignment:",CPJustifiedTextAlignment);
objj_msgSend(_content,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_content,"setFrameOrigin:",CPPointMake(0,0));
objj_msgSend(_content,"setFrameSize:",_b);
objj_msgSend(_content,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_content,"setTextColor:",objj_msgSend(objj_msgSend(objj_msgSend(CPTheme,"defaultTheme"),"attributeWithName:forClass:","color",_CPToolTipWindowView),"value"));
objj_msgSend(objj_msgSend(_5,"contentView"),"addSubview:",_content);
objj_msgSend(_5,"setLevel:",CPStatusWindowLevel);
objj_msgSend(_5,"setAlphaValue:",0.9);
objj_msgSend(_windowView,"setNeedsDisplay:",YES);
}
return _5;
}
}),new objj_method(sel_getUid("showToolTip"),function(_c,_d){
with(_c){
var _e=objj_msgSend(objj_msgSend(CPApp,"currentEvent"),"globalLocation"),_f=objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"mainWindow"),"platformWindow"),"nativeContentRect");
_e.y+=20;
if(_e.x<0){
_e.x=5;
}
if(_e.x+CPRectGetWidth(objj_msgSend(_c,"frame"))>_f.size.width){
_e.x=_f.size.width-CPRectGetWidth(objj_msgSend(_c,"frame"))-5;
}
if(_e.y<0){
_e.y=5;
}
if(_e.y+CPRectGetHeight(objj_msgSend(_c,"frame"))>_f.size.height){
_e.y=_e.y-CPRectGetHeight(objj_msgSend(_c,"frame"))-40;
}
objj_msgSend(_c,"setFrameOrigin:",_e);
objj_msgSend(_c,"orderFront:",nil);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("toolTipWithString:"),function(_10,_11,_12){
with(_10){
var _13=objj_msgSend(objj_msgSend(_CPToolTip,"alloc"),"initWithString:styleMask:",_12,_CPToolTipWindowMask);
objj_msgSend(_13,"showToolTip");
return _13;
}
}),new objj_method(sel_getUid("computeCorrectSize:text:"),function(_14,_15,_16,_17){
with(_14){
var _18=objj_msgSend(CPFont,"systemFontOfSize:",_2),_19=objj_msgSend(_17,"sizeWithFont:",_18),_1a=objj_msgSend(_17,"sizeWithFont:inWidth:",_18,(_16.width));
if(_19.width<_16.width){
var _1b=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero()),_1c=objj_msgSend(_1b,"currentValueForThemeAttribute:","content-inset")||CGInsetMakeZero();
_1a=_19;
_1a.width+=_1c.left+_1c.right;
_16.width=_1a.width;
}
if(_1a.height<100){
_16.height=_1a.height+4;
return [_16,_1a];
}
var _1d=_16.width+((parseInt(_1a.height-100)/_1)*_1);
_1a=objj_msgSend(_17,"sizeWithFont:inWidth:",_18,_1d-4);
_16.width=_1d+2;
_16.height=_1a.height+4;
return [_16,_1a];
}
}),new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(_1e,_1f,_20){
with(_1e){
return _CPToolTipWindowView;
}
})]);
