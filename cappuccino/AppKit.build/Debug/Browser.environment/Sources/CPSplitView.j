@STATIC;1.0;i;13;CPButtonBar.ji;9;CPImage.ji;8;CPView.jt;42083;



objj_executeFile("CPButtonBar.j", YES);
objj_executeFile("CPImage.j", YES);
objj_executeFile("CPView.j", YES);
CPSplitViewDidResizeSubviewsNotification = "CPSplitViewDidResizeSubviewsNotification";
CPSplitViewWillResizeSubviewsNotification = "CPSplitViewWillResizeSubviewsNotification";

var CPSplitViewHorizontalImage = nil,
    CPSplitViewVerticalImage = nil,

    ShouldSuppressResizeNotifications = 1,
    DidPostWillResizeNotification = 1 << 1,
    DidSuppressResizeNotification = 1 << 2;
{var the_class = objj_allocateClassPair(CPView, "CPSplitView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_isVertical"), new objj_ivar("_isPaneSplitter"), new objj_ivar("_currentDivider"), new objj_ivar("_initialOffset"), new objj_ivar("_preCollapsePositions"), new objj_ivar("_originComponent"), new objj_ivar("_sizeComponent"), new objj_ivar("_DOMDividerElements"), new objj_ivar("_dividerImagePath"), new objj_ivar("_drawingDivider"), new objj_ivar("_autosaveName"), new objj_ivar("_shouldAutosave"), new objj_ivar("_shouldRestoreFromAutosaveUnlessFrameSize"), new objj_ivar("_needsResizeSubviews"), new objj_ivar("_suppressResizeNotificationsMask"), new objj_ivar("_buttonBars")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPSplitView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "initWithFrame:", aFrame))
    {
        _suppressResizeNotificationsMask = 0;
        _preCollapsePositions = objj_msgSend(CPMutableDictionary, "new");
        _currentDivider = CPNotFound;

        _DOMDividerElements = [];
        _buttonBars = [];

        _shouldAutosave = YES;

        objj_msgSend(self, "_setVertical:", YES);
    }

    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("dividerThickness"), function $CPSplitView__dividerThickness(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", objj_msgSend(self, "isPaneSplitter") ? "pane-divider-thickness" : "divider-thickness");
}
},["float"]), new objj_method(sel_getUid("isVertical"), function $CPSplitView__isVertical(self, _cmd)
{ with(self)
{
    return _isVertical;
}
},["BOOL"]), new objj_method(sel_getUid("setVertical:"), function $CPSplitView__setVertical_(self, _cmd, shouldBeVertical)
{ with(self)
{
    if (!objj_msgSend(self, "_setVertical:", shouldBeVertical))
        return;


    var frame = objj_msgSend(self, "frame"),
        dividerThickness = objj_msgSend(self, "dividerThickness");

    objj_msgSend(self, "_postNotificationWillResize");

    var eachSize = ROUND((frame.size[_sizeComponent] - dividerThickness * (_subviews.length - 1)) / _subviews.length),
        index = 0,
        count = _subviews.length;

    if (objj_msgSend(self, "isVertical"))
    {
        for (; index < count; ++index)
            objj_msgSend(_subviews[index], "setFrame:", CGRectMake(ROUND((eachSize + dividerThickness) * index), 0, eachSize, frame.size.height));
    }
    else
    {
        for (; index < count; ++index)
            objj_msgSend(_subviews[index], "setFrame:", CGRectMake(0, ROUND((eachSize + dividerThickness) * index), frame.size.width, eachSize));
    }

    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "_postNotificationDidResize");

}
},["void","BOOL"]), new objj_method(sel_getUid("_setVertical:"), function $CPSplitView___setVertical_(self, _cmd, shouldBeVertical)
{ with(self)
{
    var changed = (_isVertical != shouldBeVertical);

    _isVertical = shouldBeVertical;

    _originComponent = objj_msgSend(self, "isVertical") ? "x" : "y";
    _sizeComponent = objj_msgSend(self, "isVertical") ? "width" : "height";
    _dividerImagePath = objj_msgSend(self, "isVertical") ? objj_msgSend(CPSplitViewVerticalImage, "filename") : objj_msgSend(CPSplitViewHorizontalImage, "filename");

    return changed;
}
},["BOOL","BOOL"]), new objj_method(sel_getUid("isPaneSplitter"), function $CPSplitView__isPaneSplitter(self, _cmd)
{ with(self)
{
    return _isPaneSplitter;
}
},["BOOL"]), new objj_method(sel_getUid("setIsPaneSplitter:"), function $CPSplitView__setIsPaneSplitter_(self, _cmd, shouldBePaneSplitter)
{ with(self)
{
    if (_isPaneSplitter == shouldBePaneSplitter)
        return;

    _isPaneSplitter = shouldBePaneSplitter;

    if (_DOMDividerElements[_drawingDivider])
        objj_msgSend(self, "_setupDOMDivider");



    _needsResizeSubviews = YES;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","BOOL"]), new objj_method(sel_getUid("didAddSubview:"), function $CPSplitView__didAddSubview_(self, _cmd, aSubview)
{ with(self)
{
    _needsResizeSubviews = YES;
}
},["void","CPView"]), new objj_method(sel_getUid("isSubviewCollapsed:"), function $CPSplitView__isSubviewCollapsed_(self, _cmd, subview)
{ with(self)
{
    return objj_msgSend(subview, "frame").size[_sizeComponent] < 1 ? YES : NO;
}
},["BOOL","CPView"]), new objj_method(sel_getUid("rectOfDividerAtIndex:"), function $CPSplitView__rectOfDividerAtIndex_(self, _cmd, aDivider)
{ with(self)
{
    var frame = objj_msgSend(_subviews[aDivider], "frame"),
        rect = CGRectMakeZero();

    rect.size = objj_msgSend(self, "frame").size;
    rect.size[_sizeComponent] = objj_msgSend(self, "dividerThickness");
    rect.origin[_originComponent] = frame.origin[_originComponent] + frame.size[_sizeComponent];

    return rect;
}
},["CGRect","int"]), new objj_method(sel_getUid("effectiveRectOfDividerAtIndex:"), function $CPSplitView__effectiveRectOfDividerAtIndex_(self, _cmd, aDivider)
{ with(self)
{
    var realRect = objj_msgSend(self, "rectOfDividerAtIndex:", aDivider),
        padding = 2;

    realRect.size[_sizeComponent] += padding * 2;
    realRect.origin[_originComponent] -= padding;

    return realRect;
}
},["CGRect","int"]), new objj_method(sel_getUid("drawRect:"), function $CPSplitView__drawRect_(self, _cmd, rect)
{ with(self)
{
    var count = objj_msgSend(_subviews, "count") - 1;

    while ((count--) > 0)
    {
        _drawingDivider = count;
        objj_msgSend(self, "drawDividerInRect:", objj_msgSend(self, "rectOfDividerAtIndex:", count));
    }
}
},["void","CGRect"]), new objj_method(sel_getUid("willRemoveSubview:"), function $CPSplitView__willRemoveSubview_(self, _cmd, aView)
{ with(self)
{

    var dividerToRemove = _DOMDividerElements.pop();


    if (dividerToRemove)
        _DOMElement.removeChild(dividerToRemove);


    _needsResizeSubviews = YES;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPView"]), new objj_method(sel_getUid("layoutSubviews"), function $CPSplitView__layoutSubviews(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize")
}
},["void"]), new objj_method(sel_getUid("drawDividerInRect:"), function $CPSplitView__drawDividerInRect_(self, _cmd, aRect)
{ with(self)
{

    if (!_DOMDividerElements[_drawingDivider])
    {
        _DOMDividerElements[_drawingDivider] = document.createElement("div");

        _DOMDividerElements[_drawingDivider].style.position = "absolute";
        _DOMDividerElements[_drawingDivider].style.backgroundRepeat = "repeat";

        _DOMElement.appendChild(_DOMDividerElements[_drawingDivider]);
    }

    objj_msgSend(self, "_setupDOMDivider");
    if (NULL) var ____p = { x:CGPointMake((aRect.origin.x), (aRect.origin.y)).x * NULL.a + CGPointMake((aRect.origin.x), (aRect.origin.y)).y * NULL.c + NULL.tx, y:CGPointMake((aRect.origin.x), (aRect.origin.y)).x * NULL.b + CGPointMake((aRect.origin.x), (aRect.origin.y)).y * NULL.d + NULL.ty }; else var ____p = { x:(aRect.origin.x), y:(aRect.origin.y) }; _DOMDividerElements[_drawingDivider].style.left = ROUND(____p.x) + "px";_DOMDividerElements[_drawingDivider].style.top = ROUND(____p.y) + "px";;
    _DOMDividerElements[_drawingDivider].style.width = MAX(0.0, ROUND((aRect.size.width))) + "px"; _DOMDividerElements[_drawingDivider].style.height = MAX(0.0, ROUND((aRect.size.height))) + "px";;

}
},["void","CGRect"]), new objj_method(sel_getUid("_setupDOMDivider"), function $CPSplitView___setupDOMDivider(self, _cmd)
{ with(self)
{
    if (_isPaneSplitter)
    {
        _DOMDividerElements[_drawingDivider].style.backgroundColor = "";
        _DOMDividerElements[_drawingDivider].style.backgroundImage = "url('"+_dividerImagePath+"')";
    }
    else
    {
        _DOMDividerElements[_drawingDivider].style.backgroundColor = objj_msgSend(objj_msgSend(self, "currentValueForThemeAttribute:", "pane-divider-color"), "cssString");
        _DOMDividerElements[_drawingDivider].style.backgroundImage = "";
    }
}
},["void"]), new objj_method(sel_getUid("viewWillDraw"), function $CPSplitView__viewWillDraw(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
}
},["void"]), new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"), function $CPSplitView___adjustSubviewsWithCalculatedSize(self, _cmd)
{ with(self)
{
    if (!_needsResizeSubviews)
        return;

    _needsResizeSubviews = NO;

    objj_msgSend(self, "resizeSubviewsWithOldSize:", objj_msgSend(self, "_calculateSize"));
}
},["void"]), new objj_method(sel_getUid("_calculateSize"), function $CPSplitView___calculateSize(self, _cmd)
{ with(self)
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
        size[_sizeComponent] += objj_msgSend(subviews[count], "frame").size[_sizeComponent];

    return size;
}
},["CGSize"]), new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"), function $CPSplitView__cursorAtPoint_hitDividerAtIndex_(self, _cmd, aPoint, anIndex)
{ with(self)
{
    var frame = objj_msgSend(_subviews[anIndex], "frame"),
        startPosition = frame.origin[_originComponent] + frame.size[_sizeComponent],
        effectiveRect = objj_msgSend(self, "effectiveRectOfDividerAtIndex:", anIndex),
        buttonBar = _buttonBars[anIndex],
        buttonBarRect = null,
        additionalRect = null;

    if (buttonBar != null)
    {
        buttonBarRect = objj_msgSend(buttonBar, "resizeControlFrame");
        buttonBarRect.origin = objj_msgSend(self, "convertPoint:fromView:", buttonBarRect.origin, buttonBar);
    }

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:")))
        effectiveRect = objj_msgSend(_delegate, "splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:", self, effectiveRect, effectiveRect, anIndex);

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:")))
        additionalRect = objj_msgSend(_delegate, "splitView:additionalEffectiveRectOfDividerAtIndex:", self, anIndex);

    return CGRectContainsPoint(effectiveRect, aPoint) ||
           (additionalRect && CGRectContainsPoint(additionalRect, aPoint)) ||
           (buttonBarRect && CGRectContainsPoint(buttonBarRect, aPoint));
}
},["BOOL","CGPoint","int"]), new objj_method(sel_getUid("hitTest:"), function $CPSplitView__hitTest_(self, _cmd, aPoint)
{ with(self)
{
    if (objj_msgSend(self, "isHidden") || !objj_msgSend(self, "hitTests") || !CGRectContainsPoint(objj_msgSend(self, "frame"), aPoint))
        return nil;

    var point = objj_msgSend(self, "convertPoint:fromView:", aPoint, objj_msgSend(self, "superview")),
        count = objj_msgSend(_subviews, "count") - 1;

    for (var i = 0; i < count; i++)
    {
        if (objj_msgSend(self, "cursorAtPoint:hitDividerAtIndex:", point, i))
            return self;
    }

    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "hitTest:", aPoint);
}
},["CPView","CGPoint"]), new objj_method(sel_getUid("trackDivider:"), function $CPSplitView__trackDivider_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");

    if (type == CPLeftMouseUp)
    {

        _shouldAutosave = YES;

        if (_currentDivider != CPNotFound)
        {
            _currentDivider = CPNotFound;
            objj_msgSend(self, "_autosave");
            objj_msgSend(self, "_updateResizeCursor:", anEvent);
        }

        return;
    }

    if (type == CPLeftMouseDown)
    {
        var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
            count = objj_msgSend(_subviews, "count") - 1;

        _currentDivider = CPNotFound;

        for (var i = 0; i < count; i++)
        {
            var frame = objj_msgSend(_subviews[i], "frame"),
                startPosition = frame.origin[_originComponent] + frame.size[_sizeComponent];

            if (objj_msgSend(self, "cursorAtPoint:hitDividerAtIndex:", point, i))
            {
                if (objj_msgSend(anEvent, "clickCount") == 2 &&
                    objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:canCollapseSubview:")) &&
                    objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:")))
                {
                    var minPosition = objj_msgSend(self, "minPossiblePositionOfDividerAtIndex:", i),
                        maxPosition = objj_msgSend(self, "maxPossiblePositionOfDividerAtIndex:", i),
                        preCollapsePosition = objj_msgSend(_preCollapsePositions, "objectForKey:", "" + i) || 0;

                    if (objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, _subviews[i]) && objj_msgSend(_delegate, "splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self, _subviews[i], i))
                    {
                        if (objj_msgSend(self, "isSubviewCollapsed:", _subviews[i]))
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", preCollapsePosition ? preCollapsePosition : (minPosition + (maxPosition - minPosition) / 2), i);
                        else
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", minPosition, i);
                    }
                    else if (objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, _subviews[i + 1]) && objj_msgSend(_delegate, "splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self, _subviews[i + 1], i))
                    {
                        if (objj_msgSend(self, "isSubviewCollapsed:", _subviews[i + 1]))
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", preCollapsePosition ? preCollapsePosition : (minPosition + (maxPosition - minPosition) / 2), i);
                        else
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", maxPosition, i);
                    }
                }
                else
                {
                    _currentDivider = i;
                    _initialOffset = startPosition - point[_originComponent];


                    _shouldAutosave = NO;
                    objj_msgSend(self, "_postNotificationWillResize");
                }
            }
        }

        if (_currentDivider === CPNotFound)
            return;
    }

    else if (type == CPLeftMouseDragged && _currentDivider != CPNotFound)
    {
        var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);

        objj_msgSend(self, "setPosition:ofDividerAtIndex:", (point[_originComponent] + _initialOffset), _currentDivider);

        objj_msgSend(self, "_updateResizeCursor:", anEvent);
    }

    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackDivider:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPSplitView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{

    objj_msgSend(self, "trackDivider:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $CPSplitView__viewDidMoveToWindow(self, _cmd)
{ with(self)
{


}
},["void"]), new objj_method(sel_getUid("mouseEntered:"), function $CPSplitView__mouseEntered_(self, _cmd, anEvent)
{ with(self)
{

    if (_currentDivider == CPNotFound)
        objj_msgSend(self, "_updateResizeCursor:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseMoved:"), function $CPSplitView__mouseMoved_(self, _cmd, anEvent)
{ with(self)
{
    if (_currentDivider == CPNotFound)
        objj_msgSend(self, "_updateResizeCursor:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $CPSplitView__mouseExited_(self, _cmd, anEvent)
{ with(self)
{
    if (_currentDivider == CPNotFound)

        objj_msgSend(objj_msgSend(CPCursor, "arrowCursor"), "set");
}
},["void","CPEvent"]), new objj_method(sel_getUid("_updateResizeCursor:"), function $CPSplitView___updateResizeCursor_(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);

    if (objj_msgSend(anEvent, "type") === CPLeftMouseUp && !objj_msgSend(objj_msgSend(self, "window"), "acceptsMouseMovedEvents"))
    {
        objj_msgSend(objj_msgSend(CPCursor, "arrowCursor"), "set");
        return;
    }

    for (var i = 0, count = objj_msgSend(_subviews, "count") - 1; i < count; i++)
    {

        if (_currentDivider === i || (_currentDivider == CPNotFound && objj_msgSend(self, "cursorAtPoint:hitDividerAtIndex:", point, i)))
        {
            var frameA = objj_msgSend(_subviews[i], "frame"),
                sizeA = frameA.size[_sizeComponent],
                startPosition = frameA.origin[_originComponent] + sizeA,
                frameB = objj_msgSend(_subviews[i + 1], "frame"),
                sizeB = frameB.size[_sizeComponent],
                canShrink = objj_msgSend(self, "_realPositionForPosition:ofDividerAtIndex:", startPosition - 1, i) < startPosition,
                canGrow = objj_msgSend(self, "_realPositionForPosition:ofDividerAtIndex:", startPosition + 1, i) > startPosition,
                cursor = objj_msgSend(CPCursor, "arrowCursor");

            if (sizeA === 0)
                canGrow = YES;
            else if (!canShrink &&
                     objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:canCollapseSubview:")) &&
                     objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, _subviews[i]))
            {
                canShrink = YES;
            }

            if (sizeB === 0)
            {

                canGrow = NO;

                canShrink = YES;
            }
            else if (!canGrow &&
                     objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:canCollapseSubview:")) &&
                     objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, _subviews[i + 1]))
            {
                canGrow = YES;
            }

            if (_isVertical && canShrink && canGrow)
                cursor = objj_msgSend(CPCursor, "resizeLeftRightCursor");
            else if (_isVertical && canShrink)
                cursor = objj_msgSend(CPCursor, "resizeLeftCursor");
            else if (_isVertical && canGrow)
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
},["void","CPEvent"]), new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"), function $CPSplitView__maxPossiblePositionOfDividerAtIndex_(self, _cmd, dividerIndex)
{ with(self)
{
    var frame = objj_msgSend(_subviews[dividerIndex + 1], "frame");

    if (dividerIndex + 1 < objj_msgSend(_subviews, "count") - 1)
        return frame.origin[_originComponent] + frame.size[_sizeComponent] - objj_msgSend(self, "dividerThickness");
    else
        return objj_msgSend(self, "frame").size[_sizeComponent] - objj_msgSend(self, "dividerThickness");
}
},["float","int"]), new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"), function $CPSplitView__minPossiblePositionOfDividerAtIndex_(self, _cmd, dividerIndex)
{ with(self)
{
    if (dividerIndex > 0)
    {
        var frame = objj_msgSend(_subviews[dividerIndex - 1], "frame");

        return frame.origin[_originComponent] + frame.size[_sizeComponent] + objj_msgSend(self, "dividerThickness");
    }
    else
        return 0;
}
},["float","int"]), new objj_method(sel_getUid("_realPositionForPosition:ofDividerAtIndex:"), function $CPSplitView___realPositionForPosition_ofDividerAtIndex_(self, _cmd, position, dividerIndex)
{ with(self)
{

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:")))
    {
        var proposedPosition = objj_msgSend(_delegate, "splitView:constrainSplitPosition:ofSubviewAt:", self, position, dividerIndex);




        if ((!isNaN(parseFloat(proposedPosition)) && isFinite(proposedPosition)))
            position = proposedPosition;
    }

    var proposedMax = objj_msgSend(self, "maxPossiblePositionOfDividerAtIndex:", dividerIndex),
        proposedMin = objj_msgSend(self, "minPossiblePositionOfDividerAtIndex:", dividerIndex),
        actualMax = proposedMax,
        actualMin = proposedMin;

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:")))
    {
        var proposedActualMin = objj_msgSend(_delegate, "splitView:constrainMinCoordinate:ofSubviewAt:", self, proposedMin, dividerIndex);

        if ((!isNaN(parseFloat(proposedActualMin)) && isFinite(proposedActualMin)))
            actualMin = proposedActualMin;
    }

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:")))
    {
        var proposedActualMax = objj_msgSend(_delegate, "splitView:constrainMaxCoordinate:ofSubviewAt:", self, proposedMax, dividerIndex);

        if ((!isNaN(parseFloat(proposedActualMax)) && isFinite(proposedActualMax)))
            actualMax = proposedActualMax;
    }

    var viewA = _subviews[dividerIndex],
        viewB = _subviews[dividerIndex + 1],
        realPosition = MAX(MIN(position, actualMax), actualMin);


    if (position < proposedMin + (actualMin - proposedMin) / 2)
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:canCollapseSubview:")))
            if (objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, viewA))
                realPosition = proposedMin;


    if (position > proposedMax - (proposedMax - actualMax) / 2)
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:canCollapseSubview:")))
            if (objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, viewB))
                realPosition = proposedMax;

    return realPosition;
}
},["int","float","int"]), new objj_method(sel_getUid("setPosition:ofDividerAtIndex:"), function $CPSplitView__setPosition_ofDividerAtIndex_(self, _cmd, position, dividerIndex)
{ with(self)
{


    _shouldRestoreFromAutosaveUnlessFrameSize = nil;

    if (YES) _suppressResizeNotificationsMask |= ShouldSuppressResizeNotifications; else _suppressResizeNotificationsMask = 0;;
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");

    var realPosition = objj_msgSend(self, "_realPositionForPosition:ofDividerAtIndex:", position, dividerIndex),
        viewA = _subviews[dividerIndex],
        frameA = objj_msgSend(viewA, "frame"),
        viewB = _subviews[dividerIndex + 1],
        frameB = objj_msgSend(viewB, "frame"),
        preCollapsePosition = 0,
        preSize = frameA.size[_sizeComponent];

    frameA.size[_sizeComponent] = realPosition - frameA.origin[_originComponent];

    if (preSize !== 0 && frameA.size[_sizeComponent] === 0)
        preCollapsePosition = preSize;

    if (preSize !== frameA.size[_sizeComponent])
    {
        if ((_suppressResizeNotificationsMask & DidPostWillResizeNotification) === 0) { objj_msgSend(self, "_postNotificationWillResize"); _suppressResizeNotificationsMask |= DidPostWillResizeNotification; };
        objj_msgSend(_subviews[dividerIndex], "setFrame:", frameA);
        if ((_suppressResizeNotificationsMask & ShouldSuppressResizeNotifications) !== 0) _suppressResizeNotificationsMask |= DidSuppressResizeNotification; else objj_msgSend(self, "_postNotificationDidResize");;
    }

    preSize = frameB.size[_sizeComponent];

    var preOrigin = frameB.origin[_originComponent];
    frameB.size[_sizeComponent] = frameB.origin[_originComponent] + frameB.size[_sizeComponent] - realPosition - objj_msgSend(self, "dividerThickness");

    if (preSize !== 0 && frameB.size[_sizeComponent] === 0)
        preCollapsePosition = frameB.origin[_originComponent];

    frameB.origin[_originComponent] = realPosition + objj_msgSend(self, "dividerThickness");

    if (preSize !== frameB.size[_sizeComponent] || preOrigin !== frameB.origin[_originComponent])
    {
        if ((_suppressResizeNotificationsMask & DidPostWillResizeNotification) === 0) { objj_msgSend(self, "_postNotificationWillResize"); _suppressResizeNotificationsMask |= DidPostWillResizeNotification; };
        objj_msgSend(_subviews[dividerIndex + 1], "setFrame:", frameB);
        if ((_suppressResizeNotificationsMask & ShouldSuppressResizeNotifications) !== 0) _suppressResizeNotificationsMask |= DidSuppressResizeNotification; else objj_msgSend(self, "_postNotificationDidResize");;
    }

    if (preCollapsePosition)
        objj_msgSend(_preCollapsePositions, "setObject:forKey:", preCollapsePosition, "" + dividerIndex);

    objj_msgSend(self, "setNeedsDisplay:", YES);

    if (((_suppressResizeNotificationsMask & DidSuppressResizeNotification) !== 0))
        objj_msgSend(self, "_postNotificationDidResize");

    if (NO) _suppressResizeNotificationsMask |= ShouldSuppressResizeNotifications; else _suppressResizeNotificationsMask = 0;;
}
},["void","float","int"]), new objj_method(sel_getUid("setFrameSize:"), function $CPSplitView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    if (_shouldRestoreFromAutosaveUnlessFrameSize)
        _shouldAutosave = NO;
    else
        objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");

    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "setFrameSize:", aSize);

    if (_shouldRestoreFromAutosaveUnlessFrameSize)
        _shouldAutosave = YES;

    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CGSize"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPSplitView__resizeSubviewsWithOldSize_(self, _cmd, oldSize)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:resizeSubviewsWithOldSize:")))
    {
        objj_msgSend(_delegate, "splitView:resizeSubviewsWithOldSize:", self, oldSize);
        return;
    }

    objj_msgSend(self, "adjustSubviews");
}
},["void","CPSize"]), new objj_method(sel_getUid("adjustSubviews"), function $CPSplitView__adjustSubviews(self, _cmd)
{ with(self)
{
    var count = objj_msgSend(_subviews, "count");

    if (!count)
        return;

    if ((_suppressResizeNotificationsMask & DidPostWillResizeNotification) === 0) { objj_msgSend(self, "_postNotificationWillResize"); _suppressResizeNotificationsMask |= DidPostWillResizeNotification; };
    objj_msgSend(self, "_postNotificationWillResize");

    var index = 0,
        bounds = objj_msgSend(self, "bounds"),
        boundsSize = bounds.size[_sizeComponent],
        oldSize = objj_msgSend(self, "_calculateSize"),
        dividerThickness = objj_msgSend(self, "dividerThickness"),
        totalDividers = count - 1,
        oldFlexibleSpace = 0,
        totalSizablePanes = 0,
        isSizableMap = {},
        viewSizes = [],
        delegateRespondsToShouldAdjust = objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:shouldAdjustSizeOfSubview:"));
    for (index = 0; index < count; ++index)
    {
        var view = _subviews[index],
            isSizable = !delegateRespondsToShouldAdjust || objj_msgSend(_delegate, "splitView:shouldAdjustSizeOfSubview:", self, view),
            size = objj_msgSend(view, "frame").size[_sizeComponent];

        isSizableMap[index] = isSizable;
        viewSizes.push(size);

        if (isSizable)
        {
            oldFlexibleSpace += size;
            totalSizablePanes++;
        }
    }


    var nonSizableSpace = oldSize[_sizeComponent] - oldFlexibleSpace,
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
        var view = _subviews[index],
            viewFrame = CGRectMakeCopy(bounds),
            isSizable = isSizableMap[index],
            targetSize = 0;


        if (index + 1 === count)
            targetSize = boundsSize - viewFrame.origin[_originComponent];

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
        viewFrame.size[_sizeComponent] = targetSize;
        objj_msgSend(view, "setFrame:", viewFrame);
        bounds.origin[_originComponent] += targetSize + dividerThickness;
    }

    if ((_suppressResizeNotificationsMask & ShouldSuppressResizeNotifications) !== 0) _suppressResizeNotificationsMask |= DidSuppressResizeNotification; else objj_msgSend(self, "_postNotificationDidResize");;
}
},["void"]), new objj_method(sel_getUid("setDelegate:"), function $CPSplitView__setDelegate_(self, _cmd, delegate)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitViewDidResizeSubviews:")))
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", _delegate, CPSplitViewDidResizeSubviewsNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitViewWillResizeSubviews:")))
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", _delegate, CPSplitViewWillResizeSubviewsNotification, self);

   _delegate = delegate;

   if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitViewDidResizeSubviews:")))
       objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", _delegate, sel_getUid("splitViewDidResizeSubviews:"), CPSplitViewDidResizeSubviewsNotification, self);
   if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitViewWillResizeSubviews:")))
       objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", _delegate, sel_getUid("splitViewWillResizeSubviews:"), CPSplitViewWillResizeSubviewsNotification, self);
}
},["void","id"]), new objj_method(sel_getUid("setButtonBar:forDividerAtIndex:"), function $CPSplitView__setButtonBar_forDividerAtIndex_(self, _cmd, aButtonBar, dividerIndex)
{ with(self)
{
    if (!aButtonBar)
    {
        _buttonBars[dividerIndex] = nil;
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

    _buttonBars[dividerIndex] = aButtonBar;
}
},["void","CPButtonBar","unsigned"]), new objj_method(sel_getUid("_postNotificationWillResize"), function $CPSplitView___postNotificationWillResize(self, _cmd)
{ with(self)
{
    var userInfo = nil;

    if (_currentDivider !== CPNotFound)
        userInfo = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", _currentDivider, "CPSplitViewDividerIndex");

    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPSplitViewWillResizeSubviewsNotification, self, userInfo);
}
},["void"]), new objj_method(sel_getUid("_postNotificationDidResize"), function $CPSplitView___postNotificationDidResize(self, _cmd)
{ with(self)
{
    var userInfo = nil;

    if (_currentDivider !== CPNotFound)
        userInfo = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", _currentDivider, "CPSplitViewDividerIndex");

    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPSplitViewDidResizeSubviewsNotification, self, userInfo);




    objj_msgSend(self, "_autosave");
}
},["void"]), new objj_method(sel_getUid("setAutosaveName:"), function $CPSplitView__setAutosaveName_(self, _cmd, autosaveName)
{ with(self)
{
    if (_autosaveName == autosaveName)
        return;

    _autosaveName = autosaveName;
}
},["void","CPString"]), new objj_method(sel_getUid("autosaveName"), function $CPSplitView__autosaveName(self, _cmd)
{ with(self)
{
    return _autosaveName;
}
},["CPString"]), new objj_method(sel_getUid("_autosave"), function $CPSplitView___autosave(self, _cmd)
{ with(self)
{
    if (_shouldRestoreFromAutosaveUnlessFrameSize || !_shouldAutosave || !_autosaveName)
        return;

    var userDefaults = objj_msgSend(CPUserDefaults, "standardUserDefaults"),
        autosaveName = objj_msgSend(self, "_framesKeyForAutosaveName:", objj_msgSend(self, "autosaveName")),
        autosavePrecollapseName = objj_msgSend(self, "_precollapseKeyForAutosaveName:", objj_msgSend(self, "autosaveName")),
        count = objj_msgSend(_subviews, "count"),
        positions = objj_msgSend(CPMutableArray, "new"),
        preCollapseArray = objj_msgSend(CPMutableArray, "new");

    for (var i = 0; i < count; i++)
    {
        var frame = objj_msgSend(_subviews[i], "frame");
        objj_msgSend(positions, "addObject:", CPStringFromRect(frame));
        objj_msgSend(preCollapseArray, "addObject:", objj_msgSend(_preCollapsePositions, "objectForKey:", "" + i));
    }

    objj_msgSend(userDefaults, "setObject:forKey:", positions, autosaveName);
    objj_msgSend(userDefaults, "setObject:forKey:", preCollapseArray, autosavePrecollapseName);
}
},["void"]), new objj_method(sel_getUid("_restoreFromAutosaveIfNeeded"), function $CPSplitView___restoreFromAutosaveIfNeeded(self, _cmd)
{ with(self)
{
    if (_shouldRestoreFromAutosaveUnlessFrameSize && !(objj_msgSend(self, "frameSize").width == _shouldRestoreFromAutosaveUnlessFrameSize.width && objj_msgSend(self, "frameSize").height == _shouldRestoreFromAutosaveUnlessFrameSize.height))
    {
        objj_msgSend(self, "_restoreFromAutosave");
    }

    _shouldRestoreFromAutosaveUnlessFrameSize = nil;
}
},["void"]), new objj_method(sel_getUid("_restoreFromAutosave"), function $CPSplitView___restoreFromAutosave(self, _cmd)
{ with(self)
{
    if (!_autosaveName)
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

        _shouldAutosave = NO;

        for (var i = 0, count = objj_msgSend(frames, "count") - 1; i < count; i++)
        {
            var frame = CPRectFromString(frames[i]);
            position += frame.size[_sizeComponent];

            objj_msgSend(self, "setPosition:ofDividerAtIndex:", position, i);

            position += dividerThickness;
        }

        _shouldAutosave = YES;
    }

    if (preCollapseArray)
    {
        _preCollapsePositions = objj_msgSend(CPMutableDictionary, "new");

        for (var i = 0, count = objj_msgSend(preCollapseArray, "count"); i < count; i++)
            objj_msgSend(_preCollapsePositions, "setObject:forKey:", preCollapseArray[i], i + "");
    }
}
},["void"]), new objj_method(sel_getUid("_framesKeyForAutosaveName:"), function $CPSplitView___framesKeyForAutosaveName_(self, _cmd, theAutosaveName)
{ with(self)
{
    if (!theAutosaveName)
        return nil;

    return "CPSplitView Subview Frames " + theAutosaveName;
}
},["CPString","CPString"]), new objj_method(sel_getUid("_precollapseKeyForAutosaveName:"), function $CPSplitView___precollapseKeyForAutosaveName_(self, _cmd, theAutosaveName)
{ with(self)
{
    if (!theAutosaveName)
        return nil;

    return "CPSplitView Subview Precollapse Positions " + theAutosaveName;
}
},["CPString","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPSplitView__defaultThemeClass(self, _cmd)
{ with(self)
{
    return "splitview";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPSplitView__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [1.0, 10.0, objj_msgSend(CPColor, "grayColor")], ["divider-thickness", "pane-divider-thickness", "pane-divider-color"]);
}
},["id"]), new objj_method(sel_getUid("initialize"), function $CPSplitView__initialize(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPSplitView, "class"))
        return;

    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);

    CPSplitViewHorizontalImage = CPImageInBundle("CPSplitView/CPSplitViewHorizontal.png", CGSizeMake(5.0, 10.0), bundle);
    CPSplitViewVerticalImage = CPImageInBundle("CPSplitView/CPSplitViewVertical.png", CGSizeMake(10.0, 5.0), bundle);
}
},["void"])]);
}

