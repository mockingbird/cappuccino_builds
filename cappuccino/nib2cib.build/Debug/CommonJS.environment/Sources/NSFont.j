@STATIC;1.0;I;15;AppKit/CPFont.jt;3759;objj_executeFile("AppKit/CPFont.j", NO);IBDefaultFontFace = "Lucida Grande";
IBDefaultFontSize = 13.0;
var OS = require("os"),
    fontinfo = (require("cappuccino/fontinfo")).fontinfo;
{
var the_class = objj_getClass("CPFont")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPFont\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPFont__NS_initWithCoder_(self, _cmd, aCoder)
{
    var name = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSName")),
        size = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", "NSSize")),
        isBold = false,
        isItalic = false,
        info = fontinfo(name, size);
    if (info)
    {
        name = info.familyName;
        isBold = info.bold;
        isItalic = info.italic;
    }
    var font = self.isa.objj_msgSend(self, "_initWithName:size:bold:italic:system:", name, size, isBold, isItalic, NO);
    CPLog.debug("NSFont: %s", (NSFont == null ? null : NSFont.isa.objj_msgSend1(NSFont, "descriptorForFont:", font)));
    return font;
}
,["id","CPCoder"]), new objj_method(sel_getUid("cibFontForNibFont"), function $CPFont__cibFontForNibFont(self, _cmd)
{
    if (self._name === IBDefaultFontFace)
    {
        if (self._size === IBDefaultFontSize && !self._isBold && !self._isItalic)
            return nil;
        else
            return ((___r1 = CPFont.isa.objj_msgSend0(CPFont, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "_initWithName:size:bold:italic:system:", _CPFontSystemFacePlaceholder, self._size == IBDefaultFontSize ? CPFontCurrentSystemSize : self._size, self._isBold, self._isItalic, YES));
    }
    return self;
    var ___r1;
}
,["id"])]);
}{var the_class = objj_allocateClassPair(CPFont, "NSFont"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSFont__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSFont__classForKeyedArchiver(self, _cmd)
{
    return CPFont.isa.objj_msgSend0(CPFont, "class");
}
,["Class"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $NSFont__initialize(self, _cmd)
{
    if (self !== NSFont.isa.objj_msgSend0(NSFont, "class"))
        return;
    CPLog.debug("NSFont: default IB font: %s %f", IBDefaultFontFace, IBDefaultFontSize);
}
,["void"]), new objj_method(sel_getUid("descriptorForFont:"), function $NSFont__descriptorForFont_(self, _cmd, aFont)
{
    var styleAttributes = [];
    if ((aFont == null ? null : aFont.isa.objj_msgSend0(aFont, "isBold")))
        styleAttributes.push("bold");
    if ((aFont == null ? null : aFont.isa.objj_msgSend0(aFont, "isItalic")))
        styleAttributes.push("italic");
    styleAttributes = styleAttributes.join(" ");
    var systemAttributes = [];
    if ((aFont == null ? null : aFont.isa.objj_msgSend0(aFont, "isSystem")))
    {
        systemAttributes.push("system face");
        if ((aFont == null ? null : aFont.isa.objj_msgSend0(aFont, "size")) === IBDefaultFontSize)
            systemAttributes.push("system size");
    }
    systemAttributes = systemAttributes.join(", ");
    return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "%s%s %d%s", (aFont == null ? null : aFont.isa.objj_msgSend0(aFont, "familyName")), styleAttributes ? " " + styleAttributes : "", (aFont == null ? null : aFont.isa.objj_msgSend0(aFont, "size")), systemAttributes ? " (" + systemAttributes + ")" : "");
}
,["CPString","CPFont"])]);
}