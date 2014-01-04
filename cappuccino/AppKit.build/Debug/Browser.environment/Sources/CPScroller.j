@STATIC;1.0;i;11;CPControl.jt;30969;



objj_executeFile("CPControl.j", YES);


CPScrollerNoPart = 0;
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_controlSize"), new objj_ivar("_usableParts"), new objj_ivar("_partRects"), new objj_ivar("_isVertical"), new objj_ivar("_knobProportion"), new objj_ivar("_hitPart"), new objj_ivar("_trackingPart"), new objj_ivar("_trackingFloatValue"), new objj_ivar("_trackingStartPoint"), new objj_ivar("_animationScroller"), new objj_ivar("_allowFadingOut"), new objj_ivar("_style"), new objj_ivar("_timerFadeOut"), new objj_ivar("_isMouseOver")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isVertical"), function $CPScroller__isVertical(self, _cmd)
{ with(self)
{
return _isVertical;
}
},["id"]),
new objj_method(sel_getUid("allowFadingOut"), function $CPScroller__allowFadingOut(self, _cmd)
{ with(self)
{
return _allowFadingOut;
}
},["id"]),
new objj_method(sel_getUid("_setAllowFadingOut:"), function $CPScroller___setAllowFadingOut_(self, _cmd, newValue)
{ with(self)
{
_allowFadingOut = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $CPScroller__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "initWithFrame:", aFrame))
    {
        _controlSize = CPRegularControlSize;
        _partRects = [];

        objj_msgSend(self, "setFloatValue:", 0.0);
        objj_msgSend(self, "setKnobProportion:", 1.0);

        _hitPart = CPScrollerNoPart;
        _allowFadingOut = YES;
        _isMouseOver = NO;
        _style = CPScrollerStyleOverlay;
        var paramAnimFadeOut = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self, CPViewAnimationFadeOutEffect], [CPViewAnimationTargetKey, CPViewAnimationEffectKey]);

        _animationScroller = objj_msgSend(objj_msgSend(CPViewAnimation, "alloc"), "initWithDuration:animationCurve:", 0.2, CPAnimationEaseInOut);
        objj_msgSend(_animationScroller, "setViewAnimations:", [paramAnimFadeOut]);
        objj_msgSend(_animationScroller, "setDelegate:", self);
        objj_msgSend(self, "setAlphaValue:", 0.0);
        objj_msgSend(self, "_calculateIsVertical");
    }

    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("style"), function $CPScroller__style(self, _cmd)
{ with(self)
{
    return _style;
}
},["void"]), new objj_method(sel_getUid("setStyle:"), function $CPScroller__setStyle_(self, _cmd, aStyle)
{ with(self)
{
    if (_style != nil && _style === aStyle)
        return;

    _style = aStyle;

    if (_style === CPScrollerStyleLegacy)
    {
        objj_msgSend(self, "fadeIn");
        objj_msgSend(self, "setThemeState:", CPThemeStateScrollViewLegacy);
    }
    else
    {
        _allowFadingOut = YES;
        objj_msgSend(self, "unsetThemeState:", CPThemeStateScrollViewLegacy);
    }

    objj_msgSend(self, "_adjustScrollerSize");
}
},["void","id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPScroller__setObjectValue_(self, _cmd, aValue)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "setObjectValue:", MIN(1.0, MAX(0.0, +aValue)));
}
},["void","id"]), new objj_method(sel_getUid("controlSize"), function $CPScroller__controlSize(self, _cmd)
{ with(self)
{
    return _controlSize;
}
},["CPControlSize"]), new objj_method(sel_getUid("setControlSize:"), function $CPScroller__setControlSize_(self, _cmd, aControlSize)
{ with(self)
{
    if (_controlSize == aControlSize)
        return;

    _controlSize = aControlSize;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPControlSize"]), new objj_method(sel_getUid("knobProportion"), function $CPScroller__knobProportion(self, _cmd)
{ with(self)
{
    return _knobProportion;
}
},["float"]), new objj_method(sel_getUid("setKnobProportion:"), function $CPScroller__setKnobProportion_(self, _cmd, aProportion)
{ with(self)
{
    if (!(!isNaN(parseFloat(aProportion)) && isFinite(aProportion)))
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "aProportion must be numeric");

    _knobProportion = MIN(1.0, MAX(0.0001, aProportion));

    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","float"]), new objj_method(sel_getUid("_adjustScrollerSize"), function $CPScroller___adjustScrollerSize(self, _cmd)
{ with(self)
{
    var frame = objj_msgSend(self, "frame"),
        scrollerWidth = objj_msgSend(self, "currentValueForThemeAttribute:", "scroller-width");

    if (objj_msgSend(self, "isVertical") && CGRectGetWidth(frame) !== scrollerWidth)
        frame.size.width = scrollerWidth;

    if (!objj_msgSend(self, "isVertical") && CGRectGetHeight(frame) !== scrollerWidth)
        frame.size.height = scrollerWidth;

    objj_msgSend(self, "setFrame:", frame);
}
},["void"]), new objj_method(sel_getUid("_performFadeOut:"), function $CPScroller___performFadeOut_(self, _cmd, aTimer)
{ with(self)
{
    objj_msgSend(self, "fadeOut");
    _timerFadeOut = nil;
}
},["void","CPTimer"]), new objj_method(sel_getUid("rectForPart:"), function $CPScroller__rectForPart_(self, _cmd, aPart)
{ with(self)
{
    if (aPart == CPScrollerNoPart)
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };

    return _partRects[aPart];
}
},["CGRect","CPScrollerPart"]), new objj_method(sel_getUid("testPart:"), function $CPScroller__testPart_(self, _cmd, aPoint)
{ with(self)
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
},["CPScrollerPart","CGPoint"]), new objj_method(sel_getUid("checkSpaceForParts"), function $CPScroller__checkSpaceForParts(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");


    if (_knobProportion === 1.0)
    {
        _usableParts = CPNoScrollerParts;

        _partRects[CPScrollerDecrementPage] = CGRectMakeZero();
        _partRects[CPScrollerKnob] = CGRectMakeZero();
        _partRects[CPScrollerIncrementPage] = CGRectMakeZero();
        _partRects[CPScrollerDecrementLine] = CGRectMakeZero();
        _partRects[CPScrollerIncrementLine] = CGRectMakeZero();


        _partRects[CPScrollerKnobSlot] = CGRectMakeCopy(bounds);

        return;
    }


    _usableParts = CPAllScrollerParts;

    var knobInset = objj_msgSend(self, "currentValueForThemeAttribute:", "knob-inset"),
        trackInset = objj_msgSend(self, "currentValueForThemeAttribute:", "track-inset"),
        width = (bounds.size.width),
        height = (bounds.size.height);

    if (objj_msgSend(self, "isVertical"))
    {
        var decrementLineSize = objj_msgSend(self, "currentValueForThemeAttribute:", "decrement-line-size"),
            incrementLineSize = objj_msgSend(self, "currentValueForThemeAttribute:", "increment-line-size"),
            effectiveDecrementLineHeight = decrementLineSize.height + trackInset.top,
            effectiveIncrementLineHeight = incrementLineSize.height + trackInset.bottom,
            slotSize = height - effectiveDecrementLineHeight - effectiveIncrementLineHeight,
            minimumKnobLength = objj_msgSend(self, "currentValueForThemeAttribute:", "minimum-knob-length"),
            knobWidth = width - knobInset.left - knobInset.right,
            knobHeight = MAX(minimumKnobLength, (slotSize * _knobProportion)),
            knobLocation = effectiveDecrementLineHeight + (slotSize - knobHeight) * objj_msgSend(self, "floatValue");

        _partRects[CPScrollerDecrementPage] = { origin: { x:0.0, y:effectiveDecrementLineHeight }, size: { width:width, height:knobLocation - effectiveDecrementLineHeight } };
        _partRects[CPScrollerKnob] = { origin: { x:knobInset.left, y:knobLocation }, size: { width:knobWidth, height:knobHeight } };
        _partRects[CPScrollerIncrementPage] = { origin: { x:0.0, y:knobLocation + knobHeight }, size: { width:width, height:height - (knobLocation + knobHeight) - effectiveIncrementLineHeight } };
        _partRects[CPScrollerKnobSlot] = { origin: { x:trackInset.left, y:effectiveDecrementLineHeight }, size: { width:width - trackInset.left - trackInset.right, height:slotSize } };
        _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:decrementLineSize.width, height:decrementLineSize.height } };
        _partRects[CPScrollerIncrementLine] = { origin: { x:0.0, y:height - incrementLineSize.height }, size: { width:incrementLineSize.width, height:incrementLineSize.height } };

        if (height < knobHeight + decrementLineSize.height + incrementLineSize.height + trackInset.top + trackInset.bottom)
            _partRects[CPScrollerKnob] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };

        if (height < decrementLineSize.height + incrementLineSize.height - 2)
        {
            _partRects[CPScrollerIncrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
            _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
            _partRects[CPScrollerKnobSlot] = { origin: { x:trackInset.left, y:0 }, size: { width:width - trackInset.left - trackInset.right, height:height } };
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
            knobWidth = MAX(minimumKnobLength, (slotSize * _knobProportion)),
            knobHeight = height - knobInset.top - knobInset.bottom,
            knobLocation = effectiveDecrementLineWidth + (slotSize - knobWidth) * objj_msgSend(self, "floatValue");

        _partRects[CPScrollerDecrementPage] = { origin: { x:effectiveDecrementLineWidth, y:0.0 }, size: { width:knobLocation - effectiveDecrementLineWidth, height:height } };
        _partRects[CPScrollerKnob] = { origin: { x:knobLocation, y:knobInset.top }, size: { width:knobWidth, height:knobHeight } };
        _partRects[CPScrollerIncrementPage] = { origin: { x:knobLocation + knobWidth, y:0.0 }, size: { width:width - (knobLocation + knobWidth) - effectiveIncrementLineWidth, height:height } };
        _partRects[CPScrollerKnobSlot] = { origin: { x:effectiveDecrementLineWidth, y:trackInset.top }, size: { width:slotSize, height:height - trackInset.top - trackInset.bottom } };
        _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:decrementLineSize.width, height:decrementLineSize.height } };
        _partRects[CPScrollerIncrementLine] = { origin: { x:width - incrementLineSize.width, y:0.0 }, size: { width:incrementLineSize.width, height:incrementLineSize.height } };

        if (width < knobWidth + decrementLineSize.width + incrementLineSize.width + trackInset.left + trackInset.right)
            _partRects[CPScrollerKnob] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };

        if (width < decrementLineSize.width + incrementLineSize.width - 2)
        {
            _partRects[CPScrollerIncrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
            _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
            _partRects[CPScrollerKnobSlot] = { origin: { x:0.0, y:0.0 }, size: { width:width, height:slotSize } };
        }
    }
}
},["void"]), new objj_method(sel_getUid("usableParts"), function $CPScroller__usableParts(self, _cmd)
{ with(self)
{
    return _usableParts;
}
},["CPUsableScrollerParts"]), new objj_method(sel_getUid("fadeIn"), function $CPScroller__fadeIn(self, _cmd)
{ with(self)
{
    if (_isMouseOver && _knobProportion != 1.0)
        objj_msgSend(self, "setThemeState:", CPThemeStateSelected);

    if (_timerFadeOut)
        objj_msgSend(_timerFadeOut, "invalidate");

    objj_msgSend(self, "setAlphaValue:", 1.0);
}
},["void"]), new objj_method(sel_getUid("fadeOut"), function $CPScroller__fadeOut(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateScrollViewLegacy))
        return;

    objj_msgSend(_animationScroller, "startAnimation");
}
},["void"]), new objj_method(sel_getUid("drawArrow:highlight:"), function $CPScroller__drawArrow_highlight_(self, _cmd, anArrow, shouldHighlight)
{ with(self)
{
}
},["void","CPScrollerArrow","BOOL"]), new objj_method(sel_getUid("drawKnob"), function $CPScroller__drawKnob(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("drawKnobSlot"), function $CPScroller__drawKnobSlot(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("createViewForPart:"), function $CPScroller__createViewForPart_(self, _cmd, aPart)
{ with(self)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });

    objj_msgSend(view, "setHitTests:", NO);

    return view;
}
},["CPView","CPScrollerPart"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPScroller__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    return _partRects[aName];
}
},["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPScroller__createEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });

    objj_msgSend(view, "setHitTests:", NO);

    return view;
}
},["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPScroller__layoutSubviews(self, _cmd)
{ with(self)
{
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
},["void"]), new objj_method(sel_getUid("drawParts"), function $CPScroller__drawParts(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "drawKnobSlot");
    objj_msgSend(self, "drawKnob");
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerDecrementArrow, NO);
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerIncrementArrow, NO);
}
},["void"]), new objj_method(sel_getUid("hitPart"), function $CPScroller__hitPart(self, _cmd)
{ with(self)
{
    return _hitPart;
}
},["CPScrollerPart"]), new objj_method(sel_getUid("trackKnob:"), function $CPScroller__trackKnob_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");

    if (type === CPLeftMouseUp)
    {
        _hitPart = CPScrollerNoPart;

        return;
    }

    if (type === CPLeftMouseDown)
    {
        _trackingFloatValue = objj_msgSend(self, "floatValue");
        _trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    }

    else if (type === CPLeftMouseDragged)
    {
        var knobRect = objj_msgSend(self, "rectForPart:", CPScrollerKnob),
            knobSlotRect = objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot),
            remainder = !objj_msgSend(self, "isVertical") ? ((knobSlotRect.size.width) - (knobRect.size.width)) : ((knobSlotRect.size.height) - (knobRect.size.height));

        if (remainder <= 0)
            objj_msgSend(self, "setFloatValue:", 0.0);
        else
        {
            var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
                delta = !objj_msgSend(self, "isVertical") ? location.x - _trackingStartPoint.x : location.y - _trackingStartPoint.y;

            objj_msgSend(self, "setFloatValue:", _trackingFloatValue + delta / remainder);
        }
    }

    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackKnob:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);

    if (type === CPLeftMouseDragged)
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
},["void","CPEvent"]), new objj_method(sel_getUid("trackScrollButtons:"), function $CPScroller__trackScrollButtons_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");

    if (type === CPLeftMouseUp)
    {
        objj_msgSend(self, "highlight:", NO);
        objj_msgSend(CPEvent, "stopPeriodicEvents");

        _hitPart = CPScrollerNoPart;

        return;
    }

    if (type === CPLeftMouseDown)
    {
        _trackingPart = objj_msgSend(self, "hitPart");

        _trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);

        if (objj_msgSend(anEvent, "modifierFlags") & CPAlternateKeyMask)
        {
            if (_trackingPart == CPScrollerDecrementLine)
                _hitPart = CPScrollerDecrementPage;

            else if (_trackingPart == CPScrollerIncrementLine)
                _hitPart = CPScrollerIncrementPage;

            else if (_trackingPart == CPScrollerDecrementPage || _trackingPart == CPScrollerIncrementPage)
            {
                var knobRect = objj_msgSend(self, "rectForPart:", CPScrollerKnob),
                    knobWidth = !objj_msgSend(self, "isVertical") ? (knobRect.size.width) : (knobRect.size.height),
                    knobSlotRect = objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot),
                    remainder = (!objj_msgSend(self, "isVertical") ? (knobSlotRect.size.width) : (knobSlotRect.size.height)) - knobWidth;

                objj_msgSend(self, "setFloatValue:", ((!objj_msgSend(self, "isVertical") ? _trackingStartPoint.x - (knobSlotRect.origin.x) : _trackingStartPoint.y - (knobSlotRect.origin.y)) - knobWidth / 2.0) / remainder);

                _hitPart = CPScrollerKnob;

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
        _trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);

        if (_trackingPart == CPScrollerDecrementPage || _trackingPart == CPScrollerIncrementPage)
        {
            var hitPart = objj_msgSend(self, "testPart:", objj_msgSend(anEvent, "locationInWindow"));

            if (hitPart == CPScrollerDecrementPage || hitPart == CPScrollerIncrementPage)
            {
                _trackingPart = hitPart;
                _hitPart = hitPart;
            }
        }

        objj_msgSend(self, "highlight:", CGRectContainsPoint(objj_msgSend(self, "rectForPart:", _trackingPart), _trackingStartPoint));
    }
    else if (type == CPPeriodic && CGRectContainsPoint(objj_msgSend(self, "rectForPart:", _trackingPart), _trackingStartPoint))
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));

    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackScrollButtons:"), CPPeriodicMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);

}
},["void","CPEvent"]), new objj_method(sel_getUid("_calculateIsVertical"), function $CPScroller___calculateIsVertical(self, _cmd)
{ with(self)
{

    var bounds = objj_msgSend(self, "bounds"),
        width = (bounds.size.width),
        height = (bounds.size.height);

    _isVertical = width < height ? 1 : (width > height ? 0 : -1);

    if (_isVertical === 1)
        objj_msgSend(self, "setThemeState:", CPThemeStateVertical);
    else if (_isVertical === 0)
        objj_msgSend(self, "unsetThemeState:", CPThemeStateVertical);
}
},["void"]), new objj_method(sel_getUid("setFrameSize:"), function $CPScroller__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "setFrameSize:", aSize);

    objj_msgSend(self, "checkSpaceForParts");
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CGSize"]), new objj_method(sel_getUid("currentValueForThemeAttribute:"), function $CPScroller__currentValueForThemeAttribute_(self, _cmd, anAttributeName)
{ with(self)
{
    var themeState = _themeState;

    if (NAMES_FOR_PARTS[_hitPart] + "-color" !== anAttributeName)
        themeState &= ~CPThemeStateHighlighted;

    return objj_msgSend(self, "valueForThemeAttribute:inState:", anAttributeName, themeState);
}
},["id","CPString"]), new objj_method(sel_getUid("mouseDown:"), function $CPScroller__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;

    _hitPart = objj_msgSend(self, "testPart:", objj_msgSend(anEvent, "locationInWindow"));

    switch (_hitPart)
    {
        case CPScrollerKnob: return objj_msgSend(self, "trackKnob:", anEvent);

        case CPScrollerDecrementLine:
        case CPScrollerIncrementLine:
        case CPScrollerDecrementPage:
        case CPScrollerIncrementPage: return objj_msgSend(self, "trackScrollButtons:", anEvent);
    }
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseEntered:"), function $CPScroller__mouseEntered_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "mouseEntered:", anEvent);

    if (_timerFadeOut)
        objj_msgSend(_timerFadeOut, "invalidate");

    if (!objj_msgSend(self, "isEnabled"))
        return;

    _allowFadingOut = NO;
    _isMouseOver = YES;

    if (objj_msgSend(self, "alphaValue") > 0 && _knobProportion != 1.0)
        objj_msgSend(self, "setThemeState:", CPThemeStateSelected);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $CPScroller__mouseExited_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "mouseExited:", anEvent);

    if (objj_msgSend(self, "isHidden") || !objj_msgSend(self, "isEnabled") || !_isMouseOver)
        return;

    _allowFadingOut = YES;
    _isMouseOver = NO;

    if (_timerFadeOut)
        objj_msgSend(_timerFadeOut, "invalidate");

    _timerFadeOut = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 1.2, self, sel_getUid("_performFadeOut:"), nil, NO);
}
},["void","CPEvent"]), new objj_method(sel_getUid("animationDidEnd:"), function $CPScroller__animationDidEnd_(self, _cmd, animation)
{ with(self)
{
    objj_msgSend(self, "unsetThemeState:", CPThemeStateSelected);
}
},["void","CPAnimation"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPScroller__defaultThemeClass(self, _cmd)
{ with(self)
{
    return "scroller";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPScroller__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithJSObject:", {
        "scroller-width": 7.0,
        "knob-slot-color": objj_msgSend(CPNull, "null"),
        "decrement-line-color": objj_msgSend(CPNull, "null"),
        "increment-line-color": objj_msgSend(CPNull, "null"),
        "knob-color": objj_msgSend(CPNull, "null"),
        "decrement-line-size":{ width:0.0, height:0.0 },
        "increment-line-size":{ width:0.0, height:0.0 },
        "track-inset":{ top:(0), right:(0), bottom:(0), left:(0) },
        "knob-inset": { top:(0), right:(0), bottom:(0), left:(0) },
        "minimum-knob-length":21.0,
        "track-border-overlay": 9.0
    });
}
},["id"]), new objj_method(sel_getUid("scrollerWidth"), function $CPScroller__scrollerWidth(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "scrollerWidthInStyle:", CPScrollerStyleLegacy);
}
},["float"]), new objj_method(sel_getUid("scrollerWidthInStyle:"), function $CPScroller__scrollerWidthInStyle_(self, _cmd, aStyle)
{ with(self)
{
    var scroller = objj_msgSend(objj_msgSend(self, "alloc"), "init");

    if (aStyle == CPScrollerStyleLegacy)
        return objj_msgSend(scroller, "valueForThemeAttribute:inState:", "scroller-width", CPThemeStateScrollViewLegacy);
    return objj_msgSend(scroller, "currentValueForThemeAttribute:", "scroller-width");
}
},["float","int"]), new objj_method(sel_getUid("scrollerOverlay"), function $CPScroller__scrollerOverlay(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "alloc"), "init"), "currentValueForThemeAttribute:", "track-border-overlay");
}
},["float"]), new objj_method(sel_getUid("scrollerWidthForControlSize:"), function $CPScroller__scrollerWidthForControlSize_(self, _cmd, aControlSize)
{ with(self)
{
    return objj_msgSend(self, "scrollerWidth");
}
},["float","CPControlSize"])]);
}

