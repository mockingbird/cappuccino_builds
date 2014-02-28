@STATIC;1.0;I;19;Foundation/CPDate.jt;650;objj_executeFile("Foundation/CPDate.j", NO);{var the_class = objj_allocateClassPair(CPDate, "NSDate"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSDate__initWithCoder_(self, _cmd, aCoder)
{
    var interval = objj_msgSend(aCoder, "decodeDoubleForKey:", "NS.time") || 0;
    return objj_msgSend(CPDate, "dateWithTimeIntervalSinceReferenceDate:", interval);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSDate__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPDate, "class");
}
,["Class"])]);
}