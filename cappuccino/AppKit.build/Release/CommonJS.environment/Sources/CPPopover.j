@STATIC;1.0;I;21;Foundation/CPObject.ji;10;CPButton.ji;9;CPColor.ji;9;CPImage.ji;13;CPImageView.ji;13;CPResponder.ji;8;CPView.ji;19;_CPAttachedWindow.jt;8691;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPButton.j",YES);
objj_executeFile("CPColor.j",YES);
objj_executeFile("CPImage.j",YES);
objj_executeFile("CPImageView.j",YES);
objj_executeFile("CPResponder.j",YES);
objj_executeFile("CPView.j",YES);
objj_executeFile("_CPAttachedWindow.j",YES);
CPPopoverBehaviorApplicationDefined=0;
CPPopoverBehaviorTransient=1;
CPPopoverBehaviorSemitransient=2;
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4;
var _6=objj_allocateClassPair(CPResponder,"CPPopover"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_contentViewController"),new objj_ivar("_delegate"),new objj_ivar("_animates"),new objj_ivar("_appearance"),new objj_ivar("_behavior"),new objj_ivar("_attachedWindow"),new objj_ivar("_implementedDelegateMethods")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("contentViewController"),function(_8,_9){
with(_8){
return _contentViewController;
}
}),new objj_method(sel_getUid("setContentViewController:"),function(_a,_b,_c){
with(_a){
_contentViewController=_c;
}
}),new objj_method(sel_getUid("delegate"),function(_d,_e){
with(_d){
return _delegate;
}
}),new objj_method(sel_getUid("_setDelegate:"),function(_f,_10,_11){
with(_f){
_delegate=_11;
}
}),new objj_method(sel_getUid("animates"),function(_12,_13){
with(_12){
return _animates;
}
}),new objj_method(sel_getUid("setAnimates:"),function(_14,_15,_16){
with(_14){
_animates=_16;
}
}),new objj_method(sel_getUid("appearance"),function(_17,_18){
with(_17){
return _appearance;
}
}),new objj_method(sel_getUid("setAppearance:"),function(_19,_1a,_1b){
with(_19){
_appearance=_1b;
}
}),new objj_method(sel_getUid("behavior"),function(_1c,_1d){
with(_1c){
return _behavior;
}
}),new objj_method(sel_getUid("_setBehavior:"),function(_1e,_1f,_20){
with(_1e){
_behavior=_20;
}
}),new objj_method(sel_getUid("init"),function(_21,_22){
with(_21){
if(_21=objj_msgSendSuper({receiver:_21,super_class:objj_getClass("CPPopover").super_class},"init")){
_animates=YES;
_appearance=CPPopoverAppearanceMinimal;
_behavior=CPPopoverBehaviorApplicationDefined;
}
return _21;
}
}),new objj_method(sel_getUid("positioningRect"),function(_23,_24){
with(_23){
if(!objj_msgSend(_attachedWindow,"isVisible")){
return CGRectMakeZero();
}
return objj_msgSend(_attachedWindow,"frame");
}
}),new objj_method(sel_getUid("setPositioningRect:"),function(_25,_26,_27){
with(_25){
if(!objj_msgSend(_attachedWindow,"isVisible")){
return;
}
objj_msgSend(_attachedWindow,"setFrame:",_27);
}
}),new objj_method(sel_getUid("contentSize"),function(_28,_29){
with(_28){
if(!objj_msgSend(_attachedWindow,"isVisible")){
return CGRectMakeZero();
}
return objj_msgSend(objj_msgSend(_contentViewController,"view"),"frameSize");
}
}),new objj_method(sel_getUid("setContentSize:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(objj_msgSend(_contentViewController,"view"),"setFrameSize:",_2c);
}
}),new objj_method(sel_getUid("isShown"),function(_2d,_2e){
with(_2d){
return objj_msgSend(_attachedWindow,"isVisible");
}
}),new objj_method(sel_getUid("setBehavior:"),function(_2f,_30,_31){
with(_2f){
if(_behavior==_31){
return;
}
_behavior=_31;
objj_msgSend(_attachedWindow,"setStyleMask:",objj_msgSend(_2f,"styleMaskForBehavior"));
}
}),new objj_method(sel_getUid("setDelegate:"),function(_32,_33,_34){
with(_32){
if(_delegate===_34){
return;
}
_delegate=_34;
_implementedDelegateMethods=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("popoverWillShow:"))){
_implementedDelegateMethods|=_1;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("popoverDidShow:"))){
_implementedDelegateMethods|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("popoverShouldClose:"))){
_implementedDelegateMethods|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("popoverWillClose:"))){
_implementedDelegateMethods|=_4;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("popoverDidClose:"))){
_implementedDelegateMethods|=_5;
}
}
}),new objj_method(sel_getUid("showRelativeToRect:ofView:preferredEdge:"),function(_35,_36,_37,_38,_39){
with(_35){
if(!_38){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"positionView must not be nil");
}
if(!_contentViewController){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"contentViewController must not be nil");
}
if(objj_msgSend(_attachedWindow,"isClosing")){
return;
}
if(_implementedDelegateMethods&_1){
objj_msgSend(_delegate,"popoverWillShow:",_35);
}
if(!_attachedWindow){
_attachedWindow=objj_msgSend(objj_msgSend(_CPAttachedWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),objj_msgSend(_35,"styleMaskForBehavior"));
var _3a=objj_msgSend(_38,"window");
if(!objj_msgSend(_3a,"isKindOfClass:",_CPAttachedWindow)){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_35,sel_getUid("parentWindowWillClose:"),CPWindowWillCloseNotification,_3a);
}
}
objj_msgSend(_attachedWindow,"setAppearance:",_appearance);
objj_msgSend(_attachedWindow,"setAnimates:",_animates);
objj_msgSend(_attachedWindow,"setDelegate:",_35);
objj_msgSend(_attachedWindow,"setMovableByWindowBackground:",NO);
objj_msgSend(_attachedWindow,"setFrame:",objj_msgSend(_attachedWindow,"frameRectForContentRect:",objj_msgSend(objj_msgSend(_contentViewController,"view"),"frame")));
objj_msgSend(_attachedWindow,"setContentView:",objj_msgSend(_contentViewController,"view"));
objj_msgSend(_attachedWindow,"positionRelativeToRect:ofView:preferredEdge:",_37,_38,_39);
if(_implementedDelegateMethods&_2){
objj_msgSend(_delegate,"popoverDidShow:",_35);
}
}
}),new objj_method(sel_getUid("styleMaskForBehavior"),function(_3b,_3c){
with(_3b){
return (_behavior==CPPopoverBehaviorTransient)?CPClosableOnBlurWindowMask:0;
}
}),new objj_method(sel_getUid("close"),function(_3d,_3e){
with(_3d){
objj_msgSend(_3d,"_close");
}
}),new objj_method(sel_getUid("_close"),function(_3f,_40){
with(_3f){
if(objj_msgSend(_attachedWindow,"isClosing")||!objj_msgSend(_3f,"isShown")){
return;
}
if(_implementedDelegateMethods&_4){
objj_msgSend(_delegate,"popoverWillClose:",_3f);
}
objj_msgSend(_attachedWindow,"close");
}
}),new objj_method(sel_getUid("performClose:"),function(_41,_42,_43){
with(_41){
if(objj_msgSend(_attachedWindow,"isClosing")){
return;
}
if(_implementedDelegateMethods&_3){
if(!objj_msgSend(_delegate,"popoverShouldClose:",_41)){
return;
}
}
objj_msgSend(_41,"_close");
}
}),new objj_method(sel_getUid("attachedWindowShouldClose:"),function(_44,_45,_46){
with(_44){
objj_msgSend(_44,"performClose:",_44);
return NO;
}
}),new objj_method(sel_getUid("attachedWindowDidClose:"),function(_47,_48,_49){
with(_47){
if(_implementedDelegateMethods&_5){
objj_msgSend(_delegate,"popoverDidClose:",_47);
}
}
}),new objj_method(sel_getUid("parentWindowWillClose:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSend(_attachedWindow,"orderOut:",nil);
objj_msgSend(_4a,"performClose:",nil);
}
})]);
var _6=objj_getClass("CPPopover");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPPopover\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("setBehaviour:"),function(_4d,_4e,_4f){
with(_4d){
_CPReportLenientDeprecation(_4d,_4e,sel_getUid("setBehavior:"));
objj_msgSend(_4d,"setBehavior:",_4f);
}
})]);
var _50="CPPopoverNeedsNewAttachedWindowKey",_51="CPPopoverAppearanceKey",_52="CPPopoverAnimatesKey",_53="CPPopoverContentViewControllerKey",_54="CPPopoverDelegateKey",_55="CPPopoverBehaviorKey";
var _6=objj_getClass("CPPopover");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPPopover\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_56,_57,_58){
with(_56){
_56=objj_msgSendSuper({receiver:_56,super_class:objj_getClass("CPPopover").super_class},"initWithCoder:",_58);
if(_56){
_appearance=objj_msgSend(_58,"decodeIntForKey:",_51);
_animates=objj_msgSend(_58,"decodeBoolForKey:",_52);
_contentViewController=objj_msgSend(_58,"decodeObjectForKey:",_53);
objj_msgSend(_56,"setDelegate:",objj_msgSend(_58,"decodeObjectForKey:",_54));
objj_msgSend(_56,"setBehavior:",objj_msgSend(_58,"decodeIntForKey:",_55));
}
return _56;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_59,_5a,_5b){
with(_59){
objj_msgSendSuper({receiver:_59,super_class:objj_getClass("CPPopover").super_class},"encodeWithCoder:",_5b);
objj_msgSend(_5b,"encodeInt:forKey:",_appearance,_51);
objj_msgSend(_5b,"encodeBool:forKey:",_animates,_52);
objj_msgSend(_5b,"encodeObject:forKey:",_contentViewController,_53);
objj_msgSend(_5b,"encodeObject:forKey:",_delegate,_54);
objj_msgSend(_5b,"encodeInt:forKey:",_behavior,_55);
}
})]);
