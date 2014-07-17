@STATIC;1.0;I;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;10;CPCursor.ji;14;CPDragServer.ji;9;CPEvent.ji;18;CPPlatformWindow.ji;13;CPResponder.ji;10;CPScreen.ji;8;CPText.ji;8;CPView.ji;20;CPWindow_Constants.ji;31;_CPBorderlessBridgeWindowView.ji;25;_CPBorderlessWindowView.ji;23;_CPDocModalWindowView.ji;18;_CPHUDWindowView.ji;20;_CPModalWindowView.ji;22;_CPPopoverWindowView.ji;21;_CPShadowWindowView.ji;23;_CPStandardWindowView.ji;22;_CPToolTipWindowView.jt;129863;objj_executeFile("Foundation/CPCountedSet.j", NO);objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("Foundation/CPUndoManager.j", NO);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPAnimation.j", YES);objj_executeFile("CPCursor.j", YES);objj_executeFile("CPDragServer.j", YES);objj_executeFile("CPEvent.j", YES);objj_executeFile("CPPlatformWindow.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPScreen.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow_Constants.j", YES);objj_executeFile("_CPBorderlessBridgeWindowView.j", YES);objj_executeFile("_CPBorderlessWindowView.j", YES);objj_executeFile("_CPDocModalWindowView.j", YES);objj_executeFile("_CPHUDWindowView.j", YES);objj_executeFile("_CPModalWindowView.j", YES);objj_executeFile("_CPPopoverWindowView.j", YES);objj_executeFile("_CPShadowWindowView.j", YES);objj_executeFile("_CPStandardWindowView.j", YES);objj_executeFile("_CPToolTipWindowView.j", YES);{var the_protocol = objj_allocateProtocol("CPWindowDelegate");
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_platformWindow"), new objj_ivar("_windowNumber"), new objj_ivar("_styleMask"), new objj_ivar("_frame"), new objj_ivar("_level"), new objj_ivar("_isVisible"), new objj_ivar("_hasBeenOrderedIn"), new objj_ivar("_isMiniaturized"), new objj_ivar("_isAnimating"), new objj_ivar("_hasShadow"), new objj_ivar("_isMovableByWindowBackground"), new objj_ivar("_isMovable"), new objj_ivar("_constrainsToUsableScreen"), new objj_ivar("_shadowStyle"), new objj_ivar("_showsResizeIndicator"), new objj_ivar("_positioningMask"), new objj_ivar("_positioningScreenRect"), new objj_ivar("_isDocumentEdited"), new objj_ivar("_isDocumentSaving"), new objj_ivar("_shadowView"), new objj_ivar("_windowView"), new objj_ivar("_contentView"), new objj_ivar("_toolbarView"), new objj_ivar("_mouseEnteredStack"), new objj_ivar("_leftMouseDownView"), new objj_ivar("_rightMouseDownView"), new objj_ivar("_toolbar"), new objj_ivar("_firstResponder"), new objj_ivar("_initialFirstResponder"), new objj_ivar("_hasBecomeKeyWindow"), new objj_ivar("_delegate"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_title"), new objj_ivar("_acceptsMouseMovedEvents"), new objj_ivar("_ignoresMouseEvents"), new objj_ivar("_windowController"), new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_undoManager"), new objj_ivar("_representedURL"), new objj_ivar("_registeredDraggedTypes"), new objj_ivar("_registeredDraggedTypesArray"), new objj_ivar("_inclusiveRegisteredDraggedTypes"), new objj_ivar("_defaultButton"), new objj_ivar("_defaultButtonEnabled"), new objj_ivar("_autorecalculatesKeyViewLoop"), new objj_ivar("_keyViewLoopIsDirty"), new objj_ivar("_sharesChromeWithPlatformWindow"), new objj_ivar("_autoresizingMask"), new objj_ivar("_isFullPlatformWindow"), new objj_ivar("_fullPlatformWindowSession"), new objj_ivar("_parentWindow"), new objj_ivar("_childWindows"), new objj_ivar("_childOrdering"), new objj_ivar("_sheetContext"), new objj_ivar("_parentView"), new objj_ivar("_isSheet"), new objj_ivar("_frameAnimation")]);objj_registerClassPair(the_class);
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
    return self.isa.objj_msgSend2(self, "initWithContentRect:styleMask:", CGRectMakeZero(), CPTitledWindowMask);
}
,["id"]), new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $CPWindow__initWithContentRect_styleMask_(self, _cmd, aContentRect, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow").super_class }, "init");
    if (self)
    {
        var windowViewClass = ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_windowViewClassForStyleMask:", aStyleMask));
        self._frame = (windowViewClass == null ? null : windowViewClass.isa.objj_msgSend1(windowViewClass, "frameRectForContentRect:", aContentRect));
        self._constrainsToUsableScreen = YES;
        (self == null ? null : self.isa.objj_msgSend1(self, "_setSharesChromeWithPlatformWindow:", !CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser")));
        if (CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
            (self == null ? null : self.isa.objj_msgSend1(self, "setPlatformWindow:", CPPlatformWindow.isa.objj_msgSend0(CPPlatformWindow, "primaryPlatformWindow")));
        else
        {
            if (aStyleMask & CPBorderlessBridgeWindowMask && aContentRect.size.width === 0 && aContentRect.size.height === 0)
            {
                var visibleFrame = ((___r1 = ((___r2 = CPScreen.isa.objj_msgSend0(CPScreen, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "init"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame"));
                self._frame.size.height = MIN(768.0, visibleFrame.size.height);
                self._frame.size.width = MIN(1024.0, visibleFrame.size.width);
                self._frame.origin.x = (visibleFrame.size.width - self._frame.size.width) / 2;
                self._frame.origin.y = (visibleFrame.size.height - self._frame.size.height) / 2;
            }
            (self == null ? null : self.isa.objj_msgSend1(self, "setPlatformWindow:", ((___r1 = CPPlatformWindow.isa.objj_msgSend0(CPPlatformWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithContentRect:", self._frame))));
            (self == null ? null : self.isa.objj_msgSend0(self, "platformWindow"))._only = self;
        }
        self._isFullPlatformWindow = NO;
        self._registeredDraggedTypes = CPSet.isa.objj_msgSend0(CPSet, "set");
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
        self._windowNumber = ((___r1 = CPApp._windows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        CPApp._windows[self._windowNumber] = self;
        self._styleMask = aStyleMask;
        (self == null ? null : self.isa.objj_msgSend1(self, "setLevel:", CPNormalWindowLevel));
        self._windowView = ((___r1 = (windowViewClass == null ? null : windowViewClass.isa.objj_msgSend0(windowViewClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithFrame:styleMask:", CGRectMake(0.0, 0.0, CGRectGetWidth(self._frame), CGRectGetHeight(self._frame)), aStyleMask));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setWindow:", self));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextResponder:", self));
        self._minSize = (self == null ? null : self.isa.objj_msgSend1(self, "_calculateMinSizeForProposedSize:", CGSizeMake(0.0, 0.0)));
        self._maxSize = CGSizeMake(1000000.0, 1000000.0);
        (self == null ? null : self.isa.objj_msgSend1(self, "setMovableByWindowBackground:", aStyleMask & CPHUDBackgroundWindowMask));
        (self == null ? null : self.isa.objj_msgSend1(self, "setContentView:", ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()))));
        self._firstResponder = self;
        (self == null ? null : self.isa.objj_msgSend1(self, "setNextResponder:", CPApp));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHasShadow:", aStyleMask !== CPBorderlessWindowMask));
        if (aStyleMask & CPBorderlessBridgeWindowMask)
            (self == null ? null : self.isa.objj_msgSend1(self, "setFullPlatformWindow:", YES));
        self._autorecalculatesKeyViewLoop = NO;
        self._defaultButtonEnabled = YES;
        self._keyViewLoopIsDirty = NO;
        self._hasBecomeKeyWindow = NO;
        (self == null ? null : self.isa.objj_msgSend1(self, "setShowsResizeIndicator:", self._styleMask & CPResizableWindowMask));
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_didReceiveResizeStyleChange:"), CPWindowResizeStyleGlobalChangeNotification, nil));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("platformWindow"), function $CPWindow__platformWindow(self, _cmd)
{
    return self._platformWindow;
}
,["CPPlatformWindow"]), new objj_method(sel_getUid("setPlatformWindow:"), function $CPWindow__setPlatformWindow_(self, _cmd, aPlatformWindow)
{
    var wasVisible = self.isa.objj_msgSend0(self, "isVisible");
    if (wasVisible)
        self.isa.objj_msgSend0(self, "close");
    self._platformWindow = aPlatformWindow;
    ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_setTitle:window:", self._title, self));
    if (wasVisible)
        self.isa.objj_msgSend1(self, "orderFront:", self);
    var ___r1;
}
,["void","CPPlatformWindow"]), new objj_method(sel_getUid("awakeFromCib"), function $CPWindow__awakeFromCib(self, _cmd)
{
    if (self._positioningScreenRect)
    {
        var actualScreenRect = CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser") ? ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentBounds")) : ((___r1 = self.isa.objj_msgSend0(self, "screen")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame")),
            frame = self.isa.objj_msgSend0(self, "frame"),
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
            self.isa.objj_msgSend1(self, "setFrameOrigin:", origin);
        }
    }
    if (self.isa.objj_msgSend1(self, "_hasKeyViewLoop:", ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "subviews"))))
    {
        var views = self.isa.objj_msgSend0(self, "_viewsSortedByPosition"),
            count = (views == null ? null : views.isa.objj_msgSend0(views, "count"));
        for (var i = 1; i < count; ++i)
        {
            var view = views[i];
            if ((view == null ? null : view.isa.objj_msgSend0(view, "nextKeyView")))
            {
                ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", view));
                break;
            }
        }
    }
    else
    {
        self.isa.objj_msgSend0(self, "_doRecalculateKeyViewLoop");
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_setWindowView:"), function $CPWindow___setWindowView_(self, _cmd, aWindowView)
{
    if (self._windowView === aWindowView)
        return;
    var oldWindowView = self._windowView;
    self._windowView = aWindowView;
    if (oldWindowView)
    {
        (oldWindowView == null ? null : oldWindowView.isa.objj_msgSend1(oldWindowView, "_setWindow:", nil));
        (oldWindowView == null ? null : oldWindowView.isa.objj_msgSend0(oldWindowView, "noteToolbarChanged"));
    }
    if (self._windowView)
    {
        var contentRect = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertRect:toView:", ((___r2 = self._contentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")), nil));
        contentRect.origin = self.isa.objj_msgSend1(self, "convertBaseToGlobal:", contentRect.origin);
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setWindow:", self));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextResponder:", self));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._contentView));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", self._title));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "noteToolbarChanged"));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setShowsResizeIndicator:", self.isa.objj_msgSend0(self, "showsResizeIndicator")));
        self.isa.objj_msgSend1(self, "setFrame:", self.isa.objj_msgSend1(self, "frameRectForContentRect:", contentRect));
    }
    var ___r1, ___r2;
}
,["void","CPView"]), new objj_method(sel_getUid("setFullPlatformWindow:"), function $CPWindow__setFullPlatformWindow_(self, _cmd, shouldBeFullPlatformWindow)
{
    if (!((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "supportsFullPlatformWindows")))
        return;
    shouldBeFullPlatformWindow = !!shouldBeFullPlatformWindow;
    if (self._isFullPlatformWindow === shouldBeFullPlatformWindow)
        return;
    self._isFullPlatformWindow = shouldBeFullPlatformWindow;
    if (self._isFullPlatformWindow)
    {
        self._fullPlatformWindowSession = _CPWindowFullPlatformWindowSessionMake(self._windowView, self.isa.objj_msgSend1(self, "contentRectForFrameRect:", self.isa.objj_msgSend0(self, "frame")), self.isa.objj_msgSend0(self, "hasShadow"), self.isa.objj_msgSend0(self, "level"));
        var fullPlatformWindowViewClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_windowViewClassForFullPlatformWindowStyleMask:", self._styleMask)),
            windowView = ((___r1 = (fullPlatformWindowViewClass == null ? null : fullPlatformWindowViewClass.isa.objj_msgSend0(fullPlatformWindowViewClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithFrame:styleMask:", CGRectMakeZero(), self._styleMask));
        self.isa.objj_msgSend1(self, "_setWindowView:", windowView);
        self.isa.objj_msgSend1(self, "setLevel:", CPBackgroundWindowLevel);
        self.isa.objj_msgSend1(self, "setHasShadow:", NO);
        self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPWindowWidthSizable | CPWindowHeightSizable);
        self.isa.objj_msgSend1(self, "setFrame:", ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame")));
    }
    else
    {
        var windowView = self._fullPlatformWindowSession.windowView;
        self.isa.objj_msgSend1(self, "_setWindowView:", windowView);
        self.isa.objj_msgSend1(self, "setLevel:", self._fullPlatformWindowSession.level);
        self.isa.objj_msgSend1(self, "setHasShadow:", self._fullPlatformWindowSession.hasShadow);
        self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPWindowNotSizable);
        self.isa.objj_msgSend1(self, "setFrame:", (windowView == null ? null : windowView.isa.objj_msgSend1(windowView, "frameRectForContentRect:", self._fullPlatformWindowSession.contentRect)));
    }
    var ___r1;
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
    return ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "contentRectForFrameRect:", aFrame));
    var ___r1;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $CPWindow__frameRectForContentRect_(self, _cmd, aContentRect)
{
    return ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "frameRectForContentRect:", aContentRect));
    var ___r1;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frame"), function $CPWindow__frame(self, _cmd)
{
    return CGRectMakeCopy(self._frame);
}
,["CGRect"]), new objj_method(sel_getUid("setFrame:display:animate:"), function $CPWindow__setFrame_display_animate_(self, _cmd, aFrame, shouldDisplay, shouldAnimate)
{
    self.isa.objj_msgSend(self, "_setFrame:display:animate:constrainWidth:constrainHeight:", aFrame, shouldDisplay, shouldAnimate, NO, YES);
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
    frame = self.isa.objj_msgSend3(self, "_constrainFrame:toUsableScreenWidth:andHeight:", frame, shouldConstrainWidth, shouldConstrainHeight);
    if (shouldAnimate)
    {
        ((___r1 = self._frameAnimation), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "stopAnimation"));
        self._frameAnimation = ((___r1 = (_CPWindowFrameAnimation == null ? null : _CPWindowFrameAnimation.isa.objj_msgSend0(_CPWindowFrameAnimation, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithWindow:targetFrame:", self, frame));
        ((___r1 = self._frameAnimation), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "startAnimation"));
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
            if (self.isa.objj_msgSend0(self, "attachedSheet"))
                self.isa.objj_msgSend0(self, "_setAttachedSheetFrameOrigin");
            ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowDidMoveNotification, self));
        }
        var size = self._frame.size,
            newSize = frame.size;
        if (!CGSizeEqualToSize(size, newSize))
        {
            size.width = newSize.width;
            size.height = newSize.height;
            ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", size));
            if (self._hasShadow)
                ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
            if (!self._isAnimating)
                ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowDidResizeNotification, self));
        }
        if (self.isa.objj_msgSend0(self, "_sharesChromeWithPlatformWindow"))
            ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContentRect:", self._frame));
        if (originMoved)
            self.isa.objj_msgSend1(self, "_moveChildWindows:", delta);
    }
    var ___r1;
}
,["void","CGRect","BOOL","BOOL","BOOL","BOOL"]), new objj_method(sel_getUid("_constrainFrame:toUsableScreenWidth:andHeight:"), function $CPWindow___constrainFrame_toUsableScreenWidth_andHeight_(self, _cmd, aFrame, constrainWidth, constrainHeight)
{
    var frame = CGRectMakeCopy(aFrame);
    if (!self._constrainsToUsableScreen || !self._isVisible)
        return frame;
    var usableRect = ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "usableContentFrame"));
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
    var ___r1;
}
,["CGRect","CGRect","BOOL","BOOL"]), new objj_method(sel_getUid("_constrainOriginOfFrame:"), function $CPWindow___constrainOriginOfFrame_(self, _cmd, aFrame)
{
    var frame = CGRectMakeCopy(aFrame);
    if (!self._constrainsToUsableScreen || !self._isVisible)
        return frame;
    var usableRect = ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "usableContentFrame")),
        minimumSize = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_minimumResizeSize"));
    frame.origin.x = MAX(frame.origin.x, CGRectGetMinX(usableRect) + minimumSize.width - CGRectGetWidth(frame));
    frame.origin.x = MIN(frame.origin.x, CGRectGetMaxX(usableRect) - minimumSize.width);
    frame.origin.y = MAX(frame.origin.y, CGRectGetMinY(usableRect));
    frame.origin.y = MIN(frame.origin.y, CGRectGetMaxY(usableRect) - CGRectGetMinY(((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))) - CPWindowMinVisibleVerticalMargin);
    return frame;
    var ___r1;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("_moveChildWindows:"), function $CPWindow___moveChildWindows_(self, _cmd, delta)
{
    ((___r1 = self._childWindows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "enumerateObjectsUsingBlock:", function(childWindow)
    {
        var origin = (childWindow == null ? null : childWindow.isa.objj_msgSend0(childWindow, "frame")).origin;
        (childWindow == null ? null : childWindow.isa.objj_msgSend1(childWindow, "setFrameOrigin:", CGPointMake(origin.x + delta.x, origin.y + delta.y)));
    }));
    var ___r1;
}
,["void","CGPoint"]), new objj_method(sel_getUid("setFrame:display:"), function $CPWindow__setFrame_display_(self, _cmd, aFrame, shouldDisplay)
{
    self.isa.objj_msgSend3(self, "setFrame:display:animate:", aFrame, shouldDisplay, NO);
}
,["void","CGRect","BOOL"]), new objj_method(sel_getUid("setFrame:"), function $CPWindow__setFrame_(self, _cmd, aFrame)
{
    self.isa.objj_msgSend3(self, "setFrame:display:animate:", aFrame, YES, NO);
}
,["void","CGRect"]), new objj_method(sel_getUid("setFrameOrigin:"), function $CPWindow__setFrameOrigin_(self, _cmd, anOrigin)
{
    var frame = self.isa.objj_msgSend1(self, "_constrainOriginOfFrame:", CGRectMake(anOrigin.x, anOrigin.y, self._frame.size.width, self._frame.size.height));
    self.isa.objj_msgSend(self, "_setFrame:display:animate:constrainWidth:constrainHeight:", frame, YES, NO, NO, NO);
}
,["void","CGPoint"]), new objj_method(sel_getUid("setFrameSize:"), function $CPWindow__setFrameSize_(self, _cmd, aSize)
{
    self.isa.objj_msgSend3(self, "setFrame:display:animate:", CGRectMake(CGRectGetMinX(self._frame), CGRectGetMinY(self._frame), aSize.width, aSize.height), YES, NO);
}
,["void","CGSize"]), new objj_method(sel_getUid("orderFront:"), function $CPWindow__orderFront_(self, _cmd, aSender)
{
    self.isa.objj_msgSend2(self, "orderWindow:relativeTo:", CPWindowAbove, 0);
}
,["void","id"]), new objj_method(sel_getUid("_orderFront"), function $CPWindow___orderFront(self, _cmd)
{
    if (!CPApp._keyWindow)
        self.isa.objj_msgSend0(self, "makeKeyWindow");
    if (self.isa.objj_msgSend0(self, "isKeyWindow") && (self._firstResponder === self || !self._firstResponder))
        self.isa.objj_msgSend1(self, "makeFirstResponder:", self._initialFirstResponder);
    if (!CPApp._mainWindow)
        self.isa.objj_msgSend0(self, "makeMainWindow");
}
,["void"]), new objj_method(sel_getUid("_parentDidOrderInChild"), function $CPWindow___parentDidOrderInChild(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("orderBack:"), function $CPWindow__orderBack_(self, _cmd, aSender)
{
    self.isa.objj_msgSend2(self, "orderWindow:relativeTo:", CPWindowBelow, 0);
}
,["void","id"]), new objj_method(sel_getUid("_orderBack"), function $CPWindow___orderBack(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("orderOut:"), function $CPWindow__orderOut_(self, _cmd, aSender)
{
    self.isa.objj_msgSend2(self, "orderWindow:relativeTo:", CPWindowOut, 0);
}
,["void","id"]), new objj_method(sel_getUid("_orderOutRecursively:"), function $CPWindow___orderOutRecursively_(self, _cmd, recursive)
{
    if (!self._isVisible)
        return;
    if (self.isa.objj_msgSend0(self, "isSheet"))
    {
        ((___r1 = self._parentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_detachSheetWindow"));
        return;
    }
    if (recursive)
        ((___r1 = self._childWindows), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("_orderOutRecursively:"), recursive));
    self.isa.objj_msgSend0(self, "_updateMainAndKeyWindows");
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("orderWindow:relativeTo:"), function $CPWindow__orderWindow_relativeTo_(self, _cmd, orderingMode, otherWindowNumber)
{
    if (orderingMode === CPWindowOut)
    {
        ((___r1 = self._parentWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeChildWindow:", self));
        self.isa.objj_msgSend1(self, "_orderOutRecursively:", !self._parentWindow);
    }
    else if (orderingMode === CPWindowAbove && otherWindowNumber === 0)
        self.isa.objj_msgSend0(self, "_orderFront");
    else if (orderingMode === CPWindowBelow && otherWindowNumber === 0)
        self.isa.objj_msgSend0(self, "_orderBack");
    var ___r1;
}
,["void","CPWindowOrderingMode","int"]), new objj_method(sel_getUid("setLevel:"), function $CPWindow__setLevel_(self, _cmd, aLevel)
{
    if (aLevel === self._level)
        return;
    ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "moveWindow:fromLevel:toLevel:", self, self._level, aLevel));
    self._level = aLevel;
    ((___r1 = self._childWindows), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setLevel:"), self._level));
    if (self.isa.objj_msgSend0(self, "_sharesChromeWithPlatformWindow"))
        ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLevel:", aLevel));
    var ___r1;
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
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setShowsResizeIndicator:", self._styleMask & CPResizableWindowMask));
    var ___r1;
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
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setShowsResizeIndicator:", self.isa.objj_msgSend0(self, "showsResizeIndicator")));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("resizeIndicatorOffset"), function $CPWindow__resizeIndicatorOffset(self, _cmd)
{
    return ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "resizeIndicatorOffset"));
    var ___r1;
}
,["CGSize"]), new objj_method(sel_getUid("setResizeIndicatorOffset:"), function $CPWindow__setResizeIndicatorOffset_(self, _cmd, anOffset)
{
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setResizeIndicatorOffset:", anOffset));
    var ___r1;
}
,["void","CGSize"]), new objj_method(sel_getUid("setContentView:"), function $CPWindow__setContentView_(self, _cmd, aView)
{
    if (self._contentView && self._contentView !== aView)
        ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    var bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(self._frame), CGRectGetHeight(self._frame));
    self._contentView = aView;
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", self.isa.objj_msgSend1(self, "contentRectForFrameRect:", bounds)));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._contentView));
    if (self._initialFirstResponder && self._initialFirstResponder !== self)
        self._initialFirstResponder = self;
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("contentView"), function $CPWindow__contentView(self, _cmd)
{
    return self._contentView;
}
,["CPView"]), new objj_method(sel_getUid("setAlphaValue:"), function $CPWindow__setAlphaValue_(self, _cmd, aValue)
{
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlphaValue:", aValue));
    var ___r1;
}
,["void","float"]), new objj_method(sel_getUid("alphaValue"), function $CPWindow__alphaValue(self, _cmd)
{
    return ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "alphaValue"));
    var ___r1;
}
,["float"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPWindow__setBackgroundColor_(self, _cmd, aColor)
{
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", aColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CPWindow__backgroundColor(self, _cmd)
{
    return ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "backgroundColor"));
    var ___r1;
}
,["CPColor"]), new objj_method(sel_getUid("setMinSize:"), function $CPWindow__setMinSize_(self, _cmd, aSize)
{
    if (CGSizeEqualToSize(self._minSize, aSize))
        return;
    self._minSize = self.isa.objj_msgSend1(self, "_calculateMinSizeForProposedSize:", aSize);
    var size = CGSizeMakeCopy(self.isa.objj_msgSend0(self, "frame").size),
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
        self.isa.objj_msgSend1(self, "setFrameSize:", size);
}
,["void","CGSize"]), new objj_method(sel_getUid("minSize"), function $CPWindow__minSize(self, _cmd)
{
    return self._minSize;
}
,["CGSize"]), new objj_method(sel_getUid("_calculateMinSizeForProposedSize:"), function $CPWindow___calculateMinSizeForProposedSize_(self, _cmd, proposedSize)
{
    var contentFrame = self.isa.objj_msgSend1(self, "contentRectForFrameRect:", self._frame),
        minHeight = CGRectGetHeight(self._frame) - CGRectGetHeight(contentFrame);
    return CGSizeMake(MAX(proposedSize.width, 0), MAX(proposedSize.height, minHeight));
}
,["CGSize","CGSize"]), new objj_method(sel_getUid("setMaxSize:"), function $CPWindow__setMaxSize_(self, _cmd, aSize)
{
    if (CGSizeEqualToSize(self._maxSize, aSize))
        return;
    self._maxSize = CGSizeMakeCopy(aSize);
    var size = CGSizeMakeCopy(self.isa.objj_msgSend0(self, "frame").size),
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
        self.isa.objj_msgSend1(self, "setFrameSize:", size);
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
    if (self.isa.objj_msgSend0(self, "_sharesChromeWithPlatformWindow"))
    {
        if (self._shadowView)
        {
            self._shadowView = nil;
        }
        ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHasShadow:", self._hasShadow));
        return;
    }
    if (self._hasShadow && !self._shadowView)
    {
        self._shadowView = ((___r1 = _CPShadowWindowView.isa.objj_msgSend0(_CPShadowWindowView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWindowView:", self._windowView));
        ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
    }
    else if (!self._hasShadow && self._shadowView)
    {
        self._shadowView = nil;
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setHasShadow:"), function $CPWindow__setHasShadow_(self, _cmd, shouldHaveShadow)
{
    if (self._hasShadow === shouldHaveShadow)
        return;
    self._hasShadow = shouldHaveShadow;
    self.isa.objj_msgSend0(self, "_updateShadow");
}
,["void","BOOL"]), new objj_method(sel_getUid("setShadowStyle:"), function $CPWindow__setShadowStyle_(self, _cmd, aStyle)
{
    self._shadowStyle = aStyle;
    ((___r1 = self.isa.objj_msgSend0(self, "platformWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setShadowStyle:", self._shadowStyle));
    var ___r1;
}
,["void","unsigned"]), new objj_method(sel_getUid("setDelegate:"), function $CPWindow__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidResignKeyNotification, self));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidBecomeKeyNotification, self));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidBecomeMainNotification, self));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidResignMainNotification, self));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidMoveNotification, self));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidResizeNotification, self));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowWillBeginSheetNotification, self));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, CPWindowDidEndSheetNotification, self));
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowShouldClose:"))))
        self._implementedDelegateMethods |= CPWindowDelegate_windowShouldClose_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowWillReturnUndoManager:"))))
        self._implementedDelegateMethods |= CPWindowDelegate_windowWillReturnUndoManager_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowWillClose:"))))
        self._implementedDelegateMethods |= CPWindowDelegate_windowWillClose_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowDidResignKey:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidResignKey:"), CPWindowDidResignKeyNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowDidBecomeKey:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidBecomeKey:"), CPWindowDidBecomeKeyNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowDidBecomeMain:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidBecomeMain:"), CPWindowDidBecomeMainNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowDidResignMain:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidResignMain:"), CPWindowDidResignMainNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowDidMove:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidMove:"), CPWindowDidMoveNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowDidResize:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidResize:"), CPWindowDidResizeNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowWillBeginSheet:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowWillBeginSheet:"), CPWindowWillBeginSheetNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("windowDidEndSheet:"))))
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, sel_getUid("windowDidEndSheet:"), CPWindowDidEndSheetNotification, self));
    var ___r1;
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
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", aSelector)))
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performSelector:", aSelector));
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow").super_class }, "doCommandBySelector:", aSelector);
    var ___r1;
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
                self.isa.objj_msgSend1(self, "makeFirstResponder:", self._initialFirstResponder);
            else
            {
                var view = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "nextValidKeyView"));
                if (view)
                    self.isa.objj_msgSend1(self, "makeFirstResponder:", view);
            }
            return;
        }
    }
    if (self._firstResponder)
        self.isa.objj_msgSend1(self, "makeFirstResponder:", self._firstResponder);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("makeFirstResponder:"), function $CPWindow__makeFirstResponder_(self, _cmd, aResponder)
{
    if (self._firstResponder === aResponder)
        return YES;
    if (!((___r1 = self._firstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "resignFirstResponder")))
        return NO;
    if (!aResponder || !(aResponder == null ? null : aResponder.isa.objj_msgSend0(aResponder, "acceptsFirstResponder")) || !(aResponder == null ? null : aResponder.isa.objj_msgSend0(aResponder, "becomeFirstResponder")))
    {
        self._firstResponder = self;
        return NO;
    }
    self._firstResponder = aResponder;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", _CPWindowDidChangeFirstResponderNotification, self));
    return YES;
    var ___r1;
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
    ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "arrowCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("title"), function $CPWindow__title(self, _cmd)
{
    return self._title;
}
,["CPString"]), new objj_method(sel_getUid("setTitle:"), function $CPWindow__setTitle_(self, _cmd, aTitle)
{
    self._title = aTitle;
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", aTitle));
    ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_setTitle:window:", self._title, self));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("setTitleWithRepresentedFilename:"), function $CPWindow__setTitleWithRepresentedFilename_(self, _cmd, aFilePath)
{
    self.isa.objj_msgSend1(self, "setRepresentedFilename:", aFilePath);
    self.isa.objj_msgSend1(self, "setTitle:", (aFilePath == null ? null : aFilePath.isa.objj_msgSend0(aFilePath, "lastPathComponent")));
}
,["void","CPString"]), new objj_method(sel_getUid("setRepresentedFilename:"), function $CPWindow__setRepresentedFilename_(self, _cmd, aFilePath)
{
    self.isa.objj_msgSend1(self, "setRepresentedURL:", CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", aFilePath));
}
,["void","CPString"]), new objj_method(sel_getUid("representedFilename"), function $CPWindow__representedFilename(self, _cmd)
{
    return ((___r1 = self._representedURL), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "absoluteString"));
    var ___r1;
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
    return ((___r1 = CPScreen.isa.objj_msgSend0(CPScreen, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
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
    var size = self.isa.objj_msgSend0(self, "frame").size,
        containerSize = CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser") ? ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentBounds")).size : ((___r1 = self.isa.objj_msgSend0(self, "screen")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame")).size;
    var origin = CGPointMake((containerSize.width - size.width) / 2.0, (containerSize.height - size.height) / 2.0);
    if (origin.x < 0.0)
        origin.x = 0.0;
    if (origin.y < 0.0)
        origin.y = 0.0;
    self.isa.objj_msgSend1(self, "setFrameOrigin:", origin);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("sendEvent:"), function $CPWindow__sendEvent_(self, _cmd, anEvent)
{
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")),
        sheet = self.isa.objj_msgSend0(self, "attachedSheet");
    if (sheet)
    {
        switch(type) {
        case CPLeftMouseDown:
            if (!self._parentWindow)
                return;
            ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseDown:", anEvent));
            (sheet == null ? null : sheet.isa.objj_msgSend1(sheet, "makeKeyAndOrderFront:", self));
            return;
        case CPMouseMoved:
            break;
default:
            return;
        }
    }
    var point = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow"));
    switch(type) {
    case CPFlagsChanged:
        return ((___r1 = self.isa.objj_msgSend0(self, "firstResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "flagsChanged:", anEvent));
    case CPKeyUp:
        return ((___r1 = self.isa.objj_msgSend0(self, "firstResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "keyUp:", anEvent));
    case CPKeyDown:
        if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers")) === CPTabCharacter)
        {
            if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")) & CPShiftKeyMask)
                self.isa.objj_msgSend1(self, "selectPreviousKeyView:", self);
            else
                self.isa.objj_msgSend1(self, "selectNextKeyView:", self);
            return;
        }
        else if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers")) === CPBackTabCharacter)
        {
            var didTabBack = self.isa.objj_msgSend1(self, "selectPreviousKeyView:", self);
            if (didTabBack)
            {
            }
            return didTabBack;
        }
        else if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers")) == CPEscapeFunctionKey && self.isa.objj_msgSend1(self, "_processKeyboardUIKey:", anEvent))
        {
            return;
        }
        ((___r1 = self.isa.objj_msgSend0(self, "firstResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "keyDown:", anEvent));
        if (!self.isa.objj_msgSend0(self, "disableKeyEquivalentForDefaultButton"))
        {
            var defaultButton = self.isa.objj_msgSend0(self, "defaultButton"),
                keyEquivalent = (defaultButton == null ? null : defaultButton.isa.objj_msgSend0(defaultButton, "keyEquivalent")),
                modifierMask = (defaultButton == null ? null : defaultButton.isa.objj_msgSend0(defaultButton, "keyEquivalentModifierMask"));
            if ((anEvent == null ? null : anEvent.isa.objj_msgSend2(anEvent, "_triggersKeyEquivalent:withModifierMask:", keyEquivalent, modifierMask)))
                ((___r1 = self.isa.objj_msgSend0(self, "defaultButton")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performClick:", self));
        }
        return;
    case CPScrollWheel:
        return ((___r1 = ((___r2 = self._windowView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "hitTest:", point))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollWheel:", anEvent));
    case CPLeftMouseUp:
    case CPRightMouseUp:
        var hitTestedView = self._leftMouseDownView,
            selector = type == CPRightMouseUp ? sel_getUid("rightMouseUp:") : sel_getUid("mouseUp:");
        if (!hitTestedView)
            hitTestedView = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "hitTest:", point));
        (hitTestedView == null ? null : hitTestedView.isa.objj_msgSend2(hitTestedView, "performSelector:withObject:", selector, anEvent));
        self._leftMouseDownView = nil;
        return;
    case CPLeftMouseDown:
    case CPRightMouseDown:
        self._leftMouseDownView = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "hitTest:", point));
        if (self._leftMouseDownView !== self._firstResponder && ((___r1 = self._leftMouseDownView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "acceptsFirstResponder")))
            self.isa.objj_msgSend1(self, "makeFirstResponder:", self._leftMouseDownView);
        (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "activateIgnoringOtherApps:", YES));
        var theWindow = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window")),
            selector = type == CPRightMouseDown ? sel_getUid("rightMouseDown:") : sel_getUid("mouseDown:");
        if ((theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "isKeyWindow")) || (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "becomesKeyOnlyIfNeeded")) && !((___r1 = self._leftMouseDownView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "needsPanelToBecomeKey")))
            return ((___r1 = self._leftMouseDownView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", selector, anEvent));
        else
        {
            self.isa.objj_msgSend1(self, "makeKeyAndOrderFront:", self);
            if (((___r1 = self._leftMouseDownView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "acceptsFirstMouse:", anEvent)))
                return ((___r1 = self._leftMouseDownView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", selector, anEvent));
        }
        break;
    case CPLeftMouseDragged:
    case CPRightMouseDragged:
        if (!self._leftMouseDownView)
            return ((___r1 = ((___r2 = self._windowView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "hitTest:", point))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseDragged:", anEvent));
        var selector;
        if (type == CPRightMouseDragged)
        {
            selector = sel_getUid("rightMouseDragged:");
            if (!((___r1 = self._leftMouseDownView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", selector)))
                selector = nil;
        }
        if (!selector)
            selector = sel_getUid("mouseDragged:");
        return ((___r1 = self._leftMouseDownView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", selector, anEvent));
    case CPMouseMoved:
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setCursorForLocation:resizing:", point, NO));
        if (!self._acceptsMouseMovedEvents || sheet)
            return;
        if (!self._mouseEnteredStack)
            self._mouseEnteredStack = [];
        var hitTestView = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "hitTest:", point));
        if (((___r1 = self._mouseEnteredStack), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) && ((___r1 = self._mouseEnteredStack), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastObject")) === hitTestView)
            return (hitTestView == null ? null : hitTestView.isa.objj_msgSend1(hitTestView, "mouseMoved:", anEvent));
        var view = hitTestView,
            mouseEnteredStack = [];
        while (view)
        {
            mouseEnteredStack.unshift(view);
            view = (view == null ? null : view.isa.objj_msgSend0(view, "superview"));
        }
        var deviation = MIN(self._mouseEnteredStack.length, mouseEnteredStack.length);
        while (deviation--)
            if (self._mouseEnteredStack[deviation] === mouseEnteredStack[deviation])
                break;
        var index = deviation + 1,
            count = self._mouseEnteredStack.length;
        if (index < count)
        {
            var event = CPEvent.isa.objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPMouseExited, point, (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")), (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "timestamp")), self._windowNumber, nil, -1, 1, 0);
            for (; index < count; ++index)
                ((___r1 = self._mouseEnteredStack[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseExited:", event));
        }
        index = deviation + 1;
        count = mouseEnteredStack.length;
        if (index < count)
        {
            var event = CPEvent.isa.objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPMouseEntered, point, (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")), (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "timestamp")), self._windowNumber, nil, -1, 1, 0);
            for (; index < count; ++index)
                ((___r1 = mouseEnteredStack[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseEntered:", event));
        }
        self._mouseEnteredStack = mouseEnteredStack;
        (hitTestView == null ? null : hitTestView.isa.objj_msgSend1(hitTestView, "mouseMoved:", anEvent));
    }
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("windowNumber"), function $CPWindow__windowNumber(self, _cmd)
{
    return self._windowNumber;
}
,["int"]), new objj_method(sel_getUid("becomeKeyWindow"), function $CPWindow__becomeKeyWindow(self, _cmd)
{
    CPApp._keyWindow = self;
    if (self._firstResponder !== self && ((___r1 = self._firstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("becomeKeyWindow"))))
        ((___r1 = self._firstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "becomeKeyWindow"));
    if (!self._hasBecomeKeyWindow)
    {
        if (!self.isa.objj_msgSend1(self, "_hasKeyViewLoop:", ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "subviews"))))
            self.isa.objj_msgSend0(self, "recalculateKeyViewLoop");
    }
    self.isa.objj_msgSend0(self, "_setupFirstResponder");
    self._hasBecomeKeyWindow = YES;
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "noteKeyWindowStateChanged"));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_notifyWindowDidBecomeKey"));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowDidBecomeKeyNotification, self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("canBecomeKeyWindow"), function $CPWindow__canBecomeKeyWindow(self, _cmd)
{
    return self._styleMask & CPTitledWindowMask || self.isa.objj_msgSend0(self, "isFullPlatformWindow") || self._isSheet;
}
,["BOOL"]), new objj_method(sel_getUid("isKeyWindow"), function $CPWindow__isKeyWindow(self, _cmd)
{
    return (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "keyWindow")) == self;
}
,["BOOL"]), new objj_method(sel_getUid("makeKeyAndOrderFront:"), function $CPWindow__makeKeyAndOrderFront_(self, _cmd, aSender)
{
    self.isa.objj_msgSend1(self, "orderFront:", self);
    self.isa.objj_msgSend0(self, "makeKeyWindow");
    self.isa.objj_msgSend0(self, "makeMainWindow");
}
,["void","id"]), new objj_method(sel_getUid("makeKeyWindow"), function $CPWindow__makeKeyWindow(self, _cmd)
{
    if ((CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "keyWindow")) === self || !self.isa.objj_msgSend0(self, "canBecomeKeyWindow"))
        return;
    ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "keyWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "resignKeyWindow"));
    self.isa.objj_msgSend0(self, "becomeKeyWindow");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("resignKeyWindow"), function $CPWindow__resignKeyWindow(self, _cmd)
{
    if (self._firstResponder !== self && ((___r1 = self._firstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("resignKeyWindow"))))
        ((___r1 = self._firstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "resignKeyWindow"));
    if (CPApp._keyWindow === self)
        CPApp._keyWindow = nil;
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "noteKeyWindowStateChanged"));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_notifyWindowDidResignKey"));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowDidResignKeyNotification, self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"), function $CPWindow__dragImage_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{
    ((___r1 = CPDragServer.isa.objj_msgSend0(CPDragServer, "sharedDragServer")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:", anImage, self, self.isa.objj_msgSend1(self, "convertBaseToGlobal:", imageLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack));
    var ___r1;
}
,["void","CPImage","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"), function $CPWindow___noteRegisteredDraggedTypes_(self, _cmd, pasteboardTypes)
{
    if (!pasteboardTypes)
        return;
    if (!self._inclusiveRegisteredDraggedTypes)
        self._inclusiveRegisteredDraggedTypes = CPCountedSet.isa.objj_msgSend0(CPCountedSet, "set");
    ((___r1 = self._inclusiveRegisteredDraggedTypes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unionSet:", pasteboardTypes));
    var ___r1;
}
,["void","CPSet"]), new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"), function $CPWindow___noteUnregisteredDraggedTypes_(self, _cmd, pasteboardTypes)
{
    if (!pasteboardTypes)
        return;
    ((___r1 = self._inclusiveRegisteredDraggedTypes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "minusSet:", pasteboardTypes));
    if (((___r1 = self._inclusiveRegisteredDraggedTypes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) === 0)
        self._inclusiveRegisteredDraggedTypes = nil;
    var ___r1;
}
,["void","CPSet"]), new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"), function $CPWindow__dragView_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, viewLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{
    ((___r1 = CPDragServer.isa.objj_msgSend0(CPDragServer, "sharedDragServer")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", aView, self, self.isa.objj_msgSend1(self, "convertBaseToGlobal:", viewLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack));
    var ___r1;
}
,["void","CPView","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("registerForDraggedTypes:"), function $CPWindow__registerForDraggedTypes_(self, _cmd, pasteboardTypes)
{
    if (!pasteboardTypes)
        return;
    self.isa.objj_msgSend1(self, "_noteUnregisteredDraggedTypes:", self._registeredDraggedTypes);
    ((___r1 = self._registeredDraggedTypes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObjectsFromArray:", pasteboardTypes));
    self.isa.objj_msgSend1(self, "_noteRegisteredDraggedTypes:", self._registeredDraggedTypes);
    self._registeredDraggedTypesArray = nil;
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("registeredDraggedTypes"), function $CPWindow__registeredDraggedTypes(self, _cmd)
{
    if (!self._registeredDraggedTypesArray)
        self._registeredDraggedTypesArray = ((___r1 = self._registeredDraggedTypes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allObjects"));
    return self._registeredDraggedTypesArray;
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("unregisterDraggedTypes"), function $CPWindow__unregisterDraggedTypes(self, _cmd)
{
    self.isa.objj_msgSend1(self, "_noteUnregisteredDraggedTypes:", self._registeredDraggedTypes);
    self._registeredDraggedTypes = CPSet.isa.objj_msgSend0(CPSet, "set");
    self._registeredDraggedTypesArray = [];
}
,["void"]), new objj_method(sel_getUid("setDocumentEdited:"), function $CPWindow__setDocumentEdited_(self, _cmd, isDocumentEdited)
{
    if (self._isDocumentEdited == isDocumentEdited)
        return;
    self._isDocumentEdited = isDocumentEdited;
    (CPMenu == null ? null : CPMenu.isa.objj_msgSend1(CPMenu, "_setMenuBarIconImageAlphaValue:", self._isDocumentEdited ? 0.5 : 1.0));
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentEdited:", isDocumentEdited));
    var ___r1;
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
    self.isa.objj_msgSend0(self, "_synchronizeSaveMenuWithDocumentSaving");
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "windowDidChangeDocumentSaving"));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("isDocumentSaving"), function $CPWindow__isDocumentSaving(self, _cmd)
{
    return self._isDocumentSaving;
}
,["BOOL"]), new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"), function $CPWindow___synchronizeSaveMenuWithDocumentSaving(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "isMainWindow"))
        return;
    var mainMenu = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")),
        index = (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "indexOfItemWithTitle:", self._isDocumentSaving ? "Save" : "Saving..."));
    if (index == CPNotFound)
        return;
    var item = (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "itemAtIndex:", index));
    if (self._isDocumentSaving)
    {
        CPWindowSaveImage = (item == null ? null : item.isa.objj_msgSend0(item, "image"));
        (item == null ? null : item.isa.objj_msgSend1(item, "setTitle:", "Saving..."));
        (item == null ? null : item.isa.objj_msgSend1(item, "setImage:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "spinning-regular-gif", CPProgressIndicator))));
        (item == null ? null : item.isa.objj_msgSend1(item, "setEnabled:", NO));
    }
    else
    {
        (item == null ? null : item.isa.objj_msgSend1(item, "setTitle:", "Save"));
        (item == null ? null : item.isa.objj_msgSend1(item, "setImage:", CPWindowSaveImage));
        (item == null ? null : item.isa.objj_msgSend1(item, "setEnabled:", YES));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("performMiniaturize:"), function $CPWindow__performMiniaturize_(self, _cmd, aSender)
{
    self.isa.objj_msgSend1(self, "miniaturize:", aSender);
}
,["void","id"]), new objj_method(sel_getUid("miniaturize:"), function $CPWindow__miniaturize_(self, _cmd, sender)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowWillMiniaturizeNotification, self));
    ((___r1 = self.isa.objj_msgSend0(self, "platformWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "miniaturize:", sender));
    self.isa.objj_msgSend0(self, "_updateMainAndKeyWindows");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowDidMiniaturizeNotification, self));
    self._isMiniaturized = YES;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("deminiaturize:"), function $CPWindow__deminiaturize_(self, _cmd, sender)
{
    ((___r1 = self.isa.objj_msgSend0(self, "platformWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "deminiaturize:", sender));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowDidDeminiaturizeNotification, self));
    self._isMiniaturized = NO;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("isMiniaturized"), function $CPWindow__isMiniaturized(self, _cmd)
{
    return self._isMiniaturized;
}
,["void"]), new objj_method(sel_getUid("performClose:"), function $CPWindow__performClose_(self, _cmd, aSender)
{
    if (!(self._styleMask & CPClosableWindowMask))
        return;
    if (self.isa.objj_msgSend0(self, "isFullPlatformWindow"))
    {
        var event = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"));
        if ((event == null ? null : event.isa.objj_msgSend0(event, "type")) === CPKeyDown && (event == null ? null : event.isa.objj_msgSend0(event, "characters")) === "w" && (event == null ? null : event.isa.objj_msgSend0(event, "modifierFlags")) & CPPlatformActionKeyMask)
        {
            ((___r1 = self.isa.objj_msgSend0(self, "platformWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
            return;
        }
    }
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToWindowShouldClose"))
    {
        if (!self.isa.objj_msgSend0(self, "_sendDelegateWindowShouldClose"))
            return;
    }
    else if (self.isa.objj_msgSend1(self, "respondsToSelector:", sel_getUid("windowShouldClose:")))
    {
        if (!self.isa.objj_msgSend1(self, "windowShouldClose:", self))
            return;
    }
    var documents = ((___r1 = self._windowController), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "documents"));
    if ((documents == null ? null : documents.isa.objj_msgSend0(documents, "count")))
    {
        var index = (documents == null ? null : documents.isa.objj_msgSend1(documents, "indexOfObject:", ((___r1 = self._windowController), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "document"))));
        ((___r1 = documents[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:", self._windowController, self, sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"), {documents: (documents == null ? null : documents.isa.objj_msgSend0(documents, "copy")), visited: 0, index: index}));
    }
    else
        self.isa.objj_msgSend0(self, "close");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"), function $CPWindow___windowControllerContainingDocument_shouldClose_contextInfo_(self, _cmd, document, shouldClose, context)
{
    if (shouldClose)
    {
        var windowController = self.isa.objj_msgSend0(self, "windowController"),
            documents = context.documents,
            count = (documents == null ? null : documents.isa.objj_msgSend0(documents, "count")),
            visited = ++context.visited,
            index = ++context.index % count;
        (document == null ? null : document.isa.objj_msgSend1(document, "removeWindowController:", windowController));
        if (visited < count)
        {
            (windowController == null ? null : windowController.isa.objj_msgSend1(windowController, "setDocument:", documents[index]));
            ((___r1 = documents[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:", self._windowController, self, sel_getUid("_windowControllerContainingDocument:shouldClose:contextInfo:"), context));
        }
        else
            self.isa.objj_msgSend0(self, "close");
    }
    var ___r1;
}
,["void","CPDocument","BOOL","Object"]), new objj_method(sel_getUid("close"), function $CPWindow__close(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_sendDelegateWindowWillClose");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowWillCloseNotification, self));
    ((___r1 = self._parentWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeChildWindow:", self));
    self.isa.objj_msgSend1(self, "_orderOutRecursively:", NO);
    self.isa.objj_msgSend1(self, "_detachFromChildrenClosing:", !self._parentWindow);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_detachFromChildrenClosing:"), function $CPWindow___detachFromChildrenClosing_(self, _cmd, shouldCloseChildren)
{
    ((___r1 = self._childWindows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "enumerateObjectsUsingBlock:", function(child)
    {
        (child == null ? null : child.isa.objj_msgSend1(child, "setParentWindow:", nil));
    }));
    if (shouldCloseChildren)
    {
        ((___r1 = self._childWindows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "enumerateObjectsUsingBlock:", function(child)
        {
            (child == null ? null : child.isa.objj_msgSend1(child, "_orderOutRecursively:", NO));
            (child == null ? null : child.isa.objj_msgSend1(child, "_detachFromChildrenClosing:", !(child == null ? null : child.isa.objj_msgSend0(child, "parentWindow"))));
        }));
    }
    self._childWindows = [];
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("isMainWindow"), function $CPWindow__isMainWindow(self, _cmd)
{
    return (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainWindow")) === self;
}
,["BOOL"]), new objj_method(sel_getUid("canBecomeMainWindow"), function $CPWindow__canBecomeMainWindow(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "isVisible") && (self._styleMask & CPTitledWindowMask || self._isFullPlatformWindow);
}
,["BOOL"]), new objj_method(sel_getUid("makeMainWindow"), function $CPWindow__makeMainWindow(self, _cmd)
{
    if (self._isSheet)
    {
        ((___r1 = self._parentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "makeMainWindow"));
        return;
    }
    if ((CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainWindow")) === self || !self.isa.objj_msgSend0(self, "canBecomeMainWindow"))
        return;
    ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "resignMainWindow"));
    self.isa.objj_msgSend0(self, "becomeMainWindow");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("becomeMainWindow"), function $CPWindow__becomeMainWindow(self, _cmd)
{
    CPApp._mainWindow = self;
    self.isa.objj_msgSend0(self, "_synchronizeSaveMenuWithDocumentSaving");
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "noteMainWindowStateChanged"));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowDidBecomeMainNotification, self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("resignMainWindow"), function $CPWindow__resignMainWindow(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowDidResignMainNotification, self));
    if (CPApp._mainWindow === self)
        CPApp._mainWindow = nil;
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "noteMainWindowStateChanged"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_updateMainAndKeyWindows"), function $CPWindow___updateMainAndKeyWindows(self, _cmd)
{
    var allWindows = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "orderedWindows")),
        windowCount = (allWindows == null ? null : allWindows.isa.objj_msgSend0(allWindows, "count"));
    if (self.isa.objj_msgSend0(self, "isKeyWindow"))
    {
        var keyWindow = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "keyWindow"));
        self.isa.objj_msgSend0(self, "resignKeyWindow");
        if (keyWindow && keyWindow !== self && (keyWindow == null ? null : keyWindow.isa.objj_msgSend0(keyWindow, "canBecomeKeyWindow")))
            (keyWindow == null ? null : keyWindow.isa.objj_msgSend0(keyWindow, "makeKeyWindow"));
        else
        {
            var mainMenu = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")),
                menuBarClass = objj_getClass("_CPMenuBarWindow"),
                menuWindow;
            for (var i = 0; i < windowCount; i++)
            {
                var currentWindow = allWindows[i];
                if ((currentWindow == null ? null : currentWindow.isa.objj_msgSend1(currentWindow, "isKindOfClass:", menuBarClass)))
                    menuWindow = currentWindow;
                if (currentWindow === self || currentWindow === menuWindow)
                    continue;
                if ((currentWindow == null ? null : currentWindow.isa.objj_msgSend0(currentWindow, "isVisible")) && (currentWindow == null ? null : currentWindow.isa.objj_msgSend0(currentWindow, "canBecomeKeyWindow")))
                {
                    (currentWindow == null ? null : currentWindow.isa.objj_msgSend0(currentWindow, "makeKeyWindow"));
                    break;
                }
            }
            if (!(CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "keyWindow")))
                (menuWindow == null ? null : menuWindow.isa.objj_msgSend0(menuWindow, "makeKeyWindow"));
        }
    }
    if (self.isa.objj_msgSend0(self, "isMainWindow"))
    {
        var mainWindow = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainWindow"));
        self.isa.objj_msgSend0(self, "resignMainWindow");
        if (mainWindow && mainWindow !== self && (mainWindow == null ? null : mainWindow.isa.objj_msgSend0(mainWindow, "canBecomeMainWindow")))
            (mainWindow == null ? null : mainWindow.isa.objj_msgSend0(mainWindow, "makeMainWindow"));
        else
        {
            var mainMenu = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu")),
                menuBarClass = objj_getClass("_CPMenuBarWindow"),
                menuWindow;
            for (var i = 0; i < windowCount; i++)
            {
                var currentWindow = allWindows[i];
                if ((currentWindow == null ? null : currentWindow.isa.objj_msgSend1(currentWindow, "isKindOfClass:", menuBarClass)))
                    menuWindow = currentWindow;
                if (currentWindow === self || currentWindow === menuWindow)
                    continue;
                if ((currentWindow == null ? null : currentWindow.isa.objj_msgSend0(currentWindow, "isVisible")) && (currentWindow == null ? null : currentWindow.isa.objj_msgSend0(currentWindow, "canBecomeMainWindow")))
                {
                    (currentWindow == null ? null : currentWindow.isa.objj_msgSend0(currentWindow, "makeMainWindow"));
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
    ((___r1 = (aToolbar == null ? null : aToolbar.isa.objj_msgSend0(aToolbar, "_window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setToolbar:", nil));
    ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setWindow:", nil));
    self._toolbar = aToolbar;
    ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setWindow:", self));
    self.isa.objj_msgSend0(self, "_noteToolbarChanged");
    var ___r1;
}
,["void","CPToolbar"]), new objj_method(sel_getUid("toggleToolbarShown:"), function $CPWindow__toggleToolbarShown_(self, _cmd, aSender)
{
    var toolbar = self.isa.objj_msgSend0(self, "toolbar");
    (toolbar == null ? null : toolbar.isa.objj_msgSend1(toolbar, "setVisible:", !(toolbar == null ? null : toolbar.isa.objj_msgSend0(toolbar, "isVisible"))));
}
,["void","id"]), new objj_method(sel_getUid("_noteToolbarChanged"), function $CPWindow___noteToolbarChanged(self, _cmd)
{
    var frame = CGRectMakeCopy(self.isa.objj_msgSend0(self, "frame")),
        newFrame;
    ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "noteToolbarChanged"));
    if (self._isFullPlatformWindow)
        newFrame = ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame"));
    else
    {
        newFrame = CGRectMakeCopy(self.isa.objj_msgSend0(self, "frame"));
        newFrame.origin = frame.origin;
    }
    self.isa.objj_msgSend1(self, "setFrame:", newFrame);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("childWindows"), function $CPWindow__childWindows(self, _cmd)
{
    return self._childWindows;
}
,["CPArray"]), new objj_method(sel_getUid("addChildWindow:ordered:"), function $CPWindow__addChildWindow_ordered_(self, _cmd, childWindow, orderingMode)
{
    if (((___r1 = self._childWindows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", childWindow)) >= 0)
        return;
    if (orderingMode === CPWindowAbove || orderingMode === CPWindowBelow)
        ((___r1 = self._childWindows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", childWindow));
    else
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, _cmd + " unrecognized ordering mode " + orderingMode);
    (childWindow == null ? null : childWindow.isa.objj_msgSend1(childWindow, "setParentWindow:", self));
    (childWindow == null ? null : childWindow.isa.objj_msgSend1(childWindow, "_setChildOrdering:", orderingMode));
    (childWindow == null ? null : childWindow.isa.objj_msgSend1(childWindow, "setLevel:", self.isa.objj_msgSend0(self, "level")));
    if (self.isa.objj_msgSend0(self, "isVisible") && !(childWindow == null ? null : childWindow.isa.objj_msgSend0(childWindow, "isVisible")))
        (childWindow == null ? null : childWindow.isa.objj_msgSend2(childWindow, "orderWindow:relativeTo:", orderingMode, self._windowNumber));
    var ___r1;
}
,["void","CPWindow","CPWindowOrderingMode"]), new objj_method(sel_getUid("removeChildWindow:"), function $CPWindow__removeChildWindow_(self, _cmd, childWindow)
{
    var index = ((___r1 = self._childWindows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", childWindow));
    if (index === CPNotFound)
        return;
    ((___r1 = self._childWindows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", index));
    (childWindow == null ? null : childWindow.isa.objj_msgSend1(childWindow, "setParentWindow:", nil));
    var ___r1;
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
    return ((___r1 = self._parentWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_hasAncestorWindow:", anAncestor));
    var ___r1;
}
,["BOOL","CPWindow"]), new objj_method(sel_getUid("setParentWindow:"), function $CPWindow__setParentWindow_(self, _cmd, parentWindow)
{
    self._parentWindow = parentWindow;
}
,["CPWindow","CPWindow"]), new objj_method(sel_getUid("_setFrame:delegate:duration:curve:"), function $CPWindow___setFrame_delegate_duration_curve_(self, _cmd, aFrame, delegate, duration, curve)
{
    ((___r1 = self._frameAnimation), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "stopAnimation"));
    self._frameAnimation = ((___r1 = (_CPWindowFrameAnimation == null ? null : _CPWindowFrameAnimation.isa.objj_msgSend0(_CPWindowFrameAnimation, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithWindow:targetFrame:", self, aFrame));
    ((___r1 = self._frameAnimation), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", delegate));
    ((___r1 = self._frameAnimation), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAnimationCurve:", curve));
    ((___r1 = self._frameAnimation), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDuration:", duration));
    ((___r1 = self._frameAnimation), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "startAnimation"));
    var ___r1;
}
,["void","CGRect","id","int","CPAnimationCurve"]), new objj_method(sel_getUid("animationResizeTime:"), function $CPWindow__animationResizeTime_(self, _cmd, newWindowFrame)
{
    return CPWindowResizeTime;
}
,["CPTimeInterval","CGRect"]), new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"), function $CPWindow___setAttachedSheetFrameOrigin(self, _cmd)
{
    var attachedSheet = self.isa.objj_msgSend0(self, "attachedSheet"),
        contentRect = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        sheetFrame = CGRectMakeCopy((attachedSheet == null ? null : attachedSheet.isa.objj_msgSend0(attachedSheet, "frame")));
    sheetFrame.origin.y = CGRectGetMinY(self._frame) + CGRectGetMinY(contentRect);
    sheetFrame.origin.x = CGRectGetMinX(self._frame) + FLOOR((CGRectGetWidth(self._frame) - CGRectGetWidth(sheetFrame)) / 2.0);
    (attachedSheet == null ? null : attachedSheet.isa.objj_msgSend3(attachedSheet, "setFrame:display:animate:", sheetFrame, YES, NO));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"), function $CPWindow___attachSheet_modalDelegate_didEndSelector_contextInfo_(self, _cmd, aSheet, aModalDelegate, didEndSelector, contextInfo)
{
    if (self._sheetContext)
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "The target window of beginSheet: already has a sheet, did you forget orderOut: ?");
        return;
    }
    self._sheetContext = {"sheet": aSheet, "modalDelegate": aModalDelegate, "endSelector": didEndSelector, "contextInfo": contextInfo, "returnCode": -1, "opened": NO, "isAttached": YES, "savedConstrains": aSheet._constrainsToUsableScreen};
    aSheet._constrainsToUsableScreen = NO;
    CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("_sheetShouldAnimateIn:"), nil, NO);
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
    CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("_sheetShouldAnimateOut:"), nil, NO);
}
,["void"]), new objj_method(sel_getUid("_cleanupSheetWindow"), function $CPWindow___cleanupSheetWindow(self, _cmd)
{
    var sheet = self._sheetContext["sheet"],
        deferDidEnd = self._sheetContext["deferDidEndSelector"];
    if (sheet._isModal)
        (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "stopModal"));
    self.isa.objj_msgSend1(self, "_removeClipForSheet:", sheet);
    sheet._isSheet = NO;
    ((___r1 = sheet._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_enableSheet:inWindow:", NO, self));
    sheet._constrainsToUsableScreen = self._sheetContext["savedConstrains"];
    (sheet == null ? null : sheet.isa.objj_msgSend1(sheet, "orderOut:", self));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowDidEndSheetNotification, self));
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
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("animationDidEnd:"), function $CPWindow__animationDidEnd_(self, _cmd, anim)
{
    var sheet = self._sheetContext["sheet"];
    if (anim._window != sheet)
        return;
    CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("_sheetAnimationDidEnd:"), nil, NO);
}
,["void","id"]), new objj_method(sel_getUid("_sheetShouldAnimateIn:"), function $CPWindow___sheetShouldAnimateIn_(self, _cmd, timer)
{
    if (self._sheetContext["isOpening"] || self._sheetContext["isClosing"])
        return;
    var sheet = self._sheetContext["sheet"];
    sheet._isSheet = YES;
    sheet._parentView = self;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowWillBeginSheetNotification, self));
    sheet._isModal = NO;
    if ((CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "modalWindow")) === self)
    {
        (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "runModalForWindow:", sheet));
        sheet._isModal = YES;
    }
    var sheetFrame = (sheet == null ? null : sheet.isa.objj_msgSend0(sheet, "frame")),
        sheetShadowFrame = sheet._hasShadow ? ((___r1 = sheet._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")) : sheetFrame,
        frame = self.isa.objj_msgSend0(self, "frame"),
        originX = frame.origin.x + FLOOR((frame.size.width - sheetFrame.size.width) / 2),
        startFrame = CGRectMake(originX, -sheetShadowFrame.size.height, sheetFrame.size.width, sheetFrame.size.height),
        endY = -1 + ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bodyOffset")) - ((___r1 = self.isa.objj_msgSend0(self, "contentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).origin.y,
        endFrame = CGRectMake(originX, endY, sheetFrame.size.width, sheetFrame.size.height);
    if (self._toolbar && ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "showsToolbar")) && self.isa.objj_msgSend0(self, "isFullPlatformWindow"))
    {
        endY += ((___r1 = ((___r2 = self._toolbar), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_toolbarView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height;
        endFrame = CGRectMake(originX, endY, sheetFrame.size.width, sheetFrame.size.height);
    }
    (sheet == null ? null : sheet.isa.objj_msgSend1(sheet, "setFrameOrigin:", CGPointMake(0, -13000)));
    (sheet == null ? null : sheet.isa.objj_msgSend1(sheet, "orderFront:", self));
    self.isa.objj_msgSend1(self, "_clipSheet:", sheet);
    (sheet == null ? null : sheet.isa.objj_msgSend3(sheet, "setFrame:display:animate:", startFrame, YES, NO));
    self._sheetContext["opened"] = YES;
    self._sheetContext["shouldClose"] = NO;
    self._sheetContext["isOpening"] = YES;
    (sheet == null ? null : sheet.isa.objj_msgSend(sheet, "_setFrame:delegate:duration:curve:", endFrame, self, self.isa.objj_msgSend1(self, "animationResizeTime:", endFrame), CPAnimationEaseOut));
    var ___r1, ___r2;
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
    if (self.isa.objj_msgSend0(self, "isVisible"))
    {
        var sheet = self._sheetContext["sheet"],
            sheetFrame = (sheet == null ? null : sheet.isa.objj_msgSend0(sheet, "frame")),
            fullHeight = sheet._hasShadow ? ((___r1 = sheet._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size.height : sheetFrame.size.height,
            endFrame = CGRectMakeCopy(sheetFrame),
            contentOrigin = self.isa.objj_msgSend1(self, "convertBaseToGlobal:", ((___r1 = self.isa.objj_msgSend0(self, "contentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).origin);
        sheet._constrainsToUsableScreen = NO;
        (sheet == null ? null : sheet.isa.objj_msgSend1(sheet, "setFrameOrigin:", CGPointMake(sheetFrame.origin.x, sheetFrame.origin.y - contentOrigin.y)));
        self.isa.objj_msgSend1(self, "_clipSheet:", sheet);
        endFrame.origin.y = -fullHeight;
        (sheet == null ? null : sheet.isa.objj_msgSend(sheet, "_setFrame:delegate:duration:curve:", endFrame, self, self.isa.objj_msgSend1(self, "animationResizeTime:", endFrame), CPAnimationEaseIn));
    }
    else
    {
        self.isa.objj_msgSend1(self, "_sheetAnimationDidEnd:", nil);
    }
    var ___r1;
}
,["void","CPTimer"]), new objj_method(sel_getUid("_sheetAnimationDidEnd:"), function $CPWindow___sheetAnimationDidEnd_(self, _cmd, timer)
{
    var sheet = self._sheetContext["sheet"];
    self._sheetContext["isOpening"] = NO;
    self._sheetContext["isClosing"] = NO;
    if (self._sheetContext["opened"] === YES)
    {
        var sheetFrame = (sheet == null ? null : sheet.isa.objj_msgSend0(sheet, "frame")),
            sheetOrigin = CGPointMakeCopy(sheetFrame.origin);
        self.isa.objj_msgSend1(self, "_removeClipForSheet:", sheet);
        (sheet == null ? null : sheet.isa.objj_msgSend1(sheet, "setFrameOrigin:", CGPointMake(sheetOrigin.x, (sheet == null ? null : sheet.isa.objj_msgSend0(sheet, "frame")).origin.y + sheetOrigin.y)));
        if (self._sheetContext["shouldClose"] === YES)
            self.isa.objj_msgSend0(self, "_detachSheetWindow");
        else
            (sheet == null ? null : sheet.isa.objj_msgSend0(sheet, "makeKeyWindow"));
    }
    else
    {
        self.isa.objj_msgSend0(self, "_cleanupSheetWindow");
    }
}
,["void","CPTimer"]), new objj_method(sel_getUid("_clipSheet:"), function $CPWindow___clipSheet_(self, _cmd, aSheet)
{
    var clipRect = ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentBounds"));
    clipRect.origin.y = self.isa.objj_msgSend0(self, "frame").origin.y + ((___r1 = self.isa.objj_msgSend0(self, "contentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).origin.y;
    ((___r1 = ((___r2 = self._platformWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "layerAtLevel:create:", self._level, NO))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "clipWindow:toRect:", aSheet, clipRect));
    var ___r1, ___r2;
}
,["void","CPWindow"]), new objj_method(sel_getUid("_removeClipForSheet:"), function $CPWindow___removeClipForSheet_(self, _cmd, aSheet)
{
    ((___r1 = ((___r2 = self._platformWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "layerAtLevel:create:", self._level, NO))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeClipForWindow:", aSheet));
    var ___r1, ___r2;
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
    return ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performKeyEquivalent:", anEvent));
    var ___r1;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("keyDown:"), function $CPWindow__keyDown_(self, _cmd, anEvent)
{
    if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "_couldBeKeyEquivalent")) && self.isa.objj_msgSend1(self, "performKeyEquivalent:", anEvent))
        return;
    if (!self.isa.objj_msgSend1(self, "_processKeyboardUIKey:", anEvent))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow").super_class }, "keyDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_processKeyboardUIKey:"), function $CPWindow___processKeyboardUIKey_(self, _cmd, anEvent)
{
    var character = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers"));
    if (!(CPWindowActionMessageKeys == null ? null : CPWindowActionMessageKeys.isa.objj_msgSend1(CPWindowActionMessageKeys, "containsObject:", character)))
        return NO;
    var selectors = CPKeyBinding.isa.objj_msgSend2(CPKeyBinding, "selectorsForKey:modifierFlags:", character, 0);
    if ((selectors == null ? null : selectors.isa.objj_msgSend0(selectors, "count")) <= 0)
        return NO;
    var selector = (selectors == null ? null : selectors.isa.objj_msgSend1(selectors, "objectAtIndex:", 0));
    return ((___r1 = self.isa.objj_msgSend0(self, "firstResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tryToPerform:with:", selector, self));
    var ___r1;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("_dirtyKeyViewLoop"), function $CPWindow___dirtyKeyViewLoop(self, _cmd)
{
    if (self._autorecalculatesKeyViewLoop)
        self._keyViewLoopIsDirty = YES;
}
,["void"]), new objj_method(sel_getUid("_hasKeyViewLoop:"), function $CPWindow___hasKeyViewLoop_(self, _cmd, theViews)
{
    var i,
        count = (theViews == null ? null : theViews.isa.objj_msgSend0(theViews, "count"));
    for (i = 0; i < count; ++i)
    {
        var view = theViews[i];
        if ((view == null ? null : view.isa.objj_msgSend0(view, "nextKeyView")) || (view == null ? null : view.isa.objj_msgSend0(view, "previousKeyView")))
            return YES;
    }
    for (i = 0; i < count; ++i)
    {
        var subviews = ((___r1 = theViews[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "subviews"));
        if ((subviews == null ? null : subviews.isa.objj_msgSend0(subviews, "count")) && self.isa.objj_msgSend1(self, "_hasKeyViewLoop:", subviews))
            return YES;
    }
    return NO;
    var ___r1;
}
,["BOOL","CPArray"]), new objj_method(sel_getUid("recalculateKeyViewLoop"), function $CPWindow__recalculateKeyViewLoop(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_doRecalculateKeyViewLoop");
}
,["void"]), new objj_method(sel_getUid("_viewsSortedByPosition"), function $CPWindow___viewsSortedByPosition(self, _cmd)
{
    var views = CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", self._contentView);
    views = views.concat(self.isa.objj_msgSend1(self, "_subviewsSortedByPosition:", ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "subviews"))));
    return views;
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("_subviewsSortedByPosition:"), function $CPWindow___subviewsSortedByPosition_(self, _cmd, theSubviews)
{
    theSubviews = (theSubviews == null ? null : theSubviews.isa.objj_msgSend0(theSubviews, "copy"));
    (theSubviews == null ? null : theSubviews.isa.objj_msgSend2(theSubviews, "sortUsingFunction:context:", keyViewComparator, nil));
    var sortedViews = [];
    for (var i = 0, count = (theSubviews == null ? null : theSubviews.isa.objj_msgSend0(theSubviews, "count")); i < count; ++i)
    {
        var view = theSubviews[i],
            subviews = (view == null ? null : view.isa.objj_msgSend0(view, "subviews"));
        sortedViews.push(view);
        if ((subviews == null ? null : subviews.isa.objj_msgSend0(subviews, "count")))
            sortedViews = sortedViews.concat(self.isa.objj_msgSend1(self, "_subviewsSortedByPosition:", subviews));
    }
    return sortedViews;
}
,["CPArray","CPArray"]), new objj_method(sel_getUid("_doRecalculateKeyViewLoop"), function $CPWindow___doRecalculateKeyViewLoop(self, _cmd)
{
    var views = self.isa.objj_msgSend0(self, "_viewsSortedByPosition");
    for (var index = 0, count = (views == null ? null : views.isa.objj_msgSend0(views, "count")); index < count; ++index)
        ((___r1 = views[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", views[(index + 1) % count]));
    self._keyViewLoopIsDirty = NO;
    var ___r1;
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
        self.isa.objj_msgSend0(self, "_doRecalculateKeyViewLoop");
    var nextValidKeyView = nil;
    if (((___r1 = self._firstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))))
        nextValidKeyView = ((___r1 = self._firstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "nextValidKeyView"));
    if (!nextValidKeyView)
    {
        if (((___r1 = self._initialFirstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "acceptsFirstResponder")))
            nextValidKeyView = self._initialFirstResponder;
        else
            nextValidKeyView = ((___r1 = self._initialFirstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "nextValidKeyView"));
    }
    if (nextValidKeyView)
        self.isa.objj_msgSend1(self, "makeFirstResponder:", nextValidKeyView);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("selectPreviousKeyView:"), function $CPWindow__selectPreviousKeyView_(self, _cmd, sender)
{
    if (self._keyViewLoopIsDirty)
        self.isa.objj_msgSend0(self, "_doRecalculateKeyViewLoop");
    var previousValidKeyView = nil;
    if (((___r1 = self._firstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))))
        previousValidKeyView = ((___r1 = self._firstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "previousValidKeyView"));
    if (!previousValidKeyView)
    {
        if (((___r1 = self._initialFirstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "acceptsFirstResponder")))
            previousValidKeyView = self._initialFirstResponder;
        else
            previousValidKeyView = ((___r1 = self._initialFirstResponder), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "previousValidKeyView"));
    }
    if (previousValidKeyView)
        self.isa.objj_msgSend1(self, "makeFirstResponder:", previousValidKeyView);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("selectKeyViewFollowingView:"), function $CPWindow__selectKeyViewFollowingView_(self, _cmd, aView)
{
    if (self._keyViewLoopIsDirty)
        self.isa.objj_msgSend0(self, "_doRecalculateKeyViewLoop");
    var nextValidKeyView = (aView == null ? null : aView.isa.objj_msgSend0(aView, "nextValidKeyView"));
    if ((nextValidKeyView == null ? null : nextValidKeyView.isa.objj_msgSend1(nextValidKeyView, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))))
        self.isa.objj_msgSend1(self, "makeFirstResponder:", nextValidKeyView);
}
,["void","CPView"]), new objj_method(sel_getUid("selectKeyViewPrecedingView:"), function $CPWindow__selectKeyViewPrecedingView_(self, _cmd, aView)
{
    if (self._keyViewLoopIsDirty)
        self.isa.objj_msgSend0(self, "_doRecalculateKeyViewLoop");
    var previousValidKeyView = (aView == null ? null : aView.isa.objj_msgSend0(aView, "previousValidKeyView"));
    if ((previousValidKeyView == null ? null : previousValidKeyView.isa.objj_msgSend1(previousValidKeyView, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))))
        self.isa.objj_msgSend1(self, "makeFirstResponder:", previousValidKeyView);
}
,["void","CPView"]), new objj_method(sel_getUid("setDefaultButtonCell:"), function $CPWindow__setDefaultButtonCell_(self, _cmd, aButton)
{
    self.isa.objj_msgSend1(self, "setDefaultButton:", aButton);
}
,["void","CPButton"]), new objj_method(sel_getUid("defaultButtonCell"), function $CPWindow__defaultButtonCell(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "defaultButton");
}
,["CPButton"]), new objj_method(sel_getUid("setDefaultButton:"), function $CPWindow__setDefaultButton_(self, _cmd, aButton)
{
    if (self._defaultButton === aButton)
        return;
    if (((___r1 = self._defaultButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyEquivalent")) === CPCarriageReturnCharacter)
        ((___r1 = self._defaultButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setKeyEquivalent:", nil));
    self._defaultButton = aButton;
    if (((___r1 = self._defaultButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "keyEquivalent")) !== CPCarriageReturnCharacter)
        ((___r1 = self._defaultButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setKeyEquivalent:", CPCarriageReturnCharacter));
    var ___r1;
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
    self.isa.objj_msgSend0(self, "enableKeyEquivalentForDefaultButton");
}
,["void"]), new objj_method(sel_getUid("disableKeyEquivalentForDefaultButton"), function $CPWindow__disableKeyEquivalentForDefaultButton(self, _cmd)
{
    self._defaultButtonEnabled = NO;
}
,["void"]), new objj_method(sel_getUid("disableKeyEquivalentForDefaultButtonCell"), function $CPWindow__disableKeyEquivalentForDefaultButtonCell(self, _cmd)
{
    self.isa.objj_msgSend0(self, "disableKeyEquivalentForDefaultButton");
}
,["void"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPWindow__setValue_forKey_(self, _cmd, aValue, aKey)
{
    if (aKey === CPDisplayPatternTitleBinding)
        self.isa.objj_msgSend1(self, "setTitle:", aValue || "");
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow").super_class }, "setValue:forKey:", aValue, aKey);
}
,["void","id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPWindow___binderClassForBinding_(self, _cmd, aBinding)
{
    if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPDisplayPatternTitleBinding)))
        return CPTitleWithPatternBinding.isa.objj_msgSend0(CPTitleWithPatternBinding, "class");
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
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "_windowViewClassForStyleMask:", aStyleMask))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "frameRectForContentRect:", aContentRect));
    var ___r1, ___r2;
}
,["CGRect","CGRect","unsigned"]), new objj_method(sel_getUid("setGlobalResizeStyle:"), function $CPWindow__setGlobalResizeStyle_(self, _cmd, aStyle)
{
    if (CPWindowResizeStyle === aStyle)
        return;
    CPWindowResizeStyle = aStyle;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPWindowResizeStyleGlobalChangeNotification, nil));
    var ___r1;
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
    var lhsBounds = (lhs == null ? null : lhs.isa.objj_msgSend2(lhs, "convertRect:toView:", (lhs == null ? null : lhs.isa.objj_msgSend0(lhs, "bounds")), nil)),
        rhsBounds = (rhs == null ? null : rhs.isa.objj_msgSend2(rhs, "convertRect:toView:", (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "bounds")), nil)),
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
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "windowShouldClose:", self));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateWindowWillReturnUndoManager"), function $CPWindow___sendDelegateWindowWillReturnUndoManager(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPWindowDelegate_windowWillReturnUndoManager_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "windowWillReturnUndoManager:", self));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateWindowWillClose"), function $CPWindow___sendDelegateWindowWillClose(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPWindowDelegate_windowWillClose_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "windowWillClose:", self));
    var ___r1;
}
,["void"])]);
}{
var the_class = objj_getClass("CPWindow")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"), function $CPWindow__resizeWithOldPlatformWindowSize_(self, _cmd, aSize)
{
    if (self.isa.objj_msgSend0(self, "isFullPlatformWindow"))
        return self.isa.objj_msgSend1(self, "setFrame:", ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame")));
    if (self._constrainsToUsableScreen && !CPWindowConstrainToScreen || self._autoresizingMask === CPWindowNotSizable)
        return;
    var frame = ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentBounds")),
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
    self.isa.objj_msgSend(self, "_setFrame:display:animate:constrainWidth:constrainHeight:", newFrame, YES, NO, YES, YES);
    var ___r1;
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
    return CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser") ? self.isa.objj_msgSend1(self, "convertBaseToPlatformWindow:", aPoint) : self.isa.objj_msgSend1(self, "convertBaseToScreen:", aPoint);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertGlobalToBase:"), function $CPWindow__convertGlobalToBase_(self, _cmd, aPoint)
{
    return CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser") ? self.isa.objj_msgSend1(self, "convertPlatformWindowToBase:", aPoint) : self.isa.objj_msgSend1(self, "convertScreenToBase:", aPoint);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertBaseToPlatformWindow:"), function $CPWindow__convertBaseToPlatformWindow_(self, _cmd, aPoint)
{
    if (self.isa.objj_msgSend0(self, "_sharesChromeWithPlatformWindow"))
        return CGPointMakeCopy(aPoint);
    var origin = self.isa.objj_msgSend0(self, "frame").origin;
    return CGPointMake(aPoint.x + origin.x, aPoint.y + origin.y);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertPlatformWindowToBase:"), function $CPWindow__convertPlatformWindowToBase_(self, _cmd, aPoint)
{
    if (self.isa.objj_msgSend0(self, "_sharesChromeWithPlatformWindow"))
        return CGPointMakeCopy(aPoint);
    var origin = self.isa.objj_msgSend0(self, "frame").origin;
    return CGPointMake(aPoint.x - origin.x, aPoint.y - origin.y);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertScreenToBase:"), function $CPWindow__convertScreenToBase_(self, _cmd, aPoint)
{
    return self.isa.objj_msgSend1(self, "convertPlatformWindowToBase:", ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertScreenToBase:", aPoint)));
    var ___r1;
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertBaseToScreen:"), function $CPWindow__convertBaseToScreen_(self, _cmd, aPoint)
{
    return ((___r1 = self._platformWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertBaseToScreen:", self.isa.objj_msgSend1(self, "convertBaseToPlatformWindow:", aPoint)));
    var ___r1;
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("_setSharesChromeWithPlatformWindow:"), function $CPWindow___setSharesChromeWithPlatformWindow_(self, _cmd, shouldShareFrameWithPlatformWindow)
{
    if (shouldShareFrameWithPlatformWindow && CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
        return;
    self._sharesChromeWithPlatformWindow = shouldShareFrameWithPlatformWindow;
    self.isa.objj_msgSend0(self, "_updateShadow");
}
,["void","BOOL"]), new objj_method(sel_getUid("_sharesChromeWithPlatformWindow"), function $CPWindow___sharesChromeWithPlatformWindow(self, _cmd)
{
    return self._sharesChromeWithPlatformWindow;
}
,["BOOL"]), new objj_method(sel_getUid("undoManager"), function $CPWindow__undoManager(self, _cmd)
{
    if (self._undoManager)
        return self._undoManager;
    var documentUndoManager = ((___r1 = ((___r2 = self._windowController), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "document"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "undoManager"));
    if (documentUndoManager)
        return documentUndoManager;
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToWindowWillUndoManager"))
        return self.isa.objj_msgSend0(self, "_sendDelegateWindowWillReturnUndoManager");
    if (!self._undoManager)
        self._undoManager = ((___r1 = CPUndoManager.isa.objj_msgSend0(CPUndoManager, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return self._undoManager;
    var ___r1, ___r2;
}
,["CPUndoManager"]), new objj_method(sel_getUid("undo:"), function $CPWindow__undo_(self, _cmd, aSender)
{
    ((___r1 = self.isa.objj_msgSend0(self, "undoManager")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "undo"));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("redo:"), function $CPWindow__redo_(self, _cmd, aSender)
{
    ((___r1 = self.isa.objj_msgSend0(self, "undoManager")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "redo"));
    var ___r1;
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
    _CPReportLenientDeprecation(self.isa.objj_msgSend0(self, "class"), _cmd, sel_getUid("setFullPlatformWindow:"));
    self.isa.objj_msgSend1(self, "setFullPlatformWindow:", shouldBeFullBridge);
}
,["void","BOOL"]), new objj_method(sel_getUid("isFullBridge"), function $CPWindow__isFullBridge(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "isFullPlatformWindow");
}
,["BOOL"]), new objj_method(sel_getUid("convertBaseToBridge:"), function $CPWindow__convertBaseToBridge_(self, _cmd, aPoint)
{
    return self.isa.objj_msgSend1(self, "convertBaseToPlatformWindow:", aPoint);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertBridgeToBase:"), function $CPWindow__convertBridgeToBase_(self, _cmd, aPoint)
{
    return self.isa.objj_msgSend1(self, "convertPlatformWindowToBase:", aPoint);
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
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowFrameAnimation").super_class }, "initWithDuration:animationCurve:", (aWindow == null ? null : aWindow.isa.objj_msgSend1(aWindow, "animationResizeTime:", aTargetFrame)), CPAnimationLinear);
    if (self)
    {
        self._window = aWindow;
        self._targetFrame = CGRectMakeCopy(aTargetFrame);
        self._startFrame = CGRectMakeCopy(((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
    }
    return self;
    var ___r1;
}
,["id","CPWindow","CGRect"]), new objj_method(sel_getUid("startAnimation"), function $_CPWindowFrameAnimation__startAnimation(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowFrameAnimation").super_class }, "startAnimation");
    self._window._isAnimating = YES;
}
,["void"]), new objj_method(sel_getUid("setCurrentProgress:"), function $_CPWindowFrameAnimation__setCurrentProgress_(self, _cmd, aProgress)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowFrameAnimation").super_class }, "setCurrentProgress:", aProgress);
    var value = self.isa.objj_msgSend0(self, "currentValue");
    if (value == 1.0)
        self._window._isAnimating = NO;
    var newFrame = CGRectMake(interpolate(CGRectGetMinX(self._startFrame), CGRectGetMinX(self._targetFrame), value), interpolate(CGRectGetMinY(self._startFrame), CGRectGetMinY(self._targetFrame), value), interpolate(CGRectGetWidth(self._startFrame), CGRectGetWidth(self._targetFrame), value), interpolate(CGRectGetHeight(self._startFrame), CGRectGetHeight(self._targetFrame), value));
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setFrame:display:animate:", newFrame, YES, NO));
    var ___r1;
}
,["void","float"])]);
}{
var the_class = objj_getClass("CPWindow")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_dragHitTest:pasteboard:"), function $CPWindow___dragHitTest_pasteboard_(self, _cmd, aPoint, aPasteboard)
{
    if (!self._inclusiveRegisteredDraggedTypes)
        return nil;
    var adjustedPoint = self.isa.objj_msgSend1(self, "convertPlatformWindowToBase:", aPoint),
        hitView = ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "hitTest:", adjustedPoint));
    while (hitView && !(aPasteboard == null ? null : aPasteboard.isa.objj_msgSend1(aPasteboard, "availableTypeFromArray:", (hitView == null ? null : hitView.isa.objj_msgSend0(hitView, "registeredDraggedTypes")))))
        hitView = (hitView == null ? null : hitView.isa.objj_msgSend0(hitView, "superview"));
    if (hitView)
        return hitView;
    if ((aPasteboard == null ? null : aPasteboard.isa.objj_msgSend1(aPasteboard, "availableTypeFromArray:", self.isa.objj_msgSend0(self, "registeredDraggedTypes"))))
        return self;
    return nil;
    var ___r1;
}
,["id","CGPoint","CPPasteboard"])]);
}_CPWindowFullPlatformWindowSessionMake = function(aWindowView, aContentRect, hasShadow, aLevel)
{
    return {windowView: aWindowView, contentRect: aContentRect, hasShadow: hasShadow, level: aLevel};
}
