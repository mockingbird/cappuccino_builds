@STATIC;1.0;i;16;CPCibConnector.jt;2295;objj_executeFile("CPCibConnector.j", YES);var CPCibBindingConnectorBindingKey = "CPCibBindingConnectorBindingKey",
    CPCibBindingConnectorKeyPathKey = "CPCibBindingConnectorKeyPathKey",
    CPCibBindingConnectorOptionsKey = "CPCibBindingConnectorOptionsKey";
{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibBindingConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_binding"), new objj_ivar("_keyPath"), new objj_ivar("_options")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCibBindingConnector__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibBindingConnector").super_class }, "initWithCoder:", aCoder))
    {
        self._binding = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPCibBindingConnectorBindingKey));
        self._keyPath = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPCibBindingConnectorKeyPathKey));
        self._options = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPCibBindingConnectorOptionsKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCibBindingConnector__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibBindingConnector").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._binding, CPCibBindingConnectorBindingKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._keyPath, CPCibBindingConnectorKeyPathKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._options, CPCibBindingConnectorOptionsKey));
}
,["void","CPCoder"]), new objj_method(sel_getUid("establishConnection"), function $CPCibBindingConnector__establishConnection(self, _cmd)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "bind:toObject:withKeyPath:options:", self._binding, self._destination, self._keyPath, self._options));
    var ___r1;
}
,["void"])]);
}