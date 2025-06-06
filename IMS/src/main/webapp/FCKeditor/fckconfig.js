
/*
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2006 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * "Support Open Source software. What about a donation today?"
 * 
 * File Name: fckconfig.js
 * 	Editor configuration settings.
 * 	See the documentation for more info.
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
 */

FCKConfig.CustomConfigurationsPath = '' ;

FCKConfig.EditorAreaCSS = FCKConfig.BasePath + 'css/fck_editorarea.css' ;

FCKConfig.DocType = '' ;

FCKConfig.BaseHref = '' ;

FCKConfig.FullPage = false ;

FCKConfig.Debug = false ;
FCKConfig.AllowQueryStringDebug = true ;

FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/default/' ;
FCKConfig.PreloadImages = [ FCKConfig.SkinPath + 'images/toolbar.start.gif', FCKConfig.SkinPath + 'images/toolbar.buttonarrow.gif' ] ;

FCKConfig.PluginsPath = FCKConfig.BasePath + 'plugins/' ;


// FCKConfig.Plugins.Add( 'autogrow' ) ;
FCKConfig.AutoGrowMax = 400 ;

FCKConfig.ProtectedSource.Add( /<script[\s\S]*?<\/script>/gi ) ; // <SCRIPT> tags.
// FCKConfig.ProtectedSource.Add( /<%[\s\S]*?%>/g ) ;	// ASP style server side code <%...%>
// FCKConfig.ProtectedSource.Add( /<\?[\s\S]*?\?>/g ) ;	// PHP style server side code
// FCKConfig.ProtectedSource.Add( /(<asp:[^\>]+>[\s|\S]*?<\/asp:[^\>]+>)|(<asp:[^\>]+\/>)/gi ) ;	// ASP.Net style tags <asp:control>

FCKConfig.AutoDetectLanguage	= true ;
FCKConfig.DefaultLanguage		= 'ko' ;
FCKConfig.ContentLangDirection	= 'ltr' ;

FCKConfig.ProcessHTMLEntities	= true ;
FCKConfig.IncludeLatinEntities	= true ;
FCKConfig.IncludeGreekEntities	= true ;

FCKConfig.FillEmptyBlocks	= true ;

FCKConfig.FormatSource		= true ;
FCKConfig.FormatOutput		= true ;
FCKConfig.FormatIndentator	= '    ' ;

FCKConfig.ForceStrongEm = true ;
FCKConfig.GeckoUseSPAN	= false ;
FCKConfig.StartupFocus	= true ;
FCKConfig.ForcePasteAsPlainText	= false ;
FCKConfig.AutoDetectPasteFromWord = true ;	// IE only.
FCKConfig.ForceSimpleAmpersand	= false ;
FCKConfig.TabSpaces		= 0 ;
FCKConfig.ShowBorders	= true ;
FCKConfig.SourcePopup	= false ;
FCKConfig.UseBROnCarriageReturn	= true ;	// IE only.
FCKConfig.ToolbarStartExpanded	= true ;
FCKConfig.ToolbarCanCollapse	= true ;
FCKConfig.IgnoreEmptyParagraphValue = true ;
FCKConfig.PreserveSessionOnFileBrowser = false ;
FCKConfig.FloatingPanelsZIndex = 10000 ;

FCKConfig.ToolbarLocation = 'In' ;

