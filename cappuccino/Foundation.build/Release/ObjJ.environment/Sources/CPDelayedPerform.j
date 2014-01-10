@STATIC;1.0;i;10;CPObject.ji;11;CPRunLoop.ji;10;CPString.jt;6006;objj_executeFile("CPObject.j", YES);objj_executeFile("CPRunLoop.j", YES);objj_executeFile("CPString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPDelayedPerform"),
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
        objj_msgSend(self._object, "performSelector:withObject:", self._selector, self._argument);
    }
    catch(ex)     {
        CPLog("exception %@ raised during delayed perform", ex);
    }}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("delayedPerformWithObject:selector:argument:"), function $CPDelayedPerform__delayedPerformWithObject_selector_argument_(self, _cmd, anObject, aSelector, anArgument)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObject:selector:argument:", anObject, aSelector, anArgument);
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
        for (var i = 0, count = objj_msgSend(timersForMode, "count"); i < count; i++)
        {
            var aTimer = objj_msgSend(timersForMode, "objectAtIndex:", i),
                userInfo = objj_msgSend(aTimer, "userInfo");
            if (objj_msgSend(userInfo, "isKindOfClass:", CPDelayedPerform) && objj_msgSend(userInfo, "isEqualToPerform:", aDelayedPerform))
                objj_msgSend(aTimer, "invalidate");
        }
    }
}
,["void","CPDelayedPerform"])]);
}{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("performSelector:withObject:afterDelay:"), function $CPObject__performSelector_withObject_afterDelay_(self, _cmd, selector, object, delay)
{
    objj_msgSend(objj_msgSend(self, "class"), "object:performSelector:withObject:afterDelay:inModes:", self, selector, object, delay, objj_msgSend(CPArray, "arrayWithObject:", CPDefaultRunLoopMode));
}
,["void","SEL","id","CPTimeInterval"]), new objj_method(sel_getUid("performSelector:withObject:afterDelay:inModes:"), function $CPObject__performSelector_withObject_afterDelay_inModes_(self, _cmd, selector, object, delay, modes)
{
    objj_msgSend(objj_msgSend(self, "class"), "object:performSelector:withObject:afterDelay:inModes:", self, selector, object, delay, modes);
}
,["void","SEL","id","CPTimeInterval","CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("cancelPreviousPerformRequestsWithTarget:selector:object:"), function $CPObject__cancelPreviousPerformRequestsWithTarget_selector_object_(self, _cmd, target, selector, argument)
{
    var aDelayedPerform = objj_msgSend(CPDelayedPerform, "delayedPerformWithObject:selector:argument:", target, selector, argument);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "invalidateTimerWithDelayedPerform:", aDelayedPerform);
}
,["void","id","SEL","id"]), new objj_method(sel_getUid("cancelPreviousPerformRequestsWithTarget:"), function $CPObject__cancelPreviousPerformRequestsWithTarget_(self, _cmd, target)
{
    var aDelayedPerform = objj_msgSend(CPDelayedPerform, "delayedPerformWithObject:selector:argument:", target, NULL, nil);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "invalidateTimerWithDelayedPerform:", aDelayedPerform);
}
,["void","id"]), new objj_method(sel_getUid("_delayedPerform:"), function $CPObject___delayedPerform_(self, _cmd, aTimer)
{
    var aDelayedPerform = objj_msgSend(aTimer, "userInfo");
    objj_msgSend(aDelayedPerform, "perform");
}
,["void","CPTimer"]), new objj_method(sel_getUid("object:performSelector:withObject:afterDelay:inModes:"), function $CPObject__object_performSelector_withObject_afterDelay_inModes_(self, _cmd, object, selector, argument, delay, modes)
{
    var aDelayedPerform = objj_msgSend(CPDelayedPerform, "delayedPerformWithObject:selector:argument:", object, selector, argument),
        aTimer = objj_msgSend(CPTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", delay, objj_msgSend(CPObject, "class"), sel_getUid("_delayedPerform:"), aDelayedPerform, NO);
    for (var i = 0, count = objj_msgSend(modes, "count"); i < count; i++)
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "addTimer:forMode:", aTimer, objj_msgSend(modes, "objectAtIndex:", i));
}
,["void","id","SEL","id","CPTimeInterval","CPArray"])]);
}