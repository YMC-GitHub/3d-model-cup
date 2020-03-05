-- -----------------   function   -------------
-- 黑色玻璃
--fn blackGlasses col=(
fn blackGlasses=(
-- black glasses
he= VRayMtl ()
-- 漫射
--he.Diffuse = color 5 5 5
he.Diffuse=(color (random 0  10) (random 0  10) (random 0  10))
--he.Diffuse =col
-- 反射
he.Reflection = color 45 45 45 -- 反射的颜色
he.reflection_lockGlossiness = off
he.hilight_glossiness = 1.0 -- 高光光泽度
he.reflection_glossiness = 0.92 -- 反射光泽度
he.reflection_fresnel = off --涅尔反射
he.reflection_subdivs = 12 --细分
he.reflection_maxDepth = 5 --最大深度
he.reflection_affectAlpha = 0 --影响通道
-- 折射
  return he
)

-- -----------------   config   -------------
S_NUM=1
E_NUM=9

-- -----------------   run   -------------
for m=S_NUM to E_NUM do (
  index = m as string
  --meditMaterials[m]=(blackGlasses (color (random 0  255) (random 0  255) (random 0  255)))
  --meditMaterials[m]=(blackGlasses (color (random 0  5) (random 0  5) (random 0  5)))
  meditMaterials[m]=(blackGlasses())
)
