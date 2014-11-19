@STATIC;1.0;i;13;CPButtonBar.ji;9;CPImage.ji;8;CPView.ji;10;CPCursor.jt;55418;objj_executeFile("CPButtonBar.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPCursor.j", YES);{var the_protocol = objj_allocateProtocol("CPSplitViewDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPSplitViewDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}var CPSplitViewDelegate_splitView_canCollapseSubview_ = 1 << 0,
    CPSplitViewDelegate_splitView_shouldAdjustSizeOfSubview_ = 1 << 1,
    CPSplitViewDelegate_splitView_shouldCollapseSubview_forDoubleClickOnDividerAtIndex_ = 1 << 2,
    CPSplitViewDelegate_splitView_additionalEffectiveRectOfDividerAtIndex_ = 1 << 3,
    CPSplitViewDelegate_splitView_effectiveRect_forDrawnRect_ofDividerAtIndex_ = 1 << 4,
    CPSplitViewDelegate_splitView_constrainMaxCoordinate_ofSubviewAt_ = 1 << 5,
    CPSplitViewDelegate_splitView_constrainMinCoordinate_ofSubviewAt_ = 1 << 6,
    CPSplitViewDelegate_splitView_constrainSplitPosition_ofSubviewAt_ = 1 << 7,
    CPSplitViewDelegate_splitView_resizeSubviewsWithOldSize_ = 1 << 8;
CPSplitViewDidResizeSubviewsNotification = "CPSplitViewDidResizeSubviewsNotification";
CPSplitViewWillResizeSubviewsNotification = "CPSplitViewWillResizeSubviewsNotification";
var ShouldSuppressResizeNotifications = 1,
    DidPostWillResizeNotification = 1 << 1,
    DidSuppressResizeNotification = 1 << 2;
{var the_class = objj_allocateClassPair(CPView, "CPSplitView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_isVertical"), new objj_ivar("_isPaneSplitter"), new objj_ivar("_currentDivider"), new objj_ivar("_initialOffset"), new objj_ivar("_preCollapsePositions"), new objj_ivar("_originComponent"), new objj_ivar("_sizeComponent"), new objj_ivar("_DOMDividerElements"), new objj_ivar("_dividerImagePath"), new objj_ivar("_drawingDivider"), new objj_ivar("_autosaveName"), new objj_ivar("_shouldAutosave"), new objj_ivar("_shouldRestoreFromAutosaveUnlessFrameSize"), new objj_ivar("_needsResizeSubviews"), new objj_ivar("_suppressResizeNotificationsMask"), new objj_ivar("_buttonBars"), new objj_ivar("_implementedDelegateMethods")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPSplitView__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "initWithFrame:", aFrame))
    {
        self._suppressResizeNotificationsMask = 0;
        self._preCollapsePositions = CPMutableDictionary.isa.objj_msgSend0(CPMutableDictionary, "new");
        self._currentDivider = CPNotFound;
        self._DOMDividerElements = [];
        self._buttonBars = [];
        self._shouldAutosave = YES;
        (self == null ? null : self.isa.objj_msgSend1(self, "_setVertical:", YES));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("dividerThickness"), function $CPSplitView__dividerThickness(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", self.isa.objj_msgSend0(self, "isPaneSplitter") ? "pane-divider-thickness" : "divider-thickness");
}
,["float"]), new objj_method(sel_getUid("isVertical"), function $CPSplitView__isVertical(self, _cmd)
{
    return self._isVertical;
}
,["BOOL"]), new objj_method(sel_getUid("setVertical:"), function $CPSplitView__setVertical_(self, _cmd, shouldBeVertical)
{
    if (!self.isa.objj_msgSend1(self, "_setVertical:", shouldBeVertical))
        return;
    var frame = self.isa.objj_msgSend0(self, "frame"),
        dividerThickness = self.isa.objj_msgSend0(self, "dividerThickness");
    self.isa.objj_msgSend0(self, "_postNotificationWillResize");
    var eachSize = ROUND((frame.size[self._sizeComponent] - dividerThickness * (self._subviews.length - 1)) / self._subviews.length),
        index = 0,
        count = self._subviews.length;
    if (self.isa.objj_msgSend0(self, "isVertical"))
    {
        for (; index < count; ++index)
            ((___r1 = self._subviews[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(ROUND((eachSize + dividerThickness) * index), 0, eachSize, frame.size.height)));
    }
    else
    {
        for (; index < count; ++index)
            ((___r1 = self._subviews[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0, ROUND((eachSize + dividerThickness) * index), frame.size.width, eachSize)));
    }
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    self.isa.objj_msgSend0(self, "_postNotificationDidResize");
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("_setVertical:"), function $CPSplitView___setVertical_(self, _cmd, shouldBeVertical)
{
    var changed = self._isVertical != shouldBeVertical;
    self._isVertical = shouldBeVertical;
    self._originComponent = self.isa.objj_msgSend0(self, "isVertical") ? "x" : "y";
    self._sizeComponent = self.isa.objj_msgSend0(self, "isVertical") ? "width" : "height";
    self._dividerImagePath = self.isa.objj_msgSend0(self, "isVertical") ? ((___r1 = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "vertical-divider-color")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "filename")) : ((___r1 = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "horizontal-divider-color")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "filename"));
    return changed;
    var ___r1;
}
,["BOOL","BOOL"]), new objj_method(sel_getUid("isPaneSplitter"), function $CPSplitView__isPaneSplitter(self, _cmd)
{
    return self._isPaneSplitter;
}
,["BOOL"]), new objj_method(sel_getUid("setIsPaneSplitter:"), function $CPSplitView__setIsPaneSplitter_(self, _cmd, shouldBePaneSplitter)
{
    if (self._isPaneSplitter == shouldBePaneSplitter)
        return;
    self._isPaneSplitter = shouldBePaneSplitter;
    if (self._DOMDividerElements[self._drawingDivider])
        self.isa.objj_msgSend0(self, "_setupDOMDivider");
    self._needsResizeSubviews = YES;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","BOOL"]), new objj_method(sel_getUid("didAddSubview:"), function $CPSplitView__didAddSubview_(self, _cmd, aSubview)
{
    self._needsResizeSubviews = YES;
}
,["void","CPView"]), new objj_method(sel_getUid("isSubviewCollapsed:"), function $CPSplitView__isSubviewCollapsed_(self, _cmd, subview)
{
    return (subview == null ? null : subview.isa.objj_msgSend0(subview, "frame")).size[self._sizeComponent] < 1 ? YES : NO;
}
,["BOOL","CPView"]), new objj_method(sel_getUid("rectOfDividerAtIndex:"), function $CPSplitView__rectOfDividerAtIndex_(self, _cmd, aDivider)
{
    var frame = ((___r1 = self._subviews[aDivider]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        rect = CGRectMakeZero();
    rect.size = self.isa.objj_msgSend0(self, "frame").size;
    rect.size[self._sizeComponent] = self.isa.objj_msgSend0(self, "dividerThickness");
    rect.origin[self._originComponent] = frame.origin[self._originComponent] + frame.size[self._sizeComponent];
    return rect;
    var ___r1;
}
,["CGRect","int"]), new objj_method(sel_getUid("effectiveRectOfDividerAtIndex:"), function $CPSplitView__effectiveRectOfDividerAtIndex_(self, _cmd, aDivider)
{
    var realRect = self.isa.objj_msgSend1(self, "rectOfDividerAtIndex:", aDivider),
        padding = 2;
    realRect.size[self._sizeComponent] += padding * 2;
    realRect.origin[self._originComponent] -= padding;
    return realRect;
}
,["CGRect","int"]), new objj_method(sel_getUid("drawRect:"), function $CPSplitView__drawRect_(self, _cmd, rect)
{
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1;
    while (count-- > 0)
    {
        self._drawingDivider = count;
        self.isa.objj_msgSend1(self, "drawDividerInRect:", self.isa.objj_msgSend1(self, "rectOfDividerAtIndex:", count));
    }
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("willRemoveSubview:"), function $CPSplitView__willRemoveSubview_(self, _cmd, aView)
{
    self._needsResizeSubviews = YES;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPView"]), new objj_method(sel_getUid("layoutSubviews"), function $CPSplitView__layoutSubviews(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_adjustSubviewsWithCalculatedSize");
}
,["void"]), new objj_method(sel_getUid("drawDividerInRect:"), function $CPSplitView__drawDividerInRect_(self, _cmd, aRect)
{
}
,["void","CGRect"]), new objj_method(sel_getUid("_setupDOMDivider"), function $CPSplitView___setupDOMDivider(self, _cmd)
{
    if (self._isPaneSplitter)
    {
        self._DOMDividerElements[self._drawingDivider].style.backgroundColor = "";
        self._DOMDividerElements[self._drawingDivider].style.backgroundImage = "url('" + self._dividerImagePath + "')";
    }
    else
    {
        self._DOMDividerElements[self._drawingDivider].style.backgroundColor = ((___r1 = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "pane-divider-color")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cssString"));
        self._DOMDividerElements[self._drawingDivider].style.backgroundImage = "";
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("viewWillDraw"), function $CPSplitView__viewWillDraw(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_adjustSubviewsWithCalculatedSize");
}
,["void"]), new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"), function $CPSplitView___adjustSubviewsWithCalculatedSize(self, _cmd)
{
    if (!self._needsResizeSubviews)
        return;
    self._needsResizeSubviews = NO;
    self.isa.objj_msgSend1(self, "resizeSubviewsWithOldSize:", self.isa.objj_msgSend0(self, "_calculateSize"));
}
,["void"]), new objj_method(sel_getUid("_calculateSize"), function $CPSplitView___calculateSize(self, _cmd)
{
    var subviews = self.isa.objj_msgSend0(self, "subviews"),
        count = subviews.length,
        size = CGSizeMakeZero();
    if (self.isa.objj_msgSend0(self, "isVertical"))
    {
        size.width += self.isa.objj_msgSend0(self, "dividerThickness") * (count - 1);
        size.height = CGRectGetHeight(self.isa.objj_msgSend0(self, "frame"));
    }
    else
    {
        size.width = CGRectGetWidth(self.isa.objj_msgSend0(self, "frame"));
        size.height += self.isa.objj_msgSend0(self, "dividerThickness") * (count - 1);
    }
    while (count--)
        size[self._sizeComponent] += ((___r1 = subviews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size[self._sizeComponent];
    return size;
    var ___r1;
}
,["CGSize"]), new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"), function $CPSplitView__cursorAtPoint_hitDividerAtIndex_(self, _cmd, aPoint, anIndex)
{
    var frame = ((___r1 = self._subviews[anIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        startPosition = frame.origin[self._originComponent] + frame.size[self._sizeComponent],
        effectiveRect = self.isa.objj_msgSend1(self, "effectiveRectOfDividerAtIndex:", anIndex),
        buttonBar = self._buttonBars[anIndex],
        buttonBarRect = null,
        additionalRect = null;
    if (buttonBar != null)
    {
        buttonBarRect = (buttonBar == null ? null : buttonBar.isa.objj_msgSend0(buttonBar, "resizeControlFrame"));
        buttonBarRect.origin = self.isa.objj_msgSend2(self, "convertPoint:fromView:", buttonBarRect.origin, buttonBar);
    }
    effectiveRect = self.isa.objj_msgSend3(self, "_sendDelegateSplitViewEffectiveRect:forDrawnRect:ofDividerAtIndex:", effectiveRect, effectiveRect, anIndex);
    additionalRect = self.isa.objj_msgSend1(self, "_sendDelegateSplitViewAdditionalEffectiveRectOfDividerAtIndex:", anIndex);
    return CGRectContainsPoint(effectiveRect, aPoint) || additionalRect && CGRectContainsPoint(additionalRect, aPoint) || buttonBarRect && CGRectContainsPoint(buttonBarRect, aPoint);
    var ___r1;
}
,["BOOL","CGPoint","int"]), new objj_method(sel_getUid("hitTest:"), function $CPSplitView__hitTest_(self, _cmd, aPoint)
{
    if (self.isa.objj_msgSend0(self, "isHidden") || !self.isa.objj_msgSend0(self, "hitTests") || !CGRectContainsPoint(self.isa.objj_msgSend0(self, "frame"), aPoint))
        return nil;
    var point = self.isa.objj_msgSend2(self, "convertPoint:fromView:", aPoint, self.isa.objj_msgSend0(self, "superview")),
        count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1;
    for (var i = 0; i < count; i++)
    {
        if (self.isa.objj_msgSend2(self, "cursorAtPoint:hitDividerAtIndex:", point, i))
            return self;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "hitTest:", aPoint);
    var ___r1;
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("trackDivider:"), function $CPSplitView__trackDivider_(self, _cmd, anEvent)
{
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type"));
    if (type == CPLeftMouseUp)
    {
        self._shouldAutosave = YES;
        if (self._currentDivider != CPNotFound)
        {
            self._currentDivider = CPNotFound;
            self.isa.objj_msgSend0(self, "_autosave");
            self.isa.objj_msgSend1(self, "_updateResizeCursor:", anEvent);
        }
        return;
    }
    if (type == CPLeftMouseDown)
    {
        var point = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil),
            count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1;
        self._currentDivider = CPNotFound;
        for (var i = 0; i < count; i++)
        {
            var frame = ((___r1 = self._subviews[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
                startPosition = frame.origin[self._originComponent] + frame.size[self._sizeComponent];
            if (self.isa.objj_msgSend2(self, "cursorAtPoint:hitDividerAtIndex:", point, i))
            {
                if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "clickCount")) == 2 && self.isa.objj_msgSend0(self, "_delegateRespondsToSplitViewCanCollapseSubview") && self.isa.objj_msgSend0(self, "_delegateRespondsToSplitViewshouldCollapseSubviewForDoubleClickOnDividerAtIndex"))
                {
                    var minPosition = self.isa.objj_msgSend1(self, "minPossiblePositionOfDividerAtIndex:", i),
                        maxPosition = self.isa.objj_msgSend1(self, "maxPossiblePositionOfDividerAtIndex:", i),
                        preCollapsePosition = ((___r1 = self._preCollapsePositions), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "" + i)) || 0;
                    if (self.isa.objj_msgSend1(self, "_sendDelegateSplitViewCanCollapseSubview:", self._subviews[i]) && self.isa.objj_msgSend2(self, "_sendDelegateSplitViewShouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self._subviews[i], i))
                    {
                        if (self.isa.objj_msgSend1(self, "isSubviewCollapsed:", self._subviews[i]))
                            self.isa.objj_msgSend2(self, "setPosition:ofDividerAtIndex:", preCollapsePosition ? preCollapsePosition : minPosition + (maxPosition - minPosition) / 2, i);
                        else
                            self.isa.objj_msgSend2(self, "setPosition:ofDividerAtIndex:", minPosition, i);
                    }
                    else if (self.isa.objj_msgSend1(self, "_sendDelegateSplitViewCanCollapseSubview:", self._subviews[i + 1]) && self.isa.objj_msgSend2(self, "_sendDelegateSplitViewShouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self._subviews[i + 1], i))
                    {
                        if (self.isa.objj_msgSend1(self, "isSubviewCollapsed:", self._subviews[i + 1]))
                            self.isa.objj_msgSend2(self, "setPosition:ofDividerAtIndex:", preCollapsePosition ? preCollapsePosition : minPosition + (maxPosition - minPosition) / 2, i);
                        else
                            self.isa.objj_msgSend2(self, "setPosition:ofDividerAtIndex:", maxPosition, i);
                    }
                }
                else
                {
                    self._currentDivider = i;
                    self._initialOffset = startPosition - point[self._originComponent];
                    self._shouldAutosave = NO;
                    self.isa.objj_msgSend0(self, "_postNotificationWillResize");
                }
            }
        }
        if (self._currentDivider === CPNotFound)
            return;
    }
    else if (type == CPLeftMouseDragged && self._currentDivider != CPNotFound)
    {
        var point = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil);
        self.isa.objj_msgSend2(self, "setPosition:ofDividerAtIndex:", point[self._originComponent] + self._initialOffset, self._currentDivider);
        self.isa.objj_msgSend1(self, "_updateResizeCursor:", anEvent);
    }
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackDivider:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPSplitView__mouseDown_(self, _cmd, anEvent)
{
    self.isa.objj_msgSend1(self, "trackDivider:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $CPSplitView__viewDidMoveToWindow(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("mouseEntered:"), function $CPSplitView__mouseEntered_(self, _cmd, anEvent)
{
    if (self._currentDivider == CPNotFound)
        self.isa.objj_msgSend1(self, "_updateResizeCursor:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseMoved:"), function $CPSplitView__mouseMoved_(self, _cmd, anEvent)
{
    if (self._currentDivider == CPNotFound)
        self.isa.objj_msgSend1(self, "_updateResizeCursor:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $CPSplitView__mouseExited_(self, _cmd, anEvent)
{
    if (self._currentDivider == CPNotFound)
        ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "arrowCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_updateResizeCursor:"), function $CPSplitView___updateResizeCursor_(self, _cmd, anEvent)
{
    var point = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil);
    if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")) === CPLeftMouseUp && !((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "acceptsMouseMovedEvents")))
    {
        ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "arrowCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        return;
    }
    for (var i = 0, count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1; i < count; i++)
    {
        if (self._currentDivider === i || self._currentDivider == CPNotFound && self.isa.objj_msgSend2(self, "cursorAtPoint:hitDividerAtIndex:", point, i))
        {
            var frameA = ((___r1 = self._subviews[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
                sizeA = frameA.size[self._sizeComponent],
                startPosition = frameA.origin[self._originComponent] + sizeA,
                frameB = ((___r1 = self._subviews[i + 1]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
                sizeB = frameB.size[self._sizeComponent],
                canShrink = self.isa.objj_msgSend2(self, "_realPositionForPosition:ofDividerAtIndex:", startPosition - 1, i) < startPosition,
                canGrow = self.isa.objj_msgSend2(self, "_realPositionForPosition:ofDividerAtIndex:", startPosition + 1, i) > startPosition,
                cursor = CPCursor.isa.objj_msgSend0(CPCursor, "arrowCursor");
            if (sizeA === 0)
                canGrow = YES;
            else if (!canShrink && self.isa.objj_msgSend1(self, "_sendDelegateSplitViewCanCollapseSubview:", self._subviews[i]))
                canShrink = YES;
            if (sizeB === 0)
            {
                canGrow = NO;
                canShrink = YES;
            }
            else if (!canGrow && self.isa.objj_msgSend1(self, "_sendDelegateSplitViewCanCollapseSubview:", self._subviews[i + 1]))
            {
                canGrow = YES;
            }
            if (self._isVertical && canShrink && canGrow)
                cursor = CPCursor.isa.objj_msgSend0(CPCursor, "resizeLeftRightCursor");
            else if (self._isVertical && canShrink)
                cursor = CPCursor.isa.objj_msgSend0(CPCursor, "resizeLeftCursor");
            else if (self._isVertical && canGrow)
                cursor = CPCursor.isa.objj_msgSend0(CPCursor, "resizeRightCursor");
            else if (canShrink && canGrow)
                cursor = CPCursor.isa.objj_msgSend0(CPCursor, "resizeUpDownCursor");
            else if (canShrink)
                cursor = CPCursor.isa.objj_msgSend0(CPCursor, "resizeUpCursor");
            else if (canGrow)
                cursor = CPCursor.isa.objj_msgSend0(CPCursor, "resizeDownCursor");
            (cursor == null ? null : cursor.isa.objj_msgSend0(cursor, "set"));
            return;
        }
    }
    ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "arrowCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"), function $CPSplitView__maxPossiblePositionOfDividerAtIndex_(self, _cmd, dividerIndex)
{
    var frame = ((___r1 = self._subviews[dividerIndex + 1]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    if (dividerIndex + 1 < ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1)
        return frame.origin[self._originComponent] + frame.size[self._sizeComponent] - self.isa.objj_msgSend0(self, "dividerThickness");
    else
        return self.isa.objj_msgSend0(self, "frame").size[self._sizeComponent] - self.isa.objj_msgSend0(self, "dividerThickness");
    var ___r1;
}
,["float","int"]), new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"), function $CPSplitView__minPossiblePositionOfDividerAtIndex_(self, _cmd, dividerIndex)
{
    if (dividerIndex > 0)
    {
        var frame = ((___r1 = self._subviews[dividerIndex - 1]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
        return frame.origin[self._originComponent] + frame.size[self._sizeComponent] + self.isa.objj_msgSend0(self, "dividerThickness");
    }
    else
        return 0;
    var ___r1;
}
,["float","int"]), new objj_method(sel_getUid("_realPositionForPosition:ofDividerAtIndex:"), function $CPSplitView___realPositionForPosition_ofDividerAtIndex_(self, _cmd, position, dividerIndex)
{
    var proposedPosition = self.isa.objj_msgSend2(self, "_sendDelegateSplitViewConstrainSplitPosition:ofSubviewAt:", position, dividerIndex);
    if (!isNaN(parseFloat(proposedPosition)) && isFinite(proposedPosition))
        position = proposedPosition;
    var proposedMax = self.isa.objj_msgSend1(self, "maxPossiblePositionOfDividerAtIndex:", dividerIndex),
        proposedMin = self.isa.objj_msgSend1(self, "minPossiblePositionOfDividerAtIndex:", dividerIndex),
        actualMax = proposedMax,
        actualMin = proposedMin,
        proposedActualMin = self.isa.objj_msgSend2(self, "_sendDelegateSplitViewConstrainMinCoordinate:ofSubviewAt:", proposedMin, dividerIndex),
        proposedActualMax = self.isa.objj_msgSend2(self, "_sendDelegateSplitViewConstrainMaxCoordinate:ofSubviewAt:", proposedMax, dividerIndex);
    if (!isNaN(parseFloat(proposedActualMin)) && isFinite(proposedActualMin))
        actualMin = proposedActualMin;
    if (!isNaN(parseFloat(proposedActualMax)) && isFinite(proposedActualMax))
        actualMax = proposedActualMax;
    var viewA = self._subviews[dividerIndex],
        viewB = self._subviews[dividerIndex + 1],
        realPosition = MAX(MIN(position, actualMax), actualMin);
    if (position < proposedMin + (actualMin - proposedMin) / 2 && self.isa.objj_msgSend1(self, "_sendDelegateSplitViewCanCollapseSubview:", viewA))
        realPosition = proposedMin;
    if (position > proposedMax - (proposedMax - actualMax) / 2 && self.isa.objj_msgSend1(self, "_sendDelegateSplitViewCanCollapseSubview:", viewB))
        realPosition = proposedMax;
    return realPosition;
}
,["int","float","int"]), new objj_method(sel_getUid("setPosition:ofDividerAtIndex:"), function $CPSplitView__setPosition_ofDividerAtIndex_(self, _cmd, position, dividerIndex)
{
    self._shouldRestoreFromAutosaveUnlessFrameSize = nil;
    if (YES)
        self._suppressResizeNotificationsMask |= ShouldSuppressResizeNotifications;
    else
        self._suppressResizeNotificationsMask = 0;
    self.isa.objj_msgSend0(self, "_adjustSubviewsWithCalculatedSize");
    var realPosition = self.isa.objj_msgSend2(self, "_realPositionForPosition:ofDividerAtIndex:", position, dividerIndex),
        viewA = self._subviews[dividerIndex],
        frameA = (viewA == null ? null : viewA.isa.objj_msgSend0(viewA, "frame")),
        viewB = self._subviews[dividerIndex + 1],
        frameB = (viewB == null ? null : viewB.isa.objj_msgSend0(viewB, "frame")),
        preCollapsePosition = 0,
        preSize = frameA.size[self._sizeComponent];
    frameA.size[self._sizeComponent] = realPosition - frameA.origin[self._originComponent];
    if (preSize !== 0 && frameA.size[self._sizeComponent] === 0)
        preCollapsePosition = preSize;
    if (preSize !== frameA.size[self._sizeComponent])
    {
        if ((self._suppressResizeNotificationsMask & DidPostWillResizeNotification) === 0)
        {
            self.isa.objj_msgSend0(self, "_postNotificationWillResize");
            self._suppressResizeNotificationsMask |= DidPostWillResizeNotification;
        }
        ((___r1 = self._subviews[dividerIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", frameA));
        if ((self._suppressResizeNotificationsMask & ShouldSuppressResizeNotifications) !== 0)
            self._suppressResizeNotificationsMask |= DidSuppressResizeNotification;
        else
            self.isa.objj_msgSend0(self, "_postNotificationDidResize");
    }
    preSize = frameB.size[self._sizeComponent];
    var preOrigin = frameB.origin[self._originComponent];
    frameB.size[self._sizeComponent] = frameB.origin[self._originComponent] + frameB.size[self._sizeComponent] - realPosition - self.isa.objj_msgSend0(self, "dividerThickness");
    if (preSize !== 0 && frameB.size[self._sizeComponent] === 0)
        preCollapsePosition = frameB.origin[self._originComponent];
    frameB.origin[self._originComponent] = realPosition + self.isa.objj_msgSend0(self, "dividerThickness");
    if (preSize !== frameB.size[self._sizeComponent] || preOrigin !== frameB.origin[self._originComponent])
    {
        if ((self._suppressResizeNotificationsMask & DidPostWillResizeNotification) === 0)
        {
            self.isa.objj_msgSend0(self, "_postNotificationWillResize");
            self._suppressResizeNotificationsMask |= DidPostWillResizeNotification;
        }
        ((___r1 = self._subviews[dividerIndex + 1]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", frameB));
        if ((self._suppressResizeNotificationsMask & ShouldSuppressResizeNotifications) !== 0)
            self._suppressResizeNotificationsMask |= DidSuppressResizeNotification;
        else
            self.isa.objj_msgSend0(self, "_postNotificationDidResize");
    }
    if (preCollapsePosition)
        ((___r1 = self._preCollapsePositions), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", preCollapsePosition, "" + dividerIndex));
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    if ((self._suppressResizeNotificationsMask & DidSuppressResizeNotification) !== 0)
        self.isa.objj_msgSend0(self, "_postNotificationDidResize");
    if (NO)
        self._suppressResizeNotificationsMask |= ShouldSuppressResizeNotifications;
    else
        self._suppressResizeNotificationsMask = 0;
    var ___r1;
}
,["void","float","int"]), new objj_method(sel_getUid("setFrameSize:"), function $CPSplitView__setFrameSize_(self, _cmd, aSize)
{
    if (self._shouldRestoreFromAutosaveUnlessFrameSize)
        self._shouldAutosave = NO;
    else
        self.isa.objj_msgSend0(self, "_adjustSubviewsWithCalculatedSize");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "setFrameSize:", aSize);
    if (self._shouldRestoreFromAutosaveUnlessFrameSize)
        self._shouldAutosave = YES;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CGSize"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPSplitView__resizeSubviewsWithOldSize_(self, _cmd, oldSize)
{
    if (self.isa.objj_msgSend0(self, "_delegateRespondsToSplitViewResizeSubviewsWithOldSize"))
    {
        self.isa.objj_msgSend1(self, "_sendDelegateSplitViewResizeSubviewsWithOldSize:", oldSize);
        return;
    }
    self.isa.objj_msgSend0(self, "adjustSubviews");
}
,["void","CGSize"]), new objj_method(sel_getUid("adjustSubviews"), function $CPSplitView__adjustSubviews(self, _cmd)
{
    var count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    if (!count)
        return;
    if ((self._suppressResizeNotificationsMask & DidPostWillResizeNotification) === 0)
    {
        self.isa.objj_msgSend0(self, "_postNotificationWillResize");
        self._suppressResizeNotificationsMask |= DidPostWillResizeNotification;
    }
    self.isa.objj_msgSend0(self, "_postNotificationWillResize");
    var index = 0,
        bounds = self.isa.objj_msgSend0(self, "bounds"),
        boundsSize = bounds.size[self._sizeComponent],
        oldSize = self.isa.objj_msgSend0(self, "_calculateSize"),
        dividerThickness = self.isa.objj_msgSend0(self, "dividerThickness"),
        totalDividers = count - 1,
        oldFlexibleSpace = 0,
        totalSizablePanes = 0,
        isSizableMap = {},
        viewSizes = [];
    for (index = 0; index < count; ++index)
    {
        var view = self._subviews[index],
            isSizable = self.isa.objj_msgSend1(self, "_sendDelegateSplitViewShouldAdjustSizeOfSubview:", view),
            size = (view == null ? null : view.isa.objj_msgSend0(view, "frame")).size[self._sizeComponent];
        isSizableMap[index] = isSizable;
        viewSizes.push(size);
        if (isSizable)
        {
            oldFlexibleSpace += size;
            totalSizablePanes++;
        }
    }
    var nonSizableSpace = oldSize[self._sizeComponent] - oldFlexibleSpace,
        newFlexibleSpace = boundsSize - nonSizableSpace,
        remainingFixedPixelsToRemove = 0;
    if (newFlexibleSpace < 0)
    {
        remainingFixedPixelsToRemove = -newFlexibleSpace;
        newFlexibleSpace = 0;
    }
    var remainingFixedPanes = count - totalSizablePanes;
    for (index = 0; index < count; ++index)
    {
        var view = self._subviews[index],
            viewFrame = CGRectMakeCopy(bounds),
            isSizable = isSizableMap[index],
            targetSize = 0;
        if (index + 1 === count)
            targetSize = boundsSize - viewFrame.origin[self._originComponent];
        else if (!isSizable)
        {
            var removedFixedPixels = MIN(remainingFixedPixelsToRemove / remainingFixedPanes, viewSizes[index]);
            targetSize = viewSizes[index] - removedFixedPixels;
            remainingFixedPixelsToRemove -= removedFixedPixels;
            remainingFixedPanes--;
        }
        else if (oldFlexibleSpace > 0)
            targetSize = newFlexibleSpace * viewSizes[index] / oldFlexibleSpace;
        else
            targetSize = newFlexibleSpace / totalSizablePanes;
        targetSize = MAX(0, ROUND(targetSize));
        viewFrame.size[self._sizeComponent] = targetSize;
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrame:", viewFrame));
        bounds.origin[self._originComponent] += targetSize + dividerThickness;
    }
    if ((self._suppressResizeNotificationsMask & ShouldSuppressResizeNotifications) !== 0)
        self._suppressResizeNotificationsMask |= DidSuppressResizeNotification;
    else
        self.isa.objj_msgSend0(self, "_postNotificationDidResize");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setDelegate:"), function $CPSplitView__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitViewDidResizeSubviews:"))))
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self._delegate, CPSplitViewDidResizeSubviewsNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitViewWillResizeSubviews:"))))
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self._delegate, CPSplitViewWillResizeSubviewsNotification, self));
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitViewDidResizeSubviews:"))))
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self._delegate, sel_getUid("splitViewDidResizeSubviews:"), CPSplitViewDidResizeSubviewsNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitViewWillResizeSubviews:"))))
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self._delegate, sel_getUid("splitViewWillResizeSubviews:"), CPSplitViewWillResizeSubviewsNotification, self));
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitView:canCollapseSubview:"))))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_canCollapseSubview_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitView:shouldAdjustSizeOfSubview:"))))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_shouldAdjustSizeOfSubview_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:"))))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_shouldCollapseSubview_forDoubleClickOnDividerAtIndex_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:"))))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_additionalEffectiveRectOfDividerAtIndex_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:"))))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_effectiveRect_forDrawnRect_ofDividerAtIndex_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"))))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_constrainMaxCoordinate_ofSubviewAt_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"))))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_constrainMinCoordinate_ofSubviewAt_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"))))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_constrainSplitPosition_ofSubviewAt_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("splitView:resizeSubviewsWithOldSize:"))))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_resizeSubviewsWithOldSize_;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setButtonBar:forDividerAtIndex:"), function $CPSplitView__setButtonBar_forDividerAtIndex_(self, _cmd, aButtonBar, dividerIndex)
{
    if (!aButtonBar)
    {
        self._buttonBars[dividerIndex] = nil;
        return;
    }
    var view = (aButtonBar == null ? null : aButtonBar.isa.objj_msgSend0(aButtonBar, "superview")),
        subview = aButtonBar;
    while (view && view !== self)
    {
        subview = view;
        view = (view == null ? null : view.isa.objj_msgSend0(view, "superview"));
    }
    if (view !== self)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "CPSplitView button bar must be a subview of the split view.");
    var viewIndex = ((___r1 = self.isa.objj_msgSend0(self, "subviews")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", subview));
    (aButtonBar == null ? null : aButtonBar.isa.objj_msgSend1(aButtonBar, "setHasResizeControl:", YES));
    (aButtonBar == null ? null : aButtonBar.isa.objj_msgSend1(aButtonBar, "setResizeControlIsLeftAligned:", dividerIndex < viewIndex));
    self._buttonBars[dividerIndex] = aButtonBar;
    var ___r1;
}
,["void","CPButtonBar","CPUInteger"]), new objj_method(sel_getUid("_postNotificationWillResize"), function $CPSplitView___postNotificationWillResize(self, _cmd)
{
    var userInfo = nil;
    if (self._currentDivider !== CPNotFound)
        userInfo = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self._currentDivider, "CPSplitViewDividerIndex");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPSplitViewWillResizeSubviewsNotification, self, userInfo));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_postNotificationDidResize"), function $CPSplitView___postNotificationDidResize(self, _cmd)
{
    var userInfo = nil;
    if (self._currentDivider !== CPNotFound)
        userInfo = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self._currentDivider, "CPSplitViewDividerIndex");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPSplitViewDidResizeSubviewsNotification, self, userInfo));
    self.isa.objj_msgSend0(self, "_autosave");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setAutosaveName:"), function $CPSplitView__setAutosaveName_(self, _cmd, autosaveName)
{
    if (self._autosaveName == autosaveName)
        return;
    self._autosaveName = autosaveName;
}
,["void","CPString"]), new objj_method(sel_getUid("autosaveName"), function $CPSplitView__autosaveName(self, _cmd)
{
    return self._autosaveName;
}
,["CPString"]), new objj_method(sel_getUid("_autosave"), function $CPSplitView___autosave(self, _cmd)
{
    if (self._shouldRestoreFromAutosaveUnlessFrameSize || !self._shouldAutosave || !self._autosaveName)
        return;
    var userDefaults = (CPUserDefaults == null ? null : CPUserDefaults.isa.objj_msgSend0(CPUserDefaults, "standardUserDefaults")),
        autosaveName = self.isa.objj_msgSend1(self, "_framesKeyForAutosaveName:", self.isa.objj_msgSend0(self, "autosaveName")),
        autosavePrecollapseName = self.isa.objj_msgSend1(self, "_precollapseKeyForAutosaveName:", self.isa.objj_msgSend0(self, "autosaveName")),
        count = ((___r1 = self._subviews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        positions = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "new"),
        preCollapseArray = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "new");
    for (var i = 0; i < count; i++)
    {
        var frame = ((___r1 = self._subviews[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
        (positions == null ? null : positions.isa.objj_msgSend1(positions, "addObject:", CGStringFromRect(frame)));
        (preCollapseArray == null ? null : preCollapseArray.isa.objj_msgSend1(preCollapseArray, "addObject:", ((___r1 = self._preCollapsePositions), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "" + i))));
    }
    (userDefaults == null ? null : userDefaults.isa.objj_msgSend2(userDefaults, "setObject:forKey:", positions, autosaveName));
    (userDefaults == null ? null : userDefaults.isa.objj_msgSend2(userDefaults, "setObject:forKey:", preCollapseArray, autosavePrecollapseName));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_restoreFromAutosaveIfNeeded"), function $CPSplitView___restoreFromAutosaveIfNeeded(self, _cmd)
{
    if (self._shouldRestoreFromAutosaveUnlessFrameSize && !CGSizeEqualToSize(self.isa.objj_msgSend0(self, "frameSize"), self._shouldRestoreFromAutosaveUnlessFrameSize))
    {
        self.isa.objj_msgSend0(self, "_restoreFromAutosave");
    }
    self._shouldRestoreFromAutosaveUnlessFrameSize = nil;
}
,["void"]), new objj_method(sel_getUid("_restoreFromAutosave"), function $CPSplitView___restoreFromAutosave(self, _cmd)
{
    if (!self._autosaveName)
        return;
    var autosaveName = self.isa.objj_msgSend1(self, "_framesKeyForAutosaveName:", self.isa.objj_msgSend0(self, "autosaveName")),
        autosavePrecollapseName = self.isa.objj_msgSend1(self, "_precollapseKeyForAutosaveName:", self.isa.objj_msgSend0(self, "autosaveName")),
        userDefaults = (CPUserDefaults == null ? null : CPUserDefaults.isa.objj_msgSend0(CPUserDefaults, "standardUserDefaults")),
        frames = (userDefaults == null ? null : userDefaults.isa.objj_msgSend1(userDefaults, "objectForKey:", autosaveName)),
        preCollapseArray = (userDefaults == null ? null : userDefaults.isa.objj_msgSend1(userDefaults, "objectForKey:", autosavePrecollapseName));
    if (frames)
    {
        var dividerThickness = self.isa.objj_msgSend0(self, "dividerThickness"),
            position = 0;
        self._shouldAutosave = NO;
        for (var i = 0, count = (frames == null ? null : frames.isa.objj_msgSend0(frames, "count")) - 1; i < count; i++)
        {
            var frame = CGRectFromString(frames[i]);
            position += frame.size[self._sizeComponent];
            self.isa.objj_msgSend2(self, "setPosition:ofDividerAtIndex:", position, i);
            position += dividerThickness;
        }
        self._shouldAutosave = YES;
    }
    if (preCollapseArray)
    {
        self._preCollapsePositions = CPMutableDictionary.isa.objj_msgSend0(CPMutableDictionary, "new");
        for (var i = 0, count = (preCollapseArray == null ? null : preCollapseArray.isa.objj_msgSend0(preCollapseArray, "count")); i < count; i++)
        {
            var item = preCollapseArray[i];
            if (item === nil)
                ((___r1 = self._preCollapsePositions), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", String(i)));
            else
                ((___r1 = self._preCollapsePositions), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", item, String(i)));
        }
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_framesKeyForAutosaveName:"), function $CPSplitView___framesKeyForAutosaveName_(self, _cmd, theAutosaveName)
{
    if (!theAutosaveName)
        return nil;
    return "CPSplitView Subview Frames " + theAutosaveName;
}
,["CPString","CPString"]), new objj_method(sel_getUid("_precollapseKeyForAutosaveName:"), function $CPSplitView___precollapseKeyForAutosaveName_(self, _cmd, theAutosaveName)
{
    if (!theAutosaveName)
        return nil;
    return "CPSplitView Subview Precollapse Positions " + theAutosaveName;
}
,["CPString","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPSplitView__defaultThemeClass(self, _cmd)
{
    return "splitview";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPSplitView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 1.0, "divider-thickness", 10.0, "pane-divider-thickness", CPColor.isa.objj_msgSend0(CPColor, "grayColor"), "pane-divider-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "horizontal-divider-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "vertical-divider-color");
}
,["CPDictionary"])]);
}{
var the_class = objj_getClass("CPSplitView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_delegateRespondsToSplitViewResizeSubviewsWithOldSize"), function $CPSplitView___delegateRespondsToSplitViewResizeSubviewsWithOldSize(self, _cmd)
{
    return self._implementedDelegateMethods & CPSplitViewDelegate_splitView_resizeSubviewsWithOldSize_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToSplitViewCanCollapseSubview"), function $CPSplitView___delegateRespondsToSplitViewCanCollapseSubview(self, _cmd)
{
    return self._implementedDelegateMethods & CPSplitViewDelegate_splitView_canCollapseSubview_;
}
,["BOOL"]), new objj_method(sel_getUid("_delegateRespondsToSplitViewshouldCollapseSubviewForDoubleClickOnDividerAtIndex"), function $CPSplitView___delegateRespondsToSplitViewshouldCollapseSubviewForDoubleClickOnDividerAtIndex(self, _cmd)
{
    return self._implementedDelegateMethods & CPSplitViewDelegate_splitView_shouldCollapseSubview_forDoubleClickOnDividerAtIndex_;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateSplitViewCanCollapseSubview:"), function $CPSplitView___sendDelegateSplitViewCanCollapseSubview_(self, _cmd, aView)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_canCollapseSubview_))
        return NO;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "splitView:canCollapseSubview:", self, aView));
    var ___r1;
}
,["BOOL","CPView"]), new objj_method(sel_getUid("_sendDelegateSplitViewShouldAdjustSizeOfSubview:"), function $CPSplitView___sendDelegateSplitViewShouldAdjustSizeOfSubview_(self, _cmd, aView)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_shouldAdjustSizeOfSubview_))
        return YES;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "splitView:shouldAdjustSizeOfSubview:", self, aView));
    var ___r1;
}
,["BOOL","CPView"]), new objj_method(sel_getUid("_sendDelegateSplitViewShouldCollapseSubview:forDoubleClickOnDividerAtIndex:"), function $CPSplitView___sendDelegateSplitViewShouldCollapseSubview_forDoubleClickOnDividerAtIndex_(self, _cmd, aView, anIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_shouldCollapseSubview_forDoubleClickOnDividerAtIndex_))
        return NO;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self, aView, anIndex));
    var ___r1;
}
,["BOOL","CPView","int"]), new objj_method(sel_getUid("_sendDelegateSplitViewAdditionalEffectiveRectOfDividerAtIndex:"), function $CPSplitView___sendDelegateSplitViewAdditionalEffectiveRectOfDividerAtIndex_(self, _cmd, anIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_additionalEffectiveRectOfDividerAtIndex_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "splitView:additionalEffectiveRectOfDividerAtIndex:", self, anIndex));
    var ___r1;
}
,["CGRect","int"]), new objj_method(sel_getUid("_sendDelegateSplitViewEffectiveRect:forDrawnRect:ofDividerAtIndex:"), function $CPSplitView___sendDelegateSplitViewEffectiveRect_forDrawnRect_ofDividerAtIndex_(self, _cmd, proposedEffectiveRect, drawnRect, dividerIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_effectiveRect_forDrawnRect_ofDividerAtIndex_))
        return proposedEffectiveRect;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:", self, proposedEffectiveRect, drawnRect, dividerIndex));
    var ___r1;
}
,["CGRect","CGRect","CGRect","CPInteger"]), new objj_method(sel_getUid("_sendDelegateSplitViewConstrainMaxCoordinate:ofSubviewAt:"), function $CPSplitView___sendDelegateSplitViewConstrainMaxCoordinate_ofSubviewAt_(self, _cmd, proposedMax, dividerIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_constrainMaxCoordinate_ofSubviewAt_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "splitView:constrainMaxCoordinate:ofSubviewAt:", self, proposedMax, dividerIndex));
    var ___r1;
}
,["float","float","CPInteger"]), new objj_method(sel_getUid("_sendDelegateSplitViewConstrainMinCoordinate:ofSubviewAt:"), function $CPSplitView___sendDelegateSplitViewConstrainMinCoordinate_ofSubviewAt_(self, _cmd, proposedMin, dividerIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_constrainMinCoordinate_ofSubviewAt_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "splitView:constrainMinCoordinate:ofSubviewAt:", self, proposedMin, dividerIndex));
    var ___r1;
}
,["float","float","CPInteger"]), new objj_method(sel_getUid("_sendDelegateSplitViewConstrainSplitPosition:ofSubviewAt:"), function $CPSplitView___sendDelegateSplitViewConstrainSplitPosition_ofSubviewAt_(self, _cmd, proposedMax, dividerIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_constrainSplitPosition_ofSubviewAt_))
        return nil;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "splitView:constrainSplitPosition:ofSubviewAt:", self, proposedMax, dividerIndex));
    var ___r1;
}
,["float","float","CPInteger"]), new objj_method(sel_getUid("_sendDelegateSplitViewResizeSubviewsWithOldSize:"), function $CPSplitView___sendDelegateSplitViewResizeSubviewsWithOldSize_(self, _cmd, oldSize)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_resizeSubviewsWithOldSize_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "splitView:resizeSubviewsWithOldSize:", self, oldSize));
    var ___r1;
}
,["void","CGSize"])]);
}var CPSplitViewDelegateKey = "CPSplitViewDelegateKey",
    CPSplitViewIsVerticalKey = "CPSplitViewIsVerticalKey",
    CPSplitViewIsPaneSplitterKey = "CPSplitViewIsPaneSplitterKey",
    CPSplitViewButtonBarsKey = "CPSplitViewButtonBarsKey",
    CPSplitViewAutosaveNameKey = "CPSplitViewAutosaveNameKey";
{
var the_class = objj_getClass("CPSplitView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPSplitView__initWithCoder_(self, _cmd, aCoder)
{
    self._autosaveName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSplitViewAutosaveNameKey));
    if (self._autosaveName)
    {
        ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "performSelector:target:argument:order:modes:", sel_getUid("_restoreFromAutosaveIfNeeded"), self, nil, 0, [CPDefaultRunLoopMode]));
    }
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._suppressResizeNotificationsMask = 0;
        self._preCollapsePositions = CPMutableDictionary.isa.objj_msgSend0(CPMutableDictionary, "new");
        self._currentDivider = CPNotFound;
        self._shouldAutosave = YES;
        self._DOMDividerElements = [];
        self._buttonBars = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSplitViewButtonBarsKey)) || [];
        (self == null ? null : self.isa.objj_msgSend1(self, "setDelegate:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSplitViewDelegateKey))));
        self._isPaneSplitter = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPSplitViewIsPaneSplitterKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "_setVertical:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPSplitViewIsVerticalKey))));
        if (self._autosaveName)
        {
            (self == null ? null : self.isa.objj_msgSend0(self, "_restoreFromAutosave"));
            self._shouldRestoreFromAutosaveUnlessFrameSize = (self == null ? null : self.isa.objj_msgSend0(self, "frameSize"));
        }
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSplitView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeConditionalObject:forKey:", self._delegate, CPSplitViewDelegateKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isVertical, CPSplitViewIsVerticalKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isPaneSplitter, CPSplitViewIsPaneSplitterKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._autosaveName, CPSplitViewAutosaveNameKey));
}
,["void","CPCoder"])]);
}