@STATIC;1.0;I;22;AppKit/CPTabViewItem.jt;1531;objj_executeFile("AppKit/CPTabViewItem.j", NO);{
var the_class = objj_getClass("CPTabViewItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTabViewItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTabViewItem__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTabViewItem").super_class }, "init"))
    {
        self._identifier = objj_msgSend(aCoder, "decodeObjectForKey:", "NSIdentifier");
        self._label = objj_msgSend(aCoder, "decodeObjectForKey:", "NSLabel");
        self._view = objj_msgSend(aCoder, "decodeObjectForKey:", "NSView");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("awakeFromNib"), function $CPTabViewItem__awakeFromNib(self, _cmd)
{
    if (objj_msgSend(self._view, "superview"))
        objj_msgSend(self._view, "removeFromSuperview");
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPTabViewItem, "NSTabViewItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTabViewItem__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTabViewItem__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPTabViewItem, "class");
}
,["Class"])]);
}