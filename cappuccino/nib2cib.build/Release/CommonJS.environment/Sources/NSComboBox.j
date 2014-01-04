@STATIC;1.0;I;20;AppKit/CPTextField.jI;19;AppKit/CPComboBox.ji;13;NSTextField.jt;3298;
objj_executeFile("AppKit/CPTextField.j",NO);
objj_executeFile("AppKit/CPComboBox.j",NO);
objj_executeFile("NSTextField.j",YES);
var _1=objj_getClass("CPComboBox");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPComboBox\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPComboBox").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
_items=objj_msgSend(_6,"itemList");
_usesDataSource=objj_msgSend(_6,"usesDataSource");
_completes=objj_msgSend(_6,"completes");
_numberOfVisibleItems=objj_msgSend(_6,"visibleItemCount");
_hasVerticalScroller=objj_msgSend(_6,"hasVerticalScroller");
objj_msgSend(_3,"setButtonBordered:",objj_msgSend(_6,"borderedButton"));
var _7=objj_msgSend(objj_msgSend(objj_msgSend(Converter,"sharedConverter"),"themes")[0],"valueForAttributeWithName:forClass:","max-size",objj_msgSend(CPComboBox,"class")),_8=objj_msgSend(_3,"frameSize");
objj_msgSend(_3,"setFrameSize:",CGSizeMake(_8.width,MIN(_8.height,_7.height)));
_frame.origin.x+=1;
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPComboBox,"NSComboBox"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_9,_a,_b){
with(_9){
return objj_msgSend(_9,"NS_initWithCoder:",_b);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_c,_d){
with(_c){
return objj_msgSend(CPComboBox,"class");
}
})]);
var _1=objj_allocateClassPair(NSTextFieldCell,"NSComboBoxCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_visibleItemCount"),new objj_ivar("_hasVerticalScroller"),new objj_ivar("_usesDataSource"),new objj_ivar("_completes"),new objj_ivar("_itemList"),new objj_ivar("_borderedButton")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("visibleItemCount"),function(_e,_f){
with(_e){
return _visibleItemCount;
}
}),new objj_method(sel_getUid("hasVerticalScroller"),function(_10,_11){
with(_10){
return _hasVerticalScroller;
}
}),new objj_method(sel_getUid("usesDataSource"),function(_12,_13){
with(_12){
return _usesDataSource;
}
}),new objj_method(sel_getUid("completes"),function(_14,_15){
with(_14){
return _completes;
}
}),new objj_method(sel_getUid("itemList"),function(_16,_17){
with(_16){
return _itemList;
}
}),new objj_method(sel_getUid("borderedButton"),function(_18,_19){
with(_18){
return _borderedButton;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("NSComboBoxCell").super_class},"initWithCoder:",_1c);
if(_1a){
_visibleItemCount=objj_msgSend(_1c,"decodeIntForKey:","NSVisibleItemCount");
_hasVerticalScroller=objj_msgSend(_1c,"decodeBoolForKey:","NSHasVerticalScroller");
_usesDataSource=objj_msgSend(_1c,"decodeBoolForKey:","NSUsesDataSource");
_completes=objj_msgSend(_1c,"decodeBoolForKey:","NSCompletes");
if(!_usesDataSource){
_itemList=objj_msgSend(_1c,"decodeObjectForKey:","NSPopUpListData")||[];
}else{
_itemList=[];
}
_borderedButton=objj_msgSend(_1c,"containsValueForKey:","NSButtonBordered")?objj_msgSend(_1c,"decodeBoolForKey:","NSButtonBordered"):YES;
}
return _1a;
}
})]);
