@STATIC;1.0;I;18;AppKit/CPToolbar.ji;15;NSToolbarItem.jt;3327;objj_executeFile("AppKit/CPToolbar.j", NO);objj_executeFile("NSToolbarItem.j", YES);{
var the_class = objj_getClass("CPToolbar")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbar\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPToolbar__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self)
    {
        self._identifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarIdentifier"));
        self._displayMode = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSToolbarDisplayMode"));
        self._showsBaselineSeparator = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSToolbarShowsBaselineSeparator"));
        self._allowsUserCustomization = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSToolbarAllowsUserCustomization"));
        self._isVisible = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSToolbarPrefersToBeShown"));
        self._identifiedItems = CPMutableDictionary.isa.objj_msgSend0(CPMutableDictionary, "dictionary");
        var nsIdentifiedItems = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarIBIdentifiedItems")),
            key = nil,
            keyEnumerator = (nsIdentifiedItems == null ? null : nsIdentifiedItems.isa.objj_msgSend0(nsIdentifiedItems, "keyEnumerator"));
        while ((key = (keyEnumerator == null ? null : keyEnumerator.isa.objj_msgSend0(keyEnumerator, "nextObject"))) !== nil)
        {
            var transformedKey = NS_CPToolbarItemIdentifierMap[key] || key;
            ((___r1 = self._identifiedItems), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", (nsIdentifiedItems == null ? null : nsIdentifiedItems.isa.objj_msgSend1(nsIdentifiedItems, "objectForKey:", key)), transformedKey));
        }
        self._defaultItems = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarIBDefaultItems"));
        self._allowedItems = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarIBAllowedItems"));
        self._selectableItems = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarIBSelectableItems"));
        self._sizeMode = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarSizeMode")) || CPToolbarSizeModeDefault;
        self._delegate = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSToolbarDelegate"));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPToolbar, "NSToolbar"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSToolbar__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSToolbar__classForKeyedArchiver(self, _cmd)
{
    return CPToolbar.isa.objj_msgSend0(CPToolbar, "class");
}
,["Class"])]);
}