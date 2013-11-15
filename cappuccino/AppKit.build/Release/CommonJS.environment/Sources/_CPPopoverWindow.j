@STATIC;1.0;I;21;Foundation/CPObject.ji;10;CPButton.ji;8;CPMenu.ji;9;CPPanel.jt;17203;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPButton.j", YES);objj_executeFile("CPMenu.j", YES);objj_executeFile("CPPanel.j", YES);CPClosableOnBlurWindowMask = 1 << 4;
CPPopoverAppearanceMinimal = 0;
CPPopoverAppearanceHUD = 1;
var _CPPopoverWindow_shouldClose_ = 1 << 0,
    _CPPopoverWindow_didClose_ = 1 << 1,
    _CPPopoverWindow_didShow_ = 1 << 2;
{var the_class = objj_allocateClassPair(CPPanel, "_CPPopoverWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_animates"), new objj_ivar("_targetView"), new objj_ivar("_appearance"), new objj_ivar("_isClosing"), new objj_ivar("_closeOnBlur"), new objj_ivar("_browserAnimates"), new objj_ivar("_shouldPerformAnimation"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_orderOutTransitionFunction")]);objj_registerClassPair(the_class);
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
,["void","BOOL"]), new objj_method(sel_getUid("initWithContentRect:"), function $_CPPopoverWindow__initWithContentRect_(self, _cmd, aFrame)
{
    return objj_msgSend(self, "initWithContentRect:styleMask:", aFrame, 0);
}
,["id","CGRect"]), new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $_CPPopoverWindow__initWithContentRect_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopoverWindow").super_class }, "initWithContentRect:styleMask:", aFrame, aStyleMask))
    {
        self._animates = YES;
        self._isClosing = NO;
        self._browserAnimates = objj_msgSend(self, "browserSupportsAnimation");
        self._shouldPerformAnimation = YES;
        self._orderOutTransitionFunction = function()
        {
            objj_msgSend(self, "_orderOutRecursively:", YES);
        };
        objj_msgSend(self, "setStyleMask:", aStyleMask);
        objj_msgSend(self, "setBecomesKeyOnlyIfNeeded:", YES);
        objj_msgSend(self, "setMovableByWindowBackground:", YES);
        objj_msgSend(self, "setHasShadow:", NO);
        objj_msgSend(self, "setCSS3Property:value:", "TransitionProperty", CPBrowserCSSProperty('transform') + ", opacity");
        objj_msgSend(self._windowView, "setNeedsDisplay:", YES);
    }
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("setAppearance:"), function $_CPPopoverWindow__setAppearance_(self, _cmd, anAppearance)
{
    if (self._appearance === anAppearance)
        return;
    objj_msgSend(self._windowView, "setAppearance:", anAppearance);
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
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("popoverWindowShouldClose:")))
        self._implementedDelegateMethods |= _CPPopoverWindow_shouldClose_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("popoverWindowDidClose:")))
        self._implementedDelegateMethods |= _CPPopoverWindow_didClose_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("popoverWindowDidShow:")))
        self._implementedDelegateMethods |= _CPPopoverWindow_didShow_;
}
,["void","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPPopoverWindow__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aPath, anObject, theChange, aContext)
{
    if (aPath === "frame")
    {
        if (!objj_msgSend(self._targetView, "window"))
            return;
        var point = objj_msgSend(self, "computeOriginFromRect:ofView:preferredEdge:", objj_msgSend(self._targetView, "bounds"), self._targetView, objj_msgSend(self._windowView, "preferredEdge"));
        objj_msgSend(self, "setFrameOrigin:", point);
    }
}
,["void","CPString","id","CPDictionary","void"]), new objj_method(sel_getUid("computeOriginFromRect:ofView:preferredEdge:"), function $_CPPopoverWindow__computeOriginFromRect_ofView_preferredEdge_(self, _cmd, aRect, positioningView, anEdge)
{
    var mainWindow = objj_msgSend(positioningView, "window"),
        platformWindow = objj_msgSend(mainWindow, "platformWindow"),
        nativeRect = objj_msgSend(platformWindow, "usableContentFrame"),
        baseOrigin = objj_msgSend(positioningView, "convertPointToBase:", aRect.origin),
        platformOrigin = objj_msgSend(mainWindow, "convertBaseToPlatformWindow:", baseOrigin),
        platformRect = CGRectMake(platformOrigin.x, platformOrigin.y, aRect.size.width, aRect.size.height),
        originLeft = CGPointCreateCopy(platformOrigin),
        originRight = CGPointCreateCopy(platformOrigin),
        originTop = CGPointCreateCopy(platformOrigin),
        originBottom = CGPointCreateCopy(platformOrigin),
        frameSize = objj_msgSend(self, "frame").size;
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
        objj_msgSend(self._windowView, "setArrowOffsetX:", 0);
        objj_msgSend(self._windowView, "setArrowOffsetY:", 0);
        objj_msgSend(self._windowView, "setPreferredEdge:", edge);
        if (origin.x < CGRectGetMinX(nativeRect))
        {
            objj_msgSend(self._windowView, "setArrowOffsetX:", origin.x);
            origin.x = CGRectGetMinX(nativeRect);
        }
        if (origin.x + frameSize.width > CGRectGetMaxX(nativeRect))
        {
            objj_msgSend(self._windowView, "setArrowOffsetX:", origin.x + frameSize.width - CGRectGetMaxX(nativeRect));
            origin.x = CGRectGetMaxX(nativeRect) - frameSize.width;
        }
        if (origin.y < CGRectGetMinY(nativeRect))
        {
            objj_msgSend(self._windowView, "setArrowOffsetY:", origin.y - CGRectGetMinY(nativeRect));
            origin.y = CGRectGetMinY(nativeRect);
        }
        if (origin.y + frameSize.height > CGRectGetMaxY(nativeRect))
        {
            objj_msgSend(self._windowView, "setArrowOffsetY:", frameSize.height + origin.y - CGRectGetMaxY(nativeRect));
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
    objj_msgSend(self._windowView, "setPreferredEdge:", nil);
    return requestedOrigin;
}
,["CGPoint","CGRect","CPView","int"]), new objj_method(sel_getUid("positionRelativeToView:"), function $_CPPopoverWindow__positionRelativeToView_(self, _cmd, aView)
{
    objj_msgSend(self, "positionRelativeToRect:ofView:preferredEdge:", nil, aView, nil);
}
,["void","CPView"]), new objj_method(sel_getUid("positionRelativeToRect:ofView:preferredEdge:"), function $_CPPopoverWindow__positionRelativeToRect_ofView_preferredEdge_(self, _cmd, aRect, positioningView, anEdge)
{
    var wasVisible = objj_msgSend(self, "isVisible");
    if (!aRect || CGRectIsEmpty(aRect))
        aRect = objj_msgSend(positioningView, "bounds");
    var point = objj_msgSend(self, "computeOriginFromRect:ofView:preferredEdge:", aRect, positioningView, anEdge);
    objj_msgSend(self, "setFrameOrigin:", point);
    objj_msgSend(self._windowView, "showCursor");
    objj_msgSend(self._windowView, "setNeedsDisplay:", YES);
    objj_msgSend(self, "makeKeyAndOrderFront:", nil);
    if (positioningView !== self._targetView)
    {
        objj_msgSend(objj_msgSend(self._targetView, "window"), "removeChildWindow:", self);
        objj_msgSend(self._targetView, "removeObserver:forKeyPath:", self, "frame");
        self._targetView = positioningView;
    }
    var targetWindow = objj_msgSend(self._targetView, "window");
    if (!objj_msgSend(targetWindow, "isFullPlatformWindow"))
        objj_msgSend(objj_msgSend(self._targetView, "window"), "addChildWindow:ordered:", self, CPWindowAbove);
    if (!wasVisible)
        objj_msgSend(self, "_trapNextMouseDown");
}
,["void","CGRect","CPView","int"]), new objj_method(sel_getUid("setCSS3Property:value:"), function $_CPPopoverWindow__setCSS3Property_value_(self, _cmd, aProperty, value)
{
    var browserProperty = CPBrowserStyleProperty(aProperty);
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("browserSupportsAnimation"), function $_CPPopoverWindow__browserSupportsAnimation(self, _cmd)
{
    return CPBrowserStyleProperty('transition') && CPBrowserStyleProperty('transitionend');
}
,["BOOL"]), new objj_method(sel_getUid("close:"), function $_CPPopoverWindow__close_(self, _cmd, aSender)
{
    objj_msgSend(self, "close");
}
,["id","id"]), new objj_method(sel_getUid("close"), function $_CPPopoverWindow__close(self, _cmd)
{
    objj_msgSend(self, "orderOut:", self);
    objj_msgSend(self, "_detachFromChildrenClosing:", YES);
}
,["void"]), new objj_method(sel_getUid("orderFront:"), function $_CPPopoverWindow__orderFront_(self, _cmd, aSender)
{
    if (!objj_msgSend(self, "isKeyWindow"))
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopoverWindow").super_class }, "orderFront:", aSender);
        if (self._animates && self._browserAnimates && self._shouldPerformAnimation)
        {
            var transformOrigin = "50% 100%",
                frame = objj_msgSend(self, "frame"),
                preferredEdge = objj_msgSend(self._windowView, "preferredEdge"),
                posX,
                posY;
            switch(preferredEdge) {
            case CPMaxYEdge:
            case CPMinYEdge:
                posX = 50 + objj_msgSend(self._windowView, "arrowOffsetX") * 100 / frame.size.width;
                transformOrigin = posX + "% " + (preferredEdge === CPMaxYEdge ? "0%" : "100%");
                break;
            case CPMinXEdge:
            case CPMaxXEdge:
                posY = 50 + objj_msgSend(self._windowView, "arrowOffsetY") * 100 / frame.size.height;
                transformOrigin = (preferredEdge === CPMaxXEdge ? "0% " : "100% ") + posY + "%";
                break;
            }
            objj_msgSend(self, "setCSS3Property:value:", "Transform", "scale(0)");
            objj_msgSend(self, "setCSS3Property:value:", "TransformOrigin", transformOrigin);
            objj_msgSend(self, "setCSS3Property:value:", "Transition", "opacity 0 linear");
            window.setTimeout(function()
            {
                objj_msgSend(self, "setCSS3Property:value:", "Transform", "scale(1.1)");
                objj_msgSend(self, "setCSS3Property:value:", "Transition", CPBrowserCSSProperty('transform') + " 200ms ease-in");
                var orderFrontTransitionFunction = function()
                {
                    objj_msgSend(self, "setCSS3Property:value:", "Transform", "scale(1)");
                    objj_msgSend(self, "setCSS3Property:value:", "Transition", CPBrowserCSSProperty('transform') + " 50ms linear");
                    var transitionCompleteFunction = function()
                    {
                        if (self._implementedDelegateMethods & _CPPopoverWindow_didShow_)
                            objj_msgSend(self._delegate, "popoverWindowDidShow:", self);
                    };
                };
            }, 0);
        }
        else
        {
            objj_msgSend(self, "setCSS3Property:value:", "Transition", "");
        }
    }
    self._shouldPerformAnimation = NO;
    self._isClosing = NO;
}
,["id","is"]), new objj_method(sel_getUid("_orderFront"), function $_CPPopoverWindow___orderFront(self, _cmd)
{
    if (!objj_msgSend(self, "isVisible"))
        objj_msgSend(self._targetView, "addObserver:forKeyPath:options:context:", self, "frame", 0, nil);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopoverWindow").super_class }, "_orderFront");
}
,["void"]), new objj_method(sel_getUid("_parentDidOrderInChild"), function $_CPPopoverWindow___parentDidOrderInChild(self, _cmd)
{
    objj_msgSend(self._targetView, "addObserver:forKeyPath:options:context:", self, "frame", 0, nil);
}
,["void"]), new objj_method(sel_getUid("orderOut:"), function $_CPPopoverWindow__orderOut_(self, _cmd, aSender)
{
    if (!objj_msgSend(self, "isVisible"))
        return;
    self._isClosing = YES;
    if (self._animates && self._browserAnimates)
    {
        objj_msgSend(self, "setCSS3Property:value:", "Transition", "opacity 250ms linear");
    }
    else
    {
        objj_msgSend(self, "_orderOutRecursively:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("_orderOutRecursively:"), function $_CPPopoverWindow___orderOutRecursively_(self, _cmd, recursive)
{
    objj_msgSend(self._targetView, "removeObserver:forKeyPath:", self, "frame");
    objj_msgSend(self._parentWindow, "removeChildWindow:", self);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopoverWindow").super_class }, "_orderOutRecursively:", recursive);
    self._shouldPerformAnimation = YES;
    self._isClosing = NO;
    if (self._implementedDelegateMethods & _CPPopoverWindow_didClose_)
        objj_msgSend(self._delegate, "popoverWindowDidClose:", self);
}
,["void","BOOL"]), new objj_method(sel_getUid("_mouseWasClicked:"), function $_CPPopoverWindow___mouseWasClicked_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self, "isVisible"))
        return;
    var mouseWindow = objj_msgSend(anEvent, "window");
    if (mouseWindow === self || objj_msgSend(mouseWindow, "_hasAncestorWindow:", self))
        objj_msgSend(self, "_trapNextMouseDown");
    else
    {
        if (self._closeOnBlur)
            objj_msgSend(self._delegate, "_close");
        var parent = objj_msgSend(self, "parentWindow");
        if (objj_msgSend(parent, "isKindOfClass:", objj_msgSend(self, "class")))
            objj_msgSend(parent, "_mouseWasClicked:", anEvent);
    }
}
,["void","CPEvent"]), new objj_method(sel_getUid("_trapNextMouseDown"), function $_CPPopoverWindow___trapNextMouseDown(self, _cmd)
{
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("_mouseWasClicked:"), CPLeftMouseDownMask, nil, CPDefaultRunLoopMode, NO);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_windowViewClassForStyleMask:"), function $_CPPopoverWindow___windowViewClassForStyleMask_(self, _cmd, aStyleMask)
{
    return _CPPopoverWindowView;
}
,["Class","unsigned"])]);
}