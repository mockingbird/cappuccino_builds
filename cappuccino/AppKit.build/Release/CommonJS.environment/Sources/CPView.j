@STATIC;1.0;I;20;Foundation/CPArray.jI;23;Foundation/CPGeometry.jI;26;Foundation/CPObjJRuntime.jI;18;Foundation/CPSet.ji;19;CGAffineTransform.ji;9;CPColor.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.ji;18;_CPDisplayServer.jt;52669;
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPGeometry.j",NO);
objj_executeFile("Foundation/CPObjJRuntime.j",NO);
objj_executeFile("Foundation/CPSet.j",NO);
objj_executeFile("CGAffineTransform.j",YES);
objj_executeFile("CPColor.j",YES);
objj_executeFile("CPGraphicsContext.j",YES);
objj_executeFile("CPResponder.j",YES);
objj_executeFile("CPTheme.j",YES);
objj_executeFile("_CPDisplayServer.j",YES);
CPViewNotSizable=0;
CPViewMinXMargin=1;
CPViewWidthSizable=2;
CPViewMaxXMargin=4;
CPViewMinYMargin=8;
CPViewHeightSizable=16;
CPViewMaxYMargin=32;
CPViewBoundsDidChangeNotification="CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification="CPViewFrameDidChangeNotification";
var _1=nil,_2=nil;
var _3={},_4=1<<0,_5=1<<1;
var _6,_7,_8=1;
var _9=objj_allocateClassPair(CPResponder,"CPView"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_clipsToBounds"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_inLiveResize"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeClass"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView"),new objj_ivar("_viewClassFlags"),new objj_ivar("_toolTip"),new objj_ivar("_toolTipFunctionIn"),new objj_ivar("_toolTipFunctionOut"),new objj_ivar("_toolTipInstalled")]);
objj_registerClassPair(_9);
class_addMethods(_9,[new objj_method(sel_getUid("toolTip"),function(_b,_c){
with(_b){
return _toolTip;
}
}),new objj_method(sel_getUid("_setToolTip:"),function(_d,_e,_f){
with(_d){
_toolTip=_f;
}
}),new objj_method(sel_getUid("_setupViewFlags"),function(_10,_11){
with(_10){
var _12=objj_msgSend(_10,"class"),_13=objj_msgSend(_12,"UID");
if(_3[_13]===undefined){
var _14=0;
if(objj_msgSend(_12,"instanceMethodForSelector:",sel_getUid("drawRect:"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"))){
_14|=_4;
}
if(objj_msgSend(_12,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))){
_14|=_5;
}
_3[_13]=_14;
}
_viewClassFlags=_3[_13];
}
}),new objj_method(sel_getUid("_setupToolTipHandlers"),function(_15,_16){
with(_15){
_toolTipInstalled=NO;
_toolTipFunctionIn=function(e){
objj_msgSend(_15,"_fireToolTip");
};
_toolTipFunctionOut=function(e){
objj_msgSend(_15,"_invalidateToolTip");
};
}
}),new objj_method(sel_getUid("init"),function(_17,_18){
with(_17){
return objj_msgSend(_17,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_19,_1a,_1b){
with(_19){
_19=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("CPView").super_class},"init");
if(_19){
var _1c=(_1b.size.width),_1d=(_1b.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_1b.origin.x,y:_1b.origin.y},size:{width:_1b.size.width,height:_1b.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_1c,height:_1d}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_clipsToBounds=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_19,"_setupToolTipHandlers");
objj_msgSend(_19,"_setupViewFlags");
objj_msgSend(_19,"_loadThemeAttributes");
}
return _19;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_1e,_1f,_20){
with(_1e){
if(_toolTip==_20){
return;
}
_toolTip=_20;
if(_toolTip){
objj_msgSend(_1e,"_installToolTipEventHandlers");
}else{
objj_msgSend(_1e,"_uninstallToolTipEventHandlers");
}
}
}),new objj_method(sel_getUid("_installToolTipEventHandlers"),function(_21,_22){
with(_21){
if(_toolTipInstalled){
return;
}
_toolTipInstalled=YES;
}
}),new objj_method(sel_getUid("_uninstallToolTipEventHandlers"),function(_23,_24){
with(_23){
if(!_toolTipInstalled){
return;
}
_toolTipInstalled=NO;
}
}),new objj_method(sel_getUid("_fireToolTip"),function(_25,_26){
with(_25){
if(_7){
objj_msgSend(_7,"invalidate");
if(_6){
objj_msgSend(_6,"close");
}
_6=nil;
}
if(_toolTip){
_7=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_8,_25,sel_getUid("_showToolTip:"),nil,NO);
}
}
}),new objj_method(sel_getUid("_invalidateToolTip"),function(_27,_28){
with(_27){
if(_7){
objj_msgSend(_7,"invalidate");
_7=nil;
}
if(_6){
objj_msgSend(_6,"close");
_6=nil;
}
}
}),new objj_method(sel_getUid("_showToolTip:"),function(_29,_2a,_2b){
with(_29){
if(_6){
objj_msgSend(_6,"close");
}
_6=objj_msgSend(_CPToolTip,"toolTipWithString:",_toolTip);
}
}),new objj_method(sel_getUid("superview"),function(_2c,_2d){
with(_2c){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_subviews,"copy");
}
}),new objj_method(sel_getUid("window"),function(_30,_31){
with(_30){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_32,_33,_34){
with(_32){
objj_msgSend(_32,"_insertSubview:atIndex:",_34,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_35,_36,_37,_38,_39){
with(_35){
var _3a=_39?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_39):CPNotFound;
if(_3a===CPNotFound){
_3a=(_38===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_38===CPWindowAbove){
++_3a;
}
}
objj_msgSend(_35,"_insertSubview:atIndex:",_37,_3a);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_3b,_3c,_3d,_3e){
with(_3b){
if(_3d===_3b){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"can't add a view as a subview of itself");
}
var _3f=_subviews.length;
objj_msgSend(objj_msgSend(_3b,"window"),"_dirtyKeyViewLoop");
if(_3d._superview==_3b){
var _40=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_3d);
if(_40===_3e||_40===_3f-1&&_3e===_3f){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_40);
if(_3e>_40){
--_3e;
}
--_3f;
}else{
objj_msgSend(_3d,"removeFromSuperview");
objj_msgSend(_3d,"_setWindow:",_window);
objj_msgSend(_3d,"viewWillMoveToSuperview:",_3b);
_3d._superview=_3b;
}
if(_3e===CPNotFound||_3e>=_3f){
_subviews.push(_3d);
}else{
_subviews.splice(_3e,0,_3d);
}
objj_msgSend(_3d,"setNextResponder:",_3b);
objj_msgSend(_3d,"viewDidMoveToSuperview");
objj_msgSend(_3b,"didAddSubview:",_3d);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_41,_42,_43){
with(_41){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_44,_45){
with(_44){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_44,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_44);
objj_msgSend(_superview._subviews,"removeObject:",_44);
_superview=nil;
objj_msgSend(_44,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_46,_47,_48,_49){
with(_46){
if(_48._superview!==_46){
return;
}
var _4a=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_48);
objj_msgSend(_48,"removeFromSuperview");
objj_msgSend(_46,"_insertSubview:atIndex:",_49,_4a);
}
}),new objj_method(sel_getUid("setSubviews:"),function(_4b,_4c,_4d){
with(_4b){
if(!_4d){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"newSubviews cannot be nil in -[CPView setSubviews:]");
}
if(objj_msgSend(_subviews,"isEqual:",_4d)){
return;
}
if(objj_msgSend(_subviews,"count")===0){
var _4e=0,_4f=objj_msgSend(_4d,"count");
for(;_4e<_4f;++_4e){
objj_msgSend(_4b,"addSubview:",_4d[_4e]);
}
return;
}
if(objj_msgSend(_4d,"count")===0){
var _4f=objj_msgSend(_subviews,"count");
while(_4f--){
objj_msgSend(_subviews[_4f],"removeFromSuperview");
}
return;
}
var _50=objj_msgSend(CPMutableSet,"setWithArray:",_subviews);
objj_msgSend(_50,"removeObjectsInArray:",_4d);
objj_msgSend(_50,"makeObjectsPerformSelector:",sel_getUid("removeFromSuperview"));
var _51=objj_msgSend(CPMutableSet,"setWithArray:",_4d);
objj_msgSend(_51,"removeObjectsInArray:",_subviews);
var _52=nil,_53=objj_msgSend(_51,"objectEnumerator");
while((_52=objj_msgSend(_53,"nextObject"))!==nil){
objj_msgSend(_4b,"addSubview:",_52);
}
if(objj_msgSend(_subviews,"isEqual:",_4d)){
return;
}
_subviews=objj_msgSend(_4d,"copy");
}
}),new objj_method(sel_getUid("_setWindow:"),function(_54,_55,_56){
with(_54){
if(_window===_56){
return;
}
objj_msgSend(objj_msgSend(_54,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_54){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_54,"viewWillMoveToWindow:",_56);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_56,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_56;
var _57=objj_msgSend(_subviews,"count");
while(_57--){
objj_msgSend(_subviews[_57],"_setWindow:",_56);
}
objj_msgSend(_54,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_54,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_58,_59,_5a){
with(_58){
var _5b=_58;
do{
if(_5b==_5a){
return YES;
}
}while(_5b=objj_msgSend(_5b,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_5c,_5d){
with(_5c){
objj_msgSend(_5c,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_5e,_5f){
with(_5e){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_60,_61,_62){
with(_60){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_63,_64,_65){
with(_63){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_66,_67,_68){
with(_66){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_69,_6a){
with(_69){
var _6b=_69;
while(_6b&&!objj_msgSend(_6b,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_6b=objj_msgSend(_6b,"superview");
}
if(_6b){
return _6b._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_6c,_6d,_6e){
with(_6c){
_tag=_6e;
}
}),new objj_method(sel_getUid("tag"),function(_6f,_70){
with(_6f){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_71,_72,_73){
with(_71){
if(objj_msgSend(_71,"tag")==_73){
return _71;
}
var _74=0,_75=_subviews.length;
for(;_74<_75;++_74){
var _76=objj_msgSend(_subviews[_74],"viewWithTag:",_73);
if(_76){
return _76;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_77,_78){
with(_77){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_79,_7a,_7b){
with(_79){
if(((_frame.origin.x==_7b.origin.x&&_frame.origin.y==_7b.origin.y)&&(_frame.size.width==_7b.size.width&&_frame.size.height==_7b.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_79,"setFrameOrigin:",_7b.origin);
objj_msgSend(_79,"setFrameSize:",_7b.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_79);
}
}
}),new objj_method(sel_getUid("frame"),function(_7c,_7d){
with(_7c){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("frameOrigin"),function(_7e,_7f){
with(_7e){
return {x:_frame.origin.x,y:_frame.origin.y};
}
}),new objj_method(sel_getUid("frameSize"),function(_80,_81){
with(_80){
return {width:_frame.size.width,height:_frame.size.height};
}
}),new objj_method(sel_getUid("setCenter:"),function(_82,_83,_84){
with(_82){
objj_msgSend(_82,"setFrameOrigin:",CGPointMake(_84.x-_frame.size.width/2,_84.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_85,_86){
with(_85){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_87,_88,_89){
with(_87){
var _8a=_frame.origin;
if(!_89||(_8a.x==_89.x&&_8a.y==_89.y)){
return;
}
_8a.x=_89.x;
_8a.y=_89.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_87);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_8b,_8c,_8d){
with(_8b){
var _8e=_frame.size;
if(!_8d||(_8e.width==_8d.width&&_8e.height==_8d.height)){
return;
}
var _8f={width:_8e.width,height:_8e.height};
_8e.width=_8d.width;
_8e.height=_8d.height;
if(YES){
_bounds.size.width=_8d.width;
_bounds.size.height=_8d.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_8b,"resizeSubviewsWithOldSize:",_8f);
}
objj_msgSend(_8b,"setNeedsLayout");
objj_msgSend(_8b,"setNeedsDisplay:",YES);
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_8b);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_90,_91,_92){
with(_90){
if(((_bounds.origin.x==_92.origin.x&&_bounds.origin.y==_92.origin.y)&&(_bounds.size.width==_92.size.width&&_bounds.size.height==_92.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_90,"setBoundsOrigin:",_92.origin);
objj_msgSend(_90,"setBoundsSize:",_92.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_90);
}
}
}),new objj_method(sel_getUid("bounds"),function(_93,_94){
with(_93){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("boundsOrigin"),function(_95,_96){
with(_95){
return {x:_bounds.origin.x,y:_bounds.origin.y};
}
}),new objj_method(sel_getUid("boundsSize"),function(_97,_98){
with(_97){
return {width:_bounds.size.width,height:_bounds.size.height};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_99,_9a,_9b){
with(_99){
var _9c=_bounds.origin;
if((_9c.x==_9b.x&&_9c.y==_9b.y)){
return;
}
_9c.x=_9b.x;
_9c.y=_9b.y;
if(_9c.x!=0||_9c.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_9c.x,ty:-_9c.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_99);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_9d,_9e,_9f){
with(_9d){
var _a0=_bounds.size;
if((_a0.width==_9f.width&&_a0.height==_9f.height)){
return;
}
var _a1=_frame.size;
if(!(_a0.width==_a1.width&&_a0.height==_a1.height)){
var _a2=_bounds.origin;
_a2.x/=_a0.width/_a1.width;
_a2.y/=_a0.height/_a1.height;
}
_a0.width=_9f.width;
_a0.height=_9f.height;
if(!(_a0.width==_a1.width&&_a0.height==_a1.height)){
var _a2=_bounds.origin;
_a2.x*=_a0.width/_a1.width;
_a2.y*=_a0.height/_a1.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_9d);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_a3,_a4,_a5){
with(_a3){
var _a6=objj_msgSend(_a3,"autoresizingMask");
if(_a6==CPViewNotSizable){
return;
}
var _a7=_superview._frame,_a8={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_a7.size.width)-_a5.width)/(((_a6&CPViewMinXMargin)?1:0)+(_a6&CPViewWidthSizable?1:0)+(_a6&CPViewMaxXMargin?1:0)),dY=((_a7.size.height)-_a5.height)/((_a6&CPViewMinYMargin?1:0)+(_a6&CPViewHeightSizable?1:0)+(_a6&CPViewMaxYMargin?1:0));
if(_a6&CPViewMinXMargin){
_a8.origin.x+=dX;
}
if(_a6&CPViewWidthSizable){
_a8.size.width+=dX;
}
if(_a6&CPViewMinYMargin){
_a8.origin.y+=dY;
}
if(_a6&CPViewHeightSizable){
_a8.size.height+=dY;
}
objj_msgSend(_a3,"setFrame:",_a8);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_a9,_aa,_ab){
with(_a9){
var _ac=_subviews.length;
while(_ac--){
objj_msgSend(_subviews[_ac],"resizeWithOldSuperviewSize:",_ab);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_ad,_ae,_af){
with(_ad){
_autoresizesSubviews=!!_af;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_b0,_b1){
with(_b0){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_b2,_b3,_b4){
with(_b2){
_autoresizingMask=_b4;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_b5,_b6){
with(_b5){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_b7,_b8){
with(_b7){
return objj_msgSend(_b7,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_b9,_ba,_bb,_bc){
with(_b9){
_fullScreenModeState=_bd(_b9);
var _be=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_be,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_be,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _bf=objj_msgSend(_be,"contentView");
objj_msgSend(_bf,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_bf,"addSubview:",_b9);
objj_msgSend(_b9,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_b9,"setFrame:",CGRectMakeCopy(objj_msgSend(_bf,"bounds")));
objj_msgSend(_be,"makeKeyAndOrderFront:",_b9);
objj_msgSend(_be,"makeFirstResponder:",_b9);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_c0,_c1){
with(_c0){
objj_msgSend(_c0,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_c2,_c3,_c4){
with(_c2){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_c2,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_c2,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_c2,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_c2,"window"),"orderOut:",_c2);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_c5,_c6){
with(_c5){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_c7,_c8,_c9){
with(_c7){
_c9=!!_c9;
if(_isHidden===_c9){
return;
}
_isHidden=_c9;
if(_c9){
var _ca=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_ca,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_c7==_ca){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_c7,"nextValidKeyView"));
break;
}
}while(_ca=objj_msgSend(_ca,"superview"));
}
objj_msgSend(_c7,"_notifyViewDidHide");
}else{
objj_msgSend(_c7,"_notifyViewDidUnhide");
}
}
}),new objj_method(sel_getUid("_notifyViewDidHide"),function(_cb,_cc){
with(_cb){
objj_msgSend(_cb,"viewDidHide");
var _cd=objj_msgSend(_subviews,"count");
while(_cd--){
objj_msgSend(_subviews[_cd],"_notifyViewDidHide");
}
}
}),new objj_method(sel_getUid("_notifyViewDidUnhide"),function(_ce,_cf){
with(_ce){
objj_msgSend(_ce,"viewDidUnhide");
var _d0=objj_msgSend(_subviews,"count");
while(_d0--){
objj_msgSend(_subviews[_d0],"_notifyViewDidUnhide");
}
}
}),new objj_method(sel_getUid("isHidden"),function(_d1,_d2){
with(_d1){
return _isHidden;
}
}),new objj_method(sel_getUid("setClipsToBounds:"),function(_d3,_d4,_d5){
with(_d3){
if(_clipsToBounds===_d5){
return;
}
_clipsToBounds=_d5;
}
}),new objj_method(sel_getUid("clipsToBounds"),function(_d6,_d7){
with(_d6){
return _clipsToBounds;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_d8,_d9,_da){
with(_d8){
if(_opacity==_da){
return;
}
_opacity=_da;
}
}),new objj_method(sel_getUid("alphaValue"),function(_db,_dc){
with(_db){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_dd,_de){
with(_dd){
var _df=_dd;
while(_df&&!objj_msgSend(_df,"isHidden")){
_df=objj_msgSend(_df,"superview");
}
return _df!==nil;
}
}),new objj_method(sel_getUid("_isVisible"),function(_e0,_e1){
with(_e0){
return !objj_msgSend(_e0,"isHiddenOrHasHiddenAncestor")&&objj_msgSend(objj_msgSend(_e0,"window"),"isVisible");
}
}),new objj_method(sel_getUid("viewDidHide"),function(_e2,_e3){
with(_e2){
}
}),new objj_method(sel_getUid("viewDidUnhide"),function(_e4,_e5){
with(_e4){
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_e6,_e7,_e8){
with(_e6){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_e9,_ea){
with(_e9){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_eb,_ec,_ed){
with(_eb){
_hitTests=!!_ed;
}
}),new objj_method(sel_getUid("hitTest:"),function(_ee,_ef,_f0){
with(_ee){
if(_isHidden||!_hitTests||!(_f0.x>=(_frame.origin.x)&&_f0.y>=(_frame.origin.y)&&_f0.x<(_frame.origin.x+_frame.size.width)&&_f0.y<(_frame.origin.y+_frame.size.height))){
return nil;
}
var _f1=nil,i=_subviews.length,_f2={x:_f0.x-(_frame.origin.x),y:_f0.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_f2={x:_f2.x*_inverseBoundsTransform.a+_f2.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_f2.x*_inverseBoundsTransform.b+_f2.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_f1=objj_msgSend(_subviews[i],"hitTest:",_f2)){
return _f1;
}
}
return _ee;
}
}),new objj_method(sel_getUid("needsPanelToBecomeKey"),function(_f3,_f4){
with(_f3){
return NO;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_f5,_f6){
with(_f5){
return !objj_msgSend(_f5,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_f7,_f8,_f9){
with(_f7){
if(objj_msgSend(_f7,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_f7,super_class:objj_getClass("CPView").super_class},"mouseDown:",_f9);
}
}
}),new objj_method(sel_getUid("rightMouseDown:"),function(_fa,_fb,_fc){
with(_fa){
var _fd=objj_msgSend(_fa,"menuForEvent:",_fc);
if(_fd){
objj_msgSend(CPMenu,"popUpContextMenu:withEvent:forView:",_fd,_fc,_fa);
}else{
if(objj_msgSend(objj_msgSend(_fa,"nextResponder"),"isKindOfClass:",CPView)){
objj_msgSendSuper({receiver:_fa,super_class:objj_getClass("CPView").super_class},"rightMouseDown:",_fc);
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_fc,"window"),"platformWindow"),"_propagateContextMenuDOMEvent:",YES);
}
}
}
}),new objj_method(sel_getUid("menuForEvent:"),function(_fe,_ff,_100){
with(_fe){
return objj_msgSend(_fe,"menu")||objj_msgSend(objj_msgSend(_fe,"class"),"defaultMenu");
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(self,_101,_102){
with(self){
if(_backgroundColor==_102){
return;
}
if(_102==objj_msgSend(CPNull,"null")){
_102=nil;
}
_backgroundColor=_102;
}
}),new objj_method(sel_getUid("backgroundColor"),function(self,_103){
with(self){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(self,_104,_105,_106){
with(self){
return CGPointApplyAffineTransform(_105,_107(_106,self));
}
}),new objj_method(sel_getUid("convertPointFromBase:"),function(self,_108,_109){
with(self){
return CGPointApplyAffineTransform(_109,_107(nil,self));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(self,_10a,_10b,_10c){
with(self){
return CGPointApplyAffineTransform(_10b,_107(self,_10c));
}
}),new objj_method(sel_getUid("convertPointToBase:"),function(self,_10d,_10e){
with(self){
return CGPointApplyAffineTransform(_10e,_107(self,nil));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(self,_10f,_110,_111){
with(self){
return CGSizeApplyAffineTransform(_110,_107(_111,self));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(self,_112,_113,_114){
with(self){
return CGSizeApplyAffineTransform(_113,_107(self,_114));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(self,_115,_116,_117){
with(self){
return CGRectApplyAffineTransform(_116,_107(_117,self));
}
}),new objj_method(sel_getUid("convertRectFromBase:"),function(self,_118,_119){
with(self){
return CGRectApplyAffineTransform(_119,_107(nil,self));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(self,_11a,_11b,_11c){
with(self){
return CGRectApplyAffineTransform(_11b,_107(self,_11c));
}
}),new objj_method(sel_getUid("convertRectToBase:"),function(self,_11d,_11e){
with(self){
return CGRectApplyAffineTransform(_11e,_107(self,nil));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(self,_11f,_120){
with(self){
_120=!!_120;
if(_postsFrameChangedNotifications===_120){
return;
}
_postsFrameChangedNotifications=_120;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,self);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(self,_121){
with(self){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(self,_122,_123){
with(self){
_123=!!_123;
if(_postsBoundsChangedNotifications===_123){
return;
}
_postsBoundsChangedNotifications=_123;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,self);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(self,_124){
with(self){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(self,_125,_126,_127,_128,_129,_12a,_12b,_12c){
with(self){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_126,objj_msgSend(self,"convertPoint:toView:",_127,nil),_128,_129,_12a,_12b,_12c);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(self,_12d,_12e,_12f,_130,_131,_132,_133,_134){
with(self){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_12e,objj_msgSend(self,"convertPoint:toView:",_12f,nil),_130,_131,_132,_133,_134);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_135,_136){
with(self){
if(!_136||!objj_msgSend(_136,"count")){
return;
}
var _137=objj_msgSend(self,"window");
objj_msgSend(_137,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_136);
objj_msgSend(_137,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(self,_138){
with(self){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_139){
with(self){
objj_msgSend(objj_msgSend(self,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_13a,_13b){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_13c,_13d){
with(self){
if(_13d){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_13e,_13f){
with(self){
if(!(_viewClassFlags&_4)){
return;
}
if((_13f.size.width<=0||_13f.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_13f,_dirtyRect);
}else{
_dirtyRect={origin:{x:_13f.origin.x,y:_13f.origin.y},size:{width:_13f.size.width,height:_13f.size.height}};
}
_CPDisplayServerAddDisplayObject(self);
}
}),new objj_method(sel_getUid("needsDisplay"),function(self,_140){
with(self){
return _dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0);
}
}),new objj_method(sel_getUid("displayIfNeeded"),function(self,_141){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_dirtyRect);
}
}
}),new objj_method(sel_getUid("display"),function(self,_142){
with(self){
objj_msgSend(self,"displayRect:",objj_msgSend(self,"visibleRect"));
}
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_143,_144){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_144);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_145,_146){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_146,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_147,_148,_149){
with(self){
if(objj_msgSend(self,"isHidden")){
return;
}
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_14a){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_14b){
with(self){
if(!_graphicsContext){
var _14c=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_14c.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_frame.size.width));
_DOMContentsElement.height=ROUND((_frame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_frame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_frame.size.height))+"px";
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_14c,YES);
}
objj_msgSend(CPGraphicsContext,"setCurrentContext:",_graphicsContext);
CGContextSaveGState(objj_msgSend(_graphicsContext,"graphicsPort"));
}
}),new objj_method(sel_getUid("unlockFocus"),function(self,_14d){
with(self){
CGContextRestoreGState(objj_msgSend(_graphicsContext,"graphicsPort"));
objj_msgSend(CPGraphicsContext,"setCurrentContext:",nil);
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(self,_14e){
with(self){
if(!(_viewClassFlags&_5)){
return;
}
_needsLayout=YES;
_CPDisplayServerAddLayoutObject(self);
}
}),new objj_method(sel_getUid("layoutIfNeeded"),function(self,_14f){
with(self){
if(_needsLayout){
_needsLayout=NO;
objj_msgSend(self,"layoutSubviews");
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_150){
with(self){
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_151){
with(self){
return NO;
}
}),new objj_method(sel_getUid("visibleRect"),function(self,_152){
with(self){
if(!_superview){
return _bounds;
}
return CGRectIntersection(objj_msgSend(self,"convertRect:fromView:",objj_msgSend(_superview,"visibleRect"),_superview),_bounds);
}
}),new objj_method(sel_getUid("_enclosingClipView"),function(self,_153){
with(self){
var _154=_superview,_155=objj_msgSend(CPClipView,"class");
while(_154&&!objj_msgSend(_154,"isKindOfClass:",_155)){
_154=_154._superview;
}
return _154;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_156,_157){
with(self){
var _158=objj_msgSend(self,"_enclosingClipView");
if(!_158){
return;
}
objj_msgSend(_158,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_157,_158));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_159,_15a){
with(self){
var _15b=objj_msgSend(self,"visibleRect");
_15a=CGRectIntersection(_15a,_bounds);
if((_15a.size.width<=0||_15a.size.height<=0)||CGRectContainsRect(_15b,_15a)){
return NO;
}
var _15c=objj_msgSend(self,"_enclosingClipView");
if(!_15c){
return NO;
}
var _15d={x:_15b.origin.x,y:_15b.origin.y};
if((_15a.origin.x)<=(_15b.origin.x)){
_15d.x=(_15a.origin.x);
}else{
if((_15a.origin.x+_15a.size.width)>(_15b.origin.x+_15b.size.width)){
_15d.x+=(_15a.origin.x+_15a.size.width)-(_15b.origin.x+_15b.size.width);
}
}
if((_15a.origin.y)<=(_15b.origin.y)){
_15d.y=CGRectGetMinY(_15a);
}else{
if((_15a.origin.y+_15a.size.height)>(_15b.origin.y+_15b.size.height)){
_15d.y+=(_15a.origin.y+_15a.size.height)-(_15b.origin.y+_15b.size.height);
}
}
objj_msgSend(_15c,"scrollToPoint:",CGPointMake(_15d.x,_15d.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_15e,_15f){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_15f);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_160,_161){
with(self){
return _161;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_162,_163,_164){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_165){
with(self){
var _166=_superview,_167=objj_msgSend(CPScrollView,"class");
while(_166&&!objj_msgSend(_166,"isKindOfClass:",_167)){
_166=_166._superview;
}
return _166;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_168,_169,_16a){
with(self){
objj_msgSend(_169,"scrollToPoint:",_16a);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_16b,_16c){
with(self){
}
}),new objj_method(sel_getUid("inLiveResize"),function(self,_16d){
with(self){
return _inLiveResize;
}
}),new objj_method(sel_getUid("viewWillStartLiveResize"),function(self,_16e){
with(self){
_inLiveResize=YES;
}
}),new objj_method(sel_getUid("viewDidEndLiveResize"),function(self,_16f){
with(self){
_inLiveResize=NO;
}
})]);
class_addMethods(_a,[new objj_method(sel_getUid("initialize"),function(self,_170){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"),function(self,_171){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","frameOrigin","frameSize");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingBounds"),function(self,_172){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","boundsOrigin","boundsSize");
}
}),new objj_method(sel_getUid("defaultMenu"),function(self,_173){
with(self){
return nil;
}
})]);
var _9=objj_getClass("CPView");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("performKeyEquivalent:"),function(self,_174,_175){
with(self){
var _176=objj_msgSend(_subviews,"count");
while(_176--){
if(objj_msgSend(_subviews[_176],"performKeyEquivalent:",_175)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("canBecomeKeyView"),function(self,_177){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_178){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_179){
with(self){
var _17a=objj_msgSend(self,"nextKeyView"),_17b=_17a;
while(_17a&&!objj_msgSend(_17a,"canBecomeKeyView")){
_17a=objj_msgSend(_17a,"nextKeyView");
if(_17a===_17b){
return nil;
}
}
return _17a;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_17c){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_17d){
with(self){
var _17e=objj_msgSend(self,"previousKeyView"),_17f=_17e;
while(_17e&&!objj_msgSend(_17e,"canBecomeKeyView")){
_17e=objj_msgSend(_17e,"previousKeyView");
if(_17e===_17f){
return nil;
}
}
return _17e;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_180,_181){
with(self){
if(objj_msgSend(_181,"isEqual:",self)){
_previousKeyView=nil;
}else{
_previousKeyView=_181;
}
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_182,next){
with(self){
if(objj_msgSend(next,"isEqual:",self)){
_nextKeyView=nil;
}else{
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
}
})]);
var _9=objj_getClass("CPView");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("setLayer:"),function(self,_183,_184){
with(self){
if(_layer==_184){
return;
}
if(_layer){
_layer._owningView=nil;
}
_layer=_184;
if(_layer){
var _185=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_186){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_187,_188){
with(self){
_wantsLayer=!!_188;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_189){
with(self){
return _wantsLayer;
}
})]);
var _9=objj_getClass("CPView");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("themeState"),function(self,_18a){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_18b,_18c){
with(self){
if(_18c===CPThemeStateNormal&&_themeState===CPThemeStateNormal){
return YES;
}
return !!(_themeState&((typeof _18c==="string")?CPThemeState(_18c):_18c));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_18d,_18e){
with(self){
var _18f=(typeof _18e==="string")?CPThemeState(_18e):_18e;
if(_themeState&_18f){
return NO;
}
_themeState|=_18f;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_190,_191){
with(self){
var _192=((typeof _191==="string")?CPThemeState(_191):_191);
if(!(_themeState&_192)){
return NO;
}
_themeState&=~_192;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("themeClass"),function(self,_193){
with(self){
if(_themeClass){
return _themeClass;
}
return objj_msgSend(objj_msgSend(self,"class"),"defaultThemeClass");
}
}),new objj_method(sel_getUid("setThemeClass:"),function(self,_194,_195){
with(self){
_themeClass=_195;
objj_msgSend(self,"_loadThemeAttributes");
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_196){
with(self){
var _197=objj_msgSend(self,"class"),_198=objj_msgSend(_197,"_themeAttributes"),_199=_198.length;
if(!_199){
return;
}
var _19a=objj_msgSend(self,"theme"),_19b=objj_msgSend(self,"themeClass");
_themeAttributes={};
while(_199--){
var _19c=_198[_199--],_19d=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_19c,_198[_199]);
objj_msgSend(_19d,"setParentAttribute:",objj_msgSend(_19a,"attributeWithName:forClass:",_19c,_19b));
_themeAttributes[_19c]=_19d;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_19e,_19f){
with(self){
if(_theme===_19f){
return;
}
_theme=_19f;
objj_msgSend(self,"viewDidChangeTheme");
}
}),new objj_method(sel_getUid("theme"),function(self,_1a0){
with(self){
return _theme;
}
}),new objj_method(sel_getUid("viewDidChangeTheme"),function(self,_1a1){
with(self){
if(!_themeAttributes){
return;
}
var _1a2=objj_msgSend(self,"theme"),_1a3=objj_msgSend(self,"themeClass");
for(var _1a4 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1a4)){
objj_msgSend(_themeAttributes[_1a4],"setParentAttribute:",objj_msgSend(_1a2,"attributeWithName:forClass:",_1a4,_1a3));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_1a5){
with(self){
var _1a6=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _1a7=objj_msgSend(self,"theme");
for(var _1a8 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1a8)){
objj_msgSend(_1a6,"setObject:forKey:",_themeAttributes[_1a8],_1a8);
}
}
}
return _1a6;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_1a9,_1aa,_1ab,_1ac){
with(self){
if(!_themeAttributes||!_themeAttributes[_1ab]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1ab+"'");
}
var _1ad=objj_msgSend(self,"currentValueForThemeAttribute:",_1ab);
objj_msgSend(_themeAttributes[_1ab],"setValue:forState:",_1aa,_1ac);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1ab)===_1ad){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_1ae,_1af,_1b0){
with(self){
if(!_themeAttributes||!_themeAttributes[_1b0]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1b0+"'");
}
var _1b1=objj_msgSend(self,"currentValueForThemeAttribute:",_1b0);
objj_msgSend(_themeAttributes[_1b0],"setValue:",_1af);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1b0)===_1b1){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_1b2,_1b3,_1b4){
with(self){
if(!_themeAttributes||!_themeAttributes[_1b3]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1b3+"'");
}
return objj_msgSend(_themeAttributes[_1b3],"valueForState:",_1b4);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_1b5,_1b6){
with(self){
if(!_themeAttributes||!_themeAttributes[_1b6]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1b6+"'");
}
return objj_msgSend(_themeAttributes[_1b6],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_1b7,_1b8){
with(self){
if(!_themeAttributes||!_themeAttributes[_1b8]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1b8+"'");
}
return objj_msgSend(_themeAttributes[_1b8],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("hasThemeAttribute:"),function(self,_1b9,_1ba){
with(self){
return (_themeAttributes&&_themeAttributes[_1ba]!==undefined);
}
}),new objj_method(sel_getUid("registerThemeValues:"),function(self,_1bb,_1bc){
with(self){
for(var i=0;i<_1bc.length;++i){
var _1bd=_1bc[i],_1be=_1bd[0],_1bf=_1bd[1],_1c0=_1bd[2];
if(_1c0){
objj_msgSend(self,"setValue:forThemeAttribute:inState:",_1bf,_1be,_1c0);
}else{
objj_msgSend(self,"setValue:forThemeAttribute:",_1bf,_1be);
}
}
}
}),new objj_method(sel_getUid("registerThemeValues:inherit:"),function(self,_1c1,_1c2,_1c3){
with(self){
if(_1c3){
objj_msgSend(self,"registerThemeValues:",_1c3);
}
if(_1c2){
objj_msgSend(self,"registerThemeValues:",_1c2);
}
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_1c4,_1c5){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_1c6,_1c7){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_1c8,_1c9,_1ca,_1cb){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1cc=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1c9);
if(_1cc){
if(!_ephemeralSubviewsForNames[_1c9]){
_ephemeralSubviewsForNames[_1c9]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1c9);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1c9]);
if(_ephemeralSubviewsForNames[_1c9]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1c9],_1ca,_ephemeralSubviewsForNames[_1cb]);
}
}
if(_ephemeralSubviewsForNames[_1c9]){
objj_msgSend(_ephemeralSubviewsForNames[_1c9],"setFrame:",_1cc);
}
}else{
if(_ephemeralSubviewsForNames[_1c9]){
objj_msgSend(_ephemeralSubviewsForNames[_1c9],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1c9]);
delete _ephemeralSubviewsForNames[_1c9];
}
}
return _ephemeralSubviewsForNames[_1c9];
}
}),new objj_method(sel_getUid("ephemeralSubviewNamed:"),function(self,_1cd,_1ce){
with(self){
if(!_ephemeralSubviewsForNames){
return nil;
}
return (_ephemeralSubviewsForNames[_1ce]||nil);
}
})]);
class_addMethods(_a,[new objj_method(sel_getUid("defaultThemeClass"),function(self,_1cf){
with(self){
return nil;
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_1d0){
with(self){
return nil;
}
}),new objj_method(sel_getUid("_themeAttributes"),function(self,_1d1){
with(self){
if(!_2){
_2={};
}
var _1d2=objj_msgSend(self,"class"),_1d3=objj_msgSend(CPView,"class"),_1d4=[],_1d5=objj_msgSend(CPNull,"null");
for(;_1d2&&_1d2!==_1d3;_1d2=objj_msgSend(_1d2,"superclass")){
var _1d6=_2[class_getName(_1d2)];
if(_1d6){
_1d4=_1d4.length?_1d4.concat(_1d6):_1d4;
_2[objj_msgSend(self,"className")]=_1d4;
break;
}
var _1d7=objj_msgSend(_1d2,"themeAttributes");
if(!_1d7){
continue;
}
var _1d8=objj_msgSend(_1d7,"allKeys"),_1d9=_1d8.length;
while(_1d9--){
var _1da=_1d8[_1d9],_1db=objj_msgSend(_1d7,"objectForKey:",_1da);
_1d4.push(_1db===_1d5?nil:_1db);
_1d4.push(_1da);
}
}
return _1d4;
}
})]);
var _1dc="CPViewAutoresizingMask",_1dd="CPViewAutoresizesSubviews",_1de="CPViewBackgroundColor",_1df="CPViewBoundsKey",_1e0="CPViewFrameKey",_1e1="CPViewHitTestsKey",_1e2="CPViewToolTipKey",_1e3="CPViewIsHiddenKey",_1e4="CPViewOpacityKey",_1e5="CPViewSubviewsKey",_1e6="CPViewSuperviewKey",_1e7="CPViewTagKey",_1e8="CPViewThemeClassKey",_1e9="CPViewThemeStateKey",_1ea="CPViewWindowKey",_1eb="CPViewNextKeyViewKey",_1ec="CPViewPreviousKeyViewKey";
var _9=objj_getClass("CPView");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("initWithCoder:"),function(self,_1ed,_1ee){
with(self){
_frame=objj_msgSend(_1ee,"decodeRectForKey:",_1e0);
_bounds=objj_msgSend(_1ee,"decodeRectForKey:",_1df);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView").super_class},"initWithCoder:",_1ee);
if(self){
_tag=objj_msgSend(_1ee,"containsValueForKey:",_1e7)?objj_msgSend(_1ee,"decodeIntForKey:",_1e7):-1;
_window=objj_msgSend(_1ee,"decodeObjectForKey:",_1ea);
_subviews=objj_msgSend(_1ee,"decodeObjectForKey:",_1e5)||[];
_superview=objj_msgSend(_1ee,"decodeObjectForKey:",_1e6);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
if(_autoresizingMask===nil){
_autoresizingMask=objj_msgSend(_1ee,"decodeIntForKey:",_1dc)||CPViewNotSizable;
}
_autoresizesSubviews=!objj_msgSend(_1ee,"containsValueForKey:",_1dd)||objj_msgSend(_1ee,"decodeBoolForKey:",_1dd);
_hitTests=!objj_msgSend(_1ee,"containsValueForKey:",_1e1)||objj_msgSend(_1ee,"decodeBoolForKey:",_1e1);
objj_msgSend(self,"_setupToolTipHandlers");
_toolTip=objj_msgSend(_1ee,"decodeObjectForKey:",_1e2);
if(_toolTip){
objj_msgSend(self,"_installToolTipEventHandlers");
}
objj_msgSend(self,"setHidden:",objj_msgSend(_1ee,"decodeBoolForKey:",_1e3));
if(objj_msgSend(_1ee,"containsValueForKey:",_1e4)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1ee,"decodeIntForKey:",_1e4));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1ee,"decodeObjectForKey:",_1de));
objj_msgSend(self,"_setupViewFlags");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeClass=objj_msgSend(_1ee,"decodeObjectForKey:",_1e8);
_themeState=CPThemeState(objj_msgSend(_1ee,"decodeIntForKey:",_1e9));
_themeAttributes={};
var _1ef=objj_msgSend(self,"class"),_1f0=objj_msgSend(self,"themeClass"),_1f1=objj_msgSend(_1ef,"_themeAttributes"),_1f2=_1f1.length;
while(_1f2--){
var _1f3=_1f1[_1f2--];
_themeAttributes[_1f3]=CPThemeAttributeDecode(_1ee,_1f3,_1f1[_1f2],_theme,_1f0);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_1f4,_1f5){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView").super_class},"encodeWithCoder:",_1f5);
if(_tag!==-1){
objj_msgSend(_1f5,"encodeInt:forKey:",_tag,_1e7);
}
objj_msgSend(_1f5,"encodeRect:forKey:",_frame,_1e0);
objj_msgSend(_1f5,"encodeRect:forKey:",_bounds,_1df);
if(_window!==nil){
objj_msgSend(_1f5,"encodeConditionalObject:forKey:",_window,_1ea);
}
var _1f6=objj_msgSend(_subviews,"count"),_1f7=_subviews;
if(_1f6>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_1f7=objj_msgSend(_1f7,"copy");
while(_1f6--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_1f7[_1f6])){
_1f7.splice(_1f6,1);
}
}
}
if(_1f7.length>0){
objj_msgSend(_1f5,"encodeObject:forKey:",_1f7,_1e5);
}
if(_superview!==nil){
objj_msgSend(_1f5,"encodeConditionalObject:forKey:",_superview,_1e6);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1f5,"encodeInt:forKey:",_autoresizingMask,_1dc);
}
if(!_autoresizesSubviews){
objj_msgSend(_1f5,"encodeBool:forKey:",_autoresizesSubviews,_1dd);
}
if(_backgroundColor!==nil){
objj_msgSend(_1f5,"encodeObject:forKey:",_backgroundColor,_1de);
}
if(_hitTests!==YES){
objj_msgSend(_1f5,"encodeBool:forKey:",_hitTests,_1e1);
}
if(_opacity!==1){
objj_msgSend(_1f5,"encodeFloat:forKey:",_opacity,_1e4);
}
if(_isHidden){
objj_msgSend(_1f5,"encodeBool:forKey:",_isHidden,_1e3);
}
if(_toolTip){
objj_msgSend(_1f5,"encodeObject:forKey:",_toolTip,_1e2);
}
var _1f8=objj_msgSend(self,"nextKeyView");
if(_1f8!==nil&&!objj_msgSend(_1f8,"isEqual:",self)){
objj_msgSend(_1f5,"encodeConditionalObject:forKey:",_1f8,_1eb);
}
var _1f9=objj_msgSend(self,"previousKeyView");
if(_1f9!==nil&&!objj_msgSend(_1f9,"isEqual:",self)){
objj_msgSend(_1f5,"encodeConditionalObject:forKey:",_1f9,_1ec);
}
objj_msgSend(_1f5,"encodeObject:forKey:",objj_msgSend(self,"themeClass"),_1e8);
objj_msgSend(_1f5,"encodeInt:forKey:",CPThemeStateName(_themeState),_1e9);
for(var _1fa in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1fa)){
CPThemeAttributeEncode(_1f5,_themeAttributes[_1fa]);
}
}
}
})]);
var _bd=function(_1fb){
var _1fc=_1fb._superview;
return {autoresizingMask:_1fb._autoresizingMask,frame:CGRectMakeCopy(_1fb._frame),index:(_1fc?objj_msgSend(_1fc._subviews,"indexOfObjectIdenticalTo:",_1fb):0),superview:_1fc};
};
var _107=function(_1fd,_1fe){
var _1ff=CGAffineTransformMakeIdentity(),_200=YES,_201=nil,_202=nil;
if(_1fd){
var view=_1fd;
while(view&&view!=_1fe){
var _203=view._frame;
_1ff.tx+=(_203.origin.x);
_1ff.ty+=(_203.origin.y);
if(view._boundsTransform){
var tx=_1ff.tx*view._boundsTransform.a+_1ff.ty*view._boundsTransform.c+view._boundsTransform.tx;
_1ff.ty=_1ff.tx*view._boundsTransform.b+_1ff.ty*view._boundsTransform.d+view._boundsTransform.ty;
_1ff.tx=tx;
var a=_1ff.a*view._boundsTransform.a+_1ff.b*view._boundsTransform.c,b=_1ff.a*view._boundsTransform.b+_1ff.b*view._boundsTransform.d,c=_1ff.c*view._boundsTransform.a+_1ff.d*view._boundsTransform.c;
_1ff.d=_1ff.c*view._boundsTransform.b+_1ff.d*view._boundsTransform.d;
_1ff.a=a;
_1ff.b=b;
_1ff.c=c;
}
view=view._superview;
}
if(view===_1fe){
return _1ff;
}else{
if(_1fd&&_1fe){
_201=objj_msgSend(_1fd,"window");
_202=objj_msgSend(_1fe,"window");
if(_201&&_202&&_201!==_202){
_200=NO;
var _203=objj_msgSend(_201,"frame");
_1ff.tx+=(_203.origin.x);
_1ff.ty+=(_203.origin.y);
}
}
}
}
var view=_1fe;
while(view){
var _203=view._frame;
_1ff.tx-=(_203.origin.x);
_1ff.ty-=(_203.origin.y);
if(view._boundsTransform){
var tx=_1ff.tx*view._inverseBoundsTransform.a+_1ff.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_1ff.ty=_1ff.tx*view._inverseBoundsTransform.b+_1ff.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_1ff.tx=tx;
var a=_1ff.a*view._inverseBoundsTransform.a+_1ff.b*view._inverseBoundsTransform.c,b=_1ff.a*view._inverseBoundsTransform.b+_1ff.b*view._inverseBoundsTransform.d,c=_1ff.c*view._inverseBoundsTransform.a+_1ff.d*view._inverseBoundsTransform.c;
_1ff.d=_1ff.c*view._inverseBoundsTransform.b+_1ff.d*view._inverseBoundsTransform.d;
_1ff.a=a;
_1ff.b=b;
_1ff.c=c;
}
view=view._superview;
}
if(!_200){
var _203=objj_msgSend(_202,"frame");
_1ff.tx-=(_203.origin.x);
_1ff.ty-=(_203.origin.y);
}
return _1ff;
};
