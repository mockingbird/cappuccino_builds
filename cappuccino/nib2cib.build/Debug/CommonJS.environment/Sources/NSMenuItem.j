@STATIC;1.0;I;19;AppKit/CPMenuItem.ji;10;NSButton.ji;9;NSEvent.ji;8;NSMenu.jt;3649;objj_executeFile("AppKit/CPMenuItem.j", NO);objj_executeFile("NSButton.j", YES);objj_executeFile("NSEvent.j", YES);objj_executeFile("NSMenu.j", YES);{
var the_class = objj_getClass("CPMenuItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenuItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPMenuItem__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenuItem").super_class }, "init");
    if (self)
    {
        self._isSeparator = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSIsSeparator"));
        self._title = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTitle"));
        self._target = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTarget"));
        self._action = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSAction"));
        self._isEnabled = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSIsDisabled"));
        self._isHidden = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSIsHidden"));
        self._tag = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSTag"));
        self._state = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSState"));
        self._image = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSImage"));
        self._submenu = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSubmenu"));
        self._menu = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSMenu"));
        self._keyEquivalent = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSKeyEquiv"));
        self._keyEquivalentModifierMask = CP_NSMapKeyMask((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSKeyEquivModMask")));
        self._indentationLevel = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSIndent"));
        self._representedObject = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSRepObject"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("swapCellsForParents:"), function $CPMenuItem__swapCellsForParents_(self, _cmd, parentsForCellUIDs)
{
    var target = self.isa.objj_msgSend0(self, "target");
    if (!target)
        return;
    var parent = parentsForCellUIDs[((___r1 = self.isa.objj_msgSend0(self, "target")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"))];
    if (parent)
        self.isa.objj_msgSend1(self, "setTarget:", parent);
    var ___r1;
}
,["void","JSObject"])]);
}{var the_class = objj_allocateClassPair(CPMenuItem, "NSMenuItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSMenuItem__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSMenuItem__classForKeyedArchiver(self, _cmd)
{
    return CPMenuItem.isa.objj_msgSend0(CPMenuItem, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSButtonCell, "NSMenuItemCell"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}