@STATIC;1.0;i;13;CPTextField.ji;8;CPView.jt;20456;objj_executeFile("CPTextField.j", YES);objj_executeFile("CPView.j", YES);CPBoxPrimary = 0;
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
        self._titleView = objj_msgSend(CPTextField, "labelWithTitle:", "");
        self._contentView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self._contentView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "setAutoresizesSubviews:", YES);
        objj_msgSend(self, "addSubview:", self._contentView);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("borderRect"), function $CPBox__borderRect(self, _cmd)
{
    return objj_msgSend(self, "bounds");
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
    objj_msgSend(self, "setNeedsDisplay:", YES);
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
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPBoxType"]), new objj_method(sel_getUid("borderColor"), function $CPBox__borderColor(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "border-color");
}
,["CPColor"]), new objj_method(sel_getUid("setBorderColor:"), function $CPBox__setBorderColor_(self, _cmd, color)
{
    if (objj_msgSend(color, "isEqual:", objj_msgSend(self, "borderColor")))
        return;
    objj_msgSend(self, "setValue:forThemeAttribute:", color, "border-color");
}
,["void","CPColor"]), new objj_method(sel_getUid("borderWidth"), function $CPBox__borderWidth(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "border-width");
}
,["float"]), new objj_method(sel_getUid("setBorderWidth:"), function $CPBox__setBorderWidth_(self, _cmd, width)
{
    if (width === objj_msgSend(self, "borderWidth"))
        return;
    objj_msgSend(self, "setValue:forThemeAttribute:", width, "border-width");
}
,["void","float"]), new objj_method(sel_getUid("cornerRadius"), function $CPBox__cornerRadius(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "corner-radius");
}
,["float"]), new objj_method(sel_getUid("setCornerRadius:"), function $CPBox__setCornerRadius_(self, _cmd, radius)
{
    if (radius === objj_msgSend(self, "cornerRadius"))
        return;
    objj_msgSend(self, "setValue:forThemeAttribute:", radius, "corner-radius");
}
,["void","float"]), new objj_method(sel_getUid("fillColor"), function $CPBox__fillColor(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "background-color");
}
,["CPColor"]), new objj_method(sel_getUid("setFillColor:"), function $CPBox__setFillColor_(self, _cmd, color)
{
    if (objj_msgSend(color, "isEqual:", objj_msgSend(self, "fillColor")))
        return;
    objj_msgSend(self, "setValue:forThemeAttribute:", color, "background-color");
}
,["void","CPColor"]), new objj_method(sel_getUid("contentView"), function $CPBox__contentView(self, _cmd)
{
    return self._contentView;
}
,["CPView"]), new objj_method(sel_getUid("setContentView:"), function $CPBox__setContentView_(self, _cmd, aView)
{
    if (aView === self._contentView)
        return;
    var borderWidth = objj_msgSend(self, "borderWidth"),
        contentMargin = objj_msgSend(self, "valueForThemeAttribute:", "content-margin");
    objj_msgSend(aView, "setFrame:", CGRectInset(objj_msgSend(self, "bounds"), contentMargin.width + borderWidth, contentMargin.height + borderWidth));
    objj_msgSend(aView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    if (!aView)
        objj_msgSend(self._contentView, "removeFromSuperview");
    else if (self._contentView)
        objj_msgSend(self, "replaceSubview:with:", self._contentView, aView);
    else
        objj_msgSend(self, "addSubview:", aView);
    self._contentView = aView;
}
,["void","CPView"]), new objj_method(sel_getUid("contentViewMargins"), function $CPBox__contentViewMargins(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "content-margin");
}
,["CGSize"]), new objj_method(sel_getUid("setContentViewMargins:"), function $CPBox__setContentViewMargins_(self, _cmd, size)
{
    if (size.width < 0 || size.height < 0)
        objj_msgSend(CPException, "raise:reason:", CPGenericException, "Margins must be positive");
    objj_msgSend(self, "setValue:forThemeAttribute:", CGSizeMakeCopy(size), "content-margin");
}
,["void","CGSize"]), new objj_method(sel_getUid("setFrameFromContentFrame:"), function $CPBox__setFrameFromContentFrame_(self, _cmd, aRect)
{
    var offset = objj_msgSend(self, "_titleHeightOffset"),
        borderWidth = objj_msgSend(self, "borderWidth"),
        contentMargin = objj_msgSend(self, "valueForThemeAttribute:", "content-margin");
    objj_msgSend(self, "setFrame:", CGRectInset(aRect, -(contentMargin.width + borderWidth), -(contentMargin.height + offset[0] + borderWidth)));
}
,["void","CGRect"]), new objj_method(sel_getUid("setTitle:"), function $CPBox__setTitle_(self, _cmd, aTitle)
{
    if (aTitle == self._title)
        return;
    self._title = aTitle;
    objj_msgSend(self, "_manageTitlePositioning");
}
,["void","CPString"]), new objj_method(sel_getUid("setTitlePosition:"), function $CPBox__setTitlePosition_(self, _cmd, aTitlePotisition)
{
    if (aTitlePotisition == self._titlePosition)
        return;
    self._titlePosition = aTitlePotisition;
    objj_msgSend(self, "_manageTitlePositioning");
}
,["void","int"]), new objj_method(sel_getUid("titleFont"), function $CPBox__titleFont(self, _cmd)
{
    return objj_msgSend(self._titleView, "font");
}
,["CPFont"]), new objj_method(sel_getUid("setTitleFont:"), function $CPBox__setTitleFont_(self, _cmd, aFont)
{
    objj_msgSend(self._titleView, "setFont:", aFont);
}
,["void","CPFont"]), new objj_method(sel_getUid("titleView"), function $CPBox__titleView(self, _cmd)
{
    return self._titleView;
}
,["CPTextField"]), new objj_method(sel_getUid("_manageTitlePositioning"), function $CPBox___manageTitlePositioning(self, _cmd)
{
    if (self._titlePosition == CPNoTitle)
    {
        objj_msgSend(self._titleView, "removeFromSuperview");
        objj_msgSend(self, "setNeedsDisplay:", YES);
        return;
    }
    objj_msgSend(self._titleView, "setStringValue:", self._title);
    objj_msgSend(self._titleView, "sizeToFit");
    objj_msgSend(self, "addSubview:", self._titleView);
    switch(self._titlePosition) {
    case CPAtTop:
    case CPAboveTop:
    case CPBelowTop:
        objj_msgSend(self._titleView, "setFrameOrigin:", CGPointMake(5.0, 0.0));
        objj_msgSend(self._titleView, "setAutoresizingMask:", CPViewNotSizable);
        break;
    case CPAboveBottom:
    case CPAtBottom:
    case CPBelowBottom:
        var h = objj_msgSend(self._titleView, "frameSize").height;
        objj_msgSend(self._titleView, "setFrameOrigin:", CGPointMake(5.0, objj_msgSend(self, "frameSize").height - h));
        objj_msgSend(self._titleView, "setAutoresizingMask:", CPViewMinYMargin);
        break;
    }
    objj_msgSend(self, "sizeToFit");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("sizeToFit"), function $CPBox__sizeToFit(self, _cmd)
{
    var contentFrame = objj_msgSend(self._contentView, "frame"),
        offset = objj_msgSend(self, "_titleHeightOffset"),
        contentMargin = objj_msgSend(self, "valueForThemeAttribute:", "content-margin");
    if (!contentFrame)
        return;
    objj_msgSend(self._contentView, "setFrameOrigin:", CGPointMake(contentMargin.width, contentMargin.height + offset[1]));
}
,["void"]), new objj_method(sel_getUid("_titleHeightOffset"), function $CPBox___titleHeightOffset(self, _cmd)
{
    if (self._titlePosition == CPNoTitle)
        return [0.0, 0.0];
    switch(self._titlePosition) {
    case CPAtTop:
        return [objj_msgSend(self._titleView, "frameSize").height, objj_msgSend(self._titleView, "frameSize").height];
    case CPAtBottom:
        return [objj_msgSend(self._titleView, "frameSize").height, 0.0];
default:
        return [0.0, 0.0];
    }
}
,["float"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPBox__setValue_forKey_(self, _cmd, aValue, aKey)
{
    if (aKey === CPDisplayPatternTitleBinding)
        objj_msgSend(self, "setTitle:", aValue || "");
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBox").super_class }, "setValue:forKey:", aValue, aKey);
}
,["void","id","CPString"]), new objj_method(sel_getUid("drawRect:"), function $CPBox__drawRect_(self, _cmd, rect)
{
    var bounds = objj_msgSend(self, "bounds");
    switch(self._boxType) {
    case CPBoxSeparator:
        if (CGRectGetWidth(bounds) === 5.0)
            return objj_msgSend(self, "_drawVerticalSeparatorInRect:", bounds);
        else if (CGRectGetHeight(bounds) === 5.0)
            return objj_msgSend(self, "_drawHorizontalSeparatorInRect:", bounds);
        break;
    }
    if (self._titlePosition == CPAtTop)
    {
        bounds.origin.y += objj_msgSend(self._titleView, "frameSize").height;
        bounds.size.height -= objj_msgSend(self._titleView, "frameSize").height;
    }
    if (self._titlePosition == CPAtBottom)
    {
        bounds.size.height -= objj_msgSend(self._titleView, "frameSize").height;
    }
    if ((self._boxType === CPBoxPrimary || self._boxType === CPBoxSecondary) && self._borderType !== CPNoBorder)
    {
        objj_msgSend(self, "_drawPrimaryBorderInRect:", bounds);
        return;
    }
    switch(self._borderType) {
    case CPBezelBorder:
        objj_msgSend(self, "_drawBezelBorderInRect:", bounds);
        break;
    case CPGrooveBorder:
    case CPLineBorder:
        objj_msgSend(self, "_drawLineBorderInRect:", bounds);
        break;
    case CPNoBorder:
        objj_msgSend(self, "_drawNoBorderInRect:", bounds);
        break;
    }
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawHorizontalSeparatorInRect:"), function $CPBox___drawHorizontalSeparatorInRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetStrokeColor(context, objj_msgSend(self, "borderColor"));
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, CGRectGetMinX(aRect), CGRectGetMidY(aRect));
    CGContextAddLineToPoint(context, CGRectGetWidth(aRect), CGRectGetMidY(aRect));
    CGContextStrokePath(context);
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawVerticalSeparatorInRect:"), function $CPBox___drawVerticalSeparatorInRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetStrokeColor(context, objj_msgSend(self, "borderColor"));
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, CGRectGetMidX(aRect), CGRectGetMinY(aRect));
    CGContextAddLineToPoint(context, CGRectGetMidX(aRect), CGRectGetHeight(aRect));
    CGContextStrokePath(context);
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawLineBorderInRect:"), function $CPBox___drawLineBorderInRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        cornerRadius = objj_msgSend(self, "cornerRadius"),
        borderWidth = objj_msgSend(self, "borderWidth");
    aRect = CGRectInset(aRect, borderWidth / 2.0, borderWidth / 2.0);
    CGContextSetFillColor(context, objj_msgSend(self, "fillColor"));
    CGContextSetStrokeColor(context, objj_msgSend(self, "borderColor"));
    CGContextSetLineWidth(context, borderWidth);
    CGContextFillRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    CGContextStrokeRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawBezelBorderInRect:"), function $CPBox___drawBezelBorderInRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        cornerRadius = objj_msgSend(self, "cornerRadius"),
        borderWidth = objj_msgSend(self, "borderWidth"),
        shadowOffset = objj_msgSend(self, "valueForThemeAttribute:", "inner-shadow-offset"),
        shadowSize = objj_msgSend(self, "valueForThemeAttribute:", "inner-shadow-size"),
        shadowColor = objj_msgSend(self, "valueForThemeAttribute:", "inner-shadow-color");
    var baseRect = aRect;
    aRect = CGRectInset(aRect, borderWidth / 2.0, borderWidth / 2.0);
    CGContextSaveGState(context);
    CGContextSetStrokeColor(context, objj_msgSend(self, "borderColor"));
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetFillColor(context, objj_msgSend(self, "fillColor"));
    CGContextFillRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    CGContextStrokeRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    CGContextRestoreGState(context);
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawPrimaryBorderInRect:"), function $CPBox___drawPrimaryBorderInRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        cornerRadius = objj_msgSend(self, "cornerRadius"),
        borderWidth = objj_msgSend(self, "borderWidth"),
        shadowOffset = objj_msgSend(self, "valueForThemeAttribute:", "inner-shadow-offset"),
        shadowSize = objj_msgSend(self, "valueForThemeAttribute:", "inner-shadow-size"),
        shadowColor = objj_msgSend(self, "valueForThemeAttribute:", "inner-shadow-color"),
        baseRect = aRect;
    aRect = CGRectInset(aRect, borderWidth / 2.0, borderWidth / 2.0);
    CGContextSaveGState(context);
    CGContextSetStrokeColor(context, objj_msgSend(self, "borderColor"));
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetFillColor(context, objj_msgSend(self, "fillColor"));
    CGContextFillRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    CGContextBeginPath(context);
    CGContextAddPath(context, CGPathWithRoundedRectangleInRect(baseRect, cornerRadius, cornerRadius, YES, YES, YES, YES));
    CGContextClip(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowSize, shadowColor);
    CGContextStrokeRoundedRectangleInRect(context, aRect, cornerRadius, YES, YES, YES, YES);
    CGContextRestoreGState(context);
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawNoBorderInRect:"), function $CPBox___drawNoBorderInRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetFillColor(context, objj_msgSend(self, "fillColor"));
    CGContextFillRect(context, aRect);
}
,["void","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPBox___binderClassForBinding_(self, _cmd, aBinding)
{
    if (objj_msgSend(aBinding, "hasPrefix:", CPDisplayPatternTitleBinding))
        return objj_msgSend(CPTitleWithPatternBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPBox").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPBox__defaultThemeClass(self, _cmd)
{
    return "box";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPBox__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "background-color", objj_msgSend(CPNull, "null"), "border-color", 1.0, "border-width", 3.0, "corner-radius", CGSizeMakeZero(), "inner-shadow-offset", 6.0, "inner-shadow-size", objj_msgSend(CPNull, "null"), "inner-shadow-color", CGSizeMakeZero(), "content-margin");
}
,["id"]), new objj_method(sel_getUid("boxEnclosingView:"), function $CPBox__boxEnclosingView_(self, _cmd, aView)
{
    var box = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFrame:", CGRectMakeZero()),
        enclosingView = objj_msgSend(aView, "superview");
    objj_msgSend(box, "setAutoresizingMask:", objj_msgSend(aView, "autoresizingMask"));
    objj_msgSend(box, "setFrameFromContentFrame:", objj_msgSend(aView, "frame"));
    objj_msgSend(enclosingView, "replaceSubview:with:", aView, box);
    objj_msgSend(box, "setContentView:", aView);
    return box;
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
        self._boxType = objj_msgSend(aCoder, "decodeIntForKey:", CPBoxTypeKey);
        self._borderType = objj_msgSend(aCoder, "decodeIntForKey:", CPBoxBorderTypeKey);
        self._title = objj_msgSend(aCoder, "decodeObjectForKey:", CPBoxTitle);
        self._titlePosition = objj_msgSend(aCoder, "decodeIntForKey:", CPBoxTitlePosition);
        self._titleView = objj_msgSend(aCoder, "decodeObjectForKey:", CPBoxTitleView) || objj_msgSend(CPTextField, "labelWithTitle:", self._title);
        self._contentView = objj_msgSend(self, "subviews")[0];
        objj_msgSend(self, "setAutoresizesSubviews:", YES);
        objj_msgSend(self._contentView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "_manageTitlePositioning");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPBox__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBox").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._boxType, CPBoxTypeKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._borderType, CPBoxBorderTypeKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._title, CPBoxTitle);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._titlePosition, CPBoxTitlePosition);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._titleView, CPBoxTitleView);
}
,["void","CPCoder"])]);
}