@STATIC;1.0;I;21;Foundation/CPBundle.ji;12;CGGeometry.ji;9;CPImage.ji;8;CPView.jt;6113;objj_executeFile("Foundation/CPBundle.j", NO);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPView.j", YES);CPLightShadow = 0;
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
        objj_msgSend(self, "setWeight:", CPLightShadow);
        objj_msgSend(self, "setHitTests:", NO);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setWeight:"), function $CPShadowView__setWeight_(self, _cmd, aWeight)
{
    if (self._weight == aWeight)
        return;
    self._weight = aWeight;
    if (self._weight == CPLightShadow)
        objj_msgSend(self, "setThemeState:", CPThemeStateShadowViewLight);
    else
        objj_msgSend(self, "setThemeState:", CPThemeStateShadowViewHeavy);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPShadowWeight"]), new objj_method(sel_getUid("leftInset"), function $CPShadowView__leftInset(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset").left;
}
,["float"]), new objj_method(sel_getUid("rightInset"), function $CPShadowView__rightInset(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset").right;
}
,["float"]), new objj_method(sel_getUid("topInset"), function $CPShadowView__topInset(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset").top;
}
,["float"]), new objj_method(sel_getUid("bottomInset"), function $CPShadowView__bottomInset(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset").bottom;
}
,["float"]), new objj_method(sel_getUid("horizontalInset"), function $CPShadowView__horizontalInset(self, _cmd)
{
    var currentContentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset");
    return currentContentInset.left + currentContentInset.right;
}
,["float"]), new objj_method(sel_getUid("verticalInset"), function $CPShadowView__verticalInset(self, _cmd)
{
    var currentContentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset");
    return currentContentInset.top + currentContentInset.bottom;
}
,["float"]), new objj_method(sel_getUid("frameForContentFrame:"), function $CPShadowView__frameForContentFrame_(self, _cmd, aFrame)
{
    return objj_msgSend(objj_msgSend(self, "class"), "frameForContentFrame:withWeight:", aFrame, self._weight);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("setFrameForContentFrame:"), function $CPShadowView__setFrameForContentFrame_(self, _cmd, aFrame)
{
    objj_msgSend(self, "setFrame:", objj_msgSend(self, "frameForContentFrame:", aFrame));
}
,["void","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPShadowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPShadowView").super_class }, "layoutSubviews");
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-color"));
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPShadowView__defaultThemeClass(self, _cmd)
{
    return "shadow-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPShadowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "bezel-color", CGInsetMakeZero(), "content-inset");
}
,["CPDictionary"]), new objj_method(sel_getUid("frameForContentFrame:withWeight:"), function $CPShadowView__frameForContentFrame_withWeight_(self, _cmd, aFrame, aWeight)
{
    var shadowView = objj_msgSend(CPShadowView, "new"),
        inset = objj_msgSend(shadowView, "valueForThemeAttribute:inState:", "content-inset", aWeight == CPLightShadow ? CPThemeStateShadowViewLight : CPThemeStateShadowViewHeavy);
    return CGRectMake(CGRectGetMinX(aFrame) - inset.left, CGRectGetMinY(aFrame) - inset.top, CGRectGetWidth(aFrame) + inset.left + inset.right, CGRectGetHeight(aFrame) + inset.top + inset.bottom);
}
,["CGRect","CGRect","CPShadowWeight"]), new objj_method(sel_getUid("shadowViewEnclosingView:"), function $CPShadowView__shadowViewEnclosingView_(self, _cmd, aView)
{
    return objj_msgSend(self, "shadowViewEnclosingView:withWeight:", aView, CPLightShadow);
}
,["id","CPView"]), new objj_method(sel_getUid("shadowViewEnclosingView:withWeight:"), function $CPShadowView__shadowViewEnclosingView_withWeight_(self, _cmd, aView, aWeight)
{
    var shadowView = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFrame:", objj_msgSend(aView, "frame"));
    if (shadowView)
    {
        objj_msgSend(shadowView, "setWeight:", aWeight);
        var size = objj_msgSend(shadowView, "frame").size,
            inset = objj_msgSend(shadowView, "currentValueForThemeAttribute:", "content-inset"),
            width = size.width - inset.left - inset.right,
            height = size.height - inset.top - inset.bottom,
            enclosingView = objj_msgSend(aView, "superview");
        objj_msgSend(shadowView, "setHitTests:", objj_msgSend(aView, "hitTests"));
        objj_msgSend(shadowView, "setAutoresizingMask:", objj_msgSend(aView, "autoresizingMask"));
        objj_msgSend(aView, "removeFromSuperview");
        objj_msgSend(shadowView, "addSubview:", aView);
        objj_msgSend(aView, "setFrame:", CGRectMake(inset.left, inset.top, width, height));
        objj_msgSend(enclosingView, "addSubview:", shadowView);
    }
    return shadowView;
}
,["id","CPView","CPShadowWeight"])]);
}