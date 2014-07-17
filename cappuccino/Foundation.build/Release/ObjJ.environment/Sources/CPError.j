@STATIC;1.0;i;14;CPDictionary.ji;10;CPObject.ji;10;CPString.jt;3981;objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);CPCappuccinoErrorDomain = CPCocoaErrorDomain = "CPCappuccinoErrorDomain";
CPUnderlyingErrorKey = "CPUnderlyingErrorKey";
CPLocalizedDescriptionKey = "CPLocalizedDescriptionKey";
CPLocalizedFailureReasonErrorKey = "CPLocalizedFailureReasonErrorKey";
CPLocalizedRecoverySuggestionErrorKey = "CPLocalizedRecoverySuggestionErrorKey";
CPLocalizedRecoveryOptionsErrorKey = "CPLocalizedRecoveryOptionsErrorKey";
CPRecoveryAttempterErrorKey = "CPRecoveryAttempterErrorKey";
CPHelpAnchorErrorKey = "CPHelpAnchorErrorKey";
CPStringEncodingErrorKey = "CPStringEncodingErrorKey";
CPURLErrorKey = "CPURLErrorKey";
CPFilePathErrorKey = "CPFilePathErrorKey";
{var the_class = objj_allocateClassPair(CPObject, "CPError"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_code"), new objj_ivar("_domain"), new objj_ivar("_userInfo")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("code"), function $CPError__code(self, _cmd)
{
    return self._code;
}
,["CPInteger"]), new objj_method(sel_getUid("domain"), function $CPError__domain(self, _cmd)
{
    return self._domain;
}
,["CPString"]), new objj_method(sel_getUid("userInfo"), function $CPError__userInfo(self, _cmd)
{
    return self._userInfo;
}
,["CPDictionary"]), new objj_method(sel_getUid("initWithDomain:code:userInfo:"), function $CPError__initWithDomain_code_userInfo_(self, _cmd, aDomain, aCode, aDict)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPError").super_class }, "init"))
    {
        self._domain = aDomain;
        self._code = aCode;
        self._userInfo = aDict;
    }
    return self;
}
,["id","CPString","CPInteger","CPDictionary"]), new objj_method(sel_getUid("localizedDescription"), function $CPError__localizedDescription(self, _cmd)
{
    return ((___r1 = self._userInfo), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPLocalizedDescriptionKey));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("localizedFailureReason"), function $CPError__localizedFailureReason(self, _cmd)
{
    return ((___r1 = self._userInfo), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPLocalizedFailureReasonErrorKey));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("localizedRecoveryOptions"), function $CPError__localizedRecoveryOptions(self, _cmd)
{
    return ((___r1 = self._userInfo), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPLocalizedRecoveryOptionsErrorKey));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("localizedRecoverySuggestion"), function $CPError__localizedRecoverySuggestion(self, _cmd)
{
    return ((___r1 = self._userInfo), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPLocalizedRecoverySuggestionErrorKey));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("recoveryAttempter"), function $CPError__recoveryAttempter(self, _cmd)
{
    return ((___r1 = self._userInfo), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPRecoveryAttempterErrorKey));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("description"), function $CPError__description(self, _cmd)
{
    return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "Error Domain=%@ Code=%d UserInfo=%p %@", self._domain, self._code, self._userInfo, self.isa.objj_msgSend0(self, "localizedDescription"));
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("errorWithDomain:code:userInfo:"), function $CPError__errorWithDomain_code_userInfo_(self, _cmd, aDomain, aCode, aDict)
{
    return ((___r1 = CPError.isa.objj_msgSend0(CPError, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithDomain:code:userInfo:", aDomain, aCode, aDict));
    var ___r1;
}
,["id","CPString","CPInteger","CPDictionary"])]);
}