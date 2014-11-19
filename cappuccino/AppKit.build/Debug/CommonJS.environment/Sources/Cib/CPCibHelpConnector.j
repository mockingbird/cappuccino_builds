@STATIC;1.0;i;16;CPCibConnector.jt;1865;objj_executeFile("CPCibConnector.j", YES);{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibHelpConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_destination"), new objj_ivar("_file"), new objj_ivar("_marker")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCibHelpConnector__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibHelpConnector").super_class }, "initWithCoder:", aCoder))
    {
        self._destination = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "_destination"));
        self._file = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "_file"));
        self._marker = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "_marker"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCibHelpConnector__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibHelpConnector").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._destination, "_destination"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._file, "_file"));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._marker, "_marker"));
}
,["void","CPCoder"]), new objj_method(sel_getUid("establishConnection"), function $CPCibHelpConnector__establishConnection(self, _cmd)
{
    ((___r1 = self._destination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setToolTip:", self._marker));
    var ___r1;
}
,["void"])]);
}