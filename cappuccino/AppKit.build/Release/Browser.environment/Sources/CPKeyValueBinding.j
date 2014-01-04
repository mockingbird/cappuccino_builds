@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;31;Foundation/CPValueTransformer.jt;16708;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPValueTransformer.j",NO);
var _1=objj_msgSend(CPDictionary,"new"),_2=objj_msgSend(CPDictionary,"new");
var _3=0,_4=1;
var _5=objj_allocateClassPair(CPObject,"CPBinder"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_info"),new objj_ivar("_source"),new objj_ivar("_suppressedNotifications"),new objj_ivar("_placeholderForMarker")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("initWithBinding:name:to:keyPath:options:from:"),function(_7,_8,_9,_a,_b,_c,_d,_e){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPBinder").super_class},"init");
if(_7){
_source=_e;
_info=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_b,_c],[CPObservedObjectKey,CPObservedKeyPathKey]);
_suppressedNotifications={};
_placeholderForMarker={};
if(_d){
objj_msgSend(_info,"setObject:forKey:",_d,CPOptionsKey);
}
objj_msgSend(_7,"_updatePlaceholdersWithOptions:",_d);
objj_msgSend(_b,"addObserver:forKeyPath:options:context:",_7,_c,CPKeyValueObservingOptionNew,_9);
var _f=objj_msgSend(_2,"objectForKey:",objj_msgSend(_source,"UID"));
if(!_f){
_f=objj_msgSend(CPDictionary,"new");
objj_msgSend(_2,"setObject:forKey:",_f,objj_msgSend(_source,"UID"));
}
objj_msgSend(_f,"setObject:forKey:",_7,_a);
objj_msgSend(_7,"setValueFor:",_9);
}
return _7;
}
}),new objj_method(sel_getUid("setValueFor:"),function(_10,_11,_12){
with(_10){
var _13=objj_msgSend(_info,"objectForKey:",CPObservedObjectKey),_14=objj_msgSend(_info,"objectForKey:",CPObservedKeyPathKey),_15=objj_msgSend(_info,"objectForKey:",CPOptionsKey),_16=objj_msgSend(_13,"valueForKeyPath:",_14),_17=CPIsControllerMarker(_16);
if(_17){
if(_16===CPNotApplicableMarker&&objj_msgSend(_15,"objectForKey:",CPRaisesForNotApplicableKeysBindingOption)){
objj_msgSend(CPException,"raise:reason:",CPGenericException,"Cannot transform non-applicable key on: "+_source+" key path: "+_14+" value: "+_16);
}
var _18=objj_msgSend(_10,"_placeholderForMarker:",_16);
objj_msgSend(_10,"setPlaceholderValue:withMarker:forBinding:",_18,_16,_12);
}else{
var _18=objj_msgSend(_10,"transformValue:withOptions:",_16,_15);
objj_msgSend(_10,"setValue:forBinding:",_18,_12);
}
}
}),new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"),function(_19,_1a,_1b,_1c,_1d){
with(_19){
objj_msgSend(_source,"setValue:forKey:",_1b,_1d);
}
}),new objj_method(sel_getUid("setValue:forBinding:"),function(_1e,_1f,_20,_21){
with(_1e){
objj_msgSend(_source,"setValue:forKey:",_20,_21);
}
}),new objj_method(sel_getUid("reverseSetValueFor:"),function(_22,_23,_24){
with(_22){
var _25=objj_msgSend(_info,"objectForKey:",CPObservedObjectKey),_26=objj_msgSend(_info,"objectForKey:",CPObservedKeyPathKey),_27=objj_msgSend(_info,"objectForKey:",CPOptionsKey),_28=objj_msgSend(_22,"valueForBinding:",_24);
_28=objj_msgSend(_22,"reverseTransformValue:withOptions:",_28,_27);
objj_msgSend(_22,"suppressSpecificNotificationFromObject:keyPath:",_25,_26);
objj_msgSend(_25,"setValue:forKeyPath:",_28,_26);
objj_msgSend(_22,"unsuppressSpecificNotificationFromObject:keyPath:",_25,_26);
}
}),new objj_method(sel_getUid("valueForBinding:"),function(_29,_2a,_2b){
with(_29){
return objj_msgSend(_source,"valueForKeyPath:",_2b);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_2c,_2d,_2e,_2f,_30,_31){
with(_2c){
if(!_30){
return;
}
var _32=_suppressedNotifications[objj_msgSend(_2f,"UID")];
if(_32&&_32[_2e]){
return;
}
objj_msgSend(_2c,"setValueFor:",_31);
}
}),new objj_method(sel_getUid("transformValue:withOptions:"),function(_33,_34,_35,_36){
with(_33){
var _37=objj_msgSend(_36,"objectForKey:",CPValueTransformerNameBindingOption),_38;
if(_37){
_38=objj_msgSend(CPValueTransformer,"valueTransformerForName:",_37);
if(!_38){
var _39=CPClassFromString(_37);
if(_39){
_38=objj_msgSend(objj_msgSend(_39,"alloc"),"init");
objj_msgSend(_39,"setValueTransformer:forName:",_38,_37);
}
}
}else{
_38=objj_msgSend(_36,"objectForKey:",CPValueTransformerBindingOption);
}
if(_38){
_35=objj_msgSend(_38,"transformedValue:",_35);
}
if(_35===undefined||_35===nil||_35===objj_msgSend(CPNull,"null")){
_35=objj_msgSend(_36,"objectForKey:",CPNullPlaceholderBindingOption)||nil;
}
return _35;
}
}),new objj_method(sel_getUid("reverseTransformValue:withOptions:"),function(_3a,_3b,_3c,_3d){
with(_3a){
var _3e=objj_msgSend(_3d,"objectForKey:",CPValueTransformerNameBindingOption),_3f;
if(_3e){
_3f=objj_msgSend(CPValueTransformer,"valueTransformerForName:",_3e);
}else{
_3f=objj_msgSend(_3d,"objectForKey:",CPValueTransformerBindingOption);
}
if(_3f&&objj_msgSend(objj_msgSend(_3f,"class"),"allowsReverseTransformation")){
_3c=objj_msgSend(_3f,"reverseTransformedValue:",_3c);
}
return _3c;
}
}),new objj_method(sel_getUid("continuouslyUpdatesValue"),function(_40,_41){
with(_40){
var _42=objj_msgSend(_info,"objectForKey:",CPOptionsKey);
return objj_msgSend(objj_msgSend(_42,"objectForKey:",CPContinuouslyUpdatesValueBindingOption),"boolValue");
}
}),new objj_method(sel_getUid("handlesContentAsCompoundValue"),function(_43,_44){
with(_43){
var _45=objj_msgSend(_info,"objectForKey:",CPOptionsKey);
return objj_msgSend(objj_msgSend(_45,"objectForKey:",CPHandlesContentAsCompoundValueBindingOption),"boolValue");
}
}),new objj_method(sel_getUid("suppressSpecificNotificationFromObject:keyPath:"),function(_46,_47,_48,_49){
with(_46){
if(!_48){
return;
}
var uid=objj_msgSend(_48,"UID"),_4a=_suppressedNotifications[uid];
if(!_4a){
_suppressedNotifications[uid]=_4a={};
}
_4a[_49]=YES;
}
}),new objj_method(sel_getUid("unsuppressSpecificNotificationFromObject:keyPath:"),function(_4b,_4c,_4d,_4e){
with(_4b){
if(!_4d){
return;
}
var uid=objj_msgSend(_4d,"UID"),_4f=_suppressedNotifications[uid];
if(!_4f){
return;
}
delete _4f[_4e];
}
}),new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"),function(_50,_51,_52){
with(_50){
var _53=objj_msgSend(_54,"count");
while(_53--){
var _55=_54[_53],_56=_57[_53],_58=objj_msgSend(_52,"containsKey:",_56),_59=_58?objj_msgSend(_52,"objectForKey:",_56):nil;
objj_msgSend(_50,"_setPlaceholder:forMarker:isDefault:",_59,_55,!_58);
}
}
}),new objj_method(sel_getUid("_placeholderForMarker:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=_placeholderForMarker[_5c];
if(_5d){
return _5d["value"];
}
return nil;
}
}),new objj_method(sel_getUid("_setPlaceholder:forMarker:isDefault:"),function(_5e,_5f,_60,_61,_62){
with(_5e){
if(_62){
var _63=_placeholderForMarker[_61];
if(_63&&!_63["isDefault"]){
return;
}
}
_placeholderForMarker[_61]={"isDefault":_62,"value":_60};
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("exposeBinding:forClass:"),function(_64,_65,_66,_67){
with(_64){
var _68=objj_msgSend(_1,"objectForKey:",objj_msgSend(_67,"UID"));
if(!_68){
_68=[];
objj_msgSend(_1,"setObject:forKey:",_68,objj_msgSend(_67,"UID"));
}
_68.push(_66);
}
}),new objj_method(sel_getUid("exposedBindingsForClass:"),function(_69,_6a,_6b){
with(_69){
return objj_msgSend(objj_msgSend(_1,"objectForKey:",objj_msgSend(_6b,"UID")),"copy");
}
}),new objj_method(sel_getUid("getBinding:forObject:"),function(_6c,_6d,_6e,_6f){
with(_6c){
return objj_msgSend(objj_msgSend(_2,"objectForKey:",objj_msgSend(_6f,"UID")),"objectForKey:",_6e);
}
}),new objj_method(sel_getUid("infoForBinding:forObject:"),function(_70,_71,_72,_73){
with(_70){
var _74=objj_msgSend(_70,"getBinding:forObject:",_72,_73);
if(_74){
return _74._info;
}
return nil;
}
}),new objj_method(sel_getUid("allBindingsForObject:"),function(_75,_76,_77){
with(_75){
return objj_msgSend(_2,"objectForKey:",objj_msgSend(_77,"UID"));
}
}),new objj_method(sel_getUid("unbind:forObject:"),function(_78,_79,_7a,_7b){
with(_78){
var _7c=objj_msgSend(_2,"objectForKey:",objj_msgSend(_7b,"UID"));
if(!_7c){
return;
}
var _7d=objj_msgSend(_7c,"objectForKey:",_7a);
if(!_7d){
return;
}
var _7e=_7d._info,_7f=objj_msgSend(_7e,"objectForKey:",CPObservedObjectKey),_80=objj_msgSend(_7e,"objectForKey:",CPObservedKeyPathKey);
objj_msgSend(_7f,"removeObserver:forKeyPath:",_7d,_80);
objj_msgSend(_7c,"removeObjectForKey:",_7a);
}
}),new objj_method(sel_getUid("unbindAllForObject:"),function(_81,_82,_83){
with(_81){
var _84=objj_msgSend(_2,"objectForKey:",objj_msgSend(_83,"UID"));
if(!_84){
return;
}
var _85=objj_msgSend(_84,"allKeys"),_86=_85.length;
while(_86--){
objj_msgSend(_83,"unbind:",objj_msgSend(_84,"objectForKey:",_85[_86]));
}
objj_msgSend(_2,"removeObjectForKey:",objj_msgSend(_83,"UID"));
}
})]);
var _5=objj_getClass("CPObject");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("exposedBindings"),function(_87,_88){
with(_87){
var _89=[],_8a=objj_msgSend(_87,"class");
while(_8a){
var _8b=objj_msgSend(CPBinder,"exposedBindingsForClass:",_8a);
if(_8b){
objj_msgSend(_89,"addObjectsFromArray:",_8b);
}
_8a=objj_msgSend(_8a,"superclass");
}
return _89;
}
}),new objj_method(sel_getUid("valueClassForBinding:"),function(_8c,_8d,_8e){
with(_8c){
return objj_msgSend(CPString,"class");
}
}),new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"),function(_8f,_90,_91,_92,_93,_94){
with(_8f){
if(!_92||!_93){
return CPLog.error("Invalid object or path on "+_8f+" for "+_91);
}
var _95=objj_msgSend(objj_msgSend(_8f,"class"),"_binderClassForBinding:",_91);
objj_msgSend(_8f,"unbind:",_91);
objj_msgSend(objj_msgSend(_95,"alloc"),"initWithBinding:name:to:keyPath:options:from:",objj_msgSend(_8f,"_replacementKeyPathForBinding:",_91),_91,_92,_93,_94,_8f);
}
}),new objj_method(sel_getUid("infoForBinding:"),function(_96,_97,_98){
with(_96){
return objj_msgSend(CPBinder,"infoForBinding:forObject:",_98,_96);
}
}),new objj_method(sel_getUid("unbind:"),function(_99,_9a,_9b){
with(_99){
var _9c=objj_msgSend(objj_msgSend(_99,"class"),"_binderClassForBinding:",_9b);
objj_msgSend(_9c,"unbind:forObject:",_9b,_99);
}
}),new objj_method(sel_getUid("_replacementKeyPathForBinding:"),function(_9d,_9e,_9f){
with(_9d){
return _9f;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("exposeBinding:"),function(_a0,_a1,_a2){
with(_a0){
objj_msgSend(CPBinder,"exposeBinding:forClass:",_a2,objj_msgSend(_a0,"class"));
}
}),new objj_method(sel_getUid("_binderClassForBinding:"),function(_a3,_a4,_a5){
with(_a3){
return objj_msgSend(CPBinder,"class");
}
})]);
var _5=objj_allocateClassPair(CPBinder,"_CPValueBinder"),_6=_5.isa;
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("setValueFor:"),function(_a6,_a7,_a8){
with(_a6){
objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("_CPValueBinder").super_class},"setValueFor:","objectValue");
}
}),new objj_method(sel_getUid("reverseSetValueFor:"),function(_a9,_aa,_ab){
with(_a9){
objj_msgSendSuper({receiver:_a9,super_class:objj_getClass("_CPValueBinder").super_class},"reverseSetValueFor:","objectValue");
}
})]);
var _5=objj_allocateClassPair(CPBinder,"_CPKeyValueOrBinding"),_6=_5.isa;
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("setValueFor:"),function(_ac,_ad,_ae){
with(_ac){
var _af=objj_msgSend(_2,"valueForKey:",objj_msgSend(_source,"UID"));
if(!_af){
return;
}
objj_msgSend(_source,"setValue:forKey:",_b0(_ae,_af,_4),_ae);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_b1,_b2,_b3,_b4,_b5,_b6){
with(_b1){
objj_msgSend(_b1,"setValueFor:",_b6);
}
})]);
var _5=objj_allocateClassPair(CPBinder,"_CPKeyValueAndBinding"),_6=_5.isa;
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("setValueFor:"),function(_b7,_b8,_b9){
with(_b7){
var _ba=objj_msgSend(_2,"objectForKey:",objj_msgSend(_source,"UID"));
if(!_ba){
return;
}
objj_msgSend(_source,"setValue:forKey:",_b0(_b9,_ba,_3),_b9);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_bb,_bc,_bd,_be,_bf,_c0){
with(_bb){
objj_msgSend(_bb,"setValueFor:",_c0);
}
})]);
var _b0=function(key,_c1,_c2){
var _c3=key,_c4,_c5=1;
while(_c4=objj_msgSend(_c1,"objectForKey:",_c3)){
var _c6=_c4._info,_c7=objj_msgSend(_c6,"objectForKey:",CPObservedObjectKey),_c8=objj_msgSend(_c6,"objectForKey:",CPObservedKeyPathKey),_c9=objj_msgSend(_c6,"objectForKey:",CPOptionsKey);
var _ca=objj_msgSend(_c4,"transformValue:withOptions:",objj_msgSend(_c7,"valueForKeyPath:",_c8),_c9);
if(_ca==_c2){
return _c2;
}
_c3=objj_msgSend(CPString,"stringWithFormat:","%@%i",key,++_c5);
}
return !_c2;
};
var _cb=function(_cc,_cd,_ce){
var _cf=objj_msgSend(_ce,"objectForKey:",_cc),_d0=_cf._info,_d1=objj_msgSend(_d0,"objectForKey:",CPObservedObjectKey),_d2=objj_msgSend(_d0,"objectForKey:",CPObservedKeyPathKey),_d3=objj_msgSend(_d0,"objectForKey:",CPOptionsKey),_d4=objj_msgSend(_d1,"valueForKeyPath:",_d2),_d5=objj_msgSend(_d3,"objectForKey:",CPSelectorNameBindingOption);
if(!_d4||!_d5){
return;
}
var _d6=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",objj_msgSend(_d4,"methodSignatureForSelector:",_d5));
objj_msgSend(_d6,"setSelector:",_d5);
var _d7=_cd,_d8=1;
while(_cf=objj_msgSend(_ce,"objectForKey:",_d7)){
_d0=_cf._info;
_d2=objj_msgSend(_d0,"objectForKey:",CPObserverKeyPathKey);
_d1=objj_msgSend(objj_msgSend(_d0,"objectForKey:",CPObservedObjectKey),"valueForKeyPath:",_d2);
if(_d1){
objj_msgSend(_d6,"setArgument:atIndex:",_d1,++_d8);
}
_d7=objj_msgSend(CPString,"stringWithFormat:","%@%i",_cd,_d8);
}
objj_msgSend(_d6,"invoke");
};
CPObservedObjectKey="CPObservedObjectKey";
CPObservedKeyPathKey="CPObservedKeyPathKey";
CPOptionsKey="CPOptionsKey";
CPMultipleValuesMarker="CPMultipleValuesMarker";
CPNoSelectionMarker="CPNoSelectionMarker";
CPNotApplicableMarker="CPNotApplicableMarker";
CPNullMarker="CPNullMarker";
CPAlignmentBinding="alignment";
CPContentArrayBinding="contentArray";
CPContentBinding="content";
CPContentObjectBinding="contentObject";
CPContentObjectsBinding="contentObjects";
CPContentValuesBinding="contentValues";
CPEditableBinding="editable";
CPEnabledBinding="enabled";
CPFontBinding="font";
CPFontNameBinding="fontName";
CPFontBoldBinding="fontBold";
CPHiddenBinding="hidden";
CPFilterPredicateBinding="filterPredicate";
CPPredicateBinding="predicate";
CPSelectedIndexBinding="selectedIndex";
CPSelectedLabelBinding="selectedLabel";
CPSelectedObjectBinding="selectedObject";
CPSelectedObjectsBinding="selectedObjects";
CPSelectedTagBinding="selectedTag";
CPSelectedValueBinding="selectedValue";
CPSelectedValuesBinding="selectedValues";
CPSelectionIndexesBinding="selectionIndexes";
CPTextColorBinding="textColor";
CPTitleBinding="title";
CPToolTipBinding="toolTip";
CPValueBinding="value";
CPValueURLBinding="valueURL";
CPValuePathBinding="valuePath";
CPDataBinding="data";
CPAllowsEditingMultipleValuesSelectionBindingOption="CPAllowsEditingMultipleValuesSelection";
CPAllowsNullArgumentBindingOption="CPAllowsNullArgument";
CPConditionallySetsEditableBindingOption="CPConditionallySetsEditable";
CPConditionallySetsEnabledBindingOption="CPConditionallySetsEnabled";
CPConditionallySetsHiddenBindingOption="CPConditionallySetsHidden";
CPContinuouslyUpdatesValueBindingOption="CPContinuouslyUpdatesValue";
CPCreatesSortDescriptorBindingOption="CPCreatesSortDescriptor";
CPDeletesObjectsOnRemoveBindingsOption="CPDeletesObjectsOnRemove";
CPDisplayNameBindingOption="CPDisplayName";
CPDisplayPatternBindingOption="CPDisplayPattern";
CPHandlesContentAsCompoundValueBindingOption="CPHandlesContentAsCompoundValue";
CPInsertsNullPlaceholderBindingOption="CPInsertsNullPlaceholder";
CPInvokesSeparatelyWithArrayObjectsBindingOption="CPInvokesSeparatelyWithArrayObjects";
CPMultipleValuesPlaceholderBindingOption="CPMultipleValuesPlaceholder";
CPNoSelectionPlaceholderBindingOption="CPNoSelectionPlaceholder";
CPNotApplicablePlaceholderBindingOption="CPNotApplicablePlaceholder";
CPNullPlaceholderBindingOption="CPNullPlaceholder";
CPPredicateFormatBindingOption="CPPredicateFormat";
CPRaisesForNotApplicableKeysBindingOption="CPRaisesForNotApplicableKeys";
CPSelectorNameBindingOption="CPSelectorName";
CPSelectsAllWhenSettingContentBindingOption="CPSelectsAllWhenSettingContent";
CPValidatesImmediatelyBindingOption="CPValidatesImmediately";
CPValueTransformerNameBindingOption="CPValueTransformerName";
CPValueTransformerBindingOption="CPValueTransformer";
CPIsControllerMarker=function(_d9){
return _d9===CPMultipleValuesMarker||_d9===CPNoSelectionMarker||_d9===CPNotApplicableMarker||_d9===CPNullMarker;
};
var _54=[CPMultipleValuesMarker,CPNoSelectionMarker,CPNotApplicableMarker,CPNullMarker],_57=[CPMultipleValuesPlaceholderBindingOption,CPNoSelectionPlaceholderBindingOption,CPNotApplicablePlaceholderBindingOption,CPNullPlaceholderBindingOption];
