@STATIC;1.0;t;2118;

{var the_class = objj_allocateClassPair(CPObject, "_CPPopUpListDataSource"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("numberOfItemsInList:"), function $_CPPopUpListDataSource__numberOfItemsInList_(self, _cmd, aList)
{ with(self)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
},["int","_CPPopUpList"]), new objj_method(sel_getUid("numberOfVisibleItemsInList:"), function $_CPPopUpListDataSource__numberOfVisibleItemsInList_(self, _cmd, aList)
{ with(self)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
},["int","_CPPopUpList"]), new objj_method(sel_getUid("list:objectValueForItemAtIndex:"), function $_CPPopUpListDataSource__list_objectValueForItemAtIndex_(self, _cmd, aList, index)
{ with(self)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
},["id","_CPPopUpList","int"]), new objj_method(sel_getUid("list:displayValueForObjectValue:"), function $_CPPopUpListDataSource__list_displayValueForObjectValue_(self, _cmd, aList, aValue)
{ with(self)
{
    return aValue || "";
}
},["id","_CPPopUpList","id"]), new objj_method(sel_getUid("list:stringValueForObjectValue:"), function $_CPPopUpListDataSource__list_stringValueForObjectValue_(self, _cmd, aList, aValue)
{ with(self)
{
   return String(aValue);
}
},["CPString","_CPPopUpList","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("protocolIsImplementedByObject:"), function $_CPPopUpListDataSource__protocolIsImplementedByObject_(self, _cmd, anObject)
{ with(self)
{
    return (anObject &&
            objj_msgSend(anObject, "respondsToSelector:", sel_getUid("numberOfItemsInList:")) &&
            objj_msgSend(anObject, "respondsToSelector:", sel_getUid("numberOfVisibleItemsInList:")) &&
            objj_msgSend(anObject, "respondsToSelector:", sel_getUid("list:objectValueForItemAtIndex:")) &&
            objj_msgSend(anObject, "respondsToSelector:", sel_getUid("list:displayValueForObjectValue:")) &&
            objj_msgSend(anObject, "respondsToSelector:", sel_getUid("list:stringValueForObjectValue:")));
}
},["BOOL","id"])]);
}

