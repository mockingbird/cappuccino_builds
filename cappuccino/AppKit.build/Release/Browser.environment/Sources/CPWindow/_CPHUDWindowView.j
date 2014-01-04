@STATIC;1.0;i;13;CPTextField.ji;24;_CPTitleableWindowView.jt;7017;
objj_executeFile("CPTextField.j",YES);
objj_executeFile("_CPTitleableWindowView.j",YES);
var _1=nil,_2=nil,_3=nil;
var _4=26;
var _5=objj_allocateClassPair(_CPTitleableWindowView,"_CPHUDWindowView"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_toolbarView"),new objj_ivar("_closeButton")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_7,_8,_9){
with(_7){
var _a=objj_msgSend(objj_msgSend(_7,"class"),"contentRectForFrameRect:",_9);
if(objj_msgSend(objj_msgSend(objj_msgSend(_7,"window"),"toolbar"),"isVisible")){
var _b=CGRectGetHeight(objj_msgSend(objj_msgSend(_7,"toolbarView"),"frame"));
_a.origin.y+=_b;
_a.size.height-=_b;
}
return _a;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(objj_msgSend(_c,"class"),"frameRectForContentRect:",_e);
if(objj_msgSend(objj_msgSend(objj_msgSend(_c,"window"),"toolbar"),"isVisible")){
var _10=CGRectGetHeight(objj_msgSend(objj_msgSend(_c,"toolbarView"),"frame"));
_f.origin.y-=_10;
_f.size.height+=_10;
}
return _f;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_11,_12,_13,_14){
with(_11){
_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("_CPHUDWindowView").super_class},"initWithFrame:styleMask:",_13,_14);
if(_11){
objj_msgSend(_11,"registerThemeValues:",_2);
var _15=objj_msgSend(_11,"bounds");
objj_msgSend(_11,"setBackgroundColor:",_1);
if(_styleMask&CPClosableWindowMask){
var _16=objj_msgSend(_CPHUDWindowViewCloseImage,"size");
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(8,4,_16.width,_16.height));
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_closeButton,"setImage:",_CPHUDWindowViewCloseImage);
objj_msgSend(_closeButton,"setAlternateImage:",_CPHUDWindowViewCloseActiveImage);
objj_msgSend(_11,"addSubview:",_closeButton);
}
objj_msgSend(_11,"setResizeIndicatorOffset:",CGSizeMake(5,5));
objj_msgSend(_11,"tile");
}
return _11;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_17,_18){
with(_17){
objj_msgSend(_closeButton,"setTarget:",objj_msgSend(_17,"window"));
objj_msgSend(_closeButton,"setAction:",sel_getUid("performClose:"));
}
}),new objj_method(sel_getUid("toolbarView"),function(_19,_1a){
with(_19){
return _toolbarView;
}
}),new objj_method(sel_getUid("toolbarLabelColor"),function(_1b,_1c){
with(_1b){
return objj_msgSend(CPColor,"whiteColor");
}
}),new objj_method(sel_getUid("toolbarLabelShadowColor"),function(_1d,_1e){
with(_1d){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_1f,_20){
with(_1f){
return {width:0,height:objj_msgSend(objj_msgSend(_1f,"class"),"titleBarHeight")};
}
}),new objj_method(sel_getUid("tile"),function(_21,_22){
with(_21){
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("_CPHUDWindowView").super_class},"tile");
var _23=objj_msgSend(_21,"window"),_24=objj_msgSend(_21,"bounds"),_25=(_24.size.width);
objj_msgSend(_titleField,"setFrame:",{origin:{x:20,y:0},size:{width:_25-40,height:objj_msgSend(_21,"toolbarOffset").height}});
var _26=objj_msgSend(_21,"toolbarMaxY");
if(objj_msgSend(_titleField,"isHidden")){
_26-=(objj_msgSend(_21,"toolbarOffset")).height;
}
var _27={origin:{x:0,y:_26},size:{width:_25,height:(_24.size.height)-_26}};
objj_msgSend(objj_msgSend(_23,"contentView"),"setFrame:",_27);
}
}),new objj_method(sel_getUid("_enableSheet:"),function(_28,_29,_2a){
with(_28){
objj_msgSendSuper({receiver:_28,super_class:objj_getClass("_CPHUDWindowView").super_class},"_enableSheet:",_2a);
objj_msgSend(_closeButton,"setHidden:",_2a);
objj_msgSend(_titleField,"setHidden:",_2a);
var _2b=objj_msgSend(_28,"window"),_2c=objj_msgSend(_2b,"frame"),dy=(objj_msgSend(_28,"toolbarOffset")).height;
if(_2a){
dy=-dy;
}
var _2d=(_2c.origin.y+_2c.size.height)+dy,_2e=(_2c.origin.x+_2c.size.width);
_2c.size.height+=dy;
objj_msgSend(_28,"setFrameSize:",{width:_2e,height:_2d});
objj_msgSend(_28,"tile");
objj_msgSend(_2b,"setFrame:display:animate:",_2c,NO,NO);
objj_msgSend(_2b,"setMovableByWindowBackground:",!_2a);
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_2f,_30){
with(_2f){
if(_2f!==objj_msgSend(_CPHUDWindowView,"class")){
return;
}
var _31=objj_msgSend(CPBundle,"bundleForClass:",_2f);
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground0.png"),CPSizeMake(7,37)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground1.png"),CPSizeMake(1,37)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground2.png"),CPSizeMake(7,37)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground3.png"),CPSizeMake(7,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground4.png"),CPSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground5.png"),CPSizeMake(7,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground6.png"),CPSizeMake(7,3)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground7.png"),CPSizeMake(1,3)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground8.png"),CPSizeMake(7,3))]));
_CPHUDWindowViewCloseImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","HUDTheme/WindowClose.png"),CPSizeMake(18,18));
_CPHUDWindowViewCloseActiveImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_31,"pathForResource:","HUDTheme/WindowCloseActive.png"),CPSizeMake(18,18));
_2=[["title-font",objj_msgSend(CPFont,"systemFontOfSize:",objj_msgSend(CPFont,"systemFontSize")-1)],["title-text-color",objj_msgSend(CPColor,"colorWithWhite:alpha:",255/255,0.75)],["title-text-color",objj_msgSend(CPColor,"colorWithWhite:alpha:",255/255,1),CPThemeStateKeyWindow],["title-text-shadow-color",objj_msgSend(CPColor,"blackColor")],["title-text-shadow-offset",CGSizeMake(0,1)],["title-alignment",CPCenterTextAlignment],["title-line-break-mode",CPLineBreakByTruncatingTail],["title-vertical-alignment",CPCenterVerticalTextAlignment]];
}
}),new objj_method(sel_getUid("titleBarHeight"),function(_32,_33){
with(_32){
return _4;
}
})]);
