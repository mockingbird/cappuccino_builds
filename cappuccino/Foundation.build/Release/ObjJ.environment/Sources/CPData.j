@STATIC;1.0;i;10;CPObject.ji;10;CPString.jt;4823;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPData"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithRawString:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPData").super_class},"init");
if(_3){
objj_msgSend(_3,"setRawString:",_5);
}
return _3;
}
}),new objj_method(sel_getUid("initWithPlistObject:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPData").super_class},"init");
if(_6){
objj_msgSend(_6,"setPlistObject:",_8);
}
return _6;
}
}),new objj_method(sel_getUid("initWithPlistObject:format:"),function(_9,_a,_b,_c){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPData").super_class},"init");
if(_9){
objj_msgSend(_9,"setPlistObject:format:",_b,_c);
}
return _9;
}
}),new objj_method(sel_getUid("initWithJSONObject:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPData").super_class},"init");
if(_d){
objj_msgSend(_d,"setJSONObject:",_f);
}
return _d;
}
}),new objj_method(sel_getUid("rawString"),function(_10,_11){
with(_10){
return _10.rawString();
}
}),new objj_method(sel_getUid("plistObject"),function(_12,_13){
with(_12){
return _12.propertyList();
}
}),new objj_method(sel_getUid("JSONObject"),function(_14,_15){
with(_14){
return _14.JSONObject();
}
}),new objj_method(sel_getUid("bytes"),function(_16,_17){
with(_16){
return _16.bytes();
}
}),new objj_method(sel_getUid("base64"),function(_18,_19){
with(_18){
return _18.base64();
}
}),new objj_method(sel_getUid("length"),function(_1a,_1b){
with(_1a){
return objj_msgSend(objj_msgSend(_1a,"rawString"),"length");
}
}),new objj_method(sel_getUid("description"),function(_1c,_1d){
with(_1c){
return _1c.toString();
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_1e,_1f){
with(_1e){
var _20=new CFMutableData();
_20.isa=objj_msgSend(_1e,"class");
return _20;
}
}),new objj_method(sel_getUid("data"),function(_21,_22){
with(_21){
return objj_msgSend(objj_msgSend(_21,"alloc"),"init");
}
}),new objj_method(sel_getUid("dataWithRawString:"),function(_23,_24,_25){
with(_23){
return objj_msgSend(objj_msgSend(_23,"alloc"),"initWithRawString:",_25);
}
}),new objj_method(sel_getUid("dataWithPlistObject:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(objj_msgSend(_26,"alloc"),"initWithPlistObject:",_28);
}
}),new objj_method(sel_getUid("dataWithPlistObject:format:"),function(_29,_2a,_2b,_2c){
with(_29){
return objj_msgSend(objj_msgSend(_29,"alloc"),"initWithPlistObject:format:",_2b,_2c);
}
}),new objj_method(sel_getUid("dataWithJSONObject:"),function(_2d,_2e,_2f){
with(_2d){
return objj_msgSend(objj_msgSend(_2d,"alloc"),"initWithJSONObject:",_2f);
}
}),new objj_method(sel_getUid("dataWithBytes:"),function(_30,_31,_32){
with(_30){
var _33=objj_msgSend(objj_msgSend(_30,"alloc"),"init");
_33.setBytes(_32);
return _33;
}
}),new objj_method(sel_getUid("dataWithBase64:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(objj_msgSend(_34,"alloc"),"init");
_37.setBase64String(_36);
return _37;
}
})]);
var _1=objj_getClass("CPData");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPData\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setRawString:"),function(_38,_39,_3a){
with(_38){
_38.setRawString(_3a);
}
}),new objj_method(sel_getUid("setPlistObject:"),function(_3b,_3c,_3d){
with(_3b){
_3b.setPropertyList(_3d);
}
}),new objj_method(sel_getUid("setPlistObject:format:"),function(_3e,_3f,_40,_41){
with(_3e){
_3e.setPropertyList(_40,_41);
}
}),new objj_method(sel_getUid("setJSONObject:"),function(_42,_43,_44){
with(_42){
_42.setJSONObject(_44);
}
})]);
var _1=objj_getClass("CPData");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPData\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:"),function(_45,_46,_47){
with(_45){
_CPReportLenientDeprecation(_45,_46,sel_getUid("initWithRawString:"));
return objj_msgSend(_45,"initWithRawString:",_47);
}
}),new objj_method(sel_getUid("setString:"),function(_48,_49,_4a){
with(_48){
_CPReportLenientDeprecation(_48,_49,sel_getUid("setRawString:"));
objj_msgSend(_48,"setRawString:",_4a);
}
}),new objj_method(sel_getUid("string"),function(_4b,_4c){
with(_4b){
_CPReportLenientDeprecation(_4b,_4c,sel_getUid("rawString"));
return objj_msgSend(_4b,"rawString");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("dataWithString:"),function(_4d,_4e,_4f){
with(_4d){
_CPReportLenientDeprecation(_4d,_4e,sel_getUid("dataWithRawString:"));
return objj_msgSend(_4d,"dataWithRawString:",_4f);
}
})]);
CFData.prototype.isa=CPData;
CFMutableData.prototype.isa=CPData;
