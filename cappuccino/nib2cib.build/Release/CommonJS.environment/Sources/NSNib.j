@STATIC;1.0;I;14;AppKit/CPCib.jt;1629;objj_executeFile("AppKit/CPCib.j", NO);var FILE = require("file"),
    OS = require("os"),
    UUID = require("uuid");
{
var the_class = objj_getClass("CPCib")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCib\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPCib__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCib").super_class }, "init");
    var nibPath = "/tmp/" + UUID.uuid() + ".nib",
        data = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSNibFileData"));
    FILE.write(nibPath, data.bytes(), {charset: "UTF-16"});
    var converter = ((___r1 = (Converter == null ? null : Converter.isa.objj_msgSend0(Converter, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithInputPath:outputPath:", nibPath, nil));
    self._data = (converter == null ? null : converter.isa.objj_msgSend0(converter, "convert"));
    return self;
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPCib, "NSNib"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSNib__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSNib__classForKeyedArchiver(self, _cmd)
{
    return CPCib.isa.objj_msgSend0(CPCib, "class");
}
,["Class"])]);
}