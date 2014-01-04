@STATIC;1.0;i;13;CPImageView.ji;8;CPView.jt;11666;
objj_executeFile("CPImageView.j",YES);
objj_executeFile("CPView.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPView,"_CPWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_styleMask"),new objj_ivar("_resizeIndicator"),new objj_ivar("_resizeIndicatorOffset"),new objj_ivar("_toolbarView"),new objj_ivar("_toolbarOffset"),new objj_ivar("_resizeFrame"),new objj_ivar("_mouseDraggedPoint"),new objj_ivar("_cachedScreenFrame"),new objj_ivar("_sheetShadowView")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_4,_5,_6){
with(_4){
return objj_msgSend(objj_msgSend(_4,"class"),"contentRectForFrameRect:",_6);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(objj_msgSend(_7,"class"),"frameRectForContentRect:",_9);
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("_CPWindowView").super_class},"initWithFrame:",_c);
if(_a){
_styleMask=_d;
_resizeIndicatorOffset=CGSizeMakeZero();
_toolbarOffset=CGSizeMakeZero();
}
return _a;
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_e,_f,_10){
with(_e){
}
}),new objj_method(sel_getUid("setTitle:"),function(_11,_12,_13){
with(_11){
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_14,_15,_16){
with(_14){
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(_17,"window");
if((_styleMask&CPResizableWindowMask)&&_resizeIndicator){
var _1b=objj_msgSend(_resizeIndicator,"frame");
if(CGRectContainsPoint(_1b,objj_msgSend(_17,"convertPoint:fromView:",objj_msgSend(_19,"locationInWindow"),nil))){
return objj_msgSend(_17,"trackResizeWithEvent:",_19);
}
}
if(objj_msgSend(_1a,"isMovable")&&objj_msgSend(_1a,"isMovableByWindowBackground")){
objj_msgSend(_17,"trackMoveWithEvent:",_19);
}else{
objj_msgSendSuper({receiver:_17,super_class:objj_getClass("_CPWindowView").super_class},"mouseDown:",_19);
}
}
}),new objj_method(sel_getUid("trackResizeWithEvent:"),function(_1c,_1d,_1e){
with(_1c){
var _1f=objj_msgSend(_1e,"locationInWindow"),_20=objj_msgSend(_1e,"type");
if(_20===CPLeftMouseUp){
return;
}
var _21=objj_msgSend(_1c,"window");
if(_20===CPLeftMouseDown){
var _22=objj_msgSend(_21,"frame");
_resizeFrame=CGRectMake(_1f.x,_1f.y,CGRectGetWidth(_22),CGRectGetHeight(_22));
}else{
if(_20===CPLeftMouseDragged){
var _23=CGSizeMake(CGRectGetWidth(_resizeFrame)+_1f.x-CGRectGetMinX(_resizeFrame),CGRectGetHeight(_resizeFrame)+_1f.y-CGRectGetMinY(_resizeFrame));
if(_21._isSheet&&_21._parentView&&(_21._frame.size.width!==_23.width)){
objj_msgSend(_21._parentView,"_setAttachedSheetFrameOrigin");
}
objj_msgSend(_21,"setFrameSize:",_23);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_1c,sel_getUid("trackResizeWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_pointWithinScreenFrame:"),function(_24,_25,_26){
with(_24){
if(!objj_msgSend(CPPlatform,"isBrowser")){
return _26;
}
var _27=_cachedScreenFrame;
if(!_27){
_27=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame");
}
var _28=0;
if(objj_msgSend(CPMenu,"menuBarVisible")){
_28=objj_msgSend(objj_msgSend(CPApp,"mainMenu"),"menuBarHeight");
}
var _29=CGPointMake(0,0);
_29.x=MIN(MAX(_26.x,-_frame.size.width+4),CGRectGetMaxX(_27)-4);
_29.y=MIN(MAX(_26.y,_28),CGRectGetMaxY(_27)-8);
return _29;
}
}),new objj_method(sel_getUid("trackMoveWithEvent:"),function(_2a,_2b,_2c){
with(_2a){
if(!objj_msgSend(objj_msgSend(_2a,"window"),"isMovable")){
return;
}
var _2d=objj_msgSend(_2c,"type");
if(_2d===CPLeftMouseUp){
_cachedScreenFrame=nil;
return;
}else{
if(_2d===CPLeftMouseDown){
_mouseDraggedPoint=objj_msgSend(objj_msgSend(_2a,"window"),"convertBaseToGlobal:",objj_msgSend(_2c,"locationInWindow"));
_cachedScreenFrame=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame");
}else{
if(_2d===CPLeftMouseDragged){
var _2e=objj_msgSend(_2a,"window"),_2f=objj_msgSend(_2e,"frame"),_30=objj_msgSend(_2e,"convertBaseToGlobal:",objj_msgSend(_2c,"locationInWindow")),_31=objj_msgSend(_2a,"_pointWithinScreenFrame:",CGPointMake((_2f.origin.x)+(_30.x-_mouseDraggedPoint.x),(_2f.origin.y)+(_30.y-_mouseDraggedPoint.y)));
objj_msgSend(_2e,"setFrameOrigin:",_31);
_mouseDraggedPoint=objj_msgSend(_2a,"_pointWithinScreenFrame:",_30);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_2a,sel_getUid("trackMoveWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_32,_33,_34){
with(_32){
objj_msgSendSuper({receiver:_32,super_class:objj_getClass("_CPWindowView").super_class},"setFrameSize:",_34);
var _35=objj_msgSend(_32,"window");
if(objj_msgSend(_35,"attachedSheet")){
objj_msgSend(_35,"_setAttachedSheetFrameOrigin");
}
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_36,_37,_38){
with(_36){
if(_38){
var _39=objj_msgSend(_1,"size"),_3a=objj_msgSend(_36,"frame").size;
_resizeIndicator=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(_3a.width-_39.width-_resizeIndicatorOffset.width,_3a.height-_39.height-_resizeIndicatorOffset.height,_39.width,_39.height));
objj_msgSend(_resizeIndicator,"setImage:",_1);
objj_msgSend(_resizeIndicator,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_36,"addSubview:",_resizeIndicator);
}else{
objj_msgSend(_resizeIndicator,"removeFromSuperview");
_resizeIndicator=nil;
}
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_3b,_3c){
with(_3b){
return _resizeIndicator!==nil;
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_3d,_3e,_3f){
with(_3d){
if(CGSizeEqualToSize(_resizeIndicatorOffset,_3f)){
return;
}
_resizeIndicatorOffset=_3f;
if(!_resizeIndicator){
return;
}
var _40=objj_msgSend(_resizeIndicator,"frame").size,_41=objj_msgSend(_3d,"frame").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_41.width-_40.width-_3f.width,_41.height-_40.height-_3f.height));
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_42,_43){
with(_42){
return _resizeIndicatorOffset;
}
}),new objj_method(sel_getUid("windowDidChangeDocumentEdited"),function(_44,_45){
with(_44){
}
}),new objj_method(sel_getUid("windowDidChangeDocumentSaving"),function(_46,_47){
with(_46){
}
}),new objj_method(sel_getUid("showsToolbar"),function(_48,_49){
with(_48){
return YES;
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_4a,_4b){
with(_4a){
return _toolbarOffset;
}
}),new objj_method(sel_getUid("toolbarLabelColor"),function(_4c,_4d){
with(_4c){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("toolbarMaxY"),function(_4e,_4f){
with(_4e){
if(!_toolbarView||objj_msgSend(_toolbarView,"isHidden")){
return objj_msgSend(_4e,"toolbarOffset").height;
}
return CGRectGetMaxY(objj_msgSend(_toolbarView,"frame"));
}
}),new objj_method(sel_getUid("toolbarView"),function(_50,_51){
with(_50){
return _toolbarView;
}
}),new objj_method(sel_getUid("tile"),function(_52,_53){
with(_52){
var _54=objj_msgSend(_52,"window"),_55=objj_msgSend(_52,"bounds"),_56=CGRectGetWidth(_55);
if(objj_msgSend(objj_msgSend(_54,"toolbar"),"isVisible")){
var _57=objj_msgSend(_52,"toolbarView"),_58=objj_msgSend(_52,"toolbarOffset");
objj_msgSend(_57,"setFrame:",CGRectMake(_58.width,_58.height,_56,CGRectGetHeight(objj_msgSend(_57,"frame"))));
}
if(objj_msgSend(_52,"showsResizeIndicator")){
var _59=objj_msgSend(_resizeIndicator,"frame").size,_5a=objj_msgSend(_52,"bounds").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_5a.width-_59.width-_resizeIndicatorOffset.width,_5a.height-_59.height-_resizeIndicatorOffset.height));
}
}
}),new objj_method(sel_getUid("noteToolbarChanged"),function(_5b,_5c){
with(_5b){
var _5d=objj_msgSend(_5b,"window"),_5e=objj_msgSend(_5d,"toolbar"),_5f=objj_msgSend(_5e,"_toolbarView");
if(_toolbarView!==_5f){
objj_msgSend(_toolbarView,"removeFromSuperview");
if(_5f){
objj_msgSend(_5f,"removeFromSuperview");
objj_msgSend(_5f,"FIXME_setIsHUD:",_styleMask&CPHUDBackgroundWindowMask);
objj_msgSend(_5b,"addSubview:",_5f);
}
_toolbarView=_5f;
}
objj_msgSend(_5f,"setHidden:",!objj_msgSend(_5b,"showsToolbar")||!objj_msgSend(_5e,"isVisible"));
if(_5d){
var _60=objj_msgSend(_5b,"convertRect:toView:",objj_msgSend(objj_msgSend(_5d,"contentView"),"frame"),nil);
_60.origin=objj_msgSend(_5d,"convertBaseToGlobal:",_60.origin);
objj_msgSend(_5b,"setAutoresizesSubviews:",NO);
objj_msgSend(_5d,"setFrame:",objj_msgSend(_5d,"frameRectForContentRect:",_60));
objj_msgSend(_5b,"setAutoresizesSubviews:",YES);
}
objj_msgSend(_5b,"tile");
}
}),new objj_method(sel_getUid("noteKeyWindowStateChanged"),function(_61,_62){
with(_61){
if(objj_msgSend(objj_msgSend(_61,"window"),"isKeyWindow")){
objj_msgSend(_61,"setThemeState:",CPThemeStateKeyWindow);
}else{
objj_msgSend(_61,"unsetThemeState:",CPThemeStateKeyWindow);
}
}
}),new objj_method(sel_getUid("noteMainWindowStateChanged"),function(_63,_64){
with(_63){
if(objj_msgSend(objj_msgSend(_63,"window"),"isMainWindow")){
objj_msgSend(_63,"setThemeState:",CPThemeStateMainWindow);
}else{
objj_msgSend(_63,"unsetThemeState:",CPThemeStateMainWindow);
}
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_65,_66,_67){
with(_65){
if(!_resizeIndicator||_67===_resizeIndicator){
return;
}
objj_msgSend(_65,"addSubview:",_resizeIndicator);
}
}),new objj_method(sel_getUid("_enableSheet:"),function(_68,_69,_6a){
with(_68){
if(_6a){
var _6b=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_sheetShadowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:(objj_msgSend(_68,"bounds").size.width),height:8}});
objj_msgSend(_sheetShadowView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_sheetShadowView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6b,"pathForResource:","CPWindow/CPWindowAttachedSheetShadow.png"),{width:9,height:8})));
objj_msgSend(_68,"addSubview:",_sheetShadowView);
}else{
objj_msgSend(_sheetShadowView,"removeFromSuperview");
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_6c,_6d){
with(_6c){
if(_6c!==objj_msgSend(_CPWindowView,"class")){
return;
}
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class")),"pathForResource:","_CPWindowView/_CPWindowViewResizeIndicator.png"),CGSizeMake(12,12));
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_6e,_6f,_70){
with(_6e){
return CGRectMakeCopy(_70);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_71,_72,_73){
with(_71){
return CGRectMakeCopy(_73);
}
}),new objj_method(sel_getUid("defaultThemeClass"),function(_74,_75){
with(_74){
return "window";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_76,_77){
with(_76){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPFont,"systemFontOfSize:",CPFontCurrentSystemSize),objj_msgSend(CPNull,"null"),{width:0,height:0},CPCenterTextAlignment,CPLineBreakByTruncatingTail,CPTopVerticalTextAlignment],["title-text-color","title-font","title-text-shadow-color","title-text-shadow-offset","title-alignment","title-line-break-mode","title-vertical-alignment"]);
}
})]);
