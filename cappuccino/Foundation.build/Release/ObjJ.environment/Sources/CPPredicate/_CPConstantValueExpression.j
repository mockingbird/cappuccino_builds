@STATIC;1.0;i;14;CPDictionary.ji;15;_CPExpression.jt;2494;objj_executeFile("CPDictionary.j", YES);objj_executeFile("_CPExpression.j", YES);{var the_class = objj_allocateClassPair(CPExpression, "_CPConstantValueExpression"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_value")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithValue:"), function $_CPConstantValueExpression__initWithValue_(self, _cmd, value)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPConstantValueExpression").super_class }, "initWithExpressionType:", CPConstantValueExpressionType);
    if (self)
        self._value = value;
    return self;
}
,["id","id"]), new objj_method(sel_getUid("isEqual:"), function $_CPConstantValueExpression__isEqual_(self, _cmd, object)
{
    if (self === object)
        return YES;
    if (object === nil || object.isa !== self.isa || !objj_msgSend(objj_msgSend(object, "constantValue"), "isEqual:", self._value))
        return NO;
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("constantValue"), function $_CPConstantValueExpression__constantValue(self, _cmd)
{
    return self._value;
}
,["id"]), new objj_method(sel_getUid("expressionValueWithObject:context:"), function $_CPConstantValueExpression__expressionValueWithObject_context_(self, _cmd, object, context)
{
    return self._value;
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("description"), function $_CPConstantValueExpression__description(self, _cmd)
{
    if (objj_msgSend(self._value, "isKindOfClass:", objj_msgSend(CPString, "class")))
        return "\"" + self._value + "\"";
    return objj_msgSend(self._value, "description");
}
,["CPString"])]);
}var CPConstantValueKey = "CPConstantValue";
{
var the_class = objj_getClass("_CPConstantValueExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPConstantValueExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPConstantValueExpression__initWithCoder_(self, _cmd, coder)
{
    var value = objj_msgSend(coder, "decodeObjectForKey:", CPConstantValueKey);
    return objj_msgSend(self, "initWithValue:", value);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPConstantValueExpression__encodeWithCoder_(self, _cmd, coder)
{
    objj_msgSend(coder, "encodeObject:forKey:", self._value, CPConstantValueKey);
}
,["void","CPCoder"])]);
}