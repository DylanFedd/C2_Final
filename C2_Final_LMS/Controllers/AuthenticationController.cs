using C2_Final.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace C2_Final.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly JwtAuthenticationManager jwtAuthenticationManager;
        private readonly C2_FinalContext context;
        public AuthenticationController(JwtAuthenticationManager jwtAuthenticationManager, C2_FinalContext context)
        {
            this.jwtAuthenticationManager = jwtAuthenticationManager;
            this.context = context;
        }

        [AllowAnonymous]
        [HttpPost("Authorize")]
        public IActionResult AuthUser([FromBody] User usr)
        {
            var user = context.Logins.Where(login => login.LoginUsername == usr.username && login.LoginPassword == usr.password).FirstOrDefault();
            if (user == null)
            {
                return Unauthorized();
            }

            var token = jwtAuthenticationManager.Authenticate(user);
            if (token == null)
            {
                return Unauthorized();
            }

            return Ok(token);
        }
    }

    public class User
    {
        public string username { get; set; }
        public string password { get; set; }
    }
}
