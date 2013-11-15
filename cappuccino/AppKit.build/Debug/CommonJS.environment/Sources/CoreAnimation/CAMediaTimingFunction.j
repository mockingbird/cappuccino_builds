@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jt;3253;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPString.j", NO);kCAMediaTimingFunctionLinear = "kCAMediaTimingFunctionLinear";
kCAMediaTimingFunctionEaseIn = "kCAMediaTimingFunctionEaseIn";
kCAMediaTimingFunctionEaseOut = "kCAMediaTimingFunctionEaseOut";
kCAMediaTimingFunctionEaseInEaseOut = "kCAMediaTimingFunctionEaseInEaseOut";
var CAMediaNamedTimingFunctions = nil;
{var the_class = objj_allocateClassPair(CPObject, "CAMediaTimingFunction"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_c1x"), new objj_ivar("_c1y"), new objj_ivar("_c2x"), new objj_ivar("_c2y")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithControlPoints::::"), function $CAMediaTimingFunction__initWithControlPoints____(self, _cmd, c1x, c1y, c2x, c2y)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CAMediaTimingFunction").super_class }, "init");
    if (self)
    {
        self._c1x = c1x;
        self._c1y = c1y;
        self._c2x = c2x;
        self._c2y = c2y;
    }
    return self;
}
,["id","float","float","float","float"]), new objj_method(sel_getUid("getControlPointAtIndex:values:"), function $CAMediaTimingFunction__getControlPointAtIndex_values_(self, _cmd, anIndex, reference)
{
    if (anIndex == 0)
    {
        reference[0] = 0;
        reference[1] = 0;
    }
    else if (anIndex == 1)
    {
        reference[0] = self._c1x;
        reference[1] = self._c1y;
    }
    else if (anIndex == 2)
    {
        reference[0] = self._c2x;
        reference[1] = self._c2y;
    }
    else
    {
        reference[0] = 1.0;
        reference[1] = 1.0;
    }
}
,["void","unsigned","float"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("functionWithName:"), function $CAMediaTimingFunction__functionWithName_(self, _cmd, aName)
{
    if (!CAMediaNamedTimingFunctions)
    {
        CAMediaNamedTimingFunctions = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.0, 0.0, 1.0, 1.0), kCAMediaTimingFunctionLinear);
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.42, 0.0, 1.0, 1.0), kCAMediaTimingFunctionEaseIn);
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.0, 0.0, 0.58, 1.0), kCAMediaTimingFunctionEaseOut);
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.42, 0.0, 0.58, 1.0), kCAMediaTimingFunctionEaseInEaseOut);
    }
    return objj_msgSend(CAMediaNamedTimingFunctions, "objectForKey:", aName);
}
,["id","CPString"]), new objj_method(sel_getUid("functionWithControlPoints::::"), function $CAMediaTimingFunction__functionWithControlPoints____(self, _cmd, c1x, c1y, c2x, c2y)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithControlPoints::::", c1x, c1y, c2x, c2y);
}
,["id","float","float","float","float"])]);
}