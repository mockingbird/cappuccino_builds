@STATIC;1.0;I;15;AppKit/CPFont.jt;3294;objj_executeFile("AppKit/CPFont.j", NO);IBDefaultFontFace = "Lucida Grande";
IBDefaultFontSize = 13.0;
var OS = require("os"),
    fontinfo = (require("cappuccino/fontinfo")).fontinfo;
{
var the_class = objj_getClass("CPFont")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPFont\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPFont__NS_initWithCoder_(self, _cmd, aCoder)
{
    var name = objj_msgSend(aCoder, "decodeObjectForKey:", "NSName"),
        size = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSSize"),
        isBold = false,
        isItalic = false,
        info = fontinfo(name, size);
    if (info)
    {
        name = info.familyName;
        isBold = info.bold;
        isItalic = info.italic;
    }
    var font = objj_msgSend(self, "_initWithName:size:bold:italic:system:", name, size, isBold, isItalic, NO);
    CPLog.debug("NSFont: %s", objj_msgSend(NSFont, "descriptorForFont:", font));
    return font;
}
,["id","CPCoder"]), new objj_method(sel_getUid("cibFontForNibFont"), function $CPFont__cibFontForNibFont(self, _cmd)
{
    if (self._name === IBDefaultFontFace)
    {
        if (self._size === IBDefaultFontSize && !self._isBold && !self._isItalic)
            return nil;
        else
            return objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:italic:system:", _CPFontSystemFacePlaceholder, self._size == IBDefaultFontSize ? CPFontCurrentSystemSize : self._size, self._isBold, self._isItalic, YES);
    }
    return self;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPFont, "NSFont"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSFont__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSFont__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPFont, "class");
}
,["Class"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $NSFont__initialize(self, _cmd)
{
    if (self !== objj_msgSend(NSFont, "class"))
        return;
    CPLog.debug("NSFont: default IB font: %s %f", IBDefaultFontFace, IBDefaultFontSize);
}
,["void"]), new objj_method(sel_getUid("descriptorForFont:"), function $NSFont__descriptorForFont_(self, _cmd, aFont)
{
    var styleAttributes = [];
    if (objj_msgSend(aFont, "isBold"))
        styleAttributes.push("bold");
    if (objj_msgSend(aFont, "isItalic"))
        styleAttributes.push("italic");
    styleAttributes = styleAttributes.join(" ");
    var systemAttributes = [];
    if (objj_msgSend(aFont, "isSystem"))
    {
        systemAttributes.push("system face");
        if (objj_msgSend(aFont, "size") === IBDefaultFontSize)
            systemAttributes.push("system size");
    }
    systemAttributes = systemAttributes.join(", ");
    return objj_msgSend(CPString, "stringWithFormat:", "%s%s %d%s", objj_msgSend(aFont, "familyName"), styleAttributes ? " " + styleAttributes : "", objj_msgSend(aFont, "size"), systemAttributes ? " (" + systemAttributes + ")" : "");
}
,["CPString","CPFont"])]);
}