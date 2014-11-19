@STATIC;1.0;i;19;CGAffineTransform.ji;17;CPCompatibility.ji;12;CGGeometry.ji;8;CGPath.jt;38124;objj_executeFile("CGAffineTransform.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CGPath.j", YES);kCGLineCapButt = 0;
kCGLineCapRound = 1;
kCGLineCapSquare = 2;
kCGLineJoinMiter = 0;
kCGLineJoinRound = 1;
kCGLineJoinBevel = 2;
kCGPathFill = 0;
kCGPathEOFill = 1;
kCGPathStroke = 2;
kCGPathFillStroke = 3;
kCGPathEOFillStroke = 4;
kCGBlendModeNormal = 0;
kCGBlendModeMultiply = 1;
kCGBlendModeScreen = 2;
kCGBlendModeOverlay = 3;
kCGBlendModeDarken = 4;
kCGBlendModeLighten = 5;
kCGBlendModeColorDodge = 6;
kCGBlendModeColorBurn = 7;
kCGBlendModeSoftLight = 8;
kCGBlendModeHardLight = 9;
kCGBlendModeDifference = 10;
kCGBlendModeExclusion = 11;
kCGBlendModeHue = 12;
kCGBlendModeSaturation = 13;
kCGBlendModeColor = 14;
kCGBlendModeLuminosity = 15;
kCGBlendModeClear = 16;
kCGBlendModeCopy = 17;
kCGBlendModeSourceIn = 18;
kCGBlendModeSourceOut = 19;
kCGBlendModeSourceAtop = 20;
kCGBlendModeDestinationOver = 21;
kCGBlendModeDestinationIn = 22;
kCGBlendModeDestinationOut = 23;
kCGBlendModeDestinationAtop = 24;
kCGBlendModeXOR = 25;
kCGBlendModePlusDarker = 26;
kCGBlendModePlusLighter = 27;
CGContextRelease = function()
{
}
CGContextRetain = function(aContext)
{
    return aContext;
}
if (!CPFeatureIsCompatible(CPHTMLCanvasFeature))
{
CGGStateCreate = function()
    {
        return {alpha: 1.0, strokeStyle: "#000", fillStyle: "#ccc", lineWidth: 1.0, lineJoin: kCGLineJoinMiter, lineCap: kCGLineCapButt, miterLimit: 10.0, globalAlpha: 1.0, blendMode: kCGBlendModeNormal, shadowOffset: CGSizeMakeZero(), shadowBlur: 0.0, shadowColor: NULL, CTM: CGAffineTransformMakeIdentity()};
    }
CGGStateCreateCopy = function(aGState)
    {
        return {alpha: aGState.alpha, strokeStyle: aGState.strokeStyle, fillStyle: aGState.fillStyle, lineWidth: aGState.lineWidth, lineJoin: aGState.lineJoin, lineCap: aGState.lineCap, miterLimit: aGState.miterLimit, globalAlpha: aGState.globalAlpha, blendMode: aGState.blendMode, shadowOffset: CGSizeMakeCopy(aGState.shadowOffset), shadowBlur: aGState.shadowBlur, shadowColor: aGState.shadowColor, CTM: CGAffineTransformMakeCopy(aGState.CTM)};
    }
CGBitmapGraphicsContextCreate = function()
    {
        return {DOMElement: document.createElement("div"), path: NULL, gState: CGGStateCreate(), gStateStack: []};
    }
CGContextSaveGState = function(aContext)
    {
        aContext.gStateStack.push(CGGStateCreateCopy(aContext.gState));
    }
CGContextRestoreGState = function(aContext)
    {
        aContext.gState = aContext.gStateStack.pop();
    }
CGContextSetLineCap = function(aContext, aLineCap)
    {
        aContext.gState.lineCap = aLineCap;
    }
CGContextSetLineDash = function(aContext, aPhase, someDashes)
    {
        aContext.gState.lineDashes = someDashes;
        aContext.gState.lineDashesPhase = aPhase;
    }
CGContextSetLineJoin = function(aContext, aLineJoin)
    {
        aContext.gState.lineJoin = aLineJoin;
    }
CGContextSetLineWidth = function(aContext, aLineWidth)
    {
        aContext.gState.lineWidth = aLineWidth;
    }
CGContextSetMiterLimit = function(aContext, aMiterLimit)
    {
        aContext.gState.miterLimit = aMiterLimit;
    }
CGContextSetBlendMode = function(aContext, aBlendMode)
    {
        aContext.gState.blendMode = aBlendMode;
    }
CGContextAddArc = function(aContext, x, y, radius, startAngle, endAngle, clockwise)
    {
        CGPathAddArc(aContext.path, aContext.gState.CTM, x, y, radius, startAngle, endAngle, clockwise);
    }
CGContextAddArcToPoint = function(aContext, x1, y1, x2, y2, radius)
    {
        CGPathAddArcToPoint(aContext.path, aContext.gState.CTM, x1, y1, x2, y2, radius);
    }
CGContextAddCurveToPoint = function(aContext, cp1x, cp1y, cp2x, cp2y, x, y)
    {
        CGPathAddCurveToPoint(aContext.path, aContext.gState.CTM, cp1x, cp1y, cp2x, cp2y, x, y);
    }
CGContextAddLines = function(aContext, points, count)
    {
        CGPathAddLines(aContext.path, aContext.gState.CTM, points, count);
    }
CGContextAddLineToPoint = function(aContext, x, y)
    {
        CGPathAddLineToPoint(aContext.path, aContext.gState.CTM, x, y);
    }
CGContextAddPath = function(aContext, aPath)
    {
        if (!aContext || CGPathIsEmpty(aPath))
            return;
        if (!aContext.path)
            aContext.path = CGPathCreateMutable();
        CGPathAddPath(aContext.path, aContext.gState.CTM, aPath);
    }
CGContextAddQuadCurveToPoint = function(aContext, cpx, cpy, x, y)
    {
        CGPathAddQuadCurveToPoint(aContext.path, aContext.gState.CTM, cpx, cpy, x, y);
    }
CGContextAddRect = function(aContext, aRect)
    {
        CGPathAddRect(aContext.path, aContext.gState.CTM, aRect);
    }
CGContextAddRects = function(aContext, rects, count)
    {
        CGPathAddRects(aContext.path, aContext.gState.CTM, rects, count);
    }
CGContextBeginPath = function(aContext)
    {
        aContext.path = CGPathCreateMutable();
    }
CGContextClosePath = function(aContext)
    {
        CGPathCloseSubpath(aContext.path);
    }
CGContextIsPathEmpty = function(aContext)
    {
        return !aContext.path || CGPathIsEmpty(aContext.path);
    }
CGContextMoveToPoint = function(aContext, x, y)
    {
        if (!aContext.path)
            aContext.path = CGPathCreateMutable();
        CGPathMoveToPoint(aContext.path, aContext.gState.CTM, x, y);
    }
CGContextFillRect = function(aContext, aRect)
    {
        CGContextFillRects(aContext, [aRect], 1);
    }
CGContextFillRects = function(aContext, rects, count)
    {
        if (arguments[2] === undefined)
            var count = rects.length;
        CGContextBeginPath(aContext);
        CGContextAddRects(aContext, rects, count);
        CGContextClosePath(aContext);
        CGContextDrawPath(aContext, kCGPathFill);
    }
CGContextStrokeRect = function(aContext, aRect)
    {
        CGContextBeginPath(aContext);
        CGContextAddRect(aContext, aRect);
        CGContextClosePath(aContext);
        CGContextDrawPath(aContext, kCGPathStroke);
    }
CGContextStrokeRectWithWidth = function(aContext, aRect, aWidth)
    {
        CGContextSaveGState(aContext);
        CGContextSetLineWidth(aContext, aWidth);
        CGContextStrokeRect(aContext, aRect);
        CGContextRestoreGState(aContext);
    }
CGContextConcatCTM = function(aContext, aTransform)
    {
        var CTM = aContext.gState.CTM;
        CGAffineTransformConcatTo(CTM, aTransform, CTM);
    }
CGContextGetCTM = function(aContext)
    {
        return aContext.gState.CTM;
    }
CGContextRotateCTM = function(aContext, anAngle)
    {
        var gState = aContext.gState;
        gState.CTM = CGAffineTransformRotate(gState.CTM, anAngle);
    }
CGContextScaleCTM = function(aContext, sx, sy)
    {
        var gState = aContext.gState;
        gState.CTM = CGAffineTransformScale(gState.CTM, sx, sy);
    }
CGContextTranslateCTM = function(aContext, tx, ty)
    {
        var gState = aContext.gState;
        gState.CTM = CGAffineTransformTranslate(gState.CTM, tx, ty);
    }
CGContextSetShadow = function(aContext, aSize, aBlur)
    {
        var gState = aContext.gState;
        gState.shadowOffset = CGSizeMakeCopy(aSize);
        gState.shadowBlur = aBlur;
        gState.shadowColor = (CPColor == null ? null : CPColor.isa.objj_msgSend0(CPColor, "shadowColor"));
    }
CGContextSetShadowWithColor = function(aContext, aSize, aBlur, aColor)
    {
        var gState = aContext.gState;
        gState.shadowOffset = CGSizeMakeCopy(aSize);
        gState.shadowBlur = aBlur;
        gState.shadowColor = aColor;
    }
CGContextSetAlpha = function(aContext, anAlpha)
    {
        aContext.gState.alpha = MAX(MIN(anAlpha, 1.0), 0.0);
    }
}CGContextEOFillPath = function(aContext)
{
    CGContextDrawPath(aContext, kCGPathEOFill);
}
CGContextFillPath = function(aContext)
{
    CGContextDrawPath(aContext, kCGPathFill);
    CGContextClosePath(aContext);
}
CGContextStrokeRectWithWidth = function(aContext, aRect, aWidth)
{
    CGContextSaveGState(aContext);
    CGContextSetLineWidth(aContext, aWidth);
    CGContextStrokeRect(aContext, aRect);
    CGContextRestoreGState(aContext);
}
var KAPPA = 4.0 * ((SQRT2 - 1.0) / 3.0);
CGContextAddEllipseInRect = function(aContext, aRect)
{
    CGContextBeginPath(aContext);
    CGContextAddPath(aContext, CGPathWithEllipseInRect(aRect));
    CGContextClosePath(aContext);
}
CGContextFillEllipseInRect = function(aContext, aRect)
{
    CGContextBeginPath(aContext);
    CGContextAddEllipseInRect(aContext, aRect);
    CGContextClosePath(aContext);
    CGContextFillPath(aContext);
}
CGContextStrokeEllipseInRect = function(aContext, aRect)
{
    CGContextBeginPath(aContext);
    CGContextAddEllipseInRect(aContext, aRect);
    CGContextClosePath(aContext);
    CGContextStrokePath(aContext);
}
CGContextStrokePath = function(aContext)
{
    CGContextDrawPath(aContext, kCGPathStroke);
    CGContextClosePath(aContext);
}
CGContextStrokeLineSegments = function(aContext, points, count)
{
    var i = 0;
    if (count === NULL)
        var count = points.length;
    CGContextBeginPath(aContext);
    for (; i < count; i += 2)
    {
        CGContextMoveToPoint(aContext, points[i].x, points[i].y);
        CGContextAddLineToPoint(aContext, points[i + 1].x, points[i + 1].y);
    }
    CGContextStrokePath(aContext);
}
CGContextSetFillColor = function(aContext, aColor)
{
    if (aColor)
        aContext.gState.fillStyle = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "cssString"));
}
CGContextSetStrokeColor = function(aContext, aColor)
{
    if (aColor)
        aContext.gState.strokeStyle = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "cssString"));
}
CGContextFillRoundedRectangleInRect = function(aContext, aRect, aRadius, ne, se, sw, nw)
{
    CGContextBeginPath(aContext);
    CGContextAddPath(aContext, CGPathWithRoundedRectangleInRect(aRect, aRadius, aRadius, ne, se, sw, nw));
    CGContextClosePath(aContext);
    CGContextFillPath(aContext);
}
CGContextStrokeRoundedRectangleInRect = function(aContext, aRect, aRadius, ne, se, sw, nw)
{
    CGContextBeginPath(aContext);
    CGContextAddPath(aContext, CGPathWithRoundedRectangleInRect(aRect, aRadius, aRadius, ne, se, sw, nw));
    CGContextClosePath(aContext);
    CGContextStrokePath(aContext);
}
if (CPFeatureIsCompatible(CPHTMLCanvasFeature))
{
    var CANVAS_LINECAP_TABLE = ["butt", "round", "square"],
        CANVAS_LINEJOIN_TABLE = ["miter", "round", "bevel"],
        CANVAS_COMPOSITE_TABLE = ["source-over", "source-over", "source-over", "source-over", "darker", "lighter", "source-over", "source-over", "source-over", "source-over", "source-over", "source-over", "source-over", "source-over", "source-over", "source-over", "source-over", "copy", "source-in", "source-out", "source-atop", "destination-over", "destination-in", "destination-out", "destination-atop", "xor", "source-over", "source-over"];
    var hasPath = function(aContext, methodName)
    {
        if (!aContext.hasPath)
            CPLog.error(methodName + ": no current point");
        return aContext.hasPath;
    };
CGContextSaveGState = function(aContext)
    {
        aContext.save();
    }
CGContextRestoreGState = function(aContext)
    {
        aContext.restore();
    }
CGContextSetLineCap = function(aContext, aLineCap)
    {
        aContext.lineCap = CANVAS_LINECAP_TABLE[aLineCap];
    }
CGContextSetLineDash = function(aContext, aPhase, someDashes)
    {
        if (aContext.setLineDash)
        {
            aContext.setLineDash(someDashes);
            aContext.lineDashOffset = aPhase;
        }
        else if (typeof aContext['webkitLineDash'] !== 'undefined')
        {
            aContext.webkitLineDash = someDashes;
            aContext.webkitLineDashOffset = aPhase;
        }
        else if (typeof aContext['mozDash'] !== 'undefined')
        {
            aContext.mozDash = someDashes;
            aContext.mozDashOffset = aPhase;
        }
        else if (someDashes)
        {
            CPLog.warn("CGContextSetLineDash not implemented in this environment.");
        }
    }
CGContextSetLineJoin = function(aContext, aLineJoin)
    {
        aContext.lineJoin = CANVAS_LINEJOIN_TABLE[aLineJoin];
    }
CGContextSetLineWidth = function(aContext, aLineWidth)
    {
        aContext.lineWidth = aLineWidth;
    }
CGContextSetMiterLimit = function(aContext, aMiterLimit)
    {
        aContext.miterLimit = aMiterLimit;
    }
CGContextSetBlendMode = function(aContext, aBlendMode)
    {
        aContext.globalCompositeOperation = CANVAS_COMPOSITE_TABLE[aBlendMode];
    }
CGContextAddArc = function(aContext, x, y, radius, startAngle, endAngle, clockwise)
    {
        aContext.arc(x, y, radius, startAngle, endAngle, !clockwise);
        aContext.hasPath = YES;
    }
CGContextAddArcToPoint = function(aContext, x1, y1, x2, y2, radius)
    {
        if (!hasPath(aContext, "CGContextAddArcToPoint"))
            return;
        aContext.arcTo(x1, y1, x2, y2, radius);
    }
CGContextAddCurveToPoint = function(aContext, cp1x, cp1y, cp2x, cp2y, x, y)
    {
        if (!hasPath(aContext, "CGContextAddCurveToPoint"))
            return;
        aContext.bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x, y);
    }
