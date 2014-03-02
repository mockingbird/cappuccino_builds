@STATIC;1.0;I;21;AppKit/CPScrollView.jt;2366;objj_executeFile("AppKit/CPScrollView.j", NO);{
var the_class = objj_getClass("CPScrollView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPScrollView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPScrollView__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScrollView").super_class }, "NS_initWithCoder:", aCoder))
    {
        var flags = objj_msgSend(aCoder, "decodeIntForKey:", "NSsFlags");
        self._verticalScroller = objj_msgSend(aCoder, "decodeObjectForKey:", "NSVScroller");
        self._horizontalScroller = objj_msgSend(aCoder, "decodeObjectForKey:", "NSHScroller");
        self._contentView = objj_msgSend(aCoder, "decodeObjectForKey:", "NSContentView");
        self._headerClipView = objj_msgSend(aCoder, "decodeObjectForKey:", "NSHeaderClipView");
        self._cornerView = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCornerView");
        self._bottomCornerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
        objj_msgSend(self, "addSubview:", self._bottomCornerView);
        self._scrollerKnobStyle = objj_msgSend(aCoder, "decodeObjectForKey:", "NSScrollerKnobStyle");
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
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPScrollView, "NSScrollView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSScrollView__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSScrollView__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPScrollView, "class");
}
,["Class"])]);
}