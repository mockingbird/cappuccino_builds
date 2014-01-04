@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jt;2063;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
var _1=new RegExp("\"(.+)\"\\s*=\\s*\"(.+)\"\\s*;\\s*(//.+)?");
var _2=objj_allocateClassPair(CPObject,"_CPRuleEditorLocalizer"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_dictionary"),new objj_ivar("connection"),new objj_ivar("resquest")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("dictionary"),function(_4,_5){
with(_4){
return _dictionary;
}
}),new objj_method(sel_getUid("setDictionary:"),function(_6,_7,_8){
with(_6){
_dictionary=_8;
}
}),new objj_method(sel_getUid("loadContentOfURL:"),function(_9,_a,_b){
with(_9){
request=objj_msgSend(CPURLRequest,"requestWithURL:",_b);
connection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",request,_9);
}
}),new objj_method(sel_getUid("reloadIfNeeded"),function(_c,_d){
with(_c){
if(connection!==nil){
connection=nil;
var _e=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",request,NULL);
objj_msgSend(_c,"loadContent:",objj_msgSend(_e,"rawString"));
}
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_f,_10,_11,_12){
with(_f){
if(connection!==nil&&_12!==nil){
objj_msgSend(_f,"loadContent:",_12);
}
connection=nil;
}
}),new objj_method(sel_getUid("loadContent:"),function(_13,_14,_15){
with(_13){
var _16=objj_msgSend(CPDictionary,"dictionary"),_17=objj_msgSend(_15,"componentsSeparatedByString:","\n"),_18=objj_msgSend(_17,"count");
for(var i=0;i<_18;i++){
var _19=objj_msgSend(_17,"objectAtIndex:",i);
if(_19.length>1){
var _1a=_1.exec(_19);
if(_1a&&_1a.length>=3){
objj_msgSend(_16,"setObject:forKey:",_1a[2],_1a[1]);
}
}
}
_dictionary=objj_msgSend(CPDictionary,"dictionaryWithDictionary:",_16);
}
}),new objj_method(sel_getUid("localizedStringForString:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"reloadIfNeeded");
if(_dictionary!==nil&&_1d!==nil){
var _1e=objj_msgSend(_dictionary,"objectForKey:",_1d);
if(_1e!==nil){
return _1e;
}
}
return _1d;
}
})]);