CGContextAddLines = function(aContext, points, count)
    {
        if (count === null || count === undefined)
            count = points.length;
        if (count < 1)
            return;
        aContext.moveTo(points[0].x, points[0].y);
        for (var i = 1; i < count; ++i)
            aContext.lineTo(points[i].x, points[i].y);
        aContext.hasPath = YES;
    }
CGContextAddLineToPoint = function(aContext, x, y)
    {
        if (!hasPath(aContext, "CGContextAddLineToPoint"))
            return;
        aContext.lineTo(x, y);
    }
CGContextAddPath = function(aContext, aPath)
    {
        if (!aContext || CGPathIsEmpty(aPath))
            return;
        if (!aContext.hasPath)
            aContext.beginPath();
        aContext.moveTo(aPath.start.x, aPath.start.y);
        var elements = aPath.elements,
            i = 0,
            count = aPath.count;
        for (; i < count; ++i)
        {
            var element = elements[i],
                type = element.type;
            switch(type) {
            case kCGPathElementMoveToPoint:
                aContext.moveTo(element.x, element.y);
                break;
            case kCGPathElementAddLineToPoint:
                aContext.lineTo(element.x, element.y);
                break;
            case kCGPathElementAddQuadCurveToPoint:
                aContext.quadraticCurveTo(element.cpx, element.cpy, element.x, element.y);
                break;
            case kCGPathElementAddCurveToPoint:
                aContext.bezierCurveTo(element.cp1x, element.cp1y, element.cp2x, element.cp2y, element.x, element.y);
                break;
            case kCGPathElementCloseSubpath:
                aContext.closePath();
                break;
            case kCGPathElementAddArc:
                aContext.arc(element.x, element.y, element.radius, element.startAngle, element.endAngle, element.clockwise);
                break;
            case kCGPathElementAddArcToPoint:
                aContext.arcTo(element.p1x, element.p1y, element.p2x, element.p2y, element.radius);
                break;
            }
        }
        aContext.hasPath = YES;
    }
