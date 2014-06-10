@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;17;CPCompatibility.ji;9;CPImage.ji;9;CPTheme.jt;8060;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPTheme.j", YES);var _CPCibCustomResourceClassNameKey = "_CPCibCustomResourceClassNameKey",
    _CPCibCustomResourceResourceNameKey = "_CPCibCustomResourceResourceNameKey",
    _CPCibCustomResourcePropertiesKey = "_CPCibCustomResourcePropertiesKey",
    _CPCibCustomResourceTemplateImageMap = nil;
{var the_class = objj_allocateClassPair(CPObject, "_CPCibCustomResource"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className"), new objj_ivar("_resourceName"), new objj_ivar("_properties"), new objj_ivar("_bundle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithClassName:resourceName:properties:"), function $_CPCibCustomResource__initWithClassName_resourceName_properties_(self, _cmd, aClassName, aResourceName, properties)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibCustomResource").super_class }, "init");
    if (self)
    {
        self._className = aClassName;
        self._resourceName = aResourceName;
        self._properties = properties;
        self._bundle = nil;
    }
    return self;
}
,["id","CPString","CPString","CPDictionary"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPCibCustomResource__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibCustomResource").super_class }, "init");
    if (self)
    {
        self._className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourceClassNameKey);
        self._resourceName = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourceResourceNameKey);
        self._properties = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourcePropertiesKey);
        self._bundle = nil;
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibCustomResource__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._className, _CPCibCustomResourceClassNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._resourceName, _CPCibCustomResourceResourceNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._properties, _CPCibCustomResourcePropertiesKey);
}
,["void","CPCoder"]), new objj_method(sel_getUid("awakeAfterUsingCoder:"), function $_CPCibCustomResource__awakeAfterUsingCoder_(self, _cmd, aCoder)
{
    if (objj_msgSend(aCoder, "respondsToSelector:", sel_getUid("bundle")) && (!objj_msgSend(aCoder, "respondsToSelector:", sel_getUid("awakenCustomResources")) || objj_msgSend(aCoder, "awakenCustomResources")))
        if (self._className === "CPImage")
        {
            var templateImage = objj_msgSend(_CPCibCustomResourceTemplateImageMap, "objectForKey:", self._resourceName);
            if (templateImage)
                return objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", templateImage, objj_msgSend(CPButtonBar, "class"));
            else
                return objj_msgSend(self, "imageFromCoder:", aCoder);
        }
    return self;
}
,["id","CPCoder"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $_CPCibCustomResource__initialize(self, _cmd)
{
    if (self !== objj_msgSend(_CPCibCustomResource, "class"))
        return;
    _CPCibCustomResourceTemplateImageMap = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", "button-image-plus", "CPAddTemplate", "button-image-minus", "CPRemoveTemplate");
}
,["void"]), new objj_method(sel_getUid("imageResourceWithName:size:"), function $_CPCibCustomResource__imageResourceWithName_size_(self, _cmd, aResourceName, aSize)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithClassName:resourceName:properties:", "CPImage", aResourceName, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aSize, "size"));
}
,["id","CPString","CGSize"]), new objj_method(sel_getUid("imageResourceWithName:size:bundleClass:"), function $_CPCibCustomResource__imageResourceWithName_size_bundleClass_(self, _cmd, aResourceName, aSize, aBundleClass)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithClassName:resourceName:properties:", "CPImage", aResourceName, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aSize, "size", aBundleClass, "bundleClass"));
}
,["id","CPString","CGSize","CPString"])]);
}{
var the_class = objj_getClass("_CPCibCustomResource")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibCustomResource\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("imageBundleWithCoder:"), function $_CPCibCustomResource__imageBundleWithCoder_(self, _cmd, aCoder)
{
    if (self._bundle)
        return self._bundle;
    var bundleIdentifier = objj_msgSend(self._properties, "valueForKey:", "bundleIdentifier");
    if (bundleIdentifier)
        self._bundle = objj_msgSend(CPBundle, "bundleWithIdentifier:", bundleIdentifier);
    else
    {
        var bundleClass = objj_msgSend(self._properties, "valueForKey:", "bundleClass");
        if (bundleClass)
        {
            bundleClass = CPClassFromString(bundleClass);
            if (bundleClass)
                self._bundle = objj_msgSend(CPBundle, "bundleForClass:", bundleClass);
        }
    }
    if (!self._bundle)
    {
        var framework = objj_msgSend(self._properties, "valueForKey:", "framework");
        if (framework)
        {
            var appKit = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPView, "class")),
                url = objj_msgSend(objj_msgSend(appKit, "bundleURL"), "URLByDeletingLastPathComponent");
            url = objj_msgSend(CPURL, "URLWithString:relativeToURL:", framework, url);
            self._bundle = objj_msgSend(CPBundle, "bundleWithURL:", url);
        }
    }
    if (!self._bundle)
    {
        if (aCoder)
            self._bundle = objj_msgSend(aCoder, "bundle");
        else
            self._bundle = objj_msgSend(CPBundle, "mainBundle");
    }
    return self._bundle;
}
,["CPBundle","CPCoder"]), new objj_method(sel_getUid("imageFromCoder:"), function $_CPCibCustomResource__imageFromCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(self, "imageBundleWithCoder:", aCoder), "pathForResource:", self._resourceName), objj_msgSend(self._properties, "valueForKey:", "size"));
}
,["CPImage","CPCoder"]), new objj_method(sel_getUid("filename"), function $_CPCibCustomResource__filename(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "imageBundleWithCoder:", nil), "pathForResource:", self._resourceName);
}
,["CPString"]), new objj_method(sel_getUid("size"), function $_CPCibCustomResource__size(self, _cmd)
{
    return objj_msgSend(self._properties, "objectForKey:", "size");
}
,["CGSize"]), new objj_method(sel_getUid("isSingleImage"), function $_CPCibCustomResource__isSingleImage(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("isThreePartImage"), function $_CPCibCustomResource__isThreePartImage(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("isNinePartImage"), function $_CPCibCustomResource__isNinePartImage(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("loadStatus"), function $_CPCibCustomResource__loadStatus(self, _cmd)
{
    return CPImageLoadStatusCompleted;
}
,["unsigned"]), new objj_method(sel_getUid("delegate"), function $_CPCibCustomResource__delegate(self, _cmd)
{
    return nil;
}
,["id"]), new objj_method(sel_getUid("description"), function $_CPCibCustomResource__description(self, _cmd)
{
    var image = objj_msgSend(self, "imageFromCoder:", nil);
    return objj_msgSend(image, "description");
}
,["CPString"])]);
}