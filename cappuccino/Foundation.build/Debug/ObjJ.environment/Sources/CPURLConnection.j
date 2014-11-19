@STATIC;1.0;i;8;CPData.ji;10;CPObject.ji;11;CPRunLoop.ji;14;CPURLRequest.ji;15;CPURLResponse.jt;12193;objj_executeFile("CPData.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRunLoop.j", YES);objj_executeFile("CPURLRequest.j", YES);objj_executeFile("CPURLResponse.j", YES);var CPURLConnectionDelegate = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPURLConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_request"), new objj_ivar("_delegate"), new objj_ivar("_isCanceled"), new objj_ivar("_isLocalFileConnection"), new objj_ivar("_withCredentials"), new objj_ivar("_HTTPRequest")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("withCredentials"), function $CPURLConnection__withCredentials(self, _cmd)
{
    return self._withCredentials;
}
,["BOOL"]), new objj_method(sel_getUid("setWithCredentials:"), function $CPURLConnection__setWithCredentials_(self, _cmd, newValue)
{
    self._withCredentials = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:"), function $CPURLConnection__initWithRequest_delegate_startImmediately_(self, _cmd, aRequest, aDelegate, shouldStartImmediately)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPURLConnection").super_class }, "init");
    if (self)
    {
        self._request = aRequest;
        self._delegate = aDelegate;
        self._isCanceled = NO;
        self._withCredentials = NO;
        var URL = ((___r1 = self._request), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "URL")),
            scheme = (URL == null ? null : URL.isa.objj_msgSend0(URL, "scheme"));
        self._isLocalFileConnection = scheme === "file" || (scheme === "http" || scheme === "https") && window.location && (window.location.protocol === "file:" || window.location.protocol === "app:");
        self._HTTPRequest = new CFHTTPRequest();
        if (shouldStartImmediately)
            (self == null ? null : self.isa.objj_msgSend0(self, "start"));
    }
    return self;
    var ___r1;
}
,["id","CPURLRequest","id","BOOL"]), new objj_method(sel_getUid("initWithRequest:delegate:"), function $CPURLConnection__initWithRequest_delegate_(self, _cmd, aRequest, aDelegate)
{
    return self.isa.objj_msgSend3(self, "initWithRequest:delegate:startImmediately:", aRequest, aDelegate, YES);
}
,["id","CPURLRequest","id"]), new objj_method(sel_getUid("delegate"), function $CPURLConnection__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("start"), function $CPURLConnection__start(self, _cmd)
{
    self._isCanceled = NO;
    self._HTTPRequest.setWithCredentials(self._withCredentials);
    try    {
        self._HTTPRequest.open(((___r1 = self._request), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "HTTPMethod")), ((___r1 = ((___r2 = self._request), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "URL"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "absoluteString")), YES);
        self._HTTPRequest.onreadystatechange = function()
        {
            self.isa.objj_msgSend0(self, "_readyStateDidChange");
        };
        var fields = ((___r1 = self._request), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allHTTPHeaderFields")),
            key = nil,
            keys = (fields == null ? null : fields.isa.objj_msgSend0(fields, "keyEnumerator"));
        while ((key = (keys == null ? null : keys.isa.objj_msgSend0(keys, "nextObject"))) !== nil)
            self._HTTPRequest.setRequestHeader(key, (fields == null ? null : fields.isa.objj_msgSend1(fields, "objectForKey:", key)));
        self._HTTPRequest.send(((___r1 = self._request), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "HTTPBody")));
    }
    catch(anException)     {
        if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("connection:didFailWithError:"))))
            ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "connection:didFailWithError:", self, anException));
        var ___r1;
    }    var ___r1, ___r2;
}
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
            URL = ((___r1 = self._request), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "URL"));
        if (statusCode === 401 && (CPURLConnectionDelegate == null ? null : CPURLConnectionDelegate.isa.objj_msgSend1(CPURLConnectionDelegate, "respondsToSelector:", sel_getUid("connectionDidReceiveAuthenticationChallenge:"))))
            (CPURLConnectionDelegate == null ? null : CPURLConnectionDelegate.isa.objj_msgSend1(CPURLConnectionDelegate, "connectionDidReceiveAuthenticationChallenge:", self));
        else
        {
            if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("connection:didReceiveResponse:"))))
            {
                if (self._isLocalFileConnection)
                    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "connection:didReceiveResponse:", self, ((___r2 = CPURLResponse.isa.objj_msgSend0(CPURLResponse, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "initWithURL:", URL))));
                else
                {
                    var response = ((___r1 = CPHTTPURLResponse.isa.objj_msgSend0(CPHTTPURLResponse, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithURL:", URL));
                    (response == null ? null : response.isa.objj_msgSend1(response, "_setStatusCode:", statusCode));
                    (response == null ? null : response.isa.objj_msgSend1(response, "_setAllResponseHeaders:", self._HTTPRequest.getAllResponseHeaders()));
                    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "connection:didReceiveResponse:", self, response));
                }
            }
            if (!self._isCanceled)
            {
                if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("connection:didReceiveData:"))))
                    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "connection:didReceiveData:", self, self._HTTPRequest.responseText()));
                if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("connectionDidFinishLoading:"))))
                    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "connectionDidFinishLoading:", self));
            }
        }
    }
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
    var ___r1, ___r2;
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
    var cfHTTPRequest = new CFHTTPRequest();
    return CPURLConnection.isa.objj_msgSend3(CPURLConnection, "_sendSynchronousRequest:returningResponse:withCFHTTPRequest:", aRequest, aURLResponse, cfHTTPRequest);
}
,["CPData","CPURLRequest","CPURLResponse"]), new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:withCredentials:"), function $CPURLConnection__sendSynchronousRequest_returningResponse_withCredentials_(self, _cmd, aRequest, aURLResponse, withCredentials)
{
    var cfHTTPRequest = new CFHTTPRequest();
    cfHTTPRequest.setWithCredentials(withCredentials);
    return CPURLConnection.isa.objj_msgSend3(CPURLConnection, "_sendSynchronousRequest:returningResponse:withCFHTTPRequest:", aRequest, aURLResponse, cfHTTPRequest);
}
,["CPData","CPURLRequest","CPURLResponse","BOOL"]), new objj_method(sel_getUid("_sendSynchronousRequest:returningResponse:withCFHTTPRequest:"), function $CPURLConnection___sendSynchronousRequest_returningResponse_withCFHTTPRequest_(self, _cmd, aRequest, aURLResponse, aCFHTTPRequest)
{
    try    {
        aCFHTTPRequest.open((aRequest == null ? null : aRequest.isa.objj_msgSend0(aRequest, "HTTPMethod")), ((___r1 = (aRequest == null ? null : aRequest.isa.objj_msgSend0(aRequest, "URL"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "absoluteString")), NO);
        var fields = (aRequest == null ? null : aRequest.isa.objj_msgSend0(aRequest, "allHTTPHeaderFields")),
            key = nil,
            keys = (fields == null ? null : fields.isa.objj_msgSend0(fields, "keyEnumerator"));
        while ((key = (keys == null ? null : keys.isa.objj_msgSend0(keys, "nextObject"))) !== nil)
            aCFHTTPRequest.setRequestHeader(key, (fields == null ? null : fields.isa.objj_msgSend1(fields, "objectForKey:", key)));
        aCFHTTPRequest.send((aRequest == null ? null : aRequest.isa.objj_msgSend0(aRequest, "HTTPBody")));
        if (!aCFHTTPRequest.success())
            return nil;
        return CPData.isa.objj_msgSend1(CPData, "dataWithRawString:", aCFHTTPRequest.responseText());
    }
    catch(anException)     {
    }    return nil;
    var ___r1;
}
,["CPData","CPURLRequest","CPURLResponse","CFHTTPRequest"]), new objj_method(sel_getUid("connectionWithRequest:delegate:"), function $CPURLConnection__connectionWithRequest_delegate_(self, _cmd, aRequest, aDelegate)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithRequest:delegate:", aRequest, aDelegate));
    var ___r1;
}
,["CPURLConnection","CPURLRequest","id"]), new objj_method(sel_getUid("connectionWithRequest:delegate:withCredentials:"), function $CPURLConnection__connectionWithRequest_delegate_withCredentials_(self, _cmd, aRequest, aDelegate, withCredentials)
{
    var connection = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithRequest:delegate:startImmediately:", aRequest, aDelegate, NO));
    (connection == null ? null : connection.isa.objj_msgSend1(connection, "setWithCredentials:", withCredentials));
    (connection == null ? null : connection.isa.objj_msgSend0(connection, "start"));
    return connection;
    var ___r1;
}
,["CPURLConnection","CPURLRequest","id","BOOL"])]);
}{
var the_class = objj_getClass("CPURLConnection")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPURLConnection\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_XMLHTTPRequest"), function $CPURLConnection___XMLHTTPRequest(self, _cmd)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("_HTTPRequest"));
    return self.isa.objj_msgSend0(self, "_HTTPRequest");
}
,["HTTPRequest"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:error:"), function $CPURLConnection__sendSynchronousRequest_returningResponse_error_(self, _cmd, aRequest, aURLResponse, anError)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("sendSynchronousRequest:returningResponse:"));
    return self.isa.objj_msgSend2(self, "sendSynchronousRequest:returningResponse:", aRequest, aURLResponse);
}
,["CPData","CPURLRequest","CPURLResponse","id"])]);
}