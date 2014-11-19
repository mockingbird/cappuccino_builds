@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;2321;objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPNotification"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_object"), new objj_ivar("_userInfo")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPNotification__init(self, _cmd)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "CPNotification's init method should not be used");
}
,["id"]), new objj_method(sel_getUid("initWithName:object:userInfo:"), function $CPNotification__initWithName_object_userInfo_(self, _cmd, aNotificationName, anObject, aUserInfo)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNotification").super_class }, "init");
    if (self)
    {
        self._name = aNotificationName;
        self._object = anObject;
        self._userInfo = aUserInfo;
    }
    return self;
}
,["id","CPString","id","CPDictionary"]), new objj_method(sel_getUid("name"), function $CPNotification__name(self, _cmd)
{
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("object"), function $CPNotification__object(self, _cmd)
{
    return self._object;
}
,["id"]), new objj_method(sel_getUid("userInfo"), function $CPNotification__userInfo(self, _cmd)
{
    return self._userInfo;
}
,["CPDictionary"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("notificationWithName:object:userInfo:"), function $CPNotification__notificationWithName_object_userInfo_(self, _cmd, aNotificationName, anObject, aUserInfo)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithName:object:userInfo:", aNotificationName, anObject, aUserInfo));
    var ___r1;
}
,["CPNotification","CPString","id","CPDictionary"]), new objj_method(sel_getUid("notificationWithName:object:"), function $CPNotification__notificationWithName_object_(self, _cmd, aNotificationName, anObject)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithName:object:userInfo:", aNotificationName, anObject, nil));
    var ___r1;
}
,["CPNotification","CPString","id"])]);
}