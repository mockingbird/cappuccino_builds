@STATIC;1.0;I;20;AppKit/CPTextField.jI;24;AppKit/CPViewAnimation.jI;15;AppKit/CPView.jI;24;Foundation/CPPredicate.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;23;Foundation/CPIndexSet.ji;27;_CPRuleEditorViewSliceRow.ji;24;_CPRuleEditorLocalizer.jt;67234;
objj_executeFile("AppKit/CPTextField.j",NO);
objj_executeFile("AppKit/CPViewAnimation.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("Foundation/CPPredicate.j",NO);
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPIndexSet.j",NO);
objj_executeFile("_CPRuleEditorViewSliceRow.j",YES);
objj_executeFile("_CPRuleEditorLocalizer.j",YES);
CPRuleEditorPredicateLeftExpression="CPRuleEditorPredicateLeftExpression";
CPRuleEditorPredicateRightExpression="CPRuleEditorPredicateRightExpression";
CPRuleEditorPredicateComparisonModifier="CPRuleEditorPredicateComparisonModifier";
CPRuleEditorPredicateOptions="CPRuleEditorPredicateOptions";
CPRuleEditorPredicateOperatorType="CPRuleEditorPredicateOperatorType";
CPRuleEditorPredicateCustomSelector="CPRuleEditorPredicateCustomSelector";
CPRuleEditorPredicateCompoundType="CPRuleEditorPredicateCompoundType";
CPRuleEditorRowsDidChangeNotification="CPRuleEditorRowsDidChangeNotification";
CPRuleEditorRulesDidChangeNotification="CPRuleEditorRulesDidChangeNotification";
CPRuleEditorNestingModeSingle=0;
CPRuleEditorNestingModeList=1;
CPRuleEditorNestingModeCompound=2;
CPRuleEditorNestingModeSimple=3;
CPRuleEditorRowTypeSimple=0;
CPRuleEditorRowTypeCompound=1;
var _1="CPRuleEditorItemPBoardType",_2="items",_3="values",_4="subrows_array",_5="bound_array";
var _6=objj_allocateClassPair(CPControl,"CPRuleEditor"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_suppressKeyDownHandling"),new objj_ivar("_allowsEmptyCompoundRows"),new objj_ivar("_disallowEmpty"),new objj_ivar("_delegateWantsValidation"),new objj_ivar("_editable"),new objj_ivar("_sendAction"),new objj_ivar("_rowClass"),new objj_ivar("_draggingRows"),new objj_ivar("_subviewIndexOfDropLine"),new objj_ivar("_dropLineView"),new objj_ivar("_rowCache"),new objj_ivar("_slices"),new objj_ivar("_predicate"),new objj_ivar("_itemsKeyPath"),new objj_ivar("_subrowsArrayKeyPath"),new objj_ivar("_typeKeyPath"),new objj_ivar("_valuesKeyPath"),new objj_ivar("_boundArrayKeyPath"),new objj_ivar("_slicesHolder"),new objj_ivar("_currentAnimation"),new objj_ivar("_lastRow"),new objj_ivar("_nestingMode"),new objj_ivar("_alignmentGridWidth"),new objj_ivar("_sliceHeight"),new objj_ivar("_ruleDataSource"),new objj_ivar("_ruleDelegate"),new objj_ivar("_boundArrayOwner"),new objj_ivar("_stringsFilename"),new objj_ivar("_isKeyDown"),new objj_ivar("_nestingModeDidChange"),new objj_ivar("_standardLocalizer"),new objj_ivar("_itemsAndValuesToAddForRowType")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("boundArrayKeyPath"),function(_8,_9){
with(_8){
return _boundArrayKeyPath;
}
}),new objj_method(sel_getUid("setBoundArrayKeyPath:"),function(_a,_b,_c){
with(_a){
_boundArrayKeyPath=_c;
}
}),new objj_method(sel_getUid("standardLocalizer"),function(_d,_e){
with(_d){
return _standardLocalizer;
}
}),new objj_method(sel_getUid("setStandardLocalizer:"),function(_f,_10,_11){
with(_f){
_standardLocalizer=_11;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_12,_13,_14){
with(_12){
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPRuleEditor").super_class},"initWithFrame:",_14);
if(_12!==nil){
_slices=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
_sliceHeight=26;
_nestingMode=CPRuleEditorNestingModeSimple;
_editable=YES;
_allowsEmptyCompoundRows=NO;
_disallowEmpty=NO;
objj_msgSend(_12,"setFormattingStringsFilename:",nil);
objj_msgSend(_12,"setCriteriaKeyPath:","criteria");
objj_msgSend(_12,"setSubrowsKeyPath:","subrows");
objj_msgSend(_12,"setRowTypeKeyPath:","rowType");
objj_msgSend(_12,"setDisplayValuesKeyPath:","displayValues");
objj_msgSend(_12,"setBoundArrayKeyPath:","boundArray");
_slicesHolder=objj_msgSend(objj_msgSend(_CPRuleEditorViewSliceHolder,"alloc"),"initWithFrame:",objj_msgSend(_12,"bounds"));
objj_msgSend(_12,"addSubview:",_slicesHolder);
_boundArrayOwner=objj_msgSend(objj_msgSend(_CPRuleEditorViewUnboundRowHolder,"alloc"),"init");
objj_msgSend(_12,"_initRuleEditorShared");
}
return _12;
}
}),new objj_method(sel_getUid("_initRuleEditorShared"),function(_15,_16){
with(_15){
_rowCache=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
_rowClass=objj_msgSend(_CPRuleEditorRowObject,"class");
_isKeyDown=NO;
_subviewIndexOfDropLine=CPNotFound;
_lastRow=0;
_delegateWantsValidation=YES;
_suppressKeyDownHandling=NO;
_nestingModeDidChange=NO;
_sendAction=YES;
_itemsAndValuesToAddForRowType={};
var _17=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithDuration:animationCurve:",0.5,CPAnimationEaseInOut);
objj_msgSend(_15,"setAnimation:",_17);
objj_msgSend(_slicesHolder,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_dropLineView=objj_msgSend(_15,"_createSliceDropSeparator");
objj_msgSend(_slicesHolder,"addSubview:",_dropLineView);
objj_msgSend(_15,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",_1,nil));
objj_msgSend(_boundArrayOwner,"addObserver:forKeyPath:options:context:",_15,_boundArrayKeyPath,CPKeyValueObservingOptionOld|CPKeyValueObservingOptionNew,_5);
}
}),new objj_method(sel_getUid("delegate"),function(_18,_19){
with(_18){
return _ruleDelegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_1a,_1b,_1c){
with(_1a){
if(_ruleDelegate===_1c){
return;
}
var nc=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_ruleDelegate){
objj_msgSend(nc,"removeObserver:name:object:",_ruleDelegate,nil,_1a);
}
_ruleDelegate=_1c;
if(objj_msgSend(_ruleDelegate,"respondsToSelector:",sel_getUid("ruleEditorRowsDidChange:"))){
objj_msgSend(nc,"addObserver:selector:name:object:",_ruleDelegate,sel_getUid("ruleEditorRowsDidChange:"),CPRuleEditorRowsDidChangeNotification,nil);
}
}
}),new objj_method(sel_getUid("isEditable"),function(_1d,_1e){
with(_1d){
return _editable;
}
}),new objj_method(sel_getUid("setEditable:"),function(_1f,_20,_21){
with(_1f){
if(_21===_editable){
return;
}
_editable=_21;
if(!_editable){
objj_msgSend(_1f,"_deselectAll");
}
objj_msgSend(_slices,"makeObjectsPerformSelector:withObject:",sel_getUid("setEditable:"),_editable);
}
}),new objj_method(sel_getUid("nestingMode"),function(_22,_23){
with(_22){
return _nestingMode;
}
}),new objj_method(sel_getUid("setNestingMode:"),function(_24,_25,_26){
with(_24){
if(_26!==_nestingMode){
_nestingMode=_26;
if(objj_msgSend(_24,"numberOfRows")>0){
_nestingModeDidChange=YES;
}
}
}
}),new objj_method(sel_getUid("canRemoveAllRows"),function(_27,_28){
with(_27){
return !_disallowEmpty;
}
}),new objj_method(sel_getUid("setCanRemoveAllRows:"),function(_29,_2a,_2b){
with(_29){
_disallowEmpty=!_2b;
objj_msgSend(_29,"_updateButtonVisibilities");
}
}),new objj_method(sel_getUid("allowsEmptyCompoundRows"),function(_2c,_2d){
with(_2c){
return _allowsEmptyCompoundRows;
}
}),new objj_method(sel_getUid("setAllowsEmptyCompoundRows:"),function(_2e,_2f,_30){
with(_2e){
_allowsEmptyCompoundRows=_30;
objj_msgSend(_2e,"_updateButtonVisibilities");
}
}),new objj_method(sel_getUid("rowHeight"),function(_31,_32){
with(_31){
return _sliceHeight;
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_33,_34,_35){
with(_33){
if(_35===_sliceHeight){
return;
}
_sliceHeight=MAX(objj_msgSend(_33,"_minimumFrameHeight"),_35);
objj_msgSend(_33,"_reconfigureSubviewsAnimate:",NO);
}
}),new objj_method(sel_getUid("formattingDictionary"),function(_36,_37){
with(_36){
return objj_msgSend(_standardLocalizer,"dictionary");
}
}),new objj_method(sel_getUid("setFormattingDictionary:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(_standardLocalizer,"setDictionary:",_3a);
_stringsFilename=nil;
}
}),new objj_method(sel_getUid("formattingStringsFilename"),function(_3b,_3c){
with(_3b){
return _stringsFilename;
}
}),new objj_method(sel_getUid("setFormattingStringsFilename:"),function(_3d,_3e,_3f){
with(_3d){
if(_standardLocalizer===nil){
_standardLocalizer=objj_msgSend(_CPRuleEditorLocalizer,"new");
}
if(_stringsFilename!==_3f){
_stringsFilename=_3f||nil;
if(_3f!==nil){
if(!objj_msgSend(_3f,"hasSuffix:",".strings")){
_3f=_3f+".strings";
}
var _40=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_3f);
if(_40!==nil){
objj_msgSend(_standardLocalizer,"loadContentOfURL:",objj_msgSend(CPURL,"URLWithString:",_40));
}
}
}
}
}),new objj_method(sel_getUid("reloadCriteria"),function(_41,_42){
with(_41){
var _43=objj_msgSend(_boundArrayOwner,"valueForKey:",_boundArrayKeyPath);
objj_msgSend(_41,"_stopObservingRowObjectsRecursively:",_43);
objj_msgSend(_boundArrayOwner,"setValue:forKey:",objj_msgSend(CPArray,"arrayWithArray:",_43),_boundArrayKeyPath);
}
}),new objj_method(sel_getUid("setCriteria:andDisplayValues:forRowAtIndex:"),function(_44,_45,_46,_47,_48){
with(_44){
if(_46===nil||_47===nil){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_45+". criteria and values parameters must not be nil.");
}
if(_48<0||_48>=objj_msgSend(_44,"numberOfRows")){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_45+". rowIndex is out of bounds.");
}
var _49=objj_msgSend(objj_msgSend(_44,"_rowCacheForIndex:",_48),"rowObject");
objj_msgSend(_49,"setValue:forKey:",_46,_itemsKeyPath);
objj_msgSend(_49,"setValue:forKey:",_47,_valuesKeyPath);
objj_msgSend(_44,"reloadCriteria");
}
}),new objj_method(sel_getUid("criteriaForRow:"),function(_4a,_4b,row){
with(_4a){
var _4c=objj_msgSend(_4a,"_rowCacheForIndex:",row);
if(_4c){
return objj_msgSend(objj_msgSend(_4c,"rowObject"),"valueForKey:",_itemsKeyPath);
}
return nil;
}
}),new objj_method(sel_getUid("displayValuesForRow:"),function(_4d,_4e,row){
with(_4d){
var _4f=objj_msgSend(_4d,"_rowCacheForIndex:",row);
if(_4f){
return objj_msgSend(objj_msgSend(_4f,"rowObject"),"valueForKey:",_valuesKeyPath);
}
return nil;
}
}),new objj_method(sel_getUid("numberOfRows"),function(_50,_51){
with(_50){
return objj_msgSend(_slices,"count");
}
}),new objj_method(sel_getUid("parentRowForRow:"),function(_52,_53,_54){
with(_52){
if(_54<0||_54>=objj_msgSend(_52,"numberOfRows")){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_53+" row "+_54+" is out of range");
}
var _55=objj_msgSend(objj_msgSend(_52,"_rowCacheForIndex:",_54),"rowObject");
for(var _56=0;_56<_54;_56++){
if(objj_msgSend(_52,"rowTypeForRow:",_56)===CPRuleEditorRowTypeCompound){
var _57=objj_msgSend(objj_msgSend(_52,"_rowCacheForIndex:",_56),"rowObject"),_58=objj_msgSend(objj_msgSend(_52,"_subrowObjectsOfObject:",_57),"_representedObject");
if(objj_msgSend(_58,"indexOfObjectIdenticalTo:",_55)!==CPNotFound){
return _56;
}
}
}
return -1;
}
}),new objj_method(sel_getUid("rowTypeForRow:"),function(_59,_5a,_5b){
with(_59){
if(_5b<0||_5b>objj_msgSend(_59,"numberOfRows")){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_5a+"row "+_5b+" is out of range");
}
var _5c=objj_msgSend(_59,"_rowCacheForIndex:",_5b);
if(_5c){
var _5d=objj_msgSend(_5c,"rowObject");
return objj_msgSend(_5d,"valueForKey:",_typeKeyPath);
}
return CPNotFound;
}
}),new objj_method(sel_getUid("subrowIndexesForRow:"),function(_5e,_5f,_60){
with(_5e){
var _61;
if(_60===-1){
_61=_boundArrayOwner;
}else{
_61=objj_msgSend(objj_msgSend(_5e,"_rowCacheForIndex:",_60),"rowObject");
}
var _62=objj_msgSend(_5e,"_subrowObjectsOfObject:",_61),_63=objj_msgSend(_62,"count"),_64=objj_msgSend(CPMutableIndexSet,"indexSet"),_65=objj_msgSend(_5e,"numberOfRows");
for(var i=_60+1;i<_65;i++){
var _66=objj_msgSend(objj_msgSend(_5e,"_rowCacheForIndex:",i),"rowObject"),_67=objj_msgSend(objj_msgSend(_62,"_representedObject"),"indexOfObjectIdenticalTo:",_66);
if(_67!==CPNotFound){
objj_msgSend(_64,"addIndex:",i);
_63--;
if(objj_msgSend(_5e,"rowTypeForRow:",i)===CPRuleEditorRowTypeCompound){
i+=objj_msgSend(objj_msgSend(_5e,"subrowIndexesForRow:",i),"count");
}
}
if(_63===0){
break;
}
}
return _64;
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_68,_69){
with(_68){
return objj_msgSend(_68,"_selectedSliceIndices");
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_6a,_6b,_6c,_6d){
with(_6a){
var _6e=objj_msgSend(_slices,"count"),_6f=objj_msgSend(_6c,"lastIndex");
if(_6f>=objj_msgSend(_6a,"numberOfRows")){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"row indexes "+_6c+" are out of range");
}
if(!_6d){
objj_msgSend(_6a,"_deselectAll");
}
while(_6e--){
var _70=_slices[_6e],_71=objj_msgSend(_70,"rowIndex"),_72=objj_msgSend(_6c,"containsIndex:",_71),_73=(_72&&!(_6d&&objj_msgSend(_70,"_isSelected")));
if(_72){
objj_msgSend(_70,"_setSelected:",_73);
}
objj_msgSend(_70,"_setLastSelected:",(_71===_6f));
objj_msgSend(_70,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("addRow:"),function(_74,_75,_76){
with(_74){
var _77=-1,_78,_79=objj_msgSend(_74,"numberOfRows"),_7a=(_79>0),_7b=objj_msgSend(_74,"_applicableNestingMode");
switch(_7b){
case CPRuleEditorNestingModeSimple:
_78=_7a?CPRuleEditorRowTypeSimple:CPRuleEditorRowTypeCompound;
if(_7a){
_77=0;
}
break;
case CPRuleEditorNestingModeSingle:
if(_7a){
return;
}
case CPRuleEditorNestingModeList:
_78=CPRuleEditorRowTypeSimple;
break;
case CPRuleEditorNestingModeCompound:
_78=CPRuleEditorRowTypeCompound;
if(_7a){
_77=0;
}
break;
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Not supported CPRuleEditorNestingMode "+_7b);
}
objj_msgSend(_74,"insertRowAtIndex:withType:asSubrowOfRow:animate:",_79,_78,_77,YES);
}
}),new objj_method(sel_getUid("insertRowAtIndex:withType:asSubrowOfRow:animate:"),function(_7c,_7d,_7e,_7f,_80,_81){
with(_7c){
var _82=objj_msgSend(_7c,"_insertNewRowAtIndex:ofType:withParentRow:",_7e,_7f,_80);
if(_7f===CPRuleEditorRowTypeCompound&&!_allowsEmptyCompoundRows){
var _83=objj_msgSend(_7c,"_insertNewRowAtIndex:ofType:withParentRow:",(_7e+1),CPRuleEditorRowTypeSimple,_7e);
}
}
}),new objj_method(sel_getUid("removeRowAtIndex:"),function(_84,_85,_86){
with(_84){
if(_86<0||_86>=objj_msgSend(_84,"numberOfRows")){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"row "+_86+" is out of range");
}
objj_msgSend(_84,"removeRowsAtIndexes:includeSubrows:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_86),NO);
}
}),new objj_method(sel_getUid("removeRowsAtIndexes:includeSubrows:"),function(_87,_88,_89,_8a){
with(_87){
if(objj_msgSend(_89,"count")===0){
return;
}
if(objj_msgSend(_89,"lastIndex")>=objj_msgSend(_87,"numberOfRows")){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"rows indexes "+_89+" are out of range");
}
var _8b=objj_msgSend(_89,"firstIndex"),_8c=objj_msgSend(_87,"parentRowForRow:",_8b),_8d=objj_msgSend(CPMutableIndexSet,"indexSet"),_8e;
if(_8c===-1){
_8e=objj_msgSend(_87,"_rootRowsArray");
}else{
var _8f=objj_msgSend(objj_msgSend(_87,"_rowCacheForIndex:",_8c),"rowObject");
_8e=objj_msgSend(_87,"_subrowObjectsOfObject:",_8f);
}
while(_8b!==CPNotFound){
var _90=objj_msgSend(objj_msgSend(_87,"_rowCacheForIndex:",_8b),"rowObject"),_91=objj_msgSend(objj_msgSend(_8e,"_representedObject"),"indexOfObjectIdenticalTo:",_90);
if(_91!==CPNotFound){
objj_msgSend(_8d,"addIndex:",_91);
}
if(_8a&&objj_msgSend(_87,"rowTypeForRow:",_8b)===CPRuleEditorRowTypeCompound){
var _92=objj_msgSend(_87,"subrowIndexesForRow:",_8b);
objj_msgSend(_87,"removeRowsAtIndexes:includeSubrows:",_92,_8a);
}
_8b=objj_msgSend(_89,"indexGreaterThanIndex:",_8b);
}
objj_msgSend(_8e,"removeObjectsAtIndexes:",_8d);
}
}),new objj_method(sel_getUid("predicate"),function(_93,_94){
with(_93){
return _predicate;
}
}),new objj_method(sel_getUid("reloadPredicate"),function(_95,_96){
with(_95){
objj_msgSend(_95,"_updatePredicate");
}
}),new objj_method(sel_getUid("predicateForRow:"),function(_97,_98,_99){
with(_97){
var _9a=objj_msgSend(CPDictionary,"dictionary"),_9b=objj_msgSend(_97,"criteriaForRow:",_99),_9c=objj_msgSend(_9b,"count"),_9d,i;
for(i=0;i<_9c;i++){
var _9e=objj_msgSend(_9b,"objectAtIndex:",i),_9f=objj_msgSend(objj_msgSend(_97,"displayValuesForRow:",_99),"objectAtIndex:",i),_a0=objj_msgSend(_ruleDelegate,"ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:",_97,_9e,_9f,_99);
if(_a0){
objj_msgSend(_9a,"addEntriesFromDictionary:",_a0);
}
}
if(objj_msgSend(_97,"rowTypeForRow:",_99)===CPRuleEditorRowTypeCompound){
var _a1,_a2=objj_msgSend(CPMutableArray,"array"),_a3=objj_msgSend(_97,"subrowIndexesForRow:",_99);
if(objj_msgSend(_a3,"count")===0){
return nil;
}
var _a4=objj_msgSend(_a3,"firstIndex");
while(_a4!==CPNotFound){
var _a5=objj_msgSend(_97,"predicateForRow:",_a4);
if(_a5!==nil){
objj_msgSend(_a2,"addObject:",_a5);
}
_a4=objj_msgSend(_a3,"indexGreaterThanIndex:",_a4);
}
var _a6=objj_msgSend(_9a,"objectForKey:",CPRuleEditorPredicateCompoundType);
if(objj_msgSend(_a2,"count")===0){
return nil;
}else{
try{
_a1=objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",_a6,_a2);
}
catch(error){
CPLogConsole("Compound predicate error: [%@]\npredicateType:%i",objj_msgSend(error,"description"),_a6);
_a1=nil;
}
finally{
return _a1;
}
}
}
var lhs=objj_msgSend(_9a,"objectForKey:",CPRuleEditorPredicateLeftExpression),rhs=objj_msgSend(_9a,"objectForKey:",CPRuleEditorPredicateRightExpression),_a7=objj_msgSend(_9a,"objectForKey:",CPRuleEditorPredicateOperatorType),_a8=objj_msgSend(_9a,"objectForKey:",CPRuleEditorPredicateOptions),_a9=objj_msgSend(_9a,"objectForKey:",CPRuleEditorPredicateComparisonModifier),_aa=CPSelectorFromString(objj_msgSend(_9a,"objectForKey:",CPRuleEditorPredicateCustomSelector));
if(lhs===nil){
CPLogConsole("missing left expression in predicate parts dictionary");
return NULL;
}
if(rhs===nil){
CPLogConsole("missing right expression in predicate parts dictionary");
return NULL;
}
if(_aa===nil&&_a7===nil){
CPLogConsole("missing operator and selector in predicate parts dictionary");
return NULL;
}
if(_a9===nil){
CPLogConsole("missing modifier in predicate parts dictionary. Setting default: CPDirectPredicateModifier");
}
if(_a8===nil){
CPLogConsole("missing options in predicate parts dictionary. Setting default: CPCaseInsensitivePredicateOption");
}
try{
if(_aa!==nil){
_9d=objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:customSelector:",lhs,rhs,_aa);
}else{
_9d=objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",lhs,rhs,(_a9||CPDirectPredicateModifier),_a7,(_a8||CPCaseInsensitivePredicateOption));
}
}
catch(error){
CPLogConsole("Row predicate error: ["+objj_msgSend(error,"description")+"] for row "+_99);
_9d=nil;
}
finally{
return _9d;
}
}
}),new objj_method(sel_getUid("rowClass"),function(_ab,_ac){
with(_ab){
return _rowClass;
}
}),new objj_method(sel_getUid("setRowClass:"),function(_ad,_ae,_af){
with(_ad){
if(_af===objj_msgSend(CPMutableDictionary,"class")){
_af=objj_msgSend(_CPRuleEditorRowObject,"class");
}
_rowClass=_af;
}
}),new objj_method(sel_getUid("rowTypeKeyPath"),function(_b0,_b1){
with(_b0){
return _typeKeyPath;
}
}),new objj_method(sel_getUid("setRowTypeKeyPath:"),function(_b2,_b3,_b4){
with(_b2){
if(_typeKeyPath!==_b4){
_typeKeyPath=_b4;
}
}
}),new objj_method(sel_getUid("subrowsKeyPath"),function(_b5,_b6){
with(_b5){
return _subrowsArrayKeyPath;
}
}),new objj_method(sel_getUid("setSubrowsKeyPath:"),function(_b7,_b8,_b9){
with(_b7){
if(_subrowsArrayKeyPath!==_b9){
_subrowsArrayKeyPath=_b9;
}
}
}),new objj_method(sel_getUid("criteriaKeyPath"),function(_ba,_bb){
with(_ba){
return _itemsKeyPath;
}
}),new objj_method(sel_getUid("setCriteriaKeyPath:"),function(_bc,_bd,_be){
with(_bc){
if(_itemsKeyPath!==_be){
_itemsKeyPath=_be;
}
}
}),new objj_method(sel_getUid("displayValuesKeyPath"),function(_bf,_c0){
with(_bf){
return _valuesKeyPath;
}
}),new objj_method(sel_getUid("setDisplayValuesKeyPath:"),function(_c1,_c2,_c3){
with(_c1){
if(_valuesKeyPath!==_c3){
_valuesKeyPath=_c3;
}
}
}),new objj_method(sel_getUid("animation"),function(_c4,_c5){
with(_c4){
return _currentAnimation;
}
}),new objj_method(sel_getUid("setAnimation:"),function(_c6,_c7,_c8){
with(_c6){
_currentAnimation=_c8;
objj_msgSend(_currentAnimation,"setDelegate:",_c6);
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_c9,_ca){
with(_c9){
return YES;
}
}),new objj_method(sel_getUid("keyDown:"),function(_cb,_cc,_cd){
with(_cb){
if(!_suppressKeyDownHandling&&objj_msgSend(_cb,"_applicableNestingMode")===CPRuleEditorNestingModeCompound&&!_isKeyDown&&(objj_msgSend(_cd,"modifierFlags")&CPAlternateKeyMask)){
objj_msgSend(_slices,"makeObjectsPerformSelector:withObject:",sel_getUid("_configurePlusButtonByRowType:"),CPRuleEditorRowTypeCompound);
}
_isKeyDown=YES;
}
}),new objj_method(sel_getUid("keyUp:"),function(_ce,_cf,_d0){
with(_ce){
if(!_suppressKeyDownHandling){
objj_msgSend(_slices,"makeObjectsPerformSelector:withObject:",sel_getUid("_configurePlusButtonByRowType:"),CPRuleEditorRowTypeSimple);
}
_isKeyDown=NO;
}
}),new objj_method(sel_getUid("_createSliceDropSeparator"),function(_d1,_d2){
with(_d1){
var _d3=objj_msgSend(objj_msgSend(_CPRuleEditorViewSliceDropSeparator,"alloc"),"initWithFrame:",CGRectMake(0,-10,objj_msgSend(_d1,"frame").size.width,2));
objj_msgSend(_d3,"setAutoresizingMask:",CPViewWidthSizable);
return _d3;
}
}),new objj_method(sel_getUid("_suppressKeyDownHandling"),function(_d4,_d5){
with(_d4){
return _suppressKeyDownHandling;
}
}),new objj_method(sel_getUid("_wantsRowAnimations"),function(_d6,_d7){
with(_d6){
return (_currentAnimation!==nil);
}
}),new objj_method(sel_getUid("_updateButtonVisibilities"),function(_d8,_d9){
with(_d8){
objj_msgSend(_slices,"makeObjectsPerformSelector:",sel_getUid("_updateButtonVisibilities"));
}
}),new objj_method(sel_getUid("_alignmentGridWidth"),function(_da,_db){
with(_da){
return _alignmentGridWidth;
}
}),new objj_method(sel_getUid("_minimumFrameHeight"),function(_dc,_dd){
with(_dc){
return 26;
}
}),new objj_method(sel_getUid("_applicableNestingMode"),function(_de,_df){
with(_de){
if(!_nestingModeDidChange){
return _nestingMode;
}
var a=(_nestingMode===CPRuleEditorNestingModeCompound||_nestingMode===CPRuleEditorNestingModeSimple),b=(objj_msgSend(_de,"rowTypeForRow:",0)===CPRuleEditorRowTypeCompound);
if(a===b){
return _nestingMode;
}
return a?CPRuleEditorNestingModeList:CPRuleEditorNestingModeSimple;
}
}),new objj_method(sel_getUid("_shouldHideAddButtonForSlice:"),function(_e0,_e1,_e2){
with(_e0){
return (!_editable||objj_msgSend(_e0,"_applicableNestingMode")===CPRuleEditorNestingModeSingle);
}
}),new objj_method(sel_getUid("_shouldHideSubtractButtonForSlice:"),function(_e3,_e4,_e5){
with(_e3){
if(!_editable){
return YES;
}
if(!_disallowEmpty){
return NO;
}
var _e6,_e7=objj_msgSend(_e5,"rowIndex"),_e8=objj_msgSend(_e3,"parentRowForRow:",_e7),_e9=objj_msgSend(_e3,"subrowIndexesForRow:",_e8),_ea=objj_msgSend(_e3,"_applicableNestingMode");
switch(_ea){
case CPRuleEditorNestingModeCompound:
case CPRuleEditorNestingModeSimple:
_e6=(objj_msgSend(_e9,"count")===1&&!_allowsEmptyCompoundRows)||_e8===-1;
break;
case CPRuleEditorNestingModeList:
_e6=(objj_msgSend(_e3,"numberOfRows")===1);
break;
case CPRuleEditorNestingModeSingle:
_e6=YES;
break;
default:
_e6=NO;
}
return _e6;
}
}),new objj_method(sel_getUid("_rowCacheForIndex:"),function(_eb,_ec,_ed){
with(_eb){
return objj_msgSend(_rowCache,"objectAtIndex:",_ed);
}
}),new objj_method(sel_getUid("_searchCacheForRowObject:"),function(_ee,_ef,_f0){
with(_ee){
var _f1=objj_msgSend(_rowCache,"count"),i;
for(i=0;i<_f1;i++){
var _f2=_rowCache[i];
if(objj_msgSend(_f2,"rowObject")===_f0){
return _f2;
}
}
return nil;
}
}),new objj_method(sel_getUid("_rowIndexForRowObject:"),function(_f3,_f4,_f5){
with(_f3){
if(_f5===_boundArrayOwner){
return -1;
}
return objj_msgSend(objj_msgSend(_f3,"_searchCacheForRowObject:",_f5),"rowIndex");
}
}),new objj_method(sel_getUid("_subrowObjectsOfObject:"),function(_f6,_f7,_f8){
with(_f6){
if(_f8===_boundArrayOwner){
return objj_msgSend(_f6,"_rootRowsArray");
}
return objj_msgSend(_f8,"mutableArrayValueForKey:",_subrowsArrayKeyPath);
}
}),new objj_method(sel_getUid("_childlessParentsIfSlicesWereDeletedAtIndexes:"),function(_f9,_fa,_fb){
with(_f9){
var _fc=objj_msgSend(CPIndexSet,"indexSet"),_fd=objj_msgSend(_fb,"firstIndex");
while(_fd!==CPNotFound){
var _fe=objj_msgSend(_f9,"parentRowForRow:",_fd),_ff=objj_msgSend(_f9,"subrowIndexesForRow:",_fe);
if(objj_msgSend(_ff,"count")===1){
if(_fe!==-1){
return objj_msgSend(CPIndexSet,"indexSetWithIndex:",0);
}
var _100=objj_msgSend(_f9,"_childlessParentsIfSlicesWereDeletedAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_fe));
objj_msgSend(_fc,"addIndexes:",_100);
}
_fd=objj_msgSend(_fb,"indexGreaterThanIndex:",_fd);
}
return _fc;
}
}),new objj_method(sel_getUid("_includeSubslicesForSlicesAtIndexes:"),function(self,_101,_102){
with(self){
var _103=objj_msgSend(_102,"copy"),_104=objj_msgSend(_102,"firstIndex");
while(_104!==CPNotFound){
var sub=objj_msgSend(self,"subrowIndexesForRow:",_104);
objj_msgSend(_103,"addIndexes:",objj_msgSend(self,"_includeSubslicesForSlicesAtIndexes:",sub));
_104=objj_msgSend(_102,"indexGreaterThanIndex:",_104);
}
return _103;
}
}),new objj_method(sel_getUid("_deleteSlice:"),function(self,_105,_106){
with(self){
var _107=objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_106,"rowIndex"));
if(!_allowsEmptyCompoundRows){
var _108=objj_msgSend(self,"_childlessParentsIfSlicesWereDeletedAtIndexes:",_107);
if(objj_msgSend(_108,"count")>0){
_107=_108;
}
}
objj_msgSend(self,"removeRowsAtIndexes:includeSubrows:",_107,YES);
objj_msgSend(self,"_updatePredicate");
objj_msgSend(self,"_sendRuleAction");
objj_msgSend(self,"_postRuleOptionChangedNotification");
objj_msgSend(self,"_postRowCountChangedNotificationOfType:indexes:",CPRuleEditorRowsDidChangeNotification,_107);
}
}),new objj_method(sel_getUid("_rootRowsArray"),function(self,_109){
with(self){
return objj_msgSend(_boundArrayOwner,"mutableArrayValueForKey:",_boundArrayKeyPath);
}
}),new objj_method(sel_getUid("_nextUnusedItems:andValues:forRow:forRowType:"),function(self,_10a,_10b,_10c,_10d,type){
with(self){
var _10e=objj_msgSend(_10b,"lastObject"),_10f=objj_msgSend(self,"_queryNumberOfChildrenOfItem:withRowType:",_10e,type),_110=CPNotFound;
if(_10f===0){
return NO;
}
var _111=objj_msgSend(CPMutableArray,"array"),_112=objj_msgSend(self,"numberOfRows"),row;
for(row=0;row<_112;row++){
var _113=objj_msgSend(self,"criteriaForRow:",row),_114=objj_msgSend(_10b,"count");
if(objj_msgSend(self,"rowTypeForRow:",row)===type&&_114<objj_msgSend(_113,"count")){
var crit=objj_msgSend(_113,"objectAtIndex:",_114);
objj_msgSend(_111,"addObject:",crit);
}
}
while(_110===CPNotFound){
var _115=objj_msgSend(CPMutableArray,"arrayWithArray:",_111),i;
for(i=0;i<_10f;i++){
var _116=objj_msgSend(self,"_queryChild:ofItem:withRowType:",i,_10e,type);
if(objj_msgSend(_111,"indexOfObject:",_116)===CPNotFound){
_110=i;
break;
}
}
if(_110===CPNotFound){
for(var k=0;k<_10f;k++){
var _117=objj_msgSend(self,"_queryChild:ofItem:withRowType:",k,_10e,type),_118=objj_msgSend(_115,"indexOfObject:",_117);
if(_118!==CPNotFound){
objj_msgSend(_115,"removeObjectAtIndex:",_118);
}
}
_111=_115;
}
}
var _119=objj_msgSend(self,"_queryChild:ofItem:withRowType:",_110,_10e,type),_11a=objj_msgSend(self,"_queryValueForItem:inRow:",_119,_10d);
objj_msgSend(_10b,"addObject:",_119);
objj_msgSend(_10c,"addObject:",_11a);
return YES;
}
}),new objj_method(sel_getUid("_getItemsAndValuesToAddForRow:ofType:"),function(self,_11b,_11c,type){
with(self){
var _11d=objj_msgSend(CPMutableArray,"array"),_11e=objj_msgSend(CPMutableArray,"array"),_11f=objj_msgSend(CPMutableArray,"array"),_120=YES;
while(_120){
_120=objj_msgSend(self,"_nextUnusedItems:andValues:forRow:forRowType:",_11e,_11f,_11c,type);
}
var _121=objj_msgSend(_11e,"count");
for(var i=0;i<_121;i++){
var item=objj_msgSend(_11e,"objectAtIndex:",i),_122=objj_msgSend(_11f,"objectAtIndex:",i),_123=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[item,_122],["item","value"]);
objj_msgSend(_11d,"addObject:",_123);
}
return _11d;
}
}),new objj_method(sel_getUid("_addOptionFromSlice:ofRowType:"),function(self,_124,_125,type){
with(self){
var _126=objj_msgSend(_125,"rowIndex"),_127=objj_msgSend(self,"rowTypeForRow:",_126),_128=_126+1,_129=(_127===CPRuleEditorRowTypeCompound)?_126:objj_msgSend(self,"parentRowForRow:",_126);
objj_msgSend(self,"insertRowAtIndex:withType:asSubrowOfRow:animate:",_128,type,_129,YES);
}
}),new objj_method(sel_getUid("_insertNewRowAtIndex:ofType:withParentRow:"),function(self,_12a,_12b,_12c,_12d){
with(self){
var row=objj_msgSend(objj_msgSend(objj_msgSend(self,"rowClass"),"alloc"),"init"),_12e=objj_msgSend(self,"_getItemsAndValuesToAddForRow:ofType:",_12b,_12c),_12f=objj_msgSend(_12e,"valueForKey:","item"),_130=objj_msgSend(_12e,"valueForKey:","value");
objj_msgSend(row,"setValue:forKey:",_12f,_itemsKeyPath);
objj_msgSend(row,"setValue:forKey:",_130,_valuesKeyPath);
objj_msgSend(row,"setValue:forKey:",_12c,_typeKeyPath);
objj_msgSend(row,"setValue:forKey:",objj_msgSend(CPMutableArray,"array"),_subrowsArrayKeyPath);
var _131;
if(_12d===-1||objj_msgSend(self,"_applicableNestingMode")===CPRuleEditorNestingModeList){
_131=objj_msgSend(self,"_rootRowsArray");
}else{
var _132=objj_msgSend(objj_msgSend(self,"_rowCacheForIndex:",_12d),"rowObject");
_131=objj_msgSend(self,"_subrowObjectsOfObject:",_132);
}
var _133=_12b-_12d-1;
objj_msgSend(_131,"insertObject:atIndex:",row,_133);
objj_msgSend(self,"_updatePredicate");
objj_msgSend(self,"_sendRuleAction");
objj_msgSend(self,"_postRuleOptionChangedNotification");
objj_msgSend(self,"_postRowCountChangedNotificationOfType:indexes:",CPRuleEditorRowsDidChangeNotification,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_12b));
return row;
}
}),new objj_method(sel_getUid("_startObservingRowObjectsRecursively:"),function(self,_134,_135){
with(self){
objj_msgSend(_boundArrayOwner,"addObserver:forKeyPath:options:context:",self,_boundArrayKeyPath,CPKeyValueObservingOptionOld|CPKeyValueObservingOptionNew,_5);
var _136=objj_msgSend(_135,"count");
for(var i=0;i<_136;i++){
var _137=objj_msgSend(_135,"objectAtIndex:",i);
objj_msgSend(_137,"addObserver:forKeyPath:options:context:",self,_itemsKeyPath,CPKeyValueObservingOptionOld|CPKeyValueObservingOptionNew,_2);
objj_msgSend(_137,"addObserver:forKeyPath:options:context:",self,_valuesKeyPath,CPKeyValueObservingOptionOld|CPKeyValueObservingOptionNew,_3);
objj_msgSend(_137,"addObserver:forKeyPath:options:context:",self,_subrowsArrayKeyPath,CPKeyValueObservingOptionOld|CPKeyValueObservingOptionNew,_4);
var _138=objj_msgSend(self,"_subrowObjectsOfObject:",_137);
if(objj_msgSend(_138,"count")>0){
objj_msgSend(self,"_startObservingRowObjectsRecursively:",_138);
}
}
}
}),new objj_method(sel_getUid("_stopObservingRowObjectsRecursively:"),function(self,_139,_13a){
with(self){
objj_msgSend(_boundArrayOwner,"removeObserver:forKeyPath:",self,_boundArrayKeyPath);
var _13b=objj_msgSend(_13a,"count");
for(var i=0;i<_13b;i++){
var _13c=objj_msgSend(_13a,"objectAtIndex:",i);
objj_msgSend(_13c,"removeObserver:forKeyPath:",self,_itemsKeyPath);
objj_msgSend(_13c,"removeObserver:forKeyPath:",self,_valuesKeyPath);
objj_msgSend(_13c,"removeObserver:forKeyPath:",self,_subrowsArrayKeyPath);
var _13d=objj_msgSend(_13c,"valueForKey:",_subrowsArrayKeyPath);
if(objj_msgSend(_13d,"count")>0){
objj_msgSend(self,"_stopObservingRowObjectsRecursively:",_13d);
}
}
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(self,_13e,_13f,_140,_141,_142){
with(self){
var _143=objj_msgSend(_141,"objectForKey:",CPKeyValueChangeKindKey),_144=objj_msgSend(_141,"objectForKey:",CPKeyValueChangeNewKey),_145=objj_msgSend(_141,"objectForKey:",CPKeyValueChangeOldKey),_146,_147;
if(_142===_5||_142===_4){
if(_143===CPKeyValueChangeSetting){
_146=_144;
_147=_145;
}else{
if(_143===CPKeyValueChangeInsertion){
_146=objj_msgSend(self,"_subrowObjectsOfObject:",_140);
_147=objj_msgSend(CPArray,"arrayWithArray:",_146);
objj_msgSend(_147,"removeObjectsInArray:",_144);
}else{
if(_143===CPKeyValueChangeRemoval){
_146=objj_msgSend(self,"_subrowObjectsOfObject:",_140);
_147=objj_msgSend(CPArray,"arrayWithArray:",_146);
var _148=objj_msgSend(_141,"objectForKey:",CPKeyValueChangeIndexesKey);
objj_msgSend(_147,"insertObjects:atIndexes:",delObjects,_145);
}
}
}
objj_msgSend(self,"_changedRowArray:withOldRowArray:forParent:",_146,_147,_140);
objj_msgSend(self,"_reconfigureSubviewsAnimate:",objj_msgSend(self,"_wantsRowAnimations"));
}else{
if(_142===_2){
}else{
if(_142===_3){
}
}
}
}
}),new objj_method(sel_getUid("_changedItem:toItem:inRow:atCriteriaIndex:"),function(self,_149,_14a,_14b,aRow,_14c){
with(self){
var _14d=objj_msgSend(self,"criteriaForRow:",aRow),_14e=objj_msgSend(self,"displayValuesForRow:",aRow),_14f=objj_msgSend(self,"rowTypeForRow:",aRow),_150=_14b,_151=objj_msgSend(_14d,"subarrayWithRange:",CPMakeRange(0,_14c)),_152=objj_msgSend(_14e,"subarrayWithRange:",CPMakeRange(0,_14c));
_lastRow=aRow;
while(YES){
objj_msgSend(_151,"addObject:",_150);
var _153=objj_msgSend(self,"_queryValueForItem:inRow:",_150,aRow);
objj_msgSend(_152,"addObject:",_153);
if(!objj_msgSend(self,"_queryNumberOfChildrenOfItem:withRowType:",_150,_14f)){
break;
}
_150=objj_msgSend(self,"_queryChild:ofItem:withRowType:",0,_150,_14f);
}
var _154=objj_msgSend(objj_msgSend(self,"_rowCacheForIndex:",aRow),"rowObject");
objj_msgSend(_154,"setValue:forKey:",_151,_itemsKeyPath);
objj_msgSend(_154,"setValue:forKey:",_152,_valuesKeyPath);
var _155=objj_msgSend(_slices,"objectAtIndex:",aRow);
objj_msgSend(_155,"_reconfigureSubviews");
objj_msgSend(self,"_updatePredicate");
objj_msgSend(self,"_sendRuleAction");
objj_msgSend(self,"_postRuleOptionChangedNotification");
}
}),new objj_method(sel_getUid("_changedRowArray:withOldRowArray:forParent:"),function(self,_156,_157,_158,_159){
with(self){
var _15a=objj_msgSend(_157,"count"),_15b=objj_msgSend(_158,"count"),_15c=_15a-_15b,_15d=MIN(_15a,_15b),_15e=MAX(_15a,_15b),_15f=objj_msgSend(CPIndexSet,"indexSet"),_160=objj_msgSend(CPArray,"array"),_161,_162=objj_msgSend(self,"_rowIndexForRowObject:",_159),_163=0,_164=0;
objj_msgSend(self,"_stopObservingRowObjectsRecursively:",_158);
objj_msgSend(self,"_startObservingRowObjectsRecursively:",_157);
if(_162===-1){
_161=-1;
}else{
_161=objj_msgSend(objj_msgSend(self,"_rowCacheForIndex:",_162),"indentation");
}
for(;_163<_15a;_163++){
var _165=(_162+1)+_163,obj=objj_msgSend(_157,"objectAtIndex:",_163),_166=objj_msgSend(obj,"valueForKey:",_typeKeyPath),_167=objj_msgSend(objj_msgSend(_CPRuleEditorCache,"alloc"),"init");
objj_msgSend(_167,"setRowObject:",obj);
objj_msgSend(_167,"setRowIndex:",_165);
objj_msgSend(_167,"setIndentation:",_161+1);
objj_msgSend(_15f,"addIndex:",_165);
objj_msgSend(_160,"addObject:",_167);
}
objj_msgSend(_rowCache,"removeObjectsInRange:",CPMakeRange(_162+1,objj_msgSend(_158,"count")));
objj_msgSend(_rowCache,"insertObjects:atIndexes:",_160,_15f);
for(;_164<_15d;_164++){
var _168=objj_msgSend(_158,"objectAtIndex:",_164),_169=objj_msgSend(_157,"objectAtIndex:",_164);
if(_169!==_168){
break;
}
}
var _16a=(_15c===0)?_15e:_15e-_15d,_16b=_162+_164+1;
if(_15c<=0){
var _16c=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_16b,_16a)),_16d=objj_msgSend(_slices,"objectsAtIndexes:",_16c);
objj_msgSend(_16d,"makeObjectsPerformSelector:",sel_getUid("removeFromSuperview"));
objj_msgSend(_slices,"removeObjectsAtIndexes:",_16c);
}
if(_15c>=0){
var _16e=_161+1,_16f=_16b;
for(;_16f<_16b+_16a;_16f++){
var _170=objj_msgSend(self,"_newSlice"),_171=objj_msgSend(self,"rowTypeForRow:",_16f);
objj_msgSend(_170,"setRowIndex:",_16f);
objj_msgSend(_170,"setIndentation:",_16e);
objj_msgSend(_170,"_setRowType:",_171);
objj_msgSend(_170,"_configurePlusButtonByRowType:",CPRuleEditorRowTypeSimple);
objj_msgSend(_slices,"insertObject:atIndex:",_170,_16f);
}
}
var _172=objj_msgSend(CPArray,"array"),_173=objj_msgSend(_158,"count"),n;
for(n=0;n<_173;n++){
var _174=objj_msgSend(_158,"objectAtIndex:",n),_175=objj_msgSend(self,"_subrowObjectsOfObject:",_174);
if(objj_msgSend(_175,"count")>0){
objj_msgSend(self,"_changedRowArray:withOldRowArray:forParent:",_172,_175,_174);
}
}
_173=objj_msgSend(_157,"count");
for(n=0;n<_173;n++){
var _176=objj_msgSend(_157,"objectAtIndex:",n),_177=objj_msgSend(self,"_subrowObjectsOfObject:",_176);
if(objj_msgSend(_177,"count")>0){
objj_msgSend(self,"_changedRowArray:withOldRowArray:forParent:",_177,_172,_176);
}
}
}
}),new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"),function(self,_178,_179,_17a,_17b,_17c){
with(self){
if(objj_msgSend(_179,"isEqualToString:","rows")){
objj_msgSend(self,"unbind:",_179);
objj_msgSend(self,"_setBoundDataSource:withKeyPath:options:",_17a,_17b,_17c);
objj_msgSend(_rowCache,"removeAllObjects");
objj_msgSend(_slices,"removeAllObjects");
var _17d=objj_msgSend(CPArray,"array"),_17e=objj_msgSend(self,"_rootRowsArray");
objj_msgSend(self,"_changedRowArray:withOldRowArray:forParent:",_17d,_17e,_boundArrayOwner);
}else{
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPRuleEditor").super_class},"bind:toObject:withKeyPath:options:",_179,_17a,_17b,_17c);
}
}
}),new objj_method(sel_getUid("unbind:"),function(self,_17f,_180){
with(self){
_rowClass=objj_msgSend(_CPRuleEditorRowObject,"class");
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPRuleEditor").super_class},"unbind:",_180);
}
}),new objj_method(sel_getUid("_setBoundDataSource:withKeyPath:options:"),function(self,_181,_182,_183,_184){
with(self){
if(objj_msgSend(observableController,"respondsToSelector:",sel_getUid("objectClass"))){
_rowClass=objj_msgSend(observableController,"objectClass");
}
_boundArrayKeyPath=_183;
_boundArrayOwner=_182;
objj_msgSend(_boundArrayOwner,"addObserver:forKeyPath:options:context:",self,_boundArrayKeyPath,CPKeyValueObservingOptionOld|CPKeyValueObservingOptionNew,_5);
}
}),new objj_method(sel_getUid("_setPredicate:"),function(self,_185,_186){
with(self){
if(_predicate!==_186){
_predicate=_186;
}
}
}),new objj_method(sel_getUid("_updatePredicate"),function(self,_187){
with(self){
if(_delegateWantsValidation){
var _188=sel_getUid("ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:");
if(!objj_msgSend(_ruleDelegate,"respondsToSelector:",_188)){
return;
}
_delegateWantsValidation=NO;
}
var _189=objj_msgSend(CPMutableArray,"array"),_18a=objj_msgSend(self,"subrowIndexesForRow:",-1),_18b=objj_msgSend(_18a,"firstIndex");
while(_18b!==CPNotFound){
var _18c=objj_msgSend(self,"predicateForRow:",_18b);
if(_18c!==nil){
objj_msgSend(_189,"addObject:",_18c);
}
_18b=objj_msgSend(_18a,"indexGreaterThanIndex:",_18b);
}
var _18d=objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",CPOrPredicateType,_189);
objj_msgSend(self,"_setPredicate:",_18d);
}
}),new objj_method(sel_getUid("_newSlice"),function(self,_18e){
with(self){
var _18f=CGRectMake(0,0,CGRectGetWidth(objj_msgSend(self,"frame")),0),_190=objj_msgSend(self,"_createNewSliceWithFrame:ruleEditorView:",_18f,self);
return _190;
}
}),new objj_method(sel_getUid("_createNewSliceWithFrame:ruleEditorView:"),function(self,_191,_192,_193){
with(self){
return objj_msgSend(objj_msgSend(_CPRuleEditorViewSliceRow,"alloc"),"initWithFrame:ruleEditorView:",_192,_193);
}
}),new objj_method(sel_getUid("_reconfigureSubviewsAnimate:"),function(self,_194,_195){
with(self){
var _196=objj_msgSend(CPMutableArray,"array"),_197=objj_msgSend(CPMutableArray,"array"),_198=objj_msgSend(_slices,"count");
objj_msgSend(self,"_updateSliceRows");
if(objj_msgSend(objj_msgSend(self,"superview"),"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
objj_msgSend(self,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(self,"frame")),_198*_sliceHeight));
}
for(var i=0;i<_198;i++){
var _199=objj_msgSend(_slices,"objectAtIndex:",i),_19a=objj_msgSend(_199,"_animationTargetRect"),_19b=objj_msgSend(_199,"frame"),_19c=objj_msgSend(_199,"rowIndex")-1;
if(objj_msgSend(_199,"superview")===nil){
_19b=CGRectMake(0,_19c*_sliceHeight,CGRectGetWidth(_19b),_sliceHeight);
objj_msgSend(_199,"_reconfigureSubviews");
objj_msgSend(_197,"addObject:",_199);
}
if(_195){
var _19d=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_19d,"setObject:forKey:",_199,CPViewAnimationTargetKey);
objj_msgSend(_19d,"setObject:forKey:",_19b,CPViewAnimationStartFrameKey);
objj_msgSend(_19d,"setObject:forKey:",_19a,CPViewAnimationEndFrameKey);
objj_msgSend(_196,"insertObject:atIndex:",_19d,0);
}else{
objj_msgSend(_199,"setFrame:",_19a);
}
}
var _19e=objj_msgSend(_197,"count");
for(var i=0;i<_19e;i++){
objj_msgSend(_slicesHolder,"addSubview:positioned:relativeTo:",_197[i],CPWindowBelow,nil);
}
if(_195){
objj_msgSend(_currentAnimation,"setViewAnimations:",_196);
objj_msgSend(_currentAnimation,"startAnimation");
}
_lastRow=objj_msgSend(self,"numberOfRows")-1;
if(_lastRow===-1){
_nestingModeDidChange=NO;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(_slices,"makeObjectsPerformSelector:",sel_getUid("_updateButtonVisibilities"));
}
}),new objj_method(sel_getUid("animationDidEnd:"),function(self,_19f,_1a0){
with(self){
}
}),new objj_method(sel_getUid("_updateSliceRows"),function(self,_1a1){
with(self){
var _1a2=objj_msgSend(self,"frame").size.width,_1a3=objj_msgSend(_slices,"count");
for(var i=0;i<_1a3;i++){
var _1a4=objj_msgSend(_slices,"objectAtIndex:",i),_1a5=CGRectMake(0,i*_sliceHeight,_1a2,_sliceHeight);
objj_msgSend(_1a4,"setRowIndex:",i);
objj_msgSend(_1a4,"_setAnimationTargetRect:",_1a5);
}
}
}),new objj_method(sel_getUid("_backgroundColors"),function(self,_1a6){
with(self){
return objj_msgSend(self,"valueForThemeAttribute:","alternating-row-colors");
}
}),new objj_method(sel_getUid("_selectedRowColor"),function(self,_1a7){
with(self){
return objj_msgSend(self,"valueForThemeAttribute:","selected-color");
}
}),new objj_method(sel_getUid("_sliceTopBorderColor"),function(self,_1a8){
with(self){
return objj_msgSend(self,"valueForThemeAttribute:","slice-top-border-color");
}
}),new objj_method(sel_getUid("_sliceBottomBorderColor"),function(self,_1a9){
with(self){
return objj_msgSend(self,"valueForThemeAttribute:","slice-bottom-border-color");
}
}),new objj_method(sel_getUid("_sliceLastBottomBorderColor"),function(self,_1aa){
with(self){
return objj_msgSend(self,"valueForThemeAttribute:","slice-last-bottom-border-color");
}
}),new objj_method(sel_getUid("font"),function(self,_1ab){
with(self){
return objj_msgSend(self,"valueForThemeAttribute:","font");
}
}),new objj_method(sel_getUid("_addImage"),function(self,_1ac){
with(self){
return objj_msgSend(self,"valueForThemeAttribute:","add-image");
}
}),new objj_method(sel_getUid("_removeImage"),function(self,_1ad){
with(self){
return objj_msgSend(self,"valueForThemeAttribute:","remove-image");
}
}),new objj_method(sel_getUid("_toolTipForAddCompoundRowButton"),function(self,_1ae){
with(self){
return "Add Compound row";
}
}),new objj_method(sel_getUid("_toolTipForAddSimpleRowButton"),function(self,_1af){
with(self){
return "Add row";
}
}),new objj_method(sel_getUid("_toolTipForDeleteRowButton"),function(self,_1b0){
with(self){
return "Delete row";
}
}),new objj_method(sel_getUid("_updateSliceIndentations"),function(self,_1b1){
with(self){
objj_msgSend(self,"_updateSliceIndentationAtIndex:toIndentation:withIndexSet:",0,0,objj_msgSend(self,"subrowIndexesForRow:",0));
}
}),new objj_method(sel_getUid("_updateSliceIndentationAtIndex:toIndentation:withIndexSet:"),function(self,_1b2,_1b3,_1b4,_1b5){
with(self){
var _1b6=objj_msgSend(_1b5,"firstIndex");
while(_1b6!==CPNotFound){
var _1b7=objj_msgSend(self,"subrowIndexesForRow:",_1b3);
objj_msgSend(self,"_updateSliceIndentationAtIndex:toIndentation:withIndexSet:",_1b6,_1b4+1,_1b7);
_1b6=objj_msgSend(_1b5,"indexGreaterThanIndex:",_1b6);
}
objj_msgSend(objj_msgSend(_slices,"objectAtIndex:",_1b3),"setIndentation:",_1b4);
}
}),new objj_method(sel_getUid("_selectedSlices"),function(self,_1b8){
with(self){
var _1b9=objj_msgSend(CPMutableArray,"array"),_1ba=objj_msgSend(_slices,"count"),i;
for(i=0;i<_1ba;i++){
var _1bb=_slices[i];
if(objj_msgSend(_1bb,"_isSelected")){
objj_msgSend(_1b9,"addObject:",_1bb);
}
}
return _1b9;
}
}),new objj_method(sel_getUid("_lastSelectedSliceIndex"),function(self,_1bc){
with(self){
var _1bd=-1,_1be=objj_msgSend(_slices,"count"),i;
for(i=0;i<_1be;i++){
var _1bf=_slices[i];
if(objj_msgSend(_1bf,"_isLastSelected")){
return objj_msgSend(_1bf,"rowIndex");
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("_mouseUpOnSlice:withEvent:"),function(self,_1c0,_1c1,_1c2){
with(self){
if(objj_msgSend(_1c1,"_rowType")!==CPRuleEditorRowTypeSimple){
return;
}
var _1c3=objj_msgSend(_1c2,"modifierFlags"),_1c4=(_1c3&CPCommandKeyMask)||(_1c3&CPShiftKeyMask),_1c5=objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_1c1,"rowIndex"));
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",_1c5,_1c4);
}
}),new objj_method(sel_getUid("_mouseDownOnSlice:withEvent:"),function(self,_1c6,_1c7,_1c8){
with(self){
}
}),new objj_method(sel_getUid("_rightMouseDownOnSlice:withEvent:"),function(self,_1c9,_1ca,_1cb){
with(self){
}
}),new objj_method(sel_getUid("_performClickOnSlice:withEvent:"),function(self,_1cc,_1cd,_1ce){
with(self){
}
}),new objj_method(sel_getUid("_setSuppressKeyDownHandling:"),function(self,_1cf,flag){
with(self){
_suppressKeyDownHandling=flag;
}
}),new objj_method(sel_getUid("selectAll:"),function(self,_1d0,_1d1){
with(self){
var _1d2=objj_msgSend(_slices,"count");
while(_1d2--){
var _1d3=_slices[_1d2];
objj_msgSend(_1d3,"_setSelected:",YES);
objj_msgSend(_1d3,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("_deselectAll"),function(self,_1d4){
with(self){
var _1d5=objj_msgSend(_slices,"count");
while(_1d5--){
var _1d6=_slices[_1d5];
objj_msgSend(_1d6,"_setSelected:",NO);
objj_msgSend(_1d6,"_setLastSelected:",NO);
objj_msgSend(_1d6,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("_queryNumberOfChildrenOfItem:withRowType:"),function(self,_1d7,item,type){
with(self){
return objj_msgSend(_ruleDelegate,"ruleEditor:numberOfChildrenForCriterion:withRowType:",self,item,type);
}
}),new objj_method(sel_getUid("_queryChild:ofItem:withRowType:"),function(self,_1d8,_1d9,item,type){
with(self){
return objj_msgSend(_ruleDelegate,"ruleEditor:child:forCriterion:withRowType:",self,_1d9,item,type);
}
}),new objj_method(sel_getUid("_queryValueForItem:inRow:"),function(self,_1da,item,row){
with(self){
return objj_msgSend(_ruleDelegate,"ruleEditor:displayValueForCriterion:inRow:",self,item,row);
}
}),new objj_method(sel_getUid("_lastRow"),function(self,_1db){
with(self){
return _lastRow;
}
}),new objj_method(sel_getUid("_countOfRowsStartingAtObject:"),function(self,_1dc,_1dd){
with(self){
var _1de=objj_msgSend(self,"_rowIndexForRowObject:",_1dd);
return (objj_msgSend(self,"numberOfRows")-_1de);
}
}),new objj_method(sel_getUid("_setAlignmentGridWidth:"),function(self,_1df,_1e0){
with(self){
_alignmentGridWidth=_1e0;
}
}),new objj_method(sel_getUid("_validateItem:value:inRow:"),function(self,_1e1,item,_1e2,row){
with(self){
return objj_msgSend(self,"_queryCanSelectItem:displayValue:inRow:",item,_1e2,row);
}
}),new objj_method(sel_getUid("_queryCanSelectItem:displayValue:inRow:"),function(self,_1e3,item,_1e4,row){
with(self){
return YES;
}
}),new objj_method(sel_getUid("_windowChangedKeyState"),function(self,_1e5){
with(self){
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_1e6,flag){
with(self){
objj_msgSend(_slices,"makeObjectsPerformSelector:withObject:",sel_getUid("setNeedsDisplay:"),flag);
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPRuleEditor").super_class},"setNeedsDisplay:",flag);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_1e7,size){
with(self){
objj_msgSend(self,"setNeedsDisplay:",YES);
if(CGRectGetWidth(objj_msgSend(self,"frame"))!==size.width){
objj_msgSend(_slices,"makeObjectsPerformSelector:",sel_getUid("setNeedsLayout"));
}
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPRuleEditor").super_class},"setFrameSize:",size);
}
}),new objj_method(sel_getUid("_selectedSliceIndices"),function(self,_1e8){
with(self){
var _1e9=objj_msgSend(CPMutableIndexSet,"indexSet"),_1ea=objj_msgSend(_slices,"count"),i;
for(i=0;i<_1ea;i++){
var _1eb=_slices[i];
if(objj_msgSend(_1eb,"_isSelected")){
objj_msgSend(_1e9,"addIndex:",objj_msgSend(_1eb,"rowIndex"));
}
}
return _1e9;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(self,_1ec,_1ed){
with(self){
if(!_editable){
return;
}
var _1ee=objj_msgSend(self,"convertPoint:fromView:",objj_msgSend(_1ed,"locationInWindow"),nil),view=objj_msgSend(_slices,"objectAtIndex:",FLOOR(_1ee.y/_sliceHeight));
if(objj_msgSend(self,"_dragShouldBeginFromMouseDown:",view)){
objj_msgSend(self,"_performDragForSlice:withEvent:",view,_1ed);
}
}
}),new objj_method(sel_getUid("_dragShouldBeginFromMouseDown:"),function(self,_1ef,view){
with(self){
return ((objj_msgSend(self,"nestingMode")===CPRuleEditorNestingModeList||objj_msgSend(view,"rowIndex")!==0)&&_editable&&objj_msgSend(view,"isKindOfClass:",objj_msgSend(_CPRuleEditorViewSliceRow,"class"))&&_draggingRows===nil);
}
}),new objj_method(sel_getUid("_performDragForSlice:withEvent:"),function(self,_1f0,_1f1,_1f2){
with(self){
var _1f3,_1f4=objj_msgSend(_1f1,"rowIndex"),_1f5=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_1f4),_1f6=objj_msgSend(self,"_selectedSliceIndices"),_1f7=objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard);
objj_msgSend(_1f7,"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObjects:",_1,nil),self);
if(objj_msgSend(_1f6,"containsIndex:",_1f4)){
objj_msgSend(_1f5,"addIndexes:",_1f6);
}
_draggingRows=objj_msgSend(self,"_includeSubslicesForSlicesAtIndexes:",_1f5);
var _1f8=objj_msgSend(_draggingRows,"firstIndex"),_1f9=objj_msgSend(_slices,"objectAtIndex:",_1f8),_1fa=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_1f9,"frame"));
objj_msgSend(_1fa,"setBackgroundColor:",objj_msgSend(_1f9,"backgroundColor"));
objj_msgSend(_1fa,"setAlphaValue:",0.7);
_1f3=CPMakePoint(0,_1f8*_sliceHeight);
objj_msgSend(self,"dragView:at:offset:event:pasteboard:source:slideBack:",_1fa,_1f3,CGSizeMake(0,_sliceHeight),_1f2,_1f7,self,YES);
return YES;
}
}),new objj_method(sel_getUid("draggingEntered:"),function(self,_1fb,_1fc){
with(self){
if(objj_msgSend(_1fc,"draggingSource")===self){
objj_msgSend(self,"_clearDropLine");
return CPDragOperationMove;
}
return CPDragOperationNone;
}
}),new objj_method(sel_getUid("draggingExited:"),function(self,_1fd,_1fe){
with(self){
objj_msgSend(self,"_clearDropLine");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_clearDropLine"),function(self,_1ff){
with(self){
objj_msgSend(_dropLineView,"setAlphaValue:",0);
if(_subviewIndexOfDropLine!==CPNotFound&&_subviewIndexOfDropLine<_lastRow){
var _200=objj_msgSend(_slices,"objectAtIndex:",_subviewIndexOfDropLine);
objj_msgSend(_200,"setFrameOrigin:",CGPointMake(0,objj_msgSend(_200,"rowIndex")*_sliceHeight));
}
_subviewIndexOfDropLine=CPNotFound;
}
}),new objj_method(sel_getUid("draggingUpdated:"),function(self,_201,_202){
with(self){
var _203=objj_msgSend(self,"convertPoint:fromView:",objj_msgSend(_202,"draggingLocation"),nil),y=_203.y+_sliceHeight/2,_204=FLOOR(y/_sliceHeight),_205=objj_msgSend(self,"numberOfRows");
if(_204<0||_204>_205||(_204>=objj_msgSend(_draggingRows,"firstIndex")&&_204<=objj_msgSend(_draggingRows,"lastIndex")+1)){
if(_subviewIndexOfDropLine!==CPNotFound&&_204!==_subviewIndexOfDropLine){
objj_msgSend(self,"_clearDropLine");
}
return CPDragOperationNone;
}
if(_subviewIndexOfDropLine!==_204){
if(_subviewIndexOfDropLine!==CPNotFound&&_subviewIndexOfDropLine<_205){
var _206=objj_msgSend(_slices,"objectAtIndex:",_subviewIndexOfDropLine);
objj_msgSend(_206,"setFrameOrigin:",CPMakePoint(0,objj_msgSend(_206,"rowIndex")*_sliceHeight));
}
if(_204<=_lastRow&&_204<_205){
var _207=objj_msgSend(_slices,"objectAtIndex:",_204);
objj_msgSend(_207,"setFrameOrigin:",CGPointMake(0,objj_msgSend(_207,"rowIndex")*_sliceHeight+2));
}
objj_msgSend(_dropLineView,"setAlphaValue:",1);
objj_msgSend(_dropLineView,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_dropLineView,"frame")),_204*_sliceHeight));
_subviewIndexOfDropLine=_204;
}
return CPDragOperationMove;
}
}),new objj_method(sel_getUid("prepareForDragOperation:"),function(self,_208,_209){
with(self){
return (_subviewIndexOfDropLine!==CPNotFound);
}
}),new objj_method(sel_getUid("performDragOperation:"),function(self,_20a,info){
with(self){
var _20b=0,_20c,_20d;
var _20e=objj_msgSend(_rowCache,"valueForKey:","rowObject"),_20f=objj_msgSend(_draggingRows,"lastIndex");
var _210=objj_msgSend(self,"parentRowForRow:",_20f),_211=(_210===-1)?_boundArrayOwner:objj_msgSend(objj_msgSend(self,"_rowCacheForIndex:",_210),"rowObject"),_212=_subviewIndexOfDropLine;
while(_20f!==CPNotFound){
if(_20f>=_212){
_20d=_20f+_20b;
_20b+=1;
}else{
_20d=_20f;
_212-=1;
}
_20c=objj_msgSend(_20e,"objectAtIndex:",_20d);
objj_msgSend(self,"removeRowAtIndex:",_20d);
objj_msgSend(objj_msgSend(self,"_subrowObjectsOfObject:",_211),"insertObject:atIndex:",_20c,_212-_210-1);
_20f=objj_msgSend(_draggingRows,"indexLessThanIndex:",_20f);
}
objj_msgSend(self,"_clearDropLine");
_draggingRows=nil;
return YES;
}
}),new objj_method(sel_getUid("_draggingTypes"),function(self,_213){
with(self){
return objj_msgSend(CPIndexSet,"indexSetWithIndex:",CPDragOperationMove);
}
}),new objj_method(sel_getUid("draggedView:endedAt:operation:"),function(self,_214,_215,_216,_217){
with(self){
_draggingRows=nil;
objj_msgSend(self,"_updatePredicate");
objj_msgSend(self,"_sendRuleAction");
objj_msgSend(self,"_postRuleOptionChangedNotification");
objj_msgSend(self,"_postRowCountChangedNotificationOfType:indexes:",CPRuleEditorRowsDidChangeNotification,nil);
}
}),new objj_method(sel_getUid("wantsPeriodicDraggingUpdates"),function(self,_218){
with(self){
return NO;
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(self,_219,_21a,type){
with(self){
}
}),new objj_method(sel_getUid("_setWindow:"),function(self,_21b,_21c){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPRuleEditor").super_class},"_setWindow:",_21c);
}
}),new objj_method(sel_getUid("_windowUpdate:"),function(self,_21d,_21e){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPRuleEditor").super_class},"_windowUpdate:",_21e);
}
}),new objj_method(sel_getUid("_postRuleOptionChangedNotification"),function(self,_21f){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPRuleEditorRulesDidChangeNotification,self);
}
}),new objj_method(sel_getUid("_postRowCountChangedNotificationOfType:indexes:"),function(self,_220,_221,_222){
with(self){
var _223=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_222,"indexes");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",_221,self,_223);
}
}),new objj_method(sel_getUid("_globalIndexesForSubrowIndexes:ofParentObject:"),function(self,_224,_225,_226){
with(self){
var _227=objj_msgSend(self,"_subrowObjectsOfObject:",_226),_228=objj_msgSend(self,"_rowIndexForRowObject:",_226),_229=objj_msgSend(CPMutableIndexSet,"indexSet"),_22a=objj_msgSend(_225,"firstIndex"),_22b=0;
while(_22a!==CPNotFound){
var _22c=_22a+_228+1+_22b;
objj_msgSend(_229,"addIndex:",_22c);
if(objj_msgSend(self,"rowTypeForRow:",_22c)===CPRuleEditorRowTypeCompound){
var _22d=objj_msgSend(objj_msgSend(self,"_rowCacheForIndex:",_22a),"rowObject"),_22e=objj_msgSend(self,"_subrowObjectsOfObject:",_22d),_22f=objj_msgSend(self,"_globalIndexesForSubrowIndexes:ofParentObject:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,objj_msgSend(_22e,"count"))),_22d);
_22b=objj_msgSend(_22f,"count");
}
_22a=objj_msgSend(_225,"indexGreaterThanIndex:",_22a);
}
return _229;
}
}),new objj_method(sel_getUid("_sendRuleAction"),function(self,_230){
with(self){
var _231=objj_msgSend(self,"action"),_232=objj_msgSend(self,"target");
objj_msgSend(self,"sendAction:to:",_231,_232);
}
}),new objj_method(sel_getUid("_sendsActionOnIncompleteTextChange"),function(self,_233){
with(self){
return YES;
}
}),new objj_method(sel_getUid("_getAllAvailableItems:values:asChildrenOfItem:inRow:"),function(self,_234,_235,_236,_237,aRow){
with(self){
var type,_238,_239;
var _23a=objj_msgSend(CPMutableArray,"array"),_23b=objj_msgSend(CPMutableArray,"array");
var _23c=nil,_23d=nil;
_lastRow=aRow;
type=objj_msgSend(self,"rowTypeForRow:",aRow);
_239=objj_msgSend(self,"_queryNumberOfChildrenOfItem:withRowType:",_237,type);
var _23e=objj_msgSend(self,"criteriaForRow:",aRow);
_238=objj_msgSend(_23e,"indexOfObject:",_23c);
if(_237!==nil&&_238!==CPNotFound&&_238<objj_msgSend(_23e,"count")-1){
var next=_238+1;
_23c=objj_msgSend(_23e,"objectAtIndex:",next);
var _236=objj_msgSend(self,"displayValuesForRow:",aRow);
_23d=objj_msgSend(_236,"objectAtIndex:",next);
}
for(var i=0;i<_239;++i){
var _23f=objj_msgSend(self,"_queryChild:ofItem:withRowType:",i,_237,type),_240=_23f,_241=_23d;
if(_23c!==_23f){
_241=objj_msgSend(self,"_queryValueForItem:inRow:",_23f,aRow);
}
if(!_241){
_241=objj_msgSend(self,"_queryValueForItem:inRow:",_240,aRow);
}
objj_msgSend(_23a,"addObject:",_240);
objj_msgSend(_23b,"addObject:",_241);
}
objj_msgSend(_235,"addObjectsFromArray:",_23a);
objj_msgSend(_236,"addObjectsFromArray:",_23b);
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("defaultThemeClass"),function(self,_242){
with(self){
return "rule-editor";
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_243){
with(self){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null"),objj_msgSend(CPNull,"null")],["alternating-row-colors","selected-color","slice-top-border-color","slice-bottom-border-color","slice-last-bottom-border-color","font","add-image","remove-image"]);
}
})]);
var _244="CPRuleEditorAlignmentGridWidth",_245="CPRuleEditorSliceHeight",_246="CPRuleEditorStringsFilename",_247="CPRuleEditorEditable",_248="CPRuleEditorAllowsEmptyCompoundRows",_249="CPRuleEditorDisallowEmpty",_24a="CPRuleEditorNestingMode",_24b="CPRuleEditorRowTypeKeyPath",_24c="CPRuleEditorItemsKeyPath",_24d="CPRuleEditorValuesKeyPath",_24e="CPRuleEditorSubrowsArrayKeyPath",_24f="CPRuleEditorBoundArrayKeyPath",_250="CPRuleEditorRowClass",_251="CPRuleEditorSlicesHolder",_252="CPRuleEditorSlices",_253="CPRuleEditorDelegate",_254="CPRuleEditorBoundArrayOwner";
var _6=objj_getClass("CPRuleEditor");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPRuleEditor\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(self,_255,_256){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPRuleEditor").super_class},"initWithCoder:",_256);
if(self!==nil){
objj_msgSend(self,"setFormattingStringsFilename:",objj_msgSend(_256,"decodeObjectForKey:",_246));
_alignmentGridWidth=objj_msgSend(_256,"decodeFloatForKey:",_244);
_sliceHeight=objj_msgSend(_256,"decodeDoubleForKey:",_245);
_editable=objj_msgSend(_256,"decodeBoolForKey:",_247);
_allowsEmptyCompoundRows=objj_msgSend(_256,"decodeBoolForKey:",_248);
_disallowEmpty=objj_msgSend(_256,"decodeBoolForKey:",_249);
_nestingMode=objj_msgSend(_256,"decodeIntForKey:",_24a);
_typeKeyPath=objj_msgSend(_256,"decodeObjectForKey:",_24b);
_itemsKeyPath=objj_msgSend(_256,"decodeObjectForKey:",_24c);
_valuesKeyPath=objj_msgSend(_256,"decodeObjectForKey:",_24d);
_subrowsArrayKeyPath=objj_msgSend(_256,"decodeObjectForKey:",_24e);
_boundArrayKeyPath=objj_msgSend(_256,"decodeObjectForKey:",_24f);
_slicesHolder=objj_msgSend(objj_msgSend(self,"subviews"),"objectAtIndex:",0);
_boundArrayOwner=objj_msgSend(_256,"decodeObjectForKey:",_254);
_slices=objj_msgSend(_256,"decodeObjectForKey:",_252);
_ruleDelegate=objj_msgSend(_256,"decodeObjectForKey:",_253);
objj_msgSend(self,"_initRuleEditorShared");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_257,_258){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPRuleEditor").super_class},"encodeWithCoder:",_258);
objj_msgSend(_258,"encodeBool:forKey:",_editable,_247);
objj_msgSend(_258,"encodeBool:forKey:",_allowsEmptyCompoundRows,_248);
objj_msgSend(_258,"encodeBool:forKey:",_disallowEmpty,_249);
objj_msgSend(_258,"encodeFloat:forKey:",_alignmentGridWidth,_244);
objj_msgSend(_258,"encodeDouble:forKey:",_sliceHeight,_245);
objj_msgSend(_258,"encodeInt:forKey:",_nestingMode,_24a);
objj_msgSend(_258,"encodeObject:forKey:",_stringsFilename,_246);
objj_msgSend(_258,"encodeObject:forKey:",_typeKeyPath,_24b);
objj_msgSend(_258,"encodeObject:forKey:",_itemsKeyPath,_24c);
objj_msgSend(_258,"encodeObject:forKey:",_valuesKeyPath,_24d);
objj_msgSend(_258,"encodeObject:forKey:",_boundArrayKeyPath,_24f);
objj_msgSend(_258,"encodeObject:forKey:",_subrowsArrayKeyPath,_24e);
objj_msgSend(_258,"encodeConditionalObject:forKey:",_slicesHolder,_251);
objj_msgSend(_258,"encodeObject:forKey:",_slices,_252);
objj_msgSend(_258,"encodeObject:forKey:",_boundArrayOwner,_254);
}
})]);
var _259="criteria",_25a="subrows",_25b="displayValues",_25c="rowType";
var _6=objj_allocateClassPair(CPObject,"_CPRuleEditorRowObject"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("subrows"),new objj_ivar("criteria"),new objj_ivar("displayValues"),new objj_ivar("rowType")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("subrows"),function(self,_25d){
with(self){
return subrows;
}
}),new objj_method(sel_getUid("setSubrows:"),function(self,_25e,_25f){
with(self){
subrows=_25f;
}
}),new objj_method(sel_getUid("criteria"),function(self,_260){
with(self){
return criteria;
}
}),new objj_method(sel_getUid("setCriteria:"),function(self,_261,_262){
with(self){
criteria=_262;
}
}),new objj_method(sel_getUid("displayValues"),function(self,_263){
with(self){
return displayValues;
}
}),new objj_method(sel_getUid("setDisplayValues:"),function(self,_264,_265){
with(self){
displayValues=_265;
}
}),new objj_method(sel_getUid("rowType"),function(self,_266){
with(self){
return rowType;
}
}),new objj_method(sel_getUid("setRowType:"),function(self,_267,_268){
with(self){
rowType=_268;
}
}),new objj_method(sel_getUid("copy"),function(self,_269){
with(self){
var copy=objj_msgSend(objj_msgSend(_CPRuleEditorRowObject,"alloc"),"init");
objj_msgSend(copy,"setSubrows:",objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithArray:copyItems:",subrows,YES));
objj_msgSend(copy,"setCriteria:",objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithArray:copyItems:",criteria,YES));
objj_msgSend(copy,"setDisplayValues:",objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithArray:copyItems:",displayValues,YES));
objj_msgSend(copy,"setRowType:",rowType);
return copy;
}
}),new objj_method(sel_getUid("description"),function(self,_26a){
with(self){
return "<"+objj_msgSend(self,"className")+">\nsubrows = "+objj_msgSend(subrows,"description")+"\ncriteria = "+objj_msgSend(criteria,"description")+"\ndisplayValues = "+objj_msgSend(displayValues,"description");
}
}),new objj_method(sel_getUid("initWithCoder:"),function(self,_26b,_26c){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPRuleEditorRowObject").super_class},"init");
if(self!==nil){
subrows=objj_msgSend(_26c,"decodeObjectForKey:",_25a);
criteria=objj_msgSend(_26c,"decodeObjectForKey:",_259);
displayValues=objj_msgSend(_26c,"decodeObjectForKey:",_25b);
rowType=objj_msgSend(_26c,"decodeIntForKey:",_25c);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_26d,_26e){
with(self){
objj_msgSend(_26e,"encodeObject:forKey:",subrows,_25a);
objj_msgSend(_26e,"encodeObject:forKey:",criteria,_259);
objj_msgSend(_26e,"encodeObject:forKey:",displayValues,_25b);
objj_msgSend(_26e,"encodeInt:forKey:",rowType,_25c);
}
})]);
var _6=objj_allocateClassPair(CPObject,"_CPRuleEditorCache"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("rowObject"),new objj_ivar("rowIndex"),new objj_ivar("indentation")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("rowObject"),function(self,_26f){
with(self){
return rowObject;
}
}),new objj_method(sel_getUid("setRowObject:"),function(self,_270,_271){
with(self){
rowObject=_271;
}
}),new objj_method(sel_getUid("rowIndex"),function(self,_272){
with(self){
return rowIndex;
}
}),new objj_method(sel_getUid("setRowIndex:"),function(self,_273,_274){
with(self){
rowIndex=_274;
}
}),new objj_method(sel_getUid("indentation"),function(self,_275){
with(self){
return indentation;
}
}),new objj_method(sel_getUid("setIndentation:"),function(self,_276,_277){
with(self){
indentation=_277;
}
}),new objj_method(sel_getUid("description"),function(self,_278){
with(self){
return objj_msgSend(CPString,"stringWithFormat:","<%d object:%d rowIndex:%d indentation:%d>",objj_msgSend(self,"hash"),objj_msgSend(rowObject,"hash"),rowIndex,indentation);
}
})]);
var _279="CPBoundArray";
var _6=objj_allocateClassPair(CPObject,"_CPRuleEditorViewUnboundRowHolder"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("boundArray")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("init"),function(self,_27a){
with(self){
if(self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPRuleEditorViewUnboundRowHolder").super_class},"init")){
boundArray=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
}
return self;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(self,_27b,_27c){
with(self){
if(self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPRuleEditorViewUnboundRowHolder").super_class},"init")){
boundArray=objj_msgSend(_27c,"decodeObjectForKey:",_279);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_27d,_27e){
with(self){
objj_msgSend(_27e,"encodeObject:forKey:",boundArray,_279);
}
})]);
var _6=objj_allocateClassPair(CPView,"_CPRuleEditorViewSliceHolder"),_7=_6.isa;
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("addSubview:"),function(self,_27f,_280){
with(self){
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPRuleEditorViewSliceHolder").super_class},"addSubview:",_280);
}
})]);
var _281=objj_msgSend(CPColor,"colorWithHexString:","4886ca");
var _6=objj_allocateClassPair(CPView,"_CPRuleEditorViewSliceDropSeparator"),_7=_6.isa;
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("drawRect:"),function(self,_282,rect){
with(self){
var _283=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetFillColor(_283,_281);
CGContextFillRect(_283,objj_msgSend(self,"bounds"));
}
})]);
var _6=objj_getClass("CPObject");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("valueType"),function(self,_284){
with(self){
var _285=0,_286=objj_msgSend(self,"isKindOfClass:",CPString);
if(!_286){
var _287=objj_msgSend(self,"isKindOfClass:",CPView);
_285=1;
if(!_287){
var _288=objj_msgSend(self,"isKindOfClass:",CPMenuItem);
_285=2;
if(!_288){
objj_msgSend(CPException,"raise:reason:",CPGenericException,"Unknown type for "+self);
_285=-1;
}
}
}
return _285;
}
})]);
