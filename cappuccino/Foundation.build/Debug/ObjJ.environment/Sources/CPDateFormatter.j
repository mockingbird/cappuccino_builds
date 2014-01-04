@STATIC;1.0;I;19;Foundation/CPDate.jI;21;Foundation/CPString.jI;24;Foundation/CPFormatter.jt;3931;
objj_executeFile("Foundation/CPDate.j", NO);
objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("Foundation/CPFormatter.j", NO);

CPDateFormatterNoStyle = 0;
CPDateFormatterShortStyle = 1;
CPDateFormatterMediumStyle = 2;
CPDateFormatterLongStyle = 3;
CPDateFormatterFullStyle = 4;
{var the_class = objj_allocateClassPair(CPFormatter, "CPDateFormatter"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dateStyle")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("dateStyle"), function $CPDateFormatter__dateStyle(self, _cmd)
{ with(self)
{
return _dateStyle;
}
},["id"]),
new objj_method(sel_getUid("setDateStyle:"), function $CPDateFormatter__setDateStyle_(self, _cmd, newValue)
{ with(self)
{
_dateStyle = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $CPDateFormatter__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDateFormatter").super_class }, "init"))
    {
        _dateStyle = CPDateFormatterShortStyle;
    }

    return self;
}
},["id"]), new objj_method(sel_getUid("stringFromDate:"), function $CPDateFormatter__stringFromDate_(self, _cmd, aDate)
{ with(self)
{

    switch (_dateStyle)
    {
        case CPDateFormatterShortStyle:
            var format = "d/m/Y";
            return aDate.dateFormat(format);
        default:
            return objj_msgSend(aDate, "description");
    }
}
},["CPString","CPDate"]), new objj_method(sel_getUid("dateFromString:"), function $CPDateFormatter__dateFromString_(self, _cmd, aString)
{ with(self)
{
    if (!aString)
        return nil;
    switch (_dateStyle)
    {
        case CPDateFormatterShortStyle:
            var format = "d/m/Y";
            return Date.parseDate(string, format);
        default:
            return Date.parseDate(string);
    }
}
},["CPDate","CPString"]), new objj_method(sel_getUid("stringForObjectValue:"), function $CPDateFormatter__stringForObjectValue_(self, _cmd, anObject)
{ with(self)
{
    if (objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(CPDate, "class")))
        return objj_msgSend(self, "stringFromDate:", anObject);
    else
        return objj_msgSend(anObject, "description");
}
},["CPString","id"]), new objj_method(sel_getUid("editingStringForObjectValue:"), function $CPDateFormatter__editingStringForObjectValue_(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(self, "stringForObjectValue:", anObject);
}
},["CPString","id"]), new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"), function $CPDateFormatter__getObjectValue_forString_errorDescription_(self, _cmd, anObject, aString, anError)
{ with(self)
{

    var value = objj_msgSend(self, "dateFromString:", aString);
    anObject( value);

    return YES;
}
},["BOOL","id","CPString","CPString"])]);
}

var CPDateFormatterStyleKey = "CPDateFormatterStyle";

{
var the_class = objj_getClass("CPDateFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDateFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPDateFormatter__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDateFormatter").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        _dateStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPDateFormatterStyleKey);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPDateFormatter__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDateFormatter").super_class }, "encodeWithCoder:", aCoder);

    objj_msgSend(aCoder, "encodeInt:forKey:", _dateStyle, CPDateFormatterStyleKey);
}
},["void","CPCoder"])]);
}

