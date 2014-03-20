@STATIC;1.0;i;14;CPInvocation.ji;10;CPObject.ji;13;CPOperation.jt;1972;objj_executeFile("CPInvocation.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPOperation.j", YES);{var the_class = objj_allocateClassPair(CPOperation, "CPInvocationOperation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_invocation")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("main"), function $CPInvocationOperation__main(self, _cmd)
{
    if (self._invocation)
    {
        objj_msgSend(self._invocation, "invoke");
    }
}
,["void"]), new objj_method(sel_getUid("init"), function $CPInvocationOperation__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPInvocationOperation").super_class }, "init"))
    {
        self._invocation = nil;
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithInvocation:"), function $CPInvocationOperation__initWithInvocation_(self, _cmd, inv)
{
    if (self = objj_msgSend(self, "init"))
    {
        self._invocation = inv;
    }
    return self;
}
,["id","CPInvocation"]), new objj_method(sel_getUid("initWithTarget:selector:object:"), function $CPInvocationOperation__initWithTarget_selector_object_(self, _cmd, target, sel, arg)
{
    var inv = objj_msgSend(objj_msgSend(CPInvocation, "alloc"), "initWithMethodSignature:", nil);
    objj_msgSend(inv, "setTarget:", target);
    objj_msgSend(inv, "setSelector:", sel);
    objj_msgSend(inv, "setArgument:atIndex:", arg, 2);
    return objj_msgSend(self, "initWithInvocation:", inv);
}
,["id","id","SEL","id"]), new objj_method(sel_getUid("invocation"), function $CPInvocationOperation__invocation(self, _cmd)
{
    return self._invocation;
}
,["CPInvocation"]), new objj_method(sel_getUid("result"), function $CPInvocationOperation__result(self, _cmd)
{
    if (objj_msgSend(self, "isFinished") && self._invocation)
    {
        return objj_msgSend(self._invocation, "returnValue");
    }
    return nil;
}
,["id"])]);
}