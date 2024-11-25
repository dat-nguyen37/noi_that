using api.Services;
using Microsoft.AspNetCore.SignalR;
using System.Net.Http;
using System.Text;
using System.Text.Json;

public class NotificationService : INotificationService
{
    private readonly IHubContext<NotificationHub> _hubContext; 

    public NotificationService(IHubContext<NotificationHub> hubContext)
    {
        _hubContext = hubContext;
    }

    public async Task<String> SendNotificationAsync(string message)
    {
        // Gửi qua SignalR
        await _hubContext.Clients.All.SendAsync("ReceiveNotification", new
        {
            Message = message,
        });
        return "Notification sent successfully";
    }
}
