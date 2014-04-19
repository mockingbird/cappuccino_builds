@STATIC;1.0;i;8;CPView.ji;14;CPScrollView.jt;25568;objj_executeFile("CPView.j", YES);objj_executeFile("CPScrollView.j", YES);CPWebViewProgressStartedNotification = "CPWebViewProgressStartedNotification";
CPWebViewProgressFinishedNotification = "CPWebViewProgressFinishedNotification";
CPWebViewScrollAuto = 0;
CPWebViewScrollAppKit = 1;
CPWebViewScrollNative = 2;
CPWebViewScrollNone = 3;
CPWebViewAppKitScrollPollInterval = 1.0;
CPWebViewAppKitScrollMaxPollCount = 3;
{var the_class = objj_allocateClassPair(CPView, "CPWebView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_scrollView"), new objj_ivar("_frameView"), new objj_ivar("_iframe"), new objj_ivar("_mainFrameURL"), new objj_ivar("_backwardStack"), new objj_ivar("_forwardStack"), new objj_ivar("_ignoreLoadStart"), new objj_ivar("_ignoreLoadEnd"), new objj_ivar("_isLoading"), new objj_ivar("_downloadDelegate"), new objj_ivar("_frameLoadDelegate"), new objj_ivar("_policyDelegate"), new objj_ivar("_resourceLoadDelegate"), new objj_ivar("_UIDelegate"), new objj_ivar("_wso"), new objj_ivar("_url"), new objj_ivar("_html"), new objj_ivar("_loadCallback"), new objj_ivar("_scrollMode"), new objj_ivar("_effectiveScrollMode"), new objj_ivar("_contentIsAccessible"), new objj_ivar("_contentSizeCheckTimer"), new objj_ivar("_contentSizePollCount"), new objj_ivar("_loadHTMLStringTimer"), new objj_ivar("_drawsBackground")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:frameName:groupName:"), function $CPWebView__initWithFrame_frameName_groupName_(self, _cmd, frameRect, frameName, groupName)
{
    if (self = objj_msgSend(self, "initWithFrame:", frameRect))
    {
        self._iframe.name = frameName;
    }
    return self;
}
,["id","CGRect","CPString","CPString"]), new objj_method(sel_getUid("initWithFrame:"), function $CPWebView__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWebView").super_class }, "initWithFrame:", aFrame))
    {
        self._mainFrameURL = nil;
        self._backwardStack = [];
        self._forwardStack = [];
        self._scrollMode = CPWebViewScrollAuto;
        self._contentIsAccessible = YES;
        self._isLoading = NO;
        self._drawsBackground = YES;
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(self, "_initDOMWithFrame:", aFrame);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_initDOMWithFrame:"), function $CPWebView___initDOMWithFrame_(self, _cmd, aFrame)
{
    self._ignoreLoadStart = YES;
    self._ignoreLoadEnd = YES;
    self._iframe = document.createElement("iframe");
    self._iframe.name = "iframe_" + FLOOR(RAND() * 10000);
    self._iframe.style.width = "100%";
    self._iframe.style.height = "100%";
    self._iframe.style.borderWidth = "0px";
    self._iframe.frameBorder = "0";
    objj_msgSend(self, "_applyBackgroundColor");
    self._loadCallback = function()
    {
        if (!self._ignoreLoadStart)
        {
            objj_msgSend(self, "_startedLoading");
            if (self._mainFrameURL)
                objj_msgSend(self._backwardStack, "addObject:", self._mainFrameURL);
            self._mainFrameURL = self._iframe.src;
            objj_msgSend(self._forwardStack, "removeAllObjects");
        }
        else
            self._ignoreLoadStart = NO;
        if (!self._ignoreLoadEnd)
        {
            objj_msgSend(self, "_finishedLoading");
        }
        else
            self._ignoreLoadEnd = NO;
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    };
    if (self._iframe.addEventListener)
        self._iframe.addEventListener("load", self._loadCallback, false);
    else if (self._iframe.attachEvent)
        self._iframe.attachEvent("onload", self._loadCallback);
    self._frameView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
    objj_msgSend(self._frameView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    self._scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
    objj_msgSend(self._scrollView, "setAutohidesScrollers:", YES);
    objj_msgSend(self._scrollView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(self._scrollView, "setDocumentView:", self._frameView);
    self._frameView._DOMElement.appendChild(self._iframe);
    objj_msgSend(self, "_updateEffectiveScrollMode");
    objj_msgSend(self, "addSubview:", self._scrollView);
}
,["id","CGRect"]), new objj_method(sel_getUid("setFrameSize:"), function $CPWebView__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWebView").super_class }, "setFrameSize:", aSize);
    objj_msgSend(self, "_resizeWebFrame");
}
,["void","CGSize"]), new objj_method(sel_getUid("viewDidUnhide"), function $CPWebView__viewDidUnhide(self, _cmd)
{
    objj_msgSend(self._frameView, "setFrameSize:", objj_msgSend(self._scrollView, "contentSize"));
    objj_msgSend(self, "_resizeWebFrame");
    objj_msgSend(self, "_scheduleContentSizeCheck");
}
,["void"]), new objj_method(sel_getUid("_attachScrollEventIfNecessary"), function $CPWebView___attachScrollEventIfNecessary(self, _cmd)
{
    if (self._effectiveScrollMode !== CPWebViewScrollAppKit)
        return;
    var win = objj_msgSend(self, "DOMWindow");
    if (win && win.addEventListener)
    {
        var scrollEventHandler = function(anEvent)
        {
            var frameBounds = objj_msgSend(self, "bounds"),
                frameCenter = CGPointMake(CGRectGetMidX(frameBounds), CGRectGetMidY(frameBounds)),
                windowOrigin = objj_msgSend(self, "convertPoint:toView:", frameCenter, nil),
                globalOrigin = objj_msgSend(objj_msgSend(self, "window"), "convertBaseToBridge:", windowOrigin);
            anEvent._overrideLocation = globalOrigin;
            objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "scrollEvent:", anEvent);
        };
        win.addEventListener("DOMMouseScroll", scrollEventHandler, false);
        win.addEventListener("wheel", scrollEventHandler, false);
    }
}
,["void"]), new objj_method(sel_getUid("_resizeWebFrame"), function $CPWebView___resizeWebFrame(self, _cmd)
{
    if (!objj_msgSend(self, "_isVisible"))
    {
        return;
    }
    if (self._effectiveScrollMode === CPWebViewScrollAppKit)
    {
        var visibleRect = objj_msgSend(self._frameView, "visibleRect");
        objj_msgSend(self._frameView, "setFrameSize:", CGSizeMake(CGRectGetMaxX(visibleRect), CGRectGetMaxY(visibleRect)));
        var win = objj_msgSend(self, "DOMWindow");
        if (win && win.document && win.document.body)
        {
            var width = win.document.body.scrollWidth,
                height = win.document.body.scrollHeight;
            self._iframe.setAttribute("width", width);
            self._iframe.setAttribute("height", height);
            objj_msgSend(self._frameView, "setFrameSize:", CGSizeMake(width, height));
        }
        else
        {
            if (!win || !win.document)
            {
                CPLog.warn("using default size 800*1600");
                objj_msgSend(self._frameView, "setFrameSize:", CGSizeMake(800, 1600));
            }
        }
        objj_msgSend(self._frameView, "scrollRectToVisible:", visibleRect);
    }
}
,["void"]), new objj_method(sel_getUid("setScrollMode:"), function $CPWebView__setScrollMode_(self, _cmd, aScrollMode)
{
    if (self._scrollMode == aScrollMode)
        return;
    self._scrollMode = aScrollMode;
    objj_msgSend(self, "_updateEffectiveScrollMode");
}
,["void","int"]), new objj_method(sel_getUid("effectiveScrollMode"), function $CPWebView__effectiveScrollMode(self, _cmd)
{
    return self._effectiveScrollMode;
}
,["int"]), new objj_method(sel_getUid("_updateEffectiveScrollMode"), function $CPWebView___updateEffectiveScrollMode(self, _cmd)
{
    var _newScrollMode = CPWebViewScrollAppKit;
    if (self._scrollMode == CPWebViewScrollNative || self._scrollMode == CPWebViewScrollAuto && !self._contentIsAccessible || CPBrowserIsEngine(CPInternetExplorerBrowserEngine))
    {
        _newScrollMode = CPWebViewScrollNative;
    }
    else if (self._scrollMode == CPWebViewScrollAppKit && !self._contentIsAccessible)
    {
        CPLog.warn(self + " unable to use CPWebViewScrollAppKit scroll mode due to same origin policy.");
        _newScrollMode = CPWebViewScrollNative;
    }
    if (_newScrollMode !== self._effectiveScrollMode)
        objj_msgSend(self, "_setEffectiveScrollMode:", _newScrollMode);
}
,["void"]), new objj_method(sel_getUid("_setEffectiveScrollMode:"), function $CPWebView___setEffectiveScrollMode_(self, _cmd, aScrollMode)
{
    self._effectiveScrollMode = aScrollMode;
    self._ignoreLoadStart = YES;
    self._ignoreLoadEnd = YES;
    var parent = self._iframe.parentNode;
    parent.removeChild(self._iframe);
    if (self._effectiveScrollMode === CPWebViewScrollAppKit)
    {
        objj_msgSend(self._scrollView, "setHasHorizontalScroller:", YES);
        objj_msgSend(self._scrollView, "setHasVerticalScroller:", YES);
        self._iframe.setAttribute("scrolling", "no");
    }
    else if (self._effectiveScrollMode === CPWebViewScrollNone)
    {
        objj_msgSend(self._scrollView, "setHasHorizontalScroller:", NO);
        objj_msgSend(self._scrollView, "setHasVerticalScroller:", NO);
        self._iframe.setAttribute("scrolling", "no");
    }
    else
    {
        objj_msgSend(self._scrollView, "setHasHorizontalScroller:", NO);
        objj_msgSend(self._scrollView, "setHasVerticalScroller:", NO);
        self._iframe.setAttribute("scrolling", "auto");
        objj_msgSend(self._frameView, "setFrameSize:", objj_msgSend(self._scrollView, "bounds").size);
    }
    parent.appendChild(self._iframe);
    objj_msgSend(self, "_applyBackgroundColor");
    objj_msgSend(self, "_resizeWebFrame");
}
,["void","int"]), new objj_method(sel_getUid("_maybePollWebFrameSize"), function $CPWebView___maybePollWebFrameSize(self, _cmd)
{
    if (CPWebViewAppKitScrollMaxPollCount == 0 || self._contentSizePollCount++ < CPWebViewAppKitScrollMaxPollCount)
        objj_msgSend(self, "_resizeWebFrame");
    else
        objj_msgSend(self._contentSizeCheckTimer, "invalidate");
}
,["void"]), new objj_method(sel_getUid("loadHTMLString:"), function $CPWebView__loadHTMLString_(self, _cmd, aString)
{
    objj_msgSend(self, "loadHTMLString:baseURL:", aString, nil);
}
,["void","CPString"]), new objj_method(sel_getUid("loadHTMLString:baseURL:"), function $CPWebView__loadHTMLString_baseURL_(self, _cmd, aString, URL)
{
    objj_msgSend(self._frameView, "setFrameSize:", objj_msgSend(self._scrollView, "contentSize"));
    objj_msgSend(self, "_startedLoading");
    self._ignoreLoadStart = YES;
    self._url = nil;
    self._html = aString;
    objj_msgSend(self, "_load");
}
,["void","CPString","CPURL"]), new objj_method(sel_getUid("_loadMainFrameURL"), function $CPWebView___loadMainFrameURL(self, _cmd)
{
    objj_msgSend(self, "_startedLoading");
    self._ignoreLoadStart = YES;
    self._url = self._mainFrameURL;
    self._html = nil;
    objj_msgSend(self, "_load");
}
,["void"]), new objj_method(sel_getUid("_load"), function $CPWebView___load(self, _cmd)
{
    if (self._url)
    {
        var cpurl = objj_msgSend(CPURL, "URLWithString:", self._url);
        self._contentIsAccessible = objj_msgSend(cpurl, "_passesSameOriginPolicy");
        objj_msgSend(self, "_updateEffectiveScrollMode");
        self._ignoreLoadEnd = NO;
        self._iframe.src = self._url;
    }
    else if (self._html !== nil)
    {
        self._iframe.src = "";
        self._contentIsAccessible = YES;
        objj_msgSend(self, "_updateEffectiveScrollMode");
        self._ignoreLoadEnd = NO;
        if (self._loadHTMLStringTimer !== nil)
        {
            window.clearTimeout(self._loadHTMLStringTimer);
            self._loadHTMLStringTimer = nil;
        }
        self._loadHTMLStringTimer = window.setTimeout(function()
        {
            var win = objj_msgSend(self, "DOMWindow");
            if (win)
                win.document.write(self._html || "<html><body></body></html>");
            window.setTimeout(self._loadCallback, 1);
        }, 0);
    }
}
,["void"]), new objj_method(sel_getUid("_startedLoading"), function $CPWebView___startedLoading(self, _cmd)
{
    self._isLoading = YES;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWebViewProgressStartedNotification, self);
    if (objj_msgSend(self._frameLoadDelegate, "respondsToSelector:", sel_getUid("webView:didStartProvisionalLoadForFrame:")))
        objj_msgSend(self._frameLoadDelegate, "webView:didStartProvisionalLoadForFrame:", self, nil);
}
,["void"]), new objj_method(sel_getUid("_finishedLoading"), function $CPWebView___finishedLoading(self, _cmd)
{
    self._isLoading = NO;
    objj_msgSend(self, "_resizeWebFrame");
    objj_msgSend(self, "_attachScrollEventIfNecessary");
    objj_msgSend(self, "_scheduleContentSizeCheck");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWebViewProgressFinishedNotification, self);
    if (objj_msgSend(self._frameLoadDelegate, "respondsToSelector:", sel_getUid("webView:didFinishLoadForFrame:")))
        objj_msgSend(self._frameLoadDelegate, "webView:didFinishLoadForFrame:", self, nil);
}
,["void"]), new objj_method(sel_getUid("_scheduleContentSizeCheck"), function $CPWebView___scheduleContentSizeCheck(self, _cmd)
{
    objj_msgSend(self._contentSizeCheckTimer, "invalidate");
    if (self._effectiveScrollMode == CPWebViewScrollAppKit)
    {
        self._contentSizePollCount = 0;
        self._contentSizeCheckTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", CPWebViewAppKitScrollPollInterval, self, sel_getUid("_maybePollWebFrameSize"), nil, YES);
    }
}
,["void"]), new objj_method(sel_getUid("isLoading"), function $CPWebView__isLoading(self, _cmd)
{
    return self._isLoading;
}
,["BOOL"]), new objj_method(sel_getUid("mainFrameURL"), function $CPWebView__mainFrameURL(self, _cmd)
{
    return self._mainFrameURL;
}
,["CPString"]), new objj_method(sel_getUid("setMainFrameURL:"), function $CPWebView__setMainFrameURL_(self, _cmd, URLString)
{
    if (self._mainFrameURL)
        objj_msgSend(self._backwardStack, "addObject:", self._mainFrameURL);
    self._mainFrameURL = URLString;
    objj_msgSend(self._forwardStack, "removeAllObjects");
    objj_msgSend(self, "_loadMainFrameURL");
}
,["void","CPString"]), new objj_method(sel_getUid("goBack"), function $CPWebView__goBack(self, _cmd)
{
    if (self._backwardStack.length > 0)
    {
        if (self._mainFrameURL)
            objj_msgSend(self._forwardStack, "addObject:", self._mainFrameURL);
        self._mainFrameURL = objj_msgSend(self._backwardStack, "lastObject");
        objj_msgSend(self._backwardStack, "removeLastObject");
        objj_msgSend(self, "_loadMainFrameURL");
        return YES;
    }
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("goForward"), function $CPWebView__goForward(self, _cmd)
{
    if (self._forwardStack.length > 0)
    {
        if (self._mainFrameURL)
            objj_msgSend(self._backwardStack, "addObject:", self._mainFrameURL);
        self._mainFrameURL = objj_msgSend(self._forwardStack, "lastObject");
        objj_msgSend(self._forwardStack, "removeLastObject");
        objj_msgSend(self, "_loadMainFrameURL");
        return YES;
    }
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("canGoBack"), function $CPWebView__canGoBack(self, _cmd)
{
    return self._backwardStack.length > 0;
}
,["BOOL"]), new objj_method(sel_getUid("canGoForward"), function $CPWebView__canGoForward(self, _cmd)
{
    return self._forwardStack.length > 0;
}
,["BOOL"]), new objj_method(sel_getUid("backForwardList"), function $CPWebView__backForwardList(self, _cmd)
{
    return {back: self._backwardStack, forward: self._forwardStack};
}
,["WebBackForwardList"]), new objj_method(sel_getUid("close"), function $CPWebView__close(self, _cmd)
{
    self._iframe.parentNode.removeChild(self._iframe);
}
,["void"]), new objj_method(sel_getUid("DOMWindow"), function $CPWebView__DOMWindow(self, _cmd)
{
    try    {
        return self._iframe.contentDocument && self._iframe.contentDocument.defaultView || self._iframe.contentWindow;
    }
    catch(e)     {
        return nil;
    }}
,["DOMWindow"]), new objj_method(sel_getUid("windowScriptObject"), function $CPWebView__windowScriptObject(self, _cmd)
{
    var win = objj_msgSend(self, "DOMWindow");
    if (!self._wso || win != objj_msgSend(self._wso, "window"))
    {
        if (win)
            self._wso = objj_msgSend(objj_msgSend(CPWebScriptObject, "alloc"), "initWithWindow:", win);
        else
            self._wso = nil;
    }
    return self._wso;
}
,["CPWebScriptObject"]), new objj_method(sel_getUid("stringByEvaluatingJavaScriptFromString:"), function $CPWebView__stringByEvaluatingJavaScriptFromString_(self, _cmd, script)
{
    var result = objj_msgSend(self, "objectByEvaluatingJavaScriptFromString:", script);
    return result ? String(result) : nil;
}
,["CPString","CPString"]), new objj_method(sel_getUid("objectByEvaluatingJavaScriptFromString:"), function $CPWebView__objectByEvaluatingJavaScriptFromString_(self, _cmd, script)
{
    return objj_msgSend(objj_msgSend(self, "windowScriptObject"), "evaluateWebScript:", script);
}
,["JSObject","CPString"]), new objj_method(sel_getUid("computedStyleForElement:pseudoElement:"), function $CPWebView__computedStyleForElement_pseudoElement_(self, _cmd, element, pseudoElement)
{
    var win = objj_msgSend(objj_msgSend(self, "windowScriptObject"), "window");
    if (win)
    {
        return win.document.defaultView.getComputedStyle(element, pseudoElement);
    }
    return nil;
}
,["DOMCSSStyleDeclaration","DOMElement","CPString"]), new objj_method(sel_getUid("drawsBackground"), function $CPWebView__drawsBackground(self, _cmd)
{
    return self._drawsBackground;
}
,["BOOL"]), new objj_method(sel_getUid("setDrawsBackground:"), function $CPWebView__setDrawsBackground_(self, _cmd, drawsBackground)
{
    if (drawsBackground == self._drawsBackground)
        return;
    self._drawsBackground = drawsBackground;
    objj_msgSend(self, "_applyBackgroundColor");
}
,["void","BOOL"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPWebView__setBackgroundColor_(self, _cmd, aColor)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWebView").super_class }, "setBackgroundColor:", aColor);
    objj_msgSend(self, "_applyBackgroundColor");
}
,["void","CPColor"]), new objj_method(sel_getUid("_applyBackgroundColor"), function $CPWebView___applyBackgroundColor(self, _cmd)
{
    if (self._iframe)
    {
        var bgColor = objj_msgSend(self, "backgroundColor") || objj_msgSend(CPColor, "whiteColor");
        self._iframe.allowtransparency = !self._drawsBackground;
        self._iframe.style.backgroundColor = self._drawsBackground ? objj_msgSend(bgColor, "cssString") : "transparent";
    }
}
,["void"]), new objj_method(sel_getUid("takeStringURLFrom:"), function $CPWebView__takeStringURLFrom_(self, _cmd, sender)
{
    objj_msgSend(self, "setMainFrameURL:", objj_msgSend(sender, "stringValue"));
}
,["void","id"]), new objj_method(sel_getUid("goBack:"), function $CPWebView__goBack_(self, _cmd, sender)
{
    objj_msgSend(self, "goBack");
}
,["void","id"]), new objj_method(sel_getUid("goForward:"), function $CPWebView__goForward_(self, _cmd, sender)
{
    objj_msgSend(self, "goForward");
}
,["void","id"]), new objj_method(sel_getUid("stopLoading:"), function $CPWebView__stopLoading_(self, _cmd, sender)
{
}
,["void","id"]), new objj_method(sel_getUid("reload:"), function $CPWebView__reload_(self, _cmd, sender)
{
    if (!self._url && self._html !== nil)
        objj_msgSend(self, "loadHTMLString:", self._html);
    else
        objj_msgSend(self, "_loadMainFrameURL");
}
,["void","id"]), new objj_method(sel_getUid("print:"), function $CPWebView__print_(self, _cmd, sender)
{
    try    {
        objj_msgSend(self, "DOMWindow").print();
    }
    catch(e)     {
        alert('Please click the webpage and select "Print" from the "File" menu');
    }}
,["void","id"]), new objj_method(sel_getUid("downloadDelegate"), function $CPWebView__downloadDelegate(self, _cmd)
{
    return self._downloadDelegate;
}
,["id"]), new objj_method(sel_getUid("setDownloadDelegate:"), function $CPWebView__setDownloadDelegate_(self, _cmd, anObject)
{
    self._downloadDelegate = anObject;
}
,["void","id"]), new objj_method(sel_getUid("frameLoadDelegate"), function $CPWebView__frameLoadDelegate(self, _cmd)
{
    return self._frameLoadDelegate;
}
,["id"]), new objj_method(sel_getUid("setFrameLoadDelegate:"), function $CPWebView__setFrameLoadDelegate_(self, _cmd, anObject)
{
    self._frameLoadDelegate = anObject;
}
,["void","id"]), new objj_method(sel_getUid("policyDelegate"), function $CPWebView__policyDelegate(self, _cmd)
{
    return self._policyDelegate;
}
,["id"]), new objj_method(sel_getUid("setPolicyDelegate:"), function $CPWebView__setPolicyDelegate_(self, _cmd, anObject)
{
    self._policyDelegate = anObject;
}
,["void","id"]), new objj_method(sel_getUid("resourceLoadDelegate"), function $CPWebView__resourceLoadDelegate(self, _cmd)
{
    return self._resourceLoadDelegate;
}
,["id"]), new objj_method(sel_getUid("setResourceLoadDelegate:"), function $CPWebView__setResourceLoadDelegate_(self, _cmd, anObject)
{
    self._resourceLoadDelegate = anObject;
}
,["void","id"]), new objj_method(sel_getUid("UIDelegate"), function $CPWebView__UIDelegate(self, _cmd)
{
    return self._UIDelegate;
}
,["id"]), new objj_method(sel_getUid("setUIDelegate:"), function $CPWebView__setUIDelegate_(self, _cmd, anObject)
{
    self._UIDelegate = anObject;
}
,["void","id"])]);
}{var the_class = objj_allocateClassPair(CPObject, "CPWebScriptObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithWindow:"), function $CPWebScriptObject__initWithWindow_(self, _cmd, aWindow)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWebScriptObject").super_class }, "init"))
    {
        self._window = aWindow;
    }
    return self;
}
,["id","Window"]), new objj_method(sel_getUid("callWebScriptMethod:withArguments:"), function $CPWebScriptObject__callWebScriptMethod_withArguments_(self, _cmd, methodName, args)
{
    if (typeof self._window[methodName] == "function")
    {
        try        {
            return self._window[methodName].apply(self._window, args);
        }
        catch(e)         {
        }    }
    return undefined;
}
,["id","CPString","CPArray"]), new objj_method(sel_getUid("evaluateWebScript:"), function $CPWebScriptObject__evaluateWebScript_(self, _cmd, script)
{
    try    {
        return self._window.eval(script);
    }
    catch(e)     {
    }    return undefined;
}
,["id","CPString"]), new objj_method(sel_getUid("window"), function $CPWebScriptObject__window(self, _cmd)
{
    return self._window;
}
,["Window"])]);
}{
var the_class = objj_getClass("CPWebView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPWebView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPWebView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWebView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._mainFrameURL = nil;
        self._backwardStack = [];
        self._forwardStack = [];
        self._scrollMode = CPWebViewScrollAuto;
        objj_msgSend(self, "_initDOMWithFrame:", objj_msgSend(self, "frame"));
        if (!objj_msgSend(self, "backgroundColor"))
            objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(self, "_updateEffectiveScrollMode");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPWebView__encodeWithCoder_(self, _cmd, aCoder)
{
    var actualSubviews = self._subviews;
    self._subviews = [];
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWebView").super_class }, "encodeWithCoder:", aCoder);
    self._subviews = actualSubviews;
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPURL")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPURL\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_passesSameOriginPolicy"), function $CPURL___passesSameOriginPolicy(self, _cmd)
{
    var documentURL = objj_msgSend(CPURL, "URLWithString:", window.location.href);
    if (objj_msgSend(documentURL, "isFileURL") && CPFeatureIsCompatible(CPSOPDisabledFromFileURLs))
        return YES;
    if (!objj_msgSend(self, "scheme") && !objj_msgSend(self, "host") && !objj_msgSend(self, "port"))
        return YES;
    return objj_msgSend(documentURL, "scheme") == objj_msgSend(self, "scheme") && objj_msgSend(documentURL, "host") == objj_msgSend(self, "host") && objj_msgSend(documentURL, "port") == objj_msgSend(self, "port");
}
,["BOOL"])]);
}