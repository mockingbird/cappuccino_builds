@STATIC;1.0;i;9;CPArray.ji;21;CPFunctionOperation.ji;23;CPInvocationOperation.ji;10;CPObject.ji;13;CPOperation.ji;10;CPString.ji;9;CPTimer.jt;9454;objj_executeFile("CPArray.j", YES);objj_executeFile("CPFunctionOperation.j", YES);objj_executeFile("CPInvocationOperation.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPOperation.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPTimer.j", YES);var cpOperationMainQueue = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPOperationQueue"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_operations"), new objj_ivar("_suspended"), new objj_ivar("_name"), new objj_ivar("_timer")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("name"), function $CPOperationQueue__name(self, _cmd)
{
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("setName:"), function $CPOperationQueue__setName_(self, _cmd, newValue)
{
    self._name = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("init"), function $CPOperationQueue__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPOperationQueue").super_class }, "init");
    if (self)
    {
        self._operations = ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        self._suspended = NO;
        self._timer = CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.01, self, sel_getUid("_runNextOpsInQueue"), nil, YES);
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("_runNextOpsInQueue"), function $CPOperationQueue___runNextOpsInQueue(self, _cmd)
{
    if (!self._suspended && self.isa.objj_msgSend0(self, "operationCount") > 0)
    {
        var i = 0,
            count = ((___r1 = self._operations), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        for (; i < count; i++)
        {
            var op = ((___r1 = self._operations), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i));
            if ((op == null ? null : op.isa.objj_msgSend0(op, "isReady")) && !(op == null ? null : op.isa.objj_msgSend0(op, "isCancelled")) && !(op == null ? null : op.isa.objj_msgSend0(op, "isFinished")) && !(op == null ? null : op.isa.objj_msgSend0(op, "isExecuting")))
            {
                (op == null ? null : op.isa.objj_msgSend0(op, "start"));
            }
        }
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_enableTimer:"), function $CPOperationQueue___enableTimer_(self, _cmd, enable)
{
    if (!enable)
    {
        if (self._timer)
        {
            ((___r1 = self._timer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
            self._timer = nil;
        }
    }
    else
    {
        if (!self._timer)
        {
            self._timer = CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.01, self, sel_getUid("_runNextOpsInQueue"), nil, YES);
        }
    }
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("addOperation:"), function $CPOperationQueue__addOperation_(self, _cmd, anOperation)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "operations");
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "operationCount");
    ((___r1 = self._operations), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", anOperation));
    self.isa.objj_msgSend1(self, "_sortOpsByPriority:", self._operations);
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "operations");
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "operationCount");
    var ___r1;
}
,["void","CPOperation"]), new objj_method(sel_getUid("addOperations:waitUntilFinished:"), function $CPOperationQueue__addOperations_waitUntilFinished_(self, _cmd, ops, wait)
{
    if (ops)
    {
        if (wait)
        {
            self.isa.objj_msgSend1(self, "_sortOpsByPriority:", ops);
            self.isa.objj_msgSend1(self, "_runOpsSynchronously:", ops);
        }
        ((___r1 = self._operations), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObjectsFromArray:", ops));
        self.isa.objj_msgSend1(self, "_sortOpsByPriority:", self._operations);
    }
    var ___r1;
}
,["void","CPArray","BOOL"]), new objj_method(sel_getUid("addOperationWithFunction:"), function $CPOperationQueue__addOperationWithFunction_(self, _cmd, aFunction)
{
    self.isa.objj_msgSend1(self, "addOperation:", CPFunctionOperation.isa.objj_msgSend1(CPFunctionOperation, "functionOperationWithFunction:", aFunction));
}
,["void","JSObject"]), new objj_method(sel_getUid("operations"), function $CPOperationQueue__operations(self, _cmd)
{
    return self._operations;
}
,["CPArray"]), new objj_method(sel_getUid("operationCount"), function $CPOperationQueue__operationCount(self, _cmd)
{
    if (self._operations)
    {
        return ((___r1 = self._operations), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    }
    return 0;
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("cancelAllOperations"), function $CPOperationQueue__cancelAllOperations(self, _cmd)
{
    if (self._operations)
    {
        var i = 0,
            count = ((___r1 = self._operations), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        for (; i < count; i++)
        {
            ((___r1 = ((___r2 = self._operations), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", i))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cancel"));
        }
    }
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("waitUntilAllOperationsAreFinished"), function $CPOperationQueue__waitUntilAllOperationsAreFinished(self, _cmd)
{
    self.isa.objj_msgSend1(self, "_enableTimer:", NO);
    self.isa.objj_msgSend1(self, "_runOpsSynchronously:", self._operations);
    if (!self._suspended)
    {
        self.isa.objj_msgSend1(self, "_enableTimer:", YES);
    }
}
,["void"]), new objj_method(sel_getUid("maxConcurrentOperationCount"), function $CPOperationQueue__maxConcurrentOperationCount(self, _cmd)
{
    return 1;
}
,["int"]), new objj_method(sel_getUid("setSuspended:"), function $CPOperationQueue__setSuspended_(self, _cmd, suspend)
{
    self._suspended = suspend;
    self.isa.objj_msgSend1(self, "_enableTimer:", !suspend);
}
,["void","BOOL"]), new objj_method(sel_getUid("isSuspended"), function $CPOperationQueue__isSuspended(self, _cmd)
{
    return self._suspended;
}
,["BOOL"]), new objj_method(sel_getUid("_sortOpsByPriority:"), function $CPOperationQueue___sortOpsByPriority_(self, _cmd, someOps)
{
    if (someOps)
    {
        (someOps == null ? null : someOps.isa.objj_msgSend2(someOps, "sortUsingFunction:context:", function(lhs, rhs)
        {
            if ((lhs == null ? null : lhs.isa.objj_msgSend0(lhs, "queuePriority")) < (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "queuePriority")))
            {
                return 1;
            }
            else
            {
                if ((lhs == null ? null : lhs.isa.objj_msgSend0(lhs, "queuePriority")) > (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "queuePriority")))
                {
                    return -1;
                }
                else
                {
                    return 0;
                }
            }
        }, nil));
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("_runOpsSynchronously:"), function $CPOperationQueue___runOpsSynchronously_(self, _cmd, ops)
{
    if (ops)
    {
        var keepGoing = YES;
        while (keepGoing)
        {
            var i = 0,
                count = (ops == null ? null : ops.isa.objj_msgSend0(ops, "count"));
            keepGoing = NO;
            for (; i < count; i++)
            {
                var op = (ops == null ? null : ops.isa.objj_msgSend1(ops, "objectAtIndex:", i));
                if ((op == null ? null : op.isa.objj_msgSend0(op, "isReady")) && !(op == null ? null : op.isa.objj_msgSend0(op, "isCancelled")) && !(op == null ? null : op.isa.objj_msgSend0(op, "isFinished")) && !(op == null ? null : op.isa.objj_msgSend0(op, "isExecuting")))
                {
                    (op == null ? null : op.isa.objj_msgSend0(op, "start"));
                }
            }
            for (i = 0; i < count; i++)
            {
                var op = (ops == null ? null : ops.isa.objj_msgSend1(ops, "objectAtIndex:", i));
                if (!(op == null ? null : op.isa.objj_msgSend0(op, "isFinished")) && !(op == null ? null : op.isa.objj_msgSend0(op, "isCancelled")))
                {
                    keepGoing = YES;
                }
            }
        }
    }
}
,["void","CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("mainQueue"), function $CPOperationQueue__mainQueue(self, _cmd)
{
    if (!cpOperationMainQueue)
    {
        cpOperationMainQueue = ((___r1 = CPOperationQueue.isa.objj_msgSend0(CPOperationQueue, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (cpOperationMainQueue == null ? null : cpOperationMainQueue.isa.objj_msgSend1(cpOperationMainQueue, "setName:", "main"));
    }
    return cpOperationMainQueue;
    var ___r1;
}
,["CPOperationQueue"]), new objj_method(sel_getUid("currentQueue"), function $CPOperationQueue__currentQueue(self, _cmd)
{
    return CPOperationQueue.isa.objj_msgSend0(CPOperationQueue, "mainQueue");
}
,["CPOperationQueue"])]);
}