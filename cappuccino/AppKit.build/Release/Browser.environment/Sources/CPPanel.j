@STATIC;1.0;i;10;CPWindow.jt;1771;objj_executeFile("CPWindow.j", YES);CPOKButton = 1;
CPCancelButton = 0;
CPDocModalWindowMask = 1 << 6;
{var the_class = objj_allocateClassPair(CPWindow, "CPPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_becomesKeyOnlyIfNeeded"), new objj_ivar("_worksWhenModal")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isFloatingPanel"), function $CPPanel__isFloatingPanel(self, _cmd)
{
    return objj_msgSend(self, "level") == CPFloatingWindowLevel;
}
,["BOOL"]), new objj_method(sel_getUid("setFloatingPanel:"), function $CPPanel__setFloatingPanel_(self, _cmd, isFloatingPanel)
{
    objj_msgSend(self, "setLevel:", isFloatingPanel ? CPFloatingWindowLevel : CPNormalWindowLevel);
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
,["BOOL"])]);
}