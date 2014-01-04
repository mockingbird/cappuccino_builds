@STATIC;1.0;I;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jt;11949;
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
_DOMImageElement=document.createElement("img");
_DOMImageElement.style.position="absolute";
_DOMImageElement.style.left="0px";
_DOMImageElement.style.top="0px";
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMImageElement.setAttribute("draggable","true");
_DOMImageElement.style["-khtml-user-drag"]="element";
}
_DOMElement.appendChild(_DOMImageElement);
_DOMImageElement.style.visibility="hidden";
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
_DOMImageElement.src=_11?objj_msgSend(_11,"filename"):objj_msgSend(_1,"filename");
var _12=objj_msgSend(_11,"size");
if(_12&&_12.width===-1&&_12.height===-1){
objj_msgSend(_10,"addObserver:selector:name:object:",_c,sel_getUid("imageDidLoad:"),CPImageDidLoadNotification,_11);
_DOMImageElement.width=0;
_DOMImageElement.height=0;
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
if(objj_msgSend(_20,"currentValueForThemeAttribute:","image-scaling")===CPImageScaleAxesIndependently){
if(NULL){
var _23={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _23={x:0,y:0};
}
_DOMImageElement.style.left=ROUND(_23.x)+"px";
_DOMImageElement.style.top=ROUND(_23.y)+"px";
}
objj_msgSend(_20,"setNeedsLayout");
objj_msgSend(_20,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("imageScaling"),function(_24,_25){
with(_24){
return objj_msgSend(_24,"currentValueForThemeAttribute:","image-scaling");
}
}),new objj_method(sel_getUid("hideOrDisplayContents"),function(_26,_27){
with(_26){
if(!objj_msgSend(_26,"image")){
_DOMImageElement.style.visibility="hidden";
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
_DOMImageElement.style.visibility="visible";
objj_msgSend(_shadowView,"setHidden:",NO);
}
}
}),new objj_method(sel_getUid("imageRect"),function(_28,_29){
with(_28){
return _imageRect;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_2a,_2b){
with(_2a){
if(!objj_msgSend(_2a,"image")){
return;
}
var _2c=objj_msgSend(_2a,"bounds"),_2d=objj_msgSend(_2a,"image"),_2e=objj_msgSend(_2a,"currentValueForThemeAttribute:","image-scaling"),x=0,y=0,_2f=(_hasShadow?objj_msgSend(_shadowView,"horizontalInset"):0),_30=(_hasShadow?objj_msgSend(_shadowView,"verticalInset"):0),_31=(_2c.size.width),_32=(_2c.size.height),_33=_31-_2f,_34=_32-_30;
if(_2e===CPImageScaleAxesIndependently){
_DOMImageElement.width=ROUND(_33);
_DOMImageElement.height=ROUND(_34);
}else{
var _35=objj_msgSend(_2d,"size");
if(_35.width==-1&&_35.height==-1){
return;
}
switch(_2e){
case CPImageScaleProportionallyDown:
if(_33>=_35.width&&_34>=_35.height){
_33=_35.width;
_34=_35.height;
break;
}
case CPImageScaleProportionallyUpOrDown:
var _36=_35.width/_35.height,_37=_33/_34;
if(_37>_36){
_33=_34*_36;
}else{
_34=_33/_36;
}
break;
case CPImageScaleAxesIndependently:
case CPImageScaleNone:
_33=_35.width;
_34=_35.height;
break;
}
_DOMImageElement.width=ROUND(_33);
_DOMImageElement.height=ROUND(_34);
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
x=_31-_33;
break;
default:
x=(_31-_33)/2;
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
y=_32-_34;
break;
default:
y=(_32-_34)/2;
break;
}
if(NULL){
var _38={x:CGPointMake(x,y).x*NULL.a+CGPointMake(x,y).y*NULL.c+NULL.tx,y:CGPointMake(x,y).x*NULL.b+CGPointMake(x,y).y*NULL.d+NULL.ty};
}else{
var _38={x:x,y:y};
}
_DOMImageElement.style.left=ROUND(_38.x)+"px";
_DOMImageElement.style.top=ROUND(_38.y)+"px";
}
_imageRect={origin:{x:x,y:y},size:{width:_33,height:_34}};
if(_hasShadow){
objj_msgSend(_shadowView,"setFrame:",{origin:{x:x-objj_msgSend(_shadowView,"leftInset"),y:y-objj_msgSend(_shadowView,"topInset")},size:{width:_33+_2f,height:_34+_30}});
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(objj_msgSend(_39,"nextResponder"),"mouseDown:",_3b);
}
}),new objj_method(sel_getUid("setEditable:"),function(_3c,_3d,_3e){
with(_3c){
if(_isEditable===_3e){
return;
}
_isEditable=_3e;
if(_isEditable){
objj_msgSend(_3c,"registerForDraggedTypes:",[CPImagesPboardType]);
}else{
var _3f=objj_msgSend(_3c,"registeredDraggedTypes");
objj_msgSend(_3c,"unregisterDraggedTypes");
objj_msgSend(_3f,"removeObjectIdenticalTo:",CPImagesPboardType);
objj_msgSend(_3c,"registerForDraggedTypes:",_3f);
}
}
}),new objj_method(sel_getUid("isEditable"),function(_40,_41){
with(_40){
return _isEditable;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_42,_43,_44){
with(_42){
var _45=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(objj_msgSend(_44,"draggingPasteboard"),"dataForType:",CPImagesPboardType));
if(objj_msgSend(_45,"count")){
objj_msgSend(_42,"setImage:",_45[0]);
objj_msgSend(_42,"sendAction:to:",objj_msgSend(_42,"action"),objj_msgSend(_42,"target"));
}
return YES;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_46,_47){
with(_46){
if(_46!==objj_msgSend(CPImageView,"class")){
return;
}
var _48=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPView,"class"));
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_48,"pathForResource:","empty.png"));
}
}),new objj_method(sel_getUid("_binderClassForBinding:"),function(_49,_4a,_4b){
with(_49){
if(_4b===CPValueBinding||_4b===CPValueURLBinding||_4b===CPValuePathBinding||_4b===CPDataBinding){
return objj_msgSend(CPImageViewValueBinder,"class");
}
return objj_msgSendSuper({receiver:_49,super_class:objj_getMetaClass("CPImageView").super_class},"_binderClassForBinding:",_4b);
}
})]);
var _2=objj_allocateClassPair(CPBinder,"CPImageViewValueBinder"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4c,"_setPlaceholder:forMarker:isDefault:",nil,CPMultipleValuesMarker,YES);
objj_msgSend(_4c,"_setPlaceholder:forMarker:isDefault:",nil,CPNoSelectionMarker,YES);
objj_msgSend(_4c,"_setPlaceholder:forMarker:isDefault:",nil,CPNotApplicableMarker,YES);
objj_msgSend(_4c,"_setPlaceholder:forMarker:isDefault:",nil,CPNullMarker,YES);
}
}),new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"),function(_4f,_50,_51,_52,_53){
with(_4f){
objj_msgSend(_source,"setImage:",nil);
}
}),new objj_method(sel_getUid("setValue:forBinding:"),function(_54,_55,_56,_57){
with(_54){
var _58;
if(_57===CPDataBinding){
_58=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithData:",_56);
}else{
if(_57===CPValueURLBinding||_57===CPValuePathBinding){
_58=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_56);
}else{
if(_57===CPValueBinding){
_58=_56;
}
}
}
objj_msgSend(_source,"setImage:",_58);
}
})]);
var _59="CPImageViewImageKey",_5a="CPImageViewImageScalingKey",_5b="CPImageViewImageAlignmentKey",_5c="CPImageViewHasShadowKey",_5d="CPImageViewIsEditableKey";
var _2=objj_getClass("CPImageView");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPImageView\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_5e,_5f,_60){
with(_5e){
_DOMImageElement=document.createElement("img");
_DOMImageElement.style.position="absolute";
_DOMImageElement.style.left="0px";
_DOMImageElement.style.top="0px";
_DOMImageElement.style.visibility="hidden";
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMImageElement.setAttribute("draggable","true");
_DOMImageElement.style["-khtml-user-drag"]="element";
}
if(typeof (appkit_tag_dom_elements)!=="undefined"&&!!appkit_tag_dom_elements){
_DOMImageElement.setAttribute("data-cappuccino-view",objj_msgSend(_5e,"className"));
}
_5e=objj_msgSendSuper({receiver:_5e,super_class:objj_getClass("CPImageView").super_class},"initWithCoder:",_60);
if(_5e){
_DOMElement.appendChild(_DOMImageElement);
objj_msgSend(_5e,"setHasShadow:",objj_msgSend(_60,"decodeBoolForKey:",_5c));
objj_msgSend(_5e,"setImageAlignment:",objj_msgSend(_60,"decodeIntForKey:",_5b));
if(objj_msgSend(_60,"decodeBoolForKey:",_5d)){
objj_msgSend(_5e,"setEditable:",YES);
}
objj_msgSend(_5e,"setNeedsLayout");
objj_msgSend(_5e,"setNeedsDisplay:",YES);
}
return _5e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_61,_62,_63){
with(_61){
if(_shadowView){
var _64=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_shadowView);
}
objj_msgSendSuper({receiver:_61,super_class:objj_getClass("CPImageView").super_class},"encodeWithCoder:",_63);
if(_shadowView){
_subviews=_64;
}
objj_msgSend(_63,"encodeBool:forKey:",_hasShadow,_5c);
objj_msgSend(_63,"encodeInt:forKey:",_imageAlignment,_5b);
if(_isEditable){
objj_msgSend(_63,"encodeBool:forKey:",_isEditable,_5d);
}
}
})]);
