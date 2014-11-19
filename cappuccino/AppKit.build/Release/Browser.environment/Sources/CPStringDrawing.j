@STATIC;1.0;I;21;Foundation/CPString.ji;12;CGGeometry.ji;18;CPPlatformString.jt;1725;objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPPlatformString.j", YES);var CPStringSizeWithFontInWidthCache = {};
CPStringSizeCachingEnabled = YES;
{
var the_class = objj_getClass("CPString")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPString\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("cssString"), function $CPString__cssString(self, _cmd)
{
    return self;
}
,["CPString"]), new objj_method(sel_getUid("sizeWithFont:"), function $CPString__sizeWithFont_(self, _cmd, aFont)
{
    return self.isa.objj_msgSend2(self, "sizeWithFont:inWidth:", aFont, NULL);
}
,["CGSize","CPFont"]), new objj_method(sel_getUid("sizeWithFont:inWidth:"), function $CPString__sizeWithFont_inWidth_(self, _cmd, aFont, aWidth)
{
    if (!CPStringSizeCachingEnabled)
        return CPPlatformString.isa.objj_msgSend3(CPPlatformString, "sizeOfString:withFont:forWidth:", self, aFont, aWidth);
    var cacheKey = self + (aFont == null ? null : aFont.isa.objj_msgSend0(aFont, "cssString")) + aWidth,
        size = CPStringSizeWithFontInWidthCache[cacheKey];
    if (size === undefined)
    {
        size = CPPlatformString.isa.objj_msgSend3(CPPlatformString, "sizeOfString:withFont:forWidth:", self, aFont, aWidth);
        CPStringSizeWithFontInWidthCache[cacheKey] = size;
    }
    return CGSizeMakeCopy(size);
}
,["CGSize","CPFont","float"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("metricsOfFont:"), function $CPString__metricsOfFont_(self, _cmd, aFont)
{
    return CPPlatformString.isa.objj_msgSend1(CPPlatformString, "metricsOfFont:", aFont);
}
,["CPDictionary","CPFont"])]);
}