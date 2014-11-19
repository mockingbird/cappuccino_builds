@STATIC;1.0;I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;16;CABackingStore.ji;11;CGContext.ji;12;CGGeometry.jt;32079;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPRunLoop.j", NO);objj_executeFile("CABackingStore.j", YES);objj_executeFile("CGContext.j", YES);objj_executeFile("CGGeometry.j", YES);var CALayerGeometryBoundsMask = 1,
    CALayerGeometryPositionMask = 2,
    CALayerGeometryAnchorPointMask = 4,
    CALayerGeometryAffineTransformMask = 8,
    CALayerGeometryParentSublayerTransformMask = 16;
var USE_BUFFER = NO;
var CALayerFrameOriginUpdateMask = 1,
    CALayerFrameSizeUpdateMask = 2,
    CALayerZPositionUpdateMask = 4,
    CALayerDisplayUpdateMask = 8,
    CALayerCompositeUpdateMask = 16,
    CALayerDOMUpdateMask = CALayerZPositionUpdateMask | CALayerFrameOriginUpdateMask | CALayerFrameSizeUpdateMask;
var CALayerRegisteredRunLoopUpdates = nil;
{var the_class = objj_allocateClassPair(CPObject, "CALayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_frame"), new objj_ivar("_bounds"), new objj_ivar("_position"), new objj_ivar("_zPosition"), new objj_ivar("_anchorPoint"), new objj_ivar("_affineTransform"), new objj_ivar("_sublayerTransform"), new objj_ivar("_sublayerTransformForSublayers"), new objj_ivar("_backingStoreFrame"), new objj_ivar("_standardBackingStoreFrame"), new objj_ivar("_hasSublayerTransform"), new objj_ivar("_hasCustomBackingStoreFrame"), new objj_ivar("_opacity"), new objj_ivar("_isHidden"), new objj_ivar("_masksToBounds"), new objj_ivar("_backgroundColor"), new objj_ivar("_superlayer"), new objj_ivar("_sublayers"), new objj_ivar("_runLoopUpdateMask"), new objj_ivar("_needsDisplayOnBoundsChange"), new objj_ivar("_delegate"), new objj_ivar("_delegateRespondsToDisplayLayerSelector"), new objj_ivar("_delegateRespondsToDrawLayerInContextSelector"), new objj_ivar("_DOMElement"), new objj_ivar("_DOMContentsElement"), new objj_ivar("_contents"), new objj_ivar("_context"), new objj_ivar("_owningView"), new objj_ivar("_transformToLayer"), new objj_ivar("_transformFromLayer")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CALayer__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CALayer").super_class }, "init");
    if (self)
    {
        self._frame = CGRectMakeZero();
        self._backingStoreFrame = CGRectMakeZero();
        self._standardBackingStoreFrame = CGRectMakeZero();
        self._bounds = CGRectMakeZero();
        self._position = CGPointMakeZero();
        self._zPosition = 0.0;
        self._anchorPoint = CGPointMake(0.5, 0.5);
        self._affineTransform = CGAffineTransformMakeIdentity();
        self._sublayerTransform = CGAffineTransformMakeIdentity();
        self._transformToLayer = CGAffineTransformMakeIdentity();
        self._transformFromLayer = CGAffineTransformMakeIdentity();
        self._opacity = 1.0;
        self._isHidden = NO;
        self._masksToBounds = NO;
        self._sublayers = [];
        self._DOMElement = document.createElement("div");
        self._DOMElement.style.overflow = "visible";
        self._DOMElement.style.position = "absolute";
        self._DOMElement.style.visibility = "visible";
        self._DOMElement.style.top = "0px";
        self._DOMElement.style.left = "0px";
        self._DOMElement.style.zIndex = 0;
        self._DOMElement.style.width = "0px";
        self._DOMElement.style.height = "0px";
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("setBounds:"), function $CALayer__setBounds_(self, _cmd, aBounds)
{
    if (CGRectEqualToRect(self._bounds, aBounds))
        return;
    var oldOrigin = self._bounds.origin;
    self._bounds = CGRectMakeCopy(aBounds);
    if (self._hasSublayerTransform)
        _CALayerUpdateSublayerTransformForSublayers(self);
    _CALayerRecalculateGeometry(self, CALayerGeometryBoundsMask);
}
,["void","CGRect"]), new objj_method(sel_getUid("bounds"), function $CALayer__bounds(self, _cmd)
{
    return self._bounds;
}
,["CGRect"]), new objj_method(sel_getUid("setPosition:"), function $CALayer__setPosition_(self, _cmd, aPosition)
{
    if (CGPointEqualToPoint(self._position, aPosition))
        return;
    self._position = CGPointMakeCopy(aPosition);
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask);
}
,["void","CGPoint"]), new objj_method(sel_getUid("position"), function $CALayer__position(self, _cmd)
{
    return self._position;
}
,["CGPoint"]), new objj_method(sel_getUid("setZPosition:"), function $CALayer__setZPosition_(self, _cmd, aZPosition)
{
    if (self._zPosition == aZPosition)
        return;
    self._zPosition = aZPosition;
    self.isa.objj_msgSend1(self, "registerRunLoopUpdateWithMask:", CALayerZPositionUpdateMask);
}
,["void","int"]), new objj_method(sel_getUid("setAnchorPoint:"), function $CALayer__setAnchorPoint_(self, _cmd, anAnchorPoint)
{
    anAnchorPoint = CGPointMakeCopy(anAnchorPoint);
    anAnchorPoint.x = MIN(1.0, MAX(0.0, anAnchorPoint.x));
    anAnchorPoint.y = MIN(1.0, MAX(0.0, anAnchorPoint.y));
    if (CGPointEqualToPoint(self._anchorPoint, anAnchorPoint))
        return;
    self._anchorPoint = anAnchorPoint;
    if (self._hasSublayerTransform)
        _CALayerUpdateSublayerTransformForSublayers(self);
    if (self._owningView)
        self._position = CGPointMake(CGRectGetWidth(self._bounds) * self._anchorPoint.x, CGRectGetHeight(self._bounds) * self._anchorPoint.y);
    _CALayerRecalculateGeometry(self, CALayerGeometryAnchorPointMask);
}
,["void","CGPoint"]), new objj_method(sel_getUid("anchorPoint"), function $CALayer__anchorPoint(self, _cmd)
{
    return self._anchorPoint;
}
,["CGPoint"]), new objj_method(sel_getUid("setAffineTransform:"), function $CALayer__setAffineTransform_(self, _cmd, anAffineTransform)
{
    if (CGAffineTransformEqualToTransform(self._affineTransform, anAffineTransform))
        return;
    self._affineTransform = CGAffineTransformMakeCopy(anAffineTransform);
    _CALayerRecalculateGeometry(self, CALayerGeometryAffineTransformMask);
}
,["void","CGAffineTransform"]), new objj_method(sel_getUid("affineTransform"), function $CALayer__affineTransform(self, _cmd)
{
    return self._affineTransform;
}
,["CGAffineTransform"]), new objj_method(sel_getUid("setSublayerTransform:"), function $CALayer__setSublayerTransform_(self, _cmd, anAffineTransform)
{
    if (CGAffineTransformEqualToTransform(self._sublayerTransform, anAffineTransform))
        return;
    var hadSublayerTransform = self._hasSublayerTransform;
    self._sublayerTransform = CGAffineTransformMakeCopy(anAffineTransform);
    self._hasSublayerTransform = !CGAffineTransformIsIdentity(self._sublayerTransform);
    if (self._hasSublayerTransform)
    {
        _CALayerUpdateSublayerTransformForSublayers(self);
        var index = self._sublayers.length;
        while (index--)
            _CALayerRecalculateGeometry(self._sublayers[index], CALayerGeometryParentSublayerTransformMask);
    }
}
,["void","CGAffineTransform"]), new objj_method(sel_getUid("sublayerTransform"), function $CALayer__sublayerTransform(self, _cmd)
{
    return self._sublayerTransform;
}
,["CGAffineTransform"]), new objj_method(sel_getUid("transformToLayer"), function $CALayer__transformToLayer(self, _cmd)
{
    return self._transformToLayer;
}
,["CGAffineTransform"]), new objj_method(sel_getUid("setFrame:"), function $CALayer__setFrame_(self, _cmd, aFrame)
{
}
,["void","CGRect"]), new objj_method(sel_getUid("frame"), function $CALayer__frame(self, _cmd)
{
    if (!self._frame)
        self._frame = self.isa.objj_msgSend2(self, "convertRect:toLayer:", self._bounds, self._superlayer);
    return self._frame;
}
,["CGRect"]), new objj_method(sel_getUid("backingStoreFrame"), function $CALayer__backingStoreFrame(self, _cmd)
{
    return self._backingStoreFrame;
}
,["CGRect"]), new objj_method(sel_getUid("setBackingStoreFrame:"), function $CALayer__setBackingStoreFrame_(self, _cmd, aFrame)
{
    self._hasCustomBackingStoreFrame = aFrame != nil;
    if (aFrame == nil)
        aFrame = CGRectMakeCopy(self._standardBackingStoreFrame);
    else
    {
        if (self._superlayer)
        {
            aFrame = ((___r1 = self._superlayer), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertRect:toLayer:", aFrame, nil));
            var bounds = ((___r1 = self._superlayer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")),
                frame = ((___r1 = self._superlayer), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertRect:toLayer:", bounds, nil));
            aFrame.origin.x -= CGRectGetMinX(frame);
            aFrame.origin.y -= CGRectGetMinY(frame);
        }
        else
            aFrame = CGRectMakeCopy(aFrame);
    }
    if (!CGPointEqualToPoint(self._backingStoreFrame.origin, aFrame.origin))
        self.isa.objj_msgSend1(self, "registerRunLoopUpdateWithMask:", CALayerFrameOriginUpdateMask);
    if (!CGSizeEqualToSize(self._backingStoreFrame.size, aFrame.size))
        self.isa.objj_msgSend1(self, "registerRunLoopUpdateWithMask:", CALayerFrameSizeUpdateMask);
    self._backingStoreFrame = aFrame;
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("contents"), function $CALayer__contents(self, _cmd)
{
    return self._contents;
}
,["CGImage"]), new objj_method(sel_getUid("setContents:"), function $CALayer__setContents_(self, _cmd, contents)
{
    if (self._contents == contents)
        return;
    self._contents = contents;
    self.isa.objj_msgSend0(self, "composite");
}
,["void","CGImage"]), new objj_method(sel_getUid("composite"), function $CALayer__composite(self, _cmd)
{
    if (USE_BUFFER && !self._contents || !self._context)
        return;
    CGContextClearRect(self._context, CGRectMake(0.0, 0.0, CGRectGetWidth(self._backingStoreFrame), CGRectGetHeight(self._backingStoreFrame)));
    var transform;
    if (self._superlayer)
    {
        var superlayerTransform = _CALayerGetTransform(self._superlayer, nil),
            superlayerOrigin = CGPointApplyAffineTransform(self._superlayer._bounds.origin, superlayerTransform);
        transform = CGAffineTransformConcat(self._transformFromLayer, superlayerTransform);
        transform.tx -= superlayerOrigin.x;
        transform.ty -= superlayerOrigin.y;
    }
    else
        transform = CGAffineTransformCreateCopy(self._transformFromLayer);
    transform.tx -= CGRectGetMinX(self._backingStoreFrame);
    transform.ty -= CGRectGetMinY(self._backingStoreFrame);
    CGContextSaveGState(self._context);
    CGContextConcatCTM(self._context, transform);
    if (USE_BUFFER)
    {
        self._context.drawImage(self._contents.buffer, CGRectGetMinX(self._bounds), CGRectGetMinY(self._bounds));
    }
    else
        self.isa.objj_msgSend1(self, "drawInContext:", self._context);
    CGContextRestoreGState(self._context);
}
,["void"]), new objj_method(sel_getUid("display"), function $CALayer__display(self, _cmd)
{
    if (!self._context)
    {
        self._context = CGBitmapGraphicsContextCreate();
        self._DOMContentsElement = self._context.DOMElement;
        self._DOMContentsElement.style.zIndex = -100;
        self._DOMContentsElement.style.overflow = "hidden";
        self._DOMContentsElement.style.position = "absolute";
        self._DOMContentsElement.style.visibility = "visible";
        self._DOMContentsElement.width = ROUND(CGRectGetWidth(self._backingStoreFrame));
        self._DOMContentsElement.height = ROUND(CGRectGetHeight(self._backingStoreFrame));
        self._DOMContentsElement.style.top = "0px";
        self._DOMContentsElement.style.left = "0px";
        self._DOMContentsElement.style.width = ROUND(CGRectGetWidth(self._backingStoreFrame)) + "px";
        self._DOMContentsElement.style.height = ROUND(CGRectGetHeight(self._backingStoreFrame)) + "px";
        self._DOMElement.appendChild(self._DOMContentsElement);
    }
    if (USE_BUFFER)
    {
        if (self._delegateRespondsToDisplayLayerSelector)
            return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "displayInLayer:", self));
        if (CGRectGetWidth(self._backingStoreFrame) == 0.0 || CGRectGetHeight(self._backingStoreFrame) == 0.0)
            return;
        if (!self._contents)
            self._contents = CABackingStoreCreate();
        CABackingStoreSetSize(self._contents, self._bounds.size);
        self.isa.objj_msgSend1(self, "drawInContext:", CABackingStoreGetContext(self._contents));
    }
    self.isa.objj_msgSend0(self, "composite");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("drawInContext:"), function $CALayer__drawInContext_(self, _cmd, aContext)
{
    if (self._backgroundColor)
    {
        CGContextSetFillColor(aContext, self._backgroundColor);
        CGContextFillRect(aContext, self._bounds);
    }
    if (self._delegateRespondsToDrawLayerInContextSelector)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "drawLayer:inContext:", self, aContext));
    var ___r1;
}
,["void","CGContext"]), new objj_method(sel_getUid("opacity"), function $CALayer__opacity(self, _cmd)
{
    return self._opacity;
}
,["float"]), new objj_method(sel_getUid("setOpacity:"), function $CALayer__setOpacity_(self, _cmd, anOpacity)
{
    if (self._opacity == anOpacity)
        return;
    self._opacity = anOpacity;
    self._DOMElement.style.opacity = anOpacity;
    self._DOMElement.style.filter = "alpha(opacity=" + anOpacity * 100 + ")";
}
,["void","float"]), new objj_method(sel_getUid("setHidden:"), function $CALayer__setHidden_(self, _cmd, isHidden)
{
    self._isHidden = isHidden;
    self._DOMElement.style.display = isHidden ? "none" : "block";
}
,["void","BOOL"]), new objj_method(sel_getUid("hidden"), function $CALayer__hidden(self, _cmd)
{
    return self._isHidden;
}
,["BOOL"]), new objj_method(sel_getUid("isHidden"), function $CALayer__isHidden(self, _cmd)
{
    return self._isHidden;
}
,["BOOL"]), new objj_method(sel_getUid("setMasksToBounds:"), function $CALayer__setMasksToBounds_(self, _cmd, masksToBounds)
{
    if (self._masksToBounds == masksToBounds)
        return;
    self._masksToBounds = masksToBounds;
    self._DOMElement.style.overflow = self._masksToBounds ? "hidden" : "visible";
}
,["void","BOOL"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CALayer__setBackgroundColor_(self, _cmd, aColor)
{
    self._backgroundColor = aColor;
    self.isa.objj_msgSend0(self, "setNeedsDisplay");
}
,["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CALayer__backgroundColor(self, _cmd)
{
    return self._backgroundColor;
}
,["CPColor"]), new objj_method(sel_getUid("sublayers"), function $CALayer__sublayers(self, _cmd)
{
    return self._sublayers;
}
,["CPArray"]), new objj_method(sel_getUid("superlayer"), function $CALayer__superlayer(self, _cmd)
{
    return self._superlayer;
}
,["CALayer"]), new objj_method(sel_getUid("addSublayer:"), function $CALayer__addSublayer_(self, _cmd, aLayer)
{
    self.isa.objj_msgSend2(self, "insertSublayer:atIndex:", aLayer, self._sublayers.length);
}
,["void","CALayer"]), new objj_method(sel_getUid("removeFromSuperlayer"), function $CALayer__removeFromSuperlayer(self, _cmd)
{
    if (self._owningView)
        ((___r1 = self._owningView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLayer:", nil));
    if (!self._superlayer)
        return;
    self._superlayer._DOMElement.removeChild(self._DOMElement);
    ((___r1 = self._superlayer._sublayers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", self));
    self._superlayer = nil;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("insertSublayer:atIndex:"), function $CALayer__insertSublayer_atIndex_(self, _cmd, aLayer, anIndex)
{
    if (!aLayer)
        return;
    var superlayer = (aLayer == null ? null : aLayer.isa.objj_msgSend0(aLayer, "superlayer"));
    if (superlayer == self)
    {
        var index = ((___r1 = self._sublayers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aLayer));
        if (index == anIndex)
            return;
        ((___r1 = self._sublayers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", index));
        if (index < anIndex)
            --anIndex;
    }
    else if (superlayer != nil)
        (aLayer == null ? null : aLayer.isa.objj_msgSend0(aLayer, "removeFromSuperlayer"));
    if (self._DOMContentsElement && aLayer._zPosition > self._DOMContentsElement.style.zIndex)
        self._DOMContentsElement.style.zIndex -= 100.0;
    ((___r1 = self._sublayers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", aLayer, anIndex));
    if (anIndex >= self._sublayers.length - 1)
        self._DOMElement.appendChild(aLayer._DOMElement);
    else
        self._DOMElement.insertBefore(aLayer._DOMElement, self._sublayers[anIndex + 1]._DOMElement);
    aLayer._superlayer = self;
    if (self != superlayer)
        _CALayerRecalculateGeometry(aLayer, 0xFFFFFFF);
    var ___r1;
}
,["void","CALayer","CPUInteger"]), new objj_method(sel_getUid("insertSublayer:below:"), function $CALayer__insertSublayer_below_(self, _cmd, aLayer, aSublayer)
{
    var index = aSublayer ? ((___r1 = self._sublayers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aSublayer)) : 0;
    self.isa.objj_msgSend2(self, "insertSublayer:atIndex:", aLayer, index == CPNotFound ? self._sublayers.length : index);
    var ___r1;
}
,["void","CALayer","CALayer"]), new objj_method(sel_getUid("insertSublayer:above:"), function $CALayer__insertSublayer_above_(self, _cmd, aLayer, aSublayer)
{
    var index = aSublayer ? ((___r1 = self._sublayers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aSublayer)) : self._sublayers.length;
    if (index == CPNotFound)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", "CALayerNotFoundException", "aSublayer is not a sublayer of this layer");
    ((___r1 = self._sublayers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", aLayer, index == CPNotFound ? self._sublayers.length : index + 1));
    var ___r1;
}
,["void","CALayer","CALayer"]), new objj_method(sel_getUid("replaceSublayer:with:"), function $CALayer__replaceSublayer_with_(self, _cmd, aSublayer, aLayer)
{
    if (aSublayer == aLayer)
        return;
    if (aSublayer._superlayer != self)
    {
        CPLog.warn("Attempt to replace a sublayer (%s) which is not in the sublayers of the receiver (%s).", (aSublayer == null ? null : aSublayer.isa.objj_msgSend0(aSublayer, "description")), self.isa.objj_msgSend0(self, "description"));
        return;
    }
    if (self._DOMContentsElement && aLayer._zPosition > self._DOMContentsElement.style.zIndex)
        self._DOMContentsElement.style.zIndex -= 100.0;
    ((___r1 = self._sublayers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "replaceObjectAtIndex:withObject:", ((___r2 = self._sublayers), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "indexOfObjectIdenticalTo:", aSublayer)), aLayer));
    self._DOMElement.replaceChild(aSublayer._DOMElement, aLayer._DOMElement);
    var ___r1, ___r2;
}
,["void","CALayer","CALayer"]), new objj_method(sel_getUid("registerRunLoopUpdateWithMask:"), function $CALayer__registerRunLoopUpdateWithMask_(self, _cmd, anUpdateMask)
{
    if (CALayerRegisteredRunLoopUpdates == nil)
    {
        CALayerRegisteredRunLoopUpdates = {};
        ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "performSelector:target:argument:order:modes:", sel_getUid("runLoopUpdateLayers"), CALayer, nil, 0, [CPDefaultRunLoopMode]));
    }
    self._runLoopUpdateMask |= anUpdateMask;
    CALayerRegisteredRunLoopUpdates[self.isa.objj_msgSend0(self, "UID")] = self;
    var ___r1;
}
,["void","unsigned"]), new objj_method(sel_getUid("setNeedsComposite"), function $CALayer__setNeedsComposite(self, _cmd)
{
    self.isa.objj_msgSend1(self, "registerRunLoopUpdateWithMask:", CALayerCompositeUpdateMask);
}
,["void"]), new objj_method(sel_getUid("setNeedsDisplay"), function $CALayer__setNeedsDisplay(self, _cmd)
{
    self.isa.objj_msgSend1(self, "registerRunLoopUpdateWithMask:", CALayerDisplayUpdateMask);
}
,["void"]), new objj_method(sel_getUid("setNeedsDisplayOnBoundsChange:"), function $CALayer__setNeedsDisplayOnBoundsChange_(self, _cmd, needsDisplayOnBoundsChange)
{
    self._needsDisplayOnBoundsChange = needsDisplayOnBoundsChange;
}
,["void","BOOL"]), new objj_method(sel_getUid("needsDisplayOnBoundsChange"), function $CALayer__needsDisplayOnBoundsChange(self, _cmd)
{
    return self._needsDisplayOnBoundsChange;
}
,["BOOL"]), new objj_method(sel_getUid("setNeedsDisplayInRect:"), function $CALayer__setNeedsDisplayInRect_(self, _cmd, aRect)
{
    self.isa.objj_msgSend0(self, "display");
}
,["void","CGRect"]), new objj_method(sel_getUid("convertPoint:fromLayer:"), function $CALayer__convertPoint_fromLayer_(self, _cmd, aPoint, aLayer)
{
    return CGPointApplyAffineTransform(aPoint, _CALayerGetTransform(aLayer, self));
}
,["CGPoint","CGPoint","CALayer"]), new objj_method(sel_getUid("convertPoint:toLayer:"), function $CALayer__convertPoint_toLayer_(self, _cmd, aPoint, aLayer)
{
    return CGPointApplyAffineTransform(aPoint, _CALayerGetTransform(self, aLayer));
}
,["CGPoint","CGPoint","CALayer"]), new objj_method(sel_getUid("convertRect:fromLayer:"), function $CALayer__convertRect_fromLayer_(self, _cmd, aRect, aLayer)
{
    return CGRectApplyAffineTransform(aRect, _CALayerGetTransform(aLayer, self));
}
,["CGRect","CGRect","CALayer"]), new objj_method(sel_getUid("convertRect:toLayer:"), function $CALayer__convertRect_toLayer_(self, _cmd, aRect, aLayer)
{
    return CGRectApplyAffineTransform(aRect, _CALayerGetTransform(self, aLayer));
}
,["CGRect","CGRect","CALayer"]), new objj_method(sel_getUid("containsPoint:"), function $CALayer__containsPoint_(self, _cmd, aPoint)
{
    return CGRectContainsPoint(self._bounds, aPoint);
}
,["BOOL","CGPoint"]), new objj_method(sel_getUid("hitTest:"), function $CALayer__hitTest_(self, _cmd, aPoint)
{
    if (self._isHidden)
        return nil;
    var point = CGPointApplyAffineTransform(aPoint, self._transformToLayer);
    if (!CGRectContainsPoint(self._bounds, point))
        return nil;
    var layer = nil,
        index = self._sublayers.length;
    while (index--)
        if (layer = ((___r1 = self._sublayers[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "hitTest:", point)))
            return layer;
    return self;
    var ___r1;
}
,["CALayer","CGPoint"]), new objj_method(sel_getUid("setDelegate:"), function $CALayer__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate == aDelegate)
        return;
    self._delegate = aDelegate;
    self._delegateRespondsToDisplayLayerSelector = ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("displayLayer:")));
    self._delegateRespondsToDrawLayerInContextSelector = ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("drawLayer:inContext:")));
    if (self._delegateRespondsToDisplayLayerSelector || self._delegateRespondsToDrawLayerInContextSelector)
        self.isa.objj_msgSend0(self, "setNeedsDisplay");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CALayer__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("_setOwningView:"), function $CALayer___setOwningView_(self, _cmd, anOwningView)
{
    self._owningView = anOwningView;
    if (self._owningView)
    {
        self._owningView = anOwningView;
        self._bounds.size = CGSizeMakeCopy(((___r1 = self._owningView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")).size);
        self._position = CGPointMake(CGRectGetWidth(self._bounds) * self._anchorPoint.x, CGRectGetHeight(self._bounds) * self._anchorPoint.y);
    }
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask | CALayerGeometryBoundsMask);
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("_owningViewBoundsChanged"), function $CALayer___owningViewBoundsChanged(self, _cmd)
{
    self._bounds.size = CGSizeMakeCopy(((___r1 = self._owningView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")).size);
    self._position = CGPointMake(CGRectGetWidth(self._bounds) * self._anchorPoint.x, CGRectGetHeight(self._bounds) * self._anchorPoint.y);
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask | CALayerGeometryBoundsMask);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_update"), function $CALayer___update(self, _cmd)
{
    window.loop = true;
    var mask = self._runLoopUpdateMask;
    if (mask & CALayerDOMUpdateMask)
        _CALayerUpdateDOM(self, mask);
    if (mask & CALayerDisplayUpdateMask)
        self.isa.objj_msgSend0(self, "display");
    else if (mask & CALayerFrameSizeUpdateMask || mask & CALayerCompositeUpdateMask)
        self.isa.objj_msgSend0(self, "composite");
    self._runLoopUpdateMask = 0;
    window.loop = false;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("layer"), function $CALayer__layer(self, _cmd)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1, ___r2;
}
,["CALayer"]), new objj_method(sel_getUid("runLoopUpdateLayers"), function $CALayer__runLoopUpdateLayers(self, _cmd)
{
    for (UID in CALayerRegisteredRunLoopUpdates)
    {
        var layer = CALayerRegisteredRunLoopUpdates[UID],
            mask = layer._runLoopUpdateMask;
        if (mask & CALayerDOMUpdateMask)
            _CALayerUpdateDOM(layer, mask);
        if (mask & CALayerDisplayUpdateMask)
            (layer == null ? null : layer.isa.objj_msgSend0(layer, "display"));
        else if (mask & CALayerFrameSizeUpdateMask || mask & CALayerCompositeUpdateMask)
            (layer == null ? null : layer.isa.objj_msgSend0(layer, "composite"));
        layer._runLoopUpdateMask = 0;
    }
    window.loop = false;
    CALayerRegisteredRunLoopUpdates = nil;
}
,["void"])]);
}_CALayerUpdateSublayerTransformForSublayers = function(aLayer)
{
    var bounds = aLayer._bounds,
        anchorPoint = aLayer._anchorPoint,
        translateX = CGRectGetWidth(bounds) * anchorPoint.x,
        translateY = CGRectGetHeight(bounds) * anchorPoint.y;
    aLayer._sublayerTransformForSublayers = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-translateX, -translateY), CGAffineTransformConcat(aLayer._sublayerTransform, CGAffineTransformMakeTranslation(translateX, translateY)));
}
_CALayerUpdateDOM = function(aLayer, aMask)
{
    var DOMElementStyle = aLayer._DOMElement.style;
    if (aMask & CALayerZPositionUpdateMask)
        DOMElementStyle.zIndex = aLayer._zPosition;
    var frame = aLayer._backingStoreFrame;
    if (aMask & CALayerFrameOriginUpdateMask)
    {
        DOMElementStyle.top = ROUND(CGRectGetMinY(frame)) + "px";
        DOMElementStyle.left = ROUND(CGRectGetMinX(frame)) + "px";
    }
    if (aMask & CALayerFrameSizeUpdateMask)
    {
        var width = MAX(0.0, ROUND(CGRectGetWidth(frame))),
            height = MAX(0.0, ROUND(CGRectGetHeight(frame))),
            DOMContentsElement = aLayer._DOMContentsElement;
        DOMElementStyle.width = width + "px";
        DOMElementStyle.height = height + "px";
        if (DOMContentsElement)
        {
            DOMContentsElement.width = width;
            DOMContentsElement.height = height;
            DOMContentsElement.style.width = width + "px";
            DOMContentsElement.style.height = height + "px";
        }
    }
}
_CALayerRecalculateGeometry = function(aLayer, aGeometryChange)
{
    var bounds = aLayer._bounds,
        superlayer = aLayer._superlayer,
        width = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds),
        position = aLayer._position,
        anchorPoint = aLayer._anchorPoint,
        affineTransform = aLayer._affineTransform,
        backingStoreFrameSize = CGSizeMakeCopy(aLayer._backingStoreFrame),
        hasCustomBackingStoreFrame = aLayer._hasCustomBackingStoreFrame;
    aLayer._transformFromLayer = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-width * anchorPoint.x - CGRectGetMinX(aLayer._bounds), -height * anchorPoint.y - CGRectGetMinY(aLayer._bounds)), CGAffineTransformConcat(affineTransform, CGAffineTransformMakeTranslation(position.x, position.y)));
    if (superlayer && superlayer._hasSublayerTransform)
    {
        CGAffineTransformConcatTo(aLayer._transformFromLayer, superlayer._sublayerTransformForSublayers, aLayer._transformFromLayer);
    }
    aLayer._transformToLayer = CGAffineTransformInvert(aLayer._transformFromLayer);
    aLayer._frame = nil;
    aLayer._standardBackingStoreFrame = (aLayer == null ? null : aLayer.isa.objj_msgSend2(aLayer, "convertRect:toLayer:", bounds, nil));
    if (superlayer)
    {
        var bounds = (superlayer == null ? null : superlayer.isa.objj_msgSend0(superlayer, "bounds")),
            frame = (superlayer == null ? null : superlayer.isa.objj_msgSend2(superlayer, "convertRect:toLayer:", bounds, nil));
        aLayer._standardBackingStoreFrame.origin.x -= CGRectGetMinX(frame);
        aLayer._standardBackingStoreFrame.origin.y -= CGRectGetMinY(frame);
    }
    var origin = aLayer._standardBackingStoreFrame.origin,
        size = aLayer._standardBackingStoreFrame.size;
    origin.x = FLOOR(origin.x);
    origin.y = FLOOR(origin.y);
    size.width = CEIL(size.width) + 1.0;
    size.height = CEIL(size.height) + 1.0;
    if (!hasCustomBackingStoreFrame)
    {
        var backingStoreFrame = CGRectMakeCopy(aLayer._standardBackingStoreFrame);
        if (ROUND(CGRectGetMinX(backingStoreFrame)) != ROUND(CGRectGetMinX(aLayer._backingStoreFrame)) || ROUND(CGRectGetMinY(backingStoreFrame)) != ROUND(CGRectGetMinY(aLayer._backingStoreFrame)))
            (aLayer == null ? null : aLayer.isa.objj_msgSend1(aLayer, "registerRunLoopUpdateWithMask:", CALayerFrameOriginUpdateMask));
        if (CGRectGetWidth(backingStoreFrame) != ROUND(CGRectGetWidth(aLayer._backingStoreFrame)) || CGRectGetHeight(backingStoreFrame) != ROUND(CGRectGetHeight(aLayer._backingStoreFrame)))
            (aLayer == null ? null : aLayer.isa.objj_msgSend1(aLayer, "registerRunLoopUpdateWithMask:", CALayerFrameSizeUpdateMask));
        aLayer._backingStoreFrame = backingStoreFrame;
    }
    if (aGeometryChange & CALayerGeometryBoundsMask && aLayer._needsDisplayOnBoundsChange)
        (aLayer == null ? null : aLayer.isa.objj_msgSend0(aLayer, "setNeedsDisplay"));
    else if (hasCustomBackingStoreFrame || aGeometryChange & ~(CALayerGeometryPositionMask | CALayerGeometryAnchorPointMask))
        (aLayer == null ? null : aLayer.isa.objj_msgSend0(aLayer, "setNeedsComposite"));
    var sublayers = aLayer._sublayers,
        index = 0,
        count = sublayers.length;
    for (; index < count; ++index)
        _CALayerRecalculateGeometry(sublayers[index], aGeometryChange);
}
_CALayerGetTransform = function(fromLayer, toLayer)
{
    var transform = CGAffineTransformMakeIdentity();
    if (fromLayer)
    {
        var layer = fromLayer;
        while (layer && layer != toLayer)
        {
            var transformFromLayer = layer._transformFromLayer;
            CGAffineTransformConcatTo(transform, transformFromLayer, transform);
            layer = layer._superlayer;
        }
        if (layer == toLayer)
            return transform;
    }
    var layers = [],
        layer = toLayer;
    while (layer)
    {
        layers.push(layer);
        layer = layer._superlayer;
    }
    var index = layers.length;
    while (index--)
    {
        var transformToLayer = layers[index]._transformToLayer;
        CGAffineTransformConcatTo(transform, transformToLayer, transform);
    }
    return transform;
}
