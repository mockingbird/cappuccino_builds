@STATIC;1.0;I;21;AppKit/CPScrollView.jt;2774;objj_executeFile("AppKit/CPScrollView.j", NO);{
var the_class = objj_getClass("CPScrollView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPScrollView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPScrollView__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScrollView").super_class }, "NS_initWithCoder:", aCoder))
    {
        var flags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSsFlags"));
        self._verticalScroller = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSVScroller"));
        self._horizontalScroller = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSHScroller"));
        self._contentView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSContentView"));
        self._headerClipView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSHeaderClipView"));
        self._cornerView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCornerView"));
        self._bottomCornerView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._bottomCornerView));
        self._scrollerKnobStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSScrollerKnobStyle"));
        if (self._scrollerKnobStyle === nil)
            self._scrollerKnobStyle = CPScrollerKnobStyleDefault;
        self._hasVerticalScroller = !!(flags & 1 << 4);
        self._hasHorizontalScroller = !!(flags & 1 << 5);
        self._autohidesScrollers = !!(flags & 1 << 9);
        self._borderType = flags & 0x03;
        self._verticalLineScroll = 10.0;
        self._verticalPageScroll = 10.0;
        self._horizontalLineScroll = 10.0;
        self._horizontalPageScroll = 10.0;
    }
    return self;
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPScrollView, "NSScrollView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSScrollView__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSScrollView__classForKeyedArchiver(self, _cmd)
{
    return CPScrollView.isa.objj_msgSend0(CPScrollView, "class");
}
,["Class"])]);
}