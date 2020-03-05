-- -----------------   function   -------------
-- 彩色玻璃
fn colorGlasses col=(
he= VRayMtl ()
-- 漫射
--he.Diffuse = color 0 162 237
he.Diffuse =col
-- 反射
he.Reflection = color 255 255 255 ---- 反射的颜色
he.reflection_lockGlossiness = off
he.hilight_glossiness = 0.9
he.reflection_glossiness = 0.97
he.reflection_affectAlpha = 0
-- 折射
he.Refraction = color 240 240 240 ---折射颜色
he.refraction_glossiness = 1.0
he.refraction_ior = 1.6
he.refraction_affectShadows = on
he.refraction_maxDepth = 5
he.refraction_dispersion_on = on
he.refraction_useExitColor = off
he.refraction_fogColor = color 255 255 255
he.refraction_fogBias = 0.2

  return he
)
-- 彩色玻璃

-- -----------------   config   -------------
S_NUM=1
E_NUM=9

-- -----------------   run   -------------
for m=S_NUM to E_NUM do (
  index = m as string
  meditMaterials[m]=(colorGlasses (color (random 0  255) (random 0  255) (random 0  255)))
)
