@STATIC;1.0;i;18;CPKeyValueCoding.ji;10;CPString.ji;15;_CPExpression.ji;23;_CPFunctionExpression.ji;28;_CPConstantValueExpression.jt;2707;objj_executeFile("CPKeyValueCoding.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("_CPExpression.j", YES);objj_executeFile("_CPFunctionExpression.j", YES);objj_executeFile("_CPConstantValueExpression.j", YES);{var the_class = objj_allocateClassPair(_CPFunctionExpression, "_CPKeyPathExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKeyPath:"), function $_CPKeyPathExpression__initWithKeyPath_(self, _cmd, keyPath)
{
    return objj_msgSend(self, "initWithOperand:andKeyPath:", objj_msgSend(CPExpression, "expressionForEvaluatedObject"), keyPath);
}
,["id","CPString"]), new objj_method(sel_getUid("initWithOperand:andKeyPath:"), function $_CPKeyPathExpression__initWithOperand_andKeyPath_(self, _cmd, operand, keyPath)
{
    var arg = objj_msgSend(CPExpression, "expressionForConstantValue:", keyPath);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKeyPathExpression").super_class }, "initWithTarget:selector:arguments:type:", operand, sel_getUid("valueForKeyPath:"), [arg], CPKeyPathExpressionType);
    return self;
}
,["id","CPExpression","CPString"]), new objj_method(sel_getUid("isEqual:"), function $_CPKeyPathExpression__isEqual_(self, _cmd, object)
{
    if (object === self)
        return YES;
    if (object === nil || object.isa !== self.isa || !objj_msgSend(objj_msgSend(object, "keyPath"), "isEqualToString:", objj_msgSend(self, "keyPath")))
        return NO;
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("pathExpression"), function $_CPKeyPathExpression__pathExpression(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "arguments"), "objectAtIndex:", 0);
}
,["CPExpression"]), new objj_method(sel_getUid("keyPath"), function $_CPKeyPathExpression__keyPath(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "pathExpression"), "keyPath");
}
,["CPString"]), new objj_method(sel_getUid("description"), function $_CPKeyPathExpression__description(self, _cmd)
{
    var result = "";
    if (objj_msgSend(self._operand, "expressionType") != CPEvaluatedObjectExpressionType)
        result += objj_msgSend(self._operand, "description") + ".";
    result += objj_msgSend(self, "keyPath");
    return result;
}
,["CPString"])]);
}{
var the_class = objj_getClass("_CPConstantValueExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPConstantValueExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("keyPath"), function $_CPConstantValueExpression__keyPath(self, _cmd)
{
    return objj_msgSend(self, "constantValue");
}
,["CPString"])]);
}