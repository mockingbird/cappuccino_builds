@STATIC;1.0;i;24;CPDragServer_Constants.ji;9;CPEvent.ji;13;CPImageView.ji;14;CPPasteboard.ji;8;CPView.ji;20;CPWindow_Constants.jt;27271;objj_executeFile("CPDragServer_Constants.j", YES);objj_executeFile("CPEvent.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow_Constants.j", YES);var CPDragServerPreviousEvent = nil,
    CPDragServerPeriodicUpdateInterval = 0.05;
var CPSharedDragServer = nil;
var CPDragServerSource = nil,
    CPDragServerDraggingInfo = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPDraggingInfo"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("draggingPasteboard"), function $CPDraggingInfo__draggingPasteboard(self, _cmd)
{
    if (CPPlatform.isa.objj_msgSend0(CPPlatform, "supportsDragAndDrop"))
        return (_CPDOMDataTransferPasteboard == null ? null : _CPDOMDataTransferPasteboard.isa.objj_msgSend0(_CPDOMDataTransferPasteboard, "DOMDataTransferPasteboard"));
    return ((___r1 = (CPDragServer == null ? null : CPDragServer.isa.objj_msgSend0(CPDragServer, "sharedDragServer"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "draggingPasteboard"));
    var ___r1;
}
,["CPPasteboard"]), new objj_method(sel_getUid("draggingSource"), function $CPDraggingInfo__draggingSource(self, _cmd)
{
    return ((___r1 = (CPDragServer == null ? null : CPDragServer.isa.objj_msgSend0(CPDragServer, "sharedDragServer"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "draggingSource"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("draggingLocation"), function $CPDraggingInfo__draggingLocation(self, _cmd)
{
    return ((___r1 = (CPDragServer == null ? null : CPDragServer.isa.objj_msgSend0(CPDragServer, "sharedDragServer"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "draggingLocation"));
    var ___r1;
}
,["CGPoint"]), new objj_method(sel_getUid("draggingDestinationWindow"), function $CPDraggingInfo__draggingDestinationWindow(self, _cmd)
{
    return ((___r1 = ((___r2 = (CPDragServer == null ? null : CPDragServer.isa.objj_msgSend0(CPDragServer, "sharedDragServer"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "draggingDestination"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", (CPWindow == null ? null : CPWindow.isa.objj_msgSend0(CPWindow, "class")))) ? ((___r1 = (CPDragServer == null ? null : CPDragServer.isa.objj_msgSend0(CPDragServer, "sharedDragServer"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "draggingDestination")) : ((___r1 = ((___r2 = (CPDragServer == null ? null : CPDragServer.isa.objj_msgSend0(CPDragServer, "sharedDragServer"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "draggingDestination"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "window"));
    var ___r1, ___r2;
}
,["CPWindow"]), new objj_method(sel_getUid("draggedImage"), function $CPDraggingInfo__draggedImage(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "draggedView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "image"));
    var ___r1;
}
,["CPImage"]), new objj_method(sel_getUid("draggedImageLocation"), function $CPDraggingInfo__draggedImageLocation(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "draggedViewLocation");
}
,["CGPoint"]), new objj_method(sel_getUid("draggedView"), function $CPDraggingInfo__draggedView(self, _cmd)
{
    return ((___r1 = (CPDragServer == null ? null : CPDragServer.isa.objj_msgSend0(CPDragServer, "sharedDragServer"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "draggedView"));
    var ___r1;
}
,["CPView"]), new objj_method(sel_getUid("draggedViewLocation"), function $CPDraggingInfo__draggedViewLocation(self, _cmd)
{
    var dragServer = (CPDragServer == null ? null : CPDragServer.isa.objj_msgSend0(CPDragServer, "sharedDragServer"));
    return ((___r1 = ((___r2 = (dragServer == null ? null : dragServer.isa.objj_msgSend0(dragServer, "draggingDestination"))), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "isKindOfClass:", (CPWindow == null ? null : CPWindow.isa.objj_msgSend0(CPWindow, "class")))) ? (dragServer == null ? null : dragServer.isa.objj_msgSend0(dragServer, "draggingDestination")) : ((___r2 = (dragServer == null ? null : dragServer.isa.objj_msgSend0(dragServer, "draggingDestination"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertPlatformWindowToBase:", ((___r2 = (dragServer == null ? null : dragServer.isa.objj_msgSend0(dragServer, "draggedView"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).origin));
    var ___r1, ___r2;
}
,["CGPoint"])]);
}var CPDraggingSource_draggedImage_movedTo_ = 1 << 0,
    CPDraggingSource_draggedImage_endedAt_operation_ = 1 << 1,
    CPDraggingSource_draggedView_movedTo_ = 1 << 2,
    CPDraggingSource_draggedView_endedAt_operation_ = 1 << 3;
{var the_class = objj_allocateClassPair(CPObject, "CPDragServer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isDragging"), new objj_ivar("_draggedWindow"), new objj_ivar("_draggedView"), new objj_ivar("_imageView"), new objj_ivar("_isDraggingImage"), new objj_ivar("_draggingOffset"), new objj_ivar("_draggingPasteboard"), new objj_ivar("_draggingSource"), new objj_ivar("_implementedDraggingSourceMethods"), new objj_ivar("_draggingLocation"), new objj_ivar("_draggingDestination"), new objj_ivar("_draggingDestinationWantsPeriodicUpdates"), new objj_ivar("_startDragLocation"), new objj_ivar("_shouldSlideBack"), new objj_ivar("_dragOperation"), new objj_ivar("_draggingUpdateTimer")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isDragging"), function $CPDragServer__isDragging(self, _cmd)
{
    return self._isDragging;
}
,["BOOL"]), new objj_method(sel_getUid("draggedWindow"), function $CPDragServer__draggedWindow(self, _cmd)
{
    return self._draggedWindow;
}
,["CPWindow"]), new objj_method(sel_getUid("draggedView"), function $CPDragServer__draggedView(self, _cmd)
{
    return self._draggedView;
}
,["CPView"]), new objj_method(sel_getUid("draggingOffset"), function $CPDragServer__draggingOffset(self, _cmd)
{
    return self._draggingOffset;
}
,["CGSize"]), new objj_method(sel_getUid("draggingPasteboard"), function $CPDragServer__draggingPasteboard(self, _cmd)
{
    return self._draggingPasteboard;
}
,["CPPasteboard"]), new objj_method(sel_getUid("draggingSource"), function $CPDragServer__draggingSource(self, _cmd)
{
    return self._draggingSource;
}
,["id"]), new objj_method(sel_getUid("init"), function $CPDragServer__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDragServer").super_class }, "init");
    if (self)
    {
        self._draggedWindow = ((___r1 = (CPWindow == null ? null : CPWindow.isa.objj_msgSend0(CPWindow, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessWindowMask));
        ((___r1 = self._draggedWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLevel:", CPDraggingWindowLevel));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("draggingDestination"), function $CPDragServer__draggingDestination(self, _cmd)
{
    return self._draggingDestination;
}
,["id"]), new objj_method(sel_getUid("draggingLocation"), function $CPDragServer__draggingLocation(self, _cmd)
{
    return self._draggingLocation;
}
,["CGPoint"]), new objj_method(sel_getUid("draggingStartedInPlatformWindow:globalLocation:"), function $CPDragServer__draggingStartedInPlatformWindow_globalLocation_(self, _cmd, aPlatformWindow, aLocation)
{
    if (self._isDraggingImage)
    {
        if (((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("draggedImage:beganAt:"))))
            ((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "draggedImage:beganAt:", ((___r2 = self._draggedView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image")), aLocation));
    }
    else
    {
        if (((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("draggedView:beganAt:"))))
            ((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "draggedView:beganAt:", self._draggedView, aLocation));
    }
    if (!CPPlatform.isa.objj_msgSend0(CPPlatform, "supportsDragAndDrop"))
        ((___r1 = self._draggedWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderFront:", self));
    var ___r1, ___r2;
}
,["void","CPPlatformWindow","CGPoint"]), new objj_method(sel_getUid("draggingSourceUpdatedWithGlobalLocation:"), function $CPDragServer__draggingSourceUpdatedWithGlobalLocation_(self, _cmd, aGlobalLocation)
{
    if (!CPPlatform.isa.objj_msgSend0(CPPlatform, "supportsDragAndDrop"))
    {
        var frame = ((___r1 = self._draggedWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
        frame.origin.x = aGlobalLocation.x - self._draggingOffset.width;
        frame.origin.y = aGlobalLocation.y - self._draggingOffset.height;
        ((___r1 = self._draggedWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "_setFrame:display:animate:constrainWidth:constrainHeight:", frame, YES, NO, NO, NO));
    }
    if (self._implementedDraggingSourceMethods & CPDraggingSource_draggedImage_movedTo_)
        ((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "draggedImage:movedTo:", ((___r2 = self._draggedView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image")), aGlobalLocation));
    else if (self._implementedDraggingSourceMethods & CPDraggingSource_draggedView_movedTo_)
        ((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "draggedView:movedTo:", self._draggedView, aGlobalLocation));
    var ___r1, ___r2;
}
,["void","CGPoint"]), new objj_method(sel_getUid("draggingUpdatedInPlatformWindow:location:"), function $CPDragServer__draggingUpdatedInPlatformWindow_location_(self, _cmd, aPlatformWindow, aLocation)
{
    ((___r1 = self._draggingUpdateTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
    self._draggingUpdateTimer = nil;
    var dragOperation = CPDragOperationCopy,
        draggingDestination = (aPlatformWindow == null ? null : aPlatformWindow.isa.objj_msgSend2(aPlatformWindow, "_dragHitTest:pasteboard:", aLocation, (CPDragServerDraggingInfo == null ? null : CPDragServerDraggingInfo.isa.objj_msgSend0(CPDragServerDraggingInfo, "draggingPasteboard"))));
    if (draggingDestination)
        self._draggingLocation = ((___r1 = (draggingDestination == null ? null : draggingDestination.isa.objj_msgSend1(draggingDestination, "isKindOfClass:", (CPWindow == null ? null : CPWindow.isa.objj_msgSend0(CPWindow, "class")))) ? draggingDestination : (draggingDestination == null ? null : draggingDestination.isa.objj_msgSend0(draggingDestination, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertPlatformWindowToBase:", aLocation));
    if (draggingDestination !== self._draggingDestination)
    {
        if (((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("draggingExited:"))))
            ((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "draggingExited:", CPDragServerDraggingInfo));
        self._draggingDestination = draggingDestination;
        if (((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("wantsPeriodicDraggingUpdates"))))
            self._draggingDestinationWantsPeriodicUpdates = ((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "wantsPeriodicDraggingUpdates"));
        else
            self._draggingDestinationWantsPeriodicUpdates = YES;
        if (((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("draggingEntered:"))))
            dragOperation = ((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "draggingEntered:", CPDragServerDraggingInfo));
    }
    else if (((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("draggingUpdated:"))))
        dragOperation = ((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "draggingUpdated:", CPDragServerDraggingInfo));
    if (!self._draggingDestination)
        dragOperation = CPDragOperationNone;
    else
    {
        if (self._draggingDestinationWantsPeriodicUpdates)
            self._draggingUpdateTimer = CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", CPDragServerPeriodicUpdateInterval, self, sel_getUid("_sendPeriodicDraggingUpdate:"), objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aPlatformWindow, "platformWindow", aLocation, "location"), NO);
        var scrollView = ((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPView.isa.objj_msgSend0(CPView, "class"))) ? ((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "enclosingScrollView")) : nil;
        if (scrollView)
        {
            var contentView = (scrollView == null ? null : scrollView.isa.objj_msgSend0(scrollView, "contentView")),
                bounds = (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "bounds")),
                insetBounds = CGRectInset(bounds, 30, 30),
                eventLocation = (contentView == null ? null : contentView.isa.objj_msgSend2(contentView, "convertPoint:fromView:", self._draggingLocation, nil)),
                deltaX = 0,
                deltaY = 0;
            if (!CGRectContainsPoint(insetBounds, eventLocation))
            {
                if ((scrollView == null ? null : scrollView.isa.objj_msgSend0(scrollView, "hasVerticalScroller")))
                {
                    if (eventLocation.y < CGRectGetMinY(insetBounds))
                        deltaY = CGRectGetMinY(insetBounds) - eventLocation.y;
                    else if (eventLocation.y > CGRectGetMaxY(insetBounds))
                        deltaY = CGRectGetMaxY(insetBounds) - eventLocation.y;
                    if (deltaY < -insetBounds.size.height)
                        deltaY = -insetBounds.size.height;
                    if (deltaY > insetBounds.size.height)
                        deltaY = insetBounds.size.height;
                }
                if ((scrollView == null ? null : scrollView.isa.objj_msgSend0(scrollView, "hasHorizontalScroller")))
                {
                    if (eventLocation.x < CGRectGetMinX(insetBounds))
                        deltaX = CGRectGetMinX(insetBounds) - eventLocation.x;
                    else if (eventLocation.x > CGRectGetMaxX(insetBounds))
                        deltaX = CGRectGetMaxX(insetBounds) - eventLocation.x;
                    if (deltaX < -insetBounds.size.width)
                        deltaX = -insetBounds.size.width;
                    if (deltaX > insetBounds.size.width)
                        deltaX = insetBounds.size.width;
                }
                var scrollPoint = CGPointMake(bounds.origin.x - deltaX, bounds.origin.y - deltaY);
                (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "scrollToPoint:", scrollPoint));
                ((___r1 = (scrollView == null ? null : scrollView.isa.objj_msgSend0(scrollView, "_headerView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollPoint:", scrollPoint));
            }
        }
    }
    return dragOperation;
    var ___r1;
}
,["CPDragOperation","CPPlatformWindow","CGPoint"]), new objj_method(sel_getUid("_sendPeriodicDraggingUpdate:"), function $CPDragServer___sendPeriodicDraggingUpdate_(self, _cmd, aTimer)
{
    var userInfo = (aTimer == null ? null : aTimer.isa.objj_msgSend0(aTimer, "userInfo"));
    self._dragOperation = self.isa.objj_msgSend2(self, "draggingUpdatedInPlatformWindow:location:", (userInfo == null ? null : userInfo.isa.objj_msgSend1(userInfo, "objectForKey:", "platformWindow")), (userInfo == null ? null : userInfo.isa.objj_msgSend1(userInfo, "objectForKey:", "location")));
}
,["void","CPTimer"]), new objj_method(sel_getUid("draggingEndedInPlatformWindow:globalLocation:operation:"), function $CPDragServer__draggingEndedInPlatformWindow_globalLocation_operation_(self, _cmd, aPlatformWindow, aLocation, anOperation)
{
    ((___r1 = self._draggingUpdateTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
    self._draggingUpdateTimer = nil;
    ((___r1 = self._draggedView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    if (!CPPlatform.isa.objj_msgSend0(CPPlatform, "supportsDragAndDrop"))
        ((___r1 = self._draggedWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderOut:", self));
    if (self._implementedDraggingSourceMethods & CPDraggingSource_draggedImage_endedAt_operation_)
        ((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "draggedImage:endedAt:operation:", ((___r2 = self._draggedView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "image")), aLocation, anOperation));
    else if (self._implementedDraggingSourceMethods & CPDraggingSource_draggedView_endedAt_operation_)
        ((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "draggedView:endedAt:operation:", self._draggedView, aLocation, anOperation));
    self._isDragging = NO;
    var ___r1, ___r2;
}
,["void","CPPlatformWindow","CGPoint","CPDragOperation"]), new objj_method(sel_getUid("performDragOperationInPlatformWindow:"), function $CPDragServer__performDragOperationInPlatformWindow_(self, _cmd, aPlatformWindow)
{
    if (self._draggingDestination && (!((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("prepareForDragOperation:"))) || ((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "prepareForDragOperation:", CPDragServerDraggingInfo))) && (!((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("performDragOperation:"))) || ((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performDragOperation:", CPDragServerDraggingInfo))) && ((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("concludeDragOperation:"))))
        ((___r1 = self._draggingDestination), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "concludeDragOperation:", CPDragServerDraggingInfo));
    var ___r1;
}
,["void","CPPlatformWindow"]), new objj_method(sel_getUid("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function $CPDragServer__dragView_fromWindow_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, aWindow, viewLocation, mouseOffset, mouseDownEvent, aPasteboard, aSourceObject, slideBack)
{
    self._isDragging = YES;
    self._draggedView = aView;
    self._draggingPasteboard = aPasteboard || CPPasteboard.isa.objj_msgSend1(CPPasteboard, "pasteboardWithName:", CPDragPboard);
    self._draggingSource = aSourceObject;
    self._draggingDestination = nil;
    self._shouldSlideBack = slideBack;
    var mouseDownWindow = (mouseDownEvent == null ? null : mouseDownEvent.isa.objj_msgSend0(mouseDownEvent, "window")),
        mouseDownEventLocation = (mouseDownEvent == null ? null : mouseDownEvent.isa.objj_msgSend0(mouseDownEvent, "locationInWindow"));
    if (mouseDownEventLocation)
    {
        if (mouseDownWindow)
            mouseDownEventLocation = (mouseDownWindow == null ? null : mouseDownWindow.isa.objj_msgSend1(mouseDownWindow, "convertBaseToGlobal:", mouseDownEventLocation));
        self._draggingOffset = CGSizeMake(mouseDownEventLocation.x - viewLocation.x, mouseDownEventLocation.y - viewLocation.y);
    }
    else
        self._draggingOffset = CGSizeMakeZero();
    if (CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
        ((___r1 = self._draggedWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPlatformWindow:", (aWindow == null ? null : aWindow.isa.objj_msgSend0(aWindow, "platformWindow"))));
    (aView == null ? null : aView.isa.objj_msgSend1(aView, "setFrameOrigin:", CGPointMakeZero()));
    var mouseLocation = CPEvent.isa.objj_msgSend0(CPEvent, "mouseLocation"),
        viewSize = (aView == null ? null : aView.isa.objj_msgSend0(aView, "frameSize")),
        startDragLocationX = mouseLocation.x - self._draggingOffset.width,
        startDragLocationY = mouseLocation.y - self._draggingOffset.height,
        draggedWindowFrame = CGRectMake(startDragLocationX, startDragLocationY, viewSize.width, viewSize.height);
    self._startDragLocation = CGPointMake(startDragLocationX, startDragLocationY);
    ((___r1 = self._draggedWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "_setFrame:display:animate:constrainWidth:constrainHeight:", draggedWindowFrame, YES, NO, NO, NO));
    ((___r1 = ((___r2 = self._draggedWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", aView));
    self._implementedDraggingSourceMethods = 0;
    if (self._draggedView === self._imageView)
    {
        if (((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("draggedImage:movedTo:"))))
            self._implementedDraggingSourceMethods |= CPDraggingSource_draggedImage_movedTo_;
        if (((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("draggedImage:endedAt:operation:"))))
            self._implementedDraggingSourceMethods |= CPDraggingSource_draggedImage_endedAt_operation_;
    }
    else
    {
        if (((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("draggedView:movedTo:"))))
            self._implementedDraggingSourceMethods |= CPDraggingSource_draggedView_movedTo_;
        if (((___r1 = self._draggingSource), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("draggedView:endedAt:operation:"))))
            self._implementedDraggingSourceMethods |= CPDraggingSource_draggedView_endedAt_operation_;
    }
    if (!CPPlatform.isa.objj_msgSend0(CPPlatform, "supportsDragAndDrop"))
    {
        self.isa.objj_msgSend2(self, "draggingStartedInPlatformWindow:globalLocation:", (aWindow == null ? null : aWindow.isa.objj_msgSend0(aWindow, "platformWindow")), mouseLocation);
        self.isa.objj_msgSend1(self, "trackDragging:", mouseDownEvent);
    }
    var ___r1, ___r2;
}
,["void","CPView","CPWindow","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function $CPDragServer__dragImage_fromWindow_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{
    self._isDraggingImage = YES;
    var imageSize = (anImage == null ? null : anImage.isa.objj_msgSend0(anImage, "size"));
    if (!self._imageView)
        self._imageView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, imageSize.width, imageSize.height)));
    ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", anImage));
    self.isa.objj_msgSend(self, "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", self._imageView, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
    var ___r1;
}
,["void","CPImage","CPWindow","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("trackDragging:"), function $CPDragServer__trackDragging_(self, _cmd, anEvent)
{
    var type = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")),
        platformWindow = ((___r1 = self._draggedWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "platformWindow")),
        platformWindowLocation = ((___r1 = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertBaseToPlatformWindow:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow"))));
    if (type === CPLeftMouseUp)
    {
        if (self._dragOperation !== CPDragOperationNone)
            self.isa.objj_msgSend1(self, "performDragOperationInPlatformWindow:", platformWindow);
        self.isa.objj_msgSend3(self, "draggingEndedInPlatformWindow:globalLocation:operation:", platformWindow, platformWindowLocation, self._dragOperation);
        return;
    }
    else if (type === CPKeyDown)
    {
        var characters = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "characters"));
        if (characters === CPEscapeFunctionKey)
        {
            self._dragOperation = CPDragOperationNone;
            self.isa.objj_msgSend3(self, "draggingEndedInPlatformWindow:globalLocation:operation:", platformWindow, CGPointMakeZero(), self._dragOperation);
            return;
        }
    }
    else
    {
        self.isa.objj_msgSend1(self, "draggingSourceUpdatedWithGlobalLocation:", platformWindowLocation);
        self._dragOperation = self.isa.objj_msgSend2(self, "draggingUpdatedInPlatformWindow:location:", platformWindow, platformWindowLocation);
    }
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackDragging:"), CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask | CPKeyDownMask, nil, 0, YES));
    var ___r1;
}
,["void","CPEvent"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPDragServer__initialize(self, _cmd)
{
    if (self !== CPDragServer.isa.objj_msgSend0(CPDragServer, "class"))
        return;
    CPDragServerDraggingInfo = ((___r1 = CPDraggingInfo.isa.objj_msgSend0(CPDraggingInfo, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("sharedDragServer"), function $CPDragServer__sharedDragServer(self, _cmd)
{
    if (!CPSharedDragServer)
        CPSharedDragServer = ((___r1 = CPDragServer.isa.objj_msgSend0(CPDragServer, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return CPSharedDragServer;
    var ___r1;
}
,["CPDragServer"])]);
}