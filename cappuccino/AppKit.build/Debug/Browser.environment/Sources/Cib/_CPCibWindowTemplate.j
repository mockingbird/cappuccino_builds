@STATIC;1.0;I;21;Foundation/CPObject.jI;26;Foundation/CPObjJRuntime.ji;12;CGGeometry.ji;11;CPToolbar.ji;8;CPView.ji;20;CPWindow_Constants.ji;12;_CPToolTip.jt;10183;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPObjJRuntime.j", NO);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPToolbar.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow_Constants.j", YES);objj_executeFile("_CPToolTip.j", YES);{var the_class = objj_allocateClassPair(CPObject, "_CPCibWindowTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_screenRect"), new objj_ivar("_viewClass"), new objj_ivar("_wtFlags"), new objj_ivar("_windowClass"), new objj_ivar("_windowRect"), new objj_ivar("_windowStyleMask"), new objj_ivar("_windowTitle"), new objj_ivar("_windowView"), new objj_ivar("_windowAutorecalculatesKeyViewLoop"), new objj_ivar("_windowIsFullPlatformWindow")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPCibWindowTemplate__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibWindowTemplate").super_class }, "init");
    if (self)
    {
        self._windowClass = "CPWindow";
        self._windowRect = CGRectMake(0.0, 0.0, 400.0, 200.0);
        self._windowStyleMask = CPTitledWindowMask | CPClosableWindowMask | CPMiniaturizableWindowMask | CPResizableWindowMask;
        self._windowTitle = "Window";
        self._windowView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 400.0, 200.0)));
        self._windowIsFullPlatformWindow = NO;
        self._wtFlags = CPWindowPositionFlexibleLeft | CPWindowPositionFlexibleRight | CPWindowPositionFlexibleTop | CPWindowPositionFlexibleBottom;
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("customClassName"), function $_CPCibWindowTemplate__customClassName(self, _cmd)
{
    return self._windowClass;
}
,["CPString"]), new objj_method(sel_getUid("setCustomClassName:"), function $_CPCibWindowTemplate__setCustomClassName_(self, _cmd, aClassName)
{
    self._windowClass = aClassName;
}
,["void","CPString"]), new objj_method(sel_getUid("windowClass"), function $_CPCibWindowTemplate__windowClass(self, _cmd)
{
    return self._windowClass;
}
,["CPString"]), new objj_method(sel_getUid("_cibInstantiate"), function $_CPCibWindowTemplate___cibInstantiate(self, _cmd)
{
    var windowClass = CPClassFromString(self.isa.objj_msgSend0(self, "windowClass"));
    if (!windowClass)
    {
        CPLog.warn("Unknown class \"%@\" in cib file, using CPWindow instead.", self.isa.objj_msgSend0(self, "windowClass"));
        windowClass = CPWindow.isa.objj_msgSend0(CPWindow, "class");
    }
    var theWindow = ((___r1 = (windowClass == null ? null : windowClass.isa.objj_msgSend0(windowClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", self._windowRect, self._windowStyleMask));
    if (self._minSize)
        (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setMinSize:", self._minSize));
    if (self._maxSize)
        (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setMaxSize:", self._maxSize));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setTitle:", self._windowTitle));
    var contentViewAutoresizesSubviews = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "autoresizesSubviews"));
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizesSubviews:", NO));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setContentView:", self._windowView));
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizesSubviews:", contentViewAutoresizesSubviews));
    if (((___r1 = self._viewClass), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPToolbar.isa.objj_msgSend0(CPToolbar, "class"))))
        (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setToolbar:", self._viewClass));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setAutorecalculatesKeyViewLoop:", self._windowAutorecalculatesKeyViewLoop));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setFullPlatformWindow:", self._windowIsFullPlatformWindow));
    theWindow._positioningMask = self._wtFlags;
    theWindow._positioningScreenRect = self._screenRect;
    return theWindow;
    var ___r1;
}
,["id"])]);
}var _CPCibWindowTemplateMinSizeKey = "_CPCibWindowTemplateMinSizeKey",
    _CPCibWindowTemplateMaxSizeKey = "_CPCibWindowTemplateMaxSizeKey",
    _CPCibWindowTemplateViewClassKey = "_CPCibWindowTemplateViewClassKey",
    _CPCibWindowTemplateWTFlagsKey = "_CPCibWindowTemplateWTFlagsKey",
    _CPCibWindowTemplateWindowClassKey = "_CPCibWindowTemplateWindowClassKey",
    _CPCibWindowTemplateWindowRectKey = "_CPCibWindowTemplateWindowRectKey",
    _CPCibWindowTemplateScreenRectKey = "_CPCibWindowTemplateScreenRectKey",
    _CPCibWindowTemplateWindowStyleMaskKey = "_CPCibWindowTempatStyleMaskKey",
    _CPCibWindowTemplateWindowTitleKey = "_CPCibWindowTemplateWindowTitleKey",
    _CPCibWindowTemplateWindowViewKey = "_CPCibWindowTemplateWindowViewKey",
    _CPCibWindowTemplateWindowAutorecalculatesKeyViewLoop = "_CPCibWindowTemplateWindowAutorecalculatesKeyViewLoop",
    _CPCibWindowTemplateWindowIsFullPlatformWindowKey = "_CPCibWindowTemplateWindowIsFullPlatformWindowKey";
{
var the_class = objj_getClass("_CPCibWindowTemplate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibWindowTemplate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPCibWindowTemplate__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibWindowTemplate").super_class }, "init");
    if (self)
    {
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", _CPCibWindowTemplateMinSizeKey)))
            self._minSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", _CPCibWindowTemplateMinSizeKey));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", _CPCibWindowTemplateMaxSizeKey)))
            self._maxSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", _CPCibWindowTemplateMaxSizeKey));
        self._viewClass = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateViewClassKey));
        self._windowClass = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowClassKey));
        self._wtFlags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", _CPCibWindowTemplateWTFlagsKey));
        self._windowRect = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeRectForKey:", _CPCibWindowTemplateWindowRectKey));
        self._screenRect = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeRectForKey:", _CPCibWindowTemplateScreenRectKey));
        self._windowStyleMask = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", _CPCibWindowTemplateWindowStyleMaskKey));
        self._windowTitle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowTitleKey));
        self._windowView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowViewKey));
        self._windowAutorecalculatesKeyViewLoop = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", _CPCibWindowTemplateWindowAutorecalculatesKeyViewLoop));
        self._windowIsFullPlatformWindow = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", _CPCibWindowTemplateWindowIsFullPlatformWindowKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibWindowTemplate__encodeWithCoder_(self, _cmd, aCoder)
{
    if (self._minSize)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeSize:forKey:", self._minSize, _CPCibWindowTemplateMinSizeKey));
    if (self._maxSize)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeSize:forKey:", self._maxSize, _CPCibWindowTemplateMaxSizeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._viewClass, _CPCibWindowTemplateViewClassKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._windowClass, _CPCibWindowTemplateWindowClassKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._wtFlags, _CPCibWindowTemplateWTFlagsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeRect:forKey:", self._windowRect, _CPCibWindowTemplateWindowRectKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeRect:forKey:", self._screenRect, _CPCibWindowTemplateScreenRectKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._windowStyleMask, _CPCibWindowTemplateWindowStyleMaskKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._windowTitle, _CPCibWindowTemplateWindowTitleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._windowView, _CPCibWindowTemplateWindowViewKey));
    if (self._windowAutorecalculatesKeyViewLoop)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._windowAutorecalculatesKeyViewLoop, _CPCibWindowTemplateWindowAutorecalculatesKeyViewLoop));
    if (self._windowIsFullPlatformWindow)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._windowIsFullPlatformWindow, _CPCibWindowTemplateWindowIsFullPlatformWindowKey));
}
,["void","CPCoder"])]);
}