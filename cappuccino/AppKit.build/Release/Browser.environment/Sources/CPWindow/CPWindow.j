@STATIC;1.0;I;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;18;CPPlatformWindow.ji;13;CPResponder.ji;10;CPScreen.ji;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;23;_CPDocModalWindowView.ji;22;_CPToolTipWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;23;_CPAttachedWindowView.ji;14;CPDragServer.ji;8;CPView.jt;69330;
objj_executeFile("Foundation/CPCountedSet.j",NO);
objj_executeFile("Foundation/CPNotificationCenter.j",NO);
objj_executeFile("Foundation/CPUndoManager.j",NO);
objj_executeFile("CGGeometry.j",YES);
objj_executeFile("CPAnimation.j",YES);
objj_executeFile("CPPlatformWindow.j",YES);
objj_executeFile("CPResponder.j",YES);
objj_executeFile("CPScreen.j",YES);
CPBorderlessWindowMask=0;
CPTitledWindowMask=1<<0;
CPClosableWindowMask=1<<1;
CPMiniaturizableWindowMask=1<<2;
CPResizableWindowMask=1<<3;
CPTexturedBackgroundWindowMask=1<<8;
CPBorderlessBridgeWindowMask=1<<20;
CPHUDBackgroundWindowMask=1<<21;
CPWindowNotSizable=0;
CPWindowMinXMargin=1;
CPWindowWidthSizable=2;
CPWindowMaxXMargin=4;
CPWindowMinYMargin=8;
CPWindowHeightSizable=16;
CPWindowMaxYMargin=32;
CPBackgroundWindowLevel=-1;
CPNormalWindowLevel=0;
CPFloatingWindowLevel=3;
CPSubmenuWindowLevel=3;
CPTornOffMenuWindowLevel=3;
CPMainMenuWindowLevel=24;
CPStatusWindowLevel=25;
CPModalPanelWindowLevel=8;
CPPopUpMenuWindowLevel=101;
CPDraggingWindowLevel=500;
CPScreenSaverWindowLevel=1000;
CPWindowOut=0;
CPWindowAbove=1;
CPWindowBelow=2;
CPWindowWillCloseNotification="CPWindowWillCloseNotification";
CPWindowDidBecomeMainNotification="CPWindowDidBecomeMainNotification";
CPWindowDidResignMainNotification="CPWindowDidResignMainNotification";
CPWindowDidBecomeKeyNotification="CPWindowDidBecomeKeyNotification";
CPWindowDidResignKeyNotification="CPWindowDidResignKeyNotification";
CPWindowDidResizeNotification="CPWindowDidResizeNotification";
CPWindowDidMoveNotification="CPWindowDidMoveNotification";
CPWindowWillBeginSheetNotification="CPWindowWillBeginSheetNotification";
CPWindowDidEndSheetNotification="CPWindowDidEndSheetNotification";
CPWindowDidMiniaturizeNotification="CPWindowDidMiniaturizeNotification";
CPWindowWillMiniaturizeNotification="CPWindowWillMiniaturizeNotification";
CPWindowDidDeminiaturizeNotification="CPWindowDidDeminiaturizeNotification";
_CPWindowDidChangeFirstResponderNotification="_CPWindowDidChangeFirstResponderNotification";
CPWindowShadowStyleStandard=0;
CPWindowShadowStyleMenu=1;
CPWindowShadowStylePanel=2;
var _1=20,_2=19,_3=10,_4=10,_5=5,_6=nil;
var _7=nil,_8=nil,_9=0.2;
var _a=[CPLeftArrowFunctionKey,CPRightArrowFunctionKey,CPUpArrowFunctionKey,CPDownArrowFunctionKey,CPPageUpFunctionKey,CPPageDownFunctionKey,CPHomeFunctionKey,CPEndFunctionKey,CPEscapeFunctionKey];
var _b=objj_allocateClassPair(CPResponder,"CPWindow"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_platformWindow"),new objj_ivar("_windowNumber"),new objj_ivar("_styleMask"),new objj_ivar("_frame"),new objj_ivar("_level"),new objj_ivar("_isVisible"),new objj_ivar("_isMiniaturized"),new objj_ivar("_isAnimating"),new objj_ivar("_hasShadow"),new objj_ivar("_isMovableByWindowBackground"),new objj_ivar("_isMovable"),new objj_ivar("_shadowStyle"),new objj_ivar("_showsResizeIndicator"),new objj_ivar("_isDocumentEdited"),new objj_ivar("_isDocumentSaving"),new objj_ivar("_shadowView"),new objj_ivar("_windowView"),new objj_ivar("_contentView"),new objj_ivar("_toolbarView"),new objj_ivar("_mouseEnteredStack"),new objj_ivar("_leftMouseDownView"),new objj_ivar("_rightMouseDownView"),new objj_ivar("_toolbar"),new objj_ivar("_firstResponder"),new objj_ivar("_initialFirstResponder"),new objj_ivar("_delegate"),new objj_ivar("_title"),new objj_ivar("_acceptsMouseMovedEvents"),new objj_ivar("_ignoresMouseEvents"),new objj_ivar("_windowController"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_undoManager"),new objj_ivar("_representedURL"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_inclusiveRegisteredDraggedTypes"),new objj_ivar("_defaultButton"),new objj_ivar("_defaultButtonEnabled"),new objj_ivar("_autorecalculatesKeyViewLoop"),new objj_ivar("_keyViewLoopIsDirty"),new objj_ivar("_sharesChromeWithPlatformWindow"),new objj_ivar("_DOMElement"),new objj_ivar("_autoresizingMask"),new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"),new objj_ivar("_isFullPlatformWindow"),new objj_ivar("_fullPlatformWindowSession"),new objj_ivar("_sheetContext"),new objj_ivar("_parentView"),new objj_ivar("_isSheet"),new objj_ivar("_frameAnimation")]);
objj_registerClassPair(_b);
class_addMethods(_b,[new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"initWithContentRect:styleMask:",{origin:{x:0,y:0},size:{width:0,height:0}},CPTitledWindowMask);
}
}),new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_f,_10,_11,_12){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPWindow").super_class},"init");
if(_f){
var _13=objj_msgSend(objj_msgSend(_f,"class"),"_windowViewClassForStyleMask:",_12);
_frame=objj_msgSend(_13,"frameRectForContentRect:",_11);
objj_msgSend(_f,"_setSharesChromeWithPlatformWindow:",!objj_msgSend(CPPlatform,"isBrowser"));
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_f,"setPlatformWindow:",objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"));
}else{
if((_12&CPBorderlessBridgeWindowMask)&&_11.size.width===0&&_11.size.height===0){
var _14=objj_msgSend(objj_msgSend(objj_msgSend(CPScreen,"alloc"),"init"),"visibleFrame");
_frame.size.height=MIN(768,_14.size.height);
_frame.size.width=MIN(1024,_14.size.width);
_frame.origin.x=(_14.size.width-_frame.size.width)/2;
_frame.origin.y=(_14.size.height-_frame.size.height)/2;
}
objj_msgSend(_f,"setPlatformWindow:",objj_msgSend(objj_msgSend(CPPlatformWindow,"alloc"),"initWithContentRect:",_frame));
objj_msgSend(_f,"platformWindow")._only=_f;
}
_isFullPlatformWindow=NO;
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_acceptsMouseMovedEvents=YES;
_isMovable=YES;
_isSheet=NO;
_sheetContext=nil;
_parentView=nil;
_windowNumber=objj_msgSend(CPApp._windows,"count");
CPApp._windows[_windowNumber]=_f;
_styleMask=_12;
objj_msgSend(_f,"setLevel:",CPNormalWindowLevel);
_minSize=CGSizeMake(0,0);
_maxSize=CGSizeMake(1000000,1000000);
_windowView=objj_msgSend(objj_msgSend(_13,"alloc"),"initWithFrame:styleMask:",CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame)),_12);
objj_msgSend(_windowView,"_setWindow:",_f);
objj_msgSend(_windowView,"setNextResponder:",_f);
objj_msgSend(_f,"setMovableByWindowBackground:",_12&CPHUDBackgroundWindowMask);
objj_msgSend(_f,"setContentView:",objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero()));
objj_msgSend(_f,"setInitialFirstResponder:",objj_msgSend(_f,"contentView"));
_firstResponder=_f;
_DOMElement=document.createElement("div");
_DOMElement.style.position="absolute";
_DOMElement.style.visibility="visible";
_DOMElement.style.zIndex=0;
if(!objj_msgSend(_f,"_sharesChromeWithPlatformWindow")){
if(NULL){
var _15={x:CGPointMake((_frame.origin.x),(_frame.origin.y)).x*NULL.a+CGPointMake((_frame.origin.x),(_frame.origin.y)).y*NULL.c+NULL.tx,y:CGPointMake((_frame.origin.x),(_frame.origin.y)).x*NULL.b+CGPointMake((_frame.origin.x),(_frame.origin.y)).y*NULL.d+NULL.ty};
}else{
var _15={x:(_frame.origin.x),y:(_frame.origin.y)};
}
_DOMElement.style.left=ROUND(_15.x)+"px";
_DOMElement.style.top=ROUND(_15.y)+"px";
}
_DOMElement.style.width=MAX(0,ROUND(1))+"px";
_DOMElement.style.height=MAX(0,ROUND(1))+"px";
_DOMElement.appendChild(_windowView._DOMElement);
objj_msgSend(_f,"setNextResponder:",CPApp);
objj_msgSend(_f,"setHasShadow:",_12!==CPBorderlessWindowMask);
if(_12&CPBorderlessBridgeWindowMask){
objj_msgSend(_f,"setFullPlatformWindow:",YES);
}
_autorecalculatesKeyViewLoop=NO;
_defaultButtonEnabled=YES;
_keyViewLoopIsDirty=YES;
objj_msgSend(_f,"setShowsResizeIndicator:",_styleMask&CPResizableWindowMask);
}
return _f;
}
}),new objj_method(sel_getUid("platformWindow"),function(_16,_17){
with(_16){
return _platformWindow;
}
}),new objj_method(sel_getUid("setPlatformWindow:"),function(_18,_19,_1a){
with(_18){
var _1b=objj_msgSend(_18,"isVisible");
if(_1b){
objj_msgSend(_18,"close");
}
_platformWindow=_1a;
objj_msgSend(_platformWindow,"_setTitle:window:",_title,_18);
if(_1b){
objj_msgSend(_18,"orderFront:",_18);
}
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_1c,_1d){
with(_1c){
_keyViewLoopIsDirty=!objj_msgSend(_1c,"_hasKeyViewLoop");
if(_keyViewLoopIsDirty&&!objj_msgSend(_1c,"autorecalculatesKeyViewLoop")){
objj_msgSend(_1c,"recalculateKeyViewLoop");
}
}
}),new objj_method(sel_getUid("_setWindowView:"),function(_1e,_1f,_20){
with(_1e){
if(_windowView===_20){
return;
}
var _21=_windowView;
_windowView=_20;
if(_21){
objj_msgSend(_21,"_setWindow:",nil);
objj_msgSend(_21,"noteToolbarChanged");
_DOMElement.removeChild(_21._DOMElement);
}
if(_windowView){
_DOMElement.appendChild(_windowView._DOMElement);
var _22=objj_msgSend(_contentView,"convertRect:toView:",objj_msgSend(_contentView,"bounds"),nil);
_22.origin=objj_msgSend(_1e,"convertBaseToGlobal:",_22.origin);
objj_msgSend(_windowView,"_setWindow:",_1e);
objj_msgSend(_windowView,"setNextResponder:",_1e);
objj_msgSend(_windowView,"addSubview:",_contentView);
objj_msgSend(_windowView,"setTitle:",_title);
objj_msgSend(_windowView,"noteToolbarChanged");
objj_msgSend(_windowView,"setShowsResizeIndicator:",objj_msgSend(_1e,"showsResizeIndicator"));
objj_msgSend(_1e,"setFrame:",objj_msgSend(_1e,"frameRectForContentRect:",_22));
}
}
}),new objj_method(sel_getUid("setFullPlatformWindow:"),function(_23,_24,_25){
with(_23){
if(!objj_msgSend(_platformWindow,"supportsFullPlatformWindows")){
return;
}
_25=!!_25;
if(_isFullPlatformWindow===_25){
return;
}
_isFullPlatformWindow=_25;
if(_isFullPlatformWindow){
_fullPlatformWindowSession=_CPWindowFullPlatformWindowSessionMake(_windowView,objj_msgSend(_23,"contentRectForFrameRect:",objj_msgSend(_23,"frame")),objj_msgSend(_23,"hasShadow"),objj_msgSend(_23,"level"));
var _26=objj_msgSend(objj_msgSend(_23,"class"),"_windowViewClassForFullPlatformWindowStyleMask:",_styleMask),_27=objj_msgSend(objj_msgSend(_26,"alloc"),"initWithFrame:styleMask:",CGRectMakeZero(),_styleMask);
objj_msgSend(_23,"_setWindowView:",_27);
objj_msgSend(_23,"setLevel:",CPBackgroundWindowLevel);
objj_msgSend(_23,"setHasShadow:",NO);
objj_msgSend(_23,"setAutoresizingMask:",CPWindowWidthSizable|CPWindowHeightSizable);
objj_msgSend(_23,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}else{
var _27=_fullPlatformWindowSession.windowView;
objj_msgSend(_23,"_setWindowView:",_27);
objj_msgSend(_23,"setLevel:",_fullPlatformWindowSession.level);
objj_msgSend(_23,"setHasShadow:",_fullPlatformWindowSession.hasShadow);
objj_msgSend(_23,"setAutoresizingMask:",CPWindowNotSizable);
objj_msgSend(_23,"setFrame:",objj_msgSend(_27,"frameRectForContentRect:",_fullPlatformWindowSession.contentRect));
}
}
}),new objj_method(sel_getUid("isFullPlatformWindow"),function(_28,_29){
with(_28){
return _isFullPlatformWindow;
}
}),new objj_method(sel_getUid("styleMask"),function(_2a,_2b){
with(_2a){
return _styleMask;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_2c,_2d,_2e){
with(_2c){
return objj_msgSend(_windowView,"contentRectForFrameRect:",_2e);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_2f,_30,_31){
with(_2f){
return objj_msgSend(_windowView,"frameRectForContentRect:",_31);
}
}),new objj_method(sel_getUid("frame"),function(_32,_33){
with(_32){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("_setClippedFrame:display:animate:"),function(_34,_35,_36,_37,_38){
with(_34){
_36.size.width=MIN(MAX(_36.size.width,_minSize.width),_maxSize.width);
_36.size.height=MIN(MAX(_36.size.height,_minSize.height),_maxSize.height);
objj_msgSend(_34,"setFrame:display:animate:",_36,_37,_38);
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(_39,_3a,_3b,_3c,_3d){
with(_39){
_3b={origin:{x:_3b.origin.x,y:_3b.origin.y},size:{width:_3b.size.width,height:_3b.size.height}};
var _3e=_3b.origin.x,_3f=_3e-FLOOR(_3e);
if(_3f){
_3b.origin.x=_3e>0.879?CEIL(_3e):FLOOR(_3e);
}
_3e=_3b.origin.y;
_3f=_3e-FLOOR(_3e);
if(_3f){
_3b.origin.y=_3e>0.879?CEIL(_3e):FLOOR(_3e);
}
_3e=_3b.size.width;
_3f=_3e-FLOOR(_3e);
if(_3f){
_3b.size.width=_3e>0.15?CEIL(_3e):FLOOR(_3e);
}
_3e=_3b.size.height;
_3f=_3e-FLOOR(_3e);
if(_3f){
_3b.size.height=_3e>0.15?CEIL(_3e):FLOOR(_3e);
}
if(_3d){
objj_msgSend(_frameAnimation,"stopAnimation");
_frameAnimation=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",_39,_3b);
objj_msgSend(_frameAnimation,"startAnimation");
}else{
var _40=_frame.origin,_41=_3b.origin;
if(!(_40.x==_41.x&&_40.y==_41.y)){
_40.x=_41.x;
_40.y=_41.y;
if(!objj_msgSend(_39,"_sharesChromeWithPlatformWindow")){
if(NULL){
var _42={x:CGPointMake(_40.x,_40.y).x*NULL.a+CGPointMake(_40.x,_40.y).y*NULL.c+NULL.tx,y:CGPointMake(_40.x,_40.y).x*NULL.b+CGPointMake(_40.x,_40.y).y*NULL.d+NULL.ty};
}else{
var _42={x:_40.x,y:_40.y};
}
_DOMElement.style.left=ROUND(_42.x)+"px";
_DOMElement.style.top=ROUND(_42.y)+"px";
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMoveNotification,_39);
}
var _43=_frame.size,_44=_3b.size;
if(!(_43.width==_44.width&&_43.height==_44.height)){
_43.width=_44.width;
_43.height=_44.height;
objj_msgSend(_windowView,"setFrameSize:",_43);
if(_hasShadow){
var _45={width:_43.width,height:_43.height};
if(_43.width>=(_1+_2)){
_45.width+=_1+_2;
}
if(_43.height>=(_4+_3+_5)){
_45.height+=_4+_3+_5;
}
objj_msgSend(_shadowView,"setFrameSize:",_45);
}
if(!_isAnimating){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidResizeNotification,_39);
}
}
if(objj_msgSend(_39,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setContentRect:",_frame);
}
}
}
}),new objj_method(sel_getUid("setFrame:display:"),function(_46,_47,_48,_49){
with(_46){
objj_msgSend(_46,"_setClippedFrame:display:animate:",_48,_49,NO);
}
}),new objj_method(sel_getUid("setFrame:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSend(_4a,"_setClippedFrame:display:animate:",_4c,YES,NO);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4d,"_setClippedFrame:display:animate:",{origin:{x:_4f.x,y:_4f.y},size:{width:(_frame.size.width),height:(_frame.size.height)}},YES,NO);
if(objj_msgSend(_4d,"attachedSheet")){
objj_msgSend(_4d,"_setAttachedSheetFrameOrigin");
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_50,_51,_52){
with(_50){
objj_msgSend(_50,"_setClippedFrame:display:animate:",{origin:{x:(_frame.origin.x),y:(_frame.origin.y)},size:{width:_52.width,height:_52.height}},YES,NO);
}
}),new objj_method(sel_getUid("orderFront:"),function(_53,_54,_55){
with(_53){
if(objj_msgSend(_53,"isSheet")){
objj_msgSend(_parentView,"orderFront:",_53);
}
objj_msgSend(_platformWindow,"orderFront:",_53);
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_53,nil);
if(!CPApp._keyWindow){
objj_msgSend(_53,"makeKeyWindow");
}
if(objj_msgSend(_53,"isKeyWindow")&&(_firstResponder===_53||!_firstResponder)){
objj_msgSend(_53,"makeFirstResponder:",_initialFirstResponder);
}
if(!CPApp._mainWindow){
objj_msgSend(_53,"makeMainWindow");
}
}
}),new objj_method(sel_getUid("orderBack:"),function(_56,_57,_58){
with(_56){
}
}),new objj_method(sel_getUid("orderOut:"),function(_59,_5a,_5b){
with(_59){
if(objj_msgSend(_59,"isSheet")){
objj_msgSend(_59._parentView,"_detachSheetWindow");
return;
}
if(objj_msgSend(_59,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"orderOut:",_59);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillClose:"))){
objj_msgSend(_delegate,"windowWillClose:",_59);
}
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowOut,_59,nil);
objj_msgSend(_59,"_updateMainAndKeyWindows");
}
}),new objj_method(sel_getUid("orderWindow:relativeTo:"),function(_5c,_5d,_5e,_5f){
with(_5c){
objj_msgSend(_platformWindow,"order:window:relativeTo:",_5e,_5c,CPApp._windows[_5f]);
}
}),new objj_method(sel_getUid("setLevel:"),function(_60,_61,_62){
with(_60){
if(_62===_level){
return;
}
objj_msgSend(_platformWindow,"moveWindow:fromLevel:toLevel:",_60,_level,_62);
_level=_62;
if(objj_msgSend(_60,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setLevel:",_62);
}
}
}),new objj_method(sel_getUid("level"),function(_63,_64){
with(_63){
return _level;
}
}),new objj_method(sel_getUid("isVisible"),function(_65,_66){
with(_65){
return _isVisible;
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_67,_68){
with(_67){
return _showsResizeIndicator;
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_69,_6a,_6b){
with(_69){
_6b=!!_6b;
if(_showsResizeIndicator===_6b){
return;
}
_showsResizeIndicator=_6b;
objj_msgSend(_windowView,"setShowsResizeIndicator:",objj_msgSend(_69,"showsResizeIndicator"));
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_6c,_6d){
with(_6c){
return objj_msgSend(_windowView,"resizeIndicatorOffset");
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_6e,_6f,_70){
with(_6e){
objj_msgSend(_windowView,"setResizeIndicatorOffset:",_70);
}
}),new objj_method(sel_getUid("setContentView:"),function(_71,_72,_73){
with(_71){
if(_contentView){
objj_msgSend(_contentView,"removeFromSuperview");
}
var _74=CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame));
if(_initialFirstResponder===_contentView){
objj_msgSend(_71,"setInitialFirstResponder:",_73);
}
_contentView=_73;
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_71,"contentRectForFrameRect:",_74));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_windowView,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_75,_76){
with(_75){
return _contentView;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_77,_78,_79){
with(_77){
objj_msgSend(_windowView,"setAlphaValue:",_79);
}
}),new objj_method(sel_getUid("alphaValue"),function(_7a,_7b){
with(_7a){
return objj_msgSend(_windowView,"alphaValue");
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_7c,_7d,_7e){
with(_7c){
objj_msgSend(_windowView,"setBackgroundColor:",_7e);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_7f,_80){
with(_7f){
return objj_msgSend(_windowView,"backgroundColor");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_81,_82,_83){
with(_81){
if(CGSizeEqualToSize(_minSize,_83)){
return;
}
_minSize=CGSizeCreateCopy(_83);
var _84=CGSizeMakeCopy(objj_msgSend(_81,"frame").size),_85=NO;
if(_84.width<_minSize.width){
_84.width=_minSize.width;
_85=YES;
}
if(_84.height<_minSize.height){
_84.height=_minSize.height;
_85=YES;
}
if(_85){
objj_msgSend(_81,"setFrameSize:",_84);
}
}
}),new objj_method(sel_getUid("minSize"),function(_86,_87){
with(_86){
return _minSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_88,_89,_8a){
with(_88){
if(CGSizeEqualToSize(_maxSize,_8a)){
return;
}
_maxSize=CGSizeCreateCopy(_8a);
var _8b=CGSizeMakeCopy(objj_msgSend(_88,"frame").size),_8c=NO;
if(_8b.width>_maxSize.width){
_8b.width=_maxSize.width;
_8c=YES;
}
if(_8b.height>_maxSize.height){
_8b.height=_maxSize.height;
_8c=YES;
}
if(_8c){
objj_msgSend(_88,"setFrameSize:",_8b);
}
}
}),new objj_method(sel_getUid("maxSize"),function(_8d,_8e){
with(_8d){
return _maxSize;
}
}),new objj_method(sel_getUid("hasShadow"),function(_8f,_90){
with(_8f){
return _hasShadow;
}
}),new objj_method(sel_getUid("_updateShadow"),function(_91,_92){
with(_91){
if(objj_msgSend(_91,"_sharesChromeWithPlatformWindow")){
if(_shadowView){
_DOMElement.removeChild(_shadowView._DOMElement);
_shadowView=nil;
}
objj_msgSend(_platformWindow,"setHasShadow:",_hasShadow);
return;
}
if(_hasShadow&&!_shadowView){
var _93=objj_msgSend(_windowView,"bounds");
_shadowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(-_1,-_3+_5,_1+CGRectGetWidth(_93)+_2,_3+CGRectGetHeight(_93)+_4));
if(!_6){
var _94=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_6=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","CPWindow/CPWindowShadow0.png"),CGSizeMake(20,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","CPWindow/CPWindowShadow1.png"),CGSizeMake(1,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","CPWindow/CPWindowShadow2.png"),CGSizeMake(19,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","CPWindow/CPWindowShadow3.png"),CGSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","CPWindow/CPWindowShadow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","CPWindow/CPWindowShadow5.png"),CGSizeMake(19,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","CPWindow/CPWindowShadow6.png"),CGSizeMake(20,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","CPWindow/CPWindowShadow7.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","CPWindow/CPWindowShadow8.png"),CGSizeMake(19,18))]));
}
objj_msgSend(_shadowView,"setBackgroundColor:",_6);
objj_msgSend(_shadowView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_DOMElement.insertBefore(_shadowView._DOMElement,_windowView._DOMElement);
}else{
if(!_hasShadow&&_shadowView){
_DOMElement.removeChild(_shadowView._DOMElement);
_shadowView=nil;
}
}
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_95,_96,_97){
with(_95){
if(_hasShadow===_97){
return;
}
_hasShadow=_97;
objj_msgSend(_95,"_updateShadow");
}
}),new objj_method(sel_getUid("setShadowStyle:"),function(_98,_99,_9a){
with(_98){
_shadowStyle=_9a;
objj_msgSend(objj_msgSend(_98,"platformWindow"),"setShadowStyle:",_shadowStyle);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_9b,_9c,_9d){
with(_9b){
var _9e=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_9e,"removeObserver:name:object:",_delegate,CPWindowDidResignKeyNotification,_9b);
objj_msgSend(_9e,"removeObserver:name:object:",_delegate,CPWindowDidBecomeKeyNotification,_9b);
objj_msgSend(_9e,"removeObserver:name:object:",_delegate,CPWindowDidBecomeMainNotification,_9b);
objj_msgSend(_9e,"removeObserver:name:object:",_delegate,CPWindowDidResignMainNotification,_9b);
objj_msgSend(_9e,"removeObserver:name:object:",_delegate,CPWindowDidMoveNotification,_9b);
objj_msgSend(_9e,"removeObserver:name:object:",_delegate,CPWindowDidResizeNotification,_9b);
objj_msgSend(_9e,"removeObserver:name:object:",_delegate,CPWindowWillBeginSheetNotification,_9b);
objj_msgSend(_9e,"removeObserver:name:object:",_delegate,CPWindowDidEndSheetNotification,_9b);
_delegate=_9d;
_delegateRespondsToWindowWillReturnUndoManagerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillReturnUndoManager:"));
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignKey:"))){
objj_msgSend(_9e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignKey:"),CPWindowDidResignKeyNotification,_9b);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeKey:"))){
objj_msgSend(_9e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeKey:"),CPWindowDidBecomeKeyNotification,_9b);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeMain:"))){
objj_msgSend(_9e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeMain:"),CPWindowDidBecomeMainNotification,_9b);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignMain:"))){
objj_msgSend(_9e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignMain:"),CPWindowDidResignMainNotification,_9b);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidMove:"))){
objj_msgSend(_9e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidMove:"),CPWindowDidMoveNotification,_9b);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResize:"))){
objj_msgSend(_9e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResize:"),CPWindowDidResizeNotification,_9b);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillBeginSheet:"))){
objj_msgSend(_9e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowWillBeginSheet:"),CPWindowWillBeginSheetNotification,_9b);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidEndSheet:"))){
objj_msgSend(_9e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidEndSheet:"),CPWindowDidEndSheetNotification,_9b);
}
}
}),new objj_method(sel_getUid("delegate"),function(_9f,_a0){
with(_9f){
return _delegate;
}
}),new objj_method(sel_getUid("setWindowController:"),function(_a1,_a2,_a3){
with(_a1){
_windowController=_a3;
}
}),new objj_method(sel_getUid("windowController"),function(_a4,_a5){
with(_a4){
return _windowController;
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_a6,_a7,_a8){
with(_a6){
if(objj_msgSend(_delegate,"respondsToSelector:",_a8)){
objj_msgSend(_delegate,"performSelector:",_a8);
}else{
objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("CPWindow").super_class},"doCommandBySelector:",_a8);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_a9,_aa){
with(_a9){
return NO;
}
}),new objj_method(sel_getUid("initialFirstResponder"),function(_ab,_ac){
with(_ab){
return _initialFirstResponder;
}
}),new objj_method(sel_getUid("setInitialFirstResponder:"),function(_ad,_ae,_af){
with(_ad){
objj_msgSend(_ad,"_setupFirstResponder:",_af);
_initialFirstResponder=_af;
}
}),new objj_method(sel_getUid("_setupFirstResponder:"),function(_b0,_b1,_b2){
with(_b0){
if(_keyViewLoopIsDirty&&!_autorecalculatesKeyViewLoop&&_firstResponder===_b0&&_initialFirstResponder===objj_msgSend(_b0,"contentView")){
objj_msgSend(_b0,"recalculateKeyViewLoop");
if(_b2){
objj_msgSend(_b0,"makeFirstResponder:",_b2);
}else{
var _b3=objj_msgSend(objj_msgSend(_b0,"contentView"),"nextValidKeyView");
objj_msgSend(_b0,"makeFirstResponder:",_b3);
}
}
}
}),new objj_method(sel_getUid("makeFirstResponder:"),function(_b4,_b5,_b6){
with(_b4){
if(_firstResponder===_b6){
return YES;
}
if(!objj_msgSend(_firstResponder,"resignFirstResponder")){
return NO;
}
if(!_b6||!objj_msgSend(_b6,"acceptsFirstResponder")||!objj_msgSend(_b6,"becomeFirstResponder")){
_firstResponder=_b4;
return NO;
}
_firstResponder=_b6;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_CPWindowDidChangeFirstResponderNotification,_b4);
return YES;
}
}),new objj_method(sel_getUid("firstResponder"),function(_b7,_b8){
with(_b7){
return _firstResponder;
}
}),new objj_method(sel_getUid("acceptsMouseMovedEvents"),function(_b9,_ba){
with(_b9){
return _acceptsMouseMovedEvents;
}
}),new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"),function(_bb,_bc,_bd){
with(_bb){
_acceptsMouseMovedEvents=_bd;
}
}),new objj_method(sel_getUid("ignoresMouseEvents"),function(_be,_bf){
with(_be){
return _ignoresMouseEvents;
}
}),new objj_method(sel_getUid("setIgnoresMouseEvents:"),function(_c0,_c1,_c2){
with(_c0){
_ignoresMouseEvents=_c2;
}
}),new objj_method(sel_getUid("title"),function(_c3,_c4){
with(_c3){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_c5,_c6,_c7){
with(_c5){
_title=_c7;
objj_msgSend(_windowView,"setTitle:",_c7);
objj_msgSend(_platformWindow,"_setTitle:window:",_title,_c5);
objj_msgSend(_c5,"_synchronizeMenuBarTitleWithWindowTitle");
}
}),new objj_method(sel_getUid("setTitleWithRepresentedFilename:"),function(_c8,_c9,_ca){
with(_c8){
objj_msgSend(_c8,"setRepresentedFilename:",_ca);
objj_msgSend(_c8,"setTitle:",objj_msgSend(_ca,"lastPathComponent"));
}
}),new objj_method(sel_getUid("setRepresentedFilename:"),function(_cb,_cc,_cd){
with(_cb){
objj_msgSend(_cb,"setRepresentedURL:",_cd);
}
}),new objj_method(sel_getUid("representedFilename"),function(_ce,_cf){
with(_ce){
return _representedURL;
}
}),new objj_method(sel_getUid("setRepresentedURL:"),function(_d0,_d1,_d2){
with(_d0){
_representedURL=_d2;
}
}),new objj_method(sel_getUid("representedURL"),function(_d3,_d4){
with(_d3){
return _representedURL;
}
}),new objj_method(sel_getUid("screen"),function(_d5,_d6){
with(_d5){
return objj_msgSend(objj_msgSend(CPScreen,"alloc"),"init");
}
}),new objj_method(sel_getUid("setMovableByWindowBackground:"),function(_d7,_d8,_d9){
with(_d7){
_isMovableByWindowBackground=_d9;
}
}),new objj_method(sel_getUid("isMovableByWindowBackground"),function(_da,_db){
with(_da){
return _isMovableByWindowBackground;
}
}),new objj_method(sel_getUid("setMovable:"),function(_dc,_dd,_de){
with(_dc){
_isMovable=_de;
}
}),new objj_method(sel_getUid("isMovable"),function(_df,_e0){
with(_df){
return _isMovable;
}
}),new objj_method(sel_getUid("center"),function(_e1,_e2){
with(_e1){
if(_isFullPlatformWindow){
return;
}
var _e3=objj_msgSend(_e1,"frame").size,_e4=objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(_platformWindow,"contentBounds").size:objj_msgSend(objj_msgSend(_e1,"screen"),"visibleFrame").size;
var _e5=CGPointMake((_e4.width-_e3.width)/2,(_e4.height-_e3.height)/2);
if(_e5.x<0){
_e5.x=0;
}
if(_e5.y<0){
_e5.y=0;
}
objj_msgSend(_e1,"setFrameOrigin:",_e5);
}
}),new objj_method(sel_getUid("sendEvent:"),function(_e6,_e7,_e8){
with(_e6){
var _e9=objj_msgSend(_e8,"type"),_ea=objj_msgSend(_e8,"locationInWindow");
var _eb=objj_msgSend(_e6,"attachedSheet");
if(_eb){
switch(_e9){
case CPLeftMouseDown:
objj_msgSend(_windowView,"mouseDown:",_e8);
objj_msgSend(_eb,"makeKeyAndOrderFront:",_e6);
break;
case CPMouseMoved:
objj_msgSend(_windowView,"mouseMoved:",_e8);
break;
}
return;
}
switch(_e9){
case CPFlagsChanged:
return objj_msgSend(objj_msgSend(_e6,"firstResponder"),"flagsChanged:",_e8);
case CPKeyUp:
return objj_msgSend(objj_msgSend(_e6,"firstResponder"),"keyUp:",_e8);
case CPKeyDown:
if(objj_msgSend(_e8,"charactersIgnoringModifiers")===CPTabCharacter){
if(objj_msgSend(_e8,"modifierFlags")&CPShiftKeyMask){
objj_msgSend(_e6,"selectPreviousKeyView:",_e6);
}else{
objj_msgSend(_e6,"selectNextKeyView:",_e6);
}
return;
}else{
if(objj_msgSend(_e8,"charactersIgnoringModifiers")===CPBackTabCharacter){
return objj_msgSend(_e6,"selectPreviousKeyView:",_e6);
}
}
objj_msgSend(objj_msgSend(_e6,"firstResponder"),"keyDown:",_e8);
if(!objj_msgSend(_e6,"disableKeyEquivalentForDefaultButton")){
var _ec=objj_msgSend(_e6,"defaultButton"),_ed=objj_msgSend(_ec,"keyEquivalent"),_ee=objj_msgSend(_ec,"keyEquivalentModifierMask");
if(objj_msgSend(_e8,"_triggersKeyEquivalent:withModifierMask:",_ed,_ee)){
objj_msgSend(objj_msgSend(_e6,"defaultButton"),"performClick:",_e6);
}
}
return;
case CPScrollWheel:
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_ea),"scrollWheel:",_e8);
case CPLeftMouseUp:
case CPRightMouseUp:
var _ef=_leftMouseDownView,_f0=_e9==CPRightMouseUp?sel_getUid("rightMouseUp:"):sel_getUid("mouseUp:");
if(!_ef){
_ef=objj_msgSend(_windowView,"hitTest:",_ea);
}
objj_msgSend(_ef,"performSelector:withObject:",_f0,_e8);
_leftMouseDownView=nil;
return;
case CPLeftMouseDown:
case CPRightMouseDown:
_leftMouseDownView=objj_msgSend(_windowView,"hitTest:",_ea);
if(_leftMouseDownView!=_firstResponder&&objj_msgSend(_leftMouseDownView,"acceptsFirstResponder")){
objj_msgSend(_e6,"makeFirstResponder:",_leftMouseDownView);
}
objj_msgSend(CPApp,"activateIgnoringOtherApps:",YES);
var _f1=objj_msgSend(_e8,"window"),_f0=_e9==CPRightMouseDown?sel_getUid("rightMouseDown:"):sel_getUid("mouseDown:");
if(objj_msgSend(_f1,"isKeyWindow")||objj_msgSend(_f1,"becomesKeyOnlyIfNeeded")&&!objj_msgSend(_leftMouseDownView,"needsPanelToBecomeKey")){
return objj_msgSend(_leftMouseDownView,"performSelector:withObject:",_f0,_e8);
}else{
objj_msgSend(_e6,"makeKeyAndOrderFront:",_e6);
if(objj_msgSend(_leftMouseDownView,"acceptsFirstMouse:",_e8)){
return objj_msgSend(_leftMouseDownView,"performSelector:withObject:",_f0,_e8);
}
}
break;
case CPLeftMouseDragged:
case CPRightMouseDragged:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_ea),"mouseDragged:",_e8);
}
var _f0;
if(_e9==CPRightMouseDragged){
_f0=sel_getUid("rightMouseDragged:");
if(!objj_msgSend(_leftMouseDownView,"respondsToSelector:",_f0)){
_f0=nil;
}
}
if(!_f0){
_f0=sel_getUid("mouseDragged:");
}
return objj_msgSend(_leftMouseDownView,"performSelector:withObject:",_f0,_e8);
case CPMouseMoved:
if(!_acceptsMouseMovedEvents){
return;
}
if(!_mouseEnteredStack){
_mouseEnteredStack=[];
}
var _f2=objj_msgSend(_windowView,"hitTest:",_ea);
if(objj_msgSend(_mouseEnteredStack,"count")&&objj_msgSend(_mouseEnteredStack,"lastObject")===_f2){
return objj_msgSend(_f2,"mouseMoved:",_e8);
}
var _f3=_f2,_f4=[];
while(_f3){
_f4.unshift(_f3);
_f3=objj_msgSend(_f3,"superview");
}
var _f5=MIN(_mouseEnteredStack.length,_f4.length);
while(_f5--){
if(_mouseEnteredStack[_f5]===_f4[_f5]){
break;
}
}
var _f6=_f5+1,_f7=_mouseEnteredStack.length;
if(_f6<_f7){
var _f8=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseExited,_ea,objj_msgSend(_e8,"modifierFlags"),objj_msgSend(_e8,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_f6<_f7;++_f6){
objj_msgSend(_mouseEnteredStack[_f6],"mouseExited:",_f8);
}
}
_f6=_f5+1;
_f7=_f4.length;
if(_f6<_f7){
var _f8=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseEntered,_ea,objj_msgSend(_e8,"modifierFlags"),objj_msgSend(_e8,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_f6<_f7;++_f6){
objj_msgSend(_f4[_f6],"mouseEntered:",_f8);
}
}
_mouseEnteredStack=_f4;
objj_msgSend(_f2,"mouseMoved:",_e8);
}
}
}),new objj_method(sel_getUid("windowNumber"),function(_f9,_fa){
with(_f9){
return _windowNumber;
}
}),new objj_method(sel_getUid("becomeKeyWindow"),function(_fb,_fc){
with(_fb){
CPApp._keyWindow=_fb;
if(_firstResponder!==_fb&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("becomeKeyWindow"))){
objj_msgSend(_firstResponder,"becomeKeyWindow");
}
objj_msgSend(_fb,"_setupFirstResponder:",nil);
objj_msgSend(_windowView,"noteKeyWindowStateChanged");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidBecomeKeyNotification,_fb);
}
}),new objj_method(sel_getUid("canBecomeKeyWindow"),function(_fd,_fe){
with(_fd){
return YES;
}
}),new objj_method(sel_getUid("isKeyWindow"),function(_ff,_100){
with(_ff){
return objj_msgSend(CPApp,"keyWindow")==_ff;
}
}),new objj_method(sel_getUid("makeKeyAndOrderFront:"),function(self,_101,_102){
with(self){
objj_msgSend(self,"orderFront:",self);
objj_msgSend(self,"makeKeyWindow");
objj_msgSend(self,"makeMainWindow");
}
}),new objj_method(sel_getUid("makeKeyWindow"),function(self,_103){
with(self){
if(objj_msgSend(CPApp,"keyWindow")===self||!objj_msgSend(self,"canBecomeKeyWindow")){
return;
}
objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"resignKeyWindow");
objj_msgSend(self,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("resignKeyWindow"),function(self,_104){
with(self){
if(_firstResponder!==self&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("resignKeyWindow"))){
objj_msgSend(_firstResponder,"resignKeyWindow");
}
if(CPApp._keyWindow===self){
CPApp._keyWindow=nil;
}
objj_msgSend(_windowView,"noteKeyWindowStateChanged");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidResignKeyNotification,self);
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(self,_105,_106,_107,_108,_109,_10a,_10b,_10c){
with(self){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:",_106,self,objj_msgSend(self,"convertBaseToGlobal:",_107),_108,_109,_10a,_10b,_10c);
}
}),new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"),function(self,_10d,_10e){
with(self){
if(!_10e){
return;
}
if(!_inclusiveRegisteredDraggedTypes){
_inclusiveRegisteredDraggedTypes=objj_msgSend(CPCountedSet,"set");
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"unionSet:",_10e);
}
}),new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"),function(self,_10f,_110){
with(self){
if(!_110){
return;
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"minusSet:",_110);
if(objj_msgSend(_inclusiveRegisteredDraggedTypes,"count")===0){
_inclusiveRegisteredDraggedTypes=nil;
}
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(self,_111,_112,_113,_114,_115,_116,_117,_118){
with(self){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_112,self,objj_msgSend(self,"convertBaseToGlobal:",_113),_114,_115,_116,_117,_118);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_119,_11a){
with(self){
if(!_11a){
return;
}
objj_msgSend(self,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_11a);
objj_msgSend(self,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(self,_11b){
with(self){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_11c){
with(self){
objj_msgSend(self,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(self,_11d,_11e){
with(self){
if(_isDocumentEdited==_11e){
return;
}
_isDocumentEdited=_11e;
objj_msgSend(CPMenu,"_setMenuBarIconImageAlphaValue:",_isDocumentEdited?0.5:1);
objj_msgSend(_windowView,"setDocumentEdited:",_11e);
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(self,_11f){
with(self){
return _isDocumentEdited;
}
}),new objj_method(sel_getUid("setDocumentSaving:"),function(self,_120,_121){
with(self){
if(_isDocumentSaving==_121){
return;
}
_isDocumentSaving=_121;
objj_msgSend(self,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"windowDidChangeDocumentSaving");
}
}),new objj_method(sel_getUid("isDocumentSaving"),function(self,_122){
with(self){
return _isDocumentSaving;
}
}),new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"),function(self,_123){
with(self){
if(!objj_msgSend(self,"isMainWindow")){
return;
}
var _124=objj_msgSend(CPApp,"mainMenu"),_125=objj_msgSend(_124,"indexOfItemWithTitle:",_isDocumentSaving?"Save":"Saving...");
if(_125==CPNotFound){
return;
}
var item=objj_msgSend(_124,"itemAtIndex:",_125);
if(_isDocumentSaving){
_7=objj_msgSend(item,"image");
objj_msgSend(item,"setTitle:","Saving...");
objj_msgSend(item,"setImage:",_8);
objj_msgSend(item,"setEnabled:",NO);
}else{
objj_msgSend(item,"setTitle:","Save");
objj_msgSend(item,"setImage:",_7);
objj_msgSend(item,"setEnabled:",YES);
}
}
}),new objj_method(sel_getUid("performMiniaturize:"),function(self,_126,_127){
with(self){
objj_msgSend(self,"miniaturize:",_127);
}
}),new objj_method(sel_getUid("miniaturize:"),function(self,_128,_129){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillMiniaturizeNotification,self);
objj_msgSend(objj_msgSend(self,"platformWindow"),"miniaturize:",_129);
objj_msgSend(self,"_updateMainAndKeyWindows");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMiniaturizeNotification,self);
_isMiniaturized=YES;
}
}),new objj_method(sel_getUid("deminiaturize:"),function(self,_12a,_12b){
with(self){
objj_msgSend(objj_msgSend(self,"platformWindow"),"deminiaturize:",_12b);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidDeminiaturizeNotification,self);
_isMiniaturized=NO;
}
}),new objj_method(sel_getUid("isMiniaturized"),function(self,_12c){
with(self){
return _isMiniaturized;
}
}),new objj_method(sel_getUid("performClose:"),function(self,_12d,_12e){
with(self){
if(!(_styleMask&CPClosableWindowMask)){
return;
}
if(objj_msgSend(self,"isFullBridge")){
var _12f=objj_msgSend(CPApp,"currentEvent");
if(objj_msgSend(_12f,"type")===CPKeyDown&&objj_msgSend(_12f,"characters")==="w"&&(objj_msgSend(_12f,"modifierFlags")&CPPlatformActionKeyMask)){
objj_msgSend(objj_msgSend(self,"platformWindow"),"_propagateCurrentDOMEvent:",YES);
return;
}
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowShouldClose:"))){
if(!objj_msgSend(_delegate,"windowShouldClose:",self)){
return;
}
}else{
if(objj_msgSend(self,"respondsToSelector:",sel_getUid("windowShouldClose:"))&&!objj_msgSend(self,"windowShouldClose:",self)){
return;
}
}
var _130=objj_msgSend(_windowController,"documents");
if(objj_msgSend(_130,"count")){
var _131=objj_msgSend(_130,"indexOfObject:",objj_msgSend(_windowController,"document"));
objj_msgSend(_130[_131],"shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:",_windowController,self,sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"),{documents:objj_msgSend(_130,"copy"),visited:0,index:_131});
}else{
objj_msgSend(self,"close");
}
}
}),new objj_method(sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"),function(self,_132,_133,_134,_135){
with(self){
if(_134){
var _136=objj_msgSend(self,"windowController"),_137=_135.documents,_138=objj_msgSend(_137,"count"),_139=++_135.visited,_13a=++_135.index%_138;
objj_msgSend(_133,"removeWindowController:",_136);
if(_139<_138){
objj_msgSend(_136,"setDocument:",_137[_13a]);
objj_msgSend(_137[_13a],"shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:",_windowController,self,sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"),_135);
}else{
objj_msgSend(self,"close");
}
}
}
}),new objj_method(sel_getUid("close"),function(self,_13b){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillCloseNotification,self);
objj_msgSend(self,"orderOut:",nil);
}
}),new objj_method(sel_getUid("isMainWindow"),function(self,_13c){
with(self){
return objj_msgSend(CPApp,"mainWindow")===self;
}
}),new objj_method(sel_getUid("canBecomeMainWindow"),function(self,_13d){
with(self){
if(objj_msgSend(self,"isVisible")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("makeMainWindow"),function(self,_13e){
with(self){
if(objj_msgSend(CPApp,"mainWindow")===self||!objj_msgSend(self,"canBecomeMainWindow")){
return;
}
objj_msgSend(objj_msgSend(CPApp,"mainWindow"),"resignMainWindow");
objj_msgSend(self,"becomeMainWindow");
}
}),new objj_method(sel_getUid("becomeMainWindow"),function(self,_13f){
with(self){
CPApp._mainWindow=self;
objj_msgSend(self,"_synchronizeMenuBarTitleWithWindowTitle");
objj_msgSend(self,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"noteMainWindowStateChanged");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidBecomeMainNotification,self);
}
}),new objj_method(sel_getUid("resignMainWindow"),function(self,_140){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidResignMainNotification,self);
if(CPApp._mainWindow===self){
CPApp._mainWindow=nil;
}
objj_msgSend(_windowView,"noteMainWindowStateChanged");
}
}),new objj_method(sel_getUid("_updateMainAndKeyWindows"),function(self,_141){
with(self){
var _142=objj_msgSend(CPApp,"orderedWindows"),_143=objj_msgSend(_142,"count");
if(objj_msgSend(self,"isKeyWindow")){
var _144=objj_msgSend(CPApp,"keyWindow");
objj_msgSend(self,"resignKeyWindow");
if(_144&&_144!==self&&objj_msgSend(_144,"canBecomeKeyWindow")){
objj_msgSend(_144,"makeKeyWindow");
}else{
var _145=objj_msgSend(CPApp,"mainMenu"),_146=objj_getClass("_CPMenuBarWindow"),_147;
for(var i=0;i<_143;i++){
var _148=_142[i];
if(objj_msgSend(_148,"isKindOfClass:",_146)){
_147=_148;
}
if(_148===self||_148===_147){
continue;
}
if(objj_msgSend(_148,"isVisible")&&objj_msgSend(_148,"canBecomeKeyWindow")){
objj_msgSend(_148,"makeKeyWindow");
break;
}
}
if(!objj_msgSend(CPApp,"keyWindow")){
objj_msgSend(_147,"makeKeyWindow");
}
}
}
if(objj_msgSend(self,"isMainWindow")){
var _149=objj_msgSend(CPApp,"mainWindow");
objj_msgSend(self,"resignMainWindow");
if(_149&&_149!==self&&objj_msgSend(_149,"canBecomeMainWindow")){
objj_msgSend(_149,"makeMainWindow");
}else{
var _145=objj_msgSend(CPApp,"mainMenu"),_146=objj_getClass("_CPMenuBarWindow"),_147;
for(var i=0;i<_143;i++){
var _148=_142[i];
if(objj_msgSend(_148,"isKindOfClass:",_146)){
_147=_148;
}
if(_148===self||_148===_147){
continue;
}
if(objj_msgSend(_148,"isVisible")&&objj_msgSend(_148,"canBecomeMainWindow")){
objj_msgSend(_148,"makeMainWindow");
break;
}
}
}
}
}
}),new objj_method(sel_getUid("toolbar"),function(self,_14a){
with(self){
return _toolbar;
}
}),new objj_method(sel_getUid("setToolbar:"),function(self,_14b,_14c){
with(self){
if(_toolbar===_14c){
return;
}
objj_msgSend(objj_msgSend(_14c,"_window"),"setToolbar:",nil);
objj_msgSend(_toolbar,"_setWindow:",nil);
_toolbar=_14c;
objj_msgSend(_toolbar,"_setWindow:",self);
objj_msgSend(self,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("toggleToolbarShown:"),function(self,_14d,_14e){
with(self){
var _14f=objj_msgSend(self,"toolbar");
objj_msgSend(_14f,"setVisible:",!objj_msgSend(_14f,"isVisible"));
}
}),new objj_method(sel_getUid("_noteToolbarChanged"),function(self,_150){
with(self){
var _151=CGRectMakeCopy(objj_msgSend(self,"frame")),_152;
objj_msgSend(_windowView,"noteToolbarChanged");
if(_isFullPlatformWindow){
_152=objj_msgSend(_platformWindow,"visibleFrame");
}else{
_152=CGRectMakeCopy(objj_msgSend(self,"frame"));
_152.origin=_151.origin;
}
objj_msgSend(self,"setFrame:",_152);
}
}),new objj_method(sel_getUid("_setFrame:delegate:duration:curve:"),function(self,_153,_154,_155,_156,_157){
with(self){
objj_msgSend(_frameAnimation,"stopAnimation");
_frameAnimation=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",self,_154);
objj_msgSend(_frameAnimation,"setDelegate:",_155);
objj_msgSend(_frameAnimation,"setAnimationCurve:",_157);
objj_msgSend(_frameAnimation,"setDuration:",_156);
objj_msgSend(_frameAnimation,"startAnimation");
}
}),new objj_method(sel_getUid("animationResizeTime:"),function(self,_158,_159){
with(self){
return _9;
}
}),new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"),function(self,_15a){
with(self){
var _15b=objj_msgSend(self,"attachedSheet");
var _15c=objj_msgSend(objj_msgSend(self,"contentView"),"frame"),_15d=CGRectMakeCopy(objj_msgSend(_15b,"frame"));
_15d.origin.y=CGRectGetMinY(_frame)+CGRectGetMinY(_15c);
_15d.origin.x=CGRectGetMinX(_frame)+FLOOR((CGRectGetWidth(_frame)-CGRectGetWidth(_15d))/2);
objj_msgSend(_15b,"setFrame:display:animate:",_15d,YES,NO);
}
}),new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"),function(self,_15e,_15f,_160,_161,_162){
with(self){
if(_sheetContext){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"The target window of beginSheet: already has a sheet, did you forget orderOut: ?");
return;
}
var _163=objj_msgSend(_15f,"frame");
_sheetContext={"sheet":_15f,"modalDelegate":_160,"endSelector":_161,"contextInfo":_162,"frame":{origin:{x:_163.origin.x,y:_163.origin.y},size:{width:_163.size.width,height:_163.size.height}},"returnCode":-1,"opened":NO};
objj_msgSend(self,"_attachSheetWindow");
}
}),new objj_method(sel_getUid("_attachSheetWindow"),function(self,_164){
with(self){
_sheetContext["isAttached"]=YES;
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,self,sel_getUid("_sheetShouldAnimateIn:"),nil,NO);
}
}),new objj_method(sel_getUid("_endSheet"),function(self,_165){
with(self){
var _166=_sheetContext["modalDelegate"],_167=_sheetContext["endSelector"];
if(_166&&_167){
if(_sheetContext["isAttached"]){
objj_msgSend(_166,_167,_sheetContext["sheet"],_sheetContext["returnCode"],_sheetContext["contextInfo"]);
}else{
_sheetContext["deferDidEndSelector"]=YES;
}
}
}
}),new objj_method(sel_getUid("_detachSheetWindow"),function(self,_168){
with(self){
_sheetContext["isAttached"]=NO;
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,self,sel_getUid("_sheetShouldAnimateOut:"),nil,NO);
}
}),new objj_method(sel_getUid("_cleanupSheetWindow"),function(self,_169){
with(self){
var _16a=_sheetContext["sheet"],_16b=_sheetContext["frame"],_16c=_sheetContext["deferDidEndSelector"];
objj_msgSend(_16a,"setFrame:",_16b);
objj_msgSend(self,"_restoreMasksForView:",objj_msgSend(_16a,"contentView"));
if(_16a._isModal){
objj_msgSend(CPApp,"stopModal");
}
objj_msgSend(_16a._windowView,"_enableSheet:",NO);
_16a._isSheet=NO;
objj_msgSend(_16a,"orderOut:",self);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidEndSheetNotification,self);
if(_16c){
var _16d=_sheetContext["modalDelegate"],_16e=_sheetContext["endSelector"],_16f=_sheetContext["returnCode"],_170=_sheetContext["contextInfo"];
_sheetContext=nil;
_16a._parentView=nil;
objj_msgSend(_16d,_16e,_16a,_16f,_170);
}else{
_sheetContext=nil;
_16a._parentView=nil;
}
}
}),new objj_method(sel_getUid("animationDidEnd:"),function(self,_171,anim){
with(self){
var _172=_sheetContext["sheet"];
if(anim._window!=_172){
return;
}
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,self,sel_getUid("_sheetAnimationDidEnd:"),nil,NO);
}
}),new objj_method(sel_getUid("_sheetShouldAnimateIn:"),function(self,_173,_174){
with(self){
if(_sheetContext["isOpening"]||_sheetContext["isClosing"]){
return;
}
var _175=_sheetContext["sheet"],_176=objj_msgSend(_175,"frame"),_177=objj_msgSend(self,"frame");
objj_msgSend(self,"_setUpMasksForView:",objj_msgSend(_175,"contentView"));
_175._isSheet=YES;
_175._parentView=self;
var _178=_177.origin.x+FLOOR((_177.size.width-_176.size.width)/2),_179=_177.origin.y+objj_msgSend(objj_msgSend(self,"contentView"),"frame").origin.y,_17a=CGRectMake(_178,_179,_176.size.width,0),_17b=CGRectMake(_178,_179,_176.size.width,_176.size.height);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillBeginSheetNotification,self);
_175._isModal=NO;
if(objj_msgSend(CPApp,"modalWindow")===self){
objj_msgSend(CPApp,"runModalForWindow:",_175);
_175._isModal=YES;
}
objj_msgSend(_175,"orderFront:",self);
objj_msgSend(_175,"setFrame:display:animate:",_17a,YES,NO);
_sheetContext["opened"]=YES;
_sheetContext["shouldClose"]=NO;
_sheetContext["isOpening"]=YES;
objj_msgSend(_175,"_setFrame:delegate:duration:curve:",_17b,self,objj_msgSend(self,"animationResizeTime:",_17b),CPAnimationEaseOut);
objj_msgSend(_175,"makeKeyWindow");
}
}),new objj_method(sel_getUid("_sheetShouldAnimateOut:"),function(self,_17c,_17d){
with(self){
var _17e=_sheetContext["sheet"],_17f=objj_msgSend(_17e,"frame"),_180=CGRectMakeCopy(_17f);
if(_sheetContext["isOpening"]){
_sheetContext["shouldClose"]=YES;
return;
}
if(_sheetContext["isClosing"]){
return;
}
_sheetContext["opened"]=NO;
_sheetContext["frame"]=_17f;
_sheetContext["isClosing"]=YES;
if(objj_msgSend(self,"isVisible")){
_180.size.height=0;
objj_msgSend(self,"_setUpMasksForView:",objj_msgSend(_17e,"contentView"));
objj_msgSend(_17e,"_setFrame:delegate:duration:curve:",_180,self,objj_msgSend(self,"animationResizeTime:",_180),CPAnimationEaseIn);
}else{
objj_msgSend(self,"_sheetAnimationDidEnd:",nil);
}
}
}),new objj_method(sel_getUid("_sheetAnimationDidEnd:"),function(self,_181,_182){
with(self){
var _183=_sheetContext["sheet"];
_sheetContext["isOpening"]=NO;
_sheetContext["isClosing"]=NO;
if(_sheetContext["opened"]===YES){
objj_msgSend(self,"_restoreMasksForView:",objj_msgSend(_183,"contentView"));
if(_sheetContext["shouldClose"]===YES){
objj_msgSend(self,"_detachSheetWindow");
}
}else{
objj_msgSend(self,"_cleanupSheetWindow");
}
}
}),new objj_method(sel_getUid("_setUpMasksForView:"),function(self,_184,_185){
with(self){
var _186=objj_msgSend(_185,"subviews");
objj_msgSend(_186,"addObject:",_185);
for(var i=0,_187=objj_msgSend(_186,"count");i<_187;i++){
var view=objj_msgSend(_186,"objectAtIndex:",i),mask=objj_msgSend(view,"autoresizingMask"),_188=(mask&CPViewMinYMargin)?128:CPViewMinYMargin;
objj_msgSend(view,"setAutoresizingMask:",(mask|_188));
}
}
}),new objj_method(sel_getUid("_restoreMasksForView:"),function(self,_189,_18a){
with(self){
var _18b=objj_msgSend(_18a,"subviews");
objj_msgSend(_18b,"addObject:",_18a);
for(var i=0,_18c=objj_msgSend(_18b,"count");i<_18c;i++){
var view=objj_msgSend(_18b,"objectAtIndex:",i),mask=objj_msgSend(view,"autoresizingMask"),_18d=(mask&128)?128:CPViewMinYMargin;
objj_msgSend(view,"setAutoresizingMask:",(mask&(~_18d)));
}
}
}),new objj_method(sel_getUid("attachedSheet"),function(self,_18e){
with(self){
if(_sheetContext===nil){
return nil;
}
return _sheetContext["sheet"];
}
}),new objj_method(sel_getUid("isSheet"),function(self,_18f){
with(self){
return _isSheet;
}
}),new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"),function(self,_190){
with(self){
return NO;
}
}),new objj_method(sel_getUid("worksWhenModal"),function(self,_191){
with(self){
return NO;
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(self,_192,_193){
with(self){
return objj_msgSend(objj_msgSend(self,"contentView"),"performKeyEquivalent:",_193);
}
}),new objj_method(sel_getUid("keyDown:"),function(self,_194,_195){
with(self){
if(objj_msgSend(_195,"_couldBeKeyEquivalent")&&objj_msgSend(self,"performKeyEquivalent:",_195)){
return;
}
if(!objj_msgSend(self,"_processKeyboardUIKey:",_195)){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow").super_class},"keyDown:",_195);
}
}
}),new objj_method(sel_getUid("_processKeyboardUIKey:"),function(self,_196,_197){
with(self){
var _198=objj_msgSend(_197,"charactersIgnoringModifiers");
if(!objj_msgSend(_a,"containsObject:",_198)){
return NO;
}
var _199=objj_msgSend(CPKeyBinding,"selectorsForKey:modifierFlags:",_198,0);
if(objj_msgSend(_199,"count")<=0){
return NO;
}
if(_198!==CPEscapeFunctionKey){
var _19a=objj_msgSend(_199,"objectAtIndex:",0);
return objj_msgSend(objj_msgSend(self,"firstResponder"),"tryToPerform:with:",_19a,self);
}else{
objj_msgSend(objj_msgSend(self,"firstResponder"),"doCommandBySelector:",sel_getUid("complete:"));
}
return NO;
}
}),new objj_method(sel_getUid("_dirtyKeyViewLoop"),function(self,_19b){
with(self){
if(_autorecalculatesKeyViewLoop){
_keyViewLoopIsDirty=YES;
}
}
}),new objj_method(sel_getUid("_hasKeyViewLoop"),function(self,_19c){
with(self){
var _19d=_19e(self),_19f=objj_msgSend(_19d,"count");
while(_19f--){
if(objj_msgSend(_19d[_19f],"nextKeyView")){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("recalculateKeyViewLoop"),function(self,_1a0){
with(self){
var _1a1=_19e(self);
objj_msgSend(_1a1,"sortUsingFunction:context:",_1a2,nil);
for(var _1a3=0,_1a4=objj_msgSend(_1a1,"count");_1a3<_1a4;++_1a3){
objj_msgSend(_1a1[_1a3],"setNextKeyView:",_1a1[(_1a3+1)%_1a4]);
}
_keyViewLoopIsDirty=NO;
}
}),new objj_method(sel_getUid("setAutorecalculatesKeyViewLoop:"),function(self,_1a5,_1a6){
with(self){
if(_autorecalculatesKeyViewLoop===_1a6){
return;
}
_autorecalculatesKeyViewLoop=_1a6;
if(_autorecalculatesKeyViewLoop){
objj_msgSend(self,"_dirtyKeyViewLoop");
}
}
}),new objj_method(sel_getUid("autorecalculatesKeyViewLoop"),function(self,_1a7){
with(self){
return _autorecalculatesKeyViewLoop;
}
}),new objj_method(sel_getUid("selectNextKeyView:"),function(self,_1a8,_1a9){
with(self){
if(_keyViewLoopIsDirty&&objj_msgSend(self,"autorecalculatesKeyViewLoop")){
objj_msgSend(self,"recalculateKeyViewLoop");
}
var _1aa=nil;
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
_1aa=objj_msgSend(_firstResponder,"nextValidKeyView");
}
if(!_1aa){
var _1ab=_initialFirstResponder;
if(objj_msgSend(_1ab,"acceptsFirstResponder")){
_1aa=_1ab;
}else{
_1aa=objj_msgSend(_1ab,"nextValidKeyView");
}
}
objj_msgSend(self,"makeFirstResponder:",_1aa);
}
}),new objj_method(sel_getUid("selectPreviousKeyView:"),function(self,_1ac,_1ad){
with(self){
if(_keyViewLoopIsDirty&&objj_msgSend(self,"autorecalculatesKeyViewLoop")){
objj_msgSend(self,"recalculateKeyViewLoop");
}
var _1ae=nil;
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
_1ae=objj_msgSend(_firstResponder,"previousValidKeyView");
}
if(!_1ae){
var _1af=_initialFirstResponder;
if(objj_msgSend(_1af,"acceptsFirstResponder")){
_1ae=_1af;
}else{
_1ae=objj_msgSend(_1af,"previousValidKeyView");
}
}
objj_msgSend(self,"makeFirstResponder:",_1ae);
}
}),new objj_method(sel_getUid("selectKeyViewFollowingView:"),function(self,_1b0,_1b1){
with(self){
if(_keyViewLoopIsDirty&&objj_msgSend(self,"autorecalculatesKeyViewLoop")){
objj_msgSend(self,"recalculateKeyViewLoop");
}
var _1b2=objj_msgSend(_1b1,"nextValidKeyView");
if(objj_msgSend(_1b2,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"makeFirstResponder:",_1b2);
}
}
}),new objj_method(sel_getUid("selectKeyViewPrecedingView:"),function(self,_1b3,_1b4){
with(self){
if(_keyViewLoopIsDirty&&objj_msgSend(self,"autorecalculatesKeyViewLoop")){
objj_msgSend(self,"recalculateKeyViewLoop");
}
var _1b5=objj_msgSend(_1b4,"previousValidKeyView");
if(objj_msgSend(_1b5,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"makeFirstResponder:",_1b5);
}
}
}),new objj_method(sel_getUid("setDefaultButtonCell:"),function(self,_1b6,_1b7){
with(self){
objj_msgSend(self,"setDefaultButton:",_1b7);
}
}),new objj_method(sel_getUid("defaultButtonCell"),function(self,_1b8){
with(self){
return objj_msgSend(self,"defaultButton");
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(self,_1b9,_1ba){
with(self){
if(_defaultButton===_1ba){
return;
}
if(objj_msgSend(_defaultButton,"keyEquivalent")===CPCarriageReturnCharacter){
objj_msgSend(_defaultButton,"setKeyEquivalent:",nil);
}
_defaultButton=_1ba;
if(objj_msgSend(_defaultButton,"keyEquivalent")!==CPCarriageReturnCharacter){
objj_msgSend(_defaultButton,"setKeyEquivalent:",CPCarriageReturnCharacter);
}
}
}),new objj_method(sel_getUid("defaultButton"),function(self,_1bb){
with(self){
return _defaultButton;
}
}),new objj_method(sel_getUid("enableKeyEquivalentForDefaultButton"),function(self,_1bc){
with(self){
_defaultButtonEnabled=YES;
}
}),new objj_method(sel_getUid("enableKeyEquivalentForDefaultButtonCell"),function(self,_1bd){
with(self){
objj_msgSend(self,"enableKeyEquivalentForDefaultButton");
}
}),new objj_method(sel_getUid("disableKeyEquivalentForDefaultButton"),function(self,_1be){
with(self){
_defaultButtonEnabled=NO;
}
}),new objj_method(sel_getUid("disableKeyEquivalentForDefaultButtonCell"),function(self,_1bf){
with(self){
objj_msgSend(self,"disableKeyEquivalentForDefaultButton");
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("initialize"),function(self,_1c0){
with(self){
if(self!==objj_msgSend(CPWindow,"class")){
return;
}
var _1c1=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_8=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_1c1,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(16,16));
}
}),new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(self,_1c2,_1c3){
with(self){
if(_1c3&CPHUDBackgroundWindowMask){
return _CPHUDWindowView;
}else{
if(_1c3===CPBorderlessWindowMask){
return _CPBorderlessWindowView;
}else{
if(_1c3&CPDocModalWindowMask){
return _CPDocModalWindowView;
}
}
}
return _CPStandardWindowView;
}
}),new objj_method(sel_getUid("_windowViewClassForFullPlatformWindowStyleMask:"),function(self,_1c4,_1c5){
with(self){
return _CPBorderlessBridgeWindowView;
}
}),new objj_method(sel_getUid("frameRectForContentRect:styleMask:"),function(self,_1c6,_1c7,_1c8){
with(self){
return objj_msgSend(objj_msgSend(objj_msgSend(self,"class"),"_windowViewClassForStyleMask:",_1c8),"frameRectForContentRect:",_1c7);
}
})]);
var _19e=function(_1c9){
var _1ca=objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_1c9,"contentView"));
objj_msgSend(_1ca,"addObjectsFromArray:",objj_msgSend(objj_msgSend(_1c9,"contentView"),"subviews"));
for(var _1cb=1;_1cb<_1ca.length;++_1cb){
_1ca=_1ca.concat(objj_msgSend(_1ca[_1cb],"subviews"));
}
return _1ca;
};
var _1a2=function(lhs,rhs,_1cc){
var _1cd=objj_msgSend(lhs,"convertRect:toView:",objj_msgSend(lhs,"bounds"),nil),_1ce=objj_msgSend(rhs,"convertRect:toView:",objj_msgSend(rhs,"bounds"),nil),lhsY=(_1cd.origin.y),rhsY=(_1ce.origin.y),lhsX=(_1cd.origin.x),rhsX=(_1ce.origin.x),_1cf=MIN((_1cd.origin.y+_1cd.size.height),(_1ce.origin.y+_1ce.size.height))-MAX(lhsY,rhsY);
if(_1cf>0){
if(lhsX<rhsX){
return CPOrderedAscending;
}
if(lhsX===rhsX){
return CPOrderedSame;
}
return CPOrderedDescending;
}
if(lhsY<rhsY){
return CPOrderedAscending;
}
if(lhsY===rhsY){
return CPOrderedSame;
}
return CPOrderedDescending;
};
var _b=objj_getClass("CPWindow");
if(!_b){
throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("_synchronizeMenuBarTitleWithWindowTitle"),function(self,_1d0){
with(self){
if(!objj_msgSend(_windowController,"document")||!objj_msgSend(self,"isMainWindow")){
return;
}
objj_msgSend(CPMenu,"setMenuBarTitle:",_title);
}
})]);
var _b=objj_getClass("CPWindow");
if(!_b){
throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"),function(self,_1d1,_1d2){
with(self){
if(objj_msgSend(self,"isFullPlatformWindow")){
return objj_msgSend(self,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}
if(_autoresizingMask==CPWindowNotSizable){
return;
}
var _1d3=objj_msgSend(_platformWindow,"contentBounds"),_1d4=CGRectMakeCopy(_frame),dX=(CGRectGetWidth(_1d3)-_1d2.width)/(((_autoresizingMask&CPWindowMinXMargin)?1:0)+(_autoresizingMask&CPWindowWidthSizable?1:0)+(_autoresizingMask&CPWindowMaxXMargin?1:0)),dY=(CGRectGetHeight(_1d3)-_1d2.height)/((_autoresizingMask&CPWindowMinYMargin?1:0)+(_autoresizingMask&CPWindowHeightSizable?1:0)+(_autoresizingMask&CPWindowMaxYMargin?1:0));
if(_autoresizingMask&CPWindowMinXMargin){
_1d4.origin.x+=dX;
}
if(_autoresizingMask&CPWindowWidthSizable){
_1d4.size.width+=dX;
}
if(_autoresizingMask&CPWindowMinYMargin){
_1d4.origin.y+=dY;
}
if(_autoresizingMask&CPWindowHeightSizable){
_1d4.size.height+=dY;
}
objj_msgSend(self,"setFrame:",_1d4);
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(self,_1d5,_1d6){
with(self){
_autoresizingMask=_1d6;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(self,_1d7){
with(self){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("convertBaseToGlobal:"),function(self,_1d8,_1d9){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertBaseToPlatformWindow:",_1d9):objj_msgSend(self,"convertBaseToScreen:",_1d9);
}
}),new objj_method(sel_getUid("convertGlobalToBase:"),function(self,_1da,_1db){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertPlatformWindowToBase:",_1db):objj_msgSend(self,"convertScreenToBase:",_1db);
}
}),new objj_method(sel_getUid("convertBaseToPlatformWindow:"),function(self,_1dc,_1dd){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return {x:_1dd.x,y:_1dd.y};
}
var _1de=objj_msgSend(self,"frame").origin;
return {x:_1dd.x+_1de.x,y:_1dd.y+_1de.y};
}
}),new objj_method(sel_getUid("convertPlatformWindowToBase:"),function(self,_1df,_1e0){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return {x:_1e0.x,y:_1e0.y};
}
var _1e1=objj_msgSend(self,"frame").origin;
return {x:_1e0.x-_1e1.x,y:_1e0.y-_1e1.y};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(self,_1e2,_1e3){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",objj_msgSend(_platformWindow,"convertScreenToBase:",_1e3));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(self,_1e4,_1e5){
with(self){
return objj_msgSend(_platformWindow,"convertBaseToScreen:",objj_msgSend(self,"convertBaseToPlatformWindow:",_1e5));
}
}),new objj_method(sel_getUid("_setSharesChromeWithPlatformWindow:"),function(self,_1e6,_1e7){
with(self){
if(_1e7&&objj_msgSend(CPPlatform,"isBrowser")){
return;
}
_sharesChromeWithPlatformWindow=_1e7;
objj_msgSend(self,"_updateShadow");
}
}),new objj_method(sel_getUid("_sharesChromeWithPlatformWindow"),function(self,_1e8){
with(self){
return _sharesChromeWithPlatformWindow;
}
}),new objj_method(sel_getUid("undoManager"),function(self,_1e9){
with(self){
if(_undoManager){
return _undoManager;
}
var _1ea=objj_msgSend(objj_msgSend(_windowController,"document"),"undoManager");
if(_1ea){
return _1ea;
}
if(_delegateRespondsToWindowWillReturnUndoManagerSelector){
return objj_msgSend(_delegate,"windowWillReturnUndoManager:",self);
}
if(!_undoManager){
_undoManager=objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init");
}
return _undoManager;
}
}),new objj_method(sel_getUid("undo:"),function(self,_1eb,_1ec){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"undo");
}
}),new objj_method(sel_getUid("redo:"),function(self,_1ed,_1ee){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"redo");
}
}),new objj_method(sel_getUid("containsPoint:"),function(self,_1ef,_1f0){
with(self){
return CGRectContainsPoint(_frame,_1f0);
}
})]);
var _b=objj_getClass("CPWindow");
if(!_b){
throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("setFullBridge:"),function(self,_1f1,_1f2){
with(self){
objj_msgSend(self,"setFullPlatformWindow:",_1f2);
}
}),new objj_method(sel_getUid("isFullBridge"),function(self,_1f3){
with(self){
return objj_msgSend(self,"isFullPlatformWindow");
}
}),new objj_method(sel_getUid("convertBaseToBridge:"),function(self,_1f4,_1f5){
with(self){
return objj_msgSend(self,"convertBaseToPlatformWindow:",_1f5);
}
}),new objj_method(sel_getUid("convertBridgeToBase:"),function(self,_1f6,_1f7){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",_1f7);
}
})]);
var _1f8=function(_1f9,_1fa,_1fb){
return _1f9+(_1fa-_1f9)*_1fb;
};
var _b=objj_allocateClassPair(CPAnimation,"_CPWindowFrameAnimation"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_window"),new objj_ivar("_startFrame"),new objj_ivar("_targetFrame")]);
objj_registerClassPair(_b);
class_addMethods(_b,[new objj_method(sel_getUid("initWithWindow:targetFrame:"),function(self,_1fc,_1fd,_1fe){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPWindowFrameAnimation").super_class},"initWithDuration:animationCurve:",objj_msgSend(_1fd,"animationResizeTime:",_1fe),CPAnimationLinear);
if(self){
_window=_1fd;
_targetFrame=CGRectMakeCopy(_1fe);
_startFrame=CGRectMakeCopy(objj_msgSend(_window,"frame"));
}
return self;
}
}),new objj_method(sel_getUid("startAnimation"),function(self,_1ff){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPWindowFrameAnimation").super_class},"startAnimation");
_window._isAnimating=YES;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(self,_200,_201){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPWindowFrameAnimation").super_class},"setCurrentProgress:",_201);
var _202=objj_msgSend(self,"currentValue");
if(_202==1){
_window._isAnimating=NO;
}
var _203=CGRectMake(_1f8(CGRectGetMinX(_startFrame),CGRectGetMinX(_targetFrame),_202),_1f8(CGRectGetMinY(_startFrame),CGRectGetMinY(_targetFrame),_202),_1f8(CGRectGetWidth(_startFrame),CGRectGetWidth(_targetFrame),_202),_1f8(CGRectGetHeight(_startFrame),CGRectGetHeight(_targetFrame),_202));
objj_msgSend(_window,"setFrame:display:animate:",_203,YES,NO);
}
})]);
_CPWindowFullPlatformWindowSessionMake=function(_204,_205,_206,_207){
return {windowView:_204,contentRect:_205,hasShadow:_206,level:_207};
};
CPStandardWindowShadowStyle=0;
CPMenuWindowShadowStyle=1;
CPPanelWindowShadowStyle=2;
CPCustomWindowShadowStyle=3;
objj_executeFile("_CPWindowView.j",YES);
objj_executeFile("_CPStandardWindowView.j",YES);
objj_executeFile("_CPDocModalWindowView.j",YES);
objj_executeFile("_CPToolTipWindowView.j",YES);
objj_executeFile("_CPHUDWindowView.j",YES);
objj_executeFile("_CPBorderlessWindowView.j",YES);
objj_executeFile("_CPBorderlessBridgeWindowView.j",YES);
objj_executeFile("_CPAttachedWindowView.j",YES);
objj_executeFile("CPDragServer.j",YES);
objj_executeFile("CPView.j",YES);
