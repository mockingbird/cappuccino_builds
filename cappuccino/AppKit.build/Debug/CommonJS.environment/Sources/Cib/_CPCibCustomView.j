@STATIC;1.0;i;8;CPView.jt;4196;objj_executeFile("CPView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPCibCustomView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("customClassName"), function $_CPCibCustomView__customClassName(self, _cmd)
{
    return self._className;
}
,["CPString"]), new objj_method(sel_getUid("setCustomClassName:"), function $_CPCibCustomView__setCustomClassName_(self, _cmd, aClassName)
{
    if (self._className === aClassName)
        return;
    self._className = aClassName;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPString"])]);
}var _CPCibCustomViewClassNameKey = "_CPCibCustomViewClassNameKey";
{
var the_class = objj_getClass("_CPCibCustomView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibCustomView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPCibCustomView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibCustomView").super_class }, "initWithCoder:", aCoder);
    if (self)
        self._className = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibCustomViewClassNameKey));
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibCustomView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibCustomView").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._className, _CPCibCustomViewClassNameKey));
}
,["void","CPCoder"]), new objj_method(sel_getUid("customClassName"), function $_CPCibCustomView__customClassName(self, _cmd)
{
    return self._className;
}
,["CPString"]), new objj_method(sel_getUid("_cibInstantiate"), function $_CPCibCustomView___cibInstantiate(self, _cmd)
{
    var theClass = CPClassFromString(self._className);
    if (!theClass)
    {
        CPLog("Unknown class \"" + self._className + "\" in cib file, using CPView instead.");
        theClass = CPView.isa.objj_msgSend0(CPView, "class");
    }
    if (theClass === self.isa.objj_msgSend0(self, "class"))
    {
        self._className = "CPView";
        return self;
    }
    var view = ((___r1 = (theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", self.isa.objj_msgSend0(self, "frame")));
    if (view)
    {
        (view == null ? null : view.isa.objj_msgSend1(view, "setBounds:", self.isa.objj_msgSend0(self, "bounds")));
        var subviews = self.isa.objj_msgSend0(self, "subviews"),
            index = 0,
            count = subviews.length;
        for (; index < count; ++index)
            (view == null ? null : view.isa.objj_msgSend1(view, "addSubview:", subviews[index]));
        (view == null ? null : view.isa.objj_msgSend1(view, "setAutoresizingMask:", self.isa.objj_msgSend0(self, "autoresizingMask")));
        (view == null ? null : view.isa.objj_msgSend1(view, "setAutoresizesSubviews:", self.isa.objj_msgSend0(self, "autoresizesSubviews")));
        (view == null ? null : view.isa.objj_msgSend1(view, "setHitTests:", self.isa.objj_msgSend0(self, "hitTests")));
        (view == null ? null : view.isa.objj_msgSend1(view, "setHidden:", self.isa.objj_msgSend0(self, "isHidden")));
        (view == null ? null : view.isa.objj_msgSend1(view, "setAlphaValue:", self.isa.objj_msgSend0(self, "alphaValue")));
        (view == null ? null : view.isa.objj_msgSend1(view, "setIdentifier:", self.isa.objj_msgSend0(self, "identifier")));
        ((___r1 = self._superview), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "replaceSubview:with:", self, view));
        (view == null ? null : view.isa.objj_msgSend1(view, "setBackgroundColor:", self.isa.objj_msgSend0(self, "backgroundColor")));
    }
    return view;
    var ___r1;
}
,["id"])]);
}