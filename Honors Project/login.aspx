<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Honors_Project.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <asp:Login ID = "Login1" runat = "server" OnAuthenticate="ValidateUser" />
                <br /><br /><hr />
                <div>Don't have an account? <a href="register.aspx">Click here.</a></div>
            </AnonymousTemplate>
            <LoggedInTemplate>
                <div>You are already logged in. Redirecting to main page...</div><br />
                <a href="index.aspx">Click here if you are not redirected automatically.</a>
            </LoggedInTemplate>
        </asp:LoginView>
    </form>
</body>
</html>
