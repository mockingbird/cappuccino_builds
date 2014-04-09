@STATIC;1.0;I;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;10;CPCursor.ji;14;CPDragServer.ji;9;CPEvent.ji;18;CPPlatformWindow.ji;22;CPPlatformWindow+DOM.ji;13;CPResponder.ji;10;CPScreen.ji;8;CPText.ji;8;CPView.ji;20;CPWindow_Constants.ji;31;_CPBorderlessBridgeWindowView.ji;25;_CPBorderlessWindowView.ji;23;_CPDocModalWindowView.ji;18;_CPHUDWindowView.ji;20;_CPModalWindowView.ji;22;_CPPopoverWindowView.ji;21;_CPShadowWindowView.ji;23;_CPStandardWindowView.ji;22;_CPToolTipWindowView.jt;108890;objj_executeFile("Foundation/CPCountedSet.j", NO);objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("Foundation/CPUndoManager.j", NO);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPAnimation.j", YES);objj_executeFile("CPCursor.j", YES);objj_executeFile("CPDragServer.j", YES);objj_executeFile("CPEvent.j", YES);objj_executeFile("CPPlatformWindow.j", YES);objj_executeFile("CPPlatformWindow+DOM.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPScreen.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow_Constants.j", YES);objj_executeFile("_CPBorderlessBridgeWindowView.j", YES);objj_executeFile("_CPBorderlessWindowView.j", YES);objj_executeFile("_CPDocModalWindowView.j", YES);objj_executeFile("_CPHUDWindowView.j", YES);objj_executeFile("_CPModalWindowView.j", YES);objj_executeFile("_CPPopoverWindowView.j", YES);objj_executeFile("_CPShadowWindowView.j", YES);objj_executeFile("_CPStandardWindowView.j", YES);objj_executeFile("_CPToolTipWindowView.j", YES);{var the_protocol = objj_allocateProtocol("CPWindowDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPWindowDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}var CPWindowDelegate_windowShouldClose_ = 1 << 1;
(CPWindowDelegate_windowWillReturnUndoManager_ = 1 << 2, CPWindowDelegate_windowWillClose_ = 1 << 3);
var CPWindowSaveImage = nil,
    CPWindowResizeTime = 0.2,
    CPWindowResizeStyleGlobalChangeNotification = "CPWindowResizeStyleGlobalChangeNotification",
    CPWindowMinVisibleHorizontalMargin = 40,
    CPWindowMinVisibleVerticalMargin = 2;
