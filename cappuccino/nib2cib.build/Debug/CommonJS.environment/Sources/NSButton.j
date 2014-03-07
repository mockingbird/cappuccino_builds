@STATIC;1.0;I;17;AppKit/CPButton.jI;19;AppKit/CPCheckBox.jI;16;AppKit/CPRadio.ji;8;NSCell.ji;11;NSControl.jt;15055;objj_executeFile("AppKit/CPButton.j", NO);objj_executeFile("AppKit/CPCheckBox.j", NO);objj_executeFile("AppKit/CPRadio.j", NO);objj_executeFile("NSCell.j", YES);objj_executeFile("NSControl.j", YES);var NSButtonIsBorderedMask = 0x00800000,
    NSButtonAllowsMixedStateMask = 0x1000000,
    NSButtonImagePositionMask = 0xFF0000,
    NSButtonImagePositionShift = 16,
    NSButtonNoImagePositionMask = 0x04,
    NSButtonImageAbovePositionMask = 0x0C,
    NSButtonImageBelowPositionMask = 0x1C,
    NSButtonImageRightPositionMask = 0x2C,
    NSButtonImageLeftPositionMask = 0x3C,
    NSButtonImageOnlyPositionMask = 0x44,
    NSButtonImageOverlapsPositionMask = 0x6C,
    NSHighlightsByPushInCellMask = 0x80000000,
    NSHighlightsByContentsCellMask = 0x08000000,
    NSHighlightsByChangeGrayCellMask = 0x04000000,
    NSHighlightsByChangeBackgroundCellMask = 0x02000000,
    NSShowsStateByContentsCellMask = 0x40000000,
    NSShowsStateByChangeGrayCellMask = 0x20000000,
    NSShowsStateByChangeBackgroundCellMask = 0x10000000;
{
var the_class = objj_getClass("CPButton")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPButton__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPButton__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "NS_initWithCell:", cell);
    var alternateImage = objj_msgSend(cell, "alternateImage"),
        positionOffsetSizeWidth = 0,
        positionOffsetOriginX = 0,
        positionOffsetOriginY = 0;
    if (objj_msgSend(alternateImage, "isKindOfClass:", objj_msgSend(NSButtonImageSource, "class")))
    {
        if (objj_msgSend(alternateImage, "imageName") === "NSSwitch")
        {
            self.isa = objj_msgSend(CPCheckBox, "class");
        }
        else if (objj_msgSend(alternateImage, "imageName") === "NSRadioButton")
        {
            self.isa = objj_msgSend(CPRadio, "class");
            self._radioGroup = objj_msgSend(CPRadioGroup, "new");
        }
        self._themeClass = objj_msgSend(objj_msgSend(self, "class"), "defaultThemeClass");
        alternateImage = nil;
    }
    NIB_CONNECTION_EQUIVALENCY_TABLE[objj_msgSend(cell, "UID")] = self;
    self._title = objj_msgSend(cell, "title");
    self._alternateTitle = objj_msgSend(cell, "alternateTitle");
    self._controlSize = CPRegularControlSize;
    objj_msgSend(self, "setBordered:", objj_msgSend(cell, "isBordered"));
    self._bezelStyle = objj_msgSend(cell, "bezelStyle");
    var fixedHeight;
    switch(self._bezelStyle) {
    case CPRoundedBezelStyle:
        positionOffsetOriginY = 6;
        positionOffsetOriginX = 6;
        positionOffsetSizeWidth = -12;
        fixedHeight = YES;
        break;
    case CPTexturedRoundedBezelStyle:
        positionOffsetOriginY = 2;
        positionOffsetOriginX = -2;
        positionOffsetSizeWidth = 0;
        fixedHeight = YES;
        break;
    case CPHUDBezelStyle:
        fixedHeight = YES;
        break;
    case CPRoundRectBezelStyle:
        positionOffsetOriginY = -3;
        positionOffsetOriginX = -2;
        positionOffsetSizeWidth = 0;
        self._bezelStyle = CPRoundedBezelStyle;
        fixedHeight = YES;
        break;
    case CPSmallSquareBezelStyle:
        positionOffsetOriginX = -2;
        positionOffsetSizeWidth = 0;
        self._bezelStyle = CPTexturedRoundedBezelStyle;
        fixedHeight = NO;
        break;
    case CPThickSquareBezelStyle:
    case CPThickerSquareBezelStyle:
    case CPRegularSquareBezelStyle:
        positionOffsetOriginY = 3;
        positionOffsetOriginX = 0;
        positionOffsetSizeWidth = -4;
        self._bezelStyle = CPTexturedRoundedBezelStyle;
        fixedHeight = NO;
        break;
    case CPTexturedSquareBezelStyle:
        positionOffsetOriginY = 4;
        positionOffsetOriginX = -1;
        positionOffsetSizeWidth = -2;
        self._bezelStyle = CPTexturedRoundedBezelStyle;
        fixedHeight = NO;
        break;
    case CPShadowlessSquareBezelStyle:
        positionOffsetOriginY = 5;
        positionOffsetOriginX = -2;
        positionOffsetSizeWidth = 0;
        self._bezelStyle = CPTexturedRoundedBezelStyle;
        fixedHeight = NO;
        break;
    case CPRecessedBezelStyle:
        positionOffsetOriginY = -3;
        positionOffsetOriginX = -2;
        positionOffsetSizeWidth = 0;
        self._bezelStyle = CPHUDBezelStyle;
        fixedHeight = YES;
        break;
    case CPRoundedDisclosureBezelStyle:
    case CPHelpButtonBezelStyle:
    case CPCircularBezelStyle:
    case CPDisclosureBezelStyle:
        CPLog.warn("NSButton [%s]: unsupported bezel style: %d", self._title == null ? "<no title>" : '"' + self._title + '"', self._bezelStyle);
        self._bezelStyle = CPHUDBezelStyle;
        fixedHeight = YES;
        break;
default:
        CPLog.warn("NSButton [%s]: unknown bezel style: %d", self._title == null ? "<no title>" : '"' + self._title + '"', self._bezelStyle);
        self._bezelStyle = CPHUDBezelStyle;
        fixedHeight = YES;
    }
    if (objj_msgSend(cell, "isBordered") || objj_msgSend(self, "isKindOfClass:", objj_msgSend(CPRadio, "class")) || objj_msgSend(self, "isKindOfClass:", objj_msgSend(CPCheckBox, "class")))
    {
        var theme = objj_msgSend(Nib2Cib, "defaultTheme"),
            minSize = objj_msgSend(theme, "valueForAttributeWithName:forClass:", "min-size", objj_msgSend(self, "class")),
            maxSize = objj_msgSend(theme, "valueForAttributeWithName:forClass:", "max-size", objj_msgSend(self, "class")),
            adjustHeight = NO;
        if (minSize.height > 0 && maxSize.height > 0 && minSize.height === maxSize.height)
        {
            adjustHeight = YES;
            fixedHeight = minSize.height === maxSize.height;
        }
        else if (minSize.height < 0 && maxSize.height > 0)
            adjustHeight = fixedHeight;
        else
            adjustHeight = minSize.height > 0 || maxSize.height > 0;
        if (adjustHeight)
        {
            var oldHeight = self._frame.size.height;
            if (minSize.height > 0)
                self._frame.size.height = self._bounds.size.height = MAX(self._frame.size.height, minSize.height);
            if (maxSize.height > 0)
                self._frame.size.height = self._bounds.size.height = MIN(self._frame.size.height, maxSize.height);
            if (self._frame.size.height !== oldHeight)
                CPLog.debug("NSButton [%s]: adjusted height from %d to %d", self._title == null ? "<no title>" : '"' + self._title + '"', oldHeight, self._frame.size.height);
        }
        if (objj_msgSend(cell, "isBordered"))
        {
            self._frame.origin.x += positionOffsetOriginX;
            self._frame.origin.y += positionOffsetOriginY;
            self._frame.size.width += positionOffsetSizeWidth;
            self._bounds.size.width += positionOffsetSizeWidth;
        }
    }
    self._keyEquivalent = objj_msgSend(cell, "keyEquivalent");
    self._keyEquivalentModifierMask = objj_msgSend(cell, "keyEquivalentModifierMask");
    self._imageDimsWhenDisabled = YES;
    self._allowsMixedState = objj_msgSend(cell, "allowsMixedState");
    objj_msgSend(self, "setImage:", objj_msgSend(cell, "normalImage"));
    objj_msgSend(self, "setAlternateImage:", alternateImage);
    objj_msgSend(self, "setImagePosition:", objj_msgSend(cell, "imagePosition"));
    objj_msgSend(self, "setEnabled:", objj_msgSend(cell, "isEnabled"));
    self._highlightsBy = objj_msgSend(cell, "highlightsBy");
    self._showsStateBy = objj_msgSend(cell, "showsStateBy");
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPButton, "NSButton"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSButton__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSButton__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPButton, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSActionCell, "NSButtonCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isBordered"), new objj_ivar("_bezelStyle"), new objj_ivar("_title"), new objj_ivar("_alternateTitle"), new objj_ivar("_normalImage"), new objj_ivar("_alternateImage"), new objj_ivar("_allowsMixedState"), new objj_ivar("_imagePosition"), new objj_ivar("_highlightsBy"), new objj_ivar("_showsStateBy"), new objj_ivar("_keyEquivalent"), new objj_ivar("_keyEquivalentModifierMask")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isBordered"), function $NSButtonCell__isBordered(self, _cmd)
{
    return self._isBordered;
}
,["BOOL"]), new objj_method(sel_getUid("bezelStyle"), function $NSButtonCell__bezelStyle(self, _cmd)
{
    return self._bezelStyle;
}
,["int"]), new objj_method(sel_getUid("title"), function $NSButtonCell__title(self, _cmd)
{
    return self._title;
}
,["CPString"]), new objj_method(sel_getUid("alternateTitle"), function $NSButtonCell__alternateTitle(self, _cmd)
{
    return self._alternateTitle;
}
,["CPString"]), new objj_method(sel_getUid("normalImage"), function $NSButtonCell__normalImage(self, _cmd)
{
    return self._normalImage;
}
,["CPImage"]), new objj_method(sel_getUid("alternateImage"), function $NSButtonCell__alternateImage(self, _cmd)
{
    return self._alternateImage;
}
,["CPImage"]), new objj_method(sel_getUid("allowsMixedState"), function $NSButtonCell__allowsMixedState(self, _cmd)
{
    return self._allowsMixedState;
}
,["BOOL"]), new objj_method(sel_getUid("imagePosition"), function $NSButtonCell__imagePosition(self, _cmd)
{
    return self._imagePosition;
}
,["BOOL"]), new objj_method(sel_getUid("highlightsBy"), function $NSButtonCell__highlightsBy(self, _cmd)
{
    return self._highlightsBy;
}
,["int"]), new objj_method(sel_getUid("showsStateBy"), function $NSButtonCell__showsStateBy(self, _cmd)
{
    return self._showsStateBy;
}
,["int"]), new objj_method(sel_getUid("keyEquivalent"), function $NSButtonCell__keyEquivalent(self, _cmd)
{
    return self._keyEquivalent;
}
,["CPString"]), new objj_method(sel_getUid("keyEquivalentModifierMask"), function $NSButtonCell__keyEquivalentModifierMask(self, _cmd)
{
    return self._keyEquivalentModifierMask;
}
,["unsigned"]), new objj_method(sel_getUid("initWithCoder:"), function $NSButtonCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSButtonCell").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        var buttonFlags = objj_msgSend(aCoder, "decodeIntForKey:", "NSButtonFlags"),
            buttonFlags2 = objj_msgSend(aCoder, "decodeIntForKey:", "NSButtonFlags2"),
            cellFlags2 = objj_msgSend(aCoder, "decodeIntForKey:", "NSCellFlags2"),
            position = (buttonFlags & NSButtonImagePositionMask) >> NSButtonImagePositionShift;
        self._isBordered = buttonFlags & NSButtonIsBorderedMask ? YES : NO;
        self._bezelStyle = buttonFlags2 & 0x7 | (buttonFlags2 & 0x20) >> 2;
        self._title = objj_msgSend(aCoder, "decodeObjectForKey:", "NSContents");
        self._alternateTitle = objj_msgSend(aCoder, "decodeObjectForKey:", "NSAlternateContents");
        self._objectValue = objj_msgSend(self, "state");
        self._normalImage = objj_msgSend(aCoder, "decodeObjectForKey:", "NSNormalImage");
        self._alternateImage = objj_msgSend(aCoder, "decodeObjectForKey:", "NSAlternateImage");
        self._allowsMixedState = cellFlags2 & NSButtonAllowsMixedStateMask ? YES : NO;
        if ((position & NSButtonImageOverlapsPositionMask) == NSButtonImageOverlapsPositionMask)
            self._imagePosition = CPImageOverlaps;
        else if ((position & NSButtonImageOnlyPositionMask) == NSButtonImageOnlyPositionMask)
            self._imagePosition = CPImageOnly;
        else if ((position & NSButtonImageLeftPositionMask) == NSButtonImageLeftPositionMask)
            self._imagePosition = CPImageLeft;
        else if ((position & NSButtonImageRightPositionMask) == NSButtonImageRightPositionMask)
            self._imagePosition = CPImageRight;
        else if ((position & NSButtonImageBelowPositionMask) == NSButtonImageBelowPositionMask)
            self._imagePosition = CPImageBelow;
        else if ((position & NSButtonImageAbovePositionMask) == NSButtonImageAbovePositionMask)
            self._imagePosition = CPImageAbove;
        else if ((position & NSButtonNoImagePositionMask) == NSButtonNoImagePositionMask)
            self._imagePosition = CPNoImage;
        self._highlightsBy = CPNoCellMask;
        if (buttonFlags & NSHighlightsByPushInCellMask)
            self._highlightsBy |= CPPushInCellMask;
        if (buttonFlags & NSHighlightsByContentsCellMask)
            self._highlightsBy |= CPContentsCellMask;
        if (buttonFlags & NSHighlightsByChangeGrayCellMask)
            self._highlightsBy |= CPChangeGrayCellMask;
        if (buttonFlags & NSHighlightsByChangeBackgroundCellMask)
            self._highlightsBy |= CPChangeBackgroundCellMask;
        self._showsStateBy = CPNoCellMask;
        if (buttonFlags & NSShowsStateByContentsCellMask)
            self._showsStateBy |= CPContentsCellMask;
        if (buttonFlags & NSShowsStateByChangeGrayCellMask)
            self._showsStateBy |= CPChangeGrayCellMask;
        if (buttonFlags & NSShowsStateByChangeBackgroundCellMask)
            self._showsStateBy |= CPChangeBackgroundCellMask;
        self._keyEquivalent = objj_msgSend(aCoder, "decodeObjectForKey:", "NSKeyEquivalent");
        self._keyEquivalentModifierMask = buttonFlags2 >> 8;
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPObject, "NSButtonImageSource"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_imageName")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("imageName"), function $NSButtonImageSource__imageName(self, _cmd)
{
    return self._imageName;
}
,["CPString"]), new objj_method(sel_getUid("initWithCoder:"), function $NSButtonImageSource__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSButtonImageSource").super_class }, "init");
    if (self)
        self._imageName = objj_msgSend(aCoder, "decodeObjectForKey:", "NSImageName");
    return self;
}
,["id","CPCoder"])]);
}