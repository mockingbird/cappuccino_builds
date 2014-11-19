@STATIC;1.0;i;15;_CPWindowView.jt;3643;objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPWindowView, "_CPDocModalWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bodyView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPDocModalWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDocModalWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        var bounds = (self == null ? null : self.isa.objj_msgSend0(self, "bounds"));
        self._bodyView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), CGRectGetHeight(bounds))));
        ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHitTests:", NO));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._bodyView));
    }
    return self;
    var ___r1;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPDocModalWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "contentRectForFrameRect:", aFrameRect));
    var ___r1;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPDocModalWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "frameRectForContentRect:", aContentRect));
    var ___r1;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPDocModalWindowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDocModalWindowView").super_class }, "layoutSubviews");
    var bounds = self.isa.objj_msgSend0(self, "bounds");
    ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "body-color")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("bodyOffset"), function $_CPDocModalWindowView__bodyOffset(self, _cmd)
{
    return ((___r1 = self._bodyView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).origin.y;
    var ___r1;
}
,["int"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPDocModalWindowView__defaultThemeClass(self, _cmd)
{
    return "doc-modal-window-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPDocModalWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor"), "body-color", 8, "shadow-height");
}
,["CPDictionary"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPDocModalWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("_CPDocModalWindowView").super_class }, "contentRectForFrameRect:", aFrameRect);
    return CGRectInset(contentRect, 1.0, 1.0);
}
,["CGRect","CGRect"])]);
}