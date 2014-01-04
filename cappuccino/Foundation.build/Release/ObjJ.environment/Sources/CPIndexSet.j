@STATIC;1.0;i;9;CPArray.ji;10;CPObject.ji;9;CPRange.jt;16263;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRange.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPIndexSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_count"),new objj_ivar("_ranges")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithIndexesInRange:",{location:(0),length:0});
}
}),new objj_method(sel_getUid("initWithIndex:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_5,"initWithIndexesInRange:",{location:(_7),length:1});
}
}),new objj_method(sel_getUid("initWithIndexesInRange:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPIndexSet").super_class},"init");
if(_8){
_count=MAX(0,_a.length);
if(_count>0){
_ranges=[_a];
}else{
_ranges=[];
}
}
return _8;
}
}),new objj_method(sel_getUid("initWithIndexSet:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPIndexSet").super_class},"init");
if(_b){
_count=objj_msgSend(_d,"count");
_ranges=[];
var _e=_d._ranges,_f=_e.length;
while(_f--){
_ranges[_f]={location:(_e[_f]).location,length:(_e[_f]).length};
}
}
return _b;
}
}),new objj_method(sel_getUid("isEqual:"),function(_10,_11,_12){
with(_10){
if(_10===_12){
return YES;
}
if(!_12||!objj_msgSend(_12,"isKindOfClass:",objj_msgSend(CPIndexSet,"class"))){
return NO;
}
return objj_msgSend(_10,"isEqualToIndexSet:",_12);
}
}),new objj_method(sel_getUid("isEqualToIndexSet:"),function(_13,_14,_15){
with(_13){
if(!_15){
return NO;
}
if(_13===_15){
return YES;
}
var _16=_ranges.length,_17=_15._ranges;
if(_16!==_17.length||_count!==_15._count){
return NO;
}
while(_16--){
if(!CPEqualRanges(_ranges[_16],_17[_16])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_18,_19,_1a){
with(_18){
return _18===_1a||objj_msgSend(_1a,"isKindOfClass:",objj_msgSend(_18,"class"))&&objj_msgSend(_18,"isEqualToIndexSet:",_1a);
}
}),new objj_method(sel_getUid("containsIndex:"),function(_1b,_1c,_1d){
with(_1b){
return _1e(_ranges,_1d)!==CPNotFound;
}
}),new objj_method(sel_getUid("containsIndexesInRange:"),function(_1f,_20,_21){
with(_1f){
if(_21.length<=0){
return NO;
}
if(_count<_21.length){
return NO;
}
var _22=_1e(_ranges,_21.location);
if(_22===CPNotFound){
return NO;
}
var _23=_ranges[_22];
return CPIntersectionRange(_23,_21).length===_21.length;
}
}),new objj_method(sel_getUid("containsIndexes:"),function(_24,_25,_26){
with(_24){
var _27=_26._count;
if(_27<=0){
return YES;
}
if(_count<_27){
return NO;
}
var _28=_26._ranges,_29=_28.length;
while(_29--){
if(!objj_msgSend(_24,"containsIndexesInRange:",_28[_29])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("intersectsIndexesInRange:"),function(_2a,_2b,_2c){
with(_2a){
if(_count<=0){
return NO;
}
var _2d=_2e(_ranges,_2c.location);
if(FLOOR(_2d)===_2d){
return YES;
}
var _2f=_2e(_ranges,((_2c).location+(_2c).length)-1);
if(FLOOR(_2f)===_2f){
return YES;
}
return _2d!==_2f;
}
}),new objj_method(sel_getUid("count"),function(_30,_31){
with(_30){
return _count;
}
}),new objj_method(sel_getUid("firstIndex"),function(_32,_33){
with(_32){
if(_count>0){
return _ranges[0].location;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("lastIndex"),function(_34,_35){
with(_34){
if(_count>0){
return ((_ranges[_ranges.length-1]).location+(_ranges[_ranges.length-1]).length)-1;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexGreaterThanIndex:"),function(_36,_37,_38){
with(_36){
++_38;
var _39=_2e(_ranges,_38);
if(_39===CPNotFound){
return CPNotFound;
}
_39=CEIL(_39);
if(_39>=_ranges.length){
return CPNotFound;
}
var _3a=_ranges[_39];
if((((_38)>=(_3a).location)&&((_38)<((_3a).location+(_3a).length)))){
return _38;
}
return _3a.location;
}
}),new objj_method(sel_getUid("indexLessThanIndex:"),function(_3b,_3c,_3d){
with(_3b){
--_3d;
var _3e=_2e(_ranges,_3d);
if(_3e===CPNotFound){
return CPNotFound;
}
_3e=FLOOR(_3e);
if(_3e<0){
return CPNotFound;
}
var _3f=_ranges[_3e];
if((((_3d)>=(_3f).location)&&((_3d)<((_3f).location+(_3f).length)))){
return _3d;
}
return ((_3f).location+(_3f).length)-1;
}
}),new objj_method(sel_getUid("indexGreaterThanOrEqualToIndex:"),function(_40,_41,_42){
with(_40){
return objj_msgSend(_40,"indexGreaterThanIndex:",_42-1);
}
}),new objj_method(sel_getUid("indexLessThanOrEqualToIndex:"),function(_43,_44,_45){
with(_43){
return objj_msgSend(_43,"indexLessThanIndex:",_45+1);
}
}),new objj_method(sel_getUid("getIndexes:maxCount:inIndexRange:"),function(_46,_47,_48,_49,_4a){
with(_46){
if(!_count||_49===0||_4a&&!_4a.length){
if(_4a){
_4a.length=0;
}
return 0;
}
var _4b=0;
if(_4a){
var _4c=_4a.location,_4d=((_4a).location+(_4a).length)-1,_4e=CEIL(_2e(_ranges,_4c)),_4f=FLOOR(_2e(_ranges,_4d));
}else{
var _4c=objj_msgSend(_46,"firstIndex"),_4d=objj_msgSend(_46,"lastIndex"),_4e=0,_4f=_ranges.length-1;
}
while(_4e<=_4f){
var _50=_ranges[_4e],_51=MAX(_4c,_50.location),_52=MIN(_4d+1,((_50).location+(_50).length));
for(;_51<_52;++_51){
_48[_4b++]=_51;
if(_4b===_49){
if(_4a){
_4a.location=_51+1;
_4a.length=_4d+1-_51-1;
}
return _49;
}
}
++_4e;
}
if(_4a){
_4a.location=CPNotFound;
_4a.length=0;
}
return _4b;
}
}),new objj_method(sel_getUid("description"),function(_53,_54){
with(_53){
var _55=objj_msgSendSuper({receiver:_53,super_class:objj_getClass("CPIndexSet").super_class},"description");
if(_count){
var _56=0,_57=_ranges.length;
_55+="[number of indexes: "+_count+" (in "+_57;
if(_57===1){
_55+=" range), indexes: (";
}else{
_55+=" ranges), indexes: (";
}
for(;_56<_57;++_56){
var _58=_ranges[_56];
_55+=_58.location;
if(_58.length>1){
_55+="-"+(CPMaxRange(_58)-1);
}
if(_56+1<_57){
_55+=" ";
}
}
_55+=")]";
}else{
_55+="(no indexes)";
}
return _55;
}
}),new objj_method(sel_getUid("enumerateIndexesUsingBlock:"),function(_59,_5a,_5b){
with(_59){
objj_msgSend(_59,"enumerateIndexesWithOptions:usingBlock:",CPEnumerationNormal,_5b);
}
}),new objj_method(sel_getUid("enumerateIndexesWithOptions:usingBlock:"),function(_5c,_5d,_5e,_5f){
with(_5c){
if(!_count){
return;
}
objj_msgSend(_5c,"enumerateIndexesInRange:options:usingBlock:",CPMakeRange(0,((_ranges[_ranges.length-1]).location+(_ranges[_ranges.length-1]).length)),_5e,_5f);
}
}),new objj_method(sel_getUid("enumerateIndexesInRange:options:usingBlock:"),function(_60,_61,_62,_63,_64){
with(_60){
if(!_count||((_62).length===0)){
return;
}
var _65=NO,_66,_67,_68;
if(_63&CPEnumerationReverse){
_66=_ranges.length-1,_67=-1,_68=-1;
}else{
_66=0;
_67=_ranges.length;
_68=1;
}
for(;_66!==_67;_66+=_68){
var _69=_ranges[_66],_6a,_6b,_6c;
if(_63&CPEnumerationReverse){
_6a=((_69).location+(_69).length)-1;
_6b=_69.location-1;
_6c=-1;
}else{
_6a=_69.location;
_6b=((_69).location+(_69).length);
_6c=1;
}
for(;_6a!==_6b;_6a+=_6c){
if((((_6a)>=(_62).location)&&((_6a)<((_62).location+(_62).length)))){
_64(_6a,function(_6d){
if(arguments.length){
return _65=_6d;
}
return _65;
});
if(_65){
return;
}
}
}
}
}
}),new objj_method(sel_getUid("indexPassingTest:"),function(_6e,_6f,_70){
with(_6e){
return objj_msgSend(_6e,"indexWithOptions:passingTest:",CPEnumerationNormal,_70);
}
}),new objj_method(sel_getUid("indexesPassingTest:"),function(_71,_72,_73){
with(_71){
return objj_msgSend(_71,"indexesWithOptions:passingTest:",CPEnumerationNormal,_73);
}
}),new objj_method(sel_getUid("indexWithOptions:passingTest:"),function(_74,_75,_76,_77){
with(_74){
if(!_count){
return CPNotFound;
}
return objj_msgSend(_74,"indexInRange:options:passingTest:",{location:(0),length:((_ranges[_ranges.length-1]).location+(_ranges[_ranges.length-1]).length)},_76,_77);
}
}),new objj_method(sel_getUid("indexesWithOptions:passingTest:"),function(_78,_79,_7a,_7b){
with(_78){
if(!_count){
return objj_msgSend(CPIndexSet,"indexSet");
}
return objj_msgSend(_78,"indexesInRange:options:passingTest:",{location:(0),length:((_ranges[_ranges.length-1]).location+(_ranges[_ranges.length-1]).length)},_7a,_7b);
}
}),new objj_method(sel_getUid("indexInRange:options:passingTest:"),function(_7c,_7d,_7e,_7f,_80){
with(_7c){
if(!_count||((_7e).length===0)){
return CPNotFound;
}
var _81=NO,_82,_83,_84;
if(_7f&CPEnumerationReverse){
_82=_ranges.length-1,_83=-1,_84=-1;
}else{
_82=0;
_83=_ranges.length;
_84=1;
}
for(;_82!==_83;_82+=_84){
var _85=_ranges[_82],_86,_87,_88;
if(_7f&CPEnumerationReverse){
_86=((_85).location+(_85).length)-1;
_87=_85.location-1;
_88=-1;
}else{
_86=_85.location;
_87=((_85).location+(_85).length);
_88=1;
}
for(;_86!==_87;_86+=_88){
if((((_86)>=(_7e).location)&&((_86)<((_7e).location+(_7e).length)))){
if(_80(_86,function(_89){
if(arguments.length){
return _81=_89;
}
return _81;
})){
return _86;
}
if(_81){
return CPNotFound;
}
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexesInRange:options:passingTest:"),function(_8a,_8b,_8c,_8d,_8e){
with(_8a){
if(!_count||((_8c).length===0)){
return objj_msgSend(CPIndexSet,"indexSet");
}
var _8f=NO,_90,_91,_92;
if(_8d&CPEnumerationReverse){
_90=_ranges.length-1,_91=-1,_92=-1;
}else{
_90=0;
_91=_ranges.length;
_92=1;
}
var _93=objj_msgSend(CPMutableIndexSet,"indexSet");
for(;_90!==_91;_90+=_92){
var _94=_ranges[_90],_95,_96,_97;
if(_8d&CPEnumerationReverse){
_95=((_94).location+(_94).length)-1;
_96=_94.location-1;
_97=-1;
}else{
_95=_94.location;
_96=((_94).location+(_94).length);
_97=1;
}
for(;_95!==_96;_95+=_97){
if((((_95)>=(_8c).location)&&((_95)<((_8c).location+(_8c).length)))){
if(_8e(_95,function(_98){
if(arguments.length){
return _8f=_98;
}
return _8f;
})){
objj_msgSend(_93,"addIndex:",_95);
}
if(_8f){
return _93;
}
}
}
}
return _93;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("indexSet"),function(_99,_9a){
with(_99){
return objj_msgSend(objj_msgSend(_99,"alloc"),"init");
}
}),new objj_method(sel_getUid("indexSetWithIndex:"),function(_9b,_9c,_9d){
with(_9b){
return objj_msgSend(objj_msgSend(_9b,"alloc"),"initWithIndex:",_9d);
}
}),new objj_method(sel_getUid("indexSetWithIndexesInRange:"),function(_9e,_9f,_a0){
with(_9e){
return objj_msgSend(objj_msgSend(_9e,"alloc"),"initWithIndexesInRange:",_a0);
}
})]);
var _1=objj_getClass("CPIndexSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addIndex:"),function(_a1,_a2,_a3){
with(_a1){
objj_msgSend(_a1,"addIndexesInRange:",{location:(_a3),length:1});
}
}),new objj_method(sel_getUid("addIndexes:"),function(_a4,_a5,_a6){
with(_a4){
var _a7=_a6._ranges,_a8=_a7.length;
while(_a8--){
objj_msgSend(_a4,"addIndexesInRange:",_a7[_a8]);
}
}
}),new objj_method(sel_getUid("addIndexesInRange:"),function(_a9,_aa,_ab){
with(_a9){
if(_ab.length<=0){
return;
}
if(_count<=0){
_count=_ab.length;
_ranges=[_ab];
return;
}
var _ac=_ranges.length,_ad=_2e(_ranges,_ab.location-1),_ae=CEIL(_ad);
if(_ae===_ad&&_ae<_ac){
_ab=CPUnionRange(_ab,_ranges[_ae]);
}
var _af=_2e(_ranges,((_ab).location+(_ab).length)),_b0=FLOOR(_af);
if(_b0===_af&&_b0>=0){
_ab=CPUnionRange(_ab,_ranges[_b0]);
}
var _b1=_b0-_ae+1;
if(_b1===_ranges.length){
_ranges=[_ab];
_count=_ab.length;
}else{
if(_b1===1){
if(_ae<_ranges.length){
_count-=_ranges[_ae].length;
}
_count+=_ab.length;
_ranges[_ae]=_ab;
}else{
if(_b1>0){
var _b2=_ae,_b3=_ae+_b1-1;
for(;_b2<=_b3;++_b2){
_count-=_ranges[_b2].length;
}
objj_msgSend(_ranges,"removeObjectsInRange:",{location:(_ae),length:_b1});
}
objj_msgSend(_ranges,"insertObject:atIndex:",_ab,_ae);
_count+=_ab.length;
}
}
}
}),new objj_method(sel_getUid("removeIndex:"),function(_b4,_b5,_b6){
with(_b4){
objj_msgSend(_b4,"removeIndexesInRange:",{location:(_b6),length:1});
}
}),new objj_method(sel_getUid("removeIndexes:"),function(_b7,_b8,_b9){
with(_b7){
var _ba=_b9._ranges,_bb=_ba.length;
while(_bb--){
objj_msgSend(_b7,"removeIndexesInRange:",_ba[_bb]);
}
}
}),new objj_method(sel_getUid("removeAllIndexes"),function(_bc,_bd){
with(_bc){
_ranges=[];
_count=0;
}
}),new objj_method(sel_getUid("removeIndexesInRange:"),function(_be,_bf,_c0){
with(_be){
if(_c0.length<=0){
return;
}
if(_count<=0){
return;
}
var _c1=_ranges.length,_c2=_2e(_ranges,_c0.location),_c3=CEIL(_c2);
if(_c2===_c3&&_c3<_c1){
var _c4=_ranges[_c3];
if(_c0.location!==_c4.location){
var _c5=((_c0).location+(_c0).length),_c6=((_c4).location+(_c4).length);
_c4.length=_c0.location-_c4.location;
if(_c5<_c6){
_count-=_c0.length;
objj_msgSend(_ranges,"insertObject:atIndex:",{location:(_c5),length:_c6-_c5},_c3+1);
return;
}else{
_count-=_c6-_c0.location;
_c3+=1;
}
}
}
var _c7=_2e(_ranges,((_c0).location+(_c0).length)-1),_c8=FLOOR(_c7);
if(_c7===_c8&&_c8>=0){
var _c5=((_c0).location+(_c0).length),_c4=_ranges[_c8],_c6=((_c4).location+(_c4).length);
if(_c5!==_c6){
_count-=_c5-_c4.location;
_c8-=1;
_c4.location=_c5;
_c4.length=_c6-_c5;
}
}
var _c9=_c8-_c3+1;
if(_c9>0){
var _ca=_c3,_cb=_c3+_c9-1;
for(;_ca<=_cb;++_ca){
_count-=_ranges[_ca].length;
}
objj_msgSend(_ranges,"removeObjectsInRange:",{location:(_c3),length:_c9});
}
}
}),new objj_method(sel_getUid("shiftIndexesStartingAtIndex:by:"),function(_cc,_cd,_ce,_cf){
with(_cc){
if(!_count||_cf==0){
return;
}
var i=_ranges.length-1,_d0=CPMakeRange(CPNotFound,0);
for(;i>=0;--i){
var _d1=_ranges[i],_d2=((_d1).location+(_d1).length);
if(_ce>=_d2){
break;
}
if(_ce>_d1.location){
_d0=CPMakeRange(_ce+_cf,_d2-_ce);
_d1.length=_ce-_d1.location;
if(_cf>0){
objj_msgSend(_ranges,"insertObject:atIndex:",_d0,i+1);
}else{
if(_d0.location<0){
_d0.length=((_d0).location+(_d0).length);
_d0.location=0;
}
}
break;
}
if((_d1.location+=_cf)<0){
_count-=_d1.length-((_d1).location+(_d1).length);
_d1.length=((_d1).location+(_d1).length);
_d1.location=0;
}
}
if(_cf<0){
var j=i+1,_d3=_ranges.length,_d4=[];
for(;j<_d3;++j){
objj_msgSend(_d4,"addObject:",_ranges[j]);
_count-=_ranges[j].length;
}
if((j=i+1)<_d3){
objj_msgSend(_ranges,"removeObjectsInRange:",{location:(j),length:_d3-j});
for(j=0,_d3=_d4.length;j<_d3;++j){
objj_msgSend(_cc,"addIndexesInRange:",_d4[j]);
}
}
if(_d0.location!=CPNotFound){
objj_msgSend(_cc,"addIndexesInRange:",_d0);
}
}
}
})]);
var _d5="CPIndexSetCountKey",_d6="CPIndexSetRangeStringsKey";
var _1=objj_getClass("CPIndexSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_d7,_d8,_d9){
with(_d7){
_d7=objj_msgSendSuper({receiver:_d7,super_class:objj_getClass("CPIndexSet").super_class},"init");
if(_d7){
_count=objj_msgSend(_d9,"decodeIntForKey:",_d5);
_ranges=[];
var _da=objj_msgSend(_d9,"decodeObjectForKey:",_d6),_db=0,_dc=_da.length;
for(;_db<_dc;++_db){
_ranges.push(CPRangeFromString(_da[_db]));
}
}
return _d7;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_dd,_de,_df){
with(_dd){
objj_msgSend(_df,"encodeInt:forKey:",_count,_d5);
var _e0=0,_e1=_ranges.length,_e2=[];
for(;_e0<_e1;++_e0){
_e2[_e0]=CPStringFromRange(_ranges[_e0]);
}
objj_msgSend(_df,"encodeObject:forKey:",_e2,_d6);
}
})]);
var _1=objj_getClass("CPIndexSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_e3,_e4){
with(_e3){
return objj_msgSend(objj_msgSend(objj_msgSend(_e3,"class"),"alloc"),"initWithIndexSet:",_e3);
}
}),new objj_method(sel_getUid("mutableCopy"),function(_e5,_e6){
with(_e5){
return objj_msgSend(objj_msgSend(objj_msgSend(_e5,"class"),"alloc"),"initWithIndexSet:",_e5);
}
})]);
var _1=objj_allocateClassPair(CPIndexSet,"CPMutableIndexSet"),_2=_1.isa;
objj_registerClassPair(_1);
var _1e=function(_e7,_e8){
var low=0,_e9=_e7.length-1;
while(low<=_e9){
var _ea=FLOOR(low+(_e9-low)/2),_eb=_e7[_ea];
if(_e8<_eb.location){
_e9=_ea-1;
}else{
if(_e8>=((_eb).location+(_eb).length)){
low=_ea+1;
}else{
return _ea;
}
}
}
return CPNotFound;
};
var _2e=function(_ec,_ed){
var _ee=_ec.length;
if(_ee<=0){
return CPNotFound;
}
var low=0,_ef=_ee*2;
while(low<=_ef){
var _f0=FLOOR(low+(_ef-low)/2),_f1=_f0/2,_f2=FLOOR(_f1);
if(_f1===_f2){
if(_f2-1>=0&&_ed<((_ec[_f2-1]).location+(_ec[_f2-1]).length)){
_ef=_f0-1;
}else{
if(_f2<_ee&&_ed>=_ec[_f2].location){
low=_f0+1;
}else{
return _f2-0.5;
}
}
}else{
var _f3=_ec[_f2];
if(_ed<_f3.location){
_ef=_f0-1;
}else{
if(_ed>=((_f3).location+(_f3).length)){
low=_f0+1;
}else{
return _f2;
}
}
}
}
return CPNotFound;
};
