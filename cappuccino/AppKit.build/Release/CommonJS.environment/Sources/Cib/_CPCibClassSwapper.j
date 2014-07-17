@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;2381;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);var _CPCibClassSwapperClassNameKey = "_CPCibClassSwapperClassNameKey",
    _CPCibClassSwapperOriginalClassNameKey = "_CPCibClassSwapperOriginalClassNameKey";
{var the_class = objj_allocateClassPair(CPObject, "_CPCibClassSwapper"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("allocObjectWithCoder:className:"), function $_CPCibClassSwapper__allocObjectWithCoder_className_(self, _cmd, aCoder, aClassName)
{
    var theClass = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "classForClassName:", aClassName));
    if (!theClass)
    {
        theClass = objj_lookUpClass(aClassName);
        if (!theClass)
            return nil;
    }
    return (theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "alloc"));
}
,["void","CPCoder","CPString"]), new objj_method(sel_getUid("allocWithCoder:"), function $_CPCibClassSwapper__allocWithCoder_(self, _cmd, aCoder)
{
    if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "respondsToSelector:", sel_getUid("usesOriginalClasses"))) && (aCoder == null ? null : aCoder.isa.objj_msgSend0(aCoder, "usesOriginalClasses")))
    {
        var theClassName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibClassSwapperOriginalClassNameKey)),
            object = self.isa.objj_msgSend2(self, "allocObjectWithCoder:className:", aCoder, theClassName);
    }
    else
    {
        var theClassName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibClassSwapperClassNameKey)),
            object = self.isa.objj_msgSend2(self, "allocObjectWithCoder:className:", aCoder, theClassName);
        if (!object)
        {
            CPLog.error("Unable to find class " + theClassName + " referenced in cib file.");
            object = self.isa.objj_msgSend2(self, "allocObjectWithCoder:className:", aCoder, (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibClassSwapperOriginalClassNameKey)));
        }
    }
    if (!object)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Unable to find class " + theClassName + " referenced in cib file.");
    return object;
}
,["id","CPCoder"])]);
}