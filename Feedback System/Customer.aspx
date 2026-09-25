<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Customer.aspx.cs"
    Inherits="FeedbackSystem.Customer" %>

<!DOCTYPE html>

<html>

<head runat="server">

    <title>Customer Feedback</title>

    <link href="Style.css" rel="stylesheet" type="text/css" />

</head>

<body>

<form id="form1" runat="server">

<div class="container">

<h1>Customer Feedback</h1>

<asp:ValidationSummary
    ID="ValidationSummary1"
    runat="server"
    CssClass="validation-summary"
    HeaderText="Please correct the following errors:" />

<label>Name</label>

<asp:TextBox
    ID="txtName"
    runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator
    ID="rfvName"
    runat="server"
    ControlToValidate="txtName"
    ErrorMessage="Name is required."
    CssClass="error">
</asp:RequiredFieldValidator>

<label>Email</label>

<asp:TextBox
    ID="txtEmail"
    runat="server"
    TextMode="Email">
</asp:TextBox>

<asp:RequiredFieldValidator
    ID="rfvEmail"
    runat="server"
    ControlToValidate="txtEmail"
    ErrorMessage="Email is required."
    CssClass="error">
</asp:RequiredFieldValidator>

<asp:RegularExpressionValidator
    ID="revEmail"
    runat="server"
    ControlToValidate="txtEmail"
    ValidationExpression="\w+([-.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
    ErrorMessage="Enter a valid email."
    CssClass="error">
</asp:RegularExpressionValidator>

<label>Rating (1-5)</label>

<asp:TextBox
    ID="txtRating"
    runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator
    ID="rfvRating"
    runat="server"
    ControlToValidate="txtRating"
    ErrorMessage="Rating is required."
    CssClass="error">
</asp:RequiredFieldValidator>

<asp:RangeValidator
    ID="rvRating"
    runat="server"
    ControlToValidate="txtRating"
    MinimumValue="1"
    MaximumValue="5"
    Type="Integer"
    ErrorMessage="Rating must be between 1 and 5."
    CssClass="error">
</asp:RangeValidator>

<label>Feedback</label>

<asp:TextBox
    ID="txtFeedback"
    runat="server"
    TextMode="MultiLine"
    Rows="5">
</asp:TextBox>

<asp:RequiredFieldValidator
    ID="rfvFeedback"
    runat="server"
    ControlToValidate="txtFeedback"
    ErrorMessage="Feedback is required."
    CssClass="error">
</asp:RequiredFieldValidator>

<asp:Button
    ID="btnSubmit"
    runat="server"
    Text="Submit Feedback"
    OnClick="btnSubmit_Click" />

<br /><br />

<asp:Label
    ID="lblMessage"
    runat="server"
    ForeColor="Green">
</asp:Label>

</div>

</form>

</body>

</html>