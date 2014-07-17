@STATIC;1.0;i;15;_CPWindowView.jt;2917;objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPShadowWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_windowView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_windowView"), function $_CPShadowWindowView___windowView(self, _cmd)
{
    return self._windowView;
}
,["_CPWindowView"]), new objj_method(sel_getUid("setWindowView:"), function $_CPShadowWindowView__setWindowView_(self, _cmd, newValue)
{
    self._windowView = newValue;
}
,["void","_CPWindowView"]), new objj_method(sel_getUid("init"), function $_CPShadowWindowView__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPShadowWindowView").super_class }, "init"))
    {
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPShadowWindowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPShadowWindowView").super_class }, "layoutSubviews");
    var bounds = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")),
        shadowDistance = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "shadow-distance")),
        shadowInset = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "shadow-inset")),
        size = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")),
        shadowSize = CGSizeMake(size.width, size.height);
    if (size.width >= shadowInset.left + shadowInset.right)
        shadowSize.width += shadowInset.left + shadowInset.right;
    else
        shadowSize.width = shadowInset.left + CGRectGetWidth(bounds) + shadowInset.right;
    if (size.height >= shadowInset.bottom + shadowInset.top + shadowDistance)
        shadowSize.height += shadowInset.bottom + shadowInset.top + shadowDistance;
    else
        shadowSize.height = shadowInset.top + CGRectGetHeight(bounds) + shadowInset.bottom;
    self.isa.objj_msgSend1(self, "setFrame:", CGRectMake(-shadowInset.left, -shadowInset.top + shadowDistance, shadowSize.width, shadowSize.height));
    self.isa.objj_msgSend1(self, "setBackgroundColor:", ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "window-shadow-color")));
    var ___r1;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPShadowWindowView__defaultThemeClass(self, _cmd)
{
    return "shadow-window-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPShadowWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
}
,["CPDictionary"])]);
}