@STATIC;1.0;I;15;AppKit/CPFont.jI;21;AppKit/CPTokenField.ji;11;NSControl.ji;8;NSCell.ji;13;NSTextField.jt;2391;objj_executeFile("AppKit/CPFont.j", NO);objj_executeFile("AppKit/CPTokenField.j", NO);objj_executeFile("NSControl.j", YES);objj_executeFile("NSCell.j", YES);objj_executeFile("NSTextField.j", YES);{
var the_class = objj_getClass("CPTokenField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTokenField__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPTokenField__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "NS_initWithCell:", cell);
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPTokenField, "NSTokenField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTokenField__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTokenField__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPTokenField, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSTextFieldCell, "NSTokenFieldCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tokenStyle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("tokenStyle"), function $NSTokenFieldCell__tokenStyle(self, _cmd)
{
    return self._tokenStyle;
}
,["int"]), new objj_method(sel_getUid("initWithCoder:"), function $NSTokenFieldCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSTokenFieldCell").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._tokenStyle = objj_msgSend(aCoder, "decodeIntForKey:", "NSTokenStyle");
    }
    return self;
}
,["id","CPCoder"])]);
}