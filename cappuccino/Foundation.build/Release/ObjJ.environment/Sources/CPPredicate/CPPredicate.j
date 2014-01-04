@STATIC;1.0;i;9;CPArray.ji;13;CPException.ji;8;CPNull.ji;10;CPObject.ji;11;CPScanner.ji;7;CPSet.ji;9;CPValue.ji;16;CPCharacterSet.ji;21;CPCompoundPredicate.ji;23;CPComparisonPredicate.ji;14;CPExpression.jt;24138;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPScanner.j",YES);
objj_executeFile("CPSet.j",YES);
objj_executeFile("CPValue.j",YES);
objj_executeFile("CPCharacterSet.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPPredicate"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("predicateWithSubstitutionVariables:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("evaluateWithObject:"),function(_6,_7,_8){
with(_6){
}
}),new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"),function(_9,_a,_b,_c){
with(_9){
}
}),new objj_method(sel_getUid("predicateFormat"),function(_d,_e){
with(_d){
}
}),new objj_method(sel_getUid("description"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"predicateFormat");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("predicateWithFormat:"),function(_11,_12,_13){
with(_11){
if(!_13){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_12+" the format can't be 'nil'");
}
var _14=Array.prototype.slice.call(arguments,3);
return objj_msgSend(_11,"predicateWithFormat:argumentArray:",arguments[2],_14);
}
}),new objj_method(sel_getUid("predicateWithFormat:argumentArray:"),function(_15,_16,_17,_18){
with(_15){
if(!_17){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_16+" the format can't be 'nil'");
}
var s=objj_msgSend(objj_msgSend(CPPredicateScanner,"alloc"),"initWithString:args:",_17,_18),p=objj_msgSend(s,"parse");
return p;
}
}),new objj_method(sel_getUid("predicateWithFormat:arguments:"),function(_19,_1a,_1b,_1c){
with(_19){
return nil;
}
}),new objj_method(sel_getUid("predicateWithValue:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(objj_msgSend(CPPredicate_BOOL,"alloc"),"initWithBool:",_1f);
}
})]);
var _1=objj_allocateClassPair(CPPredicate,"CPPredicate_BOOL"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_value")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithBool:"),function(_20,_21,_22){
with(_20){
_value=_22;
return _20;
}
}),new objj_method(sel_getUid("isEqual:"),function(_23,_24,_25){
with(_23){
if(_23===_25){
return YES;
}
if(_23.isa!==_25.isa||_value!==objj_msgSend(_25,"evaluateObject:",nil)){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("evaluateObject:"),function(_26,_27,_28){
with(_26){
return _value;
}
}),new objj_method(sel_getUid("predicateFormat"),function(_29,_2a){
with(_29){
return (_value)?"TRUEPREDICATE":"FALSEPREDICATE";
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("filteredArrayUsingPredicate:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(_2b,"count"),_2f=objj_msgSend(CPArray,"array"),i=0;
for(;i<_2e;i++){
var _30=objj_msgSend(_2b,"objectAtIndex:",i);
if(objj_msgSend(_2d,"evaluateWithObject:",_30)){
_2f.push(_30);
}
}
return _2f;
}
}),new objj_method(sel_getUid("filterUsingPredicate:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_31,"count");
while(_34--){
if(!objj_msgSend(_33,"evaluateWithObject:",objj_msgSend(_31,"objectAtIndex:",_34))){
splice(_34,1);
}
}
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("filteredSetUsingPredicate:"),function(_35,_36,_37){
with(_35){
var _38=objj_msgSend(_35,"count"),_39=objj_msgSend(CPSet,"set"),i=0;
for(;i<_38;i++){
var _3a=objj_msgSend(_35,"objectAtIndex:",i);
if(objj_msgSend(_37,"evaluateWithObject:",_3a)){
objj_msgSend(_39,"addObject:",_3a);
}
}
return _39;
}
}),new objj_method(sel_getUid("filterUsingPredicate:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=objj_msgSend(_3b,"count");
while(--_3e>=0){
var _3f=objj_msgSend(_3b,"objectAtIndex:",_3e);
if(!objj_msgSend(_3d,"evaluateWithObject:",_3f)){
objj_msgSend(_3b,"removeObjectAtIndex:",_3e);
}
}
}
})]);
var _1=objj_allocateClassPair(CPScanner,"CPPredicateScanner"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_args"),new objj_ivar("_retrieved")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:args:"),function(_40,_41,_42,_43){
with(_40){
_40=objj_msgSendSuper({receiver:_40,super_class:objj_getClass("CPPredicateScanner").super_class},"initWithString:",_42);
if(_40){
_args=objj_msgSend(_43,"objectEnumerator");
}
return _40;
}
}),new objj_method(sel_getUid("nextArg"),function(_44,_45){
with(_44){
return objj_msgSend(_args,"nextObject");
}
}),new objj_method(sel_getUid("scanPredicateKeyword:"),function(_46,_47,key){
with(_46){
var loc=objj_msgSend(_46,"scanLocation");
objj_msgSend(_46,"setCaseSensitive:",NO);
if(!objj_msgSend(_46,"scanString:intoString:",key,NULL)){
return NO;
}
if(objj_msgSend(_46,"isAtEnd")){
return YES;
}
var c=objj_msgSend(objj_msgSend(_46,"string"),"characterAtIndex:",objj_msgSend(_46,"scanLocation"));
if(!objj_msgSend(objj_msgSend(CPCharacterSet,"alphanumericCharacterSet"),"characterIsMember:",c)){
return YES;
}
objj_msgSend(_46,"setScanLocation:",loc);
return NO;
}
}),new objj_method(sel_getUid("parse"),function(_48,_49){
with(_48){
var r=nil;
try{
objj_msgSend(_48,"setCharactersToBeSkipped:",objj_msgSend(CPCharacterSet,"whitespaceCharacterSet"));
r=objj_msgSend(_48,"parsePredicate");
}
catch(error){
CPLogConsole("Unable to parse predicate '"+objj_msgSend(_48,"string")+"' with "+error);
}
finally{
if(!objj_msgSend(_48,"isAtEnd")){
var _4a=objj_msgSend(_48,"string"),loc=objj_msgSend(_48,"scanLocation");
CPLogConsole("Format string contains extra characters: '"+objj_msgSend(_4a,"substringToIndex:",loc)+"**"+objj_msgSend(_4a,"substringFromIndex:",loc)+"**'");
}
}
return r;
}
}),new objj_method(sel_getUid("parsePredicate"),function(_4b,_4c){
with(_4b){
return objj_msgSend(_4b,"parseAnd");
}
}),new objj_method(sel_getUid("parseAnd"),function(_4d,_4e){
with(_4d){
var l=objj_msgSend(_4d,"parseOr");
while(objj_msgSend(_4d,"scanPredicateKeyword:","AND")||objj_msgSend(_4d,"scanPredicateKeyword:","&&")){
var r=objj_msgSend(_4d,"parseOr");
if(objj_msgSend(r,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(r,"compoundPredicateType")==CPAndPredicateType){
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPAndPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObjectsFromArray:",objj_msgSend(r,"subpredicates"));
}else{
objj_msgSend(objj_msgSend(r,"subpredicates"),"insertObject:atIndex:",l,0);
l=r;
}
}else{
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPAndPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObject:",r);
}else{
l=objj_msgSend(CPCompoundPredicate,"andPredicateWithSubpredicates:",objj_msgSend(CPArray,"arrayWithObjects:",l,r));
}
}
}
return l;
}
}),new objj_method(sel_getUid("parseNot"),function(_4f,_50){
with(_4f){
if(objj_msgSend(_4f,"scanString:intoString:","(",NULL)){
var r=objj_msgSend(_4f,"parsePredicate");
if(!objj_msgSend(_4f,"scanString:intoString:",")",NULL)){
_51(_4f,"predicate");
}
return r;
}
if(objj_msgSend(_4f,"scanPredicateKeyword:","NOT")||objj_msgSend(_4f,"scanPredicateKeyword:","!")){
return objj_msgSend(CPCompoundPredicate,"notPredicateWithSubpredicate:",objj_msgSend(_4f,"parseNot"));
}
if(objj_msgSend(_4f,"scanPredicateKeyword:","TRUEPREDICATE")){
return objj_msgSend(CPPredicate,"predicateWithValue:",YES);
}
if(objj_msgSend(_4f,"scanPredicateKeyword:","FALSEPREDICATE")){
return objj_msgSend(CPPredicate,"predicateWithValue:",NO);
}
return objj_msgSend(_4f,"parseComparison");
}
}),new objj_method(sel_getUid("parseOr"),function(_52,_53){
with(_52){
var l=objj_msgSend(_52,"parseNot");
while(objj_msgSend(_52,"scanPredicateKeyword:","OR")||objj_msgSend(_52,"scanPredicateKeyword:","||")){
var r=objj_msgSend(_52,"parseNot");
if(objj_msgSend(r,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(r,"compoundPredicateType")==CPOrPredicateType){
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPOrPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObjectsFromArray:",objj_msgSend(r,"subpredicates"));
}else{
objj_msgSend(objj_msgSend(r,"subpredicates"),"insertObject:atIndex:",l,0);
l=r;
}
}else{
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPOrPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObject:",r);
}else{
l=objj_msgSend(CPCompoundPredicate,"orPredicateWithSubpredicates:",objj_msgSend(CPArray,"arrayWithObjects:",l,r));
}
}
}
return l;
}
}),new objj_method(sel_getUid("parseComparison"),function(_54,_55){
with(_54){
var _56=CPDirectPredicateModifier,_57=0,_58=0,_59,_5a,p,_5b=NO;
if(objj_msgSend(_54,"scanPredicateKeyword:","ANY")){
_56=CPAnyPredicateModifier;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","ALL")){
_56=CPAllPredicateModifier;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","NONE")){
_56=CPAnyPredicateModifier;
_5b=YES;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","SOME")){
_56=CPAllPredicateModifier;
_5b=YES;
}
}
}
}
_59=objj_msgSend(_54,"parseExpression");
if(objj_msgSend(_54,"scanString:intoString:","!=",NULL)||objj_msgSend(_54,"scanString:intoString:","<>",NULL)){
_57=CPNotEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanString:intoString:","<=",NULL)||objj_msgSend(_54,"scanString:intoString:","=<",NULL)){
_57=CPLessThanOrEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanString:intoString:",">=",NULL)||objj_msgSend(_54,"scanString:intoString:","=>",NULL)){
_57=CPGreaterThanOrEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanString:intoString:","<",NULL)){
_57=CPLessThanPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanString:intoString:",">",NULL)){
_57=CPGreaterThanPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanString:intoString:","==",NULL)||objj_msgSend(_54,"scanString:intoString:","=",NULL)){
_57=CPEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","MATCHES")){
_57=CPMatchesPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","LIKE")){
_57=CPLikePredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","BEGINSWITH")){
_57=CPBeginsWithPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","ENDSWITH")){
_57=CPEndsWithPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","IN")){
_57=CPInPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","CONTAINS")){
_57=CPContainsPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","BETWEEN")){
_57=CPBetweenPredicateOperatorType;
}else{
_51(_54,"comparison predicate");
}
}
}
}
}
}
}
}
}
}
}
}
}
if(objj_msgSend(_54,"scanString:intoString:","[cd]",NULL)){
_58=CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption;
}else{
if(objj_msgSend(_54,"scanString:intoString:","[c]",NULL)){
_58=CPCaseInsensitivePredicateOption;
}else{
if(objj_msgSend(_54,"scanString:intoString:","[d]",NULL)){
_58=CPDiacriticInsensitivePredicateOption;
}
}
}
_5a=objj_msgSend(_54,"parseExpression");
p=objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",_59,_5a,_56,_57,_58);
return _5b?objj_msgSend(CPCompoundPredicate,"notPredicateWithSubpredicate:",p):p;
}
}),new objj_method(sel_getUid("parseExpression"),function(_5c,_5d){
with(_5c){
return objj_msgSend(_5c,"parseBinaryExpression");
}
}),new objj_method(sel_getUid("parseSimpleExpression"),function(_5e,_5f){
with(_5e){
var _60,_61,_62,dbl;
if(objj_msgSend(_5e,"scanDouble:",function(_63){
var _64=dbl;
if(typeof _63!="undefined"){
dbl=_63;
}
return _64;
})){
return objj_msgSend(CPExpression,"expressionForConstantValue:",dbl);
}
if(objj_msgSend(_5e,"scanString:intoString:","-",NULL)){
return objj_msgSend(CPExpression,"expressionForFunction:arguments:","chs:",objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_5e,"parseExpression")));
}
if(objj_msgSend(_5e,"scanString:intoString:","(",NULL)){
var arg=objj_msgSend(_5e,"parseExpression");
if(!objj_msgSend(_5e,"scanString:intoString:",")",NULL)){
_51(_5e,"expression");
}
return arg;
}
if(objj_msgSend(_5e,"scanString:intoString:","{",NULL)){
if(objj_msgSend(_5e,"scanString:intoString:","}",NULL)){
return objj_msgSend(CPExpression,"expressionForConstantValue:",a);
}
var a=[];
objj_msgSend(a,"addObject:",objj_msgSend(_5e,"parseExpression"));
while(objj_msgSend(_5e,"scanString:intoString:",",",NULL)){
objj_msgSend(a,"addObject:",objj_msgSend(_5e,"parseExpression"));
}
if(!objj_msgSend(_5e,"scanString:intoString:","}",NULL)){
_51(_5e,"expression");
}
return objj_msgSend(CPExpression,"expressionForAggregate:",a);
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","NULL")||objj_msgSend(_5e,"scanPredicateKeyword:","NIL")){
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPNull,"null"));
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","TRUE")||objj_msgSend(_5e,"scanPredicateKeyword:","YES")){
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPNumber,"numberWithBool:",YES));
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","FALSE")||objj_msgSend(_5e,"scanPredicateKeyword:","NO")){
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPNumber,"numberWithBool:",NO));
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","SELF")){
return objj_msgSend(CPExpression,"expressionForEvaluatedObject");
}
if(objj_msgSend(_5e,"scanString:intoString:","$",NULL)){
var _65=objj_msgSend(_5e,"parseSimpleExpression");
if(!objj_msgSend(_65,"keyPath")){
_51(_5e,"expression");
}
return objj_msgSend(CPExpression,"expressionForVariable:",_65);
}
_61=objj_msgSend(_5e,"scanLocation");
if(objj_msgSend(_5e,"scanString:intoString:","%",NULL)){
if(objj_msgSend(_5e,"isAtEnd")==NO){
var c=objj_msgSend(objj_msgSend(_5e,"string"),"characterAtIndex:",objj_msgSend(_5e,"scanLocation"));
switch(c){
case "%":
_61=objj_msgSend(_5e,"scanLocation");
break;
case "K":
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_5e,"nextArg"));
case "@":
case "c":
case "C":
case "d":
case "D":
case "i":
case "o":
case "O":
case "u":
case "U":
case "x":
case "X":
case "e":
case "E":
case "f":
case "g":
case "G":
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_5e,"nextArg"));
case "h":
objj_msgSend(_5e,"scanString:intoString:","h",NULL);
if(objj_msgSend(_5e,"isAtEnd")==NO){
c=objj_msgSend(objj_msgSend(_5e,"string"),"characterAtIndex:",objj_msgSend(_5e,"scanLocation"));
if(c=="i"||c=="u"){
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_5e,"nextArg"));
}
}
break;
case "q":
objj_msgSend(_5e,"scanString:intoString:","q",NULL);
if(objj_msgSend(_5e,"isAtEnd")==NO){
c=objj_msgSend(objj_msgSend(_5e,"string"),"characterAtIndex:",objj_msgSend(_5e,"scanLocation"));
if(c=="i"||c=="u"||c=="x"||c=="X"){
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_5e,"nextArg"));
}
}
break;
}
}
objj_msgSend(_5e,"setScanLocation:",_61);
}
if(objj_msgSend(_5e,"scanString:intoString:","\"",NULL)){
var _66=objj_msgSend(_5e,"charactersToBeSkipped"),str="";
objj_msgSend(_5e,"setCharactersToBeSkipped:",nil);
objj_msgSend(_5e,"scanUpToString:intoString:","\"",function(_67){
var _68=str;
if(typeof _67!="undefined"){
str=_67;
}
return _68;
});
if(objj_msgSend(_5e,"scanString:intoString:","\"",NULL)==NO){
_51(_5e,"expression");
}
objj_msgSend(_5e,"setCharactersToBeSkipped:",_66);
return objj_msgSend(CPExpression,"expressionForConstantValue:",str);
}
if(objj_msgSend(_5e,"scanString:intoString:","'",NULL)){
var _66=objj_msgSend(_5e,"charactersToBeSkipped"),str="";
objj_msgSend(_5e,"setCharactersToBeSkipped:",nil);
objj_msgSend(_5e,"scanUpToString:intoString:","'",function(_69){
var _6a=str;
if(typeof _69!="undefined"){
str=_69;
}
return _6a;
});
if(objj_msgSend(_5e,"scanString:intoString:","'",NULL)==NO){
_51(_5e,"expression");
}
objj_msgSend(_5e,"setCharactersToBeSkipped:",_66);
return objj_msgSend(CPExpression,"expressionForConstantValue:",str);
}
if(objj_msgSend(_5e,"scanString:intoString:","@",NULL)){
var e=objj_msgSend(_5e,"parseExpression");
if(!objj_msgSend(e,"keyPath")){
_51(_5e,"expression");
}
return objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(e,"keyPath")+"@");
}
if(objj_msgSend(_5e,"scanString:intoString:","SUBQUERY",NULL)){
if(!objj_msgSend(_5e,"scanString:intoString:","(",NULL)){
_51(_5e,"expression");
}
var _6b=objj_msgSend(_5e,"parseExpression"),_6c,_6d;
if(!objj_msgSend(_5e,"scanString:intoString:",",",NULL)){
_51(_5e,"expression");
}
_6c=objj_msgSend(_5e,"parseExpression");
if(!objj_msgSend(_5e,"scanString:intoString:",",",NULL)){
_51(_5e,"expression");
}
_6d=objj_msgSend(_5e,"parsePredicate");
if(!objj_msgSend(_5e,"scanString:intoString:",")",NULL)){
_51(_5e,"expression");
}
return objj_msgSend(objj_msgSend(_CPSubqueryExpression,"alloc"),"initWithExpression:usingIteratorExpression:predicate:",_6b,_6c,_6d);
}
if(objj_msgSend(_5e,"scanString:intoString:","FUNCTION",NULL)){
if(!objj_msgSend(_5e,"scanString:intoString:","(",NULL)){
_51(_5e,"expression");
}
var _6e=objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_5e,"parseExpression"));
while(objj_msgSend(_5e,"scanString:intoString:",",",NULL)){
objj_msgSend(_6e,"addObject:",objj_msgSend(_5e,"parseExpression"));
}
if(!objj_msgSend(_5e,"scanString:intoString:",")",NULL)||objj_msgSend(_6e,"count")<2||objj_msgSend(_6e[1],"expressionType")!=CPConstantValueExpressionType){
_51(_5e,"expression");
}
return objj_msgSend(CPExpression,"expressionForFunction:selectorName:arguments:",_6e[0],objj_msgSend(_6e[1],"constantValue"),_6e.slice(2));
}
objj_msgSend(_5e,"scanString:intoString:","#",NULL);
if(!_60){
_60=objj_msgSend(CPCharacterSet,"characterSetWithCharactersInString:","_$abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
}
if(!objj_msgSend(_5e,"scanCharactersFromSet:intoString:",_60,function(_6f){
var _70=_62;
if(typeof _6f!="undefined"){
_62=_6f;
}
return _70;
})){
_51(_5e,"expression");
}
return objj_msgSend(CPExpression,"expressionForKeyPath:",_62);
}
}),new objj_method(sel_getUid("parseFunctionalExpression"),function(_71,_72){
with(_71){
var _73=objj_msgSend(_71,"parseSimpleExpression");
while(YES){
if(objj_msgSend(_71,"scanString:intoString:",".",NULL)){
var _74=objj_msgSend(_71,"parseSimpleExpression"),_75=objj_msgSend(_74,"expressionType");
if(_75==CPKeyPathExpressionType){
_73=objj_msgSend(objj_msgSend(_CPKeyPathExpression,"alloc"),"initWithOperand:andKeyPath:",_73,objj_msgSend(_74,"keyPath"));
}else{
if(_75==CPVariableExpressionType){
_73=objj_msgSend(CPExpression,"expressionForFunction:selectorName:arguments:",_73,"valueForKey:",[_74]);
}else{
_51(_71,"expression");
}
}
}else{
if(objj_msgSend(_71,"scanString:intoString:","[",NULL)){
if(objj_msgSend(_71,"scanPredicateKeyword:","FIRST")){
_73=objj_msgSend(CPExpression,"expressionForFunction:arguments:","first:",objj_msgSend(CPArray,"arrayWithObject:",_73));
}else{
if(objj_msgSend(_71,"scanPredicateKeyword:","LAST")){
_73=objj_msgSend(CPExpression,"expressionForFunction:arguments:","last:",objj_msgSend(CPArray,"arrayWithObject:",_73));
}else{
if(objj_msgSend(_71,"scanPredicateKeyword:","SIZE")){
_73=objj_msgSend(CPExpression,"expressionForFunction:arguments:","count:",objj_msgSend(CPArray,"arrayWithObject:",_73));
}else{
var _76=objj_msgSend(_71,"parseExpression");
_73=objj_msgSend(CPExpression,"expressionForFunction:arguments:","fromObject:index:",objj_msgSend(CPArray,"arrayWithObjects:",_73,_76));
}
}
}
if(!objj_msgSend(_71,"scanString:intoString:","]",NULL)){
_51(_71,"expression");
}
}else{
if(objj_msgSend(_71,"scanString:intoString:",":",NULL)){
if(!objj_msgSend(_73,"keyPath")){
_51(_71,"expression");
}
var _77=objj_msgSend(_73,"keyPath")+":",_78=[];
if(!objj_msgSend(_71,"scanString:intoString:","(",NULL)){
var str;
objj_msgSend(_71,"scanCharactersFromSet:intoString:",objj_msgSend(CPCharacterSet,"lowercaseLetterCharacterSet"),function(_79){
var _7a=str;
if(typeof _79!="undefined"){
str=_79;
}
return _7a;
});
if(!objj_msgSend(_71,"scanString:intoString:",":(",NULL)){
_51(_71,"expression");
}
_77+=str+":";
}
if(!objj_msgSend(_71,"scanString:intoString:",")",NULL)){
objj_msgSend(_78,"addObject:",objj_msgSend(_71,"parseExpression"));
while(objj_msgSend(_71,"scanString:intoString:",",",NULL)){
objj_msgSend(_78,"addObject:",objj_msgSend(_71,"parseExpression"));
}
if(!objj_msgSend(_71,"scanString:intoString:",")",NULL)){
_51(_71,"expression");
}
}
_73=objj_msgSend(CPExpression,"expressionForFunction:arguments:",_77,_78);
}else{
if(objj_msgSend(_71,"scanString:intoString:","UNION",NULL)){
_73=objj_msgSend(CPExpression,"expressionForUnionSet:with:",_73,objj_msgSend(_71,"parseExpression"));
}else{
if(objj_msgSend(_71,"scanString:intoString:","INTERSECT",NULL)){
_73=objj_msgSend(CPExpression,"expressionForIntersectSet:with:",_73,objj_msgSend(_71,"parseExpression"));
}else{
if(objj_msgSend(_71,"scanString:intoString:","MINUS",NULL)){
_73=objj_msgSend(CPExpression,"expressionForMinusSet:with:",_73,objj_msgSend(_71,"parseExpression"));
}else{
return _73;
}
}
}
}
}
}
}
}
}),new objj_method(sel_getUid("parsePowerExpression"),function(_7b,_7c){
with(_7b){
var _7d=objj_msgSend(_7b,"parseFunctionalExpression");
while(YES){
var _7e;
if(objj_msgSend(_7b,"scanString:intoString:","**",NULL)){
_7e=objj_msgSend(_7b,"parseFunctionalExpression");
_7d=objj_msgSend(CPExpression,"expressionForFunction:arguments:","raise:to:",objj_msgSend(CPArray,"arrayWithObjects:",_7d,_7e));
}else{
return _7d;
}
}
}
}),new objj_method(sel_getUid("parseMultiplicationExpression"),function(_7f,_80){
with(_7f){
var _81=objj_msgSend(_7f,"parsePowerExpression");
while(YES){
var _82;
if(objj_msgSend(_7f,"scanString:intoString:","*",NULL)){
_82=objj_msgSend(_7f,"parsePowerExpression");
_81=objj_msgSend(CPExpression,"expressionForFunction:arguments:","multiply:by:",objj_msgSend(CPArray,"arrayWithObjects:",_81,_82));
}else{
if(objj_msgSend(_7f,"scanString:intoString:","/",NULL)){
_82=objj_msgSend(_7f,"parsePowerExpression");
_81=objj_msgSend(CPExpression,"expressionForFunction:arguments:","divide:by:",objj_msgSend(CPArray,"arrayWithObjects:",_81,_82));
}else{
return _81;
}
}
}
}
}),new objj_method(sel_getUid("parseAdditionExpression"),function(_83,_84){
with(_83){
var _85=objj_msgSend(_83,"parseMultiplicationExpression");
while(YES){
var _86;
if(objj_msgSend(_83,"scanString:intoString:","+",NULL)){
_86=objj_msgSend(_83,"parseMultiplicationExpression");
_85=objj_msgSend(CPExpression,"expressionForFunction:arguments:","add:to:",objj_msgSend(CPArray,"arrayWithObjects:",_85,_86));
}else{
if(objj_msgSend(_83,"scanString:intoString:","-",NULL)){
_86=objj_msgSend(_83,"parseMultiplicationExpression");
_85=objj_msgSend(CPExpression,"expressionForFunction:arguments:","from:substract:",objj_msgSend(CPArray,"arrayWithObjects:",_85,_86));
}else{
return _85;
}
}
}
}
}),new objj_method(sel_getUid("parseBinaryExpression"),function(_87,_88){
with(_87){
var _89=objj_msgSend(_87,"parseAdditionExpression");
while(YES){
var _8a;
if(objj_msgSend(_87,"scanString:intoString:",":=",NULL)){
_8a=objj_msgSend(_87,"parseAdditionExpression");
}else{
return _89;
}
}
}
})]);
var _51=_51=function(_8b,_8c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"unable to parse "+_8c+" at index "+objj_msgSend(_8b,"scanLocation"));
};
objj_executeFile("CPCompoundPredicate.j",YES);
objj_executeFile("CPComparisonPredicate.j",YES);
objj_executeFile("CPExpression.j",YES);
