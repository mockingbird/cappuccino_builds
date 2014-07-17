@STATIC;1.0;i;10;CPObject.ji;23;_CPConcreteMutableSet.jt;2004;objj_executeFile("CPObject.j", YES);objj_executeFile("_CPConcreteMutableSet.j", YES);{var the_class = objj_allocateClassPair(_CPConcreteMutableSet, "CPCountedSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_counts")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("addObject:"), function $CPCountedSet__addObject_(self, _cmd, anObject)
{
    if (!self._counts)
        self._counts = {};
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCountedSet").super_class }, "addObject:", anObject);
    var UID = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"));
    if (self._counts[UID] === undefined)
        self._counts[UID] = 1;
    else
        ++self._counts[UID];
}
,["void","id"]), new objj_method(sel_getUid("removeObject:"), function $CPCountedSet__removeObject_(self, _cmd, anObject)
{
    if (!self._counts)
        return;
    var UID = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"));
    if (self._counts[UID] === undefined)
        return;
    else
    {
        --self._counts[UID];
        if (self._counts[UID] === 0)
        {
            delete self._counts[UID];
            objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCountedSet").super_class }, "removeObject:", anObject);
        }
    }
}
,["void","id"]), new objj_method(sel_getUid("removeAllObjects"), function $CPCountedSet__removeAllObjects(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCountedSet").super_class }, "removeAllObjects");
    self._counts = {};
}
,["void"]), new objj_method(sel_getUid("countForObject:"), function $CPCountedSet__countForObject_(self, _cmd, anObject)
{
    if (!self._counts)
        self._counts = {};
    var UID = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"));
    if (self._counts[UID] === undefined)
        return 0;
    return self._counts[UID];
}
,["unsigned","id"])]);
}