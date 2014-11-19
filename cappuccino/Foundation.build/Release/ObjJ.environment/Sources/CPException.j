@STATIC;1.0;i;9;CPCoder.ji;10;CPObject.ji;10;CPString.jt;7519;objj_executeFile("CPCoder.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);CPInvalidArgumentException = "CPInvalidArgumentException";
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
    return (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "isKindOfClass:", CPException)) && self.name === (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "name")) && self.message === (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "message")) && (self._userInfo === (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "userInfo")) || ((___r1 = self._userInfo), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "userInfo")))));
    var ___r1;
}
,["BOOL","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPException__alloc(self, _cmd)
{
    var result = new Error();
    result.isa = self.isa.objj_msgSend0(self, "class");
    return result;
}
,["id"]), new objj_method(sel_getUid("raise:reason:"), function $CPException__raise_reason_(self, _cmd, aName, aReason)
{
    ((___r1 = self.isa.objj_msgSend3(self, "exceptionWithName:reason:userInfo:", aName, aReason, nil)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "raise"));
    var ___r1;
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("raise:format:"), function $CPException__raise_format_(self, _cmd, aName, aFormat)
{
    if (!aFormat)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "raise:format: the format can't be 'nil'");
    var aReason = ObjectiveJ.sprintf.apply(this, Array.prototype.slice.call(arguments, 3));
    ((___r1 = self.isa.objj_msgSend3(self, "exceptionWithName:reason:userInfo:", aName, aReason, nil)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "raise"));
    var ___r1;
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("exceptionWithName:reason:userInfo:"), function $CPException__exceptionWithName_reason_userInfo_(self, _cmd, aName, aReason, aUserInfo)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithName:reason:userInfo:", aName, aReason, aUserInfo));
    var ___r1;
}
,["CPException","CPString","CPString","CPDictionary"])]);
}{
var the_class = objj_getClass("CPException")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPException\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPException__copy(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "exceptionWithName:reason:userInfo:", self.name, self.message, self._userInfo));
    var ___r1;
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
        self.name = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPExceptionNameKey));
        self.message = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPExceptionReasonKey));
        self._userInfo = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPExceptionUserInfoKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPException__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.name, CPExceptionNameKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.message, CPExceptionReasonKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._userInfo, CPExceptionUserInfoKey));
}
,["void","CPCoder"])]);
}Error.prototype.isa = CPException;
Error.prototype._userInfo = null;
CPException.isa.objj_msgSend0(CPException, "initialize");
_CPRaiseInvalidAbstractInvocation = function(anObject, aSelector)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "*** -" + sel_getName(aSelector) + " cannot be sent to an abstract object of class " + (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "className")) + ": Create a concrete instance!");
}
_CPRaiseInvalidArgumentException = function(anObject, aSelector, aMessage)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, (class_isMetaClass(anObject.isa) ? "+" : "-") + "[" + (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "className")) + " " + aSelector + "]: " + aMessage);
}
_CPRaiseRangeException = function(anObject, aSelector, anIndex, aCount)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, (class_isMetaClass(anObject.isa) ? "+" : "-") + "[" + (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "className")) + " " + aSelector + "]: " + "index (" + anIndex + ") beyond bounds (" + aCount + ")");
}
_CPReportLenientDeprecation = function(aClass, oldSelector, newSelector)
{
    CPLog.warn("[" + CPStringFromClass(aClass) + " " + CPStringFromSelector(oldSelector) + "] is deprecated, using " + CPStringFromSelector(newSelector) + " instead.");
}
