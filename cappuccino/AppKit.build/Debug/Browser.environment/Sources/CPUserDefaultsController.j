@STATIC;1.0;I;21;Foundation/CPString.jI;21;AppKit/CPController.jt;10626;


objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("AppKit/CPController.j", NO);

var SharedUserDefaultsController = nil;

{var the_class = objj_allocateClassPair(CPController, "CPUserDefaultsController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_defaults"), new objj_ivar("_initialValues"), new objj_ivar("_appliesImmediately")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("defaults"), function $CPUserDefaultsController__defaults(self, _cmd)
{ with(self)
{
return _defaults;
}
},["id"]),
new objj_method(sel_getUid("initialValues"), function $CPUserDefaultsController__initialValues(self, _cmd)
{ with(self)
{
return _initialValues;
}
},["id"]),
new objj_method(sel_getUid("setInitialValues:"), function $CPUserDefaultsController__setInitialValues_(self, _cmd, newValue)
{ with(self)
{
_initialValues = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("appliesImmediately"), function $CPUserDefaultsController__appliesImmediately(self, _cmd)
{ with(self)
{
return _appliesImmediately;
}
},["id"]),
new objj_method(sel_getUid("setAppliesImmediately:"), function $CPUserDefaultsController__setAppliesImmediately_(self, _cmd, newValue)
{ with(self)
{
_appliesImmediately = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithDefaults:initialValues:"), function $CPUserDefaultsController__initWithDefaults_initialValues_(self, _cmd, someDefaults, initialValues)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaultsController").super_class }, "init"))
    {
        if (!someDefaults)
            someDefaults = objj_msgSend(CPUserDefaults, "standardUserDefaults");

        _defaults = someDefaults;
        _initialValues = objj_msgSend(initialValues, "copy");
        _appliesImmediately = YES;
        _valueProxy = objj_msgSend(objj_msgSend(_CPUserDefaultsControllerProxy, "alloc"), "initWithController:", self);
    }

    return self;
}
},["id","CPUserDefaults","CPDictionary"]), new objj_method(sel_getUid("values"), function $CPUserDefaultsController__values(self, _cmd)
{ with(self)
{
    return _valueProxy;
}
},["id"]), new objj_method(sel_getUid("hasUnappliedChanges"), function $CPUserDefaultsController__hasUnappliedChanges(self, _cmd)
{ with(self)
{
    return objj_msgSend(_valueProxy, "hasUnappliedChanges");
}
},["BOOL"]), new objj_method(sel_getUid("save:"), function $CPUserDefaultsController__save_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(_valueProxy, "save");
}
},["void","id"]), new objj_method(sel_getUid("revert:"), function $CPUserDefaultsController__revert_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(_valueProxy, "revert");
}
},["void","id"]), new objj_method(sel_getUid("revertToInitialValues:"), function $CPUserDefaultsController__revertToInitialValues_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(_valueProxy, "revertToInitialValues");
}
},["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedUserDefaultsController"), function $CPUserDefaultsController__sharedUserDefaultsController(self, _cmd)
{ with(self)
{
    if (!SharedUserDefaultsController)
        SharedUserDefaultsController = objj_msgSend(objj_msgSend(CPUserDefaultsController, "alloc"), "initWithDefaults:initialValues:", nil, nil);

    return SharedUserDefaultsController;
}
},["id"])]);
}


var CPUserDefaultsControllerSharedKey = "CPUserDefaultsControllerSharedKey";

{
var the_class = objj_getClass("CPUserDefaultsController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPUserDefaultsController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPUserDefaultsController__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (objj_msgSend(aCoder, "decodeBoolForKey:", CPUserDefaultsControllerSharedKey))
        return objj_msgSend(CPUserDefaultsController, "sharedUserDefaultsController");

    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaultsController").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "decoding of non-shared CPUserDefaultsController not implemented");
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPUserDefaultsController__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaultsController").super_class }, "encodeWithCoder:", aCoder);

    if (self === SharedUserDefaultsController)
    {
        objj_msgSend(aCoder, "encodeBool:forKey:", YES, CPUserDefaultsControllerSharedKey);
        return;
    }

    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "encoding of non-shared CPUserDefaultsController not implemented");
}
},["void","CPCoder"])]);
}


