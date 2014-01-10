@STATIC;1.0;i;16;CPCibConnector.jt;2192;objj_executeFile("CPCibConnector.j", YES);var CPCibRuntimeAttributesConnectorObjectKey = "CPCibRuntimeAttributesConnectorObjectKey",
    CPCibRuntimeAttributesConnectorKeyPathsKey = "CPCibRuntimeAttributesConnectorKeyPathsKey",
    CPCibRuntimeAttributesConnectorValuesKey = "CPCibRuntimeAttributesConnectorValuesKey";
{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibRuntimeAttributesConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyPaths"), new objj_ivar("_values")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCibRuntimeAttributesConnector__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibRuntimeAttributesConnector").super_class }, "initWithCoder:", aCoder))
    {
        self._source = objj_msgSend(aCoder, "decodeObjectForKey:", CPCibRuntimeAttributesConnectorObjectKey);
        self._keyPaths = objj_msgSend(aCoder, "decodeObjectForKey:", CPCibRuntimeAttributesConnectorKeyPathsKey);
        self._values = objj_msgSend(aCoder, "decodeObjectForKey:", CPCibRuntimeAttributesConnectorValuesKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCibRuntimeAttributesConnector__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibRuntimeAttributesConnector").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._source, CPCibRuntimeAttributesConnectorObjectKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._keyPaths, CPCibRuntimeAttributesConnectorKeyPathsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._values, CPCibRuntimeAttributesConnectorValuesKey);
}
,["void","CPCoder"]), new objj_method(sel_getUid("establishConnection"), function $CPCibRuntimeAttributesConnector__establishConnection(self, _cmd)
{
    var count = objj_msgSend(self._keyPaths, "count");
    while (count--)
        objj_msgSend(self._source, "setValue:forKeyPath:", self._values[count], self._keyPaths[count]);
}
,["void"])]);
}