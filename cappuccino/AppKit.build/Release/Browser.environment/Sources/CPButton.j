@STATIC;1.0;i;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.ji;17;CPStringDrawing.ji;8;CPText.ji;20;CPWindow_Constants.jt;34024;objj_executeFile("_CPImageAndTextView.j", YES);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPControl.j", YES);objj_executeFile("CPStringDrawing.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPWindow_Constants.j", YES);CPRoundedBezelStyle = 1;
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
var CPButtonBezelStyleStateMap = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPButtonStateBezelStyleRounded, CPRoundedBezelStyle, objj_msgSend(CPNull, "null"), CPRoundRectBezelStyle);
CPButtonDefaultHeight = 25.0;
CPButtonImageOffset = 3.0;
{var the_class = objj_allocateClassPair(CPControl, "CPButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_allowsMixedState"), new objj_ivar("_title"), new objj_ivar("_alternateTitle"), new objj_ivar("_showsStateBy"), new objj_ivar("_highlightsBy"), new objj_ivar("_imageDimsWhenDisabled"), new objj_ivar("_bezelStyle"), new objj_ivar("_controlSize"), new objj_ivar("_keyEquivalent"), new objj_ivar("_keyEquivalentModifierMask"), new objj_ivar("_continuousDelayTimer"), new objj_ivar("_continuousTimer"), new objj_ivar("_periodicDelay"), new objj_ivar("_periodicInterval"), new objj_ivar("_isTracking")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPButton__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setValue:forThemeAttribute:", CPCenterTextAlignment, "alignment");
        objj_msgSend(self, "setValue:forThemeAttribute:", CPCenterVerticalTextAlignment, "vertical-alignment");
        objj_msgSend(self, "setValue:forThemeAttribute:", CPImageLeft, "image-position");
        objj_msgSend(self, "setValue:forThemeAttribute:", CPImageScaleNone, "image-scaling");
        objj_msgSend(self, "setBezelStyle:", CPRoundRectBezelStyle);
        objj_msgSend(self, "setBordered:", YES);
        objj_msgSend(self, "_init");
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
    objj_msgSend(self, "setButtonType:", CPMomentaryPushInButton);
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
    if (!self._allowsMixedState && objj_msgSend(self, "state") === CPMixedState)
        objj_msgSend(self, "setState:", CPOnState);
}
,["void","BOOL"]), new objj_method(sel_getUid("setObjectValue:"), function $CPButton__setObjectValue_(self, _cmd, anObjectValue)
{
    if (!anObjectValue || anObjectValue === "" || objj_msgSend(anObjectValue, "intValue") === 0)
        anObjectValue = CPOffState;
    else if (!objj_msgSend(anObjectValue, "isKindOfClass:", objj_msgSend(CPNumber, "class")))
        anObjectValue = CPOnState;
    else if (anObjectValue >= CPOnState)
        anObjectValue = CPOnState;
    else if (anObjectValue < CPOffState)
        if (objj_msgSend(self, "allowsMixedState"))
            anObjectValue = CPMixedState;
        else
            anObjectValue = CPOnState;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "setObjectValue:", anObjectValue);
    switch(objj_msgSend(self, "objectValue")) {
    case CPMixedState:
        objj_msgSend(self, "unsetThemeState:", CPThemeStateSelected);
        objj_msgSend(self, "setThemeState:", CPButtonStateMixed);
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            objj_msgSend(self, "setThemeState:", CPThemeStateHighlighted);
        else
            objj_msgSend(self, "unsetThemeState:", CPThemeStateHighlighted);
        break;
    case CPOnState:
        objj_msgSend(self, "unsetThemeState:", CPButtonStateMixed);
        objj_msgSend(self, "setThemeState:", CPThemeStateSelected);
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            objj_msgSend(self, "setThemeState:", CPThemeStateHighlighted);
        else
            objj_msgSend(self, "unsetThemeState:", CPThemeStateHighlighted);
        break;
    case CPOffState:
        objj_msgSend(self, "unsetThemeState:", [CPThemeStateSelected, CPButtonStateMixed, CPThemeStateHighlighted]);
    }
}
,["void","id"]), new objj_method(sel_getUid("nextState"), function $CPButton__nextState(self, _cmd)
{
    if (objj_msgSend(self, "allowsMixedState"))
    {
        var value = objj_msgSend(self, "state");
        return value - (value === -1 ? -2 : 1);
    }
    return 1 - objj_msgSend(self, "state");
}
,["CPInteger"]), new objj_method(sel_getUid("setNextState"), function $CPButton__setNextState(self, _cmd)
{
    if (objj_msgSend(self, "infoForBinding:", CPValueBinding))
        objj_msgSend(self, "setAllowsMixedState:", NO);
    objj_msgSend(self, "setState:", objj_msgSend(self, "nextState"));
}
,["void"]), new objj_method(sel_getUid("setState:"), function $CPButton__setState_(self, _cmd, aState)
{
    objj_msgSend(self, "setIntValue:", aState);
}
,["void","CPInteger"]), new objj_method(sel_getUid("state"), function $CPButton__state(self, _cmd)
{
    return objj_msgSend(self, "intValue");
}
,["CPInteger"]), new objj_method(sel_getUid("setTitle:"), function $CPButton__setTitle_(self, _cmd, aTitle)
{
    if (self._title === aTitle)
        return;
    self._title = aTitle;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
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
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPString"]), new objj_method(sel_getUid("alternateTitle"), function $CPButton__alternateTitle(self, _cmd)
{
    return self._alternateTitle;
}
,["CPString"]), new objj_method(sel_getUid("setImage:"), function $CPButton__setImage_(self, _cmd, anImage)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", anImage, "image");
}
,["void","CPImage"]), new objj_method(sel_getUid("image"), function $CPButton__image(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:inState:", "image", CPThemeStateNormal);
}
,["CPImage"]), new objj_method(sel_getUid("setAlternateImage:"), function $CPButton__setAlternateImage_(self, _cmd, anImage)
{
    objj_msgSend(self, "setValue:forThemeAttribute:inState:", anImage, "image", CPThemeStateHighlighted);
}
,["void","CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPButton__alternateImage(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:inState:", "image", CPThemeStateHighlighted);
}
,["CPImage"]), new objj_method(sel_getUid("setImageOffset:"), function $CPButton__setImageOffset_(self, _cmd, theImageOffset)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", theImageOffset, "image-offset");
}
,["void","float"]), new objj_method(sel_getUid("imageOffset"), function $CPButton__imageOffset(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "image-offset");
}
,["float"]), new objj_method(sel_getUid("setShowsStateBy:"), function $CPButton__setShowsStateBy_(self, _cmd, aMask)
{
    aMask &= ~CPPushInCellMask;
    if (self._showsStateBy === aMask)
        return;
    self._showsStateBy = aMask;
    if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask) && objj_msgSend(self, "state") != CPOffState)
        objj_msgSend(self, "setThemeState:", CPThemeStateHighlighted);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateHighlighted);
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
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
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateHighlighted))
    {
        objj_msgSend(self, "setNeedsDisplay:", YES);
        objj_msgSend(self, "setNeedsLayout");
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
        objj_msgSend(self, "setHighlightsBy:", CPChangeGrayCellMask | CPChangeBackgroundCellMask);
        objj_msgSend(self, "setShowsStateBy:", CPNoCellMask);
        break;
    case CPMomentaryPushInButton:
        objj_msgSend(self, "setHighlightsBy:", CPPushInCellMask | CPChangeGrayCellMask | CPChangeBackgroundCellMask);
        objj_msgSend(self, "setShowsStateBy:", CPNoCellMask);
        break;
    case CPMomentaryChangeButton:
        objj_msgSend(self, "setHighlightsBy:", CPContentsCellMask);
        objj_msgSend(self, "setShowsStateBy:", CPNoCellMask);
        break;
    case CPPushOnPushOffButton:
        objj_msgSend(self, "setHighlightsBy:", CPPushInCellMask | CPChangeGrayCellMask | CPChangeBackgroundCellMask);
        objj_msgSend(self, "setShowsStateBy:", CPChangeBackgroundCellMask | CPChangeGrayCellMask);
        break;
    case CPOnOffButton:
        objj_msgSend(self, "setHighlightsBy:", CPChangeGrayCellMask | CPChangeBackgroundCellMask);
        objj_msgSend(self, "setShowsStateBy:", CPChangeGrayCellMask | CPChangeBackgroundCellMask);
        break;
    case CPToggleButton:
        objj_msgSend(self, "setHighlightsBy:", CPPushInCellMask | CPContentsCellMask);
        objj_msgSend(self, "setShowsStateBy:", CPContentsCellMask);
        break;
    case CPSwitchButton:
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "The CPSwitchButton type is not supported in Cappuccino, use the CPCheckBox class instead.");
    case CPRadioButton:
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "The CPRadioButton type is not supported in Cappuccino, use the CPRadio class instead.");
default:
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Unknown button type.");
    }
    objj_msgSend(self, "setImageDimsWhenDisabled:", YES);
}
,["void","CPButtonType"]), new objj_method(sel_getUid("setImageDimsWhenDisabled:"), function $CPButton__setImageDimsWhenDisabled_(self, _cmd, imageShouldDimWhenDisabled)
{
    imageShouldDimWhenDisabled = !!imageShouldDimWhenDisabled;
    if (self._imageDimsWhenDisabled === imageShouldDimWhenDisabled)
        return;
    self._imageDimsWhenDisabled = imageShouldDimWhenDisabled;
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateDisabled))
    {
        objj_msgSend(self, "setNeedsDisplay:", YES);
        objj_msgSend(self, "setNeedsLayout");
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
    if (objj_msgSend(self, "isContinuous"))
    {
        self._continuousDelayTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", self._periodicDelay, function()
        {
            if (!self._continuousTimer)
                self._continuousTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self._periodicInterval, self, sel_getUid("onContinousEvent:"), anEvent, YES);
        }, NO);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "mouseDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("onContinousEvent:"), function $CPButton__onContinousEvent_(self, _cmd, aTimer)
{
    if (self._target && self._action && objj_msgSend(self._target, "respondsToSelector:", self._action))
        objj_msgSend(self._target, "performSelector:withObject:", self._action, self);
}
,["void","CPTimer"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPButton__startTrackingAt_(self, _cmd, aPoint)
{
    self._isTracking = YES;
    var startedTracking = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "startTrackingAt:", aPoint);
    if (self._highlightsBy & (CPPushInCellMask | CPChangeGrayCellMask))
    {
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            objj_msgSend(self, "highlight:", objj_msgSend(self, "state") == CPOffState);
        else
            objj_msgSend(self, "highlight:", YES);
    }
    else
    {
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            objj_msgSend(self, "highlight:", objj_msgSend(self, "state") != CPOffState);
        else
            objj_msgSend(self, "highlight:", NO);
    }
    return startedTracking;
}
,["BOOL","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPButton__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{
    self._isTracking = NO;
    if (mouseIsUp && CGRectContainsPoint(objj_msgSend(self, "bounds"), aPoint))
        objj_msgSend(self, "setNextState");
    else
    {
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            objj_msgSend(self, "highlight:", objj_msgSend(self, "state") != CPOffState);
        else
            objj_msgSend(self, "highlight:", NO);
    }
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "invalidateTimers");
}
,["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("invalidateTimers"), function $CPButton__invalidateTimers(self, _cmd)
{
    if (self._continuousTimer)
    {
        objj_msgSend(self._continuousTimer, "invalidate");
        self._continuousTimer = nil;
    }
    if (self._continuousDelayTimer)
    {
        objj_msgSend(self._continuousDelayTimer, "invalidate");
        self._continuousDelayTimer = nil;
    }
}
,["void"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPButton__contentRectForBounds_(self, _cmd, bounds)
{
    var contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset");
    return CGRectInsetByInset(bounds, contentInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("bezelRectForBounds:"), function $CPButton__bezelRectForBounds_(self, _cmd, bounds)
{
    if (!objj_msgSend(self, "isBordered"))
        return bounds;
    var bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset");
    return CGRectInsetByInset(bounds, bezelInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("_minimumFrameSize"), function $CPButton___minimumFrameSize(self, _cmd)
{
    var size = CGSizeMakeZero(),
        contentView = objj_msgSend(self, "ephemeralSubviewNamed:", "content-view");
    if (contentView)
    {
        objj_msgSend(contentView, "sizeToFit");
        size = objj_msgSend(contentView, "frameSize");
    }
    else
        size = objj_msgSend(objj_msgSend(self, "title") || " ", "sizeWithFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "font"));
    var contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset"),
        minSize = objj_msgSend(self, "currentValueForThemeAttribute:", "min-size"),
        maxSize = objj_msgSend(self, "currentValueForThemeAttribute:", "max-size");
    size.width = MAX(size.width + contentInset.left + contentInset.right, minSize.width);
    size.height = MAX(size.height + contentInset.top + contentInset.bottom, minSize.height);
    if (maxSize.width >= 0.0)
        size.width = MIN(size.width, maxSize.width);
    if (maxSize.height >= 0.0)
        size.height = MIN(size.height, maxSize.height);
    return size;
}
,["CGSize"]), new objj_method(sel_getUid("sizeToFit"), function $CPButton__sizeToFit(self, _cmd)
{
    objj_msgSend(self, "layoutSubviews");
    objj_msgSend(self, "setFrameSize:", objj_msgSend(self, "_minimumFrameSize"));
    if (objj_msgSend(self, "ephemeralSubviewNamed:", "content-view"))
        objj_msgSend(self, "layoutSubviews");
}
,["void"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPButton__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "bezel-view")
        return objj_msgSend(self, "bezelRectForBounds:", objj_msgSend(self, "bounds"));
    else if (aName === "content-view")
        return objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPButton__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "bezel-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    else
        return objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", CGRectMakeZero());
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPButton__layoutSubviews(self, _cmd)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-color"));
    var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
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
                    title = objj_msgSend(self, "state") == CPOffState && self._alternateTitle ? self._alternateTitle : self._title;
                    image = objj_msgSend(self, "state") == CPOffState && objj_msgSend(self, "alternateImage") ? objj_msgSend(self, "alternateImage") : objj_msgSend(self, "image");
                }
                else
                {
                    title = objj_msgSend(self, "alternateTitle");
                    image = objj_msgSend(self, "alternateImage");
                }
            }
            else if (self._showsStateBy & CPContentsCellMask)
            {
                title = objj_msgSend(self, "state") != CPOffState && self._alternateTitle ? self._alternateTitle : self._title;
                image = objj_msgSend(self, "state") != CPOffState && objj_msgSend(self, "alternateImage") ? objj_msgSend(self, "alternateImage") : objj_msgSend(self, "image");
            }
            else
            {
                title = self._title;
                image = objj_msgSend(self, "image");
            }
        }
        else
        {
            if (self._showsStateBy & CPContentsCellMask)
            {
                title = objj_msgSend(self, "state") != CPOffState && self._alternateTitle ? self._alternateTitle : self._title;
                image = objj_msgSend(self, "state") != CPOffState && objj_msgSend(self, "alternateImage") ? objj_msgSend(self, "alternateImage") : objj_msgSend(self, "image");
            }
            else
            {
                title = self._title;
                image = objj_msgSend(self, "image");
            }
        }
        objj_msgSend(contentView, "setText:", title);
        objj_msgSend(contentView, "setImage:", image);
        objj_msgSend(contentView, "setImageOffset:", objj_msgSend(self, "currentValueForThemeAttribute:", "image-offset"));
        objj_msgSend(contentView, "setFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "font"));
        objj_msgSend(contentView, "setTextColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-color"));
        objj_msgSend(contentView, "setAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "alignment"));
        objj_msgSend(contentView, "setVerticalAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "vertical-alignment"));
        objj_msgSend(contentView, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemeAttribute:", "line-break-mode"));
        objj_msgSend(contentView, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-color"));
        objj_msgSend(contentView, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-offset"));
        objj_msgSend(contentView, "setImagePosition:", objj_msgSend(self, "currentValueForThemeAttribute:", "image-position"));
        objj_msgSend(contentView, "setImageScaling:", objj_msgSend(self, "currentValueForThemeAttribute:", "image-scaling"));
        objj_msgSend(contentView, "setDimsImage:", objj_msgSend(self, "hasThemeState:", CPThemeStateDisabled) && self._imageDimsWhenDisabled);
    }
}
,["void"]), new objj_method(sel_getUid("setBordered:"), function $CPButton__setBordered_(self, _cmd, shouldBeBordered)
{
    if (shouldBeBordered)
        objj_msgSend(self, "setThemeState:", CPThemeStateBordered);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateBordered);
}
,["void","BOOL"]), new objj_method(sel_getUid("isBordered"), function $CPButton__isBordered(self, _cmd)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateBordered);
}
,["BOOL"]), new objj_method(sel_getUid("setKeyEquivalent:"), function $CPButton__setKeyEquivalent_(self, _cmd, aString)
{
    self._keyEquivalent = aString || "";
    if (aString === CPNewlineCharacter || aString === CPCarriageReturnCharacter)
        objj_msgSend(self, "setThemeState:", CPThemeStateDefault);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateDefault);
}
,["void","CPString"]), new objj_method(sel_getUid("viewWillMoveToWindow:"), function $CPButton__viewWillMoveToWindow_(self, _cmd, aWindow)
{
    var selfWindow = objj_msgSend(self, "window");
    if (selfWindow === aWindow || aWindow === nil)
        return;
    if (objj_msgSend(selfWindow, "defaultButton") === self)
        objj_msgSend(selfWindow, "setDefaultButton:", nil);
    if (objj_msgSend(self, "keyEquivalent") === CPNewlineCharacter || objj_msgSend(self, "keyEquivalent") === CPCarriageReturnCharacter)
        objj_msgSend(aWindow, "setDefaultButton:", self);
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
    if (objj_msgSend(objj_msgSend(self, "window"), "defaultButton") === self)
        return NO;
    if (!objj_msgSend(anEvent, "_triggersKeyEquivalent:withModifierMask:", objj_msgSend(self, "keyEquivalent"), objj_msgSend(self, "keyEquivalentModifierMask")))
        return NO;
    objj_msgSend(self, "performClick:", nil);
    return YES;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("performClick:"), function $CPButton__performClick_(self, _cmd, sender)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "setState:", objj_msgSend(self, "nextState"));
    var shouldHighlight = NO;
    if (self._highlightsBy & (CPPushInCellMask | CPChangeGrayCellMask))
    {
        if (self._showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            shouldHighlight = objj_msgSend(self, "state") == CPOffState;
        else
            shouldHighlight = YES;
    }
    objj_msgSend(self, "highlight:", shouldHighlight);
    try    {
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }
    catch(e)     {
        throw e;
    }    finally     {
        if (shouldHighlight)
            objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.1, self, sel_getUid("unhighlightButtonTimerDidFinish:"), nil, NO);
    }
}
,["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPButton___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPTargetBinding || objj_msgSend(aBinding, "hasPrefix:", CPArgumentBinding))
        return objj_msgSend(CPActionBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPButton").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("buttonWithTitle:"), function $CPButton__buttonWithTitle_(self, _cmd, aTitle)
{
    return objj_msgSend(self, "buttonWithTitle:theme:", aTitle, objj_msgSend(CPTheme, "defaultTheme"));
}
,["id","CPString"]), new objj_method(sel_getUid("buttonWithTitle:theme:"), function $CPButton__buttonWithTitle_theme_(self, _cmd, aTitle, aTheme)
{
    var button = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    objj_msgSend(button, "setTheme:", aTheme);
    objj_msgSend(button, "setTitle:", aTitle);
    objj_msgSend(button, "sizeToFit");
    return button;
}
,["id","CPString","CPTheme"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPButton__defaultThemeClass(self, _cmd)
{
    return "button";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPButton__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "image", 0.0, "image-offset", CGInsetMakeZero(), "bezel-inset", CGInsetMakeZero(), "content-inset", objj_msgSend(CPNull, "null"), "bezel-color");
}
,["CPDictionary"])]);
}{
var the_class = objj_getClass("CPButton")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBezelStyle:"), function $CPButton__setBezelStyle_(self, _cmd, aBezelStyle)
{
    if (aBezelStyle === self._bezelStyle)
        return;
    var currentState = objj_msgSend(CPButtonBezelStyleStateMap, "objectForKey:", self._bezelStyle),
        newState = objj_msgSend(CPButtonBezelStyleStateMap, "objectForKey:", aBezelStyle);
    if (currentState)
        objj_msgSend(self, "unsetThemeState:", currentState);
    if (newState)
        objj_msgSend(self, "setThemeState:", newState);
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
        objj_msgSend(self, "_init");
        self._title = objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonTitleKey);
        self._alternateTitle = objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonAlternateTitleKey);
        self._allowsMixedState = objj_msgSend(aCoder, "decodeBoolForKey:", CPButtonAllowsMixedStateKey);
        if (objj_msgSend(aCoder, "containsValueForKey:", CPButtonHighlightsByKey))
        {
            self._highlightsBy = objj_msgSend(aCoder, "decodeIntForKey:", CPButtonHighlightsByKey);
            self._showsStateBy = objj_msgSend(aCoder, "decodeIntForKey:", CPButtonShowsStateByKey);
        }
        else
        {
        }
        objj_msgSend(self, "setImageDimsWhenDisabled:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonImageDimsWhenDisabledKey));
        if (objj_msgSend(aCoder, "containsValueForKey:", CPButtonImagePositionKey))
            objj_msgSend(self, "setImagePosition:", objj_msgSend(aCoder, "decodeIntForKey:", CPButtonImagePositionKey));
        if (objj_msgSend(aCoder, "containsValueForKey:", CPButtonKeyEquivalentKey))
            objj_msgSend(self, "setKeyEquivalent:", CFData.decodeBase64ToUtf16String(objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonKeyEquivalentKey)));
        if (objj_msgSend(aCoder, "containsValueForKey:", CPButtonPeriodicDelayKey))
            self._periodicDelay = objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonPeriodicDelayKey);
        if (objj_msgSend(aCoder, "containsValueForKey:", CPButtonPeriodicIntervalKey))
            self._periodicInterval = objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonPeriodicIntervalKey);
        self._keyEquivalentModifierMask = objj_msgSend(aCoder, "decodeIntForKey:", CPButtonKeyEquivalentMaskKey);
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPButton__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(self, "invalidateTimers");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._title, CPButtonTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._alternateTitle, CPButtonAlternateTitleKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._allowsMixedState, CPButtonAllowsMixedStateKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._highlightsBy, CPButtonHighlightsByKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._showsStateBy, CPButtonShowsStateByKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", objj_msgSend(self, "imageDimsWhenDisabled"), CPButtonImageDimsWhenDisabledKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", objj_msgSend(self, "imagePosition"), CPButtonImagePositionKey);
    if (self._keyEquivalent)
        objj_msgSend(aCoder, "encodeObject:forKey:", CFData.encodeBase64Utf16String(self._keyEquivalent), CPButtonKeyEquivalentKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._keyEquivalentModifierMask, CPButtonKeyEquivalentMaskKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._periodicDelay, CPButtonPeriodicDelayKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._periodicInterval, CPButtonPeriodicIntervalKey);
}
,["void","CPCoder"])]);
}