var CPSplitViewDelegateKey = "CPSplitViewDelegateKey",
    CPSplitViewIsVerticalKey = "CPSplitViewIsVerticalKey",
    CPSplitViewIsPaneSplitterKey = "CPSplitViewIsPaneSplitterKey",
    CPSplitViewButtonBarsKey = "CPSplitViewButtonBarsKey",
    CPSplitViewAutosaveNameKey = "CPSplitViewAutosaveNameKey";

{
var the_class = objj_getClass("CPSplitView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPSplitView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{

    _autosaveName = objj_msgSend(aCoder, "decodeObjectForKey:", CPSplitViewAutosaveNameKey);
    if (_autosaveName)
    {


        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("_restoreFromAutosaveIfNeeded"), self, nil, 0, [CPDefaultRunLoopMode]);
    }

    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        _suppressResizeNotificationsMask = 0;
        _preCollapsePositions = objj_msgSend(CPMutableDictionary, "new");

        _currentDivider = CPNotFound;
        _shouldAutosave = YES;

        _DOMDividerElements = [];

        _buttonBars = objj_msgSend(aCoder, "decodeObjectForKey:", CPSplitViewButtonBarsKey) || [];

        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPSplitViewDelegateKey));

        _isPaneSplitter = objj_msgSend(aCoder, "decodeBoolForKey:", CPSplitViewIsPaneSplitterKey);
        objj_msgSend(self, "_setVertical:", objj_msgSend(aCoder, "decodeBoolForKey:", CPSplitViewIsVerticalKey));

        if (_autosaveName)
        {
            objj_msgSend(self, "_restoreFromAutosave");


            _shouldRestoreFromAutosaveUnlessFrameSize = objj_msgSend(self, "frameSize");
        }
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSplitView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSplitView").super_class }, "encodeWithCoder:", aCoder);




    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _delegate, CPSplitViewDelegateKey);

    objj_msgSend(aCoder, "encodeBool:forKey:", _isVertical, CPSplitViewIsVerticalKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isPaneSplitter, CPSplitViewIsPaneSplitterKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _autosaveName, CPSplitViewAutosaveNameKey);
}
},["void","CPCoder"])]);
}

