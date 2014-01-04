@STATIC;1.0;I;26;AppKit/CPPredicateEditor.jt;2471;
objj_executeFile("AppKit/CPPredicateEditor.j",NO);
var _1=objj_getClass("CPPredicateEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPPredicateEditor").super_class},"NS_initWithCoder:",_5);
if(_3){
_allTemplates=objj_msgSend(_5,"decodeObjectForKey:","NSPredicateTemplates");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPPredicateEditor,"NSPredicateEditor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPPredicateEditor,"class");
}
})]);
var _1=objj_getClass("CPPredicateEditorRowTemplate");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditorRowTemplate\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class},"init");
if(_b){
_templateType=objj_msgSend(_d,"decodeIntForKey:","NSPredicateTemplateType");
_predicateOptions=objj_msgSend(_d,"decodeIntForKey:","NSPredicateTemplateOptions");
_predicateModifier=objj_msgSend(_d,"decodeIntForKey:","NSPredicateTemplateModifier");
_leftAttributeType=objj_msgSend(_d,"decodeIntForKey:","NSPredicateTemplateLeftAttributeType");
_rightAttributeType=objj_msgSend(_d,"decodeIntForKey:","NSPredicateTemplateRightAttributeType");
_leftIsWildcard=objj_msgSend(_d,"decodeBoolForKey:","NSPredicateTemplateLeftIsWildcard");
_rightIsWildcard=objj_msgSend(_d,"decodeBoolForKey:","NSPredicateTemplateRightIsWildcard");
_views=objj_msgSend(_d,"decodeObjectForKey:","NSPredicateTemplateViews");
}
return _b;
}
})]);
var _1=objj_allocateClassPair(CPPredicateEditorRowTemplate,"NSPredicateEditorRowTemplate"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(_e,"NS_initWithCoder:",_10);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_11,_12){
with(_11){
return objj_msgSend(CPPredicateEditorRowTemplate,"class");
}
})]);
