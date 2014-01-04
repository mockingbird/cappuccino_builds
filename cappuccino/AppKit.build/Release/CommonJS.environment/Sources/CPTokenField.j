@STATIC;1.0;I;27;Foundation/CPCharacterSet.jI;23;Foundation/CPIndexSet.jI;20;Foundation/CPTimer.ji;10;CPButton.ji;14;CPScrollView.ji;13;CPTextField.ji;13;CPTableView.ji;10;CPWindow.ji;21;_CPAutocompleteMenu.jt;30538;
objj_executeFile("Foundation/CPCharacterSet.j",NO);
objj_executeFile("Foundation/CPIndexSet.j",NO);
objj_executeFile("Foundation/CPTimer.j",NO);
objj_executeFile("CPButton.j",YES);
objj_executeFile("CPScrollView.j",YES);
objj_executeFile("CPTextField.j",YES);
objj_executeFile("CPTableView.j",YES);
objj_executeFile("CPWindow.j",YES);
objj_executeFile("_CPAutocompleteMenu.j",YES);
var _1=0,_2=1,_3=2;
var _4=objj_allocateClassPair(CPTextField,"CPTokenField"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_tokenScrollView"),new objj_ivar("_shouldScrollTo"),new objj_ivar("_selectedRange"),new objj_ivar("_autocompleteMenu"),new objj_ivar("_inputFrame"),new objj_ivar("_completionDelay"),new objj_ivar("_tokenizingCharacterSet"),new objj_ivar("_mouseDownEvent"),new objj_ivar("_preventResign"),new objj_ivar("_shouldNotifyTarget")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("tokenizingCharacterSet"),function(_6,_7){
with(_6){
return _tokenizingCharacterSet;
}
}),new objj_method(sel_getUid("setTokenizingCharacterSet:"),function(_8,_9,_a){
with(_8){
_tokenizingCharacterSet=_a;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_b,_c,_d){
with(_b){
if(_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPTokenField").super_class},"initWithFrame:",_d)){
_completionDelay=objj_msgSend(objj_msgSend(_b,"class"),"defaultCompletionDelay");
_tokenizingCharacterSet=objj_msgSend(objj_msgSend(_b,"class"),"defaultTokenizingCharacterSet");
objj_msgSend(_b,"setBezeled:",YES);
objj_msgSend(_b,"_init");
objj_msgSend(_b,"setObjectValue:",[]);
objj_msgSend(_b,"setNeedsLayout");
}
return _b;
}
}),new objj_method(sel_getUid("_init"),function(_e,_f){
with(_e){
_selectedRange={location:(0),length:0};
var _10=objj_msgSend(_e,"frame");
_tokenScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_tokenScrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(_tokenScrollView,"setHasVerticalScroller:",NO);
objj_msgSend(_tokenScrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _11=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_11,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_tokenScrollView,"setDocumentView:",_11);
objj_msgSend(_e,"addSubview:",_tokenScrollView);
}
}),new objj_method(sel_getUid("_autocompleteMenu"),function(_12,_13){
with(_12){
if(!_autocompleteMenu){
_autocompleteMenu=objj_msgSend(objj_msgSend(_CPAutocompleteMenu,"alloc"),"initWithTextField:",_12);
}
return _autocompleteMenu;
}
}),new objj_method(sel_getUid("_autocompleteWithEvent:"),function(_14,_15,_16){
with(_14){
if(!objj_msgSend(_14,"_inputElement").value&&(!objj_msgSend(_autocompleteMenu,"contentArray")||!objj_msgSend(_14,"hasThemeState:",CPThemeStateAutocompleting))){
return;
}
objj_msgSend(_14,"_hideCompletions");
var _17=objj_msgSend(_autocompleteMenu,"selectedItem"),_18=_17!==""&&objj_msgSend(_14,"_inputElement").value!=="";
if(!_17){
_17=objj_msgSend(_14,"_inputElement").value;
}
if(!_17||_17===""){
var _19=objj_msgSend(_16,"charactersIgnoringModifiers"),_1a=objj_msgSend(_16,"modifierFlags");
if(_19===CPTabCharacter){
if(!(_1a&CPShiftKeyMask)){
objj_msgSend(objj_msgSend(_14,"window"),"selectNextKeyView:",_14);
}else{
objj_msgSend(objj_msgSend(_14,"window"),"selectPreviousKeyView:",_14);
}
}else{
objj_msgSend(objj_msgSend(_14,"window"),"makeFirstResponder:",nil);
}
return;
}
var _1b=objj_msgSend(_14,"objectValue");
if(_18){
objj_msgSend(_1b,"removeObjectAtIndex:",_selectedRange.location);
}
_17=objj_msgSend(_14,"_representedObjectForEditingString:",_17);
var _1c=objj_msgSend(_14,"_shouldAddObjects:atIndex:",objj_msgSend(CPArray,"arrayWithObject:",_17),_selectedRange.location),_1d=objj_msgSend(_1c,"count");
if(_1c){
for(var i=0;i<_1d;i++){
objj_msgSend(_1b,"insertObject:atIndex:",objj_msgSend(_1c,"objectAtIndex:",i),_selectedRange.location+i);
}
}
var _1e=_selectedRange.location;
objj_msgSend(_14,"setObjectValue:",_1b);
if(_1d){
_1e+=_1d;
}
_selectedRange={location:(_1e),length:0};
objj_msgSend(_14,"_inputElement").value="";
objj_msgSend(_14,"setNeedsLayout");
objj_msgSend(_14,"_controlTextDidChange");
}
}),new objj_method(sel_getUid("_autocomplete"),function(_1f,_20){
with(_1f){
objj_msgSend(_1f,"_autocompleteWithEvent:",nil);
}
}),new objj_method(sel_getUid("_selectToken:byExtendingSelection:"),function(_21,_22,_23,_24){
with(_21){
var _25=objj_msgSend(objj_msgSend(_21,"_tokens"),"indexOfObject:",_23);
if(_25==CPNotFound){
if(!_24){
_selectedRange={location:(objj_msgSend(objj_msgSend(_21,"_tokens"),"count")),length:0};
}
}else{
if(_24){
_selectedRange=CPUnionRange(_selectedRange,{location:(_25),length:1});
}else{
_selectedRange={location:(_25),length:1};
}
}
objj_msgSend(_21,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_deselectToken:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(objj_msgSend(_26,"_tokens"),"indexOfObject:",_28);
if(CPLocationInRange(_29,_selectedRange)){
_selectedRange={location:(MAX(_29,_selectedRange.location)),length:MIN(_selectedRange.length,_29-_selectedRange.location)};
}
objj_msgSend(_26,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_deleteToken:"),function(_2a,_2b,_2c){
with(_2a){
var _2d=objj_msgSend(objj_msgSend(_2a,"_tokens"),"indexOfObject:",_2c),_2e=objj_msgSend(_2a,"objectValue");
if(_2d<_selectedRange.location){
_selectedRange.location--;
}else{
objj_msgSend(_2a,"_deselectToken:",_2c);
}
var _2f=CPMakeRangeCopy(_selectedRange);
objj_msgSend(_2e,"removeObjectAtIndex:",_2d);
objj_msgSend(_2a,"setObjectValue:",_2e);
_selectedRange=_2f;
objj_msgSend(_2a,"setNeedsLayout");
objj_msgSend(_2a,"_controlTextDidChange");
}
}),new objj_method(sel_getUid("_controlTextDidChange"),function(_30,_31){
with(_30){
var _32=objj_msgSend(objj_msgSend(_30,"class"),"_binderClassForBinding:",CPValueBinding),_33=objj_msgSend(_32,"getBinding:forObject:",CPValueBinding,_30);
if(_33){
objj_msgSend(_33,"reverseSetValueFor:","objectValue");
}
objj_msgSend(_30,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_30,nil));
_shouldNotifyTarget=YES;
}
}),new objj_method(sel_getUid("_removeSelectedTokens:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(_34,"objectValue");
for(var i=_selectedRange.length-1;i>=0;i--){
objj_msgSend(_37,"removeObjectAtIndex:",_selectedRange.location+i);
}
var _38=_selectedRange.location;
objj_msgSend(_34,"setObjectValue:",_37);
_selectedRange={location:(_38),length:0};
objj_msgSend(_34,"_controlTextDidChange");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_39,_3a){
with(_39){
if((objj_msgSend(objj_msgSend(_39,"_tokens"),"count")===0)&&!objj_msgSend(_39,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_39,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_39,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_3b,_3c){
with(_3b){
if(CPTokenFieldInputOwner&&objj_msgSend(CPTokenFieldInputOwner,"window")!==objj_msgSend(_3b,"window")){
objj_msgSend(objj_msgSend(CPTokenFieldInputOwner,"window"),"makeFirstResponder:",nil);
}
objj_msgSend(_3b,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_3b,"_updatePlaceholderState");
objj_msgSend(_3b,"setNeedsLayout");
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_3d,_3e){
with(_3d){
if(_preventResign){
return NO;
}
objj_msgSend(_3d,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_3d,"_autocomplete");
objj_msgSend(_3d,"_updatePlaceholderState");
objj_msgSend(_3d,"setNeedsLayout");
if(_shouldNotifyTarget){
_shouldNotifyTarget=NO;
objj_msgSend(_3d,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_3d,nil));
if(objj_msgSend(_3d,"sendsActionOnEndEditing")){
objj_msgSend(_3d,"sendAction:to:",objj_msgSend(_3d,"action"),objj_msgSend(_3d,"target"));
}
}
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_3f,_40,_41){
with(_3f){
_preventResign=YES;
_mouseDownEvent=_41;
objj_msgSend(_3f,"_selectToken:byExtendingSelection:",nil,NO);
objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("CPTokenField").super_class},"mouseDown:",_41);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_42,_43,_44){
with(_42){
_preventResign=NO;
_mouseDownEvent=nil;
}
}),new objj_method(sel_getUid("_mouseDownOnToken:withEvent:"),function(_45,_46,_47,_48){
with(_45){
_preventResign=YES;
_mouseDownEvent=_48;
}
}),new objj_method(sel_getUid("_mouseUpOnToken:withEvent:"),function(_49,_4a,_4b,_4c){
with(_49){
if(_mouseDownEvent&&(objj_msgSend(_mouseDownEvent,"locationInWindow").x==objj_msgSend(_4c,"locationInWindow").x&&objj_msgSend(_mouseDownEvent,"locationInWindow").y==objj_msgSend(_4c,"locationInWindow").y)){
objj_msgSend(_49,"_selectToken:byExtendingSelection:",_4b,objj_msgSend(_4c,"modifierFlags")&CPShiftKeyMask);
objj_msgSend(objj_msgSend(_49,"window"),"makeFirstResponder:",_49);
_shouldScrollTo=_4b;
}
_preventResign=NO;
}
}),new objj_method(sel_getUid("_tokens"),function(_4d,_4e){
with(_4d){
return objj_msgSendSuper({receiver:_4d,super_class:objj_getClass("CPTokenField").super_class},"objectValue");
}
}),new objj_method(sel_getUid("stringValue"),function(_4f,_50){
with(_4f){
return objj_msgSend(objj_msgSend(_4f,"objectValue"),"componentsJoinedByString:",",");
}
}),new objj_method(sel_getUid("objectValue"),function(_51,_52){
with(_51){
var _53=[];
for(var i=0,_54=objj_msgSend(objj_msgSend(_51,"_tokens"),"count");i<_54;i++){
var _55=objj_msgSend(objj_msgSend(_51,"_tokens"),"objectAtIndex:",i);
if(objj_msgSend(_55,"isKindOfClass:",objj_msgSend(CPString,"class"))){
continue;
}
objj_msgSend(_53,"addObject:",objj_msgSend(_55,"representedObject"));
}
return _53;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_56,_57,_58){
with(_56){
if(_58!==nil&&!objj_msgSend(_58,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
objj_msgSendSuper({receiver:_56,super_class:objj_getClass("CPTokenField").super_class},"setObjectValue:",nil);
return;
}
var _59=objj_msgSendSuper({receiver:_56,super_class:objj_getClass("CPTokenField").super_class},"objectValue");
if(_58===_59||objj_msgSend(_58,"isEqualToArray:",_59)){
return;
}
var _5a=objj_msgSend(_tokenScrollView,"documentView"),_5b=objj_msgSend(_56,"_tokens"),_5c=[];
if(_58!==nil){
for(var i=0,_5d=objj_msgSend(_58,"count");i<_5d;i++){
var _5e=_58[i],_5f=objj_msgSend(_56,"_displayStringForRepresentedObject:",_5e),_60=nil;
for(var j=0,_61=objj_msgSend(_5b,"count");j<_61;j++){
var _62=_5b[j];
if(objj_msgSend(_62,"representedObject")==_5e){
objj_msgSend(_5b,"removeObjectAtIndex:",j);
_60=_62;
break;
}
}
if(_60===nil){
_60=objj_msgSend(objj_msgSend(_CPTokenFieldToken,"alloc"),"init");
objj_msgSend(_60,"setTokenField:",_56);
objj_msgSend(_60,"setRepresentedObject:",_5e);
objj_msgSend(_60,"setStringValue:",_5f);
objj_msgSend(_5a,"addSubview:",_60);
}
_5c.push(_60);
}
}
for(var j=0,_61=objj_msgSend(_5b,"count");j<_61;j++){
objj_msgSend(_5b[j],"removeFromSuperview");
}
_value=_5c;
objj_msgSend(_56,"_selectToken:byExtendingSelection:",nil,NO);
objj_msgSend(_56,"_updatePlaceholderState");
_shouldScrollTo=_3;
objj_msgSend(_56,"setNeedsLayout");
objj_msgSend(_56,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setEnabled:"),function(_63,_64,_65){
with(_63){
objj_msgSendSuper({receiver:_63,super_class:objj_getClass("CPTokenField").super_class},"setEnabled:",_65);
for(var i=0,_66=objj_msgSend(objj_msgSend(_63,"_tokens"),"count");i<_66;i++){
var _67=objj_msgSend(objj_msgSend(_63,"_tokens"),"objectAtIndex:",i);
if(objj_msgSend(_67,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(_67,"setEnabled:",_65);
}
}
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_68,_69,_6a,_6b){
with(_68){
_shouldNotifyTarget=NO;
objj_msgSendSuper({receiver:_68,super_class:objj_getClass("CPTokenField").super_class},"sendAction:to:",_6a,_6b);
}
}),new objj_method(sel_getUid("_setStringValue:"),function(_6c,_6d,_6e){
with(_6c){
}
}),new objj_method(sel_getUid("moveUp:"),function(_6f,_70,_71){
with(_6f){
objj_msgSend(objj_msgSend(_6f,"_autocompleteMenu"),"selectPrevious");
objj_msgSend(objj_msgSend(objj_msgSend(_6f,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("moveDown:"),function(_72,_73,_74){
with(_72){
objj_msgSend(objj_msgSend(_72,"_autocompleteMenu"),"selectNext");
objj_msgSend(objj_msgSend(objj_msgSend(_72,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}
}),new objj_method(sel_getUid("insertNewline:"),function(_75,_76,_77){
with(_75){
if(objj_msgSend(_75,"hasThemeState:",CPThemeStateAutocompleting)){
objj_msgSend(_75,"_autocompleteWithEvent:",objj_msgSend(CPApp,"currentEvent"));
}else{
objj_msgSend(_75,"sendAction:to:",objj_msgSend(_75,"action"),objj_msgSend(_75,"target"));
objj_msgSend(objj_msgSend(_75,"window"),"makeFirstResponder:",nil);
}
}
}),new objj_method(sel_getUid("insertTab:"),function(_78,_79,_7a){
with(_78){
var _7b=objj_msgSend(CPApp,"currentEvent");
if(objj_msgSend(_78,"hasThemeState:",CPThemeStateAutocompleting)){
objj_msgSend(_78,"_autocompleteWithEvent:",_7b);
}else{
if(!(objj_msgSend(_7b,"modifierFlags")&CPShiftKeyMask)){
objj_msgSend(objj_msgSend(_78,"window"),"selectNextKeyView:",_78);
}else{
objj_msgSend(objj_msgSend(_78,"window"),"selectPreviousKeyView:",_78);
}
}
}
}),new objj_method(sel_getUid("insertText:"),function(_7c,_7d,_7e){
with(_7c){
if(objj_msgSend(_tokenizingCharacterSet,"characterIsMember:",objj_msgSend(_7e,"substringToIndex:",1))){
objj_msgSend(_7c,"_autocompleteWithEvent:",objj_msgSend(CPApp,"currentEvent"));
}else{
if(_selectedRange.length){
objj_msgSend(_7c,"_removeSelectedTokens:",_7c);
objj_msgSend(_7c,"layoutSubviews");
}
objj_msgSend(objj_msgSend(objj_msgSend(_7c,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("cancelOperation:"),function(_7f,_80,_81){
with(_7f){
objj_msgSend(_7f,"_hideCompletions");
}
}),new objj_method(sel_getUid("moveLeft:"),function(_82,_83,_84){
with(_82){
if((_selectedRange.location>0||_selectedRange.length)&&CPTokenFieldDOMInputElement.value==""){
if(_selectedRange.length){
_selectedRange.length=0;
}else{
_selectedRange.location--;
}
objj_msgSend(_82,"setNeedsLayout");
_shouldScrollTo=_2;
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_82,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("moveLeftAndModifySelection:"),function(_85,_86,_87){
with(_85){
if(_selectedRange.location>0&&CPTokenFieldDOMInputElement.value==""){
_selectedRange.location--;
_selectedRange.length++;
objj_msgSend(_85,"setNeedsLayout");
_shouldScrollTo=_2;
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_85,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("moveRight:"),function(_88,_89,_8a){
with(_88){
if((_selectedRange.location<objj_msgSend(objj_msgSend(_88,"_tokens"),"count")||_selectedRange.length)&&CPTokenFieldDOMInputElement.value==""){
if(_selectedRange.length){
_selectedRange.location=((_selectedRange).location+(_selectedRange).length);
_selectedRange.length=0;
}else{
_selectedRange.location=MIN(objj_msgSend(objj_msgSend(_88,"_tokens"),"count"),_selectedRange.location+_selectedRange.length+1);
}
objj_msgSend(_88,"setNeedsLayout");
_shouldScrollTo=_3;
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_88,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("moveRightAndModifySelection:"),function(_8b,_8c,_8d){
with(_8b){
if(((_selectedRange).location+(_selectedRange).length)<objj_msgSend(objj_msgSend(_8b,"_tokens"),"count")&&CPTokenFieldDOMInputElement.value==""){
_selectedRange.length++;
objj_msgSend(_8b,"setNeedsLayout");
_shouldScrollTo=_3;
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_8b,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("deleteBackward:"),function(_8e,_8f,_90){
with(_8e){
if(CPTokenFieldDOMInputElement.value==""){
objj_msgSend(_8e,"_hideCompletions");
if(CPEmptyRange(_selectedRange)){
if(_selectedRange.location>0){
var _91=objj_msgSend(objj_msgSend(_8e,"_tokens"),"objectAtIndex:",(_selectedRange.location-1));
objj_msgSend(_8e,"_selectToken:byExtendingSelection:",_91,NO);
}
}else{
objj_msgSend(_8e,"_removeSelectedTokens:",nil);
}
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_8e,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("deleteForward:"),function(_92,_93,_94){
with(_92){
if(CPTokenFieldDOMInputElement.value==""){
objj_msgSend(_92,"_hideCompletions");
if(CPEmptyRange(_selectedRange)){
if(_selectedRange.location<objj_msgSend(objj_msgSend(_92,"_tokens"),"count")){
objj_msgSend(_92,"_deleteToken:",objj_msgSend(objj_msgSend(_92,"_tokens"),"objectAtIndex:",[_selectedRange.location]));
}
}else{
objj_msgSend(_92,"_removeSelectedTokens:",nil);
}
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_92,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("_selectText:immediately:"),function(_95,_96,_97,_98){
with(_95){
if((objj_msgSend(_95,"isEditable")||objj_msgSend(_95,"isSelectable"))){
objj_msgSendSuper({receiver:_95,super_class:objj_getClass("CPTokenField").super_class},"_selectText:immediately:",_97,_98);
objj_msgSend(_95,"_autocomplete");
_selectedRange={location:(0),length:objj_msgSend(objj_msgSend(_95,"_tokens"),"count")};
objj_msgSend(_95,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("keyDown:"),function(_99,_9a,_9b){
with(_99){
CPTokenFieldTextDidChangeValue=objj_msgSend(_99,"stringValue");
objj_msgSend(_99,"interpretKeyEvents:",[_9b]);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyUp:"),function(_9c,_9d,_9e){
with(_9c){
if(objj_msgSend(_9c,"stringValue")!==CPTokenFieldTextDidChangeValue){
objj_msgSend(_9c,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_9c,nil));
}
objj_msgSend(objj_msgSend(objj_msgSend(_9c,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("textDidChange:"),function(_9f,_a0,_a1){
with(_9f){
if(objj_msgSend(_a1,"object")!==_9f){
return;
}
objj_msgSendSuper({receiver:_9f,super_class:objj_getClass("CPTokenField").super_class},"textDidChange:",_a1);
objj_msgSend(_9f,"_delayedShowCompletions");
_selectedRange.length=0;
objj_msgSend(_9f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setCompletionDelay:"),function(_a2,_a3,_a4){
with(_a2){
_completionDelay=_a4;
}
}),new objj_method(sel_getUid("completionDelay"),function(_a5,_a6){
with(_a5){
return _completionDelay;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_a7,_a8){
with(_a7){
objj_msgSendSuper({receiver:_a7,super_class:objj_getClass("CPTokenField").super_class},"layoutSubviews");
objj_msgSend(_tokenScrollView,"setFrame:",objj_msgSend(_a7,"rectForEphemeralSubviewNamed:","content-view"));
var _a9=objj_msgSend(_a7,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_a9){
objj_msgSend(_a9,"setHidden:",objj_msgSend(_a7,"stringValue")!=="");
}
var _aa=objj_msgSend(_a7,"frame"),_ab=objj_msgSend(_tokenScrollView,"documentView"),_ac=objj_msgSend(_a7,"_tokens"),_ad=objj_msgSend(_a7,"hasThemeState:",CPThemeStateAutocompleting);
if(!objj_msgSend(_ac,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
return;
}
var _ae={origin:{x:objj_msgSend(_ab,"bounds").origin.x,y:objj_msgSend(_ab,"bounds").origin.y},size:{width:objj_msgSend(_ab,"bounds").size.width,height:objj_msgSend(_ab,"bounds").size.height}},_af=_ae.origin,_b0=_ae.size,_b1=CPPointMake(_af.x,_af.y),_b2=CPSizeMake(2,2),_b3=objj_msgSend(objj_msgSend(_a7,"window"),"firstResponder")==_a7,_b4=objj_msgSend(_CPTokenFieldToken,"new"),_b5=objj_msgSend(_a7,"currentValueForThemeAttribute:","font"),_b6=objj_msgSend(_b5,"defaultLineHeightForFont"),_b7=objj_msgSend(_a7,"currentValueForThemeAttribute:","editor-inset");
objj_msgSend(_b4,"sizeToFit");
var _b8=(objj_msgSend(_b4,"bounds").size.height);
var _b9=function(_ba,_bb){
var r={origin:{x:0,y:0},size:{width:_ba,height:_bb}};
if(_b1.x+_ba>=_b0.width&&_b1.x>_af.x){
_b1.x=_af.x;
_b1.y+=_bb+_b2.height;
}
r.origin.x=_b1.x;
r.origin.y=_b1.y;
var _bc=_b1.y+_b8+CEIL(_b2.height/2);
if((objj_msgSend(_ab,"bounds").size.height)<_bc){
objj_msgSend(_ab,"setFrameSize:",{width:(objj_msgSend(_tokenScrollView,"bounds").size.width),height:_bc});
}
_b1.x+=_ba+_b2.width;
return r;
};
var _bd=function(_be){
var _bf=objj_msgSend(_a7,"_inputElement"),_c0=1;
if(_selectedRange.length===0){
_c0=objj_msgSend((_bf.value||"")+"X","sizeWithFont:",_b5).width;
if(_be){
_c0=MAX(_b0.width-_b1.x-1,_c0);
}
}
_inputFrame=_b9(_c0,_b8);
_inputFrame.size.height=_b6;
_bf.style.left=(_inputFrame.origin.x+_b7.left)+"px";
_bf.style.top=(_inputFrame.origin.y+_b7.top)+"px";
_bf.style.width=_inputFrame.size.width+"px";
_bf.style.height=_inputFrame.size.height+"px";
if(_selectedRange.length==0){
objj_msgSend(objj_msgSend(_tokenScrollView,"documentView"),"scrollPoint:",{x:0,y:_inputFrame.origin.y});
}
};
for(var i=0,_c1=objj_msgSend(_ac,"count");i<_c1;i++){
if(_b3&&!_selectedRange.length&&i==((_selectedRange).location+(_selectedRange).length)){
_bd(false);
}
var _c2=objj_msgSend(_ac,"objectAtIndex:",i);
if(objj_msgSend(_c2,"isKindOfClass:",objj_msgSend(CPString,"class"))){
continue;
}
objj_msgSend(_c2,"setHighlighted:",CPLocationInRange(i,_selectedRange));
objj_msgSend(_c2,"sizeToFit");
var _c3=objj_msgSend(_ab,"bounds").size,_c4=objj_msgSend(_c2,"bounds").size,_c5=_b9(_c4.width,_c4.height);
objj_msgSend(_c2,"setFrame:",_c5);
}
if(_b3&&!_selectedRange.length&&((_selectedRange).location+(_selectedRange).length)>=objj_msgSend(_ac,"count")){
_bd(true);
}
if(_b3&&_selectedRange.length){
_inputFrame=nil;
var _c6=objj_msgSend(_a7,"_inputElement");
_c6.style.display="none";
}else{
if(_b3){
var _c6=objj_msgSend(_a7,"_inputElement");
_c6.style.display="block";
if(document.activeElement!==_c6){
_c6.focus();
}
}
}
var _c7=_b1.y+_b8+CEIL(_b2.height/2);
if((objj_msgSend(_ab,"bounds").size.height)>_c7){
objj_msgSend(_ab,"setFrameSize:",{width:(objj_msgSend(_tokenScrollView,"bounds").size.width),height:_c7});
}
if(_shouldScrollTo!==_1){
if(!(_b3&&_selectedRange.length==0)){
var _c8=_shouldScrollTo;
if(_c8===_2){
_c8=_ac[_selectedRange.location];
}else{
if(_c8===_3){
_c8=_ac[MAX(0,((_selectedRange).location+(_selectedRange).length)-1)];
}
}
objj_msgSend(_a7,"_scrollTokenViewToVisible:",_c8);
}
_shouldScrollTo=_1;
}
}
}),new objj_method(sel_getUid("_scrollTokenViewToVisible:"),function(_c9,_ca,_cb){
with(_c9){
if(!_cb){
return;
}
return objj_msgSend(objj_msgSend(_tokenScrollView,"documentView"),"scrollPoint:",{x:0,y:objj_msgSend(_cb,"frameOrigin").y});
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("defaultTokenizingCharacterSet"),function(_cc,_cd){
with(_cc){
return objj_msgSend(CPCharacterSet,"characterSetWithCharactersInString:",",");
}
}),new objj_method(sel_getUid("defaultCompletionDelay"),function(_ce,_cf){
with(_ce){
return 0.5;
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(_d0,_d1){
with(_d0){
return "tokenfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_d2,_d3){
with(_d2){
return objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",{top:(0),right:(0),bottom:(0),left:(0)},"editor-inset");
}
})]);
var _4=objj_getClass("CPTokenField");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("_completionsForSubstring:indexOfToken:indexOfSelectedItem:"),function(_d4,_d5,_d6,_d7,_d8){
with(_d4){
if(objj_msgSend(objj_msgSend(_d4,"delegate"),"respondsToSelector:",sel_getUid("tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:"))){
return objj_msgSend(objj_msgSend(_d4,"delegate"),"tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:",_d4,_d6,_d7,_d8);
}
return [];
}
}),new objj_method(sel_getUid("_completionOrigin:"),function(_d9,_da,_db){
with(_d9){
var _dc=_inputFrame?objj_msgSend(objj_msgSend(_tokenScrollView,"documentView"),"convertRect:toView:",_inputFrame,_d9):objj_msgSend(_d9,"bounds");
return {x:(_dc.origin.x),y:(_dc.origin.y+_dc.size.height)};
}
}),new objj_method(sel_getUid("_displayStringForRepresentedObject:"),function(_dd,_de,_df){
with(_dd){
if(objj_msgSend(objj_msgSend(_dd,"delegate"),"respondsToSelector:",sel_getUid("tokenField:displayStringForRepresentedObject:"))){
var _e0=objj_msgSend(objj_msgSend(_dd,"delegate"),"tokenField:displayStringForRepresentedObject:",_dd,_df);
if(_e0!==nil){
return _e0;
}
}
return _df;
}
}),new objj_method(sel_getUid("_shouldAddObjects:atIndex:"),function(_e1,_e2,_e3,_e4){
with(_e1){
var _e5=objj_msgSend(_e1,"delegate");
if(objj_msgSend(_e5,"respondsToSelector:",sel_getUid("tokenField:shouldAddObjects:atIndex:"))){
var _e6=objj_msgSend(_e5,"tokenField:shouldAddObjects:atIndex:",_e1,_e3,_e4);
if(_e6!==nil){
return _e6;
}
}
return _e3;
}
}),new objj_method(sel_getUid("_representedObjectForEditingString:"),function(_e7,_e8,_e9){
with(_e7){
var _ea=objj_msgSend(_e7,"delegate");
if(objj_msgSend(_ea,"respondsToSelector:",sel_getUid("tokenField:representedObjectForEditingString:"))){
var _eb=objj_msgSend(_ea,"tokenField:representedObjectForEditingString:",_e7,_e9);
if(_eb!==nil&&_eb!==undefined){
return _eb;
}
}
return _e9;
}
}),new objj_method(sel_getUid("_delayedShowCompletions"),function(_ec,_ed){
with(_ec){
objj_msgSend(objj_msgSend(_ec,"_autocompleteMenu"),"_delayedShowCompletions");
}
}),new objj_method(sel_getUid("_hideCompletions"),function(_ee,_ef){
with(_ee){
objj_msgSend(_autocompleteMenu,"_hideCompletions");
}
})]);
var _4=objj_allocateClassPair(CPTextField,"_CPTokenFieldToken"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_deleteButton"),new objj_ivar("_tokenField"),new objj_ivar("_representedObject")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_f0,_f1,_f2){
with(_f0){
if(_f0=objj_msgSendSuper({receiver:_f0,super_class:objj_getClass("_CPTokenFieldToken").super_class},"initWithFrame:",_f2)){
_deleteButton=objj_msgSend(objj_msgSend(_CPTokenFieldTokenCloseButton,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(_f0,"addSubview:",_deleteButton);
objj_msgSend(_f0,"setEditable:",NO);
objj_msgSend(_f0,"setHighlighted:",NO);
objj_msgSend(_f0,"setBezeled:",YES);
}
return _f0;
}
}),new objj_method(sel_getUid("tokenField"),function(_f3,_f4){
with(_f3){
return _tokenField;
}
}),new objj_method(sel_getUid("setTokenField:"),function(_f5,_f6,_f7){
with(_f5){
_tokenField=_f7;
}
}),new objj_method(sel_getUid("representedObject"),function(_f8,_f9){
with(_f8){
return _representedObject;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_fa,_fb,_fc){
with(_fa){
_representedObject=_fc;
}
}),new objj_method(sel_getUid("_minimumFrameSize"),function(_fd,_fe){
with(_fd){
var _ff={width:0,height:0},_100=objj_msgSend(_fd,"currentValueForThemeAttribute:","min-size"),_101=objj_msgSend(_fd,"currentValueForThemeAttribute:","content-inset");
_ff.height=_100.height;
_ff.width=MAX(_100.width,objj_msgSend((objj_msgSend(_fd,"stringValue")||" "),"sizeWithFont:",objj_msgSend(_fd,"font")).width+_101.left+_101.right);
return _ff;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_102){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPTokenFieldToken").super_class},"layoutSubviews");
var _103=objj_msgSend(self,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_103){
objj_msgSend(_deleteButton,"setTarget:",self);
objj_msgSend(_deleteButton,"setAction:",sel_getUid("_delete:"));
var _104=objj_msgSend(_103,"frame"),_105=objj_msgSend(_deleteButton,"currentValueForThemeAttribute:","offset"),_106=objj_msgSend(_deleteButton,"currentValueForThemeAttribute:","min-size");
objj_msgSend(_deleteButton,"setFrame:",{origin:{x:CPRectGetMaxX(_104)-_105.x,y:CPRectGetMinY(_104)+_105.y},size:{width:_106.width,height:_106.height}});
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(self,_107,_108){
with(self){
objj_msgSend(_tokenField,"_mouseDownOnToken:withEvent:",self,_108);
}
}),new objj_method(sel_getUid("mouseUp:"),function(self,_109,_10a){
with(self){
objj_msgSend(_tokenField,"_mouseUpOnToken:withEvent:",self,_10a);
}
}),new objj_method(sel_getUid("_delete:"),function(self,_10b,_10c){
with(self){
objj_msgSend(_tokenField,"_deleteToken:",self);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("defaultThemeClass"),function(self,_10d){
with(self){
return "tokenfield-token";
}
})]);
var _4=objj_allocateClassPair(CPButton,"_CPTokenFieldTokenCloseButton"),_5=_4.isa;
objj_registerClassPair(_4);
class_addMethods(_5,[new objj_method(sel_getUid("themeAttributes"),function(self,_10e){
with(self){
var _10f=objj_msgSend(CPButton,"themeAttributes");
objj_msgSend(_10f,"setObject:forKey:",{x:15,y:5},"offset");
return _10f;
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(self,_110){
with(self){
return "tokenfield-token-close-button";
}
})]);
var _111="CPTokenFieldTokenizingCharacterSetKey",_112="CPTokenFieldCompletionDelay";
var _4=objj_getClass("CPTokenField");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(self,_113,_114){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTokenField").super_class},"initWithCoder:",_114);
if(self){
_tokenizingCharacterSet=objj_msgSend(_114,"decodeObjectForKey:",_111)||objj_msgSend(objj_msgSend(self,"class"),"defaultTokenizingCharacterSet");
_completionDelay=objj_msgSend(_114,"decodeDoubleForKey:",_112)||objj_msgSend(objj_msgSend(self,"class"),"defaultCompletionDelay");
objj_msgSend(self,"_init");
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_115,_116){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPTokenField").super_class},"encodeWithCoder:",_116);
objj_msgSend(_116,"encodeInt:forKey:",_tokenizingCharacterSet,_111);
objj_msgSend(_116,"encodeDouble:forKey:",_completionDelay,_112);
}
})]);
