@STATIC;1.0;t;7392;
CGPointMake=function(x,y){
return {x:x,y:y};
};
CGPointMakeZero=function(){
return {x:0,y:0};
};
CGPointMakeCopy=function(_1){
return {x:_1.x,y:_1.y};
};
CGPointCreateCopy=function(_2){
return {x:_2.x,y:_2.y};
};
CGPointEqualToPoint=function(_3,_4){
return (_3.x==_4.x&&_3.y==_4.y);
};
CGStringFromPoint=function(_5){
return ("{"+_5.x+", "+_5.y+"}");
};
CGSizeMake=function(_6,_7){
return {width:_6,height:_7};
};
CGSizeMakeZero=function(){
return {width:0,height:0};
};
CGSizeMakeCopy=function(_8){
return {width:_8.width,height:_8.height};
};
CGSizeCreateCopy=function(_9){
return {width:_9.width,height:_9.height};
};
CGSizeEqualToSize=function(_a,_b){
return (_a.width==_b.width&&_a.height==_b.height);
};
CGStringFromSize=function(_c){
return ("{"+_c.width+", "+_c.height+"}");
};
CGRectMake=function(x,y,_d,_e){
return {origin:{x:x,y:y},size:{width:_d,height:_e}};
};
CGRectMakeZero=function(){
return {origin:{x:0,y:0},size:{width:0,height:0}};
};
CGRectMakeCopy=function(_f){
return {origin:{x:_f.origin.x,y:_f.origin.y},size:{width:_f.size.width,height:_f.size.height}};
};
CGRectCreateCopy=function(_10){
return {origin:{x:_10.origin.x,y:_10.origin.y},size:{width:_10.size.width,height:_10.size.height}};
};
CGRectEqualToRect=function(_11,_12){
return ((_11.origin.x==_12.origin.x&&_11.origin.y==_12.origin.y)&&(_11.size.width==_12.size.width&&_11.size.height==_12.size.height));
};
CGStringFromRect=function(_13){
return ("{"+("{"+_13.origin.x+", "+_13.origin.y+"}")+", "+("{"+_13.size.width+", "+_13.size.height+"}")+"}");
};
CGRectOffset=function(_14,dX,dY){
return {origin:{x:_14.origin.x+dX,y:_14.origin.y+dY},size:{width:_14.size.width,height:_14.size.height}};
};
CGRectInset=function(_15,dX,dY){
return {origin:{x:_15.origin.x+dX,y:_15.origin.y+dY},size:{width:_15.size.width-2*dX,height:_15.size.height-2*dY}};
};
CGRectGetHeight=function(_16){
return (_16.size.height);
};
CGRectGetMaxX=function(_17){
return (_17.origin.x+_17.size.width);
};
CGRectGetMaxY=function(_18){
return (_18.origin.y+_18.size.height);
};
CGRectGetMidX=function(_19){
return (_19.origin.x+(_19.size.width)/2);
};
CGRectGetMidY=function(_1a){
return (_1a.origin.y+(_1a.size.height)/2);
};
CGRectGetMinX=function(_1b){
return (_1b.origin.x);
};
CGRectGetMinY=function(_1c){
return (_1c.origin.y);
};
CGRectGetWidth=function(_1d){
return (_1d.size.width);
};
CGRectIsEmpty=function(_1e){
return (_1e.size.width<=0||_1e.size.height<=0);
};
CGRectIsNull=function(_1f){
return (_1f.size.width<=0||_1f.size.height<=0);
};
CGRectContainsPoint=function(_20,_21){
return (_21.x>=(_20.origin.x)&&_21.y>=(_20.origin.y)&&_21.x<(_20.origin.x+_20.size.width)&&_21.y<(_20.origin.y+_20.size.height));
};
CGInsetMake=function(top,_22,_23,_24){
return {top:(top),right:(_22),bottom:(_23),left:(_24)};
};
CGInsetMakeZero=function(){
return {top:(0),right:(0),bottom:(0),left:(0)};
};
CGInsetMakeCopy=function(_25){
return {top:(_25.top),right:(_25.right),bottom:(_25.bottom),left:(_25.left)};
};
CGInsetMakeInvertedCopy=function(_26){
return {top:(-_26.top),right:(-_26.right),bottom:(-_26.bottom),left:(-_26.left)};
};
CGInsetIsEmpty=function(_27){
return ((_27).top===0&&(_27).right===0&&(_27).bottom===0&&(_27).left===0);
};
CGInsetEqualToInset=function(_28,_29){
return ((_28).top===(_29).top&&(_28).right===(_29).right&&(_28).bottom===(_29).bottom&&(_28).left===(_29).left);
};
CGMinXEdge=0;
CGMinYEdge=1;
CGMaxXEdge=2;
CGMaxYEdge=3;
CGRectNull={origin:{x:Infinity,y:Infinity},size:{width:0,height:0}};
CGRectDivide=function(_2a,_2b,rem,_2c,_2d){
_2b.origin={x:_2a.origin.x,y:_2a.origin.y};
_2b.size={width:_2a.size.width,height:_2a.size.height};
rem.origin={x:_2a.origin.x,y:_2a.origin.y};
rem.size={width:_2a.size.width,height:_2a.size.height};
switch(_2d){
case CGMinXEdge:
_2b.size.width=_2c;
rem.origin.x+=_2c;
rem.size.width-=_2c;
break;
case CGMaxXEdge:
_2b.origin.x=(_2b.origin.x+_2b.size.width)-_2c;
_2b.size.width=_2c;
rem.size.width-=_2c;
break;
case CGMinYEdge:
_2b.size.height=_2c;
rem.origin.y+=_2c;
rem.size.height-=_2c;
break;
case CGMaxYEdge:
_2b.origin.y=(_2b.origin.y+_2b.size.height)-_2c;
_2b.size.height=_2c;
rem.size.height-=_2c;
}
};
CGRectContainsRect=function(_2e,_2f){
var _30=CGRectUnion(_2e,_2f);
return ((_30.origin.x==_2e.origin.x&&_30.origin.y==_2e.origin.y)&&(_30.size.width==_2e.size.width&&_30.size.height==_2e.size.height));
};
CGRectIntersectsRect=function(_31,_32){
var _33=CGRectIntersection(_31,_32);
return !(_33.size.width<=0||_33.size.height<=0);
};
CGRectIntegral=function(_34){
_34=CGRectStandardize(_34);
var x=FLOOR((_34.origin.x)),y=FLOOR((_34.origin.y));
_34.size.width=CEIL((_34.origin.x+_34.size.width))-x;
_34.size.height=CEIL((_34.origin.y+_34.size.height))-y;
_34.origin.x=x;
_34.origin.y=y;
return _34;
};
CGRectIntersection=function(_35,_36){
var _37={origin:{x:MAX((_35.origin.x),(_36.origin.x)),y:MAX((_35.origin.y),(_36.origin.y))},size:{width:0,height:0}};
_37.size.width=MIN((_35.origin.x+_35.size.width),(_36.origin.x+_36.size.width))-(_37.origin.x);
_37.size.height=MIN((_35.origin.y+_35.size.height),(_36.origin.y+_36.size.height))-(_37.origin.y);
return (_37.size.width<=0||_37.size.height<=0)?{origin:{x:0,y:0},size:{width:0,height:0}}:_37;
};
CGRectStandardize=function(_38){
var _39=(_38.size.width),_3a=(_38.size.height),_3b={origin:{x:_38.origin.x,y:_38.origin.y},size:{width:_38.size.width,height:_38.size.height}};
if(_39<0){
_3b.origin.x+=_39;
_3b.size.width=-_39;
}
if(_3a<0){
_3b.origin.y+=_3a;
_3b.size.height=-_3a;
}
return _3b;
};
CGRectUnion=function(_3c,_3d){
var _3e=!_3c||_3c===CGRectNull,_3f=!_3d||_3d===CGRectNull;
if(_3e){
return _3f?CGRectNull:_3d;
}
if(_3f){
return _3e?CGRectNull:_3c;
}
var _40=MIN((_3c.origin.x),(_3d.origin.x)),_41=MIN((_3c.origin.y),(_3d.origin.y)),_42=MAX((_3c.origin.x+_3c.size.width),(_3d.origin.x+_3d.size.width)),_43=MAX((_3c.origin.y+_3c.size.height),(_3d.origin.y+_3d.size.height));
return {origin:{x:_40,y:_41},size:{width:_42-_40,height:_43-_41}};
};
CGRectInsetByInset=function(_44,_45){
return {origin:{x:(_44).origin.x+(_45).left,y:(_44).origin.y+(_45).top},size:{width:(_44).size.width-(_45).left-(_45).right,height:(_44).size.height-(_45).top-(_45).bottom}};
};
CGPointFromString=function(_46){
var _47=_46.indexOf(",");
return {x:parseFloat(_46.substr(1,_47-1)),y:parseFloat(_46.substring(_47+1,_46.length))};
};
CGSizeFromString=function(_48){
var _49=_48.indexOf(",");
return {width:parseFloat(_48.substr(1,_49-1)),height:parseFloat(_48.substring(_49+1,_48.length))};
};
CGRectFromString=function(_4a){
var _4b=_4a.indexOf(",",_4a.indexOf(",")+1);
return {origin:CGPointFromString(_4a.substr(1,_4b-1)),size:CGSizeFromString(_4a.substring(_4b+2,_4a.length))};
};
CGPointFromEvent=function(_4c){
return {x:_4c.clientX,y:_4c.clientY};
};
CGInsetUnion=function(_4d,_4e){
return {top:(_4d.top+_4e.top),right:(_4d.right+_4e.right),bottom:(_4d.bottom+_4e.bottom),left:(_4d.left+_4e.left)};
};
CGInsetDifference=function(_4f,_50){
return {top:(_4f.top-_50.top),right:(_4f.right-_50.right),bottom:(_4f.bottom-_50.bottom),left:(_4f.left-_50.left)};
};
CGInsetFromString=function(_51){
var _52=_51.substr(1,_51.length-2).split(",");
return {top:(parseFloat(_52[0])),right:(parseFloat(_52[1])),bottom:(parseFloat(_52[2])),left:(parseFloat(_52[3]))};
};
CGInsetFromCPString=CGInsetFromString;
CPStringFromCGInset=function(_53){
return "{"+_53.top+", "+_53.left+", "+_53.bottom+", "+_53.right+"}";
};
