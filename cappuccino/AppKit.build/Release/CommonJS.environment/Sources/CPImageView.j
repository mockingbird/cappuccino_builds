@STATIC;1.0;I;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jt;9964;
objj_executeFile("Foundation/CPNotificationCenter.j",NO);
objj_executeFile("CPControl.j",YES);
objj_executeFile("CPImage.j",YES);
objj_executeFile("CPShadowView.j",YES);
CPImageAlignCenter=0;
CPImageAlignTop=1;
CPImageAlignTopLeft=2;
CPImageAlignTopRight=3;
CPImageAlignLeft=4;
CPImageAlignBottom=5;
CPImageAlignBottomLeft=6;
CPImageAlignBottomRight=7;
CPImageAlignRight=8;
var _1=nil;
var _2=objj_allocateClassPair(CPControl,"CPImageView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_DOMImageElement"),new objj_ivar("_hasShadow"),new objj_ivar("_shadowView"),new objj_ivar("_isEditable"),new objj_ivar("_imageRect"),new objj_ivar("_imageAlignment")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPImageView").super_class},"initWithFrame:",_6);
if(_4){
}
return _4;
}
}),new objj_method(sel_getUid("image"),function(_7,_8){
with(_7){
return objj_msgSend(_7,"objectValue");
}
}),new objj_method(sel_getUid("setImage:"),function(_9,_a,_b){
with(_9){
objj_msgSend(_9,"setObjectValue:",_b);
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(_c,"objectValue");
if(_f===_e){
return;
}
objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPImageView").super_class},"setObjectValue:",_e);
var _10=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_f){
objj_msgSend(_10,"removeObserver:name:object:",_c,CPImageDidLoadNotification,_f);
}
var _11=objj_msgSend(_c,"objectValue");
var _12=objj_msgSend(_11,"size");
if(_12&&_12.width===-1&&_12.height===-1){
objj_msgSend(_10,"addObserver:selector:name:object:",_c,sel_getUid("imageDidLoad:"),CPImageDidLoadNotification,_11);
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
objj_msgSend(_c,"hideOrDisplayContents");
objj_msgSend(_c,"setNeedsLayout");
objj_msgSend(_c,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_13,_14,_15){
with(_13){
objj_msgSend(_13,"hideOrDisplayContents");
objj_msgSend(_13,"setNeedsLayout");
objj_msgSend(_13,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("hasShadow"),function(_16,_17){
with(_16){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_18,_19,_1a){
with(_18){
if(_hasShadow==_1a){
return;
}
_hasShadow=_1a;
if(_hasShadow){
_shadowView=objj_msgSend(objj_msgSend(CPShadowView,"alloc"),"initWithFrame:",objj_msgSend(_18,"bounds"));
objj_msgSend(_18,"addSubview:",_shadowView);
objj_msgSend(_18,"setNeedsLayout");
objj_msgSend(_18,"setNeedsDisplay:",YES);
}else{
objj_msgSend(_shadowView,"removeFromSuperview");
_shadowView=nil;
}
objj_msgSend(_18,"hideOrDisplayContents");
}
}),new objj_method(sel_getUid("setImageAlignment:"),function(_1b,_1c,_1d){
with(_1b){
if(_imageAlignment==_1d){
return;
}
_imageAlignment=_1d;
if(!objj_msgSend(_1b,"image")){
return;
}
objj_msgSend(_1b,"setNeedsLayout");
objj_msgSend(_1b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("imageAlignment"),function(_1e,_1f){
with(_1e){
return _imageAlignment;
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_20,_21,_22){
with(_20){
objj_msgSendSuper({receiver:_20,super_class:objj_getClass("CPImageView").super_class},"setImageScaling:",_22);
objj_msgSend(_20,"setNeedsLayout");
objj_msgSend(_20,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("imageScaling"),function(_23,_24){
with(_23){
return objj_msgSend(_23,"currentValueForThemeAttribute:","image-scaling");
}
}),new objj_method(sel_getUid("hideOrDisplayContents"),function(_25,_26){
with(_25){
if(!objj_msgSend(_25,"image")){
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
objj_msgSend(_shadowView,"setHidden:",NO);
}
}
}),new objj_method(sel_getUid("imageRect"),function(_27,_28){
with(_27){
return _imageRect;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_29,_2a){
with(_29){
if(!objj_msgSend(_29,"image")){
return;
}
var _2b=objj_msgSend(_29,"bounds"),_2c=objj_msgSend(_29,"image"),_2d=objj_msgSend(_29,"currentValueForThemeAttribute:","image-scaling"),x=0,y=0,_2e=(_hasShadow?objj_msgSend(_shadowView,"horizontalInset"):0),_2f=(_hasShadow?objj_msgSend(_shadowView,"verticalInset"):0),_30=(_2b.size.width),_31=(_2b.size.height),_32=_30-_2e,_33=_31-_2f;
if(_2d===CPImageScaleAxesIndependently){
}else{
var _34=objj_msgSend(_2c,"size");
if(_34.width==-1&&_34.height==-1){
return;
}
switch(_2d){
case CPImageScaleProportionallyDown:
if(_32>=_34.width&&_33>=_34.height){
_32=_34.width;
_33=_34.height;
break;
}
case CPImageScaleProportionallyUpOrDown:
var _35=_34.width/_34.height,_36=_32/_33;
if(_36>_35){
_32=_33*_35;
}else{
_33=_32/_35;
}
break;
case CPImageScaleAxesIndependently:
case CPImageScaleNone:
_32=_34.width;
_33=_34.height;
break;
}
var x,y;
switch(_imageAlignment){
case CPImageAlignLeft:
case CPImageAlignTopLeft:
case CPImageAlignBottomLeft:
x=0;
break;
case CPImageAlignRight:
case CPImageAlignTopRight:
case CPImageAlignBottomRight:
x=_30-_32;
break;
default:
x=(_30-_32)/2;
break;
}
switch(_imageAlignment){
case CPImageAlignTop:
case CPImageAlignTopLeft:
case CPImageAlignTopRight:
y=0;
break;
case CPImageAlignBottom:
case CPImageAlignBottomLeft:
case CPImageAlignBottomRight:
y=_31-_33;
break;
default:
y=(_31-_33)/2;
break;
}
}
_imageRect={origin:{x:x,y:y},size:{width:_32,height:_33}};
if(_hasShadow){
objj_msgSend(_shadowView,"setFrame:",{origin:{x:x-objj_msgSend(_shadowView,"leftInset"),y:y-objj_msgSend(_shadowView,"topInset")},size:{width:_32+_2e,height:_33+_2f}});
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_37,_38,_39){
with(_37){
objj_msgSend(objj_msgSend(_37,"nextResponder"),"mouseDown:",_39);
}
}),new objj_method(sel_getUid("setEditable:"),function(_3a,_3b,_3c){
with(_3a){
if(_isEditable===_3c){
return;
}
_isEditable=_3c;
if(_isEditable){
objj_msgSend(_3a,"registerForDraggedTypes:",[CPImagesPboardType]);
}else{
var _3d=objj_msgSend(_3a,"registeredDraggedTypes");
objj_msgSend(_3a,"unregisterDraggedTypes");
objj_msgSend(_3d,"removeObjectIdenticalTo:",CPImagesPboardType);
objj_msgSend(_3a,"registerForDraggedTypes:",_3d);
}
}
}),new objj_method(sel_getUid("isEditable"),function(_3e,_3f){
with(_3e){
return _isEditable;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_40,_41,_42){
with(_40){
var _43=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(objj_msgSend(_42,"draggingPasteboard"),"dataForType:",CPImagesPboardType));
if(objj_msgSend(_43,"count")){
objj_msgSend(_40,"setImage:",_43[0]);
objj_msgSend(_40,"sendAction:to:",objj_msgSend(_40,"action"),objj_msgSend(_40,"target"));
}
return YES;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_44,_45){
with(_44){
if(_44!==objj_msgSend(CPImageView,"class")){
return;
}
var _46=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPView,"class"));
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_46,"pathForResource:","empty.png"));
}
}),new objj_method(sel_getUid("_binderClassForBinding:"),function(_47,_48,_49){
with(_47){
if(_49===CPValueBinding||_49===CPValueURLBinding||_49===CPValuePathBinding||_49===CPDataBinding){
return objj_msgSend(CPImageViewValueBinder,"class");
}
return objj_msgSendSuper({receiver:_47,super_class:objj_getMetaClass("CPImageView").super_class},"_binderClassForBinding:",_49);
}
})]);
var _2=objj_allocateClassPair(CPBinder,"CPImageViewValueBinder"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSend(_4a,"_setPlaceholder:forMarker:isDefault:",nil,CPMultipleValuesMarker,YES);
objj_msgSend(_4a,"_setPlaceholder:forMarker:isDefault:",nil,CPNoSelectionMarker,YES);
objj_msgSend(_4a,"_setPlaceholder:forMarker:isDefault:",nil,CPNotApplicableMarker,YES);
objj_msgSend(_4a,"_setPlaceholder:forMarker:isDefault:",nil,CPNullMarker,YES);
}
}),new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"),function(_4d,_4e,_4f,_50,_51){
with(_4d){
objj_msgSend(_source,"setImage:",nil);
}
}),new objj_method(sel_getUid("setValue:forBinding:"),function(_52,_53,_54,_55){
with(_52){
var _56;
if(_55===CPDataBinding){
_56=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithData:",_54);
}else{
if(_55===CPValueURLBinding||_55===CPValuePathBinding){
_56=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_54);
}else{
if(_55===CPValueBinding){
_56=_54;
}
}
}
objj_msgSend(_source,"setImage:",_56);
}
})]);
var _57="CPImageViewImageKey",_58="CPImageViewImageScalingKey",_59="CPImageViewImageAlignmentKey",_5a="CPImageViewHasShadowKey",_5b="CPImageViewIsEditableKey";
var _2=objj_getClass("CPImageView");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPImageView\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_5c,_5d,_5e){
with(_5c){
_5c=objj_msgSendSuper({receiver:_5c,super_class:objj_getClass("CPImageView").super_class},"initWithCoder:",_5e);
if(_5c){
objj_msgSend(_5c,"setHasShadow:",objj_msgSend(_5e,"decodeBoolForKey:",_5a));
objj_msgSend(_5c,"setImageAlignment:",objj_msgSend(_5e,"decodeIntForKey:",_59));
if(objj_msgSend(_5e,"decodeBoolForKey:",_5b)){
objj_msgSend(_5c,"setEditable:",YES);
}
objj_msgSend(_5c,"setNeedsLayout");
objj_msgSend(_5c,"setNeedsDisplay:",YES);
}
return _5c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5f,_60,_61){
with(_5f){
if(_shadowView){
var _62=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_shadowView);
}
objj_msgSendSuper({receiver:_5f,super_class:objj_getClass("CPImageView").super_class},"encodeWithCoder:",_61);
if(_shadowView){
_subviews=_62;
}
objj_msgSend(_61,"encodeBool:forKey:",_hasShadow,_5a);
objj_msgSend(_61,"encodeInt:forKey:",_imageAlignment,_59);
if(_isEditable){
objj_msgSend(_61,"encodeBool:forKey:",_isEditable,_5b);
}
}
})]);
