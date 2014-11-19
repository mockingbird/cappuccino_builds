@STATIC;1.0;i;11;CPControl.ji;20;CPWindow_Constants.jt;17687;objj_executeFile("CPControl.j", YES);objj_executeFile("CPWindow_Constants.j", YES);CPLinearSlider = 0;
CPCircularSlider = 1;
{var the_class = objj_allocateClassPair(CPControl, "CPSlider"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_altIncrementValue"), new objj_ivar("_isVertical"), new objj_ivar("_dragOffset")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPSlider__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._minValue = 0.0;
        self._maxValue = 100.0;
        (self == null ? null : self.isa.objj_msgSend1(self, "setObjectValue:", 50.0));
        (self == null ? null : self.isa.objj_msgSend1(self, "setContinuous:", YES));
        (self == null ? null : self.isa.objj_msgSend0(self, "_recalculateIsVertical"));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setMinValue:"), function $CPSlider__setMinValue_(self, _cmd, aMinimumValue)
{
    if (self._minValue === aMinimumValue)
        return;
    self._minValue = aMinimumValue;
    var doubleValue = self.isa.objj_msgSend0(self, "doubleValue");
    if (doubleValue < self._minValue)
        self.isa.objj_msgSend1(self, "setDoubleValue:", self._minValue);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","float"]), new objj_method(sel_getUid("minValue"), function $CPSlider__minValue(self, _cmd)
{
    return self._minValue;
}
,["float"]), new objj_method(sel_getUid("setMaxValue:"), function $CPSlider__setMaxValue_(self, _cmd, aMaximumValue)
{
    if (self._maxValue === aMaximumValue)
        return;
    self._maxValue = aMaximumValue;
    var doubleValue = self.isa.objj_msgSend0(self, "doubleValue");
    if (doubleValue > self._maxValue)
        self.isa.objj_msgSend1(self, "setDoubleValue:", self._maxValue);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","float"]), new objj_method(sel_getUid("maxValue"), function $CPSlider__maxValue(self, _cmd)
{
    return self._maxValue;
}
,["float"]), new objj_method(sel_getUid("setObjectValue:"), function $CPSlider__setObjectValue_(self, _cmd, aValue)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "setObjectValue:", MIN(MAX(aValue, self._minValue), self._maxValue));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","id"]), new objj_method(sel_getUid("setSliderType:"), function $CPSlider__setSliderType_(self, _cmd, aSliderType)
{
    if (aSliderType === CPCircularSlider)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateCircular);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateCircular);
}
,["void","CPSliderType"]), new objj_method(sel_getUid("sliderType"), function $CPSlider__sliderType(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateCircular) ? CPCircularSlider : CPLinearSlider;
}
,["CPSliderType"]), new objj_method(sel_getUid("trackRectForBounds:"), function $CPSlider__trackRectForBounds_(self, _cmd, bounds)
{
    if (self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateCircular))
    {
        var originalBounds = CGRectCreateCopy(bounds);
        bounds.size.width = MIN(bounds.size.width, bounds.size.height);
        bounds.size.height = bounds.size.width;
        if (bounds.size.width < originalBounds.size.width)
            bounds.origin.x += (originalBounds.size.width - bounds.size.width) / 2.0;
        else
            bounds.origin.y += (originalBounds.size.height - bounds.size.height) / 2.0;
    }
    else
    {
        var trackWidth = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "track-width");
        if (trackWidth <= 0)
            return CGRectMakeZero();
        if (self.isa.objj_msgSend0(self, "isVertical"))
        {
            bounds.origin.x = (CGRectGetWidth(bounds) - trackWidth) / 2.0;
            bounds.size.width = trackWidth;
        }
        else
        {
            bounds.origin.y = (CGRectGetHeight(bounds) - trackWidth) / 2.0;
            bounds.size.height = trackWidth;
        }
    }
    return bounds;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("knobRectForBounds:"), function $CPSlider__knobRectForBounds_(self, _cmd, bounds)
{
    var knobSize = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "knob-size");
    if (knobSize.width <= 0 || knobSize.height <= 0)
        return CGRectMakeZero();
    var knobRect = CGRectMake(0.0, 0.0, knobSize.width, knobSize.height),
        trackRect = self.isa.objj_msgSend1(self, "trackRectForBounds:", bounds);
    if (!trackRect || CGRectIsEmpty(trackRect))
        trackRect = bounds;
    if (self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateCircular))
    {
        var angle = 3 * PI_2 - (1.0 - self.isa.objj_msgSend0(self, "doubleValue") - self._minValue) / (self._maxValue - self._minValue) * PI2,
            radius = CGRectGetWidth(trackRect) / 2.0 - 8.0;
        knobRect.origin.x = radius * COS(angle) + CGRectGetMidX(trackRect) - 3.0;
        knobRect.origin.y = radius * SIN(angle) + CGRectGetMidY(trackRect) - 2.0;
    }
    else if (self.isa.objj_msgSend0(self, "isVertical"))
    {
        knobRect.origin.x = CGRectGetMidX(trackRect) - knobSize.width / 2.0;
        knobRect.origin.y = (self._maxValue - self.isa.objj_msgSend0(self, "doubleValue")) / (self._maxValue - self._minValue) * (CGRectGetHeight(trackRect) - knobSize.height);
    }
    else
    {
        knobRect.origin.x = (self.isa.objj_msgSend0(self, "doubleValue") - self._minValue) / (self._maxValue - self._minValue) * (CGRectGetWidth(trackRect) - knobSize.width);
        knobRect.origin.y = CGRectGetMidY(trackRect) - knobSize.height / 2.0;
    }
    return knobRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPSlider__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "track-view")
        return self.isa.objj_msgSend1(self, "trackRectForBounds:", self.isa.objj_msgSend0(self, "bounds"));
    else if (aName === "knob-view")
        return self.isa.objj_msgSend1(self, "knobRectForBounds:", self.isa.objj_msgSend0(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPSlider__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "track-view" || aName === "knob-view")
    {
        var view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (view == null ? null : view.isa.objj_msgSend1(view, "setHitTests:", NO));
        return view;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "createEphemeralSubviewNamed:", aName);
    var ___r1;
}
,["CPView","CPString"]), new objj_method(sel_getUid("setAltIncrementValue:"), function $CPSlider__setAltIncrementValue_(self, _cmd, anAltIncrementValue)
{
    self._altIncrementValue = anAltIncrementValue;
}
,["void","float"]), new objj_method(sel_getUid("altIncrementValue"), function $CPSlider__altIncrementValue(self, _cmd)
{
    return self._altIncrementValue;
}
,["float"]), new objj_method(sel_getUid("setFrameSize:"), function $CPSlider__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "setFrameSize:", aSize);
    self.isa.objj_msgSend0(self, "_recalculateIsVertical");
}
,["void","CGSize"]), new objj_method(sel_getUid("_recalculateIsVertical"), function $CPSlider___recalculateIsVertical(self, _cmd)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        width = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds);
    self._isVertical = width < height ? 1 : width > height ? 0 : -1;
    if (self._isVertical === 1)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateVertical);
    else if (self._isVertical === 0)
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateVertical);
}
,["void"]), new objj_method(sel_getUid("isVertical"), function $CPSlider__isVertical(self, _cmd)
{
    return self._isVertical;
}
,["int"]), new objj_method(sel_getUid("layoutSubviews"), function $CPSlider__layoutSubviews(self, _cmd)
{
    var trackView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "track-view", CPWindowBelow, "knob-view");
    if (trackView)
        (trackView == null ? null : trackView.isa.objj_msgSend1(trackView, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "track-color")));
    var knobView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "knob-view", CPWindowAbove, "track-view");
    if (knobView)
        (knobView == null ? null : knobView.isa.objj_msgSend1(knobView, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "knob-color")));
}
,["void"]), new objj_method(sel_getUid("tracksMouseOutsideOfFrame"), function $CPSlider__tracksMouseOutsideOfFrame(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_valueAtPoint:"), function $CPSlider___valueAtPoint_(self, _cmd, aPoint)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        knobRect = self.isa.objj_msgSend1(self, "knobRectForBounds:", bounds),
        trackRect = self.isa.objj_msgSend1(self, "trackRectForBounds:", bounds);
    if (self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateCircular))
    {
        var knobWidth = CGRectGetWidth(knobRect);
        trackRect.origin.x += knobWidth / 2;
        trackRect.size.width -= knobWidth;
        var minValue = self.isa.objj_msgSend0(self, "minValue"),
            dx = aPoint.x - CGRectGetMidX(trackRect),
            dy = aPoint.y - CGRectGetMidY(trackRect);
        return MAX(0.0, MIN(1.0, 1.0 - (3 * PI_2 - ATAN2(dy, dx)) % PI2 / PI2)) * (self.isa.objj_msgSend0(self, "maxValue") - minValue) + minValue;
    }
    else if (self.isa.objj_msgSend0(self, "isVertical"))
    {
        var knobHeight = CGRectGetHeight(knobRect);
        trackRect.origin.y += knobHeight / 2;
        trackRect.size.height -= knobHeight;
        var minValue = self.isa.objj_msgSend0(self, "minValue");
        return MAX(0.0, MIN(1.0, (CGRectGetMaxY(trackRect) - aPoint.y) / CGRectGetHeight(trackRect))) * (self.isa.objj_msgSend0(self, "maxValue") - minValue) + minValue;
    }
    else
    {
        var knobWidth = CGRectGetWidth(knobRect);
        trackRect.origin.x += knobWidth / 2;
        trackRect.size.width -= knobWidth;
        var minValue = self.isa.objj_msgSend0(self, "minValue");
        return MAX(0.0, MIN(1.0, (aPoint.x - CGRectGetMinX(trackRect)) / CGRectGetWidth(trackRect))) * (self.isa.objj_msgSend0(self, "maxValue") - minValue) + minValue;
    }
}
,["float","CGPoint"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPSlider__startTrackingAt_(self, _cmd, aPoint)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        knobRect = self.isa.objj_msgSend1(self, "knobRectForBounds:", CGRectMakeCopy(bounds));
    if (CGRectContainsPoint(knobRect, aPoint))
        self._dragOffset = CGSizeMake(CGRectGetMidX(knobRect) - aPoint.x, CGRectGetMidY(knobRect) - aPoint.y);
    else
    {
        var trackRect = self.isa.objj_msgSend1(self, "trackRectForBounds:", bounds);
        if (trackRect && CGRectContainsPoint(trackRect, aPoint))
        {
            self._dragOffset = CGSizeMakeZero();
            self.isa.objj_msgSend1(self, "setObjectValue:", self.isa.objj_msgSend1(self, "_valueAtPoint:", aPoint));
        }
        else
            return NO;
    }
    self.isa.objj_msgSend1(self, "setHighlighted:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    return YES;
}
,["BOOL","CGPoint"]), new objj_method(sel_getUid("continueTracking:at:"), function $CPSlider__continueTracking_at_(self, _cmd, lastPoint, aPoint)
{
    self.isa.objj_msgSend1(self, "setObjectValue:", self.isa.objj_msgSend1(self, "_valueAtPoint:", CGPointMake(aPoint.x + self._dragOffset.width, aPoint.y + self._dragOffset.height)));
    return YES;
}
,["BOOL","CGPoint","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPSlider__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{
    self.isa.objj_msgSend1(self, "setHighlighted:", NO);
    if (((___r1 = self._target), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("sliderDidFinish:"))))
        ((___r1 = self._target), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sliderDidFinish:", self));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
}
,["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("isContinuous"), function $CPSlider__isContinuous(self, _cmd)
{
    return (self._sendActionOn & CPLeftMouseDraggedMask) !== 0;
}
,["BOOL"]), new objj_method(sel_getUid("setContinuous:"), function $CPSlider__setContinuous_(self, _cmd, flag)
{
    if (flag)
        self._sendActionOn |= CPLeftMouseDraggedMask;
    else
        self._sendActionOn &= ~CPLeftMouseDraggedMask;
}
,["void","BOOL"]), new objj_method(sel_getUid("takeValueFromKeyPath:ofObjects:"), function $CPSlider__takeValueFromKeyPath_ofObjects_(self, _cmd, aKeyPath, objects)
{
    var count = objects.length,
        value = ((___r1 = objects[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", aKeyPath));
    self.isa.objj_msgSend1(self, "setObjectValue:", value);
    while (count-- > 1)
        if (value !== ((___r1 = objects[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", aKeyPath)))
            return self.isa.objj_msgSend1(self, "setFloatValue:", 1.0);
    var ___r1;
}
,["void","CPString","CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPSlider__defaultThemeClass(self, _cmd)
{
    return "slider";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPSlider__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "knob-color", CGSizeMakeZero(), "knob-size", 0.0, "track-width", CPNull.isa.objj_msgSend0(CPNull, "null"), "track-color");
}
,["CPDictionary"])]);
}var CPSliderMinValueKey = "CPSliderMinValueKey",
    CPSliderMaxValueKey = "CPSliderMaxValueKey",
    CPSliderAltIncrValueKey = "CPSliderAltIncrValueKey";
{
var the_class = objj_getClass("CPSlider")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSlider\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPSlider__initWithCoder_(self, _cmd, aCoder)
{
    self._minValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", CPSliderMinValueKey));
    self._maxValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", CPSliderMaxValueKey));
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._altIncrementValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", CPSliderAltIncrValueKey));
        (self == null ? null : self.isa.objj_msgSend0(self, "_recalculateIsVertical"));
        (self == null ? null : self.isa.objj_msgSend0(self, "setNeedsLayout"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSlider__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeDouble:forKey:", self._minValue, CPSliderMinValueKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeDouble:forKey:", self._maxValue, CPSliderMaxValueKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeDouble:forKey:", self._altIncrementValue, CPSliderAltIncrValueKey));
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPSlider")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSlider\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("value"), function $CPSlider__value(self, _cmd)
{
    CPLog.warn("[CPSlider value] is deprecated, use doubleValue or objectValue instead.");
    return self.isa.objj_msgSend0(self, "doubleValue");
}
,["id"]), new objj_method(sel_getUid("setValue:"), function $CPSlider__setValue_(self, _cmd, aValue)
{
    CPLog.warn("[CPSlider setValue:] is deprecated, use setDoubleValue: or setObjectValue: instead.");
    self.isa.objj_msgSend1(self, "setObjectValue:", aValue);
}
,["void","id"])]);
}