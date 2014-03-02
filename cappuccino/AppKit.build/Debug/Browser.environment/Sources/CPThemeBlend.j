@STATIC;1.0;I;21;Foundation/CPObject.ji;9;CPTheme.ji;22;_CPCibCustomResource.ji;23;_CPCibKeyedUnarchiver.jt;2565;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPTheme.j", YES);objj_executeFile("_CPCibCustomResource.j", YES);objj_executeFile("_CPCibKeyedUnarchiver.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPThemeBlend"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle"), new objj_ivar("_themes"), new objj_ivar("_loadDelegate")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("bundle"), function $CPThemeBlend__bundle(self, _cmd)
{
    return self._bundle;
}
,["CPBundle"]), new objj_method(sel_getUid("_setBundle:"), function $CPThemeBlend___setBundle_(self, _cmd, newValue)
{
    self._bundle = newValue;
}
,["void","CPBundle"]), new objj_method(sel_getUid("initWithContentsOfURL:"), function $CPThemeBlend__initWithContentsOfURL_(self, _cmd, aURL)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPThemeBlend").super_class }, "init");
    if (self)
    {
        self._bundle = objj_msgSend(objj_msgSend(CPBundle, "alloc"), "initWithPath:", aURL);
    }
    return self;
}
,["id","CPURL"]), new objj_method(sel_getUid("themes"), function $CPThemeBlend__themes(self, _cmd)
{
    return self._themes;
}
,["CPArray"]), new objj_method(sel_getUid("themeNames"), function $CPThemeBlend__themeNames(self, _cmd)
{
    var names = [];
    for (var i = 0; i < self._themes.length; ++i)
        names.push(self._themes[i].substring(0, self._themes[i].indexOf(".keyedtheme")));
    return names;
}
,["CPArray"]), new objj_method(sel_getUid("loadWithDelegate:"), function $CPThemeBlend__loadWithDelegate_(self, _cmd, aDelegate)
{
    self._loadDelegate = aDelegate;
    objj_msgSend(self._bundle, "loadWithDelegate:", self);
}
,["void","id"]), new objj_method(sel_getUid("bundleDidFinishLoading:"), function $CPThemeBlend__bundleDidFinishLoading_(self, _cmd, aBundle)
{
    self._themes = objj_msgSend(self._bundle, "objectForInfoDictionaryKey:", "CPKeyedThemes");
    var count = self._themes.length;
    while (count--)
    {
        var path = objj_msgSend(aBundle, "pathForResource:", self._themes[count]),
            unarchiver = objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver, "alloc"), "initForReadingWithData:bundle:", objj_msgSend(objj_msgSend(CPURL, "URLWithString:", path), "staticResourceData"), self._bundle);
        objj_msgSend(unarchiver, "decodeObjectForKey:", "root");
        objj_msgSend(unarchiver, "finishDecoding");
    }
    objj_msgSend(self._loadDelegate, "blendDidFinishLoading:", self);
}
,["void","CPBundle"])]);
}