@STATIC;1.0;I;20;AppKit/CPSplitView.jt;1536;objj_executeFile("AppKit/CPSplitView.j", NO);var NSThinDividerStyle = 2;
{
var the_class = objj_getClass("CPSplitView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPSplitView__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "NS_initWithCoder:", aCoder))
    {
        self._isVertical = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSIsVertical"));
        self._isPaneSplitter = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSDividerStyle")) != NSThinDividerStyle;
        self._autosaveName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSAutosaveName"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPSplitView, "NSSplitView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSplitView__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSSplitView__classForKeyedArchiver(self, _cmd)
{
    return CPSplitView.isa.objj_msgSend0(CPSplitView, "class");
}
,["Class"])]);
}