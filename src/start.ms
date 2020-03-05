-- -----------------     config     ------------
PROJECT_PATH="D:\\code-store\\maxscript\\3d-model-cup"
SCRIPT_PATH=PROJECT_PATH+"\\src\\"

-- -----------------     function   ------------
-- open, run,free and close ms file
fn importMs file =(
    local module=undefined
	local size=undefined
	local hasFile=undefined
	hasFile=doesFileExist cupMax
	if hasFile==undefined then return hasFile
	size=getFileSize file
	if size == "0L" then(
		print file+"is empty"
	)else(
		--getFileSize file
		module=openFile file
		if module!=undefined then(
			execute module
			free module
			close module
		)
	)
)

-- -----------------  import module ------------
fun=SCRIPT_PATH+"function.ms"
file=SCRIPT_PATH+"data-construt-set.ms"
--getFileSize file
cupMax=SCRIPT_PATH+"cup-max.ms"
cupMat=SCRIPT_PATH+"cup-mat.ms"
cupShot=SCRIPT_PATH+"cup-screenshot.ms"
modelExportMs=SCRIPT_PATH+"cup-export.ms"
importMs fun
importMs file
importMs cupMax
importMs cupMat
importMs cupShot
importMs modelExportMs
