@STATIC;1.0;I;20;Foundation/CPArray.jI;23;Foundation/CPGeometry.jI;26;Foundation/CPObjJRuntime.jI;18;Foundation/CPSet.ji;19;CGAffineTransform.ji;9;CPColor.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.ji;18;_CPDisplayServer.jt;68812;
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
var _3=nil,_4=0,_5=1,_6=2,_7=3,_8=4;
var _9={},_a=1<<0,_b=1<<1;
var _c,_d,_e=1;
var _f=objj_allocateClassPair(CPResponder,"CPView"),_10=_f.isa;
class_addIvars(_f,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_clipsToBounds"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_inLiveResize"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_DOMImageParts"),new objj_ivar("_DOMImageSizes"),new objj_ivar("_backgroundType"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeClass"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView"),new objj_ivar("_viewClassFlags"),new objj_ivar("_toolTip"),new objj_ivar("_toolTipFunctionIn"),new objj_ivar("_toolTipFunctionOut"),new objj_ivar("_toolTipInstalled")]);
objj_registerClassPair(_f);
class_addMethods(_f,[new objj_method(sel_getUid("toolTip"),function(_11,_12){
with(_11){
return _toolTip;
}
}),new objj_method(sel_getUid("_setToolTip:"),function(_13,_14,_15){
with(_13){
_toolTip=_15;
}
}),new objj_method(sel_getUid("_setupViewFlags"),function(_16,_17){
with(_16){
var _18=objj_msgSend(_16,"class"),_19=objj_msgSend(_18,"UID");
if(_9[_19]===undefined){
var _1a=0;
if(objj_msgSend(_18,"instanceMethodForSelector:",sel_getUid("drawRect:"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"))){
_1a|=_a;
}
if(objj_msgSend(_18,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))){
_1a|=_b;
}
_9[_19]=_1a;
}
_viewClassFlags=_9[_19];
}
}),new objj_method(sel_getUid("_setupToolTipHandlers"),function(_1b,_1c){
with(_1b){
_toolTipInstalled=NO;
_toolTipFunctionIn=function(e){
objj_msgSend(_1b,"_fireToolTip");
};
_toolTipFunctionOut=function(e){
objj_msgSend(_1b,"_invalidateToolTip");
};
}
}),new objj_method(sel_getUid("init"),function(_1d,_1e){
with(_1d){
return objj_msgSend(_1d,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_1f,_20,_21){
with(_1f){
_1f=objj_msgSendSuper({receiver:_1f,super_class:objj_getClass("CPView").super_class},"init");
if(_1f){
var _22=(_21.size.width),_23=(_21.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_21.origin.x,y:_21.origin.y},size:{width:_21.size.width,height:_21.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_22,height:_23}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_clipsToBounds=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_DOMElement=_3.cloneNode(false);
if(NULL){
var _24={x:CGPointMake((_21.origin.x),(_21.origin.y)).x*NULL.a+CGPointMake((_21.origin.x),(_21.origin.y)).y*NULL.c+NULL.tx,y:CGPointMake((_21.origin.x),(_21.origin.y)).x*NULL.b+CGPointMake((_21.origin.x),(_21.origin.y)).y*NULL.d+NULL.ty};
}else{
var _24={x:(_21.origin.x),y:(_21.origin.y)};
}
_DOMElement.style.left=ROUND(_24.x)+"px";
_DOMElement.style.top=ROUND(_24.y)+"px";
_DOMElement.style.width=MAX(0,ROUND(_22))+"px";
_DOMElement.style.height=MAX(0,ROUND(_23))+"px";
if(typeof (appkit_tag_dom_elements)!=="undefined"&&!!appkit_tag_dom_elements){
_DOMElement.setAttribute("data-cappuccino-view",objj_msgSend(_1f,"className"));
}
_DOMImageParts=[];
_DOMImageSizes=[];
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_1f,"_setupToolTipHandlers");
objj_msgSend(_1f,"_setupViewFlags");
objj_msgSend(_1f,"_loadThemeAttributes");
}
return _1f;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_25,_26,_27){
with(_25){
if(_toolTip==_27){
return;
}
_toolTip=_27;
if(_toolTip){
objj_msgSend(_25,"_installToolTipEventHandlers");
}else{
objj_msgSend(_25,"_uninstallToolTipEventHandlers");
}
}
}),new objj_method(sel_getUid("_installToolTipEventHandlers"),function(_28,_29){
with(_28){
if(_toolTipInstalled){
return;
}
if(_DOMElement.addEventListener){
_DOMElement.addEventListener("mouseover",_toolTipFunctionIn,NO);
_DOMElement.addEventListener("keypress",_toolTipFunctionOut,NO);
_DOMElement.addEventListener("mouseout",_toolTipFunctionOut,NO);
}else{
if(_DOMElement.attachEvent){
_DOMElement.attachEvent("onmouseover",_toolTipFunctionIn);
_DOMElement.attachEvent("onkeypress",_toolTipFunctionOut);
_DOMElement.attachEvent("onmouseout",_toolTipFunctionOut);
}
}
_toolTipInstalled=YES;
}
}),new objj_method(sel_getUid("_uninstallToolTipEventHandlers"),function(_2a,_2b){
with(_2a){
if(!_toolTipInstalled){
return;
}
if(_DOMElement.removeEventListener){
_DOMElement.removeEventListener("mouseover",_toolTipFunctionIn,NO);
_DOMElement.removeEventListener("keypress",_toolTipFunctionOut,NO);
_DOMElement.removeEventListener("mouseout",_toolTipFunctionOut,NO);
}else{
if(_DOMElement.detachEvent){
_DOMElement.detachEvent("onmouseover",_toolTipFunctionIn);
_DOMElement.detachEvent("onkeypress",_toolTipFunctionOut);
_DOMElement.detachEvent("onmouseout",_toolTipFunctionOut);
}
}
_toolTipInstalled=NO;
}
}),new objj_method(sel_getUid("_fireToolTip"),function(_2c,_2d){
with(_2c){
if(_d){
objj_msgSend(_d,"invalidate");
if(_c){
objj_msgSend(_c,"close");
}
_c=nil;
}
if(_toolTip){
_d=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_e,_2c,sel_getUid("_showToolTip:"),nil,NO);
}
}
}),new objj_method(sel_getUid("_invalidateToolTip"),function(_2e,_2f){
with(_2e){
if(_d){
objj_msgSend(_d,"invalidate");
_d=nil;
}
if(_c){
objj_msgSend(_c,"close");
_c=nil;
}
}
}),new objj_method(sel_getUid("_showToolTip:"),function(_30,_31,_32){
with(_30){
if(_c){
objj_msgSend(_c,"close");
}
_c=objj_msgSend(_CPToolTip,"toolTipWithString:",_toolTip);
}
}),new objj_method(sel_getUid("superview"),function(_33,_34){
with(_33){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_35,_36){
with(_35){
return objj_msgSend(_subviews,"copy");
}
}),new objj_method(sel_getUid("window"),function(_37,_38){
with(_37){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_39,"_insertSubview:atIndex:",_3b,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_3c,_3d,_3e,_3f,_40){
with(_3c){
var _41=_40?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_40):CPNotFound;
if(_41===CPNotFound){
_41=(_3f===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_3f===CPWindowAbove){
++_41;
}
}
objj_msgSend(_3c,"_insertSubview:atIndex:",_3e,_41);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_42,_43,_44,_45){
with(_42){
if(_44===_42){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"can't add a view as a subview of itself");
}
var _46=_subviews.length;
objj_msgSend(objj_msgSend(_42,"window"),"_dirtyKeyViewLoop");
if(_44._superview==_42){
var _47=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_44);
if(_47===_45||_47===_46-1&&_45===_46){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_47);
_DOMElement.removeChild(_44._DOMElement);
if(_45>_47){
--_45;
}
--_46;
}else{
objj_msgSend(_44,"removeFromSuperview");
objj_msgSend(_44,"_setWindow:",_window);
objj_msgSend(_44,"viewWillMoveToSuperview:",_42);
_44._superview=_42;
}
if(_45===CPNotFound||_45>=_46){
_subviews.push(_44);
_DOMElement.appendChild(_44._DOMElement);
}else{
_subviews.splice(_45,0,_44);
_DOMElement.insertBefore(_44._DOMElement,_subviews[_45+1]._DOMElement);
}
objj_msgSend(_44,"setNextResponder:",_42);
objj_msgSend(_44,"viewDidMoveToSuperview");
objj_msgSend(_42,"didAddSubview:",_44);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_48,_49,_4a){
with(_48){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_4b,_4c){
with(_4b){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_4b,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_4b);
objj_msgSend(_superview._subviews,"removeObject:",_4b);
_superview._DOMElement.removeChild(_DOMElement);
_superview=nil;
objj_msgSend(_4b,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_4d,_4e,_4f,_50){
with(_4d){
if(_4f._superview!==_4d){
return;
}
var _51=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_4f);
objj_msgSend(_4f,"removeFromSuperview");
objj_msgSend(_4d,"_insertSubview:atIndex:",_50,_51);
}
}),new objj_method(sel_getUid("setSubviews:"),function(_52,_53,_54){
with(_52){
if(!_54){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"newSubviews cannot be nil in -[CPView setSubviews:]");
}
if(objj_msgSend(_subviews,"isEqual:",_54)){
return;
}
if(objj_msgSend(_subviews,"count")===0){
var _55=0,_56=objj_msgSend(_54,"count");
for(;_55<_56;++_55){
objj_msgSend(_52,"addSubview:",_54[_55]);
}
return;
}
if(objj_msgSend(_54,"count")===0){
var _56=objj_msgSend(_subviews,"count");
while(_56--){
objj_msgSend(_subviews[_56],"removeFromSuperview");
}
return;
}
var _57=objj_msgSend(CPMutableSet,"setWithArray:",_subviews);
objj_msgSend(_57,"removeObjectsInArray:",_54);
objj_msgSend(_57,"makeObjectsPerformSelector:",sel_getUid("removeFromSuperview"));
var _58=objj_msgSend(CPMutableSet,"setWithArray:",_54);
objj_msgSend(_58,"removeObjectsInArray:",_subviews);
var _59=nil,_5a=objj_msgSend(_58,"objectEnumerator");
while((_59=objj_msgSend(_5a,"nextObject"))!==nil){
objj_msgSend(_52,"addSubview:",_59);
}
if(objj_msgSend(_subviews,"isEqual:",_54)){
return;
}
_subviews=objj_msgSend(_54,"copy");
var _55=0,_56=objj_msgSend(_subviews,"count");
for(;_55<_56;++_55){
var _5b=_subviews[_55];
_DOMElement.removeChild(_5b._DOMElement);
_DOMElement.appendChild(_5b._DOMElement);
}
}
}),new objj_method(sel_getUid("_setWindow:"),function(_5c,_5d,_5e){
with(_5c){
if(_window===_5e){
return;
}
objj_msgSend(objj_msgSend(_5c,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_5c){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_5c,"viewWillMoveToWindow:",_5e);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_5e,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_5e;
var _5f=objj_msgSend(_subviews,"count");
while(_5f--){
objj_msgSend(_subviews[_5f],"_setWindow:",_5e);
}
objj_msgSend(_5c,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_5c,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_60,_61,_62){
with(_60){
var _63=_60;
do{
if(_63==_62){
return YES;
}
}while(_63=objj_msgSend(_63,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_64,_65){
with(_64){
objj_msgSend(_64,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_66,_67){
with(_66){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_68,_69,_6a){
with(_68){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_6b,_6c,_6d){
with(_6b){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_6e,_6f,_70){
with(_6e){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_71,_72){
with(_71){
var _73=_71;
while(_73&&!objj_msgSend(_73,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_73=objj_msgSend(_73,"superview");
}
if(_73){
return _73._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_74,_75,_76){
with(_74){
_tag=_76;
}
}),new objj_method(sel_getUid("tag"),function(_77,_78){
with(_77){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_79,_7a,_7b){
with(_79){
if(objj_msgSend(_79,"tag")==_7b){
return _79;
}
var _7c=0,_7d=_subviews.length;
for(;_7c<_7d;++_7c){
var _7e=objj_msgSend(_subviews[_7c],"viewWithTag:",_7b);
if(_7e){
return _7e;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_7f,_80){
with(_7f){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_81,_82,_83){
with(_81){
if(((_frame.origin.x==_83.origin.x&&_frame.origin.y==_83.origin.y)&&(_frame.size.width==_83.size.width&&_frame.size.height==_83.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_81,"setFrameOrigin:",_83.origin);
objj_msgSend(_81,"setFrameSize:",_83.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_81);
}
}
}),new objj_method(sel_getUid("frame"),function(_84,_85){
with(_84){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("frameOrigin"),function(_86,_87){
with(_86){
return {x:_frame.origin.x,y:_frame.origin.y};
}
}),new objj_method(sel_getUid("frameSize"),function(_88,_89){
with(_88){
return {width:_frame.size.width,height:_frame.size.height};
}
}),new objj_method(sel_getUid("setCenter:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_8a,"setFrameOrigin:",CGPointMake(_8c.x-_frame.size.width/2,_8c.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_8d,_8e){
with(_8d){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_8f,_90,_91){
with(_8f){
var _92=_frame.origin;
if(!_91||(_92.x==_91.x&&_92.y==_91.y)){
return;
}
_92.x=_91.x;
_92.y=_91.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_8f);
}
var _93=_superview?_superview._boundsTransform:NULL;
if(_93){
var _94={x:CGPointMake(_92.x,_92.y).x*_93.a+CGPointMake(_92.x,_92.y).y*_93.c+_93.tx,y:CGPointMake(_92.x,_92.y).x*_93.b+CGPointMake(_92.x,_92.y).y*_93.d+_93.ty};
}else{
var _94={x:_92.x,y:_92.y};
}
_DOMElement.style.left=ROUND(_94.x)+"px";
_DOMElement.style.top=ROUND(_94.y)+"px";
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_95,_96,_97){
with(_95){
var _98=_frame.size;
if(!_97||(_98.width==_97.width&&_98.height==_97.height)){
return;
}
var _99={width:_98.width,height:_98.height};
_98.width=_97.width;
_98.height=_97.height;
if(YES){
_bounds.size.width=_97.width;
_bounds.size.height=_97.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_95,"resizeSubviewsWithOldSize:",_99);
}
objj_msgSend(_95,"setNeedsLayout");
objj_msgSend(_95,"setNeedsDisplay:",YES);
_DOMElement.style.width=MAX(0,ROUND(_98.width))+"px";
_DOMElement.style.height=MAX(0,ROUND(_98.height))+"px";
if(_DOMContentsElement){
_DOMContentsElement.width=MAX(0,ROUND(_98.width));
_DOMContentsElement.height=MAX(0,ROUND(_98.height));
_DOMContentsElement.style.width=MAX(0,ROUND(_98.width))+"px";
_DOMContentsElement.style.height=MAX(0,ROUND(_98.height))+"px";
}
if(_backgroundType!==_4){
if(_backgroundType===_8){
_DOMImageParts[0].style.width=MAX(0,ROUND(_98.width))+"px";
_DOMImageParts[0].style.height=MAX(0,ROUND(_98.height))+"px";
}else{
var _9a=objj_msgSend(objj_msgSend(_backgroundColor,"patternImage"),"imageSlices");
if(_backgroundType===_5){
_DOMImageParts[0].style.width=MAX(0,ROUND(_98.width))+"px";
_DOMImageParts[0].style.height=MAX(0,ROUND(_DOMImageSizes[0].height))+"px";
_DOMImageParts[1].style.width=MAX(0,ROUND(_98.width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_98.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height))+"px";
_DOMImageParts[2].style.width=MAX(0,ROUND(_98.width))+"px";
_DOMImageParts[2].style.height=MAX(0,ROUND(_DOMImageSizes[2].height))+"px";
}else{
if(_backgroundType===_6){
_DOMImageParts[0].style.width=MAX(0,ROUND(_DOMImageSizes[0].width))+"px";
_DOMImageParts[0].style.height=MAX(0,ROUND(_98.height))+"px";
_DOMImageParts[1].style.width=MAX(0,ROUND(_98.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_98.height))+"px";
_DOMImageParts[2].style.width=MAX(0,ROUND(_DOMImageSizes[2].width))+"px";
_DOMImageParts[2].style.height=MAX(0,ROUND(_98.height))+"px";
}else{
if(_backgroundType===_7){
var _9b=_98.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_9c=_98.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
_DOMImageParts[1].style.width=MAX(0,ROUND(_9b))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_DOMImageSizes[0].height))+"px";
_DOMImageParts[3].style.width=MAX(0,ROUND(_DOMImageSizes[3].width))+"px";
_DOMImageParts[3].style.height=MAX(0,ROUND(_9c))+"px";
_DOMImageParts[4].style.width=MAX(0,ROUND(_9b))+"px";
_DOMImageParts[4].style.height=MAX(0,ROUND(_9c))+"px";
_DOMImageParts[5].style.width=MAX(0,ROUND(_DOMImageSizes[5].width))+"px";
_DOMImageParts[5].style.height=MAX(0,ROUND(_9c))+"px";
_DOMImageParts[7].style.width=MAX(0,ROUND(_9b))+"px";
_DOMImageParts[7].style.height=MAX(0,ROUND(_DOMImageSizes[7].height))+"px";
}
}
}
}
}
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_95);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_9d,_9e,_9f){
with(_9d){
if(((_bounds.origin.x==_9f.origin.x&&_bounds.origin.y==_9f.origin.y)&&(_bounds.size.width==_9f.size.width&&_bounds.size.height==_9f.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_9d,"setBoundsOrigin:",_9f.origin);
objj_msgSend(_9d,"setBoundsSize:",_9f.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_9d);
}
}
}),new objj_method(sel_getUid("bounds"),function(_a0,_a1){
with(_a0){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("boundsOrigin"),function(_a2,_a3){
with(_a2){
return {x:_bounds.origin.x,y:_bounds.origin.y};
}
}),new objj_method(sel_getUid("boundsSize"),function(_a4,_a5){
with(_a4){
return {width:_bounds.size.width,height:_bounds.size.height};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_a6,_a7,_a8){
with(_a6){
var _a9=_bounds.origin;
if((_a9.x==_a8.x&&_a9.y==_a8.y)){
return;
}
_a9.x=_a8.x;
_a9.y=_a8.y;
if(_a9.x!=0||_a9.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_a9.x,ty:-_a9.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
var _aa=_subviews.length;
while(_aa--){
var _ab=_subviews[_aa],_a9=_ab._frame.origin;
if(_boundsTransform){
var _ac={x:CGPointMake(_a9.x,_a9.y).x*_boundsTransform.a+CGPointMake(_a9.x,_a9.y).y*_boundsTransform.c+_boundsTransform.tx,y:CGPointMake(_a9.x,_a9.y).x*_boundsTransform.b+CGPointMake(_a9.x,_a9.y).y*_boundsTransform.d+_boundsTransform.ty};
}else{
var _ac={x:_a9.x,y:_a9.y};
}
_ab._DOMElement.style.left=ROUND(_ac.x)+"px";
_ab._DOMElement.style.top=ROUND(_ac.y)+"px";
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_a6);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_ad,_ae,_af){
with(_ad){
var _b0=_bounds.size;
if((_b0.width==_af.width&&_b0.height==_af.height)){
return;
}
var _b1=_frame.size;
if(!(_b0.width==_b1.width&&_b0.height==_b1.height)){
var _b2=_bounds.origin;
_b2.x/=_b0.width/_b1.width;
_b2.y/=_b0.height/_b1.height;
}
_b0.width=_af.width;
_b0.height=_af.height;
if(!(_b0.width==_b1.width&&_b0.height==_b1.height)){
var _b2=_bounds.origin;
_b2.x*=_b0.width/_b1.width;
_b2.y*=_b0.height/_b1.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_ad);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_b3,_b4,_b5){
with(_b3){
var _b6=objj_msgSend(_b3,"autoresizingMask");
if(_b6==CPViewNotSizable){
return;
}
var _b7=_superview._frame,_b8={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_b7.size.width)-_b5.width)/(((_b6&CPViewMinXMargin)?1:0)+(_b6&CPViewWidthSizable?1:0)+(_b6&CPViewMaxXMargin?1:0)),dY=((_b7.size.height)-_b5.height)/((_b6&CPViewMinYMargin?1:0)+(_b6&CPViewHeightSizable?1:0)+(_b6&CPViewMaxYMargin?1:0));
if(_b6&CPViewMinXMargin){
_b8.origin.x+=dX;
}
if(_b6&CPViewWidthSizable){
_b8.size.width+=dX;
}
if(_b6&CPViewMinYMargin){
_b8.origin.y+=dY;
}
if(_b6&CPViewHeightSizable){
_b8.size.height+=dY;
}
objj_msgSend(_b3,"setFrame:",_b8);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_b9,_ba,_bb){
with(_b9){
var _bc=_subviews.length;
while(_bc--){
objj_msgSend(_subviews[_bc],"resizeWithOldSuperviewSize:",_bb);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_bd,_be,_bf){
with(_bd){
_autoresizesSubviews=!!_bf;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_c0,_c1){
with(_c0){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_c2,_c3,_c4){
with(_c2){
_autoresizingMask=_c4;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_c5,_c6){
with(_c5){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_c7,_c8){
with(_c7){
return objj_msgSend(_c7,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_c9,_ca,_cb,_cc){
with(_c9){
_fullScreenModeState=_cd(_c9);
var _ce=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_ce,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_ce,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _cf=objj_msgSend(_ce,"contentView");
objj_msgSend(_cf,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_cf,"addSubview:",_c9);
objj_msgSend(_c9,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_c9,"setFrame:",CGRectMakeCopy(objj_msgSend(_cf,"bounds")));
objj_msgSend(_ce,"makeKeyAndOrderFront:",_c9);
objj_msgSend(_ce,"makeFirstResponder:",_c9);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_d0,_d1){
with(_d0){
objj_msgSend(_d0,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_d2,_d3,_d4){
with(_d2){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_d2,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_d2,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_d2,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_d2,"window"),"orderOut:",_d2);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_d5,_d6){
with(_d5){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_d7,_d8,_d9){
with(_d7){
_d9=!!_d9;
if(_isHidden===_d9){
return;
}
_isHidden=_d9;
_DOMElement.style.display=_isHidden?"none":"block";
if(_d9){
var _da=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_da,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_d7==_da){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_d7,"nextValidKeyView"));
break;
}
}while(_da=objj_msgSend(_da,"superview"));
}
objj_msgSend(_d7,"_notifyViewDidHide");
}else{
objj_msgSend(_d7,"_notifyViewDidUnhide");
}
}
}),new objj_method(sel_getUid("_notifyViewDidHide"),function(_db,_dc){
with(_db){
objj_msgSend(_db,"viewDidHide");
var _dd=objj_msgSend(_subviews,"count");
while(_dd--){
objj_msgSend(_subviews[_dd],"_notifyViewDidHide");
}
}
}),new objj_method(sel_getUid("_notifyViewDidUnhide"),function(_de,_df){
with(_de){
objj_msgSend(_de,"viewDidUnhide");
var _e0=objj_msgSend(_subviews,"count");
while(_e0--){
objj_msgSend(_subviews[_e0],"_notifyViewDidUnhide");
}
}
}),new objj_method(sel_getUid("isHidden"),function(_e1,_e2){
with(_e1){
return _isHidden;
}
}),new objj_method(sel_getUid("setClipsToBounds:"),function(_e3,_e4,_e5){
with(_e3){
if(_clipsToBounds===_e5){
return;
}
_clipsToBounds=_e5;
_DOMElement.style.overflow=_clipsToBounds?"hidden":"visible";
}
}),new objj_method(sel_getUid("clipsToBounds"),function(_e6,_e7){
with(_e6){
return _clipsToBounds;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_e8,_e9,_ea){
with(_e8){
if(_opacity==_ea){
return;
}
_opacity=_ea;
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
if(_ea===1){
try{
_DOMElement.style.removeAttribute("filter");
}
catch(anException){
}
}else{
_DOMElement.style.filter="alpha(opacity="+_ea*100+")";
}
}else{
_DOMElement.style.opacity=_ea;
}
}
}),new objj_method(sel_getUid("alphaValue"),function(_eb,_ec){
with(_eb){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_ed,_ee){
with(_ed){
var _ef=_ed;
while(_ef&&!objj_msgSend(_ef,"isHidden")){
_ef=objj_msgSend(_ef,"superview");
}
return _ef!==nil;
}
}),new objj_method(sel_getUid("_isVisible"),function(_f0,_f1){
with(_f0){
return !objj_msgSend(_f0,"isHiddenOrHasHiddenAncestor")&&objj_msgSend(objj_msgSend(_f0,"window"),"isVisible");
}
}),new objj_method(sel_getUid("viewDidHide"),function(_f2,_f3){
with(_f2){
}
}),new objj_method(sel_getUid("viewDidUnhide"),function(_f4,_f5){
with(_f4){
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_f6,_f7,_f8){
with(_f6){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_f9,_fa){
with(_f9){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_fb,_fc,_fd){
with(_fb){
_hitTests=!!_fd;
}
}),new objj_method(sel_getUid("hitTest:"),function(_fe,_ff,_100){
with(_fe){
if(_isHidden||!_hitTests||!(_100.x>=(_frame.origin.x)&&_100.y>=(_frame.origin.y)&&_100.x<(_frame.origin.x+_frame.size.width)&&_100.y<(_frame.origin.y+_frame.size.height))){
return nil;
}
var view=nil,i=_subviews.length,_101={x:_100.x-(_frame.origin.x),y:_100.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_101={x:_101.x*_inverseBoundsTransform.a+_101.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_101.x*_inverseBoundsTransform.b+_101.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(view=objj_msgSend(_subviews[i],"hitTest:",_101)){
return view;
}
}
return _fe;
}
}),new objj_method(sel_getUid("needsPanelToBecomeKey"),function(self,_102){
with(self){
return NO;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(self,_103){
with(self){
return !objj_msgSend(self,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(self,_104,_105){
with(self){
if(objj_msgSend(self,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView").super_class},"mouseDown:",_105);
}
}
}),new objj_method(sel_getUid("rightMouseDown:"),function(self,_106,_107){
with(self){
var menu=objj_msgSend(self,"menuForEvent:",_107);
if(menu){
objj_msgSend(CPMenu,"popUpContextMenu:withEvent:forView:",menu,_107,self);
}else{
if(objj_msgSend(objj_msgSend(self,"nextResponder"),"isKindOfClass:",CPView)){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView").super_class},"rightMouseDown:",_107);
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_107,"window"),"platformWindow"),"_propagateContextMenuDOMEvent:",YES);
}
}
}
}),new objj_method(sel_getUid("menuForEvent:"),function(self,_108,_109){
with(self){
return objj_msgSend(self,"menu")||objj_msgSend(objj_msgSend(self,"class"),"defaultMenu");
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(self,_10a,_10b){
with(self){
if(_backgroundColor==_10b){
return;
}
if(_10b==objj_msgSend(CPNull,"null")){
_10b=nil;
}
_backgroundColor=_10b;
var _10c=objj_msgSend(_backgroundColor,"patternImage"),_10d=_backgroundColor&&(objj_msgSend(_backgroundColor,"patternImage")||objj_msgSend(_backgroundColor,"alphaComponent")>0),_10e=_10d&&objj_msgSend(_backgroundColor,"alphaComponent")<1,_10f=CPFeatureIsCompatible(CPCSSRGBAFeature),_110=_10e&&!_10f,_111=0;
if(objj_msgSend(_10c,"isThreePartImage")){
_backgroundType=objj_msgSend(_10c,"isVertical")?_5:_6;
_111=3-_DOMImageParts.length;
}else{
if(objj_msgSend(_10c,"isNinePartImage")){
_backgroundType=_7;
_111=9-_DOMImageParts.length;
}else{
_backgroundType=_110?_8:_4;
_111=(_110?1:0)-_DOMImageParts.length;
}
}
if(_111>0){
while(_111--){
var _112=_3.cloneNode(false);
_112.style.zIndex=-1000;
_DOMImageParts.push(_112);
_DOMElement.appendChild(_112);
}
}else{
_111=-_111;
while(_111--){
_DOMElement.removeChild(_DOMImageParts.pop());
}
}
if(_backgroundType===_4||_backgroundType===_8){
var _113=_10d?objj_msgSend(_backgroundColor,"cssString"):"";
if(_110){
_DOMElement.style.background="";
_DOMImageParts[0].style.background=objj_msgSend(_backgroundColor,"cssString");
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
_DOMImageParts[0].style.filter="alpha(opacity="+objj_msgSend(_backgroundColor,"alphaComponent")*100+")";
}else{
_DOMImageParts[0].style.opacity=objj_msgSend(_backgroundColor,"alphaComponent");
}
var size=objj_msgSend(self,"bounds").size;
_DOMImageParts[0].style.width=MAX(0,ROUND(size.width))+"px";
_DOMImageParts[0].style.height=MAX(0,ROUND(size.height))+"px";
}else{
_DOMElement.style.background=_113;
}
}else{
var _114=objj_msgSend(_10c,"imageSlices"),_115=MIN(_DOMImageParts.length,_114.length),_116=_frame.size;
while(_115--){
var _117=_114[_115],size=_DOMImageSizes[_115]=_117?objj_msgSend(_117,"size"):{width:0,height:0};
_DOMImageParts[_115].style.width=MAX(0,ROUND(size.width))+"px";
_DOMImageParts[_115].style.height=MAX(0,ROUND(size.height))+"px";
_DOMImageParts[_115].style.background=_117?"url(\""+objj_msgSend(_117,"filename")+"\")":"";
if(!_10f){
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
try{
_DOMImageParts[_115].style.removeAttribute("filter");
}
catch(anException){
}
}else{
_DOMImageParts[_115].style.opacity=1;
}
}
}
if(_backgroundType==_7){
var _118=_116.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_119=_116.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
_DOMImageParts[1].style.width=MAX(0,ROUND(_118))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_DOMImageSizes[0].height))+"px";
_DOMImageParts[3].style.width=MAX(0,ROUND(_DOMImageSizes[3].width))+"px";
_DOMImageParts[3].style.height=MAX(0,ROUND(_119))+"px";
_DOMImageParts[4].style.width=MAX(0,ROUND(_118))+"px";
_DOMImageParts[4].style.height=MAX(0,ROUND(_119))+"px";
_DOMImageParts[5].style.width=MAX(0,ROUND(_DOMImageSizes[5].width))+"px";
_DOMImageParts[5].style.height=MAX(0,ROUND(_119))+"px";
_DOMImageParts[7].style.width=MAX(0,ROUND(_118))+"px";
_DOMImageParts[7].style.height=MAX(0,ROUND(_DOMImageSizes[7].height))+"px";
if(NULL){
var _11a={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:0};
}
_DOMImageParts[0].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[0].style.top=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.a+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.b+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:_DOMImageSizes[0].width,y:0};
}
_DOMImageParts[1].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[1].style.top=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:0};
}
_DOMImageParts[2].style.right=ROUND(_11a.x)+"px";
_DOMImageParts[2].style.top=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.a+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.c+NULL.tx,y:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.b+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:_DOMImageSizes[1].height};
}
_DOMImageParts[3].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[3].style.top=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).x*NULL.a+CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).x*NULL.b+CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).y*NULL.d+NULL.ty};
}else{
var _11a={x:_DOMImageSizes[0].width,y:_DOMImageSizes[0].height};
}
_DOMImageParts[4].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[4].style.top=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.a+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.c+NULL.tx,y:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.b+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:_DOMImageSizes[1].height};
}
_DOMImageParts[5].style.right=ROUND(_11a.x)+"px";
_DOMImageParts[5].style.top=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:0};
}
_DOMImageParts[6].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[6].style.bottom=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(_DOMImageSizes[6].width,0).x*NULL.a+CGPointMake(_DOMImageSizes[6].width,0).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[6].width,0).x*NULL.b+CGPointMake(_DOMImageSizes[6].width,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:_DOMImageSizes[6].width,y:0};
}
_DOMImageParts[7].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[7].style.bottom=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:0};
}
_DOMImageParts[8].style.right=ROUND(_11a.x)+"px";
_DOMImageParts[8].style.bottom=ROUND(_11a.y)+"px";
}else{
if(_backgroundType==_5){
_DOMImageParts[0].style.width=MAX(0,ROUND(_116.width))+"px";
_DOMImageParts[0].style.height=MAX(0,ROUND(_DOMImageSizes[0].height))+"px";
_DOMImageParts[1].style.width=MAX(0,ROUND(_116.width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_116.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height))+"px";
_DOMImageParts[2].style.width=MAX(0,ROUND(_116.width))+"px";
_DOMImageParts[2].style.height=MAX(0,ROUND(_DOMImageSizes[2].height))+"px";
if(NULL){
var _11a={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:0};
}
_DOMImageParts[0].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[0].style.top=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(0,_DOMImageSizes[0].height).x*NULL.a+CGPointMake(0,_DOMImageSizes[0].height).y*NULL.c+NULL.tx,y:CGPointMake(0,_DOMImageSizes[0].height).x*NULL.b+CGPointMake(0,_DOMImageSizes[0].height).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:_DOMImageSizes[0].height};
}
_DOMImageParts[1].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[1].style.top=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:0};
}
_DOMImageParts[2].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[2].style.bottom=ROUND(_11a.y)+"px";
}else{
if(_backgroundType==_6){
_DOMImageParts[0].style.width=MAX(0,ROUND(_DOMImageSizes[0].width))+"px";
_DOMImageParts[0].style.height=MAX(0,ROUND(_116.height))+"px";
_DOMImageParts[1].style.width=MAX(0,ROUND(_116.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_116.height))+"px";
_DOMImageParts[2].style.width=MAX(0,ROUND(_DOMImageSizes[2].width))+"px";
_DOMImageParts[2].style.height=MAX(0,ROUND(_116.height))+"px";
if(NULL){
var _11a={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:0};
}
_DOMImageParts[0].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[0].style.top=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.a+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.b+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:_DOMImageSizes[0].width,y:0};
}
_DOMImageParts[1].style.left=ROUND(_11a.x)+"px";
_DOMImageParts[1].style.top=ROUND(_11a.y)+"px";
if(NULL){
var _11a={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _11a={x:0,y:0};
}
_DOMImageParts[2].style.right=ROUND(_11a.x)+"px";
_DOMImageParts[2].style.top=ROUND(_11a.y)+"px";
}
}
}
}
}
}),new objj_method(sel_getUid("backgroundColor"),function(self,_11b){
with(self){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(self,_11c,_11d,_11e){
with(self){
return CGPointApplyAffineTransform(_11d,_11f(_11e,self));
}
}),new objj_method(sel_getUid("convertPointFromBase:"),function(self,_120,_121){
with(self){
return CGPointApplyAffineTransform(_121,_11f(nil,self));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(self,_122,_123,_124){
with(self){
return CGPointApplyAffineTransform(_123,_11f(self,_124));
}
}),new objj_method(sel_getUid("convertPointToBase:"),function(self,_125,_126){
with(self){
return CGPointApplyAffineTransform(_126,_11f(self,nil));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(self,_127,_128,_129){
with(self){
return CGSizeApplyAffineTransform(_128,_11f(_129,self));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(self,_12a,_12b,_12c){
with(self){
return CGSizeApplyAffineTransform(_12b,_11f(self,_12c));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(self,_12d,_12e,_12f){
with(self){
return CGRectApplyAffineTransform(_12e,_11f(_12f,self));
}
}),new objj_method(sel_getUid("convertRectFromBase:"),function(self,_130,_131){
with(self){
return CGRectApplyAffineTransform(_131,_11f(nil,self));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(self,_132,_133,_134){
with(self){
return CGRectApplyAffineTransform(_133,_11f(self,_134));
}
}),new objj_method(sel_getUid("convertRectToBase:"),function(self,_135,_136){
with(self){
return CGRectApplyAffineTransform(_136,_11f(self,nil));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(self,_137,_138){
with(self){
_138=!!_138;
if(_postsFrameChangedNotifications===_138){
return;
}
_postsFrameChangedNotifications=_138;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,self);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(self,_139){
with(self){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(self,_13a,_13b){
with(self){
_13b=!!_13b;
if(_postsBoundsChangedNotifications===_13b){
return;
}
_postsBoundsChangedNotifications=_13b;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,self);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(self,_13c){
with(self){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(self,_13d,_13e,_13f,_140,_141,_142,_143,_144){
with(self){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_13e,objj_msgSend(self,"convertPoint:toView:",_13f,nil),_140,_141,_142,_143,_144);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(self,_145,_146,_147,_148,_149,_14a,_14b,_14c){
with(self){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_146,objj_msgSend(self,"convertPoint:toView:",_147,nil),_148,_149,_14a,_14b,_14c);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_14d,_14e){
with(self){
if(!_14e||!objj_msgSend(_14e,"count")){
return;
}
var _14f=objj_msgSend(self,"window");
objj_msgSend(_14f,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_14e);
objj_msgSend(_14f,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(self,_150){
with(self){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_151){
with(self){
objj_msgSend(objj_msgSend(self,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_152,_153){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_154,_155){
with(self){
if(_155){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_156,_157){
with(self){
if(!(_viewClassFlags&_a)){
return;
}
if((_157.size.width<=0||_157.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_157,_dirtyRect);
}else{
_dirtyRect={origin:{x:_157.origin.x,y:_157.origin.y},size:{width:_157.size.width,height:_157.size.height}};
}
_CPDisplayServerAddDisplayObject(self);
}
}),new objj_method(sel_getUid("needsDisplay"),function(self,_158){
with(self){
return _dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0);
}
}),new objj_method(sel_getUid("displayIfNeeded"),function(self,_159){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_dirtyRect);
}
}
}),new objj_method(sel_getUid("display"),function(self,_15a){
with(self){
objj_msgSend(self,"displayRect:",objj_msgSend(self,"visibleRect"));
}
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_15b,_15c){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_15c);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_15d,_15e){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_15e,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_15f,_160,_161){
with(self){
if(objj_msgSend(self,"isHidden")){
return;
}
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_160);
objj_msgSend(self,"drawRect:",_160);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_162){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_163){
with(self){
if(!_graphicsContext){
var _164=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_164.DOMElement;
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
if(CPPlatformHasBug(CPCanvasParentDrawErrorsOnMovementBug)){
_DOMElement.style.webkitTransform="translateX(0)";
}
_DOMElement.appendChild(_DOMContentsElement);
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_164,YES);
}
objj_msgSend(CPGraphicsContext,"setCurrentContext:",_graphicsContext);
CGContextSaveGState(objj_msgSend(_graphicsContext,"graphicsPort"));
}
}),new objj_method(sel_getUid("unlockFocus"),function(self,_165){
with(self){
CGContextRestoreGState(objj_msgSend(_graphicsContext,"graphicsPort"));
objj_msgSend(CPGraphicsContext,"setCurrentContext:",nil);
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(self,_166){
with(self){
if(!(_viewClassFlags&_b)){
return;
}
_needsLayout=YES;
_CPDisplayServerAddLayoutObject(self);
}
}),new objj_method(sel_getUid("layoutIfNeeded"),function(self,_167){
with(self){
if(_needsLayout){
_needsLayout=NO;
objj_msgSend(self,"layoutSubviews");
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_168){
with(self){
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_169){
with(self){
return NO;
}
}),new objj_method(sel_getUid("visibleRect"),function(self,_16a){
with(self){
if(!_superview){
return _bounds;
}
return CGRectIntersection(objj_msgSend(self,"convertRect:fromView:",objj_msgSend(_superview,"visibleRect"),_superview),_bounds);
}
}),new objj_method(sel_getUid("_enclosingClipView"),function(self,_16b){
with(self){
var _16c=_superview,_16d=objj_msgSend(CPClipView,"class");
while(_16c&&!objj_msgSend(_16c,"isKindOfClass:",_16d)){
_16c=_16c._superview;
}
return _16c;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_16e,_16f){
with(self){
var _170=objj_msgSend(self,"_enclosingClipView");
if(!_170){
return;
}
objj_msgSend(_170,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_16f,_170));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_171,_172){
with(self){
var _173=objj_msgSend(self,"visibleRect");
_172=CGRectIntersection(_172,_bounds);
if((_172.size.width<=0||_172.size.height<=0)||CGRectContainsRect(_173,_172)){
return NO;
}
var _174=objj_msgSend(self,"_enclosingClipView");
if(!_174){
return NO;
}
var _175={x:_173.origin.x,y:_173.origin.y};
if((_172.origin.x)<=(_173.origin.x)){
_175.x=(_172.origin.x);
}else{
if((_172.origin.x+_172.size.width)>(_173.origin.x+_173.size.width)){
_175.x+=(_172.origin.x+_172.size.width)-(_173.origin.x+_173.size.width);
}
}
if((_172.origin.y)<=(_173.origin.y)){
_175.y=CGRectGetMinY(_172);
}else{
if((_172.origin.y+_172.size.height)>(_173.origin.y+_173.size.height)){
_175.y+=(_172.origin.y+_172.size.height)-(_173.origin.y+_173.size.height);
}
}
objj_msgSend(_174,"scrollToPoint:",CGPointMake(_175.x,_175.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_176,_177){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_177);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_178,_179){
with(self){
return _179;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_17a,_17b,_17c){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_17d){
with(self){
var _17e=_superview,_17f=objj_msgSend(CPScrollView,"class");
while(_17e&&!objj_msgSend(_17e,"isKindOfClass:",_17f)){
_17e=_17e._superview;
}
return _17e;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_180,_181,_182){
with(self){
objj_msgSend(_181,"scrollToPoint:",_182);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_183,_184){
with(self){
}
}),new objj_method(sel_getUid("inLiveResize"),function(self,_185){
with(self){
return _inLiveResize;
}
}),new objj_method(sel_getUid("viewWillStartLiveResize"),function(self,_186){
with(self){
_inLiveResize=YES;
}
}),new objj_method(sel_getUid("viewDidEndLiveResize"),function(self,_187){
with(self){
_inLiveResize=NO;
}
})]);
class_addMethods(_10,[new objj_method(sel_getUid("initialize"),function(self,_188){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_3=document.createElement("div");
var _189=_3.style;
_189.overflow="hidden";
_189.position="absolute";
_189.visibility="visible";
_189.zIndex=0;
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"),function(self,_18a){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","frameOrigin","frameSize");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingBounds"),function(self,_18b){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","boundsOrigin","boundsSize");
}
}),new objj_method(sel_getUid("defaultMenu"),function(self,_18c){
with(self){
return nil;
}
})]);
var _f=objj_getClass("CPView");
if(!_f){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _10=_f.isa;
class_addMethods(_f,[new objj_method(sel_getUid("performKeyEquivalent:"),function(self,_18d,_18e){
with(self){
var _18f=objj_msgSend(_subviews,"count");
while(_18f--){
if(objj_msgSend(_subviews[_18f],"performKeyEquivalent:",_18e)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("canBecomeKeyView"),function(self,_190){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_191){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_192){
with(self){
var _193=objj_msgSend(self,"nextKeyView"),_194=_193;
while(_193&&!objj_msgSend(_193,"canBecomeKeyView")){
_193=objj_msgSend(_193,"nextKeyView");
if(_193===_194){
return nil;
}
}
return _193;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_195){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_196){
with(self){
var _197=objj_msgSend(self,"previousKeyView"),_198=_197;
while(_197&&!objj_msgSend(_197,"canBecomeKeyView")){
_197=objj_msgSend(_197,"previousKeyView");
if(_197===_198){
return nil;
}
}
return _197;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_199,_19a){
with(self){
if(objj_msgSend(_19a,"isEqual:",self)){
_previousKeyView=nil;
}else{
_previousKeyView=_19a;
}
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_19b,next){
with(self){
if(objj_msgSend(next,"isEqual:",self)){
_nextKeyView=nil;
}else{
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
}
})]);
var _f=objj_getClass("CPView");
if(!_f){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _10=_f.isa;
class_addMethods(_f,[new objj_method(sel_getUid("setLayer:"),function(self,_19c,_19d){
with(self){
if(_layer==_19d){
return;
}
if(_layer){
_layer._owningView=nil;
_DOMElement.removeChild(_layer._DOMElement);
}
_layer=_19d;
if(_layer){
var _19e=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
_layer._DOMElement.style.zIndex=100;
_DOMElement.appendChild(_layer._DOMElement);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_19f){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_1a0,_1a1){
with(self){
_wantsLayer=!!_1a1;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_1a2){
with(self){
return _wantsLayer;
}
})]);
var _f=objj_getClass("CPView");
if(!_f){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _10=_f.isa;
class_addMethods(_f,[new objj_method(sel_getUid("themeState"),function(self,_1a3){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_1a4,_1a5){
with(self){
if(_1a5===CPThemeStateNormal&&_themeState===CPThemeStateNormal){
return YES;
}
return !!(_themeState&((typeof _1a5==="string")?CPThemeState(_1a5):_1a5));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_1a6,_1a7){
with(self){
var _1a8=(typeof _1a7==="string")?CPThemeState(_1a7):_1a7;
if(_themeState&_1a8){
return NO;
}
_themeState|=_1a8;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_1a9,_1aa){
with(self){
var _1ab=((typeof _1aa==="string")?CPThemeState(_1aa):_1aa);
if(!(_themeState&_1ab)){
return NO;
}
_themeState&=~_1ab;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("themeClass"),function(self,_1ac){
with(self){
if(_themeClass){
return _themeClass;
}
return objj_msgSend(objj_msgSend(self,"class"),"defaultThemeClass");
}
}),new objj_method(sel_getUid("setThemeClass:"),function(self,_1ad,_1ae){
with(self){
_themeClass=_1ae;
objj_msgSend(self,"_loadThemeAttributes");
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_1af){
with(self){
var _1b0=objj_msgSend(self,"class"),_1b1=objj_msgSend(_1b0,"_themeAttributes"),_1b2=_1b1.length;
if(!_1b2){
return;
}
var _1b3=objj_msgSend(self,"theme"),_1b4=objj_msgSend(self,"themeClass");
_themeAttributes={};
while(_1b2--){
var _1b5=_1b1[_1b2--],_1b6=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_1b5,_1b1[_1b2]);
objj_msgSend(_1b6,"setParentAttribute:",objj_msgSend(_1b3,"attributeWithName:forClass:",_1b5,_1b4));
_themeAttributes[_1b5]=_1b6;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_1b7,_1b8){
with(self){
if(_theme===_1b8){
return;
}
_theme=_1b8;
objj_msgSend(self,"viewDidChangeTheme");
}
}),new objj_method(sel_getUid("theme"),function(self,_1b9){
with(self){
return _theme;
}
}),new objj_method(sel_getUid("viewDidChangeTheme"),function(self,_1ba){
with(self){
if(!_themeAttributes){
return;
}
var _1bb=objj_msgSend(self,"theme"),_1bc=objj_msgSend(self,"themeClass");
for(var _1bd in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1bd)){
objj_msgSend(_themeAttributes[_1bd],"setParentAttribute:",objj_msgSend(_1bb,"attributeWithName:forClass:",_1bd,_1bc));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_1be){
with(self){
var _1bf=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _1c0=objj_msgSend(self,"theme");
for(var _1c1 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1c1)){
objj_msgSend(_1bf,"setObject:forKey:",_themeAttributes[_1c1],_1c1);
}
}
}
return _1bf;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_1c2,_1c3,_1c4,_1c5){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c4]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c4+"'");
}
var _1c6=objj_msgSend(self,"currentValueForThemeAttribute:",_1c4);
objj_msgSend(_themeAttributes[_1c4],"setValue:forState:",_1c3,_1c5);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1c4)===_1c6){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_1c7,_1c8,_1c9){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c9]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c9+"'");
}
var _1ca=objj_msgSend(self,"currentValueForThemeAttribute:",_1c9);
objj_msgSend(_themeAttributes[_1c9],"setValue:",_1c8);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1c9)===_1ca){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_1cb,_1cc,_1cd){
with(self){
if(!_themeAttributes||!_themeAttributes[_1cc]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1cc+"'");
}
return objj_msgSend(_themeAttributes[_1cc],"valueForState:",_1cd);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_1ce,_1cf){
with(self){
if(!_themeAttributes||!_themeAttributes[_1cf]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1cf+"'");
}
return objj_msgSend(_themeAttributes[_1cf],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_1d0,_1d1){
with(self){
if(!_themeAttributes||!_themeAttributes[_1d1]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1d1+"'");
}
return objj_msgSend(_themeAttributes[_1d1],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("hasThemeAttribute:"),function(self,_1d2,_1d3){
with(self){
return (_themeAttributes&&_themeAttributes[_1d3]!==undefined);
}
}),new objj_method(sel_getUid("registerThemeValues:"),function(self,_1d4,_1d5){
with(self){
for(var i=0;i<_1d5.length;++i){
var _1d6=_1d5[i],_1d7=_1d6[0],_1d8=_1d6[1],_1d9=_1d6[2];
if(_1d9){
objj_msgSend(self,"setValue:forThemeAttribute:inState:",_1d8,_1d7,_1d9);
}else{
objj_msgSend(self,"setValue:forThemeAttribute:",_1d8,_1d7);
}
}
}
}),new objj_method(sel_getUid("registerThemeValues:inherit:"),function(self,_1da,_1db,_1dc){
with(self){
if(_1dc){
objj_msgSend(self,"registerThemeValues:",_1dc);
}
if(_1db){
objj_msgSend(self,"registerThemeValues:",_1db);
}
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_1dd,_1de){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_1df,_1e0){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_1e1,_1e2,_1e3,_1e4){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1e5=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1e2);
if(_1e5){
if(!_ephemeralSubviewsForNames[_1e2]){
_ephemeralSubviewsForNames[_1e2]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1e2);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1e2]);
if(_ephemeralSubviewsForNames[_1e2]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1e2],_1e3,_ephemeralSubviewsForNames[_1e4]);
}
}
if(_ephemeralSubviewsForNames[_1e2]){
objj_msgSend(_ephemeralSubviewsForNames[_1e2],"setFrame:",_1e5);
}
}else{
if(_ephemeralSubviewsForNames[_1e2]){
objj_msgSend(_ephemeralSubviewsForNames[_1e2],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1e2]);
delete _ephemeralSubviewsForNames[_1e2];
}
}
return _ephemeralSubviewsForNames[_1e2];
}
}),new objj_method(sel_getUid("ephemeralSubviewNamed:"),function(self,_1e6,_1e7){
with(self){
if(!_ephemeralSubviewsForNames){
return nil;
}
return (_ephemeralSubviewsForNames[_1e7]||nil);
}
})]);
class_addMethods(_10,[new objj_method(sel_getUid("defaultThemeClass"),function(self,_1e8){
with(self){
return nil;
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_1e9){
with(self){
return nil;
}
}),new objj_method(sel_getUid("_themeAttributes"),function(self,_1ea){
with(self){
if(!_2){
_2={};
}
var _1eb=objj_msgSend(self,"class"),_1ec=objj_msgSend(CPView,"class"),_1ed=[],_1ee=objj_msgSend(CPNull,"null");
for(;_1eb&&_1eb!==_1ec;_1eb=objj_msgSend(_1eb,"superclass")){
var _1ef=_2[class_getName(_1eb)];
if(_1ef){
_1ed=_1ed.length?_1ed.concat(_1ef):_1ed;
_2[objj_msgSend(self,"className")]=_1ed;
break;
}
var _1f0=objj_msgSend(_1eb,"themeAttributes");
if(!_1f0){
continue;
}
var _1f1=objj_msgSend(_1f0,"allKeys"),_1f2=_1f1.length;
while(_1f2--){
var _1f3=_1f1[_1f2],_1f4=objj_msgSend(_1f0,"objectForKey:",_1f3);
_1ed.push(_1f4===_1ee?nil:_1f4);
_1ed.push(_1f3);
}
}
return _1ed;
}
})]);
var _1f5="CPViewAutoresizingMask",_1f6="CPViewAutoresizesSubviews",_1f7="CPViewBackgroundColor",_1f8="CPViewBoundsKey",_1f9="CPViewFrameKey",_1fa="CPViewHitTestsKey",_1fb="CPViewToolTipKey",_1fc="CPViewIsHiddenKey",_1fd="CPViewOpacityKey",_1fe="CPViewSubviewsKey",_1ff="CPViewSuperviewKey",_200="CPViewTagKey",_201="CPViewThemeClassKey",_202="CPViewThemeStateKey",_203="CPViewWindowKey",_204="CPViewNextKeyViewKey",_205="CPViewPreviousKeyViewKey";
var _f=objj_getClass("CPView");
if(!_f){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _10=_f.isa;
class_addMethods(_f,[new objj_method(sel_getUid("initWithCoder:"),function(self,_206,_207){
with(self){
_DOMElement=_3.cloneNode(false);
_frame=objj_msgSend(_207,"decodeRectForKey:",_1f9);
_bounds=objj_msgSend(_207,"decodeRectForKey:",_1f8);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView").super_class},"initWithCoder:",_207);
if(self){
_tag=objj_msgSend(_207,"containsValueForKey:",_200)?objj_msgSend(_207,"decodeIntForKey:",_200):-1;
_window=objj_msgSend(_207,"decodeObjectForKey:",_203);
_subviews=objj_msgSend(_207,"decodeObjectForKey:",_1fe)||[];
_superview=objj_msgSend(_207,"decodeObjectForKey:",_1ff);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
if(_autoresizingMask===nil){
_autoresizingMask=objj_msgSend(_207,"decodeIntForKey:",_1f5)||CPViewNotSizable;
}
_autoresizesSubviews=!objj_msgSend(_207,"containsValueForKey:",_1f6)||objj_msgSend(_207,"decodeBoolForKey:",_1f6);
_hitTests=!objj_msgSend(_207,"containsValueForKey:",_1fa)||objj_msgSend(_207,"decodeBoolForKey:",_1fa);
objj_msgSend(self,"_setupToolTipHandlers");
_toolTip=objj_msgSend(_207,"decodeObjectForKey:",_1fb);
if(_toolTip){
objj_msgSend(self,"_installToolTipEventHandlers");
}
_DOMImageParts=[];
_DOMImageSizes=[];
if(NULL){
var _208={x:CGPointMake((_frame.origin.x),(_frame.origin.y)).x*NULL.a+CGPointMake((_frame.origin.x),(_frame.origin.y)).y*NULL.c+NULL.tx,y:CGPointMake((_frame.origin.x),(_frame.origin.y)).x*NULL.b+CGPointMake((_frame.origin.x),(_frame.origin.y)).y*NULL.d+NULL.ty};
}else{
var _208={x:(_frame.origin.x),y:(_frame.origin.y)};
}
_DOMElement.style.left=ROUND(_208.x)+"px";
_DOMElement.style.top=ROUND(_208.y)+"px";
_DOMElement.style.width=MAX(0,ROUND((_frame.size.width)))+"px";
_DOMElement.style.height=MAX(0,ROUND((_frame.size.height)))+"px";
var _209=0,_20a=_subviews.length;
for(;_209<_20a;++_209){
_DOMElement.appendChild(_subviews[_209]._DOMElement);
}
objj_msgSend(self,"setHidden:",objj_msgSend(_207,"decodeBoolForKey:",_1fc));
if(objj_msgSend(_207,"containsValueForKey:",_1fd)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_207,"decodeIntForKey:",_1fd));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_207,"decodeObjectForKey:",_1f7));
objj_msgSend(self,"_setupViewFlags");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeClass=objj_msgSend(_207,"decodeObjectForKey:",_201);
_themeState=CPThemeState(objj_msgSend(_207,"decodeIntForKey:",_202));
_themeAttributes={};
var _20b=objj_msgSend(self,"class"),_20c=objj_msgSend(self,"themeClass"),_20d=objj_msgSend(_20b,"_themeAttributes"),_20a=_20d.length;
while(_20a--){
var _20e=_20d[_20a--];
_themeAttributes[_20e]=CPThemeAttributeDecode(_207,_20e,_20d[_20a],_theme,_20c);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_20f,_210){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView").super_class},"encodeWithCoder:",_210);
if(_tag!==-1){
objj_msgSend(_210,"encodeInt:forKey:",_tag,_200);
}
objj_msgSend(_210,"encodeRect:forKey:",_frame,_1f9);
objj_msgSend(_210,"encodeRect:forKey:",_bounds,_1f8);
if(_window!==nil){
objj_msgSend(_210,"encodeConditionalObject:forKey:",_window,_203);
}
var _211=objj_msgSend(_subviews,"count"),_212=_subviews;
if(_211>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_212=objj_msgSend(_212,"copy");
while(_211--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_212[_211])){
_212.splice(_211,1);
}
}
}
if(_212.length>0){
objj_msgSend(_210,"encodeObject:forKey:",_212,_1fe);
}
if(_superview!==nil){
objj_msgSend(_210,"encodeConditionalObject:forKey:",_superview,_1ff);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_210,"encodeInt:forKey:",_autoresizingMask,_1f5);
}
if(!_autoresizesSubviews){
objj_msgSend(_210,"encodeBool:forKey:",_autoresizesSubviews,_1f6);
}
if(_backgroundColor!==nil){
objj_msgSend(_210,"encodeObject:forKey:",_backgroundColor,_1f7);
}
if(_hitTests!==YES){
objj_msgSend(_210,"encodeBool:forKey:",_hitTests,_1fa);
}
if(_opacity!==1){
objj_msgSend(_210,"encodeFloat:forKey:",_opacity,_1fd);
}
if(_isHidden){
objj_msgSend(_210,"encodeBool:forKey:",_isHidden,_1fc);
}
if(_toolTip){
objj_msgSend(_210,"encodeObject:forKey:",_toolTip,_1fb);
}
var _213=objj_msgSend(self,"nextKeyView");
if(_213!==nil&&!objj_msgSend(_213,"isEqual:",self)){
objj_msgSend(_210,"encodeConditionalObject:forKey:",_213,_204);
}
var _214=objj_msgSend(self,"previousKeyView");
if(_214!==nil&&!objj_msgSend(_214,"isEqual:",self)){
objj_msgSend(_210,"encodeConditionalObject:forKey:",_214,_205);
}
objj_msgSend(_210,"encodeObject:forKey:",objj_msgSend(self,"themeClass"),_201);
objj_msgSend(_210,"encodeInt:forKey:",CPThemeStateName(_themeState),_202);
for(var _215 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_215)){
CPThemeAttributeEncode(_210,_themeAttributes[_215]);
}
}
}
})]);
var _cd=function(_216){
var _217=_216._superview;
return {autoresizingMask:_216._autoresizingMask,frame:CGRectMakeCopy(_216._frame),index:(_217?objj_msgSend(_217._subviews,"indexOfObjectIdenticalTo:",_216):0),superview:_217};
};
var _11f=function(_218,_219){
var _21a=CGAffineTransformMakeIdentity(),_21b=YES,_21c=nil,_21d=nil;
if(_218){
var view=_218;
while(view&&view!=_219){
var _21e=view._frame;
_21a.tx+=(_21e.origin.x);
_21a.ty+=(_21e.origin.y);
if(view._boundsTransform){
var tx=_21a.tx*view._boundsTransform.a+_21a.ty*view._boundsTransform.c+view._boundsTransform.tx;
_21a.ty=_21a.tx*view._boundsTransform.b+_21a.ty*view._boundsTransform.d+view._boundsTransform.ty;
_21a.tx=tx;
var a=_21a.a*view._boundsTransform.a+_21a.b*view._boundsTransform.c,b=_21a.a*view._boundsTransform.b+_21a.b*view._boundsTransform.d,c=_21a.c*view._boundsTransform.a+_21a.d*view._boundsTransform.c;
_21a.d=_21a.c*view._boundsTransform.b+_21a.d*view._boundsTransform.d;
_21a.a=a;
_21a.b=b;
_21a.c=c;
}
view=view._superview;
}
if(view===_219){
return _21a;
}else{
if(_218&&_219){
_21c=objj_msgSend(_218,"window");
_21d=objj_msgSend(_219,"window");
if(_21c&&_21d&&_21c!==_21d){
_21b=NO;
var _21e=objj_msgSend(_21c,"frame");
_21a.tx+=(_21e.origin.x);
_21a.ty+=(_21e.origin.y);
}
}
}
}
var view=_219;
while(view){
var _21e=view._frame;
_21a.tx-=(_21e.origin.x);
_21a.ty-=(_21e.origin.y);
if(view._boundsTransform){
var tx=_21a.tx*view._inverseBoundsTransform.a+_21a.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_21a.ty=_21a.tx*view._inverseBoundsTransform.b+_21a.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_21a.tx=tx;
var a=_21a.a*view._inverseBoundsTransform.a+_21a.b*view._inverseBoundsTransform.c,b=_21a.a*view._inverseBoundsTransform.b+_21a.b*view._inverseBoundsTransform.d,c=_21a.c*view._inverseBoundsTransform.a+_21a.d*view._inverseBoundsTransform.c;
_21a.d=_21a.c*view._inverseBoundsTransform.b+_21a.d*view._inverseBoundsTransform.d;
_21a.a=a;
_21a.b=b;
_21a.c=c;
}
view=view._superview;
}
if(!_21b){
var _21e=objj_msgSend(_21d,"frame");
_21a.tx-=(_21e.origin.x);
_21a.ty-=(_21e.origin.y);
}
return _21a;
};
