@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;16;CPNotification.ji;8;CPNull.ji;7;CPSet.jt;13983;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPNotification.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("CPSet.j", YES);var CPNotificationDefaultCenter = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPNotificationCenter"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_namedRegistries"), new objj_ivar("_unnamedRegistry")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPNotificationCenter__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNotificationCenter").super_class }, "init");
    if (self)
    {
        self._namedRegistries = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._unnamedRegistry = ((___r1 = (_CPNotificationRegistry == null ? null : _CPNotificationRegistry.isa.objj_msgSend0(_CPNotificationRegistry, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("addObserver:selector:name:object:"), function $CPNotificationCenter__addObserver_selector_name_object_(self, _cmd, anObserver, aSelector, aNotificationName, anObject)
{
    var registry,
        observer = ((___r1 = (_CPNotificationObserver == null ? null : _CPNotificationObserver.isa.objj_msgSend0(_CPNotificationObserver, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithObserver:selector:", anObserver, aSelector));
    if (aNotificationName == nil)
        registry = self._unnamedRegistry;
    else if (!(registry = ((___r1 = self._namedRegistries), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aNotificationName))))
    {
        registry = ((___r1 = (_CPNotificationRegistry == null ? null : _CPNotificationRegistry.isa.objj_msgSend0(_CPNotificationRegistry, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = self._namedRegistries), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", registry, aNotificationName));
    }
    (registry == null ? null : registry.isa.objj_msgSend2(registry, "addObserver:object:", observer, anObject));
    var ___r1;
}
,["void","id","SEL","CPString","id"]), new objj_method(sel_getUid("removeObserver:"), function $CPNotificationCenter__removeObserver_(self, _cmd, anObserver)
{
    var name = nil,
        names = ((___r1 = self._namedRegistries), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyEnumerator"));
    while ((name = (names == null ? null : names.isa.objj_msgSend0(names, "nextObject"))) !== nil)
        ((___r1 = ((___r2 = self._namedRegistries), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectForKey:", name))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:object:", anObserver, nil));
    ((___r1 = self._unnamedRegistry), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:object:", anObserver, nil));
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("removeObserver:name:object:"), function $CPNotificationCenter__removeObserver_name_object_(self, _cmd, anObserver, aNotificationName, anObject)
{
    if (aNotificationName == nil)
    {
        var name = nil,
            names = ((___r1 = self._namedRegistries), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyEnumerator"));
        while ((name = (names == null ? null : names.isa.objj_msgSend0(names, "nextObject"))) !== nil)
            ((___r1 = ((___r2 = self._namedRegistries), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectForKey:", name))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:object:", anObserver, anObject));
        ((___r1 = self._unnamedRegistry), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:object:", anObserver, anObject));
    }
    else
        ((___r1 = ((___r2 = self._namedRegistries), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectForKey:", aNotificationName))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:object:", anObserver, anObject));
    var ___r1, ___r2;
}
,["void","id","CPString","id"]), new objj_method(sel_getUid("postNotification:"), function $CPNotificationCenter__postNotification_(self, _cmd, aNotification)
{
    if (!aNotification)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "postNotification: does not except 'nil' notifications");
    _CPNotificationCenterPostNotification(self, aNotification);
}
,["void","CPNotification"]), new objj_method(sel_getUid("postNotificationName:object:userInfo:"), function $CPNotificationCenter__postNotificationName_object_userInfo_(self, _cmd, aNotificationName, anObject, aUserInfo)
{
    _CPNotificationCenterPostNotification(self, ((___r1 = CPNotification.isa.objj_msgSend0(CPNotification, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithName:object:userInfo:", aNotificationName, anObject, aUserInfo)));
    var ___r1;
}
,["void","CPString","id","CPDictionary"]), new objj_method(sel_getUid("postNotificationName:object:"), function $CPNotificationCenter__postNotificationName_object_(self, _cmd, aNotificationName, anObject)
{
    _CPNotificationCenterPostNotification(self, ((___r1 = CPNotification.isa.objj_msgSend0(CPNotification, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithName:object:userInfo:", aNotificationName, anObject, nil)));
    var ___r1;
}
,["void","CPString","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultCenter"), function $CPNotificationCenter__defaultCenter(self, _cmd)
{
    if (!CPNotificationDefaultCenter)
        CPNotificationDefaultCenter = ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return CPNotificationDefaultCenter;
    var ___r1;
}
,["CPNotificationCenter"])]);
}var _CPNotificationCenterPostNotification = function(self, aNotification)
{
    ((___r1 = self._unnamedRegistry), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "postNotification:", aNotification));
    ((___r1 = ((___r2 = self._namedRegistries), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectForKey:", (aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "name"))))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "postNotification:", aNotification));
    var ___r1, ___r2;
};
{var the_class = objj_allocateClassPair(CPObject, "_CPNotificationRegistry"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_objectObservers")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPNotificationRegistry__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPNotificationRegistry").super_class }, "init");
    if (self)
    {
        self._objectObservers = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("addObserver:object:"), function $_CPNotificationRegistry__addObserver_object_(self, _cmd, anObserver, anObject)
{
    if (!anObject)
        anObject = CPNull.isa.objj_msgSend0(CPNull, "null");
    var observers = ((___r1 = self._objectObservers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"))));
    if (!observers)
    {
        observers = CPMutableSet.isa.objj_msgSend0(CPMutableSet, "set");
        ((___r1 = self._objectObservers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", observers, (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"))));
    }
    (observers == null ? null : observers.isa.objj_msgSend1(observers, "addObject:", anObserver));
    var ___r1;
}
,["void","_CPNotificationObserver","id"]), new objj_method(sel_getUid("removeObserver:object:"), function $_CPNotificationRegistry__removeObserver_object_(self, _cmd, anObserver, anObject)
{
    var removedKeys = [];
    if (anObject == nil)
    {
        var key = nil,
            keys = ((___r1 = self._objectObservers), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyEnumerator"));
        while ((key = (keys == null ? null : keys.isa.objj_msgSend0(keys, "nextObject"))) !== nil)
        {
            var observers = ((___r1 = self._objectObservers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", key)),
                observer = nil,
                observersEnumerator = (observers == null ? null : observers.isa.objj_msgSend0(observers, "objectEnumerator"));
            while ((observer = (observersEnumerator == null ? null : observersEnumerator.isa.objj_msgSend0(observersEnumerator, "nextObject"))) !== nil)
                if ((observer == null ? null : observer.isa.objj_msgSend0(observer, "observer")) == anObserver)
                    (observers == null ? null : observers.isa.objj_msgSend1(observers, "removeObject:", observer));
            if (!(observers == null ? null : observers.isa.objj_msgSend0(observers, "count")))
                removedKeys.push(key);
        }
    }
    else
    {
        var key = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID")),
            observers = ((___r1 = self._objectObservers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", key)),
            observer = nil,
            observersEnumerator = (observers == null ? null : observers.isa.objj_msgSend0(observers, "objectEnumerator"));
        while ((observer = (observersEnumerator == null ? null : observersEnumerator.isa.objj_msgSend0(observersEnumerator, "nextObject"))) !== nil)
            if ((observer == null ? null : observer.isa.objj_msgSend0(observer, "observer")) == anObserver)
                (observers == null ? null : observers.isa.objj_msgSend1(observers, "removeObject:", observer));
        if (!(observers == null ? null : observers.isa.objj_msgSend0(observers, "count")))
            removedKeys.push(key);
    }
    var count = removedKeys.length;
    while (count--)
        ((___r1 = self._objectObservers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", removedKeys[count]));
    var ___r1;
}
,["void","id","id"]), new objj_method(sel_getUid("postNotification:"), function $_CPNotificationRegistry__postNotification_(self, _cmd, aNotification)
{
    var object = (aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "object")),
        currentObservers = nil;
    if (object != nil && (currentObservers = ((___r1 = self._objectObservers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", (object == null ? null : object.isa.objj_msgSend0(object, "UID"))))))
    {
        var observers = (currentObservers == null ? null : currentObservers.isa.objj_msgSend0(currentObservers, "copy")),
            observer = nil,
            observersEnumerator = (observers == null ? null : observers.isa.objj_msgSend0(observers, "objectEnumerator"));
        while ((observer = (observersEnumerator == null ? null : observersEnumerator.isa.objj_msgSend0(observersEnumerator, "nextObject"))) !== nil)
        {
            if ((currentObservers == null ? null : currentObservers.isa.objj_msgSend1(currentObservers, "containsObject:", observer)))
                (observer == null ? null : observer.isa.objj_msgSend1(observer, "postNotification:", aNotification));
        }
    }
    currentObservers = ((___r1 = self._objectObservers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", ((___r2 = CPNull.isa.objj_msgSend0(CPNull, "null")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "UID"))));
    if (!currentObservers)
        return;
    var observers = (currentObservers == null ? null : currentObservers.isa.objj_msgSend0(currentObservers, "copy")),
        observersEnumerator = (observers == null ? null : observers.isa.objj_msgSend0(observers, "objectEnumerator"));
    while ((observer = (observersEnumerator == null ? null : observersEnumerator.isa.objj_msgSend0(observersEnumerator, "nextObject"))) !== nil)
    {
        if ((currentObservers == null ? null : currentObservers.isa.objj_msgSend1(currentObservers, "containsObject:", observer)))
            (observer == null ? null : observer.isa.objj_msgSend1(observer, "postNotification:", aNotification));
    }
    var ___r1, ___r2;
}
,["void","CPNotification"]), new objj_method(sel_getUid("count"), function $_CPNotificationRegistry__count(self, _cmd)
{
    return ((___r1 = self._objectObservers), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["unsigned"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPNotificationObserver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_observer"), new objj_ivar("_selector")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithObserver:selector:"), function $_CPNotificationObserver__initWithObserver_selector_(self, _cmd, anObserver, aSelector)
{
    if (self)
    {
        self._observer = anObserver;
        self._selector = aSelector;
    }
    return self;
}
,["id","id","SEL"]), new objj_method(sel_getUid("observer"), function $_CPNotificationObserver__observer(self, _cmd)
{
    return self._observer;
}
,["id"]), new objj_method(sel_getUid("postNotification:"), function $_CPNotificationObserver__postNotification_(self, _cmd, aNotification)
{
    ((___r1 = self._observer), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", self._selector, aNotification));
    var ___r1;
}
,["void","CPNotification"])]);
}