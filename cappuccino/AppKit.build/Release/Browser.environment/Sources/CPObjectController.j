@STATIC;1.0;I;25;Foundation/CPDictionary.jI;25;Foundation/CPCountedSet.ji;14;CPController.jt;19785;
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPCountedSet.j",NO);
objj_executeFile("CPController.j",YES);
var _1=objj_allocateClassPair(CPController,"CPObjectController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentObject"),new objj_ivar("_selection"),new objj_ivar("_objectClass"),new objj_ivar("_objectClassName"),new objj_ivar("_isEditable"),new objj_ivar("_automaticallyPreparesContent"),new objj_ivar("_observedKeys")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithContent:",nil);
}
}),new objj_method(sel_getUid("initWithContent:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObjectController").super_class},"init")){
objj_msgSend(_5,"setContent:",_7);
objj_msgSend(_5,"setEditable:",YES);
objj_msgSend(_5,"setObjectClass:",objj_msgSend(CPMutableDictionary,"class"));
_observedKeys=objj_msgSend(objj_msgSend(CPCountedSet,"alloc"),"init");
}
return _5;
}
}),new objj_method(sel_getUid("content"),function(_8,_9){
with(_8){
return _contentObject;
}
}),new objj_method(sel_getUid("setContent:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_a,"willChangeValueForKey:","contentObject");
objj_msgSend(_a,"_selectionWillChange");
_contentObject=_c;
objj_msgSend(_a,"_selectionDidChange");
objj_msgSend(_a,"didChangeValueForKey:","contentObject");
}
}),new objj_method(sel_getUid("_setContentObject:"),function(_d,_e,_f){
with(_d){
objj_msgSend(_d,"setContent:",_f);
}
}),new objj_method(sel_getUid("_contentObject"),function(_10,_11){
with(_10){
return objj_msgSend(_10,"content");
}
}),new objj_method(sel_getUid("setAutomaticallyPreparesContent:"),function(_12,_13,_14){
with(_12){
_automaticallyPreparesContent=_14;
}
}),new objj_method(sel_getUid("automaticallyPreparesContent"),function(_15,_16){
with(_15){
return _automaticallyPreparesContent;
}
}),new objj_method(sel_getUid("prepareContent"),function(_17,_18){
with(_17){
objj_msgSend(_17,"setContent:",objj_msgSend(_17,"newObject"));
}
}),new objj_method(sel_getUid("setObjectClass:"),function(_19,_1a,_1b){
with(_19){
_objectClass=_1b;
}
}),new objj_method(sel_getUid("objectClass"),function(_1c,_1d){
with(_1c){
return _objectClass;
}
}),new objj_method(sel_getUid("_defaultNewObject"),function(_1e,_1f){
with(_1e){
return objj_msgSend(objj_msgSend(objj_msgSend(_1e,"objectClass"),"alloc"),"init");
}
}),new objj_method(sel_getUid("newObject"),function(_20,_21){
with(_20){
return objj_msgSend(_20,"_defaultNewObject");
}
}),new objj_method(sel_getUid("addObject:"),function(_22,_23,_24){
with(_22){
objj_msgSend(_22,"setContent:",_24);
var _25=objj_msgSend(objj_msgSend(_22,"class"),"_binderClassForBinding:","contentObject");
objj_msgSend(objj_msgSend(_25,"getBinding:forObject:","contentObject",_22),"reverseSetValueFor:","contentObject");
}
}),new objj_method(sel_getUid("removeObject:"),function(_26,_27,_28){
with(_26){
if(objj_msgSend(_26,"content")===_28){
objj_msgSend(_26,"setContent:",nil);
}
var _29=objj_msgSend(objj_msgSend(_26,"class"),"_binderClassForBinding:","contentObject");
objj_msgSend(objj_msgSend(_29,"getBinding:forObject:","contentObject",_26),"reverseSetValueFor:","contentObject");
}
}),new objj_method(sel_getUid("add:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"addObject:",objj_msgSend(_2a,"newObject"));
}
}),new objj_method(sel_getUid("canAdd"),function(_2d,_2e){
with(_2d){
return objj_msgSend(_2d,"isEditable");
}
}),new objj_method(sel_getUid("remove:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(_2f,"removeObject:",objj_msgSend(_2f,"content"));
}
}),new objj_method(sel_getUid("canRemove"),function(_32,_33){
with(_32){
return objj_msgSend(_32,"isEditable")&&objj_msgSend(objj_msgSend(_32,"selectedObjects"),"count");
}
}),new objj_method(sel_getUid("setEditable:"),function(_34,_35,_36){
with(_34){
_isEditable=_36;
}
}),new objj_method(sel_getUid("isEditable"),function(_37,_38){
with(_37){
return _isEditable;
}
}),new objj_method(sel_getUid("selectedObjects"),function(_39,_3a){
with(_39){
return objj_msgSend(objj_msgSend(_CPObservableArray,"alloc"),"initWithArray:",[_contentObject]);
}
}),new objj_method(sel_getUid("selection"),function(_3b,_3c){
with(_3b){
return _selection;
}
}),new objj_method(sel_getUid("_selectionWillChange"),function(_3d,_3e){
with(_3d){
objj_msgSend(_selection,"controllerWillChange");
objj_msgSend(_3d,"willChangeValueForKey:","selection");
}
}),new objj_method(sel_getUid("_selectionDidChange"),function(_3f,_40){
with(_3f){
if(_selection===undefined||_selection===nil){
_selection=objj_msgSend(objj_msgSend(CPControllerSelectionProxy,"alloc"),"initWithController:",_3f);
}
objj_msgSend(_selection,"controllerDidChange");
objj_msgSend(_3f,"didChangeValueForKey:","selection");
}
}),new objj_method(sel_getUid("observedKeys"),function(_41,_42){
with(_41){
return _observedKeys;
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_43,_44,_45,_46,_47,_48){
with(_43){
objj_msgSend(_observedKeys,"addObject:",_46);
objj_msgSendSuper({receiver:_43,super_class:objj_getClass("CPObjectController").super_class},"addObserver:forKeyPath:options:context:",_45,_46,_47,_48);
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_49,_4a,_4b,_4c){
with(_49){
objj_msgSend(_observedKeys,"removeObject:",_4c);
objj_msgSendSuper({receiver:_49,super_class:objj_getClass("CPObjectController").super_class},"removeObserver:forKeyPath:",_4b,_4c);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_4d,_4e){
with(_4d){
if(_4d!==objj_msgSend(CPObjectController,"class")){
return;
}
objj_msgSend(_4d,"exposeBinding:","editable");
objj_msgSend(_4d,"exposeBinding:","contentObject");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingContentObject"),function(_4f,_50){
with(_4f){
return objj_msgSend(CPSet,"setWithObjects:","content");
}
}),new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"),function(_51,_52,_53){
with(_51){
if(_53==="contentObject"){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingCanAdd"),function(_54,_55){
with(_54){
return objj_msgSend(CPSet,"setWithObject:","editable");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingCanInsert"),function(_56,_57){
with(_56){
return objj_msgSend(CPSet,"setWithObject:","editable");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingCanRemove"),function(_58,_59){
with(_58){
return objj_msgSend(CPSet,"setWithObjects:","editable","selection");
}
})]);
var _5a="CPObjectControllerContentKey",_5b="CPObjectControllerObjectClassNameKey",_5c="CPObjectControllerIsEditableKey",_5d="CPObjectControllerAutomaticallyPreparesContentKey";
var _1=objj_getClass("CPObjectController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObjectController\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_5e,_5f,_60){
with(_5e){
_5e=objj_msgSendSuper({receiver:_5e,super_class:objj_getClass("CPObjectController").super_class},"init");
if(_5e){
var _61=objj_msgSend(_60,"decodeObjectForKey:",_5b),_62=CPClassFromString(_61);
objj_msgSend(_5e,"setObjectClass:",_62||objj_msgSend(CPMutableDictionary,"class"));
objj_msgSend(_5e,"setEditable:",objj_msgSend(_60,"decodeBoolForKey:",_5c));
objj_msgSend(_5e,"setAutomaticallyPreparesContent:",objj_msgSend(_60,"decodeBoolForKey:",_5d));
objj_msgSend(_5e,"setContent:",objj_msgSend(_60,"decodeObjectForKey:",_5a));
_observedKeys=objj_msgSend(objj_msgSend(CPCountedSet,"alloc"),"init");
}
return _5e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_63,_64,_65){
with(_63){
objj_msgSend(_65,"encodeObject:forKey:",objj_msgSend(_63,"content"),_5a);
if(_objectClass){
objj_msgSend(_65,"encodeObject:forKey:",CPStringFromClass(_objectClass),_5b);
}else{
if(_objectClassName){
objj_msgSend(_65,"encodeObject:forKey:",_objectClassName,_5b);
}
}
objj_msgSend(_65,"encodeBool:forKey:",objj_msgSend(_63,"isEditable"),_5c);
objj_msgSend(_65,"encodeBool:forKey:",objj_msgSend(_63,"automaticallyPreparesContent"),_5d);
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_66,_67){
with(_66){
if(!objj_msgSend(_66,"content")&&objj_msgSend(_66,"automaticallyPreparesContent")){
objj_msgSend(_66,"prepareContent");
}
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPObservationProxy"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_keyPath"),new objj_ivar("_observer"),new objj_ivar("_object"),new objj_ivar("_notifyObject"),new objj_ivar("_context"),new objj_ivar("_options")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKeyPath:observer:object:"),function(_68,_69,_6a,_6b,_6c){
with(_68){
if(_68=objj_msgSendSuper({receiver:_68,super_class:objj_getClass("_CPObservationProxy").super_class},"init")){
_keyPath=_6a;
_observer=_6b;
_object=_6c;
}
return _68;
}
}),new objj_method(sel_getUid("observer"),function(_6d,_6e){
with(_6d){
return _observer;
}
}),new objj_method(sel_getUid("keyPath"),function(_6f,_70){
with(_6f){
return _keyPath;
}
}),new objj_method(sel_getUid("context"),function(_71,_72){
with(_71){
return _context;
}
}),new objj_method(sel_getUid("options"),function(_73,_74){
with(_73){
return _options;
}
}),new objj_method(sel_getUid("setNotifyObject:"),function(_75,_76,_77){
with(_75){
_notifyObject=_77;
}
}),new objj_method(sel_getUid("isEqual:"),function(_78,_79,_7a){
with(_78){
if(objj_msgSend(_7a,"class")===objj_msgSend(_78,"class")){
if(_7a._observer===_observer&&objj_msgSend(_7a._keyPath,"isEqual:",_keyPath)&&objj_msgSend(_7a._object,"isEqual:",_object)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_7b,_7c,_7d,_7e,_7f,_80){
with(_7b){
if(_notifyObject){
objj_msgSend(_object,"observeValueForKeyPath:ofObject:change:context:",_7d,_object,_7f,_80);
}
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_7d,_object,_7f,_80);
}
}),new objj_method(sel_getUid("description"),function(_81,_82){
with(_81){
return objj_msgSendSuper({receiver:_81,super_class:objj_getClass("_CPObservationProxy").super_class},"description")+objj_msgSend(CPString,"stringWithFormat:","observation proxy for %@ on key path %@",_observer,_keyPath);
}
})]);
var _1=objj_allocateClassPair(_CPJavaScriptArray,"_CPObservableArray"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_observationProxies")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("description"),function(_83,_84){
with(_83){
return "<_CPObservableArray: "+objj_msgSendSuper({receiver:_83,super_class:objj_getClass("_CPObservableArray").super_class},"description")+" >";
}
}),new objj_method(sel_getUid("initWithArray:"),function(_85,_86,_87){
with(_85){
_85=objj_msgSendSuper({receiver:_85,super_class:objj_getClass("_CPObservableArray").super_class},"initWithArray:",_87);
_85.isa=objj_msgSend(_CPObservableArray,"class");
_85._observationProxies=[];
return _85;
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_88,_89,_8a,_8b,_8c,_8d){
with(_88){
if(_8b.indexOf("@")===0){
var _8e=objj_msgSend(objj_msgSend(_CPObservationProxy,"alloc"),"initWithKeyPath:observer:object:",_8b,_8a,_88);
_8e._options=_8c;
_8e._context=_8d;
objj_msgSend(_observationProxies,"addObject:",_8e);
var _8f=_8b.indexOf("."),_90=_8b.substring(_8f+1),_91=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_88,"count")));
objj_msgSend(_88,"addObserver:toObjectsAtIndexes:forKeyPath:options:context:",_8e,_91,_90,_8c,_8d);
}else{
var _91=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_88,"count")));
objj_msgSend(_88,"addObserver:toObjectsAtIndexes:forKeyPath:options:context:",_8a,_91,_8b,_8c,_8d);
}
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_92,_93,_94,_95){
with(_92){
if(_95.indexOf("@")===0){
var _96=objj_msgSend(objj_msgSend(_CPObservationProxy,"alloc"),"initWithKeyPath:observer:object:",_95,_94,_92),_97=objj_msgSend(_observationProxies,"indexOfObject:",_96);
_96=objj_msgSend(_observationProxies,"objectAtIndex:",_97);
var _98=_95.indexOf("."),_99=_95.substring(_98+1),_9a=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_92,"count")));
objj_msgSend(_92,"removeObserver:fromObjectsAtIndexes:forKeyPath:",_96,_9a,_99);
}else{
var _9a=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_92,"count")));
objj_msgSend(_92,"removeObserver:fromObjectsAtIndexes:forKeyPath:",_94,_9a,_95);
}
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_9b,_9c,_9d,_9e){
with(_9b){
for(var i=0,_9f=objj_msgSend(_observationProxies,"count");i<_9f;i++){
var _a0=objj_msgSend(_observationProxies,"objectAtIndex:",i),_a1=objj_msgSend(_a0,"keyPath"),_a2=_a1.indexOf(".")===0;
if(_a2){
objj_msgSend(_9b,"willChangeValueForKey:",_a1);
}
objj_msgSend(_9d,"addObserver:forKeyPath:options:context:",_a0,_a1,objj_msgSend(_a0,"options"),objj_msgSend(_a0,"context"));
if(_a2){
objj_msgSend(_9b,"didChangeValueForKey:",_a1);
}
}
objj_msgSendSuper({receiver:_9b,super_class:objj_getClass("_CPObservableArray").super_class},"insertObject:atIndex:",_9d,_9e);
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_a3,_a4,_a5){
with(_a3){
var _a6=objj_msgSend(_a3,"objectAtIndex:",_a5);
for(var i=0,_a7=objj_msgSend(_observationProxies,"count");i<_a7;i++){
var _a8=objj_msgSend(_observationProxies,"objectAtIndex:",i),_a9=objj_msgSend(_a8,"keyPath"),_aa=_a9.indexOf(".")===0;
if(_aa){
objj_msgSend(_a3,"willChangeValueForKey:",_a9);
}
objj_msgSend(_a6,"removeObserver:forKeyPath:",_a8,_a9);
if(_aa){
objj_msgSend(_a3,"didChangeValueForKey:",_a9);
}
}
objj_msgSendSuper({receiver:_a3,super_class:objj_getClass("_CPObservableArray").super_class},"removeObjectAtIndex:",_a5);
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_ab,_ac,_ad){
with(_ab){
return objj_msgSend(_CPObservableArray,"arrayWithArray:",objj_msgSendSuper({receiver:_ab,super_class:objj_getClass("_CPObservableArray").super_class},"objectsAtIndexes:",_ad));
}
}),new objj_method(sel_getUid("addObject:"),function(_ae,_af,_b0){
with(_ae){
objj_msgSend(_ae,"insertObject:atIndex:",_b0,objj_msgSend(_ae,"count"));
}
}),new objj_method(sel_getUid("removeLastObject"),function(_b1,_b2){
with(_b1){
objj_msgSend(_b1,"removeObjectAtIndex:",objj_msgSend(_b1,"count"));
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_b3,_b4,_b5,_b6){
with(_b3){
var _b7=objj_msgSend(_b3,"objectAtIndex:",_b5);
for(var i=0,_b8=objj_msgSend(_observationProxies,"count");i<_b8;i++){
var _b9=objj_msgSend(_observationProxies,"objectAtIndex:",i),_ba=objj_msgSend(_b9,"keyPath"),_bb=_ba.indexOf(".")===0;
if(_bb){
objj_msgSend(_b3,"willChangeValueForKey:",_ba);
}
objj_msgSend(_b7,"removeObserver:forKeyPath:",_b9,_ba);
objj_msgSend(_b6,"addObserver:forKeyPath:options:context:",_b9,_ba,objj_msgSend(_b9,"options"),objj_msgSend(_b9,"context"));
if(_bb){
objj_msgSend(_b3,"didChangeValueForKey:",_ba);
}
}
objj_msgSendSuper({receiver:_b3,super_class:objj_getClass("_CPObservableArray").super_class},"replaceObjectAtIndex:withObject:",_b5,_b6);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_bc,_bd){
with(_bc){
var a=[];
a.isa=_bc;
var _be=class_copyIvarList(_bc),_bf=_be.length;
while(_bf--){
a[ivar_getName(_be[_bf])]=nil;
}
return a;
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPControllerSelectionProxy"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_controller"),new objj_ivar("_keys"),new objj_ivar("_cachedValues"),new objj_ivar("_observationProxies"),new objj_ivar("_observedObjectsByKeyPath")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithController:"),function(_c0,_c1,_c2){
with(_c0){
if(_c0=objj_msgSendSuper({receiver:_c0,super_class:objj_getClass("CPControllerSelectionProxy").super_class},"init")){
_cachedValues=objj_msgSend(CPDictionary,"dictionary");
_observationProxies=objj_msgSend(CPArray,"array");
_controller=_c2;
_observedObjectsByKeyPath={};
}
return _c0;
}
}),new objj_method(sel_getUid("_controllerMarkerForValues:"),function(_c3,_c4,_c5){
with(_c3){
var _c6=objj_msgSend(_c5,"count"),_c7;
if(!_c6){
_c7=CPNoSelectionMarker;
}else{
if(_c6===1){
_c7=objj_msgSend(_c5,"objectAtIndex:",0);
}else{
if(objj_msgSend(_controller,"alwaysUsesMultipleValuesMarker")){
_c7=CPMultipleValuesMarker;
}else{
_c7=objj_msgSend(_c5,"objectAtIndex:",0);
for(var i=0,_c6=objj_msgSend(_c5,"count");i<_c6&&_c7!=CPMultipleValuesMarker;i++){
if(!objj_msgSend(_c7,"isEqual:",objj_msgSend(_c5,"objectAtIndex:",i))){
_c7=CPMultipleValuesMarker;
}
}
}
}
}
if(_c7===nil||_c7.isa&&objj_msgSend(_c7,"isEqual:",objj_msgSend(CPNull,"null"))){
_c7=CPNullMarker;
}
return _c7;
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_c8,_c9,_ca){
with(_c8){
var _cb=objj_msgSend(objj_msgSend(_controller,"selectedObjects"),"valueForKeyPath:",_ca),_cc=objj_msgSend(_c8,"_controllerMarkerForValues:",_cb);
objj_msgSend(_cachedValues,"setObject:forKey:",_cc,_ca);
return _cc;
}
}),new objj_method(sel_getUid("valueForKey:"),function(_cd,_ce,_cf){
with(_cd){
return objj_msgSend(_cd,"valueForKeyPath:",_cf);
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_d0,_d1,_d2,_d3){
with(_d0){
objj_msgSend(objj_msgSend(_controller,"selectedObjects"),"setValue:forKeyPath:",_d2,_d3);
objj_msgSend(_cachedValues,"removeObjectForKey:",_d3);
objj_msgSend(objj_msgSend(CPBinder,"getBinding:forObject:","contentArray",_controller),"_contentArrayDidChange");
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_d4,_d5,_d6,_d7){
with(_d4){
objj_msgSend(_d4,"setValue:forKeyPath:",_d7,_d7);
}
}),new objj_method(sel_getUid("count"),function(_d8,_d9){
with(_d8){
return objj_msgSend(_cachedValues,"count");
}
}),new objj_method(sel_getUid("keyEnumerator"),function(_da,_db){
with(_da){
return objj_msgSend(_cachedValues,"keyEnumerator");
}
}),new objj_method(sel_getUid("controllerWillChange"),function(_dc,_dd){
with(_dc){
_keys=objj_msgSend(_cachedValues,"allKeys");
if(!_keys){
return;
}
for(var i=0,_de=_keys.length;i<_de;i++){
objj_msgSend(_dc,"willChangeValueForKey:",_keys[i]);
}
objj_msgSend(_cachedValues,"removeAllObjects");
}
}),new objj_method(sel_getUid("controllerDidChange"),function(_df,_e0){
with(_df){
objj_msgSend(_cachedValues,"removeAllObjects");
if(!_keys){
return;
}
for(var i=0,_e1=_keys.length;i<_e1;i++){
objj_msgSend(_df,"didChangeValueForKey:",_keys[i]);
}
_keys=nil;
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_e2,_e3,_e4,_e5,_e6,_e7){
with(_e2){
objj_msgSend(_cachedValues,"removeObjectForKey:",_e4);
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_e8,_e9,_ea,_eb,_ec,_ed){
with(_e8){
var _ee=objj_msgSend(objj_msgSend(_CPObservationProxy,"alloc"),"initWithKeyPath:observer:object:",_eb,_ea,_e8);
objj_msgSend(_ee,"setNotifyObject:",YES);
objj_msgSend(_observationProxies,"addObject:",_ee);
var _ef=objj_msgSend(_controller,"selectedObjects");
_observedObjectsByKeyPath[_eb]=_ef;
objj_msgSend(_ef,"addObserver:forKeyPath:options:context:",_ee,_eb,_ec,_ed);
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_f0,_f1,_f2,_f3){
with(_f0){
var _f4=objj_msgSend(objj_msgSend(_CPObservationProxy,"alloc"),"initWithKeyPath:observer:object:",_f3,_f2,_f0),_f5=objj_msgSend(_observationProxies,"indexOfObject:",_f4);
var _f6=_observedObjectsByKeyPath[_f3];
objj_msgSend(_f6,"removeObserver:forKeyPath:",objj_msgSend(_observationProxies,"objectAtIndex:",_f5),_f3);
objj_msgSend(_observationProxies,"removeObjectAtIndex:",_f5);
_observedObjects=nil;
}
})]);
