@STATIC;1.0;I;21;Foundation/CPObject.jt;1483;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "_CPCibProxyObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier")]);objj_registerClassPair(the_class);
}var _CPCibProxyObjectIdentifierKey = "CPIdentifier";
{
var the_class = objj_getClass("_CPCibProxyObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibProxyObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPCibProxyObject__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibProxyObject").super_class }, "init");
    if (self)
        self._identifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibProxyObjectIdentifierKey));
    if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "respondsToSelector:", sel_getUid("externalObjectForProxyIdentifier:"))))
        return (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "externalObjectForProxyIdentifier:", self._identifier));
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibProxyObject__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._identifier, _CPCibProxyObjectIdentifierKey));
}
,["void","CPCoder"])]);
}