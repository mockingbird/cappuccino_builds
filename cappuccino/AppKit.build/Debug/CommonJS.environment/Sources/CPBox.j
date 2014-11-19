@STATIC;1.0;i;13;CPTextField.ji;8;CPView.jt;24187;objj_executeFile("CPTextField.j", YES);objj_executeFile("CPView.j", YES);CPBoxPrimary = 0;
CPBoxSecondary = 1;
CPBoxSeparator = 2;
CPBoxOldStyle = 3;
CPBoxCustom = 4;
CPNoBorder = 0;
CPLineBorder = 1;
CPBezelBorder = 2;
CPGrooveBorder = 3;
CPNoTitle = 0;
CPAboveTop = 1;
CPAtTop = 2;
CPBelowTop = 3;
CPAboveBottom = 4;
CPAtBottom = 5;
CPBelowBottom = 6;
{var the_class = objj_allocateClassPair(CPView, "CPBox"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_boxType"), new objj_ivar("_borderType"), new objj_ivar("_contentView"), new objj_ivar("_title"), new objj_ivar("_titlePosition"), new objj_ivar("_titleView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("title"), function $CPBox__title(self, _cmd)
{
    return self._title;
}
,["CPString"]), new objj_method(sel_getUid("_setTitle:"), function $CPBox___setTitle_(self, _cmd, newValue)
{
    self._title = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("titlePosition"), function $CPBox__titlePosition(self, _cmd)
{
    return self._titlePosition;
}
,["int"]), new objj_method(sel_getUid("_setTitlePosition:"), function $CPBox___setTitlePosition_(self, _cmd, newValue)
{
    self._titlePosition = newValue;
}
,["void","int"]), new objj_method(sel_getUid("initWithFrame:"), function $CPBox__initWithFrame_(self, _cmd, frameRect)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBox").super_class }, "initWithFrame:", frameRect);
    if (self)
    {
        self._borderType = CPBezelBorder;
        self._titlePosition = CPNoTitle;
        self._titleView = CPTextField.isa.objj_msgSend1(CPTextField, "labelWithTitle:", "");
        self._contentView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", (self == null ? null : self.isa.objj_msgSend0(self, "bounds"))));
        ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._contentView));
    }
    return self;
    var ___r1;
}
,["id","CGRect"]), new objj_method(sel_getUid("borderRect"), function $CPBox__borderRect(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "bounds");
}
,["CGRect"]), new objj_method(sel_getUid("borderType"), function $CPBox__borderType(self, _cmd)
{
    return self._borderType;
}
,["CPBorderType"]), new objj_method(sel_getUid("setBorderType:"), function $CPBox__setBorderType_(self, _cmd, aBorderType)
{
    if (self._borderType === aBorderType)
        return;
    self._borderType = aBorderType;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPBorderType"]), new objj_method(sel_getUid("boxType"), function $CPBox__boxType(self, _cmd)
{
    return self._boxType;
}
,["CPBoxType"]), new objj_method(sel_getUid("setBoxType:"), function $CPBox__setBoxType_(self, _cmd, aBoxType)
{
    if (self._boxType === aBoxType)
        return;
    self._boxType = aBoxType;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPBoxType"]), new objj_method(sel_getUid("borderColor"), function $CPBox__borderColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "border-color");
}
,["CPColor"]), new objj_method(sel_getUid("setBorderColor:"), function $CPBox__setBorderColor_(self, _cmd, color)
{
    if ((color == null ? null : color.isa.objj_msgSend1(color, "isEqual:", self.isa.objj_msgSend0(self, "borderColor"))))
        return;
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", color, "border-color");
}
,["void","CPColor"]), new objj_method(sel_getUid("borderWidth"), function $CPBox__borderWidth(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "border-width");
}
,["float"]), new objj_method(sel_getUid("setBorderWidth:"), function $CPBox__setBorderWidth_(self, _cmd, width)
{
    if (width === self.isa.objj_msgSend0(self, "borderWidth"))
        return;
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", width, "border-width");
}
,["void","float"]), new objj_method(sel_getUid("cornerRadius"), function $CPBox__cornerRadius(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "corner-radius");
}
,["float"]), new objj_method(sel_getUid("setCornerRadius:"), function $CPBox__setCornerRadius_(self, _cmd, radius)
{
    if (radius === self.isa.objj_msgSend0(self, "cornerRadius"))
        return;
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", radius, "corner-radius");
}
,["void","float"]), new objj_method(sel_getUid("fillColor"), function $CPBox__fillColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "background-color");
}
,["CPColor"]), new objj_method(sel_getUid("setFillColor:"), function $CPBox__setFillColor_(self, _cmd, color)
{
    if ((color == null ? null : color.isa.objj_msgSend1(color, "isEqual:", self.isa.objj_msgSend0(self, "fillColor"))))
        return;
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", color, "background-color");
}
,["void","CPColor"]), new objj_method(sel_getUid("contentView"), function $CPBox__contentView(self, _cmd)
{
    return self._contentView;
}
,["CPView"]), new objj_method(sel_getUid("setContentView:"), function $CPBox__setContentView_(self, _cmd, aView)
{
    if (aView === self._contentView)
        return;
    var borderWidth = self.isa.objj_msgSend0(self, "borderWidth"),
        contentMargin = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "content-margin");
    (aView == null ? null : aView.isa.objj_msgSend1(aView, "setFrame:", CGRectInset(self.isa.objj_msgSend0(self, "bounds"), contentMargin.width + borderWidth, contentMargin.height + borderWidth)));
    (aView == null ? null : aView.isa.objj_msgSend1(aView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    if (!aView)
        ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    else if (self._contentView)
        self.isa.objj_msgSend2(self, "replaceSubview:with:", self._contentView, aView);
    else
        self.isa.objj_msgSend1(self, "addSubview:", aView);
    self._contentView = aView;
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("contentViewMargins"), function $CPBox__contentViewMargins(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "content-margin");
}
,["CGSize"]), new objj_method(sel_getUid("setContentViewMargins:"), function $CPBox__setContentViewMargins_(self, _cmd, size)
{
    if (size.width < 0 || size.height < 0)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPGenericException, "Margins must be positive");
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", CGSizeMakeCopy(size), "content-margin");
}
,["void","CGSize"]), new objj_method(sel_getUid("setFrameFromContentFrame:"), function $CPBox__setFrameFromContentFrame_(self, _cmd, aRect)
{
    var offset = self.isa.objj_msgSend0(self, "_titleHeightOffset"),
        borderWidth = self.isa.objj_msgSend0(self, "borderWidth"),
        contentMargin = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "content-margin");
    self.isa.objj_msgSend1(self, "setFrame:", CGRectInset(aRect, -(contentMargin.width + borderWidth), -(contentMargin.height + offset[0] + borderWidth)));
}
,["void","CGRect"]), new objj_method(sel_getUid("setTitle:"), function $CPBox__setTitle_(self, _cmd, aTitle)
{
    if (aTitle == self._title)
        return;
    self._title = aTitle;
    self.isa.objj_msgSend0(self, "_manageTitlePositioning");
}
,["void","CPString"]), new objj_method(sel_getUid("setTitlePosition:"), function $CPBox__setTitlePosition_(self, _cmd, aTitlePotisition)
{
    if (aTitlePotisition == self._titlePosition)
        return;
    self._titlePosition = aTitlePotisition;
    self.isa.objj_msgSend0(self, "_manageTitlePositioning");
}
,["void","int"]), new objj_method(sel_getUid("titleFont"), function $CPBox__titleFont(self, _cmd)
{
    return ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "font"));
    var ___r1;
}
,["CPFont"]), new objj_method(sel_getUid("setTitleFont:"), function $CPBox__setTitleFont_(self, _cmd, aFont)
{
    ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", aFont));
    var ___r1;
}
,["void","CPFont"]), new objj_method(sel_getUid("titleView"), function $CPBox__titleView(self, _cmd)
{
    return self._titleView;
}
,["CPTextField"]), new objj_method(sel_getUid("_manageTitlePositioning"), function $CPBox___manageTitlePositioning(self, _cmd)
{
    if (self._titlePosition == CPNoTitle)
    {
        ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
        return;
    }
    ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", self._title));
    ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    self.isa.objj_msgSend1(self, "addSubview:", self._titleView);
    switch(self._titlePosition) {
    case CPAtTop:
    case CPAboveTop:
    case CPBelowTop:
        ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(5.0, 0.0)));
        ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewNotSizable));
        break;
    case CPAboveBottom:
    case CPAtBottom:
    case CPBelowBottom:
        var h = ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height;
        ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(5.0, self.isa.objj_msgSend0(self, "frameSize").height - h)));
        ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinYMargin));
        break;
    }
    self.isa.objj_msgSend0(self, "sizeToFit");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("sizeToFit"), function $CPBox__sizeToFit(self, _cmd)
{
    var contentFrame = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        offset = self.isa.objj_msgSend0(self, "_titleHeightOffset"),
        contentMargin = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "content-margin");
    if (!contentFrame)
        return;
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(contentMargin.width, contentMargin.height + offset[1])));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_titleHeightOffset"), function $CPBox___titleHeightOffset(self, _cmd)
{
    if (self._titlePosition == CPNoTitle)
        return [0.0, 0.0];
    switch(self._titlePosition) {
    case CPAtTop:
        return [((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height, ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height];
    case CPAtBottom:
        return [((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height, 0.0];
default:
        return [0.0, 0.0];
    }
    var ___r1;
}
,["float"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPBox__setValue_forKey_(self, _cmd, aValue, aKey)
{
    if (aKey === CPDisplayPatternTitleBinding)
        self.isa.objj_msgSend1(self, "setTitle:", aValue || "");
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBox").super_class }, "setValue:forKey:", aValue, aKey);
}
,["void","id","CPString"]), new objj_method(sel_getUid("drawRect:"), function $CPBox__drawRect_(self, _cmd, rect)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds");
    switch(self._boxType) {
    case CPBoxSeparator:
        if (CGRectGetWidth(bounds) === 5.0)
            return self.isa.objj_msgSend1(self, "_drawVerticalSeparatorInRect:", bounds);
        else if (CGRectGetHeight(bounds) === 5.0)
            return self.isa.objj_msgSend1(self, "_drawHorizontalSeparatorInRect:", bounds);
        break;
    }
    if (self._titlePosition == CPAtTop)
    {
        bounds.origin.y += ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height;
        bounds.size.height -= ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height;
    }
    if (self._titlePosition == CPAtBottom)
    {
        bounds.size.height -= ((___r1 = self._titleView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height;
    }
    if ((self._boxType === CPBoxPrimary || self._boxType === CPBoxSecondary) && self._borderType !== CPNoBorder)
    {
        self.isa.objj_msgSend1(self, "_drawPrimaryBorderInRect:", bounds);
        return;
    }
    switch(self._borderType) {
    case CPBezelBorder:
        self.isa.objj_msgSend1(self, "_drawBezelBorderInRect:", bounds);
        break;
    case CPGrooveBorder:
    case CPLineBorder:
        self.isa.objj_msgSend1(self, "_drawLineBorderInRect:", bounds);
        break;
    case CPNoBorder:
        self.isa.objj_msgSend1(self, "_drawNoBorderInRect:", bounds);
        break;
    }
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawHorizontalSeparatorInRect:"), function $CPBox___drawHorizontalSeparatorInRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextSetStrokeColor(context, self.isa.objj_msgSend0(self, "borderColor"));
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, CGRectGetMinX(aRect), CGRectGetMidY(aRect));
    CGContextAddLineToPoint(context, CGRectGetWidth(aRect), CGRectGetMidY(aRect));
    CGContextStrokePath(context);
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawVerticalSeparatorInRect:"), function $CPBox___drawVerticalSeparatorInRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextSetStrokeColor(context, self.isa.objj_msgSend0(self, "borderColor"));
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, CGRectGetMidX(aRect), CGRectGetMinY(aRect));
    CGContextAddLineToPoint(context, CGRectGetMidX(aRect), CGRectGetHeight(aRect));
    CGContextStrokePath(context);
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawLineBorderInRect:"), function $CPBox___drawLineBorderInRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        cornerRadius = self.isa.objj_msgSend0(self, "cornerRadius"),
        borderWidth = self.isa.objj_msgSend0(self, "borderWidth");
    aRect = CGRectInset(aRect, borderWidth / 2.0, borderWidth / 2.0);
    CGContextSetFillColor(context, self.isa.objj_msgSend0(self, "fillColor"));
    CGContextSetStrokeColor(context, self.isa.objj_msgSend0(self, "borderColor"));
    CGContextSetLineWidth(context, borderWidth);
    CGContextFillRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    CGContextStrokeRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawBezelBorderInRect:"), function $CPBox___drawBezelBorderInRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        cornerRadius = self.isa.objj_msgSend0(self, "cornerRadius"),
        borderWidth = self.isa.objj_msgSend0(self, "borderWidth"),
        shadowOffset = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "inner-shadow-offset"),
        shadowSize = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "inner-shadow-size"),
        shadowColor = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "inner-shadow-color");
    var baseRect = aRect;
    aRect = CGRectInset(aRect, borderWidth / 2.0, borderWidth / 2.0);
    CGContextSaveGState(context);
    CGContextSetStrokeColor(context, self.isa.objj_msgSend0(self, "borderColor"));
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetFillColor(context, self.isa.objj_msgSend0(self, "fillColor"));
    CGContextFillRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    CGContextStrokeRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    CGContextRestoreGState(context);
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawPrimaryBorderInRect:"), function $CPBox___drawPrimaryBorderInRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        cornerRadius = self.isa.objj_msgSend0(self, "cornerRadius"),
        borderWidth = self.isa.objj_msgSend0(self, "borderWidth"),
        shadowOffset = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "inner-shadow-offset"),
        shadowSize = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "inner-shadow-size"),
        shadowColor = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "inner-shadow-color"),
        baseRect = aRect;
    aRect = CGRectInset(aRect, borderWidth / 2.0, borderWidth / 2.0);
    CGContextSaveGState(context);
    CGContextSetStrokeColor(context, self.isa.objj_msgSend0(self, "borderColor"));
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetFillColor(context, self.isa.objj_msgSend0(self, "fillColor"));
    CGContextFillRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    CGContextBeginPath(context);
    CGContextAddPath(context, CGPathWithRoundedRectangleInRect(baseRect, cornerRadius, cornerRadius, YES, YES, YES, YES));
    CGContextClip(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowSize, shadowColor);
    CGContextStrokeRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    CGContextRestoreGState(context);
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawNoBorderInRect:"), function $CPBox___drawNoBorderInRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextSetFillColor(context, self.isa.objj_msgSend0(self, "fillColor"));
    CGContextFillRect(context, aRect);
    var ___r1;
}
,["void","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPBox___binderClassForBinding_(self, _cmd, aBinding)
{
    if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPDisplayPatternTitleBinding)))
        return CPTitleWithPatternBinding.isa.objj_msgSend0(CPTitleWithPatternBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPBox").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPBox__defaultThemeClass(self, _cmd)
{
    return "box";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPBox__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "background-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "border-color", 1.0, "border-width", 3.0, "corner-radius", CGSizeMakeZero(), "inner-shadow-offset", 6.0, "inner-shadow-size", CPNull.isa.objj_msgSend0(CPNull, "null"), "inner-shadow-color", CGSizeMakeZero(), "content-margin");
}
,["CPDictionary"]), new objj_method(sel_getUid("boxEnclosingView:"), function $CPBox__boxEnclosingView_(self, _cmd, aView)
{
    var box = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero())),
        enclosingView = (aView == null ? null : aView.isa.objj_msgSend0(aView, "superview"));
    (box == null ? null : box.isa.objj_msgSend1(box, "setAutoresizingMask:", (aView == null ? null : aView.isa.objj_msgSend0(aView, "autoresizingMask"))));
    (box == null ? null : box.isa.objj_msgSend1(box, "setFrameFromContentFrame:", (aView == null ? null : aView.isa.objj_msgSend0(aView, "frame"))));
    (enclosingView == null ? null : enclosingView.isa.objj_msgSend2(enclosingView, "replaceSubview:with:", aView, box));
    (box == null ? null : box.isa.objj_msgSend1(box, "setContentView:", aView));
    return box;
    var ___r1;
}
,["id","CPView"])]);
}var CPBoxTypeKey = "CPBoxTypeKey",
    CPBoxBorderTypeKey = "CPBoxBorderTypeKey",
    CPBoxTitle = "CPBoxTitle",
    CPBoxTitlePosition = "CPBoxTitlePosition",
    CPBoxTitleView = "CPBoxTitleView";
{
var the_class = objj_getClass("CPBox")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPBox\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPBox__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBox").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._boxType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPBoxTypeKey));
        self._borderType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPBoxBorderTypeKey));
        self._title = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPBoxTitle));
        self._titlePosition = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPBoxTitlePosition));
        self._titleView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPBoxTitleView)) || CPTextField.isa.objj_msgSend1(CPTextField, "labelWithTitle:", self._title);
        self._contentView = (self == null ? null : self.isa.objj_msgSend0(self, "subviews"))[0];
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", YES));
        ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        (self == null ? null : self.isa.objj_msgSend0(self, "_manageTitlePositioning"));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPBox__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBox").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._boxType, CPBoxTypeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._borderType, CPBoxBorderTypeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._title, CPBoxTitle));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._titlePosition, CPBoxTitlePosition));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._titleView, CPBoxTitleView));
}
,["void","CPCoder"])]);
}