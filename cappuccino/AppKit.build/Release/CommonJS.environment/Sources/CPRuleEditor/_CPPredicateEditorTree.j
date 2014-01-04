@STATIC;1.0;t;2042;
var _1=objj_allocateClassPair(CPObject,"_CPPredicateEditorTree"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("template"),new objj_ivar("title"),new objj_ivar("children"),new objj_ivar("indexIntoTemplate"),new objj_ivar("menuItemIndex")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("template"),function(_3,_4){
with(_3){
return template;
}
}),new objj_method(sel_getUid("setTemplate:"),function(_5,_6,_7){
with(_5){
template=_7;
}
}),new objj_method(sel_getUid("title"),function(_8,_9){
with(_8){
return title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_a,_b,_c){
with(_a){
if(title!==_c){
title=objj_msgSend(_c,"copy");
}
}
}),new objj_method(sel_getUid("children"),function(_d,_e){
with(_d){
return children;
}
}),new objj_method(sel_getUid("setChildren:"),function(_f,_10,_11){
with(_f){
if(children!==_11){
children=objj_msgSend(_11,"copy");
}
}
}),new objj_method(sel_getUid("indexIntoTemplate"),function(_12,_13){
with(_12){
return indexIntoTemplate;
}
}),new objj_method(sel_getUid("setIndexIntoTemplate:"),function(_14,_15,_16){
with(_14){
indexIntoTemplate=_16;
}
}),new objj_method(sel_getUid("menuItemIndex"),function(_17,_18){
with(_17){
return menuItemIndex;
}
}),new objj_method(sel_getUid("setMenuItemIndex:"),function(_19,_1a,_1b){
with(_19){
menuItemIndex=_1b;
}
}),new objj_method(sel_getUid("copy"),function(_1c,_1d){
with(_1c){
var _1e=objj_msgSend(objj_msgSend(_CPPredicateEditorTree,"alloc"),"init");
objj_msgSend(_1e,"setTemplate:",template);
objj_msgSend(_1e,"setTitle:",title);
objj_msgSend(_1e,"setMenuItemIndex:",menuItemIndex);
objj_msgSend(_1e,"setIndexIntoTemplate:",indexIntoTemplate);
objj_msgSend(_1e,"setChildren:",children);
return _1e;
}
}),new objj_method(sel_getUid("description"),function(_1f,_20){
with(_1f){
return objj_msgSend(CPString,"stringWithFormat:","<%@: %p (%@) [%d-%d] T:%p at:%d> [\r%@\r]",objj_msgSend(_1f,"className"),_1f,title,indexIntoTemplate,menuItemIndex,template,objj_msgSend(template,"rightExpressionAttributeType"),children);
}
})]);
