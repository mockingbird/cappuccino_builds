@STATIC;1.0;i;10;CPObject.ji;11;CPRunLoop.ji;10;CPString.jt;7117;objj_executeFile("CPObject.j", YES);objj_executeFile("CPRunLoop.j", YES);objj_executeFile("CPString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPDelayedPerform"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_object"), new objj_ivar("_selector"), new objj_ivar("_argument")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithObject:selector:argument:"), function $CPDelayedPerform__initWithObject_selector_argument_(self, _cmd, anObject, aSelector, anArgument)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDelayedPerform").super_class }, "init"))
    {
        self._object = anObject;
        self._selector = aSelector;
        self._argument = anArgument;
    }
    return self;
}
,["id","id","SEL","id"]), new objj_method(sel_getUid("isEqualToPerform:"), function $CPDelayedPerform__isEqualToPerform_(self, _cmd, anOther)
{
    if (!anOther || !anOther.isa)
        return NO;
    if (self._object !== anOther._object)
        return NO;
    if (!self._selector || !anOther._selector)
        return YES;
    if (self._selector !== anOther._selector)
        return NO;
    if (self._argument !== anOther._argument)
        return NO;
    return YES;
}
,["BOOL","CPDelayedPerform"]), new objj_method(sel_getUid("perform"), function $CPDelayedPerform__perform(self, _cmd)
{
    try    {
        ((___r1 = self._object), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", self._selector, self._argument));
    }
    catch(ex)     {
        CPLog("exception %@ raised during delayed perform", ex);
    }    var ___r1;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("delayedPerformWithObject:selector:argument:"), function $CPDelayedPerform__delayedPerformWithObject_selector_argument_(self, _cmd, anObject, aSelector, anArgument)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithObject:selector:argument:", anObject, aSelector, anArgument));
    var ___r1;
}
,["CPDelayedPerform","id","SEL","id"])]);
}{
var the_class = objj_getClass("CPRunLoop")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPRunLoop\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("invalidateTimerWithDelayedPerform:"), function $CPRunLoop__invalidateTimerWithDelayedPerform_(self, _cmd, aDelayedPerform)
{
    for (var aKey in self._timersForModes)
    {
        if (!self._timersForModes.hasOwnProperty(aKey))
            continue;
        var timersForMode = self._timersForModes[aKey];
        for (var i = 0, count = (timersForMode == null ? null : timersForMode.isa.objj_msgSend0(timersForMode, "count")); i < count; i++)
        {
            var aTimer = (timersForMode == null ? null : timersForMode.isa.objj_msgSend1(timersForMode, "objectAtIndex:", i)),
                userInfo = (aTimer == null ? null : aTimer.isa.objj_msgSend0(aTimer, "userInfo"));
            if ((userInfo == null ? null : userInfo.isa.objj_msgSend1(userInfo, "isKindOfClass:", CPDelayedPerform)) && (userInfo == null ? null : userInfo.isa.objj_msgSend1(userInfo, "isEqualToPerform:", aDelayedPerform)))
                (aTimer == null ? null : aTimer.isa.objj_msgSend0(aTimer, "invalidate"));
        }
    }
}
,["void","CPDelayedPerform"])]);
}{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("performSelector:withObject:afterDelay:"), function $CPObject__performSelector_withObject_afterDelay_(self, _cmd, selector, object, delay)
{
    ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "object:performSelector:withObject:afterDelay:inModes:", self, selector, object, delay, CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", CPDefaultRunLoopMode)));
    var ___r1;
}
,["void","SEL","id","CPTimeInterval"]), new objj_method(sel_getUid("performSelector:withObject:afterDelay:inModes:"), function $CPObject__performSelector_withObject_afterDelay_inModes_(self, _cmd, selector, object, delay, modes)
{
    ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "object:performSelector:withObject:afterDelay:inModes:", self, selector, object, delay, modes));
    var ___r1;
}
,["void","SEL","id","CPTimeInterval","CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("cancelPreviousPerformRequestsWithTarget:selector:object:"), function $CPObject__cancelPreviousPerformRequestsWithTarget_selector_object_(self, _cmd, target, selector, argument)
{
    var aDelayedPerform = CPDelayedPerform.isa.objj_msgSend3(CPDelayedPerform, "delayedPerformWithObject:selector:argument:", target, selector, argument);
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "invalidateTimerWithDelayedPerform:", aDelayedPerform));
    var ___r1;
}
,["void","id","SEL","id"]), new objj_method(sel_getUid("cancelPreviousPerformRequestsWithTarget:"), function $CPObject__cancelPreviousPerformRequestsWithTarget_(self, _cmd, target)
{
    var aDelayedPerform = CPDelayedPerform.isa.objj_msgSend3(CPDelayedPerform, "delayedPerformWithObject:selector:argument:", target, NULL, nil);
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "invalidateTimerWithDelayedPerform:", aDelayedPerform));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_delayedPerform:"), function $CPObject___delayedPerform_(self, _cmd, aTimer)
{
    var aDelayedPerform = (aTimer == null ? null : aTimer.isa.objj_msgSend0(aTimer, "userInfo"));
    (aDelayedPerform == null ? null : aDelayedPerform.isa.objj_msgSend0(aDelayedPerform, "perform"));
}
,["void","CPTimer"]), new objj_method(sel_getUid("object:performSelector:withObject:afterDelay:inModes:"), function $CPObject__object_performSelector_withObject_afterDelay_inModes_(self, _cmd, object, selector, argument, delay, modes)
{
    var aDelayedPerform = CPDelayedPerform.isa.objj_msgSend3(CPDelayedPerform, "delayedPerformWithObject:selector:argument:", object, selector, argument),
        aTimer = (CPTimer == null ? null : CPTimer.isa.objj_msgSend(CPTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", delay, CPObject.isa.objj_msgSend0(CPObject, "class"), sel_getUid("_delayedPerform:"), aDelayedPerform, NO));
    for (var i = 0, count = (modes == null ? null : modes.isa.objj_msgSend0(modes, "count")); i < count; i++)
        ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "addTimer:forMode:", aTimer, (modes == null ? null : modes.isa.objj_msgSend1(modes, "objectAtIndex:", i))));
    var ___r1;
}
,["void","id","SEL","id","CPTimeInterval","CPArray"])]);
}