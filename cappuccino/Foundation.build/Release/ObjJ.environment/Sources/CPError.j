@STATIC;1.0;i;14;CPDictionary.ji;10;CPObject.ji;10;CPString.jt;3531;objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);CPCappuccinoErrorDomain = CPCocoaErrorDomain = "CPCappuccinoErrorDomain";
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
    return objj_msgSend(self._userInfo, "objectForKey:", CPLocalizedDescriptionKey);
}
,["CPString"]), new objj_method(sel_getUid("localizedFailureReason"), function $CPError__localizedFailureReason(self, _cmd)
{
    return objj_msgSend(self._userInfo, "objectForKey:", CPLocalizedFailureReasonErrorKey);
}
,["CPString"]), new objj_method(sel_getUid("localizedRecoveryOptions"), function $CPError__localizedRecoveryOptions(self, _cmd)
{
    return objj_msgSend(self._userInfo, "objectForKey:", CPLocalizedRecoveryOptionsErrorKey);
}
,["CPArray"]), new objj_method(sel_getUid("localizedRecoverySuggestion"), function $CPError__localizedRecoverySuggestion(self, _cmd)
{
    return objj_msgSend(self._userInfo, "objectForKey:", CPLocalizedRecoverySuggestionErrorKey);
}
,["CPString"]), new objj_method(sel_getUid("recoveryAttempter"), function $CPError__recoveryAttempter(self, _cmd)
{
    return objj_msgSend(self._userInfo, "objectForKey:", CPRecoveryAttempterErrorKey);
}
,["id"]), new objj_method(sel_getUid("description"), function $CPError__description(self, _cmd)
{
    return objj_msgSend(CPString, "stringWithFormat:", "Error Domain=%@ Code=%d UserInfo=%p %@", self._domain, self._code, self._userInfo, objj_msgSend(self, "localizedDescription"));
}
,["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("errorWithDomain:code:userInfo:"), function $CPError__errorWithDomain_code_userInfo_(self, _cmd, aDomain, aCode, aDict)
{
    return objj_msgSend(objj_msgSend(CPError, "alloc"), "initWithDomain:code:userInfo:", aDomain, aCode, aDict);
}
,["id","CPString","CPInteger","CPDictionary"])]);
}