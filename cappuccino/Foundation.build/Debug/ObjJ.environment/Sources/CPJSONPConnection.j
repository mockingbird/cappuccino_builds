@STATIC;1.0;i;13;CPException.ji;10;CPObject.ji;11;CPRunLoop.jt;6290;objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRunLoop.j", YES);CPJSONPConnectionCallbacks = {};
CPJSONPCallbackReplacementString = "${JSONP_CALLBACK}";
{var the_class = objj_allocateClassPair(CPObject, "CPJSONPConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_request"), new objj_ivar("_delegate"), new objj_ivar("_callbackParameter"), new objj_ivar("_scriptTag")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRequest:callback:delegate:"), function $CPJSONPConnection__initWithRequest_callback_delegate_(self, _cmd, aRequest, aString, aDelegate)
{
    return self.isa.objj_msgSend(self, "initWithRequest:callback:delegate:startImmediately:", aRequest, aString, aDelegate, NO);
}
,["id","CPURLRequest","CPString","id"]), new objj_method(sel_getUid("initWithRequest:callback:delegate:startImmediately:"), function $CPJSONPConnection__initWithRequest_callback_delegate_startImmediately_(self, _cmd, aRequest, aString, aDelegate, shouldStartImmediately)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPJSONPConnection").super_class }, "init");
    if (self)
    {
        self._request = aRequest;
        self._delegate = aDelegate;
        self._callbackParameter = aString;
        if (!self._callbackParameter && ((___r1 = ((___r2 = self._request), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "URL"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "absoluteString")).indexOf(CPJSONPCallbackReplacementString) < 0)
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "JSONP source specified without callback parameter or CPJSONPCallbackReplacementString in URL.");
        if (shouldStartImmediately)
            (self == null ? null : self.isa.objj_msgSend0(self, "start"));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CPURLRequest","CPString","id","BOOL"]), new objj_method(sel_getUid("start"), function $CPJSONPConnection__start(self, _cmd)
{
    try    {
        CPJSONPConnectionCallbacks["callback" + self.isa.objj_msgSend0(self, "UID")] = function(data)
        {
            if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("connection:didReceiveData:"))))
                ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "connection:didReceiveData:", self, data));
            if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("connectionDidFinishLoading:"))))
                ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "connectionDidFinishLoading:", self));
            self.isa.objj_msgSend0(self, "removeScriptTag");
            ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
            var ___r1;
        };
        var head = (document.getElementsByTagName("head")).item(0),
            source = ((___r1 = ((___r2 = self._request), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "URL"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "absoluteString"));
        if (self._callbackParameter)
        {
            source += source.indexOf('?') < 0 ? "?" : "&";
            source += self._callbackParameter + "=CPJSONPConnectionCallbacks.callback" + self.isa.objj_msgSend0(self, "UID");
        }
        else if (source.indexOf(CPJSONPCallbackReplacementString) >= 0)
        {
            source = (source == null ? null : source.isa.objj_msgSend2(source, "stringByReplacingOccurrencesOfString:withString:", CPJSONPCallbackReplacementString, "CPJSONPConnectionCallbacks.callback" + self.isa.objj_msgSend0(self, "UID")));
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
        if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("connection:didFailWithError:"))))
            ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "connection:didFailWithError:", self, exception));
        self.isa.objj_msgSend0(self, "removeScriptTag");
        var ___r1;
    }    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("removeScriptTag"), function $CPJSONPConnection__removeScriptTag(self, _cmd)
{
    var head = (document.getElementsByTagName("head")).item(0);
    if (self._scriptTag && self._scriptTag.parentNode == head)
        head.removeChild(self._scriptTag);
    CPJSONPConnectionCallbacks["callback" + self.isa.objj_msgSend0(self, "UID")] = nil;
    delete CPJSONPConnectionCallbacks["callback" + self.isa.objj_msgSend0(self, "UID")];
}
,["void"]), new objj_method(sel_getUid("cancel"), function $CPJSONPConnection__cancel(self, _cmd)
{
    self.isa.objj_msgSend0(self, "removeScriptTag");
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sendRequest:callback:delegate:"), function $CPJSONPConnection__sendRequest_callback_delegate_(self, _cmd, aRequest, callbackParameter, aDelegate)
{
    return self.isa.objj_msgSend3(self, "connectionWithRequest:callback:delegate:", aRequest, callbackParameter, aDelegate);
}
,["CPJSONPConnection","CPURLRequest","CPString","id"]), new objj_method(sel_getUid("connectionWithRequest:callback:delegate:"), function $CPJSONPConnection__connectionWithRequest_callback_delegate_(self, _cmd, aRequest, callbackParameter, aDelegate)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithRequest:callback:delegate:startImmediately:", aRequest, callbackParameter, aDelegate, YES));
    var ___r1, ___r2;
}
,["CPJSONPConnection","CPURLRequest","CPString","id"])]);
}