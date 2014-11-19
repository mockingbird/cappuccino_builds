@STATIC;1.0;i;18;CPKeyValueCoding.ji;10;CPString.ji;15;_CPExpression.ji;23;_CPFunctionExpression.ji;28;_CPConstantValueExpression.jt;3166;objj_executeFile("CPKeyValueCoding.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("_CPExpression.j", YES);objj_executeFile("_CPFunctionExpression.j", YES);objj_executeFile("_CPConstantValueExpression.j", YES);{var the_class = objj_allocateClassPair(_CPFunctionExpression, "_CPKeyPathExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKeyPath:"), function $_CPKeyPathExpression__initWithKeyPath_(self, _cmd, keyPath)
{
    return self.isa.objj_msgSend2(self, "initWithOperand:andKeyPath:", CPExpression.isa.objj_msgSend0(CPExpression, "expressionForEvaluatedObject"), keyPath);
}
,["id","CPString"]), new objj_method(sel_getUid("initWithOperand:andKeyPath:"), function $_CPKeyPathExpression__initWithOperand_andKeyPath_(self, _cmd, operand, keyPath)
{
    var arg = CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", keyPath);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKeyPathExpression").super_class }, "initWithTarget:selector:arguments:type:", operand, sel_getUid("valueForKeyPath:"), [arg], CPKeyPathExpressionType);
    return self;
}
,["id","CPExpression","CPString"]), new objj_method(sel_getUid("isEqual:"), function $_CPKeyPathExpression__isEqual_(self, _cmd, object)
{
    if (object === self)
        return YES;
    if (object === nil || object.isa !== self.isa || !((___r1 = (object == null ? null : object.isa.objj_msgSend0(object, "keyPath"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToString:", self.isa.objj_msgSend0(self, "keyPath"))))
        return NO;
    return YES;
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("pathExpression"), function $_CPKeyPathExpression__pathExpression(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "arguments")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0));
    var ___r1;
}
,["CPExpression"]), new objj_method(sel_getUid("keyPath"), function $_CPKeyPathExpression__keyPath(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "pathExpression")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyPath"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("description"), function $_CPKeyPathExpression__description(self, _cmd)
{
    var result = "";
    if (((___r1 = self._operand), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "expressionType")) != CPEvaluatedObjectExpressionType)
        result += ((___r1 = self._operand), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + ".";
    result += self.isa.objj_msgSend0(self, "keyPath");
    return result;
    var ___r1;
}
,["CPString"])]);
}{
var the_class = objj_getClass("_CPConstantValueExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPConstantValueExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("keyPath"), function $_CPConstantValueExpression__keyPath(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "constantValue");
}
,["CPString"])]);
}