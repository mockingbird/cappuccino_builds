@STATIC;1.0;i;13;CPAnimation.ji;11;CPControl.ji;20;CPWindow_Constants.ji;17;CPViewAnimation.jt;30317;objj_executeFile("CPAnimation.j", YES);objj_executeFile("CPControl.j", YES);objj_executeFile("CPWindow_Constants.j", YES);objj_executeFile("CPViewAnimation.j", YES);CPScrollerNoPart = 0;
CPScrollerDecrementPage = 1;
CPScrollerKnob = 2;
CPScrollerIncrementPage = 3;
CPScrollerDecrementLine = 4;
CPScrollerIncrementLine = 5;
CPScrollerKnobSlot = 6;
CPScrollerIncrementArrow = 0;
CPScrollerDecrementArrow = 1;
CPNoScrollerParts = 0;
CPOnlyScrollerArrows = 1;
CPAllScrollerParts = 2;
var PARTS_ARRANGEMENT = [CPScrollerKnobSlot, CPScrollerDecrementLine, CPScrollerIncrementLine, CPScrollerKnob],
    NAMES_FOR_PARTS = {},
    PARTS_FOR_NAMES = {};
var _CACHED_THEME_SCROLLER = nil;
NAMES_FOR_PARTS[CPScrollerDecrementLine] = "decrement-line";
NAMES_FOR_PARTS[CPScrollerIncrementLine] = "increment-line";
NAMES_FOR_PARTS[CPScrollerKnobSlot] = "knob-slot";
NAMES_FOR_PARTS[CPScrollerKnob] = "knob";
CPScrollerStyleLegacy = 0;
CPScrollerStyleOverlay = 1;
CPScrollerKnobStyleDefault = 0;
CPScrollerKnobStyleDark = 1;
CPScrollerKnobStyleLight = 2;
CPThemeStateScrollViewLegacy = CPThemeState("scroller-style-legacy");
CPThemeStateScrollerKnobLight = CPThemeState("scroller-knob-light");
CPThemeStateScrollerKnobDark = CPThemeState("scroller-knob-dark");
{var the_class = objj_allocateClassPair(CPControl, "CPScroller"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_controlSize"), new objj_ivar("_usableParts"), new objj_ivar("_partRects"), new objj_ivar("_isVertical"), new objj_ivar("_knobProportion"), new objj_ivar("_hitPart"), new objj_ivar("_trackingPart"), new objj_ivar("_trackingFloatValue"), new objj_ivar("_trackingStartPoint"), new objj_ivar("_animationScroller"), new objj_ivar("_allowFadingOut"), new objj_ivar("_style"), new objj_ivar("_timerFadeOut"), new objj_ivar("_isMouseOver")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isVertical"), function $CPScroller__isVertical(self, _cmd)
{
    return self._isVertical;
}
,["BOOL"]), new objj_method(sel_getUid("allowFadingOut"), function $CPScroller__allowFadingOut(self, _cmd)
{
    return self._allowFadingOut;
}
,["BOOL"]), new objj_method(sel_getUid("_setAllowFadingOut:"), function $CPScroller___setAllowFadingOut_(self, _cmd, newValue)
{
    self._allowFadingOut = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("initWithFrame:"), function $CPScroller__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "initWithFrame:", aFrame))
    {
        self._controlSize = CPRegularControlSize;
        self._partRects = [];
        objj_msgSend(self, "setFloatValue:", 0.0);
        objj_msgSend(self, "setKnobProportion:", 1.0);
        self._hitPart = CPScrollerNoPart;
        self._allowFadingOut = YES;
        self._isMouseOver = NO;
        self._style = CPScrollerStyleOverlay;
        var paramAnimFadeOut = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self, CPViewAnimationTargetKey, CPViewAnimationFadeOutEffect, CPViewAnimationEffectKey);
        self._animationScroller = objj_msgSend(objj_msgSend(CPViewAnimation, "alloc"), "initWithDuration:animationCurve:", 0.2, CPAnimationEaseInOut);
        objj_msgSend(self._animationScroller, "setViewAnimations:", [paramAnimFadeOut]);
        objj_msgSend(self._animationScroller, "setDelegate:", self);
        objj_msgSend(self, "setAlphaValue:", 0.0);
        objj_msgSend(self, "_setIsVertical:", CGRectGetHeight(aFrame) >= CGRectGetWidth(aFrame));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("style"), function $CPScroller__style(self, _cmd)
{
    return self._style;
}
,["void"]), new objj_method(sel_getUid("setStyle:"), function $CPScroller__setStyle_(self, _cmd, aStyle)
{
    if (self._style != nil && self._style === aStyle)
        return;
    self._style = aStyle;
    if (self._style === CPScrollerStyleLegacy)
    {
        objj_msgSend(self, "fadeIn");
        objj_msgSend(self, "setThemeState:", CPThemeStateScrollViewLegacy);
    }
    else
    {
        self._allowFadingOut = YES;
        objj_msgSend(self, "unsetThemeState:", CPThemeStateScrollViewLegacy);
    }
}
,["void","id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPScroller__setObjectValue_(self, _cmd, aValue)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "setObjectValue:", MIN(1.0, MAX(0.0, +aValue)));
}
,["void","id"]), new objj_method(sel_getUid("controlSize"), function $CPScroller__controlSize(self, _cmd)
{
    return self._controlSize;
}
,["CPControlSize"]), new objj_method(sel_getUid("setControlSize:"), function $CPScroller__setControlSize_(self, _cmd, aControlSize)
{
    if (self._controlSize == aControlSize)
        return;
    self._controlSize = aControlSize;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPControlSize"]), new objj_method(sel_getUid("knobProportion"), function $CPScroller__knobProportion(self, _cmd)
{
    return self._knobProportion;
}
,["float"]), new objj_method(sel_getUid("setKnobProportion:"), function $CPScroller__setKnobProportion_(self, _cmd, aProportion)
{
    if (!(!isNaN(parseFloat(aProportion)) && isFinite(aProportion)))
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "aProportion must be numeric");
    self._knobProportion = MIN(1.0, MAX(0.0001, aProportion));
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","float"]), new objj_method(sel_getUid("_adjustScrollerSize"), function $CPScroller___adjustScrollerSize(self, _cmd)
{
    var frame = objj_msgSend(self, "frame"),
        scrollerWidth = objj_msgSend(self, "currentValueForThemeAttribute:", "scroller-width");
    if (objj_msgSend(self, "isVertical") && CGRectGetWidth(frame) !== scrollerWidth)
        frame.size.width = scrollerWidth;
    if (!objj_msgSend(self, "isVertical") && CGRectGetHeight(frame) !== scrollerWidth)
        frame.size.height = scrollerWidth;
    objj_msgSend(self, "setFrame:", frame);
}
,["void"]), new objj_method(sel_getUid("_performFadeOut:"), function $CPScroller___performFadeOut_(self, _cmd, aTimer)
{
    objj_msgSend(self, "fadeOut");
    self._timerFadeOut = nil;
}
,["void","CPTimer"]), new objj_method(sel_getUid("rectForPart:"), function $CPScroller__rectForPart_(self, _cmd, aPart)
{
    if (aPart == CPScrollerNoPart)
        return CGRectMakeZero();
    return self._partRects[aPart];
}
,["CGRect","CPScrollerPart"]), new objj_method(sel_getUid("testPart:"), function $CPScroller__testPart_(self, _cmd, aPoint)
{
    aPoint = objj_msgSend(self, "convertPoint:fromView:", aPoint, nil);
    if (!objj_msgSend(self, "hasThemeState:", CPThemeStateSelected))
        return CPScrollerNoPart;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerKnob), aPoint))
        return CPScrollerKnob;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerDecrementPage), aPoint))
        return CPScrollerDecrementPage;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerIncrementPage), aPoint))
        return CPScrollerIncrementPage;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerDecrementLine), aPoint))
        return CPScrollerDecrementLine;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerIncrementLine), aPoint))
        return CPScrollerIncrementLine;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot), aPoint))
        return CPScrollerKnobSlot;
    return CPScrollerNoPart;
}
,["CPScrollerPart","CGPoint"]), new objj_method(sel_getUid("checkSpaceForParts"), function $CPScroller__checkSpaceForParts(self, _cmd)
{
    var bounds = objj_msgSend(self, "bounds");
    if (self._knobProportion === 1.0)
    {
        self._usableParts = CPNoScrollerParts;
        self._partRects[CPScrollerDecrementPage] = CGRectMakeZero();
        self._partRects[CPScrollerKnob] = CGRectMakeZero();
        self._partRects[CPScrollerIncrementPage] = CGRectMakeZero();
        self._partRects[CPScrollerDecrementLine] = CGRectMakeZero();
        self._partRects[CPScrollerIncrementLine] = CGRectMakeZero();
        self._partRects[CPScrollerKnobSlot] = CGRectMakeCopy(bounds);
        return;
    }
    self._usableParts = CPAllScrollerParts;
    var knobInset = objj_msgSend(self, "currentValueForThemeAttribute:", "knob-inset"),
        trackInset = objj_msgSend(self, "currentValueForThemeAttribute:", "track-inset"),
        width = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds);
    if (objj_msgSend(self, "isVertical"))
    {
        var decrementLineSize = objj_msgSend(self, "currentValueForThemeAttribute:", "decrement-line-size"),
            incrementLineSize = objj_msgSend(self, "currentValueForThemeAttribute:", "increment-line-size"),
            effectiveDecrementLineHeight = decrementLineSize.height + trackInset.top,
            effectiveIncrementLineHeight = incrementLineSize.height + trackInset.bottom,
            slotSize = height - effectiveDecrementLineHeight - effectiveIncrementLineHeight,
            minimumKnobLength = objj_msgSend(self, "currentValueForThemeAttribute:", "minimum-knob-length"),
            knobWidth = width - knobInset.left - knobInset.right,
            knobHeight = MAX(minimumKnobLength, slotSize * self._knobProportion),
            knobLocation = effectiveDecrementLineHeight + (slotSize - knobHeight) * objj_msgSend(self, "floatValue");
        self._partRects[CPScrollerDecrementPage] = CGRectMake(0.0, effectiveDecrementLineHeight, width, knobLocation - effectiveDecrementLineHeight);
        self._partRects[CPScrollerKnob] = CGRectMake(knobInset.left, knobLocation, knobWidth, knobHeight);
        self._partRects[CPScrollerIncrementPage] = CGRectMake(0.0, knobLocation + knobHeight, width, height - (knobLocation + knobHeight) - effectiveIncrementLineHeight);
        self._partRects[CPScrollerKnobSlot] = CGRectMake(trackInset.left, effectiveDecrementLineHeight, width - trackInset.left - trackInset.right, slotSize);
        self._partRects[CPScrollerDecrementLine] = CGRectMake(0.0, 0.0, decrementLineSize.width, decrementLineSize.height);
        self._partRects[CPScrollerIncrementLine] = CGRectMake(0.0, height - incrementLineSize.height, incrementLineSize.width, incrementLineSize.height);
        if (height < knobHeight + decrementLineSize.height + incrementLineSize.height + trackInset.top + trackInset.bottom)
            self._partRects[CPScrollerKnob] = CGRectMakeZero();
        if (height < decrementLineSize.height + incrementLineSize.height - 2)
        {
            self._partRects[CPScrollerIncrementLine] = CGRectMakeZero();
            self._partRects[CPScrollerDecrementLine] = CGRectMakeZero();
            self._partRects[CPScrollerKnobSlot] = CGRectMake(trackInset.left, 0, width - trackInset.left - trackInset.right, height);
        }
    }
    else
    {
        var decrementLineSize = objj_msgSend(self, "currentValueForThemeAttribute:", "decrement-line-size"),
            incrementLineSize = objj_msgSend(self, "currentValueForThemeAttribute:", "increment-line-size"),
            effectiveDecrementLineWidth = decrementLineSize.width + trackInset.left,
            effectiveIncrementLineWidth = incrementLineSize.width + trackInset.right,
            slotSize = width - effectiveDecrementLineWidth - effectiveIncrementLineWidth,
            minimumKnobLength = objj_msgSend(self, "currentValueForThemeAttribute:", "minimum-knob-length"),
            knobWidth = MAX(minimumKnobLength, slotSize * self._knobProportion),
            knobHeight = height - knobInset.top - knobInset.bottom,
            knobLocation = effectiveDecrementLineWidth + (slotSize - knobWidth) * objj_msgSend(self, "floatValue");
        self._partRects[CPScrollerDecrementPage] = CGRectMake(effectiveDecrementLineWidth, 0.0, knobLocation - effectiveDecrementLineWidth, height);
        self._partRects[CPScrollerKnob] = CGRectMake(knobLocation, knobInset.top, knobWidth, knobHeight);
        self._partRects[CPScrollerIncrementPage] = CGRectMake(knobLocation + knobWidth, 0.0, width - (knobLocation + knobWidth) - effectiveIncrementLineWidth, height);
        self._partRects[CPScrollerKnobSlot] = CGRectMake(effectiveDecrementLineWidth, trackInset.top, slotSize, height - trackInset.top - trackInset.bottom);
        self._partRects[CPScrollerDecrementLine] = CGRectMake(0.0, 0.0, decrementLineSize.width, decrementLineSize.height);
        self._partRects[CPScrollerIncrementLine] = CGRectMake(width - incrementLineSize.width, 0.0, incrementLineSize.width, incrementLineSize.height);
        if (width < knobWidth + decrementLineSize.width + incrementLineSize.width + trackInset.left + trackInset.right)
            self._partRects[CPScrollerKnob] = CGRectMakeZero();
        if (width < decrementLineSize.width + incrementLineSize.width - 2)
        {
            self._partRects[CPScrollerIncrementLine] = CGRectMakeZero();
            self._partRects[CPScrollerDecrementLine] = CGRectMakeZero();
            self._partRects[CPScrollerKnobSlot] = CGRectMake(0.0, 0.0, width, slotSize);
        }
    }
}
,["void"]), new objj_method(sel_getUid("usableParts"), function $CPScroller__usableParts(self, _cmd)
{
    return self._usableParts;
}
,["CPUsableScrollerParts"]), new objj_method(sel_getUid("fadeIn"), function $CPScroller__fadeIn(self, _cmd)
{
    if (self._isMouseOver && self._knobProportion != 1.0)
        objj_msgSend(self, "setThemeState:", CPThemeStateSelected);
    if (self._timerFadeOut)
        objj_msgSend(self._timerFadeOut, "invalidate");
    objj_msgSend(self, "setAlphaValue:", 1.0);
}
,["void"]), new objj_method(sel_getUid("fadeOut"), function $CPScroller__fadeOut(self, _cmd)
{
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateScrollViewLegacy))
        return;
    objj_msgSend(self._animationScroller, "startAnimation");
}
,["void"]), new objj_method(sel_getUid("drawArrow:highlight:"), function $CPScroller__drawArrow_highlight_(self, _cmd, anArrow, shouldHighlight)
{
}
,["void","CPScrollerArrow","BOOL"]), new objj_method(sel_getUid("drawKnob"), function $CPScroller__drawKnob(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("drawKnobSlot"), function $CPScroller__drawKnobSlot(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("createViewForPart:"), function $CPScroller__createViewForPart_(self, _cmd, aPart)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(view, "setHitTests:", NO);
    return view;
}
,["CPView","CPScrollerPart"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPScroller__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    return self._partRects[aName];
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPScroller__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(view, "setHitTests:", NO);
    return view;
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPScroller__layoutSubviews(self, _cmd)
{
    objj_msgSend(self, "_adjustScrollerSize");
    objj_msgSend(self, "checkSpaceForParts");
    var index = 0,
        count = PARTS_ARRANGEMENT.length,
        view;
    for (; index < count; ++index)
    {
        var part = PARTS_ARRANGEMENT[index];
        if (index === 0)
            view = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", part, CPWindowBelow, PARTS_ARRANGEMENT[index + 1]);
        else
            view = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", part, CPWindowAbove, PARTS_ARRANGEMENT[index - 1]);
        if (view)
            objj_msgSend(view, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", NAMES_FOR_PARTS[part] + "-color"));
    }
}
,["void"]), new objj_method(sel_getUid("drawParts"), function $CPScroller__drawParts(self, _cmd)
{
    objj_msgSend(self, "drawKnobSlot");
    objj_msgSend(self, "drawKnob");
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerDecrementArrow, NO);
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerIncrementArrow, NO);
}
,["void"]), new objj_method(sel_getUid("hitPart"), function $CPScroller__hitPart(self, _cmd)
{
    return self._hitPart;
}
,["CPScrollerPart"]), new objj_method(sel_getUid("trackKnob:"), function $CPScroller__trackKnob_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
    {
        self._hitPart = CPScrollerNoPart;
        return;
    }
    if (type === CPLeftMouseDown)
    {
        self._trackingFloatValue = objj_msgSend(self, "floatValue");
        self._trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    }
    else if (type === CPLeftMouseDragged)
    {
        var knobRect = objj_msgSend(self, "rectForPart:", CPScrollerKnob),
            knobSlotRect = objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot),
            remainder = !objj_msgSend(self, "isVertical") ? CGRectGetWidth(knobSlotRect) - CGRectGetWidth(knobRect) : CGRectGetHeight(knobSlotRect) - CGRectGetHeight(knobRect);
        if (remainder <= 0)
            objj_msgSend(self, "setFloatValue:", 0.0);
        else
        {
            var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
                delta = !objj_msgSend(self, "isVertical") ? location.x - self._trackingStartPoint.x : location.y - self._trackingStartPoint.y;
            objj_msgSend(self, "setFloatValue:", self._trackingFloatValue + delta / remainder);
        }
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackKnob:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
    if (type === CPLeftMouseDragged)
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
,["void","CPEvent"]), new objj_method(sel_getUid("trackScrollButtons:"), function $CPScroller__trackScrollButtons_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
    {
        objj_msgSend(self, "highlight:", NO);
        objj_msgSend(CPEvent, "stopPeriodicEvents");
        self._hitPart = CPScrollerNoPart;
        return;
    }
    if (type === CPLeftMouseDown)
    {
        self._trackingPart = objj_msgSend(self, "hitPart");
        self._trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
        if (objj_msgSend(anEvent, "modifierFlags") & CPAlternateKeyMask)
        {
            if (self._trackingPart === CPScrollerDecrementLine)
                self._hitPart = CPScrollerDecrementPage;
            else if (self._trackingPart === CPScrollerIncrementLine)
                self._hitPart = CPScrollerIncrementPage;
            else if (self._trackingPart === CPScrollerDecrementPage || self._trackingPart === CPScrollerIncrementPage)
            {
                var knobRect = objj_msgSend(self, "rectForPart:", CPScrollerKnob),
                    knobWidth = !objj_msgSend(self, "isVertical") ? CGRectGetWidth(knobRect) : CGRectGetHeight(knobRect),
                    knobSlotRect = objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot),
                    remainder = (!objj_msgSend(self, "isVertical") ? CGRectGetWidth(knobSlotRect) : CGRectGetHeight(knobSlotRect)) - knobWidth;
                objj_msgSend(self, "setFloatValue:", ((!objj_msgSend(self, "isVertical") ? self._trackingStartPoint.x - CGRectGetMinX(knobSlotRect) : self._trackingStartPoint.y - CGRectGetMinY(knobSlotRect)) - knobWidth / 2.0) / remainder);
                self._hitPart = CPScrollerKnob;
                objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
                return objj_msgSend(self, "trackKnob:", anEvent);
            }
        }
        objj_msgSend(self, "highlight:", YES);
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
        objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.5, 0.04);
    }
    else if (type === CPLeftMouseDragged)
    {
        self._trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
        if (self._trackingPart === CPScrollerDecrementPage || self._trackingPart === CPScrollerIncrementPage)
        {
            var hitPart = objj_msgSend(self, "testPart:", objj_msgSend(anEvent, "locationInWindow"));
            if (hitPart === CPScrollerDecrementPage || hitPart === CPScrollerIncrementPage)
            {
                self._trackingPart = hitPart;
                self._hitPart = hitPart;
            }
        }
        objj_msgSend(self, "highlight:", CGRectContainsPoint(objj_msgSend(self, "rectForPart:", self._trackingPart), self._trackingStartPoint));
    }
    else if (type == CPPeriodic && CGRectContainsPoint(objj_msgSend(self, "rectForPart:", self._trackingPart), self._trackingStartPoint))
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackScrollButtons:"), CPPeriodicMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_setIsVertical:"), function $CPScroller___setIsVertical_(self, _cmd, isVertical)
{
    self._isVertical = isVertical;
    if (self._isVertical)
        objj_msgSend(self, "setThemeState:", CPThemeStateVertical);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateVertical);
}
,["void","BOOL"]), new objj_method(sel_getUid("setFrameSize:"), function $CPScroller__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "setFrameSize:", aSize);
    objj_msgSend(self, "checkSpaceForParts");
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CGSize"]), new objj_method(sel_getUid("currentValueForThemeAttribute:"), function $CPScroller__currentValueForThemeAttribute_(self, _cmd, anAttributeName)
{
    var themeState = self._themeState;
    if (NAMES_FOR_PARTS[self._hitPart] + "-color" !== anAttributeName)
        themeState = themeState.without(CPThemeStateHighlighted);
    return objj_msgSend(self, "valueForThemeAttribute:inState:", anAttributeName, themeState);
}
,["id","CPString"]), new objj_method(sel_getUid("mouseDown:"), function $CPScroller__mouseDown_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    self._hitPart = objj_msgSend(self, "testPart:", objj_msgSend(anEvent, "locationInWindow"));
    switch(self._hitPart) {
    case CPScrollerKnob:
        return objj_msgSend(self, "trackKnob:", anEvent);
    case CPScrollerDecrementLine:
    case CPScrollerIncrementLine:
    case CPScrollerDecrementPage:
    case CPScrollerIncrementPage:
        return objj_msgSend(self, "trackScrollButtons:", anEvent);
    }
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseEntered:"), function $CPScroller__mouseEntered_(self, _cmd, anEvent)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "mouseEntered:", anEvent);
    if (self._timerFadeOut)
        objj_msgSend(self._timerFadeOut, "invalidate");
    if (!objj_msgSend(self, "isEnabled"))
        return;
    self._allowFadingOut = NO;
    self._isMouseOver = YES;
    if (objj_msgSend(self, "alphaValue") > 0 && self._knobProportion != 1.0)
        objj_msgSend(self, "setThemeState:", CPThemeStateSelected);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $CPScroller__mouseExited_(self, _cmd, anEvent)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "mouseExited:", anEvent);
    if (objj_msgSend(self, "isHidden") || !objj_msgSend(self, "isEnabled") || !self._isMouseOver)
        return;
    self._allowFadingOut = YES;
    self._isMouseOver = NO;
    if (self._timerFadeOut)
        objj_msgSend(self._timerFadeOut, "invalidate");
    self._timerFadeOut = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 1.2, self, sel_getUid("_performFadeOut:"), nil, NO);
}
,["void","CPEvent"]), new objj_method(sel_getUid("animationDidEnd:"), function $CPScroller__animationDidEnd_(self, _cmd, animation)
{
    objj_msgSend(self, "unsetThemeState:", CPThemeStateSelected);
}
,["void","CPAnimation"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPScroller__defaultThemeClass(self, _cmd)
{
    return "scroller";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPScroller__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 7.0, "scroller-width", objj_msgSend(CPNull, "null"), "knob-slot-color", objj_msgSend(CPNull, "null"), "decrement-line-color", objj_msgSend(CPNull, "null"), "increment-line-color", objj_msgSend(CPNull, "null"), "knob-color", CGSizeMakeZero(), "decrement-line-size", CGSizeMakeZero(), "increment-line-size", CGInsetMakeZero(), "track-inset", CGInsetMakeZero(), "knob-inset", 21.0, "minimum-knob-length", 9.0, "track-border-overlay");
}
,["CPDictionary"]), new objj_method(sel_getUid("scrollerWidth"), function $CPScroller__scrollerWidth(self, _cmd)
{
    return objj_msgSend(self, "scrollerWidthInStyle:", CPScrollerStyleLegacy);
}
,["float"]), new objj_method(sel_getUid("scrollerWidthInStyle:"), function $CPScroller__scrollerWidthInStyle_(self, _cmd, aStyle)
{
    if (!_CACHED_THEME_SCROLLER)
        _CACHED_THEME_SCROLLER = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    if (aStyle == CPScrollerStyleLegacy)
        return objj_msgSend(_CACHED_THEME_SCROLLER, "valueForThemeAttribute:inState:", "scroller-width", CPThemeStateScrollViewLegacy);
    return objj_msgSend(_CACHED_THEME_SCROLLER, "currentValueForThemeAttribute:", "scroller-width");
}
,["float","int"]), new objj_method(sel_getUid("scrollerOverlay"), function $CPScroller__scrollerOverlay(self, _cmd)
{
    if (!_CACHED_THEME_SCROLLER)
        _CACHED_THEME_SCROLLER = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    return objj_msgSend(_CACHED_THEME_SCROLLER, "currentValueForThemeAttribute:", "track-border-overlay");
}
,["float"]), new objj_method(sel_getUid("scrollerWidthForControlSize:"), function $CPScroller__scrollerWidthForControlSize_(self, _cmd, aControlSize)
{
    return objj_msgSend(self, "scrollerWidth");
}
,["float","CPControlSize"])]);
}var CPScrollerControlSizeKey = "CPScrollerControlSize",
    CPScrollerIsVerticalKey = "CPScrollerIsVerticalKey",
    CPScrollerKnobProportionKey = "CPScrollerKnobProportion",
    CPScrollerStyleKey = "CPScrollerStyleKey";
{
var the_class = objj_getClass("CPScroller")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPScroller\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPScroller__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "initWithCoder:", aCoder))
    {
        self._controlSize = CPRegularControlSize;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPScrollerControlSizeKey))
            self._controlSize = objj_msgSend(aCoder, "decodeIntForKey:", CPScrollerControlSizeKey);
        self._knobProportion = 1.0;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPScrollerKnobProportionKey))
            self._knobProportion = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollerKnobProportionKey);
        self._partRects = [];
        self._hitPart = CPScrollerNoPart;
        self._allowFadingOut = YES;
        self._isMouseOver = NO;
        var paramAnimFadeOut = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self, CPViewAnimationTargetKey, CPViewAnimationFadeOutEffect, CPViewAnimationEffectKey);
        self._animationScroller = objj_msgSend(objj_msgSend(CPViewAnimation, "alloc"), "initWithDuration:animationCurve:", 0.2, CPAnimationEaseInOut);
        objj_msgSend(self._animationScroller, "setViewAnimations:", [paramAnimFadeOut]);
        objj_msgSend(self._animationScroller, "setDelegate:", self);
        objj_msgSend(self, "setAlphaValue:", 0.0);
        objj_msgSend(self, "setStyle:", objj_msgSend(aCoder, "decodeIntForKey:", CPScrollerStyleKey));
        objj_msgSend(self, "_setIsVertical:", objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollerIsVerticalKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPScroller__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._controlSize, CPScrollerControlSizeKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._isVertical, CPScrollerIsVerticalKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._knobProportion, CPScrollerKnobProportionKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._style, CPScrollerStyleKey);
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPScroller")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPScroller\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setFloatValue:knobProportion:"), function $CPScroller__setFloatValue_knobProportion_(self, _cmd, aValue, aProportion)
{
    objj_msgSend(self, "setFloatValue:", aValue);
    objj_msgSend(self, "setKnobProportion:", aProportion);
}
,["void","float","float"])]);
}