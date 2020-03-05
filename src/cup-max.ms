mybox=Star isSelected:on
mybox.radius1=58
mybox.radius2=68
mybox.fillet1=5
mybox.fillet1=10
mybox.numPoints=8
mybox.distort=0
mybox.pos=[0,0,0]

-- 转变为样条线
macros.run "Modifier Stack" "Convert_to_Spline"


-- 设置轮廓（俯视外环线）
/*
subobjectLevel = 3
modPanel.setCurrentObject mybox.baseObject
--...
splineOps.startOutline 5
--showProperties mybox
--showProperties splineOps
--showProperties splineOps
--showClass "*:mod*" -- all the modifier classes
--showProperties modPanel
*/

-- r obj
shp=selection[1]
-- is SplineShape or is line
--classof shp ==SplineShape or classof shp ==line
-- select Spline to operate
subobjectlevel = 3
-- is Spline
--subobjectlevel == 3
-- select line
actionMan.executeAction 0 "40021"  -- Selection: Select All
-- get SplineSelection from obj
-- getSplineSelection shp
-- get SplineSelection count
--  (getSplineSelection shp).count >0
--  (getSplineSelection shp).count!=(numSplines shp)

-- r old line
sel=getSplineSelection shp
-- c new line
applyOffset shp 5
select shp
subobjectlevel= 3
-- r old line
setSplineSelection shp sel


subobjectLevel = 0
modPanel.setCurrentObject mybox.baseObject
-- 挤出
--c
modPanel.addModToSelection (Extrude ()) ui:on
--modPanel.setCurrentObject mybox.modifiers[#Extrude]
mybox.modifiers[#Extrude].amount = 200
mybox.modifiers[#Extrude].capType = 1
mybox.modifiers[#Extrude].output = 1
mybox.modifiers[#Extrude].capStart = on
mybox.modifiers[#Extrude].capEnd = on
mybox.modifiers[#Extrude].smooth = on
mybox.modifiers[#Extrude].matIDs = on


Shape001=Star isSelected:on
Shape001.radius1=58
Shape001.radius2=68
Shape001.fillet1=5
Shape001.fillet1=10
Shape001.numPoints=8
Shape001.distort=0
Shape001.pos=[0,0,0]
select Shape001
-- 转为可编辑样条线
macros.run "Modifier Stack" "Convert_to_Spline"
subobjectLevel = 3
-- 挤出
modPanel.addModToSelection (Extrude ()) ui:on
modPanel.setCurrentObject Shape001.baseObject
Shape001.modifiers[#Extrude].amount = 5
Shape001.modifiers[#Extrude].capType = 1
Shape001.modifiers[#Extrude].output = 1
Shape001.modifiers[#Extrude].capStart = on
Shape001.modifiers[#Extrude].capEnd = on
Shape001.modifiers[#Extrude].smooth = on
Shape001.modifiers[#Extrude].matIDs = on
modPanel.setCurrentObject Shape001.modifiers[#Extrude]



-- 锥化
select mybox
modPanel.addModToSelection (Taper ()) ui:on
mybox.modifiers[#Taper].amount = 0.2
mybox.modifiers[#Taper].curve = 0
-- 扭曲
modPanel.addModToSelection (Twist ()) ui:on
mybox.modifiers[#Twist].bias = 0
mybox.modifiers[#Twist].angle = 80

-- 圆滑
select mybox
modPanel.addModToSelection (smooth ()) ui:on
mybox.modifiers[#Smooth].smoothingBits = 1

select mybox
-- 转化为可编辑多边形
macros.run "Modifier Stack" "Convert_to_Poly"

/*
-- 解组
select #($cup, $Star002, $Star001)
actionMan.executeAction 0 "40141"  -- Groups: 解组
*/
/*
--建组
select #($Star002, $Star001)
actionMan.executeAction 0 "40140"  -- Groups: 组
*/
