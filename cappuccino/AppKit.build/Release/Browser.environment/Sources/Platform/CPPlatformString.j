@STATIC;1.0;I;21;Foundation/CPObject.jt;5967;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "CPBasePlatformString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("bootstrap"), function $CPBasePlatformString__bootstrap(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"), function $CPBasePlatformString__sizeOfString_withFont_forWidth_(self, _cmd, aString, aFont, aWidth)
{
    return CGSizeMakeZero();
}
,["CGSize","CPString","CPFont","float"])]);
}var DOMFixedWidthSpanElement = nil,
    DOMFlexibleWidthSpanElement = nil,
    DOMMetricsDivElement = nil,
    DOMMetricsImgElement = nil,
    DefaultFont = nil;
{var the_class = objj_allocateClassPair(CPBasePlatformString, "CPPlatformString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPPlatformString__initialize(self, _cmd)
{
    if (self !== CPPlatformString.isa.objj_msgSend0(CPPlatformString, "class"))
        return;
    DefaultFont = CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", CPFontCurrentSystemSize);
}
,["void"]), new objj_method(sel_getUid("bootstrap"), function $CPPlatformString__bootstrap(self, _cmd)
{
    self.isa.objj_msgSend0(self, "createDOMElements");
}
,["void"]), new objj_method(sel_getUid("createDOMElements"), function $CPPlatformString__createDOMElements(self, _cmd)
{
    var style,
        bodyElement = CPPlatform.isa.objj_msgSend0(CPPlatform, "mainBodyElement");
    DOMFlexibleWidthSpanElement = document.createElement("span");
    DOMFlexibleWidthSpanElement.className = "cpdontremove";
    style = DOMFlexibleWidthSpanElement.style;
    style.position = "absolute";
    style.left = "-100000px";
    style.zIndex = -10000;
    style.visibility = "visible";
    style.padding = "0px";
    style.margin = "0px";
    style.whiteSpace = "pre";
    DOMFixedWidthSpanElement = document.createElement("span");
    DOMFixedWidthSpanElement.className = "cpdontremove";
    style = DOMFixedWidthSpanElement.style;
    style.display = "block";
    style.position = "absolute";
    style.left = "-100000px";
    style.zIndex = -10000;
    style.visibility = "visible";
    style.padding = "0px";
    style.margin = "0px";
    style.width = "1px";
    style.wordWrap = "break-word";
    try    {
        style.whiteSpace = "pre";
        style.whiteSpace = "-o-pre-wrap";
        style.whiteSpace = "-pre-wrap";
        style.whiteSpace = "-moz-pre-wrap";
        style.whiteSpace = "pre-wrap";
    }
    catch(e)     {
        style.whiteSpace = "pre";
    }    bodyElement.appendChild(DOMFlexibleWidthSpanElement);
    bodyElement.appendChild(DOMFixedWidthSpanElement);
}
,["void"]), new objj_method(sel_getUid("createDOMMetricsElements"), function $CPPlatformString__createDOMMetricsElements(self, _cmd)
{
    var style,
        bodyElement = CPPlatform.isa.objj_msgSend0(CPPlatform, "mainBodyElement");
    DOMMetricsDivElement = document.createElement("div");
    DOMMetricsDivElement.className = "cpdontremove";
    style = DOMMetricsDivElement.style;
    style.position = "absolute";
    style.left = "-100000px";
    style.zIndex = -10000;
    style.width = "100000px";
    style.whiteSpace = "nowrap";
    style.lineHeight = "1em";
    style.padding = "0px";
    style.margin = "0px";
    DOMMetricsDivElement.innerHTML = "x";
    bodyElement.appendChild(DOMMetricsDivElement);
    var imgPath = ((___r1 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", CPView.isa.objj_msgSend0(CPView, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", "empty.png"));
    DOMMetricsImgElement = document.createElement("img");
    DOMMetricsImgElement.className = "cpdontremove";
    DOMMetricsImgElement.setAttribute("src", imgPath);
    DOMMetricsImgElement.setAttribute("width", "1");
    DOMMetricsImgElement.setAttribute("height", "1");
    DOMMetricsImgElement.setAttribute("alt", "");
    style = DOMMetricsImgElement.style;
    style.zIndex = -10000;
    style.visibility = "visible";
    style.padding = "0px";
    style.margin = "0px";
    style.border = "none";
    style.verticalAlign = "baseline";
    DOMMetricsDivElement.appendChild(DOMMetricsImgElement);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"), function $CPPlatformString__sizeOfString_withFont_forWidth_(self, _cmd, aString, aFont, aWidth)
{
    if (!DOMFixedWidthSpanElement)
        self.isa.objj_msgSend0(self, "createDOMElements");
    var span;
    if (!aWidth)
        span = DOMFlexibleWidthSpanElement;
    else
    {
        span = DOMFixedWidthSpanElement;
        span.style.width = ROUND(aWidth) + "px";
    }
    span.style.font = ((___r1 = aFont || DefaultFont), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cssString"));
    if (CPFeatureIsCompatible(CPJavaScriptInnerTextFeature))
        span.innerText = aString;
    else if (CPFeatureIsCompatible(CPJavaScriptTextContentFeature))
        span.textContent = aString;
    return CGSizeMake(span.clientWidth + 1, span.clientHeight);
    var ___r1;
}
,["CGSize","CPString","CPFont","float"]), new objj_method(sel_getUid("metricsOfFont:"), function $CPPlatformString__metricsOfFont_(self, _cmd, aFont)
{
    if (!DOMMetricsDivElement)
        self.isa.objj_msgSend0(self, "createDOMMetricsElements");
    DOMMetricsDivElement.style.font = ((___r1 = aFont || DefaultFont), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cssString"));
    var lineHeight = DOMMetricsDivElement.offsetHeight,
        baseline = DOMMetricsImgElement.offsetTop + DOMMetricsImgElement.offsetHeight,
        descender = baseline - lineHeight;
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", baseline, "ascender", descender, "descender", lineHeight, "lineHeight");
    var ___r1;
}
,["CPDictionary","CPFont"])]);
}