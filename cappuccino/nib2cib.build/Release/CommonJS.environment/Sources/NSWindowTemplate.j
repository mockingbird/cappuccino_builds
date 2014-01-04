@STATIC;1.0;I;29;AppKit/_CPCibWindowTemplate.jt;2440;
objj_executeFile("AppKit/_CPCibWindowTemplate.j",NO);
var _1=0,_2=1,_3=2,_4=4,_5=8,_6=16,_7=64,_8=256,_9=8192,_a=2048;
var _b=objj_getClass("_CPCibWindowTemplate");
if(!_b){
throw new SyntaxError("*** Could not find definition for class \"_CPCibWindowTemplate\"");
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("_CPCibWindowTemplate").super_class},"init");
if(_d){
if(objj_msgSend(_f,"containsValueForKey:","NSMinSize")){
_minSize=objj_msgSend(_f,"decodeSizeForKey:","NSMinSize");
}
if(objj_msgSend(_f,"containsValueForKey:","NSMaxSize")){
_maxSize=objj_msgSend(_f,"decodeSizeForKey:","NSMaxSize");
}
_screenRect=objj_msgSend(_f,"decodeRectForKey:","NSScreenRect");
_viewClass=objj_msgSend(_f,"decodeObjectForKey:","NSViewClass");
_wtFlags=objj_msgSend(_f,"decodeIntForKey:","NSWTFlags");
_windowAutorecalculatesKeyViewLoop=!!(_wtFlags&_a);
_windowBacking=objj_msgSend(_f,"decodeIntForKey:","NSWindowBacking");
_windowClass=CP_NSMapClassName(objj_msgSend(_f,"decodeObjectForKey:","NSWindowClass"));
_windowRect=objj_msgSend(_f,"decodeRectForKey:","NSWindowRect");
_windowStyleMask=objj_msgSend(_f,"decodeIntForKey:","NSWindowStyleMask");
_windowTitle=objj_msgSend(_f,"decodeObjectForKey:","NSWindowTitle");
_windowView=objj_msgSend(_f,"decodeObjectForKey:","NSWindowView");
_windowRect.origin.y=_screenRect.size.height-_windowRect.origin.y-_windowRect.size.height;
if(_windowStyleMask===_1){
_windowStyleMask=CPBorderlessWindowMask;
}else{
_windowStyleMask=(_windowStyleMask&_2?CPTitledWindowMask:0)|(_windowStyleMask&_3?CPClosableWindowMask:0)|(_windowStyleMask&_4?CPMiniaturizableWindowMask:0)|(_windowStyleMask&_5?CPResizableWindowMask:0)|(_windowStyleMask&_8?_8:0)|(_windowStyleMask&_7?CPDocModalWindowMask:0)|(_windowStyleMask&_9?CPHUDBackgroundWindowMask:0);
}
_windowIsFullBridge=objj_msgSend(_f,"decodeObjectForKey:","NSFrameAutosaveName")==="CPBorderlessBridgeWindowMask";
}
return _d;
}
})]);
var _b=objj_allocateClassPair(_CPCibWindowTemplate,"NSWindowTemplate"),_c=_b.isa;
objj_registerClassPair(_b);
class_addMethods(_b,[new objj_method(sel_getUid("initWithCoder:"),function(_10,_11,_12){
with(_10){
return objj_msgSend(_10,"NS_initWithCoder:",_12);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_13,_14){
with(_13){
return objj_msgSend(_CPCibWindowTemplate,"class");
}
})]);
