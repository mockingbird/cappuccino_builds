@STATIC;1.0;i;13;CPException.ji;10;CPObject.ji;15;CPObjJRuntime.ji;9;CPRange.ji;18;CPSortDescriptor.ji;7;CPURL.ji;9;CPValue.ji;8;CPNull.jt;21931;objj_executeFile("CPException.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPObjJRuntime.j", YES);objj_executeFile("CPRange.j", YES);objj_executeFile("CPSortDescriptor.j", YES);objj_executeFile("CPURL.j", YES);objj_executeFile("CPValue.j", YES);objj_executeFile("CPNull.j", YES);CPCaseInsensitiveSearch = 1;
CPLiteralSearch = 2;
CPBackwardsSearch = 4;
CPAnchoredSearch = 8;
CPNumericSearch = 64;
CPDiacriticInsensitiveSearch = 128;
var CPStringUIDs = new CFMutableDictionary(),
    CPStringRegexSpecialCharacters = ['/', '.', '*', '+', '?', '|', '$', '^', '(', ')', '[', ']', '{', '}', '\\'],
    CPStringRegexEscapeExpression = new RegExp("(\\" + CPStringRegexSpecialCharacters.join("|\\") + ")", 'g'),
    CPStringRegexTrimWhitespace = new RegExp("(^\\s+|\\s+$)", 'g');
{var the_class = objj_allocateClassPair(CPObject, "CPString"),
meta_class = the_class.isa;var CPStringNull = CPNull.isa.objj_msgSend0(CPNull, "null");
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:"), function $CPString__initWithString_(self, _cmd, aString)
{
    if (self.isa.objj_msgSend0(self, "class") === CPString)
        return String(aString);
    var result = new String(aString);
    result.isa = self.isa.objj_msgSend0(self, "class");
    return result;
}
,["id","CPString"]), new objj_method(sel_getUid("initWithFormat:"), function $CPString__initWithFormat_(self, _cmd, format)
{
    if (!format)
        (CPException == null ? null : CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "initWithFormat: the format can't be 'nil'"));
    self = ObjectiveJ.sprintf.apply(this, Array.prototype.slice.call(arguments, 2));
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("description"), function $CPString__description(self, _cmd)
{
    return self;
}
,["CPString"]), new objj_method(sel_getUid("length"), function $CPString__length(self, _cmd)
{
    return self.length;
}
,["int"]), new objj_method(sel_getUid("characterAtIndex:"), function $CPString__characterAtIndex_(self, _cmd, anIndex)
{
    return self.charAt(anIndex);
}
,["CPString","CPUInteger"]), new objj_method(sel_getUid("stringByAppendingFormat:"), function $CPString__stringByAppendingFormat_(self, _cmd, format)
{
    if (!format)
        (CPException == null ? null : CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "initWithFormat: the format can't be 'nil'"));
    return self + ObjectiveJ.sprintf.apply(this, Array.prototype.slice.call(arguments, 2));
}
,["CPString","CPString"]), new objj_method(sel_getUid("stringByAppendingString:"), function $CPString__stringByAppendingString_(self, _cmd, aString)
{
    return self + aString;
}
,["CPString","CPString"]), new objj_method(sel_getUid("stringByPaddingToLength:withString:startingAtIndex:"), function $CPString__stringByPaddingToLength_withString_startingAtIndex_(self, _cmd, aLength, aString, anIndex)
{
    if (self.length == aLength)
        return self;
    if (aLength < self.length)
        return self.substr(0, aLength);
    var string = self,
        substring = aString.substring(anIndex),
        difference = aLength - self.length;
    while ((difference -= substring.length) >= 0)
        string += substring;
    if (-difference < substring.length)
        string += substring.substring(0, -difference);
    return string;
}
,["CPString","unsigned","CPString","CPUInteger"]), new objj_method(sel_getUid("componentsSeparatedByString:"), function $CPString__componentsSeparatedByString_(self, _cmd, aString)
{
    return self.split(aString);
}
,["CPArray","CPString"]), new objj_method(sel_getUid("substringFromIndex:"), function $CPString__substringFromIndex_(self, _cmd, anIndex)
{
    return self.substr(anIndex);
}
,["CPString","unsigned"]), new objj_method(sel_getUid("substringWithRange:"), function $CPString__substringWithRange_(self, _cmd, aRange)
{
    if (aRange.location < 0 || CPMaxRange(aRange) > self.length)
        (CPException == null ? null : CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "aRange out of bounds"));
    return self.substr(aRange.location, aRange.length);
}
,["CPString","CPRange"]), new objj_method(sel_getUid("substringToIndex:"), function $CPString__substringToIndex_(self, _cmd, anIndex)
{
    if (anIndex > self.length)
        (CPException == null ? null : CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "index out of bounds"));
    return self.substring(0, anIndex);
}
,["CPString","unsigned"]), new objj_method(sel_getUid("rangeOfString:"), function $CPString__rangeOfString_(self, _cmd, aString)
{
    return self.isa.objj_msgSend2(self, "rangeOfString:options:", aString, 0);
}
,["CPRange","CPString"]), new objj_method(sel_getUid("rangeOfString:options:"), function $CPString__rangeOfString_options_(self, _cmd, aString, aMask)
{
    return self.isa.objj_msgSend3(self, "rangeOfString:options:range:", aString, aMask, nil);
}
,["CPRange","CPString","int"]), new objj_method(sel_getUid("rangeOfString:options:range:"), function $CPString__rangeOfString_options_range_(self, _cmd, aString, aMask, aRange)
{
    if (!aString)
        return CPMakeRange(CPNotFound, 0);
    var string = aRange == nil ? self : self.isa.objj_msgSend1(self, "substringWithRange:", aRange),
        location = CPNotFound;
    if (aMask & CPCaseInsensitiveSearch)
    {
        string = string.toLowerCase();
        aString = aString.toLowerCase();
    }
    if (aMask & CPDiacriticInsensitiveSearch)
    {
        string = string.stripDiacritics();
        aString = aString.stripDiacritics();
    }
    if (aMask & CPBackwardsSearch)
    {
        location = string.lastIndexOf(aString);
        if (aMask & CPAnchoredSearch && location + aString.length != string.length)
            location = CPNotFound;
    }
    else if (aMask & CPAnchoredSearch)
        location = (string.substr(0, aString.length)).indexOf(aString) != CPNotFound ? 0 : CPNotFound;
    else
        location = string.indexOf(aString);
    if (location == CPNotFound)
        return CPMakeRange(CPNotFound, 0);
    return CPMakeRange(location + (aRange ? aRange.location : 0), aString.length);
}
,["CPRange","CPString","int","CPrange"]), new objj_method(sel_getUid("stringByEscapingRegexControlCharacters"), function $CPString__stringByEscapingRegexControlCharacters(self, _cmd)
{
    return self.replace(CPStringRegexEscapeExpression, "\\$1");
}
,["CPString"]), new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:"), function $CPString__stringByReplacingOccurrencesOfString_withString_(self, _cmd, target, replacement)
{
    return self.replace(new RegExp((target == null ? null : target.isa.objj_msgSend0(target, "stringByEscapingRegexControlCharacters")), "g"), replacement);
}
,["CPString","CPString","CPString"]), new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:options:range:"), function $CPString__stringByReplacingOccurrencesOfString_withString_options_range_(self, _cmd, target, replacement, options, searchRange)
{
    var start = self.substring(0, searchRange.location),
        stringSegmentToSearch = self.substr(searchRange.location, searchRange.length),
        end = self.substring(searchRange.location + searchRange.length, self.length),
        target = (target == null ? null : target.isa.objj_msgSend0(target, "stringByEscapingRegexControlCharacters")),
        regExp;
    if (options & CPCaseInsensitiveSearch)
        regExp = new RegExp(target, "gi");
    else
        regExp = new RegExp(target, "g");
    return start + '' + stringSegmentToSearch.replace(regExp, replacement) + '' + end;
}
,["CPString","CPString","CPString","int","CPRange"]), new objj_method(sel_getUid("stringByReplacingCharactersInRange:withString:"), function $CPString__stringByReplacingCharactersInRange_withString_(self, _cmd, range, replacement)
{
    return '' + self.substring(0, range.location) + replacement + self.substring(range.location + range.length, self.length);
}
,["CPString","CPRange","CPString"]), new objj_method(sel_getUid("stringByTrimmingWhitespace"), function $CPString__stringByTrimmingWhitespace(self, _cmd)
{
    return self.replace(CPStringRegexTrimWhitespace, "");
}
,["CPString"]), new objj_method(sel_getUid("compare:"), function $CPString__compare_(self, _cmd, aString)
{
    return self.isa.objj_msgSend2(self, "compare:options:", aString, nil);
}
,["CPComparisonResult","CPString"]), new objj_method(sel_getUid("caseInsensitiveCompare:"), function $CPString__caseInsensitiveCompare_(self, _cmd, aString)
{
    return self.isa.objj_msgSend2(self, "compare:options:", aString, CPCaseInsensitiveSearch);
}
,["CPComparisonResult","CPString"]), new objj_method(sel_getUid("compare:options:"), function $CPString__compare_options_(self, _cmd, aString, aMask)
{
    if (aString === nil)
        return CPOrderedDescending;
    if (aString === CPStringNull)
        (CPException == null ? null : CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "compare: argument can't be 'CPNull'"));
    var lhs = self,
        rhs = aString;
    if (aMask & CPCaseInsensitiveSearch)
    {
        lhs = lhs.toLowerCase();
        rhs = rhs.toLowerCase();
    }
    if (aMask & CPDiacriticInsensitiveSearch)
    {
        lhs = lhs.stripDiacritics();
        rhs = rhs.stripDiacritics();
    }
    if (lhs < rhs)
        return CPOrderedAscending;
    if (lhs > rhs)
        return CPOrderedDescending;
    return CPOrderedSame;
}
,["CPComparisonResult","CPString","int"]), new objj_method(sel_getUid("compare:options:range:"), function $CPString__compare_options_range_(self, _cmd, aString, aMask, range)
{
    var lhs = self.isa.objj_msgSend1(self, "substringWithRange:", range),
        rhs = aString;
    return (lhs == null ? null : lhs.isa.objj_msgSend2(lhs, "compare:options:", rhs, aMask));
}
,["CPComparisonResult","CPString","int","CPRange"]), new objj_method(sel_getUid("hasPrefix:"), function $CPString__hasPrefix_(self, _cmd, aString)
{
    return aString && aString != "" && self.indexOf(aString) == 0;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("hasSuffix:"), function $CPString__hasSuffix_(self, _cmd, aString)
{
    return aString && aString != "" && self.length >= aString.length && self.lastIndexOf(aString) == self.length - aString.length;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("isEqual:"), function $CPString__isEqual_(self, _cmd, anObject)
{
    if (self === anObject)
        return YES;
    if (!anObject || !(anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "isKindOfClass:", CPString.isa.objj_msgSend0(CPString, "class"))))
        return NO;
    return self.isa.objj_msgSend1(self, "isEqualToString:", anObject);
}
,["BOOL","id"]), new objj_method(sel_getUid("isEqualToString:"), function $CPString__isEqualToString_(self, _cmd, aString)
{
    return self == String(aString);
}
,["BOOL","CPString"]), new objj_method(sel_getUid("UID"), function $CPString__UID(self, _cmd)
{
    var UID = CPStringUIDs.valueForKey(self);
    if (!UID)
    {
        UID = objj_generateObjectUID();
        CPStringUIDs.setValueForKey(self, UID);
    }
    return UID + "";
}
,["CPString"]), new objj_method(sel_getUid("commonPrefixWithString:"), function $CPString__commonPrefixWithString_(self, _cmd, aString)
{
    return self.isa.objj_msgSend2(self, "commonPrefixWithString:options:", aString, 0);
}
,["CPString","CPString"]), new objj_method(sel_getUid("commonPrefixWithString:options:"), function $CPString__commonPrefixWithString_options_(self, _cmd, aString, aMask)
{
    var len = 0,
        lhs = self,
        rhs = aString,
        min = MIN((lhs == null ? null : lhs.isa.objj_msgSend0(lhs, "length")), (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "length")));
    if (aMask & CPCaseInsensitiveSearch)
    {
        lhs = (lhs == null ? null : lhs.isa.objj_msgSend0(lhs, "lowercaseString"));
        rhs = (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "lowercaseString"));
    }
    for (; len < min; len++)
    {
        if ((lhs == null ? null : lhs.isa.objj_msgSend1(lhs, "characterAtIndex:", len)) !== (rhs == null ? null : rhs.isa.objj_msgSend1(rhs, "characterAtIndex:", len)))
            break;
    }
    return self.isa.objj_msgSend1(self, "substringToIndex:", len);
}
,["CPString","CPString","int"]), new objj_method(sel_getUid("capitalizedString"), function $CPString__capitalizedString(self, _cmd)
{
    var parts = self.split(/\b/g),
        i = 0,
        count = parts.length;
    for (; i < count; i++)
    {
        if (i == 0 || /\s$/.test(parts[i - 1]))
            parts[i] = (parts[i].substring(0, 1)).toUpperCase() + (parts[i].substring(1)).toLowerCase();
        else
            parts[i] = parts[i].toLowerCase();
    }
    return parts.join("");
}
,["CPString"]), new objj_method(sel_getUid("lowercaseString"), function $CPString__lowercaseString(self, _cmd)
{
    return self.toLowerCase();
}
,["CPString"]), new objj_method(sel_getUid("uppercaseString"), function $CPString__uppercaseString(self, _cmd)
{
    return self.toUpperCase();
}
,["CPString"]), new objj_method(sel_getUid("stripDiacritics"), function $CPString__stripDiacritics(self, _cmd)
{
    return self.stripDiacritics();
}
,["CPString"]), new objj_method(sel_getUid("doubleValue"), function $CPString__doubleValue(self, _cmd)
{
    return parseFloat(self, 10);
}
,["double"]), new objj_method(sel_getUid("boolValue"), function $CPString__boolValue(self, _cmd)
{
    var replaceRegExp = new RegExp("^\\s*[\\+,\\-]?0*");
    return (RegExp("^[Y,y,t,T,1-9]")).test(self.replace(replaceRegExp, ''));
}
,["BOOL"]), new objj_method(sel_getUid("floatValue"), function $CPString__floatValue(self, _cmd)
{
    return parseFloat(self, 10);
}
,["float"]), new objj_method(sel_getUid("intValue"), function $CPString__intValue(self, _cmd)
{
    return parseInt(self, 10);
}
,["int"]), new objj_method(sel_getUid("pathComponents"), function $CPString__pathComponents(self, _cmd)
{
    if (self.length === 0)
        return [""];
    if (self === "/")
        return ["/"];
    var result = self.split('/');
    if (result[0] === "")
        result[0] = "/";
    var index = result.length - 1;
    if (index > 0)
    {
        if (result[index] === "")
            result[index] = "/";
        while (index--)
        {
            while (result[index] === "")
                result.splice(index--, 1);
        }
    }
    return result;
}
,["CPArray"]), new objj_method(sel_getUid("pathExtension"), function $CPString__pathExtension(self, _cmd)
{
    if (self.lastIndexOf('.') === CPNotFound)
        return "";
    return self.substr(self.lastIndexOf('.') + 1);
}
,["CPString"]), new objj_method(sel_getUid("lastPathComponent"), function $CPString__lastPathComponent(self, _cmd)
{
    var components = self.isa.objj_msgSend0(self, "pathComponents"),
        lastIndex = components.length - 1,
        lastComponent = components[lastIndex];
    return lastIndex > 0 && lastComponent === "/" ? components[lastIndex - 1] : lastComponent;
}
,["CPString"]), new objj_method(sel_getUid("stringByAppendingPathComponent:"), function $CPString__stringByAppendingPathComponent_(self, _cmd, aString)
{
    var components = self.isa.objj_msgSend0(self, "pathComponents"),
        addComponents = aString && aString !== "/" ? (aString == null ? null : aString.isa.objj_msgSend0(aString, "pathComponents")) : [];
    return CPString.isa.objj_msgSend1(CPString, "pathWithComponents:", components.concat(addComponents));
}
,["CPString","CPString"]), new objj_method(sel_getUid("stringByAppendingPathExtension:"), function $CPString__stringByAppendingPathExtension_(self, _cmd, ext)
{
    if (ext.indexOf('/') >= 0 || self.length === 0 || self === "/")
        return self;
    var components = self.isa.objj_msgSend0(self, "pathComponents"),
        last = components.length - 1;
    if (last > 0 && components[last] === "/")
        components.splice(last--, 1);
    components[last] = components[last] + "." + ext;
    return CPString.isa.objj_msgSend1(CPString, "pathWithComponents:", components);
}
,["CPString","CPString"]), new objj_method(sel_getUid("stringByDeletingLastPathComponent"), function $CPString__stringByDeletingLastPathComponent(self, _cmd)
{
    if (self.length === 0)
        return "";
    else if (self === "/")
        return "/";
    var components = self.isa.objj_msgSend0(self, "pathComponents"),
        last = components.length - 1;
    if (components[last] === "/")
        last--;
    components.splice(last, components.length - last);
    return CPString.isa.objj_msgSend1(CPString, "pathWithComponents:", components);
}
,["CPString"]), new objj_method(sel_getUid("stringByDeletingPathExtension"), function $CPString__stringByDeletingPathExtension(self, _cmd)
{
    var extension = self.isa.objj_msgSend0(self, "pathExtension");
    if (extension === "")
        return self;
    else if (self.lastIndexOf('.') < 1)
        return self;
    return self.substr(0, self.isa.objj_msgSend0(self, "length") - (extension.length + 1));
}
,["CPString"]), new objj_method(sel_getUid("stringByStandardizingPath"), function $CPString__stringByStandardizingPath(self, _cmd)
{
    return ((___r1 = (CPURL == null ? null : CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", self))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "absoluteString"));
    var ___r1;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPString__alloc(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "class") !== CPString)
        return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPString").super_class }, "alloc");
    return new String();
}
,["id"]), new objj_method(sel_getUid("string"), function $CPString__string(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("stringWithHash:"), function $CPString__stringWithHash_(self, _cmd, aHash)
{
    var hashString = (parseInt(aHash, 10)).toString(16);
    return "000000".substring(0, MAX(6 - hashString.length, 0)) + hashString;
}
,["id","unsigned"]), new objj_method(sel_getUid("stringWithString:"), function $CPString__stringWithString_(self, _cmd, aString)
{
    if (!aString)
        (CPException == null ? null : CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "stringWithString: the string can't be 'nil'"));
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithString:", aString));
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("stringWithFormat:"), function $CPString__stringWithFormat_(self, _cmd, format)
{
    if (!format)
        (CPException == null ? null : CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "initWithFormat: the format can't be 'nil'"));
    return ObjectiveJ.sprintf.apply(this, Array.prototype.slice.call(arguments, 2));
}
,["id","CPString"]), new objj_method(sel_getUid("pathWithComponents:"), function $CPString__pathWithComponents_(self, _cmd, components)
{
    var size = components.length,
        result = "",
        i = -1,
        firstRound = true,
        firstIsSlash = false;
    while (++i < size)
    {
        var component = components[i],
            lenMinusOne = component.length - 1;
        if (lenMinusOne >= 0 && (component !== "/" || firstRound))
        {
            if (lenMinusOne > 0 && component.indexOf("/", lenMinusOne) === lenMinusOne)
                component = component.substring(0, lenMinusOne);
            if (firstRound)
            {
                if (component === "/")
                    firstIsSlash = true;
                firstRound = false;
            }
            else if (!firstIsSlash)
                result += "/";
            else
                firstIsSlash = false;
            result += component;
        }
    }
    return result;
}
,["CPString","CPArray"])]);
}{
var the_class = objj_getClass("CPString")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPString\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("objectFromJSON"), function $CPString__objectFromJSON(self, _cmd)
{
    return JSON.parse(self);
}
,["JSObject"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("JSONFromObject:"), function $CPString__JSONFromObject_(self, _cmd, anObject)
{
    return JSON.stringify(anObject);
}
,["CPString","JSObject"])]);
}{
var the_class = objj_getClass("CPString")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPString\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("UUID"), function $CPString__UUID(self, _cmd)
{
    var g = "",
        i = 0;
    for (; i < 32; i++)
        g += (FLOOR(RAND() * 0xF)).toString(0xF);
    return g;
}
,["CPString"])]);
}var diacritics = [[192, 198], [200, 203], [204, 207], [210, 214], [217, 220], [224, 230], [231, 231], [232, 235], [236, 239], [242, 246], [249, 252]],
    normalized = [65, 69, 73, 79, 85, 97, 99, 101, 105, 111, 117];
String.prototype.stripDiacritics = function()
{
    var output = "";
    for (var indexSource = 0; indexSource < this.length; indexSource++)
    {
        var code = this.charCodeAt(indexSource);
        for (var i = 0; i < diacritics.length; i++)
        {
            var drange = diacritics[i];
            if (code >= drange[0] && code <= drange[drange.length - 1])
            {
                code = normalized[i];
                break;
            }
        }
        output += String.fromCharCode(code);
    }
    return output;
};
String.prototype.isa = CPString;
