@STATIC;1.0;i;8;CPView.jt;9774;objj_executeFile("CPView.j", YES);{var the_class = objj_allocateClassPair(CPView, "CPClipView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_documentView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setDocumentView:"), function $CPClipView__setDocumentView_(self, _cmd, aView)
{
    if (self._documentView == aView)
        return;
    if (self._documentView)
    {
        self.isa.objj_msgSend1(self, "_removeObserverDocumentView:", self._documentView);
        ((___r1 = self._documentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    }
    self._documentView = aView;
    if (self._documentView)
    {
        self.isa.objj_msgSend1(self, "addSubview:", self._documentView);
        self.isa.objj_msgSend0(self, "_observeDocumentView");
    }
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("_observeDocumentView"), function $CPClipView___observeDocumentView(self, _cmd)
{
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    ((___r1 = self._documentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPostsFrameChangedNotifications:", YES));
    ((___r1 = self._documentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPostsBoundsChangedNotifications:", YES));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("viewFrameChanged:"), CPViewFrameDidChangeNotification, self._documentView));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("viewBoundsChanged:"), CPViewBoundsDidChangeNotification, self._documentView));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_removeObserverDocumentView:"), function $CPClipView___removeObserverDocumentView_(self, _cmd, aDocumentView)
{
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPViewFrameDidChangeNotification, self._documentView));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPViewBoundsDidChangeNotification, self._documentView));
}
,["void","CPView"]), new objj_method(sel_getUid("_addObservers"), function $CPClipView___addObservers(self, _cmd)
{
    if (self._isObserving)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPClipView").super_class }, "_addObservers");
    if (self._documentView)
        self.isa.objj_msgSend0(self, "_observeDocumentView");
}
,["void"]), new objj_method(sel_getUid("_removeObservers"), function $CPClipView___removeObservers(self, _cmd)
{
    if (!self._isObserving)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPClipView").super_class }, "_removeObservers");
    if (self._documentView)
        self.isa.objj_msgSend1(self, "_removeObserverDocumentView:", self._documentView);
}
,["void"]), new objj_method(sel_getUid("documentView"), function $CPClipView__documentView(self, _cmd)
{
    return self._documentView;
}
,["id"]), new objj_method(sel_getUid("constrainScrollPoint:"), function $CPClipView__constrainScrollPoint_(self, _cmd, aPoint)
{
    if (!self._documentView)
        return CGPointMakeZero();
    var documentFrame = ((___r1 = self._documentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    aPoint.x = MAX(0.0, MIN(aPoint.x, MAX(CGRectGetWidth(documentFrame) - CGRectGetWidth(self._bounds), 0.0)));
    aPoint.y = MAX(0.0, MIN(aPoint.y, MAX(CGRectGetHeight(documentFrame) - CGRectGetHeight(self._bounds), 0.0)));
    return aPoint;
    var ___r1;
}
,["CGPoint","CGPoint"]), new objj_method(sel_getUid("setBoundsOrigin:"), function $CPClipView__setBoundsOrigin_(self, _cmd, aPoint)
{
    if (CGPointEqualToPoint(self._bounds.origin, aPoint))
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPClipView").super_class }, "setBoundsOrigin:", aPoint);
    var superview = self.isa.objj_msgSend0(self, "superview"),
        scrollViewClass = objj_getClass("CPScrollView");
    if ((superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", scrollViewClass)))
        (superview == null ? null : superview.isa.objj_msgSend1(superview, "reflectScrolledClipView:", self));
}
,["void","CGPoint"]), new objj_method(sel_getUid("scrollToPoint:"), function $CPClipView__scrollToPoint_(self, _cmd, aPoint)
{
    self.isa.objj_msgSend1(self, "setBoundsOrigin:", self.isa.objj_msgSend1(self, "constrainScrollPoint:", aPoint));
}
,["void","CGPoint"]), new objj_method(sel_getUid("viewBoundsChanged:"), function $CPClipView__viewBoundsChanged_(self, _cmd, aNotification)
{
    self.isa.objj_msgSend0(self, "_constrainScrollPoint");
}
,["void","CPNotification"]), new objj_method(sel_getUid("viewFrameChanged:"), function $CPClipView__viewFrameChanged_(self, _cmd, aNotification)
{
    self.isa.objj_msgSend0(self, "_constrainScrollPoint");
}
,["void","CPNotification"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPClipView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPClipView").super_class }, "resizeSubviewsWithOldSize:", aSize);
    self.isa.objj_msgSend0(self, "_constrainScrollPoint");
}
,["void","CGSize"]), new objj_method(sel_getUid("_constrainScrollPoint"), function $CPClipView___constrainScrollPoint(self, _cmd)
{
    var oldScrollPoint = self.isa.objj_msgSend0(self, "bounds").origin;
    self.isa.objj_msgSend1(self, "scrollToPoint:", oldScrollPoint);
    if (!CGPointEqualToPoint(oldScrollPoint, self.isa.objj_msgSend0(self, "bounds").origin))
        return;
    var superview = self.isa.objj_msgSend0(self, "superview"),
        scrollViewClass = objj_getClass("CPScrollView");
    if ((superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", scrollViewClass)))
        (superview == null ? null : superview.isa.objj_msgSend1(superview, "reflectScrolledClipView:", self));
}
,["void"]), new objj_method(sel_getUid("autoscroll:"), function $CPClipView__autoscroll_(self, _cmd, anEvent)
{
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        eventLocation = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil),
        superview = self.isa.objj_msgSend0(self, "superview"),
        deltaX = 0,
        deltaY = 0;
    if (CGRectContainsPoint(bounds, eventLocation))
        return NO;
    if (!(superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", (CPScrollView == null ? null : CPScrollView.isa.objj_msgSend0(CPScrollView, "class")))) || (superview == null ? null : superview.isa.objj_msgSend0(superview, "hasVerticalScroller")))
    {
        if (eventLocation.y < CGRectGetMinY(bounds))
            deltaY = CGRectGetMinY(bounds) - eventLocation.y;
        else if (eventLocation.y > CGRectGetMaxY(bounds))
            deltaY = CGRectGetMaxY(bounds) - eventLocation.y;
        if (deltaY < -bounds.size.height)
            deltaY = -bounds.size.height;
        if (deltaY > bounds.size.height)
            deltaY = bounds.size.height;
    }
    if (!(superview == null ? null : superview.isa.objj_msgSend1(superview, "isKindOfClass:", (CPScrollView == null ? null : CPScrollView.isa.objj_msgSend0(CPScrollView, "class")))) || (superview == null ? null : superview.isa.objj_msgSend0(superview, "hasHorizontalScroller")))
    {
        if (eventLocation.x < CGRectGetMinX(bounds))
            deltaX = CGRectGetMinX(bounds) - eventLocation.x;
        else if (eventLocation.x > CGRectGetMaxX(bounds))
            deltaX = CGRectGetMaxX(bounds) - eventLocation.x;
        if (deltaX < -bounds.size.width)
            deltaX = -bounds.size.width;
        if (deltaX > bounds.size.width)
            deltaX = bounds.size.width;
    }
    return self.isa.objj_msgSend1(self, "scrollToPoint:", CGPointMake(bounds.origin.x - deltaX, bounds.origin.y - deltaY));
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("documentVisibleRect"), function $CPClipView__documentVisibleRect(self, _cmd)
{
    return self.isa.objj_msgSend2(self, "convertRect:fromView:", self.isa.objj_msgSend0(self, "bounds"), self._documentView);
}
,["CGRect"])]);
}var CPClipViewDocumentViewKey = "CPScrollViewDocumentView";
{
var the_class = objj_getClass("CPClipView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPClipView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPClipView__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPClipView").super_class }, "initWithCoder:", aCoder))
    {
        self._documentView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPClipViewDocumentViewKey));
        (self == null ? null : self.isa.objj_msgSend0(self, "_observeDocumentView"));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPClipView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPClipView").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._documentView, CPClipViewDocumentViewKey));
}
,["void","CPCoder"])]);
}