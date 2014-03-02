@STATIC;1.0;I;14;AppKit/CPBox.jt;2790;objj_executeFile("AppKit/CPBox.j", NO);{
var the_class = objj_getClass("CPBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPBox__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBox").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        self._boxType = objj_msgSend(aCoder, "decodeIntForKey:", "NSBoxType");
        self._borderType = objj_msgSend(aCoder, "decodeIntForKey:", "NSBorderType");
        var borderColor = objj_msgSend(aCoder, "decodeObjectForKey:", "NSBorderColor2"),
            fillColor = objj_msgSend(aCoder, "decodeObjectForKey:", "NSFillColor2"),
            cornerRadius = objj_msgSend(aCoder, "decodeFloatForKey:", "NSCornerRadius2"),
            borderWidth = objj_msgSend(aCoder, "decodeFloatForKey:", "NSBorderWidth2"),
            contentMargin = objj_msgSend(aCoder, "decodeSizeForKey:", "NSOffsets");
        var frame = objj_msgSend(self, "frame");
        if (self._boxType !== CPBoxSeparator && (self._boxType === CPBoxPrimary || self._boxType === CPBoxSecondary))
        {
            frame.origin.y += 4;
            frame.origin.x += 4;
            frame.size.width -= 8;
            frame.size.height -= 6;
        }
        objj_msgSend(self, "setFrame:", frame);
        if (self._boxType !== CPBoxPrimary && self._boxType !== CPBoxSecondary)
        {
            if (borderColor)
                objj_msgSend(self, "setBorderColor:", borderColor);
            if (fillColor)
                objj_msgSend(self, "setFillColor:", fillColor);
            objj_msgSend(self, "setCornerRadius:", cornerRadius);
            objj_msgSend(self, "setBorderWidth:", borderWidth);
            objj_msgSend(self, "setContentViewMargins:", contentMargin);
        }
        self._title = objj_msgSend(objj_msgSend(aCoder, "decodeObjectForKey:", "NSTitleCell"), "objectValue") || "";
        self._titlePosition = objj_msgSend(aCoder, "decodeObjectForKey:", "NSTitlePosition");
        if (self._titlePosition === undefined)
            self._titlePosition = CPAtTop;
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPBox, "NSBox"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSBox__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSBox__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPBox, "class");
}
,["Class"])]);
}