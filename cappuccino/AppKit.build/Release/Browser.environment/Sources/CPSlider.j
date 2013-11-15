@STATIC;1.0;i;11;CPControl.ji;20;CPWindow_Constants.jt;16149;objj_executeFile("CPControl.j", YES);objj_executeFile("CPWindow_Constants.j", YES);CPLinearSlider = 0;
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
        objj_msgSend(self, "setObjectValue:", 50.0);
        objj_msgSend(self, "setContinuous:", YES);
        objj_msgSend(self, "_recalculateIsVertical");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setMinValue:"), function $CPSlider__setMinValue_(self, _cmd, aMinimumValue)
{
    if (self._minValue === aMinimumValue)
        return;
    self._minValue = aMinimumValue;
    var doubleValue = objj_msgSend(self, "doubleValue");
    if (doubleValue < self._minValue)
        objj_msgSend(self, "setDoubleValue:", self._minValue);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
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
    var doubleValue = objj_msgSend(self, "doubleValue");
    if (doubleValue > self._maxValue)
        objj_msgSend(self, "setDoubleValue:", self._maxValue);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","float"]), new objj_method(sel_getUid("maxValue"), function $CPSlider__maxValue(self, _cmd)
{
    return self._maxValue;
}
,["float"]), new objj_method(sel_getUid("setObjectValue:"), function $CPSlider__setObjectValue_(self, _cmd, aValue)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "setObjectValue:", MIN(MAX(aValue, self._minValue), self._maxValue));
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","id"]), new objj_method(sel_getUid("setSliderType:"), function $CPSlider__setSliderType_(self, _cmd, aSliderType)
{
    if (aSliderType === CPCircularSlider)
        objj_msgSend(self, "setThemeState:", CPThemeStateCircular);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateCircular);
}
,["void","CPSliderType"]), new objj_method(sel_getUid("sliderType"), function $CPSlider__sliderType(self, _cmd)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateCircular) ? CPCircularSlider : CPLinearSlider;
}
,["CPSliderType"]), new objj_method(sel_getUid("trackRectForBounds:"), function $CPSlider__trackRectForBounds_(self, _cmd, bounds)
{
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateCircular))
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
        var trackWidth = objj_msgSend(self, "currentValueForThemeAttribute:", "track-width");
        if (trackWidth <= 0)
            return CGRectMakeZero();
        if (objj_msgSend(self, "isVertical"))
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
    var knobSize = objj_msgSend(self, "currentValueForThemeAttribute:", "knob-size");
    if (knobSize.width <= 0 || knobSize.height <= 0)
        return CGRectMakeZero();
    var knobRect = CGRectMake(0.0, 0.0, knobSize.width, knobSize.height),
        trackRect = objj_msgSend(self, "trackRectForBounds:", bounds);
    if (!trackRect || CGRectIsEmpty(trackRect))
        trackRect = bounds;
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateCircular))
    {
        var angle = 3 * PI_2 - (1.0 - objj_msgSend(self, "doubleValue") - self._minValue) / (self._maxValue - self._minValue) * PI2,
            radius = CGRectGetWidth(trackRect) / 2.0 - 8.0;
        knobRect.origin.x = radius * COS(angle) + CGRectGetMidX(trackRect) - 3.0;
        knobRect.origin.y = radius * SIN(angle) + CGRectGetMidY(trackRect) - 2.0;
    }
    else if (objj_msgSend(self, "isVertical"))
    {
        knobRect.origin.x = CGRectGetMidX(trackRect) - knobSize.width / 2.0;
        knobRect.origin.y = (self._maxValue - objj_msgSend(self, "doubleValue")) / (self._maxValue - self._minValue) * (CGRectGetHeight(trackRect) - knobSize.height);
    }
    else
    {
        knobRect.origin.x = (objj_msgSend(self, "doubleValue") - self._minValue) / (self._maxValue - self._minValue) * (CGRectGetWidth(trackRect) - knobSize.width);
        knobRect.origin.y = CGRectGetMidY(trackRect) - knobSize.height / 2.0;
    }
    return knobRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPSlider__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "track-view")
        return objj_msgSend(self, "trackRectForBounds:", objj_msgSend(self, "bounds"));
    else if (aName === "knob-view")
        return objj_msgSend(self, "knobRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPSlider__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "track-view" || aName === "knob-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "createEphemeralSubviewNamed:", aName);
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
    objj_msgSend(self, "_recalculateIsVertical");
}
,["void","CGSize"]), new objj_method(sel_getUid("_recalculateIsVertical"), function $CPSlider___recalculateIsVertical(self, _cmd)
{
    var bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds);
    self._isVertical = width < height ? 1 : width > height ? 0 : -1;
    if (self._isVertical === 1)
        objj_msgSend(self, "setThemeState:", CPThemeStateVertical);
    else if (self._isVertical === 0)
        objj_msgSend(self, "unsetThemeState:", CPThemeStateVertical);
}
,["void"]), new objj_method(sel_getUid("isVertical"), function $CPSlider__isVertical(self, _cmd)
{
    return self._isVertical;
}
,["int"]), new objj_method(sel_getUid("layoutSubviews"), function $CPSlider__layoutSubviews(self, _cmd)
{
    var trackView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "track-view", CPWindowBelow, "knob-view");
    if (trackView)
        objj_msgSend(trackView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "track-color"));
    var knobView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "knob-view", CPWindowAbove, "track-view");
    if (knobView)
        objj_msgSend(knobView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "knob-color"));
}
,["void"]), new objj_method(sel_getUid("tracksMouseOutsideOfFrame"), function $CPSlider__tracksMouseOutsideOfFrame(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_valueAtPoint:"), function $CPSlider___valueAtPoint_(self, _cmd, aPoint)
{
    var bounds = objj_msgSend(self, "bounds"),
        knobRect = objj_msgSend(self, "knobRectForBounds:", bounds),
        trackRect = objj_msgSend(self, "trackRectForBounds:", bounds);
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateCircular))
    {
        var knobWidth = CGRectGetWidth(knobRect);
        trackRect.origin.x += knobWidth / 2;
        trackRect.size.width -= knobWidth;
        var minValue = objj_msgSend(self, "minValue"),
            dx = aPoint.x - CGRectGetMidX(trackRect),
            dy = aPoint.y - CGRectGetMidY(trackRect);
        return MAX(0.0, MIN(1.0, 1.0 - (3 * PI_2 - ATAN2(dy, dx)) % PI2 / PI2)) * (objj_msgSend(self, "maxValue") - minValue) + minValue;
    }
    else if (objj_msgSend(self, "isVertical"))
    {
        var knobHeight = CGRectGetHeight(knobRect);
        trackRect.origin.y += knobHeight / 2;
        trackRect.size.height -= knobHeight;
        var minValue = objj_msgSend(self, "minValue");
        return MAX(0.0, MIN(1.0, (CGRectGetMaxY(trackRect) - aPoint.y) / CGRectGetHeight(trackRect))) * (objj_msgSend(self, "maxValue") - minValue) + minValue;
    }
    else
    {
        var knobWidth = CGRectGetWidth(knobRect);
        trackRect.origin.x += knobWidth / 2;
        trackRect.size.width -= knobWidth;
        var minValue = objj_msgSend(self, "minValue");
        return MAX(0.0, MIN(1.0, (aPoint.x - CGRectGetMinX(trackRect)) / CGRectGetWidth(trackRect))) * (objj_msgSend(self, "maxValue") - minValue) + minValue;
    }
}
,["float","CGPoint"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPSlider__startTrackingAt_(self, _cmd, aPoint)
{
    var bounds = objj_msgSend(self, "bounds"),
        knobRect = objj_msgSend(self, "knobRectForBounds:", CGRectMakeCopy(bounds));
    if (CGRectContainsPoint(knobRect, aPoint))
        self._dragOffset = CGSizeMake(CGRectGetMidX(knobRect) - aPoint.x, CGRectGetMidY(knobRect) - aPoint.y);
    else
    {
        var trackRect = objj_msgSend(self, "trackRectForBounds:", bounds);
        if (trackRect && CGRectContainsPoint(trackRect, aPoint))
        {
            self._dragOffset = CGSizeMakeZero();
            objj_msgSend(self, "setObjectValue:", objj_msgSend(self, "_valueAtPoint:", aPoint));
        }
        else
            return NO;
    }
    objj_msgSend(self, "setHighlighted:", YES);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    return YES;
}
,["BOOL","CGPoint"]), new objj_method(sel_getUid("continueTracking:at:"), function $CPSlider__continueTracking_at_(self, _cmd, lastPoint, aPoint)
{
    objj_msgSend(self, "setObjectValue:", objj_msgSend(self, "_valueAtPoint:", CGPointMake(aPoint.x + self._dragOffset.width, aPoint.y + self._dragOffset.height)));
    return YES;
}
,["BOOL","CGPoint","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPSlider__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{
    objj_msgSend(self, "setHighlighted:", NO);
    if (objj_msgSend(self._target, "respondsToSelector:", sel_getUid("sliderDidFinish:")))
        objj_msgSend(self._target, "sliderDidFinish:", self);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
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
        value = objj_msgSend(objects[0], "valueForKeyPath:", aKeyPath);
    objj_msgSend(self, "setObjectValue:", value);
    while (count-- > 1)
        if (value !== objj_msgSend(objects[count], "valueForKeyPath:", aKeyPath))
            return objj_msgSend(self, "setFloatValue:", 1.0);
}
,["void","CPString","CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPSlider__defaultThemeClass(self, _cmd)
{
    return "slider";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPSlider__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "knob-color", CGSizeMakeZero(), "knob-size", 0.0, "track-width", objj_msgSend(CPNull, "null"), "track-color");
}
,["id"])]);
}var CPSliderMinValueKey = "CPSliderMinValueKey",
    CPSliderMaxValueKey = "CPSliderMaxValueKey",
    CPSliderAltIncrValueKey = "CPSliderAltIncrValueKey";
{
var the_class = objj_getClass("CPSlider")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSlider\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPSlider__initWithCoder_(self, _cmd, aCoder)
{
    self._minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderMinValueKey);
    self._maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderMaxValueKey);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._altIncrementValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderAltIncrValueKey);
        objj_msgSend(self, "_recalculateIsVertical");
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSlider__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeDouble:forKey:", self._minValue, CPSliderMinValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", self._maxValue, CPSliderMaxValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", self._altIncrementValue, CPSliderAltIncrValueKey);
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPSlider")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSlider\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("value"), function $CPSlider__value(self, _cmd)
{
    CPLog.warn("[CPSlider value] is deprecated, use doubleValue or objectValue instead.");
    return objj_msgSend(self, "doubleValue");
}
,["id"]), new objj_method(sel_getUid("setValue:"), function $CPSlider__setValue_(self, _cmd, aValue)
{
    CPLog.warn("[CPSlider setValue:] is deprecated, use setDoubleValue: or setObjectValue: instead.");
    objj_msgSend(self, "setObjectValue:", aValue);
}
,["void","id"])]);
}