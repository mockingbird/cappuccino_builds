@STATIC;1.0;I;16;AppKit/CPPanel.jI;29;AppKit/_CPCibWindowTemplate.jt;3857;objj_executeFile("AppKit/CPPanel.j", NO);objj_executeFile("AppKit/_CPCibWindowTemplate.j", NO);var NSBorderlessWindowMask = 0x00,
    NSTitledWindowMask = 0x01,
    NSClosableWindowMask = 0x02,
    NSMiniaturizableWindowMask = 0x04,
    NSResizableWindowMask = 0x08,
    NSUtilityWindowMask = 0x10,
    NSDocModalWindowMask = 0x40,
    NSTexturedBackgroundWindowMask = 0x100,
    NSHUDBackgroundWindowMask = 0x2000,
    NSPositionFlexibleRight = 1 << 19,
    NSPositionFlexibleLeft = 1 << 20,
    NSPositionFlexibleBottom = 1 << 21,
    NSPositionFlexibleTop = 1 << 22,
    NSAutorecalculatesKeyViewLoopWTFlag = 0x800;
{
var the_class = objj_getClass("_CPCibWindowTemplate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibWindowTemplate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPCibWindowTemplate__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibWindowTemplate").super_class }, "init");
    if (self)
    {
        if (objj_msgSend(aCoder, "containsValueForKey:", "NSMinSize"))
            self._minSize = objj_msgSend(aCoder, "decodeSizeForKey:", "NSMinSize");
        if (objj_msgSend(aCoder, "containsValueForKey:", "NSMaxSize"))
            self._maxSize = objj_msgSend(aCoder, "decodeSizeForKey:", "NSMaxSize");
        self._screenRect = objj_msgSend(aCoder, "decodeRectForKey:", "NSScreenRect");
        self._viewClass = objj_msgSend(aCoder, "decodeObjectForKey:", "NSViewClass");
        self._wtFlags = objj_msgSend(aCoder, "decodeIntForKey:", "NSWTFlags");
        self._windowAutorecalculatesKeyViewLoop = !!(self._wtFlags & NSAutorecalculatesKeyViewLoopWTFlag);
        self._windowClass = CP_NSMapClassName(objj_msgSend(aCoder, "decodeObjectForKey:", "NSWindowClass"));
        self._windowRect = objj_msgSend(aCoder, "decodeRectForKey:", "NSWindowRect");
        self._windowStyleMask = objj_msgSend(aCoder, "decodeIntForKey:", "NSWindowStyleMask");
        self._windowTitle = objj_msgSend(aCoder, "decodeObjectForKey:", "NSWindowTitle");
        self._windowView = objj_msgSend(aCoder, "decodeObjectForKey:", "NSWindowView");
        self._windowRect.origin.y = self._screenRect.size.height - self._windowRect.origin.y - self._windowRect.size.height;
        if (self._windowStyleMask === NSBorderlessWindowMask)
            self._windowStyleMask = CPBorderlessWindowMask;
        else
            self._windowStyleMask = (self._windowStyleMask & NSTitledWindowMask ? CPTitledWindowMask : 0) | (self._windowStyleMask & NSClosableWindowMask ? CPClosableWindowMask : 0) | (self._windowStyleMask & NSMiniaturizableWindowMask ? CPMiniaturizableWindowMask : 0) | (self._windowStyleMask & NSResizableWindowMask ? CPResizableWindowMask : 0) | (self._windowStyleMask & NSTexturedBackgroundWindowMask ? NSTexturedBackgroundWindowMask : 0) | (self._windowStyleMask & NSDocModalWindowMask ? CPDocModalWindowMask : 0) | (self._windowStyleMask & NSHUDBackgroundWindowMask ? CPHUDBackgroundWindowMask : 0);
        self._windowIsFullPlatformWindow = objj_msgSend(aCoder, "decodeObjectForKey:", "NSFrameAutosaveName") === "CPBorderlessBridgeWindowMask";
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPCibWindowTemplate, "NSWindowTemplate"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSWindowTemplate__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSWindowTemplate__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPCibWindowTemplate, "class");
}
,["Class"])]);
}