@STATIC;1.0;I;21;Foundation/CPObject.ji;19;CPGraphicsContext.ji;9;CGColor.ji;17;CPCompatibility.ji;9;CPImage.jt;32173;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPGraphicsContext.j", YES);objj_executeFile("CGColor.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPImage.j", YES);CPColorPatternIsVertical = YES;
CPColorPatternIsHorizontal = NO;
var _redComponent = 0,
    _greenComponent = 1,
    _blueComponent = 2,
    _alphaCompnent = 3;
var _hueComponent = 0,
    _saturationComponent = 1,
    _brightnessComponent = 2;
var cachedBlackColor,
    cachedRedColor,
    cachedGreenColor,
    cachedBlueColor,
    cachedYellowColor,
    cachedGrayColor,
    cachedLightGrayColor,
    cachedDarkGrayColor,
    cachedWhiteColor,
    cachedBrownColor,
    cachedCyanColor,
    cachedMagentaColor,
    cachedOrangeColor,
    cachedPurpleColor,
    cachedShadowColor,
    cachedClearColor;
{var the_class = objj_allocateClassPair(CPObject, "CPColor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_components"), new objj_ivar("_patternImage"), new objj_ivar("_cssString")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithCSSString:"), function $CPColor___initWithCSSString_(self, _cmd, aString)
{
    if (aString.indexOf("rgb") == CPNotFound)
        return nil;
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColor").super_class }, "init");
    var startingIndex = aString.indexOf("("),
        parts = (aString.substring(startingIndex + 1)).split(',');
    self._components = [parseInt(parts[0], 10) / 255.0, parseInt(parts[1], 10) / 255.0, parseInt(parts[2], 10) / 255.0, parts[3] ? parseFloat(parts[3], 10) : 1.0];
    objj_msgSend(self, "_initCSSStringFromComponents");
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("_initWithRGBA:"), function $CPColor___initWithRGBA_(self, _cmd, components)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColor").super_class }, "init");
    if (self)
    {
        self._components = components;
        objj_msgSend(self, "_initCSSStringFromComponents");
    }
    return self;
}
,["id","CPArray"]), new objj_method(sel_getUid("_initCSSStringFromComponents"), function $CPColor___initCSSStringFromComponents(self, _cmd)
{
    var hasAlpha = CPFeatureIsCompatible(CPCSSRGBAFeature) && self._components[3] != 1.0;
    self._cssString = (hasAlpha ? "rgba(" : "rgb(") + parseInt(self._components[0] * 255.0) + ", " + parseInt(self._components[1] * 255.0) + ", " + parseInt(self._components[2] * 255.0) + (hasAlpha ? ", " + self._components[3] : "") + ")";
}
,["void"]), new objj_method(sel_getUid("_initWithPatternImage:"), function $CPColor___initWithPatternImage_(self, _cmd, anImage)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColor").super_class }, "init");
    if (self)
    {
        self._patternImage = anImage;
        self._cssString = "url(\"" + objj_msgSend(self._patternImage, "filename") + "\")";
        self._components = [0.0, 0.0, 0.0, 1.0];
    }
    return self;
}
,["id","CPImage"]), new objj_method(sel_getUid("patternImage"), function $CPColor__patternImage(self, _cmd)
{
    return self._patternImage;
}
,["CPImage"]), new objj_method(sel_getUid("alphaComponent"), function $CPColor__alphaComponent(self, _cmd)
{
    return self._components[3];
}
,["float"]), new objj_method(sel_getUid("blueComponent"), function $CPColor__blueComponent(self, _cmd)
{
    return self._components[2];
}
,["float"]), new objj_method(sel_getUid("greenComponent"), function $CPColor__greenComponent(self, _cmd)
{
    return self._components[1];
}
,["float"]), new objj_method(sel_getUid("redComponent"), function $CPColor__redComponent(self, _cmd)
{
    return self._components[0];
}
,["float"]), new objj_method(sel_getUid("components"), function $CPColor__components(self, _cmd)
{
    return self._components;
}
,["CPArray"]), new objj_method(sel_getUid("colorWithAlphaComponent:"), function $CPColor__colorWithAlphaComponent_(self, _cmd, anAlphaComponent)
{
    var components = self._components.slice();
    components[components.length - 1] = anAlphaComponent;
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "_initWithRGBA:", components);
}
,["CPColor","float"]), new objj_method(sel_getUid("colorUsingColorSpaceName:"), function $CPColor__colorUsingColorSpaceName_(self, _cmd, aColorSpaceName)
{
    return self;
}
,["CPColor","id"]), new objj_method(sel_getUid("hsbComponents"), function $CPColor__hsbComponents(self, _cmd)
{
    var red = ROUND(self._components[_redComponent] * 255.0),
        green = ROUND(self._components[_greenComponent] * 255.0),
        blue = ROUND(self._components[_blueComponent] * 255.0);
    var max = MAX(red, green, blue),
        min = MIN(red, green, blue),
        delta = max - min;
    var brightness = max / 255.0,
        saturation = max != 0 ? delta / max : 0;
    var hue;
    if (saturation == 0)
    {
        hue = 0;
    }
    else
    {
        var rr = (max - red) / delta,
            gr = (max - green) / delta,
            br = (max - blue) / delta;
        if (red == max)
            hue = br - gr;
        else if (green == max)
            hue = 2 + rr - br;
        else
            hue = 4 + gr - rr;
        hue /= 6;
        if (hue < 0)
            hue++;
    }
    return [hue, saturation, brightness];
}
,["CPArray"]), new objj_method(sel_getUid("hueComponent"), function $CPColor__hueComponent(self, _cmd)
{
    return objj_msgSend(self, "hsbComponents")[0];
}
,["float"]), new objj_method(sel_getUid("saturationComponent"), function $CPColor__saturationComponent(self, _cmd)
{
    return objj_msgSend(self, "hsbComponents")[1];
}
,["float"]), new objj_method(sel_getUid("brightnessComponent"), function $CPColor__brightnessComponent(self, _cmd)
{
    return objj_msgSend(self, "hsbComponents")[2];
}
,["float"]), new objj_method(sel_getUid("cssString"), function $CPColor__cssString(self, _cmd)
{
    return self._cssString;
}
,["CPString"]), new objj_method(sel_getUid("hexString"), function $CPColor__hexString(self, _cmd)
{
    return rgbToHex(objj_msgSend(self, "redComponent"), objj_msgSend(self, "greenComponent"), objj_msgSend(self, "blueComponent"));
}
,["CPString"]), new objj_method(sel_getUid("isEqual:"), function $CPColor__isEqual_(self, _cmd, aColor)
{
    if (!aColor)
        return NO;
    if (aColor === self)
        return YES;
    if (!objj_msgSend(aColor, "isKindOfClass:", CPColor))
        return NO;
    if (self._patternImage || objj_msgSend(aColor, "patternImage"))
        return objj_msgSend(self._patternImage, "isEqual:", objj_msgSend(aColor, "patternImage"));
    return ROUND(objj_msgSend(self, "redComponent") * 255.0) == ROUND(objj_msgSend(aColor, "redComponent") * 255.0) && ROUND(objj_msgSend(self, "greenComponent") * 255.0) == ROUND(objj_msgSend(aColor, "greenComponent") * 255.0) && ROUND(objj_msgSend(self, "blueComponent") * 255.0) == ROUND(objj_msgSend(aColor, "blueComponent") * 255.0) && objj_msgSend(self, "alphaComponent") == objj_msgSend(aColor, "alphaComponent");
}
,["BOOL","CPColor"]), new objj_method(sel_getUid("description"), function $CPColor__description(self, _cmd)
{
    var description = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColor").super_class }, "description"),
        patternImage = objj_msgSend(self, "patternImage");
    if (!patternImage)
        return description + " " + objj_msgSend(self, "cssString");
    description += " {\n";
    if (objj_msgSend(patternImage, "isThreePartImage") || objj_msgSend(patternImage, "isNinePartImage"))
    {
        var slices = objj_msgSend(patternImage, "imageSlices");
        if (objj_msgSend(patternImage, "isThreePartImage"))
            description += "    orientation: " + (objj_msgSend(patternImage, "isVertical") ? "vertical" : "horizontal") + ",\n";
        description += "    patternImage (" + slices.length + " part): [\n";
        for (var i = 0; i < slices.length; ++i)
        {
            var imgDescription = objj_msgSend(slices[i], "description") || "nil";
            description += imgDescription.replace(/^/mg, "        ") + ",\n";
        }
        description = description.substr(0, description.length - 2) + "\n    ]\n}";
    }
    else
        description += (objj_msgSend(patternImage, "description") || "nil").replace(/^/mg, "    ") + "\n}";
    return description;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("colorWithRed:green:blue:alpha:"), function $CPColor__colorWithRed_green_blue_alpha_(self, _cmd, red, green, blue, alpha)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [MAX(0.0, MIN(1.0, red)), MAX(0.0, MIN(1.0, green)), MAX(0.0, MIN(1.0, blue)), MAX(0.0, MIN(1.0, alpha))]);
}
,["CPColor","float","float","float","float"]), new objj_method(sel_getUid("colorWithCalibratedRed:green:blue:alpha:"), function $CPColor__colorWithCalibratedRed_green_blue_alpha_(self, _cmd, red, green, blue, alpha)
{
    return objj_msgSend(self, "colorWithRed:green:blue:alpha:", red, green, blue, alpha);
}
,["CPColor","float","float","float","float"]), new objj_method(sel_getUid("colorWithWhite:alpha:"), function $CPColor__colorWithWhite_alpha_(self, _cmd, white, alpha)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [white, white, white, alpha]);
}
,["CPColor","float","float"]), new objj_method(sel_getUid("colorWithCalibratedWhite:alpha:"), function $CPColor__colorWithCalibratedWhite_alpha_(self, _cmd, white, alpha)
{
    return objj_msgSend(self, "colorWithWhite:alpha:", white, alpha);
}
,["CPColor","float","float"]), new objj_method(sel_getUid("colorWithHue:saturation:brightness:"), function $CPColor__colorWithHue_saturation_brightness_(self, _cmd, hue, saturation, brightness)
{
    return objj_msgSend(self, "colorWithHue:saturation:brightness:alpha:", hue, saturation, brightness, 1.0);
}
,["CPColor","float","float","float"]), new objj_method(sel_getUid("colorWithCalibratedHue:saturation:brightness:alpha:"), function $CPColor__colorWithCalibratedHue_saturation_brightness_alpha_(self, _cmd, hue, saturation, brightness, alpha)
{
    return objj_msgSend(self, "colorWithHue:saturation:brightness:alpha:", hue, saturation, brightness, alpha);
}
,["CPColor","float","float","float","float"]), new objj_method(sel_getUid("colorWithHue:saturation:brightness:alpha:"), function $CPColor__colorWithHue_saturation_brightness_alpha_(self, _cmd, hue, saturation, brightness, alpha)
{
    hue = MAX(MIN(hue, 1.0), 0.0);
    saturation = MAX(MIN(saturation, 1.0), 0.0);
    brightness = MAX(MIN(brightness, 1.0), 0.0);
    if (saturation === 0.0)
        return objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", brightness, alpha);
    var f = hue * 360 % 60,
        p = brightness * (1 - saturation),
        q = brightness * (60 - saturation * f) / 60,
        t = brightness * (60 - saturation * (60 - f)) / 60,
        b = brightness;
    switch(FLOOR(hue * 6)) {
    case 0:
    case 6:
        return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", b, t, p, alpha);
    case 1:
        return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", q, b, p, alpha);
    case 2:
        return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", p, b, t, alpha);
    case 3:
        return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", p, q, b, alpha);
    case 4:
        return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", t, p, b, alpha);
    case 5:
        return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", b, p, q, alpha);
    }
}
,["CPColor","float","float","float","float"]), new objj_method(sel_getUid("colorWithHexString:"), function $CPColor__colorWithHexString_(self, _cmd, hex)
{
    var rgba = hexToRGB(hex);
    return rgba ? objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", rgba) : null;
}
,["CPColor","string"]), new objj_method(sel_getUid("colorWithSRGBRed:green:blue:alpha:"), function $CPColor__colorWithSRGBRed_green_blue_alpha_(self, _cmd, red, green, blue, alpha)
{
    return objj_msgSend(self, "colorWithRed:green:blue:alpha:", red, green, blue, alpha);
}
,["CPColor","float","float","float","float"]), new objj_method(sel_getUid("blackColor"), function $CPColor__blackColor(self, _cmd)
{
    if (!cachedBlackColor)
        cachedBlackColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 0.0, 0.0, 1.0]);
    return cachedBlackColor;
}
,["CPColor"]), new objj_method(sel_getUid("blueColor"), function $CPColor__blueColor(self, _cmd)
{
    if (!cachedBlueColor)
        cachedBlueColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 0.0, 1.0, 1.0]);
    return cachedBlueColor;
}
,["CPColor"]), new objj_method(sel_getUid("darkGrayColor"), function $CPColor__darkGrayColor(self, _cmd)
{
    if (!cachedDarkGrayColor)
        cachedDarkGrayColor = objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 1.0 / 3.0, 1.0);
    return cachedDarkGrayColor;
}
,["CPColor"]), new objj_method(sel_getUid("grayColor"), function $CPColor__grayColor(self, _cmd)
{
    if (!cachedGrayColor)
        cachedGrayColor = objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.5, 1.0);
    return cachedGrayColor;
}
,["CPColor"]), new objj_method(sel_getUid("greenColor"), function $CPColor__greenColor(self, _cmd)
{
    if (!cachedGreenColor)
        cachedGreenColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 1.0, 0.0, 1.0]);
    return cachedGreenColor;
}
,["CPColor"]), new objj_method(sel_getUid("lightGrayColor"), function $CPColor__lightGrayColor(self, _cmd)
{
    if (!cachedLightGrayColor)
        cachedLightGrayColor = objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 2.0 / 3.0, 1.0);
    return cachedLightGrayColor;
}
,["CPColor"]), new objj_method(sel_getUid("redColor"), function $CPColor__redColor(self, _cmd)
{
    if (!cachedRedColor)
        cachedRedColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 0.0, 0.0, 1.0]);
    return cachedRedColor;
}
,["CPColor"]), new objj_method(sel_getUid("whiteColor"), function $CPColor__whiteColor(self, _cmd)
{
    if (!cachedWhiteColor)
        cachedWhiteColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 1.0, 1.0, 1.0]);
    return cachedWhiteColor;
}
,["CPColor"]), new objj_method(sel_getUid("yellowColor"), function $CPColor__yellowColor(self, _cmd)
{
    if (!cachedYellowColor)
        cachedYellowColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 1.0, 0.0, 1.0]);
    return cachedYellowColor;
}
,["CPColor"]), new objj_method(sel_getUid("brownColor"), function $CPColor__brownColor(self, _cmd)
{
    if (!cachedBrownColor)
        cachedBrownColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.6, 0.4, 0.2, 1.0]);
    return cachedBrownColor;
}
,["CPColor"]), new objj_method(sel_getUid("cyanColor"), function $CPColor__cyanColor(self, _cmd)
{
    if (!cachedCyanColor)
        cachedCyanColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 1.0, 1.0, 1.0]);
    return cachedCyanColor;
}
,["CPColor"]), new objj_method(sel_getUid("magentaColor"), function $CPColor__magentaColor(self, _cmd)
{
    if (!cachedMagentaColor)
        cachedMagentaColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 0.0, 1.0, 1.0]);
    return cachedMagentaColor;
}
,["CPColor"]), new objj_method(sel_getUid("orangeColor"), function $CPColor__orangeColor(self, _cmd)
{
    if (!cachedOrangeColor)
        cachedOrangeColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 0.5, 0.0, 1.0]);
    return cachedOrangeColor;
}
,["CPColor"]), new objj_method(sel_getUid("purpleColor"), function $CPColor__purpleColor(self, _cmd)
{
    if (!cachedPurpleColor)
        cachedPurpleColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.5, 0.0, 0.5, 1.0]);
    return cachedPurpleColor;
}
,["CPColor"]), new objj_method(sel_getUid("shadowColor"), function $CPColor__shadowColor(self, _cmd)
{
    if (!cachedShadowColor)
        cachedShadowColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 0.0, 0.0, 1.0 / 3.0]);
    return cachedShadowColor;
}
,["CPColor"]), new objj_method(sel_getUid("clearColor"), function $CPColor__clearColor(self, _cmd)
{
    if (!cachedClearColor)
        cachedClearColor = objj_msgSend(self, "colorWithCalibratedWhite:alpha:", 0.0, 0.0);
    return cachedClearColor;
}
,["CPColor"]), new objj_method(sel_getUid("alternateSelectedControlColor"), function $CPColor__alternateSelectedControlColor(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.22, 0.46, 0.84, 1.0]);
}
,["CPColor"]), new objj_method(sel_getUid("secondarySelectedControlColor"), function $CPColor__secondarySelectedControlColor(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.83, 0.83, 0.83, 1.0]);
}
,["CPColor"]), new objj_method(sel_getUid("colorWithPatternImage:"), function $CPColor__colorWithPatternImage_(self, _cmd, anImage)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithPatternImage:", anImage);
}
,["CPColor","CPImage"]), new objj_method(sel_getUid("colorWithCSSString:"), function $CPColor__colorWithCSSString_(self, _cmd, aString)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithCSSString:", aString);
}
,["CPColor","CPString"])]);
}{
var the_class = objj_getClass("CPColor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("set"), function $CPColor__set(self, _cmd)
{
    objj_msgSend(self, "setFill");
    objj_msgSend(self, "setStroke");
}
,["void"]), new objj_method(sel_getUid("setFill"), function $CPColor__setFill(self, _cmd)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetFillColor(ctx, self);
}
,["void"]), new objj_method(sel_getUid("setStroke"), function $CPColor__setStroke(self, _cmd)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetStrokeColor(ctx, self);
}
,["void"])]);
}{
var the_class = objj_getClass("CPColor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("randomColor"), function $CPColor__randomColor(self, _cmd)
{
    return objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", RAND(), RAND(), RAND(), 1.0);
}
,["CPColor"]), new objj_method(sel_getUid("checkerBoardColor"), function $CPColor__checkerBoardColor(self, _cmd)
{
    return objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQAQMAAAAlPW0iAAAABlBMVEX////MzMw46qqDAAAAEElEQVQImWNg+M+AFeEQBgB+vw/xfUUZkgAAAABJRU5ErkJggg=="));
}
,["CPColor"])]);
}var CPColorComponentsKey = "CPColorComponentsKey",
    CPColorPatternImageKey = "CPColorPatternImageKey";
{
var the_class = objj_getClass("CPColor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPColor__initWithCoder_(self, _cmd, aCoder)
{
    if (objj_msgSend(aCoder, "containsValueForKey:", CPColorPatternImageKey))
        return objj_msgSend(self, "_initWithPatternImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPColorPatternImageKey));
    return objj_msgSend(self, "_initWithRGBA:", objj_msgSend(aCoder, "decodeObjectForKey:", CPColorComponentsKey));
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPColor__encodeWithCoder_(self, _cmd, aCoder)
{
    if (self._patternImage)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._patternImage, CPColorPatternImageKey);
    else
        objj_msgSend(aCoder, "encodeObject:forKey:", self._components, CPColorComponentsKey);
}
,["void","CPCoder"])]);
}var hexCharacters = "0123456789ABCDEF";
var hexToRGB = function(hex)
{
    if (hex.length == 3)
        hex = hex.charAt(0) + hex.charAt(0) + hex.charAt(1) + hex.charAt(1) + hex.charAt(2) + hex.charAt(2);
    if (hex.length != 6)
        return null;
    hex = hex.toUpperCase();
    for (var i = 0; i < hex.length; i++)
        if (hexCharacters.indexOf(hex.charAt(i)) == -1)
            return null;
    var red = (hexCharacters.indexOf(hex.charAt(0)) * 16 + hexCharacters.indexOf(hex.charAt(1))) / 255.0,
        green = (hexCharacters.indexOf(hex.charAt(2)) * 16 + hexCharacters.indexOf(hex.charAt(3))) / 255.0,
        blue = (hexCharacters.indexOf(hex.charAt(4)) * 16 + hexCharacters.indexOf(hex.charAt(5))) / 255.0;
    return [red, green, blue, 1.0];
};
var rgbToHex = function(r, g, b)
{
    return byteToHex(r) + byteToHex(g) + byteToHex(b);
};
var byteToHex = function(n)
{
    if (!n || isNaN(n))
        return "00";
    n = FLOOR(MIN(255, MAX(0, 256 * n)));
    return hexCharacters.charAt((n - n % 16) / 16) + hexCharacters.charAt(n % 16);
};
CPColorWithImages = function()
{
    var slices = nil,
        numParts = 0,
        isVertical = false,
        imageFactory = CPImageInBundle,
        args = Array.prototype.slice.apply(arguments);
    if (typeof args[args.length - 1] === "function")
        imageFactory = args.pop();
    switch(args.length) {
    case 1:
        return imageFromSlices(args[0], isVertical, imageFactory);
    case 2:
        if (typeof args[0] === "string")
            return patternColorsFromPattern.call(this, args[0], args[1], imageFactory);
        return imageFromSlices(args[0], args[1], imageFactory);
    case 3:
    case 4:
        return objj_msgSend(CPColor, "colorWithPatternImage:", imageFactory(args[0], args[1], args[2], args[3]));
default:
        throw "ERROR: Invalid argument count: " + args.length;
    }
}
var imageFromSlices = function(slices, isVertical, imageFactory)
{
    var imageSlices = [];
    for (var i = 0; i < slices.length; ++i)
    {
        var slice = slices[i];
        imageSlices.push(slice ? imageFactory(slice[0], slice[1], slice[2], slice[3]) : nil);
    }
    switch(slices.length) {
    case 3:
        return objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", imageSlices, isVertical));
    case 9:
        return objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", imageSlices));
default:
        throw "ERROR: Invalid number of image slices: " + slices.length;
    }
};
var patternColorsFromPattern = function(pattern, attributes, imageFactory)
{
    if (pattern.match(/^.*\{[^}]+\}/))
    {
        var width = attributes["width"],
            height = attributes["height"],
            separator = attributes["separator"] || "-",
            orientation = attributes["orientation"],
            rightWidth,
            bottomHeight,
            centerWidthHeight,
            centerIsNil,
            numParts;
        if (pattern.indexOf("{position}") < 0)
            throw "ERROR: Pattern strings must have a {position} placeholder (\"" + pattern + "\")";
        if (orientation === undefined)
        {
            numParts = 9;
            if (attributes["centerIsNil"] !== undefined)
                centerIsNil = attributes["centerIsNil"];
        }
        else
        {
            numParts = 3;
            isVertical = orientation === PatternIsVertical;
            if (isVertical)
            {
                if (attributes["centerHeight"])
                    centerWidthHeight = attributes["centerHeight"];
            }
            else
            {
                if (attributes["centerWidth"])
                    centerWidthHeight = attributes["centerWidth"];
            }
        }
        if (attributes["rightWidth"])
            rightWidth = attributes["rightWidth"];
        if (attributes["bottomHeight"])
            bottomHeight = attributes["bottomHeight"];
        var positions = attributes["positions"] || "@",
            states = nil,
            styles = nil;
        if (numParts === 3)
        {
            if (positions === "@")
            {
                if (isVertical)
                    positions = ["top", "center", "bottom"];
                else
                    positions = ["left", "center", "right"];
            }
            else if (positions === "#")
                positions = ["0", "1", "2"];
            else
                throw "ERROR: Invalid positions: " + positions;
        }
        else
        {
            if (positions === "@" || positions === "abbrev")
                positions = ["top-left", "top", "top-right", "left", "center", "right", "bottom-left", "bottom", "bottom-right"];
            else if (positions === "full")
                positions = ["top-left", "top-center", "top-right", "center-left", "center-center", "center-right", "bottom-left", "bottom-center", "bottom-right"];
            else if (positions === "#")
                positions = ["0", "1", "2", "3", "4", "5", "6", "7", "8"];
            else
                throw "ERROR: Invalid positions: " + positions;
        }
        if (pattern.indexOf("{state}") >= 0)
        {
            states = attributes["states"];
            if (!states)
                throw "ERROR: {state} placeholder in the pattern (\"" + pattern + "\") but no states item in the attributes";
        }
        if (pattern.indexOf("{style}") >= 0)
        {
            styles = attributes["styles"];
            if (!styles)
                throw "ERROR: {style} placeholder in the pattern (\"" + pattern + "\") but no styles item in the attributes";
        }
        var placeholder = "{position}",
            pos = pattern.indexOf(placeholder),
            i;
        for (i = 0; i < positions.length; ++i)
            positions[i] = pattern.replace(placeholder, pos === 0 ? positions[i] + separator : separator + positions[i]);
        var slices = positions,
            object = slices,
            key,
            sep;
        if (states)
        {
            placeholder = "{state}";
            pos = pattern.indexOf(placeholder);
            object = {};
            for (i = 0; i < states.length; ++i)
            {
                var state = states[i];
                key = state || "@";
                sep = state ? separator : "";
                object[key] = slices.slice(0);
                replacePlaceholderInArray(object[key], placeholder, pos === 0 ? state + sep : sep + state);
            }
        }
        if (styles)
        {
            placeholder = "{style}";
            pos = pattern.indexOf(placeholder);
            var styleObject = {};
            for (i = 0; i < styles.length; ++i)
            {
                var style = styles[i];
                key = style || "@";
                sep = style ? separator : "";
                if (states)
                {
                    styleObject[key] = cloneObject(object);
                    replacePlaceholderInObject(styleObject[key], placeholder, pos === 0 ? style + sep : sep + style);
                }
                else
                {
                    styleObject[key] = slices.slice(0);
                    replacePlaceholderInArray(styleObject[key], placeholder, pos === 0 ? style + sep : sep + style);
                }
            }
            object = styleObject;
        }
        if (styles || states)
        {
            if (numParts === 3)
                makeThreePartSlicesFromObject(object, width, height, centerWidthHeight, rightWidth, bottomHeight, isVertical);
            else
                makeNinePartSlicesFromObject(object, width, height, rightWidth, bottomHeight, centerIsNil);
            makeImagesFromObject(object, isVertical, imageFactory);
            return object;
        }
        else
        {
            if (numParts === 3)
                makeThreePartSlicesFromArray(object, width, height, centerWidthHeight, rightWidth, bottomHeight, isVertical);
            else
                makeNinePartSlicesFromArray(object, width, height, rightWidth, bottomHeight, centerIsNil);
            return imageFromSlices(object, isVertical, imageFactory);
        }
    }
    else
        throw "ERROR: No placeholders in slice pattern (\"" + pattern + "\")";
};
var replacePlaceholderInArray = function(array, find, replacement)
{
    for (var i = 0; i < array.length; ++i)
        array[i] = array[i].replace(find, replacement);
};
var replacePlaceholderInObject = function(object, find, replacement)
{
    for (var key in object)
        if (object.hasOwnProperty(key))
            if (object[key].constructor === Array)
                replacePlaceholderInArray(object[key], find, replacement);
            else
                replacePlaceholderInObject(object[key], find, replacement);
};
var cloneObject = function(object)
{
    var clone = {};
    for (var key in object)
        if (object.hasOwnProperty(key))
            if (object[key].constructor === Array)
                clone[key] = object[key].slice(0);
            else if (typeof object[key] === "object")
                clone[key] = cloneObject(object[key]);
            else
                clone[key] = object[key];
    return clone;
};
var makeThreePartSlicesFromObject = function(object, width, height, centerWidthHeight, rightWidth, bottomHeight, isVertical)
{
    for (var key in object)
        if (object.hasOwnProperty(key))
            if (object[key].constructor === Array)
                makeThreePartSlicesFromArray(object[key], width, height, centerWidthHeight, rightWidth, bottomHeight, isVertical);
            else
                makeThreePartSlicesFromObject(object[key], width, height, centerWidthHeight, rightWidth, bottomHeight, isVertical);
};
var makeThreePartSlicesFromArray = function(array, width, height, centerWidthHeight, rightWidth, bottomHeight, isVertical)
{
    array[0] = [array[0], width, height];
    if (isVertical)
    {
        array[1] = [array[1], width, centerWidthHeight ? centerWidthHeight : 1.0];
        array[2] = [array[2], width, bottomHeight ? bottomHeight : height];
    }
    else
    {
        array[1] = [array[1], centerWidthHeight ? centerWidthHeight : 1.0, height];
        array[2] = [array[2], rightWidth ? rightWidth : width, height];
    }
};
var makeNinePartSlicesFromObject = function(object, width, height, rightWidth, bottomHeight, centerIsNil)
{
    for (var key in object)
        if (object.hasOwnProperty(key))
            if (object[key].constructor === Array)
                makeNinePartSlicesFromArray(object[key], width, height, rightWidth, bottomHeight, centerIsNil);
            else
                makeNinePartSlicesFromObject(object[key], width, height, rightWidth, bottomHeight, centerIsNil);
};
var makeNinePartSlicesFromArray = function(array, width, height, rightWidth, bottomHeight, centerIsNil)
{
    rightWidth = rightWidth ? rightWidth : width;
    bottomHeight = bottomHeight ? bottomHeight : height;
    array[0] = [array[0], width, height];
    array[1] = [array[1], 1.0, height];
    array[2] = [array[2], rightWidth, height];
    array[3] = [array[3], width, 1.0];
    array[4] = centerIsNil ? nil : [array[4], 1.0, 1.0];
    array[5] = [array[5], rightWidth, 1.0];
    array[6] = [array[6], width, bottomHeight];
    array[7] = [array[7], 1.0, bottomHeight];
    array[8] = [array[8], rightWidth, bottomHeight];
};
var makeImagesFromObject = function(object, isVertical, imageFactory)
{
    for (var key in object)
        if (object.hasOwnProperty(key))
            if (object[key].constructor === Array)
                object[key] = imageFromSlices(object[key], isVertical, imageFactory);
            else
                makeImagesFromObject(object[key], isVertical, imageFactory);
};
