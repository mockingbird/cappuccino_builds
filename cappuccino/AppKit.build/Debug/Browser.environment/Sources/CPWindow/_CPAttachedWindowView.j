@STATIC;1.0;i;15;_CPWindowView.jt;13890;


objj_executeFile("_CPWindowView.j", YES);




var _CPAttachedWindowViewDefaultCursorSize = CGSizeMake(16, 10),
    _CPAttachedWindowViewRadius = 5.0,
    _CPAttachedWindowViewStrokeWidth = 1.0,
    _CPAttachedWindowViewShadowSize = CGSizeMake(0, 6),
    _CPAttachedWindowViewShadowBlur = 15.0;






{var the_class = objj_allocateClassPair(_CPWindowView, "_CPAttachedWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_arrowOffsetX"), new objj_ivar("_arrowOffsetY"), new objj_ivar("_appearance"), new objj_ivar("_preferredEdge"), new objj_ivar("_cursorSize")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("arrowOffsetX"), function $_CPAttachedWindowView__arrowOffsetX(self, _cmd)
{ with(self)
{
return _arrowOffsetX;
}
},["id"]),
new objj_method(sel_getUid("setArrowOffsetX:"), function $_CPAttachedWindowView__setArrowOffsetX_(self, _cmd, newValue)
{ with(self)
{
_arrowOffsetX = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("arrowOffsetY"), function $_CPAttachedWindowView__arrowOffsetY(self, _cmd)
{ with(self)
{
return _arrowOffsetY;
}
},["id"]),
new objj_method(sel_getUid("setArrowOffsetY:"), function $_CPAttachedWindowView__setArrowOffsetY_(self, _cmd, newValue)
{ with(self)
{
_arrowOffsetY = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("appearance"), function $_CPAttachedWindowView__appearance(self, _cmd)
{ with(self)
{
return _appearance;
}
},["id"]),
new objj_method(sel_getUid("setAppearance:"), function $_CPAttachedWindowView__setAppearance_(self, _cmd, newValue)
{ with(self)
{
_appearance = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("preferredEdge"), function $_CPAttachedWindowView__preferredEdge(self, _cmd)
{ with(self)
{
return _preferredEdge;
}
},["id"]),
new objj_method(sel_getUid("setPreferredEdge:"), function $_CPAttachedWindowView__setPreferredEdge_(self, _cmd, newValue)
{ with(self)
{
_preferredEdge = newValue;
}
},["void","id"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPAttachedWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = CGRectMakeCopy(aFrameRect);




    contentRect.origin.x += 18;
    contentRect.origin.y += 17;
    contentRect.size.width -= 35;
    contentRect.size.height -= 37;

    return contentRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPAttachedWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAttachedWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask))
    {
        _arrowOffsetX = 0.0;
        _arrowOffsetY = 0.0;
        _appearance = CPPopoverAppearanceMinimal;
        _cursorSize = CGSizeMakeCopy(_CPAttachedWindowViewDefaultCursorSize);
    }

    return self;
}
},["id","CGRect","unsigned"]), new objj_method(sel_getUid("hideCursor"), function $_CPAttachedWindowView__hideCursor(self, _cmd)
{ with(self)
{
    _cursorSize = CGSizeMakeZero();
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void"]), new objj_method(sel_getUid("showCursor"), function $_CPAttachedWindowView__showCursor(self, _cmd)
{ with(self)
{
    _cursorSize = CGSizeMakeCopy(_CPAttachedWindowViewDefaultCursorSize);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void"]), new objj_method(sel_getUid("drawRect:"), function $_CPAttachedWindowView__drawRect_(self, _cmd, aRect)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAttachedWindowView").super_class }, "drawRect:", aRect);

    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        radius = _CPAttachedWindowViewRadius,
        arrowWidth = _cursorSize.width,
        arrowHeight = _cursorSize.height,
        strokeWidth = _CPAttachedWindowViewStrokeWidth,
        halfStrokeWidth = strokeWidth / 2.0,
        strokeColor,
        shadowColor = objj_msgSend(objj_msgSend(CPColor, "blackColor"), "colorWithAlphaComponent:", .2),
        shadowSize = _CPAttachedWindowViewShadowSize,
        shadowBlur = _CPAttachedWindowViewShadowBlur,
        gradient,
        frame = objj_msgSend(self, "bounds");

    if (_appearance == CPPopoverAppearanceMinimal)
    {
        gradient = CGGradientCreateWithColorComponents(
                        CGColorSpaceCreateDeviceRGB(),
                        [
                            (254.0 / 255), (254.0 / 255), (254.0 / 255), 0.93,
                            (231.0 / 255), (231.0 / 255), (231.0 / 255), 0.93
                        ],
                        [0, 1],
                        2
                    );
        strokeColor = objj_msgSend(CPColor, "colorWithHexString:", "B8B8B8");
    }
    else
    {
        gradient = CGGradientCreateWithColorComponents(
                        CGColorSpaceCreateDeviceRGB(),
                        [
                            (38.0 / 255), (38.0 / 255), (38.0 / 255), 0.93,
                            (18.0 / 255), (18.0 / 255), (18.0 / 255), 0.93
                        ],
                        [0, 1],
                        2);
        strokeColor = objj_msgSend(CPColor, "colorWithHexString:", "222222");
    }


    frame.origin.x += halfStrokeWidth + shadowBlur;
    frame.origin.y += halfStrokeWidth + (shadowBlur + shadowSize.height / 2);
    frame.size.width -= strokeWidth + (shadowBlur * 2);
    frame.size.height -= strokeWidth + (shadowBlur * 2 + shadowSize.height);

    CGContextSetStrokeColor(context, strokeColor);
    CGContextSetLineWidth(context, strokeWidth);
    CGContextBeginPath(context);
    CGContextSetShadowWithColor(context, shadowSize, shadowBlur, shadowColor);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(CGRectGetMidX(frame), 0.0), CGPointMake(CGRectGetMidX(frame), frame.size.height), 0);

    var xMin = (frame.origin.x),
        xMax = (frame.origin.x + frame.size.width),
        yMin = (frame.origin.y),
        yMax = (frame.origin.y + frame.size.height),
        arrowMinX = (FLOOR(xMin + radius + strokeWidth)),
        arrowMaxX = (FLOOR(xMax - radius - strokeWidth)),
        arrowMinY = (FLOOR(yMin + radius + strokeWidth)),
        arrowMaxY = (FLOOR(yMax - radius + strokeWidth)),
        arrowAnchor = CGPointMakeZero(),
        arrowStart = CGPointMakeZero(),
        pt = CGPointMakeZero();


    switch (_preferredEdge)
    {
        case CPMinXEdge:
        case CPMaxXEdge:

            pt.x = (FLOOR(xMin + radius));
            pt.y = yMin;
            CGContextMoveToPoint(context, pt.x, pt.y);


            pt.x = (FLOOR(xMax - radius));
            CGContextAddLineToPoint(context, pt.x, pt.y);
            CGContextAddCurveToPoint(context, pt.x, pt.y, xMax, yMin, xMax, (FLOOR(yMin + radius)));

            if (_preferredEdge === CPMinXEdge)
            {

                arrowAnchor.x = (FLOOR(xMax) === (xMax) ? (xMax) + halfStrokeWidth : (xMax));
                arrowAnchor.y = (FLOOR((frame.size.height / 2) + yMin + _arrowOffsetY));


                pt.y = (FLOOR(arrowAnchor.y - (arrowWidth / 2)));


                if (pt.y <= arrowMinY)
                    pt.y = arrowMinY;
                else if ((pt.y + arrowWidth) > arrowMaxY)
                    pt.y = arrowMaxY - arrowWidth;

                pt.x = arrowAnchor.x;
                arrowStart = CGPointMakeCopy(pt);
                CGContextAddLineToPoint(context, pt.x, pt.y);


                pt.x = (FLOOR(arrowAnchor.x + arrowHeight) === (arrowAnchor.x + arrowHeight) ? (arrowAnchor.x + arrowHeight) + halfStrokeWidth : (arrowAnchor.x + arrowHeight));
                pt.y = arrowAnchor.y;
                CGContextAddLineToPoint(context, pt.x, pt.y);


                pt.x = arrowAnchor.x;
                pt.y = (FLOOR(arrowStart.y + arrowWidth));
                CGContextAddLineToPoint(context, pt.x, pt.y);
            }


            pt.x = xMax;
            pt.y = (FLOOR(yMax - radius));
            CGContextAddLineToPoint(context, pt.x, pt.y);
            CGContextAddCurveToPoint(context, pt.x, pt.y, pt.x, yMax, (FLOOR(xMax - radius)), yMax);


            pt.x = (FLOOR(xMin + radius));
            pt.y = yMax;
            CGContextAddLineToPoint(context, pt.x, pt.y);
            CGContextAddCurveToPoint(context, pt.x, pt.y, xMin, pt.y, xMin, (FLOOR(yMax - radius)));

            if (_preferredEdge === CPMaxXEdge)
            {

                arrowAnchor.x = (FLOOR(xMin) === (xMin) ? (xMin) + halfStrokeWidth : (xMin));
                arrowAnchor.y = (FLOOR((frame.size.height / 2) + yMin + _arrowOffsetY));


                pt.y = (FLOOR(arrowAnchor.y + (arrowWidth / 2)));


                if ((pt.y - arrowWidth) < arrowMinY)
                    pt.y = arrowMinY + arrowWidth;
                else if (pt.y > arrowMaxY)
                    pt.y = arrowMaxY;

                pt.x = arrowAnchor.x;
                arrowStart = CGPointMakeCopy(pt);
                CGContextAddLineToPoint(context, pt.x, pt.y);


                pt.x = (FLOOR(arrowAnchor.x - arrowHeight) === (arrowAnchor.x - arrowHeight) ? (arrowAnchor.x - arrowHeight) + halfStrokeWidth : (arrowAnchor.x - arrowHeight));
                pt.y = arrowAnchor.y;
                CGContextAddLineToPoint(context, pt.x, pt.y);


                pt.x = arrowAnchor.x;
                pt.y = (FLOOR(arrowStart.y - arrowWidth));
                CGContextAddLineToPoint(context, pt.x, pt.y);
            }


            pt.x = xMin;
            pt.y = (FLOOR(yMin + radius));
            CGContextAddLineToPoint(context, pt.x, pt.y);
            CGContextAddCurveToPoint(context, pt.x, pt.y, pt.x, yMin, (FLOOR(xMin + radius)), yMin);
            break;

        case CPMaxYEdge:
        case CPMinYEdge:

            pt.x = xMin;
            pt.y = (FLOOR(yMax - radius));
            CGContextMoveToPoint(context, pt.x, pt.y);


            pt.y = (FLOOR(yMin + radius));
            CGContextAddLineToPoint(context, pt.x, pt.y);
            CGContextAddCurveToPoint(context, pt.x, pt.y, pt.x, yMin, (FLOOR(xMin + radius)), yMin);

            if (_preferredEdge === CPMaxYEdge)
            {

                arrowAnchor.x = (FLOOR((frame.size.width / 2) + xMin + _arrowOffsetX));
                arrowAnchor.y = (FLOOR(yMin + _arrowOffsetY) === (yMin + _arrowOffsetY) ? (yMin + _arrowOffsetY) + halfStrokeWidth : (yMin + _arrowOffsetY));


                pt.x = (FLOOR(arrowAnchor.x - (arrowWidth / 2)));


                if (pt.x < arrowMinX)
                    pt.x = arrowMinX;
                else if ((pt.x + arrowWidth) > arrowMaxX)
                    pt.x = arrowMaxX - arrowWidth;

                pt.y = arrowAnchor.y;
                arrowStart = CGPointMakeCopy(pt);
                CGContextAddLineToPoint(context, pt.x, pt.y);


                pt.x = arrowAnchor.x;
                pt.y = (FLOOR(arrowAnchor.y - arrowHeight) === (arrowAnchor.y - arrowHeight) ? (arrowAnchor.y - arrowHeight) + halfStrokeWidth : (arrowAnchor.y - arrowHeight));
                CGContextAddLineToPoint(context, pt.x, pt.y);


                pt.x = (FLOOR(arrowStart.x + arrowWidth));
                pt.y = arrowAnchor.y;
                CGContextAddLineToPoint(context, pt.x, pt.y);
            }


            pt.x = (FLOOR(xMax - radius));
            pt.y = yMin;
            CGContextAddLineToPoint(context, pt.x, pt.y);
            CGContextAddCurveToPoint(context, pt.x, pt.y, xMax, pt.y, xMax, (FLOOR(yMin + radius)));


            pt.x = xMax;
            pt.y = (FLOOR(yMax - radius));
            CGContextAddLineToPoint(context, pt.x, pt.y);
            CGContextAddCurveToPoint(context, pt.x, pt.y, pt.x, yMax, (FLOOR(xMax - radius)), yMax);

            if (_preferredEdge === CPMinYEdge)
            {

                arrowAnchor.x = (FLOOR((frame.size.width / 2) + xMin + _arrowOffsetX));
                arrowAnchor.y = (FLOOR(yMax + _arrowOffsetY) === (yMax + _arrowOffsetY) ? (yMax + _arrowOffsetY) + halfStrokeWidth : (yMax + _arrowOffsetY));


                pt.x = (FLOOR(arrowAnchor.x + (arrowWidth / 2)));


                if ((pt.x - arrowWidth) < arrowMinX)
                    pt.x = arrowMinX + arrowWidth;
                else if (pt.x > arrowMaxX)
                    pt.x = arrowMaxX;

                pt.y = arrowAnchor.y;
                arrowStart = CGPointMakeCopy(pt);
                CGContextAddLineToPoint(context, pt.x, pt.y);


                pt.x = arrowAnchor.x;
                pt.y = (FLOOR(arrowAnchor.y + arrowHeight) === (arrowAnchor.y + arrowHeight) ? (arrowAnchor.y + arrowHeight) + halfStrokeWidth : (arrowAnchor.y + arrowHeight));
                CGContextAddLineToPoint(context, pt.x, pt.y);


                pt.x = (FLOOR(arrowStart.x - arrowWidth));
                pt.y = arrowAnchor.y;
                CGContextAddLineToPoint(context, pt.x, pt.y);
            }


            pt.x = (FLOOR(xMin + radius));
            pt.y = yMax;
            CGContextAddLineToPoint(context, pt.x, pt.y);
            CGContextAddCurveToPoint(context, pt.x, pt.y, xMin, pt.y, xMin, (FLOOR(yMax - radius)));
            break;

        default:

            CGContextAddPath(context, CGPathWithRoundedRectangleInRect(frame, radius, radius, YES, YES, YES, YES));
    }

    CGContextClosePath(context);
    CGContextStrokePath(context);
    CGContextFillPath(context);
}
},["void","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPAttachedWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = CGRectMakeCopy(aContentRect);




    frameRect.origin.x -= 18;
    frameRect.origin.y -= 17;
    frameRect.size.width += 35;
    frameRect.size.height += 37;
    return frameRect;
}
},["CGRect","CGRect"])]);
}

