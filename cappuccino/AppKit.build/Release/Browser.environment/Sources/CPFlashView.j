@STATIC;1.0;i;14;CPFlashMovie.ji;8;CPView.jt;9054;objj_executeFile("CPFlashMovie.j", YES);objj_executeFile("CPView.j", YES);var IEFlashCLSID = "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000";
{var the_class = objj_allocateClassPair(CPView, "CPFlashView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_flashMovie"), new objj_ivar("_params"), new objj_ivar("_paramElements"), new objj_ivar("_DOMParamElement"), new objj_ivar("_DOMObjectElement")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPFlashView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPFlashView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        if (!CPBrowserIsEngine(CPInternetExplorerBrowserEngine))
        {
            self._DOMObjectElement = document.createElement("object");
            self._DOMObjectElement.id = (self == null ? null : self.isa.objj_msgSend0(self, "elementID"));
            self._DOMObjectElement.width = "100%";
            self._DOMObjectElement.height = "100%";
            self._DOMObjectElement.style.top = "0px";
            self._DOMObjectElement.style.left = "0px";
            self._DOMObjectElement.type = "application/x-shockwave-flash";
            self._DOMParamElement = document.createElement("param");
            self._DOMParamElement.name = "movie";
            self._DOMObjectElement.appendChild(self._DOMParamElement);
            self._DOMElement.appendChild(self._DOMObjectElement);
        }
        else
            (self == null ? null : self.isa.objj_msgSend0(self, "_rebuildIEObjects"));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setFlashMovie:"), function $CPFlashView__setFlashMovie_(self, _cmd, aFlashMovie)
{
    if (self._flashMovie == aFlashMovie)
        return;
    self._flashMovie = aFlashMovie;
    if (!CPBrowserIsEngine(CPInternetExplorerBrowserEngine))
    {
        self._DOMParamElement.value = (aFlashMovie == null ? null : aFlashMovie.isa.objj_msgSend0(aFlashMovie, "filename"));
        self._DOMObjectElement.data = (aFlashMovie == null ? null : aFlashMovie.isa.objj_msgSend0(aFlashMovie, "filename"));
    }
    else
        self.isa.objj_msgSend0(self, "_rebuildIEObjects");
}
,["void","CPFlashMovie"]), new objj_method(sel_getUid("flashMovie"), function $CPFlashView__flashMovie(self, _cmd)
{
    return self._flashMovie;
}
,["CPFlashMovie"]), new objj_method(sel_getUid("setFlashVars:"), function $CPFlashView__setFlashVars_(self, _cmd, aDictionary)
{
    var varString = "",
        enumerator = (aDictionary == null ? null : aDictionary.isa.objj_msgSend0(aDictionary, "keyEnumerator")),
        key;
    if (key = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject")))
        varString = (varString == null ? null : varString.isa.objj_msgSend3(varString, "stringByAppendingFormat:", "%@=%@", key, (aDictionary == null ? null : aDictionary.isa.objj_msgSend1(aDictionary, "objectForKey:", key))));
    while (key = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject")))
        varString = (varString == null ? null : varString.isa.objj_msgSend3(varString, "stringByAppendingFormat:", "&%@=%@", key, (aDictionary == null ? null : aDictionary.isa.objj_msgSend1(aDictionary, "objectForKey:", key))));
    if (!self._params)
        self._params = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    ((___r1 = self._params), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", varString, "flashvars"));
    self.isa.objj_msgSend1(self, "setParameters:", self._params);
    var ___r1;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("flashVars"), function $CPFlashView__flashVars(self, _cmd)
{
    return ((___r1 = self._params), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "flashvars"));
    var ___r1;
}
,["CPDictionary"]), new objj_method(sel_getUid("setParameters:"), function $CPFlashView__setParameters_(self, _cmd, aDictionary)
{
    if (self._paramElements && !CPBrowserIsEngine(CPInternetExplorerBrowserEngine))
    {
        var elements = ((___r1 = self._paramElements), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allValues")),
            count = (elements == null ? null : elements.isa.objj_msgSend0(elements, "count"));
        for (var i = 0; i < count; i++)
            self._DOMObjectElement.removeChild((elements == null ? null : elements.isa.objj_msgSend1(elements, "objectAtIndex:", i)));
    }
    if (!self._params)
        self._params = aDictionary;
    else
        ((___r1 = self._params), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addEntriesFromDictionary:", aDictionary));
    if (!CPBrowserIsEngine(CPInternetExplorerBrowserEngine))
    {
        self._paramElements = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        var enumerator = ((___r1 = self._params), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyEnumerator")),
            key;
        while (self._DOMObjectElement && (key = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject"))) !== nil)
        {
            var param = document.createElement("param");
            param.name = key;
            param.value = ((___r1 = self._params), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", key));
            self._DOMObjectElement.appendChild(param);
            ((___r1 = self._paramElements), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", param, key));
        }
    }
    else
        self.isa.objj_msgSend0(self, "_rebuildIEObjects");
    var ___r1;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("parameters"), function $CPFlashView__parameters(self, _cmd)
{
    return self._params;
}
,["CPDictionary"]), new objj_method(sel_getUid("_rebuildIEObjects"), function $CPFlashView___rebuildIEObjects(self, _cmd)
{
    self._DOMElement.innerHTML = "";
    if (!((___r1 = self._flashMovie), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "filename")))
        return;
    var paramString = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "<param name='movie' value='%@' />", ((___r1 = self._flashMovie), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "filename"))),
        paramEnumerator = ((___r1 = self._params), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyEnumerator")),
        key;
    while ((key = (paramEnumerator == null ? null : paramEnumerator.isa.objj_msgSend0(paramEnumerator, "nextObject"))) !== nil)
        paramString = (paramString == null ? null : paramString.isa.objj_msgSend3(paramString, "stringByAppendingFormat:", "<param name='%@' value='%@' />", key, ((___r1 = self._params), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", key))));
    self._DOMObjectElement = document.createElement("object");
    self._DOMElement.appendChild(self._DOMObjectElement);
    self._DOMObjectElement.outerHTML = CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "<object id=%@ classid=%@ width=%@ height=%@>%@</object>", self.isa.objj_msgSend0(self, "elementID"), IEFlashCLSID, CGRectGetWidth(self.isa.objj_msgSend0(self, "bounds")), CGRectGetHeight(self.isa.objj_msgSend0(self, "bounds")), paramString);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("elementID"), function $CPFlashView__elementID(self, _cmd)
{
    return "CPFV_" + self.isa.objj_msgSend0(self, "UID");
}
,["CPString"]), new objj_method(sel_getUid("mouseMoved:"), function $CPFlashView__mouseMoved_(self, _cmd, sommit)
{
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $CPFlashView__mouseDragged_(self, _cmd, anEvent)
{
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPFlashView__mouseDown_(self, _cmd, anEvent)
{
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPFlashView__mouseUp_(self, _cmd, anEvent)
{
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    var ___r1, ___r2;
}
,["void","CPEvent"])]);
}