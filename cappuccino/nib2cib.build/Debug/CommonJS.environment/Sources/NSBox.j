@STATIC;1.0;I;14;AppKit/CPBox.jt;3459;objj_executeFile("AppKit/CPBox.j", NO);{
var the_class = objj_getClass("CPBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPBox__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBox").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        self._boxType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSBoxType"));
        self._borderType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSBorderType"));
        var borderColor = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSBorderColor2")),
            fillColor = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSFillColor2")),
            cornerRadius = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSCornerRadius2")),
            borderWidth = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSBorderWidth2")),
            contentMargin = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", "NSOffsets"));
        var frame = (self == null ? null : self.isa.objj_msgSend0(self, "frame"));
        if (self._boxType !== CPBoxSeparator && (self._boxType === CPBoxPrimary || self._boxType === CPBoxSecondary))
        {
            frame.origin.y += 4;
            frame.origin.x += 4;
            frame.size.width -= 8;
            frame.size.height -= 6;
        }
        (self == null ? null : self.isa.objj_msgSend1(self, "setFrame:", frame));
        if (self._boxType !== CPBoxPrimary && self._boxType !== CPBoxSecondary)
        {
            if (borderColor)
                (self == null ? null : self.isa.objj_msgSend1(self, "setBorderColor:", borderColor));
            if (fillColor)
                (self == null ? null : self.isa.objj_msgSend1(self, "setFillColor:", fillColor));
            (self == null ? null : self.isa.objj_msgSend1(self, "setCornerRadius:", cornerRadius));
            (self == null ? null : self.isa.objj_msgSend1(self, "setBorderWidth:", borderWidth));
            (self == null ? null : self.isa.objj_msgSend1(self, "setContentViewMargins:", contentMargin));
        }
        self._title = ((___r1 = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTitleCell"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "objectValue")) || "";
        self._titlePosition = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTitlePosition"));
        if (self._titlePosition === undefined)
            self._titlePosition = CPAtTop;
    }
    return self;
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPBox, "NSBox"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSBox__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSBox__classForKeyedArchiver(self, _cmd)
{
    return CPBox.isa.objj_msgSend0(CPBox, "class");
}
,["Class"])]);
}