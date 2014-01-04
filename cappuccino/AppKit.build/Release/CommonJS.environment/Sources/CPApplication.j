@STATIC;1.0;I;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.ji;14;CPThemeBlend.ji;14;CPCibLoading.ji;12;CPPlatform.jt;29499;
objj_executeFile("Foundation/CPBundle.j",NO);
objj_executeFile("CPCompatibility.j",YES);
objj_executeFile("CPEvent.j",YES);
objj_executeFile("CPMenu.j",YES);
objj_executeFile("CPResponder.j",YES);
objj_executeFile("CPDocumentController.j",YES);
objj_executeFile("CPThemeBlend.j",YES);
objj_executeFile("CPCibLoading.j",YES);
objj_executeFile("CPPlatform.j",YES);
var _1="CPMainCibFile",_2="Main cib file base name",_3=0;
CPApp=nil;
CPApplicationWillFinishLaunchingNotification="CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification="CPApplicationDidFinishLaunchingNotification";
CPApplicationWillTerminateNotification="CPApplicationWillTerminateNotification";
CPApplicationWillBecomeActiveNotification="CPApplicationWillBecomeActiveNotification";
CPApplicationDidBecomeActiveNotification="CPApplicationDidBecomeActiveNotification";
CPApplicationWillResignActiveNotification="CPApplicationWillResignActiveNotification";
CPApplicationDidResignActiveNotification="CPApplicationDidResignActiveNotification";
CPTerminateNow=YES;
CPTerminateCancel=NO;
CPTerminateLater=-1;
CPRunStoppedResponse=-1000;
CPRunAbortedResponse=-1001;
CPRunContinuesResponse=-1002;
var _4=objj_allocateClassPair(CPResponder,"CPApplication"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_eventListeners"),new objj_ivar("_currentEvent"),new objj_ivar("_windows"),new objj_ivar("_keyWindow"),new objj_ivar("_mainWindow"),new objj_ivar("_previousKeyWindow"),new objj_ivar("_previousMainWindow"),new objj_ivar("_documentController"),new objj_ivar("_currentSession"),new objj_ivar("_delegate"),new objj_ivar("_finishedLaunching"),new objj_ivar("_isActive"),new objj_ivar("_namedArgs"),new objj_ivar("_args"),new objj_ivar("_fullArgsString"),new objj_ivar("_applicationIconImage"),new objj_ivar("_aboutPanel"),new objj_ivar("_themeBlend")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("themeBlend"),function(_6,_7){
with(_6){
return _themeBlend;
}
}),new objj_method(sel_getUid("setThemeBlend:"),function(_8,_9,_a){
with(_8){
_themeBlend=_a;
}
}),new objj_method(sel_getUid("init"),function(_b,_c){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPApplication").super_class},"init");
CPApp=_b;
if(_b){
_eventListeners=[];
_windows=[];
objj_msgSend(_windows,"addObject:",nil);
}
return _b;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_d,_e,_f){
with(_d){
if(_delegate==_f){
return;
}
var _10=objj_msgSend(CPNotificationCenter,"defaultCenter"),_11=[CPApplicationWillFinishLaunchingNotification,sel_getUid("applicationWillFinishLaunching:"),CPApplicationDidFinishLaunchingNotification,sel_getUid("applicationDidFinishLaunching:"),CPApplicationWillBecomeActiveNotification,sel_getUid("applicationWillBecomeActive:"),CPApplicationDidBecomeActiveNotification,sel_getUid("applicationDidBecomeActive:"),CPApplicationWillResignActiveNotification,sel_getUid("applicationWillResignActive:"),CPApplicationDidResignActiveNotification,sel_getUid("applicationDidResignActive:"),CPApplicationWillTerminateNotification,sel_getUid("applicationWillTerminate:")],_12=objj_msgSend(_11,"count");
if(_delegate){
var _13=0;
for(;_13<_12;_13+=2){
var _14=_11[_13],_15=_11[_13+1];
if(objj_msgSend(_delegate,"respondsToSelector:",_15)){
objj_msgSend(_10,"removeObserver:name:object:",_delegate,_14,_d);
}
}
}
_delegate=_f;
var _13=0;
for(;_13<_12;_13+=2){
var _14=_11[_13],_15=_11[_13+1];
if(objj_msgSend(_delegate,"respondsToSelector:",_15)){
objj_msgSend(_10,"addObserver:selector:name:object:",_delegate,_15,_14,_d);
}
}
}
}),new objj_method(sel_getUid("delegate"),function(_16,_17){
with(_16){
return _delegate;
}
}),new objj_method(sel_getUid("finishLaunching"),function(_18,_19){
with(_18){
objj_msgSend(objj_msgSend(CPCursor,"arrowCursor"),"set");
var _1a=objj_msgSend(CPBundle,"mainBundle"),_1b=objj_msgSend(_1a,"objectForInfoDictionaryKey:","CPApplicationDelegateClass");
if(_1b){
var _1c=objj_getClass(_1b);
if(_1c){
objj_msgSend(_18,"setDelegate:",objj_msgSend(objj_msgSend(_1c,"alloc"),"init"));
}
}
var _1d=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_1d,"postNotificationName:object:",CPApplicationWillFinishLaunchingNotification,_18);
var _1e=objj_msgSend(_1a,"objectForInfoDictionaryKey:","CPBundleDocumentTypes");
if(objj_msgSend(_1e,"count")>0){
_documentController=objj_msgSend(CPDocumentController,"sharedDocumentController");
}
var _1f=!!_documentController,_20=window.cpOpeningURLStrings&&window.cpOpeningURLStrings(),_21=0,_22=objj_msgSend(_20,"count");
for(;_21<_22;++_21){
_1f=!objj_msgSend(_18,"_openURL:",objj_msgSend(CPURL,"URLWithString:",_20[_21]))&&_1f;
}
if(_1f&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationShouldOpenUntitledFile:"))){
_1f=objj_msgSend(_delegate,"applicationShouldOpenUntitledFile:",_18);
}
if(_1f){
objj_msgSend(_documentController,"newDocument:",_18);
}
objj_msgSend(_documentController,"_updateRecentDocumentsMenu");
objj_msgSend(_1d,"postNotificationName:object:",CPApplicationDidFinishLaunchingNotification,_18);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
_finishedLaunching=YES;
}
}),new objj_method(sel_getUid("terminate:"),function(_23,_24,_25){
with(_23){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPApplicationWillTerminateNotification,_23);
if(!objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(objj_msgSend(CPDocumentController,"sharedDocumentController"),"closeAllDocumentsWithDelegate:didCloseAllSelector:contextInfo:",_23,sel_getUid("_documentController:didCloseAll:context:"),nil);
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_23,"keyWindow"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}
}),new objj_method(sel_getUid("setApplicationIconImage:"),function(_26,_27,_28){
with(_26){
_applicationIconImage=_28;
}
}),new objj_method(sel_getUid("applicationIconImage"),function(_29,_2a){
with(_29){
if(_applicationIconImage){
return _applicationIconImage;
}
var _2b=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPApplicationIcon");
if(_2b){
_applicationIconImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_2b);
}
return _applicationIconImage;
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanel:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_2c,"orderFrontStandardAboutPanelWithOptions:",nil);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanelWithOptions:"),function(_2f,_30,_31){
with(_2f){
if(!_aboutPanel){
var _32=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"infoDictionary"),_33=objj_msgSend(_31,"objectForKey:","ApplicationName")||objj_msgSend(_32,"objectForKey:","CPBundleName"),_34=objj_msgSend(_31,"objectForKey:","ApplicationIcon")||objj_msgSend(_2f,"applicationIconImage"),_35=objj_msgSend(_31,"objectForKey:","Version")||objj_msgSend(_32,"objectForKey:","CPBundleVersion"),_36=objj_msgSend(_31,"objectForKey:","ApplicationVersion")||objj_msgSend(_32,"objectForKey:","CPBundleShortVersionString"),_37=objj_msgSend(_31,"objectForKey:","Copyright")||objj_msgSend(_32,"objectForKey:","CPHumanReadableCopyright");
var _38=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindowController,"class")),"pathForResource:","AboutPanel.cib"),_39=objj_msgSend(CPWindowController,"alloc"),_39=objj_msgSend(_39,"initWithWindowCibPath:owner:",_38,_39),_3a=objj_msgSend(_39,"window"),_3b=objj_msgSend(_3a,"contentView"),_3c=objj_msgSend(_3b,"viewWithTag:",1),_3d=objj_msgSend(_3b,"viewWithTag:",2),_3e=objj_msgSend(_3b,"viewWithTag:",3),_3f=objj_msgSend(_3b,"viewWithTag:",4),_40=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_2f,"class")),"pathForResource:","standardApplicationIcon.png");
objj_msgSend(_3d,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",objj_msgSend(CPFont,"systemFontSize")+2));
objj_msgSend(_3d,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_3e,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_3f,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_3c,"setImage:",_34||objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",_40,CGSizeMake(256,256)));
objj_msgSend(_3d,"setStringValue:",_33||"");
if(_36&&_35){
objj_msgSend(_3e,"setStringValue:","Version "+_36+" ("+_35+")");
}else{
if(_36||_35){
objj_msgSend(_3e,"setStringValue:","Version "+(_36||_35));
}else{
objj_msgSend(_3e,"setStringValue:","");
}
}
objj_msgSend(_3f,"setStringValue:",_37||"");
objj_msgSend(_3a,"center");
_aboutPanel=_3a;
}
objj_msgSend(_aboutPanel,"orderFront:",_2f);
}
}),new objj_method(sel_getUid("_documentController:didCloseAll:context:"),function(_41,_42,_43,_44,_45){
with(_41){
if(_44){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationShouldTerminate:"))){
objj_msgSend(_41,"replyToApplicationShouldTerminate:",objj_msgSend(_delegate,"applicationShouldTerminate:",_41));
}else{
objj_msgSend(_41,"replyToApplicationShouldTerminate:",YES);
}
}
}
}),new objj_method(sel_getUid("replyToApplicationShouldTerminate:"),function(_46,_47,_48){
with(_46){
if(_48==CPTerminateNow){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPApplicationWillTerminateNotification,_46);
objj_msgSend(CPPlatform,"terminateApplication");
}
}
}),new objj_method(sel_getUid("activateIgnoringOtherApps:"),function(_49,_4a,_4b){
with(_49){
objj_msgSend(_49,"_willBecomeActive");
objj_msgSend(CPPlatform,"activateIgnoringOtherApps:",_4b);
_isActive=YES;
objj_msgSend(_49,"_willResignActive");
}
}),new objj_method(sel_getUid("deactivate"),function(_4c,_4d){
with(_4c){
objj_msgSend(_4c,"_willResignActive");
objj_msgSend(CPPlatform,"deactivate");
_isActive=NO;
objj_msgSend(_4c,"_didResignActive");
}
}),new objj_method(sel_getUid("isActive"),function(_4e,_4f){
with(_4e){
return _isActive;
}
}),new objj_method(sel_getUid("hideOtherApplications:"),function(_50,_51,_52){
with(_50){
objj_msgSend(CPPlatform,"hideOtherApplications:",_50);
}
}),new objj_method(sel_getUid("run"),function(_53,_54){
with(_53){
objj_msgSend(_53,"finishLaunching");
}
}),new objj_method(sel_getUid("runModalForWindow:"),function(_55,_56,_57){
with(_55){
objj_msgSend(_55,"runModalSession:",objj_msgSend(_55,"beginModalSessionForWindow:",_57));
}
}),new objj_method(sel_getUid("stopModalWithCode:"),function(_58,_59,_5a){
with(_58){
if(!_currentSession){
return;
}
_currentSession._state=_5a;
_currentSession=_currentSession._previous;
objj_msgSend(_58,"_removeRunModalLoop");
}
}),new objj_method(sel_getUid("_removeRunModalLoop"),function(_5b,_5c){
with(_5b){
var _5d=_eventListeners.length;
while(_5d--){
if(_eventListeners[_5d]._callback===_CPRunModalLoop){
_eventListeners.splice(_5d,1);
return;
}
}
}
}),new objj_method(sel_getUid("stopModal"),function(_5e,_5f){
with(_5e){
objj_msgSend(_5e,"stopModalWithCode:",CPRunStoppedResponse);
}
}),new objj_method(sel_getUid("abortModal"),function(_60,_61){
with(_60){
objj_msgSend(_60,"stopModalWithCode:",CPRunAbortedResponse);
}
}),new objj_method(sel_getUid("beginModalSessionForWindow:"),function(_62,_63,_64){
with(_62){
return _65(_64,0);
}
}),new objj_method(sel_getUid("runModalSession:"),function(_66,_67,_68){
with(_66){
_68._previous=_currentSession;
_currentSession=_68;
var _69=_68._window;
objj_msgSend(_69,"center");
objj_msgSend(_69,"makeKeyWindow");
objj_msgSend(_69,"orderFront:",_66);
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_CPRunModalLoop,CPAnyEventMask,nil,0,NO);
}
}),new objj_method(sel_getUid("modalWindow"),function(_6a,_6b){
with(_6a){
if(!_currentSession){
return nil;
}
return _currentSession._window;
}
}),new objj_method(sel_getUid("_handleKeyEquivalent:"),function(_6c,_6d,_6e){
with(_6c){
return objj_msgSend(objj_msgSend(_6c,"keyWindow"),"performKeyEquivalent:",_6e)||objj_msgSend(objj_msgSend(_6c,"mainMenu"),"performKeyEquivalent:",_6e);
}
}),new objj_method(sel_getUid("sendEvent:"),function(_6f,_70,_71){
with(_6f){
_currentEvent=_71;
_3=objj_msgSend(_71,"modifierFlags");
if(objj_msgSend(_71,"_couldBeKeyEquivalent")&&objj_msgSend(_6f,"_handleKeyEquivalent:",_71)){
return;
}
if(_eventListeners.length){
if(_eventListeners[_eventListeners.length-1]._mask&(1<<objj_msgSend(_71,"type"))){
_eventListeners.pop()._callback(_71);
}
return;
}
objj_msgSend(objj_msgSend(_71,"window"),"sendEvent:",_71);
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_72,_73,_74){
with(_72){
if(objj_msgSend(_delegate,"respondsToSelector:",_74)){
objj_msgSend(_delegate,"performSelector:",_74);
}else{
objj_msgSendSuper({receiver:_72,super_class:objj_getClass("CPApplication").super_class},"doCommandBySelector:",_74);
}
}
}),new objj_method(sel_getUid("keyWindow"),function(_75,_76){
with(_75){
return _keyWindow;
}
}),new objj_method(sel_getUid("mainWindow"),function(_77,_78){
with(_77){
return _mainWindow;
}
}),new objj_method(sel_getUid("windowWithWindowNumber:"),function(_79,_7a,_7b){
with(_79){
return _windows[_7b];
}
}),new objj_method(sel_getUid("windows"),function(_7c,_7d){
with(_7c){
return _windows;
}
}),new objj_method(sel_getUid("orderedWindows"),function(_7e,_7f){
with(_7e){
return [];
}
}),new objj_method(sel_getUid("hide:"),function(_80,_81,_82){
with(_80){
objj_msgSend(CPPlatform,"hide:",_80);
}
}),new objj_method(sel_getUid("mainMenu"),function(_83,_84){
with(_83){
return objj_msgSend(_83,"menu");
}
}),new objj_method(sel_getUid("setMainMenu:"),function(_85,_86,_87){
with(_85){
objj_msgSend(_85,"setMenu:",_87);
}
}),new objj_method(sel_getUid("setMenu:"),function(_88,_89,_8a){
with(_88){
if(objj_msgSend(_8a,"_menuName")==="CPMainMenu"){
if(objj_msgSend(_88,"menu")===_8a){
return;
}
objj_msgSendSuper({receiver:_88,super_class:objj_getClass("CPApplication").super_class},"setMenu:",_8a);
if(objj_msgSend(CPPlatform,"supportsNativeMainMenu")){
window.cpSetMainMenu(objj_msgSend(_88,"menu"));
}
}else{
objj_msgSend(_8a,"_setMenuName:","CPMainMenu");
}
}
}),new objj_method(sel_getUid("orderFrontColorPanel:"),function(_8b,_8c,_8d){
with(_8b){
objj_msgSend(objj_msgSend(CPColorPanel,"sharedColorPanel"),"orderFront:",_8b);
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_8e,_8f,_90,_91){
with(_8e){
if(!_90){
return NO;
}
if(objj_msgSendSuper({receiver:_8e,super_class:objj_getClass("CPApplication").super_class},"tryToPerform:with:",_90,_91)){
return YES;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_90)){
objj_msgSend(_delegate,"performSelector:withObject:",_90,_91);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendAction:to:from:"),function(_92,_93,_94,_95,_96){
with(_92){
var _97=objj_msgSend(_92,"targetForAction:to:from:",_94,_95,_96);
if(!_97){
return NO;
}
objj_msgSend(_97,"performSelector:withObject:",_94,_96);
return YES;
}
}),new objj_method(sel_getUid("targetForAction:to:from:"),function(_98,_99,_9a,_9b,_9c){
with(_98){
if(!_9a){
return nil;
}
if(_9b){
return _9b;
}
return objj_msgSend(_98,"targetForAction:",_9a);
}
}),new objj_method(sel_getUid("_targetForWindow:action:"),function(_9d,_9e,_9f,_a0){
with(_9d){
var _a1=objj_msgSend(_9f,"firstResponder"),_a2=YES;
while(_a1){
if(objj_msgSend(_a1,"respondsToSelector:",_a0)){
return _a1;
}
if(_a1==_9f){
_a2=NO;
}
_a1=objj_msgSend(_a1,"nextResponder");
}
if(_a2&&objj_msgSend(_9f,"respondsToSelector:",_a0)){
return _9f;
}
var _a3=objj_msgSend(_9f,"delegate");
if(objj_msgSend(_a3,"respondsToSelector:",_a0)){
return _a3;
}
var _a4=objj_msgSend(_9f,"windowController");
if(objj_msgSend(_a4,"respondsToSelector:",_a0)){
return _a4;
}
var _a5=objj_msgSend(_a4,"document");
if(_a5!==_a3&&objj_msgSend(_a5,"respondsToSelector:",_a0)){
return _a5;
}
return nil;
}
}),new objj_method(sel_getUid("targetForAction:"),function(_a6,_a7,_a8){
with(_a6){
if(!_a8){
return nil;
}
var _a9=objj_msgSend(_a6,"_targetForWindow:action:",objj_msgSend(_a6,"keyWindow"),_a8);
if(_a9){
return _a9;
}
_a9=objj_msgSend(_a6,"_targetForWindow:action:",objj_msgSend(_a6,"mainWindow"),_a8);
if(_a9){
return _a9;
}
if(objj_msgSend(_a6,"respondsToSelector:",_a8)){
return _a6;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_a8)){
return _delegate;
}
if(objj_msgSend(_documentController,"respondsToSelector:",_a8)){
return _documentController;
}
return nil;
}
}),new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_aa,_ab,_ac,_ad,_ae,_af,_b0){
with(_aa){
_eventListeners.push(_b1(_ad,_ac));
}
}),new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_b2,_b3,_b4,_b5,_b6,_b7,_b8,_b9){
with(_b2){
_eventListeners.push(_b1(_b6,function(_ba){
objj_msgSend(_b4,_b5,_ba);
}));
}
}),new objj_method(sel_getUid("currentEvent"),function(_bb,_bc){
with(_bb){
return _currentEvent;
}
}),new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"),function(_bd,_be,_bf,_c0,_c1,_c2,_c3){
with(_bd){
if(objj_msgSend(_c0,"isSheet")){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"The target window of beginSheet: cannot be a sheet");
return;
}
objj_msgSend(_bf._windowView,"_enableSheet:",YES);
if(!objj_msgSend(_c0,"isVisible")){
objj_msgSend(_c0,"orderFront:",_bd);
objj_msgSend(_bf,"setPlatformWindow:",objj_msgSend(_c0,"platformWindow"));
}
objj_msgSend(_c0,"_attachSheet:modalDelegate:didEndSelector:contextInfo:",_bf,_c1,_c2,_c3);
}
}),new objj_method(sel_getUid("endSheet:returnCode:"),function(_c4,_c5,_c6,_c7){
with(_c4){
var _c8=objj_msgSend(_windows,"count");
while(--_c8>=0){
var _c9=objj_msgSend(_windows,"objectAtIndex:",_c8),_ca=_c9._sheetContext;
if(_ca!=nil&&_ca["sheet"]===_c6){
_ca["returnCode"]=_c7;
objj_msgSend(_c9,"_endSheet");
return;
}
}
}
}),new objj_method(sel_getUid("endSheet:"),function(_cb,_cc,_cd){
with(_cb){
objj_msgSend(_cb,"endSheet:returnCode:",_cd,0);
}
}),new objj_method(sel_getUid("arguments"),function(_ce,_cf){
with(_ce){
if(_fullArgsString!==window.location.hash){
objj_msgSend(_ce,"_reloadArguments");
}
return _args;
}
}),new objj_method(sel_getUid("setArguments:"),function(_d0,_d1,_d2){
with(_d0){
if(!_d2||_d2.length==0){
_args=[];
window.location.hash="#";
return;
}
if(!objj_msgSend(_d2,"isKindOfClass:",CPArray)){
_d2=objj_msgSend(CPArray,"arrayWithObject:",_d2);
}
_args=_d2;
var _d3=objj_msgSend(_args,"copy");
for(var i=0,_d4=_d3.length;i<_d4;i++){
_d3[i]=encodeURIComponent(_d3[i]);
}
var _d5=objj_msgSend(_d3,"componentsJoinedByString:","/");
window.location.hash="#"+_d5;
}
}),new objj_method(sel_getUid("_reloadArguments"),function(_d6,_d7){
with(_d6){
_fullArgsString=window.location.hash;
if(_fullArgsString.length){
var _d8=_fullArgsString.substring(1).split("/");
for(var i=0,_d9=_d8.length;i<_d9;i++){
_d8[i]=decodeURIComponent(_d8[i]);
}
_args=_d8;
}else{
_args=[];
}
}
}),new objj_method(sel_getUid("namedArguments"),function(_da,_db){
with(_da){
return _namedArgs;
}
}),new objj_method(sel_getUid("_openURL:"),function(_dc,_dd,_de){
with(_dc){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("application:openFile:"))){
CPLog.warn("application:openFile: is deprecated, use application:openURL: instead.");
return objj_msgSend(_delegate,"application:openFile:",_dc,objj_msgSend(_de,"absoluteString"));
}
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("application:openURL:"))){
return objj_msgSend(_delegate,"application:openURL:",_dc,_de);
}
return !!objj_msgSend(_documentController,"openDocumentWithContentsOfURL:display:error:",_de,YES,NULL);
}
}),new objj_method(sel_getUid("_willBecomeActive"),function(_df,_e0){
with(_df){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPApplicationWillBecomeActiveNotification,_df,nil);
}
}),new objj_method(sel_getUid("_didBecomeActive"),function(_e1,_e2){
with(_e1){
if(!objj_msgSend(_e1,"keyWindow")&&_previousKeyWindow&&objj_msgSend(objj_msgSend(_e1,"windows"),"indexOfObjectIdenticalTo:",_previousKeyWindow)!==CPNotFound){
objj_msgSend(_previousKeyWindow,"makeKeyWindow");
}
if(!objj_msgSend(_e1,"mainWindow")&&_previousMainWindow&&objj_msgSend(objj_msgSend(_e1,"windows"),"indexOfObjectIdenticalTo:",_previousMainWindow)!==CPNotFound){
objj_msgSend(_previousMainWindow,"makeMainWindow");
}
if(objj_msgSend(_e1,"keyWindow")){
objj_msgSend(objj_msgSend(_e1,"keyWindow"),"orderFront:",_e1);
}else{
if(objj_msgSend(_e1,"mainWindow")){
objj_msgSend(objj_msgSend(_e1,"mainWindow"),"makeKeyAndOrderFront:",_e1);
}else{
objj_msgSend(objj_msgSend(_e1,"mainMenu")._menuWindow,"makeKeyWindow");
}
}
_previousKeyWindow=nil;
_previousMainWindow=nil;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPApplicationDidBecomeActiveNotification,_e1,nil);
}
}),new objj_method(sel_getUid("_willResignActive"),function(_e3,_e4){
with(_e3){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPApplicationWillResignActiveNotification,_e3,nil);
}
}),new objj_method(sel_getUid("_didResignActive"),function(_e5,_e6){
with(_e5){
if(_e5._activeMenu){
objj_msgSend(_e5._activeMenu,"cancelTracking");
}
if(objj_msgSend(_e5,"keyWindow")){
_previousKeyWindow=objj_msgSend(_e5,"keyWindow");
objj_msgSend(_previousKeyWindow,"resignKeyWindow");
}
if(objj_msgSend(_e5,"mainWindow")){
_previousMainWindow=objj_msgSend(_e5,"mainWindow");
objj_msgSend(_previousMainWindow,"resignMainWindow");
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPApplicationDidResignActiveNotification,_e5,nil);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("sharedApplication"),function(_e7,_e8){
with(_e7){
if(!CPApp){
CPApp=objj_msgSend(objj_msgSend(CPApplication,"alloc"),"init");
}
return CPApp;
}
}),new objj_method(sel_getUid("defaultThemeName"),function(_e9,_ea){
with(_e9){
return (objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPDefaultTheme")||"Aristo");
}
})]);
var _65=function(_eb,_ec){
return {_window:_eb,_state:CPRunContinuesResponse,_previous:nil};
};
var _b1=function(_ed,_ee){
return {_mask:_ed,_callback:_ee};
};
_CPRunModalLoop=function(_ef){
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_CPRunModalLoop,CPAnyEventMask,nil,0,NO);
var _f0=objj_msgSend(_ef,"window"),_f1=CPApp._currentSession;
if(_f0==_f1._window||objj_msgSend(_f0,"worksWhenModal")||objj_msgSend(_f0,"attachedSheet")==_f1._window||(objj_msgSend(_f0,"isKindOfClass:",_CPAttachedWindow)&&objj_msgSend(objj_msgSend(_f0,"targetView"),"window")===_f1._window)){
objj_msgSend(_f0,"sendEvent:",_ef);
}
};
CPApplicationMain=function(_f2,_f3){
var _f4=objj_msgSend(CPBundle,"mainBundle"),_f5=objj_msgSend(_f4,"principalClass");
if(!_f5){
_f5=objj_msgSend(CPApplication,"class");
}
objj_msgSend(_f5,"sharedApplication");
if(objj_msgSend(_f2,"containsObject:","debug")){
CPLogRegister(CPLogPopup);
}
CPApp._args=_f2;
CPApp._namedArgs=_f3;
objj_msgSend(_CPAppBootstrapper,"performActions");
};
var _f6=nil;
var _4=objj_allocateClassPair(CPObject,"_CPAppBootstrapper"),_5=_4.isa;
objj_registerClassPair(_4);
class_addMethods(_5,[new objj_method(sel_getUid("actions"),function(_f7,_f8){
with(_f7){
return [sel_getUid("bootstrapPlatform"),sel_getUid("loadDefaultTheme"),sel_getUid("loadMainCibFile")];
}
}),new objj_method(sel_getUid("performActions"),function(_f9,_fa){
with(_f9){
if(!_f6){
_f6=objj_msgSend(_f9,"actions");
}
while(_f6.length){
var _fb=_f6.shift();
if(objj_msgSend(_f9,_fb)){
return;
}
}
objj_msgSend(CPApp,"run");
}
}),new objj_method(sel_getUid("bootstrapPlatform"),function(_fc,_fd){
with(_fc){
return objj_msgSend(CPPlatform,"bootstrap");
}
}),new objj_method(sel_getUid("loadDefaultTheme"),function(_fe,_ff){
with(_fe){
var _100=objj_msgSend(CPApplication,"defaultThemeName"),_101=nil;
if(_100==="Aristo"){
_101=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),"pathForResource:",_100+".blend");
}else{
_101=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_100+".blend");
}
var _102=objj_msgSend(objj_msgSend(CPThemeBlend,"alloc"),"initWithContentsOfURL:",_101);
objj_msgSend(_102,"loadWithDelegate:",_fe);
return YES;
}
}),new objj_method(sel_getUid("blendDidFinishLoading:"),function(self,_103,_104){
with(self){
objj_msgSend(objj_msgSend(CPApplication,"sharedApplication"),"setThemeBlend:",_104);
objj_msgSend(CPTheme,"setDefaultTheme:",objj_msgSend(CPTheme,"themeNamed:",objj_msgSend(CPApplication,"defaultThemeName")));
objj_msgSend(self,"performActions");
}
}),new objj_method(sel_getUid("loadMainCibFile"),function(self,_105){
with(self){
var _106=objj_msgSend(CPBundle,"mainBundle"),_107=objj_msgSend(_106,"objectForInfoDictionaryKey:",_1)||objj_msgSend(_106,"objectForInfoDictionaryKey:",_2);
if(_107){
objj_msgSend(_106,"loadCibFile:externalNameTable:loadDelegate:",_107,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPApp,CPCibOwner),self);
return YES;
}else{
objj_msgSend(self,"loadCiblessBrowserMainMenu");
}
return NO;
}
}),new objj_method(sel_getUid("loadCiblessBrowserMainMenu"),function(self,_108){
with(self){
var _109=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","MainMenu");
objj_msgSend(_109,"setAutoenablesItems:",NO);
var _10a=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),_10b=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","New",sel_getUid("newDocument:"),"n");
objj_msgSend(_10b,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_10a,"pathForResource:","CPApplication/New.png"),CGSizeMake(16,16)));
objj_msgSend(_10b,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_10a,"pathForResource:","CPApplication/NewHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_109,"addItem:",_10b);
var _10c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Open",sel_getUid("openDocument:"),"o");
objj_msgSend(_10c,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_10a,"pathForResource:","CPApplication/Open.png"),CGSizeMake(16,16)));
objj_msgSend(_10c,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_10a,"pathForResource:","CPApplication/OpenHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_109,"addItem:",_10c);
var _10d=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Save"),_10e=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),nil);
objj_msgSend(_10e,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_10a,"pathForResource:","CPApplication/Save.png"),CGSizeMake(16,16)));
objj_msgSend(_10e,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_10a,"pathForResource:","CPApplication/SaveHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_10d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),"s"));
objj_msgSend(_10d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save As",sel_getUid("saveDocumentAs:"),nil));
objj_msgSend(_10e,"setSubmenu:",_10d);
objj_msgSend(_109,"addItem:",_10e);
var _10f=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit",nil,nil),_110=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Edit"),_111=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Undo",sel_getUid("undo:"),CPUndoKeyEquivalent),_112=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Redo",sel_getUid("redo:"),CPRedoKeyEquivalent);
objj_msgSend(_111,"setKeyEquivalentModifierMask:",CPUndoKeyEquivalentModifierMask);
objj_msgSend(_112,"setKeyEquivalentModifierMask:",CPRedoKeyEquivalentModifierMask);
objj_msgSend(_110,"addItem:",_111);
objj_msgSend(_110,"addItem:",_112);
objj_msgSend(_110,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Cut",sel_getUid("cut:"),"x"));
objj_msgSend(_110,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Copy",sel_getUid("copy:"),"c"));
objj_msgSend(_110,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Paste",sel_getUid("paste:"),"v"));
objj_msgSend(_10f,"setSubmenu:",_110);
objj_msgSend(_10f,"setHidden:",YES);
objj_msgSend(_109,"addItem:",_10f);
objj_msgSend(_109,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
objj_msgSend(CPApp,"setMainMenu:",_109);
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(self,_113,aCib){
with(self){
objj_msgSend(self,"performActions");
}
}),new objj_method(sel_getUid("cibDidFailToLoad:"),function(self,_114,aCib){
with(self){
throw new Error("Could not load main cib file (Did you forget to nib2cib it?).");
}
}),new objj_method(sel_getUid("reset"),function(self,_115){
with(self){
_f6=nil;
}
})]);
var _4=objj_getClass("CPEvent");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"CPEvent\"");
}
var _5=_4.isa;
class_addMethods(_5,[new objj_method(sel_getUid("modifierFlags"),function(self,_116){
with(self){
return _3;
}
})]);
