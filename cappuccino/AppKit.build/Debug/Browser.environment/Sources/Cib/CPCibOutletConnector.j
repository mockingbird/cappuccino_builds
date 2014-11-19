@STATIC;1.0;i;16;CPCibConnector.jt;1085;objj_executeFile("CPCibConnector.j", YES);{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibOutletConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("establishConnection"), function $CPCibOutletConnector__establishConnection(self, _cmd)
{
    try    {
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", self._destination, self._label));
    }
    catch(anException)     {
        if ((anException == null ? null : anException.isa.objj_msgSend0(anException, "name")) === CPUndefinedKeyException)
            CPLog.warn("Could not connect the outlet " + self._label + " of target of class " + ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "className")));
        else
            throw anException;
        var ___r1;
    }    var ___r1;
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPCibOutletConnector, "_CPCibOutletConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}