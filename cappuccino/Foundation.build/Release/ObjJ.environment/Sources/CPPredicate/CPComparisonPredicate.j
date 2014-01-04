@STATIC;1.0;i;9;CPArray.ji;14;CPEnumerator.ji;14;CPExpression.ji;8;CPNull.ji;13;CPPredicate.ji;10;CPString.jt;12514;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPPredicate.j",YES);
objj_executeFile("CPString.j",YES);
CPDirectPredicateModifier=0;
CPAllPredicateModifier=1;
CPAnyPredicateModifier=2;
CPCaseInsensitivePredicateOption=1;
CPDiacriticInsensitivePredicateOption=2;
CPDiacriticInsensitiveSearch=128;
CPLessThanPredicateOperatorType=0;
CPLessThanOrEqualToPredicateOperatorType=1;
CPGreaterThanPredicateOperatorType=2;
CPGreaterThanOrEqualToPredicateOperatorType=3;
CPEqualToPredicateOperatorType=4;
CPNotEqualToPredicateOperatorType=5;
CPMatchesPredicateOperatorType=6;
CPLikePredicateOperatorType=7;
CPBeginsWithPredicateOperatorType=8;
CPEndsWithPredicateOperatorType=9;
CPInPredicateOperatorType=10;
CPCustomSelectorPredicateOperatorType=11;
CPContainsPredicateOperatorType=99;
CPBetweenPredicateOperatorType=100;
var _1,_2;
var _3=objj_allocateClassPair(CPPredicate,"CPComparisonPredicate"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_left"),new objj_ivar("_right"),new objj_ivar("_modifier"),new objj_ivar("_type"),new objj_ivar("_options"),new objj_ivar("_customSelector")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithLeftExpression:rightExpression:customSelector:"),function(_5,_6,_7,_8,_9){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPComparisonPredicate").super_class},"init");
if(_5){
_left=_7;
_right=_8;
_modifier=CPDirectPredicateModifier;
_type=CPCustomSelectorPredicateOperatorType;
_options=0;
_customSelector=_9;
}
return _5;
}
}),new objj_method(sel_getUid("initWithLeftExpression:rightExpression:modifier:type:options:"),function(_a,_b,_c,_d,_e,_f,_10){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPComparisonPredicate").super_class},"init");
if(_a){
_left=_c;
_right=_d;
_modifier=_e;
_type=_f;
_options=(_f!=CPMatchesPredicateOperatorType&&_f!=CPLikePredicateOperatorType&&_f!=CPBeginsWithPredicateOperatorType&&_f!=CPEndsWithPredicateOperatorType&&_f!=CPInPredicateOperatorType&&_f!=CPContainsPredicateOperatorType)?0:_10;
_customSelector=NULL;
}
return _a;
}
}),new objj_method(sel_getUid("comparisonPredicateModifier"),function(_11,_12){
with(_11){
return _modifier;
}
}),new objj_method(sel_getUid("customSelector"),function(_13,_14){
with(_13){
return _customSelector;
}
}),new objj_method(sel_getUid("leftExpression"),function(_15,_16){
with(_15){
return _left;
}
}),new objj_method(sel_getUid("options"),function(_17,_18){
with(_17){
return _options;
}
}),new objj_method(sel_getUid("predicateOperatorType"),function(_19,_1a){
with(_19){
return _type;
}
}),new objj_method(sel_getUid("rightExpression"),function(_1b,_1c){
with(_1b){
return _right;
}
}),new objj_method(sel_getUid("predicateFormat"),function(_1d,_1e){
with(_1d){
var _1f;
switch(_modifier){
case CPDirectPredicateModifier:
_1f="";
break;
case CPAllPredicateModifier:
_1f="ALL ";
break;
case CPAnyPredicateModifier:
_1f="ANY ";
break;
default:
_1f="";
break;
}
var _20;
switch(_options){
case CPCaseInsensitivePredicateOption:
_20="[c]";
break;
case CPDiacriticInsensitivePredicateOption:
_20="[d]";
break;
case CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption:
_20="[cd]";
break;
default:
_20="";
break;
}
var _21;
switch(_type){
case CPLessThanPredicateOperatorType:
_21="<";
break;
case CPLessThanOrEqualToPredicateOperatorType:
_21="<=";
break;
case CPGreaterThanPredicateOperatorType:
_21=">";
break;
case CPGreaterThanOrEqualToPredicateOperatorType:
_21=">=";
break;
case CPEqualToPredicateOperatorType:
_21="==";
break;
case CPNotEqualToPredicateOperatorType:
_21="!=";
break;
case CPMatchesPredicateOperatorType:
_21="MATCHES";
break;
case CPLikePredicateOperatorType:
_21="LIKE";
break;
case CPBeginsWithPredicateOperatorType:
_21="BEGINSWITH";
break;
case CPEndsWithPredicateOperatorType:
_21="ENDSWITH";
break;
case CPInPredicateOperatorType:
_21="IN";
break;
case CPContainsPredicateOperatorType:
_21="CONTAINS";
break;
case CPCustomSelectorPredicateOperatorType:
_21=CPStringFromSelector(_customSelector);
break;
}
return objj_msgSend(CPString,"stringWithFormat:","%s%s %s%s %s",_1f,objj_msgSend(_left,"description"),_21,_20,objj_msgSend(_right,"description"));
}
}),new objj_method(sel_getUid("predicateWithSubstitutionVariables:"),function(_22,_23,_24){
with(_22){
var _25=objj_msgSend(_left,"_expressionWithSubstitutionVariables:",_24),_26=objj_msgSend(_right,"_expressionWithSubstitutionVariables:",_24);
if(_type!=CPCustomSelectorPredicateOperatorType){
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",_25,_26,_modifier,_type,_options);
}else{
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:customSelector:",_25,_26,_customSelector);
}
}
}),new objj_method(sel_getUid("isEqual:"),function(_27,_28,_29){
with(_27){
if(_27===_29){
return YES;
}
if(_29.isa!==_27.isa||_modifier!==objj_msgSend(_29,"comparisonPredicateModifier")||_type!==objj_msgSend(_29,"predicateOperatorType")||_options!==objj_msgSend(_29,"options")||_customSelector!==objj_msgSend(_29,"customSelector")||!objj_msgSend(_left,"isEqual:",objj_msgSend(_29,"leftExpression"))||!objj_msgSend(_right,"isEqual:",objj_msgSend(_29,"rightExpression"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("_evaluateValue:rightValue:"),function(_2a,_2b,lhs,rhs){
with(_2a){
var _2c=(lhs==nil||objj_msgSend(lhs,"isEqual:",objj_msgSend(CPNull,"null"))),_2d=(rhs==nil||objj_msgSend(rhs,"isEqual:",objj_msgSend(CPNull,"null")));
if((_2c||_2d)&&_type!=CPCustomSelectorPredicateOperatorType){
return (_2c==_2d&&(_type==CPEqualToPredicateOperatorType||_type==CPLessThanOrEqualToPredicateOperatorType||_type==CPGreaterThanOrEqualToPredicateOperatorType));
}
var _2e=0;
switch(_type){
case CPLessThanPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)==CPOrderedAscending);
case CPLessThanOrEqualToPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)!=CPOrderedDescending);
case CPGreaterThanPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)==CPOrderedDescending);
case CPGreaterThanOrEqualToPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)!=CPOrderedAscending);
case CPEqualToPredicateOperatorType:
return objj_msgSend(lhs,"isEqual:",rhs);
case CPNotEqualToPredicateOperatorType:
return (!objj_msgSend(lhs,"isEqual:",rhs));
case CPMatchesPredicateOperatorType:
var _2f=(_options&CPCaseInsensitivePredicateOption)?"gi":"g";
if(_options&CPDiacriticInsensitivePredicateOption){
lhs=lhs.stripDiacritics();
rhs=rhs.stripDiacritics();
}
return (new RegExp(rhs,_2f)).test(lhs);
case CPLikePredicateOperatorType:
if(_options&CPDiacriticInsensitivePredicateOption){
lhs=lhs.stripDiacritics();
rhs=rhs.stripDiacritics();
}
var _2f=(_options&CPCaseInsensitivePredicateOption)?"gi":"g",reg=new RegExp(rhs.escapeForRegExp(),_2f);
return reg.test(lhs);
case CPBeginsWithPredicateOperatorType:
var _30=CPMakeRange(0,MIN(objj_msgSend(lhs,"length"),objj_msgSend(rhs,"length")));
if(_options&CPCaseInsensitivePredicateOption){
_2e|=CPCaseInsensitiveSearch;
}
if(_options&CPDiacriticInsensitivePredicateOption){
_2e|=CPDiacriticInsensitiveSearch;
}
return (objj_msgSend(lhs,"compare:options:range:",rhs,_2e,_30)==CPOrderedSame);
case CPEndsWithPredicateOperatorType:
var _30=CPMakeRange(MAX(objj_msgSend(lhs,"length")-objj_msgSend(rhs,"length"),0),MIN(objj_msgSend(lhs,"length"),objj_msgSend(rhs,"length")));
if(_options&CPCaseInsensitivePredicateOption){
_2e|=CPCaseInsensitiveSearch;
}
if(_options&CPDiacriticInsensitivePredicateOption){
_2e|=CPDiacriticInsensitiveSearch;
}
return (objj_msgSend(lhs,"compare:options:range:",rhs,_2e,_30)==CPOrderedSame);
case CPCustomSelectorPredicateOperatorType:
return objj_msgSend(lhs,"performSelector:withObject:",_customSelector,rhs);
case CPInPredicateOperatorType:
var a=lhs;
lhs=rhs;
rhs=a;
case CPContainsPredicateOperatorType:
if(!objj_msgSend(lhs,"isKindOfClass:",objj_msgSend(CPString,"class"))){
if(!objj_msgSend(lhs,"respondsToSelector:",sel_getUid("objectEnumerator"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The left/right hand side for a CONTAINS/IN  operator must be a collection or a string");
}
return objj_msgSend(lhs,"containsObject:",rhs);
}
if(_options&CPCaseInsensitivePredicateOption){
_2e|=CPCaseInsensitiveSearch;
}
if(_options&CPDiacriticInsensitivePredicateOption){
_2e|=CPDiacriticInsensitiveSearch;
}
return (objj_msgSend(lhs,"rangeOfString:options:",rhs,_2e).location!=CPNotFound);
case CPBetweenPredicateOperatorType:
if(objj_msgSend(rhs,"count")<2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The right hand side for a BETWEEN operator must contain 2 objects");
}
return (objj_msgSend(lhs,"compare:",rhs[0])==CPOrderedDescending&&objj_msgSend(lhs,"compare:",rhs[1])==CPOrderedAscending);
default:
return NO;
}
}
}),new objj_method(sel_getUid("evaluateWithObject:"),function(_31,_32,_33){
with(_31){
return objj_msgSend(_31,"evaluateWithObject:substitutionVariables:",_33,nil);
}
}),new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"),function(_34,_35,_36,_37){
with(_34){
var _38=objj_msgSend(_left,"expressionValueWithObject:context:",_36,_37),_39=objj_msgSend(_right,"expressionValueWithObject:context:",_36,_37);
if(_modifier==CPDirectPredicateModifier){
return objj_msgSend(_34,"_evaluateValue:rightValue:",_38,_39);
}else{
if(!objj_msgSend(_38,"respondsToSelector:",sel_getUid("objectEnumerator"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The left hand side for an ALL or ANY operator must be either a CPArray or a CPSet");
}
var e=objj_msgSend(_38,"objectEnumerator"),_3a=(_modifier==CPAllPredicateModifier),_3b;
while((_3b=objj_msgSend(e,"nextObject"))!==nil){
var _3c=objj_msgSend(_34,"_evaluateValue:rightValue:",_3b,_39);
if(_3c!=_3a){
return _3c;
}
}
return _3a;
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("predicateWithLeftExpression:rightExpression:customSelector:"),function(_3d,_3e,_3f,_40,_41){
with(_3d){
return objj_msgSend(objj_msgSend(_3d,"alloc"),"initWithLeftExpression:rightExpression:customSelector:",_3f,_40,_41);
}
}),new objj_method(sel_getUid("predicateWithLeftExpression:rightExpression:modifier:type:options:"),function(_42,_43,_44,_45,_46,_47,_48){
with(_42){
return objj_msgSend(objj_msgSend(_42,"alloc"),"initWithLeftExpression:rightExpression:modifier:type:options:",_44,_45,_46,_47,_48);
}
})]);
var _3=objj_getClass("CPComparisonPredicate");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPComparisonPredicate\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_49,_4a,_4b){
with(_49){
_49=objj_msgSendSuper({receiver:_49,super_class:objj_getClass("CPComparisonPredicate").super_class},"init");
if(_49!=nil){
_left=objj_msgSend(_4b,"decodeObjectForKey:","CPComparisonPredicateLeftExpression");
_right=objj_msgSend(_4b,"decodeObjectForKey:","CPComparisonPredicateRightExpression");
_modifier=objj_msgSend(_4b,"decodeIntForKey:","CPComparisonPredicateModifier");
_type=objj_msgSend(_4b,"decodeIntForKey:","CPComparisonPredicateType");
_options=objj_msgSend(_4b,"decodeIntForKey:","CPComparisonPredicateOptions");
_customSelector=objj_msgSend(_4b,"decodeObjectForKey:","CPComparisonPredicateCustomSelector");
}
return _49;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4e,"encodeObject:forKey:",_left,"CPComparisonPredicateLeftExpression");
objj_msgSend(_4e,"encodeObject:forKey:",_right,"CPComparisonPredicateRightExpression");
objj_msgSend(_4e,"encodeInt:forKey:",_modifier,"CPComparisonPredicateModifier");
objj_msgSend(_4e,"encodeInt:forKey:",_type,"CPComparisonPredicateType");
objj_msgSend(_4e,"encodeInt:forKey:",_options,"CPComparisonPredicateOptions");
objj_msgSend(_4e,"encodeObject:forKey:",_customSelector,"CPComparisonPredicateCustomSelector");
}
})]);
var _4f=["*","?","(",")","{","}",".","+","|","/","$","^"],_50=[".*",".?","\\(","\\)","\\{","\\}","\\.","\\+","\\|","\\/","\\$","\\^"];
String.prototype.escapeForRegExp=function(){
var _51=false,i=0;
for(;i<_4f.length;++i){
if(this.indexOf(_4f[i])!==-1){
_51=true;
break;
}
}
if(!_51){
return this;
}
var _52="";
for(i=0;i<this.length;++i){
var _53=_4f.indexOf(this.charAt(i));
if(_53!==-1){
_52+=_50[_53];
}else{
_52+=this.charAt(i);
}
}
return _52;
};
