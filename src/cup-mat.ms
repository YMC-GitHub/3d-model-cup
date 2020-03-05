-- -----------------   function   -------------
-- 随机颜色
fn randomColor arr =(
  RANDOM_NUM=1
  if( arr.count>1)then(RANDOM_NUM=random 1  arr.count)
  return arr[RANDOM_NUM]
)
-- 随机图片
fn randomImage arr =(
  return randomColor arr
)
fn plainGlasses col=(
he= VRayMtl ()
-- 漫射
-- he.Diffuse = color 128 187 188
he.Diffuse = col
-- 反射
he.Reflection = color 20 20 20 -- 反射的颜色
he.reflection_lockGlossiness = off
he.hilight_glossiness = 0.95 -- 高光光泽度
he.reflection_glossiness = 0.9 -- 反射光泽度
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

-- 黑色玻璃
fn blackGlasses col=(
-- black glasses
he= VRayMtl ()
-- 漫射
--he.Diffuse = color 5 5 5
he.Diffuse =col
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

-- 透明玻璃
fn transparent_glasses = (
he= VRayMtl ()
--he.name="透明玻璃001"
-- 漫射
he.Diffuse = color 5 5 5
-- 反射
he.Reflection = color 255 255 255 -- 反射的颜色rgb
he.reflection_lockGlossiness = off
he.hilight_glossiness = 1.0 -- 高光光泽度
he.reflection_glossiness = 1.0 -- 反射光泽度
he.reflection_fresnel = on --涅尔反射
he.reflection_subdivs = 32 --细分
he.reflection_maxDepth = 5 --最大深度
he.reflection_affectAlpha = 0 --影响通道
-- 折射
he.Refraction = color 255 255 255 ---折射的颜色rgb
return he
)

-- 半透玻璃（通过标准材质）
fn half_transparent_glasses=(
he=standard()
--he.name="半透明的001"
-- 漫射
he.ambient = color 255 150 150 -- 环境光
he.Diffuse = color 255 150 150 -- 漫反射
he.useSelfIllumColor = on -- 自发光
he.selfIllumColor = color 255 255 255 --自发光颜色
he.opacity = 25 --不透明度
return he
)

-- 高光陶瓷
fn hilight_porcelain col=(
he=VRayMtl ()
--he.name="高光陶瓷001"
--he.diffuse=(color 70 146 205)
he.diffuse=col
he.diffuse_roughness=0.0
he.selfIllumination=(color 0 0 0)
he.selfIllumination_gi=true
he.selfIllumination_multiplier=1.0
he.reflection=(color 255 255 255)
he.reflection_glossiness=0.98
he.hilight_glossiness=1.0
he.reflection_subdivs=16
he.reflection_fresnel=true
he.reflection_maxDepth=5
he.reflection_exitColor=(color 0 0 0)
he.reflection_useInterpolation=false
he.reflection_ior=1.6
he.reflection_lockGlossiness=true
he.reflection_lockIOR=true
he.reflection_dimDistance=1000.0
he.reflection_dimDistance_on=false
he.reflection_dimDistance_falloff=0.0
he.reflection_affectAlpha=0
he.refraction=(color 0 0 0)
he.refraction_glossiness=1.0
he.refraction_subdivs=8
he.refraction_ior=1.6
he.refraction_fogColor=(color 255 255 255)
he.refraction_fogMult=1.0
he.refraction_fogBias=0.0
he.refraction_affectShadows=false
he.refraction_affectAlpha=0
he.refraction_maxDepth=5
he.refraction_exitColor=(color 0 0 0)
he.refraction_useExitColor=false
he.refraction_useInterpolation=false
he.refraction_dispersion=50.0
he.refraction_dispersion_on=false
he.translucency_on=0
he.translucency_thickness=10000.0
he.translucency_scatterCoeff=0.0
he.translucency_fbCoeff=1.0
he.translucency_multiplier=1.0
he.translucency_color=(color 255 255 255)
he.brdf_type=1
he.anisotropy=0.0
he.anisotropy_rotation=0.0
he.anisotropy_derivation=0
he.anisotropy_axis=2
he.anisotropy_channel=1
he.soften=0.0
he.brdf_fixDarkEdges=true
he.gtr_gamma=2.0
he.gtr_oldGamma=false
he.brdf_useRoughness=false
he.option_traceDiffuse=false
he.option_traceReflection=true
he.option_traceRefraction=true
he.option_doubleSided=true
he.option_reflectOnBack=false
he.option_useIrradMap=true
he.refraction_fogUnitsScale_on=true
he.option_traceDiffuseAndGlossy=1
he.option_cutOff=0.001
he.preservationMode=0
he.option_environment_priority=0
he.effect_id=0
he.override_effect_id=false
he.option_clampTextures=true
he.option_opacityMode=0
he.option_glossyFresnel=false
he.texmap_diffuse=undefined
he.texmap_diffuse_on=true
he.texmap_diffuse_multiplier=100.0
he.texmap_reflection=undefined
he.texmap_reflection_on=false
he.texmap_reflection_multiplier=10.0
he.texmap_refraction=undefined
he.texmap_refraction_on=true
he.texmap_refraction_multiplier=100.0
he.texmap_bump=undefined
he.texmap_bump_on=false
he.texmap_bump_multiplier=0.2
he.texmap_reflectionGlossiness=undefined
he.texmap_reflectionGlossiness_on=true
he.texmap_reflectionGlossiness_multiplier=15.0
he.texmap_refractionGlossiness=undefined
he.texmap_refractionGlossiness_on=true
he.texmap_refractionGlossiness_multiplier=100.0
he.texmap_refractionIOR=undefined
he.texmap_refractionIOR_on=true
he.texmap_refractionIOR_multiplier=100.0
he.texmap_displacement=undefined
he.texmap_displacement_on=true
he.texmap_displacement_multiplier=100.0
he.texmap_translucent=undefined
he.texmap_translucent_on=true
he.texmap_translucent_multiplier=100.0
he.texmap_environment=undefined
he.texmap_environment_on=true
he.texmap_hilightGlossiness=undefined
he.texmap_hilightGlossiness_on=true
he.texmap_hilightGlossiness_multiplier=100.0
he.texmap_reflectionIOR=undefined
he.texmap_reflectionIOR_on=true
he.texmap_reflectionIOR_multiplier=100.0
he.texmap_opacity=undefined
he.texmap_opacity_on=true
he.texmap_opacity_multiplier=100.0
he.texmap_roughness=undefined
he.texmap_roughness_on=true
he.texmap_roughness_multiplier=100.0
he.texmap_anisotropy=undefined
he.texmap_anisotropy_on=true
he.texmap_anisotropy_multiplier=100.0
he.texmap_anisotropy_rotation=undefined
he.texmap_anisotropy_rotation_on=true
he.texmap_anisotropy_rotation_multiplier=100.0
he.texmap_refraction_fog=undefined
he.texmap_refraction_fog_on=false
he.texmap_refraction_fog_multiplier=100.0
he.texmap_self_illumination=undefined
he.texmap_self_illumination_on=true
he.texmap_self_illumination_multiplier=100.0
he.reflect_minRate=-1
he.reflect_maxRate=-1
he.reflect_interpSamples=20
he.reflect_colorThreshold=0.25
he.reflect_normalThreshold=0.4
he.refract_minRate=-1
he.refract_maxRate=-1
he.refract_interpSamples=20
he.refract_colorThreshold=0.25
he.refract_normalThreshold=0.4
return he
)
-- -----------------   config   -------------
PROJECT_PATH="D:\\code-store\\maxscript\\3d-model-cup"
TEXTURE_PATH=PROJECT_PATH+"\\dist\\texture\\"
MAT_PATH=PROJECT_PATH+"\\dist\\material\\"
MAT_FILE=MAT_PATH+"cup.mat"

-- -----------------   type   -------------
COLOR_ARR=#()
-- 纹理图片
IMAGE_ARR=#()
S_NUM=1
E_NUM=9

for m=S_NUM to E_NUM do (
index = m as string
file=TEXTURE_PATH+"texture0"+index+".jpg"
IMAGE_ARR[m]=file
)
S_NUM=1
E_NUM=IMAGE_ARR.count --24
--E_NUM=9

-- 标准材质
/*
for m=S_NUM to E_NUM do (
index = m as string
meditmaterials[m] = standard()
)
*/
/*
-- 贴图材质
for m=S_NUM to E_NUM do (
index = m as string
meditmaterials[m] = standard()
meditmaterials[m].name="texture0"+index
meditmaterials[m].diffusemap = bitmaptexture filename:IMAGE_ARR[m]
)
*/
/*
-- 颜色材质
for m=S_NUM to E_NUM do (
  index = m as string
  meditmaterials[m] = standard()
  meditmaterials[m].name="color0"+index
  --meditmaterials[m].diffuse = IMAGE_ARR[m]
  meditmaterials[m].diffuse = (color (random 0  255) (random 0  255) (random 0  255)))
)
*/
/*
--普通玻璃
--meditMaterials[1]=(plainGlasses (color 0 162 237))
for m=S_NUM to E_NUM do (
  index = m as string
  meditMaterials[m]=(plainGlasses (color (random 0  255) (random 0  255) (random 0  255)))
)
*/
/*
-- 彩色玻璃
--meditMaterials[1]=(colorGlasses (color 0 162 237))
for m=S_NUM to E_NUM do (
  index = m as string
  meditMaterials[m]=(colorGlasses (color (random 0  255) (random 0  255) (random 0  255)))
)
*/
/*
-- 黑色玻璃
--meditMaterials[1]=(blackGlasses (color 0 162 237))
for m=S_NUM to E_NUM do (
  index = m as string
  meditMaterials[m]=(blackGlasses (color (random 0  255) (random 0  255) (random 0  255)))
)
*/

-- 高光陶瓷
--meditMaterials[1]=(hilight_porcelain (color 0 162 237))
for m=S_NUM to E_NUM do (
  index = m as string
  meditMaterials[m]=(hilight_porcelain (color (random 0  255) (random 0  255) (random 0  255)))
)



-- 透明玻璃
/*
meditMaterials[1]=transparent_glasses()
*/

/*
-- 半透玻璃
meditMaterials[1]=half_transparent_glasses()
*/

-- 赋予物体材质
mybox.material = meditmaterials[random 1 E_NUM]
showtexturemap mybox.material on
Shape001.material = meditmaterials[random 1 E_NUM]
showtexturemap Shape001.material on

-- 导出到材质库
saveMaterialLibrary MAT_FILE
-- 导入某材质库
-- loadMaterialLibrary MAT_FILE

-- getMatLibFileName()
