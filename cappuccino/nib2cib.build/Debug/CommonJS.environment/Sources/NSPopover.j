@STATIC;1.0;I;18;AppKit/CPPopover.jt;1350;objj_executeFile("AppKit/CPPopover.j", NO);


{
var the_class = objj_getClass("CPPopover")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPopover\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPPopover__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopover").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        _behavior = objj_msgSend(aCoder, "decodeIntForKey:", "NSBehavior");
        _appearance = objj_msgSend(aCoder, "decodeIntForKey:", "NSAppearance");
        _animates = objj_msgSend(aCoder, "decodeBoolForKey:", "NSAnimates");
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPPopover, "NSPopover"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSPopover__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSPopover__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPPopover, "class");
}
},["Class"])]);
}

