@STATIC;1.0;i;15;_CPWindowView.jt;2477;
objj_executeFile("_CPWindowView.j",YES);
var _1=objj_allocateClassPair(_CPWindowView,"_CPToolTipWindowView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_mouseDownPressed"),new objj_ivar("_gravity")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isMouseDownPressed"),function(_3,_4){
with(_3){
return _mouseDownPressed;
}
}),new objj_method(sel_getUid("setMouseDownPressed:"),function(_5,_6,_7){
with(_5){
_mouseDownPressed=_7;
}
}),new objj_method(sel_getUid("gravity"),function(_8,_9){
with(_8){
return _gravity;
}
}),new objj_method(sel_getUid("setGravity:"),function(_a,_b,_c){
with(_a){
_gravity=_c;
}
}),new objj_method(sel_getUid("drawRect:"),function(_d,_e,_f){
with(_d){
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("_CPToolTipWindowView").super_class},"drawRect:",_f);
var _10=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_11=objj_msgSend(_d,"currentValueForThemeAttribute:","border-radius"),_12=objj_msgSend(_d,"currentValueForThemeAttribute:","stroke-width"),_13=objj_msgSend(_d,"currentValueForThemeAttribute:","stroke-color"),_14=objj_msgSend(_d,"currentValueForThemeAttribute:","background-color");
CGContextSetStrokeColor(_10,_13);
CGContextSetFillColor(_10,_14);
CGContextSetLineWidth(_10,_12);
CGContextBeginPath(_10);
_f.origin.x+=_12;
_f.origin.y+=_12;
_f.size.width-=_12*2;
_f.size.height-=_12*2;
CGContextAddPath(_10,CGPathWithRoundedRectangleInRect(_f,_11,_11,YES,YES,YES,YES));
CGContextClosePath(_10);
CGContextStrokePath(_10);
CGContextFillPath(_10);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("defaultThemeClass"),function(_15,_16){
with(_15){
return "tooltip";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_17,_18){
with(_17){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(CPColor,"colorWithHexString:","E3E3E3"),objj_msgSend(CPColor,"colorWithHexString:","FFFFCA"),2,1,objj_msgSend(CPColor,"blackColor")],["stroke-color","background-color","border-radius","stroke-width","color"]);
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_19,_1a,_1b){
with(_19){
var _1c=CGRectMakeCopy(_1b);
_1c.origin.x+=3;
_1c.origin.y+=3;
_1c.size.width-=6;
_1c.size.height-=6;
return _1c;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_1d,_1e,_1f){
with(_1d){
var _20=CGRectMakeCopy(_1f);
_20.origin.x-=3;
_20.origin.y-=3;
_20.size.width+=6;
_20.size.height+=6;
return _20;
}
})]);
