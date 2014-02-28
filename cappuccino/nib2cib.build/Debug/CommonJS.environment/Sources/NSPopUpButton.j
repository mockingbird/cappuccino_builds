@STATIC;1.0;I;22;AppKit/CPPopUpButton.ji;8;NSMenu.ji;12;NSMenuItem.jt;3536;objj_executeFile("AppKit/CPPopUpButton.j", NO);objj_executeFile("NSMenu.j", YES);objj_executeFile("NSMenuItem.j", YES);{
var the_class = objj_getClass("CPPopUpButton")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPPopUpButton__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopUpButton").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPPopUpButton__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopUpButton").super_class }, "NS_initWithCell:", cell);
    self._menu = objj_msgSend(cell, "menu");
    objj_msgSend(self, "setPullsDown:", objj_msgSend(cell, "pullsDown"));
    self._preferredEdge = objj_msgSend(cell, "preferredEdge");
    self._frame.origin.x -= 4;
    self._frame.origin.y -= 4;
    self._frame.size.width += 7;
    self._bounds.size.width += 7;
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPPopUpButton, "NSPopUpButton"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSPopUpButton__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSPopUpButton__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPPopUpButton, "class");
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
        self.pullsDown = objj_msgSend(aCoder, "decodeBoolForKey:", "NSPullDown");
        self.selectedIndex = objj_msgSend(aCoder, "decodeIntForKey:", "NSSelectedIndex");
        self.preferredEdge = objj_msgSend(aCoder, "decodeIntForKey:", "NSPreferredEdge");
        self.menu = objj_msgSend(aCoder, "decodeObjectForKey:", "NSMenu");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("objectValue"), function $NSPopUpButtonCell__objectValue(self, _cmd)
{
    return self.selectedIndex;
}
,["CPUInteger"])]);
}