{var the_class = objj_allocateClassPair(CPObject, "_CPUserDefaultsControllerProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_controller"), new objj_ivar("_cachedValues")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithController:"), function $_CPUserDefaultsControllerProxy__initWithController_(self, _cmd, aController)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPUserDefaultsControllerProxy").super_class }, "init"))
    {
        _controller = aController;
        _cachedValues = objj_msgSend(CPMutableDictionary, "dictionary");

        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("userDefaultsDidChange:"), CPUserDefaultsDidChangeNotification, objj_msgSend(_controller, "defaults"));
    }

    return self;
}
},["id","CPUserDefaultsController"]), new objj_method(sel_getUid("dealloc"), function $_CPUserDefaultsControllerProxy__dealloc(self, _cmd)
{ with(self)
{

    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:", self);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPUserDefaultsControllerProxy").super_class }, "dealloc");
}
},["void"]), new objj_method(sel_getUid("valueForKey:"), function $_CPUserDefaultsControllerProxy__valueForKey_(self, _cmd, aKey)
{ with(self)
{
    var value = objj_msgSend(_cachedValues, "objectForKey:", aKey);
    if (value === nil)
    {
        value = objj_msgSend(objj_msgSend(_controller, "defaults"), "objectForKey:", aKey);
        if (value === nil)
            value = objj_msgSend(objj_msgSend(_controller, "initialValues"), "objectForKey:", aKey);

        if (value !== nil)
            objj_msgSend(_cachedValues, "setObject:forKey:", value, aKey);
    }
    return value;
}
},["id","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $_CPUserDefaultsControllerProxy__setValue_forKey_(self, _cmd, aValue, aKey)
{ with(self)
{
    objj_msgSend(self, "willChangeValueForKey:", aKey);
    objj_msgSend(_cachedValues, "setObject:forKey:", aValue, aKey);
    if (objj_msgSend(_controller, "appliesImmediately"))
        objj_msgSend(objj_msgSend(_controller, "defaults"), "setObject:forKey:", aValue, aKey);
    objj_msgSend(self, "didChangeValueForKey:", aKey);
}
},["void","id","CPString"]), new objj_method(sel_getUid("revert"), function $_CPUserDefaultsControllerProxy__revert(self, _cmd)
{ with(self)
{
    var keys = objj_msgSend(_cachedValues, "allKeys"),
        keysCount = objj_msgSend(keys, "count");

    while (keysCount--)
    {
        var key = keys[keysCount];
        objj_msgSend(self, "willChangeValueForKey:", key);
        objj_msgSend(_cachedValues, "removeObjectForKey:", key);
        objj_msgSend(self, "didChangeValueForKey:", key);
    }
}
},["void"]), new objj_method(sel_getUid("save"), function $_CPUserDefaultsControllerProxy__save(self, _cmd)
{ with(self)
{
    var keys = objj_msgSend(_cachedValues, "allKeys"),
        keysCount = objj_msgSend(keys, "count");

    while (keysCount--)
    {
        var key = keys[keysCount];
        objj_msgSend(objj_msgSend(_controller, "defaults"), "setObject:forKey:", objj_msgSend(_cachedValues, "objectForKey:", key), key);
    }
}
},["void"]), new objj_method(sel_getUid("revertToInitialValues"), function $_CPUserDefaultsControllerProxy__revertToInitialValues(self, _cmd)
{ with(self)
{
    var initial = objj_msgSend(_controller, "initialValues"),
        keys = objj_msgSend(_cachedValues, "allKeys"),
        keysCount = objj_msgSend(keys, "count");

    while (keysCount--)
    {
        var key = keys[keysCount];
        objj_msgSend(self, "willChangeValueForKey:", key);

        var initialValue = objj_msgSend(initial, "objectForKey:", key);
        if (initialValue !== nil)
            objj_msgSend(_cachedValues, "setObject:forKey:", initialValue, key);
        else
            objj_msgSend(_cachedValues, "removeObjectForKey:", key);

        objj_msgSend(self, "didChangeValueForKey:", key);

    }
}
},["void"]), new objj_method(sel_getUid("userDefaultsDidChange:"), function $_CPUserDefaultsControllerProxy__userDefaultsDidChange_(self, _cmd, aNotification)
{ with(self)
{
    var defaults = objj_msgSend(_controller, "defaults"),
        keys = objj_msgSend(_cachedValues, "allKeys"),
        keysCount = objj_msgSend(keys, "count");

    while (keysCount--)
    {
        var key = keys[keysCount],
            value = objj_msgSend(_cachedValues, "objectForKey:", key),
            newValue = objj_msgSend(defaults, "objectForKey:", key);

        if (!objj_msgSend(value, "isEqual:", newValue))
        {
            objj_msgSend(self, "willChangeValueForKey:", key);
            objj_msgSend(_cachedValues, "setObject:forKey:", newValue, key);
            objj_msgSend(self, "didChangeValueForKey:", key);
        }
    }
}
},["void","CPNotification"]), new objj_method(sel_getUid("hasUnappliedChanges"), function $_CPUserDefaultsControllerProxy__hasUnappliedChanges(self, _cmd)
{ with(self)
{
    var defaults = objj_msgSend(_controller, "defaults"),
        keys = objj_msgSend(_cachedValues, "allKeys"),
        keysCount = objj_msgSend(keys, "count");

    while (keysCount--)
    {
        var key = keys[keysCount],
            value = objj_msgSend(_cachedValues, "objectForKey:", key),
            newValue = objj_msgSend(defaults, "objectForKey:", key);

        if (!objj_msgSend(value, "isEqual:", newValue))
            return YES;
    }

    return NO;
}
},["BOOL"])]);
}

