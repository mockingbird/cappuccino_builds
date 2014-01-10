@STATIC;1.0;i;8;CPView.ji;20;CPWindow_Constants.jt;13260;objj_executeFile("CPView.j", YES);objj_executeFile("CPWindow_Constants.j", YES);{var the_class = objj_allocateClassPair(CPView, "CPButtonBar"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_hasResizeControl"), new objj_ivar("_resizeControlIsLeftAligned"), new objj_ivar("_buttons")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPButtonBar__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButtonBar").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._buttons = [];
        objj_msgSend(self, "setNeedsLayout");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("awakeFromCib"), function $CPButtonBar__awakeFromCib(self, _cmd)
{
    var view = objj_msgSend(self, "superview"),
        subview = self;
    while (view)
    {
        if (objj_msgSend(view, "isKindOfClass:", objj_msgSend(CPSplitView, "class")))
        {
            var viewIndex = objj_msgSend(objj_msgSend(view, "subviews"), "indexOfObject:", subview);
            objj_msgSend(view, "setButtonBar:forDividerAtIndex:", self, viewIndex);
            break;
        }
        subview = view;
        view = objj_msgSend(view, "superview");
    }
}
,["void"]), new objj_method(sel_getUid("setButtons:"), function $CPButtonBar__setButtons_(self, _cmd, buttons)
{
    self._buttons = objj_msgSend(CPArray, "arrayWithArray:", buttons);
    for (var i = 0, count = objj_msgSend(self._buttons, "count"); i < count; i++)
        objj_msgSend(self._buttons[i], "setBordered:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPArray"]), new objj_method(sel_getUid("buttons"), function $CPButtonBar__buttons(self, _cmd)
{
    return objj_msgSend(CPArray, "arrayWithArray:", self._buttons);
}
,["CPArray"]), new objj_method(sel_getUid("setHasResizeControl:"), function $CPButtonBar__setHasResizeControl_(self, _cmd, shouldHaveResizeControl)
{
    if (self._hasResizeControl === shouldHaveResizeControl)
        return;
    self._hasResizeControl = !!shouldHaveResizeControl;
    objj_msgSend(self, "setNeedsLayout");
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
    objj_msgSend(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("resizeControlIsLeftAligned"), function $CPButtonBar__resizeControlIsLeftAligned(self, _cmd)
{
    return self._resizeControlIsLeftAligned;
}
,["BOOL"]), new objj_method(sel_getUid("resizeControlFrame"), function $CPButtonBar__resizeControlFrame(self, _cmd)
{
    var inset = objj_msgSend(self, "currentValueForThemeAttribute:", "resize-control-inset"),
        size = objj_msgSend(self, "currentValueForThemeAttribute:", "resize-control-size"),
        currentSize = objj_msgSend(self, "bounds"),
        leftOrigin = self._resizeControlIsLeftAligned ? 0 : currentSize.size.width - size.width - inset.right - inset.left;
    return CGRectMake(leftOrigin, 0, size.width + inset.left + inset.right, size.height + inset.top + inset.bottom);
}
,["CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPButtonBar__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{
    if (aName === "resize-control-view")
    {
        var inset = objj_msgSend(self, "currentValueForThemeAttribute:", "resize-control-inset"),
            size = objj_msgSend(self, "currentValueForThemeAttribute:", "resize-control-size"),
            currentSize = objj_msgSend(self, "bounds");
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
        return objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButtonBar").super_class }, "createEphemeralSubviewNamed:", aName);
}
,["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPButtonBar__layoutSubviews(self, _cmd)
{
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-color"));
    var normalColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "button-bezel-color", CPThemeStateNormal),
        highlightedColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "button-bezel-color", CPThemeStateHighlighted),
        disabledColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "button-bezel-color", CPThemeStateDisabled),
        textColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "button-text-color", CPThemeStateNormal);
    var buttonsNotHidden = objj_msgSend(CPArray, "arrayWithArray:", self._buttons),
        count = objj_msgSend(buttonsNotHidden, "count");
    while (count--)
        if (objj_msgSend(buttonsNotHidden[count], "isHidden"))
            objj_msgSend(buttonsNotHidden, "removeObject:", buttonsNotHidden[count]);
    var currentButtonOffset = self._resizeControlIsLeftAligned ? CGRectGetMaxX(objj_msgSend(self, "bounds")) + 1 : -1,
        bounds = objj_msgSend(self, "bounds"),
        height = CGRectGetHeight(bounds) - 1,
        frameWidth = CGRectGetWidth(bounds),
        resizeRect = self._hasResizeControl ? objj_msgSend(self, "rectForEphemeralSubviewNamed:", "resize-control-view") : CGRectMakeZero(),
        resizeWidth = CGRectGetWidth(resizeRect),
        availableWidth = frameWidth - resizeWidth - 1;
    for (var i = 0, count = objj_msgSend(buttonsNotHidden, "count"); i < count; i++)
    {
        var button = buttonsNotHidden[i],
            width = CGRectGetWidth(objj_msgSend(button, "frame"));
        if (availableWidth > width)
            availableWidth -= width;
        else
            break;
        if (self._resizeControlIsLeftAligned)
        {
            objj_msgSend(button, "setFrame:", CGRectMake(currentButtonOffset - width, 1, width, height));
            currentButtonOffset -= width - 1;
        }
        else
        {
            objj_msgSend(button, "setFrame:", CGRectMake(currentButtonOffset, 1, width, height));
            currentButtonOffset += width - 1;
        }
        objj_msgSend(button, "setValue:forThemeAttribute:inState:", normalColor, "bezel-color", CPThemeStateNormal | CPThemeStateBordered);
        objj_msgSend(button, "setValue:forThemeAttribute:inState:", highlightedColor, "bezel-color", CPThemeStateHighlighted | CPThemeStateBordered);
        objj_msgSend(button, "setValue:forThemeAttribute:inState:", disabledColor, "bezel-color", CPThemeStateDisabled | CPThemeStateBordered);
        objj_msgSend(button, "setValue:forThemeAttribute:inState:", textColor, "text-color", CPThemeStateBordered);
        objj_msgSend(button, "setValue:forThemeAttribute:inState:", normalColor, "bezel-color", CPThemeStateNormal | CPThemeStateBordered | CPPopUpButtonStatePullsDown);
        objj_msgSend(button, "setValue:forThemeAttribute:inState:", highlightedColor, "bezel-color", CPThemeStateHighlighted | CPThemeStateBordered | CPPopUpButtonStatePullsDown);
        objj_msgSend(button, "setValue:forThemeAttribute:inState:", disabledColor, "bezel-color", CPThemeStateDisabled | CPThemeStateBordered | CPPopUpButtonStatePullsDown);
        objj_msgSend(self, "addSubview:", button);
    }
    if (self._hasResizeControl)
    {
        var resizeControlView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "resize-control-view", CPWindowAbove, nil);
        objj_msgSend(resizeControlView, "setAutoresizingMask:", self._resizeControlIsLeftAligned ? CPViewMaxXMargin : CPViewMinXMargin);
        objj_msgSend(resizeControlView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "resize-control-color"));
    }
}
,["void"]), new objj_method(sel_getUid("setFrameSize:"), function $CPButtonBar__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButtonBar").super_class }, "setFrameSize:", aSize);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CGSize"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("plusButton"), function $CPButtonBar__plusButton(self, _cmd)
{
    var button = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(0, 0, 35, 25)),
        image = objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "button-image-plus", objj_msgSend(CPButtonBar, "class"));
    objj_msgSend(button, "setBordered:", NO);
    objj_msgSend(button, "setImage:", image);
    objj_msgSend(button, "setImagePosition:", CPImageOnly);
    return button;
}
,["id"]), new objj_method(sel_getUid("minusButton"), function $CPButtonBar__minusButton(self, _cmd)
{
    var button = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(0, 0, 35, 25)),
        image = objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "button-image-minus", objj_msgSend(CPButtonBar, "class"));
    objj_msgSend(button, "setBordered:", NO);
    objj_msgSend(button, "setImage:", image);
    objj_msgSend(button, "setImagePosition:", CPImageOnly);
    return button;
}
,["id"]), new objj_method(sel_getUid("actionPopupButton"), function $CPButtonBar__actionPopupButton(self, _cmd)
{
    var button = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(0, 0, 35, 25)),
        image = objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "button-image-action", objj_msgSend(CPButtonBar, "class"));
    objj_msgSend(button, "addItemWithTitle:", nil);
    objj_msgSend(objj_msgSend(button, "lastItem"), "setImage:", image);
    objj_msgSend(button, "setImagePosition:", CPImageOnly);
    objj_msgSend(button, "setValue:forThemeAttribute:", CGInsetMake(0, 0, 0, 0), "content-inset");
    objj_msgSend(button, "setPullsDown:", YES);
    return button;
}
,["id"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPButtonBar__defaultThemeClass(self, _cmd)
{
    return "button-bar";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPButtonBar__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CGInsetMake(0.0, 0.0, 0.0, 0.0), "resize-control-inset", CGSizeMakeZero(), "resize-control-size", objj_msgSend(CPNull, "null"), "resize-control-color", objj_msgSend(CPNull, "null"), "bezel-color", objj_msgSend(CPNull, "null"), "button-bezel-color", objj_msgSend(CPNull, "null"), "button-text-color", objj_msgSend(CPNull, "null"), "button-image-plus", objj_msgSend(CPNull, "null"), "button-image-minus", objj_msgSend(CPNull, "null"), "button-image-action");
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
    objj_msgSend(aCoder, "encodeBool:forKey:", self._hasResizeControl, CPButtonBarHasResizeControlKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._resizeControlIsLeftAligned, CPButtonBarResizeControlIsLeftAlignedKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._buttons, CPButtonBarButtonsKey);
}
,["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $CPButtonBar__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButtonBar").super_class }, "initWithCoder:", aCoder))
    {
        self._buttons = objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonBarButtonsKey) || [];
        self._hasResizeControl = objj_msgSend(aCoder, "decodeBoolForKey:", CPButtonBarHasResizeControlKey);
        self._resizeControlIsLeftAligned = objj_msgSend(aCoder, "decodeBoolForKey:", CPButtonBarResizeControlIsLeftAlignedKey);
    }
    return self;
}
,["id","CPCoder"])]);
}