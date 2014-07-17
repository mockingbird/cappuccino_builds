@STATIC;1.0;I;22;AppKit/CPOutlineView.jt;2544;objj_executeFile("AppKit/CPOutlineView.j", NO);{
var the_class = objj_getClass("CPOutlineView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPOutlineView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPOutlineView__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSOutlineViewOutlineTableColumnKey")))
            self._outlineTableColumn = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSOutlineViewOutlineTableColumnKey"));
        else
            self._outlineTableColumn = ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "tableColumns"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NSOutlineViewIndentationPerLevelKey")))
            self._indentationPerLevel = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSOutlineViewIndentationPerLevelKey"));
        else
            self._indentationPerLevel = 16;
        self._outlineViewDataSource = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSDataSource"));
        self._outlineViewDelegate = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSDelegate"));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPOutlineView, "NSOutlineView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSOutlineView__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSOutlineView__classForKeyedArchiver(self, _cmd)
{
    return CPOutlineView.isa.objj_msgSend0(CPOutlineView, "class");
}
,["Class"])]);
}