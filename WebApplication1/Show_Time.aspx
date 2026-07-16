<%@ Page Title="Show Time Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show_Time.aspx.cs" Inherits="WebApplication1.Show_Time" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .st-title { font-size: 1.1rem; font-weight: 700; color: #0E2540; margin-bottom: 14px; }
    .grid-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; }
    .form-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); max-width: 500px; }
    table     { font-size: 0.82rem !important; }
    th, td    { font-size: 0.82rem !important; padding: 6px 10px !important; }
    input[type=text] { font-size: 0.82rem !important; padding: 4px 8px !important; }
    .btn, input[type=submit], input[type=button] { font-size: 0.8rem !important; }
</style>

<main style="padding: 10px 0;">

    <!-- GRIDVIEW — List of all show times -->
    <div class="grid-wrap">
        <p class="st-title">Show Times List</p>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="SHOW_TIME_ID"
            DataSourceID="SqlDataSource1"
            CellPadding="4"
            ForeColor="#333333"
            GridLines="None"
            Width="100%">
            <AlternatingRowStyle BackColor="#F5F8FF" />
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" Font-Size="Small" />
            <RowStyle BackColor="#FAFCFF" Font-Size="Small" />
            <Columns>
                <asp:BoundField DataField="SHOW_TIME_ID" HeaderText="ID"        ReadOnly="True" />
                <asp:BoundField DataField="SHOW_TIME"    HeaderText="Show Time" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT * FROM &quot;SHOW_TIME&quot;"
            InsertCommand="INSERT INTO &quot;SHOW_TIME&quot; (&quot;SHOW_TIME_ID&quot;,&quot;SHOW_TIME&quot;) VALUES (:SHOW_TIME_ID,:SHOW_TIME)"
            UpdateCommand="UPDATE &quot;SHOW_TIME&quot; SET &quot;SHOW_TIME&quot;=:SHOW_TIME WHERE &quot;SHOW_TIME_ID&quot;=:SHOW_TIME_ID"
            DeleteCommand="DELETE FROM &quot;SHOW_TIME&quot; WHERE &quot;SHOW_TIME_ID&quot;=:SHOW_TIME_ID">
            <DeleteParameters>
                <asp:Parameter Name="SHOW_TIME_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SHOW_TIME_ID" Type="Decimal" />
                <asp:Parameter Name="SHOW_TIME"    Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SHOW_TIME"    Type="String" />
                <asp:Parameter Name="SHOW_TIME_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <!-- DETAILS VIEW — Add new show time -->
    <div class="form-wrap">
        <p class="st-title">Add New Show Time</p>
        <asp:DetailsView ID="DetailsView1" runat="server"
            AutoGenerateRows="False"
            DataKeyNames="SHOW_TIME_ID"
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
                <asp:BoundField DataField="SHOW_TIME_ID" HeaderText="Show Time ID" ReadOnly="True" />
                <asp:BoundField DataField="SHOW_TIME"    HeaderText="Show Time" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>

</main>
</asp:Content>