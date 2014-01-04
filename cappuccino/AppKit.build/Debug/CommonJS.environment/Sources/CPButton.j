@STATIC;1.0;i;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.ji;17;CPStringDrawing.ji;12;CPCheckBox.ji;9;CPRadio.jt;34975;

objj_executeFile("_CPImageAndTextView.j", YES);
objj_executeFile("CGGeometry.j", YES);

objj_executeFile("CPControl.j", YES);
objj_executeFile("CPStringDrawing.j", YES);





CPRoundedBezelStyle = 1;
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


var CPButtonBezelStyleStateMap = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [CPButtonStateBezelStyleRounded, nil], [CPRoundedBezelStyle, CPRoundRectBezelStyle]);


CPButtonDefaultHeight = 24.0;
CPButtonImageOffset = 3.0;
{var the_class = objj_allocateClassPair(CPControl, "CPButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_allowsMixedState"), new objj_ivar("_title"), new objj_ivar("_alternateTitle"), new objj_ivar("_showsStateBy"), new objj_ivar("_highlightsBy"), new objj_ivar("_imageDimsWhenDisabled"), new objj_ivar("_bezelStyle"), new objj_ivar("_controlSize"), new objj_ivar("_keyEquivalent"), new objj_ivar("_keyEquivalentModifierMask"), new objj_ivar("_continuousDelayTimer"), new objj_ivar("_continuousTimer"), new objj_ivar("_periodicDelay"), new objj_ivar("_periodicInterval"), new objj_ivar("_isTracking")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
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
},["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPButton___init(self, _cmd)
{ with(self)
{
    _controlSize = CPRegularControlSize;

    _keyEquivalent = "";
    _keyEquivalentModifierMask = 0;


    _periodicInterval = 0.05;
    _periodicDelay = 0.5;

    objj_msgSend(self, "setButtonType:", CPMomentaryPushInButton);
}
},["void"]), new objj_method(sel_getUid("allowsMixedState"), function $CPButton__allowsMixedState(self, _cmd)
{ with(self)
{
    return _allowsMixedState;
}
},["BOOL"]), new objj_method(sel_getUid("setAllowsMixedState:"), function $CPButton__setAllowsMixedState_(self, _cmd, aFlag)
{ with(self)
{
    aFlag = !!aFlag;

    if (_allowsMixedState === aFlag)
        return;

    _allowsMixedState = aFlag;

    if (!_allowsMixedState && objj_msgSend(self, "state") === CPMixedState)
        objj_msgSend(self, "setState:", CPOnState);
}
},["void","BOOL"]), new objj_method(sel_getUid("setObjectValue:"), function $CPButton__setObjectValue_(self, _cmd, anObjectValue)
{ with(self)
{
    if (!anObjectValue || anObjectValue === "" || (objj_msgSend(anObjectValue, "intValue") === 0))
        anObjectValue = CPOffState;
    else if (!objj_msgSend(anObjectValue, "isKindOfClass:", objj_msgSend(CPNumber, "class")))
        anObjectValue = CPOnState;
    else if (anObjectValue >= CPOnState)
        anObjectValue = CPOnState
    else if (anObjectValue < CPOffState)
        if (objj_msgSend(self, "allowsMixedState"))
            anObjectValue = CPMixedState;
        else
            anObjectValue = CPOnState;

    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "setObjectValue:", anObjectValue);

    switch (objj_msgSend(self, "objectValue"))
    {
        case CPMixedState:
            objj_msgSend(self, "unsetThemeState:", CPThemeStateSelected);
            objj_msgSend(self, "setThemeState:", CPButtonStateMixed);
            if (_showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
                objj_msgSend(self, "setThemeState:", CPThemeStateHighlighted);
            else
                objj_msgSend(self, "unsetThemeState:", CPThemeStateHighlighted);
            break;

        case CPOnState:
            objj_msgSend(self, "unsetThemeState:", CPButtonStateMixed);
            objj_msgSend(self, "setThemeState:", CPThemeStateSelected);
            if (_showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
                objj_msgSend(self, "setThemeState:", CPThemeStateHighlighted);
            else
                objj_msgSend(self, "unsetThemeState:", CPThemeStateHighlighted);
            break;

        case CPOffState:
            objj_msgSend(self, "unsetThemeState:", CPThemeStateSelected | CPButtonStateMixed | CPThemeStateHighlighted);
    }
}
},["void","id"]), new objj_method(sel_getUid("nextState"), function $CPButton__nextState(self, _cmd)
{ with(self)
{
   if (objj_msgSend(self, "allowsMixedState"))
   {
      var value = objj_msgSend(self, "state");

      return value - ((value === -1) ? -2 : 1);
   }

    return 1 - objj_msgSend(self, "state");
}
},["CPInteger"]), new objj_method(sel_getUid("setNextState"), function $CPButton__setNextState(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "infoForBinding:", CPValueBinding))
        objj_msgSend(self, "setAllowsMixedState:", NO);

    objj_msgSend(self, "setState:", objj_msgSend(self, "nextState"));
}
},["void"]), new objj_method(sel_getUid("setState:"), function $CPButton__setState_(self, _cmd, aState)
{ with(self)
{
    objj_msgSend(self, "setIntValue:", aState);
}
},["void","CPInteger"]), new objj_method(sel_getUid("state"), function $CPButton__state(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "intValue");
}
},["CPInteger"]), new objj_method(sel_getUid("setTitle:"), function $CPButton__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    if (_title === aTitle)
        return;

    _title = aTitle;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPString"]), new objj_method(sel_getUid("title"), function $CPButton__title(self, _cmd)
{ with(self)
{
    return _title;
}
},["CPString"]), new objj_method(sel_getUid("setAlternateTitle:"), function $CPButton__setAlternateTitle_(self, _cmd, aTitle)
{ with(self)
{
    if (_alternateTitle === aTitle)
        return;

    _alternateTitle = aTitle;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPString"]), new objj_method(sel_getUid("alternateTitle"), function $CPButton__alternateTitle(self, _cmd)
{ with(self)
{
    return _alternateTitle;
}
},["CPString"]), new objj_method(sel_getUid("setImage:"), function $CPButton__setImage_(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", anImage, "image");
}
},["void","CPImage"]), new objj_method(sel_getUid("image"), function $CPButton__image(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "valueForThemeAttribute:inState:", "image", CPThemeStateNormal);
}
},["CPImage"]), new objj_method(sel_getUid("setAlternateImage:"), function $CPButton__setAlternateImage_(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(self, "setValue:forThemeAttribute:inState:", anImage, "image", CPThemeStateHighlighted);
}
},["void","CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPButton__alternateImage(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "valueForThemeAttribute:inState:", "image", CPThemeStateHighlighted);
}
},["CPImage"]), new objj_method(sel_getUid("setImageOffset:"), function $CPButton__setImageOffset_(self, _cmd, theImageOffset)
{ with(self)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", theImageOffset, "image-offset");
}
},["void","float"]), new objj_method(sel_getUid("imageOffset"), function $CPButton__imageOffset(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "image-offset");
}
},["float"]), new objj_method(sel_getUid("setShowsStateBy:"), function $CPButton__setShowsStateBy_(self, _cmd, aMask)
{ with(self)
{

    aMask &= ~CPPushInCellMask;

    if (_showsStateBy === aMask)
        return;

    _showsStateBy = aMask;

    if (_showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask) && objj_msgSend(self, "state") != CPOffState)
        objj_msgSend(self, "setThemeState:", CPThemeStateHighlighted);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateHighlighted);

    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPInteger"]), new objj_method(sel_getUid("showsStateBy"), function $CPButton__showsStateBy(self, _cmd)
{ with(self)
{
    return _showsStateBy;
}
},["CPInteger"]), new objj_method(sel_getUid("setHighlightsBy:"), function $CPButton__setHighlightsBy_(self, _cmd, aMask)
{ with(self)
{
    if (_highlightsBy === aMask)
        return;

    _highlightsBy = aMask;

    if (objj_msgSend(self, "hasThemeState:", CPThemeStateHighlighted))
    {
        objj_msgSend(self, "setNeedsDisplay:", YES);
        objj_msgSend(self, "setNeedsLayout");
    }
}
},["void","CPInteger"]), new objj_method(sel_getUid("highlightsBy"), function $CPButton__highlightsBy(self, _cmd)
{ with(self)
{
    return _highlightsBy;
}
},["CPInteger"]), new objj_method(sel_getUid("setButtonType:"), function $CPButton__setButtonType_(self, _cmd, aButtonType)
{ with(self)
{
    switch (aButtonType)
    {
        case CPMomentaryLightButton: objj_msgSend(self, "setHighlightsBy:", CPChangeGrayCellMask | CPChangeBackgroundCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPNoCellMask);
                                        break;

        case CPMomentaryPushInButton: objj_msgSend(self, "setHighlightsBy:", CPPushInCellMask | CPChangeGrayCellMask | CPChangeBackgroundCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPNoCellMask);
                                        break;

        case CPMomentaryChangeButton: objj_msgSend(self, "setHighlightsBy:", CPContentsCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPNoCellMask);
                                        break;

        case CPPushOnPushOffButton: objj_msgSend(self, "setHighlightsBy:", CPPushInCellMask | CPChangeGrayCellMask | CPChangeBackgroundCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPChangeBackgroundCellMask | CPChangeGrayCellMask);
                                        break;

        case CPOnOffButton: objj_msgSend(self, "setHighlightsBy:", CPChangeGrayCellMask | CPChangeBackgroundCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPChangeGrayCellMask | CPChangeBackgroundCellMask);
                                        break;

        case CPToggleButton: objj_msgSend(self, "setHighlightsBy:", CPPushInCellMask | CPContentsCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPContentsCellMask);
                                        break;

        case CPSwitchButton: objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "The CPSwitchButton type is not supported in Cappuccino, use the CPCheckBox class instead.");

        case CPRadioButton: objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "The CPRadioButton type is not supported in Cappuccino, use the CPRadio class instead.");

        default: objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Unknown button type.");
    }

    objj_msgSend(self, "setImageDimsWhenDisabled:", YES);
}
},["void","CPButtonType"]), new objj_method(sel_getUid("setImageDimsWhenDisabled:"), function $CPButton__setImageDimsWhenDisabled_(self, _cmd, imageShouldDimWhenDisabled)
{ with(self)
{
    imageShouldDimWhenDisabled = !!imageShouldDimWhenDisabled;

    if (_imageDimsWhenDisabled === imageShouldDimWhenDisabled)
        return;

    _imageDimsWhenDisabled = imageShouldDimWhenDisabled;

    if (objj_msgSend(self, "hasThemeState:", CPThemeStateDisabled))
    {
        objj_msgSend(self, "setNeedsDisplay:", YES);
        objj_msgSend(self, "setNeedsLayout");
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("imageDimsWhenDisabled"), function $CPButton__imageDimsWhenDisabled(self, _cmd)
{ with(self)
{
    return _imageDimsWhenDisabled;
}
},["BOOL"]), new objj_method(sel_getUid("setPeriodicDelay:interval:"), function $CPButton__setPeriodicDelay_interval_(self, _cmd, aDelay, anInterval)
{ with(self)
{
    _periodicDelay = aDelay;
    _periodicInterval = anInterval;
}
},["void","float","float"]), new objj_method(sel_getUid("mouseDown:"), function $CPButton__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(self, "isContinuous"))
    {
        _continuousDelayTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", _periodicDelay,  function()
        {
            if (!_continuousTimer)
                _continuousTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", _periodicInterval, self, sel_getUid("onContinousEvent:"), anEvent, YES);
        }, NO);
    }

    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "mouseDown:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("onContinousEvent:"), function $CPButton__onContinousEvent_(self, _cmd, aTimer)
{ with(self)
{
    if (_target && _action && objj_msgSend(_target, "respondsToSelector:", _action))
        objj_msgSend(_target, "performSelector:withObject:", _action, self);
}
},["void","CPTimer"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPButton__startTrackingAt_(self, _cmd, aPoint)
{ with(self)
{
    _isTracking = YES;

    var startedTracking = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "startTrackingAt:", aPoint);
    if (_highlightsBy & (CPPushInCellMask | CPChangeGrayCellMask))
    {
        if (_showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            objj_msgSend(self, "highlight:", objj_msgSend(self, "state") == CPOffState);
        else
            objj_msgSend(self, "highlight:", YES);
    }
    else
    {
        if (_showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            objj_msgSend(self, "highlight:", objj_msgSend(self, "state") != CPOffState);
        else
            objj_msgSend(self, "highlight:", NO);
    }
    return startedTracking;
}
},["BOOL","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPButton__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{ with(self)
{
    _isTracking = NO;

    if (mouseIsUp && CGRectContainsPoint(objj_msgSend(self, "bounds"), aPoint))
        objj_msgSend(self, "setNextState");
    else
    {
        if (_showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            objj_msgSend(self, "highlight:", objj_msgSend(self, "state") != CPOffState);
        else
            objj_msgSend(self, "highlight:", NO);
    }

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "invalidateTimers");
}
},["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("invalidateTimers"), function $CPButton__invalidateTimers(self, _cmd)
{ with(self)
{
    if (_continuousTimer)
    {
        objj_msgSend(_continuousTimer, "invalidate");
        _continuousTimer = nil;
    }

    if (_continuousDelayTimer)
    {
        objj_msgSend(_continuousDelayTimer, "invalidate");
        _continuousDelayTimer = nil;
    }
}
},["void"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPButton__contentRectForBounds_(self, _cmd, bounds)
{ with(self)
{
    var contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset");

    return { origin: { x:(bounds).origin.x + (contentInset).left, y:(bounds).origin.y + (contentInset).top }, size: { width:(bounds).size.width - (contentInset).left - (contentInset).right, height:(bounds).size.height - (contentInset).top - (contentInset).bottom } };
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("bezelRectForBounds:"), function $CPButton__bezelRectForBounds_(self, _cmd, bounds)
{ with(self)
{

    if (!objj_msgSend(self, "isBordered"))
        return bounds;

    var bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset");

    return { origin: { x:(bounds).origin.x + (bezelInset).left, y:(bounds).origin.y + (bezelInset).top }, size: { width:(bounds).size.width - (bezelInset).left - (bezelInset).right, height:(bounds).size.height - (bezelInset).top - (bezelInset).bottom } };
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("_minimumFrameSize"), function $CPButton___minimumFrameSize(self, _cmd)
{ with(self)
{
    var size = CGSizeMakeZero(),
        contentView = objj_msgSend(self, "ephemeralSubviewNamed:", "content-view");

    if (contentView)
    {
        objj_msgSend(contentView, "sizeToFit");
        size = objj_msgSend(contentView, "frameSize");
    }
    else
        size = objj_msgSend((objj_msgSend(self, "title") || " "), "sizeWithFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "font"));

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
},["CGSize"]), new objj_method(sel_getUid("sizeToFit"), function $CPButton__sizeToFit(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "layoutSubviews");

    objj_msgSend(self, "setFrameSize:", objj_msgSend(self, "_minimumFrameSize"));

    if (objj_msgSend(self, "ephemeralSubviewNamed:", "content-view"))
        objj_msgSend(self, "layoutSubviews");
}
},["void"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPButton__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
        return objj_msgSend(self, "bezelRectForBounds:", objj_msgSend(self, "bounds"));

    else if (aName === "content-view")
        return objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds"));

    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
},["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPButton__createEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });

        objj_msgSend(view, "setHitTests:", NO);

        return view;
    }
    else
        return objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
}
},["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPButton__layoutSubviews(self, _cmd)
{ with(self)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");

    objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-color"));

    var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");

    if (contentView)
    {
        var title = nil,
            image = nil;

        if (_isTracking)
        {
            if (_highlightsBy & CPContentsCellMask)
            {
                if (_showsStateBy & CPContentsCellMask)
                {
                    title = (objj_msgSend(self, "state") == CPOffState && _alternateTitle) ? _alternateTitle : _title;
                    image = (objj_msgSend(self, "state") == CPOffState && objj_msgSend(self, "alternateImage")) ? objj_msgSend(self, "alternateImage") : objj_msgSend(self, "image");
                }
                else
                {
                    title = objj_msgSend(self, "alternateTitle");
                    image = objj_msgSend(self, "alternateImage");
                }
            }
            else if (_showsStateBy & CPContentsCellMask)
            {
                title = (objj_msgSend(self, "state") != CPOffState && _alternateTitle) ? _alternateTitle : _title;
                image = (objj_msgSend(self, "state") != CPOffState && objj_msgSend(self, "alternateImage")) ? objj_msgSend(self, "alternateImage") : objj_msgSend(self, "image");
            }
            else
            {
                title = _title;
                image = objj_msgSend(self, "image");
            }
        }
        else
        {
            if (_showsStateBy & CPContentsCellMask)
            {
                title = (objj_msgSend(self, "state") != CPOffState && _alternateTitle) ? _alternateTitle : _title;
                image = (objj_msgSend(self, "state") != CPOffState && objj_msgSend(self, "alternateImage")) ? objj_msgSend(self, "alternateImage") : objj_msgSend(self, "image");
            }
            else
            {
                title = _title;
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
        objj_msgSend(contentView, "setDimsImage:", objj_msgSend(self, "hasThemeState:", CPThemeStateDisabled) && _imageDimsWhenDisabled);
    }
}
},["void"]), new objj_method(sel_getUid("setBordered:"), function $CPButton__setBordered_(self, _cmd, shouldBeBordered)
{ with(self)
{
    if (shouldBeBordered)
        objj_msgSend(self, "setThemeState:", CPThemeStateBordered);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateBordered);
}
},["void","BOOL"]), new objj_method(sel_getUid("isBordered"), function $CPButton__isBordered(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateBordered);
}
},["BOOL"]), new objj_method(sel_getUid("setKeyEquivalent:"), function $CPButton__setKeyEquivalent_(self, _cmd, aString)
{ with(self)
{
    _keyEquivalent = aString || "";



    if (aString === CPNewlineCharacter || aString === CPCarriageReturnCharacter)
        objj_msgSend(self, "setThemeState:", CPThemeStateDefault);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateDefault);
}
},["void","CPString"]), new objj_method(sel_getUid("viewWillMoveToWindow:"), function $CPButton__viewWillMoveToWindow_(self, _cmd, aWindow)
{ with(self)
{
    var selfWindow = objj_msgSend(self, "window");

    if (selfWindow === aWindow || aWindow === nil)
        return;

    if (objj_msgSend(selfWindow, "defaultButton") === self)
        objj_msgSend(selfWindow, "setDefaultButton:", nil);

    if (objj_msgSend(self, "keyEquivalent") === CPNewlineCharacter || objj_msgSend(self, "keyEquivalent") === CPCarriageReturnCharacter)
        objj_msgSend(aWindow, "setDefaultButton:", self);
}
},["void","CPWindow"]), new objj_method(sel_getUid("keyEquivalent"), function $CPButton__keyEquivalent(self, _cmd)
{ with(self)
{
    return _keyEquivalent;
}
},["CPString"]), new objj_method(sel_getUid("setKeyEquivalentModifierMask:"), function $CPButton__setKeyEquivalentModifierMask_(self, _cmd, aMask)
{ with(self)
{
    _keyEquivalentModifierMask = aMask;
}
},["void","unsigned"]), new objj_method(sel_getUid("keyEquivalentModifierMask"), function $CPButton__keyEquivalentModifierMask(self, _cmd)
{ with(self)
{
    return _keyEquivalentModifierMask;
}
},["unsigned"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $CPButton__performKeyEquivalent_(self, _cmd, anEvent)
{ with(self)
{

    if (objj_msgSend(objj_msgSend(self, "window"), "defaultButton") === self)
        return NO;

    if (!objj_msgSend(anEvent, "_triggersKeyEquivalent:withModifierMask:", objj_msgSend(self, "keyEquivalent"), objj_msgSend(self, "keyEquivalentModifierMask")))
        return NO;

    objj_msgSend(self, "performClick:", nil);

    return YES;
}
},["BOOL","CPEvent"]), new objj_method(sel_getUid("performClick:"), function $CPButton__performClick_(self, _cmd, sender)
{ with(self)
{


    if (!objj_msgSend(self, "isEnabled"))
        return;

    objj_msgSend(self, "setState:", objj_msgSend(self, "nextState"));

    var shouldHighlight = NO;

    if (_highlightsBy & (CPPushInCellMask | CPChangeGrayCellMask))
    {
        if (_showsStateBy & (CPChangeGrayCellMask | CPChangeBackgroundCellMask))
            shouldHighlight = objj_msgSend(self, "state") == CPOffState;
        else
            shouldHighlight = YES;
    }

    objj_msgSend(self, "highlight:", shouldHighlight);

    try
    {
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }
    catch (e)
    {
        throw e;
    }
    finally
    {
        if (shouldHighlight)
            objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.1, self, sel_getUid("unhighlightButtonTimerDidFinish:"), nil, NO);
    }
}
},["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("buttonWithTitle:"), function $CPButton__buttonWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(self, "buttonWithTitle:theme:", aTitle, objj_msgSend(CPTheme, "defaultTheme"));
}
},["id","CPString"]), new objj_method(sel_getUid("buttonWithTitle:theme:"), function $CPButton__buttonWithTitle_theme_(self, _cmd, aTitle, aTheme)
{ with(self)
{
    var button = objj_msgSend(objj_msgSend(self, "alloc"), "init");

    objj_msgSend(button, "setTheme:", aTheme);
    objj_msgSend(button, "setTitle:", aTitle);
    objj_msgSend(button, "sizeToFit");

    return button;
}
},["id","CPString","CPTheme"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPButton__defaultThemeClass(self, _cmd)
{ with(self)
{
    return "button";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPButton__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [objj_msgSend(CPNull, "null"), 0.0, { top:(0), right:(0), bottom:(0), left:(0) }, { top:(0), right:(0), bottom:(0), left:(0) }, objj_msgSend(CPNull, "null")], ["image", "image-offset", "bezel-inset", "content-inset", "bezel-color"]);
}
},["id"])]);
}

{
var the_class = objj_getClass("CPButton")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBezelStyle:"), function $CPButton__setBezelStyle_(self, _cmd, aBezelStyle)
{ with(self)
{
    if (aBezelStyle === _bezelStyle)
        return;

    var currentState = objj_msgSend(CPButtonBezelStyleStateMap, "objectForKey:", _bezelStyle),
        newState = objj_msgSend(CPButtonBezelStyleStateMap, "objectForKey:", aBezelStyle);

    if (currentState)
        objj_msgSend(self, "unsetThemeState:", currentState);

    if (newState)
        objj_msgSend(self, "setThemeState:", newState);

    _bezelStyle = aBezelStyle;
}
},["void","unsigned"]), new objj_method(sel_getUid("bezelStyle"), function $CPButton__bezelStyle(self, _cmd)
{ with(self)
{
    return _bezelStyle;
}
},["unsigned"])]);
}


