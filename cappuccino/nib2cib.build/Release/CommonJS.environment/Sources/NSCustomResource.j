@STATIC;1.0;I;29;AppKit/_CPCibCustomResource.ji;18;Nib2CibException.jt;4297;objj_executeFile("AppKit/_CPCibCustomResource.j", NO);objj_executeFile("Nib2CibException.j", YES);var FILE = require("file"),
    imageSize = (require("cappuccino/imagesize")).imagesize,
    supportedTemplateImages = {"NSAddTemplate": "CPAddTemplate", "NSRemoveTemplate": "CPRemoveTemplate", "NSToolbarShowColors": "CPImageNameColorPanel"};
{
var the_class = objj_getClass("_CPCibCustomResource")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibCustomResource\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPCibCustomResource__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibCustomResource").super_class }, "init");
    if (self)
    {
        self._className = CP_NSMapClassName((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSClassName")));
        self._resourceName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSResourceName"));
        var size = CGSizeMakeZero(),
            framework = "",
            bundleIdentifier = "";
        if (self._resourceName == "NSSwitch" || self._resourceName == "NSRadioButton")
            return nil;
        else if (/^NS[A-Z][A-Za-z]+$/.test(self._resourceName))
        {
            if (supportedTemplateImages[self._resourceName])
            {
                self._resourceName = supportedTemplateImages[self._resourceName];
            }
            else
                CPException.isa.objj_msgSend3(CPException, "raise:format:", Nib2CibException, "The built in image “%@” is not supported.", self._resourceName);
        }
        else
        {
            var match = /^(.+)@(.+)$/.exec(self._resourceName);
            if (match)
            {
                self._resourceName = match[1];
                framework = match[2];
            }
            var resourceInfo = (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "resourceInfoForName:inFramework:", self._resourceName, framework));
            if (!resourceInfo)
                CPLog.warn("Resource \"" + self._resourceName + "\" not found in the Resources directories");
            else
            {
                size = imageSize(FILE.canonical(resourceInfo.path)) || CGSizeMakeZero();
                framework = resourceInfo.framework;
            }
            if (resourceInfo && resourceInfo.path)
            {
                match = /^.+\/Resources\/(.+)$/.exec(resourceInfo.path);
                self._resourceName = match[1];
            }
        }
        if (resourceInfo && resourceInfo.path && resourceInfo.framework)
        {
            var frameworkPath = FILE.dirname(FILE.dirname(resourceInfo.path)),
                bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithPath:", frameworkPath);
            (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "loadWithDelegate:", nil));
            bundleIdentifier = (bundle == null ? null : bundle.isa.objj_msgSend0(bundle, "bundleIdentifier")) || "";
        }
        self._properties = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", size, "size", bundleIdentifier, "bundleIdentifier", framework, "framework");
        CPLog.debug("    Resource: %s\n   Framework: %s%s\n        Path: %s\n        Size: %d x %d", self._resourceName, framework ? framework : "<none>", bundleIdentifier ? " (" + bundleIdentifier + ")" : framework ? " (<no bundle identifier>)" : "", resourceInfo ? FILE.canonical(resourceInfo.path) : "", size.width, size.height);
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(_CPCibCustomResource, "NSCustomResource"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSCustomResource__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSCustomResource__classForKeyedArchiver(self, _cmd)
{
    return _CPCibCustomResource.isa.objj_msgSend0(_CPCibCustomResource, "class");
}
,["Class"])]);
}