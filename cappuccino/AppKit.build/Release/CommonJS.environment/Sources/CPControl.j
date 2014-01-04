@STATIC;1.0;i;27;../Foundation/CPFormatter.ji;8;CPFont.ji;10;CPShadow.ji;8;CPView.ji;19;CPKeyValueBinding.jt;21289;
objj_executeFile("../Foundation/CPFormatter.j",YES);
objj_executeFile("CPFont.j",YES);
objj_executeFile("CPShadow.j",YES);
objj_executeFile("CPView.j",YES);
objj_executeFile("CPKeyValueBinding.j",YES);
CPLeftTextAlignment=0;
CPRightTextAlignment=1;
CPCenterTextAlignment=2;
CPJustifiedTextAlignment=3;
CPNaturalTextAlignment=4;
CPRegularControlSize=0;
CPSmallControlSize=1;
CPMiniControlSize=2;
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTopVerticalTextAlignment=1;
CPCenterVerticalTextAlignment=2;
CPBottomVerticalTextAlignment=3;
CPScaleProportionally=0;
CPScaleToFit=1;
CPScaleNone=2;
CPImageScaleProportionallyDown=0;
CPImageScaleAxesIndependently=1;
CPImageScaleNone=2;
CPImageScaleProportionallyUpOrDown=3;
CPNoImage=0;
CPImageOnly=1;
CPImageLeft=2;
CPImageRight=3;
CPImageBelow=4;
CPImageAbove=5;
CPImageOverlaps=6;
CPOnState=1;
CPOffState=0;
CPMixedState=-1;
CPControlNormalBackgroundColor="CPControlNormalBackgroundColor";
CPControlSelectedBackgroundColor="CPControlSelectedBackgroundColor";
CPControlHighlightedBackgroundColor="CPControlHighlightedBackgroundColor";
CPControlDisabledBackgroundColor="CPControlDisabledBackgroundColor";
CPControlTextDidBeginEditingNotification="CPControlTextDidBeginEditingNotification";
CPControlTextDidChangeNotification="CPControlTextDidChangeNotification";
CPControlTextDidEndEditingNotification="CPControlTextDidEndEditingNotification";
var _1=objj_msgSend(CPColor,"blackColor");
var _2=objj_allocateClassPair(CPView,"CPControl"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_value"),new objj_ivar("_formatter"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_sendActionOn"),new objj_ivar("_sendsActionOnEndEditing"),new objj_ivar("_continuousTracking"),new objj_ivar("_trackingWasWithinFrame"),new objj_ivar("_trackingMouseDownFlags"),new objj_ivar("_previousTrackingLocation")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("formatter"),function(_4,_5){
with(_4){
return _formatter;
}
}),new objj_method(sel_getUid("setFormatter:"),function(_6,_7,_8){
with(_6){
_formatter=_8;
}
}),new objj_method(sel_getUid("sendsActionOnEndEditing"),function(_9,_a){
with(_9){
return _sendsActionOnEndEditing;
}
}),new objj_method(sel_getUid("setSendsActionOnEndEditing:"),function(_b,_c,_d){
with(_b){
_sendsActionOnEndEditing=_d;
}
}),new objj_method(sel_getUid("_continuouslyReverseSetBinding"),function(_e,_f){
with(_e){
var _10=objj_msgSend(objj_msgSend(_e,"class"),"_binderClassForBinding:",CPValueBinding),_11=objj_msgSend(_10,"getBinding:forObject:",CPValueBinding,_e);
if(objj_msgSend(_11,"continuouslyUpdatesValue")){
objj_msgSend(_11,"reverseSetValueFor:","objectValue");
}
}
}),new objj_method(sel_getUid("_reverseSetBinding"),function(_12,_13){
with(_12){
var _14=objj_msgSend(objj_msgSend(_12,"class"),"_binderClassForBinding:",CPValueBinding),_15=objj_msgSend(_14,"getBinding:forObject:",CPValueBinding,_12);
objj_msgSend(_15,"reverseSetValueFor:","objectValue");
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_16,_17,_18){
with(_16){
_16=objj_msgSendSuper({receiver:_16,super_class:objj_getClass("CPControl").super_class},"initWithFrame:",_18);
if(_16){
_sendActionOn=CPLeftMouseUpMask;
_trackingMouseDownFlags=0;
}
return _16;
}
}),new objj_method(sel_getUid("setAction:"),function(_19,_1a,_1b){
with(_19){
_action=_1b;
}
}),new objj_method(sel_getUid("action"),function(_1c,_1d){
with(_1c){
return _action;
}
}),new objj_method(sel_getUid("setTarget:"),function(_1e,_1f,_20){
with(_1e){
_target=_20;
}
}),new objj_method(sel_getUid("target"),function(_21,_22){
with(_21){
return _target;
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_23,_24,_25,_26){
with(_23){
objj_msgSend(_23,"_reverseSetBinding");
return objj_msgSend(CPApp,"sendAction:to:from:",_25,_26,_23);
}
}),new objj_method(sel_getUid("sendActionOn:"),function(_27,_28,_29){
with(_27){
var _2a=_sendActionOn;
_sendActionOn=_29;
return _2a;
}
}),new objj_method(sel_getUid("isContinuous"),function(_2b,_2c){
with(_2b){
return (_sendActionOn&CPPeriodicMask)!==0;
}
}),new objj_method(sel_getUid("setContinuous:"),function(_2d,_2e,_2f){
with(_2d){
if(_2f){
_sendActionOn|=CPPeriodicMask;
}else{
_sendActionOn&=~CPPeriodicMask;
}
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(_30,_31){
with(_30){
return NO;
}
}),new objj_method(sel_getUid("trackMouse:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_34,"type"),_36=objj_msgSend(_32,"convertPoint:fromView:",objj_msgSend(_34,"locationInWindow"),nil),_37=objj_msgSend(_32,"tracksMouseOutsideOfFrame")||CGRectContainsPoint(objj_msgSend(_32,"bounds"),_36);
if(_35===CPLeftMouseUp){
objj_msgSend(_32,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_36,YES);
_trackingMouseDownFlags=0;
if(_37){
objj_msgSend(_32,"setThemeState:",CPThemeStateHovered);
}
}else{
objj_msgSend(_32,"unsetThemeState:",CPThemeStateHovered);
if(_35===CPLeftMouseDown){
_trackingMouseDownFlags=objj_msgSend(_34,"modifierFlags");
_continuousTracking=objj_msgSend(_32,"startTrackingAt:",_36);
}else{
if(_35===CPLeftMouseDragged){
if(_37){
if(!_trackingWasWithinFrame){
_continuousTracking=objj_msgSend(_32,"startTrackingAt:",_36);
}else{
if(_continuousTracking){
_continuousTracking=objj_msgSend(_32,"continueTracking:at:",_previousTrackingLocation,_36);
}
}
}else{
objj_msgSend(_32,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_36,NO);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_32,sel_getUid("trackMouse:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
if((_sendActionOn&(1<<_35))&&_37){
objj_msgSend(_32,"sendAction:to:",_action,_target);
}
_trackingWasWithinFrame=_37;
_previousTrackingLocation=_36;
}
}),new objj_method(sel_getUid("setState:"),function(_38,_39,_3a){
with(_38){
}
}),new objj_method(sel_getUid("nextState"),function(_3b,_3c){
with(_3b){
return 0;
}
}),new objj_method(sel_getUid("performClick:"),function(_3d,_3e,_3f){
with(_3d){
if(!objj_msgSend(_3d,"isEnabled")){
return;
}
objj_msgSend(_3d,"highlight:",YES);
objj_msgSend(_3d,"setState:",objj_msgSend(_3d,"nextState"));
try{
objj_msgSend(_3d,"sendAction:to:",objj_msgSend(_3d,"action"),objj_msgSend(_3d,"target"));
}
catch(e){
throw e;
}
finally{
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.1,_3d,sel_getUid("unhighlightButtonTimerDidFinish:"),nil,NO);
}
}
}),new objj_method(sel_getUid("unhighlightButtonTimerDidFinish:"),function(_40,_41,_42){
with(_40){
objj_msgSend(_40,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDownFlags"),function(_43,_44){
with(_43){
return _trackingMouseDownFlags;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_45,_46,_47){
with(_45){
objj_msgSend(_45,"highlight:",YES);
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(_48,_49,_4a,_4b){
with(_48){
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_4c,_4d,_4e,_4f,_50){
with(_4c){
if(_50){
objj_msgSend(_4c,"highlight:",NO);
}else{
objj_msgSend(_4c,"highlight:",YES);
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_51,_52,_53){
with(_51){
if(!objj_msgSend(_51,"isEnabled")){
return;
}
objj_msgSend(_51,"trackMouse:",_53);
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_54,_55,_56){
with(_54){
if(!objj_msgSend(_54,"isEnabled")){
return;
}
objj_msgSend(_54,"setThemeState:",CPThemeStateHovered);
}
}),new objj_method(sel_getUid("mouseExited:"),function(_57,_58,_59){
with(_57){
var _5a=objj_msgSend(_57,"convertPoint:fromView:",objj_msgSend(_59,"locationInWindow"),nil),_5b=objj_msgSend(_57,"tracksMouseOutsideOfFrame")||CGRectContainsPoint(objj_msgSend(_57,"bounds"),_5a);
if(!_5b){
objj_msgSend(_57,"unsetThemeState:",CPThemeStateHovered);
}
}
}),new objj_method(sel_getUid("objectValue"),function(_5c,_5d){
with(_5c){
return _value;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_5e,_5f,_60){
with(_5e){
_value=_60;
objj_msgSend(_5e,"setNeedsLayout");
objj_msgSend(_5e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("floatValue"),function(_61,_62){
with(_61){
var _63=parseFloat(_value,10);
return isNaN(_63)?0:_63;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_64,_65,_66){
with(_64){
objj_msgSend(_64,"setObjectValue:",_66);
}
}),new objj_method(sel_getUid("doubleValue"),function(_67,_68){
with(_67){
var _69=parseFloat(_value,10);
return isNaN(_69)?0:_69;
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_6a,_6b,_6c){
with(_6a){
objj_msgSend(_6a,"setObjectValue:",_6c);
}
}),new objj_method(sel_getUid("intValue"),function(_6d,_6e){
with(_6d){
var _6f=parseInt(_value,10);
return isNaN(_6f)?0:_6f;
}
}),new objj_method(sel_getUid("setIntValue:"),function(_70,_71,_72){
with(_70){
objj_msgSend(_70,"setObjectValue:",_72);
}
}),new objj_method(sel_getUid("integerValue"),function(_73,_74){
with(_73){
var _75=parseInt(_value,10);
return isNaN(_75)?0:_75;
}
}),new objj_method(sel_getUid("setIntegerValue:"),function(_76,_77,_78){
with(_76){
objj_msgSend(_76,"setObjectValue:",_78);
}
}),new objj_method(sel_getUid("stringValue"),function(_79,_7a){
with(_79){
if(_formatter&&_value!==undefined){
var _7b=objj_msgSend(_79,"hasThemeState:",CPThemeStateEditing)?objj_msgSend(_formatter,"editingStringForObjectValue:",_value):objj_msgSend(_formatter,"stringForObjectValue:",_value);
if(_7b!==nil&&_7b!==undefined){
return _7b;
}
}
return (_value===undefined||_value===nil)?"":String(_value);
}
}),new objj_method(sel_getUid("setStringValue:"),function(_7c,_7d,_7e){
with(_7c){
if(_7e===nil||_7e===undefined){
CPLog.warn("nil or undefined sent to CPControl -setStringValue");
return;
}
var _7f;
if(_formatter){
_7f=nil;
if(objj_msgSend(_formatter,"getObjectValue:forString:errorDescription:",function(_80){
if(arguments.length){
return _7f=_80;
}
return _7f;
},_7e,nil)===NO){
if(!_7e||objj_msgSend(_formatter,"getObjectValue:forString:errorDescription:",function(_81){
if(arguments.length){
return _7f=_81;
}
return _7f;
},"",nil)===NO){
_7f=undefined;
}
}
}else{
_7f=_7e;
}
objj_msgSend(_7c,"setObjectValue:",_7f);
}
}),new objj_method(sel_getUid("takeDoubleValueFrom:"),function(_82,_83,_84){
with(_82){
if(objj_msgSend(_84,"respondsToSelector:",sel_getUid("doubleValue"))){
objj_msgSend(_82,"setDoubleValue:",objj_msgSend(_84,"doubleValue"));
}
}
}),new objj_method(sel_getUid("takeFloatValueFrom:"),function(_85,_86,_87){
with(_85){
if(objj_msgSend(_87,"respondsToSelector:",sel_getUid("floatValue"))){
objj_msgSend(_85,"setFloatValue:",objj_msgSend(_87,"floatValue"));
}
}
}),new objj_method(sel_getUid("takeIntegerValueFrom:"),function(_88,_89,_8a){
with(_88){
if(objj_msgSend(_8a,"respondsToSelector:",sel_getUid("integerValue"))){
objj_msgSend(_88,"setIntegerValue:",objj_msgSend(_8a,"integerValue"));
}
}
}),new objj_method(sel_getUid("takeIntValueFrom:"),function(_8b,_8c,_8d){
with(_8b){
if(objj_msgSend(_8d,"respondsToSelector:",sel_getUid("intValue"))){
objj_msgSend(_8b,"setIntValue:",objj_msgSend(_8d,"intValue"));
}
}
}),new objj_method(sel_getUid("takeObjectValueFrom:"),function(_8e,_8f,_90){
with(_8e){
if(objj_msgSend(_90,"respondsToSelector:",sel_getUid("objectValue"))){
objj_msgSend(_8e,"setObjectValue:",objj_msgSend(_90,"objectValue"));
}
}
}),new objj_method(sel_getUid("takeStringValueFrom:"),function(_91,_92,_93){
with(_91){
if(objj_msgSend(_93,"respondsToSelector:",sel_getUid("stringValue"))){
objj_msgSend(_91,"setStringValue:",objj_msgSend(_93,"stringValue"));
}
}
}),new objj_method(sel_getUid("textDidBeginEditing:"),function(_94,_95,_96){
with(_94){
if(objj_msgSend(_96,"object")!=_94){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidBeginEditingNotification,_94,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_96,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidChange:"),function(_97,_98,_99){
with(_97){
if(objj_msgSend(_99,"object")!=_97){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidChangeNotification,_97,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_99,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidEndEditing:"),function(_9a,_9b,_9c){
with(_9a){
if(objj_msgSend(_9c,"object")!=_9a){
return;
}
objj_msgSend(_9a,"_reverseSetBinding");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidEndEditingNotification,_9a,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_9c,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("setAlignment:"),function(_9d,_9e,_9f){
with(_9d){
objj_msgSend(_9d,"setValue:forThemeAttribute:",_9f,"alignment");
}
}),new objj_method(sel_getUid("alignment"),function(_a0,_a1){
with(_a0){
return objj_msgSend(_a0,"valueForThemeAttribute:","alignment");
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_a2,_a3,_a4){
with(_a2){
objj_msgSend(_a2,"setValue:forThemeAttribute:",_a4,"vertical-alignment");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_a5,_a6){
with(_a5){
return objj_msgSend(_a5,"valueForThemeAttribute:","vertical-alignment");
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_a7,_a8,_a9){
with(_a7){
objj_msgSend(_a7,"setValue:forThemeAttribute:",_a9,"line-break-mode");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_aa,_ab){
with(_aa){
return objj_msgSend(_aa,"valueForThemeAttribute:","line-break-mode");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_ac,_ad,_ae){
with(_ac){
objj_msgSend(_ac,"setValue:forThemeAttribute:",_ae,"text-color");
}
}),new objj_method(sel_getUid("textColor"),function(_af,_b0){
with(_af){
return objj_msgSend(_af,"valueForThemeAttribute:","text-color");
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_b1,_b2,_b3){
with(_b1){
objj_msgSend(_b1,"setValue:forThemeAttribute:",_b3,"text-shadow-color");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_b4,_b5){
with(_b4){
return objj_msgSend(_b4,"valueForThemeAttribute:","text-shadow-color");
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_b6,_b7,_b8){
with(_b6){
objj_msgSend(_b6,"setValue:forThemeAttribute:",_b8,"text-shadow-offset");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_b9,_ba){
with(_b9){
return objj_msgSend(_b9,"valueForThemeAttribute:","text-shadow-offset");
}
}),new objj_method(sel_getUid("setFont:"),function(_bb,_bc,_bd){
with(_bb){
objj_msgSend(_bb,"setValue:forThemeAttribute:",_bd,"font");
}
}),new objj_method(sel_getUid("font"),function(_be,_bf){
with(_be){
return objj_msgSend(_be,"valueForThemeAttribute:","font");
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_c0,_c1,_c2){
with(_c0){
objj_msgSend(_c0,"setValue:forThemeAttribute:",_c2,"image-position");
}
}),new objj_method(sel_getUid("imagePosition"),function(_c3,_c4){
with(_c3){
return objj_msgSend(_c3,"valueForThemeAttribute:","image-position");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_c5,_c6,_c7){
with(_c5){
objj_msgSend(_c5,"setValue:forThemeAttribute:",_c7,"image-scaling");
}
}),new objj_method(sel_getUid("imageScaling"),function(_c8,_c9){
with(_c8){
return objj_msgSend(_c8,"valueForThemeAttribute:","image-scaling");
}
}),new objj_method(sel_getUid("setEnabled:"),function(_ca,_cb,_cc){
with(_ca){
if(_cc){
objj_msgSend(_ca,"unsetThemeState:",CPThemeStateDisabled);
}else{
objj_msgSend(_ca,"setThemeState:",CPThemeStateDisabled);
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_cd,_ce){
with(_cd){
return !objj_msgSend(_cd,"hasThemeState:",CPThemeStateDisabled);
}
}),new objj_method(sel_getUid("highlight:"),function(_cf,_d0,_d1){
with(_cf){
objj_msgSend(_cf,"setHighlighted:",_d1);
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_d2,_d3,_d4){
with(_d2){
if(_d4){
objj_msgSend(_d2,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_d2,"unsetThemeState:",CPThemeStateHighlighted);
}
}
}),new objj_method(sel_getUid("isHighlighted"),function(_d5,_d6){
with(_d5){
return objj_msgSend(_d5,"hasThemeState:",CPThemeStateHighlighted);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeAttributes"),function(_d7,_d8){
with(_d7){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPLeftTextAlignment,CPTopVerticalTextAlignment,CPLineBreakByClipping,objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPFont,"systemFontOfSize:",CPFontCurrentSystemSize),objj_msgSend(CPNull,"null"),{width:0,height:0},CPImageLeft,CPScaleToFit,{width:0,height:0},{width:-1,height:-1}],["alignment","vertical-alignment","line-break-mode","text-color","font","text-shadow-color","text-shadow-offset","image-position","image-scaling","min-size","max-size"]);
}
}),new objj_method(sel_getUid("initialize"),function(_d9,_da){
with(_d9){
if(_d9!==objj_msgSend(CPControl,"class")){
return;
}
objj_msgSend(_d9,"exposeBinding:","value");
objj_msgSend(_d9,"exposeBinding:","objectValue");
objj_msgSend(_d9,"exposeBinding:","stringValue");
objj_msgSend(_d9,"exposeBinding:","integerValue");
objj_msgSend(_d9,"exposeBinding:","intValue");
objj_msgSend(_d9,"exposeBinding:","doubleValue");
objj_msgSend(_d9,"exposeBinding:","floatValue");
objj_msgSend(_d9,"exposeBinding:","enabled");
}
}),new objj_method(sel_getUid("_binderClassForBinding:"),function(_db,_dc,_dd){
with(_db){
if(_dd===CPValueBinding){
return objj_msgSend(_CPValueBinder,"class");
}
return objj_msgSendSuper({receiver:_db,super_class:objj_getMetaClass("CPControl").super_class},"_binderClassForBinding:",_dd);
}
})]);
var _de="CPControlValueKey",_df="CPControlControlStateKey",_e0="CPControlIsEnabledKey",_e1="CPControlTargetKey",_e2="CPControlActionKey",_e3="CPControlSendActionOnKey",_e4="CPControlFormatterKey",_e5="CPControlSendsActionOnEndEditingKey",_e6="CPImageViewImageKey";
var _2=objj_getClass("CPControl");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPControl\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_e7,_e8,_e9){
with(_e7){
_e7=objj_msgSendSuper({receiver:_e7,super_class:objj_getClass("CPControl").super_class},"initWithCoder:",_e9);
if(_e7){
objj_msgSend(_e7,"setObjectValue:",objj_msgSend(_e9,"decodeObjectForKey:",_de));
objj_msgSend(_e7,"setTarget:",objj_msgSend(_e9,"decodeObjectForKey:",_e1));
objj_msgSend(_e7,"setAction:",objj_msgSend(_e9,"decodeObjectForKey:",_e2));
objj_msgSend(_e7,"sendActionOn:",objj_msgSend(_e9,"decodeIntForKey:",_e3));
objj_msgSend(_e7,"setSendsActionOnEndEditing:",objj_msgSend(_e9,"decodeBoolForKey:",_e5));
objj_msgSend(_e7,"setFormatter:",objj_msgSend(_e9,"decodeObjectForKey:",_e4));
}
return _e7;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_ea,_eb,_ec){
with(_ea){
objj_msgSendSuper({receiver:_ea,super_class:objj_getClass("CPControl").super_class},"encodeWithCoder:",_ec);
if(_sendsActionOnEndEditing){
objj_msgSend(_ec,"encodeBool:forKey:",_sendsActionOnEndEditing,_e5);
}
var _ed=objj_msgSend(_ea,"objectValue");
if(_ed!==nil){
objj_msgSend(_ec,"encodeObject:forKey:",_ed,_de);
}
if(_target!==nil){
objj_msgSend(_ec,"encodeConditionalObject:forKey:",_target,_e1);
}
if(_action!==nil){
objj_msgSend(_ec,"encodeObject:forKey:",_action,_e2);
}
objj_msgSend(_ec,"encodeInt:forKey:",_sendActionOn,_e3);
if(_formatter!==nil){
objj_msgSend(_ec,"encodeObject:forKey:",_formatter,_e4);
}
}
})]);
var _ee=[],_ef={},_f0={};
_ee[CPRegularControlSize]="Regular";
_ee[CPSmallControlSize]="Small";
_ee[CPMiniControlSize]="Mini";
_CPControlIdentifierForControlSize=function(_f1){
return _ee[_f1];
};
_CPControlColorWithPatternImage=function(_f2,_f3){
var _f4=1,_f5=arguments.length,_f6="";
for(;_f4<_f5;++_f4){
_f6+=arguments[_f4];
}
var _f7=_ef[_f6];
if(!_f7){
var _f8=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class"));
_f7=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f8,"pathForResource:",_f3+"/"+_f6+".png"),_f2[_f6]));
_ef[_f6]=_f7;
}
return _f7;
};
_CPControlThreePartImagePattern=function(_f9,_fa,_fb){
var _fc=2,_fd=arguments.length,_fe="";
for(;_fc<_fd;++_fc){
_fe+=arguments[_fc];
}
var _ff=_f0[_fe];
if(!_ff){
var _100=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class")),path=_fb+"/"+_fe;
_fa=_fa[_fe];
_ff=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_100,"pathForResource:",path+"0.png"),_fa[0]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_100,"pathForResource:",path+"1.png"),_fa[1]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_100,"pathForResource:",path+"2.png"),_fa[2])],_f9));
_f0[_fe]=_ff;
}
return _ff;
};
