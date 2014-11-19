@STATIC;1.0;I;22;AppKit/CPToolbarItem.jt;4729;objj_executeFile("AppKit/CPToolbarItem.j", NO);NS_CPToolbarItemIdentifierMap = {"NSToolbarSeparatorItem": CPToolbarSeparatorItemIdentifier, "NSToolbarSpaceItem": CPToolbarSpaceItemIdentifier, "NSToolbarFlexibleSpaceItem": CPToolbarFlexibleSpaceItemIdentifier, "NSToolbarShowColorsItem": CPToolbarShowColorsItemIdentifier, "NSToolbarShowFontsItem": CPToolbarShowFontsItemIdentifier, "NSToolbarCustomizeToolbarItem": CPToolbarCustomizeToolbarItemIdentifier, "NSToolbarPrintItem": CPToolbarPrintItemIdentifier};
{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPToolbarItem__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPToolbarItem").super_class }, "init");
    if (self)
    {
        var NS_itemIdentifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarItemIdentifier"));
        self._itemIdentifier = NS_CPToolbarItemIdentifierMap[NS_itemIdentifier] || NS_itemIdentifier;
        self._minSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", "NSToolbarItemMinSize"));
        self._maxSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", "NSToolbarItemMaxSize"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setLabel:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarItemLabel"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setPaletteLabel:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarItemPaletteLabel"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setToolTip:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarItemToolTip"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTag:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarItemTag"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTarget:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarItemTarget"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAction:", CPSelectorFromString((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarItemAction")))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setEnabled:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSToolbarItemEnabled"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setImage:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarItemImage"))));
        if (self._maxSize.height > 0)
            self._maxSize.height = MIN(self._maxSize.height, 32.0);
        if (self._minSize.height > 0)
            self._minSize.height = MIN(self._minSize.height, 32.0);
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarItemView"))));
        if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPSearchField)) && self._maxSize.height == 22.0)
        {
            self._maxSize.height = ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height;
            self._minSize.height = self._maxSize.height;
        }
        (self == null ? null : self.isa.objj_msgSend1(self, "setVisibilityPriority:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSToolbarItemVisibilityPriority"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutovalidates:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSToolbarItemAutovalidates"))));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPToolbarItem, "NSToolbarItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSToolbarItem__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSToolbarItem__classForKeyedArchiver(self, _cmd)
{
    return CPToolbarItem.isa.objj_msgSend0(CPToolbarItem, "class");
}
,["Class"])]);
}