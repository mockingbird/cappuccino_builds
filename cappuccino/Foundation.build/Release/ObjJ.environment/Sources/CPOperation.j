@STATIC;1.0;i;9;CPArray.ji;10;CPObject.jt;6652;objj_executeFile("CPArray.j", YES);objj_executeFile("CPObject.j", YES);CPOperationQueuePriorityVeryLow = -8;
CPOperationQueuePriorityLow = -4;
CPOperationQueuePriorityNormal = 0;
CPOperationQueuePriorityHigh = 4;
CPOperationQueuePriorityVeryHigh = 8;
{var the_class = objj_allocateClassPair(CPObject, "CPOperation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("operations"), new objj_ivar("_cancelled"), new objj_ivar("_executing"), new objj_ivar("_finished"), new objj_ivar("_ready"), new objj_ivar("_queuePriority"), new objj_ivar("_completionFunction"), new objj_ivar("_dependencies")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("main"), function $CPOperation__main(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("init"), function $CPOperation__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOperation").super_class }, "init");
    if (self)
    {
        self._cancelled = NO;
        self._executing = NO;
        self._finished = NO;
        self._ready = YES;
        self._dependencies = ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        self._queuePriority = CPOperationQueuePriorityNormal;
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("start"), function $CPOperation__start(self, _cmd)
{
    if (!self._cancelled)
    {
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "isExecuting");
        self._executing = YES;
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "isExecuting");
        self.isa.objj_msgSend0(self, "main");
        if (self._completionFunction)
        {
            self._completionFunction();
        }
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "isExecuting");
        self._executing = NO;
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "isExecuting");
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "isFinished");
        self._finished = YES;
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "isFinished");
    }
}
,["void"]), new objj_method(sel_getUid("isCancelled"), function $CPOperation__isCancelled(self, _cmd)
{
    return self._cancelled;
}
,["BOOL"]), new objj_method(sel_getUid("isExecuting"), function $CPOperation__isExecuting(self, _cmd)
{
    return self._executing;
}
,["BOOL"]), new objj_method(sel_getUid("isFinished"), function $CPOperation__isFinished(self, _cmd)
{
    return self._finished;
}
,["BOOL"]), new objj_method(sel_getUid("isConcurrent"), function $CPOperation__isConcurrent(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("isReady"), function $CPOperation__isReady(self, _cmd)
{
    return self._ready;
}
,["BOOL"]), new objj_method(sel_getUid("completionFunction"), function $CPOperation__completionFunction(self, _cmd)
{
    return self._completionFunction;
}
,["JSObject"]), new objj_method(sel_getUid("setCompletionFunction:"), function $CPOperation__setCompletionFunction_(self, _cmd, aJavaScriptFunction)
{
    self._completionFunction = aJavaScriptFunction;
}
,["void","JSObject"]), new objj_method(sel_getUid("addDependency:"), function $CPOperation__addDependency_(self, _cmd, anOperation)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "dependencies");
    (anOperation == null ? null : anOperation.isa.objj_msgSend(anOperation, "addObserver:forKeyPath:options:context:", self, "isFinished", CPKeyValueObservingOptionNew, NULL));
    ((___r1 = self._dependencies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", anOperation));
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "dependencies");
    self.isa.objj_msgSend0(self, "_updateIsReadyState");
    var ___r1;
}
,["void","CPOperation"]), new objj_method(sel_getUid("removeDependency:"), function $CPOperation__removeDependency_(self, _cmd, anOperation)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "dependencies");
    ((___r1 = self._dependencies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", anOperation));
    (anOperation == null ? null : anOperation.isa.objj_msgSend2(anOperation, "removeObserver:forKeyPath:", self, "isFinished"));
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "dependencies");
    self.isa.objj_msgSend0(self, "_updateIsReadyState");
    var ___r1;
}
,["void","CPOperation"]), new objj_method(sel_getUid("dependencies"), function $CPOperation__dependencies(self, _cmd)
{
    return self._dependencies;
}
,["CPArray"]), new objj_method(sel_getUid("waitUntilFinished"), function $CPOperation__waitUntilFinished(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("cancel"), function $CPOperation__cancel(self, _cmd)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "isCancelled");
    self._cancelled = YES;
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "isCancelled");
}
,["void"]), new objj_method(sel_getUid("setQueuePriority:"), function $CPOperation__setQueuePriority_(self, _cmd, priority)
{
    self._queuePriority = priority;
}
,["void","int"]), new objj_method(sel_getUid("queuePriority"), function $CPOperation__queuePriority(self, _cmd)
{
    return self._queuePriority;
}
,["int"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPOperation__observeValueForKeyPath_ofObject_change_context_(self, _cmd, keyPath, object, change, context)
{
    if (keyPath == "isFinished")
    {
        self.isa.objj_msgSend0(self, "_updateIsReadyState");
    }
}
,["void","CPString","id","CPDictionary","void"]), new objj_method(sel_getUid("_updateIsReadyState"), function $CPOperation___updateIsReadyState(self, _cmd)
{
    var newReady = YES;
    if (self._dependencies && ((___r1 = self._dependencies), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
    {
        var i = 0;
        for (i = 0; i < ((___r1 = self._dependencies), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")); i++)
        {
            if (!((___r1 = ((___r2 = self._dependencies), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", i))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isFinished")))
            {
                newReady = NO;
            }
        }
    }
    if (newReady != self._ready)
    {
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "isReady");
        self._ready = newReady;
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "isReady");
    }
    var ___r1, ___r2;
}
,["void"])]);
}