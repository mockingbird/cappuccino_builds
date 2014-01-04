@STATIC;1.0;I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;8;CPText.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.ji;12;CPPlatform.ji;18;CPPlatformWindow.ji;26;CPPlatformWindow+DOMKeys.jt;33833;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPRunLoop.j",NO);
objj_executeFile("CPEvent.j",YES);
objj_executeFile("CPText.j",YES);
objj_executeFile("CPCompatibility.j",YES);
objj_executeFile("CPDOMWindowLayer.j",YES);
objj_executeFile("CPPlatform.j",YES);
objj_executeFile("CPPlatformWindow.j",YES);
objj_executeFile("CPPlatformWindow+DOMKeys.j",YES);
var _1=objj_msgSend(CPSet,"set");
var _2,_3,_4,_5;
var _6={},_7={},_8={},_9={61:187,59:186},_a={};
_6[CPKeyCodes.A]=YES;
_8[CPKeyCodes.F1]=YES;
_8[CPKeyCodes.F2]=YES;
_8[CPKeyCodes.F3]=YES;
_8[CPKeyCodes.F4]=YES;
_8[CPKeyCodes.F5]=YES;
_8[CPKeyCodes.F6]=YES;
_8[CPKeyCodes.F7]=YES;
_8[CPKeyCodes.F8]=YES;
_8[CPKeyCodes.F9]=YES;
_8[CPKeyCodes.F10]=YES;
_8[CPKeyCodes.F11]=YES;
_8[CPKeyCodes.F12]=YES;
_a[CPKeyCodes.BACKSPACE]=CPDeleteCharacter;
_a[CPKeyCodes.DELETE]=CPDeleteFunctionKey;
_a[CPKeyCodes.TAB]=CPTabCharacter;
_a[CPKeyCodes.ENTER]=CPCarriageReturnCharacter;
_a[CPKeyCodes.ESC]=CPEscapeFunctionKey;
_a[CPKeyCodes.PAGE_UP]=CPPageUpFunctionKey;
_a[CPKeyCodes.PAGE_DOWN]=CPPageDownFunctionKey;
_a[CPKeyCodes.LEFT]=CPLeftArrowFunctionKey;
_a[CPKeyCodes.UP]=CPUpArrowFunctionKey;
_a[CPKeyCodes.RIGHT]=CPRightArrowFunctionKey;
_a[CPKeyCodes.DOWN]=CPDownArrowFunctionKey;
_a[CPKeyCodes.HOME]=CPHomeFunctionKey;
_a[CPKeyCodes.END]=CPEndFunctionKey;
_a[CPKeyCodes.SEMICOLON]=";";
_a[CPKeyCodes.DASH]="-";
_a[CPKeyCodes.EQUALS]="=";
_a[CPKeyCodes.COMMA]=",";
_a[CPKeyCodes.PERIOD]=".";
_a[CPKeyCodes.SLASH]="/";
_a[CPKeyCodes.APOSTROPHE]="`";
_a[CPKeyCodes.SINGLE_QUOTE]="'";
_a[CPKeyCodes.OPEN_SQUARE_BRACKET]="[";
_a[CPKeyCodes.BACKSLASH]="\\";
_a[CPKeyCodes.CLOSE_SQUARE_BRACKET]="]";
var _b=[CPKeyCodes.META,CPKeyCodes.WEBKIT_RIGHT_META,CPKeyCodes.MAC_FF_META,CPKeyCodes.CTRL,CPKeyCodes.ALT,CPKeyCodes.SHIFT],_c=objj_msgSend(CPPlatform,"supportsDragAndDrop");
var _d=nil;
var _e=objj_getClass("CPPlatformWindow");
if(!_e){
throw new SyntaxError("*** Could not find definition for class \"CPPlatformWindow\"");
}
var _f=_e.isa;
class_addMethods(_e,[new objj_method(sel_getUid("_init"),function(_10,_11){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPPlatformWindow").super_class},"init");
if(_10){
_DOMWindow=window;
_contentRect={origin:{x:0,y:0},size:{width:0,height:0}};
_windowLevels=[];
_windowLayers=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_10,"registerDOMWindow");
objj_msgSend(_10,"updateFromNativeContentRect");
_charCodes={};
}
return _10;
}
}),new objj_method(sel_getUid("nativeContentRect"),function(_12,_13){
with(_12){
if(!_DOMWindow){
return objj_msgSend(_12,"contentRect");
}
if(_DOMWindow.cpFrame){
return _DOMWindow.cpFrame();
}
var _14={origin:{x:0,y:0},size:{width:0,height:0}};
if(window.screenTop){
_14.origin={x:_DOMWindow.screenLeft,y:_DOMWindow.screenTop};
}else{
if(window.screenX){
_14.origin={x:_DOMWindow.screenX,y:_DOMWindow.screenY};
}
}
if(_DOMWindow.innerWidth){
_14.size={width:_DOMWindow.innerWidth,height:_DOMWindow.innerHeight};
}else{
if(document.documentElement&&document.documentElement.clientWidth){
_14.size={width:_DOMWindow.document.documentElement.clientWidth,height:_DOMWindow.document.documentElement.clientHeight};
}else{
_14.size={width:_DOMWindow.document.body.clientWidth,height:_DOMWindow.document.body.clientHeight};
}
}
return _14;
}
}),new objj_method(sel_getUid("updateNativeContentRect"),function(_15,_16){
with(_15){
if(!_DOMWindow){
return;
}
if(typeof _DOMWindow["cpSetFrame"]==="function"){
return _DOMWindow.cpSetFrame(objj_msgSend(_15,"contentRect"));
}
var _17=objj_msgSend(_15,"contentRect").origin,_18=objj_msgSend(_15,"nativeContentRect").origin;
if(_17.x!==_18.x||_17.y!==_18.y){
_DOMWindow.moveBy(_17.x-_18.x,_17.y-_18.y);
}
var _19=objj_msgSend(_15,"contentRect").size,_1a=objj_msgSend(_15,"nativeContentRect").size;
if(_19.width!==_1a.width||_19.height!==_1a.height){
_DOMWindow.resizeBy(_19.width-_1a.width,_19.height-_1a.height);
}
}
}),new objj_method(sel_getUid("orderBack:"),function(_1b,_1c,_1d){
with(_1b){
if(_DOMWindow){
_DOMWindow.blur();
}
}
}),new objj_method(sel_getUid("createDOMElements"),function(_1e,_1f){
with(_1e){
var _20=_DOMWindow.document;
_DOMFocusElement=_20.createElement("input");
_DOMFocusElement.style.position="absolute";
_DOMFocusElement.style.zIndex="-1000";
_DOMFocusElement.style.opacity="0";
_DOMFocusElement.style.filter="alpha(opacity=0)";
_DOMFocusElement.className="cpdontremove";
_DOMBodyElement.appendChild(_DOMFocusElement);
_DOMPasteboardElement=_20.createElement("textarea");
_DOMPasteboardElement.style.position="absolute";
_DOMPasteboardElement.style.top="-10000px";
_DOMPasteboardElement.style.zIndex="999";
_DOMPasteboardElement.className="cpdontremove";
_DOMBodyElement.appendChild(_DOMPasteboardElement);
_DOMPasteboardElement.blur();
_DOMEventGuard=_20.createElement("div");
_DOMEventGuard.style.position="absolute";
_DOMEventGuard.style.top="0px";
_DOMEventGuard.style.left="0px";
_DOMEventGuard.style.width="100%";
_DOMEventGuard.style.height="100%";
_DOMEventGuard.style.zIndex="999";
_DOMEventGuard.style.display="none";
_DOMEventGuard.className="cpdontremove";
_DOMBodyElement.appendChild(_DOMEventGuard);
_DOMScrollingElement=_20.createElement("div");
_DOMScrollingElement.style.position="absolute";
_DOMScrollingElement.style.visibility="hidden";
_DOMScrollingElement.style.zIndex="999";
_DOMScrollingElement.style.height="60px";
_DOMScrollingElement.style.width="60px";
_DOMScrollingElement.style.overflow="scroll";
_DOMScrollingElement.style.opacity="0";
_DOMScrollingElement.style.filter="alpha(opacity=0)";
_DOMScrollingElement.className="cpdontremove";
_DOMBodyElement.appendChild(_DOMScrollingElement);
var _21=_20.createElement("div");
_21.style.width="400px";
_21.style.height="400px";
_DOMScrollingElement.appendChild(_21);
_DOMScrollingElement.scrollTop=150;
_DOMScrollingElement.scrollLeft=150;
}
}),new objj_method(sel_getUid("registerDOMWindow"),function(_22,_23){
with(_22){
var _24=_DOMWindow.document;
_DOMBodyElement=_24.getElementById("cappuccino-body")||_24.body;
if(_c){
_DOMBodyElement.style["-khtml-user-select"]="none";
}
_DOMBodyElement.webkitTouchCallout="none";
objj_msgSend(_22,"createDOMElements");
objj_msgSend(_22,"_addLayers");
var _25=objj_msgSend(_22,"class"),_26=class_getMethodImplementation(_25,sel_getUid("dragEvent:")),_27=function(_28){
_26(_22,nil,_28);
},_29=sel_getUid("resizeEvent:"),_2a=class_getMethodImplementation(_25,_29),_2b=function(_2c){
_2a(_22,nil,_2c);
},_2d=sel_getUid("copyEvent:"),_2e=class_getMethodImplementation(_25,_2d),_2f=function(_30){
_2e(_22,nil,_30);
},_31=sel_getUid("pasteEvent:"),_32=class_getMethodImplementation(_25,_31),_33=function(_34){
_32(_22,nil,_34);
},_35=sel_getUid("keyEvent:"),_36=class_getMethodImplementation(_25,_35),_37=function(_38){
_36(_22,nil,_38);
},_39=sel_getUid("mouseEvent:"),_3a=class_getMethodImplementation(_25,_39),_3b=function(_3c){
_3a(_22,nil,_3c);
},_3d=sel_getUid("contextMenuEvent:"),_3e=class_getMethodImplementation(_25,_3d),_3f=function(_40){
return _3e(_22,nil,_40);
},_41=sel_getUid("scrollEvent:"),_42=class_getMethodImplementation(_25,_41),_43=function(_44){
_42(_22,nil,_44);
},_45=sel_getUid("touchEvent:"),_46=class_getMethodImplementation(_25,_45),_47=function(_48){
_46(_22,nil,_48);
};
if(_24.addEventListener){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_24.addEventListener("dragstart",_27,NO);
_24.addEventListener("drag",_27,NO);
_24.addEventListener("dragend",_27,NO);
_24.addEventListener("dragover",_27,NO);
_24.addEventListener("dragleave",_27,NO);
_24.addEventListener("drop",_27,NO);
}
_24.addEventListener("mouseup",_3b,NO);
_24.addEventListener("mousedown",_3b,NO);
_24.addEventListener("mousemove",_3b,NO);
_24.addEventListener("contextmenu",_3f,NO);
_24.addEventListener("beforecopy",_2f,NO);
_24.addEventListener("beforecut",_2f,NO);
_24.addEventListener("beforepaste",_33,NO);
_24.addEventListener("keyup",_37,NO);
_24.addEventListener("keydown",_37,NO);
_24.addEventListener("keypress",_37,NO);
_24.addEventListener("touchstart",_47,NO);
_24.addEventListener("touchend",_47,NO);
_24.addEventListener("touchmove",_47,NO);
_24.addEventListener("touchcancel",_47,NO);
_DOMWindow.addEventListener("DOMMouseScroll",_43,NO);
_DOMWindow.addEventListener("mousewheel",_43,NO);
_DOMWindow.addEventListener("resize",_2b,NO);
_DOMWindow.addEventListener("unload",function(){
objj_msgSend(_22,"updateFromNativeContentRect");
objj_msgSend(_22,"_removeLayers");
_24.removeEventListener("mouseup",_3b,NO);
_24.removeEventListener("mousedown",_3b,NO);
_24.removeEventListener("mousemove",_3b,NO);
_24.removeEventListener("contextmenu",_3f,NO);
_24.removeEventListener("keyup",_37,NO);
_24.removeEventListener("keydown",_37,NO);
_24.removeEventListener("keypress",_37,NO);
_24.removeEventListener("beforecopy",_2f,NO);
_24.removeEventListener("beforecut",_2f,NO);
_24.removeEventListener("beforepaste",_33,NO);
_24.removeEventListener("touchstart",_47,NO);
_24.removeEventListener("touchend",_47,NO);
_24.removeEventListener("touchmove",_47,NO);
_DOMWindow.removeEventListener("resize",_2b,NO);
_DOMWindow.removeEventListener("DOMMouseScroll",_43,NO);
_DOMWindow.removeEventListener("mousewheel",_43,NO);
objj_msgSend(_1,"removeObject:",_22);
_22._DOMWindow=nil;
},NO);
}else{
_24.attachEvent("onmouseup",_3b);
_24.attachEvent("onmousedown",_3b);
_24.attachEvent("onmousemove",_3b);
_24.attachEvent("ondblclick",_3b);
_24.attachEvent("oncontextmenu",_3f);
_24.attachEvent("onkeyup",_37);
_24.attachEvent("onkeydown",_37);
_24.attachEvent("onkeypress",_37);
_DOMWindow.attachEvent("onresize",_2b);
_DOMWindow.onmousewheel=_43;
_24.onmousewheel=_43;
_DOMBodyElement.ondrag=function(){
return NO;
};
_DOMBodyElement.onselectstart=function(){
return _DOMWindow.event.srcElement===_DOMPasteboardElement;
};
_DOMWindow.attachEvent("onunload",function(){
objj_msgSend(_22,"updateFromNativeContentRect");
objj_msgSend(_22,"_removeLayers");
_24.detachEvent("onmouseup",_3b);
_24.detachEvent("onmousedown",_3b);
_24.detachEvent("onmousemove",_3b);
_24.detachEvent("ondblclick",_3b);
_24.detachEvent("oncontextmenu",_3f);
_24.detachEvent("onkeyup",_37);
_24.detachEvent("onkeydown",_37);
_24.detachEvent("onkeypress",_37);
_DOMWindow.detachEvent("onresize",_2b);
_DOMWindow.onmousewheel=NULL;
_24.onmousewheel=NULL;
_DOMBodyElement.ondrag=NULL;
_DOMBodyElement.onselectstart=NULL;
objj_msgSend(_1,"removeObject:",_22);
_22._DOMWindow=nil;
},NO);
}
}
}),new objj_method(sel_getUid("orderFront:"),function(_49,_4a,_4b){
with(_49){
if(_DOMWindow){
return _DOMWindow.focus();
}
_DOMWindow=window.open("about:blank","_blank","menubar=no,location=no,resizable=yes,scrollbars=no,status=no,left="+(_contentRect.origin.x)+",top="+(_contentRect.origin.y)+",width="+(_contentRect.size.width)+",height="+(_contentRect.size.height));
objj_msgSend(_1,"addObject:",_49);
_DOMWindow.document.write("<!DOCTYPE html><html lang='en'><head></head><body style='background-color:transparent;'></body></html>");
_DOMWindow.document.close();
if(_49!=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow")){
_DOMWindow.document.title=_title;
}
if(!objj_msgSend(CPPlatform,"isBrowser")){
_DOMWindow.cpWindowNumber=objj_msgSend(_49._only,"windowNumber");
_DOMWindow.cpSetFrame(_contentRect);
_DOMWindow.cpSetLevel(_level);
_DOMWindow.cpSetHasShadow(_hasShadow);
_DOMWindow.cpSetShadowStyle(_shadowStyle);
}
objj_msgSend(_49,"registerDOMWindow");
_DOMBodyElement.style.cursor=objj_msgSend(objj_msgSend(CPCursor,"currentCursor"),"_cssString");
}
}),new objj_method(sel_getUid("orderOut:"),function(_4c,_4d,_4e){
with(_4c){
if(!_DOMWindow){
return;
}
_DOMWindow.close();
}
}),new objj_method(sel_getUid("dragEvent:"),function(_4f,_50,_51){
with(_4f){
var _52=_51.type,_53=objj_msgSend(CPDragServer,"sharedDragServer"),_54={x:_51.clientX,y:_51.clientY},_55=objj_msgSend(_CPDOMDataTransferPasteboard,"DOMDataTransferPasteboard");
objj_msgSend(_55,"_setDataTransfer:",_51.dataTransfer);
if(_51.type==="dragstart"){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
objj_msgSend(_55,"_setPasteboard:",objj_msgSend(_53,"draggingPasteboard"));
var _56=objj_msgSend(_53,"draggedWindow"),_57=objj_msgSend(_56,"frame"),_58=_56._DOMElement;
_58.style.left=-(_57.size.width)+"px";
_58.style.top=-(_57.size.height)+"px";
var _59=_58.parentNode;
if(_59){
_59.removeChild(_58);
}
_DOMBodyElement.appendChild(_58);
var _5a=objj_msgSend(_53,"draggingOffset");
_51.dataTransfer.setDragImage(_58,_5a.width,_5a.height);
_51.dataTransfer.effectAllowed="all";
objj_msgSend(_53,"draggingStartedInPlatformWindow:globalLocation:",_4f,objj_msgSend(CPPlatform,"isBrowser")?_54:{x:_51.screenX,y:_51.screenY});
}else{
if(_52==="drag"){
var y=_51.screenY;
if(CPFeatureIsCompatible(CPHTML5DragAndDropSourceYOffBy1)){
y-=1;
}
objj_msgSend(_53,"draggingSourceUpdatedWithGlobalLocation:",objj_msgSend(CPPlatform,"isBrowser")?_54:{x:_51.screenX,y:y});
}else{
if(_52==="dragover"||_52==="dragleave"){
if(_51.preventDefault){
_51.preventDefault();
}
var _5b="none",_5c=objj_msgSend(_53,"draggingUpdatedInPlatformWindow:location:",_4f,_54);
if(_5c===CPDragOperationMove||_5c===CPDragOperationGeneric||_5c===CPDragOperationPrivate){
_5b="move";
}else{
if(_5c===CPDragOperationCopy){
_5b="copy";
}else{
if(_5c===CPDragOperationLink){
_5b="link";
}
}
}
_51.dataTransfer.dropEffect=_5b;
}else{
if(_52==="dragend"){
var _5b=_51.dataTransfer.dropEffect;
if(_5b==="move"){
_5c=CPDragOperationMove;
}else{
if(_5b==="copy"){
_5c=CPDragOperationCopy;
}else{
if(_5b==="link"){
_5c=CPDragOperationLink;
}else{
_5c=CPDragOperationNone;
}
}
}
objj_msgSend(_53,"draggingEndedInPlatformWindow:globalLocation:operation:",_4f,objj_msgSend(CPPlatform,"isBrowser")?_54:{x:_51.screenX,y:_51.screenY},_5c);
}else{
objj_msgSend(_53,"performDragOperationInPlatformWindow:",_4f);
if(_51.preventDefault){
_51.preventDefault();
}
if(_51.stopPropagation){
_51.stopPropagation();
}
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyEvent:"),function(_5d,_5e,_5f){
with(_5d){
var _60,_61=objj_msgSend(CPEvent,"currentTimestamp"),_62=_5f.target||_5f.srcElement,_63=objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"windowNumber"),_64=(_5f.shiftKey?CPShiftKeyMask:0)|(_5f.ctrlKey?CPControlKeyMask:0)|(_5f.altKey?CPAlternateKeyMask:0)|(_5f.metaKey?CPCommandKeyMask:0);
_4=YES;
if(!(_7[String.fromCharCode(_5f.keyCode||_5f.charCode).toLowerCase()]||_6[_5f.keyCode])){
if((_64&(CPControlKeyMask|CPCommandKeyMask))||_8[_5f.keyCode]){
_4=NO;
}
}
var _65=NO,_66=NO,_67=nil;
switch(_5f.type){
case "keydown":
if(_5f.keyCode in _9){
_keyCode=_9[_5f.keyCode];
}else{
_keyCode=_5f.keyCode;
}
var _68;
if(_5f.which===0||_5f.charCode===0||(_5f.which===undefined&&_5f.charCode===undefined)){
_68=_a[_keyCode];
}
if(!_68){
_68=String.fromCharCode(_keyCode).toLowerCase();
}
_67=(_64&CPShiftKeyMask||_capsLockActive)?_68.toUpperCase():_68;
if(_keyCode===CPKeyCodes.CAPS_LOCK){
_capsLockActive=YES;
}
if(objj_msgSend(_b,"containsObject:",_keyCode)){
_60=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPFlagsChanged,location,_64,_61,_63,nil,nil,nil,NO,_keyCode);
break;
}else{
if(_64&(CPControlKeyMask|CPCommandKeyMask)){
var _69=objj_msgSend(_5d,"_validateCopyCutOrPasteEvent:flags:",_5f,_64);
if(_68==="v"&&_69){
if(!_ignoreNativePastePreparation){
_DOMPasteboardElement.select();
_DOMPasteboardElement.value="";
}
_65=YES;
}else{
if((_68=="c"||_68=="x")&&_69){
_66=YES;
if(_ignoreNativeCopyOrCutEvent){
break;
}
}
}
}else{
if(CPKeyCodes.firesKeyPressEvent(_keyCode,_lastKey,_5f.shiftKey,_5f.ctrlKey,_5f.altKey)){
_4=NO;
break;
}else{
}
}
}
case "keypress":
if(_5f.type==="keypress"&&(_64&(CPControlKeyMask|CPCommandKeyMask))){
break;
}
var _6a=_keyCode,_6b=_5f.keyCode||_5f.charCode,_6c=(_charCodes[_6a]!=nil);
_lastKey=_6a;
_charCodes[_6a]=_6b;
var _68=_67;
if(!_68&&(_5f.which===0||_5f.charCode===0)){
_68=_a[_6b];
}
if(!_68){
_68=String.fromCharCode(_6b);
}
_6d=_68.toLowerCase();
if(!_67&&(_64&CPCommandKeyMask)&&((_64&CPShiftKeyMask)||_capsLockActive)){
_68=_68.toUpperCase();
}
_60=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyDown,location,_64,_61,_63,nil,_68,_6d,_6c,_6b);
if(_65){
_pasteboardKeyDownEvent=_60;
window.setNativeTimeout(function(){
objj_msgSend(_5d,"_checkPasteboardElement");
},0);
}
break;
case "keyup":
var _6a=_5f.keyCode,_6b=_charCodes[_6a];
_keyCode=-1;
_lastKey=-1;
_charCodes[_6a]=nil;
_ignoreNativeCopyOrCutEvent=NO;
_ignoreNativePastePreparation=NO;
if(_6a===CPKeyCodes.CAPS_LOCK){
_capsLockActive=NO;
}
if(objj_msgSend(_b,"containsObject:",_6a)){
_60=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPFlagsChanged,location,_64,_61,_63,nil,nil,nil,NO,_keyCode);
break;
}
var _68=_a[_6b]||String.fromCharCode(_6b),_6d=_68.toLowerCase();
if(!(_64&CPShiftKeyMask)&&(_64&CPCommandKeyMask)&&!_capsLockActive){
_68=_6d;
}
_60=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyUp,location,_64,_61,_63,nil,_68,_6d,NO,_6a);
break;
}
if(_60&&!_65){
_60._DOMEvent=_5f;
objj_msgSend(CPApp,"sendEvent:",_60);
if(_66){
objj_msgSend(_5d,"_primePasteboardElement");
}
}
if(_4){
_3(_5f,_5d);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("copyEvent:"),function(_6e,_6f,_70){
with(_6e){
if(objj_msgSend(_6e,"_validateCopyCutOrPasteEvent:flags:",_70,CPPlatformActionKeyMask)&&!_ignoreNativeCopyOrCutEvent){
var cut=_70.type==="beforecut",_71=cut?CPKeyCodes.X:CPKeyCodes.C,_72=cut?"x":"c",_73=objj_msgSend(CPEvent,"currentTimestamp"),_74=objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"windowNumber"),_75=CPPlatformActionKeyMask;
event=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyDown,location,_75,_73,_74,nil,_72,_72,NO,_71);
event._DOMEvent=_70;
objj_msgSend(CPApp,"sendEvent:",event);
objj_msgSend(_6e,"_primePasteboardElement");
_ignoreNativeCopyOrCutEvent=YES;
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("pasteEvent:"),function(_76,_77,_78){
with(_76){
if(objj_msgSend(_76,"_validateCopyCutOrPasteEvent:flags:",_78,CPPlatformActionKeyMask)){
_DOMPasteboardElement.focus();
_DOMPasteboardElement.select();
_DOMPasteboardElement.value="";
_ignoreNativePastePreparation=YES;
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_validateCopyCutOrPasteEvent:flags:"),function(_79,_7a,_7b,_7c){
with(_79){
return (((_7b.target||_7b.srcElement).nodeName.toUpperCase()!=="INPUT"&&(_7b.target||_7b.srcElement).nodeName.toUpperCase()!=="TEXTAREA")||_7b.target===_DOMPasteboardElement)&&(_7c&CPPlatformActionKeyMask);
}
}),new objj_method(sel_getUid("_primePasteboardElement"),function(_7d,_7e){
with(_7d){
var _7f=objj_msgSend(CPPasteboard,"generalPasteboard"),_80=objj_msgSend(_7f,"types");
if(_80.length){
if(objj_msgSend(_80,"indexOfObjectIdenticalTo:",CPStringPboardType)!=CPNotFound){
_DOMPasteboardElement.value=objj_msgSend(_7f,"stringForType:",CPStringPboardType);
}else{
_DOMPasteboardElement.value=objj_msgSend(_7f,"_generateStateUID");
}
_DOMPasteboardElement.focus();
_DOMPasteboardElement.select();
window.setNativeTimeout(function(){
objj_msgSend(_7d,"_clearPasteboardElement");
},0);
}
}
}),new objj_method(sel_getUid("_checkPasteboardElement"),function(_81,_82){
with(_81){
var _83=_DOMPasteboardElement.value;
if(objj_msgSend(_83,"length")){
var _84=objj_msgSend(CPPasteboard,"generalPasteboard");
if(objj_msgSend(_84,"_stateUID")!=_83){
objj_msgSend(_84,"declareTypes:owner:",[CPStringPboardType],_81);
objj_msgSend(_84,"setString:forType:",_83,CPStringPboardType);
}
}
objj_msgSend(_81,"_clearPasteboardElement");
objj_msgSend(CPApp,"sendEvent:",_pasteboardKeyDownEvent);
_pasteboardKeyDownEvent=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_clearPasteboardElement"),function(_85,_86){
with(_85){
_DOMPasteboardElement.value="";
_DOMPasteboardElement.blur();
}
}),new objj_method(sel_getUid("scrollEvent:"),function(_87,_88,_89){
with(_87){
if(_hideDOMScrollingElementTimeout){
clearTimeout(_hideDOMScrollingElementTimeout);
_hideDOMScrollingElementTimeout=nil;
}
if(!_89){
_89=window.event;
}
var _8a=nil;
if(CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15)){
var x=_89._offsetX||0,y=_89._offsetY||0,_8b=_89.target;
while(_8b.nodeType!==1){
_8b=_8b.parentNode;
}
if(_8b.offsetParent){
do{
x+=_8b.offsetLeft;
y+=_8b.offsetTop;
}while(_8b=_8b.offsetParent);
}
_8a={x:(x+((_89.clientX-8)/15)),y:(y+((_89.clientY-8)/15))};
}else{
if(_89._overrideLocation){
_8a=_89._overrideLocation;
}else{
_8a={x:_89.clientX,y:_89.clientY};
}
}
var _8c=0,_8d=0,_8e=0,_8f=objj_msgSend(CPEvent,"currentTimestamp"),_90=(_89.shiftKey?CPShiftKeyMask:0)|(_89.ctrlKey?CPControlKeyMask:0)|(_89.altKey?CPAlternateKeyMask:0)|(_89.metaKey?CPCommandKeyMask:0);
_DOMScrollingElement.style.visibility="visible";
_DOMScrollingElement.style.top=(_8a.y-15)+"px";
_DOMScrollingElement.style.left=(_8a.x-15)+"px";
_4=NO;
var _91=objj_msgSend(_87,"hitTest:",_8a);
if(!_91){
return;
}
var _8e=objj_msgSend(_91,"windowNumber");
_8a=objj_msgSend(_91,"convertBridgeToBase:",_8a);
var _92=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPScrollWheel,_8a,_90,_8f,_8e,nil,-1,1,0);
_92._DOMEvent=_89;
setTimeout(function(){
var _93=_DOMScrollingElement.scrollLeft-150,_8d=_DOMScrollingElement.scrollTop-150;
if(_93||_8d){
_92._deltaX=_93;
_92._deltaY=_8d;
objj_msgSend(CPApp,"sendEvent:",_92);
}
_DOMScrollingElement.scrollLeft=150;
_DOMScrollingElement.scrollTop=150;
},0);
_hideDOMScrollingElementTimeout=setTimeout(function(){
_DOMScrollingElement.style.visibility="hidden";
},300);
}
}),new objj_method(sel_getUid("resizeEvent:"),function(_94,_95,_96){
with(_94){
objj_msgSend(_d,"invalidate");
_d=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.2,_94,sel_getUid("_actualResizeEvent"),nil,NO);
}
}),new objj_method(sel_getUid("_actualResizeEvent"),function(_97,_98){
with(_97){
_d=nil;
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(CPApp._activeMenu,"cancelTracking");
}
var _99=objj_msgSend(_97,"contentRect").size;
objj_msgSend(_97,"updateFromNativeContentRect");
var _9a=_windowLevels,_9b=_windowLayers,_9c=_9a.length;
while(_9c--){
var _9d=objj_msgSend(_9b,"objectForKey:",_9a[_9c])._windows,_9e=_9d.length;
while(_9e--){
objj_msgSend(_9d[_9e],"resizeWithOldPlatformWindowSize:",_99);
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("touchEvent:"),function(_9f,_a0,_a1){
with(_9f){
if(_a1.touches&&(_a1.touches.length==1||(_a1.touches.length==0&&_a1.changedTouches.length==1))){
var _a2={};
switch(_a1.type){
case CPDOMEventTouchStart:
_a2.type=CPDOMEventMouseDown;
break;
case CPDOMEventTouchEnd:
_a2.type=CPDOMEventMouseUp;
break;
case CPDOMEventTouchMove:
_a2.type=CPDOMEventMouseMoved;
break;
case CPDOMEventTouchCancel:
_a2.type=CPDOMEventMouseUp;
break;
}
var _a3=_a1.touches.length?_a1.touches[0]:_a1.changedTouches[0];
_a2.clientX=_a3.clientX;
_a2.clientY=_a3.clientY;
_a2.timestamp=objj_msgSend(CPEvent,"currentTimestamp");
_a2.target=_a1.target;
_a2.shiftKey=_a2.ctrlKey=_a2.altKey=_a2.metaKey=false;
_a2.preventDefault=function(){
if(_a1.preventDefault){
_a1.preventDefault();
}
};
_a2.stopPropagation=function(){
if(_a1.stopPropagation){
_a1.stopPropagation();
}
};
objj_msgSend(_9f,"mouseEvent:",_a2);
return;
}else{
if(_a1.preventDefault){
_a1.preventDefault();
}
if(_a1.stopPropagation){
_a1.stopPropagation();
}
}
}
}),new objj_method(sel_getUid("mouseEvent:"),function(_a4,_a5,_a6){
with(_a4){
var _a7=_overriddenEventType||_a6.type;
if(_a7==="dblclick"){
_overriddenEventType=CPDOMEventMouseDown;
objj_msgSend(_a4,"mouseEvent:",_a6);
_overriddenEventType=CPDOMEventMouseUp;
objj_msgSend(_a4,"mouseEvent:",_a6);
_overriddenEventType=nil;
return;
}
var _a8,_a9={x:_a6.clientX,y:_a6.clientY},_aa=objj_msgSend(CPEvent,"currentTimestamp"),_ab=(_a6.target||_a6.srcElement),_ac=0,_ad=(_a6.shiftKey?CPShiftKeyMask:0)|(_a6.ctrlKey?CPControlKeyMask:0)|(_a6.altKey?CPAlternateKeyMask:0)|(_a6.metaKey?CPCommandKeyMask:0);
_4=YES;
if(_mouseDownWindow){
_ac=objj_msgSend(_mouseDownWindow,"windowNumber");
}else{
var _ae=objj_msgSend(_a4,"hitTest:",_a9);
if((_a6.type===CPDOMEventMouseDown)&&_ae){
_mouseDownWindow=_ae;
}
_ac=objj_msgSend(_ae,"windowNumber");
}
if(_ac){
_a9=objj_msgSend(CPApp._windows[_ac],"convertPlatformWindowToBase:",_a9);
}
if(_a7==="mouseup"){
if(_mouseIsDown){
_a8=_af(_a6,_mouseDownIsRightClick?CPRightMouseUp:CPLeftMouseUp,_a9,_ad,_aa,_ac,nil,-1,_2(_lastMouseUp,_aa,_a9),0,nil);
_mouseIsDown=NO;
_lastMouseUp=_a8;
_mouseDownWindow=nil;
_mouseDownIsRightClick=NO;
}
if(_DOMEventMode){
_DOMEventMode=NO;
return;
}
}else{
if(_a7==="mousedown"){
var _b0=_a6.button;
_mouseDownIsRightClick=_b0==2||(CPBrowserIsOperatingSystem(CPMacOperatingSystem)&&_b0==0&&_ad&CPControlKeyMask);
if(_ab.tagName==="INPUT"&&_ab!=_DOMFocusElement){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.setAttribute("draggable","false");
_DOMBodyElement.style["-khtml-user-drag"]="none";
}
_DOMEventMode=YES;
_mouseIsDown=YES;
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",_mouseDownIsRightClick?CPRightMouseDown:CPLeftMouseDown,_a9,_ad,_aa,_ac,nil,-1,_2(_lastMouseDown,_aa,_a9),0));
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",_mouseDownIsRightClick?CPRightMouseUp:CPLeftMouseUp,_a9,_ad,_aa,_ac,nil,-1,_2(_lastMouseDown,_aa,_a9),0));
return;
}else{
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.setAttribute("draggable","true");
_DOMBodyElement.style["-khtml-user-drag"]="element";
}
}
_5=YES;
_a8=_af(_a6,_mouseDownIsRightClick?CPRightMouseDown:CPLeftMouseDown,_a9,_ad,_aa,_ac,nil,-1,_2(_lastMouseDown,_aa,_a9),0,nil);
_mouseIsDown=YES;
_lastMouseDown=_a8;
}else{
if(_DOMEventMode){
return;
}
_a8=_af(_a6,_mouseIsDown?(_mouseDownIsRightClick?CPRightMouseDragged:CPLeftMouseDragged):CPMouseMoved,_a9,_ad,_aa,_ac,nil,-1,1,0,_lastMouseEventLocation||_a9);
}
}
var _b1=objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"isDragging");
if(_a8&&(!_b1||!_c)){
_a8._DOMEvent=_a6;
objj_msgSend(CPApp,"sendEvent:",_a8);
}
if(_4&&(!_c||_a7!=="mousedown"&&!_b1)){
_3(_a6,_a4);
}
var _b2=NO;
for(var i=0;i<CPApp._eventListeners.length;i++){
if(CPApp._eventListeners[i]._callback!==_CPRunModalLoop){
_b2=YES;
break;
}
}
_lastMouseEventLocation=_a9;
_DOMEventGuard.style.display=_b2?"":"none";
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("contextMenuEvent:"),function(_b3,_b4,_b5){
with(_b3){
if(_5){
_3(_b5,_b3);
}
return !_5;
}
}),new objj_method(sel_getUid("orderedWindowsAtLevel:"),function(_b6,_b7,_b8){
with(_b6){
var _b9=objj_msgSend(_b6,"layerAtLevel:create:",_b8,NO);
if(!_b9){
return [];
}
return objj_msgSend(_b9,"orderedWindows");
}
}),new objj_method(sel_getUid("layerAtLevel:create:"),function(_ba,_bb,_bc,_bd){
with(_ba){
var _be=objj_msgSend(_windowLayers,"objectForKey:",_bc);
if(!_be&&_bd){
_be=objj_msgSend(objj_msgSend(CPDOMWindowLayer,"alloc"),"initWithLevel:",_bc);
objj_msgSend(_windowLayers,"setObject:forKey:",_be,_bc);
var low=0,_bf=_windowLevels.length-1,_c0;
while(low<=_bf){
_c0=FLOOR((low+_bf)/2);
if(_windowLevels[_c0]>_bc){
_bf=_c0-1;
}else{
low=_c0+1;
}
}
var _c1=0;
if(_c0!==undefined){
_c1=_windowLevels[_c0]>_bc?_c0:_c0+1;
}
objj_msgSend(_windowLevels,"insertObject:atIndex:",_bc,_c1);
_be._DOMElement.style.zIndex=_bc;
_DOMBodyElement.appendChild(_be._DOMElement);
}
return _be;
}
}),new objj_method(sel_getUid("order:window:relativeTo:"),function(_c2,_c3,_c4,_c5,_c6){
with(_c2){
objj_msgSend(CPPlatform,"initializeScreenIfNecessary");
var _c7=objj_msgSend(_c2,"layerAtLevel:create:",objj_msgSend(_c5,"level"),_c4!==CPWindowOut);
if(_c4===CPWindowOut){
return objj_msgSend(_c7,"removeWindow:",_c5);
}
var _c8=CPNotFound;
if(_c6){
_c8=_c4===CPWindowAbove?_c6._index+1:_c6._index;
}
objj_msgSend(_c7,"insertWindow:atIndex:",_c5,_c8);
}
}),new objj_method(sel_getUid("_removeLayers"),function(_c9,_ca){
with(_c9){
var _cb=_windowLevels,_cc=_windowLayers,_cd=_cb.length;
while(_cd--){
var _ce=objj_msgSend(_cc,"objectForKey:",_cb[_cd]);
_DOMBodyElement.removeChild(_ce._DOMElement);
}
}
}),new objj_method(sel_getUid("_addLayers"),function(_cf,_d0){
with(_cf){
var _d1=_windowLevels,_d2=_windowLayers,_d3=_d1.length;
while(_d3--){
var _d4=objj_msgSend(_d2,"objectForKey:",_d1[_d3]);
_DOMBodyElement.appendChild(_d4._DOMElement);
}
}
}),new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_d5,_d6,_d7,_d8){
with(_d5){
var _d9=_windowLevels,_da=_windowLayers,_db=_d9.length;
while(_db--){
if(_d9[_db]>=CPDraggingWindowLevel){
continue;
}
var _dc=objj_msgSend(_da,"objectForKey:",_d9[_db])._windows,_dd=_dc.length;
while(_dd--){
var _de=_dc[_dd];
if(objj_msgSend(_de,"_sharesChromeWithPlatformWindow")){
return objj_msgSend(_de,"_dragHitTest:pasteboard:",_d7,_d8);
}
if(objj_msgSend(_de,"containsPoint:",_d7)){
return objj_msgSend(_de,"_dragHitTest:pasteboard:",_d7,_d8);
}
}
}
return nil;
}
}),new objj_method(sel_getUid("_propagateCurrentDOMEvent:"),function(_df,_e0,_e1){
with(_df){
_4=!_e1;
}
}),new objj_method(sel_getUid("_willPropagateCurrentDOMEvent"),function(_e2,_e3){
with(_e2){
return !_4;
}
}),new objj_method(sel_getUid("_propagateContextMenuDOMEvent:"),function(_e4,_e5,_e6){
with(_e4){
if(_e6&&CPBrowserIsEngine(CPGeckoBrowserEngine)){
_4=!_e6;
}
_5=!_e6;
}
}),new objj_method(sel_getUid("_willPropagateContextMenuDOMEvent"),function(_e7,_e8){
with(_e7){
return _5;
}
}),new objj_method(sel_getUid("hitTest:"),function(_e9,_ea,_eb){
with(_e9){
if(_e9._only){
return _e9._only;
}
var _ec=_windowLevels,_ed=_windowLayers,_ee=_ec.length,_ef=nil;
while(_ee--&&!_ef){
var _f0=objj_msgSend(_ed,"objectForKey:",_ec[_ee])._windows,_f1=_f0.length;
while(_f1--&&!_ef){
var _f2=_f0[_f1];
if(!_f2._ignoresMouseEvents&&objj_msgSend(_f2,"containsPoint:",_eb)){
_ef=_f2;
}
}
}
return _ef;
}
})]);
class_addMethods(_f,[new objj_method(sel_getUid("visiblePlatformWindows"),function(_f3,_f4){
with(_f3){
if(objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"isVisible")){
var set=objj_msgSend(CPSet,"setWithSet:",_1);
objj_msgSend(set,"addObject:",objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"));
return set;
}else{
return _1;
}
}
}),new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"),function(_f5,_f6,_f7){
with(_f5){
for(var i=_f7.length;i>0;i--){
_7[""+_f7[i-1].toLowerCase()]=YES;
}
}
}),new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"),function(_f8,_f9,_fa){
with(_f8){
_7[_fa.toLowerCase()]=YES;
}
}),new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"),function(_fb,_fc){
with(_fb){
_7={};
}
}),new objj_method(sel_getUid("preventKeyCodesFromPropagating:"),function(_fd,_fe,_ff){
with(_fd){
for(var i=_ff.length;i>0;i--){
_6[_ff[i-1]]=YES;
}
}
}),new objj_method(sel_getUid("preventKeyCodeFromPropagating:"),function(self,_100,_101){
with(self){
_6[_101]=YES;
}
}),new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"),function(self,_102){
with(self){
_6={};
}
})]);
var _103=objj_msgSend(CPEvent,"class");
var _af=function(_104,_105,_106,_107,_108,_109,_10a,_10b,_10c,_10d,_10e){
_104.isa=_103;
_104._type=_105;
_104._location=_106;
_104._modifierFlags=_107;
_104._timestamp=_108;
_104._windowNumber=_109;
_104._window=nil;
_104._context=_10a;
_104._eventNumber=_10b;
_104._clickCount=_10c;
_104._pressure=_10d;
if((_105==CPLeftMouseDragged)||(_105==CPRightMouseDragged)||(_105==CPMouseMoved)){
_104._deltaX=_106.x-_10e.x;
_104._deltaY=_106.y-_10e.y;
}else{
_104._deltaX=0;
_104._deltaY=0;
}
return _104;
};
var _10f=5,_110=(typeof document!="undefined"&&document.addEventListener)?0.55:1;
var _2=function(_111,_112,_113){
if(!_111){
return 1;
}
var _114=objj_msgSend(_111,"locationInWindow");
return (_112-objj_msgSend(_111,"timestamp")<_110&&ABS(_114.x-_113.x)<_10f&&ABS(_114.y-_113.y)<_10f)?objj_msgSend(_111,"clickCount")+1:1;
};
var _3=function(_115,_116){
_115.cancelBubble=true;
_115.returnValue=false;
if(_115.preventDefault){
_115.preventDefault();
}
if(_115.stopPropagation){
_115.stopPropagation();
}
if(_115.type===CPDOMEventMouseDown){
_116._DOMFocusElement.focus();
_116._DOMFocusElement.blur();
}
};
CPWindowObjectList=function(){
var _117=objj_msgSend(CPPlatformWindow,"visiblePlatformWindows"),_118=objj_msgSend(_117,"objectEnumerator"),_119=nil,_11a=[];
while((_119=objj_msgSend(_118,"nextObject"))!==nil){
var _11b=_119._windowLevels,_11c=_119._windowLayers,_11d=_11b.length;
while(_11d--){
var _11e=objj_msgSend(_11c,"objectForKey:",_11b[_11d])._windows,_11f=_11e.length;
while(_11f--){
_11a.push(_11e[_11f]);
}
}
}
return _11a;
};
CPWindowList=function(){
var _120=CPWindowObjectList(),_121=[];
for(var i=0,_122=objj_msgSend(_120,"count");i<_122;i++){
_121.push(objj_msgSend(_120[i],"windowNumber"));
}
return _121;
};
