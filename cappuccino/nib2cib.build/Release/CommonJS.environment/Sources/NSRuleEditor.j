@STATIC;1.0;I;21;AppKit/CPRuleEditor.jI;20;AppKit/CPTextField.ji;8;NSCell.ji;11;NSControl.jt;3211;
objj_executeFile("AppKit/CPRuleEditor.j",NO);
objj_executeFile("AppKit/CPTextField.j",NO);
objj_executeFile("NSCell.j",YES);
objj_executeFile("NSControl.j",YES);
var _1=objj_getClass("CPRuleEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPRuleEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPRuleEditor").super_class},"NS_initWithCoder:",_5);
if(_3){
_alignmentGridWidth=objj_msgSend(_5,"decodeFloatForKey:","NSRuleEditorAlignmentGridWidth");
_sliceHeight=objj_msgSend(_5,"decodeDoubleForKey:","NSRuleEditorSliceHeight");
_stringsFilename=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorStringsFileName");
_editable=objj_msgSend(_5,"decodeBoolForKey:","NSRuleEditorEditable");
_allowsEmptyCompoundRows=objj_msgSend(_5,"decodeBoolForKey:","NSRuleEditorAllowsEmptyCompoundRows");
_disallowEmpty=objj_msgSend(_5,"decodeBoolForKey:","NSRuleEditorDisallowEmpty");
_nestingMode=objj_msgSend(_5,"decodeIntForKey:","NSRuleEditorNestingMode");
_typeKeyPath=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorRowTypeKeyPath");
_itemsKeyPath=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorItemsKeyPath");
_valuesKeyPath=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorValuesKeyPath");
_subrowsArrayKeyPath=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorSubrowsArrayKeyPath");
_boundArrayKeyPath=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorBoundArrayKeyPath");
_boundArrayOwner=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorBoundArrayOwner");
_slices=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorSlices");
_ruleDelegate=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorDelegate");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPRuleEditor,"NSRuleEditor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPRuleEditor,"class");
}
})]);
var _1=objj_allocateClassPair(_CPRuleEditorViewSliceHolder,"_NSRuleEditorViewSliceHolder"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
return objj_msgSend(_b,"NS_initWithCoder:",_d);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_e,_f){
with(_e){
return objj_msgSend(_CPRuleEditorViewSliceHolder,"class");
}
})]);
var _1=objj_allocateClassPair(_CPRuleEditorViewUnboundRowHolder,"_NSRuleEditorViewUnboundRowHolder"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_10,_11,_12){
with(_10){
if(_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("_NSRuleEditorViewUnboundRowHolder").super_class},"init")){
boundArray=objj_msgSend(_12,"decodeObjectForKey:","NSBoundArray");
}
return _10;
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_13,_14){
with(_13){
return objj_msgSend(_CPRuleEditorViewUnboundRowHolder,"class");
}
})]);
