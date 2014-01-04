@STATIC;1.0;I;21;Foundation/CPObject.ji;10;CPButton.ji;10;CPWindow.jt;10190;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPButton.j",YES);
objj_executeFile("CPWindow.j",YES);
CPClosableOnBlurWindowMask=1<<4;
CPPopoverAppearanceMinimal=0;
CPPopoverAppearanceHUD=1;
var _1=1<<0,_2=1<<1;
var _3=objj_allocateClassPair(CPWindow,"_CPAttachedWindow"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_animates"),new objj_ivar("_targetView"),new objj_ivar("_appearance"),new objj_ivar("_isClosing"),new objj_ivar("_closeOnBlur"),new objj_ivar("_browserAnimates"),new objj_ivar("_shouldPerformAnimation"),new objj_ivar("_implementedDelegateMethods")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("animates"),function(_5,_6){
with(_5){
return _animates;
}
}),new objj_method(sel_getUid("setAnimates:"),function(_7,_8,_9){
with(_7){
_animates=_9;
}
}),new objj_method(sel_getUid("targetView"),function(_a,_b){
with(_a){
return _targetView;
}
}),new objj_method(sel_getUid("setTargetView:"),function(_c,_d,_e){
with(_c){
_targetView=_e;
}
}),new objj_method(sel_getUid("appearance"),function(_f,_10){
with(_f){
return _appearance;
}
}),new objj_method(sel_getUid("_setAppearance:"),function(_11,_12,_13){
with(_11){
_appearance=_13;
}
}),new objj_method(sel_getUid("isClosing"),function(_14,_15){
with(_14){
return _isClosing;
}
}),new objj_method(sel_getUid("setIsClosing:"),function(_16,_17,_18){
with(_16){
_isClosing=_18;
}
}),new objj_method(sel_getUid("initWithContentRect:"),function(_19,_1a,_1b){
with(_19){
return objj_msgSend(_19,"initWithContentRect:styleMask:",_1b,0);
}
}),new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_1c,_1d,_1e,_1f){
with(_1c){
if(_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("_CPAttachedWindow").super_class},"initWithContentRect:styleMask:",_1e,_1f)){
_animates=YES;
_closeOnBlur=(_1f&CPClosableOnBlurWindowMask);
_isClosing=NO;
_browserAnimates=objj_msgSend(_1c,"browserSupportsAnimation");
_shouldPerformAnimation=YES;
objj_msgSend(_1c,"setLevel:",CPStatusWindowLevel);
objj_msgSend(_1c,"setMovableByWindowBackground:",YES);
objj_msgSend(_1c,"setHasShadow:",NO);
objj_msgSend(_1c,"setCSS3Property:value:","TransitionProperty","-webkit-transform, opacity");
objj_msgSend(_windowView,"setNeedsDisplay:",YES);
}
return _1c;
}
}),new objj_method(sel_getUid("setAppearance:"),function(_20,_21,_22){
with(_20){
if(_appearance===_22){
return;
}
objj_msgSend(_windowView,"setAppearance:",_22);
}
}),new objj_method(sel_getUid("setStyleMask:"),function(_23,_24,_25){
with(_23){
_closeOnBlur=(_25&CPClosableOnBlurWindowMask);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_26,_27,_28){
with(_26){
if(_delegate===_28){
return;
}
_delegate=_28;
_implementedDelegateMethods=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("attachedWindowShouldClose:"))){
_implementedDelegateMethods|=_1;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("attachedWindowDidClose:"))){
_implementedDelegateMethods|=_2;
}
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_29,_2a,_2b,_2c,_2d,_2e){
with(_29){
if(objj_msgSend(_2b,"isEqual:","frame")){
var _2f=objj_msgSend(_windowView,"preferredEdge");
objj_msgSend(_29,"positionRelativeToRect:ofView:preferredEdge:",nil,_targetView,_2f);
}
}
}),new objj_method(sel_getUid("computeOriginFromRect:ofView:preferredEdge:"),function(_30,_31,_32,_33,_34){
with(_30){
var _35=objj_msgSend(_33,"window"),_36=objj_msgSend(_35,"platformWindow"),_37=objj_msgSend(_36,"nativeContentRect"),_38=objj_msgSend(_33,"convertPointToBase:",_32.origin),_39=objj_msgSend(_35,"convertBaseToPlatformWindow:",_38),_3a={origin:{x:_39.x,y:_39.y},size:{width:_32.size.width,height:_32.size.height}},_3b={x:_39.x,y:_39.y},_3c={x:_39.x,y:_39.y},_3d={x:_39.x,y:_39.y},_3e={x:_39.x,y:_39.y},_3f=objj_msgSend(_30,"frame").size;
_3c.x+=_3a.size.width;
_3c.y+=(_3a.size.height/2)-(_3f.height/2);
_3b.x-=_3f.width;
_3b.y+=(_3a.size.height/2)-(_3f.height/2);
_3e.x+=_3a.size.width/2-_3f.width/2;
_3e.y+=_3a.size.height;
_3d.x+=_3a.size.width/2-_3f.width/2;
_3d.y-=_3f.height;
var _40=(_34!==nil)?_34:CPMaxXEdge,_41;
switch(_40){
case CPMaxXEdge:
_41=_3c;
break;
case CPMinXEdge:
_41=_3b;
break;
case CPMinYEdge:
_41=_3d;
break;
case CPMaxYEdge:
_41=_3e;
break;
}
var _42=[_41,_3c,_3b,_3d,_3e],_43=[_40,CPMaxXEdge,CPMinXEdge,CPMinYEdge,CPMaxYEdge];
for(var i=0;i<_42.length;i++){
var _44=_42[i],_45=_43[i];
objj_msgSend(_windowView,"setArrowOffsetX:",0);
objj_msgSend(_windowView,"setArrowOffsetY:",0);
objj_msgSend(_windowView,"setPreferredEdge:",_45);
if(_44.x<0){
objj_msgSend(_windowView,"setArrowOffsetX:",_44.x);
_44.x=0;
}
if(_44.x+_3f.width>_37.size.width){
objj_msgSend(_windowView,"setArrowOffsetX:",(_44.x+_3f.width-_37.size.width));
_44.x=_37.size.width-_3f.width;
}
if(_44.y<0){
objj_msgSend(_windowView,"setArrowOffsetY:",_44.y);
_44.y=0;
}
if(_44.y+_3f.height>_37.size.height){
objj_msgSend(_windowView,"setArrowOffsetY:",(_3f.height+_44.y-_37.size.height));
_44.y=_37.size.height-_3f.height;
}
switch(_45){
case CPMaxXEdge:
if(_44.x>=(_3a.origin.x+_3a.size.width)){
return _44;
}
break;
case CPMinXEdge:
if((_44.x+_3f.width)<=_3a.origin.x){
return _44;
}
break;
case CPMaxYEdge:
if(_44.y>=(_3a.origin.y+_3a.size.height)){
return _44;
}
break;
case CPMinYEdge:
if((_44.y+_3f.height)<=_3a.origin.y){
return _44;
}
break;
}
}
objj_msgSend(_windowView,"setPreferredEdge:",nil);
return _41;
}
}),new objj_method(sel_getUid("positionRelativeToView:"),function(_46,_47,_48){
with(_46){
objj_msgSend(_46,"positionRelativeToRect:ofView:preferredEdge:",nil,_48,nil);
}
}),new objj_method(sel_getUid("positionRelativeToRect:ofView:preferredEdge:"),function(_49,_4a,_4b,_4c,_4d){
with(_49){
if(!_4b||(_4b.size.width<=0||_4b.size.height<=0)){
_4b=objj_msgSend(_4c,"bounds");
}
var _4e=objj_msgSend(_49,"computeOriginFromRect:ofView:preferredEdge:",_4b,_4c,_4d);
objj_msgSend(_49,"setFrameOrigin:",_4e);
objj_msgSend(_windowView,"showCursor");
objj_msgSend(_49,"setLevel:",CPStatusWindowLevel);
objj_msgSend(_windowView,"setNeedsDisplay:",YES);
objj_msgSend(_49,"makeKeyAndOrderFront:",nil);
if(_4c!==_targetView){
objj_msgSend(_targetView,"removeObserver:forKeyPath:",_49,"frame");
_targetView=_4c;
objj_msgSend(_targetView,"addObserver:forKeyPath:options:context:",_49,"frame",0,nil);
}
}
}),new objj_method(sel_getUid("setCSS3Property:value:"),function(_4f,_50,_51,_52){
with(_4f){
_DOMElement.style["webkit"+_51]=_52;
}
}),new objj_method(sel_getUid("browserSupportsAnimation"),function(_53,_54){
with(_53){
return typeof (_DOMElement.style.webkitTransition)!=="undefined";
}
}),new objj_method(sel_getUid("close:"),function(_55,_56,_57){
with(_55){
objj_msgSend(_55,"close");
}
}),new objj_method(sel_getUid("resignMainWindow"),function(_58,_59){
with(_58){
if(_closeOnBlur&&!_isClosing){
if(!_delegate||((_implementedDelegateMethods&_1)&&objj_msgSend(_delegate,"attachedWindowShouldClose:",_58))){
objj_msgSend(_58,"close");
}
}
}
}),new objj_method(sel_getUid("orderFront:"),function(_5a,_5b,_5c){
with(_5a){
if(!objj_msgSend(_5a,"isMainWindow")){
objj_msgSendSuper({receiver:_5a,super_class:objj_getClass("_CPAttachedWindow").super_class},"orderFront:",_5c);
if(_animates&&_browserAnimates&&_shouldPerformAnimation){
var _5d="50% 100%",_5e=objj_msgSend(_5a,"frame"),_5f=objj_msgSend(_windowView,"preferredEdge"),_60;
switch(_5f){
case CPMaxYEdge:
case CPMinYEdge:
_60=50+((objj_msgSend(_windowView,"arrowOffsetX")*100)/_5e.size.width);
_5d=_60+"% "+(_5f===CPMaxYEdge?"0%":"100%");
break;
case CPMinXEdge:
case CPMaxXEdge:
posY=50+((objj_msgSend(_windowView,"arrowOffsetY")*100)/_5e.size.height);
_5d=(_5f===CPMaxXEdge?"0% ":"100% ")+posY+"%";
break;
}
objj_msgSend(_5a,"setCSS3Property:value:","Transform","scale(0)");
objj_msgSend(_5a,"setCSS3Property:value:","TransformOrigin",_5d);
objj_msgSend(_5a,"setCSS3Property:value:","Transition","opacity 0 linear");
window.setTimeout(function(){
_DOMElement.style.opacity=1;
_DOMElement.style.height=_5e.size.height+"px";
_DOMElement.style.width=_5e.size.width+"px";
objj_msgSend(_5a,"setCSS3Property:value:","Transform","scale(1.1)");
objj_msgSend(_5a,"setCSS3Property:value:","Transition","-webkit-transform 200ms ease-in");
var _61=function(){
_DOMElement.removeEventListener("webkitTransitionEnd",_61,YES);
objj_msgSend(_5a,"setCSS3Property:value:","Transform","scale(1)");
objj_msgSend(_5a,"setCSS3Property:value:","Transition","-webkit-transform 50ms linear");
};
_DOMElement.addEventListener("webkitTransitionEnd",_61,YES);
},0);
}else{
objj_msgSend(_5a,"setCSS3Property:value:","Transition","");
_DOMElement.style.opacity=1;
}
}
_shouldPerformAnimation=NO;
_isClosing=NO;
}
}),new objj_method(sel_getUid("close"),function(_62,_63){
with(_62){
if(!objj_msgSend(_62,"isVisible")){
return;
}
_isClosing=YES;
if(_animates&&_browserAnimates){
objj_msgSend(_62,"setCSS3Property:value:","Transition","opacity 250ms linear");
_DOMElement.style.opacity=0;
var _64=function(){
_DOMElement.removeEventListener("webkitTransitionEnd",_64,YES);
objj_msgSend(_62,"_close");
};
_DOMElement.addEventListener("webkitTransitionEnd",_64,YES);
}else{
objj_msgSend(_62,"_close");
}
}
}),new objj_method(sel_getUid("_close"),function(_65,_66){
with(_65){
objj_msgSendSuper({receiver:_65,super_class:objj_getClass("_CPAttachedWindow").super_class},"close");
objj_msgSend(_targetView,"removeObserver:forKeyPath:",_65,"frame");
_shouldPerformAnimation=YES;
_isClosing=NO;
if(_implementedDelegateMethods&_2){
objj_msgSend(_delegate,"attachedWindowDidClose:",_65);
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(_67,_68,_69){
with(_67){
return _CPAttachedWindowView;
}
}),new objj_method(sel_getUid("attachedWindowWithSize:forView:"),function(_6a,_6b,_6c,_6d){
with(_6a){
return objj_msgSend(_CPAttachedWindow,"attachedWindowWithSize:forView:styleMask:",_6c,_6d,0);
}
}),new objj_method(sel_getUid("attachedWindowWithSize:forView:styleMask:"),function(_6e,_6f,_70,_71,_72){
with(_6e){
var _73=objj_msgSend(objj_msgSend(_CPAttachedWindow,"alloc"),"initWithContentRect:styleMask:",{origin:{x:0,y:0},size:{width:_70.width,height:_70.height}},_72);
objj_msgSend(_73,"attachToView:",_71);
return _73;
}
})]);
