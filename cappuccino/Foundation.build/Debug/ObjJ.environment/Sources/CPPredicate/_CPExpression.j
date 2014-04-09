@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;18;CPKeyValueCoding.ji;10;CPObject.ji;10;CPString.jt;6477;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPKeyValueCoding.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);CPConstantValueExpressionType = 0;
CPEvaluatedObjectExpressionType = 1;
CPVariableExpressionType = 2;
CPKeyPathExpressionType = 3;
CPFunctionExpressionType = 4;
CPAggregateExpressionType = 5;
CPSubqueryExpressionType = 6;
CPUnionSetExpressionType = 7;
CPIntersectSetExpressionType = 8;
CPMinusSetExpressionType = 9;
{var the_class = objj_allocateClassPair(CPObject, "CPExpression"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_type")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithExpressionType:"), function $CPExpression__initWithExpressionType_(self, _cmd, type)
{
    self._type = type;
    return self;
}
,["id","int"]), new objj_method(sel_getUid("expressionType"), function $CPExpression__expressionType(self, _cmd)
{
    return self._type;
}
,["int"]), new objj_method(sel_getUid("constantValue"), function $CPExpression__constantValue(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["id"]), new objj_method(sel_getUid("variable"), function $CPExpression__variable(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["CPString"]), new objj_method(sel_getUid("keyPath"), function $CPExpression__keyPath(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["CPString"]), new objj_method(sel_getUid("function"), function $CPExpression__function(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["CPString"]), new objj_method(sel_getUid("arguments"), function $CPExpression__arguments(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["CPArray"]), new objj_method(sel_getUid("collection"), function $CPExpression__collection(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["id"]), new objj_method(sel_getUid("predicate"), function $CPExpression__predicate(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["CPPredicate"]), new objj_method(sel_getUid("operand"), function $CPExpression__operand(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["CPExpression"]), new objj_method(sel_getUid("leftExpression"), function $CPExpression__leftExpression(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["CPExpression"]), new objj_method(sel_getUid("rightExpression"), function $CPExpression__rightExpression(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["CPExpression"]), new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"), function $CPExpression___expressionWithSubstitutionVariables_(self, _cmd, variables)
{
    return self;
}
,["CPExpression","CPDictionary"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("expressionForConstantValue:"), function $CPExpression__expressionForConstantValue_(self, _cmd, value)
{
    return objj_msgSend(objj_msgSend(_CPConstantValueExpression, "alloc"), "initWithValue:", value);
}
,["CPExpression","id"]), new objj_method(sel_getUid("expressionForEvaluatedObject"), function $CPExpression__expressionForEvaluatedObject(self, _cmd)
{
    return objj_msgSend(_CPSelfExpression, "evaluatedObject");
}
,["CPExpression"]), new objj_method(sel_getUid("expressionForVariable:"), function $CPExpression__expressionForVariable_(self, _cmd, string)
{
    return objj_msgSend(objj_msgSend(_CPVariableExpression, "alloc"), "initWithVariable:", string);
}
,["CPExpression","CPString"]), new objj_method(sel_getUid("expressionForKeyPath:"), function $CPExpression__expressionForKeyPath_(self, _cmd, keyPath)
{
    return objj_msgSend(objj_msgSend(_CPKeyPathExpression, "alloc"), "initWithKeyPath:", keyPath);
}
,["CPExpression","CPString"]), new objj_method(sel_getUid("expressionForAggregate:"), function $CPExpression__expressionForAggregate_(self, _cmd, collection)
{
    return objj_msgSend(objj_msgSend(_CPAggregateExpression, "alloc"), "initWithAggregate:", collection);
}
,["CPExpression","CPArray"]), new objj_method(sel_getUid("expressionForUnionSet:with:"), function $CPExpression__expressionForUnionSet_with_(self, _cmd, left, right)
{
    return objj_msgSend(objj_msgSend(_CPSetExpression, "alloc"), "initWithType:left:right:", CPUnionSetExpressionType, left, right);
}
,["CPExpression","CPExpression","CPExpression"]), new objj_method(sel_getUid("expressionForIntersectSet:with:"), function $CPExpression__expressionForIntersectSet_with_(self, _cmd, left, right)
{
    return objj_msgSend(objj_msgSend(_CPSetExpression, "alloc"), "initWithType:left:right:", CPIntersectSetExpressionType, left, right);
}
,["CPExpression","CPExpression","CPExpression"]), new objj_method(sel_getUid("expressionForMinusSet:with:"), function $CPExpression__expressionForMinusSet_with_(self, _cmd, left, right)
{
    return objj_msgSend(objj_msgSend(_CPSetExpression, "alloc"), "initWithType:left:right:", CPMinusSetExpressionType, left, right);
}
,["CPExpression","CPExpression","CPExpression"]), new objj_method(sel_getUid("expressionForFunction:arguments:"), function $CPExpression__expressionForFunction_arguments_(self, _cmd, function_name, parameters)
{
    return objj_msgSend(objj_msgSend(_CPFunctionExpression, "alloc"), "initWithSelector:arguments:", CPSelectorFromString(function_name), parameters);
}
,["CPExpression","CPString","CPArray"]), new objj_method(sel_getUid("expressionForFunction:selectorName:arguments:"), function $CPExpression__expressionForFunction_selectorName_arguments_(self, _cmd, target, selectorName, parameters)
{
    return objj_msgSend(objj_msgSend(_CPFunctionExpression, "alloc"), "initWithTarget:selector:arguments:", target, CPSelectorFromString(selectorName), parameters);
}
,["CPExpression","CPExpression","CPString","CPArray"]), new objj_method(sel_getUid("expressionForSubquery:usingIteratorVariable:predicate:"), function $CPExpression__expressionForSubquery_usingIteratorVariable_predicate_(self, _cmd, expression, variable, predicate)
{
    return objj_msgSend(objj_msgSend(_CPSubqueryExpression, "alloc"), "initWithExpression:usingIteratorVariable:predicate:", expression, variable, predicate);
}
,["CPExpression","CPExpression","CPString","CPPredicate"])]);
}