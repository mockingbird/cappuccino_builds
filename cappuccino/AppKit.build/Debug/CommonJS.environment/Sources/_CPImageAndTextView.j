@STATIC;1.0;I;21;Foundation/CPString.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;8;CPView.ji;11;CPControl.ji;12;CPPlatform.jt;14789;objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPColor.j", YES);objj_executeFile("CPFont.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPControl.j", YES);objj_executeFile("CPPlatform.j", YES);var _CPimageAndTextViewFrameSizeChangedFlag = 1 << 0,
    _CPImageAndTextViewImageChangedFlag = 1 << 1,
    _CPImageAndTextViewTextChangedFlag = 1 << 2,
    _CPImageAndTextViewAlignmentChangedFlag = 1 << 3,
    _CPImageAndTextViewVerticalAlignmentChangedFlag = 1 << 4,
    _CPImageAndTextViewLineBreakModeChangedFlag = 1 << 5,
    _CPImageAndTextViewTextColorChangedFlag = 1 << 6,
    _CPImageAndTextViewFontChangedFlag = 1 << 7,
    _CPImageAndTextViewTextShadowColorChangedFlag = 1 << 8,
    _CPImageAndTextViewImagePositionChangedFlag = 1 << 9,
    _CPImageAndTextViewImageScalingChangedFlag = 1 << 10,
    _CPImageAndTextViewTextUnderlineChangedFlag = 1 << 11;
{var the_class = objj_allocateClassPair(CPView, "_CPImageAndTextView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_alignment"), new objj_ivar("_verticalAlignment"), new objj_ivar("_lineBreakMode"), new objj_ivar("_textColor"), new objj_ivar("_font"), new objj_ivar("_textUnderline"), new objj_ivar("_textShadowColor"), new objj_ivar("_textShadowOffset"), new objj_ivar("_imagePosition"), new objj_ivar("_imageScaling"), new objj_ivar("_imageOffset"), new objj_ivar("_shouldDimImage"), new objj_ivar("_image"), new objj_ivar("_text"), new objj_ivar("_textSize"), new objj_ivar("_flags")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:control:"), function $_CPImageAndTextView__initWithFrame_control_(self, _cmd, aFrame, aControl)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPImageAndTextView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._textShadowOffset = CGSizeMakeZero();
        (self == null ? null : self.isa.objj_msgSend1(self, "setVerticalAlignment:", CPTopVerticalTextAlignment));
        if (aControl)
        {
            (self == null ? null : self.isa.objj_msgSend1(self, "setLineBreakMode:", (aControl == null ? null : aControl.isa.objj_msgSend0(aControl, "lineBreakMode"))));
            (self == null ? null : self.isa.objj_msgSend1(self, "setTextColor:", (aControl == null ? null : aControl.isa.objj_msgSend0(aControl, "textColor"))));
            (self == null ? null : self.isa.objj_msgSend1(self, "setAlignment:", (aControl == null ? null : aControl.isa.objj_msgSend0(aControl, "alignment"))));
            (self == null ? null : self.isa.objj_msgSend1(self, "setVerticalAlignment:", (aControl == null ? null : aControl.isa.objj_msgSend0(aControl, "verticalAlignment"))));
            (self == null ? null : self.isa.objj_msgSend1(self, "setFont:", (aControl == null ? null : aControl.isa.objj_msgSend0(aControl, "font"))));
            (self == null ? null : self.isa.objj_msgSend1(self, "setImagePosition:", (aControl == null ? null : aControl.isa.objj_msgSend0(aControl, "imagePosition"))));
            (self == null ? null : self.isa.objj_msgSend1(self, "setImageScaling:", (aControl == null ? null : aControl.isa.objj_msgSend0(aControl, "imageScaling"))));
            (self == null ? null : self.isa.objj_msgSend1(self, "setImageOffset:", (aControl == null ? null : aControl.isa.objj_msgSend0(aControl, "imageOffset"))));
        }
        else
        {
            (self == null ? null : self.isa.objj_msgSend1(self, "setLineBreakMode:", CPLineBreakByClipping));
            (self == null ? null : self.isa.objj_msgSend1(self, "setAlignment:", CPCenterTextAlignment));
            (self == null ? null : self.isa.objj_msgSend1(self, "setFont:", CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", CPFontCurrentSystemSize)));
            (self == null ? null : self.isa.objj_msgSend1(self, "setImagePosition:", CPNoImage));
            (self == null ? null : self.isa.objj_msgSend1(self, "setImageScaling:", CPImageScaleNone));
        }
        self._textSize = nil;
        (self == null ? null : self.isa.objj_msgSend1(self, "setHitTests:", NO));
    }
    return self;
}
,["id","CGRect","CPControl"]), new objj_method(sel_getUid("initWithFrame:"), function $_CPImageAndTextView__initWithFrame_(self, _cmd, aFrame)
{
    return self.isa.objj_msgSend2(self, "initWithFrame:control:", aFrame, nil);
}
,["id","CGRect"]), new objj_method(sel_getUid("setAlignment:"), function $_CPImageAndTextView__setAlignment_(self, _cmd, anAlignment)
{
    if (self._alignment === anAlignment)
        return;
    self._alignment = anAlignment;
}
,["void","CPTextAlignment"]), new objj_method(sel_getUid("alignment"), function $_CPImageAndTextView__alignment(self, _cmd)
{
    return self._alignment;
}
,["CPTextAlignment"]), new objj_method(sel_getUid("setVerticalAlignment:"), function $_CPImageAndTextView__setVerticalAlignment_(self, _cmd, anAlignment)
{
    if (self._verticalAlignment === anAlignment)
        return;
    self._verticalAlignment = anAlignment;
    self._flags |= _CPImageAndTextViewVerticalAlignmentChangedFlag;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPVerticalTextAlignment"]), new objj_method(sel_getUid("verticalAlignment"), function $_CPImageAndTextView__verticalAlignment(self, _cmd)
{
    return self._verticalAlignment;
}
,["unsigned"]), new objj_method(sel_getUid("setLineBreakMode:"), function $_CPImageAndTextView__setLineBreakMode_(self, _cmd, aLineBreakMode)
{
    if (self._lineBreakMode === aLineBreakMode)
        return;
    self._lineBreakMode = aLineBreakMode;
    self._flags |= _CPImageAndTextViewLineBreakModeChangedFlag;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPLineBreakMode"]), new objj_method(sel_getUid("lineBreakMode"), function $_CPImageAndTextView__lineBreakMode(self, _cmd)
{
    return self._lineBreakMode;
}
,["CPLineBreakMode"]), new objj_method(sel_getUid("setImagePosition:"), function $_CPImageAndTextView__setImagePosition_(self, _cmd, anImagePosition)
{
    if (self._imagePosition == anImagePosition)
        return;
    if (self._imagePosition == CPNoImage)
        self._flags |= _CPImageAndTextViewImageChangedFlag;
    self._imagePosition = anImagePosition;
    self._flags |= _CPImageAndTextViewImagePositionChangedFlag;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPCellImagePosition"]), new objj_method(sel_getUid("imagePosition"), function $_CPImageAndTextView__imagePosition(self, _cmd)
{
    return self._imagePosition;
}
,["CPCellImagePosition"]), new objj_method(sel_getUid("setImageScaling:"), function $_CPImageAndTextView__setImageScaling_(self, _cmd, anImageScaling)
{
    if (self._imageScaling == anImageScaling)
        return;
    self._imageScaling = anImageScaling;
    self._flags |= _CPImageAndTextViewImageScalingChangedFlag;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPImageScaling"]), new objj_method(sel_getUid("imageScaling"), function $_CPImageAndTextView__imageScaling(self, _cmd)
{
    return self._imageScaling;
}
,["CPUInteger"]), new objj_method(sel_getUid("setDimsImage:"), function $_CPImageAndTextView__setDimsImage_(self, _cmd, shouldDimImage)
{
    shouldDimImage = !!shouldDimImage;
    if (self._shouldDimImage !== shouldDimImage)
    {
        self._shouldDimImage = shouldDimImage;
        self.isa.objj_msgSend0(self, "setNeedsLayout");
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("setTextColor:"), function $_CPImageAndTextView__setTextColor_(self, _cmd, aTextColor)
{
    if (self._textColor === aTextColor)
        return;
    self._textColor = aTextColor;
}
,["void","CPColor"]), new objj_method(sel_getUid("textColor"), function $_CPImageAndTextView__textColor(self, _cmd)
{
    return self._textColor;
}
,["CPColor"]), new objj_method(sel_getUid("setFont:"), function $_CPImageAndTextView__setFont_(self, _cmd, aFont)
{
    if (((___r1 = self._font), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", aFont)))
        return;
    self._font = aFont;
    self._flags |= _CPImageAndTextViewFontChangedFlag;
    self._textSize = nil;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","CPFont"]), new objj_method(sel_getUid("font"), function $_CPImageAndTextView__font(self, _cmd)
{
    return self._font;
}
,["CPFont"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPImageAndTextView__setTextShadowColor_(self, _cmd, aColor)
{
    if (self._textShadowColor === aColor)
        return;
    self._textShadowColor = aColor;
    self._flags |= _CPImageAndTextViewTextShadowColorChangedFlag;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPImageAndTextView__textShadowColor(self, _cmd)
{
    return self._textShadowColor;
}
,["CPColor"]), new objj_method(sel_getUid("setTextShadowOffset:"), function $_CPImageAndTextView__setTextShadowOffset_(self, _cmd, anOffset)
{
    if (CGSizeEqualToSize(self._textShadowOffset, anOffset))
        return;
    self._textShadowOffset = CGSizeMakeCopy(anOffset);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CGSize"]), new objj_method(sel_getUid("textShadowOffset"), function $_CPImageAndTextView__textShadowOffset(self, _cmd)
{
    return self._textShadowOffset;
}
,["CGSize"]), new objj_method(sel_getUid("setTextUnderline:"), function $_CPImageAndTextView__setTextUnderline_(self, _cmd, aFlag)
{
    if (self._textUnderline === aFlag)
        return;
    self._textUnderline = aFlag;
    self._flags |= _CPImageAndTextViewTextUnderlineChangedFlag;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("textUnderline"), function $_CPImageAndTextView__textUnderline(self, _cmd)
{
    return self._textUnderline;
}
,["BOOL"]), new objj_method(sel_getUid("textFrame"), function $_CPImageAndTextView__textFrame(self, _cmd)
{
    self.isa.objj_msgSend0(self, "layoutIfNeeded");
    var textFrame = CGRectMakeZero();
    return textFrame;
}
,["CGRect"]), new objj_method(sel_getUid("setImage:"), function $_CPImageAndTextView__setImage_(self, _cmd, anImage)
{
    if (self._image == anImage)
        return;
    self._image = anImage;
    self._flags |= _CPImageAndTextViewImageChangedFlag;
    if (((___r1 = self._image), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "loadStatus")) !== CPImageLoadStatusCompleted)
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, self._image));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("setImageOffset:"), function $_CPImageAndTextView__setImageOffset_(self, _cmd, theImageOffset)
{
    if (self._imageOffset === theImageOffset)
        return;
    self._imageOffset = theImageOffset;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","float"]), new objj_method(sel_getUid("imageOffset"), function $_CPImageAndTextView__imageOffset(self, _cmd)
{
    return self._imageOffset;
}
,["float"]), new objj_method(sel_getUid("imageDidLoad:"), function $_CPImageAndTextView__imageDidLoad_(self, _cmd, aNotification)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, CPImageDidLoadNotification, self._image));
    self._flags |= _CPImageAndTextViewImageChangedFlag;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("image"), function $_CPImageAndTextView__image(self, _cmd)
{
    return self._image;
}
,["CPImage"]), new objj_method(sel_getUid("setText:"), function $_CPImageAndTextView__setText_(self, _cmd, text)
{
    if (self._text === text)
        return;
    self._text = text;
    self._flags |= _CPImageAndTextViewTextChangedFlag;
    self._textSize = nil;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPString"]), new objj_method(sel_getUid("text"), function $_CPImageAndTextView__text(self, _cmd)
{
    return self._text;
}
,["CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPImageAndTextView__layoutSubviews(self, _cmd)
{
    self._flags = 0;
}
,["void"]), new objj_method(sel_getUid("sizeToFit"), function $_CPImageAndTextView__sizeToFit(self, _cmd)
{
    var size = CGSizeMakeZero();
    if (self._imagePosition !== CPNoImage && self._image)
    {
        var imageSize = ((___r1 = self._image), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "size"));
        size.width += imageSize.width;
        size.height += imageSize.height;
    }
    if (self._imagePosition !== CPImageOnly && ((___r1 = self._text), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length")) > 0)
    {
        if (!self._textSize)
        {
            self._textSize = ((___r1 = self._text), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sizeWithFont:", self._font || CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", 0)));
            self._textSize.width += 1;
            self._textSize.height += 1;
        }
        if (!self._image || self._imagePosition === CPImageOverlaps)
        {
            size.width = MAX(size.width, self._textSize.width);
            size.height = MAX(size.height, self._textSize.height);
        }
        else if (self._imagePosition === CPImageLeft || self._imagePosition === CPImageRight)
        {
            size.width += self._textSize.width + self._imageOffset;
            size.height = MAX(size.height, self._textSize.height);
        }
        else if (self._imagePosition === CPImageAbove || self._imagePosition === CPImageBelow)
        {
            size.width = MAX(size.width, self._textSize.width);
            size.height += self._textSize.height + self._imageOffset;
        }
    }
    self.isa.objj_msgSend1(self, "setFrameSize:", size);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setFrameSize:"), function $_CPImageAndTextView__setFrameSize_(self, _cmd, aSize)
{
    if ((self._lineBreakMode === CPLineBreakByCharWrapping || self._lineBreakMode === CPLineBreakByWordWrapping) && aSize.width !== self.isa.objj_msgSend0(self, "frameSize").width)
        self._textSize = nil;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPImageAndTextView").super_class }, "setFrameSize:", aSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("setSelectedRange:"), function $_CPImageAndTextView__setSelectedRange_(self, _cmd, aRange)
{
}
,["void","CPRange"])]);
}