@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;2517;objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPFormatter"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("stringForObjectValue:"), function $CPFormatter__stringForObjectValue_(self, _cmd, anObject)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["CPString","id"]), new objj_method(sel_getUid("editingStringForObjectValue:"), function $CPFormatter__editingStringForObjectValue_(self, _cmd, anObject)
{
    return self.isa.objj_msgSend1(self, "stringForObjectValue:", anObject);
}
,["CPString","id"]), new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"), function $CPFormatter__getObjectValue_forString_errorDescription_(self, _cmd, anObject, aString, anError)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return NO;
}
,["BOOL","idRef","CPString","CPStringRef"]), new objj_method(sel_getUid("isPartialStringValid:newEditingString:errorDescription:"), function $CPFormatter__isPartialStringValid_newEditingString_errorDescription_(self, _cmd, aPartialString, aNewString, anError)
{
    (aPartialString)(nil);
    if (anError)
        (anError)(nil);
    return YES;
}
,["BOOL","CPString","CPStringRef","CPStringRef"]), new objj_method(sel_getUid("isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:"), function $CPFormatter__isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription_(self, _cmd, aPartialStringRef, aProposedSelectedRangeRef, originalString, originalSelectedRange, anError)
{
    var newString = nil,
        valid = self.isa.objj_msgSend3(self, "isPartialStringValid:newEditingString:errorDescription:", aPartialStringRef, function(__input) { if (arguments.length) return newString = __input; return newString; }, anError);
    if (!valid)
    {
        (aPartialStringRef)(newString);
        if (newString !== nil)
            (aProposedSelectedRangeRef)(CPMakeRange(newString.length, 0));
    }
    return valid;
}
,["BOOL","CPStringRef","CPRangeRef","CPString","CPRange","CPStringRef"]), new objj_method(sel_getUid("initWithCoder:"), function $CPFormatter__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend0(self, "init");
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPFormatter__encodeWithCoder_(self, _cmd, aCoder)
{
}
,["void","CPCoder"])]);
}