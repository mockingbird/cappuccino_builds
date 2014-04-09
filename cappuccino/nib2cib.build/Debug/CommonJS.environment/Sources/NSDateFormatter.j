@STATIC;1.0;I;28;Foundation/CPDateFormatter.jt;2108;objj_executeFile("Foundation/CPDateFormatter.j", NO);{
var the_class = objj_getClass("CPDateFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDateFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPDateFormatter__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDateFormatter").super_class }, "init");
    if (self)
    {
        var attributes = objj_msgSend(aCoder, "decodeObjectForKey:", "NS.attributes");
        self._dateStyle = objj_msgSend(attributes, "valueForKey:", "dateStyle");
        self._timeStyle = objj_msgSend(attributes, "valueForKey:", "timeStyle");
        self._formatterBehavior = objj_msgSend(attributes, "valueForKey:", "formatterBehavior");
        if (objj_msgSend(attributes, "containsKey:", "doesRelativeDateFormatting"))
            self._doesRelativeDateFormatting = objj_msgSend(attributes, "valueForKey:", "doesRelativeDateFormatting");
        self._dateFormat = objj_msgSend(aCoder, "decodeObjectForKey:", "NS.format");
        self._allowNaturalLanguage = objj_msgSend(aCoder, "decodeBoolForKey:", "NS.natural");
        if (self._formatterBehavior == CPDateFormatterBehavior10_0)
        {
            self._formatterBehavior = CPDateFormatterBehavior10_4;
            self._timeStyle = CPDateFormatterMediumStyle;
            self._dateStyle = CPDateFormatterMediumStyle;
        }
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPDateFormatter, "NSDateFormatter"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSDateFormatter__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSDateFormatter__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPDateFormatter, "class");
}
,["Class"])]);
}