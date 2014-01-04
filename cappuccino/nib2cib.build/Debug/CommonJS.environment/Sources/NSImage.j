@STATIC;1.0;I;16;AppKit/CPImage.jt;1163;objj_executeFile("AppKit/CPImage.j", NO);

{
var the_class = objj_getClass("CPImage")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPImage\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPImage__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSend(self, "init");

    if (self)
    {
        var imageFlags = objj_msgSend(aCoder, "decodeIntForKey:", "NSImageFlags");




        _size = objj_msgSend(aCoder, "decodeSizeForKey:", "NSSize");
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPImage, "NSImage"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSImage__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSImage__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPImage, "class");
}
},["Class"])]);
}

