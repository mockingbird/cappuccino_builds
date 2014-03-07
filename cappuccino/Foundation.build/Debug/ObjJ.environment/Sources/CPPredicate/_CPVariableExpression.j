@STATIC;1.0;i;14;CPDictionary.ji;13;CPException.ji;10;CPString.ji;15;_CPExpression.jt;3246;objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("_CPExpression.j", YES);{var the_class = objj_allocateClassPair(CPExpression, "_CPVariableExpression"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_variable")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithVariable:"), function $_CPVariableExpression__initWithVariable_(self, _cmd, variable)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPVariableExpression").super_class }, "initWithExpressionType:", CPVariableExpressionType);
    if (self)
    {
        self._variable = objj_msgSend(variable, "copy");
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("isEqual:"), function $_CPVariableExpression__isEqual_(self, _cmd, object)
{
    if (self === object)
        return YES;
    if (object === nil || object.isa !== self.isa || !objj_msgSend(objj_msgSend(object, "variable"), "isEqual:", self._variable))
        return NO;
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("variable"), function $_CPVariableExpression__variable(self, _cmd)
{
    return self._variable;
}
,["CPString"]), new objj_method(sel_getUid("expressionValueWithObject:context:"), function $_CPVariableExpression__expressionValueWithObject_context_(self, _cmd, object, context)
{
    var expression = objj_msgSend(self, "_expressionWithSubstitutionVariables:", context);
    return objj_msgSend(expression, "expressionValueWithObject:context:", object, context);
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("description"), function $_CPVariableExpression__description(self, _cmd)
{
    return objj_msgSend(CPString, "stringWithFormat:", "$%s", self._variable);
}
,["CPString"]), new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"), function $_CPVariableExpression___expressionWithSubstitutionVariables_(self, _cmd, variables)
{
    var value = objj_msgSend(variables, "objectForKey:", self._variable);
    if (value == nil)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Can't get value for '" + self._variable + "' in bindings" + variables);
    if (objj_msgSend(value, "isKindOfClass:", objj_msgSend(CPExpression, "class")))
        return value;
    return objj_msgSend(CPExpression, "expressionForConstantValue:", value);
}
,["CPExpression","CPDictionary"])]);
}var CPVariableKey = "CPVariable";
{
var the_class = objj_getClass("_CPVariableExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPVariableExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPVariableExpression__initWithCoder_(self, _cmd, coder)
{
    var variable = objj_msgSend(coder, "decodeObjectForKey:", CPVariableKey);
    return objj_msgSend(self, "initWithVariable:", variable);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPVariableExpression__encodeWithCoder_(self, _cmd, coder)
{
    objj_msgSend(coder, "encodeObject:forKey:", self._variable, CPVariableKey);
}
,["void","CPCoder"])]);
}