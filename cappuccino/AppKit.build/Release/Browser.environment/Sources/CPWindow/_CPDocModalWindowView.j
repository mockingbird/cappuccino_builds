@STATIC;1.0;i;15;_CPWindowView.jt;3054;objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPWindowView, "_CPDocModalWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bodyView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPDocModalWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDocModalWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        var bounds = objj_msgSend(self, "bounds");
        self._bodyView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), CGRectGetHeight(bounds)));
        objj_msgSend(self._bodyView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self._bodyView, "setHitTests:", NO);
        objj_msgSend(self, "addSubview:", self._bodyView);
    }
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPDocModalWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    return objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPDocModalWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    return objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPDocModalWindowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPDocModalWindowView").super_class }, "layoutSubviews");
    var bounds = objj_msgSend(self, "bounds");
    objj_msgSend(self._bodyView, "setBackgroundColor:", objj_msgSend(self, "valueForThemeAttribute:", "body-color"));
}
,["void"]), new objj_method(sel_getUid("bodyOffset"), function $_CPDocModalWindowView__bodyOffset(self, _cmd)
{
    return objj_msgSend(self._bodyView, "frame").origin.y;
}
,["int"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPDocModalWindowView__defaultThemeClass(self, _cmd)
{
    return "doc-modal-window-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPDocModalWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPColor, "whiteColor"), "body-color", 8, "shadow-height");
}
,["id"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPDocModalWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("_CPDocModalWindowView").super_class }, "contentRectForFrameRect:", aFrameRect);
    return CGRectInset(contentRect, 1.0, 1.0);
}
,["CGRect","CGRect"])]);
}