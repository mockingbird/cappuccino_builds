@STATIC;1.0;I;21;Foundation/CPString.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;8;CPView.ji;11;CPControl.jt;8023;
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("CPColor.j",YES);
objj_executeFile("CPFont.j",YES);
objj_executeFile("CPImage.j",YES);
objj_executeFile("CPView.j",YES);
objj_executeFile("CPControl.j",YES);
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4,_6=1<<5,_7=1<<6,_8=1<<7,_9=1<<8,_a=1<<9,_b=1<<10;
var _c=objj_allocateClassPair(CPView,"_CPImageAndTextView"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_alignment"),new objj_ivar("_verticalAlignment"),new objj_ivar("_lineBreakMode"),new objj_ivar("_textColor"),new objj_ivar("_font"),new objj_ivar("_textShadowColor"),new objj_ivar("_textShadowOffset"),new objj_ivar("_imagePosition"),new objj_ivar("_imageScaling"),new objj_ivar("_imageOffset"),new objj_ivar("_shouldDimImage"),new objj_ivar("_image"),new objj_ivar("_text"),new objj_ivar("_textSize"),new objj_ivar("_flags")]);
objj_registerClassPair(_c);
class_addMethods(_c,[new objj_method(sel_getUid("initWithFrame:control:"),function(_e,_f,_10,_11){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("_CPImageAndTextView").super_class},"initWithFrame:",_10);
if(_e){
_textShadowOffset={width:0,height:0};
objj_msgSend(_e,"setVerticalAlignment:",CPTopVerticalTextAlignment);
if(_11){
objj_msgSend(_e,"setLineBreakMode:",objj_msgSend(_11,"lineBreakMode"));
objj_msgSend(_e,"setTextColor:",objj_msgSend(_11,"textColor"));
objj_msgSend(_e,"setAlignment:",objj_msgSend(_11,"alignment"));
objj_msgSend(_e,"setVerticalAlignment:",objj_msgSend(_11,"verticalAlignment"));
objj_msgSend(_e,"setFont:",objj_msgSend(_11,"font"));
objj_msgSend(_e,"setImagePosition:",objj_msgSend(_11,"imagePosition"));
objj_msgSend(_e,"setImageScaling:",objj_msgSend(_11,"imageScaling"));
objj_msgSend(_e,"setImageOffset:",objj_msgSend(_11,"imageOffset"));
}else{
objj_msgSend(_e,"setLineBreakMode:",CPLineBreakByClipping);
objj_msgSend(_e,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_e,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",CPFontCurrentSystemSize));
objj_msgSend(_e,"setImagePosition:",CPNoImage);
objj_msgSend(_e,"setImageScaling:",CPImageScaleNone);
}
_textSize=nil;
}
return _e;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(_12,"initWithFrame:control:",_14,nil);
}
}),new objj_method(sel_getUid("setAlignment:"),function(_15,_16,_17){
with(_15){
if(_alignment===_17){
return;
}
_alignment=_17;
}
}),new objj_method(sel_getUid("alignment"),function(_18,_19){
with(_18){
return _alignment;
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_1a,_1b,_1c){
with(_1a){
if(_verticalAlignment===_1c){
return;
}
_verticalAlignment=_1c;
_flags|=_5;
objj_msgSend(_1a,"setNeedsLayout");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_1d,_1e){
with(_1d){
return _verticalAlignment;
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_1f,_20,_21){
with(_1f){
if(_lineBreakMode===_21){
return;
}
_lineBreakMode=_21;
_flags|=_6;
objj_msgSend(_1f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_22,_23){
with(_22){
return _lineBreakMode;
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_24,_25,_26){
with(_24){
if(_imagePosition==_26){
return;
}
if(_imagePosition==CPNoImage){
_flags|=_2;
}
_imagePosition=_26;
_flags|=_a;
objj_msgSend(_24,"setNeedsLayout");
}
}),new objj_method(sel_getUid("imagePosition"),function(_27,_28){
with(_27){
return _imagePosition;
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_29,_2a,_2b){
with(_29){
if(_imageScaling==_2b){
return;
}
_imageScaling=_2b;
_flags|=_b;
objj_msgSend(_29,"setNeedsLayout");
}
}),new objj_method(sel_getUid("imageScaling"),function(_2c,_2d){
with(_2c){
return _imageScaling;
}
}),new objj_method(sel_getUid("setDimsImage:"),function(_2e,_2f,_30){
with(_2e){
_30=!!_30;
if(_shouldDimImage!==_30){
_shouldDimImage=_30;
objj_msgSend(_2e,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("setTextColor:"),function(_31,_32,_33){
with(_31){
if(_textColor===_33){
return;
}
_textColor=_33;
}
}),new objj_method(sel_getUid("textColor"),function(_34,_35){
with(_34){
return _textColor;
}
}),new objj_method(sel_getUid("setFont:"),function(_36,_37,_38){
with(_36){
if(objj_msgSend(_font,"isEqual:",_38)){
return;
}
_font=_38;
_flags|=_8;
_textSize=nil;
objj_msgSend(_36,"setNeedsLayout");
}
}),new objj_method(sel_getUid("font"),function(_39,_3a){
with(_39){
return _font;
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_3b,_3c,_3d){
with(_3b){
if(_textShadowColor===_3d){
return;
}
_textShadowColor=_3d;
_flags|=_9;
objj_msgSend(_3b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_3e,_3f){
with(_3e){
return _textShadowColor;
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_40,_41,_42){
with(_40){
if((_textShadowOffset.width==_42.width&&_textShadowOffset.height==_42.height)){
return;
}
_textShadowOffset={width:_42.width,height:_42.height};
objj_msgSend(_40,"setNeedsLayout");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_43,_44){
with(_43){
return _textShadowOffset;
}
}),new objj_method(sel_getUid("textFrame"),function(_45,_46){
with(_45){
objj_msgSend(_45,"layoutIfNeeded");
var _47=CGRectMakeZero();
if(_DOMTextElement){
var _48=_DOMTextElement.style;
_47.origin.y=parseInt(_48.top.substr(0,_48.top.length-2),10),_47.origin.x=parseInt(_48.left.substr(0,_48.left.length-2),10),_47.size.width=parseInt(_48.width.substr(0,_48.width.length-2),10),_47.size.height=parseInt(_48.height.substr(0,_48.height.length-2),10);
_47.size.width+=_textShadowOffset.width;
_47.size.height+=_textShadowOffset.height;
}
return _47;
}
}),new objj_method(sel_getUid("setImage:"),function(_49,_4a,_4b){
with(_49){
if(_image==_4b){
return;
}
if(objj_msgSend(_image,"delegate")===_49){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_49,CPImageDidLoadNotification,_image);
}
_image=_4b;
_flags|=_2;
if(objj_msgSend(_image,"loadStatus")!==CPImageLoadStatusCompleted){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_49,sel_getUid("imageDidLoad:"),CPImageDidLoadNotification,_image);
}
objj_msgSend(_49,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setImageOffset:"),function(_4c,_4d,_4e){
with(_4c){
if(_imageOffset===_4e){
return;
}
_imageOffset=_4e;
objj_msgSend(_4c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("imageOffset"),function(_4f,_50){
with(_4f){
return _imageOffset;
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_51,_52,_53){
with(_51){
_flags|=_2;
objj_msgSend(_51,"setNeedsLayout");
}
}),new objj_method(sel_getUid("image"),function(_54,_55){
with(_54){
return _image;
}
}),new objj_method(sel_getUid("setText:"),function(_56,_57,_58){
with(_56){
if(_text===_58){
return;
}
_text=_58;
_flags|=_3;
_textSize=nil;
objj_msgSend(_56,"setNeedsLayout");
}
}),new objj_method(sel_getUid("text"),function(_59,_5a){
with(_59){
return _text;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_5b,_5c){
with(_5b){
_flags=0;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_5d,_5e){
with(_5d){
var _5f=CGSizeMakeZero();
if((_imagePosition!==CPNoImage)&&_image){
var _60=objj_msgSend(_image,"size");
_5f.width+=_60.width;
_5f.height+=_60.height;
}
if((_imagePosition!==CPImageOnly)&&objj_msgSend(_text,"length")>0){
if(!_textSize){
_textSize=objj_msgSend(_text,"sizeWithFont:",_font||objj_msgSend(CPFont,"systemFontOfSize:",0));
_textSize.width+=1;
_textSize.height+=1;
}
if(!_image||_imagePosition===CPImageOverlaps){
_5f.width=MAX(_5f.width,_textSize.width);
_5f.height=MAX(_5f.height,_textSize.height);
}else{
if(_imagePosition===CPImageLeft||_imagePosition===CPImageRight){
_5f.width+=_textSize.width+_imageOffset;
_5f.height=MAX(_5f.height,_textSize.height);
}else{
if(_imagePosition===CPImageAbove||_imagePosition===CPImageBelow){
_5f.width=MAX(_5f.width,_textSize.width);
_5f.height+=_textSize.height+_imageOffset;
}
}
}
}
objj_msgSend(_5d,"setFrameSize:",_5f);
}
})]);
