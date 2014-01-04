@STATIC;1.0;I;27;Foundation/CPCharacterSet.jI;23;Foundation/CPIndexSet.jI;20;Foundation/CPTimer.ji;10;CPButton.ji;14;CPScrollView.ji;13;CPTextField.ji;13;CPTableView.ji;10;CPWindow.ji;21;_CPAutocompleteMenu.jt;33330;
objj_executeFile("Foundation/CPCharacterSet.j",NO);
objj_executeFile("Foundation/CPIndexSet.j",NO);
objj_executeFile("Foundation/CPTimer.j",NO);
objj_executeFile("CPButton.j",YES);
objj_executeFile("CPScrollView.j",YES);
objj_executeFile("CPTextField.j",YES);
objj_executeFile("CPTableView.j",YES);
objj_executeFile("CPWindow.j",YES);
objj_executeFile("_CPAutocompleteMenu.j",YES);
var _1=nil,_2=nil,_3=nil,_4=nil,_5=nil,_6=NO,_7=NO,_8=NO,_9=nil,_a=nil,_b=NO,_c=nil;
var _d=0,_e=1,_f=2;
var _10=objj_allocateClassPair(CPTextField,"CPTokenField"),_11=_10.isa;
class_addIvars(_10,[new objj_ivar("_tokenScrollView"),new objj_ivar("_shouldScrollTo"),new objj_ivar("_selectedRange"),new objj_ivar("_autocompleteMenu"),new objj_ivar("_inputFrame"),new objj_ivar("_completionDelay"),new objj_ivar("_tokenizingCharacterSet"),new objj_ivar("_mouseDownEvent"),new objj_ivar("_preventResign"),new objj_ivar("_shouldNotifyTarget")]);
objj_registerClassPair(_10);
class_addMethods(_10,[new objj_method(sel_getUid("tokenizingCharacterSet"),function(_12,_13){
with(_12){
return _tokenizingCharacterSet;
}
}),new objj_method(sel_getUid("setTokenizingCharacterSet:"),function(_14,_15,_16){
with(_14){
_tokenizingCharacterSet=_16;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_17,_18,_19){
with(_17){
if(_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("CPTokenField").super_class},"initWithFrame:",_19)){
_completionDelay=objj_msgSend(objj_msgSend(_17,"class"),"defaultCompletionDelay");
_tokenizingCharacterSet=objj_msgSend(objj_msgSend(_17,"class"),"defaultTokenizingCharacterSet");
objj_msgSend(_17,"setBezeled:",YES);
objj_msgSend(_17,"_init");
objj_msgSend(_17,"setObjectValue:",[]);
objj_msgSend(_17,"setNeedsLayout");
}
return _17;
}
}),new objj_method(sel_getUid("_init"),function(_1a,_1b){
with(_1a){
_selectedRange={location:(0),length:0};
var _1c=objj_msgSend(_1a,"frame");
_tokenScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_tokenScrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(_tokenScrollView,"setHasVerticalScroller:",NO);
objj_msgSend(_tokenScrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _1d=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_1d,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_tokenScrollView,"setDocumentView:",_1d);
objj_msgSend(_1a,"addSubview:",_tokenScrollView);
}
}),new objj_method(sel_getUid("_autocompleteMenu"),function(_1e,_1f){
with(_1e){
if(!_autocompleteMenu){
_autocompleteMenu=objj_msgSend(objj_msgSend(_CPAutocompleteMenu,"alloc"),"initWithTextField:",_1e);
}
return _autocompleteMenu;
}
}),new objj_method(sel_getUid("_autocompleteWithEvent:"),function(_20,_21,_22){
with(_20){
if(!objj_msgSend(_20,"_inputElement").value&&(!objj_msgSend(_autocompleteMenu,"contentArray")||!objj_msgSend(_20,"hasThemeState:",CPThemeStateAutocompleting))){
return;
}
objj_msgSend(_20,"_hideCompletions");
var _23=objj_msgSend(_autocompleteMenu,"selectedItem"),_24=_23!==""&&objj_msgSend(_20,"_inputElement").value!=="";
if(!_23){
_23=objj_msgSend(_20,"_inputElement").value;
}
if(!_23||_23===""){
var _25=objj_msgSend(_22,"charactersIgnoringModifiers"),_26=objj_msgSend(_22,"modifierFlags");
if(_25===CPTabCharacter){
if(!(_26&CPShiftKeyMask)){
objj_msgSend(objj_msgSend(_20,"window"),"selectNextKeyView:",_20);
}else{
objj_msgSend(objj_msgSend(_20,"window"),"selectPreviousKeyView:",_20);
}
}else{
objj_msgSend(objj_msgSend(_20,"window"),"makeFirstResponder:",nil);
}
return;
}
var _27=objj_msgSend(_20,"objectValue");
if(_24){
objj_msgSend(_27,"removeObjectAtIndex:",_selectedRange.location);
}
_23=objj_msgSend(_20,"_representedObjectForEditingString:",_23);
var _28=objj_msgSend(_20,"_shouldAddObjects:atIndex:",objj_msgSend(CPArray,"arrayWithObject:",_23),_selectedRange.location),_29=objj_msgSend(_28,"count");
if(_28){
for(var i=0;i<_29;i++){
objj_msgSend(_27,"insertObject:atIndex:",objj_msgSend(_28,"objectAtIndex:",i),_selectedRange.location+i);
}
}
var _2a=_selectedRange.location;
objj_msgSend(_20,"setObjectValue:",_27);
if(_29){
_2a+=_29;
}
_selectedRange={location:(_2a),length:0};
objj_msgSend(_20,"_inputElement").value="";
objj_msgSend(_20,"setNeedsLayout");
objj_msgSend(_20,"_controlTextDidChange");
}
}),new objj_method(sel_getUid("_autocomplete"),function(_2b,_2c){
with(_2b){
objj_msgSend(_2b,"_autocompleteWithEvent:",nil);
}
}),new objj_method(sel_getUid("_selectToken:byExtendingSelection:"),function(_2d,_2e,_2f,_30){
with(_2d){
var _31=objj_msgSend(objj_msgSend(_2d,"_tokens"),"indexOfObject:",_2f);
if(_31==CPNotFound){
if(!_30){
_selectedRange={location:(objj_msgSend(objj_msgSend(_2d,"_tokens"),"count")),length:0};
}
}else{
if(_30){
_selectedRange=CPUnionRange(_selectedRange,{location:(_31),length:1});
}else{
_selectedRange={location:(_31),length:1};
}
}
objj_msgSend(_2d,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_deselectToken:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(objj_msgSend(_32,"_tokens"),"indexOfObject:",_34);
if(CPLocationInRange(_35,_selectedRange)){
_selectedRange={location:(MAX(_35,_selectedRange.location)),length:MIN(_selectedRange.length,_35-_selectedRange.location)};
}
objj_msgSend(_32,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_deleteToken:"),function(_36,_37,_38){
with(_36){
var _39=objj_msgSend(objj_msgSend(_36,"_tokens"),"indexOfObject:",_38),_3a=objj_msgSend(_36,"objectValue");
if(_39<_selectedRange.location){
_selectedRange.location--;
}else{
objj_msgSend(_36,"_deselectToken:",_38);
}
var _3b=CPMakeRangeCopy(_selectedRange);
objj_msgSend(_3a,"removeObjectAtIndex:",_39);
objj_msgSend(_36,"setObjectValue:",_3a);
_selectedRange=_3b;
objj_msgSend(_36,"setNeedsLayout");
objj_msgSend(_36,"_controlTextDidChange");
}
}),new objj_method(sel_getUid("_controlTextDidChange"),function(_3c,_3d){
with(_3c){
var _3e=objj_msgSend(objj_msgSend(_3c,"class"),"_binderClassForBinding:",CPValueBinding),_3f=objj_msgSend(_3e,"getBinding:forObject:",CPValueBinding,_3c);
if(_3f){
objj_msgSend(_3f,"reverseSetValueFor:","objectValue");
}
objj_msgSend(_3c,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_3c,nil));
_shouldNotifyTarget=YES;
}
}),new objj_method(sel_getUid("_removeSelectedTokens:"),function(_40,_41,_42){
with(_40){
var _43=objj_msgSend(_40,"objectValue");
for(var i=_selectedRange.length-1;i>=0;i--){
objj_msgSend(_43,"removeObjectAtIndex:",_selectedRange.location+i);
}
var _44=_selectedRange.location;
objj_msgSend(_40,"setObjectValue:",_43);
_selectedRange={location:(_44),length:0};
objj_msgSend(_40,"_controlTextDidChange");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_45,_46){
with(_45){
if((objj_msgSend(objj_msgSend(_45,"_tokens"),"count")===0)&&!objj_msgSend(_45,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_45,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_45,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_47,_48){
with(_47){
if(_4&&objj_msgSend(_4,"window")!==objj_msgSend(_47,"window")){
objj_msgSend(objj_msgSend(_4,"window"),"makeFirstResponder:",nil);
}
objj_msgSend(_47,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_47,"_updatePlaceholderState");
objj_msgSend(_47,"setNeedsLayout");
var _49=objj_msgSend(_47,"stringValue"),_4a=objj_msgSend(_47,"_inputElement"),_4b=objj_msgSend(_47,"currentValueForThemeAttribute:","font");
_4a.value=nil;
_4a.style.color=objj_msgSend(objj_msgSend(_47,"currentValueForThemeAttribute:","text-color"),"cssString");
_4a.style.font=objj_msgSend(_4b,"cssString");
_4a.style.zIndex=1000;
switch(objj_msgSend(_47,"alignment")){
case CPCenterTextAlignment:
_4a.style.textAlign="center";
break;
case CPRightTextAlignment:
_4a.style.textAlign="right";
break;
default:
_4a.style.textAlign="left";
}
var _4c=objj_msgSend(_47,"contentRectForBounds:",objj_msgSend(_47,"bounds"));
_4a.style.top=CGRectGetMinY(_4c)+"px";
_4a.style.left=(CGRectGetMinX(_4c)-1)+"px";
_4a.style.width=CGRectGetWidth(_4c)+"px";
_4a.style.height=objj_msgSend(_4b,"defaultLineHeightForFont")+"px";
objj_msgSend(_tokenScrollView,"documentView")._DOMElement.appendChild(_4a);
window.setTimeout(function(){
_4a.focus();
_4=_47;
},0);
objj_msgSend(_47,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_47,nil));
objj_msgSend(objj_msgSend(objj_msgSend(_47,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
_8=YES;
if(document.attachEvent){
_9=document.body.onselectstart;
_a=document.body.ondrag;
document.body.ondrag=function(){
};
document.body.onselectstart=function(){
};
}
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_4d,_4e){
with(_4d){
if(_preventResign){
return NO;
}
objj_msgSend(_4d,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_4d,"_autocomplete");
var _4f=objj_msgSend(_4d,"_inputElement");
_6=YES;
_4f.blur();
if(!_7){
_c();
}
_7=NO;
_6=NO;
if(_4f.parentNode==objj_msgSend(_tokenScrollView,"documentView")._DOMElement){
_4f.parentNode.removeChild(_4f);
}
_8=NO;
if(document.attachEvent){
_9=nil;
_a=nil;
document.body.ondrag=_a;
document.body.onselectstart=_9;
}
objj_msgSend(_4d,"_updatePlaceholderState");
objj_msgSend(_4d,"setNeedsLayout");
if(_shouldNotifyTarget){
_shouldNotifyTarget=NO;
objj_msgSend(_4d,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_4d,nil));
if(objj_msgSend(_4d,"sendsActionOnEndEditing")){
objj_msgSend(_4d,"sendAction:to:",objj_msgSend(_4d,"action"),objj_msgSend(_4d,"target"));
}
}
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_50,_51,_52){
with(_50){
_preventResign=YES;
_mouseDownEvent=_52;
objj_msgSend(_50,"_selectToken:byExtendingSelection:",nil,NO);
objj_msgSendSuper({receiver:_50,super_class:objj_getClass("CPTokenField").super_class},"mouseDown:",_52);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_53,_54,_55){
with(_53){
_preventResign=NO;
_mouseDownEvent=nil;
}
}),new objj_method(sel_getUid("_mouseDownOnToken:withEvent:"),function(_56,_57,_58,_59){
with(_56){
_preventResign=YES;
_mouseDownEvent=_59;
}
}),new objj_method(sel_getUid("_mouseUpOnToken:withEvent:"),function(_5a,_5b,_5c,_5d){
with(_5a){
if(_mouseDownEvent&&(objj_msgSend(_mouseDownEvent,"locationInWindow").x==objj_msgSend(_5d,"locationInWindow").x&&objj_msgSend(_mouseDownEvent,"locationInWindow").y==objj_msgSend(_5d,"locationInWindow").y)){
objj_msgSend(_5a,"_selectToken:byExtendingSelection:",_5c,objj_msgSend(_5d,"modifierFlags")&CPShiftKeyMask);
objj_msgSend(objj_msgSend(_5a,"window"),"makeFirstResponder:",_5a);
_shouldScrollTo=_5c;
}
_preventResign=NO;
}
}),new objj_method(sel_getUid("_tokens"),function(_5e,_5f){
with(_5e){
return objj_msgSendSuper({receiver:_5e,super_class:objj_getClass("CPTokenField").super_class},"objectValue");
}
}),new objj_method(sel_getUid("stringValue"),function(_60,_61){
with(_60){
return objj_msgSend(objj_msgSend(_60,"objectValue"),"componentsJoinedByString:",",");
}
}),new objj_method(sel_getUid("objectValue"),function(_62,_63){
with(_62){
var _64=[];
for(var i=0,_65=objj_msgSend(objj_msgSend(_62,"_tokens"),"count");i<_65;i++){
var _66=objj_msgSend(objj_msgSend(_62,"_tokens"),"objectAtIndex:",i);
if(objj_msgSend(_66,"isKindOfClass:",objj_msgSend(CPString,"class"))){
continue;
}
objj_msgSend(_64,"addObject:",objj_msgSend(_66,"representedObject"));
}
if(objj_msgSend(_62,"_inputElement").value!=""){
var _66=objj_msgSend(_62,"_representedObjectForEditingString:",objj_msgSend(_62,"_inputElement").value);
objj_msgSend(_64,"insertObject:atIndex:",_66,_selectedRange.location);
}
return _64;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_67,_68,_69){
with(_67){
if(_69!==nil&&!objj_msgSend(_69,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
objj_msgSendSuper({receiver:_67,super_class:objj_getClass("CPTokenField").super_class},"setObjectValue:",nil);
return;
}
var _6a=objj_msgSendSuper({receiver:_67,super_class:objj_getClass("CPTokenField").super_class},"objectValue");
if(_69===_6a||objj_msgSend(_69,"isEqualToArray:",_6a)){
return;
}
var _6b=objj_msgSend(_tokenScrollView,"documentView"),_6c=objj_msgSend(_67,"_tokens"),_6d=[];
if(_69!==nil){
for(var i=0,_6e=objj_msgSend(_69,"count");i<_6e;i++){
var _6f=_69[i],_70=objj_msgSend(_67,"_displayStringForRepresentedObject:",_6f),_71=nil;
for(var j=0,_72=objj_msgSend(_6c,"count");j<_72;j++){
var _73=_6c[j];
if(objj_msgSend(_73,"representedObject")==_6f){
objj_msgSend(_6c,"removeObjectAtIndex:",j);
_71=_73;
break;
}
}
if(_71===nil){
_71=objj_msgSend(objj_msgSend(_CPTokenFieldToken,"alloc"),"init");
objj_msgSend(_71,"setTokenField:",_67);
objj_msgSend(_71,"setRepresentedObject:",_6f);
objj_msgSend(_71,"setStringValue:",_70);
objj_msgSend(_6b,"addSubview:",_71);
}
_6d.push(_71);
}
}
for(var j=0,_72=objj_msgSend(_6c,"count");j<_72;j++){
objj_msgSend(_6c[j],"removeFromSuperview");
}
_value=_6d;
objj_msgSend(_67,"_selectToken:byExtendingSelection:",nil,NO);
objj_msgSend(_67,"_updatePlaceholderState");
_shouldScrollTo=_f;
objj_msgSend(_67,"setNeedsLayout");
objj_msgSend(_67,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setEnabled:"),function(_74,_75,_76){
with(_74){
objj_msgSendSuper({receiver:_74,super_class:objj_getClass("CPTokenField").super_class},"setEnabled:",_76);
for(var i=0,_77=objj_msgSend(objj_msgSend(_74,"_tokens"),"count");i<_77;i++){
var _78=objj_msgSend(objj_msgSend(_74,"_tokens"),"objectAtIndex:",i);
if(objj_msgSend(_78,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(_78,"setEnabled:",_76);
}
}
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_79,_7a,_7b,_7c){
with(_79){
_shouldNotifyTarget=NO;
objj_msgSendSuper({receiver:_79,super_class:objj_getClass("CPTokenField").super_class},"sendAction:to:",_7b,_7c);
}
}),new objj_method(sel_getUid("_setStringValue:"),function(_7d,_7e,_7f){
with(_7d){
}
}),new objj_method(sel_getUid("_inputElement"),function(_80,_81){
with(_80){
if(!_1){
_1=document.createElement("input");
_1.style.position="absolute";
_1.style.border="0px";
_1.style.padding="0px";
_1.style.margin="0px";
_1.style.whiteSpace="pre";
_1.style.background="transparent";
_1.style.outline="none";
_c=function(_82){
if(_4&&objj_msgSend(_4._tokenScrollView,"documentView")._DOMElement!=_1.parentNode){
return;
}
if(_4&&_4._preventResign){
return false;
}
if(!_6&&!_b){
objj_msgSend(objj_msgSend(_4,"window"),"makeFirstResponder:",nil);
return;
}
CPTokenFieldHandleBlur(_82,_1);
_7=YES;
return true;
};
CPTokenFieldHandleBlur=function(_83){
_4=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
_1.onblur=_c;
_3=_1;
}
if(CPFeatureIsCompatible(CPInputTypeCanBeChangedFeature)){
if(objj_msgSend(_4,"isSecure")){
_1.type="password";
}else{
_1.type="text";
}
return _1;
}
return _1;
}
}),new objj_method(sel_getUid("moveUp:"),function(_84,_85,_86){
with(_84){
objj_msgSend(objj_msgSend(_84,"_autocompleteMenu"),"selectPrevious");
objj_msgSend(objj_msgSend(objj_msgSend(_84,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("moveDown:"),function(_87,_88,_89){
with(_87){
objj_msgSend(objj_msgSend(_87,"_autocompleteMenu"),"selectNext");
objj_msgSend(objj_msgSend(objj_msgSend(_87,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("insertNewline:"),function(_8a,_8b,_8c){
with(_8a){
if(objj_msgSend(_8a,"hasThemeState:",CPThemeStateAutocompleting)){
objj_msgSend(_8a,"_autocompleteWithEvent:",objj_msgSend(CPApp,"currentEvent"));
}else{
objj_msgSend(_8a,"sendAction:to:",objj_msgSend(_8a,"action"),objj_msgSend(_8a,"target"));
objj_msgSend(objj_msgSend(_8a,"window"),"makeFirstResponder:",nil);
}
}
}),new objj_method(sel_getUid("insertTab:"),function(_8d,_8e,_8f){
with(_8d){
var _90=objj_msgSend(CPApp,"currentEvent");
if(objj_msgSend(_8d,"hasThemeState:",CPThemeStateAutocompleting)){
objj_msgSend(_8d,"_autocompleteWithEvent:",_90);
}else{
if(!(objj_msgSend(_90,"modifierFlags")&CPShiftKeyMask)){
objj_msgSend(objj_msgSend(_8d,"window"),"selectNextKeyView:",_8d);
}else{
objj_msgSend(objj_msgSend(_8d,"window"),"selectPreviousKeyView:",_8d);
}
}
}
}),new objj_method(sel_getUid("insertText:"),function(_91,_92,_93){
with(_91){
if(objj_msgSend(_tokenizingCharacterSet,"characterIsMember:",objj_msgSend(_93,"substringToIndex:",1))){
objj_msgSend(_91,"_autocompleteWithEvent:",objj_msgSend(CPApp,"currentEvent"));
}else{
if(_selectedRange.length){
objj_msgSend(_91,"_removeSelectedTokens:",_91);
objj_msgSend(_91,"layoutSubviews");
}
objj_msgSend(objj_msgSend(objj_msgSend(_91,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("cancelOperation:"),function(_94,_95,_96){
with(_94){
objj_msgSend(_94,"_hideCompletions");
}
}),new objj_method(sel_getUid("moveLeft:"),function(_97,_98,_99){
with(_97){
if((_selectedRange.location>0||_selectedRange.length)&&_1.value==""){
if(_selectedRange.length){
_selectedRange.length=0;
}else{
_selectedRange.location--;
}
objj_msgSend(_97,"setNeedsLayout");
_shouldScrollTo=_e;
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_97,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("moveLeftAndModifySelection:"),function(_9a,_9b,_9c){
with(_9a){
if(_selectedRange.location>0&&_1.value==""){
_selectedRange.location--;
_selectedRange.length++;
objj_msgSend(_9a,"setNeedsLayout");
_shouldScrollTo=_e;
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_9a,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("moveRight:"),function(_9d,_9e,_9f){
with(_9d){
if((_selectedRange.location<objj_msgSend(objj_msgSend(_9d,"_tokens"),"count")||_selectedRange.length)&&_1.value==""){
if(_selectedRange.length){
_selectedRange.location=((_selectedRange).location+(_selectedRange).length);
_selectedRange.length=0;
}else{
_selectedRange.location=MIN(objj_msgSend(objj_msgSend(_9d,"_tokens"),"count"),_selectedRange.location+_selectedRange.length+1);
}
objj_msgSend(_9d,"setNeedsLayout");
_shouldScrollTo=_f;
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_9d,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("moveRightAndModifySelection:"),function(_a0,_a1,_a2){
with(_a0){
if(((_selectedRange).location+(_selectedRange).length)<objj_msgSend(objj_msgSend(_a0,"_tokens"),"count")&&_1.value==""){
_selectedRange.length++;
objj_msgSend(_a0,"setNeedsLayout");
_shouldScrollTo=_f;
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_a0,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("deleteBackward:"),function(_a3,_a4,_a5){
with(_a3){
if(_1.value==""){
objj_msgSend(_a3,"_hideCompletions");
if(CPEmptyRange(_selectedRange)){
if(_selectedRange.location>0){
var _a6=objj_msgSend(objj_msgSend(_a3,"_tokens"),"objectAtIndex:",(_selectedRange.location-1));
objj_msgSend(_a3,"_selectToken:byExtendingSelection:",_a6,NO);
}
}else{
objj_msgSend(_a3,"_removeSelectedTokens:",nil);
}
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_a3,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("deleteForward:"),function(_a7,_a8,_a9){
with(_a7){
if(_1.value==""){
objj_msgSend(_a7,"_hideCompletions");
if(CPEmptyRange(_selectedRange)){
if(_selectedRange.location<objj_msgSend(objj_msgSend(_a7,"_tokens"),"count")){
objj_msgSend(_a7,"_deleteToken:",objj_msgSend(objj_msgSend(_a7,"_tokens"),"objectAtIndex:",[_selectedRange.location]));
}
}else{
objj_msgSend(_a7,"_removeSelectedTokens:",nil);
}
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_a7,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("_selectText:immediately:"),function(_aa,_ab,_ac,_ad){
with(_aa){
if((objj_msgSend(_aa,"isEditable")||objj_msgSend(_aa,"isSelectable"))){
objj_msgSendSuper({receiver:_aa,super_class:objj_getClass("CPTokenField").super_class},"_selectText:immediately:",_ac,_ad);
objj_msgSend(_aa,"_autocomplete");
_selectedRange={location:(0),length:objj_msgSend(objj_msgSend(_aa,"_tokens"),"count")};
objj_msgSend(_aa,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("keyDown:"),function(_ae,_af,_b0){
with(_ae){
_5=objj_msgSend(_ae,"stringValue");
objj_msgSend(_ae,"interpretKeyEvents:",[_b0]);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyUp:"),function(_b1,_b2,_b3){
with(_b1){
if(objj_msgSend(_b1,"stringValue")!==_5){
objj_msgSend(_b1,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_b1,nil));
}
objj_msgSend(objj_msgSend(objj_msgSend(_b1,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("textDidChange:"),function(_b4,_b5,_b6){
with(_b4){
if(objj_msgSend(_b6,"object")!==_b4){
return;
}
objj_msgSendSuper({receiver:_b4,super_class:objj_getClass("CPTokenField").super_class},"textDidChange:",_b6);
objj_msgSend(_b4,"_delayedShowCompletions");
_selectedRange.length=0;
objj_msgSend(_b4,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setCompletionDelay:"),function(_b7,_b8,_b9){
with(_b7){
_completionDelay=_b9;
}
}),new objj_method(sel_getUid("completionDelay"),function(_ba,_bb){
with(_ba){
return _completionDelay;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_bc,_bd){
with(_bc){
objj_msgSendSuper({receiver:_bc,super_class:objj_getClass("CPTokenField").super_class},"layoutSubviews");
objj_msgSend(_tokenScrollView,"setFrame:",objj_msgSend(_bc,"rectForEphemeralSubviewNamed:","content-view"));
var _be=objj_msgSend(_bc,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_be){
objj_msgSend(_be,"setHidden:",objj_msgSend(_bc,"stringValue")!=="");
}
var _bf=objj_msgSend(_bc,"frame"),_c0=objj_msgSend(_tokenScrollView,"documentView"),_c1=objj_msgSend(_bc,"_tokens"),_c2=objj_msgSend(_bc,"hasThemeState:",CPThemeStateAutocompleting);
if(!objj_msgSend(_c1,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
return;
}
var _c3={origin:{x:objj_msgSend(_c0,"bounds").origin.x,y:objj_msgSend(_c0,"bounds").origin.y},size:{width:objj_msgSend(_c0,"bounds").size.width,height:objj_msgSend(_c0,"bounds").size.height}},_c4=_c3.origin,_c5=_c3.size,_c6=CPPointMake(_c4.x,_c4.y),_c7=CPSizeMake(2,2),_c8=objj_msgSend(objj_msgSend(_bc,"window"),"firstResponder")==_bc,_c9=objj_msgSend(_CPTokenFieldToken,"new"),_ca=objj_msgSend(_bc,"currentValueForThemeAttribute:","font"),_cb=objj_msgSend(_ca,"defaultLineHeightForFont"),_cc=objj_msgSend(_bc,"currentValueForThemeAttribute:","editor-inset");
objj_msgSend(_c9,"sizeToFit");
var _cd=(objj_msgSend(_c9,"bounds").size.height);
var _ce=function(_cf,_d0){
var r={origin:{x:0,y:0},size:{width:_cf,height:_d0}};
if(_c6.x+_cf>=_c5.width&&_c6.x>_c4.x){
_c6.x=_c4.x;
_c6.y+=_d0+_c7.height;
}
r.origin.x=_c6.x;
r.origin.y=_c6.y;
var _d1=_c6.y+_cd+CEIL(_c7.height/2);
if((objj_msgSend(_c0,"bounds").size.height)<_d1){
objj_msgSend(_c0,"setFrameSize:",{width:(objj_msgSend(_tokenScrollView,"bounds").size.width),height:_d1});
}
_c6.x+=_cf+_c7.width;
return r;
};
var _d2=function(_d3){
var _d4=objj_msgSend(_bc,"_inputElement"),_d5=1;
if(_selectedRange.length===0){
_d5=objj_msgSend((_d4.value||"")+"X","sizeWithFont:",_ca).width;
if(_d3){
_d5=MAX(_c5.width-_c6.x-1,_d5);
}
}
_inputFrame=_ce(_d5,_cd);
_inputFrame.size.height=_cb;
_d4.style.left=(_inputFrame.origin.x+_cc.left)+"px";
_d4.style.top=(_inputFrame.origin.y+_cc.top)+"px";
_d4.style.width=_inputFrame.size.width+"px";
_d4.style.height=_inputFrame.size.height+"px";
if(_selectedRange.length==0){
objj_msgSend(objj_msgSend(_tokenScrollView,"documentView"),"scrollPoint:",{x:0,y:_inputFrame.origin.y});
}
};
for(var i=0,_d6=objj_msgSend(_c1,"count");i<_d6;i++){
if(_c8&&!_selectedRange.length&&i==((_selectedRange).location+(_selectedRange).length)){
_d2(false);
}
var _d7=objj_msgSend(_c1,"objectAtIndex:",i);
if(objj_msgSend(_d7,"isKindOfClass:",objj_msgSend(CPString,"class"))){
continue;
}
objj_msgSend(_d7,"setHighlighted:",CPLocationInRange(i,_selectedRange));
objj_msgSend(_d7,"sizeToFit");
var _d8=objj_msgSend(_c0,"bounds").size,_d9=objj_msgSend(_d7,"bounds").size,_da=_ce(_d9.width,_d9.height);
objj_msgSend(_d7,"setFrame:",_da);
}
if(_c8&&!_selectedRange.length&&((_selectedRange).location+(_selectedRange).length)>=objj_msgSend(_c1,"count")){
_d2(true);
}
if(_c8&&_selectedRange.length){
_inputFrame=nil;
var _db=objj_msgSend(_bc,"_inputElement");
_db.style.display="none";
}else{
if(_c8){
var _db=objj_msgSend(_bc,"_inputElement");
_db.style.display="block";
if(document.activeElement!==_db){
_db.focus();
}
}
}
var _dc=_c6.y+_cd+CEIL(_c7.height/2);
if((objj_msgSend(_c0,"bounds").size.height)>_dc){
objj_msgSend(_c0,"setFrameSize:",{width:(objj_msgSend(_tokenScrollView,"bounds").size.width),height:_dc});
}
if(_shouldScrollTo!==_d){
if(!(_c8&&_selectedRange.length==0)){
var _dd=_shouldScrollTo;
if(_dd===_e){
_dd=_c1[_selectedRange.location];
}else{
if(_dd===_f){
_dd=_c1[MAX(0,((_selectedRange).location+(_selectedRange).length)-1)];
}
}
objj_msgSend(_bc,"_scrollTokenViewToVisible:",_dd);
}
_shouldScrollTo=_d;
}
}
}),new objj_method(sel_getUid("_scrollTokenViewToVisible:"),function(_de,_df,_e0){
with(_de){
if(!_e0){
return;
}
return objj_msgSend(objj_msgSend(_tokenScrollView,"documentView"),"scrollPoint:",{x:0,y:objj_msgSend(_e0,"frameOrigin").y});
}
})]);
class_addMethods(_11,[new objj_method(sel_getUid("defaultTokenizingCharacterSet"),function(_e1,_e2){
with(_e1){
return objj_msgSend(CPCharacterSet,"characterSetWithCharactersInString:",",");
}
}),new objj_method(sel_getUid("defaultCompletionDelay"),function(_e3,_e4){
with(_e3){
return 0.5;
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(_e5,_e6){
with(_e5){
return "tokenfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_e7,_e8){
with(_e7){
return objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",{top:(0),right:(0),bottom:(0),left:(0)},"editor-inset");
}
})]);
var _10=objj_getClass("CPTokenField");
if(!_10){
throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
}
var _11=_10.isa;
class_addMethods(_10,[new objj_method(sel_getUid("_completionsForSubstring:indexOfToken:indexOfSelectedItem:"),function(_e9,_ea,_eb,_ec,_ed){
with(_e9){
if(objj_msgSend(objj_msgSend(_e9,"delegate"),"respondsToSelector:",sel_getUid("tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:"))){
return objj_msgSend(objj_msgSend(_e9,"delegate"),"tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:",_e9,_eb,_ec,_ed);
}
return [];
}
}),new objj_method(sel_getUid("_completionOrigin:"),function(_ee,_ef,_f0){
with(_ee){
var _f1=_inputFrame?objj_msgSend(objj_msgSend(_tokenScrollView,"documentView"),"convertRect:toView:",_inputFrame,_ee):objj_msgSend(_ee,"bounds");
return {x:(_f1.origin.x),y:(_f1.origin.y+_f1.size.height)};
}
}),new objj_method(sel_getUid("_displayStringForRepresentedObject:"),function(_f2,_f3,_f4){
with(_f2){
if(objj_msgSend(objj_msgSend(_f2,"delegate"),"respondsToSelector:",sel_getUid("tokenField:displayStringForRepresentedObject:"))){
var _f5=objj_msgSend(objj_msgSend(_f2,"delegate"),"tokenField:displayStringForRepresentedObject:",_f2,_f4);
if(_f5!==nil){
return _f5;
}
}
return _f4;
}
}),new objj_method(sel_getUid("_shouldAddObjects:atIndex:"),function(_f6,_f7,_f8,_f9){
with(_f6){
var _fa=objj_msgSend(_f6,"delegate");
if(objj_msgSend(_fa,"respondsToSelector:",sel_getUid("tokenField:shouldAddObjects:atIndex:"))){
var _fb=objj_msgSend(_fa,"tokenField:shouldAddObjects:atIndex:",_f6,_f8,_f9);
if(_fb!==nil){
return _fb;
}
}
return _f8;
}
}),new objj_method(sel_getUid("_representedObjectForEditingString:"),function(_fc,_fd,_fe){
with(_fc){
var _ff=objj_msgSend(_fc,"delegate");
if(objj_msgSend(_ff,"respondsToSelector:",sel_getUid("tokenField:representedObjectForEditingString:"))){
var _100=objj_msgSend(_ff,"tokenField:representedObjectForEditingString:",_fc,_fe);
if(_100!==nil&&_100!==undefined){
return _100;
}
}
return _fe;
}
}),new objj_method(sel_getUid("_delayedShowCompletions"),function(self,_101){
with(self){
objj_msgSend(objj_msgSend(self,"_autocompleteMenu"),"_delayedShowCompletions");
}
}),new objj_method(sel_getUid("_hideCompletions"),function(self,_102){
with(self){
objj_msgSend(_autocompleteMenu,"_hideCompletions");
}
})]);
var _10=objj_allocateClassPair(CPTextField,"_CPTokenFieldToken"),_11=_10.isa;
class_addIvars(_10,[new objj_ivar("_deleteButton"),new objj_ivar("_tokenField"),new objj_ivar("_representedObject")]);
objj_registerClassPair(_10);
class_addMethods(_10,[new objj_method(sel_getUid("initWithFrame:"),function(self,_103,_104){
with(self){
if(self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPTokenFieldToken").super_class},"initWithFrame:",_104)){
_deleteButton=objj_msgSend(objj_msgSend(_CPTokenFieldTokenCloseButton,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(self,"addSubview:",_deleteButton);
objj_msgSend(self,"setEditable:",NO);
objj_msgSend(self,"setHighlighted:",NO);
objj_msgSend(self,"setBezeled:",YES);
}
return self;
}
}),new objj_method(sel_getUid("tokenField"),function(self,_105){
with(self){
return _tokenField;
}
}),new objj_method(sel_getUid("setTokenField:"),function(self,_106,_107){
with(self){
_tokenField=_107;
}
}),new objj_method(sel_getUid("representedObject"),function(self,_108){
with(self){
return _representedObject;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(self,_109,_10a){
with(self){
_representedObject=_10a;
}
}),new objj_method(sel_getUid("_minimumFrameSize"),function(self,_10b){
with(self){
var size={width:0,height:0},_10c=objj_msgSend(self,"currentValueForThemeAttribute:","min-size"),_10d=objj_msgSend(self,"currentValueForThemeAttribute:","content-inset");
size.height=_10c.height;
size.width=MAX(_10c.width,objj_msgSend((objj_msgSend(self,"stringValue")||" "),"sizeWithFont:",objj_msgSend(self,"font")).width+_10d.left+_10d.right);
return size;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_10e){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPTokenFieldToken").super_class},"layoutSubviews");
var _10f=objj_msgSend(self,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_10f){
objj_msgSend(_deleteButton,"setTarget:",self);
objj_msgSend(_deleteButton,"setAction:",sel_getUid("_delete:"));
var _110=objj_msgSend(_10f,"frame"),_111=objj_msgSend(_deleteButton,"currentValueForThemeAttribute:","offset"),_112=objj_msgSend(_deleteButton,"currentValueForThemeAttribute:","min-size");
objj_msgSend(_deleteButton,"setFrame:",{origin:{x:CPRectGetMaxX(_110)-_111.x,y:CPRectGetMinY(_110)+_111.y},size:{width:_112.width,height:_112.height}});
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(self,_113,_114){
with(self){
objj_msgSend(_tokenField,"_mouseDownOnToken:withEvent:",self,_114);
}
}),new objj_method(sel_getUid("mouseUp:"),function(self,_115,_116){
with(self){
objj_msgSend(_tokenField,"_mouseUpOnToken:withEvent:",self,_116);
}
}),new objj_method(sel_getUid("_delete:"),function(self,_117,_118){
with(self){
objj_msgSend(_tokenField,"_deleteToken:",self);
}
})]);
class_addMethods(_11,[new objj_method(sel_getUid("defaultThemeClass"),function(self,_119){
with(self){
return "tokenfield-token";
}
})]);
var _10=objj_allocateClassPair(CPButton,"_CPTokenFieldTokenCloseButton"),_11=_10.isa;
objj_registerClassPair(_10);
class_addMethods(_11,[new objj_method(sel_getUid("themeAttributes"),function(self,_11a){
with(self){
var _11b=objj_msgSend(CPButton,"themeAttributes");
objj_msgSend(_11b,"setObject:forKey:",{x:15,y:5},"offset");
return _11b;
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(self,_11c){
with(self){
return "tokenfield-token-close-button";
}
})]);
var _11d="CPTokenFieldTokenizingCharacterSetKey",_11e="CPTokenFieldCompletionDelay";
var _10=objj_getClass("CPTokenField");
if(!_10){
throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
}
var _11=_10.isa;
class_addMethods(_10,[new objj_method(sel_getUid("initWithCoder:"),function(self,_11f,_120){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTokenField").super_class},"initWithCoder:",_120);
if(self){
_tokenizingCharacterSet=objj_msgSend(_120,"decodeObjectForKey:",_11d)||objj_msgSend(objj_msgSend(self,"class"),"defaultTokenizingCharacterSet");
_completionDelay=objj_msgSend(_120,"decodeDoubleForKey:",_11e)||objj_msgSend(objj_msgSend(self,"class"),"defaultCompletionDelay");
objj_msgSend(self,"_init");
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_121,_122){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTokenField").super_class},"encodeWithCoder:",_122);
objj_msgSend(_122,"encodeInt:forKey:",_tokenizingCharacterSet,_11d);
objj_msgSend(_122,"encodeDouble:forKey:",_completionDelay,_11e);
}
})]);
