@STATIC;1.0;i;13;CPImageView.ji;8;CPView.ji;20;CPWindow_Constants.jt;41879;objj_executeFile("CPImageView.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow_Constants.j", YES);var _CPWindowViewCornerResizeRectWidth = 10,
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
    var contentRect = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "contentRectForFrameRect:", aFrameRect)),
        theToolbar = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "toolbar"));
    if ((theToolbar == null ? null : theToolbar.isa.objj_msgSend0(theToolbar, "isVisible")))
    {
        var toolbarHeight = CGRectGetHeight(((___r1 = (theToolbar == null ? null : theToolbar.isa.objj_msgSend0(theToolbar, "_toolbarView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }
    return contentRect;
    var ___r1;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    var frameRect = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "frameRectForContentRect:", aContentRect)),
        theToolbar = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "toolbar"));
    if ((theToolbar == null ? null : theToolbar.isa.objj_msgSend0(theToolbar, "isVisible")))
    {
        var toolbarHeight = CGRectGetHeight(((___r1 = (theToolbar == null ? null : theToolbar.isa.objj_msgSend0(theToolbar, "_toolbarView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
        frameRect.origin.y -= toolbarHeight;
        frameRect.size.height += toolbarHeight;
    }
    return frameRect;
    var ___r1;
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
    var region = self.isa.objj_msgSend1(self, "resizeRegionForPoint:", ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertBaseToGlobal:", locationInWindow)));
    if (region !== _CPWindowViewResizeRegionNone)
        return self;
    else
        return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "hitTest:", locationInWindow);
    var ___r1;
}
,["CPView","CGPoint"]), new objj_method(sel_getUid("acceptsFirstMouse:"), function $_CPWindowView__acceptsFirstMouse_(self, _cmd, anEvent)
{
    return YES;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $_CPWindowView__mouseDown_(self, _cmd, anEvent)
{
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        couldResize = self._styleMask & CPResizableWindowMask && !(theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "isFullPlatformWindow"));
    couldResize = couldResize && (CPWindowResizeStyle === CPWindowResizeStyleModern || CPWindowResizeStyle === CPWindowResizeStyleLegacy && self._resizeIndicator);
    if (couldResize)
    {
        var theWindow = self.isa.objj_msgSend0(self, "window"),
            windowFrame = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "frame")),
            shouldResize = NO;
        if (CPWindowResizeStyle === CPWindowResizeStyleModern)
        {
            var globalPoint = (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "convertBaseToGlobal:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow"))));
            self._resizeRegion = self.isa.objj_msgSend1(self, "resizeRegionForPoint:", globalPoint);
            shouldResize = self._resizeRegion !== _CPWindowViewResizeRegionNone;
        }
        else
        {
            var resizeFrame = ((___r1 = self._resizeIndicator), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
            resizeFrame.size.width = CGRectGetWidth(windowFrame) - CGRectGetMinX(resizeFrame);
            resizeFrame.size.height = CGRectGetHeight(windowFrame) - CGRectGetMinY(resizeFrame);
            var localPoint = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil);
            shouldResize = CGRectContainsPoint(resizeFrame, localPoint);
            self._resizeRegion = shouldResize ? _CPWindowViewResizeRegionBottomRight : _CPWindowViewResizeRegionNone;
        }
        if (shouldResize)
            return self.isa.objj_msgSend1(self, "trackResizeWithEvent:", anEvent);
    }
    if (self.isa.objj_msgSend1(self, "couldBeMoveEvent:", anEvent))
        self.isa.objj_msgSend1(self, "trackMoveWithEvent:", anEvent);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "mouseDown:", anEvent);
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("couldBeMoveEvent:"), function $_CPWindowView__couldBeMoveEvent_(self, _cmd, anEvent)
{
    var theWindow = self.isa.objj_msgSend0(self, "window");
    return (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "isMovable")) && (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "isMovableByWindowBackground"));
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("resizeRegionForPoint:"), function $_CPWindowView__resizeRegionForPoint_(self, _cmd, aPoint)
{
    var wind = self.isa.objj_msgSend0(self, "window"),
        frame = (wind == null ? null : wind.isa.objj_msgSend0(wind, "frame")),
        rect,
        minSize = (wind == null ? null : wind.isa.objj_msgSend0(wind, "minSize")),
        maxSize = (wind == null ? null : wind.isa.objj_msgSend0(wind, "maxSize")),
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
    var theWindow = self.isa.objj_msgSend0(self, "window");
    if ((theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "isFullPlatformWindow")) || !(self._styleMask & CPResizableWindowMask) || CPWindowResizeStyle !== CPWindowResizeStyleModern)
        return;
    var globalPoint = (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "convertBaseToGlobal:", aPoint)),
        resizeRegion = isResizing ? self._resizeRegion : self.isa.objj_msgSend1(self, "resizeRegionForPoint:", globalPoint),
        minSize = nil,
        maxSize = nil,
        frameSize;
    if (resizeRegion !== _CPWindowViewResizeRegionNone)
    {
        minSize = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "minSize"));
        maxSize = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "maxSize"));
        frameSize = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "frame")).size;
    }
    switch(resizeRegion) {
    case _CPWindowViewResizeRegionTopLeft:
        if (minSize && CGSizeEqualToSize(frameSize, minSize))
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeNorthwestCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else if (maxSize && CGSizeEqualToSize(frameSize, maxSize))
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeSoutheastCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeNorthwestSoutheastCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        break;
    case _CPWindowViewResizeRegionTop:
        if (minSize && frameSize.height === minSize.height)
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeUpCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else if (maxSize && frameSize.height === maxSize.height)
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeDownCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else if ((CPMenu == null ? null : CPMenu.isa.objj_msgSend0(CPMenu, "menuBarVisible")) && CGRectGetMinY((theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "frame"))) <= (CPMenu == null ? null : CPMenu.isa.objj_msgSend0(CPMenu, "menuBarHeight")))
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeDownCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeNorthSouthCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        break;
    case _CPWindowViewResizeRegionTopRight:
        if (minSize && CGSizeEqualToSize(frameSize, minSize))
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeNortheastCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else if (maxSize && CGSizeEqualToSize(frameSize, maxSize))
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeSouthwestCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeNortheastSouthwestCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        break;
    case _CPWindowViewResizeRegionRight:
        if (minSize && frameSize.width === minSize.width)
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeRightCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else if (maxSize && frameSize.width === maxSize.width)
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeLeftCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeEastWestCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        break;
    case _CPWindowViewResizeRegionBottomRight:
        if (minSize && CGSizeEqualToSize(frameSize, minSize))
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeSoutheastCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else if (maxSize && CGSizeEqualToSize(frameSize, maxSize))
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeNorthwestCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeNorthwestSoutheastCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        break;
    case _CPWindowViewResizeRegionBottom:
        if (minSize && frameSize.height === minSize.height)
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeDownCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else if (maxSize && frameSize.height === maxSize.height)
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeUpCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeNorthSouthCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        break;
    case _CPWindowViewResizeRegionBottomLeft:
        if (minSize && CGSizeEqualToSize(frameSize, minSize))
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeSouthwestCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else if (maxSize && CGSizeEqualToSize(frameSize, maxSize))
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeNortheastCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeNortheastSouthwestCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        break;
    case _CPWindowViewResizeRegionLeft:
        if (minSize && frameSize.width === minSize.width)
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeLeftCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else if (maxSize && frameSize.width === maxSize.width)
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeRightCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else
            ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "resizeEastWestCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        break;
