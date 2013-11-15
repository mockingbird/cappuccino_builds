@STATIC;1.0;i;15;_CPWindowView.jt;2607;objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPShadowWindowView"),
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
    var bounds = objj_msgSend(self._windowView, "bounds"),
        shadowDistance = objj_msgSend(self._windowView, "valueForThemeAttribute:", "shadow-distance"),
        shadowInset = objj_msgSend(self._windowView, "valueForThemeAttribute:", "shadow-inset"),
        size = objj_msgSend(self._windowView, "frameSize"),
        shadowSize = CGSizeMake(size.width, size.height);
    if (size.width >= shadowInset.left + shadowInset.right)
        shadowSize.width += shadowInset.left + shadowInset.right;
    else
        shadowSize.width = shadowInset.left + CGRectGetWidth(bounds) + shadowInset.right;
    if (size.height >= shadowInset.bottom + shadowInset.top + shadowDistance)
        shadowSize.height += shadowInset.bottom + shadowInset.top + shadowDistance;
    else
        shadowSize.height = shadowInset.top + CGRectGetHeight(bounds) + shadowInset.bottom;
    objj_msgSend(self, "setFrame:", CGRectMake(-shadowInset.left, -shadowInset.top + shadowDistance, shadowSize.width, shadowSize.height));
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self._windowView, "valueForThemeAttribute:", "window-shadow-color"));
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
,["id"])]);
}