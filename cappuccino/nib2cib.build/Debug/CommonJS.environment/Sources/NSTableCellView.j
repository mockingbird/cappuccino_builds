@STATIC;1.0;I;20;AppKit/CPTableView.jt;1110;objj_executeFile("AppKit/CPTableView.j", NO);{
var the_class = objj_getClass("CPTableCellView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableCellView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPTableCellView__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableCellView").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPTableCellView, "NSTableCellView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSTableCellView__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSTableCellView__classForKeyedArchiver(self, _cmd)
{
    return CPTableCellView.isa.objj_msgSend0(CPTableCellView, "class");
}
,["Class"])]);
}