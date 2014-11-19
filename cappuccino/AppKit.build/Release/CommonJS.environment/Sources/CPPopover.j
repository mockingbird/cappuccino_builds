@STATIC;1.0;I;21;Foundation/CPObject.ji;10;CPButton.ji;9;CPColor.ji;9;CPImage.ji;13;CPImageView.ji;13;CPResponder.ji;8;CPView.ji;18;_CPPopoverWindow.jt;16233;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPButton.j", YES);objj_executeFile("CPColor.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("_CPPopoverWindow.j", YES);{var the_protocol = objj_allocateProtocol("CPPopoverDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPPopoverDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}CPPopoverBehaviorApplicationDefined = 0;
CPPopoverBehaviorTransient = 1;
CPPopoverBehaviorSemitransient = 2;
var CPPopoverDelegate_popover_willShow_ = 1 << 0,
    CPPopoverDelegate_popover_didShow_ = 1 << 1,
    CPPopoverDelegate_popover_shouldClose_ = 1 << 2,
    CPPopoverDelegate_popover_willClose_ = 1 << 3,
    CPPopoverDelegate_popover_didClose_ = 1 << 4;
{var the_class = objj_allocateClassPair(CPResponder, "CPPopover"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentViewController"), new objj_ivar("_delegate"), new objj_ivar("_animates"), new objj_ivar("_appearance"), new objj_ivar("_behavior"), new objj_ivar("_popoverWindow"), new objj_ivar("_positioningView"), new objj_ivar("_implementedDelegateMethods")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentViewController"), function $CPPopover__contentViewController(self, _cmd)
{
    return self._contentViewController;
}
,["CPViewController"]), new objj_method(sel_getUid("setContentViewController:"), function $CPPopover__setContentViewController_(self, _cmd, newValue)
{
    self._contentViewController = newValue;
}
,["void","CPViewController"]), new objj_method(sel_getUid("delegate"), function $CPPopover__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("_setDelegate:"), function $CPPopover___setDelegate_(self, _cmd, newValue)
{
    self._delegate = newValue;
}
,["void","id"]), new objj_method(sel_getUid("animates"), function $CPPopover__animates(self, _cmd)
{
    return self._animates;
}
,["BOOL"]), new objj_method(sel_getUid("_setAnimates:"), function $CPPopover___setAnimates_(self, _cmd, newValue)
{
    self._animates = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("appearance"), function $CPPopover__appearance(self, _cmd)
{
    return self._appearance;
}
,["int"]), new objj_method(sel_getUid("setAppearance:"), function $CPPopover__setAppearance_(self, _cmd, newValue)
{
    self._appearance = newValue;
}
,["void","int"]), new objj_method(sel_getUid("behavior"), function $CPPopover__behavior(self, _cmd)
{
    return self._behavior;
}
,["int"]), new objj_method(sel_getUid("_setBehavior:"), function $CPPopover___setBehavior_(self, _cmd, newValue)
{
    self._behavior = newValue;
}
,["void","int"]), new objj_method(sel_getUid("init"), function $CPPopover__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopover").super_class }, "init"))
    {
        self._animates = YES;
        self._appearance = CPPopoverAppearanceMinimal;
        self._behavior = CPPopoverBehaviorApplicationDefined;
    }
    return self;
}
,["CPPopover"]), new objj_method(sel_getUid("positioningRect"), function $CPPopover__positioningRect(self, _cmd)
{
    if (!((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible")))
        return CGRectMakeZero();
    return ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    var ___r1;
}
,["CGRect"]), new objj_method(sel_getUid("setPositioningRect:"), function $CPPopover__setPositioningRect_(self, _cmd, aRect)
{
    if (!((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible")))
        return;
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", aRect));
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("contentSize"), function $CPPopover__contentSize(self, _cmd)
{
    return ((___r1 = ((___r2 = self._contentViewController), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "view"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize"));
    var ___r1, ___r2;
}
,["CGSize"]), new objj_method(sel_getUid("setContentSize:"), function $CPPopover__setContentSize_(self, _cmd, aSize)
{
    if (!self._popoverWindow)
        ((___r1 = ((___r2 = self._contentViewController), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "view"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", aSize));
    else
        ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "updateFrameWithSize:", aSize));
    var ___r1, ___r2;
}
,["void","CGSize"]), new objj_method(sel_getUid("isShown"), function $CPPopover__isShown(self, _cmd)
{
    return ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("setAnimates:"), function $CPPopover__setAnimates_(self, _cmd, shouldAnimate)
{
    if (self._animates == shouldAnimate)
        return;
    self._animates = shouldAnimate;
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAnimates:", self._animates));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setBehavior:"), function $CPPopover__setBehavior_(self, _cmd, aBehavior)
{
    if (self._behavior == aBehavior)
        return;
    self._behavior = aBehavior;
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStyleMask:", self.isa.objj_msgSend0(self, "_styleMaskForBehavior")));
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("setDelegate:"), function $CPPopover__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("popoverWillShow:"))))
        self._implementedDelegateMethods |= CPPopoverDelegate_popover_willShow_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("popoverDidShow:"))))
        self._implementedDelegateMethods |= CPPopoverDelegate_popover_didShow_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("popoverShouldClose:"))))
        self._implementedDelegateMethods |= CPPopoverDelegate_popover_shouldClose_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("popoverWillClose:"))))
        self._implementedDelegateMethods |= CPPopoverDelegate_popover_willClose_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("popoverDidClose:"))))
        self._implementedDelegateMethods |= CPPopoverDelegate_popover_didClose_;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("showRelativeToRect:ofView:preferredEdge:"), function $CPPopover__showRelativeToRect_ofView_preferredEdge_(self, _cmd, positioningRect, positioningView, preferredEdge)
{
    if (!positioningView)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "positionView must not be nil");
    if (!self._contentViewController)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "contentViewController must not be nil");
    if (((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isClosing")) || ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isOpening")))
        return;
    self._positioningView = positioningView;
    if (!self._popoverWindow)
        self._popoverWindow = ((___r1 = _CPPopoverWindow.isa.objj_msgSend0(_CPPopoverWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", CGRectMakeZero(), self.isa.objj_msgSend0(self, "_styleMaskForBehavior")));
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPlatformWindow:", ((___r2 = (positioningView == null ? null : positioningView.isa.objj_msgSend0(positioningView, "window"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))));
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAppearance:", self._appearance));
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAnimates:", self._animates));
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMovableByWindowBackground:", NO));
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", ((___r2 = self._popoverWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "frameRectForContentRect:", ((___r3 = ((___r4 = self._contentViewController), ___r4 == null ? null : ___r4.isa.objj_msgSend0(___r4, "view"))), ___r3 == null ? null : ___r3.isa.objj_msgSend0(___r3, "frame"))))));
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContentView:", ((___r2 = self._contentViewController), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "view"))));
    if (!self.isa.objj_msgSend0(self, "isShown"))
        self.isa.objj_msgSend0(self, "_popoverWillShow");
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "positionRelativeToRect:ofView:preferredEdge:", positioningRect, positioningView, preferredEdge));
    if (!self.isa.objj_msgSend0(self, "isShown"))
        self.isa.objj_msgSend0(self, "_popoverWindowDidShow");
    var ___r1, ___r2, ___r3, ___r4;
}
,["void","CGRect","CPView","CPRectEdge"]), new objj_method(sel_getUid("_styleMaskForBehavior"), function $CPPopover___styleMaskForBehavior(self, _cmd)
{
    if (self._behavior == CPPopoverBehaviorApplicationDefined)
        return 0;
    return CPClosableOnBlurWindowMask;
}
,["unsigned"]), new objj_method(sel_getUid("close"), function $CPPopover__close(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_close");
}
,["void"]), new objj_method(sel_getUid("_close"), function $CPPopover___close(self, _cmd)
{
    if (((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isClosing")) || !self.isa.objj_msgSend0(self, "isShown"))
        return;
    self.isa.objj_msgSend0(self, "_popoverWillClose");
    self._positioningView = nil;
    ((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "close"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("performClose:"), function $CPPopover__performClose_(self, _cmd, sender)
{
    if (((___r1 = self._popoverWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isClosing")))
        return;
    if (self._implementedDelegateMethods & CPPopoverDelegate_popover_shouldClose_)
        if (!((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "popoverShouldClose:", self)))
            return;
    self.isa.objj_msgSend0(self, "_close");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_popoverWindowShouldClose"), function $CPPopover___popoverWindowShouldClose(self, _cmd)
{
    self.isa.objj_msgSend1(self, "performClose:", self);
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("_popoverWindowDidClose"), function $CPPopover___popoverWindowDidClose(self, _cmd)
{
    if (self._implementedDelegateMethods & CPPopoverDelegate_popover_didClose_)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "popoverDidClose:", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_popoverWindowDidShow"), function $CPPopover___popoverWindowDidShow(self, _cmd)
{
    if (self._implementedDelegateMethods & CPPopoverDelegate_popover_didShow_)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "popoverDidShow:", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_popoverWillClose"), function $CPPopover___popoverWillClose(self, _cmd)
{
    if (self._implementedDelegateMethods & CPPopoverDelegate_popover_willClose_)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "popoverWillClose:", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_popoverWillShow"), function $CPPopover___popoverWillShow(self, _cmd)
{
    if (self._implementedDelegateMethods & CPPopoverDelegate_popover_willShow_)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "popoverWillShow:", self));
    var ___r1;
}
,["void"])]);
}{
var the_class = objj_getClass("CPPopover")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPopover\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBehaviour:"), function $CPPopover__setBehaviour_(self, _cmd, aBehavior)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("setBehavior:"));
    self.isa.objj_msgSend1(self, "setBehavior:", aBehavior);
}
,["void","int"])]);
}var CPPopoverNeedsNewPopoverWindowKey = "CPPopoverNeedsNewPopoverWindowKey",
    CPPopoverAppearanceKey = "CPPopoverAppearanceKey",
    CPPopoverAnimatesKey = "CPPopoverAnimatesKey",
    CPPopoverContentViewControllerKey = "CPPopoverContentViewControllerKey",
    CPPopoverDelegateKey = "CPPopoverDelegateKey",
    CPPopoverBehaviorKey = "CPPopoverBehaviorKey";
{
var the_class = objj_getClass("CPPopover")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPopover\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPPopover__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopover").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._appearance = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPPopoverAppearanceKey));
        self._animates = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPPopoverAnimatesKey));
        self._contentViewController = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPPopoverContentViewControllerKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDelegate:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPPopoverDelegateKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBehavior:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPPopoverBehaviorKey))));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPPopover__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopover").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._appearance, CPPopoverAppearanceKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._animates, CPPopoverAnimatesKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._contentViewController, CPPopoverContentViewControllerKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._delegate, CPPopoverDelegateKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._behavior, CPPopoverBehaviorKey));
}
,["void","CPCoder"])]);
}