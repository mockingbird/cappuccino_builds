@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;1643;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);{var the_class = objj_allocateClassPair(CPObject, "CPCookie"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cookieName"), new objj_ivar("_cookieValue"), new objj_ivar("_expires")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:"), function $CPCookie__initWithName_(self, _cmd, aName)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCookie").super_class }, "init");
    self._cookieName = aName;
    self._cookieValue = objj_msgSend(self, "_readCookieValue");
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("value"), function $CPCookie__value(self, _cmd)
{
    return self._cookieValue;
}
,["CPString"]), new objj_method(sel_getUid("name"), function $CPCookie__name(self, _cmd)
{
    return self._cookieName;
}
,["CPString"]), new objj_method(sel_getUid("expires"), function $CPCookie__expires(self, _cmd)
{
    return self._expires;
}
,["CPString"]), new objj_method(sel_getUid("setValue:expires:domain:"), function $CPCookie__setValue_expires_domain_(self, _cmd, value, date, domain)
{
    if (date)
        var expires = "; expires=" + date.toGMTString();
    else
        var expires = "";
    if (domain)
        domain = "; domain=" + domain;
    else
        domain = "";
    self._cookieValue = value;
    self._expires = expires;
}
,["void","CPString","CPDate","CPString"]), new objj_method(sel_getUid("_readCookieValue"), function $CPCookie___readCookieValue(self, _cmd)
{
    return "";
}
,["CPString"])]);
}