CGContextAddRect = function(aContext, aRect)
    {
        aContext.rect(CGRectGetMinX(aRect), CGRectGetMinY(aRect), CGRectGetWidth(aRect), CGRectGetHeight(aRect));
        aContext.hasPath = YES;
    }
CGContextAddQuadCurveToPoint = function(aContext, cpx, cpy, x, y)
    {
        if (!hasPath(aContext, "CGContextAddQuadCurveToPoint"))
            return;
        aContext.quadraticCurveTo(cpx, cpy, x, y);
    }
CGContextAddRects = function(aContext, rects, count)
    {
        if (count === null || count === undefined)
            count = rects.length;
        for (var i = 0; i < count; ++i)
        {
            var rect = rects[i];
            aContext.rect(CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetWidth(rect), CGRectGetHeight(rect));
        }
        aContext.hasPath = YES;
    }
CGContextBeginPath = function(aContext)
    {
        aContext.beginPath();
        aContext.hasPath = NO;
    }
CGContextClosePath = function(aContext)
    {
        aContext.closePath();
    }
CGContextIsPathEmpty = function(aContext)
    {
        return !aContext.hasPath;
    }
CGContextMoveToPoint = function(aContext, x, y)
    {
        aContext.moveTo(x, y);
        aContext.hasPath = YES;
    }
