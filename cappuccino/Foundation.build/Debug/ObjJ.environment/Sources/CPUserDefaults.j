@STATIC;1.0;i;10;CPBundle.ji;8;CPData.ji;14;CPDictionary.ji;13;CPException.ji;17;CPKeyedArchiver.ji;19;CPKeyedUnarchiver.ji;22;CPNotificationCenter.ji;10;CPObject.ji;11;CPRunLoop.ji;10;CPString.ji;7;CPURL.ji;17;CPURLConnection.ji;14;CPURLRequest.jt;19374;objj_executeFile("CPBundle.j", YES);objj_executeFile("CPData.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPKeyedArchiver.j", YES);objj_executeFile("CPKeyedUnarchiver.j", YES);objj_executeFile("CPNotificationCenter.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRunLoop.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPURL.j", YES);objj_executeFile("CPURLConnection.j", YES);objj_executeFile("CPURLRequest.j", YES);CPArgumentDomain = "CPArgumentDomain";
CPApplicationDomain = objj_msgSend(objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "infoDictionary"), "objectForKey:", "CPBundleIdentifier") || "CPApplicationDomain";
CPGlobalDomain = "CPGlobalDomain";
CPLocaleDomain = "CPLocaleDomain";
CPRegistrationDomain = "CPRegistrationDomain";
CPUserDefaultsDidChangeNotification = "CPUserDefaultsDidChangeNotification";
var StandardUserDefaults;
{var the_class = objj_allocateClassPair(CPObject, "CPUserDefaults"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_domains"), new objj_ivar("_stores"), new objj_ivar("_searchList"), new objj_ivar("_searchListNeedsReload")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPUserDefaults__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaults").super_class }, "init");
    if (self)
    {
        self._domains = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        objj_msgSend(self, "_setupArgumentsDomain");
        var defaultStore = objj_msgSend(CPUserDefaultsLocalStore, "supportsLocalStorage") ? CPUserDefaultsLocalStore : CPUserDefaultsCookieStore;
        self._stores = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        objj_msgSend(self, "setPersistentStoreClass:forDomain:reloadData:", defaultStore, CPGlobalDomain, YES);
        objj_msgSend(self, "setPersistentStoreClass:forDomain:reloadData:", defaultStore, CPApplicationDomain, YES);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("_setupArgumentsDomain"), function $CPUserDefaults___setupArgumentsDomain(self, _cmd)
{
    var args = objj_msgSend(CPApp, "namedArguments"),
        keys = objj_msgSend(args, "allKeys"),
        count = objj_msgSend(keys, "count"),
        i = 0;
    for (; i < count; i++)
    {
        var key = keys[i];
        objj_msgSend(self, "setObject:forKey:inDomain:", objj_msgSend(args, "objectForKey:", key), key, CPArgumentDomain);
    }
}
,["void"]), new objj_method(sel_getUid("objectForKey:"), function $CPUserDefaults__objectForKey_(self, _cmd, aKey)
{
    if (self._searchListNeedsReload)
        objj_msgSend(self, "_reloadSearchList");
    return objj_msgSend(self._searchList, "objectForKey:", aKey);
}
,["id","CPString"]), new objj_method(sel_getUid("setObject:forKey:"), function $CPUserDefaults__setObject_forKey_(self, _cmd, anObject, aKey)
{
    objj_msgSend(self, "setObject:forKey:inDomain:", anObject, aKey, CPApplicationDomain);
}
,["void","id","CPString"]), new objj_method(sel_getUid("objectForKey:inDomain:"), function $CPUserDefaults__objectForKey_inDomain_(self, _cmd, aKey, aDomain)
{
    var domain = objj_msgSend(self._domains, "objectForKey:", aDomain);
    if (!domain)
        return nil;
    return objj_msgSend(domain, "objectForKey:", aKey);
}
,["id","CPString","CPString"]), new objj_method(sel_getUid("setObject:forKey:inDomain:"), function $CPUserDefaults__setObject_forKey_inDomain_(self, _cmd, anObject, aKey, aDomain)
{
    if (!aKey || !aDomain)
        return;
    var domain = objj_msgSend(self._domains, "objectForKey:", aDomain);
    if (!domain)
    {
        domain = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        objj_msgSend(self._domains, "setObject:forKey:", domain, aDomain);
    }
    objj_msgSend(domain, "setObject:forKey:", anObject, aKey);
    self._searchListNeedsReload = YES;
    objj_msgSend(self, "domainDidChange:", aDomain);
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("removeObjectForKey:"), function $CPUserDefaults__removeObjectForKey_(self, _cmd, aKey)
{
    objj_msgSend(self, "removeObjectForKey:inDomain:", aKey, CPApplicationDomain);
}
,["void","CPString"]), new objj_method(sel_getUid("removeObjectForKey:inDomain:"), function $CPUserDefaults__removeObjectForKey_inDomain_(self, _cmd, aKey, aDomain)
{
    if (!aKey || !aDomain)
        return;
    var domain = objj_msgSend(self._domains, "objectForKey:", aDomain);
    if (!domain)
        return;
    objj_msgSend(domain, "removeObjectForKey:", aKey);
    self._searchListNeedsReload = YES;
    objj_msgSend(self, "domainDidChange:", aDomain);
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("registerDefaults:"), function $CPUserDefaults__registerDefaults_(self, _cmd, aDictionary)
{
    var keys = objj_msgSend(aDictionary, "allKeys"),
        count = objj_msgSend(keys, "count"),
        i = 0;
    for (; i < count; i++)
    {
        var key = keys[i];
        objj_msgSend(self, "setObject:forKey:inDomain:", objj_msgSend(aDictionary, "objectForKey:", key), key, CPRegistrationDomain);
    }
}
,["void","CPDictionary"]), new objj_method(sel_getUid("registerDefaultsFromContentsOfFile:"), function $CPUserDefaults__registerDefaultsFromContentsOfFile_(self, _cmd, aURL)
{
    var contents = objj_msgSend(CPURLConnection, "sendSynchronousRequest:returningResponse:", objj_msgSend(CPURLRequest, "requestWithURL:", aURL), nil),
        data = objj_msgSend(CPData, "dataWithRawString:", objj_msgSend(contents, "rawString")),
        plist = objj_msgSend(data, "plistObject");
    objj_msgSend(self, "registerDefaults:", plist);
}
,["void","CPURL"]), new objj_method(sel_getUid("_reloadSearchList"), function $CPUserDefaults___reloadSearchList(self, _cmd)
{
    self._searchListNeedsReload = NO;
    var dicts = [CPRegistrationDomain, CPGlobalDomain, CPApplicationDomain, CPArgumentDomain],
        count = objj_msgSend(dicts, "count"),
        i = 0;
    self._searchList = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    for (; i < count; i++)
    {
        var domain = objj_msgSend(self._domains, "objectForKey:", dicts[i]);
        if (!domain)
            continue;
        var keys = objj_msgSend(domain, "allKeys"),
            keysCount = objj_msgSend(keys, "count"),
            j = 0;
        for (; j < keysCount; j++)
        {
            var key = keys[j];
            objj_msgSend(self._searchList, "setObject:forKey:", objj_msgSend(domain, "objectForKey:", key), key);
        }
    }
}
,["void"]), new objj_method(sel_getUid("volatileDomainNames"), function $CPUserDefaults__volatileDomainNames(self, _cmd)
{
    return [CPArgumentDomain, CPLocaleDomain, CPRegistrationDomain];
}
,["CPArray"]), new objj_method(sel_getUid("persistentDomainNames"), function $CPUserDefaults__persistentDomainNames(self, _cmd)
{
    return [CPGlobalDomain, CPApplicationDomain];
}
,["CPArray"]), new objj_method(sel_getUid("persistentStoreForDomain:"), function $CPUserDefaults__persistentStoreForDomain_(self, _cmd, aDomain)
{
    return objj_msgSend(self._stores, "objectForKey:", aDomain);
}
,["CPUserDefaultsStore","CPString"]), new objj_method(sel_getUid("setPersistentStoreClass:forDomain:reloadData:"), function $CPUserDefaults__setPersistentStoreClass_forDomain_reloadData_(self, _cmd, aStoreClass, aDomain, aFlag)
{
    var currentStore = objj_msgSend(self._stores, "objectForKey:", aDomain);
    if (currentStore && objj_msgSend(currentStore, "class") === aStoreClass)
        return currentStore;
    var store = objj_msgSend(objj_msgSend(aStoreClass, "alloc"), "init");
    objj_msgSend(store, "setDomain:", aDomain);
    objj_msgSend(self._stores, "setObject:forKey:", store, aDomain);
    if (aFlag)
        objj_msgSend(self, "reloadDataFromStoreForDomain:", aDomain);
    return store;
}
,["CPUserDefaultsStore","Class","CPString","BOOL"]), new objj_method(sel_getUid("reloadDataFromStoreForDomain:"), function $CPUserDefaults__reloadDataFromStoreForDomain_(self, _cmd, aDomain)
{
    var data = objj_msgSend(objj_msgSend(self, "persistentStoreForDomain:", aDomain), "data"),
        domain = data ? objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", data) : nil;
    if (domain === nil)
        objj_msgSend(self._domains, "removeObjectForKey:", aDomain);
    else
        objj_msgSend(self._domains, "setObject:forKey:", domain, aDomain);
    self._searchListNeedsReload = YES;
}
,["void","CPString"]), new objj_method(sel_getUid("domainDidChange:"), function $CPUserDefaults__domainDidChange_(self, _cmd, aDomain)
{
    if (aDomain === CPGlobalDomain || aDomain === CPApplicationDomain)
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("synchronize"), self, nil, 0, [CPDefaultRunLoopMode]);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPUserDefaultsDidChangeNotification, self);
}
,["void","CPString"]), new objj_method(sel_getUid("synchronize"), function $CPUserDefaults__synchronize(self, _cmd)
{
    var globalDomain = objj_msgSend(self._domains, "objectForKey:", CPGlobalDomain);
    if (globalDomain)
    {
        var data = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", globalDomain);
        objj_msgSend(objj_msgSend(self, "persistentStoreForDomain:", CPGlobalDomain), "setData:", data);
    }
    var appDomain = objj_msgSend(self._domains, "objectForKey:", CPApplicationDomain);
    if (appDomain)
    {
        var data = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", appDomain);
        objj_msgSend(objj_msgSend(self, "persistentStoreForDomain:", CPApplicationDomain), "setData:", data);
    }
}
,["void"]), new objj_method(sel_getUid("arrayForKey:"), function $CPUserDefaults__arrayForKey_(self, _cmd, aKey)
{
    var value = objj_msgSend(self, "objectForKey:", aKey);
    if (objj_msgSend(value, "isKindOfClass:", CPArray))
        return value;
    return nil;
}
,["CPArray","CPString"]), new objj_method(sel_getUid("boolForKey:"), function $CPUserDefaults__boolForKey_(self, _cmd, aKey)
{
    var value = objj_msgSend(self, "objectForKey:", aKey);
    if (objj_msgSend(value, "respondsToSelector:", sel_getUid("boolValue")))
        return objj_msgSend(value, "boolValue");
    return NO;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("dataForKey:"), function $CPUserDefaults__dataForKey_(self, _cmd, aKey)
{
    var value = objj_msgSend(self, "objectForKey:", aKey);
    if (objj_msgSend(value, "isKindOfClass:", CPData))
        return value;
    return nil;
}
,["CPData","CPString"]), new objj_method(sel_getUid("dictionaryForKey:"), function $CPUserDefaults__dictionaryForKey_(self, _cmd, aKey)
{
    var value = objj_msgSend(self, "objectForKey:", aKey);
    if (objj_msgSend(value, "isKindOfClass:", CPDictionary))
        return value;
    return nil;
}
,["CPDictionary","CPString"]), new objj_method(sel_getUid("floatForKey:"), function $CPUserDefaults__floatForKey_(self, _cmd, aKey)
{
    var value = objj_msgSend(self, "objectForKey:", aKey);
    if (value === nil)
        return 0;
    if (objj_msgSend(value, "respondsToSelector:", sel_getUid("floatValue")))
        value = objj_msgSend(value, "floatValue");
    return parseFloat(value);
}
,["float","CPString"]), new objj_method(sel_getUid("integerForKey:"), function $CPUserDefaults__integerForKey_(self, _cmd, aKey)
{
    var value = objj_msgSend(self, "objectForKey:", aKey);
    if (value === nil)
        return 0;
    if (objj_msgSend(value, "respondsToSelector:", sel_getUid("intValue")))
        value = objj_msgSend(value, "intValue");
    return parseInt(value);
}
,["int","CPString"]), new objj_method(sel_getUid("doubleForKey:"), function $CPUserDefaults__doubleForKey_(self, _cmd, aKey)
{
    return objj_msgSend(self, "floatForKey:", aKey);
}
,["double","CPString"]), new objj_method(sel_getUid("stringForKey:"), function $CPUserDefaults__stringForKey_(self, _cmd, aKey)
{
    var value = objj_msgSend(self, "objectForKey:", aKey);
    if (objj_msgSend(value, "isKindOfClass:", CPString))
        return value;
    else if (objj_msgSend(value, "respondsToSelector:", sel_getUid("stringValue")))
        return objj_msgSend(value, "stringValue");
    return nil;
}
,["CPString","CPString"]), new objj_method(sel_getUid("stringArrayForKey:"), function $CPUserDefaults__stringArrayForKey_(self, _cmd, aKey)
{
    var value = objj_msgSend(self, "objectForKey:", aKey);
    if (!objj_msgSend(value, "isKindOfClass:", CPArray))
        return nil;
    for (var i = 0, count = objj_msgSend(value, "count"); i < count; i++)
        if (!objj_msgSend(value[i], "isKindOfClass:", CPString))
            return nil;
    return value;
}
,["CPArray","CPString"]), new objj_method(sel_getUid("URLForKey:"), function $CPUserDefaults__URLForKey_(self, _cmd, aKey)
{
    var value = objj_msgSend(self, "objectForKey:", aKey);
    if (objj_msgSend(value, "isKindOfClass:", CPURL))
        return value;
    if (objj_msgSend(value, "isKindOfClass:", CPString))
        return objj_msgSend(CPURL, "URLWithString:", value);
    return nil;
}
,["CPURL","CPString"]), new objj_method(sel_getUid("setBool:forKey:"), function $CPUserDefaults__setBool_forKey_(self, _cmd, aValue, aKey)
{
    if (objj_msgSend(aValue, "respondsToSelector:", sel_getUid("boolValue")))
        objj_msgSend(self, "setObject:forKey:", objj_msgSend(aValue, "boolValue"), aKey);
}
,["void","BOOL","CPString"]), new objj_method(sel_getUid("setFloat:forKey:"), function $CPUserDefaults__setFloat_forKey_(self, _cmd, aValue, aKey)
{
    if (objj_msgSend(aValue, "respondsToSelector:", sel_getUid("aValue")))
        aValue = objj_msgSend(aValue, "floatValue");
    objj_msgSend(self, "setObject:forKey:", parseFloat(aValue), aKey);
}
,["void","float","CPString"]), new objj_method(sel_getUid("setDouble:forKey:"), function $CPUserDefaults__setDouble_forKey_(self, _cmd, aValue, aKey)
{
    objj_msgSend(self, "setFloat:forKey:", aValue, aKey);
}
,["void","double","CPString"]), new objj_method(sel_getUid("setInteger:forKey:"), function $CPUserDefaults__setInteger_forKey_(self, _cmd, aValue, aKey)
{
    if (objj_msgSend(aValue, "respondsToSelector:", sel_getUid("intValue")))
        aValue = objj_msgSend(aValue, "intValue");
    objj_msgSend(self, "setObject:forKey:", parseInt(aValue), aKey);
}
,["void","int","CPString"]), new objj_method(sel_getUid("setURL:forKey:"), function $CPUserDefaults__setURL_forKey_(self, _cmd, aValue, aKey)
{
    if (objj_msgSend(aValue, "isKindOfClass:", CPString))
        aValue = objj_msgSend(CPURL, "URLWithString:", aValue);
    objj_msgSend(self, "setObject:forKey:", aValue, aKey);
}
,["void","CPURL","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("standardUserDefaults"), function $CPUserDefaults__standardUserDefaults(self, _cmd)
{
    if (!StandardUserDefaults)
        StandardUserDefaults = objj_msgSend(objj_msgSend(CPUserDefaults, "alloc"), "init");
    return StandardUserDefaults;
}
,["id"]), new objj_method(sel_getUid("resetStandardUserDefaults"), function $CPUserDefaults__resetStandardUserDefaults(self, _cmd)
{
    if (StandardUserDefaults)
        objj_msgSend(StandardUserDefaults, "synchronize");
    StandardUserDefaults = nil;
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPObject, "CPUserDefaultsStore"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_domain")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("domain"), function $CPUserDefaultsStore__domain(self, _cmd)
{
    return self._domain;
}
,["CPString"]), new objj_method(sel_getUid("setDomain:"), function $CPUserDefaultsStore__setDomain_(self, _cmd, newValue)
{
    self._domain = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("data"), function $CPUserDefaultsStore__data(self, _cmd)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
    return nil;
}
,["CPData"]), new objj_method(sel_getUid("setData:"), function $CPUserDefaultsStore__setData_(self, _cmd, aData)
{
    _CPRaiseInvalidAbstractInvocation(self, _cmd);
}
,["void","CPData"])]);
}{var the_class = objj_allocateClassPair(CPUserDefaultsStore, "CPUserDefaultsCookieStore"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cookie")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setDomain:"), function $CPUserDefaultsCookieStore__setDomain_(self, _cmd, aDomain)
{
    if (self._domain === aDomain)
        return;
    self._domain = aDomain;
    self._cookie = objj_msgSend(objj_msgSend(CPCookie, "alloc"), "initWithName:", self._domain);
}
,["void","CPString"]), new objj_method(sel_getUid("data"), function $CPUserDefaultsCookieStore__data(self, _cmd)
{
    var result = objj_msgSend(self._cookie, "value");
    if (!result || objj_msgSend(result, "length") < 1)
        return nil;
    return objj_msgSend(CPData, "dataWithRawString:", decodeURIComponent(result));
}
,["CPData"]), new objj_method(sel_getUid("setData:"), function $CPUserDefaultsCookieStore__setData_(self, _cmd, aData)
{
    objj_msgSend(self._cookie, "setValue:expires:domain:", encodeURIComponent(objj_msgSend(aData, "rawString")), objj_msgSend(CPDate, "distantFuture"), window.location.href.hostname);
}
,["void","CPData"])]);
}var CPUserDefaultsLocalStoreTestKey = "9961800812587769-Cappuccino-Storage-Test";
{var the_class = objj_allocateClassPair(CPUserDefaultsStore, "CPUserDefaultsLocalStore"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPUserDefaultsLocalStore__init(self, _cmd)
{
    if (!objj_msgSend(objj_msgSend(self, "class"), "supportsLocalStorage"))
    {
        objj_msgSend(CPException, "raise:reason:", "UnsupportedFeature", "Browser does not support localStorage for CPUserDefaultsLocalStore");
        return self = nil;
    }
    return self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaultsLocalStore").super_class }, "init");
}
,["id"]), new objj_method(sel_getUid("data"), function $CPUserDefaultsLocalStore__data(self, _cmd)
{
    var result = localStorage.getItem(self._domain);
    if (!result || objj_msgSend(result, "length") < 1)
        return nil;
    return objj_msgSend(CPData, "dataWithRawString:", decodeURIComponent(result));
}
,["CPData"]), new objj_method(sel_getUid("setData:"), function $CPUserDefaultsLocalStore__setData_(self, _cmd, aData)
{
    try    {
        localStorage.setItem(self._domain, encodeURIComponent(objj_msgSend(aData, "rawString")));
    }
    catch(e)     {
        CPLog.warn("Unable to write to local storage: " + e);
    }}
,["void","CPData"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("supportsLocalStorage"), function $CPUserDefaultsLocalStore__supportsLocalStorage(self, _cmd)
{
    if (!window.localStorage)
        return NO;
    try    {
        localStorage.setItem(CPUserDefaultsLocalStoreTestKey, "1");
        if (localStorage.getItem(CPUserDefaultsLocalStoreTestKey) != "1")
            return NO;
        localStorage.removeItem(CPUserDefaultsLocalStoreTestKey);
    }
    catch(e)     {
        return NO;
    }    return YES;
}
,["BOOL"])]);
}