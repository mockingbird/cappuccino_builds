@STATIC;1.0;i;14;CPFlashMovie.ji;8;CPView.jt;7040;objj_executeFile("CPFlashMovie.j", YES);objj_executeFile("CPView.j", YES);var IEFlashCLSID = "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000";
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
            self._DOMObjectElement.id = objj_msgSend(self, "elementID");
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
            objj_msgSend(self, "_rebuildIEObjects");
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
        self._DOMParamElement.value = objj_msgSend(aFlashMovie, "filename");
        self._DOMObjectElement.data = objj_msgSend(aFlashMovie, "filename");
    }
    else
        objj_msgSend(self, "_rebuildIEObjects");
}
,["void","CPFlashMovie"]), new objj_method(sel_getUid("flashMovie"), function $CPFlashView__flashMovie(self, _cmd)
{
    return self._flashMovie;
}
,["CPFlashMovie"]), new objj_method(sel_getUid("setFlashVars:"), function $CPFlashView__setFlashVars_(self, _cmd, aDictionary)
{
    var varString = "",
        enumerator = objj_msgSend(aDictionary, "keyEnumerator"),
        key;
    if (key = objj_msgSend(enumerator, "nextObject"))
        varString = objj_msgSend(varString, "stringByAppendingFormat:", "%@=%@", key, objj_msgSend(aDictionary, "objectForKey:", key));
    while (key = objj_msgSend(enumerator, "nextObject"))
        varString = objj_msgSend(varString, "stringByAppendingFormat:", "&%@=%@", key, objj_msgSend(aDictionary, "objectForKey:", key));
    if (!self._params)
        self._params = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    objj_msgSend(self._params, "setObject:forKey:", varString, "flashvars");
    objj_msgSend(self, "setParameters:", self._params);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("flashVars"), function $CPFlashView__flashVars(self, _cmd)
{
    return objj_msgSend(self._params, "objectForKey:", "flashvars");
}
,["CPDictionary"]), new objj_method(sel_getUid("setParameters:"), function $CPFlashView__setParameters_(self, _cmd, aDictionary)
{
    if (self._paramElements && !CPBrowserIsEngine(CPInternetExplorerBrowserEngine))
    {
        var elements = objj_msgSend(self._paramElements, "allValues"),
            count = objj_msgSend(elements, "count");
        for (var i = 0; i < count; i++)
            self._DOMObjectElement.removeChild(objj_msgSend(elements, "objectAtIndex:", i));
    }
    if (!self._params)
        self._params = aDictionary;
    else
        objj_msgSend(self._params, "addEntriesFromDictionary:", aDictionary);
    if (!CPBrowserIsEngine(CPInternetExplorerBrowserEngine))
    {
        self._paramElements = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        var enumerator = objj_msgSend(self._params, "keyEnumerator"),
            key;
        while (self._DOMObjectElement && (key = objj_msgSend(enumerator, "nextObject")) !== nil)
        {
            var param = document.createElement("param");
            param.name = key;
            param.value = objj_msgSend(self._params, "objectForKey:", key);
            self._DOMObjectElement.appendChild(param);
            objj_msgSend(self._paramElements, "setObject:forKey:", param, key);
        }
    }
    else
        objj_msgSend(self, "_rebuildIEObjects");
}
,["void","CPDictionary"]), new objj_method(sel_getUid("parameters"), function $CPFlashView__parameters(self, _cmd)
{
    return self._params;
}
,["CPDictionary"]), new objj_method(sel_getUid("_rebuildIEObjects"), function $CPFlashView___rebuildIEObjects(self, _cmd)
{
    self._DOMElement.innerHTML = "";
    if (!objj_msgSend(self._flashMovie, "filename"))
        return;
    var paramString = objj_msgSend(CPString, "stringWithFormat:", "<param name='movie' value='%@' />", objj_msgSend(self._flashMovie, "filename")),
        paramEnumerator = objj_msgSend(self._params, "keyEnumerator"),
        key;
    while ((key = objj_msgSend(paramEnumerator, "nextObject")) !== nil)
        paramString = objj_msgSend(paramString, "stringByAppendingFormat:", "<param name='%@' value='%@' />", key, objj_msgSend(self._params, "objectForKey:", key));
    self._DOMObjectElement = document.createElement("object");
    self._DOMElement.appendChild(self._DOMObjectElement);
    self._DOMObjectElement.outerHTML = objj_msgSend(CPString, "stringWithFormat:", "<object id=%@ classid=%@ width=%@ height=%@>%@</object>", objj_msgSend(self, "elementID"), IEFlashCLSID, CGRectGetWidth(objj_msgSend(self, "bounds")), CGRectGetHeight(objj_msgSend(self, "bounds")), paramString);
}
,["void"]), new objj_method(sel_getUid("elementID"), function $CPFlashView__elementID(self, _cmd)
{
    return "CPFV_" + objj_msgSend(self, "UID");
}
,["CPString"]), new objj_method(sel_getUid("mouseMoved:"), function $CPFlashView__mouseMoved_(self, _cmd, sommit)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $CPFlashView__mouseDragged_(self, _cmd, anEvent)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPFlashView__mouseDown_(self, _cmd, anEvent)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPFlashView__mouseUp_(self, _cmd, anEvent)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
,["void","CPEvent"])]);
}