@STATIC;1.0;i;9;CPEvent.ji;12;CPPlatform.jt;4573;
objj_executeFile("CPEvent.j",YES);
objj_executeFile("CPPlatform.j",YES);
CPUnknownBrowserEngine=0;
CPGeckoBrowserEngine=1;
CPInternetExplorerBrowserEngine=2;
CPKHTMLBrowserEngine=3;
CPOperaBrowserEngine=4;
CPWebKitBrowserEngine=5;
CPMacOperatingSystem=0;
CPWindowsOperatingSystem=1;
CPOtherOperatingSystem=2;
CPCSSRGBAFeature=1<<5;
CPHTMLCanvasFeature=1<<6;
CPHTMLContentEditableFeature=1<<7;
CPHTMLDragAndDropFeature=1<<8;
CPJavaScriptInnerTextFeature=1<<9;
CPJavaScriptTextContentFeature=1<<10;
CPJavaScriptClipboardEventsFeature=1<<11;
CPJavaScriptClipboardAccessFeature=1<<12;
CPJavaScriptCanvasDrawFeature=1<<13;
CPJavaScriptCanvasTransformFeature=1<<14;
CPVMLFeature=1<<15;
CPJavaScriptRemedialKeySupport=1<<16;
CPJavaScriptShadowFeature=1<<20;
CPJavaScriptNegativeMouseWheelValues=1<<22;
CPJavaScriptMouseWheelValues_8_15=1<<23;
CPOpacityRequiresFilterFeature=1<<24;
CPInputTypeCanBeChangedFeature=1<<25;
CPHTML5DragAndDropSourceYOffBy1=1<<26;
CPSOPDisabledFromFileURLs=1<<27;
CPInputSetFontOutsideOfDOM=1<<28;
CPInput1PxLeftPadding=1<<29;
CPInputOnInputEventFeature=1<<30;
CPCanvasParentDrawErrorsOnMovementBug=1<<0;
var _1="",_2=CPUnknownBrowserEngine,_3=0,_4=0;
_3|=CPInputTypeCanBeChangedFeature;
_3|=CPInputSetFontOutsideOfDOM;
if(typeof window!=="undefined"&&typeof window.navigator!=="undefined"){
_1=window.navigator.userAgent;
}
if(typeof window!=="undefined"&&window.opera){
_2=CPOperaBrowserEngine;
_3|=CPJavaScriptCanvasDrawFeature;
}else{
if(typeof window!=="undefined"&&window.attachEvent){
_2=CPInternetExplorerBrowserEngine;
_3|=CPVMLFeature;
_3|=CPJavaScriptRemedialKeySupport;
_3|=CPJavaScriptShadowFeature;
_3|=CPOpacityRequiresFilterFeature;
_3&=~CPInputTypeCanBeChangedFeature;
_3&=~CPInputSetFontOutsideOfDOM;
}else{
if(_1.indexOf("AppleWebKit/")!=-1){
_2=CPWebKitBrowserEngine;
_3|=CPCSSRGBAFeature;
_3|=CPHTMLContentEditableFeature;
if(_1.indexOf("Chrome")===-1){
_3|=CPHTMLDragAndDropFeature;
}
_3|=CPJavaScriptClipboardEventsFeature;
_3|=CPJavaScriptClipboardAccessFeature;
_3|=CPJavaScriptShadowFeature;
var _5=_1.indexOf("AppleWebKit/")+"AppleWebKit/".length,_6=_1.indexOf(" ",_5),_7=_1.substring(_5,_6),_8=_7.indexOf("."),_9=parseInt(_7.substring(0,_8)),_a=parseInt(_7.substr(_8+1));
if((_1.indexOf("Safari")!==CPNotFound&&(_9>525||(_9===525&&_a>14)))||_1.indexOf("Chrome")!==CPNotFound){
_3|=CPJavaScriptRemedialKeySupport;
}
if(!objj_msgSend(CPPlatform,"isBrowser")){
_3|=CPJavaScriptRemedialKeySupport;
}
if(_9<532||(_9===532&&_a<6)){
_3|=CPHTML5DragAndDropSourceYOffBy1;
}
if(_9<537){
_3|=CPInput1PxLeftPadding;
}
if(_1.indexOf("Chrome")===CPNotFound){
_3|=CPSOPDisabledFromFileURLs;
}
if(_9>533){
_4|=CPCanvasParentDrawErrorsOnMovementBug;
}
}else{
if(_1.indexOf("KHTML")!=-1){
_2=CPKHTMLBrowserEngine;
}else{
if(_1.indexOf("Gecko")!==-1){
_2=CPGeckoBrowserEngine;
_3|=CPJavaScriptCanvasDrawFeature;
var _b=_1.indexOf("Firefox"),_c=(_b===-1)?2:parseFloat(_1.substring(_b+"Firefox".length+1));
if(_c>=3){
_3|=CPCSSRGBAFeature;
}
if(_c<3){
_3|=CPJavaScriptMouseWheelValues_8_15;
}
_3|=CPInput1PxLeftPadding;
}
}
}
}
}
if(typeof document!="undefined"){
var _d=document.createElement("canvas");
if(_d&&_d.getContext){
_3|=CPHTMLCanvasFeature;
var _e=document.createElement("canvas").getContext("2d");
if(_e&&_e.setTransform&&_e.transform){
_3|=CPJavaScriptCanvasTransformFeature;
}
}
var _f=document.createElement("div");
if(_f.innerText!=undefined){
_3|=CPJavaScriptInnerTextFeature;
}else{
if(_f.textContent!=undefined){
_3|=CPJavaScriptTextContentFeature;
}
}
var _10=document.createElement("input");
if("oninput" in _10){
_3|=CPInputOnInputEventFeature;
}else{
if(typeof _10.setAttribute==="function"){
_10.setAttribute("oninput","return;");
if(typeof _10.oninput==="function"){
_3|=CPInputOnInputEventFeature;
}
}
}
}
CPFeatureIsCompatible=function(_11){
return _3&_11;
};
CPPlatformHasBug=function(_12){
return _4&_12;
};
CPBrowserIsEngine=function(_13){
return _2===_13;
};
CPBrowserIsOperatingSystem=function(_14){
return OPERATING_SYSTEM===_14;
};
OPERATING_SYSTEM=CPOtherOperatingSystem;
if(_1.indexOf("Mac")!==-1){
OPERATING_SYSTEM=CPMacOperatingSystem;
CPPlatformActionKeyMask=CPCommandKeyMask;
CPUndoKeyEquivalent="z";
CPRedoKeyEquivalent="Z";
CPUndoKeyEquivalentModifierMask=CPCommandKeyMask;
CPRedoKeyEquivalentModifierMask=CPCommandKeyMask;
}else{
if(_1.indexOf("Windows")!==-1){
OPERATING_SYSTEM=CPWindowsOperatingSystem;
}
CPPlatformActionKeyMask=CPControlKeyMask;
CPUndoKeyEquivalent="z";
CPRedoKeyEquivalent="y";
CPUndoKeyEquivalentModifierMask=CPControlKeyMask;
CPRedoKeyEquivalentModifierMask=CPControlKeyMask;
}
