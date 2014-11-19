@STATIC;1.0;I;27;AppKit/CPSegmentedControl.ji;8;NSCell.jt;6611;objj_executeFile("AppKit/CPSegmentedControl.j", NO);objj_executeFile("NSCell.j", YES);{
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
    self._segments = (cell == null ? null : cell.isa.objj_msgSend0(cell, "segments"));
    self._selectedSegment = (cell == null ? null : cell.isa.objj_msgSend0(cell, "selectedSegment"));
    self._segmentStyle = (cell == null ? null : cell.isa.objj_msgSend0(cell, "segmentStyle"));
    self._trackingMode = (cell == null ? null : cell.isa.objj_msgSend0(cell, "trackingMode"));
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", CPCenterTextAlignment, "alignment");
    for (var i = 0; i < self._segments.length; i++)
    {
        self._themeStates[i] = self._segments[i].selected ? CPThemeStateSelected : CPThemeStateNormal;
        self.isa.objj_msgSend1(self, "tileWithChangedSegment:", i);
    }
    self.isa.objj_msgSend1(self, "setEnabled:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "isEnabled")));
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPSegmentedControl, "NSSegmentedControl"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSegmentedControl__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
        (self == null ? null : self.isa.objj_msgSend0(self, "_adjustNib2CibSize"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSSegmentedControl__classForKeyedArchiver(self, _cmd)
{
    return CPSegmentedControl.isa.objj_msgSend0(CPSegmentedControl, "class");
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
        self._segments = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSegmentImages"));
        self._selectedSegment = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSelectedSegment"));
        if (self._selectedSegment === nil)
            self._selectedSegment = -1;
        self._segmentStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSSegmentStyle"));
        self._trackingMode = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSTrackingMode"));
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
        self.image = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSegmentItemImage"));
        self.label = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSegmentItemLabel"));
        self.menu = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSegmentItemMenu"));
        self.selected = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSSegmentItemSelected"));
        self.enabled = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSSegmentItemDisabled"));
        self.tag = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSSegmentItemTag"));
        self.width = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSSegmentItemWidth"));
        self.frame = CGRectMakeZero();
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPSegmentItem, "NSSegmentItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSegmentItem__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSSegmentItem__classForKeyedArchiver(self, _cmd)
{
    return _CPSegmentItem.isa.objj_msgSend0(_CPSegmentItem, "class");
}
,["Class"])]);
}