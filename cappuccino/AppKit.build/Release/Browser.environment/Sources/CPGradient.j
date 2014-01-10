@STATIC;1.0;I;21;Foundation/CPObject.jI;24;Foundation/CPException.jI;27;Foundation/CPMutableArray.ji;9;CGColor.ji;14;CGColorSpace.ji;12;CGGradient.ji;14;CPBezierPath.ji;19;CPGraphicsContext.jt;5043;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPException.j", NO);objj_executeFile("Foundation/CPMutableArray.j", NO);objj_executeFile("CGColor.j", YES);objj_executeFile("CGColorSpace.j", YES);objj_executeFile("CGGradient.j", YES);objj_executeFile("CPBezierPath.j", YES);objj_executeFile("CPGraphicsContext.j", YES);CPGradientDrawsBeforeStartingLocation = kCGGradientDrawsBeforeStartLocation;
CPGradientDrawsAfterEndingLocation = kCGGradientDrawsAfterEndLocation;
{var the_class = objj_allocateClassPair(CPObject, "CPGradient"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_gradient")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithStartingColor:endingColor:"), function $CPGradient__initWithStartingColor_endingColor_(self, _cmd, startingColor, endingColor)
{
    return objj_msgSend(self, "initWithColors:", [startingColor, endingColor]);
}
,["id","CPColor","CPColor"]), new objj_method(sel_getUid("initWithColors:"), function $CPGradient__initWithColors_(self, _cmd, someColors)
{
    var count = objj_msgSend(someColors, "count");
    if (count < 2)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "at least 2 colors required");
    var distance = 1.0 / (count - 1),
        locations = objj_msgSend(CPMutableArray, "array"),
        location = 0.0;
    for (var i = 0; i < count; i++)
    {
        objj_msgSend(locations, "addObject:", location);
        location += distance;
    }
    return objj_msgSend(self, "initWithColors:atLocations:colorSpace:", someColors, locations, nil);
}
,["id","CPArray"]), new objj_method(sel_getUid("initWithColors:atLocations:colorSpace:"), function $CPGradient__initWithColors_atLocations_colorSpace_(self, _cmd, someColors, someLocations, aColorSpace)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPGradient").super_class }, "init"))
    {
        var cgColors = [],
            count = objj_msgSend(someColors, "count"),
            colorSpace = objj_msgSend(aColorSpace, "CGColorSpace") || CGColorSpaceCreateDeviceRGB;
        for (var i = 0; i < count; i++)
            cgColors.push(CGColorCreate(colorSpace, objj_msgSend(someColors[i], "components")));
        self._gradient = CGGradientCreateWithColors(colorSpace, cgColors, someLocations);
    }
    return self;
}
,["id","CPArray","CPArray","CPColorSpace"]), new objj_method(sel_getUid("drawInRect:angle:"), function $CPGradient__drawInRect_angle_(self, _cmd, rect, angle)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSaveGState(ctx);
    CGContextClipToRect(ctx, rect);
    CGContextAddRect(ctx, rect);
    objj_msgSend(self, "_drawInRect:atAngle:", rect, angle);
    CGContextRestoreGState(ctx);
}
,["void","CGRect","float"]), new objj_method(sel_getUid("_drawInRect:atAngle:"), function $CPGradient___drawInRect_atAngle_(self, _cmd, rect, angle)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
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
    objj_msgSend(self, "drawFromPoint:toPoint:options:", startPoint, endPoint, CPGradientDrawsBeforeStartingLocation | CPGradientDrawsAfterEndingLocation);
}
,["void","CGRect","float"]), new objj_method(sel_getUid("drawInBezierPath:angle:"), function $CPGradient__drawInBezierPath_angle_(self, _cmd, aPath, anAngle)
{
    objj_msgSend(CPGraphicsContext, "saveGraphicsState");
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextBeginPath(ctx);
    CGContextAddPath(ctx, aPath._path);
    CGContextSetLineWidth(ctx, objj_msgSend(aPath, "lineWidth"));
    CGContextClosePath(ctx);
    objj_msgSend(self, "_drawInRect:atAngle:", objj_msgSend(aPath, "bounds"), anAngle);
    objj_msgSend(CPGraphicsContext, "restoreGraphicsState");
}
,["void","CPBezierPath","float"]), new objj_method(sel_getUid("drawFromPoint:toPoint:options:"), function $CPGradient__drawFromPoint_toPoint_options_(self, _cmd, startingPoint, endingPoint, options)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextDrawLinearGradient(ctx, self._gradient, startingPoint, endingPoint, options);
}
,["void","NSPoint","NSPoint","NSGradientDrawingOptions"])]);
}