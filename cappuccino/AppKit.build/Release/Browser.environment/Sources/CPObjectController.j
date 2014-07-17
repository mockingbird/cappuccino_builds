@STATIC;1.0;I;25;Foundation/CPDictionary.jI;25;Foundation/CPCountedSet.jI;38;Foundation/_CPCollectionKVCOperators.ji;14;CPController.ji;19;CPKeyValueBinding.jt;35073;objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPCountedSet.j", NO);objj_executeFile("Foundation/_CPCollectionKVCOperators.j", NO);objj_executeFile("CPController.j", YES);objj_executeFile("CPKeyValueBinding.j", YES);{var the_class = objj_allocateClassPair(CPController, "CPObjectController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentObject"), new objj_ivar("_selection"), new objj_ivar("_objectClass"), new objj_ivar("_objectClassName"), new objj_ivar("_isEditable"), new objj_ivar("_automaticallyPreparesContent"), new objj_ivar("_observedKeys")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPObjectController__init(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "initWithContent:", nil);
}
,["id"]), new objj_method(sel_getUid("initWithContent:"), function $CPObjectController__initWithContent_(self, _cmd, aContent)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObjectController").super_class }, "init"))
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setEditable:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setObjectClass:", CPMutableDictionary.isa.objj_msgSend0(CPMutableDictionary, "class")));
        self._observedKeys = ((___r1 = CPCountedSet.isa.objj_msgSend0(CPCountedSet, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        self._selection = ((___r1 = (CPControllerSelectionProxy == null ? null : CPControllerSelectionProxy.isa.objj_msgSend0(CPControllerSelectionProxy, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithController:", self));
        (self == null ? null : self.isa.objj_msgSend1(self, "setContent:", aContent));
    }
    return self;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("content"), function $CPObjectController__content(self, _cmd)
{
    return self._contentObject;
}
,["id"]), new objj_method(sel_getUid("setContent:"), function $CPObjectController__setContent_(self, _cmd, aContent)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "contentObject");
    self.isa.objj_msgSend0(self, "_selectionWillChange");
    self._contentObject = aContent;
    self.isa.objj_msgSend0(self, "_selectionDidChange");
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "contentObject");
}
,["void","id"]), new objj_method(sel_getUid("_setContentObject:"), function $CPObjectController___setContentObject_(self, _cmd, aContent)
{
    self.isa.objj_msgSend1(self, "setContent:", aContent);
}
,["void","id"]), new objj_method(sel_getUid("_contentObject"), function $CPObjectController___contentObject(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "content");
}
,["id"]), new objj_method(sel_getUid("setAutomaticallyPreparesContent:"), function $CPObjectController__setAutomaticallyPreparesContent_(self, _cmd, shouldAutomaticallyPrepareContent)
{
    self._automaticallyPreparesContent = shouldAutomaticallyPrepareContent;
}
,["void","BOOL"]), new objj_method(sel_getUid("automaticallyPreparesContent"), function $CPObjectController__automaticallyPreparesContent(self, _cmd)
{
    return self._automaticallyPreparesContent;
}
,["BOOL"]), new objj_method(sel_getUid("prepareContent"), function $CPObjectController__prepareContent(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setContent:", self.isa.objj_msgSend0(self, "newObject"));
}
,["void"]), new objj_method(sel_getUid("setObjectClass:"), function $CPObjectController__setObjectClass_(self, _cmd, aClass)
{
    self._objectClass = aClass;
}
,["void","Class"]), new objj_method(sel_getUid("objectClass"), function $CPObjectController__objectClass(self, _cmd)
{
    return self._objectClass;
}
,["Class"]), new objj_method(sel_getUid("_defaultNewObject"), function $CPObjectController___defaultNewObject(self, _cmd)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "objectClass")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1, ___r2;
}
,["id"]), new objj_method(sel_getUid("newObject"), function $CPObjectController__newObject(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "_defaultNewObject");
}
,["id"]), new objj_method(sel_getUid("addObject:"), function $CPObjectController__addObject_(self, _cmd, anObject)
{
    self.isa.objj_msgSend1(self, "setContent:", anObject);
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", "contentObject"));
    ((___r1 = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", "contentObject", self))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "reverseSetValueFor:", "contentObject"));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("removeObject:"), function $CPObjectController__removeObject_(self, _cmd, anObject)
{
    if (self.isa.objj_msgSend0(self, "content") === anObject)
        self.isa.objj_msgSend1(self, "setContent:", nil);
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", "contentObject"));
    ((___r1 = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", "contentObject", self))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "reverseSetValueFor:", "contentObject"));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("add:"), function $CPObjectController__add_(self, _cmd, aSender)
{
    self.isa.objj_msgSend1(self, "addObject:", self.isa.objj_msgSend0(self, "newObject"));
}
,["void","id"]), new objj_method(sel_getUid("canAdd"), function $CPObjectController__canAdd(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "isEditable");
}
,["BOOL"]), new objj_method(sel_getUid("remove:"), function $CPObjectController__remove_(self, _cmd, aSender)
{
    self.isa.objj_msgSend1(self, "removeObject:", self.isa.objj_msgSend0(self, "content"));
}
,["void","id"]), new objj_method(sel_getUid("canRemove"), function $CPObjectController__canRemove(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "isEditable") && ((___r1 = self.isa.objj_msgSend0(self, "selectedObjects")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("setEditable:"), function $CPObjectController__setEditable_(self, _cmd, shouldBeEditable)
{
    self._isEditable = shouldBeEditable;
}
,["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPObjectController__isEditable(self, _cmd)
{
    return self._isEditable;
}
,["BOOL"]), new objj_method(sel_getUid("selectedObjects"), function $CPObjectController__selectedObjects(self, _cmd)
{
    return ((___r1 = (_CPObservableArray == null ? null : _CPObservableArray.isa.objj_msgSend0(_CPObservableArray, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithArray:", [self._contentObject]));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("selection"), function $CPObjectController__selection(self, _cmd)
{
    return self._selection;
}
,["id"]), new objj_method(sel_getUid("_selectionWillChange"), function $CPObjectController___selectionWillChange(self, _cmd)
{
    ((___r1 = self._selection), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "controllerWillChange"));
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "selection");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_selectionDidChange"), function $CPObjectController___selectionDidChange(self, _cmd)
{
    if (self._selection === undefined || self._selection === nil)
        self._selection = ((___r1 = (CPControllerSelectionProxy == null ? null : CPControllerSelectionProxy.isa.objj_msgSend0(CPControllerSelectionProxy, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithController:", self));
    ((___r1 = self._selection), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "controllerDidChange"));
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "selection");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("observedKeys"), function $CPObjectController__observedKeys(self, _cmd)
{
    return self._observedKeys;
}
,["id"]), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function $CPObjectController__addObserver_forKeyPath_options_context_(self, _cmd, anObserver, aKeyPath, options, context)
{
    ((___r1 = self._observedKeys), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", aKeyPath));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObjectController").super_class }, "addObserver:forKeyPath:options:context:", anObserver, aKeyPath, options, context);
    var ___r1;
}
,["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function $CPObjectController__removeObserver_forKeyPath_(self, _cmd, anObserver, aKeyPath)
{
    ((___r1 = self._observedKeys), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", aKeyPath));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObjectController").super_class }, "removeObserver:forKeyPath:", anObserver, aKeyPath);
    var ___r1;
}
,["void","id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPObjectController__initialize(self, _cmd)
{
    if (self !== CPObjectController.isa.objj_msgSend0(CPObjectController, "class"))
        return;
    self.isa.objj_msgSend1(self, "exposeBinding:", "editable");
    self.isa.objj_msgSend1(self, "exposeBinding:", "contentObject");
}
,["void"]), new objj_method(sel_getUid("keyPathsForValuesAffectingContentObject"), function $CPObjectController__keyPathsForValuesAffectingContentObject(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "content");
}
,["CPSet"]), new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"), function $CPObjectController__automaticallyNotifiesObserversForKey_(self, _cmd, aKey)
{
    if (aKey === "contentObject")
        return NO;
    return YES;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("keyPathsForValuesAffectingCanAdd"), function $CPObjectController__keyPathsForValuesAffectingCanAdd(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", "editable");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingCanInsert"), function $CPObjectController__keyPathsForValuesAffectingCanInsert(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", "editable");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingCanRemove"), function $CPObjectController__keyPathsForValuesAffectingCanRemove(self, _cmd)
{
    return CPSet.isa.objj_msgSend2(CPSet, "setWithObjects:", "editable", "selection");
}
,["CPSet"])]);
}var CPObjectControllerContentKey = "CPObjectControllerContentKey",
    CPObjectControllerObjectClassNameKey = "CPObjectControllerObjectClassNameKey",
    CPObjectControllerIsEditableKey = "CPObjectControllerIsEditableKey",
    CPObjectControllerAutomaticallyPreparesContentKey = "CPObjectControllerAutomaticallyPreparesContentKey";
{
var the_class = objj_getClass("CPObjectController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObjectController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPObjectController__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObjectController").super_class }, "init");
    if (self)
    {
        var objectClassName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPObjectControllerObjectClassNameKey)),
            objectClass = CPClassFromString(objectClassName);
        (self == null ? null : self.isa.objj_msgSend1(self, "setObjectClass:", objectClass || CPMutableDictionary.isa.objj_msgSend0(CPMutableDictionary, "class")));
        (self == null ? null : self.isa.objj_msgSend1(self, "setEditable:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPObjectControllerIsEditableKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutomaticallyPreparesContent:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPObjectControllerAutomaticallyPreparesContentKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setContent:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPObjectControllerContentKey))));
        self._observedKeys = ((___r1 = CPCountedSet.isa.objj_msgSend0(CPCountedSet, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPObjectController__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "content"), CPObjectControllerContentKey));
    if (self._objectClass)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", CPStringFromClass(self._objectClass), CPObjectControllerObjectClassNameKey));
    else if (self._objectClassName)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._objectClassName, CPObjectControllerObjectClassNameKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self.isa.objj_msgSend0(self, "isEditable"), CPObjectControllerIsEditableKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self.isa.objj_msgSend0(self, "automaticallyPreparesContent"), CPObjectControllerAutomaticallyPreparesContentKey));
}
,["void","CPCoder"]), new objj_method(sel_getUid("awakeFromCib"), function $CPObjectController__awakeFromCib(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "content") && self.isa.objj_msgSend0(self, "automaticallyPreparesContent"))
        self.isa.objj_msgSend0(self, "prepareContent");
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPObservationProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyPath"), new objj_ivar("_observer"), new objj_ivar("_object"), new objj_ivar("_notifyObject"), new objj_ivar("_context"), new objj_ivar("_options")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKeyPath:observer:object:"), function $_CPObservationProxy__initWithKeyPath_observer_object_(self, _cmd, aKeyPath, anObserver, anObject)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPObservationProxy").super_class }, "init"))
    {
        self._keyPath = aKeyPath;
        self._observer = anObserver;
        self._object = anObject;
    }
    return self;
}
,["id","id","id","id"]), new objj_method(sel_getUid("observer"), function $_CPObservationProxy__observer(self, _cmd)
{
    return self._observer;
}
,["id"]), new objj_method(sel_getUid("keyPath"), function $_CPObservationProxy__keyPath(self, _cmd)
{
    return self._keyPath;
}
,["id"]), new objj_method(sel_getUid("context"), function $_CPObservationProxy__context(self, _cmd)
{
    return self._context;
}
,["id"]), new objj_method(sel_getUid("options"), function $_CPObservationProxy__options(self, _cmd)
{
    return self._options;
}
,["int"]), new objj_method(sel_getUid("setNotifyObject:"), function $_CPObservationProxy__setNotifyObject_(self, _cmd, notify)
{
    self._notifyObject = notify;
}
,["void","BOOL"]), new objj_method(sel_getUid("isEqual:"), function $_CPObservationProxy__isEqual_(self, _cmd, anObject)
{
    if ((anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "class")) === self.isa.objj_msgSend0(self, "class"))
    {
        if (anObject._observer === self._observer && ((___r1 = anObject._keyPath), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", self._keyPath)) && ((___r1 = anObject._object), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", self._object)))
            return YES;
    }
    return NO;
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPObservationProxy__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, change, context)
{
    if (self._notifyObject)
        ((___r1 = self._object), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "observeValueForKeyPath:ofObject:change:context:", aKeyPath, self._object, change, context));
    ((___r1 = self._observer), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "observeValueForKeyPath:ofObject:change:context:", aKeyPath, self._object, change, context));
    var ___r1;
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("description"), function $_CPObservationProxy__description(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPObservationProxy").super_class }, "description") + CPString.isa.objj_msgSend3(CPString, "stringWithFormat:", "observation proxy for %@ on key path %@", self._observer, self._keyPath);
}
,["CPString"])]);
}{var the_class = objj_allocateClassPair(_CPJavaScriptArray, "_CPObservableArray"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_observationProxies")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("description"), function $_CPObservableArray__description(self, _cmd)
{
    return "<_CPObservableArray: " + objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPObservableArray").super_class }, "description") + " >";
}
,["CPString"]), new objj_method(sel_getUid("initWithArray:"), function $_CPObservableArray__initWithArray_(self, _cmd, anArray)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPObservableArray").super_class }, "initWithArray:", anArray);
    self.isa = _CPObservableArray.isa.objj_msgSend0(_CPObservableArray, "class");
    self._observationProxies = [];
    return self;
}
,["id","CPArray"]), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function $_CPObservableArray__addObserver_forKeyPath_options_context_(self, _cmd, anObserver, aKeyPath, options, context)
{
    if (aKeyPath.charAt(0) === "@")
    {
        if (_CPCollectionKVCOperator.isa.objj_msgSend1(_CPCollectionKVCOperator, "isSimpleCollectionOperator:", aKeyPath))
            return;
        var proxy = ((___r1 = _CPObservationProxy.isa.objj_msgSend0(_CPObservationProxy, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithKeyPath:observer:object:", aKeyPath, anObserver, self));
        proxy._options = options;
        proxy._context = context;
        ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", proxy));
        var dotIndex = aKeyPath.indexOf("."),
            remaining = aKeyPath.substring(dotIndex + 1),
            indexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self.isa.objj_msgSend0(self, "count")));
        self.isa.objj_msgSend(self, "addObserver:toObjectsAtIndexes:forKeyPath:options:context:", proxy, indexes, remaining, options, context);
    }
    else
    {
        var indexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self.isa.objj_msgSend0(self, "count")));
        self.isa.objj_msgSend(self, "addObserver:toObjectsAtIndexes:forKeyPath:options:context:", anObserver, indexes, aKeyPath, options, context);
    }
    var ___r1;
}
,["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function $_CPObservableArray__removeObserver_forKeyPath_(self, _cmd, anObserver, aKeyPath)
{
    if (aKeyPath.charAt(0) === "@")
    {
        if (_CPCollectionKVCOperator.isa.objj_msgSend1(_CPCollectionKVCOperator, "isSimpleCollectionOperator:", aKeyPath))
            return;
        var proxy = ((___r1 = _CPObservationProxy.isa.objj_msgSend0(_CPObservationProxy, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithKeyPath:observer:object:", aKeyPath, anObserver, self)),
            index = ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", proxy));
        proxy = ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", index));
        var dotIndex = aKeyPath.indexOf("."),
            remaining = aKeyPath.substring(dotIndex + 1),
            indexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self.isa.objj_msgSend0(self, "count")));
        self.isa.objj_msgSend3(self, "removeObserver:fromObjectsAtIndexes:forKeyPath:", proxy, indexes, remaining);
    }
    else
    {
        var indexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self.isa.objj_msgSend0(self, "count")));
        self.isa.objj_msgSend3(self, "removeObserver:fromObjectsAtIndexes:forKeyPath:", anObserver, indexes, aKeyPath);
    }
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("insertObject:atIndex:"), function $_CPObservableArray__insertObject_atIndex_(self, _cmd, anObject, anIndex)
{
    for (var i = 0, count = ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")); i < count; i++)
    {
        var proxy = ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i)),
            keyPath = (proxy == null ? null : proxy.isa.objj_msgSend0(proxy, "keyPath")),
            operator = keyPath.charAt(0) === ".";
        if (operator)
            self.isa.objj_msgSend1(self, "willChangeValueForKey:", keyPath);
        (anObject == null ? null : anObject.isa.objj_msgSend(anObject, "addObserver:forKeyPath:options:context:", proxy, keyPath, (proxy == null ? null : proxy.isa.objj_msgSend0(proxy, "options")), (proxy == null ? null : proxy.isa.objj_msgSend0(proxy, "context"))));
        if (operator)
            self.isa.objj_msgSend1(self, "didChangeValueForKey:", keyPath);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPObservableArray").super_class }, "insertObject:atIndex:", anObject, anIndex);
    var ___r1;
}
,["void","id","CPUInteger"]), new objj_method(sel_getUid("removeObjectAtIndex:"), function $_CPObservableArray__removeObjectAtIndex_(self, _cmd, anIndex)
{
    var currentObject = self.isa.objj_msgSend1(self, "objectAtIndex:", anIndex);
    for (var i = 0, count = ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")); i < count; i++)
    {
        var proxy = ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i)),
            keyPath = (proxy == null ? null : proxy.isa.objj_msgSend0(proxy, "keyPath")),
            operator = keyPath.charAt(0) === ".";
        if (operator)
            self.isa.objj_msgSend1(self, "willChangeValueForKey:", keyPath);
        (currentObject == null ? null : currentObject.isa.objj_msgSend2(currentObject, "removeObserver:forKeyPath:", proxy, keyPath));
        if (operator)
            self.isa.objj_msgSend1(self, "didChangeValueForKey:", keyPath);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPObservableArray").super_class }, "removeObjectAtIndex:", anIndex);
    var ___r1;
}
,["void","CPUInteger"]), new objj_method(sel_getUid("objectsAtIndexes:"), function $_CPObservableArray__objectsAtIndexes_(self, _cmd, theIndexes)
{
    return _CPObservableArray.isa.objj_msgSend1(_CPObservableArray, "arrayWithArray:", objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPObservableArray").super_class }, "objectsAtIndexes:", theIndexes));
}
,["CPArray","CPIndexSet"]), new objj_method(sel_getUid("addObject:"), function $_CPObservableArray__addObject_(self, _cmd, anObject)
{
    self.isa.objj_msgSend2(self, "insertObject:atIndex:", anObject, self.isa.objj_msgSend0(self, "count"));
}
,["void","id"]), new objj_method(sel_getUid("removeLastObject"), function $_CPObservableArray__removeLastObject(self, _cmd)
{
    self.isa.objj_msgSend1(self, "removeObjectAtIndex:", self.isa.objj_msgSend0(self, "count"));
}
,["void"]), new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"), function $_CPObservableArray__replaceObjectAtIndex_withObject_(self, _cmd, anIndex, anObject)
{
    var currentObject = self.isa.objj_msgSend1(self, "objectAtIndex:", anIndex);
    for (var i = 0, count = ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")); i < count; i++)
    {
        var proxy = ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i)),
            keyPath = (proxy == null ? null : proxy.isa.objj_msgSend0(proxy, "keyPath")),
            operator = keyPath.charAt(0) === ".";
        if (operator)
            self.isa.objj_msgSend1(self, "willChangeValueForKey:", keyPath);
        (currentObject == null ? null : currentObject.isa.objj_msgSend2(currentObject, "removeObserver:forKeyPath:", proxy, keyPath));
        (anObject == null ? null : anObject.isa.objj_msgSend(anObject, "addObserver:forKeyPath:options:context:", proxy, keyPath, (proxy == null ? null : proxy.isa.objj_msgSend0(proxy, "options")), (proxy == null ? null : proxy.isa.objj_msgSend0(proxy, "context"))));
        if (operator)
            self.isa.objj_msgSend1(self, "didChangeValueForKey:", keyPath);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPObservableArray").super_class }, "replaceObjectAtIndex:withObject:", anIndex, anObject);
    var ___r1;
}
,["void","CPUInteger","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $_CPObservableArray__alloc(self, _cmd)
{
    var a = [];
    a.isa = self;
    var ivars = class_copyIvarList(self),
        count = ivars.length;
    while (count--)
        a[ivar_getName(ivars[count])] = nil;
    return a;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPObject, "CPControllerSelectionProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_controller"), new objj_ivar("_keys"), new objj_ivar("_cachedValues"), new objj_ivar("_observationProxies"), new objj_ivar("_observedObjectsByKeyPath")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithController:"), function $CPControllerSelectionProxy__initWithController_(self, _cmd, aController)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControllerSelectionProxy").super_class }, "init"))
    {
        self._cachedValues = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._observationProxies = CPArray.isa.objj_msgSend0(CPArray, "array");
        self._controller = aController;
        self._observedObjectsByKeyPath = {};
    }
    return self;
}
,["id","id"]), new objj_method(sel_getUid("_controllerMarkerForValues:"), function $CPControllerSelectionProxy___controllerMarkerForValues_(self, _cmd, theValues)
{
    var count = (theValues == null ? null : theValues.isa.objj_msgSend0(theValues, "count")),
        value;
    if (!count)
        value = CPNoSelectionMarker;
    else if (count === 1)
        value = (theValues == null ? null : theValues.isa.objj_msgSend1(theValues, "objectAtIndex:", 0));
    else
    {
        if (((___r1 = self._controller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "alwaysUsesMultipleValuesMarker")))
            value = CPMultipleValuesMarker;
        else
        {
            value = (theValues == null ? null : theValues.isa.objj_msgSend1(theValues, "objectAtIndex:", 0));
            for (var i = 0, count = (theValues == null ? null : theValues.isa.objj_msgSend0(theValues, "count")); i < count && value != CPMultipleValuesMarker; i++)
            {
                if (!(value == null ? null : value.isa.objj_msgSend1(value, "isEqual:", (theValues == null ? null : theValues.isa.objj_msgSend1(theValues, "objectAtIndex:", i)))))
                    value = CPMultipleValuesMarker;
            }
        }
    }
    if (value === nil || value.isa && (value == null ? null : value.isa.objj_msgSend1(value, "isEqual:", CPNull.isa.objj_msgSend0(CPNull, "null"))))
        value = CPNullMarker;
    return value;
    var ___r1;
}
,["id","CPArray"]), new objj_method(sel_getUid("valueForKeyPath:"), function $CPControllerSelectionProxy__valueForKeyPath_(self, _cmd, theKeyPath)
{
    var values = ((___r1 = ((___r2 = self._controller), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedObjects"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", theKeyPath));
    if ((values == null ? null : values.isa.objj_msgSend1(values, "isKindOfClass:", CPArray)) || (values == null ? null : values.isa.objj_msgSend1(values, "isKindOfClass:", CPSet)))
    {
        var value = self.isa.objj_msgSend1(self, "_controllerMarkerForValues:", values);
        ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", value, theKeyPath));
        return value;
    }
    else
        return values;
    var ___r1, ___r2;
}
,["id","CPString"]), new objj_method(sel_getUid("valueForKey:"), function $CPControllerSelectionProxy__valueForKey_(self, _cmd, theKeyPath)
{
    return self.isa.objj_msgSend1(self, "valueForKeyPath:", theKeyPath);
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forKeyPath:"), function $CPControllerSelectionProxy__setValue_forKeyPath_(self, _cmd, theValue, theKeyPath)
{
    ((___r1 = ((___r2 = self._controller), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedObjects"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKeyPath:", theValue, theKeyPath));
    ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", theKeyPath));
    ((___r1 = CPBinder.isa.objj_msgSend2(CPBinder, "getBinding:forObject:", "contentArray", self._controller)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_contentArrayDidChange"));
    var ___r1, ___r2;
}
,["void","id","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPControllerSelectionProxy__setValue_forKey_(self, _cmd, theValue, theKeyPath)
{
    self.isa.objj_msgSend2(self, "setValue:forKeyPath:", theKeyPath, theKeyPath);
}
,["void","id","CPString"]), new objj_method(sel_getUid("count"), function $CPControllerSelectionProxy__count(self, _cmd)
{
    return ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["unsigned"]), new objj_method(sel_getUid("keyEnumerator"), function $CPControllerSelectionProxy__keyEnumerator(self, _cmd)
{
    return ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyEnumerator"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("controllerWillChange"), function $CPControllerSelectionProxy__controllerWillChange(self, _cmd)
{
    self._keys = ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys"));
    if (!self._keys)
        return;
    for (var i = 0, count = self._keys.length; i < count; i++)
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", self._keys[i]);
    ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("controllerDidChange"), function $CPControllerSelectionProxy__controllerDidChange(self, _cmd)
{
    ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    if (!self._keys)
        return;
    for (var i = 0, count = self._keys.length; i < count; i++)
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", self._keys[i]);
    self._keys = nil;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPControllerSelectionProxy__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, change, context)
{
    ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", aKeyPath));
    var ___r1;
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function $CPControllerSelectionProxy__addObserver_forKeyPath_options_context_(self, _cmd, anObject, aKeyPath, options, context)
{
    var proxy = ((___r1 = _CPObservationProxy.isa.objj_msgSend0(_CPObservationProxy, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithKeyPath:observer:object:", aKeyPath, anObject, self));
    (proxy == null ? null : proxy.isa.objj_msgSend1(proxy, "setNotifyObject:", YES));
    ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", proxy));
    var observedObjects = ((___r1 = self._controller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedObjects"));
    self._observedObjectsByKeyPath[aKeyPath] = observedObjects;
    (observedObjects == null ? null : observedObjects.isa.objj_msgSend(observedObjects, "addObserver:forKeyPath:options:context:", proxy, aKeyPath, options, context));
    var ___r1;
}
,["void","id","CPString","CPKeyValueObservingOptions","id"]), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function $CPControllerSelectionProxy__removeObserver_forKeyPath_(self, _cmd, anObject, aKeyPath)
{
    var proxy = ((___r1 = _CPObservationProxy.isa.objj_msgSend0(_CPObservationProxy, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithKeyPath:observer:object:", aKeyPath, anObject, self)),
        index = ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", proxy));
    var observedObjects = self._observedObjectsByKeyPath[aKeyPath];
    (observedObjects == null ? null : observedObjects.isa.objj_msgSend2(observedObjects, "removeObserver:forKeyPath:", ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", index)), aKeyPath));
    ((___r1 = self._observationProxies), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", index));
    self._observedObjectsByKeyPath[aKeyPath] = nil;
    var ___r1;
}
,["void","id","CPString"])]);
}