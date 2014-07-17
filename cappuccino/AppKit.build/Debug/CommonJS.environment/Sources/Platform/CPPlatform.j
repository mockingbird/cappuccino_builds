@STATIC;1.0;I;21;Foundation/CPObject.jt;1934;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "CPBasePlatform"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("bootstrap"), function $CPBasePlatform__bootstrap(self, _cmd)
{
    (CPPlatformString == null ? null : CPPlatformString.isa.objj_msgSend0(CPPlatformString, "bootstrap"));
    (CPPlatformWindow == null ? null : CPPlatformWindow.isa.objj_msgSend1(CPPlatformWindow, "setPrimaryPlatformWindow:", ((___r1 = (CPPlatformWindow == null ? null : CPPlatformWindow.isa.objj_msgSend0(CPPlatformWindow, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_init"))));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("isBrowser"), function $CPBasePlatform__isBrowser(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("supportsDragAndDrop"), function $CPBasePlatform__supportsDragAndDrop(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("supportsNativeMainMenu"), function $CPBasePlatform__supportsNativeMainMenu(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("terminateApplication"), function $CPBasePlatform__terminateApplication(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("activateIgnoringOtherApps:"), function $CPBasePlatform__activateIgnoringOtherApps_(self, _cmd, shouldIgnoreOtherApps)
{
}
,["void","BOOL"]), new objj_method(sel_getUid("deactivate"), function $CPBasePlatform__deactivate(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("hideOtherApplications:"), function $CPBasePlatform__hideOtherApplications_(self, _cmd, aSender)
{
}
,["void","id"]), new objj_method(sel_getUid("hide:"), function $CPBasePlatform__hide_(self, _cmd, aSender)
{
}
,["void","id"])]);
}{var the_class = objj_allocateClassPair(CPBasePlatform, "CPPlatform"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}