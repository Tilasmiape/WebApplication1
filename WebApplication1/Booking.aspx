<%@ Page Title="Booking Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="WebApplication1.Booking" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .bk-title { font-size: 1.1rem; font-weight: 700; color: #0E2540; margin-bottom: 14px; }
    .grid-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; }
    .form-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); max-width: 500px; }
    table      { font-size: 0.82rem !important; }
    th, td     { font-size: 0.82rem !important; padding: 6px 10px !important; }
    input[type=text] { font-size: 0.82rem !important; padding: 4px 8px !important; }
    .btn, input[type=submit], input[type=button] { font-size: 0.8rem !important; }
</style>

<main style="padding: 10px 0;">


    <div class="grid-wrap">
        <p class="bk-title"> Bookings List</p>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="BOOKING_ID"
            DataSourceID="SqlDataSource1"
            CellPadding="4"
            ForeColor="#333333"
            GridLines="None"
            Width="100%">
            <AlternatingRowStyle BackColor="#F5F8FF" />
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" Font-Size="Small" />
            <RowStyle BackColor="#FAFCFF" Font-Size="Small" />
            <Columns>
                <asp:BoundField DataField="BOOKING_ID"       HeaderText="Booking ID"   ReadOnly="True" />
                <asp:BoundField DataField="USER_ID"          HeaderText="User ID" />
                <asp:BoundField DataField="SHOW_SCHEDULE_ID" HeaderText="Show Schedule ID" />
                <asp:BoundField DataField="BOOK_TIME"        HeaderText="Booked At" />
                <asp:BoundField DataField="STATUS"           HeaderText="Status" />
                <asp:BoundField DataField="SEAT_NUMBER"      HeaderText="Seat Number" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT * FROM &quot;BOOKING&quot;"
            InsertCommand="INSERT INTO &quot;BOOKING&quot; (&quot;BOOKING_ID&quot;,&quot;USER_ID&quot;,&quot;SHOW_SCHEDULE_ID&quot;,&quot;BOOK_TIME&quot;,&quot;STATUS&quot;,&quot;SEAT_NUMBER&quot;) VALUES (:BOOKING_ID,:USER_ID,:SHOW_SCHEDULE_ID,:BOOK_TIME,:STATUS,:SEAT_NUMBER)"
            UpdateCommand="UPDATE &quot;BOOKING&quot; SET &quot;USER_ID&quot;=:USER_ID,&quot;SHOW_SCHEDULE_ID&quot;=:SHOW_SCHEDULE_ID,&quot;BOOK_TIME&quot;=:BOOK_TIME,&quot;STATUS&quot;=:STATUS,&quot;SEAT_NUMBER&quot;=:SEAT_NUMBER WHERE &quot;BOOKING_ID&quot;=:BOOKING_ID"
            DeleteCommand="DELETE FROM &quot;BOOKING&quot; WHERE &quot;BOOKING_ID&quot;=:BOOKING_ID">
            <DeleteParameters>
                <asp:Parameter Name="BOOKING_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BOOKING_ID"       Type="Decimal" />
                <asp:Parameter Name="USER_ID"          Type="Decimal" />
                <asp:Parameter Name="SHOW_SCHEDULE_ID" Type="Decimal" />
                <asp:Parameter Name="BOOK_TIME"        Type="DateTime" />
                <asp:Parameter Name="STATUS"           Type="String" />
                <asp:Parameter Name="SEAT_NUMBER"      Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USER_ID"          Type="Decimal" />
                <asp:Parameter Name="SHOW_SCHEDULE_ID" Type="Decimal" />
                <asp:Parameter Name="BOOK_TIME"        Type="DateTime" />
                <asp:Parameter Name="STATUS"           Type="String" />
                <asp:Parameter Name="SEAT_NUMBER"      Type="String" />
                <asp:Parameter Name="BOOKING_ID"       Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

   
    <div class="form-wrap">
        <p class="bk-title"> Add New Booking</p>
        <asp:DetailsView ID="DetailsView1" runat="server"
            AutoGenerateRows="False"
            DataKeyNames="BOOKING_ID"
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
                <asp:BoundField DataField="BOOKING_ID"       HeaderText="Booking ID"      ReadOnly="True" />
                <asp:BoundField DataField="USER_ID"          HeaderText="User ID" />
                <asp:BoundField DataField="SHOW_SCHEDULE_ID" HeaderText="Show Schedule ID" />
                <asp:BoundField DataField="BOOK_TIME"        HeaderText="Booked At" />
                <asp:BoundField DataField="STATUS"           HeaderText="Status" />
                <asp:BoundField DataField="SEAT_NUMBER"      HeaderText="Seat Number" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>

</main>
</asp:Content>