@STATIC;1.0;I;21;Foundation/CPString.ji;8;CPView.ji;9;CPColor.ji;14;CPColorPanel.jt;9845;
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("CPView.j",YES);
objj_executeFile("CPColor.j",YES);
objj_executeFile("CPColorPanel.j",YES);
var _1="_CPColorWellDidBecomeExclusiveNotification";
var _2=objj_allocateClassPair(CPControl,"CPColorWell"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_active"),new objj_ivar("_bordered"),new objj_ivar("_color")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_reverseSetBinding"),function(_4,_5){
with(_4){
var _6=objj_msgSend(objj_msgSend(_4,"class"),"_binderClassForBinding:",CPValueBinding),_7=objj_msgSend(_6,"getBinding:forObject:",CPValueBinding,_4);
objj_msgSend(_7,"reverseSetValueFor:","color");
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPColorWell").super_class},"initWithFrame:",_a);
if(_8){
_active=NO;
_color=objj_msgSend(CPColor,"whiteColor");
objj_msgSend(_8,"setBordered:",YES);
objj_msgSend(_8,"_registerForNotifications");
}
return _8;
}
}),new objj_method(sel_getUid("_registerForNotifications"),function(_b,_c){
with(_b){
var _d=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_d,"addObserver:selector:name:object:",_b,sel_getUid("colorWellDidBecomeExclusive:"),_1,nil);
objj_msgSend(_d,"addObserver:selector:name:object:",_b,sel_getUid("colorPanelWillClose:"),CPWindowWillCloseNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("setBordered:"),function(_e,_f,_10){
with(_e){
if(_10){
objj_msgSend(_e,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_e,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_11,_12){
with(_11){
return objj_msgSend(_11,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("color"),function(_13,_14){
with(_13){
return _color;
}
}),new objj_method(sel_getUid("setColor:"),function(_15,_16,_17){
with(_15){
if(_color==_17){
return;
}
_color=_17;
objj_msgSend(_15,"setNeedsLayout");
}
}),new objj_method(sel_getUid("takeColorFrom:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_18,"setColor:",objj_msgSend(_1a,"color"));
}
}),new objj_method(sel_getUid("activate:"),function(_1b,_1c,_1d){
with(_1b){
if(_1d){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_1,_1b);
}
if(objj_msgSend(_1b,"isActive")){
return;
}
_active=YES;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_1b,sel_getUid("colorPanelDidChangeColor:"),CPColorPanelColorDidChangeNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("deactivate"),function(_1e,_1f){
with(_1e){
if(!objj_msgSend(_1e,"isActive")){
return;
}
_active=NO;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_1e,CPColorPanelColorDidChangeNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("isActive"),function(_20,_21){
with(_20){
return _active;
}
}),new objj_method(sel_getUid("colorPanelDidChangeColor:"),function(_22,_23,_24){
with(_22){
objj_msgSend(_22,"takeColorFrom:",objj_msgSend(_24,"object"));
objj_msgSend(_22,"sendAction:to:",objj_msgSend(_22,"action"),objj_msgSend(_22,"target"));
}
}),new objj_method(sel_getUid("colorWellDidBecomeExclusive:"),function(_25,_26,_27){
with(_25){
if(_25!=objj_msgSend(_27,"object")){
objj_msgSend(_25,"deactivate");
}
}
}),new objj_method(sel_getUid("colorPanelWillClose:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_28,"deactivate");
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_2b,_2c,_2d,_2e,_2f){
with(_2b){
objj_msgSend(_2b,"highlight:",NO);
if(!_2f||!CGRectContainsPoint(objj_msgSend(_2b,"bounds"),_2e)||!objj_msgSend(_2b,"isEnabled")){
return;
}
objj_msgSend(_2b,"activate:",YES);
var _30=objj_msgSend(CPColorPanel,"sharedColorPanel");
objj_msgSend(_30,"setColor:",_color);
objj_msgSend(_30,"orderFront:",_2b);
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_31,"currentValueForThemeAttribute:","content-inset");
return {origin:{x:(_33).origin.x+(_34).left,y:(_33).origin.y+(_34).top},size:{width:(_33).size.width-(_34).left-(_34).right,height:(_33).size.height-(_34).top-(_34).bottom}};
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_35,_36,_37){
with(_35){
var _38=objj_msgSend(_35,"currentValueForThemeAttribute:","bezel-inset");
return {origin:{x:(_37).origin.x+(_38).left,y:(_37).origin.y+(_38).top},size:{width:(_37).size.width-(_38).left-(_38).right,height:(_37).size.height-(_38).top-(_38).bottom}};
}
}),new objj_method(sel_getUid("contentBorderRectForBounds:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(_39,"currentValueForThemeAttribute:","content-border-inset");
return {origin:{x:(_3b).origin.x+(_3c).left,y:(_3b).origin.y+(_3c).top},size:{width:(_3b).size.width-(_3c).left-(_3c).right,height:(_3b).size.height-(_3c).top-(_3c).bottom}};
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_3d,_3e,_3f){
with(_3d){
switch(_3f){
case "bezel-view":
return objj_msgSend(_3d,"bezelRectForBounds:",objj_msgSend(_3d,"bounds"));
case "content-view":
return objj_msgSend(_3d,"contentRectForBounds:",objj_msgSend(_3d,"bounds"));
case "content-border-view":
return objj_msgSend(_3d,"contentBorderRectForBounds:",objj_msgSend(_3d,"bounds"));
}
return objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("CPColorWell").super_class},"rectForEphemeralSubviewNamed:",_3f);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_40,_41,_42){
with(_40){
var _43=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_43,"setHitTests:",NO);
return _43;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_44,_45){
with(_44){
var _46=objj_msgSend(_44,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
objj_msgSend(_46,"setBackgroundColor:",objj_msgSend(_44,"currentValueForThemeAttribute:","bezel-color"));
var _47=objj_msgSend(_44,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
objj_msgSend(_47,"setBackgroundColor:",_color);
var _48=objj_msgSend(_44,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-border-view",CPWindowAbove,"content-view");
objj_msgSend(_48,"setBackgroundColor:",objj_msgSend(_44,"currentValueForThemeAttribute:","content-border-color"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("_binderClassForBinding:"),function(_49,_4a,_4b){
with(_49){
if(_4b==CPValueBinding){
return objj_msgSend(CPColorWellValueBinder,"class");
}
return objj_msgSendSuper({receiver:_49,super_class:objj_getMetaClass("CPColorWell").super_class},"_binderClassForBinding:",_4b);
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(_4c,_4d){
with(_4c){
return "colorwell";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_4e,_4f){
with(_4e){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},objj_msgSend(CPNull,"null"),{top:(3),right:(3),bottom:(3),left:(3)},{top:(0),right:(0),bottom:(0),left:(0)},objj_msgSend(CPNull,"null")],["bezel-inset","bezel-color","content-inset","content-border-inset","content-border-color"]);
}
})]);
var _2=objj_allocateClassPair(CPBinder,"CPColorWellValueBinder"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"),function(_50,_51,_52){
with(_50){
var _53=objj_msgSend(CPColor,"blueColor");
objj_msgSend(_50,"_setPlaceholder:forMarker:isDefault:",_53,CPMultipleValuesMarker,YES);
objj_msgSend(_50,"_setPlaceholder:forMarker:isDefault:",_53,CPNoSelectionMarker,YES);
objj_msgSend(_50,"_setPlaceholder:forMarker:isDefault:",_53,CPNotApplicableMarker,YES);
objj_msgSend(_50,"_setPlaceholder:forMarker:isDefault:",_53,CPNullMarker,YES);
}
}),new objj_method(sel_getUid("setValueFor:"),function(_54,_55,_56){
with(_54){
var _57=objj_msgSend(_info,"objectForKey:",CPObservedObjectKey),_58=objj_msgSend(_info,"objectForKey:",CPObservedKeyPathKey),_59=objj_msgSend(_info,"objectForKey:",CPOptionsKey),_5a=objj_msgSend(_57,"valueForKeyPath:",_58),_5b=CPIsControllerMarker(_5a);
if(_5b){
if(_5a===CPNotApplicableMarker&&objj_msgSend(_59,"objectForKey:",CPRaisesForNotApplicableKeysBindingOption)){
objj_msgSend(CPException,"raise:reason:",CPGenericException,"can't transform non applicable key on: "+_source+" value: "+_5a);
}
_5a=objj_msgSend(_54,"_placeholderForMarker:",_5a);
}else{
_5a=objj_msgSend(_54,"transformValue:withOptions:",_5a,_59);
}
objj_msgSend(_source,"setColor:",_5a);
}
})]);
var _5c="CPColorWellColorKey",_5d="CPColorWellBorderedKey";
var _2=objj_getClass("CPColorWell");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPColorWell\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_5e,_5f,_60){
with(_5e){
_5e=objj_msgSendSuper({receiver:_5e,super_class:objj_getClass("CPColorWell").super_class},"initWithCoder:",_60);
if(_5e){
_active=NO;
_color=objj_msgSend(_60,"decodeObjectForKey:",_5c);
objj_msgSend(_5e,"setBordered:",objj_msgSend(_60,"decodeBoolForKey:",_5d));
objj_msgSend(_5e,"_registerForNotifications");
}
return _5e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_61,_62,_63){
with(_61){
objj_msgSendSuper({receiver:_61,super_class:objj_getClass("CPColorWell").super_class},"encodeWithCoder:",_63);
objj_msgSend(_63,"encodeObject:forKey:",_color,_5c);
objj_msgSend(_63,"encodeObject:forKey:",objj_msgSend(_61,"isBordered"),_5d);
}
})]);
