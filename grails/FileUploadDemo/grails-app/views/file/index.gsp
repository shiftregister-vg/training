<html>
	<head>
		<title>Choose a File</title>
		<meta name="layout" content="main" />
	</head>
	<body>
		<div id="pageBody">
			<h1>Select a file to upload</h1>
			
			<g:form action="upload" method="post" enctype="multipart/form-data">
				<input type="file" name="myFile" />
				<g:submitButton name="submit" value="Upload" />
			</g:form> 
		</div>
	</body>
</html>