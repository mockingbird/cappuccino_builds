@STATIC;1.0;I;28;Foundation/CPDateFormatter.jt;1207;objj_executeFile("Foundation/CPDateFormatter.j", NO);

{
var the_class = objj_getClass("CPDateFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDateFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPDateFormatter__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDateFormatter").super_class }, "init");

    if (self)
    {
        _dateStyle = CPDateFormatterShortStyle;
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPDateFormatter, "NSDateFormatter"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSDateFormatter__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSDateFormatter__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDateFormatter, "class");
}
},["Class"])]);
}

