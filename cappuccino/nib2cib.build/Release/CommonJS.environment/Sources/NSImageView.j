@STATIC;1.0;I;20;AppKit/CPImageView.jt;2868;
objj_executeFile("AppKit/CPImageView.j",NO);
var _1=objj_getClass("CPImageView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPImageView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPImageView").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
objj_msgSend(_3,"setImageScaling:",objj_msgSend(_6,"imageScaling"));
objj_msgSend(_3,"setImageAlignment:",objj_msgSend(_6,"imageAlignment"));
_isEditable=objj_msgSend(_6,"isEditable");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPImageView,"NSImageView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSendSuper({receiver:_7,super_class:objj_getClass("NSImageView").super_class},"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPImageView,"class");
}
})]);
NSImageAlignCenter=0;
NSImageAlignTop=1;
NSImageAlignTopLeft=2;
NSImageAlignTopRight=3;
NSImageAlignLeft=4;
NSImageAlignBottom=5;
NSImageAlignBottomLeft=6;
NSImageAlignBottomRight=7;
NSImageAlignRight=8;
NSImageScaleProportionallyDown=0;
NSImageScaleAxesIndependently=1;
NSImageScaleNone=2;
NSImageScaleProportionallyUpOrDown=3;
NSImageFrameNone=0;
NSImageFramePhoto=1;
NSImageFrameGrayBezel=2;
NSImageFrameGroove=3;
NSImageFrameButton=4;
var _1=objj_allocateClassPair(NSCell,"NSImageCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_animates"),new objj_ivar("_imageAlignment"),new objj_ivar("_imageScaling"),new objj_ivar("_frameStyle")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_animates"),function(_c,_d){
with(_c){
return _animates;
}
}),new objj_method(sel_getUid("_setAnimates:"),function(_e,_f,_10){
with(_e){
_animates=_10;
}
}),new objj_method(sel_getUid("imageAlignment"),function(_11,_12){
with(_11){
return _imageAlignment;
}
}),new objj_method(sel_getUid("imageScaling"),function(_13,_14){
with(_13){
return _imageScaling;
}
}),new objj_method(sel_getUid("_frameStyle"),function(_15,_16){
with(_15){
return _frameStyle;
}
}),new objj_method(sel_getUid("_setFrameStyle:"),function(_17,_18,_19){
with(_17){
_frameStyle=_19;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("NSImageCell").super_class},"initWithCoder:",_1c);
if(_1a){
_animates=objj_msgSend(_1c,"decodeBoolForKey:","NSAnimates");
_imageAlignment=objj_msgSend(_1c,"decodeIntForKey:","NSAlign");
_imageScaling=objj_msgSend(_1c,"decodeIntForKey:","NSScale");
_frameStyle=objj_msgSend(_1c,"decodeIntForKey:","NSStyle");
}
return _1a;
}
})]);
