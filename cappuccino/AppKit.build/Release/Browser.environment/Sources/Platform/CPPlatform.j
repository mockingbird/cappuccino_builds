@STATIC;1.0;I;21;Foundation/CPObject.jt;6052;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "CPBasePlatform"),
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
}if (typeof window["CPPlatformEnableHTMLDragAndDrop"] === "undefined")
    CPPlatformEnableHTMLDragAndDrop = NO;
CPPlatformDidClearBodyElementNotification = "CPPlatformDidClearBodyElementNotification";
CPPlatformWillClearBodyElementNotification = "CPPlatformWillClearBodyElementNotification";
var screenNeedsInitialization = NO,
    mainBodyElement = nil,
    elementRemovalTest = new RegExp("\\bcpdontremove\\b", "g");
{var the_class = objj_allocateClassPair(CPBasePlatform, "CPPlatform"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPPlatform__initialize(self, _cmd)
{
    if (self !== CPPlatform.isa.objj_msgSend0(CPPlatform, "class"))
        return;
    screenNeedsInitialization = CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser");
    if (document.documentElement)
        document.documentElement.style.overflow = "hidden";
    if (CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
        window.onunload = function()
        {
            (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "terminate:", nil));
        };
}
,["void"]), new objj_method(sel_getUid("isBrowser"), function $CPPlatform__isBrowser(self, _cmd)
{
    return typeof window.cpIsDesktop === "undefined";
}
,["BOOL"]), new objj_method(sel_getUid("supportsDragAndDrop"), function $CPPlatform__supportsDragAndDrop(self, _cmd)
{
    return CPFeatureIsCompatible(CPHTMLDragAndDropFeature) && (CPPlatformEnableHTMLDragAndDrop || !self.isa.objj_msgSend0(self, "isBrowser"));
}
,["BOOL"]), new objj_method(sel_getUid("supportsNativeMainMenu"), function $CPPlatform__supportsNativeMainMenu(self, _cmd)
{
    return typeof window["cpSetMainMenu"] === "function";
}
,["BOOL"]), new objj_method(sel_getUid("terminateApplication"), function $CPPlatform__terminateApplication(self, _cmd)
{
    if (typeof window["cpTerminate"] === "function")
        window.cpTerminate();
}
,["void"]), new objj_method(sel_getUid("activateIgnoringOtherApps:"), function $CPPlatform__activateIgnoringOtherApps_(self, _cmd, shouldIgnoreOtherApps)
{
    if (typeof window["cpActivateIgnoringOtherApps"] === "function")
        window.cpActivateIgnoringOtherApps(!!shouldIgnoreOtherApps);
}
,["void","BOOL"]), new objj_method(sel_getUid("deactivate"), function $CPPlatform__deactivate(self, _cmd)
{
    if (typeof window["cpDeactivate"] === "function")
        window.cpDeactivate();
}
,["void"]), new objj_method(sel_getUid("hideOtherApplications:"), function $CPPlatform__hideOtherApplications_(self, _cmd, aSender)
{
    if (typeof window["cpHideOtherApplications"] === "function")
        window.cpHideOtherApplications();
}
,["void","id"]), new objj_method(sel_getUid("hide:"), function $CPPlatform__hide_(self, _cmd, aSender)
{
    if (typeof window["cpHide"] === "function")
        window.cpHide();
}
,["void","id"]), new objj_method(sel_getUid("mainBodyElement"), function $CPPlatform__mainBodyElement(self, _cmd)
{
    if (!mainBodyElement)
        mainBodyElement = document.getElementById("cappuccino-body") || document.body;
    return mainBodyElement;
}
,["DOMElement"]), new objj_method(sel_getUid("initializeScreenIfNecessary"), function $CPPlatform__initializeScreenIfNecessary(self, _cmd)
{
    if (!screenNeedsInitialization)
        return;
    screenNeedsInitialization = NO;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPPlatformWillClearBodyElementNotification, self));
    var bodyElement = self.isa.objj_msgSend0(self, "mainBodyElement");
    var children = bodyElement.childNodes,
        length = children.length;
    while (length--)
    {
        var element = children[length];
        if (!element.className || element.className.match(elementRemovalTest) === null)
            bodyElement.removeChild(element);
    }
    bodyElement.style.overflow = "hidden";
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPPlatformDidClearBodyElementNotification, self));
    var ___r1;
}
,["void"])]);
}