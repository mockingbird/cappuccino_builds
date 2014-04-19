@STATIC;1.0;I;21;Foundation/CPObject.jI;18;AppKit/CPBrowser.jI;20;AppKit/CPTextField.jI;16;AppKit/CPColor.jt;2264;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("AppKit/CPBrowser.j", NO);objj_executeFile("AppKit/CPTextField.j", NO);objj_executeFile("AppKit/CPColor.j", NO);{
var the_class = objj_getClass("CPBrowser")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPBrowser\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPBrowser__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBrowser").super_class }, "NS_initWithCoder:", aCoder))
    {
        var flags = objj_msgSend(aCoder, "decodeIntForKey:", "NSBrFlags");
        self._columnWidths = [];
        self._allowsEmptySelection = flags & 0x10000000 ? YES : NO;
        self._allowsMultipleSelection = flags & 0x08000000 ? YES : NO;
        self._minColumnWidth = objj_msgSend(aCoder, "decodeFloatForKey:", "NSMinColumnWidth");
        self._rowHeight = objj_msgSend(aCoder, "decodeFloatForKey:", "NSBrowserRowHeight");
        self._prototypeView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._prototypeView, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
        objj_msgSend(self._prototypeView, "setValue:forThemeAttribute:inState:", objj_msgSend(CPColor, "whiteColor"), "text-color", CPThemeStateSelectedDataView);
        objj_msgSend(self._prototypeView, "setLineBreakMode:", CPLineBreakByTruncatingTail);
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPBrowser, "NSBrowser"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSBrowser__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSBrowser__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPBrowser, "class");
}
,["Class"])]);
}