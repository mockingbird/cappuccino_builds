@STATIC;1.0;I;21;Foundation/CPObject.jt;1845;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "CPFlashMovie"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_filename")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFile:"), function $CPFlashMovie__initWithFile_(self, _cmd, aFilename)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPFlashMovie").super_class }, "init");
    if (self)
        self._filename = aFilename;
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("filename"), function $CPFlashMovie__filename(self, _cmd)
{
    return self._filename;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("flashMovieWithFile:"), function $CPFlashMovie__flashMovieWithFile_(self, _cmd, aFilename)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFile:", aFilename));
    var ___r1;
}
,["id","CPString"])]);
}var CPFlashMovieFilenameKey = "CPFlashMovieFilenameKey";
{
var the_class = objj_getClass("CPFlashMovie")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPFlashMovie\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPFlashMovie__initWithCoder_(self, _cmd, aCoder)
{
    self._filename = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPFlashMovieFilenameKey));
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPFlashMovie__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._filename, CPFlashMovieFilenameKey));
}
,["void","CPCoder"])]);
}