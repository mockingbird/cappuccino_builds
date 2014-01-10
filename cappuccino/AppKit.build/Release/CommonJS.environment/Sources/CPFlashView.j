@STATIC;1.0;i;14;CPFlashMovie.ji;8;CPView.jt;3660;objj_executeFile("CPFlashMovie.j", YES);objj_executeFile("CPView.j", YES);var IEFlashCLSID = "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000";
{var the_class = objj_allocateClassPair(CPView, "CPFlashView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_flashMovie"), new objj_ivar("_params"), new objj_ivar("_paramElements")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPFlashView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPFlashView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setFlashMovie:"), function $CPFlashView__setFlashMovie_(self, _cmd, aFlashMovie)
{
    if (self._flashMovie == aFlashMovie)
        return;
    self._flashMovie = aFlashMovie;
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
    if (!self._params)
        self._params = aDictionary;
    else
        objj_msgSend(self._params, "addEntriesFromDictionary:", aDictionary);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("parameters"), function $CPFlashView__parameters(self, _cmd)
{
    return self._params;
}
,["CPDictionary"]), new objj_method(sel_getUid("elementID"), function $CPFlashView__elementID(self, _cmd)
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