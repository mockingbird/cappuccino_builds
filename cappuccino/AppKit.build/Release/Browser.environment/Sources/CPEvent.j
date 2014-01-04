@STATIC;1.0;I;21;Foundation/CPObject.ji;8;CPText.jt;13513;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPText.j",YES);
CPLeftMouseDown=1;
CPLeftMouseUp=2;
CPRightMouseDown=3;
CPRightMouseUp=4;
CPMouseMoved=5;
CPLeftMouseDragged=6;
CPRightMouseDragged=7;
CPMouseEntered=8;
CPMouseExited=9;
CPKeyDown=10;
CPKeyUp=11;
CPFlagsChanged=12;
CPAppKitDefined=13;
CPSystemDefined=14;
CPApplicationDefined=15;
CPPeriodic=16;
CPCursorUpdate=17;
CPScrollWheel=22;
CPOtherMouseDown=25;
CPOtherMouseUp=26;
CPOtherMouseDragged=27;
CPTouchStart=28;
CPTouchMove=29;
CPTouchEnd=30;
CPTouchCancel=31;
CPAlphaShiftKeyMask=1<<16;
CPShiftKeyMask=1<<17;
CPControlKeyMask=1<<18;
CPAlternateKeyMask=1<<19;
CPCommandKeyMask=1<<20;
CPNumericPadKeyMask=1<<21;
CPHelpKeyMask=1<<22;
CPFunctionKeyMask=1<<23;
CPDeviceIndependentModifierFlagsMask=4294901760;
CPLeftMouseDownMask=1<<CPLeftMouseDown;
CPLeftMouseUpMask=1<<CPLeftMouseUp;
CPRightMouseDownMask=1<<CPRightMouseDown;
CPRightMouseUpMask=1<<CPRightMouseUp;
CPOtherMouseDownMask=1<<CPOtherMouseDown;
CPOtherMouseUpMask=1<<CPOtherMouseUp;
CPMouseMovedMask=1<<CPMouseMoved;
CPLeftMouseDraggedMask=1<<CPLeftMouseDragged;
CPRightMouseDraggedMask=1<<CPRightMouseDragged;
CPOtherMouseDragged=1<<CPOtherMouseDragged;
CPMouseEnteredMask=1<<CPMouseEntered;
CPMouseExitedMask=1<<CPMouseExited;
CPCursorUpdateMask=1<<CPCursorUpdate;
CPKeyDownMask=1<<CPKeyDown;
CPKeyUpMask=1<<CPKeyUp;
CPFlagsChangedMask=1<<CPFlagsChanged;
CPAppKitDefinedMask=1<<CPAppKitDefined;
CPSystemDefinedMask=1<<CPSystemDefined;
CPApplicationDefinedMask=1<<CPApplicationDefined;
CPPeriodicMask=1<<CPPeriodic;
CPScrollWheelMask=1<<CPScrollWheel;
CPAnyEventMask=4294967295;
CPUpArrowFunctionKey="";
CPDownArrowFunctionKey="";
CPLeftArrowFunctionKey="";
CPRightArrowFunctionKey="";
CPF1FunctionKey="";
CPF2FunctionKey="";
CPF3FunctionKey="";
CPF4FunctionKey="";
CPF5FunctionKey="";
CPF6FunctionKey="";
CPF7FunctionKey="";
CPF8FunctionKey="";
CPF9FunctionKey="";
CPF10FunctionKey="";
CPF11FunctionKey="";
CPF12FunctionKey="";
CPF13FunctionKey="";
CPF14FunctionKey="";
CPF15FunctionKey="";
CPF16FunctionKey="";
CPF17FunctionKey="";
CPF18FunctionKey="";
CPF19FunctionKey="";
CPF20FunctionKey="";
CPF21FunctionKey="";
CPF22FunctionKey="";
CPF23FunctionKey="";
CPF24FunctionKey="";
CPF25FunctionKey="";
CPF26FunctionKey="";
CPF27FunctionKey="";
CPF28FunctionKey="";
CPF29FunctionKey="";
CPF30FunctionKey="";
CPF31FunctionKey="";
CPF32FunctionKey="";
CPF33FunctionKey="";
CPF34FunctionKey="";
CPF35FunctionKey="";
CPInsertFunctionKey="";
CPDeleteFunctionKey="";
CPHomeFunctionKey="";
CPBeginFunctionKey="";
CPEndFunctionKey="";
CPPageUpFunctionKey="";
CPPageDownFunctionKey="";
CPPrintScreenFunctionKey="";
CPScrollLockFunctionKey="";
CPPauseFunctionKey="";
CPSysReqFunctionKey="";
CPBreakFunctionKey="";
CPResetFunctionKey="";
CPStopFunctionKey="";
CPMenuFunctionKey="";
CPUserFunctionKey="";
CPSystemFunctionKey="";
CPPrintFunctionKey="";
CPClearLineFunctionKey="";
CPClearDisplayFunctionKey="";
CPInsertLineFunctionKey="";
CPDeleteLineFunctionKey="";
CPInsertCharFunctionKey="";
CPDeleteCharFunctionKey="";
CPPrevFunctionKey="";
CPNextFunctionKey="";
CPSelectFunctionKey="";
CPExecuteFunctionKey="";
CPUndoFunctionKey="";
CPRedoFunctionKey="";
CPFindFunctionKey="";
CPHelpFunctionKey="";
CPModeSwitchFunctionKey="";
CPEscapeFunctionKey="";
CPSpaceFunctionKey=" ";
CPDOMEventDoubleClick="dblclick";
CPDOMEventMouseDown="mousedown";
CPDOMEventMouseUp="mouseup";
CPDOMEventMouseMoved="mousemove";
CPDOMEventMouseDragged="mousedrag";
CPDOMEventKeyUp="keyup";
CPDOMEventKeyDown="keydown";
CPDOMEventKeyPress="keypress";
CPDOMEventCopy="copy";
CPDOMEventPaste="paste";
CPDOMEventScrollWheel="mousewheel";
CPDOMEventTouchStart="touchstart";
CPDOMEventTouchMove="touchmove";
CPDOMEventTouchEnd="touchend";
CPDOMEventTouchCancel="touchcancel";
var _1=0,_2=nil,_3=new RegExp("[A-Z]"),_4=new Date().getTime();
var _5=objj_allocateClassPair(CPObject,"CPEvent"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_type"),new objj_ivar("_location"),new objj_ivar("_modifierFlags"),new objj_ivar("_timestamp"),new objj_ivar("_context"),new objj_ivar("_eventNumber"),new objj_ivar("_clickCount"),new objj_ivar("_pressure"),new objj_ivar("_window"),new objj_ivar("_windowNumber"),new objj_ivar("_characters"),new objj_ivar("_isARepeat"),new objj_ivar("_keyCode"),new objj_ivar("_DOMEvent"),new objj_ivar("_data1"),new objj_ivar("_data2"),new objj_ivar("_deltaX"),new objj_ivar("_deltaY"),new objj_ivar("_deltaZ")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("_initWithType:"),function(_7,_8,_9){
with(_7){
if(_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPEvent").super_class},"init")){
_type=_9;
_deltaX=0;
_deltaY=0;
_deltaZ=0;
}
return _7;
}
}),new objj_method(sel_getUid("_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"),function(_a,_b,_c,_d,_e,_f,_10,_11,_12,_13,_14){
with(_a){
if(_a=objj_msgSend(_a,"_initWithType:",_c)){
_location=CPPointCreateCopy(_d);
_modifierFlags=_e;
_timestamp=_f;
_context=_11;
_eventNumber=_12;
_clickCount=_13;
_pressure=_14;
_window=objj_msgSend(CPApp,"windowWithWindowNumber:",_10);
}
return _a;
}
}),new objj_method(sel_getUid("_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"),function(_15,_16,_17,_18,_19,_1a,_1b,_1c,_1d,_1e,_1f,_20){
with(_15){
if(_15=objj_msgSend(_15,"_initWithType:",_17)){
_location=CPPointCreateCopy(_18);
_modifierFlags=_19;
_timestamp=_1a;
_context=_1c;
_characters=_1d;
_charactersIgnoringModifiers=_1e;
_isARepeat=_1f;
_keyCode=_20;
_windowNumber=_1b;
}
return _15;
}
}),new objj_method(sel_getUid("_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"),function(_21,_22,_23,_24,_25,_26,_27,_28,_29,_2a,_2b){
with(_21){
if(_21=objj_msgSend(_21,"_initWithType:",_23)){
_location=CPPointCreateCopy(_24);
_modifierFlags=_25;
_timestamp=_26;
_context=_28;
_subtype=_29;
_data1=_2a;
_data2=_2b;
}
return _21;
}
}),new objj_method(sel_getUid("locationInWindow"),function(_2c,_2d){
with(_2c){
return {x:_location.x,y:_location.y};
}
}),new objj_method(sel_getUid("globalLocation"),function(_2e,_2f){
with(_2e){
var _30=objj_msgSend(_2e,"window"),_31=objj_msgSend(_2e,"locationInWindow");
if(_30){
return objj_msgSend(_30,"convertBaseToGlobal:",_31);
}
return _31;
}
}),new objj_method(sel_getUid("modifierFlags"),function(_32,_33){
with(_32){
return _modifierFlags;
}
}),new objj_method(sel_getUid("timestamp"),function(_34,_35){
with(_34){
return _timestamp;
}
}),new objj_method(sel_getUid("type"),function(_36,_37){
with(_36){
return _type;
}
}),new objj_method(sel_getUid("window"),function(_38,_39){
with(_38){
if(!_window){
_window=objj_msgSend(CPApp,"windowWithWindowNumber:",_windowNumber);
}
return _window;
}
}),new objj_method(sel_getUid("windowNumber"),function(_3a,_3b){
with(_3a){
return _windowNumber;
}
}),new objj_method(sel_getUid("buttonNumber"),function(_3c,_3d){
with(_3c){
if(_type===CPRightMouseDown||_type===CPRightMouseUp||_type===CPRightMouseDragged){
return 1;
}
return 0;
}
}),new objj_method(sel_getUid("clickCount"),function(_3e,_3f){
with(_3e){
return _clickCount;
}
}),new objj_method(sel_getUid("characters"),function(_40,_41){
with(_40){
return _characters;
}
}),new objj_method(sel_getUid("charactersIgnoringModifiers"),function(_42,_43){
with(_42){
return _charactersIgnoringModifiers;
}
}),new objj_method(sel_getUid("isARepeat"),function(_44,_45){
with(_44){
return _isARepeat;
}
}),new objj_method(sel_getUid("keyCode"),function(_46,_47){
with(_46){
return _keyCode;
}
}),new objj_method(sel_getUid("pressure"),function(_48,_49){
with(_48){
return _pressure;
}
}),new objj_method(sel_getUid("_DOMEvent"),function(_4a,_4b){
with(_4a){
return _DOMEvent;
}
}),new objj_method(sel_getUid("data1"),function(_4c,_4d){
with(_4c){
return _data1;
}
}),new objj_method(sel_getUid("data2"),function(_4e,_4f){
with(_4e){
return _data2;
}
}),new objj_method(sel_getUid("deltaX"),function(_50,_51){
with(_50){
return _deltaX;
}
}),new objj_method(sel_getUid("deltaY"),function(_52,_53){
with(_52){
return _deltaY;
}
}),new objj_method(sel_getUid("deltaZ"),function(_54,_55){
with(_54){
return _deltaZ;
}
}),new objj_method(sel_getUid("_triggersKeyEquivalent:withModifierMask:"),function(_56,_57,_58,_59){
with(_56){
if(!_58){
return NO;
}
if(_3.test(_58)){
_59|=CPShiftKeyMask;
}
if(!CPBrowserIsOperatingSystem(CPMacOperatingSystem)&&(_59&CPCommandKeyMask)){
_59|=CPControlKeyMask;
_59&=~CPCommandKeyMask;
}
if((_modifierFlags&(CPShiftKeyMask|CPAlternateKeyMask|CPCommandKeyMask|CPControlKeyMask))!==_59){
return NO;
}
if(_characters===CPNewlineCharacter||_characters===CPCarriageReturnCharacter){
return CPNewlineCharacter===_58||CPCarriageReturnCharacter===_58;
}
return objj_msgSend(_characters,"caseInsensitiveCompare:",_58)===CPOrderedSame;
}
}),new objj_method(sel_getUid("_couldBeKeyEquivalent"),function(_5a,_5b){
with(_5a){
if(_type!==CPKeyDown){
return NO;
}
var _5c=_characters.length;
if(!_5c){
return NO;
}
if(_modifierFlags&(CPCommandKeyMask|CPControlKeyMask)){
return YES;
}
var _5d=objj_msgSend(objj_msgSend(_window,"firstResponder"),"isKindOfClass:",objj_msgSend(CPTextField,"class"));
for(var i=0;i<_5c;i++){
var c=_characters.charAt(i);
if((c>=CPUpArrowFunctionKey&&c<=CPModeSwitchFunctionKey)||c===CPEnterCharacter||c===CPNewlineCharacter||c===CPCarriageReturnCharacter||c===CPEscapeFunctionKey){
return YES;
}
}
return !_5d;
}
}),new objj_method(sel_getUid("description"),function(_5e,_5f){
with(_5e){
switch(_type){
case CPKeyDown:
case CPKeyUp:
case CPFlagsChanged:
return objj_msgSend(CPString,"stringWithFormat:","CPEvent: type=%d loc=%@ time=%.1f flags=0x%X win=%@ winNum=%d ctxt=%@ chars=\"%@\" unmodchars=\"%@\" repeat=%d keyCode=%d",_type,CPStringFromPoint(_location),_timestamp,_modifierFlags,_window,_windowNumber,_context,_characters,_charactersIgnoringModifiers,_isARepeat,_keyCode);
case CPLeftMouseDown:
case CPLeftMouseUp:
case CPRightMouseDown:
case CPRightMouseUp:
case CPMouseMoved:
case CPLeftMouseDragged:
case CPRightMouseDragged:
case CPMouseEntered:
case CPMouseExited:
return objj_msgSend(CPString,"stringWithFormat:","CPEvent: type=%d loc=%@ time=%.1f flags=0x%X win=%@ winNum=%d ctxt=%@ evNum=%d click=%d buttonNumber=%d pressure=%f",_type,CPStringFromPoint(_location),_timestamp,_modifierFlags,_window,_windowNumber,_context,_eventNumber,_clickCount,objj_msgSend(_5e,"buttonNumber"),_pressure);
default:
return objj_msgSend(CPString,"stringWithFormat:","CPEvent: type=%d loc=%@ time=%.1f flags=0x%X win=%@ winNum=%d ctxt=%@ subtype=%d data1=%d data2=%d",_type,CPStringFromPoint(_location),_timestamp,_modifierFlags,_window,_windowNumber,_context,_subtype,_data1,_data2);
}
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("currentTimestamp"),function(_60,_61){
with(_60){
return (new Date().getTime()-_4)/1000;
}
}),new objj_method(sel_getUid("keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"),function(_62,_63,_64,_65,_66,_67,_68,_69,_6a,_6b,_6c,_6d){
with(_62){
return objj_msgSend(objj_msgSend(_62,"alloc"),"_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",_64,_65,_66,_67,_68,_69,_6a,_6b,_6c,_6d);
}
}),new objj_method(sel_getUid("mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"),function(_6e,_6f,_70,_71,_72,_73,_74,_75,_76,_77,_78){
with(_6e){
return objj_msgSend(objj_msgSend(_6e,"alloc"),"_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",_70,_71,_72,_73,_74,_75,_76,_77,_78);
}
}),new objj_method(sel_getUid("otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"),function(_79,_7a,_7b,_7c,_7d,_7e,_7f,_80,_81,_82,_83){
with(_79){
return objj_msgSend(objj_msgSend(_79,"alloc"),"_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",_7b,_7c,_7d,_7e,_7f,_80,_81,_82,_83);
}
}),new objj_method(sel_getUid("mouseLocation"),function(_84,_85){
with(_84){
var _86=objj_msgSend(CPApp,"currentEvent"),_87=objj_msgSend(_86,"window");
if(_87){
return objj_msgSend(_87,"convertBaseToGlobal:",objj_msgSend(_86,"locationInWindow"));
}
return objj_msgSend(_86,"locationInWindow");
}
}),new objj_method(sel_getUid("startPeriodicEventsAfterDelay:withPeriod:"),function(_88,_89,_8a,_8b){
with(_88){
_1=_8b;
_2=window.setTimeout(function(){
_2=window.setInterval(_CPEventFirePeriodEvent,_8b*1000);
},_8a*1000);
}
}),new objj_method(sel_getUid("stopPeriodicEvents"),function(_8c,_8d){
with(_8c){
if(_2===nil){
return;
}
window.clearTimeout(_2);
_2=nil;
}
})]);
_CPEventFirePeriodEvent=function(){
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",CPPeriodic,{x:0,y:0},0,objj_msgSend(CPEvent,"currentTimestamp"),0,nil,0,0,0));
};
var _8e=objj_msgSend(CPEvent,"class");
_CPEventFromNativeMouseEvent=function(_8f,_90,_91,_92,_93,_94,_95,_96,_97,_98){
_8f.isa=_8e;
_8f._type=_90;
_8f._location=_91;
_8f._modifierFlags=_92;
_8f._timestamp=_93;
_8f._windowNumber=_94;
_8f._window=nil;
_8f._context=_95;
_8f._eventNumber=_96;
_8f._clickCount=_97;
_8f._pressure=_98;
return _8f;
};
