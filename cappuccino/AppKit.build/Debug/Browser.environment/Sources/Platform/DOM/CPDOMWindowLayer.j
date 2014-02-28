@STATIC;1.0;I;20;Foundation/CPArray.jI;21;Foundation/CPObject.ji;12;CGGeometry.jt;4392;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CGGeometry.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPDOMWindowLayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_level"), new objj_ivar("_windows"), new objj_ivar("_DOMElement")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithLevel:"), function $CPDOMWindowLayer__initWithLevel_(self, _cmd, aLevel)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDOMWindowLayer").super_class }, "init");
    if (self)
    {
        self._level = aLevel;
        self._windows = [];
        self._DOMElement = document.createElement("div");
        self._DOMElement.style.position = "absolute";
        self._DOMElement.style.top = "0px";
        self._DOMElement.style.left = "0px";
        self._DOMElement.style.width = "1px";
        self._DOMElement.style.height = "1px";
    }
    return self;
}
,["id","int"]), new objj_method(sel_getUid("level"), function $CPDOMWindowLayer__level(self, _cmd)
{
    return self._level;
}
,["int"]), new objj_method(sel_getUid("removeWindow:"), function $CPDOMWindowLayer__removeWindow_(self, _cmd, aWindow)
{
    if (!aWindow._isVisible)
        return;
    var index = aWindow._index,
        count = self._windows.length - 1;
    self._DOMElement.removeChild(aWindow._DOMElement);
    objj_msgSend(self._windows, "removeObjectAtIndex:", aWindow._index);
    for (; index < count; ++index)
    {
        self._windows[index]._index = index;
        self._windows[index]._DOMElement.style.zIndex = index;
    }
    aWindow._isVisible = NO;
}
,["void","CPWindow"]), new objj_method(sel_getUid("insertWindow:atIndex:"), function $CPDOMWindowLayer__insertWindow_atIndex_(self, _cmd, aWindow, anIndex)
{
    var count = objj_msgSend(self._windows, "count"),
        zIndex = anIndex === CPNotFound ? count : anIndex,
        isVisible = aWindow._isVisible;
    if (isVisible)
    {
        zIndex = MIN(zIndex, aWindow._index);
        if (aWindow._index < anIndex)
            --anIndex;
        objj_msgSend(self._windows, "removeObjectAtIndex:", aWindow._index);
    }
    else
        ++count;
    if (anIndex === CPNotFound || anIndex >= count)
        objj_msgSend(self._windows, "addObject:", aWindow);
    else
        objj_msgSend(self._windows, "insertObject:atIndex:", aWindow, anIndex);
    for (; zIndex < count; ++zIndex)
    {
        self._windows[zIndex]._index = zIndex;
        self._windows[zIndex]._DOMElement.style.zIndex = zIndex;
    }
    if (aWindow._DOMElement.parentNode !== self._DOMElement)
    {
        self._DOMElement.appendChild(aWindow._DOMElement);
        aWindow._isVisible = YES;
        if (objj_msgSend(aWindow, "isFullPlatformWindow"))
            objj_msgSend(aWindow, "setFrame:", objj_msgSend(aWindow._platformWindow, "usableContentFrame"));
    }
}
,["void","CPWindow","CPUInteger"]), new objj_method(sel_getUid("orderedWindows"), function $CPDOMWindowLayer__orderedWindows(self, _cmd)
{
    return self._windows;
}
,["CPArray"]), new objj_method(sel_getUid("clipWindow:toRect:"), function $CPDOMWindowLayer__clipWindow_toRect_(self, _cmd, aWindow, clipRect)
{
    var windowElement = aWindow._DOMElement,
        clip = document.createElement("div"),
        style = clip.style;
    style = clip.style;
    style.className = "cpwindowclip";
    style.position = "absolute";
    style.overflow = "hidden";
    style.left = clipRect.origin.x + "px";
    style.top = clipRect.origin.y + "px";
    style.width = clipRect.size.width + "px";
    style.height = clipRect.size.height + "px";
    var parent = windowElement.parentNode;
    parent.insertBefore(clip, windowElement);
    parent.removeChild(windowElement);
    clip.appendChild(windowElement);
}
,["void","CPWindow","CGRect"]), new objj_method(sel_getUid("removeClipForWindow:"), function $CPDOMWindowLayer__removeClipForWindow_(self, _cmd, aWindow)
{
    var windowElement = aWindow._DOMElement,
        clip = windowElement.parentNode,
        parent = clip.parentNode;
    clip.removeChild(windowElement);
    objj_msgSend(aWindow, "setFrameOrigin:", CGPointMake(objj_msgSend(aWindow, "frame").origin.x, clip.offsetTop));
    parent.insertBefore(windowElement, clip);
    parent.removeChild(clip);
}
,["void","CPWindow"])]);
}