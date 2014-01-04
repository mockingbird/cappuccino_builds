@STATIC;1.0;t;3562;

CPGradientDrawsBeforeStartingLocation = kCGGradientDrawsBeforeStartLocation;
CPGradientDrawsAfterEndingLocation = kCGGradientDrawsAfterEndLocation;




{var the_class = objj_allocateClassPair(CPObject, "CPGradient"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_gradient")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithColors:"), function $CPGradient__initWithColors_(self, _cmd, someColors)
{ with(self)
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
},["id","CPArray"]), new objj_method(sel_getUid("initWithColors:atLocations:colorSpace:"), function $CPGradient__initWithColors_atLocations_colorSpace_(self, _cmd, someColors, someLocations, aColorSpace)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPGradient").super_class }, "init"))
    {
        var cgColors = [],
            count = objj_msgSend(someColors, "count"),
            colorSpace = objj_msgSend(aColorSpace, "CGColorSpace") || CGColorSpaceCreateDeviceRGB;
        for (var i = 0; i < count; i++)
            cgColors.push(CGColorCreate(colorSpace, objj_msgSend(someColors[i], "components")));
        _gradient = CGGradientCreateWithColors(colorSpace, cgColors, someLocations);
    }

    return self;
}
},["id","CPArray","CPArray","CPColorSpace"]), new objj_method(sel_getUid("drawInRect:angle:"), function $CPGradient__drawInRect_angle_(self, _cmd, rect, angle)
{ with(self)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");

    CGContextSaveGState(ctx);
    CGContextClipToRect(ctx, rect);
    CGContextAddRect(ctx, rect);

    var startPoint,
        endPoint;


    angle = ((angle % 360.0) + 360.0) % 360.0;

    if (angle < 90.0)
        startPoint = { x:(rect.origin.x), y:(rect.origin.y) };
    else if (angle < 180.0)
        startPoint = { x:(rect.origin.x + rect.size.width), y:(rect.origin.y) };
    else if (angle < 270.0)
        startPoint = { x:(rect.origin.x + rect.size.width), y:(rect.origin.y + rect.size.height) };
    else
        startPoint = { x:(rect.origin.x), y:(rect.origin.y + rect.size.height) };
    var radians = PI * angle / 180.0,
        length = ABS((rect.size.width) * COS(radians)) + ABS((rect.size.height) * SIN(radians));

    endPoint = { x:startPoint.x + length * COS(radians), y:startPoint.y + length * SIN(radians) };


    objj_msgSend(self, "drawFromPoint:toPoint:options:", startPoint, endPoint, CPGradientDrawsBeforeStartingLocation | CPGradientDrawsAfterEndingLocation);
    CGContextRestoreGState(ctx);
}
},["void","CGRect","float"]), new objj_method(sel_getUid("drawFromPoint:toPoint:options:"), function $CPGradient__drawFromPoint_toPoint_options_(self, _cmd, startingPoint, endingPoint, options)
{ with(self)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");



    CGContextDrawLinearGradient(ctx, _gradient, startingPoint, endingPoint, options);
}
},["void","NSPoint","NSPoint","NSGradientDrawingOptions"])]);
}

