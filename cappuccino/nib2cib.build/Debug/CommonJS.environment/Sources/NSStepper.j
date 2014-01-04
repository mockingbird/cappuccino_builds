@STATIC;1.0;I;18;AppKit/CPStepper.jt;3430;objj_executeFile("AppKit/CPStepper.j", NO);

{
var the_class = objj_getClass("CPStepper")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPStepper\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPStepper__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPStepper").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");

        _minValue = objj_msgSend(cell, "minValue");
        _maxValue = objj_msgSend(cell, "maxValue");
        _increment = objj_msgSend(cell, "increment");
        _valueWraps = objj_msgSend(cell, "valueWraps");
        _autorepeat = objj_msgSend(cell, "autorepeat");
        _objectValue = objj_msgSend(cell, "objectValue");


        _frame.origin.y += 2;
        _frame.size.height -= 2;
        _bounds.size.height -= 2;
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPStepper, "NSStepper"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSStepper__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSStepper__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPStepper, "class");
}
},["Class"])]);
}

{var the_class = objj_allocateClassPair(NSCell, "NSStepperCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_increment"), new objj_ivar("_valueWraps"), new objj_ivar("_autorepeat")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("minValue"), function $NSStepperCell__minValue(self, _cmd)
{ with(self)
{
return _minValue;
}
},["id"]),
new objj_method(sel_getUid("maxValue"), function $NSStepperCell__maxValue(self, _cmd)
{ with(self)
{
return _maxValue;
}
},["id"]),
new objj_method(sel_getUid("increment"), function $NSStepperCell__increment(self, _cmd)
{ with(self)
{
return _increment;
}
},["id"]),
new objj_method(sel_getUid("valueWraps"), function $NSStepperCell__valueWraps(self, _cmd)
{ with(self)
{
return _valueWraps;
}
},["id"]),
new objj_method(sel_getUid("autorepeat"), function $NSStepperCell__autorepeat(self, _cmd)
{ with(self)
{
return _autorepeat;
}
},["id"]), new objj_method(sel_getUid("initWithCoder:"), function $NSStepperCell__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSStepperCell").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        _objectValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSValue");

        _minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSMinValue");
        _maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSMaxValue");
        _increment = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSIncrement");
        _valueWraps = objj_msgSend(aCoder, "decodeBoolForKey:", "NSValueWraps");
        _autorepeat = objj_msgSend(aCoder, "decodeBoolForKey:", "NSAutorepeat");
    }

    return self;
}
},["id","CPCoder"])]);
}

