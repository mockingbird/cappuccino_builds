@STATIC;1.0;I;21;Foundation/CPObject.jt;1911;


objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "CPShadow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_offset"), new objj_ivar("_blurRadius"), new objj_ivar("_color"), new objj_ivar("_cssString")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithOffset:blurRadius:color:"), function $CPShadow___initWithOffset_blurRadius_color_(self, _cmd, anOffset, aBlurRadius, aColor)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPShadow").super_class }, "init");

    if (self)
    {
        _offset = anOffset;
        _blurRadius = aBlurRadius;
        _color = aColor;

        _cssString = objj_msgSend(_color, "cssString") + " " + ROUND(anOffset.width) + "px " + ROUND(anOffset.height) + "px " + ROUND(_blurRadius) + "px";
    }

    return self;
}
},["id","CPSize","float","CPColor"]), new objj_method(sel_getUid("shadowOffset"), function $CPShadow__shadowOffset(self, _cmd)
{ with(self)
{
    return _offset;
}
},["CGSize"]), new objj_method(sel_getUid("shadowBlurRadius"), function $CPShadow__shadowBlurRadius(self, _cmd)
{ with(self)
{
    return _blurRadius;
}
},["float"]), new objj_method(sel_getUid("shadowColor"), function $CPShadow__shadowColor(self, _cmd)
{ with(self)
{
    return _color;
}
},["CPColor"]), new objj_method(sel_getUid("cssString"), function $CPShadow__cssString(self, _cmd)
{ with(self)
{
    return _cssString;
}
},["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("shadowWithOffset:blurRadius:color:"), function $CPShadow__shadowWithOffset_blurRadius_color_(self, _cmd, anOffset, aBlurRadius, aColor)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPShadow, "alloc"), "_initWithOffset:blurRadius:color:", anOffset, aBlurRadius, aColor);
}
},["id","CGSize","float","CPColor"])]);
}

