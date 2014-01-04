@STATIC;1.0;I;21;Foundation/CPObject.ji;10;CPButton.ji;9;CPColor.ji;9;CPImage.ji;13;CPImageView.ji;13;CPResponder.ji;8;CPView.ji;19;_CPAttachedWindow.jt;12326;

objj_executeFile("Foundation/CPObject.j", NO);

objj_executeFile("CPButton.j", YES);
objj_executeFile("CPColor.j", YES);
objj_executeFile("CPImage.j", YES);
objj_executeFile("CPImageView.j", YES);
objj_executeFile("CPResponder.j", YES);
objj_executeFile("CPView.j", YES);
objj_executeFile("_CPAttachedWindow.j", YES);


CPPopoverBehaviorApplicationDefined = 0;
CPPopoverBehaviorTransient = 1;
CPPopoverBehaviorSemitransient = 2;

var CPPopoverDelegate_popover_willShow_ = 1 << 0,
    CPPopoverDelegate_popover_didShow_ = 1 << 1,
    CPPopoverDelegate_popover_shouldClose_ = 1 << 2,
    CPPopoverDelegate_popover_willClose_ = 1 << 3,
    CPPopoverDelegate_popover_didClose_ = 1 << 4;
{var the_class = objj_allocateClassPair(CPResponder, "CPPopover"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentViewController"), new objj_ivar("_delegate"), new objj_ivar("_animates"), new objj_ivar("_appearance"), new objj_ivar("_behavior"), new objj_ivar("_attachedWindow"), new objj_ivar("_implementedDelegateMethods")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentViewController"), function $CPPopover__contentViewController(self, _cmd)
{ with(self)
{
return _contentViewController;
}
},["id"]),
new objj_method(sel_getUid("setContentViewController:"), function $CPPopover__setContentViewController_(self, _cmd, newValue)
{ with(self)
{
_contentViewController = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("delegate"), function $CPPopover__delegate(self, _cmd)
{ with(self)
{
return _delegate;
}
},["id"]),
new objj_method(sel_getUid("_setDelegate:"), function $CPPopover___setDelegate_(self, _cmd, newValue)
{ with(self)
{
_delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("animates"), function $CPPopover__animates(self, _cmd)
{ with(self)
{
return _animates;
}
},["id"]),
new objj_method(sel_getUid("setAnimates:"), function $CPPopover__setAnimates_(self, _cmd, newValue)
{ with(self)
{
_animates = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("appearance"), function $CPPopover__appearance(self, _cmd)
{ with(self)
{
return _appearance;
}
},["id"]),
new objj_method(sel_getUid("setAppearance:"), function $CPPopover__setAppearance_(self, _cmd, newValue)
{ with(self)
{
_appearance = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("behavior"), function $CPPopover__behavior(self, _cmd)
{ with(self)
{
return _behavior;
}
},["id"]),
new objj_method(sel_getUid("_setBehavior:"), function $CPPopover___setBehavior_(self, _cmd, newValue)
{ with(self)
{
_behavior = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $CPPopover__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopover").super_class }, "init"))
    {
        _animates = YES;
        _appearance = CPPopoverAppearanceMinimal;
        _behavior = CPPopoverBehaviorApplicationDefined;
    }

    return self;
}
},["CPPopover"]), new objj_method(sel_getUid("positioningRect"), function $CPPopover__positioningRect(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(_attachedWindow, "isVisible"))
        return CGRectMakeZero();
    return objj_msgSend(_attachedWindow, "frame");
}
},["CGRect"]), new objj_method(sel_getUid("setPositioningRect:"), function $CPPopover__setPositioningRect_(self, _cmd, aRect)
{ with(self)
{
    if (!objj_msgSend(_attachedWindow, "isVisible"))
        return;
    objj_msgSend(_attachedWindow, "setFrame:", aRect);
}
},["void","CGRect"]), new objj_method(sel_getUid("contentSize"), function $CPPopover__contentSize(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(_attachedWindow, "isVisible"))
        return CGRectMakeZero();
    return objj_msgSend(objj_msgSend(_contentViewController, "view"), "frameSize");
}
},["CGSize"]), new objj_method(sel_getUid("setContentSize:"), function $CPPopover__setContentSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(objj_msgSend(_contentViewController, "view"), "setFrameSize:", aSize);
}
},["void","CPSize"]), new objj_method(sel_getUid("isShown"), function $CPPopover__isShown(self, _cmd)
{ with(self)
{
    return objj_msgSend(_attachedWindow, "isVisible");
}
},["BOOL"]), new objj_method(sel_getUid("setBehavior:"), function $CPPopover__setBehavior_(self, _cmd, aBehavior)
{ with(self)
{
    if (_behavior == aBehavior)
        return;

    _behavior = aBehavior;
    objj_msgSend(_attachedWindow, "setStyleMask:", objj_msgSend(self, "styleMaskForBehavior"));
}
},["void","int"]), new objj_method(sel_getUid("setDelegate:"), function $CPPopover__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate === aDelegate)
        return;

    _delegate = aDelegate;
    _implementedDelegateMethods = 0;

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("popoverWillShow:")))
        _implementedDelegateMethods |= CPPopoverDelegate_popover_willShow_;

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("popoverDidShow:")))
        _implementedDelegateMethods |= CPPopoverDelegate_popover_didShow_;

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("popoverShouldClose:")))
        _implementedDelegateMethods |= CPPopoverDelegate_popover_shouldClose_;

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("popoverWillClose:")))
        _implementedDelegateMethods |= CPPopoverDelegate_popover_willClose_;

    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("popoverDidClose:")))
        _implementedDelegateMethods |= CPPopoverDelegate_popover_didClose_;
}
},["void","id"]), new objj_method(sel_getUid("showRelativeToRect:ofView:preferredEdge:"), function $CPPopover__showRelativeToRect_ofView_preferredEdge_(self, _cmd, positioningRect, positioningView, preferredEdge)
{ with(self)
{
    if (!positioningView)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "positionView must not be nil");

    if (!_contentViewController)
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "contentViewController must not be nil");


    if (objj_msgSend(_attachedWindow, "isClosing"))
        return;

    if (_implementedDelegateMethods & CPPopoverDelegate_popover_willShow_)
        objj_msgSend(_delegate, "popoverWillShow:", self);

    if (!_attachedWindow)
    {
        _attachedWindow = objj_msgSend(objj_msgSend(_CPAttachedWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), objj_msgSend(self, "styleMaskForBehavior"));

        var parentWindow = objj_msgSend(positioningView, "window");

        if (!objj_msgSend(parentWindow, "isKindOfClass:", _CPAttachedWindow))
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("parentWindowWillClose:"), CPWindowWillCloseNotification, parentWindow);
    }

    objj_msgSend(_attachedWindow, "setAppearance:", _appearance);
    objj_msgSend(_attachedWindow, "setAnimates:", _animates);
    objj_msgSend(_attachedWindow, "setDelegate:", self);
    objj_msgSend(_attachedWindow, "setMovableByWindowBackground:", NO);
    objj_msgSend(_attachedWindow, "setFrame:", objj_msgSend(_attachedWindow, "frameRectForContentRect:", objj_msgSend(objj_msgSend(_contentViewController, "view"), "frame")));
    objj_msgSend(_attachedWindow, "setContentView:", objj_msgSend(_contentViewController, "view"));
    objj_msgSend(_attachedWindow, "positionRelativeToRect:ofView:preferredEdge:", positioningRect, positioningView, preferredEdge);

    if (_implementedDelegateMethods & CPPopoverDelegate_popover_didShow_)
        objj_msgSend(_delegate, "popoverDidShow:", self);
}
},["void","CGRect","CPView","CPRectEdge"]), new objj_method(sel_getUid("styleMaskForBehavior"), function $CPPopover__styleMaskForBehavior(self, _cmd)
{ with(self)
{
    return (_behavior == CPPopoverBehaviorTransient) ? CPClosableOnBlurWindowMask : 0;
}
},["unsigned"]), new objj_method(sel_getUid("close"), function $CPPopover__close(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_close");
}
},["void"]), new objj_method(sel_getUid("_close"), function $CPPopover___close(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_attachedWindow, "isClosing") || !objj_msgSend(self, "isShown"))
        return;

    if (_implementedDelegateMethods & CPPopoverDelegate_popover_willClose_)
        objj_msgSend(_delegate, "popoverWillClose:", self);

    objj_msgSend(_attachedWindow, "close");



}
},["void"]), new objj_method(sel_getUid("performClose:"), function $CPPopover__performClose_(self, _cmd, sender)
{ with(self)
{
    if (objj_msgSend(_attachedWindow, "isClosing"))
        return;

    if (_implementedDelegateMethods & CPPopoverDelegate_popover_shouldClose_)
        if (!objj_msgSend(_delegate, "popoverShouldClose:", self))
            return;

    objj_msgSend(self, "_close");
}
},["IBAction","id"]), new objj_method(sel_getUid("attachedWindowShouldClose:"), function $CPPopover__attachedWindowShouldClose_(self, _cmd, anAttachedWindow)
{ with(self)
{
    objj_msgSend(self, "performClose:", self);




    return NO;
}
},["BOOL","_CPAttachedWindow"]), new objj_method(sel_getUid("attachedWindowDidClose:"), function $CPPopover__attachedWindowDidClose_(self, _cmd, anAttachedWindow)
{ with(self)
{
    if (_implementedDelegateMethods & CPPopoverDelegate_popover_didClose_)
        objj_msgSend(_delegate, "popoverDidClose:", self);
}
},["void","_CPAttachedWindow"]), new objj_method(sel_getUid("parentWindowWillClose:"), function $CPPopover__parentWindowWillClose_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(_attachedWindow, "orderOut:", nil);
    objj_msgSend(self, "performClose:", nil);
}
},["void","CPNotification"])]);
}

