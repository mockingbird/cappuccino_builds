@STATIC;1.0;I;21;Foundation/CPObject.jt;2809;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "CPShadow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_offset"), new objj_ivar("_blurRadius"), new objj_ivar("_color")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("shadowOffset"), function $CPShadow__shadowOffset(self, _cmd)
{
    return self._offset;
}
,["CGSize"]), new objj_method(sel_getUid("setShadowOffset:"), function $CPShadow__setShadowOffset_(self, _cmd, newValue)
{
    self._offset = newValue;
}
,["void","CGSize"]), new objj_method(sel_getUid("shadowBlurRadius"), function $CPShadow__shadowBlurRadius(self, _cmd)
{
    return self._blurRadius;
}
,["float"]), new objj_method(sel_getUid("setShadowBlurRadius:"), function $CPShadow__setShadowBlurRadius_(self, _cmd, newValue)
{
    self._blurRadius = newValue;
}
,["void","float"]), new objj_method(sel_getUid("shadowColor"), function $CPShadow__shadowColor(self, _cmd)
{
    return self._color;
}
,["CPColor"]), new objj_method(sel_getUid("setShadowColor:"), function $CPShadow__setShadowColor_(self, _cmd, newValue)
{
    self._color = newValue;
}
,["void","CPColor"]), new objj_method(sel_getUid("_initWithOffset:blurRadius:color:"), function $CPShadow___initWithOffset_blurRadius_color_(self, _cmd, anOffset, aBlurRadius, aColor)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPShadow").super_class }, "init");
    if (self)
    {
        self._offset = anOffset;
        self._blurRadius = aBlurRadius;
        self._color = aColor;
    }
    return self;
}
,["id","CGSize","float","CPColor"]), new objj_method(sel_getUid("set"), function $CPShadow__set(self, _cmd)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextSetShadowWithColor(context, self._offset, self._blurRadius, self._color);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("cssString"), function $CPShadow__cssString(self, _cmd)
{
    return ((___r1 = self._color), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cssString")) + " " + ROUND(self._offset.width) + "px " + ROUND(self._offset.height) + "px " + ROUND(self._blurRadius) + "px";
    var ___r1;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("shadowWithOffset:blurRadius:color:"), function $CPShadow__shadowWithOffset_blurRadius_color_(self, _cmd, anOffset, aBlurRadius, aColor)
{
    return ((___r1 = CPShadow.isa.objj_msgSend0(CPShadow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_initWithOffset:blurRadius:color:", anOffset, aBlurRadius, aColor));
    var ___r1;
}
,["id","CGSize","float","CPColor"])]);
}