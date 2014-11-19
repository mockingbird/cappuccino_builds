@STATIC;1.0;I;15;AppKit/CPMenu.jt;2276;objj_executeFile("AppKit/CPMenu.j", NO);NS_CPMenuNameMap = {_NSMainMenu: "_CPMainMenu", _NSAppleMenu: "_CPApplicationMenu", _NSServicesMenu: "_CPServicesMenu", _NSWindowsMenu: "_CPWindowsMenu", _NSFontMenu: "_CPFontMenu", _NSRecentDocumentsMenu: "_CPRecentDocumentsMenu", _NSOpenDocumentsMenu: "_CPOpenDocumentsMenu"};
{
var the_class = objj_getClass("CPMenu")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPMenu__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenu").super_class }, "init");
    if (self)
    {
        self._title = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTitle"));
        self._items = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSMenuItems"));
        self._name = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSName"));
        var mappedName = NS_CPMenuNameMap[self._name];
        if (mappedName)
            self._name = mappedName;
        self._showsStateColumn = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSMenuExcludeMarkColumn")) || !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSMenuExcludeMarkColumn"));
        self._autoenablesItems = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSNoAutoenable")) || !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSNoAutoenable"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPMenu, "NSMenu"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSMenu__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSMenu__classForKeyedArchiver(self, _cmd)
{
    return CPMenu.isa.objj_msgSend0(CPMenu, "class");
}
,["Class"])]);
}