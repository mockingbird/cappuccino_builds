@STATIC;1.0;I;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;9;CPImage.ji;8;CPText.ji;8;CPView.ji;17;_CPMenuItemView.jt;29701;objj_executeFile("Foundation/CPCoder.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPImage.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("_CPMenuItemView.j", YES);var CPMenuItemStringRepresentationDictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", "\u238B", CPEscapeFunctionKey, "\u21E5", CPTabCharacter, "\u21E4", CPBackTabCharacter, "\u2423", CPSpaceFunctionKey, "\u23CE", CPCarriageReturnCharacter, "\u232B", CPBackspaceCharacter, "\u232B", CPDeleteFunctionKey, "\u2326", CPDeleteCharacter, "\u21F1", CPHomeFunctionKey, "\u21F2", CPEndFunctionKey, "\u21DE", CPPageUpFunctionKey, "\u21DF", CPPageDownFunctionKey, "\u2191", CPUpArrowFunctionKey, "\u2193", CPDownArrowFunctionKey, "\u2190", CPLeftArrowFunctionKey, "\u2192", CPRightArrowFunctionKey, "\u2327", CPClearDisplayFunctionKey);
{var the_class = objj_allocateClassPair(CPObject, "CPMenuItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isSeparator"), new objj_ivar("_title"), new objj_ivar("_font"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_isEnabled"), new objj_ivar("_isHidden"), new objj_ivar("_tag"), new objj_ivar("_state"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_onStateImage"), new objj_ivar("_offStateImage"), new objj_ivar("_mixedStateImage"), new objj_ivar("_submenu"), new objj_ivar("_menu"), new objj_ivar("_keyEquivalent"), new objj_ivar("_keyEquivalentModifierMask"), new objj_ivar("_mnemonicLocation"), new objj_ivar("_isAlternate"), new objj_ivar("_indentationLevel"), new objj_ivar("_toolTip"), new objj_ivar("_representedObject"), new objj_ivar("_view"), new objj_ivar("_changeCount"), new objj_ivar("_menuItemView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPMenuItem__init(self, _cmd)
{
    return self.isa.objj_msgSend3(self, "initWithTitle:action:keyEquivalent:", "", nil, nil);
}
,["id"]), new objj_method(sel_getUid("initWithTitle:action:keyEquivalent:"), function $CPMenuItem__initWithTitle_action_keyEquivalent_(self, _cmd, aTitle, anAction, aKeyEquivalent)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenuItem").super_class }, "init");
    if (self)
    {
        self._changeCount = 0;
        self._isSeparator = NO;
        self._title = aTitle;
        self._action = anAction;
        self._isEnabled = YES;
        self._isHidden = NO;
        self._tag = 0;
        self._state = CPOffState;
        self._keyEquivalent = aKeyEquivalent || "";
        self._keyEquivalentModifierMask = CPPlatformActionKeyMask;
        self._indentationLevel = 0;
        self._mnemonicLocation = CPNotFound;
    }
    return self;
}
,["id","CPString","SEL","CPString"]), new objj_method(sel_getUid("setEnabled:"), function $CPMenuItem__setEnabled_(self, _cmd, isEnabled)
{
    if (self._isEnabled === isEnabled)
        return;
    if (!isEnabled && self.isa.objj_msgSend0(self, "isHighlighted"))
        ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_highlightItemAtIndex:", CPNotFound));
    self._isEnabled = !!isEnabled;
    ((___r1 = self._menuItemView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setDirty"));
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("isEnabled"), function $CPMenuItem__isEnabled(self, _cmd)
{
    return self._isEnabled;
}
,["BOOL"]), new objj_method(sel_getUid("setHidden:"), function $CPMenuItem__setHidden_(self, _cmd, isHidden)
{
    if (self._isHidden == isHidden)
        return;
    self._isHidden = isHidden;
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("isHidden"), function $CPMenuItem__isHidden(self, _cmd)
{
    return self._isHidden;
}
,["BOOL"]), new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"), function $CPMenuItem__isHiddenOrHasHiddenAncestor(self, _cmd)
{
    if (self._isHidden)
        return YES;
    var supermenu = ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "supermenu"));
    if (((___r1 = (supermenu == null ? null : supermenu.isa.objj_msgSend1(supermenu, "itemAtIndex:", (supermenu == null ? null : supermenu.isa.objj_msgSend1(supermenu, "indexOfItemWithSubmenu:", self._menu))))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHiddenOrHasHiddenAncestor")))
        return YES;
    return NO;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("setTarget:"), function $CPMenuItem__setTarget_(self, _cmd, aTarget)
{
    self._target = aTarget;
}
,["void","id"]), new objj_method(sel_getUid("target"), function $CPMenuItem__target(self, _cmd)
{
    return self._target;
}
,["id"]), new objj_method(sel_getUid("setAction:"), function $CPMenuItem__setAction_(self, _cmd, anAction)
{
    self._action = anAction;
}
,["void","SEL"]), new objj_method(sel_getUid("action"), function $CPMenuItem__action(self, _cmd)
{
    return self._action;
}
,["SEL"]), new objj_method(sel_getUid("setTitle:"), function $CPMenuItem__setTitle_(self, _cmd, aTitle)
{
    self._mnemonicLocation = CPNotFound;
    if (self._title == aTitle)
        return;
    self._title = aTitle;
    ((___r1 = self._menuItemView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setDirty"));
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("title"), function $CPMenuItem__title(self, _cmd)
{
    return self._title;
}
,["CPString"]), new objj_method(sel_getUid("setTextColor:"), function $CPMenuItem__setTextColor_(self, _cmd, aColor)
{
}
,["void","CPString"]), new objj_method(sel_getUid("setFont:"), function $CPMenuItem__setFont_(self, _cmd, aFont)
{
    if (((___r1 = self._font), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", aFont)))
        return;
    self._font = aFont;
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    ((___r1 = self._menuItemView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setDirty"));
    var ___r1;
}
,["void","CPFont"]), new objj_method(sel_getUid("font"), function $CPMenuItem__font(self, _cmd)
{
    return self._font;
}
,["CPFont"]), new objj_method(sel_getUid("setTag:"), function $CPMenuItem__setTag_(self, _cmd, aTag)
{
    self._tag = aTag;
}
,["void","int"]), new objj_method(sel_getUid("tag"), function $CPMenuItem__tag(self, _cmd)
{
    return self._tag;
}
,["int"]), new objj_method(sel_getUid("setState:"), function $CPMenuItem__setState_(self, _cmd, aState)
{
    if (self._state == aState)
        return;
    self._state = aState;
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    ((___r1 = self._menuItemView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setDirty"));
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("state"), function $CPMenuItem__state(self, _cmd)
{
    return self._state;
}
,["int"]), new objj_method(sel_getUid("setImage:"), function $CPMenuItem__setImage_(self, _cmd, anImage)
{
    if (self._image == anImage)
        return;
    self._image = anImage;
    ((___r1 = self._menuItemView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setDirty"));
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("image"), function $CPMenuItem__image(self, _cmd)
{
    return self._image;
}
,["CPImage"]), new objj_method(sel_getUid("setAlternateImage:"), function $CPMenuItem__setAlternateImage_(self, _cmd, anImage)
{
    self._alternateImage = anImage;
}
,["void","CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPMenuItem__alternateImage(self, _cmd)
{
    return self._alternateImage;
}
,["CPImage"]), new objj_method(sel_getUid("setOnStateImage:"), function $CPMenuItem__setOnStateImage_(self, _cmd, anImage)
{
    if (self._onStateImage == anImage)
        return;
    self._onStateImage = anImage;
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("onStateImage"), function $CPMenuItem__onStateImage(self, _cmd)
{
    return self._onStateImage;
}
,["CPImage"]), new objj_method(sel_getUid("setOffStateImage:"), function $CPMenuItem__setOffStateImage_(self, _cmd, anImage)
{
    if (self._offStateImage == anImage)
        return;
    self._offStateImage = anImage;
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("offStateImage"), function $CPMenuItem__offStateImage(self, _cmd)
{
    return self._offStateImage;
}
,["CPImage"]), new objj_method(sel_getUid("setMixedStateImage:"), function $CPMenuItem__setMixedStateImage_(self, _cmd, anImage)
{
    if (self._mixedStateImage == anImage)
        return;
    self._mixedStateImage = anImage;
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("mixedStateImage"), function $CPMenuItem__mixedStateImage(self, _cmd)
{
    return self._mixedStateImage;
}
,["CPImage"]), new objj_method(sel_getUid("setSubmenu:"), function $CPMenuItem__setSubmenu_(self, _cmd, aMenu)
{
    if (self._submenu === aMenu)
        return;
    var supermenu = ((___r1 = self._submenu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "supermenu"));
    if (supermenu)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Can't add submenu \"" + (aMenu == null ? null : aMenu.isa.objj_msgSend0(aMenu, "title")) + "\" to item \"" + self.isa.objj_msgSend0(self, "title") + "\", because it is already submenu of \"" + ((___r1 = (aMenu == null ? null : aMenu.isa.objj_msgSend0(aMenu, "supermenu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "title")) + "\"");
    self._submenu = aMenu;
    if (self._submenu)
    {
        ((___r1 = self._submenu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSupermenu:", self._menu));
        ((___r1 = self._submenu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", self.isa.objj_msgSend0(self, "title")));
        self.isa.objj_msgSend1(self, "setTarget:", self._menu);
        self.isa.objj_msgSend1(self, "setAction:", sel_getUid("submenuAction:"));
    }
    else
    {
        self.isa.objj_msgSend1(self, "setTarget:", nil);
        self.isa.objj_msgSend1(self, "setAction:", NULL);
    }
    ((___r1 = self._menuItemView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setDirty"));
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    var ___r1;
}
,["void","CPMenu"]), new objj_method(sel_getUid("submenu"), function $CPMenuItem__submenu(self, _cmd)
{
    return self._submenu;
}
,["CPMenu"]), new objj_method(sel_getUid("hasSubmenu"), function $CPMenuItem__hasSubmenu(self, _cmd)
{
    return self._submenu ? YES : NO;
}
,["BOOL"]), new objj_method(sel_getUid("isSeparatorItem"), function $CPMenuItem__isSeparatorItem(self, _cmd)
{
    return self._isSeparator;
}
,["BOOL"]), new objj_method(sel_getUid("setMenu:"), function $CPMenuItem__setMenu_(self, _cmd, aMenu)
{
    self._menu = aMenu;
}
,["void","CPMenu"]), new objj_method(sel_getUid("menu"), function $CPMenuItem__menu(self, _cmd)
{
    return self._menu;
}
,["CPMenu"]), new objj_method(sel_getUid("setKeyEquivalent:"), function $CPMenuItem__setKeyEquivalent_(self, _cmd, aString)
{
    self._keyEquivalent = aString || "";
}
,["void","CPString"]), new objj_method(sel_getUid("keyEquivalent"), function $CPMenuItem__keyEquivalent(self, _cmd)
{
    return self._keyEquivalent;
}
,["CPString"]), new objj_method(sel_getUid("setKeyEquivalentModifierMask:"), function $CPMenuItem__setKeyEquivalentModifierMask_(self, _cmd, aMask)
{
    self._keyEquivalentModifierMask = aMask;
}
,["void","unsigned"]), new objj_method(sel_getUid("keyEquivalentModifierMask"), function $CPMenuItem__keyEquivalentModifierMask(self, _cmd)
{
    return self._keyEquivalentModifierMask;
}
,["unsigned"]), new objj_method(sel_getUid("keyEquivalentStringRepresentation"), function $CPMenuItem__keyEquivalentStringRepresentation(self, _cmd)
{
    if (!((___r1 = self._keyEquivalent), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length")))
        return "";
    var string = self._keyEquivalent.toUpperCase(),
        needsShift = self._keyEquivalentModifierMask & CPShiftKeyMask || string === self._keyEquivalent && self._keyEquivalent.toLowerCase() !== self._keyEquivalent.toUpperCase();
    if ((CPMenuItemStringRepresentationDictionary == null ? null : CPMenuItemStringRepresentationDictionary.isa.objj_msgSend1(CPMenuItemStringRepresentationDictionary, "objectForKey:", string)))
        string = (CPMenuItemStringRepresentationDictionary == null ? null : CPMenuItemStringRepresentationDictionary.isa.objj_msgSend1(CPMenuItemStringRepresentationDictionary, "objectForKey:", string));
    if (CPBrowserIsOperatingSystem(CPMacOperatingSystem))
    {
        if (self._keyEquivalentModifierMask & CPCommandKeyMask)
            string = "\u2318" + string;
        if (needsShift)
            string = "\u21E7" + string;
        if (self._keyEquivalentModifierMask & CPAlternateKeyMask)
            string = "\u2325" + string;
        if (self._keyEquivalentModifierMask & CPControlKeyMask)
            string = "\u2303" + string;
    }
    else
    {
        if (needsShift)
            string = "Shift-" + string;
        if (self._keyEquivalentModifierMask & CPAlternateKeyMask)
            string = "Alt-" + string;
        if (self._keyEquivalentModifierMask & CPControlKeyMask || self._keyEquivalentModifierMask & CPCommandKeyMask)
            string = "Ctrl-" + string;
    }
    return string;
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("setMnemonicLocation:"), function $CPMenuItem__setMnemonicLocation_(self, _cmd, aLocation)
{
    self._mnemonicLocation = aLocation;
}
,["void","unsigned"]), new objj_method(sel_getUid("mnemonicLocation"), function $CPMenuItem__mnemonicLocation(self, _cmd)
{
    return self._mnemonicLocation;
}
,["unsigned"]), new objj_method(sel_getUid("setTitleWithMnemonicLocation:"), function $CPMenuItem__setTitleWithMnemonicLocation_(self, _cmd, aTitle)
{
    var location = (aTitle == null ? null : aTitle.isa.objj_msgSend1(aTitle, "rangeOfString:", "&")).location;
    if (location == CPNotFound)
        self.isa.objj_msgSend1(self, "setTitle:", aTitle);
    else
    {
        self.isa.objj_msgSend1(self, "setTitle:", (aTitle == null ? null : aTitle.isa.objj_msgSend1(aTitle, "substringToIndex:", location)) + (aTitle == null ? null : aTitle.isa.objj_msgSend1(aTitle, "substringFromIndex:", location + 1)));
        self.isa.objj_msgSend1(self, "setMnemonicLocation:", location);
    }
}
,["void","CPString"]), new objj_method(sel_getUid("mnemonic"), function $CPMenuItem__mnemonic(self, _cmd)
{
    return self._mnemonicLocation == CPNotFound ? "" : ((___r1 = self._title), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "characterAtIndex:", self._mnemonicLocation));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("setAlternate:"), function $CPMenuItem__setAlternate_(self, _cmd, isAlternate)
{
    self._isAlternate = isAlternate;
}
,["void","BOOL"]), new objj_method(sel_getUid("isAlternate"), function $CPMenuItem__isAlternate(self, _cmd)
{
    return self._isAlternate;
}
,["BOOL"]), new objj_method(sel_getUid("setIndentationLevel:"), function $CPMenuItem__setIndentationLevel_(self, _cmd, aLevel)
{
    if (aLevel < 0)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "setIndentationLevel: argument must be greater than or equal to 0.");
    self._indentationLevel = MIN(15, aLevel);
}
,["void","unsigned"]), new objj_method(sel_getUid("indentationLevel"), function $CPMenuItem__indentationLevel(self, _cmd)
{
    return self._indentationLevel;
}
,["unsigned"]), new objj_method(sel_getUid("setToolTip:"), function $CPMenuItem__setToolTip_(self, _cmd, aToolTip)
{
    self._toolTip = aToolTip;
}
,["void","CPString"]), new objj_method(sel_getUid("toolTip"), function $CPMenuItem__toolTip(self, _cmd)
{
    return self._toolTip;
}
,["CPString"]), new objj_method(sel_getUid("setRepresentedObject:"), function $CPMenuItem__setRepresentedObject_(self, _cmd, anObject)
{
    self._representedObject = anObject;
}
,["void","id"]), new objj_method(sel_getUid("representedObject"), function $CPMenuItem__representedObject(self, _cmd)
{
    return self._representedObject;
}
,["id"]), new objj_method(sel_getUid("setView:"), function $CPMenuItem__setView_(self, _cmd, aView)
{
    if (self._view === aView)
        return;
    self._view = aView;
    ((___r1 = self._menuItemView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setDirty"));
    ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemChanged:", self));
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("view"), function $CPMenuItem__view(self, _cmd)
{
    return self._view;
}
,["CPView"]), new objj_method(sel_getUid("isHighlighted"), function $CPMenuItem__isHighlighted(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "highlightedItem")) == self;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("copy"), function $CPMenuItem__copy(self, _cmd)
{
    var item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    item._isSeparator = self._isSeparator;
    (item == null ? null : item.isa.objj_msgSend1(item, "setTitle:", self._title));
    (item == null ? null : item.isa.objj_msgSend1(item, "setFont:", self._font));
    (item == null ? null : item.isa.objj_msgSend1(item, "setTarget:", self._target));
    (item == null ? null : item.isa.objj_msgSend1(item, "setAction:", self._action));
    (item == null ? null : item.isa.objj_msgSend1(item, "setEnabled:", self._isEnabled));
    (item == null ? null : item.isa.objj_msgSend1(item, "setHidden:", self._isHidden));
    (item == null ? null : item.isa.objj_msgSend1(item, "setTag:", self._tag));
    (item == null ? null : item.isa.objj_msgSend1(item, "setState:", self._state));
    (item == null ? null : item.isa.objj_msgSend1(item, "setImage:", self._image));
    (item == null ? null : item.isa.objj_msgSend1(item, "setAlternateImage:", self._alternateImage));
    (item == null ? null : item.isa.objj_msgSend1(item, "setOnStateImage:", self._onStateImage));
    (item == null ? null : item.isa.objj_msgSend1(item, "setOffStateImage:", self._offStateImage));
    (item == null ? null : item.isa.objj_msgSend1(item, "setMixedStateImage:", self._mixedStateImage));
    (item == null ? null : item.isa.objj_msgSend1(item, "setKeyEquivalent:", self._keyEquivalent));
    (item == null ? null : item.isa.objj_msgSend1(item, "setKeyEquivalentModifierMask:", self._keyEquivalentModifierMask));
    (item == null ? null : item.isa.objj_msgSend1(item, "setMnemonicLocation:", self._mnemonicLocation));
    (item == null ? null : item.isa.objj_msgSend1(item, "setAlternate:", self._isAlternate));
    (item == null ? null : item.isa.objj_msgSend1(item, "setIndentationLevel:", self._indentationLevel));
    (item == null ? null : item.isa.objj_msgSend1(item, "setToolTip:", self._toolTip));
    (item == null ? null : item.isa.objj_msgSend1(item, "setRepresentedObject:", self._representedObject));
    return item;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("mutableCopy"), function $CPMenuItem__mutableCopy(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "copy");
}
,["id"]), new objj_method(sel_getUid("_menuItemView"), function $CPMenuItem___menuItemView(self, _cmd)
{
    if (!self._menuItemView)
        self._menuItemView = ((___r1 = _CPMenuItemView.isa.objj_msgSend0(_CPMenuItemView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithFrame:forMenuItem:", CGRectMakeZero(), self));
    return self._menuItemView;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("_isSelectable"), function $CPMenuItem___isSelectable(self, _cmd)
{
    return !self.isa.objj_msgSend0(self, "submenu") || self.isa.objj_msgSend0(self, "action") !== sel_getUid("submenuAction:") || self.isa.objj_msgSend0(self, "target") !== self.isa.objj_msgSend0(self, "menu");
}
,["BOOL"]), new objj_method(sel_getUid("_isMenuBarButton"), function $CPMenuItem___isMenuBarButton(self, _cmd)
{
    return !self.isa.objj_msgSend0(self, "submenu") && self.isa.objj_msgSend0(self, "menu") === (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu"));
}
,["BOOL"]), new objj_method(sel_getUid("description"), function $CPMenuItem__description(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenuItem").super_class }, "description") + " target: " + self.isa.objj_msgSend0(self, "target") + " action: " + CPStringFromSelector(self.isa.objj_msgSend0(self, "action"));
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPMenuItem___binderClassForBinding_(self, _cmd, aBinding)
{
    if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPEnabledBinding)))
        return CPMultipleValueAndBinding.isa.objj_msgSend0(CPMultipleValueAndBinding, "class");
    else if (aBinding === CPTargetBinding || (aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPArgumentBinding)))
        return CPActionBinding.isa.objj_msgSend0(CPActionBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPMenuItem").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("separatorItem"), function $CPMenuItem__separatorItem(self, _cmd)
{
    var separatorItem = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "", nil, nil));
    separatorItem._isSeparator = YES;
    return separatorItem;
    var ___r1;
}
,["CPMenuItem"])]);
}var CPMenuItemIsSeparatorKey = "CPMenuItemIsSeparatorKey",
    CPMenuItemTitleKey = "CPMenuItemTitleKey",
    CPMenuItemTargetKey = "CPMenuItemTargetKey",
    CPMenuItemActionKey = "CPMenuItemActionKey",
    CPMenuItemIsEnabledKey = "CPMenuItemIsEnabledKey",
    CPMenuItemIsHiddenKey = "CPMenuItemIsHiddenKey",
    CPMenuItemTagKey = "CPMenuItemTagKey",
    CPMenuItemStateKey = "CPMenuItemStateKey",
    CPMenuItemImageKey = "CPMenuItemImageKey",
    CPMenuItemAlternateImageKey = "CPMenuItemAlternateImageKey",
    CPMenuItemSubmenuKey = "CPMenuItemSubmenuKey",
    CPMenuItemMenuKey = "CPMenuItemMenuKey",
    CPMenuItemKeyEquivalentKey = "CPMenuItemKeyEquivalentKey",
    CPMenuItemKeyEquivalentModifierMaskKey = "CPMenuItemKeyEquivalentModifierMaskKey",
    CPMenuItemIndentationLevelKey = "CPMenuItemIndentationLevelKey",
    CPMenuItemRepresentedObjectKey = "CPMenuItemRepresentedObjectKey",
    CPMenuItemViewKey = "CPMenuItemViewKey";
{
var the_class = objj_getClass("CPMenuItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPMenuItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPMenuItem__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenuItem").super_class }, "init");
    if (self)
    {
        self._changeCount = 0;
        self._isSeparator = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPMenuItemIsSeparatorKey)) && (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPMenuItemIsSeparatorKey));
        self._title = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemTitleKey));
        self._target = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemTargetKey));
        self._action = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemActionKey));
        self._isEnabled = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPMenuItemIsEnabledKey)) ? (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemIsEnabledKey)) : YES;
        self._isHidden = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPMenuItemIsHiddenKey));
        self._tag = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPMenuItemTagKey));
        self._state = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPMenuItemStateKey));
        self._image = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemImageKey));
        self._alternateImage = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemAlternateImageKey));
        self._menu = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemMenuKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setSubmenu:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemSubmenuKey))));
        self._keyEquivalent = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemKeyEquivalentKey)) || "";
        self._keyEquivalentModifierMask = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPMenuItemKeyEquivalentModifierMaskKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setIndentationLevel:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPMenuItemIndentationLevelKey))));
        self._representedObject = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemRepresentedObjectKey));
        self._view = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPMenuItemViewKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPMenuItem__encodeWithCoder_(self, _cmd, aCoder)
{
    if (self._isSeparator)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isSeparator, CPMenuItemIsSeparatorKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._title, CPMenuItemTitleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._target, CPMenuItemTargetKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._action, CPMenuItemActionKey));
    if (self._isEnabled !== YES)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._isEnabled, CPMenuItemIsEnabledKey));
    if (self._isHidden !== NO)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._isHidden, CPMenuItemIsHiddenKey));
    if (self._tag !== 0)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._tag, CPMenuItemTagKey));
    if (self._state !== CPOffState)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._state, CPMenuItemStateKey));
    if (self._image !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._image, CPMenuItemImageKey));
    if (self._alternateImage !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._alternateImage, CPMenuItemAlternateImageKey));
    if (self._submenu !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._submenu, CPMenuItemSubmenuKey));
    if (self._menu !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._menu, CPMenuItemMenuKey));
    if (self._keyEquivalent && self._keyEquivalent.length)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._keyEquivalent, CPMenuItemKeyEquivalentKey));
    if (self._keyEquivalentModifierMask)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._keyEquivalentModifierMask, CPMenuItemKeyEquivalentModifierMaskKey));
    if (self._indentationLevel > 0)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._indentationLevel, CPMenuItemIndentationLevelKey));
    if (self._representedObject !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._representedObject, CPMenuItemRepresentedObjectKey));
    if (self._view !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._view, CPMenuItemViewKey));
}
,["void","CPCoder"])]);
}