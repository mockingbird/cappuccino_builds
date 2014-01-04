@STATIC;1.0;i;16;CPCibConnector.jt;1180;
objj_executeFile("CPCibConnector.j",YES);
var _1=objj_allocateClassPair(CPCibConnector,"CPCibHelpConnector"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_destination"),new objj_ivar("_file"),new objj_ivar("_marker")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPCibHelpConnector").super_class},"initWithCoder:",_5)){
_destination=objj_msgSend(_5,"decodeObjectForKey:","_destination");
_file=objj_msgSend(_5,"decodeObjectForKey:","_file");
_marker=objj_msgSend(_5,"decodeObjectForKey:","_marker");
}
return _3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_6,_7,_8){
with(_6){
objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPCibHelpConnector").super_class},"encodeWithCoder:",_8);
objj_msgSend(_8,"encodeObject:forKey:",_destination,"_destination");
objj_msgSend(_8,"encodeObject:forKey:",_file,"_file");
objj_msgSend(_8,"encodeObject:forKey:",_marker,"_marker");
}
}),new objj_method(sel_getUid("establishConnection"),function(_9,_a){
with(_9){
objj_msgSend(_destination,"setToolTip:",_marker);
}
})]);
