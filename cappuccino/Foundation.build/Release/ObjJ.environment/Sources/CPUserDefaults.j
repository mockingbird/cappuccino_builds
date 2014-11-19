@STATIC;1.0;i;10;CPBundle.ji;8;CPData.ji;14;CPDictionary.ji;13;CPException.ji;17;CPKeyedArchiver.ji;19;CPKeyedUnarchiver.ji;22;CPNotificationCenter.ji;10;CPObject.ji;11;CPRunLoop.ji;10;CPString.ji;7;CPURL.ji;17;CPURLConnection.ji;14;CPURLRequest.jt;23659;objj_executeFile("CPBundle.j", YES);objj_executeFile("CPData.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPKeyedArchiver.j", YES);objj_executeFile("CPKeyedUnarchiver.j", YES);objj_executeFile("CPNotificationCenter.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPRunLoop.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPURL.j", YES);objj_executeFile("CPURLConnection.j", YES);objj_executeFile("CPURLRequest.j", YES);CPArgumentDomain = "CPArgumentDomain";
CPApplicationDomain = ((___r1 = ((___r2 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "infoDictionary"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "CPBundleIdentifier")) || "CPApplicationDomain";
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
        (self == null ? null : self.isa.objj_msgSend0(self, "_setupArgumentsDomain"));
        var defaultStore = (CPUserDefaultsLocalStore == null ? null : CPUserDefaultsLocalStore.isa.objj_msgSend0(CPUserDefaultsLocalStore, "supportsLocalStorage")) ? CPUserDefaultsLocalStore : CPUserDefaultsCookieStore;
        self._stores = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        (self == null ? null : self.isa.objj_msgSend3(self, "setPersistentStoreClass:forDomain:reloadData:", defaultStore, CPGlobalDomain, YES));
        (self == null ? null : self.isa.objj_msgSend3(self, "setPersistentStoreClass:forDomain:reloadData:", defaultStore, CPApplicationDomain, YES));
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("_setupArgumentsDomain"), function $CPUserDefaults___setupArgumentsDomain(self, _cmd)
{
    var args = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "namedArguments")),
        keys = (args == null ? null : args.isa.objj_msgSend0(args, "allKeys")),
        count = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count")),
        i = 0;
    for (; i < count; i++)
    {
        var key = keys[i];
        self.isa.objj_msgSend3(self, "setObject:forKey:inDomain:", (args == null ? null : args.isa.objj_msgSend1(args, "objectForKey:", key)), key, CPArgumentDomain);
    }
}
,["void"]), new objj_method(sel_getUid("objectForKey:"), function $CPUserDefaults__objectForKey_(self, _cmd, aKey)
{
    if (self._searchListNeedsReload)
        self.isa.objj_msgSend0(self, "_reloadSearchList");
    return ((___r1 = self._searchList), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aKey));
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("setObject:forKey:"), function $CPUserDefaults__setObject_forKey_(self, _cmd, anObject, aKey)
{
    self.isa.objj_msgSend3(self, "setObject:forKey:inDomain:", anObject, aKey, CPApplicationDomain);
}
,["void","id","CPString"]), new objj_method(sel_getUid("objectForKey:inDomain:"), function $CPUserDefaults__objectForKey_inDomain_(self, _cmd, aKey, aDomain)
{
    var domain = ((___r1 = self._domains), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aDomain));
    if (!domain)
        return nil;
    return (domain == null ? null : domain.isa.objj_msgSend1(domain, "objectForKey:", aKey));
    var ___r1;
}
,["id","CPString","CPString"]), new objj_method(sel_getUid("setObject:forKey:inDomain:"), function $CPUserDefaults__setObject_forKey_inDomain_(self, _cmd, anObject, aKey, aDomain)
{
    if (!aKey || !aDomain)
        return;
    var domain = ((___r1 = self._domains), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aDomain));
    if (!domain)
    {
        domain = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        ((___r1 = self._domains), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", domain, aDomain));
    }
    (domain == null ? null : domain.isa.objj_msgSend2(domain, "setObject:forKey:", anObject, aKey));
    self._searchListNeedsReload = YES;
    self.isa.objj_msgSend1(self, "domainDidChange:", aDomain);
    var ___r1;
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("removeObjectForKey:"), function $CPUserDefaults__removeObjectForKey_(self, _cmd, aKey)
{
    self.isa.objj_msgSend2(self, "removeObjectForKey:inDomain:", aKey, CPApplicationDomain);
}
,["void","CPString"]), new objj_method(sel_getUid("removeObjectForKey:inDomain:"), function $CPUserDefaults__removeObjectForKey_inDomain_(self, _cmd, aKey, aDomain)
{
    if (!aKey || !aDomain)
        return;
    var domain = ((___r1 = self._domains), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aDomain));
    if (!domain)
        return;
    (domain == null ? null : domain.isa.objj_msgSend1(domain, "removeObjectForKey:", aKey));
    self._searchListNeedsReload = YES;
    self.isa.objj_msgSend1(self, "domainDidChange:", aDomain);
    var ___r1;
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("registerDefaults:"), function $CPUserDefaults__registerDefaults_(self, _cmd, aDictionary)
{
    var keys = (aDictionary == null ? null : aDictionary.isa.objj_msgSend0(aDictionary, "allKeys")),
        count = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count")),
        i = 0;
    for (; i < count; i++)
    {
        var key = keys[i];
        self.isa.objj_msgSend3(self, "setObject:forKey:inDomain:", (aDictionary == null ? null : aDictionary.isa.objj_msgSend1(aDictionary, "objectForKey:", key)), key, CPRegistrationDomain);
    }
}
,["void","CPDictionary"]), new objj_method(sel_getUid("registerDefaultsFromContentsOfFile:"), function $CPUserDefaults__registerDefaultsFromContentsOfFile_(self, _cmd, aURL)
{
    var contents = CPURLConnection.isa.objj_msgSend2(CPURLConnection, "sendSynchronousRequest:returningResponse:", CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", aURL), nil),
        data = CPData.isa.objj_msgSend1(CPData, "dataWithRawString:", (contents == null ? null : contents.isa.objj_msgSend0(contents, "rawString"))),
        plist = (data == null ? null : data.isa.objj_msgSend0(data, "plistObject"));
    self.isa.objj_msgSend1(self, "registerDefaults:", plist);
}
,["void","CPURL"]), new objj_method(sel_getUid("_reloadSearchList"), function $CPUserDefaults___reloadSearchList(self, _cmd)
{
    self._searchListNeedsReload = NO;
    var dicts = [CPRegistrationDomain, CPGlobalDomain, CPApplicationDomain, CPArgumentDomain],
        count = (dicts == null ? null : dicts.isa.objj_msgSend0(dicts, "count")),
        i = 0;
    self._searchList = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    for (; i < count; i++)
    {
        var domain = ((___r1 = self._domains), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", dicts[i]));
        if (!domain)
            continue;
        var keys = (domain == null ? null : domain.isa.objj_msgSend0(domain, "allKeys")),
            keysCount = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count")),
            j = 0;
        for (; j < keysCount; j++)
        {
            var key = keys[j];
            ((___r1 = self._searchList), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", (domain == null ? null : domain.isa.objj_msgSend1(domain, "objectForKey:", key)), key));
        }
    }
    var ___r1;
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
    return ((___r1 = self._stores), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aDomain));
    var ___r1;
}
,["CPUserDefaultsStore","CPString"]), new objj_method(sel_getUid("setPersistentStoreClass:forDomain:reloadData:"), function $CPUserDefaults__setPersistentStoreClass_forDomain_reloadData_(self, _cmd, aStoreClass, aDomain, aFlag)
{
    var currentStore = ((___r1 = self._stores), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aDomain));
    if (currentStore && (currentStore == null ? null : currentStore.isa.objj_msgSend0(currentStore, "class")) === aStoreClass)
        return currentStore;
    var store = ((___r1 = (aStoreClass == null ? null : aStoreClass.isa.objj_msgSend0(aStoreClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (store == null ? null : store.isa.objj_msgSend1(store, "setDomain:", aDomain));
    ((___r1 = self._stores), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", store, aDomain));
    if (aFlag)
        self.isa.objj_msgSend1(self, "reloadDataFromStoreForDomain:", aDomain);
    return store;
    var ___r1;
}
,["CPUserDefaultsStore","Class","CPString","BOOL"]), new objj_method(sel_getUid("reloadDataFromStoreForDomain:"), function $CPUserDefaults__reloadDataFromStoreForDomain_(self, _cmd, aDomain)
{
    var data = ((___r1 = self.isa.objj_msgSend1(self, "persistentStoreForDomain:", aDomain)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "data")),
        domain = data ? CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", data) : nil;
    if (domain === nil)
        ((___r1 = self._domains), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", aDomain));
    else
        ((___r1 = self._domains), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", domain, aDomain));
    self._searchListNeedsReload = YES;
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("domainDidChange:"), function $CPUserDefaults__domainDidChange_(self, _cmd, aDomain)
{
    if (aDomain === CPGlobalDomain || aDomain === CPApplicationDomain)
        ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "performSelector:target:argument:order:modes:", sel_getUid("synchronize"), self, nil, 0, [CPDefaultRunLoopMode]));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPUserDefaultsDidChangeNotification, self));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("synchronize"), function $CPUserDefaults__synchronize(self, _cmd)
{
    var globalDomain = ((___r1 = self._domains), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPGlobalDomain));
    if (globalDomain)
    {
        var data = CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", globalDomain);
        ((___r1 = self.isa.objj_msgSend1(self, "persistentStoreForDomain:", CPGlobalDomain)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setData:", data));
    }
    var appDomain = ((___r1 = self._domains), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPApplicationDomain));
    if (appDomain)
    {
        var data = CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", appDomain);
        ((___r1 = self.isa.objj_msgSend1(self, "persistentStoreForDomain:", CPApplicationDomain)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setData:", data));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("arrayForKey:"), function $CPUserDefaults__arrayForKey_(self, _cmd, aKey)
{
    var value = self.isa.objj_msgSend1(self, "objectForKey:", aKey);
    if ((value == null ? null : value.isa.objj_msgSend1(value, "isKindOfClass:", CPArray)))
        return value;
    return nil;
}
,["CPArray","CPString"]), new objj_method(sel_getUid("boolForKey:"), function $CPUserDefaults__boolForKey_(self, _cmd, aKey)
{
    var value = self.isa.objj_msgSend1(self, "objectForKey:", aKey);
    if ((value == null ? null : value.isa.objj_msgSend1(value, "respondsToSelector:", sel_getUid("boolValue"))))
        return (value == null ? null : value.isa.objj_msgSend0(value, "boolValue"));
    return NO;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("dataForKey:"), function $CPUserDefaults__dataForKey_(self, _cmd, aKey)
{
    var value = self.isa.objj_msgSend1(self, "objectForKey:", aKey);
    if ((value == null ? null : value.isa.objj_msgSend1(value, "isKindOfClass:", CPData)))
        return value;
    return nil;
}
,["CPData","CPString"]), new objj_method(sel_getUid("dictionaryForKey:"), function $CPUserDefaults__dictionaryForKey_(self, _cmd, aKey)
{
    var value = self.isa.objj_msgSend1(self, "objectForKey:", aKey);
    if ((value == null ? null : value.isa.objj_msgSend1(value, "isKindOfClass:", CPDictionary)))
        return value;
    return nil;
}
,["CPDictionary","CPString"]), new objj_method(sel_getUid("floatForKey:"), function $CPUserDefaults__floatForKey_(self, _cmd, aKey)
{
    var value = self.isa.objj_msgSend1(self, "objectForKey:", aKey);
    if (value === nil)
        return 0;
    if ((value == null ? null : value.isa.objj_msgSend1(value, "respondsToSelector:", sel_getUid("floatValue"))))
        value = (value == null ? null : value.isa.objj_msgSend0(value, "floatValue"));
    return parseFloat(value);
}
,["float","CPString"]), new objj_method(sel_getUid("integerForKey:"), function $CPUserDefaults__integerForKey_(self, _cmd, aKey)
{
    var value = self.isa.objj_msgSend1(self, "objectForKey:", aKey);
    if (value === nil)
        return 0;
    if ((value == null ? null : value.isa.objj_msgSend1(value, "respondsToSelector:", sel_getUid("intValue"))))
        value = (value == null ? null : value.isa.objj_msgSend0(value, "intValue"));
    return parseInt(value);
}
,["int","CPString"]), new objj_method(sel_getUid("doubleForKey:"), function $CPUserDefaults__doubleForKey_(self, _cmd, aKey)
{
    return self.isa.objj_msgSend1(self, "floatForKey:", aKey);
}
,["double","CPString"]), new objj_method(sel_getUid("stringForKey:"), function $CPUserDefaults__stringForKey_(self, _cmd, aKey)
{
    var value = self.isa.objj_msgSend1(self, "objectForKey:", aKey);
    if ((value == null ? null : value.isa.objj_msgSend1(value, "isKindOfClass:", CPString)))
        return value;
    else if ((value == null ? null : value.isa.objj_msgSend1(value, "respondsToSelector:", sel_getUid("stringValue"))))
        return (value == null ? null : value.isa.objj_msgSend0(value, "stringValue"));
    return nil;
}
,["CPString","CPString"]), new objj_method(sel_getUid("stringArrayForKey:"), function $CPUserDefaults__stringArrayForKey_(self, _cmd, aKey)
{
    var value = self.isa.objj_msgSend1(self, "objectForKey:", aKey);
    if (!(value == null ? null : value.isa.objj_msgSend1(value, "isKindOfClass:", CPArray)))
        return nil;
    for (var i = 0, count = (value == null ? null : value.isa.objj_msgSend0(value, "count")); i < count; i++)
        if (!((___r1 = value[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPString)))
            return nil;
    return value;
    var ___r1;
}
,["CPArray","CPString"]), new objj_method(sel_getUid("URLForKey:"), function $CPUserDefaults__URLForKey_(self, _cmd, aKey)
{
    var value = self.isa.objj_msgSend1(self, "objectForKey:", aKey);
    if ((value == null ? null : value.isa.objj_msgSend1(value, "isKindOfClass:", CPURL)))
        return value;
    if ((value == null ? null : value.isa.objj_msgSend1(value, "isKindOfClass:", CPString)))
        return CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", value);
    return nil;
}
,["CPURL","CPString"]), new objj_method(sel_getUid("setBool:forKey:"), function $CPUserDefaults__setBool_forKey_(self, _cmd, aValue, aKey)
{
    if ((aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "respondsToSelector:", sel_getUid("boolValue"))))
        self.isa.objj_msgSend2(self, "setObject:forKey:", (aValue == null ? null : aValue.isa.objj_msgSend0(aValue, "boolValue")), aKey);
}
,["void","BOOL","CPString"]), new objj_method(sel_getUid("setFloat:forKey:"), function $CPUserDefaults__setFloat_forKey_(self, _cmd, aValue, aKey)
{
    if ((aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "respondsToSelector:", sel_getUid("floatValue"))))
        aValue = (aValue == null ? null : aValue.isa.objj_msgSend0(aValue, "floatValue"));
    self.isa.objj_msgSend2(self, "setObject:forKey:", parseFloat(aValue), aKey);
}
,["void","float","CPString"]), new objj_method(sel_getUid("setDouble:forKey:"), function $CPUserDefaults__setDouble_forKey_(self, _cmd, aValue, aKey)
{
    self.isa.objj_msgSend2(self, "setFloat:forKey:", aValue, aKey);
}
,["void","double","CPString"]), new objj_method(sel_getUid("setInteger:forKey:"), function $CPUserDefaults__setInteger_forKey_(self, _cmd, aValue, aKey)
{
    if ((aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "respondsToSelector:", sel_getUid("intValue"))))
        aValue = (aValue == null ? null : aValue.isa.objj_msgSend0(aValue, "intValue"));
    self.isa.objj_msgSend2(self, "setObject:forKey:", parseInt(aValue), aKey);
}
,["void","int","CPString"]), new objj_method(sel_getUid("setURL:forKey:"), function $CPUserDefaults__setURL_forKey_(self, _cmd, aValue, aKey)
{
    if ((aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "isKindOfClass:", CPString)))
        aValue = CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", aValue);
    self.isa.objj_msgSend2(self, "setObject:forKey:", aValue, aKey);
}
,["void","CPURL","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("standardUserDefaults"), function $CPUserDefaults__standardUserDefaults(self, _cmd)
{
    if (!StandardUserDefaults)
        StandardUserDefaults = ((___r1 = CPUserDefaults.isa.objj_msgSend0(CPUserDefaults, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return StandardUserDefaults;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("resetStandardUserDefaults"), function $CPUserDefaults__resetStandardUserDefaults(self, _cmd)
{
    if (StandardUserDefaults)
        (StandardUserDefaults == null ? null : StandardUserDefaults.isa.objj_msgSend0(StandardUserDefaults, "synchronize"));
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
    self._cookie = ((___r1 = (CPCookie == null ? null : CPCookie.isa.objj_msgSend0(CPCookie, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithName:", self._domain));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("data"), function $CPUserDefaultsCookieStore__data(self, _cmd)
{
    var result = ((___r1 = self._cookie), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "value"));
    if (!result || (result == null ? null : result.isa.objj_msgSend0(result, "length")) < 1)
        return nil;
    return CPData.isa.objj_msgSend1(CPData, "dataWithRawString:", decodeURIComponent(result));
    var ___r1;
}
,["CPData"]), new objj_method(sel_getUid("setData:"), function $CPUserDefaultsCookieStore__setData_(self, _cmd, aData)
{
    ((___r1 = self._cookie), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:expires:domain:", encodeURIComponent((aData == null ? null : aData.isa.objj_msgSend0(aData, "rawString"))), CPDate.isa.objj_msgSend0(CPDate, "distantFuture"), window.location.href.hostname));
    var ___r1;
}
,["void","CPData"])]);
}var CPUserDefaultsLocalStoreTestKey = "9961800812587769-Cappuccino-Storage-Test";
{var the_class = objj_allocateClassPair(CPUserDefaultsStore, "CPUserDefaultsLocalStore"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPUserDefaultsLocalStore__init(self, _cmd)
{
    if (!((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "supportsLocalStorage")))
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", "UnsupportedFeature", "Browser does not support localStorage for CPUserDefaultsLocalStore");
        return self = nil;
    }
    return self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPUserDefaultsLocalStore").super_class }, "init");
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("data"), function $CPUserDefaultsLocalStore__data(self, _cmd)
{
    var result = localStorage.getItem(self._domain);
    if (!result || (result == null ? null : result.isa.objj_msgSend0(result, "length")) < 1)
        return nil;
    return CPData.isa.objj_msgSend1(CPData, "dataWithRawString:", decodeURIComponent(result));
}
,["CPData"]), new objj_method(sel_getUid("setData:"), function $CPUserDefaultsLocalStore__setData_(self, _cmd, aData)
{
    try    {
        localStorage.setItem(self._domain, encodeURIComponent((aData == null ? null : aData.isa.objj_msgSend0(aData, "rawString"))));
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