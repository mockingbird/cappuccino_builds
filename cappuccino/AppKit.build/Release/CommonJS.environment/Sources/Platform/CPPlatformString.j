@STATIC;1.0;I;21;Foundation/CPObject.jt;1255;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "CPBasePlatformString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("bootstrap"), function $CPBasePlatformString__bootstrap(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"), function $CPBasePlatformString__sizeOfString_withFont_forWidth_(self, _cmd, aString, aFont, aWidth)
{
    return CGSizeMakeZero();
}
,["CGSize","CPString","CPFont","float"])]);
}{var the_class = objj_allocateClassPair(CPBasePlatformString, "CPPlatformString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"), function $CPPlatformString__sizeOfString_withFont_forWidth_(self, _cmd, aString, aFont, aWidth)
{
    return CGSizeMakeZero();
}
,["CGSize","CPString","CPFont","float"]), new objj_method(sel_getUid("metricsOfFont:"), function $CPPlatformString__metricsOfFont_(self, _cmd, aFont)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 0, "ascender", 0, "descender", 0, "lineHeight");
}
,["CPDictionary","CPFont"])]);
}