CGContextClearRect = function(aContext, aRect)
    {
        aContext.clearRect(CGRectGetMinX(aRect), CGRectGetMinY(aRect), CGRectGetWidth(aRect), CGRectGetHeight(aRect));
        aContext.hasPath = NO;
    }
CGContextDrawPath = function(aContext, aMode)
    {
        if (!aContext.hasPath)
            return;
        if (aMode === kCGPathFill || aMode === kCGPathFillStroke)
            aContext.fill();
        else if (aMode === kCGPathStroke || aMode === kCGPathFillStroke || aMode === kCGPathEOFillStroke)
            aContext.stroke();
        else if (aMode === kCGPathEOFill || aMode === kCGPathEOFillStroke)
            CPLog.warn("Unimplemented fill mode in CGContextDrawPath: %d", aMode);
        aContext.hasPath = NO;
    }
CGContextFillRect = function(aContext, aRect)
    {
        aContext.fillRect(CGRectGetMinX(aRect), CGRectGetMinY(aRect), CGRectGetWidth(aRect), CGRectGetHeight(aRect));
        aContext.hasPath = NO;
    }
CGContextFillRects = function(aContext, rects, count)
    {
        if (count === null || count === undefined)
            count = rects.length;
        for (var i = 0; i < count; ++i)
        {
            var rect = rects[i];
            aContext.fillRect(CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetWidth(rect), CGRectGetHeight(rect));
        }
        aContext.hasPath = NO;
    }
CGContextStrokeRect = function(aContext, aRect)
    {
        aContext.strokeRect(CGRectGetMinX(aRect), CGRectGetMinY(aRect), CGRectGetWidth(aRect), CGRectGetHeight(aRect));
        aContext.hasPath = NO;
    }
CGContextClip = function(aContext)
    {
        aContext.clip();
        aContext.hasPath = NO;
    }
