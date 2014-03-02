@STATIC;1.0;i;13;CPTextField.ji;8;CPView.ji;10;CPWindow.jt;6494;objj_executeFile("CPTextField.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow.j", YES);_CPToolTipWindowMask = 1 << 27;
var _CPToolTipHeight = 24.0,
    _CPToolTipFontSize = 11.0,
    _CPToolTipDelay = 1.0,
    _CPToolTipCurrentToolTip,
    _CPToolTipCurrentToolTipTimer;
{var the_class = objj_allocateClassPair(CPWindow, "_CPToolTip"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_content")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:styleMask:"), function $_CPToolTip__initWithString_styleMask_(self, _cmd, aString, aStyleMask)
{
    var toolTipFrame = CGRectMake(0.0, 0.0, 250.0, _CPToolTipHeight),
        layout = objj_msgSend(_CPToolTip, "computeCorrectSize:text:", toolTipFrame.size, aString),
        textFrameSize = layout[1];
    toolTipFrame.size = layout[0];
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolTip").super_class }, "initWithContentRect:styleMask:", toolTipFrame, aStyleMask))
    {
        self._constrainsToUsableScreen = NO;
        textFrameSize.height += 4;
        self._content = objj_msgSend(CPTextField, "labelWithTitle:", aString);
        objj_msgSend(self._content, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", _CPToolTipFontSize));
        objj_msgSend(self._content, "setLineBreakMode:", CPLineBreakByCharWrapping);
        objj_msgSend(self._content, "setAlignment:", CPJustifiedTextAlignment);
        objj_msgSend(self._content, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self._content, "setFrameOrigin:", CGPointMake(0.0, 0.0));
        objj_msgSend(self._content, "setFrameSize:", textFrameSize);
        objj_msgSend(self._content, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(self._content, "setTextColor:", objj_msgSend(objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "attributeWithName:forClass:", "color", _CPToolTipWindowView), "value"));
        objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:", self._content);
        objj_msgSend(self, "setLevel:", CPStatusWindowLevel);
        objj_msgSend(self, "setAlphaValue:", 0.9);
        objj_msgSend(self._windowView, "setNeedsDisplay:", YES);
    }
    return self;
}
,["id","CPString","unsigned"]), new objj_method(sel_getUid("showToolTip"), function $_CPToolTip__showToolTip(self, _cmd)
{
    var mousePosition = objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "globalLocation"),
        nativeRect = objj_msgSend(objj_msgSend(self, "platformWindow"), "nativeContentRect");
    mousePosition.y += 20;
    if (mousePosition.x < 0)
        mousePosition.x = 5;
    if (mousePosition.x + CGRectGetWidth(objj_msgSend(self, "frame")) > nativeRect.size.width)
        mousePosition.x = nativeRect.size.width - CGRectGetWidth(objj_msgSend(self, "frame")) - 5;
    if (mousePosition.y < 0)
        mousePosition.y = 5;
    if (mousePosition.y + CGRectGetHeight(objj_msgSend(self, "frame")) > nativeRect.size.height)
        mousePosition.y = mousePosition.y - CGRectGetHeight(objj_msgSend(self, "frame")) - 40;
    objj_msgSend(self, "setFrameOrigin:", mousePosition);
    objj_msgSend(self, "orderFront:", nil);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("invalidateCurrentToolTipIfNeeded"), function $_CPToolTip__invalidateCurrentToolTipIfNeeded(self, _cmd)
{
    if (_CPToolTipCurrentToolTipTimer)
    {
        objj_msgSend(_CPToolTipCurrentToolTipTimer, "invalidate");
        _CPToolTipCurrentToolTipTimer = nil;
    }
    if (_CPToolTipCurrentToolTip)
    {
        objj_msgSend(_CPToolTipCurrentToolTip, "close");
        _CPToolTipCurrentToolTip = nil;
    }
}
,["void"]), new objj_method(sel_getUid("scheduleToolTipForView:"), function $_CPToolTip__scheduleToolTipForView_(self, _cmd, aView)
{
    if (!objj_msgSend(aView, "toolTip") || !objj_msgSend(objj_msgSend(aView, "toolTip"), "length"))
        return;
    objj_msgSend(_CPToolTip, "invalidateCurrentToolTipIfNeeded");
    var callbackFunction = function()
    {
        objj_msgSend(_CPToolTip, "invalidateCurrentToolTipIfNeeded");
        _CPToolTipCurrentToolTip = objj_msgSend(_CPToolTip, "toolTipWithString:", objj_msgSend(aView, "toolTip"));
        objj_msgSend(_CPToolTipCurrentToolTip, "setPlatformWindow:", objj_msgSend(objj_msgSend(aView, "window"), "platformWindow"));
    };
    _CPToolTipCurrentToolTipTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", _CPToolTipDelay, callbackFunction, NO);
}
,["void","CPView"]), new objj_method(sel_getUid("toolTipWithString:"), function $_CPToolTip__toolTipWithString_(self, _cmd, aString)
{
    var tooltip = objj_msgSend(objj_msgSend(_CPToolTip, "alloc"), "initWithString:styleMask:", aString, _CPToolTipWindowMask);
    objj_msgSend(tooltip, "showToolTip");
    return tooltip;
}
,["_CPToolTip","CPString"]), new objj_method(sel_getUid("computeCorrectSize:text:"), function $_CPToolTip__computeCorrectSize_text_(self, _cmd, aToolTipSize, aText)
{
    var font = objj_msgSend(CPFont, "systemFontOfSize:", _CPToolTipFontSize),
        textFrameSizeSingleLine = objj_msgSend(aText, "sizeWithFont:", font),
        textFrameSize = objj_msgSend(aText, "sizeWithFont:inWidth:", font, aToolTipSize.width);
    if (textFrameSizeSingleLine.width < aToolTipSize.width)
    {
        var textField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero()),
            inset = objj_msgSend(textField, "currentValueForThemeAttribute:", "content-inset") || CGInsetMakeZero();
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
    textFrameSize = objj_msgSend(aText, "sizeWithFont:inWidth:", font, newWidth - 4);
    aToolTipSize.width = newWidth + 2;
    aToolTipSize.height = textFrameSize.height + 4;
    return [aToolTipSize, textFrameSize];
}
,["CGSize","CGSize","CPString"]), new objj_method(sel_getUid("_windowViewClassForStyleMask:"), function $_CPToolTip___windowViewClassForStyleMask_(self, _cmd, aStyleMask)
{
    return _CPToolTipWindowView;
}
,["Class","unsigned"])]);
}