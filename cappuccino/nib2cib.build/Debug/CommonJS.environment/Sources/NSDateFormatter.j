@STATIC;1.0;I;28;Foundation/CPDateFormatter.jt;2483;objj_executeFile("Foundation/CPDateFormatter.j", NO);{
var the_class = objj_getClass("CPDateFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDateFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPDateFormatter__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDateFormatter").super_class }, "init");
    if (self)
    {
        var attributes = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NS.attributes"));
        self._dateStyle = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "valueForKey:", "dateStyle"));
        self._timeStyle = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "valueForKey:", "timeStyle"));
        self._formatterBehavior = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "valueForKey:", "formatterBehavior"));
        if ((attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "containsKey:", "doesRelativeDateFormatting")))
            self._doesRelativeDateFormatting = (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "valueForKey:", "doesRelativeDateFormatting"));
        self._dateFormat = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NS.format"));
        self._allowNaturalLanguage = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NS.natural"));
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
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSDateFormatter__classForKeyedArchiver(self, _cmd)
{
    return CPDateFormatter.isa.objj_msgSend0(CPDateFormatter, "class");
}
,["Class"])]);
}