CGContextClipToRect = function(aContext, aRect)
    {
        aContext.beginPath();
        aContext.rect(CGRectGetMinX(aRect), CGRectGetMinY(aRect), CGRectGetWidth(aRect), CGRectGetHeight(aRect));
        aContext.closePath();
        aContext.clip();
        aContext.hasPath = NO;
    }
CGContextClipToRects = function(aContext, rects, count)
    {
        if (count === null || count === undefined)
            count = rects.length;
        aContext.beginPath();
        CGContextAddRects(aContext, rects, count);
        aContext.clip();
        aContext.hasPath = NO;
    }
CGContextSetAlpha = function(aContext, anAlpha)
    {
        aContext.globalAlpha = anAlpha;
    }
CGContextSetFillColor = function(aContext, aColor)
    {
        var patternImage = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "patternImage"));
        if ((patternImage == null ? null : patternImage.isa.objj_msgSend0(patternImage, "isSingleImage")))
        {
            var pattern = aContext.createPattern((patternImage == null ? null : patternImage.isa.objj_msgSend0(patternImage, "image")), "repeat");
            aContext.fillStyle = pattern;
        }
        else
            aContext.fillStyle = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "cssString"));
    }
CGContextCreatePatternContext = function(aContext, aSize)
    {
        var pattern = document.createElement("canvas");
        pattern.width = aSize.width;
        pattern.height = aSize.height;
        return pattern.getContext("2d");
    }
CGContextSetFillPattern = function(aContext, aPatternContext)
    {
        var pattern = aContext.createPattern(aPatternContext.canvas, "repeat");
        aContext.fillStyle = pattern;
    }
CGContextSetStrokePattern = function(aContext, aPatternContext)
    {
        var pattern = aContext.createPattern(aPatternContext.canvas, "repeat");
        aContext.strokeStyle = pattern;
    }
CGContextSetStrokeColor = function(aContext, aColor)
    {
        var patternImage = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "patternImage"));
        if ((patternImage == null ? null : patternImage.isa.objj_msgSend0(patternImage, "isSingleImage")))
        {
            var pattern = aContext.createPattern((patternImage == null ? null : patternImage.isa.objj_msgSend0(patternImage, "image")), "repeat");
            aContext.strokeStyle = pattern;
        }
        else
            aContext.strokeStyle = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "cssString"));
    }
CGContextSetShadow = function(aContext, aSize, aBlur)
    {
        aContext.shadowOffsetX = aSize.width;
        aContext.shadowOffsetY = aSize.height;
        aContext.shadowBlur = aBlur;
    }
CGContextSetShadowWithColor = function(aContext, aSize, aBlur, aColor)
    {
        aContext.shadowOffsetX = aSize.width;
        aContext.shadowOffsetY = aSize.height;
        aContext.shadowBlur = aBlur;
        aContext.shadowColor = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "cssString"));
    }
CGContextRotateCTM = function(aContext, anAngle)
    {
        aContext.rotate(anAngle);
    }
CGContextScaleCTM = function(aContext, sx, sy)
    {
        aContext.scale(sx, sy);
    }
CGContextTranslateCTM = function(aContext, tx, ty)
    {
        aContext.translate(tx, ty);
    }
    var scale_rotate = function(a, b, c, d)
    {
        var sign = a * d < 0.0 || b * c > 0.0 ? -1.0 : 1.0,
            a2 = (ATAN2(b, d) + ATAN2(-sign * c, sign * a)) / 2.0,
            cos = COS(a2),
            sin = SIN(a2);
        if (cos === 0)
        {
            sx = -c / sin;
            sy = b / sin;
        }
        else if (sin === 0)
        {
            sx = a / cos;
            sy = d / cos;
        }
        else
        {
            abs_cos = ABS(cos);
            abs_sin = ABS(sin);
            sx = (abs_cos * a / cos + abs_sin * -c / sin) / (abs_cos + abs_sin);
            sy = (abs_cos * d / cos + abs_sin * b / sin) / (abs_cos + abs_sin);
        }
    };
    var rotate_scale = function(a, b, c, d)
    {
        var sign = a * d < 0.0 || b * c > 0.0 ? -1.0 : 1.0,
            a1 = (ATAN2(sign * b, sign * a) + ATAN2(-c, d)) / 2.0,
            cos = COS(a1),
            sin = SIN(a1);
        if (cos === 0)
        {
            sx = b / sin;
            sy = -c / sin;
        }
        else if (sin === 0)
        {
            sx = a / cos;
            sy = d / cos;
        }
        else
        {
            abs_cos = ABS(cos);
            abs_sin = ABS(sin);
            sx = (abs_cos * a / cos + abs_sin * b / sin) / (abs_cos + abs_sin);
            sy = (abs_cos * d / cos + abs_sin * -c / sin) / (abs_cos + abs_sin);
        }
    };
