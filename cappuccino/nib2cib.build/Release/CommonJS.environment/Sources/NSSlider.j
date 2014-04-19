@STATIC;1.0;I;17;AppKit/CPSlider.ji;8;NSCell.jt;4000;objj_executeFile("AppKit/CPSlider.j", NO);objj_executeFile("NSCell.j", YES);{
var the_class = objj_getClass("CPSlider")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSlider\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPSlider__NS_initWithCoder_(self, _cmd, aCoder)
{
    var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
    self._minValue = objj_msgSend(cell, "minValue");
    self._maxValue = objj_msgSend(cell, "maxValue");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPSlider__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSlider").super_class }, "NS_initWithCell:", cell);
    self._altIncrementValue = objj_msgSend(cell, "altIncrementValue");
    objj_msgSend(self, "setSliderType:", objj_msgSend(cell, "sliderType"));
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPSlider, "NSSlider"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSSlider__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
        var frame = objj_msgSend(self, "frame");
        if (objj_msgSend(self, "sliderType") === CPCircularSlider)
            objj_msgSend(self, "setFrameSize:", CGSizeMake(frame.size.width + 2.0, frame.size.height + 2.0));
        else
            objj_msgSend(self, "setFrame:", CGRectMake(frame.origin.x + 2, frame.origin.y, frame.size.width - 4, frame.size.height));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSSlider__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPSlider, "class");
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
        self._objectValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSValue");
        self._minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSMinValue");
        self._maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSMaxValue");
        self._altIncrementValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSAltIncValue");
        self._isVertical = objj_msgSend(aCoder, "decodeBoolForKey:", "NSVertical");
        self._sliderType = objj_msgSend(aCoder, "decodeIntForKey:", "NSSliderType");
    }
    return self;
}
,["id","CPCoder"])]);
}