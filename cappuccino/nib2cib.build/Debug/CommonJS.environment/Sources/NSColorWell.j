@STATIC;1.0;I;20;AppKit/CPColorWell.ji;8;NSCell.ji;11;NSControl.jt;2388;objj_executeFile("AppKit/CPColorWell.j", NO);objj_executeFile("NSCell.j", YES);objj_executeFile("NSControl.j", YES);{
var the_class = objj_getClass("CPColorWell")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPColorWell\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPColorWell__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setEnabled:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSEnabled"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBordered:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSIsBordered"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setColor:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSColor"))));
        if ((self == null ? null : self.isa.objj_msgSend0(self, "isBordered")))
        {
            var frameSize = (self == null ? null : self.isa.objj_msgSend0(self, "frameSize"));
            CPLog.debug("NSColorWell: adjusting height from %d to %d", frameSize.height, 24.0);
            frameSize.height = 24.0;
            (self == null ? null : self.isa.objj_msgSend1(self, "setFrameSize:", frameSize));
        }
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPColorWell, "NSColorWell"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSColorWell__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSColorWell__classForKeyedArchiver(self, _cmd)
{
    return CPColorWell.isa.objj_msgSend0(CPColorWell, "class");
}
,["Class"])]);
}