@STATIC;1.0;i;8;CPView.jt;3509;objj_executeFile("CPView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPCibCustomView"),
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
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
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
        self._className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomViewClassNameKey);
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibCustomView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibCustomView").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._className, _CPCibCustomViewClassNameKey);
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
        theClass = objj_msgSend(CPView, "class");
    }
    if (theClass === objj_msgSend(self, "class"))
    {
        self._className = "CPView";
        return self;
    }
    var view = objj_msgSend(objj_msgSend(theClass, "alloc"), "initWithFrame:", objj_msgSend(self, "frame"));
    if (view)
    {
        objj_msgSend(view, "setBounds:", objj_msgSend(self, "bounds"));
        var subviews = objj_msgSend(self, "subviews"),
            index = 0,
            count = subviews.length;
        for (; index < count; ++index)
            objj_msgSend(view, "addSubview:", subviews[index]);
        objj_msgSend(view, "setAutoresizingMask:", objj_msgSend(self, "autoresizingMask"));
        objj_msgSend(view, "setAutoresizesSubviews:", objj_msgSend(self, "autoresizesSubviews"));
        objj_msgSend(view, "setHitTests:", objj_msgSend(self, "hitTests"));
        objj_msgSend(view, "setHidden:", objj_msgSend(self, "isHidden"));
        objj_msgSend(view, "setAlphaValue:", objj_msgSend(self, "alphaValue"));
        objj_msgSend(view, "setIdentifier:", objj_msgSend(self, "identifier"));
        objj_msgSend(self._superview, "replaceSubview:with:", self, view);
        objj_msgSend(view, "setBackgroundColor:", objj_msgSend(self, "backgroundColor"));
    }
    return view;
}
,["id"])]);
}