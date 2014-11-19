@STATIC;1.0;I;21;Foundation/CPObject.jI;24;Foundation/CPException.jI;27;Foundation/CPMutableArray.ji;9;CGColor.ji;14;CGColorSpace.ji;12;CGGradient.ji;14;CPBezierPath.ji;19;CPGraphicsContext.jt;5864;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPException.j", NO);objj_executeFile("Foundation/CPMutableArray.j", NO);objj_executeFile("CGColor.j", YES);objj_executeFile("CGColorSpace.j", YES);objj_executeFile("CGGradient.j", YES);objj_executeFile("CPBezierPath.j", YES);objj_executeFile("CPGraphicsContext.j", YES);CPGradientDrawsBeforeStartingLocation = kCGGradientDrawsBeforeStartLocation;
CPGradientDrawsAfterEndingLocation = kCGGradientDrawsAfterEndLocation;
{var the_class = objj_allocateClassPair(CPObject, "CPGradient"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_gradient")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithStartingColor:endingColor:"), function $CPGradient__initWithStartingColor_endingColor_(self, _cmd, startingColor, endingColor)
{
    return self.isa.objj_msgSend1(self, "initWithColors:", [startingColor, endingColor]);
}
,["id","CPColor","CPColor"]), new objj_method(sel_getUid("initWithColors:"), function $CPGradient__initWithColors_(self, _cmd, someColors)
{
    var count = (someColors == null ? null : someColors.isa.objj_msgSend0(someColors, "count"));
    if (count < 2)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "at least 2 colors required");
    var distance = 1.0 / (count - 1),
        locations = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        location = 0.0;
    for (var i = 0; i < count; i++)
    {
        (locations == null ? null : locations.isa.objj_msgSend1(locations, "addObject:", location));
        location += distance;
    }
    return self.isa.objj_msgSend3(self, "initWithColors:atLocations:colorSpace:", someColors, locations, nil);
}
,["id","CPArray"]), new objj_method(sel_getUid("initWithColors:atLocations:colorSpace:"), function $CPGradient__initWithColors_atLocations_colorSpace_(self, _cmd, someColors, someLocations, aColorSpace)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPGradient").super_class }, "init"))
    {
        var cgColors = [],
            count = (someColors == null ? null : someColors.isa.objj_msgSend0(someColors, "count")),
            colorSpace = (aColorSpace == null ? null : aColorSpace.isa.objj_msgSend0(aColorSpace, "CGColorSpace")) || CGColorSpaceCreateDeviceRGB;
        for (var i = 0; i < count; i++)
            cgColors.push(CGColorCreate(colorSpace, ((___r1 = someColors[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "components"))));
        self._gradient = CGGradientCreateWithColors(colorSpace, cgColors, someLocations);
    }
    return self;
    var ___r1;
}
,["id","CPArray","CPArray","CPColorSpace"]), new objj_method(sel_getUid("drawInRect:angle:"), function $CPGradient__drawInRect_angle_(self, _cmd, rect, angle)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextSaveGState(ctx);
    CGContextClipToRect(ctx, rect);
    CGContextAddRect(ctx, rect);
    self.isa.objj_msgSend2(self, "_drawInRect:atAngle:", rect, angle);
    CGContextRestoreGState(ctx);
    var ___r1;
}
,["void","CGRect","float"]), new objj_method(sel_getUid("_drawInRect:atAngle:"), function $CPGradient___drawInRect_atAngle_(self, _cmd, rect, angle)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        startPoint,
        endPoint;
    angle = (angle % 360.0 + 360.0) % 360.0;
    if (angle < 90.0)
        startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
    else if (angle < 180.0)
        startPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect));
    else if (angle < 270.0)
        startPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    else
        startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
    var radians = PI * angle / 180.0,
        length = ABS(CGRectGetWidth(rect) * COS(radians)) + ABS(CGRectGetHeight(rect) * SIN(radians));
    endPoint = CGPointMake(startPoint.x + length * COS(radians), startPoint.y + length * SIN(radians));
    self.isa.objj_msgSend3(self, "drawFromPoint:toPoint:options:", startPoint, endPoint, CPGradientDrawsBeforeStartingLocation | CPGradientDrawsAfterEndingLocation);
    var ___r1;
}
,["void","CGRect","float"]), new objj_method(sel_getUid("drawInBezierPath:angle:"), function $CPGradient__drawInBezierPath_angle_(self, _cmd, aPath, anAngle)
{
    CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "saveGraphicsState");
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextBeginPath(ctx);
    CGContextAddPath(ctx, aPath._path);
    CGContextSetLineWidth(ctx, (aPath == null ? null : aPath.isa.objj_msgSend0(aPath, "lineWidth")));
    CGContextClosePath(ctx);
    self.isa.objj_msgSend2(self, "_drawInRect:atAngle:", (aPath == null ? null : aPath.isa.objj_msgSend0(aPath, "bounds")), anAngle);
    CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "restoreGraphicsState");
    var ___r1;
}
,["void","CPBezierPath","float"]), new objj_method(sel_getUid("drawFromPoint:toPoint:options:"), function $CPGradient__drawFromPoint_toPoint_options_(self, _cmd, startingPoint, endingPoint, options)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextDrawLinearGradient(ctx, self._gradient, startingPoint, endingPoint, options);
    var ___r1;
}
,["void","NSPoint","NSPoint","NSGradientDrawingOptions"])]);
}