@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;15;_CPExpression.ji;14;_CPPredicate.jt;7124;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("_CPExpression.j", YES);objj_executeFile("_CPPredicate.j", YES);{var the_class = objj_allocateClassPair(CPExpression, "_CPSubqueryExpression"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_collection"), new objj_ivar("_variableExpression"), new objj_ivar("_subpredicate")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithExpression:usingIteratorVariable:predicate:"), function $_CPSubqueryExpression__initWithExpression_usingIteratorVariable_predicate_(self, _cmd, collection, variable, subpredicate)
{
    var variableExpression = CPExpression.isa.objj_msgSend1(CPExpression, "expressionForVariable:", variable);
    return self.isa.objj_msgSend3(self, "initWithExpression:usingIteratorExpression:predicate:", collection, variableExpression, subpredicate);
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
    var collection = ((___r1 = self._collection), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "expressionValueWithObject:context:", object, context)),
        count = (collection == null ? null : collection.isa.objj_msgSend0(collection, "count")),
        result = CPArray.isa.objj_msgSend0(CPArray, "array"),
        bindings = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPExpression.isa.objj_msgSend0(CPExpression, "expressionForEvaluatedObject"), self.isa.objj_msgSend0(self, "variable")),
        i = 0;
    for (; i < count; i++)
    {
        var item = (collection == null ? null : collection.isa.objj_msgSend1(collection, "objectAtIndex:", i));
        if (((___r1 = self._subpredicate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "evaluateWithObject:substitutionVariables:", item, bindings)))
            (result == null ? null : result.isa.objj_msgSend1(result, "addObject:", item));
    }
    return result;
    var ___r1;
}
,["id","id","id"]), new objj_method(sel_getUid("isEqual:"), function $_CPSubqueryExpression__isEqual_(self, _cmd, object)
{
    if (self === object)
        return YES;
    if (object === nil || object.isa !== self.isa || !((___r1 = self._collection), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", (object == null ? null : object.isa.objj_msgSend0(object, "collection")))) || !((___r1 = self._variableExpression), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", (object == null ? null : object.isa.objj_msgSend0(object, "variableExpression")))) || !((___r1 = self._subpredicate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", (object == null ? null : object.isa.objj_msgSend0(object, "predicate")))))
        return NO;
    return YES;
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("collection"), function $_CPSubqueryExpression__collection(self, _cmd)
{
    return self._collection;
}
,["CPExpression"]), new objj_method(sel_getUid("copy"), function $_CPSubqueryExpression__copy(self, _cmd)
{
    return ((___r1 = _CPSubqueryExpression.isa.objj_msgSend0(_CPSubqueryExpression, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithExpression:usingIteratorExpression:predicate:", ((___r2 = self._collection), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "copy")), ((___r2 = self._variableExpression), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "copy")), ((___r2 = self._subpredicate), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "copy"))));
    var ___r1, ___r2;
}
,["id"]), new objj_method(sel_getUid("predicate"), function $_CPSubqueryExpression__predicate(self, _cmd)
{
    return self._subpredicate;
}
,["CPPredicate"]), new objj_method(sel_getUid("description"), function $_CPSubqueryExpression__description(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "predicateFormat");
}
,["CPString"]), new objj_method(sel_getUid("predicateFormat"), function $_CPSubqueryExpression__predicateFormat(self, _cmd)
{
    return "SUBQUERY(" + ((___r1 = self._collection), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + ", " + ((___r1 = self._variableExpression), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + ", " + ((___r1 = self._subpredicate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "predicateFormat")) + ")";
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("variable"), function $_CPSubqueryExpression__variable(self, _cmd)
{
    return ((___r1 = self._variableExpression), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "variable"));
    var ___r1;
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
    var collection = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPExpressionKey)),
        subpredicate = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPSubpredicateKey)),
        variableExpression = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPVariableKey));
    return self.isa.objj_msgSend3(self, "initWithExpression:usingIteratorExpression:predicate:", collection, variableExpression, subpredicate);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPSubqueryExpression__encodeWithCoder_(self, _cmd, coder)
{
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._collection, CPExpressionKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._subpredicate, CPSubpredicateKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._variableExpression, CPVariableKey));
}
,["void","CPCoder"])]);
}