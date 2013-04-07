//FCKConfig.AutoDetectLanguage	= false ;

FCKConfig.EditorAreaCSS = FCKConfig.BasePath + 'css/fck_editorarea.css' ;
FCKConfig.EditorAreaStyles = '' ;
FCKConfig.ToolbarComboPreviewCSS = '' ;
//编辑器工具栏
FCKConfig.ToolbarSets["zfxy"] = [
	['Save','Templates','Cut'],['Copy','Paste','-','PasteText','PasteWord'],
	['Undo','Redo','-','Find','-','SelectAll','RemoveFormat'],
	['Image','Flash'],	['Table'],
	'/',
	['Bold','Italic','Underline'],
	['OrderedList','UnorderedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Rule','SpecialChar'],['FitWindow']
	// No comma for the last row.
] ;
FCKConfig.ToolbarSets["photo"] = [
	['Image','FitWindow']
	// No comma for the last row.
] ;
FCKConfig.ToolbarSets["file"] = [
	['Link']
	// No comma for the last row.
] ;
FCKConfig.EnterMode = 'br' ;			// p | div | br
FCKConfig.ShiftEnterMode = 'p' ;	// p | div | br
//上传文件类型
FCKConfig.LinkUploadAllowedExtensions	= ".(7z|avi|bmp|doc|fla|flv|gif|gzip|jpeg|jpg||pdf|png|ppt|pxd|rar|swf|txt|zip|xls)$" ;
