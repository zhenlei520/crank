using Microsoft.AspNetCore.Mvc;

namespace hello.Controllers
{
    public class UserController : ControllerBase
    {
        [HttpGet]
        public string GetAsync()
        {
            var user = new {id = 1, name = "tom"};
            return System.Text.Json.JsonSerializer.Serialize(user);
        }

        [HttpPost]
        public string Add(EditUserRequest request)
        {
            return $"add success: userName: {request.Name}";
        }
    }

    public class EditUserRequest
    {
        public int Id { get; set; }

        public string Name { get; set; }
    }
}