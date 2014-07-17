@STATIC;1.0;i;10;CPObject.ji;10;CPString.jt;8983;objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);CPURLNameKey = "CPURLNameKey";
CPURLLocalizedNameKey = "CPURLLocalizedNameKey";
CPURLIsRegularFileKey = "CPURLIsRegularFileKey";
CPURLIsDirectoryKey = "CPURLIsDirectoryKey";
CPURLIsSymbolicLinkKey = "CPURLIsSymbolicLinkKey";
CPURLIsVolumeKey = "CPURLIsVolumeKey";
CPURLIsPackageKey = "CPURLIsPackageKey";
CPURLIsSystemImmutableKey = "CPURLIsSystemImmutableKey";
CPURLIsUserImmutableKey = "CPURLIsUserImmutableKey";
CPURLIsHiddenKey = "CPURLIsHiddenKey";
CPURLHasHiddenExtensionKey = "CPURLHasHiddenExtensionKey";
CPURLCreationDateKey = "CPURLCreationDateKey";
CPURLContentAccessDateKey = "CPURLContentAccessDateKey";
CPURLContentModificationDateKey = "CPURLContentModificationDateKey";
CPURLAttributeModificationDateKey = "CPURLAttributeModificationDateKey";
CPURLLinkCountKey = "CPURLLinkCountKey";
CPURLParentDirectoryURLKey = "CPURLParentDirectoryURLKey";
CPURLVolumeURLKey = "CPURLTypeIdentifierKey";
CPURLTypeIdentifierKey = "CPURLTypeIdentifierKey";
CPURLLocalizedTypeDescriptionKey = "CPURLLocalizedTypeDescriptionKey";
CPURLLabelNumberKey = "CPURLLabelNumberKey";
CPURLLabelColorKey = "CPURLLabelColorKey";
CPURLLocalizedLabelKey = "CPURLLocalizedLabelKey";
CPURLEffectiveIconKey = "CPURLEffectiveIconKey";
CPURLCustomIconKey = "CPURLCustomIconKey";
{var the_class = objj_allocateClassPair(CPObject, "CPURL"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPURL__init(self, _cmd)
{
    return nil;
}
,["id"]), new objj_method(sel_getUid("initWithScheme:host:path:"), function $CPURL__initWithScheme_host_path_(self, _cmd, aScheme, aHost, aPath)
{
    var URLString = (aScheme ? aScheme + ":" : "") + (aHost ? aHost + "//" : "") + (aPath || "");
    return self.isa.objj_msgSend1(self, "initWithString:", URLString);
}
,["id","CPString","CPString","CPString"]), new objj_method(sel_getUid("initWithString:"), function $CPURL__initWithString_(self, _cmd, URLString)
{
    return self.isa.objj_msgSend2(self, "initWithString:relativeToURL:", URLString, nil);
}
,["id","CPString"]), new objj_method(sel_getUid("initWithString:relativeToURL:"), function $CPURL__initWithString_relativeToURL_(self, _cmd, URLString, aBaseURL)
{
    var result = new CFURL(URLString, aBaseURL);
    result.isa = self.isa.objj_msgSend0(self, "class");
    return result;
}
,["id","CPString","CPURL"]), new objj_method(sel_getUid("absoluteURL"), function $CPURL__absoluteURL(self, _cmd)
{
    return self.absoluteURL();
}
,["CPURL"]), new objj_method(sel_getUid("baseURL"), function $CPURL__baseURL(self, _cmd)
{
    return self.baseURL();
}
,["CPURL"]), new objj_method(sel_getUid("absoluteString"), function $CPURL__absoluteString(self, _cmd)
{
    return self.absoluteString();
}
,["CPString"]), new objj_method(sel_getUid("relativeString"), function $CPURL__relativeString(self, _cmd)
{
    return self.string();
}
,["CPString"]), new objj_method(sel_getUid("path"), function $CPURL__path(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "absoluteURL").path();
}
,["CPString"]), new objj_method(sel_getUid("pathComponents"), function $CPURL__pathComponents(self, _cmd)
{
    var components = self.pathComponents();
    return (components == null ? null : components.isa.objj_msgSend0(components, "copy"));
}
,["CPArray"]), new objj_method(sel_getUid("relativePath"), function $CPURL__relativePath(self, _cmd)
{
    return self.path();
}
,["CPString"]), new objj_method(sel_getUid("scheme"), function $CPURL__scheme(self, _cmd)
{
    return self.scheme();
}
,["CPString"]), new objj_method(sel_getUid("user"), function $CPURL__user(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "absoluteURL").user();
}
,["CPString"]), new objj_method(sel_getUid("password"), function $CPURL__password(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "absoluteURL").password();
}
,["CPString"]), new objj_method(sel_getUid("host"), function $CPURL__host(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "absoluteURL").domain();
}
,["CPString"]), new objj_method(sel_getUid("port"), function $CPURL__port(self, _cmd)
{
    var portNumber = self.isa.objj_msgSend0(self, "absoluteURL").portNumber();
    if (portNumber === -1)
        return nil;
    return portNumber;
}
,["Number"]), new objj_method(sel_getUid("parameterString"), function $CPURL__parameterString(self, _cmd)
{
    return self.queryString();
}
,["CPString"]), new objj_method(sel_getUid("fragment"), function $CPURL__fragment(self, _cmd)
{
    return self.fragment();
}
,["CPString"]), new objj_method(sel_getUid("isEqual:"), function $CPURL__isEqual_(self, _cmd, anObject)
{
    if (self === anObject)
        return YES;
    if (!anObject || !(anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "isKindOfClass:", CPURL.isa.objj_msgSend0(CPURL, "class"))))
        return NO;
    return self.isa.objj_msgSend1(self, "isEqualToURL:", anObject);
}
,["BOOL","id"]), new objj_method(sel_getUid("isEqualToURL:"), function $CPURL__isEqualToURL_(self, _cmd, aURL)
{
    if (self === aURL)
        return YES;
    return ((___r1 = self.isa.objj_msgSend0(self, "absoluteString")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", (aURL == null ? null : aURL.isa.objj_msgSend0(aURL, "absoluteString"))));
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("lastPathComponent"), function $CPURL__lastPathComponent(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "absoluteURL").lastPathComponent();
}
,["CPString"]), new objj_method(sel_getUid("pathExtension"), function $CPURL__pathExtension(self, _cmd)
{
    return self.pathExtension();
}
,["CPString"]), new objj_method(sel_getUid("URLByDeletingLastPathComponent"), function $CPURL__URLByDeletingLastPathComponent(self, _cmd)
{
    var result = self.createCopyDeletingLastPathComponent();
    result.isa = self.isa.objj_msgSend0(self, "class");
    return result;
}
,["CPURL"]), new objj_method(sel_getUid("standardizedURL"), function $CPURL__standardizedURL(self, _cmd)
{
    return self.standardizedURL();
}
,["CPURL"]), new objj_method(sel_getUid("isFileURL"), function $CPURL__isFileURL(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "scheme") === "file";
}
,["BOOL"]), new objj_method(sel_getUid("description"), function $CPURL__description(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "absoluteString");
}
,["CPString"]), new objj_method(sel_getUid("resourceValueForKey:"), function $CPURL__resourceValueForKey_(self, _cmd, aKey)
{
    return self.resourcePropertyForKey(aKey);
}
,["id","CPString"]), new objj_method(sel_getUid("setResourceValue:forKey:"), function $CPURL__setResourceValue_forKey_(self, _cmd, anObject, aKey)
{
    return self.setResourcePropertyForKey(aKey, anObject);
}
,["id","id","CPString"]), new objj_method(sel_getUid("staticResourceData"), function $CPURL__staticResourceData(self, _cmd)
{
    return self.staticResourceData();
}
,["CPData"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPURL__alloc(self, _cmd)
{
    var result = new CFURL();
    result.isa = self.isa.objj_msgSend0(self, "class");
    return result;
}
,["id"]), new objj_method(sel_getUid("URLWithString:"), function $CPURL__URLWithString_(self, _cmd, URLString)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithString:", URLString));
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("URLWithString:relativeToURL:"), function $CPURL__URLWithString_relativeToURL_(self, _cmd, URLString, aBaseURL)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithString:relativeToURL:", URLString, aBaseURL));
    var ___r1;
}
,["id","CPString","CPURL"])]);
}var CPURLURLStringKey = "CPURLURLStringKey",
    CPURLBaseURLKey = "CPURLBaseURLKey";
{
var the_class = objj_getClass("CPURL")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPURL\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPURL__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend2(self, "initWithString:relativeToURL:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPURLURLStringKey)), (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPURLBaseURLKey)));
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPURL__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._baseURL, CPURLBaseURLKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._string, CPURLURLStringKey));
}
,["void","CPCoder"])]);
}CFURL.prototype.isa = CPURL.isa.objj_msgSend0(CPURL, "class");
