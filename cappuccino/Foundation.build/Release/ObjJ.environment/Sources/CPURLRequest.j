@STATIC;1.0;i;14;CPDictionary.ji;10;CPObject.ji;10;CPString.ji;7;CPURL.jt;2258;
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPURL.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPURLRequest"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_URL"),new objj_ivar("_HTTPBody"),new objj_ivar("_HTTPMethod"),new objj_ivar("_HTTPHeaderFields")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithURL:",nil);
}
}),new objj_method(sel_getUid("initWithURL:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPURLRequest").super_class},"init");
if(_5){
objj_msgSend(_5,"setURL:",_7);
_HTTPBody="";
_HTTPMethod="GET";
_HTTPHeaderFields=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_5,"setValue:forHTTPHeaderField:","Thu, 01 Jan 1970 00:00:00 GMT","If-Modified-Since");
objj_msgSend(_5,"setValue:forHTTPHeaderField:","no-cache","Cache-Control");
objj_msgSend(_5,"setValue:forHTTPHeaderField:","XMLHttpRequest","X-Requested-With");
}
return _5;
}
}),new objj_method(sel_getUid("URL"),function(_8,_9){
with(_8){
return _URL;
}
}),new objj_method(sel_getUid("setURL:"),function(_a,_b,_c){
with(_a){
_URL=new CFURL(_c);
}
}),new objj_method(sel_getUid("setHTTPBody:"),function(_d,_e,_f){
with(_d){
_HTTPBody=_f;
}
}),new objj_method(sel_getUid("HTTPBody"),function(_10,_11){
with(_10){
return _HTTPBody;
}
}),new objj_method(sel_getUid("setHTTPMethod:"),function(_12,_13,_14){
with(_12){
_HTTPMethod=_14;
}
}),new objj_method(sel_getUid("HTTPMethod"),function(_15,_16){
with(_15){
return _HTTPMethod;
}
}),new objj_method(sel_getUid("allHTTPHeaderFields"),function(_17,_18){
with(_17){
return _HTTPHeaderFields;
}
}),new objj_method(sel_getUid("valueForHTTPHeaderField:"),function(_19,_1a,_1b){
with(_19){
return objj_msgSend(_HTTPHeaderFields,"objectForKey:",_1b);
}
}),new objj_method(sel_getUid("setValue:forHTTPHeaderField:"),function(_1c,_1d,_1e,_1f){
with(_1c){
objj_msgSend(_HTTPHeaderFields,"setObject:forKey:",_1e,_1f);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("requestWithURL:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(objj_msgSend(CPURLRequest,"alloc"),"initWithURL:",_22);
}
})]);
