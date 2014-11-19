@STATIC;1.0;i;9;CPArray.ji;10;CPObject.ji;13;CPOperation.jt;2172;objj_executeFile("CPArray.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPOperation.j", YES);{var the_class = objj_allocateClassPair(CPOperation, "CPFunctionOperation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_functions")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("main"), function $CPFunctionOperation__main(self, _cmd)
{
    if (self._functions && ((___r1 = self._functions), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
    {
        var i = 0,
            count = ((___r1 = self._functions), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        for (; i < count; i++)
        {
            var func = ((___r1 = self._functions), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i));
            func();
        }
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("init"), function $CPFunctionOperation__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPFunctionOperation").super_class }, "init");
    if (self)
    {
        self._functions = [];
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("addExecutionFunction:"), function $CPFunctionOperation__addExecutionFunction_(self, _cmd, jsFunction)
{
    ((___r1 = self._functions), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", jsFunction));
    var ___r1;
}
,["void","JSObject"]), new objj_method(sel_getUid("executionFunctions"), function $CPFunctionOperation__executionFunctions(self, _cmd)
{
    return self._functions;
}
,["CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("functionOperationWithFunction:"), function $CPFunctionOperation__functionOperationWithFunction_(self, _cmd, jsFunction)
{
    functionOp = ((___r1 = CPFunctionOperation.isa.objj_msgSend0(CPFunctionOperation, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (functionOp == null ? null : functionOp.isa.objj_msgSend1(functionOp, "addExecutionFunction:", jsFunction));
    return functionOp;
    var ___r1;
}
,["id","JSObject"])]);
}