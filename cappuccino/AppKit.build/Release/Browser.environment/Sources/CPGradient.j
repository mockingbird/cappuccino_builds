@STATIC;1.0;t;2344;
CPGradientDrawsBeforeStartingLocation=kCGGradientDrawsBeforeStartLocation;
CPGradientDrawsAfterEndingLocation=kCGGradientDrawsAfterEndLocation;
var _1=objj_allocateClassPair(CPObject,"CPGradient"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_gradient")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithColors:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_5,"count");
if(_6<2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"at least 2 colors required");
}
var _7=1/(_6-1),_8=objj_msgSend(CPMutableArray,"array"),_9=0;
for(var i=0;i<_6;i++){
objj_msgSend(_8,"addObject:",_9);
_9+=_7;
}
return objj_msgSend(_3,"initWithColors:atLocations:colorSpace:",_5,_8,nil);
}
}),new objj_method(sel_getUid("initWithColors:atLocations:colorSpace:"),function(_a,_b,_c,_d,_e){
with(_a){
if(_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPGradient").super_class},"init")){
var _f=[],_10=objj_msgSend(_c,"count"),_11=objj_msgSend(_e,"CGColorSpace")||CGColorSpaceCreateDeviceRGB;
for(var i=0;i<_10;i++){
_f.push(CGColorCreate(_11,objj_msgSend(_c[i],"components")));
}
_gradient=CGGradientCreateWithColors(_11,_f,_d);
}
return _a;
}
}),new objj_method(sel_getUid("drawInRect:angle:"),function(_12,_13,_14,_15){
with(_12){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSaveGState(ctx);
CGContextClipToRect(ctx,_14);
CGContextAddRect(ctx,_14);
var _16,_17;
_15=((_15%360)+360)%360;
if(_15<90){
_16={x:(_14.origin.x),y:(_14.origin.y)};
}else{
if(_15<180){
_16={x:(_14.origin.x+_14.size.width),y:(_14.origin.y)};
}else{
if(_15<270){
_16={x:(_14.origin.x+_14.size.width),y:(_14.origin.y+_14.size.height)};
}else{
_16={x:(_14.origin.x),y:(_14.origin.y+_14.size.height)};
}
}
}
var _18=PI*_15/180,_19=ABS((_14.size.width)*COS(_18))+ABS((_14.size.height)*SIN(_18));
_17={x:_16.x+_19*COS(_18),y:_16.y+_19*SIN(_18)};
objj_msgSend(_12,"drawFromPoint:toPoint:options:",_16,_17,CPGradientDrawsBeforeStartingLocation|CPGradientDrawsAfterEndingLocation);
CGContextRestoreGState(ctx);
}
}),new objj_method(sel_getUid("drawFromPoint:toPoint:options:"),function(_1a,_1b,_1c,_1d,_1e){
with(_1a){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextDrawLinearGradient(ctx,_gradient,_1c,_1d,_1e);
}
})]);
