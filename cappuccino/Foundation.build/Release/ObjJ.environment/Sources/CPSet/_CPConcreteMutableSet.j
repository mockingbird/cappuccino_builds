@STATIC;1.0;i;14;CPMutableSet.jt;2289;
objj_executeFile("CPMutableSet.j",YES);
var _1=Object.prototype.hasOwnProperty;
var _2=objj_allocateClassPair(CPMutableSet,"_CPConcreteMutableSet"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_contents"),new objj_ivar("_count")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithObjects:count:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPConcreteMutableSet").super_class},"initWithObjects:count:",_6,_7);
if(_4){
_count=0;
_contents={};
var _8=0,_9=MIN(objj_msgSend(_6,"count"),_7);
for(;_8<_9;++_8){
objj_msgSend(_4,"addObject:",_6[_8]);
}
}
return _4;
}
}),new objj_method(sel_getUid("count"),function(_a,_b){
with(_a){
return _count;
}
}),new objj_method(sel_getUid("member:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(_e,"UID");
if(_1.call(_contents,_f)){
return _contents[_f];
}else{
for(var _10 in _contents){
if(!_1.call(_contents,_10)){
continue;
}
var _11=_contents[_10];
if(_11===_e||objj_msgSend(_11,"isEqual:",_e)){
return _11;
}
}
}
return nil;
}
}),new objj_method(sel_getUid("allObjects"),function(_12,_13){
with(_12){
var _14=[],_15;
for(_15 in _contents){
if(_1.call(_contents,_15)){
_14.push(_contents[_15]);
}
}
return _14;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_16,_17){
with(_16){
return objj_msgSend(objj_msgSend(_16,"allObjects"),"objectEnumerator");
}
}),new objj_method(sel_getUid("addObject:"),function(_18,_19,_1a){
with(_18){
if(_1a===nil||_1a===undefined){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"attempt to insert nil or undefined");
}
if(objj_msgSend(_18,"containsObject:",_1a)){
return;
}
_contents[objj_msgSend(_1a,"UID")]=_1a;
_count++;
}
}),new objj_method(sel_getUid("removeObject:"),function(_1b,_1c,_1d){
with(_1b){
if(_1d===nil||_1d===undefined){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"attempt to remove nil or undefined");
}
var _1e=objj_msgSend(_1b,"member:",_1d);
if(_1e!==nil){
delete _contents[objj_msgSend(_1e,"UID")];
_count--;
}
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_1f,_20){
with(_1f){
_contents={};
_count=0;
}
}),new objj_method(sel_getUid("classForCoder"),function(_21,_22){
with(_21){
return objj_msgSend(CPSet,"class");
}
})]);
