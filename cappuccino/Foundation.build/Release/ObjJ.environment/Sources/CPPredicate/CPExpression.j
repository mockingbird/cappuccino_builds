@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;18;CPKeyValueCoding.ji;10;CPObject.ji;10;CPString.ji;28;_CPConstantValueExpression.ji;19;_CPSelfExpression.ji;23;_CPVariableExpression.ji;22;_CPKeyPathExpression.ji;23;_CPFunctionExpression.ji;24;_CPAggregateExpression.ji;18;_CPSetExpression.ji;23;_CPSubqueryExpression.jt;5000;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPKeyValueCoding.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
CPConstantValueExpressionType=0;
CPEvaluatedObjectExpressionType=1;
CPVariableExpressionType=2;
CPKeyPathExpressionType=3;
CPFunctionExpressionType=4;
CPAggregateExpressionType=5;
CPSubqueryExpressionType=6;
CPUnionSetExpressionType=7;
CPIntersectSetExpressionType=8;
CPMinusSetExpressionType=9;
var _1=objj_allocateClassPair(CPObject,"CPExpression"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_type")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithExpressionType:"),function(_3,_4,_5){
with(_3){
_type=_5;
return _3;
}
}),new objj_method(sel_getUid("expressionType"),function(_6,_7){
with(_6){
return _type;
}
}),new objj_method(sel_getUid("constantValue"),function(_8,_9){
with(_8){
_CPRaiseInvalidAbstractInvocation(_8,_9);
return nil;
}
}),new objj_method(sel_getUid("variable"),function(_a,_b){
with(_a){
_CPRaiseInvalidAbstractInvocation(_a,_b);
return nil;
}
}),new objj_method(sel_getUid("keyPath"),function(_c,_d){
with(_c){
_CPRaiseInvalidAbstractInvocation(_c,_d);
return nil;
}
}),new objj_method(sel_getUid("function"),function(_e,_f){
with(_e){
_CPRaiseInvalidAbstractInvocation(_e,_f);
return nil;
}
}),new objj_method(sel_getUid("arguments"),function(_10,_11){
with(_10){
_CPRaiseInvalidAbstractInvocation(_10,_11);
return nil;
}
}),new objj_method(sel_getUid("collection"),function(_12,_13){
with(_12){
_CPRaiseInvalidAbstractInvocation(_12,_13);
return nil;
}
}),new objj_method(sel_getUid("predicate"),function(_14,_15){
with(_14){
_CPRaiseInvalidAbstractInvocation(_14,_15);
return nil;
}
}),new objj_method(sel_getUid("operand"),function(_16,_17){
with(_16){
_CPRaiseInvalidAbstractInvocation(_16,_17);
return nil;
}
}),new objj_method(sel_getUid("leftExpression"),function(_18,_19){
with(_18){
_CPRaiseInvalidAbstractInvocation(_18,_19);
return nil;
}
}),new objj_method(sel_getUid("rightExpression"),function(_1a,_1b){
with(_1a){
_CPRaiseInvalidAbstractInvocation(_1a,_1b);
return nil;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_1c,_1d,_1e){
with(_1c){
return _1c;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("expressionForConstantValue:"),function(_1f,_20,_21){
with(_1f){
return objj_msgSend(objj_msgSend(_CPConstantValueExpression,"alloc"),"initWithValue:",_21);
}
}),new objj_method(sel_getUid("expressionForEvaluatedObject"),function(_22,_23){
with(_22){
return objj_msgSend(_CPSelfExpression,"evaluatedObject");
}
}),new objj_method(sel_getUid("expressionForVariable:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(objj_msgSend(_CPVariableExpression,"alloc"),"initWithVariable:",_26);
}
}),new objj_method(sel_getUid("expressionForKeyPath:"),function(_27,_28,_29){
with(_27){
return objj_msgSend(objj_msgSend(_CPKeyPathExpression,"alloc"),"initWithKeyPath:",_29);
}
}),new objj_method(sel_getUid("expressionForAggregate:"),function(_2a,_2b,_2c){
with(_2a){
return objj_msgSend(objj_msgSend(_CPAggregateExpression,"alloc"),"initWithAggregate:",_2c);
}
}),new objj_method(sel_getUid("expressionForUnionSet:with:"),function(_2d,_2e,_2f,_30){
with(_2d){
return objj_msgSend(objj_msgSend(_CPSetExpression,"alloc"),"initWithType:left:right:",CPUnionSetExpressionType,_2f,_30);
}
}),new objj_method(sel_getUid("expressionForIntersectSet:with:"),function(_31,_32,_33,_34){
with(_31){
return objj_msgSend(objj_msgSend(_CPSetExpression,"alloc"),"initWithType:left:right:",CPIntersectSetExpressionType,_33,_34);
}
}),new objj_method(sel_getUid("expressionForMinusSet:with:"),function(_35,_36,_37,_38){
with(_35){
return objj_msgSend(objj_msgSend(_CPSetExpression,"alloc"),"initWithType:left:right:",CPMinusSetExpressionType,_37,_38);
}
}),new objj_method(sel_getUid("expressionForFunction:arguments:"),function(_39,_3a,_3b,_3c){
with(_39){
return objj_msgSend(objj_msgSend(_CPFunctionExpression,"alloc"),"initWithSelector:arguments:",CPSelectorFromString(_3b),_3c);
}
}),new objj_method(sel_getUid("expressionForFunction:selectorName:arguments:"),function(_3d,_3e,_3f,_40,_41){
with(_3d){
return objj_msgSend(objj_msgSend(_CPFunctionExpression,"alloc"),"initWithTarget:selector:arguments:",_3f,CPSelectorFromString(_40),_41);
}
}),new objj_method(sel_getUid("expressionForSubquery:usingIteratorVariable:predicate:"),function(_42,_43,_44,_45,_46){
with(_42){
return objj_msgSend(objj_msgSend(_CPSubqueryExpression,"alloc"),"initWithExpression:usingIteratorVariable:predicate:",_44,_45,_46);
}
})]);
objj_executeFile("_CPConstantValueExpression.j",YES);
objj_executeFile("_CPSelfExpression.j",YES);
objj_executeFile("_CPVariableExpression.j",YES);
objj_executeFile("_CPKeyPathExpression.j",YES);
objj_executeFile("_CPFunctionExpression.j",YES);
objj_executeFile("_CPAggregateExpression.j",YES);
objj_executeFile("_CPSetExpression.j",YES);
objj_executeFile("_CPSubqueryExpression.j",YES);
