@STATIC;1.0;I;19;AppKit/CPScroller.jt;2926;objj_executeFile("AppKit/CPScroller.j", NO);{
var the_class = objj_getClass("CPScroller")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPScroller\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPScroller__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "NS_initWithCoder:", aCoder))
    {
        self._controlSize = CPRegularControlSize;
        self._knobProportion = 1.0;
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSPercent")))
            self._knobProportion = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSPercent"));
        self._value = 0.0;
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSCurValue")))
            self._value = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSCurValue"));
        self._isVertical = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSsFlags")) !== 1;
        if (CPStringFromSelector((self == null ? null : self.isa.objj_msgSend0(self, "action"))) === "_doScroller:")
            if (self._isVertical)
                (self == null ? null : self.isa.objj_msgSend1(self, "setAction:", sel_getUid("_verticalScrollerDidScroll:")));
            else
                (self == null ? null : self.isa.objj_msgSend1(self, "setAction:", sel_getUid("_horizontalScrollerDidScroll:")));
        self._partRects = [];
        if (self._isVertical)
            (self == null ? null : self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(15.0, CGRectGetHeight((self == null ? null : self.isa.objj_msgSend0(self, "frame"))))));
        else
            (self == null ? null : self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(CGRectGetWidth((self == null ? null : self.isa.objj_msgSend0(self, "frame"))), 15.0)));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPScroller, "NSScroller"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSScroller__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSScroller__classForKeyedArchiver(self, _cmd)
{
    return CPScroller.isa.objj_msgSend0(CPScroller, "class");
}
,["Class"])]);
}