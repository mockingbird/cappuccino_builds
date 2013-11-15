@STATIC;1.0;I;31;AppKit/CPDictionaryController.jt;1380;objj_executeFile("AppKit/CPDictionaryController.j", NO);{
var the_class = objj_getClass("CPDictionaryController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDictionaryController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPDictionaryController__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDictionaryController").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        self._includedKeys = objj_msgSend(aCoder, "decodeObjectForKey:", "NSIncludedKeys");
        self._excludedKeys = objj_msgSend(aCoder, "decodeObjectForKey:", "NSExcludedKeys");
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPDictionaryController, "NSDictionaryController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSDictionaryController__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSDictionaryController__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPDictionaryController, "class");
}
,["Class"])]);
}