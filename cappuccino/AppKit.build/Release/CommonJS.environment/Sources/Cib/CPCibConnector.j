@STATIC;1.0;I;21;Foundation/CPObject.jI;29;Foundation/CPKeyValueCoding.jt;3883;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPKeyValueCoding.j", NO);var _CPCibConnectorSourceKey = "_CPCibConnectorSourceKey",
    _CPCibConnectorDestinationKey = "_CPCibConnectorDestinationKey",
    _CPCibConnectorLabelKey = "_CPCibConnectorLabelKey";
{var the_class = objj_allocateClassPair(CPObject, "CPCibConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_source"), new objj_ivar("_destination"), new objj_ivar("_label")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("source"), function $CPCibConnector__source(self, _cmd)
{
    return self._source;
}
,["id"]), new objj_method(sel_getUid("setSource:"), function $CPCibConnector__setSource_(self, _cmd, newValue)
{
    self._source = newValue;
}
,["void","id"]), new objj_method(sel_getUid("destination"), function $CPCibConnector__destination(self, _cmd)
{
    return self._destination;
}
,["id"]), new objj_method(sel_getUid("setDestination:"), function $CPCibConnector__setDestination_(self, _cmd, newValue)
{
    self._destination = newValue;
}
,["void","id"]), new objj_method(sel_getUid("label"), function $CPCibConnector__label(self, _cmd)
{
    return self._label;
}
,["CPString"]), new objj_method(sel_getUid("setLabel:"), function $CPCibConnector__setLabel_(self, _cmd, newValue)
{
    self._label = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("replaceObject:withObject:"), function $CPCibConnector__replaceObject_withObject_(self, _cmd, anObject, anotherObject)
{
    if (self._source === anObject)
        self._source = anotherObject;
    if (self._destination === anObject)
        self._destination = anotherObject;
}
,["void","id","id"]), new objj_method(sel_getUid("replaceObjects:"), function $CPCibConnector__replaceObjects_(self, _cmd, replacementObjects)
{
    var replacement = replacementObjects[((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"))];
    if (replacement !== undefined)
        self._source = replacement;
    replacement = replacementObjects[((___r1 = self._destination), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"))];
    if (replacement !== undefined)
        self._destination = replacement;
    var ___r1;
}
,["void","Object"])]);
}{
var the_class = objj_getClass("CPCibConnector")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCibConnector\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCibConnector__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCibConnector").super_class }, "init");
    if (self)
    {
        self._source = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibConnectorSourceKey));
        self._destination = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibConnectorDestinationKey));
        self._label = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibConnectorLabelKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCibConnector__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._source, _CPCibConnectorSourceKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._destination, _CPCibConnectorDestinationKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._label, _CPCibConnectorLabelKey));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPCibConnector, "_CPCibConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}