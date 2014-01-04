@STATIC;1.0;I;33;AppKit/CPUserDefaultsController.jt;1574;objj_executeFile("AppKit/CPUserDefaultsController.j", NO);

{
var the_class = objj_getClass("CPUserDefaultsController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPUserDefaultsController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPUserDefaultsController__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (objj_msgSend(aCoder, "decodeBoolForKey:", "NSSharedInstance"))
        return objj_msgSend(CPUserDefaultsController, "sharedUserDefaultsController");

    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaultsController").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "decoding of non-shared NSUserDefaultsController not implemented");
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPUserDefaultsController, "NSUserDefaultsController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSUserDefaultsController__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSUserDefaultsController__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPUserDefaultsController, "class");
}
},["Class"])]);
}

