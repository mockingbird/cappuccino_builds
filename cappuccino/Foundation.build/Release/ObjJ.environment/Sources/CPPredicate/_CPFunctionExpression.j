@STATIC;1.0;i;9;CPArray.ji;8;CPDate.ji;14;CPDictionary.ji;13;CPException.ji;10;CPString.ji;15;_CPExpression.jt;12901;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDate.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("_CPExpression.j", YES);{var the_class = objj_allocateClassPair(CPExpression, "_CPFunctionExpression"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_operand"), new objj_ivar("_selector"), new objj_ivar("_arguments"), new objj_ivar("_argc"), new objj_ivar("_maxargs")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithSelector:arguments:"), function $_CPFunctionExpression__initWithSelector_arguments_(self, _cmd, aSelector, parameters)
{
    var target = (CPPredicateUtilities == null ? null : CPPredicateUtilities.isa.objj_msgSend0(CPPredicateUtilities, "class"));
    if (!(target == null ? null : target.isa.objj_msgSend1(target, "respondsToSelector:", aSelector)))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Unknown function implementation: " + aSelector);
    var operand = CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", target);
    return self.isa.objj_msgSend3(self, "initWithTarget:selector:arguments:", operand, aSelector, parameters);
}
,["id","SEL","CPArray"]), new objj_method(sel_getUid("initWithTarget:selector:arguments:"), function $_CPFunctionExpression__initWithTarget_selector_arguments_(self, _cmd, operand, aSelector, parameters)
{
    return self.isa.objj_msgSend(self, "initWithTarget:selector:arguments:type:", operand, aSelector, parameters, CPFunctionExpressionType);
}
,["id","CPExpression","SEL","CPArray"]), new objj_method(sel_getUid("initWithTarget:selector:arguments:type:"), function $_CPFunctionExpression__initWithTarget_selector_arguments_type_(self, _cmd, operand, aSelector, parameters, type)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPFunctionExpression").super_class }, "initWithExpressionType:", type);
    if (self)
    {
        self._selector = aSelector;
        self._operand = operand;
        self._arguments = parameters;
        self._argc = (parameters == null ? null : parameters.isa.objj_msgSend0(parameters, "count"));
        self._maxargs = ((___r1 = ((___r2 = CPStringFromSelector(self._selector)), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "componentsSeparatedByString:", ":"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1;
    }
    return self;
    var ___r1, ___r2;
}
,["id","CPExpression","SEL","CPArray","int"]), new objj_method(sel_getUid("isEqual:"), function $_CPFunctionExpression__isEqual_(self, _cmd, object)
{
    if (self === object)
        return YES;
    if (object === nil || object.isa !== self.isa || !((___r1 = (object == null ? null : object.isa.objj_msgSend0(object, "_function"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", self._selector)) || !((___r1 = (object == null ? null : object.isa.objj_msgSend0(object, "operand"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", self._operand)) || !((___r1 = (object == null ? null : object.isa.objj_msgSend0(object, "arguments"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToArray:", self._arguments)))
        return NO;
    return YES;
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("_function"), function $_CPFunctionExpression___function(self, _cmd)
{
    return CPStringFromSelector(self._selector);
}
,["CPString"]), new objj_method(sel_getUid("function"), function $_CPFunctionExpression__function(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "_function");
}
,["CPString"]), new objj_method(sel_getUid("arguments"), function $_CPFunctionExpression__arguments(self, _cmd)
{
    return self._arguments;
}
,["CPArray"]), new objj_method(sel_getUid("operand"), function $_CPFunctionExpression__operand(self, _cmd)
{
    return self._operand;
}
,["CPExpression"]), new objj_method(sel_getUid("expressionValueWithObject:context:"), function $_CPFunctionExpression__expressionValueWithObject_context_(self, _cmd, object, context)
{
    var target = ((___r1 = self._operand), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "expressionValueWithObject:context:", object, context)),
        objj_args = [target, self._selector],
        i = 0;
    for (; i < self._argc; i++)
    {
        var arg = ((___r1 = self._arguments[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "expressionValueWithObject:context:", object, context));
        objj_args.push(arg);
    }
    if (self._argc > self._maxargs)
    {
        var r = MAX(self._maxargs + 1, 2);
        objj_args = (objj_args.slice(0, r)).concat([objj_args.slice(r)]);
    }
    return objj_msgSend.apply(this, objj_args);
    var ___r1;
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("description"), function $_CPFunctionExpression__description(self, _cmd)
{
    var result = "";
    if (((___r1 = self._operand), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", (CPPredicateUtilities == null ? null : CPPredicateUtilities.isa.objj_msgSend0(CPPredicateUtilities, "class"))))))
        result += CPStringFromSelector(self._selector) + "(";
    else
    {
        result += "FUNCTION(";
        result += self._operand ? ((___r1 = self._operand), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + ", " : "";
        result += self._selector ? CPStringFromSelector(self._selector) + ", " : "";
    }
    for (var i = 0; i < self._argc; i++)
        result = result + ((___r1 = self._arguments[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + (i + 1 < self._argc ? ", " : "");
    result += ")";
    return result;
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"), function $_CPFunctionExpression___expressionWithSubstitutionVariables_(self, _cmd, variables)
{
    var operand = ((___r1 = self.isa.objj_msgSend0(self, "operand")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_expressionWithSubstitutionVariables:", variables)),
        args = CPArray.isa.objj_msgSend0(CPArray, "array"),
        i = 0;
    for (; i < self._argc; i++)
        (args == null ? null : args.isa.objj_msgSend1(args, "addObject:", ((___r1 = self._arguments[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_expressionWithSubstitutionVariables:", variables))));
    return CPExpression.isa.objj_msgSend3(CPExpression, "expressionForFunction:selectorName:arguments:", operand, self.isa.objj_msgSend0(self, "_function"), args);
    var ___r1;
}
,["CPExpression","CPDictionary"])]);
}var CPSelectorNameKey = "CPSelectorName",
    CPArgumentsKey = "CPArguments",
    CPOperandKey = "CPOperand",
    CPExpressionTypeKey = "CPExpressionType";
{
var the_class = objj_getClass("_CPFunctionExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPFunctionExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPFunctionExpression__initWithCoder_(self, _cmd, coder)
{
    var type = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", CPExpressionTypeKey)),
        operand = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPOperandKey)),
        selector = CPSelectorFromString((coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPSelectorNameKey))),
        parameters = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPArgumentsKey));
    return self.isa.objj_msgSend(self, "initWithTarget:selector:arguments:type:", operand, selector, parameters, type);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPFunctionExpression__encodeWithCoder_(self, _cmd, coder)
{
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "_function"), CPSelectorNameKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._arguments, CPArgumentsKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._operand, CPOperandKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._type, CPExpressionTypeKey));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPObject, "CPPredicateUtilities"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("sum:"), function $CPPredicateUtilities__sum_(self, _cmd, parameters)
{
    var sum = 0,
        count = parameters.length;
    while (count--)
        sum += parameters[count];
    return sum;
}
,["float","CPArray"]), new objj_method(sel_getUid("count:"), function $CPPredicateUtilities__count_(self, _cmd, parameters)
{
    return (parameters == null ? null : parameters.isa.objj_msgSend0(parameters, "count"));
}
,["float","CPArray"]), new objj_method(sel_getUid("min:"), function $CPPredicateUtilities__min_(self, _cmd, parameters)
{
    return (parameters.sort())[0];
}
,["float","CPArray"]), new objj_method(sel_getUid("max:"), function $CPPredicateUtilities__max_(self, _cmd, parameters)
{
    return (parameters.sort())[parameters.length - 1];
}
,["float","CPArray"]), new objj_method(sel_getUid("average:"), function $CPPredicateUtilities__average_(self, _cmd, parameters)
{
    return self.isa.objj_msgSend1(self, "sum:", parameters) / parameters.length;
}
,["float","CPArray"]), new objj_method(sel_getUid("first:"), function $CPPredicateUtilities__first_(self, _cmd, parameters)
{
    return parameters[0];
}
,["id","CPArray"]), new objj_method(sel_getUid("last:"), function $CPPredicateUtilities__last_(self, _cmd, parameters)
{
    return parameters[parameters.length - 1];
}
,["id","CPArray"]), new objj_method(sel_getUid("fromObject:index:"), function $CPPredicateUtilities__fromObject_index_(self, _cmd, object, anIndex)
{
    if ((object == null ? null : object.isa.objj_msgSend1(object, "isKindOfClass:", CPDictionary.isa.objj_msgSend0(CPDictionary, "class"))))
        return (object == null ? null : object.isa.objj_msgSend1(object, "objectForKey:", anIndex));
    else
        (object == null ? null : object.isa.objj_msgSend1(object, "isKindOfClass:", CPArray.isa.objj_msgSend0(CPArray, "class")));
    return (object == null ? null : object.isa.objj_msgSend1(object, "objectAtIndex:", anIndex));
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "object[#] requires a CPDictionary or CPArray");
}
,["id","id","id"]), new objj_method(sel_getUid("add:to:"), function $CPPredicateUtilities__add_to_(self, _cmd, n, m)
{
    return n + m;
}
,["float","int","int"]), new objj_method(sel_getUid("from:substract:"), function $CPPredicateUtilities__from_substract_(self, _cmd, n, m)
{
    return n - m;
}
,["float","int","int"]), new objj_method(sel_getUid("multiply:by:"), function $CPPredicateUtilities__multiply_by_(self, _cmd, n, m)
{
    return n * m;
}
,["float","float","int"]), new objj_method(sel_getUid("divide:by:"), function $CPPredicateUtilities__divide_by_(self, _cmd, n, m)
{
    return n / m;
}
,["float","float","float"]), new objj_method(sel_getUid("sqrt:"), function $CPPredicateUtilities__sqrt_(self, _cmd, n)
{
    return SQRT(n);
}
,["float","float"]), new objj_method(sel_getUid("raise:to:"), function $CPPredicateUtilities__raise_to_(self, _cmd, num, power)
{
    return POW(num, power);
}
,["float","float","int"]), new objj_method(sel_getUid("abs:"), function $CPPredicateUtilities__abs_(self, _cmd, num)
{
    return ABS(num);
}
,["float","float"]), new objj_method(sel_getUid("now:"), function $CPPredicateUtilities__now_(self, _cmd, _)
{
    return CPDate.isa.objj_msgSend0(CPDate, "date");
}
,["CPDate","id"]), new objj_method(sel_getUid("ln:"), function $CPPredicateUtilities__ln_(self, _cmd, num)
{
    return LN10(num);
}
,["float","float"]), new objj_method(sel_getUid("exp:"), function $CPPredicateUtilities__exp_(self, _cmd, num)
{
    return EXP(num);
}
,["float","float"]), new objj_method(sel_getUid("ceiling:"), function $CPPredicateUtilities__ceiling_(self, _cmd, num)
{
    return CEIL(num);
}
,["float","float"]), new objj_method(sel_getUid("random:"), function $CPPredicateUtilities__random_(self, _cmd, num)
{
    return ROUND(RAND() * num);
}
,["int","int"]), new objj_method(sel_getUid("modulus:by:"), function $CPPredicateUtilities__modulus_by_(self, _cmd, n, m)
{
    return n % m;
}
,["int","int","int"]), new objj_method(sel_getUid("chs:"), function $CPPredicateUtilities__chs_(self, _cmd, num)
{
    return -num;
}
,["float","int"])]);
}