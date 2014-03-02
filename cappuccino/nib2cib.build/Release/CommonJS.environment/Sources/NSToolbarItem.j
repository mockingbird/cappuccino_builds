@STATIC;1.0;I;22;AppKit/CPToolbarItem.jt;3673;objj_executeFile("AppKit/CPToolbarItem.j", NO);NS_CPToolbarItemIdentifierMap = {"NSToolbarSeparatorItem": CPToolbarSeparatorItemIdentifier, "NSToolbarSpaceItem": CPToolbarSpaceItemIdentifier, "NSToolbarFlexibleSpaceItem": CPToolbarFlexibleSpaceItemIdentifier, "NSToolbarShowColorsItem": CPToolbarShowColorsItemIdentifier, "NSToolbarShowFontsItem": CPToolbarShowFontsItemIdentifier, "NSToolbarCustomizeToolbarItem": CPToolbarCustomizeToolbarItemIdentifier, "NSToolbarPrintItem": CPToolbarPrintItemIdentifier};
{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPToolbarItem__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPToolbarItem").super_class }, "init");
    if (self)
    {
        var NS_itemIdentifier = objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarItemIdentifier");
        self._itemIdentifier = NS_CPToolbarItemIdentifierMap[NS_itemIdentifier] || NS_itemIdentifier;
        self._minSize = objj_msgSend(aCoder, "decodeSizeForKey:", "NSToolbarItemMinSize");
        self._maxSize = objj_msgSend(aCoder, "decodeSizeForKey:", "NSToolbarItemMaxSize");
        objj_msgSend(self, "setLabel:", objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarItemLabel"));
        objj_msgSend(self, "setPaletteLabel:", objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarItemPaletteLabel"));
        objj_msgSend(self, "setToolTip:", objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarItemToolTip"));
        objj_msgSend(self, "setTag:", objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarItemTag"));
        objj_msgSend(self, "setTarget:", objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarItemTarget"));
        objj_msgSend(self, "setAction:", CPSelectorFromString(objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarItemAction")));
        objj_msgSend(self, "setEnabled:", objj_msgSend(aCoder, "decodeBoolForKey:", "NSToolbarItemEnabled"));
        objj_msgSend(self, "setImage:", objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarItemImage"));
        if (self._maxSize.height > 0)
            self._maxSize.height = MIN(self._maxSize.height, 32.0);
        if (self._minSize.height > 0)
            self._minSize.height = MIN(self._minSize.height, 32.0);
        objj_msgSend(self, "setView:", objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarItemView"));
        if (objj_msgSend(self._view, "isKindOfClass:", CPSearchField) && self._maxSize.height == 22.0)
        {
            self._maxSize.height = objj_msgSend(self._view, "frameSize").height;
            self._minSize.height = self._maxSize.height;
        }
        objj_msgSend(self, "setVisibilityPriority:", objj_msgSend(aCoder, "decodeIntForKey:", "NSToolbarItemVisibilityPriority"));
        objj_msgSend(self, "setAutovalidates:", objj_msgSend(aCoder, "decodeBoolForKey:", "NSToolbarItemAutovalidates"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPToolbarItem, "NSToolbarItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSToolbarItem__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSToolbarItem__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPToolbarItem, "class");
}
,["Class"])]);
}