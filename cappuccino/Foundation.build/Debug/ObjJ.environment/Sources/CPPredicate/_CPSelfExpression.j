@STATIC;1.0;i;14;CPDictionary.ji;10;CPString.ji;15;_CPExpression.jt;1701;objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("_CPExpression.j", YES);var evaluatedObject = nil;
{var the_class = objj_allocateClassPair(CPExpression, "_CPSelfExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPSelfExpression__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPSelfExpression").super_class }, "initWithExpressionType:", CPEvaluatedObjectExpressionType);
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPSelfExpression__initWithCoder_(self, _cmd, coder)
{
    return objj_msgSend(_CPSelfExpression, "evaluatedObject");
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPSelfExpression__encodeWithCoder_(self, _cmd, coder)
{
}
,["void","CPCoder"]), new objj_method(sel_getUid("isEqual:"), function $_CPSelfExpression__isEqual_(self, _cmd, object)
{
    return object === self;
}
,["BOOL","id"]), new objj_method(sel_getUid("expressionValueWithObject:context:"), function $_CPSelfExpression__expressionValueWithObject_context_(self, _cmd, object, context)
{
    return object;
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("description"), function $_CPSelfExpression__description(self, _cmd)
{
    return "SELF";
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("evaluatedObject"), function $_CPSelfExpression__evaluatedObject(self, _cmd)
{
    if (evaluatedObject == nil)
        evaluatedObject = objj_msgSend(_CPSelfExpression, "new");
    return evaluatedObject;
}
,["id"])]);
}