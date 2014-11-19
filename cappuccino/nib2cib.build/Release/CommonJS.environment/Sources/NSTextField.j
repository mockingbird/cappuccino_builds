@STATIC;1.0;I;15;AppKit/CPFont.jI;20;AppKit/CPTextField.ji;8;NSCell.ji;11;NSControl.jt;6891;objj_executeFile("AppKit/CPFont.j", NO);objj_executeFile("AppKit/CPTextField.j", NO);objj_executeFile("NSCell.j", YES);objj_executeFile("NSControl.j", YES);{
var the_class = objj_getClass("CPTextField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTextField__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPTextField__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "NS_initWithCell:", cell);
    self.isa.objj_msgSend1(self, "setEditable:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isEditable")));
    self.isa.objj_msgSend1(self, "setEnabled:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isEnabled")));
    self.isa.objj_msgSend1(self, "setSelectable:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isSelectable")));
    self.isa.objj_msgSend1(self, "setSendsActionOnEndEditing:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "sendsActionOnEndEditing")));
    self.isa.objj_msgSend1(self, "setBordered:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isBordered")));
    self.isa.objj_msgSend1(self, "setBezeled:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isBezeled")));
    self.isa.objj_msgSend1(self, "setBezelStyle:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "bezelStyle")));
    self.isa.objj_msgSend1(self, "setDrawsBackground:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "drawsBackground")));
    self.isa.objj_msgSend1(self, "setLineBreakMode:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "lineBreakMode")));
    self.isa.objj_msgSend1(self, "setAlignment:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "alignment")));
    self.isa.objj_msgSend1(self, "setTextFieldBackgroundColor:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "backgroundColor")));
    self.isa.objj_msgSend1(self, "setPlaceholderString:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "placeholderString")));
    self.isa.objj_msgSend1(self, "_setUsesSingleLineMode:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "usesSingleLineMode")));
    self.isa.objj_msgSend1(self, "_setWraps:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "wraps")));
    self.isa.objj_msgSend1(self, "_setScrolls:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "scrolls")));
    var textColor = (cell == null ? null : cell.isa.objj_msgSend0(cell, "textColor")),
        defaultColor = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-color");
    if (!(textColor == null ? null : textColor.isa.objj_msgSend1(textColor, "isEqual:", defaultColor)))
        self.isa.objj_msgSend1(self, "setTextColor:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "textColor")));
    CPLog.debug("NSTextField: title=\"" + self.isa.objj_msgSend0(self, "stringValue") + "\", placeholder=" + ((cell == null ? null : cell.isa.objj_msgSend0(cell, "placeholderString")) == null ? "<none>" : '"' + (cell == null ? null : cell.isa.objj_msgSend0(cell, "placeholderString")) + '"') + ", isBordered=" + self.isa.objj_msgSend0(self, "isBordered") + ", isBezeled=" + self.isa.objj_msgSend0(self, "isBezeled") + ", bezelStyle=" + self.isa.objj_msgSend0(self, "bezelStyle"));
    if (self.isa.objj_msgSend0(self, "formatter"))
        CPLog.debug(">> Formatter: " + ((___r1 = self.isa.objj_msgSend0(self, "formatter")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")));
    var ___r1;
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPTextField, "NSTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTextField__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
        (self == null ? null : self.isa.objj_msgSend0(self, "_adjustNib2CibSize"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTextField__classForKeyedArchiver(self, _cmd)
{
    return CPTextField.isa.objj_msgSend0(CPTextField, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSCell, "NSTextFieldCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bezelStyle"), new objj_ivar("_drawsBackground"), new objj_ivar("_backgroundColor"), new objj_ivar("_textColor"), new objj_ivar("_placeholderString")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("bezelStyle"), function $NSTextFieldCell__bezelStyle(self, _cmd)
{
    return self._bezelStyle;
}
,["CPTextFieldBezelStyle"]), new objj_method(sel_getUid("drawsBackground"), function $NSTextFieldCell__drawsBackground(self, _cmd)
{
    return self._drawsBackground;
}
,["BOOL"]), new objj_method(sel_getUid("backgroundColor"), function $NSTextFieldCell__backgroundColor(self, _cmd)
{
    return self._backgroundColor;
}
,["CPColor"]), new objj_method(sel_getUid("textColor"), function $NSTextFieldCell__textColor(self, _cmd)
{
    return self._textColor;
}
,["CPColor"]), new objj_method(sel_getUid("placeholderString"), function $NSTextFieldCell__placeholderString(self, _cmd)
{
    return self._placeholderString;
}
,["CPString"]), new objj_method(sel_getUid("initWithCoder:"), function $NSTextFieldCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSTextFieldCell").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._bezelStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTextBezelStyle")) || CPTextFieldSquareBezel;
        self._drawsBackground = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSDrawsBackground"));
        self._backgroundColor = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSBackgroundColor"));
        self._textColor = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTextColor"));
        self._placeholderString = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSPlaceholderString"));
    }
    return self;
}
,["id","CPCoder"])]);
}