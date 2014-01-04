@STATIC;1.0;i;14;CPRuleEditor.ji;24;_CPPredicateEditorTree.ji;27;_CPPredicateEditorRowNode.ji;30;CPPredicateEditorRowTemplate.jt;13697;
objj_executeFile("CPRuleEditor.j",YES);
objj_executeFile("_CPPredicateEditorTree.j",YES);
objj_executeFile("_CPPredicateEditorRowNode.j",YES);
objj_executeFile("CPPredicateEditorRowTemplate.j",YES);
var _1=objj_allocateClassPair(CPRuleEditor,"CPPredicateEditor"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_allTemplates"),new objj_ivar("_rootTrees"),new objj_ivar("_rootHeaderTrees"),new objj_ivar("_predicateTarget"),new objj_ivar("_predicateAction")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("target"),function(_3,_4){
with(_3){
return _predicateTarget;
}
}),new objj_method(sel_getUid("setTarget:"),function(_5,_6,_7){
with(_5){
_predicateTarget=_7;
}
}),new objj_method(sel_getUid("action"),function(_8,_9){
with(_8){
return _predicateAction;
}
}),new objj_method(sel_getUid("setAction:"),function(_a,_b,_c){
with(_a){
_predicateAction=_c;
}
}),new objj_method(sel_getUid("rowTemplates"),function(_d,_e){
with(_d){
return _allTemplates;
}
}),new objj_method(sel_getUid("setRowTemplates:"),function(_f,_10,_11){
with(_f){
if(_allTemplates==_11){
return;
}
_allTemplates=_11;
objj_msgSend(_f,"_updateItemsByCompoundTemplates");
objj_msgSend(_f,"_updateItemsBySimpleTemplates");
if(objj_msgSend(_f,"numberOfRows")>0){
var _12=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPPredicateEditor").super_class},"predicate");
objj_msgSend(_f,"_reflectPredicate:",_12);
}
}
}),new objj_method(sel_getUid("_replacementKeyPathForBinding:"),function(_13,_14,_15){
with(_13){
if(_15==CPValueBinding){
return "predicate";
}
return objj_msgSendSuper({receiver:_13,super_class:objj_getClass("CPPredicateEditor").super_class},"_replacementKeyPathForBinding:",_15);
}
}),new objj_method(sel_getUid("_initRuleEditorShared"),function(_16,_17){
with(_16){
objj_msgSendSuper({receiver:_16,super_class:objj_getClass("CPPredicateEditor").super_class},"_initRuleEditorShared");
_rootTrees=objj_msgSend(CPArray,"array");
_rootHeaderTrees=objj_msgSend(CPArray,"array");
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_18,_19,_1a){
with(_18){
_18=objj_msgSendSuper({receiver:_18,super_class:objj_getClass("CPPredicateEditor").super_class},"initWithFrame:",_1a);
if(_18!=nil){
var _1b=objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithCompoundTypes:",[CPAndPredicateType,CPOrPredicateType]);
_allTemplates=objj_msgSend(CPArray,"arrayWithObject:",_1b);
}
return _18;
}
}),new objj_method(sel_getUid("objectValue"),function(_1c,_1d){
with(_1c){
return objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPPredicateEditor").super_class},"predicate");
}
}),new objj_method(sel_getUid("_updateItemsBySimpleTemplates"),function(_1e,_1f){
with(_1e){
var _20=objj_msgSend(CPMutableArray,"array"),_21=objj_msgSend(_allTemplates,"count"),t;
while(_21--){
var t=_allTemplates[_21];
if(objj_msgSend(t,"_rowType")==CPRuleEditorRowTypeSimple){
objj_msgSend(_20,"insertObject:atIndex:",t,0);
}
}
var _22=objj_msgSend(_1e,"_constructTreesForTemplates:",_20);
if(objj_msgSend(_22,"count")>0){
_rootTrees=objj_msgSend(_1e,"_mergeTree:",_22);
}
}
}),new objj_method(sel_getUid("_updateItemsByCompoundTemplates"),function(_23,_24){
with(_23){
var _25=objj_msgSend(CPMutableArray,"array"),_26=objj_msgSend(_allTemplates,"count"),t;
while(_26--){
var t=_allTemplates[_26];
if(objj_msgSend(t,"_rowType")==CPRuleEditorRowTypeCompound){
objj_msgSend(_25,"insertObject:atIndex:",t,0);
}
}
var _27=objj_msgSend(_23,"_constructTreesForTemplates:",_25);
if(objj_msgSend(_27,"count")>0){
_rootHeaderTrees=objj_msgSend(_23,"_mergeTree:",_27);
}
}
}),new objj_method(sel_getUid("_constructTreesForTemplates:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(CPMutableArray,"array"),_2c=objj_msgSend(_2a,"count");
for(var i=0;i<_2c;i++){
var _2d=objj_msgSend(_28,"_constructTreeForTemplate:",_2a[i]);
objj_msgSend(_2b,"addObjectsFromArray:",_2d);
}
return _2b;
}
}),new objj_method(sel_getUid("_mergeTree:"),function(_2e,_2f,_30){
with(_2e){
var _31=objj_msgSend(CPMutableArray,"array");
if(_30==nil){
return _31;
}
var _32=objj_msgSend(_30,"count");
for(var i=0;i<_32;i++){
var _33=objj_msgSend(_30,"objectAtIndex:",i),_34=objj_msgSend(_31,"count"),_35=NO;
for(var j=0;j<_34;j++){
var _36=objj_msgSend(_31,"objectAtIndex:",j);
if(objj_msgSend(objj_msgSend(_36,"title"),"isEqualToString:",objj_msgSend(_33,"title"))){
var _37=objj_msgSend(_36,"children"),_38=objj_msgSend(_33,"children"),_39=objj_msgSend(_37,"arrayByAddingObjectsFromArray:",_38),_3a=objj_msgSend(_2e,"_mergeTree:",_39);
objj_msgSend(_36,"setChildren:",_3a);
_35=YES;
}
}
if(!_35){
objj_msgSend(_31,"addObject:",_33);
}
}
return _31;
}
}),new objj_method(sel_getUid("_constructTreeForTemplate:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=objj_msgSend(CPArray,"array"),_3f=objj_msgSend(_3d,"templateViews"),_40=objj_msgSend(_3f,"count");
while(_40--){
var _41=objj_msgSend(CPArray,"array"),_42=0,_43=-1,_44,_45=objj_msgSend(_3f,"objectAtIndex:",_40),_46=objj_msgSend(_45,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"));
if(_46){
itemArray=objj_msgSend(objj_msgSend(_45,"itemArray"),"valueForKey:","title");
_42=objj_msgSend(itemArray,"count");
_43=0;
}
for(;_43<_42;_43++){
var _47=objj_msgSend(_CPPredicateEditorTree,"new");
objj_msgSend(_47,"setIndexIntoTemplate:",_40);
objj_msgSend(_47,"setTemplate:",_3d);
objj_msgSend(_47,"setMenuItemIndex:",_43);
if(_46){
objj_msgSend(_47,"setTitle:",objj_msgSend(itemArray,"objectAtIndex:",_43));
}
objj_msgSend(_41,"addObject:",_47);
}
objj_msgSend(_41,"makeObjectsPerformSelector:withObject:",sel_getUid("setChildren:"),_3e);
_3e=_41;
}
return _3e;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_48,_49,_4a){
with(_48){
var ov=objj_msgSend(_48,"objectValue");
if((ov==nil)!=(_4a==nil)||!objj_msgSend(ov,"isEqual:",_4a)){
objj_msgSend(_48,"_setPredicate:",_4a);
objj_msgSend(_48,"_reflectPredicate:",_4a);
}
}
}),new objj_method(sel_getUid("_reflectPredicate:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=_currentAnimation;
_currentAnimation=nil;
_sendAction=NO;
if(_4d!=nil){
if((_nestingMode==CPRuleEditorNestingModeSimple||_nestingMode==CPRuleEditorNestingModeCompound)&&objj_msgSend(_4d,"isKindOfClass:",objj_msgSend(CPComparisonPredicate,"class"))){
_4d=objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",objj_msgSend(_4b,"_compoundPredicateTypeForRootRows"),objj_msgSend(CPArray,"arrayWithObject:",_4d));
}
var row=objj_msgSend(_4b,"_rowObjectFromPredicate:",_4d);
if(row!=nil){
objj_msgSend(_boundArrayOwner,"setValue:forKey:",objj_msgSend(CPArray,"arrayWithObject:",row),_boundArrayKeyPath);
}
}
objj_msgSend(_4b,"setAnimation:",_4e);
}
}),new objj_method(sel_getUid("_rowObjectFromPredicate:"),function(_4f,_50,_51){
with(_4f){
var _52,_53,_54=objj_msgSend(CPPredicateEditorRowTemplate,"_bestMatchForPredicate:inTemplates:quality:",_51,objj_msgSend(_4f,"rowTemplates"),_52);
if(_54==nil){
return nil;
}
var _55=objj_msgSend(_54,"copy"),_56=objj_msgSend(_54,"displayableSubpredicatesOfPredicate:",_51);
if(_56==nil){
objj_msgSend(_55,"_setComparisonPredicate:",_51);
_53=CPRuleEditorRowTypeSimple;
}else{
objj_msgSend(_55,"_setCompoundPredicate:",_51);
_53=CPRuleEditorRowTypeCompound;
}
var row=objj_msgSend(_4f,"_rowFromTemplate:originalTemplate:withRowType:",_55,_54,_53);
if(_56==nil){
return row;
}
var _57=objj_msgSend(_56,"count"),_58=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<_57;i++){
var _59=objj_msgSend(_4f,"_rowObjectFromPredicate:",_56[i]);
if(_59!=nil){
objj_msgSend(_58,"addObject:",_59);
}
}
objj_msgSend(row,"setValue:forKey:",_58,objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("CPPredicateEditor").super_class},"subrowsKeyPath"));
return row;
}
}),new objj_method(sel_getUid("_rowFromTemplate:originalTemplate:withRowType:"),function(_5a,_5b,_5c,_5d,_5e){
with(_5a){
var _5f=objj_msgSend(CPArray,"array"),_60=objj_msgSend(CPArray,"array"),_61=objj_msgSend(_5c,"templateViews"),_62,_63;
_62=(_5e==CPRuleEditorRowTypeSimple)?_rootTrees:_rootHeaderTrees;
while((_63=objj_msgSend(_62,"count"))>0){
var _64;
for(var i=0;i<_63;i++){
_64=objj_msgSend(_62,"objectAtIndex:",i);
var _65=objj_msgSend(_61,"objectAtIndex:",objj_msgSend(_64,"indexIntoTemplate")),_66=objj_msgSend(_64,"title");
if(_66==nil||objj_msgSend(_66,"isEqual:",objj_msgSend(_65,"titleOfSelectedItem"))){
var _67=objj_msgSend(_CPPredicateEditorRowNode,"rowNodeFromTree:",_64);
objj_msgSend(_67,"applyTemplate:withViews:forOriginalTemplate:",_5c,_61,_5d);
objj_msgSend(_5f,"addObject:",_67);
objj_msgSend(_60,"addObject:",objj_msgSend(_67,"displayValue"));
break;
}
}
_62=objj_msgSend(_64,"children");
}
var row=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_5f,"criteria",_60,"displayValues",_5e,"rowType");
return row;
}
}),new objj_method(sel_getUid("_updatePredicate"),function(_68,_69){
with(_68){
objj_msgSend(_68,"_updatePredicateFromRows");
}
}),new objj_method(sel_getUid("_updatePredicateFromRows"),function(_6a,_6b){
with(_6a){
var _6c=objj_msgSendSuper({receiver:_6a,super_class:objj_getClass("CPPredicateEditor").super_class},"_rootRowsArray"),_6d=objj_msgSend(CPMutableArray,"array"),_6e,_6f=_6e=objj_msgSend(_6c,"count"),_70;
while(_6e--){
var _71=objj_msgSend(_6c,"objectAtIndex:",_6e),_72=objj_msgSend(_6a,"_predicateFromRowItem:",_71);
if(_72!=nil){
objj_msgSend(_6d,"insertObject:atIndex:",_72,0);
}
}
if(_nestingMode!=CPRuleEditorNestingModeList&&_6f==1){
_70=objj_msgSend(_6d,"lastObject");
}else{
_70=objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",objj_msgSend(_6a,"_compoundPredicateTypeForRootRows"),_6d);
}
objj_msgSend(_6a,"_setPredicate:",_70);
}
}),new objj_method(sel_getUid("_predicateFromRowItem:"),function(_73,_74,_75){
with(_73){
var _76=objj_msgSend(CPArray,"array"),_77=objj_msgSend(_75,"valueForKey:",_typeKeyPath);
if(_77==CPRuleEditorRowTypeCompound){
var _78=objj_msgSend(_75,"valueForKey:",_subrowsArrayKeyPath),_79=objj_msgSend(_78,"count");
for(var i=0;i<_79;i++){
var _7a=objj_msgSend(_78,"objectAtIndex:",i),_7b=objj_msgSend(_73,"_predicateFromRowItem:",_7a);
objj_msgSend(_76,"addObject:",_7b);
}
}
var _7c=objj_msgSend(_75,"valueForKey:",_itemsKeyPath),_7d=objj_msgSend(_75,"valueForKey:",_valuesKeyPath),_79=objj_msgSend(_7c,"count"),_7e=objj_msgSend(_7c,"lastObject"),_7f=objj_msgSend(_7e,"templateForRow"),_80=objj_msgSend(_7f,"templateViews");
for(var j=0;j<_79;j++){
var _81=objj_msgSend(_80,"objectAtIndex:",j),_82=objj_msgSend(_7d,"objectAtIndex:",j);
objj_msgSend(objj_msgSend(_7c,"objectAtIndex:",j),"setTemplateViews:",_80);
if(objj_msgSend(_81,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"))){
objj_msgSend(_81,"selectItemWithTitle:",_82);
}else{
if(objj_msgSend(_81,"respondsToSelector:",sel_getUid("setObjectValue:"))){
objj_msgSend(_81,"setObjectValue:",objj_msgSend(_82,"objectValue"));
}
}
}
return objj_msgSend(_7f,"predicateWithSubpredicates:",_76);
}
}),new objj_method(sel_getUid("_compoundPredicateTypeForRootRows"),function(_83,_84){
with(_83){
return CPAndPredicateType;
}
}),new objj_method(sel_getUid("_sendRuleAction"),function(_85,_86){
with(_85){
objj_msgSendSuper({receiver:_85,super_class:objj_getClass("CPPredicateEditor").super_class},"_sendRuleAction");
}
}),new objj_method(sel_getUid("_sendsActionOnIncompleteTextChange"),function(_87,_88){
with(_87){
return NO;
}
}),new objj_method(sel_getUid("_queryNumberOfChildrenOfItem:withRowType:"),function(_89,_8a,_8b,_8c){
with(_89){
if(_8b==nil){
var _8d=(_8c==CPRuleEditorRowTypeSimple)?_rootTrees:_rootHeaderTrees;
return objj_msgSend(_8d,"count");
}
return objj_msgSend(objj_msgSend(_8b,"children"),"count");
}
}),new objj_method(sel_getUid("_queryChild:ofItem:withRowType:"),function(_8e,_8f,_90,_91,_92){
with(_8e){
if(_91==nil){
var _93=(_92==CPRuleEditorRowTypeSimple)?_rootTrees:_rootHeaderTrees;
return objj_msgSend(_CPPredicateEditorRowNode,"rowNodeFromTree:",_93[_90]);
}
return objj_msgSend(objj_msgSend(_91,"children"),"objectAtIndex:",_90);
}
}),new objj_method(sel_getUid("_queryValueForItem:inRow:"),function(_94,_95,_96,_97){
with(_94){
return objj_msgSend(_96,"displayValue");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("_binderClassForBinding:"),function(_98,_99,_9a){
with(_98){
if(_9a==CPValueBinding){
return objj_msgSend(CPPredicateEditorValueBinder,"class");
}
return objj_msgSendSuper({receiver:_98,super_class:objj_getMetaClass("CPPredicateEditor").super_class},"_binderClassForBinding:",_9a);
}
})]);
var _9b="CPPredicateTemplates";
var _1=objj_getClass("CPPredicateEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_9c,_9d,_9e){
with(_9c){
_9c=objj_msgSendSuper({receiver:_9c,super_class:objj_getClass("CPPredicateEditor").super_class},"initWithCoder:",_9e);
if(_9c!=nil){
var _9f=objj_msgSend(_9e,"decodeObjectForKey:",_9b);
if(_9f!=nil){
objj_msgSend(_9c,"setRowTemplates:",_9f);
}
}
return _9c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a0,_a1,_a2){
with(_a0){
objj_msgSendSuper({receiver:_a0,super_class:objj_getClass("CPPredicateEditor").super_class},"encodeWithCoder:",_a2);
objj_msgSend(_a2,"encodeObject:forKey:",_allTemplates,_9b);
}
})]);
var _1=objj_allocateClassPair(CPBinder,"CPPredicateEditorValueBinder"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"),function(_a3,_a4,_a5,_a6,_a7){
with(_a3){
objj_msgSend(_source,"_reflectPredicate:",nil);
}
}),new objj_method(sel_getUid("setValue:forBinding:"),function(_a8,_a9,_aa,_ab){
with(_a8){
objj_msgSend(_source,"_reflectPredicate:",_aa);
}
})]);
