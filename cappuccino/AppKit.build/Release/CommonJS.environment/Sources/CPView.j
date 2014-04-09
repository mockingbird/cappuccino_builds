@STATIC;1.0;I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.jI;18;Foundation/CPSet.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.ji;20;CPWindow_Constants.ji;18;_CPDisplayServer.jt;80685;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPObjJRuntime.j", NO);objj_executeFile("Foundation/CPSet.j", NO);objj_executeFile("CGAffineTransform.j", YES);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPColor.j", YES);objj_executeFile("CPGraphicsContext.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPTheme.j", YES);objj_executeFile("CPWindow_Constants.j", YES);objj_executeFile("_CPDisplayServer.j", YES);CPViewNotSizable = 0;
CPViewMinXMargin = 1;
CPViewWidthSizable = 2;
CPViewMaxXMargin = 4;
CPViewMinYMargin = 8;
CPViewHeightSizable = 16;
CPViewMaxYMargin = 32;
CPViewBoundsDidChangeNotification = "CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification = "CPViewFrameDidChangeNotification";
var CachedNotificationCenter = nil,
    CachedThemeAttributes = nil;
var CPViewFlags = {},
    CPViewHasCustomDrawRect = 1 << 0,
    CPViewHasCustomLayoutSubviews = 1 << 1;
{var the_class = objj_allocateClassPair(CPResponder, "CPView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_superview"), new objj_ivar("_subviews"), new objj_ivar("_graphicsContext"), new objj_ivar("_tag"), new objj_ivar("_identifier"), new objj_ivar("_frame"), new objj_ivar("_bounds"), new objj_ivar("_boundsTransform"), new objj_ivar("_inverseBoundsTransform"), new objj_ivar("_registeredDraggedTypes"), new objj_ivar("_registeredDraggedTypesArray"), new objj_ivar("_isHidden"), new objj_ivar("_hitTests"), new objj_ivar("_clipsToBounds"), new objj_ivar("_postsFrameChangedNotifications"), new objj_ivar("_postsBoundsChangedNotifications"), new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"), new objj_ivar("_inLiveResize"), new objj_ivar("_dirtyRect"), new objj_ivar("_opacity"), new objj_ivar("_backgroundColor"), new objj_ivar("_autoresizesSubviews"), new objj_ivar("_autoresizingMask"), new objj_ivar("_layer"), new objj_ivar("_wantsLayer"), new objj_ivar("_isInFullScreenMode"), new objj_ivar("_fullScreenModeState"), new objj_ivar("_isScaled"), new objj_ivar("_hierarchyScaleSize"), new objj_ivar("_scaleSize"), new objj_ivar("_needsLayout"), new objj_ivar("_ephemeralSubviews"), new objj_ivar("_theme"), new objj_ivar("_themeClass"), new objj_ivar("_themeAttributes"), new objj_ivar("_themeState"), new objj_ivar("_ephemeralSubviewsForNames"), new objj_ivar("_ephereralSubviews"), new objj_ivar("_nextKeyView"), new objj_ivar("_previousKeyView"), new objj_ivar("_viewClassFlags"), new objj_ivar("_toolTip"), new objj_ivar("_toolTipFunctionIn"), new objj_ivar("_toolTipFunctionOut"), new objj_ivar("_toolTipInstalled")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("identifier"), function $CPView__identifier(self, _cmd)
{
    return self._identifier;
}
,["CPString"]), new objj_method(sel_getUid("setIdentifier:"), function $CPView__setIdentifier_(self, _cmd, newValue)
{
    self._identifier = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("toolTip"), function $CPView__toolTip(self, _cmd)
{
    return self._toolTip;
}
,["CPString"]), new objj_method(sel_getUid("_setToolTip:"), function $CPView___setToolTip_(self, _cmd, newValue)
{
    self._toolTip = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("_setupViewFlags"), function $CPView___setupViewFlags(self, _cmd)
{
    var theClass = objj_msgSend(self, "class"),
        classUID = objj_msgSend(theClass, "UID");
    if (CPViewFlags[classUID] === undefined)
    {
        var flags = 0;
        if (objj_msgSend(theClass, "instanceMethodForSelector:", sel_getUid("drawRect:")) !== objj_msgSend(CPView, "instanceMethodForSelector:", sel_getUid("drawRect:")))
            flags |= CPViewHasCustomDrawRect;
        if (objj_msgSend(theClass, "instanceMethodForSelector:", sel_getUid("layoutSubviews")) !== objj_msgSend(CPView, "instanceMethodForSelector:", sel_getUid("layoutSubviews")))
            flags |= CPViewHasCustomLayoutSubviews;
        CPViewFlags[classUID] = flags;
    }
    self._viewClassFlags = CPViewFlags[classUID];
}
,["void"]), new objj_method(sel_getUid("_setupToolTipHandlers"), function $CPView___setupToolTipHandlers(self, _cmd)
{
    self._toolTipInstalled = NO;
    self._toolTipFunctionIn = function(e)
    {
        objj_msgSend(_CPToolTip, "scheduleToolTipForView:", self);
    };
    self._toolTipFunctionOut = function(e)
    {
        objj_msgSend(_CPToolTip, "invalidateCurrentToolTipIfNeeded");
    };
}
,["void"]), new objj_method(sel_getUid("init"), function $CPView__init(self, _cmd)
{
    return objj_msgSend(self, "initWithFrame:", CGRectMakeZero());
}
,["id"]), new objj_method(sel_getUid("initWithFrame:"), function $CPView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "init");
    if (self)
    {
        var width = CGRectGetWidth(aFrame),
            height = CGRectGetHeight(aFrame);
        self._subviews = [];
        self._registeredDraggedTypes = objj_msgSend(CPSet, "set");
        self._registeredDraggedTypesArray = [];
        self._tag = -1;
        self._frame = CGRectMakeCopy(aFrame);
        self._bounds = CGRectMake(0.0, 0.0, width, height);
        self._autoresizingMask = CPViewNotSizable;
        self._autoresizesSubviews = YES;
        self._clipsToBounds = YES;
        self._opacity = 1.0;
        self._isHidden = NO;
        self._hitTests = YES;
        self._hierarchyScaleSize = CGSizeMake(1.0, 1.0);
        self._scaleSize = CGSizeMake(1.0, 1.0);
        self._isScaled = NO;
        self._theme = objj_msgSend(CPTheme, "defaultTheme");
        self._themeState = CPThemeStateNormal;
        objj_msgSend(self, "_setupToolTipHandlers");
        objj_msgSend(self, "_setupViewFlags");
        objj_msgSend(self, "_loadThemeAttributes");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setToolTip:"), function $CPView__setToolTip_(self, _cmd, aToolTip)
{
    if (self._toolTip == aToolTip)
        return;
    if (aToolTip && !objj_msgSend(aToolTip, "isKindOfClass:", CPString))
        aToolTip = objj_msgSend(aToolTip, "description");
    self._toolTip = aToolTip;
    if (self._toolTip)
        objj_msgSend(self, "_installToolTipEventHandlers");
    else
        objj_msgSend(self, "_uninstallToolTipEventHandlers");
}
,["void","CPString"]), new objj_method(sel_getUid("_installToolTipEventHandlers"), function $CPView___installToolTipEventHandlers(self, _cmd)
{
    if (self._toolTipInstalled)
        return;
    self._toolTipInstalled = YES;
}
,["void"]), new objj_method(sel_getUid("_uninstallToolTipEventHandlers"), function $CPView___uninstallToolTipEventHandlers(self, _cmd)
{
    if (!self._toolTipInstalled)
        return;
    self._toolTipInstalled = NO;
}
,["void"]), new objj_method(sel_getUid("superview"), function $CPView__superview(self, _cmd)
{
    return self._superview;
}
,["CPView"]), new objj_method(sel_getUid("subviews"), function $CPView__subviews(self, _cmd)
{
    return objj_msgSend(self._subviews, "copy");
}
,["CPArray"]), new objj_method(sel_getUid("window"), function $CPView__window(self, _cmd)
{
    return self._window;
}
,["CPWindow"]), new objj_method(sel_getUid("addSubview:"), function $CPView__addSubview_(self, _cmd, aSubview)
{
    objj_msgSend(self, "_insertSubview:atIndex:", aSubview, CPNotFound);
}
,["void","CPView"]), new objj_method(sel_getUid("addSubview:positioned:relativeTo:"), function $CPView__addSubview_positioned_relativeTo_(self, _cmd, aSubview, anOrderingMode, anotherView)
{
    var index = anotherView ? objj_msgSend(self._subviews, "indexOfObjectIdenticalTo:", anotherView) : CPNotFound;
    if (index === CPNotFound)
        index = anOrderingMode === CPWindowAbove ? objj_msgSend(self._subviews, "count") : 0;
    else if (anOrderingMode === CPWindowAbove)
        ++index;
    objj_msgSend(self, "_insertSubview:atIndex:", aSubview, index);
}
,["void","CPView","CPWindowOrderingMode","CPView"]), new objj_method(sel_getUid("_insertSubview:atIndex:"), function $CPView___insertSubview_atIndex_(self, _cmd, aSubview, anIndex)
{
    if (aSubview === self)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "can't add a view as a subview of itself");
    var count = self._subviews.length;
    objj_msgSend(objj_msgSend(self, "window"), "_dirtyKeyViewLoop");
    if (aSubview._superview == self)
    {
        var index = objj_msgSend(self._subviews, "indexOfObjectIdenticalTo:", aSubview);
        if (index === anIndex || index === count - 1 && anIndex === count)
            return;
        objj_msgSend(self._subviews, "removeObjectAtIndex:", index);
        if (anIndex > index)
            --anIndex;
        --count;
    }
    else
    {
        objj_msgSend(aSubview, "removeFromSuperview");
        objj_msgSend(aSubview, "_setWindow:", self._window);
        objj_msgSend(aSubview, "viewWillMoveToSuperview:", self);
        aSubview._superview = self;
    }
    if (anIndex === CPNotFound || anIndex >= count)
    {
        self._subviews.push(aSubview);
    }
    else
    {
        self._subviews.splice(anIndex, 0, aSubview);
    }
    objj_msgSend(aSubview, "setNextResponder:", self);
    objj_msgSend(aSubview, "_scaleSizeUnitSquareToSize:", objj_msgSend(self, "_hierarchyScaleSize"));
    if (!objj_msgSend(aSubview, "isHidden") && objj_msgSend(self, "isHiddenOrHasHiddenAncestor"))
        objj_msgSend(aSubview, "_notifyViewDidHide");
    objj_msgSend(aSubview, "viewDidMoveToSuperview");
    objj_msgSend(self, "didAddSubview:", aSubview);
}
,["void","CPView","int"]), new objj_method(sel_getUid("didAddSubview:"), function $CPView__didAddSubview_(self, _cmd, aSubview)
{
}
,["void","CPView"]), new objj_method(sel_getUid("removeFromSuperview"), function $CPView__removeFromSuperview(self, _cmd)
{
    if (!self._superview)
        return;
    objj_msgSend(objj_msgSend(self, "window"), "_dirtyKeyViewLoop");
    objj_msgSend(self._superview, "willRemoveSubview:", self);
    objj_msgSend(self._superview._subviews, "removeObjectIdenticalTo:", self);
    if (!self._isHidden && objj_msgSend(self._superview, "isHiddenOrHasHiddenAncestor"))
        objj_msgSend(self, "_notifyViewDidUnhide");
    self._superview = nil;
    objj_msgSend(self, "_setWindow:", nil);
}
,["void"]), new objj_method(sel_getUid("replaceSubview:with:"), function $CPView__replaceSubview_with_(self, _cmd, aSubview, aView)
{
    if (aSubview._superview !== self)
        return;
    var index = objj_msgSend(self._subviews, "indexOfObjectIdenticalTo:", aSubview);
    objj_msgSend(aSubview, "removeFromSuperview");
    objj_msgSend(self, "_insertSubview:atIndex:", aView, index);
}
,["void","CPView","CPView"]), new objj_method(sel_getUid("setSubviews:"), function $CPView__setSubviews_(self, _cmd, newSubviews)
{
    if (!newSubviews)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "newSubviews cannot be nil in -[CPView setSubviews:]");
    if (objj_msgSend(self._subviews, "isEqual:", newSubviews))
        return;
    if (objj_msgSend(self._subviews, "count") === 0)
    {
        var index = 0,
            count = objj_msgSend(newSubviews, "count");
        for (; index < count; ++index)
            objj_msgSend(self, "addSubview:", newSubviews[index]);
        return;
    }
    if (objj_msgSend(newSubviews, "count") === 0)
    {
        var count = objj_msgSend(self._subviews, "count");
        while (count--)
            objj_msgSend(self._subviews[count], "removeFromSuperview");
        return;
    }
    var removedSubviews = objj_msgSend(CPMutableSet, "setWithArray:", self._subviews);
    objj_msgSend(removedSubviews, "removeObjectsInArray:", newSubviews);
    objj_msgSend(removedSubviews, "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview"));
    var addedSubviews = objj_msgSend(CPMutableSet, "setWithArray:", newSubviews);
    objj_msgSend(addedSubviews, "removeObjectsInArray:", self._subviews);
    var addedSubview = nil,
        addedSubviewEnumerator = objj_msgSend(addedSubviews, "objectEnumerator");
    while ((addedSubview = objj_msgSend(addedSubviewEnumerator, "nextObject")) !== nil)
        objj_msgSend(self, "addSubview:", addedSubview);
    if (objj_msgSend(self._subviews, "isEqual:", newSubviews))
        return;
    self._subviews = objj_msgSend(newSubviews, "copy");
}
,["void","CPArray"]), new objj_method(sel_getUid("_setWindow:"), function $CPView___setWindow_(self, _cmd, aWindow)
{
    if (self._window === aWindow)
        return;
    objj_msgSend(objj_msgSend(self, "window"), "_dirtyKeyViewLoop");
    if (objj_msgSend(self._window, "firstResponder") === self)
        objj_msgSend(self._window, "makeFirstResponder:", nil);
    objj_msgSend(self, "viewWillMoveToWindow:", aWindow);
    if (self._registeredDraggedTypes)
    {
        objj_msgSend(self._window, "_noteUnregisteredDraggedTypes:", self._registeredDraggedTypes);
        objj_msgSend(aWindow, "_noteRegisteredDraggedTypes:", self._registeredDraggedTypes);
    }
    self._window = aWindow;
    var count = objj_msgSend(self._subviews, "count");
    while (count--)
        objj_msgSend(self._subviews[count], "_setWindow:", aWindow);
    objj_msgSend(self, "viewDidMoveToWindow");
    objj_msgSend(objj_msgSend(self, "window"), "_dirtyKeyViewLoop");
}
,["void","CPWindow"]), new objj_method(sel_getUid("isDescendantOf:"), function $CPView__isDescendantOf_(self, _cmd, aView)
{
    var view = self;
    do
    {
        if (view == aView)
            return YES;
    }
    while (view = objj_msgSend(view, "superview"));
    return NO;
}
,["BOOL","CPView"]), new objj_method(sel_getUid("viewDidMoveToSuperview"), function $CPView__viewDidMoveToSuperview(self, _cmd)
{
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $CPView__viewDidMoveToWindow(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("viewWillMoveToSuperview:"), function $CPView__viewWillMoveToSuperview_(self, _cmd, aView)
{
}
,["void","CPView"]), new objj_method(sel_getUid("viewWillMoveToWindow:"), function $CPView__viewWillMoveToWindow_(self, _cmd, aWindow)
{
}
,["void","CPWindow"]), new objj_method(sel_getUid("willRemoveSubview:"), function $CPView__willRemoveSubview_(self, _cmd, aView)
{
}
,["void","CPView"]), new objj_method(sel_getUid("enclosingMenuItem"), function $CPView__enclosingMenuItem(self, _cmd)
{
    var view = self;
    while (view && !objj_msgSend(view, "isKindOfClass:", objj_msgSend(_CPMenuItemView, "class")))
        view = objj_msgSend(view, "superview");
    if (view)
        return view._menuItem;
    return nil;
}
,["CPMenuItem"]), new objj_method(sel_getUid("setTag:"), function $CPView__setTag_(self, _cmd, aTag)
{
    self._tag = aTag;
}
,["void","CPInteger"]), new objj_method(sel_getUid("tag"), function $CPView__tag(self, _cmd)
{
    return self._tag;
}
,["CPInteger"]), new objj_method(sel_getUid("viewWithTag:"), function $CPView__viewWithTag_(self, _cmd, aTag)
{
    if (objj_msgSend(self, "tag") == aTag)
        return self;
    var index = 0,
        count = self._subviews.length;
    for (; index < count; ++index)
    {
        var view = objj_msgSend(self._subviews[index], "viewWithTag:", aTag);
        if (view)
            return view;
    }
    return nil;
}
,["CPView","CPInteger"]), new objj_method(sel_getUid("isFlipped"), function $CPView__isFlipped(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("setFrame:"), function $CPView__setFrame_(self, _cmd, aFrame)
{
    if (CGRectEqualToRect(self._frame, aFrame))
        return;
    self._inhibitFrameAndBoundsChangedNotifications = YES;
    objj_msgSend(self, "setFrameOrigin:", aFrame.origin);
    objj_msgSend(self, "setFrameSize:", aFrame.size);
    self._inhibitFrameAndBoundsChangedNotifications = NO;
    if (self._postsFrameChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
,["void","CGRect"]), new objj_method(sel_getUid("frame"), function $CPView__frame(self, _cmd)
{
    return CGRectMakeCopy(self._frame);
}
,["CGRect"]), new objj_method(sel_getUid("frameOrigin"), function $CPView__frameOrigin(self, _cmd)
{
    return CGPointMakeCopy(self._frame.origin);
}
,["CGPoint"]), new objj_method(sel_getUid("frameSize"), function $CPView__frameSize(self, _cmd)
{
    return CGSizeMakeCopy(self._frame.size);
}
,["CGSize"]), new objj_method(sel_getUid("setCenter:"), function $CPView__setCenter_(self, _cmd, aPoint)
{
    objj_msgSend(self, "setFrameOrigin:", CGPointMake(aPoint.x - self._frame.size.width / 2.0, aPoint.y - self._frame.size.height / 2.0));
}
,["void","CGPoint"]), new objj_method(sel_getUid("center"), function $CPView__center(self, _cmd)
{
    return CGPointMake(self._frame.size.width / 2.0 + self._frame.origin.x, self._frame.size.height / 2.0 + self._frame.origin.y);
}
,["CGPoint"]), new objj_method(sel_getUid("setFrameOrigin:"), function $CPView__setFrameOrigin_(self, _cmd, aPoint)
{
    var origin = self._frame.origin;
    if (!aPoint || CGPointEqualToPoint(origin, aPoint))
        return;
    origin.x = aPoint.x;
    origin.y = aPoint.y;
    if (self._postsFrameChangedNotifications && !self._inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
,["void","CGPoint"]), new objj_method(sel_getUid("setFrameSize:"), function $CPView__setFrameSize_(self, _cmd, aSize)
{
    var size = self._frame.size;
    if (!aSize || CGSizeEqualToSize(size, aSize))
        return;
    var oldSize = CGSizeMakeCopy(size);
    size.width = aSize.width;
    size.height = aSize.height;
    if (YES)
    {
        self._bounds.size.width = aSize.width * 1 / self._scaleSize.width;
        self._bounds.size.height = aSize.height * 1 / self._scaleSize.height;
    }
    if (self._layer)
        objj_msgSend(self._layer, "_owningViewBoundsChanged");
    if (self._autoresizesSubviews)
        objj_msgSend(self, "resizeSubviewsWithOldSize:", oldSize);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    if (self._postsFrameChangedNotifications && !self._inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
,["void","CGSize"]), new objj_method(sel_getUid("_setDisplayServerSetStyleSize:"), function $CPView___setDisplayServerSetStyleSize_(self, _cmd, aSize)
{
}
,["void","CGSize"]), new objj_method(sel_getUid("setBounds:"), function $CPView__setBounds_(self, _cmd, bounds)
{
    if (CGRectEqualToRect(self._bounds, bounds))
        return;
    self._inhibitFrameAndBoundsChangedNotifications = YES;
    objj_msgSend(self, "setBoundsOrigin:", bounds.origin);
    objj_msgSend(self, "setBoundsSize:", bounds.size);
    self._inhibitFrameAndBoundsChangedNotifications = NO;
    if (self._postsBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
,["void","CGRect"]), new objj_method(sel_getUid("bounds"), function $CPView__bounds(self, _cmd)
{
    return CGRectMakeCopy(self._bounds);
}
,["CGRect"]), new objj_method(sel_getUid("boundsOrigin"), function $CPView__boundsOrigin(self, _cmd)
{
    return CGPointMakeCopy(self._bounds.origin);
}
,["CGPoint"]), new objj_method(sel_getUid("boundsSize"), function $CPView__boundsSize(self, _cmd)
{
    return CGSizeMakeCopy(self._bounds.size);
}
,["CGSize"]), new objj_method(sel_getUid("setBoundsOrigin:"), function $CPView__setBoundsOrigin_(self, _cmd, aPoint)
{
    var origin = self._bounds.origin;
    if (CGPointEqualToPoint(origin, aPoint))
        return;
    origin.x = aPoint.x;
    origin.y = aPoint.y;
    if (origin.x != 0 || origin.y != 0)
    {
        self._boundsTransform = CGAffineTransformMakeTranslation(-origin.x, -origin.y);
        self._inverseBoundsTransform = CGAffineTransformInvert(self._boundsTransform);
    }
    else
    {
        self._boundsTransform = nil;
        self._inverseBoundsTransform = nil;
    }
    if (self._postsBoundsChangedNotifications && !self._inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
,["void","CGPoint"]), new objj_method(sel_getUid("setBoundsSize:"), function $CPView__setBoundsSize_(self, _cmd, aSize)
{
    var size = self._bounds.size;
    if (CGSizeEqualToSize(size, aSize))
        return;
    var frameSize = self._frame.size;
    if (!CGSizeEqualToSize(size, frameSize))
    {
        var origin = self._bounds.origin;
        origin.x /= size.width / frameSize.width;
        origin.y /= size.height / frameSize.height;
    }
    size.width = aSize.width;
    size.height = aSize.height;
    if (!CGSizeEqualToSize(size, frameSize))
    {
        var origin = self._bounds.origin;
        origin.x *= size.width / frameSize.width;
        origin.y *= size.height / frameSize.height;
    }
    if (self._postsBoundsChangedNotifications && !self._inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
,["void","CGSize"]), new objj_method(sel_getUid("resizeWithOldSuperviewSize:"), function $CPView__resizeWithOldSuperviewSize_(self, _cmd, aSize)
{
    var mask = objj_msgSend(self, "autoresizingMask");
    if (mask == CPViewNotSizable)
        return;
    var frame = self._superview._frame,
        newFrame = CGRectMakeCopy(self._frame),
        dX = frame.size.width - aSize.width,
        dY = frame.size.height - aSize.height,
        evenFractionX = 1.0 / ((mask & CPViewMinXMargin ? 1 : 0) + (mask & CPViewWidthSizable ? 1 : 0) + (mask & CPViewMaxXMargin ? 1 : 0)),
        evenFractionY = 1.0 / ((mask & CPViewMinYMargin ? 1 : 0) + (mask & CPViewHeightSizable ? 1 : 0) + (mask & CPViewMaxYMargin ? 1 : 0)),
        baseX = (mask & CPViewMinXMargin ? self._frame.origin.x : 0) + (mask & CPViewWidthSizable ? self._frame.size.width : 0) + (mask & CPViewMaxXMargin ? aSize.width - self._frame.size.width - self._frame.origin.x : 0),
        baseY = (mask & CPViewMinYMargin ? self._frame.origin.y : 0) + (mask & CPViewHeightSizable ? self._frame.size.height : 0) + (mask & CPViewMaxYMargin ? aSize.height - self._frame.size.height - self._frame.origin.y : 0);
    if (mask & CPViewMinXMargin)
        newFrame.origin.x += dX * (baseX > 0 ? self._frame.origin.x / baseX : evenFractionX);
    if (mask & CPViewWidthSizable)
        newFrame.size.width += dX * (baseX > 0 ? self._frame.size.width / baseX : evenFractionX);
    if (mask & CPViewMinYMargin)
        newFrame.origin.y += dY * (baseY > 0 ? self._frame.origin.y / baseY : evenFractionY);
    if (mask & CPViewHeightSizable)
        newFrame.size.height += dY * (baseY > 0 ? self._frame.size.height / baseY : evenFractionY);
    objj_msgSend(self, "setFrame:", newFrame);
}
,["void","CGSize"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
    var count = self._subviews.length;
    while (count--)
        objj_msgSend(self._subviews[count], "resizeWithOldSuperviewSize:", aSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("setAutoresizesSubviews:"), function $CPView__setAutoresizesSubviews_(self, _cmd, aFlag)
{
    self._autoresizesSubviews = !!aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("autoresizesSubviews"), function $CPView__autoresizesSubviews(self, _cmd)
{
    return self._autoresizesSubviews;
}
,["BOOL"]), new objj_method(sel_getUid("setAutoresizingMask:"), function $CPView__setAutoresizingMask_(self, _cmd, aMask)
{
    self._autoresizingMask = aMask;
}
,["void","unsigned"]), new objj_method(sel_getUid("autoresizingMask"), function $CPView__autoresizingMask(self, _cmd)
{
    return self._autoresizingMask;
}
,["unsigned"]), new objj_method(sel_getUid("enterFullScreenMode"), function $CPView__enterFullScreenMode(self, _cmd)
{
    return objj_msgSend(self, "enterFullScreenMode:withOptions:", nil, nil);
}
,["BOOL"]), new objj_method(sel_getUid("enterFullScreenMode:withOptions:"), function $CPView__enterFullScreenMode_withOptions_(self, _cmd, aScreen, options)
{
    self._fullScreenModeState = _CPViewFullScreenModeStateMake(self);
    var fullScreenWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", objj_msgSend(objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"), "contentBounds"), CPBorderlessWindowMask);
    objj_msgSend(fullScreenWindow, "setLevel:", CPScreenSaverWindowLevel);
    objj_msgSend(fullScreenWindow, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    var contentView = objj_msgSend(fullScreenWindow, "contentView");
    objj_msgSend(contentView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(contentView, "addSubview:", self);
    objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(self, "setFrame:", CGRectMakeCopy(objj_msgSend(contentView, "bounds")));
    objj_msgSend(fullScreenWindow, "makeKeyAndOrderFront:", self);
    objj_msgSend(fullScreenWindow, "makeFirstResponder:", self);
    self._isInFullScreenMode = YES;
    return YES;
}
,["BOOL","CPScreen","CPDictionary"]), new objj_method(sel_getUid("exitFullScreenMode"), function $CPView__exitFullScreenMode(self, _cmd)
{
    objj_msgSend(self, "exitFullScreenModeWithOptions:", nil);
}
,["void"]), new objj_method(sel_getUid("exitFullScreenModeWithOptions:"), function $CPView__exitFullScreenModeWithOptions_(self, _cmd, options)
{
    if (!self._isInFullScreenMode)
        return;
    self._isInFullScreenMode = NO;
    objj_msgSend(self, "setFrame:", self._fullScreenModeState.frame);
    objj_msgSend(self, "setAutoresizingMask:", self._fullScreenModeState.autoresizingMask);
    objj_msgSend(self._fullScreenModeState.superview, "_insertSubview:atIndex:", self, self._fullScreenModeState.index);
    objj_msgSend(objj_msgSend(self, "window"), "orderOut:", self);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("isInFullScreenMode"), function $CPView__isInFullScreenMode(self, _cmd)
{
    return self._isInFullScreenMode;
}
,["BOOL"]), new objj_method(sel_getUid("setHidden:"), function $CPView__setHidden_(self, _cmd, aFlag)
{
    aFlag = !!aFlag;
    if (self._isHidden === aFlag)
        return;
    self._isHidden = aFlag;
    if (aFlag)
    {
        var view = objj_msgSend(self._window, "firstResponder");
        if (objj_msgSend(view, "isKindOfClass:", objj_msgSend(CPView, "class")))
        {
            do
            {
                if (self == view)
                {
                    objj_msgSend(self._window, "makeFirstResponder:", objj_msgSend(self, "nextValidKeyView"));
                    break;
                }
            }
            while (view = objj_msgSend(view, "superview"));
        }
        objj_msgSend(self, "_notifyViewDidHide");
    }
    else
    {
        objj_msgSend(self, "setNeedsDisplay:", YES);
        objj_msgSend(self, "_notifyViewDidUnhide");
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("_notifyViewDidHide"), function $CPView___notifyViewDidHide(self, _cmd)
{
    objj_msgSend(self, "viewDidHide");
    var count = objj_msgSend(self._subviews, "count");
    while (count--)
        objj_msgSend(self._subviews[count], "_notifyViewDidHide");
}
,["void"]), new objj_method(sel_getUid("_notifyViewDidUnhide"), function $CPView___notifyViewDidUnhide(self, _cmd)
{
    objj_msgSend(self, "viewDidUnhide");
    var count = objj_msgSend(self._subviews, "count");
    while (count--)
        objj_msgSend(self._subviews[count], "_notifyViewDidUnhide");
}
,["void"]), new objj_method(sel_getUid("isHidden"), function $CPView__isHidden(self, _cmd)
{
    return self._isHidden;
}
,["BOOL"]), new objj_method(sel_getUid("setClipsToBounds:"), function $CPView__setClipsToBounds_(self, _cmd, shouldClip)
{
    if (self._clipsToBounds === shouldClip)
        return;
    self._clipsToBounds = shouldClip;
}
,["void","BOOL"]), new objj_method(sel_getUid("clipsToBounds"), function $CPView__clipsToBounds(self, _cmd)
{
    return self._clipsToBounds;
}
,["BOOL"]), new objj_method(sel_getUid("setAlphaValue:"), function $CPView__setAlphaValue_(self, _cmd, anAlphaValue)
{
    if (self._opacity == anAlphaValue)
        return;
    self._opacity = anAlphaValue;
}
,["void","float"]), new objj_method(sel_getUid("alphaValue"), function $CPView__alphaValue(self, _cmd)
{
    return self._opacity;
}
,["float"]), new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"), function $CPView__isHiddenOrHasHiddenAncestor(self, _cmd)
{
    var view = self;
    while (view && !objj_msgSend(view, "isHidden"))
        view = objj_msgSend(view, "superview");
    return view !== nil;
}
,["BOOL"]), new objj_method(sel_getUid("_isVisible"), function $CPView___isVisible(self, _cmd)
{
    return !objj_msgSend(self, "isHiddenOrHasHiddenAncestor") && objj_msgSend(objj_msgSend(self, "window"), "isVisible");
}
,["BOOL"]), new objj_method(sel_getUid("viewDidHide"), function $CPView__viewDidHide(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("viewDidUnhide"), function $CPView__viewDidUnhide(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("acceptsFirstMouse:"), function $CPView__acceptsFirstMouse_(self, _cmd, anEvent)
{
    return NO;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("hitTests"), function $CPView__hitTests(self, _cmd)
{
    return self._hitTests;
}
,["BOOL"]), new objj_method(sel_getUid("setHitTests:"), function $CPView__setHitTests_(self, _cmd, shouldHitTest)
{
    self._hitTests = !!shouldHitTest;
}
,["void","BOOL"]), new objj_method(sel_getUid("hitTest:"), function $CPView__hitTest_(self, _cmd, aPoint)
{
    if (self._isHidden || !self._hitTests)
        return nil;
    var frame = self._frame,
        sizeScale = objj_msgSend(self, "_hierarchyScaleSize");
    if (self._isScaled)
        frame = CGRectApplyAffineTransform(self._frame, CGAffineTransformMakeScale(objj_msgSend(self._superview, "_hierarchyScaleSize").width, objj_msgSend(self._superview, "_hierarchyScaleSize").height));
    else
        frame = CGRectApplyAffineTransform(self._frame, CGAffineTransformMakeScale(sizeScale.width, sizeScale.height));
    if (!CGRectContainsPoint(frame, aPoint))
        return nil;
    var view = nil,
        i = self._subviews.length,
        adjustedPoint = CGPointMake(aPoint.x - CGRectGetMinX(frame), aPoint.y - CGRectGetMinY(frame));
    if (self._inverseBoundsTransform)
    {
        var affineTransform = CGAffineTransformMakeCopy(self._inverseBoundsTransform);
        if (self._isScaled)
        {
            affineTransform.tx *= objj_msgSend(self._superview, "_hierarchyScaleSize").width;
            affineTransform.ty *= objj_msgSend(self._superview, "_hierarchyScaleSize").height;
        }
        else
        {
            affineTransform.tx *= sizeScale.width;
            affineTransform.ty *= sizeScale.height;
        }
        adjustedPoint = CGPointApplyAffineTransform(adjustedPoint, affineTransform);
    }
    while (i--)
        if (view = objj_msgSend(self._subviews[i], "hitTest:", adjustedPoint))
            return view;
    return self;
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("needsPanelToBecomeKey"), function $CPView__needsPanelToBecomeKey(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("mouseDownCanMoveWindow"), function $CPView__mouseDownCanMoveWindow(self, _cmd)
{
    return !objj_msgSend(self, "isOpaque");
}
,["BOOL"]), new objj_method(sel_getUid("mouseDown:"), function $CPView__mouseDown_(self, _cmd, anEvent)
{
    if (objj_msgSend(self, "mouseDownCanMoveWindow"))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "mouseDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("rightMouseDown:"), function $CPView__rightMouseDown_(self, _cmd, anEvent)
{
    var menu = objj_msgSend(self, "menuForEvent:", anEvent);
    if (menu)
        objj_msgSend(CPMenu, "popUpContextMenu:withEvent:forView:", menu, anEvent, self);
    else if (objj_msgSend(objj_msgSend(self, "nextResponder"), "isKindOfClass:", CPView))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "rightMouseDown:", anEvent);
    else
        objj_msgSend(objj_msgSend(objj_msgSend(anEvent, "window"), "platformWindow"), "_propagateContextMenuDOMEvent:", YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("menuForEvent:"), function $CPView__menuForEvent_(self, _cmd, anEvent)
{
    return objj_msgSend(self, "menu") || objj_msgSend(objj_msgSend(self, "class"), "defaultMenu");
}
,["CPMenu","CPEvent"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPView__setBackgroundColor_(self, _cmd, aColor)
{
    if (self._backgroundColor == aColor)
        return;
    if (aColor == objj_msgSend(CPNull, "null"))
        aColor = nil;
    self._backgroundColor = aColor;
}
,["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CPView__backgroundColor(self, _cmd)
{
    return self._backgroundColor;
}
,["CPColor"]), new objj_method(sel_getUid("convertPoint:fromView:"), function $CPView__convertPoint_fromView_(self, _cmd, aPoint, aView)
{
    if (aView === self)
        return aPoint;
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(aView, self));
}
,["CGPoint","CGPoint","CPView"]), new objj_method(sel_getUid("convertPointFromBase:"), function $CPView__convertPointFromBase_(self, _cmd, aPoint)
{
    return objj_msgSend(self, "convertPoint:fromView:", aPoint, nil);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertPoint:toView:"), function $CPView__convertPoint_toView_(self, _cmd, aPoint, aView)
{
    if (aView === self)
        return aPoint;
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(self, aView));
}
,["CGPoint","CGPoint","CPView"]), new objj_method(sel_getUid("convertPointToBase:"), function $CPView__convertPointToBase_(self, _cmd, aPoint)
{
    return objj_msgSend(self, "convertPoint:toView:", aPoint, nil);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertSize:fromView:"), function $CPView__convertSize_fromView_(self, _cmd, aSize, aView)
{
    if (aView === self)
        return aSize;
    return CGSizeApplyAffineTransform(aSize, _CPViewGetTransform(aView, self));
}
,["CGSize","CGSize","CPView"]), new objj_method(sel_getUid("convertSize:toView:"), function $CPView__convertSize_toView_(self, _cmd, aSize, aView)
{
    if (aView === self)
        return aSize;
    return CGSizeApplyAffineTransform(aSize, _CPViewGetTransform(self, aView));
}
,["CGSize","CGSize","CPView"]), new objj_method(sel_getUid("convertRect:fromView:"), function $CPView__convertRect_fromView_(self, _cmd, aRect, aView)
{
    if (self === aView)
        return aRect;
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(aView, self));
}
,["CGRect","CGRect","CPView"]), new objj_method(sel_getUid("convertRectFromBase:"), function $CPView__convertRectFromBase_(self, _cmd, aRect)
{
    return objj_msgSend(self, "convertRect:fromView:", aRect, nil);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("convertRect:toView:"), function $CPView__convertRect_toView_(self, _cmd, aRect, aView)
{
    if (self === aView)
        return aRect;
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(self, aView));
}
,["CGRect","CGRect","CPView"]), new objj_method(sel_getUid("convertRectToBase:"), function $CPView__convertRectToBase_(self, _cmd, aRect)
{
    return objj_msgSend(self, "convertRect:toView:", aRect, nil);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("setPostsFrameChangedNotifications:"), function $CPView__setPostsFrameChangedNotifications_(self, _cmd, shouldPostFrameChangedNotifications)
{
    shouldPostFrameChangedNotifications = !!shouldPostFrameChangedNotifications;
    if (self._postsFrameChangedNotifications === shouldPostFrameChangedNotifications)
        return;
    self._postsFrameChangedNotifications = shouldPostFrameChangedNotifications;
}
,["void","BOOL"]), new objj_method(sel_getUid("postsFrameChangedNotifications"), function $CPView__postsFrameChangedNotifications(self, _cmd)
{
    return self._postsFrameChangedNotifications;
}
,["BOOL"]), new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"), function $CPView__setPostsBoundsChangedNotifications_(self, _cmd, shouldPostBoundsChangedNotifications)
{
    shouldPostBoundsChangedNotifications = !!shouldPostBoundsChangedNotifications;
    if (self._postsBoundsChangedNotifications === shouldPostBoundsChangedNotifications)
        return;
    self._postsBoundsChangedNotifications = shouldPostBoundsChangedNotifications;
}
,["void","BOOL"]), new objj_method(sel_getUid("postsBoundsChangedNotifications"), function $CPView__postsBoundsChangedNotifications(self, _cmd)
{
    return self._postsBoundsChangedNotifications;
}
,["BOOL"]), new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"), function $CPView__dragImage_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{
    objj_msgSend(self._window, "dragImage:at:offset:event:pasteboard:source:slideBack:", anImage, objj_msgSend(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
,["void","CPImage","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"), function $CPView__dragView_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{
    objj_msgSend(self._window, "dragView:at:offset:event:pasteboard:source:slideBack:", aView, objj_msgSend(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
,["void","CPView","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("registerForDraggedTypes:"), function $CPView__registerForDraggedTypes_(self, _cmd, pasteboardTypes)
{
    if (!pasteboardTypes || !objj_msgSend(pasteboardTypes, "count"))
        return;
    var theWindow = objj_msgSend(self, "window");
    objj_msgSend(theWindow, "_noteUnregisteredDraggedTypes:", self._registeredDraggedTypes);
    objj_msgSend(self._registeredDraggedTypes, "addObjectsFromArray:", pasteboardTypes);
    objj_msgSend(theWindow, "_noteRegisteredDraggedTypes:", self._registeredDraggedTypes);
    self._registeredDraggedTypesArray = nil;
}
,["void","CPArray"]), new objj_method(sel_getUid("registeredDraggedTypes"), function $CPView__registeredDraggedTypes(self, _cmd)
{
    if (!self._registeredDraggedTypesArray)
        self._registeredDraggedTypesArray = objj_msgSend(self._registeredDraggedTypes, "allObjects");
    return self._registeredDraggedTypesArray;
}
,["CPArray"]), new objj_method(sel_getUid("unregisterDraggedTypes"), function $CPView__unregisterDraggedTypes(self, _cmd)
{
    objj_msgSend(objj_msgSend(self, "window"), "_noteUnregisteredDraggedTypes:", self._registeredDraggedTypes);
    self._registeredDraggedTypes = objj_msgSend(CPSet, "set");
    self._registeredDraggedTypesArray = [];
}
,["void"]), new objj_method(sel_getUid("drawRect:"), function $CPView__drawRect_(self, _cmd, aRect)
{
}
,["void","CGRect"]), new objj_method(sel_getUid("scaleUnitSquareToSize:"), function $CPView__scaleUnitSquareToSize_(self, _cmd, aSize)
{
    if (!aSize)
        return;
    var bounds = CGRectMakeCopy(objj_msgSend(self, "bounds"));
    bounds.size.width *= self._scaleSize.width;
    bounds.size.height *= self._scaleSize.height;
    objj_msgSend(self, "willChangeValueForKey:", "scaleSize");
    self._scaleSize = CGSizeMakeCopy(objj_msgSend(self, "scaleSize"));
    self._scaleSize.height *= aSize.height;
    self._scaleSize.width *= aSize.width;
    objj_msgSend(self, "didChangeValueForKey:", "scaleSize");
    self._isScaled = YES;
    self._hierarchyScaleSize = CGSizeMakeCopy(objj_msgSend(self, "_hierarchyScaleSize"));
    self._hierarchyScaleSize.height *= aSize.height;
    self._hierarchyScaleSize.width *= aSize.width;
    var scaleAffine = CGAffineTransformMakeScale(1.0 / self._scaleSize.width, 1.0 / self._scaleSize.height),
        newBounds = CGRectApplyAffineTransform(CGRectMakeCopy(bounds), scaleAffine);
    objj_msgSend(self, "setBounds:", newBounds);
    objj_msgSend(self._subviews, "makeObjectsPerformSelector:withObject:", sel_getUid("_scaleSizeUnitSquareToSize:"), aSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("_scaleSizeUnitSquareToSize:"), function $CPView___scaleSizeUnitSquareToSize_(self, _cmd, aSize)
{
    self._hierarchyScaleSize = CGSizeMakeCopy(objj_msgSend(self._superview, "_hierarchyScaleSize"));
    if (self._isScaled)
    {
        self._hierarchyScaleSize.width *= self._scaleSize.width;
        self._hierarchyScaleSize.height *= self._scaleSize.height;
    }
    objj_msgSend(self._subviews, "makeObjectsPerformSelector:withObject:", sel_getUid("_scaleSizeUnitSquareToSize:"), aSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("_hierarchyScaleSize"), function $CPView___hierarchyScaleSize(self, _cmd)
{
    return self._hierarchyScaleSize || CGSizeMake(1.0, 1.0);
}
,["CGSize"]), new objj_method(sel_getUid("_applyCSSScalingTranformations"), function $CPView___applyCSSScalingTranformations(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("setNeedsDisplay:"), function $CPView__setNeedsDisplay_(self, _cmd, aFlag)
{
    if (aFlag)
    {
        objj_msgSend(self, "_applyCSSScalingTranformations");
        objj_msgSend(self, "setNeedsDisplayInRect:", objj_msgSend(self, "bounds"));
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("setNeedsDisplayInRect:"), function $CPView__setNeedsDisplayInRect_(self, _cmd, aRect)
{
    if (!(self._viewClassFlags & CPViewHasCustomDrawRect))
        return;
    if (CGRectIsEmpty(aRect))
        return;
    if (self._dirtyRect && !CGRectIsEmpty(self._dirtyRect))
        self._dirtyRect = CGRectUnion(aRect, self._dirtyRect);
    else
        self._dirtyRect = CGRectMakeCopy(aRect);
    _CPDisplayServerAddDisplayObject(self);
}
,["void","CGRect"]), new objj_method(sel_getUid("needsDisplay"), function $CPView__needsDisplay(self, _cmd)
{
    return self._dirtyRect && !CGRectIsEmpty(self._dirtyRect);
}
,["BOOL"]), new objj_method(sel_getUid("displayIfNeeded"), function $CPView__displayIfNeeded(self, _cmd)
{
    if (objj_msgSend(self, "needsDisplay"))
        objj_msgSend(self, "displayRect:", self._dirtyRect);
}
,["void"]), new objj_method(sel_getUid("display"), function $CPView__display(self, _cmd)
{
    objj_msgSend(self, "displayRect:", objj_msgSend(self, "visibleRect"));
}
,["void"]), new objj_method(sel_getUid("displayIfNeededInRect:"), function $CPView__displayIfNeededInRect_(self, _cmd, aRect)
{
    if (objj_msgSend(self, "needsDisplay"))
        objj_msgSend(self, "displayRect:", aRect);
}
,["void","CGRect"]), new objj_method(sel_getUid("displayRect:"), function $CPView__displayRect_(self, _cmd, aRect)
{
    objj_msgSend(self, "viewWillDraw");
    objj_msgSend(self, "displayRectIgnoringOpacity:inContext:", aRect, nil);
    self._dirtyRect = NULL;
}
,["void","CGRect"]), new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"), function $CPView__displayRectIgnoringOpacity_inContext_(self, _cmd, aRect, aGraphicsContext)
{
    if (objj_msgSend(self, "isHidden"))
        return;
}
,["void","CGRect","CPGraphicsContext"]), new objj_method(sel_getUid("viewWillDraw"), function $CPView__viewWillDraw(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("lockFocus"), function $CPView__lockFocus(self, _cmd)
{
    if (!self._graphicsContext)
    {
        var graphicsPort = CGBitmapGraphicsContextCreate();
        self._graphicsContext = objj_msgSend(CPGraphicsContext, "graphicsContextWithGraphicsPort:flipped:", graphicsPort, YES);
    }
    objj_msgSend(CPGraphicsContext, "setCurrentContext:", self._graphicsContext);
    CGContextSaveGState(objj_msgSend(self._graphicsContext, "graphicsPort"));
}
,["void"]), new objj_method(sel_getUid("unlockFocus"), function $CPView__unlockFocus(self, _cmd)
{
    CGContextRestoreGState(objj_msgSend(self._graphicsContext, "graphicsPort"));
    objj_msgSend(CPGraphicsContext, "setCurrentContext:", nil);
}
,["void"]), new objj_method(sel_getUid("setNeedsLayout"), function $CPView__setNeedsLayout(self, _cmd)
{
    if (!(self._viewClassFlags & CPViewHasCustomLayoutSubviews))
        return;
    self._needsLayout = YES;
    _CPDisplayServerAddLayoutObject(self);
}
,["void"]), new objj_method(sel_getUid("layoutIfNeeded"), function $CPView__layoutIfNeeded(self, _cmd)
{
    if (self._needsLayout)
    {
        self._needsLayout = NO;
        objj_msgSend(self, "layoutSubviews");
    }
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $CPView__layoutSubviews(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("isOpaque"), function $CPView__isOpaque(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("visibleRect"), function $CPView__visibleRect(self, _cmd)
{
    if (!self._superview)
        return self._bounds;
    return CGRectIntersection(objj_msgSend(self, "convertRect:fromView:", objj_msgSend(self._superview, "visibleRect"), self._superview), self._bounds);
}
,["CGRect"]), new objj_method(sel_getUid("_enclosingClipView"), function $CPView___enclosingClipView(self, _cmd)
{
    var superview = self._superview,
        clipViewClass = objj_msgSend(CPClipView, "class");
    while (superview && !objj_msgSend(superview, "isKindOfClass:", clipViewClass))
        superview = superview._superview;
    return superview;
}
,["CPScrollView"]), new objj_method(sel_getUid("scrollPoint:"), function $CPView__scrollPoint_(self, _cmd, aPoint)
{
    var clipView = objj_msgSend(self, "_enclosingClipView");
    if (!clipView)
        return;
    objj_msgSend(clipView, "scrollToPoint:", objj_msgSend(self, "convertPoint:toView:", aPoint, clipView));
}
,["void","CGPoint"]), new objj_method(sel_getUid("scrollRectToVisible:"), function $CPView__scrollRectToVisible_(self, _cmd, aRect)
{
    aRect = CGRectIntersection(aRect, self._bounds);
    if (CGRectIsEmpty(aRect))
        return NO;
    var enclosingClipView = objj_msgSend(self, "_enclosingClipView");
    if (!enclosingClipView)
        return NO;
    var documentView = objj_msgSend(enclosingClipView, "documentView");
    if (!documentView)
        return NO;
    var documentViewVisibleRect = objj_msgSend(documentView, "visibleRect"),
        rectInDocumentView = objj_msgSend(self, "convertRect:toView:", aRect, documentView);
    if (CGRectContainsRect(documentViewVisibleRect, rectInDocumentView))
        return NO;
    var scrollPoint = CGPointMakeCopy(documentViewVisibleRect.origin);
    if (CGRectGetMinX(rectInDocumentView) < CGRectGetMinX(documentViewVisibleRect))
        scrollPoint.x = CGRectGetMinX(rectInDocumentView);
    else if (CGRectGetMaxX(rectInDocumentView) > CGRectGetMaxX(documentViewVisibleRect))
        scrollPoint.x += CGRectGetMaxX(rectInDocumentView) - CGRectGetMaxX(documentViewVisibleRect);
    if (CGRectGetMinY(rectInDocumentView) < CGRectGetMinY(documentViewVisibleRect))
        scrollPoint.y = CGRectGetMinY(rectInDocumentView);
    else if (CGRectGetMaxY(rectInDocumentView) > CGRectGetMaxY(documentViewVisibleRect))
        scrollPoint.y += CGRectGetMaxY(rectInDocumentView) - CGRectGetMaxY(documentViewVisibleRect);
    objj_msgSend(enclosingClipView, "scrollToPoint:", scrollPoint);
    return YES;
}
,["BOOL","CGRect"]), new objj_method(sel_getUid("autoscroll:"), function $CPView__autoscroll_(self, _cmd, anEvent)
{
    return objj_msgSend(objj_msgSend(self, "superview"), "autoscroll:", anEvent);
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("adjustScroll:"), function $CPView__adjustScroll_(self, _cmd, proposedVisibleRect)
{
    return proposedVisibleRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("scrollRect:by:"), function $CPView__scrollRect_by_(self, _cmd, aRect, anAmount)
{
}
,["void","CGRect","float"]), new objj_method(sel_getUid("enclosingScrollView"), function $CPView__enclosingScrollView(self, _cmd)
{
    var superview = self._superview,
        scrollViewClass = objj_msgSend(CPScrollView, "class");
    while (superview && !objj_msgSend(superview, "isKindOfClass:", scrollViewClass))
        superview = superview._superview;
    return superview;
}
,["CPScrollView"]), new objj_method(sel_getUid("scrollClipView:toPoint:"), function $CPView__scrollClipView_toPoint_(self, _cmd, aClipView, aPoint)
{
    objj_msgSend(aClipView, "scrollToPoint:", aPoint);
}
,["void","CPClipView","CGPoint"]), new objj_method(sel_getUid("reflectScrolledClipView:"), function $CPView__reflectScrolledClipView_(self, _cmd, aClipView)
{
}
,["void","CPClipView"]), new objj_method(sel_getUid("inLiveResize"), function $CPView__inLiveResize(self, _cmd)
{
    return self._inLiveResize;
}
,["BOOL"]), new objj_method(sel_getUid("viewWillStartLiveResize"), function $CPView__viewWillStartLiveResize(self, _cmd)
{
    self._inLiveResize = YES;
}
,["void"]), new objj_method(sel_getUid("viewDidEndLiveResize"), function $CPView__viewDidEndLiveResize(self, _cmd)
{
    self._inLiveResize = NO;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPView__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPView, "class"))
        return;
    CachedNotificationCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
}
,["void"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPView___binderClassForBinding_(self, _cmd, aBinding)
{
    if (objj_msgSend(aBinding, "hasPrefix:", CPHiddenBinding))
        return objj_msgSend(CPMultipleValueOrBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPView").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"), function $CPView__keyPathsForValuesAffectingFrame(self, _cmd)
{
    return objj_msgSend(CPSet, "setWithObjects:", "frameOrigin", "frameSize");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingBounds"), function $CPView__keyPathsForValuesAffectingBounds(self, _cmd)
{
    return objj_msgSend(CPSet, "setWithObjects:", "boundsOrigin", "boundsSize");
}
,["CPSet"]), new objj_method(sel_getUid("defaultMenu"), function $CPView__defaultMenu(self, _cmd)
{
    return nil;
}
,["CPMenu"])]);
}{
var the_class = objj_getClass("CPView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("performKeyEquivalent:"), function $CPView__performKeyEquivalent_(self, _cmd, anEvent)
{
    var count = objj_msgSend(self._subviews, "count");
    while (count--)
        if (objj_msgSend(self._subviews[count], "performKeyEquivalent:", anEvent))
            return YES;
    return NO;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("canBecomeKeyView"), function $CPView__canBecomeKeyView(self, _cmd)
{
    return objj_msgSend(self, "acceptsFirstResponder") && !objj_msgSend(self, "isHiddenOrHasHiddenAncestor");
}
,["BOOL"]), new objj_method(sel_getUid("nextKeyView"), function $CPView__nextKeyView(self, _cmd)
{
    return self._nextKeyView;
}
,["CPView"]), new objj_method(sel_getUid("nextValidKeyView"), function $CPView__nextValidKeyView(self, _cmd)
{
    var result = objj_msgSend(self, "nextKeyView"),
        resultUID = objj_msgSend(result, "UID"),
        unsuitableResults = {};
    while (result && !objj_msgSend(result, "canBecomeKeyView"))
    {
        unsuitableResults[resultUID] = 1;
        result = objj_msgSend(result, "nextKeyView");
        resultUID = objj_msgSend(result, "UID");
        if (unsuitableResults[resultUID])
            return nil;
    }
    return result;
}
,["CPView"]), new objj_method(sel_getUid("previousKeyView"), function $CPView__previousKeyView(self, _cmd)
{
    return self._previousKeyView;
}
,["CPView"]), new objj_method(sel_getUid("previousValidKeyView"), function $CPView__previousValidKeyView(self, _cmd)
{
    var result = objj_msgSend(self, "previousKeyView"),
        firstResult = result;
    while (result && !objj_msgSend(result, "canBecomeKeyView"))
    {
        result = objj_msgSend(result, "previousKeyView");
        if (result === firstResult)
            return nil;
    }
    return result;
}
,["CPView"]), new objj_method(sel_getUid("_setPreviousKeyView:"), function $CPView___setPreviousKeyView_(self, _cmd, previous)
{
    if (!objj_msgSend(previous, "isEqual:", self))
    {
        var previousWindow = objj_msgSend(previous, "window");
        if (!previousWindow || previousWindow === self._window)
        {
            self._previousKeyView = previous;
            return;
        }
    }
    self._previousKeyView = nil;
}
,["void","CPView"]), new objj_method(sel_getUid("setNextKeyView:"), function $CPView__setNextKeyView_(self, _cmd, next)
{
    if (!objj_msgSend(next, "isEqual:", self))
    {
        var nextWindow = objj_msgSend(next, "window");
        if (!nextWindow || nextWindow === self._window)
        {
            self._nextKeyView = next;
            objj_msgSend(self._nextKeyView, "_setPreviousKeyView:", self);
            return;
        }
    }
    self._nextKeyView = nil;
}
,["void","CPView"])]);
}{
var the_class = objj_getClass("CPView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setLayer:"), function $CPView__setLayer_(self, _cmd, aLayer)
{
    if (self._layer == aLayer)
        return;
    if (self._layer)
    {
        self._layer._owningView = nil;
    }
    self._layer = aLayer;
    if (self._layer)
    {
        var bounds = CGRectMakeCopy(objj_msgSend(self, "bounds"));
        objj_msgSend(self._layer, "_setOwningView:", self);
    }
}
,["void","CALayer"]), new objj_method(sel_getUid("layer"), function $CPView__layer(self, _cmd)
{
    return self._layer;
}
,["CALayer"]), new objj_method(sel_getUid("setWantsLayer:"), function $CPView__setWantsLayer_(self, _cmd, aFlag)
{
    self._wantsLayer = !!aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("wantsLayer"), function $CPView__wantsLayer(self, _cmd)
{
    return self._wantsLayer;
}
,["BOOL"])]);
}{
var the_class = objj_getClass("CPView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setScaleSize:"), function $CPView__setScaleSize_(self, _cmd, aSize)
{
    if (CGSizeEqualToSize(self._scaleSize, aSize))
        return;
    var size = CGSizeMakeZero(),
        scale = CGSizeMakeCopy(objj_msgSend(self, "scaleSize"));
    size.height = aSize.height / scale.height;
    size.width = aSize.width / scale.width;
    objj_msgSend(self, "scaleUnitSquareToSize:", size);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CGSize"]), new objj_method(sel_getUid("scaleSize"), function $CPView__scaleSize(self, _cmd)
{
    return self._scaleSize || CGSizeMake(1.0, 1.0);
}
,["CGSize"])]);
}{
var the_class = objj_getClass("CPView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("themeState"), function $CPView__themeState(self, _cmd)
{
    return self._themeState;
}
,["unsigned"]), new objj_method(sel_getUid("hasThemeState:"), function $CPView__hasThemeState_(self, _cmd, aState)
{
    if (aState.isa && objj_msgSend(aState, "isKindOfClass:", CPArray))
        return self._themeState.hasThemeState.apply(self._themeState, aState);
    return self._themeState.hasThemeState(aState);
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("setThemeState:"), function $CPView__setThemeState_(self, _cmd, aState)
{
    if (aState && aState.isa && objj_msgSend(aState, "isKindOfClass:", CPArray))
        aState = CPThemeState.apply(null, aState);
    if (self._themeState.hasThemeState(aState))
        return NO;
    self._themeState = CPThemeState(self._themeState, aState);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    return YES;
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("unsetThemeState:"), function $CPView__unsetThemeState_(self, _cmd, aState)
{
    if (aState && aState.isa && objj_msgSend(aState, "isKindOfClass:", CPArray))
        aState = CPThemeState.apply(null, aState);
    var oldThemeState = self._themeState;
    self._themeState = self._themeState.without(aState);
    if (oldThemeState === self._themeState)
        return NO;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    return YES;
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("themeClass"), function $CPView__themeClass(self, _cmd)
{
    if (self._themeClass)
        return self._themeClass;
    return objj_msgSend(objj_msgSend(self, "class"), "defaultThemeClass");
}
,["CPString"]), new objj_method(sel_getUid("setThemeClass:"), function $CPView__setThemeClass_(self, _cmd, theClass)
{
    self._themeClass = theClass;
    objj_msgSend(self, "_loadThemeAttributes");
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPString"]), new objj_method(sel_getUid("_loadThemeAttributes"), function $CPView___loadThemeAttributes(self, _cmd)
{
    var theClass = objj_msgSend(self, "class"),
        attributes = objj_msgSend(theClass, "_themeAttributes"),
        count = attributes.length;
    if (!count)
        return;
    var theme = objj_msgSend(self, "theme"),
        themeClass = objj_msgSend(self, "themeClass");
    self._themeAttributes = {};
    while (count--)
    {
        var attributeName = attributes[count--],
            attribute = objj_msgSend(objj_msgSend(_CPThemeAttribute, "alloc"), "initWithName:defaultValue:", attributeName, attributes[count]);
        objj_msgSend(attribute, "setParentAttribute:", objj_msgSend(theme, "attributeWithName:forClass:", attributeName, themeClass));
        self._themeAttributes[attributeName] = attribute;
    }
}
,["void"]), new objj_method(sel_getUid("setTheme:"), function $CPView__setTheme_(self, _cmd, aTheme)
{
    if (self._theme === aTheme)
        return;
    self._theme = aTheme;
    objj_msgSend(self, "viewDidChangeTheme");
}
,["void","CPTheme"]), new objj_method(sel_getUid("_setThemeIncludingDescendants:"), function $CPView___setThemeIncludingDescendants_(self, _cmd, aTheme)
{
    objj_msgSend(self, "setTheme:", aTheme);
    objj_msgSend(objj_msgSend(self, "subviews"), "makeObjectsPerformSelector:withObject:", sel_getUid("_setThemeIncludingDescendants:"), aTheme);
}
,["void","CPTheme"]), new objj_method(sel_getUid("theme"), function $CPView__theme(self, _cmd)
{
    return self._theme;
}
,["CPTheme"]), new objj_method(sel_getUid("viewDidChangeTheme"), function $CPView__viewDidChangeTheme(self, _cmd)
{
    if (!self._themeAttributes)
        return;
    var theme = objj_msgSend(self, "theme"),
        themeClass = objj_msgSend(self, "themeClass");
    for (var attributeName in self._themeAttributes)
        if (self._themeAttributes.hasOwnProperty(attributeName))
            objj_msgSend(self._themeAttributes[attributeName], "setParentAttribute:", objj_msgSend(theme, "attributeWithName:forClass:", attributeName, themeClass));
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("_themeAttributeDictionary"), function $CPView___themeAttributeDictionary(self, _cmd)
{
    var dictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    if (self._themeAttributes)
    {
        var theme = objj_msgSend(self, "theme");
        for (var attributeName in self._themeAttributes)
            if (self._themeAttributes.hasOwnProperty(attributeName))
                objj_msgSend(dictionary, "setObject:forKey:", self._themeAttributes[attributeName], attributeName);
    }
    return dictionary;
}
,["CPDictionary"]), new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"), function $CPView__setValue_forThemeAttribute_inState_(self, _cmd, aValue, aName, aState)
{
    if (aState.isa && objj_msgSend(aState, "isKindOfClass:", CPArray))
        aState = CPThemeState.apply(null, aState);
    if (!self._themeAttributes || !self._themeAttributes[aName])
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(self, "className") + " does not contain theme attribute '" + aName + "'");
    var currentValue = objj_msgSend(self, "currentValueForThemeAttribute:", aName);
    objj_msgSend(self._themeAttributes[aName], "setValue:forState:", aValue, aState);
    if (objj_msgSend(self, "currentValueForThemeAttribute:", aName) === currentValue)
        return;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","id","CPString","ThemeState"]), new objj_method(sel_getUid("setValue:forThemeAttribute:"), function $CPView__setValue_forThemeAttribute_(self, _cmd, aValue, aName)
{
    if (!self._themeAttributes || !self._themeAttributes[aName])
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(self, "className") + " does not contain theme attribute '" + aName + "'");
    var currentValue = objj_msgSend(self, "currentValueForThemeAttribute:", aName);
    objj_msgSend(self._themeAttributes[aName], "setValue:", aValue);
    if (objj_msgSend(self, "currentValueForThemeAttribute:", aName) === currentValue)
        return;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForThemeAttribute:inState:"), function $CPView__valueForThemeAttribute_inState_(self, _cmd, aName, aState)
{
    if (aState.isa && objj_msgSend(aState, "isKindOfClass:", CPArray))
        aState = CPThemeState.apply(null, aState);
    if (!self._themeAttributes || !self._themeAttributes[aName])
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(self, "className") + " does not contain theme attribute '" + aName + "'");
    return objj_msgSend(self._themeAttributes[aName], "valueForState:", aState);
}
,["id","CPString","ThemeState"]), new objj_method(sel_getUid("valueForThemeAttribute:"), function $CPView__valueForThemeAttribute_(self, _cmd, aName)
{
    if (!self._themeAttributes || !self._themeAttributes[aName])
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(self, "className") + " does not contain theme attribute '" + aName + "'");
    return objj_msgSend(self._themeAttributes[aName], "value");
}
,["id","CPString"]), new objj_method(sel_getUid("currentValueForThemeAttribute:"), function $CPView__currentValueForThemeAttribute_(self, _cmd, aName)
{
    if (!self._themeAttributes || !self._themeAttributes[aName])
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(self, "className") + " does not contain theme attribute '" + aName + "'");
    return objj_msgSend(self._themeAttributes[aName], "valueForState:", self._themeState);
}
,["id","CPString"]), new objj_method(sel_getUid("hasThemeAttribute:"), function $CPView__hasThemeAttribute_(self, _cmd, aName)
{
    return self._themeAttributes && self._themeAttributes[aName] !== undefined;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("registerThemeValues:"), function $CPView__registerThemeValues_(self, _cmd, themeValues)
{
    for (var i = 0; i < themeValues.length; ++i)
    {
        var attributeValueState = themeValues[i],
            attribute = attributeValueState[0],
            value = attributeValueState[1],
            state = attributeValueState[2];
        if (state)
            objj_msgSend(self, "setValue:forThemeAttribute:inState:", value, attribute, state);
        else
            objj_msgSend(self, "setValue:forThemeAttribute:", value, attribute);
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("registerThemeValues:inherit:"), function $CPView__registerThemeValues_inherit_(self, _cmd, themeValues, inheritedValues)
{
    if (inheritedValues)
        objj_msgSend(self, "registerThemeValues:", inheritedValues);
    if (themeValues)
        objj_msgSend(self, "registerThemeValues:", themeValues);
}
,["void","CPArray","CPArray"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPView__createEphemeralSubviewNamed_(self, _cmd, aViewName)
{
    return nil;
}
,["CPView","CPString"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPView__rectForEphemeralSubviewNamed_(self, _cmd, aViewName)
{
    return CGRectMakeZero();
}
,["CGRect","CPString"]), new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"), function $CPView__layoutEphemeralSubviewNamed_positioned_relativeToEphemeralSubviewNamed_(self, _cmd, aViewName, anOrderingMode, relativeToViewName)
{
    if (!self._ephemeralSubviewsForNames)
    {
        self._ephemeralSubviewsForNames = {};
        self._ephemeralSubviews = objj_msgSend(CPSet, "set");
    }
    var frame = objj_msgSend(self, "rectForEphemeralSubviewNamed:", aViewName);
    if (frame)
    {
        if (!self._ephemeralSubviewsForNames[aViewName])
        {
            self._ephemeralSubviewsForNames[aViewName] = objj_msgSend(self, "createEphemeralSubviewNamed:", aViewName);
            objj_msgSend(self._ephemeralSubviews, "addObject:", self._ephemeralSubviewsForNames[aViewName]);
            if (self._ephemeralSubviewsForNames[aViewName])
                objj_msgSend(self, "addSubview:positioned:relativeTo:", self._ephemeralSubviewsForNames[aViewName], anOrderingMode, self._ephemeralSubviewsForNames[relativeToViewName]);
        }
        if (self._ephemeralSubviewsForNames[aViewName])
            objj_msgSend(self._ephemeralSubviewsForNames[aViewName], "setFrame:", frame);
    }
    else if (self._ephemeralSubviewsForNames[aViewName])
    {
        objj_msgSend(self._ephemeralSubviewsForNames[aViewName], "removeFromSuperview");
        objj_msgSend(self._ephemeralSubviews, "removeObject:", self._ephemeralSubviewsForNames[aViewName]);
        delete self._ephemeralSubviewsForNames[aViewName];
    }
    return self._ephemeralSubviewsForNames[aViewName];
}
,["CPView","CPString","CPWindowOrderingMode","CPString"]), new objj_method(sel_getUid("ephemeralSubviewNamed:"), function $CPView__ephemeralSubviewNamed_(self, _cmd, aViewName)
{
    if (!self._ephemeralSubviewsForNames)
        return nil;
    return self._ephemeralSubviewsForNames[aViewName] || nil;
}
,["CPView","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPView__defaultThemeClass(self, _cmd)
{
    return nil;
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPView__themeAttributes(self, _cmd)
{
    return nil;
}
,["CPDictionary"]), new objj_method(sel_getUid("_themeAttributes"), function $CPView___themeAttributes(self, _cmd)
{
    if (!CachedThemeAttributes)
        CachedThemeAttributes = {};
    var theClass = objj_msgSend(self, "class"),
        CPViewClass = objj_msgSend(CPView, "class"),
        attributes = [],
        nullValue = objj_msgSend(CPNull, "null");
    for (; theClass && theClass !== CPViewClass; theClass = objj_msgSend(theClass, "superclass"))
    {
        var cachedAttributes = CachedThemeAttributes[class_getName(theClass)];
        if (cachedAttributes)
        {
            attributes = attributes.length ? attributes.concat(cachedAttributes) : attributes;
            CachedThemeAttributes[objj_msgSend(self, "className")] = attributes;
            break;
        }
        var attributeDictionary = objj_msgSend(theClass, "themeAttributes");
        if (!attributeDictionary)
            continue;
        var attributeKeys = objj_msgSend(attributeDictionary, "allKeys"),
            attributeCount = attributeKeys.length;
        while (attributeCount--)
        {
            var attributeName = attributeKeys[attributeCount],
                attributeValue = objj_msgSend(attributeDictionary, "objectForKey:", attributeName);
            attributes.push(attributeValue === nullValue ? nil : attributeValue);
            attributes.push(attributeName);
        }
    }
    return attributes;
}
,["CPArray"])]);
}var CPViewAutoresizingMaskKey = "CPViewAutoresizingMask",
    CPViewAutoresizesSubviewsKey = "CPViewAutoresizesSubviews",
    CPViewBackgroundColorKey = "CPViewBackgroundColor",
    CPViewBoundsKey = "CPViewBoundsKey",
    CPViewFrameKey = "CPViewFrameKey",
    CPViewHitTestsKey = "CPViewHitTestsKey",
    CPViewToolTipKey = "CPViewToolTipKey",
    CPViewIsHiddenKey = "CPViewIsHiddenKey",
    CPViewOpacityKey = "CPViewOpacityKey",
    CPViewSubviewsKey = "CPViewSubviewsKey",
    CPViewSuperviewKey = "CPViewSuperviewKey",
    CPViewTagKey = "CPViewTagKey",
    CPViewThemeClassKey = "CPViewThemeClassKey",
    CPViewThemeStateKey = "CPViewThemeStateKey",
    CPViewWindowKey = "CPViewWindowKey",
    CPViewNextKeyViewKey = "CPViewNextKeyViewKey",
    CPViewPreviousKeyViewKey = "CPViewPreviousKeyViewKey",
    CPReuseIdentifierKey = "CPReuseIdentifierKey",
    CPViewScaleKey = "CPViewScaleKey",
    CPViewSizeScaleKey = "CPViewSizeScaleKey",
    CPViewIsScaledKey = "CPViewIsScaledKey";
{
var the_class = objj_getClass("CPView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPView__initWithCoder_(self, _cmd, aCoder)
{
    self._frame = objj_msgSend(aCoder, "decodeRectForKey:", CPViewFrameKey);
    self._bounds = objj_msgSend(aCoder, "decodeRectForKey:", CPViewBoundsKey);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._tag = objj_msgSend(aCoder, "containsValueForKey:", CPViewTagKey) ? objj_msgSend(aCoder, "decodeIntForKey:", CPViewTagKey) : -1;
        self._identifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPReuseIdentifierKey);
        self._window = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewWindowKey);
        self._superview = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewSuperviewKey);
        self._subviews = [];
        var subviews = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewSubviewsKey) || [];
        for (var i = 0, count = objj_msgSend(subviews, "count"); i < count; ++i)
        {
            subviews[i]._superview = nil;
            objj_msgSend(self, "addSubview:", subviews[i]);
        }
        self._registeredDraggedTypes = objj_msgSend(CPSet, "set");
        self._registeredDraggedTypesArray = [];
        if (self._autoresizingMask === nil)
            self._autoresizingMask = objj_msgSend(aCoder, "decodeIntForKey:", CPViewAutoresizingMaskKey) || CPViewNotSizable;
        self._autoresizesSubviews = !objj_msgSend(aCoder, "containsValueForKey:", CPViewAutoresizesSubviewsKey) || objj_msgSend(aCoder, "decodeBoolForKey:", CPViewAutoresizesSubviewsKey);
        self._hitTests = !objj_msgSend(aCoder, "containsValueForKey:", CPViewHitTestsKey) || objj_msgSend(aCoder, "decodeBoolForKey:", CPViewHitTestsKey);
        objj_msgSend(self, "_setupToolTipHandlers");
        self._toolTip = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewToolTipKey);
        if (self._toolTip)
            objj_msgSend(self, "_installToolTipEventHandlers");
        self._scaleSize = objj_msgSend(aCoder, "containsValueForKey:", CPViewScaleKey) ? objj_msgSend(aCoder, "decodeSizeForKey:", CPViewScaleKey) : CGSizeMake(1.0, 1.0);
        self._hierarchyScaleSize = objj_msgSend(aCoder, "containsValueForKey:", CPViewSizeScaleKey) ? objj_msgSend(aCoder, "decodeSizeForKey:", CPViewSizeScaleKey) : CGSizeMake(1.0, 1.0);
        self._isScaled = objj_msgSend(aCoder, "containsValueForKey:", CPViewIsScaledKey) ? objj_msgSend(aCoder, "decodeBoolForKey:", CPViewIsScaledKey) : NO;
        objj_msgSend(self, "setHidden:", objj_msgSend(aCoder, "decodeBoolForKey:", CPViewIsHiddenKey));
        if (objj_msgSend(aCoder, "containsValueForKey:", CPViewOpacityKey))
            objj_msgSend(self, "setAlphaValue:", objj_msgSend(aCoder, "decodeIntForKey:", CPViewOpacityKey));
        else
            self._opacity = 1.0;
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPViewBackgroundColorKey));
        objj_msgSend(self, "_setupViewFlags");
        self._theme = objj_msgSend(CPTheme, "defaultTheme");
        self._themeClass = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewThemeClassKey);
        self._themeState = CPThemeState(objj_msgSend(aCoder, "decodeObjectForKey:", CPViewThemeStateKey));
        self._themeAttributes = {};
        var theClass = objj_msgSend(self, "class"),
            themeClass = objj_msgSend(self, "themeClass"),
            attributes = objj_msgSend(theClass, "_themeAttributes"),
            count = attributes.length;
        while (count--)
        {
            var attributeName = attributes[count--];
            self._themeAttributes[attributeName] = CPThemeAttributeDecode(aCoder, attributeName, attributes[count], self._theme, themeClass);
        }
        objj_msgSend(self, "setNeedsDisplay:", YES);
        objj_msgSend(self, "setNeedsLayout");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "encodeWithCoder:", aCoder);
    if (self._tag !== -1)
        objj_msgSend(aCoder, "encodeInt:forKey:", self._tag, CPViewTagKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", self._frame, CPViewFrameKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", self._bounds, CPViewBoundsKey);
    if (self._window !== nil)
        objj_msgSend(aCoder, "encodeConditionalObject:forKey:", self._window, CPViewWindowKey);
    var count = objj_msgSend(self._subviews, "count"),
        encodedSubviews = self._subviews;
    if (count > 0 && objj_msgSend(self._ephemeralSubviews, "count") > 0)
    {
        encodedSubviews = objj_msgSend(encodedSubviews, "copy");
        while (count--)
            if (objj_msgSend(self._ephemeralSubviews, "containsObject:", encodedSubviews[count]))
                encodedSubviews.splice(count, 1);
    }
    if (encodedSubviews.length > 0)
        objj_msgSend(aCoder, "encodeObject:forKey:", encodedSubviews, CPViewSubviewsKey);
    if (self._superview !== nil)
        objj_msgSend(aCoder, "encodeConditionalObject:forKey:", self._superview, CPViewSuperviewKey);
    if (self._autoresizingMask !== CPViewNotSizable)
        objj_msgSend(aCoder, "encodeInt:forKey:", self._autoresizingMask, CPViewAutoresizingMaskKey);
    if (!self._autoresizesSubviews)
        objj_msgSend(aCoder, "encodeBool:forKey:", self._autoresizesSubviews, CPViewAutoresizesSubviewsKey);
    if (self._backgroundColor !== nil)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._backgroundColor, CPViewBackgroundColorKey);
    if (self._hitTests !== YES)
        objj_msgSend(aCoder, "encodeBool:forKey:", self._hitTests, CPViewHitTestsKey);
    if (self._opacity !== 1.0)
        objj_msgSend(aCoder, "encodeFloat:forKey:", self._opacity, CPViewOpacityKey);
    if (self._isHidden)
        objj_msgSend(aCoder, "encodeBool:forKey:", self._isHidden, CPViewIsHiddenKey);
    if (self._toolTip)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._toolTip, CPViewToolTipKey);
    var nextKeyView = objj_msgSend(self, "nextKeyView");
    if (nextKeyView !== nil && !objj_msgSend(nextKeyView, "isEqual:", self))
        objj_msgSend(aCoder, "encodeConditionalObject:forKey:", nextKeyView, CPViewNextKeyViewKey);
    var previousKeyView = objj_msgSend(self, "previousKeyView");
    if (previousKeyView !== nil && !objj_msgSend(previousKeyView, "isEqual:", self))
        objj_msgSend(aCoder, "encodeConditionalObject:forKey:", previousKeyView, CPViewPreviousKeyViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "themeClass"), CPViewThemeClassKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", String(self._themeState), CPViewThemeStateKey);
    for (var attributeName in self._themeAttributes)
        if (self._themeAttributes.hasOwnProperty(attributeName))
            CPThemeAttributeEncode(aCoder, self._themeAttributes[attributeName]);
    if (self._identifier)
        objj_msgSend(aCoder, "encodeObject:forKey:", self._identifier, CPReuseIdentifierKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", objj_msgSend(self, "scaleSize"), CPViewScaleKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", objj_msgSend(self, "_hierarchyScaleSize"), CPViewSizeScaleKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isScaled, CPViewIsScaledKey);
}
,["void","CPCoder"])]);
}var _CPViewFullScreenModeStateMake = function(aView)
{
    var superview = aView._superview;
    return {autoresizingMask: aView._autoresizingMask, frame: CGRectMakeCopy(aView._frame), index: superview ? objj_msgSend(superview._subviews, "indexOfObjectIdenticalTo:", aView) : 0, superview: superview};
};
var _CPViewGetTransform = function(fromView, toView)
{
    var transform = CGAffineTransformMakeIdentity(),
        sameWindow = YES,
        fromWindow = nil,
        toWindow = nil;
    if (fromView)
    {
        var view = fromView;
        while (view && view != toView)
        {
            var frame = view._frame;
            if (view._isScaled)
            {
                var affineZoom = CGAffineTransformMakeScale(view._scaleSize.width, view._scaleSize.height);
                CGAffineTransformConcatTo(transform, affineZoom, transform);
            }
            transform.tx += CGRectGetMinX(frame);
            transform.ty += CGRectGetMinY(frame);
            if (view._boundsTransform)
            {
                var inverseBoundsTransform = CGAffineTransformMakeCopy(view._boundsTransform);
                if (view._isScaled)
                {
                    var affineZoom = CGAffineTransformMakeScale(view._scaleSize.width, view._scaleSize.height);
                    CGAffineTransformConcatTo(inverseBoundsTransform, affineZoom, inverseBoundsTransform);
                }
                CGAffineTransformConcatTo(transform, inverseBoundsTransform, transform);
            }
            view = view._superview;
        }
        if (view === toView)
        {
            return transform;
        }
        else if (fromView && toView)
        {
            fromWindow = objj_msgSend(fromView, "window");
            toWindow = objj_msgSend(toView, "window");
            if (fromWindow && toWindow && fromWindow !== toWindow)
                sameWindow = NO;
        }
    }
    var view = toView,
        transform2 = CGAffineTransformMakeIdentity();
    while (view && view != fromView)
    {
        var frame = CGRectMakeCopy(view._frame);
        if (view._isScaled)
        {
            transform2.a *= 1 / view._scaleSize.width;
            transform2.d *= 1 / view._scaleSize.height;
        }
        transform2.tx += CGRectGetMinX(frame) * transform2.a;
        transform2.ty += CGRectGetMinY(frame) * transform2.d;
        if (view._boundsTransform)
        {
            var inverseBoundsTransform = CGAffineTransformMakeIdentity();
            inverseBoundsTransform.tx -= view._inverseBoundsTransform.tx * transform2.a;
            inverseBoundsTransform.ty -= view._inverseBoundsTransform.ty * transform2.d;
            CGAffineTransformConcatTo(transform2, inverseBoundsTransform, transform2);
        }
        view = view._superview;
    }
    transform2.tx = -transform2.tx;
    transform2.ty = -transform2.ty;
    if (view === fromView)
    {
        return transform2;
    }
    CGAffineTransformConcatTo(transform, transform2, transform);
    return transform;
    return transform;
};
