@STATIC;1.0;I;33;Foundation/CPNotificationCenter.ji;7;CPBox.ji;12;CPClipView.ji;12;CPScroller.ji;8;CPView.jt;36097;
objj_executeFile("Foundation/CPNotificationCenter.j",NO);
objj_executeFile("CPBox.j",YES);
objj_executeFile("CPClipView.j",YES);
objj_executeFile("CPScroller.j",YES);
objj_executeFile("CPView.j",YES);
var _1=function(){
var _2=document.createElement("p"),_3=document.createElement("div");
_2.style.width="100%";
_2.style.height="200px";
_3.style.position="absolute";
_3.style.top="0px";
_3.style.left="0px";
_3.style.visibility="hidden";
_3.style.width="200px";
_3.style.height="150px";
_3.style.overflow="hidden";
_3.appendChild(_2);
document.body.appendChild(_3);
var w1=_2.offsetWidth;
_3.style.overflow="scroll";
var w2=_2.offsetWidth;
if(w1==w2){
w2=_3.clientWidth;
}
document.body.removeChild(_3);
return (w1-w2==0);
};
var _4=0.2,_5=1<<0,_6=1<<1,_7=1.3;
var _8=CPScrollerStyleOverlay,_9="CPScrollerStyleGlobalChangeNotification";
var _a=objj_allocateClassPair(CPView,"CPScrollView"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_contentView"),new objj_ivar("_headerClipView"),new objj_ivar("_cornerView"),new objj_ivar("_bottomCornerView"),new objj_ivar("_delegate"),new objj_ivar("_scrollTimer"),new objj_ivar("_hasVerticalScroller"),new objj_ivar("_hasHorizontalScroller"),new objj_ivar("_autohidesScrollers"),new objj_ivar("_verticalScroller"),new objj_ivar("_horizontalScroller"),new objj_ivar("_recursionCount"),new objj_ivar("_implementedDelegateMethods"),new objj_ivar("_verticalLineScroll"),new objj_ivar("_verticalPageScroll"),new objj_ivar("_horizontalLineScroll"),new objj_ivar("_horizontalPageScroll"),new objj_ivar("_borderType"),new objj_ivar("_timerScrollersHide"),new objj_ivar("_scrollerStyle"),new objj_ivar("_scrollerKnobStyle")]);
objj_registerClassPair(_a);
class_addMethods(_a,[new objj_method(sel_getUid("initWithFrame:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPScrollView").super_class},"initWithFrame:",_e);
if(_c){
_verticalLineScroll=10;
_verticalPageScroll=10;
_horizontalLineScroll=10;
_horizontalPageScroll=10;
_borderType=CPNoBorder;
_contentView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",objj_msgSend(_c,"_insetBounds"));
objj_msgSend(_c,"addSubview:",_contentView);
_headerClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"init");
objj_msgSend(_c,"addSubview:",_headerClipView);
_bottomCornerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"init");
objj_msgSend(_c,"addSubview:",_bottomCornerView);
objj_msgSend(_c,"setHasVerticalScroller:",YES);
objj_msgSend(_c,"setHasHorizontalScroller:",YES);
_scrollerKnobStyle=CPScrollerKnobStyleDefault;
objj_msgSend(_c,"setScrollerStyle:",_8);
_delegate=nil;
_scrollTimer=nil;
_implementedDelegateMethods=0;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_c,sel_getUid("_didReceiveDefaultStyleChange:"),_9,nil);
}
return _c;
}
}),new objj_method(sel_getUid("delegate"),function(_f,_10){
with(_f){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_11,_12,_13){
with(_11){
if(_13===_delegate){
return;
}
_delegate=_13;
_implementedDelegateMethods=0;
if(_delegate===nil){
return;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("scrollViewWillScroll:"))){
_implementedDelegateMethods|=_5;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("scrollViewDidScroll:"))){
_implementedDelegateMethods|=_6;
}
}
}),new objj_method(sel_getUid("scrollerStyle"),function(_14,_15){
with(_14){
return _scrollerStyle;
}
}),new objj_method(sel_getUid("setScrollerStyle:"),function(_16,_17,_18){
with(_16){
if(_scrollerStyle===_18){
return;
}
_scrollerStyle=_18;
objj_msgSend(_16,"_updateScrollerStyle");
}
}),new objj_method(sel_getUid("scrollerKnobStyle"),function(_19,_1a){
with(_19){
return _scrollerKnobStyle;
}
}),new objj_method(sel_getUid("setScrollerKnobStyle:"),function(_1b,_1c,_1d){
with(_1b){
if(_scrollerKnobStyle===_1d){
return;
}
_scrollerKnobStyle=_1d;
objj_msgSend(_1b,"_updateScrollerStyle");
}
}),new objj_method(sel_getUid("contentView"),function(_1e,_1f){
with(_1e){
return _contentView;
}
}),new objj_method(sel_getUid("setContentView:"),function(_20,_21,_22){
with(_20){
if(_contentView===_22||!_22){
return;
}
var _23=objj_msgSend(_22,"documentView");
if(_23){
objj_msgSend(_23,"removeFromSuperview");
}
objj_msgSend(_contentView,"removeFromSuperview");
_contentView=_22;
objj_msgSend(_contentView,"setDocumentView:",_23);
objj_msgSend(_20,"addSubview:",_contentView);
objj_msgSend(_20,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("contentSize"),function(_24,_25){
with(_24){
return objj_msgSend(_contentView,"frame").size;
}
}),new objj_method(sel_getUid("documentView"),function(_26,_27){
with(_26){
return objj_msgSend(_contentView,"documentView");
}
}),new objj_method(sel_getUid("setDocumentView:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_contentView,"setDocumentView:",_2a);
objj_msgSend(_28,"_updateCornerAndHeaderView");
objj_msgSend(_28,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("borderType"),function(_2b,_2c){
with(_2b){
return _borderType;
}
}),new objj_method(sel_getUid("setBorderType:"),function(_2d,_2e,_2f){
with(_2d){
if(_borderType==_2f){
return;
}
_borderType=_2f;
objj_msgSend(_2d,"reflectScrolledClipView:",_contentView);
objj_msgSend(_2d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("horizontalScroller"),function(_30,_31){
with(_30){
return _horizontalScroller;
}
}),new objj_method(sel_getUid("setHorizontalScroller:"),function(_32,_33,_34){
with(_32){
if(_horizontalScroller===_34){
return;
}
objj_msgSend(_horizontalScroller,"removeFromSuperview");
objj_msgSend(_horizontalScroller,"setTarget:",nil);
objj_msgSend(_horizontalScroller,"setAction:",nil);
_horizontalScroller=_34;
objj_msgSend(_horizontalScroller,"setTarget:",_32);
objj_msgSend(_horizontalScroller,"setAction:",sel_getUid("_horizontalScrollerDidScroll:"));
objj_msgSend(_32,"addSubview:",_horizontalScroller);
objj_msgSend(_32,"_updateScrollerStyle");
}
}),new objj_method(sel_getUid("hasHorizontalScroller"),function(_35,_36){
with(_35){
return _hasHorizontalScroller;
}
}),new objj_method(sel_getUid("setHasHorizontalScroller:"),function(_37,_38,_39){
with(_37){
if(_hasHorizontalScroller===_39){
return;
}
_hasHorizontalScroller=_39;
if(_hasHorizontalScroller&&!_horizontalScroller){
var _3a=objj_msgSend(_37,"_insetBounds");
objj_msgSend(_37,"setHorizontalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,MAX((_3a.size.width),objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle)+1),objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle))));
objj_msgSend(objj_msgSend(_37,"horizontalScroller"),"setFrameSize:",CGSizeMake((_3a.size.width),objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle)));
}
objj_msgSend(_37,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("verticalScroller"),function(_3b,_3c){
with(_3b){
return _verticalScroller;
}
}),new objj_method(sel_getUid("setVerticalScroller:"),function(_3d,_3e,_3f){
with(_3d){
if(_verticalScroller===_3f){
return;
}
objj_msgSend(_verticalScroller,"removeFromSuperview");
objj_msgSend(_verticalScroller,"setTarget:",nil);
objj_msgSend(_verticalScroller,"setAction:",nil);
_verticalScroller=_3f;
objj_msgSend(_verticalScroller,"setTarget:",_3d);
objj_msgSend(_verticalScroller,"setAction:",sel_getUid("_verticalScrollerDidScroll:"));
objj_msgSend(_3d,"addSubview:",_verticalScroller);
objj_msgSend(_3d,"_updateScrollerStyle");
}
}),new objj_method(sel_getUid("hasVerticalScroller"),function(_40,_41){
with(_40){
return _hasVerticalScroller;
}
}),new objj_method(sel_getUid("setHasVerticalScroller:"),function(_42,_43,_44){
with(_42){
if(_hasVerticalScroller===_44){
return;
}
_hasVerticalScroller=_44;
if(_hasVerticalScroller&&!_verticalScroller){
var _45=objj_msgSend(_42,"_insetBounds");
objj_msgSend(_42,"setVerticalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle),height:MAX((_45.size.height),objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle)+1)}}));
objj_msgSend(objj_msgSend(_42,"verticalScroller"),"setFrameSize:",CGSizeMake(objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle),(_45.size.height)));
}
objj_msgSend(_42,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("autohidesScrollers"),function(_46,_47){
with(_46){
return _autohidesScrollers;
}
}),new objj_method(sel_getUid("setAutohidesScrollers:"),function(_48,_49,_4a){
with(_48){
if(_autohidesScrollers==_4a){
return;
}
_autohidesScrollers=_4a;
objj_msgSend(_48,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("bottomCornerView"),function(_4b,_4c){
with(_4b){
return _bottomCornerView;
}
}),new objj_method(sel_getUid("setBottomCornerView:"),function(_4d,_4e,_4f){
with(_4d){
if(_bottomCornerView===_4f){
return;
}
objj_msgSend(_bottomCornerView,"removeFromSuperview");
objj_msgSend(_4f,"setFrame:",objj_msgSend(_4d,"_bottomCornerViewFrame"));
objj_msgSend(_4d,"addSubview:",_4f);
_bottomCornerView=_4f;
objj_msgSend(_4d,"_updateCornerAndHeaderView");
}
}),new objj_method(sel_getUid("lineScroll"),function(_50,_51){
with(_50){
return objj_msgSend(_50,"horizontalLineScroll");
}
}),new objj_method(sel_getUid("setLineScroll:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_52,"setHorizontalLineScroll:",_54);
objj_msgSend(_52,"setVerticalLineScroll:",_54);
}
}),new objj_method(sel_getUid("horizontalLineScroll"),function(_55,_56){
with(_55){
return _horizontalLineScroll;
}
}),new objj_method(sel_getUid("setHorizontalLineScroll:"),function(_57,_58,_59){
with(_57){
_horizontalLineScroll=_59;
}
}),new objj_method(sel_getUid("verticalLineScroll"),function(_5a,_5b){
with(_5a){
return _verticalLineScroll;
}
}),new objj_method(sel_getUid("setVerticalLineScroll:"),function(_5c,_5d,_5e){
with(_5c){
_verticalLineScroll=_5e;
}
}),new objj_method(sel_getUid("pageScroll"),function(_5f,_60){
with(_5f){
return objj_msgSend(_5f,"horizontalPageScroll");
}
}),new objj_method(sel_getUid("setPageScroll:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"setHorizontalPageScroll:",_63);
objj_msgSend(_61,"setVerticalPageScroll:",_63);
}
}),new objj_method(sel_getUid("horizontalPageScroll"),function(_64,_65){
with(_64){
return _horizontalPageScroll;
}
}),new objj_method(sel_getUid("setHorizontalPageScroll:"),function(_66,_67,_68){
with(_66){
_horizontalPageScroll=_68;
}
}),new objj_method(sel_getUid("verticalPageScroll"),function(_69,_6a){
with(_69){
return _verticalPageScroll;
}
}),new objj_method(sel_getUid("setVerticalPageScroll:"),function(_6b,_6c,_6d){
with(_6b){
_verticalPageScroll=_6d;
}
}),new objj_method(sel_getUid("_updateScrollerStyle"),function(_6e,_6f){
with(_6e){
if(_hasHorizontalScroller){
objj_msgSend(_horizontalScroller,"setStyle:",_scrollerStyle);
objj_msgSend(_horizontalScroller,"unsetThemeState:",CPThemeStateSelected);
switch(_scrollerKnobStyle){
case CPScrollerKnobStyleLight:
objj_msgSend(_horizontalScroller,"unsetThemeState:",CPThemeStateScrollerKnobDark);
objj_msgSend(_horizontalScroller,"setThemeState:",CPThemeStateScrollerKnobLight);
break;
case CPScrollerKnobStyleDark:
objj_msgSend(_horizontalScroller,"unsetThemeState:",CPThemeStateScrollerKnobLight);
objj_msgSend(_horizontalScroller,"setThemeState:",CPThemeStateScrollerKnobDark);
break;
default:
objj_msgSend(_horizontalScroller,"unsetThemeState:",CPThemeStateScrollerKnobLight);
objj_msgSend(_horizontalScroller,"unsetThemeState:",CPThemeStateScrollerKnobDark);
}
}
if(_hasVerticalScroller){
objj_msgSend(_verticalScroller,"setStyle:",_scrollerStyle);
objj_msgSend(_verticalScroller,"unsetThemeState:",CPThemeStateSelected);
switch(_scrollerKnobStyle){
case CPScrollerKnobStyleLight:
objj_msgSend(_verticalScroller,"unsetThemeState:",CPThemeStateScrollerKnobDark);
objj_msgSend(_verticalScroller,"setThemeState:",CPThemeStateScrollerKnobLight);
break;
case CPScrollerKnobStyleDark:
objj_msgSend(_verticalScroller,"unsetThemeState:",CPThemeStateScrollerKnobLight);
objj_msgSend(_verticalScroller,"setThemeState:",CPThemeStateScrollerKnobDark);
break;
default:
objj_msgSend(_verticalScroller,"unsetThemeState:",CPThemeStateScrollerKnobLight);
objj_msgSend(_verticalScroller,"unsetThemeState:",CPThemeStateScrollerKnobDark);
}
}
if(_scrollerStyle==CPScrollerStyleOverlay){
if(_timerScrollersHide){
objj_msgSend(_timerScrollersHide,"invalidate");
}
_timerScrollersHide=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_7,_6e,sel_getUid("_hideScrollers:"),nil,NO);
objj_msgSend(objj_msgSend(_6e,"bottomCornerView"),"setHidden:",YES);
}else{
objj_msgSend(objj_msgSend(_6e,"bottomCornerView"),"setHidden:",NO);
}
objj_msgSend(_6e,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("_insetBounds"),function(_70,_71){
with(_70){
return objj_msgSend(objj_msgSend(_70,"class"),"_insetBounds:borderType:",objj_msgSend(_70,"bounds"),_borderType);
}
}),new objj_method(sel_getUid("_updateCornerAndHeaderView"),function(_72,_73){
with(_72){
var _74=objj_msgSend(_72,"documentView"),_75=objj_msgSend(_72,"_headerView"),_76=objj_msgSend(_74,"respondsToSelector:",sel_getUid("headerView"))?objj_msgSend(_74,"headerView"):nil;
if(_75!==_76){
objj_msgSend(_75,"removeFromSuperview");
objj_msgSend(_headerClipView,"setDocumentView:",_76);
}
var _77=objj_msgSend(_74,"respondsToSelector:",sel_getUid("cornerView"))?objj_msgSend(_74,"cornerView"):nil;
if(_cornerView!==_77){
objj_msgSend(_cornerView,"removeFromSuperview");
_cornerView=_77;
if(_cornerView){
objj_msgSend(_cornerView,"setHidden:",!(_scrollerStyle===CPScrollerStyleLegacy&&_verticalScroller&&!objj_msgSend(_verticalScroller,"isHidden")));
objj_msgSend(_72,"addSubview:",_cornerView);
}
}
objj_msgSend(_72,"reflectScrolledClipView:",_contentView);
objj_msgSend(_76,"setNeedsLayout");
objj_msgSend(_76,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_headerView"),function(_78,_79){
with(_78){
return objj_msgSend(_headerClipView,"documentView");
}
}),new objj_method(sel_getUid("_cornerViewFrame"),function(_7a,_7b){
with(_7a){
if(!_cornerView){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _7c=objj_msgSend(_7a,"_insetBounds"),_7d=objj_msgSend(_cornerView,"frame");
_7d.origin.x=(_7c.origin.x+_7c.size.width)-(_7d.size.width);
_7d.origin.y=(_7c.origin.y);
return _7d;
}
}),new objj_method(sel_getUid("_headerClipViewFrame"),function(_7e,_7f){
with(_7e){
var _80=objj_msgSend(_7e,"_headerView");
if(!_80){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _81=objj_msgSend(_7e,"_insetBounds");
_81.size.height=(objj_msgSend(_80,"frame").size.height);
if((_scrollerStyle===CPScrollerStyleLegacy&&_verticalScroller&&!objj_msgSend(_verticalScroller,"isHidden"))){
_81.size.width-=(objj_msgSend(_7e,"_cornerViewFrame").size.width);
}
return _81;
}
}),new objj_method(sel_getUid("_bottomCornerViewFrame"),function(_82,_83){
with(_82){
if(objj_msgSend(objj_msgSend(_82,"horizontalScroller"),"isHidden")||objj_msgSend(objj_msgSend(_82,"verticalScroller"),"isHidden")){
return CGRectMakeZero();
}
var _84=objj_msgSend(objj_msgSend(_82,"verticalScroller"),"frame"),_85=CGRectMakeZero();
_85.origin.x=CGRectGetMinX(_84);
_85.origin.y=CGRectGetMaxY(_84);
_85.size.width=objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle);
_85.size.height=objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle);
return _85;
}
}),new objj_method(sel_getUid("_verticalScrollerDidScroll:"),function(_86,_87,_88){
with(_86){
var _89=objj_msgSend(_88,"floatValue"),_8a=objj_msgSend(objj_msgSend(_contentView,"documentView"),"frame"),_8b=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_verticalScroller,"hitPart")){
case CPScrollerDecrementLine:
_8b.origin.y-=_verticalLineScroll;
break;
case CPScrollerIncrementLine:
_8b.origin.y+=_verticalLineScroll;
break;
case CPScrollerDecrementPage:
_8b.origin.y-=(_8b.size.height)-_verticalPageScroll;
break;
case CPScrollerIncrementPage:
_8b.origin.y+=(_8b.size.height)-_verticalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_8b.origin.y=ROUND(_89*((_8a.size.height)-(_8b.size.height)));
}
objj_msgSend(_86,"_sendDelegateMessages");
objj_msgSend(_contentView,"scrollToPoint:",_8b.origin);
}
}),new objj_method(sel_getUid("_horizontalScrollerDidScroll:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_8e,"floatValue"),_90=objj_msgSend(objj_msgSend(_8c,"documentView"),"frame"),_91=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_horizontalScroller,"hitPart")){
case CPScrollerDecrementLine:
_91.origin.x-=_horizontalLineScroll;
break;
case CPScrollerIncrementLine:
_91.origin.x+=_horizontalLineScroll;
break;
case CPScrollerDecrementPage:
_91.origin.x-=(_91.size.width)-_horizontalPageScroll;
break;
case CPScrollerIncrementPage:
_91.origin.x+=(_91.size.width)-_horizontalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_91.origin.x=ROUND(_8f*((_90.size.width)-(_91.size.width)));
}
objj_msgSend(_8c,"_sendDelegateMessages");
objj_msgSend(_contentView,"scrollToPoint:",_91.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_91.origin.x,0));
}
}),new objj_method(sel_getUid("_sendDelegateMessages"),function(_92,_93){
with(_92){
if(_implementedDelegateMethods==0){
return;
}
if(!_scrollTimer){
objj_msgSend(_92,"_scrollViewWillScroll");
_scrollTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_4,_92,sel_getUid("_scrollViewDidScroll"),nil,YES);
}else{
objj_msgSend(_scrollTimer,"setFireDate:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_4));
}
}
}),new objj_method(sel_getUid("_hideScrollers:"),function(_94,_95,_96){
with(_94){
if(objj_msgSend(_verticalScroller,"allowFadingOut")){
objj_msgSend(_verticalScroller,"fadeOut");
}
if(objj_msgSend(_horizontalScroller,"allowFadingOut")){
objj_msgSend(_horizontalScroller,"fadeOut");
}
_timerScrollersHide=nil;
}
}),new objj_method(sel_getUid("_respondToScrollWheelEventWithDeltaX:deltaY:"),function(_97,_98,_99,_9a){
with(_97){
var _9b=objj_msgSend(objj_msgSend(_97,"documentView"),"frame"),_9c=objj_msgSend(_contentView,"bounds"),_9d=objj_msgSend(_contentView,"frame"),_9e=objj_msgSend(_97,"enclosingScrollView");
_9c.origin.x=ROUND(_9c.origin.x+_99);
_9c.origin.y=ROUND(_9c.origin.y+_9a);
var _9f=objj_msgSend(_contentView,"constrainScrollPoint:",CGPointCreateCopy(_9c.origin)),_a0=_9c.origin.x-_9f.x,_a1=_9c.origin.y-_9f.y;
objj_msgSend(_97,"_sendDelegateMessages");
objj_msgSend(_contentView,"scrollToPoint:",_9f);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_9f.x,0));
if(_a0||_a1){
objj_msgSend(_9e,"_respondToScrollWheelEventWithDeltaX:deltaY:",_a0,_a1);
}
}
}),new objj_method(sel_getUid("_scrollViewWillScroll"),function(_a2,_a3){
with(_a2){
if(_implementedDelegateMethods&_5){
objj_msgSend(_delegate,"scrollViewWillScroll:",_a2);
}
}
}),new objj_method(sel_getUid("_scrollViewDidScroll"),function(_a4,_a5){
with(_a4){
objj_msgSend(_scrollTimer,"invalidate");
_scrollTimer=nil;
if(_implementedDelegateMethods&_6){
objj_msgSend(_delegate,"scrollViewDidScroll:",_a4);
}
}
}),new objj_method(sel_getUid("_didReceiveDefaultStyleChange:"),function(_a6,_a7,_a8){
with(_a6){
objj_msgSend(_a6,"setScrollerStyle:",_8);
}
}),new objj_method(sel_getUid("tile"),function(_a9,_aa){
with(_a9){
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(_ab,_ac,_ad){
with(_ab){
if(_contentView!==_ad){
return;
}
if(_recursionCount>5){
return;
}
++_recursionCount;
var _ae=objj_msgSend(_ab,"documentView");
if(!_ae){
if(_autohidesScrollers){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_horizontalScroller,"setHidden:",YES);
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_ab,"_insetBounds"));
objj_msgSend(_headerClipView,"setFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
--_recursionCount;
return;
}
var _af=objj_msgSend(_ae,"frame"),_b0=objj_msgSend(_ab,"_insetBounds"),_b1=objj_msgSend(_ab,"_headerClipViewFrame"),_b2=(_b1.size.height);
_b0.origin.y+=_b2;
_b0.size.height-=_b2;
var _b3={width:(_af.size.width)-(_b0.size.width),height:(_af.size.height)-(_b0.size.height)},_b4=(objj_msgSend(_verticalScroller,"frame").size.width),_b5=(objj_msgSend(_horizontalScroller,"frame").size.height),_b6=_b3.height>0,_b7=_b3.width>0,_b8=_hasVerticalScroller&&(!_autohidesScrollers||_b6),_b9=_hasHorizontalScroller&&(!_autohidesScrollers||_b7);
if(_b8){
if(_scrollerStyle===CPScrollerStyleLegacy){
_b3.width+=_b4;
}
_b7=_b3.width>0;
_b9=_hasHorizontalScroller&&(!_autohidesScrollers||_b7);
}
if(_b9){
if(_scrollerStyle===CPScrollerStyleLegacy){
_b3.height+=_b5;
}
_b6=_b3.height>0;
_b8=_hasVerticalScroller&&(!_autohidesScrollers||_b6);
}
objj_msgSend(_verticalScroller,"setHidden:",!_b8);
objj_msgSend(_verticalScroller,"setEnabled:",_b6);
objj_msgSend(_horizontalScroller,"setHidden:",!_b9);
objj_msgSend(_horizontalScroller,"setEnabled:",_b7);
var _ba=objj_msgSend(CPScroller,"scrollerOverlay");
if(_scrollerStyle===CPScrollerStyleLegacy){
if(_b8){
_b0.size.width-=_b4;
}
if(_b9){
_b0.size.height-=_b5;
}
_ba=0;
}
var _bb=objj_msgSend(_contentView,"bounds").origin,_bc=!objj_msgSend(_verticalScroller,"isHidden"),_bd=!objj_msgSend(_horizontalScroller,"isHidden");
if(_b8){
var _be=MAX((_b0.origin.y),MAX((objj_msgSend(_ab,"_cornerViewFrame").origin.y+objj_msgSend(_ab,"_cornerViewFrame").size.height),(_b1.origin.y+_b1.size.height)));
var _bf=(_b0.origin.y+_b0.size.height)-_be;
if(_scrollerStyle===CPScrollerStyleOverlay&&_b7){
_bf-=_b5;
}
var _c0=(_af.size.height);
objj_msgSend(_verticalScroller,"setFloatValue:",(_b3.height<=0)?0:_bb.y/_b3.height);
objj_msgSend(_verticalScroller,"setKnobProportion:",_c0>0?(_b0.size.height)/_c0:1);
objj_msgSend(_verticalScroller,"setFrame:",{origin:{x:(_b0.origin.x+_b0.size.width)-_ba,y:_be},size:{width:_b4,height:_bf}});
}else{
if(_bc){
objj_msgSend(_verticalScroller,"setFloatValue:",0);
objj_msgSend(_verticalScroller,"setKnobProportion:",1);
}
}
if(_b9){
var _c1=(_b0.size.width);
if(_scrollerStyle===CPScrollerStyleOverlay&&_b6){
_c1-=_b4;
}
var _c2=(_af.size.width);
objj_msgSend(_horizontalScroller,"setFloatValue:",(_b3.width<=0)?0:_bb.x/_b3.width);
objj_msgSend(_horizontalScroller,"setKnobProportion:",_c2>0?(_b0.size.width)/_c2:1);
objj_msgSend(_horizontalScroller,"setFrame:",{origin:{x:(_b0.origin.x),y:(_b0.origin.y+_b0.size.height)-_ba},size:{width:_c1,height:_b5}});
}else{
if(_bd){
objj_msgSend(_horizontalScroller,"setFloatValue:",0);
objj_msgSend(_horizontalScroller,"setKnobProportion:",1);
}
}
objj_msgSend(_contentView,"setFrame:",_b0);
objj_msgSend(_headerClipView,"setFrame:",objj_msgSend(_ab,"_headerClipViewFrame"));
objj_msgSend(objj_msgSend(_headerClipView,"documentView"),"setNeedsDisplay:",YES);
if((_scrollerStyle===CPScrollerStyleLegacy&&_verticalScroller&&!objj_msgSend(_verticalScroller,"isHidden"))){
objj_msgSend(_cornerView,"setFrame:",objj_msgSend(_ab,"_cornerViewFrame"));
objj_msgSend(_cornerView,"setHidden:",NO);
}else{
objj_msgSend(_cornerView,"setHidden:",YES);
}
if(_scrollerStyle===CPScrollerStyleLegacy){
objj_msgSend(objj_msgSend(_ab,"bottomCornerView"),"setFrame:",objj_msgSend(_ab,"_bottomCornerViewFrame"));
objj_msgSend(objj_msgSend(_ab,"bottomCornerView"),"setBackgroundColor:",objj_msgSend(_ab,"currentValueForThemeAttribute:","bottom-corner-color"));
}
--_recursionCount;
}
}),new objj_method(sel_getUid("flashScrollers"),function(_c3,_c4){
with(_c3){
if(_scrollerStyle===CPScrollerStyleLegacy){
return;
}
if(_hasHorizontalScroller){
objj_msgSend(_horizontalScroller,"setHidden:",NO);
objj_msgSend(_horizontalScroller,"fadeIn");
}
if(_hasVerticalScroller){
objj_msgSend(_verticalScroller,"setHidden:",NO);
objj_msgSend(_verticalScroller,"fadeIn");
}
if(_timerScrollersHide){
objj_msgSend(_timerScrollersHide,"invalidate");
}
_timerScrollersHide=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_7,_c3,sel_getUid("_hideScrollers:"),nil,NO);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_c5,_c6,_c7){
with(_c5){
objj_msgSend(_c5,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("drawRect:"),function(_c8,_c9,_ca){
with(_c8){
objj_msgSendSuper({receiver:_c8,super_class:objj_getClass("CPScrollView").super_class},"drawRect:",_ca);
if(_borderType==CPNoBorder){
return;
}
var _cb=objj_msgSend(_c8,"bounds"),_cc=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetLineWidth(_cc,1);
switch(_borderType){
case CPLineBorder:
CGContextSetStrokeColor(_cc,objj_msgSend(_c8,"currentValueForThemeAttribute:","border-color"));
CGContextStrokeRect(_cc,{origin:{x:_cb.origin.x+0.5,y:_cb.origin.y+0.5},size:{width:_cb.size.width-2*0.5,height:_cb.size.height-2*0.5}});
break;
case CPBezelBorder:
objj_msgSend(_c8,"_drawGrayBezelInContext:bounds:",_cc,_cb);
break;
case CPGrooveBorder:
objj_msgSend(_c8,"_drawGrooveInContext:bounds:",_cc,_cb);
break;
default:
break;
}
}
}),new objj_method(sel_getUid("_drawGrayBezelInContext:bounds:"),function(_cd,_ce,_cf,_d0){
with(_cd){
var _d1=(_d0.origin.x),_d2=(_d0.origin.x+_d0.size.width),_d3=(_d0.origin.y),_d4=(_d0.origin.y+_d0.size.height),y=_d3+0.5;
CGContextSetStrokeColor(_cf,objj_msgSend(CPColor,"colorWithWhite:alpha:",142/255,1));
CGContextBeginPath(_cf);
CGContextMoveToPoint(_cf,_d1,y);
CGContextAddLineToPoint(_cf,_d2,y);
CGContextStrokePath(_cf);
CGContextSetStrokeColor(_cf,objj_msgSend(CPColor,"colorWithWhite:alpha:",192/255,1));
var x=_d2-0.5;
CGContextBeginPath(_cf);
CGContextMoveToPoint(_cf,x,_d3+1);
CGContextAddLineToPoint(_cf,x,_d4);
CGContextMoveToPoint(_cf,x-0.5,_d4-0.5);
CGContextAddLineToPoint(_cf,_d1,_d4-0.5);
x=_d1+0.5;
CGContextMoveToPoint(_cf,x,_d4);
CGContextAddLineToPoint(_cf,x,_d3+1);
CGContextStrokePath(_cf);
}
}),new objj_method(sel_getUid("_drawGrooveInContext:bounds:"),function(_d5,_d6,_d7,_d8){
with(_d5){
var _d9=(_d8.origin.x),_da=(_d8.origin.x+_d8.size.width),_db=(_d8.origin.y),_dc=(_d8.origin.y+_d8.size.height);
CGContextBeginPath(_d7);
CGContextSetStrokeColor(_d7,objj_msgSend(CPColor,"colorWithWhite:alpha:",159/255,1));
var y=_db+0.5;
CGContextMoveToPoint(_d7,_d9,y);
CGContextAddLineToPoint(_d7,_da,y);
var x=_da-1.5;
CGContextMoveToPoint(_d7,x,_db+2);
CGContextAddLineToPoint(_d7,x,_dc-1);
y=_dc-1.5;
CGContextMoveToPoint(_d7,_da-1,y);
CGContextAddLineToPoint(_d7,_d9+2,y);
x=_d9+0.5;
CGContextMoveToPoint(_d7,x,_dc);
CGContextAddLineToPoint(_d7,x,_db);
CGContextStrokePath(_d7);
CGContextBeginPath(_d7);
CGContextSetStrokeColor(_d7,objj_msgSend(CPColor,"whiteColor"));
var _dd={origin:{x:_d8.origin.x+1,y:_d8.origin.y+1},size:{width:_d8.size.width,height:_d8.size.height}};
_dd.size.width-=1;
_dd.size.height-=1;
CGContextStrokeRect(_d7,{origin:{x:_dd.origin.x+0.5,y:_dd.origin.y+0.5},size:{width:_dd.size.width-2*0.5,height:_dd.size.height-2*0.5}});
CGContextBeginPath(_d7);
CGContextSetStrokeColor(_d7,objj_msgSend(CPColor,"colorWithWhite:alpha:",192/255,1));
y=_db+2.5;
CGContextMoveToPoint(_d7,_d9+2,y);
CGContextAddLineToPoint(_d7,_da-2,y);
CGContextStrokePath(_d7);
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_de,_df,_e0){
with(_de){
if(_timerScrollersHide){
objj_msgSend(_timerScrollersHide,"invalidate");
}
if(!objj_msgSend(_verticalScroller,"isHidden")){
objj_msgSend(_verticalScroller,"fadeIn");
}
if(!objj_msgSend(_horizontalScroller,"isHidden")){
objj_msgSend(_horizontalScroller,"fadeIn");
}
if(!objj_msgSend(_horizontalScroller,"isHidden")||!objj_msgSend(_verticalScroller,"isHidden")){
_timerScrollersHide=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_7,_de,sel_getUid("_hideScrollers:"),nil,NO);
}
objj_msgSend(_de,"_respondToScrollWheelEventWithDeltaX:deltaY:",objj_msgSend(_e0,"deltaX"),objj_msgSend(_e0,"deltaY"));
}
}),new objj_method(sel_getUid("scrollPageUp:"),function(_e1,_e2,_e3){
with(_e1){
var _e4=objj_msgSend(_contentView,"bounds");
objj_msgSend(_e1,"moveByOffset:",CGSizeMake(0,-((_e4.size.height)-_verticalPageScroll)));
}
}),new objj_method(sel_getUid("scrollPageDown:"),function(_e5,_e6,_e7){
with(_e5){
var _e8=objj_msgSend(_contentView,"bounds");
objj_msgSend(_e5,"moveByOffset:",CGSizeMake(0,(_e8.size.height)-_verticalPageScroll));
}
}),new objj_method(sel_getUid("scrollToBeginningOfDocument:"),function(_e9,_ea,_eb){
with(_e9){
objj_msgSend(_contentView,"scrollToPoint:",{x:0,y:0});
objj_msgSend(_headerClipView,"scrollToPoint:",{x:0,y:0});
}
}),new objj_method(sel_getUid("scrollToEndOfDocument:"),function(_ec,_ed,_ee){
with(_ec){
var _ef=objj_msgSend(_contentView,"bounds"),_f0=objj_msgSend(objj_msgSend(_ec,"documentView"),"frame"),_f1={x:0,y:(_f0.size.height)-(_ef.size.height)};
objj_msgSend(_contentView,"scrollToPoint:",_f1);
objj_msgSend(_headerClipView,"scrollToPoint:",{x:0,y:0});
}
}),new objj_method(sel_getUid("moveLeft:"),function(_f2,_f3,_f4){
with(_f2){
objj_msgSend(_f2,"moveByOffset:",CGSizeMake(-_horizontalLineScroll,0));
}
}),new objj_method(sel_getUid("moveRight:"),function(_f5,_f6,_f7){
with(_f5){
objj_msgSend(_f5,"moveByOffset:",CGSizeMake(_horizontalLineScroll,0));
}
}),new objj_method(sel_getUid("moveUp:"),function(_f8,_f9,_fa){
with(_f8){
objj_msgSend(_f8,"moveByOffset:",CGSizeMake(0,-_verticalLineScroll));
}
}),new objj_method(sel_getUid("moveDown:"),function(_fb,_fc,_fd){
with(_fb){
objj_msgSend(_fb,"moveByOffset:",CGSizeMake(0,_verticalLineScroll));
}
}),new objj_method(sel_getUid("moveByOffset:"),function(_fe,_ff,_100){
with(_fe){
var _101=objj_msgSend(objj_msgSend(_fe,"documentView"),"frame"),_102=objj_msgSend(_contentView,"bounds");
_102.origin.x+=_100.width;
_102.origin.y+=_100.height;
objj_msgSend(_contentView,"scrollToPoint:",_102.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_102.origin.x,0));
}
})]);
class_addMethods(_b,[new objj_method(sel_getUid("initialize"),function(self,_103){
with(self){
if(self!==objj_msgSend(CPScrollView,"class")){
return;
}
var _104=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPScrollersGlobalStyle");
if(_104==nil||_104==-1){
_8=_1()?CPScrollerStyleOverlay:CPScrollerStyleLegacy;
}else{
_8=_104;
}
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(self,_105){
with(self){
return "scrollview";
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_106){
with(self){
return objj_msgSend(CPDictionary,"dictionaryWithJSObject:",{"bottom-corner-color":objj_msgSend(CPColor,"whiteColor"),"border-color":objj_msgSend(CPColor,"blackColor")});
}
}),new objj_method(sel_getUid("contentSizeForFrameSize:hasHorizontalScroller:hasVerticalScroller:borderType:"),function(self,_107,_108,_109,_10a,_10b){
with(self){
var _10c=objj_msgSend(self,"_insetBounds:borderType:",{origin:{x:0,y:0},size:{width:_108.width,height:_108.height}},_10b),_10d=objj_msgSend(CPScroller,"scrollerWidth");
if(_109){
_10c.size.height-=_10d;
}
if(_10a){
_10c.size.width-=_10d;
}
return _10c.size;
}
}),new objj_method(sel_getUid("frameSizeForContentSize:hasHorizontalScroller:hasVerticalScroller:borderType:"),function(self,_10e,_10f,_110,_111,_112){
with(self){
var _113=objj_msgSend(self,"_insetBounds:borderType:",{origin:{x:0,y:0},size:{width:_10f.width,height:_10f.height}},_112),_114=_10f.width-_113.size.width,_115=_10f.height-_113.size.height,_116={width:_10f.width+_114,height:_10f.height+_115},_117=objj_msgSend(CPScroller,"scrollerWidth");
if(_110){
_116.height+=_117;
}
if(_111){
_116.width+=_117;
}
return _116;
}
}),new objj_method(sel_getUid("_insetBounds:borderType:"),function(self,_118,_119,_11a){
with(self){
switch(_11a){
case CPLineBorder:
case CPBezelBorder:
return {origin:{x:_119.origin.x+1,y:_119.origin.y+1},size:{width:_119.size.width-2*1,height:_119.size.height-2*1}};
case CPGrooveBorder:
_119={origin:{x:_119.origin.x+2,y:_119.origin.y+2},size:{width:_119.size.width-2*2,height:_119.size.height-2*2}};
++_119.origin.y;
--_119.size.height;
return _119;
case CPNoBorder:
default:
return _119;
}
}
}),new objj_method(sel_getUid("globalScrollerStyle"),function(self,_11b){
with(self){
return _8;
}
}),new objj_method(sel_getUid("setGlobalScrollerStyle:"),function(self,_11c,_11d){
with(self){
_8=_11d;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_9,nil);
}
})]);
var _11e="CPScrollViewContentView",_11f="CPScrollViewHeaderClipViewKey",_120="CPScrollViewVLineScroll",_121="CPScrollViewHLineScroll",_122="CPScrollViewVPageScroll",_123="CPScrollViewHPageScroll",_124="CPScrollViewHasVScroller",_125="CPScrollViewHasHScroller",_126="CPScrollViewVScroller",_127="CPScrollViewHScroller",_128="CPScrollViewAutohidesScroller",_129="CPScrollViewCornerViewKey",_12a="CPScrollViewBottomCornerViewKey",_12b="CPScrollViewBorderTypeKey",_12c="CPScrollViewScrollerStyleKey",_12d="CPScrollViewScrollerKnobStyleKey";
var _a=objj_getClass("CPScrollView");
if(!_a){
throw new SyntaxError("*** Could not find definition for class \"CPScrollView\"");
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("initWithCoder:"),function(self,_12e,_12f){
with(self){
if(self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPScrollView").super_class},"initWithCoder:",_12f)){
_verticalLineScroll=objj_msgSend(_12f,"decodeFloatForKey:",_120);
_verticalPageScroll=objj_msgSend(_12f,"decodeFloatForKey:",_122);
_horizontalLineScroll=objj_msgSend(_12f,"decodeFloatForKey:",_121);
_horizontalPageScroll=objj_msgSend(_12f,"decodeFloatForKey:",_123);
_contentView=objj_msgSend(_12f,"decodeObjectForKey:",_11e);
_headerClipView=objj_msgSend(_12f,"decodeObjectForKey:",_11f);
if(!_headerClipView){
_headerClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"init");
objj_msgSend(self,"addSubview:",_headerClipView);
}
_verticalScroller=objj_msgSend(_12f,"decodeObjectForKey:",_126);
_horizontalScroller=objj_msgSend(_12f,"decodeObjectForKey:",_127);
_hasVerticalScroller=objj_msgSend(_12f,"decodeBoolForKey:",_124);
_hasHorizontalScroller=objj_msgSend(_12f,"decodeBoolForKey:",_125);
_autohidesScrollers=objj_msgSend(_12f,"decodeBoolForKey:",_128);
_borderType=objj_msgSend(_12f,"decodeIntForKey:",_12b);
_cornerView=objj_msgSend(_12f,"decodeObjectForKey:",_129);
_bottomCornerView=objj_msgSend(_12f,"decodeObjectForKey:",_12a);
_delegate=nil;
_scrollTimer=nil;
_implementedDelegateMethods=0;
_scrollerStyle=objj_msgSend(_12f,"decodeObjectForKey:",_12c)||_8;
_scrollerKnobStyle=objj_msgSend(_12f,"decodeObjectForKey:",_12d)||CPScrollerKnobStyleDefault;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",self,sel_getUid("_didReceiveDefaultStyleChange:"),_9,nil);
}
return self;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(self,_130){
with(self){
objj_msgSend(self,"_updateScrollerStyle");
objj_msgSend(self,"_updateCornerAndHeaderView");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_131,_132){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPScrollView").super_class},"encodeWithCoder:",_132);
objj_msgSend(_132,"encodeObject:forKey:",_contentView,_11e);
objj_msgSend(_132,"encodeObject:forKey:",_headerClipView,_11f);
objj_msgSend(_132,"encodeObject:forKey:",_verticalScroller,_126);
objj_msgSend(_132,"encodeObject:forKey:",_horizontalScroller,_127);
objj_msgSend(_132,"encodeFloat:forKey:",_verticalLineScroll,_120);
objj_msgSend(_132,"encodeFloat:forKey:",_verticalPageScroll,_122);
objj_msgSend(_132,"encodeFloat:forKey:",_horizontalLineScroll,_121);
objj_msgSend(_132,"encodeFloat:forKey:",_horizontalPageScroll,_123);
objj_msgSend(_132,"encodeBool:forKey:",_hasVerticalScroller,_124);
objj_msgSend(_132,"encodeBool:forKey:",_hasHorizontalScroller,_125);
objj_msgSend(_132,"encodeBool:forKey:",_autohidesScrollers,_128);
objj_msgSend(_132,"encodeObject:forKey:",_cornerView,_129);
objj_msgSend(_132,"encodeObject:forKey:",_bottomCornerView,_12a);
objj_msgSend(_132,"encodeInt:forKey:",_borderType,_12b);
objj_msgSend(_132,"encodeInt:forKey:",_scrollerStyle,_12c);
objj_msgSend(_132,"encodeInt:forKey:",_scrollerKnobStyle,_12d);
}
})]);
