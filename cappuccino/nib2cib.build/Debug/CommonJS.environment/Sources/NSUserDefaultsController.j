@STATIC;1.0;I;33;AppKit/CPUserDefaultsController.jt;1648;objj_executeFile("AppKit/CPUserDefaultsController.j", NO);{
var the_class = objj_getClass("CPUserDefaultsController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPUserDefaultsController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPUserDefaultsController__NS_initWithCoder_(self, _cmd, aCoder)
{
    if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSSharedInstance")))
        return CPUserDefaultsController.isa.objj_msgSend0(CPUserDefaultsController, "sharedUserDefaultsController");
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaultsController").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "decoding of non-shared NSUserDefaultsController not implemented");
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPUserDefaultsController, "NSUserDefaultsController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSUserDefaultsController__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSUserDefaultsController__classForKeyedArchiver(self, _cmd)
{
    return CPUserDefaultsController.isa.objj_msgSend0(CPUserDefaultsController, "class");
}
,["Class"])]);
}