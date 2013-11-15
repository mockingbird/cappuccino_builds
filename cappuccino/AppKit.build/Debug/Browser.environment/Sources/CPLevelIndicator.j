@STATIC;1.0;i;11;CPControl.ji;20;CPWindow_Constants.jt;15129;objj_executeFile("CPControl.j", YES);objj_executeFile("CPWindow_Constants.j", YES);CPTickMarkBelow = 0;
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
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel", CPWindowBelow, nil);
    objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "valueForThemeAttribute:", "bezel-color"));
    var segmentCount = self._maxValue - self._minValue;
    if (segmentCount <= 0)
        return;
    var filledColor = objj_msgSend(self, "valueForThemeAttribute:", "color-normal"),
        value = objj_msgSend(self, "doubleValue");
    if (value <= self._criticalValue)
        filledColor = objj_msgSend(self, "valueForThemeAttribute:", "color-critical");
    else if (value <= self._warningValue)
        filledColor = objj_msgSend(self, "valueForThemeAttribute:", "color-warning");
    for (var i = 0; i < segmentCount; i++)
    {
        var segmentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "segment-bezel-" + i, CPWindowAbove, bezelView);
        objj_msgSend(segmentView, "setBackgroundColor:", self._minValue + i < value ? filledColor : objj_msgSend(self, "valueForThemeAttribute:", "color-empty"));
    }
}
,["void"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPLevelIndicator__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    return objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
}
,["CPView","CPString"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPLevelIndicator__rectForEphemeralSubviewNamed_(self, _cmd, aViewName)
{
    var bezelHeight = 18,
        segmentHeight = 17,
        bounds = CGRectCreateCopy(objj_msgSend(self, "bounds"));
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
            segmentFrame = CGRectCreateCopy(objj_msgSend(self, "bounds")),
            spacing = objj_msgSend(self, "valueForThemeAttribute:", "spacing");
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
    if (!objj_msgSend(self, "isEditable"))
        return nil;
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "hitTest:", aPoint);
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("mouseDown:"), function $CPLevelIndicator__mouseDown_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self, "isEditable") || !objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "_trackMouse:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_trackMouse:"), function $CPLevelIndicator___trackMouse_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type");
    if (type == CPLeftMouseDown || type == CPLeftMouseDragged)
    {
        var segmentCount = self._maxValue - self._minValue;
        if (segmentCount <= 0)
            return;
        var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
            bounds = objj_msgSend(self, "bounds"),
            oldValue = objj_msgSend(self, "doubleValue"),
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
                var rect = objj_msgSend(self, "rectForEphemeralSubviewNamed:", "segment-bezel-" + i);
                if (location.x >= CGRectGetMinX(rect) && location.x < CGRectGetMaxX(rect))
                {
                    newValue = self._minValue + i + 1;
                    break;
                }
            }
        }
        if (newValue != oldValue)
            objj_msgSend(self, "setDoubleValue:", newValue);
        self._isTracking = YES;
        objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("_trackMouse:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
        if (objj_msgSend(self, "isContinuous"))
            objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }
    else if (self._isTracking)
    {
        self._isTracking = NO;
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }
}
,["void","CPEvent"]), new objj_method(sel_getUid("setMinValue:"), function $CPLevelIndicator__setMinValue_(self, _cmd, minValue)
{
    if (self._minValue === minValue)
        return;
    self._minValue = minValue;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","double"]), new objj_method(sel_getUid("setMaxValue:"), function $CPLevelIndicator__setMaxValue_(self, _cmd, maxValue)
{
    if (self._maxValue === maxValue)
        return;
    self._maxValue = maxValue;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","double"]), new objj_method(sel_getUid("setWarningValue:"), function $CPLevelIndicator__setWarningValue_(self, _cmd, warningValue)
{
    if (self._warningValue === warningValue)
        return;
    self._warningValue = warningValue;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","double"]), new objj_method(sel_getUid("setCriticalValue:"), function $CPLevelIndicator__setCriticalValue_(self, _cmd, criticalValue)
{
    if (self._criticalValue === criticalValue)
        return;
    self._criticalValue = criticalValue;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","double"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPLevelIndicator__defaultThemeClass(self, _cmd)
{
    return "level-indicator";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPLevelIndicator__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "bezel-color", objj_msgSend(CPNull, "null"), "color-empty", objj_msgSend(CPNull, "null"), "color-normal", objj_msgSend(CPNull, "null"), "color-warning", objj_msgSend(CPNull, "null"), "color-critical", 1.0, "spacing");
}
,["id"])]);
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
        self._levelIndicatorStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPLevelIndicatorStyleKey);
        self._minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPLevelIndicatorMinValueKey);
        self._maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPLevelIndicatorMaxValueKey);
        self._warningValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPLevelIndicatorWarningValueKey);
        self._criticalValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPLevelIndicatorCriticalValueKey);
        self._tickMarkPosition = objj_msgSend(aCoder, "decodeIntForKey:", CPLevelIndicatorTickMarkPositionKey);
        self._numberOfTickMarks = objj_msgSend(aCoder, "decodeIntForKey:", CPLevelIndicatorNumberOfTickMarksKey);
        self._numberOfMajorTickMarks = objj_msgSend(aCoder, "decodeIntForKey:", CPLevelIndicatorNumberOfMajorTickMarksKey);
        self._isEditable = objj_msgSend(aCoder, "decodeBoolForKey:", CPLevelIndicatorIsEditableKey);
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPLevelIndicator__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._levelIndicatorStyle, CPLevelIndicatorStyleKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", self._minValue, CPLevelIndicatorMinValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", self._maxValue, CPLevelIndicatorMaxValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", self._warningValue, CPLevelIndicatorWarningValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", self._criticalValue, CPLevelIndicatorCriticalValueKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._tickMarkPosition, CPLevelIndicatorTickMarkPositionKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._numberOfTickMarks, CPLevelIndicatorNumberOfTickMarksKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._numberOfMajorTickMarks, CPLevelIndicatorNumberOfMajorTickMarksKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isEditable, CPLevelIndicatorIsEditableKey);
}
,["void","CPCoder"])]);
}