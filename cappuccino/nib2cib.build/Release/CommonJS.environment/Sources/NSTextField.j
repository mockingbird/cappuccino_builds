@STATIC;1.0;I;15;AppKit/CPFont.jI;20;AppKit/CPTextField.ji;8;NSCell.ji;11;NSControl.jt;5802;objj_executeFile("AppKit/CPFont.j", NO);objj_executeFile("AppKit/CPTextField.j", NO);objj_executeFile("NSCell.j", YES);objj_executeFile("NSControl.j", YES);{
var the_class = objj_getClass("CPTextField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTextField__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPTextField__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField").super_class }, "NS_initWithCell:", cell);
    objj_msgSend(self, "setEditable:", objj_msgSend(cell, "isEditable"));
    objj_msgSend(self, "setEnabled:", objj_msgSend(cell, "isEnabled"));
    objj_msgSend(self, "setSelectable:", objj_msgSend(cell, "isSelectable"));
    objj_msgSend(self, "setSendsActionOnEndEditing:", objj_msgSend(cell, "sendsActionOnEndEditing"));
    objj_msgSend(self, "setBordered:", objj_msgSend(cell, "isBordered"));
    objj_msgSend(self, "setBezeled:", objj_msgSend(cell, "isBezeled"));
    objj_msgSend(self, "setBezelStyle:", objj_msgSend(cell, "bezelStyle"));
    objj_msgSend(self, "setDrawsBackground:", objj_msgSend(cell, "drawsBackground"));
    objj_msgSend(self, "setLineBreakMode:", objj_msgSend(cell, "lineBreakMode"));
    objj_msgSend(self, "setAlignment:", objj_msgSend(cell, "alignment"));
    objj_msgSend(self, "setTextFieldBackgroundColor:", objj_msgSend(cell, "backgroundColor"));
    objj_msgSend(self, "setPlaceholderString:", objj_msgSend(cell, "placeholderString"));
    var textColor = objj_msgSend(cell, "textColor"),
        defaultColor = objj_msgSend(self, "currentValueForThemeAttribute:", "text-color");
    if (!objj_msgSend(textColor, "isEqual:", defaultColor))
        objj_msgSend(self, "setTextColor:", objj_msgSend(cell, "textColor"));
    var frame = objj_msgSend(self, "frame");
    if (objj_msgSend(self, "isBezeled"))
    {
        objj_msgSend(self, "setFrameOrigin:", CGPointMake(frame.origin.x - 4.0, frame.origin.y - 3.0));
        objj_msgSend(self, "setFrameSize:", CGSizeMake(frame.size.width + 8.0, frame.size.height + 7.0));
    }
    else
    {
        objj_msgSend(self, "setFrameOrigin:", CGPointMake(frame.origin.x + 3.0, frame.origin.y));
        objj_msgSend(self, "setFrameSize:", CGSizeMake(frame.size.width - 6.0, frame.size.height));
    }
    CPLog.debug("NSTextField: title=\"" + objj_msgSend(self, "stringValue") + "\", placeholder=" + (objj_msgSend(cell, "placeholderString") == null ? "<none>" : '"' + objj_msgSend(cell, "placeholderString") + '"') + ", isBordered=" + objj_msgSend(self, "isBordered") + ", isBezeled=" + objj_msgSend(self, "isBezeled") + ", bezelStyle=" + objj_msgSend(self, "bezelStyle"));
    if (objj_msgSend(self, "formatter"))
        CPLog.debug(">> Formatter: " + objj_msgSend(objj_msgSend(self, "formatter"), "description"));
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPTextField, "NSTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTextField__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTextField__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPTextField, "class");
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
        self._bezelStyle = objj_msgSend(aCoder, "decodeObjectForKey:", "NSTextBezelStyle") || CPTextFieldSquareBezel;
        self._drawsBackground = objj_msgSend(aCoder, "decodeBoolForKey:", "NSDrawsBackground");
        self._backgroundColor = objj_msgSend(aCoder, "decodeObjectForKey:", "NSBackgroundColor");
        self._textColor = objj_msgSend(aCoder, "decodeObjectForKey:", "NSTextColor");
        self._placeholderString = objj_msgSend(aCoder, "decodeObjectForKey:", "NSPlaceholderString");
    }
    return self;
}
,["id","CPCoder"])]);
}