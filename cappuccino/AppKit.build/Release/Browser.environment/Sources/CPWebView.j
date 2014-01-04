@STATIC;1.0;i;8;CPView.ji;14;CPScrollView.jt;18419;
objj_executeFile("CPView.j",YES);
objj_executeFile("CPScrollView.j",YES);
CPWebViewProgressStartedNotification="CPWebViewProgressStartedNotification";
CPWebViewProgressFinishedNotification="CPWebViewProgressFinishedNotification";
CPWebViewScrollAuto=0;
CPWebViewScrollAppKit=1;
CPWebViewScrollNative=2;
CPWebViewScrollNone=3;
CPWebViewAppKitScrollPollInterval=1;
CPWebViewAppKitScrollMaxPollCount=3;
var _1=objj_allocateClassPair(CPView,"CPWebView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_scrollView"),new objj_ivar("_frameView"),new objj_ivar("_iframe"),new objj_ivar("_mainFrameURL"),new objj_ivar("_backwardStack"),new objj_ivar("_forwardStack"),new objj_ivar("_ignoreLoadStart"),new objj_ivar("_ignoreLoadEnd"),new objj_ivar("_isLoading"),new objj_ivar("_downloadDelegate"),new objj_ivar("_frameLoadDelegate"),new objj_ivar("_policyDelegate"),new objj_ivar("_resourceLoadDelegate"),new objj_ivar("_UIDelegate"),new objj_ivar("_wso"),new objj_ivar("_url"),new objj_ivar("_html"),new objj_ivar("_loadCallback"),new objj_ivar("_scrollMode"),new objj_ivar("_effectiveScrollMode"),new objj_ivar("_contentIsAccessible"),new objj_ivar("_contentSizeCheckTimer"),new objj_ivar("_contentSizePollCount"),new objj_ivar("_loadHTMLStringTimer"),new objj_ivar("_drawsBackground")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:frameName:groupName:"),function(_3,_4,_5,_6,_7){
with(_3){
if(_3=objj_msgSend(_3,"initWithFrame:",_5)){
_iframe.name=_6;
}
return _3;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPWebView").super_class},"initWithFrame:",_a)){
_mainFrameURL=nil;
_backwardStack=[];
_forwardStack=[];
_scrollMode=CPWebViewScrollAuto;
_contentIsAccessible=YES;
_isLoading=NO;
_drawsBackground=YES;
objj_msgSend(_8,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_8,"_initDOMWithFrame:",_a);
}
return _8;
}
}),new objj_method(sel_getUid("_initDOMWithFrame:"),function(_b,_c,_d){
with(_b){
_ignoreLoadStart=YES;
_ignoreLoadEnd=YES;
_iframe=document.createElement("iframe");
_iframe.name="iframe_"+FLOOR(RAND()*10000);
_iframe.style.width="100%";
_iframe.style.height="100%";
_iframe.style.borderWidth="0px";
_iframe.frameBorder="0";
objj_msgSend(_b,"_applyBackgroundColor");
_loadCallback=function(){
if(!_ignoreLoadStart){
objj_msgSend(_b,"_startedLoading");
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=_iframe.src;
objj_msgSend(_forwardStack,"removeAllObjects");
}else{
_ignoreLoadStart=NO;
}
if(!_ignoreLoadEnd){
objj_msgSend(_b,"_finishedLoading");
}else{
_ignoreLoadEnd=NO;
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
if(_iframe.addEventListener){
_iframe.addEventListener("load",_loadCallback,false);
}else{
if(_iframe.attachEvent){
_iframe.attachEvent("onload",_loadCallback);
}
}
_frameView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_b,"bounds"));
objj_msgSend(_frameView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_scrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",objj_msgSend(_b,"bounds"));
objj_msgSend(_scrollView,"setAutohidesScrollers:",YES);
objj_msgSend(_scrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_scrollView,"setDocumentView:",_frameView);
_frameView._DOMElement.appendChild(_iframe);
objj_msgSend(_b,"_updateEffectiveScrollMode");
objj_msgSend(_b,"addSubview:",_scrollView);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_e,_f,_10){
with(_e){
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPWebView").super_class},"setFrameSize:",_10);
objj_msgSend(_e,"_resizeWebFrame");
}
}),new objj_method(sel_getUid("viewDidUnhide"),function(_11,_12){
with(_11){
objj_msgSend(_frameView,"setFrameSize:",objj_msgSend(_scrollView,"contentSize"));
objj_msgSend(_11,"_resizeWebFrame");
objj_msgSend(_11,"_scheduleContentSizeCheck");
}
}),new objj_method(sel_getUid("_attachScrollEventIfNecessary"),function(_13,_14){
with(_13){
if(_effectiveScrollMode!==CPWebViewScrollAppKit){
return;
}
var win=null;
try{
win=objj_msgSend(_13,"DOMWindow");
}
catch(e){
}
if(win&&win.addEventListener){
var _15=function(_16){
var _17=objj_msgSend(_13,"bounds"),_18=CGPointMake(CGRectGetMidX(_17),CGRectGetMidY(_17)),_19=objj_msgSend(_13,"convertPoint:toView:",_18,nil),_1a=objj_msgSend(objj_msgSend(_13,"window"),"convertBaseToBridge:",_19);
_16._overrideLocation=_1a;
objj_msgSend(objj_msgSend(objj_msgSend(_13,"window"),"platformWindow"),"scrollEvent:",_16);
};
win.addEventListener("DOMMouseScroll",_15,false);
}
}
}),new objj_method(sel_getUid("_resizeWebFrame"),function(_1b,_1c){
with(_1b){
if(!objj_msgSend(_1b,"_isVisible")){
return;
}
if(_effectiveScrollMode===CPWebViewScrollAppKit){
var _1d=objj_msgSend(_frameView,"visibleRect");
objj_msgSend(_frameView,"setFrameSize:",CGSizeMake(CGRectGetMaxX(_1d),CGRectGetMaxY(_1d)));
var win=null;
try{
win=objj_msgSend(_1b,"DOMWindow");
}
catch(e){
}
if(win&&win.document&&win.document.body){
var _1e=win.document.body.scrollWidth,_1f=win.document.body.scrollHeight;
_iframe.setAttribute("width",_1e);
_iframe.setAttribute("height",_1f);
objj_msgSend(_frameView,"setFrameSize:",CGSizeMake(_1e,_1f));
}else{
if(!win||!win.document){
CPLog.warn("using default size 800*1600");
objj_msgSend(_frameView,"setFrameSize:",CGSizeMake(800,1600));
}
}
objj_msgSend(_frameView,"scrollRectToVisible:",_1d);
}
}
}),new objj_method(sel_getUid("setScrollMode:"),function(_20,_21,_22){
with(_20){
if(_scrollMode==_22){
return;
}
_scrollMode=_22;
objj_msgSend(_20,"_updateEffectiveScrollMode");
}
}),new objj_method(sel_getUid("effectiveScrollMode"),function(_23,_24){
with(_23){
return _effectiveScrollMode;
}
}),new objj_method(sel_getUid("_updateEffectiveScrollMode"),function(_25,_26){
with(_25){
var _27=CPWebViewScrollAppKit;
if(_scrollMode==CPWebViewScrollNative||(_scrollMode==CPWebViewScrollAuto&&!_contentIsAccessible)||CPBrowserIsEngine(CPInternetExplorerBrowserEngine)){
_27=CPWebViewScrollNative;
}else{
if(_scrollMode==CPWebViewScrollAppKit&&!_contentIsAccessible){
CPLog.warn(_25+" unable to use CPWebViewScrollAppKit scroll mode due to same origin policy.");
_27=CPWebViewScrollNative;
}
}
if(_27!==_effectiveScrollMode){
objj_msgSend(_25,"_setEffectiveScrollMode:",_27);
}
}
}),new objj_method(sel_getUid("_setEffectiveScrollMode:"),function(_28,_29,_2a){
with(_28){
_effectiveScrollMode=_2a;
_ignoreLoadStart=YES;
_ignoreLoadEnd=YES;
var _2b=_iframe.parentNode;
_2b.removeChild(_iframe);
if(_effectiveScrollMode===CPWebViewScrollAppKit){
objj_msgSend(_scrollView,"setHasHorizontalScroller:",YES);
objj_msgSend(_scrollView,"setHasVerticalScroller:",YES);
_iframe.setAttribute("scrolling","no");
}else{
if(_effectiveScrollMode===CPWebViewScrollNone){
objj_msgSend(_scrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(_scrollView,"setHasVerticalScroller:",NO);
_iframe.setAttribute("scrolling","no");
}else{
objj_msgSend(_scrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(_scrollView,"setHasVerticalScroller:",NO);
_iframe.setAttribute("scrolling","auto");
objj_msgSend(_frameView,"setFrameSize:",objj_msgSend(_scrollView,"bounds").size);
}
}
_2b.appendChild(_iframe);
objj_msgSend(_28,"_applyBackgroundColor");
objj_msgSend(_28,"_resizeWebFrame");
}
}),new objj_method(sel_getUid("_maybePollWebFrameSize"),function(_2c,_2d){
with(_2c){
if(CPWebViewAppKitScrollMaxPollCount==0||_contentSizePollCount++<CPWebViewAppKitScrollMaxPollCount){
objj_msgSend(_2c,"_resizeWebFrame");
}else{
objj_msgSend(_contentSizeCheckTimer,"invalidate");
}
}
}),new objj_method(sel_getUid("loadHTMLString:"),function(_2e,_2f,_30){
with(_2e){
objj_msgSend(_2e,"loadHTMLString:baseURL:",_30,nil);
}
}),new objj_method(sel_getUid("loadHTMLString:baseURL:"),function(_31,_32,_33,URL){
with(_31){
objj_msgSend(_frameView,"setFrameSize:",objj_msgSend(_scrollView,"contentSize"));
objj_msgSend(_31,"_startedLoading");
_ignoreLoadStart=YES;
_url=nil;
_html=_33;
objj_msgSend(_31,"_load");
}
}),new objj_method(sel_getUid("_loadMainFrameURL"),function(_34,_35){
with(_34){
objj_msgSend(_34,"_startedLoading");
_ignoreLoadStart=YES;
_url=_mainFrameURL;
_html=nil;
objj_msgSend(_34,"_load");
}
}),new objj_method(sel_getUid("_load"),function(_36,_37){
with(_36){
if(_url){
var _38=objj_msgSend(CPURL,"URLWithString:",_url);
_contentIsAccessible=objj_msgSend(_38,"_passesSameOriginPolicy");
objj_msgSend(_36,"_updateEffectiveScrollMode");
_ignoreLoadEnd=NO;
_iframe.src=_url;
}else{
if(_html!==nil){
_iframe.src="";
_contentIsAccessible=YES;
objj_msgSend(_36,"_updateEffectiveScrollMode");
_ignoreLoadEnd=NO;
if(_loadHTMLStringTimer!==nil){
window.clearTimeout(_loadHTMLStringTimer);
_loadHTMLStringTimer=nil;
}
_loadHTMLStringTimer=window.setTimeout(function(){
var win=objj_msgSend(_36,"DOMWindow");
if(win){
win.document.write(_html||"<html><body></body></html>");
}
window.setTimeout(_loadCallback,1);
},0);
}
}
}
}),new objj_method(sel_getUid("_startedLoading"),function(_39,_3a){
with(_39){
_isLoading=YES;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWebViewProgressStartedNotification,_39);
if(objj_msgSend(_frameLoadDelegate,"respondsToSelector:",sel_getUid("webView:didStartProvisionalLoadForFrame:"))){
objj_msgSend(_frameLoadDelegate,"webView:didStartProvisionalLoadForFrame:",_39,nil);
}
}
}),new objj_method(sel_getUid("_finishedLoading"),function(_3b,_3c){
with(_3b){
_isLoading=NO;
objj_msgSend(_3b,"_resizeWebFrame");
objj_msgSend(_3b,"_attachScrollEventIfNecessary");
objj_msgSend(_3b,"_scheduleContentSizeCheck");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWebViewProgressFinishedNotification,_3b);
if(objj_msgSend(_frameLoadDelegate,"respondsToSelector:",sel_getUid("webView:didFinishLoadForFrame:"))){
objj_msgSend(_frameLoadDelegate,"webView:didFinishLoadForFrame:",_3b,nil);
}
}
}),new objj_method(sel_getUid("_scheduleContentSizeCheck"),function(_3d,_3e){
with(_3d){
objj_msgSend(_contentSizeCheckTimer,"invalidate");
if(_effectiveScrollMode==CPWebViewScrollAppKit){
_contentSizePollCount=0;
_contentSizeCheckTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",CPWebViewAppKitScrollPollInterval,_3d,sel_getUid("_maybePollWebFrameSize"),nil,YES);
}
}
}),new objj_method(sel_getUid("isLoading"),function(_3f,_40){
with(_3f){
return _isLoading;
}
}),new objj_method(sel_getUid("mainFrameURL"),function(_41,_42){
with(_41){
return _mainFrameURL;
}
}),new objj_method(sel_getUid("setMainFrameURL:"),function(_43,_44,_45){
with(_43){
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=_45;
objj_msgSend(_forwardStack,"removeAllObjects");
objj_msgSend(_43,"_loadMainFrameURL");
}
}),new objj_method(sel_getUid("goBack"),function(_46,_47){
with(_46){
if(_backwardStack.length>0){
if(_mainFrameURL){
objj_msgSend(_forwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=objj_msgSend(_backwardStack,"lastObject");
objj_msgSend(_backwardStack,"removeLastObject");
objj_msgSend(_46,"_loadMainFrameURL");
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("goForward"),function(_48,_49){
with(_48){
if(_forwardStack.length>0){
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=objj_msgSend(_forwardStack,"lastObject");
objj_msgSend(_forwardStack,"removeLastObject");
objj_msgSend(_48,"_loadMainFrameURL");
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("canGoBack"),function(_4a,_4b){
with(_4a){
return (_backwardStack.length>0);
}
}),new objj_method(sel_getUid("canGoForward"),function(_4c,_4d){
with(_4c){
return (_forwardStack.length>0);
}
}),new objj_method(sel_getUid("backForwardList"),function(_4e,_4f){
with(_4e){
return {back:_backwardStack,forward:_forwardStack};
}
}),new objj_method(sel_getUid("close"),function(_50,_51){
with(_50){
_iframe.parentNode.removeChild(_iframe);
}
}),new objj_method(sel_getUid("DOMWindow"),function(_52,_53){
with(_52){
return (_iframe.contentDocument&&_iframe.contentDocument.defaultView)||_iframe.contentWindow;
}
}),new objj_method(sel_getUid("windowScriptObject"),function(_54,_55){
with(_54){
var win=objj_msgSend(_54,"DOMWindow");
if(!_wso||win!=objj_msgSend(_wso,"window")){
if(win){
_wso=objj_msgSend(objj_msgSend(CPWebScriptObject,"alloc"),"initWithWindow:",win);
}else{
_wso=nil;
}
}
return _wso;
}
}),new objj_method(sel_getUid("stringByEvaluatingJavaScriptFromString:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(_56,"objectByEvaluatingJavaScriptFromString:",_58);
return _59?String(_59):nil;
}
}),new objj_method(sel_getUid("objectByEvaluatingJavaScriptFromString:"),function(_5a,_5b,_5c){
with(_5a){
return objj_msgSend(objj_msgSend(_5a,"windowScriptObject"),"evaluateWebScript:",_5c);
}
}),new objj_method(sel_getUid("computedStyleForElement:pseudoElement:"),function(_5d,_5e,_5f,_60){
with(_5d){
var win=objj_msgSend(objj_msgSend(_5d,"windowScriptObject"),"window");
if(win){
return win.document.defaultView.getComputedStyle(_5f,_60);
}
return nil;
}
}),new objj_method(sel_getUid("drawsBackground"),function(_61,_62){
with(_61){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_63,_64,_65){
with(_63){
if(_65==_drawsBackground){
return;
}
_drawsBackground=_65;
objj_msgSend(_63,"_applyBackgroundColor");
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_66,_67,_68){
with(_66){
objj_msgSendSuper({receiver:_66,super_class:objj_getClass("CPWebView").super_class},"setBackgroundColor:",_68);
objj_msgSend(_66,"_applyBackgroundColor");
}
}),new objj_method(sel_getUid("_applyBackgroundColor"),function(_69,_6a){
with(_69){
if(_iframe){
var _6b=objj_msgSend(_69,"backgroundColor")||objj_msgSend(CPColor,"whiteColor");
_iframe.allowtransparency=!_drawsBackground;
_iframe.style.backgroundColor=_drawsBackground?objj_msgSend(_6b,"cssString"):"transparent";
}
}
}),new objj_method(sel_getUid("takeStringURLFrom:"),function(_6c,_6d,_6e){
with(_6c){
objj_msgSend(_6c,"setMainFrameURL:",objj_msgSend(_6e,"stringValue"));
}
}),new objj_method(sel_getUid("goBack:"),function(_6f,_70,_71){
with(_6f){
objj_msgSend(_6f,"goBack");
}
}),new objj_method(sel_getUid("goForward:"),function(_72,_73,_74){
with(_72){
objj_msgSend(_72,"goForward");
}
}),new objj_method(sel_getUid("stopLoading:"),function(_75,_76,_77){
with(_75){
}
}),new objj_method(sel_getUid("reload:"),function(_78,_79,_7a){
with(_78){
if(!_url&&(_html!==nil)){
objj_msgSend(_78,"loadHTMLString:",_html);
}else{
objj_msgSend(_78,"_loadMainFrameURL");
}
}
}),new objj_method(sel_getUid("print:"),function(_7b,_7c,_7d){
with(_7b){
try{
objj_msgSend(_7b,"DOMWindow").print();
}
catch(e){
alert("Please click the webpage and select \"Print\" from the \"File\" menu");
}
}
}),new objj_method(sel_getUid("downloadDelegate"),function(_7e,_7f){
with(_7e){
return _downloadDelegate;
}
}),new objj_method(sel_getUid("setDownloadDelegate:"),function(_80,_81,_82){
with(_80){
_downloadDelegate=_82;
}
}),new objj_method(sel_getUid("frameLoadDelegate"),function(_83,_84){
with(_83){
return _frameLoadDelegate;
}
}),new objj_method(sel_getUid("setFrameLoadDelegate:"),function(_85,_86,_87){
with(_85){
_frameLoadDelegate=_87;
}
}),new objj_method(sel_getUid("policyDelegate"),function(_88,_89){
with(_88){
return _policyDelegate;
}
}),new objj_method(sel_getUid("setPolicyDelegate:"),function(_8a,_8b,_8c){
with(_8a){
_policyDelegate=_8c;
}
}),new objj_method(sel_getUid("resourceLoadDelegate"),function(_8d,_8e){
with(_8d){
return _resourceLoadDelegate;
}
}),new objj_method(sel_getUid("setResourceLoadDelegate:"),function(_8f,_90,_91){
with(_8f){
_resourceLoadDelegate=_91;
}
}),new objj_method(sel_getUid("UIDelegate"),function(_92,_93){
with(_92){
return _UIDelegate;
}
}),new objj_method(sel_getUid("setUIDelegate:"),function(_94,_95,_96){
with(_94){
_UIDelegate=_96;
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPWebScriptObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_window")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithWindow:"),function(_97,_98,_99){
with(_97){
if(_97=objj_msgSendSuper({receiver:_97,super_class:objj_getClass("CPWebScriptObject").super_class},"init")){
_window=_99;
}
return _97;
}
}),new objj_method(sel_getUid("callWebScriptMethod:withArguments:"),function(_9a,_9b,_9c,_9d){
with(_9a){
if(typeof _window[_9c]=="function"){
try{
return _window[_9c].apply(_9d);
}
catch(e){
}
}
return undefined;
}
}),new objj_method(sel_getUid("evaluateWebScript:"),function(_9e,_9f,_a0){
with(_9e){
try{
return _window.eval(_a0);
}
catch(e){
}
return undefined;
}
}),new objj_method(sel_getUid("window"),function(_a1,_a2){
with(_a1){
return _window;
}
})]);
var _1=objj_getClass("CPWebView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPWebView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a3,_a4,_a5){
with(_a3){
_a3=objj_msgSendSuper({receiver:_a3,super_class:objj_getClass("CPWebView").super_class},"initWithCoder:",_a5);
if(_a3){
_mainFrameURL=nil;
_backwardStack=[];
_forwardStack=[];
_scrollMode=CPWebViewScrollAuto;
objj_msgSend(_a3,"_initDOMWithFrame:",objj_msgSend(_a3,"frame"));
if(!objj_msgSend(_a3,"backgroundColor")){
objj_msgSend(_a3,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
}
objj_msgSend(_a3,"_updateEffectiveScrollMode");
}
return _a3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a6,_a7,_a8){
with(_a6){
var _a9=_subviews;
_subviews=[];
objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("CPWebView").super_class},"encodeWithCoder:",_a8);
_subviews=_a9;
}
})]);
var _1=objj_getClass("CPURL");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPURL\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("_passesSameOriginPolicy"),function(_aa,_ab){
with(_aa){
var _ac=objj_msgSend(CPURL,"URLWithString:",window.location.href);
if(objj_msgSend(_ac,"isFileURL")&&CPFeatureIsCompatible(CPSOPDisabledFromFileURLs)){
return YES;
}
return (objj_msgSend(_ac,"scheme")==objj_msgSend(_aa,"scheme")&&objj_msgSend(_ac,"host")==objj_msgSend(_aa,"host")&&objj_msgSend(_ac,"port")==objj_msgSend(_aa,"port"));
}
})]);
