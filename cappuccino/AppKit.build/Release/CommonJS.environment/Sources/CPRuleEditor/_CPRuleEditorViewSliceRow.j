@STATIC;1.0;i;24;_CPRuleEditorViewSlice.ji;26;_CPRuleEditorPopUpButton.ji;14;CPRuleEditor.jt;15860;
objj_executeFile("_CPRuleEditorViewSlice.j",YES);
objj_executeFile("_CPRuleEditorPopUpButton.j",YES);
objj_executeFile("CPRuleEditor.j",YES);
var _1=16,_2=16;
var _3=objj_allocateClassPair(_CPRuleEditorViewSlice,"_CPRuleEditorViewSliceRow"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_ruleOptionViews"),new objj_ivar("_ruleOptionFrames"),new objj_ivar("_correspondingRuleItems"),new objj_ivar("_ruleOptionInitialViewFrames"),new objj_ivar("_addButton"),new objj_ivar("_subtractButton"),new objj_ivar("editable"),new objj_ivar("_rowType"),new objj_ivar("_plusButtonRowType")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("_rowType"),function(_5,_6){
with(_5){
return _rowType;
}
}),new objj_method(sel_getUid("_setRowType:"),function(_7,_8,_9){
with(_7){
_rowType=_9;
}
}),new objj_method(sel_getUid("initWithFrame:ruleEditorView:"),function(_a,_b,_c,_d){
with(_a){
if(_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class},"initWithFrame:ruleEditorView:",_c,_d)){
objj_msgSend(_a,"_initShared");
}
return _a;
}
}),new objj_method(sel_getUid("_initShared"),function(_e,_f){
with(_e){
_correspondingRuleItems=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
_ruleOptionFrames=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
_ruleOptionInitialViewFrames=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
_ruleOptionViews=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
editable=objj_msgSend(_ruleEditor,"isEditable");
_addButton=objj_msgSend(_e,"_createAddRowButton");
_subtractButton=objj_msgSend(_e,"_createDeleteRowButton");
objj_msgSend(_addButton,"setToolTip:",objj_msgSend(_ruleEditor,"_toolTipForAddSimpleRowButton"));
objj_msgSend(_subtractButton,"setToolTip:",objj_msgSend(_ruleEditor,"_toolTipForDeleteRowButton"));
objj_msgSend(_addButton,"setHidden:",!editable);
objj_msgSend(_subtractButton,"setHidden:",!editable);
objj_msgSend(_e,"addSubview:",_addButton);
objj_msgSend(_e,"addSubview:",_subtractButton);
objj_msgSend(_e,"setAutoresizingMask:",CPViewWidthSizable);
var _10=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_10,"addObserver:selector:name:object:",_e,sel_getUid("_textDidChange:"),CPControlTextDidChangeNotification,nil);
}
}),new objj_method(sel_getUid("_createRowButton"),function(_11,_12){
with(_11){
var _13=objj_msgSend(objj_msgSend(_CPRuleEditorButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_13,"setFont:",objj_msgSend(CPFont,"boldFontWithName:size:","Apple Symbol",12));
objj_msgSend(_13,"setTextColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",150/255,1));
objj_msgSend(_13,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_13,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_13,"setImagePosition:",CPImageOnly);
return _13;
}
}),new objj_method(sel_getUid("_createAddRowButton"),function(_14,_15){
with(_14){
var _16=objj_msgSend(_14,"_createRowButton");
objj_msgSend(_16,"setImage:",objj_msgSend(_ruleEditor,"_addImage"));
objj_msgSend(_16,"setAction:",sel_getUid("_addOption:"));
objj_msgSend(_16,"setTarget:",_14);
return _16;
}
}),new objj_method(sel_getUid("_createDeleteRowButton"),function(_17,_18){
with(_17){
var _19=objj_msgSend(_17,"_createRowButton");
objj_msgSend(_19,"setImage:",objj_msgSend(_ruleEditor,"_removeImage"));
objj_msgSend(_19,"setAction:",sel_getUid("_deleteOption:"));
objj_msgSend(_19,"setTarget:",_17);
return _19;
}
}),new objj_method(sel_getUid("_createMenuItemWithTitle:"),function(_1a,_1b,_1c){
with(_1a){
_1c=objj_msgSend(objj_msgSend(_ruleEditor,"standardLocalizer"),"localizedStringForString:",_1c);
var _1d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_1c,nil,"");
return _1d;
}
}),new objj_method(sel_getUid("_createPopUpButtonWithItems:selectedItemIndex:"),function(_1e,_1f,_20,_21){
with(_1e){
var _22=objj_msgSend(objj_msgSend(_20,"objectAtIndex:",_21),"title"),_23=objj_msgSend(_ruleEditor,"font"),_24=objj_msgSend(_22,"sizeWithFont:",_23).width+20,_25=CGRectMake(0,0,(_24-_24%40)+80,_1),_26=objj_msgSend(objj_msgSend(_CPRuleEditorPopUpButton,"alloc"),"initWithFrame:",_25);
objj_msgSend(_26,"setTextColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",101/255,1));
objj_msgSend(_26,"setValue:forThemeAttribute:",_23,"font");
var _27=objj_msgSend(_20,"count");
for(var i=0;i<_27;i++){
objj_msgSend(_26,"addItem:",objj_msgSend(_20,"objectAtIndex:",i));
}
objj_msgSend(_26,"selectItemAtIndex:",_21);
return _26;
}
}),new objj_method(sel_getUid("_createMenuSeparatorItem"),function(_28,_29){
with(_28){
return objj_msgSend(CPMenuItem,"separatorItem");
}
}),new objj_method(sel_getUid("_createStaticTextFieldWithStringValue:"),function(_2a,_2b,_2c){
with(_2a){
var _2d=objj_msgSend(objj_msgSend(_CPRuleEditorTextField,"alloc"),"initWithFrame:",CPMakeRect(0,0,200,_1)),_2e=objj_msgSend(_ruleEditor,"font"),_2f=objj_msgSend(CPFont,"fontWithName:size:",objj_msgSend(_2e,"familyName"),objj_msgSend(_2e,"size")+2),_30=objj_msgSend(objj_msgSend(_ruleEditor,"standardLocalizer"),"localizedStringForString:",_2c);
objj_msgSend(_2d,"setValue:forThemeAttribute:",_2f,"font");
objj_msgSend(_2d,"setStringValue:",_30);
objj_msgSend(_2d,"sizeToFit");
return _2d;
}
}),new objj_method(sel_getUid("_addOption:"),function(_31,_32,_33){
with(_31){
if(_rowIndex==objj_msgSend(_ruleEditor,"numberOfRows")-1){
objj_msgSend(_31,"setNeedsDisplay:",YES);
}
var _34=_plusButtonRowType;
if(objj_msgSend(_ruleEditor,"nestingMode")==CPRuleEditorNestingModeCompound&&(objj_msgSend(objj_msgSend(CPApp,"currentEvent"),"modifierFlags")&CPAlternateKeyMask)){
_34=CPRuleEditorRowTypeCompound;
}
objj_msgSend(_ruleEditor,"_addOptionFromSlice:ofRowType:",_31,_34);
}
}),new objj_method(sel_getUid("_deleteOption:"),function(_35,_36,_37){
with(_35){
objj_msgSend(_ruleEditor,"_deleteSlice:",_35);
}
}),new objj_method(sel_getUid("_ruleOptionPopupChangedAction:"),function(_38,_39,_3a){
with(_38){
var _3b=objj_msgSend(_3a,"representedObject"),_3c=objj_msgSend(_3b,"objectForKey:","item"),_3d=objj_msgSend(_3b,"objectForKey:","indexInCriteria"),_3e=objj_msgSend(_correspondingRuleItems,"objectAtIndex:",_3d);
if(!objj_msgSend(_3c,"isEqual:",_3e)){
objj_msgSend(_correspondingRuleItems,"replaceObjectAtIndex:withObject:",_3d,_3c);
objj_msgSend(_ruleEditor,"_changedItem:toItem:inRow:atCriteriaIndex:",_3e,_3c,_rowIndex,_3d);
}
}
}),new objj_method(sel_getUid("validateMenuItem:"),function(_3f,_40,_41){
with(_3f){
return objj_msgSend(_ruleEditor,"_validateItem:value:inRow:",_41,objj_msgSend(objj_msgSend(_41,"representedObject"),"valueForKey:","item"),_rowIndex);
}
}),new objj_method(sel_getUid("_emptyRulePartSubviews"),function(_42,_43){
with(_42){
var _44=objj_msgSend(_ruleOptionViews,"count");
while(_44--){
objj_msgSend(_ruleOptionViews[_44],"removeFromSuperview");
}
objj_msgSend(_ruleOptionViews,"removeAllObjects");
objj_msgSend(_ruleOptionFrames,"removeAllObjects");
objj_msgSend(_ruleOptionInitialViewFrames,"removeAllObjects");
}
}),new objj_method(sel_getUid("_reconfigureSubviews"),function(_45,_46){
with(_45){
var _47,_48,_49,_4a,_4b,_4c,_4d,_4e,_4f,_50,_47=objj_msgSend(CPMutableArray,"array"),_51=objj_msgSend(objj_msgSend(_45,"window"),"firstResponder");
objj_msgSend(_45,"_emptyRulePartSubviews");
_48=objj_msgSend(_ruleEditor,"criteriaForRow:",_rowIndex);
_4e=objj_msgSend(_48,"count");
_50=_4e-1;
if(_51){
_50=objj_msgSend(_ruleOptionViews,"indexOfObjectIdenticalTo:",_51);
}
for(var i=0;i<_4e;i++){
_4b=nil;
_4d=nil;
_4c=objj_msgSend(_48,"objectAtIndex:",i);
if(i>0){
_4d=objj_msgSend(_48,"objectAtIndex:",i-1);
}
var _52=[],_53=[];
objj_msgSend(_ruleEditor,"_getAllAvailableItems:values:asChildrenOfItem:inRow:",_52,_53,_4d,_rowIndex);
_4f=objj_msgSend(_52,"count");
if(_4f>1){
var _54=objj_msgSend(CPMutableArray,"arrayWithCapacity:",_4f),_55=objj_msgSend(_52,"indexOfObject:",_4c);
if(_55==CPNotFound){
break;
}
for(var j=0;j<_4f;++j){
var _56=objj_msgSend(_52,"objectAtIndex:",j),_57=objj_msgSend(_53,"objectAtIndex:",j);
if(objj_msgSend(_57,"isKindOfClass:",objj_msgSend(CPMenuItem,"class"))){
objj_msgSend(objj_msgSend(_57,"menu"),"removeItem:",_57);
_4a=_57;
}else{
if(objj_msgSend(_57,"isEqualToString:","")){
_4a=objj_msgSend(_45,"_createMenuSeparatorItem");
}else{
_4a=objj_msgSend(_45,"_createMenuItemWithTitle:",_57);
objj_msgSend(_4a,"setTarget:",_45);
objj_msgSend(_4a,"setAction:",sel_getUid("_ruleOptionPopupChangedAction:"));
}
}
_49=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_56,"item",_57,"value",i,"indexInCriteria");
objj_msgSend(_4a,"setRepresentedObject:",_49);
objj_msgSend(_54,"addObject:",_4a);
}
_4b=objj_msgSend(_45,"_createPopUpButtonWithItems:selectedItemIndex:",_54,_55);
}else{
var _58=objj_msgSend(_53,"objectAtIndex:",0),_59=objj_msgSend(_58,"valueType");
if(_59===0){
_4b=objj_msgSend(_45,"_createStaticTextFieldWithStringValue:",_58);
}else{
if(_59!==1){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Display value must be a string or a menu item");
continue;
}
_4b=_58;
objj_msgSend(_4b,"setTarget:",_45);
objj_msgSend(_4b,"setAction:",sel_getUid("_sendRuleAction:"));
if(objj_msgSend(_4b,"respondsToSelector:",sel_getUid("setDelegate:"))){
objj_msgSend(_4b,"setDelegate:",_45);
}
}
}
if(_4b!=nil){
objj_msgSend(_ruleOptionViews,"addObject:",_4b);
var _5a=objj_msgSend(_4b,"frame");
objj_msgSend(_ruleOptionInitialViewFrames,"addObject:",_5a);
objj_msgSend(_ruleOptionFrames,"addObject:",_5a);
if(!_4c){
_4c=objj_msgSend(CPNull,"null");
}
objj_msgSend(_47,"addObject:",_4c);
}
}
objj_msgSend(_correspondingRuleItems,"setArray:",_47);
if(!editable){
objj_msgSend(_45,"_updateEnabledStateForSubviews");
}
objj_msgSend(_45,"_relayoutSubviewsWidthChanged:",YES);
if(_50!=CPNotFound){
var _5b=objj_msgSend(_ruleOptionViews,"objectAtIndex:",_50);
objj_msgSend(objj_msgSend(_45,"window"),"makeFirstResponder:",_5b);
}
}
}),new objj_method(sel_getUid("_updateEnabledStateForSubviews"),function(_5c,_5d){
with(_5c){
objj_msgSend(_ruleOptionViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setEnabled:"),NO);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_5e,_5f){
with(_5e){
objj_msgSend(_5e,"_relayoutSubviewsWidthChanged:",YES);
}
}),new objj_method(sel_getUid("_relayoutSubviewsWidthChanged:"),function(_60,_61,_62){
with(_60){
var _63,_64,_65,_66=objj_msgSend(_ruleEditor,"rowHeight"),_67=objj_msgSend(_ruleOptionViews,"count"),_68=objj_msgSend(_60,"frame"),_69=CGRectMake(CGRectGetWidth(_68)-_2-objj_msgSend(_60,"_rowButtonsRightHorizontalPadding"),(objj_msgSend(_ruleEditor,"rowHeight")-_2)/2-2,_2,_2);
objj_msgSend(_addButton,"setFrame:",_69);
_69.origin.x-=_2+objj_msgSend(_60,"_rowButtonsInterviewHorizontalPadding");
objj_msgSend(_subtractButton,"setFrame:",_69);
if(_62){
_63=objj_msgSend(_60,"_leftmostViewFixedHorizontalPadding")+objj_msgSend(_60,"_indentationHorizontalPadding")*_indentation;
_64=objj_msgSend(_60,"_rowButtonsLeftHorizontalPadding");
_65=CGRectGetMinX(_69);
}
for(var i=0;i<_67;i++){
var _6a=_ruleOptionViews[i],_6b=_ruleOptionFrames[i];
_6b.origin.y=(_66-CGRectGetHeight(_6b))/2-2;
if(_62){
_6b.origin.x=_63;
if(i==_67-1&&!objj_msgSend(_60,"_isRulePopup:",_6a)){
var _6c=_ruleOptionInitialViewFrames[i];
_6b.size.width=MIN(CGRectGetWidth(_6c),_65-_64-_63);
}
}
objj_msgSend(_6a,"setFrame:",_6b);
objj_msgSend(_60,"addSubview:",_6a);
if(_62){
_63+=CGRectGetWidth(_6b)+objj_msgSend(_60,"_interviewHorizontalPadding");
}
}
}
}),new objj_method(sel_getUid("_updateButtonVisibilities"),function(_6d,_6e){
with(_6d){
objj_msgSend(_addButton,"setHidden:",objj_msgSend(_ruleEditor,"_shouldHideAddButtonForSlice:",_6d));
objj_msgSend(_subtractButton,"setHidden:",objj_msgSend(_ruleEditor,"_shouldHideSubtractButtonForSlice:",_6d));
}
}),new objj_method(sel_getUid("_configurePlusButtonByRowType:"),function(_6f,_70,_71){
with(_6f){
objj_msgSend(_6f,"_setRowTypeToAddFromPlusButton:",_71);
}
}),new objj_method(sel_getUid("isEditable"),function(_72,_73){
with(_72){
return editable;
}
}),new objj_method(sel_getUid("setEditable:"),function(_74,_75,_76){
with(_74){
editable=_76;
objj_msgSend(_74,"_updateButtonVisibilities");
}
}),new objj_method(sel_getUid("_alignmentGridWidth"),function(_77,_78){
with(_77){
return objj_msgSend(_ruleEditor,"_alignmentGridWidth");
}
}),new objj_method(sel_getUid("_indentationHorizontalPadding"),function(_79,_7a){
with(_79){
return 30;
}
}),new objj_method(sel_getUid("_interviewHorizontalPadding"),function(_7b,_7c){
with(_7b){
return 6;
}
}),new objj_method(sel_getUid("_leftmostViewFixedHorizontalPadding"),function(_7d,_7e){
with(_7d){
return 7;
}
}),new objj_method(sel_getUid("_minimumVerticalPopupPadding"),function(_7f,_80){
with(_7f){
return 2;
}
}),new objj_method(sel_getUid("_rowButtonsInterviewHorizontalPadding"),function(_81,_82){
with(_81){
return 6;
}
}),new objj_method(sel_getUid("_rowButtonsLeftHorizontalPadding"),function(_83,_84){
with(_83){
return 10;
}
}),new objj_method(sel_getUid("_rowButtonsRightHorizontalPadding"),function(_85,_86){
with(_85){
return (objj_msgSend(objj_msgSend(_ruleEditor,"superview"),"isKindOfClass:",objj_msgSend(CPClipView,"class")))?18:10;
}
}),new objj_method(sel_getUid("_setRowTypeToAddFromPlusButton:"),function(_87,_88,_89){
with(_87){
_plusButtonRowType=_89;
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSendSuper({receiver:_8a,super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class},"setNeedsDisplay:",_8c);
}
}),new objj_method(sel_getUid("_nestingModeShouldHideAddButton"),function(_8d,_8e){
with(_8d){
return objj_msgSend(_ruleEditor,"_applicableNestingMode")==CPRuleEditorNestingModeSingle;
}
}),new objj_method(sel_getUid("_nestingModeShouldHideSubtractButton"),function(_8f,_90){
with(_8f){
return objj_msgSend(_ruleEditor,"_applicableNestingMode")==CPRuleEditorNestingModeSingle;
}
}),new objj_method(sel_getUid("containsDisplayValue:"),function(_91,_92,_93){
with(_91){
return objj_msgSend(objj_msgSend(_ruleEditor,"displayValuesForRow:",_rowIndex),"containsObject:",_93);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_94,_95){
with(_94){
objj_msgSend(_94,"layoutSubviews");
}
}),new objj_method(sel_getUid("drawRect:"),function(_96,_97,_98){
with(_96){
objj_msgSendSuper({receiver:_96,super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class},"drawRect:",_98);
}
}),new objj_method(sel_getUid("_isRulePopup:"),function(_99,_9a,_9b){
with(_99){
if(objj_msgSend(_9b,"isKindOfClass:",objj_msgSend(_CPRuleEditorPopUpButton,"class"))){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("_isRuleStaticTextField:"),function(_9c,_9d,_9e){
with(_9c){
if(objj_msgSend(_9e,"isKindOfClass:",objj_msgSend(_CPRuleEditorTextField,"class"))){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("_sendRuleAction:"),function(_9f,_a0,_a1){
with(_9f){
objj_msgSend(_ruleEditor,"_updatePredicate");
objj_msgSend(_ruleEditor,"_sendRuleAction");
}
}),new objj_method(sel_getUid("_textDidChange:"),function(_a2,_a3,_a4){
with(_a2){
if(objj_msgSend(objj_msgSend(_a4,"object"),"superview")==_a2&&objj_msgSend(_ruleEditor,"_sendsActionOnIncompleteTextChange")){
objj_msgSend(_a2,"_sendRuleAction:",nil);
}
}
})]);
var _3=objj_allocateClassPair(CPTextField,"_CPRuleEditorTextField"),_4=_3.isa;
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_a5,_a6,_a7){
with(_a5){
_a5=objj_msgSendSuper({receiver:_a5,super_class:objj_getClass("_CPRuleEditorTextField").super_class},"initWithFrame:",_a7);
if(_a5!=nil){
objj_msgSend(_a5,"setBordered:",NO);
objj_msgSend(_a5,"setEditable:",NO);
objj_msgSend(_a5,"setDrawsBackground:",NO);
}
return _a5;
}
}),new objj_method(sel_getUid("hitTest:"),function(_a8,_a9,_aa){
with(_a8){
if(!CPRectContainsPoint(objj_msgSend(_a8,"frame"),_aa)){
return nil;
}
return objj_msgSend(_a8,"superview");
}
})]);
