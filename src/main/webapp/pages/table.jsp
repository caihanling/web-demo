<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link
	href="<%=request.getContextPath()%>/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath()%>/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="<%=request.getContextPath()%>/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="<%=request.getContextPath()%>/bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath()%>/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>


    <![endif]-->

<style type="text/css">
#side-menu li {
	border: none;
}
</style>





</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0;background-color:rgba(176,226,255,0.2);">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">SB Admin v2.0</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> ${uname }</a></li>
					<li class="divider"></li>
					<li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links --> </nav>

		<!--去掉id="page-wrapper"，改变布局,左边无菜单栏 -->
		<div style="margin-left: 3%; margin-right: 3%">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" style="border: none">Tables</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default" style="border: none">
						<div class="panel-body">
							<div class="dataTable_wrapper">

								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th width="8%">number</th>
											<th width="20%">picture</th>
											<th>describe</th>
											<th width="8%">user</th>
											<th width="14%">details</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="detail">
											<tr>
												<td align="center">${detail.did}</td>
												<td><a id="imgClick" href="#"> <img src="${detail.image}" id="imageresource" width="70px"
														height="70px" onclick="imagePreview(this)">
												</a></td>
												<c:if test="${detail.times==1 }">
													<td><span style="background-color: #5cb85c">${detail.describe}</span></td>
												</c:if>
												<c:if test="${detail.times==2 }">
													<td><span style="background-color: #5bc0de">${detail.describe}</span></td>
												</c:if>
												<c:if test="${detail.times==3 }">
													<td><span style="background-color: #f0ad4e">${detail.describe}</span></td>
												</c:if>
												<td align="center" style="padding-top: 2%">${detail.uname}</td>
												<td align="center" style="padding-top: 2%">
												<a href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#basicModal" onclick="update(this);">
												 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Update</a> 
												<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteModal" onclick="deleteObj(this);">
												 <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>delete</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>

						</div>

					</div>

				
					<!-- image Modal begin -->
					<div id="imagemodal" class="modal fade" id="myModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header" style="border: none">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div align="center">
										<img src="" id="imagepreview" width="400px" height="300px">
									</div>
								</div>

							</div>
						</div>
					</div>

				<!--delete Modal begin -->
                <div id="delete" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="deleteModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <h3>确定要删除嘛...?</h3>
                            </div>
                            <div class="modal-footer">
                                <a href="#" class="btn btn-primary" name='yes'>Yes</a>
								<a href="#" class="btn" data-dismiss="modal" aria-hidden="true">No</a>
                            </div>
                        </div>
                    </div>
                </div>
					<!--table modal begin -->
					<div class="modal fade" id="tableModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Modal title</h4>
								</div>
								<div class="modal-body">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th width="10%">number</th>
												<th width="20%">picture</th>
												<th width="70%">describe</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="text" id="number" class="form-control"
													disabled="" name="did"></td>
												<td><img src="" id="imageshow" width="70px"
													height="70px"></td>
												<td><input type="text" id="describe"
													class="form-control" name="describe"></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<a href="#" class="btn btn-primary" name='save'>Ok</a>
									<a href="#" class="btn" data-dismiss="modal" aria-hidden="true">Cancel</a>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="<%=request.getContextPath()%>/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="<%=request.getContextPath()%>/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=request.getContextPath()%>/dist/js/sb-admin-2.js"></script>



	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});

		});

// 		$("#imgClick").on("click", function() {
// 			console.log("111");
// 			$('#imagepreview').attr('src', $('#imageresource').attr('src'));
// 			$('#imagemodal').modal('show');
// 		});
		
		function imagePreview(){
			console.log("111");
			$('#imagepreview').attr('src', $('#imageresource').attr('src'));
			$('#imagemodal').modal('show');
		}

		function update(obj) {
			var tds = $(obj).parent().parent().find('td');
			$('#number').val(tds.eq(0).text());
			$('#imageshow').attr('src', $('#imageresource').attr('src'));
			$('#describe').val(tds.eq(2).text());
			$('#tableModal').modal('show');

			$("a[name='save']").click(
					function() {
						var did = $(this).parents("#tableModal").find( "input[name='did']").val();
						var describe = $(this).parents("#tableModal").find( "input[name='describe']").val();
						window.location = "updateServlet?describe=" + describe + "&did=" + did;
						$("#tableModal").modal("hide");
					});

		}

		function deleteObj(obj) {
			var tds = $(obj).parent().parent().find('td');
			var did = tds.eq(0).text();
			$('#delete').modal('show');
			
			$("a[name='yes']").click(
				function() {
					console.log(did);
					window.location = "deleteDetailServlet?did=" + did;
			});
		}
	</script>


</body>

</html>