@STATIC;1.0;i;16;CPCharacterSet.ji;14;CPDictionary.ji;10;CPString.jt;11308;objj_executeFile("CPCharacterSet.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPScanner"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_string"), new objj_ivar("_locale"), new objj_ivar("_scanLocation"), new objj_ivar("_caseSensitive"), new objj_ivar("_charactersToBeSkipped")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:"), function $CPScanner__initWithString_(self, _cmd, aString)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScanner").super_class }, "init"))
    {
        self._string = (aString == null ? null : aString.isa.objj_msgSend0(aString, "copy"));
        self._scanLocation = 0;
        self._charactersToBeSkipped = CPCharacterSet.isa.objj_msgSend0(CPCharacterSet, "whitespaceCharacterSet");
        self._caseSensitive = NO;
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("copy"), function $CPScanner__copy(self, _cmd)
{
    var copy = ((___r1 = CPScanner.isa.objj_msgSend0(CPScanner, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithString:", self.isa.objj_msgSend0(self, "string")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setCharactersToBeSkipped:", self.isa.objj_msgSend0(self, "charactersToBeSkipped")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setCaseSensitive:", self.isa.objj_msgSend0(self, "caseSensitive")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setLocale:", self.isa.objj_msgSend0(self, "locale")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setScanLocation:", self.isa.objj_msgSend0(self, "scanLocation")));
    return copy;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("locale"), function $CPScanner__locale(self, _cmd)
{
    return self._locale;
}
,["CPDictionary"]), new objj_method(sel_getUid("setLocale:"), function $CPScanner__setLocale_(self, _cmd, aLocale)
{
    self._locale = aLocale;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("setCaseSensitive:"), function $CPScanner__setCaseSensitive_(self, _cmd, flag)
{
    self._caseSensitive = flag;
}
,["void","BOOL"]), new objj_method(sel_getUid("caseSensitive"), function $CPScanner__caseSensitive(self, _cmd)
{
    return self._caseSensitive;
}
,["BOOL"]), new objj_method(sel_getUid("string"), function $CPScanner__string(self, _cmd)
{
    return self._string;
}
,["CPString"]), new objj_method(sel_getUid("charactersToBeSkipped"), function $CPScanner__charactersToBeSkipped(self, _cmd)
{
    return self._charactersToBeSkipped;
}
,["CPCharacterSet"]), new objj_method(sel_getUid("setCharactersToBeSkipped:"), function $CPScanner__setCharactersToBeSkipped_(self, _cmd, c)
{
    self._charactersToBeSkipped = c;
}
,["void","CPCharacterSet"]), new objj_method(sel_getUid("isAtEnd"), function $CPScanner__isAtEnd(self, _cmd)
{
    return self._scanLocation == self._string.length;
}
,["BOOL"]), new objj_method(sel_getUid("scanLocation"), function $CPScanner__scanLocation(self, _cmd)
{
    return self._scanLocation;
}
,["int"]), new objj_method(sel_getUid("setScanLocation:"), function $CPScanner__setScanLocation_(self, _cmd, aLocation)
{
    if (aLocation > self._string.length)
        aLocation = self._string.length;
    else if (aLocation < 0)
        aLocation = 0;
    self._scanLocation = aLocation;
}
,["void","int"]), new objj_method(sel_getUid("_performScanWithSelector:withObject:into:"), function $CPScanner___performScanWithSelector_withObject_into_(self, _cmd, s, arg, ref)
{
    var ret = self.isa.objj_msgSend2(self, "performSelector:withObject:", s, arg);
    if (ret == nil)
        return NO;
    if (ref != nil)
        ref(ret);
    return YES;
}
,["BOOL","SEL","id","id"]), new objj_method(sel_getUid("scanCharactersFromSet:intoString:"), function $CPScanner__scanCharactersFromSet_intoString_(self, _cmd, scanSet, ref)
{
    return self.isa.objj_msgSend3(self, "_performScanWithSelector:withObject:into:", sel_getUid("scanCharactersFromSet:"), scanSet, ref);
}
,["BOOL","CPCharacterSet","id"]), new objj_method(sel_getUid("scanCharactersFromSet:"), function $CPScanner__scanCharactersFromSet_(self, _cmd, scanSet)
{
    return self.isa.objj_msgSend2(self, "_scanWithSet:breakFlag:", scanSet, NO);
}
,["CPString","CPCharacterSet"]), new objj_method(sel_getUid("scanUpToCharactersFromSet:intoString:"), function $CPScanner__scanUpToCharactersFromSet_intoString_(self, _cmd, scanSet, ref)
{
    return self.isa.objj_msgSend3(self, "_performScanWithSelector:withObject:into:", sel_getUid("scanUpToCharactersFromSet:"), scanSet, ref);
}
,["BOOL","CPCharacterSet","id"]), new objj_method(sel_getUid("scanUpToCharactersFromSet:"), function $CPScanner__scanUpToCharactersFromSet_(self, _cmd, scanSet)
{
    return self.isa.objj_msgSend2(self, "_scanWithSet:breakFlag:", scanSet, YES);
}
,["CPString","CPCharacterSet"]), new objj_method(sel_getUid("_scanWithSet:breakFlag:"), function $CPScanner___scanWithSet_breakFlag_(self, _cmd, scanSet, stop)
{
    if (self.isa.objj_msgSend0(self, "isAtEnd"))
        return nil;
    var current = self.isa.objj_msgSend0(self, "scanLocation"),
        str = nil;
    while (current < self._string.length)
    {
        var c = self._string.charAt(current);
        if ((scanSet == null ? null : scanSet.isa.objj_msgSend1(scanSet, "characterIsMember:", c)) == stop)
            break;
        if (!((___r1 = self._charactersToBeSkipped), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "characterIsMember:", c)))
        {
            if (!str)
                str = '';
            str += c;
        }
        current++;
    }
    if (str)
        self.isa.objj_msgSend1(self, "setScanLocation:", current);
    return str;
    var ___r1;
}
,["CPString","CPCharacterSet","BOOL"]), new objj_method(sel_getUid("_movePastCharactersToBeSkipped"), function $CPScanner___movePastCharactersToBeSkipped(self, _cmd)
{
    var current = self.isa.objj_msgSend0(self, "scanLocation"),
        string = self.isa.objj_msgSend0(self, "string"),
        toSkip = self.isa.objj_msgSend0(self, "charactersToBeSkipped");
    while (current < string.length)
    {
        if (!(toSkip == null ? null : toSkip.isa.objj_msgSend1(toSkip, "characterIsMember:", string.charAt(current))))
            break;
        current++;
    }
    self.isa.objj_msgSend1(self, "setScanLocation:", current);
}
,["void"]), new objj_method(sel_getUid("scanString:intoString:"), function $CPScanner__scanString_intoString_(self, _cmd, aString, ref)
{
    return self.isa.objj_msgSend3(self, "_performScanWithSelector:withObject:into:", sel_getUid("scanString:"), aString, ref);
}
,["BOOL","CPString","id"]), new objj_method(sel_getUid("scanString:"), function $CPScanner__scanString_(self, _cmd, s)
{
    self.isa.objj_msgSend0(self, "_movePastCharactersToBeSkipped");
    if (self.isa.objj_msgSend0(self, "isAtEnd"))
        return nil;
    var currentStr = self.isa.objj_msgSend0(self, "string").substr(self.isa.objj_msgSend0(self, "scanLocation"), s.length);
    if (self._caseSensitive && currentStr != s || !self._caseSensitive && currentStr.toLowerCase() != s.toLowerCase())
    {
        return nil;
    }
    else
    {
        self.isa.objj_msgSend1(self, "setScanLocation:", self.isa.objj_msgSend0(self, "scanLocation") + s.length);
        return s;
    }
}
,["CPString","CPString"]), new objj_method(sel_getUid("scanUpToString:intoString:"), function $CPScanner__scanUpToString_intoString_(self, _cmd, aString, ref)
{
    return self.isa.objj_msgSend3(self, "_performScanWithSelector:withObject:into:", sel_getUid("scanUpToString:"), aString, ref);
}
,["BOOL","CPString","id"]), new objj_method(sel_getUid("scanUpToString:"), function $CPScanner__scanUpToString_(self, _cmd, s)
{
    var current = self.isa.objj_msgSend0(self, "scanLocation"),
        str = self.isa.objj_msgSend0(self, "string"),
        captured = nil;
    while (current < str.length)
    {
        var currentStr = str.substr(current, s.length);
        if (currentStr == s || !self._caseSensitive && currentStr.toLowerCase() == s.toLowerCase())
            break;
        if (!captured)
            captured = '';
        captured += str.charAt(current);
        current++;
    }
    if (captured)
        self.isa.objj_msgSend1(self, "setScanLocation:", current);
    if (self.isa.objj_msgSend0(self, "charactersToBeSkipped"))
        captured = (captured == null ? null : captured.isa.objj_msgSend2(captured, "_stringByTrimmingCharactersInSet:options:", self.isa.objj_msgSend0(self, "charactersToBeSkipped"), _CPCharacterSetTrimAtBeginning));
    return captured;
}
,["CPString","CPString"]), new objj_method(sel_getUid("scanWithParseFunction:"), function $CPScanner__scanWithParseFunction_(self, _cmd, parseFunction)
{
    self.isa.objj_msgSend0(self, "_movePastCharactersToBeSkipped");
    var str = self.isa.objj_msgSend0(self, "string"),
        loc = self.isa.objj_msgSend0(self, "scanLocation");
    if (self.isa.objj_msgSend0(self, "isAtEnd"))
        return 0;
    var s = str.substring(loc, str.length),
        f = parseFunction(s);
    if (isNaN(f))
        return nil;
    loc += ("" + f).length;
    var i = 0;
    while (!isNaN(parseFloat(str.substring(loc + i, str.length))))
    {
        i++;
    }
    self.isa.objj_msgSend1(self, "setScanLocation:", loc + i);
    return f;
}
,["float","Function"]), new objj_method(sel_getUid("scanFloat"), function $CPScanner__scanFloat(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "scanWithParseFunction:", parseFloat);
}
,["float"]), new objj_method(sel_getUid("scanInt"), function $CPScanner__scanInt(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "scanWithParseFunction:", parseInt);
}
,["int"]), new objj_method(sel_getUid("scanInt:"), function $CPScanner__scanInt_(self, _cmd, intoInt)
{
    return self.isa.objj_msgSend3(self, "_performScanWithSelector:withObject:into:", sel_getUid("scanInt"), nil, intoInt);
}
,["BOOL","int"]), new objj_method(sel_getUid("scanFloat:"), function $CPScanner__scanFloat_(self, _cmd, intoFloat)
{
    return self.isa.objj_msgSend3(self, "_performScanWithSelector:withObject:into:", sel_getUid("scanFloat"), nil, intoFloat);
}
,["BOOL","float"]), new objj_method(sel_getUid("scanDouble:"), function $CPScanner__scanDouble_(self, _cmd, intoDouble)
{
    return self.isa.objj_msgSend1(self, "scanFloat:", intoDouble);
}
,["BOOL","float"]), new objj_method(sel_getUid("description"), function $CPScanner__description(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScanner").super_class }, "description") + " {" + CPStringFromClass(self.isa.objj_msgSend0(self, "class")) + ", state = '" + (self.isa.objj_msgSend0(self, "string").substr(0, self._scanLocation) + "{{ SCAN LOCATION ->}}" + self.isa.objj_msgSend0(self, "string").substr(self._scanLocation)) + "'; }";
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("scannerWithString:"), function $CPScanner__scannerWithString_(self, _cmd, aString)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithString:", aString));
    var ___r1;
}
,["id","CPString"])]);
}