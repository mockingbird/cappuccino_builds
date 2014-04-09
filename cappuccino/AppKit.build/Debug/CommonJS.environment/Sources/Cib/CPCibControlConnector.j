@STATIC;1.0;i;16;CPCibConnector.jt;2002;objj_executeFile("CPCibConnector.j", YES);{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibControlConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("establishConnection"), function $CPCibControlConnector__establishConnection(self, _cmd)
{
    var selectorName = self._label,
        selectorNameLength = objj_msgSend(selectorName, "length");
    if (selectorNameLength && selectorName.charAt(selectorNameLength - 1) !== ':')
        selectorName += ':';
    var selector = CPSelectorFromString(selectorName);
    if (!selector)
    {
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + objj_msgSend(self, "className") + ' ' + _cmd + "] selector " + selectorName + " does not exist.");
    }
    if (self._destination && !objj_msgSend(self._destination, "respondsToSelector:", selector))
        CPLog.warn("Could not connect the action " + selector + " to target of class " + objj_msgSend(self._destination, "className"));
    if (objj_msgSend(self._source, "respondsToSelector:", sel_getUid("setAction:")))
        objj_msgSend(self._source, sel_getUid("setAction:"), selector);
    else
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + objj_msgSend(self, "className") + ' ' + _cmd + "] " + objj_msgSend(self._source, "description") + " does not respond to setAction:");
    if (objj_msgSend(self._source, "respondsToSelector:", sel_getUid("setTarget:")))
        objj_msgSend(self._source, sel_getUid("setTarget:"), self._destination);
    else
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + objj_msgSend(self, "className") + ' ' + _cmd + "] " + objj_msgSend(self._source, "description") + " does not respond to setTarget:");
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPCibControlConnector, "_CPCibControlConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}