eigen = function(anAffineTransform)
    {
        CPLog.warn("Unimplemented function: eigen");
    }
    if (CPFeatureIsCompatible(CPJavaScriptCanvasTransformFeature))
    {
        CGContextConcatCTM = function(aContext, anAffineTransform)
        {
            aContext.transform(anAffineTransform.a, anAffineTransform.b, anAffineTransform.c, anAffineTransform.d, anAffineTransform.tx, anAffineTransform.ty);
        };
    }
    else
    {
        CGContextConcatCTM = function(aContext, anAffineTransform)
        {
            var a = anAffineTransform.a,
                b = anAffineTransform.b,
                c = anAffineTransform.c,
                d = anAffineTransform.d,
                tx = anAffineTransform.tx,
                ty = anAffineTransform.ty,
                sx = 1.0,
                sy = 1.0,
                a1 = 0.0,
                a2 = 0.0;
            if (b === 0.0 && c === 0.0)
            {
                sx = a;
                sy = d;
            }
            else if (a * b === -c * d)
            {
                scale_rotate(a, b, c, d);
            }
            else if (a * c === -b * d)
            {
                rotate_scale(a, b, c, d);
            }
            else
            {
                var transpose = CGAffineTransformMake(a, c, b, d, 0.0, 0.0),
                    u = eigen(CGAffineTransformConcat(anAffineTransform, transpose)),
                    v = eigen(CGAffineTransformConcat(transpose, anAffineTransform)),
                    U = CGAffineTransformMake(u.vector_1.x, u.vector_2.x, u.vector_1.y, u.vector_2.y, 0.0, 0.0),
                    VT = CGAffineTransformMake(v.vector_1.x, v.vector_1.y, v.vector_2.x, v.vector_2.y, 0.0, 0.0),
                    S = CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformInvert(U), anAffineTransform), CGAffineTransformInvert(VT));
                a = VT.a;
                b = VT.b;
                c = VT.c;
                d = VT.d;
                scale_rotate(a, b, c, d);
                S.a *= sx;
                S.d *= sy;
                a = U.a;
                b = U.b;
                c = U.c;
                d = U.d;
                rotate_scale(a, b, c, d);
                sx = S.a * sx;
                sy = S.d * sy;
            }
            if (tx != 0 || ty != 0)
                CGContextTranslateCTM(aContext, tx, ty);
            if (a1 != 0.0)
                CGContextRotateCTM(aContext, a1);
            if (sx != 1.0 || sy != 1.0)
                CGContextScaleCTM(aContext, sx, sy);
            if (a2 != 0.0)
                CGContextRotateCTM(aContext, a2);
        };
    }
CGContextDrawImage = function(aContext, aRect, anImage)
    {
        aContext.drawImage(anImage._image, CGRectGetMinX(aRect), CGRectGetMinY(aRect), CGRectGetWidth(aRect), CGRectGetHeight(aRect));
        aContext.hasPath = NO;
    }
to_string = function(aColor)
    {
        return "rgba(" + ROUND(aColor.components[0] * 255) + ", " + ROUND(aColor.components[1] * 255) + ", " + ROUND(255 * aColor.components[2]) + ", " + aColor.components[3] + ")";
    }
CGContextDrawLinearGradient = function(aContext, aGradient, aStartPoint, anEndPoint, options)
    {
        var colors = aGradient.colors,
            count = colors.length,
            linearGradient = aContext.createLinearGradient(aStartPoint.x, aStartPoint.y, anEndPoint.x, anEndPoint.y);
        while (count--)
            linearGradient.addColorStop(aGradient.locations[count], to_string(colors[count]));
        aContext.fillStyle = linearGradient;
        aContext.fill();
        aContext.hasPath = NO;
    }
CGContextDrawRadialGradient = function(aContext, aGradient, aStartCenter, aStartRadius, anEndCenter, anEndRadius, options)
    {
        var colors = aGradient.colors,
            count = colors.length,
            linearGradient = aContext.createRadialGradient(aStartCenter.x, aStartCenter.y, aStartRadius, anEndCenter.x, anEndCenter.y, anEndRadius);
        while (count--)
            linearGradient.addColorStop(aGradient.locations[count], to_string(colors[count]));
        aContext.fillStyle = linearGradient;
        aContext.fill();
        aContext.hasPath = NO;
    }
CGBitmapGraphicsContextCreate = function()
    {
        var DOMElement = document.createElement("canvas"),
            context = DOMElement.getContext("2d");
        context.DOMElement = DOMElement;
        context.hasPath = NO;
        return context;
    }
}else if (CPFeatureIsCompatible(CPVMLFeature))
{
    var VML_TRUTH_TABLE = ["f", "t"],
        VML_LINECAP_TABLE = ["flat", "round", "square"],
        VML_LINEJOIN_TABLE = ["miter", "round", "bevel"],
        VML_ELEMENT_TABLE = [" m ", " l ", "qb", " c ", " x ", [" at ", " wa "]];
    var _CGBitmapGraphicsContextCreate = CGBitmapGraphicsContextCreate;
CGBitmapGraphicsContextCreate = function()
    {
        document.namespaces.add("cg_vml_", "urn:schemas-microsoft-com:vml");
        (document.createStyleSheet()).cssText = "cg_vml_\\:*{behavior:url(#default#VML)}";
        CGBitmapGraphicsContextCreate = _CGBitmapGraphicsContextCreate;
        return _CGBitmapGraphicsContextCreate();
    }
CGContextSetFillColor = function(aContext, aColor)
    {
        if ((aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "patternImage")))
            aContext.gState.fillStyle = "!" + ((___r1 = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "patternImage"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "filename"));
        else
            aContext.gState.fillStyle = (aColor == null ? null : aColor.isa.objj_msgSend0(aColor, "cssString"));
        var ___r1;
    }
