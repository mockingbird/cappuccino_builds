@STATIC;1.0;i;10;CPWindow.jt;2586;objj_executeFile("CPWindow.j", YES);CPOKButton = 1;
CPCancelButton = 0;
CPDocModalWindowMask = 1 << 6;
{var the_class = objj_allocateClassPair(CPWindow, "CPPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_becomesKeyOnlyIfNeeded"), new objj_ivar("_worksWhenModal")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isFloatingPanel"), function $CPPanel__isFloatingPanel(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "level") == CPFloatingWindowLevel;
}
,["BOOL"]), new objj_method(sel_getUid("setFloatingPanel:"), function $CPPanel__setFloatingPanel_(self, _cmd, isFloatingPanel)
{
    self.isa.objj_msgSend1(self, "setLevel:", isFloatingPanel ? CPFloatingWindowLevel : CPNormalWindowLevel);
}
,["void","BOOL"]), new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"), function $CPPanel__becomesKeyOnlyIfNeeded(self, _cmd)
{
    return self._becomesKeyOnlyIfNeeded;
}
,["BOOL"]), new objj_method(sel_getUid("setBecomesKeyOnlyIfNeeded:"), function $CPPanel__setBecomesKeyOnlyIfNeeded_(self, _cmd, shouldBecomeKeyOnlyIfNeeded)
{
    self._becomesKeyOnlyIfNeeded = shouldBecomeKeyOnlyIfNeeded;
}
,["void","BOOL"]), new objj_method(sel_getUid("worksWhenModal"), function $CPPanel__worksWhenModal(self, _cmd)
{
    return self._worksWhenModal;
}
,["BOOL"]), new objj_method(sel_getUid("setWorksWhenModal:"), function $CPPanel__setWorksWhenModal_(self, _cmd, shouldWorkWhenModal)
{
    self._worksWhenModal = shouldWorkWhenModal;
}
,["void","BOOL"]), new objj_method(sel_getUid("canBecomeMainWindow"), function $CPPanel__canBecomeMainWindow(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("canBecomeKeyWindow"), function $CPPanel__canBecomeKeyWindow(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("cancelOperation:"), function $CPPanel__cancelOperation_(self, _cmd, sender)
{
    if (((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_couldBeKeyEquivalent")) && self.isa.objj_msgSend1(self, "performKeyEquivalent:", (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))))
        return;
    ((___r1 = self.isa.objj_msgSend0(self, "firstResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tryToPerform:with:", sel_getUid("cancel:"), self));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("cancel:"), function $CPPanel__cancel_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "performClose:", sender);
}
,["void","id"])]);
}