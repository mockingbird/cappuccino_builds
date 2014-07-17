@STATIC;1.0;i;8;CPDate.ji;14;CPInvocation.ji;10;CPObject.ji;11;CPRunLoop.jt;9831;objj_executeFile("CPDate.j", YES);objj_executeFile("CPInvocation.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRunLoop.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPTimer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_timeInterval"), new objj_ivar("_invocation"), new objj_ivar("_callback"), new objj_ivar("_repeats"), new objj_ivar("_isValid"), new objj_ivar("_fireDate"), new objj_ivar("_userInfo")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFireDate:interval:invocation:repeats:"), function $CPTimer__initWithFireDate_interval_invocation_repeats_(self, _cmd, aDate, seconds, anInvocation, shouldRepeat)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTimer").super_class }, "init");
    if (self)
    {
        self._timeInterval = seconds <= 0 ? 0.1 : seconds;
        self._invocation = anInvocation;
        self._repeats = shouldRepeat;
        self._isValid = YES;
        self._fireDate = aDate;
    }
    return self;
}
,["id","CPDate","CPTimeInterval","CPInvocation","BOOL"]), new objj_method(sel_getUid("initWithFireDate:interval:target:selector:userInfo:repeats:"), function $CPTimer__initWithFireDate_interval_target_selector_userInfo_repeats_(self, _cmd, aDate, seconds, aTarget, aSelector, userInfo, shouldRepeat)
{
    var invocation = CPInvocation.isa.objj_msgSend1(CPInvocation, "invocationWithMethodSignature:", 1);
    (invocation == null ? null : invocation.isa.objj_msgSend1(invocation, "setTarget:", aTarget));
    (invocation == null ? null : invocation.isa.objj_msgSend1(invocation, "setSelector:", aSelector));
    (invocation == null ? null : invocation.isa.objj_msgSend2(invocation, "setArgument:atIndex:", self, 2));
    self = (self == null ? null : self.isa.objj_msgSend(self, "initWithFireDate:interval:invocation:repeats:", aDate, seconds, invocation, shouldRepeat));
    if (self)
        self._userInfo = userInfo;
    return self;
}
,["id","CPDate","CPTimeInterval","id","SEL","id","BOOL"]), new objj_method(sel_getUid("initWithFireDate:interval:callback:repeats:"), function $CPTimer__initWithFireDate_interval_callback_repeats_(self, _cmd, aDate, seconds, aFunction, shouldRepeat)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTimer").super_class }, "init");
    if (self)
    {
        self._timeInterval = seconds <= 0 ? 0.1 : seconds;
        self._callback = aFunction;
        self._repeats = shouldRepeat;
        self._isValid = YES;
        self._fireDate = aDate;
    }
    return self;
}
,["id","CPDate","CPTimeInterval","Function","BOOL"]), new objj_method(sel_getUid("timeInterval"), function $CPTimer__timeInterval(self, _cmd)
{
    return self._timeInterval;
}
,["CPTimeInterval"]), new objj_method(sel_getUid("fireDate"), function $CPTimer__fireDate(self, _cmd)
{
    return self._fireDate;
}
,["CPDate"]), new objj_method(sel_getUid("setFireDate:"), function $CPTimer__setFireDate_(self, _cmd, aDate)
{
    self._fireDate = aDate;
}
,["void","CPDate"]), new objj_method(sel_getUid("fire"), function $CPTimer__fire(self, _cmd)
{
    if (!self._isValid)
        return;
    if (self._callback)
        self._callback();
    else
        ((___r1 = self._invocation), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invoke"));
    if (!self._isValid)
        return;
    if (self._repeats)
        self._fireDate = CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceNow:", self._timeInterval);
    else
        self.isa.objj_msgSend0(self, "invalidate");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("isValid"), function $CPTimer__isValid(self, _cmd)
{
    return self._isValid;
}
,["BOOL"]), new objj_method(sel_getUid("invalidate"), function $CPTimer__invalidate(self, _cmd)
{
    self._isValid = NO;
    self._userInfo = nil;
    self._invocation = nil;
    self._callback = nil;
}
,["void"]), new objj_method(sel_getUid("userInfo"), function $CPTimer__userInfo(self, _cmd)
{
    return self._userInfo;
}
,["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("scheduledTimerWithTimeInterval:invocation:repeats:"), function $CPTimer__scheduledTimerWithTimeInterval_invocation_repeats_(self, _cmd, seconds, anInvocation, shouldRepeat)
{
    var timer = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithFireDate:interval:invocation:repeats:", CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, anInvocation, shouldRepeat));
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "addTimer:forMode:", timer, CPDefaultRunLoopMode));
    return timer;
    var ___r1;
}
,["CPTimer","CPTimeInterval","CPInvocation","BOOL"]), new objj_method(sel_getUid("scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:"), function $CPTimer__scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(self, _cmd, seconds, aTarget, aSelector, userInfo, shouldRepeat)
{
    var timer = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithFireDate:interval:target:selector:userInfo:repeats:", CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, aTarget, aSelector, userInfo, shouldRepeat));
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "addTimer:forMode:", timer, CPDefaultRunLoopMode));
    return timer;
    var ___r1;
}
,["CPTimer","CPTimeInterval","id","SEL","id","BOOL"]), new objj_method(sel_getUid("scheduledTimerWithTimeInterval:callback:repeats:"), function $CPTimer__scheduledTimerWithTimeInterval_callback_repeats_(self, _cmd, seconds, aFunction, shouldRepeat)
{
    var timer = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithFireDate:interval:callback:repeats:", CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, aFunction, shouldRepeat));
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "addTimer:forMode:", timer, CPDefaultRunLoopMode));
    return timer;
    var ___r1;
}
,["CPTimer","CPTimeInterval","Function","BOOL"]), new objj_method(sel_getUid("timerWithTimeInterval:invocation:repeats:"), function $CPTimer__timerWithTimeInterval_invocation_repeats_(self, _cmd, seconds, anInvocation, shouldRepeat)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithFireDate:interval:invocation:repeats:", CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, anInvocation, shouldRepeat));
    var ___r1;
}
,["CPTimer","CPTimeInterval","CPInvocation","BOOL"]), new objj_method(sel_getUid("timerWithTimeInterval:target:selector:userInfo:repeats:"), function $CPTimer__timerWithTimeInterval_target_selector_userInfo_repeats_(self, _cmd, seconds, aTarget, aSelector, userInfo, shouldRepeat)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithFireDate:interval:target:selector:userInfo:repeats:", CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, aTarget, aSelector, userInfo, shouldRepeat));
    var ___r1;
}
,["CPTimer","CPTimeInterval","id","SEL","id","BOOL"]), new objj_method(sel_getUid("timerWithTimeInterval:callback:repeats:"), function $CPTimer__timerWithTimeInterval_callback_repeats_(self, _cmd, seconds, aFunction, shouldRepeat)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithFireDate:interval:callback:repeats:", CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, aFunction, shouldRepeat));
    var ___r1;
}
,["CPTimer","CPTimeInterval","Function","BOOL"])]);
}var CPTimersTimeoutID = 1000,
    CPTimersForTimeoutIDs = {};
