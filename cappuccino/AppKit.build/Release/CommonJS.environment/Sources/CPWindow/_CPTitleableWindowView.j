@STATIC;1.0;i;15;_CPWindowView.jt;3206;
objj_executeFile("_CPWindowView.j",YES);
var _1=25;
var _2=objj_allocateClassPair(_CPWindowView,"_CPTitleableWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_titleField")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPTitleableWindowView").super_class},"initWithFrame:styleMask:",_6,_7);
if(_4){
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setHitTests:",NO);
objj_msgSend(_titleField,"setStringValue:","Untitled");
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setStringValue:","");
objj_msgSend(_titleField,"setFrame:",CGRectMake(20,3,CGRectGetWidth(objj_msgSend(_4,"bounds"))-40,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
objj_msgSend(_4,"addSubview:",_titleField);
objj_msgSend(_4,"setNeedsLayout");
}
return _4;
}
}),new objj_method(sel_getUid("setTitle:"),function(_8,_9,_a){
with(_8){
objj_msgSend(_titleField,"setStringValue:",_a);
}
}),new objj_method(sel_getUid("tile"),function(_b,_c){
with(_b){
objj_msgSendSuper({receiver:_b,super_class:objj_getClass("_CPTitleableWindowView").super_class},"tile");
var _d=objj_msgSend(_b,"window"),_e=objj_msgSend(_b,"bounds"),_f=CGRectGetWidth(_e);
objj_msgSend(_titleField,"setFrame:",{origin:{x:20,y:0},size:{width:_f-40,height:objj_msgSend(objj_msgSend(_b,"class"),"titleBarHeight")}});
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_10,_11){
with(_10){
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("_CPTitleableWindowView").super_class},"layoutSubviews");
objj_msgSend(_titleField,"setTextColor:",objj_msgSend(_10,"currentValueForThemeAttribute:","title-text-color"));
objj_msgSend(_titleField,"setFont:",objj_msgSend(_10,"currentValueForThemeAttribute:","title-font"));
objj_msgSend(_titleField,"setAlignment:",objj_msgSend(_10,"currentValueForThemeAttribute:","title-alignment"));
objj_msgSend(_titleField,"setVerticalAlignment:",objj_msgSend(_10,"currentValueForThemeAttribute:","title-vertical-alignment"));
objj_msgSend(_titleField,"setLineBreakMode:",objj_msgSend(_10,"currentValueForThemeAttribute:","title-line-break-mode"));
objj_msgSend(_titleField,"setTextShadowColor:",objj_msgSend(_10,"currentValueForThemeAttribute:","title-text-shadow-color"));
objj_msgSend(_titleField,"setTextShadowOffset:",objj_msgSend(_10,"currentValueForThemeAttribute:","title-text-shadow-offset"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("titleBarHeight"),function(_12,_13){
with(_12){
return _1;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_14,_15,_16){
with(_14){
var _17=CGRectMakeCopy(_16),_18=objj_msgSend(objj_msgSend(_14,"class"),"titleBarHeight");
_17.origin.y+=_18;
_17.size.height-=_18;
return _17;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_19,_1a,_1b){
with(_19){
var _1c=CGRectMakeCopy(_1b),_1d=objj_msgSend(objj_msgSend(_19,"class"),"titleBarHeight");
_1c.origin.y-=_1d;
_1c.size.height+=_1d;
return _1c;
}
})]);
