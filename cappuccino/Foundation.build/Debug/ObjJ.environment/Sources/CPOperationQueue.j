@STATIC;1.0;i;9;CPArray.ji;21;CPFunctionOperation.ji;23;CPInvocationOperation.ji;10;CPObject.ji;13;CPOperation.ji;10;CPString.ji;9;CPTimer.jt;7808;objj_executeFile("CPArray.j", YES);objj_executeFile("CPFunctionOperation.j", YES);objj_executeFile("CPInvocationOperation.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPOperation.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPTimer.j", YES);var cpOperationMainQueue = nil;
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
        self._operations = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        self._suspended = NO;
        self._timer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.01, self, sel_getUid("_runNextOpsInQueue"), nil, YES);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("_runNextOpsInQueue"), function $CPOperationQueue___runNextOpsInQueue(self, _cmd)
{
    if (!self._suspended && objj_msgSend(self, "operationCount") > 0)
    {
        var i = 0,
            count = objj_msgSend(self._operations, "count");
        for (; i < count; i++)
        {
            var op = objj_msgSend(self._operations, "objectAtIndex:", i);
            if (objj_msgSend(op, "isReady") && !objj_msgSend(op, "isCancelled") && !objj_msgSend(op, "isFinished") && !objj_msgSend(op, "isExecuting"))
            {
                objj_msgSend(op, "start");
            }
        }
    }
}
,["void"]), new objj_method(sel_getUid("_enableTimer:"), function $CPOperationQueue___enableTimer_(self, _cmd, enable)
{
    if (!enable)
    {
        if (self._timer)
        {
            objj_msgSend(self._timer, "invalidate");
            self._timer = nil;
        }
    }
    else
    {
        if (!self._timer)
        {
            self._timer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.01, self, sel_getUid("_runNextOpsInQueue"), nil, YES);
        }
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("addOperation:"), function $CPOperationQueue__addOperation_(self, _cmd, anOperation)
{
    objj_msgSend(self, "willChangeValueForKey:", "operations");
    objj_msgSend(self, "willChangeValueForKey:", "operationCount");
    objj_msgSend(self._operations, "addObject:", anOperation);
    objj_msgSend(self, "_sortOpsByPriority:", self._operations);
    objj_msgSend(self, "didChangeValueForKey:", "operations");
    objj_msgSend(self, "didChangeValueForKey:", "operationCount");
}
,["void","CPOperation"]), new objj_method(sel_getUid("addOperations:waitUntilFinished:"), function $CPOperationQueue__addOperations_waitUntilFinished_(self, _cmd, ops, wait)
{
    if (ops)
    {
        if (wait)
        {
            objj_msgSend(self, "_sortOpsByPriority:", ops);
            objj_msgSend(self, "_runOpsSynchronously:", ops);
        }
        objj_msgSend(self._operations, "addObjectsFromArray:", ops);
        objj_msgSend(self, "_sortOpsByPriority:", self._operations);
    }
}
,["void","CPArray","BOOL"]), new objj_method(sel_getUid("addOperationWithFunction:"), function $CPOperationQueue__addOperationWithFunction_(self, _cmd, aFunction)
{
    objj_msgSend(self, "addOperation:", objj_msgSend(CPFunctionOperation, "functionOperationWithFunction:", aFunction));
}
,["void","JSObject"]), new objj_method(sel_getUid("operations"), function $CPOperationQueue__operations(self, _cmd)
{
    return self._operations;
}
,["CPArray"]), new objj_method(sel_getUid("operationCount"), function $CPOperationQueue__operationCount(self, _cmd)
{
    if (self._operations)
    {
        return objj_msgSend(self._operations, "count");
    }
    return 0;
}
,["int"]), new objj_method(sel_getUid("cancelAllOperations"), function $CPOperationQueue__cancelAllOperations(self, _cmd)
{
    if (self._operations)
    {
        var i = 0,
            count = objj_msgSend(self._operations, "count");
        for (; i < count; i++)
        {
            objj_msgSend(objj_msgSend(self._operations, "objectAtIndex:", i), "cancel");
        }
    }
}
,["void"]), new objj_method(sel_getUid("waitUntilAllOperationsAreFinished"), function $CPOperationQueue__waitUntilAllOperationsAreFinished(self, _cmd)
{
    objj_msgSend(self, "_enableTimer:", NO);
    objj_msgSend(self, "_runOpsSynchronously:", self._operations);
    if (!self._suspended)
    {
        objj_msgSend(self, "_enableTimer:", YES);
    }
}
,["void"]), new objj_method(sel_getUid("maxConcurrentOperationCount"), function $CPOperationQueue__maxConcurrentOperationCount(self, _cmd)
{
    return 1;
}
,["int"]), new objj_method(sel_getUid("setSuspended:"), function $CPOperationQueue__setSuspended_(self, _cmd, suspend)
{
    self._suspended = suspend;
    objj_msgSend(self, "_enableTimer:", !suspend);
}
,["void","BOOL"]), new objj_method(sel_getUid("isSuspended"), function $CPOperationQueue__isSuspended(self, _cmd)
{
    return self._suspended;
}
,["BOOL"]), new objj_method(sel_getUid("_sortOpsByPriority:"), function $CPOperationQueue___sortOpsByPriority_(self, _cmd, someOps)
{
    if (someOps)
    {
        objj_msgSend(someOps, "sortUsingFunction:context:", function(lhs, rhs)
        {
            if (objj_msgSend(lhs, "queuePriority") < objj_msgSend(rhs, "queuePriority"))
            {
                return 1;
            }
            else
            {
                if (objj_msgSend(lhs, "queuePriority") > objj_msgSend(rhs, "queuePriority"))
                {
                    return -1;
                }
                else
                {
                    return 0;
                }
            }
        }, nil);
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
                count = objj_msgSend(ops, "count");
            keepGoing = NO;
            for (; i < count; i++)
            {
                var op = objj_msgSend(ops, "objectAtIndex:", i);
                if (objj_msgSend(op, "isReady") && !objj_msgSend(op, "isCancelled") && !objj_msgSend(op, "isFinished") && !objj_msgSend(op, "isExecuting"))
                {
                    objj_msgSend(op, "start");
                }
            }
            for (i = 0; i < count; i++)
            {
                var op = objj_msgSend(ops, "objectAtIndex:", i);
                if (!objj_msgSend(op, "isFinished") && !objj_msgSend(op, "isCancelled"))
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
        cpOperationMainQueue = objj_msgSend(objj_msgSend(CPOperationQueue, "alloc"), "init");
        objj_msgSend(cpOperationMainQueue, "setName:", "main");
    }
    return cpOperationMainQueue;
}
,["CPOperationQueue"]), new objj_method(sel_getUid("currentQueue"), function $CPOperationQueue__currentQueue(self, _cmd)
{
    return objj_msgSend(CPOperationQueue, "mainQueue");
}
,["CPOperationQueue"])]);
}