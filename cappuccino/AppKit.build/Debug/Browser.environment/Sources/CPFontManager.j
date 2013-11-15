@STATIC;1.0;I;21;Foundation/CPObject.ji;8;CPFont.jt;9813;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPFont.j", YES);CPItalicFontMask = 1 << 0;
CPBoldFontMask = 1 << 1;
CPUnboldFontMask = 1 << 2;
CPNonStandardCharacterSetFontMask = 1 << 3;
CPNarrowFontMask = 1 << 4;
CPExpandedFontMask = 1 << 5;
CPCondensedFontMask = 1 << 6;
CPSmallCapsFontMask = 1 << 7;
CPPosterFontMask = 1 << 8;
CPCompressedFontMask = 1 << 9;
CPFixedPitchFontMask = 1 << 10;
CPUnitalicFontMask = 1 << 24;
var CPSharedFontManager = nil,
    CPFontManagerFactory = Nil;
{var the_class = objj_allocateClassPair(CPObject, "CPFontManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_availableFonts"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_delegate"), new objj_ivar("_selectedFont"), new objj_ivar("_multiple"), new objj_ivar("_activeChange")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("target"), function $CPFontManager__target(self, _cmd)
{
    return self._target;
}
,["id"]), new objj_method(sel_getUid("setTarget:"), function $CPFontManager__setTarget_(self, _cmd, newValue)
{
    self._target = newValue;
}
,["void","id"]), new objj_method(sel_getUid("action"), function $CPFontManager__action(self, _cmd)
{
    return self._action;
}
,["SEL"]), new objj_method(sel_getUid("setAction:"), function $CPFontManager__setAction_(self, _cmd, newValue)
{
    self._action = newValue;
}
,["void","SEL"]), new objj_method(sel_getUid("delegate"), function $CPFontManager__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPFontManager__setDelegate_(self, _cmd, newValue)
{
    self._delegate = newValue;
}
,["void","id"]), new objj_method(sel_getUid("isMultiple"), function $CPFontManager__isMultiple(self, _cmd)
{
    return self._multiple;
}
,["BOOL"]), new objj_method(sel_getUid("setMultiple:"), function $CPFontManager__setMultiple_(self, _cmd, newValue)
{
    self._multiple = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("init"), function $CPFontManager__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPFontManager").super_class }, "init"))
    {
        self._action = sel_getUid("changeFont:");
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("availableFonts"), function $CPFontManager__availableFonts(self, _cmd)
{
    if (!self._availableFonts)
    {
        self._availableFonts = [];
        _CPFontDetectSpan = document.createElement("span");
        _CPFontDetectSpan.fontSize = "24px";
        _CPFontDetectSpan.appendChild(document.createTextNode("mmmmmmmmmml"));
        var div = document.createElement("div");
        div.style.position = "absolute";
        div.style.top = "-1000px";
        div.appendChild(_CPFontDetectSpan);
        (document.getElementsByTagName("body"))[0].appendChild(div);
        _CPFontDetectReferenceFonts = _CPFontDetectPickTwoDifferentFonts(["monospace", "serif", "sans-serif", "cursive"]);
        for (var i = 0; i < _CPFontDetectAllFonts.length; i++)
        {
            var available = _CPFontDetectFontAvailable(_CPFontDetectAllFonts[i]);
            if (available)
                self._availableFonts.push(_CPFontDetectAllFonts[i]);
        }
    }
    return self._availableFonts;
}
,["CPArray"]), new objj_method(sel_getUid("fontWithNameIsAvailable:"), function $CPFontManager__fontWithNameIsAvailable_(self, _cmd, aFontName)
{
    return _CPFontDetectFontAvailable(aFontName);
}
,["CPArray","CPString"]), new objj_method(sel_getUid("setSelectedFont:isMultiple:"), function $CPFontManager__setSelectedFont_isMultiple_(self, _cmd, aFont, aFlag)
{
    self._selectedFont = aFont;
    self._multiple = aFlag;
}
,["void","CPFont","BOOL"]), new objj_method(sel_getUid("selectedFont"), function $CPFontManager__selectedFont(self, _cmd)
{
    return self._selectedFont;
}
,["CPFont"]), new objj_method(sel_getUid("weightOfFont:"), function $CPFontManager__weightOfFont_(self, _cmd, aFont)
{
    return objj_msgSend(aFont, "isBold") ? 9 : 5;
}
,["int","CPFont"]), new objj_method(sel_getUid("traitsOfFont:"), function $CPFontManager__traitsOfFont_(self, _cmd, aFont)
{
    return (objj_msgSend(aFont, "isBold") ? CPBoldFontMask : 0) | (objj_msgSend(aFont, "isItalic") ? CPItalicFontMask : 0);
}
,["CPFontTraitMask","CPFont"]), new objj_method(sel_getUid("convertFont:"), function $CPFontManager__convertFont_(self, _cmd, aFont)
{
    if (!self._activeChange)
        return aFont;
    var addTraits = objj_msgSend(self._activeChange, "valueForKey:", "addTraits");
    if (addTraits)
        aFont = objj_msgSend(self, "convertFont:toHaveTrait:", aFont, addTraits);
    return aFont;
}
,["CPFont","CPFont"]), new objj_method(sel_getUid("convertFont:toHaveTrait:"), function $CPFontManager__convertFont_toHaveTrait_(self, _cmd, aFont, addTraits)
{
    if (!aFont)
        return nil;
    var shouldBeBold = (objj_msgSend(aFont, "isBold") || addTraits & CPBoldFontMask) && !(addTraits & CPUnboldFontMask),
        shouldBeItalic = (objj_msgSend(aFont, "isItalic") || addTraits & CPItalicFontMask) && !(addTraits & CPUnitalicFontMask),
        shouldBeSize = objj_msgSend(aFont, "size");
    aFont = objj_msgSend(CPFont, "_fontWithName:size:bold:italic:", objj_msgSend(aFont, "familyName"), shouldBeSize, shouldBeBold, shouldBeItalic) || aFont;
    return aFont;
}
,["CPFont","CPFont","CPFontTraitMask"]), new objj_method(sel_getUid("convertFont:toFace:"), function $CPFontManager__convertFont_toFace_(self, _cmd, aFont, aTypeface)
{
    if (!aFont)
        return nil;
    var shouldBeBold = objj_msgSend(aFont, "isBold"),
        shouldBeItalic = objj_msgSend(aFont, "isItalic"),
        shouldBeSize = objj_msgSend(aFont, "size");
    aFont = objj_msgSend(CPFont, "_fontWithName:size:bold:italic:", aTypeface, shouldBeSize, shouldBeBold, shouldBeItalic) || aFont;
    return aFont;
}
,["CPFont","CPFont","CPString"]), new objj_method(sel_getUid("addFontTrait:"), function $CPFontManager__addFontTrait_(self, _cmd, sender)
{
    var tag = objj_msgSend(sender, "tag");
    self._activeChange = tag === nil ? objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init") : objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", tag, "addTraits");
    objj_msgSend(self, "sendAction");
}
,["id","id"]), new objj_method(sel_getUid("sendAction"), function $CPFontManager__sendAction(self, _cmd)
{
    return objj_msgSend(CPApp, "sendAction:to:from:", self._action, self._target, self);
}
,["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedFontManager"), function $CPFontManager__sharedFontManager(self, _cmd)
{
    if (!CPSharedFontManager)
        CPSharedFontManager = objj_msgSend(objj_msgSend(CPFontManagerFactory, "alloc"), "init");
    return CPSharedFontManager;
}
,["CPFontManager"]), new objj_method(sel_getUid("setFontManagerFactory:"), function $CPFontManager__setFontManagerFactory_(self, _cmd, aClass)
{
    CPFontManagerFactory = aClass;
}
,["void","Class"])]);
}var _CPFontDetectSpan,
    _CPFontDetectReferenceFonts,
    _CPFontDetectAllFonts = ["American Typewriter", "Apple Chancery", "Arial", "Arial Black", "Arial Narrow", "Arial Rounded MT Bold", "Arial Unicode MS", "Big Caslon", "Bitstream Vera Sans", "Bitstream Vera Sans Mono", "Bitstream Vera Serif", "Brush Script MT", "Cambria", "Caslon", "Castellar", "Cataneo BT", "Centaur", "Century Gothic", "Century Schoolbook", "Century Schoolbook L", "Comic Sans", "Comic Sans MS", "Consolas", "Constantia", "Cooper Black", "Copperplate", "Copperplate Gothic Bold", "Copperplate Gothic Light", "Corbel", "Courier", "Courier New", "Futura", "Geneva", "Georgia", "Georgia Ref", "Geeza Pro", "Gigi", "Gill Sans", "Gill Sans MT", "Gill Sans MT Condensed", "Gill Sans MT Ext Condensed Bold", "Gill Sans Ultra Bold", "Gill Sans Ultra Bold Condensed", "Helvetica", "Helvetica Narrow", "Helvetica Neue", "Herculanum", "High Tower Text", "Highlight LET", "Hoefler Text", "Impact", "Imprint MT Shadow", "Lucida", "Lucida Bright", "Lucida Calligraphy", "Lucida Console", "Lucida Fax", "Lucida Grande", "Lucida Handwriting", "Lucida Sans", "Lucida Sans Typewriter", "Lucida Sans Unicode", "Marker Felt", "Microsoft Sans Serif", "Milano LET", "Minion Web", "MisterEarl BT", "Mistral", "Monaco", "Monotype Corsiva", "Monotype.com", "New Century Schoolbook", "New York", "News Gothic MT", "Papyrus", "Tahoma", "Techno", "Tempus Sans ITC", "Terminal", "Textile", "Times", "Times New Roman", "Tiranti Solid LET", "Trebuchet MS", "Verdana", "Verdana Ref", "Zapfino"];
