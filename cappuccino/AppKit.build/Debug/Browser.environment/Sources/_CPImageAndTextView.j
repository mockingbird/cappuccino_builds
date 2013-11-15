@STATIC;1.0;I;21;Foundation/CPString.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;8;CPView.ji;11;CPControl.ji;12;CPPlatform.jt;27506;objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPColor.j", YES);objj_executeFile("CPFont.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPControl.j", YES);objj_executeFile("CPPlatform.j", YES);var _CPimageAndTextViewFrameSizeChangedFlag = 1 << 0,
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_alignment"), new objj_ivar("_verticalAlignment"), new objj_ivar("_lineBreakMode"), new objj_ivar("_textColor"), new objj_ivar("_font"), new objj_ivar("_textUnderline"), new objj_ivar("_textShadowColor"), new objj_ivar("_textShadowOffset"), new objj_ivar("_imagePosition"), new objj_ivar("_imageScaling"), new objj_ivar("_imageOffset"), new objj_ivar("_shouldDimImage"), new objj_ivar("_image"), new objj_ivar("_text"), new objj_ivar("_textSize"), new objj_ivar("_flags"), new objj_ivar("_DOMImageElement"), new objj_ivar("_DOMTextElement"), new objj_ivar("_DOMTextShadowElement")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:control:"), function $_CPImageAndTextView__initWithFrame_control_(self, _cmd, aFrame, aControl)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPImageAndTextView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._textShadowOffset = CGSizeMakeZero();
        objj_msgSend(self, "setVerticalAlignment:", CPTopVerticalTextAlignment);
        if (aControl)
        {
            objj_msgSend(self, "setLineBreakMode:", objj_msgSend(aControl, "lineBreakMode"));
            objj_msgSend(self, "setTextColor:", objj_msgSend(aControl, "textColor"));
            objj_msgSend(self, "setAlignment:", objj_msgSend(aControl, "alignment"));
            objj_msgSend(self, "setVerticalAlignment:", objj_msgSend(aControl, "verticalAlignment"));
            objj_msgSend(self, "setFont:", objj_msgSend(aControl, "font"));
            objj_msgSend(self, "setImagePosition:", objj_msgSend(aControl, "imagePosition"));
            objj_msgSend(self, "setImageScaling:", objj_msgSend(aControl, "imageScaling"));
            objj_msgSend(self, "setImageOffset:", objj_msgSend(aControl, "imageOffset"));
        }
        else
        {
            objj_msgSend(self, "setLineBreakMode:", CPLineBreakByClipping);
            objj_msgSend(self, "setAlignment:", CPCenterTextAlignment);
            objj_msgSend(self, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", CPFontCurrentSystemSize));
            objj_msgSend(self, "setImagePosition:", CPNoImage);
            objj_msgSend(self, "setImageScaling:", CPImageScaleNone);
        }
        self._textSize = nil;
        objj_msgSend(self, "setHitTests:", NO);
    }
    return self;
}
,["id","CGRect","CPControl"]), new objj_method(sel_getUid("initWithFrame:"), function $_CPImageAndTextView__initWithFrame_(self, _cmd, aFrame)
{
    return objj_msgSend(self, "initWithFrame:control:", aFrame, nil);
}
,["id","CGRect"]), new objj_method(sel_getUid("setAlignment:"), function $_CPImageAndTextView__setAlignment_(self, _cmd, anAlignment)
{
    if (self._alignment === anAlignment)
        return;
    self._alignment = anAlignment;
    switch(self._alignment) {
    case CPLeftTextAlignment:
        self._DOMElement.style.textAlign = "left";
        break;
    case CPRightTextAlignment:
        self._DOMElement.style.textAlign = "right";
        break;
    case CPCenterTextAlignment:
        self._DOMElement.style.textAlign = "center";
        break;
    case CPJustifiedTextAlignment:
        self._DOMElement.style.textAlign = "justify";
        break;
    case CPNaturalTextAlignment:
        self._DOMElement.style.textAlign = "";
        break;
    }
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
    objj_msgSend(self, "setNeedsLayout");
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
    objj_msgSend(self, "setNeedsLayout");
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
    objj_msgSend(self, "setNeedsLayout");
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
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPImageScaling"]), new objj_method(sel_getUid("imageScaling"), function $_CPImageAndTextView__imageScaling(self, _cmd)
{
    return self._imageScaling;
}
,["void"]), new objj_method(sel_getUid("setDimsImage:"), function $_CPImageAndTextView__setDimsImage_(self, _cmd, shouldDimImage)
{
    shouldDimImage = !!shouldDimImage;
    if (self._shouldDimImage !== shouldDimImage)
    {
        self._shouldDimImage = shouldDimImage;
        objj_msgSend(self, "setNeedsLayout");
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("setTextColor:"), function $_CPImageAndTextView__setTextColor_(self, _cmd, aTextColor)
{
    if (self._textColor === aTextColor)
        return;
    self._textColor = aTextColor;
    self._DOMElement.style.color = objj_msgSend(self._textColor, "cssString");
}
,["void","CPColor"]), new objj_method(sel_getUid("textColor"), function $_CPImageAndTextView__textColor(self, _cmd)
{
    return self._textColor;
}
,["CPColor"]), new objj_method(sel_getUid("setFont:"), function $_CPImageAndTextView__setFont_(self, _cmd, aFont)
{
    if (objj_msgSend(self._font, "isEqual:", aFont))
        return;
    self._font = aFont;
    self._flags |= _CPImageAndTextViewFontChangedFlag;
    self._textSize = nil;
    objj_msgSend(self, "setNeedsLayout");
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
    objj_msgSend(self, "setNeedsLayout");
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
    objj_msgSend(self, "setNeedsLayout");
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
    objj_msgSend(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("textUnderline"), function $_CPImageAndTextView__textUnderline(self, _cmd)
{
    return self._textUnderline;
}
,["BOOL"]), new objj_method(sel_getUid("textFrame"), function $_CPImageAndTextView__textFrame(self, _cmd)
{
    objj_msgSend(self, "layoutIfNeeded");
    var textFrame = CGRectMakeZero();
    if (self._DOMTextElement)
    {
        var textStyle = self._DOMTextElement.style;
        (textFrame.origin.y = parseInt(textStyle.top.substr(0, textStyle.top.length - 2), 10), textFrame.origin.x = parseInt(textStyle.left.substr(0, textStyle.left.length - 2), 10), textFrame.size.width = parseInt(textStyle.width.substr(0, textStyle.width.length - 2), 10), textFrame.size.height = parseInt(textStyle.height.substr(0, textStyle.height.length - 2), 10));
        textFrame.size.width += self._textShadowOffset.width;
        textFrame.size.height += self._textShadowOffset.height;
    }
    return textFrame;
}
,["CGRect"]), new objj_method(sel_getUid("setImage:"), function $_CPImageAndTextView__setImage_(self, _cmd, anImage)
{
    if (self._image == anImage)
        return;
    self._image = anImage;
    self._flags |= _CPImageAndTextViewImageChangedFlag;
    if (objj_msgSend(self._image, "loadStatus") !== CPImageLoadStatusCompleted)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, self._image);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPImage"]), new objj_method(sel_getUid("setImageOffset:"), function $_CPImageAndTextView__setImageOffset_(self, _cmd, theImageOffset)
{
    if (self._imageOffset === theImageOffset)
        return;
    self._imageOffset = theImageOffset;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","float"]), new objj_method(sel_getUid("imageOffset"), function $_CPImageAndTextView__imageOffset(self, _cmd)
{
    return self._imageOffset;
}
,["float"]), new objj_method(sel_getUid("imageDidLoad:"), function $_CPImageAndTextView__imageDidLoad_(self, _cmd, aNotification)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPImageDidLoadNotification, self._image);
    self._flags |= _CPImageAndTextViewImageChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
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
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPString"]), new objj_method(sel_getUid("text"), function $_CPImageAndTextView__text(self, _cmd)
{
    return self._text;
}
,["CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPImageAndTextView__layoutSubviews(self, _cmd)
{
    var needsDOMTextElement = self._imagePosition !== CPImageOnly && objj_msgSend(self._text, "length") > 0,
        hasDOMTextElement = !!self._DOMTextElement;
    if (needsDOMTextElement !== hasDOMTextElement)
    {
        if (hasDOMTextElement)
        {
            self._DOMElement.removeChild(self._DOMTextElement);
            self._DOMTextElement = nil;
            hasDOMTextElement = NO;
        }
        else
        {
            self._DOMTextElement = document.createElement("div");
            var textStyle = self._DOMTextElement.style;
            textStyle.position = "absolute";
            textStyle.whiteSpace = "pre";
            textStyle.zIndex = 200;
            textStyle.overflow = "hidden";
            self._DOMElement.appendChild(self._DOMTextElement);
            hasDOMTextElement = YES;
            self._flags |= _CPImageAndTextViewTextChangedFlag | _CPImageAndTextViewFontChangedFlag | _CPImageAndTextViewLineBreakModeChangedFlag | _CPImageAndTextViewTextUnderlineChangedFlag;
        }
    }
    var textStyle = hasDOMTextElement ? self._DOMTextElement.style : nil;
    var needsDOMTextShadowElement = hasDOMTextElement && objj_msgSend(self._textShadowColor, "alphaComponent") > 0.0,
        hasDOMTextShadowElement = !!self._DOMTextShadowElement;
    if (needsDOMTextShadowElement !== hasDOMTextShadowElement)
    {
        if (hasDOMTextShadowElement)
        {
            self._DOMElement.removeChild(self._DOMTextShadowElement);
            self._DOMTextShadowElement = nil;
            hasDOMTextShadowElement = NO;
        }
        else
        {
            self._DOMTextShadowElement = document.createElement("div");
            var shadowStyle = self._DOMTextShadowElement.style,
                font = self._font || objj_msgSend(CPFont, "systemFontOfSize:", CPFontCurrentSystemSize);
            shadowStyle.font = objj_msgSend(font, "cssString");
            shadowStyle.position = "absolute";
            shadowStyle.whiteSpace = textStyle.whiteSpace;
            shadowStyle.wordWrap = textStyle.wordWrap;
            shadowStyle.color = objj_msgSend(self._textShadowColor, "cssString");
            shadowStyle.lineHeight = objj_msgSend(font, "defaultLineHeightForFont") + "px";
            shadowStyle.zIndex = 150;
            shadowStyle.textOverflow = textStyle.textOverflow;
            if (document.attachEvent)
            {
                shadowStyle.overflow = textStyle.overflow;
            }
            else
            {
                shadowStyle.overflowX = textStyle.overflowX;
                shadowStyle.overflowY = textStyle.overflowY;
            }
            self._DOMElement.appendChild(self._DOMTextShadowElement);
            hasDOMTextShadowElement = YES;
            self._flags |= _CPImageAndTextViewTextChangedFlag;
        }
    }
    var shadowStyle = hasDOMTextShadowElement ? self._DOMTextShadowElement.style : nil;
    if (hasDOMTextElement)
    {
        if (self._flags & _CPImageAndTextViewTextChangedFlag)
            if (CPFeatureIsCompatible(CPJavaScriptInnerTextFeature))
            {
                self._DOMTextElement.innerText = self._text;
                if (self._DOMTextShadowElement)
                    self._DOMTextShadowElement.innerText = self._text;
            }
            else if (CPFeatureIsCompatible(CPJavaScriptTextContentFeature))
            {
                self._DOMTextElement.textContent = self._text;
                if (self._DOMTextShadowElement)
                    self._DOMTextShadowElement.textContent = self._text;
            }
        if (self._flags & _CPImageAndTextViewFontChangedFlag)
        {
            var font = self._font || objj_msgSend(CPFont, "systemFontOfSize:", CPFontCurrentSystemSize),
                fontStyle = objj_msgSend(font, "cssString");
            textStyle.font = fontStyle;
            textStyle.lineHeight = objj_msgSend(font, "defaultLineHeightForFont") + "px";
            if (shadowStyle)
            {
                shadowStyle.font = fontStyle;
                shadowStyle.lineHeight = objj_msgSend(font, "defaultLineHeightForFont") + "px";
            }
        }
        if (self._flags & _CPImageAndTextViewTextUnderlineChangedFlag)
        {
            textStyle.textDecoration = self._textUnderline ? "underline" : "";
        }
        if (self._flags & _CPImageAndTextViewLineBreakModeChangedFlag)
        {
            switch(self._lineBreakMode) {
            case CPLineBreakByClipping:
                textStyle.overflow = "hidden";
                textStyle.textOverflow = "clip";
                textStyle.whiteSpace = "pre";
                textStyle.wordWrap = "normal";
                break;
            case CPLineBreakByTruncatingHead:
            case CPLineBreakByTruncatingMiddle:
            case CPLineBreakByTruncatingTail:
                textStyle.textOverflow = "ellipsis";
                textStyle.whiteSpace = "pre";
                textStyle.overflow = "hidden";
                textStyle.wordWrap = "normal";
                break;
            case CPLineBreakByCharWrapping:
            case CPLineBreakByWordWrapping:
                textStyle.wordWrap = "break-word";
                try                {
                    textStyle.whiteSpace = "pre";
                    textStyle.whiteSpace = "-o-pre-wrap";
                    textStyle.whiteSpace = "-pre-wrap";
                    textStyle.whiteSpace = "-moz-pre-wrap";
                    textStyle.whiteSpace = "pre-wrap";
                }
                catch(e)                 {
                    textStyle.whiteSpace = "pre";
                }                textStyle.overflow = "hidden";
                textStyle.textOverflow = "clip";
                break;
            }
            if (shadowStyle)
            {
                if (document.attachEvent)
                {
                    shadowStyle.overflow = textStyle.overflow;
                }
                else
                {
                    shadowStyle.overflowX = textStyle.overflowX;
                    shadowStyle.overflowY = textStyle.overflowY;
                }
                shadowStyle.wordWrap = textStyle.wordWrap;
                shadowStyle.whiteSpace = textStyle.whiteSpace;
                shadowStyle.textOverflow = textStyle.textOverflow;
            }
        }
    }
    var needsDOMImageElement = self._image !== nil && self._imagePosition !== CPNoImage,
        hasDOMImageElement = !!self._DOMImageElement;
    if (needsDOMImageElement !== hasDOMImageElement)
    {
        if (hasDOMImageElement)
        {
            self._DOMElement.removeChild(self._DOMImageElement);
            self._DOMImageElement = nil;
            hasDOMImageElement = NO;
        }
        else
        {
            self._DOMImageElement = document.createElement("img");
            if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
            {
                self._DOMImageElement.setAttribute("draggable", "true");
                self._DOMImageElement.style["-khtml-user-drag"] = "element";
            }
            var imageStyle = self._DOMImageElement.style;
            imageStyle.top = "0px";
            imageStyle.left = "0px";
            imageStyle.position = "absolute";
            imageStyle.zIndex = 100;
            self._DOMElement.appendChild(self._DOMImageElement);
            hasDOMImageElement = YES;
        }
    }
    var size = objj_msgSend(self, "bounds").size,
        textRect = CGRectMake(0.0, 0.0, size.width, size.height);
    if (hasDOMImageElement)
    {
        if (!imageStyle)
            var imageStyle = self._DOMImageElement.style;
        if (self._flags & _CPImageAndTextViewImageChangedFlag)
            self._DOMImageElement.src = objj_msgSend(self._image, "filename");
        var centerX = size.width / 2.0,
            centerY = size.height / 2.0,
            imageSize = objj_msgSend(self._image, "size"),
            imageWidth = imageSize.width,
            imageHeight = imageSize.height;
        if (self._imageScaling === CPImageScaleAxesIndependently)
        {
            imageWidth = size.width;
            imageHeight = size.height;
        }
        else if (self._imageScaling === CPImageScaleProportionallyDown)
        {
            var scale = MIN(MIN(size.width, imageWidth) / imageWidth, MIN(size.height, imageHeight) / imageHeight);
            imageWidth *= scale;
            imageHeight *= scale;
        }
        if (CPFeatureIsCompatible(CPOpacityRequiresFilterFeature))
            imageStyle.filter = "alpha(opacity=" + self._shouldDimImage ? 50 : 100 + ")";
        else
            imageStyle.opacity = self._shouldDimImage ? 0.5 : 1.0;
        self._DOMImageElement.width = imageWidth;
        self._DOMImageElement.height = imageHeight;
        imageStyle.width = MAX(imageWidth, 0) + "px";
        imageStyle.height = MAX(imageHeight, 0) + "px";
        if (self._imagePosition === CPImageBelow)
        {
            imageStyle.left = FLOOR(centerX - imageWidth / 2.0) + "px";
            imageStyle.top = FLOOR(size.height - imageHeight) + "px";
            textRect.size.height = size.height - imageHeight - self._imageOffset;
        }
        else if (self._imagePosition === CPImageAbove)
        {
            imageStyle.left = FLOOR(centerX - imageWidth / 2.0) + "px";
            imageStyle.top = 0 + "px";
            textRect.origin.y += imageHeight + self._imageOffset;
            textRect.size.height = size.height - imageHeight - self._imageOffset;
        }
        else if (self._imagePosition === CPImageLeft)
        {
            imageStyle.top = FLOOR(centerY - imageHeight / 2.0) + "px";
            imageStyle.left = "0px";
            textRect.origin.x = imageWidth + self._imageOffset;
            textRect.size.width -= imageWidth + self._imageOffset;
        }
        else if (self._imagePosition === CPImageRight)
        {
            imageStyle.top = FLOOR(centerY - imageHeight / 2.0) + "px";
            imageStyle.left = FLOOR(size.width - imageWidth) + "px";
            textRect.size.width -= imageWidth + self._imageOffset;
        }
        else if (self._imagePosition === CPImageOnly || self._imagePosition == CPImageOverlaps)
        {
            imageStyle.top = FLOOR(centerY - imageHeight / 2.0) + "px";
            imageStyle.left = FLOOR(centerX - imageWidth / 2.0) + "px";
        }
    }
    if (hasDOMTextElement)
    {
        var textRectX = CGRectGetMinX(textRect),
            textRectY = CGRectGetMinY(textRect),
            textRectWidth = CGRectGetWidth(textRect),
            textRectHeight = CGRectGetHeight(textRect);
        if (textRectWidth <= 0 || textRectHeight <= 0)
        {
            textRectWidth = 0;
            textRectHeight = 0;
        }
        else
        {
            if (self._verticalAlignment !== CPTopVerticalTextAlignment)
            {
                if (!self._textSize)
                {
                    if (self._lineBreakMode === CPLineBreakByCharWrapping || self._lineBreakMode === CPLineBreakByWordWrapping)
                    {
                        self._textSize = objj_msgSend(self._text, "sizeWithFont:inWidth:", self._font, textRectWidth);
                    }
                    else
                    {
                        self._textSize = objj_msgSend(self._text, "sizeWithFont:", self._font);
                        self._textSize.width += 1;
                    }
                    self._textSize.height += 1;
                }
                if (self._verticalAlignment === CPCenterVerticalTextAlignment)
                {
                    textRectY = textRectY + (textRectHeight - self._textSize.height + 1.0) / 2.0;
                    textRectHeight = self._textSize.height;
                }
                else
                {
                    textRectY = textRectY + textRectHeight - self._textSize.height;
                    textRectHeight = self._textSize.height;
                }
            }
        }
        textStyle.top = ROUND(textRectY) + "px";
        textStyle.left = ROUND(textRectX) + "px";
        textStyle.width = MAX(CEIL(textRectWidth), 0) + "px";
        textStyle.height = MAX(CEIL(textRectHeight), 0) + "px";
        textStyle.verticalAlign = "top";
        if (shadowStyle)
        {
            if (self._flags & _CPImageAndTextViewTextShadowColorChangedFlag)
                shadowStyle.color = objj_msgSend(self._textShadowColor, "cssString");
            shadowStyle.top = ROUND(textRectY + self._textShadowOffset.height) + "px";
            shadowStyle.left = ROUND(textRectX + self._textShadowOffset.width) + "px";
            shadowStyle.width = MAX(CEIL(textRectWidth), 0) + "px";
            shadowStyle.height = MAX(CEIL(textRectHeight), 0) + "px";
        }
    }
    self._flags = 0;
}
,["void"]), new objj_method(sel_getUid("sizeToFit"), function $_CPImageAndTextView__sizeToFit(self, _cmd)
{
    var size = CGSizeMakeZero();
    if (self._imagePosition !== CPNoImage && self._image)
    {
        var imageSize = objj_msgSend(self._image, "size");
        size.width += imageSize.width;
        size.height += imageSize.height;
    }
    if (self._imagePosition !== CPImageOnly && objj_msgSend(self._text, "length") > 0)
    {
        if (!self._textSize)
        {
            self._textSize = objj_msgSend(self._text, "sizeWithFont:", self._font || objj_msgSend(CPFont, "systemFontOfSize:", 0));
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
    objj_msgSend(self, "setFrameSize:", size);
}
,["void"]), new objj_method(sel_getUid("setFrameSize:"), function $_CPImageAndTextView__setFrameSize_(self, _cmd, aSize)
{
    if ((self._lineBreakMode === CPLineBreakByCharWrapping || self._lineBreakMode === CPLineBreakByWordWrapping) && aSize.width !== objj_msgSend(self, "frameSize").width)
        self._textSize = nil;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPImageAndTextView").super_class }, "setFrameSize:", aSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("setSelectedRange:"), function $_CPImageAndTextView__setSelectedRange_(self, _cmd, aRange)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "setSelectedRange:inElement:", aRange, self._DOMTextElement);
}
,["void","CPRange"])]);
}