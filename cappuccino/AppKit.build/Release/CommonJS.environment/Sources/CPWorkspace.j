@STATIC;1.0;I;21;Foundation/CPString.jt;684;
objj_executeFile("Foundation/CPString.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPWorkspace"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("openFile:"),function(_4,_5,_6){
with(_4){
var _7=objj_msgSend(CPURL,"URLWithString:",_6);
return objj_msgSend(_4,"openURL:",_7);
}
}),new objj_method(sel_getUid("openURL:"),function(_8,_9,_a){
with(_8){
if(!_a||!objj_msgSend(_a,"absoluteURL")){
return NO;
}
window.open(objj_msgSend(_a,"absoluteURL"));
return YES;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedWorkspace"),function(_b,_c){
with(_b){
if(!_1){
_1=objj_msgSend(CPWorkspace,"new");
}
return _1;
}
})]);
