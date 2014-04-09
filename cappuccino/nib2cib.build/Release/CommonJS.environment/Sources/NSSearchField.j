@STATIC;1.0;I;22;AppKit/CPSearchField.ji;13;NSTextField.jt;4781;objj_executeFile("AppKit/CPSearchField.j", NO);objj_executeFile("NSTextField.j", YES);{
var the_class = objj_getClass("CPSearchField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSearchField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPSearchField__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPSearchField__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSearchField").super_class }, "NS_initWithCell:", cell);
    objj_msgSend(self, "setRecentsAutosaveName:", objj_msgSend(cell, "recentsAutosaveName"));
    objj_msgSend(self, "setMaximumRecents:", objj_msgSend(cell, "maximumRecents"));
    objj_msgSend(self, "setSendsWholeSearchString:", objj_msgSend(cell, "sendsWholeSearchString"));
    objj_msgSend(self, "setSendsSearchStringImmediately:", objj_msgSend(cell, "sendsSearchStringImmediately"));
    if (objj_msgSend(objj_msgSend(Nib2Cib, "defaultTheme"), "name") === "Aristo" && objj_msgSend(self, "isBezeled"))
    {
        var frame = objj_msgSend(self, "frame");
        objj_msgSend(self, "setFrameSize:", CGSizeMake(frame.size.width, frame.size.height));
    }
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPSearchField, "NSSearchField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSearchField__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSSearchField__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPSearchField, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSTextFieldCell, "NSSearchFieldCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_recentsAutosaveName"), new objj_ivar("_maximumRecents"), new objj_ivar("_sendsWholeSearchString"), new objj_ivar("_sendsSearchStringImmediately")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("recentsAutosaveName"), function $NSSearchFieldCell__recentsAutosaveName(self, _cmd)
{
    return self._recentsAutosaveName;
}
,["CPString"]), new objj_method(sel_getUid("setRecentsAutosaveName:"), function $NSSearchFieldCell__setRecentsAutosaveName_(self, _cmd, newValue)
{
    self._recentsAutosaveName = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("maximumRecents"), function $NSSearchFieldCell__maximumRecents(self, _cmd)
{
    return self._maximumRecents;
}
,["int"]), new objj_method(sel_getUid("setMaximumRecents:"), function $NSSearchFieldCell__setMaximumRecents_(self, _cmd, newValue)
{
    self._maximumRecents = newValue;
}
,["void","int"]), new objj_method(sel_getUid("sendsWholeSearchString"), function $NSSearchFieldCell__sendsWholeSearchString(self, _cmd)
{
    return self._sendsWholeSearchString;
}
,["BOOL"]), new objj_method(sel_getUid("setSendsWholeSearchString:"), function $NSSearchFieldCell__setSendsWholeSearchString_(self, _cmd, newValue)
{
    self._sendsWholeSearchString = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("sendsSearchStringImmediately"), function $NSSearchFieldCell__sendsSearchStringImmediately(self, _cmd)
{
    return self._sendsSearchStringImmediately;
}
,["BOOL"]), new objj_method(sel_getUid("setSendsSearchStringImmediately:"), function $NSSearchFieldCell__setSendsSearchStringImmediately_(self, _cmd, newValue)
{
    self._sendsSearchStringImmediately = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("initWithCoder:"), function $NSSearchFieldCell__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSSearchFieldCell").super_class }, "initWithCoder:", aCoder))
    {
        self._recentsAutosaveName = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRecentsAutosaveName");
        self._maximumRecents = objj_msgSend(aCoder, "decodeIntForKey:", "NSMaximumRecents");
        self._sendsWholeSearchString = objj_msgSend(aCoder, "decodeBoolForKey:", "NSSendsWholeSearchString");
        self._sendsSearchStringImmediately = objj_msgSend(aCoder, "decodeBytesForKey:", "NSSearchFieldFlags") ? YES : NO;
    }
    return self;
}
,["id","CPCoder"])]);
}