@STATIC;1.0;I;21;Foundation/CPObject.ji;10;CPButton.ji;8;CPMenu.ji;9;CPPanel.jt;25085;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPButton.j", YES);objj_executeFile("CPMenu.j", YES);objj_executeFile("CPPanel.j", YES);CPClosableOnBlurWindowMask = 1 << 4;
CPPopoverAppearanceMinimal = 0;
CPPopoverAppearanceHUD = 1;
var _CPPopoverWindow_shouldClose_ = 1 << 4,
    _CPPopoverWindow_didClose_ = 1 << 5,
    _CPPopoverWindow_didShow_ = 1 << 6;
{var the_class = objj_allocateClassPair(CPPanel, "_CPPopoverWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_animates"), new objj_ivar("_targetView"), new objj_ivar("_appearance"), new objj_ivar("_isClosing"), new objj_ivar("_isOpening"), new objj_ivar("_closeOnBlur"), new objj_ivar("_browserAnimates"), new objj_ivar("_isObservingFrame"), new objj_ivar("_shouldPerformAnimation"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_targetWindow"), new objj_ivar("_orderOutTransitionFunction"), new objj_ivar("_transitionCompleteFunction"), new objj_ivar("_orderFrontTransitionFunction")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("animates"), function $_CPPopoverWindow__animates(self, _cmd)
{
    return self._animates;
}
,["BOOL"]), new objj_method(sel_getUid("setAnimates:"), function $_CPPopoverWindow__setAnimates_(self, _cmd, newValue)
{
    self._animates = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("targetView"), function $_CPPopoverWindow__targetView(self, _cmd)
{
    return self._targetView;
}
,["id"]), new objj_method(sel_getUid("setTargetView:"), function $_CPPopoverWindow__setTargetView_(self, _cmd, newValue)
{
    self._targetView = newValue;
}
,["void","id"]), new objj_method(sel_getUid("appearance"), function $_CPPopoverWindow__appearance(self, _cmd)
{
    return self._appearance;
}
,["int"]), new objj_method(sel_getUid("_setAppearance:"), function $_CPPopoverWindow___setAppearance_(self, _cmd, newValue)
{
    self._appearance = newValue;
}
,["void","int"]), new objj_method(sel_getUid("isClosing"), function $_CPPopoverWindow__isClosing(self, _cmd)
{
    return self._isClosing;
}
,["BOOL"]), new objj_method(sel_getUid("setIsClosing:"), function $_CPPopoverWindow__setIsClosing_(self, _cmd, newValue)
{
    self._isClosing = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("isOpening"), function $_CPPopoverWindow__isOpening(self, _cmd)
{
    return self._isOpening;
}
,["BOOL"]), new objj_method(sel_getUid("setIsOpening:"), function $_CPPopoverWindow__setIsOpening_(self, _cmd, newValue)
{
    self._isOpening = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("initWithContentRect:"), function $_CPPopoverWindow__initWithContentRect_(self, _cmd, aFrame)
{
    return self.isa.objj_msgSend2(self, "initWithContentRect:styleMask:", aFrame, 0);
}
,["id","CGRect"]), new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $_CPPopoverWindow__initWithContentRect_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopoverWindow").super_class }, "initWithContentRect:styleMask:", aFrame, aStyleMask))
    {
        self._animates = YES;
        self._isClosing = NO;
        self._browserAnimates = (self == null ? null : self.isa.objj_msgSend0(self, "browserSupportsAnimation"));
        self._shouldPerformAnimation = YES;
        self._orderOutTransitionFunction = function()
        {
            (self == null ? null : self.isa.objj_msgSend1(self, "_orderOutRecursively:", YES));
        };
        self._isOpening = YES;
        (self == null ? null : self.isa.objj_msgSend1(self, "setStyleMask:", aStyleMask));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBecomesKeyOnlyIfNeeded:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setMovableByWindowBackground:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHasShadow:", NO));
        (self == null ? null : self.isa.objj_msgSend2(self, "setCSS3Property:value:", "TransitionProperty", CPBrowserCSSProperty('transform') + ", opacity"));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    }
    return self;
    var ___r1;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("setAppearance:"), function $_CPPopoverWindow__setAppearance_(self, _cmd, anAppearance)
{
    if (self._appearance === anAppearance)
        return;
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAppearance:", anAppearance));
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("setStyleMask:"), function $_CPPopoverWindow__setStyleMask_(self, _cmd, aStyleMask)
{
    self._closeOnBlur = aStyleMask & CPClosableOnBlurWindowMask;
}
,["void","unsigned"]), new objj_method(sel_getUid("setDelegate:"), function $_CPPopoverWindow__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("_popoverWindowShouldClose:"))))
        self._implementedDelegateMethods |= _CPPopoverWindow_shouldClose_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("_popoverWindowDidClose:"))))
        self._implementedDelegateMethods |= _CPPopoverWindow_didClose_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("_popoverWindowDidShow:"))))
        self._implementedDelegateMethods |= _CPPopoverWindow_didShow_;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_addFrameObserver"), function $_CPPopoverWindow___addFrameObserver(self, _cmd)
{
    if (self._isObservingFrame)
        return;
    self._isObservingFrame = YES;
    ((___r1 = self._targetView), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, "frame", 0, nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_removeFrameObserver"), function $_CPPopoverWindow___removeFrameObserver(self, _cmd)
{
    if (!self._isObservingFrame)
        return;
    self._isObservingFrame = NO;
    ((___r1 = self._targetView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:forKeyPath:", self, "frame"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPPopoverWindow__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aPath, anObject, theChange, aContext)
{
    if (aPath === "frame")
    {
        if (!((___r1 = self._targetView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "window")))
            return;
        var point = self.isa.objj_msgSend3(self, "computeOriginFromRect:ofView:preferredEdge:", ((___r1 = self._targetView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")), self._targetView, ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "preferredEdge")));
        self.isa.objj_msgSend1(self, "setFrameOrigin:", point);
    }
    var ___r1;
}
,["void","CPString","id","CPDictionary","void"]), new objj_method(sel_getUid("computeOriginFromRect:ofView:preferredEdge:"), function $_CPPopoverWindow__computeOriginFromRect_ofView_preferredEdge_(self, _cmd, aRect, positioningView, anEdge)
{
    var mainWindow = (positioningView == null ? null : positioningView.isa.objj_msgSend0(positioningView, "window")),
        platformWindow = (mainWindow == null ? null : mainWindow.isa.objj_msgSend0(mainWindow, "platformWindow")),
        nativeRect = (platformWindow == null ? null : platformWindow.isa.objj_msgSend0(platformWindow, "usableContentFrame")),
        baseOrigin = (positioningView == null ? null : positioningView.isa.objj_msgSend1(positioningView, "convertPointToBase:", aRect.origin)),
        platformOrigin = (mainWindow == null ? null : mainWindow.isa.objj_msgSend1(mainWindow, "convertBaseToPlatformWindow:", baseOrigin)),
        platformRect = CGRectMake(platformOrigin.x, platformOrigin.y, aRect.size.width, aRect.size.height),
        originLeft = CGPointCreateCopy(platformOrigin),
        originRight = CGPointCreateCopy(platformOrigin),
        originTop = CGPointCreateCopy(platformOrigin),
        originBottom = CGPointCreateCopy(platformOrigin),
        frameSize = self.isa.objj_msgSend0(self, "frame").size;
    originRight.x += platformRect.size.width;
    originRight.y += platformRect.size.height / 2.0 - frameSize.height / 2.0;
    originLeft.x -= frameSize.width;
    originLeft.y += platformRect.size.height / 2.0 - frameSize.height / 2.0;
    originBottom.x += platformRect.size.width / 2.0 - frameSize.width / 2.0;
    originBottom.y += platformRect.size.height;
    originTop.x += platformRect.size.width / 2.0 - frameSize.width / 2.0;
    originTop.y -= frameSize.height;
    var requestedEdge = anEdge !== nil ? anEdge : CPMaxXEdge,
        requestedOrigin;
    switch(requestedEdge) {
    case CPMaxXEdge:
        requestedOrigin = originRight;
        break;
    case CPMinXEdge:
        requestedOrigin = originLeft;
        break;
    case CPMinYEdge:
        requestedOrigin = originTop;
        break;
    case CPMaxYEdge:
        requestedOrigin = originBottom;
        break;
    }
    var origins = [requestedOrigin, originRight, originLeft, originTop, originBottom],
        edges = [requestedEdge, CPMaxXEdge, CPMinXEdge, CPMinYEdge, CPMaxYEdge];
    for (var i = 0; i < origins.length; i++)
    {
        var origin = origins[i],
            edge = edges[i];
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setArrowOffsetX:", 0));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setArrowOffsetY:", 0));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPreferredEdge:", edge));
        if (origin.x < CGRectGetMinX(nativeRect))
        {
            ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setArrowOffsetX:", origin.x));
            origin.x = CGRectGetMinX(nativeRect);
        }
        if (origin.x + frameSize.width > CGRectGetMaxX(nativeRect))
        {
            ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setArrowOffsetX:", origin.x + frameSize.width - CGRectGetMaxX(nativeRect)));
            origin.x = CGRectGetMaxX(nativeRect) - frameSize.width;
        }
        if (origin.y < CGRectGetMinY(nativeRect))
        {
            ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setArrowOffsetY:", origin.y - CGRectGetMinY(nativeRect)));
            origin.y = CGRectGetMinY(nativeRect);
        }
        if (origin.y + frameSize.height > CGRectGetMaxY(nativeRect))
        {
            ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setArrowOffsetY:", frameSize.height + origin.y - CGRectGetMaxY(nativeRect)));
            origin.y = CGRectGetMaxY(nativeRect) - frameSize.height;
        }
        switch(edge) {
        case CPMaxXEdge:
            if (origin.x >= CGRectGetMaxX(platformRect))
                return origin;
            break;
        case CPMinXEdge:
            if (origin.x + frameSize.width <= platformRect.origin.x)
                return origin;
            break;
        case CPMaxYEdge:
            if (origin.y >= CGRectGetMaxY(platformRect))
                return origin;
            break;
        case CPMinYEdge:
            if (origin.y + frameSize.height <= platformRect.origin.y)
                return origin;
            break;
        }
    }
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPreferredEdge:", nil));
    return requestedOrigin;
    var ___r1;
}
,["CGPoint","CGRect","CPView","int"]), new objj_method(sel_getUid("positionRelativeToView:"), function $_CPPopoverWindow__positionRelativeToView_(self, _cmd, aView)
{
    self.isa.objj_msgSend3(self, "positionRelativeToRect:ofView:preferredEdge:", nil, aView, nil);
}
,["void","CPView"]), new objj_method(sel_getUid("positionRelativeToRect:ofView:preferredEdge:"), function $_CPPopoverWindow__positionRelativeToRect_ofView_preferredEdge_(self, _cmd, aRect, positioningView, anEdge)
{
    var wasVisible = self.isa.objj_msgSend0(self, "isVisible");
    if (!aRect || CGRectIsEmpty(aRect))
        aRect = (positioningView == null ? null : positioningView.isa.objj_msgSend0(positioningView, "bounds"));
    var point = self.isa.objj_msgSend3(self, "computeOriginFromRect:ofView:preferredEdge:", aRect, positioningView, anEdge);
    self.isa.objj_msgSend1(self, "setFrameOrigin:", point);
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "showCursor"));
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    self.isa.objj_msgSend1(self, "makeKeyAndOrderFront:", nil);
    if (positioningView !== self._targetView)
    {
        ((___r1 = ((___r2 = self._targetView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeChildWindow:", self));
        self.isa.objj_msgSend0(self, "_removeFrameObserver");
        self._targetView = positioningView;
    }
    var targetWindow = ((___r1 = self._targetView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "window"));
    if (!(targetWindow == null ? null : targetWindow.isa.objj_msgSend0(targetWindow, "isFullPlatformWindow")))
        ((___r1 = ((___r2 = self._targetView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "addChildWindow:ordered:", self, CPWindowAbove));
    self._targetWindow = targetWindow;
    if (!wasVisible)
        self.isa.objj_msgSend0(self, "_trapNextMouseDown");
    var ___r1, ___r2;
}
,["void","CGRect","CPView","int"]), new objj_method(sel_getUid("setCSS3Property:value:"), function $_CPPopoverWindow__setCSS3Property_value_(self, _cmd, aProperty, value)
{
    var browserProperty = CPBrowserStyleProperty(aProperty);
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("browserSupportsAnimation"), function $_CPPopoverWindow__browserSupportsAnimation(self, _cmd)
{
    return CPBrowserStyleProperty('transition') && CPBrowserStyleProperty('transitionend');
}
,["BOOL"]), new objj_method(sel_getUid("updateFrameWithSize:"), function $_CPPopoverWindow__updateFrameWithSize_(self, _cmd, aSize)
{
    var rect = CGRectMakeZero();
    rect.size = aSize;
    rect.origin = ((___r1 = self.isa.objj_msgSend0(self, "contentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameOrigin"));
    self.isa.objj_msgSend1(self, "setFrame:", self.isa.objj_msgSend1(self, "frameRectForContentRect:", rect));
    if (self.isa.objj_msgSend0(self, "isVisible"))
    {
        var point = self.isa.objj_msgSend3(self, "computeOriginFromRect:ofView:preferredEdge:", ((___r1 = self._targetView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")), self._targetView, ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "preferredEdge")));
        self.isa.objj_msgSend1(self, "setFrameOrigin:", point);
    }
    var ___r1;
}
,["void","CGSize"]), new objj_method(sel_getUid("close:"), function $_CPPopoverWindow__close_(self, _cmd, aSender)
{
    self.isa.objj_msgSend0(self, "close");
}
,["void","id"]), new objj_method(sel_getUid("cancelOperation:"), function $_CPPopoverWindow__cancelOperation_(self, _cmd, sender)
{
    if (((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_couldBeKeyEquivalent")) && self.isa.objj_msgSend1(self, "performKeyEquivalent:", (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))))
        return;
    self.isa.objj_msgSend1(self, "cancel:", self);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("cancel:"), function $_CPPopoverWindow__cancel_(self, _cmd, sender)
{
    if (self._closeOnBlur)
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performClose:", sender));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("close"), function $_CPPopoverWindow__close(self, _cmd)
{
    self.isa.objj_msgSend1(self, "orderOut:", self);
    self.isa.objj_msgSend1(self, "_detachFromChildrenClosing:", YES);
}
,["void"]), new objj_method(sel_getUid("orderFront:"), function $_CPPopoverWindow__orderFront_(self, _cmd, aSender)
{
    if (!self.isa.objj_msgSend0(self, "isKeyWindow"))
    {
        self._isOpening = YES;
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopoverWindow").super_class }, "orderFront:", aSender);
        if (self._animates && self._browserAnimates && self._shouldPerformAnimation)
        {
            var transformOrigin = "50% 100%",
                frame = self.isa.objj_msgSend0(self, "frame"),
                preferredEdge = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "preferredEdge")),
                posX,
                posY;
            switch(preferredEdge) {
            case CPMaxYEdge:
            case CPMinYEdge:
                posX = 50 + ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "arrowOffsetX")) * 100 / frame.size.width;
                transformOrigin = posX + "% " + (preferredEdge === CPMaxYEdge ? "0%" : "100%");
                break;
            case CPMinXEdge:
            case CPMaxXEdge:
                posY = 50 + ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "arrowOffsetY")) * 100 / frame.size.height;
                transformOrigin = (preferredEdge === CPMaxXEdge ? "0% " : "100% ") + posY + "%";
                break;
            }
            self.isa.objj_msgSend2(self, "setCSS3Property:value:", "Transform", "scale(0)");
            self.isa.objj_msgSend2(self, "setCSS3Property:value:", "TransformOrigin", transformOrigin);
            self.isa.objj_msgSend2(self, "setCSS3Property:value:", "Transition", "opacity 0 linear");
            window.setTimeout(function()
            {
                self.isa.objj_msgSend2(self, "setCSS3Property:value:", "Transform", "scale(1.1)");
                self.isa.objj_msgSend2(self, "setCSS3Property:value:", "Transition", CPBrowserCSSProperty('transform') + " 200ms ease-in");
                self._orderFrontTransitionFunction = function()
                {
                    self.isa.objj_msgSend2(self, "setCSS3Property:value:", "Transform", "scale(1)");
                    self.isa.objj_msgSend2(self, "setCSS3Property:value:", "Transition", CPBrowserCSSProperty('transform') + " 50ms linear");
                    self._transitionCompleteFunction = function()
                    {
                        self._isOpening = NO;
                        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_popoverWindowDidShow"));
                        var ___r1;
                    };
                };
            }, 10);
        }
        else
        {
            self._isOpening = NO;
            self.isa.objj_msgSend2(self, "setCSS3Property:value:", "Transition", "");
        }
    }
    self._shouldPerformAnimation = NO;
    self._isClosing = NO;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_orderFront"), function $_CPPopoverWindow___orderFront(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "isVisible"))
        self.isa.objj_msgSend0(self, "_addFrameObserver");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopoverWindow").super_class }, "_orderFront");
}
,["void"]), new objj_method(sel_getUid("_parentDidOrderInChild"), function $_CPPopoverWindow___parentDidOrderInChild(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_addFrameObserver");
}
,["void"]), new objj_method(sel_getUid("orderOut:"), function $_CPPopoverWindow__orderOut_(self, _cmd, aSender)
{
    if (!self.isa.objj_msgSend0(self, "isVisible"))
        return;
    self._isClosing = YES;
    if (self._animates && self._browserAnimates)
    {
        if (self._isOpening)
        {
        }
        self.isa.objj_msgSend2(self, "setCSS3Property:value:", "Transition", "opacity 250ms linear");
    }
    else
    {
        self.isa.objj_msgSend1(self, "_orderOutRecursively:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("_orderOutRecursively:"), function $_CPPopoverWindow___orderOutRecursively_(self, _cmd, recursive)
{
    self.isa.objj_msgSend0(self, "_removeFrameObserver");
    ((___r1 = self._parentWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeChildWindow:", self));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopoverWindow").super_class }, "_orderOutRecursively:", recursive);
    self._shouldPerformAnimation = YES;
    self._isClosing = NO;
    self._isOpening = NO;
    self._targetWindow = nil;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_popoverWindowDidClose"));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("_currentTransformMatrix"), function $_CPPopoverWindow___currentTransformMatrix(self, _cmd)
{
}
,["CPString"]), new objj_method(sel_getUid("_hasOnlyTransientChild:"), function $_CPPopoverWindow___hasOnlyTransientChild_(self, _cmd, aWindow)
{
    var childWindows = (aWindow == null ? null : aWindow.isa.objj_msgSend0(aWindow, "childWindows"));
    for (var i = (childWindows == null ? null : childWindows.isa.objj_msgSend0(childWindows, "count")) - 1; i >= 0; i--)
    {
        var childWindow = childWindows[i];
        if (!(childWindow == null ? null : childWindow.isa.objj_msgSend1(childWindow, "isKindOfClass:", self.isa.objj_msgSend0(self, "class"))))
            continue;
        if (((___r1 = (childWindow == null ? null : childWindow.isa.objj_msgSend0(childWindow, "delegate"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "behavior")) != CPPopoverBehaviorTransient)
            return NO;
        if (!self.isa.objj_msgSend1(self, "_hasOnlyTransientChild:", childWindow))
            return NO;
    }
    return YES;
    var ___r1;
}
,["BOOL","_CPPopoverWindow"]), new objj_method(sel_getUid("_mouseWasClicked:"), function $_CPPopoverWindow___mouseWasClicked_(self, _cmd, anEvent)
{
    if (!self.isa.objj_msgSend0(self, "isVisible") || !self._targetWindow)
        return;
    var mouseWindow = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window"));
    if (mouseWindow === self || (mouseWindow == null ? null : mouseWindow.isa.objj_msgSend1(mouseWindow, "_hasAncestorWindow:", self)) || !self.isa.objj_msgSend1(self, "_hasOnlyTransientChild:", self))
    {
        self.isa.objj_msgSend0(self, "_trapNextMouseDown");
    }
    else
    {
        switch(((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "behavior"))) {
        case CPPopoverBehaviorSemitransient:
            var superview = ((___r1 = self._delegate._positioningView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "superview")),
                positioningViewFrame = ((___r1 = self._delegate._positioningView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
            if (CGRectContainsPoint(positioningViewFrame, (superview == null ? null : superview.isa.objj_msgSend1(superview, "convertPointFromBase:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow"))))) || mouseWindow != self._targetWindow)
            {
                self.isa.objj_msgSend0(self, "_trapNextMouseDown");
                break;
            }
            ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "close"));
            break;
        case CPPopoverBehaviorTransient:
            ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "close"));
            break;
        case CPPopoverBehaviorApplicationDefined:
            self.isa.objj_msgSend0(self, "_trapNextMouseDown");
            break;
        }
    }
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_trapNextMouseDown"), function $_CPPopoverWindow___trapNextMouseDown(self, _cmd)
{
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("_mouseWasClicked:"), CPLeftMouseDownMask | CPRightMouseDownMask, nil, CPDefaultRunLoopMode, NO));
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_windowViewClassForStyleMask:"), function $_CPPopoverWindow___windowViewClassForStyleMask_(self, _cmd, aStyleMask)
{
    return _CPPopoverWindowView;
}
,["Class","unsigned"])]);
}