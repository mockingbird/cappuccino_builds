@STATIC;1.0;I;20;AppKit/CPResponder.jt;1265;objj_executeFile("AppKit/CPResponder.j", NO);{
var the_class = objj_getClass("CPResponder")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPResponder\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPResponder__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder").super_class }, "init");
    if (self)
        (self == null ? null : self.isa.objj_msgSend1(self, "setNextResponder:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSNextResponder"))));
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPResponder, "NSResponder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSResponder__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSResponder__classForKeyedArchiver(self, _cmd)
{
    return CPResponder.isa.objj_msgSend0(CPResponder, "class");
}
,["Class"])]);
}