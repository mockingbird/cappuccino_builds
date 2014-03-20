@STATIC;1.0;i;24;CPDragServer_Constants.ji;9;CPEvent.ji;13;CPImageView.ji;14;CPPasteboard.ji;8;CPView.ji;20;CPWindow_Constants.jt;21037;objj_executeFile("CPDragServer_Constants.j", YES);objj_executeFile("CPEvent.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow_Constants.j", YES);var CPDragServerPreviousEvent = nil,
    CPDragServerPeriodicUpdateInterval = 0.05;
var CPSharedDragServer = nil;
var CPDragServerSource = nil,
    CPDragServerDraggingInfo = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPDraggingInfo"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("draggingPasteboard"), function $CPDraggingInfo__draggingPasteboard(self, _cmd)
{
    if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        return objj_msgSend(_CPDOMDataTransferPasteboard, "DOMDataTransferPasteboard");
    return objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingPasteboard");
}
,["CPPasteboard"]), new objj_method(sel_getUid("draggingSource"), function $CPDraggingInfo__draggingSource(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingSource");
}
,["id"]), new objj_method(sel_getUid("draggingLocation"), function $CPDraggingInfo__draggingLocation(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingLocation");
}
,["CGPoint"]), new objj_method(sel_getUid("draggingDestinationWindow"), function $CPDraggingInfo__draggingDestinationWindow(self, _cmd)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingDestination"), "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingDestination") : objj_msgSend(objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingDestination"), "window");
}
,["CPWindow"]), new objj_method(sel_getUid("draggedImage"), function $CPDraggingInfo__draggedImage(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "draggedView"), "image");
}
,["CPImage"]), new objj_method(sel_getUid("draggedImageLocation"), function $CPDraggingInfo__draggedImageLocation(self, _cmd)
{
    return objj_msgSend(self, "draggedViewLocation");
}
,["CGPoint"]), new objj_method(sel_getUid("draggedView"), function $CPDraggingInfo__draggedView(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggedView");
}
,["CPView"]), new objj_method(sel_getUid("draggedViewLocation"), function $CPDraggingInfo__draggedViewLocation(self, _cmd)
{
    var dragServer = objj_msgSend(CPDragServer, "sharedDragServer");
    return objj_msgSend(objj_msgSend(objj_msgSend(dragServer, "draggingDestination"), "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? objj_msgSend(dragServer, "draggingDestination") : objj_msgSend(objj_msgSend(dragServer, "draggingDestination"), "window"), "convertPlatformWindowToBase:", objj_msgSend(objj_msgSend(dragServer, "draggedView"), "frame").origin);
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
        self._draggedWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessWindowMask);
        objj_msgSend(self._draggedWindow, "setLevel:", CPDraggingWindowLevel);
    }
    return self;
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
        if (objj_msgSend(self._draggingSource, "respondsToSelector:", sel_getUid("draggedImage:beganAt:")))
            objj_msgSend(self._draggingSource, "draggedImage:beganAt:", objj_msgSend(self._draggedView, "image"), aLocation);
    }
    else
    {
        if (objj_msgSend(self._draggingSource, "respondsToSelector:", sel_getUid("draggedView:beganAt:")))
            objj_msgSend(self._draggingSource, "draggedView:beganAt:", self._draggedView, aLocation);
    }
    if (!objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        objj_msgSend(self._draggedWindow, "orderFront:", self);
}
,["void","CPPlatformWindow","CGPoint"]), new objj_method(sel_getUid("draggingSourceUpdatedWithGlobalLocation:"), function $CPDragServer__draggingSourceUpdatedWithGlobalLocation_(self, _cmd, aGlobalLocation)
{
    if (!objj_msgSend(CPPlatform, "supportsDragAndDrop"))
    {
        var frame = objj_msgSend(self._draggedWindow, "frame");
        frame.origin.x = aGlobalLocation.x - self._draggingOffset.width;
        frame.origin.y = aGlobalLocation.y - self._draggingOffset.height;
        objj_msgSend(self._draggedWindow, "_setFrame:display:animate:constrainWidth:constrainHeight:", frame, YES, NO, NO, NO);
    }
    if (self._implementedDraggingSourceMethods & CPDraggingSource_draggedImage_movedTo_)
        objj_msgSend(self._draggingSource, "draggedImage:movedTo:", objj_msgSend(self._draggedView, "image"), aGlobalLocation);
    else if (self._implementedDraggingSourceMethods & CPDraggingSource_draggedView_movedTo_)
        objj_msgSend(self._draggingSource, "draggedView:movedTo:", self._draggedView, aGlobalLocation);
}
,["void","CGPoint"]), new objj_method(sel_getUid("draggingUpdatedInPlatformWindow:location:"), function $CPDragServer__draggingUpdatedInPlatformWindow_location_(self, _cmd, aPlatformWindow, aLocation)
{
    objj_msgSend(self._draggingUpdateTimer, "invalidate");
    self._draggingUpdateTimer = nil;
    var dragOperation = CPDragOperationCopy,
        draggingDestination = objj_msgSend(aPlatformWindow, "_dragHitTest:pasteboard:", aLocation, objj_msgSend(CPDragServerDraggingInfo, "draggingPasteboard"));
    if (draggingDestination)
        self._draggingLocation = objj_msgSend(objj_msgSend(draggingDestination, "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? draggingDestination : objj_msgSend(draggingDestination, "window"), "convertPlatformWindowToBase:", aLocation);
    if (draggingDestination !== self._draggingDestination)
    {
        if (objj_msgSend(self._draggingDestination, "respondsToSelector:", sel_getUid("draggingExited:")))
            objj_msgSend(self._draggingDestination, "draggingExited:", CPDragServerDraggingInfo);
        self._draggingDestination = draggingDestination;
        if (objj_msgSend(self._draggingDestination, "respondsToSelector:", sel_getUid("wantsPeriodicDraggingUpdates")))
            self._draggingDestinationWantsPeriodicUpdates = objj_msgSend(self._draggingDestination, "wantsPeriodicDraggingUpdates");
        else
            self._draggingDestinationWantsPeriodicUpdates = YES;
        if (objj_msgSend(self._draggingDestination, "respondsToSelector:", sel_getUid("draggingEntered:")))
            dragOperation = objj_msgSend(self._draggingDestination, "draggingEntered:", CPDragServerDraggingInfo);
    }
    else if (objj_msgSend(self._draggingDestination, "respondsToSelector:", sel_getUid("draggingUpdated:")))
        dragOperation = objj_msgSend(self._draggingDestination, "draggingUpdated:", CPDragServerDraggingInfo);
    if (!self._draggingDestination)
        dragOperation = CPDragOperationNone;
    else
    {
        if (self._draggingDestinationWantsPeriodicUpdates)
            self._draggingUpdateTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", CPDragServerPeriodicUpdateInterval, self, sel_getUid("_sendPeriodicDraggingUpdate:"), objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", aPlatformWindow, "platformWindow", aLocation, "location"), NO);
        var scrollView = objj_msgSend(self._draggingDestination, "isKindOfClass:", objj_msgSend(CPView, "class")) ? objj_msgSend(self._draggingDestination, "enclosingScrollView") : nil;
        if (scrollView)
        {
            var contentView = objj_msgSend(scrollView, "contentView"),
                bounds = objj_msgSend(contentView, "bounds"),
                insetBounds = CGRectInset(bounds, 30, 30),
                eventLocation = objj_msgSend(contentView, "convertPoint:fromView:", self._draggingLocation, nil),
                deltaX = 0,
                deltaY = 0;
            if (!CGRectContainsPoint(insetBounds, eventLocation))
            {
                if (objj_msgSend(scrollView, "hasVerticalScroller"))
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
                if (objj_msgSend(scrollView, "hasHorizontalScroller"))
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
                objj_msgSend(contentView, "scrollToPoint:", scrollPoint);
                objj_msgSend(objj_msgSend(scrollView, "_headerView"), "scrollPoint:", scrollPoint);
            }
        }
    }
    return dragOperation;
}
,["CPDragOperation","CPPlatformWindow","CGPoint"]), new objj_method(sel_getUid("_sendPeriodicDraggingUpdate:"), function $CPDragServer___sendPeriodicDraggingUpdate_(self, _cmd, aTimer)
{
    var userInfo = objj_msgSend(aTimer, "userInfo");
    self._dragOperation = objj_msgSend(self, "draggingUpdatedInPlatformWindow:location:", objj_msgSend(userInfo, "objectForKey:", "platformWindow"), objj_msgSend(userInfo, "objectForKey:", "location"));
}
,["void","CPTimer"]), new objj_method(sel_getUid("draggingEndedInPlatformWindow:globalLocation:operation:"), function $CPDragServer__draggingEndedInPlatformWindow_globalLocation_operation_(self, _cmd, aPlatformWindow, aLocation, anOperation)
{
    objj_msgSend(self._draggingUpdateTimer, "invalidate");
    self._draggingUpdateTimer = nil;
    objj_msgSend(self._draggedView, "removeFromSuperview");
    if (!objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        objj_msgSend(self._draggedWindow, "orderOut:", self);
    if (self._implementedDraggingSourceMethods & CPDraggingSource_draggedImage_endedAt_operation_)
        objj_msgSend(self._draggingSource, "draggedImage:endedAt:operation:", objj_msgSend(self._draggedView, "image"), aLocation, anOperation);
    else if (self._implementedDraggingSourceMethods & CPDraggingSource_draggedView_endedAt_operation_)
        objj_msgSend(self._draggingSource, "draggedView:endedAt:operation:", self._draggedView, aLocation, anOperation);
    self._isDragging = NO;
}
,["void","CPPlatformWindow","CGPoint","CPDragOperation"]), new objj_method(sel_getUid("performDragOperationInPlatformWindow:"), function $CPDragServer__performDragOperationInPlatformWindow_(self, _cmd, aPlatformWindow)
{
    if (self._draggingDestination && (!objj_msgSend(self._draggingDestination, "respondsToSelector:", sel_getUid("prepareForDragOperation:")) || objj_msgSend(self._draggingDestination, "prepareForDragOperation:", CPDragServerDraggingInfo)) && (!objj_msgSend(self._draggingDestination, "respondsToSelector:", sel_getUid("performDragOperation:")) || objj_msgSend(self._draggingDestination, "performDragOperation:", CPDragServerDraggingInfo)) && objj_msgSend(self._draggingDestination, "respondsToSelector:", sel_getUid("concludeDragOperation:")))
        objj_msgSend(self._draggingDestination, "concludeDragOperation:", CPDragServerDraggingInfo);
}
,["void","CPPlatformWindow"]), new objj_method(sel_getUid("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function $CPDragServer__dragView_fromWindow_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, aWindow, viewLocation, mouseOffset, mouseDownEvent, aPasteboard, aSourceObject, slideBack)
{
    self._isDragging = YES;
    self._draggedView = aView;
    self._draggingPasteboard = aPasteboard || objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard);
    self._draggingSource = aSourceObject;
    self._draggingDestination = nil;
    self._shouldSlideBack = slideBack;
    var mouseDownWindow = objj_msgSend(mouseDownEvent, "window"),
        mouseDownEventLocation = objj_msgSend(mouseDownEvent, "locationInWindow");
    if (mouseDownEventLocation)
    {
        if (mouseDownWindow)
            mouseDownEventLocation = objj_msgSend(mouseDownWindow, "convertBaseToGlobal:", mouseDownEventLocation);
        self._draggingOffset = CGSizeMake(mouseDownEventLocation.x - viewLocation.x, mouseDownEventLocation.y - viewLocation.y);
    }
    else
        self._draggingOffset = CGSizeMakeZero();
    if (objj_msgSend(CPPlatform, "isBrowser"))
        objj_msgSend(self._draggedWindow, "setPlatformWindow:", objj_msgSend(aWindow, "platformWindow"));
    objj_msgSend(aView, "setFrameOrigin:", CGPointMakeZero());
    var mouseLocation = objj_msgSend(CPEvent, "mouseLocation"),
        viewSize = objj_msgSend(aView, "frameSize"),
        startDragLocationX = mouseLocation.x - self._draggingOffset.width,
        startDragLocationY = mouseLocation.y - self._draggingOffset.height,
        draggedWindowFrame = CGRectMake(startDragLocationX, startDragLocationY, viewSize.width, viewSize.height);
    self._startDragLocation = CGPointMake(startDragLocationX, startDragLocationY);
    objj_msgSend(self._draggedWindow, "_setFrame:display:animate:constrainWidth:constrainHeight:", draggedWindowFrame, YES, NO, NO, NO);
    objj_msgSend(objj_msgSend(self._draggedWindow, "contentView"), "addSubview:", aView);
    self._implementedDraggingSourceMethods = 0;
    if (self._draggedView === self._imageView)
    {
        if (objj_msgSend(self._draggingSource, "respondsToSelector:", sel_getUid("draggedImage:movedTo:")))
            self._implementedDraggingSourceMethods |= CPDraggingSource_draggedImage_movedTo_;
        if (objj_msgSend(self._draggingSource, "respondsToSelector:", sel_getUid("draggedImage:endedAt:operation:")))
            self._implementedDraggingSourceMethods |= CPDraggingSource_draggedImage_endedAt_operation_;
    }
    else
    {
        if (objj_msgSend(self._draggingSource, "respondsToSelector:", sel_getUid("draggedView:movedTo:")))
            self._implementedDraggingSourceMethods |= CPDraggingSource_draggedView_movedTo_;
        if (objj_msgSend(self._draggingSource, "respondsToSelector:", sel_getUid("draggedView:endedAt:operation:")))
            self._implementedDraggingSourceMethods |= CPDraggingSource_draggedView_endedAt_operation_;
    }
    if (!objj_msgSend(CPPlatform, "supportsDragAndDrop"))
    {
        objj_msgSend(self, "draggingStartedInPlatformWindow:globalLocation:", objj_msgSend(aWindow, "platformWindow"), mouseLocation);
        objj_msgSend(self, "trackDragging:", mouseDownEvent);
    }
}
,["void","CPView","CPWindow","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function $CPDragServer__dragImage_fromWindow_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{
    self._isDraggingImage = YES;
    var imageSize = objj_msgSend(anImage, "size");
    if (!self._imageView)
        self._imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, imageSize.width, imageSize.height));
    objj_msgSend(self._imageView, "setImage:", anImage);
    objj_msgSend(self, "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", self._imageView, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
,["void","CPImage","CPWindow","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("trackDragging:"), function $CPDragServer__trackDragging_(self, _cmd, anEvent)
{
    var type = objj_msgSend(anEvent, "type"),
        platformWindow = objj_msgSend(self._draggedWindow, "platformWindow"),
        platformWindowLocation = objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToPlatformWindow:", objj_msgSend(anEvent, "locationInWindow"));
    if (type === CPLeftMouseUp)
    {
        if (self._dragOperation !== CPDragOperationNone)
            objj_msgSend(self, "performDragOperationInPlatformWindow:", platformWindow);
        objj_msgSend(self, "draggingEndedInPlatformWindow:globalLocation:operation:", platformWindow, platformWindowLocation, self._dragOperation);
        return;
    }
    else if (type === CPKeyDown)
    {
        var characters = objj_msgSend(anEvent, "characters");
        if (characters === CPEscapeFunctionKey)
        {
            self._dragOperation = CPDragOperationNone;
            objj_msgSend(self, "draggingEndedInPlatformWindow:globalLocation:operation:", platformWindow, CGPointMakeZero(), self._dragOperation);
            return;
        }
    }
    else
    {
        objj_msgSend(self, "draggingSourceUpdatedWithGlobalLocation:", platformWindowLocation);
        self._dragOperation = objj_msgSend(self, "draggingUpdatedInPlatformWindow:location:", platformWindow, platformWindowLocation);
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackDragging:"), CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask | CPKeyDownMask, nil, 0, YES);
}
,["void","CPEvent"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPDragServer__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPDragServer, "class"))
        return;
    CPDragServerDraggingInfo = objj_msgSend(objj_msgSend(CPDraggingInfo, "alloc"), "init");
}
,["void"]), new objj_method(sel_getUid("sharedDragServer"), function $CPDragServer__sharedDragServer(self, _cmd)
{
    if (!CPSharedDragServer)
        CPSharedDragServer = objj_msgSend(objj_msgSend(CPDragServer, "alloc"), "init");
    return CPSharedDragServer;
}
,["CPDragServer"])]);
}