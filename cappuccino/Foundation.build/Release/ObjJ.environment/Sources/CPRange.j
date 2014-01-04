@STATIC;1.0;t;1182;
CPMakeRange=function(_1,_2){
return {location:(_1),length:_2};
};
CPMakeRangeCopy=function(_3){
return {location:(_3).location,length:(_3).length};
};
CPEmptyRange=function(_4){
return ((_4).length===0);
};
CPMaxRange=function(_5){
return ((_5).location+(_5).length);
};
CPEqualRanges=function(_6,_7){
return ((_6.location===_7.location)&&(_6.length===_7.length));
};
CPLocationInRange=function(_8,_9){
return (((_8)>=(_9).location)&&((_8)<((_9).location+(_9).length)));
};
CPUnionRange=function(_a,_b){
var _c=MIN(_a.location,_b.location);
return CPMakeRange(_c,MAX(CPMaxRange(_a),CPMaxRange(_b))-_c);
};
CPIntersectionRange=function(_d,_e){
if(CPMaxRange(_d)<_e.location||CPMaxRange(_e)<_d.location){
return CPMakeRange(0,0);
}
var _f=MAX(_d.location,_e.location);
return CPMakeRange(_f,MIN(CPMaxRange(_d),CPMaxRange(_e))-_f);
};
CPRangeInRange=function(_10,_11){
return (_10.location<=_11.location&&CPMaxRange(_10)>=CPMaxRange(_11));
};
CPStringFromRange=function(_12){
return "{"+_12.location+", "+_12.length+"}";
};
CPRangeFromString=function(_13){
var _14=_13.indexOf(",");
return {location:parseInt(_13.substr(1,_14-1)),length:parseInt(_13.substring(_14+1,_13.length))};
};
