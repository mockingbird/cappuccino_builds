@STATIC;1.0;i;13;CPException.ji;7;CPSet.ji;15;_CPExpression.jt;5035;objj_executeFile("CPException.j", YES);objj_executeFile("CPSet.j", YES);objj_executeFile("_CPExpression.j", YES);{var the_class = objj_allocateClassPair(CPExpression, "_CPSetExpression"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_left"), new objj_ivar("_right")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithType:left:right:"), function $_CPSetExpression__initWithType_left_right_(self, _cmd, type, left, right)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPSetExpression").super_class }, "initWithExpressionType:", type);
    if (self)
    {
        self._left = left;
        self._right = right;
    }
    return self;
}
,["id","int","CPExpression","CPExpression"]), new objj_method(sel_getUid("isEqual:"), function $_CPSetExpression__isEqual_(self, _cmd, object)
{
    if (self === object)
        return YES;
    if (object === nil || object.isa !== self.isa || !objj_msgSend(objj_msgSend(object, "leftExpression"), "isEqual:", self._left) || !objj_msgSend(objj_msgSend(object, "rightExpression"), "isEqual:", self._right))
        return NO;
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("expressionValueWithObject:context:"), function $_CPSetExpression__expressionValueWithObject_context_(self, _cmd, object, context)
{
    var right = objj_msgSend(self._right, "expressionValueWithObject:context:", object, context);
    if (objj_msgSend(right, "isKindOfClass:", objj_msgSend(CPArray, "class")))
        right = objj_msgSend(CPSet, "setWithArray:", right);
    else if (objj_msgSend(right, "isKindOfClass:", objj_msgSend(CPDictionary, "class")))
        right = objj_msgSend(CPSet, "setWithArray:", objj_msgSend(right, "allValues"));
    else if (!objj_msgSend(right, "isKindOfClass:", objj_msgSend(CPSet, "class")))
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "The right expression for a CP*SetExpressionType expression must evaluate to a CPArray, CPDictionary or CPSet");
    var left = objj_msgSend(self._left, "expressionValueWithObject:context:", object, context);
    if (!objj_msgSend(left, "isKindOfClass:", objj_msgSend(CPSet, "class")))
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "The left expression for a CP*SetExpressionType expression must evaluate to a CPSet");
    var result = objj_msgSend(left, "copy");
    switch(self._type) {
    case CPIntersectSetExpressionType:
        objj_msgSend(result, "intersectSet:", right);
        break;
    case CPUnionSetExpressionType:
        objj_msgSend(result, "unionSet:", right);
        break;
    case CPMinusSetExpressionType:
        objj_msgSend(result, "minusSet:", right);
        break;
default:
    }
    return result;
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"), function $_CPSetExpression___expressionWithSubstitutionVariables_(self, _cmd, variables)
{
    return self;
}
,["CPExpression","CPDictionary"]), new objj_method(sel_getUid("leftExpression"), function $_CPSetExpression__leftExpression(self, _cmd)
{
    return self._left;
}
,["CPExpression"]), new objj_method(sel_getUid("rightExpression"), function $_CPSetExpression__rightExpression(self, _cmd)
{
    return self._right;
}
,["CPExpression"]), new objj_method(sel_getUid("description"), function $_CPSetExpression__description(self, _cmd)
{
    var desc;
    switch(self._type) {
    case CPIntersectSetExpressionType:
        desc = " INTERSECT ";
        break;
    case CPUnionSetExpressionType:
        desc = " UNION ";
        break;
    case CPMinusSetExpressionType:
        desc = " MINUS ";
        break;
default:
    }
    return objj_msgSend(self._left, "description") + desc + objj_msgSend(self._right, "description");
}
,["CPString"])]);
}var CPLeftExpressionKey = "CPLeftExpression",
    CPRightExpressionKey = "CPRightExpression",
    CPExpressionType = "CPExpressionType";
{
var the_class = objj_getClass("_CPSetExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPSetExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPSetExpression__initWithCoder_(self, _cmd, coder)
{
    var left = objj_msgSend(coder, "decodeObjectForKey:", CPLeftExpressionKey),
        right = objj_msgSend(coder, "decodeObjectForKey:", CPRightExpressionKey),
        type = objj_msgSend(coder, "decodeIntForKey:", CPExpressionType);
    return objj_msgSend(self, "initWithType:left:right:", type, left, right);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPSetExpression__encodeWithCoder_(self, _cmd, coder)
{
    objj_msgSend(coder, "encodeObject:forKey:", self._left, CPLeftExpressionKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._right, CPRightExpressionKey);
    objj_msgSend(coder, "encodeInt:forKey:", self._type, CPExpressionType);
}
,["void","CPCoder"])]);
}