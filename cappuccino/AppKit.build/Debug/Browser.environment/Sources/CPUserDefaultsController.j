@STATIC;1.0;I;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.jI;27;Foundation/CPUserDefaults.ji;14;CPController.jt;13714;objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("Foundation/CPUserDefaults.j", NO);objj_executeFile("CPController.j", YES);var SharedUserDefaultsController = nil;
{var the_class = objj_allocateClassPair(CPController, "CPUserDefaultsController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_defaults"), new objj_ivar("_initialValues"), new objj_ivar("_appliesImmediately"), new objj_ivar("_valueProxy")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("defaults"), function $CPUserDefaultsController__defaults(self, _cmd)
{
    return self._defaults;
}
,["CPUserDefaults"]), new objj_method(sel_getUid("initialValues"), function $CPUserDefaultsController__initialValues(self, _cmd)
{
    return self._initialValues;
}
,["CPDictionary"]), new objj_method(sel_getUid("setInitialValues:"), function $CPUserDefaultsController__setInitialValues_(self, _cmd, newValue)
{
    self._initialValues = newValue;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("appliesImmediately"), function $CPUserDefaultsController__appliesImmediately(self, _cmd)
{
    return self._appliesImmediately;
}
,["BOOL"]), new objj_method(sel_getUid("setAppliesImmediately:"), function $CPUserDefaultsController__setAppliesImmediately_(self, _cmd, newValue)
{
    self._appliesImmediately = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("initWithDefaults:initialValues:"), function $CPUserDefaultsController__initWithDefaults_initialValues_(self, _cmd, someDefaults, initialValues)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaultsController").super_class }, "init"))
    {
        if (!someDefaults)
            someDefaults = CPUserDefaults.isa.objj_msgSend0(CPUserDefaults, "standardUserDefaults");
        self._defaults = someDefaults;
        self._initialValues = (initialValues == null ? null : initialValues.isa.objj_msgSend0(initialValues, "copy"));
        self._appliesImmediately = YES;
        self._valueProxy = ((___r1 = (_CPUserDefaultsControllerProxy == null ? null : _CPUserDefaultsControllerProxy.isa.objj_msgSend0(_CPUserDefaultsControllerProxy, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithController:", self));
    }
    return self;
    var ___r1;
}
,["id","CPUserDefaults","CPDictionary"]), new objj_method(sel_getUid("values"), function $CPUserDefaultsController__values(self, _cmd)
{
    return self._valueProxy;
}
,["id"]), new objj_method(sel_getUid("hasUnappliedChanges"), function $CPUserDefaultsController__hasUnappliedChanges(self, _cmd)
{
    return ((___r1 = self._valueProxy), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "hasUnappliedChanges"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("save:"), function $CPUserDefaultsController__save_(self, _cmd, sender)
{
    ((___r1 = self._valueProxy), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "save"));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("revert:"), function $CPUserDefaultsController__revert_(self, _cmd, sender)
{
    ((___r1 = self._valueProxy), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "revert"));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("revertToInitialValues:"), function $CPUserDefaultsController__revertToInitialValues_(self, _cmd, sender)
{
    ((___r1 = self._valueProxy), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "revertToInitialValues"));
    var ___r1;
}
,["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedUserDefaultsController"), function $CPUserDefaultsController__sharedUserDefaultsController(self, _cmd)
{
    if (!SharedUserDefaultsController)
        SharedUserDefaultsController = ((___r1 = CPUserDefaultsController.isa.objj_msgSend0(CPUserDefaultsController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithDefaults:initialValues:", nil, nil));
    return SharedUserDefaultsController;
    var ___r1;
}
,["id"])]);
}var CPUserDefaultsControllerSharedKey = "CPUserDefaultsControllerSharedKey";
{
var the_class = objj_getClass("CPUserDefaultsController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPUserDefaultsController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPUserDefaultsController__initWithCoder_(self, _cmd, aCoder)
{
    if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPUserDefaultsControllerSharedKey)))
        return CPUserDefaultsController.isa.objj_msgSend0(CPUserDefaultsController, "sharedUserDefaultsController");
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaultsController").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "decoding of non-shared CPUserDefaultsController not implemented");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPUserDefaultsController__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaultsController").super_class }, "encodeWithCoder:", aCoder);
    if (self === SharedUserDefaultsController)
    {
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", YES, CPUserDefaultsControllerSharedKey));
        return;
    }
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "encoding of non-shared CPUserDefaultsController not implemented");
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPUserDefaultsControllerProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_controller"), new objj_ivar("_cachedValues")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithController:"), function $_CPUserDefaultsControllerProxy__initWithController_(self, _cmd, aController)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPUserDefaultsControllerProxy").super_class }, "init"))
    {
        self._controller = aController;
        self._cachedValues = CPMutableDictionary.isa.objj_msgSend0(CPMutableDictionary, "dictionary");
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("userDefaultsDidChange:"), CPUserDefaultsDidChangeNotification, ((___r2 = self._controller), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "defaults"))));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CPUserDefaultsController"]), new objj_method(sel_getUid("dealloc"), function $_CPUserDefaultsControllerProxy__dealloc(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObserver:", self));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPUserDefaultsControllerProxy").super_class }, "dealloc");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("valueForKey:"), function $_CPUserDefaultsControllerProxy__valueForKey_(self, _cmd, aKey)
{
    var value = ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aKey));
    if (value === nil)
    {
        value = ((___r1 = ((___r2 = self._controller), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "defaults"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aKey));
        if (value === nil)
            value = ((___r1 = ((___r2 = self._controller), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "initialValues"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aKey));
        if (value !== nil)
            ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", value, aKey));
    }
    return value;
    var ___r1, ___r2;
}
,["id","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $_CPUserDefaultsControllerProxy__setValue_forKey_(self, _cmd, aValue, aKey)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", aKey);
    ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", aValue, aKey));
    if (((___r1 = self._controller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "appliesImmediately")))
        ((___r1 = ((___r2 = self._controller), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "defaults"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", aValue, aKey));
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", aKey);
    var ___r1, ___r2;
}
,["void","id","CPString"]), new objj_method(sel_getUid("revert"), function $_CPUserDefaultsControllerProxy__revert(self, _cmd)
{
    var keys = ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys")),
        keysCount = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count"));
    while (keysCount--)
    {
        var key = keys[keysCount];
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", key);
        ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", key));
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", key);
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("save"), function $_CPUserDefaultsControllerProxy__save(self, _cmd)
{
    var keys = ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys")),
        keysCount = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count"));
    while (keysCount--)
    {
        var key = keys[keysCount];
        ((___r1 = ((___r2 = self._controller), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "defaults"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", ((___r2 = self._cachedValues), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectForKey:", key)), key));
    }
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("revertToInitialValues"), function $_CPUserDefaultsControllerProxy__revertToInitialValues(self, _cmd)
{
    var initial = ((___r1 = self._controller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "initialValues")),
        keys = ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys")),
        keysCount = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count"));
    while (keysCount--)
    {
        var key = keys[keysCount];
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", key);
        var initialValue = (initial == null ? null : initial.isa.objj_msgSend1(initial, "objectForKey:", key));
        if (initialValue !== nil)
            ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", initialValue, key));
        else
            ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", key));
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", key);
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("userDefaultsDidChange:"), function $_CPUserDefaultsControllerProxy__userDefaultsDidChange_(self, _cmd, aNotification)
{
    var defaults = ((___r1 = self._controller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaults")),
        keys = ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys")),
        keysCount = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count"));
    while (keysCount--)
    {
        var key = keys[keysCount],
            value = ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", key)),
            newValue = (defaults == null ? null : defaults.isa.objj_msgSend1(defaults, "objectForKey:", key));
        if (!(value == null ? null : value.isa.objj_msgSend1(value, "isEqual:", newValue)))
        {
            self.isa.objj_msgSend1(self, "willChangeValueForKey:", key);
            ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", newValue, key));
            self.isa.objj_msgSend1(self, "didChangeValueForKey:", key);
        }
    }
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("hasUnappliedChanges"), function $_CPUserDefaultsControllerProxy__hasUnappliedChanges(self, _cmd)
{
    var defaults = ((___r1 = self._controller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaults")),
        keys = ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys")),
        keysCount = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count"));
    while (keysCount--)
    {
        var key = keys[keysCount],
            value = ((___r1 = self._cachedValues), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", key)),
            newValue = (defaults == null ? null : defaults.isa.objj_msgSend1(defaults, "objectForKey:", key));
        if (!(value == null ? null : value.isa.objj_msgSend1(value, "isEqual:", newValue)))
            return YES;
    }
    return NO;
    var ___r1;
}
,["BOOL"])]);
}