var CPWindowActionMessageKeys = [CPLeftArrowFunctionKey, CPRightArrowFunctionKey, CPUpArrowFunctionKey, CPDownArrowFunctionKey, CPPageUpFunctionKey, CPPageDownFunctionKey, CPHomeFunctionKey, CPEndFunctionKey, CPEscapeFunctionKey];
{var the_class = objj_allocateClassPair(CPResponder, "CPWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_platformWindow"), new objj_ivar("_windowNumber"), new objj_ivar("_styleMask"), new objj_ivar("_frame"), new objj_ivar("_level"), new objj_ivar("_isVisible"), new objj_ivar("_hasBeenOrderedIn"), new objj_ivar("_isMiniaturized"), new objj_ivar("_isAnimating"), new objj_ivar("_hasShadow"), new objj_ivar("_isMovableByWindowBackground"), new objj_ivar("_isMovable"), new objj_ivar("_constrainsToUsableScreen"), new objj_ivar("_shadowStyle"), new objj_ivar("_showsResizeIndicator"), new objj_ivar("_positioningMask"), new objj_ivar("_positioningScreenRect"), new objj_ivar("_isDocumentEdited"), new objj_ivar("_isDocumentSaving"), new objj_ivar("_shadowView"), new objj_ivar("_windowView"), new objj_ivar("_contentView"), new objj_ivar("_toolbarView"), new objj_ivar("_mouseEnteredStack"), new objj_ivar("_leftMouseDownView"), new objj_ivar("_rightMouseDownView"), new objj_ivar("_toolbar"), new objj_ivar("_firstResponder"), new objj_ivar("_initialFirstResponder"), new objj_ivar("_hasBecomeKeyWindow"), new objj_ivar("_delegate"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_title"), new objj_ivar("_acceptsMouseMovedEvents"), new objj_ivar("_ignoresMouseEvents"), new objj_ivar("_windowController"), new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_undoManager"), new objj_ivar("_representedURL"), new objj_ivar("_registeredDraggedTypes"), new objj_ivar("_registeredDraggedTypesArray"), new objj_ivar("_inclusiveRegisteredDraggedTypes"), new objj_ivar("_defaultButton"), new objj_ivar("_defaultButtonEnabled"), new objj_ivar("_autorecalculatesKeyViewLoop"), new objj_ivar("_keyViewLoopIsDirty"), new objj_ivar("_sharesChromeWithPlatformWindow"), new objj_ivar("_DOMElement"), new objj_ivar("_autoresizingMask"), new objj_ivar("_isFullPlatformWindow"), new objj_ivar("_fullPlatformWindowSession"), new objj_ivar("_parentWindow"), new objj_ivar("_childWindows"), new objj_ivar("_childOrdering"), new objj_ivar("_sheetContext"), new objj_ivar("_parentView"), new objj_ivar("_isSheet"), new objj_ivar("_frameAnimation")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_hasBeenOrderedIn"), function $CPWindow___hasBeenOrderedIn(self, _cmd)
{
    return self._hasBeenOrderedIn;
}
,["BOOL"]), new objj_method(sel_getUid("_setHasBeenOrderedIn:"), function $CPWindow___setHasBeenOrderedIn_(self, _cmd, newValue)
{
    self._hasBeenOrderedIn = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("_childOrdering"), function $CPWindow___childOrdering(self, _cmd)
{
    return self._childOrdering;
}
,["CPWindowOrderingMode"]), new objj_method(sel_getUid("_setChildOrdering:"), function $CPWindow___setChildOrdering_(self, _cmd, newValue)
{
    self._childOrdering = newValue;
}
,["void","CPWindowOrderingMode"]), new objj_method(sel_getUid("init"), function $CPWindow__init(self, _cmd)
{
    return objj_msgSend(self, "initWithContentRect:styleMask:", CGRectMakeZero(), CPTitledWindowMask);
}
,["id"]), new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $CPWindow__initWithContentRect_styleMask_(self, _cmd, aContentRect, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow").super_class }, "init");
    if (self)
    {
        var windowViewClass = objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForStyleMask:", aStyleMask);
        self._frame = objj_msgSend(windowViewClass, "frameRectForContentRect:", aContentRect);
        self._constrainsToUsableScreen = YES;
        objj_msgSend(self, "_setSharesChromeWithPlatformWindow:", !objj_msgSend(CPPlatform, "isBrowser"));
        if (objj_msgSend(CPPlatform, "isBrowser"))
            objj_msgSend(self, "setPlatformWindow:", objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"));
        else
        {
            if (aStyleMask & CPBorderlessBridgeWindowMask && aContentRect.size.width === 0 && aContentRect.size.height === 0)
            {
                var visibleFrame = objj_msgSend(objj_msgSend(objj_msgSend(CPScreen, "alloc"), "init"), "visibleFrame");
                self._frame.size.height = MIN(768.0, visibleFrame.size.height);
                self._frame.size.width = MIN(1024.0, visibleFrame.size.width);
                self._frame.origin.x = (visibleFrame.size.width - self._frame.size.width) / 2;
                self._frame.origin.y = (visibleFrame.size.height - self._frame.size.height) / 2;
            }
            objj_msgSend(self, "setPlatformWindow:", objj_msgSend(objj_msgSend(CPPlatformWindow, "alloc"), "initWithContentRect:", self._frame));
            objj_msgSend(self, "platformWindow")._only = self;
        }
        self._isFullPlatformWindow = NO;
        self._registeredDraggedTypes = objj_msgSend(CPSet, "set");
        self._registeredDraggedTypesArray = [];
        self._acceptsMouseMovedEvents = YES;
        self._isMovable = YES;
        self._hasBeenOrderedIn = NO;
        self._parentWindow = nil;
        self._childWindows = [];
        self._childOrdering = CPWindowOut;
        self._isSheet = NO;
        self._sheetContext = nil;
        self._parentView = nil;
        self._windowNumber = objj_msgSend(CPApp._windows, "count");
        CPApp._windows[self._windowNumber] = self;
        self._styleMask = aStyleMask;
        objj_msgSend(self, "setLevel:", CPNormalWindowLevel);
        self._windowView = objj_msgSend(objj_msgSend(windowViewClass, "alloc"), "initWithFrame:styleMask:", CGRectMake(0.0, 0.0, CGRectGetWidth(self._frame), CGRectGetHeight(self._frame)), aStyleMask);
        objj_msgSend(self._windowView, "_setWindow:", self);
        objj_msgSend(self._windowView, "setNextResponder:", self);
        self._minSize = objj_msgSend(self, "_calculateMinSizeForProposedSize:", CGSizeMake(0.0, 0.0));
        self._maxSize = CGSizeMake(1000000.0, 1000000.0);
        objj_msgSend(self, "setMovableByWindowBackground:", aStyleMask & CPHUDBackgroundWindowMask);
        objj_msgSend(self, "setContentView:", objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero()));
        self._firstResponder = self;
        self._DOMElement = document.createElement("div");
        self._DOMElement.style.position = "absolute";
        self._DOMElement.style.visibility = "visible";
        self._DOMElement.style.zIndex = 0;
        if (!objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        {
            if (NULL)
                var ____p = CGPointApplyAffineTransform(CGPointMake(CGRectGetMinX(self._frame), CGRectGetMinY(self._frame)), NULL);
            else
                var ____p = CGPointMake(CGRectGetMinX(self._frame), CGRectGetMinY(self._frame));
            self._DOMElement.style.left = ROUND(____p.x) + "px";
            self._DOMElement.style.top = ROUND(____p.y) + "px";
        }
        self._DOMElement.style.width = MAX(0.0, ROUND(1)) + "px";
        self._DOMElement.style.height = MAX(0.0, ROUND(1)) + "px";
        self._DOMElement.appendChild(self._windowView._DOMElement);
        objj_msgSend(self, "setNextResponder:", CPApp);
        objj_msgSend(self, "setHasShadow:", aStyleMask !== CPBorderlessWindowMask);
        if (aStyleMask & CPBorderlessBridgeWindowMask)
            objj_msgSend(self, "setFullPlatformWindow:", YES);
        self._autorecalculatesKeyViewLoop = NO;
        self._defaultButtonEnabled = YES;
        self._keyViewLoopIsDirty = NO;
        self._hasBecomeKeyWindow = NO;
        objj_msgSend(self, "setShowsResizeIndicator:", self._styleMask & CPResizableWindowMask);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_didReceiveResizeStyleChange:"), CPWindowResizeStyleGlobalChangeNotification, nil);
    }
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("platformWindow"), function $CPWindow__platformWindow(self, _cmd)
{
    return self._platformWindow;
}
,["CPPlatformWindow"]), new objj_method(sel_getUid("setPlatformWindow:"), function $CPWindow__setPlatformWindow_(self, _cmd, aPlatformWindow)
{
    var wasVisible = objj_msgSend(self, "isVisible");
    if (wasVisible)
        objj_msgSend(self, "close");
    self._platformWindow = aPlatformWindow;
    objj_msgSend(self._platformWindow, "_setTitle:window:", self._title, self);
    if (wasVisible)
        objj_msgSend(self, "orderFront:", self);
}
,["void","CPPlatformWindow"]), new objj_method(sel_getUid("awakeFromCib"), function $CPWindow__awakeFromCib(self, _cmd)
{
    if (self._positioningScreenRect)
    {
        var actualScreenRect = objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(self._platformWindow, "contentBounds") : objj_msgSend(objj_msgSend(self, "screen"), "visibleFrame"),
            frame = objj_msgSend(self, "frame"),
            origin = frame.origin;
        if (actualScreenRect)
        {
            if (self._positioningMask & CPWindowPositionFlexibleLeft && self._positioningMask & CPWindowPositionFlexibleRight)
            {
                origin.x *= actualScreenRect.size.width / self._positioningScreenRect.size.width;
            }
            else if (self._positioningMask & CPWindowPositionFlexibleLeft)
            {
                origin.x += actualScreenRect.size.width - self._positioningScreenRect.size.width;
            }
            else if (self._positioningMask & CPWindowPositionFlexibleRight)
            {
            }
            if (self._positioningMask & CPWindowPositionFlexibleTop && self._positioningMask & CPWindowPositionFlexibleBottom)
            {
                origin.y *= actualScreenRect.size.height / self._positioningScreenRect.size.height;
            }
            else if (self._positioningMask & CPWindowPositionFlexibleTop)
            {
                origin.y += actualScreenRect.size.height - self._positioningScreenRect.size.height;
            }
            else if (self._positioningMask & CPWindowPositionFlexibleBottom)
            {
            }
            objj_msgSend(self, "setFrameOrigin:", origin);
        }
    }
    if (objj_msgSend(self, "_hasKeyViewLoop:", objj_msgSend(self._contentView, "subviews")))
    {
        var views = objj_msgSend(self, "_viewsSortedByPosition"),
            count = objj_msgSend(views, "count");
        for (var i = 1; i < count; ++i)
        {
            var view = views[i];
            if (objj_msgSend(view, "nextKeyView"))
            {
                objj_msgSend(self._contentView, "setNextKeyView:", view);
                break;
            }
        }
    }
    else
    {
        objj_msgSend(self, "_doRecalculateKeyViewLoop");
    }
}
,["void"]), new objj_method(sel_getUid("_setWindowView:"), function $CPWindow___setWindowView_(self, _cmd, aWindowView)
{
    if (self._windowView === aWindowView)
        return;
    var oldWindowView = self._windowView;
    self._windowView = aWindowView;
    if (oldWindowView)
    {
        objj_msgSend(oldWindowView, "_setWindow:", nil);
        objj_msgSend(oldWindowView, "noteToolbarChanged");
        self._DOMElement.removeChild(oldWindowView._DOMElement);
    }
    if (self._windowView)
    {
        self._DOMElement.appendChild(self._windowView._DOMElement);
        var contentRect = objj_msgSend(self._contentView, "convertRect:toView:", objj_msgSend(self._contentView, "bounds"), nil);
        contentRect.origin = objj_msgSend(self, "convertBaseToGlobal:", contentRect.origin);
        objj_msgSend(self._windowView, "_setWindow:", self);
        objj_msgSend(self._windowView, "setNextResponder:", self);
        objj_msgSend(self._windowView, "addSubview:", self._contentView);
        objj_msgSend(self._windowView, "setTitle:", self._title);
        objj_msgSend(self._windowView, "noteToolbarChanged");
        objj_msgSend(self._windowView, "setShowsResizeIndicator:", objj_msgSend(self, "showsResizeIndicator"));
        objj_msgSend(self, "setFrame:", objj_msgSend(self, "frameRectForContentRect:", contentRect));
    }
}
,["void","CPView"]), new objj_method(sel_getUid("setFullPlatformWindow:"), function $CPWindow__setFullPlatformWindow_(self, _cmd, shouldBeFullPlatformWindow)
{
    if (!objj_msgSend(self._platformWindow, "supportsFullPlatformWindows"))
        return;
    shouldBeFullPlatformWindow = !!shouldBeFullPlatformWindow;
    if (self._isFullPlatformWindow === shouldBeFullPlatformWindow)
        return;
    self._isFullPlatformWindow = shouldBeFullPlatformWindow;
    if (self._isFullPlatformWindow)
    {
        self._fullPlatformWindowSession = _CPWindowFullPlatformWindowSessionMake(self._windowView, objj_msgSend(self, "contentRectForFrameRect:", objj_msgSend(self, "frame")), objj_msgSend(self, "hasShadow"), objj_msgSend(self, "level"));
        var fullPlatformWindowViewClass = objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForFullPlatformWindowStyleMask:", self._styleMask),
            windowView = objj_msgSend(objj_msgSend(fullPlatformWindowViewClass, "alloc"), "initWithFrame:styleMask:", CGRectMakeZero(), self._styleMask);
        objj_msgSend(self, "_setWindowView:", windowView);
        objj_msgSend(self, "setLevel:", CPBackgroundWindowLevel);
        objj_msgSend(self, "setHasShadow:", NO);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowWidthSizable | CPWindowHeightSizable);
        objj_msgSend(self, "setFrame:", objj_msgSend(self._platformWindow, "visibleFrame"));
    }
    else
    {
        var windowView = self._fullPlatformWindowSession.windowView;
        objj_msgSend(self, "_setWindowView:", windowView);
        objj_msgSend(self, "setLevel:", self._fullPlatformWindowSession.level);
        objj_msgSend(self, "setHasShadow:", self._fullPlatformWindowSession.hasShadow);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowNotSizable);
        objj_msgSend(self, "setFrame:", objj_msgSend(windowView, "frameRectForContentRect:", self._fullPlatformWindowSession.contentRect));
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("isFullPlatformWindow"), function $CPWindow__isFullPlatformWindow(self, _cmd)
{
    return self._isFullPlatformWindow;
}
,["BOOL"]), new objj_method(sel_getUid("styleMask"), function $CPWindow__styleMask(self, _cmd)
{
    return self._styleMask;
}
,["unsigned"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $CPWindow__contentRectForFrameRect_(self, _cmd, aFrame)
{
    return objj_msgSend(self._windowView, "contentRectForFrameRect:", aFrame);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $CPWindow__frameRectForContentRect_(self, _cmd, aContentRect)
{
    return objj_msgSend(self._windowView, "frameRectForContentRect:", aContentRect);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frame"), function $CPWindow__frame(self, _cmd)
{
    return CGRectMakeCopy(self._frame);
}
,["CGRect"]), new objj_method(sel_getUid("setFrame:display:animate:"), function $CPWindow__setFrame_display_animate_(self, _cmd, aFrame, shouldDisplay, shouldAnimate)
{
    objj_msgSend(self, "_setFrame:display:animate:constrainWidth:constrainHeight:", aFrame, shouldDisplay, shouldAnimate, NO, YES);
}
,["void","CGRect","BOOL","BOOL"]), new objj_method(sel_getUid("_setFrame:display:animate:constrainWidth:constrainHeight:"), function $CPWindow___setFrame_display_animate_constrainWidth_constrainHeight_(self, _cmd, aFrame, shouldDisplay, shouldAnimate, shouldConstrainWidth, shouldConstrainHeight)
{
    var frame = CGRectMakeCopy(aFrame),
        value = frame.origin.x,
        delta = value - FLOOR(value);
    if (delta)
        frame.origin.x = value > 0.879 ? CEIL(value) : FLOOR(value);
    value = frame.origin.y;
    delta = value - FLOOR(value);
    if (delta)
        frame.origin.y = value > 0.879 ? CEIL(value) : FLOOR(value);
    value = frame.size.width;
    delta = value - FLOOR(value);
    if (delta)
        frame.size.width = value > 0.15 ? CEIL(value) : FLOOR(value);
    value = frame.size.height;
    delta = value - FLOOR(value);
    if (delta)
        frame.size.height = value > 0.15 ? CEIL(value) : FLOOR(value);
    frame = objj_msgSend(self, "_constrainFrame:toUsableScreenWidth:andHeight:", frame, shouldConstrainWidth, shouldConstrainHeight);
    if (shouldAnimate)
    {
        objj_msgSend(self._frameAnimation, "stopAnimation");
        self._frameAnimation = objj_msgSend(objj_msgSend(_CPWindowFrameAnimation, "alloc"), "initWithWindow:targetFrame:", self, frame);
        objj_msgSend(self._frameAnimation, "startAnimation");
    }
    else
    {
        var origin = self._frame.origin,
            newOrigin = frame.origin,
            originMoved = !CGPointEqualToPoint(origin, newOrigin);
        if (originMoved)
        {
            delta = CGPointMake(newOrigin.x - origin.x, newOrigin.y - origin.y);
            origin.x = newOrigin.x;
            origin.y = newOrigin.y;
            if (!objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
            {
                if (NULL)
                    var ____p = CGPointApplyAffineTransform(CGPointMake(origin.x, origin.y), NULL);
                else
                    var ____p = CGPointMake(origin.x, origin.y);
                self._DOMElement.style.left = ROUND(____p.x) + "px";
                self._DOMElement.style.top = ROUND(____p.y) + "px";
            }
            if (objj_msgSend(self, "attachedSheet"))
                objj_msgSend(self, "_setAttachedSheetFrameOrigin");
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidMoveNotification, self);
        }
        var size = self._frame.size,
            newSize = frame.size;
        if (!CGSizeEqualToSize(size, newSize))
        {
            size.width = newSize.width;
            size.height = newSize.height;
            objj_msgSend(self._windowView, "setFrameSize:", size);
            if (self._hasShadow)
                objj_msgSend(self._shadowView, "setNeedsLayout");
            if (!self._isAnimating)
                objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidResizeNotification, self);
        }
        if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
            objj_msgSend(self._platformWindow, "setContentRect:", self._frame);
        if (originMoved)
            objj_msgSend(self, "_moveChildWindows:", delta);
    }
}
,["void","CGRect","BOOL","BOOL","BOOL","BOOL"]), new objj_method(sel_getUid("_constrainFrame:toUsableScreenWidth:andHeight:"), function $CPWindow___constrainFrame_toUsableScreenWidth_andHeight_(self, _cmd, aFrame, constrainWidth, constrainHeight)
{
    var frame = CGRectMakeCopy(aFrame);
    if (!self._constrainsToUsableScreen || !self._isVisible)
        return frame;
    var usableRect = objj_msgSend(self._platformWindow, "usableContentFrame");
    if (constrainWidth)
    {
        frame.origin.x = MAX(frame.origin.x, usableRect.origin.x);
        var maxX = MIN(CGRectGetMaxX(frame), CGRectGetMaxX(usableRect));
        frame.origin.x = maxX - frame.size.width;
        var usableWidth = CGRectGetWidth(usableRect);
        if (CGRectGetWidth(frame) > usableWidth)
        {
            frame.origin.x = CGRectGetMinX(usableRect);
            frame.size.width = MAX(usableWidth, self._minSize.width);
        }
    }
    if (constrainHeight)
    {
        frame.origin.y = MAX(frame.origin.y, usableRect.origin.y);
        var maxY = MIN(CGRectGetMaxY(frame), CGRectGetMaxY(usableRect));
        frame.origin.y = maxY - frame.size.height;
        var usableHeight = CGRectGetHeight(usableRect);
        if (CGRectGetHeight(frame) > usableHeight)
        {
            frame.origin.y = CGRectGetMinY(usableRect);
            frame.size.height = MAX(usableHeight, self._minSize.height);
        }
    }
    return frame;
}
,["CGRect","CGRect","BOOL","BOOL"]), new objj_method(sel_getUid("_constrainOriginOfFrame:"), function $CPWindow___constrainOriginOfFrame_(self, _cmd, aFrame)
{
    var frame = CGRectMakeCopy(aFrame);
    if (!self._constrainsToUsableScreen || !self._isVisible)
        return frame;
    var usableRect = objj_msgSend(self._platformWindow, "usableContentFrame"),
        minimumSize = objj_msgSend(self._windowView, "_minimumResizeSize");
    frame.origin.x = MAX(frame.origin.x, CGRectGetMinX(usableRect) + minimumSize.width - CGRectGetWidth(frame));
    frame.origin.x = MIN(frame.origin.x, CGRectGetMaxX(usableRect) - minimumSize.width);
    frame.origin.y = MAX(frame.origin.y, CGRectGetMinY(usableRect));
    frame.origin.y = MIN(frame.origin.y, CGRectGetMaxY(usableRect) - CGRectGetMinY(objj_msgSend(self._contentView, "frame")) - CPWindowMinVisibleVerticalMargin);
    return frame;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("_moveChildWindows:"), function $CPWindow___moveChildWindows_(self, _cmd, delta)
{
    objj_msgSend(self._childWindows, "enumerateObjectsUsingBlock:", function(childWindow)
    {
        var origin = objj_msgSend(childWindow, "frame").origin;
        objj_msgSend(childWindow, "setFrameOrigin:", CGPointMake(origin.x + delta.x, origin.y + delta.y));
    });
}
,["void","CGPoint"]), new objj_method(sel_getUid("setFrame:display:"), function $CPWindow__setFrame_display_(self, _cmd, aFrame, shouldDisplay)
{
    objj_msgSend(self, "setFrame:display:animate:", aFrame, shouldDisplay, NO);
}
,["void","CGRect","BOOL"]), new objj_method(sel_getUid("setFrame:"), function $CPWindow__setFrame_(self, _cmd, aFrame)
{
    objj_msgSend(self, "setFrame:display:animate:", aFrame, YES, NO);
}
,["void","CGRect"]), new objj_method(sel_getUid("setFrameOrigin:"), function $CPWindow__setFrameOrigin_(self, _cmd, anOrigin)
{
    var frame = objj_msgSend(self, "_constrainOriginOfFrame:", CGRectMake(anOrigin.x, anOrigin.y, self._frame.size.width, self._frame.size.height));
    objj_msgSend(self, "_setFrame:display:animate:constrainWidth:constrainHeight:", frame, YES, NO, NO, NO);
}
,["void","CGPoint"]), new objj_method(sel_getUid("setFrameSize:"), function $CPWindow__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSend(self, "setFrame:display:animate:", CGRectMake(CGRectGetMinX(self._frame), CGRectGetMinY(self._frame), aSize.width, aSize.height), YES, NO);
}
,["void","CGSize"]), new objj_method(sel_getUid("orderFront:"), function $CPWindow__orderFront_(self, _cmd, aSender)
{
    objj_msgSend(self, "orderWindow:relativeTo:", CPWindowAbove, 0);
}
,["void","id"]), new objj_method(sel_getUid("_orderFront"), function $CPWindow___orderFront(self, _cmd)
{
    if (self._isSheet)
        objj_msgSend(self._parentView, "orderFront:", self);
    if (!self._isVisible)
        objj_msgSend(self, "_setFrame:display:animate:constrainWidth:constrainHeight:", self._frame, YES, NO, YES, YES);
    objj_msgSend(self._platformWindow, "orderFront:", self);
    objj_msgSend(self._platformWindow, "order:window:relativeTo:", CPWindowAbove, self, nil);
    if (!CPApp._keyWindow)
        objj_msgSend(self, "makeKeyWindow");
    if (objj_msgSend(self, "isKeyWindow") && (self._firstResponder === self || !self._firstResponder))
        objj_msgSend(self, "makeFirstResponder:", self._initialFirstResponder);
    if (!CPApp._mainWindow)
        objj_msgSend(self, "makeMainWindow");
}
,["void"]), new objj_method(sel_getUid("_parentDidOrderInChild"), function $CPWindow___parentDidOrderInChild(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("orderBack:"), function $CPWindow__orderBack_(self, _cmd, aSender)
{
    objj_msgSend(self, "orderWindow:relativeTo:", CPWindowBelow, 0);
}
,["void","id"]), new objj_method(sel_getUid("_orderBack"), function $CPWindow___orderBack(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("orderOut:"), function $CPWindow__orderOut_(self, _cmd, aSender)
{
    objj_msgSend(self, "orderWindow:relativeTo:", CPWindowOut, 0);
}
,["void","id"]), new objj_method(sel_getUid("_orderOutRecursively:"), function $CPWindow___orderOutRecursively_(self, _cmd, recursive)
{
    if (!self._isVisible)
        return;
    if (objj_msgSend(self, "isSheet"))
    {
        objj_msgSend(self._parentView, "_detachSheetWindow");
        return;
    }
    if (recursive)
        objj_msgSend(self._childWindows, "makeObjectsPerformSelector:withObject:", sel_getUid("_orderOutRecursively:"), recursive);
    if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        objj_msgSend(self._platformWindow, "orderOut:", self);
    objj_msgSend(self._platformWindow, "order:window:relativeTo:", CPWindowOut, self, nil);
    objj_msgSend(self, "_updateMainAndKeyWindows");
}
,["void","BOOL"]), new objj_method(sel_getUid("orderWindow:relativeTo:"), function $CPWindow__orderWindow_relativeTo_(self, _cmd, orderingMode, otherWindowNumber)
{
    if (orderingMode === CPWindowOut)
    {
        objj_msgSend(self._parentWindow, "removeChildWindow:", self);
        objj_msgSend(self, "_orderOutRecursively:", !self._parentWindow);
    }
    else if (orderingMode === CPWindowAbove && otherWindowNumber === 0)
        objj_msgSend(self, "_orderFront");
    else if (orderingMode === CPWindowBelow && otherWindowNumber === 0)
        objj_msgSend(self, "_orderBack");
    else
        objj_msgSend(self._platformWindow, "order:window:relativeTo:", orderingMode, self, CPApp._windows[otherWindowNumber]);
}
,["void","CPWindowOrderingMode","int"]), new objj_method(sel_getUid("setLevel:"), function $CPWindow__setLevel_(self, _cmd, aLevel)
{
    if (aLevel === self._level)
        return;
    objj_msgSend(self._platformWindow, "moveWindow:fromLevel:toLevel:", self, self._level, aLevel);
    self._level = aLevel;
    objj_msgSend(self._childWindows, "makeObjectsPerformSelector:withObject:", sel_getUid("setLevel:"), self._level);
    if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        objj_msgSend(self._platformWindow, "setLevel:", aLevel);
}
,["void","int"]), new objj_method(sel_getUid("level"), function $CPWindow__level(self, _cmd)
{
    return self._level;
}
,["int"]), new objj_method(sel_getUid("isVisible"), function $CPWindow__isVisible(self, _cmd)
{
    return self._isVisible;
}
,["BOOL"]), new objj_method(sel_getUid("_didReceiveResizeStyleChange:"), function $CPWindow___didReceiveResizeStyleChange_(self, _cmd, aNotification)
{
    objj_msgSend(self._windowView, "setShowsResizeIndicator:", self._styleMask & CPResizableWindowMask);
}
,["void","CPNotification"]), new objj_method(sel_getUid("showsResizeIndicator"), function $CPWindow__showsResizeIndicator(self, _cmd)
{
    return self._showsResizeIndicator;
}
,["BOOL"]), new objj_method(sel_getUid("setShowsResizeIndicator:"), function $CPWindow__setShowsResizeIndicator_(self, _cmd, shouldShowResizeIndicator)
{
    shouldShowResizeIndicator = !!shouldShowResizeIndicator;
    if (self._showsResizeIndicator === shouldShowResizeIndicator)
        return;
    self._showsResizeIndicator = shouldShowResizeIndicator;
    objj_msgSend(self._windowView, "setShowsResizeIndicator:", objj_msgSend(self, "showsResizeIndicator"));
}
,["void","BOOL"]), new objj_method(sel_getUid("resizeIndicatorOffset"), function $CPWindow__resizeIndicatorOffset(self, _cmd)
{
    return objj_msgSend(self._windowView, "resizeIndicatorOffset");
}
,["CGSize"]), new objj_method(sel_getUid("setResizeIndicatorOffset:"), function $CPWindow__setResizeIndicatorOffset_(self, _cmd, anOffset)
{
    objj_msgSend(self._windowView, "setResizeIndicatorOffset:", anOffset);
}
,["void","CGSize"]), new objj_method(sel_getUid("setContentView:"), function $CPWindow__setContentView_(self, _cmd, aView)
{
    if (self._contentView)
        objj_msgSend(self._contentView, "removeFromSuperview");
    var bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(self._frame), CGRectGetHeight(self._frame));
    self._contentView = aView;
    objj_msgSend(self._contentView, "setFrame:", objj_msgSend(self, "contentRectForFrameRect:", bounds));
    objj_msgSend(self._contentView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(self._windowView, "addSubview:", self._contentView);
    if (self._initialFirstResponder && self._initialFirstResponder !== self)
        self._initialFirstResponder = self;
}
,["void","CPView"]), new objj_method(sel_getUid("contentView"), function $CPWindow__contentView(self, _cmd)
{
    return self._contentView;
}
,["CPView"]), new objj_method(sel_getUid("setAlphaValue:"), function $CPWindow__setAlphaValue_(self, _cmd, aValue)
{
    objj_msgSend(self._windowView, "setAlphaValue:", aValue);
}
,["void","float"]), new objj_method(sel_getUid("alphaValue"), function $CPWindow__alphaValue(self, _cmd)
{
    return objj_msgSend(self._windowView, "alphaValue");
}
,["float"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPWindow__setBackgroundColor_(self, _cmd, aColor)
{
    objj_msgSend(self._windowView, "setBackgroundColor:", aColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CPWindow__backgroundColor(self, _cmd)
{
    return objj_msgSend(self._windowView, "backgroundColor");
}
,["CPColor"]), new objj_method(sel_getUid("setMinSize:"), function $CPWindow__setMinSize_(self, _cmd, aSize)
{
    if (CGSizeEqualToSize(self._minSize, aSize))
        return;
    self._minSize = objj_msgSend(self, "_calculateMinSizeForProposedSize:", aSize);
    var size = CGSizeMakeCopy(objj_msgSend(self, "frame").size),
        needsFrameChange = NO;
    if (size.width < self._minSize.width)
    {
        size.width = self._minSize.width;
        needsFrameChange = YES;
    }
    if (size.height < self._minSize.height)
    {
        size.height = self._minSize.height;
        needsFrameChange = YES;
    }
    if (needsFrameChange)
        objj_msgSend(self, "setFrameSize:", size);
}
,["void","CGSize"]), new objj_method(sel_getUid("minSize"), function $CPWindow__minSize(self, _cmd)
{
    return self._minSize;
}
,["CGSize"]), new objj_method(sel_getUid("_calculateMinSizeForProposedSize:"), function $CPWindow___calculateMinSizeForProposedSize_(self, _cmd, proposedSize)
{
    var contentFrame = objj_msgSend(self, "contentRectForFrameRect:", self._frame),
        minHeight = CGRectGetHeight(self._frame) - CGRectGetHeight(contentFrame);
    return CGSizeMake(MAX(proposedSize.width, 0), MAX(proposedSize.height, minHeight));
}
,["CGSize","CGSize"]), new objj_method(sel_getUid("setMaxSize:"), function $CPWindow__setMaxSize_(self, _cmd, aSize)
{
    if (CGSizeEqualToSize(self._maxSize, aSize))
        return;
    self._maxSize = CGSizeMakeCopy(aSize);
    var size = CGSizeMakeCopy(objj_msgSend(self, "frame").size),
        needsFrameChange = NO;
    if (size.width > self._maxSize.width)
    {
        size.width = self._maxSize.width;
        needsFrameChange = YES;
    }
    if (size.height > self._maxSize.height)
    {
        size.height = self._maxSize.height;
        needsFrameChange = YES;
    }
    if (needsFrameChange)
        objj_msgSend(self, "setFrameSize:", size);
}
,["void","CGSize"]), new objj_method(sel_getUid("maxSize"), function $CPWindow__maxSize(self, _cmd)
{
    return self._maxSize;
}
,["CGSize"]), new objj_method(sel_getUid("hasShadow"), function $CPWindow__hasShadow(self, _cmd)
{
    return self._hasShadow;
}
,["BOOL"]), new objj_method(sel_getUid("_updateShadow"), function $CPWindow___updateShadow(self, _cmd)
{
    if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
    {
        if (self._shadowView)
        {
            self._DOMElement.removeChild(self._shadowView._DOMElement);
            self._shadowView = nil;
        }
        objj_msgSend(self._platformWindow, "setHasShadow:", self._hasShadow);
        return;
    }
    if (self._hasShadow && !self._shadowView)
    {
        self._shadowView = objj_msgSend(objj_msgSend(_CPShadowWindowView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._shadowView, "setWindowView:", self._windowView);
        objj_msgSend(self._shadowView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self._shadowView, "setNeedsLayout");
        self._DOMElement.insertBefore(self._shadowView._DOMElement, self._windowView._DOMElement);
    }
    else if (!self._hasShadow && self._shadowView)
    {
        self._DOMElement.removeChild(self._shadowView._DOMElement);
        self._shadowView = nil;
    }
}
,["void"]), new objj_method(sel_getUid("setHasShadow:"), function $CPWindow__setHasShadow_(self, _cmd, shouldHaveShadow)
{
    if (self._hasShadow === shouldHaveShadow)
        return;
    self._hasShadow = shouldHaveShadow;
    objj_msgSend(self, "_updateShadow");
}
,["void","BOOL"]), new objj_method(sel_getUid("setShadowStyle:"), function $CPWindow__setShadowStyle_(self, _cmd, aStyle)
{
    self._shadowStyle = aStyle;
    objj_msgSend(objj_msgSend(self, "platformWindow"), "setShadowStyle:", self._shadowStyle);
}
,["void","unsigned"]), new objj_method(sel_getUid("setDelegate:"), function $CPWindow__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidResignKeyNotification, self);
    objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidBecomeKeyNotification, self);
    objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidBecomeMainNotification, self);
    objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidResignMainNotification, self);
    objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidMoveNotification, self);
    objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidResizeNotification, self);
    objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowWillBeginSheetNotification, self);
    objj_msgSend(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidEndSheetNotification, self);
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowShouldClose:")))
        self._implementedDelegateMethods |= CPWindowDelegate_windowShouldClose_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowWillReturnUndoManager:")))
        self._implementedDelegateMethods |= CPWindowDelegate_windowWillReturnUndoManager_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowWillClose:")))
        self._implementedDelegateMethods |= CPWindowDelegate_windowWillClose_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowDidResignKey:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidResignKey:"), CPWindowDidResignKeyNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowDidBecomeKey:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidBecomeKey:"), CPWindowDidBecomeKeyNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowDidBecomeMain:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidBecomeMain:"), CPWindowDidBecomeMainNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowDidResignMain:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidResignMain:"), CPWindowDidResignMainNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowDidMove:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidMove:"), CPWindowDidMoveNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowDidResize:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidResize:"), CPWindowDidResizeNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowWillBeginSheet:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowWillBeginSheet:"), CPWindowWillBeginSheetNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("windowDidEndSheet:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidEndSheet:"), CPWindowDidEndSheetNotification, self);
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPWindow__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("setWindowController:"), function $CPWindow__setWindowController_(self, _cmd, aWindowController)
{
    self._windowController = aWindowController;
}
,["void","CPWindowController"]), new objj_method(sel_getUid("windowController"), function $CPWindow__windowController(self, _cmd)
{
    return self._windowController;
}
,["CPWindowController"]), new objj_method(sel_getUid("doCommandBySelector:"), function $CPWindow__doCommandBySelector_(self, _cmd, aSelector)
{
    if (objj_msgSend(self._delegate, "respondsToSelector:", aSelector))
        objj_msgSend(self._delegate, "performSelector:", aSelector);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow").super_class }, "doCommandBySelector:", aSelector);
}
,["void","SEL"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPWindow__acceptsFirstResponder(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("initialFirstResponder"), function $CPWindow__initialFirstResponder(self, _cmd)
{
    return self._initialFirstResponder;
}
,["CPView"]), new objj_method(sel_getUid("setInitialFirstResponder:"), function $CPWindow__setInitialFirstResponder_(self, _cmd, aView)
{
    self._initialFirstResponder = aView;
}
,["void","CPView"]), new objj_method(sel_getUid("_setupFirstResponder"), function $CPWindow___setupFirstResponder(self, _cmd)
{
    if (!self._hasBecomeKeyWindow)
    {
        if (self._firstResponder === self)
        {
            if (self._initialFirstResponder)
                objj_msgSend(self, "makeFirstResponder:", self._initialFirstResponder);
            else
            {
                var view = objj_msgSend(self._contentView, "nextValidKeyView");
                if (view)
                    objj_msgSend(self, "makeFirstResponder:", view);
            }
            return;
        }
    }
    if (self._firstResponder)
        objj_msgSend(self, "makeFirstResponder:", self._firstResponder);
}
,["void"]), new objj_method(sel_getUid("makeFirstResponder:"), function $CPWindow__makeFirstResponder_(self, _cmd, aResponder)
{
    if (self._firstResponder === aResponder)
        return YES;
    if (!objj_msgSend(self._firstResponder, "resignFirstResponder"))
        return NO;
    if (!aResponder || !objj_msgSend(aResponder, "acceptsFirstResponder") || !objj_msgSend(aResponder, "becomeFirstResponder"))
    {
        self._firstResponder = self;
        return NO;
    }
    self._firstResponder = aResponder;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", _CPWindowDidChangeFirstResponderNotification, self);
    return YES;
}
,["BOOL","CPResponder"]), new objj_method(sel_getUid("firstResponder"), function $CPWindow__firstResponder(self, _cmd)
{
    return self._firstResponder;
}
,["CPResponder"]), new objj_method(sel_getUid("acceptsMouseMovedEvents"), function $CPWindow__acceptsMouseMovedEvents(self, _cmd)
{
    return self._acceptsMouseMovedEvents;
}
,["BOOL"]), new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"), function $CPWindow__setAcceptsMouseMovedEvents_(self, _cmd, shouldAcceptMouseMovedEvents)
{
    self._acceptsMouseMovedEvents = shouldAcceptMouseMovedEvents;
}
,["void","BOOL"]), new objj_method(sel_getUid("ignoresMouseEvents"), function $CPWindow__ignoresMouseEvents(self, _cmd)
{
    return self._ignoresMouseEvents;
}
,["BOOL"]), new objj_method(sel_getUid("setIgnoresMouseEvents:"), function $CPWindow__setIgnoresMouseEvents_(self, _cmd, shouldIgnoreMouseEvents)
{
    self._ignoresMouseEvents = shouldIgnoreMouseEvents;
}
,["void","BOOL"]), new objj_method(sel_getUid("_mouseExitedResizeRect"), function $CPWindow___mouseExitedResizeRect(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPCursor, "arrowCursor"), "set");
}
,["void"]), new objj_method(sel_getUid("title"), function $CPWindow__title(self, _cmd)
{
    return self._title;
}
,["CPString"]), new objj_method(sel_getUid("setTitle:"), function $CPWindow__setTitle_(self, _cmd, aTitle)
{
    self._title = aTitle;
    objj_msgSend(self._windowView, "setTitle:", aTitle);
    objj_msgSend(self._platformWindow, "_setTitle:window:", self._title, self);
}
,["void","CPString"]), new objj_method(sel_getUid("setTitleWithRepresentedFilename:"), function $CPWindow__setTitleWithRepresentedFilename_(self, _cmd, aFilePath)
{
    objj_msgSend(self, "setRepresentedFilename:", aFilePath);
    objj_msgSend(self, "setTitle:", objj_msgSend(aFilePath, "lastPathComponent"));
}
,["void","CPString"]), new objj_method(sel_getUid("setRepresentedFilename:"), function $CPWindow__setRepresentedFilename_(self, _cmd, aFilePath)
{
    objj_msgSend(self, "setRepresentedURL:", objj_msgSend(CPURL, "URLWithString:", aFilePath));
}
,["void","CPString"]), new objj_method(sel_getUid("representedFilename"), function $CPWindow__representedFilename(self, _cmd)
{
    return objj_msgSend(self._representedURL, "absoluteString");
}
,["CPString"]), new objj_method(sel_getUid("setRepresentedURL:"), function $CPWindow__setRepresentedURL_(self, _cmd, aURL)
{
    self._representedURL = aURL;
}
,["void","CPURL"]), new objj_method(sel_getUid("representedURL"), function $CPWindow__representedURL(self, _cmd)
{
    return self._representedURL;
}
,["CPURL"]), new objj_method(sel_getUid("screen"), function $CPWindow__screen(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPScreen, "alloc"), "init");
}
,["CPScreen"]), new objj_method(sel_getUid("setMovableByWindowBackground:"), function $CPWindow__setMovableByWindowBackground_(self, _cmd, shouldBeMovableByWindowBackground)
{
    self._isMovableByWindowBackground = shouldBeMovableByWindowBackground;
}
,["void","BOOL"]), new objj_method(sel_getUid("isMovableByWindowBackground"), function $CPWindow__isMovableByWindowBackground(self, _cmd)
{
    return self._isMovableByWindowBackground;
}
,["BOOL"]), new objj_method(sel_getUid("setMovable:"), function $CPWindow__setMovable_(self, _cmd, shouldBeMovable)
{
    self._isMovable = shouldBeMovable;
}
,["void","BOOL"]), new objj_method(sel_getUid("isMovable"), function $CPWindow__isMovable(self, _cmd)
{
    return self._isMovable;
}
,["void"]), new objj_method(sel_getUid("center"), function $CPWindow__center(self, _cmd)
{
    if (self._isFullPlatformWindow)
        return;
    var size = objj_msgSend(self, "frame").size,
        containerSize = objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(self._platformWindow, "contentBounds").size : objj_msgSend(objj_msgSend(self, "screen"), "visibleFrame").size;
    var origin = CGPointMake((containerSize.width - size.width) / 2.0, (containerSize.height - size.height) / 2.0);
    if (origin.x < 0.0)
        origin.x = 0.0;
    if (origin.y < 0.0)
        origin.y = 0.0;
    objj_msgSend(self, "setFrameOrigin:", origin);
}
,["void"]), new objj_method(sel_getUid("sendEvent:"), function $CPWindow__sendEvent_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type"),
        sheet = objj_msgSend(self, "attachedSheet");
    if (sheet)
    {
        switch(type) {
        case CPLeftMouseDown:
            if (!self._parentWindow)
                return;
            objj_msgSend(self._windowView, "mouseDown:", anEvent);
            objj_msgSend(sheet, "makeKeyAndOrderFront:", self);
            return;
        case CPMouseMoved:
            break;
default:
            return;
        }
    }
    var point = objj_msgSend(anEvent, "locationInWindow");
    switch(type) {
    case CPFlagsChanged:
        return objj_msgSend(objj_msgSend(self, "firstResponder"), "flagsChanged:", anEvent);
    case CPKeyUp:
        return objj_msgSend(objj_msgSend(self, "firstResponder"), "keyUp:", anEvent);
    case CPKeyDown:
        if (objj_msgSend(anEvent, "charactersIgnoringModifiers") === CPTabCharacter)
        {
            if (objj_msgSend(anEvent, "modifierFlags") & CPShiftKeyMask)
                objj_msgSend(self, "selectPreviousKeyView:", self);
            else
                objj_msgSend(self, "selectNextKeyView:", self);
            objj_msgSend(objj_msgSend(objj_msgSend(anEvent, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
            return;
        }
        else if (objj_msgSend(anEvent, "charactersIgnoringModifiers") === CPBackTabCharacter)
        {
            var didTabBack = objj_msgSend(self, "selectPreviousKeyView:", self);
            if (didTabBack)
            {
                objj_msgSend(objj_msgSend(objj_msgSend(anEvent, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
            }
            return didTabBack;
        }
        objj_msgSend(objj_msgSend(self, "firstResponder"), "keyDown:", anEvent);
        if (!objj_msgSend(self, "disableKeyEquivalentForDefaultButton"))
        {
            var defaultButton = objj_msgSend(self, "defaultButton"),
                keyEquivalent = objj_msgSend(defaultButton, "keyEquivalent"),
                modifierMask = objj_msgSend(defaultButton, "keyEquivalentModifierMask");
            if (objj_msgSend(anEvent, "_triggersKeyEquivalent:withModifierMask:", keyEquivalent, modifierMask))
                objj_msgSend(objj_msgSend(self, "defaultButton"), "performClick:", self);
        }
        return;
    case CPScrollWheel:
        return objj_msgSend(objj_msgSend(self._windowView, "hitTest:", point), "scrollWheel:", anEvent);
    case CPLeftMouseUp:
    case CPRightMouseUp:
        var hitTestedView = self._leftMouseDownView,
            selector = type == CPRightMouseUp ? sel_getUid("rightMouseUp:") : sel_getUid("mouseUp:");
        if (!hitTestedView)
            hitTestedView = objj_msgSend(self._windowView, "hitTest:", point);
        objj_msgSend(hitTestedView, "performSelector:withObject:", selector, anEvent);
        self._leftMouseDownView = nil;
        return;
    case CPLeftMouseDown:
    case CPRightMouseDown:
        self._leftMouseDownView = objj_msgSend(self._windowView, "hitTest:", point);
        if (self._leftMouseDownView !== self._firstResponder && objj_msgSend(self._leftMouseDownView, "acceptsFirstResponder"))
            objj_msgSend(self, "makeFirstResponder:", self._leftMouseDownView);
        objj_msgSend(CPApp, "activateIgnoringOtherApps:", YES);
        var theWindow = objj_msgSend(anEvent, "window"),
            selector = type == CPRightMouseDown ? sel_getUid("rightMouseDown:") : sel_getUid("mouseDown:");
        if (objj_msgSend(theWindow, "isKeyWindow") || objj_msgSend(theWindow, "becomesKeyOnlyIfNeeded") && !objj_msgSend(self._leftMouseDownView, "needsPanelToBecomeKey"))
            return objj_msgSend(self._leftMouseDownView, "performSelector:withObject:", selector, anEvent);
        else
        {
            objj_msgSend(self, "makeKeyAndOrderFront:", self);
            if (objj_msgSend(self._leftMouseDownView, "acceptsFirstMouse:", anEvent))
                return objj_msgSend(self._leftMouseDownView, "performSelector:withObject:", selector, anEvent);
        }
        break;
    case CPLeftMouseDragged:
    case CPRightMouseDragged:
        if (!self._leftMouseDownView)
            return objj_msgSend(objj_msgSend(self._windowView, "hitTest:", point), "mouseDragged:", anEvent);
        var selector;
        if (type == CPRightMouseDragged)
        {
            selector = sel_getUid("rightMouseDragged:");
            if (!objj_msgSend(self._leftMouseDownView, "respondsToSelector:", selector))
                selector = nil;
        }
        if (!selector)
            selector = sel_getUid("mouseDragged:");
        return objj_msgSend(self._leftMouseDownView, "performSelector:withObject:", selector, anEvent);
    case CPMouseMoved:
        objj_msgSend(self._windowView, "setCursorForLocation:resizing:", point, NO);
        if (!self._acceptsMouseMovedEvents || sheet)
            return;
        if (!self._mouseEnteredStack)
            self._mouseEnteredStack = [];
        var hitTestView = objj_msgSend(self._windowView, "hitTest:", point);
        if (objj_msgSend(self._mouseEnteredStack, "count") && objj_msgSend(self._mouseEnteredStack, "lastObject") === hitTestView)
            return objj_msgSend(hitTestView, "mouseMoved:", anEvent);
        var view = hitTestView,
            mouseEnteredStack = [];
        while (view)
        {
            mouseEnteredStack.unshift(view);
            view = objj_msgSend(view, "superview");
        }
        var deviation = MIN(self._mouseEnteredStack.length, mouseEnteredStack.length);
        while (deviation--)
            if (self._mouseEnteredStack[deviation] === mouseEnteredStack[deviation])
                break;
        var index = deviation + 1,
            count = self._mouseEnteredStack.length;
        if (index < count)
        {
            var event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPMouseExited, point, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), self._windowNumber, nil, -1, 1, 0);
            for (; index < count; ++index)
                objj_msgSend(self._mouseEnteredStack[index], "mouseExited:", event);
        }
        index = deviation + 1;
        count = mouseEnteredStack.length;
        if (index < count)
        {
            var event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPMouseEntered, point, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), self._windowNumber, nil, -1, 1, 0);
            for (; index < count; ++index)
                objj_msgSend(mouseEnteredStack[index], "mouseEntered:", event);
        }
        self._mouseEnteredStack = mouseEnteredStack;
        objj_msgSend(hitTestView, "mouseMoved:", anEvent);
    }
}
,["void","CPEvent"]), new objj_method(sel_getUid("windowNumber"), function $CPWindow__windowNumber(self, _cmd)
{
    return self._windowNumber;
}
,["int"]), new objj_method(sel_getUid("becomeKeyWindow"), function $CPWindow__becomeKeyWindow(self, _cmd)
{
    CPApp._keyWindow = self;
    if (self._firstResponder !== self && objj_msgSend(self._firstResponder, "respondsToSelector:", sel_getUid("becomeKeyWindow")))
        objj_msgSend(self._firstResponder, "becomeKeyWindow");
    if (!self._hasBecomeKeyWindow)
    {
        if (!objj_msgSend(self, "_hasKeyViewLoop:", objj_msgSend(self._contentView, "subviews")))
            objj_msgSend(self, "recalculateKeyViewLoop");
    }
    objj_msgSend(self, "_setupFirstResponder");
    self._hasBecomeKeyWindow = YES;
    objj_msgSend(self._windowView, "noteKeyWindowStateChanged");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidBecomeKeyNotification, self);
}
,["void"]), new objj_method(sel_getUid("canBecomeKeyWindow"), function $CPWindow__canBecomeKeyWindow(self, _cmd)
{
    return self._styleMask & CPTitledWindowMask || objj_msgSend(self, "isFullPlatformWindow") || self._isSheet;
}
,["BOOL"]), new objj_method(sel_getUid("isKeyWindow"), function $CPWindow__isKeyWindow(self, _cmd)
{
    return objj_msgSend(CPApp, "keyWindow") == self;
}
,["BOOL"]), new objj_method(sel_getUid("makeKeyAndOrderFront:"), function $CPWindow__makeKeyAndOrderFront_(self, _cmd, aSender)
{
    objj_msgSend(self, "orderFront:", self);
    objj_msgSend(self, "makeKeyWindow");
    objj_msgSend(self, "makeMainWindow");
}
,["void","id"]), new objj_method(sel_getUid("makeKeyWindow"), function $CPWindow__makeKeyWindow(self, _cmd)
{
    if (objj_msgSend(CPApp, "keyWindow") === self || !objj_msgSend(self, "canBecomeKeyWindow"))
        return;
    objj_msgSend(objj_msgSend(CPApp, "keyWindow"), "resignKeyWindow");
    objj_msgSend(self, "becomeKeyWindow");
}
,["void"]), new objj_method(sel_getUid("resignKeyWindow"), function $CPWindow__resignKeyWindow(self, _cmd)
{
    if (self._firstResponder !== self && objj_msgSend(self._firstResponder, "respondsToSelector:", sel_getUid("resignKeyWindow")))
        objj_msgSend(self._firstResponder, "resignKeyWindow");
    if (CPApp._keyWindow === self)
        CPApp._keyWindow = nil;
    objj_msgSend(self._windowView, "noteKeyWindowStateChanged");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidResignKeyNotification, self);
}
,["void"]), new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"), function $CPWindow__dragImage_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{
    objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:", anImage, self, objj_msgSend(self, "convertBaseToGlobal:", imageLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
