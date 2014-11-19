@STATIC;1.0;i;13;CPTextField.ji;8;CPView.ji;10;CPWindow.jt;8509;objj_executeFile("CPTextField.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow.j", YES);_CPToolTipWindowMask = 1 << 27;
var _CPToolTipHeight = 24.0,
    _CPToolTipFontSize = 11.0,
    _CPToolTipDelay = 1.0,
    _CPToolTipCurrentToolTip,
    _CPToolTipCurrentToolTipTimer;
{var the_class = objj_allocateClassPair(CPWindow, "_CPToolTip"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolTipWindow"), new objj_ivar("_content")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:styleMask:toolTipWindow:"), function $_CPToolTip__initWithString_styleMask_toolTipWindow_(self, _cmd, aString, aStyleMask, aWindow)
{
    var toolTipFrame = CGRectMake(0.0, 0.0, 250.0, _CPToolTipHeight),
        layout = _CPToolTip.isa.objj_msgSend2(_CPToolTip, "computeCorrectSize:text:", toolTipFrame.size, aString),
        textFrameSize = layout[1];
    toolTipFrame.size = layout[0];
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolTip").super_class }, "initWithContentRect:styleMask:", toolTipFrame, aStyleMask))
    {
        self._toolTipWindow = aWindow;
        self._constrainsToUsableScreen = NO;
        textFrameSize.height += 4;
        self._content = CPTextField.isa.objj_msgSend1(CPTextField, "labelWithTitle:", aString);
        ((___r1 = self._content), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", _CPToolTipFontSize)));
        ((___r1 = self._content), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", CPLineBreakByCharWrapping));
        ((___r1 = self._content), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        ((___r1 = self._content), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(0.0, 0.0)));
        ((___r1 = self._content), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", textFrameSize));
        ((___r1 = self._content), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(0.0, 1.0)));
        ((___r1 = self._content), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", ((___r2 = ((___r3 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r3 == null ? null : ___r3.isa.objj_msgSend2(___r3, "attributeWithName:forClass:", "color", _CPToolTipWindowView))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "value"))));
        ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._content));
        (self == null ? null : self.isa.objj_msgSend1(self, "setLevel:", CPStatusWindowLevel));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAlphaValue:", 0.9));
        ((___r1 = self._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    }
    return self;
    var ___r1, ___r2, ___r3;
}
,["id","CPString","unsigned","CPWindow"]), new objj_method(sel_getUid("showToolTip"), function $_CPToolTip__showToolTip(self, _cmd)
{
    var mousePosition = ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "globalLocation")),
        nativeRect = ((___r1 = ((___r2 = self._toolTipWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "nativeContentRect"));
    mousePosition.y += 20;
    if (mousePosition.x < 0)
        mousePosition.x = 5;
    if (mousePosition.x + CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")) > nativeRect.size.width)
        mousePosition.x = nativeRect.size.width - CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")) - 5;
    if (mousePosition.y < 0)
        mousePosition.y = 5;
    if (mousePosition.y + CGRectGetHeight(self.isa.objj_msgSend0(self, "frame")) > nativeRect.size.height)
        mousePosition.y = mousePosition.y - CGRectGetHeight(self.isa.objj_msgSend0(self, "frame")) - 40;
    self.isa.objj_msgSend1(self, "setFrameOrigin:", mousePosition);
    ((___r1 = self._toolTipWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "addChildWindow:ordered:", self, CPWindowAbove));
    var ___r1, ___r2;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("invalidateCurrentToolTipIfNeeded"), function $_CPToolTip__invalidateCurrentToolTipIfNeeded(self, _cmd)
{
    if (_CPToolTipCurrentToolTipTimer)
    {
        (_CPToolTipCurrentToolTipTimer == null ? null : _CPToolTipCurrentToolTipTimer.isa.objj_msgSend0(_CPToolTipCurrentToolTipTimer, "invalidate"));
        _CPToolTipCurrentToolTipTimer = nil;
    }
    if (_CPToolTipCurrentToolTip)
    {
        (_CPToolTipCurrentToolTip == null ? null : _CPToolTipCurrentToolTip.isa.objj_msgSend0(_CPToolTipCurrentToolTip, "close"));
        _CPToolTipCurrentToolTip = nil;
    }
}
,["void"]), new objj_method(sel_getUid("scheduleToolTipForView:"), function $_CPToolTip__scheduleToolTipForView_(self, _cmd, aView)
{
    if (!(aView == null ? null : aView.isa.objj_msgSend0(aView, "toolTip")) || !((___r1 = (aView == null ? null : aView.isa.objj_msgSend0(aView, "toolTip"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length")))
        return;
    _CPToolTip.isa.objj_msgSend0(_CPToolTip, "invalidateCurrentToolTipIfNeeded");
    var callbackFunction = function()
    {
        _CPToolTip.isa.objj_msgSend0(_CPToolTip, "invalidateCurrentToolTipIfNeeded");
        _CPToolTipCurrentToolTip = _CPToolTip.isa.objj_msgSend2(_CPToolTip, "toolTipWithString:toolTipWindow:", (aView == null ? null : aView.isa.objj_msgSend0(aView, "toolTip")), (aView == null ? null : aView.isa.objj_msgSend0(aView, "window")));
    };
    _CPToolTipCurrentToolTipTimer = CPTimer.isa.objj_msgSend3(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", _CPToolTipDelay, callbackFunction, NO);
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("toolTipWithString:toolTipWindow:"), function $_CPToolTip__toolTipWithString_toolTipWindow_(self, _cmd, aString, aWindow)
{
    if (!aWindow)
        return nil;
    var tooltip = ((___r1 = _CPToolTip.isa.objj_msgSend0(_CPToolTip, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithString:styleMask:toolTipWindow:", aString, _CPToolTipWindowMask, aWindow));
    (tooltip == null ? null : tooltip.isa.objj_msgSend0(tooltip, "showToolTip"));
    return tooltip;
    var ___r1;
}
,["_CPToolTip","CPString","CPWindow"]), new objj_method(sel_getUid("computeCorrectSize:text:"), function $_CPToolTip__computeCorrectSize_text_(self, _cmd, aToolTipSize, aText)
{
    var font = CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", _CPToolTipFontSize),
        textFrameSizeSingleLine = (aText == null ? null : aText.isa.objj_msgSend1(aText, "sizeWithFont:", font)),
        textFrameSize = (aText == null ? null : aText.isa.objj_msgSend2(aText, "sizeWithFont:inWidth:", font, aToolTipSize.width));
    if (textFrameSizeSingleLine.width < aToolTipSize.width)
    {
        var textField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero())),
            inset = (textField == null ? null : textField.isa.objj_msgSend1(textField, "currentValueForThemeAttribute:", "content-inset")) || CGInsetMakeZero();
        textFrameSize = textFrameSizeSingleLine;
        textFrameSize.width += inset.left + inset.right;
        aToolTipSize.width = textFrameSize.width;
    }
    if (textFrameSize.height < 100)
    {
        aToolTipSize.height = textFrameSize.height + 4;
        return [aToolTipSize, textFrameSize];
    }
    var newWidth = aToolTipSize.width + parseInt(textFrameSize.height - 100) / _CPToolTipHeight * _CPToolTipHeight;
    textFrameSize = (aText == null ? null : aText.isa.objj_msgSend2(aText, "sizeWithFont:inWidth:", font, newWidth - 4));
    aToolTipSize.width = newWidth + 2;
    aToolTipSize.height = textFrameSize.height + 4;
    return [aToolTipSize, textFrameSize];
    var ___r1;
}
,["CGSize","CGSize","CPString"]), new objj_method(sel_getUid("_windowViewClassForStyleMask:"), function $_CPToolTip___windowViewClassForStyleMask_(self, _cmd, aStyleMask)
{
    return _CPToolTipWindowView;
}
,["Class","unsigned"])]);
}