var _CPFontDetectFontAvailable = function(font)
{
    for (var i = 0; i < _CPFontDetectReferenceFonts.length; i++)
        if (_CPFontDetectCompareFonts(_CPFontDetectReferenceFonts[i], font))
            return true;
    return false;
};
var _CPFontDetectCache = {};
var _CPFontDetectCompareFonts = function(fontA, fontB)
{
    var a;
    if (_CPFontDetectCache[fontA])
        a = _CPFontDetectCache[fontA];
    else
    {
        _CPFontDetectSpan.style.fontFamily = '"' + fontA + '"';
        _CPFontDetectCache[fontA] = a = {w: _CPFontDetectSpan.offsetWidth, h: _CPFontDetectSpan.offsetHeight};
    }
    _CPFontDetectSpan.style.fontFamily = '"' + fontB + '", "' + fontA + '"';
    var bWidth = _CPFontDetectSpan.offsetWidth,
        bHeight = _CPFontDetectSpan.offsetHeight;
    return a.w != bWidth || a.h != bHeight;
};
var _CPFontDetectPickTwoDifferentFonts = function(candidates)
{
    for (var i = 0; i < candidates.length; i++)
        for (var j = 0; j < i; j++)
            if (_CPFontDetectCompareFonts(candidates[i], candidates[j]))
                return [candidates[i], candidates[j]];
    return [candidates[0]];
};
objj_msgSend(CPFontManager, "setFontManagerFactory:", objj_msgSend(CPFontManager, "class"));
