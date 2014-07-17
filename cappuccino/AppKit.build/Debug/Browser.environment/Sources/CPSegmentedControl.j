@STATIC;1.0;I;20;Foundation/CPArray.ji;11;CPControl.ji;20;CPWindow_Constants.ji;21;_CPImageAndTextView.jt;48182;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("CPControl.j", YES);objj_executeFile("CPWindow_Constants.j", YES);objj_executeFile("_CPImageAndTextView.j", YES);CPSegmentSwitchTrackingSelectOne = 0;
CPSegmentSwitchTrackingSelectAny = 1;
CPSegmentSwitchTrackingMomentary = 2;
{var the_class = objj_allocateClassPair(CPControl, "CPSegmentedControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_segments"), new objj_ivar("_themeStates"), new objj_ivar("_selectedSegment"), new objj_ivar("_segmentStyle"), new objj_ivar("_trackingMode"), new objj_ivar("_trackingSegment"), new objj_ivar("_trackingHighlighted")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPSegmentedControl__initWithFrame_(self, _cmd, aRect)
{
    self._segments = [];
    self._themeStates = [];
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "initWithFrame:", aRect);
    if (self)
    {
        self._selectedSegment = -1;
        self._trackingMode = CPSegmentSwitchTrackingSelectOne;
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"), function $CPSegmentedControl__bind_toObject_withKeyPath_options_(self, _cmd, aBinding, anObject, aKeyPath, options)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_isSelectionBinding:", aBinding)) && self._trackingMode !== CPSegmentSwitchTrackingSelectOne)
        CPLog.warn("Binding " + aBinding + " needs CPSegmentSwitchTrackingSelectOne tracking mode");
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "bind:toObject:withKeyPath:options:", aBinding, anObject, aKeyPath, options);
    var ___r1;
}
,["void","CPString","id","CPString","CPDictionary"]), new objj_method(sel_getUid("_reverseSetBinding"), function $CPSegmentedControl___reverseSetBinding(self, _cmd)
{
    (_CPSegmentedControlBinder == null ? null : _CPSegmentedControlBinder.isa.objj_msgSend1(_CPSegmentedControlBinder, "reverseSetValueForObject:", self));
}
,["void"]), new objj_method(sel_getUid("selectedTag"), function $CPSegmentedControl__selectedTag(self, _cmd)
{
    return ((___r1 = self._segments[self._selectedSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tag"));
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("setSegmentCount:"), function $CPSegmentedControl__setSegmentCount_(self, _cmd, aCount)
{
    if (self._segments.length == aCount)
        return;
    var height = CGRectGetHeight(self.isa.objj_msgSend0(self, "bounds")),
        dividersBefore = MAX(0, self._segments.length - 1),
        dividersAfter = MAX(0, aCount - 1);
    if (self._segments.length < aCount)
    {
        for (var index = self._segments.length; index < aCount; ++index)
        {
            self._segments[index] = ((___r1 = (_CPSegmentItem == null ? null : _CPSegmentItem.isa.objj_msgSend0(_CPSegmentItem, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
            self._themeStates[index] = CPThemeStateNormal;
        }
    }
    else if (aCount < self._segments.length)
    {
        self._segments.length = aCount;
        self._themeStates.length = aCount;
    }
    if (self._selectedSegment >= self._segments.length)
        self._selectedSegment = -1;
    var thickness = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "divider-thickness"),
        frame = self.isa.objj_msgSend0(self, "frame"),
        widthOfAllSegments = 0,
        dividerExtraSpace = (((___r1 = self._segments), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1) * thickness;
    for (var i = 0; i < ((___r1 = self._segments), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")); i++)
        widthOfAllSegments += ((___r1 = self._segments[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "width"));
    self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(widthOfAllSegments + dividerExtraSpace, frame.size.height));
    self.isa.objj_msgSend1(self, "tileWithChangedSegment:", 0);
    var ___r1;
}
,["void","unsigned"]), new objj_method(sel_getUid("segmentCount"), function $CPSegmentedControl__segmentCount(self, _cmd)
{
    return self._segments.length;
}
,["unsigned"]), new objj_method(sel_getUid("setSelectedSegment:"), function $CPSegmentedControl__setSelectedSegment_(self, _cmd, aSegment)
{
    self.isa.objj_msgSend2(self, "setSelected:forSegment:", YES, aSegment);
}
,["void","unsigned"]), new objj_method(sel_getUid("selectedSegment"), function $CPSegmentedControl__selectedSegment(self, _cmd)
{
    return self._selectedSegment;
}
,["unsigned"]), new objj_method(sel_getUid("selectSegmentWithTag:"), function $CPSegmentedControl__selectSegmentWithTag_(self, _cmd, aTag)
{
    var index = 0;
    for (; index < self._segments.length; ++index)
        if (self._segments[index].tag == aTag)
        {
            self.isa.objj_msgSend1(self, "setSelectedSegment:", index);
            return YES;
        }
    return NO;
}
,["BOOL","int"]), new objj_method(sel_getUid("_selectSegmentWithLabel:"), function $CPSegmentedControl___selectSegmentWithLabel_(self, _cmd, aLabel)
{
    var index = 0;
    for (; index < self._segments.length; ++index)
        if (self._segments[index].label == aLabel)
        {
            self.isa.objj_msgSend1(self, "setSelectedSegment:", index);
            return YES;
        }
    return NO;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("isTracking"), function $CPSegmentedControl__isTracking(self, _cmd)
{
}
,["BOOL"]), new objj_method(sel_getUid("setTrackingMode:"), function $CPSegmentedControl__setTrackingMode_(self, _cmd, aTrackingMode)
{
    if (self._trackingMode == aTrackingMode)
        return;
    self._trackingMode = aTrackingMode;
    if (self._trackingMode == CPSegmentSwitchTrackingSelectOne)
    {
        var index = 0,
            selected = NO;
        for (; index < self._segments.length; ++index)
            if (((___r1 = self._segments[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selected")))
                if (selected)
                    self.isa.objj_msgSend2(self, "setSelected:forSegment:", NO, index);
                else
                    selected = YES;
    }
    else if (self._trackingMode == CPSegmentSwitchTrackingMomentary)
    {
        var index = 0;
        for (; index < self._segments.length; ++index)
            if (((___r1 = self._segments[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selected")))
                self.isa.objj_msgSend2(self, "setSelected:forSegment:", NO, index);
    }
    var ___r1;
}
,["void","CPSegmentSwitchTracking"]), new objj_method(sel_getUid("trackingMode"), function $CPSegmentedControl__trackingMode(self, _cmd)
{
    return self._trackingMode;
}
,["CPSegmentSwitchTracking"]), new objj_method(sel_getUid("setWidth:forSegment:"), function $CPSegmentedControl__setWidth_forSegment_(self, _cmd, aWidth, aSegment)
{
    ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWidth:", aWidth));
    self.isa.objj_msgSend1(self, "tileWithChangedSegment:", aSegment);
    var ___r1;
}
,["void","float","unsigned"]), new objj_method(sel_getUid("widthForSegment:"), function $CPSegmentedControl__widthForSegment_(self, _cmd, aSegment)
{
    return ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "width"));
    var ___r1;
}
,["float","unsigned"]), new objj_method(sel_getUid("setImage:forSegment:"), function $CPSegmentedControl__setImage_forSegment_(self, _cmd, anImage, aSegment)
{
    ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", anImage));
    self.isa.objj_msgSend1(self, "tileWithChangedSegment:", aSegment);
    var ___r1;
}
,["void","CPImage","unsigned"]), new objj_method(sel_getUid("imageForSegment:"), function $CPSegmentedControl__imageForSegment_(self, _cmd, aSegment)
{
    return ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "image"));
    var ___r1;
}
,["CPImage","unsigned"]), new objj_method(sel_getUid("setLabel:forSegment:"), function $CPSegmentedControl__setLabel_forSegment_(self, _cmd, aLabel, aSegment)
{
    ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLabel:", aLabel));
    self.isa.objj_msgSend1(self, "tileWithChangedSegment:", aSegment);
    var ___r1;
}
,["void","CPString","unsigned"]), new objj_method(sel_getUid("labelForSegment:"), function $CPSegmentedControl__labelForSegment_(self, _cmd, aSegment)
{
    return ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "label"));
    var ___r1;
}
,["CPString","unsigned"]), new objj_method(sel_getUid("setMenu:forSegment:"), function $CPSegmentedControl__setMenu_forSegment_(self, _cmd, aMenu, aSegment)
{
    ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMenu:", aMenu));
    var ___r1;
}
,["void","CPMenu","unsigned"]), new objj_method(sel_getUid("menuForSegment:"), function $CPSegmentedControl__menuForSegment_(self, _cmd, aSegment)
{
    return ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "menu"));
    var ___r1;
}
,["CPMenu","unsigned"]), new objj_method(sel_getUid("setSelected:forSegment:"), function $CPSegmentedControl__setSelected_forSegment_(self, _cmd, isSelected, aSegment)
{
    var segment = self._segments[aSegment];
    if ((segment == null ? null : segment.isa.objj_msgSend0(segment, "selected")) == isSelected)
        return;
    (segment == null ? null : segment.isa.objj_msgSend1(segment, "setSelected:", isSelected));
    self._themeStates[aSegment] = isSelected ? CPThemeStateSelected : CPThemeStateNormal;
    if (isSelected)
    {
        var oldSelectedSegment = self._selectedSegment;
        self._selectedSegment = aSegment;
        if (self._trackingMode == CPSegmentSwitchTrackingSelectOne && oldSelectedSegment != aSegment && oldSelectedSegment != -1)
        {
            ((___r1 = self._segments[oldSelectedSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSelected:", NO));
            self._themeStates[oldSelectedSegment] = CPThemeStateNormal;
            self.isa.objj_msgSend2(self, "drawSegmentBezel:highlight:", oldSelectedSegment, NO);
        }
    }
    if (self._trackingMode != CPSegmentSwitchTrackingMomentary)
        self.isa.objj_msgSend2(self, "drawSegmentBezel:highlight:", aSegment, NO);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
}
,["void","BOOL","unsigned"]), new objj_method(sel_getUid("isSelectedForSegment:"), function $CPSegmentedControl__isSelectedForSegment_(self, _cmd, aSegment)
{
    return ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selected"));
    var ___r1;
}
,["BOOL","unsigned"]), new objj_method(sel_getUid("setEnabled:forSegment:"), function $CPSegmentedControl__setEnabled_forSegment_(self, _cmd, shouldBeEnabled, aSegment)
{
    if (((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "enabled")) === shouldBeEnabled)
        return;
    ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", shouldBeEnabled));
    if (shouldBeEnabled)
        self._themeStates[aSegment] = self._themeStates[aSegment].without(CPThemeStateDisabled);
    else
        self._themeStates[aSegment] = self._themeStates[aSegment].and(CPThemeStateDisabled);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
}
,["void","BOOL","unsigned"]), new objj_method(sel_getUid("isEnabledForSegment:"), function $CPSegmentedControl__isEnabledForSegment_(self, _cmd, aSegment)
{
    return ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "enabled"));
    var ___r1;
}
,["BOOL","unsigned"]), new objj_method(sel_getUid("setTag:forSegment:"), function $CPSegmentedControl__setTag_forSegment_(self, _cmd, aTag, aSegment)
{
    ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTag:", aTag));
    var ___r1;
}
,["void","int","unsigned"]), new objj_method(sel_getUid("tagForSegment:"), function $CPSegmentedControl__tagForSegment_(self, _cmd, aSegment)
{
    return ((___r1 = self._segments[aSegment]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tag"));
    var ___r1;
}
,["int","unsigned"]), new objj_method(sel_getUid("drawSegmentBezel:highlight:"), function $CPSegmentedControl__drawSegmentBezel_highlight_(self, _cmd, aSegment, shouldHighlight)
{
    if (aSegment < self._themeStates.length)
    {
        if (shouldHighlight)
            self._themeStates[aSegment] = self._themeStates[aSegment].and(CPThemeStateHighlighted);
        else
            self._themeStates[aSegment] = self._themeStates[aSegment].without(CPThemeStateHighlighted);
    }
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","int","BOOL"]), new objj_method(sel_getUid("_leftOffsetForSegment:"), function $CPSegmentedControl___leftOffsetForSegment_(self, _cmd, segment)
{
    var bezelInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-inset");
    if (segment == 0)
        return bezelInset.left;
    var thickness = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "divider-thickness");
    return self.isa.objj_msgSend1(self, "_leftOffsetForSegment:", segment - 1) + self.isa.objj_msgSend1(self, "widthForSegment:", segment - 1) + thickness;
}
,["float","unsigned"]), new objj_method(sel_getUid("_indexOfLastSegment"), function $CPSegmentedControl___indexOfLastSegment(self, _cmd)
{
    var lastSegmentIndex = ((___r1 = self._segments), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1;
    if (lastSegmentIndex < 0)
        lastSegmentIndex = 0;
    return lastSegmentIndex;
    var ___r1;
}
,["unsigned"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPSegmentedControl__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    var height = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "default-height"),
        contentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset"),
        bezelInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-inset"),
        bounds = self.isa.objj_msgSend0(self, "bounds");
    if (aName === "left-segment-bezel")
    {
        return CGRectMake(bezelInset.left, bezelInset.top, contentInset.left, height);
    }
    else if (aName === "right-segment-bezel")
    {
        return CGRectMake(CGRectGetWidth(self.isa.objj_msgSend0(self, "bounds")) - contentInset.right, bezelInset.top, contentInset.right, height);
    }
    else if (aName.indexOf("segment-bezel") === 0)
    {
        var segment = parseInt(aName.substring("segment-bezel-".length), 10),
            frame = CGRectCreateCopy(((___r1 = self._segments[segment]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
        if (segment === 0)
        {
            frame.origin.x += contentInset.left;
            frame.size.width -= contentInset.left;
        }
        if (segment === self._segments.length - 1)
            frame.size.width = CGRectGetWidth(self.isa.objj_msgSend0(self, "bounds")) - contentInset.right - frame.origin.x;
        return frame;
    }
    else if (aName.indexOf("divider-bezel") === 0)
    {
        var segment = parseInt(aName.substring("divider-bezel-".length), 10),
            width = self.isa.objj_msgSend1(self, "widthForSegment:", segment),
            left = self.isa.objj_msgSend1(self, "_leftOffsetForSegment:", segment),
            thickness = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "divider-thickness");
        return CGRectMake(left + width, bezelInset.top, thickness, height);
    }
    else if (aName.indexOf("segment-content") === 0)
    {
        var segment = parseInt(aName.substring("segment-content-".length), 10);
        return self.isa.objj_msgSend1(self, "contentFrameForSegment:", segment);
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "rectForEphemeralSubviewNamed:", aName);
    var ___r1;
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPSegmentedControl__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if ((aName == null ? null : aName.isa.objj_msgSend1(aName, "hasPrefix:", "segment-content")))
        return ((___r1 = _CPImageAndTextView.isa.objj_msgSend0(_CPImageAndTextView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    return ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    var ___r1;
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPSegmentedControl__layoutSubviews(self, _cmd)
{
    if (self._segments.length <= 0)
        return;
    var themeState = self._themeStates[0],
        isDisabled = self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateDisabled);
    themeState = isDisabled ? themeState.and(CPThemeStateDisabled) : themeState;
    var leftCapColor = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "left-segment-bezel-color", themeState),
        leftBezelView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "left-segment-bezel", CPWindowBelow, nil);
    (leftBezelView == null ? null : leftBezelView.isa.objj_msgSend1(leftBezelView, "setBackgroundColor:", leftCapColor));
    var themeState = self._themeStates[self._themeStates.length - 1];
    themeState = isDisabled ? themeState.and(CPThemeStateDisabled) : themeState;
    var rightCapColor = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "right-segment-bezel-color", themeState),
        rightBezelView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "right-segment-bezel", CPWindowBelow, nil);
    (rightBezelView == null ? null : rightBezelView.isa.objj_msgSend1(rightBezelView, "setBackgroundColor:", rightCapColor));
    for (var i = 0, count = self._themeStates.length; i < count; i++)
    {
        var themeState = self._themeStates[i];
        themeState = isDisabled ? themeState.and(CPThemeStateDisabled) : themeState;
        var bezelColor = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "center-segment-bezel-color", themeState),
            bezelView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "segment-bezel-" + i, CPWindowBelow, nil);
        (bezelView == null ? null : bezelView.isa.objj_msgSend1(bezelView, "setBackgroundColor:", bezelColor));
        var segment = self._segments[i],
            contentView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "segment-content-" + i, CPWindowAbove, "segment-bezel-" + i);
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setText:", (segment == null ? null : segment.isa.objj_msgSend0(segment, "label"))));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setImage:", (segment == null ? null : segment.isa.objj_msgSend0(segment, "image"))));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setFont:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "font", themeState)));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setTextColor:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "text-color", themeState)));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setAlignment:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "alignment", themeState)));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setVerticalAlignment:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "vertical-alignment", themeState)));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setLineBreakMode:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "line-break-mode", themeState)));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setTextShadowColor:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "text-shadow-color", themeState)));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setTextShadowOffset:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "text-shadow-offset", themeState)));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setImageScaling:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "image-scaling", themeState)));
        if ((segment == null ? null : segment.isa.objj_msgSend0(segment, "image")) && (segment == null ? null : segment.isa.objj_msgSend0(segment, "label")))
            (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setImagePosition:", self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "image-position", themeState)));
        else if ((segment == null ? null : segment.isa.objj_msgSend0(segment, "image")))
            (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setImagePosition:", CPImageOnly));
        if (i == count - 1)
            continue;
        var borderState = self._themeStates[i].and(self._themeStates[i + 1]);
        borderState = borderState.hasThemeState(CPThemeStateSelected) && !borderState.hasThemeState(CPThemeStateHighlighted) ? CPThemeStateSelected : CPThemeStateNormal;
        borderState = isDisabled ? borderState.and(CPThemeStateDisabled) : borderState;
        var borderColor = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "divider-bezel-color", borderState),
            borderView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "divider-bezel-" + i, CPWindowBelow, nil);
        (borderView == null ? null : borderView.isa.objj_msgSend1(borderView, "setBackgroundColor:", borderColor));
    }
}
,["void"]), new objj_method(sel_getUid("drawSegment:highlight:"), function $CPSegmentedControl__drawSegment_highlight_(self, _cmd, aSegment, shouldHighlight)
{
}
,["void","int","BOOL"]), new objj_method(sel_getUid("tileWithChangedSegment:"), function $CPSegmentedControl__tileWithChangedSegment_(self, _cmd, aSegment)
{
    if (aSegment >= self._segments.length)
        return;
    var segment = self._segments[aSegment],
        segmentWidth = (segment == null ? null : segment.isa.objj_msgSend0(segment, "width")),
        themeState = self._themeState.hasThemeState(CPThemeStateDisabled) ? self._themeStates[aSegment].and(CPThemeStateDisabled) : self._themeStates[aSegment],
        contentInset = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "content-inset", themeState),
        font = self.isa.objj_msgSend0(self, "font");
    if (!segmentWidth)
    {
        if ((segment == null ? null : segment.isa.objj_msgSend0(segment, "image")) && (segment == null ? null : segment.isa.objj_msgSend0(segment, "label")))
            segmentWidth = ((___r1 = (segment == null ? null : segment.isa.objj_msgSend0(segment, "label"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sizeWithFont:", font)).width + ((___r1 = (segment == null ? null : segment.isa.objj_msgSend0(segment, "image"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "size")).width + contentInset.left + contentInset.right;
        else if (segment.image)
            segmentWidth = ((___r1 = (segment == null ? null : segment.isa.objj_msgSend0(segment, "image"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "size")).width + contentInset.left + contentInset.right;
        else if (segment.label)
            segmentWidth = ((___r1 = (segment == null ? null : segment.isa.objj_msgSend0(segment, "label"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sizeWithFont:", font)).width + contentInset.left + contentInset.right;
        else
            segmentWidth = 0.0;
    }
    var delta = segmentWidth - CGRectGetWidth((segment == null ? null : segment.isa.objj_msgSend0(segment, "frame")));
    if (!delta)
    {
        self.isa.objj_msgSend0(self, "setNeedsLayout");
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
        return;
    }
    var frame = self.isa.objj_msgSend0(self, "frame");
    self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(frame) + delta, CGRectGetHeight(frame)));
    (segment == null ? null : segment.isa.objj_msgSend1(segment, "setWidth:", segmentWidth));
    (segment == null ? null : segment.isa.objj_msgSend1(segment, "setFrame:", self.isa.objj_msgSend1(self, "frameForSegment:", aSegment)));
    var index = aSegment + 1;
    for (; index < self._segments.length; ++index)
    {
        ((___r1 = self._segments[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).origin.x += delta;
        self.isa.objj_msgSend2(self, "drawSegmentBezel:highlight:", index, NO);
        self.isa.objj_msgSend2(self, "drawSegment:highlight:", index, NO);
    }
    self.isa.objj_msgSend2(self, "drawSegmentBezel:highlight:", aSegment, NO);
    self.isa.objj_msgSend2(self, "drawSegment:highlight:", aSegment, NO);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
}
,["void","unsigned"]), new objj_method(sel_getUid("frameForSegment:"), function $CPSegmentedControl__frameForSegment_(self, _cmd, aSegment)
{
    return self.isa.objj_msgSend1(self, "bezelFrameForSegment:", aSegment);
}
,["CGRect","unsigned"]), new objj_method(sel_getUid("bezelFrameForSegment:"), function $CPSegmentedControl__bezelFrameForSegment_(self, _cmd, aSegment)
{
    var height = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "default-height"),
        bezelInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-inset"),
        width = self.isa.objj_msgSend1(self, "widthForSegment:", aSegment),
        left = self.isa.objj_msgSend1(self, "_leftOffsetForSegment:", aSegment);
    return CGRectMake(left, bezelInset.top, width, height);
}
,["CGRect","unsigned"]), new objj_method(sel_getUid("contentFrameForSegment:"), function $CPSegmentedControl__contentFrameForSegment_(self, _cmd, aSegment)
{
    var height = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "default-height"),
        contentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset"),
        width = self.isa.objj_msgSend1(self, "widthForSegment:", aSegment),
        left = self.isa.objj_msgSend1(self, "_leftOffsetForSegment:", aSegment);
    return CGRectMake(left + contentInset.left, contentInset.top, width - contentInset.left - contentInset.right, height - contentInset.top - contentInset.bottom);
}
,["CGRect","unsigned"]), new objj_method(sel_getUid("testSegment:"), function $CPSegmentedControl__testSegment_(self, _cmd, aPoint)
{
    var location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", aPoint, nil),
        count = self._segments.length;
    while (count--)
        if (CGRectContainsPoint(((___r1 = self._segments[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")), aPoint))
            return count;
    if (self._segments.length)
    {
        var adjustedLastFrame = CGRectCreateCopy(((___r1 = self._segments[self._segments.length - 1]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
        adjustedLastFrame.size.width = CGRectGetWidth(self.isa.objj_msgSend0(self, "bounds")) - adjustedLastFrame.origin.x;
        if (CGRectContainsPoint(adjustedLastFrame, aPoint))
            return self._segments.length - 1;
    }
    return -1;
    var ___r1;
}
,["unsigned","CGPoint"]), new objj_method(sel_getUid("mouseDown:"), function $CPSegmentedControl__mouseDown_(self, _cmd, anEvent)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    self.isa.objj_msgSend1(self, "trackSegment:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPSegmentedControl__mouseUp_(self, _cmd, anEvent)
{
}
,["void","CPEvent"]), new objj_method(sel_getUid("trackSegment:"), function $CPSegmentedControl__trackSegment_(self, _cmd, anEvent)
{
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")),
        location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil);
    if (type == CPLeftMouseUp)
    {
        if (self._trackingSegment == -1)
            return;
        if (self._trackingSegment === self.isa.objj_msgSend1(self, "testSegment:", location))
        {
            if (self._trackingMode == CPSegmentSwitchTrackingSelectAny)
            {
                self.isa.objj_msgSend2(self, "setSelected:forSegment:", !self.isa.objj_msgSend1(self, "isSelectedForSegment:", self._trackingSegment), self._trackingSegment);
                self._selectedSegment = self._trackingSegment;
            }
            else
                self.isa.objj_msgSend2(self, "setSelected:forSegment:", YES, self._trackingSegment);
            self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
            if (self._trackingMode == CPSegmentSwitchTrackingMomentary)
            {
                self.isa.objj_msgSend2(self, "setSelected:forSegment:", NO, self._trackingSegment);
                self._selectedSegment = -1;
            }
        }
        self.isa.objj_msgSend2(self, "drawSegmentBezel:highlight:", self._trackingSegment, NO);
        self._trackingSegment = -1;
        return;
    }
    if (type == CPLeftMouseDown)
    {
        var trackingSegment = self.isa.objj_msgSend1(self, "testSegment:", location);
        if (trackingSegment > -1 && self.isa.objj_msgSend1(self, "isEnabledForSegment:", trackingSegment))
        {
            self._trackingHighlighted = YES;
            self._trackingSegment = trackingSegment;
            self.isa.objj_msgSend2(self, "drawSegmentBezel:highlight:", self._trackingSegment, YES);
        }
    }
    else if (type == CPLeftMouseDragged)
    {
        if (self._trackingSegment == -1)
            return;
        var highlighted = self.isa.objj_msgSend1(self, "testSegment:", location) === self._trackingSegment;
        if (highlighted != self._trackingHighlighted)
        {
            self._trackingHighlighted = highlighted;
            self.isa.objj_msgSend2(self, "drawSegmentBezel:highlight:", self._trackingSegment, self._trackingHighlighted);
        }
    }
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackSegment:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES));
}
,["void","CPEvent"]), new objj_method(sel_getUid("setFont:"), function $CPSegmentedControl__setFont_(self, _cmd, aFont)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "setFont:", aFont);
    self.isa.objj_msgSend1(self, "tileWithChangedSegment:", 0);
}
,["void","CPFont"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPSegmentedControl__defaultThemeClass(self, _cmd)
{
    return "segmented-control";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPSegmentedControl__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPCenterTextAlignment, "alignment", CPCenterVerticalTextAlignment, "vertical-alignment", CPImageLeft, "image-position", CPImageScaleNone, "image-scaling", CGInsetMakeZero(), "bezel-inset", CGInsetMakeZero(), "content-inset", CPNull.isa.objj_msgSend0(CPNull, "null"), "left-segment-bezel-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "right-segment-bezel-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "center-segment-bezel-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "divider-bezel-color", 1.0, "divider-thickness", 24.0, "default-height");
}
,["CPDictionary"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPSegmentedControl___binderClassForBinding_(self, _cmd, aBinding)
{
    if (self.isa.objj_msgSend1(self, "_isSelectionBinding:", aBinding))
        return (_CPSegmentedControlBinder == null ? null : _CPSegmentedControlBinder.isa.objj_msgSend0(_CPSegmentedControlBinder, "class"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPSegmentedControl").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("_isSelectionBinding:"), function $CPSegmentedControl___isSelectionBinding_(self, _cmd, aBinding)
{
    return aBinding === CPSelectedIndexBinding || aBinding === CPSelectedLabelBinding || aBinding === CPSelectedTagBinding;
}
,["BOOL","CPString"])]);
}var CPSegmentedControlSegmentsKey = "CPSegmentedControlSegmentsKey",
    CPSegmentedControlSelectedKey = "CPSegmentedControlSelectedKey",
    CPSegmentedControlSegmentStyleKey = "CPSegmentedControlSegmentStyleKey",
    CPSegmentedControlTrackingModeKey = "CPSegmentedControlTrackingModeKey";
{
var the_class = objj_getClass("CPSegmentedControl")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSegmentedControl\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPSegmentedControl__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        var frame = (self == null ? null : self.isa.objj_msgSend0(self, "frame")),
            originalWidth = frame.size.width;
        frame.size.width = 0;
        (self == null ? null : self.isa.objj_msgSend1(self, "setFrame:", frame));
        self._segments = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSegmentedControlSegmentsKey));
        self._segmentStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPSegmentedControlSegmentStyleKey));
        self._themeStates = [];
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPSegmentedControlSelectedKey)))
            self._selectedSegment = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPSegmentedControlSelectedKey));
        else
            self._selectedSegment = -1;
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPSegmentedControlTrackingModeKey)))
            self._trackingMode = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPSegmentedControlTrackingModeKey));
        else
            self._trackingMode = CPSegmentSwitchTrackingSelectOne;
        for (var i = 0; i < self._segments.length; i++)
            self._themeStates[i] = ((___r1 = self._segments[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selected")) ? CPThemeStateSelected : CPThemeStateNormal;
        for (var i = 0; i < self._segments.length; i++)
            (self == null ? null : self.isa.objj_msgSend1(self, "tileWithChangedSegment:", i));
        var difference = MAX(originalWidth - (self == null ? null : self.isa.objj_msgSend0(self, "frame")).size.width, 0.0),
            remainingWidth = FLOOR(difference / self._segments.length);
        for (var i = 0; i < self._segments.length; i++)
            (self == null ? null : self.isa.objj_msgSend2(self, "setWidth:forSegment:", ((___r1 = self._segments[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "width")) + remainingWidth, i));
        (self == null ? null : self.isa.objj_msgSend1(self, "tileWithChangedSegment:", 0));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSegmentedControl__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._segments, CPSegmentedControlSegmentsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._selectedSegment, CPSegmentedControlSelectedKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._segmentStyle, CPSegmentedControlSegmentStyleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._trackingMode, CPSegmentedControlTrackingModeKey));
}
,["void","CPCoder"])]);
}var CPSegmentedControlBindersMap = {},
    CPSegmentedControlNoSelectionPlaceholder = "CPSegmentedControlNoSelectionPlaceholder";
{var the_class = objj_allocateClassPair(CPBinder, "_CPSegmentedControlBinder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_selectionBinding")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("selectionBinding"), function $_CPSegmentedControlBinder__selectionBinding(self, _cmd)
{
    return self._selectionBinding;
}
,["CPString"]), new objj_method(sel_getUid("initWithBinding:name:to:keyPath:options:from:"), function $_CPSegmentedControlBinder__initWithBinding_name_to_keyPath_options_from_(self, _cmd, aBinding, aName, aDestination, aKeyPath, options, aSource)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPSegmentedControlBinder").super_class }, "initWithBinding:name:to:keyPath:options:from:", aBinding, aName, aDestination, aKeyPath, options, aSource);
    if (self)
    {
        CPSegmentedControlBindersMap[(aSource == null ? null : aSource.isa.objj_msgSend0(aSource, "UID"))] = self;
        self._selectionBinding = aName;
    }
    return self;
}
,["id","CPString","CPString","id","CPString","CPDictionary","id"]), new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $_CPSegmentedControlBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPSegmentedControlBinder").super_class }, "_updatePlaceholdersWithOptions:", options);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", CPSegmentedControlNoSelectionPlaceholder, CPMultipleValuesMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", CPSegmentedControlNoSelectionPlaceholder, CPNoSelectionMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", CPSegmentedControlNoSelectionPlaceholder, CPNotApplicableMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", CPSegmentedControlNoSelectionPlaceholder, CPNullMarker, YES);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPSegmentedControlBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    if (aValue == CPSegmentedControlNoSelectionPlaceholder)
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setSelected:forSegment:", NO, ((___r2 = self._source), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedSegment"))));
    else
        self.isa.objj_msgSend2(self, "setValue:forBinding:", aValue, aBinding);
    var ___r1, ___r2;
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $_CPSegmentedControlBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    if (aBinding == CPSelectedIndexBinding)
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSelectedSegment:", aValue));
    else if (aBinding == CPSelectedTagBinding)
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectSegmentWithTag:", aValue));
    else if (aBinding == CPSelectedLabelBinding)
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_selectSegmentWithLabel:", aValue));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPSegmentedControlBinder__valueForBinding_(self, _cmd, aBinding)
{
    var selectedIndex = ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedSegment"));
    if (aBinding == CPSelectedIndexBinding)
        return selectedIndex;
    else if (aBinding == CPSelectedTagBinding)
        return ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "tagForSegment:", selectedIndex));
    else if (aBinding == CPSelectedLabelBinding)
        return ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "labelForSegment:", selectedIndex));
    var ___r1;
}
,["id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("reverseSetValueForObject:"), function $_CPSegmentedControlBinder__reverseSetValueForObject_(self, _cmd, aSource)
{
    var binder = CPSegmentedControlBindersMap[(aSource == null ? null : aSource.isa.objj_msgSend0(aSource, "UID"))];
    (binder == null ? null : binder.isa.objj_msgSend1(binder, "reverseSetValueFor:", (binder == null ? null : binder.isa.objj_msgSend0(binder, "selectionBinding"))));
}
,["void","id"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPSegmentItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("image"), new objj_ivar("label"), new objj_ivar("menu"), new objj_ivar("selected"), new objj_ivar("enabled"), new objj_ivar("tag"), new objj_ivar("width"), new objj_ivar("frame")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("image"), function $_CPSegmentItem__image(self, _cmd)
{
    return self.image;
}
,["CPImage"]), new objj_method(sel_getUid("setImage:"), function $_CPSegmentItem__setImage_(self, _cmd, newValue)
{
    self.image = newValue;
}
,["void","CPImage"]), new objj_method(sel_getUid("label"), function $_CPSegmentItem__label(self, _cmd)
{
    return self.label;
}
,["CPString"]), new objj_method(sel_getUid("setLabel:"), function $_CPSegmentItem__setLabel_(self, _cmd, newValue)
{
    self.label = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("menu"), function $_CPSegmentItem__menu(self, _cmd)
{
    return self.menu;
}
,["CPMenu"]), new objj_method(sel_getUid("setMenu:"), function $_CPSegmentItem__setMenu_(self, _cmd, newValue)
{
    self.menu = newValue;
}
,["void","CPMenu"]), new objj_method(sel_getUid("selected"), function $_CPSegmentItem__selected(self, _cmd)
{
    return self.selected;
}
,["BOOL"]), new objj_method(sel_getUid("setSelected:"), function $_CPSegmentItem__setSelected_(self, _cmd, newValue)
{
    self.selected = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("enabled"), function $_CPSegmentItem__enabled(self, _cmd)
{
    return self.enabled;
}
,["BOOL"]), new objj_method(sel_getUid("setEnabled:"), function $_CPSegmentItem__setEnabled_(self, _cmd, newValue)
{
    self.enabled = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("tag"), function $_CPSegmentItem__tag(self, _cmd)
{
    return self.tag;
}
,["int"]), new objj_method(sel_getUid("setTag:"), function $_CPSegmentItem__setTag_(self, _cmd, newValue)
{
    self.tag = newValue;
}
,["void","int"]), new objj_method(sel_getUid("width"), function $_CPSegmentItem__width(self, _cmd)
{
    return self.width;
}
,["int"]), new objj_method(sel_getUid("setWidth:"), function $_CPSegmentItem__setWidth_(self, _cmd, newValue)
{
    self.width = newValue;
}
,["void","int"]), new objj_method(sel_getUid("frame"), function $_CPSegmentItem__frame(self, _cmd)
{
    return self.frame;
}
,["CGRect"]), new objj_method(sel_getUid("setFrame:"), function $_CPSegmentItem__setFrame_(self, _cmd, newValue)
{
    self.frame = newValue;
}
,["void","CGRect"]), new objj_method(sel_getUid("init"), function $_CPSegmentItem__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPSegmentItem").super_class }, "init"))
    {
        self.image = nil;
        self.label = "";
        self.menu = nil;
        self.selected = NO;
        self.enabled = YES;
        self.tag = -1;
        self.width = 0;
        self.frame = CGRectMakeZero();
    }
    return self;
}
,["id"])]);
}var CPSegmentItemImageKey = "CPSegmentItemImageKey",
    CPSegmentItemLabelKey = "CPSegmentItemLabelKey",
    CPSegmentItemMenuKey = "CPSegmentItemMenuKey",
    CPSegmentItemSelectedKey = "CPSegmentItemSelectedKey",
    CPSegmentItemEnabledKey = "CPSegmentItemEnabledKey",
    CPSegmentItemTagKey = "CPSegmentItemTagKey",
    CPSegmentItemWidthKey = "CPSegmentItemWidthKey";
{
var the_class = objj_getClass("_CPSegmentItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPSegmentItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPSegmentItem__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPSegmentItem").super_class }, "init");
    if (self)
    {
        self.image = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSegmentItemImageKey));
        self.label = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSegmentItemLabelKey));
        self.menu = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSegmentItemMenuKey));
        self.selected = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPSegmentItemSelectedKey));
        self.enabled = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPSegmentItemEnabledKey));
        self.tag = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPSegmentItemTagKey));
        self.width = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPSegmentItemWidthKey));
        self.frame = CGRectMakeZero();
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPSegmentItem__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.image, CPSegmentItemImageKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.label, CPSegmentItemLabelKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.menu, CPSegmentItemMenuKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self.selected, CPSegmentItemSelectedKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self.enabled, CPSegmentItemEnabledKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self.tag, CPSegmentItemTagKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self.width, CPSegmentItemWidthKey));
}
,["void","CPCoder"])]);
}