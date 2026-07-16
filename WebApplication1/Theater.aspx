<%@ Page Title="Theater Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Theater.aspx.cs" Inherits="WebApplication1.Theater" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .th-title { font-size: 1.1rem; font-weight: 700; color: #0E2540; margin-bottom: 14px; }
    .grid-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; }
    .form-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); max-width: 500px; }
    table     { font-size: 0.82rem !important; }
    th, td    { font-size: 0.82rem !important; padding: 6px 10px !important; }
    input[type=text] { font-size: 0.82rem !important; padding: 4px 8px !important; }
    .btn, input[type=submit], input[type=button] { font-size: 0.8rem !important; }
</style>

<main style="padding: 10px 0;">

    <!-- GRIDVIEW — List of all theaters -->
    <div class="grid-wrap">
        <p class="th-title"> Theaters List</p>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="THEATER_ID"
            DataSourceID="SqlDataSource1"
            CellPadding="4"
            ForeColor="#333333"
            GridLines="None"
            Width="100%">
            <AlternatingRowStyle BackColor="#F5F8FF" />
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" Font-Size="Small" />
            <RowStyle BackColor="#FAFCFF" Font-Size="Small" />
            <Columns>
                <asp:BoundField DataField="THEATER_ID"   HeaderText="ID"           ReadOnly="True" />
                <asp:BoundField DataField="THEATER_NAME" HeaderText="Theater Name" />
                <asp:BoundField DataField="THEATER_CITY" HeaderText="City" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT * FROM &quot;THEATER&quot;"
            InsertCommand="INSERT INTO &quot;THEATER&quot; (&quot;THEATER_ID&quot;,&quot;THEATER_NAME&quot;,&quot;THEATER_CITY&quot;) VALUES (:THEATER_ID,:THEATER_NAME,:THEATER_CITY)"
            UpdateCommand="UPDATE &quot;THEATER&quot; SET &quot;THEATER_NAME&quot;=:THEATER_NAME,&quot;THEATER_CITY&quot;=:THEATER_CITY WHERE &quot;THEATER_ID&quot;=:THEATER_ID"
            DeleteCommand="DELETE FROM &quot;THEATER&quot; WHERE &quot;THEATER_ID&quot;=:THEATER_ID">
            <DeleteParameters>
                <asp:Parameter Name="THEATER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="THEATER_ID"   Type="Decimal" />
                <asp:Parameter Name="THEATER_NAME" Type="String" />
                <asp:Parameter Name="THEATER_CITY" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="THEATER_NAME" Type="String" />
                <asp:Parameter Name="THEATER_CITY" Type="String" />
                <asp:Parameter Name="THEATER_ID"   Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <!-- DETAILS VIEW — Add new theater -->
    <div class="form-wrap">
        <p class="th-title"> Add New Theater</p>
        <asp:DetailsView ID="DetailsView1" runat="server"
            AutoGenerateRows="False"
            DataKeyNames="THEATER_ID"
            DataSourceID="SqlDataSource1"
            DefaultMode="Insert"
            Width="100%"
            CellPadding="4"
            Font-Size="Small"
            BorderColor="#CCCCCC"
            BorderWidth="1px">
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#1A5FA8" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="THEATER_ID"   HeaderText="Theater ID"   ReadOnly="True" />
                <asp:BoundField DataField="THEATER_NAME" HeaderText="Theater Name" />
                <asp:BoundField DataField="THEATER_CITY" HeaderText="City" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>

</main>
</asp:Content>