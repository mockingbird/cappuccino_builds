@STATIC;1.0;I;18;AppKit/CPToolbar.ji;15;NSToolbarItem.jt;2619;objj_executeFile("AppKit/CPToolbar.j", NO);objj_executeFile("NSToolbarItem.j", YES);{
var the_class = objj_getClass("CPToolbar")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbar\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPToolbar__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self)
    {
        self._identifier = objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarIdentifier");
        self._displayMode = objj_msgSend(aCoder, "decodeIntForKey:", "NSToolbarDisplayMode");
        self._showsBaselineSeparator = objj_msgSend(aCoder, "decodeBoolForKey:", "NSToolbarShowsBaselineSeparator");
        self._allowsUserCustomization = objj_msgSend(aCoder, "decodeBoolForKey:", "NSToolbarAllowsUserCustomization");
        self._isVisible = objj_msgSend(aCoder, "decodeBoolForKey:", "NSToolbarPrefersToBeShown");
        self._identifiedItems = objj_msgSend(CPMutableDictionary, "dictionary");
        var nsIdentifiedItems = objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarIBIdentifiedItems"),
            key = nil,
            keyEnumerator = objj_msgSend(nsIdentifiedItems, "keyEnumerator");
        while ((key = objj_msgSend(keyEnumerator, "nextObject")) !== nil)
        {
            var transformedKey = NS_CPToolbarItemIdentifierMap[key] || key;
            objj_msgSend(self._identifiedItems, "setObject:forKey:", objj_msgSend(nsIdentifiedItems, "objectForKey:", key), transformedKey);
        }
        self._defaultItems = objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarIBDefaultItems");
        self._allowedItems = objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarIBAllowedItems");
        self._selectableItems = objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarIBSelectableItems");
        self._sizeMode = objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarSizeMode") || CPToolbarSizeModeDefault;
        self._delegate = objj_msgSend(aCoder, "decodeObjectForKey:", "NSToolbarDelegate");
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPToolbar, "NSToolbar"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSToolbar__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSToolbar__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPToolbar, "class");
}
,["Class"])]);
}