@STATIC;1.0;I;26;AppKit/CPTableHeaderView.jI;22;AppKit/_CPCornerView.jI;19;AppKit/CPScroller.jI;20;AppKit/CPTableView.jt;2062;objj_executeFile("AppKit/CPTableHeaderView.j", NO);objj_executeFile("AppKit/_CPCornerView.j", NO);objj_executeFile("AppKit/CPScroller.j", NO);objj_executeFile("AppKit/CPTableView.j", NO);{
var the_class = objj_getClass("_CPCornerView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCornerView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPCornerView__NS_initWithCoder_(self, _cmd, aCoder)
{
    return self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCornerView").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPCornerView, "_NSCornerView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_NSCornerView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_NSCornerView").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var theme = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "defaultTheme")),
            height = (theme == null ? null : theme.isa.objj_msgSend2(theme, "valueForAttributeWithName:forClass:", "default-row-height", CPTableView.isa.objj_msgSend0(CPTableView, "class"))),
            width = (theme == null ? null : theme.isa.objj_msgSend3(theme, "valueForAttributeWithName:inState:forClass:", "scroller-width", CPThemeState(CPThemeStateVertical, CPThemeStateScrollViewLegacy), CPScroller.isa.objj_msgSend0(CPScroller, "class")));
        self._frame.size.height = height;
        self._bounds.size.height = height;
        self._frame.size.width = width;
        self._bounds.size.width = width;
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $_NSCornerView__classForKeyedArchiver(self, _cmd)
{
    return _CPCornerView.isa.objj_msgSend0(_CPCornerView, "class");
}
,["Class"])]);
}