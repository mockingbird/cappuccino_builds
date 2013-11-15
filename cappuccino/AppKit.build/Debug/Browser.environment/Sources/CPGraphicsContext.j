@STATIC;1.0;I;21;Foundation/CPObject.ji;11;CGContext.jt;2895;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("CGContext.j", YES);var CPGraphicsContextCurrent = nil,
    CPGraphicsContextThreadStack = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPGraphicsContext"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_graphicsPort")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithGraphicsPort:"), function $CPGraphicsContext__initWithGraphicsPort_(self, _cmd, aGraphicsPort)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPGraphicsContext").super_class }, "init");
    if (self)
        self._graphicsPort = aGraphicsPort;
    return self;
}
,["id","CPContext"]), new objj_method(sel_getUid("graphicsPort"), function $CPGraphicsContext__graphicsPort(self, _cmd)
{
    return self._graphicsPort;
}
,["CGContext"]), new objj_method(sel_getUid("isFlipped"), function $CPGraphicsContext__isFlipped(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("saveGraphicsState"), function $CPGraphicsContext__saveGraphicsState(self, _cmd)
{
    CGContextSaveGState(self._graphicsPort);
}
,["void"]), new objj_method(sel_getUid("restoreGraphicsState"), function $CPGraphicsContext__restoreGraphicsState(self, _cmd)
{
    CGContextRestoreGState(self._graphicsPort);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("currentContext"), function $CPGraphicsContext__currentContext(self, _cmd)
{
    return CPGraphicsContextCurrent;
}
,["CPGraphicsContext"]), new objj_method(sel_getUid("setCurrentContext:"), function $CPGraphicsContext__setCurrentContext_(self, _cmd, aGraphicsContext)
{
    CPGraphicsContextCurrent = aGraphicsContext;
}
,["void","CPGraphicsContext"]), new objj_method(sel_getUid("saveGraphicsState"), function $CPGraphicsContext__saveGraphicsState(self, _cmd)
{
    if (!CPGraphicsContextCurrent)
        return;
    if (!CPGraphicsContextThreadStack)
        CPGraphicsContextThreadStack = objj_msgSend(CPMutableArray, "array");
    objj_msgSend(CPGraphicsContextThreadStack, "addObject:", CPGraphicsContextCurrent);
    objj_msgSend(CPGraphicsContextCurrent, "saveGraphicsState");
}
,["void"]), new objj_method(sel_getUid("restoreGraphicsState"), function $CPGraphicsContext__restoreGraphicsState(self, _cmd)
{
    var lastContext = objj_msgSend(CPGraphicsContextThreadStack, "lastObject");
    if (lastContext)
    {
        objj_msgSend(lastContext, "restoreGraphicsState");
        objj_msgSend(CPGraphicsContextThreadStack, "removeLastObject");
    }
}
,["void"]), new objj_method(sel_getUid("graphicsContextWithGraphicsPort:flipped:"), function $CPGraphicsContext__graphicsContextWithGraphicsPort_flipped_(self, _cmd, aContext, aFlag)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithGraphicsPort:", aContext);
}
,["CPGraphicsContext","CGContext","BOOL"])]);
}