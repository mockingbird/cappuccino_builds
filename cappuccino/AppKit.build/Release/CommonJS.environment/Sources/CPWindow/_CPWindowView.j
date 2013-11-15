@STATIC;1.0;i;13;CPImageView.ji;8;CPView.ji;20;CPWindow_Constants.jt;34066;objj_executeFile("CPImageView.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow_Constants.j", YES);var _CPWindowViewCornerResizeRectWidth = 10,
    _CPWindowViewMinContentHeight = 2,
    _CPWindowViewResizeRegionNone = -1,
    _CPWindowViewResizeRegionTopLeft = 0,
    _CPWindowViewResizeRegionTop = 1,
    _CPWindowViewResizeRegionTopRight = 2,
    _CPWindowViewResizeRegionRight = 3,
    _CPWindowViewResizeRegionBottomRight = 4,
    _CPWindowViewResizeRegionBottom = 5,
    _CPWindowViewResizeRegionBottomLeft = 6,
    _CPWindowViewResizeRegionLeft = 7;
_CPWindowViewResizeSlop = 3;
{var the_class = objj_allocateClassPair(CPView, "_CPWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_styleMask"), new objj_ivar("_resizeIndicator"), new objj_ivar("_resizeIndicatorOffset"), new objj_ivar("_toolbarView"), new objj_ivar("_toolbarOffset"), new objj_ivar("_cachedFrame"), new objj_ivar("_resizeRegion"), new objj_ivar("_mouseDraggedPoint"), new objj_ivar("_cachedScreenFrame"), new objj_ivar("_sheetShadowView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect),
        theToolbar = objj_msgSend(objj_msgSend(self, "window"), "toolbar");
    if (objj_msgSend(theToolbar, "isVisible"))
    {
        var toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(theToolbar, "_toolbarView"), "frame"));
        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }
    return contentRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    var frameRect = objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect),
        theToolbar = objj_msgSend(objj_msgSend(self, "window"), "toolbar");
    if (objj_msgSend(theToolbar, "isVisible"))
    {
        var toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(theToolbar, "_toolbarView"), "frame"));
        frameRect.origin.y -= toolbarHeight;
        frameRect.size.height += toolbarHeight;
    }
    return frameRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._styleMask = aStyleMask;
        self._resizeIndicatorOffset = CGSizeMakeZero();
        self._toolbarOffset = CGSizeMakeZero();
    }
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("setDocumentEdited:"), function $_CPWindowView__setDocumentEdited_(self, _cmd, isEdited)
{
}
,["void","BOOL"]), new objj_method(sel_getUid("setTitle:"), function $_CPWindowView__setTitle_(self, _cmd, aTitle)
{
}
,["void","CPString"]), new objj_method(sel_getUid("hitTest:"), function $_CPWindowView__hitTest_(self, _cmd, locationInWindow)
{
    var region = objj_msgSend(self, "resizeRegionForPoint:", objj_msgSend(self._window, "convertBaseToGlobal:", locationInWindow));
    if (region !== _CPWindowViewResizeRegionNone)
        return self;
    else
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "hitTest:", locationInWindow);
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("acceptsFirstMouse:"), function $_CPWindowView__acceptsFirstMouse_(self, _cmd, anEvent)
{
    return YES;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $_CPWindowView__mouseDown_(self, _cmd, anEvent)
{
    var theWindow = objj_msgSend(self, "window"),
        couldResize = self._styleMask & CPResizableWindowMask && !objj_msgSend(theWindow, "isFullPlatformWindow");
    couldResize = couldResize && (CPWindowResizeStyle === CPWindowResizeStyleModern || CPWindowResizeStyle === CPWindowResizeStyleLegacy && self._resizeIndicator);
    if (couldResize)
    {
        var theWindow = objj_msgSend(self, "window"),
            windowFrame = objj_msgSend(theWindow, "frame"),
            shouldResize = NO;
        if (CPWindowResizeStyle === CPWindowResizeStyleModern)
        {
            var globalPoint = objj_msgSend(theWindow, "convertBaseToGlobal:", objj_msgSend(anEvent, "locationInWindow"));
            self._resizeRegion = objj_msgSend(self, "resizeRegionForPoint:", globalPoint);
            shouldResize = self._resizeRegion !== _CPWindowViewResizeRegionNone;
        }
        else
        {
            var resizeFrame = objj_msgSend(self._resizeIndicator, "frame");
            resizeFrame.size.width = CGRectGetWidth(windowFrame) - CGRectGetMinX(resizeFrame);
            resizeFrame.size.height = CGRectGetHeight(windowFrame) - CGRectGetMinY(resizeFrame);
            var localPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
            shouldResize = CGRectContainsPoint(resizeFrame, localPoint);
            self._resizeRegion = shouldResize ? _CPWindowViewResizeRegionBottomRight : _CPWindowViewResizeRegionNone;
        }
        if (shouldResize)
            return objj_msgSend(self, "trackResizeWithEvent:", anEvent);
    }
    if (objj_msgSend(self, "couldBeMoveEvent:", anEvent))
        objj_msgSend(self, "trackMoveWithEvent:", anEvent);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "mouseDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("couldBeMoveEvent:"), function $_CPWindowView__couldBeMoveEvent_(self, _cmd, anEvent)
{
    var theWindow = objj_msgSend(self, "window");
    return objj_msgSend(theWindow, "isMovable") && objj_msgSend(theWindow, "isMovableByWindowBackground");
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("resizeRegionForPoint:"), function $_CPWindowView__resizeRegionForPoint_(self, _cmd, aPoint)
{
    var wind = objj_msgSend(self, "window"),
        frame = objj_msgSend(wind, "frame"),
        rect,
        minSize = objj_msgSend(wind, "minSize"),
        maxSize = objj_msgSend(wind, "maxSize"),
        isFixedWidth = minSize.width === maxSize.width,
        isFixedHeight = minSize.height === maxSize.height,
        isSheet = wind._isSheet;
    if (isFixedWidth)
    {
        rect = CGRectMake(frame.origin.x - _CPWindowViewResizeSlop, frame.origin.y - _CPWindowViewResizeSlop, frame.size.width + _CPWindowViewResizeSlop * 2, _CPWindowViewResizeSlop * 2);
        if (CGRectContainsPoint(rect, aPoint))
            return isSheet ? _CPWindowViewResizeRegionNone : _CPWindowViewResizeRegionTop;
        rect.origin.y = CGRectGetMaxY(frame) - _CPWindowViewResizeSlop;
        if (CGRectContainsPoint(rect, aPoint))
            return _CPWindowViewResizeRegionBottom;
    }
    else if (isFixedHeight)
    {
        rect = CGRectMake(frame.origin.x - _CPWindowViewResizeSlop, frame.origin.y - _CPWindowViewResizeSlop, _CPWindowViewResizeSlop * 2, frame.size.height + _CPWindowViewResizeSlop * 2);
        if (CGRectContainsPoint(rect, aPoint))
            return _CPWindowViewResizeRegionLeft;
        rect.origin.x = CGRectGetMaxX(frame) - _CPWindowViewResizeSlop;
        if (CGRectContainsPoint(rect, aPoint))
            return _CPWindowViewResizeRegionRight;
    }
    else
    {
        rect = CGRectMake(frame.origin.x - _CPWindowViewResizeSlop, frame.origin.y - _CPWindowViewResizeSlop, _CPWindowViewCornerResizeRectWidth + _CPWindowViewResizeSlop, _CPWindowViewCornerResizeRectWidth + _CPWindowViewResizeSlop);
        if (CGRectContainsPoint(rect, aPoint))
            return isSheet ? _CPWindowViewResizeRegionNone : _CPWindowViewResizeRegionTopLeft;
        rect.origin.x = CGRectGetMaxX(frame) - _CPWindowViewCornerResizeRectWidth;
        if (CGRectContainsPoint(rect, aPoint))
            return isSheet ? _CPWindowViewResizeRegionNone : _CPWindowViewResizeRegionTopRight;
        rect.origin.y = CGRectGetMaxY(frame) - _CPWindowViewCornerResizeRectWidth;
        if (CGRectContainsPoint(rect, aPoint))
            return _CPWindowViewResizeRegionBottomRight;
        rect.origin.x = frame.origin.x - _CPWindowViewResizeSlop;
        if (CGRectContainsPoint(rect, aPoint))
            return _CPWindowViewResizeRegionBottomLeft;
        rect = CGRectMake(rect.origin.x, frame.origin.y + _CPWindowViewCornerResizeRectWidth, _CPWindowViewResizeSlop * 2, CGRectGetHeight(frame) - _CPWindowViewCornerResizeRectWidth * 2);
        if (CGRectContainsPoint(rect, aPoint))
            return _CPWindowViewResizeRegionLeft;
        rect.origin.x = CGRectGetMaxX(frame) - _CPWindowViewResizeSlop;
        if (CGRectContainsPoint(rect, aPoint))
            return _CPWindowViewResizeRegionRight;
        rect = CGRectMake(frame.origin.x + _CPWindowViewCornerResizeRectWidth, frame.origin.y - _CPWindowViewResizeSlop, CGRectGetWidth(frame) - _CPWindowViewCornerResizeRectWidth * 2, _CPWindowViewResizeSlop * 2);
        if (CGRectContainsPoint(rect, aPoint))
            return isSheet ? _CPWindowViewResizeRegionNone : _CPWindowViewResizeRegionTop;
        rect.origin.y = CGRectGetMaxY(frame) - _CPWindowViewResizeSlop;
        if (CGRectContainsPoint(rect, aPoint))
            return _CPWindowViewResizeRegionBottom;
    }
    return _CPWindowViewResizeRegionNone;
}
,["int","CGPoint"]), new objj_method(sel_getUid("setCursorForLocation:resizing:"), function $_CPWindowView__setCursorForLocation_resizing_(self, _cmd, aPoint, isResizing)
{
    var theWindow = objj_msgSend(self, "window");
    if (objj_msgSend(theWindow, "isFullPlatformWindow") || !(self._styleMask & CPResizableWindowMask) || CPWindowResizeStyle !== CPWindowResizeStyleModern)
        return;
    var globalPoint = objj_msgSend(theWindow, "convertBaseToGlobal:", aPoint),
        resizeRegion = isResizing ? self._resizeRegion : objj_msgSend(self, "resizeRegionForPoint:", globalPoint),
        minSize = nil,
        maxSize = nil,
        frameSize;
    if (resizeRegion !== _CPWindowViewResizeRegionNone)
    {
        minSize = objj_msgSend(theWindow, "minSize");
        maxSize = objj_msgSend(theWindow, "maxSize");
        frameSize = objj_msgSend(theWindow, "frame").size;
    }
    switch(resizeRegion) {
    case _CPWindowViewResizeRegionTopLeft:
        if (minSize && CGSizeEqualToSize(frameSize, minSize))
            objj_msgSend(objj_msgSend(CPCursor, "resizeNorthwestCursor"), "set");
        else if (maxSize && CGSizeEqualToSize(frameSize, maxSize))
            objj_msgSend(objj_msgSend(CPCursor, "resizeSoutheastCursor"), "set");
        else
            objj_msgSend(objj_msgSend(CPCursor, "resizeNorthwestSoutheastCursor"), "set");
        break;
    case _CPWindowViewResizeRegionTop:
        if (minSize && frameSize.height === minSize.height)
            objj_msgSend(objj_msgSend(CPCursor, "resizeUpCursor"), "set");
        else if (maxSize && frameSize.height === maxSize.height)
            objj_msgSend(objj_msgSend(CPCursor, "resizeDownCursor"), "set");
        else if (objj_msgSend(CPMenu, "menuBarVisible") && CGRectGetMinY(objj_msgSend(theWindow, "frame")) <= objj_msgSend(CPMenu, "menuBarHeight"))
            objj_msgSend(objj_msgSend(CPCursor, "resizeDownCursor"), "set");
        else
            objj_msgSend(objj_msgSend(CPCursor, "resizeNorthSouthCursor"), "set");
        break;
    case _CPWindowViewResizeRegionTopRight:
        if (minSize && CGSizeEqualToSize(frameSize, minSize))
            objj_msgSend(objj_msgSend(CPCursor, "resizeNortheastCursor"), "set");
        else if (maxSize && CGSizeEqualToSize(frameSize, maxSize))
            objj_msgSend(objj_msgSend(CPCursor, "resizeSouthwestCursor"), "set");
        else
            objj_msgSend(objj_msgSend(CPCursor, "resizeNortheastSouthwestCursor"), "set");
        break;
    case _CPWindowViewResizeRegionRight:
        if (minSize && frameSize.width === minSize.width)
            objj_msgSend(objj_msgSend(CPCursor, "resizeRightCursor"), "set");
        else if (maxSize && frameSize.width === maxSize.width)
            objj_msgSend(objj_msgSend(CPCursor, "resizeLeftCursor"), "set");
        else
            objj_msgSend(objj_msgSend(CPCursor, "resizeEastWestCursor"), "set");
        break;
    case _CPWindowViewResizeRegionBottomRight:
        if (minSize && CGSizeEqualToSize(frameSize, minSize))
            objj_msgSend(objj_msgSend(CPCursor, "resizeSoutheastCursor"), "set");
        else if (maxSize && CGSizeEqualToSize(frameSize, maxSize))
            objj_msgSend(objj_msgSend(CPCursor, "resizeNorthwestCursor"), "set");
        else
            objj_msgSend(objj_msgSend(CPCursor, "resizeNorthwestSoutheastCursor"), "set");
        break;
    case _CPWindowViewResizeRegionBottom:
        if (minSize && frameSize.height === minSize.height)
            objj_msgSend(objj_msgSend(CPCursor, "resizeDownCursor"), "set");
        else if (maxSize && frameSize.height === maxSize.height)
            objj_msgSend(objj_msgSend(CPCursor, "resizeUpCursor"), "set");
        else
            objj_msgSend(objj_msgSend(CPCursor, "resizeNorthSouthCursor"), "set");
        break;
    case _CPWindowViewResizeRegionBottomLeft:
        if (minSize && CGSizeEqualToSize(frameSize, minSize))
            objj_msgSend(objj_msgSend(CPCursor, "resizeSouthwestCursor"), "set");
        else if (maxSize && CGSizeEqualToSize(frameSize, maxSize))
            objj_msgSend(objj_msgSend(CPCursor, "resizeNortheastCursor"), "set");
        else
            objj_msgSend(objj_msgSend(CPCursor, "resizeNortheastSouthwestCursor"), "set");
        break;
    case _CPWindowViewResizeRegionLeft:
        if (minSize && frameSize.width === minSize.width)
            objj_msgSend(objj_msgSend(CPCursor, "resizeLeftCursor"), "set");
        else if (maxSize && frameSize.width === maxSize.width)
            objj_msgSend(objj_msgSend(CPCursor, "resizeRightCursor"), "set");
        else
            objj_msgSend(objj_msgSend(CPCursor, "resizeEastWestCursor"), "set");
        break;
default:
        objj_msgSend(objj_msgSend(CPCursor, "arrowCursor"), "set");
    }
}
,["void","CGPoint","BOOL"]), new objj_method(sel_getUid("trackResizeWithEvent:"), function $_CPWindowView__trackResizeWithEvent_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
    {
        self._cachedScreenFrame = nil;
        return;
    }
    var location = objj_msgSend(anEvent, "locationInWindow"),
        theWindow = objj_msgSend(self, "window"),
        globalLocation = objj_msgSend(theWindow, "convertBaseToGlobal:", location),
        frame = objj_msgSend(theWindow, "frame");
    if (type === CPLeftMouseDown)
    {
        self._mouseDraggedPoint = CGPointMake(globalLocation.x, globalLocation.y);
        self._cachedFrame = CGRectMakeCopy(frame);
        self._cachedScreenFrame = objj_msgSend(objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"), "visibleFrame");
    }
    else if (type === CPLeftMouseDragged)
    {
        var deltaX = globalLocation.x - self._mouseDraggedPoint.x,
            deltaY = globalLocation.y - self._mouseDraggedPoint.y,
            startX = CGRectGetMinX(self._cachedFrame),
            startY = CGRectGetMinY(self._cachedFrame),
            startWidth = CGRectGetWidth(self._cachedFrame),
            startHeight = CGRectGetHeight(self._cachedFrame),
            newX,
            newY,
            newWidth,
            newHeight,
            resizeMinSize = objj_msgSend(self, "_minimumResizeSize"),
            minSize = objj_msgSend(theWindow, "minSize"),
            maxSize = objj_msgSend(theWindow, "maxSize");
        minSize = CGSizeMake(MAX(minSize.width, resizeMinSize.width), MAX(minSize.height, resizeMinSize.height));
        if (theWindow._isSheet)
            deltaX *= 2;
        switch(self._resizeRegion) {
        case _CPWindowViewResizeRegionTopLeft:
        case _CPWindowViewResizeRegionLeft:
        case _CPWindowViewResizeRegionBottomLeft:
            if (deltaX > 0)
                deltaX = MIN(startWidth - minSize.width, deltaX);
            else if (deltaX < 0)
                deltaX = -MIN(maxSize.width - startWidth, ABS(deltaX));
            if (theWindow._isSheet)
                deltaX = FLOOR(deltaX / 2);
            newX = startX + deltaX;
            var pinnedX = MAX(newX, CGRectGetMinX(self._cachedScreenFrame));
            if (pinnedX !== newX)
            {
                deltaX += pinnedX - newX;
                newX = pinnedX;
            }
            if (theWindow._isSheet)
                deltaX *= 2;
            newWidth = startWidth - deltaX;
            break;
        case _CPWindowViewResizeRegionTopRight:
        case _CPWindowViewResizeRegionRight:
        case _CPWindowViewResizeRegionBottomRight:
            if (deltaX > 0)
                deltaX = MIN(maxSize.width - startWidth, deltaX);
            else if (deltaX < 0)
                deltaX = -MIN(startWidth - minSize.width, ABS(deltaX));
            if (theWindow._isSheet)
                deltaX = FLOOR(deltaX / 2);
            var newMaxX = startX + startWidth + deltaX,
                pinnedX = MIN(newMaxX, CGRectGetMaxX(self._cachedScreenFrame));
            if (pinnedX !== newMaxX)
                deltaX += pinnedX - newMaxX;
            if (theWindow._isSheet)
            {
                newWidth = startWidth + deltaX * 2;
                newX = startX - FLOOR((newWidth - startWidth) / 2);
            }
            else
            {
                newWidth = startWidth + deltaX;
                newX = startX;
            }
            break;
default:
            newX = startX;
            newWidth = startWidth;
        }
        switch(self._resizeRegion) {
        case _CPWindowViewResizeRegionTopLeft:
        case _CPWindowViewResizeRegionTop:
        case _CPWindowViewResizeRegionTopRight:
            if (deltaY > 0)
                deltaY = MIN(startHeight - minSize.height, deltaY);
            else if (deltaY < 0)
                deltaY = -MIN(maxSize.height - startHeight, ABS(deltaY));
            newY = startY + deltaY;
            var pinnedY = MAX(newY, CGRectGetMinY(self._cachedScreenFrame));
            if (pinnedY !== newY)
            {
                deltaY += pinnedY - newY;
                newY = pinnedY;
            }
            newHeight = startHeight - deltaY;
            break;
        case _CPWindowViewResizeRegionBottomLeft:
        case _CPWindowViewResizeRegionBottom:
        case _CPWindowViewResizeRegionBottomRight:
            if (deltaY > 0)
                deltaY = MIN(maxSize.height - startHeight, deltaY);
            else if (deltaY < 0)
                deltaY = -MIN(startHeight - minSize.height, ABS(deltaY));
            newY = startY;
            var newMaxY = startY + startHeight + deltaY,
                pinnedY = MIN(newMaxY, CGRectGetMaxY(self._cachedScreenFrame));
            if (pinnedY !== newMaxY)
                deltaY += pinnedY - newMaxY;
            newHeight = startHeight + deltaY;
            break;
default:
            newY = startY;
            newHeight = startHeight;
        }
        frame = CGRectMake(newX, newY, newWidth, newHeight);
        var constrainedFrame = objj_msgSend(theWindow, "_constrainOriginOfFrame:", frame),
            dx = constrainedFrame.origin.x - frame.origin.x,
            dy = constrainedFrame.origin.y - frame.origin.y;
        switch(self._resizeRegion) {
        case _CPWindowViewResizeRegionBottomLeft:
        case _CPWindowViewResizeRegionLeft:
        case _CPWindowViewResizeRegionTopLeft:
        case _CPWindowViewResizeRegionTop:
        case _CPWindowViewResizeRegionTopRight:
            frame.origin = constrainedFrame.origin;
            frame.size.width -= dx;
            frame.size.height -= dy;
        }
        switch(self._resizeRegion) {
        case _CPWindowViewResizeRegionTopRight:
        case _CPWindowViewResizeRegionRight:
        case _CPWindowViewResizeRegionBottomRight:
        case _CPWindowViewResizeRegionBottom:
            frame.size.width += dx;
            frame.size.height += dy;
        }
        objj_msgSend(theWindow, "_setFrame:display:animate:constrainWidth:constrainHeight:", frame, YES, NO, NO, NO);
        objj_msgSend(self, "setCursorForLocation:resizing:", location, YES);
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackResizeWithEvent:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("trackMoveWithEvent:"), function $_CPWindowView__trackMoveWithEvent_(self, _cmd, anEvent)
{
    var theWindow = objj_msgSend(self, "window");
    if (!objj_msgSend(theWindow, "isMovable"))
        return;
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
    {
        return;
    }
    else if (type === CPLeftMouseDown)
    {
        self._mouseDraggedPoint = objj_msgSend(theWindow, "convertBaseToGlobal:", objj_msgSend(anEvent, "locationInWindow"));
        self._cachedFrame = CGRectMakeCopy(objj_msgSend(theWindow, "frame"));
    }
    else if (type === CPLeftMouseDragged)
    {
        var theWindow = objj_msgSend(self, "window"),
            location = objj_msgSend(theWindow, "convertBaseToGlobal:", objj_msgSend(anEvent, "locationInWindow")),
            deltaX = location.x - self._mouseDraggedPoint.x,
            deltaY = location.y - self._mouseDraggedPoint.y,
            origin = CGPointMake(self._cachedFrame.origin.x + deltaX, self._cachedFrame.origin.y + deltaY);
        objj_msgSend(theWindow, "setFrameOrigin:", origin);
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMoveWithEvent:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("setFrameSize:"), function $_CPWindowView__setFrameSize_(self, _cmd, newSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "setFrameSize:", newSize);
    var theWindow = objj_msgSend(self, "window"),
        sheet = objj_msgSend(theWindow, "attachedSheet");
    if (sheet)
    {
        objj_msgSend(theWindow, "_setAttachedSheetFrameOrigin");
        objj_msgSend(sheet._windowView, "_adjustShadowViewSize");
    }
    else if (theWindow && theWindow._isSheet)
        objj_msgSend(self, "_adjustShadowViewSize");
}
,["void","CGSize"]), new objj_method(sel_getUid("setShowsResizeIndicator:"), function $_CPWindowView__setShowsResizeIndicator_(self, _cmd, shouldShowResizeIndicator)
{
    if (shouldShowResizeIndicator && CPWindowResizeStyle === CPWindowResizeStyleLegacy)
    {
        self._resizeIndicator = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._resizeIndicator, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
        objj_msgSend(self, "addSubview:", self._resizeIndicator);
    }
    else
    {
        objj_msgSend(self._resizeIndicator, "removeFromSuperview");
        self._resizeIndicator = nil;
    }
    objj_msgSend(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("showsResizeIndicator"), function $_CPWindowView__showsResizeIndicator(self, _cmd)
{
    return self._resizeIndicator !== nil;
}
,["BOOL"]), new objj_method(sel_getUid("setResizeIndicatorOffset:"), function $_CPWindowView__setResizeIndicatorOffset_(self, _cmd, anOffset)
{
    if (CGSizeEqualToSize(self._resizeIndicatorOffset, anOffset))
        return;
    self._resizeIndicatorOffset = anOffset;
    if (!self._resizeIndicator)
        return;
    var size = objj_msgSend(self._resizeIndicator, "frame").size,
        boundsSize = objj_msgSend(self, "frame").size;
    objj_msgSend(self._resizeIndicator, "setFrameOrigin:", CGPointMake(boundsSize.width - size.width - anOffset.width, boundsSize.height - size.height - anOffset.height));
}
,["void","CGSize"]), new objj_method(sel_getUid("resizeIndicatorOffset"), function $_CPWindowView__resizeIndicatorOffset(self, _cmd)
{
    return self._resizeIndicatorOffset;
}
,["CGSize"]), new objj_method(sel_getUid("windowDidChangeDocumentEdited"), function $_CPWindowView__windowDidChangeDocumentEdited(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("windowDidChangeDocumentSaving"), function $_CPWindowView__windowDidChangeDocumentSaving(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("showsToolbar"), function $_CPWindowView__showsToolbar(self, _cmd)
{
    var styleMaskWindow = objj_msgSend(objj_msgSend(self, "window"), "styleMask");
    return styleMaskWindow & CPBorderlessWindowMask || styleMaskWindow & CPTitledWindowMask || styleMaskWindow & CPHUDBackgroundWindowMask || styleMaskWindow & CPBorderlessBridgeWindowMask;
}
,["BOOL"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPWindowView__toolbarOffset(self, _cmd)
{
    return self._toolbarOffset;
}
,["CGSize"]), new objj_method(sel_getUid("toolbarLabelColor"), function $_CPWindowView__toolbarLabelColor(self, _cmd)
{
    return objj_msgSend(CPColor, "blackColor");
}
,["CPColor"]), new objj_method(sel_getUid("toolbarMaxY"), function $_CPWindowView__toolbarMaxY(self, _cmd)
{
    if (!self._toolbarView || objj_msgSend(self._toolbarView, "isHidden"))
        return objj_msgSend(self, "toolbarOffset").height;
    return CGRectGetMaxY(objj_msgSend(self._toolbarView, "frame"));
}
,["float"]), new objj_method(sel_getUid("toolbarView"), function $_CPWindowView__toolbarView(self, _cmd)
{
    return self._toolbarView;
}
,["_CPToolbarView"]), new objj_method(sel_getUid("tile"), function $_CPWindowView__tile(self, _cmd)
{
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);
    if (objj_msgSend(objj_msgSend(theWindow, "toolbar"), "isVisible"))
    {
        var toolbarView = objj_msgSend(self, "toolbarView"),
            toolbarOffset = objj_msgSend(self, "toolbarOffset");
        objj_msgSend(toolbarView, "setFrame:", CGRectMake(toolbarOffset.width, toolbarOffset.height, width, CGRectGetHeight(objj_msgSend(toolbarView, "frame"))));
    }
    if (objj_msgSend(self, "showsResizeIndicator"))
    {
        var size = objj_msgSend(self._resizeIndicator, "frame").size,
            boundsSize = objj_msgSend(self, "bounds").size;
        objj_msgSend(self._resizeIndicator, "setFrameOrigin:", CGPointMake(boundsSize.width - size.width - self._resizeIndicatorOffset.width, boundsSize.height - size.height - self._resizeIndicatorOffset.height));
    }
}
,["void"]), new objj_method(sel_getUid("noteToolbarChanged"), function $_CPWindowView__noteToolbarChanged(self, _cmd)
{
    var theWindow = objj_msgSend(self, "window"),
        toolbar = objj_msgSend(theWindow, "toolbar"),
        toolbarView = objj_msgSend(toolbar, "_toolbarView");
    if (self._toolbarView !== toolbarView)
    {
        objj_msgSend(self._toolbarView, "removeFromSuperview");
        if (toolbarView)
        {
            objj_msgSend(toolbarView, "removeFromSuperview");
            objj_msgSend(toolbarView, "FIXME_setIsHUD:", self._styleMask & CPHUDBackgroundWindowMask);
            objj_msgSend(self, "addSubview:", toolbarView);
        }
        self._toolbarView = toolbarView;
    }
    objj_msgSend(toolbarView, "setHidden:", !objj_msgSend(self, "showsToolbar") || !objj_msgSend(toolbar, "isVisible"));
    if (theWindow)
    {
        var contentRect = objj_msgSend(self, "convertRect:toView:", objj_msgSend(objj_msgSend(theWindow, "contentView"), "frame"), nil);
        contentRect.origin = objj_msgSend(theWindow, "convertBaseToGlobal:", contentRect.origin);
        objj_msgSend(self, "setAutoresizesSubviews:", NO);
        objj_msgSend(theWindow, "setFrame:", objj_msgSend(theWindow, "frameRectForContentRect:", contentRect));
        objj_msgSend(self, "setAutoresizesSubviews:", YES);
    }
    objj_msgSend(self, "tile");
}
,["void"]), new objj_method(sel_getUid("noteKeyWindowStateChanged"), function $_CPWindowView__noteKeyWindowStateChanged(self, _cmd)
{
    if (objj_msgSend(objj_msgSend(self, "window"), "isKeyWindow"))
        objj_msgSend(self, "setThemeState:", CPThemeStateKeyWindow);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateKeyWindow);
}
,["void"]), new objj_method(sel_getUid("noteMainWindowStateChanged"), function $_CPWindowView__noteMainWindowStateChanged(self, _cmd)
{
    if (objj_msgSend(objj_msgSend(self, "window"), "isMainWindow"))
        objj_msgSend(self, "setThemeState:", CPThemeStateMainWindow);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateMainWindow);
}
,["void"]), new objj_method(sel_getUid("didAddSubview:"), function $_CPWindowView__didAddSubview_(self, _cmd, aView)
{
    if (!self._resizeIndicator || aView === self._resizeIndicator)
        return;
    objj_msgSend(self, "addSubview:", self._resizeIndicator);
}
,["void","CPView"]), new objj_method(sel_getUid("_enableSheet:inWindow:"), function $_CPWindowView___enableSheet_inWindow_(self, _cmd, enable, parentWindow)
{
    if (enable)
    {
        var myWidth = objj_msgSend(self, "bounds").size.width,
            shadowWidth = objj_msgSend(self, "_shadowViewWidthForParentWindow:", parentWindow),
            shadowHeight = objj_msgSend(self, "currentValueForThemeAttribute:", "shadow-height");
        self._sheetShadowView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(FLOOR((myWidth - shadowWidth) / 2), 0, shadowWidth, shadowHeight));
        objj_msgSend(self._sheetShadowView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self, "addSubview:", self._sheetShadowView);
    }
    else
    {
        objj_msgSend(self._sheetShadowView, "removeFromSuperview");
        self._sheetShadowView = nil;
    }
    objj_msgSend(self, "setNeedsLayout");
}
,["void","BOOL","CPWindow"]), new objj_method(sel_getUid("_shadowViewWidthForParentWindow:"), function $_CPWindowView___shadowViewWidthForParentWindow_(self, _cmd, parentWindow)
{
    var myWidth = objj_msgSend(self, "bounds").size.width,
        parentWidth = objj_msgSend(objj_msgSend(parentWindow, "contentView"), "bounds").size.width;
    return MIN(myWidth, parentWidth);
}
,["CGRect","CPWindow"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPWindowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "layoutSubviews");
    objj_msgSend(self._sheetShadowView, "setBackgroundColor:", objj_msgSend(self, "valueForThemeAttribute:", "attached-sheet-shadow-color"));
    if (self._resizeIndicator)
    {
        var size = objj_msgSend(self, "valueForThemeAttribute:", "size-indicator"),
            boundsSize = objj_msgSend(self, "frame").size;
        objj_msgSend(self._resizeIndicator, "setFrame:", CGRectMake(boundsSize.width - size.width - self._resizeIndicatorOffset.width, boundsSize.height - size.height - self._resizeIndicatorOffset.height, size.width, size.height));
        objj_msgSend(self._resizeIndicator, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "resize-indicator"));
    }
}
,["void"]), new objj_method(sel_getUid("_adjustShadowViewSize"), function $_CPWindowView___adjustShadowViewSize(self, _cmd)
{
    if (!self._sheetShadowView)
        return;
    var myWidth = objj_msgSend(self, "frame").size.width,
        shadowFrame = objj_msgSend(self._sheetShadowView, "frame"),
        shadowWidth = objj_msgSend(self, "_shadowViewWidthForParentWindow:", self._window._parentView);
    shadowFrame.origin.x = FLOOR((myWidth - shadowWidth) / 2);
    shadowFrame.size.width = shadowWidth;
    objj_msgSend(self._sheetShadowView, "setFrame:", shadowFrame);
}
,["void"]), new objj_method(sel_getUid("_minimumResizeSize"), function $_CPWindowView___minimumResizeSize(self, _cmd)
{
    return CGSizeMake(4, _CPWindowViewMinContentHeight);
}
,["CGSize"]), new objj_method(sel_getUid("bodyOffset"), function $_CPWindowView__bodyOffset(self, _cmd)
{
    return objj_msgSend(self, "frame").origin.y;
}
,["int"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    return CGRectMakeCopy(aFrameRect);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    return CGRectMakeCopy(aContentRect);
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("defaultThemeClass"), function $_CPWindowView__defaultThemeClass(self, _cmd)
{
    return "window";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 25, "title-bar-height", CGInsetMakeZero(), "shadow-inset", 5, "shadow-distance", objj_msgSend(CPColor, "clearColor"), "window-shadow-color", CGSizeMakeZero(), "size-indicator", objj_msgSend(CPNull, "null"), "resize-indicator", objj_msgSend(CPColor, "blackColor"), "attached-sheet-shadow-color", 8, "shadow-height", objj_msgSend(CPNull, "null"), "close-image-origin", objj_msgSend(CPNull, "null"), "close-image-size", objj_msgSend(CPNull, "null"), "close-image", objj_msgSend(CPNull, "null"), "close-active-image", objj_msgSend(CPNull, "null"), "bezel-color", objj_msgSend(CPColor, "blackColor"), "title-text-color", objj_msgSend(CPFont, "systemFontOfSize:", CPFontCurrentSystemSize), "title-font", objj_msgSend(CPNull, "null"), "title-text-shadow-color", CGSizeMakeZero(), "title-text-shadow-offset", CPCenterTextAlignment, "title-alignment", CPLineBreakByTruncatingTail, "title-line-break-mode", CPTopVerticalTextAlignment, "title-vertical-alignment");
}
,["id"])]);
}