CGContextClearRect = function(aContext, aRect)
    {
        if (aContext.buffer != nil)
            aContext.buffer = "";
        else
            aContext.DOMElement.innerHTML = "";
        aContext.path = NULL;
    }
    var W = 10.0,
        H = 10.0,
        Z = 10.0,
        Z_2 = Z / 2.0;
CGContextDrawImage = function(aContext, aRect, anImage)
    {
        var string = "";
        if (anImage.buffer != nil)
            string = anImage.buffer;
        else
        {
            var ctm = aContext.gState.CTM,
                origin = CGPointApplyAffineTransform(aRect.origin, ctm),
                similarity = ctm.a == ctm.d && ctm.b == -ctm.c,
                vml = ["<cg_vml_:group coordsize=\"1,1\" coordorigin=\"0,0\" style=\"width:1;height:1;position:absolute"];
        {
            var transformedRect = CGRectApplyAffineTransform(aRect, ctm);
            vml.push(";padding:0 ", ROUND(CGRectGetMaxX(transformedRect)), "px ", ROUND(CGRectGetMaxY(transformedRect)), "px 0;filter:progid:DXImageTransform.Microsoft.Matrix(", "M11='", ctm.a, "',M12='", ctm.c, "',M21='", ctm.b, "',M22='", ctm.d, "',", "Dx='", ROUND(origin.x), "', Dy='", ROUND(origin.y), "', sizingmethod='clip');");
        }
            vml.push("\"><cg_vml_:image src=\"", anImage._image.src, "\" style=\"width:", CGRectGetWidth(aRect), "px;height:", CGRectGetHeight(aRect), "px;\"/></g_vml_:group>");
            string = vml.join("");
        }
        if (aContext.buffer != nil)
            aContext.buffer += string;
        else
            aContext.DOMElement.insertAdjacentHTML("BeforeEnd", string);
    }
CGContextDrawPath = function(aContext, aMode)
    {
        if (!aContext || CGPathIsEmpty(aContext.path))
            return;
        var elements = aContext.path.elements,
            i = 0,
            count = aContext.path.count,
            gState = aContext.gState,
            fill = aMode == kCGPathFill || aMode == kCGPathFillStroke ? 1 : 0,
            stroke = aMode == kCGPathStroke || aMode == kCGPathFillStroke ? 1 : 0,
            opacity = gState.alpha,
            vml = ["<cg_vml_:shape"];
        if (gState.fillStyle.charAt(0) !== "!")
            vml.push(" fillcolor=\"", gState.fillStyle, "\"");
        vml.push(" filled=\"", VML_TRUTH_TABLE[fill], "\" style=\"position:absolute;width:", W, ";height:", H, ";\" coordorigin=\"0 0\" coordsize=\"", Z * W, " ", Z * H, "\" stroked=\"", VML_TRUTH_TABLE[stroke], "\" strokeweight=\"", gState.lineWidth, "\" strokecolor=\"", gState.strokeStyle, "\" path=\"");
        for (; i < count; ++i)
        {
            var element = elements[i],
                type = element.type;
            switch(type) {
            case kCGPathElementMoveToPoint:
            case kCGPathElementAddLineToPoint:
                vml.push(VML_ELEMENT_TABLE[type], element.x === 0.0 ? 0 : ROUND(Z * element.x - Z_2), ',', element.y === 0.0 ? 0 : ROUND(Z * element.y - Z_2));
                break;
            case kCGPathElementAddQuadCurveToPoint:
                vml.push(VML_ELEMENT_TABLE[type], element.cpx === 0.0 ? 0 : ROUND(Z * element.cpx - Z_2), ',', element.cpy === 0.0 ? 0 : ROUND(Z * element.cpy - Z_2), ',', element.x === 0.0 ? 0 : ROUND(Z * element.x - Z_2), ',', element.y === 0.0 ? 0 : ROUND(Z * element.y - Z_2));
                break;
            case kCGPathElementAddCurveToPoint:
                vml.push(VML_ELEMENT_TABLE[type], element.cp1x === 0.0 ? 0 : ROUND(Z * element.cp1x - Z_2), ',', element.cp1y === 0.0 ? 0 : ROUND(Z * element.cp1y - Z_2), ',', element.cp2x === 0.0 ? 0 : ROUND(Z * element.cp2x - Z_2), ',', element.cp2y === 0.0 ? 0 : ROUND(Z * element.cp2y - Z_2), ',', element.x === 0.0 ? 0 : ROUND(Z * element.x - Z_2), ',', element.y === 0.0 ? 0 : ROUND(Z * element.y - Z_2));
                break;
            case kCGPathElementCloseSubpath:
                vml.push(VML_ELEMENT_TABLE[type]);
                break;
            case kCGPathElementAddArc:
                var x = element.x,
                    y = element.y,
                    radius = element.radius,
                    clockwise = element.clockwise ? 1 : 0,
                    endAngle = element.endAngle,
                    startAngle = element.startAngle,
                    start = CGPointMake(x + radius * COS(startAngle), y + radius * SIN(startAngle));
                if (startAngle == endAngle && !clockwise)
                {
                    vml.push(VML_ELEMENT_TABLE[kCGPathElementMoveToPoint], start.x === 0.0 ? 0 : ROUND(Z * start.x - Z_2), ',', start.y === 0.0 ? 0 : ROUND(Z * start.y - Z_2));
                    continue;
                }
                var end = CGPointMake(x + radius * COS(endAngle), y + radius * SIN(endAngle));
                if (clockwise && startAngle != endAngle && CGPointEqualToPoint(start, end))
                    if (start.x >= x)
                    {
                        if (start.y < y)
                            start.x += 0.125;
                        else
                            start.y += 0.125;
                    }
                    else
                    {
                        if (end.y <= y)
                            end.x += 0.125;
                        else
                            end.y += 0.125;
                    }
                vml.push(VML_ELEMENT_TABLE[type][clockwise], x - radius === 0.0 ? 0 : ROUND(Z * (x - radius) - Z_2), ',', y - radius === 0.0 ? 0 : ROUND(Z * (y - radius) - Z_2), " ", x + radius === 0.0 ? 0 : ROUND(Z * (x + radius) - Z_2), ',', y + radius === 0.0 ? 0 : ROUND(Z * (y + radius) - Z_2), " ", start.x === 0.0 ? 0 : ROUND(Z * start.x - Z_2), ',', start.y === 0.0 ? 0 : ROUND(Z * start.y - Z_2), " ", end.x === 0.0 ? 0 : ROUND(Z * end.x - Z_2), ',', end.y === 0.0 ? 0 : ROUND(Z * end.y - Z_2));
                break;
            case kCGPathElementAddArcToPoint:
                break;
            }
        }
        vml.push("\">");
        if (gState.gradient)
            vml.push(gState.gradient);
        else if (fill)
        {
            if (gState.fillStyle.charAt(0) === "!")
                vml.push("<cg_vml_:fill type=\"tile\" src=\"", gState.fillStyle.substring(1), "\" opacity=\"", opacity, "\" />");
            else
                vml.push("<cg_vml_:fill color=\"", gState.fillStyle, "\" opacity=\"", opacity, "\" />");
        }
        if (stroke)
            vml.push("<cg_vml_:stroke opacity=\"", opacity, "\" joinstyle=\"", VML_LINEJOIN_TABLE[gState.lineJoin], "\" miterlimit=\"", gState.miterLimit, "\" endcap=\"", VML_LINECAP_TABLE[gState.lineCap], "\" weight=\"", gState.lineWidth, "", "px\" color=\"", gState.strokeStyle, "\" />");
        var shadowColor = gState.shadowColor;
        if (shadowColor)
        {
            var shadowOffset = gState.shadowOffset;
            vml.push("<cg_vml_:shadow on=\"t\" offset=\"", shadowOffset.width, "pt ", shadowOffset.height, "pt\" opacity=\"", (shadowColor == null ? null : shadowColor.isa.objj_msgSend0(shadowColor, "alphaComponent")), "\" color=black />");
        }
        vml.push("</cg_vml_:shape>");
        if (aContext.buffer != nil)
            aContext.buffer += vml.join("");
        else
            aContext.DOMElement.insertAdjacentHTML("BeforeEnd", vml.join(""));
    }
