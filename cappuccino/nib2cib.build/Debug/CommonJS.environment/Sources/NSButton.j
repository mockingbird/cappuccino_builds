@STATIC;1.0;I;17;AppKit/CPButton.jI;19;AppKit/CPCheckBox.jI;22;AppKit/CPPopUpButton.jI;16;AppKit/CPRadio.ji;8;NSCell.ji;11;NSControl.jt;19736;objj_executeFile("AppKit/CPButton.j", NO);objj_executeFile("AppKit/CPCheckBox.j", NO);objj_executeFile("AppKit/CPPopUpButton.j", NO);objj_executeFile("AppKit/CPRadio.j", NO);objj_executeFile("NSCell.j", YES);objj_executeFile("NSControl.j", YES);var NSButtonIsBorderedMask = 0x00800000,
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
    var alternateImage = (cell == null ? null : cell.isa.objj_msgSend0(cell, "alternateImage"));
    if ((alternateImage == null ? null : alternateImage.isa.objj_msgSend1(alternateImage, "isKindOfClass:", (NSButtonImageSource == null ? null : NSButtonImageSource.isa.objj_msgSend0(NSButtonImageSource, "class")))))
    {
        if ((alternateImage == null ? null : alternateImage.isa.objj_msgSend0(alternateImage, "imageName")) === "NSSwitch")
        {
            self.isa = CPCheckBox.isa.objj_msgSend0(CPCheckBox, "class");
        }
        else if ((alternateImage == null ? null : alternateImage.isa.objj_msgSend0(alternateImage, "imageName")) === "NSRadioButton")
        {
            self.isa = CPRadio.isa.objj_msgSend0(CPRadio, "class");
            self._radioGroup = CPRadioGroup.isa.objj_msgSend0(CPRadioGroup, "new");
        }
        self._themeClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultThemeClass"));
        alternateImage = nil;
    }
    NIB_CONNECTION_EQUIVALENCY_TABLE[(cell == null ? null : cell.isa.objj_msgSend0(cell, "UID"))] = self;
    self._title = (cell == null ? null : cell.isa.objj_msgSend0(cell, "title"));
    self._alternateTitle = (cell == null ? null : cell.isa.objj_msgSend0(cell, "alternateTitle"));
    self.isa.objj_msgSend1(self, "setBordered:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isBordered")));
    self._bezelStyle = (cell == null ? null : cell.isa.objj_msgSend0(cell, "bezelStyle"));
    var fixedHeight;
    switch(self._bezelStyle) {
    case CPRoundedBezelStyle:
    case CPTexturedRoundedBezelStyle:
    case CPHUDBezelStyle:
    case CPRoundRectBezelStyle:
    case CPRecessedBezelStyle:
        fixedHeight = YES;
        break;
    case CPSmallSquareBezelStyle:
    case CPThickSquareBezelStyle:
    case CPThickerSquareBezelStyle:
    case CPRegularSquareBezelStyle:
    case CPTexturedSquareBezelStyle:
    case CPShadowlessSquareBezelStyle:
        fixedHeight = NO;
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
    if ((cell == null ? null : cell.isa.objj_msgSend0(cell, "isBordered")) || self.isa.objj_msgSend1(self, "isKindOfClass:", CPRadio.isa.objj_msgSend0(CPRadio, "class")) || self.isa.objj_msgSend1(self, "isKindOfClass:", CPCheckBox.isa.objj_msgSend0(CPCheckBox, "class")))
    {
        var theme = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "defaultTheme")),
            minSize = (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "min-size", self.isa.objj_msgSend0(self, "class"))),
            maxSize = (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "max-size", self.isa.objj_msgSend0(self, "class"))),
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
    }
    self._keyEquivalent = (cell == null ? null : cell.isa.objj_msgSend0(cell, "keyEquivalent"));
    self._keyEquivalentModifierMask = (cell == null ? null : cell.isa.objj_msgSend0(cell, "keyEquivalentModifierMask"));
    self._imageDimsWhenDisabled = YES;
    self._allowsMixedState = (cell == null ? null : cell.isa.objj_msgSend0(cell, "allowsMixedState"));
    self.isa.objj_msgSend1(self, "setImage:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "normalImage")));
    self.isa.objj_msgSend1(self, "setAlternateImage:", alternateImage);
    self.isa.objj_msgSend1(self, "setImagePosition:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "imagePosition")));
    self.isa.objj_msgSend1(self, "setEnabled:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isEnabled")));
    self._highlightsBy = (cell == null ? null : cell.isa.objj_msgSend0(cell, "highlightsBy"));
    self._showsStateBy = (cell == null ? null : cell.isa.objj_msgSend0(cell, "showsStateBy"));
    var ___r1;
}
,["void","NSCell"]), new objj_method(sel_getUid("_nib2CibAdjustment"), function $CPButton___nib2CibAdjustment(self, _cmd)
{
    var frameAdjustment = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "_nib2CibAdjustment"),
        positionOffsetSizeWidth = 0,
        positionOffsetOriginX = 0,
        positionOffsetOriginY = 0;
    if (!self.isa.objj_msgSend0(self, "isBordered") || self.isa.objj_msgSend1(self, "isKindOfClass:", CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "class")))
        return frameAdjustment;
    switch(self._bezelStyle) {
    case CPRoundedBezelStyle:
        switch(self.isa.objj_msgSend0(self, "controlSize")) {
        case CPMiniControlSize:
            positionOffsetOriginX = 1;
            positionOffsetOriginY = -5;
            positionOffsetSizeWidth = -2;
            break;
        case CPSmallControlSize:
            positionOffsetOriginX = 8;
            positionOffsetOriginY = -5;
            positionOffsetSizeWidth = -10;
            break;
default:
        case CPRegularControlSize:
            positionOffsetOriginX = 4;
            positionOffsetOriginY = -6;
            positionOffsetSizeWidth = -12;
            break;
        }
        break;
    case CPTexturedRoundedBezelStyle:
        switch(self.isa.objj_msgSend0(self, "controlSize")) {
        case CPMiniControlSize:
            positionOffsetOriginX = 0;
            positionOffsetOriginY = -5;
            positionOffsetSizeWidth = 0;
            break;
        case CPSmallControlSize:
            positionOffsetOriginX = 3;
            positionOffsetOriginY = 0;
            positionOffsetSizeWidth = 0;
            break;
default:
        case CPRegularControlSize:
            positionOffsetOriginX = -2;
            positionOffsetOriginY = -2;
            positionOffsetSizeWidth = 0;
            break;
        }
        break;
    case CPRoundRectBezelStyle:
        switch(self.isa.objj_msgSend0(self, "controlSize")) {
        case CPMiniControlSize:
            positionOffsetOriginX = 0;
            positionOffsetOriginY = -5;
            positionOffsetSizeWidth = 0;
            break;
        case CPSmallControlSize:
            positionOffsetOriginX = 3;
            positionOffsetOriginY = 2;
            positionOffsetSizeWidth = 0;
            break;
default:
        case CPRegularControlSize:
            positionOffsetOriginX = -2;
            positionOffsetOriginY = 3;
            positionOffsetSizeWidth = 0;
            break;
        }
        self._bezelStyle = CPRoundedBezelStyle;
        break;
    case CPSmallSquareBezelStyle:
        positionOffsetOriginX = -2;
        positionOffsetSizeWidth = 0;
        self._bezelStyle = CPTexturedRoundedBezelStyle;
        break;
    case CPThickSquareBezelStyle:
    case CPThickerSquareBezelStyle:
    case CPRegularSquareBezelStyle:
        positionOffsetOriginY = -3;
        positionOffsetOriginX = 0;
        positionOffsetSizeWidth = -4;
        self._bezelStyle = CPTexturedRoundedBezelStyle;
        break;
    case CPTexturedSquareBezelStyle:
        switch(self.isa.objj_msgSend0(self, "controlSize")) {
        case CPMiniControlSize:
            positionOffsetOriginX = 0;
            positionOffsetOriginY = -5;
            positionOffsetSizeWidth = 0;
            break;
        case CPSmallControlSize:
            positionOffsetOriginX = 3;
            positionOffsetOriginY = 0;
            positionOffsetSizeWidth = 0;
            break;
default:
        case CPRegularControlSize:
            positionOffsetOriginX = -1;
            positionOffsetOriginY = -4;
            positionOffsetSizeWidth = -2;
            break;
        }
        self._bezelStyle = CPTexturedRoundedBezelStyle;
        break;
    case CPShadowlessSquareBezelStyle:
        positionOffsetOriginY = -5;
        positionOffsetOriginX = -2;
        positionOffsetSizeWidth = 0;
        self._bezelStyle = CPTexturedRoundedBezelStyle;
        break;
    case CPRecessedBezelStyle:
        switch(self.isa.objj_msgSend0(self, "controlSize")) {
        case CPMiniControlSize:
            positionOffsetOriginX = 0;
            positionOffsetOriginY = -5;
            positionOffsetSizeWidth = 0;
            break;
        case CPSmallControlSize:
            positionOffsetOriginX = 3;
            positionOffsetOriginY = 2;
            positionOffsetSizeWidth = 0;
            break;
default:
        case CPRegularControlSize:
            positionOffsetOriginX = -2;
            positionOffsetOriginY = 3;
            positionOffsetSizeWidth = 0;
            break;
        }
        self._bezelStyle = CPHUDBezelStyle;
        break;
    }
    return CGRectMake(frameAdjustment.origin.x + positionOffsetOriginX, frameAdjustment.origin.y + positionOffsetOriginY, frameAdjustment.size.width + positionOffsetSizeWidth, frameAdjustment.size.height);
}
,["CGRect"])]);
}{var the_class = objj_allocateClassPair(CPButton, "NSButton"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSButton__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
        (self == null ? null : self.isa.objj_msgSend0(self, "_adjustNib2CibSize"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSButton__classForKeyedArchiver(self, _cmd)
{
    return CPButton.isa.objj_msgSend0(CPButton, "class");
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
        var buttonFlags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSButtonFlags")),
            buttonFlags2 = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSButtonFlags2")),
            cellFlags2 = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSCellFlags2")),
            position = (buttonFlags & NSButtonImagePositionMask) >> NSButtonImagePositionShift;
        self._isBordered = buttonFlags & NSButtonIsBorderedMask ? YES : NO;
        self._bezelStyle = buttonFlags2 & 0x7 | (buttonFlags2 & 0x20) >> 2;
        self._title = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSContents"));
        self._alternateTitle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSAlternateContents"));
        self._objectValue = (self == null ? null : self.isa.objj_msgSend0(self, "state"));
        self._normalImage = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSNormalImage"));
        self._alternateImage = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSAlternateImage"));
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
        self._keyEquivalent = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSKeyEquivalent"));
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
        self._imageName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSImageName"));
    return self;
}
,["id","CPCoder"])]);
}