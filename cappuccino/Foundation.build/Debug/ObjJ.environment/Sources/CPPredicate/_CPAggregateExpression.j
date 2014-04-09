@STATIC;1.0;i;9;CPArray.ji;10;CPString.ji;15;_CPExpression.jt;3649;objj_executeFile("CPArray.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("_CPExpression.j", YES);{var the_class = objj_allocateClassPair(CPExpression, "_CPAggregateExpression"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_aggregate")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithAggregate:"), function $_CPAggregateExpression__initWithAggregate_(self, _cmd, collection)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAggregateExpression").super_class }, "initWithExpressionType:", CPAggregateExpressionType);
    if (self)
        self._aggregate = collection;
    return self;
}
,["id","CPArray"]), new objj_method(sel_getUid("isEqual:"), function $_CPAggregateExpression__isEqual_(self, _cmd, object)
{
    if (self === object)
        return YES;
    if (object === nil || object.isa !== self.isa || !objj_msgSend(objj_msgSend(object, "collection"), "isEqual:", self._aggregate))
        return NO;
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("collection"), function $_CPAggregateExpression__collection(self, _cmd)
{
    return self._aggregate;
}
,["id"]), new objj_method(sel_getUid("expressionValueWithObject:context:"), function $_CPAggregateExpression__expressionValueWithObject_context_(self, _cmd, object, context)
{
    var eval_array = objj_msgSend(CPArray, "array"),
        collection = objj_msgSend(self._aggregate, "objectEnumerator"),
        exp;
    while ((exp = objj_msgSend(collection, "nextObject")) !== nil)
    {
        var eval = objj_msgSend(exp, "expressionValueWithObject:context:", object, context);
        objj_msgSend(eval_array, "addObject:", eval);
    }
    return eval_array;
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("description"), function $_CPAggregateExpression__description(self, _cmd)
{
    var i = 0,
        count = objj_msgSend(self._aggregate, "count"),
        result = "{";
    for (; i < count; i++)
        result = result + objj_msgSend(CPString, "stringWithFormat:", "%s%s", objj_msgSend(objj_msgSend(self._aggregate, "objectAtIndex:", i), "description"), i + 1 < count ? ", " : "");
    result = result + "}";
    return result;
}
,["CPString"]), new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"), function $_CPAggregateExpression___expressionWithSubstitutionVariables_(self, _cmd, variables)
{
    var subst_array = objj_msgSend(CPArray, "array"),
        count = objj_msgSend(self._aggregate, "count"),
        i = 0;
    for (; i < count; i++)
        objj_msgSend(subst_array, "addObject:", objj_msgSend(objj_msgSend(self._aggregate, "objectAtIndex:", i), "_expressionWithSubstitutionVariables:", variables));
    return objj_msgSend(CPExpression, "expressionForAggregate:", subst_array);
}
,["CPExpression","CPDictionary"])]);
}var CPCollectionKey = "CPCollection";
{
var the_class = objj_getClass("_CPAggregateExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPAggregateExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPAggregateExpression__initWithCoder_(self, _cmd, coder)
{
    var collection = objj_msgSend(coder, "decodeObjectForKey:", CPCollectionKey);
    return objj_msgSend(self, "initWithAggregate:", collection);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPAggregateExpression__encodeWithCoder_(self, _cmd, coder)
{
    objj_msgSend(coder, "encodeObject:forKey:", self._aggregate, CPCollectionKey);
}
,["void","CPCoder"])]);
}