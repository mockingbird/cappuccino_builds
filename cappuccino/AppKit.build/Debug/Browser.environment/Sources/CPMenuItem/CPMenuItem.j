@STATIC;1.0;I;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;9;CPImage.ji;8;CPText.ji;8;CPView.ji;17;_CPMenuItemView.jt;24670;objj_executeFile("Foundation/CPCoder.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPImage.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("_CPMenuItemView.j", YES);var CPMenuItemStringRepresentationDictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", "\u238B", CPEscapeFunctionKey, "\u21E5", CPTabCharacter, "\u21E4", CPBackTabCharacter, "\u2423", CPSpaceFunctionKey, "\u23CE", CPCarriageReturnCharacter, "\u232B", CPBackspaceCharacter, "\u232B", CPDeleteFunctionKey, "\u2326", CPDeleteCharacter, "\u21F1", CPHomeFunctionKey, "\u21F2", CPEndFunctionKey, "\u21DE", CPPageUpFunctionKey, "\u21DF", CPPageDownFunctionKey, "\u2191", CPUpArrowFunctionKey, "\u2193", CPDownArrowFunctionKey, "\u2190", CPLeftArrowFunctionKey, "\u2192", CPRightArrowFunctionKey, "\u2327", CPClearDisplayFunctionKey);
{var the_class = objj_allocateClassPair(CPObject, "CPMenuItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isSeparator"), new objj_ivar("_title"), new objj_ivar("_font"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_isEnabled"), new objj_ivar("_isHidden"), new objj_ivar("_tag"), new objj_ivar("_state"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_onStateImage"), new objj_ivar("_offStateImage"), new objj_ivar("_mixedStateImage"), new objj_ivar("_submenu"), new objj_ivar("_menu"), new objj_ivar("_keyEquivalent"), new objj_ivar("_keyEquivalentModifierMask"), new objj_ivar("_mnemonicLocation"), new objj_ivar("_isAlternate"), new objj_ivar("_indentationLevel"), new objj_ivar("_toolTip"), new objj_ivar("_representedObject"), new objj_ivar("_view"), new objj_ivar("_changeCount"), new objj_ivar("_menuItemView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPMenuItem__init(self, _cmd)
{
    return objj_msgSend(self, "initWithTitle:action:keyEquivalent:", "", nil, nil);
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
    if (!isEnabled && objj_msgSend(self, "isHighlighted"))
        objj_msgSend(self._menu, "_highlightItemAtIndex:", CPNotFound);
    self._isEnabled = !!isEnabled;
    objj_msgSend(self._menuItemView, "setDirty");
    objj_msgSend(self._menu, "itemChanged:", self);
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
    objj_msgSend(self._menu, "itemChanged:", self);
}
,["void","BOOL"]), new objj_method(sel_getUid("isHidden"), function $CPMenuItem__isHidden(self, _cmd)
{
    return self._isHidden;
}
,["BOOL"]), new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"), function $CPMenuItem__isHiddenOrHasHiddenAncestor(self, _cmd)
{
    if (self._isHidden)
        return YES;
    var supermenu = objj_msgSend(self._menu, "supermenu");
    if (objj_msgSend(objj_msgSend(supermenu, "itemAtIndex:", objj_msgSend(supermenu, "indexOfItemWithSubmenu:", self._menu)), "isHiddenOrHasHiddenAncestor"))
        return YES;
    return NO;
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
    objj_msgSend(self._menuItemView, "setDirty");
    objj_msgSend(self._menu, "itemChanged:", self);
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
    if (objj_msgSend(self._font, "isEqual:", aFont))
        return;
    self._font = aFont;
    objj_msgSend(self._menu, "itemChanged:", self);
    objj_msgSend(self._menuItemView, "setDirty");
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
    objj_msgSend(self._menu, "itemChanged:", self);
    objj_msgSend(self._menuItemView, "setDirty");
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
    objj_msgSend(self._menuItemView, "setDirty");
    objj_msgSend(self._menu, "itemChanged:", self);
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
    objj_msgSend(self._menu, "itemChanged:", self);
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
    objj_msgSend(self._menu, "itemChanged:", self);
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
    objj_msgSend(self._menu, "itemChanged:", self);
}
,["void","CPImage"]), new objj_method(sel_getUid("mixedStateImage"), function $CPMenuItem__mixedStateImage(self, _cmd)
{
    return self._mixedStateImage;
}
,["CPImage"]), new objj_method(sel_getUid("setSubmenu:"), function $CPMenuItem__setSubmenu_(self, _cmd, aMenu)
{
    if (self._submenu === aMenu)
        return;
    var supermenu = objj_msgSend(self._submenu, "supermenu");
    if (supermenu)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Can't add submenu \"" + objj_msgSend(aMenu, "title") + "\" to item \"" + objj_msgSend(self, "title") + "\", because it is already submenu of \"" + objj_msgSend(objj_msgSend(aMenu, "supermenu"), "title") + "\"");
    self._submenu = aMenu;
    if (self._submenu)
    {
        objj_msgSend(self._submenu, "setSupermenu:", self._menu);
        objj_msgSend(self._submenu, "setTitle:", objj_msgSend(self, "title"));
        objj_msgSend(self, "setTarget:", self._menu);
        objj_msgSend(self, "setAction:", sel_getUid("submenuAction:"));
    }
    else
    {
        objj_msgSend(self, "setTarget:", nil);
        objj_msgSend(self, "setAction:", NULL);
    }
    objj_msgSend(self._menuItemView, "setDirty");
    objj_msgSend(self._menu, "itemChanged:", self);
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
    if (!objj_msgSend(self._keyEquivalent, "length"))
        return "";
    var string = self._keyEquivalent.toUpperCase(),
        needsShift = self._keyEquivalentModifierMask & CPShiftKeyMask || string === self._keyEquivalent && self._keyEquivalent.toLowerCase() !== self._keyEquivalent.toUpperCase();
    if (objj_msgSend(CPMenuItemStringRepresentationDictionary, "objectForKey:", string))
        string = objj_msgSend(CPMenuItemStringRepresentationDictionary, "objectForKey:", string);
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
    var location = objj_msgSend(aTitle, "rangeOfString:", "&").location;
    if (location == CPNotFound)
        objj_msgSend(self, "setTitle:", aTitle);
    else
    {
        objj_msgSend(self, "setTitle:", objj_msgSend(aTitle, "substringToIndex:", location) + objj_msgSend(aTitle, "substringFromIndex:", location + 1));
        objj_msgSend(self, "setMnemonicLocation:", location);
    }
}
,["void","CPString"]), new objj_method(sel_getUid("mnemonic"), function $CPMenuItem__mnemonic(self, _cmd)
{
    return self._mnemonicLocation == CPNotFound ? "" : objj_msgSend(self._title, "characterAtIndex:", self._mnemonicLocation);
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
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "setIndentationLevel: argument must be greater than or equal to 0.");
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
    objj_msgSend(self._menuItemView, "setDirty");
    objj_msgSend(self._menu, "itemChanged:", self);
}
,["void","CPView"]), new objj_method(sel_getUid("view"), function $CPMenuItem__view(self, _cmd)
{
    return self._view;
}
,["CPView"]), new objj_method(sel_getUid("isHighlighted"), function $CPMenuItem__isHighlighted(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "menu"), "highlightedItem") == self;
}
,["BOOL"]), new objj_method(sel_getUid("copy"), function $CPMenuItem__copy(self, _cmd)
{
    var item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "init");
    item._isSeparator = self._isSeparator;
    objj_msgSend(item, "setTitle:", self._title);
    objj_msgSend(item, "setFont:", self._font);
    objj_msgSend(item, "setTarget:", self._target);
    objj_msgSend(item, "setAction:", self._action);
    objj_msgSend(item, "setEnabled:", self._isEnabled);
    objj_msgSend(item, "setHidden:", self._isHidden);
    objj_msgSend(item, "setTag:", self._tag);
    objj_msgSend(item, "setState:", self._state);
    objj_msgSend(item, "setImage:", self._image);
    objj_msgSend(item, "setAlternateImage:", self._alternateImage);
    objj_msgSend(item, "setOnStateImage:", self._onStateImage);
    objj_msgSend(item, "setOffStateImage:", self._offStateImage);
    objj_msgSend(item, "setMixedStateImage:", self._mixedStateImage);
    objj_msgSend(item, "setKeyEquivalent:", self._keyEquivalent);
    objj_msgSend(item, "setKeyEquivalentModifierMask:", self._keyEquivalentModifierMask);
    objj_msgSend(item, "setMnemonicLocation:", self._mnemonicLocation);
    objj_msgSend(item, "setAlternate:", self._isAlternate);
    objj_msgSend(item, "setIndentationLevel:", self._indentationLevel);
    objj_msgSend(item, "setToolTip:", self._toolTip);
    objj_msgSend(item, "setRepresentedObject:", self._representedObject);
    return item;
}
,["id"]), new objj_method(sel_getUid("mutableCopy"), function $CPMenuItem__mutableCopy(self, _cmd)
{
    return objj_msgSend(self, "copy");
}
,["id"]), new objj_method(sel_getUid("_menuItemView"), function $CPMenuItem___menuItemView(self, _cmd)
{
    if (!self._menuItemView)
        self._menuItemView = objj_msgSend(objj_msgSend(_CPMenuItemView, "alloc"), "initWithFrame:forMenuItem:", CGRectMakeZero(), self);
    return self._menuItemView;
}
,["id"]), new objj_method(sel_getUid("_isSelectable"), function $CPMenuItem___isSelectable(self, _cmd)
{
    return !objj_msgSend(self, "submenu") || objj_msgSend(self, "action") !== sel_getUid("submenuAction:") || objj_msgSend(self, "target") !== objj_msgSend(self, "menu");
}
,["BOOL"]), new objj_method(sel_getUid("_isMenuBarButton"), function $CPMenuItem___isMenuBarButton(self, _cmd)
{
    return !objj_msgSend(self, "submenu") && objj_msgSend(self, "menu") === objj_msgSend(CPApp, "mainMenu");
}
,["BOOL"]), new objj_method(sel_getUid("description"), function $CPMenuItem__description(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenuItem").super_class }, "description") + " target: " + objj_msgSend(self, "target") + " action: " + CPStringFromSelector(objj_msgSend(self, "action"));
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPMenuItem___binderClassForBinding_(self, _cmd, aBinding)
{
    if (objj_msgSend(aBinding, "hasPrefix:", CPEnabledBinding))
        return objj_msgSend(CPMultipleValueAndBinding, "class");
    else if (aBinding === CPTargetBinding || objj_msgSend(aBinding, "hasPrefix:", CPArgumentBinding))
        return objj_msgSend(CPActionBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPMenuItem").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("separatorItem"), function $CPMenuItem__separatorItem(self, _cmd)
{
    var separatorItem = objj_msgSend(objj_msgSend(self, "alloc"), "initWithTitle:action:keyEquivalent:", "", nil, nil);
    separatorItem._isSeparator = YES;
    return separatorItem;
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
        self._isSeparator = objj_msgSend(aCoder, "containsValueForKey:", CPMenuItemIsSeparatorKey) && objj_msgSend(aCoder, "decodeBoolForKey:", CPMenuItemIsSeparatorKey);
        self._title = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemTitleKey);
        self._target = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemTargetKey);
        self._action = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemActionKey);
        self._isEnabled = objj_msgSend(aCoder, "containsValueForKey:", CPMenuItemIsEnabledKey) ? objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemIsEnabledKey) : YES;
        self._isHidden = objj_msgSend(aCoder, "decodeBoolForKey:", CPMenuItemIsHiddenKey);
        self._tag = objj_msgSend(aCoder, "decodeIntForKey:", CPMenuItemTagKey);
        self._state = objj_msgSend(aCoder, "decodeIntForKey:", CPMenuItemStateKey);
        self._image = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemImageKey);
        self._alternateImage = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemAlternateImageKey);
        self._menu = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemMenuKey);
        objj_msgSend(self, "setSubmenu:", objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemSubmenuKey));
        self._keyEquivalent = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemKeyEquivalentKey) || "";
        self._keyEquivalentModifierMask = objj_msgSend(aCoder, "decodeIntForKey:", CPMenuItemKeyEquivalentModifierMaskKey);
        objj_msgSend(self, "setIndentationLevel:", objj_msgSend(aCoder, "decodeIntForKey:", CPMenuItemIndentationLevelKey));
        self._representedObject = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemRepresentedObjectKey);
        self._view = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemViewKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPMenuItem__encodeWithCoder_(self, _cmd, aCoder)
{
    if (self._isSeparator)
        objj_msgSend(aCoder, "encodeBool:forKey:", self._isSeparator, CPMenuItemIsSeparatorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._title, CPMenuItemTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._target, CPMenuItemTargetKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._action, CPMenuItemActionKey);
    if (self._isEnabled !== YES)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._isEnabled, CPMenuItemIsEnabledKey);
    if (self._isHidden !== NO)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._isHidden, CPMenuItemIsHiddenKey);
    if (self._tag !== 0)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._tag, CPMenuItemTagKey);
    if (self._state !== CPOffState)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._state, CPMenuItemStateKey);
    if (self._image !== nil)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._image, CPMenuItemImageKey);
    if (self._alternateImage !== nil)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._alternateImage, CPMenuItemAlternateImageKey);
    if (self._submenu !== nil)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._submenu, CPMenuItemSubmenuKey);
    if (self._menu !== nil)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._menu, CPMenuItemMenuKey);
    if (self._keyEquivalent && self._keyEquivalent.length)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._keyEquivalent, CPMenuItemKeyEquivalentKey);
    if (self._keyEquivalentModifierMask)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._keyEquivalentModifierMask, CPMenuItemKeyEquivalentModifierMaskKey);
    if (self._indentationLevel > 0)
        objj_msgSend(aCoder, "encodeInt:forKey:", self._indentationLevel, CPMenuItemIndentationLevelKey);
    if (self._representedObject !== nil)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._representedObject, CPMenuItemRepresentedObjectKey);
    if (self._view !== nil)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._view, CPMenuItemViewKey);
}
,["void","CPCoder"])]);
}