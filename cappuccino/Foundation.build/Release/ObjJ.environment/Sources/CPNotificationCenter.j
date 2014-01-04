@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;16;CPNotification.ji;8;CPNull.jt;6487;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPNotification.j",YES);
objj_executeFile("CPNull.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPNotificationCenter"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_namedRegistries"),new objj_ivar("_unnamedRegistry")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPNotificationCenter").super_class},"init");
if(_4){
_namedRegistries=objj_msgSend(CPDictionary,"dictionary");
_unnamedRegistry=objj_msgSend(objj_msgSend(_CPNotificationRegistry,"alloc"),"init");
}
return _4;
}
}),new objj_method(sel_getUid("addObserver:selector:name:object:"),function(_6,_7,_8,_9,_a,_b){
with(_6){
var _c,_d=objj_msgSend(objj_msgSend(_CPNotificationObserver,"alloc"),"initWithObserver:selector:",_8,_9);
if(_a==nil){
_c=_unnamedRegistry;
}else{
if(!(_c=objj_msgSend(_namedRegistries,"objectForKey:",_a))){
_c=objj_msgSend(objj_msgSend(_CPNotificationRegistry,"alloc"),"init");
objj_msgSend(_namedRegistries,"setObject:forKey:",_c,_a);
}
}
objj_msgSend(_c,"addObserver:object:",_d,_b);
}
}),new objj_method(sel_getUid("removeObserver:"),function(_e,_f,_10){
with(_e){
var _11=nil,_12=objj_msgSend(_namedRegistries,"keyEnumerator");
while((_11=objj_msgSend(_12,"nextObject"))!==nil){
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_11),"removeObserver:object:",_10,nil);
}
objj_msgSend(_unnamedRegistry,"removeObserver:object:",_10,nil);
}
}),new objj_method(sel_getUid("removeObserver:name:object:"),function(_13,_14,_15,_16,_17){
with(_13){
if(_16==nil){
var _18=nil,_19=objj_msgSend(_namedRegistries,"keyEnumerator");
while((_18=objj_msgSend(_19,"nextObject"))!==nil){
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_18),"removeObserver:object:",_15,_17);
}
objj_msgSend(_unnamedRegistry,"removeObserver:object:",_15,_17);
}else{
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_16),"removeObserver:object:",_15,_17);
}
}
}),new objj_method(sel_getUid("postNotification:"),function(_1a,_1b,_1c){
with(_1a){
if(!_1c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"postNotification: does not except 'nil' notifications");
}
_1d(_1a,_1c);
}
}),new objj_method(sel_getUid("postNotificationName:object:userInfo:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
_1d(_1e,objj_msgSend(objj_msgSend(CPNotification,"alloc"),"initWithName:object:userInfo:",_20,_21,_22));
}
}),new objj_method(sel_getUid("postNotificationName:object:"),function(_23,_24,_25,_26){
with(_23){
_1d(_23,objj_msgSend(objj_msgSend(CPNotification,"alloc"),"initWithName:object:userInfo:",_25,_26,nil));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("defaultCenter"),function(_27,_28){
with(_27){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPNotificationCenter,"alloc"),"init");
}
return _1;
}
})]);
var _1d=function(_29,_2a){
objj_msgSend(_29._unnamedRegistry,"postNotification:",_2a);
objj_msgSend(objj_msgSend(_29._namedRegistries,"objectForKey:",objj_msgSend(_2a,"name")),"postNotification:",_2a);
};
var _2=objj_allocateClassPair(CPObject,"_CPNotificationRegistry"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_objectObservers")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_2b,_2c){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("_CPNotificationRegistry").super_class},"init");
if(_2b){
_objectObservers=objj_msgSend(CPDictionary,"dictionary");
}
return _2b;
}
}),new objj_method(sel_getUid("addObserver:object:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(!_30){
_30=objj_msgSend(CPNull,"null");
}
var _31=objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(_30,"UID"));
if(!_31){
_31=objj_msgSend(CPMutableSet,"set");
objj_msgSend(_objectObservers,"setObject:forKey:",_31,objj_msgSend(_30,"UID"));
}
objj_msgSend(_31,"addObject:",_2f);
}
}),new objj_method(sel_getUid("removeObserver:object:"),function(_32,_33,_34,_35){
with(_32){
var _36=[];
if(_35==nil){
var key=nil,_37=objj_msgSend(_objectObservers,"keyEnumerator");
while((key=objj_msgSend(_37,"nextObject"))!==nil){
var _38=objj_msgSend(_objectObservers,"objectForKey:",key),_39=nil,_3a=objj_msgSend(_38,"objectEnumerator");
while((_39=objj_msgSend(_3a,"nextObject"))!==nil){
if(objj_msgSend(_39,"observer")==_34){
objj_msgSend(_38,"removeObject:",_39);
}
}
if(!objj_msgSend(_38,"count")){
_36.push(key);
}
}
}else{
var key=objj_msgSend(_35,"UID"),_38=objj_msgSend(_objectObservers,"objectForKey:",key),_39=nil,_3a=objj_msgSend(_38,"objectEnumerator");
while((_39=objj_msgSend(_3a,"nextObject"))!==nil){
if(objj_msgSend(_39,"observer")==_34){
objj_msgSend(_38,"removeObject:",_39);
}
}
if(!objj_msgSend(_38,"count")){
_36.push(key);
}
}
var _3b=_36.length;
while(_3b--){
objj_msgSend(_objectObservers,"removeObjectForKey:",_36[_3b]);
}
}
}),new objj_method(sel_getUid("postNotification:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSend(_3e,"object"),_40=nil;
if(_3f!=nil&&(_40=objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(_3f,"UID")))){
var _41=objj_msgSend(_40,"copy"),_42=nil,_43=objj_msgSend(_41,"objectEnumerator");
while((_42=objj_msgSend(_43,"nextObject"))!==nil){
if(objj_msgSend(_40,"containsObject:",_42)){
objj_msgSend(_42,"postNotification:",_3e);
}
}
}
_40=objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(objj_msgSend(CPNull,"null"),"UID"));
if(!_40){
return;
}
var _41=objj_msgSend(_40,"copy"),_43=objj_msgSend(_41,"objectEnumerator");
while((_42=objj_msgSend(_43,"nextObject"))!==nil){
if(objj_msgSend(_40,"containsObject:",_42)){
objj_msgSend(_42,"postNotification:",_3e);
}
}
}
}),new objj_method(sel_getUid("count"),function(_44,_45){
with(_44){
return objj_msgSend(_objectObservers,"count");
}
})]);
var _2=objj_allocateClassPair(CPObject,"_CPNotificationObserver"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_observer"),new objj_ivar("_selector")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithObserver:selector:"),function(_46,_47,_48,_49){
with(_46){
if(_46){
_observer=_48;
_selector=_49;
}
return _46;
}
}),new objj_method(sel_getUid("observer"),function(_4a,_4b){
with(_4a){
return _observer;
}
}),new objj_method(sel_getUid("postNotification:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_observer,"performSelector:withObject:",_selector,_4e);
}
})]);
