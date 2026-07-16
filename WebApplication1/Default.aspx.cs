using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCounts();
                LoadCharts();
            }
        }

        private void LoadCounts()
        {
            try
            {
                var cs = ConfigurationManager.ConnectionStrings["ConnectionString2"];
                if (cs == null) { SetUnavailable(); return; }

                var factory = DbProviderFactories.GetFactory(cs.ProviderName);

                Func<string, int> q = sql =>
                {
                    using (var con = factory.CreateConnection())
                    {
                        con.ConnectionString = cs.ConnectionString;
                        con.Open();
                        using (var cmd = con.CreateCommand())
                        {
                            cmd.CommandText = sql;
                            var r = cmd.ExecuteScalar();
                            return (r == null || r == DBNull.Value) ? 0 : Convert.ToInt32(r);
                        }
                    }
                };

                int theaters = q(@"SELECT COUNT(*) FROM ""THEATER""");
                int movies = q(@"SELECT COUNT(*) FROM ""MOVIES""");
                int bookings = q(@"SELECT COUNT(*) FROM ""BOOKING""");
                int users = q(@"SELECT COUNT(*) FROM ""USERS""");
                int shows = q(@"SELECT COUNT(*) FROM ""SHOW_SCHEDULE""");

                lblTheaters.SetTextOrEmpty(theaters.ToString());
                lblMovies.SetTextOrEmpty(movies.ToString());
                lblBookings.SetTextOrEmpty(bookings.ToString());
                lblUsers.SetTextOrEmpty(users.ToString());
                lblUserCount.SetTextOrEmpty(users.ToString());
                lblMovieCount.SetTextOrEmpty(movies.ToString());
                lblBookingCount.SetTextOrEmpty(bookings.ToString());
                lblShowCount.SetTextOrEmpty(shows.ToString());
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("LoadCounts error: " + ex);
                SetUnavailable();
            }
        }

        private void LoadCharts()
        {
            try
            {
                var cs = ConfigurationManager.ConnectionStrings["ConnectionString2"];
                if (cs == null) return;

                var factory = DbProviderFactories.GetFactory(cs.ProviderName);

                // ── PIE: Booking status breakdown ──────────────
                var pieLabels = new List<string>();
                var pieValues = new List<int>();

                using (var con = factory.CreateConnection())
                {
                    con.ConnectionString = cs.ConnectionString;
                    con.Open();
                    using (var cmd = con.CreateCommand())
                    {
                        cmd.CommandText = @"SELECT UPPER(STATUS), COUNT(*) FROM ""BOOKING"" GROUP BY UPPER(STATUS)";
                        using (var rdr = cmd.ExecuteReader())
                            while (rdr.Read())
                            {
                                pieLabels.Add(rdr.IsDBNull(0) ? "Unknown" : rdr.GetString(0));
                                pieValues.Add(rdr.IsDBNull(1) ? 0 : Convert.ToInt32(rdr.GetValue(1)));
                            }
                    }
                }

                if (pieLabels.Count == 0) { pieLabels.Add("No data"); pieValues.Add(0); }

                // ── BAR: Show schedules per theater ────────────
                var barLabels = new List<string>();
                var barValues = new List<int>();

                using (var con = factory.CreateConnection())
                {
                    con.ConnectionString = cs.ConnectionString;
                    con.Open();
                    using (var cmd = con.CreateCommand())
                    {
                        cmd.CommandText = @"
                            SELECT T.THEATER_NAME, COUNT(S.SHOW_SCHEDULE_ID)
                            FROM ""THEATER"" T
                            LEFT JOIN ""SHOW_SCHEDULE"" S ON S.THEATER_ID = T.THEATER_ID
                            GROUP BY T.THEATER_NAME
                            ORDER BY T.THEATER_NAME";
                        using (var rdr = cmd.ExecuteReader())
                            while (rdr.Read())
                            {
                                barLabels.Add(rdr.IsDBNull(0) ? "Unknown" : rdr.GetString(0));
                                barValues.Add(rdr.IsDBNull(1) ? 0 : Convert.ToInt32(rdr.GetValue(1)));
                            }
                    }
                }

                if (barLabels.Count == 0) { barLabels.Add("No data"); barValues.Add(0); }

                var js = new JavaScriptSerializer();

                string script = $@"
(function() {{
    try {{

        // ── PIE CHART — Booking Status ──────────────────
        var pieCtx = document.getElementById('pieChart');
        if (pieCtx) {{
            new Chart(pieCtx.getContext('2d'), {{
                type: 'pie',
                data: {{
                    labels: {js.Serialize(pieLabels)},
                    datasets: [{{
                        data: {js.Serialize(pieValues)},
                        backgroundColor: ['#1A7A4A','#1A5FA8','#C0392B','#E8B84B','#8A97A8'],
                        borderColor: '#fff',
                        borderWidth: 3
                    }}]
                }},
                options: {{
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {{
                        legend: {{ position: 'bottom', labels: {{ font: {{ size: 12 }} }} }},
                        tooltip: {{
                            callbacks: {{
                                label: function(ctx) {{
                                    var total = ctx.dataset.data.reduce(function(a,b){{return a+b;}},0);
                                    var pct = total > 0 ? Math.round(ctx.raw*100/total) : 0;
                                    return ctx.label + ': ' + ctx.raw + ' (' + pct + '%)';
                                }}
                            }}
                        }}
                    }}
                }}
            }});
        }}

        // ── BAR CHART — Shows per Theater ───────────────
        var barCtx = document.getElementById('barChart');
        if (barCtx) {{
            new Chart(barCtx.getContext('2d'), {{
                type: 'bar',
                data: {{
                    labels: {js.Serialize(barLabels)},
                    datasets: [{{
                        label: 'Show Schedules',
                        data: {js.Serialize(barValues)},
                        backgroundColor: ['#0E2540','#1A5FA8','#C9922A','#1A7A4A','#C0392B'],
                        borderRadius: 8,
                        borderSkipped: false
                    }}]
                }},
                options: {{
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {{
                        legend: {{ display: false }},
                        tooltip: {{
                            callbacks: {{
                                label: function(ctx) {{ return ctx.raw + ' shows'; }}
                            }}
                        }}
                    }},
                    scales: {{
                        y: {{
                            beginAtZero: true,
                            ticks: {{ stepSize: 1, font: {{ size: 11 }} }},
                            grid: {{ color: '#EDF2F8' }}
                        }},
                        x: {{
                            ticks: {{ font: {{ size: 11 }} }},
                            grid: {{ display: false }}
                        }}
                    }}
                }}
            }});
        }}

    }} catch(e) {{ console && console.error('Chart error:', e); }}
}})();
";
                ScriptManager.RegisterStartupScript(this, GetType(), "renderCharts", script, true);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("LoadCharts error: " + ex);
            }
        }

        private void SetUnavailable()
        {
            string x = "—";
            lblTheaters.SetTextOrEmpty(x);
            lblMovies.SetTextOrEmpty(x);
            lblBookings.SetTextOrEmpty(x);
            lblUsers.SetTextOrEmpty(x);
            lblUserCount.SetTextOrEmpty(x);
            lblMovieCount.SetTextOrEmpty(x);
            lblBookingCount.SetTextOrEmpty(x);
            lblShowCount.SetTextOrEmpty(x);
        }
    }

    internal static class LabelExtensions
    {
        public static void SetTextOrEmpty(this Label label, string text)
        {
            if (label == null) return;
            label.Text = text ?? string.Empty;
        }
    }
}