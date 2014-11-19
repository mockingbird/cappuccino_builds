@STATIC;1.0;I;20;AppKit/CPTableView.jt;4649;objj_executeFile("AppKit/CPTableView.j", NO);{
var the_class = objj_getClass("CPTableView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTableView__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var flags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSTvFlags"));
        self._rowHeight = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSRowHeight"));
        if (self._rowHeight == 17)
        {
            var theme = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "defaultTheme")),
                height = (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "default-row-height", CPTableView));
            self._rowHeight = height;
        }
        self._headerView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSHeaderView"));
        self._cornerView = self._headerView ? (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCornerView")) : nil;
        ((___r1 = self._cornerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        self._autosaveName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSAutosaveName"));
        self._tableColumns = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTableColumns"));
        ((___r1 = self._tableColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setTableView:"), self));
        self._archivedDataViews = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSTableViewArchivedReusableViewsKey"));
        self._intercellSpacing = CGSizeMake((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSIntercellSpacingWidth")), (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSIntercellSpacingHeight")));
        (self == null ? null : self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSGridColor")), "grid-color"));
        self._gridStyleMask = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSGridStyleMask"));
        self._usesAlternatingRowBackgroundColors = flags & 0x00800000 ? YES : NO;
        self._alternatingRowBackgroundColors = [CPColor.isa.objj_msgSend0(CPColor, "whiteColor"), CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", "e4e7ff")];
        self._selectionHighlightStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSTableViewSelectionHighlightStyle"));
        self._columnAutoResizingStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSColumnAutoresizingStyle"));
        self._allowsMultipleSelection = flags & 0x08000000 ? YES : NO;
        self._allowsEmptySelection = flags & 0x10000000 ? YES : NO;
        self._allowsColumnSelection = flags & 0x04000000 ? YES : NO;
        self._allowsColumnResizing = flags & 0x40000000 ? YES : NO;
        self._allowsColumnReordering = flags & 0x80000000 ? YES : NO;
        (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColor:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSBackgroundColor"))));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPTableView, "NSTableView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTableView__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTableView__classForKeyedArchiver(self, _cmd)
{
    return CPTableView.isa.objj_msgSend0(CPTableView, "class");
}
,["Class"])]);
}