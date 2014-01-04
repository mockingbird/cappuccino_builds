@STATIC;1.0;i;14;CPDictionary.ji;14;CPExpression.ji;10;CPString.jt;1810;
objj_executeFile("CPDictionary.j", YES);
objj_executeFile("CPExpression.j", YES);
objj_executeFile("CPString.j", YES);

var evaluatedObject = nil;

{var the_class = objj_allocateClassPair(CPExpression, "_CPSelfExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPSelfExpression__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPSelfExpression").super_class }, "initWithExpressionType:", CPEvaluatedObjectExpressionType);

    return self;
}
},["id"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPSelfExpression__initWithCoder_(self, _cmd, coder)
{ with(self)
{
    return objj_msgSend(_CPSelfExpression, "evaluatedObject");
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPSelfExpression__encodeWithCoder_(self, _cmd, coder)
{ with(self)
{
}
},["void","CPCoder"]), new objj_method(sel_getUid("isEqual:"), function $_CPSelfExpression__isEqual_(self, _cmd, object)
{ with(self)
{
    return (object === self);
}
},["BOOL","id"]), new objj_method(sel_getUid("expressionValueWithObject:context:"), function $_CPSelfExpression__expressionValueWithObject_context_(self, _cmd, object, context)
{ with(self)
{
    return object;
}
},["id","id","CPDictionary"]), new objj_method(sel_getUid("description"), function $_CPSelfExpression__description(self, _cmd)
{ with(self)
{
    return "SELF";
}
},["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("evaluatedObject"), function $_CPSelfExpression__evaluatedObject(self, _cmd)
{ with(self)
{
    if (evaluatedObject == nil)
        evaluatedObject = objj_msgSend(_CPSelfExpression, "new");

    return evaluatedObject;
}
},["id"])]);
}

