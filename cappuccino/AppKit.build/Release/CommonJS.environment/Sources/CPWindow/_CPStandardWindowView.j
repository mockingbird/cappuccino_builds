@STATIC;1.0;i;13;CPTextField.ji;24;_CPTitleableWindowView.jt;12230;
objj_executeFile("CPTextField.j",YES);
objj_executeFile("_CPTitleableWindowView.j",YES);
var _1=41;
var _2=nil,_3=nil;
var _4=objj_allocateClassPair(CPView,"_CPTexturedWindowHeadView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_gradientView"),new objj_ivar("_solidView"),new objj_ivar("_dividerView")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("_CPTexturedWindowHeadView").super_class},"initWithFrame:",_8);
if(_6){
var _9=objj_msgSend(_6,"class"),_a=objj_msgSend(_6,"bounds");
_gradientView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_a),_1));
objj_msgSend(_gradientView,"setBackgroundColor:",objj_msgSend(_9,"gradientColor"));
objj_msgSend(_6,"addSubview:",_gradientView);
_solidView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,_1,CGRectGetWidth(_a),CGRectGetHeight(_a)-_1));
objj_msgSend(_solidView,"setBackgroundColor:",objj_msgSend(_9,"solidColor"));
objj_msgSend(_6,"addSubview:",_solidView);
}
return _6;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_b,"bounds");
objj_msgSend(_gradientView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_e),_1));
objj_msgSend(_solidView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_e),CGRectGetHeight(_e)-_1));
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("gradientColor"),function(_f,_10){
with(_f){
if(!_2){
var _11=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPWindowView,"class"));
_2=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop0.png"),CGSizeMake(6,41)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop1.png"),CGSizeMake(1,41)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop2.png"),CGSizeMake(6,41))],NO));
}
return _2;
}
}),new objj_method(sel_getUid("solidColor"),function(_12,_13){
with(_12){
if(!_3){
_3=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",195/255,195/255,195/255,1);
}
return _3;
}
})]);
var _14=nil,_15=nil,_16=nil,_17=nil,_18=nil,_19=nil,_1a=nil,_1b=nil,_1c=nil;
var _1d=41;
var _4=objj_allocateClassPair(_CPTitleableWindowView,"_CPStandardWindowView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_headView"),new objj_ivar("_dividerView"),new objj_ivar("_bodyView"),new objj_ivar("_toolbarView"),new objj_ivar("_closeButton"),new objj_ivar("_minimizeButton"),new objj_ivar("_isDocumentEdited")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_1e,_1f,_20){
with(_1e){
var _21=objj_msgSend(objj_msgSend(_1e,"class"),"contentRectForFrameRect:",_20),_22=objj_msgSend(objj_msgSend(_1e,"window"),"toolbar");
if(objj_msgSend(_22,"isVisible")){
var _23=CGRectGetHeight(objj_msgSend(objj_msgSend(_22,"_toolbarView"),"frame"));
_21.origin.y+=_23;
_21.size.height-=_23;
}
return _21;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_24,_25,_26){
with(_24){
var _27=objj_msgSend(objj_msgSend(_24,"class"),"frameRectForContentRect:",_26),_28=objj_msgSend(objj_msgSend(_24,"window"),"toolbar");
if(objj_msgSend(_28,"isVisible")){
var _29=CGRectGetHeight(objj_msgSend(objj_msgSend(_28,"_toolbarView"),"frame"));
_27.origin.y-=_29;
_27.size.height+=_29;
}
return _27;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_2a,_2b,_2c,_2d){
with(_2a){
_2a=objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("_CPStandardWindowView").super_class},"initWithFrame:styleMask:",_2c,_2d);
if(_2a){
objj_msgSend(_2a,"registerThemeValues:",_1c);
var _2e=objj_msgSend(_2a,"class"),_2f=objj_msgSend(_2a,"bounds");
_headView=objj_msgSend(objj_msgSend(_CPTexturedWindowHeadView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_2f),objj_msgSend(objj_msgSend(_2a,"class"),"titleBarHeight")));
objj_msgSend(_headView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_headView,"setHitTests:",NO);
objj_msgSend(_2a,"addSubview:positioned:relativeTo:",_headView,CPWindowBelow,_titleField);
_dividerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_headView,"frame")),CGRectGetWidth(_2f),1));
objj_msgSend(_dividerView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_dividerView,"setBackgroundColor:",objj_msgSend(_2e,"dividerBackgroundColor"));
objj_msgSend(_dividerView,"setHitTests:",NO);
objj_msgSend(_2a,"addSubview:",_dividerView);
var y=CGRectGetMaxY(objj_msgSend(_dividerView,"frame"));
_bodyView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,y,CGRectGetWidth(_2f),CGRectGetHeight(_2f)-y));
objj_msgSend(_bodyView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_bodyView,"setBackgroundColor:",objj_msgSend(_2e,"bodyBackgroundColor"));
objj_msgSend(_bodyView,"setHitTests:",NO);
objj_msgSend(_2a,"addSubview:",_bodyView);
objj_msgSend(_2a,"setResizeIndicatorOffset:",CGSizeMake(2,2));
if(_styleMask&CPClosableWindowMask){
if(!_16){
var _30=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_16=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButton.png"),CGSizeMake(16,16));
_17=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButtonHighlighted.png"),CGSizeMake(16,16));
_18=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButtonUnsaved.png"),CGSizeMake(16,16));
_19=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButtonUnsavedHighlighted.png"),CGSizeMake(16,16));
}
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(8,6,16,16));
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_2a,"_updateCloseButton");
objj_msgSend(_2a,"addSubview:",_closeButton);
}
if(_styleMask&CPMiniaturizableWindowMask&&!objj_msgSend(CPPlatform,"isBrowser")){
if(!_1a){
var _30=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_1a=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","CPWindow/Standard/CPWindowStandardMinimizeButton.png"),CGSizeMake(16,16));
_1b=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","CPWindow/Standard/CPWindowStandardMinimizeButtonHighlighted.png"),CGSizeMake(16,16));
}
_minimizeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(27,7,16,16));
objj_msgSend(_minimizeButton,"setBordered:",NO);
objj_msgSend(_minimizeButton,"setImage:",_1a);
objj_msgSend(_minimizeButton,"setAlternateImage:",_1b);
objj_msgSend(_2a,"addSubview:",_minimizeButton);
}
objj_msgSend(_2a,"tile");
}
return _2a;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_31,_32){
with(_31){
objj_msgSend(_closeButton,"setTarget:",objj_msgSend(_31,"window"));
objj_msgSend(_closeButton,"setAction:",sel_getUid("performClose:"));
objj_msgSend(_minimizeButton,"setTarget:",objj_msgSend(_31,"window"));
objj_msgSend(_minimizeButton,"setAction:",sel_getUid("performMiniaturize:"));
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_33,_34){
with(_33){
return CGSizeMake(0,objj_msgSend(objj_msgSend(_33,"class"),"titleBarHeight"));
}
}),new objj_method(sel_getUid("tile"),function(_35,_36){
with(_35){
objj_msgSendSuper({receiver:_35,super_class:objj_getClass("_CPStandardWindowView").super_class},"tile");
var _37=objj_msgSend(_35,"window"),_38=objj_msgSend(_35,"bounds"),_39=(_38.size.width);
objj_msgSend(_headView,"setFrameSize:",{width:_39,height:objj_msgSend(_35,"toolbarMaxY")});
objj_msgSend(_dividerView,"setFrame:",{origin:{x:0,y:(objj_msgSend(_headView,"frame").origin.y+objj_msgSend(_headView,"frame").size.height)},size:{width:_39,height:1}});
var _3a=0,_3b=0;
if(!objj_msgSend(_dividerView,"isHidden")){
_3b=(objj_msgSend(_dividerView,"frame").origin.y);
_3a=(objj_msgSend(_dividerView,"frame").origin.y+objj_msgSend(_dividerView,"frame").size.height);
}
objj_msgSend(_bodyView,"setFrame:",{origin:{x:0,y:_3a},size:{width:_39,height:(_38.size.height)-_3a}});
var _3c=8;
if(_closeButton){
_3c+=19;
}
if(_minimizeButton){
_3c+=19;
}
objj_msgSend(_titleField,"setFrame:",{origin:{x:_3c,y:0},size:{width:_39-_3c*2,height:objj_msgSend(objj_msgSend(_35,"class"),"titleBarHeight")}});
var _3d={origin:{x:0,y:_3a},size:{width:_39,height:(objj_msgSend(_bodyView,"frame").size.height)}};
objj_msgSend(objj_msgSend(_37,"contentView"),"setFrame:",_3d);
}
}),new objj_method(sel_getUid("_updateCloseButton"),function(_3e,_3f){
with(_3e){
if(_isDocumentEdited){
objj_msgSend(_closeButton,"setImage:",_18);
objj_msgSend(_closeButton,"setAlternateImage:",_19);
}else{
objj_msgSend(_closeButton,"setImage:",_16);
objj_msgSend(_closeButton,"setAlternateImage:",_17);
}
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_40,_41,_42){
with(_40){
_isDocumentEdited=_42;
objj_msgSend(_40,"_updateCloseButton");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_43,_44,_45){
with(_43){
if(!objj_msgSend(_headView,"isHidden")){
if(CGRectContainsPoint(objj_msgSend(_headView,"frame"),objj_msgSend(_43,"convertPoint:fromView:",objj_msgSend(_45,"locationInWindow"),nil))){
return objj_msgSend(_43,"trackMoveWithEvent:",_45);
}
}
objj_msgSendSuper({receiver:_43,super_class:objj_getClass("_CPStandardWindowView").super_class},"mouseDown:",_45);
}
}),new objj_method(sel_getUid("_enableSheet:"),function(_46,_47,_48){
with(_46){
objj_msgSendSuper({receiver:_46,super_class:objj_getClass("_CPStandardWindowView").super_class},"_enableSheet:",_48);
objj_msgSend(_headView,"setHidden:",_48);
objj_msgSend(_dividerView,"setHidden:",_48);
objj_msgSend(_closeButton,"setHidden:",_48);
objj_msgSend(_minimizeButton,"setHidden:",_48);
objj_msgSend(_titleField,"setHidden:",_48);
if(_48){
objj_msgSend(_bodyView,"setBackgroundColor:",objj_msgSend(_CPDocModalWindowView,"bodyBackgroundColor"));
}else{
objj_msgSend(_bodyView,"setBackgroundColor:",objj_msgSend(objj_msgSend(_46,"class"),"bodyBackgroundColor"));
}
var _49=objj_msgSend(_46,"window"),_4a=objj_msgSend(_49,"frame");
var dy=(objj_msgSend(_headView,"frame").size.height)+(objj_msgSend(_dividerView,"frame").size.height);
if(_48){
dy=-dy;
}
var _4b=(_4a.origin.y+_4a.size.height)+dy,_4c=(_4a.origin.x+_4a.size.width);
_4a.size.height+=dy;
objj_msgSend(_46,"setFrameSize:",{width:_4c,height:_4b});
objj_msgSend(_46,"tile");
objj_msgSend(_49,"setFrame:display:animate:",_4a,NO,NO);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_4d,_4e){
with(_4d){
_1c=[["title-font",objj_msgSend(CPFont,"boldSystemFontOfSize:",CPFontCurrentSystemSize)],["title-text-color",objj_msgSend(CPColor,"colorWithWhite:alpha:",22/255,0.75)],["title-text-color",objj_msgSend(CPColor,"colorWithWhite:alpha:",22/255,1),CPThemeStateKeyWindow],["title-text-shadow-color",objj_msgSend(CPColor,"whiteColor")],["title-text-shadow-offset",CGSizeMake(0,1)],["title-alignment",CPCenterTextAlignment],["title-line-break-mode",CPLineBreakByTruncatingTail],["title-vertical-alignment",CPCenterVerticalTextAlignment]];
}
}),new objj_method(sel_getUid("bodyBackgroundColor"),function(_4f,_50){
with(_4f){
if(!_14){
_14=objj_msgSend(CPColor,"colorWithWhite:alpha:",0.96,1);
}
return _14;
}
}),new objj_method(sel_getUid("dividerBackgroundColor"),function(_51,_52){
with(_51){
if(!_15){
_15=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",125/255,125/255,125/255,1);
}
return _15;
}
})]);
