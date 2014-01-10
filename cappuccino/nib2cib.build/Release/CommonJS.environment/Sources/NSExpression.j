@STATIC;1.0;I;25;Foundation/CPExpression.jI;33;Foundation/_CPKeyPathExpression.jI;29;Foundation/_CPSetExpression.jI;30;Foundation/_CPSelfExpression.jI;39;Foundation/_CPConstantValueExpression.jI;34;Foundation/_CPFunctionExpression.jI;34;Foundation/_CPVariableExpression.jI;35;Foundation/_CPAggregateExpression.jt;8732;objj_executeFile("Foundation/CPExpression.j", NO);objj_executeFile("Foundation/_CPKeyPathExpression.j", NO);objj_executeFile("Foundation/_CPSetExpression.j", NO);objj_executeFile("Foundation/_CPSelfExpression.j", NO);objj_executeFile("Foundation/_CPConstantValueExpression.j", NO);objj_executeFile("Foundation/_CPFunctionExpression.j", NO);objj_executeFile("Foundation/_CPVariableExpression.j", NO);objj_executeFile("Foundation/_CPAggregateExpression.j", NO);{var the_class = objj_allocateClassPair(_CPKeyPathExpression, "NSKeyPathExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSKeyPathExpression__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSKeyPathExpression__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPKeyPathExpression, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(_CPConstantValueExpression, "_CPKeyPathSpecifierExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPKeyPathSpecifierExpression__NS_initWithCoder_(self, _cmd, aCoder)
{
    var keyPath = objj_msgSend(aCoder, "decodeObjectForKey:", "NSKeyPath");
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPKeyPathSpecifierExpression").super_class }, "initWithValue:", keyPath);
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPKeyPathSpecifierExpression, "NSKeyPathSpecifierExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSKeyPathSpecifierExpression__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSKeyPathSpecifierExpression__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPConstantValueExpression, "class");
}
,["Class"])]);
}{
var the_class = objj_getClass("_CPConstantValueExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPConstantValueExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPConstantValueExpression__NS_initWithCoder_(self, _cmd, aCoder)
{
    var value = objj_msgSend(aCoder, "decodeObjectForKey:", "NSConstantValue");
    return objj_msgSend(self, "initWithValue:", value);
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPConstantValueExpression, "NSConstantValueExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSConstantValueExpression__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSConstantValueExpression__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPConstantValueExpression, "class");
}
,["Class"])]);
}{
var the_class = objj_getClass("_CPFunctionExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPFunctionExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPFunctionExpression__NS_initWithCoder_(self, _cmd, aCoder)
{
    var type = objj_msgSend(aCoder, "decodeIntForKey:", "NSExpressionType"),
        operand = objj_msgSend(aCoder, "decodeObjectForKey:", "NSOperand"),
        selector = CPSelectorFromString(objj_msgSend(aCoder, "decodeObjectForKey:", "NSSelectorName")),
        args = objj_msgSend(aCoder, "decodeObjectForKey:", "NSArguments");
    return objj_msgSend(self, "initWithTarget:selector:arguments:type:", operand, selector, args, type);
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPFunctionExpression, "NSFunctionExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSFunctionExpression__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSFunctionExpression__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPFunctionExpression, "class");
}
,["Class"])]);
}{
var the_class = objj_getClass("_CPSetExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPSetExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPSetExpression__NS_initWithCoder_(self, _cmd, aCoder)
{
    var type = objj_msgSend(aCoder, "decodeIntForKey:", "NSExpressionType"),
        left = objj_msgSend(aCoder, "decodeObjectForKey:", "NSLeftExpression"),
        right = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRightExpression");
    return objj_msgSend(self, "initWithType:left:right:", type, left, right);
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPSetExpression, "NSSetExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSetExpression__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSSetExpression__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPSetExpression, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(_CPSelfExpression, "NSSelfExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSelfExpression__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSSelfExpression").super_class }, "init");
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSSelfExpression__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPSelfExpression, "class");
}
,["Class"])]);
}{
var the_class = objj_getClass("_CPVariableExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPVariableExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPVariableExpression__NS_initWithCoder_(self, _cmd, aCoder)
{
    var variable = objj_msgSend(aCoder, "decodeObjectForKey:", "NSVariable");
    return objj_msgSend(self, "initWithVariable:", variable);
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPVariableExpression, "NSVariableExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSVariableExpression__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSVariableExpression__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPVariableExpression, "class");
}
,["Class"])]);
}{
var the_class = objj_getClass("_CPAggregateExpression")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPAggregateExpression\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPAggregateExpression__NS_initWithCoder_(self, _cmd, aCoder)
{
    var collection = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCollection");
    return objj_msgSend(self, "initWithAggregate:", collection);
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPAggregateExpression, "NSAggregateExpression"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSAggregateExpression__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSAggregateExpression__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPAggregateExpression, "class");
}
,["Class"])]);
}