FCKConfig.ToolbarSets["Default"] = [
	['Source','DocProps','-','Save','NewPage','Preview','-','Templates'],
	['Cut','Copy','Paste','PasteText','PasteWord','-','Print','SpellCheck'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField'],
	'/',
	['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
	['OrderedList','UnorderedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Anchor'],
	['Image','Flash','Table','Rule','Smiley','SpecialChar','PageBreak','UniversalKey'],
	'/',
	['Style','FontFormat','FontName','FontSize'],
	['TextColor','BGColor'],
	['FitWindow','-','About']
] ;

//전자결재에서 사용
FCKConfig.ToolbarSets["sign"] = [
                                 	['Source','DocProps','-','Save','NewPage','Preview','-','Templates'],
									['Cut','Copy','Paste','PasteText','PasteWord','-','Print','SpellCheck'],
									['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
									['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField'],
									'/',
									['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
									['OrderedList','UnorderedList','-','Outdent','Indent'],
									['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
									['Link','Unlink','Anchor'],
									['Image','Flash','Table','Rule','Smiley','SpecialChar','PageBreak','UniversalKey'],
									'/',
									['Style','FontFormat','FontName','FontSize'],
									['TextColor','BGColor'],
									['FitWindow','-','About']
                                ] ;
//공정차트에서 사용
FCKConfig.ToolbarSets["chart"] = [
	                            	['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
	                            	['OrderedList','UnorderedList','-','Outdent','Indent'],
	                            	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	                            	['Link','Unlink','Anchor'],
	                            	['Table','Rule','SpecialChar','PageBreak','Form','Checkbox','Radio','TextField','Textarea','Select','Button'],
	                            	'/',
	                            	['Style','FontFormat','FontName','FontSize'],
	                            	['TextColor','BGColor'],
	                            	['FitWindow','-','About']
	                            ] ;
FCKConfig.ToolbarSets["Basic"] = [
	['Bold','Italic','-','OrderedList','UnorderedList','-','Link','Unlink','-','About']
] ;

FCKConfig.ContextMenu = ['Generic','Link','Anchor','Image','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ;

FCKConfig.FontColors = '000000,993300,333300,003300,003366,000080,333399,333333,800000,FF6600,808000,808080,008080,0000FF,666699,808080,FF0000,FF9900,99CC00,339966,33CCCC,3366FF,800080,999999,FF00FF,FFCC00,FFFF00,00FF00,00FFFF,00CCFF,993366,C0C0C0,FF99CC,FFCC99,FFFF99,CCFFCC,CCFFFF,99CCFF,CC99FF,FFFFFF' ;

FCKConfig.FontNames		= '맑은 고딕; 돋움; 굴림; 궁서; 바탕;Arial;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana' ;
FCKConfig.FontSizes		= '1/xx-small;2/x-small;3/small;4/medium;5/large;6/x-large;7/xx-large' ;
FCKConfig.FontFormats	= 'p;div;pre;address;h1;h2;h3;h4;h5;h6' ;

FCKConfig.EnterMode = 'br'; //p|div|br
FCKConfig.ShiftEnterMode = 'p';  //p|div|br

FCKConfig.StylesXmlPath		= FCKConfig.EditorPath + 'fckstyles.xml' ;
FCKConfig.TemplatesXmlPath	= FCKConfig.EditorPath + 'fcktemplates.xml' ;

FCKConfig.SpellChecker			= 'ieSpell' ;	// 'ieSpell' | 'SpellerPages'
FCKConfig.IeSpellDownloadUrl	= 'http://iespell.huhbw.com/ieSpellSetup220647.exe' ;

FCKConfig.MaxUndoLevels = 15 ;

FCKConfig.DisableObjectResizing = false ;
FCKConfig.DisableFFTableHandles = true ;

FCKConfig.LinkDlgHideTarget		= false ;
FCKConfig.LinkDlgHideAdvanced	= false ;

FCKConfig.ImageDlgHideLink		= false ;
FCKConfig.ImageDlgHideAdvanced	= false ;

FCKConfig.FlashDlgHideAdvanced	= false ;

// The following value defines which File Browser connector and Quick Upload 
// "uploader" to use. It is valid for the default implementaion and it is here
// just to make this configuration file cleaner. 
// It is not possible to change this value using an external file or even 
// inline when creating the editor instance. In that cases you must set the 
// values of LinkBrowserURL, ImageBrowserURL and so on.
// Custom implementations should just ignore it.
var _FileBrowserLanguage	= 'jsp' ;	// asp | aspx | cfm | lasso | perl | php | py
var _QuickUploadLanguage	= 'jsp' ;	// asp | aspx | cfm | lasso | php


// Don't care about the following line. It just calculates the correct connector 
// extension to use for the default File Browser (Perl uses "cgi").
var _FileBrowserExtension = _FileBrowserLanguage == 'perl' ? 'cgi' : _FileBrowserLanguage ;
var _QuickUploadExtension = _QuickUploadLanguage == 'perl' ? 'cgi' : _QuickUploadLanguage ;

var _ConnectorServletName = '/FCKeditor/editor/filemanager/browser/default/connectors/jsp/connector';
var _SimUploadServletName = '/FCKeditor/editor/filemanager/upload/simpleuploader';

FCKConfig.LinkBrowser = true ;
FCKConfig.LinkBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Connector=' + _ConnectorServletName ;
FCKConfig.LinkBrowserWindowWidth = FCKConfig.ScreenWidth * 0.7 ;  // 70%
FCKConfig.LinkBrowserWindowHeight = FCKConfig.ScreenHeight * 0.7 ; // 70%

FCKConfig.ImageBrowser = true ;
FCKConfig.ImageBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Image&Connector=' + _ConnectorServletName ;
FCKConfig.ImageBrowserWindowWidth  = FCKConfig.ScreenWidth * 0.7 ; // 70% ;
FCKConfig.ImageBrowserWindowHeight = FCKConfig.ScreenHeight * 0.7 ; // 70% ;

FCKConfig.FlashBrowser = true ;
FCKConfig.FlashBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Flash&Connector=' + _ConnectorServletName ;
FCKConfig.FlashBrowserWindowWidth  = FCKConfig.ScreenWidth * 0.7 ; //70% ;
FCKConfig.FlashBrowserWindowHeight = FCKConfig.ScreenHeight * 0.7 ; //70% ;

FCKConfig.LinkUpload = true ;
FCKConfig.LinkUploadURL = _SimUploadServletName ;
FCKConfig.LinkUploadAllowedExtensions = "" ;   // empty for all
FCKConfig.LinkUploadDeniedExtensions = ".(php|php3|php5|phtml|asp|aspx|ascx|jsp|cfm|cfc|pl|bat|exe|dll|reg|cgi)$" ; // empty for no one

FCKConfig.ImageUpload = true ;
FCKConfig.ImageUploadURL = _SimUploadServletName + '?Type=Image' ;
FCKConfig.ImageUploadAllowedExtensions = ".(jpg|gif|jpeg|png)$" ;  // empty for all
FCKConfig.ImageUploadDeniedExtensions = "" ;       // empty for no one

FCKConfig.FlashUpload = true ;
FCKConfig.FlashUploadURL = _SimUploadServletName + '?Type=Flash' ;
FCKConfig.FlashUploadAllowedExtensions = ".(swf|fla)$" ;  // empty for all
FCKConfig.FlashUploadDeniedExtensions = "" ;     // empty for no one


FCKConfig.SmileyPath	= FCKConfig.BasePath + 'images/smiley/msn/' ;
FCKConfig.SmileyImages	= ['regular_smile.gif','sad_smile.gif','wink_smile.gif','teeth_smile.gif','confused_smile.gif','tounge_smile.gif','embaressed_smile.gif','omg_smile.gif','whatchutalkingabout_smile.gif','angry_smile.gif','angel_smile.gif','shades_smile.gif','devil_smile.gif','cry_smile.gif','lightbulb.gif','thumbs_down.gif','thumbs_up.gif','heart.gif','broken_heart.gif','kiss.gif','envelope.gif'] ;
FCKConfig.SmileyColumns = 8 ;
FCKConfig.SmileyWindowWidth		= 320 ;
FCKConfig.SmileyWindowHeight	= 240 ;