to_string = function(aColor)
    {
        return "rgb(" + ROUND(aColor.components[0] * 255) + ", " + ROUND(aColor.components[1] * 255) + ", " + ROUND(255 * aColor.components[2]) + ")";
    }
CGContextDrawLinearGradient = function(aContext, aGradient, aStartPoint, anEndPoint, options)
    {
        if (!aContext || !aGradient)
            return;
        var vml = nil;
        if (aGradient.vml_gradient)
        {
            var stops = ((___r1 = ((___r2 = aGradient.vml_gradient), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "stops"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sortedArrayUsingSelector:", sel_getUid("comparePosition:"))),
                count = (stops == null ? null : stops.isa.objj_msgSend0(stops, "count"));
            vml = ["<cg_vml_:fill type=\"gradient\" method=\"linear sigma\" "];
            vml.push("angle=\"" + (((___r1 = aGradient.vml_gradient), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "angle")) + 90) + "\" ");
            vml.push("colors=\"");
            for (var i = 0; i < count; i++)
            {
                vml.push((((___r1 = stops[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "position")) * 100).toFixed(0) + "% ");
                vml.push(((___r1 = ((___r2 = ((___r3 = stops[i]), ___r3 == null ? null : ___r3.isa.objj_msgSend0(___r3, "color"))), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "colorForSlideBase:", nil))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cssString")));
                if (i < count - 1)
                    vml.push(",");
            }
            vml.push("\" />");
        }
        else
        {
            var colors = aGradient.colors,
                count = colors.length;
            vml = ["<cg_vml_:fill type=\"gradient\" "];
            vml.push("colors=\"");
            for (var i = 0; i < count; i++)
                vml.push((aGradient.locations[i] * 100).toFixed(0) + "% " + to_string(colors[i]) + (i < count - 1 ? "," : ""));
            vml.push("\" />");
        }
        aContext.gState.gradient = vml.join("");
        var ___r1, ___r2, ___r3;
    }
}else
{
    CGContextClearRect = CGContextDrawLinearGradient = CGContextClip = CGContextClipToRect = function()
    {
        throw new Error("function is not declared in this environment");
    };
}