@STATIC;1.0;t;1109;


var sRGBColorSpace = nil;




{var the_class = objj_allocateClassPair(CPObject, "CPColorSpace"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cgColorSpace")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCGColorSpace:"), function $CPColorSpace__initWithCGColorSpace_(self, _cmd, cgColorSpace)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorSpace").super_class }, "init"))
    {
        _cgColorSpace = cgColorSpace;
    }

    return self;
}
},["id","CGColorSpace"]), new objj_method(sel_getUid("CGColorSpace"), function $CPColorSpace__CGColorSpace(self, _cmd)
{ with(self)
{
    return _cgColorSpace;
}
},["CGColorSpace"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sRGBColorSpace"), function $CPColorSpace__sRGBColorSpace(self, _cmd)
{ with(self)
{
    if (!sRGBColorSpace)
        sRGBColorSpace = objj_msgSend(objj_msgSend(self, "alloc"), "initWithCGColorSpace:", CGColorSpaceCreateDeviceRGB());
    return sRGBColorSpace;
}
},["CPColorSpace"])]);
}

