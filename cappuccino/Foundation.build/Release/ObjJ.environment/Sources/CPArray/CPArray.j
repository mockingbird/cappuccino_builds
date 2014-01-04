@STATIC;1.0;i;14;CPEnumerator.ji;13;CPException.ji;10;CPObject.ji;9;CPRange.ji;18;CPSortDescriptor.ji;20;_CPJavaScriptArray.jt;17182;
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRange.j",YES);
objj_executeFile("CPSortDescriptor.j",YES);
CPEnumerationNormal=0;
CPEnumerationConcurrent=1<<0;
CPEnumerationReverse=1<<1;
CPBinarySearchingFirstEqual=1<<8;
CPBinarySearchingLastEqual=1<<9;
CPBinarySearchingInsertionIndex=1<<10;
var _1=Array.prototype.concat,_2=Array.prototype.join,_3=Array.prototype.push;
var _4=objj_allocateClassPair(CPObject,"CPArray"),_5=_4.isa;
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("init"),function(_6,_7){
with(_6){
if(_6===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("initWithArray:"),function(_9,_a,_b){
with(_9){
if(_9===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("initWithArray:copyItems:"),function(_c,_d,_e,_f){
with(_c){
if(_c===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_10,_11,_12){
with(_10){
if(_10===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_13,_14,_15,_16){
with(_13){
if(_13===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_13,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("initWithCapacity:"),function(_17,_18,_19){
with(_17){
if(_17===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_17,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("containsObject:"),function(_1a,_1b,_1c){
with(_1a){
return objj_msgSend(_1a,"indexOfObject:",_1c)!==CPNotFound;
}
}),new objj_method(sel_getUid("containsObjectIdenticalTo:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(_1d,"indexOfObjectIdenticalTo:",_1f)!==CPNotFound;
}
}),new objj_method(sel_getUid("count"),function(_20,_21){
with(_20){
_CPRaiseInvalidAbstractInvocation(_20,_21);
}
}),new objj_method(sel_getUid("firstObject"),function(_22,_23){
with(_22){
var _24=objj_msgSend(_22,"count");
if(_24>0){
return objj_msgSend(_22,"objectAtIndex:",0);
}
return nil;
}
}),new objj_method(sel_getUid("lastObject"),function(_25,_26){
with(_25){
var _27=objj_msgSend(_25,"count");
if(_27<=0){
return nil;
}
return objj_msgSend(_25,"objectAtIndex:",_27-1);
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_28,_29,_2a){
with(_28){
_CPRaiseInvalidAbstractInvocation(_28,_29);
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=CPNotFound,_2f=[];
while((_2e=objj_msgSend(_2d,"indexGreaterThanIndex:",_2e))!==CPNotFound){
_2f.push(objj_msgSend(_2b,"objectAtIndex:",_2e));
}
return _2f;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_30,_31){
with(_30){
return objj_msgSend(objj_msgSend(_CPArrayEnumerator,"alloc"),"initWithArray:",_30);
}
}),new objj_method(sel_getUid("reverseObjectEnumerator"),function(_32,_33){
with(_32){
return objj_msgSend(objj_msgSend(_CPReverseArrayEnumerator,"alloc"),"initWithArray:",_32);
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_34,_35,_36){
with(_34){
return objj_msgSend(_34,"indexOfObject:inRange:",_36,nil);
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_37,_38,_39,_3a){
with(_37){
if(_39&&_39.isa){
var _3b=_3a?_3a.location:0,_3c=_3a?CPMaxRange(_3a):objj_msgSend(_37,"count");
for(;_3b<_3c;++_3b){
if(objj_msgSend(objj_msgSend(_37,"objectAtIndex:",_3b),"isEqual:",_39)){
return _3b;
}
}
return CPNotFound;
}
return objj_msgSend(_37,"indexOfObjectIdenticalTo:inRange:",_39,_3a);
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_3d,_3e,_3f){
with(_3d){
return objj_msgSend(_3d,"indexOfObjectIdenticalTo:inRange:",_3f,nil);
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_40,_41,_42,_43){
with(_40){
var _44=_43?_43.location:0,_45=_43?CPMaxRange(_43):objj_msgSend(_40,"count");
for(;_44<_45;++_44){
if(objj_msgSend(_40,"objectAtIndex:",_44)===_42){
return _44;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectPassingTest:"),function(_46,_47,_48){
with(_46){
return objj_msgSend(_46,"indexOfObjectWithOptions:passingTest:context:",CPEnumerationNormal,_48,undefined);
}
}),new objj_method(sel_getUid("indexOfObjectPassingTest:context:"),function(_49,_4a,_4b,_4c){
with(_49){
return objj_msgSend(_49,"indexOfObjectWithOptions:passingTest:context:",CPEnumerationNormal,_4b,_4c);
}
}),new objj_method(sel_getUid("indexOfObjectWithOptions:passingTest:"),function(_4d,_4e,_4f,_50){
with(_4d){
return objj_msgSend(_4d,"indexOfObjectWithOptions:passingTest:context:",_4f,_50,undefined);
}
}),new objj_method(sel_getUid("indexOfObjectWithOptions:passingTest:context:"),function(_51,_52,_53,_54,_55){
with(_51){
if(_53&CPEnumerationReverse){
var _56=objj_msgSend(_51,"count")-1,_57=-1,_58=-1;
}else{
var _56=0,_57=objj_msgSend(_51,"count"),_58=1;
}
for(;_56!==_57;_56+=_58){
if(_54(objj_msgSend(_51,"objectAtIndex:",_56),_56,_55)){
return _56;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:inSortedRange:options:usingComparator:"),function(_59,_5a,_5b,_5c,_5d,_5e){
with(_59){
if(!_5e){
_CPRaiseInvalidArgumentException(_59,_5a,"comparator is nil");
}
if((_5d&CPBinarySearchingFirstEqual)&&(_5d&CPBinarySearchingLastEqual)){
_CPRaiseInvalidArgumentException(_59,_5a,"both CPBinarySearchingFirstEqual and CPBinarySearchingLastEqual options cannot be specified");
}
var _5f=objj_msgSend(_59,"count");
if(_5f<=0){
return (_5d&CPBinarySearchingInsertionIndex)?0:CPNotFound;
}
var _60=_5c?_5c.location:0,_61=(_5c?CPMaxRange(_5c):objj_msgSend(_59,"count"))-1;
if(_60<0){
_CPRaiseRangeException(_59,_5a,_60,_5f);
}
if(_61>=_5f){
_CPRaiseRangeException(_59,_5a,_61,_5f);
}
while(_60<=_61){
var _62=FLOOR((_60+_61)/2),_63=_5e(_5b,objj_msgSend(_59,"objectAtIndex:",_62));
if(_63>0){
_60=_62+1;
}else{
if(_63<0){
_61=_62-1;
}else{
if(_5d&CPBinarySearchingFirstEqual){
while(_62>_60&&_5e(_5b,objj_msgSend(_59,"objectAtIndex:",_62-1))===CPOrderedSame){
--_62;
}
}else{
if(_5d&CPBinarySearchingLastEqual){
while(_62<_61&&_5e(_5b,objj_msgSend(_59,"objectAtIndex:",_62+1))===CPOrderedSame){
++_62;
}
if(_5d&CPBinarySearchingInsertionIndex){
++_62;
}
}
}
return _62;
}
}
}
if(_5d&CPBinarySearchingInsertionIndex){
return MAX(_60,0);
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexesOfObjectsPassingTest:"),function(_64,_65,_66){
with(_64){
return objj_msgSend(_64,"indexesOfObjectsWithOptions:passingTest:context:",CPEnumerationNormal,_66,undefined);
}
}),new objj_method(sel_getUid("indexesOfObjectsPassingTest:context:"),function(_67,_68,_69,_6a){
with(_67){
return objj_msgSend(_67,"indexesOfObjectsWithOptions:passingTest:context:",CPEnumerationNormal,_69,_6a);
}
}),new objj_method(sel_getUid("indexesOfObjectsWithOptions:passingTest:"),function(_6b,_6c,_6d,_6e){
with(_6b){
return objj_msgSend(_6b,"indexesOfObjectsWithOptions:passingTest:context:",_6d,_6e,undefined);
}
}),new objj_method(sel_getUid("indexesOfObjectsWithOptions:passingTest:context:"),function(_6f,_70,_71,_72,_73){
with(_6f){
if(_71&CPEnumerationReverse){
var _74=objj_msgSend(_6f,"count")-1,_75=-1,_76=-1;
}else{
var _74=0,_75=objj_msgSend(_6f,"count"),_76=1;
}
var _77=objj_msgSend(CPIndexSet,"indexSet");
for(;_74!==_75;_74+=_76){
if(_72(objj_msgSend(_6f,"objectAtIndex:",_74),_74,_73)){
objj_msgSend(_77,"addIndex:",_74);
}
}
return _77;
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_78,_79,_7a){
with(_78){
objj_msgSend(_78,"makeObjectsPerformSelector:withObjects:",_7a,nil);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_7b,_7c,_7d,_7e){
with(_7b){
return objj_msgSend(_7b,"makeObjectsPerformSelector:withObjects:",_7d,[_7e]);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObjects:"),function(_7f,_80,_81,_82){
with(_7f){
if(!_81){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector:withObjects: 'aSelector' can't be nil");
}
var _83=0,_84=objj_msgSend(_7f,"count");
if(objj_msgSend(_82,"count")){
var _85=objj_msgSend([nil,_81],"arrayByAddingObjectsFromArray:",_82);
for(;_83<_84;++_83){
_85[0]=objj_msgSend(_7f,"objectAtIndex:",_83);
objj_msgSend.apply(this,_85);
}
}else{
for(;_83<_84;++_83){
objj_msgSend(objj_msgSend(_7f,"objectAtIndex:",_83),_81);
}
}
}
}),new objj_method(sel_getUid("enumerateObjectsUsingBlock:"),function(_86,_87,_88){
with(_86){
var _89=0,_8a=objj_msgSend(_86,"count"),_8b=NO,_8c=function(_8d){
if(arguments.length){
return _8b=_8d;
}
return _8b;
};
for(;_89<_8a;++_89){
_88(objj_msgSend(_86,"objectAtIndex:",_89),_89,_8c);
if(_8b){
return;
}
}
}
}),new objj_method(sel_getUid("enumerateObjectsWithOptions:usingBlock:"),function(_8e,_8f,_90,_91){
with(_8e){
var _92=NO;
if(_90&CPEnumerationReverse){
var _93=objj_msgSend(_8e,"count")-1,_94=-1,_95=-1;
}else{
var _93=0,_94=objj_msgSend(_8e,"count"),_95=1;
}
for(;_93!==_94;_93+=_95){
_91(objj_msgSend(_8e,"objectAtIndex:",_93),_93,function(_96){
if(arguments.length){
return _92=_96;
}
return _92;
});
if(_92){
return;
}
}
}
}),new objj_method(sel_getUid("firstObjectCommonWithArray:"),function(_97,_98,_99){
with(_97){
var _9a=objj_msgSend(_97,"count");
if(!objj_msgSend(_99,"count")||!_9a){
return nil;
}
var _9b=0;
for(;_9b<_9a;++_9b){
var _9c=objj_msgSend(_97,"objectAtIndex:",_9b);
if(objj_msgSend(_99,"containsObject:",_9c)){
return _9c;
}
}
return nil;
}
}),new objj_method(sel_getUid("isEqualToArray:"),function(_9d,_9e,_9f){
with(_9d){
if(_9d===_9f){
return YES;
}
if(!objj_msgSend(_9f,"isKindOfClass:",CPArray)){
return NO;
}
var _a0=objj_msgSend(_9d,"count"),_a1=objj_msgSend(_9f,"count");
if(_9f===nil||_a0!==_a1){
return NO;
}
var _a2=0;
for(;_a2<_a0;++_a2){
var lhs=objj_msgSend(_9d,"objectAtIndex:",_a2),rhs=objj_msgSend(_9f,"objectAtIndex:",_a2);
if(lhs!==rhs&&(lhs&&!lhs.isa||rhs&&!rhs.isa||!objj_msgSend(lhs,"isEqual:",rhs))){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_a3,_a4,_a5){
with(_a3){
return (_a3===_a5)||objj_msgSend(_a3,"isEqualToArray:",_a5);
}
}),new objj_method(sel_getUid("_javaScriptArrayCopy"),function(_a6,_a7){
with(_a6){
var _a8=0,_a9=objj_msgSend(_a6,"count"),_aa=[];
for(;_a8<_a9;++_a8){
_3.call(_aa,objj_msgSend(_a6,"objectAtIndex:",_a8));
}
return _aa;
}
}),new objj_method(sel_getUid("arrayByAddingObject:"),function(_ab,_ac,_ad){
with(_ab){
var _ae=objj_msgSend(_ab,"_javaScriptArrayCopy");
_3.call(_ae,_ad);
return objj_msgSend(objj_msgSend(_ab,"class"),sel_getUid("arrayWithArray:"),_ae);
}
}),new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"),function(_af,_b0,_b1){
with(_af){
if(!_b1){
return objj_msgSend(_af,"copy");
}
var _b1=_b1.isa===_CPJavaScriptArray?_b1:objj_msgSend(_b1,"_javaScriptArrayCopy"),_b2=_1.call(objj_msgSend(_af,"_javaScriptArrayCopy"),_b1);
return objj_msgSend(objj_msgSend(_af,"class"),sel_getUid("arrayWithArray:"),_b2);
}
}),new objj_method(sel_getUid("subarrayWithRange:"),function(_b3,_b4,_b5){
with(_b3){
if(!_b5){
return objj_msgSend(_b3,"copy");
}
if(_b5.location<0||CPMaxRange(_b5)>_b3.length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"subarrayWithRange: aRange out of bounds");
}
var _b6=_b5.location,_b7=CPMaxRange(_b5),_b8=[];
for(;_b6<_b7;++_b6){
_3.call(_b8,objj_msgSend(_b3,"objectAtIndex:",_b6));
}
return objj_msgSend(objj_msgSend(_b3,"class"),sel_getUid("arrayWithArray:"),_b8);
}
}),new objj_method(sel_getUid("sortedArrayUsingDescriptors:"),function(_b9,_ba,_bb){
with(_b9){
var _bc=objj_msgSend(_b9,"copy");
objj_msgSend(_bc,"sortUsingDescriptors:",_bb);
return _bc;
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:"),function(_bd,_be,_bf){
with(_bd){
return objj_msgSend(_bd,"sortedArrayUsingFunction:context:",_bf,nil);
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:context:"),function(_c0,_c1,_c2,_c3){
with(_c0){
var _c4=objj_msgSend(_c0,"copy");
objj_msgSend(_c4,"sortUsingFunction:context:",_c2,_c3);
return _c4;
}
}),new objj_method(sel_getUid("sortedArrayUsingSelector:"),function(_c5,_c6,_c7){
with(_c5){
var _c8=objj_msgSend(_c5,"copy");
objj_msgSend(_c8,"sortUsingSelector:",_c7);
return _c8;
}
}),new objj_method(sel_getUid("componentsJoinedByString:"),function(_c9,_ca,_cb){
with(_c9){
return _2.call(objj_msgSend(_c9,"_javaScriptArrayCopy"),_cb);
}
}),new objj_method(sel_getUid("description"),function(_cc,_cd){
with(_cc){
var _ce=0,_cf=objj_msgSend(_cc,"count"),_d0="@[";
for(;_ce<_cf;++_ce){
if(_ce===0){
_d0+="\n\t";
}
var _d1=objj_msgSend(_cc,"objectAtIndex:",_ce);
_d0+=CPDescriptionOfObject(_d1);
if(_ce!==_cf-1){
_d0+=",\n\t";
}else{
_d0+="\n";
}
}
return _d0+"]";
}
}),new objj_method(sel_getUid("pathsMatchingExtensions:"),function(_d2,_d3,_d4){
with(_d2){
var _d5=0,_d6=objj_msgSend(_d2,"count"),_d7=[];
for(;_d5<_d6;++_d5){
if(_d2[_d5].isa&&objj_msgSend(_d2[_d5],"isKindOfClass:",objj_msgSend(CPString,"class"))&&objj_msgSend(_d4,"containsObject:",objj_msgSend(_d2[_d5],"pathExtension"))){
_d7.push(_d2[_d5]);
}
}
return _d7;
}
}),new objj_method(sel_getUid("copy"),function(_d8,_d9){
with(_d8){
return objj_msgSend(objj_msgSend(_d8,"class"),"arrayWithArray:",_d8);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("alloc"),function(_da,_db){
with(_da){
if(_da===CPArray||_da===CPMutableArray){
return objj_msgSend(_CPPlaceholderArray,"alloc");
}
return objj_msgSendSuper({receiver:_da,super_class:objj_getMetaClass("CPArray").super_class},"alloc");
}
}),new objj_method(sel_getUid("array"),function(_dc,_dd){
with(_dc){
return objj_msgSend(objj_msgSend(_dc,"alloc"),"init");
}
}),new objj_method(sel_getUid("arrayWithArray:"),function(_de,_df,_e0){
with(_de){
return objj_msgSend(objj_msgSend(_de,"alloc"),"initWithArray:",_e0);
}
}),new objj_method(sel_getUid("arrayWithObject:"),function(_e1,_e2,_e3){
with(_e1){
return objj_msgSend(objj_msgSend(_e1,"alloc"),"initWithObjects:",_e3);
}
}),new objj_method(sel_getUid("arrayWithObjects:"),function(_e4,_e5,_e6){
with(_e4){
arguments[0]=objj_msgSend(_e4,"alloc");
arguments[1]=sel_getUid("initWithObjects:");
return objj_msgSend.apply(this,arguments);
}
}),new objj_method(sel_getUid("arrayWithObjects:count:"),function(_e7,_e8,_e9,_ea){
with(_e7){
return objj_msgSend(objj_msgSend(_e7,"alloc"),"initWithObjects:count:",_e9,_ea);
}
})]);
var _4=objj_getClass("CPArray");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_eb,_ec,_ed){
with(_eb){
return objj_msgSend(_ed,"decodeObjectForKey:","CP.objects");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_ee,_ef,_f0){
with(_ee){
objj_msgSend(_f0,"_encodeArrayOfObjects:forKey:",_ee,"CP.objects");
}
})]);
var _4=objj_allocateClassPair(CPEnumerator,"_CPArrayEnumerator"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithArray:"),function(_f1,_f2,_f3){
with(_f1){
_f1=objj_msgSendSuper({receiver:_f1,super_class:objj_getClass("_CPArrayEnumerator").super_class},"init");
if(_f1){
_array=_f3;
_index=-1;
}
return _f1;
}
}),new objj_method(sel_getUid("nextObject"),function(_f4,_f5){
with(_f4){
if(++_index>=objj_msgSend(_array,"count")){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _4=objj_allocateClassPair(CPEnumerator,"_CPReverseArrayEnumerator"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithArray:"),function(_f6,_f7,_f8){
with(_f6){
_f6=objj_msgSendSuper({receiver:_f6,super_class:objj_getClass("_CPReverseArrayEnumerator").super_class},"init");
if(_f6){
_array=_f8;
_index=objj_msgSend(_array,"count");
}
return _f6;
}
}),new objj_method(sel_getUid("nextObject"),function(_f9,_fa){
with(_f9){
if(--_index<0){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _8=nil;
var _4=objj_allocateClassPair(CPArray,"_CPPlaceholderArray"),_5=_4.isa;
objj_registerClassPair(_4);
class_addMethods(_5,[new objj_method(sel_getUid("alloc"),function(_fb,_fc){
with(_fb){
if(!_8){
_8=objj_msgSendSuper({receiver:_fb,super_class:objj_getMetaClass("_CPPlaceholderArray").super_class},"alloc");
}
return _8;
}
})]);
objj_executeFile("_CPJavaScriptArray.j",YES);
