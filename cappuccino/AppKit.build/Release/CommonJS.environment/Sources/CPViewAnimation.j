@STATIC;1.0;i;13;CPAnimation.jt;9206;objj_executeFile("CPAnimation.j", YES);CPViewAnimationTargetKey = "CPViewAnimationTargetKey";
CPViewAnimationStartFrameKey = "CPViewAnimationStartFrameKey";
CPViewAnimationEndFrameKey = "CPViewAnimationEndFrameKey";
CPViewAnimationEffectKey = "CPViewAnimationEffectKey";
CPViewAnimationFadeInEffect = "CPViewAnimationFadeInEffect";
CPViewAnimationFadeOutEffect = "CPViewAnimationFadeOutEffect";
{var the_class = objj_allocateClassPair(CPAnimation, "CPViewAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_viewAnimations")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithViewAnimations:"), function $CPViewAnimation__initWithViewAnimations_(self, _cmd, viewAnimations)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPViewAnimation").super_class }, "initWithDuration:animationCurve:", 0.5, CPAnimationLinear))
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setViewAnimations:", viewAnimations));
    }
    return self;
}
,["id","CPArray"]), new objj_method(sel_getUid("startAnimation"), function $CPViewAnimation__startAnimation(self, _cmd)
{
    var animationIndex = ((___r1 = self._viewAnimations), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (animationIndex--)
    {
        var dictionary = ((___r1 = self._viewAnimations), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", animationIndex)),
            view = self.isa.objj_msgSend1(self, "_targetView:", dictionary),
            startFrame = self.isa.objj_msgSend1(self, "_startFrame:", dictionary);
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrame:", startFrame));
        var effect = self.isa.objj_msgSend1(self, "_effect:", dictionary);
        if (effect === CPViewAnimationFadeInEffect)
        {
            (view == null ? null : view.isa.objj_msgSend1(view, "setAlphaValue:", 0.0));
            self.isa.objj_msgSend2(self, "_targetView:setHidden:", view, NO);
        }
        else if (effect === CPViewAnimationFadeOutEffect)
            (view == null ? null : view.isa.objj_msgSend1(view, "setAlphaValue:", 1.0));
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPViewAnimation").super_class }, "startAnimation");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setCurrentProgress:"), function $CPViewAnimation__setCurrentProgress_(self, _cmd, progress)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPViewAnimation").super_class }, "setCurrentProgress:", progress);
    var animationIndex = ((___r1 = self._viewAnimations), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (animationIndex--)
    {
        var dictionary = ((___r1 = self._viewAnimations), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", animationIndex)),
            view = self.isa.objj_msgSend1(self, "_targetView:", dictionary),
            startFrame = self.isa.objj_msgSend1(self, "_startFrame:", dictionary),
            endFrame = self.isa.objj_msgSend1(self, "_endFrame:", dictionary),
            differenceFrame = CGRectMakeZero(),
            value = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPViewAnimation").super_class }, "currentValue");
        differenceFrame.origin.x = endFrame.origin.x - startFrame.origin.x;
        differenceFrame.origin.y = endFrame.origin.y - startFrame.origin.y;
        differenceFrame.size.width = endFrame.size.width - startFrame.size.width;
        differenceFrame.size.height = endFrame.size.height - startFrame.size.height;
        var intermediateFrame = CGRectMakeZero();
        intermediateFrame.origin.x = startFrame.origin.x + differenceFrame.origin.x * value;
        intermediateFrame.origin.y = startFrame.origin.y + differenceFrame.origin.y * value;
        intermediateFrame.size.width = startFrame.size.width + differenceFrame.size.width * value;
        intermediateFrame.size.height = startFrame.size.height + differenceFrame.size.height * value;
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrame:", intermediateFrame));
        var effect = self.isa.objj_msgSend1(self, "_effect:", dictionary);
        if (effect === CPViewAnimationFadeInEffect)
            (view == null ? null : view.isa.objj_msgSend1(view, "setAlphaValue:", 1.0 * value));
        else if (effect === CPViewAnimationFadeOutEffect)
            (view == null ? null : view.isa.objj_msgSend1(view, "setAlphaValue:", 1.0 + (0.0 - 1.0) * value));
        if (progress === 1.0)
            self.isa.objj_msgSend2(self, "_targetView:setHidden:", view, CGRectIsEmpty(endFrame) || (view == null ? null : view.isa.objj_msgSend0(view, "alphaValue")) === 0.0);
    }
    var ___r1;
}
,["void","float"]), new objj_method(sel_getUid("stopAnimation"), function $CPViewAnimation__stopAnimation(self, _cmd)
{
    var animationIndex = ((___r1 = self._viewAnimations), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (animationIndex--)
    {
        var dictionary = ((___r1 = self._viewAnimations), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", animationIndex)),
            view = self.isa.objj_msgSend1(self, "_targetView:", dictionary),
            endFrame = self.isa.objj_msgSend1(self, "_endFrame:", dictionary);
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrame:", endFrame));
        var effect = self.isa.objj_msgSend1(self, "_effect:", dictionary);
        if (effect === CPViewAnimationFadeInEffect)
            (view == null ? null : view.isa.objj_msgSend1(view, "setAlphaValue:", 1.0));
        else if (effect === CPViewAnimationFadeOutEffect)
            (view == null ? null : view.isa.objj_msgSend1(view, "setAlphaValue:", 0.0));
        self.isa.objj_msgSend2(self, "_targetView:setHidden:", view, CGRectIsEmpty(endFrame) || (view == null ? null : view.isa.objj_msgSend0(view, "alphaValue")) === 0.0);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPViewAnimation").super_class }, "stopAnimation");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_targetView:setHidden:"), function $CPViewAnimation___targetView_setHidden_(self, _cmd, theView, isHidden)
{
    if ((theView == null ? null : theView.isa.objj_msgSend1(theView, "isKindOfClass:", (CPWindow == null ? null : CPWindow.isa.objj_msgSend0(CPWindow, "class")))))
    {
        if (isHidden)
            (theView == null ? null : theView.isa.objj_msgSend1(theView, "orderOut:", self));
        else
            (theView == null ? null : theView.isa.objj_msgSend1(theView, "orderFront:", self));
    }
    else
        (theView == null ? null : theView.isa.objj_msgSend1(theView, "setHidden:", isHidden));
}
,["void","id","BOOL"]), new objj_method(sel_getUid("_targetView:"), function $CPViewAnimation___targetView_(self, _cmd, dictionary)
{
    var targetView = (dictionary == null ? null : dictionary.isa.objj_msgSend1(dictionary, "valueForKey:", CPViewAnimationTargetKey));
    if (!targetView)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "view animation: %@ does not have a target view", (dictionary == null ? null : dictionary.isa.objj_msgSend0(dictionary, "description"))));
    return targetView;
}
,["id","CPDictionary"]), new objj_method(sel_getUid("_startFrame:"), function $CPViewAnimation___startFrame_(self, _cmd, dictionary)
{
    var startFrame = (dictionary == null ? null : dictionary.isa.objj_msgSend1(dictionary, "valueForKey:", CPViewAnimationStartFrameKey));
    if (!startFrame)
        return ((___r1 = self.isa.objj_msgSend1(self, "_targetView:", dictionary)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    return startFrame;
    var ___r1;
}
,["CGRect","CPDictionary"]), new objj_method(sel_getUid("_endFrame:"), function $CPViewAnimation___endFrame_(self, _cmd, dictionary)
{
    var endFrame = (dictionary == null ? null : dictionary.isa.objj_msgSend1(dictionary, "valueForKey:", CPViewAnimationEndFrameKey));
    if (!endFrame)
        return ((___r1 = self.isa.objj_msgSend1(self, "_targetView:", dictionary)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    return endFrame;
    var ___r1;
}
,["CGRect","CPDictionary"]), new objj_method(sel_getUid("_effect:"), function $CPViewAnimation___effect_(self, _cmd, dictionary)
{
    return (dictionary == null ? null : dictionary.isa.objj_msgSend1(dictionary, "valueForKey:", CPViewAnimationEffectKey));
}
,["CPString","CPDictionary"]), new objj_method(sel_getUid("viewAnimations"), function $CPViewAnimation__viewAnimations(self, _cmd)
{
    return self._viewAnimations;
}
,["CPArray"]), new objj_method(sel_getUid("setViewAnimations:"), function $CPViewAnimation__setViewAnimations_(self, _cmd, viewAnimations)
{
    if (viewAnimations != self._viewAnimations)
    {
        self.isa.objj_msgSend0(self, "stopAnimation");
        self._viewAnimations = (viewAnimations == null ? null : viewAnimations.isa.objj_msgSend0(viewAnimations, "copy"));
    }
}
,["void","CPArray"])]);
}