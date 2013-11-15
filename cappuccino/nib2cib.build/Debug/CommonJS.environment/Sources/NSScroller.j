@STATIC;1.0;I;19;AppKit/CPScroller.jt;2376;objj_executeFile("AppKit/CPScroller.j", NO);{
var the_class = objj_getClass("CPScroller")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPScroller\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPScroller__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScroller").super_class }, "NS_initWithCoder:", aCoder))
    {
        self._controlSize = CPRegularControlSize;
        self._knobProportion = 1.0;
        if (objj_msgSend(aCoder, "containsValueForKey:", "NSPercent"))
            self._knobProportion = objj_msgSend(aCoder, "decodeFloatForKey:", "NSPercent");
        self._value = 0.0;
        if (objj_msgSend(aCoder, "containsValueForKey:", "NSCurValue"))
            self._value = objj_msgSend(aCoder, "decodeFloatForKey:", "NSCurValue");
        self._isVertical = objj_msgSend(aCoder, "decodeIntForKey:", "NSsFlags") !== 1;
        if (CPStringFromSelector(objj_msgSend(self, "action")) === "_doScroller:")
            if (self._isVertical)
                objj_msgSend(self, "setAction:", sel_getUid("_verticalScrollerDidScroll:"));
            else
                objj_msgSend(self, "setAction:", sel_getUid("_horizontalScrollerDidScroll:"));
        self._partRects = [];
        if (self._isVertical)
            objj_msgSend(self, "setFrameSize:", CGSizeMake(15.0, CGRectGetHeight(objj_msgSend(self, "frame"))));
        else
            objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), 15.0));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPScroller, "NSScroller"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSScroller__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSScroller__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPScroller, "class");
}
,["Class"])]);
}