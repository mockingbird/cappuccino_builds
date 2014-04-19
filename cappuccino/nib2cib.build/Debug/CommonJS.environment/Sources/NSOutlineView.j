@STATIC;1.0;I;22;AppKit/CPOutlineView.jt;2089;objj_executeFile("AppKit/CPOutlineView.j", NO);{
var the_class = objj_getClass("CPOutlineView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPOutlineView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPOutlineView__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOutlineView").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        if (objj_msgSend(aCoder, "containsValueForKey:", "NSOutlineViewOutlineTableColumnKey"))
            self._outlineTableColumn = objj_msgSend(aCoder, "decodeObjectForKey:", "NSOutlineViewOutlineTableColumnKey");
        else
            self._outlineTableColumn = objj_msgSend(objj_msgSend(self, "tableColumns"), "objectAtIndex:", 0);
        if (objj_msgSend(aCoder, "containsValueForKey:", "NSOutlineViewIndentationPerLevelKey"))
            self._indentationPerLevel = objj_msgSend(aCoder, "decodeFloatForKey:", "NSOutlineViewIndentationPerLevelKey");
        else
            self._indentationPerLevel = 16;
        self._outlineViewDataSource = objj_msgSend(aCoder, "decodeObjectForKey:", "NSDataSource");
        self._outlineViewDelegate = objj_msgSend(aCoder, "decodeObjectForKey:", "NSDelegate");
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPOutlineView, "NSOutlineView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSOutlineView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSOutlineView__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPOutlineView, "class");
}
,["Class"])]);
}