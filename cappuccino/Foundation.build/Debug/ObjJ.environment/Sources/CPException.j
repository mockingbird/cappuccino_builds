@STATIC;1.0;i;9;CPCoder.ji;10;CPObject.ji;10;CPString.jt;6480;objj_executeFile("CPCoder.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);CPInvalidArgumentException = "CPInvalidArgumentException";
CPUnsupportedMethodException = "CPUnsupportedMethodException";
CPRangeException = "CPRangeException";
CPInternalInconsistencyException = "CPInternalInconsistencyException";
CPGenericException = "CPGenericException";
{var the_class = objj_allocateClassPair(CPObject, "CPException"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_userInfo"), new objj_ivar("name"), new objj_ivar("message")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:reason:userInfo:"), function $CPException__initWithName_reason_userInfo_(self, _cmd, aName, aReason, aUserInfo)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPException").super_class }, "init");
    if (self)
    {
        self.name = aName;
        self.message = aReason;
        self._userInfo = aUserInfo;
    }
    return self;
}
,["id","CPString","CPString","CPDictionary"]), new objj_method(sel_getUid("name"), function $CPException__name(self, _cmd)
{
    return self.name;
}
,["CPString"]), new objj_method(sel_getUid("reason"), function $CPException__reason(self, _cmd)
{
    return self.message;
}
,["CPString"]), new objj_method(sel_getUid("userInfo"), function $CPException__userInfo(self, _cmd)
{
    return self._userInfo;
}
,["CPDictionary"]), new objj_method(sel_getUid("description"), function $CPException__description(self, _cmd)
{
    return self.message;
}
,["CPString"]), new objj_method(sel_getUid("raise"), function $CPException__raise(self, _cmd)
{
    throw self;
}
,["void"]), new objj_method(sel_getUid("isEqual:"), function $CPException__isEqual_(self, _cmd, anObject)
{
    if (!anObject || !anObject.isa)
        return NO;
    return objj_msgSend(anObject, "isKindOfClass:", CPException) && self.name === objj_msgSend(anObject, "name") && self.message === objj_msgSend(anObject, "message") && (self._userInfo === objj_msgSend(anObject, "userInfo") || objj_msgSend(self._userInfo, "isEqual:", objj_msgSend(anObject, "userInfo")));
}
,["BOOL","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPException__alloc(self, _cmd)
{
    var result = new Error();
    result.isa = objj_msgSend(self, "class");
    return result;
}
,["id"]), new objj_method(sel_getUid("raise:reason:"), function $CPException__raise_reason_(self, _cmd, aName, aReason)
{
    objj_msgSend(objj_msgSend(self, "exceptionWithName:reason:userInfo:", aName, aReason, nil), "raise");
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("raise:format:"), function $CPException__raise_format_(self, _cmd, aName, aFormat)
{
    if (!aFormat)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "raise:format: the format can't be 'nil'");
    var aReason = ObjectiveJ.sprintf.apply(this, Array.prototype.slice.call(arguments, 3));
    objj_msgSend(objj_msgSend(self, "exceptionWithName:reason:userInfo:", aName, aReason, nil), "raise");
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("exceptionWithName:reason:userInfo:"), function $CPException__exceptionWithName_reason_userInfo_(self, _cmd, aName, aReason, aUserInfo)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithName:reason:userInfo:", aName, aReason, aUserInfo);
}
,["CPException","CPString","CPString","CPDictionary"])]);
}{
var the_class = objj_getClass("CPException")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPException\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPException__copy(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "class"), "exceptionWithName:reason:userInfo:", self.name, self.message, self._userInfo);
}
,["id"])]);
}var CPExceptionNameKey = "CPExceptionNameKey",
    CPExceptionReasonKey = "CPExceptionReasonKey",
    CPExceptionUserInfoKey = "CPExceptionUserInfoKey";
{
var the_class = objj_getClass("CPException")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPException\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPException__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPException").super_class }, "init"))
    {
        self.name = objj_msgSend(aCoder, "decodeObjectForKey:", CPExceptionNameKey);
        self.message = objj_msgSend(aCoder, "decodeObjectForKey:", CPExceptionReasonKey);
        self._userInfo = objj_msgSend(aCoder, "decodeObjectForKey:", CPExceptionUserInfoKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPException__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self.name, CPExceptionNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self.message, CPExceptionReasonKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._userInfo, CPExceptionUserInfoKey);
}
,["void","CPCoder"])]);
}Error.prototype.isa = CPException;
Error.prototype._userInfo = null;
objj_msgSend(CPException, "initialize");
_CPRaiseInvalidAbstractInvocation = function(anObject, aSelector)
{
    objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "*** -" + sel_getName(aSelector) + " cannot be sent to an abstract object of class " + objj_msgSend(anObject, "className") + ": Create a concrete instance!");
}
_CPRaiseInvalidArgumentException = function(anObject, aSelector, aMessage)
{
    objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, (class_isMetaClass(anObject.isa) ? "+" : "-") + "[" + objj_msgSend(anObject, "className") + " " + aSelector + "]: " + aMessage);
}
_CPRaiseRangeException = function(anObject, aSelector, anIndex, aCount)
{
    objj_msgSend(CPException, "raise:reason:", CPRangeException, (class_isMetaClass(anObject.isa) ? "+" : "-") + "[" + objj_msgSend(anObject, "className") + " " + aSelector + "]: " + "index (" + anIndex + ") beyond bounds (" + aCount + ")");
}
_CPReportLenientDeprecation = function(aClass, oldSelector, newSelector)
{
    CPLog.warn("[" + CPStringFromClass(aClass) + " " + CPStringFromSelector(oldSelector) + "] is deprecated, using " + CPStringFromSelector(newSelector) + " instead.");
}
