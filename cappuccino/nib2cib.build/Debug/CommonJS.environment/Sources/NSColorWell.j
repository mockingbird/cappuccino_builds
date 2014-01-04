@STATIC;1.0;I;20;AppKit/CPColorWell.ji;8;NSCell.ji;11;NSControl.jt;1868;objj_executeFile("AppKit/CPColorWell.j", NO);

objj_executeFile("NSCell.j", YES);
objj_executeFile("NSControl.j", YES);


{
var the_class = objj_getClass("CPColorWell")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPColorWell\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPColorWell__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorWell").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {

        objj_msgSend(self, "setEnabled:", objj_msgSend(aCoder, "decodeBoolForKey:", "NSEnabled"));
        objj_msgSend(self, "setBordered:", objj_msgSend(aCoder, "decodeBoolForKey:", "NSIsBordered"));
        objj_msgSend(self, "setColor:", objj_msgSend(aCoder, "decodeObjectForKey:", "NSColor"));

        if (objj_msgSend(self, "isBordered"))
        {
            var frameSize = objj_msgSend(self, "frameSize");
            CPLog.debug("NSColorWell: adjusting height from %d to %d", frameSize.height, 24.0);
            frameSize.height = 24.0;
            objj_msgSend(self, "setFrameSize:", frameSize);


            _frame.origin.x -= 3;
        }
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPColorWell, "NSColorWell"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSColorWell__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSColorWell__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColorWell, "class");
}
},["Class"])]);
}

