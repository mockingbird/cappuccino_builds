@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;9;CPImage.ji;8;CPView.jt;23923;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPImage.j", YES);objj_executeFile("CPView.j", YES);CPToolbarItemVisibilityPriorityStandard = 0;
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
    return self.isa.objj_msgSend1(self, "initWithItemIdentifier:", "");
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
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("toolTip"))))
        return ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "toolTip"));
    return self._toolTip;
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("setToolTip:"), function $CPToolbarItem__setToolTip_(self, _cmd, aToolTip)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setToolTip:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setToolTip:", aToolTip));
    self._toolTip = aToolTip;
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("tag"), function $CPToolbarItem__tag(self, _cmd)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tag"))))
        return ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tag"));
    return self._tag;
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("setTag:"), function $CPToolbarItem__setTag_(self, _cmd, aTag)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setTag:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTag:", aTag));
    self._tag = aTag;
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("target"), function $CPToolbarItem__target(self, _cmd)
{
    if (self._view)
        return ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("target"))) ? ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "target")) : nil;
    return self._target;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("setTarget:"), function $CPToolbarItem__setTarget_(self, _cmd, aTarget)
{
    if (!self._view)
        self._target = aTarget;
    else if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setTarget:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", aTarget));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("action"), function $CPToolbarItem__action(self, _cmd)
{
    if (self._view)
        return ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("action"))) ? ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "action")) : nil;
    return self._action;
    var ___r1;
}
,["SEL"]), new objj_method(sel_getUid("setAction:"), function $CPToolbarItem__setAction_(self, _cmd, anAction)
{
    if (!self._view)
        self._action = anAction;
    else if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setAction:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", anAction));
    var ___r1;
}
,["void","SEL"]), new objj_method(sel_getUid("isEnabled"), function $CPToolbarItem__isEnabled(self, _cmd)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("isEnabled"))))
        return ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEnabled"));
    return self._isEnabled;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("setEnabled:"), function $CPToolbarItem__setEnabled_(self, _cmd, shouldBeEnabled)
{
    if (self._isEnabled === shouldBeEnabled)
        return;
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setEnabled:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", shouldBeEnabled));
    self._isEnabled = shouldBeEnabled;
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("image"), function $CPToolbarItem__image(self, _cmd)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("image"))))
        return ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "image"));
    return self._image;
    var ___r1;
}
,["CPImage"]), new objj_method(sel_getUid("setImage:"), function $CPToolbarItem__setImage_(self, _cmd, anImage)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setImage:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", anImage));
    self._image = anImage;
    if (!self._image)
        return;
    if (self._minSize.width === 0 && self._minSize.height === 0 && self._maxSize.width === 0 && self._maxSize.height === 0)
    {
        var imageSize = ((___r1 = self._image), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "size"));
        if (imageSize.width > 0 || imageSize.height > 0)
        {
            self.isa.objj_msgSend1(self, "setMinSize:", imageSize);
            self.isa.objj_msgSend1(self, "setMaxSize:", imageSize);
        }
    }
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("setAlternateImage:"), function $CPToolbarItem__setAlternateImage_(self, _cmd, anImage)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setAlternateImage:"))))
        ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlternateImage:", anImage));
    self._alternateImage = anImage;
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPToolbarItem__alternateImage(self, _cmd)
{
    if (((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("alternateIamge"))))
        return ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "alternateImage"));
    return self._alternateImage;
    var ___r1;
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
        if (self._tag !== 0 && ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setTag:"))))
            ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTag:", self._tag));
        self._target = nil;
        self._action = nil;
    }
    var ___r1;
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
    var action = self.isa.objj_msgSend0(self, "action"),
        target = self.isa.objj_msgSend0(self, "target");
    if (self._view)
    {
        if ((target == null ? null : target.isa.objj_msgSend1(target, "respondsToSelector:", sel_getUid("validateToolbarItem:"))))
        {
            var shouldBeEnabled = (target == null ? null : target.isa.objj_msgSend1(target, "validateToolbarItem:", self));
            if (self._isEnabled !== shouldBeEnabled)
                self.isa.objj_msgSend1(self, "setEnabled:", shouldBeEnabled);
        }
        return;
    }
    if (!action)
    {
        if (self._isEnabled)
            return self.isa.objj_msgSend1(self, "setEnabled:", NO);
        return;
    }
    if (target && !(target == null ? null : target.isa.objj_msgSend1(target, "respondsToSelector:", action)))
    {
        if (self._isEnabled)
            return self.isa.objj_msgSend1(self, "setEnabled:", NO);
        return;
    }
    target = (CPApp == null ? null : CPApp.isa.objj_msgSend3(CPApp, "targetForAction:to:from:", action, target, self));
    if (!target)
    {
        if (self._isEnabled)
            return self.isa.objj_msgSend1(self, "setEnabled:", NO);
        return;
    }
    if ((target == null ? null : target.isa.objj_msgSend1(target, "respondsToSelector:", sel_getUid("validateToolbarItem:"))))
    {
        var shouldBeEnabled = (target == null ? null : target.isa.objj_msgSend1(target, "validateToolbarItem:", self));
        if (self._isEnabled !== shouldBeEnabled)
            self.isa.objj_msgSend1(self, "setEnabled:", shouldBeEnabled);
    }
    else
    {
        if (!self._isEnabled)
            self.isa.objj_msgSend1(self, "setEnabled:", YES);
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
        self._itemIdentifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarItemItemIdentifierKey));
        self._minSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", CPToolbarItemMinSizeKey));
        self._maxSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", CPToolbarItemMaxSizeKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setLabel:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarItemLabelKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setPaletteLabel:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarItemPaletteLabelKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setToolTip:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarItemToolTipKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTag:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarItemTagKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTarget:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarItemTargetKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAction:", CPSelectorFromString((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarItemActionKey)))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setEnabled:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPToolbarItemEnabledKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setImage:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarItemImageKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAlternateImage:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarItemAlternateImageKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPToolbarItemViewKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setVisibilityPriority:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPToolbarItemVisibilityPriorityKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutovalidates:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPToolbarItemAutovalidatesKey))));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPToolbarItem__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._itemIdentifier, CPToolbarItemItemIdentifierKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "label"), CPToolbarItemLabelKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "paletteLabel"), CPToolbarItemPaletteLabelKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "toolTip"), CPToolbarItemToolTipKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "tag"), CPToolbarItemTagKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "target"), CPToolbarItemTargetKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "action"), CPToolbarItemActionKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "isEnabled"), CPToolbarItemEnabledKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "image"), CPToolbarItemImageKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "alternateImage"), CPToolbarItemAlternateImageKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "view"), CPToolbarItemViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeSize:forKey:", self.isa.objj_msgSend0(self, "minSize"), CPToolbarItemMinSizeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeSize:forKey:", self.isa.objj_msgSend0(self, "maxSize"), CPToolbarItemMaxSizeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "visibilityPriority"), CPToolbarItemVisibilityPriorityKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self.isa.objj_msgSend0(self, "autovalidates"), CPToolbarItemAutovalidatesKey));
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPToolbarItem__copy(self, _cmd)
{
    var copy = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithItemIdentifier:", self._itemIdentifier));
    if (self._view)
        (copy == null ? null : copy.isa.objj_msgSend1(copy, "setView:", CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", self._view))));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "_setToolbar:", self._toolbar));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setLabel:", self._label));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setPaletteLabel:", self._paletteLabel));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setToolTip:", self.isa.objj_msgSend0(self, "toolTip")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setTag:", self.isa.objj_msgSend0(self, "tag")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setTarget:", self.isa.objj_msgSend0(self, "target")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setAction:", self.isa.objj_msgSend0(self, "action")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setEnabled:", self.isa.objj_msgSend0(self, "isEnabled")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setImage:", self.isa.objj_msgSend0(self, "image")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setAlternateImage:", self.isa.objj_msgSend0(self, "alternateImage")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setMinSize:", self._minSize));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setMaxSize:", self._maxSize));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setVisibilityPriority:", self.isa.objj_msgSend0(self, "visibilityPriority")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setAutovalidates:", self.isa.objj_msgSend0(self, "autovalidates")));
    return copy;
    var ___r1, ___r2;
}
,["id"])]);
}{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("_standardItemWithItemIdentifier:"), function $CPToolbarItem___standardItemWithItemIdentifier_(self, _cmd, anItemIdentifier)
{
    switch(anItemIdentifier) {
    case CPToolbarSeparatorItemIdentifier:
        return (_CPToolbarSeparatorItem == null ? null : _CPToolbarSeparatorItem.isa.objj_msgSend0(_CPToolbarSeparatorItem, "new"));
    case CPToolbarSpaceItemIdentifier:
        return (_CPToolbarSpaceItem == null ? null : _CPToolbarSpaceItem.isa.objj_msgSend0(_CPToolbarSpaceItem, "new"));
    case CPToolbarFlexibleSpaceItemIdentifier:
        return (_CPToolbarFlexibleSpaceItem == null ? null : _CPToolbarFlexibleSpaceItem.isa.objj_msgSend0(_CPToolbarFlexibleSpaceItem, "new"));
    case CPToolbarShowColorsItemIdentifier:
        return (_CPToolbarShowColorsItem == null ? null : _CPToolbarShowColorsItem.isa.objj_msgSend0(_CPToolbarShowColorsItem, "new"));
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