@STATIC;1.0;i;16;CPMutableArray.jt;7090;
objj_executeFile("CPMutableArray.j",YES);
var _1=Array.prototype.concat,_2=Array.prototype.indexOf,_3=Array.prototype.join,_4=Array.prototype.pop,_5=Array.prototype.push,_6=Array.prototype.slice,_7=Array.prototype.splice;
var _8=objj_allocateClassPair(CPMutableArray,"_CPJavaScriptArray"),_9=_8.isa;
objj_registerClassPair(_8);
class_addMethods(_8,[new objj_method(sel_getUid("initWithArray:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"initWithArray:copyItems:",_c,NO);
}
}),new objj_method(sel_getUid("initWithArray:copyItems:"),function(_d,_e,_f,_10){
with(_d){
if(!_10&&objj_msgSend(_f,"isKindOfClass:",_CPJavaScriptArray)){
return _6.call(_f,0);
}
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("_CPJavaScriptArray").super_class},"init");
var _11=0;
if(objj_msgSend(_f,"isKindOfClass:",_CPJavaScriptArray)){
var _12=_f.length;
for(;_11<_12;++_11){
var _13=_f[_11];
_d[_11]=(_13&&_13.isa)?objj_msgSend(_13,"copy"):_13;
}
return _d;
}
var _12=objj_msgSend(_f,"count");
for(;_11<_12;++_11){
var _13=objj_msgSend(_f,"objectAtIndex:",_11);
_d[_11]=(_10&&_13&&_13.isa)?objj_msgSend(_13,"copy"):_13;
}
return _d;
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_14,_15,_16){
with(_14){
var _17=2,_18=arguments.length;
for(;_17<_18;++_17){
if(arguments[_17]===nil){
break;
}
}
return _6.call(arguments,2,_17);
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_19,_1a,_1b,_1c){
with(_19){
if(objj_msgSend(_1b,"isKindOfClass:",_CPJavaScriptArray)){
return _6.call(_1b,0);
}
var _1d=[],_1e=0;
for(;_1e<_1c;++_1e){
_5.call(_1d,objj_msgSend(_1b,"objectAtIndex:",_1e));
}
return _1d;
}
}),new objj_method(sel_getUid("initWithCapacity:"),function(_1f,_20,_21){
with(_1f){
return _1f;
}
}),new objj_method(sel_getUid("count"),function(_22,_23){
with(_22){
return _22.length;
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_24,_25,_26){
with(_24){
if(_26>=_24.length||_26<0){
_CPRaiseRangeException(_24,_25,_26,_24.length);
}
return _24[_26];
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_27,_28,_29,_2a){
with(_27){
if(_29&&_29.isa){
var _2b=_2a?_2a.location:0,_2c=_2a?CPMaxRange(_2a):_27.length;
for(;_2b<_2c;++_2b){
if(objj_msgSend(_27[_2b],"isEqual:",_29)){
return _2b;
}
}
return CPNotFound;
}
return objj_msgSend(_27,"indexOfObjectIdenticalTo:inRange:",_29,_2a);
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(_2&&!_30){
return _2.call(_2d,_2f);
}
var _31=_30?_30.location:0,_32=_30?CPMaxRange(_30):_2d.length;
for(;_31<_32;++_31){
if(_2d[_31]===_2f){
return _31;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObjects:"),function(_33,_34,_35,_36){
with(_33){
if(!_35){
_CPRaiseInvalidArgumentException(_33,_34,"attempt to pass a nil selector");
}
var _37=0,_38=_33.length;
if(objj_msgSend(_36,"count")){
var _39=objj_msgSend([nil,_35],"arrayByAddingObjectsFromArray:",_36);
for(;_37<_38;++_37){
_39[0]=_33[_37];
objj_msgSend.apply(this,_39);
}
}else{
for(;_37<_38;++_37){
objj_msgSend(_33[_37],_35);
}
}
}
}),new objj_method(sel_getUid("arrayByAddingObject:"),function(_3a,_3b,_3c){
with(_3a){
if(_3c&&_3c.isa&&objj_msgSend(_3c,"isKindOfClass:",_CPJavaScriptArray)){
return _1.call(_3a,[_3c]);
}
return _1.call(_3a,_3c);
}
}),new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"),function(_3d,_3e,_3f){
with(_3d){
if(!_3f){
return objj_msgSend(_3d,"copy");
}
return _1.call(_3d,objj_msgSend(_3f,"isKindOfClass:",_CPJavaScriptArray)?_3f:objj_msgSend(_3f,"_javaScriptArrayCopy"));
}
}),new objj_method(sel_getUid("subarrayWithRange:"),function(_40,_41,_42){
with(_40){
if(_42.location<0||CPMaxRange(_42)>_40.length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_41+" aRange out of bounds");
}
return _6.call(_40,_42.location,CPMaxRange(_42));
}
}),new objj_method(sel_getUid("componentsJoinedByString:"),function(_43,_44,_45){
with(_43){
return _3.call(_43,_45);
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_46,_47,_48,_49){
with(_46){
if(_49>_46.length||_49<0){
_CPRaiseRangeException(_46,_47,_49,_46.length);
}
_7.call(_46,_49,0,_48);
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_4a,_4b,_4c){
with(_4a){
if(_4c>=_4a.length||_4c<0){
_CPRaiseRangeException(_4a,_4b,_4c,_4a.length);
}
_7.call(_4a,_4c,1);
}
}),new objj_method(sel_getUid("addObject:"),function(_4d,_4e,_4f){
with(_4d){
_5.call(_4d,_4f);
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_50,_51){
with(_50){
_7.call(_50,0,_50.length);
}
}),new objj_method(sel_getUid("removeLastObject"),function(_52,_53){
with(_52){
_4.call(_52);
}
}),new objj_method(sel_getUid("removeObjectsInRange:"),function(_54,_55,_56){
with(_54){
if(_56.location<0||CPMaxRange(_56)>_54.length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_55+" aRange out of bounds");
}
_7.call(_54,_56.location,_56.length);
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_57,_58,_59,_5a){
with(_57){
if(_59>=_57.length||_59<0){
_CPRaiseRangeException(_57,_58,_59,_57.length);
}
_57[_59]=_5a;
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"),function(_5b,_5c,_5d,_5e,_5f){
with(_5b){
if(_5d.location<0||CPMaxRange(_5d)>_5b.length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_5c+" aRange out of bounds");
}
if(_5f&&(_5f.location<0||CPMaxRange(_5f)>_5e.length)){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_5c+" otherRange out of bounds");
}
if(_5f&&(_5f.location!==0||_5f.length!==objj_msgSend(_5e,"count"))){
_5e=objj_msgSend(_5e,"subarrayWithRange:",_5f);
}
if(_5e.isa!==_CPJavaScriptArray){
_5e=objj_msgSend(_5e,"_javaScriptArrayCopy");
}
_7.apply(_5b,[_5d.location,_5d.length].concat(_5e));
}
}),new objj_method(sel_getUid("setArray:"),function(_60,_61,_62){
with(_60){
if(objj_msgSend(_62,"isKindOfClass:",_CPJavaScriptArray)){
_7.apply(_60,[0,_60.length].concat(_62));
}else{
objj_msgSendSuper({receiver:_60,super_class:objj_getClass("_CPJavaScriptArray").super_class},"setArray:",_62);
}
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_63,_64,_65){
with(_63){
if(objj_msgSend(_65,"isKindOfClass:",_CPJavaScriptArray)){
_7.apply(_63,[_63.length,0].concat(_65));
}else{
objj_msgSendSuper({receiver:_63,super_class:objj_getClass("_CPJavaScriptArray").super_class},"addObjectsFromArray:",_65);
}
}
}),new objj_method(sel_getUid("copy"),function(_66,_67){
with(_66){
return _6.call(_66,0);
}
}),new objj_method(sel_getUid("classForCoder"),function(_68,_69){
with(_68){
return CPArray;
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("alloc"),function(_6a,_6b){
with(_6a){
return [];
}
}),new objj_method(sel_getUid("array"),function(_6c,_6d){
with(_6c){
return [];
}
}),new objj_method(sel_getUid("arrayWithArray:"),function(_6e,_6f,_70){
with(_6e){
return objj_msgSend(objj_msgSend(_6e,"alloc"),"initWithArray:",_70);
}
}),new objj_method(sel_getUid("arrayWithObject:"),function(_71,_72,_73){
with(_71){
return [_73];
}
})]);
Array.prototype.isa=_CPJavaScriptArray;
