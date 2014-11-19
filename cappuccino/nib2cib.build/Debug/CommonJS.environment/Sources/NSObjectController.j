@STATIC;1.0;I;27;AppKit/CPObjectController.jt;1912;objj_executeFile("AppKit/CPObjectController.j", NO);{
var the_class = objj_getClass("CPObjectController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObjectController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPObjectController__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObjectController").super_class }, "init");
    if (self)
    {
        self._declaredKeys = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSDeclaredKeys"));
        var className = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSObjectClassName"));
        if (className)
            self._objectClassName = CP_NSMapClassName(className);
        else
            self._objectClass = CPMutableDictionary.isa.objj_msgSend0(CPMutableDictionary, "class");
        self._isEditable = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSEditable"));
        self._automaticallyPreparesContent = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSAutomaticallyPreparesContent"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPObjectController, "NSObjectController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSObjectController__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSObjectController__classForKeyedArchiver(self, _cmd)
{
    return CPObjectController.isa.objj_msgSend0(CPObjectController, "class");
}
,["Class"])]);
}