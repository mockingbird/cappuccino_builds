@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;23;CAMediaTimingFunction.jt;5561;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CAMediaTimingFunction.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CAAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isRemovedOnCompletion"), new objj_ivar("_delegate")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CAAnimation__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CAAnimation").super_class }, "init");
    if (self)
        self._isRemovedOnCompletion = YES;
    return self;
}
,["id"]), new objj_method(sel_getUid("shouldArchiveValueForKey:"), function $CAAnimation__shouldArchiveValueForKey_(self, _cmd, aKey)
{
    return YES;
}
,["void","CPString"]), new objj_method(sel_getUid("setRemovedOnCompletion:"), function $CAAnimation__setRemovedOnCompletion_(self, _cmd, isRemovedOnCompletion)
{
    self._isRemovedOnCompletion = isRemovedOnCompletion;
}
,["void","BOOL"]), new objj_method(sel_getUid("removedOnCompletion"), function $CAAnimation__removedOnCompletion(self, _cmd)
{
    return self._isRemovedOnCompletion;
}
,["BOOL"]), new objj_method(sel_getUid("isRemovedOnCompletion"), function $CAAnimation__isRemovedOnCompletion(self, _cmd)
{
    return self._isRemovedOnCompletion;
}
,["BOOL"]), new objj_method(sel_getUid("timingFunction"), function $CAAnimation__timingFunction(self, _cmd)
{
    return nil;
}
,["CAMediaTimingFunction"]), new objj_method(sel_getUid("setDelegate:"), function $CAAnimation__setDelegate_(self, _cmd, aDelegate)
{
    self._delegate = aDelegate;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CAAnimation__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("runActionForKey:object:arguments:"), function $CAAnimation__runActionForKey_object_arguments_(self, _cmd, aKey, anObject, arguments)
{
    (anObject == null ? null : anObject.isa.objj_msgSend2(anObject, "addAnimation:forKey:", self, aKey));
}
,["void","CPString","id","CPDictionary"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("animation"), function $CAAnimation__animation(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("defaultValueForKey:"), function $CAAnimation__defaultValueForKey_(self, _cmd, aKey)
{
    return nil;
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(CAAnimation, "CAPropertyAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyPath"), new objj_ivar("_isCumulative"), new objj_ivar("_isAdditive")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setKeyPath:"), function $CAPropertyAnimation__setKeyPath_(self, _cmd, aKeyPath)
{
    self._keyPath = aKeyPath;
}
,["void","CPString"]), new objj_method(sel_getUid("keyPath"), function $CAPropertyAnimation__keyPath(self, _cmd)
{
    return self._keyPath;
}
,["CPString"]), new objj_method(sel_getUid("setCumulative:"), function $CAPropertyAnimation__setCumulative_(self, _cmd, isCumulative)
{
    self._isCumulative = isCumulative;
}
,["void","BOOL"]), new objj_method(sel_getUid("cumulative"), function $CAPropertyAnimation__cumulative(self, _cmd)
{
    return self._isCumulative;
}
,["BOOL"]), new objj_method(sel_getUid("isCumulative"), function $CAPropertyAnimation__isCumulative(self, _cmd)
{
    return self._isCumulative;
}
,["BOOL"]), new objj_method(sel_getUid("setAdditive:"), function $CAPropertyAnimation__setAdditive_(self, _cmd, isAdditive)
{
    self._isAdditive = isAdditive;
}
,["void","BOOL"]), new objj_method(sel_getUid("additive"), function $CAPropertyAnimation__additive(self, _cmd)
{
    return self._isAdditive;
}
,["BOOL"]), new objj_method(sel_getUid("isAdditive"), function $CAPropertyAnimation__isAdditive(self, _cmd)
{
    return self._isAdditive;
}
,["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("animationWithKeyPath:"), function $CAPropertyAnimation__animationWithKeyPath_(self, _cmd, aKeyPath)
{
    var animation = self.isa.objj_msgSend0(self, "animation");
    (animation == null ? null : animation.isa.objj_msgSend1(animation, "setKeyPath:", aKeyPath));
    return animation;
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(CAPropertyAnimation, "CABasicAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fromValue"), new objj_ivar("_toValue"), new objj_ivar("_byValue")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setFromValue:"), function $CABasicAnimation__setFromValue_(self, _cmd, aValue)
{
    self._fromValue = aValue;
}
,["void","id"]), new objj_method(sel_getUid("fromValue"), function $CABasicAnimation__fromValue(self, _cmd)
{
    return self._fromValue;
}
,["id"]), new objj_method(sel_getUid("setToValue:"), function $CABasicAnimation__setToValue_(self, _cmd, aValue)
{
    self._toValue = aValue;
}
,["void","id"]), new objj_method(sel_getUid("toValue"), function $CABasicAnimation__toValue(self, _cmd)
{
    return self._toValue;
}
,["id"]), new objj_method(sel_getUid("setByValue:"), function $CABasicAnimation__setByValue_(self, _cmd, aValue)
{
    self._byValue = aValue;
}
,["void","id"]), new objj_method(sel_getUid("byValue"), function $CABasicAnimation__byValue(self, _cmd)
{
    return self._byValue;
}
,["id"])]);
}