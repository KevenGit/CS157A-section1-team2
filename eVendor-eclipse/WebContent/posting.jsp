<jsp:include page="header.html"/>

<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Posting Form</title>
    <script src="js/selector.js"></script>
</head>

<!--The form -->
<body class="post new-form">
    <section class="body">
        <form id="postingForm"
              action="processPosting.jsp" method="post">
            <table border="0" align="center">
                <tr><td>Region</td><td>Category</td></tr>
                <tr><td><select name="region" id="region"><option value="" selected="selected">Select a region</option></select>&nbsp;</td>
                    <!--<td><select name="location" id="location"><option value="" selected="selected">Please select a region first</option></select>&nbsp;</td>-->
                    <td><select name="category" id="category"><option value="" selected="selected">Please select a category</option></select>&nbsp;</td>
                </tr>
                <tr><td>Condition</td><td>Make</td><td>Model</td></tr>
                <tr>
                    <td><input type="text" name="condition" value="" maxlength="30" size="33%"/>&nbsp;</td>
                    <td><input type="text" name="make" value="" maxlength="30" size="33%" /></td>
                    <td><input type="text" name="model" value="" maxlength="30" size="33%" />&nbsp;</td>
                </tr>
                <tr><td colspan="2">Posting Title</td><td>Price $</td></tr>
                <tr>
                    <td colspan="2"><input name="postingTitle" value="" type="text" autofocus="autofocus" id="postingTitle" maxlength="70" size="70%"/>&nbsp;</td>
                    <td><input type="number" name="price" value="" maxlength="11" size="30%"/></td>
                </tr>
                <tr><td colspan="3">Description</td></tr>
                <tr><td colspan="3" size="100%">
                    <textarea name="postingBody" placeholder="" id="postingBody" rows="10" cols="94%"></textarea>
                </td></tr>
                <tr><td colspan="3" align="right"><input type="submit" value="Submit"></td></tr>
            </table>
        </form>
    </section>
</body>
</html>
<jsp:include page="footer.html"/>