@STATIC;1.0;t;20317;
CPUndefinedAttributeType=0;
CPInteger16AttributeType=100;
CPInteger32AttributeType=200;
CPInteger64AttributeType=300;
CPDecimalAttributeType=400;
CPDoubleAttributeType=500;
CPFloatAttributeType=600;
CPStringAttributeType=700;
CPBooleanAttributeType=800;
CPDateAttributeType=900;
CPBinaryDataAttributeType=1000;
CPTransformableAttributeType=1800;
var _1=objj_allocateClassPair(CPObject,"CPPredicateEditorRowTemplate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_templateType"),new objj_ivar("_predicateOptions"),new objj_ivar("_predicateModifier"),new objj_ivar("_leftAttributeType"),new objj_ivar("_rightAttributeType"),new objj_ivar("_leftIsWildcard"),new objj_ivar("_rightIsWildcard"),new objj_ivar("_views")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_templateType"),function(_3,_4){
with(_3){
return _templateType;
}
}),new objj_method(sel_getUid("_setTemplateType:"),function(_5,_6,_7){
with(_5){
_templateType=_7;
}
}),new objj_method(sel_getUid("_predicateOptions"),function(_8,_9){
with(_8){
return _predicateOptions;
}
}),new objj_method(sel_getUid("_setOptions:"),function(_a,_b,_c){
with(_a){
_predicateOptions=_c;
}
}),new objj_method(sel_getUid("_predicateModifier"),function(_d,_e){
with(_d){
return _predicateModifier;
}
}),new objj_method(sel_getUid("_setModifier:"),function(_f,_10,_11){
with(_f){
_predicateModifier=_11;
}
}),new objj_method(sel_getUid("leftAttributeType"),function(_12,_13){
with(_12){
return _leftAttributeType;
}
}),new objj_method(sel_getUid("_setLeftAttributeType:"),function(_14,_15,_16){
with(_14){
_leftAttributeType=_16;
}
}),new objj_method(sel_getUid("rightAttributeType"),function(_17,_18){
with(_17){
return _rightAttributeType;
}
}),new objj_method(sel_getUid("_setRightAttributeType:"),function(_19,_1a,_1b){
with(_19){
_rightAttributeType=_1b;
}
}),new objj_method(sel_getUid("leftIsWildcard"),function(_1c,_1d){
with(_1c){
return _leftIsWildcard;
}
}),new objj_method(sel_getUid("setLeftIsWildcard:"),function(_1e,_1f,_20){
with(_1e){
_leftIsWildcard=_20;
}
}),new objj_method(sel_getUid("rightIsWildcard"),function(_21,_22){
with(_21){
return _rightIsWildcard;
}
}),new objj_method(sel_getUid("setRightIsWildcard:"),function(_23,_24,_25){
with(_23){
_rightIsWildcard=_25;
}
}),new objj_method(sel_getUid("_views"),function(_26,_27){
with(_26){
return _views;
}
}),new objj_method(sel_getUid("setTemplateViews:"),function(_28,_29,_2a){
with(_28){
_views=_2a;
}
}),new objj_method(sel_getUid("initWithLeftExpressions:rightExpressions:modifier:operators:options:"),function(_2b,_2c,_2d,_2e,_2f,_30,_31){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class},"init");
if(_2b!=nil){
_templateType=1;
_leftIsWildcard=NO;
_rightIsWildcard=NO;
_leftAttributeType=0;
_rightAttributeType=0;
_predicateModifier=_2f;
_predicateOptions=_31;
var _32=objj_msgSend(_2b,"_viewFromExpressions:",_2d),_33=objj_msgSend(_2b,"_viewFromExpressions:",_2e),_34=objj_msgSend(_2b,"_viewFromOperatorTypes:",_30);
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_32,_34,_33);
}
return _2b;
}
}),new objj_method(sel_getUid("initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:"),function(_35,_36,_37,_38,_39,_3a,_3b){
with(_35){
_35=objj_msgSendSuper({receiver:_35,super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class},"init");
if(_35!=nil){
var _3c=objj_msgSend(_35,"_viewFromExpressions:",_37),_3d=objj_msgSend(_35,"_viewFromOperatorTypes:",_3a),_3e=objj_msgSend(_35,"_viewFromAttributeType:",_38);
_templateType=1;
_leftIsWildcard=NO;
_rightIsWildcard=YES;
_leftAttributeType=0;
_rightAttributeType=_38;
_predicateModifier=_39;
_predicateOptions=_3b;
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_3c,_3d,_3e);
}
return _35;
}
}),new objj_method(sel_getUid("initWithCompoundTypes:"),function(_3f,_40,_41){
with(_3f){
_3f=objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class},"init");
if(_3f!=nil){
var _42=objj_msgSend(_3f,"_viewFromCompoundTypes:",_41),_43=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"init");
objj_msgSend(_43,"addItemWithTitle:","of the following are true");
_templateType=2;
_leftIsWildcard=NO;
_rightIsWildcard=NO;
_rightAttributeType=0;
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_42,_43);
}
return _3f;
}
}),new objj_method(sel_getUid("matchForPredicate:"),function(_44,_45,_46){
with(_44){
if(objj_msgSend(_44,"_templateType")==2&&objj_msgSend(_46,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))){
if(objj_msgSend(objj_msgSend(_44,"compoundTypes"),"containsObject:",objj_msgSend(_46,"compoundPredicateType"))){
return 1;
}
}else{
if(objj_msgSend(_44,"_templateType")==1&&objj_msgSend(_46,"isKindOfClass:",objj_msgSend(CPComparisonPredicate,"class"))){
if(!_leftIsWildcard&&!objj_msgSend(objj_msgSend(_44,"leftExpressions"),"containsObject:",objj_msgSend(_46,"leftExpression"))){
return 0;
}
if(!objj_msgSend(objj_msgSend(_44,"operators"),"containsObject:",objj_msgSend(_46,"predicateOperatorType"))){
return 0;
}
if(!_rightIsWildcard&&!objj_msgSend(objj_msgSend(_44,"rightExpressions"),"containsObject:",objj_msgSend(_46,"rightExpression"))){
return 0;
}
return 1;
}
}
return 0;
}
}),new objj_method(sel_getUid("templateViews"),function(_47,_48){
with(_47){
return _views;
}
}),new objj_method(sel_getUid("setPredicate:"),function(_49,_4a,_4b){
with(_49){
if(_templateType==2){
objj_msgSend(_49,"_setCompoundPredicate:",_4b);
}else{
objj_msgSend(_49,"_setComparisonPredicate:",_4b);
}
}
}),new objj_method(sel_getUid("displayableSubpredicatesOfPredicate:"),function(_4c,_4d,_4e){
with(_4c){
if(objj_msgSend(_4e,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))){
var _4f=objj_msgSend(_4e,"subpredicates");
if(objj_msgSend(_4f,"count")==0){
return nil;
}
return _4f;
}
return nil;
}
}),new objj_method(sel_getUid("predicateWithSubpredicates:"),function(_50,_51,_52){
with(_50){
if(_templateType==2){
var _53=objj_msgSend(objj_msgSend(_views[0],"selectedItem"),"representedObject");
return objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",_53,_52);
}
if(_templateType==1){
var lhs=objj_msgSend(_50,"_leftExpression"),rhs=objj_msgSend(_50,"_rightExpression"),_54=objj_msgSend(objj_msgSend(_views[1],"selectedItem"),"representedObject");
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",lhs,rhs,objj_msgSend(_50,"modifier"),_54,objj_msgSend(_50,"options"));
}
return nil;
}
}),new objj_method(sel_getUid("leftExpressions"),function(_55,_56){
with(_55){
if(_templateType==1&&!_leftIsWildcard){
var _57=objj_msgSend(_views,"objectAtIndex:",0);
return objj_msgSend(objj_msgSend(_57,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("rightExpressions"),function(_58,_59){
with(_58){
if(_templateType==1&&!_rightIsWildcard){
var _5a=objj_msgSend(_views,"objectAtIndex:",2);
return objj_msgSend(objj_msgSend(_5a,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("compoundTypes"),function(_5b,_5c){
with(_5b){
if(_templateType==2){
var _5d=objj_msgSend(_views,"objectAtIndex:",0);
return objj_msgSend(objj_msgSend(_5d,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("modifier"),function(_5e,_5f){
with(_5e){
if(_templateType==1){
return _predicateModifier;
}
return nil;
}
}),new objj_method(sel_getUid("operators"),function(_60,_61){
with(_60){
if(_templateType==1){
var _62=objj_msgSend(_views,"objectAtIndex:",1);
return objj_msgSend(objj_msgSend(_62,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("options"),function(_63,_64){
with(_63){
if(_templateType==1){
return _predicateOptions;
}
return nil;
}
}),new objj_method(sel_getUid("rightExpressionAttributeType"),function(_65,_66){
with(_65){
return _rightAttributeType;
}
}),new objj_method(sel_getUid("leftExpressionAttributeType"),function(_67,_68){
with(_67){
return _leftAttributeType;
}
}),new objj_method(sel_getUid("_setCompoundPredicate:"),function(_69,_6a,_6b){
with(_69){
var _6c=objj_msgSend(_views,"objectAtIndex:",0),_6d=objj_msgSend(_6b,"compoundPredicateType"),_6e=objj_msgSend(_6c,"indexOfItemWithRepresentedObject:",_6d);
objj_msgSend(_6c,"selectItemAtIndex:",_6e);
}
}),new objj_method(sel_getUid("_setComparisonPredicate:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(_views,"objectAtIndex:",0),_73=objj_msgSend(_views,"objectAtIndex:",1),_74=objj_msgSend(_views,"objectAtIndex:",2),_75=objj_msgSend(_71,"leftExpression"),_76=objj_msgSend(_71,"rightExpression"),_77=objj_msgSend(_71,"predicateOperatorType");
if(_leftIsWildcard){
objj_msgSend(_72,"setObjectValue:",objj_msgSend(_75,"constantValue"));
}else{
var _78=objj_msgSend(_72,"indexOfItemWithRepresentedObject:",_75);
objj_msgSend(_72,"selectItemAtIndex:",_78);
}
var _79=objj_msgSend(_73,"indexOfItemWithRepresentedObject:",_77);
objj_msgSend(_73,"selectItemAtIndex:",_79);
if(_rightIsWildcard){
objj_msgSend(_74,"setObjectValue:",objj_msgSend(_76,"constantValue"));
}else{
var _78=objj_msgSend(_74,"indexOfItemWithRepresentedObject:",_76);
objj_msgSend(_74,"selectItemAtIndex:",_78);
}
}
}),new objj_method(sel_getUid("_leftExpression"),function(_7a,_7b){
with(_7a){
return objj_msgSend(_7a,"_expressionFromView:forAttributeType:",_views[0],_leftAttributeType);
}
}),new objj_method(sel_getUid("_rightExpression"),function(_7c,_7d){
with(_7c){
return objj_msgSend(_7c,"_expressionFromView:forAttributeType:",_views[2],_rightAttributeType);
}
}),new objj_method(sel_getUid("_expressionFromView:forAttributeType:"),function(_7e,_7f,_80,_81){
with(_7e){
if(_81==0){
return objj_msgSend(objj_msgSend(_80,"selectedItem"),"representedObject");
}
var _82;
if(_81>=CPInteger16AttributeType&&_81<=CPFloatAttributeType){
_82=objj_msgSend(_80,"intValue");
}else{
if(_81==CPBooleanAttributeType){
_82=objj_msgSend(_80,"state");
}else{
_82=objj_msgSend(_80,"stringValue");
}
}
return objj_msgSend(CPExpression,"expressionForConstantValue:",_82);
}
}),new objj_method(sel_getUid("_rowType"),function(_83,_84){
with(_83){
return (_templateType-1);
}
}),new objj_method(sel_getUid("copy"),function(_85,_86){
with(_85){
return objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_85));
}
}),new objj_method(sel_getUid("_templateType"),function(_87,_88){
with(_87){
return _templateType;
}
}),new objj_method(sel_getUid("_displayValueForPredicateOperator:"),function(_89,_8a,_8b){
with(_89){
var _8c;
switch(_8b){
case CPLessThanPredicateOperatorType:
_8c="is less than";
break;
case CPLessThanOrEqualToPredicateOperatorType:
_8c="is less than or equal to";
break;
case CPGreaterThanPredicateOperatorType:
_8c="is greater than";
break;
case CPGreaterThanOrEqualToPredicateOperatorType:
_8c="is greater than or equal to";
break;
case CPEqualToPredicateOperatorType:
_8c="is";
break;
case CPNotEqualToPredicateOperatorType:
_8c="is not";
break;
case CPMatchesPredicateOperatorType:
_8c="matches";
break;
case CPLikePredicateOperatorType:
_8c="is like";
break;
case CPBeginsWithPredicateOperatorType:
_8c="begins with";
break;
case CPEndsWithPredicateOperatorType:
_8c="ends with";
break;
case CPInPredicateOperatorType:
_8c="in";
break;
case CPContainsPredicateOperatorType:
_8c="contains";
break;
case CPBetweenPredicateOperatorType:
_8c="between";
break;
default:
CPLogConsole("unknown predicate operator %d"+_8b);
}
return _8c;
}
}),new objj_method(sel_getUid("_displayValueForCompoundPredicateType:"),function(_8d,_8e,_8f){
with(_8d){
var _90;
switch(_8f){
case CPNotPredicateType:
_90="None";
break;
case CPAndPredicateType:
_90="All";
break;
case CPOrPredicateType:
_90="Any";
break;
default:
_90=objj_msgSend(CPString,"stringWithFormat:","unknown compound predicate type %d",_8f);
}
return _90;
}
}),new objj_method(sel_getUid("_displayValueForConstantValue:"),function(_91,_92,_93){
with(_91){
return objj_msgSend(_93,"description");
}
}),new objj_method(sel_getUid("_displayValueForKeyPath:"),function(_94,_95,_96){
with(_94){
return _96;
}
}),new objj_method(sel_getUid("_viewFromExpressions:"),function(_97,_98,_99){
with(_97){
var _9a=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CPMakeRect(0,0,100,18)),_9b=objj_msgSend(_99,"count");
for(var i=0;i<_9b;i++){
var exp=_99[i],_9c=objj_msgSend(exp,"expressionType"),_9d;
switch(_9c){
case CPKeyPathExpressionType:
_9d=objj_msgSend(_97,"_displayValueForKeyPath:",objj_msgSend(exp,"keyPath"));
break;
case CPConstantValueExpressionType:
_9d=objj_msgSend(_97,"_displayValueForConstantValue:",objj_msgSend(exp,"constantValue"));
break;
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid Expression type "+_9c);
break;
}
var _9e=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_9d,nil,"");
objj_msgSend(_9e,"setRepresentedObject:",exp);
objj_msgSend(_9a,"addItem:",_9e);
}
objj_msgSend(_9a,"sizeToFit");
return _9a;
}
}),new objj_method(sel_getUid("_viewFromOperatorTypes:"),function(_9f,_a0,_a1){
with(_9f){
var _a2=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,100,18)),_a3=objj_msgSend(_a1,"count");
for(var i=0;i<_a3;i++){
var op=_a1[i],_a4=objj_msgSend(_9f,"_displayValueForPredicateOperator:",op),_a5=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_a4,nil,"");
objj_msgSend(_a5,"setRepresentedObject:",op);
objj_msgSend(_a2,"addItem:",_a5);
}
objj_msgSend(_a2,"sizeToFit");
return _a2;
}
}),new objj_method(sel_getUid("_viewFromCompoundTypes:"),function(_a6,_a7,_a8){
with(_a6){
var _a9=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,100,18)),_aa=objj_msgSend(_a8,"count");
for(var i=0;i<_aa;i++){
var _ab=_a8[i],_ac=objj_msgSend(_a6,"_displayValueForCompoundPredicateType:",_ab),_ad=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_ac,nil,"");
objj_msgSend(_ad,"setRepresentedObject:",_ab);
objj_msgSend(_a9,"addItem:",_ad);
}
objj_msgSend(_a9,"sizeToFit");
return _a9;
}
}),new objj_method(sel_getUid("_viewFromAttributeType:"),function(_ae,_af,_b0){
with(_ae){
var _b1;
if(_b0>=CPInteger16AttributeType&&_b0<=CPFloatAttributeType){
_b1=objj_msgSend(_ae,"_textFieldWithFrame:",CGRectMake(0,0,50,26));
}else{
if(_b0==CPStringAttributeType){
_b1=objj_msgSend(_ae,"_textFieldWithFrame:",CGRectMake(0,0,150,26));
}else{
if(_b0==CPBooleanAttributeType){
_b1=objj_msgSend(objj_msgSend(CPCheckBox,"alloc"),"initWithFrame:",CGRectMake(0,0,50,26));
}else{
if(_b0==CPDateAttributeType){
_b1=objj_msgSend(objj_msgSend(CPDatePicker,"alloc"),"initWithFrame:",CGRectMake(0,0,150,26));
}else{
return nil;
}
}
}
}
objj_msgSend(_b1,"setTag:",_b0);
return _b1;
}
}),new objj_method(sel_getUid("_textFieldWithFrame:"),function(_b2,_b3,_b4){
with(_b2){
var _b5=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",_b4);
objj_msgSend(_b5,"setBezeled:",YES);
objj_msgSend(_b5,"setBezelStyle:",CPTextFieldSquareBezel);
objj_msgSend(_b5,"setBordered:",YES);
objj_msgSend(_b5,"setEditable:",YES);
objj_msgSend(_b5,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
objj_msgSend(_b5,"setSendsActionOnEndEditing:",YES);
return _b5;
}
}),new objj_method(sel_getUid("_setOptions:"),function(_b6,_b7,_b8){
with(_b6){
_predicateOptions=_b8;
}
}),new objj_method(sel_getUid("_setModifier:"),function(_b9,_ba,_bb){
with(_b9){
_predicateModifier=_bb;
}
}),new objj_method(sel_getUid("description"),function(_bc,_bd){
with(_bc){
if(_templateType==2){
return objj_msgSend(CPString,"stringWithFormat:","<%@ %p %@>",objj_msgSend(_bc,"className"),_bc,objj_msgSend(objj_msgSend(_bc,"compoundTypes"),"componentsJoinedByString:",", "));
}else{
if(_templateType==1&&_rightIsWildcard){
return objj_msgSend(CPString,"stringWithFormat:","<%@ %p [%@] [%@] %d>",objj_msgSend(_bc,"className"),_bc,objj_msgSend(objj_msgSend(_bc,"leftExpressions"),"componentsJoinedByString:",", "),objj_msgSend(objj_msgSend(_bc,"operators"),"componentsJoinedByString:",", "),objj_msgSend(_bc,"rightExpressionAttributeType"));
}else{
return objj_msgSend(CPString,"stringWithFormat:","<%@ %p [%@] [%@] [%@]>",objj_msgSend(_bc,"className"),_bc,objj_msgSend(objj_msgSend(_bc,"leftExpressions"),"componentsJoinedByString:",", "),objj_msgSend(objj_msgSend(_bc,"operators"),"componentsJoinedByString:",", "),objj_msgSend(objj_msgSend(_bc,"rightExpressions"),"componentsJoinedByString:",", "));
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("_bestMatchForPredicate:inTemplates:quality:"),function(_be,_bf,_c0,_c1,_c2){
with(_be){
var _c3=objj_msgSend(_c1,"count"),_c4=0,_c5=CPNotFound,i;
for(i=0;i<_c3;i++){
var _c6=objj_msgSend(_c1,"objectAtIndex:",i),_c7=objj_msgSend(_c6,"matchForPredicate:",_c0);
if(_c7>_c4){
_c5=i;
_c4=_c7;
}
}
if(_c5==CPNotFound){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"Unable to find template matching predicate: "+objj_msgSend(_c0,"predicateFormat"));
return nil;
}
return objj_msgSend(_c1,"objectAtIndex:",_c5);
}
}),new objj_method(sel_getUid("_operatorsForAttributeType:"),function(_c8,_c9,_ca){
with(_c8){
var _cb=objj_msgSend(CPMutableArray,"array");
switch(_ca){
case CPInteger16AttributeType:
objj_msgSend(_cb,"addObjects:",4,5,0,2,1,3);
break;
case CPInteger32AttributeType:
objj_msgSend(_cb,"addObjects:",4,5,0,2,1,3);
break;
case CPInteger64AttributeType:
objj_msgSend(_cb,"addObjects:",4,5,0,2,1,3);
break;
case CPDecimalAttributeType:
objj_msgSend(_cb,"addObjects:",4,5,0,2,1,3);
break;
case CPDoubleAttributeType:
objj_msgSend(_cb,"addObjects:",4,5,0,2,1,3);
break;
case CPFloatAttributeType:
objj_msgSend(_cb,"addObjects:",4,5,0,2,1,3);
break;
case CPStringAttributeType:
objj_msgSend(_cb,"addObjects:",99,4,5,8,9);
break;
case CPBooleanAttributeType:
objj_msgSend(_cb,"addObjects:",4,5);
break;
case CPDateAttributeType:
objj_msgSend(_cb,"addObjects:",4,5,0,2,1,3);
break;
default:
CPLogConsole("Cannot create operators for an CPAttributeType "+_ca);
break;
}
return _cb;
}
})]);
var _cc="CPPredicateTemplateType",_cd="CPPredicateTemplateOptions",_ce="CPPredicateTemplateModifier",_cf="CPPredicateTemplateLeftAttributeType",_d0="CPPredicateTemplateRightAttributeType",_d1="CPPredicateTemplateLeftIsWildcard",_d2="CPPredicateTemplateRightIsWildcard",_d3="CPPredicateTemplateViews";
var _1=objj_getClass("CPPredicateEditorRowTemplate");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditorRowTemplate\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_d4,_d5,_d6){
with(_d4){
_d4=objj_msgSendSuper({receiver:_d4,super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class},"init");
if(_d4!=nil){
_templateType=objj_msgSend(_d6,"decodeIntForKey:",_cc);
_predicateOptions=objj_msgSend(_d6,"decodeIntForKey:",_cd);
_predicateModifier=objj_msgSend(_d6,"decodeIntForKey:",_ce);
_leftAttributeType=objj_msgSend(_d6,"decodeIntForKey:",_cf);
_rightAttributeType=objj_msgSend(_d6,"decodeIntForKey:",_d0);
_leftIsWildcard=objj_msgSend(_d6,"decodeBoolForKey:",_d1);
_rightIsWildcard=objj_msgSend(_d6,"decodeBoolForKey:",_d2);
_views=objj_msgSend(_d6,"decodeObjectForKey:",_d3);
if(_templateType==1&&_leftIsWildcard==NO){
var _d7=objj_msgSend(_views[0],"itemArray"),_d8=objj_msgSend(_d7,"count");
for(var i=0;i<_d8;i++){
var _d9=_d7[i];
if(objj_msgSend(_d9,"representedObject")==nil){
var exp=objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_d9,"title"));
objj_msgSend(_d9,"setRepresentedObject:",exp);
}
}
}
}
return _d4;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_da,_db,_dc){
with(_da){
objj_msgSend(_dc,"encodeInt:forKey:",_templateType,_cc);
objj_msgSend(_dc,"encodeInt:forKey:",_predicateOptions,_cd);
objj_msgSend(_dc,"encodeInt:forKey:",_predicateModifier,_ce);
objj_msgSend(_dc,"encodeInt:forKey:",_leftAttributeType,_cf);
objj_msgSend(_dc,"encodeInt:forKey:",_rightAttributeType,_d0);
objj_msgSend(_dc,"encodeBool:forKey:",_leftIsWildcard,_d1);
objj_msgSend(_dc,"encodeBool:forKey:",_rightIsWildcard,_d2);
objj_msgSend(_dc,"encodeObject:forKey:",_views,_d3);
}
})]);
