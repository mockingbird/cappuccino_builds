@STATIC;1.0;I;23;Foundation/CPGeometry.ji;12;CGGeometry.ji;12;CGGradient.ji;15;_CPWindowView.jt;13713;objj_executeFile("Foundation/CPGeometry.j", NO);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CGGradient.j", YES);objj_executeFile("_CPWindowView.j", YES);var _CPPopoverWindowViewDefaultCursorSize = CGSizeMake(16, 10);
{var the_class = objj_allocateClassPair(_CPWindowView, "_CPPopoverWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_arrowOffsetX"), new objj_ivar("_arrowOffsetY"), new objj_ivar("_appearance"), new objj_ivar("_preferredEdge"), new objj_ivar("_cursorSize")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("arrowOffsetX"), function $_CPPopoverWindowView__arrowOffsetX(self, _cmd)
{
    return self._arrowOffsetX;
}
,["float"]), new objj_method(sel_getUid("setArrowOffsetX:"), function $_CPPopoverWindowView__setArrowOffsetX_(self, _cmd, newValue)
{
    self._arrowOffsetX = newValue;
}
,["void","float"]), new objj_method(sel_getUid("arrowOffsetY"), function $_CPPopoverWindowView__arrowOffsetY(self, _cmd)
{
    return self._arrowOffsetY;
}
,["float"]), new objj_method(sel_getUid("setArrowOffsetY:"), function $_CPPopoverWindowView__setArrowOffsetY_(self, _cmd, newValue)
{
    self._arrowOffsetY = newValue;
}
,["void","float"]), new objj_method(sel_getUid("appearance"), function $_CPPopoverWindowView__appearance(self, _cmd)
{
    return self._appearance;
}
,["int"]), new objj_method(sel_getUid("setAppearance:"), function $_CPPopoverWindowView__setAppearance_(self, _cmd, newValue)
{
    self._appearance = newValue;
}
,["void","int"]), new objj_method(sel_getUid("preferredEdge"), function $_CPPopoverWindowView__preferredEdge(self, _cmd)
{
    return self._preferredEdge;
}
,["unsigned"]), new objj_method(sel_getUid("setPreferredEdge:"), function $_CPPopoverWindowView__setPreferredEdge_(self, _cmd, newValue)
{
    self._preferredEdge = newValue;
}
,["void","unsigned"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPPopoverWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = CGRectMakeCopy(aFrameRect),
        modifierX = 16,
        modifierY = 19;
    contentRect.origin.x += modifierX;
    contentRect.origin.y += modifierY;
    contentRect.size.width -= modifierX * 2;
    contentRect.size.height -= modifierY * 2;
    return contentRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPPopoverWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopoverWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask))
    {
        self._arrowOffsetX = 0.0;
        self._arrowOffsetY = 0.0;
        self._appearance = CPPopoverAppearanceMinimal;
        self._cursorSize = CGSizeMakeCopy(_CPPopoverWindowViewDefaultCursorSize);
    }
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("hideCursor"), function $_CPPopoverWindowView__hideCursor(self, _cmd)
{
    self._cursorSize = CGSizeMakeZero();
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("showCursor"), function $_CPPopoverWindowView__showCursor(self, _cmd)
{
    self._cursorSize = CGSizeMakeCopy(_CPPopoverWindowViewDefaultCursorSize);
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("drawRect:"), function $_CPPopoverWindowView__drawRect_(self, _cmd, aRect)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopoverWindowView").super_class }, "drawRect:", aRect);
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        radius = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "border-radius"),
        arrowWidth = self._cursorSize.width,
        arrowHeight = self._cursorSize.height,
        strokeWidth = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "stroke-width"),
        halfStrokeWidth = strokeWidth / 2.0,
        strokeColor,
        shadowColor = ((___r1 = CPColor.isa.objj_msgSend0(CPColor, "blackColor")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "colorWithAlphaComponent:", .2)),
        shadowSize = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "shadow-size"),
        shadowBlur = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "shadow-blur"),
        gradient,
        frame = self.isa.objj_msgSend0(self, "bounds");
    if (self._appearance == CPPopoverAppearanceMinimal)
    {
        gradient = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "background-gradient");
        strokeColor = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "stroke-color");
    }
    else
    {
        gradient = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "background-gradient-hud");
        strokeColor = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "stroke-color-hud");
    }
    frame.origin.x += halfStrokeWidth + shadowBlur;
    frame.origin.y += halfStrokeWidth + (shadowBlur + shadowSize.height / 2);
    frame.size.width -= strokeWidth + shadowBlur * 2;
    frame.size.height -= strokeWidth + (shadowBlur * 2 + shadowSize.height);
    CGContextSetStrokeColor(context, strokeColor);
    CGContextSetLineWidth(context, strokeWidth);
    CGContextBeginPath(context);
    CGContextSetShadowWithColor(context, shadowSize, shadowBlur, shadowColor);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(CGRectGetMidX(frame), 0.0), CGPointMake(CGRectGetMidX(frame), frame.size.height), 0);
    var xMin = CGRectGetMinX(frame),
        xMax = CGRectGetMaxX(frame),
        yMin = CGRectGetMinY(frame),
        yMax = CGRectGetMaxY(frame),
        arrowMinX = CGAlignCoordinate(xMin + radius + strokeWidth),
        arrowMaxX = CGAlignCoordinate(xMax - radius - strokeWidth),
        arrowMinY = CGAlignCoordinate(yMin + radius + strokeWidth),
        arrowMaxY = CGAlignCoordinate(yMax - radius + strokeWidth),
        arrowAnchor = CGPointMakeZero(),
        arrowStart = CGPointMakeZero(),
        pt = CGPointMakeZero();
    var path = CGPathCreateMutable();
    switch(self._preferredEdge) {
    case CPMinXEdge:
    case CPMaxXEdge:
        pt.x = CGAlignCoordinate(xMin + radius);
        pt.y = yMin;
        CGPathMoveToPoint(path, NULL, pt.x, pt.y);
        pt.x = CGAlignCoordinate(xMax - radius);
        CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        CGPathAddCurveToPoint(path, NULL, pt.x, pt.y, xMax, yMin, xMax, CGAlignCoordinate(yMin + radius));
        if (self._preferredEdge === CPMinXEdge)
        {
            arrowAnchor.x = CGAlignStroke(xMax, strokeWidth);
            arrowAnchor.y = CGAlignCoordinate(frame.size.height / 2 + yMin + self._arrowOffsetY);
            pt.y = CGAlignCoordinate(arrowAnchor.y - arrowWidth / 2);
            if (pt.y <= arrowMinY)
                pt.y = arrowMinY;
            else if (pt.y + arrowWidth > arrowMaxY)
                pt.y = arrowMaxY - arrowWidth;
            pt.x = arrowAnchor.x;
            arrowStart = CGPointMakeCopy(pt);
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
            pt.x = CGAlignStroke(arrowAnchor.x + arrowHeight, strokeWidth);
            pt.y = arrowAnchor.y;
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
            pt.x = arrowAnchor.x;
            pt.y = CGAlignCoordinate(arrowStart.y + arrowWidth);
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        }
        pt.x = xMax;
        pt.y = CGAlignCoordinate(yMax - radius);
        CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        CGPathAddCurveToPoint(path, NULL, pt.x, pt.y, pt.x, yMax, CGAlignCoordinate(xMax - radius), yMax);
        pt.x = CGAlignCoordinate(xMin + radius);
        pt.y = yMax;
        CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        CGPathAddCurveToPoint(path, NULL, pt.x, pt.y, xMin, pt.y, xMin, CGAlignCoordinate(yMax - radius));
        if (self._preferredEdge === CPMaxXEdge)
        {
            arrowAnchor.x = CGAlignStroke(xMin, strokeWidth);
            arrowAnchor.y = CGAlignCoordinate(frame.size.height / 2 + yMin + self._arrowOffsetY);
            pt.y = CGAlignCoordinate(arrowAnchor.y + arrowWidth / 2);
            if (pt.y - arrowWidth < arrowMinY)
                pt.y = arrowMinY + arrowWidth;
            else if (pt.y > arrowMaxY)
                pt.y = arrowMaxY;
            pt.x = arrowAnchor.x;
            arrowStart = CGPointMakeCopy(pt);
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
            pt.x = CGAlignStroke(arrowAnchor.x - arrowHeight, strokeWidth);
            pt.y = arrowAnchor.y;
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
            pt.x = arrowAnchor.x;
            pt.y = CGAlignCoordinate(arrowStart.y - arrowWidth);
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        }
        pt.x = xMin;
        pt.y = CGAlignCoordinate(yMin + radius);
        CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        CGPathAddCurveToPoint(path, NULL, pt.x, pt.y, pt.x, yMin, CGAlignCoordinate(xMin + radius), yMin);
        break;
    case CPMaxYEdge:
    case CPMinYEdge:
        pt.x = xMin;
        pt.y = CGAlignCoordinate(yMax - radius);
        CGPathMoveToPoint(path, NULL, pt.x, pt.y);
        pt.y = CGAlignCoordinate(yMin + radius);
        CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        CGPathAddCurveToPoint(path, NULL, pt.x, pt.y, pt.x, yMin, CGAlignCoordinate(xMin + radius), yMin);
        if (self._preferredEdge === CPMaxYEdge)
        {
            arrowAnchor.x = CGAlignCoordinate(frame.size.width / 2 + xMin + self._arrowOffsetX);
            arrowAnchor.y = CGAlignStroke(yMin + self._arrowOffsetY, strokeWidth);
            pt.x = CGAlignCoordinate(arrowAnchor.x - arrowWidth / 2);
            if (pt.x < arrowMinX)
                pt.x = arrowMinX;
            else if (pt.x + arrowWidth > arrowMaxX)
                pt.x = arrowMaxX - arrowWidth;
            pt.y = arrowAnchor.y;
            arrowStart = CGPointMakeCopy(pt);
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
            pt.x = arrowAnchor.x;
            pt.y = CGAlignStroke(arrowAnchor.y - arrowHeight, strokeWidth);
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
            pt.x = CGAlignCoordinate(arrowStart.x + arrowWidth);
            pt.y = arrowAnchor.y;
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        }
        pt.x = CGAlignCoordinate(xMax - radius);
        pt.y = yMin;
        CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        CGPathAddCurveToPoint(path, NULL, pt.x, pt.y, xMax, pt.y, xMax, CGAlignCoordinate(yMin + radius));
        pt.x = xMax;
        pt.y = CGAlignCoordinate(yMax - radius);
        CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        CGPathAddCurveToPoint(path, NULL, pt.x, pt.y, pt.x, yMax, CGAlignCoordinate(xMax - radius), yMax);
        if (self._preferredEdge === CPMinYEdge)
        {
            arrowAnchor.x = CGAlignCoordinate(frame.size.width / 2 + xMin + self._arrowOffsetX);
            arrowAnchor.y = CGAlignStroke(yMax + self._arrowOffsetY, strokeWidth);
            pt.x = CGAlignCoordinate(arrowAnchor.x + arrowWidth / 2);
            if (pt.x - arrowWidth < arrowMinX)
                pt.x = arrowMinX + arrowWidth;
            else if (pt.x > arrowMaxX)
                pt.x = arrowMaxX;
            pt.y = arrowAnchor.y;
            arrowStart = CGPointMakeCopy(pt);
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
            pt.x = arrowAnchor.x;
            pt.y = CGAlignStroke(arrowAnchor.y + arrowHeight, strokeWidth);
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
            pt.x = CGAlignCoordinate(arrowStart.x - arrowWidth);
            pt.y = arrowAnchor.y;
            CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        }
        pt.x = CGAlignCoordinate(xMin + radius);
        pt.y = yMax;
        CGPathAddLineToPoint(path, NULL, pt.x, pt.y);
        CGPathAddCurveToPoint(path, NULL, pt.x, pt.y, xMin, pt.y, xMin, CGAlignCoordinate(yMax - radius));
        break;
default:
        CGPathAddPath(path, NULL, CGPathWithRoundedRectangleInRect(frame, radius, radius, YES, YES, YES, YES));
    }
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    var ___r1;
}
,["void","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPPopoverWindowView__defaultThemeClass(self, _cmd)
{
    return "popover-window-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPPopoverWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "background-gradient", CPNull.isa.objj_msgSend0(CPNull, "null"), "background-gradient-hud", CPNull.isa.objj_msgSend0(CPNull, "null"), "stroke-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "stroke-color-hud", 5.0, "border-radius", 1.0, "stroke-width", CGSizeMake(0, 6), "shadow-size", 15.0, "shadow-blur");
}
,["CPDictionary"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPPopoverWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    var frameRect = CGRectMakeCopy(aContentRect),
        modifierX = 16,
        modifierY = 19;
    frameRect.origin.x -= modifierX;
    frameRect.origin.y -= modifierY;
    frameRect.size.width += modifierX * 2;
    frameRect.size.height += modifierY * 2;
    return frameRect;
}
,["CGRect","CGRect"])]);
}