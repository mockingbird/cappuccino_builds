@STATIC;1.0;I;19;Foundation/CPData.jI;16;AppKit/CPColor.jt;3974;objj_executeFile("Foundation/CPData.j", NO);objj_executeFile("AppKit/CPColor.j", NO);var NSUnknownColorSpaceModel = -1,
    NSGrayColorSpaceModel = 0,
    NSRGBColorSpaceModel = 1,
    NSCMYKColorSpaceModel = 2,
    NSLABColorSpaceModel = 3,
    NSDeviceNColorSpaceModel = 4,
    NSIndexedColorSpaceModel = 5,
    NSPatternColorSpaceModel = 6;
{
var the_class = objj_getClass("CPColor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPColor__NS_initWithCoder_(self, _cmd, aCoder)
{
    var colorSpace = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSColorSpace")),
        result;
    switch(colorSpace) {
    case 1:
    case 2:
        var rgb = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBytesForKey:", "NSRGB")),
            string = CFData.bytesToString(rgb),
            components = (string == null ? null : string.isa.objj_msgSend1(string, "componentsSeparatedByString:", " ")),
            values = [0, 0, 0, 1];
        for (var i = 0; i < components.length && i < 4; i++)
            values[i] = ((___r1 = components[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue"));
        result = CPColor.isa.objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", values[0], values[1], values[2], values[3]);
        break;
    case 3:
    case 4:
        var bytes = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBytesForKey:", "NSWhite")),
            string = CFData.bytesToString(bytes),
            components = (string == null ? null : string.isa.objj_msgSend1(string, "componentsSeparatedByString:", " ")),
            values = [0, 1];
        for (var i = 0; i < components.length && i < 2; i++)
            values[i] = ((___r1 = components[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue"));
        result = CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", values[0], values[1]);
        break;
    case 6:
        var catalogName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCatalogName")),
            colorName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSColorName")),
            color = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSColor")),
            result = nil;
        if (catalogName === "System")
        {
            switch(colorName) {
            case "controlColor":
                result = CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 175.0 / 255.0, 1.0);
                break;
            case "controlBackgroundColor":
                result = CPColor.isa.objj_msgSend0(CPColor, "whiteColor");
                break;
            case "gridColor":
                result = CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 204.0 / 255.0, 1.0);
                break;
default:
                result = color;
            }
        }
        else
            result = color;
        break;
default:
        CPLog.warn("-[%@ %s] unknown color space %d", self.isa, _cmd, colorSpace);
        result = CPColor.isa.objj_msgSend0(CPColor, "blackColor");
        break;
    }
    return result;
    var ___r1;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPColor, "NSColor"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSColor__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSColor__classForKeyedArchiver(self, _cmd)
{
    return CPColor.isa.objj_msgSend0(CPColor, "class");
}
,["Class"])]);
}