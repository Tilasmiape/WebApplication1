<%@ Page Title="User Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="WebApplication1.User" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .user-title { font-size: 1.1rem; font-weight: 700; color: #0E2540; margin-bottom: 14px; }
    .grid-wrap  { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; }
    .form-wrap  { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); max-width: 500px; }
    table       { font-size: 0.82rem !important; }
    th, td      { font-size: 0.82rem !important; padding: 6px 10px !important; }
    input[type=text], input[type=password] { font-size: 0.82rem !important; padding: 4px 8px !important; }
    .btn, input[type=submit], input[type=button] { font-size: 0.8rem !important; }
</style>

<main style="padding: 10px 0;">

    <!-- GRIDVIEW — List of all users -->
    <div class="grid-wrap">
        <p class="user-title"> Users List</p>
        <asp:GridView ID="GridView2" runat="server"
            DataSourceID="SqlDataSource3"
            AutoGenerateColumns="False"
            DataKeyNames="USER_ID"
            CellPadding="4"
            ForeColor="#333333"
            GridLines="None"
            Width="100%">
            <AlternatingRowStyle BackColor="#F5F8FF" />
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" Font-Size="Small" />
            <RowStyle BackColor="#FAFCFF" Font-Size="Small" />
            <Columns>
                <asp:BoundField DataField="USER_ID"      HeaderText="ID"           ReadOnly="True" />
                <asp:BoundField DataField="USERNAME"     HeaderText="Username" />
                <asp:BoundField DataField="FNAME"        HeaderText="First Name" />
                <asp:BoundField DataField="SURNAME"      HeaderText="Last Name" />
                <asp:BoundField DataField="EMAIL"        HeaderText="Email" />
                <asp:BoundField DataField="PASSWORD"     HeaderText="Password" />
                <asp:BoundField DataField="ADDRESS"      HeaderText="Address" />
                <asp:BoundField DataField="PHONE_NUMBER" HeaderText="Phone" />
                <asp:BoundField DataField="ROLE"         HeaderText="Role" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT * FROM &quot;USERS&quot;"
            InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;,&quot;USERNAME&quot;,&quot;FNAME&quot;,&quot;SURNAME&quot;,&quot;EMAIL&quot;,&quot;PASSWORD&quot;,&quot;ADDRESS&quot;,&quot;PHONE_NUMBER&quot;,&quot;ROLE&quot;) VALUES (:USER_ID,:USERNAME,:FNAME,:SURNAME,:EMAIL,:PASSWORD,:ADDRESS,:PHONE_NUMBER,:ROLE)"
            UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USERNAME&quot;=:USERNAME,&quot;FNAME&quot;=:FNAME,&quot;SURNAME&quot;=:SURNAME,&quot;EMAIL&quot;=:EMAIL,&quot;PASSWORD&quot;=:PASSWORD,&quot;ADDRESS&quot;=:ADDRESS,&quot;PHONE_NUMBER&quot;=:PHONE_NUMBER,&quot;ROLE&quot;=:ROLE WHERE &quot;USER_ID&quot;=:USER_ID"
            DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot;=:USER_ID">
            <DeleteParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USER_ID"      Type="Decimal" />
                <asp:Parameter Name="USERNAME"     Type="String" />
                <asp:Parameter Name="FNAME"        Type="String" />
                <asp:Parameter Name="SURNAME"      Type="String" />
                <asp:Parameter Name="EMAIL"        Type="String" />
                <asp:Parameter Name="PASSWORD"     Type="String" />
                <asp:Parameter Name="ADDRESS"      Type="String" />
                <asp:Parameter Name="PHONE_NUMBER" Type="String" />
                <asp:Parameter Name="ROLE"         Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USERNAME"     Type="String" />
                <asp:Parameter Name="FNAME"        Type="String" />
                <asp:Parameter Name="SURNAME"      Type="String" />
                <asp:Parameter Name="EMAIL"        Type="String" />
                <asp:Parameter Name="PASSWORD"     Type="String" />
                <asp:Parameter Name="ADDRESS"      Type="String" />
                <asp:Parameter Name="PHONE_NUMBER" Type="String" />
                <asp:Parameter Name="ROLE"         Type="String" />
                <asp:Parameter Name="USER_ID"      Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <!-- DETAILS VIEW — Add new user form -->
    <div class="form-wrap">
        <p class="user-title">Add New User</p>
        <asp:DetailsView ID="DetailsView1" runat="server"
            AutoGenerateRows="False"
            DataKeyNames="USER_ID"
            DataSourceID="SqlDataSource3"
            DefaultMode="Insert"
            Width="100%"
            CellPadding="4"
            Font-Size="Small"
            BorderColor="#CCCCCC"
            BorderWidth="1px">
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#1A5FA8" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="USER_ID"      HeaderText="User ID"      ReadOnly="True" />
                <asp:BoundField DataField="USERNAME"     HeaderText="Username" />
                <asp:BoundField DataField="FNAME"        HeaderText="First Name" />
                <asp:BoundField DataField="SURNAME"      HeaderText="Last Name" />
                <asp:BoundField DataField="EMAIL"        HeaderText="Email" />
                <asp:BoundField DataField="PASSWORD"     HeaderText="Password" />
                <asp:BoundField DataField="ADDRESS"      HeaderText="Address" />
                <asp:BoundField DataField="PHONE_NUMBER" HeaderText="Phone Number" />
                <asp:BoundField DataField="ROLE"         HeaderText="Role" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>

</main>
</asp:Content>