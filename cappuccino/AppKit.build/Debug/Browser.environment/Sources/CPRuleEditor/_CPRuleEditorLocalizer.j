@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.jt;3555;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("Foundation/CPURLConnection.j", NO);objj_executeFile("Foundation/CPURLRequest.j", NO);var LocalizerStringsRegex = new RegExp("\"(.+)\"\\s*=\\s*\"(.+)\"\\s*;\\s*(//.+)?");
{var the_class = objj_allocateClassPair(CPObject, "_CPRuleEditorLocalizer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dictionary"), new objj_ivar("connection"), new objj_ivar("request")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("dictionary"), function $_CPRuleEditorLocalizer__dictionary(self, _cmd)
{
    return self._dictionary;
}
,["CPDictionary"]), new objj_method(sel_getUid("setDictionary:"), function $_CPRuleEditorLocalizer__setDictionary_(self, _cmd, newValue)
{
    self._dictionary = newValue;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("loadContentOfURL:"), function $_CPRuleEditorLocalizer__loadContentOfURL_(self, _cmd, aURL)
{
    self.request = CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", aURL);
    self.connection = CPURLConnection.isa.objj_msgSend2(CPURLConnection, "connectionWithRequest:delegate:", self.request, self);
}
,["void","CPURL"]), new objj_method(sel_getUid("reloadIfNeeded"), function $_CPRuleEditorLocalizer__reloadIfNeeded(self, _cmd)
{
    if (self.connection !== nil)
    {
        self.connection = nil;
        var data = CPURLConnection.isa.objj_msgSend2(CPURLConnection, "sendSynchronousRequest:returningResponse:", self.request, NULL);
        self.isa.objj_msgSend1(self, "loadContent:", (data == null ? null : data.isa.objj_msgSend0(data, "rawString")));
    }
}
,["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $_CPRuleEditorLocalizer__connection_didReceiveData_(self, _cmd, aConnection, rawString)
{
    if (self.connection !== nil && rawString !== nil)
        self.isa.objj_msgSend1(self, "loadContent:", rawString);
    self.connection = nil;
}
,["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("loadContent:"), function $_CPRuleEditorLocalizer__loadContent_(self, _cmd, aContent)
{
    var dict = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"),
        lines = (aContent == null ? null : aContent.isa.objj_msgSend1(aContent, "componentsSeparatedByString:", "\n")),
        count = (lines == null ? null : lines.isa.objj_msgSend0(lines, "count"));
    for (var i = 0; i < count; i++)
    {
        var line = (lines == null ? null : lines.isa.objj_msgSend1(lines, "objectAtIndex:", i));
        if (line.length > 1)
        {
            var match = LocalizerStringsRegex.exec(line);
            if (match && match.length >= 3)
                (dict == null ? null : dict.isa.objj_msgSend2(dict, "setObject:forKey:", match[2], match[1]));
        }
    }
    self._dictionary = CPDictionary.isa.objj_msgSend1(CPDictionary, "dictionaryWithDictionary:", dict);
}
,["void","CPString"]), new objj_method(sel_getUid("localizedStringForString:"), function $_CPRuleEditorLocalizer__localizedStringForString_(self, _cmd, aString)
{
    self.isa.objj_msgSend0(self, "reloadIfNeeded");
    if (self._dictionary !== nil && aString !== nil)
    {
        var localized = ((___r1 = self._dictionary), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aString));
        if (localized !== nil)
            return localized;
    }
    return aString;
    var ___r1;
}
,["CPString","CPString"])]);
}