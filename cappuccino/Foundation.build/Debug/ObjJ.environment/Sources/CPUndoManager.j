@STATIC;1.0;i;9;CPArray.ji;13;CPException.ji;14;CPInvocation.ji;22;CPNotificationCenter.ji;10;CPObject.ji;9;CPProxy.ji;21;CPKeyValueObserving.ji;11;CPRunLoop.jt;30046;objj_executeFile("CPArray.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPInvocation.j", YES);objj_executeFile("CPNotificationCenter.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPProxy.j", YES);objj_executeFile("CPKeyValueObserving.j", YES);objj_executeFile("CPRunLoop.j", YES);var CPUndoManagerNormal = 0,
    CPUndoManagerUndoing = 1,
    CPUndoManagerRedoing = 2;
CPUndoManagerCheckpointNotification = "CPUndoManagerCheckpointNotification";
CPUndoManagerDidOpenUndoGroupNotification = "CPUndoManagerDidOpenUndoGroupNotification";
CPUndoManagerDidCloseUndoGroupNotification = "CPUndoManagerDidCloseUndoGroupNotification";
CPUndoManagerDidRedoChangeNotification = "CPUndoManagerDidRedoChangeNotification";
CPUndoManagerDidUndoChangeNotification = "CPUndoManagerDidUndoChangeNotification";
CPUndoManagerWillCloseUndoGroupNotification = "CPUndoManagerWillCloseUndoGroupNotification";
CPUndoManagerWillRedoChangeNotification = "CPUndoManagerWillRedoChangeNotification";
CPUndoManagerWillUndoChangeNotification = "CPUndoManagerWillUndoChangeNotification";
CPUndoCloseGroupingRunLoopOrdering = 350000;
var _CPUndoGroupingPool = [],
    _CPUndoGroupingPoolCapacity = 5;
{var the_class = objj_allocateClassPair(CPObject, "_CPUndoGrouping"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_parent"), new objj_ivar("_invocations"), new objj_ivar("_actionName")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithParent:"), function $_CPUndoGrouping__initWithParent_(self, _cmd, anUndoGrouping)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPUndoGrouping").super_class }, "init");
    if (self)
    {
        self._parent = anUndoGrouping;
        self._invocations = [];
        self._actionName = "";
    }
    return self;
}
,["id","_CPUndoGrouping"]), new objj_method(sel_getUid("parent"), function $_CPUndoGrouping__parent(self, _cmd)
{
    return self._parent;
}
,["_CPUndoGrouping"]), new objj_method(sel_getUid("addInvocation:"), function $_CPUndoGrouping__addInvocation_(self, _cmd, anInvocation)
{
    self._invocations.push(anInvocation);
}
,["void","CPInvocation"]), new objj_method(sel_getUid("addInvocationsFromArray:"), function $_CPUndoGrouping__addInvocationsFromArray_(self, _cmd, invocations)
{
    ((___r1 = self._invocations), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObjectsFromArray:", invocations));
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("removeInvocationsWithTarget:"), function $_CPUndoGrouping__removeInvocationsWithTarget_(self, _cmd, aTarget)
{
    var index = self._invocations.length;
    while (index--)
        if (((___r1 = self._invocations[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "target")) == aTarget)
            self._invocations.splice(index, 1);
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("invocations"), function $_CPUndoGrouping__invocations(self, _cmd)
{
    return self._invocations;
}
,["CPArray"]), new objj_method(sel_getUid("invoke"), function $_CPUndoGrouping__invoke(self, _cmd)
{
    var index = self._invocations.length;
    while (index--)
        ((___r1 = self._invocations[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invoke"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setActionName:"), function $_CPUndoGrouping__setActionName_(self, _cmd, aName)
{
    self._actionName = aName;
}
,["void","CPString"]), new objj_method(sel_getUid("actionName"), function $_CPUndoGrouping__actionName(self, _cmd)
{
    return self._actionName;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_poolUndoGrouping:"), function $_CPUndoGrouping___poolUndoGrouping_(self, _cmd, anUndoGrouping)
{
    if (!anUndoGrouping || _CPUndoGroupingPool.length >= _CPUndoGroupingPoolCapacity)
        return;
    _CPUndoGroupingPool.push(anUndoGrouping);
}
,["void","_CPUndoGrouping"]), new objj_method(sel_getUid("undoGroupingWithParent:"), function $_CPUndoGrouping__undoGroupingWithParent_(self, _cmd, anUndoGrouping)
{
    if (_CPUndoGroupingPool.length)
    {
        var grouping = _CPUndoGroupingPool.pop();
        grouping._parent = anUndoGrouping;
        if (grouping._invocations.length)
            grouping._invocations = [];
        return grouping;
    }
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithParent:", anUndoGrouping));
    var ___r1;
}
,["id","_CPUndoGrouping"])]);
}var _CPUndoGroupingParentKey = "_CPUndoGroupingParentKey",
    _CPUndoGroupingInvocationsKey = "_CPUndoGroupingInvocationsKey",
    _CPUndoGroupingActionNameKey = "_CPUndoGroupingActionNameKey";
{
var the_class = objj_getClass("_CPUndoGrouping")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPUndoGrouping\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPUndoGrouping__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPUndoGrouping").super_class }, "init");
    if (self)
    {
        self._parent = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPUndoGroupingParentKey));
        self._invocations = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPUndoGroupingInvocationsKey));
        self._actionName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPUndoGroupingActionNameKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPUndoGrouping__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._parent, _CPUndoGroupingParentKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._invocations, _CPUndoGroupingInvocationsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._actionName, _CPUndoGroupingActionNameKey));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPObject, "CPUndoManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_redoStack"), new objj_ivar("_undoStack"), new objj_ivar("_groupsByEvent"), new objj_ivar("_disableCount"), new objj_ivar("_levelsOfUndo"), new objj_ivar("_currentGrouping"), new objj_ivar("_state"), new objj_ivar("_preparedTarget"), new objj_ivar("_undoManagerProxy"), new objj_ivar("_runLoopModes"), new objj_ivar("_registeredWithRunLoop")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPUndoManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUndoManager").super_class }, "init");
    if (self)
    {
        self._redoStack = [];
        self._undoStack = [];
        self._disableCount = 0;
        self._state = CPUndoManagerNormal;
        (self == null ? null : self.isa.objj_msgSend1(self, "setRunLoopModes:", [CPDefaultRunLoopMode]));
        (self == null ? null : self.isa.objj_msgSend1(self, "setGroupsByEvent:", YES));
        self._undoManagerProxy = (_CPUndoManagerProxy == null ? null : _CPUndoManagerProxy.isa.objj_msgSend0(_CPUndoManagerProxy, "alloc"));
        self._undoManagerProxy._undoManager = self;
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("_addUndoInvocation:"), function $CPUndoManager___addUndoInvocation_(self, _cmd, anInvocation)
{
    if (!self._currentGrouping)
        if (self.isa.objj_msgSend0(self, "groupsByEvent"))
            self.isa.objj_msgSend0(self, "_beginUndoGroupingForEvent");
        else
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "No undo group is currently open");
    ((___r1 = self._currentGrouping), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addInvocation:", anInvocation));
    if (self._state === CPUndoManagerNormal)
        ((___r1 = self._redoStack), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    var ___r1;
}
,["void","CPInvocation"]), new objj_method(sel_getUid("registerUndoWithTarget:selector:object:"), function $CPUndoManager__registerUndoWithTarget_selector_object_(self, _cmd, aTarget, aSelector, anObject)
{
    if (self._disableCount > 0)
        return;
    var invocation = CPInvocation.isa.objj_msgSend1(CPInvocation, "invocationWithMethodSignature:", nil);
    (invocation == null ? null : invocation.isa.objj_msgSend1(invocation, "setTarget:", aTarget));
    (invocation == null ? null : invocation.isa.objj_msgSend1(invocation, "setSelector:", aSelector));
    (invocation == null ? null : invocation.isa.objj_msgSend2(invocation, "setArgument:atIndex:", anObject, 2));
    self.isa.objj_msgSend1(self, "_addUndoInvocation:", invocation);
}
,["void","id","SEL","id"]), new objj_method(sel_getUid("prepareWithInvocationTarget:"), function $CPUndoManager__prepareWithInvocationTarget_(self, _cmd, aTarget)
{
    self._preparedTarget = aTarget;
    return self._undoManagerProxy;
}
,["id","id"]), new objj_method(sel_getUid("_methodSignatureOfPreparedTargetForSelector:"), function $CPUndoManager___methodSignatureOfPreparedTargetForSelector_(self, _cmd, aSelector)
{
    if (((___r1 = self._preparedTarget), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", aSelector)))
        return 1;
    return nil;
    var ___r1;
}
,["CPMethodSignature","SEL"]), new objj_method(sel_getUid("_forwardInvocationToPreparedTarget:"), function $CPUndoManager___forwardInvocationToPreparedTarget_(self, _cmd, anInvocation)
{
    if (self._disableCount > 0)
        return;
    (anInvocation == null ? null : anInvocation.isa.objj_msgSend1(anInvocation, "setTarget:", self._preparedTarget));
    self.isa.objj_msgSend1(self, "_addUndoInvocation:", anInvocation);
    self._preparedTarget = nil;
}
,["void","CPInvocation"]), new objj_method(sel_getUid("canRedo"), function $CPUndoManager__canRedo(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self));
    return ((___r1 = self._redoStack), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("canUndo"), function $CPUndoManager__canUndo(self, _cmd)
{
    if (self._undoStack.length > 0)
        return YES;
    return ((___r1 = ((___r2 = self._currentGrouping), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "invocations"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0;
    var ___r1, ___r2;
}
,["BOOL"]), new objj_method(sel_getUid("undo"), function $CPUndoManager__undo(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "groupingLevel") === 1)
        self.isa.objj_msgSend0(self, "endUndoGrouping");
    self.isa.objj_msgSend0(self, "undoNestedGroup");
}
,["void"]), new objj_method(sel_getUid("undoNestedGroup"), function $CPUndoManager__undoNestedGroup(self, _cmd)
{
    if (((___r1 = self._undoStack), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) <= 0)
        return;
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPUndoManagerWillUndoChangeNotification, self));
    var undoGrouping = self._undoStack.pop(),
        actionName = (undoGrouping == null ? null : undoGrouping.isa.objj_msgSend0(undoGrouping, "actionName"));
    self._state = CPUndoManagerUndoing;
    self.isa.objj_msgSend0(self, "_beginUndoGrouping");
    (undoGrouping == null ? null : undoGrouping.isa.objj_msgSend0(undoGrouping, "invoke"));
    self.isa.objj_msgSend0(self, "endUndoGrouping");
    _CPUndoGrouping.isa.objj_msgSend1(_CPUndoGrouping, "_poolUndoGrouping:", undoGrouping);
    self._state = CPUndoManagerNormal;
    ((___r1 = ((___r2 = self._redoStack), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "lastObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setActionName:", actionName));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPUndoManagerDidUndoChangeNotification, self));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("redo"), function $CPUndoManager__redo(self, _cmd)
{
    if (((___r1 = self._redoStack), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) <= 0)
        return;
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPUndoManagerWillRedoChangeNotification, self));
    var oldUndoGrouping = self._currentGrouping,
        undoGrouping = self._redoStack.pop(),
        actionName = (undoGrouping == null ? null : undoGrouping.isa.objj_msgSend0(undoGrouping, "actionName"));
    self._currentGrouping = nil;
    self._state = CPUndoManagerRedoing;
    self.isa.objj_msgSend0(self, "_beginUndoGrouping");
    (undoGrouping == null ? null : undoGrouping.isa.objj_msgSend0(undoGrouping, "invoke"));
    self.isa.objj_msgSend0(self, "endUndoGrouping");
    _CPUndoGrouping.isa.objj_msgSend1(_CPUndoGrouping, "_poolUndoGrouping:", undoGrouping);
    self._currentGrouping = oldUndoGrouping;
    self._state = CPUndoManagerNormal;
    ((___r1 = ((___r2 = self._undoStack), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "lastObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setActionName:", actionName));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPUndoManagerDidRedoChangeNotification, self));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("beginUndoGrouping"), function $CPUndoManager__beginUndoGrouping(self, _cmd)
{
    if (!self._currentGrouping && self.isa.objj_msgSend0(self, "groupsByEvent"))
        self.isa.objj_msgSend0(self, "_beginUndoGroupingForEvent");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self));
    self.isa.objj_msgSend0(self, "_beginUndoGrouping");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_beginUndoGroupingForEvent"), function $CPUndoManager___beginUndoGroupingForEvent(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_beginUndoGrouping");
    self.isa.objj_msgSend0(self, "_registerWithRunLoop");
}
,["void"]), new objj_method(sel_getUid("_beginUndoGrouping"), function $CPUndoManager___beginUndoGrouping(self, _cmd)
{
    self._currentGrouping = _CPUndoGrouping.isa.objj_msgSend1(_CPUndoGrouping, "undoGroupingWithParent:", self._currentGrouping);
}
,["void"]), new objj_method(sel_getUid("endUndoGrouping"), function $CPUndoManager__endUndoGrouping(self, _cmd)
{
    if (!self._currentGrouping)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "endUndoGrouping. No undo group is currently open.");
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self));
    var parent = ((___r1 = self._currentGrouping), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "parent"));
    if (!parent && ((___r1 = self._currentGrouping), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invocations")).length > 0)
    {
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPUndoManagerWillCloseUndoGroupNotification, self));
        var stack = self._state === CPUndoManagerUndoing ? self._redoStack : self._undoStack;
        stack.push(self._currentGrouping);
        if (self._levelsOfUndo > 0 && stack.length > self._levelsOfUndo)
            stack.splice(0, 1);
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPUndoManagerDidCloseUndoGroupNotification, self));
    }
    else
    {
        (parent == null ? null : parent.isa.objj_msgSend1(parent, "addInvocationsFromArray:", ((___r1 = self._currentGrouping), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invocations"))));
        _CPUndoGrouping.isa.objj_msgSend1(_CPUndoGrouping, "_poolUndoGrouping:", self._currentGrouping);
    }
    self._currentGrouping = parent;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("enableUndoRegistration"), function $CPUndoManager__enableUndoRegistration(self, _cmd)
{
    if (self._disableCount <= 0)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "enableUndoRegistration. There are no disable messages in effect right now.");
    self._disableCount--;
}
,["void"]), new objj_method(sel_getUid("groupsByEvent"), function $CPUndoManager__groupsByEvent(self, _cmd)
{
    return self._groupsByEvent;
}
,["BOOL"]), new objj_method(sel_getUid("setGroupsByEvent:"), function $CPUndoManager__setGroupsByEvent_(self, _cmd, aFlag)
{
    aFlag = !!aFlag;
    if (self._groupsByEvent === aFlag)
        return;
    self._groupsByEvent = aFlag;
    if (!self.isa.objj_msgSend0(self, "groupsByEvent"))
        self.isa.objj_msgSend0(self, "_unregisterWithRunLoop");
}
,["void","BOOL"]), new objj_method(sel_getUid("groupingLevel"), function $CPUndoManager__groupingLevel(self, _cmd)
{
    var grouping = self._currentGrouping,
        level = self._currentGrouping ? 1 : 0;
    while (grouping = (grouping == null ? null : grouping.isa.objj_msgSend0(grouping, "parent")))
        ++level;
    return level;
}
,["unsigned"]), new objj_method(sel_getUid("disableUndoRegistration"), function $CPUndoManager__disableUndoRegistration(self, _cmd)
{
    ++self._disableCount;
}
,["void"]), new objj_method(sel_getUid("isUndoRegistrationEnabled"), function $CPUndoManager__isUndoRegistrationEnabled(self, _cmd)
{
    return self._disableCount == 0;
}
,["BOOL"]), new objj_method(sel_getUid("isUndoing"), function $CPUndoManager__isUndoing(self, _cmd)
{
    return self._state === CPUndoManagerUndoing;
}
,["BOOL"]), new objj_method(sel_getUid("isRedoing"), function $CPUndoManager__isRedoing(self, _cmd)
{
    return self._state === CPUndoManagerRedoing;
}
,["BOOL"]), new objj_method(sel_getUid("removeAllActions"), function $CPUndoManager__removeAllActions(self, _cmd)
{
    while (self._currentGrouping)
        self.isa.objj_msgSend0(self, "endUndoGrouping");
    self.isa.objj_msgSend0(self, "_unregisterWithRunLoop");
    self._state = CPUndoManagerNormal;
    self._redoStack = [];
    self._undoStack = [];
    self._disableCount = 0;
}
,["void"]), new objj_method(sel_getUid("removeAllActionsWithTarget:"), function $CPUndoManager__removeAllActionsWithTarget_(self, _cmd, aTarget)
{
    ((___r1 = self._currentGrouping), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeInvocationsWithTarget:", aTarget));
    var index = self._redoStack.length;
    while (index--)
    {
        var grouping = self._redoStack[index];
        (grouping == null ? null : grouping.isa.objj_msgSend1(grouping, "removeInvocationsWithTarget:", aTarget));
        if (!(grouping == null ? null : grouping.isa.objj_msgSend0(grouping, "invocations")).length)
            self._redoStack.splice(index, 1);
    }
    index = self._undoStack.length;
    while (index--)
    {
        var grouping = self._undoStack[index];
        (grouping == null ? null : grouping.isa.objj_msgSend1(grouping, "removeInvocationsWithTarget:", aTarget));
        if (!(grouping == null ? null : grouping.isa.objj_msgSend0(grouping, "invocations")).length)
            self._undoStack.splice(index, 1);
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setActionName:"), function $CPUndoManager__setActionName_(self, _cmd, anActionName)
{
    if (anActionName !== nil && self._currentGrouping)
        ((___r1 = self._currentGrouping), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setActionName:", anActionName));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("redoActionName"), function $CPUndoManager__redoActionName(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "canRedo"))
        return nil;
    return ((___r1 = ((___r2 = self._redoStack), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "lastObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "actionName"));
    var ___r1, ___r2;
}
,["CPString"]), new objj_method(sel_getUid("redoMenuItemTitle"), function $CPUndoManager__redoMenuItemTitle(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "redoMenuTitleForUndoActionName:", self.isa.objj_msgSend0(self, "redoActionName"));
}
,["CPString"]), new objj_method(sel_getUid("redoMenuTitleForUndoActionName:"), function $CPUndoManager__redoMenuTitleForUndoActionName_(self, _cmd, anActionName)
{
    if (anActionName || anActionName === 0)
        return "Redo " + anActionName;
    return "Redo";
}
,["CPString","CPString"]), new objj_method(sel_getUid("undoActionName"), function $CPUndoManager__undoActionName(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "canUndo"))
        return nil;
    return ((___r1 = ((___r2 = self._undoStack), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "lastObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "actionName"));
    var ___r1, ___r2;
}
,["CPString"]), new objj_method(sel_getUid("undoMenuItemTitle"), function $CPUndoManager__undoMenuItemTitle(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "undoMenuTitleForUndoActionName:", self.isa.objj_msgSend0(self, "undoActionName"));
}
,["CPString"]), new objj_method(sel_getUid("undoMenuTitleForUndoActionName:"), function $CPUndoManager__undoMenuTitleForUndoActionName_(self, _cmd, anActionName)
{
    if (anActionName || anActionName === 0)
        return "Undo " + anActionName;
    return "Undo";
}
,["CPString","CPString"]), new objj_method(sel_getUid("runLoopModes"), function $CPUndoManager__runLoopModes(self, _cmd)
{
    return self._runLoopModes;
}
,["CPArray"]), new objj_method(sel_getUid("setRunLoopModes:"), function $CPUndoManager__setRunLoopModes_(self, _cmd, modes)
{
    self._runLoopModes = (modes == null ? null : modes.isa.objj_msgSend0(modes, "copy"));
    if (self._registeredWithRunLoop)
    {
        self.isa.objj_msgSend0(self, "_unregisterWithRunLoop");
        self.isa.objj_msgSend0(self, "_registerWithRunLoop");
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("_runLoopEndUndoGrouping"), function $CPUndoManager___runLoopEndUndoGrouping(self, _cmd)
{
    self.isa.objj_msgSend0(self, "endUndoGrouping");
    self._registeredWithRunLoop = NO;
}
,["void"]), new objj_method(sel_getUid("_registerWithRunLoop"), function $CPUndoManager___registerWithRunLoop(self, _cmd)
{
    if (self._registeredWithRunLoop)
        return;
    self._registeredWithRunLoop = YES;
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "performSelector:target:argument:order:modes:", sel_getUid("_runLoopEndUndoGrouping"), self, nil, CPUndoCloseGroupingRunLoopOrdering, self._runLoopModes));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_unregisterWithRunLoop"), function $CPUndoManager___unregisterWithRunLoop(self, _cmd)
{
    if (!self._registeredWithRunLoop)
        return;
    self._registeredWithRunLoop = NO;
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "cancelPerformSelector:target:argument:", sel_getUid("_runLoopEndUndoGrouping"), self, nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("observeChangesForKeyPath:ofObject:"), function $CPUndoManager__observeChangesForKeyPath_ofObject_(self, _cmd, aKeyPath, anObject)
{
    (anObject == null ? null : anObject.isa.objj_msgSend(anObject, "addObserver:forKeyPath:options:context:", self, aKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, NULL));
}
,["void","CPString","id"]), new objj_method(sel_getUid("stopObservingChangesForKeyPath:ofObject:"), function $CPUndoManager__stopObservingChangesForKeyPath_ofObject_(self, _cmd, aKeyPath, anObject)
{
    (anObject == null ? null : anObject.isa.objj_msgSend2(anObject, "removeObserver:forKeyPath:", self, aKeyPath));
}
,["void","CPString","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPUndoManager__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, aChange, aContext)
{
    var before = (aChange == null ? null : aChange.isa.objj_msgSend1(aChange, "valueForKey:", CPKeyValueChangeOldKey)),
        after = (aChange == null ? null : aChange.isa.objj_msgSend1(aChange, "valueForKey:", CPKeyValueChangeNewKey));
    if (before === after || before !== nil && before.isa && (after === nil || after.isa) && (before == null ? null : before.isa.objj_msgSend1(before, "isEqual:", after)))
        return;
    ((___r1 = self.isa.objj_msgSend1(self, "prepareWithInvocationTarget:", anObject)), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "applyChange:toKeyPath:", (aChange == null ? null : aChange.isa.objj_msgSend0(aChange, "inverseChangeDictionary")), aKeyPath));
    var ___r1;
}
,["void","CPString","id","CPDictionary","id"])]);
}var CPUndoManagerRedoStackKey = "CPUndoManagerRedoStackKey",
    CPUndoManagerUndoStackKey = "CPUndoManagerUndoStackKey",
    CPUndoManagerLevelsOfUndoKey = "CPUndoManagerLevelsOfUndoKey",
    CPUndoManagerActionNameKey = "CPUndoManagerActionNameKey",
    CPUndoManagerCurrentGroupingKey = "CPUndoManagerCurrentGroupingKey",
    CPUndoManagerRunLoopModesKey = "CPUndoManagerRunLoopModesKey",
    CPUndoManagerGroupsByEventKey = "CPUndoManagerGroupsByEventKey";
{
var the_class = objj_getClass("CPUndoManager")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPUndoManager\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPUndoManager__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUndoManager").super_class }, "init");
    if (self)
    {
        self._redoStack = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPUndoManagerRedoStackKey));
        self._undoStack = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPUndoManagerUndoStackKey));
        self._levelsOfUndo = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPUndoManagerLevelsOfUndoKey));
        self._currentGrouping = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPUndoManagerCurrentGroupingKey));
        self._state = CPUndoManagerNormal;
        (self == null ? null : self.isa.objj_msgSend1(self, "setRunLoopModes:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPUndoManagerRunLoopModesKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setGroupsByEvent:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPUndoManagerGroupsByEventKey))));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPUndoManager__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._redoStack, CPUndoManagerRedoStackKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._undoStack, CPUndoManagerUndoStackKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._levelsOfUndo, CPUndoManagerLevelsOfUndoKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._currentGrouping, CPUndoManagerCurrentGroupingKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._runLoopModes, CPUndoManagerRunLoopModesKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._groupsByEvent, CPUndoManagerGroupsByEventKey));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPProxy, "_CPUndoManagerProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_undoManager")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("methodSignatureForSelector:"), function $_CPUndoManagerProxy__methodSignatureForSelector_(self, _cmd, aSelector)
{
    return ((___r1 = self._undoManager), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_methodSignatureOfPreparedTargetForSelector:", aSelector));
    var ___r1;
}
,["CPMethodSignature","SEL"]), new objj_method(sel_getUid("forwardInvocation:"), function $_CPUndoManagerProxy__forwardInvocation_(self, _cmd, anInvocation)
{
    ((___r1 = self._undoManager), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_forwardInvocationToPreparedTarget:", anInvocation));
    var ___r1;
}
,["void","CPInvocation"])]);
}