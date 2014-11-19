@STATIC;1.0;I;25;AppKit/CPViewController.jt;1660;objj_executeFile("AppKit/CPViewController.j", NO);{
var the_class = objj_getClass("CPViewController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPViewController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPViewController__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPViewController").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        self._title = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTitle"));
        self._cibName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSNibName"));
        var bundlePath = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSNibBundleIdentifier"));
        if (bundlePath)
            self._cibBundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithPath:", bundlePath);
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPViewController, "NSViewController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSViewController__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSViewController__classForKeyedArchiver(self, _cmd)
{
    return CPViewController.isa.objj_msgSend0(CPViewController, "class");
}
,["Class"])]);
}