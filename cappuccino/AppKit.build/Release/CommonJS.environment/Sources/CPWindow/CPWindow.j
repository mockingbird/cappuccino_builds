@STATIC;1.0;I;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;18;CPPlatformWindow.ji;13;CPResponder.ji;10;CPScreen.ji;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;23;_CPDocModalWindowView.ji;22;_CPToolTipWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;23;_CPAttachedWindowView.ji;14;CPDragServer.ji;8;CPView.jt;67424;
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
class_addIvars(_b,[new objj_ivar("_platformWindow"),new objj_ivar("_windowNumber"),new objj_ivar("_styleMask"),new objj_ivar("_frame"),new objj_ivar("_level"),new objj_ivar("_isVisible"),new objj_ivar("_isMiniaturized"),new objj_ivar("_isAnimating"),new objj_ivar("_hasShadow"),new objj_ivar("_isMovableByWindowBackground"),new objj_ivar("_isMovable"),new objj_ivar("_shadowStyle"),new objj_ivar("_showsResizeIndicator"),new objj_ivar("_isDocumentEdited"),new objj_ivar("_isDocumentSaving"),new objj_ivar("_shadowView"),new objj_ivar("_windowView"),new objj_ivar("_contentView"),new objj_ivar("_toolbarView"),new objj_ivar("_mouseEnteredStack"),new objj_ivar("_leftMouseDownView"),new objj_ivar("_rightMouseDownView"),new objj_ivar("_toolbar"),new objj_ivar("_firstResponder"),new objj_ivar("_initialFirstResponder"),new objj_ivar("_delegate"),new objj_ivar("_title"),new objj_ivar("_acceptsMouseMovedEvents"),new objj_ivar("_ignoresMouseEvents"),new objj_ivar("_windowController"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_undoManager"),new objj_ivar("_representedURL"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_inclusiveRegisteredDraggedTypes"),new objj_ivar("_defaultButton"),new objj_ivar("_defaultButtonEnabled"),new objj_ivar("_autorecalculatesKeyViewLoop"),new objj_ivar("_keyViewLoopIsDirty"),new objj_ivar("_sharesChromeWithPlatformWindow"),new objj_ivar("_autoresizingMask"),new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"),new objj_ivar("_isFullPlatformWindow"),new objj_ivar("_fullPlatformWindowSession"),new objj_ivar("_sheetContext"),new objj_ivar("_parentView"),new objj_ivar("_isSheet"),new objj_ivar("_frameAnimation")]);
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
}),new objj_method(sel_getUid("platformWindow"),function(_15,_16){
with(_15){
return _platformWindow;
}
}),new objj_method(sel_getUid("setPlatformWindow:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(_17,"isVisible");
if(_1a){
objj_msgSend(_17,"close");
}
_platformWindow=_19;
objj_msgSend(_platformWindow,"_setTitle:window:",_title,_17);
if(_1a){
objj_msgSend(_17,"orderFront:",_17);
}
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_1b,_1c){
with(_1b){
_keyViewLoopIsDirty=!objj_msgSend(_1b,"_hasKeyViewLoop");
if(_keyViewLoopIsDirty&&!objj_msgSend(_1b,"autorecalculatesKeyViewLoop")){
objj_msgSend(_1b,"recalculateKeyViewLoop");
}
}
}),new objj_method(sel_getUid("_setWindowView:"),function(_1d,_1e,_1f){
with(_1d){
if(_windowView===_1f){
return;
}
var _20=_windowView;
_windowView=_1f;
if(_20){
objj_msgSend(_20,"_setWindow:",nil);
objj_msgSend(_20,"noteToolbarChanged");
}
if(_windowView){
var _21=objj_msgSend(_contentView,"convertRect:toView:",objj_msgSend(_contentView,"bounds"),nil);
_21.origin=objj_msgSend(_1d,"convertBaseToGlobal:",_21.origin);
objj_msgSend(_windowView,"_setWindow:",_1d);
objj_msgSend(_windowView,"setNextResponder:",_1d);
objj_msgSend(_windowView,"addSubview:",_contentView);
objj_msgSend(_windowView,"setTitle:",_title);
objj_msgSend(_windowView,"noteToolbarChanged");
objj_msgSend(_windowView,"setShowsResizeIndicator:",objj_msgSend(_1d,"showsResizeIndicator"));
objj_msgSend(_1d,"setFrame:",objj_msgSend(_1d,"frameRectForContentRect:",_21));
}
}
}),new objj_method(sel_getUid("setFullPlatformWindow:"),function(_22,_23,_24){
with(_22){
if(!objj_msgSend(_platformWindow,"supportsFullPlatformWindows")){
return;
}
_24=!!_24;
if(_isFullPlatformWindow===_24){
return;
}
_isFullPlatformWindow=_24;
if(_isFullPlatformWindow){
_fullPlatformWindowSession=_CPWindowFullPlatformWindowSessionMake(_windowView,objj_msgSend(_22,"contentRectForFrameRect:",objj_msgSend(_22,"frame")),objj_msgSend(_22,"hasShadow"),objj_msgSend(_22,"level"));
var _25=objj_msgSend(objj_msgSend(_22,"class"),"_windowViewClassForFullPlatformWindowStyleMask:",_styleMask),_26=objj_msgSend(objj_msgSend(_25,"alloc"),"initWithFrame:styleMask:",CGRectMakeZero(),_styleMask);
objj_msgSend(_22,"_setWindowView:",_26);
objj_msgSend(_22,"setLevel:",CPBackgroundWindowLevel);
objj_msgSend(_22,"setHasShadow:",NO);
objj_msgSend(_22,"setAutoresizingMask:",CPWindowWidthSizable|CPWindowHeightSizable);
objj_msgSend(_22,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}else{
var _26=_fullPlatformWindowSession.windowView;
objj_msgSend(_22,"_setWindowView:",_26);
objj_msgSend(_22,"setLevel:",_fullPlatformWindowSession.level);
objj_msgSend(_22,"setHasShadow:",_fullPlatformWindowSession.hasShadow);
objj_msgSend(_22,"setAutoresizingMask:",CPWindowNotSizable);
objj_msgSend(_22,"setFrame:",objj_msgSend(_26,"frameRectForContentRect:",_fullPlatformWindowSession.contentRect));
}
}
}),new objj_method(sel_getUid("isFullPlatformWindow"),function(_27,_28){
with(_27){
return _isFullPlatformWindow;
}
}),new objj_method(sel_getUid("styleMask"),function(_29,_2a){
with(_29){
return _styleMask;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_2b,_2c,_2d){
with(_2b){
return objj_msgSend(_windowView,"contentRectForFrameRect:",_2d);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_2e,_2f,_30){
with(_2e){
return objj_msgSend(_windowView,"frameRectForContentRect:",_30);
}
}),new objj_method(sel_getUid("frame"),function(_31,_32){
with(_31){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("_setClippedFrame:display:animate:"),function(_33,_34,_35,_36,_37){
with(_33){
_35.size.width=MIN(MAX(_35.size.width,_minSize.width),_maxSize.width);
_35.size.height=MIN(MAX(_35.size.height,_minSize.height),_maxSize.height);
objj_msgSend(_33,"setFrame:display:animate:",_35,_36,_37);
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(_38,_39,_3a,_3b,_3c){
with(_38){
_3a={origin:{x:_3a.origin.x,y:_3a.origin.y},size:{width:_3a.size.width,height:_3a.size.height}};
var _3d=_3a.origin.x,_3e=_3d-FLOOR(_3d);
if(_3e){
_3a.origin.x=_3d>0.879?CEIL(_3d):FLOOR(_3d);
}
_3d=_3a.origin.y;
_3e=_3d-FLOOR(_3d);
if(_3e){
_3a.origin.y=_3d>0.879?CEIL(_3d):FLOOR(_3d);
}
_3d=_3a.size.width;
_3e=_3d-FLOOR(_3d);
if(_3e){
_3a.size.width=_3d>0.15?CEIL(_3d):FLOOR(_3d);
}
_3d=_3a.size.height;
_3e=_3d-FLOOR(_3d);
if(_3e){
_3a.size.height=_3d>0.15?CEIL(_3d):FLOOR(_3d);
}
if(_3c){
objj_msgSend(_frameAnimation,"stopAnimation");
_frameAnimation=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",_38,_3a);
objj_msgSend(_frameAnimation,"startAnimation");
}else{
var _3f=_frame.origin,_40=_3a.origin;
if(!(_3f.x==_40.x&&_3f.y==_40.y)){
_3f.x=_40.x;
_3f.y=_40.y;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMoveNotification,_38);
}
var _41=_frame.size,_42=_3a.size;
if(!(_41.width==_42.width&&_41.height==_42.height)){
_41.width=_42.width;
_41.height=_42.height;
objj_msgSend(_windowView,"setFrameSize:",_41);
if(_hasShadow){
var _43={width:_41.width,height:_41.height};
if(_41.width>=(_1+_2)){
_43.width+=_1+_2;
}
if(_41.height>=(_4+_3+_5)){
_43.height+=_4+_3+_5;
}
objj_msgSend(_shadowView,"setFrameSize:",_43);
}
if(!_isAnimating){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidResizeNotification,_38);
}
}
if(objj_msgSend(_38,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setContentRect:",_frame);
}
}
}
}),new objj_method(sel_getUid("setFrame:display:"),function(_44,_45,_46,_47){
with(_44){
objj_msgSend(_44,"_setClippedFrame:display:animate:",_46,_47,NO);
}
}),new objj_method(sel_getUid("setFrame:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_48,"_setClippedFrame:display:animate:",_4a,YES,NO);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_4b,"_setClippedFrame:display:animate:",{origin:{x:_4d.x,y:_4d.y},size:{width:(_frame.size.width),height:(_frame.size.height)}},YES,NO);
if(objj_msgSend(_4b,"attachedSheet")){
objj_msgSend(_4b,"_setAttachedSheetFrameOrigin");
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSend(_4e,"_setClippedFrame:display:animate:",{origin:{x:(_frame.origin.x),y:(_frame.origin.y)},size:{width:_50.width,height:_50.height}},YES,NO);
}
}),new objj_method(sel_getUid("orderFront:"),function(_51,_52,_53){
with(_51){
if(!CPApp._keyWindow){
objj_msgSend(_51,"makeKeyWindow");
}
if(objj_msgSend(_51,"isKeyWindow")&&(_firstResponder===_51||!_firstResponder)){
objj_msgSend(_51,"makeFirstResponder:",_initialFirstResponder);
}
if(!CPApp._mainWindow){
objj_msgSend(_51,"makeMainWindow");
}
}
}),new objj_method(sel_getUid("orderBack:"),function(_54,_55,_56){
with(_54){
}
}),new objj_method(sel_getUid("orderOut:"),function(_57,_58,_59){
with(_57){
if(objj_msgSend(_57,"isSheet")){
objj_msgSend(_57._parentView,"_detachSheetWindow");
return;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillClose:"))){
objj_msgSend(_delegate,"windowWillClose:",_57);
}
objj_msgSend(_57,"_updateMainAndKeyWindows");
}
}),new objj_method(sel_getUid("orderWindow:relativeTo:"),function(_5a,_5b,_5c,_5d){
with(_5a){
}
}),new objj_method(sel_getUid("setLevel:"),function(_5e,_5f,_60){
with(_5e){
if(_60===_level){
return;
}
objj_msgSend(_platformWindow,"moveWindow:fromLevel:toLevel:",_5e,_level,_60);
_level=_60;
if(objj_msgSend(_5e,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setLevel:",_60);
}
}
}),new objj_method(sel_getUid("level"),function(_61,_62){
with(_61){
return _level;
}
}),new objj_method(sel_getUid("isVisible"),function(_63,_64){
with(_63){
return _isVisible;
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_65,_66){
with(_65){
return _showsResizeIndicator;
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_67,_68,_69){
with(_67){
_69=!!_69;
if(_showsResizeIndicator===_69){
return;
}
_showsResizeIndicator=_69;
objj_msgSend(_windowView,"setShowsResizeIndicator:",objj_msgSend(_67,"showsResizeIndicator"));
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_6a,_6b){
with(_6a){
return objj_msgSend(_windowView,"resizeIndicatorOffset");
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_6c,_6d,_6e){
with(_6c){
objj_msgSend(_windowView,"setResizeIndicatorOffset:",_6e);
}
}),new objj_method(sel_getUid("setContentView:"),function(_6f,_70,_71){
with(_6f){
if(_contentView){
objj_msgSend(_contentView,"removeFromSuperview");
}
var _72=CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame));
if(_initialFirstResponder===_contentView){
objj_msgSend(_6f,"setInitialFirstResponder:",_71);
}
_contentView=_71;
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_6f,"contentRectForFrameRect:",_72));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_windowView,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_73,_74){
with(_73){
return _contentView;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_75,_76,_77){
with(_75){
objj_msgSend(_windowView,"setAlphaValue:",_77);
}
}),new objj_method(sel_getUid("alphaValue"),function(_78,_79){
with(_78){
return objj_msgSend(_windowView,"alphaValue");
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_7a,_7b,_7c){
with(_7a){
objj_msgSend(_windowView,"setBackgroundColor:",_7c);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_7d,_7e){
with(_7d){
return objj_msgSend(_windowView,"backgroundColor");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_7f,_80,_81){
with(_7f){
if(CGSizeEqualToSize(_minSize,_81)){
return;
}
_minSize=CGSizeCreateCopy(_81);
var _82=CGSizeMakeCopy(objj_msgSend(_7f,"frame").size),_83=NO;
if(_82.width<_minSize.width){
_82.width=_minSize.width;
_83=YES;
}
if(_82.height<_minSize.height){
_82.height=_minSize.height;
_83=YES;
}
if(_83){
objj_msgSend(_7f,"setFrameSize:",_82);
}
}
}),new objj_method(sel_getUid("minSize"),function(_84,_85){
with(_84){
return _minSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_86,_87,_88){
with(_86){
if(CGSizeEqualToSize(_maxSize,_88)){
return;
}
_maxSize=CGSizeCreateCopy(_88);
var _89=CGSizeMakeCopy(objj_msgSend(_86,"frame").size),_8a=NO;
if(_89.width>_maxSize.width){
_89.width=_maxSize.width;
_8a=YES;
}
if(_89.height>_maxSize.height){
_89.height=_maxSize.height;
_8a=YES;
}
if(_8a){
objj_msgSend(_86,"setFrameSize:",_89);
}
}
}),new objj_method(sel_getUid("maxSize"),function(_8b,_8c){
with(_8b){
return _maxSize;
}
}),new objj_method(sel_getUid("hasShadow"),function(_8d,_8e){
with(_8d){
return _hasShadow;
}
}),new objj_method(sel_getUid("_updateShadow"),function(_8f,_90){
with(_8f){
if(objj_msgSend(_8f,"_sharesChromeWithPlatformWindow")){
if(_shadowView){
_shadowView=nil;
}
objj_msgSend(_platformWindow,"setHasShadow:",_hasShadow);
return;
}
if(_hasShadow&&!_shadowView){
var _91=objj_msgSend(_windowView,"bounds");
_shadowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(-_1,-_3+_5,_1+CGRectGetWidth(_91)+_2,_3+CGRectGetHeight(_91)+_4));
if(!_6){
var _92=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_6=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_92,"pathForResource:","CPWindow/CPWindowShadow0.png"),CGSizeMake(20,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_92,"pathForResource:","CPWindow/CPWindowShadow1.png"),CGSizeMake(1,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_92,"pathForResource:","CPWindow/CPWindowShadow2.png"),CGSizeMake(19,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_92,"pathForResource:","CPWindow/CPWindowShadow3.png"),CGSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_92,"pathForResource:","CPWindow/CPWindowShadow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_92,"pathForResource:","CPWindow/CPWindowShadow5.png"),CGSizeMake(19,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_92,"pathForResource:","CPWindow/CPWindowShadow6.png"),CGSizeMake(20,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_92,"pathForResource:","CPWindow/CPWindowShadow7.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_92,"pathForResource:","CPWindow/CPWindowShadow8.png"),CGSizeMake(19,18))]));
}
objj_msgSend(_shadowView,"setBackgroundColor:",_6);
objj_msgSend(_shadowView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
}else{
if(!_hasShadow&&_shadowView){
_shadowView=nil;
}
}
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_93,_94,_95){
with(_93){
if(_hasShadow===_95){
return;
}
_hasShadow=_95;
objj_msgSend(_93,"_updateShadow");
}
}),new objj_method(sel_getUid("setShadowStyle:"),function(_96,_97,_98){
with(_96){
_shadowStyle=_98;
objj_msgSend(objj_msgSend(_96,"platformWindow"),"setShadowStyle:",_shadowStyle);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_99,_9a,_9b){
with(_99){
var _9c=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_9c,"removeObserver:name:object:",_delegate,CPWindowDidResignKeyNotification,_99);
objj_msgSend(_9c,"removeObserver:name:object:",_delegate,CPWindowDidBecomeKeyNotification,_99);
objj_msgSend(_9c,"removeObserver:name:object:",_delegate,CPWindowDidBecomeMainNotification,_99);
objj_msgSend(_9c,"removeObserver:name:object:",_delegate,CPWindowDidResignMainNotification,_99);
objj_msgSend(_9c,"removeObserver:name:object:",_delegate,CPWindowDidMoveNotification,_99);
objj_msgSend(_9c,"removeObserver:name:object:",_delegate,CPWindowDidResizeNotification,_99);
objj_msgSend(_9c,"removeObserver:name:object:",_delegate,CPWindowWillBeginSheetNotification,_99);
objj_msgSend(_9c,"removeObserver:name:object:",_delegate,CPWindowDidEndSheetNotification,_99);
_delegate=_9b;
_delegateRespondsToWindowWillReturnUndoManagerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillReturnUndoManager:"));
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignKey:"))){
objj_msgSend(_9c,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignKey:"),CPWindowDidResignKeyNotification,_99);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeKey:"))){
objj_msgSend(_9c,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeKey:"),CPWindowDidBecomeKeyNotification,_99);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeMain:"))){
objj_msgSend(_9c,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeMain:"),CPWindowDidBecomeMainNotification,_99);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignMain:"))){
objj_msgSend(_9c,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignMain:"),CPWindowDidResignMainNotification,_99);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidMove:"))){
objj_msgSend(_9c,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidMove:"),CPWindowDidMoveNotification,_99);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResize:"))){
objj_msgSend(_9c,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResize:"),CPWindowDidResizeNotification,_99);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillBeginSheet:"))){
objj_msgSend(_9c,"addObserver:selector:name:object:",_delegate,sel_getUid("windowWillBeginSheet:"),CPWindowWillBeginSheetNotification,_99);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidEndSheet:"))){
objj_msgSend(_9c,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidEndSheet:"),CPWindowDidEndSheetNotification,_99);
}
}
}),new objj_method(sel_getUid("delegate"),function(_9d,_9e){
with(_9d){
return _delegate;
}
}),new objj_method(sel_getUid("setWindowController:"),function(_9f,_a0,_a1){
with(_9f){
_windowController=_a1;
}
}),new objj_method(sel_getUid("windowController"),function(_a2,_a3){
with(_a2){
return _windowController;
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_a4,_a5,_a6){
with(_a4){
if(objj_msgSend(_delegate,"respondsToSelector:",_a6)){
objj_msgSend(_delegate,"performSelector:",_a6);
}else{
objj_msgSendSuper({receiver:_a4,super_class:objj_getClass("CPWindow").super_class},"doCommandBySelector:",_a6);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_a7,_a8){
with(_a7){
return NO;
}
}),new objj_method(sel_getUid("initialFirstResponder"),function(_a9,_aa){
with(_a9){
return _initialFirstResponder;
}
}),new objj_method(sel_getUid("setInitialFirstResponder:"),function(_ab,_ac,_ad){
with(_ab){
objj_msgSend(_ab,"_setupFirstResponder:",_ad);
_initialFirstResponder=_ad;
}
}),new objj_method(sel_getUid("_setupFirstResponder:"),function(_ae,_af,_b0){
with(_ae){
if(_keyViewLoopIsDirty&&!_autorecalculatesKeyViewLoop&&_firstResponder===_ae&&_initialFirstResponder===objj_msgSend(_ae,"contentView")){
objj_msgSend(_ae,"recalculateKeyViewLoop");
if(_b0){
objj_msgSend(_ae,"makeFirstResponder:",_b0);
}else{
var _b1=objj_msgSend(objj_msgSend(_ae,"contentView"),"nextValidKeyView");
objj_msgSend(_ae,"makeFirstResponder:",_b1);
}
}
}
}),new objj_method(sel_getUid("makeFirstResponder:"),function(_b2,_b3,_b4){
with(_b2){
if(_firstResponder===_b4){
return YES;
}
if(!objj_msgSend(_firstResponder,"resignFirstResponder")){
return NO;
}
if(!_b4||!objj_msgSend(_b4,"acceptsFirstResponder")||!objj_msgSend(_b4,"becomeFirstResponder")){
_firstResponder=_b2;
return NO;
}
_firstResponder=_b4;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_CPWindowDidChangeFirstResponderNotification,_b2);
return YES;
}
}),new objj_method(sel_getUid("firstResponder"),function(_b5,_b6){
with(_b5){
return _firstResponder;
}
}),new objj_method(sel_getUid("acceptsMouseMovedEvents"),function(_b7,_b8){
with(_b7){
return _acceptsMouseMovedEvents;
}
}),new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"),function(_b9,_ba,_bb){
with(_b9){
_acceptsMouseMovedEvents=_bb;
}
}),new objj_method(sel_getUid("ignoresMouseEvents"),function(_bc,_bd){
with(_bc){
return _ignoresMouseEvents;
}
}),new objj_method(sel_getUid("setIgnoresMouseEvents:"),function(_be,_bf,_c0){
with(_be){
_ignoresMouseEvents=_c0;
}
}),new objj_method(sel_getUid("title"),function(_c1,_c2){
with(_c1){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_c3,_c4,_c5){
with(_c3){
_title=_c5;
objj_msgSend(_windowView,"setTitle:",_c5);
objj_msgSend(_platformWindow,"_setTitle:window:",_title,_c3);
objj_msgSend(_c3,"_synchronizeMenuBarTitleWithWindowTitle");
}
}),new objj_method(sel_getUid("setTitleWithRepresentedFilename:"),function(_c6,_c7,_c8){
with(_c6){
objj_msgSend(_c6,"setRepresentedFilename:",_c8);
objj_msgSend(_c6,"setTitle:",objj_msgSend(_c8,"lastPathComponent"));
}
}),new objj_method(sel_getUid("setRepresentedFilename:"),function(_c9,_ca,_cb){
with(_c9){
objj_msgSend(_c9,"setRepresentedURL:",_cb);
}
}),new objj_method(sel_getUid("representedFilename"),function(_cc,_cd){
with(_cc){
return _representedURL;
}
}),new objj_method(sel_getUid("setRepresentedURL:"),function(_ce,_cf,_d0){
with(_ce){
_representedURL=_d0;
}
}),new objj_method(sel_getUid("representedURL"),function(_d1,_d2){
with(_d1){
return _representedURL;
}
}),new objj_method(sel_getUid("screen"),function(_d3,_d4){
with(_d3){
return objj_msgSend(objj_msgSend(CPScreen,"alloc"),"init");
}
}),new objj_method(sel_getUid("setMovableByWindowBackground:"),function(_d5,_d6,_d7){
with(_d5){
_isMovableByWindowBackground=_d7;
}
}),new objj_method(sel_getUid("isMovableByWindowBackground"),function(_d8,_d9){
with(_d8){
return _isMovableByWindowBackground;
}
}),new objj_method(sel_getUid("setMovable:"),function(_da,_db,_dc){
with(_da){
_isMovable=_dc;
}
}),new objj_method(sel_getUid("isMovable"),function(_dd,_de){
with(_dd){
return _isMovable;
}
}),new objj_method(sel_getUid("center"),function(_df,_e0){
with(_df){
if(_isFullPlatformWindow){
return;
}
var _e1=objj_msgSend(_df,"frame").size,_e2=objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(_platformWindow,"contentBounds").size:objj_msgSend(objj_msgSend(_df,"screen"),"visibleFrame").size;
var _e3=CGPointMake((_e2.width-_e1.width)/2,(_e2.height-_e1.height)/2);
if(_e3.x<0){
_e3.x=0;
}
if(_e3.y<0){
_e3.y=0;
}
objj_msgSend(_df,"setFrameOrigin:",_e3);
}
}),new objj_method(sel_getUid("sendEvent:"),function(_e4,_e5,_e6){
with(_e4){
var _e7=objj_msgSend(_e6,"type"),_e8=objj_msgSend(_e6,"locationInWindow");
var _e9=objj_msgSend(_e4,"attachedSheet");
if(_e9){
switch(_e7){
case CPLeftMouseDown:
objj_msgSend(_windowView,"mouseDown:",_e6);
objj_msgSend(_e9,"makeKeyAndOrderFront:",_e4);
break;
case CPMouseMoved:
objj_msgSend(_windowView,"mouseMoved:",_e6);
break;
}
return;
}
switch(_e7){
case CPFlagsChanged:
return objj_msgSend(objj_msgSend(_e4,"firstResponder"),"flagsChanged:",_e6);
case CPKeyUp:
return objj_msgSend(objj_msgSend(_e4,"firstResponder"),"keyUp:",_e6);
case CPKeyDown:
if(objj_msgSend(_e6,"charactersIgnoringModifiers")===CPTabCharacter){
if(objj_msgSend(_e6,"modifierFlags")&CPShiftKeyMask){
objj_msgSend(_e4,"selectPreviousKeyView:",_e4);
}else{
objj_msgSend(_e4,"selectNextKeyView:",_e4);
}
return;
}else{
if(objj_msgSend(_e6,"charactersIgnoringModifiers")===CPBackTabCharacter){
return objj_msgSend(_e4,"selectPreviousKeyView:",_e4);
}
}
objj_msgSend(objj_msgSend(_e4,"firstResponder"),"keyDown:",_e6);
if(!objj_msgSend(_e4,"disableKeyEquivalentForDefaultButton")){
var _ea=objj_msgSend(_e4,"defaultButton"),_eb=objj_msgSend(_ea,"keyEquivalent"),_ec=objj_msgSend(_ea,"keyEquivalentModifierMask");
if(objj_msgSend(_e6,"_triggersKeyEquivalent:withModifierMask:",_eb,_ec)){
objj_msgSend(objj_msgSend(_e4,"defaultButton"),"performClick:",_e4);
}
}
return;
case CPScrollWheel:
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_e8),"scrollWheel:",_e6);
case CPLeftMouseUp:
case CPRightMouseUp:
var _ed=_leftMouseDownView,_ee=_e7==CPRightMouseUp?sel_getUid("rightMouseUp:"):sel_getUid("mouseUp:");
if(!_ed){
_ed=objj_msgSend(_windowView,"hitTest:",_e8);
}
objj_msgSend(_ed,"performSelector:withObject:",_ee,_e6);
_leftMouseDownView=nil;
return;
case CPLeftMouseDown:
case CPRightMouseDown:
_leftMouseDownView=objj_msgSend(_windowView,"hitTest:",_e8);
if(_leftMouseDownView!=_firstResponder&&objj_msgSend(_leftMouseDownView,"acceptsFirstResponder")){
objj_msgSend(_e4,"makeFirstResponder:",_leftMouseDownView);
}
objj_msgSend(CPApp,"activateIgnoringOtherApps:",YES);
var _ef=objj_msgSend(_e6,"window"),_ee=_e7==CPRightMouseDown?sel_getUid("rightMouseDown:"):sel_getUid("mouseDown:");
if(objj_msgSend(_ef,"isKeyWindow")||objj_msgSend(_ef,"becomesKeyOnlyIfNeeded")&&!objj_msgSend(_leftMouseDownView,"needsPanelToBecomeKey")){
return objj_msgSend(_leftMouseDownView,"performSelector:withObject:",_ee,_e6);
}else{
objj_msgSend(_e4,"makeKeyAndOrderFront:",_e4);
if(objj_msgSend(_leftMouseDownView,"acceptsFirstMouse:",_e6)){
return objj_msgSend(_leftMouseDownView,"performSelector:withObject:",_ee,_e6);
}
}
break;
case CPLeftMouseDragged:
case CPRightMouseDragged:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_e8),"mouseDragged:",_e6);
}
var _ee;
if(_e7==CPRightMouseDragged){
_ee=sel_getUid("rightMouseDragged:");
if(!objj_msgSend(_leftMouseDownView,"respondsToSelector:",_ee)){
_ee=nil;
}
}
if(!_ee){
_ee=sel_getUid("mouseDragged:");
}
return objj_msgSend(_leftMouseDownView,"performSelector:withObject:",_ee,_e6);
case CPMouseMoved:
if(!_acceptsMouseMovedEvents){
return;
}
if(!_mouseEnteredStack){
_mouseEnteredStack=[];
}
var _f0=objj_msgSend(_windowView,"hitTest:",_e8);
if(objj_msgSend(_mouseEnteredStack,"count")&&objj_msgSend(_mouseEnteredStack,"lastObject")===_f0){
return objj_msgSend(_f0,"mouseMoved:",_e6);
}
var _f1=_f0,_f2=[];
while(_f1){
_f2.unshift(_f1);
_f1=objj_msgSend(_f1,"superview");
}
var _f3=MIN(_mouseEnteredStack.length,_f2.length);
while(_f3--){
if(_mouseEnteredStack[_f3]===_f2[_f3]){
break;
}
}
var _f4=_f3+1,_f5=_mouseEnteredStack.length;
if(_f4<_f5){
var _f6=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseExited,_e8,objj_msgSend(_e6,"modifierFlags"),objj_msgSend(_e6,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_f4<_f5;++_f4){
objj_msgSend(_mouseEnteredStack[_f4],"mouseExited:",_f6);
}
}
_f4=_f3+1;
_f5=_f2.length;
if(_f4<_f5){
var _f6=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseEntered,_e8,objj_msgSend(_e6,"modifierFlags"),objj_msgSend(_e6,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_f4<_f5;++_f4){
objj_msgSend(_f2[_f4],"mouseEntered:",_f6);
}
}
_mouseEnteredStack=_f2;
objj_msgSend(_f0,"mouseMoved:",_e6);
}
}
}),new objj_method(sel_getUid("windowNumber"),function(_f7,_f8){
with(_f7){
return _windowNumber;
}
}),new objj_method(sel_getUid("becomeKeyWindow"),function(_f9,_fa){
with(_f9){
CPApp._keyWindow=_f9;
if(_firstResponder!==_f9&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("becomeKeyWindow"))){
objj_msgSend(_firstResponder,"becomeKeyWindow");
}
objj_msgSend(_f9,"_setupFirstResponder:",nil);
objj_msgSend(_windowView,"noteKeyWindowStateChanged");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidBecomeKeyNotification,_f9);
}
}),new objj_method(sel_getUid("canBecomeKeyWindow"),function(_fb,_fc){
with(_fb){
return YES;
}
}),new objj_method(sel_getUid("isKeyWindow"),function(_fd,_fe){
with(_fd){
return objj_msgSend(CPApp,"keyWindow")==_fd;
}
}),new objj_method(sel_getUid("makeKeyAndOrderFront:"),function(_ff,_100,_101){
with(_ff){
objj_msgSend(_ff,"orderFront:",_ff);
objj_msgSend(_ff,"makeKeyWindow");
objj_msgSend(_ff,"makeMainWindow");
}
}),new objj_method(sel_getUid("makeKeyWindow"),function(self,_102){
with(self){
if(objj_msgSend(CPApp,"keyWindow")===self||!objj_msgSend(self,"canBecomeKeyWindow")){
return;
}
objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"resignKeyWindow");
objj_msgSend(self,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("resignKeyWindow"),function(self,_103){
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
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(self,_104,_105,_106,_107,_108,_109,_10a,_10b){
with(self){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:",_105,self,objj_msgSend(self,"convertBaseToGlobal:",_106),_107,_108,_109,_10a,_10b);
}
}),new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"),function(self,_10c,_10d){
with(self){
if(!_10d){
return;
}
if(!_inclusiveRegisteredDraggedTypes){
_inclusiveRegisteredDraggedTypes=objj_msgSend(CPCountedSet,"set");
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"unionSet:",_10d);
}
}),new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"),function(self,_10e,_10f){
with(self){
if(!_10f){
return;
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"minusSet:",_10f);
if(objj_msgSend(_inclusiveRegisteredDraggedTypes,"count")===0){
_inclusiveRegisteredDraggedTypes=nil;
}
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(self,_110,_111,_112,_113,_114,_115,_116,_117){
with(self){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_111,self,objj_msgSend(self,"convertBaseToGlobal:",_112),_113,_114,_115,_116,_117);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_118,_119){
with(self){
if(!_119){
return;
}
objj_msgSend(self,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_119);
objj_msgSend(self,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(self,_11a){
with(self){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_11b){
with(self){
objj_msgSend(self,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(self,_11c,_11d){
with(self){
if(_isDocumentEdited==_11d){
return;
}
_isDocumentEdited=_11d;
objj_msgSend(CPMenu,"_setMenuBarIconImageAlphaValue:",_isDocumentEdited?0.5:1);
objj_msgSend(_windowView,"setDocumentEdited:",_11d);
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(self,_11e){
with(self){
return _isDocumentEdited;
}
}),new objj_method(sel_getUid("setDocumentSaving:"),function(self,_11f,_120){
with(self){
if(_isDocumentSaving==_120){
return;
}
_isDocumentSaving=_120;
objj_msgSend(self,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"windowDidChangeDocumentSaving");
}
}),new objj_method(sel_getUid("isDocumentSaving"),function(self,_121){
with(self){
return _isDocumentSaving;
}
}),new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"),function(self,_122){
with(self){
if(!objj_msgSend(self,"isMainWindow")){
return;
}
var _123=objj_msgSend(CPApp,"mainMenu"),_124=objj_msgSend(_123,"indexOfItemWithTitle:",_isDocumentSaving?"Save":"Saving...");
if(_124==CPNotFound){
return;
}
var item=objj_msgSend(_123,"itemAtIndex:",_124);
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
}),new objj_method(sel_getUid("performMiniaturize:"),function(self,_125,_126){
with(self){
objj_msgSend(self,"miniaturize:",_126);
}
}),new objj_method(sel_getUid("miniaturize:"),function(self,_127,_128){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillMiniaturizeNotification,self);
objj_msgSend(objj_msgSend(self,"platformWindow"),"miniaturize:",_128);
objj_msgSend(self,"_updateMainAndKeyWindows");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMiniaturizeNotification,self);
_isMiniaturized=YES;
}
}),new objj_method(sel_getUid("deminiaturize:"),function(self,_129,_12a){
with(self){
objj_msgSend(objj_msgSend(self,"platformWindow"),"deminiaturize:",_12a);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidDeminiaturizeNotification,self);
_isMiniaturized=NO;
}
}),new objj_method(sel_getUid("isMiniaturized"),function(self,_12b){
with(self){
return _isMiniaturized;
}
}),new objj_method(sel_getUid("performClose:"),function(self,_12c,_12d){
with(self){
if(!(_styleMask&CPClosableWindowMask)){
return;
}
if(objj_msgSend(self,"isFullBridge")){
var _12e=objj_msgSend(CPApp,"currentEvent");
if(objj_msgSend(_12e,"type")===CPKeyDown&&objj_msgSend(_12e,"characters")==="w"&&(objj_msgSend(_12e,"modifierFlags")&CPPlatformActionKeyMask)){
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
var _12f=objj_msgSend(_windowController,"documents");
if(objj_msgSend(_12f,"count")){
var _130=objj_msgSend(_12f,"indexOfObject:",objj_msgSend(_windowController,"document"));
objj_msgSend(_12f[_130],"shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:",_windowController,self,sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"),{documents:objj_msgSend(_12f,"copy"),visited:0,index:_130});
}else{
objj_msgSend(self,"close");
}
}
}),new objj_method(sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"),function(self,_131,_132,_133,_134){
with(self){
if(_133){
var _135=objj_msgSend(self,"windowController"),_136=_134.documents,_137=objj_msgSend(_136,"count"),_138=++_134.visited,_139=++_134.index%_137;
objj_msgSend(_132,"removeWindowController:",_135);
if(_138<_137){
objj_msgSend(_135,"setDocument:",_136[_139]);
objj_msgSend(_136[_139],"shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:",_windowController,self,sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"),_134);
}else{
objj_msgSend(self,"close");
}
}
}
}),new objj_method(sel_getUid("close"),function(self,_13a){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillCloseNotification,self);
objj_msgSend(self,"orderOut:",nil);
}
}),new objj_method(sel_getUid("isMainWindow"),function(self,_13b){
with(self){
return objj_msgSend(CPApp,"mainWindow")===self;
}
}),new objj_method(sel_getUid("canBecomeMainWindow"),function(self,_13c){
with(self){
if(objj_msgSend(self,"isVisible")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("makeMainWindow"),function(self,_13d){
with(self){
if(objj_msgSend(CPApp,"mainWindow")===self||!objj_msgSend(self,"canBecomeMainWindow")){
return;
}
objj_msgSend(objj_msgSend(CPApp,"mainWindow"),"resignMainWindow");
objj_msgSend(self,"becomeMainWindow");
}
}),new objj_method(sel_getUid("becomeMainWindow"),function(self,_13e){
with(self){
CPApp._mainWindow=self;
objj_msgSend(self,"_synchronizeMenuBarTitleWithWindowTitle");
objj_msgSend(self,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"noteMainWindowStateChanged");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidBecomeMainNotification,self);
}
}),new objj_method(sel_getUid("resignMainWindow"),function(self,_13f){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidResignMainNotification,self);
if(CPApp._mainWindow===self){
CPApp._mainWindow=nil;
}
objj_msgSend(_windowView,"noteMainWindowStateChanged");
}
}),new objj_method(sel_getUid("_updateMainAndKeyWindows"),function(self,_140){
with(self){
var _141=objj_msgSend(CPApp,"orderedWindows"),_142=objj_msgSend(_141,"count");
if(objj_msgSend(self,"isKeyWindow")){
var _143=objj_msgSend(CPApp,"keyWindow");
objj_msgSend(self,"resignKeyWindow");
if(_143&&_143!==self&&objj_msgSend(_143,"canBecomeKeyWindow")){
objj_msgSend(_143,"makeKeyWindow");
}else{
var _144=objj_msgSend(CPApp,"mainMenu"),_145=objj_getClass("_CPMenuBarWindow"),_146;
for(var i=0;i<_142;i++){
var _147=_141[i];
if(objj_msgSend(_147,"isKindOfClass:",_145)){
_146=_147;
}
if(_147===self||_147===_146){
continue;
}
if(objj_msgSend(_147,"isVisible")&&objj_msgSend(_147,"canBecomeKeyWindow")){
objj_msgSend(_147,"makeKeyWindow");
break;
}
}
if(!objj_msgSend(CPApp,"keyWindow")){
objj_msgSend(_146,"makeKeyWindow");
}
}
}
if(objj_msgSend(self,"isMainWindow")){
var _148=objj_msgSend(CPApp,"mainWindow");
objj_msgSend(self,"resignMainWindow");
if(_148&&_148!==self&&objj_msgSend(_148,"canBecomeMainWindow")){
objj_msgSend(_148,"makeMainWindow");
}else{
var _144=objj_msgSend(CPApp,"mainMenu"),_145=objj_getClass("_CPMenuBarWindow"),_146;
for(var i=0;i<_142;i++){
var _147=_141[i];
if(objj_msgSend(_147,"isKindOfClass:",_145)){
_146=_147;
}
if(_147===self||_147===_146){
continue;
}
if(objj_msgSend(_147,"isVisible")&&objj_msgSend(_147,"canBecomeMainWindow")){
objj_msgSend(_147,"makeMainWindow");
break;
}
}
}
}
}
}),new objj_method(sel_getUid("toolbar"),function(self,_149){
with(self){
return _toolbar;
}
}),new objj_method(sel_getUid("setToolbar:"),function(self,_14a,_14b){
with(self){
if(_toolbar===_14b){
return;
}
objj_msgSend(objj_msgSend(_14b,"_window"),"setToolbar:",nil);
objj_msgSend(_toolbar,"_setWindow:",nil);
_toolbar=_14b;
objj_msgSend(_toolbar,"_setWindow:",self);
objj_msgSend(self,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("toggleToolbarShown:"),function(self,_14c,_14d){
with(self){
var _14e=objj_msgSend(self,"toolbar");
objj_msgSend(_14e,"setVisible:",!objj_msgSend(_14e,"isVisible"));
}
}),new objj_method(sel_getUid("_noteToolbarChanged"),function(self,_14f){
with(self){
var _150=CGRectMakeCopy(objj_msgSend(self,"frame")),_151;
objj_msgSend(_windowView,"noteToolbarChanged");
if(_isFullPlatformWindow){
_151=objj_msgSend(_platformWindow,"visibleFrame");
}else{
_151=CGRectMakeCopy(objj_msgSend(self,"frame"));
_151.origin=_150.origin;
}
objj_msgSend(self,"setFrame:",_151);
}
}),new objj_method(sel_getUid("_setFrame:delegate:duration:curve:"),function(self,_152,_153,_154,_155,_156){
with(self){
objj_msgSend(_frameAnimation,"stopAnimation");
_frameAnimation=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",self,_153);
objj_msgSend(_frameAnimation,"setDelegate:",_154);
objj_msgSend(_frameAnimation,"setAnimationCurve:",_156);
objj_msgSend(_frameAnimation,"setDuration:",_155);
objj_msgSend(_frameAnimation,"startAnimation");
}
}),new objj_method(sel_getUid("animationResizeTime:"),function(self,_157,_158){
with(self){
return _9;
}
}),new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"),function(self,_159){
with(self){
var _15a=objj_msgSend(self,"attachedSheet");
var _15b=objj_msgSend(objj_msgSend(self,"contentView"),"frame"),_15c=CGRectMakeCopy(objj_msgSend(_15a,"frame"));
_15c.origin.y=CGRectGetMinY(_frame)+CGRectGetMinY(_15b);
_15c.origin.x=CGRectGetMinX(_frame)+FLOOR((CGRectGetWidth(_frame)-CGRectGetWidth(_15c))/2);
objj_msgSend(_15a,"setFrame:display:animate:",_15c,YES,NO);
}
}),new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"),function(self,_15d,_15e,_15f,_160,_161){
with(self){
if(_sheetContext){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"The target window of beginSheet: already has a sheet, did you forget orderOut: ?");
return;
}
var _162=objj_msgSend(_15e,"frame");
_sheetContext={"sheet":_15e,"modalDelegate":_15f,"endSelector":_160,"contextInfo":_161,"frame":{origin:{x:_162.origin.x,y:_162.origin.y},size:{width:_162.size.width,height:_162.size.height}},"returnCode":-1,"opened":NO};
objj_msgSend(self,"_attachSheetWindow");
}
}),new objj_method(sel_getUid("_attachSheetWindow"),function(self,_163){
with(self){
_sheetContext["isAttached"]=YES;
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,self,sel_getUid("_sheetShouldAnimateIn:"),nil,NO);
}
}),new objj_method(sel_getUid("_endSheet"),function(self,_164){
with(self){
var _165=_sheetContext["modalDelegate"],_166=_sheetContext["endSelector"];
if(_165&&_166){
if(_sheetContext["isAttached"]){
objj_msgSend(_165,_166,_sheetContext["sheet"],_sheetContext["returnCode"],_sheetContext["contextInfo"]);
}else{
_sheetContext["deferDidEndSelector"]=YES;
}
}
}
}),new objj_method(sel_getUid("_detachSheetWindow"),function(self,_167){
with(self){
_sheetContext["isAttached"]=NO;
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,self,sel_getUid("_sheetShouldAnimateOut:"),nil,NO);
}
}),new objj_method(sel_getUid("_cleanupSheetWindow"),function(self,_168){
with(self){
var _169=_sheetContext["sheet"],_16a=_sheetContext["frame"],_16b=_sheetContext["deferDidEndSelector"];
objj_msgSend(_169,"setFrame:",_16a);
objj_msgSend(self,"_restoreMasksForView:",objj_msgSend(_169,"contentView"));
if(_169._isModal){
objj_msgSend(CPApp,"stopModal");
}
objj_msgSend(_169._windowView,"_enableSheet:",NO);
_169._isSheet=NO;
objj_msgSend(_169,"orderOut:",self);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidEndSheetNotification,self);
if(_16b){
var _16c=_sheetContext["modalDelegate"],_16d=_sheetContext["endSelector"],_16e=_sheetContext["returnCode"],_16f=_sheetContext["contextInfo"];
_sheetContext=nil;
_169._parentView=nil;
objj_msgSend(_16c,_16d,_169,_16e,_16f);
}else{
_sheetContext=nil;
_169._parentView=nil;
}
}
}),new objj_method(sel_getUid("animationDidEnd:"),function(self,_170,anim){
with(self){
var _171=_sheetContext["sheet"];
if(anim._window!=_171){
return;
}
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,self,sel_getUid("_sheetAnimationDidEnd:"),nil,NO);
}
}),new objj_method(sel_getUid("_sheetShouldAnimateIn:"),function(self,_172,_173){
with(self){
if(_sheetContext["isOpening"]||_sheetContext["isClosing"]){
return;
}
var _174=_sheetContext["sheet"],_175=objj_msgSend(_174,"frame"),_176=objj_msgSend(self,"frame");
objj_msgSend(self,"_setUpMasksForView:",objj_msgSend(_174,"contentView"));
_174._isSheet=YES;
_174._parentView=self;
var _177=_176.origin.x+FLOOR((_176.size.width-_175.size.width)/2),_178=_176.origin.y+objj_msgSend(objj_msgSend(self,"contentView"),"frame").origin.y,_179=CGRectMake(_177,_178,_175.size.width,0),_17a=CGRectMake(_177,_178,_175.size.width,_175.size.height);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillBeginSheetNotification,self);
_174._isModal=NO;
if(objj_msgSend(CPApp,"modalWindow")===self){
objj_msgSend(CPApp,"runModalForWindow:",_174);
_174._isModal=YES;
}
objj_msgSend(_174,"orderFront:",self);
objj_msgSend(_174,"setFrame:display:animate:",_179,YES,NO);
_sheetContext["opened"]=YES;
_sheetContext["shouldClose"]=NO;
_sheetContext["isOpening"]=YES;
objj_msgSend(_174,"_setFrame:delegate:duration:curve:",_17a,self,objj_msgSend(self,"animationResizeTime:",_17a),CPAnimationEaseOut);
objj_msgSend(_174,"makeKeyWindow");
}
}),new objj_method(sel_getUid("_sheetShouldAnimateOut:"),function(self,_17b,_17c){
with(self){
var _17d=_sheetContext["sheet"],_17e=objj_msgSend(_17d,"frame"),_17f=CGRectMakeCopy(_17e);
if(_sheetContext["isOpening"]){
_sheetContext["shouldClose"]=YES;
return;
}
if(_sheetContext["isClosing"]){
return;
}
_sheetContext["opened"]=NO;
_sheetContext["frame"]=_17e;
_sheetContext["isClosing"]=YES;
if(objj_msgSend(self,"isVisible")){
_17f.size.height=0;
objj_msgSend(self,"_setUpMasksForView:",objj_msgSend(_17d,"contentView"));
objj_msgSend(_17d,"_setFrame:delegate:duration:curve:",_17f,self,objj_msgSend(self,"animationResizeTime:",_17f),CPAnimationEaseIn);
}else{
objj_msgSend(self,"_sheetAnimationDidEnd:",nil);
}
}
}),new objj_method(sel_getUid("_sheetAnimationDidEnd:"),function(self,_180,_181){
with(self){
var _182=_sheetContext["sheet"];
_sheetContext["isOpening"]=NO;
_sheetContext["isClosing"]=NO;
if(_sheetContext["opened"]===YES){
objj_msgSend(self,"_restoreMasksForView:",objj_msgSend(_182,"contentView"));
if(_sheetContext["shouldClose"]===YES){
objj_msgSend(self,"_detachSheetWindow");
}
}else{
objj_msgSend(self,"_cleanupSheetWindow");
}
}
}),new objj_method(sel_getUid("_setUpMasksForView:"),function(self,_183,_184){
with(self){
var _185=objj_msgSend(_184,"subviews");
objj_msgSend(_185,"addObject:",_184);
for(var i=0,_186=objj_msgSend(_185,"count");i<_186;i++){
var view=objj_msgSend(_185,"objectAtIndex:",i),mask=objj_msgSend(view,"autoresizingMask"),_187=(mask&CPViewMinYMargin)?128:CPViewMinYMargin;
objj_msgSend(view,"setAutoresizingMask:",(mask|_187));
}
}
}),new objj_method(sel_getUid("_restoreMasksForView:"),function(self,_188,_189){
with(self){
var _18a=objj_msgSend(_189,"subviews");
objj_msgSend(_18a,"addObject:",_189);
for(var i=0,_18b=objj_msgSend(_18a,"count");i<_18b;i++){
var view=objj_msgSend(_18a,"objectAtIndex:",i),mask=objj_msgSend(view,"autoresizingMask"),_18c=(mask&128)?128:CPViewMinYMargin;
objj_msgSend(view,"setAutoresizingMask:",(mask&(~_18c)));
}
}
}),new objj_method(sel_getUid("attachedSheet"),function(self,_18d){
with(self){
if(_sheetContext===nil){
return nil;
}
return _sheetContext["sheet"];
}
}),new objj_method(sel_getUid("isSheet"),function(self,_18e){
with(self){
return _isSheet;
}
}),new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"),function(self,_18f){
with(self){
return NO;
}
}),new objj_method(sel_getUid("worksWhenModal"),function(self,_190){
with(self){
return NO;
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(self,_191,_192){
with(self){
return objj_msgSend(objj_msgSend(self,"contentView"),"performKeyEquivalent:",_192);
}
}),new objj_method(sel_getUid("keyDown:"),function(self,_193,_194){
with(self){
if(objj_msgSend(_194,"_couldBeKeyEquivalent")&&objj_msgSend(self,"performKeyEquivalent:",_194)){
return;
}
if(!objj_msgSend(self,"_processKeyboardUIKey:",_194)){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow").super_class},"keyDown:",_194);
}
}
}),new objj_method(sel_getUid("_processKeyboardUIKey:"),function(self,_195,_196){
with(self){
var _197=objj_msgSend(_196,"charactersIgnoringModifiers");
if(!objj_msgSend(_a,"containsObject:",_197)){
return NO;
}
var _198=objj_msgSend(CPKeyBinding,"selectorsForKey:modifierFlags:",_197,0);
if(objj_msgSend(_198,"count")<=0){
return NO;
}
if(_197!==CPEscapeFunctionKey){
var _199=objj_msgSend(_198,"objectAtIndex:",0);
return objj_msgSend(objj_msgSend(self,"firstResponder"),"tryToPerform:with:",_199,self);
}else{
objj_msgSend(objj_msgSend(self,"firstResponder"),"doCommandBySelector:",sel_getUid("complete:"));
}
return NO;
}
}),new objj_method(sel_getUid("_dirtyKeyViewLoop"),function(self,_19a){
with(self){
if(_autorecalculatesKeyViewLoop){
_keyViewLoopIsDirty=YES;
}
}
}),new objj_method(sel_getUid("_hasKeyViewLoop"),function(self,_19b){
with(self){
var _19c=_19d(self),_19e=objj_msgSend(_19c,"count");
while(_19e--){
if(objj_msgSend(_19c[_19e],"nextKeyView")){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("recalculateKeyViewLoop"),function(self,_19f){
with(self){
var _1a0=_19d(self);
objj_msgSend(_1a0,"sortUsingFunction:context:",_1a1,nil);
for(var _1a2=0,_1a3=objj_msgSend(_1a0,"count");_1a2<_1a3;++_1a2){
objj_msgSend(_1a0[_1a2],"setNextKeyView:",_1a0[(_1a2+1)%_1a3]);
}
_keyViewLoopIsDirty=NO;
}
}),new objj_method(sel_getUid("setAutorecalculatesKeyViewLoop:"),function(self,_1a4,_1a5){
with(self){
if(_autorecalculatesKeyViewLoop===_1a5){
return;
}
_autorecalculatesKeyViewLoop=_1a5;
if(_autorecalculatesKeyViewLoop){
objj_msgSend(self,"_dirtyKeyViewLoop");
}
}
}),new objj_method(sel_getUid("autorecalculatesKeyViewLoop"),function(self,_1a6){
with(self){
return _autorecalculatesKeyViewLoop;
}
}),new objj_method(sel_getUid("selectNextKeyView:"),function(self,_1a7,_1a8){
with(self){
if(_keyViewLoopIsDirty&&objj_msgSend(self,"autorecalculatesKeyViewLoop")){
objj_msgSend(self,"recalculateKeyViewLoop");
}
var _1a9=nil;
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
_1a9=objj_msgSend(_firstResponder,"nextValidKeyView");
}
if(!_1a9){
var _1aa=_initialFirstResponder;
if(objj_msgSend(_1aa,"acceptsFirstResponder")){
_1a9=_1aa;
}else{
_1a9=objj_msgSend(_1aa,"nextValidKeyView");
}
}
objj_msgSend(self,"makeFirstResponder:",_1a9);
}
}),new objj_method(sel_getUid("selectPreviousKeyView:"),function(self,_1ab,_1ac){
with(self){
if(_keyViewLoopIsDirty&&objj_msgSend(self,"autorecalculatesKeyViewLoop")){
objj_msgSend(self,"recalculateKeyViewLoop");
}
var _1ad=nil;
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
_1ad=objj_msgSend(_firstResponder,"previousValidKeyView");
}
if(!_1ad){
var _1ae=_initialFirstResponder;
if(objj_msgSend(_1ae,"acceptsFirstResponder")){
_1ad=_1ae;
}else{
_1ad=objj_msgSend(_1ae,"previousValidKeyView");
}
}
objj_msgSend(self,"makeFirstResponder:",_1ad);
}
}),new objj_method(sel_getUid("selectKeyViewFollowingView:"),function(self,_1af,_1b0){
with(self){
if(_keyViewLoopIsDirty&&objj_msgSend(self,"autorecalculatesKeyViewLoop")){
objj_msgSend(self,"recalculateKeyViewLoop");
}
var _1b1=objj_msgSend(_1b0,"nextValidKeyView");
if(objj_msgSend(_1b1,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"makeFirstResponder:",_1b1);
}
}
}),new objj_method(sel_getUid("selectKeyViewPrecedingView:"),function(self,_1b2,_1b3){
with(self){
if(_keyViewLoopIsDirty&&objj_msgSend(self,"autorecalculatesKeyViewLoop")){
objj_msgSend(self,"recalculateKeyViewLoop");
}
var _1b4=objj_msgSend(_1b3,"previousValidKeyView");
if(objj_msgSend(_1b4,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"makeFirstResponder:",_1b4);
}
}
}),new objj_method(sel_getUid("setDefaultButtonCell:"),function(self,_1b5,_1b6){
with(self){
objj_msgSend(self,"setDefaultButton:",_1b6);
}
}),new objj_method(sel_getUid("defaultButtonCell"),function(self,_1b7){
with(self){
return objj_msgSend(self,"defaultButton");
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(self,_1b8,_1b9){
with(self){
if(_defaultButton===_1b9){
return;
}
if(objj_msgSend(_defaultButton,"keyEquivalent")===CPCarriageReturnCharacter){
objj_msgSend(_defaultButton,"setKeyEquivalent:",nil);
}
_defaultButton=_1b9;
if(objj_msgSend(_defaultButton,"keyEquivalent")!==CPCarriageReturnCharacter){
objj_msgSend(_defaultButton,"setKeyEquivalent:",CPCarriageReturnCharacter);
}
}
}),new objj_method(sel_getUid("defaultButton"),function(self,_1ba){
with(self){
return _defaultButton;
}
}),new objj_method(sel_getUid("enableKeyEquivalentForDefaultButton"),function(self,_1bb){
with(self){
_defaultButtonEnabled=YES;
}
}),new objj_method(sel_getUid("enableKeyEquivalentForDefaultButtonCell"),function(self,_1bc){
with(self){
objj_msgSend(self,"enableKeyEquivalentForDefaultButton");
}
}),new objj_method(sel_getUid("disableKeyEquivalentForDefaultButton"),function(self,_1bd){
with(self){
_defaultButtonEnabled=NO;
}
}),new objj_method(sel_getUid("disableKeyEquivalentForDefaultButtonCell"),function(self,_1be){
with(self){
objj_msgSend(self,"disableKeyEquivalentForDefaultButton");
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("initialize"),function(self,_1bf){
with(self){
if(self!==objj_msgSend(CPWindow,"class")){
return;
}
var _1c0=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_8=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_1c0,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(16,16));
}
}),new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(self,_1c1,_1c2){
with(self){
if(_1c2&CPHUDBackgroundWindowMask){
return _CPHUDWindowView;
}else{
if(_1c2===CPBorderlessWindowMask){
return _CPBorderlessWindowView;
}else{
if(_1c2&CPDocModalWindowMask){
return _CPDocModalWindowView;
}
}
}
return _CPStandardWindowView;
}
}),new objj_method(sel_getUid("_windowViewClassForFullPlatformWindowStyleMask:"),function(self,_1c3,_1c4){
with(self){
return _CPBorderlessBridgeWindowView;
}
}),new objj_method(sel_getUid("frameRectForContentRect:styleMask:"),function(self,_1c5,_1c6,_1c7){
with(self){
return objj_msgSend(objj_msgSend(objj_msgSend(self,"class"),"_windowViewClassForStyleMask:",_1c7),"frameRectForContentRect:",_1c6);
}
})]);
var _19d=function(_1c8){
var _1c9=objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_1c8,"contentView"));
objj_msgSend(_1c9,"addObjectsFromArray:",objj_msgSend(objj_msgSend(_1c8,"contentView"),"subviews"));
for(var _1ca=1;_1ca<_1c9.length;++_1ca){
_1c9=_1c9.concat(objj_msgSend(_1c9[_1ca],"subviews"));
}
return _1c9;
};
var _1a1=function(lhs,rhs,_1cb){
var _1cc=objj_msgSend(lhs,"convertRect:toView:",objj_msgSend(lhs,"bounds"),nil),_1cd=objj_msgSend(rhs,"convertRect:toView:",objj_msgSend(rhs,"bounds"),nil),lhsY=(_1cc.origin.y),rhsY=(_1cd.origin.y),lhsX=(_1cc.origin.x),rhsX=(_1cd.origin.x),_1ce=MIN((_1cc.origin.y+_1cc.size.height),(_1cd.origin.y+_1cd.size.height))-MAX(lhsY,rhsY);
if(_1ce>0){
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
class_addMethods(_b,[new objj_method(sel_getUid("_synchronizeMenuBarTitleWithWindowTitle"),function(self,_1cf){
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
class_addMethods(_b,[new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"),function(self,_1d0,_1d1){
with(self){
if(objj_msgSend(self,"isFullPlatformWindow")){
return objj_msgSend(self,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}
if(_autoresizingMask==CPWindowNotSizable){
return;
}
var _1d2=objj_msgSend(_platformWindow,"contentBounds"),_1d3=CGRectMakeCopy(_frame),dX=(CGRectGetWidth(_1d2)-_1d1.width)/(((_autoresizingMask&CPWindowMinXMargin)?1:0)+(_autoresizingMask&CPWindowWidthSizable?1:0)+(_autoresizingMask&CPWindowMaxXMargin?1:0)),dY=(CGRectGetHeight(_1d2)-_1d1.height)/((_autoresizingMask&CPWindowMinYMargin?1:0)+(_autoresizingMask&CPWindowHeightSizable?1:0)+(_autoresizingMask&CPWindowMaxYMargin?1:0));
if(_autoresizingMask&CPWindowMinXMargin){
_1d3.origin.x+=dX;
}
if(_autoresizingMask&CPWindowWidthSizable){
_1d3.size.width+=dX;
}
if(_autoresizingMask&CPWindowMinYMargin){
_1d3.origin.y+=dY;
}
if(_autoresizingMask&CPWindowHeightSizable){
_1d3.size.height+=dY;
}
objj_msgSend(self,"setFrame:",_1d3);
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(self,_1d4,_1d5){
with(self){
_autoresizingMask=_1d5;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(self,_1d6){
with(self){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("convertBaseToGlobal:"),function(self,_1d7,_1d8){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertBaseToPlatformWindow:",_1d8):objj_msgSend(self,"convertBaseToScreen:",_1d8);
}
}),new objj_method(sel_getUid("convertGlobalToBase:"),function(self,_1d9,_1da){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertPlatformWindowToBase:",_1da):objj_msgSend(self,"convertScreenToBase:",_1da);
}
}),new objj_method(sel_getUid("convertBaseToPlatformWindow:"),function(self,_1db,_1dc){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return {x:_1dc.x,y:_1dc.y};
}
var _1dd=objj_msgSend(self,"frame").origin;
return {x:_1dc.x+_1dd.x,y:_1dc.y+_1dd.y};
}
}),new objj_method(sel_getUid("convertPlatformWindowToBase:"),function(self,_1de,_1df){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return {x:_1df.x,y:_1df.y};
}
var _1e0=objj_msgSend(self,"frame").origin;
return {x:_1df.x-_1e0.x,y:_1df.y-_1e0.y};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(self,_1e1,_1e2){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",objj_msgSend(_platformWindow,"convertScreenToBase:",_1e2));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(self,_1e3,_1e4){
with(self){
return objj_msgSend(_platformWindow,"convertBaseToScreen:",objj_msgSend(self,"convertBaseToPlatformWindow:",_1e4));
}
}),new objj_method(sel_getUid("_setSharesChromeWithPlatformWindow:"),function(self,_1e5,_1e6){
with(self){
if(_1e6&&objj_msgSend(CPPlatform,"isBrowser")){
return;
}
_sharesChromeWithPlatformWindow=_1e6;
objj_msgSend(self,"_updateShadow");
}
}),new objj_method(sel_getUid("_sharesChromeWithPlatformWindow"),function(self,_1e7){
with(self){
return _sharesChromeWithPlatformWindow;
}
}),new objj_method(sel_getUid("undoManager"),function(self,_1e8){
with(self){
if(_undoManager){
return _undoManager;
}
var _1e9=objj_msgSend(objj_msgSend(_windowController,"document"),"undoManager");
if(_1e9){
return _1e9;
}
if(_delegateRespondsToWindowWillReturnUndoManagerSelector){
return objj_msgSend(_delegate,"windowWillReturnUndoManager:",self);
}
if(!_undoManager){
_undoManager=objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init");
}
return _undoManager;
}
}),new objj_method(sel_getUid("undo:"),function(self,_1ea,_1eb){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"undo");
}
}),new objj_method(sel_getUid("redo:"),function(self,_1ec,_1ed){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"redo");
}
}),new objj_method(sel_getUid("containsPoint:"),function(self,_1ee,_1ef){
with(self){
return CGRectContainsPoint(_frame,_1ef);
}
})]);
var _b=objj_getClass("CPWindow");
if(!_b){
throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("setFullBridge:"),function(self,_1f0,_1f1){
with(self){
objj_msgSend(self,"setFullPlatformWindow:",_1f1);
}
}),new objj_method(sel_getUid("isFullBridge"),function(self,_1f2){
with(self){
return objj_msgSend(self,"isFullPlatformWindow");
}
}),new objj_method(sel_getUid("convertBaseToBridge:"),function(self,_1f3,_1f4){
with(self){
return objj_msgSend(self,"convertBaseToPlatformWindow:",_1f4);
}
}),new objj_method(sel_getUid("convertBridgeToBase:"),function(self,_1f5,_1f6){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",_1f6);
}
})]);
var _1f7=function(_1f8,_1f9,_1fa){
return _1f8+(_1f9-_1f8)*_1fa;
};
var _b=objj_allocateClassPair(CPAnimation,"_CPWindowFrameAnimation"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_window"),new objj_ivar("_startFrame"),new objj_ivar("_targetFrame")]);
objj_registerClassPair(_b);
class_addMethods(_b,[new objj_method(sel_getUid("initWithWindow:targetFrame:"),function(self,_1fb,_1fc,_1fd){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPWindowFrameAnimation").super_class},"initWithDuration:animationCurve:",objj_msgSend(_1fc,"animationResizeTime:",_1fd),CPAnimationLinear);
if(self){
_window=_1fc;
_targetFrame=CGRectMakeCopy(_1fd);
_startFrame=CGRectMakeCopy(objj_msgSend(_window,"frame"));
}
return self;
}
}),new objj_method(sel_getUid("startAnimation"),function(self,_1fe){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPWindowFrameAnimation").super_class},"startAnimation");
_window._isAnimating=YES;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(self,_1ff,_200){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPWindowFrameAnimation").super_class},"setCurrentProgress:",_200);
var _201=objj_msgSend(self,"currentValue");
if(_201==1){
_window._isAnimating=NO;
}
var _202=CGRectMake(_1f7(CGRectGetMinX(_startFrame),CGRectGetMinX(_targetFrame),_201),_1f7(CGRectGetMinY(_startFrame),CGRectGetMinY(_targetFrame),_201),_1f7(CGRectGetWidth(_startFrame),CGRectGetWidth(_targetFrame),_201),_1f7(CGRectGetHeight(_startFrame),CGRectGetHeight(_targetFrame),_201));
objj_msgSend(_window,"setFrame:display:animate:",_202,YES,NO);
}
})]);
_CPWindowFullPlatformWindowSessionMake=function(_203,_204,_205,_206){
return {windowView:_203,contentRect:_204,hasShadow:_205,level:_206};
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
