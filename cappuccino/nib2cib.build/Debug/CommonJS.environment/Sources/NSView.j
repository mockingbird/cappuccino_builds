@STATIC;1.0;I;15;AppKit/CPView.jt;4640;objj_executeFile("AppKit/CPView.j", NO);var NSViewAutoresizingMask = 0x3F,
    NSViewAutoresizesSubviewsMask = 1 << 8,
    NSViewHiddenMask = 1 << 31;
{
var the_class = objj_getClass("CPView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPView__NS_initWithCoder_(self, _cmd, aCoder)
{
    self._frame = CGRectMakeZero();
    if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSFrame")))
        self._frame = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeRectForKey:", "NSFrame"));
    else if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSFrameSize")))
        self._frame.size = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", "NSFrameSize"));
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        self._tag = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSTag"));
        self._bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(self._frame), CGRectGetHeight(self._frame));
        self._window = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSWindow"));
        self._superview = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSuperview"));
        self._subviews = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSSubviews"));
        self._hierarchyScaleSize = CGSizeMake(1.0, 1.0);
        self._scaleSize = CGSizeMake(1.0, 1.0);
        self._isScaled = NO;
        if (!self._subviews)
            self._subviews = [];
        var vFlags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSvFlags"));
        self._autoresizingMask = vFlags & NSViewAutoresizingMask;
        self._autoresizesSubviews = vFlags & NSViewAutoresizesSubviewsMask;
        self._hitTests = YES;
        self._isHidden = vFlags & NSViewHiddenMask;
        self._opacity = 1.0;
        self._themeClass = (self == null ? null : self.isa.objj_msgSend0(self, "themeClass"));
        self._themeAttributes = {};
        self._themeState = CPThemeStateNormal;
        (self == null ? null : self.isa.objj_msgSend0(self, "_loadThemeAttributes"));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSReuseIdentifierKey")))
            self._identifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSReuseIdentifierKey"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_isFlipped"), function $CPView__NS_isFlipped(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("awakeFromNib"), function $CPView__awakeFromNib(self, _cmd)
{
    var superview = self.isa.objj_msgSend0(self, "superview");
    if (!superview || (superview == null ? null : superview.isa.objj_msgSend0(superview, "NS_isFlipped")))
        return;
    var superviewHeight = CGRectGetHeight((superview == null ? null : superview.isa.objj_msgSend0(superview, "bounds"))),
        frame = self.isa.objj_msgSend0(self, "frame");
    self.isa.objj_msgSend1(self, "setFrameOrigin:", CGPointMake(CGRectGetMinX(frame), superviewHeight - CGRectGetMaxY(frame)));
    var NS_autoresizingMask = self.isa.objj_msgSend0(self, "autoresizingMask"),
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
    self.isa.objj_msgSend1(self, "setAutoresizingMask:", autoresizingMask);
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPView, "NSView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSView__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSView__classForKeyedArchiver(self, _cmd)
{
    return CPView.isa.objj_msgSend0(CPView, "class");
}
,["Class"])]);
}