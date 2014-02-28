@STATIC;1.0;i;14;CPBezierPath.ji;15;CPPopUpButton.jt;7225;objj_executeFile("CPBezierPath.j", YES);objj_executeFile("CPPopUpButton.j", YES);var GRADIENT_START_COLOR = "#fcfcfc",
    GRADIENT_END_COLOR = "#dfdfdf",
    BORDER_COLOR = "#BDBDBD";
var GRADIENT_NORMAL,
    GRADIENT_HIGHLIGHTED,
    GRADIENT_PROPERTY;
if (CPBrowserIsEngine(CPWebKitBrowserEngine))
{
    (GRADIENT_NORMAL = "-webkit-gradient(linear, left top, left bottom, from(" + GRADIENT_START_COLOR + "), to(" + GRADIENT_END_COLOR + "))", GRADIENT_HIGHLIGHTED = "-webkit-gradient(linear, left top, left bottom, from(" + GRADIENT_END_COLOR + "), to(" + GRADIENT_START_COLOR + "))");
    GRADIENT_PROPERTY = "background";
}else if (CPBrowserIsEngine(CPGeckoBrowserEngine))
{
    (GRADIENT_NORMAL = "-moz-linear-gradient(top, " + GRADIENT_START_COLOR + ", " + GRADIENT_END_COLOR + ")", GRADIENT_HIGHLIGHTED = "-moz-linear-gradient(top, " + GRADIENT_END_COLOR + ", " + GRADIENT_START_COLOR + ")");
    GRADIENT_PROPERTY = "background";
}else if (CPBrowserIsEngine(CPInternetExplorerBrowserEngine))
{
    GRADIENT_NORMAL = "progid:DXImageTransform.Microsoft.gradient(startColorstr='" + GRADIENT_START_COLOR + "', endColorstr='" + GRADIENT_END_COLOR + "')";
    GRADIENT_HIGHLIGHTED = "progid:DXImageTransform.Microsoft.gradient(startColorstr='" + GRADIENT_END_COLOR + "', endColorstr='" + GRADIENT_START_COLOR + "')";
    GRADIENT_PROPERTY = "filter";
}else
{
    GRADIENT_NORMAL = GRADIENT_START_COLOR;
    GRADIENT_HIGHLIGHTED = GRADIENT_END_COLOR;
    GRADIENT_PROPERTY = "background";
}{var the_class = objj_allocateClassPair(CPPopUpButton, "_CPRuleEditorPopUpButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("radius")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_sharedInit"), function $_CPRuleEditorPopUpButton___sharedInit(self, _cmd)
{
    objj_msgSend(self, "setBordered:", NO);
    var style = self._DOMElement.style;
    style.border = "1px solid " + BORDER_COLOR;
    style[GRADIENT_PROPERTY] = GRADIENT_NORMAL;
}
,["void"]), new objj_method(sel_getUid("initWithFrame:"), function $_CPRuleEditorPopUpButton__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorPopUpButton").super_class }, "initWithFrame:", aFrame))
        objj_msgSend(self, "_sharedInit");
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPRuleEditorPopUpButton__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorPopUpButton").super_class }, "initWithCoder:", aCoder);
    objj_msgSend(self, "_sharedInit");
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("hitTest:"), function $_CPRuleEditorPopUpButton__hitTest_(self, _cmd, point)
{
    if (!CGRectContainsPoint(objj_msgSend(self, "frame"), point) || !objj_msgSend(self, "sliceIsEditable"))
        return nil;
    return self;
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("sliceIsEditable"), function $_CPRuleEditorPopUpButton__sliceIsEditable(self, _cmd)
{
    var superview = objj_msgSend(self, "superview");
    return !objj_msgSend(superview, "isKindOfClass:", [_CPRuleEditorViewSlice]) || objj_msgSend(superview, "isEditable");
}
,["BOOL"]), new objj_method(sel_getUid("trackMouse:"), function $_CPRuleEditorPopUpButton__trackMouse_(self, _cmd, theEvent)
{
    if (!objj_msgSend(self, "sliceIsEditable"))
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorPopUpButton").super_class }, "trackMouse:", theEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("contentRectForBounds:"), function $_CPRuleEditorPopUpButton__contentRectForBounds_(self, _cmd, bounds)
{
    var contentRect = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorPopUpButton").super_class }, "contentRectForBounds:", bounds);
    contentRect.origin.x += self.radius;
    contentRect.size.width -= 2 * self.radius;
    return contentRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPRuleEditorPopUpButton__layoutSubviews(self, _cmd)
{
    self.radius = FLOOR(CGRectGetHeight(objj_msgSend(self, "bounds")) / 2);
    var style = self._DOMElement.style,
        radiusCSS = self.radius + "px";
    style.borderRadius = radiusCSS;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorPopUpButton").super_class }, "layoutSubviews");
}
,["void"]), new objj_method(sel_getUid("drawRect:"), function $_CPRuleEditorPopUpButton__drawRect_(self, _cmd, aRect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        bounds = objj_msgSend(self, "bounds"),
        arrow_width = FLOOR(CGRectGetHeight(bounds) / 3.5);
    CGContextTranslateCTM(context, CGRectGetWidth(bounds) - self.radius - arrow_width, CGRectGetHeight(bounds) / 2);
    var arrowsPath = objj_msgSend(CPBezierPath, "bezierPath");
    objj_msgSend(arrowsPath, "moveToPoint:", CGPointMake(0, 1));
    objj_msgSend(arrowsPath, "lineToPoint:", CGPointMake(arrow_width, 1));
    objj_msgSend(arrowsPath, "lineToPoint:", CGPointMake(arrow_width / 2, arrow_width + 1));
    objj_msgSend(arrowsPath, "closePath");
    CGContextSetFillColor(context, objj_msgSend(CPColor, "colorWithWhite:alpha:", 101 / 255, 1));
    objj_msgSend(arrowsPath, "fill");
    CGContextScaleCTM(context, 1, -1);
    objj_msgSend(arrowsPath, "fill");
}
,["void","CGRect"])]);
}{var the_class = objj_allocateClassPair(CPButton, "_CPRuleEditorButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("radius")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_sharedInit"), function $_CPRuleEditorButton___sharedInit(self, _cmd)
{
    objj_msgSend(self, "setBordered:", NO);
    var style = self._DOMElement.style;
    style.border = "1px solid " + BORDER_COLOR;
    style[GRADIENT_PROPERTY] = GRADIENT_NORMAL;
}
,["void"]), new objj_method(sel_getUid("initWithFrame:"), function $_CPRuleEditorButton__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorButton").super_class }, "initWithFrame:", aFrame))
        objj_msgSend(self, "_sharedInit");
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPRuleEditorButton__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorButton").super_class }, "initWithCoder:", aCoder);
    objj_msgSend(self, "_sharedInit");
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPRuleEditorButton__layoutSubviews(self, _cmd)
{
    self.radius = FLOOR(CGRectGetHeight(objj_msgSend(self, "bounds")) / 2);
    var style = self._DOMElement.style,
        radiusCSS = self.radius + "px";
    style.borderRadius = radiusCSS;
    style[GRADIENT_PROPERTY] = objj_msgSend(self, "isHighlighted") ? GRADIENT_HIGHLIGHTED : GRADIENT_NORMAL;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorButton").super_class }, "layoutSubviews");
}
,["void"])]);
}