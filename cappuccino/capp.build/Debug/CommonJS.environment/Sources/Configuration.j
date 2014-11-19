@STATIC;1.0;I;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jI;21;Foundation/CPObject.jI;18;Foundation/CPSet.jt;8925;objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPSet.j", NO);var FILE = require("file"),
    SYSTEM = require("system");
var DefaultDictionary = nil,
    DefaultConfiguration = nil,
    UserConfiguration = nil;
{var the_class = objj_allocateClassPair(CPObject, "Configuration"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("path"), new objj_ivar("dictionary"), new objj_ivar("temporaryDictionary")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPath:"), function $Configuration__initWithPath_(self, _cmd, aPath)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Configuration").super_class }, "init");
    if (self)
    {
        self.path = aPath;
        self.temporaryDictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        if (self.path && FILE.isReadable(self.path))
            self.dictionary = CFPropertyList.readPropertyListFromFile(self.path);
        if (!self.dictionary)
            self.dictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("path"), function $Configuration__path(self, _cmd)
{
    return self.path;
}
,["CPString"]), new objj_method(sel_getUid("storedKeyEnumerator"), function $Configuration__storedKeyEnumerator(self, _cmd)
{
    return ((___r1 = self.dictionary), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyEnumerator"));
    var ___r1;
}
,["CPEnumerator"]), new objj_method(sel_getUid("keyEnumerator"), function $Configuration__keyEnumerator(self, _cmd)
{
    var set = CPSet.isa.objj_msgSend1(CPSet, "setWithArray:", ((___r1 = self.dictionary), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys")));
    (set == null ? null : set.isa.objj_msgSend1(set, "addObjectsFromArray:", ((___r1 = self.temporaryDictionary), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allKeys"))));
    (set == null ? null : set.isa.objj_msgSend1(set, "addObjectsFromArray:", (DefaultDictionary == null ? null : DefaultDictionary.isa.objj_msgSend0(DefaultDictionary, "allKeys"))));
    return (set == null ? null : set.isa.objj_msgSend0(set, "objectEnumerator"));
    var ___r1;
}
,["CPEnumerator"]), new objj_method(sel_getUid("valueForKey:"), function $Configuration__valueForKey_(self, _cmd, aKey)
{
    var value = ((___r1 = self.dictionary), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aKey));
    if (!value)
        value = ((___r1 = self.temporaryDictionary), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aKey));
    if (!value)
        value = (DefaultDictionary == null ? null : DefaultDictionary.isa.objj_msgSend1(DefaultDictionary, "objectForKey:", aKey));
    return value;
    var ___r1;
}
,["CPString","CPString"]), new objj_method(sel_getUid("setValue:forKey:"), function $Configuration__setValue_forKey_(self, _cmd, aString, aKey)
{
    ((___r1 = self.dictionary), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", aString, aKey));
    var ___r1;
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("removeValueForKey:"), function $Configuration__removeValueForKey_(self, _cmd, aKey)
{
    ((___r1 = self.dictionary), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", aKey));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("setTemporaryValue:forKey:"), function $Configuration__setTemporaryValue_forKey_(self, _cmd, aString, aKey)
{
    ((___r1 = self.temporaryDictionary), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", aString, aKey));
    var ___r1;
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("save"), function $Configuration__save(self, _cmd)
{
    var aPath = self.isa.objj_msgSend0(self, "path");
    if (!aPath)
        return;
    CFPropertyList.writePropertyListToFile(self.dictionary, aPath);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $Configuration__initialize(self, _cmd)
{
    if (self !== Configuration.isa.objj_msgSend0(Configuration, "class"))
        return;
    DefaultDictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    (DefaultDictionary == null ? null : DefaultDictionary.isa.objj_msgSend2(DefaultDictionary, "setObject:forKey:", "You", "user.name"));
    (DefaultDictionary == null ? null : DefaultDictionary.isa.objj_msgSend2(DefaultDictionary, "setObject:forKey:", "you@yourcompany.com", "user.email"));
    (DefaultDictionary == null ? null : DefaultDictionary.isa.objj_msgSend2(DefaultDictionary, "setObject:forKey:", "Your Company", "organization.name"));
    (DefaultDictionary == null ? null : DefaultDictionary.isa.objj_msgSend2(DefaultDictionary, "setObject:forKey:", "feedback @nospam@ yourcompany.com", "organization.email"));
    (DefaultDictionary == null ? null : DefaultDictionary.isa.objj_msgSend2(DefaultDictionary, "setObject:forKey:", "http://yourcompany.com", "organization.url"));
    (DefaultDictionary == null ? null : DefaultDictionary.isa.objj_msgSend2(DefaultDictionary, "setObject:forKey:", "com.yourcompany", "organization.identifier"));
    var date = new Date(),
        months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    (DefaultDictionary == null ? null : DefaultDictionary.isa.objj_msgSend2(DefaultDictionary, "setObject:forKey:", date.getFullYear(), "project.year"));
    (DefaultDictionary == null ? null : DefaultDictionary.isa.objj_msgSend2(DefaultDictionary, "setObject:forKey:", months[date.getMonth()] + ' ' + date.getDate() + ", " + date.getFullYear(), "project.date"));
}
,["void"]), new objj_method(sel_getUid("defaultConfiguration"), function $Configuration__defaultConfiguration(self, _cmd)
{
    if (!DefaultConfiguration)
        DefaultConfiguration = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithPath:", nil));
    return DefaultConfiguration;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("userConfiguration"), function $Configuration__userConfiguration(self, _cmd)
{
    if (!UserConfiguration)
        UserConfiguration = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithPath:", FILE.join(SYSTEM.env["HOME"], ".cappconfig")));
    return UserConfiguration;
    var ___r1;
}
,["id"])]);
}config = function()
{
    var count = arguments.length;
    if (count === 0 || count > 2)
    {
        printUsage();
        return;
    }
    var argument = arguments[0],
        key = nil,
        value = nil,
        action = nil,
        valid = YES;
    switch(argument) {
    case "--get":
    case "--remove":
        action = argument.substring(2);
        if (count === 2)
            key = arguments[1];
        else
            valid = NO;
        break;
    case "-l":
    case "--list":
        action = "list";
        valid = count === 1;
        break;
default:
        action = "set";
        key = argument;
        if (count === 2)
            value = arguments[1];
        else
            valid = NO;
    }
    if (!valid)
    {
        printUsage();
        return;
    }
    var configuration = Configuration.isa.objj_msgSend0(Configuration, "userConfiguration");
    if (action === "list")
    {
        var key = nil,
            keyEnumerator = (configuration == null ? null : configuration.isa.objj_msgSend0(configuration, "storedKeyEnumerator"));
        while ((key = (keyEnumerator == null ? null : keyEnumerator.isa.objj_msgSend0(keyEnumerator, "nextObject"))) !== nil)
            print(key + '=' + (configuration == null ? null : configuration.isa.objj_msgSend1(configuration, "valueForKey:", key)));
    }
    else if (action === "get")
    {
        var value = (configuration == null ? null : configuration.isa.objj_msgSend1(configuration, "valueForKey:", key));
        if (value != nil)
            print(value);
    }
    else if (action === "remove")
    {
        var value = (configuration == null ? null : configuration.isa.objj_msgSend1(configuration, "valueForKey:", key));
        if (value != nil)
        {
            (configuration == null ? null : configuration.isa.objj_msgSend1(configuration, "removeValueForKey:", key));
            (configuration == null ? null : configuration.isa.objj_msgSend0(configuration, "save"));
        }
    }
    else if (key !== nil && value !== nil)
    {
        (configuration == null ? null : configuration.isa.objj_msgSend2(configuration, "setValue:forKey:", value, key));
        (configuration == null ? null : configuration.isa.objj_msgSend0(configuration, "save"));
    }
}
