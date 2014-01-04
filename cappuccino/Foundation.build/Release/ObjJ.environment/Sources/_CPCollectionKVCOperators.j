@STATIC;1.0;t;2341;
var _1=objj_allocateClassPair(CPObject,"_CPCollectionKVCOperator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("performOperation:withCollection:propertyPath:"),function(_3,_4,_5,_6,_7){
with(_3){
var _8=CPSelectorFromString(_5+"ForCollection:propertyPath:");
if(!objj_msgSend(_3,"respondsToSelector:",_8)){
return objj_msgSend(_6,"valueForUndefinedKey:","@"+_5);
}
return objj_msgSend(_3,"performSelector:withObject:withObject:",_8,_6,_7);
}
}),new objj_method(sel_getUid("avgForCollection:propertyPath:"),function(_9,_a,_b,_c){
with(_9){
if(!_c){
return objj_msgSend(_b,"valueForUndefinedKey:","@avg");
}
var _d=objj_msgSend(_b,"valueForKeyPath:",_c),_e=0,_f=objj_msgSend(_d,"objectEnumerator"),_10;
while((_10=objj_msgSend(_f,"nextObject"))!==nil){
_e+=objj_msgSend(_10,"doubleValue");
}
return _e/objj_msgSend(_d,"count");
}
}),new objj_method(sel_getUid("minForCollection:propertyPath:"),function(_11,_12,_13,_14){
with(_11){
if(!_14){
return objj_msgSend(_13,"valueForUndefinedKey:","@min");
}
var _15=objj_msgSend(_13,"valueForKeyPath:",_14);
if(objj_msgSend(_15,"count")===0){
return nil;
}
var _16=objj_msgSend(_15,"objectEnumerator"),min=objj_msgSend(_16,"nextObject"),_17;
while((_17=objj_msgSend(_16,"nextObject"))!==nil){
if(objj_msgSend(min,"compare:",_17)>0){
min=_17;
}
}
return min;
}
}),new objj_method(sel_getUid("maxForCollection:propertyPath:"),function(_18,_19,_1a,_1b){
with(_18){
if(!_1b){
return objj_msgSend(_1a,"valueForUndefinedKey:","@max");
}
var _1c=objj_msgSend(_1a,"valueForKeyPath:",_1b);
if(objj_msgSend(_1c,"count")===0){
return nil;
}
var _1d=objj_msgSend(_1c,"objectEnumerator"),max=objj_msgSend(_1d,"nextObject"),_1e;
while((_1e=objj_msgSend(_1d,"nextObject"))!==nil){
if(objj_msgSend(max,"compare:",_1e)<0){
max=_1e;
}
}
return max;
}
}),new objj_method(sel_getUid("sumForCollection:propertyPath:"),function(_1f,_20,_21,_22){
with(_1f){
if(!_22){
return objj_msgSend(_21,"valueForUndefinedKey:","@sum");
}
var _23=objj_msgSend(_21,"valueForKeyPath:",_22),sum=0,_24=objj_msgSend(_23,"objectEnumerator"),_25;
while((_25=objj_msgSend(_24,"nextObject"))!==nil){
sum+=objj_msgSend(_25,"doubleValue");
}
return sum;
}
}),new objj_method(sel_getUid("countForCollection:propertyPath:"),function(_26,_27,_28,_29){
with(_26){
return objj_msgSend(_28,"count");
}
})]);
