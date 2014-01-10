@STATIC;1.0;I;15;AppKit/CPView.jt;3994;objj_executeFile("AppKit/CPView.j", NO);var NSViewAutoresizingMask = 0x3F,
    NSViewAutoresizesSubviewsMask = 1 << 8,
    NSViewHiddenMask = 1 << 31;
{
var the_class = objj_getClass("CPView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPView__NS_initWithCoder_(self, _cmd, aCoder)
{
    self._frame = CGRectMakeZero();
    if (objj_msgSend(aCoder, "containsValueForKey:", "NSFrame"))
        self._frame = objj_msgSend(aCoder, "decodeRectForKey:", "NSFrame");
    else if (objj_msgSend(aCoder, "containsValueForKey:", "NSFrameSize"))
        self._frame.size = objj_msgSend(aCoder, "decodeSizeForKey:", "NSFrameSize");
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        self._tag = objj_msgSend(aCoder, "decodeIntForKey:", "NSTag");
        self._bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(self._frame), CGRectGetHeight(self._frame));
        self._window = objj_msgSend(aCoder, "decodeObjectForKey:", "NSWindow");
        self._superview = objj_msgSend(aCoder, "decodeObjectForKey:", "NSSuperview");
        self._subviews = objj_msgSend(aCoder, "decodeObjectForKey:", "NSSubviews");
        self._hierarchyScaleSize = CGSizeMake(1.0, 1.0);
        self._scaleSize = CGSizeMake(1.0, 1.0);
        self._isScaled = NO;
        if (!self._subviews)
            self._subviews = [];
        var vFlags = objj_msgSend(aCoder, "decodeIntForKey:", "NSvFlags");
        self._autoresizingMask = vFlags & NSViewAutoresizingMask;
        self._autoresizesSubviews = vFlags & NSViewAutoresizesSubviewsMask;
        self._hitTests = YES;
        self._isHidden = vFlags & NSViewHiddenMask;
        self._opacity = 1.0;
        self._themeClass = objj_msgSend(self, "themeClass");
        self._themeAttributes = {};
        self._themeState = CPThemeStateNormal;
        objj_msgSend(self, "_loadThemeAttributes");
        if (objj_msgSend(aCoder, "containsValueForKey:", "NSReuseIdentifierKey"))
            self._identifier = objj_msgSend(aCoder, "decodeObjectForKey:", "NSReuseIdentifierKey");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_isFlipped"), function $CPView__NS_isFlipped(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("awakeFromNib"), function $CPView__awakeFromNib(self, _cmd)
{
    var superview = objj_msgSend(self, "superview");
    if (!superview || objj_msgSend(superview, "NS_isFlipped"))
        return;
    var superviewHeight = CGRectGetHeight(objj_msgSend(superview, "bounds")),
        frame = objj_msgSend(self, "frame");
    objj_msgSend(self, "setFrameOrigin:", CGPointMake(CGRectGetMinX(frame), superviewHeight - CGRectGetMaxY(frame)));
    var NS_autoresizingMask = objj_msgSend(self, "autoresizingMask"),
        autoresizingMask = NS_autoresizingMask & ~(CPViewMaxYMargin | CPViewMinYMargin);
    if (!(NS_autoresizingMask & (CPViewMaxYMargin | CPViewMinYMargin | CPViewHeightSizable)))
        autoresizingMask |= CPViewMinYMargin;
    else
    {
        if (NS_autoresizingMask & CPViewMaxYMargin)
            autoresizingMask |= CPViewMinYMargin;
        if (NS_autoresizingMask & CPViewMinYMargin)
            autoresizingMask |= CPViewMaxYMargin;
    }
    objj_msgSend(self, "setAutoresizingMask:", autoresizingMask);
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPView, "NSView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSView__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSView__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPView, "class");
}
,["Class"])]);
}