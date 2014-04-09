@STATIC;1.0;I;20;AppKit/CPTableView.jt;3703;objj_executeFile("AppKit/CPTableView.j", NO);{
var the_class = objj_getClass("CPTableView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTableView__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var flags = objj_msgSend(aCoder, "decodeIntForKey:", "NSTvFlags");
        self._rowHeight = objj_msgSend(aCoder, "decodeFloatForKey:", "NSRowHeight");
        if (self._rowHeight == 17)
        {
            var theme = objj_msgSend(Nib2Cib, "defaultTheme"),
                height = objj_msgSend(theme, "valueForAttributeWithName:forClass:", "default-row-height", CPTableView);
            self._rowHeight = height;
        }
        self._headerView = objj_msgSend(aCoder, "decodeObjectForKey:", "NSHeaderView");
        self._cornerView = self._headerView ? objj_msgSend(aCoder, "decodeObjectForKey:", "NSCornerView") : nil;
        objj_msgSend(self._cornerView, "setHidden:", NO);
        self._autosaveName = objj_msgSend(aCoder, "decodeObjectForKey:", "NSAutosaveName");
        self._tableColumns = objj_msgSend(aCoder, "decodeObjectForKey:", "NSTableColumns");
        objj_msgSend(self._tableColumns, "makeObjectsPerformSelector:withObject:", sel_getUid("setTableView:"), self);
        self._archivedDataViews = objj_msgSend(aCoder, "decodeObjectForKey:", "NSTableViewArchivedReusableViewsKey");
        self._intercellSpacing = CGSizeMake(objj_msgSend(aCoder, "decodeFloatForKey:", "NSIntercellSpacingWidth"), objj_msgSend(aCoder, "decodeFloatForKey:", "NSIntercellSpacingHeight"));
        objj_msgSend(self, "setValue:forThemeAttribute:", objj_msgSend(aCoder, "decodeObjectForKey:", "NSGridColor"), "grid-color");
        self._gridStyleMask = objj_msgSend(aCoder, "decodeIntForKey:", "NSGridStyleMask");
        self._usesAlternatingRowBackgroundColors = flags & 0x00800000 ? YES : NO;
        self._alternatingRowBackgroundColors = [objj_msgSend(CPColor, "whiteColor"), objj_msgSend(CPColor, "colorWithHexString:", "e4e7ff")];
        self._selectionHighlightStyle = objj_msgSend(aCoder, "decodeIntForKey:", "NSTableViewSelectionHighlightStyle");
        self._columnAutoResizingStyle = objj_msgSend(aCoder, "decodeIntForKey:", "NSColumnAutoresizingStyle");
        self._allowsMultipleSelection = flags & 0x08000000 ? YES : NO;
        self._allowsEmptySelection = flags & 0x10000000 ? YES : NO;
        self._allowsColumnSelection = flags & 0x04000000 ? YES : NO;
        self._allowsColumnResizing = flags & 0x40000000 ? YES : NO;
        self._allowsColumnReordering = flags & 0x80000000 ? YES : NO;
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(aCoder, "decodeObjectForKey:", "NSBackgroundColor"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPTableView, "NSTableView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTableView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTableView__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPTableView, "class");
}
,["Class"])]);
}