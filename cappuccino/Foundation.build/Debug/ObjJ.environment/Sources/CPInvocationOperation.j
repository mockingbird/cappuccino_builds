@STATIC;1.0;i;14;CPInvocation.ji;10;CPObject.ji;13;CPOperation.jt;2344;objj_executeFile("CPInvocation.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPOperation.j", YES);{var the_class = objj_allocateClassPair(CPOperation, "CPInvocationOperation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_invocation")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("main"), function $CPInvocationOperation__main(self, _cmd)
{
    if (self._invocation)
    {
        ((___r1 = self._invocation), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invoke"));
    }
    var ___r1;
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
    if (self = (self == null ? null : self.isa.objj_msgSend0(self, "init")))
    {
        self._invocation = inv;
    }
    return self;
}
,["id","CPInvocation"]), new objj_method(sel_getUid("initWithTarget:selector:object:"), function $CPInvocationOperation__initWithTarget_selector_object_(self, _cmd, target, sel, arg)
{
    var inv = ((___r1 = CPInvocation.isa.objj_msgSend0(CPInvocation, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithMethodSignature:", nil));
    (inv == null ? null : inv.isa.objj_msgSend1(inv, "setTarget:", target));
    (inv == null ? null : inv.isa.objj_msgSend1(inv, "setSelector:", sel));
    (inv == null ? null : inv.isa.objj_msgSend2(inv, "setArgument:atIndex:", arg, 2));
    return self.isa.objj_msgSend1(self, "initWithInvocation:", inv);
    var ___r1;
}
,["id","id","SEL","id"]), new objj_method(sel_getUid("invocation"), function $CPInvocationOperation__invocation(self, _cmd)
{
    return self._invocation;
}
,["CPInvocation"]), new objj_method(sel_getUid("result"), function $CPInvocationOperation__result(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "isFinished") && self._invocation)
    {
        return ((___r1 = self._invocation), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "returnValue"));
    }
    return nil;
    var ___r1;
}
,["id"])]);
}