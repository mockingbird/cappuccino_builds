@STATIC;1.0;i;9;CPArray.ji;8;CPDate.ji;10;CPObject.ji;10;CPString.jt;12156;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDate.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);CPDefaultRunLoopMode = "CPDefaultRunLoopMode";
_CPRunLoopPerformCompare = function(lhs, rhs)
{
    return (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "order")) - (lhs == null ? null : lhs.isa.objj_msgSend0(lhs, "order"));
}
var _CPRunLoopPerformPool = [],
    _CPRunLoopPerformPoolCapacity = 5;
{var the_class = objj_allocateClassPair(CPObject, "_CPRunLoopPerform"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_target"), new objj_ivar("_selector"), new objj_ivar("_argument"), new objj_ivar("_order"), new objj_ivar("_runLoopModes"), new objj_ivar("_isValid")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithSelector:target:argument:order:modes:"), function $_CPRunLoopPerform__initWithSelector_target_argument_order_modes_(self, _cmd, aSelector, aTarget, anArgument, anOrder, modes)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRunLoopPerform").super_class }, "init");
    if (self)
    {
        self._selector = aSelector;
        self._target = aTarget;
        self._argument = anArgument;
        self._order = anOrder;
        self._runLoopModes = modes;
        self._isValid = YES;
    }
    return self;
}
,["id","SEL","SEL","id","unsigned","CPArray"]), new objj_method(sel_getUid("selector"), function $_CPRunLoopPerform__selector(self, _cmd)
{
    return self._selector;
}
,["SEL"]), new objj_method(sel_getUid("target"), function $_CPRunLoopPerform__target(self, _cmd)
{
    return self._target;
}
,["id"]), new objj_method(sel_getUid("argument"), function $_CPRunLoopPerform__argument(self, _cmd)
{
    return self._argument;
}
,["id"]), new objj_method(sel_getUid("order"), function $_CPRunLoopPerform__order(self, _cmd)
{
    return self._order;
}
,["unsigned"]), new objj_method(sel_getUid("fireInMode:"), function $_CPRunLoopPerform__fireInMode_(self, _cmd, aRunLoopMode)
{
    if (!self._isValid)
        return YES;
    if (((___r1 = self._runLoopModes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", aRunLoopMode)))
    {
        ((___r1 = self._target), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", self._selector, self._argument));
        return YES;
    }
    return NO;
    var ___r1;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("invalidate"), function $_CPRunLoopPerform__invalidate(self, _cmd)
{
    self._isValid = NO;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_poolPerform:"), function $_CPRunLoopPerform___poolPerform_(self, _cmd, aPerform)
{
    if (!aPerform || _CPRunLoopPerformPool.length >= _CPRunLoopPerformPoolCapacity)
        return;
    _CPRunLoopPerformPool.push(aPerform);
}
,["void","_CPRunLoopPerform"]), new objj_method(sel_getUid("performWithSelector:target:argument:order:modes:"), function $_CPRunLoopPerform__performWithSelector_target_argument_order_modes_(self, _cmd, aSelector, aTarget, anArgument, anOrder, modes)
{
    if (_CPRunLoopPerformPool.length)
    {
        var perform = _CPRunLoopPerformPool.pop();
        perform._target = aTarget;
        perform._selector = aSelector;
        perform._argument = anArgument;
        perform._order = anOrder;
        perform._runLoopModes = modes;
        perform._isValid = YES;
        return perform;
    }
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithSelector:target:argument:order:modes:", aSelector, aTarget, anArgument, anOrder, modes));
    var ___r1;
}
,["_CPRunLoopPerform","SEL","id","id","unsigned","CPArray"])]);
}var CPRunLoopLastNativeRunLoop = 0;
{var the_class = objj_allocateClassPair(CPObject, "CPRunLoop"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_runLoopLock"), new objj_ivar("_timersForModes"), new objj_ivar("_nativeTimersForModes"), new objj_ivar("_nextTimerFireDatesForModes"), new objj_ivar("_didAddTimer"), new objj_ivar("_effectiveDate"), new objj_ivar("_orderedPerforms"), new objj_ivar("_runLoopInsuranceTimer")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPRunLoop__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRunLoop").super_class }, "init");
    if (self)
    {
        self._orderedPerforms = [];
        self._timersForModes = {};
        self._nativeTimersForModes = {};
        self._nextTimerFireDatesForModes = {};
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("performSelector:target:argument:order:modes:"), function $CPRunLoop__performSelector_target_argument_order_modes_(self, _cmd, aSelector, aTarget, anArgument, anOrder, modes)
{
    var perform = _CPRunLoopPerform.isa.objj_msgSend(_CPRunLoopPerform, "performWithSelector:target:argument:order:modes:", aSelector, aTarget, anArgument, anOrder, modes),
        count = self._orderedPerforms.length;
    while (count--)
        if (anOrder < ((___r1 = self._orderedPerforms[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "order")))
            break;
    self._orderedPerforms.splice(count + 1, 0, perform);
    var ___r1;
}
,["void","SEL","id","id","int","CPArray"]), new objj_method(sel_getUid("cancelPerformSelector:target:argument:"), function $CPRunLoop__cancelPerformSelector_target_argument_(self, _cmd, aSelector, aTarget, anArgument)
{
    var count = self._orderedPerforms.length;
    while (count--)
    {
        var perform = self._orderedPerforms[count];
        if ((perform == null ? null : perform.isa.objj_msgSend0(perform, "selector")) === aSelector && (perform == null ? null : perform.isa.objj_msgSend0(perform, "target")) == aTarget && (perform == null ? null : perform.isa.objj_msgSend0(perform, "argument")) == anArgument)
            ((___r1 = self._orderedPerforms[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
    }
    var ___r1;
}
,["void","SEL","id","id"]), new objj_method(sel_getUid("performSelectors"), function $CPRunLoop__performSelectors(self, _cmd)
{
    self.isa.objj_msgSend1(self, "limitDateForMode:", CPDefaultRunLoopMode);
}
,["void"]), new objj_method(sel_getUid("addTimer:forMode:"), function $CPRunLoop__addTimer_forMode_(self, _cmd, aTimer, aMode)
{
    if (self._timersForModes[aMode])
        self._timersForModes[aMode].push(aTimer);
    else
        self._timersForModes[aMode] = [aTimer];
    self._didAddTimer = YES;
    if (!aTimer._lastNativeRunLoopsForModes)
        aTimer._lastNativeRunLoopsForModes = {};
    aTimer._lastNativeRunLoopsForModes[aMode] = CPRunLoopLastNativeRunLoop;
    if (((___r1 = CFBundle.environments()), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", "Browser")) !== CPNotFound)
    {
        if (!self._runLoopInsuranceTimer)
            self._runLoopInsuranceTimer = window.setNativeTimeout(function()
            {
                self.isa.objj_msgSend1(self, "limitDateForMode:", CPDefaultRunLoopMode);
            }, 0);
    }
    var ___r1;
}
,["void","CPTimer","CPString"]), new objj_method(sel_getUid("limitDateForMode:"), function $CPRunLoop__limitDateForMode_(self, _cmd, aMode)
{
    if (self._runLoopLock)
        return;
    self._runLoopLock = YES;
    if (((___r1 = CFBundle.environments()), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", "Browser")) !== CPNotFound)
    {
        if (self._runLoopInsuranceTimer)
        {
            window.clearNativeTimeout(self._runLoopInsuranceTimer);
            self._runLoopInsuranceTimer = nil;
        }
    }
    var now = self._effectiveDate ? ((___r1 = self._effectiveDate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "laterDate:", CPDate.isa.objj_msgSend0(CPDate, "date"))) : CPDate.isa.objj_msgSend0(CPDate, "date"),
        nextFireDate = nil,
        nextTimerFireDate = self._nextTimerFireDatesForModes[aMode];
    if (self._didAddTimer || nextTimerFireDate && nextTimerFireDate <= now)
    {
        self._didAddTimer = NO;
        if (self._nativeTimersForModes[aMode] !== nil)
        {
            window.clearNativeTimeout(self._nativeTimersForModes[aMode]);
            self._nativeTimersForModes[aMode] = nil;
        }
        var timers = self._timersForModes[aMode],
            index = timers.length;
        self._timersForModes[aMode] = nil;
        var hasNativeTimers = ((___r1 = CFBundle.environments()), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", "Browser")) !== CPNotFound;
        while (index--)
        {
            var timer = timers[index];
            if ((!hasNativeTimers || timer._lastNativeRunLoopsForModes[aMode] < CPRunLoopLastNativeRunLoop) && timer._isValid && timer._fireDate <= now)
                (timer == null ? null : timer.isa.objj_msgSend0(timer, "fire"));
            if (timer._isValid)
                nextFireDate = nextFireDate === nil ? timer._fireDate : (nextFireDate == null ? null : nextFireDate.isa.objj_msgSend1(nextFireDate, "earlierDate:", timer._fireDate));
            else
            {
                timer._lastNativeRunLoopsForModes[aMode] = 0;
                timers.splice(index, 1);
            }
        }
        var newTimers = self._timersForModes[aMode];
        if (newTimers && newTimers.length)
        {
            index = newTimers.length;
            while (index--)
            {
                var timer = newTimers[index];
                if ((timer == null ? null : timer.isa.objj_msgSend0(timer, "isValid")))
                    nextFireDate = nextFireDate === nil ? timer._fireDate : (nextFireDate == null ? null : nextFireDate.isa.objj_msgSend1(nextFireDate, "earlierDate:", timer._fireDate));
                else
                    newTimers.splice(index, 1);
            }
            self._timersForModes[aMode] = newTimers.concat(timers);
        }
        else
            self._timersForModes[aMode] = timers;
        self._nextTimerFireDatesForModes[aMode] = nextFireDate;
        if (self._nextTimerFireDatesForModes[aMode] !== nil)
            self._nativeTimersForModes[aMode] = window.setNativeTimeout(function()
            {
                self._effectiveDate = nextFireDate;
                self._nativeTimersForModes[aMode] = nil;
                ++CPRunLoopLastNativeRunLoop;
                self.isa.objj_msgSend1(self, "limitDateForMode:", aMode);
                self._effectiveDate = nil;
            }, MAX(0, (nextFireDate == null ? null : nextFireDate.isa.objj_msgSend0(nextFireDate, "timeIntervalSinceNow")) * 1000));
    }
    var performs = self._orderedPerforms,
        index = performs.length;
    self._orderedPerforms = [];
    while (index--)
    {
        var perform = performs[index];
        if ((perform == null ? null : perform.isa.objj_msgSend1(perform, "fireInMode:", CPDefaultRunLoopMode)))
        {
            _CPRunLoopPerform.isa.objj_msgSend1(_CPRunLoopPerform, "_poolPerform:", perform);
            performs.splice(index, 1);
        }
    }
    if (self._orderedPerforms.length)
    {
        self._orderedPerforms = self._orderedPerforms.concat(performs);
        self._orderedPerforms.sort(_CPRunLoopPerformCompare);
    }
    else
        self._orderedPerforms = performs;
    self._runLoopLock = NO;
    return nextFireDate;
    var ___r1;
}
,["CPDate","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPRunLoop__initialize(self, _cmd)
{
    if (self !== CPRunLoop.isa.objj_msgSend0(CPRunLoop, "class"))
        return;
    CPMainRunLoop = ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("currentRunLoop"), function $CPRunLoop__currentRunLoop(self, _cmd)
{
    return CPMainRunLoop;
}
,["CPRunLoop"]), new objj_method(sel_getUid("mainRunLoop"), function $CPRunLoop__mainRunLoop(self, _cmd)
{
    return CPMainRunLoop;
}
,["CPRunLoop"])]);
}