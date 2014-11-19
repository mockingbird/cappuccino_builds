@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;2030;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);{var the_class = objj_allocateClassPair(CPObject, "CPCookie"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cookieName"), new objj_ivar("_cookieValue"), new objj_ivar("_expires")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:"), function $CPCookie__initWithName_(self, _cmd, aName)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCookie").super_class }, "init");
    self._cookieName = aName;
    self._cookieValue = (self == null ? null : self.isa.objj_msgSend0(self, "_readCookieValue"));
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
    document.cookie = self._cookieName + "=" + value + expires + "; path=/" + domain;
}
,["void","CPString","CPDate","CPString"]), new objj_method(sel_getUid("_readCookieValue"), function $CPCookie___readCookieValue(self, _cmd)
{
    var nameEQ = self._cookieName + "=",
        ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++)
    {
        var c = ca[i];
        while (c.charAt(0) == ' ')
            c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0)
            return c.substring(nameEQ.length, c.length);
    }
    return "";
}
,["CPString"])]);
}