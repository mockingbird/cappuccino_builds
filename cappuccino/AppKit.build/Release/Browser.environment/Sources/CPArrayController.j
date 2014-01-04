@STATIC;1.0;I;23;Foundation/CPIndexSet.ji;20;CPObjectController.ji;19;CPKeyValueBinding.jt;24791;
objj_executeFile("Foundation/CPIndexSet.j",NO);
objj_executeFile("CPObjectController.j",YES);
objj_executeFile("CPKeyValueBinding.j",YES);
var _1=objj_allocateClassPair(CPObjectController,"CPArrayController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_avoidsEmptySelection"),new objj_ivar("_clearsFilterPredicateOnInsertion"),new objj_ivar("_filterRestrictsInsertion"),new objj_ivar("_preservesSelection"),new objj_ivar("_selectsInsertedObjects"),new objj_ivar("_alwaysUsesMultipleValuesMarker"),new objj_ivar("_automaticallyRearrangesObjects"),new objj_ivar("_selectionIndexes"),new objj_ivar("_sortDescriptors"),new objj_ivar("_filterPredicate"),new objj_ivar("_arrangedObjects"),new objj_ivar("_disableSetContent")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPArrayController").super_class},"init");
if(_3){
_preservesSelection=YES;
_selectsInsertedObjects=YES;
_avoidsEmptySelection=YES;
_clearsFilterPredicateOnInsertion=YES;
_alwaysUsesMultipleValuesMarker=NO;
_automaticallyRearrangesObjects=NO;
_filterRestrictsInsertion=YES;
objj_msgSend(_3,"_init");
}
return _3;
}
}),new objj_method(sel_getUid("_init"),function(_5,_6){
with(_5){
_sortDescriptors=objj_msgSend(CPArray,"array");
_filterPredicate=nil;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
objj_msgSend(_5,"__setArrangedObjects:",objj_msgSend(CPArray,"array"));
}
}),new objj_method(sel_getUid("prepareContent"),function(_7,_8){
with(_7){
objj_msgSend(_7,"_setContentArray:",[objj_msgSend(_7,"newObject")]);
}
}),new objj_method(sel_getUid("preservesSelection"),function(_9,_a){
with(_9){
return _preservesSelection;
}
}),new objj_method(sel_getUid("setPreservesSelection:"),function(_b,_c,_d){
with(_b){
_preservesSelection=_d;
}
}),new objj_method(sel_getUid("selectsInsertedObjects"),function(_e,_f){
with(_e){
return _selectsInsertedObjects;
}
}),new objj_method(sel_getUid("setSelectsInsertedObjects:"),function(_10,_11,_12){
with(_10){
_selectsInsertedObjects=_12;
}
}),new objj_method(sel_getUid("avoidsEmptySelection"),function(_13,_14){
with(_13){
return _avoidsEmptySelection;
}
}),new objj_method(sel_getUid("setAvoidsEmptySelection:"),function(_15,_16,_17){
with(_15){
_avoidsEmptySelection=_17;
}
}),new objj_method(sel_getUid("clearsFilterPredicateOnInsertion"),function(_18,_19){
with(_18){
return _clearsFilterPredicateOnInsertion;
}
}),new objj_method(sel_getUid("setClearsFilterPredicateOnInsertion:"),function(_1a,_1b,_1c){
with(_1a){
_clearsFilterPredicateOnInsertion=_1c;
}
}),new objj_method(sel_getUid("alwaysUsesMultipleValuesMarker"),function(_1d,_1e){
with(_1d){
return _alwaysUsesMultipleValuesMarker;
}
}),new objj_method(sel_getUid("setAlwaysUsesMultipleValuesMarker:"),function(_1f,_20,_21){
with(_1f){
_alwaysUsesMultipleValuesMarker=_21;
}
}),new objj_method(sel_getUid("automaticallyRearrangesObjects"),function(_22,_23){
with(_22){
return _automaticallyRearrangesObjects;
}
}),new objj_method(sel_getUid("setAutomaticallyRearrangesObjects:"),function(_24,_25,_26){
with(_24){
_automaticallyRearrangesObjects=_26;
}
}),new objj_method(sel_getUid("setContent:"),function(_27,_28,_29){
with(_27){
if(_disableSetContent){
return;
}
if(_29===nil){
_29=[];
}
if(!objj_msgSend(_29,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
_29=[_29];
}
var _2a=nil,_2b=nil;
if(objj_msgSend(_27,"preservesSelection")){
_2a=objj_msgSend(_27,"selectedObjects");
}else{
_2b=objj_msgSend(_27,"selectionIndexes");
}
if(_clearsFilterPredicateOnInsertion){
objj_msgSend(_27,"willChangeValueForKey:","filterPredicate");
}
_contentObject=_29;
if(_clearsFilterPredicateOnInsertion&&_filterPredicate!=nil){
objj_msgSend(_27,"__setFilterPredicate:",nil);
}else{
objj_msgSend(_27,"_rearrangeObjects");
}
if(objj_msgSend(_27,"preservesSelection")){
objj_msgSend(_27,"__setSelectedObjects:",_2a);
}else{
objj_msgSend(_27,"__setSelectionIndexes:",_2b);
}
if(_clearsFilterPredicateOnInsertion){
objj_msgSend(_27,"didChangeValueForKey:","filterPredicate");
}
}
}),new objj_method(sel_getUid("_setContentArray:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_2c,"setContent:",_2e);
}
}),new objj_method(sel_getUid("_setContentSet:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(_2f,"setContent:",objj_msgSend(_31,"allObjects"));
}
}),new objj_method(sel_getUid("contentArray"),function(_32,_33){
with(_32){
return objj_msgSend(_32,"content");
}
}),new objj_method(sel_getUid("contentSet"),function(_34,_35){
with(_34){
return objj_msgSend(CPSet,"setWithArray:",objj_msgSend(_34,"content"));
}
}),new objj_method(sel_getUid("arrangeObjects:"),function(_36,_37,_38){
with(_36){
var _39=objj_msgSend(_36,"filterPredicate"),_3a=objj_msgSend(_36,"sortDescriptors");
if(_39&&objj_msgSend(_3a,"count")>0){
var _3b=objj_msgSend(_38,"filteredArrayUsingPredicate:",_39);
objj_msgSend(_3b,"sortUsingDescriptors:",_3a);
return _3b;
}else{
if(_39){
return objj_msgSend(_38,"filteredArrayUsingPredicate:",_39);
}else{
if(objj_msgSend(_3a,"count")>0){
return objj_msgSend(_38,"sortedArrayUsingDescriptors:",_3a);
}
}
}
return objj_msgSend(_38,"copy");
}
}),new objj_method(sel_getUid("rearrangeObjects"),function(_3c,_3d){
with(_3c){
objj_msgSend(_3c,"willChangeValueForKey:","arrangedObjects");
objj_msgSend(_3c,"_rearrangeObjects");
objj_msgSend(_3c,"didChangeValueForKey:","arrangedObjects");
}
}),new objj_method(sel_getUid("_rearrangeObjects"),function(_3e,_3f){
with(_3e){
var _40=nil,_41=nil;
if(objj_msgSend(_3e,"preservesSelection")){
_40=objj_msgSend(_3e,"selectedObjects");
}else{
_41=objj_msgSend(_3e,"selectionIndexes");
}
objj_msgSend(_3e,"__setArrangedObjects:",objj_msgSend(_3e,"arrangeObjects:",objj_msgSend(_3e,"contentArray")));
if(objj_msgSend(_3e,"preservesSelection")){
objj_msgSend(_3e,"__setSelectedObjects:",_40);
}else{
objj_msgSend(_3e,"__setSelectionIndexes:",_41);
}
}
}),new objj_method(sel_getUid("__setArrangedObjects:"),function(_42,_43,_44){
with(_42){
if(_arrangedObjects===_44){
return;
}
_arrangedObjects=objj_msgSend(objj_msgSend(_CPObservableArray,"alloc"),"initWithArray:",_44);
}
}),new objj_method(sel_getUid("arrangedObjects"),function(_45,_46){
with(_45){
return _arrangedObjects;
}
}),new objj_method(sel_getUid("sortDescriptors"),function(_47,_48){
with(_47){
return _sortDescriptors;
}
}),new objj_method(sel_getUid("setSortDescriptors:"),function(_49,_4a,_4b){
with(_49){
if(_sortDescriptors===_4b){
return;
}
_sortDescriptors=objj_msgSend(_4b,"copy");
objj_msgSend(_49,"_rearrangeObjects");
}
}),new objj_method(sel_getUid("filterPredicate"),function(_4c,_4d){
with(_4c){
return _filterPredicate;
}
}),new objj_method(sel_getUid("setFilterPredicate:"),function(_4e,_4f,_50){
with(_4e){
if(_filterPredicate===_50){
return;
}
objj_msgSend(_4e,"willChangeValueForKey:","arrangedObjects");
objj_msgSend(_4e,"__setFilterPredicate:",_50);
objj_msgSend(_4e,"didChangeValueForKey:","arrangedObjects");
}
}),new objj_method(sel_getUid("__setFilterPredicate:"),function(_51,_52,_53){
with(_51){
if(_filterPredicate===_53){
return;
}
_filterPredicate=_53;
objj_msgSend(_51,"_rearrangeObjects");
}
}),new objj_method(sel_getUid("alwaysUsesMultipleValuesMarker"),function(_54,_55){
with(_54){
return _alwaysUsesMultipleValuesMarker;
}
}),new objj_method(sel_getUid("selectionIndex"),function(_56,_57){
with(_56){
return objj_msgSend(_selectionIndexes,"firstIndex");
}
}),new objj_method(sel_getUid("setSelectionIndex:"),function(_58,_59,_5a){
with(_58){
return objj_msgSend(_58,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5a));
}
}),new objj_method(sel_getUid("selectionIndexes"),function(_5b,_5c){
with(_5b){
return _selectionIndexes;
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_5d,"_selectionWillChange");
var r=objj_msgSend(_5d,"__setSelectionIndexes:avoidEmpty:",_5f,NO);
objj_msgSend(_5d,"_selectionDidChange");
return r;
}
}),new objj_method(sel_getUid("__setSelectionIndex:"),function(_60,_61,_62){
with(_60){
return objj_msgSend(_60,"__setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_62));
}
}),new objj_method(sel_getUid("__setSelectionIndexes:"),function(_63,_64,_65){
with(_63){
return objj_msgSend(_63,"__setSelectionIndexes:avoidEmpty:",_65,_avoidsEmptySelection);
}
}),new objj_method(sel_getUid("__setSelectionIndexes:avoidEmpty:"),function(_66,_67,_68,_69){
with(_66){
var _6a=_68;
if(!_6a){
_6a=objj_msgSend(CPIndexSet,"indexSet");
}
if(!objj_msgSend(_6a,"count")){
if(_69&&objj_msgSend(objj_msgSend(_66,"arrangedObjects"),"count")){
_6a=objj_msgSend(CPIndexSet,"indexSetWithIndex:",0);
}
}else{
var _6b=objj_msgSend(objj_msgSend(_66,"arrangedObjects"),"count");
_6a=objj_msgSend(_6a,"copy");
objj_msgSend(_6a,"removeIndexesInRange:",CPMakeRange(_6b,objj_msgSend(_6a,"lastIndex")+1));
if(!objj_msgSend(_6a,"count")&&_69&&_6b){
_6a=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_6b-1);
}
}
if(objj_msgSend(_selectionIndexes,"isEqualToIndexSet:",_6a)){
return NO;
}
_selectionIndexes=_68===_6a?objj_msgSend(_68,"copy"):_6a;
var _6c=objj_msgSend(objj_msgSend(_66,"class"),"_binderClassForBinding:","selectionIndexes");
objj_msgSend(objj_msgSend(_6c,"getBinding:forObject:","selectionIndexes",_66),"reverseSetValueFor:","selectionIndexes");
return YES;
}
}),new objj_method(sel_getUid("selectedObjects"),function(_6d,_6e){
with(_6d){
var _6f=objj_msgSend(objj_msgSend(_6d,"arrangedObjects"),"objectsAtIndexes:",objj_msgSend(_6d,"selectionIndexes"));
return objj_msgSend(_CPObservableArray,"arrayWithArray:",(_6f||[]));
}
}),new objj_method(sel_getUid("setSelectedObjects:"),function(_70,_71,_72){
with(_70){
objj_msgSend(_70,"willChangeValueForKey:","selectionIndexes");
objj_msgSend(_70,"_selectionWillChange");
var r=objj_msgSend(_70,"__setSelectedObjects:avoidEmpty:",_72,NO);
objj_msgSend(_70,"didChangeValueForKey:","selectionIndexes");
objj_msgSend(_70,"_selectionDidChange");
return r;
}
}),new objj_method(sel_getUid("__setSelectedObjects:"),function(_73,_74,_75){
with(_73){
objj_msgSend(_73,"__setSelectedObjects:avoidEmpty:",_75,_avoidsEmptySelection);
}
}),new objj_method(sel_getUid("__setSelectedObjects:avoidEmpty:"),function(_76,_77,_78,_79){
with(_76){
var set=objj_msgSend(CPIndexSet,"indexSet"),_7a=objj_msgSend(_78,"count"),_7b=objj_msgSend(_76,"arrangedObjects");
for(var i=0;i<_7a;i++){
var _7c=objj_msgSend(_7b,"indexOfObject:",objj_msgSend(_78,"objectAtIndex:",i));
if(_7c!==CPNotFound){
objj_msgSend(set,"addIndex:",_7c);
}
}
objj_msgSend(_76,"__setSelectionIndexes:avoidEmpty:",set,_79);
return YES;
}
}),new objj_method(sel_getUid("canSelectPrevious"),function(_7d,_7e){
with(_7d){
return objj_msgSend(objj_msgSend(_7d,"selectionIndexes"),"firstIndex")>0;
}
}),new objj_method(sel_getUid("selectPrevious:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(objj_msgSend(_7f,"selectionIndexes"),"firstIndex")-1;
if(_82>=0){
objj_msgSend(_7f,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_82));
}
}
}),new objj_method(sel_getUid("canSelectNext"),function(_83,_84){
with(_83){
return objj_msgSend(objj_msgSend(_83,"selectionIndexes"),"firstIndex")<objj_msgSend(objj_msgSend(_83,"arrangedObjects"),"count")-1;
}
}),new objj_method(sel_getUid("selectNext:"),function(_85,_86,_87){
with(_85){
var _88=objj_msgSend(objj_msgSend(_85,"selectionIndexes"),"firstIndex")+1;
if(_88<objj_msgSend(objj_msgSend(_85,"arrangedObjects"),"count")){
objj_msgSend(_85,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_88));
}
}
}),new objj_method(sel_getUid("addObject:"),function(_89,_8a,_8b){
with(_89){
if(!objj_msgSend(_89,"canAdd")){
return;
}
var _8c=NO;
if(_clearsFilterPredicateOnInsertion&&_filterPredicate){
objj_msgSend(_89,"willChangeValueForKey:","filterPredicate");
_8c=YES;
}
objj_msgSend(_89,"willChangeValueForKey:","content");
_disableSetContent=YES;
objj_msgSend(_contentObject,"addObject:",_8b);
objj_msgSend(objj_msgSend(CPBinder,"getBinding:forObject:","contentArray",_89),"_contentArrayDidChange");
_disableSetContent=NO;
if(_8c){
_filterPredicate=nil;
objj_msgSend(_89,"_rearrangeObjects");
}else{
if(_filterPredicate===nil||objj_msgSend(_filterPredicate,"evaluateWithObject:",_8b)){
var pos=objj_msgSend(_arrangedObjects,"insertObject:inArraySortedByDescriptors:",_8b,_sortDescriptors);
if(_selectsInsertedObjects){
objj_msgSend(_89,"__setSelectionIndex:",pos);
}else{
objj_msgSend(_selectionIndexes,"shiftIndexesStartingAtIndex:by:",pos,1);
}
}
}
objj_msgSend(_89,"didChangeValueForKey:","content");
if(_8c){
objj_msgSend(_89,"didChangeValueForKey:","filterPredicate");
}
}
}),new objj_method(sel_getUid("insertObject:atArrangedObjectIndex:"),function(_8d,_8e,_8f,_90){
with(_8d){
if(!objj_msgSend(_8d,"canAdd")){
return;
}
var _91=NO;
if(_clearsFilterPredicateOnInsertion&&_filterPredicate){
objj_msgSend(_8d,"willChangeValueForKey:","filterPredicate");
_91=YES;
}
objj_msgSend(_8d,"willChangeValueForKey:","content");
_disableSetContent=YES;
objj_msgSend(_contentObject,"addObject:",_8f);
objj_msgSend(objj_msgSend(CPBinder,"getBinding:forObject:","contentArray",_8d),"_contentArrayDidChange");
_disableSetContent=NO;
if(_91){
objj_msgSend(_8d,"__setFilterPredicate:",nil);
}
objj_msgSend(objj_msgSend(_8d,"arrangedObjects"),"insertObject:atIndex:",_8f,_90);
if(objj_msgSend(_8d,"selectsInsertedObjects")){
objj_msgSend(_8d,"__setSelectionIndex:",_90);
}else{
objj_msgSend(objj_msgSend(_8d,"selectionIndexes"),"shiftIndexesStartingAtIndex:by:",_90,1);
}
if(objj_msgSend(_8d,"avoidsEmptySelection")&&objj_msgSend(objj_msgSend(_8d,"selectionIndexes"),"count")<=0&&objj_msgSend(_contentObject,"count")>0){
objj_msgSend(_8d,"__setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",0));
}
objj_msgSend(_8d,"didChangeValueForKey:","content");
if(_91){
objj_msgSend(_8d,"didChangeValueForKey:","filterPredicate");
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_92,_93,_94){
with(_92){
objj_msgSend(_92,"willChangeValueForKey:","content");
_disableSetContent=YES;
objj_msgSend(_contentObject,"removeObject:",_94);
objj_msgSend(objj_msgSend(CPBinder,"getBinding:forObject:","contentArray",_92),"_contentArrayDidChange");
_disableSetContent=NO;
if(_filterPredicate===nil||objj_msgSend(_filterPredicate,"evaluateWithObject:",_94)){
var pos=objj_msgSend(_arrangedObjects,"indexOfObject:",_94);
objj_msgSend(_arrangedObjects,"removeObjectAtIndex:",pos);
objj_msgSend(_selectionIndexes,"shiftIndexesStartingAtIndex:by:",pos,-1);
objj_msgSend(_92,"__setSelectionIndexes:",_selectionIndexes);
}
objj_msgSend(_92,"didChangeValueForKey:","content");
}
}),new objj_method(sel_getUid("add:"),function(_95,_96,_97){
with(_95){
if(!objj_msgSend(_95,"canAdd")){
return;
}
objj_msgSend(_95,"insert:",_97);
}
}),new objj_method(sel_getUid("insert:"),function(_98,_99,_9a){
with(_98){
if(!objj_msgSend(_98,"canInsert")){
return;
}
var _9b=objj_msgSend(_98,"automaticallyPreparesContent")?objj_msgSend(_98,"newObject"):objj_msgSend(_98,"_defaultNewObject");
objj_msgSend(_98,"addObject:",_9b);
}
}),new objj_method(sel_getUid("remove:"),function(_9c,_9d,_9e){
with(_9c){
objj_msgSend(_9c,"removeObjectsAtArrangedObjectIndexes:",_selectionIndexes);
}
}),new objj_method(sel_getUid("removeObjectAtArrangedObjectIndex:"),function(_9f,_a0,_a1){
with(_9f){
objj_msgSend(_9f,"removeObjectsAtArrangedObjectIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_a1));
}
}),new objj_method(sel_getUid("removeObjectsAtArrangedObjectIndexes:"),function(_a2,_a3,_a4){
with(_a2){
objj_msgSend(_a2,"willChangeValueForKey:","content");
_disableSetContent=YES;
var _a5=objj_msgSend(_a2,"arrangedObjects"),_a6=CPNotFound,_a7=objj_msgSend(_selectionIndexes,"copy");
objj_msgSend(_a4,"enumerateIndexesWithOptions:usingBlock:",CPEnumerationReverse,function(_a8){
var _a9=objj_msgSend(_a5,"objectAtIndex:",_a8);
if(objj_msgSend(_contentObject,"objectAtIndex:",_a8)===_a9){
objj_msgSend(_contentObject,"removeObjectAtIndex:",_a8);
}else{
contentIndex=objj_msgSend(_contentObject,"indexOfObjectIdenticalTo:",_a9);
objj_msgSend(_contentObject,"removeObjectAtIndex:",contentIndex);
}
objj_msgSend(_a5,"removeObjectAtIndex:",_a8);
if(!_avoidsEmptySelection||objj_msgSend(_a7,"count")>1){
objj_msgSend(_a7,"removeIndex:",_a8);
objj_msgSend(_a7,"shiftIndexesStartingAtIndex:by:",_a8,-1);
}else{
if(objj_msgSend(_a7,"lastIndex")!==_a8){
objj_msgSend(_a7,"shiftIndexesStartingAtIndex:by:",_a8,-1);
}
}
});
objj_msgSend(objj_msgSend(CPBinder,"getBinding:forObject:","contentArray",_a2),"_contentArrayDidChange");
_disableSetContent=NO;
objj_msgSend(_a2,"__setSelectionIndexes:",_a7);
objj_msgSend(_a2,"didChangeValueForKey:","content");
}
}),new objj_method(sel_getUid("addObjects:"),function(_aa,_ab,_ac){
with(_aa){
if(!objj_msgSend(_aa,"canAdd")){
return;
}
var _ad=objj_msgSend(_aa,"contentArray"),_ae=objj_msgSend(_ac,"count");
for(var i=0;i<_ae;i++){
objj_msgSend(_ad,"addObject:",objj_msgSend(_ac,"objectAtIndex:",i));
}
objj_msgSend(_aa,"setContent:",_ad);
objj_msgSend(objj_msgSend(CPBinder,"getBinding:forObject:","contentArray",_aa),"_contentArrayDidChange");
}
}),new objj_method(sel_getUid("removeObjects:"),function(_af,_b0,_b1){
with(_af){
objj_msgSend(_af,"_removeObjects:",_b1);
}
}),new objj_method(sel_getUid("_removeObjects:"),function(_b2,_b3,_b4){
with(_b2){
objj_msgSend(_b2,"willChangeValueForKey:","content");
_disableSetContent=YES;
objj_msgSend(_contentObject,"removeObjectsInArray:",_b4);
objj_msgSend(objj_msgSend(CPBinder,"getBinding:forObject:","contentArray",_b2),"_contentArrayDidChange");
_disableSetContent=NO;
var _b5=objj_msgSend(_b2,"arrangedObjects"),_b6=objj_msgSend(_b5,"indexOfObject:",objj_msgSend(_b4,"objectAtIndex:",0));
objj_msgSend(_b5,"removeObjectsInArray:",_b4);
var _b7=objj_msgSend(_b5,"count"),_b8=objj_msgSend(CPIndexSet,"indexSet");
if(objj_msgSend(_b2,"preservesSelection")||objj_msgSend(_b2,"avoidsEmptySelection")){
_b8=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_b6);
if(_b7<=0){
_b8=objj_msgSend(CPIndexSet,"indexSet");
}else{
if(_b6>=_b7){
_b8=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_b7-1);
}
}
}
_selectionIndexes=_b8;
objj_msgSend(_b2,"didChangeValueForKey:","content");
}
}),new objj_method(sel_getUid("canInsert"),function(_b9,_ba){
with(_b9){
return objj_msgSend(_b9,"isEditable");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_bb,_bc){
with(_bb){
if(_bb!==objj_msgSend(CPArrayController,"class")){
return;
}
objj_msgSend(_bb,"exposeBinding:","contentArray");
objj_msgSend(_bb,"exposeBinding:","contentSet");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingContentArray"),function(_bd,_be){
with(_bd){
return objj_msgSend(CPSet,"setWithObjects:","content");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingArrangedObjects"),function(_bf,_c0){
with(_bf){
return objj_msgSend(CPSet,"setWithObjects:","content","sortDescriptors");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSelection"),function(_c1,_c2){
with(_c1){
return objj_msgSend(CPSet,"setWithObjects:","selectionIndexes");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSelectionIndex"),function(_c3,_c4){
with(_c3){
return objj_msgSend(CPSet,"setWithObjects:","selectionIndexes");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSelectionIndexes"),function(_c5,_c6){
with(_c5){
return objj_msgSend(CPSet,"setWithObjects:","arrangedObjects");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSelectedObjects"),function(_c7,_c8){
with(_c7){
return objj_msgSend(CPSet,"setWithObjects:","selectionIndexes");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingCanRemove"),function(_c9,_ca){
with(_c9){
return objj_msgSend(CPSet,"setWithObjects:","selectionIndexes");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingCanSelectNext"),function(_cb,_cc){
with(_cb){
return objj_msgSend(CPSet,"setWithObjects:","selectionIndexes");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingCanSelectPrevious"),function(_cd,_ce){
with(_cd){
return objj_msgSend(CPSet,"setWithObjects:","selectionIndexes");
}
})]);
var _1=objj_getClass("CPArrayController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArrayController\"");
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("_binderClassForBinding:"),function(_cf,_d0,_d1){
with(_cf){
if(_d1=="contentArray"){
return objj_msgSend(_CPArrayControllerContentBinder,"class");
}
return objj_msgSendSuper({receiver:_cf,super_class:objj_getMetaClass("CPArrayController").super_class},"_binderClassForBinding:",_d1);
}
})]);
var _1=objj_allocateClassPair(CPBinder,"_CPArrayControllerContentBinder"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setValueFor:"),function(_d2,_d3,_d4){
with(_d2){
var _d5=objj_msgSend(_info,"objectForKey:",CPObservedObjectKey),_d6=objj_msgSend(_info,"objectForKey:",CPObservedKeyPathKey),_d7=objj_msgSend(_info,"objectForKey:",CPOptionsKey),_d8=objj_msgSend(_d2,"handlesContentAsCompoundValue"),_d9=_d6.lastIndexOf("."),_da=_d9!==CPNotFound?_d6.substring(0,_d9):nil,_db=_da&&objj_msgSend(objj_msgSend(_d5,"valueForKeyPath:",_da),"isKindOfClass:",CPControllerSelectionProxy);
if(!_d8&&!_db){
newValue=objj_msgSend(_d5,"mutableArrayValueForKeyPath:",_d6);
}else{
newValue=objj_msgSend(_d5,"valueForKeyPath:",_d6);
}
var _dc=CPIsControllerMarker(newValue);
if(_dc){
if(newValue===CPNotApplicableMarker&&objj_msgSend(_d7,"objectForKey:",CPRaisesForNotApplicableKeysBindingOption)){
objj_msgSend(CPException,"raise:reason:",CPGenericException,"can't transform non applicable key on: "+_source+" value: "+newValue);
}
newValue=objj_msgSend(_d2,"_placeholderForMarker:",newValue);
if(!newValue){
newValue=objj_msgSend(CPMutableArray,"array");
}
}else{
newValue=objj_msgSend(_d2,"transformValue:withOptions:",newValue,_d7);
}
if(_d8){
newValue=objj_msgSend(newValue,"mutableCopy");
}
objj_msgSend(_source,"setValue:forKey:",newValue,_d4);
}
}),new objj_method(sel_getUid("_contentArrayDidChange"),function(_dd,_de){
with(_dd){
if(objj_msgSend(_dd,"handlesContentAsCompoundValue")){
var _df=objj_msgSend(_info,"objectForKey:",CPObservedObjectKey),_e0=objj_msgSend(_info,"objectForKey:",CPObservedKeyPathKey);
objj_msgSend(_dd,"suppressSpecificNotificationFromObject:keyPath:",_df,_e0);
objj_msgSend(_dd,"reverseSetValueFor:","contentArray");
objj_msgSend(_dd,"unsuppressSpecificNotificationFromObject:keyPath:",_df,_e0);
}
}
})]);
var _e1="CPArrayControllerAvoidsEmptySelection",_e2="CPArrayControllerClearsFilterPredicateOnInsertion",_e3="CPArrayControllerFilterRestrictsInsertion",_e4="CPArrayControllerPreservesSelection",_e5="CPArrayControllerSelectsInsertedObjects",_e6="CPArrayControllerAlwaysUsesMultipleValuesMarker",_e7="CPArrayControllerAutomaticallyRearrangesObjects";
var _1=objj_getClass("CPArrayController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArrayController\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_e8,_e9,_ea){
with(_e8){
_e8=objj_msgSendSuper({receiver:_e8,super_class:objj_getClass("CPArrayController").super_class},"initWithCoder:",_ea);
if(_e8){
_avoidsEmptySelection=objj_msgSend(_ea,"decodeBoolForKey:",_e1);
_clearsFilterPredicateOnInsertion=objj_msgSend(_ea,"decodeBoolForKey:",_e2);
_filterRestrictsInsertion=objj_msgSend(_ea,"decodeBoolForKey:",_e3);
_preservesSelection=objj_msgSend(_ea,"decodeBoolForKey:",_e4);
_selectsInsertedObjects=objj_msgSend(_ea,"decodeBoolForKey:",_e5);
_alwaysUsesMultipleValuesMarker=objj_msgSend(_ea,"decodeBoolForKey:",_e6);
_automaticallyRearrangesObjects=objj_msgSend(_ea,"decodeBoolForKey:",_e7);
_sortDescriptors=objj_msgSend(CPArray,"array");
if(!objj_msgSend(_e8,"content")&&objj_msgSend(_e8,"automaticallyPreparesContent")){
objj_msgSend(_e8,"prepareContent");
}else{
if(!objj_msgSend(_e8,"content")){
objj_msgSend(_e8,"_setContentArray:",[]);
}
}
}
return _e8;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_eb,_ec,_ed){
with(_eb){
objj_msgSendSuper({receiver:_eb,super_class:objj_getClass("CPArrayController").super_class},"encodeWithCoder:",_ed);
objj_msgSend(_ed,"encodeBool:forKey:",_avoidsEmptySelection,_e1);
objj_msgSend(_ed,"encodeBool:forKey:",_clearsFilterPredicateOnInsertion,_e2);
objj_msgSend(_ed,"encodeBool:forKey:",_filterRestrictsInsertion,_e3);
objj_msgSend(_ed,"encodeBool:forKey:",_preservesSelection,_e4);
objj_msgSend(_ed,"encodeBool:forKey:",_selectsInsertedObjects,_e5);
objj_msgSend(_ed,"encodeBool:forKey:",_alwaysUsesMultipleValuesMarker,_e6);
objj_msgSend(_ed,"encodeBool:forKey:",_automaticallyRearrangesObjects,_e7);
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_ee,_ef){
with(_ee){
objj_msgSend(_ee,"_selectionWillChange");
objj_msgSend(_ee,"_selectionDidChange");
}
})]);
