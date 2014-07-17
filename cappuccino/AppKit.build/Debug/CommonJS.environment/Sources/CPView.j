@STATIC;1.0;I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.jI;18;Foundation/CPSet.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.ji;20;CPWindow_Constants.ji;18;_CPDisplayServer.jt;98188;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPObjJRuntime.j", NO);objj_executeFile("Foundation/CPSet.j", NO);objj_executeFile("CGAffineTransform.j", YES);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPColor.j", YES);objj_executeFile("CPGraphicsContext.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPTheme.j", YES);objj_executeFile("CPWindow_Constants.j", YES);objj_executeFile("_CPDisplayServer.j", YES);CPViewNotSizable = 0;
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
    var theClass = self.isa.objj_msgSend0(self, "class"),
        classUID = (theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "UID"));
    if (CPViewFlags[classUID] === undefined)
    {
        var flags = 0;
        if ((theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instanceMethodForSelector:", sel_getUid("drawRect:"))) !== CPView.isa.objj_msgSend1(CPView, "instanceMethodForSelector:", sel_getUid("drawRect:")))
            flags |= CPViewHasCustomDrawRect;
        if ((theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "instanceMethodForSelector:", sel_getUid("layoutSubviews"))) !== CPView.isa.objj_msgSend1(CPView, "instanceMethodForSelector:", sel_getUid("layoutSubviews")))
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
        (_CPToolTip == null ? null : _CPToolTip.isa.objj_msgSend1(_CPToolTip, "scheduleToolTipForView:", self));
    };
    self._toolTipFunctionOut = function(e)
    {
        (_CPToolTip == null ? null : _CPToolTip.isa.objj_msgSend0(_CPToolTip, "invalidateCurrentToolTipIfNeeded"));
    };
}
,["void"]), new objj_method(sel_getUid("init"), function $CPView__init(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "initWithFrame:", CGRectMakeZero());
}
,["id"]), new objj_method(sel_getUid("initWithFrame:"), function $CPView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "init");
    if (self)
    {
        var width = CGRectGetWidth(aFrame),
            height = CGRectGetHeight(aFrame);
        self._subviews = [];
        self._registeredDraggedTypes = CPSet.isa.objj_msgSend0(CPSet, "set");
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
        self._theme = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme");
        self._themeState = CPThemeStateNormal;
        (self == null ? null : self.isa.objj_msgSend0(self, "_setupToolTipHandlers"));
        (self == null ? null : self.isa.objj_msgSend0(self, "_setupViewFlags"));
        (self == null ? null : self.isa.objj_msgSend0(self, "_loadThemeAttributes"));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setToolTip:"), function $CPView__setToolTip_(self, _cmd, aToolTip)
{
    if (self._toolTip == aToolTip)
        return;
    if (aToolTip && !(aToolTip == null ? null : aToolTip.isa.objj_msgSend1(aToolTip, "isKindOfClass:", CPString)))
        aToolTip = (aToolTip == null ? null : aToolTip.isa.objj_msgSend0(aToolTip, "description"));
    self._toolTip = aToolTip;
    if (self._toolTip)
        self.isa.objj_msgSend0(self, "_installToolTipEventHandlers");
    else
        self.isa.objj_msgSend0(self, "_uninstallToolTipEventHandlers");
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
    return ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("window"), function $CPView__window(self, _cmd)
{
    return self._window;
}
,["CPWindow"]), new objj_method(sel_getUid("addSubview:"), function $CPView__addSubview_(self, _cmd, aSubview)
{
    self.isa.objj_msgSend2(self, "_insertSubview:atIndex:", aSubview, CPNotFound);
}
,["void","CPView"]), new objj_method(sel_getUid("addSubview:positioned:relativeTo:"), function $CPView__addSubview_positioned_relativeTo_(self, _cmd, aSubview, anOrderingMode, anotherView)
{
    var index = anotherView ? ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", anotherView)) : CPNotFound;
    if (index === CPNotFound)
        index = anOrderingMode === CPWindowAbove ? ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) : 0;
    else if (anOrderingMode === CPWindowAbove)
        ++index;
    self.isa.objj_msgSend2(self, "_insertSubview:atIndex:", aSubview, index);
    var ___r1;
}
,["void","CPView","CPWindowOrderingMode","CPView"]), new objj_method(sel_getUid("_insertSubview:atIndex:"), function $CPView___insertSubview_atIndex_(self, _cmd, aSubview, anIndex)
{
    if (aSubview === self)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "can't add a view as a subview of itself");
    if (!aSubview._superview && self._subviews.indexOf(aSubview) !== CPNotFound)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "can't insert a subview in duplicate (probably partially decoded)");
    var count = self._subviews.length;
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_dirtyKeyViewLoop"));
    if (aSubview._superview == self)
    {
        var index = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aSubview));
        if (index === anIndex || index === count - 1 && anIndex === count)
            return;
        ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", index));
        if (anIndex > index)
            --anIndex;
        --count;
    }
    else
    {
        (aSubview == null ? null : aSubview.isa.objj_msgSend0(aSubview, "removeFromSuperview"));
        (aSubview == null ? null : aSubview.isa.objj_msgSend1(aSubview, "_setWindow:", self._window));
        (aSubview == null ? null : aSubview.isa.objj_msgSend1(aSubview, "viewWillMoveToSuperview:", self));
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
    (aSubview == null ? null : aSubview.isa.objj_msgSend1(aSubview, "setNextResponder:", self));
    (aSubview == null ? null : aSubview.isa.objj_msgSend1(aSubview, "_scaleSizeUnitSquareToSize:", self.isa.objj_msgSend0(self, "_hierarchyScaleSize")));
    if (!(aSubview == null ? null : aSubview.isa.objj_msgSend0(aSubview, "isHidden")) && self.isa.objj_msgSend0(self, "isHiddenOrHasHiddenAncestor"))
        (aSubview == null ? null : aSubview.isa.objj_msgSend0(aSubview, "_notifyViewDidHide"));
    if (self._themeState)
    {
        if (self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateFirstResponder))
            (aSubview == null ? null : aSubview.isa.objj_msgSend0(aSubview, "_notifyViewDidBecomeFirstResponder"));
        else
            (aSubview == null ? null : aSubview.isa.objj_msgSend0(aSubview, "_notifyViewDidResignFirstResponder"));
        if (self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateKeyWindow))
            (aSubview == null ? null : aSubview.isa.objj_msgSend0(aSubview, "_notifyWindowDidBecomeKey"));
        else
            (aSubview == null ? null : aSubview.isa.objj_msgSend0(aSubview, "_notifyWindowDidResignKey"));
    }
    (aSubview == null ? null : aSubview.isa.objj_msgSend0(aSubview, "viewDidMoveToSuperview"));
    self.isa.objj_msgSend1(self, "didAddSubview:", aSubview);
    var ___r1;
}
,["void","CPView","int"]), new objj_method(sel_getUid("didAddSubview:"), function $CPView__didAddSubview_(self, _cmd, aSubview)
{
}
,["void","CPView"]), new objj_method(sel_getUid("removeFromSuperview"), function $CPView__removeFromSuperview(self, _cmd)
{
    if (!self._superview)
        return;
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_dirtyKeyViewLoop"));
    ((___r1 = self._superview), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "willRemoveSubview:", self));
    ((___r1 = self._superview._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectIdenticalTo:", self));
    if (!self._isHidden && ((___r1 = self._superview), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHiddenOrHasHiddenAncestor")))
        self.isa.objj_msgSend0(self, "_notifyViewDidUnhide");
    self.isa.objj_msgSend0(self, "_notifyWindowDidResignKey");
    self.isa.objj_msgSend0(self, "_notifyViewDidResignFirstResponder");
    self._superview = nil;
    self.isa.objj_msgSend1(self, "_setWindow:", nil);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("replaceSubview:with:"), function $CPView__replaceSubview_with_(self, _cmd, aSubview, aView)
{
    if (aSubview._superview !== self)
        return;
    var index = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aSubview));
    (aSubview == null ? null : aSubview.isa.objj_msgSend0(aSubview, "removeFromSuperview"));
    self.isa.objj_msgSend2(self, "_insertSubview:atIndex:", aView, index);
    var ___r1;
}
,["void","CPView","CPView"]), new objj_method(sel_getUid("setSubviews:"), function $CPView__setSubviews_(self, _cmd, newSubviews)
{
    if (!newSubviews)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "newSubviews cannot be nil in -[CPView setSubviews:]");
    if (((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", newSubviews)))
        return;
    if (((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) === 0)
    {
        var index = 0,
            count = (newSubviews == null ? null : newSubviews.isa.objj_msgSend0(newSubviews, "count"));
        for (; index < count; ++index)
            self.isa.objj_msgSend1(self, "addSubview:", newSubviews[index]);
        return;
    }
    if ((newSubviews == null ? null : newSubviews.isa.objj_msgSend0(newSubviews, "count")) === 0)
    {
        var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        while (count--)
            ((___r1 = self._subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        return;
    }
    var removedSubviews = CPMutableSet.isa.objj_msgSend1(CPMutableSet, "setWithArray:", self._subviews);
    (removedSubviews == null ? null : removedSubviews.isa.objj_msgSend1(removedSubviews, "removeObjectsInArray:", newSubviews));
    (removedSubviews == null ? null : removedSubviews.isa.objj_msgSend1(removedSubviews, "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview")));
    var addedSubviews = CPMutableSet.isa.objj_msgSend1(CPMutableSet, "setWithArray:", newSubviews);
    (addedSubviews == null ? null : addedSubviews.isa.objj_msgSend1(addedSubviews, "removeObjectsInArray:", self._subviews));
    var addedSubview = nil,
        addedSubviewEnumerator = (addedSubviews == null ? null : addedSubviews.isa.objj_msgSend0(addedSubviews, "objectEnumerator"));
    while ((addedSubview = (addedSubviewEnumerator == null ? null : addedSubviewEnumerator.isa.objj_msgSend0(addedSubviewEnumerator, "nextObject"))) !== nil)
        self.isa.objj_msgSend1(self, "addSubview:", addedSubview);
    if (((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", newSubviews)))
        return;
    self._subviews = (newSubviews == null ? null : newSubviews.isa.objj_msgSend0(newSubviews, "copy"));
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("_setWindow:"), function $CPView___setWindow_(self, _cmd, aWindow)
{
    if (self._window === aWindow)
        return;
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_dirtyKeyViewLoop"));
    if (((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) === self)
        ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", nil));
    self.isa.objj_msgSend1(self, "viewWillMoveToWindow:", aWindow);
    if (self._registeredDraggedTypes)
    {
        ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_noteUnregisteredDraggedTypes:", self._registeredDraggedTypes));
        (aWindow == null ? null : aWindow.isa.objj_msgSend1(aWindow, "_noteRegisteredDraggedTypes:", self._registeredDraggedTypes));
    }
    self._window = aWindow;
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setWindow:", aWindow));
    if (((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isKeyWindow")))
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateKeyWindow);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateKeyWindow);
    self.isa.objj_msgSend0(self, "viewDidMoveToWindow");
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_dirtyKeyViewLoop"));
    var ___r1;
}
,["void","CPWindow"]), new objj_method(sel_getUid("isDescendantOf:"), function $CPView__isDescendantOf_(self, _cmd, aView)
{
    var view = self;
    do
    {
        if (view == aView)
            return YES;
    }
    while (view = (view == null ? null : view.isa.objj_msgSend0(view, "superview")));
    return NO;
}
,["BOOL","CPView"]), new objj_method(sel_getUid("viewDidMoveToSuperview"), function $CPView__viewDidMoveToSuperview(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
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
    while (view && !(view == null ? null : view.isa.objj_msgSend1(view, "isKindOfClass:", (_CPMenuItemView == null ? null : _CPMenuItemView.isa.objj_msgSend0(_CPMenuItemView, "class")))))
        view = (view == null ? null : view.isa.objj_msgSend0(view, "superview"));
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
    if (self.isa.objj_msgSend0(self, "tag") == aTag)
        return self;
    var index = 0,
        count = self._subviews.length;
    for (; index < count; ++index)
    {
        var view = ((___r1 = self._subviews[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "viewWithTag:", aTag));
        if (view)
            return view;
    }
    return nil;
    var ___r1;
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
    self.isa.objj_msgSend1(self, "setFrameOrigin:", aFrame.origin);
    self.isa.objj_msgSend1(self, "setFrameSize:", aFrame.size);
    self._inhibitFrameAndBoundsChangedNotifications = NO;
    if (self._postsFrameChangedNotifications)
        (CachedNotificationCenter == null ? null : CachedNotificationCenter.isa.objj_msgSend2(CachedNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self));
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
    self.isa.objj_msgSend1(self, "setFrameOrigin:", CGPointMake(aPoint.x - self._frame.size.width / 2.0, aPoint.y - self._frame.size.height / 2.0));
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
        (CachedNotificationCenter == null ? null : CachedNotificationCenter.isa.objj_msgSend2(CachedNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self));
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
        ((___r1 = self._layer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_owningViewBoundsChanged"));
    if (self._autoresizesSubviews)
        self.isa.objj_msgSend1(self, "resizeSubviewsWithOldSize:", oldSize);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    if (self._postsFrameChangedNotifications && !self._inhibitFrameAndBoundsChangedNotifications)
        (CachedNotificationCenter == null ? null : CachedNotificationCenter.isa.objj_msgSend2(CachedNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self));
    var ___r1;
}
,["void","CGSize"]), new objj_method(sel_getUid("_setDisplayServerSetStyleSize:"), function $CPView___setDisplayServerSetStyleSize_(self, _cmd, aSize)
{
}
,["void","CGSize"]), new objj_method(sel_getUid("setBounds:"), function $CPView__setBounds_(self, _cmd, bounds)
{
    if (CGRectEqualToRect(self._bounds, bounds))
        return;
    self._inhibitFrameAndBoundsChangedNotifications = YES;
    self.isa.objj_msgSend1(self, "setBoundsOrigin:", bounds.origin);
    self.isa.objj_msgSend1(self, "setBoundsSize:", bounds.size);
    self._inhibitFrameAndBoundsChangedNotifications = NO;
    if (self._postsBoundsChangedNotifications)
        (CachedNotificationCenter == null ? null : CachedNotificationCenter.isa.objj_msgSend2(CachedNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self));
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
        (CachedNotificationCenter == null ? null : CachedNotificationCenter.isa.objj_msgSend2(CachedNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self));
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
        (CachedNotificationCenter == null ? null : CachedNotificationCenter.isa.objj_msgSend2(CachedNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self));
}
,["void","CGSize"]), new objj_method(sel_getUid("resizeWithOldSuperviewSize:"), function $CPView__resizeWithOldSuperviewSize_(self, _cmd, aSize)
{
    var mask = self.isa.objj_msgSend0(self, "autoresizingMask");
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
    self.isa.objj_msgSend1(self, "setFrame:", newFrame);
}
,["void","CGSize"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
    var count = self._subviews.length;
    while (count--)
        ((___r1 = self._subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "resizeWithOldSuperviewSize:", aSize));
    var ___r1;
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
    return self.isa.objj_msgSend2(self, "enterFullScreenMode:withOptions:", nil, nil);
}
,["BOOL"]), new objj_method(sel_getUid("enterFullScreenMode:withOptions:"), function $CPView__enterFullScreenMode_withOptions_(self, _cmd, aScreen, options)
{
    self._fullScreenModeState = _CPViewFullScreenModeStateMake(self);
    var fullScreenWindow = ((___r1 = (CPWindow == null ? null : CPWindow.isa.objj_msgSend0(CPWindow, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", ((___r2 = (CPPlatformWindow == null ? null : CPPlatformWindow.isa.objj_msgSend0(CPPlatformWindow, "primaryPlatformWindow"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentBounds")), CPBorderlessWindowMask));
    (fullScreenWindow == null ? null : fullScreenWindow.isa.objj_msgSend1(fullScreenWindow, "setLevel:", CPScreenSaverWindowLevel));
    (fullScreenWindow == null ? null : fullScreenWindow.isa.objj_msgSend1(fullScreenWindow, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    var contentView = (fullScreenWindow == null ? null : fullScreenWindow.isa.objj_msgSend0(fullScreenWindow, "contentView"));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self));
    self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    self.isa.objj_msgSend1(self, "setFrame:", CGRectMakeCopy((contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "bounds"))));
    (fullScreenWindow == null ? null : fullScreenWindow.isa.objj_msgSend1(fullScreenWindow, "makeKeyAndOrderFront:", self));
    (fullScreenWindow == null ? null : fullScreenWindow.isa.objj_msgSend1(fullScreenWindow, "makeFirstResponder:", self));
    self._isInFullScreenMode = YES;
    return YES;
    var ___r1, ___r2;
}
,["BOOL","CPScreen","CPDictionary"]), new objj_method(sel_getUid("exitFullScreenMode"), function $CPView__exitFullScreenMode(self, _cmd)
{
    self.isa.objj_msgSend1(self, "exitFullScreenModeWithOptions:", nil);
}
,["void"]), new objj_method(sel_getUid("exitFullScreenModeWithOptions:"), function $CPView__exitFullScreenModeWithOptions_(self, _cmd, options)
{
    if (!self._isInFullScreenMode)
        return;
    self._isInFullScreenMode = NO;
    self.isa.objj_msgSend1(self, "setFrame:", self._fullScreenModeState.frame);
    self.isa.objj_msgSend1(self, "setAutoresizingMask:", self._fullScreenModeState.autoresizingMask);
    ((___r1 = self._fullScreenModeState.superview), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_insertSubview:atIndex:", self, self._fullScreenModeState.index));
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderOut:", self));
    var ___r1;
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
        var view = ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder"));
        if ((view == null ? null : view.isa.objj_msgSend1(view, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))))
        {
            do
            {
                if (self == view)
                {
                    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self.isa.objj_msgSend0(self, "nextValidKeyView")));
                    break;
                }
            }
            while (view = (view == null ? null : view.isa.objj_msgSend0(view, "superview")));
        }
        self.isa.objj_msgSend0(self, "_notifyViewDidHide");
    }
    else
    {
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
        self.isa.objj_msgSend0(self, "_notifyViewDidUnhide");
    }
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("_notifyViewDidHide"), function $CPView___notifyViewDidHide(self, _cmd)
{
    self.isa.objj_msgSend0(self, "viewDidHide");
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_notifyViewDidHide"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_notifyViewDidUnhide"), function $CPView___notifyViewDidUnhide(self, _cmd)
{
    self.isa.objj_msgSend0(self, "viewDidUnhide");
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_notifyViewDidUnhide"));
    var ___r1;
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
    while (view && !(view == null ? null : view.isa.objj_msgSend0(view, "isHidden")))
        view = (view == null ? null : view.isa.objj_msgSend0(view, "superview"));
    return view !== nil;
}
,["BOOL"]), new objj_method(sel_getUid("_isVisible"), function $CPView___isVisible(self, _cmd)
{
    return !self.isa.objj_msgSend0(self, "isHiddenOrHasHiddenAncestor") && ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible"));
    var ___r1;
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
        sizeScale = self.isa.objj_msgSend0(self, "_hierarchyScaleSize");
    if (self._isScaled)
        frame = CGRectApplyAffineTransform(self._frame, CGAffineTransformMakeScale(((___r1 = self._superview), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_hierarchyScaleSize")).width, ((___r1 = self._superview), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_hierarchyScaleSize")).height));
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
            affineTransform.tx *= ((___r1 = self._superview), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_hierarchyScaleSize")).width;
            affineTransform.ty *= ((___r1 = self._superview), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_hierarchyScaleSize")).height;
        }
        else
        {
            affineTransform.tx *= sizeScale.width;
            affineTransform.ty *= sizeScale.height;
        }
        adjustedPoint = CGPointApplyAffineTransform(adjustedPoint, affineTransform);
    }
    while (i--)
        if (view = ((___r1 = self._subviews[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "hitTest:", adjustedPoint)))
            return view;
    return self;
    var ___r1;
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("needsPanelToBecomeKey"), function $CPView__needsPanelToBecomeKey(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("mouseDownCanMoveWindow"), function $CPView__mouseDownCanMoveWindow(self, _cmd)
{
    return !self.isa.objj_msgSend0(self, "isOpaque");
}
,["BOOL"]), new objj_method(sel_getUid("mouseDown:"), function $CPView__mouseDown_(self, _cmd, anEvent)
{
    if (self.isa.objj_msgSend0(self, "mouseDownCanMoveWindow"))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "mouseDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("rightMouseDown:"), function $CPView__rightMouseDown_(self, _cmd, anEvent)
{
    var menu = self.isa.objj_msgSend1(self, "menuForEvent:", anEvent);
    if (menu)
        (CPMenu == null ? null : CPMenu.isa.objj_msgSend3(CPMenu, "popUpContextMenu:withEvent:forView:", menu, anEvent, self));
    else if (((___r1 = self.isa.objj_msgSend0(self, "nextResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPView)))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "rightMouseDown:", anEvent);
    else
        ((___r1 = ((___r2 = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateContextMenuDOMEvent:", YES));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("menuForEvent:"), function $CPView__menuForEvent_(self, _cmd, anEvent)
{
    return self.isa.objj_msgSend0(self, "menu") || ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultMenu"));
    var ___r1;
}
,["CPMenu","CPEvent"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPView__setBackgroundColor_(self, _cmd, aColor)
{
    if (self._backgroundColor == aColor)
        return;
    if (aColor == CPNull.isa.objj_msgSend0(CPNull, "null"))
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
    return self.isa.objj_msgSend2(self, "convertPoint:fromView:", aPoint, nil);
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertPoint:toView:"), function $CPView__convertPoint_toView_(self, _cmd, aPoint, aView)
{
    if (aView === self)
        return aPoint;
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(self, aView));
}
,["CGPoint","CGPoint","CPView"]), new objj_method(sel_getUid("convertPointToBase:"), function $CPView__convertPointToBase_(self, _cmd, aPoint)
{
    return self.isa.objj_msgSend2(self, "convertPoint:toView:", aPoint, nil);
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
    return self.isa.objj_msgSend2(self, "convertRect:fromView:", aRect, nil);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("convertRect:toView:"), function $CPView__convertRect_toView_(self, _cmd, aRect, aView)
{
    if (self === aView)
        return aRect;
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(self, aView));
}
,["CGRect","CGRect","CPView"]), new objj_method(sel_getUid("convertRectToBase:"), function $CPView__convertRectToBase_(self, _cmd, aRect)
{
    return self.isa.objj_msgSend2(self, "convertRect:toView:", aRect, nil);
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
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "dragImage:at:offset:event:pasteboard:source:slideBack:", anImage, self.isa.objj_msgSend2(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack));
    var ___r1;
}
,["void","CPImage","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"), function $CPView__dragView_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "dragView:at:offset:event:pasteboard:source:slideBack:", aView, self.isa.objj_msgSend2(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack));
    var ___r1;
}
,["void","CPView","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("registerForDraggedTypes:"), function $CPView__registerForDraggedTypes_(self, _cmd, pasteboardTypes)
{
    if (!pasteboardTypes || !(pasteboardTypes == null ? null : pasteboardTypes.isa.objj_msgSend0(pasteboardTypes, "count")))
        return;
    var theWindow = self.isa.objj_msgSend0(self, "window");
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "_noteUnregisteredDraggedTypes:", self._registeredDraggedTypes));
    ((___r1 = self._registeredDraggedTypes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObjectsFromArray:", pasteboardTypes));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "_noteRegisteredDraggedTypes:", self._registeredDraggedTypes));
    self._registeredDraggedTypesArray = nil;
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("registeredDraggedTypes"), function $CPView__registeredDraggedTypes(self, _cmd)
{
    if (!self._registeredDraggedTypesArray)
        self._registeredDraggedTypesArray = ((___r1 = self._registeredDraggedTypes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allObjects"));
    return self._registeredDraggedTypesArray;
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("unregisterDraggedTypes"), function $CPView__unregisterDraggedTypes(self, _cmd)
{
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_noteUnregisteredDraggedTypes:", self._registeredDraggedTypes));
    self._registeredDraggedTypes = CPSet.isa.objj_msgSend0(CPSet, "set");
    self._registeredDraggedTypesArray = [];
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("drawRect:"), function $CPView__drawRect_(self, _cmd, aRect)
{
}
,["void","CGRect"]), new objj_method(sel_getUid("scaleUnitSquareToSize:"), function $CPView__scaleUnitSquareToSize_(self, _cmd, aSize)
{
    if (!aSize)
        return;
    var bounds = CGRectMakeCopy(self.isa.objj_msgSend0(self, "bounds"));
    bounds.size.width *= self._scaleSize.width;
    bounds.size.height *= self._scaleSize.height;
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "scaleSize");
    self._scaleSize = CGSizeMakeCopy(self.isa.objj_msgSend0(self, "scaleSize"));
    self._scaleSize.height *= aSize.height;
    self._scaleSize.width *= aSize.width;
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "scaleSize");
    self._isScaled = YES;
    self._hierarchyScaleSize = CGSizeMakeCopy(self.isa.objj_msgSend0(self, "_hierarchyScaleSize"));
    self._hierarchyScaleSize.height *= aSize.height;
    self._hierarchyScaleSize.width *= aSize.width;
    var scaleAffine = CGAffineTransformMakeScale(1.0 / self._scaleSize.width, 1.0 / self._scaleSize.height),
        newBounds = CGRectApplyAffineTransform(CGRectMakeCopy(bounds), scaleAffine);
    self.isa.objj_msgSend1(self, "setBounds:", newBounds);
    ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("_scaleSizeUnitSquareToSize:"), aSize));
    var ___r1;
}
,["void","CGSize"]), new objj_method(sel_getUid("_scaleSizeUnitSquareToSize:"), function $CPView___scaleSizeUnitSquareToSize_(self, _cmd, aSize)
{
    self._hierarchyScaleSize = CGSizeMakeCopy(((___r1 = self._superview), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_hierarchyScaleSize")));
    if (self._isScaled)
    {
        self._hierarchyScaleSize.width *= self._scaleSize.width;
        self._hierarchyScaleSize.height *= self._scaleSize.height;
    }
    ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("_scaleSizeUnitSquareToSize:"), aSize));
    var ___r1;
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
        self.isa.objj_msgSend0(self, "_applyCSSScalingTranformations");
        self.isa.objj_msgSend1(self, "setNeedsDisplayInRect:", self.isa.objj_msgSend0(self, "bounds"));
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
    if (self.isa.objj_msgSend0(self, "needsDisplay"))
        self.isa.objj_msgSend1(self, "displayRect:", self._dirtyRect);
}
,["void"]), new objj_method(sel_getUid("display"), function $CPView__display(self, _cmd)
{
    self.isa.objj_msgSend1(self, "displayRect:", self.isa.objj_msgSend0(self, "visibleRect"));
}
,["void"]), new objj_method(sel_getUid("displayIfNeededInRect:"), function $CPView__displayIfNeededInRect_(self, _cmd, aRect)
{
    if (self.isa.objj_msgSend0(self, "needsDisplay"))
        self.isa.objj_msgSend1(self, "displayRect:", aRect);
}
,["void","CGRect"]), new objj_method(sel_getUid("displayRect:"), function $CPView__displayRect_(self, _cmd, aRect)
{
    self.isa.objj_msgSend0(self, "viewWillDraw");
    self.isa.objj_msgSend2(self, "displayRectIgnoringOpacity:inContext:", aRect, nil);
    self._dirtyRect = NULL;
}
,["void","CGRect"]), new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"), function $CPView__displayRectIgnoringOpacity_inContext_(self, _cmd, aRect, aGraphicsContext)
{
    if (self.isa.objj_msgSend0(self, "isHidden"))
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
        self._graphicsContext = CPGraphicsContext.isa.objj_msgSend2(CPGraphicsContext, "graphicsContextWithGraphicsPort:flipped:", graphicsPort, YES);
    }
    CPGraphicsContext.isa.objj_msgSend1(CPGraphicsContext, "setCurrentContext:", self._graphicsContext);
    CGContextSaveGState(((___r1 = self._graphicsContext), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("unlockFocus"), function $CPView__unlockFocus(self, _cmd)
{
    CGContextRestoreGState(((___r1 = self._graphicsContext), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")));
    CPGraphicsContext.isa.objj_msgSend1(CPGraphicsContext, "setCurrentContext:", nil);
    var ___r1;
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
        self.isa.objj_msgSend0(self, "layoutSubviews");
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
    return CGRectIntersection(self.isa.objj_msgSend2(self, "convertRect:fromView:", ((___r1 = self._superview), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleRect")), self._superview), self._bounds);
    var ___r1;
}
,["CGRect"]), new objj_method(sel_getUid("_enclosingClipView"), function $CPView___enclosingClipView(self, _cmd)
{
    var superview = self._superview,
        clipViewClass = (CPClipView == null ? null : CPClipView.isa.objj_msgSend0(CPClipView, "class"));
    while (superview && !(superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", clipViewClass)))
        superview = superview._superview;
    return superview;
}
,["CPScrollView"]), new objj_method(sel_getUid("scrollPoint:"), function $CPView__scrollPoint_(self, _cmd, aPoint)
{
    var clipView = self.isa.objj_msgSend0(self, "_enclosingClipView");
    if (!clipView)
        return;
    (clipView == null ? null : clipView.isa.objj_msgSend1(clipView, "scrollToPoint:", self.isa.objj_msgSend2(self, "convertPoint:toView:", aPoint, clipView)));
}
,["void","CGPoint"]), new objj_method(sel_getUid("scrollRectToVisible:"), function $CPView__scrollRectToVisible_(self, _cmd, aRect)
{
    aRect = CGRectIntersection(aRect, self._bounds);
    if (CGRectIsEmpty(aRect))
        return NO;
    var enclosingClipView = self.isa.objj_msgSend0(self, "_enclosingClipView");
    if (!enclosingClipView)
        return NO;
    var documentView = (enclosingClipView == null ? null : enclosingClipView.isa.objj_msgSend0(enclosingClipView, "documentView"));
    if (!documentView)
        return NO;
    var documentViewVisibleRect = (documentView == null ? null : documentView.isa.objj_msgSend0(documentView, "visibleRect")),
        rectInDocumentView = self.isa.objj_msgSend2(self, "convertRect:toView:", aRect, documentView);
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
    (enclosingClipView == null ? null : enclosingClipView.isa.objj_msgSend1(enclosingClipView, "scrollToPoint:", scrollPoint));
    return YES;
}
,["BOOL","CGRect"]), new objj_method(sel_getUid("autoscroll:"), function $CPView__autoscroll_(self, _cmd, anEvent)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "superview")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "autoscroll:", anEvent));
    var ___r1;
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
        scrollViewClass = (CPScrollView == null ? null : CPScrollView.isa.objj_msgSend0(CPScrollView, "class"));
    while (superview && !(superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", scrollViewClass)))
        superview = superview._superview;
    return superview;
}
,["CPScrollView"]), new objj_method(sel_getUid("scrollClipView:toPoint:"), function $CPView__scrollClipView_toPoint_(self, _cmd, aClipView, aPoint)
{
    (aClipView == null ? null : aClipView.isa.objj_msgSend1(aClipView, "scrollToPoint:", aPoint));
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
    if (self !== CPView.isa.objj_msgSend0(CPView, "class"))
        return;
    CachedNotificationCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
}
,["void"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPView___binderClassForBinding_(self, _cmd, aBinding)
{
    if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPHiddenBinding)))
        return (CPMultipleValueOrBinding == null ? null : CPMultipleValueOrBinding.isa.objj_msgSend0(CPMultipleValueOrBinding, "class"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPView").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"]), new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"), function $CPView__keyPathsForValuesAffectingFrame(self, _cmd)
{
    return CPSet.isa.objj_msgSend2(CPSet, "setWithObjects:", "frameOrigin", "frameSize");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingBounds"), function $CPView__keyPathsForValuesAffectingBounds(self, _cmd)
{
    return CPSet.isa.objj_msgSend2(CPSet, "setWithObjects:", "boundsOrigin", "boundsSize");
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
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        if (((___r1 = self._subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performKeyEquivalent:", anEvent)))
            return YES;
    return NO;
    var ___r1;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("canBecomeKeyView"), function $CPView__canBecomeKeyView(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "acceptsFirstResponder") && !self.isa.objj_msgSend0(self, "isHiddenOrHasHiddenAncestor");
}
,["BOOL"]), new objj_method(sel_getUid("nextKeyView"), function $CPView__nextKeyView(self, _cmd)
{
    return self._nextKeyView;
}
,["CPView"]), new objj_method(sel_getUid("nextValidKeyView"), function $CPView__nextValidKeyView(self, _cmd)
{
    var result = self.isa.objj_msgSend0(self, "nextKeyView"),
        resultUID = (result == null ? null : result.isa.objj_msgSend0(result, "UID")),
        unsuitableResults = {};
    while (result && !(result == null ? null : result.isa.objj_msgSend0(result, "canBecomeKeyView")))
    {
        unsuitableResults[resultUID] = 1;
        result = (result == null ? null : result.isa.objj_msgSend0(result, "nextKeyView"));
        resultUID = (result == null ? null : result.isa.objj_msgSend0(result, "UID"));
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
    var result = self.isa.objj_msgSend0(self, "previousKeyView"),
        firstResult = result;
    while (result && !(result == null ? null : result.isa.objj_msgSend0(result, "canBecomeKeyView")))
    {
        result = (result == null ? null : result.isa.objj_msgSend0(result, "previousKeyView"));
        if (result === firstResult)
            return nil;
    }
    return result;
}
,["CPView"]), new objj_method(sel_getUid("_setPreviousKeyView:"), function $CPView___setPreviousKeyView_(self, _cmd, previous)
{
    if (!(previous == null ? null : previous.isa.objj_msgSend1(previous, "isEqual:", self)))
    {
        var previousWindow = (previous == null ? null : previous.isa.objj_msgSend0(previous, "window"));
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
    if (!(next == null ? null : next.isa.objj_msgSend1(next, "isEqual:", self)))
    {
        var nextWindow = (next == null ? null : next.isa.objj_msgSend0(next, "window"));
        if (!nextWindow || nextWindow === self._window)
        {
            self._nextKeyView = next;
            ((___r1 = self._nextKeyView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setPreviousKeyView:", self));
            return;
        }
    }
    self._nextKeyView = nil;
    var ___r1;
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
        var bounds = CGRectMakeCopy(self.isa.objj_msgSend0(self, "bounds"));
        ((___r1 = self._layer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setOwningView:", self));
    }
    var ___r1;
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
        scale = CGSizeMakeCopy(self.isa.objj_msgSend0(self, "scaleSize"));
    size.height = aSize.height / scale.height;
    size.width = aSize.width / scale.width;
    self.isa.objj_msgSend1(self, "scaleUnitSquareToSize:", size);
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
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
    if (aState.isa && (aState == null ? null : aState.isa.objj_msgSend1(aState, "isKindOfClass:", CPArray)))
        return self._themeState.hasThemeState.apply(self._themeState, aState);
    return self._themeState.hasThemeState(aState);
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("setThemeState:"), function $CPView__setThemeState_(self, _cmd, aState)
{
    if (aState && aState.isa && (aState == null ? null : aState.isa.objj_msgSend1(aState, "isKindOfClass:", CPArray)))
        aState = CPThemeState.apply(null, aState);
    if (self._themeState.hasThemeState(aState))
        return NO;
    self._themeState = CPThemeState(self._themeState, aState);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    return YES;
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("unsetThemeState:"), function $CPView__unsetThemeState_(self, _cmd, aState)
{
    if (aState && aState.isa && (aState == null ? null : aState.isa.objj_msgSend1(aState, "isKindOfClass:", CPArray)))
        aState = CPThemeState.apply(null, aState);
    var oldThemeState = self._themeState;
    self._themeState = self._themeState.without(aState);
    if (oldThemeState === self._themeState)
        return NO;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    return YES;
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("becomeFirstResponder"), function $CPView__becomeFirstResponder(self, _cmd)
{
    var r = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "becomeFirstResponder");
    if (r)
        self.isa.objj_msgSend0(self, "_notifyViewDidBecomeFirstResponder");
    return r;
}
,["BOOL"]), new objj_method(sel_getUid("_notifyViewDidBecomeFirstResponder"), function $CPView___notifyViewDidBecomeFirstResponder(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateFirstResponder);
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_notifyViewDidBecomeFirstResponder"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPView__resignFirstResponder(self, _cmd)
{
    var r = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "resignFirstResponder");
    if (r)
        self.isa.objj_msgSend0(self, "_notifyViewDidResignFirstResponder");
    return r;
}
,["BOOL"]), new objj_method(sel_getUid("_notifyViewDidResignFirstResponder"), function $CPView___notifyViewDidResignFirstResponder(self, _cmd)
{
    self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateFirstResponder);
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_notifyViewDidResignFirstResponder"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_notifyWindowDidBecomeKey"), function $CPView___notifyWindowDidBecomeKey(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateKeyWindow);
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_notifyWindowDidBecomeKey"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_notifyWindowDidResignKey"), function $CPView___notifyWindowDidResignKey(self, _cmd)
{
    self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateKeyWindow);
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_notifyWindowDidResignKey"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("themeClass"), function $CPView__themeClass(self, _cmd)
{
    if (self._themeClass)
        return self._themeClass;
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultThemeClass"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("setThemeClass:"), function $CPView__setThemeClass_(self, _cmd, theClass)
{
    self._themeClass = theClass;
    self.isa.objj_msgSend0(self, "_loadThemeAttributes");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPString"]), new objj_method(sel_getUid("_loadThemeAttributes"), function $CPView___loadThemeAttributes(self, _cmd)
{
    var theClass = self.isa.objj_msgSend0(self, "class"),
        attributes = (theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "_themeAttributes")),
        count = attributes.length;
    if (!count)
        return;
    var theme = self.isa.objj_msgSend0(self, "theme"),
        themeClass = self.isa.objj_msgSend0(self, "themeClass");
    self._themeAttributes = {};
    while (count--)
    {
        var attributeName = attributes[count--],
            attribute = ((___r1 = _CPThemeAttribute.isa.objj_msgSend0(_CPThemeAttribute, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithName:defaultValue:", attributeName, attributes[count]));
        (attribute == null ? null : attribute.isa.objj_msgSend1(attribute, "setParentAttribute:", (theme == null ? null : theme.isa.objj_msgSend2(theme, "attributeWithName:forClass:", attributeName, themeClass))));
        self._themeAttributes[attributeName] = attribute;
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setTheme:"), function $CPView__setTheme_(self, _cmd, aTheme)
{
    if (self._theme === aTheme)
        return;
    self._theme = aTheme;
    self.isa.objj_msgSend0(self, "viewDidChangeTheme");
}
,["void","CPTheme"]), new objj_method(sel_getUid("_setThemeIncludingDescendants:"), function $CPView___setThemeIncludingDescendants_(self, _cmd, aTheme)
{
    self.isa.objj_msgSend1(self, "setTheme:", aTheme);
    ((___r1 = self.isa.objj_msgSend0(self, "subviews")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("_setThemeIncludingDescendants:"), aTheme));
    var ___r1;
}
,["void","CPTheme"]), new objj_method(sel_getUid("theme"), function $CPView__theme(self, _cmd)
{
    return self._theme;
}
,["CPTheme"]), new objj_method(sel_getUid("viewDidChangeTheme"), function $CPView__viewDidChangeTheme(self, _cmd)
{
    if (!self._themeAttributes)
        return;
    var theme = self.isa.objj_msgSend0(self, "theme"),
        themeClass = self.isa.objj_msgSend0(self, "themeClass");
    for (var attributeName in self._themeAttributes)
        if (self._themeAttributes.hasOwnProperty(attributeName))
            ((___r1 = self._themeAttributes[attributeName]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setParentAttribute:", (theme == null ? null : theme.isa.objj_msgSend2(theme, "attributeWithName:forClass:", attributeName, themeClass))));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_themeAttributeDictionary"), function $CPView___themeAttributeDictionary(self, _cmd)
{
    var dictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    if (self._themeAttributes)
    {
        var theme = self.isa.objj_msgSend0(self, "theme");
        for (var attributeName in self._themeAttributes)
            if (self._themeAttributes.hasOwnProperty(attributeName))
                (dictionary == null ? null : dictionary.isa.objj_msgSend2(dictionary, "setObject:forKey:", self._themeAttributes[attributeName], attributeName));
    }
    return dictionary;
}
,["CPDictionary"]), new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"), function $CPView__setValue_forThemeAttribute_inState_(self, _cmd, aValue, aName, aState)
{
    if (aState.isa && (aState == null ? null : aState.isa.objj_msgSend1(aState, "isKindOfClass:", CPArray)))
        aState = CPThemeState.apply(null, aState);
    if (!self._themeAttributes || !self._themeAttributes[aName])
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, self.isa.objj_msgSend0(self, "className") + " does not contain theme attribute '" + aName + "'");
    var currentValue = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", aName);
    ((___r1 = self._themeAttributes[aName]), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forState:", aValue, aState));
    if (self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", aName) === currentValue)
        return;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","id","CPString","ThemeState"]), new objj_method(sel_getUid("setValue:forThemeAttribute:"), function $CPView__setValue_forThemeAttribute_(self, _cmd, aValue, aName)
{
    if (!self._themeAttributes || !self._themeAttributes[aName])
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, self.isa.objj_msgSend0(self, "className") + " does not contain theme attribute '" + aName + "'");
    var currentValue = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", aName);
    ((___r1 = self._themeAttributes[aName]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValue:", aValue));
    if (self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", aName) === currentValue)
        return;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForThemeAttribute:inState:"), function $CPView__valueForThemeAttribute_inState_(self, _cmd, aName, aState)
{
    if (aState.isa && (aState == null ? null : aState.isa.objj_msgSend1(aState, "isKindOfClass:", CPArray)))
        aState = CPThemeState.apply(null, aState);
    if (!self._themeAttributes || !self._themeAttributes[aName])
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, self.isa.objj_msgSend0(self, "className") + " does not contain theme attribute '" + aName + "'");
    return ((___r1 = self._themeAttributes[aName]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForState:", aState));
    var ___r1;
}
,["id","CPString","ThemeState"]), new objj_method(sel_getUid("valueForThemeAttribute:"), function $CPView__valueForThemeAttribute_(self, _cmd, aName)
{
    if (!self._themeAttributes || !self._themeAttributes[aName])
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, self.isa.objj_msgSend0(self, "className") + " does not contain theme attribute '" + aName + "'");
    return ((___r1 = self._themeAttributes[aName]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "value"));
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("currentValueForThemeAttribute:"), function $CPView__currentValueForThemeAttribute_(self, _cmd, aName)
{
    if (!self._themeAttributes || !self._themeAttributes[aName])
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, self.isa.objj_msgSend0(self, "className") + " does not contain theme attribute '" + aName + "'");
    return ((___r1 = self._themeAttributes[aName]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForState:", self._themeState));
    var ___r1;
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
            self.isa.objj_msgSend3(self, "setValue:forThemeAttribute:inState:", value, attribute, state);
        else
            self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", value, attribute);
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("registerThemeValues:inherit:"), function $CPView__registerThemeValues_inherit_(self, _cmd, themeValues, inheritedValues)
{
    if (inheritedValues)
        self.isa.objj_msgSend1(self, "registerThemeValues:", inheritedValues);
    if (themeValues)
        self.isa.objj_msgSend1(self, "registerThemeValues:", themeValues);
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
        self._ephemeralSubviews = CPSet.isa.objj_msgSend0(CPSet, "set");
    }
    var frame = self.isa.objj_msgSend1(self, "rectForEphemeralSubviewNamed:", aViewName);
    if (frame)
    {
        if (!self._ephemeralSubviewsForNames[aViewName])
        {
            self._ephemeralSubviewsForNames[aViewName] = self.isa.objj_msgSend1(self, "createEphemeralSubviewNamed:", aViewName);
            ((___r1 = self._ephemeralSubviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", self._ephemeralSubviewsForNames[aViewName]));
            if (self._ephemeralSubviewsForNames[aViewName])
                self.isa.objj_msgSend3(self, "addSubview:positioned:relativeTo:", self._ephemeralSubviewsForNames[aViewName], anOrderingMode, self._ephemeralSubviewsForNames[relativeToViewName]);
        }
        if (self._ephemeralSubviewsForNames[aViewName])
            ((___r1 = self._ephemeralSubviewsForNames[aViewName]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", frame));
    }
    else if (self._ephemeralSubviewsForNames[aViewName])
    {
        ((___r1 = self._ephemeralSubviewsForNames[aViewName]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        ((___r1 = self._ephemeralSubviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", self._ephemeralSubviewsForNames[aViewName]));
        delete self._ephemeralSubviewsForNames[aViewName];
    }
    return self._ephemeralSubviewsForNames[aViewName];
    var ___r1;
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
    var theClass = self.isa.objj_msgSend0(self, "class"),
        CPViewClass = CPView.isa.objj_msgSend0(CPView, "class"),
        attributes = [],
        nullValue = CPNull.isa.objj_msgSend0(CPNull, "null");
    for (; theClass && theClass !== CPViewClass; theClass = (theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "superclass")))
    {
        var cachedAttributes = CachedThemeAttributes[class_getName(theClass)];
        if (cachedAttributes)
        {
            attributes = attributes.length ? attributes.concat(cachedAttributes) : attributes;
            CachedThemeAttributes[self.isa.objj_msgSend0(self, "className")] = attributes;
            break;
        }
        var attributeDictionary = (theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "themeAttributes"));
        if (!attributeDictionary)
            continue;
        var attributeKeys = (attributeDictionary == null ? null : attributeDictionary.isa.objj_msgSend0(attributeDictionary, "allKeys")),
            attributeCount = attributeKeys.length;
        while (attributeCount--)
        {
            var attributeName = attributeKeys[attributeCount],
                attributeValue = (attributeDictionary == null ? null : attributeDictionary.isa.objj_msgSend1(attributeDictionary, "objectForKey:", attributeName));
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
    self._frame = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeRectForKey:", CPViewFrameKey));
    self._bounds = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeRectForKey:", CPViewBoundsKey));
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._tag = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPViewTagKey)) ? (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPViewTagKey)) : -1;
        self._identifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPReuseIdentifierKey));
        self._window = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPViewWindowKey));
        self._superview = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPViewSuperviewKey));
        self._subviews = [];
        var subviews = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPViewSubviewsKey)) || [];
        for (var i = 0, count = (subviews == null ? null : subviews.isa.objj_msgSend0(subviews, "count")); i < count; ++i)
        {
            subviews[i]._superview = nil;
            (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", subviews[i]));
        }
        self._registeredDraggedTypes = CPSet.isa.objj_msgSend0(CPSet, "set");
        self._registeredDraggedTypesArray = [];
        if (self._autoresizingMask === nil)
            self._autoresizingMask = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPViewAutoresizingMaskKey)) || CPViewNotSizable;
        self._autoresizesSubviews = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPViewAutoresizesSubviewsKey)) || (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPViewAutoresizesSubviewsKey));
        self._hitTests = !(aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPViewHitTestsKey)) || (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPViewHitTestsKey));
        (self == null ? null : self.isa.objj_msgSend0(self, "_setupToolTipHandlers"));
        self._toolTip = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPViewToolTipKey));
        if (self._toolTip)
            (self == null ? null : self.isa.objj_msgSend0(self, "_installToolTipEventHandlers"));
        self._scaleSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPViewScaleKey)) ? (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", CPViewScaleKey)) : CGSizeMake(1.0, 1.0);
        self._hierarchyScaleSize = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPViewSizeScaleKey)) ? (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeSizeForKey:", CPViewSizeScaleKey)) : CGSizeMake(1.0, 1.0);
        self._isScaled = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPViewIsScaledKey)) ? (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPViewIsScaledKey)) : NO;
        (self == null ? null : self.isa.objj_msgSend1(self, "setHidden:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPViewIsHiddenKey))));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPViewOpacityKey)))
            (self == null ? null : self.isa.objj_msgSend1(self, "setAlphaValue:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPViewOpacityKey))));
        else
            self._opacity = 1.0;
        (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColor:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPViewBackgroundColorKey))));
        (self == null ? null : self.isa.objj_msgSend0(self, "_setupViewFlags"));
        self._theme = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme");
        self._themeClass = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPViewThemeClassKey));
        self._themeState = CPThemeState((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPViewThemeStateKey)));
        self._themeAttributes = {};
        var theClass = (self == null ? null : self.isa.objj_msgSend0(self, "class")),
            themeClass = (self == null ? null : self.isa.objj_msgSend0(self, "themeClass")),
            attributes = (theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "_themeAttributes")),
            count = attributes.length;
        while (count--)
        {
            var attributeName = attributes[count--];
            self._themeAttributes[attributeName] = CPThemeAttributeDecode(aCoder, attributeName, attributes[count], self._theme, themeClass);
        }
        (self == null ? null : self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES));
        (self == null ? null : self.isa.objj_msgSend0(self, "setNeedsLayout"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView").super_class }, "encodeWithCoder:", aCoder);
    if (self._tag !== -1)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._tag, CPViewTagKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeRect:forKey:", self._frame, CPViewFrameKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeRect:forKey:", self._bounds, CPViewBoundsKey));
    if (self._window !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeConditionalObject:forKey:", self._window, CPViewWindowKey));
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        encodedSubviews = self._subviews;
    if (count > 0 && ((___r1 = self._ephemeralSubviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
    {
        encodedSubviews = (encodedSubviews == null ? null : encodedSubviews.isa.objj_msgSend0(encodedSubviews, "copy"));
        while (count--)
            if (((___r1 = self._ephemeralSubviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", encodedSubviews[count])))
                encodedSubviews.splice(count, 1);
    }
    if (encodedSubviews.length > 0)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", encodedSubviews, CPViewSubviewsKey));
    if (self._superview !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeConditionalObject:forKey:", self._superview, CPViewSuperviewKey));
    if (self._autoresizingMask !== CPViewNotSizable)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._autoresizingMask, CPViewAutoresizingMaskKey));
    if (!self._autoresizesSubviews)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._autoresizesSubviews, CPViewAutoresizesSubviewsKey));
    if (self._backgroundColor !== nil)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._backgroundColor, CPViewBackgroundColorKey));
    if (self._hitTests !== YES)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._hitTests, CPViewHitTestsKey));
    if (self._opacity !== 1.0)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._opacity, CPViewOpacityKey));
    if (self._isHidden)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isHidden, CPViewIsHiddenKey));
    if (self._toolTip)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._toolTip, CPViewToolTipKey));
    var nextKeyView = self.isa.objj_msgSend0(self, "nextKeyView");
    if (nextKeyView !== nil && !(nextKeyView == null ? null : nextKeyView.isa.objj_msgSend1(nextKeyView, "isEqual:", self)))
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeConditionalObject:forKey:", nextKeyView, CPViewNextKeyViewKey));
    var previousKeyView = self.isa.objj_msgSend0(self, "previousKeyView");
    if (previousKeyView !== nil && !(previousKeyView == null ? null : previousKeyView.isa.objj_msgSend1(previousKeyView, "isEqual:", self)))
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeConditionalObject:forKey:", previousKeyView, CPViewPreviousKeyViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "themeClass"), CPViewThemeClassKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", String(self._themeState), CPViewThemeStateKey));
    for (var attributeName in self._themeAttributes)
        if (self._themeAttributes.hasOwnProperty(attributeName))
            CPThemeAttributeEncode(aCoder, self._themeAttributes[attributeName]);
    if (self._identifier)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._identifier, CPReuseIdentifierKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeSize:forKey:", self.isa.objj_msgSend0(self, "scaleSize"), CPViewScaleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeSize:forKey:", self.isa.objj_msgSend0(self, "_hierarchyScaleSize"), CPViewSizeScaleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isScaled, CPViewIsScaledKey));
    var ___r1;
}
,["void","CPCoder"])]);
}var _CPViewFullScreenModeStateMake = function(aView)
{
    var superview = aView._superview;
    return {autoresizingMask: aView._autoresizingMask, frame: CGRectMakeCopy(aView._frame), index: superview ? ((___r1 = superview._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aView)) : 0, superview: superview};
    var ___r1;
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
            fromWindow = (fromView == null ? null : fromView.isa.objj_msgSend0(fromView, "window"));
            toWindow = (toView == null ? null : toView.isa.objj_msgSend0(toView, "window"));
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
