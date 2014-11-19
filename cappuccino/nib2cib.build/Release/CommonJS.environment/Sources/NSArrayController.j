@STATIC;1.0;I;26;AppKit/CPArrayController.jt;2259;objj_executeFile("AppKit/CPArrayController.j", NO);{
var the_class = objj_getClass("CPArrayController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArrayController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPArrayController__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArrayController").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        self._avoidsEmptySelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSAvoidsEmptySelection"));
        self._clearsFilterPredicateOnInsertion = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSClearsFilterPredicateOnInsertion"));
        self._filterRestrictsInsertion = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSFilterRestrictsInsertion"));
        self._preservesSelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSPreservesSelection"));
        self._selectsInsertedObjects = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSSelectsInsertedObjects"));
        self._alwaysUsesMultipleValuesMarker = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSAlwaysUsesMultipleValuesMarker"));
        self._automaticallyRearrangesObjects = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSAutomaticallyRearrangesObjects"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPArrayController, "NSArrayController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSArrayController__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSArrayController__classForKeyedArchiver(self, _cmd)
{
    return CPArrayController.isa.objj_msgSend0(CPArrayController, "class");
}
,["Class"])]);
}