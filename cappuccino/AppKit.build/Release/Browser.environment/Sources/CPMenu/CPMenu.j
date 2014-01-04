@STATIC;1.0;I;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;16;_CPMenuManager.ji;15;CPApplication.ji;12;CPClipView.ji;12;CPMenuItem.ji;9;CPPanel.ji;18;_CPMenuBarWindow.ji;15;_CPMenuWindow.jt;25975;
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPNotificationCenter.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("_CPMenuManager.j",YES);
objj_executeFile("CPApplication.j",YES);
objj_executeFile("CPClipView.j",YES);
objj_executeFile("CPMenuItem.j",YES);
objj_executeFile("CPPanel.j",YES);
CPMenuDidAddItemNotification="CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification="CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification="CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification="CPMenuDidEndTrackingNotification";
var _1=28;
var _2=NO,_3="",_4=nil,_5=1,_6=nil,_7=nil;
var _8=objj_allocateClassPair(CPObject,"CPMenu"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_supermenu"),new objj_ivar("_title"),new objj_ivar("_name"),new objj_ivar("_font"),new objj_ivar("_minimumWidth"),new objj_ivar("_items"),new objj_ivar("_autoenablesItems"),new objj_ivar("_showsStateColumn"),new objj_ivar("_delegate"),new objj_ivar("_highlightedIndex"),new objj_ivar("_menuWindow")]);
objj_registerClassPair(_8);
class_addMethods(_8,[new objj_method(sel_getUid("menuBarHeight"),function(_a,_b){
with(_a){
if(_a===objj_msgSend(CPApp,"mainMenu")){
return _1;
}
return 0;
}
}),new objj_method(sel_getUid("initWithTitle:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPMenu").super_class},"init");
if(_c){
_title=_e;
_items=[];
_autoenablesItems=YES;
_showsStateColumn=YES;
objj_msgSend(_c,"setMinimumWidth:",0);
}
return _c;
}
}),new objj_method(sel_getUid("init"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"initWithTitle:","");
}
}),new objj_method(sel_getUid("insertItem:atIndex:"),function(_11,_12,_13,_14){
with(_11){
objj_msgSend(_11,"insertObject:inItemsAtIndex:",_13,_14);
}
}),new objj_method(sel_getUid("insertItemWithTitle:action:keyEquivalent:atIndex:"),function(_15,_16,_17,_18,_19,_1a){
with(_15){
var _1b=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_17,_18,_19);
objj_msgSend(_15,"insertItem:atIndex:",_1b,_1a);
return _1b;
}
}),new objj_method(sel_getUid("addItem:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_1c,"insertItem:atIndex:",_1e,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("addItemWithTitle:action:keyEquivalent:"),function(_1f,_20,_21,_22,_23){
with(_1f){
return objj_msgSend(_1f,"insertItemWithTitle:action:keyEquivalent:atIndex:",_21,_22,_23,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("removeItem:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"removeItemAtIndex:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_26));
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_27,"removeObjectFromItemsAtIndex:",_29);
}
}),new objj_method(sel_getUid("removeAllItems"),function(_2a,_2b){
with(_2a){
var _2c=objj_msgSend(_items,"count");
while(_2c--){
objj_msgSend(_items[_2c],"setMenu:",nil);
}
_highlightedIndex=CPNotFound;
objj_msgSend(_2a,"willChangeValueForKey:","items");
_items=objj_msgSend(CPMutableArray,"array");
objj_msgSend(_2a,"didChangeValueForKey:","items");
}
}),new objj_method(sel_getUid("itemChanged:"),function(_2d,_2e,_2f){
with(_2d){
if(objj_msgSend(_2f,"menu")!==_2d){
return;
}
objj_msgSend(_2f,"setValue:forKey:",objj_msgSend(_2f,"valueForKey:","changeCount")+1,"changeCount");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidChangeItemNotification,_2d,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_2f),"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("itemWithTag:"),function(_30,_31,_32){
with(_30){
var _33=objj_msgSend(_30,"indexOfItemWithTag:",_32);
if(_33==CPNotFound){
return nil;
}
return _items[_33];
}
}),new objj_method(sel_getUid("itemWithTitle:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(_34,"indexOfItemWithTitle:",_36);
if(_37==CPNotFound){
return nil;
}
return _items[_37];
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_38,_39,_3a){
with(_38){
return objj_msgSend(_items,"objectAtIndex:",_3a);
}
}),new objj_method(sel_getUid("numberOfItems"),function(_3b,_3c){
with(_3b){
return objj_msgSend(_items,"count");
}
}),new objj_method(sel_getUid("itemArray"),function(_3d,_3e){
with(_3d){
return _items;
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_3f,_40,_41){
with(_3f){
if(objj_msgSend(_41,"menu")!==_3f){
return CPNotFound;
}
return objj_msgSend(_items,"indexOfObjectIdenticalTo:",_41);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_42,_43,_44){
with(_42){
var _45=0,_46=_items.length;
for(;_45<_46;++_45){
if(objj_msgSend(_items[_45],"title")===_44){
return _45;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_47,_48,_49){
with(_47){
var _4a=0,_4b=_items.length;
for(;_4a<_4b;++_4a){
if(objj_msgSend(_items[_4a],"tag")==_49){
return _4a;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:andAction:"),function(_4c,_4d,_4e,_4f){
with(_4c){
var _50=0,_51=_items.length;
for(;_50<_51;++_50){
var _52=_items[_50];
if(objj_msgSend(_52,"target")==_4e&&(!_4f||objj_msgSend(_52,"action")==_4f)){
return _50;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_53,_54,_55){
with(_53){
var _56=0,_57=_items.length;
for(;_56<_57;++_56){
if(objj_msgSend(objj_msgSend(_items[_56],"representedObject"),"isEqual:",_55)){
return _56;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithSubmenu:"),function(_58,_59,_5a){
with(_58){
var _5b=0,_5c=_items.length;
for(;_5b<_5c;++_5b){
if(objj_msgSend(_items[_5b],"submenu")==_5a){
return _5b;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("setSubmenu:forItem:"),function(_5d,_5e,_5f,_60){
with(_5d){
objj_msgSend(_60,"setTarget:",_60);
objj_msgSend(_60,"setAction:",sel_getUid("submenuAction:"));
objj_msgSend(_60,"setSubmenu:",_5f);
}
}),new objj_method(sel_getUid("submenuAction:"),function(_61,_62,_63){
with(_61){
}
}),new objj_method(sel_getUid("supermenu"),function(_64,_65){
with(_64){
return _supermenu;
}
}),new objj_method(sel_getUid("setSupermenu:"),function(_66,_67,_68){
with(_66){
_supermenu=_68;
}
}),new objj_method(sel_getUid("isTornOff"),function(_69,_6a){
with(_69){
return !_supermenu||_69==objj_msgSend(CPApp,"mainMenu");
}
}),new objj_method(sel_getUid("setAutoenablesItems:"),function(_6b,_6c,_6d){
with(_6b){
_autoenablesItems=_6d;
}
}),new objj_method(sel_getUid("autoenablesItems"),function(_6e,_6f){
with(_6e){
return _autoenablesItems;
}
}),new objj_method(sel_getUid("update"),function(_70,_71){
with(_70){
if(!objj_msgSend(_70,"autoenablesItems")){
return;
}
var _72=objj_msgSend(_70,"itemArray");
for(var i=0;i<objj_msgSend(_72,"count");i++){
var _73=objj_msgSend(_72,"objectAtIndex:",i);
if(objj_msgSend(_73,"hasSubmenu")){
continue;
}
var _74=objj_msgSend(CPApp,"targetForAction:to:from:",objj_msgSend(_73,"action"),objj_msgSend(_73,"target"),_73);
if(!_74||!objj_msgSend(_74,"respondsToSelector:",objj_msgSend(_73,"action"))){
objj_msgSend(_73,"setEnabled:",NO);
}else{
if(objj_msgSend(_74,"respondsToSelector:",sel_getUid("validateMenuItem:"))){
objj_msgSend(_73,"setEnabled:",objj_msgSend(_74,"validateMenuItem:",_73));
}else{
if(objj_msgSend(_74,"respondsToSelector:",sel_getUid("validateUserInterfaceItem:"))){
objj_msgSend(_73,"setEnabled:",objj_msgSend(_74,"validateUserInterfaceItem:",_73));
}
}
}
}
objj_msgSend(objj_msgSend(_menuWindow,"_menuView"),"tile");
}
}),new objj_method(sel_getUid("setTitle:"),function(_75,_76,_77){
with(_75){
_title=_77;
}
}),new objj_method(sel_getUid("title"),function(_78,_79){
with(_78){
return _title;
}
}),new objj_method(sel_getUid("setMinimumWidth:"),function(_7a,_7b,_7c){
with(_7a){
_minimumWidth=_7c;
}
}),new objj_method(sel_getUid("minimumWidth"),function(_7d,_7e){
with(_7d){
return _minimumWidth;
}
}),new objj_method(sel_getUid("_performActionOfHighlightedItemChain"),function(_7f,_80){
with(_7f){
var _81=objj_msgSend(_7f,"highlightedItem");
while(objj_msgSend(_81,"submenu")&&objj_msgSend(_81,"action")===sel_getUid("submenuAction:")){
_81=objj_msgSend(objj_msgSend(_81,"submenu"),"highlightedItem");
}
if(_81&&objj_msgSend(_81,"isEnabled")){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_81,"action"),objj_msgSend(_81,"target"),_81);
}
}
}),new objj_method(sel_getUid("popUpMenuPositioningItem:atLocation:inView:callback:"),function(_82,_83,_84,_85,_86,_87){
with(_82){
objj_msgSend(_82,"_popUpMenuPositioningItem:atLocation:topY:bottomY:inView:callback:",_84,_85,_85.y,_85.y,_86,_87);
}
}),new objj_method(sel_getUid("_popUpMenuPositioningItem:atLocation:topY:bottomY:inView:callback:"),function(_88,_89,_8a,_8b,_8c,_8d,_8e,_8f){
with(_88){
var _90=0;
if(_8a){
_90=objj_msgSend(_88,"indexOfItem:",_8a);
if(_90===CPNotFound){
throw "In call to popUpMenuPositioningItem:atLocation:inView:callback:, menu item "+_8a+" is not present in menu "+_88;
}
}
var _91=objj_msgSend(_8e,"window");
if(_8e&&!_91){
throw "In call to popUpMenuPositioningItem:atLocation:inView:callback:, view is not in any window.";
}
objj_msgSend(_88,"_menuWillOpen");
if(_8e){
_8b=objj_msgSend(_91,"convertBaseToGlobal:",objj_msgSend(_8e,"convertPoint:toView:",_8b,nil));
}
var _92=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_88,objj_msgSend(_88,"font"));
objj_msgSend(_92,"setBackgroundStyle:",_CPMenuWindowPopUpBackgroundStyle);
if(_8a){
_8b.y-=objj_msgSend(_92,"deltaYForItemAtIndex:",_90);
}
var _93=objj_msgSend(CPMenu,"_constraintRectForView:",_8e);
objj_msgSend(_92,"setFrameOrigin:",_8b);
objj_msgSend(_92,"setConstraintRect:",_93);
if(!objj_msgSend(_92,"hasMinimumNumberOfVisibleItems")){
var _94=objj_msgSend(_92,"unconstrainedFrame"),_95=CGRectGetMinY(_94);
if(_95>=CGRectGetMaxY(_93)||objj_msgSend(_92,"canScrollDown")){
if(_8e){
_8c=objj_msgSend(_91,"convertBaseToGlobal:",objj_msgSend(_8e,"convertPoint:toView:",CGPointMake(0,_8c),nil)).y;
}
_94.origin.y=MIN(CGRectGetMaxY(_93),_8c)-CGRectGetHeight(_94);
}else{
if(_95<CGRectGetMinY(_93)||objj_msgSend(_92,"canScrollUp")){
if(_8e){
_8d=objj_msgSend(_91,"convertBaseToGlobal:",objj_msgSend(_8e,"convertPoint:toView:",CGPointMake(0,_8d),nil)).y;
}
_94.origin.y=MAX(CGRectGetMinY(_93),_8d);
}
}
objj_msgSend(_92,"setFrameOrigin:",CGRectIntersection(_94,_93).origin);
}
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_92,"setPlatformWindow:",objj_msgSend(objj_msgSend(_8e,"window"),"platformWindow"));
}
objj_msgSend(_92,"orderFront:",_88);
objj_msgSend(objj_msgSend(_CPMenuManager,"sharedMenuManager"),"beginTracking:menuContainer:constraintRect:callback:",objj_msgSend(CPApp,"currentEvent"),_92,_93,objj_msgSend(CPMenu,"trackingCallbackWithCallback:",_8f));
}
}),new objj_method(sel_getUid("setShowsStateColumn:"),function(_96,_97,_98){
with(_96){
_showsStateColumn=_98;
}
}),new objj_method(sel_getUid("showsStateColumn"),function(_99,_9a){
with(_99){
return _showsStateColumn;
}
}),new objj_method(sel_getUid("highlightedItem"),function(_9b,_9c){
with(_9b){
if(_highlightedIndex<0){
return nil;
}
var _9d=_items[_highlightedIndex];
if(objj_msgSend(_9d,"isSeparatorItem")){
return nil;
}
return _9d;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_9e,_9f,_a0){
with(_9e){
_delegate=_a0;
}
}),new objj_method(sel_getUid("delegate"),function(_a1,_a2){
with(_a1){
return _delegate;
}
}),new objj_method(sel_getUid("_menuWillOpen"),function(_a3,_a4){
with(_a3){
var _a5=objj_msgSend(_a3,"delegate");
if(objj_msgSend(_a5,"respondsToSelector:",sel_getUid("menuWillOpen:"))){
objj_msgSend(_a5,"menuWillOpen:",_a3);
}
}
}),new objj_method(sel_getUid("_menuDidClose"),function(_a6,_a7){
with(_a6){
var _a8=objj_msgSend(_a6,"delegate");
if(objj_msgSend(_a8,"respondsToSelector:",sel_getUid("menuDidClose:"))){
objj_msgSend(_a8,"menuDidClose:",_a6);
}
}
}),new objj_method(sel_getUid("cancelTracking"),function(_a9,_aa){
with(_a9){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_fireCancelTrackingEvent"),_a9,nil,0,[CPDefaultRunLoopMode]);
}
}),new objj_method(sel_getUid("_fireCancelTrackingEvent"),function(_ab,_ac){
with(_ab){
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",CPAppKitDefined,{x:0,y:0},0,0,0,0,0,0,0));
objj_msgSend(_CPDisplayServer,"run");
}
}),new objj_method(sel_getUid("_setMenuWindow:"),function(_ad,_ae,_af){
with(_ad){
_menuWindow=_af;
}
}),new objj_method(sel_getUid("setFont:"),function(_b0,_b1,_b2){
with(_b0){
_font=_b2;
}
}),new objj_method(sel_getUid("font"),function(_b3,_b4){
with(_b3){
return _font;
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_b5,_b6,_b7){
with(_b5){
if(_autoenablesItems){
objj_msgSend(_b5,"update");
}
var _b8=0,_b9=_items.length,_ba=objj_msgSend(_b7,"charactersIgnoringModifiers"),_bb=objj_msgSend(_b7,"modifierFlags");
for(;_b8<_b9;++_b8){
var _bc=_items[_b8],_bd=objj_msgSend(_bc,"keyEquivalentModifierMask");
if(objj_msgSend(_b7,"_triggersKeyEquivalent:withModifierMask:",objj_msgSend(_bc,"keyEquivalent"),objj_msgSend(_bc,"keyEquivalentModifierMask"))){
if(objj_msgSend(_bc,"isEnabled")){
objj_msgSend(_b5,"performActionForItemAtIndex:",_b8);
}else{
}
return YES;
}
if(objj_msgSend(objj_msgSend(_bc,"submenu"),"performKeyEquivalent:",_b7)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("performActionForItemAtIndex:"),function(_be,_bf,_c0){
with(_be){
var _c1=_items[_c0];
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_c1,"action"),objj_msgSend(_c1,"target"),_c1);
}
}),new objj_method(sel_getUid("_highlightItemAtIndex:"),function(_c2,_c3,_c4){
with(_c2){
if(_highlightedIndex===_c4){
return;
}
if(_highlightedIndex!==CPNotFound){
objj_msgSend(objj_msgSend(_items[_highlightedIndex],"_menuItemView"),"highlight:",NO);
}
_highlightedIndex=_c4;
if(_highlightedIndex!==CPNotFound){
objj_msgSend(objj_msgSend(_items[_highlightedIndex],"_menuItemView"),"highlight:",YES);
}
if(_highlightedIndex!==CPNotFound&&_menuWindow){
objj_msgSend(_menuWindow._menuView,"scrollRectToVisible:",objj_msgSend(objj_msgSend(_items[_highlightedIndex],"_menuItemView"),"frame"));
}
}
}),new objj_method(sel_getUid("_setMenuName:"),function(_c5,_c6,_c7){
with(_c5){
if(_name===_c7){
return;
}
_name=_c7;
if(_name==="CPMainMenu"){
objj_msgSend(CPApp,"setMainMenu:",_c5);
}
}
}),new objj_method(sel_getUid("_menuName"),function(_c8,_c9){
with(_c8){
return _name;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_ca,_cb){
with(_ca){
if(_name==="_CPMainMenu"){
objj_msgSend(_ca,"_setMenuName:","CPMainMenu");
objj_msgSend(CPMenu,"setMenuBarVisible:",YES);
}
}
}),new objj_method(sel_getUid("_menuWithName:"),function(_cc,_cd,_ce){
with(_cc){
if(_ce===_name){
return _cc;
}
for(var i=0,_cf=objj_msgSend(_items,"count");i<_cf;i++){
var _d0=objj_msgSend(objj_msgSend(_items[i],"submenu"),"_menuWithName:",_ce);
if(_d0){
return _d0;
}
}
return nil;
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(_d1,_d2){
with(_d1){
if(_d1!==objj_msgSend(CPMenu,"class")){
return;
}
objj_msgSend(objj_msgSend(_d1,"class"),"setMenuBarAttributes:",objj_msgSend(CPDictionary,"dictionary"));
}
}),new objj_method(sel_getUid("menuBarVisible"),function(_d3,_d4){
with(_d3){
return _2;
}
}),new objj_method(sel_getUid("setMenuBarVisible:"),function(_d5,_d6,_d7){
with(_d5){
if(_2===_d7){
return;
}
_2=_d7;
if(objj_msgSend(CPPlatform,"supportsNativeMainMenu")){
return;
}
if(_d7){
if(!_7){
_7=objj_msgSend(objj_msgSend(_CPMenuBarWindow,"alloc"),"init");
}
objj_msgSend(_7,"setMenu:",objj_msgSend(CPApp,"mainMenu"));
objj_msgSend(_7,"setTitle:",_3);
objj_msgSend(_7,"setIconImage:",_4);
objj_msgSend(_7,"setIconImageAlphaValue:",_5);
objj_msgSend(_7,"setColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarBackgroundColor"));
objj_msgSend(_7,"setTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextColor"));
objj_msgSend(_7,"setTitleColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleColor"));
objj_msgSend(_7,"setTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextShadowColor"));
objj_msgSend(_7,"setTitleShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleShadowColor"));
objj_msgSend(_7,"setHighlightColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightColor"));
objj_msgSend(_7,"setHighlightTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextColor"));
objj_msgSend(_7,"setHighlightTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextShadowColor"));
objj_msgSend(_7,"orderFront:",_d5);
}else{
objj_msgSend(_7,"orderOut:",_d5);
}
objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"resizeEvent:",nil);
}
}),new objj_method(sel_getUid("setMenuBarTitle:"),function(_d8,_d9,_da){
with(_d8){
_3=_da;
objj_msgSend(_7,"setTitle:",_3);
}
}),new objj_method(sel_getUid("menuBarTitle"),function(_db,_dc){
with(_db){
return _3;
}
}),new objj_method(sel_getUid("setMenuBarIconImage:"),function(_dd,_de,_df){
with(_dd){
_CPMenuBarImage=_df;
objj_msgSend(_7,"setIconImage:",_df);
}
}),new objj_method(sel_getUid("menuBarIconImage"),function(_e0,_e1){
with(_e0){
return _CPMenuBarImage;
}
}),new objj_method(sel_getUid("setMenuBarAttributes:"),function(_e2,_e3,_e4){
with(_e2){
if(_6==_e4){
return;
}
_6=objj_msgSend(_e4,"copy");
var _e5=objj_msgSend(_e4,"objectForKey:","CPMenuBarTextColor"),_e6=objj_msgSend(_e4,"objectForKey:","CPMenuBarTitleColor"),_e7=objj_msgSend(_e4,"objectForKey:","CPMenuBarTextShadowColor"),_e8=objj_msgSend(_e4,"objectForKey:","CPMenuBarTitleShadowColor"),_e9=objj_msgSend(_e4,"objectForKey:","CPMenuBarHighlightColor"),_ea=objj_msgSend(_e4,"objectForKey:","CPMenuBarHighlightTextColor"),_eb=objj_msgSend(_e4,"objectForKey:","CPMenuBarHighlightTextShadowColor");
if(!_e5&&_e6){
objj_msgSend(_6,"setObject:forKey:",_e6,"CPMenuBarTextColor");
}else{
if(_e5&&!_e6){
objj_msgSend(_6,"setObject:forKey:",_e5,"CPMenuBarTitleColor");
}else{
if(!_e5&&!_e6){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.051,0.2,0.275,1),"CPMenuBarTextColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.051,0.2,0.275,1),"CPMenuBarTitleColor");
}
}
}
if(!_e7&&_e8){
objj_msgSend(_6,"setObject:forKey:",_e8,"CPMenuBarTextShadowColor");
}else{
if(_e7&&!_e8){
objj_msgSend(_6,"setObject:forKey:",_e7,"CPMenuBarTitleShadowColor");
}else{
if(!_e7&&!_e8){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarTextShadowColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarTitleShadowColor");
}
}
}
if(!_e9){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",94/255,130/255,186/255,1),"CPMenuBarHighlightColor");
}
if(!_ea){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarHighlightTextColor");
}
if(!_eb){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"blackColor"),"CPMenuBarHighlightTextShadowColor");
}
if(_7){
objj_msgSend(_7,"setColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarBackgroundColor"));
objj_msgSend(_7,"setTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextColor"));
objj_msgSend(_7,"setTitleColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleColor"));
objj_msgSend(_7,"setTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextShadowColor"));
objj_msgSend(_7,"setTitleShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleShadowColor"));
objj_msgSend(_7,"setHighlightColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightColor"));
objj_msgSend(_7,"setHighlightTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextColor"));
objj_msgSend(_7,"setHighlightTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextShadowColor"));
}
}
}),new objj_method(sel_getUid("menuBarAttributes"),function(_ec,_ed){
with(_ec){
return _6;
}
}),new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"),function(_ee,_ef,_f0){
with(_ee){
_5=_f0;
objj_msgSend(_7,"setIconImageAlphaValue:",_f0);
}
}),new objj_method(sel_getUid("menuBarHeight"),function(_f1,_f2){
with(_f1){
return _1;
}
}),new objj_method(sel_getUid("_constraintRectForView:"),function(_f3,_f4,_f5){
with(_f3){
if(objj_msgSend(CPPlatform,"isBrowser")){
return CGRectInset(objj_msgSend(objj_msgSend(objj_msgSend(_f5,"window"),"platformWindow"),"contentBounds"),5,5);
}
return CGRectInset(objj_msgSend(objj_msgSend(objj_msgSend(_f5,"window"),"screen"),"visibleFrame"),5,5);
}
}),new objj_method(sel_getUid("trackingCallbackWithCallback:"),function(_f6,_f7,_f8){
with(_f6){
return function(_f9,_fa){
objj_msgSend(_f9,"setMenu:",nil);
objj_msgSend(_f9,"orderOut:",_f6);
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_f9);
if(_f8){
_f8(_fa);
}
objj_msgSend(_fa,"_performActionOfHighlightedItemChain");
};
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"),function(_fb,_fc,_fd,_fe,_ff){
with(_fb){
objj_msgSend(_fb,"popUpContextMenu:withEvent:forView:withFont:",_fd,_fe,_ff,nil);
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"),function(self,_100,_101,_102,_103,_104){
with(self){
objj_msgSend(_101,"_menuWillOpen");
if(!_104){
_104=objj_msgSend(CPFont,"systemFontOfSize:",objj_msgSend(CPFont,"systemFontSize"));
}
var _105=objj_msgSend(_103,"window"),_106=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_101,_104);
objj_msgSend(_106,"setBackgroundStyle:",_CPMenuWindowPopUpBackgroundStyle);
var _107=objj_msgSend(CPMenu,"_constraintRectForView:",_103),_108=objj_msgSend(objj_msgSend(_102,"window"),"convertBaseToGlobal:",objj_msgSend(_102,"locationInWindow"));
objj_msgSend(_106,"setConstraintRect:",_107);
objj_msgSend(_106,"setFrameOrigin:",_108);
if(!objj_msgSend(_106,"hasMinimumNumberOfVisibleItems")){
var _109=objj_msgSend(_106,"unconstrainedFrame"),_10a=CGRectGetMinY(_109);
if(_10a>=CGRectGetMaxY(_107)||objj_msgSend(_106,"canScrollDown")){
_109.origin.y=MIN(CGRectGetMaxY(_107),_108.y)-CGRectGetHeight(_109);
}else{
if(_10a<CGRectGetMinY(_107)||objj_msgSend(_106,"canScrollUp")){
_109.origin.y=MAX(CGRectGetMinY(_107),_108.y);
}
}
objj_msgSend(_106,"setFrameOrigin:",CGRectIntersection(_109,_107).origin);
}
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_106,"setPlatformWindow:",objj_msgSend(objj_msgSend(_103,"window"),"platformWindow"));
}
objj_msgSend(_106,"orderFront:",self);
objj_msgSend(objj_msgSend(_CPMenuManager,"sharedMenuManager"),"beginTracking:menuContainer:constraintRect:callback:",_102,_106,objj_msgSend(CPMenu,"_constraintRectForView:",_103),objj_msgSend(CPMenu,"trackingCallbackWithCallback:",nil));
}
})]);
var _8=objj_getClass("CPMenu");
if(!_8){
throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("countOfItems"),function(self,_10b){
with(self){
return objj_msgSend(_items,"count");
}
}),new objj_method(sel_getUid("objectInItemsAtIndex:"),function(self,_10c,_10d){
with(self){
return objj_msgSend(_items,"objectAtIndex:",_10d);
}
}),new objj_method(sel_getUid("itemsAtIndexes:"),function(self,_10e,_10f){
with(self){
return objj_msgSend(_items,"objectsAtIndexes:",_10f);
}
})]);
var _8=objj_getClass("CPMenu");
if(!_8){
throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("insertObject:inItemsAtIndex:"),function(self,_110,_111,_112){
with(self){
var menu=objj_msgSend(_111,"menu");
if(menu){
if(menu!==self){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Attempted to insert item into menu that was already in another menu.");
}else{
return;
}
}
objj_msgSend(_111,"setMenu:",self);
objj_msgSend(_items,"insertObject:atIndex:",_111,_112);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidAddItemNotification,self,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_112,"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("removeObjectFromItemsAtIndex:"),function(self,_113,_114){
with(self){
if(_114<0||_114>=objj_msgSend(_items,"count")){
return;
}
objj_msgSend(objj_msgSend(_items,"objectAtIndex:",_114),"setMenu:",nil);
objj_msgSend(_items,"removeObjectAtIndex:",_114);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidRemoveItemNotification,self,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_114,"CPMenuItemIndex"));
}
})]);
var _115="CPMenuTitleKey",_116="CPMenuNameKey",_117="CPMenuItemsKey",_118="CPMenuShowsStateColumnKey";
var _8=objj_getClass("CPMenu");
if(!_8){
throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(self,_119,_11a){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPMenu").super_class},"init");
if(self){
_title=objj_msgSend(_11a,"decodeObjectForKey:",_115);
_items=objj_msgSend(_11a,"decodeObjectForKey:",_117);
objj_msgSend(self,"_setMenuName:",objj_msgSend(_11a,"decodeObjectForKey:",_116));
_showsStateColumn=!objj_msgSend(_11a,"containsValueForKey:",_118)||objj_msgSend(_11a,"decodeBoolForKey:",_118);
_autoenablesItems=YES;
objj_msgSend(self,"setMinimumWidth:",0);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_11b,_11c){
with(self){
objj_msgSend(_11c,"encodeObject:forKey:",_title,_115);
if(_name){
objj_msgSend(_11c,"encodeObject:forKey:",_name,_116);
}
objj_msgSend(_11c,"encodeObject:forKey:",_items,_117);
if(!_showsStateColumn){
objj_msgSend(_11c,"encodeBool:forKey:",_showsStateColumn,_118);
}
}
})]);
objj_executeFile("_CPMenuBarWindow.j",YES);
objj_executeFile("_CPMenuWindow.j",YES);
