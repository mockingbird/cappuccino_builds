@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;16;CPNotification.ji;8;CPNull.jt;10339;
objj_executeFile("CPArray.j", YES);
objj_executeFile("CPDictionary.j", YES);
objj_executeFile("CPException.j", YES);
objj_executeFile("CPNotification.j", YES);
objj_executeFile("CPNull.j", YES);

var CPNotificationDefaultCenter = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPNotificationCenter"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_namedRegistries"), new objj_ivar("_unnamedRegistry")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPNotificationCenter__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNotificationCenter").super_class }, "init");

    if (self)
    {
        _namedRegistries = objj_msgSend(CPDictionary, "dictionary");
        _unnamedRegistry = objj_msgSend(objj_msgSend(_CPNotificationRegistry, "alloc"), "init");
    }
   return self;
}
},["id"]), new objj_method(sel_getUid("addObserver:selector:name:object:"), function $CPNotificationCenter__addObserver_selector_name_object_(self, _cmd, anObserver, aSelector, aNotificationName, anObject)
{ with(self)
{
    var registry,
        observer = objj_msgSend(objj_msgSend(_CPNotificationObserver, "alloc"), "initWithObserver:selector:", anObserver, aSelector);

    if (aNotificationName == nil)
        registry = _unnamedRegistry;
    else if (!(registry = objj_msgSend(_namedRegistries, "objectForKey:", aNotificationName)))
    {
        registry = objj_msgSend(objj_msgSend(_CPNotificationRegistry, "alloc"), "init");
        objj_msgSend(_namedRegistries, "setObject:forKey:", registry, aNotificationName);
    }

    objj_msgSend(registry, "addObserver:object:", observer, anObject);
}
},["void","id","SEL","CPString","id"]), new objj_method(sel_getUid("removeObserver:"), function $CPNotificationCenter__removeObserver_(self, _cmd, anObserver)
{ with(self)
{
    var name = nil,
        names = objj_msgSend(_namedRegistries, "keyEnumerator");

    while ((name = objj_msgSend(names, "nextObject")) !== nil)
        objj_msgSend(objj_msgSend(_namedRegistries, "objectForKey:", name), "removeObserver:object:", anObserver, nil);

    objj_msgSend(_unnamedRegistry, "removeObserver:object:", anObserver, nil);
}
},["void","id"]), new objj_method(sel_getUid("removeObserver:name:object:"), function $CPNotificationCenter__removeObserver_name_object_(self, _cmd, anObserver, aNotificationName, anObject)
{ with(self)
{
    if (aNotificationName == nil)
    {
        var name = nil,
            names = objj_msgSend(_namedRegistries, "keyEnumerator");

        while ((name = objj_msgSend(names, "nextObject")) !== nil)
            objj_msgSend(objj_msgSend(_namedRegistries, "objectForKey:", name), "removeObserver:object:", anObserver, anObject);

        objj_msgSend(_unnamedRegistry, "removeObserver:object:", anObserver, anObject);
    }
    else
        objj_msgSend(objj_msgSend(_namedRegistries, "objectForKey:", aNotificationName), "removeObserver:object:", anObserver, anObject);
}
},["void","id","CPString","id"]), new objj_method(sel_getUid("postNotification:"), function $CPNotificationCenter__postNotification_(self, _cmd, aNotification)
{ with(self)
{
    if (!aNotification)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "postNotification: does not except 'nil' notifications");

    _CPNotificationCenterPostNotification(self, aNotification);
}
},["void","CPNotification"]), new objj_method(sel_getUid("postNotificationName:object:userInfo:"), function $CPNotificationCenter__postNotificationName_object_userInfo_(self, _cmd, aNotificationName, anObject, aUserInfo)
{ with(self)
{
   _CPNotificationCenterPostNotification(self, objj_msgSend(objj_msgSend(CPNotification, "alloc"), "initWithName:object:userInfo:", aNotificationName, anObject, aUserInfo));
}
},["void","CPString","id","CPDictionary"]), new objj_method(sel_getUid("postNotificationName:object:"), function $CPNotificationCenter__postNotificationName_object_(self, _cmd, aNotificationName, anObject)
{ with(self)
{
   _CPNotificationCenterPostNotification(self, objj_msgSend(objj_msgSend(CPNotification, "alloc"), "initWithName:object:userInfo:", aNotificationName, anObject, nil));
}
},["void","CPString","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultCenter"), function $CPNotificationCenter__defaultCenter(self, _cmd)
{ with(self)
{
    if (!CPNotificationDefaultCenter)
        CPNotificationDefaultCenter = objj_msgSend(objj_msgSend(CPNotificationCenter, "alloc"), "init");

    return CPNotificationDefaultCenter;
}
},["CPNotificationCenter"])]);
}

var _CPNotificationCenterPostNotification = function( self, aNotification)
{
    objj_msgSend(self._unnamedRegistry, "postNotification:", aNotification);
    objj_msgSend(objj_msgSend(self._namedRegistries, "objectForKey:", objj_msgSend(aNotification, "name")), "postNotification:", aNotification);
};





