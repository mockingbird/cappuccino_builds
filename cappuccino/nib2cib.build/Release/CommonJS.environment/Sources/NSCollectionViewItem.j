@STATIC;1.0;I;29;AppKit/CPCollectionViewItem.jt;1169;objj_executeFile("AppKit/CPCollectionViewItem.j", NO);{
var the_class = objj_getClass("CPCollectionViewItem")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCollectionViewItem\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPCollectionViewItem__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionViewItem").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPCollectionViewItem, "NSCollectionViewItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSCollectionViewItem__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSCollectionViewItem__classForKeyedArchiver(self, _cmd)
{
    return CPCollectionViewItem.isa.objj_msgSend0(CPCollectionViewItem, "class");
}
,["Class"])]);
}