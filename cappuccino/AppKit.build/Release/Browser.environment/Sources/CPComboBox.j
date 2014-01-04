@STATIC;1.0;i;13;CPTextField.ji;14;_CPPopUpList.jt;30189;
objj_executeFile("CPTextField.j",YES);
objj_executeFile("_CPPopUpList.j",YES);
CPComboBoxSelectionDidChangeNotification="CPComboBoxSelectionDidChangeNotification";
CPComboBoxSelectionIsChangingNotification="CPComboBoxSelectionIsChangingNotification";
CPComboBoxWillDismissNotification="CPComboBoxWillDismissNotification";
CPComboBoxWillPopUpNotification="CPComboBoxWillPopUpNotification";
CPComboBoxStateButtonBordered=CPThemeState("button-bordered");
var _1="text",_2="button",_3=5,_4=-1;
var _5=objj_allocateClassPair(CPTextField,"CPComboBox"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_items"),new objj_ivar("_listDelegate"),new objj_ivar("_dataSource"),new objj_ivar("_usesDataSource"),new objj_ivar("_completes"),new objj_ivar("_canComplete"),new objj_ivar("_numberOfVisibleItems"),new objj_ivar("_forceSelection"),new objj_ivar("_hasVerticalScroller"),new objj_ivar("_selectedStringValue"),new objj_ivar("_popUpButtonCausedResign")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPComboBox").super_class},"initWithFrame:",_9);
if(_7){
objj_msgSend(_7,"_initComboBox");
}
return _7;
}
}),new objj_method(sel_getUid("_initComboBox"),function(_a,_b){
with(_a){
_items=objj_msgSend(CPArray,"array");
_listClass=objj_msgSend(_CPPopUpList,"class");
_usesDataSource=NO;
_completes=NO;
_canComplete=NO;
_numberOfVisibleItems=_3;
_forceSelection=NO;
_hasVerticalScroller=YES;
_selectedStringValue="";
_popUpButtonCausedResign=NO;
objj_msgSend(_a,"setTheme:",objj_msgSend(CPTheme,"defaultTheme"));
objj_msgSend(_a,"setBordered:",YES);
objj_msgSend(_a,"setBezeled:",YES);
objj_msgSend(_a,"setEditable:",YES);
objj_msgSend(_a,"setThemeState:",CPComboBoxStateButtonBordered);
}
}),new objj_method(sel_getUid("hasVerticalScroller"),function(_c,_d){
with(_c){
return _hasVerticalScroller;
}
}),new objj_method(sel_getUid("setHasVerticalScroller:"),function(_e,_f,_10){
with(_e){
_10=!!_10;
if(_hasVerticalScroller===_10){
return;
}
_hasVerticalScroller=_10;
objj_msgSend(objj_msgSend(_listDelegate,"scrollView"),"setHasVerticalScroller:",_10);
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(_listDelegate,"tableView"),"intercellSpacing");
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_13,_14,_15){
with(_13){
objj_msgSend(objj_msgSend(_listDelegate,"tableView"),"setIntercellSpacing:",_15);
}
}),new objj_method(sel_getUid("isButtonBordered"),function(_16,_17){
with(_16){
return objj_msgSend(_16,"hasThemeState:",CPComboBoxStateButtonBordered);
}
}),new objj_method(sel_getUid("setButtonBordered:"),function(_18,_19,_1a){
with(_18){
if(!!_1a){
objj_msgSend(_18,"setThemeState:",CPComboBoxStateButtonBordered);
}else{
objj_msgSend(_18,"unsetThemeState:",CPComboBoxStateButtonBordered);
}
}
}),new objj_method(sel_getUid("itemHeight"),function(_1b,_1c){
with(_1b){
return objj_msgSend(objj_msgSend(_listDelegate,"tableView"),"rowHeight");
}
}),new objj_method(sel_getUid("setItemHeight:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(objj_msgSend(_listDelegate,"tableView"),"setRowHeight:",_1f);
objj_msgSend(objj_msgSend(_listDelegate,"tableView"),"reloadData");
}
}),new objj_method(sel_getUid("numberOfVisibleItems"),function(_20,_21){
with(_20){
return _numberOfVisibleItems;
}
}),new objj_method(sel_getUid("setNumberOfVisibleItems:"),function(_22,_23,_24){
with(_22){
_numberOfVisibleItems=MAX(_24,1);
}
}),new objj_method(sel_getUid("delegate"),function(_25,_26){
with(_25){
return objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPComboBox").super_class},"delegate");
}
}),new objj_method(sel_getUid("setDelegate:"),function(_27,_28,_29){
with(_27){
var _2a=objj_msgSend(_27,"delegate");
if(_29===_2a){
return;
}
var _2b=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_2a){
objj_msgSend(_2b,"removeObserver:name:object:",_2a,CPComboBoxSelectionIsChangingNotification,_27);
objj_msgSend(_2b,"removeObserver:name:object:",_2a,CPComboBoxSelectionDidChangeNotification,_27);
objj_msgSend(_2b,"removeObserver:name:object:",_2a,CPComboBoxWillDismissNotification,_27);
objj_msgSend(_2b,"removeObserver:name:object:",_2a,CPComboBoxWillPopUpNotification,_27);
}
if(_29){
if(objj_msgSend(_29,"respondsToSelector:",sel_getUid("comboBoxSelectionIsChanging:"))){
objj_msgSend(_2b,"addObserver:selector:name:object:",_2a,sel_getUid("comboBoxSelectionIsChanging:"),CPComboBoxSelectionIsChangingNotification,_27);
}
if(objj_msgSend(_29,"respondsToSelector:",sel_getUid("comboBoxSelectionDidChange:"))){
objj_msgSend(_2b,"addObserver:selector:name:object:",_2a,sel_getUid("comboBoxSelectionDidChange:"),CPComboBoxSelectionDidChangeNotification,_27);
}
if(objj_msgSend(_29,"respondsToSelector:",sel_getUid("comboBoxWillPopUp:"))){
objj_msgSend(_2b,"addObserver:selector:name:object:",_2a,sel_getUid("comboBoxWillPopUp:"),CPComboBoxWillPopUpNotification,_27);
}
if(objj_msgSend(_29,"respondsToSelector:",sel_getUid("comboBoxWillDismiss:"))){
objj_msgSend(_2b,"addObserver:selector:name:object:",_2a,sel_getUid("comboBoxWillDissmis:"),CPComboBoxWillDismissNotification,_27);
}
}
objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPComboBox").super_class},"setDelegate:",_29);
}
}),new objj_method(sel_getUid("dataSource"),function(_2c,_2d){
with(_2c){
if(!_usesDataSource){
objj_msgSend(_2c,"_dataSourceWarningForMethod:condition:",_2d,NO);
}
return _dataSource;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_2e,_2f,_30){
with(_2e){
if(!_usesDataSource){
objj_msgSend(_2e,"_dataSourceWarningForMethod:condition:",_2f,NO);
}else{
if(_dataSource!==_30){
if(!objj_msgSend(_30,"respondsToSelector:",sel_getUid("numberOfItemsInComboBox:"))||!objj_msgSend(_30,"respondsToSelector:",sel_getUid("comboBox:objectValueForItemAtIndex:"))){
CPLog.warn("Illegal %s data source (%s). Must implement numberOfItemsInComboBox: and comboBox:objectValueForItemAtIndex:",objj_msgSend(_2e,"className"),objj_msgSend(_30,"description"));
}else{
_dataSource=_30;
}
}
}
}
}),new objj_method(sel_getUid("usesDataSource"),function(_31,_32){
with(_31){
return _usesDataSource;
}
}),new objj_method(sel_getUid("setUsesDataSource:"),function(_33,_34,_35){
with(_33){
_35=!!_35;
if(_usesDataSource===_35){
return;
}
_usesDataSource=_35;
if(_usesDataSource){
objj_msgSend(_items,"removeAllObjects");
}
objj_msgSend(_33,"reloadData");
}
}),new objj_method(sel_getUid("addItemsWithObjectValues:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_items,"addObjectsFromArray:",_38);
objj_msgSend(_36,"reloadDataSourceForSelector:",_37);
}
}),new objj_method(sel_getUid("addItemWithObjectValue:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_items,"addObject:",_3b);
objj_msgSend(_39,"reloadDataSourceForSelector:",_3a);
}
}),new objj_method(sel_getUid("insertItemWithObjectValue:atIndex:"),function(_3c,_3d,_3e,_3f){
with(_3c){
if(_usesDataSource){
objj_msgSend(_3c,"_dataSourceWarningForMethod:condition:",_3d,YES);
}
objj_msgSend(_items,"insertObject:atIndex:",_3e,_3f);
objj_msgSend(_3c,"reloadData");
}
}),new objj_method(sel_getUid("objectValues"),function(_40,_41){
with(_40){
if(_usesDataSource){
objj_msgSend(_40,"_dataSourceWarningForMethod:condition:",_41,YES);
}
return _items;
}
}),new objj_method(sel_getUid("removeAllItems"),function(_42,_43){
with(_42){
objj_msgSend(_items,"removeAllObjects");
objj_msgSend(_42,"reloadDataSourceForSelector:",_43);
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_44,_45,_46){
with(_44){
if(_usesDataSource){
objj_msgSend(_44,"_dataSourceWarningForMethod:condition:",_45,YES);
}
objj_msgSend(_items,"removeObjectAtIndex:",_46);
objj_msgSend(_44,"reloadData");
}
}),new objj_method(sel_getUid("removeItemWithObjectValue:"),function(_47,_48,_49){
with(_47){
objj_msgSend(_items,"removeObject:",_49);
objj_msgSend(_47,"reloadDataSourceForSelector:",_48);
}
}),new objj_method(sel_getUid("numberOfItems"),function(_4a,_4b){
with(_4a){
if(_usesDataSource){
return objj_msgSend(_dataSource,"numberOfItemsInComboBox:",_4a);
}else{
return _items.length;
}
}
}),new objj_method(sel_getUid("listDelegate"),function(_4c,_4d){
with(_4c){
return _listDelegate;
}
}),new objj_method(sel_getUid("setListDelegate:"),function(_4e,_4f,_50){
with(_4e){
if(_listDelegate===_50){
return;
}
var _51=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_listDelegate){
objj_msgSend(_51,"removeObserver:name:object:",_4e,_CPPopUpListWillPopUpNotification,_listDelegate);
objj_msgSend(_51,"removeObserver:name:object:",_4e,_CPPopUpListWillDismissNotification,_listDelegate);
objj_msgSend(_51,"removeObserver:name:object:",_4e,_CPPopUpListDidDismissNotification,_listDelegate);
objj_msgSend(_51,"removeObserver:name:object:",_4e,_CPPopUpListItemWasClickedNotification,_listDelegate);
var _52=objj_msgSend(_listDelegate,"tableView");
if(_52){
objj_msgSend(_51,"removeObserver:name:object:",_4e,CPTableViewSelectionIsChangingNotification,_52);
objj_msgSend(_51,"removeObserver:name:object:",_4e,CPTableViewSelectionDidChangeNotification,_52);
}
}
_listDelegate=_50;
objj_msgSend(_51,"addObserver:selector:name:object:",_4e,sel_getUid("comboBoxWillPopUp:"),_CPPopUpListWillPopUpNotification,_listDelegate);
objj_msgSend(_51,"addObserver:selector:name:object:",_4e,sel_getUid("comboBoxWillDismiss:"),_CPPopUpListWillDismissNotification,_listDelegate);
objj_msgSend(_51,"addObserver:selector:name:object:",_4e,sel_getUid("listDidDismiss:"),_CPPopUpListDidDismissNotification,_listDelegate);
objj_msgSend(_51,"addObserver:selector:name:object:",_4e,sel_getUid("itemWasClicked:"),_CPPopUpListItemWasClickedNotification,_listDelegate);
objj_msgSend(objj_msgSend(_listDelegate,"scrollView"),"setHasVerticalScroller:",_hasVerticalScroller);
var _53=objj_msgSend(_listDelegate,"tableView");
objj_msgSend(_51,"addObserver:selector:name:object:",_4e,sel_getUid("comboBoxSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,_53);
objj_msgSend(_51,"addObserver:selector:name:object:",_4e,sel_getUid("comboBoxSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,_53);
objj_msgSend(_listDelegate,"setFont:",objj_msgSend(_4e,"font"));
objj_msgSend(_listDelegate,"setAlignment:",objj_msgSend(_4e,"alignment"));
}
}),new objj_method(sel_getUid("indexOfItemWithObjectValue:"),function(_54,_55,_56){
with(_54){
if(_usesDataSource){
objj_msgSend(_54,"_dataSourceWarningForMethod:condition:",_55,YES);
}
return objj_msgSend(_items,"indexOfObject:",_56);
}
}),new objj_method(sel_getUid("itemObjectValueAtIndex:"),function(_57,_58,_59){
with(_57){
if(_usesDataSource){
objj_msgSend(_57,"_dataSourceWarningForMethod:condition:",_58,YES);
}
return objj_msgSend(_items,"objectAtIndex:",_59);
}
}),new objj_method(sel_getUid("noteNumberOfItemsChanged"),function(_5a,_5b){
with(_5a){
objj_msgSend(objj_msgSend(_listDelegate,"tableView"),"noteNumberOfRowsChanged");
}
}),new objj_method(sel_getUid("scrollItemAtIndexToTop:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(_listDelegate,"scrollItemAtIndexToTop:",_5e);
}
}),new objj_method(sel_getUid("scrollItemAtIndexToVisible:"),function(_5f,_60,_61){
with(_5f){
objj_msgSend(objj_msgSend(_listDelegate,"tableView"),"scrollRowToVisible:",_61);
}
}),new objj_method(sel_getUid("reloadData"),function(_62,_63){
with(_62){
objj_msgSend(objj_msgSend(_listDelegate,"tableView"),"reloadData");
}
}),new objj_method(sel_getUid("popUpList"),function(_64,_65){
with(_64){
if(!_listDelegate){
objj_msgSend(_64,"setListDelegate:",objj_msgSend(objj_msgSend(_CPPopUpList,"alloc"),"initWithDataSource:",_64));
}
objj_msgSend(_64,"_selectMatchingItem");
if(_4<0){
var _66=objj_msgSend(_64,"currentValueForThemeAttribute:","border-inset");
_4=_66.bottom;
}
objj_msgSend(_listDelegate,"popUpRelativeToRect:view:offset:",objj_msgSend(_64,"_borderFrame"),_64,_4-1);
}
}),new objj_method(sel_getUid("listIsVisible"),function(_67,_68){
with(_67){
return _listDelegate?objj_msgSend(_listDelegate,"isVisible"):NO;
}
}),new objj_method(sel_getUid("reloadDataSourceForSelector:"),function(_69,_6a,cmd){
with(_69){
if(_usesDataSource){
objj_msgSend(_69,"_dataSourceWarningForMethod:condition:",cmd,YES);
}else{
objj_msgSend(_69,"reloadData");
}
}
}),new objj_method(sel_getUid("takeStringValueFromList"),function(_6b,_6c){
with(_6b){
if(_usesDataSource&&_dataSource&&objj_msgSend(_dataSource,"numberOfItemsInComboBox:",_6b)===0){
return NO;
}
var _6d=objj_msgSend(_listDelegate,"selectedStringValue");
if(_6d===nil){
return NO;
}else{
_selectedStringValue=_6d;
}
objj_msgSend(_6b,"setStringValue:",_selectedStringValue);
objj_msgSend(_6b,"_reverseSetBinding");
return YES;
}
}),new objj_method(sel_getUid("listDidDismiss:"),function(_6e,_6f,_70){
with(_6e){
objj_msgSend(objj_msgSend(_6e,"window"),"makeFirstResponder:",_6e);
}
}),new objj_method(sel_getUid("itemWasClicked:"),function(_71,_72,_73){
with(_71){
objj_msgSend(_71,"takeStringValueFromList");
objj_msgSend(_71,"sendAction:to:",objj_msgSend(_71,"action"),objj_msgSend(_71,"target"));
}
}),new objj_method(sel_getUid("deselectItemAtIndex:"),function(_74,_75,_76){
with(_74){
var _77=objj_msgSend(_listDelegate,"tableView"),row=objj_msgSend(_77,"selectedRow");
if(row!==_76){
return;
}
objj_msgSend(_77,"deselectRow:",_76);
}
}),new objj_method(sel_getUid("indexOfSelectedItem"),function(_78,_79){
with(_78){
return objj_msgSend(objj_msgSend(_listDelegate,"tableView"),"selectedRow");
}
}),new objj_method(sel_getUid("objectValueOfSelectedItem"),function(_7a,_7b){
with(_7a){
var row=objj_msgSend(objj_msgSend(_listDelegate,"tableView"),"selectedRow");
if(row>=0){
if(_usesDataSource){
objj_msgSend(_7a,"_dataSourceWarningForMethod:condition:",_7b,YES);
}
return _items[row];
}
return nil;
}
}),new objj_method(sel_getUid("selectItemAtIndex:"),function(_7c,_7d,_7e){
with(_7c){
var _7f=objj_msgSend(_listDelegate,"tableView"),row=objj_msgSend(_7f,"selectedRow");
if(row===_7e){
return;
}
objj_msgSend(_7f,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_7e),NO);
}
}),new objj_method(sel_getUid("selectItemWithObjectValue:"),function(_80,_81,_82){
with(_80){
var _83=objj_msgSend(_80,"indexOfItemWithObjectValue:",_82);
if(_83!==CPNotFound){
objj_msgSend(_80,"selectItemAtIndex:",_83);
}
}
}),new objj_method(sel_getUid("completes"),function(_84,_85){
with(_84){
return _completes;
}
}),new objj_method(sel_getUid("setCompletes:"),function(_86,_87,_88){
with(_86){
_completes=!!_88;
}
}),new objj_method(sel_getUid("completedString:"),function(_89,_8a,_8b){
with(_89){
if(_usesDataSource){
return objj_msgSend(_89,"comboBoxCompletedString:",_8b);
}else{
var _8c=objj_msgSend(_items,"indexOfObjectPassingTest:context:",_8d,_8b);
return _8c!==CPNotFound?_items[_8c]:nil;
}
}
}),new objj_method(sel_getUid("forceSelection"),function(_8e,_8f){
with(_8e){
return _forceSelection;
}
}),new objj_method(sel_getUid("setForceSelection:"),function(_90,_91,_92){
with(_90){
_forceSelection=!!_92;
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_93,_94,_95,_96){
with(_93){
if(objj_msgSend(_93,"listIsVisible")){
objj_msgSend(_93,"takeStringValueFromList");
objj_msgSend(_listDelegate,"close");
}
return objj_msgSendSuper({receiver:_93,super_class:objj_getClass("CPComboBox").super_class},"sendAction:to:",_95,_96);
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_97,_98,_99){
with(_97){
objj_msgSendSuper({receiver:_97,super_class:objj_getClass("CPComboBox").super_class},"setObjectValue:",_99);
_selectedStringValue=objj_msgSend(_97,"stringValue");
}
}),new objj_method(sel_getUid("interpretKeyEvents:"),function(_9a,_9b,_9c){
with(_9a){
var _9d=_9c[0];
_canComplete=NO;
if(_completes){
if(!objj_msgSend(_9d,"_couldBeKeyEquivalent")&&objj_msgSend(_9d,"characters").charAt(0)!==CPDeleteCharacter){
var _9e=objj_msgSend(_9a,"_inputElement").value,_9f=objj_msgSend(_9a,"selectedRange");
_canComplete=CPMaxRange(_9f)===_9e.length;
}
}
objj_msgSendSuper({receiver:_9a,super_class:objj_getClass("CPComboBox").super_class},"interpretKeyEvents:",_9c);
}
}),new objj_method(sel_getUid("paste:"),function(_a0,_a1,_a2){
with(_a0){
if(_completes){
var _a3=objj_msgSend(_a0,"_inputElement").value,_a4=objj_msgSend(_a0,"selectedRange");
_canComplete=CPMaxRange(_a4)===_a3.length;
}else{
_canComplete=NO;
}
objj_msgSendSuper({receiver:_a0,super_class:objj_getClass("CPComboBox").super_class},"paste:",_a2);
}
}),new objj_method(sel_getUid("textDidChange:"),function(_a5,_a6,_a7){
with(_a5){
var _a8=objj_msgSend(_a5,"stringValue"),_a9=_a8;
if(_completes&&_canComplete){
_a9=objj_msgSend(_a5,"completedString:",_a8);
if(_a9&&_a9.length>_a8.length){
objj_msgSend(_a5,"setStringValue:",_a9);
objj_msgSend(_a5,"setSelectedRange:",CPMakeRange(_a8.length,_a9.length-_a8.length));
}
}
objj_msgSend(_a5,"_selectMatchingItem");
_canComplete=NO;
objj_msgSendSuper({receiver:_a5,super_class:objj_getClass("CPComboBox").super_class},"textDidChange:",_a7);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_aa,_ab,_ac){
with(_aa){
if(objj_msgSend(objj_msgSend(_aa,"window"),"firstResponder")===_aa){
var key=objj_msgSend(_ac,"charactersIgnoringModifiers");
switch(key){
case CPDownArrowFunctionKey:
if(!objj_msgSend(_aa,"listIsVisible")){
objj_msgSend(_aa,"popUpList");
return YES;
}
break;
case CPEscapeFunctionKey:
if(objj_msgSend(_aa,"listIsVisible")){
if(_forceSelection&&(objj_msgSend(_aa,"_inputElement").value!==_selectedStringValue)){
objj_msgSend(_aa,"setStringValue:",_selectedStringValue);
}
}
break;
}
if(objj_msgSend(_listDelegate,"performKeyEquivalent:",_ac)){
return YES;
}
}
return objj_msgSendSuper({receiver:_aa,super_class:objj_getClass("CPComboBox").super_class},"performKeyEquivalent:",_ac);
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_ad,_ae){
with(_ad){
var _af=_popUpButtonCausedResign;
_popUpButtonCausedResign=NO;
var _b0=!_af&&(!_listDelegate||objj_msgSend(_listDelegate,"controllingViewShouldResign"));
if(!_b0){
var _b1=objj_msgSend(_ad,"_inputElement");
window.setTimeout(function(){
_b1.focus();
},0);
return NO;
}
objj_msgSend(_listDelegate,"close");
var _b2=objj_msgSend(_ad,"stringValue");
if(_b2){
if(_forceSelection&&!objj_msgSend(_b2,"isEqual:",_selectedStringValue)){
objj_msgSend(_ad,"setStringValue:",_selectedStringValue);
}
}else{
_selectedStringValue="";
}
return objj_msgSendSuper({receiver:_ad,super_class:objj_getClass("CPComboBox").super_class},"resignFirstResponder");
}
}),new objj_method(sel_getUid("setFont:"),function(_b3,_b4,_b5){
with(_b3){
objj_msgSendSuper({receiver:_b3,super_class:objj_getClass("CPComboBox").super_class},"setFont:",_b5);
objj_msgSend(_listDelegate,"setFont:",_b5);
}
}),new objj_method(sel_getUid("setAlignment:"),function(_b6,_b7,_b8){
with(_b6){
objj_msgSendSuper({receiver:_b6,super_class:objj_getClass("CPComboBox").super_class},"setAlignment:",_b8);
objj_msgSend(_listDelegate,"setAlignment:",_b8);
}
}),new objj_method(sel_getUid("popupButtonRectForBounds:"),function(_b9,_ba,_bb){
with(_b9){
var _bc=objj_msgSend(_b9,"currentValueForThemeAttribute:","border-inset"),_bd=objj_msgSend(_b9,"currentValueForThemeAttribute:","popup-button-size");
_bb.origin.x=CGRectGetMaxX(_bb)-_bc.right-_bd.width;
_bb.origin.y+=_bc.top;
_bb.size.width=_bd.width;
_bb.size.height=_bd.height;
return _bb;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_be,_bf,_c0){
with(_be){
if(_c0==="popup-button-view"){
return objj_msgSend(_be,"popupButtonRectForBounds:",objj_msgSend(_be,"bounds"));
}
return objj_msgSendSuper({receiver:_be,super_class:objj_getClass("CPComboBox").super_class},"rectForEphemeralSubviewNamed:",_c0);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_c1,_c2,_c3){
with(_c1){
if(_c3==="popup-button-view"){
var _c4=objj_msgSend(objj_msgSend(_CPComboBoxPopUpButton,"alloc"),"initWithFrame:comboBox:",{origin:{x:0,y:0},size:{width:0,height:0}},_c1);
return _c4;
}
return objj_msgSendSuper({receiver:_c1,super_class:objj_getClass("CPComboBox").super_class},"createEphemeralSubviewNamed:",_c3);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_c5,_c6){
with(_c5){
objj_msgSendSuper({receiver:_c5,super_class:objj_getClass("CPComboBox").super_class},"layoutSubviews");
var _c7=objj_msgSend(_c5,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","popup-button-view",CPWindowAbove,"content-view");
}
}),new objj_method(sel_getUid("_dataSourceWarningForMethod:condition:"),function(_c8,_c9,cmd,_ca){
with(_c8){
CPLog.warn("-[%s %s] should not be called when usesDataSource is set to %s",objj_msgSend(_c8,"className"),cmd,_ca?"YES":"NO");
}
}),new objj_method(sel_getUid("_selectMatchingItem"),function(_cb,_cc){
with(_cb){
var _cd=CPNotFound,_ce=objj_msgSend(_cb,"stringValue");
if(_usesDataSource){
if(_dataSource&&objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("comboBox:indexOfItemWithStringValue:"))){
_cd=objj_msgSend(_dataSource,"comboBox:indexOfItemWithStringValue:",_cb,_ce);
}
}else{
_cd=objj_msgSend(_cb,"indexOfItemWithObjectValue:",_ce);
}
objj_msgSend(_listDelegate,"selectRow:",_cd);
if(_cd!==CPNotFound){
objj_msgSend(_listDelegate,"scrollItemAtIndexToTop:",_cd);
_selectedStringValue=_ce;
}
}
}),new objj_method(sel_getUid("_borderFrame"),function(_cf,_d0){
with(_cf){
var _d1=objj_msgSend(_cf,"currentValueForThemeAttribute:","border-inset"),_d2=objj_msgSend(_cf,"bounds");
_d2.origin.x+=_d1.left;
_d2.origin.y+=_d1.top;
_d2.size.width-=_d1.left+_d1.right;
_d2.size.height-=_d1.top+_d1.bottom;
return _d2;
}
}),new objj_method(sel_getUid("_popUpButtonWasClicked"),function(_d3,_d4){
with(_d3){
if(!objj_msgSend(_d3,"isEnabled")){
return;
}
var _d5=objj_msgSend(objj_msgSend(_d3,"window"),"firstResponder");
_popUpButtonCausedResign=_d5===_d3;
if(objj_msgSend(_d3,"listIsVisible")){
objj_msgSend(_listDelegate,"close");
}else{
if(_d5!==_d3){
objj_msgSend(objj_msgSend(_d3,"window"),"makeFirstResponder:",_d3);
}
objj_msgSend(_d3,"popUpList");
}
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("defaultThemeClass"),function(_d6,_d7){
with(_d6){
return "combobox";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_d8,_d9){
with(_d8){
return objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",{width:21,height:29},"popup-button-size",{top:(3),right:(3),bottom:(3),left:(3)},"border-inset");
}
}),new objj_method(sel_getUid("_binderClassForBinding:"),function(_da,_db,_dc){
with(_da){
if(_dc===CPContentBinding||_dc===CPContentValuesBinding){
return objj_msgSend(_CPComboBoxContentBinder,"class");
}
return objj_msgSendSuper({receiver:_da,super_class:objj_getMetaClass("CPComboBox").super_class},"_binderClassForBinding:",_dc);
}
})]);
var _5=objj_getClass("CPComboBox");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("comboBoxSelectionIsChanging:"),function(_dd,_de,_df){
with(_dd){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPComboBoxSelectionIsChangingNotification,_dd);
}
}),new objj_method(sel_getUid("comboBoxSelectionDidChange:"),function(_e0,_e1,_e2){
with(_e0){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPComboBoxSelectionDidChangeNotification,_e0);
}
}),new objj_method(sel_getUid("comboBoxWillPopUp:"),function(_e3,_e4,_e5){
with(_e3){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPComboBoxWillPopUpNotification,_e3);
}
}),new objj_method(sel_getUid("comboBoxWillDismiss:"),function(_e6,_e7,_e8){
with(_e6){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPComboBoxWillDismissNotification,_e6);
}
})]);
var _5=objj_getClass("CPComboBox");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("comboBoxCompletedString:"),function(_e9,_ea,_eb){
with(_e9){
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("comboBox:completedString:"))){
return objj_msgSend(_dataSource,"comboBox:completedString:",_e9,_eb);
}else{
return nil;
}
}
})]);
var _5=objj_getClass("CPComboBox");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("numberOfItemsInList:"),function(_ec,_ed,_ee){
with(_ec){
return objj_msgSend(_ec,"numberOfItems");
}
}),new objj_method(sel_getUid("numberOfVisibleItemsInList:"),function(_ef,_f0,_f1){
with(_ef){
return objj_msgSend(_ef,"numberOfVisibleItems");
}
}),new objj_method(sel_getUid("list:objectValueForItemAtIndex:"),function(_f2,_f3,_f4,_f5){
with(_f2){
if(_usesDataSource){
return objj_msgSend(_dataSource,"comboBox:objectValueForItemAtIndex:",_f2,_f5);
}else{
return _items[_f5];
}
}
}),new objj_method(sel_getUid("list:displayValueForObjectValue:"),function(_f6,_f7,_f8,_f9){
with(_f6){
return _f9||"";
}
}),new objj_method(sel_getUid("list:stringValueForObjectValue:"),function(_fa,_fb,_fc,_fd){
with(_fa){
return String(_fd);
}
})]);
var _5=objj_getClass("CPComboBox");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("setContentValues:"),function(_fe,_ff,_100){
with(_fe){
objj_msgSend(_fe,"setUsesDataSource:",NO);
objj_msgSend(_fe,"removeAllItems");
objj_msgSend(_fe,"addItemsWithObjectValues:",_100);
}
}),new objj_method(sel_getUid("setContent:"),function(self,_101,_102){
with(self){
objj_msgSend(self,"setUsesDataSource:",NO);
_items=[];
var _103=[];
objj_msgSend(_102,"enumerateObjectsUsingBlock:",function(_104){
_103.push(objj_msgSend(_104,"description"));
});
objj_msgSend(self,"addItemsWithObjectValues:",_103);
}
})]);
var _105="CPComboBoxItemsKey",_106="CPComboBoxListKey",_107="CPComboBoxDelegateKey",_108="CPComboBoxDataSourceKey",_109="CPComboBoxUsesDataSourceKey",_10a="CPComboBoxCompletesKey",_10b="CPComboBoxNumberOfVisibleItemsKey",_10c="CPComboBoxHasVerticalScrollerKey",_10d="CPComboBoxButtonBorderedKey";
var _5=objj_getClass("CPComboBox");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("initWithCoder:"),function(self,_10e,_10f){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPComboBox").super_class},"initWithCoder:",_10f);
if(self){
objj_msgSend(self,"_initComboBox");
_items=objj_msgSend(_10f,"decodeObjectForKey:",_105);
_listDelegate=objj_msgSend(_10f,"decodeObjectForKey:",_106);
_delegate=objj_msgSend(_10f,"decodeObjectForKey:",_107);
_dataSource=objj_msgSend(_10f,"decodeObjectForKey:",_108);
_usesDataSource=objj_msgSend(_10f,"decodeBoolForKey:",_109);
_completes=objj_msgSend(_10f,"decodeBoolForKey:",_10a);
_numberOfVisibleItems=objj_msgSend(_10f,"decodeIntForKey:",_10b);
_hasVerticalScroller=objj_msgSend(_10f,"decodeBoolForKey:",_10c);
objj_msgSend(self,"setButtonBordered:",objj_msgSend(_10f,"decodeBoolForKey:",_10d));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_110,_111){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPComboBox").super_class},"encodeWithCoder:",_111);
objj_msgSend(_111,"encodeObject:forKey:",_items,_105);
objj_msgSend(_111,"encodeObject:forKey:",_listDelegate,_106);
objj_msgSend(_111,"encodeObject:forKey:",_delegate,_107);
objj_msgSend(_111,"encodeObject:forKey:",_dataSource,_108);
objj_msgSend(_111,"encodeBool:forKey:",_usesDataSource,_109);
objj_msgSend(_111,"encodeBool:forKey:",_completes,_10a);
objj_msgSend(_111,"encodeInt:forKey:",_numberOfVisibleItems,_10b);
objj_msgSend(_111,"encodeBool:forKey:",_hasVerticalScroller,_10c);
objj_msgSend(_111,"encodeBool:forKey:",objj_msgSend(self,"isButtonBordered"),_10d);
}
})]);
var _8d=function(_112,_113,_114){
return _112.toString().indexOf(_114)===0;
};
var _5=objj_allocateClassPair(CPBinder,"_CPComboBoxContentBinder"),_6=_5.isa;
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("setValueFor:"),function(self,_115,_116){
with(self){
var _117=objj_msgSend(_info,"objectForKey:",CPObservedObjectKey),_118=objj_msgSend(_info,"objectForKey:",CPObservedKeyPathKey),_119=objj_msgSend(_info,"objectForKey:",CPOptionsKey),_11a=objj_msgSend(_117,"valueForKeyPath:",_118),_11b=CPIsControllerMarker(_11a);
objj_msgSend(_source,"removeAllItems");
if(_11b){
switch(_11a){
case CPMultipleValuesMarker:
_11a=objj_msgSend(_119,"objectForKey:",CPMultipleValuesPlaceholderBindingOption)||[];
break;
case CPNoSelectionMarker:
_11a=objj_msgSend(_119,"objectForKey:",CPNoSelectionPlaceholderBindingOption)||[];
break;
case CPNotApplicableMarker:
if(objj_msgSend(_119,"objectForKey:",CPRaisesForNotApplicableKeysBindingOption)){
objj_msgSend(CPException,"raise:reason:",CPGenericException,"can't transform non applicable key on: "+_source+" value: "+_11a);
}
_11a=objj_msgSend(_119,"objectForKey:",CPNotApplicablePlaceholderBindingOption)||[];
break;
case CPNullMarker:
_11a=objj_msgSend(_119,"objectForKey:",CPNullPlaceholderBindingOption)||[];
break;
}
if(!objj_msgSend(_11a,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
_11a=[];
}
}else{
_11a=objj_msgSend(self,"transformValue:withOptions:",_11a,_119);
}
switch(_116){
case CPContentBinding:
objj_msgSend(_source,"setContent:",_11a);
break;
case CPContentValuesBinding:
objj_msgSend(_source,"setContentValues:",_11a);
break;
}
}
})]);
var _5=objj_allocateClassPair(CPView,"_CPComboBoxPopUpButton"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_comboBox")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:comboBox:"),function(self,_11c,_11d,_11e){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPComboBoxPopUpButton").super_class},"initWithFrame:",_11d);
if(self){
_comboBox=_11e;
}
return self;
}
}),new objj_method(sel_getUid("mouseDown:"),function(self,_11f,_120){
with(self){
objj_msgSend(_comboBox,"_popUpButtonWasClicked");
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(self,_121){
with(self){
return NO;
}
})]);
