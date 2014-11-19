@STATIC;1.0;i;10;CPObject.jt;4055;objj_executeFile("CPObject.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPInvocation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_returnValue"), new objj_ivar("_arguments"), new objj_ivar("_methodSignature")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithMethodSignature:"), function $CPInvocation__initWithMethodSignature_(self, _cmd, aMethodSignature)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPInvocation").super_class }, "init");
    if (self)
    {
        self._arguments = [];
        self._methodSignature = aMethodSignature;
    }
    return self;
}
,["id","CPMethodSignature"]), new objj_method(sel_getUid("setSelector:"), function $CPInvocation__setSelector_(self, _cmd, aSelector)
{
    self._arguments[1] = aSelector;
}
,["void","SEL"]), new objj_method(sel_getUid("selector"), function $CPInvocation__selector(self, _cmd)
{
    return self._arguments[1];
}
,["SEL"]), new objj_method(sel_getUid("setTarget:"), function $CPInvocation__setTarget_(self, _cmd, aTarget)
{
    self._arguments[0] = aTarget;
}
,["void","id"]), new objj_method(sel_getUid("target"), function $CPInvocation__target(self, _cmd)
{
    return self._arguments[0];
}
,["id"]), new objj_method(sel_getUid("setArgument:atIndex:"), function $CPInvocation__setArgument_atIndex_(self, _cmd, anArgument, anIndex)
{
    self._arguments[anIndex] = anArgument;
}
,["void","id","CPUInteger"]), new objj_method(sel_getUid("argumentAtIndex:"), function $CPInvocation__argumentAtIndex_(self, _cmd, anIndex)
{
    return self._arguments[anIndex];
}
,["id","CPUInteger"]), new objj_method(sel_getUid("setReturnValue:"), function $CPInvocation__setReturnValue_(self, _cmd, aReturnValue)
{
    self._returnValue = aReturnValue;
}
,["void","id"]), new objj_method(sel_getUid("returnValue"), function $CPInvocation__returnValue(self, _cmd)
{
    return self._returnValue;
}
,["id"]), new objj_method(sel_getUid("invoke"), function $CPInvocation__invoke(self, _cmd)
{
    self._returnValue = objj_msgSend.apply(objj_msgSend, self._arguments);
}
,["void"]), new objj_method(sel_getUid("invokeWithTarget:"), function $CPInvocation__invokeWithTarget_(self, _cmd, aTarget)
{
    self._arguments[0] = aTarget;
    self._returnValue = objj_msgSend.apply(objj_msgSend, self._arguments);
}
,["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("invocationWithMethodSignature:"), function $CPInvocation__invocationWithMethodSignature_(self, _cmd, aMethodSignature)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithMethodSignature:", aMethodSignature));
    var ___r1;
}
,["id","CPMethodSignature"])]);
}var CPInvocationArguments = "CPInvocationArguments",
    CPInvocationReturnValue = "CPInvocationReturnValue";
{
var the_class = objj_getClass("CPInvocation")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPInvocation\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPInvocation__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPInvocation").super_class }, "init");
    if (self)
    {
        self._returnValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPInvocationReturnValue));
        self._arguments = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPInvocationArguments));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPInvocation__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._returnValue, CPInvocationReturnValue));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._arguments, CPInvocationArguments));
}
,["void","CPCoder"])]);
}