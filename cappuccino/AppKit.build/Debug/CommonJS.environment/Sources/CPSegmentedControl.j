@STATIC;1.0;I;20;Foundation/CPArray.ji;11;CPControl.ji;20;CPWindow_Constants.ji;21;_CPImageAndTextView.jt;41242;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("CPControl.j", YES);objj_executeFile("CPWindow_Constants.j", YES);objj_executeFile("_CPImageAndTextView.j", YES);CPSegmentSwitchTrackingSelectOne = 0;
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
    if (objj_msgSend(objj_msgSend(self, "class"), "_isSelectionBinding:", aBinding) && self._trackingMode !== CPSegmentSwitchTrackingSelectOne)
        CPLog.warn("Binding " + aBinding + " needs CPSegmentSwitchTrackingSelectOne tracking mode");
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "bind:toObject:withKeyPath:options:", aBinding, anObject, aKeyPath, options);
}
,["void","CPString","id","CPString","CPDictionary"]), new objj_method(sel_getUid("_reverseSetBinding"), function $CPSegmentedControl___reverseSetBinding(self, _cmd)
{
    objj_msgSend(_CPSegmentedControlBinder, "reverseSetValueForObject:", self);
}
,["void"]), new objj_method(sel_getUid("selectedTag"), function $CPSegmentedControl__selectedTag(self, _cmd)
{
    return objj_msgSend(self._segments[self._selectedSegment], "tag");
}
,["int"]), new objj_method(sel_getUid("setSegmentCount:"), function $CPSegmentedControl__setSegmentCount_(self, _cmd, aCount)
{
    if (self._segments.length == aCount)
        return;
    var height = CGRectGetHeight(objj_msgSend(self, "bounds")),
        dividersBefore = MAX(0, self._segments.length - 1),
        dividersAfter = MAX(0, aCount - 1);
    if (self._segments.length < aCount)
    {
        for (var index = self._segments.length; index < aCount; ++index)
        {
            self._segments[index] = objj_msgSend(objj_msgSend(_CPSegmentItem, "alloc"), "init");
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
    var thickness = objj_msgSend(self, "currentValueForThemeAttribute:", "divider-thickness"),
        frame = objj_msgSend(self, "frame"),
        widthOfAllSegments = 0,
        dividerExtraSpace = (objj_msgSend(self._segments, "count") - 1) * thickness;
    for (var i = 0; i < objj_msgSend(self._segments, "count"); i++)
        widthOfAllSegments += objj_msgSend(self._segments[i], "width");
    objj_msgSend(self, "setFrameSize:", CGSizeMake(widthOfAllSegments + dividerExtraSpace, frame.size.height));
    objj_msgSend(self, "tileWithChangedSegment:", 0);
}
,["void","unsigned"]), new objj_method(sel_getUid("segmentCount"), function $CPSegmentedControl__segmentCount(self, _cmd)
{
    return self._segments.length;
}
,["unsigned"]), new objj_method(sel_getUid("setSelectedSegment:"), function $CPSegmentedControl__setSelectedSegment_(self, _cmd, aSegment)
{
    objj_msgSend(self, "setSelected:forSegment:", YES, aSegment);
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
            objj_msgSend(self, "setSelectedSegment:", index);
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
            objj_msgSend(self, "setSelectedSegment:", index);
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
            if (objj_msgSend(self._segments[index], "selected"))
                if (selected)
                    objj_msgSend(self, "setSelected:forSegment:", NO, index);
                else
                    selected = YES;
    }
    else if (self._trackingMode == CPSegmentSwitchTrackingMomentary)
    {
        var index = 0;
        for (; index < self._segments.length; ++index)
            if (objj_msgSend(self._segments[index], "selected"))
                objj_msgSend(self, "setSelected:forSegment:", NO, index);
    }
}
,["void","CPSegmentSwitchTracking"]), new objj_method(sel_getUid("trackingMode"), function $CPSegmentedControl__trackingMode(self, _cmd)
{
    return self._trackingMode;
}
,["CPSegmentSwitchTracking"]), new objj_method(sel_getUid("setWidth:forSegment:"), function $CPSegmentedControl__setWidth_forSegment_(self, _cmd, aWidth, aSegment)
{
    objj_msgSend(self._segments[aSegment], "setWidth:", aWidth);
    objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
,["void","float","unsigned"]), new objj_method(sel_getUid("widthForSegment:"), function $CPSegmentedControl__widthForSegment_(self, _cmd, aSegment)
{
    return objj_msgSend(self._segments[aSegment], "width");
}
,["float","unsigned"]), new objj_method(sel_getUid("setImage:forSegment:"), function $CPSegmentedControl__setImage_forSegment_(self, _cmd, anImage, aSegment)
{
    objj_msgSend(self._segments[aSegment], "setImage:", anImage);
    objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
,["void","CPImage","unsigned"]), new objj_method(sel_getUid("imageForSegment:"), function $CPSegmentedControl__imageForSegment_(self, _cmd, aSegment)
{
    return objj_msgSend(self._segments[aSegment], "image");
}
,["CPImage","unsigned"]), new objj_method(sel_getUid("setLabel:forSegment:"), function $CPSegmentedControl__setLabel_forSegment_(self, _cmd, aLabel, aSegment)
{
    objj_msgSend(self._segments[aSegment], "setLabel:", aLabel);
    objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
,["void","CPString","unsigned"]), new objj_method(sel_getUid("labelForSegment:"), function $CPSegmentedControl__labelForSegment_(self, _cmd, aSegment)
{
    return objj_msgSend(self._segments[aSegment], "label");
}
,["CPString","unsigned"]), new objj_method(sel_getUid("setMenu:forSegment:"), function $CPSegmentedControl__setMenu_forSegment_(self, _cmd, aMenu, aSegment)
{
    objj_msgSend(self._segments[aSegment], "setMenu:", aMenu);
}
,["void","CPMenu","unsigned"]), new objj_method(sel_getUid("menuForSegment:"), function $CPSegmentedControl__menuForSegment_(self, _cmd, aSegment)
{
    return objj_msgSend(self._segments[aSegment], "menu");
}
,["CPMenu","unsigned"]), new objj_method(sel_getUid("setSelected:forSegment:"), function $CPSegmentedControl__setSelected_forSegment_(self, _cmd, isSelected, aSegment)
{
    var segment = self._segments[aSegment];
    if (objj_msgSend(segment, "selected") == isSelected)
        return;
    objj_msgSend(segment, "setSelected:", isSelected);
    self._themeStates[aSegment] = isSelected ? CPThemeStateSelected : CPThemeStateNormal;
    if (isSelected)
    {
        var oldSelectedSegment = self._selectedSegment;
        self._selectedSegment = aSegment;
        if (self._trackingMode == CPSegmentSwitchTrackingSelectOne && oldSelectedSegment != aSegment && oldSelectedSegment != -1)
        {
            objj_msgSend(self._segments[oldSelectedSegment], "setSelected:", NO);
            self._themeStates[oldSelectedSegment] = CPThemeStateNormal;
            objj_msgSend(self, "drawSegmentBezel:highlight:", oldSelectedSegment, NO);
        }
    }
    if (self._trackingMode != CPSegmentSwitchTrackingMomentary)
        objj_msgSend(self, "drawSegmentBezel:highlight:", aSegment, NO);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","BOOL","unsigned"]), new objj_method(sel_getUid("isSelectedForSegment:"), function $CPSegmentedControl__isSelectedForSegment_(self, _cmd, aSegment)
{
    return objj_msgSend(self._segments[aSegment], "selected");
}
,["BOOL","unsigned"]), new objj_method(sel_getUid("setEnabled:forSegment:"), function $CPSegmentedControl__setEnabled_forSegment_(self, _cmd, shouldBeEnabled, aSegment)
{
    if (objj_msgSend(self._segments[aSegment], "enabled") === shouldBeEnabled)
        return;
    objj_msgSend(self._segments[aSegment], "setEnabled:", shouldBeEnabled);
    if (shouldBeEnabled)
        self._themeStates[aSegment] = self._themeStates[aSegment].without(CPThemeStateDisabled);
    else
        self._themeStates[aSegment] = self._themeStates[aSegment].and(CPThemeStateDisabled);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","BOOL","unsigned"]), new objj_method(sel_getUid("isEnabledForSegment:"), function $CPSegmentedControl__isEnabledForSegment_(self, _cmd, aSegment)
{
    return objj_msgSend(self._segments[aSegment], "enabled");
}
,["BOOL","unsigned"]), new objj_method(sel_getUid("setTag:forSegment:"), function $CPSegmentedControl__setTag_forSegment_(self, _cmd, aTag, aSegment)
{
    objj_msgSend(self._segments[aSegment], "setTag:", aTag);
}
,["void","int","unsigned"]), new objj_method(sel_getUid("tagForSegment:"), function $CPSegmentedControl__tagForSegment_(self, _cmd, aSegment)
{
    return objj_msgSend(self._segments[aSegment], "tag");
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
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","int","BOOL"]), new objj_method(sel_getUid("_leftOffsetForSegment:"), function $CPSegmentedControl___leftOffsetForSegment_(self, _cmd, segment)
{
    var bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset");
    if (segment == 0)
        return bezelInset.left;
    var thickness = objj_msgSend(self, "currentValueForThemeAttribute:", "divider-thickness");
    return objj_msgSend(self, "_leftOffsetForSegment:", segment - 1) + objj_msgSend(self, "widthForSegment:", segment - 1) + thickness;
}
,["float","unsigned"]), new objj_method(sel_getUid("_indexOfLastSegment"), function $CPSegmentedControl___indexOfLastSegment(self, _cmd)
{
    var lastSegmentIndex = objj_msgSend(self._segments, "count") - 1;
    if (lastSegmentIndex < 0)
        lastSegmentIndex = 0;
    return lastSegmentIndex;
}
,["unsigned"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPSegmentedControl__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    var height = objj_msgSend(self, "currentValueForThemeAttribute:", "default-height"),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset"),
        bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset"),
        bounds = objj_msgSend(self, "bounds");
    if (aName === "left-segment-bezel")
    {
        return CGRectMake(bezelInset.left, bezelInset.top, contentInset.left, height);
    }
    else if (aName === "right-segment-bezel")
    {
        return CGRectMake(CGRectGetWidth(objj_msgSend(self, "bounds")) - contentInset.right, bezelInset.top, contentInset.right, height);
    }
    else if (aName.indexOf("segment-bezel") === 0)
    {
        var segment = parseInt(aName.substring("segment-bezel-".length), 10),
            frame = CGRectCreateCopy(objj_msgSend(self._segments[segment], "frame"));
        if (segment === 0)
        {
            frame.origin.x += contentInset.left;
            frame.size.width -= contentInset.left;
        }
        if (segment === self._segments.length - 1)
            frame.size.width = CGRectGetWidth(objj_msgSend(self, "bounds")) - contentInset.right - frame.origin.x;
        return frame;
    }
    else if (aName.indexOf("divider-bezel") === 0)
    {
        var segment = parseInt(aName.substring("divider-bezel-".length), 10),
            width = objj_msgSend(self, "widthForSegment:", segment),
            left = objj_msgSend(self, "_leftOffsetForSegment:", segment),
            thickness = objj_msgSend(self, "currentValueForThemeAttribute:", "divider-thickness");
        return CGRectMake(left + width, bezelInset.top, thickness, height);
    }
    else if (aName.indexOf("segment-content") === 0)
    {
        var segment = parseInt(aName.substring("segment-content-".length), 10);
        return objj_msgSend(self, "contentFrameForSegment:", segment);
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPSegmentedControl__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (objj_msgSend(aName, "hasPrefix:", "segment-content"))
        return objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", CGRectMakeZero());
    return objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPSegmentedControl__layoutSubviews(self, _cmd)
{
    if (self._segments.length <= 0)
        return;
    var themeState = self._themeStates[0],
        isDisabled = objj_msgSend(self, "hasThemeState:", CPThemeStateDisabled);
    themeState = isDisabled ? themeState.and(CPThemeStateDisabled) : themeState;
    var leftCapColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "left-segment-bezel-color", themeState),
        leftBezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "left-segment-bezel", CPWindowBelow, nil);
    objj_msgSend(leftBezelView, "setBackgroundColor:", leftCapColor);
    var themeState = self._themeStates[self._themeStates.length - 1];
    themeState = isDisabled ? themeState.and(CPThemeStateDisabled) : themeState;
    var rightCapColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "right-segment-bezel-color", themeState),
        rightBezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "right-segment-bezel", CPWindowBelow, nil);
    objj_msgSend(rightBezelView, "setBackgroundColor:", rightCapColor);
    for (var i = 0, count = self._themeStates.length; i < count; i++)
    {
        var themeState = self._themeStates[i];
        themeState = isDisabled ? themeState.and(CPThemeStateDisabled) : themeState;
        var bezelColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "center-segment-bezel-color", themeState),
            bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "segment-bezel-" + i, CPWindowBelow, nil);
        objj_msgSend(bezelView, "setBackgroundColor:", bezelColor);
        var segment = self._segments[i],
            contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "segment-content-" + i, CPWindowAbove, "segment-bezel-" + i);
        objj_msgSend(contentView, "setText:", objj_msgSend(segment, "label"));
        objj_msgSend(contentView, "setImage:", objj_msgSend(segment, "image"));
        objj_msgSend(contentView, "setFont:", objj_msgSend(self, "valueForThemeAttribute:inState:", "font", themeState));
        objj_msgSend(contentView, "setTextColor:", objj_msgSend(self, "valueForThemeAttribute:inState:", "text-color", themeState));
        objj_msgSend(contentView, "setAlignment:", objj_msgSend(self, "valueForThemeAttribute:inState:", "alignment", themeState));
        objj_msgSend(contentView, "setVerticalAlignment:", objj_msgSend(self, "valueForThemeAttribute:inState:", "vertical-alignment", themeState));
        objj_msgSend(contentView, "setLineBreakMode:", objj_msgSend(self, "valueForThemeAttribute:inState:", "line-break-mode", themeState));
        objj_msgSend(contentView, "setTextShadowColor:", objj_msgSend(self, "valueForThemeAttribute:inState:", "text-shadow-color", themeState));
        objj_msgSend(contentView, "setTextShadowOffset:", objj_msgSend(self, "valueForThemeAttribute:inState:", "text-shadow-offset", themeState));
        objj_msgSend(contentView, "setImageScaling:", objj_msgSend(self, "valueForThemeAttribute:inState:", "image-scaling", themeState));
        if (objj_msgSend(segment, "image") && objj_msgSend(segment, "label"))
            objj_msgSend(contentView, "setImagePosition:", objj_msgSend(self, "valueForThemeAttribute:inState:", "image-position", themeState));
        else if (objj_msgSend(segment, "image"))
            objj_msgSend(contentView, "setImagePosition:", CPImageOnly);
        if (i == count - 1)
            continue;
        var borderState = self._themeStates[i].and(self._themeStates[i + 1]);
        borderState = borderState.hasThemeState(CPThemeStateSelected) && !borderState.hasThemeState(CPThemeStateHighlighted) ? CPThemeStateSelected : CPThemeStateNormal;
        borderState = isDisabled ? borderState.and(CPThemeStateDisabled) : borderState;
        var borderColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "divider-bezel-color", borderState),
            borderView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "divider-bezel-" + i, CPWindowBelow, nil);
        objj_msgSend(borderView, "setBackgroundColor:", borderColor);
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
        segmentWidth = objj_msgSend(segment, "width"),
        themeState = self._themeState.hasThemeState(CPThemeStateDisabled) ? self._themeStates[aSegment].and(CPThemeStateDisabled) : self._themeStates[aSegment],
        contentInset = objj_msgSend(self, "valueForThemeAttribute:inState:", "content-inset", themeState),
        font = objj_msgSend(self, "font");
    if (!segmentWidth)
    {
        if (objj_msgSend(segment, "image") && objj_msgSend(segment, "label"))
            segmentWidth = objj_msgSend(objj_msgSend(segment, "label"), "sizeWithFont:", font).width + objj_msgSend(objj_msgSend(segment, "image"), "size").width + contentInset.left + contentInset.right;
        else if (segment.image)
            segmentWidth = objj_msgSend(objj_msgSend(segment, "image"), "size").width + contentInset.left + contentInset.right;
        else if (segment.label)
            segmentWidth = objj_msgSend(objj_msgSend(segment, "label"), "sizeWithFont:", font).width + contentInset.left + contentInset.right;
        else
            segmentWidth = 0.0;
    }
    var delta = segmentWidth - CGRectGetWidth(objj_msgSend(segment, "frame"));
    if (!delta)
    {
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
        return;
    }
    var frame = objj_msgSend(self, "frame");
    objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(frame) + delta, CGRectGetHeight(frame)));
    objj_msgSend(segment, "setWidth:", segmentWidth);
    objj_msgSend(segment, "setFrame:", objj_msgSend(self, "frameForSegment:", aSegment));
    var index = aSegment + 1;
    for (; index < self._segments.length; ++index)
    {
        objj_msgSend(self._segments[index], "frame").origin.x += delta;
        objj_msgSend(self, "drawSegmentBezel:highlight:", index, NO);
        objj_msgSend(self, "drawSegment:highlight:", index, NO);
    }
    objj_msgSend(self, "drawSegmentBezel:highlight:", aSegment, NO);
    objj_msgSend(self, "drawSegment:highlight:", aSegment, NO);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","unsigned"]), new objj_method(sel_getUid("frameForSegment:"), function $CPSegmentedControl__frameForSegment_(self, _cmd, aSegment)
{
    return objj_msgSend(self, "bezelFrameForSegment:", aSegment);
}
,["CGRect","unsigned"]), new objj_method(sel_getUid("bezelFrameForSegment:"), function $CPSegmentedControl__bezelFrameForSegment_(self, _cmd, aSegment)
{
    var height = objj_msgSend(self, "currentValueForThemeAttribute:", "default-height"),
        bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset"),
        width = objj_msgSend(self, "widthForSegment:", aSegment),
        left = objj_msgSend(self, "_leftOffsetForSegment:", aSegment);
    return CGRectMake(left, bezelInset.top, width, height);
}
,["CGRect","unsigned"]), new objj_method(sel_getUid("contentFrameForSegment:"), function $CPSegmentedControl__contentFrameForSegment_(self, _cmd, aSegment)
{
    var height = objj_msgSend(self, "currentValueForThemeAttribute:", "default-height"),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset"),
        width = objj_msgSend(self, "widthForSegment:", aSegment),
        left = objj_msgSend(self, "_leftOffsetForSegment:", aSegment);
    return CGRectMake(left + contentInset.left, contentInset.top, width - contentInset.left - contentInset.right, height - contentInset.top - contentInset.bottom);
}
,["CGRect","unsigned"]), new objj_method(sel_getUid("testSegment:"), function $CPSegmentedControl__testSegment_(self, _cmd, aPoint)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", aPoint, nil),
        count = self._segments.length;
    while (count--)
        if (CGRectContainsPoint(objj_msgSend(self._segments[count], "frame"), aPoint))
            return count;
    if (self._segments.length)
    {
        var adjustedLastFrame = CGRectCreateCopy(objj_msgSend(self._segments[self._segments.length - 1], "frame"));
        adjustedLastFrame.size.width = CGRectGetWidth(objj_msgSend(self, "bounds")) - adjustedLastFrame.origin.x;
        if (CGRectContainsPoint(adjustedLastFrame, aPoint))
            return self._segments.length - 1;
    }
    return -1;
}
,["unsigned","CGPoint"]), new objj_method(sel_getUid("mouseDown:"), function $CPSegmentedControl__mouseDown_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "trackSegment:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPSegmentedControl__mouseUp_(self, _cmd, anEvent)
{
}
,["void","CPEvent"]), new objj_method(sel_getUid("trackSegment:"), function $CPSegmentedControl__trackSegment_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type"),
        location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if (type == CPLeftMouseUp)
    {
        if (self._trackingSegment == -1)
            return;
        if (self._trackingSegment === objj_msgSend(self, "testSegment:", location))
        {
            if (self._trackingMode == CPSegmentSwitchTrackingSelectAny)
            {
                objj_msgSend(self, "setSelected:forSegment:", !objj_msgSend(self, "isSelectedForSegment:", self._trackingSegment), self._trackingSegment);
                self._selectedSegment = self._trackingSegment;
            }
            else
                objj_msgSend(self, "setSelected:forSegment:", YES, self._trackingSegment);
            objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
            if (self._trackingMode == CPSegmentSwitchTrackingMomentary)
            {
                objj_msgSend(self, "setSelected:forSegment:", NO, self._trackingSegment);
                self._selectedSegment = -1;
            }
        }
        objj_msgSend(self, "drawSegmentBezel:highlight:", self._trackingSegment, NO);
        self._trackingSegment = -1;
        return;
    }
    if (type == CPLeftMouseDown)
    {
        var trackingSegment = objj_msgSend(self, "testSegment:", location);
        if (trackingSegment > -1 && objj_msgSend(self, "isEnabledForSegment:", trackingSegment))
        {
            self._trackingHighlighted = YES;
            self._trackingSegment = trackingSegment;
            objj_msgSend(self, "drawSegmentBezel:highlight:", self._trackingSegment, YES);
        }
    }
    else if (type == CPLeftMouseDragged)
    {
        if (self._trackingSegment == -1)
            return;
        var highlighted = objj_msgSend(self, "testSegment:", location) === self._trackingSegment;
        if (highlighted != self._trackingHighlighted)
        {
            self._trackingHighlighted = highlighted;
            objj_msgSend(self, "drawSegmentBezel:highlight:", self._trackingSegment, self._trackingHighlighted);
        }
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackSegment:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("setFont:"), function $CPSegmentedControl__setFont_(self, _cmd, aFont)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "setFont:", aFont);
    objj_msgSend(self, "tileWithChangedSegment:", 0);
}
,["void","CPFont"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPSegmentedControl__defaultThemeClass(self, _cmd)
{
    return "segmented-control";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPSegmentedControl__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPCenterTextAlignment, "alignment", CPCenterVerticalTextAlignment, "vertical-alignment", CPImageLeft, "image-position", CPImageScaleNone, "image-scaling", CGInsetMakeZero(), "bezel-inset", CGInsetMakeZero(), "content-inset", objj_msgSend(CPNull, "null"), "left-segment-bezel-color", objj_msgSend(CPNull, "null"), "right-segment-bezel-color", objj_msgSend(CPNull, "null"), "center-segment-bezel-color", objj_msgSend(CPNull, "null"), "divider-bezel-color", 1.0, "divider-thickness", 24.0, "default-height");
}
,["CPDictionary"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPSegmentedControl___binderClassForBinding_(self, _cmd, aBinding)
{
    if (objj_msgSend(self, "_isSelectionBinding:", aBinding))
        return objj_msgSend(_CPSegmentedControlBinder, "class");
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
        var frame = objj_msgSend(self, "frame"),
            originalWidth = frame.size.width;
        frame.size.width = 0;
        objj_msgSend(self, "setFrame:", frame);
        self._segments = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentedControlSegmentsKey);
        self._segmentStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlSegmentStyleKey);
        self._themeStates = [];
        if (objj_msgSend(aCoder, "containsValueForKey:", CPSegmentedControlSelectedKey))
            self._selectedSegment = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlSelectedKey);
        else
            self._selectedSegment = -1;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPSegmentedControlTrackingModeKey))
            self._trackingMode = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlTrackingModeKey);
        else
            self._trackingMode = CPSegmentSwitchTrackingSelectOne;
        for (var i = 0; i < self._segments.length; i++)
            self._themeStates[i] = objj_msgSend(self._segments[i], "selected") ? CPThemeStateSelected : CPThemeStateNormal;
        for (var i = 0; i < self._segments.length; i++)
            objj_msgSend(self, "tileWithChangedSegment:", i);
        var difference = MAX(originalWidth - objj_msgSend(self, "frame").size.width, 0.0),
            remainingWidth = FLOOR(difference / self._segments.length);
        for (var i = 0; i < self._segments.length; i++)
            objj_msgSend(self, "setWidth:forSegment:", objj_msgSend(self._segments[i], "width") + remainingWidth, i);
        objj_msgSend(self, "tileWithChangedSegment:", 0);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSegmentedControl__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSegmentedControl").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._segments, CPSegmentedControlSegmentsKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._selectedSegment, CPSegmentedControlSelectedKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._segmentStyle, CPSegmentedControlSegmentStyleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._trackingMode, CPSegmentedControlTrackingModeKey);
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
        CPSegmentedControlBindersMap[objj_msgSend(aSource, "UID")] = self;
        self._selectionBinding = aName;
    }
    return self;
}
,["id","CPString","CPString","id","CPString","CPDictionary","id"]), new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $_CPSegmentedControlBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPSegmentedControlBinder").super_class }, "_updatePlaceholdersWithOptions:", options);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", CPSegmentedControlNoSelectionPlaceholder, CPMultipleValuesMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", CPSegmentedControlNoSelectionPlaceholder, CPNoSelectionMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", CPSegmentedControlNoSelectionPlaceholder, CPNotApplicableMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", CPSegmentedControlNoSelectionPlaceholder, CPNullMarker, YES);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPSegmentedControlBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    if (aValue == CPSegmentedControlNoSelectionPlaceholder)
        objj_msgSend(self._source, "setSelected:forSegment:", NO, objj_msgSend(self._source, "selectedSegment"));
    else
        objj_msgSend(self, "setValue:forBinding:", aValue, aBinding);
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $_CPSegmentedControlBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    if (aBinding == CPSelectedIndexBinding)
        objj_msgSend(self._source, "setSelectedSegment:", aValue);
    else if (aBinding == CPSelectedTagBinding)
        objj_msgSend(self._source, "selectSegmentWithTag:", aValue);
    else if (aBinding == CPSelectedLabelBinding)
        objj_msgSend(self._source, "_selectSegmentWithLabel:", aValue);
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPSegmentedControlBinder__valueForBinding_(self, _cmd, aBinding)
{
    var selectedIndex = objj_msgSend(self._source, "selectedSegment");
    if (aBinding == CPSelectedIndexBinding)
        return selectedIndex;
    else if (aBinding == CPSelectedTagBinding)
        return objj_msgSend(self._source, "tagForSegment:", selectedIndex);
    else if (aBinding == CPSelectedLabelBinding)
        return objj_msgSend(self._source, "labelForSegment:", selectedIndex);
}
,["id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("reverseSetValueForObject:"), function $_CPSegmentedControlBinder__reverseSetValueForObject_(self, _cmd, aSource)
{
    var binder = CPSegmentedControlBindersMap[objj_msgSend(aSource, "UID")];
    objj_msgSend(binder, "reverseSetValueFor:", objj_msgSend(binder, "selectionBinding"));
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
        self.image = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemImageKey);
        self.label = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemLabelKey);
        self.menu = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemMenuKey);
        self.selected = objj_msgSend(aCoder, "decodeBoolForKey:", CPSegmentItemSelectedKey);
        self.enabled = objj_msgSend(aCoder, "decodeBoolForKey:", CPSegmentItemEnabledKey);
        self.tag = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentItemTagKey);
        self.width = objj_msgSend(aCoder, "decodeFloatForKey:", CPSegmentItemWidthKey);
        self.frame = CGRectMakeZero();
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPSegmentItem__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self.image, CPSegmentItemImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self.label, CPSegmentItemLabelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self.menu, CPSegmentItemMenuKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self.selected, CPSegmentItemSelectedKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self.enabled, CPSegmentItemEnabledKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self.tag, CPSegmentItemTagKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", self.width, CPSegmentItemWidthKey);
}
,["void","CPCoder"])]);
}