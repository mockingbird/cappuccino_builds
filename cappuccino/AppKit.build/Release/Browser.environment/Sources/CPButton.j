@STATIC;1.0;i;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.ji;17;CPStringDrawing.ji;8;CPText.ji;20;CPWindow_Constants.jt;39208;objj_executeFile("_CPImageAndTextView.j", YES);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPControl.j", YES);objj_executeFile("CPStringDrawing.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPWindow_Constants.j", YES);CPRoundedBezelStyle = 1;
CPRegularSquareBezelStyle = 2;
CPThickSquareBezelStyle = 3;
CPThickerSquareBezelStyle = 4;
CPDisclosureBezelStyle = 5;
CPShadowlessSquareBezelStyle = 6;
CPCircularBezelStyle = 7;
CPTexturedSquareBezelStyle = 8;
CPHelpButtonBezelStyle = 9;
CPSmallSquareBezelStyle = 10;
CPTexturedRoundedBezelStyle = 11;
CPRoundRectBezelStyle = 12;
CPRecessedBezelStyle = 13;
CPRoundedDisclosureBezelStyle = 14;
CPHUDBezelStyle = -1;
CPMomentaryLightButton = 0;
CPPushOnPushOffButton = 1;
CPToggleButton = 2;
CPSwitchButton = 3;
CPRadioButton = 4;
CPMomentaryChangeButton = 5;
CPOnOffButton = 6;
CPMomentaryPushInButton = 7;
CPMomentaryPushButton = 0;
CPMomentaryLight = 7;
CPNoButtonMask = 0;
CPContentsButtonMask = 1;
CPPushInButtonMask = 2;
CPGrayButtonMask = 4;
CPBackgroundButtonMask = 8;
CPNoCellMask = CPNoButtonMask;
CPContentsCellMask = CPContentsButtonMask;
CPPushInCellMask = CPPushInButtonMask;
CPChangeGrayCellMask = CPGrayButtonMask;
CPChangeBackgroundCellMask = CPBackgroundButtonMask;
CPButtonStateMixed = CPThemeState("mixed");
CPButtonStateBezelStyleRounded = CPThemeState("rounded");
CPButtonStateBezelStyleRoundRect = CPThemeState("roundRect");
var CPButtonBezelStyleStateMap = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPButtonStateBezelStyleRounded, CPRoundedBezelStyle, CPButtonStateBezelStyleRoundRect, CPRoundRectBezelStyle);
CPButtonDefaultHeight = 25.0;
CPButtonImageOffset = 3.0;
{var the_class = objj_allocateClassPair(CPControl, "CPButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_allowsMixedState"), new objj_ivar("_title"), new objj_ivar("_alternateTitle"), new objj_ivar("_showsStateBy"), new objj_ivar("_highlightsBy"), new objj_ivar("_imageDimsWhenDisabled"), new objj_ivar("_bezelStyle"), new objj_ivar("_controlSize"), new objj_ivar("_keyEquivalent"), new objj_ivar("_keyEquivalentModifierMask"), new objj_ivar("_continuousDelayTimer"), new objj_ivar("_continuousTimer"), new objj_ivar("_periodicDelay"), new objj_ivar("_periodicInterval"), new objj_ivar("_isTracking")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPButton__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", CPCenterTextAlignment, "alignment"));
        (self == null ? null : self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", CPCenterVerticalTextAlignment, "vertical-alignment"));
        (self == null ? null : self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", CPImageLeft, "image-position"));
        (self == null ? null : self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", CPImageScaleNone, "image-scaling"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBezelStyle:", CPRoundRectBezelStyle));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBordered:", YES));
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPButton___init(self, _cmd)
{
    self._controlSize = CPRegularControlSize;
    self._keyEquivalent = "";
    self._keyEquivalentModifierMask = 0;
    self._periodicInterval = 0.05;
    self._periodicDelay = 0.5;
    self.isa.objj_msgSend1(self, "setButtonType:", CPMomentaryPushInButton);
}
,["void"]), new objj_method(sel_getUid("allowsMixedState"), function $CPButton__allowsMixedState(self, _cmd)
{
    return self._allowsMixedState;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsMixedState:"), function $CPButton__setAllowsMixedState_(self, _cmd, aFlag)
{
    aFlag = !!aFlag;
    if (self._allowsMixedState === aFlag)
        return;
    self._allowsMixedState = aFlag;
    if (!self._allowsMixedState && self.isa.objj_msgSend0(self, "state") === CPMixedState)
        self.isa.objj_msgSend1(self, "setState:", CPOnState);
}
,["void","BOOL"]), new objj_method(sel_getUid("setObjectValue:"), function $CPButton__setObjectValue_(self, _cmd, anObjectValue)
{
    if (!anObjectValue || anObjectValue === "" || (anObjectValue == null ? null : anObjectValue.isa.objj_msgSend0(anObjectValue, "intValue")) === 0)
        anObjectValue = CPOffState;
    else if (!(anObjectValue == null ? null : anObjectValue.isa.objj_msgSend1(anObjectValue, "isKindOfClass:", CPNumber.isa.objj_msgSend0(CPNumber, "class"))))
        anObjectValue = CPOnState;
    else if (anObjectValue >= CPOnState)
        anObjectValue = CPOnState;
    else if (anObjectValue < CPOffState)
        if (self.isa.objj_msgSend0(self, "allowsMixedState"))
            anObjectValue = CPMixedState;
        else
            anObjectValue = CPOnState;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "setObjectValue:", anObjectValue);
    switch(self.isa.objj_msgSend0(self, "objectValue")) {
    case CPMixedState:
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateSelected);
        self.isa.objj_msgSend1(self, "setThemeState:", CPButtonStateMixed);
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateHighlighted);
        else
            self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateHighlighted);
        break;
    case CPOnState:
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPButtonStateMixed);
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateSelected);
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateHighlighted);
        else
            self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateHighlighted);
        break;
    case CPOffState:
        self.isa.objj_msgSend1(self, "unsetThemeState:", [CPThemeStateSelected, CPButtonStateMixed, CPThemeStateHighlighted]);
    }
}
,["void","id"]), new objj_method(sel_getUid("nextState"), function $CPButton__nextState(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "allowsMixedState"))
    {
        var value = self.isa.objj_msgSend0(self, "state");
        return value - (value === -1 ? -2 : 1);
    }
    return 1 - self.isa.objj_msgSend0(self, "state");
}
,["CPInteger"]), new objj_method(sel_getUid("setNextState"), function $CPButton__setNextState(self, _cmd)
{
    if (self.isa.objj_msgSend1(self, "infoForBinding:", CPValueBinding))
        self.isa.objj_msgSend1(self, "setAllowsMixedState:", NO);
    self.isa.objj_msgSend1(self, "setState:", self.isa.objj_msgSend0(self, "nextState"));
}
,["void"]), new objj_method(sel_getUid("setState:"), function $CPButton__setState_(self, _cmd, aState)
{
    self.isa.objj_msgSend1(self, "setIntValue:", aState);
}
,["void","CPInteger"]), new objj_method(sel_getUid("state"), function $CPButton__state(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "intValue");
}
,["CPInteger"]), new objj_method(sel_getUid("setTitle:"), function $CPButton__setTitle_(self, _cmd, aTitle)
{
    if (self._title === aTitle)
        return;
    self._title = aTitle;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPString"]), new objj_method(sel_getUid("title"), function $CPButton__title(self, _cmd)
{
    return self._title;
}
,["CPString"]), new objj_method(sel_getUid("setAlternateTitle:"), function $CPButton__setAlternateTitle_(self, _cmd, aTitle)
{
    if (self._alternateTitle === aTitle)
        return;
    self._alternateTitle = aTitle;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPString"]), new objj_method(sel_getUid("alternateTitle"), function $CPButton__alternateTitle(self, _cmd)
{
    return self._alternateTitle;
}
,["CPString"]), new objj_method(sel_getUid("setImage:"), function $CPButton__setImage_(self, _cmd, anImage)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", anImage, "image");
}
,["void","CPImage"]), new objj_method(sel_getUid("image"), function $CPButton__image(self, _cmd)
{
    return self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "image", CPThemeStateNormal);
}
,["CPImage"]), new objj_method(sel_getUid("setAlternateImage:"), function $CPButton__setAlternateImage_(self, _cmd, anImage)
{
    self.isa.objj_msgSend3(self, "setValue:forThemeAttribute:inState:", anImage, "image", CPThemeStateHighlighted);
}
,["void","CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPButton__alternateImage(self, _cmd)
{
    return self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "image", CPThemeStateHighlighted);
}
,["CPImage"]), new objj_method(sel_getUid("setImageOffset:"), function $CPButton__setImageOffset_(self, _cmd, theImageOffset)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", theImageOffset, "image-offset");
}
,["void","float"]), new objj_method(sel_getUid("imageOffset"), function $CPButton__imageOffset(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "image-offset");
}
,["float"]), new objj_method(sel_getUid("setShowsStateBy:"), function $CPButton__setShowsStateBy_(self, _cmd, aMask)
{
    aMask &= ~CPPushInCellMask;
    if (self._showsStateBy === aMask)
        return;
    self._showsStateBy = aMask;
    if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask) && self.isa.objj_msgSend0(self, "state") != CPOffState)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateHighlighted);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateHighlighted);
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPInteger"]), new objj_method(sel_getUid("showsStateBy"), function $CPButton__showsStateBy(self, _cmd)
{
    return self._showsStateBy;
}
,["CPInteger"]), new objj_method(sel_getUid("setHighlightsBy:"), function $CPButton__setHighlightsBy_(self, _cmd, aMask)
{
    if (self._highlightsBy === aMask)
        return;
    self._highlightsBy = aMask;
    if (self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateHighlighted))
    {
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
        self.isa.objj_msgSend0(self, "setNeedsLayout");
    }
}
,["void","CPInteger"]), new objj_method(sel_getUid("highlightsBy"), function $CPButton__highlightsBy(self, _cmd)
{
    return self._highlightsBy;
}
,["CPInteger"]), new objj_method(sel_getUid("setButtonType:"), function $CPButton__setButtonType_(self, _cmd, aButtonType)
{
    switch(aButtonType) {
    case CPMomentaryLightButton:
        self.isa.objj_msgSend1(self, "setHighlightsBy:", CPChangeGrayCellMask | CPChangeBackgroundCellMask);
        self.isa.objj_msgSend1(self, "setShowsStateBy:", CPNoCellMask);
        break;
    case CPMomentaryPushInButton:
        self.isa.objj_msgSend1(self, "setHighlightsBy:", CPPushInCellMask | CPChangeGrayCellMask | CPChangeBackgroundCellMask);
        self.isa.objj_msgSend1(self, "setShowsStateBy:", CPNoCellMask);
        break;
    case CPMomentaryChangeButton:
        self.isa.objj_msgSend1(self, "setHighlightsBy:", CPContentsCellMask);
        self.isa.objj_msgSend1(self, "setShowsStateBy:", CPNoCellMask);
        break;
    case CPPushOnPushOffButton:
        self.isa.objj_msgSend1(self, "setHighlightsBy:", CPPushInCellMask | CPChangeGrayCellMask | CPChangeBackgroundCellMask);
        self.isa.objj_msgSend1(self, "setShowsStateBy:", CPChangeBackgroundCellMask | CPChangeGrayCellMask);
        break;
    case CPOnOffButton:
        self.isa.objj_msgSend1(self, "setHighlightsBy:", CPChangeGrayCellMask | CPChangeBackgroundCellMask);
        self.isa.objj_msgSend1(self, "setShowsStateBy:", CPChangeGrayCellMask | CPChangeBackgroundCellMask);
        break;
    case CPToggleButton:
        self.isa.objj_msgSend1(self, "setHighlightsBy:", CPPushInCellMask | CPContentsCellMask);
        self.isa.objj_msgSend1(self, "setShowsStateBy:", CPContentsCellMask);
        break;
    case CPSwitchButton:
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "The CPSwitchButton type is not supported in Cappuccino, use the CPCheckBox class instead.");
    case CPRadioButton:
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "The CPRadioButton type is not supported in Cappuccino, use the CPRadio class instead.");
default:
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Unknown button type.");
    }
    self.isa.objj_msgSend1(self, "setImageDimsWhenDisabled:", YES);
}
,["void","CPButtonType"]), new objj_method(sel_getUid("setImageDimsWhenDisabled:"), function $CPButton__setImageDimsWhenDisabled_(self, _cmd, imageShouldDimWhenDisabled)
{
    imageShouldDimWhenDisabled = !!imageShouldDimWhenDisabled;
    if (self._imageDimsWhenDisabled === imageShouldDimWhenDisabled)
        return;
    self._imageDimsWhenDisabled = imageShouldDimWhenDisabled;
    if (self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateDisabled))
    {
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
        self.isa.objj_msgSend0(self, "setNeedsLayout");
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("imageDimsWhenDisabled"), function $CPButton__imageDimsWhenDisabled(self, _cmd)
{
    return self._imageDimsWhenDisabled;
}
,["BOOL"]), new objj_method(sel_getUid("setPeriodicDelay:interval:"), function $CPButton__setPeriodicDelay_interval_(self, _cmd, aDelay, anInterval)
{
    self._periodicDelay = aDelay;
    self._periodicInterval = anInterval;
}
,["void","float","float"]), new objj_method(sel_getUid("mouseDown:"), function $CPButton__mouseDown_(self, _cmd, anEvent)
{
    if (self.isa.objj_msgSend0(self, "isContinuous"))
    {
        self._continuousDelayTimer = CPTimer.isa.objj_msgSend3(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", self._periodicDelay, function()
        {
            if (!self._continuousTimer)
                self._continuousTimer = CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self._periodicInterval, self, sel_getUid("onContinousEvent:"), anEvent, YES);
        }, NO);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "mouseDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("onContinousEvent:"), function $CPButton__onContinousEvent_(self, _cmd, aTimer)
{
    if (self._target && self._action && ((___r1 = self._target), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self._action)))
        ((___r1 = self._target), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", self._action, self));
    var ___r1;
}
,["void","CPTimer"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPButton__startTrackingAt_(self, _cmd, aPoint)
{
    self._isTracking = YES;
    var startedTracking = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "startTrackingAt:", aPoint);
    if (self._highlightsBy & (CPPushInCellMask | CPChangeGrayCellMask))
    {
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            self.isa.objj_msgSend1(self, "highlight:", self.isa.objj_msgSend0(self, "state") == CPOffState);
        else
            self.isa.objj_msgSend1(self, "highlight:", YES);
    }
    else
    {
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            self.isa.objj_msgSend1(self, "highlight:", self.isa.objj_msgSend0(self, "state") != CPOffState);
        else
            self.isa.objj_msgSend1(self, "highlight:", NO);
    }
    return startedTracking;
}
,["BOOL","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPButton__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{
    self._isTracking = NO;
    if (mouseIsUp && CGRectContainsPoint(self.isa.objj_msgSend0(self, "bounds"), aPoint))
        self.isa.objj_msgSend0(self, "setNextState");
    else
    {
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            self.isa.objj_msgSend1(self, "highlight:", self.isa.objj_msgSend0(self, "state") != CPOffState);
        else
            self.isa.objj_msgSend1(self, "highlight:", NO);
    }
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "invalidateTimers");
}
,["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("invalidateTimers"), function $CPButton__invalidateTimers(self, _cmd)
{
    if (self._continuousTimer)
    {
        ((___r1 = self._continuousTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
        self._continuousTimer = nil;
    }
    if (self._continuousDelayTimer)
    {
        ((___r1 = self._continuousDelayTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
        self._continuousDelayTimer = nil;
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPButton__contentRectForBounds_(self, _cmd, bounds)
{
    var contentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset");
    return CGRectInsetByInset(bounds, contentInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("bezelRectForBounds:"), function $CPButton__bezelRectForBounds_(self, _cmd, bounds)
{
    if (!self.isa.objj_msgSend0(self, "isBordered"))
        return bounds;
    var bezelInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-inset");
    return CGRectInsetByInset(bounds, bezelInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("_minimumFrameSize"), function $CPButton___minimumFrameSize(self, _cmd)
{
    var size = CGSizeMakeZero(),
        contentView = self.isa.objj_msgSend1(self, "ephemeralSubviewNamed:", "content-view");
    if (contentView)
    {
        (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "sizeToFit"));
        size = (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "frameSize"));
    }
    else
        size = ((___r1 = self.isa.objj_msgSend0(self, "title") || " "), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sizeWithFont:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "font")));
    var contentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset"),
        minSize = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "min-size"),
        maxSize = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "max-size");
    size.width = MAX(size.width + contentInset.left + contentInset.right, minSize.width);
    size.height = MAX(size.height + contentInset.top + contentInset.bottom, minSize.height);
    if (maxSize.width >= 0.0)
        size.width = MIN(size.width, maxSize.width);
    if (maxSize.height >= 0.0)
        size.height = MIN(size.height, maxSize.height);
    return size;
    var ___r1;
}
,["CGSize"]), new objj_method(sel_getUid("sizeToFit"), function $CPButton__sizeToFit(self, _cmd)
{
    self.isa.objj_msgSend0(self, "layoutSubviews");
    self.isa.objj_msgSend1(self, "setFrameSize:", self.isa.objj_msgSend0(self, "_minimumFrameSize"));
    if (self.isa.objj_msgSend1(self, "ephemeralSubviewNamed:", "content-view"))
        self.isa.objj_msgSend0(self, "layoutSubviews");
}
,["void"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPButton__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "bezel-view")
        return self.isa.objj_msgSend1(self, "bezelRectForBounds:", self.isa.objj_msgSend0(self, "bounds"));
    else if (aName === "content-view")
        return self.isa.objj_msgSend1(self, "contentRectForBounds:", self.isa.objj_msgSend0(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPButton__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "bezel-view")
    {
        var view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        (view == null ? null : view.isa.objj_msgSend1(view, "setHitTests:", NO));
        return view;
    }
    else
        return ((___r1 = _CPImageAndTextView.isa.objj_msgSend0(_CPImageAndTextView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    var ___r1;
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPButton__layoutSubviews(self, _cmd)
{
    var bezelView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    (bezelView == null ? null : bezelView.isa.objj_msgSend1(bezelView, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-color")));
    var contentView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    if (contentView)
    {
        var title = nil,
            image = nil;
        if (self._isTracking)
        {
            if (self._highlightsBy & CPContentsCellMask)
            {
                if (self._showsStateBy & CPContentsCellMask)
                {
                    title = self.isa.objj_msgSend0(self, "state") == CPOffState && self._alternateTitle ? self._alternateTitle : self._title;
                    image = self.isa.objj_msgSend0(self, "state") == CPOffState && self.isa.objj_msgSend0(self, "alternateImage") ? self.isa.objj_msgSend0(self, "alternateImage") : self.isa.objj_msgSend0(self, "image");
                }
                else
                {
                    title = self.isa.objj_msgSend0(self, "alternateTitle");
                    image = self.isa.objj_msgSend0(self, "alternateImage");
                }
            }
            else if (self._showsStateBy & CPContentsCellMask)
            {
                title = self.isa.objj_msgSend0(self, "state") != CPOffState && self._alternateTitle ? self._alternateTitle : self._title;
                image = self.isa.objj_msgSend0(self, "state") != CPOffState && self.isa.objj_msgSend0(self, "alternateImage") ? self.isa.objj_msgSend0(self, "alternateImage") : self.isa.objj_msgSend0(self, "image");
            }
            else
            {
                title = self._title;
                image = self.isa.objj_msgSend0(self, "image");
            }
        }
        else
        {
            if (self._showsStateBy & CPContentsCellMask)
            {
                title = self.isa.objj_msgSend0(self, "state") != CPOffState && self._alternateTitle ? self._alternateTitle : self._title;
                image = self.isa.objj_msgSend0(self, "state") != CPOffState && self.isa.objj_msgSend0(self, "alternateImage") ? self.isa.objj_msgSend0(self, "alternateImage") : self.isa.objj_msgSend0(self, "image");
            }
            else
            {
                title = self._title;
                image = self.isa.objj_msgSend0(self, "image");
            }
        }
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setText:", title));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setImage:", image));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setImageOffset:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "image-offset")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setFont:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "font")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setTextColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-color")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setAlignment:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "alignment")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setVerticalAlignment:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "vertical-alignment")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setLineBreakMode:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "line-break-mode")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setTextShadowColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-shadow-color")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setTextShadowOffset:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-shadow-offset")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setImagePosition:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "image-position")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setImageScaling:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "image-scaling")));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setDimsImage:", self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateDisabled) && self._imageDimsWhenDisabled));
    }
}
,["void"]), new objj_method(sel_getUid("setBordered:"), function $CPButton__setBordered_(self, _cmd, shouldBeBordered)
{
    if (shouldBeBordered)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateBordered);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateBordered);
}
,["void","BOOL"]), new objj_method(sel_getUid("isBordered"), function $CPButton__isBordered(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateBordered);
}
,["BOOL"]), new objj_method(sel_getUid("setKeyEquivalent:"), function $CPButton__setKeyEquivalent_(self, _cmd, aString)
{
    self._keyEquivalent = aString || "";
    if (aString === CPNewlineCharacter || aString === CPCarriageReturnCharacter)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateDefault);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateDefault);
}
,["void","CPString"]), new objj_method(sel_getUid("viewWillMoveToWindow:"), function $CPButton__viewWillMoveToWindow_(self, _cmd, aWindow)
{
    var selfWindow = self.isa.objj_msgSend0(self, "window");
    if (selfWindow === aWindow || aWindow === nil)
        return;
    if ((selfWindow == null ? null : selfWindow.isa.objj_msgSend0(selfWindow, "defaultButton")) === self)
        (selfWindow == null ? null : selfWindow.isa.objj_msgSend1(selfWindow, "setDefaultButton:", nil));
    if (self.isa.objj_msgSend0(self, "keyEquivalent") === CPNewlineCharacter || self.isa.objj_msgSend0(self, "keyEquivalent") === CPCarriageReturnCharacter)
        (aWindow == null ? null : aWindow.isa.objj_msgSend1(aWindow, "setDefaultButton:", self));
}
,["void","CPWindow"]), new objj_method(sel_getUid("keyEquivalent"), function $CPButton__keyEquivalent(self, _cmd)
{
    return self._keyEquivalent;
}
,["CPString"]), new objj_method(sel_getUid("setKeyEquivalentModifierMask:"), function $CPButton__setKeyEquivalentModifierMask_(self, _cmd, aMask)
{
    self._keyEquivalentModifierMask = aMask;
}
,["void","unsigned"]), new objj_method(sel_getUid("keyEquivalentModifierMask"), function $CPButton__keyEquivalentModifierMask(self, _cmd)
{
    return self._keyEquivalentModifierMask;
}
,["unsigned"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $CPButton__performKeyEquivalent_(self, _cmd, anEvent)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultButton")) === self)
        return NO;
    if (!(anEvent == null ? null : anEvent.isa.objj_msgSend2(anEvent, "_triggersKeyEquivalent:withModifierMask:", self.isa.objj_msgSend0(self, "keyEquivalent"), self.isa.objj_msgSend0(self, "keyEquivalentModifierMask"))))
        return NO;
    self.isa.objj_msgSend1(self, "performClick:", nil);
    return YES;
    var ___r1;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("performClick:"), function $CPButton__performClick_(self, _cmd, sender)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    self.isa.objj_msgSend1(self, "setState:", self.isa.objj_msgSend0(self, "nextState"));
    var shouldHighlight = NO;
    if (self._highlightsBy & (CPPushInCellMask | CPChangeGrayCellMask))
    {
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            shouldHighlight = self.isa.objj_msgSend0(self, "state") == CPOffState;
        else
            shouldHighlight = YES;
    }
    self.isa.objj_msgSend1(self, "highlight:", shouldHighlight);
    try    {
        self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
    }
    catch(e)     {
        throw e;
    }    finally     {
        if (shouldHighlight)
            CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.1, self, sel_getUid("unhighlightButtonTimerDidFinish:"), nil, NO);
    }
}
,["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPButton___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPTargetBinding || (aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPArgumentBinding)))
        return CPActionBinding.isa.objj_msgSend0(CPActionBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPButton").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("buttonWithTitle:"), function $CPButton__buttonWithTitle_(self, _cmd, aTitle)
{
    return self.isa.objj_msgSend2(self, "buttonWithTitle:theme:", aTitle, CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme"));
}
,["id","CPString"]), new objj_method(sel_getUid("buttonWithTitle:theme:"), function $CPButton__buttonWithTitle_theme_(self, _cmd, aTitle, aTheme)
{
    var button = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTheme:", aTheme));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTitle:", aTitle));
    (button == null ? null : button.isa.objj_msgSend0(button, "sizeToFit"));
    return button;
    var ___r1;
}
,["id","CPString","CPTheme"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPButton__defaultThemeClass(self, _cmd)
{
    return "button";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPButton__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "image", 0.0, "image-offset", CGInsetMakeZero(), "bezel-inset", CGInsetMakeZero(), "content-inset", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-color");
}
,["CPDictionary"])]);
}{
var the_class = objj_getClass("CPButton")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBezelStyle:"), function $CPButton__setBezelStyle_(self, _cmd, aBezelStyle)
{
    if (aBezelStyle === self._bezelStyle)
        return;
    var currentState = (CPButtonBezelStyleStateMap == null ? null : CPButtonBezelStyleStateMap.isa.objj_msgSend1(CPButtonBezelStyleStateMap, "objectForKey:", self._bezelStyle)),
        newState = (CPButtonBezelStyleStateMap == null ? null : CPButtonBezelStyleStateMap.isa.objj_msgSend1(CPButtonBezelStyleStateMap, "objectForKey:", aBezelStyle));
    if (currentState)
        self.isa.objj_msgSend1(self, "unsetThemeState:", currentState);
    if (newState)
        self.isa.objj_msgSend1(self, "setThemeState:", newState);
    self._bezelStyle = aBezelStyle;
}
,["void","unsigned"]), new objj_method(sel_getUid("bezelStyle"), function $CPButton__bezelStyle(self, _cmd)
{
    return self._bezelStyle;
}
,["unsigned"])]);
}var CPButtonImageKey = "CPButtonImageKey",
    CPButtonAlternateImageKey = "CPButtonAlternateImageKey",
    CPButtonTitleKey = "CPButtonTitleKey",
    CPButtonAlternateTitleKey = "CPButtonAlternateTitleKey",
    CPButtonIsBorderedKey = "CPButtonIsBorderedKey",
    CPButtonAllowsMixedStateKey = "CPButtonAllowsMixedStateKey",
    CPButtonImageDimsWhenDisabledKey = "CPButtonImageDimsWhenDisabledKey",
    CPButtonImagePositionKey = "CPButtonImagePositionKey",
    CPButtonKeyEquivalentKey = "CPButtonKeyEquivalentKey",
    CPButtonKeyEquivalentMaskKey = "CPButtonKeyEquivalentMaskKey",
    CPButtonPeriodicDelayKey = "CPButtonPeriodicDelayKey",
    CPButtonPeriodicIntervalKey = "CPButtonPeriodicIntervalKey",
    CPButtonHighlightsByKey = "CPButtonHighlightsByKey",
    CPButtonShowsStateByKey = "CPButtonShowsStateByKey";
{
var the_class = objj_getClass("CPButton")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPButton__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
        self._title = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPButtonTitleKey));
        self._alternateTitle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPButtonAlternateTitleKey));
        self._allowsMixedState = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPButtonAllowsMixedStateKey));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPButtonHighlightsByKey)))
        {
            self._highlightsBy = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPButtonHighlightsByKey));
            self._showsStateBy = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPButtonShowsStateByKey));
        }
        else
        {
        }
        (self == null ? null : self.isa.objj_msgSend1(self, "setImageDimsWhenDisabled:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPButtonImageDimsWhenDisabledKey))));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPButtonImagePositionKey)))
            (self == null ? null : self.isa.objj_msgSend1(self, "setImagePosition:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPButtonImagePositionKey))));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPButtonKeyEquivalentKey)))
            (self == null ? null : self.isa.objj_msgSend1(self, "setKeyEquivalent:", CFData.decodeBase64ToUtf16String((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPButtonKeyEquivalentKey)))));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPButtonPeriodicDelayKey)))
            self._periodicDelay = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPButtonPeriodicDelayKey));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPButtonPeriodicIntervalKey)))
            self._periodicInterval = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPButtonPeriodicIntervalKey));
        self._keyEquivalentModifierMask = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPButtonKeyEquivalentMaskKey));
        (self == null ? null : self.isa.objj_msgSend0(self, "setNeedsLayout"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPButton__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "encodeWithCoder:", aCoder);
    self.isa.objj_msgSend0(self, "invalidateTimers");
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._title, CPButtonTitleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._alternateTitle, CPButtonAlternateTitleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._allowsMixedState, CPButtonAllowsMixedStateKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._highlightsBy, CPButtonHighlightsByKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._showsStateBy, CPButtonShowsStateByKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self.isa.objj_msgSend0(self, "imageDimsWhenDisabled"), CPButtonImageDimsWhenDisabledKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self.isa.objj_msgSend0(self, "imagePosition"), CPButtonImagePositionKey));
    if (self._keyEquivalent)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", CFData.encodeBase64Utf16String(self._keyEquivalent), CPButtonKeyEquivalentKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._keyEquivalentModifierMask, CPButtonKeyEquivalentMaskKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._periodicDelay, CPButtonPeriodicDelayKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._periodicInterval, CPButtonPeriodicIntervalKey));
}
,["void","CPCoder"])]);
}