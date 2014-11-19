@STATIC;1.0;I;25;Foundation/CPDictionary.jI;21;Foundation/CPObject.ji;14;CPKeyBinding.ji;12;CPPlatform.jt;5907;objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPKeyBinding.j", YES);objj_executeFile("CPPlatform.j", YES);var PrimaryPlatformWindow = NULL;
{var the_class = objj_allocateClassPair(CPObject, "CPPlatformWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentRect"), new objj_ivar("_level"), new objj_ivar("_hasShadow"), new objj_ivar("_shadowStyle"), new objj_ivar("_title")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:"), function $CPPlatformWindow__initWithContentRect_(self, _cmd, aRect)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPlatformWindow").super_class }, "init");
    if (self)
    {
        self._contentRect = CGRectMakeCopy(aRect);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("init"), function $CPPlatformWindow__init(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "initWithContentRect:", CGRectMake(0.0, 0.0, 400.0, 500.0));
}
,["id"]), new objj_method(sel_getUid("contentRect"), function $CPPlatformWindow__contentRect(self, _cmd)
{
    return CGRectMakeCopy(self._contentRect);
}
,["CGRect"]), new objj_method(sel_getUid("contentBounds"), function $CPPlatformWindow__contentBounds(self, _cmd)
{
    var contentBounds = self.isa.objj_msgSend0(self, "contentRect");
    contentBounds.origin = CGPointMakeZero();
    return contentBounds;
}
,["CGRect"]), new objj_method(sel_getUid("visibleFrame"), function $CPPlatformWindow__visibleFrame(self, _cmd)
{
    var frame = self.isa.objj_msgSend0(self, "contentBounds");
    frame.origin = CGPointMakeZero();
    if ((CPMenu == null ? null : CPMenu.isa.objj_msgSend0(CPMenu, "menuBarVisible")) && CPPlatformWindow.isa.objj_msgSend0(CPPlatformWindow, "primaryPlatformWindow") === self)
    {
        var menuBarHeight = ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "menuBarHeight"));
        frame.origin.y += menuBarHeight;
        frame.size.height -= menuBarHeight;
    }
    return frame;
    var ___r1;
}
,["CGRect"]), new objj_method(sel_getUid("usableContentFrame"), function $CPPlatformWindow__usableContentFrame(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "visibleFrame");
}
,["CGRect"]), new objj_method(sel_getUid("setContentRect:"), function $CPPlatformWindow__setContentRect_(self, _cmd, aRect)
{
    if (!aRect || CGRectEqualToRect(self._contentRect, aRect))
        return;
    self._contentRect = CGRectMakeCopy(aRect);
}
,["void","CGRect"]), new objj_method(sel_getUid("updateFromNativeContentRect"), function $CPPlatformWindow__updateFromNativeContentRect(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setContentRect:", self.isa.objj_msgSend0(self, "nativeContentRect"));
}
,["void"]), new objj_method(sel_getUid("convertBaseToScreen:"), function $CPPlatformWindow__convertBaseToScreen_(self, _cmd, aPoint)
{
    var contentRect = self.isa.objj_msgSend0(self, "contentRect");
    return CGPointMake(aPoint.x + CGRectGetMinX(contentRect), aPoint.y + CGRectGetMinY(contentRect));
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertScreenToBase:"), function $CPPlatformWindow__convertScreenToBase_(self, _cmd, aPoint)
{
    var contentRect = self.isa.objj_msgSend0(self, "contentRect");
    return CGPointMake(aPoint.x - CGRectGetMinX(contentRect), aPoint.y - CGRectGetMinY(contentRect));
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("isVisible"), function $CPPlatformWindow__isVisible(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("deminiaturize:"), function $CPPlatformWindow__deminiaturize_(self, _cmd, sender)
{
}
,["void","id"]), new objj_method(sel_getUid("miniaturize:"), function $CPPlatformWindow__miniaturize_(self, _cmd, sender)
{
}
,["void","id"]), new objj_method(sel_getUid("moveWindow:fromLevel:toLevel:"), function $CPPlatformWindow__moveWindow_fromLevel_toLevel_(self, _cmd, aWindow, fromLevel, toLevel)
{
}
,["void","CPWindow","int","int"]), new objj_method(sel_getUid("setLevel:"), function $CPPlatformWindow__setLevel_(self, _cmd, aLevel)
{
    self._level = aLevel;
}
,["void","CPInteger"]), new objj_method(sel_getUid("setHasShadow:"), function $CPPlatformWindow__setHasShadow_(self, _cmd, shouldHaveShadow)
{
    self._hasShadow = shouldHaveShadow;
}
,["void","BOOL"]), new objj_method(sel_getUid("setShadowStyle:"), function $CPPlatformWindow__setShadowStyle_(self, _cmd, aStyle)
{
    self._shadowStyle = aStyle;
}
,["void","int"]), new objj_method(sel_getUid("supportsFullPlatformWindows"), function $CPPlatformWindow__supportsFullPlatformWindows(self, _cmd)
{
    return CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser");
}
,["BOOL"]), new objj_method(sel_getUid("_setTitle:window:"), function $CPPlatformWindow___setTitle_window_(self, _cmd, aTitle, aWindow)
{
    self._title = aTitle;
}
,["void","CPString","CPWindow"]), new objj_method(sel_getUid("title"), function $CPPlatformWindow__title(self, _cmd)
{
    return self._title;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("visiblePlatformWindows"), function $CPPlatformWindow__visiblePlatformWindows(self, _cmd)
{
    return CPSet.isa.objj_msgSend0(CPSet, "set");
}
,["CPSet"]), new objj_method(sel_getUid("supportsMultipleInstances"), function $CPPlatformWindow__supportsMultipleInstances(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("primaryPlatformWindow"), function $CPPlatformWindow__primaryPlatformWindow(self, _cmd)
{
    return PrimaryPlatformWindow;
}
,["CPPlatformWindow"]), new objj_method(sel_getUid("setPrimaryPlatformWindow:"), function $CPPlatformWindow__setPrimaryPlatformWindow_(self, _cmd, aPlatformWindow)
{
    PrimaryPlatformWindow = aPlatformWindow;
}
,["void","CPPlatformWindow"])]);
}