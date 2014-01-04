@STATIC;1.0;i;9;CPArray.ji;9;CPCoder.ji;8;CPData.ji;14;CPDictionary.ji;10;CPNumber.ji;10;CPString.ji;9;CPValue.jt;10140;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPData.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPNumber.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPValue.j",YES);
var _1=nil;
var _2=1,_3=2,_4=4,_5=8,_6=16;
var _7="$null",_8=nil,_9="CP$UID",_a="$top",_b="$objects",_c="$archiver",_d="$version",_e="$classname",_f="$classes",_10="$class";
var _11=Nil,_12=Nil;
var _13=objj_allocateClassPair(CPValue,"_CPKeyedArchiverValue"),_14=_13.isa;
objj_registerClassPair(_13);
var _13=objj_allocateClassPair(CPCoder,"CPKeyedArchiver"),_14=_13.isa;
class_addIvars(_13,[new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors"),new objj_ivar("_data"),new objj_ivar("_objects"),new objj_ivar("_UIDs"),new objj_ivar("_conditionalUIDs"),new objj_ivar("_replacementObjects"),new objj_ivar("_replacementClassNames"),new objj_ivar("_plistObject"),new objj_ivar("_plistObjects"),new objj_ivar("_outputFormat")]);
objj_registerClassPair(_13);
class_addMethods(_13,[new objj_method(sel_getUid("initForWritingWithMutableData:"),function(_15,_16,_17){
with(_15){
_15=objj_msgSendSuper({receiver:_15,super_class:objj_getClass("CPKeyedArchiver").super_class},"init");
if(_15){
_data=_17;
_objects=[];
_UIDs=objj_msgSend(CPDictionary,"dictionary");
_conditionalUIDs=objj_msgSend(CPDictionary,"dictionary");
_replacementObjects=objj_msgSend(CPDictionary,"dictionary");
_plistObject=objj_msgSend(CPDictionary,"dictionary");
_plistObjects=objj_msgSend(CPArray,"arrayWithObject:",_7);
}
return _15;
}
}),new objj_method(sel_getUid("finishEncoding"),function(_18,_19){
with(_18){
if(_delegate&&_delegateSelectors&_6){
objj_msgSend(_delegate,"archiverWillFinish:",_18);
}
var i=0,_1a=_plistObject,_1b=[];
for(;i<_objects.length;++i){
var _1c=_objects[i];
_plistObject=_plistObjects[objj_msgSend(_UIDs,"objectForKey:",objj_msgSend(_1c,"UID"))];
objj_msgSend(_1c,"encodeWithCoder:",_18);
if(_delegate&&_delegateSelectors&_2){
objj_msgSend(_delegate,"archiver:didEncodeObject:",_18,_1c);
}
}
_plistObject=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_plistObject,"setObject:forKey:",_1a,_a);
objj_msgSend(_plistObject,"setObject:forKey:",_plistObjects,_b);
objj_msgSend(_plistObject,"setObject:forKey:",objj_msgSend(_18,"className"),_c);
objj_msgSend(_plistObject,"setObject:forKey:","100000",_d);
objj_msgSend(_data,"setPlistObject:",_plistObject);
if(_delegate&&_delegateSelectors&_5){
objj_msgSend(_delegate,"archiverDidFinish:",_18);
}
}
}),new objj_method(sel_getUid("outputFormat"),function(_1d,_1e){
with(_1d){
return _outputFormat;
}
}),new objj_method(sel_getUid("setOutputFormat:"),function(_1f,_20,_21){
with(_1f){
_outputFormat=_21;
}
}),new objj_method(sel_getUid("encodeBool:forKey:"),function(_22,_23,_24,_25){
with(_22){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_22,_24,NO),_25);
}
}),new objj_method(sel_getUid("encodeDouble:forKey:"),function(_27,_28,_29,_2a){
with(_27){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_27,_29,NO),_2a);
}
}),new objj_method(sel_getUid("encodeFloat:forKey:"),function(_2b,_2c,_2d,_2e){
with(_2b){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_2b,_2d,NO),_2e);
}
}),new objj_method(sel_getUid("encodeInt:forKey:"),function(_2f,_30,_31,_32){
with(_2f){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_2f,_31,NO),_32);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_33,_34,_35){
with(_33){
_delegate=_35;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:didEncodeObject:"))){
_delegateSelectors|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willEncodeObject:"))){
_delegateSelectors|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willReplaceObject:withObject:"))){
_delegateSelectors|=_4;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:didFinishEncoding:"))){
_delegateSelectors|=_CPKeyedArchiverDidFinishEncodingSelector;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willFinishEncoding:"))){
_delegateSelectors|=_CPKeyedArchiverWillFinishEncodingSelector;
}
}
}),new objj_method(sel_getUid("delegate"),function(_36,_37){
with(_36){
return _delegate;
}
}),new objj_method(sel_getUid("encodePoint:forKey:"),function(_38,_39,_3a,_3b){
with(_38){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_38,CPStringFromPoint(_3a),NO),_3b);
}
}),new objj_method(sel_getUid("encodeRect:forKey:"),function(_3c,_3d,_3e,_3f){
with(_3c){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_3c,CPStringFromRect(_3e),NO),_3f);
}
}),new objj_method(sel_getUid("encodeSize:forKey:"),function(_40,_41,_42,_43){
with(_40){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_40,CPStringFromSize(_42),NO),_43);
}
}),new objj_method(sel_getUid("encodeConditionalObject:forKey:"),function(_44,_45,_46,_47){
with(_44){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_44,_46,YES),_47);
}
}),new objj_method(sel_getUid("encodeNumber:forKey:"),function(_48,_49,_4a,_4b){
with(_48){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_48,_4a,NO),_4b);
}
}),new objj_method(sel_getUid("encodeObject:forKey:"),function(_4c,_4d,_4e,_4f){
with(_4c){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_4c,_4e,NO),_4f);
}
}),new objj_method(sel_getUid("_encodeArrayOfObjects:forKey:"),function(_50,_51,_52,_53){
with(_50){
var i=0,_54=_52.length,_55=[];
for(;i<_54;++i){
objj_msgSend(_55,"addObject:",_26(_50,_52[i],NO));
}
objj_msgSend(_plistObject,"setObject:forKey:",_55,_53);
}
}),new objj_method(sel_getUid("_encodeDictionaryOfObjects:forKey:"),function(_56,_57,_58,_59){
with(_56){
var key,_5a=objj_msgSend(_58,"keyEnumerator"),_5b=objj_msgSend(CPDictionary,"dictionary");
while((key=objj_msgSend(_5a,"nextObject"))!==nil){
objj_msgSend(_5b,"setObject:forKey:",_26(_56,objj_msgSend(_58,"objectForKey:",key),NO),key);
}
objj_msgSend(_plistObject,"setObject:forKey:",_5b,_59);
}
}),new objj_method(sel_getUid("setClassName:forClass:"),function(_5c,_5d,_5e,_5f){
with(_5c){
if(!_replacementClassNames){
_replacementClassNames=objj_msgSend(CPDictionary,"dictionary");
}
objj_msgSend(_replacementClassNames,"setObject:forKey:",_5e,CPStringFromClass(_5f));
}
}),new objj_method(sel_getUid("classNameForClass:"),function(_60,_61,_62){
with(_60){
if(!_replacementClassNames){
return _62.name;
}
var _63=objj_msgSend(_replacementClassNames,"objectForKey:",CPStringFromClass(aClassName));
return _63?_63:_62.name;
}
})]);
class_addMethods(_14,[new objj_method(sel_getUid("initialize"),function(_64,_65){
with(_64){
if(_64!==objj_msgSend(CPKeyedArchiver,"class")){
return;
}
_11=objj_msgSend(CPString,"class");
_12=objj_msgSend(CPNumber,"class");
_8=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",0,_9);
}
}),new objj_method(sel_getUid("allowsKeyedCoding"),function(_66,_67){
with(_66){
return YES;
}
}),new objj_method(sel_getUid("archivedDataWithRootObject:"),function(_68,_69,_6a){
with(_68){
var _6b=objj_msgSend(CPData,"dataWithPlistObject:",nil),_6c=objj_msgSend(objj_msgSend(_68,"alloc"),"initForWritingWithMutableData:",_6b);
objj_msgSend(_6c,"encodeObject:forKey:",_6a,"root");
objj_msgSend(_6c,"finishEncoding");
return _6b;
}
}),new objj_method(sel_getUid("setClassName:forClass:"),function(_6d,_6e,_6f,_70){
with(_6d){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
}
objj_msgSend(_1,"setObject:forKey:",_6f,CPStringFromClass(_70));
}
}),new objj_method(sel_getUid("classNameForClass:"),function(_71,_72,_73){
with(_71){
if(!_1){
return _73.name;
}
var _74=objj_msgSend(_1,"objectForKey:",CPStringFromClass(_73));
return _74?_74:_73.name;
}
})]);
var _26=function(_75,_76,_77){
if(_76!==nil&&_76!==undefined&&!_76.isa){
_76=objj_msgSend(_CPKeyedArchiverValue,"valueWithJSObject:",_76);
}
var _78=objj_msgSend(_76,"UID"),_79=objj_msgSend(_75._replacementObjects,"objectForKey:",_78);
if(_79===nil){
_79=objj_msgSend(_76,"replacementObjectForKeyedArchiver:",_75);
if(_75._delegate){
if(_79!==_76&&_75._delegateSelectors&_4){
objj_msgSend(_75._delegate,"archiver:willReplaceObject:withObject:",_75,_76,_79);
}
if(_75._delegateSelectors&_3){
_76=objj_msgSend(_75._delegate,"archiver:willEncodeObject:",_75,_79);
if(_76!==_79&&_75._delegateSelectors&_4){
objj_msgSend(_75._delegate,"archiver:willReplaceObject:withObject:",_75,_79,_76);
}
_79=_76;
}
}
objj_msgSend(_75._replacementObjects,"setObject:forKey:",_79,_78);
}
if(_79===nil){
return _8;
}
var UID=objj_msgSend(_75._UIDs,"objectForKey:",_78=objj_msgSend(_79,"UID"));
if(UID===nil){
if(_77){
if((UID=objj_msgSend(_75._conditionalUIDs,"objectForKey:",_78))===nil){
objj_msgSend(_75._conditionalUIDs,"setObject:forKey:",UID=objj_msgSend(_75._plistObjects,"count"),_78);
objj_msgSend(_75._plistObjects,"addObject:",_7);
}
}else{
var _7a=objj_msgSend(_79,"classForKeyedArchiver"),_7b=nil;
if((_7a===_11)||(_7a===_12)){
_7b=_79;
}else{
_7b=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_75._objects,"addObject:",_79);
var _7c=objj_msgSend(_75,"classNameForClass:",_7a);
if(!_7c){
_7c=objj_msgSend(objj_msgSend(_75,"class"),"classNameForClass:",_7a);
}
if(!_7c){
_7c=_7a.name;
}else{
_7a=CPClassFromString(_7c);
}
var _7d=objj_msgSend(_75._UIDs,"objectForKey:",_7c);
if(!_7d){
var _7e=objj_msgSend(CPDictionary,"dictionary"),_7f=[];
objj_msgSend(_7e,"setObject:forKey:",_7c,_e);
do{
objj_msgSend(_7f,"addObject:",CPStringFromClass(_7a));
}while(_7a=objj_msgSend(_7a,"superclass"));
objj_msgSend(_7e,"setObject:forKey:",_7f,_f);
_7d=objj_msgSend(_75._plistObjects,"count");
objj_msgSend(_75._plistObjects,"addObject:",_7e);
objj_msgSend(_75._UIDs,"setObject:forKey:",_7d,_7c);
}
objj_msgSend(_7b,"setObject:forKey:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_7d,_9),_10);
}
UID=objj_msgSend(_75._conditionalUIDs,"objectForKey:",_78);
if(UID!==nil){
objj_msgSend(_75._UIDs,"setObject:forKey:",UID,_78);
objj_msgSend(_75._plistObjects,"replaceObjectAtIndex:withObject:",UID,_7b);
}else{
objj_msgSend(_75._UIDs,"setObject:forKey:",UID=objj_msgSend(_75._plistObjects,"count"),_78);
objj_msgSend(_75._plistObjects,"addObject:",_7b);
}
}
}
return objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",UID,_9);
};
