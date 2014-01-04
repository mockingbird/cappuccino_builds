@STATIC;1.0;I;29;AppKit/_CPCibCustomResource.jt;1924;
objj_executeFile("AppKit/_CPCibCustomResource.j",NO);
var _1=require("file"),_2=require("cappuccino/imagesize").imagesize;
var _3=objj_getClass("_CPCibCustomResource");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"_CPCibCustomResource\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("_CPCibCustomResource").super_class},"init");
if(_5){
_className=CP_NSMapClassName(objj_msgSend(_7,"decodeObjectForKey:","NSClassName"));
_resourceName=objj_msgSend(_7,"decodeObjectForKey:","NSResourceName");
var _8=CGSizeMakeZero();
if(_resourceName=="NSSwitch"){
return nil;
}else{
if(_resourceName=="NSAddTemplate"||_resourceName=="NSRemoveTemplate"){
_resourceName=_resourceName.replace("NS","CP");
}else{
if(!objj_msgSend(objj_msgSend(_7,"resourcesPath"),"length")){
CPLog.warn("Resources found in nib, but no resources path specified with -R option.");
}else{
var _9=objj_msgSend(_7,"resourcePathForName:",_resourceName);
if(!_9){
CPLog.warn("Resource \""+_resourceName+"\" not found in the resources path: "+objj_msgSend(_7,"resourcesPath"));
}else{
_8=_2(_1.canonical(_9))||CGSizeMakeZero();
}
if(_9&&_1.extension(_9)!==_1.extension(_resourceName)){
_resourceName+=_1.extension(_9);
}
CPLog.debug("   Path: %s\n   Size: %dx%d",_1.canonical(_9),_8.width,_8.height);
}
}
}
_properties=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_8,"size");
}
return _5;
}
})]);
var _3=objj_allocateClassPair(_CPCibCustomResource,"NSCustomResource"),_4=_3.isa;
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"NS_initWithCoder:",_c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_d,_e){
with(_d){
return objj_msgSend(_CPCibCustomResource,"class");
}
})]);
