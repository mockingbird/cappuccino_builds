@STATIC;1.0;i;12;CGGeometry.ji;13;CPImageView.ji;8;CPView.ji;20;CPWindow_Constants.jt;16513;objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow_Constants.j", YES);CPProgressIndicatorBarStyle = 0;
CPProgressIndicatorSpinningStyle = 1;
CPProgressIndicatorHUDBarStyle = 2;
var CPProgressIndicatorSpinningStyleColors = [];
{var the_class = objj_allocateClassPair(CPView, "CPProgressIndicator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_doubleValue"), new objj_ivar("_controlSize"), new objj_ivar("_indeterminate"), new objj_ivar("_style"), new objj_ivar("_isAnimating"), new objj_ivar("_isDisplayedWhenStoppedSet"), new objj_ivar("_isDisplayedWhenStopped")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPProgressIndicator__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPProgressIndicator").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._minValue = 0.0;
        self._maxValue = 100.0;
        self._doubleValue = 0.0;
        self._style = CPProgressIndicatorBarStyle;
        self._isDisplayedWhenStoppedSet = NO;
        self._controlSize = CPRegularControlSize;
        objj_msgSend(self, "setNeedsLayout");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setUsesThreadedAnimation:"), function $CPProgressIndicator__setUsesThreadedAnimation_(self, _cmd, aFlag)
{
}
,["void","BOOL"]), new objj_method(sel_getUid("startAnimation:"), function $CPProgressIndicator__startAnimation_(self, _cmd, aSender)
{
    self._isAnimating = YES;
    objj_msgSend(self, "_hideOrDisplay");
}
,["void","id"]), new objj_method(sel_getUid("stopAnimation:"), function $CPProgressIndicator__stopAnimation_(self, _cmd, aSender)
{
    self._isAnimating = NO;
    objj_msgSend(self, "_hideOrDisplay");
}
,["void","id"]), new objj_method(sel_getUid("usesThreadedAnimation"), function $CPProgressIndicator__usesThreadedAnimation(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("incrementBy:"), function $CPProgressIndicator__incrementBy_(self, _cmd, aValue)
{
    objj_msgSend(self, "setDoubleValue:", self._doubleValue + aValue);
}
,["void","double"]), new objj_method(sel_getUid("setDoubleValue:"), function $CPProgressIndicator__setDoubleValue_(self, _cmd, aValue)
{
    self._doubleValue = MIN(MAX(aValue, self._minValue), self._maxValue);
    objj_msgSend(self, "drawBar");
}
,["void","double"]), new objj_method(sel_getUid("doubleValue"), function $CPProgressIndicator__doubleValue(self, _cmd)
{
    return self._doubleValue;
}
,["double"]), new objj_method(sel_getUid("setMinValue:"), function $CPProgressIndicator__setMinValue_(self, _cmd, aValue)
{
    self._minValue = aValue;
}
,["void","double"]), new objj_method(sel_getUid("minValue"), function $CPProgressIndicator__minValue(self, _cmd)
{
    return self._minValue;
}
,["double"]), new objj_method(sel_getUid("setMaxValue:"), function $CPProgressIndicator__setMaxValue_(self, _cmd, aValue)
{
    self._maxValue = aValue;
}
,["void","double"]), new objj_method(sel_getUid("maxValue"), function $CPProgressIndicator__maxValue(self, _cmd)
{
    return self._maxValue;
}
,["double"]), new objj_method(sel_getUid("setControlSize:"), function $CPProgressIndicator__setControlSize_(self, _cmd, aControlSize)
{
    if (self._controlSize == aControlSize)
        return;
    self._controlSize = aControlSize;
    objj_msgSend(self, "updateBackgroundColor");
}
,["void","CPControlSize"]), new objj_method(sel_getUid("controlSize"), function $CPProgressIndicator__controlSize(self, _cmd)
{
    return self._controlSize;
}
,["CPControlSize"]), new objj_method(sel_getUid("setControlTint:"), function $CPProgressIndicator__setControlTint_(self, _cmd, aControlTint)
{
}
,["void","CPControlTint"]), new objj_method(sel_getUid("controlTint"), function $CPProgressIndicator__controlTint(self, _cmd)
{
    return 0;
}
,["CPControlTint"]), new objj_method(sel_getUid("setBezeled:"), function $CPProgressIndicator__setBezeled_(self, _cmd, isBezeled)
{
}
,["void","BOOL"]), new objj_method(sel_getUid("isBezeled"), function $CPProgressIndicator__isBezeled(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("setIndeterminate:"), function $CPProgressIndicator__setIndeterminate_(self, _cmd, indeterminate)
{
    if (self._indeterminate == indeterminate)
        return;
    self._indeterminate = indeterminate;
    objj_msgSend(self, "updateBackgroundColor");
}
,["void","BOOL"]), new objj_method(sel_getUid("isIndeterminate"), function $CPProgressIndicator__isIndeterminate(self, _cmd)
{
    return self._indeterminate;
}
,["BOOL"]), new objj_method(sel_getUid("setStyle:"), function $CPProgressIndicator__setStyle_(self, _cmd, aStyle)
{
    if (self._style == aStyle)
        return;
    self._style = aStyle;
    objj_msgSend(self, "setTheme:", self._style === CPProgressIndicatorHUDBarStyle ? objj_msgSend(CPTheme, "defaultHudTheme") : objj_msgSend(CPTheme, "defaultTheme"));
    objj_msgSend(self, "updateBackgroundColor");
}
,["void","CPProgressIndicatorStyle"]), new objj_method(sel_getUid("sizeToFit"), function $CPProgressIndicator__sizeToFit(self, _cmd)
{
    if (self._style == CPProgressIndicatorSpinningStyle)
        objj_msgSend(self, "setFrameSize:", objj_msgSend(objj_msgSend(CPProgressIndicatorSpinningStyleColors[self._controlSize], "patternImage"), "size"));
    else
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), objj_msgSend(self, "valueForThemeAttribute:", "default-height")));
}
,["void"]), new objj_method(sel_getUid("setDisplayedWhenStopped:"), function $CPProgressIndicator__setDisplayedWhenStopped_(self, _cmd, isDisplayedWhenStopped)
{
    if (self._isDisplayedWhenStoppedSet && self._isDisplayedWhenStopped == isDisplayedWhenStopped)
        return;
    self._isDisplayedWhenStoppedSet = YES;
    self._isDisplayedWhenStopped = isDisplayedWhenStopped;
    objj_msgSend(self, "_hideOrDisplay");
}
,["void","BOOL"]), new objj_method(sel_getUid("isDisplayedWhenStopped"), function $CPProgressIndicator__isDisplayedWhenStopped(self, _cmd)
{
    if (self._isDisplayedWhenStoppedSet)
        return self._isDisplayedWhenStopped;
    if (self._style == CPProgressIndicatorBarStyle || self._style == CPProgressIndicatorHUDBarStyle)
        return YES;
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("_hideOrDisplay"), function $CPProgressIndicator___hideOrDisplay(self, _cmd)
{
    objj_msgSend(self, "setHidden:", !self._isAnimating && !objj_msgSend(self, "isDisplayedWhenStopped"));
}
,["void"]), new objj_method(sel_getUid("setFrameSize:"), function $CPProgressIndicator__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPProgressIndicator").super_class }, "setFrameSize:", aSize);
    objj_msgSend(self, "drawBar");
}
,["void","CGSize"]), new objj_method(sel_getUid("drawBar"), function $CPProgressIndicator__drawBar(self, _cmd)
{
    objj_msgSend(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPProgressIndicator__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    return objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
}
,["CPView","CPString"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPProgressIndicator__rectForEphemeralSubviewNamed_(self, _cmd, aViewName)
{
    if (aViewName === "bar-view" && self._style !== CPProgressIndicatorSpinningStyle)
    {
        var width = CGRectGetWidth(objj_msgSend(self, "bounds")),
            barWidth = width * ((self._doubleValue - self._minValue) / (self._maxValue - self._minValue));
        if (barWidth > 0.0 && barWidth < 4.0)
            barWidth = 4.0;
        if (self._indeterminate)
            barWidth = width;
        return CGRectMake(0, 0, barWidth, objj_msgSend(self, "valueForThemeAttribute:", "default-height"));
    }
    return nil;
}
,["CGRect","CPString"]), new objj_method(sel_getUid("updateBackgroundColor"), function $CPProgressIndicator__updateBackgroundColor(self, _cmd)
{
    if (objj_msgSend(CPProgressIndicatorSpinningStyleColors, "count") === 0)
    {
        CPProgressIndicatorSpinningStyleColors[CPMiniControlSize] = objj_msgSend(self, "valueForThemeAttribute:", "spinning-mini-gif");
        CPProgressIndicatorSpinningStyleColors[CPSmallControlSize] = objj_msgSend(self, "valueForThemeAttribute:", "spinning-small-gif");
        CPProgressIndicatorSpinningStyleColors[CPRegularControlSize] = objj_msgSend(self, "valueForThemeAttribute:", "spinning-regular-gif");
    }
    objj_msgSend(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $CPProgressIndicator__layoutSubviews(self, _cmd)
{
    if (YES)
    {
        if (self._style == CPProgressIndicatorSpinningStyle)
        {
            objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bar-view", CPWindowBelow, nil);
            objj_msgSend(self, "setBackgroundColor:", CPProgressIndicatorSpinningStyleColors[self._controlSize]);
        }
        else
        {
            objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-color"));
            var barView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bar-view", CPWindowBelow, nil);
            if (self._indeterminate)
                objj_msgSend(barView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "indeterminate-bar-color"));
            else
                objj_msgSend(barView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bar-color"));
        }
    }
    else
        objj_msgSend(self, "setBackgroundColor:", nil);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPProgressIndicator__defaultThemeClass(self, _cmd)
{
    return "progress-indicator";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPProgressIndicator__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "indeterminate-bar-color", objj_msgSend(CPNull, "null"), "bar-color", 20, "default-height", objj_msgSend(CPNull, "null"), "bezel-color", objj_msgSend(CPNull, "null"), "spinning-mini-gif", objj_msgSend(CPNull, "null"), "spinning-small-gif", objj_msgSend(CPNull, "null"), "spinning-regular-gif");
}
,["CPDictionary"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPProgressIndicator___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPValueBinding || aBinding === "isIndeterminate")
        return objj_msgSend(_CPProgressIndicatorBinder, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPProgressIndicator").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}{
var the_class = objj_getClass("CPProgressIndicator")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPProgressIndicator\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPProgressIndicator__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPProgressIndicator").super_class }, "initWithCoder:", aCoder))
    {
        self._minValue = objj_msgSend(aCoder, "decodeObjectForKey:", "_minValue");
        self._maxValue = objj_msgSend(aCoder, "decodeObjectForKey:", "_maxValue");
        self._doubleValue = objj_msgSend(aCoder, "decodeObjectForKey:", "_doubleValue");
        self._controlSize = objj_msgSend(aCoder, "decodeObjectForKey:", "_controlSize");
        self._indeterminate = objj_msgSend(aCoder, "decodeObjectForKey:", "_indeterminate");
        self._style = objj_msgSend(aCoder, "decodeIntForKey:", "_style");
        self._isAnimating = objj_msgSend(aCoder, "decodeObjectForKey:", "_isAnimating");
        self._isDisplayedWhenStoppedSet = objj_msgSend(aCoder, "decodeObjectForKey:", "_isDisplayedWhenStoppedSet");
        self._isDisplayedWhenStopped = objj_msgSend(aCoder, "decodeObjectForKey:", "_isDisplayedWhenStopped");
        objj_msgSend(self, "updateBackgroundColor");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPProgressIndicator__encodeWithCoder_(self, _cmd, aCoder)
{
    var backgroundColor = objj_msgSend(self, "backgroundColor");
    objj_msgSend(self, "setBackgroundColor:", nil);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPProgressIndicator").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(self, "setBackgroundColor:", backgroundColor);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._minValue, "_minValue");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._maxValue, "_maxValue");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._doubleValue, "_doubleValue");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._controlSize, "_controlSize");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._indeterminate, "_indeterminate");
    objj_msgSend(aCoder, "encodeInt:forKey:", self._style, "_style");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._isAnimating, "_isAnimating");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._isDisplayedWhenStoppedSet, "_isDisplayedWhenStoppedSet");
    objj_msgSend(aCoder, "encodeObject:forKey:", self._isDisplayedWhenStopped, "_isDisplayedWhenStopped");
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPProgressIndicatorBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:forBinding:"), function $_CPProgressIndicatorBinder___updatePlaceholdersWithOptions_forBinding_(self, _cmd, options, aBinding)
{
    var value = aBinding === CPValueBinding ? 0.0 : YES;
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", value, CPMultipleValuesMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", value, CPNoSelectionMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", value, CPNotApplicableMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", value, CPNullMarker, YES);
}
,["void","CPDictionary","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPProgressIndicatorBinder__valueForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPValueBinding)
        return objj_msgSend(self._source, "doubleValue");
    else if (aBinding === "isIndeterminate")
        objj_msgSend(self._source, "isIndeterminate");
    else
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPProgressIndicatorBinder").super_class }, "valueForBinding:", aBinding);
}
,["id","CPString"]), new objj_method(sel_getUid("_setValue:forBinding:"), function $_CPProgressIndicatorBinder___setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    if (aBinding === CPValueBinding)
        objj_msgSend(self._source, "setDoubleValue:", aValue);
    else if (aBinding === "isIndeterminate")
        objj_msgSend(self._source, "setIndeterminate:", aValue);
    else
        return NO;
    return YES;
}
,["BOOL","id","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $_CPProgressIndicatorBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    if (!objj_msgSend(self, "_setValue:forBinding:", aValue, aBinding))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPProgressIndicatorBinder").super_class }, "setValue:forBinding:", aValue, aBinding);
}
,["void","id","CPString"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPProgressIndicatorBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    if (!objj_msgSend(self, "_setValue:forBinding:", aValue, aBinding))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPProgressIndicatorBinder").super_class }, "setPlaceholderValue:withMarker:forBinding:", aValue, aMarker, aBinding);
}
,["void","id","CPString","CPString"])]);
}