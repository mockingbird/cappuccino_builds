@STATIC;1.0;i;9;CPArray.ji;10;CPString.ji;15;_CPExpression.jt;4497;objj_executeFile("CPArray.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("_CPExpression.j", YES);{var the_class = objj_allocateClassPair(CPExpression, "_CPAggregateExpression"),
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
    if (object === nil || object.isa !== self.isa || !((___r1 = (object == null ? null : object.isa.objj_msgSend0(object, "collection"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", self._aggregate)))
        return NO;
    return YES;
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("collection"), function $_CPAggregateExpression__collection(self, _cmd)
{
    return self._aggregate;
}
,["id"]), new objj_method(sel_getUid("expressionValueWithObject:context:"), function $_CPAggregateExpression__expressionValueWithObject_context_(self, _cmd, object, context)
{
    var eval_array = CPArray.isa.objj_msgSend0(CPArray, "array"),
        collection = ((___r1 = self._aggregate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "objectEnumerator")),
        exp;
    while ((exp = (collection == null ? null : collection.isa.objj_msgSend0(collection, "nextObject"))) !== nil)
    {
        var eval = (exp == null ? null : exp.isa.objj_msgSend2(exp, "expressionValueWithObject:context:", object, context));
        (eval_array == null ? null : eval_array.isa.objj_msgSend1(eval_array, "addObject:", eval));
    }
    return eval_array;
    var ___r1;
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("description"), function $_CPAggregateExpression__description(self, _cmd)
{
    var i = 0,
        count = ((___r1 = self._aggregate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        result = "{";
    for (; i < count; i++)
        result = result + CPString.isa.objj_msgSend3(CPString, "stringWithFormat:", "%s%s", ((___r1 = ((___r2 = self._aggregate), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", i))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")), i + 1 < count ? ", " : "");
    result = result + "}";
    return result;
    var ___r1, ___r2;
}
,["CPString"]), new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"), function $_CPAggregateExpression___expressionWithSubstitutionVariables_(self, _cmd, variables)
{
    var subst_array = CPArray.isa.objj_msgSend0(CPArray, "array"),
        count = ((___r1 = self._aggregate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        i = 0;
    for (; i < count; i++)
        (subst_array == null ? null : subst_array.isa.objj_msgSend1(subst_array, "addObject:", ((___r1 = ((___r2 = self._aggregate), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", i))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_expressionWithSubstitutionVariables:", variables))));
    return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForAggregate:", subst_array);
    var ___r1, ___r2;
}
,["CPExpression","CPDictionary"])]);
}var CPCollectionKey = "CPCollection";
{
var the_class = objj_getClass("_CPAggregateExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPAggregateExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPAggregateExpression__initWithCoder_(self, _cmd, coder)
{
    var collection = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPCollectionKey));
    return self.isa.objj_msgSend1(self, "initWithAggregate:", collection);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPAggregateExpression__encodeWithCoder_(self, _cmd, coder)
{
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._aggregate, CPCollectionKey));
}
,["void","CPCoder"])]);
}