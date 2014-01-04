@STATIC;1.0;i;13;CPAnimation.jt;5291;
objj_executeFile("CPAnimation.j",YES);
CPViewAnimationTargetKey="CPViewAnimationTargetKey";
CPViewAnimationStartFrameKey="CPViewAnimationStartFrameKey";
CPViewAnimationEndFrameKey="CPViewAnimationEndFrameKey";
CPViewAnimationEffectKey="CPViewAnimationEffectKey";
CPViewAnimationFadeInEffect="CPViewAnimationFadeInEffect";
CPViewAnimationFadeOutEffect="CPViewAnimationFadeOutEffect";
var _1=objj_allocateClassPair(CPAnimation,"CPViewAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_viewAnimations")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithViewAnimations:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPViewAnimation").super_class},"initWithDuration:animationCurve:",0.5,CPAnimationLinear)){
objj_msgSend(_3,"setViewAnimations:",_5);
}
return _3;
}
}),new objj_method(sel_getUid("startAnimation"),function(_6,_7){
with(_6){
var _8=objj_msgSend(_viewAnimations,"count");
while(_8--){
var _9=objj_msgSend(_viewAnimations,"objectAtIndex:",_8),_a=objj_msgSend(_6,"_targetView:",_9),_b=objj_msgSend(_6,"_startFrame:",_9);
objj_msgSend(_a,"setFrame:",_b);
var _c=objj_msgSend(_6,"_effect:",_9);
if(_c===CPViewAnimationFadeInEffect){
objj_msgSend(_a,"setAlphaValue:",0);
objj_msgSend(_6,"_targetView:setHidden:",_a,NO);
}else{
if(_c===CPViewAnimationFadeOutEffect){
objj_msgSend(_a,"setAlphaValue:",1);
}
}
}
objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPViewAnimation").super_class},"startAnimation");
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(_d,_e,_f){
with(_d){
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPViewAnimation").super_class},"setCurrentProgress:",_f);
var _10=objj_msgSend(_viewAnimations,"count");
while(_10--){
var _11=objj_msgSend(_viewAnimations,"objectAtIndex:",_10),_12=objj_msgSend(_d,"_targetView:",_11),_13=objj_msgSend(_d,"_startFrame:",_11),_14=objj_msgSend(_d,"_endFrame:",_11),_15={origin:{x:0,y:0},size:{width:0,height:0}},_16=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPViewAnimation").super_class},"currentValue");
_15.origin.x=_14.origin.x-_13.origin.x;
_15.origin.y=_14.origin.y-_13.origin.y;
_15.size.width=_14.size.width-_13.size.width;
_15.size.height=_14.size.height-_13.size.height;
var _17={origin:{x:0,y:0},size:{width:0,height:0}};
_17.origin.x=_13.origin.x+_15.origin.x*_16;
_17.origin.y=_13.origin.y+_15.origin.y*_16;
_17.size.width=_13.size.width+_15.size.width*_16;
_17.size.height=_13.size.height+_15.size.height*_16;
objj_msgSend(_12,"setFrame:",_17);
var _18=objj_msgSend(_d,"_effect:",_11);
if(_18===CPViewAnimationFadeInEffect){
objj_msgSend(_12,"setAlphaValue:",1*_16);
}else{
if(_18===CPViewAnimationFadeOutEffect){
objj_msgSend(_12,"setAlphaValue:",1+(0-1)*_16);
}
}
if(_f===1){
objj_msgSend(_d,"_targetView:setHidden:",_12,(_14.size.width<=0||_14.size.height<=0)||objj_msgSend(_12,"alphaValue")===0);
}
}
}
}),new objj_method(sel_getUid("stopAnimation"),function(_19,_1a){
with(_19){
var _1b=objj_msgSend(_viewAnimations,"count");
while(_1b--){
var _1c=objj_msgSend(_viewAnimations,"objectAtIndex:",_1b),_1d=objj_msgSend(_19,"_targetView:",_1c),_1e=objj_msgSend(_19,"_endFrame:",_1c);
objj_msgSend(_1d,"setFrame:",_1e);
var _1f=objj_msgSend(_19,"_effect:",_1c);
if(_1f===CPViewAnimationFadeInEffect){
objj_msgSend(_1d,"setAlphaValue:",1);
}else{
if(_1f===CPViewAnimationFadeOutEffect){
objj_msgSend(_1d,"setAlphaValue:",0);
}
}
objj_msgSend(_19,"_targetView:setHidden:",_1d,(_1e.size.width<=0||_1e.size.height<=0)||objj_msgSend(_1d,"alphaValue")===0);
}
objj_msgSendSuper({receiver:_19,super_class:objj_getClass("CPViewAnimation").super_class},"stopAnimation");
}
}),new objj_method(sel_getUid("_targetView:setHidden:"),function(_20,_21,_22,_23){
with(_20){
if(objj_msgSend(_22,"isKindOfClass:",objj_msgSend(CPWindow,"class"))){
if(_23){
objj_msgSend(_22,"orderOut:",_20);
}else{
objj_msgSend(_22,"orderFront:",_20);
}
}else{
objj_msgSend(_22,"setHidden:",_23);
}
}
}),new objj_method(sel_getUid("_targetView:"),function(_24,_25,_26){
with(_24){
var _27=objj_msgSend(_26,"valueForKey:",CPViewAnimationTargetKey);
if(!_27){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(CPString,"stringWithFormat:","view animation: %@ does not have a target view",objj_msgSend(_26,"description")));
}
return _27;
}
}),new objj_method(sel_getUid("_startFrame:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(_2a,"valueForKey:",CPViewAnimationStartFrameKey);
if(!_2b){
return objj_msgSend(objj_msgSend(_28,"_targetView:",_2a),"frame");
}
return _2b;
}
}),new objj_method(sel_getUid("_endFrame:"),function(_2c,_2d,_2e){
with(_2c){
var _2f=objj_msgSend(_2e,"valueForKey:",CPViewAnimationEndFrameKey);
if(!_2f){
return objj_msgSend(objj_msgSend(_2c,"_targetView:",_2e),"frame");
}
return _2f;
}
}),new objj_method(sel_getUid("_effect:"),function(_30,_31,_32){
with(_30){
return objj_msgSend(_32,"valueForKey:",CPViewAnimationEffectKey);
}
}),new objj_method(sel_getUid("viewAnimations"),function(_33,_34){
with(_33){
return _viewAnimations;
}
}),new objj_method(sel_getUid("setViewAnimations:"),function(_35,_36,_37){
with(_35){
if(_37!=_viewAnimations){
objj_msgSend(_35,"stopAnimation");
_viewAnimations=objj_msgSend(_37,"copy");
}
}
})]);
