@STATIC;1.0;I;21;Foundation/CPObject.ji;10;CPButton.ji;9;CPColor.ji;9;CPImage.ji;13;CPImageView.ji;13;CPResponder.ji;8;CPView.ji;18;_CPPopoverWindow.jt;12718;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CPButton.j", YES);objj_executeFile("CPColor.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("_CPPopoverWindow.j", YES);{var the_protocol = objj_allocateProtocol("CPPopoverDelegate");
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentViewController"), new objj_ivar("_delegate"), new objj_ivar("_animates"), new objj_ivar("_appearance"), new objj_ivar("_behavior"), new objj_ivar("_popoverWindow"), new objj_ivar("_implementedDelegateMethods")]);objj_registerClassPair(the_class);
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
    if (!objj_msgSend(self._popoverWindow, "isVisible"))
        return CGRectMakeZero();
    return objj_msgSend(self._popoverWindow, "frame");
}
,["CGRect"]), new objj_method(sel_getUid("setPositioningRect:"), function $CPPopover__setPositioningRect_(self, _cmd, aRect)
{
    if (!objj_msgSend(self._popoverWindow, "isVisible"))
        return;
    objj_msgSend(self._popoverWindow, "setFrame:", aRect);
}
,["void","CGRect"]), new objj_method(sel_getUid("contentSize"), function $CPPopover__contentSize(self, _cmd)
{
    if (!objj_msgSend(self._popoverWindow, "isVisible"))
        return CGRectMakeZero();
    return objj_msgSend(objj_msgSend(self._contentViewController, "view"), "frameSize");
}
,["CGSize"]), new objj_method(sel_getUid("setContentSize:"), function $CPPopover__setContentSize_(self, _cmd, aSize)
{
    objj_msgSend(objj_msgSend(self._contentViewController, "view"), "setFrameSize:", aSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("isShown"), function $CPPopover__isShown(self, _cmd)
{
    return objj_msgSend(self._popoverWindow, "isVisible");
}
,["BOOL"]), new objj_method(sel_getUid("setAnimates:"), function $CPPopover__setAnimates_(self, _cmd, shouldAnimate)
{
    if (self._animates == shouldAnimate)
        return;
    self._animates = shouldAnimate;
    objj_msgSend(self._popoverWindow, "setAnimates:", self._animates);
}
,["void","BOOL"]), new objj_method(sel_getUid("setBehavior:"), function $CPPopover__setBehavior_(self, _cmd, aBehavior)
{
    if (self._behavior == aBehavior)
        return;
    self._behavior = aBehavior;
    objj_msgSend(self._popoverWindow, "setStyleMask:", objj_msgSend(self, "styleMaskForBehavior"));
}
,["void","int"]), new objj_method(sel_getUid("setDelegate:"), function $CPPopover__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("popoverWillShow:")))
        self._implementedDelegateMethods |= CPPopoverDelegate_popover_willShow_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("popoverDidShow:")))
        self._implementedDelegateMethods |= CPPopoverDelegate_popover_didShow_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("popoverShouldClose:")))
        self._implementedDelegateMethods |= CPPopoverDelegate_popover_shouldClose_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("popoverWillClose:")))
        self._implementedDelegateMethods |= CPPopoverDelegate_popover_willClose_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("popoverDidClose:")))
        self._implementedDelegateMethods |= CPPopoverDelegate_popover_didClose_;
}
,["void","id"]), new objj_method(sel_getUid("showRelativeToRect:ofView:preferredEdge:"), function $CPPopover__showRelativeToRect_ofView_preferredEdge_(self, _cmd, positioningRect, positioningView, preferredEdge)
{
    if (!positioningView)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "positionView must not be nil");
    if (!self._contentViewController)
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "contentViewController must not be nil");
    if (objj_msgSend(self._popoverWindow, "isClosing"))
        return;
    if (self._implementedDelegateMethods & CPPopoverDelegate_popover_willShow_)
        objj_msgSend(self._delegate, "popoverWillShow:", self);
    if (!self._popoverWindow)
    {
        self._popoverWindow = objj_msgSend(objj_msgSend(_CPPopoverWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), objj_msgSend(self, "styleMaskForBehavior"));
    }
    objj_msgSend(self._popoverWindow, "setPlatformWindow:", objj_msgSend(objj_msgSend(positioningView, "window"), "platformWindow"));
    objj_msgSend(self._popoverWindow, "setAppearance:", self._appearance);
    objj_msgSend(self._popoverWindow, "setAnimates:", self._animates);
    objj_msgSend(self._popoverWindow, "setDelegate:", self);
    objj_msgSend(self._popoverWindow, "setMovableByWindowBackground:", NO);
    objj_msgSend(self._popoverWindow, "setFrame:", objj_msgSend(self._popoverWindow, "frameRectForContentRect:", objj_msgSend(objj_msgSend(self._contentViewController, "view"), "frame")));
    objj_msgSend(self._popoverWindow, "setContentView:", objj_msgSend(self._contentViewController, "view"));
    objj_msgSend(self._popoverWindow, "positionRelativeToRect:ofView:preferredEdge:", positioningRect, positioningView, preferredEdge);
    if (!self._animates && self._implementedDelegateMethods & CPPopoverDelegate_popover_didShow_)
        objj_msgSend(self._delegate, "popoverDidShow:", self);
}
,["void","CGRect","CPView","CPRectEdge"]), new objj_method(sel_getUid("styleMaskForBehavior"), function $CPPopover__styleMaskForBehavior(self, _cmd)
{
    return self._behavior == CPPopoverBehaviorTransient ? CPClosableOnBlurWindowMask : 0;
}
,["unsigned"]), new objj_method(sel_getUid("close"), function $CPPopover__close(self, _cmd)
{
    objj_msgSend(self, "_close");
}
,["void"]), new objj_method(sel_getUid("_close"), function $CPPopover___close(self, _cmd)
{
    if (objj_msgSend(self._popoverWindow, "isClosing") || !objj_msgSend(self, "isShown"))
        return;
    if (self._implementedDelegateMethods & CPPopoverDelegate_popover_willClose_)
        objj_msgSend(self._delegate, "popoverWillClose:", self);
    objj_msgSend(self._popoverWindow, "close");
}
,["void"]), new objj_method(sel_getUid("performClose:"), function $CPPopover__performClose_(self, _cmd, sender)
{
    if (objj_msgSend(self._popoverWindow, "isClosing"))
        return;
    if (self._implementedDelegateMethods & CPPopoverDelegate_popover_shouldClose_)
        if (!objj_msgSend(self._delegate, "popoverShouldClose:", self))
            return;
    objj_msgSend(self, "_close");
}
,["void","id"]), new objj_method(sel_getUid("popoverWindowShouldClose:"), function $CPPopover__popoverWindowShouldClose_(self, _cmd, aPopoverWindow)
{
    objj_msgSend(self, "performClose:", self);
    return NO;
}
,["BOOL","_CPPopoverWindow"]), new objj_method(sel_getUid("popoverWindowDidClose:"), function $CPPopover__popoverWindowDidClose_(self, _cmd, aPopoverWindow)
{
    if (self._implementedDelegateMethods & CPPopoverDelegate_popover_didClose_)
        objj_msgSend(self._delegate, "popoverDidClose:", self);
}
,["void","_CPPopoverWindow"]), new objj_method(sel_getUid("popoverWindowDidShow:"), function $CPPopover__popoverWindowDidShow_(self, _cmd, aPopoverWindow)
{
    if (self._implementedDelegateMethods & CPPopoverDelegate_popover_didShow_)
        objj_msgSend(self._delegate, "popoverDidShow:", self);
}
,["void","_CPPopoverWindow"])]);
}{
var the_class = objj_getClass("CPPopover")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPopover\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBehaviour:"), function $CPPopover__setBehaviour_(self, _cmd, aBehavior)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("setBehavior:"));
    objj_msgSend(self, "setBehavior:", aBehavior);
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
        self._appearance = objj_msgSend(aCoder, "decodeIntForKey:", CPPopoverAppearanceKey);
        self._animates = objj_msgSend(aCoder, "decodeBoolForKey:", CPPopoverAnimatesKey);
        self._contentViewController = objj_msgSend(aCoder, "decodeObjectForKey:", CPPopoverContentViewControllerKey);
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPopoverDelegateKey));
        objj_msgSend(self, "setBehavior:", objj_msgSend(aCoder, "decodeIntForKey:", CPPopoverBehaviorKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPPopover__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopover").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._appearance, CPPopoverAppearanceKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._animates, CPPopoverAnimatesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._contentViewController, CPPopoverContentViewControllerKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._delegate, CPPopoverDelegateKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._behavior, CPPopoverBehaviorKey);
}
,["void","CPCoder"])]);
}