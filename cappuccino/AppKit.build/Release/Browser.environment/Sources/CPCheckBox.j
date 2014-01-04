@STATIC;1.0;i;10;CPButton.jt;3599;
objj_executeFile("CPButton.j",YES);
CPCheckBoxImageOffset=4;
var _1=objj_allocateClassPair(CPButton,"CPCheckBox"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPCheckBox").super_class},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_3,"setShowsStateBy:",CPContentsCellMask);
objj_msgSend(_3,"setImagePosition:",CPImageLeft);
objj_msgSend(_3,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_3,"setBordered:",NO);
}
return _3;
}
}),new objj_method(sel_getUid("takeStateFromKeyPath:ofObjects:"),function(_6,_7,_8,_9){
with(_6){
var _a=_9.length,_b=objj_msgSend(_9[0],"valueForKeyPath:",_8)?CPOnState:CPOffState;
objj_msgSend(_6,"setAllowsMixedState:",NO);
objj_msgSend(_6,"setState:",_b);
while(_a-->1){
if(_b!==(objj_msgSend(_9[_a],"valueForKeyPath:",_8)?CPOnState:CPOffState)){
objj_msgSend(_6,"setAllowsMixedState:",YES);
objj_msgSend(_6,"setState:",CPMixedState);
}
}
}
}),new objj_method(sel_getUid("takeValueFromKeyPath:ofObjects:"),function(_c,_d,_e,_f){
with(_c){
objj_msgSend(_c,"takeStateFromKeyPath:ofObjects:",_e,_f);
}
}),new objj_method(sel_getUid("image"),function(_10,_11){
with(_10){
return objj_msgSend(_10,"currentValueForThemeAttribute:","image");
}
}),new objj_method(sel_getUid("alternateImage"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"currentValueForThemeAttribute:","image");
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_14,_15,_16){
with(_14){
var _17=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPCheckBox").super_class},"startTrackingAt:",_16);
objj_msgSend(_14,"highlight:",YES);
return _17;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("checkBoxWithTitle:theme:"),function(_18,_19,_1a,_1b){
with(_18){
return objj_msgSend(_18,"buttonWithTitle:theme:",_1a,_1b);
}
}),new objj_method(sel_getUid("checkBoxWithTitle:"),function(_1c,_1d,_1e){
with(_1c){
return objj_msgSend(_1c,"buttonWithTitle:",_1e);
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(_1f,_20){
with(_1f){
return "check-box";
}
}),new objj_method(sel_getUid("_binderClassForBinding:"),function(_21,_22,_23){
with(_21){
if(_23===CPValueBinding){
return objj_msgSend(_CPCheckBoxValueBinder,"class");
}
return objj_msgSendSuper({receiver:_21,super_class:objj_getMetaClass("CPCheckBox").super_class},"_binderClassForBinding:",_23);
}
})]);
var _1=objj_allocateClassPair(CPBinder,"_CPCheckBoxValueBinder"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"),function(_24,_25,_26){
with(_24){
objj_msgSendSuper({receiver:_24,super_class:objj_getClass("_CPCheckBoxValueBinder").super_class},"_updatePlaceholdersWithOptions:",_26);
objj_msgSend(_24,"_setPlaceholder:forMarker:isDefault:",CPMixedState,CPMultipleValuesMarker,YES);
objj_msgSend(_24,"_setPlaceholder:forMarker:isDefault:",CPOffState,CPNoSelectionMarker,YES);
objj_msgSend(_24,"_setPlaceholder:forMarker:isDefault:",CPOffState,CPNotApplicableMarker,YES);
objj_msgSend(_24,"_setPlaceholder:forMarker:isDefault:",CPOffState,CPNullMarker,YES);
}
}),new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"),function(_27,_28,_29,_2a,_2b){
with(_27){
objj_msgSend(_source,"setAllowsMixedState:",(_29===CPMixedState));
objj_msgSend(_source,"setState:",_29);
}
}),new objj_method(sel_getUid("setValue:forBinding:"),function(_2c,_2d,_2e,_2f){
with(_2c){
objj_msgSend(_source,"setState:",_2e);
}
})]);
