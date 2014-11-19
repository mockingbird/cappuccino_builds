@STATIC;1.0;i;16;CPCibConnector.jt;2541;objj_executeFile("CPCibConnector.j", YES);var CPCibRuntimeAttributesConnectorObjectKey = "CPCibRuntimeAttributesConnectorObjectKey",
    CPCibRuntimeAttributesConnectorKeyPathsKey = "CPCibRuntimeAttributesConnectorKeyPathsKey",
    CPCibRuntimeAttributesConnectorValuesKey = "CPCibRuntimeAttributesConnectorValuesKey";
{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibRuntimeAttributesConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyPaths"), new objj_ivar("_values")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCibRuntimeAttributesConnector__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibRuntimeAttributesConnector").super_class }, "initWithCoder:", aCoder))
    {
        self._source = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPCibRuntimeAttributesConnectorObjectKey));
        self._keyPaths = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPCibRuntimeAttributesConnectorKeyPathsKey));
        self._values = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPCibRuntimeAttributesConnectorValuesKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCibRuntimeAttributesConnector__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibRuntimeAttributesConnector").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._source, CPCibRuntimeAttributesConnectorObjectKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._keyPaths, CPCibRuntimeAttributesConnectorKeyPathsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._values, CPCibRuntimeAttributesConnectorValuesKey));
}
,["void","CPCoder"]), new objj_method(sel_getUid("establishConnection"), function $CPCibRuntimeAttributesConnector__establishConnection(self, _cmd)
{
    var count = ((___r1 = self._keyPaths), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKeyPath:", self._values[count], self._keyPaths[count]));
    var ___r1;
}
,["void"])]);
}