default:
        ((___r1 = (CPCursor == null ? null : CPCursor.isa.objj_msgSend0(CPCursor, "arrowCursor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    }
    var ___r1;
}
,["void","CGPoint","BOOL"]), new objj_method(sel_getUid("trackResizeWithEvent:"), function $_CPWindowView__trackResizeWithEvent_(self, _cmd, anEvent)
{
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type"));
    if (type === CPLeftMouseUp)
    {
        self._cachedScreenFrame = nil;
        return;
    }
    var location = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")),
        theWindow = self.isa.objj_msgSend0(self, "window"),
        globalLocation = (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "convertBaseToGlobal:", location)),
        frame = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "frame"));
    if (type === CPLeftMouseDown)
    {
        self._mouseDraggedPoint = CGPointMake(globalLocation.x, globalLocation.y);
        self._cachedFrame = CGRectMakeCopy(frame);
        self._cachedScreenFrame = ((___r1 = (CPPlatformWindow == null ? null : CPPlatformWindow.isa.objj_msgSend0(CPPlatformWindow, "primaryPlatformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame"));
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
            resizeMinSize = self.isa.objj_msgSend0(self, "_minimumResizeSize"),
            minSize = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "minSize")),
            maxSize = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "maxSize"));
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
        var constrainedFrame = (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "_constrainOriginOfFrame:", frame)),
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
        (theWindow == null ? null : theWindow.isa.objj_msgSend(theWindow, "_setFrame:display:animate:constrainWidth:constrainHeight:", frame, YES, NO, NO, NO));
        self.isa.objj_msgSend2(self, "setCursorForLocation:resizing:", location, YES);
    }
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackResizeWithEvent:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("trackMoveWithEvent:"), function $_CPWindowView__trackMoveWithEvent_(self, _cmd, anEvent)
{
    var theWindow = self.isa.objj_msgSend0(self, "window");
    if (!(theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "isMovable")))
        return;
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type"));
    if (type === CPLeftMouseUp)
    {
        return;
    }
    else if (type === CPLeftMouseDown)
    {
        self._mouseDraggedPoint = (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "convertBaseToGlobal:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow"))));
        self._cachedFrame = CGRectMakeCopy((theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "frame")));
    }
    else if (type === CPLeftMouseDragged)
    {
        var theWindow = self.isa.objj_msgSend0(self, "window"),
            location = (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "convertBaseToGlobal:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")))),
            deltaX = location.x - self._mouseDraggedPoint.x,
            deltaY = location.y - self._mouseDraggedPoint.y,
            origin = CGPointMake(self._cachedFrame.origin.x + deltaX, self._cachedFrame.origin.y + deltaY);
        (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setFrameOrigin:", origin));
    }
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMoveWithEvent:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES));
}
,["void","CPEvent"]), new objj_method(sel_getUid("setFrameSize:"), function $_CPWindowView__setFrameSize_(self, _cmd, newSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "setFrameSize:", newSize);
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        sheet = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "attachedSheet"));
    if (sheet)
    {
        (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "_setAttachedSheetFrameOrigin"));
        ((___r1 = sheet._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_adjustShadowViewSize"));
    }
    else if (theWindow && theWindow._isSheet)
        self.isa.objj_msgSend0(self, "_adjustShadowViewSize");
    var ___r1;
}
,["void","CGSize"]), new objj_method(sel_getUid("setShowsResizeIndicator:"), function $_CPWindowView__setShowsResizeIndicator_(self, _cmd, shouldShowResizeIndicator)
{
    if (shouldShowResizeIndicator && CPWindowResizeStyle === CPWindowResizeStyleLegacy)
    {
        self._resizeIndicator = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self._resizeIndicator), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin));
        self.isa.objj_msgSend1(self, "addSubview:", self._resizeIndicator);
    }
    else
    {
        ((___r1 = self._resizeIndicator), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        self._resizeIndicator = nil;
    }
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
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
    var size = ((___r1 = self._resizeIndicator), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size,
        boundsSize = self.isa.objj_msgSend0(self, "frame").size;
    ((___r1 = self._resizeIndicator), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(boundsSize.width - size.width - anOffset.width, boundsSize.height - size.height - anOffset.height)));
    var ___r1;
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
    var styleMaskWindow = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "styleMask"));
    return styleMaskWindow & CPBorderlessWindowMask || styleMaskWindow & CPTitledWindowMask || styleMaskWindow & CPHUDBackgroundWindowMask || styleMaskWindow & CPBorderlessBridgeWindowMask;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPWindowView__toolbarOffset(self, _cmd)
{
    return self._toolbarOffset;
}
,["CGSize"]), new objj_method(sel_getUid("toolbarLabelColor"), function $_CPWindowView__toolbarLabelColor(self, _cmd)
{
    return CPColor.isa.objj_msgSend0(CPColor, "blackColor");
}
,["CPColor"]), new objj_method(sel_getUid("toolbarMaxY"), function $_CPWindowView__toolbarMaxY(self, _cmd)
{
    if (!self._toolbarView || ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        return self.isa.objj_msgSend0(self, "toolbarOffset").height;
    return CGRectGetMaxY(((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
    var ___r1;
}
,["float"]), new objj_method(sel_getUid("toolbarView"), function $_CPWindowView__toolbarView(self, _cmd)
{
    return self._toolbarView;
}
,["_CPToolbarView"]), new objj_method(sel_getUid("tile"), function $_CPWindowView__tile(self, _cmd)
{
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        bounds = self.isa.objj_msgSend0(self, "bounds"),
        width = CGRectGetWidth(bounds);
    if (((___r1 = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "toolbar"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible")))
    {
        var toolbarView = self.isa.objj_msgSend0(self, "toolbarView"),
            toolbarOffset = self.isa.objj_msgSend0(self, "toolbarOffset");
        (toolbarView == null ? null : toolbarView.isa.objj_msgSend1(toolbarView, "setFrame:", CGRectMake(toolbarOffset.width, toolbarOffset.height, width, CGRectGetHeight((toolbarView == null ? null : toolbarView.isa.objj_msgSend0(toolbarView, "frame"))))));
    }
    if (self.isa.objj_msgSend0(self, "showsResizeIndicator"))
    {
        var size = ((___r1 = self._resizeIndicator), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size,
            boundsSize = self.isa.objj_msgSend0(self, "bounds").size;
        ((___r1 = self._resizeIndicator), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(boundsSize.width - size.width - self._resizeIndicatorOffset.width, boundsSize.height - size.height - self._resizeIndicatorOffset.height)));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("noteToolbarChanged"), function $_CPWindowView__noteToolbarChanged(self, _cmd)
{
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        toolbar = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "toolbar")),
        toolbarView = (toolbar == null ? null : toolbar.isa.objj_msgSend0(toolbar, "_toolbarView"));
    if (self._toolbarView !== toolbarView)
    {
        ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        if (toolbarView)
        {
            (toolbarView == null ? null : toolbarView.isa.objj_msgSend0(toolbarView, "removeFromSuperview"));
            (toolbarView == null ? null : toolbarView.isa.objj_msgSend1(toolbarView, "FIXME_setIsHUD:", self._styleMask & CPHUDBackgroundWindowMask));
            self.isa.objj_msgSend1(self, "addSubview:", toolbarView);
        }
        self._toolbarView = toolbarView;
    }
    (toolbarView == null ? null : toolbarView.isa.objj_msgSend1(toolbarView, "setHidden:", !self.isa.objj_msgSend0(self, "showsToolbar") || !(toolbar == null ? null : toolbar.isa.objj_msgSend0(toolbar, "isVisible"))));
    if (theWindow)
    {
        var contentRect = self.isa.objj_msgSend2(self, "convertRect:toView:", ((___r1 = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")), nil);
        contentRect.origin = (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "convertBaseToGlobal:", contentRect.origin));
        self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", NO);
        (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setFrame:", (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "frameRectForContentRect:", contentRect))));
        self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", YES);
    }
    self.isa.objj_msgSend0(self, "tile");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("noteKeyWindowStateChanged"), function $_CPWindowView__noteKeyWindowStateChanged(self, _cmd)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isKeyWindow")))
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateKeyWindow);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateKeyWindow);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("noteMainWindowStateChanged"), function $_CPWindowView__noteMainWindowStateChanged(self, _cmd)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isMainWindow")))
        self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateMainWindow);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateMainWindow);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("didAddSubview:"), function $_CPWindowView__didAddSubview_(self, _cmd, aView)
{
    if (!self._resizeIndicator || aView === self._resizeIndicator)
        return;
    self.isa.objj_msgSend1(self, "addSubview:", self._resizeIndicator);
}
,["void","CPView"]), new objj_method(sel_getUid("_enableSheet:inWindow:"), function $_CPWindowView___enableSheet_inWindow_(self, _cmd, enable, parentWindow)
{
    if (enable)
    {
        var myWidth = self.isa.objj_msgSend0(self, "bounds").size.width,
            shadowWidth = self.isa.objj_msgSend1(self, "_shadowViewWidthForParentWindow:", parentWindow),
            shadowHeight = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "shadow-height");
        self._sheetShadowView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(FLOOR((myWidth - shadowWidth) / 2), 0, shadowWidth, shadowHeight)));
        ((___r1 = self._sheetShadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
        self.isa.objj_msgSend1(self, "addSubview:", self._sheetShadowView);
    }
    else
    {
        ((___r1 = self._sheetShadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        self._sheetShadowView = nil;
    }
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","BOOL","CPWindow"]), new objj_method(sel_getUid("_shadowViewWidthForParentWindow:"), function $_CPWindowView___shadowViewWidthForParentWindow_(self, _cmd, parentWindow)
{
    var myWidth = self.isa.objj_msgSend0(self, "bounds").size.width,
        parentWidth = ((___r1 = (parentWindow == null ? null : parentWindow.isa.objj_msgSend0(parentWindow, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")).size.width;
    return MIN(myWidth, parentWidth);
    var ___r1;
}
,["CGRect","CPWindow"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPWindowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView").super_class }, "layoutSubviews");
    ((___r1 = self._sheetShadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "attached-sheet-shadow-color")));
    if (self._resizeIndicator)
    {
        var size = self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "size-indicator"),
            boundsSize = self.isa.objj_msgSend0(self, "frame").size;
        ((___r1 = self._resizeIndicator), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(boundsSize.width - size.width - self._resizeIndicatorOffset.width, boundsSize.height - size.height - self._resizeIndicatorOffset.height, size.width, size.height)));
        ((___r1 = self._resizeIndicator), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "resize-indicator")));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_adjustShadowViewSize"), function $_CPWindowView___adjustShadowViewSize(self, _cmd)
{
    if (!self._sheetShadowView)
        return;
    var myWidth = self.isa.objj_msgSend0(self, "frame").size.width,
        shadowFrame = ((___r1 = self._sheetShadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        shadowWidth = self.isa.objj_msgSend1(self, "_shadowViewWidthForParentWindow:", self._window._parentView);
    shadowFrame.origin.x = FLOOR((myWidth - shadowWidth) / 2);
    shadowFrame.size.width = shadowWidth;
    ((___r1 = self._sheetShadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", shadowFrame));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_minimumResizeSize"), function $_CPWindowView___minimumResizeSize(self, _cmd)
{
    return CGSizeMake(4, _CPWindowViewMinContentHeight);
}
,["CGSize"]), new objj_method(sel_getUid("bodyOffset"), function $_CPWindowView__bodyOffset(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "frame").origin.y;
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
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 25, "title-bar-height", CGInsetMakeZero(), "shadow-inset", 5, "shadow-distance", CPColor.isa.objj_msgSend0(CPColor, "clearColor"), "window-shadow-color", CGSizeMakeZero(), "size-indicator", CPNull.isa.objj_msgSend0(CPNull, "null"), "resize-indicator", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "attached-sheet-shadow-color", 8, "shadow-height", CPNull.isa.objj_msgSend0(CPNull, "null"), "close-image-origin", CPNull.isa.objj_msgSend0(CPNull, "null"), "close-image-size", CPNull.isa.objj_msgSend0(CPNull, "null"), "close-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "close-active-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-color", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "title-text-color", CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", CPFontCurrentSystemSize), "title-font", CPNull.isa.objj_msgSend0(CPNull, "null"), "title-text-shadow-color", CGSizeMakeZero(), "title-text-shadow-offset", CPCenterTextAlignment, "title-alignment", CPLineBreakByTruncatingTail, "title-line-break-mode", CPTopVerticalTextAlignment, "title-vertical-alignment");
}
,["CPDictionary"])]);
}