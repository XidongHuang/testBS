
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" type="image/x-icon" href="icon/favicon.ico" />
<title>ESL Scores Management System</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">

    <link rel="stylesheet" href="assets/bootstrap-table/src/bootstrap-table.css">
    <link rel="stylesheet" href="css/fileUpload.css">

    <script src="assets/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="assets/bootstrap-table/src/bootstrap-table.js"></script>
    <script src="js/ga.js"></script>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
               
            </button>
            <a class="navbar-brand" href="http://www.algomau.ca">Algoma University</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">User</a></li>
                <li><a href="#">Date</a></li>
                <li><a href="#">Logout</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">Scores <span class="sr-only">(current)</span></a></li>
                <!--<li><a href="#">Scores</a></li>-->
                <li><a href="#">Analysis</a></li>
                <li><a href="#">Teacher Evaluation</a></li>
            </ul>

        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <!--<h1 class="page-header">Dashboard</h1>-->

            <div class="row">
                <div class="col-xs-6 col-sm-6 placeholder">
                    <!--<button type="button" class="btn btn-success btn-group-lg">&nbsp&nbspSave&nbsp&nbsp</button>-->
                    <!--<span class="text-muted">Something else</span>-->

                    <div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
                       <form action="handleServlet" method="post" enctype="multipart/form-data">
						<span class="btn btn-primary btn-lg btn-file" id="clickSelectFile">Select File<input type="file" id="selectFile" name="file" value="${sessionScope.lNc}" disabled></span>
                        <button type="submit" id="uploadFile" name="levelNcourseUpload" value="0" class="btn btn-lg btn-info" disabled>Upload</button>
                       </form>
                    </div>


                </div>
                <div class="col-xs-6 col-sm-6 placeholder" position="fixed">

                    <div class="btn-group btn-group" role="group" aria-label="Large button group">
                        <button type="button" class="btn btn-danger btn-group-lg"  aria-haspopup="true"
                                aria-expanded="false" id="level">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="font-size:18px;font-weight:400;color:white" id="levelBtn" value="0">
                            Select ESL Level
                            <span class="caret"></span>
                            </a>
                        <ul class="dropdown-menu" id="levelDrop">
                            <li><a href="#" id="level1" value="L1">Level 1</a></li>
                            <li><a href="#" id="level2" value="L2">Level 2</a></li>
                            <li><a href="#" id="level3" value="L3">Level 3</a></li>
                            <li><a href="#" id="level4" value="L4">Level 4</a></li>
                            <li><a href="#" id="level5" value="L5">Level 5</a></li>
                        </ul>
                        </button>
                        <button type="button" class="btn btn-warning btn-group-lg" aria-haspopup="true"
                                aria-expanded="false" id="course">
                           <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="font-size:18px;font-weight:400;color:white" id="courseBtn" value="Z">   
                            Select Course
                            </a>
                            <span class="caret"></span>
                        <ul class="dropdown-menu" id="courseDrop">
                            <li><a href="#" id="Grammar" value="G">Grammar</a></li>
                            <li><a href="#" id="Listening" value="L">Listening</a></li>
                            <li><a href="#" id="Speaking" value="S">Speaking</a></li>
                            <li><a href="#" id="Writing" value="W">Writing</a></li>
                        </ul>
                        </button>

                    </div>
                        <button type="button" class="btn btn-info btn-lg">Overall</a></button>

                </div>
            </div>


            <div>
                <div class="container" id="iframeContainer" hidden>
                    <iframe src="table.html" frameborder="0" width="900px" height="600px" id="iframe" ></iframe>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Placed at the end of the document so the pages load faster -->
<script>
 
$(document).on('change', '.btn-file :file', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
}); 
 
 
$(document).ready( function() {
    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
        console.log(numFiles);
        console.log(label);
    });
});
 
</script>

<!-- prepare load main page -->
<script>
var levelNCourse = document.getElementById("selectFile"), lNc;
lNc = levelNCourse.getAttribute("value");
if(lNc != null){
	if(lNc == "L1G"){
		
		document.getElementById("iframe").src = "L1Grammar.html";
		document.getElementById("selectFile").disabled=false;
		document.getElementById("uploadFile").disabled=false;
		$("#iframeContainer").show("slow");
	}
	
	
}


</script>

<!-- show dropdown button selected value -->
<script>
$(function(){

    $("#courseDrop").on('click', 'li a', function(){
      $("#courseBtn:first-child").text($(this).text());
      $("#courseBtn:first-child").attr("value",$(this).attr("value"));
   });
    
    $("#levelDrop").on('click', 'li a', function(){
      $("#levelBtn:first-child").text($(this).text());
      $("#levelBtn:first-child").attr("value",$(this).attr("value"));
   });

});

</script>

<!-- Adding events into select level and select course button group -->
<script>
var l = null;
var c = null;
var lNcTag = null;

$("#levelDrop").click(function(){
	 l = $("#level #levelBtn").attr("value");
	 if(l != null && c!= null){
		lNcTag = l+c;
		
		
		
		document.getElementById("selectFile").disabled=false;
		document.getElementById("uploadFile").disabled=false;
		
		
		if(l == "L1" && c == "G"){
			document.getElementById("iframe").src = "L1Grammar.html";	
			$("#iframeContainer").show("slow");
			
		}
	}
	
});

$("#courseDrop").click(function(){
	 c = $("#course #courseBtn").attr("value");
	if(l != null && c!= null){
		lNcTag = l+c;
		
		$.ajax(
			{
				url: 'loadServlet',
				data:{'levelNcourse': JSON.stringify(lNcTag)},
				type: 'post',
				cache: false,
				success: function(msg){
					alert(msg);
				},
				error: function(xhr,status,errMsg){
					
					alert("NO!");
					
				}
				
			}		
		
		);
		
		
		
		document.getElementById("selectFile").disabled=false;
		document.getElementById("uploadFile").disabled=false;
		
		if(l == "L1" && c == "G"){
		document.getElementById("iframe").src = "L1Grammar.html";	
		$("#iframeContainer").show("slow");
		
		}
		if(l == "L2" && c == "W"){
		document.getElementById("iframe").src = "L2RandW.html";	
		$("#iframeContainer").show("slow");
		
		}
	}
});


</script>


<!-- change submit button value, for identifying level and course -->
<script>
$("#clickSelectFile").click(function(){
	var l = $("#level #levelBtn").attr("value");
	var c = $("#course #courseBtn").attr("value");
	var lNcTag = l+c;
	$("#uploadFile").attr("value",lNcTag)
	
});

</script>

<!-- Get data after level and course are selected by using ajaz -->
<script>



</script>


<!--<script src="js/bootstrap.min.js"></script>-->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>