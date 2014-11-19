@STATIC;1.0;I;22;AppKit/CPTabViewItem.jt;1795;objj_executeFile("AppKit/CPTabViewItem.j", NO);{
var the_class = objj_getClass("CPTabViewItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTabViewItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTabViewItem__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTabViewItem").super_class }, "init"))
    {
        self._identifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSIdentifier"));
        self._label = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSLabel"));
        self._view = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSView"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("awakeFromNib"), function $CPTabViewItem__awakeFromNib(self, _cmd)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "superview")))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    var ___r1;
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPTabViewItem, "NSTabViewItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTabViewItem__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTabViewItem__classForKeyedArchiver(self, _cmd)
{
    return CPTabViewItem.isa.objj_msgSend0(CPTabViewItem, "class");
}
,["Class"])]);
}