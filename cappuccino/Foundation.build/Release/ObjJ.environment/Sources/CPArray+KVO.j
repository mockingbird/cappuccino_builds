@STATIC;1.0;i;9;CPArray.ji;8;CPNull.ji;27;_CPCollectionKVCOperators.jt;14412;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("_CPCollectionKVCOperators.j",YES);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("mutableArrayValueForKey:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(_CPKVCArray,"alloc"),"initWithKey:forProxyObject:",_5,_3);
}
}),new objj_method(sel_getUid("mutableArrayValueForKeyPath:"),function(_6,_7,_8){
with(_6){
var _9=_8.indexOf(".");
if(_9<0){
return objj_msgSend(_6,"mutableArrayValueForKey:",_8);
}
var _a=_8.substring(0,_9),_b=_8.substring(_9+1);
return objj_msgSend(objj_msgSend(_6,"valueForKeyPath:",_a),"mutableArrayValueForKeyPath:",_b);
}
})]);
var _1=objj_allocateClassPair(CPMutableArray,"_CPKVCArray"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_proxyObject"),new objj_ivar("_key"),new objj_ivar("_insertSEL"),new objj_ivar("_insert"),new objj_ivar("_removeSEL"),new objj_ivar("_remove"),new objj_ivar("_replaceSEL"),new objj_ivar("_replace"),new objj_ivar("_insertManySEL"),new objj_ivar("_insertMany"),new objj_ivar("_removeManySEL"),new objj_ivar("_removeMany"),new objj_ivar("_replaceManySEL"),new objj_ivar("_replaceMany"),new objj_ivar("_objectAtIndexSEL"),new objj_ivar("_objectAtIndex"),new objj_ivar("_objectsAtIndexesSEL"),new objj_ivar("_objectsAtIndexes"),new objj_ivar("_countSEL"),new objj_ivar("_count"),new objj_ivar("_accessSEL"),new objj_ivar("_access"),new objj_ivar("_setSEL"),new objj_ivar("_set")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKey:forProxyObject:"),function(_c,_d,_e,_f){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("_CPKVCArray").super_class},"init");
_key=_e;
_proxyObject=_f;
var _10=_key.charAt(0).toUpperCase()+_key.substring(1);
_insertSEL=sel_getName("insertObject:in"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_insertSEL)){
_insert=objj_msgSend(_proxyObject,"methodForSelector:",_insertSEL);
}
_removeSEL=sel_getName("removeObjectFrom"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeSEL)){
_remove=objj_msgSend(_proxyObject,"methodForSelector:",_removeSEL);
}
_replaceSEL=sel_getName("replaceObjectIn"+_10+"AtIndex:withObject:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_replaceSEL)){
_replace=objj_msgSend(_proxyObject,"methodForSelector:",_replaceSEL);
}
_insertManySEL=sel_getName("insert"+_10+":atIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_insertManySEL)){
_insertMany=objj_msgSend(_proxyObject,"methodForSelector:",_insertManySEL);
}
_removeManySEL=sel_getName("remove"+_10+"AtIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeManySEL)){
_removeMany=objj_msgSend(_proxyObject,"methodForSelector:",_removeManySEL);
}
_replaceManySEL=sel_getName("replace"+_10+"AtIndexes:with"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_replaceManySEL)){
_replaceMany=objj_msgSend(_proxyObject,"methodForSelector:",_replaceManySEL);
}
_objectAtIndexSEL=sel_getName("objectIn"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_objectAtIndexSEL)){
_objectAtIndex=objj_msgSend(_proxyObject,"methodForSelector:",_objectAtIndexSEL);
}
_objectsAtIndexesSEL=sel_getName(_key+"AtIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_objectsAtIndexesSEL)){
_objectsAtIndexes=objj_msgSend(_proxyObject,"methodForSelector:",_objectsAtIndexesSEL);
}
_countSEL=sel_getName("countOf"+_10);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_countSEL)){
_count=objj_msgSend(_proxyObject,"methodForSelector:",_countSEL);
}
_accessSEL=sel_getName(_key);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_accessSEL)){
_access=objj_msgSend(_proxyObject,"methodForSelector:",_accessSEL);
}
_setSEL=sel_getName("set"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_setSEL)){
_set=objj_msgSend(_proxyObject,"methodForSelector:",_setSEL);
}
return _c;
}
}),new objj_method(sel_getUid("copy"),function(_11,_12){
with(_11){
var i=0,_13=[],_14=objj_msgSend(_11,"count");
for(;i<_14;i++){
objj_msgSend(_13,"addObject:",objj_msgSend(_11,"objectAtIndex:",i));
}
return _13;
}
}),new objj_method(sel_getUid("_representedObject"),function(_15,_16){
with(_15){
if(_access){
return _access(_proxyObject,_accessSEL);
}
return objj_msgSend(_proxyObject,"valueForKey:",_key);
}
}),new objj_method(sel_getUid("_setRepresentedObject:"),function(_17,_18,_19){
with(_17){
if(_set){
return _set(_proxyObject,_setSEL,_19);
}
objj_msgSend(_proxyObject,"setValue:forKey:",_19,_key);
}
}),new objj_method(sel_getUid("count"),function(_1a,_1b){
with(_1a){
if(_count){
return _count(_proxyObject,_countSEL);
}
return objj_msgSend(objj_msgSend(_1a,"_representedObject"),"count");
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_1c,_1d,_1e,_1f){
with(_1c){
var _20=_1f.location,_21=_1f.length,_22=!!_1e.isa;
for(;_20<_21;++_20){
var _23=objj_msgSend(_1c,"objectAtIndex:",_20);
if(_1e===_23||_22&&!!_23.isa&&objj_msgSend(_1e,"isEqual:",_23)){
return _20;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(_24,"indexOfObject:inRange:",_26,CPMakeRange(0,objj_msgSend(_24,"count")));
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_27,_28,_29,_2a){
with(_27){
var _2b=_2a.location,_2c=_2a.length;
for(;_2b<_2c;++_2b){
if(_29===objj_msgSend(_27,"objectAtIndex:",_2b)){
return _2b;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_2d,_2e,_2f){
with(_2d){
return objj_msgSend(_2d,"indexOfObjectIdenticalTo:inRange:",_2f,CPMakeRange(0,objj_msgSend(_2d,"count")));
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_30,_31,_32){
with(_30){
return objj_msgSend(objj_msgSend(_30,"objectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_32)),"firstObject");
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_33,_34,_35){
with(_33){
if(_objectsAtIndexes){
return _objectsAtIndexes(_proxyObject,_objectsAtIndexesSEL,_35);
}
if(_objectAtIndex){
var _36=CPNotFound,_37=[];
while((_36=objj_msgSend(_35,"indexGreaterThanIndex:",_36))!==CPNotFound){
_37.push(_objectAtIndex(_proxyObject,_objectAtIndexSEL,_36));
}
return _37;
}
return objj_msgSend(objj_msgSend(_33,"_representedObject"),"objectsAtIndexes:",_35);
}
}),new objj_method(sel_getUid("addObject:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(_38,"insertObject:atIndex:",_3a,objj_msgSend(_38,"count"));
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=0,_3f=objj_msgSend(_3d,"count");
objj_msgSend(_3b,"insertObjects:atIndexes:",_3d,objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(objj_msgSend(_3b,"count"),_3f)));
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_40,_41,_42,_43){
with(_40){
objj_msgSend(_40,"insertObjects:atIndexes:",[_42],objj_msgSend(CPIndexSet,"indexSetWithIndex:",_43));
}
}),new objj_method(sel_getUid("insertObjects:atIndexes:"),function(_44,_45,_46,_47){
with(_44){
if(_insertMany){
_insertMany(_proxyObject,_insertManySEL,_46,_47);
}else{
if(_insert){
var _48=[];
objj_msgSend(_47,"getIndexes:maxCount:inIndexRange:",_48,-1,nil);
for(var _49=0;_49<objj_msgSend(_48,"count");_49++){
var _4a=objj_msgSend(_48,"objectAtIndex:",_49),_4b=objj_msgSend(_46,"objectAtIndex:",_49);
_insert(_proxyObject,_insertSEL,_4b,_4a);
}
}else{
var _4c=objj_msgSend(objj_msgSend(_44,"_representedObject"),"copy");
objj_msgSend(_4c,"insertObjects:atIndexes:",_46,_47);
objj_msgSend(_44,"_setRepresentedObject:",_4c);
}
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4d,"removeObject:inRange:",_4f,CPMakeRange(0,objj_msgSend(_4d,"count")));
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(_50,_51,_52){
with(_50){
if(_removeMany){
var _53=objj_msgSend(CPIndexSet,"indexSet"),_54=objj_msgSend(_52,"count");
while(_54--){
objj_msgSend(_53,"addIndex:",objj_msgSend(_50,"indexOfObject:",objj_msgSend(_52,"objectAtIndex:",_54)));
}
_removeMany(_proxyObject,_removeManySEL,_53);
}else{
if(_remove){
var _54=objj_msgSend(_52,"count");
while(_54--){
_remove(_proxyObject,_removeSEL,objj_msgSend(_50,"indexOfObject:",objj_msgSend(_52,"objectAtIndex:",_54)));
}
}else{
var _55=objj_msgSend(objj_msgSend(_50,"_representedObject"),"copy");
objj_msgSend(_55,"removeObjectsInArray:",_52);
objj_msgSend(_50,"_setRepresentedObject:",_55);
}
}
}
}),new objj_method(sel_getUid("removeObject:inRange:"),function(_56,_57,_58,_59){
with(_56){
if(_remove){
_remove(_proxyObject,_removeSEL,objj_msgSend(_56,"indexOfObject:inRange:",_58,_59));
}else{
if(_removeMany){
var _5a=objj_msgSend(_56,"indexOfObject:inRange:",_58,_59);
_removeMany(_proxyObject,_removeManySEL,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5a));
}else{
var _5a;
while((_5a=objj_msgSend(_56,"indexOfObject:inRange:",_58,_59))!==CPNotFound){
objj_msgSend(_56,"removeObjectAtIndex:",_5a);
_59=CPIntersectionRange(CPMakeRange(_5a,length-_5a),_59);
}
}
}
}
}),new objj_method(sel_getUid("removeLastObject"),function(_5b,_5c){
with(_5b){
objj_msgSend(_5b,"removeObjectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_5b,"count")-1));
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_5d,"removeObjectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5f));
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(_60,_61,_62){
with(_60){
if(_removeMany){
_removeMany(_proxyObject,_removeManySEL,_62);
}else{
if(_remove){
var _63=objj_msgSend(_62,"lastIndex");
while(_63!==CPNotFound){
_remove(_proxyObject,_removeSEL,_63);
_63=objj_msgSend(_62,"indexLessThanIndex:",_63);
}
}else{
var _64=objj_msgSend(objj_msgSend(_60,"_representedObject"),"copy");
objj_msgSend(_64,"removeObjectsAtIndexes:",_62);
objj_msgSend(_60,"_setRepresentedObject:",_64);
}
}
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_65,_66,_67,_68){
with(_65){
objj_msgSend(_65,"replaceObjectsAtIndexes:withObjects:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_67),[_68]);
}
}),new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"),function(_69,_6a,_6b,_6c){
with(_69){
if(_replaceMany){
return _replaceMany(_proxyObject,_replaceManySEL,_6b,_6c);
}else{
if(_replace){
var i=0,_6d=objj_msgSend(_6b,"firstIndex");
while(_6d!==CPNotFound){
_replace(_proxyObject,_replaceSEL,_6d,objj_msgSend(_6c,"objectAtIndex:",i++));
_6d=objj_msgSend(_6b,"indexGreaterThanIndex:",_6d);
}
}else{
var _6e=objj_msgSend(objj_msgSend(_69,"_representedObject"),"copy");
objj_msgSend(_6e,"replaceObjectsAtIndexes:withObjects:",_6b,_6c);
objj_msgSend(_69,"_setRepresentedObject:",_6e);
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_6f,_70){
with(_6f){
var _71=[];
_71.isa=_6f;
var _72=class_copyIvarList(_6f),_73=_72.length;
while(_73--){
_71[ivar_getName(_72[_73])]=nil;
}
return _71;
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("valueForKey:"),function(_74,_75,_76){
with(_74){
if(_76.indexOf("@")===0){
if(_76.indexOf(".")!==-1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"called valueForKey: on an array with a complex key ("+_76+"). use valueForKeyPath:");
}
if(_76==="@count"){
return length;
}
return objj_msgSend(_74,"valueForUndefinedKey:",_76);
}else{
var _77=[],_78=objj_msgSend(_74,"objectEnumerator"),_79;
while((_79=objj_msgSend(_78,"nextObject"))!==nil){
var _7a=objj_msgSend(_79,"valueForKey:",_76);
if(_7a===nil||_7a===undefined){
_7a=objj_msgSend(CPNull,"null");
}
_77.push(_7a);
}
return _77;
}
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_7b,_7c,_7d){
with(_7b){
if(!_7d){
objj_msgSend(_7b,"valueForUndefinedKey:","<empty path>");
}
if(_7d.charAt(0)==="@"){
var _7e=_7d.indexOf("."),_7f,_80;
if(_7e!==-1){
_7f=_7d.substring(1,_7e);
_80=_7d.substring(_7e+1);
}else{
_7f=_7d.substring(1);
}
return objj_msgSend(_CPCollectionKVCOperator,"performOperation:withCollection:propertyPath:",_7f,_7b,_80);
}else{
var _81=[],_82=objj_msgSend(_7b,"objectEnumerator"),_83;
while((_83=objj_msgSend(_82,"nextObject"))!==nil){
var _84=objj_msgSend(_83,"valueForKeyPath:",_7d);
if(_84===nil||_84===undefined){
_84=objj_msgSend(CPNull,"null");
}
_81.push(_84);
}
return _81;
}
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_85,_86,_87,_88){
with(_85){
var _89=objj_msgSend(_85,"objectEnumerator"),_8a;
while((_8a=objj_msgSend(_89,"nextObject"))!==nil){
objj_msgSend(_8a,"setValue:forKey:",_87,_88);
}
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_8b,_8c,_8d,_8e){
with(_8b){
var _8f=objj_msgSend(_8b,"objectEnumerator"),_90;
while((_90=objj_msgSend(_8f,"nextObject"))!==nil){
objj_msgSend(_90,"setValue:forKeyPath:",_8d,_8e);
}
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_91,_92,_93,_94,_95,_96){
with(_91){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"[CPArray "+CPStringFromSelector(_92)+"] is not supported. Key path: "+_94);
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_97,_98,_99,_9a){
with(_97){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"[CPArray "+CPStringFromSelector(_98)+"] is not supported. Key path: "+_9a);
}
}),new objj_method(sel_getUid("addObserver:toObjectsAtIndexes:forKeyPath:options:context:"),function(_9b,_9c,_9d,_9e,_9f,_a0,_a1){
with(_9b){
var _a2=objj_msgSend(_9e,"firstIndex");
while(_a2>=0){
objj_msgSend(_9b[_a2],"addObserver:forKeyPath:options:context:",_9d,_9f,_a0,_a1);
_a2=objj_msgSend(_9e,"indexGreaterThanIndex:",_a2);
}
}
}),new objj_method(sel_getUid("removeObserver:fromObjectsAtIndexes:forKeyPath:"),function(_a3,_a4,_a5,_a6,_a7){
with(_a3){
var _a8=objj_msgSend(_a6,"firstIndex");
while(_a8>=0){
objj_msgSend(_a3[_a8],"removeObserver:forKeyPath:",_a5,_a7);
_a8=objj_msgSend(_a6,"indexGreaterThanIndex:",_a8);
}
}
})]);
