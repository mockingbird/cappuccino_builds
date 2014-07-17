@STATIC;1.0;i;11;CPControl.ji;20;CPWindow_Constants.jt;16936;objj_executeFile("CPControl.j", YES);objj_executeFile("CPWindow_Constants.j", YES);CPTickMarkBelow = 0;
CPTickMarkAbove = 1;
CPTickMarkLeft = CPTickMarkAbove;
CPTickMarkRight = CPTickMarkBelow;
CPRelevancyLevelIndicatorStyle = 0;
CPContinuousCapacityLevelIndicatorStyle = 1;
CPDiscreteCapacityLevelIndicatorStyle = 2;
CPRatingLevelIndicatorStyle = 3;
{var the_class = objj_allocateClassPair(CPControl, "CPLevelIndicator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_levelIndicatorStyle"), new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_warningValue"), new objj_ivar("_criticalValue"), new objj_ivar("_tickMarkPosition"), new objj_ivar("_numberOfTickMarks"), new objj_ivar("_numberOfMajorTickMarks"), new objj_ivar("_isEditable"), new objj_ivar("_isTracking")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("levelIndicatorStyle"), function $CPLevelIndicator__levelIndicatorStyle(self, _cmd)
{
    return self._levelIndicatorStyle;
}
,["CPLevelIndicator"]), new objj_method(sel_getUid("setLevelIndicatorStyle:"), function $CPLevelIndicator__setLevelIndicatorStyle_(self, _cmd, newValue)
{
    self._levelIndicatorStyle = newValue;
}
,["void","CPLevelIndicator"]), new objj_method(sel_getUid("minValue"), function $CPLevelIndicator__minValue(self, _cmd)
{
    return self._minValue;
}
,["double"]), new objj_method(sel_getUid("setMinValue:"), function $CPLevelIndicator__setMinValue_(self, _cmd, newValue)
{
    self._minValue = newValue;
}
,["void","double"]), new objj_method(sel_getUid("maxValue"), function $CPLevelIndicator__maxValue(self, _cmd)
{
    return self._maxValue;
}
,["double"]), new objj_method(sel_getUid("setMaxValue:"), function $CPLevelIndicator__setMaxValue_(self, _cmd, newValue)
{
    self._maxValue = newValue;
}
,["void","double"]), new objj_method(sel_getUid("warningValue"), function $CPLevelIndicator__warningValue(self, _cmd)
{
    return self._warningValue;
}
,["double"]), new objj_method(sel_getUid("setWarningValue:"), function $CPLevelIndicator__setWarningValue_(self, _cmd, newValue)
{
    self._warningValue = newValue;
}
,["void","double"]), new objj_method(sel_getUid("criticalValue"), function $CPLevelIndicator__criticalValue(self, _cmd)
{
    return self._criticalValue;
}
,["double"]), new objj_method(sel_getUid("setCriticalValue:"), function $CPLevelIndicator__setCriticalValue_(self, _cmd, newValue)
{
    self._criticalValue = newValue;
}
,["void","double"]), new objj_method(sel_getUid("tickMarkPosition"), function $CPLevelIndicator__tickMarkPosition(self, _cmd)
{
    return self._tickMarkPosition;
}
,["CPTickMarkPosition"]), new objj_method(sel_getUid("setTickMarkPosition:"), function $CPLevelIndicator__setTickMarkPosition_(self, _cmd, newValue)
{
    self._tickMarkPosition = newValue;
}
,["void","CPTickMarkPosition"]), new objj_method(sel_getUid("numberOfTickMarks"), function $CPLevelIndicator__numberOfTickMarks(self, _cmd)
{
    return self._numberOfTickMarks;
}
,["int"]), new objj_method(sel_getUid("setNumberOfTickMarks:"), function $CPLevelIndicator__setNumberOfTickMarks_(self, _cmd, newValue)
{
    self._numberOfTickMarks = newValue;
}
,["void","int"]), new objj_method(sel_getUid("numberOfMajorTickMarks"), function $CPLevelIndicator__numberOfMajorTickMarks(self, _cmd)
{
    return self._numberOfMajorTickMarks;
}
,["int"]), new objj_method(sel_getUid("setNumberOfMajorTickMarks:"), function $CPLevelIndicator__setNumberOfMajorTickMarks_(self, _cmd, newValue)
{
    self._numberOfMajorTickMarks = newValue;
}
,["void","int"]), new objj_method(sel_getUid("initWithFrame:"), function $CPLevelIndicator__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._levelIndicatorStyle = CPDiscreteCapacityLevelIndicatorStyle;
        self._maxValue = 2;
        self._warningValue = 2;
        self._criticalValue = 2;
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPLevelIndicator__layoutSubviews(self, _cmd)
{
    var bezelView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel", CPWindowBelow, nil);
    (bezelView == null ? null : bezelView.isa.objj_msgSend1(bezelView, "setBackgroundColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "bezel-color")));
    var segmentCount = self._maxValue - self._minValue;
    if (segmentCount <= 0)
        return;
    var filledColor = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "color-normal"),
        value = self.isa.objj_msgSend0(self, "doubleValue");
    if (self._warningValue < self._criticalValue)
    {
        if (value >= self._criticalValue)
            filledColor = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "color-critical");
        else if (value >= self._warningValue)
            filledColor = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "color-warning");
    }
    else
    {
        if (value <= self._criticalValue)
            filledColor = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "color-critical");
        else if (value <= self._warningValue)
            filledColor = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "color-warning");
    }
    for (var i = 0; i < segmentCount; i++)
    {
        var segmentView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "segment-bezel-" + i, CPWindowAbove, bezelView);
        (segmentView == null ? null : segmentView.isa.objj_msgSend1(segmentView, "setBackgroundColor:", self._minValue + i < value ? filledColor : self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "color-empty")));
    }
}
,["void"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPLevelIndicator__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    return ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    var ___r1;
}
,["CPView","CPString"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPLevelIndicator__rectForEphemeralSubviewNamed_(self, _cmd, aViewName)
{
    var bezelHeight = 18,
        segmentHeight = 17,
        bounds = CGRectCreateCopy(self.isa.objj_msgSend0(self, "bounds"));
    if (aViewName == "bezel")
    {
        bounds.origin.y = (CGRectGetHeight(bounds) - bezelHeight) / 2.0;
        bounds.size.height = bezelHeight;
        return bounds;
    }
    else if (aViewName.indexOf("segment-bezel") === 0)
    {
        var segment = parseInt(aViewName.substring("segment-bezel-".length), 10),
            segmentCount = self._maxValue - self._minValue;
        if (segment >= segmentCount)
            return CGRectMakeZero();
        var basicSegmentWidth = bounds.size.width / segmentCount,
            segmentFrame = CGRectCreateCopy(self.isa.objj_msgSend0(self, "bounds")),
            spacing = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "spacing");
        segmentFrame.origin.y = (CGRectGetHeight(bounds) - bezelHeight) / 2.0;
        segmentFrame.origin.x = FLOOR(segment * basicSegmentWidth);
        segmentFrame.size.width = segment == segmentCount - 1 ? bounds.size.width - segmentFrame.origin.x : FLOOR((segment + 1) * basicSegmentWidth) - FLOOR(segment * basicSegmentWidth) - spacing;
        segmentFrame.size.height = segmentHeight;
        return segmentFrame;
    }
    return CGRectMakeZero();
}
,["CGRect","CPString"]), new objj_method(sel_getUid("setEditable:"), function $CPLevelIndicator__setEditable_(self, _cmd, shouldBeEditable)
{
    if (self._isEditable === shouldBeEditable)
        return;
    self._isEditable = shouldBeEditable;
}
,["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPLevelIndicator__isEditable(self, _cmd)
{
    return self._isEditable;
}
,["BOOL"]), new objj_method(sel_getUid("hitTest:"), function $CPLevelIndicator__hitTest_(self, _cmd, aPoint)
{
    if (!self.isa.objj_msgSend0(self, "isEditable"))
        return nil;
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "hitTest:", aPoint);
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("mouseDown:"), function $CPLevelIndicator__mouseDown_(self, _cmd, anEvent)
{
    if (!self.isa.objj_msgSend0(self, "isEditable") || !self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    self.isa.objj_msgSend1(self, "_trackMouse:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_trackMouse:"), function $CPLevelIndicator___trackMouse_(self, _cmd, anEvent)
{
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type"));
    if (type == CPLeftMouseDown || type == CPLeftMouseDragged)
    {
        var segmentCount = self._maxValue - self._minValue;
        if (segmentCount <= 0)
            return;
        var location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil),
            bounds = self.isa.objj_msgSend0(self, "bounds"),
            oldValue = self.isa.objj_msgSend0(self, "doubleValue"),
            newValue = oldValue;
        if (type == CPLeftMouseDragged && location.x < 0)
        {
            newValue = self._minValue;
        }
        else if (type == CPLeftMouseDragged && location.x > bounds.size.width)
        {
            newValue = self._maxValue;
        }
        else
        {
            for (var i = 0; i < segmentCount; i++)
            {
                var rect = self.isa.objj_msgSend1(self, "rectForEphemeralSubviewNamed:", "segment-bezel-" + i);
                if (location.x >= CGRectGetMinX(rect) && location.x < CGRectGetMaxX(rect))
                {
                    newValue = self._minValue + i + 1;
                    break;
                }
            }
        }
        if (newValue != oldValue)
            self.isa.objj_msgSend1(self, "setDoubleValue:", newValue);
        self._isTracking = YES;
        (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("_trackMouse:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES));
        if (self.isa.objj_msgSend0(self, "isContinuous"))
            self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
    }
    else if (self._isTracking)
    {
        self._isTracking = NO;
        self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
    }
}
,["void","CPEvent"]), new objj_method(sel_getUid("setMinValue:"), function $CPLevelIndicator__setMinValue_(self, _cmd, minValue)
{
    if (self._minValue === minValue)
        return;
    self._minValue = minValue;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","double"]), new objj_method(sel_getUid("setMaxValue:"), function $CPLevelIndicator__setMaxValue_(self, _cmd, maxValue)
{
    if (self._maxValue === maxValue)
        return;
    self._maxValue = maxValue;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","double"]), new objj_method(sel_getUid("setWarningValue:"), function $CPLevelIndicator__setWarningValue_(self, _cmd, warningValue)
{
    if (self._warningValue === warningValue)
        return;
    self._warningValue = warningValue;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","double"]), new objj_method(sel_getUid("setCriticalValue:"), function $CPLevelIndicator__setCriticalValue_(self, _cmd, criticalValue)
{
    if (self._criticalValue === criticalValue)
        return;
    self._criticalValue = criticalValue;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","double"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPLevelIndicator__defaultThemeClass(self, _cmd)
{
    return "level-indicator";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPLevelIndicator__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "color-empty", CPNull.isa.objj_msgSend0(CPNull, "null"), "color-normal", CPNull.isa.objj_msgSend0(CPNull, "null"), "color-warning", CPNull.isa.objj_msgSend0(CPNull, "null"), "color-critical", 1.0, "spacing");
}
,["CPDictionary"])]);
}var CPLevelIndicatorStyleKey = "CPLevelIndicatorStyleKey",
    CPLevelIndicatorMinValueKey = "CPLevelIndicatorMinValueKey",
    CPLevelIndicatorMaxValueKey = "CPLevelIndicatorMaxValueKey",
    CPLevelIndicatorWarningValueKey = "CPLevelIndicatorWarningValueKey",
    CPLevelIndicatorCriticalValueKey = "CPLevelIndicatorCriticalValueKey",
    CPLevelIndicatorTickMarkPositionKey = "CPLevelIndicatorTickMarkPositionKey",
    CPLevelIndicatorNumberOfTickMarksKey = "CPLevelIndicatorNumberOfTickMarksKey",
    CPLevelIndicatorNumberOfMajorTickMarksKey = "CPLevelIndicatorNumberOfMajorTickMarksKey",
    CPLevelIndicatorIsEditableKey = "CPLevelIndicatorIsEditableKey";
{
var the_class = objj_getClass("CPLevelIndicator")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPLevelIndicator\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPLevelIndicator__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._levelIndicatorStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPLevelIndicatorStyleKey));
        self._minValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", CPLevelIndicatorMinValueKey));
        self._maxValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", CPLevelIndicatorMaxValueKey));
        self._warningValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", CPLevelIndicatorWarningValueKey));
        self._criticalValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", CPLevelIndicatorCriticalValueKey));
        self._tickMarkPosition = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPLevelIndicatorTickMarkPositionKey));
        self._numberOfTickMarks = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPLevelIndicatorNumberOfTickMarksKey));
        self._numberOfMajorTickMarks = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPLevelIndicatorNumberOfMajorTickMarksKey));
        self._isEditable = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPLevelIndicatorIsEditableKey));
        (self == null ? null : self.isa.objj_msgSend0(self, "setNeedsLayout"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPLevelIndicator__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._levelIndicatorStyle, CPLevelIndicatorStyleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeDouble:forKey:", self._minValue, CPLevelIndicatorMinValueKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeDouble:forKey:", self._maxValue, CPLevelIndicatorMaxValueKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeDouble:forKey:", self._warningValue, CPLevelIndicatorWarningValueKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeDouble:forKey:", self._criticalValue, CPLevelIndicatorCriticalValueKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._tickMarkPosition, CPLevelIndicatorTickMarkPositionKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._numberOfTickMarks, CPLevelIndicatorNumberOfTickMarksKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._numberOfMajorTickMarks, CPLevelIndicatorNumberOfMajorTickMarksKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isEditable, CPLevelIndicatorIsEditableKey));
}
,["void","CPCoder"])]);
}