@STATIC;1.0;i;15;_CPWindowView.jt;775;objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPWindowView, "_CPModalWindowView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("layoutSubviews"), function $_CPModalWindowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPModalWindowView").super_class }, "layoutSubviews");
    self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "bezel-color"));
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPModalWindowView__defaultThemeClass(self, _cmd)
{
    return "modal-window-view";
}
,["CPString"])]);
}