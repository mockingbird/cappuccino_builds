@STATIC;1.0;I;33;Foundation/CPNotificationCenter.ji;7;CPBox.ji;12;CPClipView.ji;12;CPScroller.ji;8;CPView.jt;35598;
objj_executeFile("Foundation/CPNotificationCenter.j",NO);
objj_executeFile("CPBox.j",YES);
objj_executeFile("CPClipView.j",YES);
objj_executeFile("CPScroller.j",YES);
objj_executeFile("CPView.j",YES);
var _1=function(){
return NO;
};
var _2=0.2,_3=1<<0,_4=1<<1,_5=1.3;
var _6=CPScrollerStyleOverlay,_7="CPScrollerStyleGlobalChangeNotification";
var _8=objj_allocateClassPair(CPView,"CPScrollView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_contentView"),new objj_ivar("_headerClipView"),new objj_ivar("_cornerView"),new objj_ivar("_bottomCornerView"),new objj_ivar("_delegate"),new objj_ivar("_scrollTimer"),new objj_ivar("_hasVerticalScroller"),new objj_ivar("_hasHorizontalScroller"),new objj_ivar("_autohidesScrollers"),new objj_ivar("_verticalScroller"),new objj_ivar("_horizontalScroller"),new objj_ivar("_recursionCount"),new objj_ivar("_implementedDelegateMethods"),new objj_ivar("_verticalLineScroll"),new objj_ivar("_verticalPageScroll"),new objj_ivar("_horizontalLineScroll"),new objj_ivar("_horizontalPageScroll"),new objj_ivar("_borderType"),new objj_ivar("_timerScrollersHide"),new objj_ivar("_scrollerStyle"),new objj_ivar("_scrollerKnobStyle")]);
objj_registerClassPair(_8);
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPScrollView").super_class},"initWithFrame:",_c);
if(_a){
_verticalLineScroll=10;
_verticalPageScroll=10;
_horizontalLineScroll=10;
_horizontalPageScroll=10;
_borderType=CPNoBorder;
_contentView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",objj_msgSend(_a,"_insetBounds"));
objj_msgSend(_a,"addSubview:",_contentView);
_headerClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"init");
objj_msgSend(_a,"addSubview:",_headerClipView);
_bottomCornerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"init");
objj_msgSend(_a,"addSubview:",_bottomCornerView);
objj_msgSend(_a,"setHasVerticalScroller:",YES);
objj_msgSend(_a,"setHasHorizontalScroller:",YES);
_scrollerKnobStyle=CPScrollerKnobStyleDefault;
objj_msgSend(_a,"setScrollerStyle:",_6);
_delegate=nil;
_scrollTimer=nil;
_implementedDelegateMethods=0;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_a,sel_getUid("_didReceiveDefaultStyleChange:"),_7,nil);
}
return _a;
}
}),new objj_method(sel_getUid("delegate"),function(_d,_e){
with(_d){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_f,_10,_11){
with(_f){
if(_11===_delegate){
return;
}
_delegate=_11;
_implementedDelegateMethods=0;
if(_delegate===nil){
return;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("scrollViewWillScroll:"))){
_implementedDelegateMethods|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("scrollViewDidScroll:"))){
_implementedDelegateMethods|=_4;
}
}
}),new objj_method(sel_getUid("scrollerStyle"),function(_12,_13){
with(_12){
return _scrollerStyle;
}
}),new objj_method(sel_getUid("setScrollerStyle:"),function(_14,_15,_16){
with(_14){
if(_scrollerStyle===_16){
return;
}
_scrollerStyle=_16;
objj_msgSend(_14,"_updateScrollerStyle");
}
}),new objj_method(sel_getUid("scrollerKnobStyle"),function(_17,_18){
with(_17){
return _scrollerKnobStyle;
}
}),new objj_method(sel_getUid("setScrollerKnobStyle:"),function(_19,_1a,_1b){
with(_19){
if(_scrollerKnobStyle===_1b){
return;
}
_scrollerKnobStyle=_1b;
objj_msgSend(_19,"_updateScrollerStyle");
}
}),new objj_method(sel_getUid("contentView"),function(_1c,_1d){
with(_1c){
return _contentView;
}
}),new objj_method(sel_getUid("setContentView:"),function(_1e,_1f,_20){
with(_1e){
if(_contentView===_20||!_20){
return;
}
var _21=objj_msgSend(_20,"documentView");
if(_21){
objj_msgSend(_21,"removeFromSuperview");
}
objj_msgSend(_contentView,"removeFromSuperview");
_contentView=_20;
objj_msgSend(_contentView,"setDocumentView:",_21);
objj_msgSend(_1e,"addSubview:",_contentView);
objj_msgSend(_1e,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("contentSize"),function(_22,_23){
with(_22){
return objj_msgSend(_contentView,"frame").size;
}
}),new objj_method(sel_getUid("documentView"),function(_24,_25){
with(_24){
return objj_msgSend(_contentView,"documentView");
}
}),new objj_method(sel_getUid("setDocumentView:"),function(_26,_27,_28){
with(_26){
objj_msgSend(_contentView,"setDocumentView:",_28);
objj_msgSend(_26,"_updateCornerAndHeaderView");
objj_msgSend(_26,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("borderType"),function(_29,_2a){
with(_29){
return _borderType;
}
}),new objj_method(sel_getUid("setBorderType:"),function(_2b,_2c,_2d){
with(_2b){
if(_borderType==_2d){
return;
}
_borderType=_2d;
objj_msgSend(_2b,"reflectScrolledClipView:",_contentView);
objj_msgSend(_2b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("horizontalScroller"),function(_2e,_2f){
with(_2e){
return _horizontalScroller;
}
}),new objj_method(sel_getUid("setHorizontalScroller:"),function(_30,_31,_32){
with(_30){
if(_horizontalScroller===_32){
return;
}
objj_msgSend(_horizontalScroller,"removeFromSuperview");
objj_msgSend(_horizontalScroller,"setTarget:",nil);
objj_msgSend(_horizontalScroller,"setAction:",nil);
_horizontalScroller=_32;
objj_msgSend(_horizontalScroller,"setTarget:",_30);
objj_msgSend(_horizontalScroller,"setAction:",sel_getUid("_horizontalScrollerDidScroll:"));
objj_msgSend(_30,"addSubview:",_horizontalScroller);
objj_msgSend(_30,"_updateScrollerStyle");
}
}),new objj_method(sel_getUid("hasHorizontalScroller"),function(_33,_34){
with(_33){
return _hasHorizontalScroller;
}
}),new objj_method(sel_getUid("setHasHorizontalScroller:"),function(_35,_36,_37){
with(_35){
if(_hasHorizontalScroller===_37){
return;
}
_hasHorizontalScroller=_37;
if(_hasHorizontalScroller&&!_horizontalScroller){
var _38=objj_msgSend(_35,"_insetBounds");
objj_msgSend(_35,"setHorizontalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,MAX((_38.size.width),objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle)+1),objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle))));
objj_msgSend(objj_msgSend(_35,"horizontalScroller"),"setFrameSize:",CGSizeMake((_38.size.width),objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle)));
}
objj_msgSend(_35,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("verticalScroller"),function(_39,_3a){
with(_39){
return _verticalScroller;
}
}),new objj_method(sel_getUid("setVerticalScroller:"),function(_3b,_3c,_3d){
with(_3b){
if(_verticalScroller===_3d){
return;
}
objj_msgSend(_verticalScroller,"removeFromSuperview");
objj_msgSend(_verticalScroller,"setTarget:",nil);
objj_msgSend(_verticalScroller,"setAction:",nil);
_verticalScroller=_3d;
objj_msgSend(_verticalScroller,"setTarget:",_3b);
objj_msgSend(_verticalScroller,"setAction:",sel_getUid("_verticalScrollerDidScroll:"));
objj_msgSend(_3b,"addSubview:",_verticalScroller);
objj_msgSend(_3b,"_updateScrollerStyle");
}
}),new objj_method(sel_getUid("hasVerticalScroller"),function(_3e,_3f){
with(_3e){
return _hasVerticalScroller;
}
}),new objj_method(sel_getUid("setHasVerticalScroller:"),function(_40,_41,_42){
with(_40){
if(_hasVerticalScroller===_42){
return;
}
_hasVerticalScroller=_42;
if(_hasVerticalScroller&&!_verticalScroller){
var _43=objj_msgSend(_40,"_insetBounds");
objj_msgSend(_40,"setVerticalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle),height:MAX((_43.size.height),objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle)+1)}}));
objj_msgSend(objj_msgSend(_40,"verticalScroller"),"setFrameSize:",CGSizeMake(objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle),(_43.size.height)));
}
objj_msgSend(_40,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("autohidesScrollers"),function(_44,_45){
with(_44){
return _autohidesScrollers;
}
}),new objj_method(sel_getUid("setAutohidesScrollers:"),function(_46,_47,_48){
with(_46){
if(_autohidesScrollers==_48){
return;
}
_autohidesScrollers=_48;
objj_msgSend(_46,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("bottomCornerView"),function(_49,_4a){
with(_49){
return _bottomCornerView;
}
}),new objj_method(sel_getUid("setBottomCornerView:"),function(_4b,_4c,_4d){
with(_4b){
if(_bottomCornerView===_4d){
return;
}
objj_msgSend(_bottomCornerView,"removeFromSuperview");
objj_msgSend(_4d,"setFrame:",objj_msgSend(_4b,"_bottomCornerViewFrame"));
objj_msgSend(_4b,"addSubview:",_4d);
_bottomCornerView=_4d;
objj_msgSend(_4b,"_updateCornerAndHeaderView");
}
}),new objj_method(sel_getUid("lineScroll"),function(_4e,_4f){
with(_4e){
return objj_msgSend(_4e,"horizontalLineScroll");
}
}),new objj_method(sel_getUid("setLineScroll:"),function(_50,_51,_52){
with(_50){
objj_msgSend(_50,"setHorizontalLineScroll:",_52);
objj_msgSend(_50,"setVerticalLineScroll:",_52);
}
}),new objj_method(sel_getUid("horizontalLineScroll"),function(_53,_54){
with(_53){
return _horizontalLineScroll;
}
}),new objj_method(sel_getUid("setHorizontalLineScroll:"),function(_55,_56,_57){
with(_55){
_horizontalLineScroll=_57;
}
}),new objj_method(sel_getUid("verticalLineScroll"),function(_58,_59){
with(_58){
return _verticalLineScroll;
}
}),new objj_method(sel_getUid("setVerticalLineScroll:"),function(_5a,_5b,_5c){
with(_5a){
_verticalLineScroll=_5c;
}
}),new objj_method(sel_getUid("pageScroll"),function(_5d,_5e){
with(_5d){
return objj_msgSend(_5d,"horizontalPageScroll");
}
}),new objj_method(sel_getUid("setPageScroll:"),function(_5f,_60,_61){
with(_5f){
objj_msgSend(_5f,"setHorizontalPageScroll:",_61);
objj_msgSend(_5f,"setVerticalPageScroll:",_61);
}
}),new objj_method(sel_getUid("horizontalPageScroll"),function(_62,_63){
with(_62){
return _horizontalPageScroll;
}
}),new objj_method(sel_getUid("setHorizontalPageScroll:"),function(_64,_65,_66){
with(_64){
_horizontalPageScroll=_66;
}
}),new objj_method(sel_getUid("verticalPageScroll"),function(_67,_68){
with(_67){
return _verticalPageScroll;
}
}),new objj_method(sel_getUid("setVerticalPageScroll:"),function(_69,_6a,_6b){
with(_69){
_verticalPageScroll=_6b;
}
}),new objj_method(sel_getUid("_updateScrollerStyle"),function(_6c,_6d){
with(_6c){
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
_timerScrollersHide=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_5,_6c,sel_getUid("_hideScrollers:"),nil,NO);
objj_msgSend(objj_msgSend(_6c,"bottomCornerView"),"setHidden:",YES);
}else{
objj_msgSend(objj_msgSend(_6c,"bottomCornerView"),"setHidden:",NO);
}
objj_msgSend(_6c,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("_insetBounds"),function(_6e,_6f){
with(_6e){
return objj_msgSend(objj_msgSend(_6e,"class"),"_insetBounds:borderType:",objj_msgSend(_6e,"bounds"),_borderType);
}
}),new objj_method(sel_getUid("_updateCornerAndHeaderView"),function(_70,_71){
with(_70){
var _72=objj_msgSend(_70,"documentView"),_73=objj_msgSend(_70,"_headerView"),_74=objj_msgSend(_72,"respondsToSelector:",sel_getUid("headerView"))?objj_msgSend(_72,"headerView"):nil;
if(_73!==_74){
objj_msgSend(_73,"removeFromSuperview");
objj_msgSend(_headerClipView,"setDocumentView:",_74);
}
var _75=objj_msgSend(_72,"respondsToSelector:",sel_getUid("cornerView"))?objj_msgSend(_72,"cornerView"):nil;
if(_cornerView!==_75){
objj_msgSend(_cornerView,"removeFromSuperview");
_cornerView=_75;
if(_cornerView){
objj_msgSend(_cornerView,"setHidden:",!(_scrollerStyle===CPScrollerStyleLegacy&&_verticalScroller&&!objj_msgSend(_verticalScroller,"isHidden")));
objj_msgSend(_70,"addSubview:",_cornerView);
}
}
objj_msgSend(_70,"reflectScrolledClipView:",_contentView);
objj_msgSend(_74,"setNeedsLayout");
objj_msgSend(_74,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_headerView"),function(_76,_77){
with(_76){
return objj_msgSend(_headerClipView,"documentView");
}
}),new objj_method(sel_getUid("_cornerViewFrame"),function(_78,_79){
with(_78){
if(!_cornerView){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _7a=objj_msgSend(_78,"_insetBounds"),_7b=objj_msgSend(_cornerView,"frame");
_7b.origin.x=(_7a.origin.x+_7a.size.width)-(_7b.size.width);
_7b.origin.y=(_7a.origin.y);
return _7b;
}
}),new objj_method(sel_getUid("_headerClipViewFrame"),function(_7c,_7d){
with(_7c){
var _7e=objj_msgSend(_7c,"_headerView");
if(!_7e){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _7f=objj_msgSend(_7c,"_insetBounds");
_7f.size.height=(objj_msgSend(_7e,"frame").size.height);
if((_scrollerStyle===CPScrollerStyleLegacy&&_verticalScroller&&!objj_msgSend(_verticalScroller,"isHidden"))){
_7f.size.width-=(objj_msgSend(_7c,"_cornerViewFrame").size.width);
}
return _7f;
}
}),new objj_method(sel_getUid("_bottomCornerViewFrame"),function(_80,_81){
with(_80){
if(objj_msgSend(objj_msgSend(_80,"horizontalScroller"),"isHidden")||objj_msgSend(objj_msgSend(_80,"verticalScroller"),"isHidden")){
return CGRectMakeZero();
}
var _82=objj_msgSend(objj_msgSend(_80,"verticalScroller"),"frame"),_83=CGRectMakeZero();
_83.origin.x=CGRectGetMinX(_82);
_83.origin.y=CGRectGetMaxY(_82);
_83.size.width=objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle);
_83.size.height=objj_msgSend(CPScroller,"scrollerWidthInStyle:",_scrollerStyle);
return _83;
}
}),new objj_method(sel_getUid("_verticalScrollerDidScroll:"),function(_84,_85,_86){
with(_84){
var _87=objj_msgSend(_86,"floatValue"),_88=objj_msgSend(objj_msgSend(_contentView,"documentView"),"frame"),_89=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_verticalScroller,"hitPart")){
case CPScrollerDecrementLine:
_89.origin.y-=_verticalLineScroll;
break;
case CPScrollerIncrementLine:
_89.origin.y+=_verticalLineScroll;
break;
case CPScrollerDecrementPage:
_89.origin.y-=(_89.size.height)-_verticalPageScroll;
break;
case CPScrollerIncrementPage:
_89.origin.y+=(_89.size.height)-_verticalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_89.origin.y=ROUND(_87*((_88.size.height)-(_89.size.height)));
}
objj_msgSend(_84,"_sendDelegateMessages");
objj_msgSend(_contentView,"scrollToPoint:",_89.origin);
}
}),new objj_method(sel_getUid("_horizontalScrollerDidScroll:"),function(_8a,_8b,_8c){
with(_8a){
var _8d=objj_msgSend(_8c,"floatValue"),_8e=objj_msgSend(objj_msgSend(_8a,"documentView"),"frame"),_8f=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_horizontalScroller,"hitPart")){
case CPScrollerDecrementLine:
_8f.origin.x-=_horizontalLineScroll;
break;
case CPScrollerIncrementLine:
_8f.origin.x+=_horizontalLineScroll;
break;
case CPScrollerDecrementPage:
_8f.origin.x-=(_8f.size.width)-_horizontalPageScroll;
break;
case CPScrollerIncrementPage:
_8f.origin.x+=(_8f.size.width)-_horizontalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_8f.origin.x=ROUND(_8d*((_8e.size.width)-(_8f.size.width)));
}
objj_msgSend(_8a,"_sendDelegateMessages");
objj_msgSend(_contentView,"scrollToPoint:",_8f.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_8f.origin.x,0));
}
}),new objj_method(sel_getUid("_sendDelegateMessages"),function(_90,_91){
with(_90){
if(_implementedDelegateMethods==0){
return;
}
if(!_scrollTimer){
objj_msgSend(_90,"_scrollViewWillScroll");
_scrollTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_2,_90,sel_getUid("_scrollViewDidScroll"),nil,YES);
}else{
objj_msgSend(_scrollTimer,"setFireDate:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_2));
}
}
}),new objj_method(sel_getUid("_hideScrollers:"),function(_92,_93,_94){
with(_92){
if(objj_msgSend(_verticalScroller,"allowFadingOut")){
objj_msgSend(_verticalScroller,"fadeOut");
}
if(objj_msgSend(_horizontalScroller,"allowFadingOut")){
objj_msgSend(_horizontalScroller,"fadeOut");
}
_timerScrollersHide=nil;
}
}),new objj_method(sel_getUid("_respondToScrollWheelEventWithDeltaX:deltaY:"),function(_95,_96,_97,_98){
with(_95){
var _99=objj_msgSend(objj_msgSend(_95,"documentView"),"frame"),_9a=objj_msgSend(_contentView,"bounds"),_9b=objj_msgSend(_contentView,"frame"),_9c=objj_msgSend(_95,"enclosingScrollView");
_9a.origin.x=ROUND(_9a.origin.x+_97);
_9a.origin.y=ROUND(_9a.origin.y+_98);
var _9d=objj_msgSend(_contentView,"constrainScrollPoint:",CGPointCreateCopy(_9a.origin)),_9e=_9a.origin.x-_9d.x,_9f=_9a.origin.y-_9d.y;
objj_msgSend(_95,"_sendDelegateMessages");
objj_msgSend(_contentView,"scrollToPoint:",_9d);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_9d.x,0));
if(_9e||_9f){
objj_msgSend(_9c,"_respondToScrollWheelEventWithDeltaX:deltaY:",_9e,_9f);
}
}
}),new objj_method(sel_getUid("_scrollViewWillScroll"),function(_a0,_a1){
with(_a0){
if(_implementedDelegateMethods&_3){
objj_msgSend(_delegate,"scrollViewWillScroll:",_a0);
}
}
}),new objj_method(sel_getUid("_scrollViewDidScroll"),function(_a2,_a3){
with(_a2){
objj_msgSend(_scrollTimer,"invalidate");
_scrollTimer=nil;
if(_implementedDelegateMethods&_4){
objj_msgSend(_delegate,"scrollViewDidScroll:",_a2);
}
}
}),new objj_method(sel_getUid("_didReceiveDefaultStyleChange:"),function(_a4,_a5,_a6){
with(_a4){
objj_msgSend(_a4,"setScrollerStyle:",_6);
}
}),new objj_method(sel_getUid("tile"),function(_a7,_a8){
with(_a7){
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(_a9,_aa,_ab){
with(_a9){
if(_contentView!==_ab){
return;
}
if(_recursionCount>5){
return;
}
++_recursionCount;
var _ac=objj_msgSend(_a9,"documentView");
if(!_ac){
if(_autohidesScrollers){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_horizontalScroller,"setHidden:",YES);
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_a9,"_insetBounds"));
objj_msgSend(_headerClipView,"setFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
--_recursionCount;
return;
}
var _ad=objj_msgSend(_ac,"frame"),_ae=objj_msgSend(_a9,"_insetBounds"),_af=objj_msgSend(_a9,"_headerClipViewFrame"),_b0=(_af.size.height);
_ae.origin.y+=_b0;
_ae.size.height-=_b0;
var _b1={width:(_ad.size.width)-(_ae.size.width),height:(_ad.size.height)-(_ae.size.height)},_b2=(objj_msgSend(_verticalScroller,"frame").size.width),_b3=(objj_msgSend(_horizontalScroller,"frame").size.height),_b4=_b1.height>0,_b5=_b1.width>0,_b6=_hasVerticalScroller&&(!_autohidesScrollers||_b4),_b7=_hasHorizontalScroller&&(!_autohidesScrollers||_b5);
if(_b6){
if(_scrollerStyle===CPScrollerStyleLegacy){
_b1.width+=_b2;
}
_b5=_b1.width>0;
_b7=_hasHorizontalScroller&&(!_autohidesScrollers||_b5);
}
if(_b7){
if(_scrollerStyle===CPScrollerStyleLegacy){
_b1.height+=_b3;
}
_b4=_b1.height>0;
_b6=_hasVerticalScroller&&(!_autohidesScrollers||_b4);
}
objj_msgSend(_verticalScroller,"setHidden:",!_b6);
objj_msgSend(_verticalScroller,"setEnabled:",_b4);
objj_msgSend(_horizontalScroller,"setHidden:",!_b7);
objj_msgSend(_horizontalScroller,"setEnabled:",_b5);
var _b8=objj_msgSend(CPScroller,"scrollerOverlay");
if(_scrollerStyle===CPScrollerStyleLegacy){
if(_b6){
_ae.size.width-=_b2;
}
if(_b7){
_ae.size.height-=_b3;
}
_b8=0;
}
var _b9=objj_msgSend(_contentView,"bounds").origin,_ba=!objj_msgSend(_verticalScroller,"isHidden"),_bb=!objj_msgSend(_horizontalScroller,"isHidden");
if(_b6){
var _bc=MAX((_ae.origin.y),MAX((objj_msgSend(_a9,"_cornerViewFrame").origin.y+objj_msgSend(_a9,"_cornerViewFrame").size.height),(_af.origin.y+_af.size.height)));
var _bd=(_ae.origin.y+_ae.size.height)-_bc;
if(_scrollerStyle===CPScrollerStyleOverlay&&_b5){
_bd-=_b3;
}
var _be=(_ad.size.height);
objj_msgSend(_verticalScroller,"setFloatValue:",(_b1.height<=0)?0:_b9.y/_b1.height);
objj_msgSend(_verticalScroller,"setKnobProportion:",_be>0?(_ae.size.height)/_be:1);
objj_msgSend(_verticalScroller,"setFrame:",{origin:{x:(_ae.origin.x+_ae.size.width)-_b8,y:_bc},size:{width:_b2,height:_bd}});
}else{
if(_ba){
objj_msgSend(_verticalScroller,"setFloatValue:",0);
objj_msgSend(_verticalScroller,"setKnobProportion:",1);
}
}
if(_b7){
var _bf=(_ae.size.width);
if(_scrollerStyle===CPScrollerStyleOverlay&&_b4){
_bf-=_b2;
}
var _c0=(_ad.size.width);
objj_msgSend(_horizontalScroller,"setFloatValue:",(_b1.width<=0)?0:_b9.x/_b1.width);
objj_msgSend(_horizontalScroller,"setKnobProportion:",_c0>0?(_ae.size.width)/_c0:1);
objj_msgSend(_horizontalScroller,"setFrame:",{origin:{x:(_ae.origin.x),y:(_ae.origin.y+_ae.size.height)-_b8},size:{width:_bf,height:_b3}});
}else{
if(_bb){
objj_msgSend(_horizontalScroller,"setFloatValue:",0);
objj_msgSend(_horizontalScroller,"setKnobProportion:",1);
}
}
objj_msgSend(_contentView,"setFrame:",_ae);
objj_msgSend(_headerClipView,"setFrame:",objj_msgSend(_a9,"_headerClipViewFrame"));
objj_msgSend(objj_msgSend(_headerClipView,"documentView"),"setNeedsDisplay:",YES);
if((_scrollerStyle===CPScrollerStyleLegacy&&_verticalScroller&&!objj_msgSend(_verticalScroller,"isHidden"))){
objj_msgSend(_cornerView,"setFrame:",objj_msgSend(_a9,"_cornerViewFrame"));
objj_msgSend(_cornerView,"setHidden:",NO);
}else{
objj_msgSend(_cornerView,"setHidden:",YES);
}
if(_scrollerStyle===CPScrollerStyleLegacy){
objj_msgSend(objj_msgSend(_a9,"bottomCornerView"),"setFrame:",objj_msgSend(_a9,"_bottomCornerViewFrame"));
objj_msgSend(objj_msgSend(_a9,"bottomCornerView"),"setBackgroundColor:",objj_msgSend(_a9,"currentValueForThemeAttribute:","bottom-corner-color"));
}
--_recursionCount;
}
}),new objj_method(sel_getUid("flashScrollers"),function(_c1,_c2){
with(_c1){
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
_timerScrollersHide=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_5,_c1,sel_getUid("_hideScrollers:"),nil,NO);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_c3,_c4,_c5){
with(_c3){
objj_msgSend(_c3,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("drawRect:"),function(_c6,_c7,_c8){
with(_c6){
objj_msgSendSuper({receiver:_c6,super_class:objj_getClass("CPScrollView").super_class},"drawRect:",_c8);
if(_borderType==CPNoBorder){
return;
}
var _c9=objj_msgSend(_c6,"bounds"),_ca=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetLineWidth(_ca,1);
switch(_borderType){
case CPLineBorder:
CGContextSetStrokeColor(_ca,objj_msgSend(_c6,"currentValueForThemeAttribute:","border-color"));
CGContextStrokeRect(_ca,{origin:{x:_c9.origin.x+0.5,y:_c9.origin.y+0.5},size:{width:_c9.size.width-2*0.5,height:_c9.size.height-2*0.5}});
break;
case CPBezelBorder:
objj_msgSend(_c6,"_drawGrayBezelInContext:bounds:",_ca,_c9);
break;
case CPGrooveBorder:
objj_msgSend(_c6,"_drawGrooveInContext:bounds:",_ca,_c9);
break;
default:
break;
}
}
}),new objj_method(sel_getUid("_drawGrayBezelInContext:bounds:"),function(_cb,_cc,_cd,_ce){
with(_cb){
var _cf=(_ce.origin.x),_d0=(_ce.origin.x+_ce.size.width),_d1=(_ce.origin.y),_d2=(_ce.origin.y+_ce.size.height),y=_d1+0.5;
CGContextSetStrokeColor(_cd,objj_msgSend(CPColor,"colorWithWhite:alpha:",142/255,1));
CGContextBeginPath(_cd);
CGContextMoveToPoint(_cd,_cf,y);
CGContextAddLineToPoint(_cd,_d0,y);
CGContextStrokePath(_cd);
CGContextSetStrokeColor(_cd,objj_msgSend(CPColor,"colorWithWhite:alpha:",192/255,1));
var x=_d0-0.5;
CGContextBeginPath(_cd);
CGContextMoveToPoint(_cd,x,_d1+1);
CGContextAddLineToPoint(_cd,x,_d2);
CGContextMoveToPoint(_cd,x-0.5,_d2-0.5);
CGContextAddLineToPoint(_cd,_cf,_d2-0.5);
x=_cf+0.5;
CGContextMoveToPoint(_cd,x,_d2);
CGContextAddLineToPoint(_cd,x,_d1+1);
CGContextStrokePath(_cd);
}
}),new objj_method(sel_getUid("_drawGrooveInContext:bounds:"),function(_d3,_d4,_d5,_d6){
with(_d3){
var _d7=(_d6.origin.x),_d8=(_d6.origin.x+_d6.size.width),_d9=(_d6.origin.y),_da=(_d6.origin.y+_d6.size.height);
CGContextBeginPath(_d5);
CGContextSetStrokeColor(_d5,objj_msgSend(CPColor,"colorWithWhite:alpha:",159/255,1));
var y=_d9+0.5;
CGContextMoveToPoint(_d5,_d7,y);
CGContextAddLineToPoint(_d5,_d8,y);
var x=_d8-1.5;
CGContextMoveToPoint(_d5,x,_d9+2);
CGContextAddLineToPoint(_d5,x,_da-1);
y=_da-1.5;
CGContextMoveToPoint(_d5,_d8-1,y);
CGContextAddLineToPoint(_d5,_d7+2,y);
x=_d7+0.5;
CGContextMoveToPoint(_d5,x,_da);
CGContextAddLineToPoint(_d5,x,_d9);
CGContextStrokePath(_d5);
CGContextBeginPath(_d5);
CGContextSetStrokeColor(_d5,objj_msgSend(CPColor,"whiteColor"));
var _db={origin:{x:_d6.origin.x+1,y:_d6.origin.y+1},size:{width:_d6.size.width,height:_d6.size.height}};
_db.size.width-=1;
_db.size.height-=1;
CGContextStrokeRect(_d5,{origin:{x:_db.origin.x+0.5,y:_db.origin.y+0.5},size:{width:_db.size.width-2*0.5,height:_db.size.height-2*0.5}});
CGContextBeginPath(_d5);
CGContextSetStrokeColor(_d5,objj_msgSend(CPColor,"colorWithWhite:alpha:",192/255,1));
y=_d9+2.5;
CGContextMoveToPoint(_d5,_d7+2,y);
CGContextAddLineToPoint(_d5,_d8-2,y);
CGContextStrokePath(_d5);
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_dc,_dd,_de){
with(_dc){
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
_timerScrollersHide=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_5,_dc,sel_getUid("_hideScrollers:"),nil,NO);
}
objj_msgSend(_dc,"_respondToScrollWheelEventWithDeltaX:deltaY:",objj_msgSend(_de,"deltaX"),objj_msgSend(_de,"deltaY"));
}
}),new objj_method(sel_getUid("scrollPageUp:"),function(_df,_e0,_e1){
with(_df){
var _e2=objj_msgSend(_contentView,"bounds");
objj_msgSend(_df,"moveByOffset:",CGSizeMake(0,-((_e2.size.height)-_verticalPageScroll)));
}
}),new objj_method(sel_getUid("scrollPageDown:"),function(_e3,_e4,_e5){
with(_e3){
var _e6=objj_msgSend(_contentView,"bounds");
objj_msgSend(_e3,"moveByOffset:",CGSizeMake(0,(_e6.size.height)-_verticalPageScroll));
}
}),new objj_method(sel_getUid("scrollToBeginningOfDocument:"),function(_e7,_e8,_e9){
with(_e7){
objj_msgSend(_contentView,"scrollToPoint:",{x:0,y:0});
objj_msgSend(_headerClipView,"scrollToPoint:",{x:0,y:0});
}
}),new objj_method(sel_getUid("scrollToEndOfDocument:"),function(_ea,_eb,_ec){
with(_ea){
var _ed=objj_msgSend(_contentView,"bounds"),_ee=objj_msgSend(objj_msgSend(_ea,"documentView"),"frame"),_ef={x:0,y:(_ee.size.height)-(_ed.size.height)};
objj_msgSend(_contentView,"scrollToPoint:",_ef);
objj_msgSend(_headerClipView,"scrollToPoint:",{x:0,y:0});
}
}),new objj_method(sel_getUid("moveLeft:"),function(_f0,_f1,_f2){
with(_f0){
objj_msgSend(_f0,"moveByOffset:",CGSizeMake(-_horizontalLineScroll,0));
}
}),new objj_method(sel_getUid("moveRight:"),function(_f3,_f4,_f5){
with(_f3){
objj_msgSend(_f3,"moveByOffset:",CGSizeMake(_horizontalLineScroll,0));
}
}),new objj_method(sel_getUid("moveUp:"),function(_f6,_f7,_f8){
with(_f6){
objj_msgSend(_f6,"moveByOffset:",CGSizeMake(0,-_verticalLineScroll));
}
}),new objj_method(sel_getUid("moveDown:"),function(_f9,_fa,_fb){
with(_f9){
objj_msgSend(_f9,"moveByOffset:",CGSizeMake(0,_verticalLineScroll));
}
}),new objj_method(sel_getUid("moveByOffset:"),function(_fc,_fd,_fe){
with(_fc){
var _ff=objj_msgSend(objj_msgSend(_fc,"documentView"),"frame"),_100=objj_msgSend(_contentView,"bounds");
_100.origin.x+=_fe.width;
_100.origin.y+=_fe.height;
objj_msgSend(_contentView,"scrollToPoint:",_100.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_100.origin.x,0));
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(self,_101){
with(self){
if(self!==objj_msgSend(CPScrollView,"class")){
return;
}
var _102=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPScrollersGlobalStyle");
if(_102==nil||_102==-1){
_6=_1()?CPScrollerStyleOverlay:CPScrollerStyleLegacy;
}else{
_6=_102;
}
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(self,_103){
with(self){
return "scrollview";
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_104){
with(self){
return objj_msgSend(CPDictionary,"dictionaryWithJSObject:",{"bottom-corner-color":objj_msgSend(CPColor,"whiteColor"),"border-color":objj_msgSend(CPColor,"blackColor")});
}
}),new objj_method(sel_getUid("contentSizeForFrameSize:hasHorizontalScroller:hasVerticalScroller:borderType:"),function(self,_105,_106,_107,_108,_109){
with(self){
var _10a=objj_msgSend(self,"_insetBounds:borderType:",{origin:{x:0,y:0},size:{width:_106.width,height:_106.height}},_109),_10b=objj_msgSend(CPScroller,"scrollerWidth");
if(_107){
_10a.size.height-=_10b;
}
if(_108){
_10a.size.width-=_10b;
}
return _10a.size;
}
}),new objj_method(sel_getUid("frameSizeForContentSize:hasHorizontalScroller:hasVerticalScroller:borderType:"),function(self,_10c,_10d,_10e,_10f,_110){
with(self){
var _111=objj_msgSend(self,"_insetBounds:borderType:",{origin:{x:0,y:0},size:{width:_10d.width,height:_10d.height}},_110),_112=_10d.width-_111.size.width,_113=_10d.height-_111.size.height,_114={width:_10d.width+_112,height:_10d.height+_113},_115=objj_msgSend(CPScroller,"scrollerWidth");
if(_10e){
_114.height+=_115;
}
if(_10f){
_114.width+=_115;
}
return _114;
}
}),new objj_method(sel_getUid("_insetBounds:borderType:"),function(self,_116,_117,_118){
with(self){
switch(_118){
case CPLineBorder:
case CPBezelBorder:
return {origin:{x:_117.origin.x+1,y:_117.origin.y+1},size:{width:_117.size.width-2*1,height:_117.size.height-2*1}};
case CPGrooveBorder:
_117={origin:{x:_117.origin.x+2,y:_117.origin.y+2},size:{width:_117.size.width-2*2,height:_117.size.height-2*2}};
++_117.origin.y;
--_117.size.height;
return _117;
case CPNoBorder:
default:
return _117;
}
}
}),new objj_method(sel_getUid("globalScrollerStyle"),function(self,_119){
with(self){
return _6;
}
}),new objj_method(sel_getUid("setGlobalScrollerStyle:"),function(self,_11a,_11b){
with(self){
_6=_11b;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_7,nil);
}
})]);
var _11c="CPScrollViewContentView",_11d="CPScrollViewHeaderClipViewKey",_11e="CPScrollViewVLineScroll",_11f="CPScrollViewHLineScroll",_120="CPScrollViewVPageScroll",_121="CPScrollViewHPageScroll",_122="CPScrollViewHasVScroller",_123="CPScrollViewHasHScroller",_124="CPScrollViewVScroller",_125="CPScrollViewHScroller",_126="CPScrollViewAutohidesScroller",_127="CPScrollViewCornerViewKey",_128="CPScrollViewBottomCornerViewKey",_129="CPScrollViewBorderTypeKey",_12a="CPScrollViewScrollerStyleKey",_12b="CPScrollViewScrollerKnobStyleKey";
var _8=objj_getClass("CPScrollView");
if(!_8){
throw new SyntaxError("*** Could not find definition for class \"CPScrollView\"");
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(self,_12c,_12d){
with(self){
if(self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPScrollView").super_class},"initWithCoder:",_12d)){
_verticalLineScroll=objj_msgSend(_12d,"decodeFloatForKey:",_11e);
_verticalPageScroll=objj_msgSend(_12d,"decodeFloatForKey:",_120);
_horizontalLineScroll=objj_msgSend(_12d,"decodeFloatForKey:",_11f);
_horizontalPageScroll=objj_msgSend(_12d,"decodeFloatForKey:",_121);
_contentView=objj_msgSend(_12d,"decodeObjectForKey:",_11c);
_headerClipView=objj_msgSend(_12d,"decodeObjectForKey:",_11d);
if(!_headerClipView){
_headerClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"init");
objj_msgSend(self,"addSubview:",_headerClipView);
}
_verticalScroller=objj_msgSend(_12d,"decodeObjectForKey:",_124);
_horizontalScroller=objj_msgSend(_12d,"decodeObjectForKey:",_125);
_hasVerticalScroller=objj_msgSend(_12d,"decodeBoolForKey:",_122);
_hasHorizontalScroller=objj_msgSend(_12d,"decodeBoolForKey:",_123);
_autohidesScrollers=objj_msgSend(_12d,"decodeBoolForKey:",_126);
_borderType=objj_msgSend(_12d,"decodeIntForKey:",_129);
_cornerView=objj_msgSend(_12d,"decodeObjectForKey:",_127);
_bottomCornerView=objj_msgSend(_12d,"decodeObjectForKey:",_128);
_delegate=nil;
_scrollTimer=nil;
_implementedDelegateMethods=0;
_scrollerStyle=objj_msgSend(_12d,"decodeObjectForKey:",_12a)||_6;
_scrollerKnobStyle=objj_msgSend(_12d,"decodeObjectForKey:",_12b)||CPScrollerKnobStyleDefault;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",self,sel_getUid("_didReceiveDefaultStyleChange:"),_7,nil);
}
return self;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(self,_12e){
with(self){
objj_msgSend(self,"_updateScrollerStyle");
objj_msgSend(self,"_updateCornerAndHeaderView");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_12f,_130){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPScrollView").super_class},"encodeWithCoder:",_130);
objj_msgSend(_130,"encodeObject:forKey:",_contentView,_11c);
objj_msgSend(_130,"encodeObject:forKey:",_headerClipView,_11d);
objj_msgSend(_130,"encodeObject:forKey:",_verticalScroller,_124);
objj_msgSend(_130,"encodeObject:forKey:",_horizontalScroller,_125);
objj_msgSend(_130,"encodeFloat:forKey:",_verticalLineScroll,_11e);
objj_msgSend(_130,"encodeFloat:forKey:",_verticalPageScroll,_120);
objj_msgSend(_130,"encodeFloat:forKey:",_horizontalLineScroll,_11f);
objj_msgSend(_130,"encodeFloat:forKey:",_horizontalPageScroll,_121);
objj_msgSend(_130,"encodeBool:forKey:",_hasVerticalScroller,_122);
objj_msgSend(_130,"encodeBool:forKey:",_hasHorizontalScroller,_123);
objj_msgSend(_130,"encodeBool:forKey:",_autohidesScrollers,_126);
objj_msgSend(_130,"encodeObject:forKey:",_cornerView,_127);
objj_msgSend(_130,"encodeObject:forKey:",_bottomCornerView,_128);
objj_msgSend(_130,"encodeInt:forKey:",_borderType,_129);
objj_msgSend(_130,"encodeInt:forKey:",_scrollerStyle,_12a);
objj_msgSend(_130,"encodeInt:forKey:",_scrollerKnobStyle,_12b);
}
})]);
