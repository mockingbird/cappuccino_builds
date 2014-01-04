@STATIC;1.0;i;16;CPCibConnector.jt;1581;


objj_executeFile("CPCibConnector.j", YES);

{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibHelpConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_destination"), new objj_ivar("_file"), new objj_ivar("_marker")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCibHelpConnector__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibHelpConnector").super_class }, "initWithCoder:", aCoder))
    {
        _destination = objj_msgSend(aCoder, "decodeObjectForKey:", "_destination");
        _file = objj_msgSend(aCoder, "decodeObjectForKey:", "_file");
        _marker = objj_msgSend(aCoder, "decodeObjectForKey:", "_marker");
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCibHelpConnector__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibHelpConnector").super_class }, "encodeWithCoder:", aCoder);

    objj_msgSend(aCoder, "encodeObject:forKey:", _destination, "_destination");
    objj_msgSend(aCoder, "encodeObject:forKey:", _file, "_file");
    objj_msgSend(aCoder, "encodeObject:forKey:", _marker, "_marker");
}
},["void","CPCoder"]), new objj_method(sel_getUid("establishConnection"), function $CPCibHelpConnector__establishConnection(self, _cmd)
{ with(self)
{
    objj_msgSend(_destination, "setToolTip:", _marker);
}
},["void"])]);
}

