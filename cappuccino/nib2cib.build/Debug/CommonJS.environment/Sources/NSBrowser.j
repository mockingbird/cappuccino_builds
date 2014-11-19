@STATIC;1.0;I;21;Foundation/CPObject.jI;18;AppKit/CPBrowser.jI;20;AppKit/CPTextField.jI;16;AppKit/CPColor.jt;2756;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("AppKit/CPBrowser.j", NO);objj_executeFile("AppKit/CPTextField.j", NO);objj_executeFile("AppKit/CPColor.j", NO);{
var the_class = objj_getClass("CPBrowser")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPBrowser\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPBrowser__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBrowser").super_class }, "NS_initWithCoder:", aCoder))
    {
        var flags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSBrFlags"));
        self._columnWidths = [];
        self._allowsEmptySelection = flags & 0x10000000 ? YES : NO;
        self._allowsMultipleSelection = flags & 0x08000000 ? YES : NO;
        self._minColumnWidth = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSMinColumnWidth"));
        self._rowHeight = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSBrowserRowHeight"));
        self._prototypeView = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self._prototypeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setVerticalAlignment:", CPCenterVerticalTextAlignment));
        ((___r1 = self._prototypeView), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor"), "text-color", CPThemeStateSelectedDataView));
        ((___r1 = self._prototypeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", CPLineBreakByTruncatingTail));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPBrowser, "NSBrowser"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSBrowser__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSBrowser__classForKeyedArchiver(self, _cmd)
{
    return CPBrowser.isa.objj_msgSend0(CPBrowser, "class");
}
,["Class"])]);
}