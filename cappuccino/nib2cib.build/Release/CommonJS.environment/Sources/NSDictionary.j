@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jt;1321;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);{var the_class = objj_allocateClassPair(CPObject, "NSDictionary"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSDictionary__initWithCoder_(self, _cmd, aCoder)
{
    if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "NS.objects")))
        return CPDictionary.isa.objj_msgSend2(CPDictionary, "dictionaryWithObjects:forKeys:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NS.objects")), (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NS.keys")));
    if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", "dict.values")))
        return CPDictionary.isa.objj_msgSend2(CPDictionary, "dictionaryWithObjects:forKeys:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "dict.values")), (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "dict.sortedKeys")));
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(NSDictionary, "NSMutableDictionary"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}