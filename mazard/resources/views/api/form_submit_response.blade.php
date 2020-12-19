<!DOCTYPE html>
<html>
<head>
	<title>Submit Form Response</title>
	<style type="text/css">
		body{
			background:#000;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%,-50%);
			text-align: center;
		}
		.success{
			color:green;
		}
		.failed{
			color:red;
		}
		p{
			color:#fff;
		}
	</style>
</head>
<body>
  @if(Request::get('status') == 'success')
  <h1 class="success">Successfully added</h1>
  @else
   <h1 class="failed">Failed to add</h1>
   <p>Please try again</p>
  @endif
</body>
</html>