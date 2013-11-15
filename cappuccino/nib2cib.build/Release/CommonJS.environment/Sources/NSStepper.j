@STATIC;1.0;I;18;AppKit/CPStepper.ji;8;NSCell.jt;3724;objj_executeFile("AppKit/CPStepper.j", NO);objj_executeFile("NSCell.j", YES);{
var the_class = objj_getClass("CPStepper")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPStepper\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPStepper__NS_initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPStepper__NS_initWithCell_(self, _cmd, cell)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "NS_initWithCell:", cell);
    self._minValue = objj_msgSend(cell, "minValue");
    self._maxValue = objj_msgSend(cell, "maxValue");
    self._increment = objj_msgSend(cell, "increment");
    self._valueWraps = objj_msgSend(cell, "valueWraps");
    self._autorepeat = objj_msgSend(cell, "autorepeat");
    self._objectValue = objj_msgSend(cell, "objectValue");
    self._frame.origin.y += 2;
    self._frame.size.height -= 2;
    self._bounds.size.height -= 2;
}
,["void","NSCell"])]);
}{var the_class = objj_allocateClassPair(CPStepper, "NSStepper"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSStepper__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "NS_initWithCoder:", aCoder);
    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");
        objj_msgSend(self, "NS_initWithCell:", cell);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSStepper__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(CPStepper, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(NSCell, "NSStepperCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_increment"), new objj_ivar("_valueWraps"), new objj_ivar("_autorepeat")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("minValue"), function $NSStepperCell__minValue(self, _cmd)
{
    return self._minValue;
}
,["double"]), new objj_method(sel_getUid("maxValue"), function $NSStepperCell__maxValue(self, _cmd)
{
    return self._maxValue;
}
,["double"]), new objj_method(sel_getUid("increment"), function $NSStepperCell__increment(self, _cmd)
{
    return self._increment;
}
,["double"]), new objj_method(sel_getUid("valueWraps"), function $NSStepperCell__valueWraps(self, _cmd)
{
    return self._valueWraps;
}
,["BOOL"]), new objj_method(sel_getUid("autorepeat"), function $NSStepperCell__autorepeat(self, _cmd)
{
    return self._autorepeat;
}
,["BOOL"]), new objj_method(sel_getUid("initWithCoder:"), function $NSStepperCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSStepperCell").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._objectValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSValue");
        self._minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSMinValue");
        self._maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSMaxValue");
        self._increment = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSIncrement");
        self._valueWraps = objj_msgSend(aCoder, "decodeBoolForKey:", "NSValueWraps");
        self._autorepeat = objj_msgSend(aCoder, "decodeBoolForKey:", "NSAutorepeat");
    }
    return self;
}
,["id","CPCoder"])]);
}