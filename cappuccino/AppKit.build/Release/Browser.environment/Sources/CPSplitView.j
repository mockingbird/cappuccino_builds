@STATIC;1.0;i;13;CPButtonBar.ji;9;CPImage.ji;8;CPView.jt;28486;
objj_executeFile("CPButtonBar.j",YES);
objj_executeFile("CPImage.j",YES);
objj_executeFile("CPView.j",YES);
CPSplitViewDidResizeSubviewsNotification="CPSplitViewDidResizeSubviewsNotification";
CPSplitViewWillResizeSubviewsNotification="CPSplitViewWillResizeSubviewsNotification";
var _1=nil,_2=nil,_3=1,_4=1<<1,_5=1<<2;
var _6=objj_allocateClassPair(CPView,"CPSplitView"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_delegate"),new objj_ivar("_isVertical"),new objj_ivar("_isPaneSplitter"),new objj_ivar("_currentDivider"),new objj_ivar("_initialOffset"),new objj_ivar("_preCollapsePositions"),new objj_ivar("_originComponent"),new objj_ivar("_sizeComponent"),new objj_ivar("_DOMDividerElements"),new objj_ivar("_dividerImagePath"),new objj_ivar("_drawingDivider"),new objj_ivar("_autosaveName"),new objj_ivar("_shouldAutosave"),new objj_ivar("_shouldRestoreFromAutosaveUnlessFrameSize"),new objj_ivar("_needsResizeSubviews"),new objj_ivar("_suppressResizeNotificationsMask"),new objj_ivar("_buttonBars")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPSplitView").super_class},"initWithFrame:",_a)){
_suppressResizeNotificationsMask=0;
_preCollapsePositions=objj_msgSend(CPMutableDictionary,"new");
_currentDivider=CPNotFound;
_DOMDividerElements=[];
_buttonBars=[];
_shouldAutosave=YES;
objj_msgSend(_8,"_setVertical:",YES);
}
return _8;
}
}),new objj_method(sel_getUid("dividerThickness"),function(_b,_c){
with(_b){
return objj_msgSend(_b,"currentValueForThemeAttribute:",objj_msgSend(_b,"isPaneSplitter")?"pane-divider-thickness":"divider-thickness");
}
}),new objj_method(sel_getUid("isVertical"),function(_d,_e){
with(_d){
return _isVertical;
}
}),new objj_method(sel_getUid("setVertical:"),function(_f,_10,_11){
with(_f){
if(!objj_msgSend(_f,"_setVertical:",_11)){
return;
}
var _12=objj_msgSend(_f,"frame"),_13=objj_msgSend(_f,"dividerThickness");
objj_msgSend(_f,"_postNotificationWillResize");
var _14=ROUND((_12.size[_sizeComponent]-_13*(_subviews.length-1))/_subviews.length),_15=0,_16=_subviews.length;
if(objj_msgSend(_f,"isVertical")){
for(;_15<_16;++_15){
objj_msgSend(_subviews[_15],"setFrame:",CGRectMake(ROUND((_14+_13)*_15),0,_14,_12.size.height));
}
}else{
for(;_15<_16;++_15){
objj_msgSend(_subviews[_15],"setFrame:",CGRectMake(0,ROUND((_14+_13)*_15),_12.size.width,_14));
}
}
objj_msgSend(_f,"setNeedsDisplay:",YES);
objj_msgSend(_f,"_postNotificationDidResize");
}
}),new objj_method(sel_getUid("_setVertical:"),function(_17,_18,_19){
with(_17){
var _1a=(_isVertical!=_19);
_isVertical=_19;
_originComponent=objj_msgSend(_17,"isVertical")?"x":"y";
_sizeComponent=objj_msgSend(_17,"isVertical")?"width":"height";
_dividerImagePath=objj_msgSend(_17,"isVertical")?objj_msgSend(_2,"filename"):objj_msgSend(_1,"filename");
return _1a;
}
}),new objj_method(sel_getUid("isPaneSplitter"),function(_1b,_1c){
with(_1b){
return _isPaneSplitter;
}
}),new objj_method(sel_getUid("setIsPaneSplitter:"),function(_1d,_1e,_1f){
with(_1d){
if(_isPaneSplitter==_1f){
return;
}
_isPaneSplitter=_1f;
if(_DOMDividerElements[_drawingDivider]){
objj_msgSend(_1d,"_setupDOMDivider");
}
_needsResizeSubviews=YES;
objj_msgSend(_1d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_20,_21,_22){
with(_20){
_needsResizeSubviews=YES;
}
}),new objj_method(sel_getUid("isSubviewCollapsed:"),function(_23,_24,_25){
with(_23){
return objj_msgSend(_25,"frame").size[_sizeComponent]<1?YES:NO;
}
}),new objj_method(sel_getUid("rectOfDividerAtIndex:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_subviews[_28],"frame"),_2a=CGRectMakeZero();
_2a.size=objj_msgSend(_26,"frame").size;
_2a.size[_sizeComponent]=objj_msgSend(_26,"dividerThickness");
_2a.origin[_originComponent]=_29.origin[_originComponent]+_29.size[_sizeComponent];
return _2a;
}
}),new objj_method(sel_getUid("effectiveRectOfDividerAtIndex:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(_2b,"rectOfDividerAtIndex:",_2d),_2f=2;
_2e.size[_sizeComponent]+=_2f*2;
_2e.origin[_originComponent]-=_2f;
return _2e;
}
}),new objj_method(sel_getUid("drawRect:"),function(_30,_31,_32){
with(_30){
var _33=objj_msgSend(_subviews,"count")-1;
while((_33--)>0){
_drawingDivider=_33;
objj_msgSend(_30,"drawDividerInRect:",objj_msgSend(_30,"rectOfDividerAtIndex:",_33));
}
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_34,_35,_36){
with(_34){
var _37=_DOMDividerElements.pop();
if(_37){
_DOMElement.removeChild(_37);
}
_needsResizeSubviews=YES;
objj_msgSend(_34,"setNeedsLayout");
objj_msgSend(_34,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_38,_39){
with(_38){
objj_msgSend(_38,"_adjustSubviewsWithCalculatedSize");
}
}),new objj_method(sel_getUid("drawDividerInRect:"),function(_3a,_3b,_3c){
with(_3a){
if(!_DOMDividerElements[_drawingDivider]){
_DOMDividerElements[_drawingDivider]=document.createElement("div");
_DOMDividerElements[_drawingDivider].style.position="absolute";
_DOMDividerElements[_drawingDivider].style.backgroundRepeat="repeat";
_DOMElement.appendChild(_DOMDividerElements[_drawingDivider]);
}
objj_msgSend(_3a,"_setupDOMDivider");
if(NULL){
var _3d={x:CGPointMake((_3c.origin.x),(_3c.origin.y)).x*NULL.a+CGPointMake((_3c.origin.x),(_3c.origin.y)).y*NULL.c+NULL.tx,y:CGPointMake((_3c.origin.x),(_3c.origin.y)).x*NULL.b+CGPointMake((_3c.origin.x),(_3c.origin.y)).y*NULL.d+NULL.ty};
}else{
var _3d={x:(_3c.origin.x),y:(_3c.origin.y)};
}
_DOMDividerElements[_drawingDivider].style.left=ROUND(_3d.x)+"px";
_DOMDividerElements[_drawingDivider].style.top=ROUND(_3d.y)+"px";
_DOMDividerElements[_drawingDivider].style.width=MAX(0,ROUND((_3c.size.width)))+"px";
_DOMDividerElements[_drawingDivider].style.height=MAX(0,ROUND((_3c.size.height)))+"px";
}
}),new objj_method(sel_getUid("_setupDOMDivider"),function(_3e,_3f){
with(_3e){
if(_isPaneSplitter){
_DOMDividerElements[_drawingDivider].style.backgroundColor="";
_DOMDividerElements[_drawingDivider].style.backgroundImage="url('"+_dividerImagePath+"')";
}else{
_DOMDividerElements[_drawingDivider].style.backgroundColor=objj_msgSend(objj_msgSend(_3e,"currentValueForThemeAttribute:","pane-divider-color"),"cssString");
_DOMDividerElements[_drawingDivider].style.backgroundImage="";
}
}
}),new objj_method(sel_getUid("viewWillDraw"),function(_40,_41){
with(_40){
objj_msgSend(_40,"_adjustSubviewsWithCalculatedSize");
}
}),new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"),function(_42,_43){
with(_42){
if(!_needsResizeSubviews){
return;
}
_needsResizeSubviews=NO;
objj_msgSend(_42,"resizeSubviewsWithOldSize:",objj_msgSend(_42,"_calculateSize"));
}
}),new objj_method(sel_getUid("_calculateSize"),function(_44,_45){
with(_44){
var _46=objj_msgSend(_44,"subviews"),_47=_46.length,_48=CGSizeMakeZero();
if(objj_msgSend(_44,"isVertical")){
_48.width+=objj_msgSend(_44,"dividerThickness")*(_47-1);
_48.height=CGRectGetHeight(objj_msgSend(_44,"frame"));
}else{
_48.width=CGRectGetWidth(objj_msgSend(_44,"frame"));
_48.height+=objj_msgSend(_44,"dividerThickness")*(_47-1);
}
while(_47--){
_48[_sizeComponent]+=objj_msgSend(_46[_47],"frame").size[_sizeComponent];
}
return _48;
}
}),new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"),function(_49,_4a,_4b,_4c){
with(_49){
var _4d=objj_msgSend(_subviews[_4c],"frame"),_4e=_4d.origin[_originComponent]+_4d.size[_sizeComponent],_4f=objj_msgSend(_49,"effectiveRectOfDividerAtIndex:",_4c),_50=_buttonBars[_4c],_51=null,_52=null;
if(_50!=null){
_51=objj_msgSend(_50,"resizeControlFrame");
_51.origin=objj_msgSend(_49,"convertPoint:fromView:",_51.origin,_50);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:"))){
_4f=objj_msgSend(_delegate,"splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:",_49,_4f,_4f,_4c);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:"))){
_52=objj_msgSend(_delegate,"splitView:additionalEffectiveRectOfDividerAtIndex:",_49,_4c);
}
return CGRectContainsPoint(_4f,_4b)||(_52&&CGRectContainsPoint(_52,_4b))||(_51&&CGRectContainsPoint(_51,_4b));
}
}),new objj_method(sel_getUid("hitTest:"),function(_53,_54,_55){
with(_53){
if(objj_msgSend(_53,"isHidden")||!objj_msgSend(_53,"hitTests")||!CGRectContainsPoint(objj_msgSend(_53,"frame"),_55)){
return nil;
}
var _56=objj_msgSend(_53,"convertPoint:fromView:",_55,objj_msgSend(_53,"superview")),_57=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_57;i++){
if(objj_msgSend(_53,"cursorAtPoint:hitDividerAtIndex:",_56,i)){
return _53;
}
}
return objj_msgSendSuper({receiver:_53,super_class:objj_getClass("CPSplitView").super_class},"hitTest:",_55);
}
}),new objj_method(sel_getUid("trackDivider:"),function(_58,_59,_5a){
with(_58){
var _5b=objj_msgSend(_5a,"type");
if(_5b==CPLeftMouseUp){
_shouldAutosave=YES;
if(_currentDivider!=CPNotFound){
_currentDivider=CPNotFound;
objj_msgSend(_58,"_autosave");
objj_msgSend(_58,"_updateResizeCursor:",_5a);
}
return;
}
if(_5b==CPLeftMouseDown){
var _5c=objj_msgSend(_58,"convertPoint:fromView:",objj_msgSend(_5a,"locationInWindow"),nil),_5d=objj_msgSend(_subviews,"count")-1;
_currentDivider=CPNotFound;
for(var i=0;i<_5d;i++){
var _5e=objj_msgSend(_subviews[i],"frame"),_5f=_5e.origin[_originComponent]+_5e.size[_sizeComponent];
if(objj_msgSend(_58,"cursorAtPoint:hitDividerAtIndex:",_5c,i)){
if(objj_msgSend(_5a,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:"))){
var _60=objj_msgSend(_58,"minPossiblePositionOfDividerAtIndex:",i),_61=objj_msgSend(_58,"maxPossiblePositionOfDividerAtIndex:",i),_62=objj_msgSend(_preCollapsePositions,"objectForKey:",""+i)||0;
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_58,_subviews[i])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_58,_subviews[i],i)){
if(objj_msgSend(_58,"isSubviewCollapsed:",_subviews[i])){
objj_msgSend(_58,"setPosition:ofDividerAtIndex:",_62?_62:(_60+(_61-_60)/2),i);
}else{
objj_msgSend(_58,"setPosition:ofDividerAtIndex:",_60,i);
}
}else{
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_58,_subviews[i+1])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_58,_subviews[i+1],i)){
if(objj_msgSend(_58,"isSubviewCollapsed:",_subviews[i+1])){
objj_msgSend(_58,"setPosition:ofDividerAtIndex:",_62?_62:(_60+(_61-_60)/2),i);
}else{
objj_msgSend(_58,"setPosition:ofDividerAtIndex:",_61,i);
}
}
}
}else{
_currentDivider=i;
_initialOffset=_5f-_5c[_originComponent];
_shouldAutosave=NO;
objj_msgSend(_58,"_postNotificationWillResize");
}
}
}
if(_currentDivider===CPNotFound){
return;
}
}else{
if(_5b==CPLeftMouseDragged&&_currentDivider!=CPNotFound){
var _5c=objj_msgSend(_58,"convertPoint:fromView:",objj_msgSend(_5a,"locationInWindow"),nil);
objj_msgSend(_58,"setPosition:ofDividerAtIndex:",(_5c[_originComponent]+_initialOffset),_currentDivider);
objj_msgSend(_58,"_updateResizeCursor:",_5a);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_58,sel_getUid("trackDivider:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_63,_64,_65){
with(_63){
objj_msgSend(_63,"trackDivider:",_65);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_66,_67){
with(_66){
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_68,_69,_6a){
with(_68){
if(_currentDivider==CPNotFound){
objj_msgSend(_68,"_updateResizeCursor:",_6a);
}
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_6b,_6c,_6d){
with(_6b){
if(_currentDivider==CPNotFound){
objj_msgSend(_6b,"_updateResizeCursor:",_6d);
}
}
}),new objj_method(sel_getUid("mouseExited:"),function(_6e,_6f,_70){
with(_6e){
if(_currentDivider==CPNotFound){
objj_msgSend(objj_msgSend(CPCursor,"arrowCursor"),"set");
}
}
}),new objj_method(sel_getUid("_updateResizeCursor:"),function(_71,_72,_73){
with(_71){
var _74=objj_msgSend(_71,"convertPoint:fromView:",objj_msgSend(_73,"locationInWindow"),nil);
if(objj_msgSend(_73,"type")===CPLeftMouseUp&&!objj_msgSend(objj_msgSend(_71,"window"),"acceptsMouseMovedEvents")){
objj_msgSend(objj_msgSend(CPCursor,"arrowCursor"),"set");
return;
}
for(var i=0,_75=objj_msgSend(_subviews,"count")-1;i<_75;i++){
if(_currentDivider===i||(_currentDivider==CPNotFound&&objj_msgSend(_71,"cursorAtPoint:hitDividerAtIndex:",_74,i))){
var _76=objj_msgSend(_subviews[i],"frame"),_77=_76.size[_sizeComponent],_78=_76.origin[_originComponent]+_77,_79=objj_msgSend(_subviews[i+1],"frame"),_7a=_79.size[_sizeComponent],_7b=objj_msgSend(_71,"_realPositionForPosition:ofDividerAtIndex:",_78-1,i)<_78,_7c=objj_msgSend(_71,"_realPositionForPosition:ofDividerAtIndex:",_78+1,i)>_78,_7d=objj_msgSend(CPCursor,"arrowCursor");
if(_77===0){
_7c=YES;
}else{
if(!_7b&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"splitView:canCollapseSubview:",_71,_subviews[i])){
_7b=YES;
}
}
if(_7a===0){
_7c=NO;
_7b=YES;
}else{
if(!_7c&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"splitView:canCollapseSubview:",_71,_subviews[i+1])){
_7c=YES;
}
}
if(_isVertical&&_7b&&_7c){
_7d=objj_msgSend(CPCursor,"resizeLeftRightCursor");
}else{
if(_isVertical&&_7b){
_7d=objj_msgSend(CPCursor,"resizeLeftCursor");
}else{
if(_isVertical&&_7c){
_7d=objj_msgSend(CPCursor,"resizeRightCursor");
}else{
if(_7b&&_7c){
_7d=objj_msgSend(CPCursor,"resizeUpDownCursor");
}else{
if(_7b){
_7d=objj_msgSend(CPCursor,"resizeUpCursor");
}else{
if(_7c){
_7d=objj_msgSend(CPCursor,"resizeDownCursor");
}
}
}
}
}
}
objj_msgSend(_7d,"set");
return;
}
}
objj_msgSend(objj_msgSend(CPCursor,"arrowCursor"),"set");
}
}),new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"),function(_7e,_7f,_80){
with(_7e){
var _81=objj_msgSend(_subviews[_80+1],"frame");
if(_80+1<objj_msgSend(_subviews,"count")-1){
return _81.origin[_originComponent]+_81.size[_sizeComponent]-objj_msgSend(_7e,"dividerThickness");
}else{
return objj_msgSend(_7e,"frame").size[_sizeComponent]-objj_msgSend(_7e,"dividerThickness");
}
}
}),new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"),function(_82,_83,_84){
with(_82){
if(_84>0){
var _85=objj_msgSend(_subviews[_84-1],"frame");
return _85.origin[_originComponent]+_85.size[_sizeComponent]+objj_msgSend(_82,"dividerThickness");
}else{
return 0;
}
}
}),new objj_method(sel_getUid("_realPositionForPosition:ofDividerAtIndex:"),function(_86,_87,_88,_89){
with(_86){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"))){
var _8a=objj_msgSend(_delegate,"splitView:constrainSplitPosition:ofSubviewAt:",_86,_88,_89);
if((!isNaN(parseFloat(_8a))&&isFinite(_8a))){
_88=_8a;
}
}
var _8b=objj_msgSend(_86,"maxPossiblePositionOfDividerAtIndex:",_89),_8c=objj_msgSend(_86,"minPossiblePositionOfDividerAtIndex:",_89),_8d=_8b,_8e=_8c;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"))){
var _8f=objj_msgSend(_delegate,"splitView:constrainMinCoordinate:ofSubviewAt:",_86,_8c,_89);
if((!isNaN(parseFloat(_8f))&&isFinite(_8f))){
_8e=_8f;
}
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"))){
var _90=objj_msgSend(_delegate,"splitView:constrainMaxCoordinate:ofSubviewAt:",_86,_8b,_89);
if((!isNaN(parseFloat(_90))&&isFinite(_90))){
_8d=_90;
}
}
var _91=_subviews[_89],_92=_subviews[_89+1],_93=MAX(MIN(_88,_8d),_8e);
if(_88<_8c+(_8e-_8c)/2){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))){
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_86,_91)){
_93=_8c;
}
}
}
if(_88>_8b-(_8b-_8d)/2){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))){
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_86,_92)){
_93=_8b;
}
}
}
return _93;
}
}),new objj_method(sel_getUid("setPosition:ofDividerAtIndex:"),function(_94,_95,_96,_97){
with(_94){
_shouldRestoreFromAutosaveUnlessFrameSize=nil;
if(YES){
_suppressResizeNotificationsMask|=_3;
}else{
_suppressResizeNotificationsMask=0;
}
objj_msgSend(_94,"_adjustSubviewsWithCalculatedSize");
var _98=objj_msgSend(_94,"_realPositionForPosition:ofDividerAtIndex:",_96,_97),_99=_subviews[_97],_9a=objj_msgSend(_99,"frame"),_9b=_subviews[_97+1],_9c=objj_msgSend(_9b,"frame"),_9d=0,_9e=_9a.size[_sizeComponent];
_9a.size[_sizeComponent]=_98-_9a.origin[_originComponent];
if(_9e!==0&&_9a.size[_sizeComponent]===0){
_9d=_9e;
}
if(_9e!==_9a.size[_sizeComponent]){
if((_suppressResizeNotificationsMask&_4)===0){
objj_msgSend(_94,"_postNotificationWillResize");
_suppressResizeNotificationsMask|=_4;
}
objj_msgSend(_subviews[_97],"setFrame:",_9a);
if((_suppressResizeNotificationsMask&_3)!==0){
_suppressResizeNotificationsMask|=_5;
}else{
objj_msgSend(_94,"_postNotificationDidResize");
}
}
_9e=_9c.size[_sizeComponent];
var _9f=_9c.origin[_originComponent];
_9c.size[_sizeComponent]=_9c.origin[_originComponent]+_9c.size[_sizeComponent]-_98-objj_msgSend(_94,"dividerThickness");
if(_9e!==0&&_9c.size[_sizeComponent]===0){
_9d=_9c.origin[_originComponent];
}
_9c.origin[_originComponent]=_98+objj_msgSend(_94,"dividerThickness");
if(_9e!==_9c.size[_sizeComponent]||_9f!==_9c.origin[_originComponent]){
if((_suppressResizeNotificationsMask&_4)===0){
objj_msgSend(_94,"_postNotificationWillResize");
_suppressResizeNotificationsMask|=_4;
}
objj_msgSend(_subviews[_97+1],"setFrame:",_9c);
if((_suppressResizeNotificationsMask&_3)!==0){
_suppressResizeNotificationsMask|=_5;
}else{
objj_msgSend(_94,"_postNotificationDidResize");
}
}
if(_9d){
objj_msgSend(_preCollapsePositions,"setObject:forKey:",_9d,""+_97);
}
objj_msgSend(_94,"setNeedsDisplay:",YES);
if(((_suppressResizeNotificationsMask&_5)!==0)){
objj_msgSend(_94,"_postNotificationDidResize");
}
if(NO){
_suppressResizeNotificationsMask|=_3;
}else{
_suppressResizeNotificationsMask=0;
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_a0,_a1,_a2){
with(_a0){
if(_shouldRestoreFromAutosaveUnlessFrameSize){
_shouldAutosave=NO;
}else{
objj_msgSend(_a0,"_adjustSubviewsWithCalculatedSize");
}
objj_msgSendSuper({receiver:_a0,super_class:objj_getClass("CPSplitView").super_class},"setFrameSize:",_a2);
if(_shouldRestoreFromAutosaveUnlessFrameSize){
_shouldAutosave=YES;
}
objj_msgSend(_a0,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_a3,_a4,_a5){
with(_a3){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:resizeSubviewsWithOldSize:"))){
objj_msgSend(_delegate,"splitView:resizeSubviewsWithOldSize:",_a3,_a5);
return;
}
objj_msgSend(_a3,"adjustSubviews");
}
}),new objj_method(sel_getUid("adjustSubviews"),function(_a6,_a7){
with(_a6){
var _a8=objj_msgSend(_subviews,"count");
if(!_a8){
return;
}
if((_suppressResizeNotificationsMask&_4)===0){
objj_msgSend(_a6,"_postNotificationWillResize");
_suppressResizeNotificationsMask|=_4;
}
objj_msgSend(_a6,"_postNotificationWillResize");
var _a9=0,_aa=objj_msgSend(_a6,"bounds"),_ab=_aa.size[_sizeComponent],_ac=objj_msgSend(_a6,"_calculateSize"),_ad=objj_msgSend(_a6,"dividerThickness"),_ae=_a8-1,_af=0,_b0=0,_b1={},_b2=[],_b3=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:shouldAdjustSizeOfSubview:"));
for(_a9=0;_a9<_a8;++_a9){
var _b4=_subviews[_a9],_b5=!_b3||objj_msgSend(_delegate,"splitView:shouldAdjustSizeOfSubview:",_a6,_b4),_b6=objj_msgSend(_b4,"frame").size[_sizeComponent];
_b1[_a9]=_b5;
_b2.push(_b6);
if(_b5){
_af+=_b6;
_b0++;
}
}
var _b7=_ac[_sizeComponent]-_af,_b8=_ab-_b7,_b9=0;
if(_b8<0){
_b9=-_b8;
_b8=0;
}
var _ba=_a8-_b0;
for(_a9=0;_a9<_a8;++_a9){
var _b4=_subviews[_a9],_bb=CGRectMakeCopy(_aa),_b5=_b1[_a9],_bc=0;
if(_a9+1===_a8){
_bc=_ab-_bb.origin[_originComponent];
}else{
if(!_b5){
var _bd=MIN(_b9/_ba,_b2[_a9]);
_bc=_b2[_a9]-_bd;
_b9-=_bd;
_ba--;
}else{
if(_af>0){
_bc=_b8*_b2[_a9]/_af;
}else{
_bc=_b8/_b0;
}
}
}
_bc=MAX(0,ROUND(_bc));
_bb.size[_sizeComponent]=_bc;
objj_msgSend(_b4,"setFrame:",_bb);
_aa.origin[_originComponent]+=_bc+_ad;
}
if((_suppressResizeNotificationsMask&_3)!==0){
_suppressResizeNotificationsMask|=_5;
}else{
objj_msgSend(_a6,"_postNotificationDidResize");
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_be,_bf,_c0){
with(_be){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewDidResizeSubviewsNotification,_be);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewWillResizeSubviewsNotification,_be);
}
_delegate=_c0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewDidResizeSubviews:"),CPSplitViewDidResizeSubviewsNotification,_be);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewWillResizeSubviews:"),CPSplitViewWillResizeSubviewsNotification,_be);
}
}
}),new objj_method(sel_getUid("setButtonBar:forDividerAtIndex:"),function(_c1,_c2,_c3,_c4){
with(_c1){
if(!_c3){
_buttonBars[_c4]=nil;
return;
}
var _c5=objj_msgSend(_c3,"superview"),_c6=_c3;
while(_c5&&_c5!==_c1){
_c6=_c5;
_c5=objj_msgSend(_c5,"superview");
}
if(_c5!==_c1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"CPSplitView button bar must be a subview of the split view.");
}
var _c7=objj_msgSend(objj_msgSend(_c1,"subviews"),"indexOfObject:",_c6);
objj_msgSend(_c3,"setHasResizeControl:",YES);
objj_msgSend(_c3,"setResizeControlIsLeftAligned:",_c4<_c7);
_buttonBars[_c4]=_c3;
}
}),new objj_method(sel_getUid("_postNotificationWillResize"),function(_c8,_c9){
with(_c8){
var _ca=nil;
if(_currentDivider!==CPNotFound){
_ca=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_currentDivider,"CPSplitViewDividerIndex");
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPSplitViewWillResizeSubviewsNotification,_c8,_ca);
}
}),new objj_method(sel_getUid("_postNotificationDidResize"),function(_cb,_cc){
with(_cb){
var _cd=nil;
if(_currentDivider!==CPNotFound){
_cd=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_currentDivider,"CPSplitViewDividerIndex");
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPSplitViewDidResizeSubviewsNotification,_cb,_cd);
objj_msgSend(_cb,"_autosave");
}
}),new objj_method(sel_getUid("setAutosaveName:"),function(_ce,_cf,_d0){
with(_ce){
if(_autosaveName==_d0){
return;
}
_autosaveName=_d0;
}
}),new objj_method(sel_getUid("autosaveName"),function(_d1,_d2){
with(_d1){
return _autosaveName;
}
}),new objj_method(sel_getUid("_autosave"),function(_d3,_d4){
with(_d3){
if(_shouldRestoreFromAutosaveUnlessFrameSize||!_shouldAutosave||!_autosaveName){
return;
}
var _d5=objj_msgSend(CPUserDefaults,"standardUserDefaults"),_d6=objj_msgSend(_d3,"_framesKeyForAutosaveName:",objj_msgSend(_d3,"autosaveName")),_d7=objj_msgSend(_d3,"_precollapseKeyForAutosaveName:",objj_msgSend(_d3,"autosaveName")),_d8=objj_msgSend(_subviews,"count"),_d9=objj_msgSend(CPMutableArray,"new"),_da=objj_msgSend(CPMutableArray,"new");
for(var i=0;i<_d8;i++){
var _db=objj_msgSend(_subviews[i],"frame");
objj_msgSend(_d9,"addObject:",CPStringFromRect(_db));
objj_msgSend(_da,"addObject:",objj_msgSend(_preCollapsePositions,"objectForKey:",""+i));
}
objj_msgSend(_d5,"setObject:forKey:",_d9,_d6);
objj_msgSend(_d5,"setObject:forKey:",_da,_d7);
}
}),new objj_method(sel_getUid("_restoreFromAutosaveIfNeeded"),function(_dc,_dd){
with(_dc){
if(_shouldRestoreFromAutosaveUnlessFrameSize&&!(objj_msgSend(_dc,"frameSize").width==_shouldRestoreFromAutosaveUnlessFrameSize.width&&objj_msgSend(_dc,"frameSize").height==_shouldRestoreFromAutosaveUnlessFrameSize.height)){
objj_msgSend(_dc,"_restoreFromAutosave");
}
_shouldRestoreFromAutosaveUnlessFrameSize=nil;
}
}),new objj_method(sel_getUid("_restoreFromAutosave"),function(_de,_df){
with(_de){
if(!_autosaveName){
return;
}
var _e0=objj_msgSend(_de,"_framesKeyForAutosaveName:",objj_msgSend(_de,"autosaveName")),_e1=objj_msgSend(_de,"_precollapseKeyForAutosaveName:",objj_msgSend(_de,"autosaveName")),_e2=objj_msgSend(CPUserDefaults,"standardUserDefaults"),_e3=objj_msgSend(_e2,"objectForKey:",_e0),_e4=objj_msgSend(_e2,"objectForKey:",_e1);
if(_e3){
var _e5=objj_msgSend(_de,"dividerThickness"),_e6=0;
_shouldAutosave=NO;
for(var i=0,_e7=objj_msgSend(_e3,"count")-1;i<_e7;i++){
var _e8=CPRectFromString(_e3[i]);
_e6+=_e8.size[_sizeComponent];
objj_msgSend(_de,"setPosition:ofDividerAtIndex:",_e6,i);
_e6+=_e5;
}
_shouldAutosave=YES;
}
if(_e4){
_preCollapsePositions=objj_msgSend(CPMutableDictionary,"new");
for(var i=0,_e7=objj_msgSend(_e4,"count");i<_e7;i++){
objj_msgSend(_preCollapsePositions,"setObject:forKey:",_e4[i],i+"");
}
}
}
}),new objj_method(sel_getUid("_framesKeyForAutosaveName:"),function(_e9,_ea,_eb){
with(_e9){
if(!_eb){
return nil;
}
return "CPSplitView Subview Frames "+_eb;
}
}),new objj_method(sel_getUid("_precollapseKeyForAutosaveName:"),function(_ec,_ed,_ee){
with(_ec){
if(!_ee){
return nil;
}
return "CPSplitView Subview Precollapse Positions "+_ee;
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("defaultThemeClass"),function(_ef,_f0){
with(_ef){
return "splitview";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_f1,_f2){
with(_f1){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[1,10,objj_msgSend(CPColor,"grayColor")],["divider-thickness","pane-divider-thickness","pane-divider-color"]);
}
}),new objj_method(sel_getUid("initialize"),function(_f3,_f4){
with(_f3){
if(_f3!==objj_msgSend(CPSplitView,"class")){
return;
}
var _f5=objj_msgSend(CPBundle,"bundleForClass:",_f3);
_1=CPImageInBundle("CPSplitView/CPSplitViewHorizontal.png",CGSizeMake(5,10),_f5);
_2=CPImageInBundle("CPSplitView/CPSplitViewVertical.png",CGSizeMake(10,5),_f5);
}
})]);
var _f6="CPSplitViewDelegateKey",_f7="CPSplitViewIsVerticalKey",_f8="CPSplitViewIsPaneSplitterKey",_f9="CPSplitViewButtonBarsKey",_fa="CPSplitViewAutosaveNameKey";
var _6=objj_getClass("CPSplitView");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_fb,_fc,_fd){
with(_fb){
_autosaveName=objj_msgSend(_fd,"decodeObjectForKey:",_fa);
if(_autosaveName){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_restoreFromAutosaveIfNeeded"),_fb,nil,0,[CPDefaultRunLoopMode]);
}
_fb=objj_msgSendSuper({receiver:_fb,super_class:objj_getClass("CPSplitView").super_class},"initWithCoder:",_fd);
if(_fb){
_suppressResizeNotificationsMask=0;
_preCollapsePositions=objj_msgSend(CPMutableDictionary,"new");
_currentDivider=CPNotFound;
_shouldAutosave=YES;
_DOMDividerElements=[];
_buttonBars=objj_msgSend(_fd,"decodeObjectForKey:",_f9)||[];
objj_msgSend(_fb,"setDelegate:",objj_msgSend(_fd,"decodeObjectForKey:",_f6));
_isPaneSplitter=objj_msgSend(_fd,"decodeBoolForKey:",_f8);
objj_msgSend(_fb,"_setVertical:",objj_msgSend(_fd,"decodeBoolForKey:",_f7));
if(_autosaveName){
objj_msgSend(_fb,"_restoreFromAutosave");
_shouldRestoreFromAutosaveUnlessFrameSize=objj_msgSend(_fb,"frameSize");
}
}
return _fb;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_fe,_ff,_100){
with(_fe){
objj_msgSendSuper({receiver:_fe,super_class:objj_getClass("CPSplitView").super_class},"encodeWithCoder:",_100);
objj_msgSend(_100,"encodeConditionalObject:forKey:",_delegate,_f6);
objj_msgSend(_100,"encodeBool:forKey:",_isVertical,_f7);
objj_msgSend(_100,"encodeBool:forKey:",_isPaneSplitter,_f8);
objj_msgSend(_100,"encodeObject:forKey:",_autosaveName,_fa);
}
})]);
