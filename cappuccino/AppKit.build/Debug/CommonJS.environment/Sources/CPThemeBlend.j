@STATIC;1.0;I;21;Foundation/CPObject.ji;9;CPTheme.ji;22;_CPCibCustomResource.ji;23;_CPCibKeyedUnarchiver.jt;3121;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPTheme.j", YES);objj_executeFile("_CPCibCustomResource.j", YES);objj_executeFile("_CPCibKeyedUnarchiver.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPThemeBlend"),
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
        self._bundle = ((___r1 = CPBundle.isa.objj_msgSend0(CPBundle, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithPath:", aURL));
    }
    return self;
    var ___r1;
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
    ((___r1 = self._bundle), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "loadWithDelegate:", self));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("bundleDidFinishLoading:"), function $CPThemeBlend__bundleDidFinishLoading_(self, _cmd, aBundle)
{
    self._themes = ((___r1 = self._bundle), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForInfoDictionaryKey:", "CPKeyedThemes"));
    var count = self._themes.length;
    while (count--)
    {
        var path = (aBundle == null ? null : aBundle.isa.objj_msgSend1(aBundle, "pathForResource:", self._themes[count])),
            unarchiver = ((___r1 = _CPThemeKeyedUnarchiver.isa.objj_msgSend0(_CPThemeKeyedUnarchiver, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initForReadingWithData:bundle:", ((___r2 = CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", path)), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "staticResourceData")), self._bundle));
        (unarchiver == null ? null : unarchiver.isa.objj_msgSend1(unarchiver, "decodeObjectForKey:", "root"));
        (unarchiver == null ? null : unarchiver.isa.objj_msgSend0(unarchiver, "finishDecoding"));
    }
    ((___r1 = self._loadDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "blendDidFinishLoading:", self));
    var ___r1, ___r2;
}
,["void","CPBundle"])]);
}