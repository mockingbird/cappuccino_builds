@STATIC;1.0;i;13;CPException.ji;7;CPSet.ji;15;_CPExpression.jt;6135;objj_executeFile("CPException.j", YES);objj_executeFile("CPSet.j", YES);objj_executeFile("_CPExpression.j", YES);{var the_class = objj_allocateClassPair(CPExpression, "_CPSetExpression"),
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
    if (object === nil || object.isa !== self.isa || !((___r1 = (object == null ? null : object.isa.objj_msgSend0(object, "leftExpression"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", self._left)) || !((___r1 = (object == null ? null : object.isa.objj_msgSend0(object, "rightExpression"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", self._right)))
        return NO;
    return YES;
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("expressionValueWithObject:context:"), function $_CPSetExpression__expressionValueWithObject_context_(self, _cmd, object, context)
{
    var right = ((___r1 = self._right), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "expressionValueWithObject:context:", object, context));
    if ((right == null ? null : right.isa.objj_msgSend1(right, "isKindOfClass:", CPArray.isa.objj_msgSend0(CPArray, "class"))))
        right = CPSet.isa.objj_msgSend1(CPSet, "setWithArray:", right);
    else if ((right == null ? null : right.isa.objj_msgSend1(right, "isKindOfClass:", CPDictionary.isa.objj_msgSend0(CPDictionary, "class"))))
        right = CPSet.isa.objj_msgSend1(CPSet, "setWithArray:", (right == null ? null : right.isa.objj_msgSend0(right, "allValues")));
    else if (!(right == null ? null : right.isa.objj_msgSend1(right, "isKindOfClass:", CPSet.isa.objj_msgSend0(CPSet, "class"))))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "The right expression for a CP*SetExpressionType expression must evaluate to a CPArray, CPDictionary or CPSet");
    var left = ((___r1 = self._left), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "expressionValueWithObject:context:", object, context));
    if (!(left == null ? null : left.isa.objj_msgSend1(left, "isKindOfClass:", CPSet.isa.objj_msgSend0(CPSet, "class"))))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "The left expression for a CP*SetExpressionType expression must evaluate to a CPSet");
    var result = (left == null ? null : left.isa.objj_msgSend0(left, "copy"));
    switch(self._type) {
    case CPIntersectSetExpressionType:
        (result == null ? null : result.isa.objj_msgSend1(result, "intersectSet:", right));
        break;
    case CPUnionSetExpressionType:
        (result == null ? null : result.isa.objj_msgSend1(result, "unionSet:", right));
        break;
    case CPMinusSetExpressionType:
        (result == null ? null : result.isa.objj_msgSend1(result, "minusSet:", right));
        break;
default:
    }
    return result;
    var ___r1;
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
    return ((___r1 = self._left), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + desc + ((___r1 = self._right), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description"));
    var ___r1;
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
    var left = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPLeftExpressionKey)),
        right = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRightExpressionKey)),
        type = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", CPExpressionType));
    return self.isa.objj_msgSend3(self, "initWithType:left:right:", type, left, right);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPSetExpression__encodeWithCoder_(self, _cmd, coder)
{
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._left, CPLeftExpressionKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._right, CPRightExpressionKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._type, CPExpressionType));
}
,["void","CPCoder"])]);
}