var CPScrollerControlSizeKey = "CPScrollerControlSize",
    CPScrollerKnobProportionKey = "CPScrollerKnobProportion",
    CPScrollerStyleKey = "CPScrollerStyleKey";

{
var the_class = objj_getClass("CPScroller")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPScroller\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPScroller__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "initWithCoder:", aCoder))
    {
        _controlSize = CPRegularControlSize;

        if (objj_msgSend(aCoder, "containsValueForKey:", CPScrollerControlSizeKey))
            _controlSize = objj_msgSend(aCoder, "decodeIntForKey:", CPScrollerControlSizeKey);

        _knobProportion = 1.0;

        if (objj_msgSend(aCoder, "containsValueForKey:", CPScrollerKnobProportionKey))
            _knobProportion = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollerKnobProportionKey);

        _partRects = [];

        _hitPart = CPScrollerNoPart;

        _allowFadingOut = YES;
        _isMouseOver = NO;

        var paramAnimFadeOut = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self, CPViewAnimationFadeOutEffect], [CPViewAnimationTargetKey, CPViewAnimationEffectKey]);

        _animationScroller = objj_msgSend(objj_msgSend(CPViewAnimation, "alloc"), "initWithDuration:animationCurve:", 0.2, CPAnimationEaseInOut);
        objj_msgSend(_animationScroller, "setViewAnimations:", [paramAnimFadeOut]);
        objj_msgSend(_animationScroller, "setDelegate:", self);
        objj_msgSend(self, "setAlphaValue:", 0.0);

        objj_msgSend(self, "_calculateIsVertical");

        objj_msgSend(self, "setStyle:", objj_msgSend(aCoder, "decodeIntForKey:", CPScrollerStyleKey));
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPScroller__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "encodeWithCoder:", aCoder);

    objj_msgSend(aCoder, "encodeInt:forKey:", _controlSize, CPScrollerControlSizeKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _knobProportion, CPScrollerKnobProportionKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _style, CPScrollerStyleKey);
}
},["void","CPCoder"])]);
}

{
var the_class = objj_getClass("CPScroller")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPScroller\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setFloatValue:knobProportion:"), function $CPScroller__setFloatValue_knobProportion_(self, _cmd, aValue, aProportion)
{ with(self)
{
    objj_msgSend(self, "setFloatValue:", aValue);
    objj_msgSend(self, "setKnobProportion:", aProportion);
}
},["void","float","float"])]);
}

