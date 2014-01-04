@STATIC;1.0;i;16;CPCibConnector.jt;2195;

objj_executeFile("CPCibConnector.j", YES);

var CPCibRuntimeAttributesConnectorObjectKey = "CPCibRuntimeAttributesConnectorObjectKey",
    CPCibRuntimeAttributesConnectorKeyPathsKey = "CPCibRuntimeAttributesConnectorKeyPathsKey",
    CPCibRuntimeAttributesConnectorValuesKey = "CPCibRuntimeAttributesConnectorValuesKey";

{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibRuntimeAttributesConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyPaths"), new objj_ivar("_values")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCibRuntimeAttributesConnector__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibRuntimeAttributesConnector").super_class }, "initWithCoder:", aCoder))
    {
        _source = objj_msgSend(aCoder, "decodeObjectForKey:", CPCibRuntimeAttributesConnectorObjectKey);
        _keyPaths = objj_msgSend(aCoder, "decodeObjectForKey:", CPCibRuntimeAttributesConnectorKeyPathsKey);
        _values = objj_msgSend(aCoder, "decodeObjectForKey:", CPCibRuntimeAttributesConnectorValuesKey);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCibRuntimeAttributesConnector__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibRuntimeAttributesConnector").super_class }, "encodeWithCoder:", aCoder);

    objj_msgSend(aCoder, "encodeObject:forKey:", _source, CPCibRuntimeAttributesConnectorObjectKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _keyPaths, CPCibRuntimeAttributesConnectorKeyPathsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _values, CPCibRuntimeAttributesConnectorValuesKey);
}
},["void","CPCoder"]), new objj_method(sel_getUid("establishConnection"), function $CPCibRuntimeAttributesConnector__establishConnection(self, _cmd)
{ with(self)
{
    var count = objj_msgSend(_keyPaths, "count");

    while (count--)
        objj_msgSend(_source, "setValue:forKeyPath:", _values[count], _keyPaths[count]);
}
},["void"])]);
}

