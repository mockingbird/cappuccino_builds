@STATIC;1.0;I;21;Foundation/CPObject.ji;10;CPButton.ji;10;CPWindow.jt;16392;

objj_executeFile("Foundation/CPObject.j", NO);

objj_executeFile("CPButton.j", YES);
objj_executeFile("CPWindow.j", YES);


CPClosableOnBlurWindowMask = 1 << 4;
CPPopoverAppearanceMinimal = 0;
CPPopoverAppearanceHUD = 1;

var _CPAttachedWindow_attachedWindowShouldClose_ = 1 << 0,
    _CPAttachedWindow_attachedWindowDidClose_ = 1 << 1;
{var the_class = objj_allocateClassPair(CPWindow, "_CPAttachedWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_animates"), new objj_ivar("_targetView"), new objj_ivar("_appearance"), new objj_ivar("_isClosing"), new objj_ivar("_closeOnBlur"), new objj_ivar("_browserAnimates"), new objj_ivar("_shouldPerformAnimation"), new objj_ivar("_implementedDelegateMethods")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("animates"), function $_CPAttachedWindow__animates(self, _cmd)
{ with(self)
{
return _animates;
}
},["id"]),
new objj_method(sel_getUid("setAnimates:"), function $_CPAttachedWindow__setAnimates_(self, _cmd, newValue)
{ with(self)
{
_animates = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("targetView"), function $_CPAttachedWindow__targetView(self, _cmd)
{ with(self)
{
return _targetView;
}
},["id"]),
new objj_method(sel_getUid("setTargetView:"), function $_CPAttachedWindow__setTargetView_(self, _cmd, newValue)
{ with(self)
{
_targetView = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("appearance"), function $_CPAttachedWindow__appearance(self, _cmd)
{ with(self)
{
return _appearance;
}
},["id"]),
new objj_method(sel_getUid("_setAppearance:"), function $_CPAttachedWindow___setAppearance_(self, _cmd, newValue)
{ with(self)
{
_appearance = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("isClosing"), function $_CPAttachedWindow__isClosing(self, _cmd)
{ with(self)
{
return _isClosing;
}
},["id"]),
new objj_method(sel_getUid("setIsClosing:"), function $_CPAttachedWindow__setIsClosing_(self, _cmd, newValue)
{ with(self)
{
_isClosing = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithContentRect:"), function $_CPAttachedWindow__initWithContentRect_(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(self, "initWithContentRect:styleMask:", aFrame, 0);
}
},["id","CGRect"]), new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $_CPAttachedWindow__initWithContentRect_styleMask_(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAttachedWindow").super_class }, "initWithContentRect:styleMask:", aFrame, aStyleMask))
    {
        _animates = YES;
        _closeOnBlur = (aStyleMask & CPClosableOnBlurWindowMask);
        _isClosing = NO;
        _browserAnimates = objj_msgSend(self, "browserSupportsAnimation");
        _shouldPerformAnimation = YES;

        objj_msgSend(self, "setLevel:", CPStatusWindowLevel);
        objj_msgSend(self, "setMovableByWindowBackground:", YES);
        objj_msgSend(self, "setHasShadow:", NO);

        objj_msgSend(self, "setCSS3Property:value:", "TransitionProperty", "-webkit-transform, opacity");

        objj_msgSend(_windowView, "setNeedsDisplay:", YES);
    }

    return self;
}
},["id","CGRect","unsigned"]), new objj_method(sel_getUid("setAppearance:"), function $_CPAttachedWindow__setAppearance_(self, _cmd, anAppearance)
{ with(self)
{
    if (_appearance === anAppearance)
        return;

    objj_msgSend(_windowView, "setAppearance:", anAppearance);
}
},["void","int"]), new objj_method(sel_getUid("setStyleMask:"), function $_CPAttachedWindow__setStyleMask_(self, _cmd, aStyleMask)
{ with(self)
{
    _closeOnBlur = (aStyleMask & CPClosableOnBlurWindowMask);
}
},["void","unsigned"]), new objj_method(sel_getUid("setDelegate:"), function $_CPAttachedWindow__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate === aDelegate)
        return;

    _delegate = aDelegate;
    _implementedDelegateMethods = 0;

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("attachedWindowShouldClose:")))
        _implementedDelegateMethods |= _CPAttachedWindow_attachedWindowShouldClose_;

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("attachedWindowDidClose:")))
        _implementedDelegateMethods |= _CPAttachedWindow_attachedWindowDidClose_;
}
},["void","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPAttachedWindow__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aPath, anObject, theChange, aContext)
{ with(self)
{
    if (objj_msgSend(aPath, "isEqual:", "frame"))
    {

        var edge = objj_msgSend(_windowView, "preferredEdge");

        objj_msgSend(self, "positionRelativeToRect:ofView:preferredEdge:", nil, _targetView, edge);
    }
}
},["void","CPString","id","CPDictionary","void"]), new objj_method(sel_getUid("computeOriginFromRect:ofView:preferredEdge:"), function $_CPAttachedWindow__computeOriginFromRect_ofView_preferredEdge_(self, _cmd, aRect, positioningView, anEdge)
{ with(self)
{
    var mainWindow = objj_msgSend(positioningView, "window"),
        platformWindow = objj_msgSend(mainWindow, "platformWindow"),
        nativeRect = objj_msgSend(platformWindow, "nativeContentRect"),
        baseOrigin = objj_msgSend(positioningView, "convertPointToBase:", aRect.origin),
        platformOrigin = objj_msgSend(mainWindow, "convertBaseToPlatformWindow:", baseOrigin),
        platformRect = { origin: { x:platformOrigin.x, y:platformOrigin.y }, size: { width:aRect.size.width, height:aRect.size.height } },
        originLeft = { x:platformOrigin.x, y:platformOrigin.y },
        originRight = { x:platformOrigin.x, y:platformOrigin.y },
        originTop = { x:platformOrigin.x, y:platformOrigin.y },
        originBottom = { x:platformOrigin.x, y:platformOrigin.y },
        frameSize = objj_msgSend(self, "frame").size;


    originRight.x += platformRect.size.width;
    originRight.y += (platformRect.size.height / 2.0) - (frameSize.height / 2.0);


    originLeft.x -= frameSize.width;
    originLeft.y += (platformRect.size.height / 2.0) - (frameSize.height / 2.0);


    originBottom.x += platformRect.size.width / 2.0 - frameSize.width / 2.0;
    originBottom.y += platformRect.size.height;


    originTop.x += platformRect.size.width / 2.0 - frameSize.width / 2.0;
    originTop.y -= frameSize.height;

    var requestedEdge = (anEdge !== nil) ? anEdge : CPMaxXEdge,
        requestedOrigin;

    switch (requestedEdge)
    {
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

        objj_msgSend(_windowView, "setArrowOffsetX:", 0);
        objj_msgSend(_windowView, "setArrowOffsetY:", 0);
        objj_msgSend(_windowView, "setPreferredEdge:", edge);

        if (origin.x < 0)
        {
            objj_msgSend(_windowView, "setArrowOffsetX:", origin.x);
            origin.x = 0;
        }

        if (origin.x + frameSize.width > nativeRect.size.width)
        {
            objj_msgSend(_windowView, "setArrowOffsetX:", (origin.x + frameSize.width - nativeRect.size.width));
            origin.x = nativeRect.size.width - frameSize.width;
        }

        if (origin.y < 0)
        {
            objj_msgSend(_windowView, "setArrowOffsetY:", origin.y);
            origin.y = 0;
        }

        if (origin.y + frameSize.height > nativeRect.size.height)
        {
            objj_msgSend(_windowView, "setArrowOffsetY:", (frameSize.height + origin.y - nativeRect.size.height));
            origin.y = nativeRect.size.height - frameSize.height;
        }

        switch (edge)
        {
            case CPMaxXEdge:
                if (origin.x >= (platformRect.origin.x + platformRect.size.width))
                    return origin;
                break;

            case CPMinXEdge:
                if ((origin.x + frameSize.width) <= platformRect.origin.x)
                    return origin;
                break;

            case CPMaxYEdge:
                if (origin.y >= (platformRect.origin.y + platformRect.size.height))
                    return origin;
                break;

            case CPMinYEdge:
                if ((origin.y + frameSize.height) <= platformRect.origin.y)
                    return origin;
                break;
        }
    }

    objj_msgSend(_windowView, "setPreferredEdge:", nil);
    return requestedOrigin;
}
},["CGPoint","CGRect","CPView","int"]), new objj_method(sel_getUid("positionRelativeToView:"), function $_CPAttachedWindow__positionRelativeToView_(self, _cmd, aView)
{ with(self)
{
    objj_msgSend(self, "positionRelativeToRect:ofView:preferredEdge:", nil, aView, nil);
}
},["void","CPView"]), new objj_method(sel_getUid("positionRelativeToRect:ofView:preferredEdge:"), function $_CPAttachedWindow__positionRelativeToRect_ofView_preferredEdge_(self, _cmd, aRect, positioningView, anEdge)
{ with(self)
{
    if (!aRect || (aRect.size.width <= 0.0 || aRect.size.height <= 0.0))
        aRect = objj_msgSend(positioningView, "bounds");

    var point = objj_msgSend(self, "computeOriginFromRect:ofView:preferredEdge:", aRect, positioningView, anEdge);

    objj_msgSend(self, "setFrameOrigin:", point);
    objj_msgSend(_windowView, "showCursor");
    objj_msgSend(self, "setLevel:", CPStatusWindowLevel);
    objj_msgSend(_windowView, "setNeedsDisplay:", YES);
    objj_msgSend(self, "makeKeyAndOrderFront:", nil);

    if (positioningView !== _targetView)
    {
        objj_msgSend(_targetView, "removeObserver:forKeyPath:", self, "frame");
        _targetView = positioningView;
        objj_msgSend(_targetView, "addObserver:forKeyPath:options:context:", self, "frame", 0, nil);
    }
}
},["void","CGRect","CPView","int"]), new objj_method(sel_getUid("setCSS3Property:value:"), function $_CPAttachedWindow__setCSS3Property_value_(self, _cmd, property, value)
{ with(self)
{
    _DOMElement.style['webkit' + property] = value;


}
},["void","CPString","CPString"]), new objj_method(sel_getUid("browserSupportsAnimation"), function $_CPAttachedWindow__browserSupportsAnimation(self, _cmd)
{ with(self)
{
    return typeof(_DOMElement.style.webkitTransition) !== "undefined";
}
},["BOOL"]), new objj_method(sel_getUid("close:"), function $_CPAttachedWindow__close_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "close");
}
},["IBAction","id"]), new objj_method(sel_getUid("resignMainWindow"), function $_CPAttachedWindow__resignMainWindow(self, _cmd)
{ with(self)
{
    if (_closeOnBlur && !_isClosing)
    {
        if (!_delegate ||
            ((_implementedDelegateMethods & _CPAttachedWindow_attachedWindowShouldClose_) &&
             objj_msgSend(_delegate, "attachedWindowShouldClose:", self)))
        {
            objj_msgSend(self, "close");
        }
    }
}
},["void"]), new objj_method(sel_getUid("orderFront:"), function $_CPAttachedWindow__orderFront_(self, _cmd, aSender)
{ with(self)
{
    if (!objj_msgSend(self, "isMainWindow"))
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAttachedWindow").super_class }, "orderFront:", aSender);

        if (_animates && _browserAnimates && _shouldPerformAnimation)
        {
            var transformOrigin = "50% 100%",
                frame = objj_msgSend(self, "frame"),
                preferredEdge = objj_msgSend(_windowView, "preferredEdge"),
                posX;

            switch (preferredEdge)
            {
                case CPMaxYEdge:
                case CPMinYEdge:
                    posX = 50 + ((objj_msgSend(_windowView, "arrowOffsetX") * 100) / frame.size.width);
                    transformOrigin = posX + "% " + (preferredEdge === CPMaxYEdge ? "0%" : "100%");
                    break;

                case CPMinXEdge:
                case CPMaxXEdge:
                    posY = 50 + ((objj_msgSend(_windowView, "arrowOffsetY") * 100) / frame.size.height);
                    transformOrigin = (preferredEdge === CPMaxXEdge ? "0% " : "100% ") + posY + "%";
                    break;
            }


            objj_msgSend(self, "setCSS3Property:value:", "Transform", "scale(0)");
            objj_msgSend(self, "setCSS3Property:value:", "TransformOrigin", transformOrigin);
            objj_msgSend(self, "setCSS3Property:value:", "Transition", "opacity 0 linear");

            window.setTimeout(function()
            {

                _DOMElement.style.opacity = 1;
                _DOMElement.style.height = frame.size.height + "px";
                _DOMElement.style.width = frame.size.width + "px";


                objj_msgSend(self, "setCSS3Property:value:", "Transform", "scale(1.1)");
                objj_msgSend(self, "setCSS3Property:value:", "Transition", "-webkit-transform 200ms ease-in");

                var transitionEndFunction = function()
                {
                    _DOMElement.removeEventListener("webkitTransitionEnd", transitionEndFunction, YES);



                    objj_msgSend(self, "setCSS3Property:value:", "Transform", "scale(1)");
                    objj_msgSend(self, "setCSS3Property:value:", "Transition", "-webkit-transform 50ms linear");
                };

                _DOMElement.addEventListener("webkitTransitionEnd", transitionEndFunction, YES);
            }, 0);
        }
        else
        {
            objj_msgSend(self, "setCSS3Property:value:", "Transition", "");
            _DOMElement.style.opacity = 1;
        }
    }

    _shouldPerformAnimation = NO;
    _isClosing = NO;
}
},["IBAction","is"]), new objj_method(sel_getUid("close"), function $_CPAttachedWindow__close(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "isVisible"))
        return;


    _isClosing = YES;

    if (_animates && _browserAnimates)
    {

        objj_msgSend(self, "setCSS3Property:value:", "Transition", "opacity 250ms linear");
        _DOMElement.style.opacity = 0;

        var transitionEndFunction = function()
        {
            _DOMElement.removeEventListener("webkitTransitionEnd", transitionEndFunction, YES);
            objj_msgSend(self, "_close");
        };

        _DOMElement.addEventListener("webkitTransitionEnd", transitionEndFunction, YES);
    }
    else
    {
        objj_msgSend(self, "_close");
    }
}
},["void"]), new objj_method(sel_getUid("_close"), function $_CPAttachedWindow___close(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAttachedWindow").super_class }, "close");
    objj_msgSend(_targetView, "removeObserver:forKeyPath:", self, "frame");

    _shouldPerformAnimation = YES;
    _isClosing = NO;

    if (_implementedDelegateMethods & _CPAttachedWindow_attachedWindowDidClose_)
        objj_msgSend(_delegate, "attachedWindowDidClose:", self);
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_windowViewClassForStyleMask:"), function $_CPAttachedWindow___windowViewClassForStyleMask_(self, _cmd, aStyleMask)
{ with(self)
{
    return _CPAttachedWindowView;
}
},["Class","unsigned"]), new objj_method(sel_getUid("attachedWindowWithSize:forView:"), function $_CPAttachedWindow__attachedWindowWithSize_forView_(self, _cmd, aSize, aView)
{ with(self)
{
    return objj_msgSend(_CPAttachedWindow, "attachedWindowWithSize:forView:styleMask:", aSize, aView, 0);
}
},["id","CGSize","CPView"]), new objj_method(sel_getUid("attachedWindowWithSize:forView:styleMask:"), function $_CPAttachedWindow__attachedWindowWithSize_forView_styleMask_(self, _cmd, aSize, aView, aMask)
{ with(self)
{
    var attachedWindow = objj_msgSend(objj_msgSend(_CPAttachedWindow, "alloc"), "initWithContentRect:styleMask:", { origin: { x:0.0, y:0.0 }, size: { width:aSize.width, height:aSize.height } }, aMask);

    objj_msgSend(attachedWindow, "attachToView:", aView);

    return attachedWindow;
}
},["id","CGSize","CPView","int"])]);
}

