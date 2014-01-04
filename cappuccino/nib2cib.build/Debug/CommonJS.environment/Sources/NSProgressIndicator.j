@STATIC;1.0;I;28;AppKit/CPProgressIndicator.jt;2375;objj_executeFile("AppKit/CPProgressIndicator.j", NO);

var NSProgressIndicatorSpinningFlag = 1 << 12;

{
var the_class = objj_getClass("CPProgressIndicator")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPProgressIndicator\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPProgressIndicator__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPProgressIndicator").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        var NS_flags = objj_msgSend(aCoder, "decodeIntForKey:", "NSpiFlags");

        _minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSMinValue");
        _maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSMaxValue");

        _style = (NS_flags & NSProgressIndicatorSpinningFlag) ? CPProgressIndicatorSpinningStyle : CPProgressIndicatorBarStyle;
        _isIndeterminate = (NS_flags & 2) ? YES : NO;
        _isDisplayedWhenStopped = (NS_flags & 8192) ? NO : YES;
        _controlSize = (NS_flags & 256) ? CPSmallControlSize : CPRegularControlSize;

        if (_style === CPProgressIndicatorSpinningStyle)
        {


            _controlSize = _controlSize == CPRegularControlSize ? CPSmallControlSize : CPMiniControlSize;
        }



        _doubleValue = 0.0;


        var currentFrameSize = objj_msgSend(self, "frameSize");
        if (_style !== CPProgressIndicatorSpinningStyle)
            currentFrameSize.height = 15.0;

        objj_msgSend(self, "setFrameSize:", currentFrameSize);


        objj_msgSend(self, "updateBackgroundColor");
        objj_msgSend(self, "drawBar");
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPProgressIndicator, "NSProgressIndicator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSProgressIndicator__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSProgressIndicator__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPProgressIndicator, "class");
}
},["Class"])]);
}

