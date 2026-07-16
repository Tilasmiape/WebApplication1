<%@ Page Title="Show Schedule" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show_Schedule.aspx.cs" Inherits="WebApplication1.Show_Schedule" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .ss-title { font-size: 1.1rem; font-weight: 700; color: #0E2540; margin-bottom: 14px; }
    .grid-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; }
    .form-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); max-width: 500px; }
    table     { font-size: 0.82rem !important; }
    th, td    { font-size: 0.82rem !important; padding: 6px 10px !important; }
    input[type=text] { font-size: 0.82rem !important; padding: 4px 8px !important; }
    .btn, input[type=submit], input[type=button] { font-size: 0.8rem !important; }
</style>

<main style="padding: 10px 0;">

    <!-- GRIDVIEW — List of all show schedules -->
    <div class="grid-wrap">
        <p class="ss-title">Show Schedule List</p>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="SHOW_SCHEDULE_ID"
            DataSourceID="SqlDataSource1"
            CellPadding="4"
            ForeColor="#333333"
            GridLines="None"
            Width="100%">
            <AlternatingRowStyle BackColor="#F5F8FF" />
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" Font-Size="Small" />
            <RowStyle BackColor="#FAFCFF" Font-Size="Small" />
            <Columns>
                <asp:BoundField DataField="SHOW_SCHEDULE_ID" HeaderText="ID"           ReadOnly="True" />
                <asp:BoundField DataField="MOVIE_ID"         HeaderText="Movie ID" />
                <asp:BoundField DataField="HALL_ID"          HeaderText="Hall ID" />
                <asp:BoundField DataField="THEATER_ID"       HeaderText="Theater ID" />
                <asp:BoundField DataField="SHOW_TIME_ID"     HeaderText="Show Time ID" />
                <asp:BoundField DataField="SHOW_DATE"        HeaderText="Show Date" />
                <asp:BoundField DataField="TICKET_PRICE"     HeaderText="Ticket Price" />
                <asp:BoundField DataField="HOLIDAYFLAG"      HeaderText="Holiday Flag" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT * FROM &quot;SHOW_SCHEDULE&quot;"
            InsertCommand="INSERT INTO &quot;SHOW_SCHEDULE&quot; (&quot;SHOW_SCHEDULE_ID&quot;,&quot;MOVIE_ID&quot;,&quot;HALL_ID&quot;,&quot;SHOW_TIME_ID&quot;,&quot;SHOW_DATE&quot;,&quot;TICKET_PRICE&quot;,&quot;HOLIDAYFLAG&quot;,&quot;THEATER_ID&quot;) VALUES (:SHOW_SCHEDULE_ID,:MOVIE_ID,:HALL_ID,:SHOW_TIME_ID,:SHOW_DATE,:TICKET_PRICE,:HOLIDAYFLAG,:THEATER_ID)"
            UpdateCommand="UPDATE &quot;SHOW_SCHEDULE&quot; SET &quot;MOVIE_ID&quot;=:MOVIE_ID,&quot;HALL_ID&quot;=:HALL_ID,&quot;SHOW_TIME_ID&quot;=:SHOW_TIME_ID,&quot;SHOW_DATE&quot;=:SHOW_DATE,&quot;TICKET_PRICE&quot;=:TICKET_PRICE,&quot;HOLIDAYFLAG&quot;=:HOLIDAYFLAG,&quot;THEATER_ID&quot;=:THEATER_ID WHERE &quot;SHOW_SCHEDULE_ID&quot;=:SHOW_SCHEDULE_ID"
            DeleteCommand="DELETE FROM &quot;SHOW_SCHEDULE&quot; WHERE &quot;SHOW_SCHEDULE_ID&quot;=:SHOW_SCHEDULE_ID">
            <DeleteParameters>
                <asp:Parameter Name="SHOW_SCHEDULE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SHOW_SCHEDULE_ID" Type="Decimal" />
                <asp:Parameter Name="MOVIE_ID"         Type="Decimal" />
                <asp:Parameter Name="HALL_ID"          Type="Decimal" />
                <asp:Parameter Name="SHOW_TIME_ID"     Type="Decimal" />
                <asp:Parameter Name="SHOW_DATE"        Type="DateTime" />
                <asp:Parameter Name="TICKET_PRICE"     Type="Decimal" />
                <asp:Parameter Name="HOLIDAYFLAG"      Type="String" />
                <asp:Parameter Name="THEATER_ID"       Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MOVIE_ID"         Type="Decimal" />
                <asp:Parameter Name="HALL_ID"          Type="Decimal" />
                <asp:Parameter Name="SHOW_TIME_ID"     Type="Decimal" />
                <asp:Parameter Name="SHOW_DATE"        Type="DateTime" />
                <asp:Parameter Name="TICKET_PRICE"     Type="Decimal" />
                <asp:Parameter Name="HOLIDAYFLAG"      Type="String" />
                <asp:Parameter Name="THEATER_ID"       Type="Decimal" />
                <asp:Parameter Name="SHOW_SCHEDULE_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <!-- DETAILS VIEW — Add new show schedule -->
    <div class="form-wrap">
        <p class="ss-title">Add New Show Schedule</p>
        <asp:DetailsView ID="DetailsView1" runat="server"
            AutoGenerateRows="False"
            DataKeyNames="SHOW_SCHEDULE_ID"
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
                <asp:BoundField DataField="SHOW_SCHEDULE_ID" HeaderText="Schedule ID"  ReadOnly="True" />
                <asp:BoundField DataField="MOVIE_ID"         HeaderText="Movie ID" />
                <asp:BoundField DataField="HALL_ID"          HeaderText="Hall ID" />
                <asp:BoundField DataField="THEATER_ID"       HeaderText="Theater ID" />
                <asp:BoundField DataField="SHOW_TIME_ID"     HeaderText="Show Time ID" />
                <asp:BoundField DataField="SHOW_DATE"        HeaderText="Show Date" />
                <asp:BoundField DataField="TICKET_PRICE"     HeaderText="Ticket Price" />
                <asp:BoundField DataField="HOLIDAYFLAG"      HeaderText="Holiday Flag" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>

</main>
</asp:Content>