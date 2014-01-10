@STATIC;1.0;i;9;CPArray.ji;13;CPException.ji;14;CPInvocation.ji;22;CPNotificationCenter.ji;10;CPObject.ji;9;CPProxy.ji;21;CPKeyValueObserving.ji;11;CPRunLoop.jt;25113;objj_executeFile("CPArray.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPInvocation.j", YES);objj_executeFile("CPNotificationCenter.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPProxy.j", YES);objj_executeFile("CPKeyValueObserving.j", YES);objj_executeFile("CPRunLoop.j", YES);var CPUndoManagerNormal = 0,
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
    objj_msgSend(self._invocations, "addObjectsFromArray:", invocations);
}
,["void","CPArray"]), new objj_method(sel_getUid("removeInvocationsWithTarget:"), function $_CPUndoGrouping__removeInvocationsWithTarget_(self, _cmd, aTarget)
{
    var index = self._invocations.length;
    while (index--)
        if (objj_msgSend(self._invocations[index], "target") == aTarget)
            self._invocations.splice(index, 1);
}
,["BOOL","id"]), new objj_method(sel_getUid("invocations"), function $_CPUndoGrouping__invocations(self, _cmd)
{
    return self._invocations;
}
,["CPArray"]), new objj_method(sel_getUid("invoke"), function $_CPUndoGrouping__invoke(self, _cmd)
{
    var index = self._invocations.length;
    while (index--)
        objj_msgSend(self._invocations[index], "invoke");
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
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithParent:", anUndoGrouping);
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
        self._parent = objj_msgSend(aCoder, "decodeObjectForKey:", _CPUndoGroupingParentKey);
        self._invocations = objj_msgSend(aCoder, "decodeObjectForKey:", _CPUndoGroupingInvocationsKey);
        self._actionName = objj_msgSend(aCoder, "decodeObjectForKey:", _CPUndoGroupingActionNameKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPUndoGrouping__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._parent, _CPUndoGroupingParentKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._invocations, _CPUndoGroupingInvocationsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._actionName, _CPUndoGroupingActionNameKey);
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
        objj_msgSend(self, "setRunLoopModes:", [CPDefaultRunLoopMode]);
        objj_msgSend(self, "setGroupsByEvent:", YES);
        self._undoManagerProxy = objj_msgSend(_CPUndoManagerProxy, "alloc");
        self._undoManagerProxy._undoManager = self;
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("_addUndoInvocation:"), function $CPUndoManager___addUndoInvocation_(self, _cmd, anInvocation)
{
    if (!self._currentGrouping)
        if (objj_msgSend(self, "groupsByEvent"))
            objj_msgSend(self, "_beginUndoGroupingForEvent");
        else
            objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "No undo group is currently open");
    objj_msgSend(self._currentGrouping, "addInvocation:", anInvocation);
    if (self._state === CPUndoManagerNormal)
        objj_msgSend(self._redoStack, "removeAllObjects");
}
,["void","CPInvocation"]), new objj_method(sel_getUid("registerUndoWithTarget:selector:object:"), function $CPUndoManager__registerUndoWithTarget_selector_object_(self, _cmd, aTarget, aSelector, anObject)
{
    if (self._disableCount > 0)
        return;
    var invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", nil);
    objj_msgSend(invocation, "setTarget:", aTarget);
    objj_msgSend(invocation, "setSelector:", aSelector);
    objj_msgSend(invocation, "setArgument:atIndex:", anObject, 2);
    objj_msgSend(self, "_addUndoInvocation:", invocation);
}
,["void","id","SEL","id"]), new objj_method(sel_getUid("prepareWithInvocationTarget:"), function $CPUndoManager__prepareWithInvocationTarget_(self, _cmd, aTarget)
{
    self._preparedTarget = aTarget;
    return self._undoManagerProxy;
}
,["id","id"]), new objj_method(sel_getUid("_methodSignatureOfPreparedTargetForSelector:"), function $CPUndoManager___methodSignatureOfPreparedTargetForSelector_(self, _cmd, aSelector)
{
    if (objj_msgSend(self._preparedTarget, "respondsToSelector:", aSelector))
        return 1;
    return nil;
}
,["CPMethodSignature","SEL"]), new objj_method(sel_getUid("_forwardInvocationToPreparedTarget:"), function $CPUndoManager___forwardInvocationToPreparedTarget_(self, _cmd, anInvocation)
{
    if (self._disableCount > 0)
        return;
    objj_msgSend(anInvocation, "setTarget:", self._preparedTarget);
    objj_msgSend(self, "_addUndoInvocation:", anInvocation);
    self._preparedTarget = nil;
}
,["void","CPInvocation"]), new objj_method(sel_getUid("canRedo"), function $CPUndoManager__canRedo(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPUndoManagerCheckpointNotification, self);
    return objj_msgSend(self._redoStack, "count") > 0;
}
,["BOOL"]), new objj_method(sel_getUid("canUndo"), function $CPUndoManager__canUndo(self, _cmd)
{
    if (self._undoStack.length > 0)
        return YES;
    return objj_msgSend(objj_msgSend(self._currentGrouping, "invocations"), "count") > 0;
}
,["BOOL"]), new objj_method(sel_getUid("undo"), function $CPUndoManager__undo(self, _cmd)
{
    if (objj_msgSend(self, "groupingLevel") === 1)
        objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(self, "undoNestedGroup");
}
,["void"]), new objj_method(sel_getUid("undoNestedGroup"), function $CPUndoManager__undoNestedGroup(self, _cmd)
{
    if (objj_msgSend(self._undoStack, "count") <= 0)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self);
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerWillUndoChangeNotification, self);
    var undoGrouping = self._undoStack.pop(),
        actionName = objj_msgSend(undoGrouping, "actionName");
    self._state = CPUndoManagerUndoing;
    objj_msgSend(self, "_beginUndoGrouping");
    objj_msgSend(undoGrouping, "invoke");
    objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(_CPUndoGrouping, "_poolUndoGrouping:", undoGrouping);
    self._state = CPUndoManagerNormal;
    objj_msgSend(objj_msgSend(self._redoStack, "lastObject"), "setActionName:", actionName);
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerDidUndoChangeNotification, self);
}
,["void"]), new objj_method(sel_getUid("redo"), function $CPUndoManager__redo(self, _cmd)
{
    if (objj_msgSend(self._redoStack, "count") <= 0)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self);
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerWillRedoChangeNotification, self);
    var oldUndoGrouping = self._currentGrouping,
        undoGrouping = self._redoStack.pop(),
        actionName = objj_msgSend(undoGrouping, "actionName");
    self._currentGrouping = nil;
    self._state = CPUndoManagerRedoing;
    objj_msgSend(self, "_beginUndoGrouping");
    objj_msgSend(undoGrouping, "invoke");
    objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(_CPUndoGrouping, "_poolUndoGrouping:", undoGrouping);
    self._currentGrouping = oldUndoGrouping;
    self._state = CPUndoManagerNormal;
    objj_msgSend(objj_msgSend(self._undoStack, "lastObject"), "setActionName:", actionName);
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerDidRedoChangeNotification, self);
}
,["void"]), new objj_method(sel_getUid("beginUndoGrouping"), function $CPUndoManager__beginUndoGrouping(self, _cmd)
{
    if (!self._currentGrouping && objj_msgSend(self, "groupsByEvent"))
        objj_msgSend(self, "_beginUndoGroupingForEvent");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPUndoManagerCheckpointNotification, self);
    objj_msgSend(self, "_beginUndoGrouping");
}
,["void"]), new objj_method(sel_getUid("_beginUndoGroupingForEvent"), function $CPUndoManager___beginUndoGroupingForEvent(self, _cmd)
{
    objj_msgSend(self, "_beginUndoGrouping");
    objj_msgSend(self, "_registerWithRunLoop");
}
,["void"]), new objj_method(sel_getUid("_beginUndoGrouping"), function $CPUndoManager___beginUndoGrouping(self, _cmd)
{
    self._currentGrouping = objj_msgSend(_CPUndoGrouping, "undoGroupingWithParent:", self._currentGrouping);
}
,["void"]), new objj_method(sel_getUid("endUndoGrouping"), function $CPUndoManager__endUndoGrouping(self, _cmd)
{
    if (!self._currentGrouping)
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "endUndoGrouping. No undo group is currently open.");
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerCheckpointNotification, self);
    var parent = objj_msgSend(self._currentGrouping, "parent");
    if (!parent && objj_msgSend(self._currentGrouping, "invocations").length > 0)
    {
        objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerWillCloseUndoGroupNotification, self);
        var stack = self._state === CPUndoManagerUndoing ? self._redoStack : self._undoStack;
        stack.push(self._currentGrouping);
        if (self._levelsOfUndo > 0 && stack.length > self._levelsOfUndo)
            stack.splice(0, 1);
        objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerDidCloseUndoGroupNotification, self);
    }
    else
    {
        objj_msgSend(parent, "addInvocationsFromArray:", objj_msgSend(self._currentGrouping, "invocations"));
        objj_msgSend(_CPUndoGrouping, "_poolUndoGrouping:", self._currentGrouping);
    }
    self._currentGrouping = parent;
}
,["void"]), new objj_method(sel_getUid("enableUndoRegistration"), function $CPUndoManager__enableUndoRegistration(self, _cmd)
{
    if (self._disableCount <= 0)
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "enableUndoRegistration. There are no disable messages in effect right now.");
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
    if (!objj_msgSend(self, "groupsByEvent"))
        objj_msgSend(self, "_unregisterWithRunLoop");
}
,["void","BOOL"]), new objj_method(sel_getUid("groupingLevel"), function $CPUndoManager__groupingLevel(self, _cmd)
{
    var grouping = self._currentGrouping,
        level = self._currentGrouping ? 1 : 0;
    while (grouping = objj_msgSend(grouping, "parent"))
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
        objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(self, "_unregisterWithRunLoop");
    self._state = CPUndoManagerNormal;
    self._redoStack = [];
    self._undoStack = [];
    self._disableCount = 0;
}
,["void"]), new objj_method(sel_getUid("removeAllActionsWithTarget:"), function $CPUndoManager__removeAllActionsWithTarget_(self, _cmd, aTarget)
{
    objj_msgSend(self._currentGrouping, "removeInvocationsWithTarget:", aTarget);
    var index = self._redoStack.length;
    while (index--)
    {
        var grouping = self._redoStack[index];
        objj_msgSend(grouping, "removeInvocationsWithTarget:", aTarget);
        if (!objj_msgSend(grouping, "invocations").length)
            self._redoStack.splice(index, 1);
    }
    index = self._undoStack.length;
    while (index--)
    {
        var grouping = self._undoStack[index];
        objj_msgSend(grouping, "removeInvocationsWithTarget:", aTarget);
        if (!objj_msgSend(grouping, "invocations").length)
            self._undoStack.splice(index, 1);
    }
}
,["void","id"]), new objj_method(sel_getUid("setActionName:"), function $CPUndoManager__setActionName_(self, _cmd, anActionName)
{
    if (anActionName !== nil && self._currentGrouping)
        objj_msgSend(self._currentGrouping, "setActionName:", anActionName);
}
,["void","CPString"]), new objj_method(sel_getUid("redoActionName"), function $CPUndoManager__redoActionName(self, _cmd)
{
    if (!objj_msgSend(self, "canRedo"))
        return nil;
    return objj_msgSend(objj_msgSend(self._redoStack, "lastObject"), "actionName");
}
,["CPString"]), new objj_method(sel_getUid("redoMenuItemTitle"), function $CPUndoManager__redoMenuItemTitle(self, _cmd)
{
    return objj_msgSend(self, "redoMenuTitleForUndoActionName:", objj_msgSend(self, "redoActionName"));
}
,["CPString"]), new objj_method(sel_getUid("redoMenuTitleForUndoActionName:"), function $CPUndoManager__redoMenuTitleForUndoActionName_(self, _cmd, anActionName)
{
    if (anActionName || anActionName === 0)
        return "Redo " + anActionName;
    return "Redo";
}
,["CPString","CPString"]), new objj_method(sel_getUid("undoActionName"), function $CPUndoManager__undoActionName(self, _cmd)
{
    if (!objj_msgSend(self, "canUndo"))
        return nil;
    return objj_msgSend(objj_msgSend(self._undoStack, "lastObject"), "actionName");
}
,["CPString"]), new objj_method(sel_getUid("undoMenuItemTitle"), function $CPUndoManager__undoMenuItemTitle(self, _cmd)
{
    return objj_msgSend(self, "undoMenuTitleForUndoActionName:", objj_msgSend(self, "undoActionName"));
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
    self._runLoopModes = objj_msgSend(modes, "copy");
    if (self._registeredWithRunLoop)
    {
        objj_msgSend(self, "_unregisterWithRunLoop");
        objj_msgSend(self, "_registerWithRunLoop");
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("_runLoopEndUndoGrouping"), function $CPUndoManager___runLoopEndUndoGrouping(self, _cmd)
{
    objj_msgSend(self, "endUndoGrouping");
    self._registeredWithRunLoop = NO;
}
,["void"]), new objj_method(sel_getUid("_registerWithRunLoop"), function $CPUndoManager___registerWithRunLoop(self, _cmd)
{
    if (self._registeredWithRunLoop)
        return;
    self._registeredWithRunLoop = YES;
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("_runLoopEndUndoGrouping"), self, nil, CPUndoCloseGroupingRunLoopOrdering, self._runLoopModes);
}
,["void"]), new objj_method(sel_getUid("_unregisterWithRunLoop"), function $CPUndoManager___unregisterWithRunLoop(self, _cmd)
{
    if (!self._registeredWithRunLoop)
        return;
    self._registeredWithRunLoop = NO;
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "cancelPerformSelector:target:argument:", sel_getUid("_runLoopEndUndoGrouping"), self, nil);
}
,["void"]), new objj_method(sel_getUid("observeChangesForKeyPath:ofObject:"), function $CPUndoManager__observeChangesForKeyPath_ofObject_(self, _cmd, aKeyPath, anObject)
{
    objj_msgSend(anObject, "addObserver:forKeyPath:options:context:", self, aKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, NULL);
}
,["void","CPString","id"]), new objj_method(sel_getUid("stopObservingChangesForKeyPath:ofObject:"), function $CPUndoManager__stopObservingChangesForKeyPath_ofObject_(self, _cmd, aKeyPath, anObject)
{
    objj_msgSend(anObject, "removeObserver:forKeyPath:", self, aKeyPath);
}
,["void","CPString","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPUndoManager__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, aChange, aContext)
{
    var before = objj_msgSend(aChange, "valueForKey:", CPKeyValueChangeOldKey),
        after = objj_msgSend(aChange, "valueForKey:", CPKeyValueChangeNewKey);
    if (before === after || before !== nil && before.isa && (after === nil || after.isa) && objj_msgSend(before, "isEqual:", after))
        return;
    objj_msgSend(objj_msgSend(self, "prepareWithInvocationTarget:", anObject), "applyChange:toKeyPath:", objj_msgSend(aChange, "inverseChangeDictionary"), aKeyPath);
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
        self._redoStack = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerRedoStackKey);
        self._undoStack = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerUndoStackKey);
        self._levelsOfUndo = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerLevelsOfUndoKey);
        self._currentGrouping = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerCurrentGroupingKey);
        self._state = CPUndoManagerNormal;
        objj_msgSend(self, "setRunLoopModes:", objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerRunLoopModesKey));
        objj_msgSend(self, "setGroupsByEvent:", objj_msgSend(aCoder, "decodeBoolForKey:", CPUndoManagerGroupsByEventKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPUndoManager__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._redoStack, CPUndoManagerRedoStackKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._undoStack, CPUndoManagerUndoStackKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._levelsOfUndo, CPUndoManagerLevelsOfUndoKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._currentGrouping, CPUndoManagerCurrentGroupingKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._runLoopModes, CPUndoManagerRunLoopModesKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._groupsByEvent, CPUndoManagerGroupsByEventKey);
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPProxy, "_CPUndoManagerProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_undoManager")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("methodSignatureForSelector:"), function $_CPUndoManagerProxy__methodSignatureForSelector_(self, _cmd, aSelector)
{
    return objj_msgSend(self._undoManager, "_methodSignatureOfPreparedTargetForSelector:", aSelector);
}
,["CPMethodSignature","SEL"]), new objj_method(sel_getUid("forwardInvocation:"), function $_CPUndoManagerProxy__forwardInvocation_(self, _cmd, anInvocation)
{
    objj_msgSend(self._undoManager, "_forwardInvocationToPreparedTarget:", anInvocation);
}
,["void","CPInvocation"])]);
}