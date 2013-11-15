@STATIC;1.0;I;21;Foundation/CPString.ji;8;CPView.ji;9;CPColor.ji;14;CPColorPanel.jt;12265;objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPView.j", YES);objj_executeFile("CPColor.j", YES);objj_executeFile("CPColorPanel.j", YES);var _CPColorWellDidBecomeExclusiveNotification = "_CPColorWellDidBecomeExclusiveNotification";
{var the_class = objj_allocateClassPair(CPControl, "CPColorWell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_active"), new objj_ivar("_bordered"), new objj_ivar("_color")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_reverseSetBinding"), function $CPColorWell___reverseSetBinding(self, _cmd)
{
    var binderClass = objj_msgSend(objj_msgSend(self, "class"), "_binderClassForBinding:", CPValueBinding),
        theBinding = objj_msgSend(binderClass, "getBinding:forObject:", CPValueBinding, self);
    objj_msgSend(theBinding, "reverseSetValueFor:", "color");
}
,["void"]), new objj_method(sel_getUid("initWithFrame:"), function $CPColorWell__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._active = NO;
        self._color = objj_msgSend(CPColor, "whiteColor");
        objj_msgSend(self, "setBordered:", YES);
        objj_msgSend(self, "_registerForNotifications");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_registerForNotifications"), function $CPColorWell___registerForNotifications(self, _cmd)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("colorWellDidBecomeExclusive:"), _CPColorWellDidBecomeExclusiveNotification, nil);
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("colorPanelWillClose:"), CPWindowWillCloseNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
,["void"]), new objj_method(sel_getUid("setBordered:"), function $CPColorWell__setBordered_(self, _cmd, shouldBeBordered)
{
    if (shouldBeBordered)
        objj_msgSend(self, "setThemeState:", CPThemeStateBordered);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateBordered);
}
,["void","BOOL"]), new objj_method(sel_getUid("isBordered"), function $CPColorWell__isBordered(self, _cmd)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateBordered);
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
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPColor"]), new objj_method(sel_getUid("takeColorFrom:"), function $CPColorWell__takeColorFrom_(self, _cmd, aSender)
{
    objj_msgSend(self, "setColor:", objj_msgSend(aSender, "color"));
}
,["void","id"]), new objj_method(sel_getUid("activate:"), function $CPColorWell__activate_(self, _cmd, shouldBeExclusive)
{
    if (shouldBeExclusive)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", _CPColorWellDidBecomeExclusiveNotification, self);
    if (objj_msgSend(self, "isActive"))
        return;
    self._active = YES;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("colorPanelDidChangeColor:"), CPColorPanelColorDidChangeNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
,["void","BOOL"]), new objj_method(sel_getUid("deactivate"), function $CPColorWell__deactivate(self, _cmd)
{
    if (!objj_msgSend(self, "isActive"))
        return;
    self._active = NO;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPColorPanelColorDidChangeNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
,["void"]), new objj_method(sel_getUid("isActive"), function $CPColorWell__isActive(self, _cmd)
{
    return self._active;
}
,["BOOL"]), new objj_method(sel_getUid("colorPanelDidChangeColor:"), function $CPColorWell__colorPanelDidChangeColor_(self, _cmd, aNotification)
{
    objj_msgSend(self, "takeColorFrom:", objj_msgSend(aNotification, "object"));
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
,["void","CPNotification"]), new objj_method(sel_getUid("colorWellDidBecomeExclusive:"), function $CPColorWell__colorWellDidBecomeExclusive_(self, _cmd, aNotification)
{
    if (self != objj_msgSend(aNotification, "object"))
        objj_msgSend(self, "deactivate");
}
,["void","CPNotification"]), new objj_method(sel_getUid("colorPanelWillClose:"), function $CPColorWell__colorPanelWillClose_(self, _cmd, aNotification)
{
    objj_msgSend(self, "deactivate");
}
,["void","CPNotification"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPColorWell__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{
    objj_msgSend(self, "highlight:", NO);
    if (!mouseIsUp || !CGRectContainsPoint(objj_msgSend(self, "bounds"), aPoint) || !objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "activate:", YES);
    var colorPanel = objj_msgSend(CPColorPanel, "sharedColorPanel");
    objj_msgSend(colorPanel, "setColor:", self._color);
    objj_msgSend(colorPanel, "orderFront:", self);
}
,["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPColorWell__contentRectForBounds_(self, _cmd, bounds)
{
    var contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset");
    return CGRectInsetByInset(bounds, contentInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("bezelRectForBounds:"), function $CPColorWell__bezelRectForBounds_(self, _cmd, bounds)
{
    var bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset");
    return CGRectInsetByInset(bounds, bezelInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("contentBorderRectForBounds:"), function $CPColorWell__contentBorderRectForBounds_(self, _cmd, bounds)
{
    var contentBorderInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-border-inset");
    return CGRectInsetByInset(bounds, contentBorderInset);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPColorWell__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    switch(aName) {
    case "bezel-view":
        return objj_msgSend(self, "bezelRectForBounds:", objj_msgSend(self, "bounds"));
    case "content-view":
        return objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds"));
    case "content-border-view":
        return objj_msgSend(self, "contentBorderRectForBounds:", objj_msgSend(self, "bounds"));
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPColorWell__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(view, "setHitTests:", NO);
    return view;
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPColorWell__layoutSubviews(self, _cmd)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-color"));
    var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    objj_msgSend(contentView, "setBackgroundColor:", self._color);
    var contentBorderView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-border-view", CPWindowAbove, "content-view");
    objj_msgSend(contentBorderView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "content-border-color"));
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPColorWell___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding == CPValueBinding)
        return objj_msgSend(CPColorWellValueBinder, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPColorWell").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPColorWell__defaultThemeClass(self, _cmd)
{
    return "colorwell";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPColorWell__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CGInsetMakeZero(), "bezel-inset", objj_msgSend(CPNull, "null"), "bezel-color", CGInsetMake(3.0, 3.0, 3.0, 3.0), "content-inset", CGInsetMakeZero(), "content-border-inset", objj_msgSend(CPNull, "null"), "content-border-color");
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "CPColorWellValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $CPColorWellValueBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{
    var placeholderColor = objj_msgSend(CPColor, "blackColor");
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", placeholderColor, CPMultipleValuesMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", placeholderColor, CPNoSelectionMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", placeholderColor, CPNotApplicableMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", placeholderColor, CPNullMarker, YES);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("valueForBinding:"), function $CPColorWellValueBinder__valueForBinding_(self, _cmd, aBinding)
{
    return objj_msgSend(self._source, "color");
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $CPColorWellValueBinder__setValue_forBinding_(self, _cmd, aValue, theBinding)
{
    objj_msgSend(self._source, "setColor:", aValue);
}
,["void","id","CPString"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $CPColorWellValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    objj_msgSend(self._source, "setColor:", aValue);
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
        self._color = objj_msgSend(aCoder, "decodeObjectForKey:", CPColorWellColorKey);
        objj_msgSend(self, "setBordered:", objj_msgSend(aCoder, "decodeBoolForKey:", CPColorWellBorderedKey));
        objj_msgSend(self, "_registerForNotifications");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPColorWell__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._color, CPColorWellColorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "isBordered"), CPColorWellBorderedKey);
}
,["void","CPCoder"])]);
}