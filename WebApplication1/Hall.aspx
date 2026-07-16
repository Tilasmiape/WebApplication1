<%@ Page Title="Hall Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hall.aspx.cs" Inherits="WebApplication1.Hall" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .hl-title { font-size: 1.1rem; font-weight: 700; color: #0E2540; margin-bottom: 14px; }
    .grid-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; }
    .form-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); max-width: 500px; }
    table     { font-size: 0.82rem !important; }
    th, td    { font-size: 0.82rem !important; padding: 6px 10px !important; }
    input[type=text] { font-size: 0.82rem !important; padding: 4px 8px !important; }
    .btn, input[type=submit], input[type=button] { font-size: 0.8rem !important; }
</style>

<main style="padding: 10px 0;">

    <!-- GRIDVIEW — List of all halls -->
    <div class="grid-wrap">
        <p class="hl-title">Halls List</p>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="HALL_ID"
            DataSourceID="SqlDataSource1"
            CellPadding="4"
            ForeColor="#333333"
            GridLines="None"
            Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#F5F8FF" />
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" Font-Size="Small" />
            <RowStyle BackColor="#FAFCFF" Font-Size="Small" />
            <Columns>
                
                <asp:BoundField DataField="HALL_ID"       HeaderText="HALL_ID"           ReadOnly="True" SortExpression="HALL_ID" />
                <asp:BoundField DataField="THEATER_ID"    HeaderText="THEATER_ID" SortExpression="THEATER_ID" />
                <asp:BoundField DataField="HALL"          HeaderText="HALL" SortExpression="HALL" />
                <asp:BoundField DataField="HALL_CAPACITY" HeaderText="HALL_CAPACITY" SortExpression="HALL_CAPACITY" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT * FROM &quot;HALL&quot;"
            InsertCommand="INSERT INTO &quot;HALL&quot; (&quot;HALL_ID&quot;,&quot;THEATER_ID&quot;,&quot;HALL&quot;,&quot;HALL_CAPACITY&quot;) VALUES (:HALL_ID,:THEATER_ID,:HALL,:HALL_CAPACITY)"
            UpdateCommand="UPDATE &quot;HALL&quot; SET &quot;THEATER_ID&quot;=:THEATER_ID,&quot;HALL&quot;=:HALL,&quot;HALL_CAPACITY&quot;=:HALL_CAPACITY WHERE &quot;HALL_ID&quot;=:HALL_ID"
            DeleteCommand="DELETE FROM &quot;HALL&quot; WHERE &quot;HALL_ID&quot;=:HALL_ID">
            <DeleteParameters>
                <asp:Parameter Name="HALL_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="HALL_ID"       Type="Decimal" />
                <asp:Parameter Name="THEATER_ID"    Type="Decimal" />
                <asp:Parameter Name="HALL"          Type="String" />
                <asp:Parameter Name="HALL_CAPACITY" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="THEATER_ID"    Type="Decimal" />
                <asp:Parameter Name="HALL"          Type="String" />
                <asp:Parameter Name="HALL_CAPACITY" Type="Decimal" />
                <asp:Parameter Name="HALL_ID"       Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <!-- DETAILS VIEW — Add new hall -->
    <div class="form-wrap">
        <p class="hl-title">Add New Hall</p>
        <asp:DetailsView ID="DetailsView1" runat="server"
            AutoGenerateRows="False"
            DataKeyNames="HALL_ID"
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
                <asp:BoundField DataField="HALL_ID"       HeaderText="HALL_ID"    ReadOnly="True" SortExpression="HALL_ID" />
                <asp:BoundField DataField="THEATER_ID"    HeaderText="THEATER_ID" SortExpression="THEATER_ID" />
                <asp:BoundField DataField="HALL"          HeaderText="HALL" SortExpression="HALL" />
                <asp:BoundField DataField="HALL_CAPACITY" HeaderText="HALL_CAPACITY" SortExpression="HALL_CAPACITY" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>

</main>
</asp:Content>