@STATIC;1.0;i;8;CPView.jt;12484;
objj_executeFile("CPView.j",YES);
CPBoxPrimary=0;
CPBoxSecondary=1;
CPBoxSeparator=2;
CPBoxOldStyle=3;
CPBoxCustom=4;
CPNoBorder=0;
CPLineBorder=1;
CPBezelBorder=2;
CPGrooveBorder=3;
CPNoTitle=0;
CPAboveTop=1;
CPAtTop=2;
CPBelowTop=3;
CPAboveBottom=4;
CPAtBottom=5;
CPBelowBottom=6;
var _1=objj_allocateClassPair(CPView,"CPBox"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_boxType"),new objj_ivar("_borderType"),new objj_ivar("_borderColor"),new objj_ivar("_fillColor"),new objj_ivar("_cornerRadius"),new objj_ivar("_borderWidth"),new objj_ivar("_contentMargin"),new objj_ivar("_contentView"),new objj_ivar("_title"),new objj_ivar("_titlePosition"),new objj_ivar("_titleView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_3,_4){
with(_3){
return _title;
}
}),new objj_method(sel_getUid("_setTitle:"),function(_5,_6,_7){
with(_5){
_title=_7;
}
}),new objj_method(sel_getUid("titlePosition"),function(_8,_9){
with(_8){
return _titlePosition;
}
}),new objj_method(sel_getUid("_setTitlePosition:"),function(_a,_b,_c){
with(_a){
_titlePosition=_c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPBox").super_class},"initWithFrame:",_f);
if(_d){
_borderType=CPBezelBorder;
_fillColor=objj_msgSend(CPColor,"clearColor");
_borderColor=objj_msgSend(CPColor,"blackColor");
_borderWidth=1;
_contentMargin=CGSizeMake(0,0);
_titlePosition=CPNoTitle;
_titleView=objj_msgSend(CPTextField,"labelWithTitle:","");
_contentView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_d,"bounds"));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_d,"setAutoresizesSubviews:",YES);
objj_msgSend(_d,"addSubview:",_contentView);
}
return _d;
}
}),new objj_method(sel_getUid("borderRect"),function(_10,_11){
with(_10){
return objj_msgSend(_10,"bounds");
}
}),new objj_method(sel_getUid("borderType"),function(_12,_13){
with(_12){
return _borderType;
}
}),new objj_method(sel_getUid("setBorderType:"),function(_14,_15,_16){
with(_14){
if(_borderType===_16){
return;
}
_borderType=_16;
objj_msgSend(_14,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("boxType"),function(_17,_18){
with(_17){
return _boxType;
}
}),new objj_method(sel_getUid("setBoxType:"),function(_19,_1a,_1b){
with(_19){
if(_boxType===_1b){
return;
}
_boxType=_1b;
objj_msgSend(_19,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("borderColor"),function(_1c,_1d){
with(_1c){
return _borderColor;
}
}),new objj_method(sel_getUid("setBorderColor:"),function(_1e,_1f,_20){
with(_1e){
if(objj_msgSend(_20,"isEqual:",_borderColor)){
return;
}
_borderColor=_20;
objj_msgSend(_1e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("borderWidth"),function(_21,_22){
with(_21){
return _borderWidth;
}
}),new objj_method(sel_getUid("setBorderWidth:"),function(_23,_24,_25){
with(_23){
if(_25===_borderWidth){
return;
}
_borderWidth=_25;
objj_msgSend(_23,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("cornerRadius"),function(_26,_27){
with(_26){
return _cornerRadius;
}
}),new objj_method(sel_getUid("setCornerRadius:"),function(_28,_29,_2a){
with(_28){
if(_2a===_cornerRadius){
return;
}
_cornerRadius=_2a;
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("fillColor"),function(_2b,_2c){
with(_2b){
return _fillColor;
}
}),new objj_method(sel_getUid("setFillColor:"),function(_2d,_2e,_2f){
with(_2d){
if(objj_msgSend(_2f,"isEqual:",_fillColor)){
return;
}
_fillColor=_2f;
objj_msgSend(_2d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("contentView"),function(_30,_31){
with(_30){
return _contentView;
}
}),new objj_method(sel_getUid("setContentView:"),function(_32,_33,_34){
with(_32){
if(_34===_contentView){
return;
}
objj_msgSend(_34,"setFrame:",CGRectInset(objj_msgSend(_32,"bounds"),_contentMargin.width+_borderWidth,_contentMargin.height+_borderWidth));
objj_msgSend(_34,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_32,"replaceSubview:with:",_contentView,_34);
_contentView=_34;
}
}),new objj_method(sel_getUid("contentViewMargins"),function(_35,_36){
with(_35){
return _contentMargin;
}
}),new objj_method(sel_getUid("setContentViewMargins:"),function(_37,_38,_39){
with(_37){
if(_39.width<0||_39.height<0){
objj_msgSend(CPException,"raise:reason:",CPGenericException,"Margins must be positive");
}
_contentMargin=CGSizeMakeCopy(_39);
objj_msgSend(_37,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setFrameFromContentFrame:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=objj_msgSend(_3a,"_titleHeightOffset");
objj_msgSend(_3a,"setFrame:",CGRectInset(_3c,-(_contentMargin.width+_borderWidth),-(_contentMargin.height+_3d[0]+_borderWidth)));
objj_msgSend(_3a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setTitle:"),function(_3e,_3f,_40){
with(_3e){
if(_40==_title){
return;
}
_title=_40;
objj_msgSend(_3e,"_manageTitlePositioning");
}
}),new objj_method(sel_getUid("setTitlePosition:"),function(_41,_42,_43){
with(_41){
if(_43==_titlePosition){
return;
}
_titlePosition=_43;
objj_msgSend(_41,"_manageTitlePositioning");
}
}),new objj_method(sel_getUid("_manageTitlePositioning"),function(_44,_45){
with(_44){
if(_titlePosition==CPNoTitle){
objj_msgSend(_titleView,"removeFromSuperview");
objj_msgSend(_44,"setNeedsDisplay:",YES);
return;
}
objj_msgSend(_titleView,"setStringValue:",_title);
objj_msgSend(_titleView,"sizeToFit");
objj_msgSend(_44,"addSubview:",_titleView);
switch(_titlePosition){
case CPAtTop:
case CPAboveTop:
case CPBelowTop:
objj_msgSend(_titleView,"setFrameOrigin:",CPPointMake(5,0));
objj_msgSend(_titleView,"setAutoresizingMask:",CPViewNotSizable);
break;
case CPAboveBottom:
case CPAtBottom:
case CPBelowBottom:
var h=objj_msgSend(_titleView,"frameSize").height;
objj_msgSend(_titleView,"setFrameOrigin:",CPPointMake(5,objj_msgSend(_44,"frameSize").height-h));
objj_msgSend(_titleView,"setAutoresizingMask:",CPViewMinYMargin);
break;
}
objj_msgSend(_44,"sizeToFit");
objj_msgSend(_44,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("sizeToFit"),function(_46,_47){
with(_46){
var _48=objj_msgSend(_contentView,"frame"),_49=objj_msgSend(_46,"_titleHeightOffset");
if(!_48){
return;
}
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewNotSizable);
objj_msgSend(_46,"setFrameSize:",CGSizeMake(_48.size.width+_contentMargin.width*2,_48.size.height+_contentMargin.height*2+_49[0]));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_contentView,"setFrameOrigin:",CGPointMake(_contentMargin.width,_contentMargin.height+_49[1]));
}
}),new objj_method(sel_getUid("_titleHeightOffset"),function(_4a,_4b){
with(_4a){
if(_titlePosition==CPNoTitle){
return [0,0];
}
switch(_titlePosition){
case CPAtTop:
return [objj_msgSend(_titleView,"frameSize").height,objj_msgSend(_titleView,"frameSize").height];
case CPAtBottom:
return [objj_msgSend(_titleView,"frameSize").height,0];
default:
return [0,0];
}
}
}),new objj_method(sel_getUid("drawRect:"),function(_4c,_4d,_4e){
with(_4c){
if(_borderType===CPNoBorder){
return;
}
var _4f=CGRectMakeCopy(objj_msgSend(_4c,"bounds"));
switch(_boxType){
case CPBoxSeparator:
if(CGRectGetWidth(_4f)===5){
return objj_msgSend(_4c,"_drawVerticalSeperatorInRect:",_4f);
}else{
if(CGRectGetHeight(_4f)===5){
return objj_msgSend(_4c,"_drawHorizontalSeperatorInRect:",_4f);
}
}
break;
}
if(_titlePosition==CPAtTop){
_4f.origin.y+=objj_msgSend(_titleView,"frameSize").height;
_4f.size.height-=objj_msgSend(_titleView,"frameSize").height;
}
if(_titlePosition==CPAtBottom){
_4f.size.height-=objj_msgSend(_titleView,"frameSize").height;
}
switch(_borderType){
case CPBezelBorder:
objj_msgSend(_4c,"_drawBezelBorderInRect:",_4f);
break;
default:
case CPLineBorder:
objj_msgSend(_4c,"_drawLineBorderInRect:",_4f);
break;
}
}
}),new objj_method(sel_getUid("_drawHorizontalSeperatorInRect:"),function(_50,_51,_52){
with(_50){
var _53=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_53,objj_msgSend(_50,"borderColor"));
CGContextSetLineWidth(_53,1);
CGContextMoveToPoint(_53,CGRectGetMinX(_52),CGRectGetMinY(_52)+0.5);
CGContextAddLineToPoint(_53,CGRectGetWidth(_52),CGRectGetMinY(_52)+0.5);
CGContextStrokePath(_53);
}
}),new objj_method(sel_getUid("_drawVerticalSeperatorInRect:"),function(_54,_55,_56){
with(_54){
var _57=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_57,objj_msgSend(_54,"borderColor"));
CGContextSetLineWidth(_57,1);
CGContextMoveToPoint(_57,CGRectGetMinX(_56)+0.5,CGRectGetMinY(_56));
CGContextAddLineToPoint(_57,CGRectGetMinX(_56)+0.5,CGRectGetHeight(_56));
CGContextStrokePath(_57);
}
}),new objj_method(sel_getUid("_drawBezelBorderInRect:"),function(_58,_59,_5a){
with(_58){
var _5b=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_5c=[CPMinYEdge,CPMaxXEdge,CPMaxYEdge,CPMinXEdge],_5d=190/255,_5e=[142/255,_5d,_5d,_5d],_5f=_borderWidth;
while(_5f--){
_5a=CPDrawTiledRects(_5a,_5a,_5c,_5e);
}
CGContextSetFillColor(_5b,objj_msgSend(_58,"fillColor"));
CGContextFillRect(_5b,_5a);
}
}),new objj_method(sel_getUid("_drawLineBorderInRect:"),function(_60,_61,_62){
with(_60){
var _63=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
_62=CGRectInset(_62,_borderWidth/2,_borderWidth/2);
CGContextSetFillColor(_63,objj_msgSend(_60,"fillColor"));
CGContextSetStrokeColor(_63,objj_msgSend(_60,"borderColor"));
CGContextSetLineWidth(_63,_borderWidth);
CGContextFillRoundedRectangleInRect(_63,_62,_cornerRadius,YES,YES,YES,YES);
CGContextStrokeRoundedRectangleInRect(_63,_62,_cornerRadius,YES,YES,YES,YES);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("boxEnclosingView:"),function(_64,_65,_66){
with(_64){
var box=objj_msgSend(objj_msgSend(_64,"alloc"),"initWithFrame:",CGRectMakeZero()),_67=objj_msgSend(_66,"superview");
objj_msgSend(box,"setAutoresizingMask:",objj_msgSend(_66,"autoresizingMask"));
objj_msgSend(box,"setFrameFromContentFrame:",objj_msgSend(_66,"frame"));
objj_msgSend(_67,"replaceSubview:with:",_66,box);
objj_msgSend(box,"setContentView:",_66);
return box;
}
})]);
var _68="CPBoxTypeKey",_69="CPBoxBorderTypeKey",_6a="CPBoxBorderColorKey",_6b="CPBoxFillColorKey",_6c="CPBoxCornerRadiusKey",_6d="CPBoxBorderWidthKey",_6e="CPBoxContentMarginKey",_6f="CPBoxTitle",_70="CPBoxTitlePosition",_71="CPBoxTitleView";
var _1=objj_getClass("CPBox");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPBox\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_72,_73,_74){
with(_72){
_72=objj_msgSendSuper({receiver:_72,super_class:objj_getClass("CPBox").super_class},"initWithCoder:",_74);
if(_72){
_boxType=objj_msgSend(_74,"decodeIntForKey:",_68);
_borderType=objj_msgSend(_74,"decodeIntForKey:",_69);
_borderColor=objj_msgSend(_74,"decodeObjectForKey:",_6a);
_fillColor=objj_msgSend(_74,"decodeObjectForKey:",_6b);
_cornerRadius=objj_msgSend(_74,"decodeFloatForKey:",_6c);
_borderWidth=objj_msgSend(_74,"decodeFloatForKey:",_6d);
_contentMargin=objj_msgSend(_74,"decodeSizeForKey:",_6e);
_title=objj_msgSend(_74,"decodeObjectForKey:",_6f);
_titlePosition=objj_msgSend(_74,"decodeIntForKey:",_70);
_titleView=objj_msgSend(_74,"decodeObjectForKey:",_71)||objj_msgSend(CPTextField,"labelWithTitle:",_title);
_contentView=objj_msgSend(_72,"subviews")[0];
objj_msgSend(_72,"setAutoresizesSubviews:",YES);
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_72,"_manageTitlePositioning");
}
return _72;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_75,_76,_77){
with(_75){
objj_msgSendSuper({receiver:_75,super_class:objj_getClass("CPBox").super_class},"encodeWithCoder:",_77);
objj_msgSend(_77,"encodeInt:forKey:",_boxType,_68);
objj_msgSend(_77,"encodeInt:forKey:",_borderType,_69);
objj_msgSend(_77,"encodeObject:forKey:",_borderColor,_6a);
objj_msgSend(_77,"encodeObject:forKey:",_fillColor,_6b);
objj_msgSend(_77,"encodeFloat:forKey:",_cornerRadius,_6c);
objj_msgSend(_77,"encodeFloat:forKey:",_borderWidth,_6d);
objj_msgSend(_77,"encodeObject:forKey:",_title,_6f);
objj_msgSend(_77,"encodeInt:forKey:",_titlePosition,_70);
objj_msgSend(_77,"encodeObject:forKey:",_titleView,_71);
objj_msgSend(_77,"encodeSize:forKey:",_contentMargin,_6e);
}
})]);
