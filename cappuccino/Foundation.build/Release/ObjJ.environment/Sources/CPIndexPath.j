@STATIC;1.0;i;9;CPArray.ji;13;CPException.ji;10;CPObject.ji;9;CPRange.ji;18;CPSortDescriptor.jt;4048;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRange.j",YES);
objj_executeFile("CPSortDescriptor.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPIndexPath"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_indexes")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("indexes"),function(_3,_4){
with(_3){
return _indexes;
}
}),new objj_method(sel_getUid("setIndexes:"),function(_5,_6,_7){
with(_5){
_indexes=_7;
}
}),new objj_method(sel_getUid("initWithIndexes:length:"),function(_8,_9,_a,_b){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPIndexPath").super_class},"init");
if(_8){
_indexes=objj_msgSend(_a,"subarrayWithRange:",CPMakeRange(0,_b));
}
return _8;
}
}),new objj_method(sel_getUid("initWithIndexes:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPIndexPath").super_class},"init");
if(_c){
_indexes=objj_msgSend(_e,"copy");
}
return _c;
}
}),new objj_method(sel_getUid("description"),function(_f,_10){
with(_f){
return objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPIndexPath").super_class},"description")+" "+_indexes;
}
}),new objj_method(sel_getUid("length"),function(_11,_12){
with(_11){
return objj_msgSend(_indexes,"count");
}
}),new objj_method(sel_getUid("indexAtPosition:"),function(_13,_14,_15){
with(_13){
return objj_msgSend(_indexes,"objectAtIndex:",_15);
}
}),new objj_method(sel_getUid("setIndexes:"),function(_16,_17,_18){
with(_16){
_indexes=objj_msgSend(_18,"copy");
}
}),new objj_method(sel_getUid("indexes"),function(_19,_1a){
with(_19){
return objj_msgSend(_indexes,"copy");
}
}),new objj_method(sel_getUid("indexPathByAddingIndex:"),function(_1b,_1c,_1d){
with(_1b){
return objj_msgSend(CPIndexPath,"indexPathWithIndexes:",objj_msgSend(_indexes,"arrayByAddingObject:",_1d));
}
}),new objj_method(sel_getUid("indexPathByRemovingLastIndex"),function(_1e,_1f){
with(_1e){
return objj_msgSend(CPIndexPath,"indexPathWithIndexes:length:",_indexes,objj_msgSend(_1e,"length")-1);
}
}),new objj_method(sel_getUid("isEqual:"),function(_20,_21,_22){
with(_20){
if(_22===_20){
return YES;
}
if(objj_msgSend(_22,"class")!==objj_msgSend(CPIndexPath,"class")){
return NO;
}
return objj_msgSend(_indexes,"isEqualToArray:",objj_msgSend(_22,"indexes"));
}
}),new objj_method(sel_getUid("compare:"),function(_23,_24,_25){
with(_23){
if(!_25){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"indexPath to "+_23+" was nil");
}
var _26=objj_msgSend(_23,"indexes"),_27=objj_msgSend(_25,"indexes"),_28=objj_msgSend(_26,"count"),_29=objj_msgSend(_27,"count");
var _2a=0,_2b=MIN(_28,_29);
for(;_2a<_2b;++_2a){
var lhs=_26[_2a],rhs=_27[_2a];
if(lhs<rhs){
return CPOrderedAscending;
}else{
if(lhs>rhs){
return CPOrderedDescending;
}
}
}
if(_28===_29){
return CPOrderedSame;
}
if(_28===_2b){
return CPOrderedAscending;
}
return CPOrderedDescending;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("indexPathWithIndex:"),function(_2c,_2d,_2e){
with(_2c){
return objj_msgSend(objj_msgSend(_2c,"alloc"),"initWithIndexes:length:",[_2e],1);
}
}),new objj_method(sel_getUid("indexPathWithIndexes:length:"),function(_2f,_30,_31,_32){
with(_2f){
return objj_msgSend(objj_msgSend(_2f,"alloc"),"initWithIndexes:length:",_31,_32);
}
}),new objj_method(sel_getUid("indexPathWithIndexes:"),function(_33,_34,_35){
with(_33){
return objj_msgSend(objj_msgSend(_33,"alloc"),"initWithIndexes:",_35);
}
})]);
var _36="CPIndexPathIndexes";
var _1=objj_getClass("CPIndexPath");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexPath\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_37,_38,_39){
with(_37){
if(_37=objj_msgSend(_37,"init")){
_indexes=objj_msgSend(_39,"decodeObjectForKey:",_36);
}
return _37;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(_3c,"encodeObject:forKey:",_indexes,_36);
}
})]);
