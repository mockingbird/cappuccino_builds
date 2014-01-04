@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPTimer.ji;23;CAMediaTimingFunction.jt;5375;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPTimer.j",NO);
objj_executeFile("CAMediaTimingFunction.j",YES);
CPAnimationEaseInOut=0;
CPAnimationEaseIn=1;
CPAnimationEaseOut=2;
CPAnimationLinear=3;
ACTUAL_FRAME_RATE=0;
var _1=objj_allocateClassPair(CPObject,"CPAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_lastTime"),new objj_ivar("_duration"),new objj_ivar("_animationCurve"),new objj_ivar("_timingFunction"),new objj_ivar("_frameRate"),new objj_ivar("_progress"),new objj_ivar("_delegate"),new objj_ivar("_timer")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithDuration:animationCurve:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPAnimation").super_class},"init");
if(_3){
_progress=0;
_duration=MAX(0,_5);
_frameRate=60;
objj_msgSend(_3,"setAnimationCurve:",_6);
}
return _3;
}
}),new objj_method(sel_getUid("setAnimationCurve:"),function(_7,_8,_9){
with(_7){
var _a;
switch(_9){
case CPAnimationEaseInOut:
_a=kCAMediaTimingFunctionEaseInEaseOut;
break;
case CPAnimationEaseIn:
_a=kCAMediaTimingFunctionEaseIn;
break;
case CPAnimationEaseOut:
_a=kCAMediaTimingFunctionEaseOut;
break;
case CPAnimationLinear:
_a=kCAMediaTimingFunctionLinear;
break;
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid value provided for animation curve");
break;
}
_animationCurve=_9;
_timingFunction=objj_msgSend(CAMediaTimingFunction,"functionWithName:",_a);
}
}),new objj_method(sel_getUid("animationCurve"),function(_b,_c){
with(_b){
return _animationCurve;
}
}),new objj_method(sel_getUid("setDuration:"),function(_d,_e,_f){
with(_d){
if(_f<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"aDuration can't be negative");
}
_duration=_f;
}
}),new objj_method(sel_getUid("duration"),function(_10,_11){
with(_10){
return _duration;
}
}),new objj_method(sel_getUid("setFrameRate:"),function(_12,_13,_14){
with(_12){
if(_14<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"frameRate can't be negative");
}
_frameRate=_14;
}
}),new objj_method(sel_getUid("frameRate"),function(_15,_16){
with(_15){
return _frameRate;
}
}),new objj_method(sel_getUid("delegate"),function(_17,_18){
with(_17){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_19,_1a,_1b){
with(_19){
_delegate=_1b;
}
}),new objj_method(sel_getUid("startAnimation"),function(_1c,_1d){
with(_1c){
if(_timer||_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationShouldStart:"))&&!objj_msgSend(_delegate,"animationShouldStart:",_1c)){
return;
}
if(_progress===1){
_progress=0;
}
ACTUAL_FRAME_RATE=0;
_lastTime=new Date();
_timer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_1c,sel_getUid("animationTimerDidFire:"),nil,YES);
}
}),new objj_method(sel_getUid("animationTimerDidFire:"),function(_1e,_1f,_20){
with(_1e){
var _21=new Date(),_22=MIN(1,objj_msgSend(_1e,"currentProgress")+(_21-_lastTime)/(_duration*1000));
_lastTime=_21;
++ACTUAL_FRAME_RATE;
objj_msgSend(_1e,"setCurrentProgress:",_22);
if(_22===1){
objj_msgSend(_timer,"invalidate");
_timer=nil;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidEnd:"))){
objj_msgSend(_delegate,"animationDidEnd:",_1e);
}
}
}
}),new objj_method(sel_getUid("stopAnimation"),function(_23,_24){
with(_23){
if(!_timer){
return;
}
objj_msgSend(_timer,"invalidate");
_timer=nil;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidStop:"))){
objj_msgSend(_delegate,"animationDidStop:",_23);
}
}
}),new objj_method(sel_getUid("isAnimating"),function(_25,_26){
with(_25){
return _timer;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(_27,_28,_29){
with(_27){
_progress=_29;
}
}),new objj_method(sel_getUid("currentProgress"),function(_2a,_2b){
with(_2a){
return _progress;
}
}),new objj_method(sel_getUid("currentValue"),function(_2c,_2d){
with(_2c){
var t=objj_msgSend(_2c,"currentProgress");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animation:valueForProgress:"))){
return objj_msgSend(_delegate,"animation:valueForProgress:",_2c,t);
}
if(_animationCurve==CPAnimationLinear){
return t;
}
var c1=[],c2=[];
objj_msgSend(_timingFunction,"getControlPointAtIndex:values:",1,c1);
objj_msgSend(_timingFunction,"getControlPointAtIndex:values:",2,c2);
return _2e(t,c1[0],c1[1],c2[0],c2[1],_duration);
}
})]);
var _2e=_2e=function(t,p1x,p1y,p2x,p2y,_2f){
var ax=0,bx=0,cx=0,ay=0,by=0,cy=0;
sampleCurveX=function(t){
return ((ax*t+bx)*t+cx)*t;
};
sampleCurveY=function(t){
return ((ay*t+by)*t+cy)*t;
};
sampleCurveDerivativeX=function(t){
return (3*ax*t+2*bx)*t+cx;
};
solveEpsilon=function(_30){
return 1/(200*_30);
};
solve=function(x,_31){
return sampleCurveY(solveCurveX(x,_31));
};
solveCurveX=function(x,_32){
var t0,t1,t2=x,x2,d2,i=0;
for(;i<8;i++){
x2=sampleCurveX(t2)-x;
if(ABS(x2)<_32){
return t2;
}
d2=sampleCurveDerivativeX(t2);
if(ABS(d2)<0.000001){
break;
}
t2=t2-x2/d2;
}
t0=0;
t1=1;
t2=x;
if(t2<t0){
return t0;
}
if(t2>t1){
return t1;
}
while(t0<t1){
x2=sampleCurveX(t2);
if(ABS(x2-x)<_32){
return t2;
}
if(x>x2){
t0=t2;
}else{
t1=t2;
}
t2=(t1-t0)*0.5+t0;
}
return t2;
};
cx=3*p1x;
bx=3*(p2x-p1x)-cx;
ax=1-cx-bx;
cy=3*p1y;
by=3*(p2y-p1y)-cy;
ay=1-cy-by;
return solve(t,solveEpsilon(_2f));
};
