@STATIC;1.0;i;11;CPControl.jt;19585;

objj_executeFile("CPControl.j", YES);

CPTickMarkBelow = 0;
CPTickMarkAbove = 1;
CPTickMarkLeft = CPTickMarkAbove;
CPTickMarkRight = CPTickMarkBelow;

CPRelevancyLevelIndicatorStyle = 0;
CPContinuousCapacityLevelIndicatorStyle = 1;
CPDiscreteCapacityLevelIndicatorStyle = 2;
CPRatingLevelIndicatorStyle = 3;

var _CPLevelIndicatorBezelColor = nil,
    _CPLevelIndicatorSegmentEmptyColor = nil,
    _CPLevelIndicatorSegmentNormalColor = nil,
    _CPLevelIndicatorSegmentWarningColor = nil,
    _CPLevelIndicatorSegmentCriticalColor = nil,

    _CPLevelIndicatorSpacing = 1;







{var the_class = objj_allocateClassPair(CPControl, "CPLevelIndicator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_levelIndicatorStyle"), new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_warningValue"), new objj_ivar("_criticalValue"), new objj_ivar("_tickMarkPosition"), new objj_ivar("_numberOfTickMarks"), new objj_ivar("_numberOfMajorTickMarks"), new objj_ivar("_isEditable"), new objj_ivar("_isTracking")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("levelIndicatorStyle"), function $CPLevelIndicator__levelIndicatorStyle(self, _cmd)
{ with(self)
{
return _levelIndicatorStyle;
}
},["id"]),
new objj_method(sel_getUid("setLevelIndicatorStyle:"), function $CPLevelIndicator__setLevelIndicatorStyle_(self, _cmd, newValue)
{ with(self)
{
_levelIndicatorStyle = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("minValue"), function $CPLevelIndicator__minValue(self, _cmd)
{ with(self)
{
return _minValue;
}
},["id"]),
new objj_method(sel_getUid("setMinValue:"), function $CPLevelIndicator__setMinValue_(self, _cmd, newValue)
{ with(self)
{
_minValue = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("maxValue"), function $CPLevelIndicator__maxValue(self, _cmd)
{ with(self)
{
return _maxValue;
}
},["id"]),
new objj_method(sel_getUid("setMaxValue:"), function $CPLevelIndicator__setMaxValue_(self, _cmd, newValue)
{ with(self)
{
_maxValue = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("warningValue"), function $CPLevelIndicator__warningValue(self, _cmd)
{ with(self)
{
return _warningValue;
}
},["id"]),
new objj_method(sel_getUid("setWarningValue:"), function $CPLevelIndicator__setWarningValue_(self, _cmd, newValue)
{ with(self)
{
_warningValue = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("criticalValue"), function $CPLevelIndicator__criticalValue(self, _cmd)
{ with(self)
{
return _criticalValue;
}
},["id"]),
new objj_method(sel_getUid("setCriticalValue:"), function $CPLevelIndicator__setCriticalValue_(self, _cmd, newValue)
{ with(self)
{
_criticalValue = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("tickMarkPosition"), function $CPLevelIndicator__tickMarkPosition(self, _cmd)
{ with(self)
{
return _tickMarkPosition;
}
},["id"]),
new objj_method(sel_getUid("setTickMarkPosition:"), function $CPLevelIndicator__setTickMarkPosition_(self, _cmd, newValue)
{ with(self)
{
_tickMarkPosition = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("numberOfTickMarks"), function $CPLevelIndicator__numberOfTickMarks(self, _cmd)
{ with(self)
{
return _numberOfTickMarks;
}
},["id"]),
new objj_method(sel_getUid("setNumberOfTickMarks:"), function $CPLevelIndicator__setNumberOfTickMarks_(self, _cmd, newValue)
{ with(self)
{
_numberOfTickMarks = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("numberOfMajorTickMarks"), function $CPLevelIndicator__numberOfMajorTickMarks(self, _cmd)
{ with(self)
{
return _numberOfMajorTickMarks;
}
},["id"]),
new objj_method(sel_getUid("setNumberOfMajorTickMarks:"), function $CPLevelIndicator__setNumberOfMajorTickMarks_(self, _cmd, newValue)
{ with(self)
{
_numberOfMajorTickMarks = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $CPLevelIndicator__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "initWithFrame:", aFrame);

    if (self)
    {
        _levelIndicatorStyle = CPDiscreteCapacityLevelIndicatorStyle;
        _maxValue = 2;
        _warningValue = 2;
        _criticalValue = 2;

        objj_msgSend(self, "_init");
    }

    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPLevelIndicator___init(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("layoutSubviews"), function $CPLevelIndicator__layoutSubviews(self, _cmd)
{ with(self)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel", CPWindowBelow, nil);

    objj_msgSend(bezelView, "setBackgroundColor:", _CPLevelIndicatorBezelColor);

    var segmentCount = _maxValue - _minValue;

    if (segmentCount <= 0)
        return;

    var filledColor = _CPLevelIndicatorSegmentNormalColor,
        value = objj_msgSend(self, "doubleValue");

    if (value <= _criticalValue)
        filledColor = _CPLevelIndicatorSegmentCriticalColor;
    else if (value <= _warningValue)
        filledColor = _CPLevelIndicatorSegmentWarningColor;

    for (var i = 0; i < segmentCount; i++)
    {
        var segmentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "segment-bezel-" + i, CPWindowAbove, bezelView);

        objj_msgSend(segmentView, "setBackgroundColor:", (_minValue + i) < value ? filledColor : _CPLevelIndicatorSegmentEmptyColor);
    }
}
},["void"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPLevelIndicator__createEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
}
},["CPView","CPString"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPLevelIndicator__rectForEphemeralSubviewNamed_(self, _cmd, aViewName)
{ with(self)
{

    var bezelHeight = 18,
        segmentHeight = 17,
        bounds = { origin: { x:objj_msgSend(self, "bounds").origin.x, y:objj_msgSend(self, "bounds").origin.y }, size: { width:objj_msgSend(self, "bounds").size.width, height:objj_msgSend(self, "bounds").size.height } };

    if (aViewName == "bezel")
    {
        bounds.origin.y = ((bounds.size.height) - bezelHeight) / 2.0;
        bounds.size.height = bezelHeight;
        return bounds;
    }
    else if (aViewName.indexOf("segment-bezel") === 0)
    {
        var segment = parseInt(aViewName.substring("segment-bezel-".length), 10),
            segmentCount = _maxValue - _minValue;

        if (segment >= segmentCount)
            return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };

        var basicSegmentWidth = bounds.size.width / segmentCount,
            segmentFrame = CGRectCreateCopy(objj_msgSend(self, "bounds"));

        segmentFrame.origin.y = ((bounds.size.height) - bezelHeight) / 2.0;
        segmentFrame.origin.x = FLOOR(segment * basicSegmentWidth);
        segmentFrame.size.width = (segment == segmentCount - 1) ? bounds.size.width - segmentFrame.origin.x : FLOOR(((segment + 1) * basicSegmentWidth)) - FLOOR((segment * basicSegmentWidth)) - _CPLevelIndicatorSpacing;
        segmentFrame.size.height = segmentHeight;

        return segmentFrame;
    }

    return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
}
},["CGRect","CPString"]), new objj_method(sel_getUid("setEditable:"), function $CPLevelIndicator__setEditable_(self, _cmd, shouldBeEditable)
{ with(self)
{
    if (_isEditable === shouldBeEditable)
        return;

    _isEditable = shouldBeEditable;
}
},["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPLevelIndicator__isEditable(self, _cmd)
{ with(self)
{
    return _isEditable;
}
},["BOOL"]), new objj_method(sel_getUid("hitTest:"), function $CPLevelIndicator__hitTest_(self, _cmd, aPoint)
{ with(self)
{

    if (!objj_msgSend(self, "isEditable"))
        return nil;

    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "hitTest:", aPoint);
}
},["CPView","CPPoint"]), new objj_method(sel_getUid("mouseDown:"), function $CPLevelIndicator__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEditable") || !objj_msgSend(self, "isEnabled"))
        return;

    objj_msgSend(self, "_trackMouse:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("_trackMouse:"), function $CPLevelIndicator___trackMouse_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");

    if (type == CPLeftMouseDown || type == CPLeftMouseDragged)
    {
        var segmentCount = _maxValue - _minValue;

        if (segmentCount <= 0)
            return;

        var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
            bounds = objj_msgSend(self, "bounds"),
            oldValue = objj_msgSend(self, "doubleValue"),
            newValue = oldValue;




        if (type == CPLeftMouseDragged && location.x < 0)
        {
            newValue = _minValue;
        }
        else if (type == CPLeftMouseDragged && location.x > bounds.size.width)
        {
            newValue = _maxValue;
        }
        else
        {
            for (var i = 0; i < segmentCount; i++)
            {
                var rect = objj_msgSend(self, "rectForEphemeralSubviewNamed:", "segment-bezel-" + i);


                if (location.x >= CGRectGetMinX(rect) && location.x < CGRectGetMaxX(rect))
                {
                    newValue = (_minValue + i + 1);
                    break;
                }
            }
        }

        if (newValue != oldValue)
            objj_msgSend(self, "setDoubleValue:", newValue);


        _isTracking = YES;
        objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("_trackMouse:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);

        if (objj_msgSend(self, "isContinuous"))
            objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }
    else if (_isTracking)
    {
        _isTracking = NO;
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }
}
},["void","CPEvent"]), new objj_method(sel_getUid("setMinValue:"), function $CPLevelIndicator__setMinValue_(self, _cmd, minValue)
{ with(self)
{
    if (_minValue === minValue)
        return;
    _minValue = minValue;

    objj_msgSend(self, "setNeedsLayout");
}
},["void","double"]), new objj_method(sel_getUid("setMaxValue:"), function $CPLevelIndicator__setMaxValue_(self, _cmd, maxValue)
{ with(self)
{
    if (_maxValue === maxValue)
        return;
    _maxValue = maxValue;

    objj_msgSend(self, "setNeedsLayout");
}
},["void","double"]), new objj_method(sel_getUid("setWarningValue:"), function $CPLevelIndicator__setWarningValue_(self, _cmd, warningValue)
{ with(self)
{
    if (_warningValue === warningValue)
        return;
    _warningValue = warningValue;

    objj_msgSend(self, "setNeedsLayout");
}
},["void","double"]), new objj_method(sel_getUid("setCriticalValue:"), function $CPLevelIndicator__setCriticalValue_(self, _cmd, criticalValue)
{ with(self)
{
    if (_criticalValue === criticalValue)
        return;
    _criticalValue = criticalValue;

    objj_msgSend(self, "setNeedsLayout");
}
},["void","double"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPLevelIndicator__initialize(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPLevelIndicator, "class"))
        return;

    var bundle = objj_msgSend(CPBundle, "bundleForClass:", CPLevelIndicator);

    _CPLevelIndicatorBezelColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-bezel-left.png"), CGSizeMake(3.0, 18.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-bezel-center.png"), CGSizeMake(1.0, 18.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-bezel-right.png"), CGSizeMake(3.0, 18.0))
        ], NO
    ));

    _CPLevelIndicatorSegmentEmptyColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-empty-left.png"), CGSizeMake(3.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-empty-center.png"), CGSizeMake(1.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-empty-right.png"), CGSizeMake(3.0, 17.0))
        ], NO
    ));

    _CPLevelIndicatorSegmentNormalColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-normal-left.png"), CGSizeMake(3.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-normal-center.png"), CGSizeMake(1.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-normal-right.png"), CGSizeMake(3.0, 17.0))
        ], NO
    ));

    _CPLevelIndicatorSegmentWarningColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-warning-left.png"), CGSizeMake(3.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-warning-center.png"), CGSizeMake(1.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-warning-right.png"), CGSizeMake(3.0, 17.0))
        ], NO
    ));

    _CPLevelIndicatorSegmentCriticalColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-critical-left.png"), CGSizeMake(3.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-critical-center.png"), CGSizeMake(1.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPLevelIndicator/level-indicator-segment-critical-right.png"), CGSizeMake(3.0, 17.0))
        ], NO
    ));
}
},["void"])]);
}

