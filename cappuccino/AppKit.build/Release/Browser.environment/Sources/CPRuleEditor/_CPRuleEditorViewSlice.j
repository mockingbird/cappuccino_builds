@STATIC;1.0;t;4145;
var _1=objj_allocateClassPair(CPView,"_CPRuleEditorViewSlice"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_ruleEditor"),new objj_ivar("_indentation"),new objj_ivar("_rowIndex"),new objj_ivar("_animationTargetRect"),new objj_ivar("_selected"),new objj_ivar("_lastSelected"),new objj_ivar("_backgroundColor")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("indentation"),function(_3,_4){
with(_3){
return _indentation;
}
}),new objj_method(sel_getUid("setIndentation:"),function(_5,_6,_7){
with(_5){
_indentation=_7;
}
}),new objj_method(sel_getUid("rowIndex"),function(_8,_9){
with(_8){
return _rowIndex;
}
}),new objj_method(sel_getUid("setRowIndex:"),function(_a,_b,_c){
with(_a){
_rowIndex=_c;
}
}),new objj_method(sel_getUid("_animationTargetRect"),function(_d,_e){
with(_d){
return _animationTargetRect;
}
}),new objj_method(sel_getUid("_setAnimationTargetRect:"),function(_f,_10,_11){
with(_f){
_animationTargetRect=_11;
}
}),new objj_method(sel_getUid("_isSelected"),function(_12,_13){
with(_12){
return _selected;
}
}),new objj_method(sel_getUid("_setSelected:"),function(_14,_15,_16){
with(_14){
_selected=_16;
}
}),new objj_method(sel_getUid("_isLastSelected"),function(_17,_18){
with(_17){
return _lastSelected;
}
}),new objj_method(sel_getUid("_setLastSelected:"),function(_19,_1a,_1b){
with(_19){
_lastSelected=_1b;
}
}),new objj_method(sel_getUid("backgroundColor"),function(_1c,_1d){
with(_1c){
return _backgroundColor;
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_1e,_1f,_20){
with(_1e){
_backgroundColor=_20;
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_21,_22){
with(_21){
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("_CPRuleEditorViewSlice").super_class},"removeFromSuperview");
}
}),new objj_method(sel_getUid("initWithFrame:ruleEditorView:"),function(_23,_24,_25,_26){
with(_23){
if(_23=objj_msgSendSuper({receiver:_23,super_class:objj_getClass("_CPRuleEditorViewSlice").super_class},"initWithFrame:",_25)){
_ruleEditor=_26;
_selected=NO;
_lastSelected=NO;
}
return _23;
}
}),new objj_method(sel_getUid("_setSelected:"),function(_27,_28,_29){
with(_27){
if(_29==_selected){
return;
}
var _2a=_29?"setThemeState:":"unsetThemeState:";
objj_msgSend(objj_msgSend(_27,"subviews"),"makeObjectsPerformSelector:withObject:",CPSelectorFromString(_2a),CPThemeStateSelectedDataView);
_selected=_29;
}
}),new objj_method(sel_getUid("drawRect:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_2f=objj_msgSend(_2b,"bounds"),_30=CGRectGetWidth(_2f)-2,_31=CGRectGetHeight(_2f);
if(objj_msgSend(_2b,"_isSelected")){
_backgroundColor=objj_msgSend(_ruleEditor,"_selectedRowColor");
}else{
var _32=objj_msgSend(_ruleEditor,"_backgroundColors"),_33=objj_msgSend(_32,"count");
_backgroundColor=objj_msgSend(_32,"objectAtIndex:",(_rowIndex%_33));
}
CGContextSetFillColor(_2e,_backgroundColor);
CGContextFillRect(_2e,_2d);
CGContextBeginPath(_2e);
CGContextMoveToPoint(_2e,1,0);
CGContextAddLineToPoint(_2e,_30,0);
CGContextClosePath(_2e);
CGContextSetStrokeColor(_2e,objj_msgSend(_ruleEditor,"_sliceTopBorderColor"));
CGContextStrokePath(_2e);
CGContextBeginPath(_2e);
CGContextMoveToPoint(_2e,1,_31-0.5);
CGContextAddLineToPoint(_2e,_30,_31-0.5);
CGContextClosePath(_2e);
var _34=(_rowIndex==objj_msgSend(_ruleEditor,"_lastRow"))?objj_msgSend(_ruleEditor,"_sliceLastBottomBorderColor"):objj_msgSend(_ruleEditor,"_sliceBottomBorderColor");
CGContextSetStrokeColor(_2e,_34);
CGContextStrokePath(_2e);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_35,_36,_37){
with(_35){
if(editable){
objj_msgSend(_ruleEditor,"_mouseDownOnSlice:withEvent:",_35,_37);
}
}
}),new objj_method(sel_getUid("mouseUp:"),function(_38,_39,_3a){
with(_38){
if(editable){
objj_msgSend(_ruleEditor,"_mouseUpOnSlice:withEvent:",_38,_3a);
}
}
}),new objj_method(sel_getUid("description"),function(_3b,_3c){
with(_3b){
return objj_msgSend(CPString,"stringWithFormat:","<%@ %p index:%d indentation:%d>",objj_msgSend(_3b,"className"),_3b,objj_msgSend(_3b,"rowIndex"),objj_msgSend(_3b,"indentation"));
}
})]);
