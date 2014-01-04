@STATIC;1.0;i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.ji;21;_CPImageAndTextView.jt;30902;
objj_executeFile("CPControl.j",YES);
objj_executeFile("CPStringDrawing.j",YES);
objj_executeFile("CPCompatibility.j",YES);
objj_executeFile("_CPImageAndTextView.j",YES);
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
CPTextFieldDidFocusNotification="CPTextFieldDidFocusNotification";
CPTextFieldDidBlurNotification="CPTextFieldDidBlurNotification";
var _1="•";
var _2=objj_getClass("CPString");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("string"),function(_4,_5){
with(_4){
return _4;
}
})]);
CPTextFieldStateRounded=CPThemeState("rounded");
CPTextFieldStatePlaceholder=CPThemeState("placeholder");
var _2=objj_allocateClassPair(CPControl,"CPTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_isEditing"),new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_willBecomeFirstResponderByClick"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_stringValue"),new objj_ivar("_delegate"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPTextField").super_class},"initWithFrame:",_8);
if(_6){
objj_msgSend(_6,"setStringValue:","");
objj_msgSend(_6,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_6,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
}
return _6;
}
}),new objj_method(sel_getUid("setEditable:"),function(_9,_a,_b){
with(_9){
if(_isEditable===_b){
return;
}
_isEditable=_b;
if(_b){
_isSelectable=YES;
}
if(!_b&&objj_msgSend(objj_msgSend(_9,"window"),"firstResponder")===_9){
objj_msgSend(objj_msgSend(_9,"window"),"makeFirstResponder:",nil);
}
}
}),new objj_method(sel_getUid("isEditable"),function(_c,_d){
with(_c){
return _isEditable;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_e,_f,_10){
with(_e){
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPTextField").super_class},"setEnabled:",_10);
if(!_10&&objj_msgSend(objj_msgSend(_e,"window"),"firstResponder")===_e){
objj_msgSend(objj_msgSend(_e,"window"),"makeFirstResponder:",nil);
}
}
}),new objj_method(sel_getUid("setSelectable:"),function(_11,_12,_13){
with(_11){
_isSelectable=_13;
}
}),new objj_method(sel_getUid("isSelectable"),function(_14,_15){
with(_14){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_16,_17,_18){
with(_16){
_isSecure=_18;
}
}),new objj_method(sel_getUid("isSecure"),function(_19,_1a){
with(_19){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_1b,_1c,_1d){
with(_1b){
if(_1d){
objj_msgSend(_1b,"setThemeState:",CPThemeStateBezeled);
}else{
objj_msgSend(_1b,"unsetThemeState:",CPThemeStateBezeled);
}
}
}),new objj_method(sel_getUid("isBezeled"),function(_1e,_1f){
with(_1e){
return objj_msgSend(_1e,"hasThemeState:",CPThemeStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_20,_21,_22){
with(_20){
var _23=_22===CPTextFieldRoundedBezel;
if(_23){
objj_msgSend(_20,"setThemeState:",CPTextFieldStateRounded);
}else{
objj_msgSend(_20,"unsetThemeState:",CPTextFieldStateRounded);
}
}
}),new objj_method(sel_getUid("bezelStyle"),function(_24,_25){
with(_24){
if(objj_msgSend(_24,"hasThemeState:",CPTextFieldStateRounded)){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_26,_27,_28){
with(_26){
if(_28){
objj_msgSend(_26,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_26,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_29,_2a){
with(_29){
return objj_msgSend(_29,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_2b,_2c,_2d){
with(_2b){
if(_drawsBackground==_2d){
return;
}
_drawsBackground=_2d;
objj_msgSend(_2b,"setNeedsLayout");
objj_msgSend(_2b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_2e,_2f){
with(_2e){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_30,_31,_32){
with(_30){
if(_textFieldBackgroundColor==_32){
return;
}
_textFieldBackgroundColor=_32;
objj_msgSend(_30,"setNeedsLayout");
objj_msgSend(_30,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_33,_34){
with(_33){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_35,_36){
with(_35){
return objj_msgSend(_35,"isEditable")&&objj_msgSend(_35,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_37,_38){
with(_37){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_37,sel_getUid("_windowDidResignKey:"),CPWindowDidResignKeyNotification,objj_msgSend(_37,"window"));
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_37,sel_getUid("_windowDidBecomeKey:"),CPWindowDidBecomeKeyNotification,objj_msgSend(_37,"window"));
_isEditing=NO;
if(objj_msgSend(objj_msgSend(_37,"window"),"isKeyWindow")){
objj_msgSend(_37,"_becomeFirstKeyResponder");
}
return YES;
}
}),new objj_method(sel_getUid("_becomeFirstKeyResponder"),function(_39,_3a){
with(_39){
objj_msgSend(_39,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_39,"_updatePlaceholderState");
objj_msgSend(_39,"setNeedsLayout");
_stringValue=objj_msgSend(_39,"stringValue");
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_3b,_3c){
with(_3b){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_3b,CPWindowDidResignKeyNotification,objj_msgSend(_3b,"window"));
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_3b,CPWindowDidBecomeKeyNotification,objj_msgSend(_3b,"window"));
objj_msgSend(_3b,"_resignFirstKeyResponder");
_isEditing=NO;
objj_msgSend(_3b,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_3b,nil));
if(objj_msgSend(_3b,"sendsActionOnEndEditing")){
objj_msgSend(_3b,"sendAction:to:",objj_msgSend(_3b,"action"),objj_msgSend(_3b,"target"));
}
objj_msgSend(_3b,"textDidBlur:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidBlurNotification,_3b,nil));
return YES;
}
}),new objj_method(sel_getUid("_resignFirstKeyResponder"),function(_3d,_3e){
with(_3d){
objj_msgSend(_3d,"unsetThemeState:",CPThemeStateEditing);
_stringValue=objj_msgSend(_3d,"stringValue");
_willBecomeFirstResponderByClick=NO;
objj_msgSend(_3d,"_updatePlaceholderState");
objj_msgSend(_3d,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_windowDidResignKey:"),function(_3f,_40,_41){
with(_3f){
if(!objj_msgSend(objj_msgSend(_3f,"window"),"isKeyWindow")){
objj_msgSend(_3f,"_resignFirstKeyResponder");
}
}
}),new objj_method(sel_getUid("_windowDidBecomeKey:"),function(_42,_43,_44){
with(_42){
if(objj_msgSend(objj_msgSend(_42,"window"),"isKeyWindow")&&objj_msgSend(objj_msgSend(_42,"window"),"firstResponder")===_42){
objj_msgSend(_42,"_becomeFirstKeyResponder");
}
}
}),new objj_method(sel_getUid("_valueIsValid:"),function(_45,_46,_47){
with(_45){
return YES;
}
}),new objj_method(sel_getUid("needsPanelToBecomeKey"),function(_48,_49){
with(_48){
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_4a,_4b,_4c){
with(_4a){
if(objj_msgSend(_4a,"isEditable")&&objj_msgSend(_4a,"isEnabled")){
_willBecomeFirstResponderByClick=YES;
objj_msgSend(objj_msgSend(_4a,"window"),"makeFirstResponder:",_4a);
}else{
if(objj_msgSend(_4a,"isSelectable")){
if(document.attachEvent){
CPTextFieldCachedSelectStartFunction=objj_msgSend(objj_msgSend(_4a,"window"),"platformWindow")._DOMBodyElement.onselectstart;
CPTextFieldCachedDragFunction=objj_msgSend(objj_msgSend(_4a,"window"),"platformWindow")._DOMBodyElement.ondrag;
objj_msgSend(objj_msgSend(_4a,"window"),"platformWindow")._DOMBodyElement.ondrag=function(){
};
objj_msgSend(objj_msgSend(_4a,"window"),"platformWindow")._DOMBodyElement.onselectstart=function(){
};
}
return objj_msgSend(objj_msgSend(objj_msgSend(_4c,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}else{
return objj_msgSend(objj_msgSend(_4a,"nextResponder"),"mouseDown:",_4c);
}
}
}
}),new objj_method(sel_getUid("mouseUp:"),function(_4d,_4e,_4f){
with(_4d){
if(!objj_msgSend(_4d,"isSelectable")&&(!objj_msgSend(_4d,"isEditable")||!objj_msgSend(_4d,"isEnabled"))){
objj_msgSend(objj_msgSend(_4d,"nextResponder"),"mouseUp:",_4f);
}else{
if(objj_msgSend(_4d,"isSelectable")){
if(document.attachEvent){
objj_msgSend(objj_msgSend(_4d,"window"),"platformWindow")._DOMBodyElement.ondrag=CPTextFieldCachedDragFunction;
objj_msgSend(objj_msgSend(_4d,"window"),"platformWindow")._DOMBodyElement.onselectstart=CPTextFieldCachedSelectStartFunction;
CPTextFieldCachedSelectStartFunction=nil;
CPTextFieldCachedDragFunction=nil;
}
return objj_msgSend(objj_msgSend(objj_msgSend(_4f,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_50,_51,_52){
with(_50){
if(!objj_msgSend(_50,"isSelectable")&&(!objj_msgSend(_50,"isEditable")||!objj_msgSend(_50,"isEnabled"))){
objj_msgSend(objj_msgSend(_50,"nextResponder"),"mouseDragged:",_52);
}else{
if(objj_msgSend(_50,"isSelectable")){
return objj_msgSend(objj_msgSend(objj_msgSend(_52,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}
}),new objj_method(sel_getUid("keyUp:"),function(_53,_54,_55){
with(_53){
objj_msgSend(objj_msgSend(objj_msgSend(_53,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("keyDown:"),function(_56,_57,_58){
with(_56){
objj_msgSend(objj_msgSend(objj_msgSend(_56,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
objj_msgSend(_56,"interpretKeyEvents:",[_58]);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_59,_5a,_5b){
with(_59){
if(objj_msgSend(_59,"respondsToSelector:",_5b)){
objj_msgSend(_59,"performSelector:",_5b);
}
}
}),new objj_method(sel_getUid("insertNewline:"),function(_5c,_5d,_5e){
with(_5c){
var _5f=objj_msgSend(_5c,"_inputElement").value;
if(_5f!==_stringValue){
objj_msgSend(_5c,"_setStringValue:",_5f);
}
if(objj_msgSend(_5c,"_valueIsValid:",_stringValue)){
if(_isEditing){
_isEditing=NO;
objj_msgSend(_5c,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_5c,nil));
}
if(!objj_msgSend(_5c,"action")||objj_msgSend(_5c,"sendAction:to:",objj_msgSend(_5c,"action"),objj_msgSend(_5c,"target"))){
objj_msgSend(_5c,"selectAll:",nil);
}
}
objj_msgSend(objj_msgSend(objj_msgSend(_5c,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("insertNewlineIgnoringFieldEditor:"),function(_60,_61,_62){
with(_60){
objj_msgSend(_60,"_insertCharacterIgnoringFieldEditor:",CPNewlineCharacter);
}
}),new objj_method(sel_getUid("insertTabIgnoringFieldEditor:"),function(_63,_64,_65){
with(_63){
objj_msgSend(_63,"_insertCharacterIgnoringFieldEditor:",CPTabCharacter);
}
}),new objj_method(sel_getUid("_insertCharacterIgnoringFieldEditor:"),function(_66,_67,_68){
with(_66){
}
}),new objj_method(sel_getUid("textDidBlur:"),function(_69,_6a,_6b){
with(_69){
if(objj_msgSend(_6b,"object")!=_69){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotification:",_6b);
}
}),new objj_method(sel_getUid("textDidFocus:"),function(_6c,_6d,_6e){
with(_6c){
if(objj_msgSend(_6e,"object")!=_6c){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotification:",_6e);
}
}),new objj_method(sel_getUid("textDidChange:"),function(_6f,_70,_71){
with(_6f){
if(objj_msgSend(_71,"object")!==_6f){
return;
}
objj_msgSend(_6f,"_continuouslyReverseSetBinding");
objj_msgSendSuper({receiver:_6f,super_class:objj_getClass("CPTextField").super_class},"textDidChange:",_71);
}
}),new objj_method(sel_getUid("objectValue"),function(_72,_73){
with(_72){
return objj_msgSendSuper({receiver:_72,super_class:objj_getClass("CPTextField").super_class},"objectValue");
}
}),new objj_method(sel_getUid("_setStringValue:"),function(_74,_75,_76){
with(_74){
return objj_msgSend(_74,"_setStringValue:isNewValue:errorDescription:",_76,YES,nil);
}
}),new objj_method(sel_getUid("_setStringValue:isNewValue:errorDescription:"),function(_77,_78,_79,_7a,_7b){
with(_77){
_stringValue=_79;
var _7c=_79,_7d=objj_msgSend(_77,"formatter"),_7e=YES;
if(_7d){
var _7f=nil;
if(objj_msgSend(_7d,"getObjectValue:forString:errorDescription:",function(_80){
if(arguments.length){
return _7f=_80;
}
return _7f;
},_79,_7b)){
_7c=_7f;
}else{
_7c=undefined;
_7e=NO;
}
_7a|=_7c!==objj_msgSendSuper({receiver:_77,super_class:objj_getClass("CPTextField").super_class},"objectValue");
}
if(_7a){
objj_msgSend(_77,"willChangeValueForKey:","objectValue");
objj_msgSendSuper({receiver:_77,super_class:objj_getClass("CPTextField").super_class},"setObjectValue:",_7c);
objj_msgSend(_77,"_updatePlaceholderState");
objj_msgSend(_77,"didChangeValueForKey:","objectValue");
}
return _7e;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_81,_82,_83){
with(_81){
objj_msgSendSuper({receiver:_81,super_class:objj_getClass("CPTextField").super_class},"setObjectValue:",_83);
var _84=objj_msgSend(_81,"formatter");
if(_84){
var _85=objj_msgSend(_81,"hasThemeState:",CPThemeStateEditing)?objj_msgSend(_84,"editingStringForObjectValue:",_83):objj_msgSend(_84,"stringForObjectValue:",_83);
if(_85===nil){
var _86=nil;
if(objj_msgSend(_84,"getObjectValue:forString:errorDescription:",function(_87){
if(arguments.length){
return _86=_87;
}
return _86;
},"",nil)===NO){
_86=undefined;
}
objj_msgSendSuper({receiver:_81,super_class:objj_getClass("CPTextField").super_class},"setObjectValue:",_86);
}
}
_stringValue=objj_msgSend(_81,"stringValue");
objj_msgSend(_81,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_88,_89){
with(_88){
if((!_stringValue||_stringValue.length===0)&&!objj_msgSend(_88,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_88,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_88,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_8a,_8b,_8c){
with(_8a){
if(_placeholderString===_8c){
return;
}
_placeholderString=_8c;
if(objj_msgSend(_8a,"hasThemeState:",CPTextFieldStatePlaceholder)){
objj_msgSend(_8a,"setNeedsLayout");
objj_msgSend(_8a,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_8d,_8e){
with(_8d){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_8f,_90){
with(_8f){
objj_msgSend(_8f,"setFrameSize:",objj_msgSend(_8f,"_minimumFrameSize"));
}
}),new objj_method(sel_getUid("_minimumFrameSize"),function(_91,_92){
with(_91){
var _93=objj_msgSend(_91,"frameSize"),_94=objj_msgSend(_91,"currentValueForThemeAttribute:","content-inset"),_95=objj_msgSend(_91,"currentValueForThemeAttribute:","min-size"),_96=objj_msgSend(_91,"currentValueForThemeAttribute:","max-size"),_97=objj_msgSend(_91,"lineBreakMode"),_98=(_stringValue||" "),_99={width:_93.width,height:_93.height},_9a=objj_msgSend(_91,"currentValueForThemeAttribute:","font");
_99.width-=_94.left+_94.right;
_99.height-=_94.top+_94.bottom;
if(_93.width!==0&&!objj_msgSend(_91,"isBezeled")&&(_97===CPLineBreakByWordWrapping||_97===CPLineBreakByCharWrapping)){
_99=objj_msgSend(_98,"sizeWithFont:inWidth:",_9a,_99.width);
}else{
_99=objj_msgSend(_98,"sizeWithFont:",_9a);
_99.width+=1;
}
_99.height+=1;
_93.height=_99.height+_94.top+_94.bottom;
if(objj_msgSend(_91,"isBezeled")){
_93.height=MAX(_93.height,_95.height);
if(_96.width>0){
_93.width=MIN(_93.width,_96.width);
}
if(_96.height>0){
_93.height=MIN(_93.height,_96.height);
}
}else{
_93.width=_99.width+_94.left+_94.right;
}
_93.width=MAX(_93.width,_95.width);
return _93;
}
}),new objj_method(sel_getUid("selectText:"),function(_9b,_9c,_9d){
with(_9b){
objj_msgSend(_9b,"_selectText:immediately:",_9d,NO);
}
}),new objj_method(sel_getUid("_selectText:immediately:"),function(_9e,_9f,_a0,_a1){
with(_9e){
if((objj_msgSend(_9e,"isEditable")||objj_msgSend(_9e,"isSelectable"))){
var _a2=objj_msgSend(_9e,"window");
if(_a2!==nil&&objj_msgSend(_a2,"firstResponder")!==_9e){
objj_msgSend(_a2,"makeFirstResponder:",_9e);
}
}
}
}),new objj_method(sel_getUid("copy:"),function(_a3,_a4,_a5){
with(_a3){
if(!objj_msgSend(CPPlatform,"isBrowser")){
var _a6=objj_msgSend(_a3,"selectedRange");
if(_a6.length<1){
return;
}
var _a7=objj_msgSend(CPPasteboard,"generalPasteboard"),_a8=objj_msgSend(_stringValue,"substringWithRange:",_a6);
objj_msgSend(_a7,"declareTypes:owner:",[CPStringPboardType],nil);
objj_msgSend(_a7,"setString:forType:",_a8,CPStringPboardType);
}
}
}),new objj_method(sel_getUid("cut:"),function(_a9,_aa,_ab){
with(_a9){
if(!objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_a9,"copy:",_ab);
objj_msgSend(_a9,"deleteBackward:",_ab);
}else{
if(!CPFeatureIsCompatible(CPInputOnInputEventFeature)){
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_a9,sel_getUid("keyUp:"),nil,NO);
}
}
}
}),new objj_method(sel_getUid("paste:"),function(_ac,_ad,_ae){
with(_ac){
if(!objj_msgSend(CPPlatform,"isBrowser")){
var _af=objj_msgSend(CPPasteboard,"generalPasteboard");
if(!objj_msgSend(objj_msgSend(_af,"types"),"containsObject:",CPStringPboardType)){
return;
}
objj_msgSend(_ac,"deleteBackward:",_ae);
var _b0=objj_msgSend(_ac,"selectedRange"),_b1=objj_msgSend(_af,"stringForType:",CPStringPboardType),_b2=objj_msgSend(_stringValue,"stringByReplacingCharactersInRange:withString:",_b0,_b1);
objj_msgSend(_ac,"setStringValue:",_b2);
objj_msgSend(_ac,"setSelectedRange:",CPMakeRange(_b0.location+_b1.length,0));
}else{
if(!CPFeatureIsCompatible(CPInputOnInputEventFeature)){
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_ac,sel_getUid("keyUp:"),nil,NO);
}
}
}
}),new objj_method(sel_getUid("selectedRange"),function(_b3,_b4){
with(_b3){
if(objj_msgSend(objj_msgSend(_b3,"window"),"firstResponder")!==_b3){
return CPMakeRange(0,0);
}
return CPMakeRange(0,0);
}
}),new objj_method(sel_getUid("setSelectedRange:"),function(_b5,_b6,_b7){
with(_b5){
if(!objj_msgSend(objj_msgSend(_b5,"window"),"firstResponder")===_b5){
return;
}
}
}),new objj_method(sel_getUid("selectAll:"),function(_b8,_b9,_ba){
with(_b8){
objj_msgSend(_b8,"selectText:",_ba);
}
}),new objj_method(sel_getUid("deleteBackward:"),function(_bb,_bc,_bd){
with(_bb){
var _be=objj_msgSend(_bb,"selectedRange");
if(_be.length<2){
return;
}
_be.location+=1;
_be.length-=1;
var _bf=objj_msgSend(_stringValue,"stringByReplacingCharactersInRange:withString:",_be,"");
objj_msgSend(_bb,"setStringValue:",_bf);
objj_msgSend(_bb,"setSelectedRange:",CPMakeRange(_be.location,0));
}
}),new objj_method(sel_getUid("setDelegate:"),function(_c0,_c1,_c2){
with(_c0){
var _c3=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_c3,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_c0);
objj_msgSend(_c3,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_c0);
objj_msgSend(_c3,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_c0);
objj_msgSend(_c3,"removeObserver:name:object:",_delegate,CPTextFieldDidFocusNotification,_c0);
objj_msgSend(_c3,"removeObserver:name:object:",_delegate,CPTextFieldDidBlurNotification,_c0);
}
_delegate=_c2;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_c3,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_c0);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_c3,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_c0);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_c3,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_c0);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidFocus:"))){
objj_msgSend(_c3,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidFocus:"),CPTextFieldDidFocusNotification,_c0);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBlur:"))){
objj_msgSend(_c3,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBlur:"),CPTextFieldDidBlurNotification,_c0);
}
}
}),new objj_method(sel_getUid("delegate"),function(_c4,_c5){
with(_c4){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_c6,_c7,_c8){
with(_c6){
var _c9=objj_msgSend(_c6,"currentValueForThemeAttribute:","content-inset");
return {origin:{x:(_c8).origin.x+(_c9).left,y:(_c8).origin.y+(_c9).top},size:{width:(_c8).size.width-(_c9).left-(_c9).right,height:(_c8).size.height-(_c9).top-(_c9).bottom}};
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_ca,_cb,_cc){
with(_ca){
var _cd=objj_msgSend(_ca,"currentValueForThemeAttribute:","bezel-inset");
return {origin:{x:(_cc).origin.x+(_cd).left,y:(_cc).origin.y+(_cd).top},size:{width:(_cc).size.width-(_cd).left-(_cd).right,height:(_cc).size.height-(_cd).top-(_cd).bottom}};
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_ce,_cf,_d0){
with(_ce){
if(_d0==="bezel-view"){
return objj_msgSend(_ce,"bezelRectForBounds:",objj_msgSend(_ce,"bounds"));
}else{
if(_d0==="content-view"){
return objj_msgSend(_ce,"contentRectForBounds:",objj_msgSend(_ce,"bounds"));
}
}
return objj_msgSendSuper({receiver:_ce,super_class:objj_getClass("CPTextField").super_class},"rectForEphemeralSubviewNamed:",_d0);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_d1,_d2,_d3){
with(_d1){
if(_d3==="bezel-view"){
var _d4=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_d4,"setHitTests:",NO);
return _d4;
}else{
var _d4=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_d4,"setHitTests:",NO);
return _d4;
}
return objj_msgSendSuper({receiver:_d1,super_class:objj_getClass("CPTextField").super_class},"createEphemeralSubviewNamed:",_d3);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_d5,_d6){
with(_d5){
var _d7=objj_msgSend(_d5,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_d7){
objj_msgSend(_d7,"setBackgroundColor:",objj_msgSend(_d5,"currentValueForThemeAttribute:","bezel-color"));
}
var _d8=objj_msgSend(_d5,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_d8){
objj_msgSend(_d8,"setHidden:",objj_msgSend(_d5,"hasThemeState:",CPThemeStateEditing));
var _d9="";
if(objj_msgSend(_d5,"hasThemeState:",CPTextFieldStatePlaceholder)){
_d9=objj_msgSend(_d5,"placeholderString");
}else{
_d9=_stringValue;
if(objj_msgSend(_d5,"isSecure")){
_d9=_da(_d9);
}
}
objj_msgSend(_d8,"setText:",_d9);
objj_msgSend(_d8,"setTextColor:",objj_msgSend(_d5,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_d8,"setFont:",objj_msgSend(_d5,"currentValueForThemeAttribute:","font"));
objj_msgSend(_d8,"setAlignment:",objj_msgSend(_d5,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_d8,"setVerticalAlignment:",objj_msgSend(_d5,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_d8,"setLineBreakMode:",objj_msgSend(_d5,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_d8,"setTextShadowColor:",objj_msgSend(_d5,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_d8,"setTextShadowOffset:",objj_msgSend(_d5,"currentValueForThemeAttribute:","text-shadow-offset"));
}
}
}),new objj_method(sel_getUid("takeValueFromKeyPath:ofObjects:"),function(_db,_dc,_dd,_de){
with(_db){
var _df=_de.length,_e0=objj_msgSend(_de[0],"valueForKeyPath:",_dd);
objj_msgSend(_db,"setStringValue:",_e0);
objj_msgSend(_db,"setPlaceholderString:","");
while(_df-->1){
if(_e0!==objj_msgSend(_de[_df],"valueForKeyPath:",_dd)){
objj_msgSend(_db,"setPlaceholderString:","Multiple Values");
objj_msgSend(_db,"setStringValue:","");
}
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"),function(_e1,_e2,_e3,_e4,_e5){
with(_e1){
return objj_msgSend(_e1,"textFieldWithStringValue:placeholder:width:theme:",_e3,_e4,_e5,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"),function(_e6,_e7,_e8,_e9,_ea,_eb){
with(_e6){
var _ec=objj_msgSend(objj_msgSend(_e6,"alloc"),"initWithFrame:",CGRectMake(0,0,_ea,29));
objj_msgSend(_ec,"setTheme:",_eb);
objj_msgSend(_ec,"setStringValue:",_e8);
objj_msgSend(_ec,"setPlaceholderString:",_e9);
objj_msgSend(_ec,"setBordered:",YES);
objj_msgSend(_ec,"setBezeled:",YES);
objj_msgSend(_ec,"setEditable:",YES);
objj_msgSend(_ec,"sizeToFit");
return _ec;
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"),function(_ed,_ee,_ef,_f0,_f1){
with(_ed){
return objj_msgSend(_ed,"roundedTextFieldWithStringValue:placeholder:width:theme:",_ef,_f0,_f1,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"),function(_f2,_f3,_f4,_f5,_f6,_f7){
with(_f2){
var _f8=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(0,0,_f6,29));
objj_msgSend(_f8,"setTheme:",_f7);
objj_msgSend(_f8,"setStringValue:",_f4);
objj_msgSend(_f8,"setPlaceholderString:",_f5);
objj_msgSend(_f8,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_f8,"setBordered:",YES);
objj_msgSend(_f8,"setBezeled:",YES);
objj_msgSend(_f8,"setEditable:",YES);
objj_msgSend(_f8,"sizeToFit");
return _f8;
}
}),new objj_method(sel_getUid("labelWithTitle:"),function(_f9,_fa,_fb){
with(_f9){
return objj_msgSend(_f9,"labelWithTitle:theme:",_fb,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("labelWithTitle:theme:"),function(_fc,_fd,_fe,_ff){
with(_fc){
var _100=objj_msgSend(objj_msgSend(_fc,"alloc"),"init");
objj_msgSend(_100,"setStringValue:",_fe);
objj_msgSend(_100,"sizeToFit");
return _100;
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(self,_101){
with(self){
return "textfield";
}
}),new objj_method(sel_getUid("_binderClassForBinding:"),function(self,_102,_103){
with(self){
if(_103===CPValueBinding){
return objj_msgSend(_CPTextFieldValueBinder,"class");
}
return objj_msgSendSuper({receiver:self,super_class:objj_getMetaClass("CPTextField").super_class},"_binderClassForBinding:",_103);
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_104){
with(self){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(2),right:(2),bottom:(2),left:(2)},objj_msgSend(CPNull,"null")],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _da=function(_105){
if(!_105){
return "";
}
return Array(_105.length+1).join(_1);
};
var _106="CPTextFieldIsEditableKey",_107="CPTextFieldIsSelectableKey",_108="CPTextFieldIsBorderedKey",_109="CPTextFieldIsBezeledKey",_10a="CPTextFieldBezelStyleKey",_10b="CPTextFieldDrawsBackgroundKey",_10c="CPTextFieldLineBreakModeKey",_10d="CPTextFieldAlignmentKey",_10e="CPTextFieldBackgroundColorKey",_10f="CPTextFieldPlaceholderStringKey";
var _2=objj_getClass("CPTextField");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(self,_110,_111){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTextField").super_class},"initWithCoder:",_111);
if(self){
objj_msgSend(self,"setEditable:",objj_msgSend(_111,"decodeBoolForKey:",_106));
objj_msgSend(self,"setSelectable:",objj_msgSend(_111,"decodeBoolForKey:",_107));
objj_msgSend(self,"setDrawsBackground:",objj_msgSend(_111,"decodeBoolForKey:",_10b));
objj_msgSend(self,"setTextFieldBackgroundColor:",objj_msgSend(_111,"decodeObjectForKey:",_10e));
objj_msgSend(self,"setLineBreakMode:",objj_msgSend(_111,"decodeIntForKey:",_10c));
objj_msgSend(self,"setAlignment:",objj_msgSend(_111,"decodeIntForKey:",_10d));
objj_msgSend(self,"setPlaceholderString:",objj_msgSend(_111,"decodeObjectForKey:",_10f));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_112,_113){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTextField").super_class},"encodeWithCoder:",_113);
objj_msgSend(_113,"encodeBool:forKey:",_isEditable,_106);
objj_msgSend(_113,"encodeBool:forKey:",_isSelectable,_107);
objj_msgSend(_113,"encodeBool:forKey:",_drawsBackground,_10b);
objj_msgSend(_113,"encodeObject:forKey:",_textFieldBackgroundColor,_10e);
objj_msgSend(_113,"encodeInt:forKey:",objj_msgSend(self,"lineBreakMode"),_10c);
objj_msgSend(_113,"encodeInt:forKey:",objj_msgSend(self,"alignment"),_10d);
objj_msgSend(_113,"encodeObject:forKey:",_placeholderString,_10f);
}
})]);
var _2=objj_allocateClassPair(CPBinder,"_CPTextFieldValueBinder"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"),function(self,_114,_115){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPTextFieldValueBinder").super_class},"_updatePlaceholdersWithOptions:",_115);
objj_msgSend(self,"_setPlaceholder:forMarker:isDefault:","Multiple Values",CPMultipleValuesMarker,YES);
objj_msgSend(self,"_setPlaceholder:forMarker:isDefault:","No Selection",CPNoSelectionMarker,YES);
objj_msgSend(self,"_setPlaceholder:forMarker:isDefault:","Not Applicable",CPNotApplicableMarker,YES);
objj_msgSend(self,"_setPlaceholder:forMarker:isDefault:","",CPNullMarker,YES);
}
}),new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"),function(self,_116,_117,_118,_119){
with(self){
objj_msgSend(_source,"setPlaceholderString:",_117);
objj_msgSend(_source,"setObjectValue:",nil);
}
}),new objj_method(sel_getUid("setValue:forBinding:"),function(self,_11a,_11b,_11c){
with(self){
objj_msgSend(_source,"setObjectValue:",_11b);
}
})]);
