<?php


// default redirection
$url = 'callback.html?callback_func='.$_REQUEST["callback_func"];
$bSuccessUpload = is_uploaded_file($_FILES['Filedata']['tmp_name']);

// SUCCESSFUL
if(bSuccessUpload) {
	$tmp_name = $_FILES['Filedata']['tmp_name'];
	$name = $_FILES['Filedata']['name'];

	$filename_ext = strtolower(array_pop(explode('.',$name)));
	$allow_file = array("jpg", "png", "bmp", "gif");

	$app_ext = end(explode('.', $name));
	$misec = explode(' ', microtime());
	$file_name = sprintf("%u" , crc32($name  . time() . rand())).'_'.$misec[1].'.'.$app_ext;
	$name = $file_name;

	if(!in_array($filename_ext, $allow_file)) {
		$url .= '&errstr='.$name;
	} else {
		$uploadDir = "../../../../../uploads/smarteditor/";
		if(!is_dir($uploadDir)){
			mkdir($uploadDir, 0777);
		}

		$newPath = $uploadDir.urlencode($file_name);

		@move_uploaded_file($tmp_name, $newPath);

		$url .= "&bNewLine=true";
		$url .= "&sFileName=".urlencode(urlencode($name));
		$url .= "&sFileURL=".$NO_IS_SUBDIR."/uploads/smarteditor/".urlencode(urlencode($name));
		$url .= "&sUploadFile=".urlencode(urlencode($name));
	}
}
// FAILED
else {
	$url .= '&errstr=error';
}

header('Location: '. $url);
?>