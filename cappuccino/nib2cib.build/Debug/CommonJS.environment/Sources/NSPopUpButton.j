@STATIC;1.0;I;22;AppKit/CPPopUpButton.ji;8;NSMenu.ji;12;NSMenuItem.jt;3880;objj_executeFile("AppKit/CPPopUpButton.j", NO);objj_executeFile("NSMenu.j", YES);objj_executeFile("NSMenuItem.j", YES);{
var the_class = objj_getClass("CPPopUpButton")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPPopUpButton__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopUpButton").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPPopUpButton__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopUpButton").super_class }, "NS_initWithCell:", cell);
    self._menu = (cell == null ? null : cell.isa.objj_msgSend0(cell, "menu"));
    self.isa.objj_msgSend1(self, "setPullsDown:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "pullsDown")));
    self._preferredEdge = (cell == null ? null : cell.isa.objj_msgSend0(cell, "preferredEdge"));
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPPopUpButton, "NSPopUpButton"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSPopUpButton__initWithCoder_(self, _cmd, aCoder)
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
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSPopUpButton__classForKeyedArchiver(self, _cmd)
{
    return CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSMenuItemCell, "NSPopUpButtonCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("pullsDown"), new objj_ivar("selectedIndex"), new objj_ivar("preferredEdge"), new objj_ivar("menu")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("pullsDown"), function $NSPopUpButtonCell__pullsDown(self, _cmd)
{
    return self.pullsDown;
}
,["BOOL"]), new objj_method(sel_getUid("selectedIndex"), function $NSPopUpButtonCell__selectedIndex(self, _cmd)
{
    return self.selectedIndex;
}
,["int"]), new objj_method(sel_getUid("preferredEdge"), function $NSPopUpButtonCell__preferredEdge(self, _cmd)
{
    return self.preferredEdge;
}
,["int"]), new objj_method(sel_getUid("menu"), function $NSPopUpButtonCell__menu(self, _cmd)
{
    return self.menu;
}
,["CPMenu"]), new objj_method(sel_getUid("initWithCoder:"), function $NSPopUpButtonCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSPopUpButtonCell").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self.pullsDown = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSPullDown"));
        self.selectedIndex = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSSelectedIndex"));
        self.preferredEdge = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSPreferredEdge"));
        self.menu = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSMenu"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("objectValue"), function $NSPopUpButtonCell__objectValue(self, _cmd)
{
    return self.selectedIndex;
}
,["CPUInteger"])]);
}