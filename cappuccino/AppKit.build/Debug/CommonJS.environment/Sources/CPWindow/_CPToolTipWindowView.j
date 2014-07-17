@STATIC;1.0;i;15;_CPWindowView.jt;3868;objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPWindowView, "_CPToolTipWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_mouseDownPressed"), new objj_ivar("_gravity")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isMouseDownPressed"), function $_CPToolTipWindowView__isMouseDownPressed(self, _cmd)
{
    return self._mouseDownPressed;
}
,["BOOL"]), new objj_method(sel_getUid("setMouseDownPressed:"), function $_CPToolTipWindowView__setMouseDownPressed_(self, _cmd, newValue)
{
    self._mouseDownPressed = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("gravity"), function $_CPToolTipWindowView__gravity(self, _cmd)
{
    return self._gravity;
}
,["unsigned"]), new objj_method(sel_getUid("setGravity:"), function $_CPToolTipWindowView__setGravity_(self, _cmd, newValue)
{
    self._gravity = newValue;
}
,["void","unsigned"]), new objj_method(sel_getUid("drawRect:"), function $_CPToolTipWindowView__drawRect_(self, _cmd, aRect)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolTipWindowView").super_class }, "drawRect:", aRect);
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        radius = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "border-radius"),
        strokeWidth = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "stroke-width"),
        strokeColor = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "stroke-color"),
        bgColor = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "background-color");
    CGContextSetStrokeColor(context, strokeColor);
    CGContextSetFillColor(context, bgColor);
    CGContextSetLineWidth(context, strokeWidth);
    aRect.origin.x += strokeWidth;
    aRect.origin.y += strokeWidth;
    aRect.size.width -= strokeWidth * 2;
    aRect.size.height -= strokeWidth * 2;
    var path = CGPathWithRoundedRectangleInRect(aRect, radius, radius, YES, YES, YES, YES);
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    var ___r1;
}
,["void","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPToolTipWindowView__defaultThemeClass(self, _cmd)
{
    return "tooltip";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPToolTipWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", "E3E3E3"), "stroke-color", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", "FFFFCA"), "background-color", 2.0, "border-radius", 1.0, "stroke-width", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "color");
}
,["CPDictionary"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPToolTipWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("_CPToolTipWindowView").super_class }, "contentRectForFrameRect:", aFrameRect);
    contentRect.origin.x += 3;
    contentRect.origin.y += 3;
    contentRect.size.width -= 6;
    contentRect.size.height -= 6;
    return contentRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPToolTipWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    var aFrameRect = CGRectMakeCopy(aContentRect);
    aFrameRect.origin.x -= 3;
    aFrameRect.origin.y -= 3;
    aFrameRect.size.width += 6;
    aFrameRect.size.height += 6;
    return aFrameRect;
}
,["CGRect","CGRect"])]);
}