var CPLevelIndicatorStyleKey = "CPLevelIndicatorStyleKey",
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
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        _levelIndicatorStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPLevelIndicatorStyleKey);
        _minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPLevelIndicatorMinValueKey);
        _maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPLevelIndicatorMaxValueKey);
        _warningValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPLevelIndicatorWarningValueKey);
        _criticalValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPLevelIndicatorCriticalValueKey);
        _tickMarkPosition = objj_msgSend(aCoder, "decodeIntForKey:", CPLevelIndicatorTickMarkPositionKey);
        _numberOfTickMarks = objj_msgSend(aCoder, "decodeIntForKey:", CPLevelIndicatorNumberOfTickMarksKey);
        _numberOfMajorTickMarks = objj_msgSend(aCoder, "decodeIntForKey:", CPLevelIndicatorNumberOfMajorTickMarksKey);

        _isEditable = objj_msgSend(aCoder, "decodeBoolForKey:", CPLevelIndicatorIsEditableKey);

        objj_msgSend(self, "_init");

        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPLevelIndicator__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "encodeWithCoder:", aCoder);

    objj_msgSend(aCoder, "encodeInt:forKey:", _levelIndicatorStyle, CPLevelIndicatorStyleKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _minValue, CPLevelIndicatorMinValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _maxValue, CPLevelIndicatorMaxValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _warningValue, CPLevelIndicatorWarningValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _criticalValue, CPLevelIndicatorCriticalValueKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _tickMarkPosition, CPLevelIndicatorTickMarkPositionKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _numberOfTickMarks, CPLevelIndicatorNumberOfTickMarksKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _numberOfMajorTickMarks, CPLevelIndicatorNumberOfMajorTickMarksKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isEditable, CPLevelIndicatorIsEditableKey);
}
},["void","CPCoder"])]);
}

