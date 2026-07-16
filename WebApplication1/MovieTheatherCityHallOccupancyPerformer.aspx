<%@ Page Title="Seat Occupancy Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieTheatherCityHallOccupancyPerformer.aspx.cs" Inherits="WebApplication1.MovieTheatherCityHallOccupancyPerformer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .oc-title { font-size: 1.1rem; font-weight: 700; color: #0E2540; margin-bottom: 14px; }
    .grid-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; }
    .filter-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; max-width: 500px; }
    table  { font-size: 0.82rem !important; }
    th, td { font-size: 0.82rem !important; padding: 6px 10px !important; }
    select { font-size: 0.82rem !important; padding: 4px 8px !important; width: 100%; max-width: 400px; }
    label  { font-size: 0.85rem; font-weight: 600; color: #0E2540; display: block; margin-bottom: 6px; }
</style>

<main style="padding: 10px 0;">

    <!-- FILTER -->
    <div class="filter-wrap">
        <p class="oc-title">Movie Seat Occupancy — Top 3 Halls</p>
        <label>Select Movie:</label>
        <asp:DropDownList ID="DropDownList1" runat="server"
            AutoPostBack="True"
            DataSourceID="SqlDataSourceMovies"
            DataTextField="TITLE"
            DataValueField="MOVIE_ID"
            AppendDataBoundItems="True">
            <asp:ListItem Value="" Text="-- Select a Movie --" />
        </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSourceMovies" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT MOVIE_ID, TITLE FROM MOVIES ORDER BY TITLE">
        </asp:SqlDataSource>
    </div>

  
    <div class="grid-wrap">
        <p class="oc-title">Top 3 Halls by Seat Occupancy (Paid Tickets Only)</p>
        <asp:GridView ID="GridView1" runat="server"
            DataSourceID="SqlDataSourceReport"
            AutoGenerateColumns="False"
            CellPadding="4"
            ForeColor="#333333"
            GridLines="None"
            Width="100%"
            EmptyDataText="Please select a movie to see occupancy results.">
            <AlternatingRowStyle BackColor="#F5F8FF" />
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" Font-Size="Small" />
            <RowStyle BackColor="#FAFCFF" Font-Size="Small" />
            <EmptyDataRowStyle ForeColor="#888888" Font-Italic="True" />
            <Columns>
                <asp:BoundField DataField="THEATER_NAME" HeaderText="Theater" />
                <asp:BoundField DataField="THEATER_CITY" HeaderText="City" />
                <asp:BoundField DataField="HALL"         HeaderText="Hall" />
                <asp:BoundField DataField="HALL_CAPACITY" HeaderText="Capacity" />
                <asp:BoundField DataField="PAID_TICKETS" HeaderText="Paid Tickets" />
                <asp:BoundField DataField="OCCUPANCY_PCT" HeaderText="Occupancy (%)" DataFormatString="{0:N2}" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceReport" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT * FROM (
    SELECT t.THEATER_NAME, t.THEATER_CITY, h.HALL, h.HALL_ID, h.HALL_CAPACITY,
           NVL(bc.PAID_TICKETS, 0) AS PAID_TICKETS,
           ROUND(CASE WHEN h.HALL_CAPACITY &gt; 0 
                 THEN (NVL(bc.PAID_TICKETS, 0) * 100) / h.HALL_CAPACITY 
                 ELSE 0 END, 2) AS OCCUPANCY_PCT
    FROM HALL h
    JOIN THEATER t ON t.THEATER_ID = h.THEATER_ID
    LEFT JOIN (
        SELECT s.HALL_ID, COUNT(*) AS PAID_TICKETS
        FROM BOOKING b
        JOIN SHOW_SCHEDULE s ON b.SHOW_SCHEDULE_ID = s.SHOW_SCHEDULE_ID
        WHERE s.MOVIE_ID = :MOVIE_ID
          AND UPPER(b.STATUS) = 'PAID'
        GROUP BY s.HALL_ID
    ) bc ON bc.HALL_ID = h.HALL_ID
    WHERE h.HALL_CAPACITY &gt; 0
      AND NVL(bc.PAID_TICKETS, 0) &gt; 0
    ORDER BY (NVL(bc.PAID_TICKETS, 0) * 1.0) / h.HALL_CAPACITY DESC
) WHERE ROWNUM &lt;= 3">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="MOVIE_ID" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</main>
</asp:Content>