using System;
using System.Data.SqlClient;
using System.Timers;
using System.Web;

/// <summary>
///     Summary description for Global
/// </summary>
public static class Global
{
    public static string Connectionstring =
        "Data Source=cluster-sql1.mgmt.ua.pt; Initial Catalog = deti- youinteract; Integrated Security = SSPI; Persist security info = False; Trusted_Connection=Yes";

    public static SqlConnection Conn = new SqlConnection(Connectionstring);

    private static Timer _aTimer;

   
    
    public static string CurrentCookieLoginValue { get; set; }

    public static string CurrentUser { get; set; }
    public static string CurrentPassword { get; set; }

    public static void StartTimer()
    {
        // Create a timer with a 5 minute interval.
        _aTimer = new Timer(300000);

        // Hook up the Elapsed event for the timer.
        _aTimer.Elapsed += OnTimedEvent;

        // Set the Interval to 5 minutes 
        _aTimer.Interval = 300000;
        _aTimer.AutoReset = false;
        _aTimer.Start();

        // If the timer is declared in a long-running method, use 
        // KeepAlive to prevent garbage collection from occurring 
        // before the method ends. 
        GC.KeepAlive(_aTimer);
    }

    public static void StopTimer()
    {
        if (_aTimer != null) _aTimer.Stop();
    }

    public static void ResetTimer()
    {
        if (_aTimer == null)
        {
            StartTimer();
            return;
        }
        _aTimer.Stop();
        _aTimer.Start();
    }

    private static void OnTimedEvent(object source, ElapsedEventArgs e)
    {
        LogOut();
    }

    public static void LogOut()
    {
        StopTimer();
        CurrentCookieLoginValue = null;
        CurrentUser = null;
        CurrentPassword = null;
    }

    public static bool IsLoggedIn(HttpCookie loginCookie)
    {
        if (loginCookie == null) return false;
        string temp = loginCookie.Value;

        return CurrentCookieLoginValue != null && CurrentCookieLoginValue.Equals(temp);
    }
}