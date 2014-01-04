@STATIC;1.0;I;25;AppKit/CPLevelIndicator.jt;3850;
objj_executeFile("AppKit/CPLevelIndicator.j",NO);
var _1=objj_getClass("CPLevelIndicator");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPLevelIndicator\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
_minValue=objj_msgSend(_6,"minValue");
_maxValue=objj_msgSend(_6,"maxValue");
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPLevelIndicator").super_class},"NS_initWithCoder:",_5);
if(_3){
_3=objj_msgSend(_3,"NS_initWithCell:",_6);
}
return _3;
}
}),new objj_method(sel_getUid("NS_initWithCell:"),function(_7,_8,_9){
with(_7){
_minValue=objj_msgSend(_9,"minValue");
_maxValue=objj_msgSend(_9,"maxValue");
_levelIndicatorStyle=objj_msgSend(_9,"levelIndicatorStyle");
_warningValue=objj_msgSend(_9,"warningValue");
_criticalValue=objj_msgSend(_9,"criticalValue");
_tickMarkPosition=objj_msgSend(_9,"tickMarkPosition");
_numberOfTickMarks=objj_msgSend(_9,"numberOfTickMarks");
_numberOfMajorTickMarks=objj_msgSend(_9,"numberOfMajorTickMarks");
objj_msgSend(_7,"setEditable:",objj_msgSend(_9,"isEditable"));
objj_msgSend(_7,"setEnabled:",objj_msgSend(_9,"isEnabled"));
objj_msgSend(_7,"setContinuous:",objj_msgSend(_9,"isContinuous"));
return _7;
}
})]);
var _1=objj_allocateClassPair(CPLevelIndicator,"NSLevelIndicator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"NS_initWithCoder:",_c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_d,_e){
with(_d){
return objj_msgSend(CPLevelIndicator,"class");
}
})]);
var _1=objj_allocateClassPair(NSCell,"NSLevelIndicatorCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_levelIndicatorStyle"),new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_warningValue"),new objj_ivar("_criticalValue"),new objj_ivar("_tickMarkPosition"),new objj_ivar("_numberOfTickMarks"),new objj_ivar("_numberOfMajorTickMarks")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("levelIndicatorStyle"),function(_f,_10){
with(_f){
return _levelIndicatorStyle;
}
}),new objj_method(sel_getUid("minValue"),function(_11,_12){
with(_11){
return _minValue;
}
}),new objj_method(sel_getUid("maxValue"),function(_13,_14){
with(_13){
return _maxValue;
}
}),new objj_method(sel_getUid("warningValue"),function(_15,_16){
with(_15){
return _warningValue;
}
}),new objj_method(sel_getUid("criticalValue"),function(_17,_18){
with(_17){
return _criticalValue;
}
}),new objj_method(sel_getUid("tickMarkPosition"),function(_19,_1a){
with(_19){
return _tickMarkPosition;
}
}),new objj_method(sel_getUid("numberOfTickMarks"),function(_1b,_1c){
with(_1b){
return _numberOfTickMarks;
}
}),new objj_method(sel_getUid("numberOfMajorTickMarks"),function(_1d,_1e){
with(_1d){
return _numberOfMajorTickMarks;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_1f,_20,_21){
with(_1f){
_1f=objj_msgSendSuper({receiver:_1f,super_class:objj_getClass("NSLevelIndicatorCell").super_class},"initWithCoder:",_21);
if(_1f){
_objectValue=objj_msgSend(_21,"decodeDoubleForKey:","NSValue");
_minValue=objj_msgSend(_21,"decodeDoubleForKey:","NSMinValue");
_maxValue=objj_msgSend(_21,"decodeDoubleForKey:","NSMaxValue");
_warningValue=objj_msgSend(_21,"decodeDoubleForKey:","NSWarningValue");
_criticalValue=objj_msgSend(_21,"decodeDoubleForKey:","NSCriticalValue");
_levelIndicatorStyle=objj_msgSend(_21,"decodeIntForKey:","NSIndicatorStyle");
_tickMarkPosition=objj_msgSend(_21,"decodeIntForKey:","NSTickMarkPosition");
_numberOfTickMarks=objj_msgSend(_21,"decodeIntForKey:","NSNumberOfTickMarks");
_numberOfTickMarks=objj_msgSend(_21,"decodeIntForKey:","NSNumberOfMajorTickMarks");
}
return _1f;
}
})]);
