@STATIC;1.0;I;26;AppKit/CPTableHeaderView.jt;1601;objj_executeFile("AppKit/CPTableHeaderView.j", NO);{
var the_class = objj_getClass("CPTableHeaderView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableHeaderView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTableHeaderView__NS_initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableHeaderView").super_class }, "NS_initWithCoder:", aCoder))
    {
        self._tableView = objj_msgSend(aCoder, "decodeObjectForKey:", "NSTableView");
        if (self._bounds.size.height === 17)
        {
            var theme = objj_msgSend(Nib2Cib, "defaultTheme"),
                height = objj_msgSend(theme, "valueForAttributeWithName:forClass:", "default-row-height", CPTableView);
            self._bounds.size.height = height;
            self._frame.size.height = height;
        }
        self._drawsColumnLines = YES;
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPTableHeaderView, "NSTableHeaderView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTableHeaderView__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTableHeaderView__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPTableHeaderView, "class");
}
,["Class"])]);
}