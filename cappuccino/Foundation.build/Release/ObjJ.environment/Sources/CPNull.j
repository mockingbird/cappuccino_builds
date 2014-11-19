@STATIC;1.0;i;10;CPObject.jt;1156;objj_executeFile("CPObject.j", YES);var CPNullSharedNull = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPNull"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isEqual:"), function $CPNull__isEqual_(self, _cmd, anObject)
{
    if (self === anObject)
        return YES;
    return (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "isKindOfClass:", CPNull.isa.objj_msgSend0(CPNull, "class")));
}
,["BOOL","id"]), new objj_method(sel_getUid("initWithCoder:"), function $CPNull__initWithCoder_(self, _cmd, aCoder)
{
    return CPNull.isa.objj_msgSend0(CPNull, "null");
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPNull__encodeWithCoder_(self, _cmd, aCoder)
{
}
,["void","CPCoder"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("null"), function $CPNull__null(self, _cmd)
{
    if (!CPNullSharedNull)
        CPNullSharedNull = ((___r1 = CPNull.isa.objj_msgSend0(CPNull, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return CPNullSharedNull;
    var ___r1;
}
,["CPNull"])]);
}