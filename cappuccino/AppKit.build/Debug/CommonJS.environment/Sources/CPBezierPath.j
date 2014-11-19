@STATIC;1.0;I;21;Foundation/CPObject.ji;19;CPGraphicsContext.jt;10266;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPGraphicsContext.j", YES);var DefaultLineWidth = 1.0;
{var the_class = objj_allocateClassPair(CPObject, "CPBezierPath"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_path"), new objj_ivar("_lineWidth"), new objj_ivar("_lineDashes"), new objj_ivar("_lineDashesPhase")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPBezierPath__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBezierPath").super_class }, "init"))
    {
        self._path = CGPathCreateMutable();
        self._lineWidth = ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultLineWidth"));
        self._lineDashesPhase = 0;
        self._lineDashes = [];
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("moveToPoint:"), function $CPBezierPath__moveToPoint_(self, _cmd, point)
{
    CGPathMoveToPoint(self._path, nil, point.x, point.y);
}
,["void","CGPoint"]), new objj_method(sel_getUid("lineToPoint:"), function $CPBezierPath__lineToPoint_(self, _cmd, point)
{
    CGPathAddLineToPoint(self._path, nil, point.x, point.y);
}
,["void","CGPoint"]), new objj_method(sel_getUid("curveToPoint:controlPoint1:controlPoint2:"), function $CPBezierPath__curveToPoint_controlPoint1_controlPoint2_(self, _cmd, endPoint, controlPoint1, controlPoint2)
{
    CGPathAddCurveToPoint(self._path, nil, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, endPoint.x, endPoint.y);
}
,["void","CGPoint","CGPoint","CGPoint"]), new objj_method(sel_getUid("bounds"), function $CPBezierPath__bounds(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "controlPointBounds");
}
,["CGRect"]), new objj_method(sel_getUid("controlPointBounds"), function $CPBezierPath__controlPointBounds(self, _cmd)
{
    return CGPathGetBoundingBox(self._path);
}
,["CGRect"]), new objj_method(sel_getUid("closePath"), function $CPBezierPath__closePath(self, _cmd)
{
    CGPathCloseSubpath(self._path);
}
,["void"]), new objj_method(sel_getUid("stroke"), function $CPBezierPath__stroke(self, _cmd)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextBeginPath(ctx);
    CGContextAddPath(ctx, self._path);
    CGContextSetLineWidth(ctx, self.isa.objj_msgSend0(self, "lineWidth"));
    CGContextSetLineDash(ctx, self._lineDashesPhase, self._lineDashes);
    CGContextStrokePath(ctx);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("fill"), function $CPBezierPath__fill(self, _cmd)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextBeginPath(ctx);
    CGContextAddPath(ctx, self._path);
    CGContextSetLineWidth(ctx, self.isa.objj_msgSend0(self, "lineWidth"));
    CGContextSetLineDash(ctx, self._lineDashesPhase, self._lineDashes);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("getLineDash:count:phase:"), function $CPBezierPath__getLineDash_count_phase_(self, _cmd, patternRef, count, phaseRef)
{
    return self.isa.objj_msgSend2(self, "getLineDash:phase:", patternRef, phaseRef);
}
,["void","CPArrayRef","NSInteger","CGFloatRef"]), new objj_method(sel_getUid("getLineDash:phase:"), function $CPBezierPath__getLineDash_phase_(self, _cmd, patternRef, phaseRef)
{
    if (patternRef)
        (patternRef)(((___r1 = self._lineDashes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy")));
    if (phaseRef)
        (phaseRef)(self._lineDashesPhase);
    var ___r1;
}
,["void","CPArrayRef","CGFloatRef"]), new objj_method(sel_getUid("setLineDash:count:phase:"), function $CPBezierPath__setLineDash_count_phase_(self, _cmd, aPattern, count, aPhase)
{
    self.isa.objj_msgSend2(self, "setLineDash:phase:", aPattern, aPhase);
}
,["void","CPArray","NSInteger","CGFloat"]), new objj_method(sel_getUid("setLineDash:phase:"), function $CPBezierPath__setLineDash_phase_(self, _cmd, aPattern, aPhase)
{
    self._lineDashes = aPattern;
    self._lineDashesPhase = aPhase;
}
,["void","CPArray","CGFloat"]), new objj_method(sel_getUid("lineWidth"), function $CPBezierPath__lineWidth(self, _cmd)
{
    return self._lineWidth;
}
,["float"]), new objj_method(sel_getUid("setLineWidth:"), function $CPBezierPath__setLineWidth_(self, _cmd, lineWidth)
{
    self._lineWidth = lineWidth;
}
,["void","float"]), new objj_method(sel_getUid("elementCount"), function $CPBezierPath__elementCount(self, _cmd)
{
    return self._path.count;
}
,["unsigned"]), new objj_method(sel_getUid("isEmpty"), function $CPBezierPath__isEmpty(self, _cmd)
{
    return CGPathIsEmpty(self._path);
}
,["BOOL"]), new objj_method(sel_getUid("currentPoint"), function $CPBezierPath__currentPoint(self, _cmd)
{
    return CGPathGetCurrentPoint(self._path);
}
,["CGPoint"]), new objj_method(sel_getUid("appendBezierPathWithPoints:count:"), function $CPBezierPath__appendBezierPathWithPoints_count_(self, _cmd, points, count)
{
    CGPathAddLines(self._path, nil, points, count);
}
,["void","CPArray","unsigned"]), new objj_method(sel_getUid("appendBezierPathWithRect:"), function $CPBezierPath__appendBezierPathWithRect_(self, _cmd, rect)
{
    CGPathAddRect(self._path, nil, rect);
}
,["void","CGRect"]), new objj_method(sel_getUid("appendBezierPathWithOvalInRect:"), function $CPBezierPath__appendBezierPathWithOvalInRect_(self, _cmd, rect)
{
    CGPathAddPath(self._path, nil, CGPathWithEllipseInRect(rect));
}
,["void","CGRect"]), new objj_method(sel_getUid("appendBezierPathWithRoundedRect:xRadius:yRadius:"), function $CPBezierPath__appendBezierPathWithRoundedRect_xRadius_yRadius_(self, _cmd, rect, xRadius, yRadius)
{
    CGPathAddPath(self._path, nil, CGPathWithRoundedRectangleInRect(rect, xRadius, yRadius, YES, YES, YES, YES));
}
,["void","CGRect","float","float"]), new objj_method(sel_getUid("appendBezierPathWithArcFromPoint:toPoint:radius:"), function $CPBezierPath__appendBezierPathWithArcFromPoint_toPoint_radius_(self, _cmd, fromPoint, toPoint, radius)
{
    CGPathAddArcToPoint(self._path, null, fromPoint.x, fromPoint.y, toPoint.x, toPoint.y, radius);
}
,["void","CGPoint","CGPoint","float"]), new objj_method(sel_getUid("appendBezierPath:"), function $CPBezierPath__appendBezierPath_(self, _cmd, other)
{
    CGPathAddPath(self._path, nil, other._path);
}
,["void","CPBezierPath"]), new objj_method(sel_getUid("removeAllPoints"), function $CPBezierPath__removeAllPoints(self, _cmd)
{
    self._path = CGPathCreateMutable();
}
,["void"]), new objj_method(sel_getUid("addClip"), function $CPBezierPath__addClip(self, _cmd)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextAddPath(ctx, self._path);
    CGContextClip(ctx);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setClip"), function $CPBezierPath__setClip(self, _cmd)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextBeginPath(ctx);
    CGContextAddPath(ctx, self._path);
    CGContextClip(ctx);
    var ___r1;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("bezierPath"), function $CPBezierPath__bezierPath(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["CPBezierPath"]), new objj_method(sel_getUid("bezierPathWithOvalInRect:"), function $CPBezierPath__bezierPathWithOvalInRect_(self, _cmd, aRect)
{
    var path = self.isa.objj_msgSend0(self, "bezierPath");
    (path == null ? null : path.isa.objj_msgSend1(path, "appendBezierPathWithOvalInRect:", aRect));
    return path;
}
,["CPBezierPath","CGRect"]), new objj_method(sel_getUid("bezierPathWithRect:"), function $CPBezierPath__bezierPathWithRect_(self, _cmd, aRect)
{
    var path = self.isa.objj_msgSend0(self, "bezierPath");
    (path == null ? null : path.isa.objj_msgSend1(path, "appendBezierPathWithRect:", aRect));
    return path;
}
,["CPBezierPath","CGRect"]), new objj_method(sel_getUid("bezierPathWithRoundedRect:xRadius:yRadius:"), function $CPBezierPath__bezierPathWithRoundedRect_xRadius_yRadius_(self, _cmd, aRect, xRadius, yRadius)
{
    var path = self.isa.objj_msgSend0(self, "bezierPath");
    (path == null ? null : path.isa.objj_msgSend3(path, "appendBezierPathWithRoundedRect:xRadius:yRadius:", aRect, xRadius, yRadius));
    return path;
}
,["CPBezierPath","CGRect","float","float"]), new objj_method(sel_getUid("defaultLineWidth"), function $CPBezierPath__defaultLineWidth(self, _cmd)
{
    return DefaultLineWidth;
}
,["float"]), new objj_method(sel_getUid("setDefaultLineWidth:"), function $CPBezierPath__setDefaultLineWidth_(self, _cmd, width)
{
    DefaultLineWidth = width;
}
,["void","float"]), new objj_method(sel_getUid("fillRect:"), function $CPBezierPath__fillRect_(self, _cmd, aRect)
{
    ((___r1 = self.isa.objj_msgSend1(self, "bezierPathWithRect:", aRect)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "fill"));
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("strokeRect:"), function $CPBezierPath__strokeRect_(self, _cmd, aRect)
{
    ((___r1 = self.isa.objj_msgSend1(self, "bezierPathWithRect:", aRect)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "stroke"));
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("strokeLineFromPoint:toPoint:"), function $CPBezierPath__strokeLineFromPoint_toPoint_(self, _cmd, point1, point2)
{
    var path = self.isa.objj_msgSend0(self, "bezierPath");
    (path == null ? null : path.isa.objj_msgSend1(path, "moveToPoint:", point1));
    (path == null ? null : path.isa.objj_msgSend1(path, "lineToPoint:", point2));
    (path == null ? null : path.isa.objj_msgSend0(path, "stroke"));
}
,["void","CGPoint","CGPoint"])]);
}