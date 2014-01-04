@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;6538;


objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPString.j", NO);


var _CPCibCustomResourceClassNameKey = "_CPCibCustomResourceClassNameKey",
    _CPCibCustomResourceResourceNameKey = "_CPCibCustomResourceResourceNameKey",
    _CPCibCustomResourcePropertiesKey = "_CPCibCustomResourcePropertiesKey";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibCustomResource"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className"), new objj_ivar("_resourceName"), new objj_ivar("_properties")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithClassName:resourceName:properties:"), function $_CPCibCustomResource__initWithClassName_resourceName_properties_(self, _cmd, aClassName, aResourceName, properties)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibCustomResource").super_class }, "init");

    if (self)
    {
        _className = aClassName;
        _resourceName = aResourceName;
        _properties = properties;
    }

    return self;
}
},["id","CPString","CPString","CPDictionary"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPCibCustomResource__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibCustomResource").super_class }, "init");

    if (self)
    {
        _className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourceClassNameKey);
        _resourceName = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourceResourceNameKey);
        _properties = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourcePropertiesKey);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibCustomResource__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _className, _CPCibCustomResourceClassNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _resourceName, _CPCibCustomResourceResourceNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _properties, _CPCibCustomResourcePropertiesKey);
}
},["void","CPCoder"]), new objj_method(sel_getUid("awakeAfterUsingCoder:"), function $_CPCibCustomResource__awakeAfterUsingCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (objj_msgSend(aCoder, "respondsToSelector:", sel_getUid("bundle")) &&
        (!objj_msgSend(aCoder, "respondsToSelector:", sel_getUid("awakenCustomResources")) || objj_msgSend(aCoder, "awakenCustomResources")))
        if (_className === "CPImage")
        {
            if (_resourceName == "CPAddTemplate")
                return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPButtonBar, "class")), "pathForResource:", "plus_button.png"), CGSizeMake(11, 12));
            else if (_resourceName == "CPRemoveTemplate")
                return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPButtonBar, "class")), "pathForResource:", "minus_button.png"), CGSizeMake(11, 4));

            return objj_msgSend(self, "imageFromBundle:", objj_msgSend(aCoder, "bundle"));
        }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("imageFromBundle:"), function $_CPCibCustomResource__imageFromBundle_(self, _cmd, aBundle)
{ with(self)
{
    if (!aBundle)
    {
        var bundleClass = _properties.valueForKey("bundleClass");

        if (bundleClass)
        {
            bundleClass = CPClassFromString(bundleClass);

            if (bundleClass)
                aBundle = objj_msgSend(CPBundle, "bundleForClass:", bundleClass);
        }
        else
            aBundle = objj_msgSend(CPBundle, "mainBundle");
    }

    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(aBundle, "pathForResource:", _resourceName), _properties.valueForKey("size"));
}
},["CPImage","CPBundle"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("imageResourceWithName:size:"), function $_CPCibCustomResource__imageResourceWithName_size_(self, _cmd, aResourceName, aSize)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithClassName:resourceName:properties:", "CPImage", aResourceName, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", aSize, "size"));
}
},["id","CPString","CGSize"]), new objj_method(sel_getUid("imageResourceWithName:size:bundleClass:"), function $_CPCibCustomResource__imageResourceWithName_size_bundleClass_(self, _cmd, aResourceName, aSize, aBundleClass)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithClassName:resourceName:properties:", "CPImage", aResourceName, objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [aSize, aBundleClass], ["size", "bundleClass"]));
}
},["id","CPString","CGSize","CPString"])]);
}

{
var the_class = objj_getClass("_CPCibCustomResource")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibCustomResource\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("filename"), function $_CPCibCustomResource__filename(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", _resourceName);
}
},["CPString"]), new objj_method(sel_getUid("size"), function $_CPCibCustomResource__size(self, _cmd)
{ with(self)
{
    return objj_msgSend(_properties, "objectForKey:", "size");
}
},["CGSize"]), new objj_method(sel_getUid("isThreePartImage"), function $_CPCibCustomResource__isThreePartImage(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("isNinePartImage"), function $_CPCibCustomResource__isNinePartImage(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("loadStatus"), function $_CPCibCustomResource__loadStatus(self, _cmd)
{ with(self)
{
    return CPImageLoadStatusCompleted;
}
},["unsigned"]), new objj_method(sel_getUid("delegate"), function $_CPCibCustomResource__delegate(self, _cmd)
{ with(self)
{
    return nil;
}
},["id"]), new objj_method(sel_getUid("description"), function $_CPCibCustomResource__description(self, _cmd)
{ with(self)
{
    var image = objj_msgSend(self, "imageFromBundle:", nil);

    return objj_msgSend(image, "description");
}
},["CPString"])]);
}

