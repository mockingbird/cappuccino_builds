@STATIC;1.0;t;4282;
var _1=objj_allocateClassPair(CPObject,"_CPPredicateEditorRowNode"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("tree"),new objj_ivar("templateViews"),new objj_ivar("copiedTemplateContainer"),new objj_ivar("children")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("tree"),function(_3,_4){
with(_3){
return tree;
}
}),new objj_method(sel_getUid("setTree:"),function(_5,_6,_7){
with(_5){
tree=_7;
}
}),new objj_method(sel_getUid("templateViews"),function(_8,_9){
with(_8){
return templateViews;
}
}),new objj_method(sel_getUid("setTemplateViews:"),function(_a,_b,_c){
with(_a){
templateViews=_c;
}
}),new objj_method(sel_getUid("copiedTemplateContainer"),function(_d,_e){
with(_d){
return copiedTemplateContainer;
}
}),new objj_method(sel_getUid("setCopiedTemplateContainer:"),function(_f,_10,_11){
with(_f){
copiedTemplateContainer=_11;
}
}),new objj_method(sel_getUid("children"),function(_12,_13){
with(_12){
return children;
}
}),new objj_method(sel_getUid("setChildren:"),function(_14,_15,_16){
with(_14){
if(children!==_16){
children=objj_msgSend(_16,"copy");
}
}
}),new objj_method(sel_getUid("applyTemplate:withViews:forOriginalTemplate:"),function(_17,_18,_19,_1a,_1b){
with(_17){
var t=objj_msgSend(tree,"template"),_1c=objj_msgSend(children,"count");
if(t!==_19){
objj_msgSend(templateViews,"setArray:",_1a);
objj_msgSend(copiedTemplateContainer,"removeAllObjects");
objj_msgSend(copiedTemplateContainer,"addObject:",_19);
}
for(var i=0;i<_1c;i++){
objj_msgSend(children[i],"applyTemplate:withViews:forOriginalTemplate:",_19,_1a,_1b);
}
}
}),new objj_method(sel_getUid("isEqual:"),function(_1d,_1e,_1f){
with(_1d){
if(!objj_msgSend(_1f,"isKindOfClass:",objj_msgSend(_CPPredicateEditorRowNode,"class"))){
return NO;
}
return (tree===objj_msgSend(_1f,"tree"));
}
}),new objj_method(sel_getUid("copyTemplateIfNecessary"),function(_20,_21){
with(_20){
if(objj_msgSend(copiedTemplateContainer,"count")===0){
var _22=objj_msgSend(objj_msgSend(tree,"template"),"copy");
objj_msgSend(copiedTemplateContainer,"addObject:",_22);
objj_msgSend(templateViews,"addObjectsFromArray:",objj_msgSend(_22,"templateViews"));
}
}
}),new objj_method(sel_getUid("templateView"),function(_23,_24){
with(_23){
objj_msgSend(_23,"copyTemplateIfNecessary");
return objj_msgSend(templateViews,"objectAtIndex:",objj_msgSend(tree,"indexIntoTemplate"));
}
}),new objj_method(sel_getUid("templateForRow"),function(_25,_26){
with(_25){
objj_msgSend(_25,"copyTemplateIfNecessary");
return objj_msgSend(copiedTemplateContainer,"lastObject");
}
}),new objj_method(sel_getUid("title"),function(_27,_28){
with(_27){
return objj_msgSend(tree,"title");
}
}),new objj_method(sel_getUid("displayValue"),function(_29,_2a){
with(_29){
var _2b=objj_msgSend(_29,"title");
if(_2b!==nil){
return _2b;
}
return objj_msgSend(_29,"templateView");
}
}),new objj_method(sel_getUid("description"),function(_2c,_2d){
with(_2c){
return objj_msgSend(CPString,"stringWithFormat:","<%@ %@ %@ tree:%@ tviews:%@",objj_msgSend(_2c,"className"),objj_msgSend(_2c,"UID"),objj_msgSend(_2c,"title"),objj_msgSend(tree,"UID"),objj_msgSend(templateViews,"description"));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("rowNodeFromTree:"),function(_2e,_2f,_30){
with(_2e){
return objj_msgSend(_CPPredicateEditorRowNode,"_rowNodeFromTree:withTemplateTable:",_30,{});
}
}),new objj_method(sel_getUid("_rowNodeFromTree:withTemplateTable:"),function(_31,_32,_33,_34){
with(_31){
var _35,_36;
var _37=objj_msgSend(objj_msgSend(_33,"template"),"UID"),_38=_34[_37],_39=objj_msgSend(objj_msgSend(_CPPredicateEditorRowNode,"alloc"),"init");
objj_msgSend(_39,"setTree:",_33);
if(!_38){
_35=objj_msgSend(CPMutableArray,"array");
_36=objj_msgSend(CPMutableArray,"array");
_34[_37]=_39;
}else{
_35=objj_msgSend(_38,"templateViews");
_36=objj_msgSend(_38,"copiedTemplateContainer");
}
objj_msgSend(_39,"setTemplateViews:",_35);
objj_msgSend(_39,"setCopiedTemplateContainer:",_36);
var _3a=objj_msgSend(CPMutableArray,"array"),_3b=objj_msgSend(_33,"children"),_3c=objj_msgSend(_3b,"count");
for(var i=0;i<_3c;i++){
var _3d=_3b[i],_3e=objj_msgSend(_CPPredicateEditorRowNode,"_rowNodeFromTree:withTemplateTable:",_3d,_34);
objj_msgSend(_3a,"addObject:",_3e);
}
objj_msgSend(_39,"setChildren:",_3a);
return _39;
}
})]);
