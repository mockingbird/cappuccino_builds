@STATIC;1.0;i;10;CPObject.ji;7;CPURL.jt;2538;objj_executeFile("CPObject.j", YES);objj_executeFile("CPURL.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPURLResponse"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_URL")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithURL:"), function $CPURLResponse__initWithURL_(self, _cmd, aURL)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPURLResponse").super_class }, "init");
    if (self)
        self._URL = aURL;
    return self;
}
,["id","CPURL"]), new objj_method(sel_getUid("URL"), function $CPURLResponse__URL(self, _cmd)
{
    return self._URL;
}
,["CPURL"])]);
}{var the_class = objj_allocateClassPair(CPURLResponse, "CPHTTPURLResponse"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_statusCode"), new objj_ivar("_allResponseHeaders"), new objj_ivar("_responseHeaders")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_setStatusCode:"), function $CPHTTPURLResponse___setStatusCode_(self, _cmd, aStatusCode)
{
    self._statusCode = aStatusCode;
}
,["void","int"]), new objj_method(sel_getUid("statusCode"), function $CPHTTPURLResponse__statusCode(self, _cmd)
{
    return self._statusCode;
}
,["int"]), new objj_method(sel_getUid("_setAllResponseHeaders:"), function $CPHTTPURLResponse___setAllResponseHeaders_(self, _cmd, responseHeadersString)
{
    self._allResponseHeaders = responseHeadersString;
}
,["void","CPString"]), new objj_method(sel_getUid("allHeaderFields"), function $CPHTTPURLResponse__allHeaderFields(self, _cmd)
{
    if (!self._responseHeaders)
        self._responseHeaders = objj_msgSend(objj_msgSend(self, "class"), "parseHTTPHeaders:", self._allResponseHeaders);
    return self._responseHeaders;
}
,["CPDictionary"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("parseHTTPHeaders:"), function $CPHTTPURLResponse__parseHTTPHeaders_(self, _cmd, headersString)
{
    var r = objj_msgSend(CPMutableDictionary, "dictionary");
    if (headersString)
    {
        var headerLines = headersString.split('\r\n'),
            count = headerLines.length;
        while (count--)
        {
            var headerLine = headerLines[count],
                index = headerLine.indexOf(': ');
            if (index !== CPNotFound)
                objj_msgSend(r, "setValue:forKey:", headerLine.substring(index + 2), headerLine.substring(0, index));
        }
    }
    return r;
}
,["CPDictionary","CPString"])]);
}