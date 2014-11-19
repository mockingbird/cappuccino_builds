@STATIC;1.0;I;17;AppKit/CPSlider.ji;8;NSCell.jt;4752;objj_executeFile("AppKit/CPSlider.j", NO);objj_executeFile("NSCell.j", YES);{
var the_class = objj_getClass("CPSlider")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSlider\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPSlider__NS_initWithCoder_(self, _cmd, aCoder)
{
    var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
    self._minValue = (cell == null ? null : cell.isa.objj_msgSend0(cell, "minValue"));
    self._maxValue = (cell == null ? null : cell.isa.objj_msgSend0(cell, "maxValue"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPSlider__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "NS_initWithCell:", cell);
    self._altIncrementValue = (cell == null ? null : cell.isa.objj_msgSend0(cell, "altIncrementValue"));
    self.isa.objj_msgSend1(self, "setSliderType:", (cell == null ? null : cell.isa.objj_msgSend0(cell, "sliderType")));
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPSlider, "NSSlider"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSlider__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
        (self == null ? null : self.isa.objj_msgSend0(self, "_adjustNib2CibSize"));
        var frame = (self == null ? null : self.isa.objj_msgSend0(self, "frame"));
        if ((self == null ? null : self.isa.objj_msgSend0(self, "sliderType")) === CPCircularSlider)
            (self == null ? null : self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(frame.size.width + 2.0, frame.size.height + 2.0)));
        else
            (self == null ? null : self.isa.objj_msgSend1(self, "setFrame:", CGRectMake(frame.origin.x + 2, frame.origin.y, frame.size.width - 4, frame.size.height)));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSSlider__classForKeyedArchiver(self, _cmd)
{
    return CPSlider.isa.objj_msgSend0(CPSlider, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSCell, "NSSliderCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_altIncrementValue"), new objj_ivar("_vertical"), new objj_ivar("_sliderType")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("minValue"), function $NSSliderCell__minValue(self, _cmd)
{
    return self._minValue;
}
,["double"]), new objj_method(sel_getUid("maxValue"), function $NSSliderCell__maxValue(self, _cmd)
{
    return self._maxValue;
}
,["double"]), new objj_method(sel_getUid("altIncrementValue"), function $NSSliderCell__altIncrementValue(self, _cmd)
{
    return self._altIncrementValue;
}
,["double"]), new objj_method(sel_getUid("isVertical"), function $NSSliderCell__isVertical(self, _cmd)
{
    return self._vertical;
}
,["BOOL"]), new objj_method(sel_getUid("sliderType"), function $NSSliderCell__sliderType(self, _cmd)
{
    return self._sliderType;
}
,["int"]), new objj_method(sel_getUid("initWithCoder:"), function $NSSliderCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSSliderCell").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._objectValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", "NSValue"));
        self._minValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", "NSMinValue"));
        self._maxValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", "NSMaxValue"));
        self._altIncrementValue = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", "NSAltIncValue"));
        self._isVertical = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSVertical"));
        self._sliderType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSSliderType"));
    }
    return self;
}
,["id","CPCoder"])]);
}