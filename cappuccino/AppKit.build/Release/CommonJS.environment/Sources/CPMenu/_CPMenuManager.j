@STATIC;1.0;I;21;Foundation/CPObject.jt;17004;
objj_executeFile("Foundation/CPObject.j",NO);
_CPMenuManagerScrollingStateUp=-1;
_CPMenuManagerScrollingStateDown=1;
_CPMenuManagerScrollingStateNone=0;
var _1=0.5,_2=nil;
var _3=objj_allocateClassPair(CPObject,"_CPMenuManager"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_startTime"),new objj_ivar("_mouseWasDragged"),new objj_ivar("_scrollingState"),new objj_ivar("_lastGlobalLocation"),new objj_ivar("_lastMouseOverMenuView"),new objj_ivar("_constraintRect"),new objj_ivar("_menuContainerStack"),new objj_ivar("_trackingCallback"),new objj_ivar("_keyBuffer"),new objj_ivar("_previousActiveItem"),new objj_ivar("_showTimerID")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
if(_2){
return _2;
}
return objj_msgSendSuper({receiver:_5,super_class:objj_getClass("_CPMenuManager").super_class},"init");
}
}),new objj_method(sel_getUid("trackingMenuContainer"),function(_7,_8){
with(_7){
return _menuContainerStack[0];
}
}),new objj_method(sel_getUid("trackingMenu"),function(_9,_a){
with(_9){
return objj_msgSend(objj_msgSend(_9,"trackingMenuContainer"),"menu");
}
}),new objj_method(sel_getUid("beginTracking:menuContainer:constraintRect:callback:"),function(_b,_c,_d,_e,_f,_10){
with(_b){
var _11=objj_msgSend(_e,"menu");
if(objj_msgSend(_11,"numberOfItems")<=0){
return;
}
CPApp._activeMenu=_11;
_startTime=objj_msgSend(_d,"timestamp");
_scrollingState=_CPMenuManagerScrollingStateNone;
_constraintRect=_f;
_menuContainerStack=[_e];
_trackingCallback=_10;
if(_11===objj_msgSend(CPApp,"mainMenu")){
var _12=objj_msgSend(_d,"globalLocation"),_13=objj_msgSend(_e,"convertGlobalToBase:",_12),_14=objj_msgSend(_e,"itemIndexAtPoint:",_13),_15=_14!==CPNotFound?objj_msgSend(_11,"itemAtIndex:",_14):nil;
_menuBarButtonItemIndex=_14;
_menuBarButtonMenuContainer=_e;
if(objj_msgSend(_15,"_isMenuBarButton")){
return objj_msgSend(_b,"trackMenuBarButtonEvent:",_d);
}
}
_mouseWasDragged=NO;
objj_msgSend(_b,"trackEvent:",_d);
}
}),new objj_method(sel_getUid("trackEvent:"),function(_16,_17,_18){
with(_16){
var _19=objj_msgSend(_18,"type"),_1a=objj_msgSend(_16,"trackingMenu");
if(_19===CPAppKitDefined){
return objj_msgSend(_16,"completeTracking");
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_16,sel_getUid("trackEvent:"),CPKeyDownMask|CPPeriodicMask|CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask|CPRightMouseUpMask|CPAppKitDefinedMask|CPScrollWheelMask,nil,nil,YES);
if(_19===CPKeyDown){
var _1b=_1a,_1c=objj_msgSend(objj_msgSend(_1b,"highlightedItem"),"submenu");
while(_1c&&objj_msgSend(_1c._menuWindow,"isVisible")){
_1b=_1c;
_1c=objj_msgSend(objj_msgSend(_1b,"highlightedItem"),"submenu");
}
if(objj_msgSend(_1b,"numberOfItems")){
objj_msgSend(_16,"interpretKeyEvent:forMenu:",_18,_1b);
}
return;
}
if(_keyBuffer){
if((objj_msgSend(_18,"timestamp")-_startTime)>(_1+objj_msgSend(_1d,"numberOfItems")/2)){
objj_msgSend(_16,"selectNextItemBeginningWith:inMenu:clearBuffer:",_keyBuffer,_1b,YES);
}
if(_19===CPPeriodic){
return;
}
}
var _1e=_19===CPPeriodic?_lastGlobalLocation:objj_msgSend(_18,"globalLocation");
if(!_1e){
return;
}
var _1f=objj_msgSend(_16,"menuContainerForPoint:",_1e),_1d=objj_msgSend(_1f,"menu"),_20=objj_msgSend(_1f,"convertGlobalToBase:",_1e),_21=_1f?objj_msgSend(_1f,"itemIndexAtPoint:",_20):CPNotFound,_22=_21!==CPNotFound?objj_msgSend(_1d,"itemAtIndex:",_21):nil;
if(_lastGlobalLocation&&CGRectContainsPoint(objj_msgSend(_1f,"globalFrame"),_lastGlobalLocation)&&!CGRectContainsPoint(objj_msgSend(_1f,"globalFrame"),_1e)){
objj_msgSend(_1d,"_highlightItemAtIndex:",CPNotFound);
}
_lastGlobalLocation=_1e;
if(!objj_msgSend(_22,"isEnabled")||objj_msgSend(_22,"_isMenuBarButton")){
_21=CPNotFound;
_22=nil;
}
var _23=objj_msgSend(_22,"view");
if(_19===CPScrollWheel&&!objj_msgSend(_1f,"isMenuBar")){
objj_msgSend(_1f,"scrollByDelta:",objj_msgSend(_18,"deltaY"));
}
if(_19===CPPeriodic){
if(_scrollingState===_CPMenuManagerScrollingStateUp){
objj_msgSend(_1f,"scrollUp");
}else{
if(_scrollingState===_CPMenuManagerScrollingStateDown){
objj_msgSend(_1f,"scrollDown");
}
}
}
if(_23){
if(!_lastMouseOverMenuView){
objj_msgSend(_1d,"_highlightItemAtIndex:",CPNotFound);
}
if(_lastMouseOverMenuView!=_23){
objj_msgSend(_23,"mouseExited:",_18);
objj_msgSend(_lastMouseOverMenuView,"mouseEntered:",_18);
_lastMouseOverMenuView=_23;
}
var _24=_1f;
if(!objj_msgSend(_24,"isKindOfClass:",CPWindow)){
_24=objj_msgSend(_24,"window");
}
objj_msgSend(_24,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",_19,_20,objj_msgSend(_18,"modifierFlags"),objj_msgSend(_18,"timestamp"),_24,nil,0,objj_msgSend(_18,"clickCount"),objj_msgSend(_18,"pressure")));
}else{
if(_lastMouseOverMenuView){
objj_msgSend(_lastMouseOverMenuView,"mouseExited:",_18);
_lastMouseOverMenuView=nil;
}
if(_21!=CPNotFound){
objj_msgSend(_1d,"_highlightItemAtIndex:",_21);
}
if(_19===CPMouseMoved||_19===CPLeftMouseDragged||_19===CPLeftMouseDown||_19===CPPeriodic){
if(_19===CPLeftMouseDragged){
_mouseWasDragged=YES;
}
var _25=_scrollingState;
_scrollingState=objj_msgSend(_1f,"scrollingStateForPoint:",_1e);
if(_scrollingState!==_25){
if(_scrollingState===_CPMenuManagerScrollingStateNone){
objj_msgSend(CPEvent,"stopPeriodicEvents");
}else{
if(_25===_CPMenuManagerScrollingStateNone){
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.04);
}
}
}
}else{
if(_19===CPLeftMouseUp||_19===CPRightMouseUp){
if(_mouseWasDragged||(objj_msgSend(_18,"timestamp")-_startTime>_1)){
if(_mouseWasDragged||objj_msgSend(_1f,"isMenuBar")||objj_msgSend(_22,"action")!==sel_getUid("submenuAction:")){
objj_msgSend(_1a,"cancelTracking");
}
}
}
}
}
if(_previousActiveItem!==_22){
clearTimeout(_showTimerID);
_showTimerID=undefined;
}
if(objj_msgSend(_22,"hasSubmenu")){
var _26=objj_msgSend(_1f,"rectForItemAtIndex:",_21),_27;
if(objj_msgSend(_1f,"isMenuBar")){
_27=CGPointMake(CGRectGetMinX(_26),CGRectGetMaxY(_26));
}else{
_27=CGPointMake(CGRectGetMaxX(_26),CGRectGetMinY(_26));
}
_27=objj_msgSend(_1f,"convertBaseToGlobal:",_27);
if(_showTimerID===undefined){
objj_msgSend(_16,"showMenu:fromMenu:atPoint:",nil,_1d,CGPointMakeZero());
if(!objj_msgSend(_1f,"isMenuBar")){
_showTimerID=setTimeout(function(){
objj_msgSend(_16,"showMenu:fromMenu:atPoint:",objj_msgSend(_22,"submenu"),objj_msgSend(_22,"menu"),_27);
},250);
}else{
objj_msgSend(_16,"showMenu:fromMenu:atPoint:",objj_msgSend(_22,"submenu"),objj_msgSend(_22,"menu"),_27);
}
}
}else{
objj_msgSend(_16,"showMenu:fromMenu:atPoint:",nil,_1d,CGPointMakeZero());
}
_previousActiveItem=_22;
}
}),new objj_method(sel_getUid("trackMenuBarButtonEvent:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(_2a,"type");
if(_2b===CPAppKitDefined){
return objj_msgSend(_28,"completeTracking");
}
var _2c=objj_msgSend(_2a,"globalLocation"),_2d=objj_msgSend(_28,"trackingMenu"),_2e=objj_msgSend(_28,"trackingMenuContainer"),_2f=objj_msgSend(_2e,"convertGlobalToBase:",_2c);
if(objj_msgSend(_2e,"itemIndexAtPoint:",_2f)===_menuBarButtonItemIndex){
objj_msgSend(_2d,"_highlightItemAtIndex:",_menuBarButtonItemIndex);
}else{
objj_msgSend(_2d,"_highlightItemAtIndex:",CPNotFound);
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_28,sel_getUid("trackMenuBarButtonEvent:"),CPPeriodicMask|CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask|CPAppKitDefinedMask,nil,nil,YES);
if(_2b===CPLeftMouseUp){
objj_msgSend(_2d,"cancelTracking");
}
}
}),new objj_method(sel_getUid("completeTracking"),function(_30,_31){
with(_30){
var _32=objj_msgSend(_30,"trackingMenu");
objj_msgSend(CPEvent,"stopPeriodicEvents");
objj_msgSend(_30,"showMenu:fromMenu:atPoint:",nil,_32,nil);
objj_msgSend(_32,"_menuDidClose");
if(_trackingCallback){
_trackingCallback(objj_msgSend(_30,"trackingMenuContainer"),_32);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPMenuDidEndTrackingNotification,_32);
CPApp._activeMenu=nil;
}
}),new objj_method(sel_getUid("menuContainerForPoint:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_menuContainerStack,"count"),_37=_menuContainerStack[0];
if(_36===1){
return _37;
}
var _38=0,_39=_36-1;
if(objj_msgSend(_37,"isMenuBar")){
if(CGRectContainsPoint(objj_msgSend(_37,"globalFrame"),_35)){
return _37;
}
_38=1;
}
var _3a=_36,x=_35.x,_3b=Infinity,_3c=nil;
while(_3a-->_38){
var _3d=_menuContainerStack[_3a],_3e=objj_msgSend(_3d,"globalFrame"),_3f=(_3e.origin.x),_40=(_3e.origin.x+_3e.size.width);
if(x<_40&&x>=_3f){
return _3d;
}
if(_3a===_38||_3a===_39){
var _41=ABS(x<_3f?_3f-x:_40-x);
if(_41<_3b){
_3c=_3d;
_3b=_41;
}
}
}
return _3c;
}
}),new objj_method(sel_getUid("showMenu:fromMenu:atPoint:"),function(_42,_43,_44,_45,_46){
with(_42){
var _47=_menuContainerStack.length,_48=_47;
objj_msgSend(_44,"_menuWillOpen");
while(_48--){
var _49=_menuContainerStack[_48],_4a=objj_msgSend(_49,"menu");
if(_4a===_45){
break;
}
if(_4a===_44){
return objj_msgSend(_44,"_highlightItemAtIndex:",CPNotFound);
}
objj_msgSend(_49,"orderOut:",_42);
objj_msgSend(_49,"setMenu:",nil);
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_49);
objj_msgSend(_menuContainerStack,"removeObjectAtIndex:",_48);
objj_msgSend(_4a,"_menuDidClose");
}
if(!_44){
return;
}
objj_msgSend(_44,"_highlightItemAtIndex:",CPNotFound);
var _4b=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_44,objj_msgSend(_menuContainerStack[0],"font"));
objj_msgSend(_menuContainerStack,"addObject:",_4b);
objj_msgSend(_4b,"setConstraintRect:",_constraintRect);
if(_45===objj_msgSend(_42,"trackingMenu")&&objj_msgSend(objj_msgSend(_42,"trackingMenuContainer"),"isMenuBar")){
objj_msgSend(_4b,"setBackgroundStyle:",_CPMenuWindowMenuBarBackgroundStyle);
}else{
objj_msgSend(_4b,"setBackgroundStyle:",_CPMenuWindowPopUpBackgroundStyle);
}
objj_msgSend(_4b,"setFrameOrigin:",_46);
objj_msgSend(_4b,"orderFront:",_42);
}
}),new objj_method(sel_getUid("interpretKeyEvent:forMenu:"),function(_4c,_4d,_4e,_4f){
with(_4c){
var _50=objj_msgSend(_4e,"modifierFlags"),_51=objj_msgSend(_4e,"charactersIgnoringModifiers"),_52=objj_msgSend(CPKeyBinding,"selectorsForKey:modifierFlags:",_51,_50);
if(_52){
var _53=objj_msgSend(_52,"objectEnumerator"),obj;
while((obj=objj_msgSend(_53,"nextObject"))!==nil){
var _54=CPSelectorFromString(obj);
if(objj_msgSend(_4c,"respondsToSelector:",_54)){
objj_msgSend(_4c,"performSelector:withObject:",_54,_4f);
}
}
}else{
if(!(_50&(CPCommandKeyMask|CPControlKeyMask))){
if(!_keyBuffer){
_startTime=objj_msgSend(_4e,"timestamp");
_keyBuffer=_51;
objj_msgSend(CPEvent,"stopPeriodicEvents");
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0.1,0.1);
}else{
_keyBuffer+=_51;
}
objj_msgSend(_4c,"selectNextItemBeginningWith:inMenu:clearBuffer:",_keyBuffer,_4f,NO);
_lastGlobalLocation=Nil;
}
}
}
}),new objj_method(sel_getUid("selectNextItemBeginningWith:inMenu:clearBuffer:"),function(_55,_56,_57,_58,_59){
with(_55){
var _5a=objj_msgSend(objj_msgSend(_58,"itemArray"),"objectEnumerator"),obj;
while((obj=objj_msgSend(_5a,"nextObject"))!==nil){
if(objj_msgSend(obj,"isHidden")||!objj_msgSend(obj,"isEnabled")){
continue;
}
if(objj_msgSend(objj_msgSend(objj_msgSend(obj,"title"),"commonPrefixWithString:options:",_57,CPCaseInsensitiveSearch),"length")==objj_msgSend(_57,"length")){
objj_msgSend(_58,"_highlightItemAtIndex:",_5a._index);
break;
}
}
if(_59){
objj_msgSend(CPEvent,"stopPeriodicEvents");
_keyBuffer=Nil;
}else{
_startTime=objj_msgSend(CPEvent,"currentTimestamp");
}
}
}),new objj_method(sel_getUid("scrollToBeginningOfDocument:"),function(_5b,_5c,_5d){
with(_5b){
objj_msgSend(_5d,"_highlightItemAtIndex:",0);
}
}),new objj_method(sel_getUid("scrollToEndOfDocument:"),function(_5e,_5f,_60){
with(_5e){
objj_msgSend(_60,"_highlightItemAtIndex:",objj_msgSend(_60,"numberOfItems")-1);
}
}),new objj_method(sel_getUid("scrollPageDown:"),function(_61,_62,_63){
with(_61){
var _64=_63._menuWindow,_65=_64._menuClipView,_66=objj_msgSend(_65,"bounds").size.height,_67=objj_msgSend(_64,"itemIndexAtPoint:",CGPointMake(1,10)),_68=objj_msgSend(_64,"itemIndexAtPoint:",CGPointMake(1,_66)),_69=objj_msgSend(_63,"indexOfItem:",objj_msgSend(_63,"highlightedItem"));
if(_69==CPNotFound){
objj_msgSend(_63,"_highlightItemAtIndex:",0);
return;
}
next=_69+(_68-_67);
if(next<objj_msgSend(_63,"numberOfItems")){
objj_msgSend(_63,"_highlightItemAtIndex:",next);
}else{
objj_msgSend(_63,"_highlightItemAtIndex:",objj_msgSend(_63,"numberOfItems")-1);
}
var _6a=objj_msgSend(_63,"highlightedItem");
if(objj_msgSend(_6a,"isSeparatorItem")||objj_msgSend(_6a,"isHidden")||!objj_msgSend(_6a,"isEnabled")){
objj_msgSend(_61,"moveDown:",_63);
}
}
}),new objj_method(sel_getUid("scrollPageUp:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=_6d._menuWindow,_6f=_6e._menuClipView,_70=objj_msgSend(_6f,"bounds").size.height,_71=objj_msgSend(_6e,"itemIndexAtPoint:",CGPointMake(1,10)),_72=objj_msgSend(_6e,"itemIndexAtPoint:",CGPointMake(1,_70)),_73=objj_msgSend(_6d,"indexOfItem:",objj_msgSend(_6d,"highlightedItem"));
if(_73==CPNotFound){
objj_msgSend(_6d,"_highlightItemAtIndex:",0);
return;
}
next=_73-(_72-_71);
if(next<0){
objj_msgSend(_6d,"_highlightItemAtIndex:",0);
}else{
objj_msgSend(_6d,"_highlightItemAtIndex:",next);
}
var _74=objj_msgSend(_6d,"highlightedItem");
if(objj_msgSend(_74,"isSeparatorItem")||objj_msgSend(_74,"isHidden")||!objj_msgSend(_74,"isEnabled")){
objj_msgSend(_6b,"moveUp:",_6d);
}
}
}),new objj_method(sel_getUid("moveLeft:"),function(_75,_76,_77){
with(_75){
if(objj_msgSend(_77,"supermenu")){
if(objj_msgSend(_77,"supermenu")==objj_msgSend(CPApp,"mainMenu")){
objj_msgSend(_75,"showMenu:fromMenu:atPoint:",nil,objj_msgSend(_77,"supermenu"),CGPointMakeZero());
objj_msgSend(_75,"moveUp:",objj_msgSend(CPApp,"mainMenu"));
var _78=objj_msgSend(objj_msgSend(CPApp,"mainMenu"),"highlightedItem"),_79=CGPointMake(objj_msgSend(objj_msgSend(_78,"_menuItemView"),"frameOrigin").x,objj_msgSend(objj_msgSend(_78,"_menuItemView"),"frameSize").height);
objj_msgSend(_75,"showMenu:fromMenu:atPoint:",objj_msgSend(_78,"submenu"),objj_msgSend(_78,"menu"),_79);
}else{
objj_msgSend(_75,"showMenu:fromMenu:atPoint:",nil,objj_msgSend(_77,"supermenu"),CGPointMakeZero());
}
}
}
}),new objj_method(sel_getUid("moveRight:"),function(_7a,_7b,_7c){
with(_7a){
var _7d=objj_msgSend(_7c,"highlightedItem");
if(objj_msgSend(_7d,"hasSubmenu")){
if(objj_msgSend(objj_msgSend(_7d,"submenu"),"numberOfItems")){
var _7e=objj_msgSend(_7c,"indexOfItem:",_7d),_7f=_7c._menuWindow,_80=objj_msgSend(_7f,"rectForItemAtIndex:",_7e),_81;
if(objj_msgSend(_7f,"isMenuBar")){
_81=CGPointMake(CGRectGetMinX(_80),CGRectGetMaxY(_80));
}else{
_81=CGPointMake(CGRectGetMaxX(_80),CGRectGetMinY(_80));
}
_81=objj_msgSend(_7f,"convertBaseToGlobal:",_81);
objj_msgSend(_7a,"showMenu:fromMenu:atPoint:",objj_msgSend(_7d,"submenu"),objj_msgSend(_7d,"menu"),_81);
objj_msgSend(_7a,"moveDown:",objj_msgSend(_7d,"submenu"));
}
}else{
if(objj_msgSend(_7a,"trackingMenu")==objj_msgSend(CPApp,"mainMenu")){
objj_msgSend(_7a,"showMenu:fromMenu:atPoint:",nil,_7c,CGPointMakeZero());
objj_msgSend(_7a,"moveDown:",objj_msgSend(CPApp,"mainMenu"));
var _7d=objj_msgSend(objj_msgSend(CPApp,"mainMenu"),"highlightedItem"),_82=CGPointMake(objj_msgSend(objj_msgSend(_7d,"_menuItemView"),"frameOrigin").x,objj_msgSend(objj_msgSend(_7d,"_menuItemView"),"frameSize").height);
objj_msgSend(_7a,"showMenu:fromMenu:atPoint:",objj_msgSend(_7d,"submenu"),objj_msgSend(_7d,"menu"),_82);
}
}
}
}),new objj_method(sel_getUid("moveDown:"),function(_83,_84,_85){
with(_83){
var _86=_85._highlightedIndex+1;
if(_86<objj_msgSend(_85,"numberOfItems")){
objj_msgSend(_85,"_highlightItemAtIndex:",_86);
var _87=objj_msgSend(_85,"highlightedItem");
if(objj_msgSend(_87,"isSeparatorItem")||objj_msgSend(_87,"isHidden")||!objj_msgSend(_87,"isEnabled")){
objj_msgSend(_83,"moveDown:",_85);
}
}
}
}),new objj_method(sel_getUid("moveUp:"),function(_88,_89,_8a){
with(_88){
var _8b=_8a._highlightedIndex-1;
if(_8b<0){
if(_8b!=CPNotFound){
objj_msgSend(_8a,"_highlightItemAtIndex:",objj_msgSend(_8a,"numberOfItems")-1);
}
return;
}
objj_msgSend(_8a,"_highlightItemAtIndex:",_8b);
var _8c=objj_msgSend(_8a,"highlightedItem");
if(objj_msgSend(_8c,"isSeparatorItem")||objj_msgSend(_8c,"isHidden")||!objj_msgSend(_8c,"isEnabled")){
objj_msgSend(_88,"moveUp:",_8a);
}
}
}),new objj_method(sel_getUid("insertNewline:"),function(_8d,_8e,_8f){
with(_8d){
if(objj_msgSend(objj_msgSend(_8f,"highlightedItem"),"hasSubmenu")){
objj_msgSend(_8d,"moveRight:",_8f);
}else{
objj_msgSend(_8f,"cancelTracking");
}
}
}),new objj_method(sel_getUid("cancelOperation:"),function(_90,_91,_92){
with(_90){
objj_msgSend(_92,"_highlightItemAtIndex:",CPNotFound);
objj_msgSend(CPEvent,"stopPeriodicEvents");
objj_msgSend(objj_msgSend(_90,"trackingMenu"),"cancelTracking");
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedMenuManager"),function(_93,_94){
with(_93){
if(!_2){
_2=objj_msgSend(objj_msgSend(_CPMenuManager,"alloc"),"init");
}
return _2;
}
})]);
