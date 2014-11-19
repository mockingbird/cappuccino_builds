@STATIC;1.0;I;21;Foundation/CPObject.jI;26;Foundation/CPObjJRuntime.jt;2754;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPObjJRuntime.j", NO);var _CPCibCustomObjectClassName = "_CPCibCustomObjectClassName";
{var the_class = objj_allocateClassPair(CPObject, "_CPCibCustomObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("customClassName"), function $_CPCibCustomObject__customClassName(self, _cmd)
{
    return self._className;
}
,["CPString"]), new objj_method(sel_getUid("setCustomClassName:"), function $_CPCibCustomObject__setCustomClassName_(self, _cmd, aClassName)
{
    self._className = aClassName;
}
,["void","CPString"]), new objj_method(sel_getUid("description"), function $_CPCibCustomObject__description(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibCustomObject").super_class }, "description") + " (" + self.isa.objj_msgSend0(self, "customClassName") + ')';
}
,["CPString"])]);
}{
var the_class = objj_getClass("_CPCibCustomObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibCustomObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPCibCustomObject__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibCustomObject").super_class }, "init");
    if (self)
        self._className = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibCustomObjectClassName));
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibCustomObject__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._className, _CPCibCustomObjectClassName));
}
,["void","CPCoder"]), new objj_method(sel_getUid("_cibInstantiate"), function $_CPCibCustomObject___cibInstantiate(self, _cmd)
{
    var theClass = CPClassFromString(self._className);
    if (theClass === self.isa.objj_msgSend0(self, "class"))
    {
        self._className = "CPObject";
        return self;
    }
    if (!theClass)
    {
        theClass = CPObject.isa.objj_msgSend0(CPObject, "class");
    }
    if (theClass === (CPApplication == null ? null : CPApplication.isa.objj_msgSend0(CPApplication, "class")))
        return (CPApplication == null ? null : CPApplication.isa.objj_msgSend0(CPApplication, "sharedApplication"));
    return ((___r1 = (theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"])]);
}