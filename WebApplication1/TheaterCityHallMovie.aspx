<%@ Page Title="Movies in Theaters" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TheaterCityHallMovie.aspx.cs" Inherits="WebApplication1.TheaterCityHallMovie" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .tc-title { font-size: 1.1rem; font-weight: 700; color: #0E2540; margin-bottom: 14px; }
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
        <p class="tc-title">Theater City Hall — Movie &amp; Showtime Report</p>
        <label>Select Theater / Hall:</label>
        <asp:DropDownList ID="DropDownList1" runat="server"
            AutoPostBack="True"
            DataSourceID="SqlDataSource2"
            DataTextField="DISPLAY"
            DataValueField="HALL_ID"
            AppendDataBoundItems="True">
            <asp:ListItem Value="0" Text="-- Select a Hall --" />
        </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT HALL.HALL_ID, THEATER.THEATER_NAME || ' ' || THEATER.THEATER_CITY || ' - Hall ' || HALL.HALL AS DISPLAY FROM HALL JOIN THEATER ON HALL.THEATER_ID = THEATER.THEATER_ID ORDER BY THEATER.THEATER_NAME">
        </asp:SqlDataSource>
    </div>

    <!-- GRIDVIEW — Results -->
    <div class="grid-wrap">
        <p class="tc-title"> Movies &amp; Showtimes</p>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="HALL_ID"
            DataSourceID="SqlDataSource1"
            CellPadding="4"

            ForeColor="#333333"
            GridLines="None"
            Width="100%"
            EmptyDataText="Please select a hall to see movies and showtimes.">
            <AlternatingRowStyle BackColor="#F5F8FF" />
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" Font-Size="Small" />
            <RowStyle BackColor="#FAFCFF" Font-Size="Small" />
            <EmptyDataRowStyle ForeColor="#888888" Font-Italic="True" />
            <Columns>
                <asp:BoundField DataField="THEATER_NAME" HeaderText="Theater" />
                <asp:BoundField DataField="THEATER_CITY" HeaderText="City" />
                <asp:BoundField DataField="HALL"         HeaderText="Hall" />
                <asp:BoundField DataField="TITLE"        HeaderText="Movie Title" />
                <asp:BoundField DataField="GENRE"        HeaderText="Genre" />
                <asp:BoundField DataField="SHOW_TIME"    HeaderText="Show Time" />
                <asp:BoundField DataField="SHOW_DATE"    HeaderText="Show Date" />
                <asp:BoundField DataField="TICKET_PRICE" HeaderText="Price (Rs)" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT HALL.HALL_ID, THEATER.THEATER_NAME, THEATER.THEATER_CITY, HALL.HALL, MOVIES.TITLE, MOVIES.GENRE, SHOW_TIME.SHOW_TIME, SHOW_SCHEDULE.SHOW_DATE, SHOW_SCHEDULE.TICKET_PRICE FROM THEATER, HALL, MOVIES, SHOW_SCHEDULE, SHOW_TIME WHERE THEATER.THEATER_ID = HALL.THEATER_ID AND HALL.HALL_ID = SHOW_SCHEDULE.HALL_ID AND MOVIES.MOVIE_ID = SHOW_SCHEDULE.MOVIE_ID AND SHOW_TIME.SHOW_TIME_ID = SHOW_SCHEDULE.SHOW_TIME_ID AND HALL.HALL_ID = :HALL_ID ORDER BY SHOW_SCHEDULE.SHOW_DATE, SHOW_TIME.SHOW_TIME">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="HALL_ID" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</main>
</asp:Content>