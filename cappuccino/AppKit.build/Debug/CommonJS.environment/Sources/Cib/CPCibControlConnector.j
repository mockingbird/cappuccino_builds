@STATIC;1.0;i;16;CPCibConnector.jt;2548;objj_executeFile("CPCibConnector.j", YES);{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibControlConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("establishConnection"), function $CPCibControlConnector__establishConnection(self, _cmd)
{
    var selectorName = self._label,
        selectorNameLength = (selectorName == null ? null : selectorName.isa.objj_msgSend0(selectorName, "length"));
    if (selectorNameLength && selectorName.charAt(selectorNameLength - 1) !== ':')
        selectorName += ':';
    var selector = CPSelectorFromString(selectorName);
    if (!selector)
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + self.isa.objj_msgSend0(self, "className") + ' ' + _cmd + "] selector " + selectorName + " does not exist.");
    }
    if (self._destination && !((___r1 = self._destination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", selector)))
        CPLog.warn("Could not connect the action " + selector + " to target of class " + ((___r1 = self._destination), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "className")));
    if (((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setAction:"))))
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", selector));
    else
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + self.isa.objj_msgSend0(self, "className") + ' ' + _cmd + "] " + ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + " does not respond to setAction:");
    if (((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setTarget:"))))
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self._destination));
    else
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + self.isa.objj_msgSend0(self, "className") + ' ' + _cmd + "] " + ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + " does not respond to setTarget:");
    var ___r1;
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPCibControlConnector, "_CPCibControlConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}