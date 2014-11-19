@STATIC;1.0;i;14;CPDictionary.ji;16;CPNotification.ji;22;CPNotificationCenter.ji;10;CPObject.jt;6638;objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPNotification.j", YES);objj_executeFile("CPNotificationCenter.j", YES);objj_executeFile("CPObject.j", YES);CPBundleDidLoadNotification = "CPBundleDidLoadNotification";
var CPBundlesForURLStrings = {};
{var the_class = objj_allocateClassPair(CPObject, "CPBundle"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle"), new objj_ivar("_delegate")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithURL:"), function $CPBundle__initWithURL_(self, _cmd, aURL)
{
    aURL = new CFURL(aURL);
    var URLString = aURL.absoluteString(),
        existingBundle = CPBundlesForURLStrings[URLString];
    if (existingBundle)
        return existingBundle;
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBundle").super_class }, "init");
    if (self)
    {
        self._bundle = new CFBundle(aURL);
        CPBundlesForURLStrings[URLString] = self;
    }
    return self;
}
,["id","CPURL"]), new objj_method(sel_getUid("initWithPath:"), function $CPBundle__initWithPath_(self, _cmd, aPath)
{
    return self.isa.objj_msgSend1(self, "initWithURL:", aPath);
}
,["id","CPString"]), new objj_method(sel_getUid("classNamed:"), function $CPBundle__classNamed_(self, _cmd, aString)
{
}
,["Class","CPString"]), new objj_method(sel_getUid("bundleURL"), function $CPBundle__bundleURL(self, _cmd)
{
    return self._bundle.bundleURL();
}
,["CPURL"]), new objj_method(sel_getUid("bundlePath"), function $CPBundle__bundlePath(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "bundleURL")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "path"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("resourcePath"), function $CPBundle__resourcePath(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "resourceURL")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "path"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("resourceURL"), function $CPBundle__resourceURL(self, _cmd)
{
    return self._bundle.resourcesDirectoryURL();
}
,["CPURL"]), new objj_method(sel_getUid("principalClass"), function $CPBundle__principalClass(self, _cmd)
{
    var className = self.isa.objj_msgSend1(self, "objectForInfoDictionaryKey:", "CPPrincipalClass");
    return className ? CPClassFromString(className) : nil;
}
,["Class"]), new objj_method(sel_getUid("bundleIdentifier"), function $CPBundle__bundleIdentifier(self, _cmd)
{
    return self._bundle.identifier();
}
,["CPString"]), new objj_method(sel_getUid("isLoaded"), function $CPBundle__isLoaded(self, _cmd)
{
    return self._bundle.isLoaded();
}
,["BOOL"]), new objj_method(sel_getUid("pathForResource:"), function $CPBundle__pathForResource_(self, _cmd, aFilename)
{
    return self._bundle.pathForResource(aFilename);
}
,["CPString","CPString"]), new objj_method(sel_getUid("infoDictionary"), function $CPBundle__infoDictionary(self, _cmd)
{
    return self._bundle.infoDictionary();
}
,["CPDictionary"]), new objj_method(sel_getUid("objectForInfoDictionaryKey:"), function $CPBundle__objectForInfoDictionaryKey_(self, _cmd, aKey)
{
    return self._bundle.valueForInfoDictionaryKey(aKey);
}
,["id","CPString"]), new objj_method(sel_getUid("loadWithDelegate:"), function $CPBundle__loadWithDelegate_(self, _cmd, aDelegate)
{
    self._delegate = aDelegate;
    self._bundle.addEventListener("load", function()
    {
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "bundleDidFinishLoading:", self));
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPBundleDidLoadNotification, self, nil));
        var ___r1;
    });
    self._bundle.addEventListener("error", function()
    {
        CPLog.error("Could not find bundle: " + self);
    });
    self._bundle.load(YES);
}
,["void","id"]), new objj_method(sel_getUid("staticResourceURLs"), function $CPBundle__staticResourceURLs(self, _cmd)
{
    var staticResourceURLs = [],
        staticResources = self._bundle.staticResources(),
        index = 0,
        count = (staticResources == null ? null : staticResources.isa.objj_msgSend0(staticResources, "count"));
    for (; index < count; ++index)
        (staticResourceURLs == null ? null : staticResourceURLs.isa.objj_msgSend1(staticResourceURLs, "addObject:", staticResources[index].URL()));
    return staticResourceURLs;
}
,["CPArray"]), new objj_method(sel_getUid("environments"), function $CPBundle__environments(self, _cmd)
{
    return self._bundle.environments();
}
,["CPArray"]), new objj_method(sel_getUid("mostEligibleEnvironment"), function $CPBundle__mostEligibleEnvironment(self, _cmd)
{
    return self._bundle.mostEligibleEnvironment();
}
,["CPString"]), new objj_method(sel_getUid("description"), function $CPBundle__description(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPBundle").super_class }, "description") + "(" + self.isa.objj_msgSend0(self, "bundlePath") + ")";
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("bundleWithURL:"), function $CPBundle__bundleWithURL_(self, _cmd, aURL)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithURL:", aURL));
    var ___r1;
}
,["CPBundle","CPURL"]), new objj_method(sel_getUid("bundleWithPath:"), function $CPBundle__bundleWithPath_(self, _cmd, aPath)
{
    return self.isa.objj_msgSend1(self, "bundleWithURL:", aPath);
}
,["CPBundle","CPString"]), new objj_method(sel_getUid("bundleWithIdentifier:"), function $CPBundle__bundleWithIdentifier_(self, _cmd, anIdentifier)
{
    var bundle = CFBundle.bundleWithIdentifier(anIdentifier);
    if (bundle)
    {
        var url = bundle.bundleURL(),
            cpBundle = CPBundlesForURLStrings[url.absoluteString()];
        if (!cpBundle)
            cpBundle = self.isa.objj_msgSend1(self, "bundleWithURL:", url);
        return cpBundle;
    }
    return nil;
}
,["CPBundle","CPString"]), new objj_method(sel_getUid("bundleForClass:"), function $CPBundle__bundleForClass_(self, _cmd, aClass)
{
    return self.isa.objj_msgSend1(self, "bundleWithURL:", (CFBundle.bundleForClass(aClass)).bundleURL());
}
,["CPBundle","Class"]), new objj_method(sel_getUid("mainBundle"), function $CPBundle__mainBundle(self, _cmd)
{
    return CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithPath:", (CFBundle.mainBundle()).bundleURL());
}
,["CPBundle"])]);
}