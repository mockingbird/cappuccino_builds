@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.jt;3197;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("Foundation/CPURLConnection.j", NO);objj_executeFile("Foundation/CPURLRequest.j", NO);var LocalizerStringsRegex = new RegExp("\"(.+)\"\\s*=\\s*\"(.+)\"\\s*;\\s*(//.+)?");
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
    self.request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    self.connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", self.request, self);
}
,["void","CPURL"]), new objj_method(sel_getUid("reloadIfNeeded"), function $_CPRuleEditorLocalizer__reloadIfNeeded(self, _cmd)
{
    if (self.connection !== nil)
    {
        self.connection = nil;
        var data = objj_msgSend(CPURLConnection, "sendSynchronousRequest:returningResponse:", self.request, NULL);
        objj_msgSend(self, "loadContent:", objj_msgSend(data, "rawString"));
    }
}
,["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $_CPRuleEditorLocalizer__connection_didReceiveData_(self, _cmd, aConnection, rawString)
{
    if (self.connection !== nil && rawString !== nil)
        objj_msgSend(self, "loadContent:", rawString);
    self.connection = nil;
}
,["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("loadContent:"), function $_CPRuleEditorLocalizer__loadContent_(self, _cmd, aContent)
{
    var dict = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"),
        lines = objj_msgSend(aContent, "componentsSeparatedByString:", "\n"),
        count = objj_msgSend(lines, "count");
    for (var i = 0; i < count; i++)
    {
        var line = objj_msgSend(lines, "objectAtIndex:", i);
        if (line.length > 1)
        {
            var match = LocalizerStringsRegex.exec(line);
            if (match && match.length >= 3)
                objj_msgSend(dict, "setObject:forKey:", match[2], match[1]);
        }
    }
    self._dictionary = objj_msgSend(CPDictionary, "dictionaryWithDictionary:", dict);
}
,["void","CPString"]), new objj_method(sel_getUid("localizedStringForString:"), function $_CPRuleEditorLocalizer__localizedStringForString_(self, _cmd, aString)
{
    objj_msgSend(self, "reloadIfNeeded");
    if (self._dictionary !== nil && aString !== nil)
    {
        var localized = objj_msgSend(self._dictionary, "objectForKey:", aString);
        if (localized !== nil)
            return localized;
    }
    return aString;
}
,["CPString","CPString"])]);
}