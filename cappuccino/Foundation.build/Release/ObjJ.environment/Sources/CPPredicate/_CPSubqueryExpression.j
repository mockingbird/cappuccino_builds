@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;15;_CPExpression.ji;14;_CPPredicate.jt;5777;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("_CPExpression.j", YES);objj_executeFile("_CPPredicate.j", YES);{var the_class = objj_allocateClassPair(CPExpression, "_CPSubqueryExpression"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_collection"), new objj_ivar("_variableExpression"), new objj_ivar("_subpredicate")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithExpression:usingIteratorVariable:predicate:"), function $_CPSubqueryExpression__initWithExpression_usingIteratorVariable_predicate_(self, _cmd, collection, variable, subpredicate)
{
    var variableExpression = objj_msgSend(CPExpression, "expressionForVariable:", variable);
    return objj_msgSend(self, "initWithExpression:usingIteratorExpression:predicate:", collection, variableExpression, subpredicate);
}
,["id","CPExpression","CPString","CPPredicate"]), new objj_method(sel_getUid("initWithExpression:usingIteratorExpression:predicate:"), function $_CPSubqueryExpression__initWithExpression_usingIteratorExpression_predicate_(self, _cmd, collection, variableExpression, subpredicate)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPSubqueryExpression").super_class }, "initWithExpressionType:", CPSubqueryExpressionType);
    if (self)
    {
        self._subpredicate = subpredicate;
        self._collection = collection;
        self._variableExpression = variableExpression;
    }
    return self;
}
,["id","CPExpression","CPExpression","CPPredicate"]), new objj_method(sel_getUid("expressionValueWithObject:context:"), function $_CPSubqueryExpression__expressionValueWithObject_context_(self, _cmd, object, context)
{
    var collection = objj_msgSend(self._collection, "expressionValueWithObject:context:", object, context),
        count = objj_msgSend(collection, "count"),
        result = objj_msgSend(CPArray, "array"),
        bindings = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPExpression, "expressionForEvaluatedObject"), objj_msgSend(self, "variable")),
        i = 0;
    for (; i < count; i++)
    {
        var item = objj_msgSend(collection, "objectAtIndex:", i);
        if (objj_msgSend(self._subpredicate, "evaluateWithObject:substitutionVariables:", item, bindings))
            objj_msgSend(result, "addObject:", item);
    }
    return result;
}
,["id","id","id"]), new objj_method(sel_getUid("isEqual:"), function $_CPSubqueryExpression__isEqual_(self, _cmd, object)
{
    if (self === object)
        return YES;
    if (object === nil || object.isa !== self.isa || !objj_msgSend(self._collection, "isEqual:", objj_msgSend(object, "collection")) || !objj_msgSend(self._variableExpression, "isEqual:", objj_msgSend(object, "variableExpression")) || !objj_msgSend(self._subpredicate, "isEqual:", objj_msgSend(object, "predicate")))
        return NO;
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("collection"), function $_CPSubqueryExpression__collection(self, _cmd)
{
    return self._collection;
}
,["CPExpression"]), new objj_method(sel_getUid("copy"), function $_CPSubqueryExpression__copy(self, _cmd)
{
    return objj_msgSend(objj_msgSend(_CPSubqueryExpression, "alloc"), "initWithExpression:usingIteratorExpression:predicate:", objj_msgSend(self._collection, "copy"), objj_msgSend(self._variableExpression, "copy"), objj_msgSend(self._subpredicate, "copy"));
}
,["id"]), new objj_method(sel_getUid("predicate"), function $_CPSubqueryExpression__predicate(self, _cmd)
{
    return self._subpredicate;
}
,["CPPredicate"]), new objj_method(sel_getUid("description"), function $_CPSubqueryExpression__description(self, _cmd)
{
    return objj_msgSend(self, "predicateFormat");
}
,["CPString"]), new objj_method(sel_getUid("predicateFormat"), function $_CPSubqueryExpression__predicateFormat(self, _cmd)
{
    return "SUBQUERY(" + objj_msgSend(self._collection, "description") + ", " + objj_msgSend(self._variableExpression, "description") + ", " + objj_msgSend(self._subpredicate, "predicateFormat") + ")";
}
,["CPString"]), new objj_method(sel_getUid("variable"), function $_CPSubqueryExpression__variable(self, _cmd)
{
    return objj_msgSend(self._variableExpression, "variable");
}
,["CPString"]), new objj_method(sel_getUid("variableExpression"), function $_CPSubqueryExpression__variableExpression(self, _cmd)
{
    return self._variableExpression;
}
,["CPExpression"])]);
}var CPExpressionKey = "CPExpression",
    CPSubpredicateKey = "CPSubpredicate",
    CPVariableKey = "CPVariable";
{
var the_class = objj_getClass("_CPSubqueryExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPSubqueryExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPSubqueryExpression__initWithCoder_(self, _cmd, coder)
{
    var collection = objj_msgSend(coder, "decodeObjectForKey:", CPExpressionKey),
        subpredicate = objj_msgSend(coder, "decodeObjectForKey:", CPSubpredicateKey),
        variableExpression = objj_msgSend(coder, "decodeObjectForKey:", CPVariableKey);
    return objj_msgSend(self, "initWithExpression:usingIteratorExpression:predicate:", collection, variableExpression, subpredicate);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPSubqueryExpression__encodeWithCoder_(self, _cmd, coder)
{
    objj_msgSend(coder, "encodeObject:forKey:", self._collection, CPExpressionKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._subpredicate, CPSubpredicateKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._variableExpression, CPVariableKey);
}
,["void","CPCoder"])]);
}