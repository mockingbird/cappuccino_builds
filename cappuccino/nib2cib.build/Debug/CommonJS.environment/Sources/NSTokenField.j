@STATIC;1.0;I;21;AppKit/CPTokenField.ji;11;NSControl.ji;8;NSCell.ji;13;NSTextField.jI;15;AppKit/CPFont.jt;2380;objj_executeFile("AppKit/CPTokenField.j", NO);

objj_executeFile("NSControl.j", YES);
objj_executeFile("NSCell.j", YES);
objj_executeFile("NSTextField.j", YES);
objj_executeFile("AppKit/CPFont.j", NO);

{
var the_class = objj_getClass("CPTokenField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTokenField__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        self = objj_msgSend(self, "NS_initWithCell:", cell);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPTokenField__NS_initWithCell_(self, _cmd, cell)
{ with(self)
{



    return self;
}
},["id","NSCell"])]);
}

{var the_class = objj_allocateClassPair(CPTokenField, "NSTokenField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTokenField__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTokenField__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPTokenField, "class");
}
},["Class"])]);
}

{var the_class = objj_allocateClassPair(NSTextFieldCell, "NSTokenFieldCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tokenStyle")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("tokenStyle"), function $NSTokenFieldCell__tokenStyle(self, _cmd)
{ with(self)
{
return _tokenStyle;
}
},["id"]), new objj_method(sel_getUid("initWithCoder:"), function $NSTokenFieldCell__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSTokenFieldCell").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        _tokenStyle = objj_msgSend(aCoder, "decodeIntForKey:", "NSTokenStyle");
    }

    return self;
}
},["id","CPCoder"])]);
}

