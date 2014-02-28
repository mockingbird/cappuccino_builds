@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPBundle.ji;8;CPView.jt;14701;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPBundle.j", NO);objj_executeFile("CPView.j", YES);CPFontDefaultSystemFontFace = "Arial, sans-serif";
CPFontDefaultSystemFontSize = 12;
CPFontCurrentSystemSize = -1;
_CPFontSystemFacePlaceholder = "_CPFontSystemFacePlaceholder";
var _CPFontCache = {},
    _CPSystemFontCache = {},
    _CPFontSystemFontFace = CPFontDefaultSystemFontFace,
    _CPFontSystemFontSize = 12,
    _CPFontFallbackFaces = CPFontDefaultSystemFontFace.split(", "),
    _CPFontStripRegExp = new RegExp("(^\\s*[\"']?|[\"']?\\s*$)", "g");
{var the_class = objj_allocateClassPair(CPObject, "CPFont"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_size"), new objj_ivar("_ascender"), new objj_ivar("_descender"), new objj_ivar("_lineHeight"), new objj_ivar("_isBold"), new objj_ivar("_isItalic"), new objj_ivar("_isSystem"), new objj_ivar("_cssString")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isBold"), function $CPFont__isBold(self, _cmd)
{
    return self._isBold;
}
,["BOOL"]), new objj_method(sel_getUid("isItalic"), function $CPFont__isItalic(self, _cmd)
{
    return self._isItalic;
}
,["BOOL"]), new objj_method(sel_getUid("isSystem"), function $CPFont__isSystem(self, _cmd)
{
    return self._isSystem;
}
,["BOOL"]), new objj_method(sel_getUid("_initWithName:size:bold:italic:system:"), function $CPFont___initWithName_size_bold_italic_system_(self, _cmd, aName, aSize, isBold, isItalic, isSystem)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPFont").super_class }, "init");
    if (self)
    {
        self._size = aSize;
        self._ascender = 0;
        self._descender = 0;
        self._lineHeight = 0;
        self._isBold = isBold;
        self._isItalic = isItalic;
        self._isSystem = isSystem;
        if (isSystem)
        {
            self._name = aName;
            self._cssString = _CPFontCreateCSSString(_CPFontSystemFontFace, self._size, self._isBold, self._isItalic);
            _CPSystemFontCache[String(self._size) + (self._isBold ? "b" : "")] = self;
        }
        else
        {
            self._name = (_CPFontNormalizedNameArray(aName)).join(", ");
            self._cssString = _CPFontCreateCSSString(self._name, self._size, self._isBold, self._isItalic);
            _CPFontCache[self._cssString] = self;
        }
    }
    return self;
}
,["id","CPString","float","BOOL","BOOL","BOOL"]), new objj_method(sel_getUid("ascender"), function $CPFont__ascender(self, _cmd)
{
    var font = self._isSystem ? _CPSystemFontCache[String(self._size) + (self._isBold ? "b" : "")] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", _CPFontSystemFacePlaceholder, self._size, self._isBold, NO, YES) : self;
    if (!font._ascender)
        objj_msgSend(font, "_getMetrics");
    return font._ascender;
}
,["float"]), new objj_method(sel_getUid("descender"), function $CPFont__descender(self, _cmd)
{
    var font = self._isSystem ? _CPSystemFontCache[String(self._size) + (self._isBold ? "b" : "")] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", _CPFontSystemFacePlaceholder, self._size, self._isBold, NO, YES) : self;
    if (!font._descender)
        objj_msgSend(font, "_getMetrics");
    return font._descender;
}
,["float"]), new objj_method(sel_getUid("defaultLineHeightForFont"), function $CPFont__defaultLineHeightForFont(self, _cmd)
{
    var font = self._isSystem ? _CPSystemFontCache[String(self._size) + (self._isBold ? "b" : "")] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", _CPFontSystemFacePlaceholder, self._size, self._isBold, NO, YES) : self;
    if (!font._lineHeight)
        objj_msgSend(font, "_getMetrics");
    return font._lineHeight;
}
,["float"]), new objj_method(sel_getUid("size"), function $CPFont__size(self, _cmd)
{
    return self._size <= 0 ? _CPFontSystemFontSize : self._size;
}
,["float"]), new objj_method(sel_getUid("cssString"), function $CPFont__cssString(self, _cmd)
{
    var font = self._isSystem ? _CPSystemFontCache[String(self._size) + (self._isBold ? "b" : "")] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", _CPFontSystemFacePlaceholder, self._size, self._isBold, NO, YES) : self;
    return font._cssString;
}
,["CPString"]), new objj_method(sel_getUid("familyName"), function $CPFont__familyName(self, _cmd)
{
    if (self._isSystem)
        return _CPFontSystemFontFace;
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("isSystemSize"), function $CPFont__isSystemSize(self, _cmd)
{
    return self._size <= 0;
}
,["BOOL"]), new objj_method(sel_getUid("isEqual:"), function $CPFont__isEqual_(self, _cmd, anObject)
{
    return objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(CPFont, "class")) && objj_msgSend(anObject, "cssString") === self._cssString;
}
,["BOOL","id"]), new objj_method(sel_getUid("description"), function $CPFont__description(self, _cmd)
{
    return objj_msgSend(CPString, "stringWithFormat:", "%@ %@", objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPFont").super_class }, "description"), objj_msgSend(self, "cssString"));
}
,["CPString"]), new objj_method(sel_getUid("copy"), function $CPFont__copy(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", self._name, self._size, self._isBold, self._isItalic, self._isSystem);
}
,["id"]), new objj_method(sel_getUid("_getMetrics"), function $CPFont___getMetrics(self, _cmd)
{
    var metrics = objj_msgSend(CPString, "metricsOfFont:", self);
    self._ascender = objj_msgSend(metrics, "objectForKey:", "ascender");
    self._descender = objj_msgSend(metrics, "objectForKey:", "descender");
    self._lineHeight = objj_msgSend(metrics, "objectForKey:", "lineHeight");
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPFont__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPFont, "class"))
        return;
    var systemFontFace = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "CPSystemFontFace");
    if (!systemFontFace)
        systemFontFace = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPView, "class")), "objectForInfoDictionaryKey:", "CPSystemFontFace");
    if (systemFontFace)
        _CPFontSystemFontFace = (_CPFontNormalizedNameArray(systemFontFace)).join(", ");
    var systemFontSize = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "CPSystemFontSize");
    if (!systemFontSize)
        systemFontSize = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPView, "class")), "objectForInfoDictionaryKey:", "CPSystemFontSize");
    if (systemFontSize)
        _CPFontSystemFontSize = systemFontSize;
}
,["void"]), new objj_method(sel_getUid("systemFontFace"), function $CPFont__systemFontFace(self, _cmd)
{
    return _CPFontSystemFontFace;
}
,["CPString"]), new objj_method(sel_getUid("setSystemFontFace:"), function $CPFont__setSystemFontFace_(self, _cmd, aFace)
{
    var normalizedFaces = (_CPFontNormalizedNameArray(aFace)).join(", ");
    if (normalizedFaces === _CPFontSystemFontFace)
        return;
    objj_msgSend(self, "_invalidateSystemFontCache");
    _CPFontSystemFontFace = aFace;
}
,["CPString","CPString"]), new objj_method(sel_getUid("systemFontSize"), function $CPFont__systemFontSize(self, _cmd)
{
    return _CPFontSystemFontSize;
}
,["float"]), new objj_method(sel_getUid("systemFontSizeForControlSize:"), function $CPFont__systemFontSizeForControlSize_(self, _cmd, aSize)
{
    switch(aSize) {
    case CPSmallControlSize:
        return _CPFontSystemFontSize - 1;
    case CPMiniControlSize:
        return _CPFontSystemFontSize - 2;
    case CPRegularControlSize:
default:
        return _CPFontSystemFontSize;
    }
}
,["float","CPControlSize"]), new objj_method(sel_getUid("setSystemFontSize:"), function $CPFont__setSystemFontSize_(self, _cmd, size)
{
    if (size > 0 && size !== _CPFontSystemFontSize)
    {
        objj_msgSend(self, "_invalidateSystemFontCache");
        _CPFontSystemFontSize = size;
    }
}
,["float","float"]), new objj_method(sel_getUid("_invalidateSystemFontCache"), function $CPFont___invalidateSystemFontCache(self, _cmd)
{
    var systemSize = String(_CPFontSystemFontSize),
        currentSize = String(CPFontCurrentSystemSize);
    for (var key in _CPSystemFontCache)
    {
        if (_CPSystemFontCache.hasOwnProperty(key) && (key.indexOf(systemSize) === 0 || key.indexOf(currentSize) === 0))
        {
            delete _CPSystemFontCache[key];
        }
    }
}
,["void"]), new objj_method(sel_getUid("fontWithName:size:"), function $CPFont__fontWithName_size_(self, _cmd, aName, aSize)
{
    return _CPFontCache[_CPFontCreateCSSString((_CPFontNormalizedNameArray(aName)).join(", "), aSize <= 0 ? _CPFontSystemFontSize : aSize, NO, NO)] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", aName, aSize <= 0 ? _CPFontSystemFontSize : aSize, NO, NO, NO);
}
,["CPFont","CPString","float"]), new objj_method(sel_getUid("fontWithName:size:italic:"), function $CPFont__fontWithName_size_italic_(self, _cmd, aName, aSize, italic)
{
    return _CPFontCache[_CPFontCreateCSSString((_CPFontNormalizedNameArray(aName)).join(", "), aSize <= 0 ? _CPFontSystemFontSize : aSize, NO, italic)] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", aName, aSize <= 0 ? _CPFontSystemFontSize : aSize, NO, italic, NO);
}
,["CPFont","CPString","float","BOOL"]), new objj_method(sel_getUid("boldFontWithName:size:"), function $CPFont__boldFontWithName_size_(self, _cmd, aName, aSize)
{
    return _CPFontCache[_CPFontCreateCSSString((_CPFontNormalizedNameArray(aName)).join(", "), aSize <= 0 ? _CPFontSystemFontSize : aSize, YES, NO)] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", aName, aSize <= 0 ? _CPFontSystemFontSize : aSize, YES, NO, NO);
}
,["CPFont","CPString","float"]), new objj_method(sel_getUid("boldFontWithName:size:italic:"), function $CPFont__boldFontWithName_size_italic_(self, _cmd, aName, aSize, italic)
{
    return _CPFontCache[_CPFontCreateCSSString((_CPFontNormalizedNameArray(aName)).join(", "), aSize <= 0 ? _CPFontSystemFontSize : aSize, YES, italic)] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", aName, aSize <= 0 ? _CPFontSystemFontSize : aSize, YES, italic, NO);
}
,["CPFont","CPString","float","BOOL"]), new objj_method(sel_getUid("_fontWithName:size:bold:italic:"), function $CPFont___fontWithName_size_bold_italic_(self, _cmd, aName, aSize, bold, italic)
{
    return _CPFontCache[_CPFontCreateCSSString((_CPFontNormalizedNameArray(aName)).join(", "), aSize <= 0 ? _CPFontSystemFontSize : aSize, bold, italic)] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", aName, aSize <= 0 ? _CPFontSystemFontSize : aSize, bold, italic, NO);
}
,["CPFont","CPString","float","BOOL","BOOL"]), new objj_method(sel_getUid("systemFontOfSize:"), function $CPFont__systemFontOfSize_(self, _cmd, aSize)
{
    return _CPSystemFontCache[String(aSize === 0 ? _CPFontSystemFontSize : aSize) + (NO ? "b" : "")] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", _CPFontSystemFacePlaceholder, aSize === 0 ? _CPFontSystemFontSize : aSize, NO, NO, YES);
}
,["CPFont","CGSize"]), new objj_method(sel_getUid("boldSystemFontOfSize:"), function $CPFont__boldSystemFontOfSize_(self, _cmd, aSize)
{
    return _CPSystemFontCache[String(aSize === 0 ? _CPFontSystemFontSize : aSize) + (YES ? "b" : "")] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", _CPFontSystemFacePlaceholder, aSize === 0 ? _CPFontSystemFontSize : aSize, YES, NO, YES);
}
,["CPFont","CGSize"])]);
}var CPFontNameKey = "CPFontNameKey",
    CPFontSizeKey = "CPFontSizeKey",
    CPFontIsBoldKey = "CPFontIsBoldKey",
    CPFontIsItalicKey = "CPFontIsItalicKey",
    CPFontIsSystemKey = "CPFontIsSystemKey";
{
var the_class = objj_getClass("CPFont")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPFont\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPFont__initWithCoder_(self, _cmd, aCoder)
{
    var fontName = objj_msgSend(aCoder, "decodeObjectForKey:", CPFontNameKey),
        size = objj_msgSend(aCoder, "decodeFloatForKey:", CPFontSizeKey),
        isBold = objj_msgSend(aCoder, "decodeBoolForKey:", CPFontIsBoldKey),
        isItalic = objj_msgSend(aCoder, "decodeBoolForKey:", CPFontIsItalicKey),
        isSystem = objj_msgSend(aCoder, "decodeBoolForKey:", CPFontIsSystemKey);
    return objj_msgSend(self, "_initWithName:size:bold:italic:system:", fontName, size, isBold, isItalic, isSystem);
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPFont__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._name, CPFontNameKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._size, CPFontSizeKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isBold, CPFontIsBoldKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isItalic, CPFontIsItalicKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isSystem, CPFontIsSystemKey);
}
,["void","CPCoder"])]);
}var _CPFontCreateCSSString = function(aName, aSize, isBold, isItalic)
{
    var properties = (isItalic ? "italic " : "") + (isBold ? "bold " : "") + (aSize <= 0 ? _CPFontSystemFontSize : aSize) + "px ";
    return properties + _CPFontConcatNameWithFallback(aName);
};
var _CPFontConcatNameWithFallback = function(aName)
{
    var names = _CPFontNormalizedNameArray(aName),
        fallbackFaces = _CPFontFallbackFaces.slice(0);
    for (var i = 0; i < names.length; ++i)
    {
        for (var j = 0; j < fallbackFaces.length; ++j)
        {
            if (names[i].toLowerCase() === fallbackFaces[j].toLowerCase())
            {
                fallbackFaces.splice(j, 1);
                break;
            }
        }
        if (names[i].indexOf(" ") > 0)
            names[i] = '"' + names[i] + '"';
    }
    return (names.concat(fallbackFaces)).join(", ");
};
var _CPFontNormalizedNameArray = function(aName)
{
    var names = aName.split(",");
    for (var i = 0; i < names.length; ++i)
        names[i] = names[i].replace(_CPFontStripRegExp, "");
    return names;
};
