@STATIC;1.0;i;14;CPFlashMovie.ji;8;CPView.jt;4760;objj_executeFile("CPFlashMovie.j", YES);objj_executeFile("CPView.j", YES);var IEFlashCLSID = "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000";
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
    if (!self._params)
        self._params = aDictionary;
    else
        ((___r1 = self._params), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addEntriesFromDictionary:", aDictionary));
    var ___r1;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("parameters"), function $CPFlashView__parameters(self, _cmd)
{
    return self._params;
}
,["CPDictionary"]), new objj_method(sel_getUid("elementID"), function $CPFlashView__elementID(self, _cmd)
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