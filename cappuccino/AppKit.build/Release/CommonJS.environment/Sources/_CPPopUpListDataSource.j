@STATIC;1.0;I;21;Foundation/CPObject.jI;24;Foundation/CPException.jt;2274;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPException.j", NO);{var the_class = objj_allocateClassPair(CPObject, "_CPPopUpListDataSource"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("numberOfItemsInList:"), function $_CPPopUpListDataSource__numberOfItemsInList_(self, _cmd, aList)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["int","_CPPopUpList"]), new objj_method(sel_getUid("numberOfVisibleItemsInList:"), function $_CPPopUpListDataSource__numberOfVisibleItemsInList_(self, _cmd, aList)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["int","_CPPopUpList"]), new objj_method(sel_getUid("list:objectValueForItemAtIndex:"), function $_CPPopUpListDataSource__list_objectValueForItemAtIndex_(self, _cmd, aList, index)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["id","_CPPopUpList","int"]), new objj_method(sel_getUid("list:displayValueForObjectValue:"), function $_CPPopUpListDataSource__list_displayValueForObjectValue_(self, _cmd, aList, aValue)
{
    return aValue || "";
}
,["id","_CPPopUpList","id"]), new objj_method(sel_getUid("list:stringValueForObjectValue:"), function $_CPPopUpListDataSource__list_stringValueForObjectValue_(self, _cmd, aList, aValue)
{
    return String(aValue);
}
,["CPString","_CPPopUpList","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("protocolIsImplementedByObject:"), function $_CPPopUpListDataSource__protocolIsImplementedByObject_(self, _cmd, anObject)
{
    return anObject && (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "respondsToSelector:", sel_getUid("numberOfItemsInList:"))) && (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "respondsToSelector:", sel_getUid("numberOfVisibleItemsInList:"))) && (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "respondsToSelector:", sel_getUid("list:objectValueForItemAtIndex:"))) && (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "respondsToSelector:", sel_getUid("list:displayValueForObjectValue:"))) && (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "respondsToSelector:", sel_getUid("list:stringValueForObjectValue:")));
}
,["BOOL","id"])]);
}