@STATIC;1.0;I;18;AppKit/CPStepper.jt;2520;
objj_executeFile("AppKit/CPStepper.j",NO);
var _1=objj_getClass("CPStepper");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPStepper\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPStepper").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
_minValue=objj_msgSend(_6,"minValue");
_maxValue=objj_msgSend(_6,"maxValue");
_increment=objj_msgSend(_6,"increment");
_valueWraps=objj_msgSend(_6,"valueWraps");
_autorepeat=objj_msgSend(_6,"autorepeat");
_objectValue=objj_msgSend(_6,"objectValue");
_frame.origin.y+=2;
_frame.size.height-=2;
_bounds.size.height-=2;
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPStepper,"NSStepper"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPStepper,"class");
}
})]);
var _1=objj_allocateClassPair(NSCell,"NSStepperCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_increment"),new objj_ivar("_valueWraps"),new objj_ivar("_autorepeat")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("minValue"),function(_c,_d){
with(_c){
return _minValue;
}
}),new objj_method(sel_getUid("maxValue"),function(_e,_f){
with(_e){
return _maxValue;
}
}),new objj_method(sel_getUid("increment"),function(_10,_11){
with(_10){
return _increment;
}
}),new objj_method(sel_getUid("valueWraps"),function(_12,_13){
with(_12){
return _valueWraps;
}
}),new objj_method(sel_getUid("autorepeat"),function(_14,_15){
with(_14){
return _autorepeat;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_16,_17,_18){
with(_16){
_16=objj_msgSendSuper({receiver:_16,super_class:objj_getClass("NSStepperCell").super_class},"initWithCoder:",_18);
if(_16){
_objectValue=objj_msgSend(_18,"decodeDoubleForKey:","NSValue");
_minValue=objj_msgSend(_18,"decodeDoubleForKey:","NSMinValue");
_maxValue=objj_msgSend(_18,"decodeDoubleForKey:","NSMaxValue");
_increment=objj_msgSend(_18,"decodeDoubleForKey:","NSIncrement");
_valueWraps=objj_msgSend(_18,"decodeBoolForKey:","NSValueWraps");
_autorepeat=objj_msgSend(_18,"decodeBoolForKey:","NSAutorepeat");
}
return _16;
}
})]);
