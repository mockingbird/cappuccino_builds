@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;2605;objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPCoder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("allowsKeyedCoding"), function $CPCoder__allowsKeyedCoding(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("encodeValueOfObjCType:at:"), function $CPCoder__encodeValueOfObjCType_at_(self, _cmd, aType, anObject)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","CPString","id"]), new objj_method(sel_getUid("encodeDataObject:"), function $CPCoder__encodeDataObject_(self, _cmd, aData)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","CPData"]), new objj_method(sel_getUid("encodeObject:"), function $CPCoder__encodeObject_(self, _cmd, anObject)
{
}
,["void","id"]), new objj_method(sel_getUid("encodePoint:"), function $CPCoder__encodePoint_(self, _cmd, aPoint)
{
    objj_msgSend(self, "encodeNumber:", aPoint.x);
    objj_msgSend(self, "encodeNumber:", aPoint.y);
}
,["void","CGPoint"]), new objj_method(sel_getUid("encodeRect:"), function $CPCoder__encodeRect_(self, _cmd, aRect)
{
    objj_msgSend(self, "encodePoint:", aRect.origin);
    objj_msgSend(self, "encodeSize:", aRect.size);
}
,["void","CGRect"]), new objj_method(sel_getUid("encodeSize:"), function $CPCoder__encodeSize_(self, _cmd, aSize)
{
    objj_msgSend(self, "encodeNumber:", aSize.width);
    objj_msgSend(self, "encodeNumber:", aSize.height);
}
,["void","CGSize"]), new objj_method(sel_getUid("encodePropertyList:"), function $CPCoder__encodePropertyList_(self, _cmd, aPropertyList)
{
}
,["void","id"]), new objj_method(sel_getUid("encodeRootObject:"), function $CPCoder__encodeRootObject_(self, _cmd, anObject)
{
    objj_msgSend(self, "encodeObject:", anObject);
}
,["void","id"]), new objj_method(sel_getUid("encodeBycopyObject:"), function $CPCoder__encodeBycopyObject_(self, _cmd, anObject)
{
    objj_msgSend(self, "encodeObject:", anObject);
}
,["void","id"]), new objj_method(sel_getUid("encodeConditionalObject:"), function $CPCoder__encodeConditionalObject_(self, _cmd, anObject)
{
    objj_msgSend(self, "encodeObject:", anObject);
}
,["void","id"])]);
}{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("awakeAfterUsingCoder:"), function $CPObject__awakeAfterUsingCoder_(self, _cmd, aDecoder)
{
    return self;
}
,["id","CPCoder"])]);
}