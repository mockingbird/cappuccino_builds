@STATIC;1.0;i;9;CPColor.ji;19;CPGraphicsContext.jt;2946;objj_executeFile("CPColor.j", YES);objj_executeFile("CPGraphicsContext.j", YES);CPCalibratedWhiteColorSpace = "CalibratedWhiteColorSpace";
CPCalibratedBlackColorSpace = "CalibratedBlackColorSpace";
CPCalibratedRGBColorSpace = "CalibratedRGBColorSpace";
CPDeviceWhiteColorSpace = "DeviceWhiteColorSpace";
CPDeviceBlackColorSpace = "DeviceBlackColorSpace";
CPDeviceRGBColorSpace = "DeviceRGBColorSpace";
CPDeviceCMYKColorSpace = "DeviceCMYKColorSpace";
CPNamedColorSpace = "NamedColorSpace";
CPPatternColorSpace = "PatternColorSpace";
CPCustomColorSpace = "CustomColorSpace";
CPDrawTiledRects = function(boundsRect, clipRect, sides, grays)
{
    if (sides.length != grays.length)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "sides (length: " + sides.length + ") and grays (length: " + grays.length + ") must have the same length.");
    var colors = [];
    for (var i = 0; i < grays.length; ++i)
        colors.push(objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", grays[i], 1.0));
    return CPDrawColorTiledRects(boundsRect, clipRect, sides, colors);
}
CPDrawColorTiledRects = function(boundsRect, clipRect, sides, colors)
{
    if (sides.length != colors.length)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "sides (length: " + sides.length + ") and colors (length: " + colors.length + ") must have the same length.");
    var resultRect = CGRectMakeCopy(boundsRect),
        slice = CGRectMakeZero(),
        remainder = CGRectMakeZero(),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 1.0);
    for (var sideIndex = 0; sideIndex < sides.length; ++sideIndex)
    {
        var side = sides[sideIndex];
        CGRectDivide(resultRect, slice, remainder, 1.0, side);
        resultRect = remainder;
        slice = CGRectIntersection(slice, clipRect);
        if (CGRectIsEmpty(slice))
            continue;
        var minX,
            maxX,
            minY,
            maxY;
        if (side == CPMinXEdge || side == CPMaxXEdge)
        {
            if (CGRectGetWidth(slice) < 1.0)
                continue;
            minX = CGRectGetMinX(slice) + 0.5;
            maxX = minX;
            minY = CGRectGetMinY(slice);
            maxY = CGRectGetMaxY(slice);
        }
        else
        {
            if (CGRectGetHeight(slice) < 1.0)
                continue;
            minX = CGRectGetMinX(slice);
            maxX = CGRectGetMaxX(slice);
            minY = CGRectGetMinY(slice) + 0.5;
            maxY = minY;
        }
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, minX, minY);
        CGContextAddLineToPoint(context, maxX, maxY);
        CGContextSetStrokeColor(context, colors[sideIndex]);
        CGContextStrokePath(context);
    }
    CGContextRestoreGState(context);
    return resultRect;
}
