@STATIC;1.0;I;16;AppKit/CPImage.jt;1247;objj_executeFile("AppKit/CPImage.j", NO);{
var the_class = objj_getClass("CPImage")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPImage\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPImage__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend0(self, "init"));
    if (self)
    {
        var imageFlags = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSImageFlags"));
        self._size = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", "NSSize"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPImage, "NSImage"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSImage__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSImage__classForKeyedArchiver(self, _cmd)
{
    return CPImage.isa.objj_msgSend0(CPImage, "class");
}
,["Class"])]);
}