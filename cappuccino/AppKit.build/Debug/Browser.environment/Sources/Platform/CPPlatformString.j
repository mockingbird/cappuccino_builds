@STATIC;1.0;I;21;Foundation/CPObject.jt;6327;


objj_executeFile("Foundation/CPObject.j", NO);


{var the_class = objj_allocateClassPair(CPObject, "CPBasePlatformString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("bootstrap"), function $CPBasePlatformString__bootstrap(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"), function $CPBasePlatformString__sizeOfString_withFont_forWidth_(self, _cmd, aString, aFont, aWidth)
{ with(self)
{
    return { width:0.0, height:0.0 };
}
},["CGSize","CPString","CPFont","float"])]);
}



var DOMFixedWidthSpanElement = nil,
    DOMFlexibleWidthSpanElement = nil,
    DOMMetricsDivElement = nil,
    DOMMetricsTextSpanElement = nil,
    DOMMetricsImgElement = nil,
    DefaultFont = nil;

{var the_class = objj_allocateClassPair(CPBasePlatformString, "CPPlatformString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPPlatformString__initialize(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPPlatformString, "class"))
        return;

    DefaultFont = objj_msgSend(CPFont, "systemFontOfSize:", CPFontCurrentSystemSize);
}
},["void"]), new objj_method(sel_getUid("bootstrap"), function $CPPlatformString__bootstrap(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "createDOMElements");
}
},["void"]), new objj_method(sel_getUid("createDOMElements"), function $CPPlatformString__createDOMElements(self, _cmd)
{ with(self)
{
    var style,
        bodyElement = objj_msgSend(CPPlatform, "mainBodyElement");

    DOMFlexibleWidthSpanElement = document.createElement("span");
    DOMFlexibleWidthSpanElement.className = "cpdontremove";
    style = DOMFlexibleWidthSpanElement.style;
    style.position = "absolute";
    style.left = "-100000px";
    style.zIndex = -100000;
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

    try
    {
        style.whiteSpace = "pre";
        style.whiteSpace = "-o-pre-wrap";
        style.whiteSpace = "-pre-wrap";
        style.whiteSpace = "-moz-pre-wrap";
        style.whiteSpace = "pre-wrap";
    }
    catch(e)
    {

        style.whiteSpace = "pre";
    }

    bodyElement.appendChild(DOMFlexibleWidthSpanElement);
    bodyElement.appendChild(DOMFixedWidthSpanElement);
}
},["void"]), new objj_method(sel_getUid("createDOMMetricsElements"), function $CPPlatformString__createDOMMetricsElements(self, _cmd)
{ with(self)
{
    var style,
        bodyElement = objj_msgSend(CPPlatform, "mainBodyElement");

    DOMMetricsDivElement = document.createElement("div");
    DOMMetricsDivElement.className = "cpdontremove";
    DOMMetricsDivElement.style.position = "absolute";
    DOMMetricsDivElement.style.left = "-10000px";
    DOMMetricsDivElement.style.zIndex = -10000;
    DOMMetricsDivElement.style.width = "100000px";

    bodyElement.appendChild(DOMMetricsDivElement);

    DOMMetricsTextSpanElement = document.createElement("span");
    DOMMetricsTextSpanElement.className = "cpdontremove";
    DOMMetricsTextSpanElement.innerHTML = "x";
    style = DOMMetricsTextSpanElement.style;
    style.position = "absolute";
    style.left = "-10000px";
    style.zIndex = -10000;
    style.visibility = "visible";
    style.padding = "0px";
    style.margin = "0px";
    style.whiteSpace = "pre";

    var imgPath = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPView, "class")), "pathForResource:", "empty.png");

    DOMMetricsImgElement = document.createElement("img");
    DOMMetricsImgElement.className = "cpdontremove";
    DOMMetricsImgElement.setAttribute("src", imgPath);
    DOMMetricsImgElement.setAttribute("width", "1");
    DOMMetricsImgElement.setAttribute("height", "1");
    DOMMetricsImgElement.setAttribute("alt", "");
    style = DOMMetricsImgElement.style;
    style.position = "absolute";
    style.left = "-10000px";
    style.zIndex = -10000;
    style.visibility = "visible";
    style.padding = "0px";
    style.margin = "0px";
    style.border = "none";
    style.verticalAlign = "baseline";

    DOMMetricsDivElement.appendChild(DOMMetricsTextSpanElement);
    DOMMetricsDivElement.appendChild(DOMMetricsImgElement);
}
},["void"]), new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"), function $CPPlatformString__sizeOfString_withFont_forWidth_(self, _cmd, aString, aFont, aWidth)
{ with(self)
{
    if (!DOMFixedWidthSpanElement)
        objj_msgSend(self, "createDOMElements");

    var span;

    if (!aWidth)
        span = DOMFlexibleWidthSpanElement;
    else
    {
        span = DOMFixedWidthSpanElement;
        span.style.width = ROUND(aWidth) + "px";
    }

    span.style.font = objj_msgSend((aFont || DefaultFont), "cssString");

    if (CPFeatureIsCompatible(CPJavaScriptInnerTextFeature))
        span.innerText = aString;
    else if (CPFeatureIsCompatible(CPJavaScriptTextContentFeature))
        span.textContent = aString;

    return { width:span.clientWidth, height:span.clientHeight };
}
},["CGSize","CPString","CPFont","float"]), new objj_method(sel_getUid("metricsOfFont:"), function $CPPlatformString__metricsOfFont_(self, _cmd, aFont)
{ with(self)
{
    if (!DOMMetricsDivElement)
        objj_msgSend(self, "createDOMMetricsElements");

    DOMMetricsDivElement.style.font = objj_msgSend((aFont || DefaultFont), "cssString");

    var baseline = DOMMetricsImgElement.offsetTop - DOMMetricsTextSpanElement.offsetTop + DOMMetricsImgElement.offsetHeight,
        descender = baseline - DOMMetricsTextSpanElement.offsetHeight,
        lineHeight = DOMMetricsTextSpanElement.offsetHeight;

    return objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", baseline, "ascender", descender, "descender", lineHeight, "lineHeight");
}
},["CPDictionary","CPFont"])]);
}


