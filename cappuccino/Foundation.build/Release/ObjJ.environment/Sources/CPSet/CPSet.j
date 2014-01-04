@STATIC;1.0;i;9;CPArray.ji;14;CPEnumerator.ji;10;CPNumber.ji;10;CPObject.ji;14;CPMutableSet.jt;9320;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPNumber.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPSet"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setByAddingObject:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(_3,"class"),"setWithArray:",objj_msgSend(objj_msgSend(_3,"allObjects"),"arrayByAddingObject:",_5));
}
}),new objj_method(sel_getUid("setByAddingObjectsFromSet:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"setByAddingObjectsFromArray:",objj_msgSend(_8,"allObjects"));
}
}),new objj_method(sel_getUid("setByAddingObjectsFromArray:"),function(_9,_a,_b){
with(_9){
return objj_msgSend(objj_msgSend(_9,"class"),"setWithArray:",objj_msgSend(objj_msgSend(_9,"allObjects"),"arrayByAddingObjectsFromArray:",_b));
}
}),new objj_method(sel_getUid("init"),function(_c,_d){
with(_c){
return objj_msgSend(_c,"initWithObjects:count:",nil,0);
}
}),new objj_method(sel_getUid("initWithArray:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(_e,"initWithObjects:count:",_10,objj_msgSend(_10,"count"));
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_11,_12,_13){
with(_11){
var _14=2,_15=arguments.length;
for(;_14<_15;++_14){
if(arguments[_14]===nil){
break;
}
}
return objj_msgSend(_11,"initWithObjects:count:",Array.prototype.slice.call(arguments,2,_14),_14-2);
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_16,_17,_18,_19){
with(_16){
if(_16===_1a){
return objj_msgSend(objj_msgSend(_CPConcreteMutableSet,"alloc"),"initWithObjects:count:",_18,_19);
}
return objj_msgSendSuper({receiver:_16,super_class:objj_getClass("CPSet").super_class},"init");
}
}),new objj_method(sel_getUid("initWithSet:"),function(_1b,_1c,_1d){
with(_1b){
return objj_msgSend(_1b,"initWithArray:",objj_msgSend(_1d,"allObjects"));
}
}),new objj_method(sel_getUid("initWithSet:copyItems:"),function(_1e,_1f,_20,_21){
with(_1e){
if(_21){
return objj_msgSend(_20,"valueForKey:","copy");
}
return objj_msgSend(_1e,"initWithSet:",_20);
}
}),new objj_method(sel_getUid("count"),function(_22,_23){
with(_22){
_CPRaiseInvalidAbstractInvocation(_22,_23);
}
}),new objj_method(sel_getUid("allObjects"),function(_24,_25){
with(_24){
var _26=[],_27,_28=objj_msgSend(_24,"objectEnumerator");
while((_27=objj_msgSend(_28,"nextObject"))!==nil){
_26.push(_27);
}
return _26;
}
}),new objj_method(sel_getUid("anyObject"),function(_29,_2a){
with(_29){
return objj_msgSend(objj_msgSend(_29,"objectEnumerator"),"nextObject");
}
}),new objj_method(sel_getUid("containsObject:"),function(_2b,_2c,_2d){
with(_2b){
return objj_msgSend(_2b,"member:",_2d)!==nil;
}
}),new objj_method(sel_getUid("filteredSetUsingPredicate:"),function(_2e,_2f,_30){
with(_2e){
var _31=[],_32,_33=objj_msgSend(_2e,"objectEnumerator");
while((_32=objj_msgSend(_33,"nextObject"))!==nil){
if(objj_msgSend(_30,"evaluateWithObject:",_32)){
_31.push(_32);
}
}
return objj_msgSend(objj_msgSend(objj_msgSend(_2e,"class"),"alloc"),"initWithArray:",_31);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"makeObjectsPerformSelector:withObjects:",_36,nil);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_37,_38,_39,_3a){
with(_37){
objj_msgSend(_37,"makeObjectsPerformSelector:withObjects:",_39,[_3a]);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObjects:"),function(_3b,_3c,_3d,_3e){
with(_3b){
var _3f,_40=objj_msgSend(_3b,"objectEnumerator"),_41=[nil,_3d].concat(_3e||[]);
while((_3f=objj_msgSend(_40,"nextObject"))!==nil){
_41[0]=_3f;
objj_msgSend.apply(this,_41);
}
}
}),new objj_method(sel_getUid("member:"),function(_42,_43,_44){
with(_42){
_CPRaiseInvalidAbstractInvocation(_42,_43);
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_45,_46){
with(_45){
_CPRaiseInvalidAbstractInvocation(_45,_46);
}
}),new objj_method(sel_getUid("enumerateObjectsUsingBlock:"),function(_47,_48,_49){
with(_47){
var _4a,_4b=objj_msgSend(_47,"objectEnumerator");
while((_4a=objj_msgSend(_4b,"nextObject"))!==nil){
if(_49(_4a)){
break;
}
}
}
}),new objj_method(sel_getUid("objectsPassingTest:"),function(_4c,_4d,_4e){
with(_4c){
var _4f=[],_50=nil,_51=objj_msgSend(_4c,"objectEnumerator");
while((_50=objj_msgSend(_51,"nextObject"))!==nil){
if(_4e(_50)){
_4f.push(_50);
}
}
return objj_msgSend(objj_msgSend(objj_msgSend(_4c,"class"),"alloc"),"initWithArray:",_4f);
}
}),new objj_method(sel_getUid("isSubsetOfSet:"),function(_52,_53,_54){
with(_52){
var _55=nil,_56=objj_msgSend(_52,"objectEnumerator");
while((_55=objj_msgSend(_56,"nextObject"))!==nil){
if(!objj_msgSend(_54,"containsObject:",_55)){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("intersectsSet:"),function(_57,_58,_59){
with(_57){
if(_57===_59){
return objj_msgSend(_57,"count")>0;
}
var _5a=nil,_5b=objj_msgSend(_57,"objectEnumerator");
while((_5a=objj_msgSend(_5b,"nextObject"))!==nil){
if(objj_msgSend(_59,"containsObject:",_5a)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("sortedArrayUsingDescriptors:"),function(_5c,_5d,_5e){
with(_5c){
return objj_msgSend(objj_msgSend(_5c,"allObjects"),"sortedArrayUsingDescriptors:",_5e);
}
}),new objj_method(sel_getUid("isEqualToSet:"),function(_5f,_60,_61){
with(_5f){
return objj_msgSend(_5f,"isEqual:",_61);
}
}),new objj_method(sel_getUid("isEqual:"),function(_62,_63,_64){
with(_62){
return _62===_64||objj_msgSend(_64,"isKindOfClass:",objj_msgSend(CPSet,"class"))&&(objj_msgSend(_62,"count")===objj_msgSend(_64,"count")&&objj_msgSend(_64,"isSubsetOfSet:",_62));
}
}),new objj_method(sel_getUid("description"),function(_65,_66){
with(_65){
var _67="{(\n",_68=objj_msgSend(_65,"allObjects"),_69=0,_6a=objj_msgSend(_68,"count");
for(;_69<_6a;++_69){
var _6b=_68[_69];
_67+="\t"+String(_6b).split("\n").join("\n\t")+"\n";
}
return _67+")}";
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_6c,_6d){
with(_6c){
if(_6c===objj_msgSend(CPSet,"class")||_6c===objj_msgSend(CPMutableSet,"class")){
return objj_msgSend(_CPPlaceholderSet,"alloc");
}
return objj_msgSendSuper({receiver:_6c,super_class:objj_getMetaClass("CPSet").super_class},"alloc");
}
}),new objj_method(sel_getUid("set"),function(_6e,_6f){
with(_6e){
return objj_msgSend(objj_msgSend(_6e,"alloc"),"init");
}
}),new objj_method(sel_getUid("setWithArray:"),function(_70,_71,_72){
with(_70){
return objj_msgSend(objj_msgSend(_70,"alloc"),"initWithArray:",_72);
}
}),new objj_method(sel_getUid("setWithObject:"),function(_73,_74,_75){
with(_73){
return objj_msgSend(objj_msgSend(_73,"alloc"),"initWithObjects:",_75);
}
}),new objj_method(sel_getUid("setWithObjects:count:"),function(_76,_77,_78,_79){
with(_76){
return objj_msgSend(objj_msgSend(_76,"alloc"),"initWithObjects:count:",_78,_79);
}
}),new objj_method(sel_getUid("setWithObjects:"),function(_7a,_7b,_7c){
with(_7a){
var _7d=Array.prototype.slice.apply(arguments);
_7d[0]=objj_msgSend(_7a,"alloc");
_7d[1]=sel_getUid("initWithObjects:");
return objj_msgSend.apply(this,_7d);
}
}),new objj_method(sel_getUid("setWithSet:"),function(_7e,_7f,set){
with(_7e){
return objj_msgSend(objj_msgSend(_7e,"alloc"),"initWithSet:",set);
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_80,_81){
with(_80){
return objj_msgSend(objj_msgSend(_80,"class"),"setWithSet:",_80);
}
}),new objj_method(sel_getUid("mutableCopy"),function(_82,_83){
with(_82){
return objj_msgSend(_82,"copy");
}
})]);
var _84="CPSetObjectsKey";
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_85,_86,_87){
with(_85){
return objj_msgSend(_85,"initWithArray:",objj_msgSend(_87,"decodeObjectForKey:",_84));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_88,_89,_8a){
with(_88){
objj_msgSend(_8a,"encodeObject:forKey:",objj_msgSend(_88,"allObjects"),_84);
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("valueForKey:"),function(_8b,_8c,_8d){
with(_8b){
if(_8d==="@count"){
return objj_msgSend(_8b,"count");
}
var _8e=objj_msgSend(CPSet,"set"),_8f,_90=objj_msgSend(_8b,"objectEnumerator");
while((_8f=objj_msgSend(_90,"nextObject"))!==nil){
var _91=objj_msgSend(_8f,"valueForKey:",_8d);
objj_msgSend(_8e,"addObject:",_91);
}
return _8e;
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_92,_93,_94,_95){
with(_92){
var _96,_97=objj_msgSend(_92,"objectEnumerator");
while((_96=objj_msgSend(_97,"nextObject"))!==nil){
objj_msgSend(_96,"setValue:forKey:",_94,_95);
}
}
})]);
var _1a=nil;
var _1=objj_allocateClassPair(CPSet,"_CPPlaceholderSet"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_98,_99){
with(_98){
if(!_1a){
_1a=objj_msgSendSuper({receiver:_98,super_class:objj_getMetaClass("_CPPlaceholderSet").super_class},"alloc");
}
return _1a;
}
})]);
objj_executeFile("CPMutableSet.j",YES);
