@STATIC;1.0;I;30;Foundation/CPNumberFormatter.jt;2037;objj_executeFile("Foundation/CPNumberFormatter.j", NO);{
var the_class = objj_getClass("CPNumberFormatter")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPNumberFormatter\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPNumberFormatter__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend0(self, "init"));
    if (self)
    {
        var attributes = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NS.attributes"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setNumberStyle:", (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "valueForKey:", "numberStyle")) || CPNumberFormatterNoStyle));
        if ((attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "containsKey:", "minimum")))
            (self == null ? null : self.isa.objj_msgSend1(self, "setMinimum:", (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "valueForKey:", "minimum"))));
        if ((attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "containsKey:", "maximum")))
            (self == null ? null : self.isa.objj_msgSend1(self, "setMaximum:", (attributes == null ? null : attributes.isa.objj_msgSend1(attributes, "valueForKey:", "maximum"))));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPNumberFormatter, "NSNumberFormatter"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSNumberFormatter__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSNumberFormatter__classForKeyedArchiver(self, _cmd)
{
    return CPNumberFormatter.isa.objj_msgSend0(CPNumberFormatter, "class");
}
,["Class"])]);
}