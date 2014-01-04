@STATIC;1.0;I;23;Foundation/CPGeometry.ji;10;CPButton.ji;19;CPKeyValueBinding.ji;8;CPMenu.ji;12;CPMenuItem.jt;24477;
objj_executeFile("Foundation/CPGeometry.j",NO);
objj_executeFile("CPButton.j",YES);
objj_executeFile("CPKeyValueBinding.j",YES);
objj_executeFile("CPMenu.j",YES);
objj_executeFile("CPMenuItem.j",YES);
var _1=7;
CPPopUpButtonStatePullsDown=CPThemeState("pulls-down");
var _2=objj_allocateClassPair(CPButton,"CPPopUpButton"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_selectedIndex"),new objj_ivar("_preferredEdge")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:pullsDown:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPPopUpButton").super_class},"initWithFrame:",_6);
if(_4){
objj_msgSend(_4,"selectItemAtIndex:",CPNotFound);
_preferredEdge=CPMaxYEdge;
objj_msgSend(_4,"setValue:forThemeAttribute:",CPImageLeft,"image-position");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPLineBreakByTruncatingTail,"line-break-mode");
objj_msgSend(_4,"setMenu:",objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:",""));
objj_msgSend(_4,"setPullsDown:",_7);
var _8=CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld;
objj_msgSend(_4,"addObserver:forKeyPath:options:context:",_4,"menu.items",_8,nil);
objj_msgSend(_4,"addObserver:forKeyPath:options:context:",_4,"_firstItem.changeCount",_8,nil);
objj_msgSend(_4,"addObserver:forKeyPath:options:context:",_4,"selectedItem.changeCount",_8,nil);
}
return _4;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_9,_a,_b){
with(_9){
return objj_msgSend(_9,"initWithFrame:pullsDown:",_b,NO);
}
}),new objj_method(sel_getUid("setPullsDown:"),function(_c,_d,_e){
with(_c){
if(_e){
var _f=objj_msgSend(_c,"setThemeState:",CPPopUpButtonStatePullsDown);
}else{
var _f=objj_msgSend(_c,"unsetThemeState:",CPPopUpButtonStatePullsDown);
}
if(!_f){
return;
}
var _10=objj_msgSend(objj_msgSend(_c,"menu"),"itemArray");
if(objj_msgSend(_10,"count")<=0){
return;
}
objj_msgSend(_10[0],"setHidden:",objj_msgSend(_c,"pullsDown"));
objj_msgSend(_c,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("pullsDown"),function(_11,_12){
with(_11){
return objj_msgSend(_11,"hasThemeState:",CPPopUpButtonStatePullsDown);
}
}),new objj_method(sel_getUid("addItem:"),function(_13,_14,_15){
with(_13){
objj_msgSend(objj_msgSend(_13,"menu"),"addItem:",_15);
}
}),new objj_method(sel_getUid("addItemWithTitle:"),function(_16,_17,_18){
with(_16){
objj_msgSend(objj_msgSend(_16,"menu"),"addItemWithTitle:action:keyEquivalent:",_18,NULL,nil);
}
}),new objj_method(sel_getUid("addItemsWithTitles:"),function(_19,_1a,_1b){
with(_19){
var _1c=0,_1d=objj_msgSend(_1b,"count");
for(;_1c<_1d;++_1c){
objj_msgSend(_19,"addItemWithTitle:",_1b[_1c]);
}
}
}),new objj_method(sel_getUid("insertItemWithTitle:atIndex:"),function(_1e,_1f,_20,_21){
with(_1e){
var _22=objj_msgSend(_1e,"itemArray"),_23=objj_msgSend(_22,"count");
while(_23--){
if(objj_msgSend(_22[_23],"title")==_20){
objj_msgSend(_1e,"removeItemAtIndex:",_23);
}
}
objj_msgSend(objj_msgSend(_1e,"menu"),"insertItemWithTitle:action:keyEquivalent:atIndex:",_20,NULL,nil,_21);
}
}),new objj_method(sel_getUid("removeAllItems"),function(_24,_25){
with(_24){
objj_msgSend(objj_msgSend(_24,"menu"),"removeAllItems");
objj_msgSend(_24,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("removeItemWithTitle:"),function(_26,_27,_28){
with(_26){
objj_msgSend(_26,"removeItemAtIndex:",objj_msgSend(_26,"indexOfItemWithTitle:",_28));
objj_msgSend(_26,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(objj_msgSend(_29,"menu"),"removeItemAtIndex:",_2b);
objj_msgSend(_29,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectedItem"),function(_2c,_2d){
with(_2c){
var _2e=objj_msgSend(_2c,"indexOfSelectedItem");
if(_2e<0||_2e>objj_msgSend(_2c,"numberOfItems")-1){
return nil;
}
return objj_msgSend(objj_msgSend(_2c,"menu"),"itemAtIndex:",_2e);
}
}),new objj_method(sel_getUid("titleOfSelectedItem"),function(_2f,_30){
with(_2f){
return objj_msgSend(objj_msgSend(_2f,"selectedItem"),"title");
}
}),new objj_method(sel_getUid("indexOfSelectedItem"),function(_31,_32){
with(_31){
return _selectedIndex;
}
}),new objj_method(sel_getUid("selectItem:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_33,"selectItemAtIndex:",objj_msgSend(_33,"indexOfItem:",_35));
}
}),new objj_method(sel_getUid("selectItemAtIndex:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_36,"setObjectValue:",_38);
}
}),new objj_method(sel_getUid("setSelectedIndex:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_39,"setObjectValue:",_3b);
}
}),new objj_method(sel_getUid("selectedIndex"),function(_3c,_3d){
with(_3c){
return objj_msgSend(_3c,"objectValue");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_3e,_3f,_40){
with(_3e){
var _41=objj_msgSend(_3e,"objectValue");
_40=parseInt(+_40,10);
if(_41===_40){
return;
}
if(_41>=0&&!objj_msgSend(_3e,"pullsDown")){
objj_msgSend(objj_msgSend(_3e,"selectedItem"),"setState:",CPOffState);
}
_selectedIndex=_40;
if(_41>=0&&!objj_msgSend(_3e,"pullsDown")){
objj_msgSend(objj_msgSend(_3e,"selectedItem"),"setState:",CPOnState);
}
objj_msgSend(_3e,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("objectValue"),function(_42,_43){
with(_42){
return _selectedIndex;
}
}),new objj_method(sel_getUid("selectItemWithTag:"),function(_44,_45,_46){
with(_44){
objj_msgSend(_44,"selectItemAtIndex:",objj_msgSend(_44,"indexOfItemWithTag:",_46));
}
}),new objj_method(sel_getUid("selectItemWithTitle:"),function(_47,_48,_49){
with(_47){
objj_msgSend(_47,"selectItemAtIndex:",objj_msgSend(_47,"indexOfItemWithTitle:",_49));
}
}),new objj_method(sel_getUid("numberOfItems"),function(_4a,_4b){
with(_4a){
return objj_msgSend(objj_msgSend(_4a,"menu"),"numberOfItems");
}
}),new objj_method(sel_getUid("itemArray"),function(_4c,_4d){
with(_4c){
return objj_msgSend(objj_msgSend(_4c,"menu"),"itemArray");
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_4e,_4f,_50){
with(_4e){
return objj_msgSend(objj_msgSend(_4e,"menu"),"itemAtIndex:",_50);
}
}),new objj_method(sel_getUid("itemTitleAtIndex:"),function(_51,_52,_53){
with(_51){
return objj_msgSend(objj_msgSend(objj_msgSend(_51,"menu"),"itemAtIndex:",_53),"title");
}
}),new objj_method(sel_getUid("itemTitles"),function(_54,_55){
with(_54){
var _56=[],_57=objj_msgSend(_54,"itemArray"),_58=0,_59=objj_msgSend(_57,"count");
for(;_58<_59;++_58){
_56.push(objj_msgSend(_57[_58],"title"));
}
return _56;
}
}),new objj_method(sel_getUid("itemWithTitle:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5a,"menu"),_5e=objj_msgSend(_5d,"indexOfItemWithTitle:",_5c);
if(_5e===CPNotFound){
return nil;
}
return objj_msgSend(_5d,"itemAtIndex:",_5e);
}
}),new objj_method(sel_getUid("lastItem"),function(_5f,_60){
with(_5f){
return objj_msgSend(objj_msgSend(objj_msgSend(_5f,"menu"),"itemArray"),"lastObject");
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_61,_62,_63){
with(_61){
return objj_msgSend(objj_msgSend(_61,"menu"),"indexOfItem:",_63);
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_64,_65,_66){
with(_64){
return objj_msgSend(objj_msgSend(_64,"menu"),"indexOfItemWithTag:",_66);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_67,_68,_69){
with(_67){
return objj_msgSend(objj_msgSend(_67,"menu"),"indexOfItemWithTitle:",_69);
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_6a,_6b,_6c){
with(_6a){
return objj_msgSend(objj_msgSend(_6a,"menu"),"indexOfItemWithRepresentedObject:",_6c);
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:action:"),function(_6d,_6e,_6f,_70){
with(_6d){
return objj_msgSend(objj_msgSend(_6d,"menu"),"indexOfItemWithTarget:action:",_6f,_70);
}
}),new objj_method(sel_getUid("preferredEdge"),function(_71,_72){
with(_71){
return _preferredEdge;
}
}),new objj_method(sel_getUid("setPreferredEdge:"),function(_73,_74,_75){
with(_73){
_preferredEdge=_75;
}
}),new objj_method(sel_getUid("setTitle:"),function(_76,_77,_78){
with(_76){
if(objj_msgSend(_76,"title")===_78){
return;
}
if(objj_msgSend(_76,"pullsDown")){
var _79=objj_msgSend(objj_msgSend(_76,"menu"),"itemArray");
if(objj_msgSend(_79,"count")<=0){
objj_msgSend(_76,"addItemWithTitle:",_78);
}else{
objj_msgSend(_79[0],"setTitle:",_78);
objj_msgSend(_76,"synchronizeTitleAndSelectedItem");
}
}else{
var _7a=objj_msgSend(_76,"indexOfItemWithTitle:",_78);
if(_7a<0){
objj_msgSend(_76,"addItemWithTitle:",_78);
_7a=objj_msgSend(_76,"numberOfItems")-1;
}
objj_msgSend(_76,"selectItemAtIndex:",_7a);
}
}
}),new objj_method(sel_getUid("setImage:"),function(_7b,_7c,_7d){
with(_7b){
}
}),new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"),function(_7e,_7f){
with(_7e){
var _80=nil;
if(objj_msgSend(_7e,"pullsDown")){
var _81=objj_msgSend(objj_msgSend(_7e,"menu"),"itemArray");
if(objj_msgSend(_81,"count")>0){
_80=_81[0];
}
}else{
_80=objj_msgSend(_7e,"selectedItem");
}
objj_msgSendSuper({receiver:_7e,super_class:objj_getClass("CPPopUpButton").super_class},"setImage:",objj_msgSend(_80,"image"));
objj_msgSendSuper({receiver:_7e,super_class:objj_getClass("CPPopUpButton").super_class},"setTitle:",objj_msgSend(_80,"title"));
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_82,_83,_84,_85,_86,_87){
with(_82){
var _88=objj_msgSend(_82,"pullsDown");
if(!_88&&_84==="selectedItem.changeCount"||_88&&(_84==="_firstItem"||_84==="_firstItem.changeCount")){
objj_msgSend(_82,"synchronizeTitleAndSelectedItem");
}
if(_84==="menu"){
_84="menu.items";
objj_msgSend(_86,"setObject:forKey:",CPKeyValueChangeSetting,CPKeyValueChangeKindKey);
objj_msgSend(_86,"setObject:forKey:",objj_msgSend(objj_msgSend(_82,"menu"),"itemArray"),CPKeyValueChangeNewKey);
}
if(_84==="menu.items"){
var _89=objj_msgSend(_86,"objectForKey:",CPKeyValueChangeKindKey),_8a=objj_msgSend(_82,"indexOfSelectedItem");
if(_89===CPKeyValueChangeRemoval){
var _8b=CPNotFound,_8c=objj_msgSend(_86,"objectForKey:",CPKeyValueChangeIndexesKey);
if(objj_msgSend(_8c,"containsIndex:",0)&&objj_msgSend(_82,"pullsDown")){
objj_msgSend(_82,"_firstItemDidChange");
}
if(!objj_msgSend(_82,"pullsDown")&&objj_msgSend(_8c,"containsIndex:",_8a)){
_8a=0;
}else{
while((_8b=objj_msgSend(_8c,"indexGreaterThanIndex:",_8b))!==CPNotFound&&_8b<=_8a){
--_8a;
}
}
objj_msgSend(_82,"selectItemAtIndex:",_8a);
}else{
if(_89===CPKeyValueChangeReplacement){
var _8c=objj_msgSend(_86,"objectForKey:",CPKeyValueChangeIndexesKey);
if(_88&&objj_msgSend(_8c,"containsIndex:",0)||!_88&&objj_msgSend(_8c,"containsIndex:",_8a)){
objj_msgSend(_82,"synchronizeTitleAndSelectedItem");
}
}else{
var _8d=objj_msgSend(_86,"objectForKey:",CPKeyValueChangeNewKey);
objj_msgSend(_8d,"enumerateObjectsUsingBlock:",function(_8e){
var _8f=objj_msgSend(_8e,"action");
if(!_8f){
objj_msgSend(_8e,"setAction:",_8f=sel_getUid("_popUpItemAction:"));
}
if(_8f===sel_getUid("_popUpItemAction:")){
objj_msgSend(_8e,"setTarget:",_82);
}
});
if(_89===CPKeyValueChangeSetting){
objj_msgSend(_82,"_firstItemDidChange");
objj_msgSend(_82,"selectItemAtIndex:",CPNotFound);
objj_msgSend(_82,"selectItemAtIndex:",MIN(objj_msgSend(_8d,"count")-1,_8a));
}else{
var _8c=objj_msgSend(_86,"objectForKey:",CPKeyValueChangeIndexesKey);
if(objj_msgSend(_82,"pullsDown")&&objj_msgSend(_8c,"containsIndex:",0)){
objj_msgSend(_82,"_firstItemDidChange");
if(objj_msgSend(_82,"numberOfItems")>1){
var _8b=CPNotFound,_90=0;
while((_8b=objj_msgSend(_8c,"indexGreaterThanIndex:",_8b))!==CPNotFound&&_8b<=_90){
++_90;
}
objj_msgSend(objj_msgSend(_82,"itemAtIndex:",_90),"setHidden:",NO);
}
}
if(_8a<0){
objj_msgSend(_82,"selectItemAtIndex:",0);
}else{
var _8b=CPNotFound;
while((_8b=objj_msgSend(_8c,"indexGreaterThanIndex:",_8b))!==CPNotFound&&_8b<=_8a){
++_8a;
}
objj_msgSend(_82,"selectItemAtIndex:",_8a);
}
}
}
}
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_91,_92,_93){
with(_91){
if(!objj_msgSend(_91,"isEnabled")||!objj_msgSend(_91,"numberOfItems")){
return;
}
objj_msgSend(_91,"highlight:",YES);
var _94=objj_msgSend(_91,"menu"),_95=objj_msgSend(_91,"bounds"),_96=CGRectGetWidth(_95);
objj_msgSend(_94,"setFont:",objj_msgSend(_91,"font"));
if(objj_msgSend(_91,"pullsDown")){
var _97=nil,_98=CGPointMake(0,CGRectGetMaxY(_95));
}else{
var _99=objj_msgSend(_91,"contentRectForBounds:",_95),_97=objj_msgSend(_91,"selectedItem"),_9a=objj_msgSend(_CPMenuWindow,"_standardLeftMargin")+objj_msgSend(_CPMenuItemStandardView,"_standardLeftMargin"),_98=CGPointMake(CGRectGetMinX(_99)-_9a,0);
_96+=_9a;
objj_msgSend(_94,"_highlightItemAtIndex:",CPNotFound);
}
objj_msgSend(_94,"setMinimumWidth:",_96);
objj_msgSend(_94,"_popUpMenuPositioningItem:atLocation:topY:bottomY:inView:callback:",_97,_98,CGRectGetMinY(_95),CGRectGetMaxY(_95),_91,function(_9b){
objj_msgSend(_91,"highlight:",NO);
var _9c=objj_msgSend(_9b,"highlightedItem");
if(objj_msgSend(_9c,"_isSelectable")){
objj_msgSend(_91,"selectItem:",_9c);
}
});
}
}),new objj_method(sel_getUid("rightMouseDown:"),function(_9d,_9e,_9f){
with(_9d){
}
}),new objj_method(sel_getUid("_popUpItemAction:"),function(_a0,_a1,_a2){
with(_a0){
objj_msgSend(_a0,"sendAction:to:",objj_msgSend(_a0,"action"),objj_msgSend(_a0,"target"));
}
}),new objj_method(sel_getUid("_firstItemDidChange"),function(_a3,_a4){
with(_a3){
objj_msgSend(_a3,"willChangeValueForKey:","_firstItem");
objj_msgSend(_a3,"didChangeValueForKey:","_firstItem");
objj_msgSend(objj_msgSend(_a3,"_firstItem"),"setHidden:",YES);
}
}),new objj_method(sel_getUid("_firstItem"),function(_a5,_a6){
with(_a5){
if(objj_msgSend(_a5,"numberOfItems")<=0){
return nil;
}
return objj_msgSend(objj_msgSend(_a5,"menu"),"itemAtIndex:",0);
}
}),new objj_method(sel_getUid("takeValueFromKeyPath:ofObjects:"),function(_a7,_a8,_a9,_aa){
with(_a7){
var _ab=_aa.length,_ac=objj_msgSend(_aa[0],"valueForKeyPath:",_a9);
objj_msgSend(_a7,"selectItemWithTag:",_ac);
objj_msgSend(_a7,"setEnabled:",YES);
while(_ab-->1){
if(_ac!==objj_msgSend(_aa[_ab],"valueForKeyPath:",_a9)){
objj_msgSend(objj_msgSend(_a7,"selectedItem"),"setState:",CPOffState);
}
}
}
}),new objj_method(sel_getUid("_reverseSetBinding"),function(_ad,_ae){
with(_ad){
objj_msgSend(_CPPopUpButtonSelectionBinder,"reverseSetValueForObject:",_ad);
objj_msgSendSuper({receiver:_ad,super_class:objj_getClass("CPPopUpButton").super_class},"_reverseSetBinding");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("defaultThemeClass"),function(_af,_b0){
with(_af){
return "popup-button";
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSelectedIndex"),function(_b1,_b2){
with(_b1){
return objj_msgSend(CPSet,"setWithObject:","objectValue");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSelectedTag"),function(_b3,_b4){
with(_b3){
return objj_msgSend(CPSet,"setWithObject:","objectValue");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSelectedItem"),function(_b5,_b6){
with(_b5){
return objj_msgSend(CPSet,"setWithObject:","objectValue");
}
})]);
var _2=objj_getClass("CPPopUpButton");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
}
var _3=_2.isa;
class_addMethods(_3,[new objj_method(sel_getUid("_binderClassForBinding:"),function(_b7,_b8,_b9){
with(_b7){
if(_b9==CPSelectedIndexBinding||_b9==CPSelectedObjectBinding||_b9==CPSelectedTagBinding||_b9==CPSelectedValueBinding||_b9==CPContentBinding||_b9==CPContentObjectsBinding||_b9==CPContentValuesBinding){
var _ba=_b9.charAt(0).toUpperCase()+_b9.substr(1);
return objj_msgSend(CPClassFromString("_CPPopUpButton"+_ba+"Binder"),"class");
}
return objj_msgSendSuper({receiver:_b7,super_class:objj_getMetaClass("CPPopUpButton").super_class},"_binderClassForBinding:",_b9);
}
})]);
var _2=objj_allocateClassPair(CPBinder,"_CPPopUpButtonContentBinder"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_getInsertNullOffset"),function(_bb,_bc){
with(_bb){
var _bd=objj_msgSend(_info,"objectForKey:",CPOptionsKey);
return objj_msgSend(_bd,"objectForKey:",CPInsertsNullPlaceholderBindingOption)?1:0;
}
}),new objj_method(sel_getUid("_getNullPlaceholder"),function(_be,_bf){
with(_be){
var _c0=objj_msgSend(_info,"objectForKey:",CPOptionsKey),_c1=objj_msgSend(_c0,"objectForKey:",CPNullPlaceholderBindingOption)||"";
if(_c1===objj_msgSend(CPNull,"null")){
_c1="";
}
return _c1;
}
}),new objj_method(sel_getUid("transformValue:withOptions:"),function(_c2,_c3,_c4,_c5){
with(_c2){
return _c4;
}
}),new objj_method(sel_getUid("setValue:forBinding:"),function(_c6,_c7,_c8,_c9){
with(_c6){
objj_msgSend(_c6,"_setContent:",_c8);
objj_msgSend(_c6,"_setContentValuesIfNeeded:",_c8);
}
}),new objj_method(sel_getUid("valueForBinding:"),function(_ca,_cb,_cc){
with(_ca){
return objj_msgSend(_ca,"_content");
}
}),new objj_method(sel_getUid("_setContent:"),function(_cd,_ce,_cf){
with(_cd){
var _d0=objj_msgSend(_cf,"count"),_d1=objj_msgSend(_info,"objectForKey:",CPOptionsKey),_d2=objj_msgSend(_cd,"_getInsertNullOffset");
if(_d0+_d2!=objj_msgSend(_source,"numberOfItems")){
objj_msgSend(_source,"removeAllItems");
if(_d2){
objj_msgSend(_source,"addItemWithTitle:",objj_msgSend(_cd,"_getNullPlaceholder"));
}
for(var i=0;i<_d0;i++){
var _d3=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","",NULL,nil);
objj_msgSend(_cd,"_setValue:forItem:withOptions:",objj_msgSend(_cf,"objectAtIndex:",i),_d3,_d1);
objj_msgSend(_source,"addItem:",_d3);
}
}else{
for(var i=0;i<_d0;i++){
objj_msgSend(_cd,"_setValue:forItem:withOptions:",objj_msgSend(_cf,"objectAtIndex:",i),objj_msgSend(_source,"itemAtIndex:",i+_d2),_d1);
}
}
}
}),new objj_method(sel_getUid("_setContentValuesIfNeeded:"),function(_d4,_d5,_d6){
with(_d4){
var _d7=objj_msgSend(_d4,"_getInsertNullOffset");
if(!objj_msgSend(_source,"infoForBinding:",CPContentValuesBinding)){
if(_d7){
objj_msgSend(objj_msgSend(_source,"itemAtIndex:",0),"setTitle:",objj_msgSend(_d4,"_getNullPlaceholder"));
}
var _d8=objj_msgSend(_d6,"count");
for(var i=0;i<_d8;i++){
objj_msgSend(objj_msgSend(_source,"itemAtIndex:",i+_d7),"setTitle:",objj_msgSend(objj_msgSend(_d6,"objectAtIndex:",i),"description"));
}
}
}
}),new objj_method(sel_getUid("_setValue:forItem:withOptions:"),function(_d9,_da,_db,_dc,_dd){
with(_d9){
var _de=objj_msgSend(_d9,"_transformValue:withOptions:",_db,_dd);
objj_msgSend(_dc,"setRepresentedObject:",_de);
}
}),new objj_method(sel_getUid("_transformValue:withOptions:"),function(_df,_e0,_e1,_e2){
with(_df){
return objj_msgSendSuper({receiver:_df,super_class:objj_getClass("_CPPopUpButtonContentBinder").super_class},"transformValue:withOptions:",_e1,_e2);
}
}),new objj_method(sel_getUid("_content"),function(_e3,_e4){
with(_e3){
return objj_msgSend(_source,"valueForKeyPath:","itemArray.representedObject");
}
})]);
var _2=objj_allocateClassPair(_CPPopUpButtonContentBinder,"_CPPopUpButtonContentValuesBinder"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("setValue:forBinding:"),function(_e5,_e6,_e7,_e8){
with(_e5){
objj_msgSendSuper({receiver:_e5,super_class:objj_getClass("_CPPopUpButtonContentValuesBinder").super_class},"_setContent:",_e7);
}
}),new objj_method(sel_getUid("_setValue:forItem:withOptions:"),function(_e9,_ea,_eb,_ec,_ed){
with(_e9){
if(_eb===objj_msgSend(CPNull,"null")){
_eb=nil;
}
var _ee=objj_msgSend(_e9,"_transformValue:withOptions:",_eb,_ed);
objj_msgSend(_ec,"setTitle:",_ee);
}
}),new objj_method(sel_getUid("_content"),function(_ef,_f0){
with(_ef){
return objj_msgSend(_source,"valueForKeyPath:","itemArray.title");
}
})]);
var _f1={};
var _2=objj_allocateClassPair(CPBinder,"_CPPopUpButtonSelectionBinder"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_selectionBinding")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_selectionBinding"),function(_f2,_f3){
with(_f2){
return _selectionBinding;
}
}),new objj_method(sel_getUid("_setSelectionBinding:"),function(_f4,_f5,_f6){
with(_f4){
_selectionBinding=_f6;
}
}),new objj_method(sel_getUid("initWithBinding:name:to:keyPath:options:from:"),function(_f7,_f8,_f9,_fa,_fb,_fc,_fd,_fe){
with(_f7){
_f7=objj_msgSendSuper({receiver:_f7,super_class:objj_getClass("_CPPopUpButtonSelectionBinder").super_class},"initWithBinding:name:to:keyPath:options:from:",_f9,_fa,_fb,_fc,_fd,_fe);
if(_f7){
_f1[objj_msgSend(_fe,"UID")]=_f7;
_selectionBinding=_fa;
}
return _f7;
}
}),new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"),function(_ff,_100,_101,_102,_103){
with(_ff){
objj_msgSend(_ff,"setValue:forBinding:",_101,_103);
}
}),new objj_method(sel_getUid("_getInsertNullOffset"),function(self,_104){
with(self){
var _105=objj_msgSend(objj_msgSend(CPBinder,"infoForBinding:forObject:",CPContentBinding,_source),"objectForKey:",CPOptionsKey);
return objj_msgSend(_105,"objectForKey:",CPInsertsNullPlaceholderBindingOption)?1:0;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("reverseSetValueForObject:"),function(self,_106,_107){
with(self){
var _108=_f1[objj_msgSend(_107,"UID")];
objj_msgSend(_108,"reverseSetValueFor:",objj_msgSend(_108,"_selectionBinding"));
}
})]);
var _2=objj_allocateClassPair(_CPPopUpButtonSelectionBinder,"_CPPopUpButtonSelectedIndexBinder"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("setValue:forBinding:"),function(self,_109,_10a,_10b){
with(self){
objj_msgSend(_source,"selectItemAtIndex:",_10a+objj_msgSend(self,"_getInsertNullOffset"));
}
}),new objj_method(sel_getUid("valueForBinding:"),function(self,_10c,_10d){
with(self){
return objj_msgSend(_source,"indexOfSelectedItem")-objj_msgSend(self,"_getInsertNullOffset");
}
})]);
var _2=objj_allocateClassPair(_CPPopUpButtonSelectionBinder,"_CPPopUpButtonSelectedObjectBinder"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("setValue:forBinding:"),function(self,_10e,_10f,_110){
with(self){
var _111=objj_msgSend(_source,"indexOfItemWithRepresentedObject:",_10f),_112=objj_msgSend(self,"_getInsertNullOffset");
if(_112===1&&_111===CPNotFound){
_111=0;
}
objj_msgSend(_source,"selectItemAtIndex:",_111);
}
}),new objj_method(sel_getUid("valueForBinding:"),function(self,_113,_114){
with(self){
return objj_msgSend(objj_msgSend(_source,"selectedItem"),"representedObject");
}
})]);
var _2=objj_allocateClassPair(_CPPopUpButtonSelectionBinder,"_CPPopUpButtonSelectedTagBinder"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("setValue:forBinding:"),function(self,_115,_116,_117){
with(self){
objj_msgSend(_source,"selectItemWithTag:",_116);
}
}),new objj_method(sel_getUid("valueForBinding:"),function(self,_118,_119){
with(self){
return objj_msgSend(objj_msgSend(_source,"selectedItem"),"tag");
}
})]);
var _2=objj_allocateClassPair(_CPPopUpButtonSelectionBinder,"_CPPopUpButtonSelectedValueBinder"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("setValue:forBinding:"),function(self,_11a,_11b,_11c){
with(self){
objj_msgSend(_source,"selectItemWithTitle:",_11b);
}
}),new objj_method(sel_getUid("valueForBinding:"),function(self,_11d,_11e){
with(self){
return objj_msgSend(_source,"titleOfSelectedItem");
}
})]);
var _11f="CPPopUpButtonMenuKey",_120="CPPopUpButtonSelectedIndexKey";
var _2=objj_getClass("CPPopUpButton");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(self,_121,_122){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPopUpButton").super_class},"initWithCoder:",_122);
if(self){
objj_msgSend(self,"synchronizeTitleAndSelectedItem");
if(objj_msgSend(_122,"containsValueForKey:",_11f)){
CPLog.warn(self+" was encoded with an older version of Cappuccino. Please nib2cib the original nib again or open and re-save in Atlas.");
objj_msgSend(self,"setMenu:",objj_msgSend(_122,"decodeObjectForKey:",_11f));
objj_msgSend(self,"setObjectValue:",objj_msgSend(_122,"decodeObjectForKey:",_120));
}
var _123=CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld;
objj_msgSend(self,"addObserver:forKeyPath:options:context:",self,"menu.items",_123,nil);
objj_msgSend(self,"addObserver:forKeyPath:options:context:",self,"_firstItem.changeCount",_123,nil);
objj_msgSend(self,"addObserver:forKeyPath:options:context:",self,"selectedItem.changeCount",_123,nil);
}
return self;
}
})]);
