@STATIC;1.0;I;27;AppKit/CPSegmentedControl.ji;8;NSCell.jt;6108;objj_executeFile("AppKit/CPSegmentedControl.j", NO);objj_executeFile("NSCell.j", YES);{
var the_class = objj_getClass("CPSegmentedControl")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSegmentedControl\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPSegmentedControl__NS_initWithCoder_(self, _cmd, aCoder)
{
    self._segments = [];
    self._themeStates = [];
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPSegmentedControl__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "NS_initWithCell:", cell);
    var frame = objj_msgSend(self, "frame"),
        originalWidth = frame.size.width;
    frame.size.width = 0;
    frame.origin.x = MAX(frame.origin.x - 4.0, 0.0);
    objj_msgSend(self, "setFrame:", frame);
    self._segments = objj_msgSend(cell, "segments");
    self._selectedSegment = objj_msgSend(cell, "selectedSegment");
    self._segmentStyle = objj_msgSend(cell, "segmentStyle");
    self._trackingMode = objj_msgSend(cell, "trackingMode");
    objj_msgSend(self, "setValue:forThemeAttribute:", CPCenterTextAlignment, "alignment");
    for (var i = 0; i < self._segments.length; i++)
    {
        self._themeStates[i] = self._segments[i].selected ? CPThemeStateSelected : CPThemeStateNormal;
        objj_msgSend(self, "tileWithChangedSegment:", i);
    }
    frame.origin.x += 6;
    if (objj_msgSend(objj_msgSend(Nib2Cib, "defaultTheme"), "name") == "Aristo2")
        frame.size.height += 1;
    frame.size.width = originalWidth;
    objj_msgSend(self, "setFrame:", frame);
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPSegmentedControl, "NSSegmentedControl"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSegmentedControl__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSSegmentedControl__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPSegmentedControl, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSActionCell, "NSSegmentedCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_segments"), new objj_ivar("_selectedSegment"), new objj_ivar("_segmentStyle"), new objj_ivar("_trackingMode")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("segments"), function $NSSegmentedCell__segments(self, _cmd)
{
    return self._segments;
}
,["CPArray"]), new objj_method(sel_getUid("selectedSegment"), function $NSSegmentedCell__selectedSegment(self, _cmd)
{
    return self._selectedSegment;
}
,["int"]), new objj_method(sel_getUid("segmentStyle"), function $NSSegmentedCell__segmentStyle(self, _cmd)
{
    return self._segmentStyle;
}
,["int"]), new objj_method(sel_getUid("trackingMode"), function $NSSegmentedCell__trackingMode(self, _cmd)
{
    return self._trackingMode;
}
,["CPSegmentSwitchTracking"]), new objj_method(sel_getUid("initWithCoder:"), function $NSSegmentedCell__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSSegmentedCell").super_class }, "initWithCoder:", aCoder))
    {
        self._segments = objj_msgSend(aCoder, "decodeObjectForKey:", "NSSegmentImages");
        self._selectedSegment = objj_msgSend(aCoder, "decodeObjectForKey:", "NSSelectedSegment");
        if (self._selectedSegment === nil)
            self._selectedSegment = -1;
        self._segmentStyle = objj_msgSend(aCoder, "decodeIntForKey:", "NSSegmentStyle");
        self._trackingMode = objj_msgSend(aCoder, "decodeIntForKey:", "NSTrackingMode");
        if (self._trackingMode == CPSegmentSwitchTrackingSelectOne && self._selectedSegment == -1)
            self._selectedSegment = 0;
    }
    return self;
}
,["id","CPCoder"])]);
}{
var the_class = objj_getClass("_CPSegmentItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPSegmentItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPSegmentItem__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPSegmentItem").super_class }, "init"))
    {
        self.image = objj_msgSend(aCoder, "decodeObjectForKey:", "NSSegmentItemImage");
        self.label = objj_msgSend(aCoder, "decodeObjectForKey:", "NSSegmentItemLabel");
        self.menu = objj_msgSend(aCoder, "decodeObjectForKey:", "NSSegmentItemMenu");
        self.selected = objj_msgSend(aCoder, "decodeBoolForKey:", "NSSegmentItemSelected");
        self.enabled = !objj_msgSend(aCoder, "decodeBoolForKey:", "NSSegmentItemDisabled");
        self.tag = objj_msgSend(aCoder, "decodeIntForKey:", "NSSegmentItemTag");
        self.width = objj_msgSend(aCoder, "decodeIntForKey:", "NSSegmentItemWidth");
        self.frame = CGRectMakeZero();
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPSegmentItem, "NSSegmentItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSegmentItem__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSSegmentItem__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPSegmentItem, "class");
}
,["Class"])]);
}