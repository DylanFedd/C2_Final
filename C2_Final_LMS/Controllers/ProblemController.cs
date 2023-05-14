using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace C2_Final.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProblemController : ControllerBase
    {
        [HttpPost]
        public List<Dictionary<string, string>> solveProblem(List<KeyValuePair<string, string>> input)
        {
            Dictionary<string, string> mainDictionary = new Dictionary<string, string>();
            Dictionary<string, string> secondDictionary = new Dictionary<string, string>();

            foreach (KeyValuePair<string, string> pair in input)
            {
                if (!mainDictionary.ContainsKey(pair.Key))
                {
                    mainDictionary.Add(pair.Key, pair.Value);
                }
                else 
                {
                    if (secondDictionary.ContainsKey(pair.Key))
                    {
                        int i = int.Parse(secondDictionary[pair.Key]);
                        i = i + 1;
                        secondDictionary[pair.Key] = i.ToString();
                    }
                    else
                    {
                        secondDictionary.Add(pair.Key, "2");
                    }
                }
            }

            return new List<Dictionary<string, string>> {secondDictionary, mainDictionary };
        }
    }
}
