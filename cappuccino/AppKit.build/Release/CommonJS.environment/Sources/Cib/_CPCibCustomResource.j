@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;4412;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
var _1="_CPCibCustomResourceClassNameKey",_2="_CPCibCustomResourceResourceNameKey",_3="_CPCibCustomResourcePropertiesKey";
var _4=objj_allocateClassPair(CPObject,"_CPCibCustomResource"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_className"),new objj_ivar("_resourceName"),new objj_ivar("_properties")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithClassName:resourceName:properties:"),function(_6,_7,_8,_9,_a){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("_CPCibCustomResource").super_class},"init");
if(_6){
_className=_8;
_resourceName=_9;
_properties=_a;
}
return _6;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("_CPCibCustomResource").super_class},"init");
if(_b){
_className=objj_msgSend(_d,"decodeObjectForKey:",_1);
_resourceName=objj_msgSend(_d,"decodeObjectForKey:",_2);
_properties=objj_msgSend(_d,"decodeObjectForKey:",_3);
}
return _b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_10,"encodeObject:forKey:",_className,_1);
objj_msgSend(_10,"encodeObject:forKey:",_resourceName,_2);
objj_msgSend(_10,"encodeObject:forKey:",_properties,_3);
}
}),new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_11,_12,_13){
with(_11){
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("bundle"))&&(!objj_msgSend(_13,"respondsToSelector:",sel_getUid("awakenCustomResources"))||objj_msgSend(_13,"awakenCustomResources"))){
if(_className==="CPImage"){
if(_resourceName=="CPAddTemplate"){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPButtonBar,"class")),"pathForResource:","plus_button.png"),CGSizeMake(11,12));
}else{
if(_resourceName=="CPRemoveTemplate"){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPButtonBar,"class")),"pathForResource:","minus_button.png"),CGSizeMake(11,4));
}
}
return objj_msgSend(_11,"imageFromBundle:",objj_msgSend(_13,"bundle"));
}
}
return _11;
}
}),new objj_method(sel_getUid("imageFromBundle:"),function(_14,_15,_16){
with(_14){
if(!_16){
var _17=_properties.valueForKey("bundleClass");
if(_17){
_17=CPClassFromString(_17);
if(_17){
_16=objj_msgSend(CPBundle,"bundleForClass:",_17);
}
}else{
_16=objj_msgSend(CPBundle,"mainBundle");
}
}
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_16,"pathForResource:",_resourceName),_properties.valueForKey("size"));
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("imageResourceWithName:size:"),function(_18,_19,_1a,_1b){
with(_18){
return objj_msgSend(objj_msgSend(_18,"alloc"),"initWithClassName:resourceName:properties:","CPImage",_1a,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_1b,"size"));
}
}),new objj_method(sel_getUid("imageResourceWithName:size:bundleClass:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
return objj_msgSend(objj_msgSend(_1c,"alloc"),"initWithClassName:resourceName:properties:","CPImage",_1e,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_1f,_20],["size","bundleClass"]));
}
})]);
var _4=objj_getClass("_CPCibCustomResource");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"_CPCibCustomResource\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("filename"),function(_21,_22){
with(_21){
return objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_resourceName);
}
}),new objj_method(sel_getUid("size"),function(_23,_24){
with(_23){
return objj_msgSend(_properties,"objectForKey:","size");
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_25,_26){
with(_25){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_27,_28){
with(_27){
return NO;
}
}),new objj_method(sel_getUid("loadStatus"),function(_29,_2a){
with(_29){
return CPImageLoadStatusCompleted;
}
}),new objj_method(sel_getUid("delegate"),function(_2b,_2c){
with(_2b){
return nil;
}
}),new objj_method(sel_getUid("description"),function(_2d,_2e){
with(_2d){
var _2f=objj_msgSend(_2d,"imageFromBundle:",nil);
return objj_msgSend(_2f,"description");
}
})]);
