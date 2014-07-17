@STATIC;1.0;i;8;CPView.ji;20;CPWindow_Constants.jt;16044;objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow_Constants.j", YES);{var the_class = objj_allocateClassPair(CPView, "CPButtonBar"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_hasResizeControl"), new objj_ivar("_resizeControlIsLeftAligned"), new objj_ivar("_buttons")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPButtonBar__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButtonBar").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._buttons = [];
        (self == null ? null : self.isa.objj_msgSend0(self, "setNeedsLayout"));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("awakeFromCib"), function $CPButtonBar__awakeFromCib(self, _cmd)
{
    var view = self.isa.objj_msgSend0(self, "superview"),
        subview = self;
    while (view)
    {
        if ((view == null ? null : view.isa.objj_msgSend1(view, "isKindOfClass:", (CPSplitView == null ? null : CPSplitView.isa.objj_msgSend0(CPSplitView, "class")))))
        {
            var viewIndex = ((___r1 = (view == null ? null : view.isa.objj_msgSend0(view, "subviews"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", subview));
            (view == null ? null : view.isa.objj_msgSend2(view, "setButtonBar:forDividerAtIndex:", self, viewIndex));
            break;
        }
        subview = view;
        view = (view == null ? null : view.isa.objj_msgSend0(view, "superview"));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setButtons:"), function $CPButtonBar__setButtons_(self, _cmd, buttons)
{
    self._buttons = CPArray.isa.objj_msgSend1(CPArray, "arrayWithArray:", buttons);
    for (var i = 0, count = ((___r1 = self._buttons), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")); i < count; i++)
        ((___r1 = self._buttons[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBordered:", YES));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("buttons"), function $CPButtonBar__buttons(self, _cmd)
{
    return CPArray.isa.objj_msgSend1(CPArray, "arrayWithArray:", self._buttons);
}
,["CPArray"]), new objj_method(sel_getUid("setHasResizeControl:"), function $CPButtonBar__setHasResizeControl_(self, _cmd, shouldHaveResizeControl)
{
    if (self._hasResizeControl === shouldHaveResizeControl)
        return;
    self._hasResizeControl = !!shouldHaveResizeControl;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("hasResizeControl"), function $CPButtonBar__hasResizeControl(self, _cmd)
{
    return self._hasResizeControl;
}
,["BOOL"]), new objj_method(sel_getUid("setResizeControlIsLeftAligned:"), function $CPButtonBar__setResizeControlIsLeftAligned_(self, _cmd, shouldBeLeftAligned)
{
    if (self._resizeControlIsLeftAligned === shouldBeLeftAligned)
        return;
    self._resizeControlIsLeftAligned = !!shouldBeLeftAligned;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("resizeControlIsLeftAligned"), function $CPButtonBar__resizeControlIsLeftAligned(self, _cmd)
{
    return self._resizeControlIsLeftAligned;
}
,["BOOL"]), new objj_method(sel_getUid("resizeControlFrame"), function $CPButtonBar__resizeControlFrame(self, _cmd)
{
    var inset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "resize-control-inset"),
        size = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "resize-control-size"),
        currentSize = self.isa.objj_msgSend0(self, "bounds"),
        leftOrigin = self._resizeControlIsLeftAligned ? 0 : currentSize.size.width - size.width - inset.right - inset.left;
    return CGRectMake(leftOrigin, 0, size.width + inset.left + inset.right, size.height + inset.top + inset.bottom);
}
,["CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPButtonBar__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "resize-control-view")
    {
        var inset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "resize-control-inset"),
            size = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "resize-control-size"),
            currentSize = self.isa.objj_msgSend0(self, "bounds");
        if (self._resizeControlIsLeftAligned)
            return CGRectMake(inset.left, inset.top, size.width, size.height);
        else
            return CGRectMake(currentSize.size.width - size.width - inset.right, inset.top, size.width, size.height);
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButtonBar").super_class }, "rectForEphemeralSubviewNamed:", aName);
}
,["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPButtonBar__createEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "resize-control-view")
        return ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButtonBar").super_class }, "createEphemeralSubviewNamed:", aName);
    var ___r1;
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPButtonBar__layoutSubviews(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bezel-color"));
    var normalColor = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "button-bezel-color", CPThemeStateNormal),
        highlightedColor = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "button-bezel-color", CPThemeStateHighlighted),
        disabledColor = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "button-bezel-color", CPThemeStateDisabled),
        textColor = self.isa.objj_msgSend2(self, "valueForThemeAttribute:inState:", "button-text-color", CPThemeStateNormal);
    var buttonsNotHidden = CPArray.isa.objj_msgSend1(CPArray, "arrayWithArray:", self._buttons),
        count = (buttonsNotHidden == null ? null : buttonsNotHidden.isa.objj_msgSend0(buttonsNotHidden, "count"));
    while (count--)
        if (((___r1 = buttonsNotHidden[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
            (buttonsNotHidden == null ? null : buttonsNotHidden.isa.objj_msgSend1(buttonsNotHidden, "removeObject:", buttonsNotHidden[count]));
    var currentButtonOffset = self._resizeControlIsLeftAligned ? CGRectGetMaxX(self.isa.objj_msgSend0(self, "bounds")) + 1 : -1,
        bounds = self.isa.objj_msgSend0(self, "bounds"),
        height = CGRectGetHeight(bounds) - 1,
        frameWidth = CGRectGetWidth(bounds),
        resizeRect = self._hasResizeControl ? self.isa.objj_msgSend1(self, "rectForEphemeralSubviewNamed:", "resize-control-view") : CGRectMakeZero(),
        resizeWidth = CGRectGetWidth(resizeRect),
        availableWidth = frameWidth - resizeWidth - 1;
    for (var i = 0, count = (buttonsNotHidden == null ? null : buttonsNotHidden.isa.objj_msgSend0(buttonsNotHidden, "count")); i < count; i++)
    {
        var button = buttonsNotHidden[i],
            width = CGRectGetWidth((button == null ? null : button.isa.objj_msgSend0(button, "frame")));
        if (availableWidth > width)
            availableWidth -= width;
        else
            break;
        if (self._resizeControlIsLeftAligned)
        {
            (button == null ? null : button.isa.objj_msgSend1(button, "setFrame:", CGRectMake(currentButtonOffset - width, 1, width, height)));
            currentButtonOffset -= width - 1;
        }
        else
        {
            (button == null ? null : button.isa.objj_msgSend1(button, "setFrame:", CGRectMake(currentButtonOffset, 1, width, height)));
            currentButtonOffset += width - 1;
        }
        (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", normalColor, "bezel-color", [CPThemeStateNormal, CPThemeStateBordered]));
        (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", highlightedColor, "bezel-color", [CPThemeStateHighlighted, CPThemeStateBordered]));
        (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", disabledColor, "bezel-color", [CPThemeStateDisabled, CPThemeStateBordered]));
        (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", textColor, "text-color", CPThemeStateBordered));
        (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", normalColor, "bezel-color", [CPThemeStateNormal, CPThemeStateBordered, CPPopUpButtonStatePullsDown]));
        (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", highlightedColor, "bezel-color", [CPThemeStateHighlighted, CPThemeStateBordered, CPPopUpButtonStatePullsDown]));
        (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", disabledColor, "bezel-color", [CPThemeStateDisabled, CPThemeStateBordered, CPPopUpButtonStatePullsDown]));
        self.isa.objj_msgSend1(self, "addSubview:", button);
    }
    if (self._hasResizeControl)
    {
        var resizeControlView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "resize-control-view", CPWindowAbove, nil);
        (resizeControlView == null ? null : resizeControlView.isa.objj_msgSend1(resizeControlView, "setAutoresizingMask:", self._resizeControlIsLeftAligned ? CPViewMaxXMargin : CPViewMinXMargin));
        (resizeControlView == null ? null : resizeControlView.isa.objj_msgSend1(resizeControlView, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "resize-control-color")));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setFrameSize:"), function $CPButtonBar__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButtonBar").super_class }, "setFrameSize:", aSize);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CGSize"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("plusButton"), function $CPButtonBar__plusButton(self, _cmd)
{
    var button = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 35, 25))),
        image = ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "button-image-plus", CPButtonBar.isa.objj_msgSend0(CPButtonBar, "class")));
    (button == null ? null : button.isa.objj_msgSend1(button, "setBordered:", NO));
    (button == null ? null : button.isa.objj_msgSend1(button, "setImage:", image));
    (button == null ? null : button.isa.objj_msgSend1(button, "setImagePosition:", CPImageOnly));
    return button;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("minusButton"), function $CPButtonBar__minusButton(self, _cmd)
{
    var button = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 35, 25))),
        image = ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "button-image-minus", CPButtonBar.isa.objj_msgSend0(CPButtonBar, "class")));
    (button == null ? null : button.isa.objj_msgSend1(button, "setBordered:", NO));
    (button == null ? null : button.isa.objj_msgSend1(button, "setImage:", image));
    (button == null ? null : button.isa.objj_msgSend1(button, "setImagePosition:", CPImageOnly));
    return button;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("actionPopupButton"), function $CPButtonBar__actionPopupButton(self, _cmd)
{
    var button = ((___r1 = CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 35, 25))),
        image = ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "button-image-action", CPButtonBar.isa.objj_msgSend0(CPButtonBar, "class")));
    (button == null ? null : button.isa.objj_msgSend1(button, "addItemWithTitle:", nil));
    ((___r1 = (button == null ? null : button.isa.objj_msgSend0(button, "lastItem"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", image));
    (button == null ? null : button.isa.objj_msgSend1(button, "setImagePosition:", CPImageOnly));
    (button == null ? null : button.isa.objj_msgSend2(button, "setValue:forThemeAttribute:", CGInsetMake(0, 0, 0, 0), "content-inset"));
    (button == null ? null : button.isa.objj_msgSend1(button, "setPullsDown:", YES));
    return button;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPButtonBar__defaultThemeClass(self, _cmd)
{
    return "button-bar";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPButtonBar__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CGInsetMake(0.0, 0.0, 0.0, 0.0), "resize-control-inset", CGSizeMakeZero(), "resize-control-size", CPNull.isa.objj_msgSend0(CPNull, "null"), "resize-control-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "bezel-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "button-bezel-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "button-text-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "button-image-plus", CPNull.isa.objj_msgSend0(CPNull, "null"), "button-image-minus", CPNull.isa.objj_msgSend0(CPNull, "null"), "button-image-action");
}
,["CPDictionary"])]);
}var CPButtonBarHasResizeControlKey = "CPButtonBarHasResizeControlKey",
    CPButtonBarResizeControlIsLeftAlignedKey = "CPButtonBarResizeControlIsLeftAlignedKey",
    CPButtonBarButtonsKey = "CPButtonBarButtonsKey";
{
var the_class = objj_getClass("CPButtonBar")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPButtonBar\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("encodeWithCoder:"), function $CPButtonBar__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButtonBar").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._hasResizeControl, CPButtonBarHasResizeControlKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._resizeControlIsLeftAligned, CPButtonBarResizeControlIsLeftAlignedKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._buttons, CPButtonBarButtonsKey));
}
,["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $CPButtonBar__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButtonBar").super_class }, "initWithCoder:", aCoder))
    {
        self._buttons = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPButtonBarButtonsKey)) || [];
        self._hasResizeControl = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPButtonBarHasResizeControlKey));
        self._resizeControlIsLeftAligned = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPButtonBarResizeControlIsLeftAlignedKey));
    }
    return self;
}
,["id","CPCoder"])]);
}