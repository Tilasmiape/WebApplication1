<%@ Page Title="User Bookings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User_Booking.aspx.cs" Inherits="WebApplication1.User_Booking" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .ub-title { font-size: 1.1rem; font-weight: 700; color: #0E2540; margin-bottom: 14px; }
    .grid-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; }
    .filter-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; max-width: 500px; }
    table     { font-size: 0.82rem !important; }
    th, td    { font-size: 0.82rem !important; padding: 6px 10px !important; }
    select    { font-size: 0.82rem !important; padding: 4px 8px !important; width: 100%; max-width: 400px; }
    label     { font-size: 0.85rem; font-weight: 600; color: #0E2540; display: block; margin-bottom: 6px; }
</style>

<main style="padding: 10px 0;">

    <!-- FILTER -->
    <div class="filter-wrap">
        <p class="ub-title">User Ticket Report — Last 6 Months</p>
        <label>Select User:</label>
        <asp:DropDownList ID="DropDownList1" runat="server"
            AutoPostBack="True"
            DataSourceID="SqlDataSource1"
            DataTextField="USERNAME"
            DataValueField="USER_ID"
            AppendDataBoundItems="True">
            <asp:ListItem Value="0" Text="-- Select a User --" />
        </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT USER_ID, USERNAME FROM USERS ORDER BY USERNAME">
        </asp:SqlDataSource>
    </div>

    <div class="grid-wrap">
        <p class="ub-title"> Booking Details</p>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="USER_ID,BOOKING_ID"
            DataSourceID="SqlDataSource2"
            CellPadding="4"
            ForeColor="#333333"
            GridLines="None"
            Width="100%"
            EmptyDataText="Please select a user to see their bookings.">
            <AlternatingRowStyle BackColor="#F5F8FF" />
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" Font-Size="Small" />
            <RowStyle BackColor="#FAFCFF" Font-Size="Small" />
            <EmptyDataRowStyle ForeColor="#888888" Font-Italic="True" />
            <Columns>
                <asp:BoundField DataField="USER_ID"      HeaderText="User ID"      ReadOnly="True" />
                <asp:BoundField DataField="USERNAME"     HeaderText="Username" />
                <asp:BoundField DataField="FNAME"        HeaderText="First Name" />
                <asp:BoundField DataField="SURNAME"      HeaderText="Last Name" />
                <asp:BoundField DataField="EMAIL"        HeaderText="Email" />
                <asp:BoundField DataField="ADDRESS"      HeaderText="Address" />
                <asp:BoundField DataField="PHONE_NUMBER" HeaderText="Phone" />
                <asp:BoundField DataField="BOOKING_ID"   HeaderText="Booking ID"   ReadOnly="True" />
                <asp:BoundField DataField="SEAT_NUMBER"  HeaderText="Seat" />
                <asp:BoundField DataField="STATUS"       HeaderText="Status" />
                <asp:BoundField DataField="BOOK_TIME"    HeaderText="Booked At" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT U.USER_ID, U.USERNAME, U.FNAME, U.SURNAME, U.EMAIL, U.ADDRESS, U.PHONE_NUMBER, B.BOOKING_ID, B.SEAT_NUMBER, B.STATUS, B.BOOK_TIME FROM USERS U JOIN BOOKING B ON B.USER_ID = U.USER_ID WHERE U.USER_ID = :USER_ID AND B.BOOK_TIME >= ADD_MONTHS(SYSDATE, -6) ORDER BY B.BOOK_TIME DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="USER_ID" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</main>
</asp:Content>