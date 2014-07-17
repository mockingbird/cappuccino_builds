@STATIC;1.0;I;20;AppKit/CPImageView.ji;8;NSCell.jt;4450;objj_executeFile("AppKit/CPImageView.j", NO);objj_executeFile("NSCell.j", YES);{
var the_class = objj_getClass("CPImageView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPImageView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPImageView__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPImageView__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "NS_initWithCell:", cell);
    self.isa.objj_msgSend1(self, "setImageScaling:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "imageScaling")));
    self.isa.objj_msgSend1(self, "setImageAlignment:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "imageAlignment")));
    self._isEditable = (cell == null ? null : cell.isa.objj_msgSend0(cell, "isEditable"));
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPImageView, "NSImageView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSImageView__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSImageView__classForKeyedArchiver(self, _cmd)
{
    return CPImageView.isa.objj_msgSend0(CPImageView, "class");
}
,["Class"])]);
}NSImageAlignCenter = 0;
NSImageAlignTop = 1;
NSImageAlignTopLeft = 2;
NSImageAlignTopRight = 3;
NSImageAlignLeft = 4;
NSImageAlignBottom = 5;
NSImageAlignBottomLeft = 6;
NSImageAlignBottomRight = 7;
NSImageAlignRight = 8;
NSImageScaleProportionallyDown = 0;
NSImageScaleAxesIndependently = 1;
NSImageScaleNone = 2;
NSImageScaleProportionallyUpOrDown = 3;
NSImageFrameNone = 0;
NSImageFramePhoto = 1;
NSImageFrameGrayBezel = 2;
NSImageFrameGroove = 3;
NSImageFrameButton = 4;
{var the_class = objj_allocateClassPair(NSCell, "NSImageCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_animates"), new objj_ivar("_imageAlignment"), new objj_ivar("_imageScaling"), new objj_ivar("_frameStyle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_animates"), function $NSImageCell___animates(self, _cmd)
{
    return self._animates;
}
,["BOOL"]), new objj_method(sel_getUid("_setAnimates:"), function $NSImageCell___setAnimates_(self, _cmd, newValue)
{
    self._animates = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("imageAlignment"), function $NSImageCell__imageAlignment(self, _cmd)
{
    return self._imageAlignment;
}
,["NSImageAlignment"]), new objj_method(sel_getUid("imageScaling"), function $NSImageCell__imageScaling(self, _cmd)
{
    return self._imageScaling;
}
,["NSImageScaling"]), new objj_method(sel_getUid("_frameStyle"), function $NSImageCell___frameStyle(self, _cmd)
{
    return self._frameStyle;
}
,["NSImageFrameStyle"]), new objj_method(sel_getUid("_setFrameStyle:"), function $NSImageCell___setFrameStyle_(self, _cmd, newValue)
{
    self._frameStyle = newValue;
}
,["void","NSImageFrameStyle"]), new objj_method(sel_getUid("initWithCoder:"), function $NSImageCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSImageCell").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._animates = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSAnimates"));
        self._imageAlignment = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSAlign"));
        self._imageScaling = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSScale"));
        self._frameStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSStyle"));
    }
    return self;
}
,["id","CPCoder"])]);
}