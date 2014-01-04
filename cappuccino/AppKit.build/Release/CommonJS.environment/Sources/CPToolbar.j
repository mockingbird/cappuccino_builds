@STATIC;1.0;I;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jt;28446;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPPopUpButton.j",YES);
objj_executeFile("CPToolbarItem.j",YES);
CPToolbarDisplayModeDefault=0;
CPToolbarDisplayModeIconAndLabel=1;
CPToolbarDisplayModeIconOnly=2;
CPToolbarDisplayModeLabelOnly=3;
CPToolbarSizeModeDefault=0;
CPToolbarSizeModeRegular=1;
CPToolbarSizeModeSmall=2;
var _1=nil,_2=nil;
var _3=objj_allocateClassPair(CPObject,"CPToolbar"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_identifier"),new objj_ivar("_displayMode"),new objj_ivar("_showsBaselineSeparator"),new objj_ivar("_allowsUserCustomization"),new objj_ivar("_isVisible"),new objj_ivar("_sizeMode"),new objj_ivar("_desiredHeight"),new objj_ivar("_delegate"),new objj_ivar("_itemIdentifiers"),new objj_ivar("_identifiedItems"),new objj_ivar("_defaultItems"),new objj_ivar("_allowedItems"),new objj_ivar("_selectableItems"),new objj_ivar("_items"),new objj_ivar("_itemsSortedByVisibilityPriority"),new objj_ivar("_toolbarView"),new objj_ivar("_window")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("displayMode"),function(_5,_6){
with(_5){
return _displayMode;
}
}),new objj_method(sel_getUid("setDisplayMode:"),function(_7,_8,_9){
with(_7){
_displayMode=_9;
}
}),new objj_method(sel_getUid("sizeMode"),function(_a,_b){
with(_a){
return _sizeMode;
}
}),new objj_method(sel_getUid("setSizeMode:"),function(_c,_d,_e){
with(_c){
_sizeMode=_e;
}
}),new objj_method(sel_getUid("init"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_11,_12,_13){
with(_11){
_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPToolbar").super_class},"init");
if(_11){
_items=[];
_identifier=_13;
_isVisible=YES;
_sizeMode=CPToolbarSizeModeDefault;
_desiredHeight=0;
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_11,_identifier);
}
return _11;
}
}),new objj_method(sel_getUid("setDisplayMode:"),function(_14,_15,_16){
with(_14){
}
}),new objj_method(sel_getUid("identifier"),function(_17,_18){
with(_17){
return _identifier;
}
}),new objj_method(sel_getUid("delegate"),function(_19,_1a){
with(_19){
return _delegate;
}
}),new objj_method(sel_getUid("isVisible"),function(_1b,_1c){
with(_1b){
return _isVisible;
}
}),new objj_method(sel_getUid("setVisible:"),function(_1d,_1e,_1f){
with(_1d){
if(_isVisible===_1f){
return;
}
_isVisible=_1f;
objj_msgSend(_window,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("setSizeMode:"),function(_20,_21,_22){
with(_20){
if(_22===_sizeMode){
return;
}
_sizeMode=_22;
objj_msgSend(objj_msgSend(_20,"_toolbarView"),"setFrame:",objj_msgSend(_20,"_toolbarViewFrame"));
objj_msgSend(_window,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("_window"),function(_23,_24){
with(_23){
return _window;
}
}),new objj_method(sel_getUid("_setWindow:"),function(_25,_26,_27){
with(_25){
if(_window){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:object:",_25,_window);
}
_window=_27;
if(_window){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_25,sel_getUid("_autovalidate"),_CPWindowDidChangeFirstResponderNotification,_27);
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_28,_29,_2a){
with(_28){
if(_delegate===_2a){
return;
}
_delegate=_2a;
objj_msgSend(_28,"_reloadToolbarItems");
}
}),new objj_method(sel_getUid("setDisplayMode:"),function(_2b,_2c,_2d){
with(_2b){
if(_displayMode===_2d){
return;
}
_displayMode=_2d;
objj_msgSend(_2b,"_reloadToolbarItems");
}
}),new objj_method(sel_getUid("_loadConfiguration"),function(_2e,_2f){
with(_2e){
}
}),new objj_method(sel_getUid("_toolbarViewFrame"),function(_30,_31){
with(_30){
var _32=_desiredHeight||(_sizeMode!=CPToolbarSizeModeSmall?objj_msgSend(_30,"_valueForThemeAttribute:","regular-size-height"):objj_msgSend(_30,"_valueForThemeAttribute:","small-size-height"));
return CPRectMake(0,0,1200,_32);
}
}),new objj_method(sel_getUid("_valueForThemeAttribute:"),function(_33,_34,_35){
with(_33){
return objj_msgSend(objj_msgSend(objj_msgSend(_33,"class"),"_themeAttributes"),"valueForKey:",_35);
}
}),new objj_method(sel_getUid("_toolbarView"),function(_36,_37){
with(_36){
if(!_toolbarView){
_toolbarView=objj_msgSend(objj_msgSend(_CPToolbarView,"alloc"),"initWithFrame:",objj_msgSend(_36,"_toolbarViewFrame"));
objj_msgSend(_toolbarView,"setToolbar:",_36);
objj_msgSend(_toolbarView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
return _toolbarView;
}
}),new objj_method(sel_getUid("_reloadToolbarItems"),function(_38,_39){
with(_38){
_itemIdentifiers=objj_msgSend(_defaultItems,"valueForKey:","itemIdentifier")||[];
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("toolbarDefaultItemIdentifiers:"))){
var _3a=objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_38);
if(_3a){
_itemIdentifiers=objj_msgSend(_3a,"arrayByAddingObjectsFromArray:",_itemIdentifiers);
}
}
var _3b=0,_3c=objj_msgSend(_itemIdentifiers,"count");
_items=[];
for(;_3b<_3c;++_3b){
var _3d=_itemIdentifiers[_3b],_3e=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_3d);
if(!_3e){
_3e=objj_msgSend(_identifiedItems,"objectForKey:",_3d);
}
if(!_3e&&_delegate){
_3e=objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_38,_3d,YES);
}
_3e=objj_msgSend(_3e,"copy");
if(_3e===nil){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Toolbar delegate "+_delegate+" returned nil toolbar item for identifier \""+_3d+"\"");
}
_3e._toolbar=_38;
objj_msgSend(_items,"addObject:",_3e);
}
_itemsSortedByVisibilityPriority=objj_msgSend(_items,"sortedArrayUsingFunction:context:",_3f,NULL);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
}),new objj_method(sel_getUid("items"),function(_40,_41){
with(_40){
return _items;
}
}),new objj_method(sel_getUid("visibleItems"),function(_42,_43){
with(_42){
return objj_msgSend(_toolbarView,"visibleItems");
}
}),new objj_method(sel_getUid("itemsSortedByVisibilityPriority"),function(_44,_45){
with(_44){
return _itemsSortedByVisibilityPriority;
}
}),new objj_method(sel_getUid("validateVisibleItems"),function(_46,_47){
with(_46){
var _48=objj_msgSend(_46,"visibleItems"),_49=objj_msgSend(_48,"count");
while(_49--){
objj_msgSend(_48[_49],"validate");
}
}
}),new objj_method(sel_getUid("_autovalidate"),function(_4a,_4b){
with(_4a){
var _4c=objj_msgSend(_4a,"visibleItems"),_4d=objj_msgSend(_4c,"count");
while(_4d--){
var _4e=objj_msgSend(_4c,"objectAtIndex:",_4d);
if(objj_msgSend(_4e,"autovalidates")){
objj_msgSend(_4e,"validate");
}
}
}
}),new objj_method(sel_getUid("_itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_4f,_50,_51,_52){
with(_4f){
var _53=objj_msgSend(_identifiedItems,"objectForKey:",_51);
if(!_53){
_53=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_51);
if(_delegate&&!_53){
_53=objj_msgSend(objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_4f,_51,_52),"copy");
if(!_53){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Toolbar delegate "+_delegate+" returned nil toolbar item for identifier "+_51);
}
}
objj_msgSend(_identifiedItems,"setObject:forKey:",_53,_51);
}
return _53;
}
}),new objj_method(sel_getUid("_itemsWithIdentifiers:"),function(_54,_55,_56){
with(_54){
var _57=[];
for(var i=0;i<_56.length;i++){
objj_msgSend(_57,"addObject:",objj_msgSend(_54,"_itemForItemIdentifier:willBeInsertedIntoToolbar:",_56[i],NO));
}
return _57;
}
}),new objj_method(sel_getUid("_defaultToolbarItems"),function(_58,_59){
with(_58){
if(!_defaultItems&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("toolbarDefaultItemIdentifiers:"))){
_defaultItems=[];
var _5a=objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_58),_5b=0,_5c=objj_msgSend(_5a,"count");
for(;_5b<_5c;++_5b){
objj_msgSend(_defaultItems,"addObject:",objj_msgSend(_58,"_itemForItemIdentifier:willBeInsertedIntoToolbar:",_5a[_5b],NO));
}
}
return _defaultItems;
}
}),new objj_method(sel_getUid("toolbarItemDidChange:"),function(_5d,_5e,_5f){
with(_5d){
if(objj_msgSend(_identifiedItems,"objectForKey:",objj_msgSend(_5f,"itemIdentifier"))){
objj_msgSend(_identifiedItems,"setObject:forKey:",_5f,objj_msgSend(_5f,"itemIdentifier"));
}
var _60=0,_61=objj_msgSend(_items,"count");
for(;_60<=_61;++_60){
var _62=_items[_60];
if(objj_msgSend(_62,"itemIdentifier")===objj_msgSend(_5f,"itemIdentifier")){
_items[_60]=_5f;
_itemsSortedByVisibilityPriority=objj_msgSend(_items,"sortedArrayUsingFunction:context:",_3f,NULL);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_63,_64){
with(_63){
if(_63!==objj_msgSend(CPToolbar,"class")){
return;
}
_1=objj_msgSend(CPDictionary,"dictionary");
_2=objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("_addToolbar:forIdentifier:"),function(_65,_66,_67,_68){
with(_65){
var _69=objj_msgSend(_1,"objectForKey:",_68);
if(!_69){
_69=[];
objj_msgSend(_1,"setObject:forKey:",_69,_68);
}
objj_msgSend(_69,"addObject:",_67);
}
}),new objj_method(sel_getUid("_themeAttributes"),function(_6a,_6b){
with(_6a){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(4),right:(4),bottom:(4),left:(_6c)},59,46],["content-inset","regular-size-height","small-size-height"]);
}
})]);
var _6d="CPToolbarIdentifierKey",_6e="CPToolbarDisplayModeKey",_6f="CPToolbarShowsBaselineSeparatorKey",_70="CPToolbarAllowsUserCustomizationKey",_71="CPToolbarIsVisibleKey",_72="CPToolbarDelegateKey",_73="CPToolbarIdentifiedItemsKey",_74="CPToolbarDefaultItemsKey",_75="CPToolbarAllowedItemsKey",_76="CPToolbarSelectableItemsKey",_77="CPToolbarSizeModeKey";
var _3=objj_getClass("CPToolbar");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPToolbar\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_78,_79,_7a){
with(_78){
_78=objj_msgSendSuper({receiver:_78,super_class:objj_getClass("CPToolbar").super_class},"init");
if(_78){
_identifier=objj_msgSend(_7a,"decodeObjectForKey:",_6d);
_displayMode=objj_msgSend(_7a,"decodeIntForKey:",_6e);
_showsBaselineSeparator=objj_msgSend(_7a,"decodeBoolForKey:",_6f);
_allowsUserCustomization=objj_msgSend(_7a,"decodeBoolForKey:",_70);
_isVisible=objj_msgSend(_7a,"decodeBoolForKey:",_71);
_sizeMode=objj_msgSend(_7a,"decodeIntForKey:",_77);
_identifiedItems=objj_msgSend(_7a,"decodeObjectForKey:",_73);
_defaultItems=objj_msgSend(_7a,"decodeObjectForKey:",_74);
_allowedItems=objj_msgSend(_7a,"decodeObjectForKey:",_75);
_selectableItems=objj_msgSend(_7a,"decodeObjectForKey:",_76);
objj_msgSend(objj_msgSend(_identifiedItems,"allValues"),"makeObjectsPerformSelector:withObject:",sel_getUid("_setToolbar:"),_78);
_items=[];
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_78,_identifier);
objj_msgSend(_78,"setDelegate:",objj_msgSend(_7a,"decodeObjectForKey:",_72));
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_reloadToolbarItems"),_78,nil,0,[CPDefaultRunLoopMode]);
}
return _78;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7b,_7c,_7d){
with(_7b){
objj_msgSend(_7d,"encodeObject:forKey:",_identifier,_6d);
objj_msgSend(_7d,"encodeInt:forKey:",_displayMode,_6e);
objj_msgSend(_7d,"encodeBool:forKey:",_showsBaselineSeparator,_6f);
objj_msgSend(_7d,"encodeBool:forKey:",_allowsUserCustomization,_70);
objj_msgSend(_7d,"encodeBool:forKey:",_isVisible,_71);
objj_msgSend(_7d,"encodeInt:forKey:",_sizeMode,_77);
objj_msgSend(_7d,"encodeObject:forKey:",_identifiedItems,_73);
objj_msgSend(_7d,"encodeObject:forKey:",_defaultItems,_74);
objj_msgSend(_7d,"encodeObject:forKey:",_allowedItems,_75);
objj_msgSend(_7d,"encodeObject:forKey:",_selectableItems,_76);
objj_msgSend(_7d,"encodeConditionalObject:forKey:",_delegate,_72);
}
})]);
var _7e=nil,_7f=nil,_80=nil;
var _6c=10,_81=20;
var _82=function(_83,_84,_85,_86){
return {index:_83,view:_84,label:_85,minWidth:_86};
};
var _3=objj_allocateClassPair(CPView,"_CPToolbarView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_toolbar"),new objj_ivar("_flexibleWidthIndexes"),new objj_ivar("_visibleFlexibleWidthIndexes"),new objj_ivar("_itemInfos"),new objj_ivar("_viewsForToolbarItems"),new objj_ivar("_visibleItems"),new objj_ivar("_invisibleItems"),new objj_ivar("_additionalItemsButton"),new objj_ivar("_labelColor"),new objj_ivar("_labelShadowColor"),new objj_ivar("_minWidth"),new objj_ivar("_FIXME_isHUD")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("visibleItems"),function(_87,_88){
with(_87){
return _visibleItems;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_89,_8a,_8b){
with(_89){
_89=objj_msgSendSuper({receiver:_89,super_class:objj_getClass("_CPToolbarView").super_class},"initWithFrame:",_8b);
if(_89){
_minWidth=0;
_labelColor=objj_msgSend(CPColor,"blackColor");
_labelShadowColor=objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0.75);
_additionalItemsButton=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:pullsDown:",{origin:{x:0,y:0},size:{width:10,height:15}},YES);
objj_msgSend(_additionalItemsButton,"setBordered:",NO);
objj_msgSend(_additionalItemsButton,"setImagePosition:",CPImageOnly);
objj_msgSend(objj_msgSend(_additionalItemsButton,"menu"),"setShowsStateColumn:",NO);
objj_msgSend(objj_msgSend(_additionalItemsButton,"menu"),"setAutoenablesItems:",NO);
objj_msgSend(_additionalItemsButton,"setAlternateImage:",_80);
}
return _89;
}
}),new objj_method(sel_getUid("setToolbar:"),function(_8c,_8d,_8e){
with(_8c){
_toolbar=_8e;
}
}),new objj_method(sel_getUid("toolbar"),function(_8f,_90){
with(_8f){
return _toolbar;
}
}),new objj_method(sel_getUid("FIXME_setIsHUD:"),function(_91,_92,_93){
with(_91){
if(_FIXME_isHUD===_93){
return;
}
_FIXME_isHUD=_93;
var _94=objj_msgSend(_toolbar,"items"),_95=objj_msgSend(_94,"count");
while(_95--){
objj_msgSend(objj_msgSend(_91,"viewForItem:",_94[_95]),"FIXME_setIsHUD:",_93);
}
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_96,_97,_98){
with(_96){
objj_msgSend(_96,"tile");
}
}),new objj_method(sel_getUid("viewForItem:"),function(_99,_9a,_9b){
with(_99){
return _viewsForToolbarItems[objj_msgSend(_9b,"UID")]||nil;
}
}),new objj_method(sel_getUid("tile"),function(_9c,_9d){
with(_9c){
var _9e=objj_msgSend(_toolbar,"items"),_9f=(objj_msgSend(_9c,"bounds").size.width),_a0=_minWidth,_a1=[];
_visibleItems=_9e;
if(_9f<_a0){
_9f-=_81;
_visibleItems=objj_msgSend(_visibleItems,"copy");
var _a2=objj_msgSend(_toolbar,"itemsSortedByVisibilityPriority"),_a3=_a2.length;
while(_a0>_9f&&_a3){
var _a4=_a2[--_a3],_a5=objj_msgSend(_9c,"viewForItem:",_a4);
_a0-=objj_msgSend(_a5,"minSize").width+_6c;
objj_msgSend(_visibleItems,"removeObjectIdenticalTo:",_a4);
objj_msgSend(_a1,"addObject:",_a4);
objj_msgSend(_a5,"setHidden:",YES);
objj_msgSend(_a5,"FIXME_setIsHUD:",_FIXME_isHUD);
}
}
var _a3=objj_msgSend(_9e,"count"),_a6=0;
while(_a3--){
var _a5=objj_msgSend(_9c,"viewForItem:",_9e[_a3]),_a7=objj_msgSend(_a5,"minSize");
if(_a6<_a7.height){
_a6=_a7.height;
}
}
var _a8=objj_msgSend(_toolbar,"_valueForThemeAttribute:","content-inset"),_a9=_a6?_a6+_a8.top+_a8.bottom:0;
if(_a9!=_toolbar._desiredHeight){
_toolbar._desiredHeight=_a9;
objj_msgSend(_9c,"setFrame:",objj_msgSend(_toolbar,"_toolbarViewFrame"));
objj_msgSend(_toolbar._window,"_noteToolbarChanged");
return;
}
var _a3=_visibleItems.length,_aa=objj_msgSend(CPIndexSet,"indexSet");
while(_a3--){
var _a4=_visibleItems[_a3],_a5=objj_msgSend(_9c,"viewForItem:",_a4),_a7=objj_msgSend(_a5,"minSize");
if(_a7.width!==objj_msgSend(_a5,"maxSize").width){
objj_msgSend(_aa,"addIndex:",_a3);
}else{
objj_msgSend(_a5,"setFrameSize:",{width:_a7.width,height:_a6});
}
objj_msgSend(_a5,"setHidden:",NO);
}
var _ab=_9f-_a0,_ac=0;
while(_ab&&objj_msgSend(_aa,"count")){
_ac+=_ab/objj_msgSend(_aa,"count");
_ab=0;
var _ad=CPNotFound;
while((_ad=objj_msgSend(_aa,"indexGreaterThanIndex:",_ad))!==CPNotFound){
var _a4=_visibleItems[_ad],_a5=objj_msgSend(_9c,"viewForItem:",_a4),_ae=objj_msgSend(_a5,"minSize").width+_ac,_af=MIN(_ae,objj_msgSend(_a5,"maxSize").width);
if(_af<_ae){
objj_msgSend(_aa,"removeIndex:",_ad);
_ab+=_ae-_af;
}
objj_msgSend(_a5,"setFrameSize:",{width:_af,height:_a6});
}
}
var _ad=0,_a3=_visibleItems.length,x=_a8.left,_a8=objj_msgSend(_toolbar,"_valueForThemeAttribute:","content-inset"),y=_a8.top;
for(;_ad<_a3;++_ad){
var _a5=objj_msgSend(_9c,"viewForItem:",_visibleItems[_ad]),_b0=(objj_msgSend(_a5,"frame").size.width);
objj_msgSend(_a5,"setFrame:",{origin:{x:x,y:y},size:{width:_b0,height:_a6}});
x+=_b0+_6c;
}
var _b1=NO;
if(objj_msgSend(_a1,"count")){
var _ad=0,_a3=objj_msgSend(_9e,"count");
_invisibleItems=[];
for(;_ad<_a3;++_ad){
var _a4=_9e[_ad];
if(objj_msgSend(_a1,"indexOfObjectIdenticalTo:",_a4)!==CPNotFound){
objj_msgSend(_invisibleItems,"addObject:",_a4);
var _b2=objj_msgSend(_a4,"itemIdentifier");
if(_b2!==CPToolbarSpaceItemIdentifier&&_b2!==CPToolbarFlexibleSpaceItemIdentifier&&_b2!==CPToolbarSeparatorItemIdentifier){
_b1=YES;
}
}
}
}
if(_b1){
objj_msgSend(_additionalItemsButton,"setFrameOrigin:",{x:_9f+5,y:((objj_msgSend(_9c,"bounds").size.height)-(objj_msgSend(_additionalItemsButton,"frame").size.height))/2});
objj_msgSend(_9c,"addSubview:",_additionalItemsButton);
objj_msgSend(_additionalItemsButton,"removeAllItems");
objj_msgSend(_additionalItemsButton,"addItemWithTitle:","Additional Items");
objj_msgSend(objj_msgSend(_additionalItemsButton,"itemArray")[0],"setImage:",_7f);
var _ad=0,_a3=objj_msgSend(_invisibleItems,"count"),_b3=NO;
for(;_ad<_a3;++_ad){
var _a4=_invisibleItems[_ad],_b2=objj_msgSend(_a4,"itemIdentifier");
if(_b2===CPToolbarSpaceItemIdentifier||_b2===CPToolbarFlexibleSpaceItemIdentifier){
continue;
}
if(_b2===CPToolbarSeparatorItemIdentifier){
if(_b3){
objj_msgSend(_additionalItemsButton,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
}
continue;
}
_b3=YES;
var _b4=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_a4,"label"),sel_getUid("didSelectMenuItem:"),nil);
objj_msgSend(_b4,"setRepresentedObject:",_a4);
objj_msgSend(_b4,"setImage:",objj_msgSend(_a4,"image"));
objj_msgSend(_b4,"setTarget:",_9c);
objj_msgSend(_b4,"setEnabled:",objj_msgSend(_a4,"isEnabled"));
objj_msgSend(_additionalItemsButton,"addItem:",_b4);
}
}else{
objj_msgSend(_additionalItemsButton,"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("didSelectMenuItem:"),function(_b5,_b6,_b7){
with(_b5){
var _b8=objj_msgSend(_b7,"representedObject");
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_b8,"action"),objj_msgSend(_b8,"target"),_b8);
}
}),new objj_method(sel_getUid("reloadToolbarItems"),function(_b9,_ba){
with(_b9){
var _bb=objj_msgSend(_b9,"subviews"),_bc=_bb.length;
while(_bc--){
objj_msgSend(_bb[_bc],"removeFromSuperview");
}
var _bd=objj_msgSend(_toolbar,"items"),_be=0;
_bc=_bd.length;
_minWidth=_6c;
_viewsForToolbarItems={};
for(;_be<_bc;++_be){
var _bf=_bd[_be],_c0=objj_msgSend(objj_msgSend(_CPToolbarItemView,"alloc"),"initWithToolbarItem:toolbar:",_bf,_b9);
_viewsForToolbarItems[objj_msgSend(_bf,"UID")]=_c0;
if(objj_msgSend(_bf,"toolTip")&&objj_msgSend(_c0,"respondsToSelector:",sel_getUid("setToolTip:"))){
objj_msgSend(_c0,"setToolTip:",objj_msgSend(_bf,"toolTip"));
}
objj_msgSend(_b9,"addSubview:",_c0);
_minWidth+=objj_msgSend(_c0,"minSize").width+_6c;
}
objj_msgSend(_b9,"tile");
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_c1,_c2){
with(_c1){
if(_c1!==objj_msgSend(_CPToolbarView,"class")){
return;
}
var _c3=objj_msgSend(CPBundle,"bundleForClass:",_c1);
_7f=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_c3,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsImage.png"),CPSizeMake(10,15));
_80=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_c3,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsAlternateImage.png"),{width:10,height:15});
}
})]);
var _3f=function(lhs,rhs){
var _c4=objj_msgSend(lhs,"visibilityPriority"),_c5=objj_msgSend(rhs,"visibilityPriority");
if(_c4==_c5){
return CPOrderedSame;
}
if(_c4>_c5){
return CPOrderedAscending;
}
return CPOrderedDescending;
};
var _c6=2;
var _3=objj_allocateClassPair(CPControl,"_CPToolbarItemView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_labelSize"),new objj_ivar("_toolbarItem"),new objj_ivar("_toolbar"),new objj_ivar("_imageView"),new objj_ivar("_view"),new objj_ivar("_labelField"),new objj_ivar("_FIXME_isHUD")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("minSize"),function(_c7,_c8){
with(_c7){
return _minSize;
}
}),new objj_method(sel_getUid("maxSize"),function(_c9,_ca){
with(_c9){
return _maxSize;
}
}),new objj_method(sel_getUid("initWithToolbarItem:toolbar:"),function(_cb,_cc,_cd,_ce){
with(_cb){
_cb=objj_msgSendSuper({receiver:_cb,super_class:objj_getClass("_CPToolbarItemView").super_class},"init");
if(_cb){
_toolbarItem=_cd;
_labelField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_labelField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_labelField,"setTextColor:",objj_msgSend(_cb,"FIXME_labelColor"));
objj_msgSend(_labelField,"setTextShadowColor:",objj_msgSend(_cb,"FIXME_labelShadowColor"));
objj_msgSend(_labelField,"setTextShadowOffset:",{width:0,height:1});
objj_msgSend(_labelField,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinXMargin);
objj_msgSend(_cb,"addSubview:",_labelField);
objj_msgSend(_cb,"updateFromItem");
_toolbar=_ce;
var _cf=["label","image","alternateImage","minSize","maxSize","target","action","enabled"],_d0=0,_d1=objj_msgSend(_cf,"count");
for(;_d0<_d1;++_d0){
objj_msgSend(_toolbarItem,"addObserver:forKeyPath:options:context:",_cb,_cf[_d0],0,NULL);
}
}
return _cb;
}
}),new objj_method(sel_getUid("FIXME_setIsHUD:"),function(_d2,_d3,_d4){
with(_d2){
_FIXME_isHUD=_d4;
objj_msgSend(_labelField,"setTextColor:",objj_msgSend(_d2,"FIXME_labelColor"));
objj_msgSend(_labelField,"setTextShadowColor:",objj_msgSend(_d2,"FIXME_labelShadowColor"));
}
}),new objj_method(sel_getUid("updateFromItem"),function(_d5,_d6){
with(_d5){
var _d7=objj_msgSend(_toolbarItem,"itemIdentifier");
if(_d7===CPToolbarSpaceItemIdentifier||_d7===CPToolbarFlexibleSpaceItemIdentifier||_d7===CPToolbarSeparatorItemIdentifier){
objj_msgSend(_view,"removeFromSuperview");
objj_msgSend(_imageView,"removeFromSuperview");
_minSize=objj_msgSend(_toolbarItem,"minSize");
_maxSize=objj_msgSend(_toolbarItem,"maxSize");
if(_d7===CPToolbarSeparatorItemIdentifier){
_view=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:2,height:32}});
sizes={};
sizes["CPToolbarItemSeparator"]=[{width:2,height:26},{width:2,height:1},{width:2,height:26}];
objj_msgSend(_view,"setBackgroundColor:",_CPControlThreePartImagePattern(YES,sizes,"CPToolbarItem","Separator"));
objj_msgSend(_d5,"addSubview:",_view);
}
return;
}
objj_msgSend(_d5,"setTarget:",objj_msgSend(_toolbarItem,"target"));
objj_msgSend(_d5,"setAction:",objj_msgSend(_toolbarItem,"action"));
var _d8=objj_msgSend(_toolbarItem,"view")||nil;
if(_d8!==_view){
if(!_d8){
objj_msgSend(_view,"removeFromSuperview");
}else{
objj_msgSend(_d5,"addSubview:",_d8);
objj_msgSend(_imageView,"removeFromSuperview");
}
_view=_d8;
}
if(!_view){
if(!_imageView){
_imageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",objj_msgSend(_d5,"bounds"));
objj_msgSend(_imageView,"setImageScaling:",CPImageScaleProportionallyDown);
objj_msgSend(_d5,"addSubview:",_imageView);
}
objj_msgSend(_imageView,"setImage:",objj_msgSend(_toolbarItem,"image"));
}
var _d9=objj_msgSend(_toolbarItem,"minSize"),_da=objj_msgSend(_toolbarItem,"maxSize");
objj_msgSend(_labelField,"setStringValue:",objj_msgSend(_toolbarItem,"label"));
objj_msgSend(_labelField,"sizeToFit");
objj_msgSend(_d5,"setEnabled:",objj_msgSend(_toolbarItem,"isEnabled"));
_labelSize=objj_msgSend(_labelField,"frame").size;
var _db=objj_msgSend(objj_msgSend(_toolbarItem,"toolbar"),"displayMode")===CPToolbarDisplayModeIconOnly,_dc=objj_msgSend(objj_msgSend(_toolbarItem,"toolbar"),"displayMode")===CPToolbarDisplayModeLabelOnly;
objj_msgSend(_labelField,"setHidden:",_db);
objj_msgSend(_view,"setHidden:",_dc);
_minSize={width:MAX(_labelSize.width,_d9.width),height:(_dc?0:_d9.height)+(_db?0:_labelSize.height+_c6)};
_maxSize={width:MAX(_labelSize.width,_da.width),height:100000000};
objj_msgSend(_toolbar,"tile");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_dd,_de){
with(_dd){
var _df=objj_msgSend(_toolbarItem,"itemIdentifier");
if(_df===CPToolbarSpaceItemIdentifier||_df===CPToolbarFlexibleSpaceItemIdentifier){
return;
}
var _e0=objj_msgSend(_dd,"bounds"),_e1=(_e0.size.width);
if(_df===CPToolbarSeparatorItemIdentifier){
return objj_msgSend(_view,"setFrame:",{origin:{x:ROUND((_e1-2)/2),y:0},size:{width:2,height:(_e0.size.height)}});
}
var _e2=_view||_imageView,_e3=objj_msgSend(_toolbarItem,"maxSize"),_e4=objj_msgSend(objj_msgSend(_toolbarItem,"toolbar"),"displayMode")===CPToolbarDisplayModeIconOnly,_e5=(_e0.size.height)-(_e4?0:_labelSize.height),_e6=MIN(_e3.width,_e1),_e7=MIN(_e3.height,_e5);
objj_msgSend(_e2,"setFrame:",{origin:{x:ROUND((_e1-_e6)/2),y:ROUND((_e5-_e7)/2)},size:{width:_e6,height:_e7}});
objj_msgSend(_labelField,"setFrameOrigin:",{x:ROUND((_e1-_labelSize.width)/2),y:(_e0.size.height)-_labelSize.height});
}
}),new objj_method(sel_getUid("mouseDown:"),function(_e8,_e9,_ea){
with(_e8){
if(objj_msgSend(_toolbarItem,"view")){
return objj_msgSend(objj_msgSend(_e8,"nextResponder"),"mouseDown:",_ea);
}
var _eb=objj_msgSend(_toolbarItem,"itemIdentifier");
if(_eb===CPToolbarSpaceItemIdentifier||_eb===CPToolbarFlexibleSpaceItemIdentifier||_eb===CPToolbarSeparatorItemIdentifier){
return objj_msgSend(objj_msgSend(_e8,"nextResponder"),"mouseDown:",_ea);
}
objj_msgSendSuper({receiver:_e8,super_class:objj_getClass("_CPToolbarItemView").super_class},"mouseDown:",_ea);
}
}),new objj_method(sel_getUid("setEnabled:"),function(_ec,_ed,_ee){
with(_ec){
if(objj_msgSend(_ec,"isEnabled")===_ee){
return;
}
objj_msgSendSuper({receiver:_ec,super_class:objj_getClass("_CPToolbarItemView").super_class},"setEnabled:",_ee);
if(_ee){
objj_msgSend(_imageView,"setAlphaValue:",1);
objj_msgSend(_labelField,"setAlphaValue:",1);
}else{
objj_msgSend(_imageView,"setAlphaValue:",0.5);
objj_msgSend(_labelField,"setAlphaValue:",0.5);
}
objj_msgSend(_toolbar,"tile");
}
}),new objj_method(sel_getUid("FIXME_labelColor"),function(_ef,_f0){
with(_ef){
if(_FIXME_isHUD){
return objj_msgSend(CPColor,"whiteColor");
}
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("FIXME_labelShadowColor"),function(_f1,_f2){
with(_f1){
if(_FIXME_isHUD){
return objj_msgSend(_f1,"isHighlighted")?objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0.5):objj_msgSend(CPColor,"clearColor");
}
return objj_msgSend(_f1,"isHighlighted")?objj_msgSend(CPColor,"colorWithWhite:alpha:",0,0.3):objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0.75);
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_f3,_f4,_f5){
with(_f3){
objj_msgSendSuper({receiver:_f3,super_class:objj_getClass("_CPToolbarItemView").super_class},"setHighlighted:",_f5);
if(_f5){
var _f6=objj_msgSend(_toolbarItem,"alternateImage");
if(_f6){
objj_msgSend(_imageView,"setImage:",_f6);
}
objj_msgSend(_labelField,"setTextShadowOffset:",{width:0,height:0});
}else{
var _f7=objj_msgSend(_toolbarItem,"image");
if(_f7){
objj_msgSend(_imageView,"setImage:",_f7);
}
objj_msgSend(_labelField,"setTextShadowOffset:",{width:0,height:1});
}
objj_msgSend(_labelField,"setTextShadowColor:",objj_msgSend(_f3,"FIXME_labelShadowColor"));
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_f8,_f9,_fa,_fb){
with(_f8){
objj_msgSend(CPApp,"sendAction:to:from:",_fa,_fb,_toolbarItem);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_fc,_fd,_fe,_ff,_100,_101){
with(_fc){
if(_fe==="enabled"){
objj_msgSend(_fc,"setEnabled:",objj_msgSend(_ff,"isEnabled"));
}else{
if(_fe==="target"){
objj_msgSend(_fc,"setTarget:",objj_msgSend(_ff,"target"));
}else{
if(_fe==="action"){
objj_msgSend(_fc,"setAction:",objj_msgSend(_ff,"action"));
}else{
objj_msgSend(_fc,"updateFromItem");
}
}
}
}
})]);
