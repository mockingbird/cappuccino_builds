@STATIC;1.0;i;14;CPDictionary.ji;15;_CPExpression.jt;2817;objj_executeFile("CPDictionary.j", YES);objj_executeFile("_CPExpression.j", YES);{var the_class = objj_allocateClassPair(CPExpression, "_CPConstantValueExpression"),
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
    if (object === nil || object.isa !== self.isa || !((___r1 = (object == null ? null : object.isa.objj_msgSend0(object, "constantValue"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", self._value)))
        return NO;
    return YES;
    var ___r1;
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
    if (((___r1 = self._value), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPString.isa.objj_msgSend0(CPString, "class"))))
        return "\"" + self._value + "\"";
    return ((___r1 = self._value), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description"));
    var ___r1;
}
,["CPString"])]);
}var CPConstantValueKey = "CPConstantValue";
{
var the_class = objj_getClass("_CPConstantValueExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPConstantValueExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPConstantValueExpression__initWithCoder_(self, _cmd, coder)
{
    var value = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPConstantValueKey));
    return self.isa.objj_msgSend1(self, "initWithValue:", value);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPConstantValueExpression__encodeWithCoder_(self, _cmd, coder)
{
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._value, CPConstantValueKey));
}
,["void","CPCoder"])]);
}