<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eVendor Post</title>
<link rel="stylesheet" href="css/style.css">
<script src="js/selector.js"></script>
</head>
<body>
	<div class="createPosting-wrapper">
		<form id="createPosting-form" action="postings" method="GET">
			<div>
				<label for="title">Title</label><br> <input type="text"
					name="title" id="title" placeholder="Enter Title ..." required>
			</div>

			<div>
				<label for="category">Category</label><br> <select
					name="category" id="category" required>
					<option value="Other">Select a Category</option>
				</select>
			</div>

			<div>
				<label for="region">Region</label><br> <select name="region"
					id="region" required>
					<option value="None">Select a Region</option>
				</select>
			</div>

			<div>
				<label for="price">Price</label><br> <input type="number"
					name="price" id="price" min=0 step=0.01 required>
			</div>

			<button type="submit" name="submit" value="create">Create</button>
		</form>
	</div>
</body>
</html>