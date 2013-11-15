@STATIC;1.0;I;14;AppKit/CPCib.jt;1414;objj_executeFile("AppKit/CPCib.j", NO);var FILE = require("file"),
    OS = require("os"),
    UUID = require("uuid");
{
var the_class = objj_getClass("CPCib")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCib\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPCib__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCib").super_class }, "init");
    var nibPath = "/tmp/" + UUID.uuid() + ".nib",
        data = objj_msgSend(aCoder, "decodeObjectForKey:", "NSNibFileData");
    FILE.write(nibPath, data.bytes(), {charset: "UTF-16"});
    var converter = objj_msgSend(objj_msgSend(Converter, "alloc"), "initWithInputPath:outputPath:", nibPath, nil);
    self._data = objj_msgSend(converter, "convert");
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPCib, "NSNib"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSNib__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSNib__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPCib, "class");
}
,["Class"])]);
}