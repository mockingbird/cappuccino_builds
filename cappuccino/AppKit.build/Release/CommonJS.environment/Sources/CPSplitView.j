@STATIC;1.0;i;13;CPButtonBar.ji;9;CPImage.ji;8;CPView.jt;27446;
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
_needsResizeSubviews=YES;
objj_msgSend(_34,"setNeedsLayout");
objj_msgSend(_34,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_37,_38){
with(_37){
objj_msgSend(_37,"_adjustSubviewsWithCalculatedSize");
}
}),new objj_method(sel_getUid("drawDividerInRect:"),function(_39,_3a,_3b){
with(_39){
}
}),new objj_method(sel_getUid("_setupDOMDivider"),function(_3c,_3d){
with(_3c){
if(_isPaneSplitter){
_DOMDividerElements[_drawingDivider].style.backgroundColor="";
_DOMDividerElements[_drawingDivider].style.backgroundImage="url('"+_dividerImagePath+"')";
}else{
_DOMDividerElements[_drawingDivider].style.backgroundColor=objj_msgSend(objj_msgSend(_3c,"currentValueForThemeAttribute:","pane-divider-color"),"cssString");
_DOMDividerElements[_drawingDivider].style.backgroundImage="";
}
}
}),new objj_method(sel_getUid("viewWillDraw"),function(_3e,_3f){
with(_3e){
objj_msgSend(_3e,"_adjustSubviewsWithCalculatedSize");
}
}),new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"),function(_40,_41){
with(_40){
if(!_needsResizeSubviews){
return;
}
_needsResizeSubviews=NO;
objj_msgSend(_40,"resizeSubviewsWithOldSize:",objj_msgSend(_40,"_calculateSize"));
}
}),new objj_method(sel_getUid("_calculateSize"),function(_42,_43){
with(_42){
var _44=objj_msgSend(_42,"subviews"),_45=_44.length,_46=CGSizeMakeZero();
if(objj_msgSend(_42,"isVertical")){
_46.width+=objj_msgSend(_42,"dividerThickness")*(_45-1);
_46.height=CGRectGetHeight(objj_msgSend(_42,"frame"));
}else{
_46.width=CGRectGetWidth(objj_msgSend(_42,"frame"));
_46.height+=objj_msgSend(_42,"dividerThickness")*(_45-1);
}
while(_45--){
_46[_sizeComponent]+=objj_msgSend(_44[_45],"frame").size[_sizeComponent];
}
return _46;
}
}),new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"),function(_47,_48,_49,_4a){
with(_47){
var _4b=objj_msgSend(_subviews[_4a],"frame"),_4c=_4b.origin[_originComponent]+_4b.size[_sizeComponent],_4d=objj_msgSend(_47,"effectiveRectOfDividerAtIndex:",_4a),_4e=_buttonBars[_4a],_4f=null,_50=null;
if(_4e!=null){
_4f=objj_msgSend(_4e,"resizeControlFrame");
_4f.origin=objj_msgSend(_47,"convertPoint:fromView:",_4f.origin,_4e);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:"))){
_4d=objj_msgSend(_delegate,"splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:",_47,_4d,_4d,_4a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:"))){
_50=objj_msgSend(_delegate,"splitView:additionalEffectiveRectOfDividerAtIndex:",_47,_4a);
}
return CGRectContainsPoint(_4d,_49)||(_50&&CGRectContainsPoint(_50,_49))||(_4f&&CGRectContainsPoint(_4f,_49));
}
}),new objj_method(sel_getUid("hitTest:"),function(_51,_52,_53){
with(_51){
if(objj_msgSend(_51,"isHidden")||!objj_msgSend(_51,"hitTests")||!CGRectContainsPoint(objj_msgSend(_51,"frame"),_53)){
return nil;
}
var _54=objj_msgSend(_51,"convertPoint:fromView:",_53,objj_msgSend(_51,"superview")),_55=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_55;i++){
if(objj_msgSend(_51,"cursorAtPoint:hitDividerAtIndex:",_54,i)){
return _51;
}
}
return objj_msgSendSuper({receiver:_51,super_class:objj_getClass("CPSplitView").super_class},"hitTest:",_53);
}
}),new objj_method(sel_getUid("trackDivider:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(_58,"type");
if(_59==CPLeftMouseUp){
_shouldAutosave=YES;
if(_currentDivider!=CPNotFound){
_currentDivider=CPNotFound;
objj_msgSend(_56,"_autosave");
objj_msgSend(_56,"_updateResizeCursor:",_58);
}
return;
}
if(_59==CPLeftMouseDown){
var _5a=objj_msgSend(_56,"convertPoint:fromView:",objj_msgSend(_58,"locationInWindow"),nil),_5b=objj_msgSend(_subviews,"count")-1;
_currentDivider=CPNotFound;
for(var i=0;i<_5b;i++){
var _5c=objj_msgSend(_subviews[i],"frame"),_5d=_5c.origin[_originComponent]+_5c.size[_sizeComponent];
if(objj_msgSend(_56,"cursorAtPoint:hitDividerAtIndex:",_5a,i)){
if(objj_msgSend(_58,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:"))){
var _5e=objj_msgSend(_56,"minPossiblePositionOfDividerAtIndex:",i),_5f=objj_msgSend(_56,"maxPossiblePositionOfDividerAtIndex:",i),_60=objj_msgSend(_preCollapsePositions,"objectForKey:",""+i)||0;
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_56,_subviews[i])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_56,_subviews[i],i)){
if(objj_msgSend(_56,"isSubviewCollapsed:",_subviews[i])){
objj_msgSend(_56,"setPosition:ofDividerAtIndex:",_60?_60:(_5e+(_5f-_5e)/2),i);
}else{
objj_msgSend(_56,"setPosition:ofDividerAtIndex:",_5e,i);
}
}else{
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_56,_subviews[i+1])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_56,_subviews[i+1],i)){
if(objj_msgSend(_56,"isSubviewCollapsed:",_subviews[i+1])){
objj_msgSend(_56,"setPosition:ofDividerAtIndex:",_60?_60:(_5e+(_5f-_5e)/2),i);
}else{
objj_msgSend(_56,"setPosition:ofDividerAtIndex:",_5f,i);
}
}
}
}else{
_currentDivider=i;
_initialOffset=_5d-_5a[_originComponent];
_shouldAutosave=NO;
objj_msgSend(_56,"_postNotificationWillResize");
}
}
}
if(_currentDivider===CPNotFound){
return;
}
}else{
if(_59==CPLeftMouseDragged&&_currentDivider!=CPNotFound){
var _5a=objj_msgSend(_56,"convertPoint:fromView:",objj_msgSend(_58,"locationInWindow"),nil);
objj_msgSend(_56,"setPosition:ofDividerAtIndex:",(_5a[_originComponent]+_initialOffset),_currentDivider);
objj_msgSend(_56,"_updateResizeCursor:",_58);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_56,sel_getUid("trackDivider:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"trackDivider:",_63);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_64,_65){
with(_64){
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_66,_67,_68){
with(_66){
if(_currentDivider==CPNotFound){
objj_msgSend(_66,"_updateResizeCursor:",_68);
}
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_69,_6a,_6b){
with(_69){
if(_currentDivider==CPNotFound){
objj_msgSend(_69,"_updateResizeCursor:",_6b);
}
}
}),new objj_method(sel_getUid("mouseExited:"),function(_6c,_6d,_6e){
with(_6c){
if(_currentDivider==CPNotFound){
objj_msgSend(objj_msgSend(CPCursor,"arrowCursor"),"set");
}
}
}),new objj_method(sel_getUid("_updateResizeCursor:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(_6f,"convertPoint:fromView:",objj_msgSend(_71,"locationInWindow"),nil);
if(objj_msgSend(_71,"type")===CPLeftMouseUp&&!objj_msgSend(objj_msgSend(_6f,"window"),"acceptsMouseMovedEvents")){
objj_msgSend(objj_msgSend(CPCursor,"arrowCursor"),"set");
return;
}
for(var i=0,_73=objj_msgSend(_subviews,"count")-1;i<_73;i++){
if(_currentDivider===i||(_currentDivider==CPNotFound&&objj_msgSend(_6f,"cursorAtPoint:hitDividerAtIndex:",_72,i))){
var _74=objj_msgSend(_subviews[i],"frame"),_75=_74.size[_sizeComponent],_76=_74.origin[_originComponent]+_75,_77=objj_msgSend(_subviews[i+1],"frame"),_78=_77.size[_sizeComponent],_79=objj_msgSend(_6f,"_realPositionForPosition:ofDividerAtIndex:",_76-1,i)<_76,_7a=objj_msgSend(_6f,"_realPositionForPosition:ofDividerAtIndex:",_76+1,i)>_76,_7b=objj_msgSend(CPCursor,"arrowCursor");
if(_75===0){
_7a=YES;
}else{
if(!_79&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"splitView:canCollapseSubview:",_6f,_subviews[i])){
_79=YES;
}
}
if(_78===0){
_7a=NO;
_79=YES;
}else{
if(!_7a&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"splitView:canCollapseSubview:",_6f,_subviews[i+1])){
_7a=YES;
}
}
if(_isVertical&&_79&&_7a){
_7b=objj_msgSend(CPCursor,"resizeLeftRightCursor");
}else{
if(_isVertical&&_79){
_7b=objj_msgSend(CPCursor,"resizeLeftCursor");
}else{
if(_isVertical&&_7a){
_7b=objj_msgSend(CPCursor,"resizeRightCursor");
}else{
if(_79&&_7a){
_7b=objj_msgSend(CPCursor,"resizeUpDownCursor");
}else{
if(_79){
_7b=objj_msgSend(CPCursor,"resizeUpCursor");
}else{
if(_7a){
_7b=objj_msgSend(CPCursor,"resizeDownCursor");
}
}
}
}
}
}
objj_msgSend(_7b,"set");
return;
}
}
objj_msgSend(objj_msgSend(CPCursor,"arrowCursor"),"set");
}
}),new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"),function(_7c,_7d,_7e){
with(_7c){
var _7f=objj_msgSend(_subviews[_7e+1],"frame");
if(_7e+1<objj_msgSend(_subviews,"count")-1){
return _7f.origin[_originComponent]+_7f.size[_sizeComponent]-objj_msgSend(_7c,"dividerThickness");
}else{
return objj_msgSend(_7c,"frame").size[_sizeComponent]-objj_msgSend(_7c,"dividerThickness");
}
}
}),new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"),function(_80,_81,_82){
with(_80){
if(_82>0){
var _83=objj_msgSend(_subviews[_82-1],"frame");
return _83.origin[_originComponent]+_83.size[_sizeComponent]+objj_msgSend(_80,"dividerThickness");
}else{
return 0;
}
}
}),new objj_method(sel_getUid("_realPositionForPosition:ofDividerAtIndex:"),function(_84,_85,_86,_87){
with(_84){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"))){
var _88=objj_msgSend(_delegate,"splitView:constrainSplitPosition:ofSubviewAt:",_84,_86,_87);
if((!isNaN(parseFloat(_88))&&isFinite(_88))){
_86=_88;
}
}
var _89=objj_msgSend(_84,"maxPossiblePositionOfDividerAtIndex:",_87),_8a=objj_msgSend(_84,"minPossiblePositionOfDividerAtIndex:",_87),_8b=_89,_8c=_8a;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"))){
var _8d=objj_msgSend(_delegate,"splitView:constrainMinCoordinate:ofSubviewAt:",_84,_8a,_87);
if((!isNaN(parseFloat(_8d))&&isFinite(_8d))){
_8c=_8d;
}
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"))){
var _8e=objj_msgSend(_delegate,"splitView:constrainMaxCoordinate:ofSubviewAt:",_84,_89,_87);
if((!isNaN(parseFloat(_8e))&&isFinite(_8e))){
_8b=_8e;
}
}
var _8f=_subviews[_87],_90=_subviews[_87+1],_91=MAX(MIN(_86,_8b),_8c);
if(_86<_8a+(_8c-_8a)/2){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))){
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_84,_8f)){
_91=_8a;
}
}
}
if(_86>_89-(_89-_8b)/2){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))){
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_84,_90)){
_91=_89;
}
}
}
return _91;
}
}),new objj_method(sel_getUid("setPosition:ofDividerAtIndex:"),function(_92,_93,_94,_95){
with(_92){
_shouldRestoreFromAutosaveUnlessFrameSize=nil;
if(YES){
_suppressResizeNotificationsMask|=_3;
}else{
_suppressResizeNotificationsMask=0;
}
objj_msgSend(_92,"_adjustSubviewsWithCalculatedSize");
var _96=objj_msgSend(_92,"_realPositionForPosition:ofDividerAtIndex:",_94,_95),_97=_subviews[_95],_98=objj_msgSend(_97,"frame"),_99=_subviews[_95+1],_9a=objj_msgSend(_99,"frame"),_9b=0,_9c=_98.size[_sizeComponent];
_98.size[_sizeComponent]=_96-_98.origin[_originComponent];
if(_9c!==0&&_98.size[_sizeComponent]===0){
_9b=_9c;
}
if(_9c!==_98.size[_sizeComponent]){
if((_suppressResizeNotificationsMask&_4)===0){
objj_msgSend(_92,"_postNotificationWillResize");
_suppressResizeNotificationsMask|=_4;
}
objj_msgSend(_subviews[_95],"setFrame:",_98);
if((_suppressResizeNotificationsMask&_3)!==0){
_suppressResizeNotificationsMask|=_5;
}else{
objj_msgSend(_92,"_postNotificationDidResize");
}
}
_9c=_9a.size[_sizeComponent];
var _9d=_9a.origin[_originComponent];
_9a.size[_sizeComponent]=_9a.origin[_originComponent]+_9a.size[_sizeComponent]-_96-objj_msgSend(_92,"dividerThickness");
if(_9c!==0&&_9a.size[_sizeComponent]===0){
_9b=_9a.origin[_originComponent];
}
_9a.origin[_originComponent]=_96+objj_msgSend(_92,"dividerThickness");
if(_9c!==_9a.size[_sizeComponent]||_9d!==_9a.origin[_originComponent]){
if((_suppressResizeNotificationsMask&_4)===0){
objj_msgSend(_92,"_postNotificationWillResize");
_suppressResizeNotificationsMask|=_4;
}
objj_msgSend(_subviews[_95+1],"setFrame:",_9a);
if((_suppressResizeNotificationsMask&_3)!==0){
_suppressResizeNotificationsMask|=_5;
}else{
objj_msgSend(_92,"_postNotificationDidResize");
}
}
if(_9b){
objj_msgSend(_preCollapsePositions,"setObject:forKey:",_9b,""+_95);
}
objj_msgSend(_92,"setNeedsDisplay:",YES);
if(((_suppressResizeNotificationsMask&_5)!==0)){
objj_msgSend(_92,"_postNotificationDidResize");
}
if(NO){
_suppressResizeNotificationsMask|=_3;
}else{
_suppressResizeNotificationsMask=0;
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_9e,_9f,_a0){
with(_9e){
if(_shouldRestoreFromAutosaveUnlessFrameSize){
_shouldAutosave=NO;
}else{
objj_msgSend(_9e,"_adjustSubviewsWithCalculatedSize");
}
objj_msgSendSuper({receiver:_9e,super_class:objj_getClass("CPSplitView").super_class},"setFrameSize:",_a0);
if(_shouldRestoreFromAutosaveUnlessFrameSize){
_shouldAutosave=YES;
}
objj_msgSend(_9e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_a1,_a2,_a3){
with(_a1){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:resizeSubviewsWithOldSize:"))){
objj_msgSend(_delegate,"splitView:resizeSubviewsWithOldSize:",_a1,_a3);
return;
}
objj_msgSend(_a1,"adjustSubviews");
}
}),new objj_method(sel_getUid("adjustSubviews"),function(_a4,_a5){
with(_a4){
var _a6=objj_msgSend(_subviews,"count");
if(!_a6){
return;
}
if((_suppressResizeNotificationsMask&_4)===0){
objj_msgSend(_a4,"_postNotificationWillResize");
_suppressResizeNotificationsMask|=_4;
}
objj_msgSend(_a4,"_postNotificationWillResize");
var _a7=0,_a8=objj_msgSend(_a4,"bounds"),_a9=_a8.size[_sizeComponent],_aa=objj_msgSend(_a4,"_calculateSize"),_ab=objj_msgSend(_a4,"dividerThickness"),_ac=_a6-1,_ad=0,_ae=0,_af={},_b0=[],_b1=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:shouldAdjustSizeOfSubview:"));
for(_a7=0;_a7<_a6;++_a7){
var _b2=_subviews[_a7],_b3=!_b1||objj_msgSend(_delegate,"splitView:shouldAdjustSizeOfSubview:",_a4,_b2),_b4=objj_msgSend(_b2,"frame").size[_sizeComponent];
_af[_a7]=_b3;
_b0.push(_b4);
if(_b3){
_ad+=_b4;
_ae++;
}
}
var _b5=_aa[_sizeComponent]-_ad,_b6=_a9-_b5,_b7=0;
if(_b6<0){
_b7=-_b6;
_b6=0;
}
var _b8=_a6-_ae;
for(_a7=0;_a7<_a6;++_a7){
var _b2=_subviews[_a7],_b9=CGRectMakeCopy(_a8),_b3=_af[_a7],_ba=0;
if(_a7+1===_a6){
_ba=_a9-_b9.origin[_originComponent];
}else{
if(!_b3){
var _bb=MIN(_b7/_b8,_b0[_a7]);
_ba=_b0[_a7]-_bb;
_b7-=_bb;
_b8--;
}else{
if(_ad>0){
_ba=_b6*_b0[_a7]/_ad;
}else{
_ba=_b6/_ae;
}
}
}
_ba=MAX(0,ROUND(_ba));
_b9.size[_sizeComponent]=_ba;
objj_msgSend(_b2,"setFrame:",_b9);
_a8.origin[_originComponent]+=_ba+_ab;
}
if((_suppressResizeNotificationsMask&_3)!==0){
_suppressResizeNotificationsMask|=_5;
}else{
objj_msgSend(_a4,"_postNotificationDidResize");
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_bc,_bd,_be){
with(_bc){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewDidResizeSubviewsNotification,_bc);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewWillResizeSubviewsNotification,_bc);
}
_delegate=_be;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewDidResizeSubviews:"),CPSplitViewDidResizeSubviewsNotification,_bc);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewWillResizeSubviews:"),CPSplitViewWillResizeSubviewsNotification,_bc);
}
}
}),new objj_method(sel_getUid("setButtonBar:forDividerAtIndex:"),function(_bf,_c0,_c1,_c2){
with(_bf){
if(!_c1){
_buttonBars[_c2]=nil;
return;
}
var _c3=objj_msgSend(_c1,"superview"),_c4=_c1;
while(_c3&&_c3!==_bf){
_c4=_c3;
_c3=objj_msgSend(_c3,"superview");
}
if(_c3!==_bf){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"CPSplitView button bar must be a subview of the split view.");
}
var _c5=objj_msgSend(objj_msgSend(_bf,"subviews"),"indexOfObject:",_c4);
objj_msgSend(_c1,"setHasResizeControl:",YES);
objj_msgSend(_c1,"setResizeControlIsLeftAligned:",_c2<_c5);
_buttonBars[_c2]=_c1;
}
}),new objj_method(sel_getUid("_postNotificationWillResize"),function(_c6,_c7){
with(_c6){
var _c8=nil;
if(_currentDivider!==CPNotFound){
_c8=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_currentDivider,"CPSplitViewDividerIndex");
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPSplitViewWillResizeSubviewsNotification,_c6,_c8);
}
}),new objj_method(sel_getUid("_postNotificationDidResize"),function(_c9,_ca){
with(_c9){
var _cb=nil;
if(_currentDivider!==CPNotFound){
_cb=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_currentDivider,"CPSplitViewDividerIndex");
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPSplitViewDidResizeSubviewsNotification,_c9,_cb);
objj_msgSend(_c9,"_autosave");
}
}),new objj_method(sel_getUid("setAutosaveName:"),function(_cc,_cd,_ce){
with(_cc){
if(_autosaveName==_ce){
return;
}
_autosaveName=_ce;
}
}),new objj_method(sel_getUid("autosaveName"),function(_cf,_d0){
with(_cf){
return _autosaveName;
}
}),new objj_method(sel_getUid("_autosave"),function(_d1,_d2){
with(_d1){
if(_shouldRestoreFromAutosaveUnlessFrameSize||!_shouldAutosave||!_autosaveName){
return;
}
var _d3=objj_msgSend(CPUserDefaults,"standardUserDefaults"),_d4=objj_msgSend(_d1,"_framesKeyForAutosaveName:",objj_msgSend(_d1,"autosaveName")),_d5=objj_msgSend(_d1,"_precollapseKeyForAutosaveName:",objj_msgSend(_d1,"autosaveName")),_d6=objj_msgSend(_subviews,"count"),_d7=objj_msgSend(CPMutableArray,"new"),_d8=objj_msgSend(CPMutableArray,"new");
for(var i=0;i<_d6;i++){
var _d9=objj_msgSend(_subviews[i],"frame");
objj_msgSend(_d7,"addObject:",CPStringFromRect(_d9));
objj_msgSend(_d8,"addObject:",objj_msgSend(_preCollapsePositions,"objectForKey:",""+i));
}
objj_msgSend(_d3,"setObject:forKey:",_d7,_d4);
objj_msgSend(_d3,"setObject:forKey:",_d8,_d5);
}
}),new objj_method(sel_getUid("_restoreFromAutosaveIfNeeded"),function(_da,_db){
with(_da){
if(_shouldRestoreFromAutosaveUnlessFrameSize&&!(objj_msgSend(_da,"frameSize").width==_shouldRestoreFromAutosaveUnlessFrameSize.width&&objj_msgSend(_da,"frameSize").height==_shouldRestoreFromAutosaveUnlessFrameSize.height)){
objj_msgSend(_da,"_restoreFromAutosave");
}
_shouldRestoreFromAutosaveUnlessFrameSize=nil;
}
}),new objj_method(sel_getUid("_restoreFromAutosave"),function(_dc,_dd){
with(_dc){
if(!_autosaveName){
return;
}
var _de=objj_msgSend(_dc,"_framesKeyForAutosaveName:",objj_msgSend(_dc,"autosaveName")),_df=objj_msgSend(_dc,"_precollapseKeyForAutosaveName:",objj_msgSend(_dc,"autosaveName")),_e0=objj_msgSend(CPUserDefaults,"standardUserDefaults"),_e1=objj_msgSend(_e0,"objectForKey:",_de),_e2=objj_msgSend(_e0,"objectForKey:",_df);
if(_e1){
var _e3=objj_msgSend(_dc,"dividerThickness"),_e4=0;
_shouldAutosave=NO;
for(var i=0,_e5=objj_msgSend(_e1,"count")-1;i<_e5;i++){
var _e6=CPRectFromString(_e1[i]);
_e4+=_e6.size[_sizeComponent];
objj_msgSend(_dc,"setPosition:ofDividerAtIndex:",_e4,i);
_e4+=_e3;
}
_shouldAutosave=YES;
}
if(_e2){
_preCollapsePositions=objj_msgSend(CPMutableDictionary,"new");
for(var i=0,_e5=objj_msgSend(_e2,"count");i<_e5;i++){
objj_msgSend(_preCollapsePositions,"setObject:forKey:",_e2[i],i+"");
}
}
}
}),new objj_method(sel_getUid("_framesKeyForAutosaveName:"),function(_e7,_e8,_e9){
with(_e7){
if(!_e9){
return nil;
}
return "CPSplitView Subview Frames "+_e9;
}
}),new objj_method(sel_getUid("_precollapseKeyForAutosaveName:"),function(_ea,_eb,_ec){
with(_ea){
if(!_ec){
return nil;
}
return "CPSplitView Subview Precollapse Positions "+_ec;
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("defaultThemeClass"),function(_ed,_ee){
with(_ed){
return "splitview";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_ef,_f0){
with(_ef){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[1,10,objj_msgSend(CPColor,"grayColor")],["divider-thickness","pane-divider-thickness","pane-divider-color"]);
}
}),new objj_method(sel_getUid("initialize"),function(_f1,_f2){
with(_f1){
if(_f1!==objj_msgSend(CPSplitView,"class")){
return;
}
var _f3=objj_msgSend(CPBundle,"bundleForClass:",_f1);
_1=CPImageInBundle("CPSplitView/CPSplitViewHorizontal.png",CGSizeMake(5,10),_f3);
_2=CPImageInBundle("CPSplitView/CPSplitViewVertical.png",CGSizeMake(10,5),_f3);
}
})]);
var _f4="CPSplitViewDelegateKey",_f5="CPSplitViewIsVerticalKey",_f6="CPSplitViewIsPaneSplitterKey",_f7="CPSplitViewButtonBarsKey",_f8="CPSplitViewAutosaveNameKey";
var _6=objj_getClass("CPSplitView");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_f9,_fa,_fb){
with(_f9){
_autosaveName=objj_msgSend(_fb,"decodeObjectForKey:",_f8);
if(_autosaveName){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_restoreFromAutosaveIfNeeded"),_f9,nil,0,[CPDefaultRunLoopMode]);
}
_f9=objj_msgSendSuper({receiver:_f9,super_class:objj_getClass("CPSplitView").super_class},"initWithCoder:",_fb);
if(_f9){
_suppressResizeNotificationsMask=0;
_preCollapsePositions=objj_msgSend(CPMutableDictionary,"new");
_currentDivider=CPNotFound;
_shouldAutosave=YES;
_DOMDividerElements=[];
_buttonBars=objj_msgSend(_fb,"decodeObjectForKey:",_f7)||[];
objj_msgSend(_f9,"setDelegate:",objj_msgSend(_fb,"decodeObjectForKey:",_f4));
_isPaneSplitter=objj_msgSend(_fb,"decodeBoolForKey:",_f6);
objj_msgSend(_f9,"_setVertical:",objj_msgSend(_fb,"decodeBoolForKey:",_f5));
if(_autosaveName){
objj_msgSend(_f9,"_restoreFromAutosave");
_shouldRestoreFromAutosaveUnlessFrameSize=objj_msgSend(_f9,"frameSize");
}
}
return _f9;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_fc,_fd,_fe){
with(_fc){
objj_msgSendSuper({receiver:_fc,super_class:objj_getClass("CPSplitView").super_class},"encodeWithCoder:",_fe);
objj_msgSend(_fe,"encodeConditionalObject:forKey:",_delegate,_f4);
objj_msgSend(_fe,"encodeBool:forKey:",_isVertical,_f5);
objj_msgSend(_fe,"encodeBool:forKey:",_isPaneSplitter,_f6);
objj_msgSend(_fe,"encodeObject:forKey:",_autosaveName,_f8);
}
})]);
