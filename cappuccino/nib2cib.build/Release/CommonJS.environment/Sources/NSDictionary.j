@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jt;1057;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);{var the_class = objj_allocateClassPair(CPObject, "NSDictionary"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSDictionary__initWithCoder_(self, _cmd, aCoder)
{
    if (objj_msgSend(aCoder, "containsValueForKey:", "NS.objects"))
        return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", objj_msgSend(aCoder, "decodeObjectForKey:", "NS.objects"), objj_msgSend(aCoder, "decodeObjectForKey:", "NS.keys"));
    if (objj_msgSend(aCoder, "containsValueForKey:", "dict.values"))
        return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", objj_msgSend(aCoder, "decodeObjectForKey:", "dict.values"), objj_msgSend(aCoder, "decodeObjectForKey:", "dict.sortedKeys"));
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(NSDictionary, "NSMutableDictionary"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}