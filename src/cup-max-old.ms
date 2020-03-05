/*
-- set units
units.DisplayType=#metric
units.MetricType=#millimeters
units.USType=#ft_Frac_In
units.USFrac=#frac_1_32
units.CustomName="FL"
units.CustomValue=660.0
units.CustomUnit=#feet
units.SystemScale=1.0
units.SystemType=#millimeters
units.formatValue 123.45
units.decodeValue "3.136m"
*/
-- 测面 俯视内环线
--mybox=Star radius1:50 radius2:68 fillet1:5 fillet2:10 numPoints:6 distort:0 pos:[0,0,0] isSelected:on
--mybox=Star isSelected:on
mybox=Star isSelected:on
mybox.radius1=58
mybox.radius2=68
mybox.fillet1=5
mybox.fillet1=10
mybox.numPoints=8
mybox.distort=0
mybox.pos=[0,0,0]

--r
select mybox
--d
--delete mybox
--u
--select mybox
--mybox.name = "star001"

-- 转变为样条线
macros.run "Modifier Stack" "Convert_to_Spline"

-- 设置轮廓（俯视外环线）
subobjectLevel = 3
modPanel.setCurrentObject mybox.baseObject
-- do sth. in ui
--...


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

-- 分开线
-- do sth. in ui
-- ...
-- macros.run "Editable Spline Object" "ESpline_Detach_Spline"


Shape001=Star isSelected:on
Shape001.radius1=58
Shape001.radius2=68
Shape001.fillet1=5
Shape001.fillet1=10
Shape001.numPoints=8
Shape001.distort=0
Shape001.pos=[0,0,0]

-- 底面 内环线
Shape001=Star radius1:50 radius2:68 fillet1:5 fillet2:10 numPoints:6 distort:0 pos:[0,0,0] isSelected:on
select myboxShape001
-- 转为可编辑样条线
macros.run "Modifier Stack" "Convert_to_Spline"
subobjectLevel = 3
-- 挤出
modPanel.setCurrentObject mybox.baseObject
mybox.modifiers[#Extrude].amount = 5
mybox.modifiers[#Extrude].capType = 1
mybox.modifiers[#Extrude].output = 1
mybox.modifiers[#Extrude].capStart = on
mybox.modifiers[#Extrude].capEnd = on
mybox.modifiers[#Extrude].smooth = on
mybox.modifiers[#Extrude].matIDs = on

-- 锥化
select mybox
modPanel.addModToSelection (Taper ()) ui:on
mybox.modifiers[#Taper].amount = 0.2
mybox.modifiers[#Taper].curve = 0
-- 扭曲
modPanel.addModToSelection (Twist ()) ui:on
mybox.modifiers[#Twist].bias = 0
mybox.modifiers[#Twist].angle = 80

-- 赋予材质
mybox.material = meditMaterials[1]

-- 桌面
b=Box()
b.length = 500
b.width = 500
b.height = 5

-- 墙面
w=Box()
w.pos=[0,250,0]
w.length = 5
w.width = 500
w.height = 500
