@STATIC;1.0;I;21;Foundation/CPString.ji;8;CPView.ji;9;CPColor.ji;14;CPColorPanel.jt;15476;objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPView.j", YES);objj_executeFile("CPColor.j", YES);objj_executeFile("CPColorPanel.j", YES);var _CPColorWellDidBecomeExclusiveNotification = "_CPColorWellDidBecomeExclusiveNotification";
{var the_class = objj_allocateClassPair(CPControl, "CPColorWell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_active"), new objj_ivar("_bordered"), new objj_ivar("_color")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_reverseSetBinding"), function $CPColorWell___reverseSetBinding(self, _cmd)
{
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", CPValueBinding)),
        theBinding = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", CPValueBinding, self));
    (theBinding == null ? null : theBinding.isa.objj_msgSend1(theBinding, "reverseSetValueFor:", "color"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("initWithFrame:"), function $CPColorWell__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._active = NO;
        self._color = CPColor.isa.objj_msgSend0(CPColor, "whiteColor");
        (self == null ? null : self.isa.objj_msgSend1(self, "setBordered:", YES));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_registerNotifications"), function $CPColorWell___registerNotifications(self, _cmd)
{
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("colorWellDidBecomeExclusive:"), _CPColorWellDidBecomeExclusiveNotification, nil));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("colorPanelWillClose:"), CPWindowWillCloseNotification, CPColorPanel.isa.objj_msgSend0(CPColorPanel, "sharedColorPanel")));
}
,["void"]), new objj_method(sel_getUid("_removeNotifications"), function $CPColorWell___removeNotifications(self, _cmd)
{
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, _CPColorWellDidBecomeExclusiveNotification, nil));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPWindowWillCloseNotification, CPColorPanel.isa.objj_msgSend0(CPColorPanel, "sharedColorPanel")));
}
,["void"]), new objj_method(sel_getUid("setBordered:"), function $CPColorWell__setBordered_(self, _cmd, shouldBeBordered)
{
    if (shouldBeBordered)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateBordered);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateBordered);
}
,["void","BOOL"]), new objj_method(sel_getUid("isBordered"), function $CPColorWell__isBordered(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateBordered);
}
,["BOOL"]), new objj_method(sel_getUid("color"), function $CPColorWell__color(self, _cmd)
{
    return self._color;
}
,["CPColor"]), new objj_method(sel_getUid("setColor:"), function $CPColorWell__setColor_(self, _cmd, aColor)
{
    if (self._color == aColor)
        return;
    self._color = aColor;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("takeColorFrom:"), function $CPColorWell__takeColorFrom_(self, _cmd, aSender)
{
    self.isa.objj_msgSend1(self, "setColor:", (aSender == null ? null : aSender.isa.objj_msgSend0(aSender, "color")));
}
,["void","id"]), new objj_method(sel_getUid("activate:"), function $CPColorWell__activate_(self, _cmd, shouldBeExclusive)
{
    if (shouldBeExclusive)
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", _CPColorWellDidBecomeExclusiveNotification, self));
    if (self.isa.objj_msgSend0(self, "isActive"))
        return;
    self._active = YES;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("colorPanelDidChangeColor:"), CPColorPanelColorDidChangeNotification, CPColorPanel.isa.objj_msgSend0(CPColorPanel, "sharedColorPanel")));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("deactivate"), function $CPColorWell__deactivate(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "isActive"))
        return;
    self._active = NO;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, CPColorPanelColorDidChangeNotification, CPColorPanel.isa.objj_msgSend0(CPColorPanel, "sharedColorPanel")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("isActive"), function $CPColorWell__isActive(self, _cmd)
{
    return self._active;
}
,["BOOL"]), new objj_method(sel_getUid("colorPanelDidChangeColor:"), function $CPColorWell__colorPanelDidChangeColor_(self, _cmd, aNotification)
{
    self.isa.objj_msgSend1(self, "takeColorFrom:", (aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "object")));
    self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
}
,["void","CPNotification"]), new objj_method(sel_getUid("colorWellDidBecomeExclusive:"), function $CPColorWell__colorWellDidBecomeExclusive_(self, _cmd, aNotification)
{
    if (self != (aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "object")))
        self.isa.objj_msgSend0(self, "deactivate");
}
,["void","CPNotification"]), new objj_method(sel_getUid("colorPanelWillClose:"), function $CPColorWell__colorPanelWillClose_(self, _cmd, aNotification)
{
    self.isa.objj_msgSend0(self, "deactivate");
}
,["void","CPNotification"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPColorWell__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{
    self.isa.objj_msgSend1(self, "highlight:", NO);
    if (!mouseIsUp || !CGRectContainsPoint(self.isa.objj_msgSend0(self, "bounds"), aPoint) || !self.isa.objj_msgSend0(self, "isEnabled"))
        return;
    self.isa.objj_msgSend1(self, "activate:", YES);
    var colorPanel = CPColorPanel.isa.objj_msgSend0(CPColorPanel, "sharedColorPanel");
    (colorPanel == null ? null : colorPanel.isa.objj_msgSend1(colorPanel, "setColor:", self._color));
    (colorPanel == null ? null : colorPanel.isa.objj_msgSend1(colorPanel, "orderFront:", self));
}
,["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPColorWell__contentRectForBounds_(self, _cmd, bounds)
{
    var contentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset");
    return CGRectInsetByInset(bounds, contentInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("bezelRectForBounds:"), function $CPColorWell__bezelRectForBounds_(self, _cmd, bounds)
{
    var bezelInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-inset");
    return CGRectInsetByInset(bounds, bezelInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("contentBorderRectForBounds:"), function $CPColorWell__contentBorderRectForBounds_(self, _cmd, bounds)
{
    var contentBorderInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-border-inset");
    return CGRectInsetByInset(bounds, contentBorderInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPColorWell__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    switch(aName) {
    case "bezel-view":
        return self.isa.objj_msgSend1(self, "bezelRectForBounds:", self.isa.objj_msgSend0(self, "bounds"));
    case "content-view":
        return self.isa.objj_msgSend1(self, "contentRectForBounds:", self.isa.objj_msgSend0(self, "bounds"));
    case "content-border-view":
        return self.isa.objj_msgSend1(self, "contentBorderRectForBounds:", self.isa.objj_msgSend0(self, "bounds"));
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPColorWell__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    var view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (view == null ? null : view.isa.objj_msgSend1(view, "setHitTests:", NO));
    return view;
    var ___r1;
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPColorWell__layoutSubviews(self, _cmd)
{
    var bezelView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    (bezelView == null ? null : bezelView.isa.objj_msgSend1(bezelView, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-color")));
    var contentView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setBackgroundColor:", self._color));
    var contentBorderView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-border-view", CPWindowAbove, "content-view");
    (contentBorderView == null ? null : contentBorderView.isa.objj_msgSend1(contentBorderView, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-border-color")));
}
,["void"]), new objj_method(sel_getUid("_addObservers"), function $CPColorWell___addObservers(self, _cmd)
{
    if (self._isObserving)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "_addObservers");
    self.isa.objj_msgSend0(self, "_registerNotifications");
}
,["void"]), new objj_method(sel_getUid("_removeObservers"), function $CPColorWell___removeObservers(self, _cmd)
{
    if (!self._isObserving)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "_removeObservers");
    self.isa.objj_msgSend0(self, "_removeNotifications");
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPColorWell___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding == CPValueBinding)
        return (CPColorWellValueBinder == null ? null : CPColorWellValueBinder.isa.objj_msgSend0(CPColorWellValueBinder, "class"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPColorWell").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPColorWell__defaultThemeClass(self, _cmd)
{
    return "colorwell";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPColorWell__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CGInsetMakeZero(), "bezel-inset", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-color", CGInsetMake(3.0, 3.0, 3.0, 3.0), "content-inset", CGInsetMakeZero(), "content-border-inset", CPNull.isa.objj_msgSend0(CPNull, "null"), "content-border-color");
}
,["CPDictionary"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "CPColorWellValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $CPColorWellValueBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{
    var placeholderColor = CPColor.isa.objj_msgSend0(CPColor, "blackColor");
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", placeholderColor, CPMultipleValuesMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", placeholderColor, CPNoSelectionMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", placeholderColor, CPNotApplicableMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", placeholderColor, CPNullMarker, YES);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("valueForBinding:"), function $CPColorWellValueBinder__valueForBinding_(self, _cmd, aBinding)
{
    return ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "color"));
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $CPColorWellValueBinder__setValue_forBinding_(self, _cmd, aValue, theBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColor:", aValue));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $CPColorWellValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColor:", aValue));
    var ___r1;
}
,["void","id","CPString","CPString"])]);
}var CPColorWellColorKey = "CPColorWellColorKey",
    CPColorWellBorderedKey = "CPColorWellBorderedKey";
{
var the_class = objj_getClass("CPColorWell")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPColorWell\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPColorWell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._active = NO;
        self._color = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPColorWellColorKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBordered:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPColorWellBorderedKey))));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPColorWell__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._color, CPColorWellColorKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "isBordered"), CPColorWellBorderedKey));
}
,["void","CPCoder"])]);
}