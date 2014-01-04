@STATIC;1.0;I;33;AppKit/CPUserDefaultsController.jt;1176;
objj_executeFile("AppKit/CPUserDefaultsController.j",NO);
var _1=objj_getClass("CPUserDefaultsController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPUserDefaultsController\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(objj_msgSend(_5,"decodeBoolForKey:","NSSharedInstance")){
return objj_msgSend(CPUserDefaultsController,"sharedUserDefaultsController");
}
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPUserDefaultsController").super_class},"NS_initWithCoder:",_5);
if(_3){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"decoding of non-shared NSUserDefaultsController not implemented");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPUserDefaultsController,"NSUserDefaultsController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPUserDefaultsController,"class");
}
})]);
