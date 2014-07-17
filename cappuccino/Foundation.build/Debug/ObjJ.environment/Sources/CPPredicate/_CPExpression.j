@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;18;CPKeyValueCoding.ji;10;CPObject.ji;10;CPString.jt;7877;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPKeyValueCoding.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);CPConstantValueExpressionType = 0;
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
    return ((___r1 = (_CPConstantValueExpression == null ? null : _CPConstantValueExpression.isa.objj_msgSend0(_CPConstantValueExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithValue:", value));
    var ___r1;
}
,["CPExpression","id"]), new objj_method(sel_getUid("expressionForEvaluatedObject"), function $CPExpression__expressionForEvaluatedObject(self, _cmd)
{
    return (_CPSelfExpression == null ? null : _CPSelfExpression.isa.objj_msgSend0(_CPSelfExpression, "evaluatedObject"));
}
,["CPExpression"]), new objj_method(sel_getUid("expressionForVariable:"), function $CPExpression__expressionForVariable_(self, _cmd, string)
{
    return ((___r1 = (_CPVariableExpression == null ? null : _CPVariableExpression.isa.objj_msgSend0(_CPVariableExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithVariable:", string));
    var ___r1;
}
,["CPExpression","CPString"]), new objj_method(sel_getUid("expressionForKeyPath:"), function $CPExpression__expressionForKeyPath_(self, _cmd, keyPath)
{
    return ((___r1 = (_CPKeyPathExpression == null ? null : _CPKeyPathExpression.isa.objj_msgSend0(_CPKeyPathExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithKeyPath:", keyPath));
    var ___r1;
}
,["CPExpression","CPString"]), new objj_method(sel_getUid("expressionForAggregate:"), function $CPExpression__expressionForAggregate_(self, _cmd, collection)
{
    return ((___r1 = (_CPAggregateExpression == null ? null : _CPAggregateExpression.isa.objj_msgSend0(_CPAggregateExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithAggregate:", collection));
    var ___r1;
}
,["CPExpression","CPArray"]), new objj_method(sel_getUid("expressionForUnionSet:with:"), function $CPExpression__expressionForUnionSet_with_(self, _cmd, left, right)
{
    return ((___r1 = (_CPSetExpression == null ? null : _CPSetExpression.isa.objj_msgSend0(_CPSetExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithType:left:right:", CPUnionSetExpressionType, left, right));
    var ___r1;
}
,["CPExpression","CPExpression","CPExpression"]), new objj_method(sel_getUid("expressionForIntersectSet:with:"), function $CPExpression__expressionForIntersectSet_with_(self, _cmd, left, right)
{
    return ((___r1 = (_CPSetExpression == null ? null : _CPSetExpression.isa.objj_msgSend0(_CPSetExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithType:left:right:", CPIntersectSetExpressionType, left, right));
    var ___r1;
}
,["CPExpression","CPExpression","CPExpression"]), new objj_method(sel_getUid("expressionForMinusSet:with:"), function $CPExpression__expressionForMinusSet_with_(self, _cmd, left, right)
{
    return ((___r1 = (_CPSetExpression == null ? null : _CPSetExpression.isa.objj_msgSend0(_CPSetExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithType:left:right:", CPMinusSetExpressionType, left, right));
    var ___r1;
}
,["CPExpression","CPExpression","CPExpression"]), new objj_method(sel_getUid("expressionForFunction:arguments:"), function $CPExpression__expressionForFunction_arguments_(self, _cmd, function_name, parameters)
{
    return ((___r1 = (_CPFunctionExpression == null ? null : _CPFunctionExpression.isa.objj_msgSend0(_CPFunctionExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithSelector:arguments:", CPSelectorFromString(function_name), parameters));
    var ___r1;
}
,["CPExpression","CPString","CPArray"]), new objj_method(sel_getUid("expressionForFunction:selectorName:arguments:"), function $CPExpression__expressionForFunction_selectorName_arguments_(self, _cmd, target, selectorName, parameters)
{
    return ((___r1 = (_CPFunctionExpression == null ? null : _CPFunctionExpression.isa.objj_msgSend0(_CPFunctionExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTarget:selector:arguments:", target, CPSelectorFromString(selectorName), parameters));
    var ___r1;
}
,["CPExpression","CPExpression","CPString","CPArray"]), new objj_method(sel_getUid("expressionForSubquery:usingIteratorVariable:predicate:"), function $CPExpression__expressionForSubquery_usingIteratorVariable_predicate_(self, _cmd, expression, variable, predicate)
{
    return ((___r1 = (_CPSubqueryExpression == null ? null : _CPSubqueryExpression.isa.objj_msgSend0(_CPSubqueryExpression, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithExpression:usingIteratorVariable:predicate:", expression, variable, predicate));
    var ___r1;
}
,["CPExpression","CPExpression","CPString","CPPredicate"])]);
}