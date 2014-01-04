@STATIC;1.0;I;25;AppKit/CPLevelIndicator.jt;5160;objj_executeFile("AppKit/CPLevelIndicator.j", NO);

{
var the_class = objj_getClass("CPLevelIndicator")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPLevelIndicator\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPLevelIndicator__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    var cell = objj_msgSend(aCoder, "decodeObjectForKey:", "NSCell");


    _minValue = objj_msgSend(cell, "minValue");
    _maxValue = objj_msgSend(cell, "maxValue");

    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPLevelIndicator").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        self = objj_msgSend(self, "NS_initWithCell:", cell);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("NS_initWithCell:"), function $CPLevelIndicator__NS_initWithCell_(self, _cmd, cell)
{ with(self)
{
    _minValue = objj_msgSend(cell, "minValue");
    _maxValue = objj_msgSend(cell, "maxValue");
    _levelIndicatorStyle = objj_msgSend(cell, "levelIndicatorStyle");
    _warningValue = objj_msgSend(cell, "warningValue");
    _criticalValue = objj_msgSend(cell, "criticalValue");
    _tickMarkPosition = objj_msgSend(cell, "tickMarkPosition");
    _numberOfTickMarks = objj_msgSend(cell, "numberOfTickMarks");
    _numberOfMajorTickMarks = objj_msgSend(cell, "numberOfMajorTickMarks");

    objj_msgSend(self, "setEditable:", objj_msgSend(cell, "isEditable"));
    objj_msgSend(self, "setEnabled:", objj_msgSend(cell, "isEnabled"));
    objj_msgSend(self, "setContinuous:", objj_msgSend(cell, "isContinuous"));

    return self;
}
},["id","NSCell"])]);
}

{var the_class = objj_allocateClassPair(CPLevelIndicator, "NSLevelIndicator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSLevelIndicator__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSLevelIndicator__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPLevelIndicator, "class");
}
},["Class"])]);
}

{var the_class = objj_allocateClassPair(NSCell, "NSLevelIndicatorCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_levelIndicatorStyle"), new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_warningValue"), new objj_ivar("_criticalValue"), new objj_ivar("_tickMarkPosition"), new objj_ivar("_numberOfTickMarks"), new objj_ivar("_numberOfMajorTickMarks")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("levelIndicatorStyle"), function $NSLevelIndicatorCell__levelIndicatorStyle(self, _cmd)
{ with(self)
{
return _levelIndicatorStyle;
}
},["id"]),
new objj_method(sel_getUid("minValue"), function $NSLevelIndicatorCell__minValue(self, _cmd)
{ with(self)
{
return _minValue;
}
},["id"]),
new objj_method(sel_getUid("maxValue"), function $NSLevelIndicatorCell__maxValue(self, _cmd)
{ with(self)
{
return _maxValue;
}
},["id"]),
new objj_method(sel_getUid("warningValue"), function $NSLevelIndicatorCell__warningValue(self, _cmd)
{ with(self)
{
return _warningValue;
}
},["id"]),
new objj_method(sel_getUid("criticalValue"), function $NSLevelIndicatorCell__criticalValue(self, _cmd)
{ with(self)
{
return _criticalValue;
}
},["id"]),
new objj_method(sel_getUid("tickMarkPosition"), function $NSLevelIndicatorCell__tickMarkPosition(self, _cmd)
{ with(self)
{
return _tickMarkPosition;
}
},["id"]),
new objj_method(sel_getUid("numberOfTickMarks"), function $NSLevelIndicatorCell__numberOfTickMarks(self, _cmd)
{ with(self)
{
return _numberOfTickMarks;
}
},["id"]),
new objj_method(sel_getUid("numberOfMajorTickMarks"), function $NSLevelIndicatorCell__numberOfMajorTickMarks(self, _cmd)
{ with(self)
{
return _numberOfMajorTickMarks;
}
},["id"]), new objj_method(sel_getUid("initWithCoder:"), function $NSLevelIndicatorCell__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NSLevelIndicatorCell").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        _objectValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSValue");

        _minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSMinValue");
        _maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSMaxValue");
        _warningValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSWarningValue");
        _criticalValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSCriticalValue");

        _levelIndicatorStyle = objj_msgSend(aCoder, "decodeIntForKey:", "NSIndicatorStyle");


        _tickMarkPosition = objj_msgSend(aCoder, "decodeIntForKey:", "NSTickMarkPosition");
        _numberOfTickMarks = objj_msgSend(aCoder, "decodeIntForKey:", "NSNumberOfTickMarks");
        _numberOfTickMarks = objj_msgSend(aCoder, "decodeIntForKey:", "NSNumberOfMajorTickMarks");
    }

    return self;
}
},["id","CPCoder"])]);
}

