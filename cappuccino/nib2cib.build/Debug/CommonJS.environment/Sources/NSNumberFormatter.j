@STATIC;1.0;I;30;Foundation/CPNumberFormatter.jt;1600;objj_executeFile("Foundation/CPNumberFormatter.j", NO);{
var the_class = objj_getClass("CPNumberFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPNumberFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPNumberFormatter__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        var attributes = objj_msgSend(aCoder, "decodeObjectForKey:", "NS.attributes");
        objj_msgSend(self, "setNumberStyle:", objj_msgSend(attributes, "valueForKey:", "numberStyle") || CPNumberFormatterNoStyle);
        if (objj_msgSend(attributes, "containsKey:", "minimum"))
            objj_msgSend(self, "setMinimum:", objj_msgSend(attributes, "valueForKey:", "minimum"));
        if (objj_msgSend(attributes, "containsKey:", "maximum"))
            objj_msgSend(self, "setMaximum:", objj_msgSend(attributes, "valueForKey:", "maximum"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPNumberFormatter, "NSNumberFormatter"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSNumberFormatter__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSNumberFormatter__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPNumberFormatter, "class");
}
,["Class"])]);
}