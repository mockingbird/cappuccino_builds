@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;8;CPNull.ji;10;CPObject.ji;7;CPSet.ji;13;CPArray+KVO.ji;11;CPSet+KVO.jt;29898;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPSet.j",YES);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("willChangeValueForKey:"),function(_3,_4,_5){
with(_3){
if(!_5){
return;
}
if(!_3[_6]){
if(!_3._willChangeMessageCounter){
_3._willChangeMessageCounter=new Object();
}
if(!_3._willChangeMessageCounter[_5]){
_3._willChangeMessageCounter[_5]=1;
}else{
_3._willChangeMessageCounter[_5]+=1;
}
}
}
}),new objj_method(sel_getUid("didChangeValueForKey:"),function(_7,_8,_9){
with(_7){
if(!_9){
return;
}
if(!_7[_6]){
if(_7._willChangeMessageCounter&&_7._willChangeMessageCounter[_9]){
_7._willChangeMessageCounter[_9]-=1;
if(!_7._willChangeMessageCounter[_9]){
delete _7._willChangeMessageCounter[_9];
}
}else{
objj_msgSend(CPException,"raise:reason:","CPKeyValueObservingException","'didChange...' message called without prior call of 'willChange...'");
}
}
}
}),new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"),function(_a,_b,_c,_d,_e){
with(_a){
if(!_e){
return;
}
if(!_a[_6]){
if(!_a._willChangeMessageCounter){
_a._willChangeMessageCounter=new Object();
}
if(!_a._willChangeMessageCounter[_e]){
_a._willChangeMessageCounter[_e]=1;
}else{
_a._willChangeMessageCounter[_e]+=1;
}
}
}
}),new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"),function(_f,_10,_11,_12,_13){
with(_f){
if(!_13){
return;
}
if(!_f[_6]){
if(_f._willChangeMessageCounter&&_f._willChangeMessageCounter[_13]){
_f._willChangeMessageCounter[_13]-=1;
if(!_f._willChangeMessageCounter[_13]){
delete _f._willChangeMessageCounter[_13];
}
}else{
objj_msgSend(CPException,"raise:reason:","CPKeyValueObservingException","'didChange...' message called without prior call of 'willChange...'");
}
}
}
}),new objj_method(sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"),function(_14,_15,_16,_17,_18){
with(_14){
if(!_16){
return;
}
if(!_14[_6]){
if(!_14._willChangeMessageCounter){
_14._willChangeMessageCounter=new Object();
}
if(!_14._willChangeMessageCounter[_16]){
_14._willChangeMessageCounter[_16]=1;
}else{
_14._willChangeMessageCounter[_16]+=1;
}
}
}
}),new objj_method(sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"),function(_19,_1a,_1b,_1c,_1d){
with(_19){
if(!_19[_6]){
if(_19._willChangeMessageCounter&&_19._willChangeMessageCounter[_1b]){
_19._willChangeMessageCounter[_1b]-=1;
if(!_19._willChangeMessageCounter[_1b]){
delete _19._willChangeMessageCounter[_1b];
}
}else{
objj_msgSend(CPException,"raise:reason:","CPKeyValueObservingException","'didChange...' message called without prior call of 'willChange...'");
}
}
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_1e,_1f,_20,_21,_22,_23){
with(_1e){
if(!_20||!_21){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_1e),"_addObserver:forKeyPath:options:context:",_20,_21,_22,_23);
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_24,_25,_26,_27){
with(_24){
if(!_26||!_27){
return;
}
objj_msgSend(_24[_6],"_removeObserver:forKeyPath:",_26,_27);
}
}),new objj_method(sel_getUid("applyChange:toKeyPath:"),function(_28,_29,_2a,_2b){
with(_28){
var _2c=objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeKindKey),_2d=objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeOldKey),_2e=objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeNewKey);
if(_2e===objj_msgSend(CPNull,"null")){
_2e=nil;
}
if(_2c===CPKeyValueChangeSetting){
return objj_msgSend(_28,"setValue:forKeyPath:",_2e,_2b);
}
var _2f=objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeIndexesKey);
if(_2f){
if(_2c===CPKeyValueChangeInsertion){
objj_msgSend(objj_msgSend(_28,"mutableArrayValueForKeyPath:",_2b),"insertObjects:atIndexes:",_2e,_2f);
}else{
if(_2c===CPKeyValueChangeRemoval){
objj_msgSend(objj_msgSend(_28,"mutableArrayValueForKeyPath:",_2b),"removeObjectsAtIndexes:",_2f);
}else{
if(_2c===CPKeyValueChangeReplacement){
objj_msgSend(objj_msgSend(_28,"mutableArrayValueForKeyPath:",_2b),"replaceObjectAtIndexes:withObjects:",_2f,_2e);
}
}
}
}else{
if(_2c===CPKeyValueChangeInsertion){
objj_msgSend(objj_msgSend(_28,"mutableSetValueForKeyPath:",_2b),"unionSet:",_2e);
}else{
if(_2c===CPKeyValueChangeRemoval){
objj_msgSend(objj_msgSend(_28,"mutableSetValueForKeyPath:",_2b),"minusSet:",_2d);
}else{
if(_2c===CPKeyValueChangeReplacement){
objj_msgSend(objj_msgSend(_28,"mutableSetValueForKeyPath:",_2b),"setSet:",_2e);
}
}
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"),function(_30,_31,_32){
with(_30){
var _33=_32.charAt(0).toUpperCase()+_32.substring(1),_34="automaticallyNotifiesObserversOf"+_33;
if(objj_msgSend(objj_msgSend(_30,"class"),"respondsToSelector:",_34)){
return objj_msgSend(objj_msgSend(_30,"class"),_34);
}
return YES;
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForKey:"),function(_35,_36,_37){
with(_35){
var _38=_37.charAt(0).toUpperCase()+_37.substring(1),_39="keyPathsForValuesAffecting"+_38;
if(objj_msgSend(objj_msgSend(_35,"class"),"respondsToSelector:",_39)){
return objj_msgSend(objj_msgSend(_35,"class"),_39);
}
return objj_msgSend(CPSet,"set");
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("inverseChangeDictionary"),function(_3a,_3b){
with(_3a){
var _3c=objj_msgSend(_3a,"mutableCopy"),_3d=objj_msgSend(_3a,"objectForKey:",CPKeyValueChangeKindKey);
if(_3d===CPKeyValueChangeSetting||_3d===CPKeyValueChangeReplacement){
objj_msgSend(_3c,"setObject:forKey:",objj_msgSend(_3a,"objectForKey:",CPKeyValueChangeOldKey),CPKeyValueChangeNewKey);
objj_msgSend(_3c,"setObject:forKey:",objj_msgSend(_3a,"objectForKey:",CPKeyValueChangeNewKey),CPKeyValueChangeOldKey);
}else{
if(_3d===CPKeyValueChangeInsertion){
objj_msgSend(_3c,"setObject:forKey:",CPKeyValueChangeRemoval,CPKeyValueChangeKindKey);
objj_msgSend(_3c,"setObject:forKey:",objj_msgSend(_3a,"objectForKey:",CPKeyValueChangeNewKey),CPKeyValueChangeOldKey);
objj_msgSend(_3c,"removeObjectForKey:",CPKeyValueChangeNewKey);
}else{
if(_3d===CPKeyValueChangeRemoval){
objj_msgSend(_3c,"setObject:forKey:",CPKeyValueChangeInsertion,CPKeyValueChangeKindKey);
objj_msgSend(_3c,"setObject:forKey:",objj_msgSend(_3a,"objectForKey:",CPKeyValueChangeOldKey),CPKeyValueChangeNewKey);
objj_msgSend(_3c,"removeObjectForKey:",CPKeyValueChangeOldKey);
}
}
}
return _3c;
}
})]);
CPKeyValueObservingOptionNew=1<<0;
CPKeyValueObservingOptionOld=1<<1;
CPKeyValueObservingOptionInitial=1<<2;
CPKeyValueObservingOptionPrior=1<<3;
CPKeyValueChangeKindKey="CPKeyValueChangeKindKey";
CPKeyValueChangeNewKey="CPKeyValueChangeNewKey";
CPKeyValueChangeOldKey="CPKeyValueChangeOldKey";
CPKeyValueChangeIndexesKey="CPKeyValueChangeIndexesKey";
CPKeyValueChangeNotificationIsPriorKey="CPKeyValueChangeNotificationIsPriorKey";
CPKeyValueChangeSetting=1;
CPKeyValueChangeInsertion=2;
CPKeyValueChangeRemoval=3;
CPKeyValueChangeReplacement=4;
CPKeyValueUnionSetMutation=1;
CPKeyValueMinusSetMutation=2;
CPKeyValueIntersectSetMutation=3;
CPKeyValueSetSetMutation=4;
_CPKeyValueChangeSetMutationObjectsKey="_CPKeyValueChangeSetMutationObjectsKey";
_CPKeyValueChangeSetMutationKindKey="_CPKeyValueChangeSetMutationKindKey";
_CPKeyValueChangeSetMutationNewValueKey="_CPKeyValueChangeSetMutationNewValueKey";
var _3e=function(_3f){
switch(_3f){
case CPKeyValueUnionSetMutation:
return CPKeyValueChangeInsertion;
case CPKeyValueMinusSetMutation:
return CPKeyValueChangeRemoval;
case CPKeyValueIntersectSetMutation:
return CPKeyValueChangeRemoval;
case CPKeyValueSetSetMutation:
return CPKeyValueChangeReplacement;
}
};
var _40=CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,_41="$KVODEPENDENT",_6="$KVOPROXY";
var _1=objj_allocateClassPair(CPObject,"_CPKVOProxy"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_targetObject"),new objj_ivar("_nativeClass"),new objj_ivar("_changesForKey"),new objj_ivar("_nestingForKey"),new objj_ivar("_observersForKey"),new objj_ivar("_observersForKeyLength"),new objj_ivar("_replacedKeys")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithTarget:"),function(_42,_43,_44){
with(_42){
if(_42=objj_msgSendSuper({receiver:_42,super_class:objj_getClass("_CPKVOProxy").super_class},"init")){
_targetObject=_44;
_nativeClass=objj_msgSend(_44,"class");
_observersForKey={};
_changesForKey={};
_nestingForKey={};
_observersForKeyLength=0;
objj_msgSend(_42,"_replaceClass");
_44[_6]=_42;
}
return _42;
}
}),new objj_method(sel_getUid("_replaceClass"),function(_45,_46){
with(_45){
var _47=_nativeClass,_48="$KVO_"+class_getName(_nativeClass),_49=objj_lookUpClass(_48);
if(_49){
_targetObject.isa=_49;
_replacedKeys=_49._replacedKeys;
return;
}
var _4a=objj_allocateClassPair(_47,_48);
objj_registerClassPair(_4a);
_replacedKeys=objj_msgSend(CPSet,"set");
_4a._replacedKeys=_replacedKeys;
var _4b=class_copyMethodList(_CPKVOModelSubclass);
if(objj_msgSend(_targetObject,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
_4b=_4b.concat(class_copyMethodList(_CPKVOModelDictionarySubclass));
}
class_addMethods(_4a,_4b);
_targetObject.isa=_4a;
}
}),new objj_method(sel_getUid("_replaceModifiersForKey:"),function(_4c,_4d,_4e){
with(_4c){
if(objj_msgSend(_replacedKeys,"containsObject:",_4e)||!objj_msgSend(_nativeClass,"automaticallyNotifiesObserversForKey:",_4e)){
return;
}
objj_msgSend(_replacedKeys,"addObject:",_4e);
var _4f=_nativeClass,_50=_targetObject.isa,_51=_4e.charAt(0).toUpperCase()+_4e.substring(1);
var _52=sel_getUid("set"+_51+":"),_53=class_getInstanceMethod(_4f,_52);
if(_53){
var _54=_53.method_imp;
class_addMethod(_50,_52,function(_55,_56,_57){
objj_msgSend(_55,"willChangeValueForKey:",_4e);
_54(_55,_56,_57);
objj_msgSend(_55,"didChangeValueForKey:",_4e);
},"");
}
var _58=sel_getUid("_set"+_51+":"),_59=class_getInstanceMethod(_4f,_58);
if(_59){
var _5a=_59.method_imp;
class_addMethod(_50,_58,function(_5b,_5c,_5d){
objj_msgSend(_5b,"willChangeValueForKey:",_4e);
_5a(_5b,_5c,_5d);
objj_msgSend(_5b,"didChangeValueForKey:",_4e);
},"");
}
var _5e=sel_getUid("insertObject:in"+_51+"AtIndex:"),_5f=class_getInstanceMethod(_4f,_5e),_60=sel_getUid("insert"+_51+":atIndexes:"),_61=class_getInstanceMethod(_4f,_60),_62=sel_getUid("removeObjectFrom"+_51+"AtIndex:"),_63=class_getInstanceMethod(_4f,_62),_64=sel_getUid("remove"+_51+"AtIndexes:"),_65=class_getInstanceMethod(_4f,_64);
if((_5f||_61)&&(_63||_65)){
if(_5f){
var _66=_5f.method_imp;
class_addMethod(_50,_5e,function(_67,_68,_69,_6a){
objj_msgSend(_67,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_6a),_4e);
_66(_67,_68,_69,_6a);
objj_msgSend(_67,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_6a),_4e);
},"");
}
if(_61){
var _6b=_61.method_imp;
class_addMethod(_50,_60,function(_6c,_6d,_6e,_6f){
objj_msgSend(_6c,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(_6f,"copy"),_4e);
_6b(_6c,_6d,_6e,_6f);
objj_msgSend(_6c,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(_6f,"copy"),_4e);
},"");
}
if(_63){
var _70=_63.method_imp;
class_addMethod(_50,_62,function(_71,_72,_73){
objj_msgSend(_71,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_73),_4e);
_70(_71,_72,_73);
objj_msgSend(_71,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_73),_4e);
},"");
}
if(_65){
var _74=_65.method_imp;
class_addMethod(_50,_64,function(_75,_76,_77){
objj_msgSend(_75,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(_77,"copy"),_4e);
_74(_75,_76,_77);
objj_msgSend(_75,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(_77,"copy"),_4e);
},"");
}
var _78=sel_getUid("replaceObjectIn"+_51+"AtIndex:withObject:"),_79=class_getInstanceMethod(_4f,_78);
if(_79){
var _7a=_79.method_imp;
class_addMethod(_50,_78,function(_7b,_7c,_7d,_7e){
objj_msgSend(_7b,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_7d),_4e);
_7a(_7b,_7c,_7d,_7e);
objj_msgSend(_7b,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_7d),_4e);
},"");
}
var _7f=sel_getUid("replace"+_51+"AtIndexes:with"+_51+":"),_80=class_getInstanceMethod(_4f,_7f);
if(_80){
var _81=_80.method_imp;
class_addMethod(_50,_7f,function(_82,_83,_84,_85){
objj_msgSend(_82,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(_84,"copy"),_4e);
_7a(_82,_83,_84,_85);
objj_msgSend(_82,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(_84,"copy"),_4e);
},"");
}
}
var _86=sel_getUid("add"+_51+"Object:"),_87=class_getInstanceMethod(_4f,_86),_88=sel_getUid("add"+_51+":"),_89=class_getInstanceMethod(_4f,_88),_8a=sel_getUid("remove"+_51+"Object:"),_8b=class_getInstanceMethod(_4f,_8a),_8c=sel_getUid("remove"+_51+":"),_8d=class_getInstanceMethod(_4f,_8c);
if((_87||_89)&&(_8b||_8d)){
if(_87){
var _8e=_87.method_imp;
class_addMethod(_50,_86,function(_8f,_90,_91){
objj_msgSend(_8f,"willChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueUnionSetMutation,objj_msgSend(CPSet,"setWithObject:",_91));
_8e(_8f,_90,_91);
objj_msgSend(_8f,"didChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueUnionSetMutation,objj_msgSend(CPSet,"setWithObject:",_91));
},"");
}
if(_89){
var _92=_89.method_imp;
class_addMethod(_50,_88,function(_93,_94,_95){
objj_msgSend(_93,"willChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueUnionSetMutation,objj_msgSend(_95,"copy"));
_92(_93,_94,_95);
objj_msgSend(_93,"didChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueUnionSetMutation,objj_msgSend(_95,"copy"));
},"");
}
if(_8b){
var _96=_8b.method_imp;
class_addMethod(_50,_8a,function(_97,_98,_99){
objj_msgSend(_97,"willChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueMinusSetMutation,objj_msgSend(CPSet,"setWithObject:",_99));
_96(_97,_98,_99);
objj_msgSend(_97,"didChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueMinusSetMutation,objj_msgSend(CPSet,"setWithObject:",_99));
},"");
}
if(_8d){
var _9a=_8d.method_imp;
class_addMethod(_50,_8c,function(_9b,_9c,_9d){
objj_msgSend(_9b,"willChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueMinusSetMutation,objj_msgSend(_9d,"copy"));
_9a(_9b,_9c,_9d);
objj_msgSend(_9b,"didChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueMinusSetMutation,objj_msgSend(_9d,"copy"));
},"");
}
var _9e=sel_getUid("intersect"+_51+":"),_9f=class_getInstanceMethod(_4f,_9e);
if(_9f){
var _a0=_9f.method_imp;
class_addMethod(_50,_9e,function(_a1,_a2,_a3){
objj_msgSend(_a1,"willChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueIntersectSetMutation,objj_msgSend(_a3,"copy"));
_a0(_a1,_a2,_a3);
objj_msgSend(_a1,"didChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueIntersectSetMutation,objj_msgSend(_a3,"copy"));
},"");
}
}
var _a4=objj_msgSend(objj_msgSend(_nativeClass,"keyPathsForValuesAffectingValueForKey:",_4e),"allObjects"),_a5=_a4?_a4.length:0;
if(!_a5){
return;
}
var _a6=_nativeClass[_41];
if(!_a6){
_a6={};
_nativeClass[_41]=_a6;
}
while(_a5--){
var _a7=_a4[_a5],_a8=_a6[_a7];
if(!_a8){
_a8=objj_msgSend(CPSet,"new");
_a6[_a7]=_a8;
}
objj_msgSend(_a8,"addObject:",_4e);
if(_a7.indexOf(".")!==-1){
objj_msgSend(_targetObject,"addObserver:forKeyPath:options:context:",_4c,_a7,CPKeyValueObservingOptionPrior|_40,nil);
}else{
objj_msgSend(_4c,"_replaceModifiersForKey:",_a7);
}
}
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_a9,_aa,_ab,_ac,_ad,_ae){
with(_a9){
var _af=_nativeClass[_41],_b0=objj_msgSend(_af[_ab],"allObjects");
var _b1=!!objj_msgSend(_ad,"objectForKey:",CPKeyValueChangeNotificationIsPriorKey);
for(var i=0;i<objj_msgSend(_b0,"count");i++){
var _b2=objj_msgSend(_b0,"objectAtIndex:",i);
objj_msgSend(_a9,"_sendNotificationsForKey:changeOptions:isBefore:",_b2,_ad,_b1);
}
}
}),new objj_method(sel_getUid("_addObserver:forKeyPath:options:context:"),function(_b3,_b4,_b5,_b6,_b7,_b8){
with(_b3){
if(!_b5){
return;
}
var _b9=nil;
if(_b6.indexOf(".")!==CPNotFound&&_b6.charAt(0)!=="@"){
_b9=objj_msgSend(objj_msgSend(_CPKVOForwardingObserver,"alloc"),"initWithKeyPath:object:observer:options:context:",_b6,_targetObject,_b5,_b7,_b8);
}else{
objj_msgSend(_b3,"_replaceModifiersForKey:",_b6);
}
var _ba=_observersForKey[_b6];
if(!_ba){
_ba=objj_msgSend(CPDictionary,"dictionary");
_observersForKey[_b6]=_ba;
_observersForKeyLength++;
}
objj_msgSend(_ba,"setObject:forKey:",_bb(_b5,_b7,_b8,_b9),objj_msgSend(_b5,"UID"));
if(_b7&CPKeyValueObservingOptionInitial){
var _bc=objj_msgSend(_targetObject,"valueForKeyPath:",_b6);
if(_bc===nil||_bc===undefined){
_bc=objj_msgSend(CPNull,"null");
}
var _bd=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_bc,CPKeyValueChangeNewKey);
objj_msgSend(_b5,"observeValueForKeyPath:ofObject:change:context:",_b6,_targetObject,_bd,_b8);
}
}
}),new objj_method(sel_getUid("_removeObserver:forKeyPath:"),function(_be,_bf,_c0,_c1){
with(_be){
var _c2=_observersForKey[_c1];
if(!_c2){
CPLog.warn("Cannot remove an observer %@ for the key path \"%@\" from %@ because it is not registered as an observer.",_targetObject,_c1,_c0);
return;
}
if(_c1.indexOf(".")!=CPNotFound){
var _c3=objj_msgSend(_c2,"objectForKey:",objj_msgSend(_c0,"UID")).forwarder;
objj_msgSend(_c3,"finalize");
}
objj_msgSend(_c2,"removeObjectForKey:",objj_msgSend(_c0,"UID"));
if(!objj_msgSend(_c2,"count")){
_observersForKeyLength--;
delete _observersForKey[_c1];
}
if(!_observersForKeyLength){
_targetObject.isa=_nativeClass;
delete _targetObject[_6];
}
}
}),new objj_method(sel_getUid("_sendNotificationsForKey:changeOptions:isBefore:"),function(_c4,_c5,_c6,_c7,_c8){
with(_c4){
var _c9=_changesForKey[_c6];
if(_c8){
if(_c9){
var _ca=_nestingForKey[_c6];
if(!_ca){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"_changesForKey without _nestingForKey");
}
_nestingForKey[_c6]=_ca+1;
return;
}
_nestingForKey[_c6]=1;
_c9=_c7;
var _cb=objj_msgSend(_c9,"objectForKey:",CPKeyValueChangeIndexesKey),_cc=_c9[_CPKeyValueChangeSetMutationKindKey];
if(_cc){
var _cd=objj_msgSend(_c9[_CPKeyValueChangeSetMutationObjectsKey],"copy"),_ce=objj_msgSend(objj_msgSend(_targetObject,"valueForKey:",_c6),"copy");
if(_cc==CPKeyValueMinusSetMutation){
objj_msgSend(_ce,"intersectSet:",_cd);
objj_msgSend(_c9,"setValue:forKey:",_ce,CPKeyValueChangeOldKey);
}else{
if(_cc===CPKeyValueIntersectSetMutation||_cc===CPKeyValueSetSetMutation){
objj_msgSend(_ce,"minusSet:",_cd);
objj_msgSend(_c9,"setValue:forKey:",_ce,CPKeyValueChangeOldKey);
}
}
if(_cc===CPKeyValueUnionSetMutation||_cc===CPKeyValueSetSetMutation){
objj_msgSend(_cd,"minusSet:",_ce);
_c9[_CPKeyValueChangeSetMutationNewValueKey]=_cd;
}
}else{
if(_cb){
var _cf=objj_msgSend(_c9,"objectForKey:",CPKeyValueChangeKindKey);
if(_cf===CPKeyValueChangeReplacement||_cf===CPKeyValueChangeRemoval){
var _d0=objj_msgSend(objj_msgSend(_targetObject,"mutableArrayValueForKeyPath:",_c6),"objectsAtIndexes:",_cb);
objj_msgSend(_c9,"setValue:forKey:",_d0,CPKeyValueChangeOldKey);
}
}else{
var _d1=objj_msgSend(_targetObject,"valueForKey:",_c6);
if(_d1===nil||_d1===undefined){
_d1=objj_msgSend(CPNull,"null");
}
objj_msgSend(_c9,"setObject:forKey:",_d1,CPKeyValueChangeOldKey);
}
}
objj_msgSend(_c9,"setObject:forKey:",1,CPKeyValueChangeNotificationIsPriorKey);
_changesForKey[_c6]=_c9;
}else{
var _ca=_nestingForKey[_c6];
if(!_c9||!_ca){
if(_targetObject._willChangeMessageCounter&&_targetObject._willChangeMessageCounter[_c6]){
_targetObject._willChangeMessageCounter[_c6]-=1;
if(!_targetObject._willChangeMessageCounter[_c6]){
delete _targetObject._willChangeMessageCounter[_c6];
}
return;
}else{
objj_msgSend(CPException,"raise:reason:","CPKeyValueObservingException","'didChange...' message called without prior call of 'willChange...'");
}
}
_nestingForKey[_c6]=_ca-1;
if(_ca-1>0){
return;
}
delete _nestingForKey[_c6];
objj_msgSend(_c9,"removeObjectForKey:",CPKeyValueChangeNotificationIsPriorKey);
var _cb=objj_msgSend(_c9,"objectForKey:",CPKeyValueChangeIndexesKey),_cc=_c9[_CPKeyValueChangeSetMutationKindKey];
if(_cc){
var _d2=_c9[_CPKeyValueChangeSetMutationNewValueKey];
objj_msgSend(_c9,"setValue:forKey:",_d2,CPKeyValueChangeNewKey);
delete _c9[_CPKeyValueChangeSetMutationNewValueKey];
delete _c9[_CPKeyValueChangeSetMutationObjectsKey];
delete _c9[_CPKeyValueChangeSetMutationKindKey];
}else{
if(_cb){
var _cf=objj_msgSend(_c9,"objectForKey:",CPKeyValueChangeKindKey);
if(_cf==CPKeyValueChangeReplacement||_cf==CPKeyValueChangeInsertion){
var _d0=objj_msgSend(objj_msgSend(_targetObject,"mutableArrayValueForKeyPath:",_c6),"objectsAtIndexes:",_cb);
objj_msgSend(_c9,"setValue:forKey:",_d0,CPKeyValueChangeNewKey);
}
}else{
var _d2=objj_msgSend(_targetObject,"valueForKey:",_c6);
if(_d2===nil||_d2===undefined){
_d2=objj_msgSend(CPNull,"null");
}
objj_msgSend(_c9,"setObject:forKey:",_d2,CPKeyValueChangeNewKey);
}
}
delete _changesForKey[_c6];
}
var _d3=objj_msgSend(_observersForKey[_c6],"allValues"),_d4=_d3?_d3.length:0;
while(_d4--){
var _d5=_d3[_d4];
if(!_c8||(_d5.options&CPKeyValueObservingOptionPrior)){
objj_msgSend(_d5.observer,"observeValueForKeyPath:ofObject:change:context:",_c6,_targetObject,_c9,_d5.context);
}
}
var _d6=_nativeClass[_41];
if(!_d6){
return;
}
var _d7=objj_msgSend(_d6[_c6],"allObjects");
if(!_d7){
return;
}
var _d8=0,_d4=objj_msgSend(_d7,"count");
for(;_d8<_d4;++_d8){
var _d9=_d7[_d8];
objj_msgSend(_c4,"_sendNotificationsForKey:changeOptions:isBefore:",_d9,_c8?objj_msgSend(_c7,"copy"):_changesForKey[_d9],_c8);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("proxyForObject:"),function(_da,_db,_dc){
with(_da){
var _dd=_dc[_6];
if(_dd){
return _dd;
}
return objj_msgSend(objj_msgSend(_da,"alloc"),"initWithTarget:",_dc);
}
})]);
var _1=objj_allocateClassPair(Nil,"_CPKVOModelSubclass"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("willChangeValueForKey:"),function(_de,_df,_e0){
with(_de){
var _e1=objj_msgSend(_de,"class"),_e2=sel_getUid("willChangeValueForKey:"),_e3=class_getMethodImplementation(_e1,_e2);
_e3(_de,_e2,_e0);
if(!_e0){
return;
}
var _e4=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPKeyValueChangeSetting,CPKeyValueChangeKindKey);
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_de),"_sendNotificationsForKey:changeOptions:isBefore:",_e0,_e4,YES);
}
}),new objj_method(sel_getUid("didChangeValueForKey:"),function(_e5,_e6,_e7){
with(_e5){
var _e8=objj_msgSend(_e5,"class"),_e9=sel_getUid("didChangeValueForKey:"),_ea=class_getMethodImplementation(_e8,_e9);
_ea(_e5,_e9,_e7);
if(!_e7){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_e5),"_sendNotificationsForKey:changeOptions:isBefore:",_e7,nil,NO);
}
}),new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"),function(_eb,_ec,_ed,_ee,_ef){
with(_eb){
var _f0=objj_msgSend(_eb,"class"),_f1=sel_getUid("willChange:valuesAtIndexes:forKey:"),_f2=class_getMethodImplementation(_f0,_f1);
_f2(_eb,_f1,_ed,_ee,_ef);
if(!_ef){
return;
}
var _f3=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_ed,_ee],[CPKeyValueChangeKindKey,CPKeyValueChangeIndexesKey]);
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_eb),"_sendNotificationsForKey:changeOptions:isBefore:",_ef,_f3,YES);
}
}),new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"),function(_f4,_f5,_f6,_f7,_f8){
with(_f4){
var _f9=objj_msgSend(_f4,"class"),_fa=sel_getUid("didChange:valuesAtIndexes:forKey:"),_fb=class_getMethodImplementation(_f9,_fa);
_fb(_f4,_fa,_f6,_f7,_f8);
if(!_f8){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_f4),"_sendNotificationsForKey:changeOptions:isBefore:",_f8,nil,NO);
}
}),new objj_method(sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"),function(_fc,_fd,_fe,_ff,_100){
with(_fc){
var _101=objj_msgSend(_fc,"class"),_102=sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"),_103=class_getMethodImplementation(_101,_102);
_103(_fc,_102,_fe,_ff,_100);
if(!_fe){
return;
}
var _104=_3e(_ff),_105=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_104,CPKeyValueChangeKindKey);
_105[_CPKeyValueChangeSetMutationObjectsKey]=_100;
_105[_CPKeyValueChangeSetMutationKindKey]=_ff;
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_fc),"_sendNotificationsForKey:changeOptions:isBefore:",_fe,_105,YES);
}
}),new objj_method(sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"),function(self,_106,aKey,_107,_108){
with(self){
var _109=objj_msgSend(self,"class"),_10a=sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"),_10b=class_getMethodImplementation(_109,_10a);
_10b(self,_10a,aKey,_107,_108);
if(!aKey){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",self),"_sendNotificationsForKey:changeOptions:isBefore:",aKey,nil,NO);
}
}),new objj_method(sel_getUid("class"),function(self,_10c){
with(self){
return self[_6]._nativeClass;
}
}),new objj_method(sel_getUid("superclass"),function(self,_10d){
with(self){
return objj_msgSend(objj_msgSend(self,"class"),"superclass");
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(self,_10e,_10f){
with(self){
return objj_msgSend(objj_msgSend(self,"class"),"isSubclassOfClass:",_10f);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(self,_110,_111){
with(self){
return objj_msgSend(self,"class")==_111;
}
}),new objj_method(sel_getUid("className"),function(self,_112){
with(self){
return objj_msgSend(self,"class").name;
}
})]);
var _1=objj_allocateClassPair(Nil,"_CPKVOModelDictionarySubclass"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("removeAllObjects"),function(self,_113){
with(self){
var keys=objj_msgSend(self,"allKeys"),_114=objj_msgSend(keys,"count"),i=0;
for(;i<_114;i++){
objj_msgSend(self,"willChangeValueForKey:",keys[i]);
}
var _115=objj_msgSend(self,"class"),_116=sel_getUid("removeAllObjects"),_117=class_getMethodImplementation(_115,_116);
_117(self,_116);
for(i=0;i<_114;i++){
objj_msgSend(self,"didChangeValueForKey:",keys[i]);
}
}
}),new objj_method(sel_getUid("removeObjectForKey:"),function(self,_118,aKey){
with(self){
objj_msgSend(self,"willChangeValueForKey:",aKey);
var _119=objj_msgSend(self,"class"),_11a=sel_getUid("removeObjectForKey:"),_11b=class_getMethodImplementation(_119,_11a);
_11b(self,_11a,aKey);
objj_msgSend(self,"didChangeValueForKey:",aKey);
}
}),new objj_method(sel_getUid("setObject:forKey:"),function(self,_11c,_11d,aKey){
with(self){
objj_msgSend(self,"willChangeValueForKey:",aKey);
var _11e=objj_msgSend(self,"class"),_11f=sel_getUid("setObject:forKey:"),_120=class_getMethodImplementation(_11e,_11f);
_120(self,_11f,_11d,aKey);
objj_msgSend(self,"didChangeValueForKey:",aKey);
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPKVOForwardingObserver"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_object"),new objj_ivar("_observer"),new objj_ivar("_context"),new objj_ivar("_options"),new objj_ivar("_firstPart"),new objj_ivar("_secondPart"),new objj_ivar("_value")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKeyPath:object:observer:options:context:"),function(self,_121,_122,_123,_124,_125,_126){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPKVOForwardingObserver").super_class},"init");
_context=_126;
_observer=_124;
_object=_123;
_options=_125;
var _127=_122.indexOf(".");
if(_127===CPNotFound){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Created _CPKVOForwardingObserver without compound key path: "+_122);
}
_firstPart=_122.substring(0,_127);
_secondPart=_122.substring(_127+1);
objj_msgSend(_object,"addObserver:forKeyPath:options:context:",self,_firstPart,_options,nil);
_value=objj_msgSend(_object,"valueForKey:",_firstPart);
if(_value){
objj_msgSend(_value,"addObserver:forKeyPath:options:context:",self,_secondPart,_options,nil);
}
return self;
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(self,_128,_129,_12a,_12b,_12c){
with(self){
if(_129===_firstPart){
var _12d=objj_msgSend(_value,"valueForKeyPath:",_secondPart),_12e=objj_msgSend(_object,"valueForKeyPath:",_firstPart+"."+_secondPart),_12f=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_12e?_12e:objj_msgSend(CPNull,"null"),CPKeyValueChangeNewKey,_12d?_12d:objj_msgSend(CPNull,"null"),CPKeyValueChangeOldKey,CPKeyValueChangeSetting,CPKeyValueChangeKindKey);
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_firstPart+"."+_secondPart,_object,_12f,_context);
if(_value){
objj_msgSend(_value,"removeObserver:forKeyPath:",self,_secondPart);
}
_value=objj_msgSend(_object,"valueForKey:",_firstPart);
if(_value){
objj_msgSend(_value,"addObserver:forKeyPath:options:context:",self,_secondPart,_options,nil);
}
}else{
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_firstPart+"."+_129,_object,_12b,_context);
}
}
}),new objj_method(sel_getUid("finalize"),function(self,_130){
with(self){
if(_value){
objj_msgSend(_value,"removeObserver:forKeyPath:",self,_secondPart);
}
objj_msgSend(_object,"removeObserver:forKeyPath:",self,_firstPart);
_object=nil;
_observer=nil;
_context=nil;
_value=nil;
}
})]);
var _bb=_bb=function(_131,_132,_133,_134){
return {observer:_131,options:_132,context:_133,forwarder:_134};
};
objj_executeFile("CPArray+KVO.j",YES);
objj_executeFile("CPSet+KVO.j",YES);
