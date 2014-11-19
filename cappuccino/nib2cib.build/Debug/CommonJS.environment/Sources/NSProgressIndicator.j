@STATIC;1.0;I;28;AppKit/CPProgressIndicator.jt;2926;objj_executeFile("AppKit/CPProgressIndicator.j", NO);var NSProgressIndicatorSpinningFlag = 1 << 12;
{
var the_class = objj_getClass("CPProgressIndicator")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPProgressIndicator\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPProgressIndicator__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPProgressIndicator").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var NS_flags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSpiFlags"));
        self._minValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", "NSMinValue"));
        self._maxValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", "NSMaxValue"));
        self._style = NS_flags & NSProgressIndicatorSpinningFlag ? CPProgressIndicatorSpinningStyle : CPProgressIndicatorBarStyle;
        self._indeterminate = NS_flags & 2 ? YES : NO;
        self._isDisplayedWhenStopped = NS_flags & 8192 ? NO : YES;
        self._controlSize = NS_flags & 256 ? CPSmallControlSize : CPRegularControlSize;
        if (self._style === CPProgressIndicatorSpinningStyle)
        {
            self._controlSize = self._controlSize == CPRegularControlSize ? CPSmallControlSize : CPMiniControlSize;
        }
        self._doubleValue = 0.0;
        var currentFrameSize = (self == null ? null : self.isa.objj_msgSend0(self, "frameSize"));
        if (self._style !== CPProgressIndicatorSpinningStyle)
        {
            var theme = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "defaultTheme")),
                height = (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "default-height", CPProgressIndicator));
            currentFrameSize.height = height;
        }
        (self == null ? null : self.isa.objj_msgSend1(self, "setFrameSize:", currentFrameSize));
        (self == null ? null : self.isa.objj_msgSend0(self, "updateBackgroundColor"));
        (self == null ? null : self.isa.objj_msgSend0(self, "drawBar"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPProgressIndicator, "NSProgressIndicator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSProgressIndicator__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSProgressIndicator__classForKeyedArchiver(self, _cmd)
{
    return CPProgressIndicator.isa.objj_msgSend0(CPProgressIndicator, "class");
}
,["Class"])]);
}