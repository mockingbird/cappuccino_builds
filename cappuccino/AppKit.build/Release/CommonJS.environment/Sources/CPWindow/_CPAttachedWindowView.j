@STATIC;1.0;i;15;_CPWindowView.jt;7613;
objj_executeFile("_CPWindowView.j",YES);
var _1=CGSizeMake(16,10),_2=5,_3=1,_4=CGSizeMake(0,6),_5=15;
var _6=objj_allocateClassPair(_CPWindowView,"_CPAttachedWindowView"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_arrowOffsetX"),new objj_ivar("_arrowOffsetY"),new objj_ivar("_appearance"),new objj_ivar("_preferredEdge"),new objj_ivar("_cursorSize")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("arrowOffsetX"),function(_8,_9){
with(_8){
return _arrowOffsetX;
}
}),new objj_method(sel_getUid("setArrowOffsetX:"),function(_a,_b,_c){
with(_a){
_arrowOffsetX=_c;
}
}),new objj_method(sel_getUid("arrowOffsetY"),function(_d,_e){
with(_d){
return _arrowOffsetY;
}
}),new objj_method(sel_getUid("setArrowOffsetY:"),function(_f,_10,_11){
with(_f){
_arrowOffsetY=_11;
}
}),new objj_method(sel_getUid("appearance"),function(_12,_13){
with(_12){
return _appearance;
}
}),new objj_method(sel_getUid("setAppearance:"),function(_14,_15,_16){
with(_14){
_appearance=_16;
}
}),new objj_method(sel_getUid("preferredEdge"),function(_17,_18){
with(_17){
return _preferredEdge;
}
}),new objj_method(sel_getUid("setPreferredEdge:"),function(_19,_1a,_1b){
with(_19){
_preferredEdge=_1b;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_1c,_1d,_1e){
with(_1c){
var _1f=CGRectMakeCopy(_1e);
_1f.origin.x+=18;
_1f.origin.y+=17;
_1f.size.width-=35;
_1f.size.height-=37;
return _1f;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_20,_21,_22,_23){
with(_20){
if(_20=objj_msgSendSuper({receiver:_20,super_class:objj_getClass("_CPAttachedWindowView").super_class},"initWithFrame:styleMask:",_22,_23)){
_arrowOffsetX=0;
_arrowOffsetY=0;
_appearance=CPPopoverAppearanceMinimal;
_cursorSize=CGSizeMakeCopy(_1);
}
return _20;
}
}),new objj_method(sel_getUid("hideCursor"),function(_24,_25){
with(_24){
_cursorSize=CGSizeMakeZero();
objj_msgSend(_24,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("showCursor"),function(_26,_27){
with(_26){
_cursorSize=CGSizeMakeCopy(_1);
objj_msgSend(_26,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_28,_29,_2a){
with(_28){
objj_msgSendSuper({receiver:_28,super_class:objj_getClass("_CPAttachedWindowView").super_class},"drawRect:",_2a);
var _2b=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_2c=_2,_2d=_cursorSize.width,_2e=_cursorSize.height,_2f=_3,_30=_2f/2,_31,_32=objj_msgSend(objj_msgSend(CPColor,"blackColor"),"colorWithAlphaComponent:",0.2),_33=_4,_34=_5,_35,_36=objj_msgSend(_28,"bounds");
if(_appearance==CPPopoverAppearanceMinimal){
_35=CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(),[(254/255),(254/255),(254/255),0.93,(231/255),(231/255),(231/255),0.93],[0,1],2);
_31=objj_msgSend(CPColor,"colorWithHexString:","B8B8B8");
}else{
_35=CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(),[(38/255),(38/255),(38/255),0.93,(18/255),(18/255),(18/255),0.93],[0,1],2);
_31=objj_msgSend(CPColor,"colorWithHexString:","222222");
}
_36.origin.x+=_30+_34;
_36.origin.y+=_30+(_34+_33.height/2);
_36.size.width-=_2f+(_34*2);
_36.size.height-=_2f+(_34*2+_33.height);
CGContextSetStrokeColor(_2b,_31);
CGContextSetLineWidth(_2b,_2f);
CGContextBeginPath(_2b);
CGContextSetShadowWithColor(_2b,_33,_34,_32);
CGContextDrawLinearGradient(_2b,_35,CGPointMake(CGRectGetMidX(_36),0),CGPointMake(CGRectGetMidX(_36),_36.size.height),0);
var _37=(_36.origin.x),_38=(_36.origin.x+_36.size.width),_39=(_36.origin.y),_3a=(_36.origin.y+_36.size.height),_3b=(FLOOR(_37+_2c+_2f)),_3c=(FLOOR(_38-_2c-_2f)),_3d=(FLOOR(_39+_2c+_2f)),_3e=(FLOOR(_3a-_2c+_2f)),_3f=CGPointMakeZero(),_40=CGPointMakeZero(),pt=CGPointMakeZero();
switch(_preferredEdge){
case CPMinXEdge:
case CPMaxXEdge:
pt.x=(FLOOR(_37+_2c));
pt.y=_39;
CGContextMoveToPoint(_2b,pt.x,pt.y);
pt.x=(FLOOR(_38-_2c));
CGContextAddLineToPoint(_2b,pt.x,pt.y);
CGContextAddCurveToPoint(_2b,pt.x,pt.y,_38,_39,_38,(FLOOR(_39+_2c)));
if(_preferredEdge===CPMinXEdge){
_3f.x=(FLOOR(_38)===(_38)?(_38)+_30:(_38));
_3f.y=(FLOOR((_36.size.height/2)+_39+_arrowOffsetY));
pt.y=(FLOOR(_3f.y-(_2d/2)));
if(pt.y<=_3d){
pt.y=_3d;
}else{
if((pt.y+_2d)>_3e){
pt.y=_3e-_2d;
}
}
pt.x=_3f.x;
_40=CGPointMakeCopy(pt);
CGContextAddLineToPoint(_2b,pt.x,pt.y);
pt.x=(FLOOR(_3f.x+_2e)===(_3f.x+_2e)?(_3f.x+_2e)+_30:(_3f.x+_2e));
pt.y=_3f.y;
CGContextAddLineToPoint(_2b,pt.x,pt.y);
pt.x=_3f.x;
pt.y=(FLOOR(_40.y+_2d));
CGContextAddLineToPoint(_2b,pt.x,pt.y);
}
pt.x=_38;
pt.y=(FLOOR(_3a-_2c));
CGContextAddLineToPoint(_2b,pt.x,pt.y);
CGContextAddCurveToPoint(_2b,pt.x,pt.y,pt.x,_3a,(FLOOR(_38-_2c)),_3a);
pt.x=(FLOOR(_37+_2c));
pt.y=_3a;
CGContextAddLineToPoint(_2b,pt.x,pt.y);
CGContextAddCurveToPoint(_2b,pt.x,pt.y,_37,pt.y,_37,(FLOOR(_3a-_2c)));
if(_preferredEdge===CPMaxXEdge){
_3f.x=(FLOOR(_37)===(_37)?(_37)+_30:(_37));
_3f.y=(FLOOR((_36.size.height/2)+_39+_arrowOffsetY));
pt.y=(FLOOR(_3f.y+(_2d/2)));
if((pt.y-_2d)<_3d){
pt.y=_3d+_2d;
}else{
if(pt.y>_3e){
pt.y=_3e;
}
}
pt.x=_3f.x;
_40=CGPointMakeCopy(pt);
CGContextAddLineToPoint(_2b,pt.x,pt.y);
pt.x=(FLOOR(_3f.x-_2e)===(_3f.x-_2e)?(_3f.x-_2e)+_30:(_3f.x-_2e));
pt.y=_3f.y;
CGContextAddLineToPoint(_2b,pt.x,pt.y);
pt.x=_3f.x;
pt.y=(FLOOR(_40.y-_2d));
CGContextAddLineToPoint(_2b,pt.x,pt.y);
}
pt.x=_37;
pt.y=(FLOOR(_39+_2c));
CGContextAddLineToPoint(_2b,pt.x,pt.y);
CGContextAddCurveToPoint(_2b,pt.x,pt.y,pt.x,_39,(FLOOR(_37+_2c)),_39);
break;
case CPMaxYEdge:
case CPMinYEdge:
pt.x=_37;
pt.y=(FLOOR(_3a-_2c));
CGContextMoveToPoint(_2b,pt.x,pt.y);
pt.y=(FLOOR(_39+_2c));
CGContextAddLineToPoint(_2b,pt.x,pt.y);
CGContextAddCurveToPoint(_2b,pt.x,pt.y,pt.x,_39,(FLOOR(_37+_2c)),_39);
if(_preferredEdge===CPMaxYEdge){
_3f.x=(FLOOR((_36.size.width/2)+_37+_arrowOffsetX));
_3f.y=(FLOOR(_39+_arrowOffsetY)===(_39+_arrowOffsetY)?(_39+_arrowOffsetY)+_30:(_39+_arrowOffsetY));
pt.x=(FLOOR(_3f.x-(_2d/2)));
if(pt.x<_3b){
pt.x=_3b;
}else{
if((pt.x+_2d)>_3c){
pt.x=_3c-_2d;
}
}
pt.y=_3f.y;
_40=CGPointMakeCopy(pt);
CGContextAddLineToPoint(_2b,pt.x,pt.y);
pt.x=_3f.x;
pt.y=(FLOOR(_3f.y-_2e)===(_3f.y-_2e)?(_3f.y-_2e)+_30:(_3f.y-_2e));
CGContextAddLineToPoint(_2b,pt.x,pt.y);
pt.x=(FLOOR(_40.x+_2d));
pt.y=_3f.y;
CGContextAddLineToPoint(_2b,pt.x,pt.y);
}
pt.x=(FLOOR(_38-_2c));
pt.y=_39;
CGContextAddLineToPoint(_2b,pt.x,pt.y);
CGContextAddCurveToPoint(_2b,pt.x,pt.y,_38,pt.y,_38,(FLOOR(_39+_2c)));
pt.x=_38;
pt.y=(FLOOR(_3a-_2c));
CGContextAddLineToPoint(_2b,pt.x,pt.y);
CGContextAddCurveToPoint(_2b,pt.x,pt.y,pt.x,_3a,(FLOOR(_38-_2c)),_3a);
if(_preferredEdge===CPMinYEdge){
_3f.x=(FLOOR((_36.size.width/2)+_37+_arrowOffsetX));
_3f.y=(FLOOR(_3a+_arrowOffsetY)===(_3a+_arrowOffsetY)?(_3a+_arrowOffsetY)+_30:(_3a+_arrowOffsetY));
pt.x=(FLOOR(_3f.x+(_2d/2)));
if((pt.x-_2d)<_3b){
pt.x=_3b+_2d;
}else{
if(pt.x>_3c){
pt.x=_3c;
}
}
pt.y=_3f.y;
_40=CGPointMakeCopy(pt);
CGContextAddLineToPoint(_2b,pt.x,pt.y);
pt.x=_3f.x;
pt.y=(FLOOR(_3f.y+_2e)===(_3f.y+_2e)?(_3f.y+_2e)+_30:(_3f.y+_2e));
CGContextAddLineToPoint(_2b,pt.x,pt.y);
pt.x=(FLOOR(_40.x-_2d));
pt.y=_3f.y;
CGContextAddLineToPoint(_2b,pt.x,pt.y);
}
pt.x=(FLOOR(_37+_2c));
pt.y=_3a;
CGContextAddLineToPoint(_2b,pt.x,pt.y);
CGContextAddCurveToPoint(_2b,pt.x,pt.y,_37,pt.y,_37,(FLOOR(_3a-_2c)));
break;
default:
CGContextAddPath(_2b,CGPathWithRoundedRectangleInRect(_36,_2c,_2c,YES,YES,YES,YES));
}
CGContextClosePath(_2b);
CGContextStrokePath(_2b);
CGContextFillPath(_2b);
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("frameRectForContentRect:"),function(_41,_42,_43){
with(_41){
var _44=CGRectMakeCopy(_43);
_44.origin.x-=18;
_44.origin.y-=17;
_44.size.width+=35;
_44.size.height+=37;
return _44;
}
})]);
