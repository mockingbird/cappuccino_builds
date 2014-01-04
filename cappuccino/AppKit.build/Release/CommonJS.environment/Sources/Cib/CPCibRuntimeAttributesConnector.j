@STATIC;1.0;i;16;CPCibConnector.jt;1365;
objj_executeFile("CPCibConnector.j",YES);
var _1="CPCibRuntimeAttributesConnectorObjectKey",_2="CPCibRuntimeAttributesConnectorKeyPathsKey",_3="CPCibRuntimeAttributesConnectorValuesKey";
var _4=objj_allocateClassPair(CPCibConnector,"CPCibRuntimeAttributesConnector"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_keyPaths"),new objj_ivar("_values")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
if(_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPCibRuntimeAttributesConnector").super_class},"initWithCoder:",_8)){
_source=objj_msgSend(_8,"decodeObjectForKey:",_1);
_keyPaths=objj_msgSend(_8,"decodeObjectForKey:",_2);
_values=objj_msgSend(_8,"decodeObjectForKey:",_3);
}
return _6;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_9,_a,_b){
with(_9){
objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPCibRuntimeAttributesConnector").super_class},"encodeWithCoder:",_b);
objj_msgSend(_b,"encodeObject:forKey:",_source,_1);
objj_msgSend(_b,"encodeObject:forKey:",_keyPaths,_2);
objj_msgSend(_b,"encodeObject:forKey:",_values,_3);
}
}),new objj_method(sel_getUid("establishConnection"),function(_c,_d){
with(_c){
var _e=objj_msgSend(_keyPaths,"count");
while(_e--){
objj_msgSend(_source,"setValue:forKeyPath:",_values[_e],_keyPaths[_e]);
}
}
})]);
