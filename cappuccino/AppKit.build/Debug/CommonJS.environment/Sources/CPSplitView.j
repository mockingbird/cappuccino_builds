@STATIC;1.0;i;13;CPButtonBar.ji;9;CPImage.ji;8;CPView.ji;10;CPCursor.jt;48234;objj_executeFile("CPButtonBar.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPCursor.j", YES);{var the_protocol = objj_allocateProtocol("CPSplitViewDelegate");
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
        self._preCollapsePositions = objj_msgSend(CPMutableDictionary, "new");
        self._currentDivider = CPNotFound;
        self._DOMDividerElements = [];
        self._buttonBars = [];
        self._shouldAutosave = YES;
        objj_msgSend(self, "_setVertical:", YES);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("dividerThickness"), function $CPSplitView__dividerThickness(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", objj_msgSend(self, "isPaneSplitter") ? "pane-divider-thickness" : "divider-thickness");
}
,["float"]), new objj_method(sel_getUid("isVertical"), function $CPSplitView__isVertical(self, _cmd)
{
    return self._isVertical;
}
,["BOOL"]), new objj_method(sel_getUid("setVertical:"), function $CPSplitView__setVertical_(self, _cmd, shouldBeVertical)
{
    if (!objj_msgSend(self, "_setVertical:", shouldBeVertical))
        return;
    var frame = objj_msgSend(self, "frame"),
        dividerThickness = objj_msgSend(self, "dividerThickness");
    objj_msgSend(self, "_postNotificationWillResize");
    var eachSize = ROUND((frame.size[self._sizeComponent] - dividerThickness * (self._subviews.length - 1)) / self._subviews.length),
        index = 0,
        count = self._subviews.length;
    if (objj_msgSend(self, "isVertical"))
    {
        for (; index < count; ++index)
            objj_msgSend(self._subviews[index], "setFrame:", CGRectMake(ROUND((eachSize + dividerThickness) * index), 0, eachSize, frame.size.height));
    }
    else
    {
        for (; index < count; ++index)
            objj_msgSend(self._subviews[index], "setFrame:", CGRectMake(0, ROUND((eachSize + dividerThickness) * index), frame.size.width, eachSize));
    }
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "_postNotificationDidResize");
}
,["void","BOOL"]), new objj_method(sel_getUid("_setVertical:"), function $CPSplitView___setVertical_(self, _cmd, shouldBeVertical)
{
    var changed = self._isVertical != shouldBeVertical;
    self._isVertical = shouldBeVertical;
    self._originComponent = objj_msgSend(self, "isVertical") ? "x" : "y";
    self._sizeComponent = objj_msgSend(self, "isVertical") ? "width" : "height";
    self._dividerImagePath = objj_msgSend(self, "isVertical") ? objj_msgSend(objj_msgSend(self, "valueForThemeAttribute:", "vertical-divider-color"), "filename") : objj_msgSend(objj_msgSend(self, "valueForThemeAttribute:", "horizontal-divider-color"), "filename");
    return changed;
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
        objj_msgSend(self, "_setupDOMDivider");
    self._needsResizeSubviews = YES;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","BOOL"]), new objj_method(sel_getUid("didAddSubview:"), function $CPSplitView__didAddSubview_(self, _cmd, aSubview)
{
    self._needsResizeSubviews = YES;
}
,["void","CPView"]), new objj_method(sel_getUid("isSubviewCollapsed:"), function $CPSplitView__isSubviewCollapsed_(self, _cmd, subview)
{
    return objj_msgSend(subview, "frame").size[self._sizeComponent] < 1 ? YES : NO;
}
,["BOOL","CPView"]), new objj_method(sel_getUid("rectOfDividerAtIndex:"), function $CPSplitView__rectOfDividerAtIndex_(self, _cmd, aDivider)
{
    var frame = objj_msgSend(self._subviews[aDivider], "frame"),
        rect = CGRectMakeZero();
    rect.size = objj_msgSend(self, "frame").size;
    rect.size[self._sizeComponent] = objj_msgSend(self, "dividerThickness");
    rect.origin[self._originComponent] = frame.origin[self._originComponent] + frame.size[self._sizeComponent];
    return rect;
}
,["CGRect","int"]), new objj_method(sel_getUid("effectiveRectOfDividerAtIndex:"), function $CPSplitView__effectiveRectOfDividerAtIndex_(self, _cmd, aDivider)
{
    var realRect = objj_msgSend(self, "rectOfDividerAtIndex:", aDivider),
        padding = 2;
    realRect.size[self._sizeComponent] += padding * 2;
    realRect.origin[self._originComponent] -= padding;
    return realRect;
}
,["CGRect","int"]), new objj_method(sel_getUid("drawRect:"), function $CPSplitView__drawRect_(self, _cmd, rect)
{
    var count = objj_msgSend(self._subviews, "count") - 1;
    while (count-- > 0)
    {
        self._drawingDivider = count;
        objj_msgSend(self, "drawDividerInRect:", objj_msgSend(self, "rectOfDividerAtIndex:", count));
    }
}
,["void","CGRect"]), new objj_method(sel_getUid("willRemoveSubview:"), function $CPSplitView__willRemoveSubview_(self, _cmd, aView)
{
    self._needsResizeSubviews = YES;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPView"]), new objj_method(sel_getUid("layoutSubviews"), function $CPSplitView__layoutSubviews(self, _cmd)
{
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
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
        self._DOMDividerElements[self._drawingDivider].style.backgroundColor = objj_msgSend(objj_msgSend(self, "currentValueForThemeAttribute:", "pane-divider-color"), "cssString");
        self._DOMDividerElements[self._drawingDivider].style.backgroundImage = "";
    }
}
,["void"]), new objj_method(sel_getUid("viewWillDraw"), function $CPSplitView__viewWillDraw(self, _cmd)
{
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
}
,["void"]), new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"), function $CPSplitView___adjustSubviewsWithCalculatedSize(self, _cmd)
{
    if (!self._needsResizeSubviews)
        return;
    self._needsResizeSubviews = NO;
    objj_msgSend(self, "resizeSubviewsWithOldSize:", objj_msgSend(self, "_calculateSize"));
}
,["void"]), new objj_method(sel_getUid("_calculateSize"), function $CPSplitView___calculateSize(self, _cmd)
{
    var subviews = objj_msgSend(self, "subviews"),
        count = subviews.length,
        size = CGSizeMakeZero();
    if (objj_msgSend(self, "isVertical"))
    {
        size.width += objj_msgSend(self, "dividerThickness") * (count - 1);
        size.height = CGRectGetHeight(objj_msgSend(self, "frame"));
    }
    else
    {
        size.width = CGRectGetWidth(objj_msgSend(self, "frame"));
        size.height += objj_msgSend(self, "dividerThickness") * (count - 1);
    }
    while (count--)
        size[self._sizeComponent] += objj_msgSend(subviews[count], "frame").size[self._sizeComponent];
    return size;
}
,["CGSize"]), new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"), function $CPSplitView__cursorAtPoint_hitDividerAtIndex_(self, _cmd, aPoint, anIndex)
{
    var frame = objj_msgSend(self._subviews[anIndex], "frame"),
        startPosition = frame.origin[self._originComponent] + frame.size[self._sizeComponent],
        effectiveRect = objj_msgSend(self, "effectiveRectOfDividerAtIndex:", anIndex),
        buttonBar = self._buttonBars[anIndex],
        buttonBarRect = null,
        additionalRect = null;
    if (buttonBar != null)
    {
        buttonBarRect = objj_msgSend(buttonBar, "resizeControlFrame");
        buttonBarRect.origin = objj_msgSend(self, "convertPoint:fromView:", buttonBarRect.origin, buttonBar);
    }
    effectiveRect = objj_msgSend(self, "_sendDelegateSplitViewEffectiveRect:forDrawnRect:ofDividerAtIndex:", effectiveRect, effectiveRect, anIndex);
    additionalRect = objj_msgSend(self, "_sendDelegateSplitViewAdditionalEffectiveRectOfDividerAtIndex:", anIndex);
    return CGRectContainsPoint(effectiveRect, aPoint) || additionalRect && CGRectContainsPoint(additionalRect, aPoint) || buttonBarRect && CGRectContainsPoint(buttonBarRect, aPoint);
}
,["BOOL","CGPoint","int"]), new objj_method(sel_getUid("hitTest:"), function $CPSplitView__hitTest_(self, _cmd, aPoint)
{
    if (objj_msgSend(self, "isHidden") || !objj_msgSend(self, "hitTests") || !CGRectContainsPoint(objj_msgSend(self, "frame"), aPoint))
        return nil;
    var point = objj_msgSend(self, "convertPoint:fromView:", aPoint, objj_msgSend(self, "superview")),
        count = objj_msgSend(self._subviews, "count") - 1;
    for (var i = 0; i < count; i++)
    {
        if (objj_msgSend(self, "cursorAtPoint:hitDividerAtIndex:", point, i))
            return self;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "hitTest:", aPoint);
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("trackDivider:"), function $CPSplitView__trackDivider_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type");
    if (type == CPLeftMouseUp)
    {
        self._shouldAutosave = YES;
        if (self._currentDivider != CPNotFound)
        {
            self._currentDivider = CPNotFound;
            objj_msgSend(self, "_autosave");
            objj_msgSend(self, "_updateResizeCursor:", anEvent);
        }
        return;
    }
    if (type == CPLeftMouseDown)
    {
        var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
            count = objj_msgSend(self._subviews, "count") - 1;
        self._currentDivider = CPNotFound;
        for (var i = 0; i < count; i++)
        {
            var frame = objj_msgSend(self._subviews[i], "frame"),
                startPosition = frame.origin[self._originComponent] + frame.size[self._sizeComponent];
            if (objj_msgSend(self, "cursorAtPoint:hitDividerAtIndex:", point, i))
            {
                if (objj_msgSend(anEvent, "clickCount") == 2 && objj_msgSend(self, "_delegateRespondsToSplitViewCanCollapseSubview") && objj_msgSend(self, "_delegateRespondsToSplitViewshouldCollapseSubviewForDoubleClickOnDividerAtIndex"))
                {
                    var minPosition = objj_msgSend(self, "minPossiblePositionOfDividerAtIndex:", i),
                        maxPosition = objj_msgSend(self, "maxPossiblePositionOfDividerAtIndex:", i),
                        preCollapsePosition = objj_msgSend(self._preCollapsePositions, "objectForKey:", "" + i) || 0;
                    if (objj_msgSend(self, "_sendDelegateSplitViewCanCollapseSubview:", self._subviews[i]) && objj_msgSend(self, "_sendDelegateSplitViewShouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self._subviews[i], i))
                    {
                        if (objj_msgSend(self, "isSubviewCollapsed:", self._subviews[i]))
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", preCollapsePosition ? preCollapsePosition : minPosition + (maxPosition - minPosition) / 2, i);
                        else
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", minPosition, i);
                    }
                    else if (objj_msgSend(self, "_sendDelegateSplitViewCanCollapseSubview:", self._subviews[i + 1]) && objj_msgSend(self, "_sendDelegateSplitViewShouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self._subviews[i + 1], i))
                    {
                        if (objj_msgSend(self, "isSubviewCollapsed:", self._subviews[i + 1]))
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", preCollapsePosition ? preCollapsePosition : minPosition + (maxPosition - minPosition) / 2, i);
                        else
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", maxPosition, i);
                    }
                }
                else
                {
                    self._currentDivider = i;
                    self._initialOffset = startPosition - point[self._originComponent];
                    self._shouldAutosave = NO;
                    objj_msgSend(self, "_postNotificationWillResize");
                }
            }
        }
        if (self._currentDivider === CPNotFound)
            return;
    }
    else if (type == CPLeftMouseDragged && self._currentDivider != CPNotFound)
    {
        var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
        objj_msgSend(self, "setPosition:ofDividerAtIndex:", point[self._originComponent] + self._initialOffset, self._currentDivider);
        objj_msgSend(self, "_updateResizeCursor:", anEvent);
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackDivider:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPSplitView__mouseDown_(self, _cmd, anEvent)
{
    objj_msgSend(self, "trackDivider:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $CPSplitView__viewDidMoveToWindow(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("mouseEntered:"), function $CPSplitView__mouseEntered_(self, _cmd, anEvent)
{
    if (self._currentDivider == CPNotFound)
        objj_msgSend(self, "_updateResizeCursor:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseMoved:"), function $CPSplitView__mouseMoved_(self, _cmd, anEvent)
{
    if (self._currentDivider == CPNotFound)
        objj_msgSend(self, "_updateResizeCursor:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $CPSplitView__mouseExited_(self, _cmd, anEvent)
{
    if (self._currentDivider == CPNotFound)
        objj_msgSend(objj_msgSend(CPCursor, "arrowCursor"), "set");
}
,["void","CPEvent"]), new objj_method(sel_getUid("_updateResizeCursor:"), function $CPSplitView___updateResizeCursor_(self, _cmd, anEvent)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if (objj_msgSend(anEvent, "type") === CPLeftMouseUp && !objj_msgSend(objj_msgSend(self, "window"), "acceptsMouseMovedEvents"))
    {
        objj_msgSend(objj_msgSend(CPCursor, "arrowCursor"), "set");
        return;
    }
    for (var i = 0, count = objj_msgSend(self._subviews, "count") - 1; i < count; i++)
    {
        if (self._currentDivider === i || self._currentDivider == CPNotFound && objj_msgSend(self, "cursorAtPoint:hitDividerAtIndex:", point, i))
        {
            var frameA = objj_msgSend(self._subviews[i], "frame"),
                sizeA = frameA.size[self._sizeComponent],
                startPosition = frameA.origin[self._originComponent] + sizeA,
                frameB = objj_msgSend(self._subviews[i + 1], "frame"),
                sizeB = frameB.size[self._sizeComponent],
                canShrink = objj_msgSend(self, "_realPositionForPosition:ofDividerAtIndex:", startPosition - 1, i) < startPosition,
                canGrow = objj_msgSend(self, "_realPositionForPosition:ofDividerAtIndex:", startPosition + 1, i) > startPosition,
                cursor = objj_msgSend(CPCursor, "arrowCursor");
            if (sizeA === 0)
                canGrow = YES;
            else if (!canShrink && objj_msgSend(self, "_sendDelegateSplitViewCanCollapseSubview:", self._subviews[i]))
                canShrink = YES;
            if (sizeB === 0)
            {
                canGrow = NO;
                canShrink = YES;
            }
            else if (!canGrow && objj_msgSend(self, "_sendDelegateSplitViewCanCollapseSubview:", self._subviews[i + 1]))
            {
                canGrow = YES;
            }
            if (self._isVertical && canShrink && canGrow)
                cursor = objj_msgSend(CPCursor, "resizeLeftRightCursor");
            else if (self._isVertical && canShrink)
                cursor = objj_msgSend(CPCursor, "resizeLeftCursor");
            else if (self._isVertical && canGrow)
                cursor = objj_msgSend(CPCursor, "resizeRightCursor");
            else if (canShrink && canGrow)
                cursor = objj_msgSend(CPCursor, "resizeUpDownCursor");
            else if (canShrink)
                cursor = objj_msgSend(CPCursor, "resizeUpCursor");
            else if (canGrow)
                cursor = objj_msgSend(CPCursor, "resizeDownCursor");
            objj_msgSend(cursor, "set");
            return;
        }
    }
    objj_msgSend(objj_msgSend(CPCursor, "arrowCursor"), "set");
}
,["void","CPEvent"]), new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"), function $CPSplitView__maxPossiblePositionOfDividerAtIndex_(self, _cmd, dividerIndex)
{
    var frame = objj_msgSend(self._subviews[dividerIndex + 1], "frame");
    if (dividerIndex + 1 < objj_msgSend(self._subviews, "count") - 1)
        return frame.origin[self._originComponent] + frame.size[self._sizeComponent] - objj_msgSend(self, "dividerThickness");
    else
        return objj_msgSend(self, "frame").size[self._sizeComponent] - objj_msgSend(self, "dividerThickness");
}
,["float","int"]), new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"), function $CPSplitView__minPossiblePositionOfDividerAtIndex_(self, _cmd, dividerIndex)
{
    if (dividerIndex > 0)
    {
        var frame = objj_msgSend(self._subviews[dividerIndex - 1], "frame");
        return frame.origin[self._originComponent] + frame.size[self._sizeComponent] + objj_msgSend(self, "dividerThickness");
    }
    else
        return 0;
}
,["float","int"]), new objj_method(sel_getUid("_realPositionForPosition:ofDividerAtIndex:"), function $CPSplitView___realPositionForPosition_ofDividerAtIndex_(self, _cmd, position, dividerIndex)
{
    var proposedPosition = objj_msgSend(self, "_sendDelegateSplitViewConstrainSplitPosition:ofSubviewAt:", position, dividerIndex);
    if (!isNaN(parseFloat(proposedPosition)) && isFinite(proposedPosition))
        position = proposedPosition;
    var proposedMax = objj_msgSend(self, "maxPossiblePositionOfDividerAtIndex:", dividerIndex),
        proposedMin = objj_msgSend(self, "minPossiblePositionOfDividerAtIndex:", dividerIndex),
        actualMax = proposedMax,
        actualMin = proposedMin,
        proposedActualMin = objj_msgSend(self, "_sendDelegateSplitViewConstrainMinCoordinate:ofSubviewAt:", proposedMin, dividerIndex),
        proposedActualMax = objj_msgSend(self, "_sendDelegateSplitViewConstrainMaxCoordinate:ofSubviewAt:", proposedMax, dividerIndex);
    if (!isNaN(parseFloat(proposedActualMin)) && isFinite(proposedActualMin))
        actualMin = proposedActualMin;
    if (!isNaN(parseFloat(proposedActualMax)) && isFinite(proposedActualMax))
        actualMax = proposedActualMax;
    var viewA = self._subviews[dividerIndex],
        viewB = self._subviews[dividerIndex + 1],
        realPosition = MAX(MIN(position, actualMax), actualMin);
    if (position < proposedMin + (actualMin - proposedMin) / 2 && objj_msgSend(self, "_sendDelegateSplitViewCanCollapseSubview:", viewA))
        realPosition = proposedMin;
    if (position > proposedMax - (proposedMax - actualMax) / 2 && objj_msgSend(self, "_sendDelegateSplitViewCanCollapseSubview:", viewB))
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
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
    var realPosition = objj_msgSend(self, "_realPositionForPosition:ofDividerAtIndex:", position, dividerIndex),
        viewA = self._subviews[dividerIndex],
        frameA = objj_msgSend(viewA, "frame"),
        viewB = self._subviews[dividerIndex + 1],
        frameB = objj_msgSend(viewB, "frame"),
        preCollapsePosition = 0,
        preSize = frameA.size[self._sizeComponent];
    frameA.size[self._sizeComponent] = realPosition - frameA.origin[self._originComponent];
    if (preSize !== 0 && frameA.size[self._sizeComponent] === 0)
        preCollapsePosition = preSize;
    if (preSize !== frameA.size[self._sizeComponent])
    {
        if ((self._suppressResizeNotificationsMask & DidPostWillResizeNotification) === 0)
        {
            objj_msgSend(self, "_postNotificationWillResize");
            self._suppressResizeNotificationsMask |= DidPostWillResizeNotification;
        }
        objj_msgSend(self._subviews[dividerIndex], "setFrame:", frameA);
        if ((self._suppressResizeNotificationsMask & ShouldSuppressResizeNotifications) !== 0)
            self._suppressResizeNotificationsMask |= DidSuppressResizeNotification;
        else
            objj_msgSend(self, "_postNotificationDidResize");
    }
    preSize = frameB.size[self._sizeComponent];
    var preOrigin = frameB.origin[self._originComponent];
    frameB.size[self._sizeComponent] = frameB.origin[self._originComponent] + frameB.size[self._sizeComponent] - realPosition - objj_msgSend(self, "dividerThickness");
    if (preSize !== 0 && frameB.size[self._sizeComponent] === 0)
        preCollapsePosition = frameB.origin[self._originComponent];
    frameB.origin[self._originComponent] = realPosition + objj_msgSend(self, "dividerThickness");
    if (preSize !== frameB.size[self._sizeComponent] || preOrigin !== frameB.origin[self._originComponent])
    {
        if ((self._suppressResizeNotificationsMask & DidPostWillResizeNotification) === 0)
        {
            objj_msgSend(self, "_postNotificationWillResize");
            self._suppressResizeNotificationsMask |= DidPostWillResizeNotification;
        }
        objj_msgSend(self._subviews[dividerIndex + 1], "setFrame:", frameB);
        if ((self._suppressResizeNotificationsMask & ShouldSuppressResizeNotifications) !== 0)
            self._suppressResizeNotificationsMask |= DidSuppressResizeNotification;
        else
            objj_msgSend(self, "_postNotificationDidResize");
    }
    if (preCollapsePosition)
        objj_msgSend(self._preCollapsePositions, "setObject:forKey:", preCollapsePosition, "" + dividerIndex);
    objj_msgSend(self, "setNeedsDisplay:", YES);
    if ((self._suppressResizeNotificationsMask & DidSuppressResizeNotification) !== 0)
        objj_msgSend(self, "_postNotificationDidResize");
    if (NO)
        self._suppressResizeNotificationsMask |= ShouldSuppressResizeNotifications;
    else
        self._suppressResizeNotificationsMask = 0;
}
,["void","float","int"]), new objj_method(sel_getUid("setFrameSize:"), function $CPSplitView__setFrameSize_(self, _cmd, aSize)
{
    if (self._shouldRestoreFromAutosaveUnlessFrameSize)
        self._shouldAutosave = NO;
    else
        objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "setFrameSize:", aSize);
    if (self._shouldRestoreFromAutosaveUnlessFrameSize)
        self._shouldAutosave = YES;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CGSize"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPSplitView__resizeSubviewsWithOldSize_(self, _cmd, oldSize)
{
    if (objj_msgSend(self, "_delegateRespondsToSplitViewResizeSubviewsWithOldSize"))
    {
        objj_msgSend(self, "_sendDelegateSplitViewResizeSubviewsWithOldSize:", oldSize);
        return;
    }
    objj_msgSend(self, "adjustSubviews");
}
,["void","CGSize"]), new objj_method(sel_getUid("adjustSubviews"), function $CPSplitView__adjustSubviews(self, _cmd)
{
    var count = objj_msgSend(self._subviews, "count");
    if (!count)
        return;
    if ((self._suppressResizeNotificationsMask & DidPostWillResizeNotification) === 0)
    {
        objj_msgSend(self, "_postNotificationWillResize");
        self._suppressResizeNotificationsMask |= DidPostWillResizeNotification;
    }
    objj_msgSend(self, "_postNotificationWillResize");
    var index = 0,
        bounds = objj_msgSend(self, "bounds"),
        boundsSize = bounds.size[self._sizeComponent],
        oldSize = objj_msgSend(self, "_calculateSize"),
        dividerThickness = objj_msgSend(self, "dividerThickness"),
        totalDividers = count - 1,
        oldFlexibleSpace = 0,
        totalSizablePanes = 0,
        isSizableMap = {},
        viewSizes = [];
    for (index = 0; index < count; ++index)
    {
        var view = self._subviews[index],
            isSizable = objj_msgSend(self, "_sendDelegateSplitViewShouldAdjustSizeOfSubview:", view),
            size = objj_msgSend(view, "frame").size[self._sizeComponent];
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
        objj_msgSend(view, "setFrame:", viewFrame);
        bounds.origin[self._originComponent] += targetSize + dividerThickness;
    }
    if ((self._suppressResizeNotificationsMask & ShouldSuppressResizeNotifications) !== 0)
        self._suppressResizeNotificationsMask |= DidSuppressResizeNotification;
    else
        objj_msgSend(self, "_postNotificationDidResize");
}
,["void"]), new objj_method(sel_getUid("setDelegate:"), function $CPSplitView__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitViewDidResizeSubviews:")))
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self._delegate, CPSplitViewDidResizeSubviewsNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitViewWillResizeSubviews:")))
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self._delegate, CPSplitViewWillResizeSubviewsNotification, self);
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitViewDidResizeSubviews:")))
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self._delegate, sel_getUid("splitViewDidResizeSubviews:"), CPSplitViewDidResizeSubviewsNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitViewWillResizeSubviews:")))
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self._delegate, sel_getUid("splitViewWillResizeSubviews:"), CPSplitViewWillResizeSubviewsNotification, self);
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitView:canCollapseSubview:")))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_canCollapseSubview_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitView:shouldAdjustSizeOfSubview:")))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_shouldAdjustSizeOfSubview_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:")))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_shouldCollapseSubview_forDoubleClickOnDividerAtIndex_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:")))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_additionalEffectiveRectOfDividerAtIndex_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:")))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_effectiveRect_forDrawnRect_ofDividerAtIndex_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:")))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_constrainMaxCoordinate_ofSubviewAt_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:")))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_constrainMinCoordinate_ofSubviewAt_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:")))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_constrainSplitPosition_ofSubviewAt_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("splitView:resizeSubviewsWithOldSize:")))
        self._implementedDelegateMethods |= CPSplitViewDelegate_splitView_resizeSubviewsWithOldSize_;
}
,["void","id"]), new objj_method(sel_getUid("setButtonBar:forDividerAtIndex:"), function $CPSplitView__setButtonBar_forDividerAtIndex_(self, _cmd, aButtonBar, dividerIndex)
{
    if (!aButtonBar)
    {
        self._buttonBars[dividerIndex] = nil;
        return;
    }
    var view = objj_msgSend(aButtonBar, "superview"),
        subview = aButtonBar;
    while (view && view !== self)
    {
        subview = view;
        view = objj_msgSend(view, "superview");
    }
    if (view !== self)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "CPSplitView button bar must be a subview of the split view.");
    var viewIndex = objj_msgSend(objj_msgSend(self, "subviews"), "indexOfObject:", subview);
    objj_msgSend(aButtonBar, "setHasResizeControl:", YES);
    objj_msgSend(aButtonBar, "setResizeControlIsLeftAligned:", dividerIndex < viewIndex);
    self._buttonBars[dividerIndex] = aButtonBar;
}
,["void","CPButtonBar","CPUInteger"]), new objj_method(sel_getUid("_postNotificationWillResize"), function $CPSplitView___postNotificationWillResize(self, _cmd)
{
    var userInfo = nil;
    if (self._currentDivider !== CPNotFound)
        userInfo = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self._currentDivider, "CPSplitViewDividerIndex");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPSplitViewWillResizeSubviewsNotification, self, userInfo);
}
,["void"]), new objj_method(sel_getUid("_postNotificationDidResize"), function $CPSplitView___postNotificationDidResize(self, _cmd)
{
    var userInfo = nil;
    if (self._currentDivider !== CPNotFound)
        userInfo = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self._currentDivider, "CPSplitViewDividerIndex");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPSplitViewDidResizeSubviewsNotification, self, userInfo);
    objj_msgSend(self, "_autosave");
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
    var userDefaults = objj_msgSend(CPUserDefaults, "standardUserDefaults"),
        autosaveName = objj_msgSend(self, "_framesKeyForAutosaveName:", objj_msgSend(self, "autosaveName")),
        autosavePrecollapseName = objj_msgSend(self, "_precollapseKeyForAutosaveName:", objj_msgSend(self, "autosaveName")),
        count = objj_msgSend(self._subviews, "count"),
        positions = objj_msgSend(CPMutableArray, "new"),
        preCollapseArray = objj_msgSend(CPMutableArray, "new");
    for (var i = 0; i < count; i++)
    {
        var frame = objj_msgSend(self._subviews[i], "frame");
        objj_msgSend(positions, "addObject:", CGStringFromRect(frame));
        objj_msgSend(preCollapseArray, "addObject:", objj_msgSend(self._preCollapsePositions, "objectForKey:", "" + i));
    }
    objj_msgSend(userDefaults, "setObject:forKey:", positions, autosaveName);
    objj_msgSend(userDefaults, "setObject:forKey:", preCollapseArray, autosavePrecollapseName);
}
,["void"]), new objj_method(sel_getUid("_restoreFromAutosaveIfNeeded"), function $CPSplitView___restoreFromAutosaveIfNeeded(self, _cmd)
{
    if (self._shouldRestoreFromAutosaveUnlessFrameSize && !CGSizeEqualToSize(objj_msgSend(self, "frameSize"), self._shouldRestoreFromAutosaveUnlessFrameSize))
    {
        objj_msgSend(self, "_restoreFromAutosave");
    }
    self._shouldRestoreFromAutosaveUnlessFrameSize = nil;
}
,["void"]), new objj_method(sel_getUid("_restoreFromAutosave"), function $CPSplitView___restoreFromAutosave(self, _cmd)
{
    if (!self._autosaveName)
        return;
    var autosaveName = objj_msgSend(self, "_framesKeyForAutosaveName:", objj_msgSend(self, "autosaveName")),
        autosavePrecollapseName = objj_msgSend(self, "_precollapseKeyForAutosaveName:", objj_msgSend(self, "autosaveName")),
        userDefaults = objj_msgSend(CPUserDefaults, "standardUserDefaults"),
        frames = objj_msgSend(userDefaults, "objectForKey:", autosaveName),
        preCollapseArray = objj_msgSend(userDefaults, "objectForKey:", autosavePrecollapseName);
    if (frames)
    {
        var dividerThickness = objj_msgSend(self, "dividerThickness"),
            position = 0;
        self._shouldAutosave = NO;
        for (var i = 0, count = objj_msgSend(frames, "count") - 1; i < count; i++)
        {
            var frame = CGRectFromString(frames[i]);
            position += frame.size[self._sizeComponent];
            objj_msgSend(self, "setPosition:ofDividerAtIndex:", position, i);
            position += dividerThickness;
        }
        self._shouldAutosave = YES;
    }
    if (preCollapseArray)
    {
        self._preCollapsePositions = objj_msgSend(CPMutableDictionary, "new");
        for (var i = 0, count = objj_msgSend(preCollapseArray, "count"); i < count; i++)
        {
            var item = preCollapseArray[i];
            if (item === nil)
                objj_msgSend(self._preCollapsePositions, "removeObjectForKey:", String(i));
            else
                objj_msgSend(self._preCollapsePositions, "setObject:forKey:", item, String(i));
        }
    }
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
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 1.0, "divider-thickness", 10.0, "pane-divider-thickness", objj_msgSend(CPColor, "grayColor"), "pane-divider-color", objj_msgSend(CPNull, "null"), "horizontal-divider-color", objj_msgSend(CPNull, "null"), "vertical-divider-color");
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
    return objj_msgSend(self._delegate, "splitView:canCollapseSubview:", self, aView);
}
,["BOOL","CPView"]), new objj_method(sel_getUid("_sendDelegateSplitViewShouldAdjustSizeOfSubview:"), function $CPSplitView___sendDelegateSplitViewShouldAdjustSizeOfSubview_(self, _cmd, aView)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_shouldAdjustSizeOfSubview_))
        return YES;
    return objj_msgSend(self._delegate, "splitView:shouldAdjustSizeOfSubview:", self, aView);
}
,["BOOL","CPView"]), new objj_method(sel_getUid("_sendDelegateSplitViewShouldCollapseSubview:forDoubleClickOnDividerAtIndex:"), function $CPSplitView___sendDelegateSplitViewShouldCollapseSubview_forDoubleClickOnDividerAtIndex_(self, _cmd, aView, anIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_shouldCollapseSubview_forDoubleClickOnDividerAtIndex_))
        return NO;
    return objj_msgSend(self._delegate, "splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self, aView, anIndex);
}
,["BOOL","CPView","int"]), new objj_method(sel_getUid("_sendDelegateSplitViewAdditionalEffectiveRectOfDividerAtIndex:"), function $CPSplitView___sendDelegateSplitViewAdditionalEffectiveRectOfDividerAtIndex_(self, _cmd, anIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_additionalEffectiveRectOfDividerAtIndex_))
        return nil;
    return objj_msgSend(self._delegate, "splitView:additionalEffectiveRectOfDividerAtIndex:", self, anIndex);
}
,["CGRect","int"]), new objj_method(sel_getUid("_sendDelegateSplitViewEffectiveRect:forDrawnRect:ofDividerAtIndex:"), function $CPSplitView___sendDelegateSplitViewEffectiveRect_forDrawnRect_ofDividerAtIndex_(self, _cmd, proposedEffectiveRect, drawnRect, dividerIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_effectiveRect_forDrawnRect_ofDividerAtIndex_))
        return proposedEffectiveRect;
    return objj_msgSend(self._delegate, "splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:", self, proposedEffectiveRect, drawnRect, dividerIndex);
}
,["CGRect","CGRect","CGRect","CPInteger"]), new objj_method(sel_getUid("_sendDelegateSplitViewConstrainMaxCoordinate:ofSubviewAt:"), function $CPSplitView___sendDelegateSplitViewConstrainMaxCoordinate_ofSubviewAt_(self, _cmd, proposedMax, dividerIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_constrainMaxCoordinate_ofSubviewAt_))
        return nil;
    return objj_msgSend(self._delegate, "splitView:constrainMaxCoordinate:ofSubviewAt:", self, proposedMax, dividerIndex);
}
,["float","float","CPInteger"]), new objj_method(sel_getUid("_sendDelegateSplitViewConstrainMinCoordinate:ofSubviewAt:"), function $CPSplitView___sendDelegateSplitViewConstrainMinCoordinate_ofSubviewAt_(self, _cmd, proposedMin, dividerIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_constrainMinCoordinate_ofSubviewAt_))
        return nil;
    return objj_msgSend(self._delegate, "splitView:constrainMinCoordinate:ofSubviewAt:", self, proposedMin, dividerIndex);
}
,["float","float","CPInteger"]), new objj_method(sel_getUid("_sendDelegateSplitViewConstrainSplitPosition:ofSubviewAt:"), function $CPSplitView___sendDelegateSplitViewConstrainSplitPosition_ofSubviewAt_(self, _cmd, proposedMax, dividerIndex)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_constrainSplitPosition_ofSubviewAt_))
        return nil;
    return objj_msgSend(self._delegate, "splitView:constrainSplitPosition:ofSubviewAt:", self, proposedMax, dividerIndex);
}
,["float","float","CPInteger"]), new objj_method(sel_getUid("_sendDelegateSplitViewResizeSubviewsWithOldSize:"), function $CPSplitView___sendDelegateSplitViewResizeSubviewsWithOldSize_(self, _cmd, oldSize)
{
    if (!(self._implementedDelegateMethods & CPSplitViewDelegate_splitView_resizeSubviewsWithOldSize_))
        return;
    objj_msgSend(self._delegate, "splitView:resizeSubviewsWithOldSize:", self, oldSize);
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
    self._autosaveName = objj_msgSend(aCoder, "decodeObjectForKey:", CPSplitViewAutosaveNameKey);
    if (self._autosaveName)
    {
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("_restoreFromAutosaveIfNeeded"), self, nil, 0, [CPDefaultRunLoopMode]);
    }
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._suppressResizeNotificationsMask = 0;
        self._preCollapsePositions = objj_msgSend(CPMutableDictionary, "new");
        self._currentDivider = CPNotFound;
        self._shouldAutosave = YES;
        self._DOMDividerElements = [];
        self._buttonBars = objj_msgSend(aCoder, "decodeObjectForKey:", CPSplitViewButtonBarsKey) || [];
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPSplitViewDelegateKey));
        self._isPaneSplitter = objj_msgSend(aCoder, "decodeBoolForKey:", CPSplitViewIsPaneSplitterKey);
        objj_msgSend(self, "_setVertical:", objj_msgSend(aCoder, "decodeBoolForKey:", CPSplitViewIsVerticalKey));
        if (self._autosaveName)
        {
            objj_msgSend(self, "_restoreFromAutosave");
            self._shouldRestoreFromAutosaveUnlessFrameSize = objj_msgSend(self, "frameSize");
        }
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSplitView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", self._delegate, CPSplitViewDelegateKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isVertical, CPSplitViewIsVerticalKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isPaneSplitter, CPSplitViewIsPaneSplitterKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._autosaveName, CPSplitViewAutosaveNameKey);
}
,["void","CPCoder"])]);
}