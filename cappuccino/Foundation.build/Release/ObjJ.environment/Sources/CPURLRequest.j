@STATIC;1.0;i;14;CPDictionary.ji;10;CPObject.ji;10;CPString.ji;7;CPURL.jt;3138;objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPURL.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPURLRequest"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_URL"), new objj_ivar("_HTTPBody"), new objj_ivar("_HTTPMethod"), new objj_ivar("_HTTPHeaderFields")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPURLRequest__init(self, _cmd)
{
    return objj_msgSend(self, "initWithURL:", nil);
}
,["id"]), new objj_method(sel_getUid("initWithURL:"), function $CPURLRequest__initWithURL_(self, _cmd, aURL)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPURLRequest").super_class }, "init");
    if (self)
    {
        objj_msgSend(self, "setURL:", aURL);
        self._HTTPBody = "";
        self._HTTPMethod = "GET";
        self._HTTPHeaderFields = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        objj_msgSend(self, "setValue:forHTTPHeaderField:", "Thu, 01 Jan 1970 00:00:00 GMT", "If-Modified-Since");
        objj_msgSend(self, "setValue:forHTTPHeaderField:", "no-cache", "Cache-Control");
        objj_msgSend(self, "setValue:forHTTPHeaderField:", "XMLHttpRequest", "X-Requested-With");
    }
    return self;
}
,["id","CPURL"]), new objj_method(sel_getUid("URL"), function $CPURLRequest__URL(self, _cmd)
{
    return self._URL;
}
,["CPURL"]), new objj_method(sel_getUid("setURL:"), function $CPURLRequest__setURL_(self, _cmd, aURL)
{
    self._URL = new CFURL(aURL);
}
,["void","CPURL"]), new objj_method(sel_getUid("setHTTPBody:"), function $CPURLRequest__setHTTPBody_(self, _cmd, anHTTPBody)
{
    self._HTTPBody = anHTTPBody;
}
,["void","CPString"]), new objj_method(sel_getUid("HTTPBody"), function $CPURLRequest__HTTPBody(self, _cmd)
{
    return self._HTTPBody;
}
,["CPString"]), new objj_method(sel_getUid("setHTTPMethod:"), function $CPURLRequest__setHTTPMethod_(self, _cmd, anHTTPMethod)
{
    self._HTTPMethod = anHTTPMethod;
}
,["void","CPString"]), new objj_method(sel_getUid("HTTPMethod"), function $CPURLRequest__HTTPMethod(self, _cmd)
{
    return self._HTTPMethod;
}
,["CPString"]), new objj_method(sel_getUid("allHTTPHeaderFields"), function $CPURLRequest__allHTTPHeaderFields(self, _cmd)
{
    return self._HTTPHeaderFields;
}
,["CPDictionary"]), new objj_method(sel_getUid("valueForHTTPHeaderField:"), function $CPURLRequest__valueForHTTPHeaderField_(self, _cmd, aField)
{
    return objj_msgSend(self._HTTPHeaderFields, "objectForKey:", aField);
}
,["CPString","CPString"]), new objj_method(sel_getUid("setValue:forHTTPHeaderField:"), function $CPURLRequest__setValue_forHTTPHeaderField_(self, _cmd, aValue, aField)
{
    objj_msgSend(self._HTTPHeaderFields, "setObject:forKey:", aValue, aField);
}
,["void","CPString","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("requestWithURL:"), function $CPURLRequest__requestWithURL_(self, _cmd, aURL)
{
    return objj_msgSend(objj_msgSend(CPURLRequest, "alloc"), "initWithURL:", aURL);
}
,["id","CPURL"])]);
}