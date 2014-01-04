@STATIC;1.0;i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.ji;21;_CPImageAndTextView.jt;38464;
objj_executeFile("CPControl.j",YES);
objj_executeFile("CPStringDrawing.j",YES);
objj_executeFile("CPCompatibility.j",YES);
objj_executeFile("_CPImageAndTextView.j",YES);
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
CPTextFieldDidFocusNotification="CPTextFieldDidFocusNotification";
CPTextFieldDidBlurNotification="CPTextFieldDidBlurNotification";
var _1=nil,_2=nil,_3=nil,_4=nil,_5=nil,_6=NO,_7=NO,_8=NO,_9=nil,_a=nil,_b=nil,_c=nil;
var _d="•";
var _e=objj_getClass("CPString");
if(!_e){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _f=_e.isa;
class_addMethods(_e,[new objj_method(sel_getUid("string"),function(_10,_11){
with(_10){
return _10;
}
})]);
CPTextFieldStateRounded=CPThemeState("rounded");
CPTextFieldStatePlaceholder=CPThemeState("placeholder");
var _e=objj_allocateClassPair(CPControl,"CPTextField"),_f=_e.isa;
class_addIvars(_e,[new objj_ivar("_isEditing"),new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_willBecomeFirstResponderByClick"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_stringValue"),new objj_ivar("_delegate"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_e);
class_addMethods(_e,[new objj_method(sel_getUid("_inputElement"),function(_12,_13){
with(_12){
if(!_1){
_1=document.createElement("input");
_1.style.position="absolute";
_1.style.border="0px";
_1.style.padding="0px";
_1.style.margin="0px";
_1.style.whiteSpace="pre";
_1.style.background="transparent";
_1.style.outline="none";
_b=function(_14){
if(_4&&_4._DOMElement!=_1.parentNode){
return;
}
if(!_6){
objj_msgSend(objj_msgSend(_4,"window"),"makeFirstResponder:",nil);
return;
}
CPTextFieldHandleBlur(_14,_1);
_7=YES;
return true;
};
CPTextFieldHandleBlur=function(_15){
_4=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
if(CPFeatureIsCompatible(CPInputOnInputEventFeature)){
_c=function(_16){
if(!_4){
return;
}
var _17=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyUp,{x:0,y:0},0,objj_msgSend(CPEvent,"currentTimestamp"),objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"windowNumber"),nil,nil,nil,NO,nil);
objj_msgSend(_4,"keyUp:",_17);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
_1.oninput=_c;
}
_1.onblur=_b;
_3=_1;
}
if(CPFeatureIsCompatible(CPInputTypeCanBeChangedFeature)){
if(objj_msgSend(_12,"isSecure")){
_1.type="password";
}else{
_1.type="text";
}
return _1;
}
if(objj_msgSend(_12,"isSecure")){
if(!_2){
_2=document.createElement("input");
_2.style.position="absolute";
_2.style.border="0px";
_2.style.padding="0px";
_2.style.margin="0px";
_2.style.whiteSpace="pre";
_2.style.background="transparent";
_2.style.outline="none";
_2.type="password";
_2.onblur=_b;
}
_1=_2;
}else{
_1=_3;
}
return _1;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_18,_19,_1a){
with(_18){
_18=objj_msgSendSuper({receiver:_18,super_class:objj_getClass("CPTextField").super_class},"initWithFrame:",_1a);
if(_18){
objj_msgSend(_18,"setStringValue:","");
objj_msgSend(_18,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_18,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
}
return _18;
}
}),new objj_method(sel_getUid("setEditable:"),function(_1b,_1c,_1d){
with(_1b){
if(_isEditable===_1d){
return;
}
_isEditable=_1d;
if(_1d){
_isSelectable=YES;
}
if(!_1d&&objj_msgSend(objj_msgSend(_1b,"window"),"firstResponder")===_1b){
objj_msgSend(objj_msgSend(_1b,"window"),"makeFirstResponder:",nil);
}
}
}),new objj_method(sel_getUid("isEditable"),function(_1e,_1f){
with(_1e){
return _isEditable;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_20,_21,_22){
with(_20){
objj_msgSendSuper({receiver:_20,super_class:objj_getClass("CPTextField").super_class},"setEnabled:",_22);
if(!_22&&objj_msgSend(objj_msgSend(_20,"window"),"firstResponder")===_20){
objj_msgSend(objj_msgSend(_20,"window"),"makeFirstResponder:",nil);
}
}
}),new objj_method(sel_getUid("setSelectable:"),function(_23,_24,_25){
with(_23){
_isSelectable=_25;
}
}),new objj_method(sel_getUid("isSelectable"),function(_26,_27){
with(_26){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_28,_29,_2a){
with(_28){
_isSecure=_2a;
}
}),new objj_method(sel_getUid("isSecure"),function(_2b,_2c){
with(_2b){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_2d,_2e,_2f){
with(_2d){
if(_2f){
objj_msgSend(_2d,"setThemeState:",CPThemeStateBezeled);
}else{
objj_msgSend(_2d,"unsetThemeState:",CPThemeStateBezeled);
}
}
}),new objj_method(sel_getUid("isBezeled"),function(_30,_31){
with(_30){
return objj_msgSend(_30,"hasThemeState:",CPThemeStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_32,_33,_34){
with(_32){
var _35=_34===CPTextFieldRoundedBezel;
if(_35){
objj_msgSend(_32,"setThemeState:",CPTextFieldStateRounded);
}else{
objj_msgSend(_32,"unsetThemeState:",CPTextFieldStateRounded);
}
}
}),new objj_method(sel_getUid("bezelStyle"),function(_36,_37){
with(_36){
if(objj_msgSend(_36,"hasThemeState:",CPTextFieldStateRounded)){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_38,_39,_3a){
with(_38){
if(_3a){
objj_msgSend(_38,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_38,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_3b,_3c){
with(_3b){
return objj_msgSend(_3b,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_3d,_3e,_3f){
with(_3d){
if(_drawsBackground==_3f){
return;
}
_drawsBackground=_3f;
objj_msgSend(_3d,"setNeedsLayout");
objj_msgSend(_3d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_40,_41){
with(_40){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_42,_43,_44){
with(_42){
if(_textFieldBackgroundColor==_44){
return;
}
_textFieldBackgroundColor=_44;
objj_msgSend(_42,"setNeedsLayout");
objj_msgSend(_42,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_45,_46){
with(_45){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_47,_48){
with(_47){
return objj_msgSend(_47,"isEditable")&&objj_msgSend(_47,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_49,_4a){
with(_49){
if(_4&&objj_msgSend(_4,"window")!==objj_msgSend(_49,"window")){
objj_msgSend(objj_msgSend(_4,"window"),"makeFirstResponder:",nil);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_49,sel_getUid("_windowDidResignKey:"),CPWindowDidResignKeyNotification,objj_msgSend(_49,"window"));
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_49,sel_getUid("_windowDidBecomeKey:"),CPWindowDidBecomeKeyNotification,objj_msgSend(_49,"window"));
_isEditing=NO;
if(objj_msgSend(objj_msgSend(_49,"window"),"isKeyWindow")){
objj_msgSend(_49,"_becomeFirstKeyResponder");
}
return YES;
}
}),new objj_method(sel_getUid("_becomeFirstKeyResponder"),function(_4b,_4c){
with(_4b){
objj_msgSend(_4b,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_4b,"_updatePlaceholderState");
objj_msgSend(_4b,"setNeedsLayout");
_stringValue=objj_msgSend(_4b,"stringValue");
var _4d=objj_msgSend(_4b,"_inputElement"),_4e=objj_msgSend(_4b,"currentValueForThemeAttribute:","font"),_4f=objj_msgSend(_4e,"defaultLineHeightForFont");
_4d.value=_stringValue;
_4d.style.color=objj_msgSend(objj_msgSend(_4b,"currentValueForThemeAttribute:","text-color"),"cssString");
if(CPFeatureIsCompatible(CPInputSetFontOutsideOfDOM)){
_4d.style.font=objj_msgSend(_4e,"cssString");
}
_4d.style.zIndex=1000;
switch(objj_msgSend(_4b,"alignment")){
case CPCenterTextAlignment:
_4d.style.textAlign="center";
break;
case CPRightTextAlignment:
_4d.style.textAlign="right";
break;
default:
_4d.style.textAlign="left";
}
var _50=objj_msgSend(_4b,"contentRectForBounds:",objj_msgSend(_4b,"bounds")),_51=objj_msgSend(_4b,"currentValueForThemeAttribute:","vertical-alignment");
switch(_51){
case CPTopVerticalTextAlignment:
var _52=(_50.origin.y)+"px";
break;
case CPCenterVerticalTextAlignment:
var _52=((_50.origin.y+(_50.size.height)/2)-(_4f/2))+"px";
break;
case CPBottomVerticalTextAlignment:
var _52=((_50.origin.y+_50.size.height)-_4f)+"px";
break;
default:
var _52=(_50.origin.y)+"px";
break;
}
_4d.style.top=_52;
var _53=(_50.origin.x);
if(CPFeatureIsCompatible(CPInput1PxLeftPadding)){
_53-=1;
}
_4d.style.left=_53+"px";
_4d.style.width=(_50.size.width)+"px";
_4d.style.height=ROUND(_4f)+"px";
_4d.style.lineHeight=ROUND(_4f)+"px";
_4d.style.verticalAlign="top";
_DOMElement.appendChild(_4d);
if(!CPFeatureIsCompatible(CPInputSetFontOutsideOfDOM)){
_4d.style.font=objj_msgSend(_4e,"cssString");
}
window.setTimeout(function(){
_4d.focus();
if(!_willBecomeFirstResponderByClick){
objj_msgSend(_4b,"_selectText:immediately:",_4b,YES);
}
_willBecomeFirstResponderByClick=NO;
objj_msgSend(_4b,"textDidFocus:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidFocusNotification,_4b,nil));
_4=_4b;
},0);
objj_msgSend(objj_msgSend(objj_msgSend(_4b,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
_8=YES;
if(document.attachEvent){
_9=objj_msgSend(objj_msgSend(_4b,"window"),"platformWindow")._DOMBodyElement.onselectstart;
_a=objj_msgSend(objj_msgSend(_4b,"window"),"platformWindow")._DOMBodyElement.ondrag;
objj_msgSend(objj_msgSend(_4b,"window"),"platformWindow")._DOMBodyElement.ondrag=function(){
};
objj_msgSend(objj_msgSend(_4b,"window"),"platformWindow")._DOMBodyElement.onselectstart=function(){
};
}
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_54,_55){
with(_54){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_54,CPWindowDidResignKeyNotification,objj_msgSend(_54,"window"));
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_54,CPWindowDidBecomeKeyNotification,objj_msgSend(_54,"window"));
var _56=objj_msgSend(_54,"_inputElement"),_57=_56.value,_58="";
if(_57!==_stringValue){
objj_msgSend(_54,"_setStringValue:",_57);
}
if(objj_msgSend(_54,"_valueIsValid:",_57)===NO){
_56.focus();
return NO;
}
objj_msgSend(_54,"_resignFirstKeyResponder");
_isEditing=NO;
objj_msgSend(_54,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_54,nil));
if(objj_msgSend(_54,"sendsActionOnEndEditing")){
objj_msgSend(_54,"sendAction:to:",objj_msgSend(_54,"action"),objj_msgSend(_54,"target"));
}
objj_msgSend(_54,"textDidBlur:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidBlurNotification,_54,nil));
return YES;
}
}),new objj_method(sel_getUid("_resignFirstKeyResponder"),function(_59,_5a){
with(_59){
objj_msgSend(_59,"unsetThemeState:",CPThemeStateEditing);
_stringValue=objj_msgSend(_59,"stringValue");
_willBecomeFirstResponderByClick=NO;
objj_msgSend(_59,"_updatePlaceholderState");
objj_msgSend(_59,"setNeedsLayout");
var _5b=objj_msgSend(_59,"_inputElement");
_6=YES;
if(_8){
_5b.blur();
}
if(!_7){
_b();
}
_7=NO;
_6=NO;
if(_5b.parentNode==_DOMElement){
_5b.parentNode.removeChild(_5b);
}
_8=NO;
if(document.attachEvent){
objj_msgSend(objj_msgSend(_59,"window"),"platformWindow")._DOMBodyElement.ondrag=_a;
objj_msgSend(objj_msgSend(_59,"window"),"platformWindow")._DOMBodyElement.onselectstart=_9;
_9=nil;
_a=nil;
}
}
}),new objj_method(sel_getUid("_windowDidResignKey:"),function(_5c,_5d,_5e){
with(_5c){
if(!objj_msgSend(objj_msgSend(_5c,"window"),"isKeyWindow")){
objj_msgSend(_5c,"_resignFirstKeyResponder");
}
}
}),new objj_method(sel_getUid("_windowDidBecomeKey:"),function(_5f,_60,_61){
with(_5f){
if(objj_msgSend(objj_msgSend(_5f,"window"),"isKeyWindow")&&objj_msgSend(objj_msgSend(_5f,"window"),"firstResponder")===_5f){
objj_msgSend(_5f,"_becomeFirstKeyResponder");
}
}
}),new objj_method(sel_getUid("_valueIsValid:"),function(_62,_63,_64){
with(_62){
var _65="";
if(objj_msgSend(_62,"_setStringValue:isNewValue:errorDescription:",_64,NO,function(_66){
if(arguments.length){
return _65=_66;
}
return _65;
})===NO){
var _67=NO;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("control:didFailToFormatString:errorDescription:"))){
_67=objj_msgSend(_delegate,"control:didFailToFormatString:errorDescription:",_62,_64,_65);
}
if(_67===NO){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("needsPanelToBecomeKey"),function(_68,_69){
with(_68){
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_6a,_6b,_6c){
with(_6a){
if(objj_msgSend(_6a,"isEditable")&&objj_msgSend(_6a,"isEnabled")){
_willBecomeFirstResponderByClick=YES;
objj_msgSend(objj_msgSend(_6a,"window"),"makeFirstResponder:",_6a);
}else{
if(objj_msgSend(_6a,"isSelectable")){
if(document.attachEvent){
_9=objj_msgSend(objj_msgSend(_6a,"window"),"platformWindow")._DOMBodyElement.onselectstart;
_a=objj_msgSend(objj_msgSend(_6a,"window"),"platformWindow")._DOMBodyElement.ondrag;
objj_msgSend(objj_msgSend(_6a,"window"),"platformWindow")._DOMBodyElement.ondrag=function(){
};
objj_msgSend(objj_msgSend(_6a,"window"),"platformWindow")._DOMBodyElement.onselectstart=function(){
};
}
return objj_msgSend(objj_msgSend(objj_msgSend(_6c,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}else{
return objj_msgSend(objj_msgSend(_6a,"nextResponder"),"mouseDown:",_6c);
}
}
}
}),new objj_method(sel_getUid("mouseUp:"),function(_6d,_6e,_6f){
with(_6d){
if(!objj_msgSend(_6d,"isSelectable")&&(!objj_msgSend(_6d,"isEditable")||!objj_msgSend(_6d,"isEnabled"))){
objj_msgSend(objj_msgSend(_6d,"nextResponder"),"mouseUp:",_6f);
}else{
if(objj_msgSend(_6d,"isSelectable")){
if(document.attachEvent){
objj_msgSend(objj_msgSend(_6d,"window"),"platformWindow")._DOMBodyElement.ondrag=_a;
objj_msgSend(objj_msgSend(_6d,"window"),"platformWindow")._DOMBodyElement.onselectstart=_9;
_9=nil;
_a=nil;
}
return objj_msgSend(objj_msgSend(objj_msgSend(_6f,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_70,_71,_72){
with(_70){
if(!objj_msgSend(_70,"isSelectable")&&(!objj_msgSend(_70,"isEditable")||!objj_msgSend(_70,"isEnabled"))){
objj_msgSend(objj_msgSend(_70,"nextResponder"),"mouseDragged:",_72);
}else{
if(objj_msgSend(_70,"isSelectable")){
return objj_msgSend(objj_msgSend(objj_msgSend(_72,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}
}),new objj_method(sel_getUid("keyUp:"),function(_73,_74,_75){
with(_73){
var _76=objj_msgSend(_73,"_inputElement").value;
if(_76!==_stringValue){
objj_msgSend(_73,"_setStringValue:",_76);
if(!_isEditing){
_isEditing=YES;
objj_msgSend(_73,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_73,nil));
}
objj_msgSend(_73,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_73,nil));
}
objj_msgSend(objj_msgSend(objj_msgSend(_73,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("keyDown:"),function(_77,_78,_79){
with(_77){
objj_msgSend(objj_msgSend(objj_msgSend(_77,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
objj_msgSend(_77,"interpretKeyEvents:",[_79]);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_7a,_7b,_7c){
with(_7a){
if(objj_msgSend(_7a,"respondsToSelector:",_7c)){
objj_msgSend(_7a,"performSelector:",_7c);
}
}
}),new objj_method(sel_getUid("insertNewline:"),function(_7d,_7e,_7f){
with(_7d){
var _80=objj_msgSend(_7d,"_inputElement").value;
if(_80!==_stringValue){
objj_msgSend(_7d,"_setStringValue:",_80);
}
if(objj_msgSend(_7d,"_valueIsValid:",_stringValue)){
if(_isEditing){
_isEditing=NO;
objj_msgSend(_7d,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_7d,nil));
}
if(!objj_msgSend(_7d,"action")||objj_msgSend(_7d,"sendAction:to:",objj_msgSend(_7d,"action"),objj_msgSend(_7d,"target"))){
objj_msgSend(_7d,"selectAll:",nil);
}
}
objj_msgSend(objj_msgSend(objj_msgSend(_7d,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("insertNewlineIgnoringFieldEditor:"),function(_81,_82,_83){
with(_81){
objj_msgSend(_81,"_insertCharacterIgnoringFieldEditor:",CPNewlineCharacter);
}
}),new objj_method(sel_getUid("insertTabIgnoringFieldEditor:"),function(_84,_85,_86){
with(_84){
objj_msgSend(_84,"_insertCharacterIgnoringFieldEditor:",CPTabCharacter);
}
}),new objj_method(sel_getUid("_insertCharacterIgnoringFieldEditor:"),function(_87,_88,_89){
with(_87){
var _8a=_stringValue,_8b=objj_msgSend(_87,"selectedRange"),_8c=objj_msgSend(_87,"_inputElement");
_8c.value=objj_msgSend(_8c.value,"stringByReplacingCharactersInRange:withString:",objj_msgSend(_87,"selectedRange"),_89);
objj_msgSend(_87,"_setStringValue:",_8c.value);
if(_8a!==_stringValue){
if(!_isEditing){
_isEditing=YES;
objj_msgSend(_87,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_87,nil));
}
objj_msgSend(_87,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_87,nil));
}
}
}),new objj_method(sel_getUid("textDidBlur:"),function(_8d,_8e,_8f){
with(_8d){
if(objj_msgSend(_8f,"object")!=_8d){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotification:",_8f);
}
}),new objj_method(sel_getUid("textDidFocus:"),function(_90,_91,_92){
with(_90){
if(objj_msgSend(_92,"object")!=_90){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotification:",_92);
}
}),new objj_method(sel_getUid("textDidChange:"),function(_93,_94,_95){
with(_93){
if(objj_msgSend(_95,"object")!==_93){
return;
}
objj_msgSend(_93,"_continuouslyReverseSetBinding");
objj_msgSendSuper({receiver:_93,super_class:objj_getClass("CPTextField").super_class},"textDidChange:",_95);
}
}),new objj_method(sel_getUid("objectValue"),function(_96,_97){
with(_96){
return objj_msgSendSuper({receiver:_96,super_class:objj_getClass("CPTextField").super_class},"objectValue");
}
}),new objj_method(sel_getUid("_setStringValue:"),function(_98,_99,_9a){
with(_98){
return objj_msgSend(_98,"_setStringValue:isNewValue:errorDescription:",_9a,YES,nil);
}
}),new objj_method(sel_getUid("_setStringValue:isNewValue:errorDescription:"),function(_9b,_9c,_9d,_9e,_9f){
with(_9b){
_stringValue=_9d;
var _a0=_9d,_a1=objj_msgSend(_9b,"formatter"),_a2=YES;
if(_a1){
var _a3=nil;
if(objj_msgSend(_a1,"getObjectValue:forString:errorDescription:",function(_a4){
if(arguments.length){
return _a3=_a4;
}
return _a3;
},_9d,_9f)){
_a0=_a3;
}else{
_a0=undefined;
_a2=NO;
}
_9e|=_a0!==objj_msgSendSuper({receiver:_9b,super_class:objj_getClass("CPTextField").super_class},"objectValue");
}
if(_9e){
objj_msgSend(_9b,"willChangeValueForKey:","objectValue");
objj_msgSendSuper({receiver:_9b,super_class:objj_getClass("CPTextField").super_class},"setObjectValue:",_a0);
objj_msgSend(_9b,"_updatePlaceholderState");
objj_msgSend(_9b,"didChangeValueForKey:","objectValue");
}
return _a2;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_a5,_a6,_a7){
with(_a5){
objj_msgSendSuper({receiver:_a5,super_class:objj_getClass("CPTextField").super_class},"setObjectValue:",_a7);
var _a8=objj_msgSend(_a5,"formatter");
if(_a8){
var _a9=objj_msgSend(_a5,"hasThemeState:",CPThemeStateEditing)?objj_msgSend(_a8,"editingStringForObjectValue:",_a7):objj_msgSend(_a8,"stringForObjectValue:",_a7);
if(_a9===nil){
var _aa=nil;
if(objj_msgSend(_a8,"getObjectValue:forString:errorDescription:",function(_ab){
if(arguments.length){
return _aa=_ab;
}
return _aa;
},"",nil)===NO){
_aa=undefined;
}
objj_msgSendSuper({receiver:_a5,super_class:objj_getClass("CPTextField").super_class},"setObjectValue:",_aa);
}
}
_stringValue=objj_msgSend(_a5,"stringValue");
if(_4===_a5||objj_msgSend(objj_msgSend(_a5,"window"),"firstResponder")===_a5){
objj_msgSend(_a5,"_inputElement").value=_stringValue;
}
objj_msgSend(_a5,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_ac,_ad){
with(_ac){
if((!_stringValue||_stringValue.length===0)&&!objj_msgSend(_ac,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_ac,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_ac,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_ae,_af,_b0){
with(_ae){
if(_placeholderString===_b0){
return;
}
_placeholderString=_b0;
if(objj_msgSend(_ae,"hasThemeState:",CPTextFieldStatePlaceholder)){
objj_msgSend(_ae,"setNeedsLayout");
objj_msgSend(_ae,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_b1,_b2){
with(_b1){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_b3,_b4){
with(_b3){
objj_msgSend(_b3,"setFrameSize:",objj_msgSend(_b3,"_minimumFrameSize"));
}
}),new objj_method(sel_getUid("_minimumFrameSize"),function(_b5,_b6){
with(_b5){
var _b7=objj_msgSend(_b5,"frameSize"),_b8=objj_msgSend(_b5,"currentValueForThemeAttribute:","content-inset"),_b9=objj_msgSend(_b5,"currentValueForThemeAttribute:","min-size"),_ba=objj_msgSend(_b5,"currentValueForThemeAttribute:","max-size"),_bb=objj_msgSend(_b5,"lineBreakMode"),_bc=(_stringValue||" "),_bd={width:_b7.width,height:_b7.height},_be=objj_msgSend(_b5,"currentValueForThemeAttribute:","font");
_bd.width-=_b8.left+_b8.right;
_bd.height-=_b8.top+_b8.bottom;
if(_b7.width!==0&&!objj_msgSend(_b5,"isBezeled")&&(_bb===CPLineBreakByWordWrapping||_bb===CPLineBreakByCharWrapping)){
_bd=objj_msgSend(_bc,"sizeWithFont:inWidth:",_be,_bd.width);
}else{
_bd=objj_msgSend(_bc,"sizeWithFont:",_be);
_bd.width+=1;
}
_bd.height+=1;
_b7.height=_bd.height+_b8.top+_b8.bottom;
if(objj_msgSend(_b5,"isBezeled")){
_b7.height=MAX(_b7.height,_b9.height);
if(_ba.width>0){
_b7.width=MIN(_b7.width,_ba.width);
}
if(_ba.height>0){
_b7.height=MIN(_b7.height,_ba.height);
}
}else{
_b7.width=_bd.width+_b8.left+_b8.right;
}
_b7.width=MAX(_b7.width,_b9.width);
return _b7;
}
}),new objj_method(sel_getUid("selectText:"),function(_bf,_c0,_c1){
with(_bf){
objj_msgSend(_bf,"_selectText:immediately:",_c1,NO);
}
}),new objj_method(sel_getUid("_selectText:immediately:"),function(_c2,_c3,_c4,_c5){
with(_c2){
if((objj_msgSend(_c2,"isEditable")||objj_msgSend(_c2,"isSelectable"))){
var _c6=objj_msgSend(_c2,"window");
var _c7=objj_msgSend(_c2,"_inputElement");
if(objj_msgSend(_c6,"firstResponder")===_c2){
if(_c5){
_c7.select();
}else{
window.setTimeout(function(){
_c7.select();
},0);
}
}else{
if(_c6!==nil&&objj_msgSend(_c6,"makeFirstResponder:",_c2)){
objj_msgSend(_c2,"_selectText:immediately:",_c4,_c5);
}
}
}
}
}),new objj_method(sel_getUid("copy:"),function(_c8,_c9,_ca){
with(_c8){
if(!objj_msgSend(CPPlatform,"isBrowser")){
var _cb=objj_msgSend(_c8,"selectedRange");
if(_cb.length<1){
return;
}
var _cc=objj_msgSend(CPPasteboard,"generalPasteboard"),_cd=objj_msgSend(_stringValue,"substringWithRange:",_cb);
objj_msgSend(_cc,"declareTypes:owner:",[CPStringPboardType],nil);
objj_msgSend(_cc,"setString:forType:",_cd,CPStringPboardType);
}
}
}),new objj_method(sel_getUid("cut:"),function(_ce,_cf,_d0){
with(_ce){
if(!objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_ce,"copy:",_d0);
objj_msgSend(_ce,"deleteBackward:",_d0);
}else{
if(!CPFeatureIsCompatible(CPInputOnInputEventFeature)){
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_ce,sel_getUid("keyUp:"),nil,NO);
}
}
}
}),new objj_method(sel_getUid("paste:"),function(_d1,_d2,_d3){
with(_d1){
if(!objj_msgSend(CPPlatform,"isBrowser")){
var _d4=objj_msgSend(CPPasteboard,"generalPasteboard");
if(!objj_msgSend(objj_msgSend(_d4,"types"),"containsObject:",CPStringPboardType)){
return;
}
objj_msgSend(_d1,"deleteBackward:",_d3);
var _d5=objj_msgSend(_d1,"selectedRange"),_d6=objj_msgSend(_d4,"stringForType:",CPStringPboardType),_d7=objj_msgSend(_stringValue,"stringByReplacingCharactersInRange:withString:",_d5,_d6);
objj_msgSend(_d1,"setStringValue:",_d7);
objj_msgSend(_d1,"setSelectedRange:",CPMakeRange(_d5.location+_d6.length,0));
}else{
if(!CPFeatureIsCompatible(CPInputOnInputEventFeature)){
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_d1,sel_getUid("keyUp:"),nil,NO);
}
}
}
}),new objj_method(sel_getUid("selectedRange"),function(_d8,_d9){
with(_d8){
if(objj_msgSend(objj_msgSend(_d8,"window"),"firstResponder")!==_d8){
return CPMakeRange(0,0);
}
try{
var _da=objj_msgSend(_d8,"_inputElement"),_db=_da.selectionStart,_dc=_da.selectionEnd;
if(objj_msgSend(_db,"isKindOfClass:",CPNumber)){
return CPMakeRange(_db,_dc-_db);
}
var _dd=_da.ownerDocument||_da.document,_de=_dd.selection.createRange(),_df=_da.createTextRange();
if(_df.inRange(_de)){
_df.setEndPoint("EndToStart",_de);
return CPMakeRange(_df.text.length,_de.text.length);
}
}
catch(e){
}
return CPMakeRange(0,0);
}
}),new objj_method(sel_getUid("setSelectedRange:"),function(_e0,_e1,_e2){
with(_e0){
if(!objj_msgSend(objj_msgSend(_e0,"window"),"firstResponder")===_e0){
return;
}
var _e3=objj_msgSend(_e0,"_inputElement");
try{
if(objj_msgSend(_e3.selectionStart,"isKindOfClass:",CPNumber)){
_e3.selectionStart=_e2.location;
_e3.selectionEnd=CPMaxRange(_e2);
}else{
var _e4=_e3.ownerDocument||_e3.document,_e5=_e4.selection.createRange(),_e6=_e3.createTextRange();
if(_e6.inRange(_e5)){
_e6.collapse(true);
_e6.move("character",_e2.location);
_e6.moveEnd("character",_e2.length);
_e6.select();
}
}
}
catch(e){
}
}
}),new objj_method(sel_getUid("selectAll:"),function(_e7,_e8,_e9){
with(_e7){
objj_msgSend(_e7,"selectText:",_e9);
}
}),new objj_method(sel_getUid("deleteBackward:"),function(_ea,_eb,_ec){
with(_ea){
var _ed=objj_msgSend(_ea,"selectedRange");
if(_ed.length<2){
return;
}
_ed.location+=1;
_ed.length-=1;
var _ee=objj_msgSend(_stringValue,"stringByReplacingCharactersInRange:withString:",_ed,"");
objj_msgSend(_ea,"setStringValue:",_ee);
objj_msgSend(_ea,"setSelectedRange:",CPMakeRange(_ed.location,0));
}
}),new objj_method(sel_getUid("setDelegate:"),function(_ef,_f0,_f1){
with(_ef){
var _f2=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_f2,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_ef);
objj_msgSend(_f2,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_ef);
objj_msgSend(_f2,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_ef);
objj_msgSend(_f2,"removeObserver:name:object:",_delegate,CPTextFieldDidFocusNotification,_ef);
objj_msgSend(_f2,"removeObserver:name:object:",_delegate,CPTextFieldDidBlurNotification,_ef);
}
_delegate=_f1;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_f2,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_ef);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_f2,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_ef);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_f2,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_ef);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidFocus:"))){
objj_msgSend(_f2,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidFocus:"),CPTextFieldDidFocusNotification,_ef);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBlur:"))){
objj_msgSend(_f2,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBlur:"),CPTextFieldDidBlurNotification,_ef);
}
}
}),new objj_method(sel_getUid("delegate"),function(_f3,_f4){
with(_f3){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_f5,_f6,_f7){
with(_f5){
var _f8=objj_msgSend(_f5,"currentValueForThemeAttribute:","content-inset");
return {origin:{x:(_f7).origin.x+(_f8).left,y:(_f7).origin.y+(_f8).top},size:{width:(_f7).size.width-(_f8).left-(_f8).right,height:(_f7).size.height-(_f8).top-(_f8).bottom}};
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_f9,_fa,_fb){
with(_f9){
var _fc=objj_msgSend(_f9,"currentValueForThemeAttribute:","bezel-inset");
return {origin:{x:(_fb).origin.x+(_fc).left,y:(_fb).origin.y+(_fc).top},size:{width:(_fb).size.width-(_fc).left-(_fc).right,height:(_fb).size.height-(_fc).top-(_fc).bottom}};
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_fd,_fe,_ff){
with(_fd){
if(_ff==="bezel-view"){
return objj_msgSend(_fd,"bezelRectForBounds:",objj_msgSend(_fd,"bounds"));
}else{
if(_ff==="content-view"){
return objj_msgSend(_fd,"contentRectForBounds:",objj_msgSend(_fd,"bounds"));
}
}
return objj_msgSendSuper({receiver:_fd,super_class:objj_getClass("CPTextField").super_class},"rectForEphemeralSubviewNamed:",_ff);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_100,_101){
with(self){
if(_101==="bezel-view"){
var view=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(view,"setHitTests:",NO);
return view;
}else{
var view=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(view,"setHitTests:",NO);
return view;
}
return objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTextField").super_class},"createEphemeralSubviewNamed:",_101);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_102){
with(self){
var _103=objj_msgSend(self,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_103){
objj_msgSend(_103,"setBackgroundColor:",objj_msgSend(self,"currentValueForThemeAttribute:","bezel-color"));
}
var _104=objj_msgSend(self,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_104){
objj_msgSend(_104,"setHidden:",objj_msgSend(self,"hasThemeState:",CPThemeStateEditing));
var _105="";
if(objj_msgSend(self,"hasThemeState:",CPTextFieldStatePlaceholder)){
_105=objj_msgSend(self,"placeholderString");
}else{
_105=_stringValue;
if(objj_msgSend(self,"isSecure")){
_105=_106(_105);
}
}
objj_msgSend(_104,"setText:",_105);
objj_msgSend(_104,"setTextColor:",objj_msgSend(self,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_104,"setFont:",objj_msgSend(self,"currentValueForThemeAttribute:","font"));
objj_msgSend(_104,"setAlignment:",objj_msgSend(self,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_104,"setVerticalAlignment:",objj_msgSend(self,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_104,"setLineBreakMode:",objj_msgSend(self,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_104,"setTextShadowColor:",objj_msgSend(self,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_104,"setTextShadowOffset:",objj_msgSend(self,"currentValueForThemeAttribute:","text-shadow-offset"));
}
}
}),new objj_method(sel_getUid("takeValueFromKeyPath:ofObjects:"),function(self,_107,_108,_109){
with(self){
var _10a=_109.length,_10b=objj_msgSend(_109[0],"valueForKeyPath:",_108);
objj_msgSend(self,"setStringValue:",_10b);
objj_msgSend(self,"setPlaceholderString:","");
while(_10a-->1){
if(_10b!==objj_msgSend(_109[_10a],"valueForKeyPath:",_108)){
objj_msgSend(self,"setPlaceholderString:","Multiple Values");
objj_msgSend(self,"setStringValue:","");
}
}
}
})]);
class_addMethods(_f,[new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"),function(self,_10c,_10d,_10e,_10f){
with(self){
return objj_msgSend(self,"textFieldWithStringValue:placeholder:width:theme:",_10d,_10e,_10f,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"),function(self,_110,_111,_112,_113,_114){
with(self){
var _115=objj_msgSend(objj_msgSend(self,"alloc"),"initWithFrame:",CGRectMake(0,0,_113,29));
objj_msgSend(_115,"setTheme:",_114);
objj_msgSend(_115,"setStringValue:",_111);
objj_msgSend(_115,"setPlaceholderString:",_112);
objj_msgSend(_115,"setBordered:",YES);
objj_msgSend(_115,"setBezeled:",YES);
objj_msgSend(_115,"setEditable:",YES);
objj_msgSend(_115,"sizeToFit");
return _115;
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"),function(self,_116,_117,_118,_119){
with(self){
return objj_msgSend(self,"roundedTextFieldWithStringValue:placeholder:width:theme:",_117,_118,_119,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"),function(self,_11a,_11b,_11c,_11d,_11e){
with(self){
var _11f=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(0,0,_11d,29));
objj_msgSend(_11f,"setTheme:",_11e);
objj_msgSend(_11f,"setStringValue:",_11b);
objj_msgSend(_11f,"setPlaceholderString:",_11c);
objj_msgSend(_11f,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_11f,"setBordered:",YES);
objj_msgSend(_11f,"setBezeled:",YES);
objj_msgSend(_11f,"setEditable:",YES);
objj_msgSend(_11f,"sizeToFit");
return _11f;
}
}),new objj_method(sel_getUid("labelWithTitle:"),function(self,_120,_121){
with(self){
return objj_msgSend(self,"labelWithTitle:theme:",_121,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("labelWithTitle:theme:"),function(self,_122,_123,_124){
with(self){
var _125=objj_msgSend(objj_msgSend(self,"alloc"),"init");
objj_msgSend(_125,"setStringValue:",_123);
objj_msgSend(_125,"sizeToFit");
return _125;
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(self,_126){
with(self){
return "textfield";
}
}),new objj_method(sel_getUid("_binderClassForBinding:"),function(self,_127,_128){
with(self){
if(_128===CPValueBinding){
return objj_msgSend(_CPTextFieldValueBinder,"class");
}
return objj_msgSendSuper({receiver:self,super_class:objj_getMetaClass("CPTextField").super_class},"_binderClassForBinding:",_128);
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_129){
with(self){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(2),right:(2),bottom:(2),left:(2)},objj_msgSend(CPNull,"null")],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _106=function(_12a){
if(!_12a){
return "";
}
return Array(_12a.length+1).join(_d);
};
var _12b="CPTextFieldIsEditableKey",_12c="CPTextFieldIsSelectableKey",_12d="CPTextFieldIsBorderedKey",_12e="CPTextFieldIsBezeledKey",_12f="CPTextFieldBezelStyleKey",_130="CPTextFieldDrawsBackgroundKey",_131="CPTextFieldLineBreakModeKey",_132="CPTextFieldAlignmentKey",_133="CPTextFieldBackgroundColorKey",_134="CPTextFieldPlaceholderStringKey";
var _e=objj_getClass("CPTextField");
if(!_e){
throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
}
var _f=_e.isa;
class_addMethods(_e,[new objj_method(sel_getUid("initWithCoder:"),function(self,_135,_136){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTextField").super_class},"initWithCoder:",_136);
if(self){
objj_msgSend(self,"setEditable:",objj_msgSend(_136,"decodeBoolForKey:",_12b));
objj_msgSend(self,"setSelectable:",objj_msgSend(_136,"decodeBoolForKey:",_12c));
objj_msgSend(self,"setDrawsBackground:",objj_msgSend(_136,"decodeBoolForKey:",_130));
objj_msgSend(self,"setTextFieldBackgroundColor:",objj_msgSend(_136,"decodeObjectForKey:",_133));
objj_msgSend(self,"setLineBreakMode:",objj_msgSend(_136,"decodeIntForKey:",_131));
objj_msgSend(self,"setAlignment:",objj_msgSend(_136,"decodeIntForKey:",_132));
objj_msgSend(self,"setPlaceholderString:",objj_msgSend(_136,"decodeObjectForKey:",_134));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_137,_138){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTextField").super_class},"encodeWithCoder:",_138);
objj_msgSend(_138,"encodeBool:forKey:",_isEditable,_12b);
objj_msgSend(_138,"encodeBool:forKey:",_isSelectable,_12c);
objj_msgSend(_138,"encodeBool:forKey:",_drawsBackground,_130);
objj_msgSend(_138,"encodeObject:forKey:",_textFieldBackgroundColor,_133);
objj_msgSend(_138,"encodeInt:forKey:",objj_msgSend(self,"lineBreakMode"),_131);
objj_msgSend(_138,"encodeInt:forKey:",objj_msgSend(self,"alignment"),_132);
objj_msgSend(_138,"encodeObject:forKey:",_placeholderString,_134);
}
})]);
var _e=objj_allocateClassPair(CPBinder,"_CPTextFieldValueBinder"),_f=_e.isa;
objj_registerClassPair(_e);
class_addMethods(_e,[new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"),function(self,_139,_13a){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPTextFieldValueBinder").super_class},"_updatePlaceholdersWithOptions:",_13a);
objj_msgSend(self,"_setPlaceholder:forMarker:isDefault:","Multiple Values",CPMultipleValuesMarker,YES);
objj_msgSend(self,"_setPlaceholder:forMarker:isDefault:","No Selection",CPNoSelectionMarker,YES);
objj_msgSend(self,"_setPlaceholder:forMarker:isDefault:","Not Applicable",CPNotApplicableMarker,YES);
objj_msgSend(self,"_setPlaceholder:forMarker:isDefault:","",CPNullMarker,YES);
}
}),new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"),function(self,_13b,_13c,_13d,_13e){
with(self){
objj_msgSend(_source,"setPlaceholderString:",_13c);
objj_msgSend(_source,"setObjectValue:",nil);
}
}),new objj_method(sel_getUid("setValue:forBinding:"),function(self,_13f,_140,_141){
with(self){
objj_msgSend(_source,"setObjectValue:",_140);
}
})]);
