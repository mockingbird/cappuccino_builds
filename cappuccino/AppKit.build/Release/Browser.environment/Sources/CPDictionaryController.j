@STATIC;1.0;i;19;CPArrayController.jt;7656;objj_executeFile("CPArrayController.j", YES);{var the_class = objj_allocateClassPair(CPArrayController, "CPDictionaryController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentDictionary"), new objj_ivar("_includedKeys"), new objj_ivar("_excludedKeys"), new objj_ivar("_initialKey"), new objj_ivar("_initialValue")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("includedKeys"), function $CPDictionaryController__includedKeys(self, _cmd)
{
    return self._includedKeys;
}
,["CPArray"]), new objj_method(sel_getUid("setIncludedKeys:"), function $CPDictionaryController__setIncludedKeys_(self, _cmd, newValue)
{
    self._includedKeys = newValue;
}
,["void","CPArray"]), new objj_method(sel_getUid("excludedKeys"), function $CPDictionaryController__excludedKeys(self, _cmd)
{
    return self._excludedKeys;
}
,["CPArray"]), new objj_method(sel_getUid("setExcludedKeys:"), function $CPDictionaryController__setExcludedKeys_(self, _cmd, newValue)
{
    self._excludedKeys = newValue;
}
,["void","CPArray"]), new objj_method(sel_getUid("initialKey"), function $CPDictionaryController__initialKey(self, _cmd)
{
    return self._initialKey;
}
,["CPString"]), new objj_method(sel_getUid("setInitialKey:"), function $CPDictionaryController__setInitialKey_(self, _cmd, newValue)
{
    self._initialKey = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("initialValue"), function $CPDictionaryController__initialValue(self, _cmd)
{
    return self._initialValue;
}
,["id"]), new objj_method(sel_getUid("setInitialValue:"), function $CPDictionaryController__setInitialValue_(self, _cmd, newValue)
{
    self._initialValue = newValue;
}
,["void","id"]), new objj_method(sel_getUid("init"), function $CPDictionaryController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDictionaryController").super_class }, "init");
    if (self)
    {
        self._initialKey = "key";
        self._initialValue = "value";
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("newObject"), function $CPDictionaryController__newObject(self, _cmd)
{
    var keys = objj_msgSend(self._contentDictionary, "allKeys"),
        newKey = self._initialKey,
        count = 0;
    if (objj_msgSend(keys, "containsObject:", newKey))
        while (objj_msgSend(keys, "containsObject:", newKey))
            newKey = objj_msgSend(CPString, "stringWithFormat:", "%@%i", self._initialKey, ++count);
    return objj_msgSend(self, "_newObjectWithKey:value:", newKey, self._initialValue);
}
,["id"]), new objj_method(sel_getUid("_newObjectWithKey:value:"), function $CPDictionaryController___newObjectWithKey_value_(self, _cmd, aKey, aValue)
{
    var aNewObject = objj_msgSend(_CPDictionaryControllerKeyValuePair, "new");
    aNewObject._dictionary = self._contentDictionary;
    aNewObject._controller = self;
    aNewObject._key = aKey;
    if (aValue !== nil)
        objj_msgSend(aNewObject, "setValue:", aValue);
    return aNewObject;
}
,["id","CPString","id"]), new objj_method(sel_getUid("contentDictionary"), function $CPDictionaryController__contentDictionary(self, _cmd)
{
    return self._contentDictionary;
}
,["CPDictionary"]), new objj_method(sel_getUid("setContentDictionary:"), function $CPDictionaryController__setContentDictionary_(self, _cmd, aDictionary)
{
    if (aDictionary == self._contentDictionary)
        return;
    if (objj_msgSend(aDictionary, "isKindOfClass:", objj_msgSend(CPDictionary, "class")))
        self._contentDictionary = aDictionary;
    else
        self._contentDictionary = nil;
    var array = objj_msgSend(CPArray, "array"),
        allKeys = objj_msgSend(self._contentDictionary, "allKeys");
    objj_msgSend(allKeys, "addObjectsFromArray:", self._includedKeys);
    var iter = objj_msgSend(objj_msgSend(CPSet, "setWithArray:", allKeys), "objectEnumerator"),
        obj;
    while ((obj = objj_msgSend(iter, "nextObject")) !== nil)
        if (!objj_msgSend(self._excludedKeys, "containsObject:", obj))
            objj_msgSend(array, "addObject:", objj_msgSend(self, "_newObjectWithKey:value:", obj, nil));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDictionaryController").super_class }, "setContent:", array);
}
,["void","CPDictionary"])]);
}var CPIncludedKeys = "CPIncludedKeys",
    CPExcludedKeys = "CPExcludedKeys";
{
var the_class = objj_getClass("CPDictionaryController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDictionaryController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPDictionaryController__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDictionaryController").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._includedKeys = objj_msgSend(aCoder, "decodeObjectForKey:", CPIncludedKeys);
        self._excludedKeys = objj_msgSend(aCoder, "decodeObjectForKey:", CPExcludedKeys);
        self._initialKey = "key";
        self._initialValue = "value";
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPDictionaryController__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDictionaryController").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._includedKeys, CPIncludedKeys);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._excludedKeys, CPExcludedKeys);
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPDictionaryControllerKeyValuePair"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_key"), new objj_ivar("_dictionary"), new objj_ivar("_controller")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("key"), function $_CPDictionaryControllerKeyValuePair__key(self, _cmd)
{
    return self._key;
}
,["CPString"]), new objj_method(sel_getUid("setKey:"), function $_CPDictionaryControllerKeyValuePair__setKey_(self, _cmd, newValue)
{
    self._key = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("dictionary"), function $_CPDictionaryControllerKeyValuePair__dictionary(self, _cmd)
{
    return self._dictionary;
}
,["CPDictionary"]), new objj_method(sel_getUid("setDictionary:"), function $_CPDictionaryControllerKeyValuePair__setDictionary_(self, _cmd, newValue)
{
    self._dictionary = newValue;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("controller"), function $_CPDictionaryControllerKeyValuePair__controller(self, _cmd)
{
    return self._controller;
}
,["CPDictionaryController"]), new objj_method(sel_getUid("setController:"), function $_CPDictionaryControllerKeyValuePair__setController_(self, _cmd, newValue)
{
    self._controller = newValue;
}
,["void","CPDictionaryController"]), new objj_method(sel_getUid("value"), function $_CPDictionaryControllerKeyValuePair__value(self, _cmd)
{
    return objj_msgSend(self._dictionary, "objectForKey:", self._key);
}
,["id"]), new objj_method(sel_getUid("setValue:"), function $_CPDictionaryControllerKeyValuePair__setValue_(self, _cmd, aValue)
{
    objj_msgSend(self._dictionary, "setObject:forKey:", aValue, self._key);
}
,["void","id"]), new objj_method(sel_getUid("isExplicitlyIncluded"), function $_CPDictionaryControllerKeyValuePair__isExplicitlyIncluded(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._controller, "_includedKeys"), "containsObject:", self._key);
}
,["BOOL"])]);
}