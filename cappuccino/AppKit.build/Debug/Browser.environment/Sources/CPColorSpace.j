@STATIC;1.0;I;21;Foundation/CPObject.jt;1112;objj_executeFile("Foundation/CPObject.j", NO);var sRGBColorSpace = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPColorSpace"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cgColorSpace")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCGColorSpace:"), function $CPColorSpace__initWithCGColorSpace_(self, _cmd, cgColorSpace)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorSpace").super_class }, "init"))
    {
        self._cgColorSpace = cgColorSpace;
    }
    return self;
}
,["id","CGColorSpace"]), new objj_method(sel_getUid("CGColorSpace"), function $CPColorSpace__CGColorSpace(self, _cmd)
{
    return self._cgColorSpace;
}
,["CGColorSpace"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sRGBColorSpace"), function $CPColorSpace__sRGBColorSpace(self, _cmd)
{
    if (!sRGBColorSpace)
        sRGBColorSpace = objj_msgSend(objj_msgSend(self, "alloc"), "initWithCGColorSpace:", CGColorSpaceCreateDeviceRGB());
    return sRGBColorSpace;
}
,["CPColorSpace"])]);
}