@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;12;CPIndexSet.ji;8;CPNull.ji;10;CPObject.ji;7;CPSet.ji;21;CPKeyValueObserving.jt;10536;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPIndexSet.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPSet.j",YES);
CPUndefinedKeyException="CPUndefinedKeyException";
CPTargetObjectUserInfoKey="CPTargetObjectUserInfoKey";
CPUnknownUserInfoKey="CPUnknownUserInfoKey";
var _1="$CPObjectAccessorsForClassKey",_2="$CPObjectModifiersForClassKey";
var _3=objj_getClass("CPObject");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("valueForKey:"),function(_5,_6,_7){
with(_5){
var _8=objj_msgSend(_5,"class"),_9=nil,_a=_8[_1];
if(!_a){
_a=_8[_1]={};
}
if(_a.hasOwnProperty(_7)){
_9=_a[_7];
}else{
var _b=nil,_c=_7.charAt(0).toUpperCase()+_7.substr(1),_d=nil,_e=nil;
if(objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid("get"+_c))||objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid(_7))||objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid((_e="is"+_c)))||objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid("_get"+_c))||objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid((_d="_"+_7)))||objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid("_"+_e))){
_9=_a[_7]=[0,_b];
}else{
if(objj_msgSend(_8,"instancesRespondToSelector:",sel_getUid("countOf"+_c))){
if(objj_msgSend(_8,"instancesRespondToSelector:",sel_getUid("objectIn"+_c+"AtIndex:"))||objj_msgSend(_8,"instancesRespondToSelector:",sel_getUid(_7+"AtIndexes:"))){
_9=_a[_7]=[1];
}else{
if(objj_msgSend(_8,"instancesRespondToSelector:",sel_getUid("enumeratorOf"+_c))&&objj_msgSend(_8,"instancesRespondToSelector:",sel_getUid("memberOf"+_c+":"))){
_9=_a[_7]=[2];
}
}
}
}
if(!_9){
if(class_getInstanceVariable(_8,_b=_d)||class_getInstanceVariable(_8,_b="_"+_e)||class_getInstanceVariable(_8,_b=_7)||class_getInstanceVariable(_8,_b=_e)){
_9=_a[_7]=[3,_b];
}else{
_9=_a[_7]=[];
}
}
}
switch(_9[0]){
case 0:
return objj_msgSend(_5,_9[1]);
case 1:
return objj_msgSend(objj_msgSend(_CPKeyValueCodingArray,"alloc"),"initWithTarget:key:",_5,_7);
case 2:
return objj_msgSend(objj_msgSend(_CPKeyValueCodingSet,"alloc"),"initWithTarget:key:",_5,_7);
case 3:
if(objj_msgSend(_8,"accessInstanceVariablesDirectly")){
return _5[_9[1]];
}
}
return objj_msgSend(_5,"valueForUndefinedKey:",_7);
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_f,_10,_11){
with(_f){
var _12=_11.indexOf(".");
if(_12===CPNotFound){
return objj_msgSend(_f,"valueForKey:",_11);
}
var _13=_11.substring(0,_12),_14=_11.substring(_12+1),_15=objj_msgSend(_f,"valueForKey:",_13);
return objj_msgSend(_15,"valueForKeyPath:",_14);
}
}),new objj_method(sel_getUid("dictionaryWithValuesForKeys:"),function(_16,_17,_18){
with(_16){
var _19=0,_1a=_18.length,_1b=objj_msgSend(CPDictionary,"dictionary");
for(;_19<_1a;++_19){
var key=_18[_19],_1c=objj_msgSend(_16,"valueForKey:",key);
if(_1c===nil){
objj_msgSend(_1b,"setObject:forKey:",objj_msgSend(CPNull,"null"),key);
}else{
objj_msgSend(_1b,"setObject:forKey:",_1c,key);
}
}
return _1b;
}
}),new objj_method(sel_getUid("valueForUndefinedKey:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:",CPUndefinedKeyException,objj_msgSend(_1d,"_objectDescription")+" is not key value coding-compliant for the key "+_1f,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_1d,_1f],[CPTargetObjectUserInfoKey,CPUnknownUserInfoKey])),"raise");
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_20,_21,_22,_23){
with(_20){
if(!_23){
_23="self";
}
var _24=_23.indexOf(".");
if(_24===CPNotFound){
return objj_msgSend(_20,"setValue:forKey:",_22,_23);
}
var _25=_23.substring(0,_24),_26=_23.substring(_24+1),_27=objj_msgSend(_20,"valueForKey:",_25);
return objj_msgSend(_27,"setValue:forKeyPath:",_22,_26);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_28,_29,_2a,_2b){
with(_28){
var _2c=objj_msgSend(_28,"class"),_2d=nil,_2e=_2c[_2];
if(!_2e){
_2e=_2c[_2]={};
}
if(_2e.hasOwnProperty(_2b)){
_2d=_2e[_2b];
}else{
var _2f=nil,_30=_2b.charAt(0).toUpperCase()+_2b.substr(1),_31=nil;
if(objj_msgSend(_2c,"instancesRespondToSelector:",_2f=sel_getUid("set"+_30+":"))||objj_msgSend(_2c,"instancesRespondToSelector:",_2f=sel_getUid("_set"+_30+":"))){
_2d=_2e[_2b]=[0,_2f];
}else{
if(class_getInstanceVariable(_2c,_2f="_"+_2b)||class_getInstanceVariable(_2c,_2f="_"+(_31="is"+_30))||class_getInstanceVariable(_2c,_2f=_2b)||class_getInstanceVariable(_2c,_2f=_31)){
_2d=_2e[_2b]=[1,_2f];
}else{
_2d=_2e[_2b]=[];
}
}
}
switch(_2d[0]){
case 0:
return objj_msgSend(_28,_2d[1],_2a);
case 1:
if(objj_msgSend(_2c,"accessInstanceVariablesDirectly")){
objj_msgSend(_28,"willChangeValueForKey:",_2b);
_28[_2d[1]]=_2a;
return objj_msgSend(_28,"didChangeValueForKey:",_2b);
}
}
return objj_msgSend(_28,"setValue:forUndefinedKey:",_2a,_2b);
}
}),new objj_method(sel_getUid("setValuesForKeysWithDictionary:"),function(_32,_33,_34){
with(_32){
var _35,key,_36=objj_msgSend(_34,"keyEnumerator");
while((key=objj_msgSend(_36,"nextObject"))!==nil){
_35=objj_msgSend(_34,"objectForKey:",key);
if(_35===objj_msgSend(CPNull,"null")){
objj_msgSend(_32,"setValue:forKey:",nil,key);
}else{
objj_msgSend(_32,"setValue:forKey:",_35,key);
}
}
}
}),new objj_method(sel_getUid("setValue:forUndefinedKey:"),function(_37,_38,_39,_3a){
with(_37){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:",CPUndefinedKeyException,objj_msgSend(_37,"_objectDescription")+" is not key value coding-compliant for the key "+_3a,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_37,_3a],[CPTargetObjectUserInfoKey,CPUnknownUserInfoKey])),"raise");
}
}),new objj_method(sel_getUid("_objectDescription"),function(_3b,_3c){
with(_3b){
return "<"+objj_msgSend(_3b,"className")+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_3b,"UID"))+">";
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("accessInstanceVariablesDirectly"),function(_3d,_3e){
with(_3d){
return YES;
}
})]);
var _3=objj_getClass("CPDictionary");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("valueForKey:"),function(_3f,_40,_41){
with(_3f){
if(objj_msgSend(_41,"hasPrefix:","@")){
return objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("CPDictionary").super_class},"valueForKey:",_41.substr(1));
}
return objj_msgSend(_3f,"objectForKey:",_41);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_42,_43,_44,_45){
with(_42){
if(_44!==nil){
objj_msgSend(_42,"setObject:forKey:",_44,_45);
}else{
objj_msgSend(_42,"removeObjectForKey:",_45);
}
}
})]);
var _3=objj_getClass("CPNull");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPNull\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("valueForKey:"),function(_46,_47,_48){
with(_46){
return _46;
}
})]);
var _3=objj_allocateClassPair(CPArray,"_CPKeyValueCodingArray"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_target"),new objj_ivar("_countOfSelector"),new objj_ivar("_objectInAtIndexSelector"),new objj_ivar("_atIndexesSelector")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithTarget:key:"),function(_49,_4a,_4b,_4c){
with(_49){
_49=objj_msgSendSuper({receiver:_49,super_class:objj_getClass("_CPKeyValueCodingArray").super_class},"init");
if(_49){
var _4d=_4c.charAt(0).toUpperCase()+_4c.substr(1);
_target=_4b;
_countOfSelector=CPSelectorFromString("countOf"+_4d);
_objectInAtIndexSelector=CPSelectorFromString("objectIn"+_4d+"AtIndex:");
if(!objj_msgSend(_target,"respondsToSelector:",_objectInAtIndexSelector)){
_objectInAtIndexSelector=nil;
}
_atIndexesSelector=CPSelectorFromString(_4c+"AtIndexes:");
if(!objj_msgSend(_target,"respondsToSelector:",_atIndexesSelector)){
_atIndexesSelector=nil;
}
}
return _49;
}
}),new objj_method(sel_getUid("count"),function(_4e,_4f){
with(_4e){
return objj_msgSend(_target,_countOfSelector);
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_50,_51,_52){
with(_50){
if(_objectInAtIndexSelector){
return objj_msgSend(_target,_objectInAtIndexSelector,_52);
}
return objj_msgSend(_target,_atIndexesSelector,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_52))[0];
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_53,_54,_55){
with(_53){
if(_atIndexesSelector){
return objj_msgSend(_target,_atIndexesSelector,_55);
}
return objj_msgSendSuper({receiver:_53,super_class:objj_getClass("_CPKeyValueCodingArray").super_class},"objectsAtIndexes:",_55);
}
}),new objj_method(sel_getUid("classForCoder"),function(_56,_57){
with(_56){
return objj_msgSend(CPArray,"class");
}
}),new objj_method(sel_getUid("copy"),function(_58,_59){
with(_58){
return objj_msgSend(CPArray,"arrayWithArray:",_58);
}
})]);
var _3=objj_allocateClassPair(CPSet,"_CPKeyValueCodingSet"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_target"),new objj_ivar("_countOfSelector"),new objj_ivar("_enumeratorOfSelector"),new objj_ivar("_memberOfSelector")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithObjects:count:"),function(_5a,_5b,_5c,_5d){
with(_5a){
return objj_msgSend(objj_msgSend(CPSet,"alloc"),"initWithObjects:count:",_5c,_5d);
}
}),new objj_method(sel_getUid("initWithTarget:key:"),function(_5e,_5f,_60,_61){
with(_5e){
_5e=objj_msgSendSuper({receiver:_5e,super_class:objj_getClass("_CPKeyValueCodingSet").super_class},"initWithObjects:count:",nil,0);
if(_5e){
var _62=_61.charAt(0).toUpperCase()+_61.substr(1);
_target=_60;
_countOfSelector=CPSelectorFromString("countOf"+_62);
_enumeratorOfSelector=CPSelectorFromString("enumeratorOf"+_62);
_memberOfSelector=CPSelectorFromString("memberOf"+_62+":");
}
return _5e;
}
}),new objj_method(sel_getUid("count"),function(_63,_64){
with(_63){
return objj_msgSend(_target,_countOfSelector);
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_65,_66){
with(_65){
return objj_msgSend(_target,_enumeratorOfSelector);
}
}),new objj_method(sel_getUid("member:"),function(_67,_68,_69){
with(_67){
return objj_msgSend(_target,_memberOfSelector,_69);
}
}),new objj_method(sel_getUid("classForCoder"),function(_6a,_6b){
with(_6a){
return objj_msgSend(CPSet,"class");
}
}),new objj_method(sel_getUid("copy"),function(_6c,_6d){
with(_6c){
return objj_msgSend(CPSet,"setWithSet:",_6c);
}
})]);
objj_executeFile("CPKeyValueObserving.j",YES);
