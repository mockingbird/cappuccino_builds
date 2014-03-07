@STATIC;1.0;i;13;CPException.ji;10;CPObject.ji;11;CPRunLoop.jt;5281;objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRunLoop.j", YES);CPJSONPConnectionCallbacks = {};
CPJSONPCallbackReplacementString = "${JSONP_CALLBACK}";
{var the_class = objj_allocateClassPair(CPObject, "CPJSONPConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_request"), new objj_ivar("_delegate"), new objj_ivar("_callbackParameter"), new objj_ivar("_scriptTag")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRequest:callback:delegate:"), function $CPJSONPConnection__initWithRequest_callback_delegate_(self, _cmd, aRequest, aString, aDelegate)
{
    return objj_msgSend(self, "initWithRequest:callback:delegate:startImmediately:", aRequest, aString, aDelegate, NO);
}
,["id","CPURLRequest","CPString","id"]), new objj_method(sel_getUid("initWithRequest:callback:delegate:startImmediately:"), function $CPJSONPConnection__initWithRequest_callback_delegate_startImmediately_(self, _cmd, aRequest, aString, aDelegate, shouldStartImmediately)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPJSONPConnection").super_class }, "init");
    if (self)
    {
        self._request = aRequest;
        self._delegate = aDelegate;
        self._callbackParameter = aString;
        if (!self._callbackParameter && objj_msgSend(objj_msgSend(self._request, "URL"), "absoluteString").indexOf(CPJSONPCallbackReplacementString) < 0)
            objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "JSONP source specified without callback parameter or CPJSONPCallbackReplacementString in URL.");
        if (shouldStartImmediately)
            objj_msgSend(self, "start");
    }
    return self;
}
,["id","CPURLRequest","CPString","id","BOOL"]), new objj_method(sel_getUid("start"), function $CPJSONPConnection__start(self, _cmd)
{
    try    {
        CPJSONPConnectionCallbacks["callback" + objj_msgSend(self, "UID")] = function(data)
        {
            if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("connection:didReceiveData:")))
                objj_msgSend(self._delegate, "connection:didReceiveData:", self, data);
            if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("connectionDidFinishLoading:")))
                objj_msgSend(self._delegate, "connectionDidFinishLoading:", self);
            objj_msgSend(self, "removeScriptTag");
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        };
        var head = (document.getElementsByTagName("head")).item(0),
            source = objj_msgSend(objj_msgSend(self._request, "URL"), "absoluteString");
        if (self._callbackParameter)
        {
            source += source.indexOf('?') < 0 ? "?" : "&";
            source += self._callbackParameter + "=CPJSONPConnectionCallbacks.callback" + objj_msgSend(self, "UID");
        }
        else if (source.indexOf(CPJSONPCallbackReplacementString) >= 0)
        {
            source = objj_msgSend(source, "stringByReplacingOccurrencesOfString:withString:", CPJSONPCallbackReplacementString, "CPJSONPConnectionCallbacks.callback" + objj_msgSend(self, "UID"));
        }
        else
            return;
        self._scriptTag = document.createElement("script");
        self._scriptTag.setAttribute("type", "text/javascript");
        self._scriptTag.setAttribute("charset", "utf-8");
        self._scriptTag.setAttribute("src", source);
        head.appendChild(self._scriptTag);
    }
    catch(exception)     {
        if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("connection:didFailWithError:")))
            objj_msgSend(self._delegate, "connection:didFailWithError:", self, exception);
        objj_msgSend(self, "removeScriptTag");
    }}
,["void"]), new objj_method(sel_getUid("removeScriptTag"), function $CPJSONPConnection__removeScriptTag(self, _cmd)
{
    var head = (document.getElementsByTagName("head")).item(0);
    if (self._scriptTag && self._scriptTag.parentNode == head)
        head.removeChild(self._scriptTag);
    CPJSONPConnectionCallbacks["callback" + objj_msgSend(self, "UID")] = nil;
    delete CPJSONPConnectionCallbacks["callback" + objj_msgSend(self, "UID")];
}
,["void"]), new objj_method(sel_getUid("cancel"), function $CPJSONPConnection__cancel(self, _cmd)
{
    objj_msgSend(self, "removeScriptTag");
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sendRequest:callback:delegate:"), function $CPJSONPConnection__sendRequest_callback_delegate_(self, _cmd, aRequest, callbackParameter, aDelegate)
{
    return objj_msgSend(self, "connectionWithRequest:callback:delegate:", aRequest, callbackParameter, aDelegate);
}
,["CPJSONPConnection","CPURLRequest","CPString","id"]), new objj_method(sel_getUid("connectionWithRequest:callback:delegate:"), function $CPJSONPConnection__connectionWithRequest_callback_delegate_(self, _cmd, aRequest, callbackParameter, aDelegate)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithRequest:callback:delegate:startImmediately:", aRequest, callbackParameter, aDelegate, YES);
}
,["CPJSONPConnection","CPURLRequest","CPString","id"])]);
}