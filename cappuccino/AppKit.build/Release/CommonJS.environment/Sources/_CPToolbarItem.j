@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;9;CPImage.ji;8;CPView.jt;18959;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPImage.j", YES);objj_executeFile("CPView.j", YES);CPToolbarItemVisibilityPriorityStandard = 0;
CPToolbarItemVisibilityPriorityLow = -1000;
CPToolbarItemVisibilityPriorityHigh = 1000;
CPToolbarItemVisibilityPriorityUser = 2000;
CPToolbarSeparatorItemIdentifier = "CPToolbarSeparatorItem";
CPToolbarSpaceItemIdentifier = "CPToolbarSpaceItem";
CPToolbarFlexibleSpaceItemIdentifier = "CPToolbarFlexibleSpaceItem";
CPToolbarShowColorsItemIdentifier = "CPToolbarShowColorsItem";
CPToolbarShowFontsItemIdentifier = "CPToolbarShowFontsItem";
CPToolbarCustomizeToolbarItemIdentifier = "CPToolbarCustomizeToolbarItem";
CPToolbarPrintItemIdentifier = "CPToolbarPrintItem";
{var the_class = objj_allocateClassPair(CPObject, "CPToolbarItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_itemIdentifier"), new objj_ivar("_toolbar"), new objj_ivar("_label"), new objj_ivar("_paletteLabel"), new objj_ivar("_toolTip"), new objj_ivar("_tag"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_isEnabled"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_view"), new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_visibilityPriority"), new objj_ivar("_autovalidates")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPToolbarItem__init(self, _cmd)
{
    return objj_msgSend(self, "initWithItemIdentifier:", "");
}
,["id"]), new objj_method(sel_getUid("initWithItemIdentifier:"), function $CPToolbarItem__initWithItemIdentifier_(self, _cmd, anItemIdentifier)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPToolbarItem").super_class }, "init");
    if (self)
    {
        self._itemIdentifier = anItemIdentifier;
        self._tag = 0;
        self._isEnabled = YES;
        self._minSize = CGSizeMakeZero();
        self._maxSize = CGSizeMakeZero();
        self._visibilityPriority = CPToolbarItemVisibilityPriorityStandard;
        self._autovalidates = YES;
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("itemIdentifier"), function $CPToolbarItem__itemIdentifier(self, _cmd)
{
    return self._itemIdentifier;
}
,["CPString"]), new objj_method(sel_getUid("toolbar"), function $CPToolbarItem__toolbar(self, _cmd)
{
    return self._toolbar;
}
,["CPToolbar"]), new objj_method(sel_getUid("_setToolbar:"), function $CPToolbarItem___setToolbar_(self, _cmd, aToolbar)
{
    self._toolbar = aToolbar;
}
,["void","CPToolbar"]), new objj_method(sel_getUid("label"), function $CPToolbarItem__label(self, _cmd)
{
    return self._label;
}
,["CPString"]), new objj_method(sel_getUid("setLabel:"), function $CPToolbarItem__setLabel_(self, _cmd, aLabel)
{
    self._label = aLabel;
}
,["void","CPString"]), new objj_method(sel_getUid("paletteLabel"), function $CPToolbarItem__paletteLabel(self, _cmd)
{
    return self._paletteLabel;
}
,["CPString"]), new objj_method(sel_getUid("setPaletteLabel:"), function $CPToolbarItem__setPaletteLabel_(self, _cmd, aPaletteLabel)
{
    self._paletteLabel = aPaletteLabel;
}
,["void","CPString"]), new objj_method(sel_getUid("toolTip"), function $CPToolbarItem__toolTip(self, _cmd)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("toolTip")))
        return objj_msgSend(self._view, "toolTip");
    return self._toolTip;
}
,["CPString"]), new objj_method(sel_getUid("setToolTip:"), function $CPToolbarItem__setToolTip_(self, _cmd, aToolTip)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setToolTip:")))
        objj_msgSend(self._view, "setToolTip:", aToolTip);
    self._toolTip = aToolTip;
}
,["void","CPString"]), new objj_method(sel_getUid("tag"), function $CPToolbarItem__tag(self, _cmd)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("tag")))
        return objj_msgSend(self._view, "tag");
    return self._tag;
}
,["int"]), new objj_method(sel_getUid("setTag:"), function $CPToolbarItem__setTag_(self, _cmd, aTag)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setTag:")))
        objj_msgSend(self._view, "setTag:", aTag);
    self._tag = aTag;
}
,["void","int"]), new objj_method(sel_getUid("target"), function $CPToolbarItem__target(self, _cmd)
{
    if (self._view)
        return objj_msgSend(self._view, "respondsToSelector:", sel_getUid("target")) ? objj_msgSend(self._view, "target") : nil;
    return self._target;
}
,["id"]), new objj_method(sel_getUid("setTarget:"), function $CPToolbarItem__setTarget_(self, _cmd, aTarget)
{
    if (!self._view)
        self._target = aTarget;
    else if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setTarget:")))
        objj_msgSend(self._view, "setTarget:", aTarget);
}
,["void","id"]), new objj_method(sel_getUid("action"), function $CPToolbarItem__action(self, _cmd)
{
    if (self._view)
        return objj_msgSend(self._view, "respondsToSelector:", sel_getUid("action")) ? objj_msgSend(self._view, "action") : nil;
    return self._action;
}
,["SEL"]), new objj_method(sel_getUid("setAction:"), function $CPToolbarItem__setAction_(self, _cmd, anAction)
{
    if (!self._view)
        self._action = anAction;
    else if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setAction:")))
        objj_msgSend(self._view, "setAction:", anAction);
}
,["void","SEL"]), new objj_method(sel_getUid("isEnabled"), function $CPToolbarItem__isEnabled(self, _cmd)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("isEnabled")))
        return objj_msgSend(self._view, "isEnabled");
    return self._isEnabled;
}
,["BOOL"]), new objj_method(sel_getUid("setEnabled:"), function $CPToolbarItem__setEnabled_(self, _cmd, shouldBeEnabled)
{
    if (self._isEnabled === shouldBeEnabled)
        return;
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setEnabled:")))
        objj_msgSend(self._view, "setEnabled:", shouldBeEnabled);
    self._isEnabled = shouldBeEnabled;
}
,["void","BOOL"]), new objj_method(sel_getUid("image"), function $CPToolbarItem__image(self, _cmd)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("image")))
        return objj_msgSend(self._view, "image");
    return self._image;
}
,["CPImage"]), new objj_method(sel_getUid("setImage:"), function $CPToolbarItem__setImage_(self, _cmd, anImage)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setImage:")))
        objj_msgSend(self._view, "setImage:", anImage);
    self._image = anImage;
    if (!self._image)
        return;
    if (self._minSize.width === 0 && self._minSize.height === 0 && self._maxSize.width === 0 && self._maxSize.height === 0)
    {
        var imageSize = objj_msgSend(self._image, "size");
        if (imageSize.width > 0 || imageSize.height > 0)
        {
            objj_msgSend(self, "setMinSize:", imageSize);
            objj_msgSend(self, "setMaxSize:", imageSize);
        }
    }
}
,["void","CPImage"]), new objj_method(sel_getUid("setAlternateImage:"), function $CPToolbarItem__setAlternateImage_(self, _cmd, anImage)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setAlternateImage:")))
        objj_msgSend(self._view, "setAlternateImage:", anImage);
    self._alternateImage = anImage;
}
,["void","CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPToolbarItem__alternateImage(self, _cmd)
{
    if (objj_msgSend(self._view, "respondsToSelector:", sel_getUid("alternateIamge")))
        return objj_msgSend(self._view, "alternateImage");
    return self._alternateImage;
}
,["CPImage"]), new objj_method(sel_getUid("view"), function $CPToolbarItem__view(self, _cmd)
{
    return self._view;
}
,["CPView"]), new objj_method(sel_getUid("setView:"), function $CPToolbarItem__setView_(self, _cmd, aView)
{
    if (self._view == aView)
        return;
    self._view = aView;
    if (self._view)
    {
        if (self._tag !== 0 && objj_msgSend(self._view, "respondsToSelector:", sel_getUid("setTag:")))
            objj_msgSend(self._view, "setTag:", self._tag);
        self._target = nil;
        self._action = nil;
    }
}
,["void","CPView"]), new objj_method(sel_getUid("minSize"), function $CPToolbarItem__minSize(self, _cmd)
{
    return self._minSize;
}
,["CGSize"]), new objj_method(sel_getUid("setMinSize:"), function $CPToolbarItem__setMinSize_(self, _cmd, aMinSize)
{
    if (!aMinSize.height || !aMinSize.width)
        return;
    self._minSize = CGSizeMakeCopy(aMinSize);
    self._maxSize = CGSizeMake(MAX(self._minSize.width, self._maxSize.width), MAX(self._minSize.height, self._maxSize.height));
}
,["void","CGSize"]), new objj_method(sel_getUid("maxSize"), function $CPToolbarItem__maxSize(self, _cmd)
{
    return self._maxSize;
}
,["CGSize"]), new objj_method(sel_getUid("setMaxSize:"), function $CPToolbarItem__setMaxSize_(self, _cmd, aMaxSize)
{
    if (!aMaxSize.height || !aMaxSize.width)
        return;
    self._maxSize = CGSizeMakeCopy(aMaxSize);
    self._minSize = CGSizeMake(MIN(self._minSize.width, self._maxSize.width), MIN(self._minSize.height, self._maxSize.height));
}
,["void","CGSize"]), new objj_method(sel_getUid("visibilityPriority"), function $CPToolbarItem__visibilityPriority(self, _cmd)
{
    return self._visibilityPriority;
}
,["int"]), new objj_method(sel_getUid("setVisibilityPriority:"), function $CPToolbarItem__setVisibilityPriority_(self, _cmd, aVisibilityPriority)
{
    self._visibilityPriority = aVisibilityPriority;
}
,["void","int"]), new objj_method(sel_getUid("validate"), function $CPToolbarItem__validate(self, _cmd)
{
    var action = objj_msgSend(self, "action"),
        target = objj_msgSend(self, "target");
    if (self._view)
    {
        if (objj_msgSend(target, "respondsToSelector:", sel_getUid("validateToolbarItem:")))
        {
            var shouldBeEnabled = objj_msgSend(target, "validateToolbarItem:", self);
            if (self._isEnabled !== shouldBeEnabled)
                objj_msgSend(self, "setEnabled:", shouldBeEnabled);
        }
        return;
    }
    if (!action)
    {
        if (self._isEnabled)
            return objj_msgSend(self, "setEnabled:", NO);
        return;
    }
    if (target && !objj_msgSend(target, "respondsToSelector:", action))
    {
        if (self._isEnabled)
            return objj_msgSend(self, "setEnabled:", NO);
        return;
    }
    target = objj_msgSend(CPApp, "targetForAction:to:from:", action, target, self);
    if (!target)
    {
        if (self._isEnabled)
            return objj_msgSend(self, "setEnabled:", NO);
        return;
    }
    if (objj_msgSend(target, "respondsToSelector:", sel_getUid("validateToolbarItem:")))
    {
        var shouldBeEnabled = objj_msgSend(target, "validateToolbarItem:", self);
        if (self._isEnabled !== shouldBeEnabled)
            objj_msgSend(self, "setEnabled:", shouldBeEnabled);
    }
    else
    {
        if (!self._isEnabled)
            objj_msgSend(self, "setEnabled:", YES);
    }
}
,["void"]), new objj_method(sel_getUid("autovalidates"), function $CPToolbarItem__autovalidates(self, _cmd)
{
    return self._autovalidates;
}
,["BOOL"]), new objj_method(sel_getUid("setAutovalidates:"), function $CPToolbarItem__setAutovalidates_(self, _cmd, shouldAutovalidate)
{
    self._autovalidates = !!shouldAutovalidate;
}
,["void","BOOL"])]);
}var CPToolbarItemItemIdentifierKey = "CPToolbarItemItemIdentifierKey",
    CPToolbarItemLabelKey = "CPToolbarItemLabelKey",
    CPToolbarItemPaletteLabelKey = "CPToolbarItemPaletteLabelKey",
    CPToolbarItemToolTipKey = "CPToolbarItemToolTipKey",
    CPToolbarItemTagKey = "CPToolbarItemTagKey",
    CPToolbarItemTargetKey = "CPToolbarItemTargetKey",
    CPToolbarItemActionKey = "CPToolbarItemActionKey",
    CPToolbarItemEnabledKey = "CPToolbarItemEnabledKey",
    CPToolbarItemImageKey = "CPToolbarItemImageKey",
    CPToolbarItemAlternateImageKey = "CPToolbarItemAlternateImageKey",
    CPToolbarItemViewKey = "CPToolbarItemViewKey",
    CPToolbarItemMinSizeKey = "CPToolbarItemMinSizeKey",
    CPToolbarItemMaxSizeKey = "CPToolbarItemMaxSizeKey",
    CPToolbarItemVisibilityPriorityKey = "CPToolbarItemVisibilityPriorityKey",
    CPToolbarItemAutovalidatesKey = "CPToolbarItemAutovalidatesKey";
{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPToolbarItem__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPToolbarItem").super_class }, "init");
    if (self)
    {
        self._itemIdentifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarItemItemIdentifierKey);
        self._minSize = objj_msgSend(aCoder, "decodeSizeForKey:", CPToolbarItemMinSizeKey);
        self._maxSize = objj_msgSend(aCoder, "decodeSizeForKey:", CPToolbarItemMaxSizeKey);
        objj_msgSend(self, "setLabel:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarItemLabelKey));
        objj_msgSend(self, "setPaletteLabel:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarItemPaletteLabelKey));
        objj_msgSend(self, "setToolTip:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarItemToolTipKey));
        objj_msgSend(self, "setTag:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarItemTagKey));
        objj_msgSend(self, "setTarget:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarItemTargetKey));
        objj_msgSend(self, "setAction:", CPSelectorFromString(objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarItemActionKey)));
        objj_msgSend(self, "setEnabled:", objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarItemEnabledKey));
        objj_msgSend(self, "setImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarItemImageKey));
        objj_msgSend(self, "setAlternateImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarItemAlternateImageKey));
        objj_msgSend(self, "setView:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarItemViewKey));
        objj_msgSend(self, "setVisibilityPriority:", objj_msgSend(aCoder, "decodeIntForKey:", CPToolbarItemVisibilityPriorityKey));
        objj_msgSend(self, "setAutovalidates:", objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarItemAutovalidatesKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPToolbarItem__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._itemIdentifier, CPToolbarItemItemIdentifierKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "label"), CPToolbarItemLabelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "paletteLabel"), CPToolbarItemPaletteLabelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "toolTip"), CPToolbarItemToolTipKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "tag"), CPToolbarItemTagKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "target"), CPToolbarItemTargetKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "action"), CPToolbarItemActionKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "isEnabled"), CPToolbarItemEnabledKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "image"), CPToolbarItemImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "alternateImage"), CPToolbarItemAlternateImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "view"), CPToolbarItemViewKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", objj_msgSend(self, "minSize"), CPToolbarItemMinSizeKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", objj_msgSend(self, "maxSize"), CPToolbarItemMaxSizeKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "visibilityPriority"), CPToolbarItemVisibilityPriorityKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", objj_msgSend(self, "autovalidates"), CPToolbarItemAutovalidatesKey);
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPToolbarItem__copy(self, _cmd)
{
    var copy = objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithItemIdentifier:", self._itemIdentifier);
    if (self._view)
        objj_msgSend(copy, "setView:", objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", self._view)));
    objj_msgSend(copy, "_setToolbar:", self._toolbar);
    objj_msgSend(copy, "setLabel:", self._label);
    objj_msgSend(copy, "setPaletteLabel:", self._paletteLabel);
    objj_msgSend(copy, "setToolTip:", objj_msgSend(self, "toolTip"));
    objj_msgSend(copy, "setTag:", objj_msgSend(self, "tag"));
    objj_msgSend(copy, "setTarget:", objj_msgSend(self, "target"));
    objj_msgSend(copy, "setAction:", objj_msgSend(self, "action"));
    objj_msgSend(copy, "setEnabled:", objj_msgSend(self, "isEnabled"));
    objj_msgSend(copy, "setImage:", objj_msgSend(self, "image"));
    objj_msgSend(copy, "setAlternateImage:", objj_msgSend(self, "alternateImage"));
    objj_msgSend(copy, "setMinSize:", self._minSize);
    objj_msgSend(copy, "setMaxSize:", self._maxSize);
    objj_msgSend(copy, "setVisibilityPriority:", objj_msgSend(self, "visibilityPriority"));
    objj_msgSend(copy, "setAutovalidates:", objj_msgSend(self, "autovalidates"));
    return copy;
}
,["id"])]);
}{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("_standardItemWithItemIdentifier:"), function $CPToolbarItem___standardItemWithItemIdentifier_(self, _cmd, anItemIdentifier)
{
    switch(anItemIdentifier) {
    case CPToolbarSeparatorItemIdentifier:
        return objj_msgSend(_CPToolbarSeparatorItem, "new");
    case CPToolbarSpaceItemIdentifier:
        return objj_msgSend(_CPToolbarSpaceItem, "new");
    case CPToolbarFlexibleSpaceItemIdentifier:
        return objj_msgSend(_CPToolbarFlexibleSpaceItem, "new");
    case CPToolbarShowColorsItemIdentifier:
        return objj_msgSend(_CPToolbarShowColorsItem, "new");
    case CPToolbarShowFontsItemIdentifier:
        return nil;
    case CPToolbarCustomizeToolbarItemIdentifier:
        return nil;
    case CPToolbarPrintItemIdentifier:
        return nil;
    }
    return nil;
}
,["CPToolbarItem","CPString"])]);
}