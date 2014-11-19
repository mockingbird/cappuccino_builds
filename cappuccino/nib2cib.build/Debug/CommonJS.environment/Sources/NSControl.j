@STATIC;1.0;I;18;AppKit/CPControl.ji;8;NSCell.ji;8;NSView.jt;4524;objj_executeFile("AppKit/CPControl.j", NO);objj_executeFile("NSCell.j", YES);objj_executeFile("NSView.j", YES);{
var the_class = objj_getClass("CPControl")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPControl\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPControl__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setEnabled:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSEnabled"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "sendActionOn:", CPLeftMouseUpMask));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTarget:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTarget"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAction:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSAction"))));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSTag")))
            (self == null ? null : self.isa.objj_msgSend1(self, "setTag:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSTag"))));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPControl__NS_initWithCell_(self, _cmd, cell)
{
    self.isa.objj_msgSend1(self, "setSendsActionOnEndEditing:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "sendsActionOnEndEditing")));
    self.isa.objj_msgSend1(self, "setObjectValue:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "objectValue")));
    self.isa.objj_msgSend1(self, "setFont:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "font")));
    self.isa.objj_msgSend1(self, "setAlignment:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "alignment")));
    self.isa.objj_msgSend1(self, "setContinuous:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isContinuous")));
    self.isa.objj_msgSend1(self, "setLineBreakMode:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "lineBreakMode")));
    self.isa.objj_msgSend1(self, "setFormatter:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "formatter")));
    self.isa.objj_msgSend1(self, "setControlSize:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "controlSize")));
}
,["void","NSCell"]), new objj_method(sel_getUid("_nib2CibAdjustment"), function $CPControl___nib2CibAdjustment(self, _cmd)
{
    var theme = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "defaultTheme"));
    return (theme == null ? null : theme.isa.objj_msgSend3(theme, "valueForAttributeWithName:inState:forClass:", "nib2cib-adjustment-frame", self.isa.objj_msgSend0(self, "themeState"), self.isa.objj_msgSend0(self, "class"))) || self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "nib2cib-adjustment-frame");
}
,["CGRect"]), new objj_method(sel_getUid("_adjustNib2CibSize"), function $CPControl___adjustNib2CibSize(self, _cmd)
{
    var frame = self.isa.objj_msgSend0(self, "frame"),
        frameAdjustment = self.isa.objj_msgSend0(self, "_nib2CibAdjustment");
    if (frameAdjustment)
    {
        var finalFrame = CGRectMake(frame.origin.x + frameAdjustment.origin.x, frame.origin.y - frameAdjustment.origin.y, frame.size.width + frameAdjustment.size.width, frame.size.height + frameAdjustment.size.height);
        self.isa.objj_msgSend1(self, "setFrame:", finalFrame);
    }
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPControl, "NSControl"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSControl__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSControl__classForKeyedArchiver(self, _cmd)
{
    return CPControl.isa.objj_msgSend0(CPControl, "class");
}
,["Class"])]);
}