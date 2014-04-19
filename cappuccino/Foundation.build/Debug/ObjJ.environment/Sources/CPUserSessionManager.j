@STATIC;1.0;i;22;CPNotificationCenter.ji;10;CPObject.ji;10;CPString.jt;2591;objj_executeFile("CPNotificationCenter.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);CPUserSessionUndeterminedStatus = 0;
CPUserSessionLoggedInStatus = 1;
CPUserSessionLoggedOutStatus = 2;
CPUserSessionManagerStatusDidChangeNotification = "CPUserSessionManagerStatusDidChangeNotification";
CPUserSessionManagerUserIdentifierDidChangeNotification = "CPUserSessionManagerUserIdentifierDidChangeNotification";
var CPDefaultUserSessionManager = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPUserSessionManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_status"), new objj_ivar("_userIdentifier")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPUserSessionManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserSessionManager").super_class }, "init");
    if (self)
        self._status = CPUserSessionUndeterminedStatus;
    return self;
}
,["id"]), new objj_method(sel_getUid("status"), function $CPUserSessionManager__status(self, _cmd)
{
    return self._status;
}
,["CPUserSessionStatus"]), new objj_method(sel_getUid("setStatus:"), function $CPUserSessionManager__setStatus_(self, _cmd, aStatus)
{
    if (self._status == aStatus)
        return;
    self._status = aStatus;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPUserSessionManagerStatusDidChangeNotification, self);
    if (self._status != CPUserSessionLoggedInStatus)
        objj_msgSend(self, "setUserIdentifier:", nil);
}
,["void","CPUserSessionStatus"]), new objj_method(sel_getUid("userIdentifier"), function $CPUserSessionManager__userIdentifier(self, _cmd)
{
    return self._userIdentifier;
}
,["CPString"]), new objj_method(sel_getUid("setUserIdentifier:"), function $CPUserSessionManager__setUserIdentifier_(self, _cmd, anIdentifier)
{
    if (self._userIdentifier == anIdentifier)
        return;
    self._userIdentifier = anIdentifier;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPUserSessionManagerUserIdentifierDidChangeNotification, self);
}
,["void","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultManager"), function $CPUserSessionManager__defaultManager(self, _cmd)
{
    if (!CPDefaultUserSessionManager)
        CPDefaultUserSessionManager = objj_msgSend(objj_msgSend(CPUserSessionManager, "alloc"), "init");
    return CPDefaultUserSessionManager;
}
,["id"])]);
}