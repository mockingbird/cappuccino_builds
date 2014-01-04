@STATIC;1.0;i;7;CPBox.ji;20;CPSegmentedControl.ji;15;CPTabViewItem.ji;8;CPView.jt;10782;
objj_executeFile("CPBox.j",YES);
objj_executeFile("CPSegmentedControl.j",YES);
objj_executeFile("CPTabViewItem.j",YES);
objj_executeFile("CPView.j",YES);
CPTopTabsBezelBorder=0;
CPBottomTabsBezelBorder=2;
CPNoTabsBezelBorder=4;
CPNoTabsLineBorder=5;
CPNoTabsNoBorder=6;
var _1=1,_2=2,_3=4,_4=8;
var _5=objj_allocateClassPair(CPView,"CPTabView"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_items"),new objj_ivar("_tabs"),new objj_ivar("_box"),new objj_ivar("_selectedIndex"),new objj_ivar("_type"),new objj_ivar("_font"),new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
if(_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPTabView").super_class},"initWithFrame:",_9)){
_items=objj_msgSend(CPArray,"array");
objj_msgSend(_7,"_init");
objj_msgSend(_7,"setTabViewType:",CPTopTabsBezelBorder);
}
return _7;
}
}),new objj_method(sel_getUid("_init"),function(_a,_b){
with(_a){
_selectedIndex=CPNotFound;
_tabs=objj_msgSend(objj_msgSend(CPSegmentedControl,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_tabs,"setHitTests:",NO);
var _c=objj_msgSend(_tabs,"valueForThemeAttribute:","default-height");
objj_msgSend(_tabs,"setFrameSize:",{width:0,height:_c});
_box=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",objj_msgSend(_a,"bounds"));
objj_msgSend(_a,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.95,1));
objj_msgSend(_box,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_tabs,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_a,"addSubview:",_box);
objj_msgSend(_a,"addSubview:",_tabs);
}
}),new objj_method(sel_getUid("addTabViewItem:"),function(_d,_e,_f){
with(_d){
objj_msgSend(_d,"insertTabViewItem:atIndex:",_f,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("insertTabViewItem:atIndex:"),function(_10,_11,_12,_13){
with(_10){
objj_msgSend(_items,"insertObject:atIndex:",_12,_13);
objj_msgSend(_10,"_updateItems");
objj_msgSend(_10,"_repositionTabs");
objj_msgSend(_12,"_setTabView:",_10);
if(_delegateSelectors&_4){
objj_msgSend(_delegate,"tabViewDidChangeNumberOfTabViewItems:",_10);
}
}
}),new objj_method(sel_getUid("removeTabViewItem:"),function(_14,_15,_16){
with(_14){
var _17=objj_msgSend(_items,"count");
for(var i=0;i<_17;i++){
if(objj_msgSend(_items,"objectAtIndex:",i)===_16){
objj_msgSend(_items,"removeObjectAtIndex:",i);
break;
}
}
objj_msgSend(_14,"_updateItems");
objj_msgSend(_14,"_repositionTabs");
objj_msgSend(_16,"_setTabView:",nil);
if(_delegateSelectors&_4){
objj_msgSend(_delegate,"tabViewDidChangeNumberOfTabViewItems:",_14);
}
}
}),new objj_method(sel_getUid("indexOfTabViewItem:"),function(_18,_19,_1a){
with(_18){
return objj_msgSend(_items,"indexOfObjectIdenticalTo:",_1a);
}
}),new objj_method(sel_getUid("indexOfTabViewItemWithIdentifier:"),function(_1b,_1c,_1d){
with(_1b){
for(var _1e=objj_msgSend(_items,"count");_1e>=0;_1e--){
if(objj_msgSend(objj_msgSend(_items[_1e],"identifier"),"isEqual:",_1d)){
return _1e;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("numberOfTabViewItems"),function(_1f,_20){
with(_1f){
return objj_msgSend(_items,"count");
}
}),new objj_method(sel_getUid("tabViewItemAtIndex:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(_items,"objectAtIndex:",_23);
}
}),new objj_method(sel_getUid("tabViewItems"),function(_24,_25){
with(_24){
return objj_msgSend(_items,"copy");
}
}),new objj_method(sel_getUid("selectFirstTabViewItem:"),function(_26,_27,_28){
with(_26){
if(objj_msgSend(_items,"count")===0){
return;
}
objj_msgSend(_26,"selectTabViewItemAtIndex:",0);
}
}),new objj_method(sel_getUid("selectLastTabViewItem:"),function(_29,_2a,_2b){
with(_29){
if(objj_msgSend(_items,"count")===0){
return;
}
objj_msgSend(_29,"selectTabViewItemAtIndex:",objj_msgSend(_items,"count")-1);
}
}),new objj_method(sel_getUid("selectNextTabViewItem:"),function(_2c,_2d,_2e){
with(_2c){
if(_selectedIndex===CPNotFound){
return;
}
var _2f=_selectedIndex+1;
if(_2f===objj_msgSend(_items,"count")){
return;
}
objj_msgSend(_2c,"selectTabViewItemAtIndex:",_2f);
}
}),new objj_method(sel_getUid("selectPreviousTabViewItem:"),function(_30,_31,_32){
with(_30){
if(_selectedIndex===CPNotFound){
return;
}
var _33=_selectedIndex-1;
if(_33<0){
return;
}
objj_msgSend(_30,"selectTabViewItemAtIndex:",_33);
}
}),new objj_method(sel_getUid("selectTabViewItem:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"selectTabViewItemAtIndex:",objj_msgSend(_34,"indexOfTabViewItem:",_36));
}
}),new objj_method(sel_getUid("selectTabViewItemAtIndex:"),function(_37,_38,_39){
with(_37){
if(_39===_selectedIndex){
return;
}
var _3a=objj_msgSend(_37,"tabViewItemAtIndex:",_39);
if((_delegateSelectors&_2)&&!objj_msgSend(_delegate,"tabView:shouldSelectTabViewItem:",_37,_3a)){
return NO;
}
if(_delegateSelectors&_3){
objj_msgSend(_delegate,"tabView:willSelectTabViewItem:",_37,_3a);
}
objj_msgSend(_tabs,"selectSegmentWithTag:",_39);
objj_msgSend(_37,"_setSelectedIndex:",_39);
if(_delegateSelectors&_1){
objj_msgSend(_delegate,"tabView:didSelectTabViewItem:",_37,_3a);
}
return YES;
}
}),new objj_method(sel_getUid("selectedTabViewItem"),function(_3b,_3c){
with(_3b){
if(_selectedIndex!=CPNotFound){
return objj_msgSend(_items,"objectAtIndex:",_selectedIndex);
}
return nil;
}
}),new objj_method(sel_getUid("font"),function(_3d,_3e){
with(_3d){
return _font;
}
}),new objj_method(sel_getUid("setFont:"),function(_3f,_40,_41){
with(_3f){
if(objj_msgSend(_font,"isEqual:",_41)){
return;
}
_font=_41;
objj_msgSend(_tabs,"setFont:",_font);
}
}),new objj_method(sel_getUid("setTabViewType:"),function(_42,_43,_44){
with(_42){
if(_type===_44){
return;
}
_type=_44;
if(_type!==CPTopTabsBezelBorder&&_type!==CPBottomTabsBezelBorder){
objj_msgSend(_box,"setFrame:",objj_msgSend(_42,"bounds"));
objj_msgSend(_tabs,"removeFromSuperview");
}else{
var _45=objj_msgSend(_42,"frame"),_46=(objj_msgSend(_tabs,"frame").size.height),_47=_type===CPTopTabsBezelBorder?_46/2:0;
objj_msgSend(_box,"setFrame:",{origin:{x:0,y:_47},size:{width:(_45.size.width),height:(_45.size.height)-_46/2}});
objj_msgSend(_42,"addSubview:",_tabs);
}
switch(_type){
case CPTopTabsBezelBorder:
case CPBottomTabsBezelBorder:
case CPNoTabsBezelBorder:
objj_msgSend(_box,"setBorderType:",CPBezelBorder);
break;
case CPNoTabsLineBorder:
objj_msgSend(_box,"setBorderType:",CPLineBorder);
break;
case CPNoTabsNoBorder:
objj_msgSend(_box,"setBorderType:",CPNoBorder);
break;
}
}
}),new objj_method(sel_getUid("tabViewType"),function(_48,_49){
with(_48){
return _type;
}
}),new objj_method(sel_getUid("delegate"),function(_4a,_4b){
with(_4a){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_4c,_4d,_4e){
with(_4c){
if(_delegate==_4e){
return;
}
_delegate=_4e;
_delegateSelectors=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:shouldSelectTabViewItem:"))){
_delegateSelectors|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:willSelectTabViewItem:"))){
_delegateSelectors|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:didSelectTabViewItem:"))){
_delegateSelectors|=_1;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabViewDidChangeNumberOfTabViewItems:"))){
_delegateSelectors|=_4;
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_4f,_50,_51){
with(_4f){
objj_msgSend(_box,"setBackgroundColor:",_51);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_52,_53){
with(_52){
return objj_msgSend(_box,"backgroundColor");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_54,_55,_56){
with(_54){
var _57=objj_msgSend(_tabs,"testSegment:",objj_msgSend(_tabs,"convertPoint:fromView:",objj_msgSend(_56,"locationInWindow"),nil));
if(_57!=CPNotFound&&objj_msgSend(_54,"selectTabViewItemAtIndex:",_57)){
objj_msgSend(_tabs,"trackSegment:",_56);
}
}
}),new objj_method(sel_getUid("_repositionTabs"),function(_58,_59){
with(_58){
var _5a=(objj_msgSend(_58,"bounds").size.width)/2,_5b=(objj_msgSend(_tabs,"bounds").size.height)/2;
if(_type===CPBottomTabsBezelBorder){
objj_msgSend(_tabs,"setCenter:",{x:_5a,y:(objj_msgSend(_58,"bounds").size.height)-_5b});
}else{
objj_msgSend(_tabs,"setCenter:",{x:_5a,y:_5b});
}
}
}),new objj_method(sel_getUid("_setSelectedIndex:"),function(_5c,_5d,_5e){
with(_5c){
_selectedIndex=_5e;
objj_msgSend(_5c,"_setContentViewFromItem:",objj_msgSend(_items,"objectAtIndex:",_selectedIndex));
}
}),new objj_method(sel_getUid("_setContentViewFromItem:"),function(_5f,_60,_61){
with(_5f){
objj_msgSend(_box,"setContentView:",objj_msgSend(_61,"view"));
}
}),new objj_method(sel_getUid("_updateItems"),function(_62,_63){
with(_62){
var _64=objj_msgSend(_items,"count");
objj_msgSend(_tabs,"setSegmentCount:",_64);
for(var i=0;i<_64;i++){
objj_msgSend(_tabs,"setLabel:forSegment:",objj_msgSend(objj_msgSend(_items,"objectAtIndex:",i),"label"),i);
objj_msgSend(_tabs,"setTag:forSegment:",i,i);
}
if(_selectedIndex===CPNotFound){
objj_msgSend(_62,"selectFirstTabViewItem:",_62);
}
}
})]);
var _65="CPTabViewItemsKey",_66="CPTabViewSelectedItemKey",_67="CPTabViewTypeKey",_68="CPTabViewFontKey",_69="CPTabViewDelegateKey";
var _5=objj_getClass("CPTabView");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPTabView\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("initWithCoder:"),function(_6a,_6b,_6c){
with(_6a){
if(_6a=objj_msgSendSuper({receiver:_6a,super_class:objj_getClass("CPTabView").super_class},"initWithCoder:",_6c)){
objj_msgSend(_6a,"_init");
_font=objj_msgSend(_6c,"decodeObjectForKey:",_68);
objj_msgSend(_tabs,"setFont:",_font);
_items=objj_msgSend(_6c,"decodeObjectForKey:",_65);
objj_msgSend(_items,"makeObjectsPerformSelector:withObject:",sel_getUid("_setTabView:"),_6a);
objj_msgSend(_6a,"_updateItems");
objj_msgSend(_6a,"_repositionTabs");
objj_msgSend(_6a,"setDelegate:",objj_msgSend(_6c,"decodeObjectForKey:",_69));
var _6d=objj_msgSend(_6c,"decodeObjectForKey:",_66);
if(_6d){
objj_msgSend(_6a,"selectTabViewItem:",_6d);
}
objj_msgSend(_6a,"setTabViewType:",objj_msgSend(_6c,"decodeIntForKey:",_67));
}
return _6a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_6e,_6f,_70){
with(_6e){
objj_msgSendSuper({receiver:_6e,super_class:objj_getClass("CPTabView").super_class},"encodeWithCoder:",_70);
objj_msgSend(_70,"encodeObject:forKey:",_items,_65);
var _71=objj_msgSend(_6e,"selectedTabViewItem");
if(_71){
objj_msgSend(_70,"encodeObject:forKey:",_71,_66);
}
objj_msgSend(_70,"encodeInt:forKey:",_type,_67);
objj_msgSend(_70,"encodeObject:forKey:",_font,_68);
objj_msgSend(_70,"encodeConditionalObject:forKey:",_delegate,_69);
}
})]);
