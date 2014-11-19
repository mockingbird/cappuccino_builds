@STATIC;1.0;I;21;Foundation/CPBundle.ji;12;CGGeometry.ji;9;CPImage.ji;8;CPView.jt;7097;objj_executeFile("Foundation/CPBundle.j", NO);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPView.j", YES);CPLightShadow = 0;
CPHeavyShadow = 1;
CPThemeStateShadowViewLight = CPThemeState("shadowview-style-light");
CPThemeStateShadowViewHeavy = CPThemeState("shadowview-style-heavy");
{var the_class = objj_allocateClassPair(CPView, "CPShadowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_weight")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPShadowView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPShadowView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setWeight:", CPLightShadow));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHitTests:", NO));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setWeight:"), function $CPShadowView__setWeight_(self, _cmd, aWeight)
{
    if (self._weight == aWeight)
        return;
    self._weight = aWeight;
    if (self._weight == CPLightShadow)
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateShadowViewLight);
    else
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateShadowViewHeavy);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPShadowWeight"]), new objj_method(sel_getUid("leftInset"), function $CPShadowView__leftInset(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset").left;
}
,["float"]), new objj_method(sel_getUid("rightInset"), function $CPShadowView__rightInset(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset").right;
}
,["float"]), new objj_method(sel_getUid("topInset"), function $CPShadowView__topInset(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset").top;
}
,["float"]), new objj_method(sel_getUid("bottomInset"), function $CPShadowView__bottomInset(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset").bottom;
}
,["float"]), new objj_method(sel_getUid("horizontalInset"), function $CPShadowView__horizontalInset(self, _cmd)
{
    var currentContentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset");
    return currentContentInset.left + currentContentInset.right;
}
,["float"]), new objj_method(sel_getUid("verticalInset"), function $CPShadowView__verticalInset(self, _cmd)
{
    var currentContentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset");
    return currentContentInset.top + currentContentInset.bottom;
}
,["float"]), new objj_method(sel_getUid("frameForContentFrame:"), function $CPShadowView__frameForContentFrame_(self, _cmd, aFrame)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "frameForContentFrame:withWeight:", aFrame, self._weight));
    var ___r1;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("setFrameForContentFrame:"), function $CPShadowView__setFrameForContentFrame_(self, _cmd, aFrame)
{
    self.isa.objj_msgSend1(self, "setFrame:", self.isa.objj_msgSend1(self, "frameForContentFrame:", aFrame));
}
,["void","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPShadowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPShadowView").super_class }, "layoutSubviews");
    self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-color"));
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPShadowView__defaultThemeClass(self, _cmd)
{
    return "shadow-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPShadowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-color", CGInsetMakeZero(), "content-inset");
}
,["CPDictionary"]), new objj_method(sel_getUid("frameForContentFrame:withWeight:"), function $CPShadowView__frameForContentFrame_withWeight_(self, _cmd, aFrame, aWeight)
{
    var shadowView = CPShadowView.isa.objj_msgSend0(CPShadowView, "new"),
        inset = (shadowView == null ? null : shadowView.isa.objj_msgSend2(shadowView, "valueForThemeAttribute:inState:", "content-inset", aWeight == CPLightShadow ? CPThemeStateShadowViewLight : CPThemeStateShadowViewHeavy));
    return CGRectMake(CGRectGetMinX(aFrame) - inset.left, CGRectGetMinY(aFrame) - inset.top, CGRectGetWidth(aFrame) + inset.left + inset.right, CGRectGetHeight(aFrame) + inset.top + inset.bottom);
}
,["CGRect","CGRect","CPShadowWeight"]), new objj_method(sel_getUid("shadowViewEnclosingView:"), function $CPShadowView__shadowViewEnclosingView_(self, _cmd, aView)
{
    return self.isa.objj_msgSend2(self, "shadowViewEnclosingView:withWeight:", aView, CPLightShadow);
}
,["id","CPView"]), new objj_method(sel_getUid("shadowViewEnclosingView:withWeight:"), function $CPShadowView__shadowViewEnclosingView_withWeight_(self, _cmd, aView, aWeight)
{
    var shadowView = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", (aView == null ? null : aView.isa.objj_msgSend0(aView, "frame"))));
    if (shadowView)
    {
        (shadowView == null ? null : shadowView.isa.objj_msgSend1(shadowView, "setWeight:", aWeight));
        var size = (shadowView == null ? null : shadowView.isa.objj_msgSend0(shadowView, "frame")).size,
            inset = (shadowView == null ? null : shadowView.isa.objj_msgSend1(shadowView, "currentValueForThemeAttribute:", "content-inset")),
            width = size.width - inset.left - inset.right,
            height = size.height - inset.top - inset.bottom,
            enclosingView = (aView == null ? null : aView.isa.objj_msgSend0(aView, "superview"));
        (shadowView == null ? null : shadowView.isa.objj_msgSend1(shadowView, "setHitTests:", (aView == null ? null : aView.isa.objj_msgSend0(aView, "hitTests"))));
        (shadowView == null ? null : shadowView.isa.objj_msgSend1(shadowView, "setAutoresizingMask:", (aView == null ? null : aView.isa.objj_msgSend0(aView, "autoresizingMask"))));
        (aView == null ? null : aView.isa.objj_msgSend0(aView, "removeFromSuperview"));
        (shadowView == null ? null : shadowView.isa.objj_msgSend1(shadowView, "addSubview:", aView));
        (aView == null ? null : aView.isa.objj_msgSend1(aView, "setFrame:", CGRectMake(inset.left, inset.top, width, height)));
        (enclosingView == null ? null : enclosingView.isa.objj_msgSend1(enclosingView, "addSubview:", shadowView));
    }
    return shadowView;
    var ___r1;
}
,["id","CPView","CPShadowWeight"])]);
}