{var the_class = objj_allocateClassPair(CPObject, "_CPNotificationRegistry"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_objectObservers")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPNotificationRegistry__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPNotificationRegistry").super_class }, "init");

    if (self)
    {
        _objectObservers = objj_msgSend(CPDictionary, "dictionary");
    }

    return self;
}
},["id"]), new objj_method(sel_getUid("addObserver:object:"), function $_CPNotificationRegistry__addObserver_object_(self, _cmd, anObserver, anObject)
{ with(self)
{


    if (!anObject)
        anObject = objj_msgSend(CPNull, "null");


    var observers = objj_msgSend(_objectObservers, "objectForKey:", objj_msgSend(anObject, "UID"));

    if (!observers)
    {
        observers = objj_msgSend(CPMutableSet, "set");
        objj_msgSend(_objectObservers, "setObject:forKey:", observers, objj_msgSend(anObject, "UID"));
    }


    objj_msgSend(observers, "addObject:", anObserver);
}
},["void","_CPNotificationObserver","id"]), new objj_method(sel_getUid("removeObserver:object:"), function $_CPNotificationRegistry__removeObserver_object_(self, _cmd, anObserver, anObject)
{ with(self)
{
    var removedKeys = [];


    if (anObject == nil)
    {
        var key = nil,
            keys = objj_msgSend(_objectObservers, "keyEnumerator");


        while ((key = objj_msgSend(keys, "nextObject")) !== nil)
        {
            var observers = objj_msgSend(_objectObservers, "objectForKey:", key),
                observer = nil,
                observersEnumerator = objj_msgSend(observers, "objectEnumerator");

            while ((observer = objj_msgSend(observersEnumerator, "nextObject")) !== nil)
                if (objj_msgSend(observer, "observer") == anObserver)
                    objj_msgSend(observers, "removeObject:", observer);

            if (!objj_msgSend(observers, "count"))
                removedKeys.push(key);
        }
    }
    else
    {
        var key = objj_msgSend(anObject, "UID"),
            observers = objj_msgSend(_objectObservers, "objectForKey:", key),
            observer = nil,
            observersEnumerator = objj_msgSend(observers, "objectEnumerator");

        while ((observer = objj_msgSend(observersEnumerator, "nextObject")) !== nil)
            if (objj_msgSend(observer, "observer") == anObserver)
                objj_msgSend(observers, "removeObject:", observer);

        if (!objj_msgSend(observers, "count"))
            removedKeys.push(key);
    }

    var count = removedKeys.length;

    while (count--)
        objj_msgSend(_objectObservers, "removeObjectForKey:", removedKeys[count]);
}
},["void","id","id"]), new objj_method(sel_getUid("postNotification:"), function $_CPNotificationRegistry__postNotification_(self, _cmd, aNotification)
{ with(self)
{





    var object = objj_msgSend(aNotification, "object"),
        currentObservers = nil;

    if (object != nil && (currentObservers = objj_msgSend(_objectObservers, "objectForKey:", objj_msgSend(object, "UID"))))
    {
        var observers = objj_msgSend(currentObservers, "copy"),
            observer = nil,
            observersEnumerator = objj_msgSend(observers, "objectEnumerator");

        while ((observer = objj_msgSend(observersEnumerator, "nextObject")) !== nil)
        {

            if (objj_msgSend(currentObservers, "containsObject:", observer))
                objj_msgSend(observer, "postNotification:", aNotification);
        }
    }


    currentObservers = objj_msgSend(_objectObservers, "objectForKey:", objj_msgSend(objj_msgSend(CPNull, "null"), "UID"));

    if (!currentObservers)
        return;

    var observers = objj_msgSend(currentObservers, "copy"),
        observersEnumerator = objj_msgSend(observers, "objectEnumerator");

    while ((observer = objj_msgSend(observersEnumerator, "nextObject")) !== nil)
    {

        if (objj_msgSend(currentObservers, "containsObject:", observer))
            objj_msgSend(observer, "postNotification:", aNotification);
    }
}
},["void","CPNotification"]), new objj_method(sel_getUid("count"), function $_CPNotificationRegistry__count(self, _cmd)
{ with(self)
{
    return objj_msgSend(_objectObservers, "count");
}
},["unsigned"])]);
}


{var the_class = objj_allocateClassPair(CPObject, "_CPNotificationObserver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_observer"), new objj_ivar("_selector")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithObserver:selector:"), function $_CPNotificationObserver__initWithObserver_selector_(self, _cmd, anObserver, aSelector)
{ with(self)
{
    if (self)
    {
        _observer = anObserver;
        _selector = aSelector;
    }

   return self;
}
},["id","id","SEL"]), new objj_method(sel_getUid("observer"), function $_CPNotificationObserver__observer(self, _cmd)
{ with(self)
{
    return _observer;
}
},["id"]), new objj_method(sel_getUid("postNotification:"), function $_CPNotificationObserver__postNotification_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(_observer, "performSelector:withObject:", _selector, aNotification);
}
},["void","CPNotification"])]);
}

