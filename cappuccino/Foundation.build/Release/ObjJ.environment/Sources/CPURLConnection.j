@STATIC;1.0;i;8;CPData.ji;10;CPObject.ji;11;CPRunLoop.ji;14;CPURLRequest.ji;15;CPURLResponse.jt;7958;objj_executeFile("CPData.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRunLoop.j", YES);objj_executeFile("CPURLRequest.j", YES);objj_executeFile("CPURLResponse.j", YES);var CPURLConnectionDelegate = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPURLConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_request"), new objj_ivar("_delegate"), new objj_ivar("_isCanceled"), new objj_ivar("_isLocalFileConnection"), new objj_ivar("_HTTPRequest")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:"), function $CPURLConnection__initWithRequest_delegate_startImmediately_(self, _cmd, aRequest, aDelegate, shouldStartImmediately)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPURLConnection").super_class }, "init");
    if (self)
    {
        self._request = aRequest;
        self._delegate = aDelegate;
        self._isCanceled = NO;
        var URL = objj_msgSend(self._request, "URL"),
            scheme = objj_msgSend(URL, "scheme");
        self._isLocalFileConnection = scheme === "file" || (scheme === "http" || scheme === "https") && window.location && (window.location.protocol === "file:" || window.location.protocol === "app:");
        self._HTTPRequest = new CFHTTPRequest();
        if (shouldStartImmediately)
            objj_msgSend(self, "start");
    }
    return self;
}
,["id","CPURLRequest","id","BOOL"]), new objj_method(sel_getUid("initWithRequest:delegate:"), function $CPURLConnection__initWithRequest_delegate_(self, _cmd, aRequest, aDelegate)
{
    return objj_msgSend(self, "initWithRequest:delegate:startImmediately:", aRequest, aDelegate, YES);
}
,["id","CPURLRequest","id"]), new objj_method(sel_getUid("delegate"), function $CPURLConnection__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("start"), function $CPURLConnection__start(self, _cmd)
{
    self._isCanceled = NO;
    try    {
        self._HTTPRequest.open(objj_msgSend(self._request, "HTTPMethod"), objj_msgSend(objj_msgSend(self._request, "URL"), "absoluteString"), YES);
        self._HTTPRequest.onreadystatechange = function()
        {
            objj_msgSend(self, "_readyStateDidChange");
        };
        var fields = objj_msgSend(self._request, "allHTTPHeaderFields"),
            key = nil,
            keys = objj_msgSend(fields, "keyEnumerator");
        while ((key = objj_msgSend(keys, "nextObject")) !== nil)
            self._HTTPRequest.setRequestHeader(key, objj_msgSend(fields, "objectForKey:", key));
        self._HTTPRequest.send(objj_msgSend(self._request, "HTTPBody"));
    }
    catch(anException)     {
        if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("connection:didFailWithError:")))
            objj_msgSend(self._delegate, "connection:didFailWithError:", self, anException);
    }}
,["void"]), new objj_method(sel_getUid("cancel"), function $CPURLConnection__cancel(self, _cmd)
{
    self._isCanceled = YES;
    try    {
        self._HTTPRequest.abort();
    }
    catch(anException)     {
    }}
,["void"]), new objj_method(sel_getUid("isLocalFileConnection"), function $CPURLConnection__isLocalFileConnection(self, _cmd)
{
    return self._isLocalFileConnection;
}
,["BOOL"]), new objj_method(sel_getUid("_readyStateDidChange"), function $CPURLConnection___readyStateDidChange(self, _cmd)
{
    if (self._HTTPRequest.readyState() === CFHTTPRequest.CompleteState)
    {
        var statusCode = self._HTTPRequest.status(),
            URL = objj_msgSend(self._request, "URL");
        if (statusCode === 401 && objj_msgSend(CPURLConnectionDelegate, "respondsToSelector:", sel_getUid("connectionDidReceiveAuthenticationChallenge:")))
            objj_msgSend(CPURLConnectionDelegate, "connectionDidReceiveAuthenticationChallenge:", self);
        else
        {
            if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("connection:didReceiveResponse:")))
            {
                if (self._isLocalFileConnection)
                    objj_msgSend(self._delegate, "connection:didReceiveResponse:", self, objj_msgSend(objj_msgSend(CPURLResponse, "alloc"), "initWithURL:", URL));
                else
                {
                    var response = objj_msgSend(objj_msgSend(CPHTTPURLResponse, "alloc"), "initWithURL:", URL);
                    objj_msgSend(response, "_setStatusCode:", statusCode);
                    objj_msgSend(response, "_setAllResponseHeaders:", self._HTTPRequest.getAllResponseHeaders());
                    objj_msgSend(self._delegate, "connection:didReceiveResponse:", self, response);
                }
            }
            if (!self._isCanceled)
            {
                if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("connection:didReceiveData:")))
                    objj_msgSend(self._delegate, "connection:didReceiveData:", self, self._HTTPRequest.responseText());
                if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("connectionDidFinishLoading:")))
                    objj_msgSend(self._delegate, "connectionDidFinishLoading:", self);
            }
        }
    }
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
,["void"]), new objj_method(sel_getUid("_HTTPRequest"), function $CPURLConnection___HTTPRequest(self, _cmd)
{
    return self._HTTPRequest;
}
,["HTTPRequest"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("setClassDelegate:"), function $CPURLConnection__setClassDelegate_(self, _cmd, delegate)
{
    CPURLConnectionDelegate = delegate;
}
,["void","id"]), new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:"), function $CPURLConnection__sendSynchronousRequest_returningResponse_(self, _cmd, aRequest, aURLResponse)
{
    try    {
        var request = new CFHTTPRequest();
        request.open(objj_msgSend(aRequest, "HTTPMethod"), objj_msgSend(objj_msgSend(aRequest, "URL"), "absoluteString"), NO);
        var fields = objj_msgSend(aRequest, "allHTTPHeaderFields"),
            key = nil,
            keys = objj_msgSend(fields, "keyEnumerator");
        while ((key = objj_msgSend(keys, "nextObject")) !== nil)
            request.setRequestHeader(key, objj_msgSend(fields, "objectForKey:", key));
        request.send(objj_msgSend(aRequest, "HTTPBody"));
        if (!request.success())
            return nil;
        return objj_msgSend(CPData, "dataWithRawString:", request.responseText());
    }
    catch(anException)     {
    }    return nil;
}
,["CPData","CPURLRequest","CPURLResponse"]), new objj_method(sel_getUid("connectionWithRequest:delegate:"), function $CPURLConnection__connectionWithRequest_delegate_(self, _cmd, aRequest, aDelegate)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithRequest:delegate:", aRequest, aDelegate);
}
,["CPURLConnection","CPURLRequest","id"])]);
}{
var the_class = objj_getClass("CPURLConnection")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPURLConnection\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_XMLHTTPRequest"), function $CPURLConnection___XMLHTTPRequest(self, _cmd)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("_HTTPRequest"));
    return objj_msgSend(self, "_HTTPRequest");
}
,["HTTPRequest"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:error:"), function $CPURLConnection__sendSynchronousRequest_returningResponse_error_(self, _cmd, aRequest, aURLResponse, anError)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("sendSynchronousRequest:returningResponse:"));
    return objj_msgSend(self, "sendSynchronousRequest:returningResponse:", aRequest, aURLResponse);
}
,["CPData","CPURLRequest","CPURLResponse","id"])]);
}