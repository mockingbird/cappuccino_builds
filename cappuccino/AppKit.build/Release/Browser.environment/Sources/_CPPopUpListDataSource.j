@STATIC;1.0;t;1336;
var _1=objj_allocateClassPair(CPObject,"_CPPopUpListDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("numberOfItemsInList:"),function(_3,_4,_5){
with(_3){
_CPRaiseInvalidAbstractInvocation(_3,_4);
}
}),new objj_method(sel_getUid("numberOfVisibleItemsInList:"),function(_6,_7,_8){
with(_6){
_CPRaiseInvalidAbstractInvocation(_6,_7);
}
}),new objj_method(sel_getUid("list:objectValueForItemAtIndex:"),function(_9,_a,_b,_c){
with(_9){
_CPRaiseInvalidAbstractInvocation(_9,_a);
}
}),new objj_method(sel_getUid("list:displayValueForObjectValue:"),function(_d,_e,_f,_10){
with(_d){
return _10||"";
}
}),new objj_method(sel_getUid("list:stringValueForObjectValue:"),function(_11,_12,_13,_14){
with(_11){
return String(_14);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("protocolIsImplementedByObject:"),function(_15,_16,_17){
with(_15){
return (_17&&objj_msgSend(_17,"respondsToSelector:",sel_getUid("numberOfItemsInList:"))&&objj_msgSend(_17,"respondsToSelector:",sel_getUid("numberOfVisibleItemsInList:"))&&objj_msgSend(_17,"respondsToSelector:",sel_getUid("list:objectValueForItemAtIndex:"))&&objj_msgSend(_17,"respondsToSelector:",sel_getUid("list:displayValueForObjectValue:"))&&objj_msgSend(_17,"respondsToSelector:",sel_getUid("list:stringValueForObjectValue:")));
}
})]);
