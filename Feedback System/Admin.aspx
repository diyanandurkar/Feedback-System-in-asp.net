<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Admin.aspx.cs"
Inherits="FeedbackSystem.Admin" %>

<!DOCTYPE html>

<html>

<head runat="server">

<title>Admin</title>

<link href="Style.css" rel="stylesheet"/>

</head>

<body>

<form id="form1" runat="server">

<div class="box">

<h2>All Feedback</h2>

<asp:GridView
ID="GridView1"
runat="server"
AutoGenerateColumns="False"
DataKeyNames="Id"
OnRowDeleting="GridView1_RowDeleting">

<Columns>

<asp:BoundField DataField="Id" HeaderText="ID"/>

<asp:BoundField DataField="Name" HeaderText="Name"/>

<asp:BoundField DataField="Email" HeaderText="Email"/>

<asp:BoundField DataField="Rating" HeaderText="Rating"/>

<asp:BoundField DataField="Feedback" HeaderText="Feedback"/>

<asp:CommandField ShowDeleteButton="True"/>

</Columns>

</asp:GridView>

</div>

</form>

</body>

</html>