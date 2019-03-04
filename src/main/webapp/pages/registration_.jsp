<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration new user</title>
</head>
<body>

<a href="${pageContext.request.contextPath}/">Home</a> <br/>

<br/>
<font size="5" >Registration new user</font>
<br/>
<br/>

<font color="red" >${WarningMessage}</font>
<br/>
<br/>

Please fill the form (use only latin letters)<br/>
<br/>

<form method="post" action="${pageContext.request.contextPath}/registration">

    <table>
        <tr>
            <td> name:</td> <td> <input type="text" name="name" required pattern="^[a-zA-Z]+$" autofocus> </td>
        </tr>
        <tr>
            <td> login:</td> <td> <input type="text" name="login" required pattern="^[a-zA-Z]+$" > </td>
        </tr>
        <tr>
            <td> password:</td> <td> <input type="password" name="pass" required pattern="^[a-zA-Z0-9]+$"> </td>
        </tr>
        <tr>
            <td>        </td> <td> <input type="submit" value="Submit"/> </td>
        </tr>
    </table>

</form>


</body>
</html>