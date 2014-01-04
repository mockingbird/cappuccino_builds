@STATIC;1.0;I;21;Foundation/CPBundle.ji;12;CGGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPView.jt;4632;
objj_executeFile("Foundation/CPBundle.j",NO);
objj_executeFile("CGGeometry.j",YES);
objj_executeFile("CPImage.j",YES);
objj_executeFile("CPImageView.j",YES);
objj_executeFile("CPView.j",YES);
CPLightShadow=0;
CPHeavyShadow=1;
var _1=nil,_2=nil;
var _3=3,_4=3,_5=3,_6=5,_7=7,_8=7,_9=5,_a=5;
var _b=objj_allocateClassPair(CPView,"CPShadowView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_weight")]);
objj_registerClassPair(_b);
class_addMethods(_b,[new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPShadowView").super_class},"initWithFrame:",_f);
if(_d){
_weight=CPLightShadow;
objj_msgSend(_d,"setBackgroundColor:",_1);
objj_msgSend(_d,"setHitTests:",NO);
}
return _d;
}
}),new objj_method(sel_getUid("setWeight:"),function(_10,_11,_12){
with(_10){
if(_weight==_12){
return;
}
_weight=_12;
if(_weight==CPLightShadow){
objj_msgSend(_10,"setBackgroundColor:",_1);
}else{
objj_msgSend(_10,"setBackgroundColor:",_2);
}
}
}),new objj_method(sel_getUid("leftInset"),function(_13,_14){
with(_13){
return _weight==CPLightShadow?_3:_7;
}
}),new objj_method(sel_getUid("rightInset"),function(_15,_16){
with(_15){
return _weight==CPLightShadow?_4:_8;
}
}),new objj_method(sel_getUid("topInset"),function(_17,_18){
with(_17){
return _weight==CPLightShadow?_5:_9;
}
}),new objj_method(sel_getUid("bottomInset"),function(_19,_1a){
with(_19){
return _weight==CPLightShadow?_6:_a;
}
}),new objj_method(sel_getUid("horizontalInset"),function(_1b,_1c){
with(_1b){
if(_weight==CPLightShadow){
return _3+_4;
}
return _7+_8;
}
}),new objj_method(sel_getUid("verticalInset"),function(_1d,_1e){
with(_1d){
if(_weight==CPLightShadow){
return _5+_6;
}
return _9+_a;
}
}),new objj_method(sel_getUid("frameForContentFrame:"),function(_1f,_20,_21){
with(_1f){
return objj_msgSend(objj_msgSend(_1f,"class"),"frameForContentFrame:withWeight:",_21,_weight);
}
}),new objj_method(sel_getUid("setFrameForContentFrame:"),function(_22,_23,_24){
with(_22){
objj_msgSend(_22,"setFrame:",objj_msgSend(_22,"frameForContentFrame:",_24));
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("initialize"),function(_25,_26){
with(_25){
if(_25!==objj_msgSend(CPShadowView,"class")){
return;
}
var _27=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_25,"class"));
_1=CPColorWithImages([["CPShadowView/CPShadowViewLightTopLeft.png",9,9,_27],["CPShadowView/CPShadowViewLightTop.png",1,9,_27],["CPShadowView/CPShadowViewLightTopRight.png",9,9,_27],["CPShadowView/CPShadowViewLightLeft.png",9,1,_27],nil,["CPShadowView/CPShadowViewLightRight.png",9,1,_27],["CPShadowView/CPShadowViewLightBottomLeft.png",9,9,_27],["CPShadowView/CPShadowViewLightBottom.png",1,9,_27],["CPShadowView/CPShadowViewLightBottomRight.png",9,9,_27]]);
_2=CPColorWithImages([["CPShadowView/CPShadowViewHeavyTopLeft.png",17,17,_27],["CPShadowView/CPShadowViewHeavyTop.png",1,17,_27],["CPShadowView/CPShadowViewHeavyTopRight.png",17,17,_27],["CPShadowView/CPShadowViewHeavyLeft.png",17,1,_27],nil,["CPShadowView/CPShadowViewHeavyRight.png",17,1,_27],["CPShadowView/CPShadowViewHeavyBottomLeft.png",17,17,_27],["CPShadowView/CPShadowViewHeavyBottom.png",1,17,_27],["CPShadowView/CPShadowViewHeavyBottomRight.png",17,17,_27]]);
}
}),new objj_method(sel_getUid("shadowViewEnclosingView:"),function(_28,_29,_2a){
with(_28){
return objj_msgSend(_28,"shadowViewEnclosingView:withWeight:",_2a,CPLightShadow);
}
}),new objj_method(sel_getUid("shadowViewEnclosingView:withWeight:"),function(_2b,_2c,_2d,_2e){
with(_2b){
var _2f=objj_msgSend(objj_msgSend(_2b,"alloc"),"initWithFrame:",objj_msgSend(_2d,"frame"));
if(_2f){
objj_msgSend(_2f,"setWeight:",_2e);
var _30=objj_msgSend(_2f,"frame").size,_31=_30.width-objj_msgSend(_2f,"leftInset")-objj_msgSend(_2f,"rightInset"),_32=_30.height-objj_msgSend(_2f,"topInset")-objj_msgSend(_2f,"bottomInset"),_33=objj_msgSend(_2d,"superview");
objj_msgSend(_2f,"setHitTests:",objj_msgSend(_2d,"hitTests"));
objj_msgSend(_2f,"setAutoresizingMask:",objj_msgSend(_2d,"autoresizingMask"));
objj_msgSend(_2d,"removeFromSuperview");
objj_msgSend(_2f,"addSubview:",_2d);
objj_msgSend(_2d,"setFrame:",CGRectMake(objj_msgSend(_2f,"leftInset"),objj_msgSend(_2f,"topInset"),_31,_32));
objj_msgSend(_33,"addSubview:",_2f);
}
return _2f;
}
}),new objj_method(sel_getUid("frameForContentFrame:withWeight:"),function(_34,_35,_36,_37){
with(_34){
if(_37==CPLightShadow){
return CGRectMake((_36.origin.x)-_3,(_36.origin.y)-_5,(_36.size.width)+_3+_4,(_36.size.height)+_5+_6);
}else{
return CGRectMake((_36.origin.x)-_7,(_36.origin.y)-_9,(_36.size.width)+_7+_8,(_36.size.height)+_9+_a);
}
}
})]);
