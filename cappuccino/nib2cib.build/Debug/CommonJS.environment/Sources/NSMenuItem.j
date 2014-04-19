@STATIC;1.0;I;19;AppKit/CPMenuItem.ji;10;NSButton.ji;9;NSEvent.ji;8;NSMenu.jt;2955;objj_executeFile("AppKit/CPMenuItem.j", NO);objj_executeFile("NSButton.j", YES);objj_executeFile("NSEvent.j", YES);objj_executeFile("NSMenu.j", YES);{
var the_class = objj_getClass("CPMenuItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenuItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPMenuItem__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenuItem").super_class }, "init");
    if (self)
    {
        self._isSeparator = objj_msgSend(aCoder, "decodeBoolForKey:", "NSIsSeparator");
        self._title = objj_msgSend(aCoder, "decodeObjectForKey:", "NSTitle");
        self._target = objj_msgSend(aCoder, "decodeObjectForKey:", "NSTarget");
        self._action = objj_msgSend(aCoder, "decodeObjectForKey:", "NSAction");
        self._isEnabled = !objj_msgSend(aCoder, "decodeBoolForKey:", "NSIsDisabled");
        self._isHidden = objj_msgSend(aCoder, "decodeBoolForKey:", "NSIsHidden");
        self._tag = objj_msgSend(aCoder, "decodeIntForKey:", "NSTag");
        self._state = objj_msgSend(aCoder, "decodeIntForKey:", "NSState");
        self._image = objj_msgSend(aCoder, "decodeObjectForKey:", "NSImage");
        self._submenu = objj_msgSend(aCoder, "decodeObjectForKey:", "NSSubmenu");
        self._menu = objj_msgSend(aCoder, "decodeObjectForKey:", "NSMenu");
        self._keyEquivalent = objj_msgSend(aCoder, "decodeObjectForKey:", "NSKeyEquiv");
        self._keyEquivalentModifierMask = CP_NSMapKeyMask(objj_msgSend(aCoder, "decodeObjectForKey:", "NSKeyEquivModMask"));
        self._indentationLevel = objj_msgSend(aCoder, "decodeIntForKey:", "NSIndent");
        self._representedObject = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRepObject");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("swapCellsForParents:"), function $CPMenuItem__swapCellsForParents_(self, _cmd, parentsForCellUIDs)
{
    var target = objj_msgSend(self, "target");
    if (!target)
        return;
    var parent = parentsForCellUIDs[objj_msgSend(objj_msgSend(self, "target"), "UID")];
    if (parent)
        objj_msgSend(self, "setTarget:", parent);
}
,["void","JSObject"])]);
}{var the_class = objj_allocateClassPair(CPMenuItem, "NSMenuItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSMenuItem__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSMenuItem__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPMenuItem, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSButtonCell, "NSMenuItemCell"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}