var _CPTimerBridgeTimer = function(codeOrFunction, aDelay, shouldRepeat, functionArgs)
{
    var timeoutID = CPTimersTimeoutID++,
        theFunction = nil;
    if (typeof codeOrFunction === "string")
    {
        theFunction = function()
        {
            (new Function(codeOrFunction))();
            if (!shouldRepeat)
                CPTimersForTimeoutIDs[timeoutID] = nil;
        };
    }
    else
    {
        if (!functionArgs)
            functionArgs = [];
        theFunction = function()
        {
            codeOrFunction.apply(window, functionArgs);
            if (!shouldRepeat)
                CPTimersForTimeoutIDs[timeoutID] = nil;
        };
    }
    aDelay = aDelay | 0.0;
    CPTimersForTimeoutIDs[timeoutID] = CPTimer.isa.objj_msgSend3(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", aDelay / 1000, theFunction, shouldRepeat);
    return timeoutID;
};
if (typeof window !== 'undefined')
{
    window.setTimeout = function(codeOrFunction, aDelay)
    {
        return _CPTimerBridgeTimer(codeOrFunction, aDelay, NO, Array.prototype.slice.apply(arguments, [2]));
    };
    window.clearTimeout = function(aTimeoutID)
    {
        var timer = CPTimersForTimeoutIDs[aTimeoutID];
        if (timer)
            (timer == null ? null : timer.isa.objj_msgSend0(timer, "invalidate"));
        CPTimersForTimeoutIDs[aTimeoutID] = nil;
    };
    window.setInterval = function(codeOrFunction, aDelay, functionArgs)
    {
        return _CPTimerBridgeTimer(codeOrFunction, aDelay, YES, Array.prototype.slice.apply(arguments, [2]));
    };
    window.clearInterval = function(aTimeoutID)
    {
        window.clearTimeout(aTimeoutID);
    };
}