var CPButtonImageKey = "CPButtonImageKey",
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
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        objj_msgSend(self, "_init");

        _title = objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonTitleKey);
        _alternateTitle = objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonAlternateTitleKey);
        _allowsMixedState = objj_msgSend(aCoder, "decodeBoolForKey:", CPButtonAllowsMixedStateKey);

        if (objj_msgSend(aCoder, "containsValueForKey:", CPButtonHighlightsByKey))
        {

            _highlightsBy = objj_msgSend(aCoder, "decodeIntForKey:", CPButtonHighlightsByKey);
            _showsStateBy = objj_msgSend(aCoder, "decodeIntForKey:", CPButtonShowsStateByKey);
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
            _periodicDelay = objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonPeriodicDelayKey);

        if (objj_msgSend(aCoder, "containsValueForKey:", CPButtonPeriodicIntervalKey))
            _periodicInterval = objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonPeriodicIntervalKey);

        _keyEquivalentModifierMask = objj_msgSend(aCoder, "decodeIntForKey:", CPButtonKeyEquivalentMaskKey);

        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPButton__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(self, "invalidateTimers");

    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPButtonTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateTitle, CPButtonAlternateTitleKey);

    objj_msgSend(aCoder, "encodeBool:forKey:", _allowsMixedState, CPButtonAllowsMixedStateKey);

    objj_msgSend(aCoder, "encodeInt:forKey:", _highlightsBy, CPButtonHighlightsByKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _showsStateBy, CPButtonShowsStateByKey);

    objj_msgSend(aCoder, "encodeBool:forKey:", objj_msgSend(self, "imageDimsWhenDisabled"), CPButtonImageDimsWhenDisabledKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", objj_msgSend(self, "imagePosition"), CPButtonImagePositionKey);

    if (_keyEquivalent)
        objj_msgSend(aCoder, "encodeObject:forKey:", CFData.encodeBase64Utf16String(_keyEquivalent), CPButtonKeyEquivalentKey);

    objj_msgSend(aCoder, "encodeInt:forKey:", _keyEquivalentModifierMask, CPButtonKeyEquivalentMaskKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _periodicDelay, CPButtonPeriodicDelayKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _periodicInterval, CPButtonPeriodicIntervalKey);
}
},["void","CPCoder"])]);
}

objj_executeFile("CPCheckBox.j", YES);
objj_executeFile("CPRadio.j", YES);

