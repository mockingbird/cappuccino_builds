@STATIC;1.0;i;9;CPArray.ji;14;CPEnumerator.ji;13;CPException.ji;8;CPNull.ji;10;CPObject.jt;10268;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPEnumerator,"_CPDictionaryValueEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_keyEnumerator"),new objj_ivar("_dictionary")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithDictionary:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_CPDictionaryValueEnumerator").super_class},"init");
if(_3){
_keyEnumerator=objj_msgSend(_5,"keyEnumerator");
_dictionary=_5;
}
return _3;
}
}),new objj_method(sel_getUid("nextObject"),function(_6,_7){
with(_6){
var _8=objj_msgSend(_keyEnumerator,"nextObject");
if(_8===nil){
return nil;
}
return objj_msgSend(_dictionary,"objectForKey:",_8);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithDictionary:"),function(_9,_a,_b){
with(_9){
var _c="",_d=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
for(_c in _b._buckets){
objj_msgSend(_d,"setObject:forKey:",objj_msgSend(_b,"objectForKey:",_c),_c);
}
return _d;
}
}),new objj_method(sel_getUid("initWithObjects:forKeys:"),function(_e,_f,_10,_11){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPDictionary").super_class},"init");
if(objj_msgSend(_10,"count")!=objj_msgSend(_11,"count")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Counts are different.("+objj_msgSend(_10,"count")+"!="+objj_msgSend(_11,"count")+")");
}
if(_e){
var i=objj_msgSend(_11,"count");
while(i--){
objj_msgSend(_e,"setObject:forKey:",_10[i],_11[i]);
}
}
return _e;
}
}),new objj_method(sel_getUid("initWithObjectsAndKeys:"),function(_12,_13,_14){
with(_12){
var _15=arguments.length;
if(_15%2!==0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Key-value count is mismatched. ("+_15+" arguments passed)");
}
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPDictionary").super_class},"init");
if(_12){
var _16=2;
for(;_16<_15;_16+=2){
var _17=arguments[_16];
if(_17===nil){
break;
}
objj_msgSend(_12,"setObject:forKey:",_17,arguments[_16+1]);
}
}
return _12;
}
}),new objj_method(sel_getUid("copy"),function(_18,_19){
with(_18){
return objj_msgSend(CPDictionary,"dictionaryWithDictionary:",_18);
}
}),new objj_method(sel_getUid("count"),function(_1a,_1b){
with(_1a){
return _count;
}
}),new objj_method(sel_getUid("allKeys"),function(_1c,_1d){
with(_1c){
return objj_msgSend(_keys,"copy");
}
}),new objj_method(sel_getUid("allValues"),function(_1e,_1f){
with(_1e){
var _20=_keys.length,_21=[];
while(_20--){
_21.push(_1e.valueForKey(_keys[_20]));
}
return _21;
}
}),new objj_method(sel_getUid("allKeysForObject:"),function(_22,_23,_24){
with(_22){
var _25=_keys.length,_26=0,_27=[],key=nil,_28=nil;
for(;_26<_25;++_26){
key=_keys[_26];
_28=_buckets[key];
if(_28.isa&&_24&&_24.isa&&objj_msgSend(_28,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(_28,"isEqual:",_24)){
_27.push(key);
}else{
if(_28===_24){
_27.push(key);
}
}
}
return _27;
}
}),new objj_method(sel_getUid("keysOfEntriesPassingTest:"),function(_29,_2a,_2b){
with(_29){
return objj_msgSend(_29,"keysOfEntriesWithOptions:passingTest:",CPEnumerationNormal,_2b);
}
}),new objj_method(sel_getUid("keysOfEntriesWithOptions:passingTest:"),function(_2c,_2d,_2e,_2f){
with(_2c){
if(_2e&CPEnumerationReverse){
var _30=objj_msgSend(_keys,"count")-1,_31=-1,_32=-1;
}else{
var _30=0,_31=objj_msgSend(_keys,"count"),_32=1;
}
var _33=[],key=nil,_34=nil,_35=NO,_36=function(_37){
if(arguments.length){
return _35=_37;
}
return _35;
};
for(;_30!==_31;_30+=_32){
key=_keys[_30];
_34=_buckets[key];
if(_2f(key,_34,_36)){
_33.push(key);
}
if(_35){
break;
}
}
return _33;
}
}),new objj_method(sel_getUid("keysSortedByValueUsingComparator:"),function(_38,_39,_3a){
with(_38){
return objj_msgSend(objj_msgSend(_38,"allKeys"),"sortedArrayUsingFunction:",function(a,b){
a=objj_msgSend(_38,"objectForKey:",a);
b=objj_msgSend(_38,"objectForKey:",b);
return _3a(a,b);
});
}
}),new objj_method(sel_getUid("keysSortedByValueUsingSelector:"),function(_3b,_3c,_3d){
with(_3b){
return objj_msgSend(objj_msgSend(_3b,"allKeys"),"sortedArrayUsingFunction:",function(a,b){
a=objj_msgSend(_3b,"objectForKey:",a);
b=objj_msgSend(_3b,"objectForKey:",b);
return objj_msgSend(a,"performSelector:withObject:",_3d,b);
});
}
}),new objj_method(sel_getUid("keyEnumerator"),function(_3e,_3f){
with(_3e){
return objj_msgSend(_keys,"objectEnumerator");
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_40,_41){
with(_40){
return objj_msgSend(objj_msgSend(_CPDictionaryValueEnumerator,"alloc"),"initWithDictionary:",_40);
}
}),new objj_method(sel_getUid("isEqualToDictionary:"),function(_42,_43,_44){
with(_42){
if(_42===_44){
return YES;
}
var _45=objj_msgSend(_42,"count");
if(_45!==objj_msgSend(_44,"count")){
return NO;
}
var _46=_45;
while(_46--){
var _47=_keys[_46],_48=_buckets[_47],_49=_44._buckets[_47];
if(_48===_49){
continue;
}
if(_48&&_48.isa&&_49&&_49.isa&&objj_msgSend(_48,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(_48,"isEqual:",_49)){
continue;
}
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_4a,_4b,_4c){
with(_4a){
if(_4a===_4c){
return YES;
}
if(!objj_msgSend(_4c,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
return NO;
}
return objj_msgSend(_4a,"isEqualToDictionary:",_4c);
}
}),new objj_method(sel_getUid("objectForKey:"),function(_4d,_4e,_4f){
with(_4d){
var _50=_buckets[_4f];
return (_50===undefined)?nil:_50;
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_51,_52){
with(_51){
_51.removeAllValues();
}
}),new objj_method(sel_getUid("removeObjectForKey:"),function(_53,_54,_55){
with(_53){
_53.removeValueForKey(_55);
}
}),new objj_method(sel_getUid("removeObjectsForKeys:"),function(_56,_57,_58){
with(_56){
var _59=_58.length;
while(_59--){
objj_msgSend(_56,"removeObjectForKey:",_58[_59]);
}
}
}),new objj_method(sel_getUid("setObject:forKey:"),function(_5a,_5b,_5c,_5d){
with(_5a){
_5a.setValueForKey(_5d,_5c);
}
}),new objj_method(sel_getUid("addEntriesFromDictionary:"),function(_5e,_5f,_60){
with(_5e){
if(!_60){
return;
}
var _61=objj_msgSend(_60,"allKeys"),_62=objj_msgSend(_61,"count");
while(_62--){
var key=_61[_62];
objj_msgSend(_5e,"setObject:forKey:",objj_msgSend(_60,"objectForKey:",key),key);
}
}
}),new objj_method(sel_getUid("description"),function(_63,_64){
with(_63){
var _65="@{\n",_66=_keys,_67=0,_68=_count;
for(;_67<_68;++_67){
var key=_66[_67],_69=valueForKey(key);
_65+="\t"+key+": "+CPDescriptionOfObject(_69).split("\n").join("\n\t")+",\n";
}
return _65+"}";
}
}),new objj_method(sel_getUid("containsKey:"),function(_6a,_6b,_6c){
with(_6a){
var _6d=objj_msgSend(_6a,"objectForKey:",_6c);
return ((_6d!==nil)&&(_6d!==undefined));
}
}),new objj_method(sel_getUid("enumerateKeysAndObjectsUsingBlock:"),function(_6e,_6f,_70){
with(_6e){
var _71=NO,_72=function(_73){
if(arguments.length){
return _71=_73;
}
return _71;
};
for(var _74=0;_74<_count;_74++){
var key=_keys[_74],_75=valueForKey(key);
_70(key,_75,_72);
if(_71){
return;
}
}
}
}),new objj_method(sel_getUid("enumerateKeysAndObjectsWithOptions:usingBlock:"),function(_76,_77,_78,_79){
with(_76){
objj_msgSend(_76,"enumerateKeysAndObjectsUsingBlock:",_79);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_7a,_7b){
with(_7a){
var _7c=new CFMutableDictionary();
_7c.isa=objj_msgSend(_7a,"class");
return _7c;
}
}),new objj_method(sel_getUid("dictionary"),function(_7d,_7e){
with(_7d){
return objj_msgSend(objj_msgSend(_7d,"alloc"),"init");
}
}),new objj_method(sel_getUid("dictionaryWithDictionary:"),function(_7f,_80,_81){
with(_7f){
return objj_msgSend(objj_msgSend(_7f,"alloc"),"initWithDictionary:",_81);
}
}),new objj_method(sel_getUid("dictionaryWithObject:forKey:"),function(_82,_83,_84,_85){
with(_82){
return objj_msgSend(objj_msgSend(_82,"alloc"),"initWithObjects:forKeys:",[_84],[_85]);
}
}),new objj_method(sel_getUid("dictionaryWithObjects:forKeys:"),function(_86,_87,_88,_89){
with(_86){
return objj_msgSend(objj_msgSend(_86,"alloc"),"initWithObjects:forKeys:",_88,_89);
}
}),new objj_method(sel_getUid("dictionaryWithJSObject:"),function(_8a,_8b,_8c){
with(_8a){
return objj_msgSend(_8a,"dictionaryWithJSObject:recursively:",_8c,NO);
}
}),new objj_method(sel_getUid("dictionaryWithJSObject:recursively:"),function(_8d,_8e,_8f,_90){
with(_8d){
var key="",_91=objj_msgSend(objj_msgSend(_8d,"alloc"),"init");
for(key in _8f){
if(!_8f.hasOwnProperty(key)){
continue;
}
var _92=_8f[key];
if(_92===null){
objj_msgSend(_91,"setObject:forKey:",objj_msgSend(CPNull,"null"),key);
continue;
}
if(_90){
if(_92.constructor===Object){
_92=objj_msgSend(CPDictionary,"dictionaryWithJSObject:recursively:",_92,YES);
}else{
if(objj_msgSend(_92,"isKindOfClass:",CPArray)){
var _93=[],i=0,_94=_92.length;
for(;i<_94;i++){
var _95=_92[i];
if(_95===null){
_93.push(objj_msgSend(CPNull,"null"));
}else{
if(_95.constructor===Object){
_93.push(objj_msgSend(CPDictionary,"dictionaryWithJSObject:recursively:",_95,YES));
}else{
_93.push(_95);
}
}
}
_92=_93;
}
}
}
objj_msgSend(_91,"setObject:forKey:",_92,key);
}
return _91;
}
}),new objj_method(sel_getUid("dictionaryWithObjectsAndKeys:"),function(_96,_97,_98){
with(_96){
arguments[0]=objj_msgSend(_96,"alloc");
arguments[1]=sel_getUid("initWithObjectsAndKeys:");
return objj_msgSend.apply(this,arguments);
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_99,_9a,_9b){
with(_99){
return objj_msgSend(_9b,"_decodeDictionaryOfObjectsForKey:","CP.objects");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_9c,_9d,_9e){
with(_9c){
objj_msgSend(_9e,"_encodeDictionaryOfObjects:forKey:",_9c,"CP.objects");
}
})]);
var _1=objj_allocateClassPair(CPDictionary,"CPMutableDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
CFDictionary.prototype.isa=CPDictionary;
CFMutableDictionary.prototype.isa=CPMutableDictionary;