,["void","CPImage","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"), function $CPWindow___noteRegisteredDraggedTypes_(self, _cmd, pasteboardTypes)
{
    if (!pasteboardTypes)
        return;
    if (!self._inclusiveRegisteredDraggedTypes)
        self._inclusiveRegisteredDraggedTypes = objj_msgSend(CPCountedSet, "set");
    objj_msgSend(self._inclusiveRegisteredDraggedTypes, "unionSet:", pasteboardTypes);
}
,["void","CPSet"]), new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"), function $CPWindow___noteUnregisteredDraggedTypes_(self, _cmd, pasteboardTypes)
{
    if (!pasteboardTypes)
        return;
    objj_msgSend(self._inclusiveRegisteredDraggedTypes, "minusSet:", pasteboardTypes);
    if (objj_msgSend(self._inclusiveRegisteredDraggedTypes, "count") === 0)
        self._inclusiveRegisteredDraggedTypes = nil;
}
,["void","CPSet"]), new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"), function $CPWindow__dragView_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, viewLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{
    objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", aView, self, objj_msgSend(self, "convertBaseToGlobal:", viewLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
,["void","CPView","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("registerForDraggedTypes:"), function $CPWindow__registerForDraggedTypes_(self, _cmd, pasteboardTypes)
{
    if (!pasteboardTypes)
        return;
    objj_msgSend(self, "_noteUnregisteredDraggedTypes:", self._registeredDraggedTypes);
    objj_msgSend(self._registeredDraggedTypes, "addObjectsFromArray:", pasteboardTypes);
    objj_msgSend(self, "_noteRegisteredDraggedTypes:", self._registeredDraggedTypes);
    self._registeredDraggedTypesArray = nil;
}
,["void","CPArray"]), new objj_method(sel_getUid("registeredDraggedTypes"), function $CPWindow__registeredDraggedTypes(self, _cmd)
{
    if (!self._registeredDraggedTypesArray)
        self._registeredDraggedTypesArray = objj_msgSend(self._registeredDraggedTypes, "allObjects");
    return self._registeredDraggedTypesArray;
}
,["CPArray"]), new objj_method(sel_getUid("unregisterDraggedTypes"), function $CPWindow__unregisterDraggedTypes(self, _cmd)
{
    objj_msgSend(self, "_noteUnregisteredDraggedTypes:", self._registeredDraggedTypes);
    self._registeredDraggedTypes = objj_msgSend(CPSet, "set");
    self._registeredDraggedTypesArray = [];
}
,["void"]), new objj_method(sel_getUid("setDocumentEdited:"), function $CPWindow__setDocumentEdited_(self, _cmd, isDocumentEdited)
{
    if (self._isDocumentEdited == isDocumentEdited)
        return;
    self._isDocumentEdited = isDocumentEdited;
    objj_msgSend(CPMenu, "_setMenuBarIconImageAlphaValue:", self._isDocumentEdited ? 0.5 : 1.0);
    objj_msgSend(self._windowView, "setDocumentEdited:", isDocumentEdited);
}
,["void","BOOL"]), new objj_method(sel_getUid("isDocumentEdited"), function $CPWindow__isDocumentEdited(self, _cmd)
{
    return self._isDocumentEdited;
}
,["BOOL"]), new objj_method(sel_getUid("setDocumentSaving:"), function $CPWindow__setDocumentSaving_(self, _cmd, isDocumentSaving)
{
    if (self._isDocumentSaving == isDocumentSaving)
        return;
    self._isDocumentSaving = isDocumentSaving;
    objj_msgSend(self, "_synchronizeSaveMenuWithDocumentSaving");
    objj_msgSend(self._windowView, "windowDidChangeDocumentSaving");
}
,["void","BOOL"]), new objj_method(sel_getUid("isDocumentSaving"), function $CPWindow__isDocumentSaving(self, _cmd)
{
    return self._isDocumentSaving;
}
,["BOOL"]), new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"), function $CPWindow___synchronizeSaveMenuWithDocumentSaving(self, _cmd)
{
    if (!objj_msgSend(self, "isMainWindow"))
        return;
    var mainMenu = objj_msgSend(CPApp, "mainMenu"),
        index = objj_msgSend(mainMenu, "indexOfItemWithTitle:", self._isDocumentSaving ? "Save" : "Saving...");
    if (index == CPNotFound)
        return;
    var item = objj_msgSend(mainMenu, "itemAtIndex:", index);
    if (self._isDocumentSaving)
    {
        CPWindowSaveImage = objj_msgSend(item, "image");
        objj_msgSend(item, "setTitle:", "Saving...");
        objj_msgSend(item, "setImage:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "spinning-regular-gif", CPProgressIndicator));
        objj_msgSend(item, "setEnabled:", NO);
    }
    else
    {
        objj_msgSend(item, "setTitle:", "Save");
        objj_msgSend(item, "setImage:", CPWindowSaveImage);
        objj_msgSend(item, "setEnabled:", YES);
    }
}
,["void"]), new objj_method(sel_getUid("performMiniaturize:"), function $CPWindow__performMiniaturize_(self, _cmd, aSender)
{
    objj_msgSend(self, "miniaturize:", aSender);
}
,["void","id"]), new objj_method(sel_getUid("miniaturize:"), function $CPWindow__miniaturize_(self, _cmd, sender)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowWillMiniaturizeNotification, self);
    objj_msgSend(objj_msgSend(self, "platformWindow"), "miniaturize:", sender);
    objj_msgSend(self, "_updateMainAndKeyWindows");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidMiniaturizeNotification, self);
    self._isMiniaturized = YES;
}
,["void","id"]), new objj_method(sel_getUid("deminiaturize:"), function $CPWindow__deminiaturize_(self, _cmd, sender)
{
    objj_msgSend(objj_msgSend(self, "platformWindow"), "deminiaturize:", sender);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidDeminiaturizeNotification, self);
    self._isMiniaturized = NO;
}
,["void","id"]), new objj_method(sel_getUid("isMiniaturized"), function $CPWindow__isMiniaturized(self, _cmd)
{
    return self._isMiniaturized;
}
,["void"]), new objj_method(sel_getUid("performClose:"), function $CPWindow__performClose_(self, _cmd, aSender)
{
    if (!(self._styleMask & CPClosableWindowMask))
        return;
    if (objj_msgSend(self, "isFullPlatformWindow"))
    {
        var event = objj_msgSend(CPApp, "currentEvent");
        if (objj_msgSend(event, "type") === CPKeyDown && objj_msgSend(event, "characters") === "w" && objj_msgSend(event, "modifierFlags") & CPPlatformActionKeyMask)
        {
            objj_msgSend(objj_msgSend(self, "platformWindow"), "_propagateCurrentDOMEvent:", YES);
            return;
        }
    }
    if (objj_msgSend(self, "_delegateRespondsToWindowShouldClose"))
    {
        if (!objj_msgSend(self, "_sendDelegateWindowShouldClose"))
            return;
    }
    else if (objj_msgSend(self, "respondsToSelector:", sel_getUid("windowShouldClose:")))
    {
        if (!objj_msgSend(self, "windowShouldClose:", self))
            return;
    }
    var documents = objj_msgSend(self._windowController, "documents");
    if (objj_msgSend(documents, "count"))
    {
        var index = objj_msgSend(documents, "indexOfObject:", objj_msgSend(self._windowController, "document"));
        objj_msgSend(documents[index], "shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:", self._windowController, self, sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"), {documents: objj_msgSend(documents, "copy"), visited: 0, index: index});
    }
    else
        objj_msgSend(self, "close");
}
,["void","id"]), new objj_method(sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"), function $CPWindow___windowControllerContainingDocument_shouldClose_contextInfo_(self, _cmd, document, shouldClose, context)
{
    if (shouldClose)
    {
        var windowController = objj_msgSend(self, "windowController"),
            documents = context.documents,
            count = objj_msgSend(documents, "count"),
            visited = ++context.visited,
            index = ++context.index % count;
        objj_msgSend(document, "removeWindowController:", windowController);
        if (visited < count)
        {
            objj_msgSend(windowController, "setDocument:", documents[index]);
            objj_msgSend(documents[index], "shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:", self._windowController, self, sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"), context);
        }
        else
            objj_msgSend(self, "close");
    }
}
,["void","CPDocument","BOOL","Object"]), new objj_method(sel_getUid("close"), function $CPWindow__close(self, _cmd)
{
    objj_msgSend(self, "_sendDelegateWindowWillClose");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowWillCloseNotification, self);
    objj_msgSend(self._parentWindow, "removeChildWindow:", self);
    objj_msgSend(self, "_orderOutRecursively:", NO);
    objj_msgSend(self, "_detachFromChildrenClosing:", !self._parentWindow);
}
,["void"]), new objj_method(sel_getUid("_detachFromChildrenClosing:"), function $CPWindow___detachFromChildrenClosing_(self, _cmd, shouldCloseChildren)
{
    objj_msgSend(self._childWindows, "enumerateObjectsUsingBlock:", function(child)
    {
        objj_msgSend(child, "setParentWindow:", nil);
    });
    if (shouldCloseChildren)
    {
        objj_msgSend(self._childWindows, "enumerateObjectsUsingBlock:", function(child)
        {
            objj_msgSend(child, "_orderOutRecursively:", NO);
            objj_msgSend(child, "_detachFromChildrenClosing:", !objj_msgSend(child, "parentWindow"));
        });
    }
    self._childWindows = [];
}
,["void","BOOL"]), new objj_method(sel_getUid("isMainWindow"), function $CPWindow__isMainWindow(self, _cmd)
{
    return objj_msgSend(CPApp, "mainWindow") === self;
}
,["BOOL"]), new objj_method(sel_getUid("canBecomeMainWindow"), function $CPWindow__canBecomeMainWindow(self, _cmd)
{
    return objj_msgSend(self, "isVisible") && (self._styleMask & CPTitledWindowMask || self._isFullPlatformWindow);
}
,["BOOL"]), new objj_method(sel_getUid("makeMainWindow"), function $CPWindow__makeMainWindow(self, _cmd)
{
    if (self._isSheet)
    {
        objj_msgSend(self._parentView, "makeMainWindow");
        return;
    }
    if (objj_msgSend(CPApp, "mainWindow") === self || !objj_msgSend(self, "canBecomeMainWindow"))
        return;
    objj_msgSend(objj_msgSend(CPApp, "mainWindow"), "resignMainWindow");
    objj_msgSend(self, "becomeMainWindow");
}
,["void"]), new objj_method(sel_getUid("becomeMainWindow"), function $CPWindow__becomeMainWindow(self, _cmd)
{
    CPApp._mainWindow = self;
    objj_msgSend(self, "_synchronizeSaveMenuWithDocumentSaving");
    objj_msgSend(self._windowView, "noteMainWindowStateChanged");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidBecomeMainNotification, self);
}
,["void"]), new objj_method(sel_getUid("resignMainWindow"), function $CPWindow__resignMainWindow(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidResignMainNotification, self);
    if (CPApp._mainWindow === self)
        CPApp._mainWindow = nil;
    objj_msgSend(self._windowView, "noteMainWindowStateChanged");
}
,["void"]), new objj_method(sel_getUid("_updateMainAndKeyWindows"), function $CPWindow___updateMainAndKeyWindows(self, _cmd)
{
    var allWindows = objj_msgSend(CPApp, "orderedWindows"),
        windowCount = objj_msgSend(allWindows, "count");
    if (objj_msgSend(self, "isKeyWindow"))
    {
        var keyWindow = objj_msgSend(CPApp, "keyWindow");
        objj_msgSend(self, "resignKeyWindow");
        if (keyWindow && keyWindow !== self && objj_msgSend(keyWindow, "canBecomeKeyWindow"))
            objj_msgSend(keyWindow, "makeKeyWindow");
        else
        {
            var mainMenu = objj_msgSend(CPApp, "mainMenu"),
                menuBarClass = objj_getClass("_CPMenuBarWindow"),
                menuWindow;
            for (var i = 0; i < windowCount; i++)
            {
                var currentWindow = allWindows[i];
                if (objj_msgSend(currentWindow, "isKindOfClass:", menuBarClass))
                    menuWindow = currentWindow;
                if (currentWindow === self || currentWindow === menuWindow)
                    continue;
                if (objj_msgSend(currentWindow, "isVisible") && objj_msgSend(currentWindow, "canBecomeKeyWindow"))
                {
                    objj_msgSend(currentWindow, "makeKeyWindow");
                    break;
                }
            }
            if (!objj_msgSend(CPApp, "keyWindow"))
                objj_msgSend(menuWindow, "makeKeyWindow");
        }
    }
    if (objj_msgSend(self, "isMainWindow"))
    {
        var mainWindow = objj_msgSend(CPApp, "mainWindow");
        objj_msgSend(self, "resignMainWindow");
        if (mainWindow && mainWindow !== self && objj_msgSend(mainWindow, "canBecomeMainWindow"))
            objj_msgSend(mainWindow, "makeMainWindow");
        else
        {
            var mainMenu = objj_msgSend(CPApp, "mainMenu"),
                menuBarClass = objj_getClass("_CPMenuBarWindow"),
                menuWindow;
            for (var i = 0; i < windowCount; i++)
            {
                var currentWindow = allWindows[i];
                if (objj_msgSend(currentWindow, "isKindOfClass:", menuBarClass))
                    menuWindow = currentWindow;
                if (currentWindow === self || currentWindow === menuWindow)
                    continue;
                if (objj_msgSend(currentWindow, "isVisible") && objj_msgSend(currentWindow, "canBecomeMainWindow"))
                {
                    objj_msgSend(currentWindow, "makeMainWindow");
                    break;
                }
            }
        }
    }
}
,["void"]), new objj_method(sel_getUid("toolbar"), function $CPWindow__toolbar(self, _cmd)
{
    return self._toolbar;
}
,["CPToolbar"]), new objj_method(sel_getUid("setToolbar:"), function $CPWindow__setToolbar_(self, _cmd, aToolbar)
{
    if (self._toolbar === aToolbar)
        return;
    objj_msgSend(objj_msgSend(aToolbar, "_window"), "setToolbar:", nil);
    objj_msgSend(self._toolbar, "_setWindow:", nil);
    self._toolbar = aToolbar;
    objj_msgSend(self._toolbar, "_setWindow:", self);
    objj_msgSend(self, "_noteToolbarChanged");
}
,["void","CPToolbar"]), new objj_method(sel_getUid("toggleToolbarShown:"), function $CPWindow__toggleToolbarShown_(self, _cmd, aSender)
{
    var toolbar = objj_msgSend(self, "toolbar");
    objj_msgSend(toolbar, "setVisible:", !objj_msgSend(toolbar, "isVisible"));
}
,["void","id"]), new objj_method(sel_getUid("_noteToolbarChanged"), function $CPWindow___noteToolbarChanged(self, _cmd)
{
    var frame = CGRectMakeCopy(objj_msgSend(self, "frame")),
        newFrame;
    objj_msgSend(self._windowView, "noteToolbarChanged");
    if (self._isFullPlatformWindow)
        newFrame = objj_msgSend(self._platformWindow, "visibleFrame");
    else
    {
        newFrame = CGRectMakeCopy(objj_msgSend(self, "frame"));
        newFrame.origin = frame.origin;
    }
    objj_msgSend(self, "setFrame:", newFrame);
}
,["void"]), new objj_method(sel_getUid("childWindows"), function $CPWindow__childWindows(self, _cmd)
{
    return self._childWindows;
}
,["CPArray"]), new objj_method(sel_getUid("addChildWindow:ordered:"), function $CPWindow__addChildWindow_ordered_(self, _cmd, childWindow, orderingMode)
{
    if (objj_msgSend(self._childWindows, "indexOfObject:", childWindow) >= 0)
        return;
    if (orderingMode === CPWindowAbove || orderingMode === CPWindowBelow)
        objj_msgSend(self._childWindows, "addObject:", childWindow);
    else
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, _cmd + " unrecognized ordering mode " + orderingMode);
    objj_msgSend(childWindow, "setParentWindow:", self);
    objj_msgSend(childWindow, "_setChildOrdering:", orderingMode);
    objj_msgSend(childWindow, "setLevel:", objj_msgSend(self, "level"));
    if (objj_msgSend(self, "isVisible") && !objj_msgSend(childWindow, "isVisible"))
        objj_msgSend(childWindow, "orderWindow:relativeTo:", orderingMode, self._windowNumber);
}
,["void","CPWindow","CPWindowOrderingMode"]), new objj_method(sel_getUid("removeChildWindow:"), function $CPWindow__removeChildWindow_(self, _cmd, childWindow)
{
    var index = objj_msgSend(self._childWindows, "indexOfObject:", childWindow);
    if (index === CPNotFound)
        return;
    objj_msgSend(self._childWindows, "removeObjectAtIndex:", index);
    objj_msgSend(childWindow, "setParentWindow:", nil);
}
,["void","CPWindow"]), new objj_method(sel_getUid("parentWindow"), function $CPWindow__parentWindow(self, _cmd)
{
    return self._parentWindow;
}
,["CPWindow"]), new objj_method(sel_getUid("_hasAncestorWindow:"), function $CPWindow___hasAncestorWindow_(self, _cmd, anAncestor)
{
    if (!self._parentWindow || !anAncestor)
        return NO;
    if (anAncestor === self._parentWindow)
        return YES;
    return objj_msgSend(self._parentWindow, "_hasAncestorWindow:", anAncestor);
}
,["BOOL","CPWindow"]), new objj_method(sel_getUid("setParentWindow:"), function $CPWindow__setParentWindow_(self, _cmd, parentWindow)
{
    self._parentWindow = parentWindow;
}
,["CPWindow","CPWindow"]), new objj_method(sel_getUid("_setFrame:delegate:duration:curve:"), function $CPWindow___setFrame_delegate_duration_curve_(self, _cmd, aFrame, delegate, duration, curve)
{
    objj_msgSend(self._frameAnimation, "stopAnimation");
    self._frameAnimation = objj_msgSend(objj_msgSend(_CPWindowFrameAnimation, "alloc"), "initWithWindow:targetFrame:", self, aFrame);
    objj_msgSend(self._frameAnimation, "setDelegate:", delegate);
    objj_msgSend(self._frameAnimation, "setAnimationCurve:", curve);
    objj_msgSend(self._frameAnimation, "setDuration:", duration);
    objj_msgSend(self._frameAnimation, "startAnimation");
}
,["void","CGRect","id","int","CPAnimationCurve"]), new objj_method(sel_getUid("animationResizeTime:"), function $CPWindow__animationResizeTime_(self, _cmd, newWindowFrame)
{
    return CPWindowResizeTime;
}
,["CPTimeInterval","CGRect"]), new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"), function $CPWindow___setAttachedSheetFrameOrigin(self, _cmd)
{
    var attachedSheet = objj_msgSend(self, "attachedSheet"),
        contentRect = objj_msgSend(self._contentView, "frame"),
        sheetFrame = CGRectMakeCopy(objj_msgSend(attachedSheet, "frame"));
    sheetFrame.origin.y = CGRectGetMinY(self._frame) + CGRectGetMinY(contentRect);
    sheetFrame.origin.x = CGRectGetMinX(self._frame) + FLOOR((CGRectGetWidth(self._frame) - CGRectGetWidth(sheetFrame)) / 2.0);
    objj_msgSend(attachedSheet, "setFrame:display:animate:", sheetFrame, YES, NO);
}
,["void"]), new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"), function $CPWindow___attachSheet_modalDelegate_didEndSelector_contextInfo_(self, _cmd, aSheet, aModalDelegate, didEndSelector, contextInfo)
{
    if (self._sheetContext)
    {
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "The target window of beginSheet: already has a sheet, did you forget orderOut: ?");
        return;
    }
    self._sheetContext = {"sheet": aSheet, "modalDelegate": aModalDelegate, "endSelector": didEndSelector, "contextInfo": contextInfo, "returnCode": -1, "opened": NO, "isAttached": YES, "savedConstrains": aSheet._constrainsToUsableScreen};
    aSheet._constrainsToUsableScreen = NO;
    objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("_sheetShouldAnimateIn:"), nil, NO);
}
,["void","CPWindow","id","SEL","id"]), new objj_method(sel_getUid("_endSheet"), function $CPWindow___endSheet(self, _cmd)
{
    var delegate = self._sheetContext["modalDelegate"],
        endSelector = self._sheetContext["endSelector"];
    if (delegate && endSelector)
    {
        if (self._sheetContext["isAttached"])
            objj_msgSend(delegate, endSelector, self._sheetContext["sheet"], self._sheetContext["returnCode"], self._sheetContext["contextInfo"]);
        else
            self._sheetContext["deferDidEndSelector"] = YES;
    }
}
,["void"]), new objj_method(sel_getUid("_detachSheetWindow"), function $CPWindow___detachSheetWindow(self, _cmd)
{
    self._sheetContext["isAttached"] = NO;
    objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("_sheetShouldAnimateOut:"), nil, NO);
}
,["void"]), new objj_method(sel_getUid("_cleanupSheetWindow"), function $CPWindow___cleanupSheetWindow(self, _cmd)
{
    var sheet = self._sheetContext["sheet"],
        deferDidEnd = self._sheetContext["deferDidEndSelector"];
    if (sheet._isModal)
        objj_msgSend(CPApp, "stopModal");
    objj_msgSend(self, "_removeClipForSheet:", sheet);
    sheet._isSheet = NO;
    objj_msgSend(sheet._windowView, "_enableSheet:inWindow:", NO, self);
    sheet._constrainsToUsableScreen = self._sheetContext["savedConstrains"];
    objj_msgSend(sheet, "orderOut:", self);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidEndSheetNotification, self);
    if (deferDidEnd)
    {
        var delegate = self._sheetContext["modalDelegate"],
            selector = self._sheetContext["endSelector"],
            returnCode = self._sheetContext["returnCode"],
            contextInfo = self._sheetContext["contextInfo"];
        self._sheetContext = nil;
        sheet._parentView = nil;
        objj_msgSend(delegate, selector, sheet, returnCode, contextInfo);
    }
    else
    {
        self._sheetContext = nil;
        sheet._parentView = nil;
    }
}
,["void"]), new objj_method(sel_getUid("animationDidEnd:"), function $CPWindow__animationDidEnd_(self, _cmd, anim)
{
    var sheet = self._sheetContext["sheet"];
    if (anim._window != sheet)
        return;
    objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("_sheetAnimationDidEnd:"), nil, NO);
}
,["void","id"]), new objj_method(sel_getUid("_sheetShouldAnimateIn:"), function $CPWindow___sheetShouldAnimateIn_(self, _cmd, timer)
{
    if (self._sheetContext["isOpening"] || self._sheetContext["isClosing"])
        return;
    var sheet = self._sheetContext["sheet"];
    sheet._isSheet = YES;
    sheet._parentView = self;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowWillBeginSheetNotification, self);
    sheet._isModal = NO;
    if (objj_msgSend(CPApp, "modalWindow") === self)
    {
        objj_msgSend(CPApp, "runModalForWindow:", sheet);
        sheet._isModal = YES;
    }
    var sheetFrame = objj_msgSend(sheet, "frame"),
        sheetShadowFrame = sheet._hasShadow ? objj_msgSend(sheet._shadowView, "frame") : sheetFrame,
        frame = objj_msgSend(self, "frame"),
        originX = frame.origin.x + FLOOR((frame.size.width - sheetFrame.size.width) / 2),
        startFrame = CGRectMake(originX, -sheetShadowFrame.size.height, sheetFrame.size.width, sheetFrame.size.height),
        endY = -1 + objj_msgSend(self._windowView, "bodyOffset") - objj_msgSend(objj_msgSend(self, "contentView"), "frame").origin.y,
        endFrame = CGRectMake(originX, endY, sheetFrame.size.width, sheetFrame.size.height);
    if (self._toolbar && objj_msgSend(self._windowView, "showsToolbar") && objj_msgSend(self, "isFullPlatformWindow"))
    {
        endY += objj_msgSend(objj_msgSend(self._toolbar, "_toolbarView"), "frameSize").height;
        endFrame = CGRectMake(originX, endY, sheetFrame.size.width, sheetFrame.size.height);
    }
    objj_msgSend(sheet, "setFrameOrigin:", CGPointMake(0, -13000));
    objj_msgSend(sheet, "orderFront:", self);
    objj_msgSend(self, "_clipSheet:", sheet);
    objj_msgSend(sheet, "setFrame:display:animate:", startFrame, YES, NO);
    self._sheetContext["opened"] = YES;
    self._sheetContext["shouldClose"] = NO;
    self._sheetContext["isOpening"] = YES;
    objj_msgSend(sheet, "_setFrame:delegate:duration:curve:", endFrame, self, objj_msgSend(self, "animationResizeTime:", endFrame), CPAnimationEaseOut);
}
,["void","CPTimer"]), new objj_method(sel_getUid("_sheetShouldAnimateOut:"), function $CPWindow___sheetShouldAnimateOut_(self, _cmd, timer)
{
    if (self._sheetContext["isOpening"])
    {
        self._sheetContext["shouldClose"] = YES;
        return;
    }
    if (self._sheetContext["isClosing"])
        return;
    self._sheetContext["opened"] = NO;
    self._sheetContext["isClosing"] = YES;
    if (objj_msgSend(self, "isVisible"))
    {
        var sheet = self._sheetContext["sheet"],
            sheetFrame = objj_msgSend(sheet, "frame"),
            fullHeight = sheet._hasShadow ? objj_msgSend(sheet._shadowView, "frame").size.height : sheetFrame.size.height,
            endFrame = CGRectMakeCopy(sheetFrame),
            contentOrigin = objj_msgSend(self, "convertBaseToGlobal:", objj_msgSend(objj_msgSend(self, "contentView"), "frame").origin);
        sheet._constrainsToUsableScreen = NO;
        objj_msgSend(sheet, "setFrameOrigin:", CGPointMake(sheetFrame.origin.x, sheetFrame.origin.y - contentOrigin.y));
        objj_msgSend(self, "_clipSheet:", sheet);
        endFrame.origin.y = -fullHeight;
        objj_msgSend(sheet, "_setFrame:delegate:duration:curve:", endFrame, self, objj_msgSend(self, "animationResizeTime:", endFrame), CPAnimationEaseIn);
    }
    else
    {
        objj_msgSend(self, "_sheetAnimationDidEnd:", nil);
    }
}
,["void","CPTimer"]), new objj_method(sel_getUid("_sheetAnimationDidEnd:"), function $CPWindow___sheetAnimationDidEnd_(self, _cmd, timer)
{
    var sheet = self._sheetContext["sheet"];
    self._sheetContext["isOpening"] = NO;
    self._sheetContext["isClosing"] = NO;
    if (self._sheetContext["opened"] === YES)
    {
        var sheetFrame = objj_msgSend(sheet, "frame"),
            sheetOrigin = CGPointMakeCopy(sheetFrame.origin);
        objj_msgSend(self, "_removeClipForSheet:", sheet);
        objj_msgSend(sheet, "setFrameOrigin:", CGPointMake(sheetOrigin.x, objj_msgSend(sheet, "frame").origin.y + sheetOrigin.y));
        if (self._sheetContext["shouldClose"] === YES)
            objj_msgSend(self, "_detachSheetWindow");
        else
            objj_msgSend(sheet, "makeKeyWindow");
    }
    else
    {
        objj_msgSend(self, "_cleanupSheetWindow");
    }
}
,["void","CPTimer"]), new objj_method(sel_getUid("_clipSheet:"), function $CPWindow___clipSheet_(self, _cmd, aSheet)
{
    var clipRect = objj_msgSend(self._platformWindow, "contentBounds");
    clipRect.origin.y = objj_msgSend(self, "frame").origin.y + objj_msgSend(objj_msgSend(self, "contentView"), "frame").origin.y;
    objj_msgSend(objj_msgSend(self._platformWindow, "layerAtLevel:create:", self._level, NO), "clipWindow:toRect:", aSheet, clipRect);
}
,["void","CPWindow"]), new objj_method(sel_getUid("_removeClipForSheet:"), function $CPWindow___removeClipForSheet_(self, _cmd, aSheet)
{
    objj_msgSend(objj_msgSend(self._platformWindow, "layerAtLevel:create:", self._level, NO), "removeClipForWindow:", aSheet);
}
,["void","CPWindow"]), new objj_method(sel_getUid("attachedSheet"), function $CPWindow__attachedSheet(self, _cmd)
{
    if (self._sheetContext === nil)
        return nil;
    return self._sheetContext["sheet"];
}
,["CPWindow"]), new objj_method(sel_getUid("isSheet"), function $CPWindow__isSheet(self, _cmd)
{
    return self._isSheet;
}
,["BOOL"]), new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"), function $CPWindow__becomesKeyOnlyIfNeeded(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("worksWhenModal"), function $CPWindow__worksWhenModal(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $CPWindow__performKeyEquivalent_(self, _cmd, anEvent)
{
    return objj_msgSend(self._contentView, "performKeyEquivalent:", anEvent);
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("keyDown:"), function $CPWindow__keyDown_(self, _cmd, anEvent)
{
    if (objj_msgSend(anEvent, "_couldBeKeyEquivalent") && objj_msgSend(self, "performKeyEquivalent:", anEvent))
        return;
    if (!objj_msgSend(self, "_processKeyboardUIKey:", anEvent))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow").super_class }, "keyDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_processKeyboardUIKey:"), function $CPWindow___processKeyboardUIKey_(self, _cmd, anEvent)
{
    var character = objj_msgSend(anEvent, "charactersIgnoringModifiers");
    if (!objj_msgSend(CPWindowActionMessageKeys, "containsObject:", character))
        return NO;
    var selectors = objj_msgSend(CPKeyBinding, "selectorsForKey:modifierFlags:", character, 0);
    if (objj_msgSend(selectors, "count") <= 0)
        return NO;
    if (character !== CPEscapeFunctionKey)
    {
        var selector = objj_msgSend(selectors, "objectAtIndex:", 0);
        return objj_msgSend(objj_msgSend(self, "firstResponder"), "tryToPerform:with:", selector, self);
    }
    else
    {
        objj_msgSend(objj_msgSend(self, "firstResponder"), "doCommandBySelector:", sel_getUid("complete:"));
    }
    return NO;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("_dirtyKeyViewLoop"), function $CPWindow___dirtyKeyViewLoop(self, _cmd)
{
    if (self._autorecalculatesKeyViewLoop)
        self._keyViewLoopIsDirty = YES;
}
,["void"]), new objj_method(sel_getUid("_hasKeyViewLoop:"), function $CPWindow___hasKeyViewLoop_(self, _cmd, theViews)
{
    var i,
        count = objj_msgSend(theViews, "count");
    for (i = 0; i < count; ++i)
    {
        var view = theViews[i];
        if (objj_msgSend(view, "nextKeyView") || objj_msgSend(view, "previousKeyView"))
            return YES;
    }
    for (i = 0; i < count; ++i)
    {
        var subviews = objj_msgSend(theViews[i], "subviews");
        if (objj_msgSend(subviews, "count") && objj_msgSend(self, "_hasKeyViewLoop:", subviews))
            return YES;
    }
    return NO;
}
,["BOOL","CPArray"]), new objj_method(sel_getUid("recalculateKeyViewLoop"), function $CPWindow__recalculateKeyViewLoop(self, _cmd)
{
    objj_msgSend(self, "_doRecalculateKeyViewLoop");
}
,["void"]), new objj_method(sel_getUid("_viewsSortedByPosition"), function $CPWindow___viewsSortedByPosition(self, _cmd)
{
    var views = objj_msgSend(CPArray, "arrayWithObject:", self._contentView);
    views = views.concat(objj_msgSend(self, "_subviewsSortedByPosition:", objj_msgSend(self._contentView, "subviews")));
    return views;
}
,["CPArray"]), new objj_method(sel_getUid("_subviewsSortedByPosition:"), function $CPWindow___subviewsSortedByPosition_(self, _cmd, theSubviews)
{
    theSubviews = objj_msgSend(theSubviews, "copy");
    objj_msgSend(theSubviews, "sortUsingFunction:context:", keyViewComparator, nil);
    var sortedViews = [];
    for (var i = 0, count = objj_msgSend(theSubviews, "count"); i < count; ++i)
    {
        var view = theSubviews[i],
            subviews = objj_msgSend(view, "subviews");
        sortedViews.push(view);
        if (objj_msgSend(subviews, "count"))
            sortedViews = sortedViews.concat(objj_msgSend(self, "_subviewsSortedByPosition:", subviews));
    }
    return sortedViews;
}
,["CPArray","CPArray"]), new objj_method(sel_getUid("_doRecalculateKeyViewLoop"), function $CPWindow___doRecalculateKeyViewLoop(self, _cmd)
{
    var views = objj_msgSend(self, "_viewsSortedByPosition");
    for (var index = 0, count = objj_msgSend(views, "count"); index < count; ++index)
        objj_msgSend(views[index], "setNextKeyView:", views[(index + 1) % count]);
    self._keyViewLoopIsDirty = NO;
}
,["void"]), new objj_method(sel_getUid("setAutorecalculatesKeyViewLoop:"), function $CPWindow__setAutorecalculatesKeyViewLoop_(self, _cmd, shouldRecalculate)
{
    if (self._autorecalculatesKeyViewLoop === shouldRecalculate)
        return;
    self._autorecalculatesKeyViewLoop = shouldRecalculate;
}
,["void","BOOL"]), new objj_method(sel_getUid("autorecalculatesKeyViewLoop"), function $CPWindow__autorecalculatesKeyViewLoop(self, _cmd)
{
    return self._autorecalculatesKeyViewLoop;
}
,["BOOL"]), new objj_method(sel_getUid("selectNextKeyView:"), function $CPWindow__selectNextKeyView_(self, _cmd, sender)
{
    if (self._keyViewLoopIsDirty)
        objj_msgSend(self, "_doRecalculateKeyViewLoop");
    var nextValidKeyView = nil;
    if (objj_msgSend(self._firstResponder, "isKindOfClass:", objj_msgSend(CPView, "class")))
        nextValidKeyView = objj_msgSend(self._firstResponder, "nextValidKeyView");
    if (!nextValidKeyView)
    {
        if (objj_msgSend(self._initialFirstResponder, "acceptsFirstResponder"))
            nextValidKeyView = self._initialFirstResponder;
        else
            nextValidKeyView = objj_msgSend(self._initialFirstResponder, "nextValidKeyView");
    }
    if (nextValidKeyView)
        objj_msgSend(self, "makeFirstResponder:", nextValidKeyView);
}
,["void","id"]), new objj_method(sel_getUid("selectPreviousKeyView:"), function $CPWindow__selectPreviousKeyView_(self, _cmd, sender)
{
    if (self._keyViewLoopIsDirty)
        objj_msgSend(self, "_doRecalculateKeyViewLoop");
    var previousValidKeyView = nil;
    if (objj_msgSend(self._firstResponder, "isKindOfClass:", objj_msgSend(CPView, "class")))
        previousValidKeyView = objj_msgSend(self._firstResponder, "previousValidKeyView");
    if (!previousValidKeyView)
    {
        if (objj_msgSend(self._initialFirstResponder, "acceptsFirstResponder"))
            previousValidKeyView = self._initialFirstResponder;
        else
            previousValidKeyView = objj_msgSend(self._initialFirstResponder, "previousValidKeyView");
    }
    if (previousValidKeyView)
        objj_msgSend(self, "makeFirstResponder:", previousValidKeyView);
}
,["void","id"]), new objj_method(sel_getUid("selectKeyViewFollowingView:"), function $CPWindow__selectKeyViewFollowingView_(self, _cmd, aView)
{
    if (self._keyViewLoopIsDirty)
        objj_msgSend(self, "_doRecalculateKeyViewLoop");
    var nextValidKeyView = objj_msgSend(aView, "nextValidKeyView");
    if (objj_msgSend(nextValidKeyView, "isKindOfClass:", objj_msgSend(CPView, "class")))
        objj_msgSend(self, "makeFirstResponder:", nextValidKeyView);
}
,["void","CPView"]), new objj_method(sel_getUid("selectKeyViewPrecedingView:"), function $CPWindow__selectKeyViewPrecedingView_(self, _cmd, aView)
{
    if (self._keyViewLoopIsDirty)
        objj_msgSend(self, "_doRecalculateKeyViewLoop");
    var previousValidKeyView = objj_msgSend(aView, "previousValidKeyView");
    if (objj_msgSend(previousValidKeyView, "isKindOfClass:", objj_msgSend(CPView, "class")))
        objj_msgSend(self, "makeFirstResponder:", previousValidKeyView);
}
,["void","CPView"]), new objj_method(sel_getUid("setDefaultButtonCell:"), function $CPWindow__setDefaultButtonCell_(self, _cmd, aButton)
{
    objj_msgSend(self, "setDefaultButton:", aButton);
}
,["void","CPButton"]), new objj_method(sel_getUid("defaultButtonCell"), function $CPWindow__defaultButtonCell(self, _cmd)
{
    return objj_msgSend(self, "defaultButton");
}
,["CPButton"]), new objj_method(sel_getUid("setDefaultButton:"), function $CPWindow__setDefaultButton_(self, _cmd, aButton)
{
    if (self._defaultButton === aButton)
        return;
    if (objj_msgSend(self._defaultButton, "keyEquivalent") === CPCarriageReturnCharacter)
        objj_msgSend(self._defaultButton, "setKeyEquivalent:", nil);
    self._defaultButton = aButton;
    if (objj_msgSend(self._defaultButton, "keyEquivalent") !== CPCarriageReturnCharacter)
        objj_msgSend(self._defaultButton, "setKeyEquivalent:", CPCarriageReturnCharacter);
}
,["void","CPButton"]), new objj_method(sel_getUid("defaultButton"), function $CPWindow__defaultButton(self, _cmd)
{
    return self._defaultButton;
}
,["CPButton"]), new objj_method(sel_getUid("enableKeyEquivalentForDefaultButton"), function $CPWindow__enableKeyEquivalentForDefaultButton(self, _cmd)
{
    self._defaultButtonEnabled = YES;
}
,["void"]), new objj_method(sel_getUid("enableKeyEquivalentForDefaultButtonCell"), function $CPWindow__enableKeyEquivalentForDefaultButtonCell(self, _cmd)
{
    objj_msgSend(self, "enableKeyEquivalentForDefaultButton");
}
,["void"]), new objj_method(sel_getUid("disableKeyEquivalentForDefaultButton"), function $CPWindow__disableKeyEquivalentForDefaultButton(self, _cmd)
{
    self._defaultButtonEnabled = NO;
}
,["void"]), new objj_method(sel_getUid("disableKeyEquivalentForDefaultButtonCell"), function $CPWindow__disableKeyEquivalentForDefaultButtonCell(self, _cmd)
{
    objj_msgSend(self, "disableKeyEquivalentForDefaultButton");
}
,["void"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPWindow__setValue_forKey_(self, _cmd, aValue, aKey)
{
    if (aKey === CPDisplayPatternTitleBinding)
        objj_msgSend(self, "setTitle:", aValue || "");
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow").super_class }, "setValue:forKey:", aValue, aKey);
}
,["void","id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPWindow___binderClassForBinding_(self, _cmd, aBinding)
{
    if (objj_msgSend(aBinding, "hasPrefix:", CPDisplayPatternTitleBinding))
        return objj_msgSend(CPTitleWithPatternBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPWindow").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("_windowViewClassForStyleMask:"), function $CPWindow___windowViewClassForStyleMask_(self, _cmd, aStyleMask)
{
    if (aStyleMask & CPHUDBackgroundWindowMask)
        return _CPHUDWindowView;
    else if (aStyleMask === CPBorderlessWindowMask)
        return _CPBorderlessWindowView;
    else if (aStyleMask & CPDocModalWindowMask)
        return _CPDocModalWindowView;
    else if (aStyleMask & _CPModalWindowMask)
        return _CPModalWindowView;
    return _CPStandardWindowView;
}
,["Class","unsigned"]), new objj_method(sel_getUid("_windowViewClassForFullPlatformWindowStyleMask:"), function $CPWindow___windowViewClassForFullPlatformWindowStyleMask_(self, _cmd, aStyleMask)
{
    return _CPBorderlessBridgeWindowView;
}
,["Class","unsigned"]), new objj_method(sel_getUid("frameRectForContentRect:styleMask:"), function $CPWindow__frameRectForContentRect_styleMask_(self, _cmd, aContentRect, aStyleMask)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForStyleMask:", aStyleMask), "frameRectForContentRect:", aContentRect);
}
,["CGRect","CGRect","unsigned"]), new objj_method(sel_getUid("setGlobalResizeStyle:"), function $CPWindow__setGlobalResizeStyle_(self, _cmd, aStyle)
{
    if (CPWindowResizeStyle === aStyle)
        return;
    CPWindowResizeStyle = aStyle;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowResizeStyleGlobalChangeNotification, nil);
}
,["void","int"]), new objj_method(sel_getUid("setConstrainWindowsToUsableScreen:"), function $CPWindow__setConstrainWindowsToUsableScreen_(self, _cmd, shouldConstrain)
{
    CPWindowConstrainToScreen = shouldConstrain;
}
,["void","BOOL"]), new objj_method(sel_getUid("constrainWindowsToUsableScreen"), function $CPWindow__constrainWindowsToUsableScreen(self, _cmd)
{
    return CPWindowConstrainToScreen;
}
,["BOOL"]), new objj_method(sel_getUid("globalResizeStyle"), function $CPWindow__globalResizeStyle(self, _cmd)
{
    return CPWindowResizeStyle;
}
,["int"])]);
}var keyViewComparator = function(lhs, rhs, context)
{
    var lhsBounds = objj_msgSend(lhs, "convertRect:toView:", objj_msgSend(lhs, "bounds"), nil),
        rhsBounds = objj_msgSend(rhs, "convertRect:toView:", objj_msgSend(rhs, "bounds"), nil),
        lhsY = CGRectGetMinY(lhsBounds),
        rhsY = CGRectGetMinY(rhsBounds),
        lhsX = CGRectGetMinX(lhsBounds),
        rhsX = CGRectGetMinX(rhsBounds),
        intersectsVertically = MIN(CGRectGetMaxY(lhsBounds), CGRectGetMaxY(rhsBounds)) - MAX(lhsY, rhsY);
    if (intersectsVertically > 0)
    {
        if (lhsX < rhsX)
            return CPOrderedAscending;
        if (lhsX === rhsX)
            return CPOrderedSame;
        return CPOrderedDescending;
    }
    if (lhsY < rhsY)
        return CPOrderedAscending;
    if (lhsY === rhsY)
        return CPOrderedSame;
    return CPOrderedDescending;
};
{
var the_class = objj_getClass("CPWindow")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_delegateRespondsToWindowWillUndoManager"), function $CPWindow___delegateRespondsToWindowWillUndoManager(self, _cmd)
{
    return self._implementedDelegateMethods & CPWindowDelegate_windowWillReturnUndoManager_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToWindowShouldClose"), function $CPWindow___delegateRespondsToWindowShouldClose(self, _cmd)
{
    return self._implementedDelegateMethods & CPWindowDelegate_windowShouldClose_;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateWindowShouldClose"), function $CPWindow___sendDelegateWindowShouldClose(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPWindowDelegate_windowShouldClose_))
        return YES;
    return objj_msgSend(self._delegate, "windowShouldClose:", self);
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateWindowWillReturnUndoManager"), function $CPWindow___sendDelegateWindowWillReturnUndoManager(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPWindowDelegate_windowWillReturnUndoManager_))
        return nil;
    return objj_msgSend(self._delegate, "windowWillReturnUndoManager:", self);
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateWindowWillClose"), function $CPWindow___sendDelegateWindowWillClose(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPWindowDelegate_windowWillClose_))
        return;
    objj_msgSend(self._delegate, "windowWillClose:", self);
}
,["void"])]);
}{
var the_class = objj_getClass("CPWindow")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"), function $CPWindow__resizeWithOldPlatformWindowSize_(self, _cmd, aSize)
{
    if (objj_msgSend(self, "isFullPlatformWindow"))
        return objj_msgSend(self, "setFrame:", objj_msgSend(self._platformWindow, "visibleFrame"));
    if (self._constrainsToUsableScreen && !CPWindowConstrainToScreen || self._autoresizingMask === CPWindowNotSizable)
        return;
    var frame = objj_msgSend(self._platformWindow, "contentBounds"),
        newFrame = CGRectMakeCopy(self._frame),
        dX = (CGRectGetWidth(frame) - aSize.width) / ((self._autoresizingMask & CPWindowMinXMargin ? 1 : 0) + (self._autoresizingMask & CPWindowWidthSizable ? 1 : 0) + (self._autoresizingMask & CPWindowMaxXMargin ? 1 : 0)),
        dY = (CGRectGetHeight(frame) - aSize.height) / ((self._autoresizingMask & CPWindowMinYMargin ? 1 : 0) + (self._autoresizingMask & CPWindowHeightSizable ? 1 : 0) + (self._autoresizingMask & CPWindowMaxYMargin ? 1 : 0));
    if (self._autoresizingMask & CPWindowMinXMargin)
        newFrame.origin.x += dX;
    if (self._autoresizingMask & CPWindowWidthSizable)
        newFrame.size.width += dX;
    if (self._autoresizingMask & CPWindowMinYMargin)
        newFrame.origin.y += dY;
    if (self._autoresizingMask & CPWindowHeightSizable)
        newFrame.size.height += dY;
    objj_msgSend(self, "_setFrame:display:animate:constrainWidth:constrainHeight:", newFrame, YES, NO, YES, YES);
}
,["void","CGSize"]), new objj_method(sel_getUid("setAutoresizingMask:"), function $CPWindow__setAutoresizingMask_(self, _cmd, anAutoresizingMask)
{
    self._autoresizingMask = anAutoresizingMask;
}
,["void","unsigned"]), new objj_method(sel_getUid("autoresizingMask"), function $CPWindow__autoresizingMask(self, _cmd)
{
    return self._autoresizingMask;
}
,["unsigned"]), new objj_method(sel_getUid("convertBaseToGlobal:"), function $CPWindow__convertBaseToGlobal_(self, _cmd, aPoint)
{
    return objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(self, "convertBaseToPlatformWindow:", aPoint) : objj_msgSend(self, "convertBaseToScreen:", aPoint);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertGlobalToBase:"), function $CPWindow__convertGlobalToBase_(self, _cmd, aPoint)
{
    return objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(self, "convertPlatformWindowToBase:", aPoint) : objj_msgSend(self, "convertScreenToBase:", aPoint);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertBaseToPlatformWindow:"), function $CPWindow__convertBaseToPlatformWindow_(self, _cmd, aPoint)
{
    if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        return CGPointMakeCopy(aPoint);
    var origin = objj_msgSend(self, "frame").origin;
    return CGPointMake(aPoint.x + origin.x, aPoint.y + origin.y);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertPlatformWindowToBase:"), function $CPWindow__convertPlatformWindowToBase_(self, _cmd, aPoint)
{
    if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        return CGPointMakeCopy(aPoint);
    var origin = objj_msgSend(self, "frame").origin;
    return CGPointMake(aPoint.x - origin.x, aPoint.y - origin.y);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertScreenToBase:"), function $CPWindow__convertScreenToBase_(self, _cmd, aPoint)
{
    return objj_msgSend(self, "convertPlatformWindowToBase:", objj_msgSend(self._platformWindow, "convertScreenToBase:", aPoint));
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertBaseToScreen:"), function $CPWindow__convertBaseToScreen_(self, _cmd, aPoint)
{
    return objj_msgSend(self._platformWindow, "convertBaseToScreen:", objj_msgSend(self, "convertBaseToPlatformWindow:", aPoint));
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("_setSharesChromeWithPlatformWindow:"), function $CPWindow___setSharesChromeWithPlatformWindow_(self, _cmd, shouldShareFrameWithPlatformWindow)
{
    if (shouldShareFrameWithPlatformWindow && objj_msgSend(CPPlatform, "isBrowser"))
        return;
    self._sharesChromeWithPlatformWindow = shouldShareFrameWithPlatformWindow;
    objj_msgSend(self, "_updateShadow");
}
,["void","BOOL"]), new objj_method(sel_getUid("_sharesChromeWithPlatformWindow"), function $CPWindow___sharesChromeWithPlatformWindow(self, _cmd)
{
    return self._sharesChromeWithPlatformWindow;
}
,["BOOL"]), new objj_method(sel_getUid("undoManager"), function $CPWindow__undoManager(self, _cmd)
{
    if (self._undoManager)
        return self._undoManager;
    var documentUndoManager = objj_msgSend(objj_msgSend(self._windowController, "document"), "undoManager");
    if (documentUndoManager)
        return documentUndoManager;
    if (objj_msgSend(self, "_delegateRespondsToWindowWillUndoManager"))
        return objj_msgSend(self, "_sendDelegateWindowWillReturnUndoManager");
    if (!self._undoManager)
        self._undoManager = objj_msgSend(objj_msgSend(CPUndoManager, "alloc"), "init");
    return self._undoManager;
}
,["CPUndoManager"]), new objj_method(sel_getUid("undo:"), function $CPWindow__undo_(self, _cmd, aSender)
{
    objj_msgSend(objj_msgSend(self, "undoManager"), "undo");
}
,["void","id"]), new objj_method(sel_getUid("redo:"), function $CPWindow__redo_(self, _cmd, aSender)
{
    objj_msgSend(objj_msgSend(self, "undoManager"), "redo");
}
,["void","id"]), new objj_method(sel_getUid("containsPoint:"), function $CPWindow__containsPoint_(self, _cmd, aPoint)
{
    return CGRectContainsPoint(self._frame, aPoint);
}
,["BOOL","CGPoint"]), new objj_method(sel_getUid("_isValidMousePoint:"), function $CPWindow___isValidMousePoint_(self, _cmd, aPoint)
{
    var mouseFrame = !self._isFullPlatformWindow && self._styleMask & CPResizableWindowMask && CPWindowResizeStyle === CPWindowResizeStyleModern ? CGRectInset(self._frame, -_CPWindowViewResizeSlop, -_CPWindowViewResizeSlop) : self._frame;
    return CGRectContainsPoint(mouseFrame, aPoint);
}
,["BOOL","CGPoint"])]);
}{
var the_class = objj_getClass("CPWindow")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setFullBridge:"), function $CPWindow__setFullBridge_(self, _cmd, shouldBeFullBridge)
{
    _CPReportLenientDeprecation(objj_msgSend(self, "class"), _cmd, sel_getUid("setFullPlatformWindow:"));
    objj_msgSend(self, "setFullPlatformWindow:", shouldBeFullBridge);
}
,["void","BOOL"]), new objj_method(sel_getUid("isFullBridge"), function $CPWindow__isFullBridge(self, _cmd)
{
    return objj_msgSend(self, "isFullPlatformWindow");
}
,["BOOL"]), new objj_method(sel_getUid("convertBaseToBridge:"), function $CPWindow__convertBaseToBridge_(self, _cmd, aPoint)
{
    return objj_msgSend(self, "convertBaseToPlatformWindow:", aPoint);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertBridgeToBase:"), function $CPWindow__convertBridgeToBase_(self, _cmd, aPoint)
{
    return objj_msgSend(self, "convertPlatformWindowToBase:", aPoint);
}
,["CGPoint","CGPoint"])]);
}var interpolate = function(fromValue, toValue, progress)
{
    return fromValue + (toValue - fromValue) * progress;
};
{var the_class = objj_allocateClassPair(CPAnimation, "_CPWindowFrameAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_startFrame"), new objj_ivar("_targetFrame")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithWindow:targetFrame:"), function $_CPWindowFrameAnimation__initWithWindow_targetFrame_(self, _cmd, aWindow, aTargetFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowFrameAnimation").super_class }, "initWithDuration:animationCurve:", objj_msgSend(aWindow, "animationResizeTime:", aTargetFrame), CPAnimationLinear);
    if (self)
    {
        self._window = aWindow;
        self._targetFrame = CGRectMakeCopy(aTargetFrame);
        self._startFrame = CGRectMakeCopy(objj_msgSend(self._window, "frame"));
    }
    return self;
}
,["id","CPWindow","CGRect"]), new objj_method(sel_getUid("startAnimation"), function $_CPWindowFrameAnimation__startAnimation(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowFrameAnimation").super_class }, "startAnimation");
    self._window._isAnimating = YES;
}
,["void"]), new objj_method(sel_getUid("setCurrentProgress:"), function $_CPWindowFrameAnimation__setCurrentProgress_(self, _cmd, aProgress)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowFrameAnimation").super_class }, "setCurrentProgress:", aProgress);
    var value = objj_msgSend(self, "currentValue");
    if (value == 1.0)
        self._window._isAnimating = NO;
    var newFrame = CGRectMake(interpolate(CGRectGetMinX(self._startFrame), CGRectGetMinX(self._targetFrame), value), interpolate(CGRectGetMinY(self._startFrame), CGRectGetMinY(self._targetFrame), value), interpolate(CGRectGetWidth(self._startFrame), CGRectGetWidth(self._targetFrame), value), interpolate(CGRectGetHeight(self._startFrame), CGRectGetHeight(self._targetFrame), value));
    objj_msgSend(self._window, "setFrame:display:animate:", newFrame, YES, NO);
}
,["void","float"])]);
}{
var the_class = objj_getClass("CPWindow")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_dragHitTest:pasteboard:"), function $CPWindow___dragHitTest_pasteboard_(self, _cmd, aPoint, aPasteboard)
{
    if (!self._inclusiveRegisteredDraggedTypes)
        return nil;
    var adjustedPoint = objj_msgSend(self, "convertPlatformWindowToBase:", aPoint),
        hitView = objj_msgSend(self._windowView, "hitTest:", adjustedPoint);
    while (hitView && !objj_msgSend(aPasteboard, "availableTypeFromArray:", objj_msgSend(hitView, "registeredDraggedTypes")))
        hitView = objj_msgSend(hitView, "superview");
    if (hitView)
        return hitView;
    if (objj_msgSend(aPasteboard, "availableTypeFromArray:", objj_msgSend(self, "registeredDraggedTypes")))
        return self;
    return nil;
}
,["id","CGPoint","CPPasteboard"])]);
}_CPWindowFullPlatformWindowSessionMake = function(aWindowView, aContentRect, hasShadow, aLevel)
{
    return {windowView: aWindowView, contentRect: aContentRect, hasShadow: hasShadow, level: aLevel};
}
