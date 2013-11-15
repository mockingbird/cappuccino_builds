@STATIC;1.0;i;15;_CPWindowView.jt;3688;objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPWindowView, "_CPToolTipWindowView"),
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
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        radius = objj_msgSend(self, "currentValueForThemeAttribute:", "border-radius"),
        strokeWidth = objj_msgSend(self, "currentValueForThemeAttribute:", "stroke-width"),
        strokeColor = objj_msgSend(self, "currentValueForThemeAttribute:", "stroke-color"),
        bgColor = objj_msgSend(self, "currentValueForThemeAttribute:", "background-color");
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
}
,["void","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPToolTipWindowView__defaultThemeClass(self, _cmd)
{
    return "tooltip";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPToolTipWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPColor, "colorWithHexString:", "E3E3E3"), "stroke-color", objj_msgSend(CPColor, "colorWithHexString:", "FFFFCA"), "background-color", 2.0, "border-radius", 1.0, "stroke-width", objj_msgSend(CPColor, "blackColor"), "color");
}
,["id"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPToolTipWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
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