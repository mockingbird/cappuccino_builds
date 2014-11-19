@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;17;CPCompatibility.ji;9;CPImage.ji;9;CPTheme.jt;9639;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPTheme.j", YES);var _CPCibCustomResourceClassNameKey = "_CPCibCustomResourceClassNameKey",
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
        self._className = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibCustomResourceClassNameKey));
        self._resourceName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibCustomResourceResourceNameKey));
        self._properties = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibCustomResourcePropertiesKey));
        self._bundle = nil;
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibCustomResource__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._className, _CPCibCustomResourceClassNameKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._resourceName, _CPCibCustomResourceResourceNameKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._properties, _CPCibCustomResourcePropertiesKey));
}
,["void","CPCoder"]), new objj_method(sel_getUid("awakeAfterUsingCoder:"), function $_CPCibCustomResource__awakeAfterUsingCoder_(self, _cmd, aCoder)
{
    if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "respondsToSelector:", sel_getUid("bundle"))) && (!(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "respondsToSelector:", sel_getUid("awakenCustomResources"))) || (aCoder == null ? null : aCoder.isa.objj_msgSend0(aCoder, "awakenCustomResources"))))
        if (self._className === "CPImage")
        {
            var templateImage = (_CPCibCustomResourceTemplateImageMap == null ? null : _CPCibCustomResourceTemplateImageMap.isa.objj_msgSend1(_CPCibCustomResourceTemplateImageMap, "objectForKey:", self._resourceName));
            if (templateImage)
                return ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", templateImage, (CPButtonBar == null ? null : CPButtonBar.isa.objj_msgSend0(CPButtonBar, "class"))));
            else
                return self.isa.objj_msgSend1(self, "imageFromCoder:", aCoder);
        }
    return self;
    var ___r1;
}
,["id","CPCoder"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $_CPCibCustomResource__initialize(self, _cmd)
{
    if (self !== _CPCibCustomResource.isa.objj_msgSend0(_CPCibCustomResource, "class"))
        return;
    _CPCibCustomResourceTemplateImageMap = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", "button-image-plus", "CPAddTemplate", "button-image-minus", "CPRemoveTemplate");
}
,["void"]), new objj_method(sel_getUid("imageResourceWithName:size:"), function $_CPCibCustomResource__imageResourceWithName_size_(self, _cmd, aResourceName, aSize)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithClassName:resourceName:properties:", "CPImage", aResourceName, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aSize, "size")));
    var ___r1;
}
,["id","CPString","CGSize"]), new objj_method(sel_getUid("imageResourceWithName:size:bundleClass:"), function $_CPCibCustomResource__imageResourceWithName_size_bundleClass_(self, _cmd, aResourceName, aSize, aBundleClass)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithClassName:resourceName:properties:", "CPImage", aResourceName, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aSize, "size", aBundleClass, "bundleClass")));
    var ___r1;
}
,["id","CPString","CGSize","CPString"])]);
}{
var the_class = objj_getClass("_CPCibCustomResource")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibCustomResource\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("imageBundleWithCoder:"), function $_CPCibCustomResource__imageBundleWithCoder_(self, _cmd, aCoder)
{
    if (self._bundle)
        return self._bundle;
    var bundleIdentifier = ((___r1 = self._properties), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "bundleIdentifier"));
    if (bundleIdentifier)
        self._bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithIdentifier:", bundleIdentifier);
    else
    {
        var bundleClass = ((___r1 = self._properties), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "bundleClass"));
        if (bundleClass)
        {
            bundleClass = CPClassFromString(bundleClass);
            if (bundleClass)
                self._bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", bundleClass);
        }
    }
    if (!self._bundle)
    {
        var framework = ((___r1 = self._properties), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "framework"));
        if (framework)
        {
            var appKit = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", (CPView == null ? null : CPView.isa.objj_msgSend0(CPView, "class"))),
                url = ((___r1 = (appKit == null ? null : appKit.isa.objj_msgSend0(appKit, "bundleURL"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "URLByDeletingLastPathComponent"));
            url = CPURL.isa.objj_msgSend2(CPURL, "URLWithString:relativeToURL:", framework, url);
            self._bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithURL:", url);
        }
    }
    if (!self._bundle)
    {
        if (aCoder)
            self._bundle = (aCoder == null ? null : aCoder.isa.objj_msgSend0(aCoder, "bundle"));
        else
            self._bundle = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle");
    }
    return self._bundle;
    var ___r1;
}
,["CPBundle","CPCoder"]), new objj_method(sel_getUid("imageFromCoder:"), function $_CPCibCustomResource__imageFromCoder_(self, _cmd, aCoder)
{
    return ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", ((___r2 = self.isa.objj_msgSend1(self, "imageBundleWithCoder:", aCoder)), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "pathForResource:", self._resourceName)), ((___r2 = self._properties), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", "size"))));
    var ___r1, ___r2;
}
,["CPImage","CPCoder"]), new objj_method(sel_getUid("filename"), function $_CPCibCustomResource__filename(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend1(self, "imageBundleWithCoder:", nil)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", self._resourceName));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("size"), function $_CPCibCustomResource__size(self, _cmd)
{
    return ((___r1 = self._properties), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "size"));
    var ___r1;
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
    var image = self.isa.objj_msgSend1(self, "imageFromCoder:", nil);
    return (image == null ? null : image.isa.objj_msgSend0(image, "description"));
}
,["CPString"])]);
}