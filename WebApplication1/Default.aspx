<%@ Page Title="Home Page"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    :root {
        --navy:#0E2540; --blue:#1A5FA8; --gold:#C9922A;
        --gold2:#E8B84B; --grey:#8A97A8;
        --green:#1A7A4A; --red:#C0392B;
    }
    .kc-hero {
        background: linear-gradient(135deg,#0E2540 0%,#1A3A6A 60%,#0D2040 100%);
        border-radius:14px; padding:28px 32px; margin-bottom:24px;
        display:flex; align-items:center; justify-content:space-between;
        position:relative; overflow:hidden;
    }
    .kc-hero::before {
        content:''; position:absolute; top:-40px; right:-40px;
        width:200px; height:200px; border-radius:50%;
        background:rgba(201,146,42,0.12);
    }
    .kc-hero-text h2 { font-size:1.6rem; font-weight:800; color:#fff; margin:0 0 4px; }
    .kc-hero-text h2 span { color:#E8B84B; }
    .kc-hero-text p  { color:rgba(255,255,255,0.5); font-size:0.85rem; margin:0; }
    .kc-hero-stats   { display:flex; gap:28px; z-index:1; }
    .kc-stat-box     { text-align:center; }
    .kc-stat-box .num { font-size:2rem; font-weight:900; color:#E8B84B; line-height:1; display:block; }
    .kc-stat-box .lbl { color:rgba(255,255,255,0.5); font-size:0.65rem; text-transform:uppercase; letter-spacing:.1em; }
    .kc-cards { display:grid; grid-template-columns:repeat(4,1fr); gap:14px; margin-bottom:24px; }
    .kc-card  {
        background:#fff; border-radius:12px; padding:18px;
        display:flex; align-items:center; gap:12px;
        box-shadow:0 3px 16px rgba(14,37,64,.09);
        transition:transform .15s; text-decoration:none;
    }
    .kc-card:hover { transform:translateY(-3px); }
    .kc-card-icon { width:46px; height:46px; border-radius:10px; display:flex; align-items:center; justify-content:center; font-size:1.1rem; font-weight:700; flex-shrink:0; color:#fff; }
    .ic-navy  { background:#0E2540; }
    .ic-gold  { background:#C9922A; }
    .ic-green { background:#1A7A4A; }
    .ic-red   { background:#C0392B; }
    .kc-card-val  { font-size:1.6rem; font-weight:800; color:#0E2540; line-height:1; }
    .kc-card-key  { font-size:0.7rem; color:#8A97A8; text-transform:uppercase; letter-spacing:.07em; margin-top:2px; }
    .charts-row { display:grid; grid-template-columns:1fr 1fr; gap:18px; margin-bottom:24px; }
    .chart-card { background:#fff; border-radius:12px; padding:18px; box-shadow:0 3px 16px rgba(14,37,64,.09); }
    .chart-title { font-size:0.88rem; font-weight:700; color:#0E2540; margin-bottom:14px; border-left:4px solid #C9922A; padding-left:8px; }
    .chart-box   { position:relative; height:240px; }
    .sec-title { font-size:.95rem; font-weight:700; color:#0E2540; margin:0 0 12px; border-left:4px solid #C9922A; padding-left:8px; }
    .kc-tiles  { display:grid; grid-template-columns:repeat(5,1fr); gap:10px; margin-bottom:24px; }
    .kc-tile   {
        background:#0E2540; border-radius:10px; padding:16px 8px;
        text-align:center; text-decoration:none;
        border:1px solid rgba(255,255,255,.06); transition:all .18s; display:block;
    }
    .kc-tile:hover { background:#1A5FA8; border-color:#C9922A; transform:translateY(-2px); }
    .kc-tile .tl { font-size:0.72rem; color:rgba(255,255,255,.85); font-weight:600; letter-spacing:.04em; display:block; padding:4px 0; }
    .kc-reports { display:grid; grid-template-columns:repeat(3,1fr); gap:12px; margin-bottom:24px; }
    .kc-report  {
        background:#fff; border-radius:10px; padding:18px;
        border-left:5px solid #C9922A;
        box-shadow:0 3px 12px rgba(14,37,64,.08);
        text-decoration:none; transition:all .18s; display:block;
    }
    .kc-report:hover { transform:translateY(-2px); border-left-color:#1A5FA8; }
    .kc-report .rt { font-size:0.85rem; font-weight:700; color:#0E2540; }
    .kc-report .rd { font-size:0.72rem; color:#8A97A8; margin-top:4px; }
    .grid-card { background:#fff; border-radius:12px; overflow:hidden; box-shadow:0 3px 16px rgba(14,37,64,.09); margin-bottom:24px; }
    .grid-hdr  { background:#0E2540; color:#fff; padding:12px 18px; font-weight:700; font-size:0.88rem; display:flex; justify-content:space-between; align-items:center; }
    .grid-hdr a { color:#E8B84B; font-size:0.75rem; text-decoration:none; }
    table { font-size:0.82rem !important; }
    th, td { font-size:0.82rem !important; padding:6px 10px !important; }
</style>

<main style="padding:10px 0;">

    <!-- HERO -->
    <div class="kc-hero">
        <div class="kc-hero-text">
            <h2>Welcome to <span>KumariCinemas</span></h2>
            <p>Cinema Ticketing Management System &nbsp;·&nbsp; CC6001NI &nbsp;·&nbsp; Tilasmi Subedi</p>
        </div>
        <div class="kc-hero-stats">
            <div class="kc-stat-box">
                <span class="num"><asp:Label ID="lblTheaters" runat="server" Text="0" /></span>
                <span class="lbl">Theaters</span>
            </div>
            <div class="kc-stat-box">
                <span class="num"><asp:Label ID="lblMovies" runat="server" Text="0" /></span>
                <span class="lbl">Movies</span>
            </div>
            <div class="kc-stat-box">
                <span class="num"><asp:Label ID="lblBookings" runat="server" Text="0" /></span>
                <span class="lbl">Bookings</span>
            </div>
            <div class="kc-stat-box">
                <span class="num"><asp:Label ID="lblUsers" runat="server" Text="0" /></span>
                <span class="lbl">Users</span>
            </div>
        </div>
    </div>

    <!-- STAT CARDS -->
    <div class="kc-cards">
        <a href="User.aspx" class="kc-card">
            <div class="kc-card-icon ic-navy">USR</div>
            <div>
                <div class="kc-card-val"><asp:Label ID="lblUserCount" runat="server" Text="0" /></div>
                <div class="kc-card-key">Total Users</div>
            </div>
        </a>
        <a href="Movie.aspx" class="kc-card">
            <div class="kc-card-icon ic-gold">MOV</div>
            <div>
                <div class="kc-card-val"><asp:Label ID="lblMovieCount" runat="server" Text="0" /></div>
                <div class="kc-card-key">Movies</div>
            </div>
        </a>
        <a href="Booking.aspx" class="kc-card">
            <div class="kc-card-icon ic-green">BKG</div>
            <div>
                <div class="kc-card-val"><asp:Label ID="lblBookingCount" runat="server" Text="0" /></div>
                <div class="kc-card-key">Total Bookings</div>
            </div>
        </a>
        <a href="Show_Schedule.aspx" class="kc-card">
            <div class="kc-card-icon ic-red">SHW</div>
            <div>
                <div class="kc-card-val"><asp:Label ID="lblShowCount" runat="server" Text="0" /></div>
                <div class="kc-card-key">Show Schedules</div>
            </div>
        </a>
    </div>

    <!-- CHARTS -->
    <div class="charts-row">
        <div class="chart-card">
            <div class="chart-title">Booking Status Breakdown</div>
            <div class="chart-box"><canvas id="pieChart"></canvas></div>
        </div>
        <div class="chart-card">
            <div class="chart-title">Show Schedules per Theater</div>
            <div class="chart-box"><canvas id="barChart"></canvas></div>
        </div>
    </div>

    <!-- QUICK NAV -->
    <p class="sec-title">Quick Navigation</p>
    <div class="kc-tiles">
        <a href="User.aspx"          class="kc-tile"><span class="tl">Users</span></a>
        <a href="Movie.aspx"         class="kc-tile"><span class="tl">Movies</span></a>
        <a href="Theater.aspx"       class="kc-tile"><span class="tl">Theaters</span></a>
        <a href="Hall.aspx"          class="kc-tile"><span class="tl">Halls</span></a>
        <a href="Show_Time.aspx"     class="kc-tile"><span class="tl">Show Times</span></a>
        <a href="Show_Schedule.aspx" class="kc-tile"><span class="tl">Schedules</span></a>
        <a href="Booking.aspx"       class="kc-tile"><span class="tl">Bookings</span></a>
        <a href="User_Booking.aspx"  class="kc-tile"><span class="tl">User Tickets</span></a>
        <a href="TheaterCityHallMovie.aspx"                    class="kc-tile"><span class="tl">Hall Movies</span></a>
        <a href="MovieTheatherCityHallOccupancyPerformer.aspx" class="kc-tile"><span class="tl">Occupancy</span></a>
    </div>

    <!-- REPORTS -->
    <p class="sec-title">Complex Reports</p>
    <div class="kc-reports">
        <a href="User_Booking.aspx" class="kc-report">
            <div class="rt">User Ticket Report</div>
            <div class="rd">Tickets bought by any user in the last 6 months</div>
        </a>
        <a href="TheaterCityHallMovie.aspx" class="kc-report">
            <div class="rt">Theater Hall Movies</div>
            <div class="rd">Movies and showtimes for any theater hall</div>
        </a>
        <a href="MovieTheatherCityHallOccupancyPerformer.aspx" class="kc-report">
            <div class="rt">Seat Occupancy Report</div>
            <div class="rd">Top 3 halls by seat occupancy for any movie</div>
        </a>
    </div>

    <!-- RECENT BOOKINGS -->
    <div class="grid-card">
        <div class="grid-hdr">
            Recent Bookings
            <a href="Booking.aspx">View all</a>
        </div>
        <div style="padding:0 16px 16px;">
            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1"
                CssClass="table table-hover"
                GridLines="None" BorderWidth="0">
                <HeaderStyle BackColor="#0E2540" ForeColor="White" Font-Bold="True" />
                <RowStyle BackColor="#FAFCFF" />
                <AlternatingRowStyle BackColor="#F0F5FB" />
                <Columns>
                    <asp:BoundField DataField="BOOKING_ID"       HeaderText="Booking ID" />
                    <asp:BoundField DataField="USER_ID"          HeaderText="User ID" />
                    <asp:BoundField DataField="SHOW_SCHEDULE_ID" HeaderText="Show ID" />
                    <asp:BoundField DataField="SEAT_NUMBER"      HeaderText="Seat" />
                    <asp:BoundField DataField="STATUS"           HeaderText="Status" />
                    <asp:BoundField DataField="BOOK_TIME"        HeaderText="Booked At" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
                SelectCommand='SELECT BOOKING_ID,USER_ID,SHOW_SCHEDULE_ID,SEAT_NUMBER,STATUS,BOOK_TIME FROM "BOOKING" WHERE ROWNUM &lt;= 10 ORDER BY BOOKING_ID DESC'>
            </asp:SqlDataSource>
        </div>
    </div>

</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>

</asp:Content>