{
var the_class = objj_getClass("CPPopover")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPopover\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBehaviour:"), function $CPPopover__setBehaviour_(self, _cmd, aBehavior)
{ with(self)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("setBehavior:"));

    objj_msgSend(self, "setBehavior:", aBehavior);
}
},["void","int"])]);
}

var CPPopoverNeedsNewAttachedWindowKey = "CPPopoverNeedsNewAttachedWindowKey",
    CPPopoverAppearanceKey = "CPPopoverAppearanceKey",
    CPPopoverAnimatesKey = "CPPopoverAnimatesKey",
    CPPopoverContentViewControllerKey = "CPPopoverContentViewControllerKey",
    CPPopoverDelegateKey = "CPPopoverDelegateKey",
    CPPopoverBehaviorKey = "CPPopoverBehaviorKey";

{
var the_class = objj_getClass("CPPopover")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPopover\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPPopover__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopover").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        _appearance = objj_msgSend(aCoder, "decodeIntForKey:", CPPopoverAppearanceKey);
        _animates = objj_msgSend(aCoder, "decodeBoolForKey:", CPPopoverAnimatesKey);
        _contentViewController = objj_msgSend(aCoder, "decodeObjectForKey:", CPPopoverContentViewControllerKey);
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPopoverDelegateKey));
        objj_msgSend(self, "setBehavior:", objj_msgSend(aCoder, "decodeIntForKey:", CPPopoverBehaviorKey));
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPPopover__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopover").super_class }, "encodeWithCoder:", aCoder);

    objj_msgSend(aCoder, "encodeInt:forKey:", _appearance, CPPopoverAppearanceKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _animates, CPPopoverAnimatesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _contentViewController, CPPopoverContentViewControllerKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _delegate, CPPopoverDelegateKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _behavior, CPPopoverBehaviorKey);
}
},["void","CPCoder"])]);
}

